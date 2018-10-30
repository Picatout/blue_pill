/*
 * Description: HAL GPIO
 * Auteur: PICATOUT
 * Date: 2018-10-10
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef GPIO_H
#define GPIO_H

#include "blue_pill.h"
#include "gen_macros.h"
#include "stm32f103c8.h"



// offset des différents registres
#define GPIO_CRL_OFS 0
#define GPIO_CRH_OFS 4
#define GPIO_IDR_OFS 8
#define GPIO_ODR_OFS 12
#define GPIO_BSRR_OFS 16
#define GPIO_BRR_OFS 20
#define GPIO_LCKR_OFS 24

// structures des différents registres

typedef union{
	sfrnv_t cr;
	struct{
		sfrnv_t mode0:2;
		sfrnv_t cnf0:2;
		sfrnv_t mode1:2;
		sfrnv_t cnf1:2;
		sfrnv_t mode2:2;
		sfrnv_t cnf2:2;
		sfrnv_t mode3:2;
		sfrnv_t cnf3:2;
		sfrnv_t mode4:2;
		sfrnv_t cnf4:2;
		sfrnv_t mode5:2;
		sfrnv_t cnf5:2;
		sfrnv_t mode6:2;
		sfrnv_t cnf6:2;
		sfrnv_t mode7:2;
		sfrnv_t cnf7:2;
	};
} gpio_crl_t;

typedef union{
	sfrnv_t cr;
	struct{
		sfrnv_t mode8:2;
		sfrnv_t cnf8:2;
		sfrnv_t mode9:2;
		sfrnv_t cnf9:2;
		sfrnv_t mode10:2;
		sfrnv_t cnf10:2;
		sfrnv_t mode11:2;
		sfrnv_t cnf11:2;
		sfrnv_t mode12:2;
		sfrnv_t cnf12:2;
		sfrnv_t mode13:2;
		sfrnv_t cnf13:2;
		sfrnv_t mode14:2;
		sfrnv_t cnf14:2;
		sfrnv_t mode15:2;
		sfrnv_t cnf15:2;
	};
} gpio_crh_t;

typedef union{
	sfr_t idr;
	struct{
		sfr_t idrl:16;
		sfr_t reserved:16;
	};
} gpio_idr_t;	

typedef union{
	sfr_t odr;
	struct{
		sfr_t odrl:16;
		sfr_t reserved:16;
	};
} gpio_odr_t;	

typedef union{
	sfr_t bsrr;
	struct{
		sfr_t bsr:16;
		sfr_t reserved:16;
	};
} gpio_bsrr_t;	

typedef union{
	sfr_t brr;
	struct{
		sfr_t br:16;
		sfr_t reserved:16;
	};
} gpio_brr_t;	

typedef union{
	sfr_t lckr;
	struct{
		sfr_t lck:16;
		sfr_t lckk:1;
		sfr_t reserved:15;
	};
} gpio_lckr_t;	


/*********
* PORT A
********/
// registres port A
#define GPIOA_BASE_ADR 0x40010800

#define GPIOA_CRL  ((gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS))
#define GPIOA_CRH  ((gpio_crh_t*)(GPIOA_BASE_ADR+GPIO_CRH_OFS))
#define GPIOA_CR   ((gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS))
#define GPIOA_IDR  ((gpio_idr_t *)(GPIOA_BASE_ADR+GPIO_IDR_OFS))
#define GPIOA_ODR  ((gpio_odr_t *)(GPIOA_BASE_ADR+GPIO_ODR_OFS))
#define GPIOA_BSRR ((gpio_bsrr_t *)(GPIOA_BASE_ADR+GPIO_BSRR_OFS))
#define GPIOA_BRR  ((gpio_brr_t *)(GPIOA_BASE_ADR+GPIO_BRR_OFS))
#define GPIOA_LCKR ((gpio_lckr_t *)(GPIOA_BASE_ADR+GPIO_LCKR_OFS))
 
/*********
* PORT B
********/
// registre port B
#define GPIOB_BASE_ADR 0x40010C00

#define GPIOB_CRL  ((gpio_crl_t*)(GPIOB_BASE_ADR+GPIO_CRL_OFS))
#define GPIOB_CRH  ((gpio_crh_t*)(GPIOB_BASE_ADR+GPIO_CRH_OFS))
#define GPIOB_CR   ((gpio_crl_t*)(GPIOB_BASE_ADR+GPIO_CRL_OFS))
#define GPIOB_IDR  ((gpio_idr_t *)(GPIOB_BASE_ADR+GPIO_IDR_OFS))
#define GPIOB_ODR  ((gpio_odr_t *)(GPIOB_BASE_ADR+GPIO_ODR_OFS))
#define GPIOB_BSRR ((gpio_bsrr_t *)(GPIOB_BASE_ADR+GPIO_BSRR_OFS))
#define GPIOB_BRR  ((gpio_brr_t *)(GPIOB_BASE_ADR+GPIO_BRR_OFS))
#define GPIOB_LCKR ((gpio_lckr_t *)(GPIOB_BASE_ADR+GPIO_LCKR_OFS))
 
/*********
* PORT C *
**********/
// adresse de base registres du port C
#define GPIOC_BASE_ADR 0X40011000U 

#define GPIOC_CRL  ((gpio_crl_t*)(GPIOC_BASE_ADR+GPIO_CRL_OFS))
#define GPIOC_CRH  ((gpio_crh_t*)(GPIOC_BASE_ADR+GPIO_CRH_OFS))
#define GPIOC_CR   ((gpio_crl_t*)(GPIOC_BASE_ADR+GPIO_CRL_OFS))
#define GPIOC_IDR  ((gpio_idr_t *)(GPIOC_BASE_ADR+GPIO_IDR_OFS))
#define GPIOC_ODR  ((gpio_odr_t *)(GPIOC_BASE_ADR+GPIO_ODR_OFS))
#define GPIOC_BSRR ((gpio_bsrr_t *)(GPIOC_BASE_ADR+GPIO_BSRR_OFS))
#define GPIOC_BRR  ((gpio_brr_t *)(GPIOC_BASE_ADR+GPIO_BRR_OFS))
#define GPIOC_LCKR ((gpio_lckr_t *)(GPIOC_BASE_ADR+GPIO_LCKR_OFS))

// champs mode et config registre CRL 
#define GPIO_MODE0  0
#define GPIO_CNF0 2
#define GPIO_MODE1 4
#define GPIO_CNF1 6
#define GPIO_MODE2  8
#define GPIO_CNF2   10
#define GPIO_MODE3 12
#define GPIO_CNF3 14
#define GPIO_MODE4 16
#define GPIO_CNF4 18
#define GPIO_MODE5 20
#define GPIO_CNF5 22
#define GPIO_MODE6 24
#define GPIO_CNF6 26
#define GPIO_MODE7 28
#define GPIO_CNF7 30
// champs mode et config registre CRH
#define GPIO_MODE8  0
#define GPIO_CNF8 2
#define GPIO_MODE9 4
#define GPIO_CNF9 6
#define GPIO_MODE10  8
#define GPIO_CNF10   10
#define GPIO_MODE11 12
#define GPIO_CNF11 14
#define GPIO_MODE12 16
#define GPIO_CNF12 18
#define GPIO_MODE13 20
#define GPIO_CNF13 22
#define GPIO_MODE14 24
#define GPIO_CNF14 26
#define GPIO_MODE15 28
#define GPIO_CNF15 30


// registres port C
//#define GPIOC_CRL _sfr(GPIOC_BASE_ADR)  // configuartion bits 0-7
//#define GPIOC_CRH _sfr(GPIOC_BASE_ADR+4) // configuration bits 8-15
//#define GPIOC_IDR _sfr(GPIOC_BASE_ADR+8) // input data
//#define GPIOC_ODR _sfr(GPIOC_BASE_ADR+12) // output data
//#define GPIOC_BSRR _sfr(GPIOC_BASE_ADR+16) // bit set/reset 
//#define GPIOC_BRR  _sfr(GPIOC_BASE_ADR+20) // bit reset
//#define GPIOC_LCKR _sfr(GPIOC_BASE_ADR+24) // config lock 

#define GPIOC_EN  (4) // 1 bit, activation clock d'activation 
#define GPIOC_RST (4) // 1 bit, reset gpio

#define DEFAULT_PORT_CNF 0x44444444U
#define CNF_MASK 0xF

/************
* AFIO
************/
 
#define AFIO_BASE_ADR 0X40010000
#define AFIO_EVCR_OFS 0
#define AFIO_MAPR_OFS 4
#define AFIO_EXTICR1_OFS 8
#define AFIO_EXTICR2_OFS 12
#define AFIO_EXTICR3_OFS 16
#define AFIO_EXTICR4_OFS 20
#define AFIO_MAPR2_OFS 28

typedef union{
	sfr_t evcr;
	struct{
		sfr_t pin:4;
		sfr_t port:3;
		sfr_t evoe:1;
		sfr_t reserved:24;
	};
} afio_evcr_t;

extern afio_evcr_t * AFIO_EVCR;//=(afio_evcr_t *)(AFIO_BASE_ADR+AFIO_EVCR_OFS);

typedef union{
	sfr_t mapr;
	struct{
		sfr_t spi1_remap:1;
		sfr_t i2c1_remap:1;
		sfr_t usart1_remap:1;
		sfr_t usart2_remap:1;
		sfr_t usart3_remap:1;
		sfr_t tim1_remap:1;
		sfr_t tim2_remap:1;
		sfr_t tim3_remap:1;
		sfr_t tim4_remap:1;
		sfr_t can_remap:1;
		sfr_t pd01_remap:1;
		sfr_t tim5ch4_iremap:1;
		sfr_t adc1_etrginj_remap:1;
		sfr_t adc1_etrgreg_remap:1;
		sfr_t adc2_etrginj_remap:1;
		sfr_t adc2_etrgreg_remap:1;
		sfr_t reserve0:3;
		sfr_t swj_cfg:3;
		sfr_t reserve1:5;
	};
} afio_mapr_t;

extern afio_mapr_t * AFIO_MAPR;//=(afio_mapr_t *)(AFIO_BASE_ADR+AFIO_MAPR2_OFS);

typedef union{
	sfr_t exticr;
	struct{
		sfr_t exti0:4;
		sfr_t exit1:4;
		sfr_t exit2:4;
		sfr_t exit3:4;
		sfr_t reserve0:16;
	};
} afio_exticr_t;

extern afio_exticr_t * AFIO_EXTICR;//=(afio_exticr_t *)(AFIO_BASE_ADR+AFIO_EXTICR1_OFS);

typedef union{
	sfr_t mapr2;
	struct{
		sfr_t reserved0:5;
		sfr_t tim9_remap:1;
		sfr_t tim10_remap:1;
		sfr_t tim11_remap:1;
		sfr_t tim13_remap:1;
		sfr_t tim14_remap:1;
		sfr_t fsmc_nadv:1;
		sfr_t reserved1:21;
	};
} afio_mapr2_t;

extern afio_mapr2_t * AFIO_MAPR2;//=(afio_mapr2_t *)(AFIO_BASE_ADR+AFIO_MAPR2_OFS);

// port
#define GPIOA 0
#define GPIOB 1
#define GPIOC 2

// mode broche gpio champ MODE
#define GPIO_MODE_INP 0
#define GPIO_MODE_OUTP_10M 1
#define GPIO_MODE_OUTP_2M 2
#define GPIO_MODE_OUTP_50M 3
// configuration gpio champ CNF
// modes entrée
#define GPIO_INP_ANALOG 0
#define GPIO_INP_FLOAT 1
#define GPIO_INP_PULL 2
// modes sortie
#define GPIO_OUTP_PP 0 // push-pull
#define GPIO_OUTP_OD 1 // open drain
#define GPIO_OUTP_ALT_PP 2 // fonction alternative push-pull
#define GPIO_OUTP_ALT_OD 3 // fonction alternative open drain

// configuration
#define OUTPUT_PP_SLOW ((GPIO_OUTP_PP<<2)|GPIO_MODE_OUTP_2M)
#define OUTPUT_PP_MED ((GPIO_OUTP_PP<<2)|GPIO_MODE_OUTP_10M)
#define OUTPUT_PP_FAST ((GPIO_OUTP_PP<<2)|GPIO_MODE_OUTP_50M)
#define OUTPUT_OD_SLOW ((GPIO_OUTP_OD<<2)|GPIO_MODE_OUTP_2M)
#define OUTPUT_OD_MED ((GPIO_OUTP_OD<<2)|GPIO_MODE_OUTP_10M)
#define OUTPUT_OD_FAST ((GPIO_OUTP_OD<<2)|GPIO_MODE_OUTP_50M)
#define INPUT_FLOAT (GPIO_MODE_INP|(GPIO_INP_FLOAT<<2))
#define INPUT_PULL  (GPIO_MODE_INP|(GPIO_INP_PULL<<2))
#define INPUT_ANALOG (GPIO_MODE_INP|(GPIO_INP_ANALOG<<2))

// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config);

#endif // GPIO_H
