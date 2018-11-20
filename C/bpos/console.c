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
#include "vt100.h"

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

static const char PROMPT[]=" OK\n";

void con_select(console_dev_t dev){
	con_queue_flush();
	con.dev=dev;
	if (dev==LOCAL){
		con.putc=gdi_putc;
		con.cls=gdi_clear_screen;
		con.delete_back=gdi_del_back;
		gdi_text_cursor(1);
	}else{
		gdi_text_cursor(0);
		con.putc=vt_putc;
		con.cls=vt_cls;
		con.delete_back=vt_del_back;
	}
	print(PROMPT);
}

void console_init(console_dev_t dev){
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
