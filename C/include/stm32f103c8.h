/*
 * fichier d'entête définissant des constantes pour les registres 
 * spéciaux  du µC stm32f103c8
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-29
 * Licence: GPLv3
 * revision:
 * 2018-09-01: Modification de la macro _sfr(x) pour ajouter l'attribut volatile
 */

// REF: STMicro electronics documents RM0008 (reference manual) et DS5319 (datasheet)
// constantes pour les registres spéciaux du µC STM32F103C8

#ifndef STM32F103C8_H
#define STM32F103C8_H

#include <stdint.h>
#include "core.h"
#include "rcc.h"
#include "gpio.h"
#include "rtc.h"
#include "pwr.h"
#include "flash.h"
#include "timer.h"
#include "spi.h"  
#include "dma.h"
#include "flash.h"
#include "usart.h"
#include "nvic.h"
#include "systick.h"
#include "pwr.h"

#define RAM_SIZE 0x5000
#define FLASH_SIZE 0x20000  // 128K  (64K non publié, inaccessible à STLINK v2)
#define PROG_SIZE 0x10000   // 64K  (espace flash visible par STLINK v2)
#define RAM_START 0x20000000 
#define RAM_END   0x20005000


#endif // STM32F103C8_H
