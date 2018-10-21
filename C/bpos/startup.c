#include "../include/stm32f103c8.h"
#include "../include/nvic.h"
#include "../include/console.h"


/* NOTE:
 * A la réinitialisation le µC est en mode thread privilégié
 * et utlise la pile MSP (pile principale) dont l'adresse
 * est en position zéro de la table des vecteurs d'interruptions
 * Cependant ARM recommande d'utiliser la pile PSP (pile programme)
 * lorsque de µC est en mode thread.
 * Donc avant de lancer la fonction main on initialise la pile PSP 
 * RÉVISIONS:
 *    2018-09-18:  Ajout de la macro _default_handler()
 */
// MSP Main Stack Pointer
#define STACK_TOP 0x20005000  // MSP top
#define MSP_SIZE 1024 // grandeur de la pile MSP
// PSP Program Stack Pointer
#define PSP_TOP (STACK_TOP-MSP_SIZE) 

extern unsigned int _BSS_START;
extern unsigned int _BSS_END;
extern unsigned int _DATA_ROM_START;
extern unsigned int _DATA_RAM_START;
extern unsigned int _DATA_RAM_END;
extern unsigned int _TCA_START;
extern unsigned int _FLASH_FREE;

extern uint32_t proga;

void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
   
}

#define _exception(name) void __attribute__((interrupt,weak,section(".text.exception"))) name()


#define _default_handler(name)  void __attribute__((naked,weak,section(".text.handler"))) name(){reset_mcu();};

// les gestionnaires d'interruption par défaut
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
_default_handler(MM_FAULT_handler)
_default_handler(BUS_FAULT_handler)
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
	print(msg);
	print("at address ");
	if (adr) {
		print_hex(adr);
	};
	conout(CR);
	print("UFSR=");
	print_hex(CFSR->fsr.usageFalt);
	print(", BFSR=");
	print_hex(CFSR->fsr.busFault);
	print(", MMFSR=");
	print_hex(CFSR->fsr.mmFault);
	while(1);
}


_exception(HARD_FAULT_handler){
		uint32_t adr;
		asm volatile (
	"mrs r0,PSP\n" // optient la valeur de PSP
	"ldr %[adr],[r0,#24]\n" // obtient le PC
    : [adr] "=r" (adr)
    :
    :"r0");
	if ((CFSR->fsr.mmFault)&0x7f){
		print_fault("memory manager fault ",adr);
	}else if ((CFSR->fsr.busFault)&0xff){
		print_fault("bus fault ",adr);
	}else if ((CFSR->fsr.usageFalt)&0xffff){
		print_fault("usage fault ",adr);
	}else{
		print_fault("hard fault  ",adr);
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
_default_handler(PVD_handler) // 1
_default_handler(RTC_handler) // 2
_default_handler(TAMPER_handler) // 3
_default_handler(FLASH_handler) // 4
_default_handler(RCC_handler) // 5
_default_handler(EXTI0_handler) // 6
_default_handler(EXTI1_handler) // 7
_default_handler(EXTI2_handler) // 8
_default_handler(EXTI3_handler) // 9
_default_handler(EXTI4_handler) // 10
_default_handler(DMA1CH1_handler) // 11
_default_handler(DMA1CH2_handler) // 12

_default_handler(USART1_handler) // 37
_default_handler(USART2_handler) // 38
_default_handler(USART3_handler) // 39




// Define the vector table
// Les vecteurs sans gestionnaire d'interruption
// définis réinitialisent le mcu s'ils sont activés.
unsigned int * myvectors[76] 
__attribute__ ((section("vectors")))= {
	// --------- core exceptions -----------
    (unsigned int *)    STACK_TOP,  // 0 stack pointer
    (unsigned int *)    startup,     // 1 reset entry point
    (unsigned int *)  NMI_handler, // 2 NMI
    (unsigned int *)  HARD_FAULT_handler, // 3 Hard fault
    (unsigned int *)  MM_FAULT_handler, // 4 MM fault
    (unsigned int *)  BUS_FAULT_handler, // 5 bus fault
    (unsigned int *)  USAGE_FAULT_handler, // 6 usage fault
    (unsigned int *)  reset_mcu, // 7 reserved
    (unsigned int *)  reset_mcu, // 8 reserved
    (unsigned int *)  reset_mcu, // 9 reserved
    (unsigned int *)  reset_mcu, // 10 reserved
    (unsigned int *)  SVC_handler, // 11 SVCall
    (unsigned int *)  reset_mcu, // 12 debug monitor
    (unsigned int *)  reset_mcu, // 13 reserved
    (unsigned int *)  PENDSV_handler, // 14 PendSV
    (unsigned int *)  STK_handler, // 15 compteur systick    
    // --------  IRQ ------------
    (unsigned int *)  WWDG_handler, // 0 WWDG
    (unsigned int *)  PVD_handler, // 1 PVD
    (unsigned int *)  TAMPER_handler, // 2 TAMPER
    (unsigned int *)  RTC_handler, // 3 RTC
    (unsigned int *)  FLASH_handler, // 4 FLASH
    (unsigned int *)  RCC_handler, // 5 RCC
    (unsigned int *)  EXTI0_handler, // 6 EXTI0
    (unsigned int *)  EXTI1_handler, // 7 EXTI1
    (unsigned int *)  EXTI2_handler, // 8 EXTI2
    (unsigned int *)  EXTI3_handler, // 9 EXTI3
    (unsigned int *)  EXTI4_handler, // 10 EXTI4
    (unsigned int *)  DMA1CH1_handler, // 11 DMA1CH1
    (unsigned int *)  DMA1CH2_handler, // 12 DMA1CH2
    (unsigned int *)  reset_mcu, // 13 DMA1CH3
    (unsigned int *)  reset_mcu, // 14 DMA1CH4
    (unsigned int *)  reset_mcu, // 15 DMA1CH5
    (unsigned int *)  reset_mcu, // 16 DMA1CH6
    (unsigned int *)  reset_mcu, // 17 DMA1CH7
    (unsigned int *)  reset_mcu, // 18 ADC1_2
    (unsigned int *)  reset_mcu, // 19 USB_HP_CAN_TX
    (unsigned int *)  reset_mcu, // 20 USB_LP_CAN_RX0
    (unsigned int *)  reset_mcu, // 21 CAN_RX1
    (unsigned int *)  reset_mcu, // 22 CAN_SCE
    (unsigned int *)  reset_mcu, // 23 EXTI9_5
    (unsigned int *)  reset_mcu, // 24 TIM1_BRK
    (unsigned int *)  reset_mcu, // 25 TIM1_UP
    (unsigned int *)  reset_mcu, // 26 TIM1_TRG_COM
    (unsigned int *)  reset_mcu, // 27 TIM1_CC
    (unsigned int *)  reset_mcu, // 28 TIM2
    (unsigned int *)  reset_mcu, // 29 TIM3
    (unsigned int *)  reset_mcu, // 30 TIM4
    (unsigned int *)  reset_mcu, // 31 I2C1_EV
    (unsigned int *)  reset_mcu, // 32 I2C1_ER
    (unsigned int *)  reset_mcu, // 33 I2C2_EV
    (unsigned int *)  reset_mcu, // 34 I2C2_ER
    (unsigned int *)  reset_mcu, // 35 SPI1
    (unsigned int *)  reset_mcu, // 36 SPI2
    (unsigned int *)  USART1_handler, // 37 USART1
    (unsigned int *)  USART2_handler, // 38 USART2
    (unsigned int *)  USART3_handler, // 39 USART3
    (unsigned int *)  reset_mcu, // 40 EXTI15_10
    (unsigned int *)  reset_mcu, // 41 RTCArlarm
    (unsigned int *)  reset_mcu, // 42 USBWakeup
    (unsigned int *)  reset_mcu, // 43 TIM8_BRK
    (unsigned int *)  reset_mcu, // 44 TIM8_UP
    (unsigned int *)  reset_mcu, // 45 TIM8_TRG_COM
    (unsigned int *)  reset_mcu, // 46 TIM8_CC
    (unsigned int *)  reset_mcu, // 47 ADC3
    (unsigned int *)  reset_mcu, // 48 FSMC
    (unsigned int *)  reset_mcu, // 49 SDIO
    (unsigned int *)  reset_mcu, // 50 TIM5
    (unsigned int *)  reset_mcu, // 51 SPI3
    (unsigned int *)  reset_mcu, // 52 UART4
    (unsigned int *)  reset_mcu, // 53 UART5
    (unsigned int *)  reset_mcu, // 54 TIM6
    (unsigned int *)  reset_mcu, // 55 TIM7
    (unsigned int *)  reset_mcu, // 56 DAM2CH1
    (unsigned int *)  reset_mcu, // 57 DMA2CH2
    (unsigned int *)  reset_mcu, // 58 DMA2CH3
    (unsigned int *)  reset_mcu, // 59 DMA2CH4_5
};


 __attribute__((section(".text.startup"))) void startup()
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

	proga=((uint32_t)&_TCA_START)|1;
	// active les interruptions et les fault handler
	//SCB_CCR->fld_ccr.unalign_trp=1;
	//SCB_CCR->fld_ccr.div_0_trp=1;
	CCR->ccr|=1|(1<<3)|(1<<4);
    __enable_irq();
    __enable_fault_irq();
    // initialisaton de la pile PSP et commutation 
    // vers cette pile.
    asm volatile(
    "mov r0, %[psp_top]\n"
    "msr PSP,r0\n"
    "mrs r0,CONTROL\n"
    "orr r0,#2\n"
    "msr CONTROL,r0\n"
    "isb\n"
    :: [psp_top] "r" (PSP_TOP)
    );
    /* Now we are ready to start the main function */
    main();
}
