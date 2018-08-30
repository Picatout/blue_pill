/*
 * fichier d'entête définissant des constantes pour les registres 
 * spéciaux  du µC stm32f103c8
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-29
 * Licence: GPLv3
 * revision:
 */


// constantes pour les registres spéciaux du µC STM32F103C8
#include <stdint.h>

#define __SFR__ (uint32_t*)

// adresse de base registres reset et clock control
#define RCC_BASE 0x40021000
#define RCC_CR  __SFR__(RCC_BASE) // registre de contrôle clock
#define RCC_CFGR __SFR__(RCC_BASE+4) // registre de configuration clock
#define RCC_CIR __SFR__(RCC_BASE+8) // registre d'interruption clock
#define RCC_APB2 __SFR__(RCC_BASE+12) // réinitialisation périphériques
#define RCC_APB1 __SFR__(RCC_BASE+16) // réinitialisation périphériques
#define RCC_AHBENR __SFR__(RCC_BASE+20) // activation des clock périphérique sur AHB
#define RCC_APB2ENR __SFR__(RCC_BASE+24) // activation des clock périphérique sur APB2
#define RCC_APB1ENR __SFR__(RCC_BASE+28) // activation des clock périphérique sur APB1
#define RCC_BDCR __SFR__(RCC_BASE+32) // domaine ram sauvegarde contrôle
#define RCC_CSR __SFR__ (RCC_BASE+36) // contrôle et status

/*********
* PORT C *
**********/
// adresse de base registres du port C
#define GPIOC_BASE 0X40011000 
// registres port C
#define GPIOC_CRL __SFR__(GPIOC_BASE)  // configuartion bits 0-7
#define GPIOC_CRH __SFR__(GPIOC_BASE+4) // configuration bits 8-15
#define GPIOC_IDR __SFR__(GPIOC_BASE+8) // input data
#define GPIOC_ODR __SFR__(GPIOC_BASE+12) // output data
#define GPIOC_BSRR __SFR__(GPIOC_BASE+16) // bit set/reset 
#define GPIOC_BRR  __SFR__(GPIOC_BASE+20) // bit reset
#define GPIOC_LCKR __SFR__(GPIOC_BASE+24) // config lock 
#define GPIOC_EN  (1<<4) // bit d'activation 
#define GPIOC_RST (1<<4) // bit reset
