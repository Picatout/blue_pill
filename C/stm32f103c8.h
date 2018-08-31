/*
 * fichier d'entête définissant des constantes pour les registres 
 * spéciaux  du µC stm32f103c8
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-29
 * Licence: GPLv3
 * revision:
 */

// REF: STMicro electronics documents RM0008 (reference manual) et DS5319 (datasheet)
// constantes pour les registres spéciaux du µC STM32F103C8

#if !defined(STM32F103C8_H)
#define STM32F103C8_H
#include <stdint.h>

// les Special Function Registers sont de de 32 bits
#define _sfr(x) *((uint32_t*)(x))

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



/*********
* PORT C *
**********/
// adresse de base registres du port C
#define GPIOC_BASE 0X40011000U 
// registres port C
#define GPIOC_CRL _sfr(GPIOC_BASE)  // configuartion bits 0-7
#define GPIOC_CRH _sfr(GPIOC_BASE+4) // configuration bits 8-15
#define GPIOC_IDR _sfr(GPIOC_BASE+8) // input data
#define GPIOC_ODR _sfr(GPIOC_BASE+12) // output data
#define GPIOC_BSRR _sfr(GPIOC_BASE+16) // bit set/reset 
#define GPIOC_BRR  _sfr(GPIOC_BASE+20) // bit reset
#define GPIOC_LCKR _sfr(GPIOC_BASE+24) // config lock 
#define GPIOC_EN  (4) // 1 bit, activation clock d'activation 
#define GPIOC_RST (4) // 1 bit, reset gpio

#define DEFAULT_PORT_CNF 0x44444444U
#define CNF_MASK 0xF


#endif // STM32F103C8_H
