/*
 * Description:  Unité de calcul CRC
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-11-11
 * Licence: GPLv3
 * revision:
 */

#ifndef CRC_H
#define CRC_H

#include "gen_macros.h"

#define CRC_BASE_ADDR 0x40023000

typedef struct{
	sfr_t DR;   // data register
	sfr_t IDR:8; // independnat data register
	sfr_t res0:24;
	sfr_t CR:1;  // reset DR
	sfr_t res1:31;
}crc_t;

#define CRC ((crc_t*)CRC_BASE_ADDR)


#endif //  CRC_H
