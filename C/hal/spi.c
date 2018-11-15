/*
 * Description: interface bas niveau périphériques SPI
 * Auteur: PICATOUT
 * Date: 2018-09-21
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
	channel->CR1&=SPI_CR1_BR_MASK;
	channel->CR1|=baud<<SPI_CR1_BR_POS;
}


void spi_init(spi_sfr_t* channel, unsigned baud){
	spi_baudrate(channel,baud);
	channel->CR1=SPI_CR1_MSTR|SPI_CR1_SSM;
	//channel->CR2|=SPI_CR2_SSOE;
	if (channel==SPI1){
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(PORTA,4,OUTPUT_PP_FAST);
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(PORTA,5,OUTPUT_PP_FAST);
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(PORTA,6,INPUT_FLOAT);
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(PORTA,7,OUTPUT_PP_FAST);
	}else{
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(PORTB,2,OUTPUT_PP_FAST);
		// PB13 SCK output (push-pull)
		config_pin(PORTB,13,OUTPUT_PP_FAST);
		// PB14 MISO input (floating)
		config_pin(PORTB,14,INPUT_FLOAT);
		// PB15 MOSI output (push-pull)
		config_pin(PORTB,15,OUTPUT_PP_FAST);
	}
}

void spi_enable(spi_sfr_t* channel, unsigned mode){
	switch (mode){
		case SPI_MODE_READ:
		channel->CR1=SPI_CR1_RXONLY|SPI_CR1_SPE;
		break;
		case SPI_MODE_READ_WRITE:
		channel->CR1=SPI_CR1_SPE;
		break;
		case SPI_MODE_WRITE:
		channel->CR1=SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE|SPI_CR1_SPE;
		break;
	}
}

void spi_disable(spi_sfr_t* channel){
	channel->CR1&=~SPI_CR1_SPE;
}

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
	channel->DR=b;
	spi_disable(channel);
}

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
	channel->DR=255;
	while (!(channel->SR&SPI_SR_RXNE));
	rx=(uint8_t)channel->DR;
	spi_disable(channel);
	return rx;
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_enable(channel,SPI_MODE_WRITE);
	while (count){
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	spi_disable(channel);
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_enable(channel,SPI_MODE_READ);
	while (count){
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
	spi_disable(channel);
}




