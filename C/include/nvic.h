/*
 * Description: interface pour le gestionnaire d'interruptions.
 * Auteur: PICATOUT
 * Date: 2018-09-03
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef NVIC_H
#define NVIC_H

#include "gen_macros.h"

/**************
 *  exceptions 
 *************/
#define IRQ_MM -4  // memory management
#define IRQ_BF -5  // bus fault
#define IRQ_UF -6  // usage fault
#define IRQ_SVC -11 // SVCall
#define IRQ_DM -12 // debug monitor
#define IRQ_PSV -14 // PendSV
#define IRQ_STK -15 // systicK


/***********
 *  IRQ no
 **********/
#define IRQ_WWDG 0 
#define IRQ_PVD 1
#define IRQ_TAMPER 2
#define IRQ_RTC 3
#define IRQ_FLASH 4
#define IRQ_RCC 5
#define IRQ_EXTI0 6
#define IRQ_EXTI1 7
#define IRQ_EXTI2 8
#define IRQ_EXTI3 9
#define IRQ_EXTI4 10
#define IRQ_DMA1CH1 11
#define IRQ_DMA1CH2 12
#define IRQ_DMA1CH3 13
#define IRQ_DMA1CH4 14
#define IRQ_DMA1CH5 15
#define IRQ_DMA1CH6 16
#define IRQ_DMA1CH7 17
#define IRQ_ADC1_2 18
#define IRQ_USB_HP_CAN_TX 19
#define IRQ_USB_LP_CAN_RX0 20
#define IRQ_CAN_RX1 21
#define IRQ_CAN_SCE 22
#define IRQ_EXTI9_5 23
#define IRQ_TIM1_BRK 24
#define IRQ_TIM1_UP 25
#define IRQ_TIM1_TRG_COM 26
#define IRQ_TIM1_CC 27
#define IRQ_TIM2 28
#define IRQ_TIM3 29
#define IRQ_TIM4 30
#define IRQ_I2C1_EV 31
#define IRQ_I2C1_ER 32
#define IRQ_I2C2_EV 33
#define IRQ_I2C2_ER 34
#define IRQ_SPI1 35
#define IRQ_SPI2 36
#define IRQ_USART1 37
#define IRQ_USART2 38
#define IRQ_USART3 39
#define IRQ_EXTI15_10 40
#define IRQ_RCT_ALARM 41
#define IRQ_USB_WAKEUP 42
#define IRQ_TIM8_BRK 43
#define IRQ_TIM8_UP 44
#define IRQ_TIM8_TRG_COM 45
#define IRQ_TIM8_CC 46
#define IRQ_ADC3 47
#define IRQ_FSMC 48
#define IRQ_SDIO 49
#define IRQ_TIM5 50
#define IRQ_SPI3 51
#define IRQ_UART4 52
#define IRQ_UART5 53
#define IRQ_TIM6 54
#define IRQ_TIM7 55
#define IRQ_DMA2CH1 56
#define IRQ_DMA2CH2 57
#define IRQ_DMA2CH3 58
#define IRQ_DMA2CH4_5 59

#define LAST_IRQ 59 // dernier IRQ


#define NVIC_BASE_ADR 0xE000E100U
#define NVIC_ISER0_ADR (NVIC_BASE_ADR)
#define NVIC_ISER0 _sfr(NVIC_BASE_ADR)
#define NVIC_ISER1 _sfr(NVIC_BASE_ADR+4)
//#define NVIC_ISER2 _sfr(NVIC_BASE_ADR+8)
#define NVIC_ICER0_ADR (NVIC_BASE_ADR+0x80)
#define NVIC_ICER0 _sfr(NVIC_BASE_ADR+0x80)
#define NVIC_ICER1 _sfr(NVIC_BASE_ADR+0x84)
//#define NVIC_ICER2 _sfr(NVIC_BASE_ADR+0x88)
#define NVIC_ISPR0_ADR (NVIC_BASE_ADR+0x100) 
#define NVIC_ISPR0 _sfr(NVIC_BASE_ADR+0x100)
#define NVIC_ISPR1 _sfr(NVIC_BASE_ADR+0x104)
//#define NVIC_ISPR2 _sfr(NVIC_BASE_ADR+0x108)
#define NVIC_ICPR0_ADR (NVIC_BASE_ADR+0x180)
#define NVIC_ICPR0 _sfr(NVIC_BASE_ADR+0x180)
#define NVIC_ICPR1 _sfr(NVIC_BASE_ADR+0x184)
//#define NVIC_ICPR2 _sfr(NVIC_BASE_ADR+0x188)
#define NVIC_IABR0_ADR (NVIC_BASE_ADR+0x200)
#define NVIC_IABR0 _sfr(NVIC_BASE_ADR+0x200)
#define NVIC_IABR1 _sfr(NVIC_BASE_ADR+0x204)
//#define NVIC_IABR2 _sfr(NVIC_BASE_ADR+0x208)
#define NVIC_IPR0_ADR (NVIC_BASE_ADR+0x300)
#define NVIC_IPR0 _sfr(NVIC_BASE_ADR+0x300)
#define NVIC_IPR1 _sfr(NVIC_BASE_ADR+0x304)
#define NVIC_IPR2 _sfr(NVIC_BASE_ADR+0x308)
#define NVIC_IPR3  _sfr(NVIC_BASE_ADR+0x30c)
#define NVIC_IPR4  _sfr(NVIC_BASE_ADR+0x310)
#define NVIC_IPR5  _sfr(NVIC_BASE_ADR+0x314)
#define NVIC_IPR6  _sfr(NVIC_BASE_ADR+0x318)
#define NVIC_IPR7  _sfr(NVIC_BASE_ADR+0x31c)
#define NVIC_IPR8  _sfr(NVIC_BASE_ADR+0x320)
#define NVIC_IPR9  _sfr(NVIC_BASE_ADR+0x324)
#define NVIC_IPR10  _sfr(NVIC_BASE_ADR+0x328)
#define NVIC_IPR11 _sfr(NVIC_BASE_ADR+0x32c)
#define NVIC_IPR12 _sfr(NVIC_BASE_ADR+0x330)
#define NVIC_IPR13  _sfr(NVIC_BASE_ADR+0x334)
#define NVIC_IPR14 _sfr(NVIC_BASE_ADR+0x338)
#define NVIC_IPR15  _sfr(NVIC_BASE_ADR+0x33c)
//#define NVIC_IPR16  _sfr(NVIC_BASE_ADR+0x340)
//#define NVIC_IPR17  _sfr(NVIC_BASE_ADR+0x344)
//#define NVIC_IPR18  _sfr(NVIC_BASE_ADR+0x348)
//#define NVIC_IPR19  _sfr(NVIC_BASE_ADR+0x34c)
//#define NVIC_IPR20  _sfr(NVIC_BASE_ADR+0x350)

#define ISER ((sfrp_t)NVIC_ISER0_ADR) // enable interrupt
#define ICER ((sfrp_t)NVIC_ICER0_ADR) // disable interrupt
#define ISPR ((sfrp_t)NVIC_ISPR0_ADR) // set pending
#define ICPR ((sfrp_t)NVIC_ICPR0_ADR) // clear pending
#define IABR ((sfrp_t)NVIC_IABR0_ADR) // active bit
#define IPR ((uint8_t*)NVIC_IPR0_ADR) // interrupt priority

/*******************************
 *  interruption externes
 *******************************/
#define EXTI_SFR_BASE_ADR 0x40010400

typedef struct{
	sfr_t IMR; // interrupt mask
	sfr_t EMR; // event mask
	sfr_t RTSR; // rising edge trigger set
	sfr_t FTSR; // falling edge trigger set
	sfr_t SWIER; // software inteterrupt even
	sfr_t PR; // pending register
} exti_sfr_t; 
 
#define EXTI ((exti_sfr_t*)EXTI_SFR_BASE_ADR)
 
 
void enable_interrupt(unsigned irq);
void disable_interrupt(unsigned irq);
unsigned get_pending(unsigned irq);
unsigned get_active(unsigned irq);
void set_pending(unsigned irq);
void clear_pending(unsigned irq);
void set_int_priority(int32_t irq, unsigned priority);

#endif // NVIC_H

