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


//#define LED_PIN 13
//#define GRN_LED BIT13
#define LED_PORT PORTC

// interruption RTC
void RTC_handler(){
	// n'agit que sur les interruption SECF
	if (RTC->CRL&RTC_CRL_SECF){	
		LED_PORT->ODR^=GRN_LED;  // bascule état LED
		RTC->CRL&=~RTC_CRL_SECF; // RAZ indicateur d'interruption
	}
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
	 // active l'oscillateur externe
	RCC->CR|=RCC_CR_HSEON;
	 // attend que l'oscillateur soit prêt
   while (!(RCC->CR&RCC_CR_HSERDY));
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 8 
     // pour une fréquence  Fsysclk de 64 Mhz
    RCC->CFGR|=RCC_CFGR_PLLSRC_HSE|(PLLMUL<<RCC_CFGR_PLLMUL_POS);
    // active le PLL
    RCC->CR|=RCC_CR_PLLON;
    // Attend que le PLL soit prêt
    while (!(RCC->CR&RCC_CR_PLLRDY));
    // ajoute délais d'accès à la mémoire flash
    // active le prefetch buffer
    FLASH->ACR|=(WAIT_2_CY<<FLASH_ACR_LATENCY_POS)|FLASH_ACR_PRFTBE;
	// La fréquence maximale pour APB1 doit-être de <=36 Mhz
	// donc divise SYSCLK/2
    // Sélectionne le PLL comme source pour SYSCLK dans CR
	RCC->CFGR|=(RCC_CFGR_PPREx_DIV2<<RCC_CFGR_PPRE1_POS)|(RCC_CFGR_SW_PLL<<RCC_CFGR_SW_POS);
}



#define HALF_PERIOD 1000
void main(){
		set_sysclock();
		config_systicks();
		config_pin(LED_PORT,LED_PIN,OUTPUT_OD_SLOW);
		enable_rtc(HALF_PERIOD,RTC_SECIE);
		enable_interrupt(IRQ_RTC); // active l'interruption RTC
		_sleep_on_exit();
		asm volatile ("wfi");
		while (1);
}

