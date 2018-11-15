/*
 * Description: RTC (Real Time Clock)
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


#define FR_RTC_OSC 32768
// valeur de RTC_PR pour obtenir la période x
#define _rtc_period_msec(x)  (FR_RTC_OSC*(x)/1000-1)

// source clock pour RTC
#define RTC_NOCLK 0
#define RTC_LSECLK 1
#define RTC_LSICLK 2
#define RTC_HSE128CLK 3


#define RTC_BASE_ADR 0x40002800

typedef struct{
	sfr_t CRH;
	sfr_t CRL;
	sfr_t PRLH;
	sfr_t PRLL;
	sfr_t DIVH;
	sfr_t DIVL;
	sfr_t CNTH;
	sfr_t CNTL;
	sfr_t ALRH;
	sfr_t ALRL;
	
}rtc_t;

#define RTC ((rtc_t*)RTC_BASE_ADR)

// champs du registre CRH
#define RTC_CRH_SECIE BIT0 // second interrupt enable
#define RTC_CRH_ALRIE BIT1 // alarm interrupt enable
#define RTC_CRH_OWIE BIT2 // overflow interrupt enable

//champs de bits registre CRL
#define RTC_CRL_SECF BIT0 //indicateur interruption débordement RTC_DIV
#define RTC_CRL_ALRF BIT1 //indicateur interruption alarme
#define RTC_CRL_OWF  BIT2 //indicateur interruption débordement RTC_CNT
#define RTC_CRL_RSF  BIT3 //indicateur synchronisation RTC_CNT et RTC_DIV
#define RTC_CRL_CNF  BIT4 //déverrouillage écriture dans RTC_PR, RTC_ALR et RTC_CNT
#define RTC_CRL_RTOFF BIT5 //indicateur opération écriture complétée.

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
// secondes par année bisextile
#define SEC_PER_LEAP_YEAR (SEC_PER_DAY*366)

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

#define _wait_rtc_write()  ({while (!(RTC->CRL&RTC_CRL_RTOFF));})
 
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


