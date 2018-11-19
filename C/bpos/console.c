/*
 * Description: interface avec la console
 * Auteur: PICATOUT
 * Date: 2018-10-06
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

//#include "../include/usart.h"
#include "console.h"
#include "svcall.h"
#include "gdi.h"

console_t con;


static void queue_insert(char c){
		con.queue[con.head++]=c;
		con.head&=CON_QUEUE_SIZE-1;
}

static char queue_getc(){
	char c=0;
	if (con.tail!=con.head){
		c=con.queue[con.tail++];
		con.tail&=CON_QUEUE_SIZE-1;
	}
	return c;
}

void con_queue_flush(){
	con.tail=con.head=0;
}

static void vt_putc(char c){
	usart_putc(SERIAL_USART,c);
}

static void vt_del_back(){
	con.putc(BS);
	con.putc(SPACE);
	con.putc(BS);
}

static void vt_esc_seq(){
	con.putc(ESC);
	con.putc('[');
}


// vide l'écran de la console
static void vt_cls(){
	vt_esc_seq();
	con.putc('2');
	con.putc('J');
}

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
static void vt_clear_line(unsigned n){
	vt_esc_seq();
	con.putc('2');
	con.putc('K');
	while (n){con.putc(BS);n--;}
}

// interruption serial console
void SERIAL_handler(){
	if ((con.dev==SERIAL) && (SERIAL_USART->SR&USART_SR_RXNE)){
		con.insert(SERIAL_USART->DR);
	}
}

void con_select(console_dev_t dev){
	con_queue_flush();
	con.dev=dev;
	if (dev==LOCAL){
		con.putc=gdi_putc;
		con.cls=gdi_clear_screen;
		con.delete_back=gdi_del_back;
	}else{
		con.putc=vt_putc;
		con.cls=vt_cls;
		con.delete_back=vt_del_back;
	}
}

void console_init(console_dev_t dev){
	// activation clock USART2
	RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
	//configure USART pins
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
	// PA0 -> CTS input   (floating)
	// PA1 -> RTS output  (push-pull)
	// PA2 -> TX  output (push-pull)
	// PA3 -> RX input (floating)
	usart_set_baud(SERIAL_USART,115200);
	SERIAL_PORT->CR[0]&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
	SERIAL_PORT->CR[0]|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
	SERIAL_USART->CR1|=USART_CR1_TE|USART_CR1_RE|USART_CR1_RXNEIE;
	SERIAL_USART->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
	set_int_priority(IRQ_SERIAL,7);
	enable_interrupt(IRQ_SERIAL);
	SERIAL_USART->CR1|=USART_CR1_UE;
	con.getc=queue_getc;
	con.insert=queue_insert;
	con_select(dev);
}

// envoie d'un caractère à la console
void conout(char c){
	con.putc(c);
}


// réception d'un caractère de la console
char conin(){
	return con.getc();
}

// imprime un chaîne sur la console
void print(const char *str){
	while (*str) {con.putc(*str++);}
}

// efface le caractère à gauche du curseur
void delete_back(){
	con.delete_back();
}

static void beep(){
}

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
			c=con.getc();
			switch(c){
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
				con.putc(c);
				break;
				case CTRL_X:
				case CTRL_U:
				while (line_len){con.delete_back();line_len--;}
				//con.clear_line(line_len);
				//line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
					con.delete_back();
					line_len--;
				}
				break;
				case BS:
				if (line_len){
					con.delete_back();
					line_len--;
				}
				break;
				case CTRL_E:
				con.cls();
				line_len=0;
				break;
				case TAB:
				c=SPACE;
				default:
				if ((line_len<buf_len) && (c>=32)){
					buffer[line_len++]=c;
					con.putc(c);
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
// base  numérique
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
	if (pos==12){fmt[pos--]='0';}
	fmt[pos--]='x';
	fmt[pos--]='0';
	fmt[pos]=' ';
	print(&fmt[pos]);
}

void cls(){
	con.cls();
}
