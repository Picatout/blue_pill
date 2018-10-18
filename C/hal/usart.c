/*
 * Description: interface bas niveau périphériques USART
 * Auteur: PICATOUT
 * Date: 2018-09-21
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/usart.h"
#include "../include/gpio.h"

#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
	sfrp_t brr;
	uint32_t rate;

    brr=(sfrp_t)(channel+USART_BRR_OFS);		
	switch (channel){
	case USART1:
		rate=(FAPB2/baud/16)<<4;
		rate|=(FAPB2/baud)%16;
		*brr=rate;
		return;
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
		rate|=(FAPB1/baud)%16;
	}
	*brr=rate;
}

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl){
	sfrp_t cr1, cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
	case USART1:
		RCC_APB2ENR|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
		GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
		enable_interrupt(USART1_IRQ);
		break;
	case USART2:
		RCC_APB1ENR|=(1<<RCC_APB1ENR_USART2EN);
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPAEN);
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX (push-pull)
		// PA3 -> RX (floating)
		GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
		GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
		enable_interrupt(USART2_IRQ);
		break;
	case USART3:
		RCC_APB1ENR|=1<<RCC_APB1ENR_USART3EN;
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPBEN);
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
		GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
		enable_interrupt(USART3_IRQ);
		break;
	}
	uart_set_baud(channel,baud);
	if (flow_ctrl==FLOW_HARD){
		cr3=(sfrp_t)(channel+USART_CR3_OFS);
		*cr3=(1<<USART_CR3_CTSE)|(1<<USART_CR3_RTSE);
	}
	cr1=(sfrp_t)(channel+USART_CR1_OFS);
	uart_getc(channel);
	*cr1=(1<<USART_CR1_UE)|(1<<USART_CR1_TE)|(1<<USART_CR1_RE)|(1<<USART_CR1_RXNEIE);
}

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int uart_stat(unsigned channel){
	sfrp_t sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
	return *sr&(1<<USART_SR_RXNE)?-1:0;
}

// reçoit un caractère de la console
char uart_getc(unsigned channel){
	sfrp_t dr;
	
	dr=(sfrp_t)(channel+USART_DR_OFS);
	return *dr&0x7f;
}

// transmet un caractère à la console
void uart_putc(unsigned channel, char c){
	sfrp_t dr, sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
	dr=(sfrp_t)(channel+USART_DR_OFS);
	//attend que dr soit vide
	while (!(*sr&(1<<USART_SR_TXE)));
	*dr=c&0x7f;
}

