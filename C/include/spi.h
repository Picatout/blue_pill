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
#define FSPI_36M 0
#define FSPI_18M 1
#define FSPI_9M 2
#define FSPI_4500K 3
#define FSPI_2250K 4
#define FSPI_1125K 5
#define FSPI_562K 6
#define FSPI_281K 7

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
#define SPI_I2SCFGR_OFS 28
#define SPI_I2SPR_OFS 32

typedef struct{
	sfr_t cr1;
	sfr_t cr2;
	sfr_t sr;
	sfr_t dr;
	sfr_t crcpr;
	sfr_t rxcrcr;
	sfr_t txcrcr;
	sfr_t i2scfgr;
	sfr_t is2pr;
} spi_sfr_t;

#define SPI1 ((spi_sfr_t*)SPI1_BASE_ADR)
#define SPI2 ((spi_sfr_t*)SPI2_BASE_ADR)

#define SPI1_DR ((sfr16p_t)(SPI1_BASE_ADR+SPI_DR_OFS))
#define SPI2_DR ((sfr16p_t)(SPI2_BASE_ADR+SPI_DR_OFS))

typedef union{
	sfr_t cr1;
	struct{
		sfr_t cpha:1;
		sfr_t cpol:1;
		sfr_t mstr:1;
		sfr_t br:3;
		sfr_t spe:1;
		sfr_t lsbfirst:1;
		sfr_t ssi:1;
		sfr_t ssm:1;
		sfr_t rxonly:1;
		sfr_t ddf:1;
		sfr_t crcnext:1;
		sfr_t crcen:1;
		sfr_t bidioe:1;
		sfr_t bidimode:1;
	}fld;
	
}spi_cr1_t;

// champs de bit registre SPI_CR1
#define SPI_CR1_CPHA 0 // 1 bit phase clock
#define SPI_CR1_CPOL 1 // 1 bit polarité clock
#define SPI_CR1_MSTR 2 // 1 bit, master/slave
#define SPI_CR1_BR 3 // 3 bits, baud rate  Fpclk/2...Fpclk/256
#define SPI_CR1_SPE 6 // 1 bit, activation
#define SPI_CR1_LSBFIRST 7 // 1 bit, quel bit sort en premier
#define SPI_CR1_SSI 8 // 1 bit, internal slave select
#define SPI_CR1_SSM 9 // 1 bit, software slave management
#define SPI_CR1_RXONLY 10 // 1 bit, reçoit seulement
#define SPI_CR1_DDF 11 // 1 bit, data 8/16 bits
#define SPI_CR1_CRCNEXT 12 // 1 bit
#define SPI_CR1_CRCEN 13 // activation CRC
#define SPI_CR1_BIDIOE 14 // activation E/S bidirectionnel
#define SPI_CR1_BIDIMODE 15 // mode bidirectionnel

#define SPI1_CR1 ((spi_cr1_t*)(SPI1_BASE_ADR+SPI_CR1_OFS))


typedef union{
		sfr_t cr2;
		struct{
			sfr_t rxdmaen:1;
			sfr_t txdamen:1;
		    sfr_t ssoe:1;
		    sfr_t reserved:2;
		    sfr_t errie:1;
		    sfr_t rxneie:1;
		    sfr_t txeie:1;
		} fld;
}spi_cr2_t;

// champs de bit registre SPI_CR2
#define SPI_CR2_RXDMAEN 0 // 1 bit, utilisation DMA sur réception
#define SPI_CR2_TXDMAEN 1 // 1 bit, utilisation DMA sur transmission
#define SPI_CR2_SSOE 2 // 1 bit, activation sortie slave select
#define SPI_CR2_ERRIE 5 // 1 bit, activation interruption sur erreur
#define SPI_CR2_RXNEIE 6 // 1 bit, activation interruption sur rx buffer not empty
#define SPI_CR2_TXEIE 7 // 1 bit, activation interruption sur tx buffer empty
 
#define SPI2_CR2 ((spi_cr2_t *)(SPI2_BASE_ADR+SPI_CR2_OFS))

 
typedef union{
		sfr_t sr;
		struct{
			sfr_t rxne:1;
			sfr_t txe:1;
			sfr_t chside:1;
			sfr_t udr:1;
			sfr_t crcerr:1;
			sfr_t modf:1;
			sfr_t ovr:1;
			sfr_t bsy:1;
		}fld;
	
}spi_sr_t;
 
// champs de bit registre SPI_SR
#define SPI_SR_RXNE 0 // 1 bit, rx buffer non vide
#define SPI_SR_TXE 1 // 1 bit, tx buffer vide
#define SPI_SR_CHSIDE 2 // 1 bit, channel side
#define SPI_SR_UDR 3 // 1 bit, underrun erreur
#define SPI_SR_CRCERR 4 // 1 bit, erreur CRC
#define SPI_SR_MODF 5 // 1 bit, mode fault
#define SPI_SR_OVR 6 //  1 bit, overrun flag
#define SPI_SR_BSY 7 // 1 bit, busy flag

#define SPI1_SR ((spi_sr_t*)(SPI1_BASE_ADR+SPI_SR_OFS))
#define SPI2_SR ((spi_sr_t*)(SPI2_BASE_ADR+SPI_SR_OFS))
 
typedef union{
		sfr_t cfgr;
		struct{
			sfr_t chlen:1;
			sfr_t datlen:1;
			sfr_t ckpol:1;
			sfr_t i2sstd:2;
			sfr_t reserved0:1;
			sfr_t pcmsync:1;
			sfr_t i2scfg:2;
			sfr_t i2se:1;
			sfr_t i2smod:1;
		}fld; 
} spi_i2scfgr_t ;

// champs de bits du registre SPI_I2SCFGR
#define SPI_I2SCFGR_CHLEN 0 // 1 bit, channel length 16/32 bits
#define SPI_I2SCFGR_DATLEN 1 // 2 bits, data length {16,24,32}
#define SPI_I2SCFGR_CKPOL  3 // 1 bit, clock polarité
#define SPI_I2SCFGR_I2SSTD 4 // 2 bit, standard {Phillips,LSB,MSP,PCM}
#define SPI_I2SCFGR_PCMSYNC 7 // 1 bit, synchronisation PCM
#define SPI_I2SCFGR_I2SCFG 8 // 2 bits, mode I2S
#define SPI_I2SCFGR_I2SE 10 // 1 bit, activation I2S
#define SPI_I2SCFGR_MODE 11 // 1 bit, sélection mode SPI/I2S 

#define SPI1_I2SCFGR ((spi_i2scfgr_t *)(SPI1_BASE_ADR+SPI_SR_OFS))
#define SPI2_I2SCFGR ((spi_i2scfgr_t *)(SPI2_BASE_ADR+SPI_SR_OFS))

typedef union{
	sfr_t  i2spr;
	struct{
		sfr_t i2sdiv:8;
		sfr_t odd:1;
		sfr_t mckoe:1;
	}fld;
}spi_i2spr_t;

// champ de bits du registre SPI_I2SPR
#define SPI_I2SPR_I2SDIV 0 // 8 bits, diviseur signal clock > (2
#define SPI_I2SPR_ODD 8 // 1 bit,  diviseur impaire I2SDIV*2+1
#define SPI_I2SPR_MCKOE 9 // 1 bit, activation sortie master clock

#define SPI1_I2SPR ((spi_i2spr_t*)(SPI1_BASE_ADR+SPI_I2SPR_OFS))
#define SPI2_I2SPR ((spi_i2spr_t*)(SPI2_BASE_ADR+SPI_I2SPR_OFS))


void spi_baudrate(spi_sfr_t* channel, unsigned baud);
void spi_init(spi_sfr_t* channel, unsigned baud);

#define SPI_MODE_READ 0
#define SPI_MODE_WRITE 1
#define SPI_MODE_READ_WRITE 2
void spi_enable(spi_sfr_t* channel, unsigned mode);
void spi_disable(spi_sfr_t* channel);
// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b);
// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel);
// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count);
// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count);


#endif // SPI_H
