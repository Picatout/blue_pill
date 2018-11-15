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
void config_pin(gpio_t* port, unsigned pin, unsigned config){
	uint8_t shift;
	shift=(pin&7)<<2;
	port->CR[pin>>3]&=~(15<<shift);
	port->CR[pin>>3]|=config<<shift;
}

int read_pin(gpio_t* port, unsigned pin){
	return port->IDR&(1<<pin);
}

void write_pin(gpio_t* port, unsigned pin, int value){
	value?(port->ODR|=(1<<pin)):(port->ODR&=~(1<<pin));
}

void toggle_pin(gpio_t* port, unsigned pin){
	port->ODR^=(1<<pin);
}
