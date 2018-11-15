/*
 * Définitions spécifique à la carte blue pill
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-30
 * Licence: GPLv3
 * revision:
 * 		2018-09-16, Renommé OSC32_PRESENT en LSE_PRESENT. Ajout de LSE_FREQ
 */

#ifndef  BLUE_PILL_H
#define  BLUE_PILL_H

#include "gen_macros.h"
#include "stm32f103c8.h"

// cristal 14.318181 Mhz
#define HSI_FREQ  14318181U 
#define PLLMUL RCC_CFGR_PLLMUL4
#define FCLK (HSI_FREQ*(PLLMUL+2))
#define FAHB  FCLK
#define FAPB2 FCLK
#define FAPB1 (FCLK/2)
// cristal 32768 hertz installé
#define LSE_PRESENT 1
#define LSE_FREQ 32768
// LED verte sur PC13
#define LED_PORT PORTC
#define LED_PIN (13)
#define LED_ON (0)
#define LED_OFF (1)
#define GRN_LED (1<<LED_PIN)


#endif // BLUE_PILL_H

