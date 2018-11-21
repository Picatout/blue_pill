/*
 * Description: interface bas niveau périphériques SPI
 * Auteur: PICATOUT
 * Date: 2018-09-21
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef SPI_H
#define SPI_H

#include "gen_macros.h"


// baud rate
#define FSPI_DIV2 0
#define FSPI_DIV4 1
#define FSPI_DIV8 2
#define FSPI_DIV16 3
#define FSPI_DIV32 4
#define FSPI_DIV64 5
#define FSPI_DIV128 6
#define FSPI_DIV256 7

#define SPI1_BASE_ADR 0x40013000
#define SPI2_BASE_ADR 0X40003800

// offset des registres SPI
#define SPI_CR1_OFS 0
#define SPI_CR2_OFS 4
#define SPI_SR_OFS 8
#define SPI_DR_OFS 12
#define SPI_CRCPR_OFS 16
#define SPI_RXCRCR_OFS 20
#define SPI_TXCRCR_OFS 24

typedef struct{
	sfr16_t CR1;
	sfr16_t res0;
	sfr16_t CR2;
	sfr16_t res1;
	sfr16_t SR;
	sfr16_t res2;
	sfr16_t DR;
	sfr16_t res3;
	sfr16_t CRCPR;
	sfr16_t res4;
	sfr16_t RXCRCR;
	sfr16_t res5;
	sfr16_t TXCRCR;
	sfr16_t res6;
} spi_sfr_t;

#define SPI1 ((spi_sfr_t*)SPI1_BASE_ADR)
#define SPI2 ((spi_sfr_t*)SPI2_BASE_ADR)

#define SPI1_DR ((sfr16p_t)(SPI1_BASE_ADR+SPI_DR_OFS))
#define SPI2_DR ((sfr16p_t)(SPI2_BASE_ADR+SPI_DR_OFS))


// champs de bit registre SPI_CR1
#define SPI_CR1_CPHA 1 // 1 bit phase clock
#define SPI_CR1_CPOL (1<<1) // 1 bit polarité clock
#define SPI_CR1_MSTR (1<<2) // 1 bit, master/slave
#define SPI_CR1_BR_POS (3) // 3 bits, baud rate  Fpclk/2...Fpclk/256
#define SPI_CR1_BR_MASK (~(7<<8))
#define SPI_CR1_SPE (1<<6) // 1 bit, activation
#define SPI_CR1_LSBFIRST (1<<7) // 1 bit, quel bit sort en premier
#define SPI_CR1_SSI (1<<8) // 1 bit, internal slave select
#define SPI_CR1_SSM (1<<9) // 1 bit, software slave management
#define SPI_CR1_RXONLY (1<<10) // 1 bit, reçoit seulement
#define SPI_CR1_DDF (1<<11) // 1 bit, data 8/16 bits
#define SPI_CR1_CRCNEXT (1<<12) // 1 bit
#define SPI_CR1_CRCEN (1<<13) // activation CRC
#define SPI_CR1_BIDIOE (1<<14) // activation E/S bidirectionnel
#define SPI_CR1_BIDIMODE (1<<15) // mode bidirectionnel

// champs de bit registre SPI_CR2
#define SPI_CR2_RXDMAEN 1 // 1 bit, utilisation DMA sur réception
#define SPI_CR2_TXDMAEN (1<<1) // 1 bit, utilisation DMA sur transmission
#define SPI_CR2_SSOE (1<<2) // 1 bit, activation sortie slave select
#define SPI_CR2_ERRIE (1<<5) // 1 bit, activation interruption sur erreur
#define SPI_CR2_RXNEIE (1<<6) // 1 bit, activation interruption sur rx buffer not empty
#define SPI_CR2_TXEIE (1<<7) // 1 bit, activation interruption sur tx buffer empty
 
// champs de bit registre SPI_SR
#define SPI_SR_RXNE 1 // 1 bit, rx buffer non vide
#define SPI_SR_TXE (1<<1) // 1 bit, tx buffer vide
#define SPI_SR_CHSIDE (1<<2) // 1 bit, channel side
#define SPI_SR_UDR (1<<3) // 1 bit, underrun erreur
#define SPI_SR_CRCERR (1<<4) // 1 bit, erreur CRC
#define SPI_SR_MODF (1<<5) // 1 bit, mode fault
#define SPI_SR_OVR (1<<6) //  1 bit, overrun flag
#define SPI_SR_BSY (1<<7) // 1 bit, busy flag


#define SPI1_STD_PORT 0
#define SPI1_ALT_PORT 1

#define SPI_MODE_READ 0
#define SPI_MODE_WRITE 1
#define SPI_MODE_READ_WRITE 2

#define _spi_slave_select(ch) ch->CR1&=~SPI_CR1_SSI
#define _spi_slave_deselect(ch) ch->CR1|=SPI_CR1_SSI
#define _spi_enable(ch)  ch->CR1|=SPI_CR1_SPE
#define _spi_disable(ch) ch->CR1&=~SPI_CR1_SPE

void spi_baudrate(spi_sfr_t* channel, unsigned baud);
void spi_init(spi_sfr_t* channel, unsigned baud, unsigned mode, int afio_cfg);

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b);
// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel);
// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count);
// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count);


#endif // SPI_H
