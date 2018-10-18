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
#include "../include/gen_macros.h"
#include "../include/stm32f103c8.h"
#include "../include/nvic.h"





void enable_interrupt(unsigned irq){
	sfrp_t iser=(sfrp_t)(NVIC_ISER0_ADR);
	if (irq>LAST_IRQ) return ;
	iser[irq/32]|=1<<(irq%32);
	
}


void disable_interrupt(unsigned irq){
	sfrp_t icer=(sfrp_t)(NVIC_ICER0_ADR);
	if (irq>LAST_IRQ) return ;
	icer[irq/32]&=~(1<<(irq%32));
	
}


typedef volatile uint8_t* ipr_t;
typedef volatile uint8_t* shpr_t;
void set_int_priority(int32_t irq, unsigned priority){
	ipr_t ipr=(ipr_t)NVIC_IPR0_ADR;
	shpr_t shpr=(shpr_t)(SCB_BASE_ADR+24);
	if ((irq>=0) && (irq<=LAST_IRQ)){
		ipr[irq]=(uint8_t)((priority&15)<<4);
	}else if ((irq<0) && (irq>-16)){
		shpr[-(irq+4)]=(uint8_t)((priority&15)<<4);
	}
}
