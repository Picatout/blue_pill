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
 #include "../include/ascii.h"
 #include "tvout.h"

void gdi_clear_screen();

void gdi_scroll_up();

void gdi_new_line();

void gdi_put_sprite(int x, int y, int w, int h, const char * sprite);

void gdi_putc(unsigned char c);

 
 #endif //GDI_H
 
