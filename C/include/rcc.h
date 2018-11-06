/*
 * Description:  Reset and control registers
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-30
 * Licence: GPLv3
 * revision:
 */

#if  !defined(RCC_H)
#define RCC_H

#include "gen_macros.h"

// adresse de base registres reset et clock control
#define RCC_BASE 0x40021000U
#define RCC_CR_ADR (RCC_BASE)
#define RCC_CFGR_ADR (RCC_BASE+4) 
#define RCC_CIR_ADR (RCC_BASE+8) // registre d'interruption clock
#define RCC_APB2RSTR_ADR (RCC_BASE+12) // réinitialisation périphériques
#define RCC_APB1RSTR_ADR (RCC_BASE+16) // réinitialisation périphériques
#define RCC_AHBENR_ADR (RCC_BASE+20) // activation des clock périphérique sur AHB
#define RCC_APB2ENR_ADR (RCC_BASE+24) // activation des clock périphérique sur APB2
#define RCC_APB1ENR_ADR (RCC_BASE+28) // activation des clock périphérique sur APB1
#define RCC_BDCR_ADR (RCC_BASE+32)
#define RCC_CSR_ADR (RCC_BASE+36) // contrôle et status
#define RCC_AHBRSTR_ADR (RCC_BASE+40) // AHB clock reset
#define RCC_CFGR2_ADR (RCC_BASE+44) // configuration 2

typedef struct{
	sfr_t CR;
	sfr_t CFGR;
	sfr_t CIR;
	sfr_t APB2RSTR;
	sfr_t APB1RSTR;
	sfr_t AHBENR;
	sfr_t APB2ENR;
	sfr_t APB1ENR;
	sfr_t BDCR;
	sfr_t CSR;
} rcc_t;

#define RCC ((rcc_t*)RCC_BASE)

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



#define RCC_BDCR_ADR (RCC_BASE+32) // domaine ram sauvegarde contrôle
// champs de bit du registre RCC_BDCR
#define BDCR_LSEON 0 // 1 bit activation oscillateur LSE
#define BDCR_LSERDY 1 // 1 bit, oscillateur prêt
#define BDCR_LSEBYP 2 // 1 bit, contourne l'oscillateur LSE
#define BDCR_RTCSEL 8 // 2 bits, sélectionne le clock du RTC 
						// 00: No clock
						// 01: LSE oscillator clock used as RTC clock
						// 10: LSI oscillator clock used as RTC clock
						// 11: HSE oscillator clock divided by 128 used as RTC clock
#define BDCR_RTCEN 15 // 1 bit, activation RTC						
#define BDCR_BDRST 16 // 1 bit, réinitialisation du backup domain.
  
typedef union{
	sfr_t bdcr;
	struct{
		sfr_t lseon:1;
		sfr_t lserdy:1;
		sfr_t lsebyp:1;
		sfr_t res0:5;
		sfr_t rtcsel:2;
		sfr_t res1:5;
		sfr_t rtcen:1;
		sfr_t bdrst:1;
		sfr_t res2:16;
	}fld;
}rcc_bdcr_t;

#define RCC_BDCR ((rcc_bdcr_t*)RCC_BDCR_ADR)



// position des champs du registre RCC_APB1ENR
#define RCC_APB1ENR_BKPEN (27)
#define RCC_APB1ENR_PWREN (28)
#define RCC_APB1ENR_USART2EN (17)
#define RCC_APB1ENR_USART3EN (18)
// position des champs du registre RCC_APB2ENR
#define RCC_APB2ENR_IOPAEN (2)
#define RCC_APB2ENR_IOPBEN (3)
#define RCC_APB2ENR_IOPCEN (4)
#define RCC_APB2ENR_USART1EN (14)
// position des champs du registre RCC_AHBENR
#define RCC_AHBENR_DMA1EN (1<<0)
#define RCC_AHBENR_DMA2EN (1<<1)
#define RCC_AHBENR_SRAMEN (1<<2)
#define RCC_AHBENR_FLITFEN (1<<4)
#define RCC_AHBENR_CRCEN (1<<6)
#define RCC_AHBENR_FSMCEN (1<<8)
#define RCC_AHBENR_SDIOEN (1<<10)
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

typedef union{// registre de contrôle clock
	sfr_t cr;
	struct{
		sfr_t hsion:1;
		sfr_t hsirdy:1;
		sfr_t res0:1;
		sfr_t hsitrim:5;
		sfr_t hsical:8;
		sfr_t hseon:1;
		sfr_t hserdy:1;
		sfr_t hsebyp:1;
		sfr_t csson:1;
		sfr_t res1:4;
		sfr_t pllon:1;
		sfr_t pllrdy:1;
		sfr_t res2:6;
	}fld;
} rcc_cr_t;

#define RCC_CR ((rcc_cr_t*)RCC_CR_ADR)

typedef union{// registre de configuration clock
	sfr_t cfgr;
	struct{
		sfr_t sw:2; // system clock switch
		sfr_t sws:2; // system clock status
		sfr_t hpre:4; // AHB prescaler
		sfr_t ppre1:3; // APB1 prescaler 
		sfr_t ppre2:3; // APB2 prescaler
		sfr_t pllsrc:1; // PLL clock source
		sfr_t pllxtpre:1; // HSE divider for PLL entry
		sfr_t pllmul:4; // PLL multiplication factor
		sfr_t usbpre:1; // USB prescaler
		sfr_t mco:3; // µC clock output
		sfr_t res0:5; 
	}fld;
} rcc_cfgr_t;

#define RCC_CFGR ((rcc_cfgr_t*)RCC_CFGR_ADR)


// configure le prédiviseur et le mulitplicateur
// pll  PLL,PLL2,PLL3
// div prédiviseur
// mul multiplicateur
extern void set_pll_scaling(unsigned pll,unsigned div,unsigned mul);

// sélection la source du système clock
// clock_src  HSE,HSI, PLL
extern void enable_system_clock(unsigned clk_src);

typedef union{
	sfr_t apb2enr;
	struct{
		sfr_t afioen:1; // alternate function IO clock enable
		sfr_t res0:1;
		sfr_t iopaen:1; // io port A clock enable
		sfr_t iopben:1; // io port B clock enable
		sfr_t iopcen:1; // io port C clock enable
		sfr_t iopden:1; // io port D clock enable
		sfr_t iopeen:1; // io port E clock enable
		sfr_t iopfen:1;
		sfr_t iopgen:1;
		sfr_t adc1en:1; // ADC 1 clock enable
		sfr_t adc2en:1; // ADC 2 clock enable
		sfr_t tim1en:1; // timer 1 clock enable
		sfr_t spi1en:1; // SPI1 clock enable
		sfr_t tim8en:1;
		sfr_t usart1en:1;
		sfr_t adc3en:1;
		sfr_t res2:3; 
		sfr_t tim9en:1; 
		sfr_t tim10en:1;
		sfr_t tim11en:1;
		sfr_t res3:10; 
	}fld;
}rcc_apb2enr_t;

#define APB2ENR ((rcc_apb2enr_t*)RCC_APB2ENR_ADR)

typedef union{
	sfr_t apb1enr;
	struct{
		sfr_t tim2en:1; // timer 2 clock enable
		sfr_t tim3en:1; // timer 3 clock enable
		sfr_t tim4en:1; // timer 4 clock enable
		sfr_t tim5en:1; // timer 5 clock enable
		sfr_t tim6en:1; // timer 6 clock enable
		sfr_t tim7en:1; // timer 7 clock enable
		sfr_t tim12en:1; // timer 12 clock enable
		sfr_t tim13en:1; // timer 13 clock enable
		sfr_t tim14en:1; // timer 14 clock enable
		sfr_t res0:2;
		sfr_t wwdgen:1; // window watchdog clock enable
		sfr_t res1:2; 
		sfr_t spi2en:1; // SPI2 clock enable
		sfr_t spi3en:1; // SPI3 clock enable
		sfr_t res2:1; 
		sfr_t usart2en:1; // USART2 clock enable
		sfr_t usart3en:1; // USART3 clock enable
		sfr_t usart4en:1; // USART4 clock enable
		sfr_t usart5en:1; // USART5 clock enable
		sfr_t i2c1en:1; // I2C 1 clock enable
		sfr_t i2c2en:1; // I2C 2 clock enable
		sfr_t usben:1; // USB enable
		sfr_t res3:1;
		sfr_t canen:1;
		sfr_t res4:1;
		sfr_t bkpen:1; // backup interface clock enable
		sfr_t pwren:1; // power interface clock enable
		sfr_t dacen:1; // DAC interface clock enable
		sfr_t res5:2;
	}fld;
}rcc_apb1enr_t;

#define APB1ENR ((rcc_apb1enr_t*)RCC_APB1ENR_ADR)



#endif // RCC_H
