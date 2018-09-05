/*
 * Description: interface pour le gestionnaire d'interruptions.
 * Auteur: PICATOUT
 * Date: 2018-09-03
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef NVIC_H
#define NVIC_H

void enable_interrupt(unsigned irq);
void disable_interrupt(unsigned irq);
void set_int_priority(unsigned irq, unsigned priority);

#endif // NVIC_H

