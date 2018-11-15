/*
 * Description:  power management interface registers
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-10-24
 * Licence: GPLv3
 * revision:
 */

#ifndef POWER_H
#define POWER_H

#include "gen_macros.h"

//  gestion de la consommation électrique
// adresse de base registres PWR_
#define PWR_BASE_ADR 0x40007000
typedef struct{
	sfr_t CR;
	sfr_t CSR;
}pwr_t;

#define PWR ((pwr_t*)PWR_BASE_ADR);

//champs du registe PWR_CR (power control register)
#define PWR_CR_LPDS BIT0 // lower deep sleep
#define PWR_CR_PPDS BIT1 // power down deep sleep
#define PWR_CR_CWUF BIT2 // clear wake up flag
#define PWR_CR_CSBF BIT3 // clear standby flag
#define PWR_CR_PVDE BIT4 // power voltage dectector enable
#define PWR_CR_PLS_POS  (5) // 3 bits, PVD level selection
#define PWR_CR_PLS_MASK (~(7<<5))
#define PWR_CR_DBP  BIT8 // disable backup domain protection
// valeurs pour PLS
#define PWR_CR_PLS_22 0  // 2.2 volt
#define PWR_CR_PLS_23 1  // 2.3 volt
#define PWR_CR_PLS_24 2  // 2.4 volt
#define PWR_CR_PLS_25 3  // 2.5 volt
#define PWR_CR_PLS_26 4  // 2.6 volt
#define PWR_CR_PLS_27 5  // 2.7 volt
#define PWR_CR_PLS_28 6  // 2.8 volt
#define PWR_CR_PLS_29 7  // 2.9 volt
//champs du registre PWR_CSR (power control/status register)
#define PWR_CR_CSR_WUF BIT0 //wakeup flag
#define PWR_CR_CSR_SBF BIT1 // stanby flag
#define PWR_CR_CSR_PVDO BIT2 // PVD output
#define PWR_CR_CSR_EWUP BIT8 // enable WKUP pin


#endif //POWER_H
