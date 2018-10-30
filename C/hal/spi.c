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
	spi_cr1_t *cr1;
	channel->cr1&=~(7<<SPI_CR1_BR);
	channel->cr1|=baud<<SPI_CR1_BR;
	/*
	switch (channel){
		case SPI1:
		SPI1_CR1->field.br=baud;
		break;
		case SPI2:
		SPI2_CR1->field.br=baud;
		break;
	}
	*/
}


void spi_init(spi_sfr_t* channel, unsigned baud){
	spi_baudrate(channel,baud);
	channel->cr1|=(1<<SPI_CR1_MSTR);
	channel->cr2|=(1<<SPI_CR1_SSOE);
	switch (channel){
	case SPI1:
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(GPIOA,4,OUTPUT_PP_FAST);
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(GPIOA,5,OUTPUT_PP_FAST);
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(GPIOA,6,INPUT_FLOAT);
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(GPIOA,7,OUTPUT_PP_FAST);
		/*
		//configuration SPI
		SPI1_CR1->field.br=baud;
		SPI1.CR1->field.mstr=1;
		SPI1.CR2->field.ssoe=1;
		*/
		break;
	case SPI2:
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(GPIOB,2,OUTPUT_PP_FAST);
		// PB13 SCK output (push-pull)
		config_pin(GPIOB,13,OUTPUT_PP_FAST);
		// PB14 MISO input (floating)
		config_pin(GPIOB,14,INPUT_FLOAT);
		// PB15 MOSI output (push-pull)
		config_pin(GPIOB,15,OUTPUT_PP_FAST);
		/*
		//configuration SPI
		SPI2_CR1->field.br=baud;
		SPI2.CR1->field.mstr=1;
		SPI1.CR2->field.ssoe=1;
		*/
		break;
	}
}

void spi_enable(spi_sfr_t* channel, unsigned mode){
	unsigned mask;
	switch (mode){
		case SPI_MODE_READ:
		mask=(1<<SPI_CR1_RXONLY)|(1<<SPI_CR1_SPE);
		break;
		case SPI_MODE_READ_WRITE:
		mask=(1<<SPI_CR1_SPE);
		break;
		case SPI_MODE_WRITE:
		mask=(1<<SPI_CR1_BIDIMODE)|(1<<SPI_CR1_BIDIOE)|(1<<SPI_CR1_SPE);
		break;
	}
	switch (channel){
		case SPI1:
		SPI1_CR1->cr1&=~mask;
		SPI1_CR1->cr1|=mask;
		break;
		case SPI2:
		SPI2_CR1->cr1&=~mask;
		SPI2_CR1->cr1|=mask;
		break;
	}
}

void spi_disable(spi_sfr_t* channel){
	switch(channel){
		case SPI1:
		SPI1_CR1->field.spe=0;
		break;
		case SPI2:
		SPI2_CR1->field.spe=0;
		break;
	}
}

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
	switch(channel){
		case SPI1:
		*SPI1_DR=b;
		break;
		case SPI2:
		*SPI2_DR=b;
		break;
	}
	spi_disable(channel);
}

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
	switch (channel){
		case SPI1:
		*SPI1_DR=0;
		while (!SPI1_SR->field.rxne);
		rx=(uint8_t*)SPI1_DR;
		break;
		case SPI2:
		*SPI2_DR=0;
		while (!SPI2_SR->field.rxne);
		rx=(uint8_t*)SPI2_DR;
		break;
	}
	spi_disable(channel);
	return rx;
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_sr_t *sr;
	(uint32_t*)dr;
	
	spi_enable(channel,SPI_MODE_WRITE);
	switch (channel){
		case SPI1:
		sr=SPI1_SR;
		dr=SPI1_DR;
		break;
		case SPI2:
		sr=SPI2_SR;
		dr=SPI2_DR;
		break;
	}
	while (count){
		*(uint8_t*)dr=*buffer++;
		while (!sr->field.txe);
		count--;
	}
	spi_disable(channel);
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_sr_t *sr;
	(uint32_t*)dr;
	spi_enable(channel,SPI_MODE_READ);
	switch (channel){
		case SPI1:
		sr=SPI1_SR;
		dr=SPI1_DR;
		break;
		case SPI2:
		sr=SPI2_SR;
		dr=SPI2_DR;
		break;
	}
	while (count){
		*(uint8_t*)dr=0;
		while (!sr->field.rxne);
		*buffer++=*(uint8_t*)dr;
		count--;
	}
	spi_disable(channel);
}




