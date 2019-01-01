/*
 * Description: gestionnaire de mémoire dynamique dans l'espace transitoire (TPA)
 *     la mémoire est allouée et libérée à la manière de FORTH
 *     avec un pointer HERE qui avance et recule sans laissé de trous.
 * Auteur: PICATOUT
 * Date: 2018-12-31
 * Copyright Jacques Deschênes, 2018, 2019
 * Licence: GPLv3
 * revisions:
 * 
 */


#include "bpos.h"

// size est en octets.
void* alloc(unsigned size){
	void *ptr;
	if ((here+size)>TPA_TOP) return 0;
	ptr=here;
	here+=size;
	return ptr;
}

// ptr valeur retournée par alloc()
// tout ce qui a été alloué après 'ptr' est limité
// comme dans FORTH.
void free(void* ptr){
	here=ptr;
}


