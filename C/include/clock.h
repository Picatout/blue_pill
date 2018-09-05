/*
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-30
 * Licence: GPLv3
 * revision:
 */

#if  !defined(CLOCK_H)
#define CLOCK_H

#include "stm32f103c8.h"

// configure le prédiviseur et le mulitplicateur
// pll  PLL,PLL2,PLL3
// div prédiviseur
// mul multiplicateur
extern void set_pll_scaling(unsigned pll,unsigned div,unsigned mul);

// sélection la source du système clock
// clock_src  HSE,HSI, PLL
extern void enable_system_clock(unsigned clk_src);


#endif // CLOCK_H
