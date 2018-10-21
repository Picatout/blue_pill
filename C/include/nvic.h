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

#include "core.h"

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


void enable_interrupt(unsigned irq);
void disable_interrupt(unsigned irq);
void set_int_priority(int32_t irq, unsigned priority);

#endif // NVIC_H

