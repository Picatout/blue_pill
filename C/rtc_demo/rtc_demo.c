/*
 * Description: RTC (Real Time Clock)  demo
 * Auteur: PICATOUT
 * Date: 2018-09-10
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/blue_pill.h"

static volatile unsigned ticks=0;
static volatile unsigned timer=0;

// interruption coretimer
void /* __attribute__((__interrupt__))*/ SYSTICK_handler(){
	ticks++;
	if (timer) {timer--;}
}

// interruption RTC
void /* __attribute__((__interrupt__))*/ RTC_handler(){
	// n'agit que sur les interruption SECF
	if (RTC_CRL->fld.secf){	
		GPIOC_ODR->odr^=GRN_LED;  // bascule état LED
		RTC_CRL->fld.secf=0; // RAZ indicateur d'interruption
	}
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
	 // active l'oscillateur externe
	RCC_CR->fld.hseon=1;
	 // attend que l'oscillateur soit prêt
   while (!RCC_CR->fld.hserdy);
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR->cfgr|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
    // active le PLL
    RCC_CR->fld.pllon=1;
    // Attend que le PLL soit prêt
    while (!RCC_CR->fld.pllrdy);
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR->fld.latency=WAIT_2_CY;
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR->fld.sw=PLL_CLK;
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR->fld.ppre1=PPRECLK_DIV2;
}

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
	SYST_RVR=MSEC_DLY-1;
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
}

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
	APB2ENR->fld.iopcen=1;
	GPIOC_CRH->cr=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
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

