/*
 * Description: interface carte SD
 * Auteur: PICATOUT
 * Date: 2018-11-20
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef SDIO_H
#define SDIO_H
#include "../include/blue_pill.h"

#define SDIO_SPI  SPI1
#define SDIO_ENR  APB2ENR
#define SDIO_EN_BIT RCC_APB2ENR_SPI11EN
#define SDIO_PORT PORTA
#define SDIO_SS_PIN (4)
#define SDIO_SS_BIT BIT4
#define SDIO_CLK_SLOW FSPI_DIV256
#define SDIO_CLK_FAST FSPI_DIV2

#define _sdcard_slave_select()   SDIO_SPI->CR1|=SPI_CR1_SSI
#define _sdcard_slave_deselect() SDIO_SPI->CR1&=~SPI_CR1_SSI

// commandes carte SD
#define GO_IDLE_STATE 0            // CMD0 - réinitialise carte
#define SEND_OP_COND        1      // CMD1 - requête condition d'opération
#define SEND_IF_COND        8      // CMD8 - requête condition d'interface
#define SEND_CSD            9      // CMD9 - requête pour lecture du registre CSD
#define SEND_CID            10     // CMD10 - requête pour lecture du registre CID    
#define SET_BLOCKLEN        16     // CMD16 - fixe longueur bloc
#define READ_SINGLE_BLOCK   17     // CMD17 - lecture d'un seul bloc
#define WRITE_SINGLE_BLOCK    24   // CMD24 - écriture d'un bloc
#define APP_CMD                55  // CMD55 - commande escape
#define READ_OCR            58     // CMD58 - requête registre ocr
#define CRC_ON_OFF            59   // CMD59 - activation/désactivation CRC
#define SD_STATUS            13    // ACMD13 - requête status
#define SEND_OP_COND        41  // ACMD41 - requête condition d'opération
// certaines commandes requière une valeur pour CRC
#define CMD0_CRC 0x95 
#define CMD8_CRC 0x87
#define CMDX_CRC 0xFF  // autre commandes
    
#define SECTOR_SIZE 512 // nombre d'octets par secteur carte SD.    
 
void sdcard_init();
void sdcard_deselect();

#endif // SDIO_H
