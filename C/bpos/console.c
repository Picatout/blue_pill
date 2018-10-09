/*
 * Description: interface avec la console
 * Auteur: PICATOUT
 * Date: 2018-10-06
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/usart.h"
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
	if (USART2_SR&(1<<USART_SR_RXNE)){
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
		rx_queue.head&=RX_QUEUE_SIZE-1;
	}
}


// envoie d'un caractère à la console
void conout(char c){
	uart_putc(CON,c);
}


// réception d'un caractère de la console
char conin(){
	char c=0;
	if (rx_queue.head!=rx_queue.tail){
		c=rx_queue.queue[rx_queue.tail++];
		rx_queue.tail&=RX_QUEUE_SIZE-1;
	}
	return c;
}

// imprime un chaîne sur la console
void print(const char *str){
	while (*str) {conout(*str++);}
}

void beep(){
}

// efface le caractère à gauche du curseur
void delete_back(){
	conout(BS);
	conout(SPACE);
	conout(BS);
}

void esc_seq(){
	conout(ESC);
	conout('[');
}

// vide l'écran de la console
void cls(){
	esc_seq();
	conout('2');
	conout('J');
}

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
	esc_seq();
	conout('2');
	conout('K');
	while (n){conout(BS);n--;}
}

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
			c=conin();
			switch(c){
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
				conout(c);
				break;
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
					delete_back();
					line_len--;
				}
				break;
				case BS:
				if (line_len){
					delete_back();
					line_len--;
				}
				break;
				case CTRL_E:
				cls();
				line_len=0;
				break;
				case TAB:
				c=SPACE;
				default:
				if ((line_len<buf_len) && (c>=32)){
					buffer[line_len++]=c;
					conout(c);
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
	return line_len;
}

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
	if (sign<0) {fmt[pos--]='-';}
	fmt[pos]=' ';
	print(&fmt[pos]);
}

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==13){fmt[pos--]='0';}
	fmt[pos--]='x';
	fmt[pos--]='0';
	fmt[pos]=' ';
	print(&fmt[pos]);
}

