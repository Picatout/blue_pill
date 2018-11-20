/*
 * Description: API affichage graphique
 * Auteur: PICATOUT
 * Date: 2018-11-06
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * Description: Le clavier est utilisé sans le signal clock. La ligne data étant simplement envoyé à la broche RX d'un périphérique USART.
 * 		Le signal envoyé par le clavier est à 12500 BAUD avec parité. Le USART1 est utilisé.
 * revisions:
 * 
 */

#include "gdi.h"

// position  du curseur texte.
static int cursor_x, cursor_y;
static int cursor_visible=0;
static int cursor_blink=0;

static void hide_cursor(){
	if (cursor_visible){
		disable_interrupt(IRQ_CURSOR_BLINK);
		gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
		cursor_visible=0;
	}
}

void gdi_clear_screen(){
	int i;
	hide_cursor();
	for (i=0;i<(ROW_SIZE*VRES);){
		video_buffer[i++]=0;
	}
	if (cursor_blink){
		enable_interrupt(IRQ_CURSOR_BLINK);
	}
}

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
	int i,j=0;
	hide_cursor();
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
		video_buffer[i++]=0;
	}
	if (cursor_blink){
		enable_interrupt(IRQ_CURSOR_BLINK);
	}
}

// avance le curseur texte au début 
// de la ligne suivante.
void gdi_new_line(){
	hide_cursor();
	
	cursor_x=0;
	cursor_y+=CHAR_HEIGHT;
	if (cursor_y>(VRES-CHAR_HEIGHT)){
		cursor_y=VRES-CHAR_HEIGHT;
		gdi_scroll_up();
	}
	if (cursor_blink){
		enable_interrupt(IRQ_CURSOR_BLINK);
	}
}

void gdi_cursor_left(){
	hide_cursor();
	if (!(cursor_x|cursor_y)) return;
	if (cursor_x>=CHAR_WIDTH){
		cursor_x-=CHAR_WIDTH;
	}else if (cursor_y) {
		cursor_x=CHAR_WIDTH*(CHARS_PER_LINE-1);
		cursor_y-=CHAR_HEIGHT;
		if (cursor_y<0) cursor_y=0;
	}
	if (cursor_blink){
		enable_interrupt(IRQ_CURSOR_BLINK);
	}
}


void gdi_bit_op(int x, int y, bitop_e op){
	uint16_t bit;
	int offset=y*ROW_SIZE+(x>>4);
	bit=1<<(15-(x&15));
	switch (op){
	case BLACK_BIT:
		video_buffer[offset]&=~bit;
		break;
	case WHITE_BIT:
		video_buffer[offset]|=bit;
		break;
	case XOR_BIT:
		video_buffer[offset]^=bit;
		break;
	}
}

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
		for (c=0;c<w;c++){
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				gdi_bit_op(c+x,r+y,op);
			}
		}
	}
}

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
			if (!mask){
				sprite++;
				mask=128;
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				if (sprite[r]&mask){
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]|=(1<<(15-((c+x)&15)));
				}else{
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]&=~(1<<(15-((c+x)&15)));
				}
				//bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
				//video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]|=bit;
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}

void gdi_del_back(){
	gdi_cursor_left();
	hide_cursor();
	gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
	if (cursor_blink){
		enable_interrupt(IRQ_CURSOR_BLINK);
	}
}

// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void gdi_putc(char c){
		hide_cursor();
		switch (c){
		case '\n':
		case CR:
			gdi_new_line();
			break;
		case BS:
			gdi_del_back();
			break;
		default:
			if (c<FONT_SIZE){
				gdi_put_sprite(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,(const unsigned char *)&font6x8[c]);
				cursor_x+=CHAR_WIDTH;
				if (cursor_x>(HRES-CHAR_WIDTH)){
					gdi_new_line();
				}
			}
			break;
		}//switch
		if (cursor_blink){
			enable_interrupt(IRQ_CURSOR_BLINK);
		}
}

void gdi_print(const char *str){
	while (*str) gdi_putc(*str++);
}

void gdi_clrln(){
	int i;
	cursor_x=0;
	for (i=cursor_y*ROW_SIZE;i<cursor_y*ROW_SIZE*8;i++){
		video_buffer[i]=0;
	}
}

void gdi_text_cursor(int enable){
	if (enable){
		// activation clock CURSOR_TMR
		RCC->CURSOR_RCC_ENR|=CURSOR_RCC_EN_BIT; 
		CURSOR_TMR->ARR=FAPB1/1000/2;
		CURSOR_TMR->PSC=1000;
		CURSOR_TMR->CR1=BIT0|BIT7; // ARPE
		CURSOR_TMR->DIER=BIT0; // UIE
		set_int_priority(IRQ_CURSOR_BLINK,15);
		CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
		enable_interrupt(IRQ_CURSOR_BLINK);
		cursor_blink=1;
	}else{
		disable_interrupt(IRQ_CURSOR_BLINK);
		if (cursor_visible){
			gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
			cursor_visible=~cursor_visible;
		}
		CURSOR_TMR->DIER&=~BIT0;
		cursor_blink=0;
	}
}

// interruption clignotement
// curseur texte
void CURSOR_blink_handler(){
	//CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
	if (CURSOR_TMR->SR&BIT0){ // UIF
		CURSOR_TMR->SR&=~BIT0;
		gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
		cursor_visible=~cursor_visible;
	}
}

