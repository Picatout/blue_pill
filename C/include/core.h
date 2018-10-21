/*
 * Description: registres liés directement au CPU cortex-M3.
 * Auteur: PICATOUT
 * Date: 2018-10-20
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef CORE_H
#define CORE_H

#include "gen_macros.h"

/*************************
 * SCB
 * System Control block
 *************************/
#define SCB_BASE_ADR 0xE000ED00 
#define SCB_CPUID_ADR (SCB_BASE_ADR)
#define SCB_ICSR_ADR (SCB_BASE_ADR+4)
#define SCB_VTOR_ADR (SCB_BASE_ADR+8)
#define SCB_AIRCR_ADR (SCB_BASE_ADR+12)
#define SCB_SCR_ADR (SCB_BASE_ADR+16)
#define SCB_CCR_ADR (SCB_BASE_ADR+20)
#define SCB_SHPR1_ADR (SCB_BASE_ADR+24)
#define SCB_SHPR2_ADR (SCB_BASE_ADR+28)
#define SCB_SHPR3_ADR (SCB_BASE_ADR+32)
#define SCB_SHCRS_ADR (SCB_BASE_ADR+36)
#define SCB_CFSR_ADR (SCB_BASE_ADR+40)
#define SCB_HFSR_ADR (SCB_BASE_ADR+44)
#define SCB_MMAR_ADR (SCB_BASE_ADR+0x34)
#define SCB_BFAR_ADR (SCB_BASE_ADR+0x38)
#define SCB_CPACR_ADR (SCB_BASE_ADR+0x8C)
#define SCS_ICTR_ADR (0xE000E004)
#define SCS_ACTLR_ADR (0xE000E008)
#define SCS_STIR_ADR (0xE000F00)
#define SCS_PID4_ADR (0xE000EFD0)
#define SCS_PID5_ADR (0xE000EFD4)
#define SCS_PID6_ADR (0xE000EFD8)
#define SCS_PID7_ADR (0xE000EFDC)
#define SCS_PID0_ADR (0xE000EFE0)
#define SCS_PID1_ADR (0xE000EFE4)
#define SCS_PID2_ADR (0xE000EFE8)
#define SCS_PID3_ADR (0xE000EFEC)
#define SCS_CID0_ADR (0xE000EFF0)
#define SCS_CID1_ADR (0xE000EFF4)
#define SCS_CID2_ADR (0xE000EFF8)
#define SCS_CID3_ADR (0xE000EFFC)


typedef union{
	sfr_t cpuid;
	struct{
		sfr_t revision:4;
		sfr_t partno:12;
		sfr_t reserved0:4;
		sfr_t variant:4;
		sfr_t implementer:8;
	} field;
} cpuid_t;

extern cpuid_t* SCB_CPUID;

typedef union{
	sfr_t icsr;
	struct{
		sfr_t vecactive:9;
		sfr_t reserved0:2;
		sfr_t rettobase:1;
		sfr_t vectpending:9;
		sfr_t reserved1:1;
		sfr_t isrpending:1;
		sfr_t isrpreempt:1;
		sfr_t reserved2:1;
		sfr_t pendstclr:1;
		sfr_t pendstset:1;
		sfr_t pendsvclr:1;
		sfr_t pendsvset:1;
		sfr_t reserved3:2;
		sfr_t nmipendset:1;
	}field;
} icsr_t;

extern icsr_t* SCB_ICSR;

typedef union{
	sfr_t vtor;
	struct{
		sfr_t reserved0:7;
		sfr_t tbloff:25;
	}field;
} vtor_t;

extern vtor_t * SCB_VTOR;

typedef union{
	sfr_t aircr;
	struct{
		sfr_t vectreset:1;
		sfr_t vectclractive:1;
		sfr_t sysresetreq:1;
		sfr_t reserved0:5;
		sfr_t prigroup:3;
		sfr_t endianness:1;
		sfr_t vectkey:16;
	}field;
}aircr_t;

extern aircr_t* SCB_AIRCR;

typedef union{
	sfr_t scr;
	struct{
		sfr_t reserved0:1;
		sfr_t sleeponexit:1;
		sfr_t sleepdeep:1;
		sfr_t reserved1:1;
		sfr_t sevonpend:1;
		sfr_t reserved2:27;
	}field;
} scr_t;

extern scr_t* SCB_SCR;


typedef union{
	sfr_t cfsr;
	struct{
	sfr_t mmFault:8;
	sfr_t busFault:8;
	sfr_t usageFalt:16;
	}fsr; 
	struct{
		sfr_t iaccviol:1;
		sfr_t daccviol:1;
		sfr_t res0:1;
		sfr_t minstsker:1;
		sfr_t mstkerr:1;
		sfr_t mlssperr:1;
		sfr_t res1:1;
		sfr_t mmarvalid:1;
		sfr_t ibuserr:1;
		sfr_t preciserr:1;
		sfr_t impreciserr:1;
		sfr_t unstkerr:1;
		sfr_t stkerr:1;
		sfr_t lsperr:1;
		sfr_t res2:1;
		sfr_t bfarvalid:1;
		sfr_t undefinstr:1;
		sfr_t invstate:1;
		sfr_t invpc:1;
		sfr_t nocp:1;
		sfr_t res3:4;
		sfr_t unaligned:1;
		sfr_t divbyzero:1;
		sfr_t res4:6;
	}field;
}cfsr_t;

extern cfsr_t*  SCB_CFSR;

typedef union{
	sfr_t ccr;
	struct{
		sfr_t nonbasethrdena:1;
		sfr_t usersetmpend:1;
		sfr_t res0:1;
		sfr_t unalign_trp:1;
		sfr_t div_0_trp:1;
		sfr_t res1:3;
		sfr_t bfhfnmign:1;
		sfr_t stkalign:1;
		sfr_t res2:22;
	}fld_ccr;
} ccr_t;
	
extern ccr_t* SCB_CCR;	

#endif //CORE_H
