/*
 * Description: générateur NTSC
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-10-26
 * Licence: GPLv3
 * revision:
 */

#ifndef TVOUT_H
#define TVOUT_H

#include "font.h"

// choisir le standard PAL ou NTSC
#define NTSC
//#define PAL

#define CHARS_PER_LINE 80
#define LINES_PER_SCREEN 30

extern uint8_t video_buffer[CHARS_PER_LINE][LINES_PER_SCREEN];


void tvout_init();


#endif //TVOUT_H
