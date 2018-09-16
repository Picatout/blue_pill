/*
 * Description: RTC (Real Time Clock) et backup domain
 * Auteur: PICATOUT
 * Date: 2018-09-08
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef RTC_H
#define RTC_H

#include "gen_macros.h"
#include "stm32f103c8.h"

#define FR_RTC_OSC 32768
// valeur de RTC_PR pour obtenir la période x
#define _rtc_period_msec(x)  (FR_RTC_OSC*x/1000-1)

// champs de bit du registre RCC_BDCR
#define BDCR_LSEON 0 // 1 bit activation oscillateur LSE
#define BDCR_LSERDY 1 // 1 bit, oscillateur prêt
#define BDCR_LSEBYP 2 // 1 bit, contourne l'oscillateur LSE
#define BDCR_RTCSEL 8 // 2 bits, sélectionne le clock du RTC 
						// 00: No clock
						// 01: LSE oscillator clock used as RTC clock
						// 10: LSI oscillator clock used as RTC clock
						// 11: HSE oscillator clock divided by 128 used as RTC clock
#define BDCR_RTCEN 15 // 1 bit, activation RTC						
#define BDCR_BDRST 16 // 1 bit, réinitialisation du backup domain.
  
// source clock pour RTC
#define RTC_NOCLK 0
#define RTC_LSECLK 1
#define RTC_LSICLK 2
#define RTC_HSE128CLK 3


#define RTC_BASE_ADR 0x40002800

#define RTC_CRH _sfr(RTC_BASE_ADR)
#define RTC_CRL _sfr(RTC_BASE_ADR+4)
#define RTC_PRLH _sfr(RTC_BASE_ADR+8)
#define RTC_PRLL _sfr(RTC_BASE_ADR+0xc)
#define RTC_DIVH _sfr(RTC_BASE_ADR+0x10)
#define RTC_DIVL _sfr(RTC_BASE_ADR+0x14)
#define RTC_CNTH _sfr(RTC_BASE_ADR+0x18)
#define RTC_CNTL _sfr(RTC_BASE_ADR+0x1c)
#define RTC_ALRH _sfr(RTC_BASE_ADR+0x20)
#define RTC_ALRL _sfr(RTC_BASE_ADR+0x24)

// champs de bits registre RTC_CRH
#define RTC_CRH_SECIE (0) // 1 bit, activation interruption sur débordement compteur RTC_DIV
#define RTC_CRH_ALRIE (1) // 1 bit, activation interruption sur alarme. ie. RTC_CNT==RCT_ALR
#define RTC_CRH_OWIE  (2) // 1 bit, activation interruption sur débordement RTC_CNT
//champs de bits registre RTC_CRL
#define RTC_CRL_SECF (0) // 1 bit, indicateur interruption débordement RTC_DIV
#define RTC_CRL_ALRF (1) // 1 bit, indicateur interruption alarme
#define RTC_CRL_OWF  (2) // 1 bit, indicateur interruption débordement RTC_CNT
#define RTC_CRL_RSF  (3) // 1 bit, indicateur synchronisation RTC_CNT et RTC_DIV
#define RTC_CRL_CNF  (4) // 1 bit, déverrouillage écriture dans RTC_PR, RTC_ALR et RTC_CNT
#define RTC_CRL_RTOFF (5) // 1 bit, indicateur opération écriture complétée.

// seconde par minute
#define SEC_PER_MIN 60
// minute par heure
#define MIN_PER_HR 60
// heure par jour
#define HR_PER_DAY 24
// seconde par jour
#define SEC_PER_DAY (SEC_PER_MIN*MIN_PER_HR*HR_PER_DAY)
// seconde par année
#define SEC_PER_YEAR (SEC_PER_DAY*365)

// Le temps de référence de départ de l'horloge système
// est 2000/01/01 00:00:00
// année zéro
#define YEAR_ZERO 2000
// mois zéro
#define MONTH_ZERO 1
// jour zéro
#define DAY_ZERO 1
// heure zéro
#define HOUR_ZERO 0
// minute zéro
#define MIN_ZERO 0
// seconde 0
#define SEC_ZERO 0

/***************
 *   API
 **************/

#define _wait_rtc_write()  ({while (! (RTC_CRL & (1<<RTC_CRL_RTOFF)));})
 
typedef struct date_time{
	uint32_t second:6;
	uint32_t minute:6;
	uint32_t hour:5;
	uint32_t day:5;
	uint32_t month:4;
	uint32_t year:6; // années de depuis l'an 2000 (0..63)
} t_date_time;

 
// activation du RTC avec LSE comme source
void enable_rtc(unsigned period, unsigned interrupts);
// réinitialise le backup domain
void reset_backup_domain();
// interruption à activer
#define RTC_SECIE (1<<RTC_CRH_SECIE)
#define RTC_ALRIE (1<<RTC_CRH_ALRIE)
#define RTC_OFWIE (1<<RTC_CRH_OWIE)

// initialise date et heure dans RTC_CNT
void set_date_time(t_date_time dt);
// obtient la date et l'heure du RTC
t_date_time get_date_time();
// configure l'alarme RTC.
void set_rtc_alarm(t_date_time dt);

#endif // RCT_H


