#include "../include/stm32f103c8.h"

#define STACK_TOP 0x20005000

extern unsigned int _BSS_START;
extern unsigned int _BSS_END;
extern unsigned int _DATA_ROM_START;
extern unsigned int _DATA_RAM_START;
extern unsigned int _DATA_RAM_END;

void startup();
void main();
void systick_int();
void default_int();
void SVcall_handler();

// Define the vector table
unsigned int * myvectors[76] 
__attribute__ ((section("vectors")))= {
	// --------- core exceptions -----------
    (unsigned int *)    STACK_TOP,  // 0 stack pointer
    (unsigned int *)    startup,     // 1 reset entry point
    (unsigned int *)  default_int, // 2 NMI
    (unsigned int *)  default_int, // 3 Hard fault
    (unsigned int *)  default_int, // 4 MM fault
    (unsigned int *)  default_int, // 5 bus fault
    (unsigned int *)  default_int, // 6 usage fault
    (unsigned int *)  default_int, // 7 reserved
    (unsigned int *)  default_int, // 8 reserved
    (unsigned int *)  default_int, // 9 reserved
    (unsigned int *)  default_int, // 10 reserved
    (unsigned int *)  SVcall_handler, // 11 SVCall
    (unsigned int *)  default_int, // 12 debug monitor
    (unsigned int *)  default_int, // 13 reserved
    (unsigned int *)  default_int, // 14 PendSV
    (unsigned int *)  systick_int, // 15 compteur systick    
    // --------  IRQ ------------
    (unsigned int *)  default_int, // 0 WWDG
    (unsigned int *)  default_int, // 1 PVD
    (unsigned int *)  default_int, // 2 TAMPER
    (unsigned int *)  default_int, // 3 RTC
    (unsigned int *)  default_int, // 4 FLASH
    (unsigned int *)  default_int, // 5 RCC
    (unsigned int *)  default_int, // 6 EXTI0
    (unsigned int *)  default_int, // 7 EXTI1
    (unsigned int *)  default_int, // 8 EXTI2
    (unsigned int *)  default_int, // 9 EXTI3
    (unsigned int *)  default_int, // 10 EXTI4
    (unsigned int *)  default_int, // 11 DMA1CH1
    (unsigned int *)  default_int, // 12 DMA1CH2
    (unsigned int *)  default_int, // 13 DMA1CH3
    (unsigned int *)  default_int, // 14 DMA1CH4
    (unsigned int *)  default_int, // 15 DMA1CH5
    (unsigned int *)  default_int, // 16 DMA1CH6
    (unsigned int *)  default_int, // 17 DMA1CH7
    (unsigned int *)  default_int, // 18 ADC1_2
    (unsigned int *)  default_int, // 19 USB_HP_CAN_TX
    (unsigned int *)  default_int, // 20 USB_LP_CAN_RX0
    (unsigned int *)  default_int, // 21 CAN_RX1
    (unsigned int *)  default_int, // 22 CAN_SCE
    (unsigned int *)  default_int, // 23 EXTI9_5
    (unsigned int *)  default_int, // 24 TIM1_BRK
    (unsigned int *)  default_int, // 25 TIM1_UP
    (unsigned int *)  default_int, // 26 TIM1_TRG_COM
    (unsigned int *)  default_int, // 27 TIM1_CC
    (unsigned int *)  default_int, // 28 TIM2
    (unsigned int *)  default_int, // 29 TIM3
    (unsigned int *)  default_int, // 30 TIM4
    (unsigned int *)  default_int, // 31 I2C1_EV
    (unsigned int *)  default_int, // 32 I2C1_ER
    (unsigned int *)  default_int, // 33 I2C2_EV
    (unsigned int *)  default_int, // 34 I2C2_ER
    (unsigned int *)  default_int, // 35 SPI1
    (unsigned int *)  default_int, // 36 SPI2
    (unsigned int *)  default_int, // 37 USART1
    (unsigned int *)  default_int, // 38 USART2
    (unsigned int *)  default_int, // 39 USART3
    (unsigned int *)  default_int, // 40 EXTI15_10
    (unsigned int *)  default_int, // 41 RTCArlarm
    (unsigned int *)  default_int, // 42 USBWakeup
    (unsigned int *)  default_int, // 43 TIM8_BRK
    (unsigned int *)  default_int, // 44 TIM8_UP
    (unsigned int *)  default_int, // 45 TIM8_TRG_COM
    (unsigned int *)  default_int, // 46 TIM8_CC
    (unsigned int *)  default_int, // 47 ADC3
    (unsigned int *)  default_int, // 48 FSMC
    (unsigned int *)  default_int, // 49 SDIO
    (unsigned int *)  default_int, // 50 TIM5
    (unsigned int *)  default_int, // 51 SPI3
    (unsigned int *)  default_int, // 52 UART4
    (unsigned int *)  default_int, // 53 UART5
    (unsigned int *)  default_int, // 54 TIM6
    (unsigned int *)  default_int, // 55 TIM7
    (unsigned int *)  default_int, // 56 DAM2CH1
    (unsigned int *)  default_int, // 57 DMA2CH2
    (unsigned int *)  default_int, // 58 DMA2CH3
    (unsigned int *)  default_int, // 59 DMA2CH4_5
};

#define SYSRESETREQ (2) // system reset request field, 1 bit
#define VECTKEY (16) // unlock key field, 16 bits
#define KEY (0x05FA) // key value
#define AIRCR _sfr(0xE000ED0C) // Application Interrupt and Reset Control Register
void __attribute__((__interrupt__)) default_int(){
// réinitialise le µC
   AIRCR=(KEY<<VECTKEY)|(1<<SYSRESETREQ);
}

void startup()
{
    /* Set memory in bss segment to zeros */
    unsigned int * bss_start_p = &_BSS_START; 
    unsigned int * bss_end_p = &_BSS_END;

    while(bss_start_p != bss_end_p)
    {
        *bss_start_p = 0;
        bss_start_p++;
    }

    /* Copy memory in data segment from its position
     * in the flash image to its position in the
     * read/write memory */
    unsigned int * data_rom_start_p = &_DATA_ROM_START;
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
    unsigned int * data_ram_end_p = &_DATA_RAM_END;

    while(data_ram_start_p != data_ram_end_p)
    {
        *data_ram_start_p = *data_rom_start_p;
        data_ram_start_p++;
        data_rom_start_p++;
    }

    /* Now we are ready to start the main function */
    main();
}
