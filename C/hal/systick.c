/*
 * Description: tick timer configuration
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-11-10
 * Licence: GPLv3
 * revision:
 */

#include "../include/blue_pill.h"


volatile unsigned ticks=0;
volatile unsigned timer=0;


// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
#define MSEC_DLY FCLK/8/1000
void config_systicks(){
	set_int_priority(IRQ_STK,9);
	*SYST_RVR=MSEC_DLY-1;
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
}



void pause(unsigned msec){
	timer=msec;
	while (timer);
}


// interruption coretimer
void STK_handler(){
	ticks++;
	if (timer) {timer--;}
}

