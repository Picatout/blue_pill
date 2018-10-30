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



// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
	register gpio_crl_t* cr;
	uint8_t shift;
	switch (port){
		case GPIOA:
		cr=(gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS);
		break;
		case GPIOB:
		cr=(gpio_crl_t*)(GPIOB_BASE_ADR+GPIO_CRL_OFS);
		break;
		case GPIOC:
		cr=(gpio_crl_t*)(GPIOC_BASE_ADR+GPIO_CRL_OFS);
		break;
	}
	shift=(pin&7)<<2;
	cr[pin>>3].cr&=~(15<<shift);
	cr[pin>>3].cr|=config<<shift;
}

