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
	sfr_t CR1;
	sfr_t CR2;
	sfr_t SR;
	sfr_t DR;
	sfr_t CRCPR;
	sfr_t RXCRCR;
	sfr_t TXCRCR;
} spi_sfr_t;

#define SPI1 ((spi_sfr_t*)SPI1_BASE_ADR)
#define SPI2 ((spi_sfr_t*)SPI2_BASE_ADR)

#define SPI1_DR ((sfr16p_t)(SPI1_BASE_ADR+SPI_DR_OFS))
#define SPI2_DR ((sfr16p_t)(SPI2_BASE_ADR+SPI_DR_OFS))


// champs de bit registre SPI_CR1
#define SPI_CR1_CPHA BIT0 // phase clock
#define SPI_CR1_CPOL BIT1 // polarité clock
#define SPI_CR1_MSTR BIT2 // master/slave
#define SPI_CR1_BR_POS (3) // 3 bits, baud rate  Fpclk/2...Fpclk/256
#define SPI_CR1_BR_MASK (~(7<<3))
#define SPI_CR1_SPE BIT6 // activation
#define SPI_CR1_LSBFIRST BIT7 // quel bit sort en premier
#define SPI_CR1_SSI BIT8 // internal slave select
#define SPI_CR1_SSM BIT9 // software slave management
#define SPI_CR1_RXONLY BIT10 // reçoit seulement
#define SPI_CR1_DDF BIT11 // 1 bit, data 8/16 bits
#define SPI_CR1_CRCNEXT BIT12 // CRC transfert next
#define SPI_CR1_CRCEN BIT13 // activation CRC
#define SPI_CR1_BIDIOE BIT14 // activation E/S bidirectionnel
#define SPI_CR1_BIDIMODE BIT15 // mode bidirectionnel

// champs de bit registre SPI_CR2
#define SPI_CR2_RXDMAEN BIT0 // 1 bit, utilisation DMA sur réception
#define SPI_CR2_TXDMAEN BIT1 // 1 bit, utilisation DMA sur transmission
#define SPI_CR2_SSOE BIT2 // 1 bit, activation sortie slave select
#define SPI_CR2_ERRIE BIT5 // 1 bit, activation interruption sur erreur
#define SPI_CR2_RXNEIE BIT6 // 1 bit, activation interruption sur rx buffer not empty
#define SPI_CR2_TXEIE BIT7 // 1 bit, activation interruption sur tx buffer empty
 
// champs de bit registre SPI_SR
#define SPI_SR_RXNE BIT0 // 1 bit, rx buffer non vide
#define SPI_SR_TXE BIT1 // 1 bit, tx buffer vide
#define SPI_SR_CHSIDE BIT2 // 1 bit, channel side
#define SPI_SR_UDR BIT3 // 1 bit, underrun erreur
#define SPI_SR_CRCERR BIT4 // 1 bit, erreur CRC
#define SPI_SR_MODF BIT5 // 1 bit, mode fault
#define SPI_SR_OVR BIT6 //  1 bit, overrun flag
#define SPI_SR_BSY BIT7 // 1 bit, busy flag


#define SPI_STD_PORT 0
#define SPI_ALT_PORT 1

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
