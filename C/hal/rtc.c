/*
 * Description: RTC (Real Time Clock) 
 * Auteur: PICATOUT
 * Date: 2018-09-08
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/stm32f103c8.h"


// activation du RTC avec LSE comme source
// ref: note applicative AN2821
void enable_rtc(unsigned period, unsigned interrupts){
	// activation signaux clock sur power interface et backup domain interface
	RCC->APB1ENR|=RCC_APB1ENR_BKPEN|RCC_APB1ENR_PWREN;
	// donne un accès en modification à RCC_BDCR
	PWR->CR|=PWR_CR_BDP;
	// réinitialise le backup domain
//	RCC_BDCR|=1<<BDCR_BDRST;
//	RCC_BDCR&=~(1<<BDCR_BDRST);
	// active l'oscillateur LSE
	RCC->BDCR|=RCC_BDCR_LSEON;
	// attend qu'il soit prêt
	while (!(RCC->BDCR&RCC_BDCR_LSERDY));
	// sélection LSE clock et active le RTC
	RCC->BDCR|=RCC_BDCR_RTCEN|(RCC_BDCR_RTCSEL_LSE<<RCC_BDCR_RTCSEL_POS);
	// attend la synchronisation de l'horloge LSE et du clock de APB1 
	while (!(RTC->CRL&RTC_CRL_RSF));
	// attend que la dernière opération d'écriture dans RTC_CRL soit complétée.
	_wait_rtc_write();
	RTC->CRL|=RTC_CRL_CNF;
	_wait_rtc_write();
	// activation des interruptions désirées.
	RTC->CRH|=interrupts;
	_wait_rtc_write();
	// configuration de la valeur du prescaler
	RTC->PRLL=_rtc_period_msec(period)&0xffff;
	_wait_rtc_write();
	RTC->PRLH=(_rtc_period_msec(period)>>16)&0xf;
	_wait_rtc_write();
	RTC->CRL&=~RTC_CRL_CNF;
	_wait_rtc_write();
	PWR->CR&=~PWR_CR_BDP;
	RTC->CNTH=0;
	RTC->CNTL=0;
}

// réinitialise le backup domain
inline void reset_backup_domain(){
	RCC->BDCR|=RCC_BDCR_BDRST;
}

// initialise date et heure dans RTC_CNT
void set_date_time(t_date_time dt){
	uint32_t rtc_cnt;
}

// retourne la date et l'heure
t_date_time get_date_time(){
	uint32_t rtc_cnt;
}

// configure l'alarme RTC.
void set_rtc_alarm(t_date_time dt){
}

