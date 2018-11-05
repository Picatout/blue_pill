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

/*********************************************
 *  flash programming/erasing controller
 ********************************************/
 
#define FLASH_REGS_BASE 0x40022000
#define FLASH_ACR_ADR (FLASH_REGS_BASE) // flash access control
#define FLASH_KEYR_ADR (FLASH_REGS_BASE+4) // unlock key
#define FLASH_OPTKEYR_ADR (FLASH_REGS_BASE+8)  // unlock option key
#define FLASH_SR_ADR (FLASH_REGS_BASE+12) // status register
#define FLASH_CR_ADR (FLASH_REGS_BASE+16) // control register
#define FLASH_AR_ADR (FLASH_REGS_BASE+20) // adress
#define FLASH_OBR_ADR (FLASH_REGS_BASE+28)
#define FLASH_WRPR_ADR (FLASH_REGS_BASE+32) 
 
// interface de programmation mémoire flash 
typedef struct{
	sfr_t ACR;
	sfr_t KEYR;
	sfr_t OPTKEYR;
	sfr_t SR;
	sfr_t CR;
	sfr_t AR;
	sfr_t RES0;
	sfr_t OBR;
	sfr_t WRPR;
} flash_t;

#define FLASH ((flash_t*)FLASH_REGS_BASE)

// FLASH_ACR bits fields
#define FLASH_ACR_LATENCY_POS (0)
#define FLASH_ACR_LATENCY_MASK (~7UL)
#define WAIT_0_CY 0
#define WAIT_1_CY 1
#define WAIT_2_CY 2  
#define FLASH_ACR_HLFCYA (1<<3)
#define FLASH_ACR_PRFTBE (1<<4)
#define FLASH_ACR_PRFTBS (1<<5)
// FLASH_CR bits fields
#define FLASH_CR_PG (1<<0)
#define FLASH_CR_PER (1<<1)
#define FLASH_CR_MER (1<<2)
#define FLASH_CR_OPTPG (1<<4)
#define FLASH_CR_OPTER (1<<5)
#define FLASH_CR_STRT (1<<6)
#define FLASH_CR_LOCK (1<<7)
#define FLASH_CR_OPTWRE (1<<9)
#define FLASH_CR_ERRIE (1<<10)
#define FLASH_CR_EOPIE (1<<12)
// FLASH_SR bits fields
#define FLASH_SR_BSY (1<<0)
#define FLASH_SR_PGERR (1<<2)
#define FLASH_SR_WRPTRERR (1<<4)
#define FLASH_SR_EOP (1<<5) 
// FLASH_OBR bits fields
#define FLASH_OBR_OPTERR (1<<0)
#define FLASH_ACR_RDPRT (1<<1)
#define FLASH_ACR_WDG_SW (1<<2)
#define FLASH_ACR_nRST_STOP (1<<3)
#define FLASH_ACR_nRST_STBY (1<<4)
#define FLASH_ACR_DATA0_POS (10)
#define FLASH_ACR_DATA0_MASK (~(255<<10))
#define FLASH_ACR_DATA1_POS (18)
#define FLASH_ACR_DATA1_MASK (~(255<<18))

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

#define FLASH_ACR ((flash_acr_t*)FLASH_ACR_ADR)
#define FLASH_KEYR ((sfrp_t)FLASH_KEYR_ADR)
#define FLASH_OPTKEYR ((sfrp_t)FLASH_OPTKEYR_ADR)

typedef union{
	sfr_t sr;
	struct{
		sfr_t bsy:1;
		sfr_t pgerr:1;
		sfr_t res0:1;
		sfr_t wrprterr:1;
		sfr_t eop;
		sfr_t res1:28;
	}fld;
}flash_sr_t;

#define FLASH_SR ((flash_sr_t*)FLASH_SR_ADR)

typedef union{
	sfr_t cr;
	struct{
		sfr_t pg:1;
		sfr_t per:1;
		sfr_t mer:1;
		sfr_t res0:1;
		sfr_t optpg:1;
		sfr_t opter:1;
		sfr_t strt:1;
		sfr_t lock:1;
		sfr_t res1:1;
		sfr_t optwre:1;
		sfr_t errie:1;
		sfr_t res2:1;
		sfr_t eopie:1;
		sfr_t res3:19;
	}fld;
}flash_cr_t;

#define FLASH_CR ((flash_cr_t*)FLASH_CR_ADR)
#define FLASH_AR ((sfrp_t)FLASH_AR_ADR)
 
typedef union{
	sfr_t obr;
	struct{
		sfr_t opterr:1;
		sfr_t rdprt:1;
		sfr_t wdg_sw:1;
		sfr_t nrst_stop:1;
		sfr_t nrst_stdby:1;
		sfr_t notused: 5;
		sfr_t data0:8;
		sfr_t data1:8;
		sfr_t res0:6;
	}fld;
} flash_obr_t;

#define FLASH_OBR ((flash_obr_t*)FLASH_OBR_ADR)
#define FLASH_WRPR ((sfrp_t)FLASH_WRPR_ADR)

 

// activation interface de programmation
//mémoire lash
int flash_enable();

// désactivation interface de programmation
// mémoire flash
void flash_disable();

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès errreur.
int flash_write(unsigned address, uint16_t hword);

// efface une page de 1024 octets
int flash_erase_page(uint32_t address);



#endif //FLASH_H
