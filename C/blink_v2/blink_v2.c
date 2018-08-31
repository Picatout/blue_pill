/*
 * Description: démo faisant clignoté la LED verte de la carte blue pill.
 * Auteur: PICATOUT
 * Date: 2018-08-20
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 *  2018-08-30, blink_v2 version amélioré de blink
 * 		clock HSE + PLL Fsys= 72Mhz
 *      LED contrôlée par PWM
 */
 
#include "stm32f103c8.h"
#include "blue_pill.h"
#include "clock.h"
#include "pwm.h"

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
	RCC_APB2ENR|=GPIOC_EN;
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

/*
 * pour que la boucle de délais soit
 * de même durée avec "make build_O1'
 * qu'avec "make build" le symbole
 * -DOPTMZ=4 est défini dans le
 * makefile
 */
 
#define RATE 400000*OPTMZ
void main(void){
	port_c_setup();
	while (1){
		led_off();
		delay(RATE);
		led_on();
		delay(RATE);
	}
}
