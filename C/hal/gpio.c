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

