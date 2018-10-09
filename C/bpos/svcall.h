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
SVC_PRIVILIGED, // active l'exécution prévilégiée
} syscall_e;

#define _svc_call(svc_no,argc,args_array) ({asm volatile (\
	"mov r0, %1\n"\
	"mov r1, %2\n"\
	"svc %0\n":: "I" ((svc_no)&0xff),\
	"r" (argc),\
	"r" (args_array)\
	);})


#define _wait_timeout() ({while (timer);})

