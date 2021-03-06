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
 #include "gdi.h"
 
  

//#define ROW_SIZE 60 // nombre d'octets par ligne vidéo 



 
uint16_t video_buffer[ROW_SIZE*VRES];

//#define SPI_PIXELS ((FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF)

//volatile static uint8_t line_buffer[ROW_SIZE];

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN 
#define _disable_pixel_int() TIMER1_DIER->fld.cc2ie=0
#define _enable_pixel_int() ({TIMER1_SR->fld.cc2if=0;TIMER1_DIER->fld.cc2ie=1;})

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
	// canal 2 utilisé pour démarrer sortie pixels
	*TIMER1_CCR2=VIDEO_DELAY;
	TIMER1_CCMR1_OCM->fld.oc2m=6;
	//TIMER1_CCMR1_OCM->fld.oc2pe=1;
	// activation timer1
	TIMER1_CR1->fld.cen=1;
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
	SPI2->DR=0;
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
	_enable_spi_dma();
	set_int_priority(IRQ_DMA1CH5,1);
	enable_interrupt(IRQ_DMA1CH5);
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TV_SYNC,1);
	enable_interrupt(IRQ_TV_SYNC);
	//video test
	gdi_rect(0,0,HRES,VRES,WHITE_BIT);
	gdi_box(80,60,160,120,WHITE_BIT);
	// test end */
 }

//volatile static uint8_t line_buffer[60];


/**************************
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
 __attribute__((optimize("-O1")))  void TV_SYNC_handler(){

	_disable_dma();
	if (video && TIMER1_SR->fld.cc2if){ 
		TIMER1_SR->fld.cc2if=0;
		DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
		DMA1[DMACH5].cndtr=ROW_SIZE;
		_enable_dma();
		return;
	}
	TIMER1_SR->fld.cc1if=0;
	line_count++;
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
	case TOP_LINE:
		_enable_pixel_int();
		video=1;
		break;
	case (TOP_LINE+VRES):
		_disable_pixel_int();
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
	}//switch (line_count)
}


void DMA1CH5_handler(){
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
	while (!(SPI2->SR&SPI_SR_TXE));
	SPI2->DR=0;
}
