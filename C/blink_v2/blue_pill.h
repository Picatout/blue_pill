/*
 * Définitions spécifique à la carte blue pill
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-30
 * Licence: GPLv3
 * revision:
 */

#if  !defined(BLUE_PILL_H)
#define  BLUE_PILL_H

// cristal 8Mhz
#define HSI_FREQ  8000000 
// cristal 32768 hertz installé
#define OSC32_PRESENT 1
// LED verte sur PC13
#define LED_GPIO GPIOC
#define LED_PIN (13)
#define GRN_LED (1<<LED_PIN)

#endif // BLUE_PILL_H

