/*
 * Description: Démonstration configuration GPIO
 * 	L'objectif est de faire clignoter la LED verte qui est sur la carte.
 * Auteur: PICATOUT
 * Date: 2018-08-31
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */
 
#include "../include/stm32f103c8.h"

#define LED_PIN (13)
#define GRN_LED (1<<LED_PIN)
//#define DEFAULT_PORT_CNF 0x44444444
#define CNF_MASK 0xF
#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
	RCC_APB2ENR|=1<<GPIOC_EN;
	GPIOC_CRH=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
}

inline static void led_on(){
	GPIOC_BRR=GRN_LED;
}

inline static void led_off(){
	GPIOC_BSRR=GRN_LED;
}

inline static void delay(unsigned dly){
	unsigned i;
	for (i=dly;i;i--);
}


#define RATE 400000
void main(void){
	port_c_setup();
	while (1){
		led_off();
		delay(RATE);
		led_on();
		delay(RATE);
	}
}
