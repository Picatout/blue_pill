/*
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-30
 * Licence: GPLv3
 * revision:
 */

#include "../include/clock.h"
#include "../include/gen_macros.h"

// configure le prédiviseur et le mulitplicateur
// pll  PLL,PLL2,PLL3
// div prédiviseur
// mul multiplicateur
void set_pll_scaling(unsigned pll,unsigned div,unsigned mul){
	switch (pll){
	case PLL:
		RCC_CFGR2&=_field_mask(RCC_CFGR2_PREDIV1,4);
		RCC_CFGR2|=_bit_field(div,RCC_CFGR2_PREDIV1,4);
		RCC_CFGR&=_field_mask(RCC_CFGR_PLLMUL,4);
		RCC_CFGR|=_bit_field(mul,RCC_CFGR_PLLMUL,4);
	    _set_sfr_bit(RCC_CR,RCC_CR_PLLON);
	    while (!(RCC_CR&(1<<RCC_CR_PLLRDY)));
		break;
	case PLL2:
	    RCC_CFGR2&=_field_mask(RCC_CFGR2_PREDIV2,4);
	    RCC_CFGR2|=_bit_field(div,RCC_CFGR2_PREDIV2,4);
	    RCC_CFGR2&=_field_mask(RCC_CFGR2_PLL2MUL,4);
	    RCC_CFGR2|=_bit_field(mul,RCC_CFGR2_PLL2MUL,4);
	    _set_sfr_bit(RCC_CR,RCC_CR_PLL2ON);
	    while (!(RCC_CR&(1<<RCC_CR_PLL2RDY)));
		break;
	case PLL3:
	    RCC_CFGR2&=_field_mask(RCC_CFGR2_PREDIV2,4);
	    RCC_CFGR2|=_bit_field(div,RCC_CFGR2_PREDIV2,4);
	    RCC_CFGR2&=_field_mask(RCC_CFGR2_PLL3MUL,4);
	    RCC_CFGR2|=_bit_field(mul,RCC_CFGR2_PLL3MUL,4);
	    _set_sfr_bit(RCC_CR,RCC_CR_PLL3ON);
	    while (!(RCC_CR&(1<<RCC_CR_PLL3RDY)));
		break;
	}//switch
}

// sélection la source du système clock
// clock_src  HSE,HSI, PLL
void enable_system_clock(unsigned clk_src){
	uint32_t temp;
	switch(clk_src){
	case HSE_CLK:
	    _set_sfr_bit(RCC_CR,RCC_CR_HSEON);
	    while (!(RCC_CR&(1<<RCC_CR_HSERDY)));
	    temp=RCC_CFGR;
	    temp&=_field_mask(RCC_CFGR_SW,2);
	    temp|=_bit_field(HSE_CLK,RCC_CFGR_SW,2);
	    RCC_CFGR=temp;
		break;
	case HSI_CLK:
	    _set_sfr_bit(RCC_CR,RCC_CR_HSION);
	    while (!(RCC_CR&(1<<RCC_CR_HSIRDY)));
	    temp=RCC_CFGR;
	    temp&=_field_mask(RCC_CFGR_SW,2);
	    temp|=_bit_field(HSI_CLK,RCC_CFGR_SW,2);
	    RCC_CFGR=temp;
		break;
	case PLL_CLK:
	    _set_sfr_bit(RCC_CR,RCC_CR_HSEON);
	    while (!(RCC_CR&(1<<RCC_CR_HSERDY)));
	    temp=RCC_CFGR;
	    temp&=_field_mask(RCC_CFGR_SW,2);
	    temp|=_bit_field(PLL_CLK,RCC_CFGR_SW,2);
	    RCC_CFGR=temp;
		break;
	}//switch
}

