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
		sfr_t lpds:1;
		sfr_t ppds:1;
		sfr_t cwuf:1;
		sfr_t csbf:1;
		sfr_t pvde:1;
		sfr_t pls:3;
		sfr_t dbp:1;
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
#define PWR_CSR _sfr(PWR_BASE_ADR+4)
//champs du registres PWR_CSR
#define PWR_CSR_WUF  (0) // 1 bit, wakeup flag
#define PWR_CSR_SBF  (1) // 1 bit, standby flag
#define PWR_CSR_PVDO (2) // 1 bit, PVD output
#define PWR_CSR_EWUP (8) // 1 bit, enable wakeup pin


// source SYSCLK pour RCC_CFGR_SW
#define HSI_CLK 0
#define HSE_CLK 1
#define PLL_CLK 2

// diviseurs pour RCC_CFGR_HPRE
#define AHBCLK_DIV1 0
#define AHBCLK_DIV2 8
#define AHBCLK_DIV4 9
#define AHBCLK_DIV8 10
#define AHBCLK_DIV16 11
#define AHBCLK_DIV64 12
#define AHBCLK_DIV128 13
#define AHBCLK_DIV256 14
#define AHBCLK_DIV512 15

// diviseurs pour RCC_CFGR_PPRE1 et RCC_CFGR_PPRE2
#define PPRECLK_DIV1 0
#define PPRECLK_DIV2 4
#define PPRECLK_DIV4 5
#define PPRECLK_DIV8 6
#define PPRECLK_DIV16 7

// diviseurs pour RCC_CFGR_ADCPRE
#define ADCCLK_DIV2 0
#define ADCCLK_DIV4 1
#define ADCCLK_DIV6 2
#define ADCCLK_DIV8 3

// source clock pour RCC_CFGR_PLL
#define PLLSRC_HSI 0
#define PLLSRC_PREDIV1 1

// multiplicateur pour RCC_CFGR_PLLMUL
#define PLLMUL1 0
#define PLLMUL4 2
#define PLLMUL5 3
#define PLLMUL6 4
#define PLLMUL7 5
#define PLLMUL8 6
#define PLLMUL9 7
#define PLLMUL6_5 13

// diviseur RCC_CFGR_OTGFSPRE 
#define OTGFSPRE2 1 // 2*PLLCLK/2
#define OTGFSPR3 0  // 2*PLLCLK/3

// µC clock output pour RCC_CFGR_MCO
#define MCO_NONE 0  // pas de sortie
#define MCO_SYSCLK 4 // system clock
#define MCO_HSI 5  // oscillateur HSI
#define MCO_HSE 6  // oscillateur HSE
#define MCO_PLLDIV2 7 // PLL/2
#define MCO_PLL2 8  // PLL2
#define MCO_PLL3 9  // PLL3
#define MCO_XT1 10  // oscillateur externe 3-25Mhz pour ethernet
#define MCO_PLL3E 11 // PLL3 pour ethernet


// position des champs pour RCC_CFGR2
#define RCC_CFGR2_PREDIV1 0 // 4 bit prédiviseur 1
#define RCC_CFGR2_PREDIV2 4 // 4 bit prédiviseur 2
#define RCC_CFGR2_PLL2MUL 8 // 4 bits pll2 multiplicateur
#define RCC_CFGR2_PLL3MUL 12 // 4 bits PLL3 multiplicateur
#define RCC_CFGR2_PREDIV1SRC 16 // 1 bit source prediv1
#define RCC_CFGR2_I2S2SRC 17 // 1 bit source i2s2
#define RCC_CFGR2_I2S3SRC 18 // 1 bit source i2s3
// valeur du registre après un reset
#define RCC_CFGR2_RST_VAL 0

// multiplicateurs pour RCC_CFGR2_PLL2MUL
#define PLL2MUL8 6
#define PLL2MUL9 7
#define PLL2MUL10 8
#define PLL2MUL11 9
#define PLL2MUL12 10
#define PLL2MUL13 11
#define PLL2MUL14 12
#define PLL2MUL16 14
#define PLL2MUL20 15
// multiplilcateur pour RCC_CFGR2_PLL3MUL
#define PLL3MUL8 6
#define PLL3MUL9 7
#define PLL3MUL10 8
#define PLL3MUL11 9
#define PLL3MUL12 10
#define PLL3MUL13 11
#define PLL3MUL14 12
#define PLL3MUL16 14
#define PLL3MUL20 15

// identifiants pour les 3 pll
#define PLL 0
#define PLL2 1
#define PLL3 2

// source pour RCC_CFGR2_PREDIV1SRC
#define PREDIV1SRC_HSE 0
#define PREDIV1SRC_PLL2 1

// source pour RCC_CFGR2_I2S2SRC
#define I2S2SRC_SYSCLK 0
#define I2S2SRC_PLL3 1

// source pour RCC_CFGR2_I2S3SRC
#define I2S3SRC_SYSCLK 0
#define I2S3SRC_PLL3 1


 
/*******************************
 * registre interne au Cortex-M3
 ******************************/
 #define SYST_REGS_BASE 0xE000E010
 // compteur à rebours
 #define SYST_CSR_ADR (SYST_REGS_BASE) // SYSTICKS control
 #define SYST_RVR _sfr(SYST_REGS_BASE+4) // valeur de recharge
 #define SYST_CVR _sfr(SYST_REGS_BASE+8) // valeur actuelle du compteur
 #define SYST_CALIB _sfr(SYST_REGS_BASE+12) // valeur de calibration
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
 
#define FLASH_ACR ((flash_acr_t*)FLASH_ACR_ADR)
 
#define PENDSVSET 28

  
#define SYSRESETREQ (2) // system reset request field, 1 bit
#define VECTKEY (16) // unlock key field, 16 bits
#define KEY (0x05FA) // key value

 
// configure le µC pour passe en mode sleep à la sortie d'une interruption
#define _sleep_on_exit() ({SCR->fld.sleeponexit=1;})

#endif //CORE_H
