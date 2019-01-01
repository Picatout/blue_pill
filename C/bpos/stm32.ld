/*
MEMORY{
	ROM (RX) : ORIGIN = 0, LENGTH = 64K
	RAM (WRX) : ORIGIN = 0x20000000, LENGTH = 20K
	RAMBB (WRX) : ORIGIN = 0x22000000, LENGTH = 640K
}
*/

SECTIONS
{
    .  = 0x0;         /* From 0x00000000 */

    .text : 
    {
        *(vectors)    /* Vector table */
        *(.text.startup) /* startup code */
        *(.text.exception) /* default exception handler */
        *(.text.handler) /* default handler  */
        *(.text)      /* Program code */
    }
    .rodata : 
    {
        *(.rodata)    /* Read only data */
    }
	. = ALIGN(0x400) ;
	_FLASH_FREE = . ;
    
    .user_code : AT(_FLASH_FREE)
    {
		*(user_code) /* user code in flash */
    }
    
    _DATA_ROM_START = .;

    .  = 0x20000000;  /* From 0x20000000 */      

    _DATA_RAM_START = .;
    .data : AT(_DATA_ROM_START) 
    {
        *(.data)      /* Data memory */
    }
    _DATA_RAM_END = .;

    _BSS_START = .;   /* Indicates where BSS section starts in RAM */
    .bss :
    {
        *(.bss)       /* Zero-filled run time allocate data memory */
    }
    _BSS_END = .;     /* Indicates where BSS section ends in RAM */
	
	. = ALIGN(0x100) ;
	_TPA_START = . ;
	
	.transient : AT(_TPA_START)
	{
        *(.transient) /* transient program in RAM*/

	}
} 
