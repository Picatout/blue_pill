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


#define FR_RTC_OSC 32768
// valeur de RTC_PR pour obtenir la période x
#define _rtc_period_msec(x)  (FR_RTC_OSC*(x)/1000-1)

// source clock pour RTC
#define RTC_NOCLK 0
#define RTC_LSECLK 1
#define RTC_LSICLK 2
#define RTC_HSE128CLK 3


#define RTC_BASE_ADR 0x40002800


#define RTC_CRH_ADR (RTC_BASE_ADR)
// champs de bits registre RTC_CRH
#define RTC_CRH_SECIE (0) // 1 bit, activation interruption sur débordement compteur RTC_DIV
#define RTC_CRH_ALRIE (1) // 1 bit, activation interruption sur alarme. ie. RTC_CNT==RCT_ALR
#define RTC_CRH_OWIE  (2) // 1 bit, activation interruption sur débordement RTC_CNT

typedef union{
	sfr16_t crh;
	struct{
		sfr16_t secie:1;
		sfr16_t alrie:1;
		sfr16_t owie:1;
		sfr16_t res0:13;
	}fld;
}rtc_crh_t;

#define RTC_CRH ((rtc_crh_t*)RTC_CRH_ADR)

#define RTC_CRL_ADR (RTC_BASE_ADR+4)
//champs de bits registre RTC_CRL
#define RTC_CRL_SECF (0) // 1 bit, indicateur interruption débordement RTC_DIV
#define RTC_CRL_ALRF (1) // 1 bit, indicateur interruption alarme
#define RTC_CRL_OWF  (2) // 1 bit, indicateur interruption débordement RTC_CNT
#define RTC_CRL_RSF  (3) // 1 bit, indicateur synchronisation RTC_CNT et RTC_DIV
#define RTC_CRL_CNF  (4) // 1 bit, déverrouillage écriture dans RTC_PR, RTC_ALR et RTC_CNT
#define RTC_CRL_RTOFF (5) // 1 bit, indicateur opération écriture complétée.

typedef union{
	sfr16_t crl;
	struct{
		sfr16_t secf:1;
		sfr16_t alrf:1;
		sfr16_t owf:1;
		sfr16_t rsf:1;
		sfr16_t cnf:1;
		sfr16_t rtoff:1;
		sfr16_t res0:10; 
	}fld;
} rtc_crl_t;

#define RTC_CRL ((rtc_crl_t*)RTC_CRL_ADR)

#define RTC_PRLH_ADR (RTC_BASE_ADR+8)
typedef struct{
	sfr16_t prl:4;
	sfr16_t res0:12;
}rtc_prlh_t;

#define RTC_PRLH ((rtc_prlh_t*)RTC_PRLH_ADR)

#define RTC_PRLL_ADR (RTC_BASE_ADR+0xc)
#define RTC_PRLL ((sfr16p_t) RTC_PRLL_ADR)

#define RTC_DIVH_ADR (RTC_BASE_ADR+0x10)
typedef struct{
	sfr16_t rtc_div:4;
	sfr16_t res0:12;
} rtc_divh_t;

#define RTC_DIVH ((rtc_divh_t*)RTC_DIVH_ADR)

#define RTC_DIVL_ADR (RTC_BASE_ADR+0x14)
#define RTC_DIVL ((sfr16p_t) RTC_DIVL_ADR)

#define RTC_CNTH_ADR (RTC_BASE_ADR+0x18)
#define RTC_CNTH ((sfr16p_t) RTC_CNTH_ADR)

#define RTC_CNTL_ADR (RTC_BASE_ADR+0x1c)
#define RTC_CNTL ((sfr16p_t) RTC_CNTL_ADR)

#define RTC_ALRH_ADR (RTC_BASE_ADR+0x20)
#define RTC_ALRH ((sfr16p_t) RTC_ALRH_ADR)

#define RTC_ALRL_ADR (RTC_BASE_ADR+0x24)
#define RTC_ALRL ((sfr16p_t) RTC_ALRL_ADR)

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

#define _wait_rtc_write()  ({while (!RTC_CRL->fld.rtoff);})
 
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


