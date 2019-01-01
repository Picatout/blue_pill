/*
 * Description: 
 * 		Un système d'exploitation simple, monoprogramme comme CP/M
 *      fonctionnant sur la carte 'blue pill' équipée d'un µC  STM32F103C8T6
 * Auteur: PICATOUT
 * Date: 2018-12-31
 * Copyright Jacques Deschênes, 2018, 2019
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef BPOS_H
#define BPOS_H

#include <stdint.h>
#include "../include/stm32f103c8.h"

extern unsigned int _BSS_START;
extern unsigned int _BSS_END;
extern unsigned int _DATA_ROM_START;
extern unsigned int _DATA_RAM_START;
extern unsigned int _DATA_RAM_END;
extern unsigned int _TPA_START;
extern unsigned int _FLASH_FREE;

// MSP Main Stack Pointer
#define MSP_TOP RAM_END  // MSP top
#define MSP_SIZE 512 // grandeur de la pile MSP
// PSP Program Stack Pointer
#define PSP_TOP (MSP_TOP-MSP_SIZE) 
// grandeur pile PSP
#define PSP_SIZE 2048

// limite région TPA
#define _TPA_TOP (PSP_TOP-PSP_SIZE)

typedef void (*fn)(void);

extern const void* TPA_TOP;
extern void* here;
extern void* ffa;
extern uint32_t proga;

#endif // BPOS_H
