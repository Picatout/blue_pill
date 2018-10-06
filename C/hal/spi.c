/*
 * Description: interface bas niveau périphériques SPI
 * Auteur: PICATOUT
 * Date: 2018-09-21
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/spi.h"


void spi_baudrate(unsigned channel, unsigned baud){
	spi_cr1_t *cr1;
	
	cr1=(spi_cr1_t*)(channel+SPI_CR1_OFS);
	cr1->br=baud;
}


void spi_init(unsigned channel, unsigned baud){
	switch (channel){
	case SPI1:
		// configuration port
		// PA4 -> NSS output (push-pull)
		// PA5 -> SCK output (push-pull)
		// PA6 -> MISO input (floating)
		// PA7 -> MOSI output (push-pull)
		
		break;
	case SPI2:
		break;
	}
}
