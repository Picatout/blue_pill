/*
 * Description: fonctions offerte par pbOS
 * 
 * Auteur: PICATOUT
 * Date: 2018-09-28
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef SVCALL_H
#define SVCALL_H

#include <stdint.h>

typedef struct svcall_struct{
	uint32_t fn; // no. de fonction
	uint32_t argc; // nombre d'arguments
	void **argv; // liste de pointer vers les arguments
} svcall_t;

// fonctions du système d'exploitation
typedef enum{
SVC_RESET=0,  // réinitialise le MCU
SVC_LED_ON, // allume la LED verte
SVC_LED_OFF, // éteint la LED verte
SVC_TIMER, // démarre la minuterie
SVC_GET_TIMER, // retourne la valeur de la variable timer
SVC_CONIN,  // reçoit un caractère de la console
SVC_CONOUT, // envoie un caractère à la console
SVC_READLN, // lit une ligne de la console
SVC_PRINT,  // imprime une chaine
SVC_PRINT_INT, // imprime un entier
SVC_PRINT_HEX, // imprime un entier en format hexadécimal
SVC_PEEK8, // lit un entier 8 bits à l'adresse donnée
SVC_PEEK16, // lit un entier 16 bits à l'acresse donnée
SVC_PEEK32, // lit un entier 32 bits à l'adresse donnée
SVC_POKE8, // écris un entier 8 bits à l'adresse donnée
SVC_POKE16, // écris un entier 16 bits à l'adresse donnée
SVC_POKE32, // écris un enteir 32 bits à l'adresse donnée 
} syscall_e;

#define _svc_call(svc_no,arg1,arg2) ({asm volatile (\
	"mov r0, %1\n\t"\
	"mov r1, %2\n\t"\
	"svc %0\n\t"\
	: /*no output */\
	: "I" ((svc_no)&0xff),\
	 "r" (arg1), "r" (arg2)\
	: "r0","r1"\
	);})


#define _wait_timeout() ({while (timer);})

#endif // SVCALL_H
