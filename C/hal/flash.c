/*
 * Description:  flash memory interface registers
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-10-24
 * Licence: GPLv3
 * revision:
 */

#include "../include/blue_pill.h"

#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
		RCC->CR|=RCC_CR_HSION;
		while (!(RCC->CR&RCC_CR_HSIRDY));
	}
	/*
	asm volatile (
		"ldr r0,%1\n\t"
		"ldr r1,%2\n\t"
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
	FLASH->KEYR=0xCDEF89AB;
	return !(FLASH->CR&FLASH_CR_LOCK);
}

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
	FLASH->CR|=FLASH_CR_LOCK;
}

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
	while (_flash_busy);
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
	FLASH->CR=FLASH_CR_PG;
	*(uint16_t*)address=hword;
	while (_flash_busy && ! _flash_eop);
	return (*(uint16_t*)address)==hword;
}

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
	address&=0xfffffc00;
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
}

