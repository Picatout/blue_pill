/*
 * fichier d'entête définissant des constantes pour les registres 
 * spéciaux  du µC stm32f103c8
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-29
 * Licence: GPLv3
 * revision:
 * 2018-09-01: Modification de la macro _sfr(x) pour ajouter l'attribut volatile
 */

// REF: STMicro electronics documents RM0008 (reference manual) et DS5319 (datasheet)
// constantes pour les registres spéciaux du µC STM32F103C8

#if !defined(STM32F103C8_H)
#define STM32F103C8_H
#include <stdint.h>
#include "gen_macros.h"

// réinitialisation du MCU
// voir fonction reset_mcu() dans startup.c
#define _reset_mcu() asm volatile ("b reset_mcu\n")

//  gestion de la consommation électrique
// adresse de base registres PWR_
#define PWR_BASE_ADR 0x40007000
#define PWR_CR _sfr(PWR_BASE_ADR)
//champ du registe PWR_CR
#define PWR_CR_LPDS (0) // 1 bit, lower deep sleep
#define PWR_CR_PPDS (1) // 1 bit, power down deep sleep
#define PWR_CR_CWUF (2) // 1 bit, clear wake up flag
#define PWR_CR_CSBF (3) //  1 bit, clear standby flag
#define PWR_CR_PVDE (4) // 1 bit, power voltage dectector enable
#define PWR_CR_PLS  (5) // 3 bits, PVD level selection
#define PWR_CR_DBP  (8) // 1 bit, disable backup domain protection
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

// adresse de base registres reset et clock control
#define RCC_BASE 0x40021000U
#define RCC_CR  _sfr(RCC_BASE) // registre de contrôle clock
#define RCC_CFGR _sfr(RCC_BASE+4) // registre de configuration clock
#define RCC_CIR _sfr(RCC_BASE+8) // registre d'interruption clock
#define RCC_APB2 _sfr(RCC_BASE+12) // réinitialisation périphériques
#define RCC_APB1 _sfr(RCC_BASE+16) // réinitialisation périphériques
#define RCC_AHBENR _sfr(RCC_BASE+20) // activation des clock périphérique sur AHB
#define RCC_APB2ENR _sfr(RCC_BASE+24) // activation des clock périphérique sur APB2
#define RCC_APB1ENR _sfr(RCC_BASE+28) // activation des clock périphérique sur APB1
#define RCC_BDCR _sfr(RCC_BASE+32) // domaine ram sauvegarde contrôle
#define RCC_CSR _sfr(RCC_BASE+36) // contrôle et status
#define RCC_AHBRSTR _sfr(RCC_BASE+40) // AHB clock reset
#define RCC_CFGR2 _sfr(RCC_BASE+44) // configuration 2

// position des champs du registre RCC_APB1ENR
#define APB1ENR_BKPEN (27)
#define APB1ENR_PWREN (28)

// position des champs du registre RCC_CR
#define RCC_CR_HSION  (0) // 1 bit
#define RCC_CR_HSIRDY (1) // 1 bit
#define RCC_CR_HSITRIM (3) // 5 bits
#define RCC_CR_HSICAL (8) // 8 bits
#define RCC_CR_HSEON  (16) // 1 bit
#define RCC_CR_HSERDY (17) // 1 bit
#define RCC_CR_HSEBYP (18) // 1 bit
#define RCC_CR_CSSON (19)  // 1 bit
#define RCC_CR_PLLON (24)  // 1 bit
#define RCC_CR_PLLRDY (25) // 1 bit
#define RCC_CR_PLL2ON (26) // 1 bit
#define RCC_CR_PLL2RDY (27) // 1 bit
#define RCC_CR_PLL3ON (28)  // 1 bit
#define RCC_CR_PLL3RDY (29) // 1 bit
//valeur du registre après reset
#define RCC_CR_RST_VAL 0x83

// position des champs du registre RCC_CFGR
#define RCC_CFGR_SW 0 // 2 bits sélectionne SYSCLK
#define RCC_CFGR_SWS 2 // 2 bits indique SYSCLK actif
#define RCC_CFGR_HPRE 4 // 4 bits AHB diviseur clock
#define RCC_CFGR_PPRE1 8 // 3 bits APB1 diviseur clock
#define RCC_CFGR_PPRE2 11 // 3 bits APB2 divisuer clock
#define RCC_CFGR_ADCPRE 14 // 2 bits ADC diviseur clock
#define RCC_CFGR_PLLSRC 16 // 1 bit PLL source
#define RCC_CFGR_PLLXTPRE 17 // 1 bit PREDIV1 bit 0
#define RCC_CFGR_PLLMUL 18 // 4 bits multiplicateur PLL
#define RCC_CFGR_OTGFSPRE 22 // 1 bit diviseur USB OTG clock
#define RCC_CFGR_MCO 24 // 4 bits  µC clock output
//value du registre après un reset
#define RCC_CFGR_RST_VAL 0

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
 #define CORE_REGS_BASE 0xE000E010
 // compteur à rebours
 #define STK_CTRL _sfr(CORE_REGS_BASE) // SYSTICKS control
 #define STK_LOAD _sfr(CORE_REGS_BASE+4) // valeur de recharge
 #define STK_VAL _sfr(CORE_REGS_BASE+8) // valeur actuelle du compteur
 #define STK_CALIB _sfr(CORE_REGS_BASE+12) // valeur de calibration
 // flag de STK_CTRL
 #define STK_ENABLE 0  // bit d'activation du compteur
 #define STK_TICKINT 1  // activation des exception
 #define STK_CLKSRC 2  // clock source 0=AHB, 1=AHB/8
 #define STK_COUNTFLAG 16 // mis à un lorsque le compteur arrive à zéro
 
/*************
 * FLASH_ACR
 ************/
 #define FLASH_REGS_BASE 0x40022000
 #define FLASH_ACR _sfr(FLASH_REGS_BASE) // flash access control
 #define LATENCY 0 // champ delais accès
 #define WAIT_0_CY 0
 #define WAIT_1_CY 1
 #define WAIT_2_CY 2  
 
 
/****************
 * NVIC
 ***************/
#define LAST_IRQ 59 // dernier IRQ
#define NVIC_BASE_ADR 0xE000E100U
#define NVIC_ISER0_ADR (NVIC_BASE_ADR)
#define NVIC_ISER0 _sfr(NVIC_BASE_ADR)
#define NVIC_ISER1 _sfr(NVIC_BASE_ADR+4)
#define NVIC_ISER2 _sfr(NVIC_BASE_ADR+8)
#define NVIC_ICER0_ADR (NVIC_BASE_ADR+0x80)
#define NVIC_ICER0 _sfr(NVIC_BASE_ADR+0x80)
#define NVIC_ICER1 _sfr(NVIC_BASE_ADR+0x84)
#define NVIC_ICER2 _sfr(NVIC_BASE_ADR+0x88) 
#define NVIC_ISPR0 _sfr(NVIC_BASE_ADR+0x100)
#define NVIC_ISPR1 _sfr(NVIC_BASE_ADR+0x104)
#define NVIC_ISPR2 _sfr(NVIC_BASE_ADR+0x108)
#define NVIC_ICPR0 _sfr(NVIC_BASE_ADR+0x180)
#define NVIC_ICPR1 _sfr(NVIC_BASE_ADR+0x184)
#define NVIC_ICPR2 _sfr(NVIC_BASE_ADR+0x188)
#define NVIC_IABR0 _sfr(NVIC_BASE_ADR+0x200)
#define NVIC_IABR1 _sfr(NVIC_BASE_ADR+0x204)
#define NVIC_IABR2 _sfr(NVIC_BASE_ADR+0x208)
#define NVIC_IPR0_ADR (NVIC_BASE_ADR+0x300)
#define NVIC_IPR0 _sfr(NVIC_BASE_ADR+0x300)
#define NVIC_IPR1 _sfr(NVIC_BASE_ADR+0x304)
#define NVIC_IPR2 _sfr(NVIC_BASE_ADR+0x308)
#define NVIC_IPR3  _sfr(NVIC_BASE_ADR+0x30c)
#define NVIC_IPR4  _sfr(NVIC_BASE_ADR+0x310)
#define NVIC_IPR5  _sfr(NVIC_BASE_ADR+0x314)
#define NVIC_IPR6  _sfr(NVIC_BASE_ADR+0x318)
#define NVIC_IPR7  _sfr(NVIC_BASE_ADR+0x31c)
#define NVIC_IPR8  _sfr(NVIC_BASE_ADR+0x320)
#define NVIC_IPR9  _sfr(NVIC_BASE_ADR+0x324)
#define NVIC_IPR10  _sfr(NVIC_BASE_ADR+0x328)
#define NVIC_IPR11 _sfr(NVIC_BASE_ADR+0x32c)
#define NVIC_IPR12 _sfr(NVIC_BASE_ADR+0x330)
#define NVIC_IPR13  _sfr(NVIC_BASE_ADR+0x334)
#define NVIC_IPR14 _sfr(NVIC_BASE_ADR+0x338)
#define NVIC_IPR15  _sfr(NVIC_BASE_ADR+0x33c)
#define NVIC_IPR16  _sfr(NVIC_BASE_ADR+0x340)
#define NVIC_IPR17  _sfr(NVIC_BASE_ADR+0x344)
#define NVIC_IPR18  _sfr(NVIC_BASE_ADR+0x348)
#define NVIC_IPR19  _sfr(NVIC_BASE_ADR+0x34c)
#define NVIC_IPR20  _sfr(NVIC_BASE_ADR+0x350)
#define NVIC_STIR _sfr(0xE000EF00)

#define ICSR _sfr(0xE000ED04)
#define PENDSVSET 28

/***********
 *  IRQ no
 **********/
#define IRQ_WWDG 0
#define IRQ_PVD 1
#define IRQ_TAMPER 2
#define IRQ_RTC 3
#define IRQ_FLASH 4
#define IRQ_RCC 5
#define IRQ_EXTI0 6
#define IRQ_EXTI1 7
#define IRQ_EXTI2 8
#define IRQ_EXTI3 9
#define IRQ_EXTI4 10
#define IRQ_DMA1CH1 11
#define IRQ_DMA1CH2 12
#define IRQ_DMA1CH3 13
#define IRQ_DMA1CH4 14
#define IRQ_DMA1CH5 15
#define IRQ_DMA1CH6 16
#define IRQ_DMA1CH7 17
#define IRQ_ADC1_2 18
#define IRQ_USB_HP_CAN_TX 19
#define IRQ_USB_LP_CAN_RX0 20
#define IRQ_CAN_RX1 21
#define IRQ_CAN_SCE 22
#define IRQ_EXTI9_5 23
#define IRQ_TIM1_BRK 24
#define IRQ_TIM1_UP 25
#define IRQ_TIM1_TRG_COM 26
#define IRQ_TIM1_CC 27
#define IRQ_TIM2 28
#define IRQ_TIM3 29
#define IRQ_TIM4 30
#define IRQ_I2C1_EV 31
#define IRQ_I2C1_ER 32
#define IRQ_I2C2_EV 33
#define IRQ_I2C2_ER 34
#define IRQ_SPI1 35
#define IRQ_SPI2 36
#define IRQ_USART1 37
#define IRQ_USART2 38
#define IRQ_USART3 39
#define IRQ_EXTI15_10 40
#define IRQ_RCT_ALARM 41
#define IRQ_USB_WAKEUP 42
#define IRQ_TIM8_BRK 43
#define IRQ_TIM8_UP 44
#define IRQ_TIM8_TRG_COM 45
#define IRQ_TIM8_CC 46
#define IRQ_ADC3 47
#define IRQ_FSMC 48
#define IRQ_SDIO 49
#define IRQ_TIM5 50
#define IRQ_SPI3 51
#define IRQ_UART4 52
#define IRQ_UART5 53
#define IRQ_TIM6 54
#define IRQ_TIM7 55
#define IRQ_DMA2CH1 56
#define IRQ_DMA2CH2 57
#define IRQ_DMA2CH3 58
#define IRQ_DMA2CH4_5 59
  
#define SYSRESETREQ (2) // system reset request field, 1 bit
#define VECTKEY (16) // unlock key field, 16 bits
#define KEY (0x05FA) // key value
#define AIRCR _sfr(0xE000ED0C) // Application Interrupt and Reset Control Register
 
/*************************
 * SCB
 * System Control block
 *************************/
#define SCB_BASE_ADR 0xE000ED00 
#define SCB_CPUID _sfr(SCB_BASE_ADR)
#define SCB_ICSR _sfr(SCB_BASE_ADR+4)
#define SCB_VTOR _sfr(SCB_BASE_ADR+8)
#define SCB_AIRCR _sfr(SCB_BASE_ADR+12)
#define SCB_SCR _sfr(SCB_BASE_ADR+16)
#define SCB_CCR _sfr(SCB_BASE_ADR+20)
#define SCB_SHPR1 _sfr(SCB_BASE_ADR+24)
#define SCB_SHPR2 _sfr(SCB_BASE_ADR+28)
#define SCB_SHPR3 _sfr(SCB_BASE_ADR+32)
#define SCB_SHCRS _sfr(SCB_BASE_ADR+36)
#define SCB_CFSR _sfr(SCB_BASE_ADR+40)
#define SCB_HFSR _sfr(SCB_BASE_ADR+44)
#define SCB_MMAR _sfr(SCB_BASE_ADR+0x34)
#define SCB_BFAR _sfr(SCB_BASE_ADR+0x38)

#define SLEEPONEXIT (1) 
#define _sleep_on_exit() ({SCB_SCR|=(1<<SLEEPONEXIT);})
  
/*********
* PORT C *
**********/
// adresse de base registres du port C
#define GPIOC_BASE_ADR 0X40011000U 

typedef struct gpio{
	volatile uint32_t crl;
	volatile uint32_t crh;
	volatile uint32_t idr;
	volatile uint32_t odr;
	volatile uint32_t bsrr;
	volatile uint32_t brr;
	volatile uint32_t lckr;
} t_gpio;


// registres port C
#define GPIOC_CRL _sfr(GPIOC_BASE_ADR)  // configuartion bits 0-7
#define GPIOC_CRH _sfr(GPIOC_BASE_ADR+4) // configuration bits 8-15
#define GPIOC_IDR _sfr(GPIOC_BASE_ADR+8) // input data
#define GPIOC_ODR _sfr(GPIOC_BASE_ADR+12) // output data
#define GPIOC_BSRR _sfr(GPIOC_BASE_ADR+16) // bit set/reset 
#define GPIOC_BRR  _sfr(GPIOC_BASE_ADR+20) // bit reset
#define GPIOC_LCKR _sfr(GPIOC_BASE_ADR+24) // config lock 
#define GPIOC_EN  (4) // 1 bit, activation clock d'activation 
#define GPIOC_RST (4) // 1 bit, reset gpio

#define DEFAULT_PORT_CNF 0x44444444U
#define CNF_MASK 0xF


#endif // STM32F103C8_H
