/*
 * Description: HAL GPIO
 * Auteur: PICATOUT
 * Date: 2018-10-10
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/gpio.h"

gpio_crl_t * GPIOA_CRL=(gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS); 
gpio_crh_t * GPIOA_CRH=(gpio_crh_t*)(GPIOA_BASE_ADR+GPIO_CRH_OFS);
gpio_crl_t *  GPIOA_CR=(gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS);
gpio_idr_t * GPIOA_IDR=(gpio_idr_t *)(GPIOA_BASE_ADR+GPIO_IDR_OFS);
gpio_odr_t * GPIOA_ODR=(gpio_odr_t *)(GPIOA_BASE_ADR+GPIO_ODR_OFS);
gpio_bsrr_t * GPIOA_BSRR=(gpio_bsrr_t *)(GPIOA_BASE_ADR+GPIO_BSRR_OFS);
gpio_brr_t * GPIOA_BRR=(gpio_brr_t *)(GPIOA_BASE_ADR+GPIO_BRR_OFS);
gpio_lckr_t * GPIOA_LCKR=(gpio_lckr_t *)(GPIOA_BASE_ADR+GPIO_LCKR_OFS); 

gpio_crl_t * GPIOB_CRL=(gpio_crl_t *)(GPIOB_BASE_ADR+GPIO_CRL_OFS); 
gpio_crh_t * GPIOB_CRH=(gpio_crh_t *)(GPIOB_BASE_ADR+GPIO_CRH_OFS);
gpio_crl_t *  GPIOB_CR=(gpio_crl_t *)(GPIOB_BASE_ADR+GPIO_CRL_OFS);
gpio_idr_t * GPIOB_IDR=(gpio_idr_t *)(GPIOB_BASE_ADR+GPIO_IDR_OFS);
gpio_odr_t * GPIOB_ODR=(gpio_odr_t *)(GPIOB_BASE_ADR+GPIO_ODR_OFS);
gpio_bsrr_t * GPIOB_BSRR=(gpio_bsrr_t *)(GPIOB_BASE_ADR+GPIO_BSRR_OFS);
gpio_brr_t * GPIOB_BRR=(gpio_brr_t *)(GPIOB_BASE_ADR+GPIO_BRR_OFS);
gpio_lckr_t * GPIOB_LCKR=(gpio_lckr_t *)(GPIOB_BASE_ADR+GPIO_LCKR_OFS); 

gpio_crl_t * GPIOC_CRL=(gpio_crl_t *)(GPIOC_BASE_ADR+GPIO_CRL_OFS); 
gpio_crh_t * GPIOC_CRH=(gpio_crh_t *)(GPIOC_BASE_ADR+GPIO_CRH_OFS);
gpio_idr_t * GPIOC_IDR=(gpio_idr_t *)(GPIOC_BASE_ADR+GPIO_IDR_OFS);
gpio_crl_t * GPIOC_CR=(gpio_crl_t *)(GPIOC_BASE_ADR+GPIO_CRL_OFS);
gpio_odr_t * GPIOC_ODR=(gpio_odr_t *)(GPIOC_BASE_ADR+GPIO_ODR_OFS);
gpio_bsrr_t * GPIOC_BSRR=(gpio_bsrr_t *)(GPIOC_BASE_ADR+GPIO_BSRR_OFS);
gpio_brr_t * GPIOC_BRR=(gpio_brr_t *)(GPIOC_BASE_ADR+GPIO_BRR_OFS);
gpio_lckr_t * GPIOC_LCKR=(gpio_lckr_t *)(GPIOC_BASE_ADR+GPIO_LCKR_OFS); 

afio_evcr_t * AFIO_EVCR=(afio_evcr_t *)(AFIO_BASE_ADR+AFIO_EVCR_OFS);

afio_exticr_t * AFIO_EXTICR=(afio_exticr_t *)(AFIO_BASE_ADR+AFIO_EXTICR1_OFS);

afio_mapr2_t * AFIO_MAPR2=(afio_mapr2_t *)(AFIO_BASE_ADR+AFIO_MAPR2_OFS);


// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
	switch (port){
		case GPIOA:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
		break;
		case GPIOB:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
		break;
		case GPIOC:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
		break;
	}
}

