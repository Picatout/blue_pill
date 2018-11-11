/*
 * Description: tick timer configuration
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-11-10
 * Licence: GPLv3
 * revision:
 */

#ifndef SYSTICK_H
#define SYSTICK_H

extern volatile unsigned ticks;
extern volatile unsigned timer;

void config_systicks();
void pause(unsigned msec);

#endif // SYSTICK_H
