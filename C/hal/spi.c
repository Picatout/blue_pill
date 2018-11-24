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

void spi_config_port(spi_sfr_t *channel, int afio_cfg){
	if (channel==SPI1){
		if (!afio_cfg){
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
			// configuration port
			// PA4 -> NSS output (push-pull),  alt PA15
			config_pin(PORTA,4,OUTPUT_PP_FAST);
			// PA5 -> SCK output (push-pull),  alt PB3
			config_pin(PORTA,5,OUTPUT_PP_FAST);
			// PA6 -> MISO input (floating),   alt PB4
			config_pin(PORTA,6,INPUT_FLOAT);
			// PA7 -> MOSI output (push-pull), alt PB5
			config_pin(PORTA,7,OUTPUT_PP_FAST);
		}else{// mappage I/O alternatif
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPBEN+RCC_APB2ENR_IOPAEN+RCC_APB2ENR_AFIOEN;
			AFIO->MAPR|=AFIO_MAPR_SPI1_REMAP;
			// configuration port
			// PA4 -> NSS output (push-pull),  alt PA15
			config_pin(PORTA,15,OUTPUT_PP_FAST);
			// PA5 -> SCK output (push-pull),  alt PB3
			config_pin(PORTB,3,OUTPUT_PP_FAST);
			// PA6 -> MISO input (floating),   alt PB4
			config_pin(PORTB,4,INPUT_FLOAT);
			// PA7 -> MOSI output (push-pull), alt PB5
			config_pin(PORTB,5,OUTPUT_PP_FAST);
		}
	}else{
		// activation clock du port
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
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

void spi_init(spi_sfr_t* channel, unsigned baud,unsigned mode, int afio_cfg){
	spi_config_port(channel,afio_cfg);
	// activation clock SPI
	if (channel==SPI1){
		RCC->APB2ENR|=RCC_APB2ENR_SPI1EN;
	}else{
		RCC->APB1ENR|=RCC_APB1ENR_SPI2EN;
	}
	channel->CR1=mode;
	spi_baudrate(channel,baud);
	_spi_enable(channel);
}


// envoie un octet via le canla SPI
inline void spi_write(spi_sfr_t* channel, uint8_t b){
	uint8_t rx;
	channel->DR=b;
	while (!(channel->SR&SPI_SR_RXNE));
	rx=(uint8_t)channel->DR;
}

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
	uint8_t rx;
	channel->DR=255;
	while (!(channel->SR&SPI_SR_RXNE));
	rx=(uint8_t)channel->DR;
	return rx;
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	uint8_t rx;
	while (count){
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	while (channel->SR&SPI_SR_BSY);
	rx=(uint8_t)channel->DR;
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	while (count){
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
}




