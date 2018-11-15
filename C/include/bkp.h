/*
 * Description: backup domain 
 * Auteur: PICATOUT
 * Date: 2018-11-12
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef BKP_H
#define BKP_H

#include "gen_macros.h"

#define BKP_BASE_ADDR 0x40006C00


typedef struct{
	sfr_t res0;
	sfr_t DR[10];
	sfr_t RTCCR;
	sfr_t CR;
	sfr_t CSR;
}bkp_t;

#define BKP ((bkp_t*)BKP_BASE_ADDR)

//champs registre RTCCR
#define BKP_RTCCR_CAL_POS (0) // position du champ
#define BKP_RTCCR_CAL_MASK (0x7f)
#define BKP_RTCCR_CCO BIT7 // calibration clock output
#define BKP_RTCCR_ASOE BIT8 // alarm or second output enable
#define BKP_RTCCR_ASOS BIT9 // alarm or second output selection
// champs du registre CR
#define BKP_CR_TPE BIT0 // tamper pin enable
#define BKP_CR_TPAL BIT1 // tamper pin active level
// champ registre CSR
#define BKP_CSR_CTE BIT0 // clear tamper event
#define BKP_CSR_CTI BIT1 // clear tamper interrupt
#define BKP_CSR_TPIE BIT2 // tamper pin interrupt enable
#define BKP_CSR_TEF BIT8 // tamper event flag
#define BKP_CSR_TIF BIT9 // tamper interrupt flags

#endif // BKP_H
