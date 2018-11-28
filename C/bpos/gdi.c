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

void gdi_clear_screen(){
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
		video_buffer[i++]=0;
	}
}

// glisse vers le haut de n lignes.
void gdi_scroll_up(unsigned n){
	int i,j=0;
	if (n>=VRES){gdi_clear_screen();return;}
	for (i=n*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	// efface bas de l'écran
	for (i=ROW_SIZE*VRES-n*ROW_SIZE;i<(ROW_SIZE*VRES);){
		video_buffer[i++]=0;
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

void gdi_clear_rows(int y, int count){
	int i,limit;
	if (y<0){y=0;}
	limit=(y+count)*ROW_SIZE;
	if (limit>(HRES*VRES)){limit=HRES*VRES;}
	for (i=y*ROW_SIZE;i<limit;i++){
		video_buffer[i]=0;
	}
}

void gdi_rect(int x, int y, int w, int h, bitop_e op){
	int i;
	//ligne horizontales
	for (i=x;i<(x+w);i++){
			gdi_bit_op(i,y,op);
			gdi_bit_op(i,y+h-1,op);
	}
    // lignes verticales
	for (i=y+1;i<(y+h-1);i++){
			gdi_bit_op(x,i,op);
			gdi_bit_op(x+w-1,i,op);
	}
}

