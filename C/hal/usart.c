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

// configuration dse broches
void usart_config_port(usart_t* channel, gpio_t *port, unsigned flow_ctrl){
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
		}
		break;
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
		}
		break;
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
			port->CR[1]&=~((15<<((USART3_TX_PIN-8)*4))|(15<<((USART3_RTS_PIN-8)*4)));
			port->CR[1]|=(0xA<<((USART3_TX_PIN-8)*4))|(0xA<<((USART3_RTS_PIN-8)*4));
		}else{
			port->CR[1]&=~(15<<((USART3_TX_PIN-8)*4));
			port->CR[1]|=0xA<<((USART3_TX_PIN-8)*4);
		}
		break;
	}
}

// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
		rate=(FAPB2/baud/16)<<4;
		rate|=(FAPB2/baud)%16;
	}else{
		rate=(FAPB1/baud/16)<<4;
		rate|=(FAPB1/baud)%16;
	}
	channel->BRR=rate;
}

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
	channel->CR1&=USART_CR1_DIR_MASK;
	channel->CR1|=direction<<USART_CR1_DIR_POS;
}


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
	case (uint32_t)USART1:
		usart_config_port(channel,USART1_PORT,flow_ctrl);
		set_int_priority(IRQ_USART1,7);
		enable_interrupt(IRQ_USART1);
		break;
	case (uint32_t)USART2:
		usart_config_port(channel,USART2_PORT,flow_ctrl);
		set_int_priority(IRQ_USART2,7);
		enable_interrupt(IRQ_USART2);
		break;
	case (uint32_t)USART3:
		usart_config_port(channel,USART3_PORT,flow_ctrl);
		set_int_priority(IRQ_USART3,7);
		enable_interrupt(IRQ_USART3);
		break;
	}
	if (flow_ctrl==FLOW_HARD){
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
	}
	usart_comm_dir(channel,dir);
	switch (parity){
	case PARITY_NONE:
		channel->CR1|=USART_CR1_RXNEIE;
		break;
	case PARITY_ODD:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS|USART_CR1_RXNEIE;
		break;
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_RXNEIE;
		break;
    }
	usart_set_baud(channel,baud);
    channel->CR1|=USART_CR1_UE;
}

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
	return channel->SR&USART_SR_RXNE;
}

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
	return channel->DR;
}

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
	channel->DR=c;
}


int usart_cts(usart_t* channel){
	int cts;
	switch ((uint32_t)channel){
		case (uint32_t)USART1:
			cts=USART1_PORT->IDR&USART1_CTS_BIT;
			break;
		case (uint32_t)USART2:
			cts=USART2_PORT->IDR&USART2_CTS_BIT;
			break;
		case (uint32_t)USART3:
			cts=USART3_PORT->IDR&USART3_CTS_BIT;
			break;
	}
	return cts;
}
