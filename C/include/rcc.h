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

// position des champs du registre RCC_CR
#define RCC_CR_HSION  (1<<0) // 1 bit
#define RCC_CR_HSIRDY (1<<1) // 1 bit
#define RCC_CR_HSITRIM_POS (3) // 5 bits
#define RCC_CR_HSITRIM_MASK (~(0x1f<<3))
#define RCC_CR_HSICAL (1<<8) // 8 bits
#define RCC_CR_HSEON  (1<<16) // 1 bit
#define RCC_CR_HSERDY (1<<17) // 1 bit
#define RCC_CR_HSEBYP (1<<18) // 1 bit
#define RCC_CR_CSSON (1<<19)  // 1 bit
#define RCC_CR_PLLON (1<<24)  // 1 bit
#define RCC_CR_PLLRDY (1<<25) // 1 bit
#define RCC_CR_PLL2ON (1<<26) // 1 bit
#define RCC_CR_PLL2RDY (1<<27) // 1 bit
#define RCC_CR_PLL3ON (1<<28)  // 1 bit
#define RCC_CR_PLL3RDY (1<<29) // 1 bit
//valeur du registre après reset
#define RCC_CR_RST_VAL 0x83

// position des champs du registre RCC_CFGR
#define RCC_CFGR_SW_POS (0) // 2 bits sélectionne SYSCLK
#define RCC_CFGR_SW_MASK (~(3<<0))
#define RCC_CFGR_SWS_POS (2) // 2 bits indique SYSCLK actif
#define RCC_CFGR_SWS_FLD (3<<2)
#define RCC_CFGR_HPRE_POS (4) // 4 bits AHB diviseur clock
#define RCC_CFGR_HPRE_MASK (~(0xf<<4))
#define RCC_CFGR_PPRE1_POS (8) // 3 bits APB1 diviseur clock
#define RCC_CFGR_PPRE1_MASK (~(7<<8))
#define RCC_CFGR_PPRE2_POS (11) // 3 bits APB2 divisuer clock
#define RCC_CFGR_PPRE2_MASK (~(7<<11))
#define RCC_CFGR_ADCPRE_POS (14) // 2 bits ADC diviseur clock
#define RCC_CFGR_ADCPRE_MASK (~(3<<14))
#define RCC_CFGR_PLLSRC (1<<16) // PLL source
#define RCC_CFGR_PLLXTPRE (1<<17) // PREDIV1 bit 0
#define RCC_CFGR_PLLMUL_POS (18) // 4 bits multiplicateur PLL
#define RCC_CFGR_PLLMUL_MASK (~(0xf<<18))
#define RCC_CFGR_OTGFSPRE (1<<22) // diviseur USB OTG clock
#define RCC_CFGR_MCO_POS (24) // 4 bits  µC clock output
#define RCC_CFGR_MCO_MASK (~(0xf<<24))
//value du registre après un reset
#define RCC_CFGR_RST_VAL 0

// champs du registre CIR (clock interrupt flags)
#define RCC_CIR_LSIRDYF (1<<0) // LSI ready flag
#define RCC_CIR_LSERDYF (1<<1) // LSE ready flag
#define RCC_CIR_HSIRDYF (1<<2) // HSE ready flag
#define RCC_CIR_HSERDYF (1<<3) // HSI ready flag
#define RCC_CIR_PLLRDYF (1<<4) // PLL ready flag
#define RCC_CIR_CSSF (1<<7) // HSE failure flag
#define RCC_CIR_LSIRDYIE (1<<8) // activation int. LSIRDY
#define RCC_CIR_LSERDYIE (1<<9) // act. int. LSERDY
#define RCC_CIR_HSIRDYIE (1<<10) // act. int. HSIRDY
#define RCC_CIR_HSERDYIE (1<<11) // act. int. HSERDY
#define RCC_CIR_PLLRDYIE (1<<12) // act int. PLLRDY
#define RCC_CIR_LSIRDYC (1<<16) // clear LSIRDYF
#define RCC_CIR_LSERDYC (1<<17) // clear LSERDYF
#define RCC_CIR_HSIRDYC (1<<16) // clear HSIRDYF
#define RCC_CIR_HSERDYC (1<<16) // clear HSERDYF
#define RCC_CIR_PLLRDYC (1<<16) // clear PLLRDYF
#define RCC_CIR_CSSC (1<<23) // clear CSSF
#define RCC_CIR_RST_VAL 0

// champs APB2RSTR
#define RCC_APB2RSTR_AFIORST (1<<0)
#define RCC_APB2RSTR_IOPARST (1<<2)
#define RCC_APB2RSTR_IOPBRST (1<<3)
#define RCC_APB2RSTR_IOPCRST (1<<4)
#define RCC_APB2RSTR_IOPDRST (1<<5)
#define RCC_APB2RSTR_IOPERST (1<<6)
#define RCC_APB2RSTR_IOPFRST (1<<7)
#define RCC_APB2RSTR_IOPGRST (1<<8)
#define RCC_APB2RSTR_ADC1RST (1<<9)
#define RCC_APB2RSTR_ADC2RST (1<<10)
#define RCC_APB2RSTR_TIM1RST (1<<11)
#define RCC_APB2RSTR_SPI11RST (1<<12)
#define RCC_APB2RSTR_TIM8RST (1<<13)
#define RCC_APB2RSTR_USART1RST (1<<14)
#define RCC_APB2RSTR_ADC3RST (1<<15)
#define RCC_APB2RSTR_TIM9RST (1<<19)
#define RCC_APB2RSTR_TIM10RST (1<<20)
#define RCC_APB2RSTR_TIM11RST (1<<21)
#define RCC_APB2RSTR_RST_VAL 0

// champs APB1RSTR
#define RCC_APB1RSTR_TIM2RST (1<<0)
#define RCC_APB1RSTR_TIM3RST (1<<1)
#define RCC_APB1RSTR_TIM4RST (1<<2)
#define RCC_APB1RSTR_TIM5RST (1<<3)
#define RCC_APB1RSTR_TIM6RST (1<<4)
#define RCC_APB1RSTR_TIM7RST (1<<5)
#define RCC_APB1RSTR_TIM12RST (1<<6)
#define RCC_APB1RSTR_TIM13RST (1<<7)
#define RCC_APB1RSTR_TIM14RST (1<<8)
#define RCC_APB1RSTR_WWDGRST (1<<11)
#define RCC_APB1RSTR_SPI2RST (1<<14)
#define RCC_APB1RSTR_SPI3RST (1<<15)
#define RCC_APB1RSTR_USART2RST (1<<17)
#define RCC_APB1RSTR_USART3RST (1<<18)
#define RCC_APB1RSTR_USART4RST (1<<19)
#define RCC_APB1RSTR_USART5RST (1<<20)
#define RCC_APB1RSTR_I2C1RST (1<<21)
#define RCC_APB1RSTR_I2C2RST (1<<22)
#define RCC_APB1RSTR_USBRST (1<<23)
#define RCC_APB1RSTR_CANRST (1<<25)
#define RCC_APB1RSTR_BKPRST (1<<27)
#define RCC_APB1RSTR_PWRRST (1<<28)
#define RCC_APB1RSTR_DACRST (1<<29)
#define RCC_APB1RSTR_RST_VAL 0

//champs AHBENR
#define RCC_AHBENR_DMA1EN (1<<0)
#define RCC_AHBENR_DMA2EN (1<<1)
#define RCC_AHBENR_SRAMEN (1<<2)
#define RCC_AHBENR_FLITFEN (1<<4)
#define RCC_AHBENR_CRCEN (1<<6)
#define RCC_AHBENR_FSMCEN (1<<9)
#define RCC_AHBENR_SDIOEN (1<<10)
#define RCC_AHBENR_RST_VAL 0x14

// champs APB2ENR
#define RCC_APB2ENR_AFIOEN (1<<0)
#define RCC_APB2ENR_IOPAEN (1<<2)
#define RCC_APB2ENR_IOPBEN (1<<3)
#define RCC_APB2ENR_IOPCEN (1<<4)
#define RCC_APB2ENR_IOPDEN (1<<5)
#define RCC_APB2ENR_IOPEEN (1<<6)
#define RCC_APB2ENR_IOPFEN (1<<7)
#define RCC_APB2ENR_IOPGEN (1<<8)
#define RCC_APB2ENR_ADC1EN (1<<9)
#define RCC_APB2ENR_ADC2EN (1<<10)
#define RCC_APB2ENR_TIM1EN (1<<11)
#define RCC_APB2ENR_SPI1EN (1<<12)
#define RCC_APB2ENR_TIM8EN (1<<13)
#define RCC_APB2ENR_USART1EN (1<<14)
#define RCC_APB2ENR_ADC3EN (1<<15)
#define RCC_APB2ENR_TIM9EN (1<<19)
#define RCC_APB2ENR_TIM10EN (1<<20)
#define RCC_APB2ENR_TIM11EN (1<<21)
#define RCC_APB2ENR_RST_VAL 0

//champs du registre RCC_APB1ENR
#define RCC_APB1ENR_TIM2EN (1<<0)
#define RCC_APB1ENR_TIM3EN (1<<1)
#define RCC_APB1ENR_TIM4EN (1<<2)
#define RCC_APB1ENR_TIM5EN (1<<3)
#define RCC_APB1ENR_TIM6EN (1<<4)
#define RCC_APB1ENR_TIM7EN (1<<5)
#define RCC_APB1ENR_TIM12EN (1<<6)
#define RCC_APB1ENR_TIM13EN (1<<7)
#define RCC_APB1ENR_TIM14EN (1<<8)
#define RCC_APB1ENR_WWDGEN (1<<11)
#define RCC_APB1ENR_SPI2EN (1<<14)
#define RCC_APB1ENR_SPI3EN (1<<15)
#define RCC_APB1ENR_USART2EN (1<<17)
#define RCC_APB1ENR_USART3EN (1<<18)
#define RCC_APB1ENR_USART4EN (1<<19)
#define RCC_APB1ENR_USART5EN (1<<20)
#define RCC_APB1ENR_I2C1EN (1<<21)
#define RCC_APB1ENR_I2C2EN (1<<22)
#define RCC_APB1ENR_USBEN (1<<23)
#define RCC_APB1ENR_CANEN (1<<25)
#define RCC_APB1ENR_BKPEN (1<<27)
#define RCC_APB1ENR_PWREN (1<<28)
#define RCC_APB1ENR_DACEN (1<<29)
#define RCC_APB1ENR_RST_VAL 0

// champ BDCR
#define RCC_BDCR_LSEON (1<<0)
#define RCC_BDCR_LSERDY (1<<1)
#define RCC_BDCR_LSEBYP (1<<2)
#define RCC_BDCR_RTCSEL_POS (8)
#define RCC_BDCR_RTCSEL_MASK (~(3<<8))
#define RCC_BDCR_RTCEN (1<<15)
#define RCC_BDCR_BDRST (1<<16)
#define RCC_BDCR_RST_VAL 0

// champs CSR
#define RCC_CSR_LSION (1<<0)   // enable LSI
#define RCC_CSR_LSIRDY (1<<1)  // LSI ready
#define RCC_CSR_RMVF (1<<24)  // remove reset flag
#define RCC_CSR_PINRSTF (1<<26)  // PIN reset flag
#define RCC_CSR_PORRSTF (1<<27) // POR/PDR reset flag
#define RCC_CSR_SFTRSTF (1<<28) // software reset flag
#define RCC_CSR_IWDGRSTF (1<<29) // independant watchdog reset flag
#define RCC_CSR_WWDGRSTF (1<<30) // window watchdog reset flag
#define RCC_CSR_LPWRRSTF (1<<31) // low power reset flag
#define RCC_CSR_RST_VAL 0x0C000000

// constantes pour différent champs
// source SYSCLK pour RCC_CFGR_SW
#define RCC_CFGR_SW_HSI 0
#define RCC_CFGR_SW_HSE 1
#define RCC_CFGR_SW_PLL 2

// diviseurs pour RCC_CFGR_HPRE
// ABH prescaler
#define RCC_CFGR_HPRE_DIV1 0
#define RCC_CFGR_HPRE_DIV2 8
#define RCC_CFGR_HPRE_DIV4 9
#define RCC_CFGR_HPRE_DIV8 10
#define RCC_CFGR_HPRE_DIV16 11
#define RCC_CFGR_HPRE_DIV64 12
#define RCC_CFGR_HPRE_DIV128 13
#define RCC_CFGR_HPRE_DIV256 14
#define RCC_CFGR_HPRE_DIV512 15

// diviseurs pour RCC_CFGR_PPRE1 et RCC_CFGR_PPRE2
#define RCC_CFGR_PPREx_DIV1 0
#define RCC_CFGR_PPREx_DIV2 4
#define RCC_CFGR_PPREx_DIV4 5
#define RCC_CFGR_PPREx_DIV8 6
#define RCC_CFGR_PPREx_DIV16 7

// diviseurs pour RCC_CFGR_ADCPRE
#define RCC_CFGR_ADCPRE_DIV2 0
#define RCC_CFGR_ADCPRE_DIV4 1
#define RCC_CFGR_ADCPRE_DIV6 2
#define RCC_CFGR_ADCPRE_DIV8 3

// source clock pour RCC_CFGR_PLLSRC
#define RCC_CFGR_PLLSRC_HSI (0<<16)
#define RCC_CFGR_PLLSRC_HSE (1<<16)
// RCC_CFGR_PLLXTPRE 
#define RCC_CFGR_PLLXPRE_PREDIV1 (0<<17)
#define RCC_CFGR_PLLXPRE_PREDIV2 (1<<17)

// multiplicateur pour RCC_CFGR_PLLMUL
#define RCC_CFGR_PLLMUL2 0
#define RCC_CFGR_PLLMUL3 1
#define RCC_CFGR_PLLMUL4 2
#define RCC_CFGR_PLLMUL5 3
#define RCC_CFGR_PLLMUL6 4
#define RCC_CFGR_PLLMUL7 5
#define RCC_CFGR_PLLMUL8 6
#define RCC_CFGR_PLLMUL9 7
#define RCC_CFGR_PLLMUL10 8
#define RCC_CFGR_PLLMUL11 9
#define RCC_CFGR_PLLMUL12 10
#define RCC_CFGR_PLLMUL13 11
#define RCC_CFGR_PLLMUL14 12
#define RCC_CFGR_PLLMUL15 13
#define RCC_CFGR_PLLMUL16 14

// diviseur RCC_CFGR_USBPRE 
#define RCC_CFGR_USBPRE_1_5 1 // 2*PLLCLK/2
#define RCC_CFGR_USBPRE_1 0  // 2*PLLCLK/3

// µC clock output pour RCC_CFGR_MCO
#define  RCC_CFGR_MCO_NONE 0  // pas de sortie
#define  RCC_CFGR_MCO_SYSCLK 4 // system clock
#define  RCC_CFGR_MCO_HSI 5  // oscillateur HSI
#define  RCC_CFGR_MCO_HSE 6  // oscillateur HSE
#define  RCC_CFGR_MCO_PLLDIV2 7 // PLL/2

// valeurs pour champ RCC_BDCR_RTCSEL
#define RCC_BDCR_RTCSEL_NONE 0
#define RCC_BDCR_RTCSEL_LSE 1
#define RCC_BDCR_RTCSEL_LSI 2
#define RCC_BDCR_RTCSEL_HSE 3


// configure le prédiviseur et le mulitplicateur
// pll  PLL,PLL2,PLL3
// div prédiviseur
// mul multiplicateur
extern void set_pll_scaling(unsigned pll,unsigned div,unsigned mul);

// sélection la source du système clock
// clock_src  HSE,HSI, PLL
extern void enable_system_clock(unsigned clk_src);



#endif // RCC_H
