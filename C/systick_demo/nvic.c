/*
 * Description: interface pour le gestionnaire d'interruptions.
 * Auteur: PICATOUT
 * Date: 2018-09-03
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "nvic.h"


void _set_int_priority(unsigned irq, unsigned priotiry){
	_ipr(irq)&=~(0xff*(irq%4));
	_ipr(irq)|=priority*(irq%4)*16;
}
