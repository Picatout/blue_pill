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
//#define NTSC
#define PAL

#define HRES (320)
#ifdef NTSC
	#define HFREQ (15734)
	#define VIDEO_DELAY (1050)
	#define VFREQ (60)
	#define HLINES (525)
	#define HSYNC (4.7e-6) //µsec
	#define BACK_PORCH (4.7e-6)
	#define FIELD_END (271)
	#define TOP_LINE (36)
	#define VRES (224)
#else
	#define HFREQ (15625)
	#define VIDEO_DELAY (1000)
	#define VFREQ (50)
	#define HLINES (625)
	#define HSYNC (4.7e-6) //µsec
	#define BACK_PORCH (5.7e-6)
	#define FIELD_END (321)
	#define TOP_LINE 60
	#define VRES (240)
#endif
#define CHARS_PER_LINE (HRES/CHAR_WIDTH)
#define LINES_PER_SCREEN (VRES/CHAR_HEIGHT)
#define ROW_SIZE (HRES/16)

extern uint16_t video_buffer[ROW_SIZE*VRES];
extern uint32_t *video_bb;

void tvout_init();


#endif //TVOUT_H
