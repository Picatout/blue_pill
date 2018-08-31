/*
 * Macros d'usage générales
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-30
 * Licence: GPLv3
 * revision:
 */

#if !defined(GEN_MACROS_H)
#define GEN_MACROS_H

// applique champ de bits
// v valeur à appliquer
// p position 0-31
// l largeur du champ 1-32
#define _bit_field(v,p,l) (v%(1<<(l-1))<<p)

// cré un masque pour un champ
// p position 0-31
// l largeur du champ 1-32
#define _field_mask(p,l) (~_bit_field(-1,p,l))

// met à 0 un bit dans un SFR
// sfr nom du registre
// bit position 0-31
#define _clear_sfr_bit(sfr,bit)  sfr&=~(1<<bit)

// met à 1 un bit dans un SFR
// sfr nom du registre
// bit position 0-31
#define _set_sfr_bit(sfr,bit) sfr|=(1<<bit)

#endif // GEN_MACROS_H
