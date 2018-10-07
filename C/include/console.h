/*
 * Description: interface avec la console
 * Auteur: PICATOUT
 * Date: 2018-10-06
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef CONSOLE_H
#define CONSOLE_H

#include "ascii.h"

#define CON USART2 // console utilise USART2


#define RX_QUEUE_SIZE 32
typedef struct{
	volatile char queue[RX_QUEUE_SIZE];
	volatile unsigned head;
	volatile unsigned tail;
} rx_queue_t;


// envoie d'un caractère à la console
void conout(char c);
// réception d'un caractère de la console
// retourne 0 s'il n'y a pas de caractère.
char conin();
// imprime un chaîne sur la console
void print(const char *str);
// efface le caractère à gauche du curseur
void delete_back();
// vide l'écran de la console
void cls();
// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n);
// reçoit une ligne de texte de la console
// retourne la longueur de la ligne.
unsigned read_line(char *buffer,unsigned buf_len);
// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base);
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u);

#endif // CONSOLE_H

