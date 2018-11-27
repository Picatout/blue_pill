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
 
 #ifndef GDI_H
 #define GDI_H
 
 #include "../include/blue_pill.h"
// #include "../include/ascii.h"
 #include "tvout.h"

#define GDI_SCREEN_WIDTH CHARS_PER_LINE
#define GDI_SCREEN_HEIGHT LINES_PER_SCREEN

typedef enum BIT_OP{
	BLACK_BIT,WHITE_BIT,XOR_BIT
} bitop_e;


void gdi_clear_screen();

void gdi_bit_op(int x, int y, bitop_e op);

void gdi_box(int x, int y, int w, int h, bitop_e op);

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char * sprite);

void gdi_scroll_up(unsigned n);

void gdi_clear_rows(int y, int count);


 #endif //GDI_H
 
