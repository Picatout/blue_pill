/*
 * Description: générateur NTSC
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-10-25
 * Licence: GPLv3
 * revision:
 */
 
 #include "../include/blue_pill.h"
 #include "tvout.h"
 
 
  

//#define ROW_SIZE 60 // nombre d'octets par ligne vidéo 



 
uint16_t video_buffer[ROW_SIZE*VRES];

#define SPI_PIXELS ((FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF)
#define SPI_CHROMA_SYNC ((FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF)

//volatile static uint8_t line_buffer[ROW_SIZE];

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
	//sortie sync sur PA8
	config_pin(PORTA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
	//sortie video sur PB15, utilisation SPI2
	config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
	PORTB->BRR=BIT15;
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
	// clock source division
	*TIMER1_PSC=0;
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
	TIMER1_CCER->fld.cc1p=1; // output polarity
	TIMER1_BDTR->fld.moe=1;  // main output enable
	// activation timer1
	TIMER1_CR1->fld.cen=1;
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=SPI_PIXELS; //(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
	_enable_spi_dma();
	set_int_priority(IRQ_DMA1CH5,7);
	enable_interrupt(IRQ_DMA1CH5);
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,7);
	enable_interrupt(IRQ_TIM1_CC);
	/* video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	 test end */
 }

//volatile static uint8_t line_buffer[60];


/**************************
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
		break;
	case 17: // fin sync champ paire
		if (even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
		break;
	case (TOP_LINE+VRES):
		video=0;
		break;
	case FIELD_END:
		if (!even){
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
			line_count=-1;
			even=-even;
		}
	    break;
	default: 
/*chroma_sync:	
		SPI2->CR1=SPI_CHROMA_SYNC;
		while (*TIMER1_CNT<300);
		SPI2->DR=0xaaaa;
		while (SPI2->SR&SPI_SR_BSY);
		SPI2->CR1=SPI_PIXELS;
		SPI2->DR=0;
*/	
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			DMA1[DMACH5].cndtr=ROW_SIZE;
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
			_enable_dma();
			/*
			for (i=0;i<(ROW_SIZE);i++){
				while (!(SPI2->SR&SPI_SR_TXE));
				SPI2->DR=line_adr[i];
			}
			while (!(SPI2->SR&SPI_SR_TXE));
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
	while (!(SPI2->SR&SPI_SR_TXE));
	SPI2->DR=0;
}
