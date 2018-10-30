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
#include "nvic.h"


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
#define SCB_SHCSR_ADR (SCB_BASE_ADR+36)
#define SCB_CFSR_ADR (SCB_BASE_ADR+40)
#define SCB_HFSR_ADR (SCB_BASE_ADR+44)
#define SCB_MMFAR_ADR (SCB_BASE_ADR+0x34)
#define SCB_BFAR_ADR (SCB_BASE_ADR+0x38)
#define SCB_CPACR_ADR (SCB_BASE_ADR+0x8C)
#define SCB_ICTR_ADR (0xE000E004)
#define SCB_ACTLR_ADR (0xE000E008)
#define SCB_STIR_ADR (0xE000F00)
#define SCB_PID4_ADR (0xE000EFD0)
#define SCB_PID5_ADR (0xE000EFD4)
#define SCB_PID6_ADR (0xE000EFD8)
#define SCB_PID7_ADR (0xE000EFDC)
#define SCB_PID0_ADR (0xE000EFE0)
#define SCB_PID1_ADR (0xE000EFE4)
#define SCB_PID2_ADR (0xE000EFE8)
#define SCB_PID3_ADR (0xE000EFEC)
#define SCB_CID0_ADR (0xE000EFF0)
#define SCB_CID1_ADR (0xE000EFF4)
#define SCB_CID2_ADR (0xE000EFF8)
#define SCB_CID3_ADR (0xE000EFFC)

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

#define CPUID  ((cpuid_t*)SCB_CPUID_ADR)

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
	}fld;
} icsr_t;

#define ICSR ((icsr_t*)SCB_ICSR_ADR)
#define PENDSVSET 28

typedef union{
	sfr_t vtor;
	struct{
		sfr_t reserved0:7;
		sfr_t tbloff:25;
	}fld;
} vtor_t;

#define VTOR ((vtor_t*)SCB_VTOR_ADR)

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
	}fld;
}aircr_t;

#define AIRCR ((aircr_t*)SCB_AIRCR_ADR)
#define SYSRESETREQ (2) // system reset request field, 1 bit
#define VECTKEY (16) // unlock key field, 16 bits
#define KEY (0x05FA) // key value

 
typedef union{
	sfr_t scr;
	struct{
		sfr_t reserved0:1;
		sfr_t sleeponexit:1;
		sfr_t sleepdeep:1;
		sfr_t reserved1:1;
		sfr_t sevonpend:1;
		sfr_t reserved2:27;
	}fld;
} scr_t;

#define SCR ((scr_t*)SCB_SCR_ADR)
// configure le µC pour passe en mode sleep à la sortie d'une interruption
#define _sleep_on_exit() ({SCR->fld.sleeponexit=1;})


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
	}fld;
}cfsr_t;

#define CFSR ((cfsr_t*)SCB_CFSR_ADR)

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
	}fld;
} ccr_t;
	
#define CCR ((ccr_t*)SCB_CCR_ADR)	

#define SHPR ((uint8_t*)SCB_SHPR1_ADR)

typedef union{
	sfr_t shcsr;
	struct{
		sfr_t memfaultact:1;
		sfr_t busfaultact:1;
		sfr_t res0:1;
		sfr_t usgfaultact:1;
		sfr_t res1:3;
		sfr_t svcallact:1;
		sfr_t monitoract:1;
		sfr_t res2:1;
		sfr_t pendsvact:1;
		sfr_t systickact:1;
		sfr_t usgfaultpended:1;
		sfr_t memfaultpended:1;
		sfr_t busfaultpeneed:1;
		sfr_t svcallpended:1;
		sfr_t memfaultena:1;
		sfr_t busfaultena:1;
		sfr_t usgfaultena:1;
	}fld;
} shcsr_t; 

#define SHCSR ((shcsr_t*)SCB_SHCSR_ADR)

typedef union{
	sfr_t hrsr;
	struct{
		sfr_t res0:1;
		sfr_t vecttbl:1;
		sfr_t res1:28;
		sfr_t forced:1;
		sfr_t debugevt:1;
	}fld;
} hfsr_t;

#define HFSR ((hfsr_t*)SCB_HFSR_ADR)

#define MMFAR ((sfrp_t)SCB_MMFAR_ADR)
#define BFAR (((sfrp_t)SCB_BFAR_ADR)

typedef union{
	sfr_t ictr;
	struct{
		sfr_t intlinesnun:4;
		sfr_t res0:28;
	}fld;
}ictr_t;

#define ICTR ((ictr_t*)SCB_ICTR_ADR)

typedef union{
	sfr_t actlr;
	struct{
	}fld;
}actlr_t;

#define ACTLR ((actlr_t*)SCB_ACTLR_ADR)

typedef union{
	sfr_t stir;
	struct{
		sfr_t intid:9;
		sfr_t res0:23;
	}fld;
}stir_t;

#define STIR ((stir_t*)SCB_STIR_ADR)


/**********************
 * SYSTICK registers
 *********************/
 #define SYST_REGS_BASE 0xE000E010
 // compteur à rebours
 #define SYST_CSR_ADR (SYST_REGS_BASE) // SYSTICKS control
 #define SYST_RVR_ADR (SYST_REGS_BASE+4) // valeur de recharge
 #define SYST_CVR_ADR (SYST_REGS_BASE+8) // valeur actuelle du compteur
 #define SYST_CALIB_ADR (SYST_REGS_BASE+12) // valeur de calibration
 // flag de STK_CTRL
 #define SYST_ENABLE 0  // bit d'activation du compteur
 #define SYST_TICKINT 1  // activation des exception
 #define SYST_CLKSRC 2  // clock source 0=AHB, 1=AHB/8
 #define SYST_COUNTFLAG 16 // mis à un lorsque le compteur arrive à zéro
 
typedef union{
	sfr_t csr;
	struct{
		sfr_t enable:1; // enable systick counter
		sfr_t tickint:1; //  interrupt pending
		sfr_t clcksource:1; 
		sfr_t res0: 13;
		sfr_t countflag:1; // set by counter transition form 1->0 
		sfr_t res1: 15;
	}fld;
} syst_csr_t;
 
#define SYST_CSR ((syst_csr_t*)SYST_CSR_ADR)
 
#define SYST_RVR ((sfrp_t)SYST_RVR_ADR)  
#define SYST_CVR ((sfrp_t)SYST_CVR_ADR)

typedef union{
	sfr_t calib;
	struct{
		sfr_t tenms:24;
		sfr_t res0:6;
		sfr_t skew:1;
		sfr_t noref:1;
	}fld;
}syst_calib_t;

#define SYST_CALIB ((syst_calib_t*)SYST_CALIB_ADR)

#endif //CORE_H
