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

// valeur binaire de chaque bit.
#define BIT0 (1<<0)
#define BIT1 (1<<1)
#define BIT2 (1<<2)
#define BIT3 (1<<3)
#define BIT4 (1<<4)
#define BIT5 (1<<5)
#define BIT6 (1<<6)
#define BIT7 (1<<7)
#define BIT8 (1<<8)
#define BIT9 (1<<9)
#define BIT10 (1<<10)
#define BIT11 (1<<11)
#define BIT12 (1<<12)
#define BIT13 (1<<13)
#define BIT14 (1<<14)
#define BIT15 (1<<15)
#define BIT16 (1<<16)
#define BIT17 (1<<17)
#define BIT18 (1<<18)
#define BIT19 (1<<19)
#define BIT20 (1<<20)
#define BIT21 (1<<21)
#define BIT22 (1<<22)
#define BIT23 (1<<23)
#define BIT24 (1<<24)
#define BIT25 (1<<25)
#define BIT26 (1<<26)
#define BIT27 (1<<27)
#define BIT28 (1<<28)
#define BIT29 (1<<29)
#define BIT30 (1<<30)
#define BIT31 (1<<31)

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
