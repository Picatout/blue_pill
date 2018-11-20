/*
 * Description: interface sériel avec émulateur VT100
 * Auteur: PICATOUT
 * Date: 2018-11-19
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/blue_pill.h"
#include "vt100.h"
#include "console.h"

void vt_init(){
	usart_open_channel(VT_USART,115200,PARITY_NONE,USART_DIR_BIDI,FLOW_HARD);
}

void vt_putc(char c){
	usart_putc(VT_USART,c);
}

void vt_del_back(){
	usart_putc(VT_USART,BS);
	usart_putc(VT_USART,SPACE);
	usart_putc(VT_USART,BS);
}

static void vt_esc_seq(){
	usart_putc(VT_USART,ESC);
	usart_putc(VT_USART,'[');
}


// vide l'écran de la console
void vt_cls(){
	vt_esc_seq();
	usart_putc(VT_USART,'2');
	usart_putc(VT_USART,'J');
}

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void vt_clear_line(unsigned n){
	vt_esc_seq();
	usart_putc(VT_USART,'2');
	usart_putc(VT_USART,'K');
	while (n){usart_putc(VT_USART,BS);n--;}
}

// vérifie si le terminal est prêt
int vt_ready(){
	return !(VT_PORT->IDR&VT_CTS_BIT);
}

// interruption serial console
void VT_handler(){
	if ((con.dev==SERIAL) && (VT_USART->SR&USART_SR_RXNE)){
		con.insert(VT_USART->DR);
	}
}

