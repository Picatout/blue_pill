
Print assembler code of blink.elf with objdump
arm-none-eabi-objdump -S --disassemble blink.elf

blink.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
   0:	00 50 00 20 09 00 00 00                             .P. ....

00000008 <startup>:
    (unsigned int *)    STACK_TOP,  // stack pointer
    (unsigned int *)    startup     // code entry point
};

void startup()
{
   8:	b580      	push	{r7, lr}
   a:	b086      	sub	sp, #24
   c:	af00      	add	r7, sp, #0
    /* Set memory in bss segment to zeros */
    unsigned int * bss_start_p = &_BSS_START; 
   e:	4b14      	ldr	r3, [pc, #80]	; (60 <startup+0x58>)
  10:	617b      	str	r3, [r7, #20]
    unsigned int * bss_end_p = &_BSS_END;
  12:	4b14      	ldr	r3, [pc, #80]	; (64 <startup+0x5c>)
  14:	60bb      	str	r3, [r7, #8]

    while(bss_start_p != bss_end_p)
  16:	e005      	b.n	24 <startup+0x1c>
    {
        *bss_start_p = 0;
  18:	697b      	ldr	r3, [r7, #20]
  1a:	2200      	movs	r2, #0
  1c:	601a      	str	r2, [r3, #0]
        bss_start_p++;
  1e:	697b      	ldr	r3, [r7, #20]
  20:	3304      	adds	r3, #4
  22:	617b      	str	r3, [r7, #20]
{
    /* Set memory in bss segment to zeros */
    unsigned int * bss_start_p = &_BSS_START; 
    unsigned int * bss_end_p = &_BSS_END;

    while(bss_start_p != bss_end_p)
  24:	697a      	ldr	r2, [r7, #20]
  26:	68bb      	ldr	r3, [r7, #8]
  28:	429a      	cmp	r2, r3
  2a:	d1f5      	bne.n	18 <startup+0x10>
    }

    /* Copy memory in data segment from its position
     * in the flash image to its position in the
     * read/write memory */
    unsigned int * data_rom_start_p = &_DATA_ROM_START;
  2c:	4b0e      	ldr	r3, [pc, #56]	; (68 <startup+0x60>)
  2e:	613b      	str	r3, [r7, #16]
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
  30:	4b0e      	ldr	r3, [pc, #56]	; (6c <startup+0x64>)
  32:	60fb      	str	r3, [r7, #12]
    unsigned int * data_ram_end_p = &_DATA_RAM_END;
  34:	4b0e      	ldr	r3, [pc, #56]	; (70 <startup+0x68>)
  36:	607b      	str	r3, [r7, #4]

    while(data_ram_start_p != data_ram_end_p)
  38:	e009      	b.n	4e <startup+0x46>
    {
        *data_ram_start_p = *data_rom_start_p;
  3a:	693b      	ldr	r3, [r7, #16]
  3c:	681a      	ldr	r2, [r3, #0]
  3e:	68fb      	ldr	r3, [r7, #12]
  40:	601a      	str	r2, [r3, #0]
        data_ram_start_p++;
  42:	68fb      	ldr	r3, [r7, #12]
  44:	3304      	adds	r3, #4
  46:	60fb      	str	r3, [r7, #12]
        data_rom_start_p++;
  48:	693b      	ldr	r3, [r7, #16]
  4a:	3304      	adds	r3, #4
  4c:	613b      	str	r3, [r7, #16]
     * read/write memory */
    unsigned int * data_rom_start_p = &_DATA_ROM_START;
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
    unsigned int * data_ram_end_p = &_DATA_RAM_END;

    while(data_ram_start_p != data_ram_end_p)
  4e:	68fa      	ldr	r2, [r7, #12]
  50:	687b      	ldr	r3, [r7, #4]
  52:	429a      	cmp	r2, r3
  54:	d1f1      	bne.n	3a <startup+0x32>
        data_ram_start_p++;
        data_rom_start_p++;
    }

    /* Now we are ready to start the main function */
    main();
  56:	f000 f84d 	bl	f4 <main>
}
  5a:	3718      	adds	r7, #24
  5c:	46bd      	mov	sp, r7
  5e:	bd80      	pop	{r7, pc}
  60:	20000000 	.word	0x20000000
  64:	20000000 	.word	0x20000000
  68:	00000118 	.word	0x00000118
  6c:	20000000 	.word	0x20000000
  70:	20000000 	.word	0x20000000

00000074 <port_c_setup>:
#define CNF_MASK 0xF
#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
  74:	b480      	push	{r7}
  76:	af00      	add	r7, sp, #0
	RCC_APB2ENR|=GPIOC_EN;
  78:	4a06      	ldr	r2, [pc, #24]	; (94 <port_c_setup+0x20>)
  7a:	4b06      	ldr	r3, [pc, #24]	; (94 <port_c_setup+0x20>)
  7c:	681b      	ldr	r3, [r3, #0]
  7e:	f043 0310 	orr.w	r3, r3, #16
  82:	6013      	str	r3, [r2, #0]
	GPIOC_CRH=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
  84:	4b04      	ldr	r3, [pc, #16]	; (98 <port_c_setup+0x24>)
  86:	4a05      	ldr	r2, [pc, #20]	; (9c <port_c_setup+0x28>)
  88:	601a      	str	r2, [r3, #0]
}
  8a:	46bd      	mov	sp, r7
  8c:	f85d 7b04 	ldr.w	r7, [sp], #4
  90:	4770      	bx	lr
  92:	bf00      	nop
  94:	40021018 	.word	0x40021018
  98:	40011004 	.word	0x40011004
  9c:	44644444 	.word	0x44644444

000000a0 <led_on>:

inline static void led_on(){
  a0:	b480      	push	{r7}
  a2:	af00      	add	r7, sp, #0
	GPIOC_BRR=GRN_LED;
  a4:	4b03      	ldr	r3, [pc, #12]	; (b4 <led_on+0x14>)
  a6:	f44f 5200 	mov.w	r2, #8192	; 0x2000
  aa:	601a      	str	r2, [r3, #0]
}
  ac:	46bd      	mov	sp, r7
  ae:	f85d 7b04 	ldr.w	r7, [sp], #4
  b2:	4770      	bx	lr
  b4:	40011014 	.word	0x40011014

000000b8 <led_off>:

inline static void led_off(){
  b8:	b480      	push	{r7}
  ba:	af00      	add	r7, sp, #0
	GPIOC_BSRR=GRN_LED;
  bc:	4b03      	ldr	r3, [pc, #12]	; (cc <led_off+0x14>)
  be:	f44f 5200 	mov.w	r2, #8192	; 0x2000
  c2:	601a      	str	r2, [r3, #0]
}
  c4:	46bd      	mov	sp, r7
  c6:	f85d 7b04 	ldr.w	r7, [sp], #4
  ca:	4770      	bx	lr
  cc:	40011010 	.word	0x40011010

000000d0 <delay>:

inline static void delay(unsigned dly){
  d0:	b480      	push	{r7}
  d2:	b085      	sub	sp, #20
  d4:	af00      	add	r7, sp, #0
  d6:	6078      	str	r0, [r7, #4]
	unsigned i;
	for (i=dly;i;i--);
  d8:	687b      	ldr	r3, [r7, #4]
  da:	60fb      	str	r3, [r7, #12]
  dc:	e002      	b.n	e4 <delay+0x14>
  de:	68fb      	ldr	r3, [r7, #12]
  e0:	3b01      	subs	r3, #1
  e2:	60fb      	str	r3, [r7, #12]
  e4:	68fb      	ldr	r3, [r7, #12]
  e6:	2b00      	cmp	r3, #0
  e8:	d1f9      	bne.n	de <delay+0xe>
}
  ea:	3714      	adds	r7, #20
  ec:	46bd      	mov	sp, r7
  ee:	f85d 7b04 	ldr.w	r7, [sp], #4
  f2:	4770      	bx	lr

000000f4 <main>:


#define RATE 400000
void main(void){
  f4:	b580      	push	{r7, lr}
  f6:	af00      	add	r7, sp, #0
	port_c_setup();
  f8:	f7ff ffbc 	bl	74 <port_c_setup>
	while (1){
		led_off();
  fc:	f7ff ffdc 	bl	b8 <led_off>
		delay(RATE);
 100:	4804      	ldr	r0, [pc, #16]	; (114 <main+0x20>)
 102:	f7ff ffe5 	bl	d0 <delay>
		led_on();
 106:	f7ff ffcb 	bl	a0 <led_on>
		delay(RATE);
 10a:	4802      	ldr	r0, [pc, #8]	; (114 <main+0x20>)
 10c:	f7ff ffe0 	bl	d0 <delay>
	}
 110:	e7f4      	b.n	fc <main+0x8>
 112:	bf00      	nop
 114:	00061a80 	.word	0x00061a80

Print assembler code of blink.o with objdump
arm-none-eabi-objdump -S --disassemble blink.o

blink.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <port_c_setup>:
#define CNF_MASK 0xF
#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
   0:	b480      	push	{r7}
   2:	af00      	add	r7, sp, #0
	RCC_APB2ENR|=GPIOC_EN;
   4:	4a06      	ldr	r2, [pc, #24]	; (20 <port_c_setup+0x20>)
   6:	4b06      	ldr	r3, [pc, #24]	; (20 <port_c_setup+0x20>)
   8:	681b      	ldr	r3, [r3, #0]
   a:	f043 0310 	orr.w	r3, r3, #16
   e:	6013      	str	r3, [r2, #0]
	GPIOC_CRH=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
  10:	4b04      	ldr	r3, [pc, #16]	; (24 <port_c_setup+0x24>)
  12:	4a05      	ldr	r2, [pc, #20]	; (28 <port_c_setup+0x28>)
  14:	601a      	str	r2, [r3, #0]
}
  16:	46bd      	mov	sp, r7
  18:	f85d 7b04 	ldr.w	r7, [sp], #4
  1c:	4770      	bx	lr
  1e:	bf00      	nop
  20:	40021018 	.word	0x40021018
  24:	40011004 	.word	0x40011004
  28:	44644444 	.word	0x44644444

0000002c <led_on>:

inline static void led_on(){
  2c:	b480      	push	{r7}
  2e:	af00      	add	r7, sp, #0
	GPIOC_BRR=GRN_LED;
  30:	4b03      	ldr	r3, [pc, #12]	; (40 <led_on+0x14>)
  32:	f44f 5200 	mov.w	r2, #8192	; 0x2000
  36:	601a      	str	r2, [r3, #0]
}
  38:	46bd      	mov	sp, r7
  3a:	f85d 7b04 	ldr.w	r7, [sp], #4
  3e:	4770      	bx	lr
  40:	40011014 	.word	0x40011014

00000044 <led_off>:

inline static void led_off(){
  44:	b480      	push	{r7}
  46:	af00      	add	r7, sp, #0
	GPIOC_BSRR=GRN_LED;
  48:	4b03      	ldr	r3, [pc, #12]	; (58 <led_off+0x14>)
  4a:	f44f 5200 	mov.w	r2, #8192	; 0x2000
  4e:	601a      	str	r2, [r3, #0]
}
  50:	46bd      	mov	sp, r7
  52:	f85d 7b04 	ldr.w	r7, [sp], #4
  56:	4770      	bx	lr
  58:	40011010 	.word	0x40011010

0000005c <delay>:

inline static void delay(unsigned dly){
  5c:	b480      	push	{r7}
  5e:	b085      	sub	sp, #20
  60:	af00      	add	r7, sp, #0
  62:	6078      	str	r0, [r7, #4]
	unsigned i;
	for (i=dly;i;i--);
  64:	687b      	ldr	r3, [r7, #4]
  66:	60fb      	str	r3, [r7, #12]
  68:	e002      	b.n	70 <delay+0x14>
  6a:	68fb      	ldr	r3, [r7, #12]
  6c:	3b01      	subs	r3, #1
  6e:	60fb      	str	r3, [r7, #12]
  70:	68fb      	ldr	r3, [r7, #12]
  72:	2b00      	cmp	r3, #0
  74:	d1f9      	bne.n	6a <delay+0xe>
}
  76:	3714      	adds	r7, #20
  78:	46bd      	mov	sp, r7
  7a:	f85d 7b04 	ldr.w	r7, [sp], #4
  7e:	4770      	bx	lr

00000080 <main>:


#define RATE 400000
void main(void){
  80:	b580      	push	{r7, lr}
  82:	af00      	add	r7, sp, #0
	port_c_setup();
  84:	f7ff ffbc 	bl	0 <port_c_setup>
	while (1){
		led_off();
  88:	f7ff ffdc 	bl	44 <led_off>
		delay(RATE);
  8c:	4804      	ldr	r0, [pc, #16]	; (a0 <main+0x20>)
  8e:	f7ff ffe5 	bl	5c <delay>
		led_on();
  92:	f7ff ffcb 	bl	2c <led_on>
		delay(RATE);
  96:	4802      	ldr	r0, [pc, #8]	; (a0 <main+0x20>)
  98:	f7ff ffe0 	bl	5c <delay>
	}
  9c:	e7f4      	b.n	88 <main+0x8>
  9e:	bf00      	nop
  a0:	00061a80 	.word	0x00061a80

Print assembler code of startup.o with objdump
arm-none-eabi-objdump -S --disassemble startup.o

startup.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <startup>:
    (unsigned int *)    STACK_TOP,  // stack pointer
    (unsigned int *)    startup     // code entry point
};

void startup()
{
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	af00      	add	r7, sp, #0
    /* Set memory in bss segment to zeros */
    unsigned int * bss_start_p = &_BSS_START; 
   6:	4b14      	ldr	r3, [pc, #80]	; (58 <startup+0x58>)
   8:	617b      	str	r3, [r7, #20]
    unsigned int * bss_end_p = &_BSS_END;
   a:	4b14      	ldr	r3, [pc, #80]	; (5c <startup+0x5c>)
   c:	60bb      	str	r3, [r7, #8]

    while(bss_start_p != bss_end_p)
   e:	e005      	b.n	1c <startup+0x1c>
    {
        *bss_start_p = 0;
  10:	697b      	ldr	r3, [r7, #20]
  12:	2200      	movs	r2, #0
  14:	601a      	str	r2, [r3, #0]
        bss_start_p++;
  16:	697b      	ldr	r3, [r7, #20]
  18:	3304      	adds	r3, #4
  1a:	617b      	str	r3, [r7, #20]
{
    /* Set memory in bss segment to zeros */
    unsigned int * bss_start_p = &_BSS_START; 
    unsigned int * bss_end_p = &_BSS_END;

    while(bss_start_p != bss_end_p)
  1c:	697a      	ldr	r2, [r7, #20]
  1e:	68bb      	ldr	r3, [r7, #8]
  20:	429a      	cmp	r2, r3
  22:	d1f5      	bne.n	10 <startup+0x10>
    }

    /* Copy memory in data segment from its position
     * in the flash image to its position in the
     * read/write memory */
    unsigned int * data_rom_start_p = &_DATA_ROM_START;
  24:	4b0e      	ldr	r3, [pc, #56]	; (60 <startup+0x60>)
  26:	613b      	str	r3, [r7, #16]
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
  28:	4b0e      	ldr	r3, [pc, #56]	; (64 <startup+0x64>)
  2a:	60fb      	str	r3, [r7, #12]
    unsigned int * data_ram_end_p = &_DATA_RAM_END;
  2c:	4b0e      	ldr	r3, [pc, #56]	; (68 <startup+0x68>)
  2e:	607b      	str	r3, [r7, #4]

    while(data_ram_start_p != data_ram_end_p)
  30:	e009      	b.n	46 <startup+0x46>
    {
        *data_ram_start_p = *data_rom_start_p;
  32:	693b      	ldr	r3, [r7, #16]
  34:	681a      	ldr	r2, [r3, #0]
  36:	68fb      	ldr	r3, [r7, #12]
  38:	601a      	str	r2, [r3, #0]
        data_ram_start_p++;
  3a:	68fb      	ldr	r3, [r7, #12]
  3c:	3304      	adds	r3, #4
  3e:	60fb      	str	r3, [r7, #12]
        data_rom_start_p++;
  40:	693b      	ldr	r3, [r7, #16]
  42:	3304      	adds	r3, #4
  44:	613b      	str	r3, [r7, #16]
     * read/write memory */
    unsigned int * data_rom_start_p = &_DATA_ROM_START;
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
    unsigned int * data_ram_end_p = &_DATA_RAM_END;

    while(data_ram_start_p != data_ram_end_p)
  46:	68fa      	ldr	r2, [r7, #12]
  48:	687b      	ldr	r3, [r7, #4]
  4a:	429a      	cmp	r2, r3
  4c:	d1f1      	bne.n	32 <startup+0x32>
        data_ram_start_p++;
        data_rom_start_p++;
    }

    /* Now we are ready to start the main function */
    main();
  4e:	f7ff fffe 	bl	0 <main>
}
  52:	3718      	adds	r7, #24
  54:	46bd      	mov	sp, r7
  56:	bd80      	pop	{r7, pc}
	...
