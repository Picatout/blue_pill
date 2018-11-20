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

#include "../include/blue_pill.h"
#include "../include/ascii.h"

typedef enum console_device{
	LOCAL,
	SERIAL
}console_dev_t;

#define CON_QUEUE_SIZE 32

typedef struct{
	console_dev_t dev;
	volatile char queue[CON_QUEUE_SIZE];
	volatile unsigned head;
	volatile unsigned tail;
	void (*insert)(char);
	char (*getc)(void);
	void (*putc)(char);
	void (*delete_back)(void);
	void (*cls)(void);
}console_t;

extern console_t con;

void console_init(console_dev_t dev);
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
// reçoit une ligne de texte de la console
// retourne la longueur de la ligne.
unsigned read_line(char *buffer,unsigned buf_len);
// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base);
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u);
// vide la file rx
void con_queue_flush();
//sélectionne le device pour la console
void con_select(console_dev_t dev);

#endif // CONSOLE_H

