#include "stm32f103c8.h"

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

// Define the vector table
unsigned int * myvectors[16] 
__attribute__ ((section("vectors")))= {
    (unsigned int *)    STACK_TOP,  // 0 stack pointer
    (unsigned int *)    startup,     // 1 code entry point
    (unsigned int *)  default_int, // 2 NMI, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 3 Hard fault, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 4 MM fault, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 5 bus fault, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 6 usage fault, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 7 reserved, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 8 reserved, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 9 reserved, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 10 reserved, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 11 SVCall, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 12 debug monitor, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 13 reserved, réinitialise l'ordinateur
    (unsigned int *)  default_int, // 14 PendSV, réinitialise l'ordinateur
    (unsigned int *)  systick_int, // 15 compteur systick    
    // --------  IRQ ------------
    
};

void __attribute__((__interrupt__)) default_int(){
// réinitialise le µC
   startup();	
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
