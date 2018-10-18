/*
 * Macros d'usage générales
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-30
 * Licence: GPLv3
 * revision:
 */

#ifndef GEN_MACROS_H
#define GEN_MACROS_H

#include <stdint.h>

// CMSIS macros
#define __enable_irq() ({asm volatile("cpsie i");})
#define __disable_irq() ({asm volatile("cpsid i");})
#define __enable_fault_irq() ({asm volatile("cpsie f");})
#define __disable_fault_irq() ({asm volatile("cpsid f");})


// réinitialisation du µC
#define _reset_mcu() ({AIRCR=(KEY<<VECTKEY)|(1<<SYSRESETREQ);})

typedef volatile uint32_t sfr_t;
typedef volatile uint32_t* sfrp_t;

// les Special Function Registers sont de de 32 bits.
// Ces pointeurs doivent avoir l'attribut volatile
// car leur contenu peut-être modifiés par hardware
#define _sfr(x) (*((volatile uint32_t*)(x)))


// applique champ de bits
// v valeur à appliquer
// p position 0-31
// l largeur du champ 1-32
#define _bit_field(v,p,l) ((v&((1<<l)-1))<<p)

// cré un masque pour un champ
// p position 0-31
// l largeur du champ 1-32
#define _field_mask(p,l) (~_bit_field(0xffffffff,p,l))

// met à 0 un bit dans un SFR
// sfr nom du registre
// bit position 0-31
#define _clear_sfr_bit(sfr,bit)  sfr&=~(1<<bit)

// met à 1 un bit dans un SFR
// sfr nom du registre
// bit position 0-31
#define _set_sfr_bit(sfr,bit) sfr|=(1<<bit)


#endif // GEN_MACROS_H
