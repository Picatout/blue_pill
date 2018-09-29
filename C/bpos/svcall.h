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
