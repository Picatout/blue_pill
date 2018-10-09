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

#include "blue_pill.h"
#include "stm32f103c8.h"
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
#define SPI1_CR1 _sfr(SPI1_BASE_ADR)
#define SPI1_CR2 _sfr(SPI1_BASE_ADR+4)
#define SPI1_SR _sfr(SPI1_BASE_ADR+8)
#define SPI1_DR _sfr(SPI1_BASE_ADR+12)
#define SPI1_CRCPR _sfr(SPI1_BASE_ADR+16)
#define SPI1_RXCRCR _sfr(SPI1_BASE_ADR+20)
#define SPI1_TXCRCR _sfr(SPI1_BASE_ADR+24)
#define SPI1_I2SCFGR _sfr(SPI1_BASE_ADR+28)
#define SPI1_I2SPR _sfr(SPI1_BASE_ADR+32)

#define SPI2_BASE_ADR 0X40003800
#define SPI2_CR1 _sfr(SPI2_BASE_ADR)
#define SPI2_CR2 _sfr(SPI2_BASE_ADR+4)
#define SPI2_SR _sfr(SPI2_BASE_ADR+8)
#define SPI2_DR _sfr(SPI2_BASE_ADR+12)
#define SPI2_CRCPR _sfr(SPI2_BASE_ADR+16)
#define SPI2_RXCRCR _sfr(SPI2_BASE_ADR+20)
#define SPI2_TXCRCR _sfr(SPI2_BASE_ADR+24)
#define SPI2_I2SCFGR _sfr(SPI2_BASE_ADR+28)
#define SPI2_I2SPR _sfr(SPI2_BASE_ADR+32)

// canaux spi
#define SPI1 SPI1_BASE_ADR
#define SPI2 SPI2_BASE_ADR
// offset des registres SPI
#define SPI_CR1_OFS 0
#define SPI_CR2_OFS 4
#define SPI_SR_OFS 8
#define SPI_DR_OFS 12
#define SPI_CRCPR_OFS 16
#define SPI_RXCRCR_OFS 20
#define SPI_TXCRCR_OFS 24
#define SPI_I2SCFGR_OFS 28
#define SPI_I2XPR_OFS 32


typedef union{
	uint32_t cr1;
	struct{
		uint32_t cpha:1;
		uint32_t cpol:1;
		uint32_t mstr:1
		uint32_t br:3;
		uint32_t spe:1
		uint32_t lsbfirst:1;
		uint32_t ssi:1;
		uint32_t ssm:1;
		uint32_t rxonly:1;
		uint32_t ddf:1;
		uint32_t crcnext:1;
		uint32_t crcen:1;
		uint32_t bidioe:1;
		uint32_t bidimode:1;
	}
	
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
#define SPI1_CR1_RXONLY 10 // 1 bit, reçoit seulement
#define SPI_CR1_DDF 11 // 1 bit, data 8/16 bits
#define SPI_CR1_CRCNEXT 12 // 1 bit
#define SPI_CR1_CRCEN 13 // activation CRC
#define SPI_CR1_BIDIOE 14 // activation E/S bidirectionnel
#define SPI_CR1_BIDIMODE 15 // mode bidirectionnel

typedef union{
		uint32_t cr2;
		struct{
			uint32_t rxdmaen:1;
			uint32_t txdamen:1;
		    uint32_t ssoe:1;
		    uint32_t reserved:2;
		    uint32_t errie:1;
		    uint32_t rxneie:1;
		    uint32_t txeie:1;
		}
}spi_cr2_t;

// champs de bit registre SPI_CR2
#define SPI_CR2_RXDMAEN 0 // 1 bit, utilisation DMA sur réception
#define SPI_CR2_TXDMAEN 1 // 1 bit, utilisation DMA sur transmission
#define SPI_CR2_SSOE 2 // 1 bit, activation sortie slave select
#define SPI_CR2_ERRIE 5 // 1 bit, activation interruption sur erreur
#define SPI_CR2_RXNEIE 6 // 1 bit, activation interruption sur rx buffer not empty
#define SPI_CR2_TXEIE 7 // 1 bit, activation interruption sur tx buffer empty
 
typedef union{
		uint32_t sr;
		struct{
			uint32_t rxne:1;
			uint32_t txe:1;
			uint32_t chside:1;
			uint32_t udr:1;
			uint32_t crcerr:1;
			uint32_t modf:1;
			uint32_t ovr:1;
			uint32_t bsy:1;
		}
	
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

// champs de bits du registre SPI_I2SCFGR
#define SPI_I2SCFGR_CHLEN 0 // 1 bit, channel length 16/32 bits
#define SPI_I2SCFGR_DATLEN 1 // 2 bits, data length {16,24,32}
#define SPI_I2SCFGR_CKPOL  3 // 1 bit, clock polarité
#define SPI_I2SCFGR_I2SSTD 4 // 2 bit, standard {Phillips,LSB,MSP,PCM}
#define SPI_I2SCFGR_PCMSYNC 7 // 1 bit, synchronisation PCM
#define SPI_I2SCFGR_I2SCFG 8 // 2 bits, mode I2S
#define SPI_I2SCFGR_I2SE 10 // 1 bit, activation I2S
#define SPI_I2SCFGR_MODE 11 // 1 bit, sélection mode SPI/I2S 

// champ de bits du registre SPI_I2SPR
#define SPI_I2SPR_I2SDIV 0 // 8 bits, diviseur signal clock >=2
#define SPI_I2SPR_ODD 8 // 1 bit,  diviseur impaire I2SDIV*2+1
#define SPI_I2SPR_MCKOE 9 // 1 bit, activation sortie master clock

#endif // SPI_H
