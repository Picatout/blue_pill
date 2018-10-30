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
#define _reset_mcu() ({AIRCR->aircr=(KEY<<VECTKEY)|(1<<SYSRESETREQ);})

// pour les registres qui peuvent-être mmodifiés par le hardware
typedef volatile uint8_t sfr8_t;
typedef volatile uint8_t* sfr8p_t;
typedef volatile uint16_t sfr16_t;
typedef volatile uint16_t* sfr16p_t;
typedef volatile uint32_t sfr_t;
typedef volatile uint32_t* sfrp_t;

// pour les autres registres (non volatile)
typedef uint8_t sfr8nv_t;
typedef uint8_t* sfr8nvp_t;
typedef uint16_t sfr16nv_t;
typedef uint16_t* sfr16nvp_t;
typedef uint32_t sfrnv_t;
typedef uint32_t* sfrnvp_t;


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
