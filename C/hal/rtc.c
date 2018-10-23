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
	APB1ENR->apb1enr|=(1<APB1ENR_BKPEN)|(1<<APB1ENR_PWREN);
	// donne un accès en modification à RCC_DBCR
	PWR_CR->fld.dbp=1;
	// réinitialise le backup domain
//	RCC_BDCR|=1<<BDCR_BDRST;
//	RCC_BDCR&=~(1<<BDCR_BDRST);
	// active l'oscillateur LSE
	RCC_BDCR->fld.lseon=1;
	// attend qu'il soit prêt
	while (!RCC_BDCR->fld.lserdy);
	// sélection LSE clock et active le RTC
	RCC_BDCR->bdcr|=(1<<BDCR_RTCEN)|(RTC_LSECLK<<BDCR_RTCSEL);
	// attend la synchronisation de l'horloge LSE et du clock de APB1 
	while (!RTC_CRL->fld.rsf);
	// attend que la dernière opération d'écriture dans RTC_CRL soit complétée.
	_wait_rtc_write();
	RTC_CRL->fld.cnf=1;
	_wait_rtc_write();
	// activation des interruptions désirées.
	RTC_CRH->crh |= interrupts;
	_wait_rtc_write();
	// configuration de la valeur du prescaler
	*RTC_PRLL=_rtc_period_msec(period)&0xffff;
	_wait_rtc_write();
	RTC_PRLH->prl=(_rtc_period_msec(period)>>16) && 0xffff;
	_wait_rtc_write();
	RTC_CRL->fld.cnf=0;
	_wait_rtc_write();
	PWR_CR->fld.dbp=0;
	*RTC_CNTH=0;
	*RTC_CNTL=0;
}

// réinitialise le backup domain
inline void reset_backup_domain(){
	RCC_BDCR->fld.bdrst =1;
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

