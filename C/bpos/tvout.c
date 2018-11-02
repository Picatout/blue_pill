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
 
 
  
 #ifdef NTSC
 #define HFREQ (15734)
 #define VFREQ (60)
 #define HLINES (525)
 #define HSYNC 4.7e-6 //µsec
 #define FIELD_END (271)
 #define TOP_LINE 30
 #define VRES 240
 #elif defined(PAL)
 #define HFREQ (15625)
 #define VFREQ (50)
 #define HLINES (625)
 #define HSYNC 4.7e-6 //µsec
 #define FIELD_END (321)
 #endif
#define ROW_SIZE 60 // nombre d'octets par ligne vidéo 
// canal DMA
#define DMACHAN 5

static dma_chn_t* dma=DMA1_CHN;
 
uint8_t video_buffer[CHARS_PER_LINE][LINES_PER_SCREEN];

volatile static uint8_t line_buffer[ROW_SIZE];

#define _enable_dma()  dma[DMACHAN].ccr|=DMA_CCR_EN
#define _disable_dma() dma[DMACHAN].ccr&=~DMA_CCR_EN
#define _enable_spi()  SPI2->cr1|=SPI_CR1_SPE;
#define _disable_spi()  SPI2->cr1&=~SPI_CR1_SPE;
 
 void tvout_init(){
	//sortie sync sur PA8
	config_pin(GPIOA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
	//sortie video sur PB15
	config_pin(GPIOB,15,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_50M);
	//timer 1 utilisé pour sync
	APB2ENR->fld.tim1en=1;
	// clock source division
	*TIMER1_PSC=0;
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;
	TIMER1_CCMR1_OCM->fld.oc1pe=1;
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1;
	TIMER1_CCER->fld.cc1p=1;
	TIMER1_BDTR->fld.moe=1;
	// activation timer1
	TIMER1_CR1->fld.cen=1;
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->cr1=(FSPI_9M<<SPI_CR1_BR_POS)|SPI_CR1_MSTR;//|SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE;
	// configuration du canal dma
	dma[DMACHAN].ccr=DMA_CCR_DIR|DMA_CCR_CIRC|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS);
	dma[DMACHAN].cndtr=ROW_SIZE;
	dma[DMACHAN].cmar=(uint32_t)line_buffer;
	dma[DMACHAN].cpar=(uint32_t)SPI2_DR;
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,7);
	enable_interrupt(IRQ_TIM1_CC);
	// video test
	int i;
	for(i=0;i<(CHARS_PER_LINE*LINES_PER_SCREEN);i++){
		*((uint8_t*)video_buffer+i)=(uint8_t)(i%FONT_SIZE+32);
	}
	// test end
 }

volatile static uint8_t line_buffer[60];

void put_bits(int pos, uint8_t bits){
	int bpos,ofs;
	
	bpos=pos>>3;
	ofs=pos&0x7;
	line_buffer[bpos]|=bits>>ofs;
	if ((ofs+CHAR_WIDTH)>8){
		bits<<=ofs;
		bpos++;
		line_buffer[bpos]=bits;
	}
}

/**************************
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
void TIM1_CC_handler(){
	int r,c,fr;
	uint8_t ch;

	//_disable_spi();
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
	case TOP_LINE:
		video=1;
		_enable_spi();
		//_enable_dma();
		break;
	case (TOP_LINE+VRES):
		video=0;
		_disable_spi();
		//_disable_dma();
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
	default: /*
		if (video){
			r=(line_count-TOP_LINE)>>3;
			fr=(line_count-TOP_LINE)&0x7;
			line_buffer[0]=0;
			for (c=0;c<32;c++){
				ch=video_buffer[r][c];
				ch=font6x8[ch][fr];
				put_bits(c*CHAR_WIDTH,ch);
			}
			_enable_dma();
			_enable_spi();
		};*/
		if (video){
			while (*TIMER1_CNT<((FCLK/HFREQ-1)/4));
			_enable_spi();
			SPI2->dr=255;
			while (*TIMER1_CNT<((FCLK/HFREQ-1)/2));
			//while (!(SPI2->sr&SPI_SR_TXE));
			_disable_spi();
		}
	}//switch (line_count)
}

