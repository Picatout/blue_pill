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
} t_svcall_struct;

// fonctions du système d'exploitation
typedef enum{
SVC_RESET=0,  // réinitialise le MCU
SVC_LED_ON, // allume la LED verte
SVC_LED_OFF, // éteint la LED verte
SVC_TIMER, // démarre la minuterie
SVC_PRIVILIGED, // active l'exécution prévilégiée
} syscall_t;

#define _svc_call(svc_no,nb_args,args_array) ({asm volatile (\
	"ldr r0, =%[argc]\n"\
	"mov r1, %[argv]\n"\
	"svc %[svc_id]\n":: [svc_id] "I" ((svc_no)&0xff),\
	[argc] "I" (nb_args),\
	[argv] "r" (args_array)\
	);})


#define _wait_timeout() ({while (timer);})

