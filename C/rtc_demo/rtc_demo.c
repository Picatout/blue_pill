/*
 * Description: RTC (Real Time Clock)  demo
 * Auteur: PICATOUT
 * Date: 2018-09-10
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/rtc.h"
#include "../include/blue_pill.h"

static volatile unsigned ticks=0;
static volatile unsigned timer=0;

// interruption coretimer
void __attribute__((__interrupt__)) systick_int(){
	ticks++;
	if (timer) {timer--;}
}

// interruption RTC
void __attribute__((__interrupt__)) RTC_handler(){
	// n'agit que sur les interruption SECF
	if (RTC_CRL&(1<<RTC_CRL_SECF)){	
		GPIOC_ODR^=GRN_LED;  // bascule état LED
		RTC_CRL&=~(1<<RTC_CRL_SECF); // RAZ indicateur d'interruption
	}
}


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
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
	STK_LOAD=MSEC_DLY-1;
	STK_CTRL=(1<<STK_TICKINT)|(1<<STK_ENABLE);
}

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
	RCC_APB2ENR|=1<<GPIOC_EN;
	GPIOC_CRH=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
	GPIOC_ODR^=GRN_LED; // éteint LED
}



#define HALF_PERIOD 1000
void main(){
		set_sysclock();
		config_systicks();
		port_c_setup();
		enable_rtc(HALF_PERIOD,RTC_SECIE);
		enable_interrupt(3); // active l'interruption RTC
		_sleep_on_exit();
		asm volatile ("wfi");
//		while (1){
			// tombe en sommeil en attendant la prochaine interruption
//			asm volatile ("wfi");
//		}
}

