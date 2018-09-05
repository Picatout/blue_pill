/*
 * Description: interface pour le gestionnaire d'interruptions.
 * Auteur: PICATOUT
 * Date: 2018-09-03
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include <stdint.h>
#include "../include/stm32f103c8.h"
#include "../include/nvic.h"




typedef volatile uint32_t* t_iser;
void enable_interrupt(unsigned irq){
	t_iser iser=(t_iser)(NVIC_ISER0_ADR);
	if (irq>LAST_IRQ) return ;
	iser[irq/32]|=1<<(irq%32);
	
}

typedef volatile uint32_t* t_icer;
void disable_interrupt(unsigned irq){
	t_icer icer=(t_icer)(NVIC_ICER0_ADR);
	if (irq>LAST_IRQ) return ;
	icer[irq/32]&=~(1<<(irq%32));
	
}

/*
typedef volatile uint32_t* t_ipr;

void set_int_priority(unsigned irq, unsigned priority){
	t_ipr ipr=(t_ipr)NVIC_IPR0_ADR;
	unsigned slot;
	
	if (irq>LAST_IRQ) return;
	slot=(irq%4)*8;
	ipr[irq/4]&=~(0xff<<slot);
	priority=(priority&15)<<4; 
	ipr[irq]|=priority<<slot;
}
*/

typedef uint8_t* t_ipr;

void set_int_priority(unsigned irq, unsigned priority){
	t_ipr ipr=(t_ipr)NVIC_IPR0_ADR;
	if (irq>LAST_IRQ) return;
	ipr[irq]=(priority&15)<<4;
}
