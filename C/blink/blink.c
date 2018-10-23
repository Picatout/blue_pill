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
 
#include "../include/blue_pill.h"



#define LED_PIN (13)
#define GRN_LED (1<<LED_PIN)
//#define DEFAULT_PORT_CNF 0x44444444
#define CNF_MASK 0xF
#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
void port_c_setup(){
	APB2ENR->fld.iopcen=1;
	GPIOC_CRH->cr=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
}

inline static void led_on(){
	GPIOC_BRR->brr=GRN_LED;
}

inline static void led_off(){
	GPIOC_BSRR->bsrr=GRN_LED;
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
