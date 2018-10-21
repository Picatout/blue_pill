/*
 * Description: registres liés directement au CPU cortex-M3.
 * Auteur: PICATOUT
 * Date: 2018-10-20
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/core.h"

cpuid_t* SCB_CPUID= (cpuid_t*)SCB_CPUID_ADR;
icsr_t* SCB_ICSR=(icsr_t*)SCB_ICSR_ADR;
vtor_t * SCB_VTOR=(vtor_t*)SCB_VTOR_ADR;
aircr_t* SCB_AIRCR=(aircr_t*)SCB_AIRCR_ADR;
scr_t* SCB_SCR=(scr_t*)SCB_SCR_ADR;
cfsr_t*  SCB_CFSR=(cfsr_t*)SCB_CFSR_ADR;
ccr_t* SCB_CCR=(ccr_t*)SCB_CCR_ADR;
