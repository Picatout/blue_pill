/*
 * Description: interface carte SD
 * Auteur: PICATOUT
 * Date: 2018-11-20
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef SDCARD_H
#define SDCARD_H
#include "../include/blue_pill.h"

#define SDC_SPI  SPI1
#define SDC_ENR  APB2ENR
#define SDC_EN_BIT RCC_APB2ENR_SPI11EN
#define SDC_PORT PORTA
#define SDC_CS_PIN (4)
#define SDC_CS_BIT BIT4
#define SDC_CLK_SLOW FSPI_DIV256
#define SDC_CLK_FAST FSPI_DIV4

#define _sdcard_slave_select()   SDC_SPI->CR1|=SPI_CR1_SSI
#define _sdcard_slave_deselect() SDC_SPI->CR1&=~SPI_CR1_SSI

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
#define APP_SEND_OP_COND     41  // ACMD41 - requête condition d'opération
// certaines commandes requière une valeur pour CRC
#define CMD0_CRC 0x95 
#define CMD8_CRC 0x87
#define CMDX_CRC 0xFF  // autre commandes
    
#define SECTOR_SIZE 512 // nombre d'octets par secteur carte SD.    

// indicateurs booléens carte SD  variable sdc_status
#define F_SDC_IN  BIT0 // carte dans la fente
#define F_SDC_OK BIT1 // carte insérée et initialisée
#define F_SDC_V2 BIT2 // carte version 2
#define F_SDC_HC BIT3 // carte haute capacité  adressée par bloc de 512 octets.
#define F_SDC_TO BIT4 // commande time out
#define F_SDC_WE BIT5 // erreur écriture
#define F_SDC_RE BIT6 // erreur lecture
#define F_SDC_IE BIT7 // erreur initialisation  
#define F_SDC_BAD_CARD BIT8 // la carte n'est pas reconnue.

extern uint16_t sdc_status; // indicateurs booléens carte SD

#define _sdcard_cs_low() SDC_PORT->ODR&=~SDC_CS_BIT 
#define _sdcard_cs_high() SDC_PORT->ODR|=SDC_CS_BIT

int sdcard_init();
int sdcard_select();
void sdcard_deselect();

#endif // SDCARD_H
