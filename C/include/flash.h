/*
 * Description:  flash memory interface registers
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-10-24
 * Licence: GPLv3
 * revision:
 */

#ifndef FLASH_H
#define FLASH_H

#include "gen_macros.h"

/*************
 * FLASH_ACR
 ************/
 #define FLASH_REGS_BASE 0x40022000
 #define FLASH_ACR_ADR (FLASH_REGS_BASE) // flash access control
 #define LATENCY 0 // champ delais accès
 #define WAIT_0_CY 0
 #define WAIT_1_CY 1
 #define WAIT_2_CY 2  
 
typedef union{
	sfr_t acr;
	struct{
		sfr_t latency:3; 
		sfr_t hlfcya:1; // flash half-cycle access enable
		sfr_t prftbe:1; // prefetch buffer enable
		sfr_t prftbs:1; // prefetch buffer status
		sfr_t res0:28;
	}fld;
}flash_acr_t;

#define FLASH_KEYR ((sfrp_t)FLASH_KEYR_ADR 0x40022004)

#define FLASH_OPTKEYR_ADR 0x40022008
#define FLASH_OPTKEYR ((sfrp_t)FLASH_OPTKEYR_ADR)

#define FLASH_SR_ADR 0x4002200C
typedef union{
	sfr_t sr;
	struct{
		sfr_t bsy:1;
		sfr_t pgerr:1;
		sfr_t res0:1;
		sfr_t wrprterr:1;
		sfr_t eop;
		sfr_t res1:26;
	}fld;
}flash_sr_t;

#define FLASH_SR ((flash_sr_t*)FLASH_SR_ADR)

#define FLASH_CR_ADR 0x40022010
typedef union{
	sfr_t cr;
	struct{
		sfr_t pg:1;
		sfr_t per:1;
		sfr_t mer:1;
		sfr_t optpg:1;
		sfr_t opter:1;
		sfr_t strt:1;
		sfr_t lock:1;
		sfr_t res0:1;
		sfr_t optwre:1;
		sfr_t errie:1;
		sfr_t res1:1;
		sfr_t eopie:1;
		sfr_t res2:19;
	}fld;
}flash_cr_t;

#define FLASH_CR ((flash_cr_t*)FLASH_CR_ADR)

#define FLASH_AR_ADR (0x40022014)
#define FLASH_AR ((sfrp_t)FLASH_AR_ADR)
 
#define FLASH_OBR_ADR 0x4002201C
typedef union{
	sfr_t obr;
	struct{
		sfr_t opterr:1;
		sfr_t rdprt:1;
		sfr_t wdg_sw:1;
		sfr_t rst_stop:1;
		sfr_t rst_stdby:1;
		sfr_t notused: 5;
		sfr_t data0:8;
		sfr_t data1:8;
		sfr_t res0:6;
	}fld;
} flash_obr_t;

#define FLASH_OBR ((flash_obr_t*)FLASH_OBR_ADR)

#define FLASH_WRPR_ADR 0x40022020
#define FLASH_WRPR ((sfrp_t)FLASH_WRPR_ADR)

 
#define FLASH_ACR ((flash_acr_t*)FLASH_ACR_ADR)

#endif //FLASH_H
