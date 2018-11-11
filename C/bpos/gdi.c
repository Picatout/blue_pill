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

void gdi_clear_screen(){
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
		video_buffer[i++]=0;
	}
}

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
	int i,j;
	j=0;
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
		video_buffer[i++]=0;
	}
}

// avance le curseur texte au début 
// de la ligne suivante.
void gdi_new_line(){
	cursor_x=0;
	cursor_y+=CHAR_HEIGHT;
	if (cursor_y>(VRES-CHAR_HEIGHT)){
		cursor_y=VRES-CHAR_HEIGHT;
		gdi_scroll_up();
	}
}

void gdi_cursor_left(){
	if (!(cursor_x|cursor_y)) return;
	if (cursor_x>=CHAR_WIDTH){
		cursor_x-=CHAR_WIDTH;
	}else if (cursor_y) {
		cursor_x=CHAR_WIDTH*(CHARS_PER_LINE-1);
		cursor_y-=CHAR_HEIGHT;
		if (cursor_y<0) cursor_y=0;
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
				bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
				video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]^=bit;
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}


// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void gdi_putc(unsigned char c){
		switch (c){
		case CR:
			gdi_new_line();
			break;
		case BS:
			gdi_cursor_left();
			gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
			break;
		default:
			if (c<FONT_SIZE){
				gdi_put_sprite(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,&font6x8[c]);
				cursor_x+=CHAR_WIDTH;
				if (cursor_x>(HRES-CHAR_WIDTH)){
					gdi_new_line();
				}
			}
			break;
		}//switch
}

