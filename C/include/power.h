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
#define PWR_CR_ADR (PWR_BASE_ADR)
//champ du registe PWR_CR
#define PWR_CR_LPDS (0) // 1 bit, lower deep sleep
#define PWR_CR_PPDS (1) // 1 bit, power down deep sleep
#define PWR_CR_CWUF (2) // 1 bit, clear wake up flag
#define PWR_CR_CSBF (3) //  1 bit, clear standby flag
#define PWR_CR_PVDE (4) // 1 bit, power voltage dectector enable
#define PWR_CR_PLS  (5) // 3 bits, PVD level selection
#define PWR_CR_DBP  (8) // 1 bit, disable backup domain protection

typedef union{
	sfr_t cr;
	struct{
		sfr_t lpds:1; // low power deep sleep
		sfr_t ppds:1; // power down deep sleep
		sfr_t cwuf:1; // clear wake up flag
		sfr_t csbf:1; // clear standby flag
		sfr_t pvde:1; // power voltage detector enable
		sfr_t pls:3; // PVD level selection
		sfr_t dbp:1; // disable backup domain write protection
		sfr_t res0:23;
	}fld;
} pwr_cr_t;

#define PWR_CR ((pwr_cr_t*)PWR_CR_ADR)

// niveaux de détection PVD (2.2 ... 2.9 volts)
#define PLS_22 0
#define PLS_23 1
#define PLS_24 2
#define PLS_25 3
#define PLS_26 4
#define PLS_27 5
#define PLS_28 6
#define PLS_29 7

// régitre d'état 
#define PWR_CSR_ADR (PWR_BASE_ADR+4)
//champs du registres PWR_CSR
#define PWR_CSR_WUF  (0) // 1 bit, wakeup flag
#define PWR_CSR_SBF  (1) // 1 bit, standby flag
#define PWR_CSR_PVDO (2) // 1 bit, PVD output
#define PWR_CSR_EWUP (8) // 1 bit, enable wakeup pin

typedef union{
	sfr_t csr;
	struct{
		sfr_t wuf:1; // wakeup flag
		sfr_t sbf:1; // standby flag
		sfr_t pvdo:1; // pvd output
		sfr_t res0:5;
		sfr_t ewup:1; // enable WKUP pin
		sfr_t res1:23;
	}fld;
}pwr_csr_t;

#define PWR_CSR ((pwr_csr_t*)PWR_CSR_ADR)

#endif //POWER_H
