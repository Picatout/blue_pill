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

// cristal 8Mhz
#define HSI_FREQ  8000000 
#define FCLK 72000000U
#define FAHB  FCLK
#define FAPB2 FCLK
#define FAPB1 (FCLK/2)
// cristal 32768 hertz installé
#define LSE_PRESENT 1
#define LSE_FREQ 32768
// LED verte sur PC13
#define LED_GPIO GPIOC
#define LED_PIN (13)
#define GRN_LED (1<<LED_PIN)


#endif // BLUE_PILL_H

