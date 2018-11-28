/*
 * Description: interface bas niveau périphérique TIMER
 * Auteur: PICATOUT
 * Copyright Jacques Deschênes, 2018
 * Date: 2018-08-30
 * Licence: GPLv3
 * revision:
 */

#if !defined(PWM_H)
#define  PWM_H

#include "gen_macros.h"
#include "stm32f103c8.h"

enum timer_e{
	TIMER1,
	TIMER2,
	TIMER3,
	TIMER4
};

// adresse de base des timers
#define TIMER1_BASE_ADR 0x40012c00
#define TIMER2_BASE_ADR 0x40000000
#define TIMER3_BASE_ADR 0x40000400
#define TIMER4_BASE_ADR 0x40000800

// offset des différents registres
#define TMR_CR1_OFS 0
#define TMR_CR2_OFS 4
#define TMR_SMCR_OFS 8
#define TMR_DIER_OFS 12
#define TMR_SR_OFS 16
#define TMR_EGR_OFS 20
#define TMR_CCMR1_OCM_OFS 24
#define TMR_CCMR1_ICM_OFS 24
#define TMR_CCMR2_OCM_OFS 28
#define TMR_CCMR2_ICM_OFS 28
#define TMR_CCER_OFS 32
#define TMR_CNT_OFS 36
#define TMR_PSC_OFS 40
#define TMR_ARR_OFS 44
#define TMR_CCR1_OFS 52
#define TMR_CCR2_OFS 56
#define TMR_CCR3_OFS 60
#define TMR_CCR4_OFS 64
#define TMR_BDTR_OFS 68
#define TMR_DCR_OFS 72
#define TMR_DMAR_OFS 76

typedef struct{
	sfr_t CR1;
	sfr_t CR2;
	sfr_t SMCR;
	sfr_t DIER;
	sfr_t SR;
	sfr_t EGR;
	sfr_t CCMR1;
	sfr_t CCMR2;
	sfr_t CCER;
	sfr_t CNT;
	sfr_t PSC;
	sfr_t ARR;
	sfr_t RCR;
	sfr_t CCR1;
	sfr_t CCR2;
	sfr_t CCR3;
	sfr_t CCR4;
	sfr_t BDTR;
	sfr_t DCR;
	sfr_t DMAR;
}tmr_t;

#define TMR1 ((tmr_t*)TIMER1_BASE_ADR)
#define TMR2 ((tmr_t*)TIMER2_BASE_ADR)
#define TMR3 ((tmr_t*)TIMER3_BASE_ADR)
#define TMR4 ((tmr_t*)TIMER4_BASE_ADR)


typedef union{
	sfr_t cr1;
	struct{
		sfr_t cen:1;
		sfr_t udis:1;
		sfr_t urs:1;
		sfr_t opm:1;
		sfr_t dir:1;
		sfr_t cms:2;
		sfr_t arpe:1;
		sfr_t ckd:2;
		sfr_t reserved: 22;
	}fld;
} timer_cr1_t;

#define TMR_CR1_CEN BIT0
#define TMR_CR1_UDIS BIT1
#define TMR_CR1_URS BIT2
#define TMR_CR1_OPM BIT3
#define TMR_CR1_DIR BIT4
#define TMR_CR1_CMS_POS 5
#define TMR_CR1_CMS_MASK (~(3<<5))
#define TMR_CR1_ARPE BIT7
#define TMR_CR1_CKD_POS 8
#define TMR_CR1_CKD_MASK (~(3<<8))


#define TIMER1_CR1 ((timer_cr1_t*)(TIMER1_BASE_ADR+TMR_CR1_OFS))
#define TIMER2_CR1 ((timer_cr1_t*)(TIMER2_BASE_ADR+TMR_CR1_OFS))
#define TIMER3_CR1 ((timer_cr1_t*)(TIMER3_BASE_ADR+TMR_CR1_OFS))
#define TIMER4_CR1 ((timer_cr1_t*)(TIMER4_BASE_ADR+TMR_CR1_OFS))

typedef union{
	sfr_t cr2;
	struct{
		sfr_t reserved0:3;
		sfr_t ccds:1;
		sfr_t mms:3;
		sfr_t ti1s:1;
		sfr_t reserved1:24;
	}fld;
} timer_cr2_t;

#define TMR_CR2_CCDS BIT3
#define TMR_CR2_MMS_POS 4
#define TMR_CR2_MMS_MASK (~(7<<4))
#define TMR_CR2_TI1S BIT7

#define TIMER1_CR2 ((timer_cr2_t*)(TIMER1_BASE_ADR+TMR_CR2_OFS))
#define TIMER2_CR2 ((timer_cr2_t*)(TIMER2_BASE_ADR+TMR_CR2_OFS))
#define TIMER3_CR2 ((timer_cr2_t*)(TIMER3_BASE_ADR+TMR_CR2_OFS))
#define TIMER4_CR2 ((timer_cr2_t*)(TIMER4_BASE_ADR+TMR_CR2_OFS))

typedef union{
	sfr_t smcr;
	struct{
		sfr_t sms:3;
		sfr_t reserved0:1;
		sfr_t ts:3;
		sfr_t msm:1;
		sfr_t etf:4;
		sfr_t etps:2;
		sfr_t ece:1;
		sfr_t etp:1;
		sfr_t reserved1:16;
	}fld;
} timer_smcr_t;

#define TMR_SMCR_SMS_POS 0
#define TMR_SMCR_SMS_MASK (~(7<<0))
#define TMR_SMCR_TS_POS 4
#define TMR_SMCR_TS_MASK  (~(7<<0))
#define TMR_SMCR_MSM BIT7
#define TMR_SMCR_ETF_POS 8
#define TMR_SMCR_ETF_MASK (~(15<<8))
#define TMR_SMCR_ETPS_POS 12
#define TMR_SMCR_ETPS_MASK (~(3<<12))
#define TMR_SMCR_ECE BIT14
#define TMR_SMCR_ETP BIT15

#define TIMER1_SMCR ((timer_smcr_t*)(TIMER1_BASE_ADR+TMR_SMCR_OFS))
#define TIMER2_SMCR ((timer_smcr_t*)(TIMER2_BASE_ADR+TMR_SMCR_OFS))
#define TIMER3_SMCR ((timer_smcr_t*)(TIMER3_BASE_ADR+TMR_SMCR_OFS))
#define TIMER4_SMCR ((timer_smcr_t*)(TIMER4_BASE_ADR+TMR_SMCR_OFS))

typedef union{
	sfr_t dier;
	struct{
		sfr_t uie:1;
		sfr_t cc1ie:1;
		sfr_t cc2ie:1;
		sfr_t cc3ie:1;
		sfr_t cc4ie:1;
		sfr_t reserved0:1;
		sfr_t tie:1;
		sfr_t reserved1:1;
		sfr_t ude:1;
		sfr_t cc1de:1;
		sfr_t cc2de:1;
		sfr_t cc3de:1;
		sfr_t cc4de:1;
		sfr_t comde:1;
		sfr_t tde:1;
		sfr_t reserved2:17;
	}fld;
	
} timer_dier_t;

#define TMR_DIER_UIE BIT0
#define TMR_DIER_CC1IE BIT1
#define TMR_DIER_CC2IE BIT2
#define TMR_DIER_CC3IE BIT3
#define TMR_DIER_CC4IE BIT4
#define TMR_DIER_TIE BIT6
#define TMR_DIER_UDE BIT8
#define TMR_DIER_CC1DE BIT9
#define TMR_DIER_CC2DE BIT10
#define TMR_DIER_CC3DE BIT11
#define TMR_DIER_CC4DE BIT12
#define TMR_DIER_TDE BIT14


#define TIMER1_DIER ((timer_dier_t*)(TIMER1_BASE_ADR+TMR_DIER_OFS))
#define TIMER2_DIER ((timer_dier_t*)(TIMER2_BASE_ADR+TMR_DIER_OFS))
#define TIMER3_DIER ((timer_dier_t*)(TIMER3_BASE_ADR+TMR_DIER_OFS))
#define TIMER4_DIER ((timer_dier_t*)(TIMER4_BASE_ADR+TMR_DIER_OFS))

typedef union{
	sfr_t sr;
	struct{
		sfr_t uif:1;
		sfr_t cc1if:1;
		sfr_t cc2if:1;
		sfr_t cc3if:1;
		sfr_t cc4if:1;
		sfr_t reserved0:1;
		sfr_t tif:1;
		sfr_t reserved1:1;
		sfr_t udf:1;
		sfr_t cc1df:1;
		sfr_t cc2df:1;
		sfr_t cc3df:1;
		sfr_t cc4df:1;
		sfr_t comdf:1;
		sfr_t reserved2:19;
	}fld;
} timer_sr_t;

#define TMR_SR_UIF BIT0
#define TMR_SR_CC1IF BIT1
#define TMR_SR_CC2IF BIT2
#define TMR_SR_CC3IF BIT3
#define TMR_SR_CC4IF BIT4
#define TMR_SR_TIF BIT6
#define TMR_SR_CC1OF BIT9
#define TMR_SR_CC2OF BIT10
#define TMR_SR_CC3OF BIT11
#define TMR_SR_CC4OF BIT12

#define TIMER1_SR ((timer_sr_t*)(TIMER1_BASE_ADR+TMR_SR_OFS))
#define TIMER2_SR ((timer_sr_t*)(TIMER2_BASE_ADR+TMR_SR_OFS))
#define TIMER3_SR ((timer_sr_t*)(TIMER3_BASE_ADR+TMR_SR_OFS))
#define TIMER4_SR ((timer_sr_t*)(TIMER4_BASE_ADR+TMR_SR_OFS))


typedef union{
	sfr_t egr;
	struct{
		sfr_t ug:1;
		sfr_t oc1g:1;
		sfr_t oc2g:1;
		sfr_t oc3g:1;
		sfr_t oc4g:1;
		sfr_t reserved0:1;
		sfr_t tg:1;
		sfr_t reserved1:25;
		
	}fld;
} timer_egr_t;

#define TMR_EGR_UG BIT0
#define TMR_EGR_CC1G BIT1
#define TMR_EGR_CC2G BIT2
#define TMR_EGR_CC3G BIT3
#define TMR_EGR_CC4G BIT4
#define TMR_EGR_TG BIT6

#define TIMER1_EGR ((timer_egr_t*)(TIMER1_BASE_ADR+TMR_EGR_OFS))
#define TIMER2_EGR ((timer_egr_t*)(TIMER2_BASE_ADR+TMR_EGR_OFS))
#define TIMER3_EGR ((timer_egr_t*)(TIMER3_BASE_ADR+TMR_EGR_OFS))
#define TIMER4_EGR ((timer_egr_t*)(TIMER4_BASE_ADR+TMR_EGR_OFS))

// ccmr1 output compare mode
typedef union{
	sfr_t ccmr1;
	struct{
		sfr_t cc1s:2;
		sfr_t oc1fe:1;
		sfr_t oc1pe:1;
		sfr_t oc1m:3;
		sfr_t oc1ce:1;
		sfr_t cc2s:2;
		sfr_t oc2fe:1;
		sfr_t oc2pe:1;
		sfr_t oc2m:3;
		sfr_t oc2ce:1;
		sfr_t reserved0:16; 
	}fld;
	
} timer_ccmr1_ocm_t;

// output compare mode
#define TMR_CCMR1_CC1S_POS 0
#define TMR_CCMR1_CC1S_MASK (~(3<<0))
#define TMR_CCMR1_OC1FE BIT2
#define TMR_CCMR1_OC1PE BIT3
#define TMR_CCMR1_OC1M_POS 4
#define TMR_CCMR1_OC1M_MASK (~(7<<4))
#define TMR_CCMR1_OC1CE BIT7
#define TMR_CCMR1_CC2S_POS 8
#define TMR_CCMR1_CC2S_MASK (~(3<<8))
#define TMR_CCMR1_OC2FE BIT10
#define TMR_CCMR1_OC2PE BIT11
#define TMR_CCMR1_OC2M_POS 12
#define TMR_CCMR1_OC2M_MASK (~(7<<12))
#define TMR_CCMR1_OC2CE BIT15
//input capture mode
#define TMR_CCMR1_IC1PSC_POS 2
#define TMR_CCMR1_IC1PSC_MASK (~(3<<2))
#define TMR_CCMR1_IC1F_POS 4
#define TMR_CCMR1_IC1F_MASK (~(15<<4))
#define TMR_CCMR1_IC2PSC_POS 10
#define TMR_CCMR1_IC2PSC_MASK (~(3<<10))
#define TMR_CCMR1_IC2F_POS 12
#define TMR_CCMR1_IC2F_MASK (~(15<<12))


#define TIMER1_CCMR1_OCM ((timer_ccmr1_ocm_t*)(TIMER1_BASE_ADR+TMR_CCMR1_OCM_OFS))
#define TIMER2_CCMR1_OCM ((timer_ccmr1_ocm_t*)(TIMER2_BASE_ADR+TMR_CCMR1_OCM_OFS))
#define TIMER3_CCMR1_OCM ((timer_ccmr1_ocm_t*)(TIMER3_BASE_ADR+TMR_CCMR1_OCM_OFS))
#define TIMER4_CCMR1_OCM ((timer_ccmr1_ocm_t*)(TIMER4_BASE_ADR+TMR_CCMR1_OCM_OFS))

// ccmr1 input capture mode
typedef union{
	sfr_t ccrm1;
	struct{
		sfr_t cc1s:2;
		sfr_t ic1psc:2;
		sfr_t ic1f:4;
		sfr_t cc2s:2;
		sfr_t ic2psc:2;
		sfr_t ic2f:4;
		sfr_t reserved0:16;
	}fld;
} timer_ccmr1_icm_t;

#define TIMER1_CCMR1_ICM ((timer_ccmr1_icm_t*)(TIMER1_BASE_ADR+TMR_CCMR1_ICM_OFS))
#define TIMER2_CCMR1_ICM ((timer_ccmr1_icm_t*)(TIMER2_BASE_ADR+TMR_CCMR1_ICM_OFS))
#define TIMER3_CCMR1_ICM ((timer_ccmr1_icm_t*)(TIMER3_BASE_ADR+TMR_CCMR1_ICM_OFS))
#define TIMER4_CCMR1_ICM ((timer_ccmr1_icm_t*)(TIMER4_BASE_ADR+TMR_CCMR1_ICM_OFS))

// ccmr2 output compare mode
typedef union{
	sfr_t ccmr2;
	struct{
		sfr_t cc3s:2;
		sfr_t oc3fe:1;
		sfr_t oc3pe:1;
		sfr_t oc3m:3;
		sfr_t oc3ce:1;
		sfr_t cc4s:2;
		sfr_t oc4fe:1;
		sfr_t oc4pe:1;
		sfr_t oc4m:3;
		sfr_t oc4ce:1;
		sfr_t reserved0:16; 
	}fld;
	
} timer_ccmr2_ocm_t;

// output compare mode canal 3 et 4
#define TMR_CCMR2_CC3S_POS 0
#define TMR_CCMR2_CC3S_MASK (~(3<<0))
#define TMR_CCMR2_OC3FE BIT2
#define TMR_CCMR2_OC3PE BIT3
#define TMR_CCMR2_OC3M_POS 4
#define TMR_CCMR2_OC3M_MASK (~(7<<4))
#define TMR_CCMR2_OC3CE BIT7
#define TMR_CCMR2_CC4S_POS 8
#define TMR_CCMR2_CC4S_MASK (~(3<<8))
#define TMR_CCMR2_OC4FE BIT10
#define TMR_CCMR2_OC4PE BIT11
#define TMR_CCMR2_OC4M_POS 12
#define TMR_CCMR2_OC4M_MASK (~(7<<12))
#define TMR_CCMR2_OC4CE BIT15
//input capture mode canal 3 et 4
#define TMR_CCMR2_IC3PSC_POS 2
#define TMR_CCMR2_IC3PSC_MASK (~(3<<2))
#define TMR_CCMR2_IC3F_POS 4
#define TMR_CCMR2_IC3F_MASK (~(15<<4))
#define TMR_CCMR2_IC4PSC_POS 10
#define TMR_CCMR2_IC4PSC_MASK (~(3<<10))
#define TMR_CCMR2_IC4F_POS 12
#define TMR_CCMR2_IC4F_MASK (~(15<<12))


#define TIMER1_CCMR2_OCM ((timer_ccmr2_ocm_t*)(TIMER1_BASE_ADR+TMR_CCMR2_OCM_OFS))
#define TIMER2_CCMR2_OCM ((timer_ccmr2_ocm_t*)(TIMER2_BASE_ADR+TMR_CCMR2_OCM_OFS))
#define TIMER3_CCMR2_OCM ((timer_ccmr2_ocm_t*)(TIMER3_BASE_ADR+TMR_CCMR2_OCM_OFS))
#define TIMER4_CCMR2_OCM ((timer_ccmr2_ocm_t*)(TIMER4_BASE_ADR+TMR_CCMR2_OCM_OFS))

// ccmr2 input capture mode
typedef union{
	sfr_t ccrm1;
	struct{
		sfr_t cc3s:2;
		sfr_t ic3psc:2;
		sfr_t ic3f:4;
		sfr_t cc4s:2;
		sfr_t ic4psc:2;
		sfr_t ic4f:4;
		sfr_t reserved0:16;
	}fld;
} timer_ccmr2_icm_t;

#define TIMER1_CCMR2_ICM ((timer_ccmr2_icm_t*)(TIMER1_BASE_ADR+TMR_CCMR2_ICM_OFS))
#define TIMER2_CCMR2_ICM ((timer_ccmr2_icm_t*)(TIMER2_BASE_ADR+TMR_CCMR2_ICM_OFS))
#define TIMER3_CCMR2_ICM ((timer_ccmr2_icm_t*)(TIMER3_BASE_ADR+TMR_CCMR2_ICM_OFS))
#define TIMER4_CCMR2_ICM ((timer_ccmr2_icm_t*)(TIMER4_BASE_ADR+TMR_CCMR2_ICM_OFS))

typedef union{
	sfr_t ccer;
	struct{
		sfr_t cc1e:1;
		sfr_t cc1p:1;
		sfr_t reserved0:2;
		sfr_t cc2e:1;
		sfr_t cc2p:1;
		sfr_t reserved1:2;
		sfr_t cc3e:1;
		sfr_t cc3p:1;
		sfr_t reserved2:2;
		sfr_t cc4e:1;
		sfr_t cc4p:1;
		sfr_t reserved3:18;
	}fld;
} timer_ccer_t;


#define TIMER1_CCER ((timer_ccer_t*)(TIMER1_BASE_ADR+TMR_CCER_OFS))
#define TIMER2_CCER ((timer_ccer_t*)(TIMER2_BASE_ADR+TMR_CCER_OFS))
#define TIMER3_CCER ((timer_ccer_t*)(TIMER3_BASE_ADR+TMR_CCER_OFS))
#define TIMER4_CCER ((timer_ccer_t*)(TIMER4_BASE_ADR+TMR_CCER_OFS))

typedef volatile uint16_t *timer_cnt_t;

#define TIMER1_CNT ((timer_cnt_t)(TIMER1_BASE_ADR+TMR_CNT_OFS))
#define TIMER2_CNT ((timer_cnt_t)(TIMER2_BASE_ADR+TMR_CNT_OFS))
#define TIMER3_CNT ((timer_cnt_t)(TIMER3_BASE_ADR+TMR_CNT_OFS))
#define TIMER4_CNT ((timer_cnt_t)(TIMER4_BASE_ADR+TMR_CNT_OFS))

typedef volatile uint16_t *timer_psc_t;

#define TIMER1_PSC ((timer_psc_t)(TIMER1_BASE_ADR+TMR_PSC_OFS))
#define TIMER2_PSC ((timer_psc_t)(TIMER2_BASE_ADR+TMR_PSC_OFS))
#define TIMER3_PSC ((timer_psc_t)(TIMER3_BASE_ADR+TMR_PSC_OFS))
#define TIMER4_PSC ((timer_psc_t)(TIMER4_BASE_ADR+TMR_PSC_OFS))

typedef volatile uint16_t *timer_arr_t;

#define TIMER1_ARR ((timer_arr_t)(TIMER1_BASE_ADR+TMR_ARR_OFS))
#define TIMER2_ARR ((timer_arr_t)(TIMER2_BASE_ADR+TMR_ARR_OFS))
#define TIMER3_ARR ((timer_arr_t)(TIMER3_BASE_ADR+TMR_ARR_OFS))
#define TIMER4_ARR ((timer_arr_t)(TIMER4_BASE_ADR+TMR_ARR_OFS))

typedef volatile uint16_t *timer_ccr_t;

#define TIMER1_CCR1 ((timer_ccr_t)(TIMER1_BASE_ADR+TMR_CCR1_OFS))
#define TIMER2_CCR1 ((timer_ccr_t)(TIMER2_BASE_ADR+TMR_CCR1_OFS))
#define TIMER3_CCR1 ((timer_ccr_t)(TIMER3_BASE_ADR+TMR_CCR1_OFS))
#define TIMER4_CCR1 ((timer_ccr_t)(TIMER4_BASE_ADR+TMR_CCR1_OFS))

#define TIMER1_CCR2 ((timer_ccr_t)(TIMER1_BASE_ADR+TMR_CCR2_OFS))
#define TIMER2_CCR2 ((timer_ccr_t)(TIMER2_BASE_ADR+TMR_CCR2_OFS))
#define TIMER3_CCR2 ((timer_ccr_t)(TIMER3_BASE_ADR+TMR_CCR2_OFS))
#define TIMER4_CCR2 ((timer_ccr_t)(TIMER4_BASE_ADR+TMR_CCR2_OFS))

#define TIMER1_CCR3 ((timer_ccr_t)(TIMER1_BASE_ADR+TMR_CCR3_OFS))
#define TIMER2_CCR3 ((timer_ccr_t)(TIMER2_BASE_ADR+TMR_CCR3_OFS))
#define TIMER3_CCR3 ((timer_ccr_t)(TIMER3_BASE_ADR+TMR_CCR3_OFS))
#define TIMER4_CCR3 ((timer_ccr_t)(TIMER4_BASE_ADR+TMR_CCR3_OFS))

#define TIMER1_CCR4 ((timer_ccr_t)(TIMER1_BASE_ADR+TMR_CCR4_OFS))
#define TIMER2_CCR4 ((timer_ccr_t)(TIMER2_BASE_ADR+TMR_CCR4_OFS))
#define TIMER3_CCR4 ((timer_ccr_t)(TIMER3_BASE_ADR+TMR_CCR4_OFS))
#define TIMER4_CCR4 ((timer_ccr_t)(TIMER4_BASE_ADR+TMR_CCR4_OFS))

typedef union{
	sfr16_t bdtr;
	struct{
		sfr16_t dtg:8;
		sfr16_t lock:2;
		sfr16_t ossi:1;
		sfr16_t ossr:1;
		sfr16_t bke:1;
		sfr16_t bkp:1;
		sfr16_t aoe:1;
		sfr16_t moe:1;
	}fld;
}timer_bdtr_t;

#define TIMER1_BDTR ((timer_bdtr_t*)(TIMER1_BASE_ADR+TMR_BDTR_OFS))

typedef union{
	sfr_t dcr;
	struct{
		sfr_t dba:5;
		sfr_t reserved0:3;
		sfr_t dbl:5;
		sfr_t reserved1:19;
	}fld;
} timer_dcr_t;

#define TIMER1_CCMR2_DCR ((timer_dcr_t*)(TIMER1_BASE_ADR+TMR_CCMR2_DCR_OFS))
#define TIMER2_CCMR2_DCR ((timer_dcr_t*)(TIMER2_BASE_ADR+TMR_CCMR2_DCR_OFS))
#define TIMER3_CCMR2_DCR ((timer_dcr_t*)(TIMER3_BASE_ADR+TMR_CCMR2_DCR_OFS))
#define TIMER4_CCMR2_DCR ((timer_dcr_t*)(TIMER4_BASE_ADR+TMR_CCMR2_DCR_OFS))

typedef volatile uint16_t *timer_dmar_t;

#define TIMER1_DMAR ((timer_dmar_t)(TIMER1_BASE_ADR+TMR_DMAR_OFS))
#define TIMER2_DMAR ((timer_dmar_t)(TIMER2_BASE_ADR+TMR_DMAR_OFS))
#define TIMER3_DMAR ((timer_dmar_t)(TIMER3_BASE_ADR+TMR_DMAR_OFS))
#define TIMER4_DMAR ((timer_dmar_t)(TIMER4_BASE_ADR+TMR_DMAR_OFS))


#endif // PWM_H

