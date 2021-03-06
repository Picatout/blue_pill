/*
 * Description: démo faisant clignoté la LED verte de la carte blue pill.
 *    Cette version utilise le core timer pour générer un délais 1 millisonde.
 * Auteur: PICATOUT
 * Date: 2018-08-20
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 *  2018-08-30, blink_v2 version amélioré de blink
 * 		clock HSE + PLL Fsys= 72Mhz
 *      Utilisation du core timer pour créer un délais 1 milliseconde.
 *  2018-09-16,  suppression de config_systicks() qui était inutile.
 * 
 */
 
#include "stm32f103c8.h"
#include "gen_macros.h"
#include "blue_pill.h"

// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
	 // active l'oscillateur externe
	RCC_CR|=1<<RCC_CR_HSEON;
	 // attend que l'oscillateur soit prêt
   while (! (RCC_CR & (1<<RCC_CR_HSERDY)));
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
    // active le PLL
    RCC_CR|=1<<RCC_CR_PLLON;
    // Attend que le PLL soit prêt
    while (! (RCC_CR & (1<<RCC_CR_PLLRDY)));
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR|=WAIT_2_CY;
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR|=PLL_CLK<<RCC_CFGR_SW;
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR|=PPRECLK_DIV2;
}

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8 
// valeur:  72000000/8/1000=9000
#define MSEC_DLY 9000
static void millisec(){
	STK_LOAD=MSEC_DLY;
	STK_VAL=MSEC_DLY;
	STK_CTRL|=1<<STK_ENABLE;
	while (!(STK_CTRL&(1<<STK_COUNTFLAG)));
	STK_CTRL&=~(1<<STK_ENABLE);
}

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

// délais en millisecondes
inline static void delay(unsigned dly){
	for (;dly;dly--)millisec();
}

// pour une période de 1 seconde
#define RATE 500 // millisecondes
void main(void){
	set_sysclock();
	port_c_setup();
	while (1){
		led_off();
		delay(RATE);
		led_on();
		delay(RATE);
	}
}
