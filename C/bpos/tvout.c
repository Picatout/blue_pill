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
 
#define DMA_CHANNEL 5
 
uint8_t video_buffer[CHARS_PER_LINE][LINES_PER_SCREEN];
volatile static uint8_t line_buffer[60];
 
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
	SPI2->cr1=(FSPI_9M<<SPI_CR1_BR)|(1<<SPI_CR1_MSTR)|(1<<SPI_CR1_BIDIMODE)|(1<<SPI_CR1_BIDIOE);
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

/**************************
 * synchronisation vidéo
 *************************/
volatile static uint8_t line_buffer[60];
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
void TIM1_CC_handler(){
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
		SPI2->cr1|=(1<<SPI_CR1_SPE);
		break;
	case (TOP_LINE+VRES):
		video=0;
		SPI2->cr1&=~(1<<SPI_CR1_SPE);
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
		if (video){
			
		}
	}//switch (line_count)
}

