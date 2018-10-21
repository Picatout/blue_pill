
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 69 15 00 00     i...m...q...i...
      20:	69 15 00 00 69 15 00 00 69 15 00 00 a9 05 00 00     i...i...i.......
      30:	69 15 00 00 69 15 00 00 79 02 00 00 15 07 00 00     i...i...y.......
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 69 15 00 00 69 15 00 00 69 15 00 00     ....i...i...i...
      80:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      90:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      a0:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      b0:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      c0:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      d0:	69 15 00 00 b5 02 00 00 bd 0e 00 00 bd 02 00 00     i...............
      e0:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      f0:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
     100:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
     110:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
     120:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...

00000130 <startup>:
    (unsigned int *)  reset_mcu, // 59 DMA2CH4_5
};


 __attribute__((section(".text.startup"))) void startup()
{
     130:	b580      	push	{r7, lr}
     132:	b086      	sub	sp, #24
     134:	af00      	add	r7, sp, #0
    /* Set memory in bss segment to zeros */
    unsigned int * bss_start_p = &_BSS_START; 
     136:	4b21      	ldr	r3, [pc, #132]	; (1bc <startup+0x8c>)
     138:	617b      	str	r3, [r7, #20]
    unsigned int * bss_end_p = &_BSS_END;
     13a:	4b21      	ldr	r3, [pc, #132]	; (1c0 <startup+0x90>)
     13c:	60bb      	str	r3, [r7, #8]

    while(bss_start_p != bss_end_p)
     13e:	e005      	b.n	14c <startup+0x1c>
    {
        *bss_start_p = 0;
     140:	697b      	ldr	r3, [r7, #20]
     142:	2200      	movs	r2, #0
     144:	601a      	str	r2, [r3, #0]
        bss_start_p++;
     146:	697b      	ldr	r3, [r7, #20]
     148:	3304      	adds	r3, #4
     14a:	617b      	str	r3, [r7, #20]
{
    /* Set memory in bss segment to zeros */
    unsigned int * bss_start_p = &_BSS_START; 
    unsigned int * bss_end_p = &_BSS_END;

    while(bss_start_p != bss_end_p)
     14c:	697a      	ldr	r2, [r7, #20]
     14e:	68bb      	ldr	r3, [r7, #8]
     150:	429a      	cmp	r2, r3
     152:	d1f5      	bne.n	140 <startup+0x10>
    }

    /* Copy memory in data segment from its position
     * in the flash image to its position in the
     * read/write memory */
    unsigned int * data_rom_start_p = &_DATA_ROM_START;
     154:	4b1b      	ldr	r3, [pc, #108]	; (1c4 <startup+0x94>)
     156:	613b      	str	r3, [r7, #16]
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
     158:	4b1b      	ldr	r3, [pc, #108]	; (1c8 <startup+0x98>)
     15a:	60fb      	str	r3, [r7, #12]
    unsigned int * data_ram_end_p = &_DATA_RAM_END;
     15c:	4b1b      	ldr	r3, [pc, #108]	; (1cc <startup+0x9c>)
     15e:	607b      	str	r3, [r7, #4]

    while(data_ram_start_p != data_ram_end_p)
     160:	e009      	b.n	176 <startup+0x46>
    {
        *data_ram_start_p = *data_rom_start_p;
     162:	693b      	ldr	r3, [r7, #16]
     164:	681a      	ldr	r2, [r3, #0]
     166:	68fb      	ldr	r3, [r7, #12]
     168:	601a      	str	r2, [r3, #0]
        data_ram_start_p++;
     16a:	68fb      	ldr	r3, [r7, #12]
     16c:	3304      	adds	r3, #4
     16e:	60fb      	str	r3, [r7, #12]
        data_rom_start_p++;
     170:	693b      	ldr	r3, [r7, #16]
     172:	3304      	adds	r3, #4
     174:	613b      	str	r3, [r7, #16]
     * read/write memory */
    unsigned int * data_rom_start_p = &_DATA_ROM_START;
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
    unsigned int * data_ram_end_p = &_DATA_RAM_END;

    while(data_ram_start_p != data_ram_end_p)
     176:	68fa      	ldr	r2, [r7, #12]
     178:	687b      	ldr	r3, [r7, #4]
     17a:	429a      	cmp	r2, r3
     17c:	d1f1      	bne.n	162 <startup+0x32>
        *data_ram_start_p = *data_rom_start_p;
        data_ram_start_p++;
        data_rom_start_p++;
    }

	proga=((uint32_t)&_TCA_START)|1;
     17e:	4b14      	ldr	r3, [pc, #80]	; (1d0 <startup+0xa0>)
     180:	f043 0301 	orr.w	r3, r3, #1
     184:	4a13      	ldr	r2, [pc, #76]	; (1d4 <startup+0xa4>)
     186:	6013      	str	r3, [r2, #0]
	// active les interruptions et les fault handler
	//SCB_CCR->fld_ccr.unalign_trp=1;
	//SCB_CCR->fld_ccr.div_0_trp=1;
	CCR->ccr|=1|(1<<3)|(1<<4);
     188:	4a13      	ldr	r2, [pc, #76]	; (1d8 <startup+0xa8>)
     18a:	4b13      	ldr	r3, [pc, #76]	; (1d8 <startup+0xa8>)
     18c:	681b      	ldr	r3, [r3, #0]
     18e:	f043 0319 	orr.w	r3, r3, #25
     192:	6013      	str	r3, [r2, #0]
    __enable_irq();
     194:	b662      	cpsie	i
    __enable_fault_irq();
     196:	b661      	cpsie	f
    // initialisaton de la pile PSP et commutation 
    // vers cette pile.
    asm volatile(
     198:	4b10      	ldr	r3, [pc, #64]	; (1dc <startup+0xac>)
     19a:	4618      	mov	r0, r3
     19c:	f380 8809 	msr	PSP, r0
     1a0:	f3ef 8014 	mrs	r0, CONTROL
     1a4:	f040 0002 	orr.w	r0, r0, #2
     1a8:	f380 8814 	msr	CONTROL, r0
     1ac:	f3bf 8f6f 	isb	sy
    "msr CONTROL,r0\n"
    "isb\n"
    :: [psp_top] "r" (PSP_TOP)
    );
    /* Now we are ready to start the main function */
    main();
     1b0:	f000 fe3e 	bl	e30 <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	20000004 	.word	0x20000004
     1c0:	200000dc 	.word	0x200000dc
     1c4:	00001a80 	.word	0x00001a80
     1c8:	20000000 	.word	0x20000000
     1cc:	20000004 	.word	0x20000004
     1d0:	200000e0 	.word	0x200000e0
     1d4:	200000d8 	.word	0x200000d8
     1d8:	e000ed14 	.word	0xe000ed14
     1dc:	20004c00 	.word	0x20004c00

000001e0 <HARD_FAULT_handler>:
	print_hex(CFSR->fsr.mmFault);
	while(1);
}


_exception(HARD_FAULT_handler){
     1e0:	4668      	mov	r0, sp
     1e2:	f020 0107 	bic.w	r1, r0, #7
     1e6:	468d      	mov	sp, r1
     1e8:	b581      	push	{r0, r7, lr}
     1ea:	b083      	sub	sp, #12
     1ec:	af00      	add	r7, sp, #0
		uint32_t adr;
		asm volatile (
     1ee:	f3ef 8009 	mrs	r0, PSP
     1f2:	6983      	ldr	r3, [r0, #24]
     1f4:	607b      	str	r3, [r7, #4]
	"mrs r0,PSP\n" // optient la valeur de PSP
	"ldr %[adr],[r0,#24]\n" // obtient le PC
    : [adr] "=r" (adr)
    :
    :"r0");
	if ((CFSR->fsr.mmFault)&0x7f){
     1f6:	4b16      	ldr	r3, [pc, #88]	; (250 <HARD_FAULT_handler+0x70>)
     1f8:	681b      	ldr	r3, [r3, #0]
     1fa:	b2db      	uxtb	r3, r3
     1fc:	f003 037f 	and.w	r3, r3, #127	; 0x7f
     200:	2b00      	cmp	r3, #0
     202:	d004      	beq.n	20e <HARD_FAULT_handler+0x2e>
		print_fault("memory manager fault ",adr);
     204:	4813      	ldr	r0, [pc, #76]	; (254 <HARD_FAULT_handler+0x74>)
     206:	6879      	ldr	r1, [r7, #4]
     208:	f001 f9b6 	bl	1578 <print_fault>
     20c:	e019      	b.n	242 <HARD_FAULT_handler+0x62>
	}else if ((CFSR->fsr.busFault)&0xff){
     20e:	4b10      	ldr	r3, [pc, #64]	; (250 <HARD_FAULT_handler+0x70>)
     210:	681b      	ldr	r3, [r3, #0]
     212:	0a1b      	lsrs	r3, r3, #8
     214:	b2db      	uxtb	r3, r3
     216:	2b00      	cmp	r3, #0
     218:	d004      	beq.n	224 <HARD_FAULT_handler+0x44>
		print_fault("bus fault ",adr);
     21a:	480f      	ldr	r0, [pc, #60]	; (258 <HARD_FAULT_handler+0x78>)
     21c:	6879      	ldr	r1, [r7, #4]
     21e:	f001 f9ab 	bl	1578 <print_fault>
     222:	e00e      	b.n	242 <HARD_FAULT_handler+0x62>
	}else if ((CFSR->fsr.usageFalt)&0xffff){
     224:	4b0a      	ldr	r3, [pc, #40]	; (250 <HARD_FAULT_handler+0x70>)
     226:	681b      	ldr	r3, [r3, #0]
     228:	0c1b      	lsrs	r3, r3, #16
     22a:	b29b      	uxth	r3, r3
     22c:	2b00      	cmp	r3, #0
     22e:	d004      	beq.n	23a <HARD_FAULT_handler+0x5a>
		print_fault("usage fault ",adr);
     230:	480a      	ldr	r0, [pc, #40]	; (25c <HARD_FAULT_handler+0x7c>)
     232:	6879      	ldr	r1, [r7, #4]
     234:	f001 f9a0 	bl	1578 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f001 f99b 	bl	1578 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	000019a4 	.word	0x000019a4
     258:	000019bc 	.word	0x000019bc
     25c:	000019c8 	.word	0x000019c8
     260:	000019d8 	.word	0x000019d8

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f001 f980 	bl	1568 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f001 f97e 	bl	1568 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f001 f97c 	bl	1568 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f001 f97a 	bl	1568 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f001 f978 	bl	1568 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f001 f976 	bl	1568 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f001 f974 	bl	1568 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f001 f972 	bl	1568 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f001 f970 	bl	1568 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f001 f96e 	bl	1568 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f001 f96c 	bl	1568 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f001 f96a 	bl	1568 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f001 f968 	bl	1568 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f001 f966 	bl	1568 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f001 f964 	bl	1568 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f001 f962 	bl	1568 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f001 f960 	bl	1568 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f001 f95e 	bl	1568 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f001 f95c 	bl	1568 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f001 f95a 	bl	1568 <reset_mcu>

000002b4 <USART1_handler>:

_default_handler(USART1_handler) // 37
     2b4:	f001 f958 	bl	1568 <reset_mcu>
_default_handler(USART2_handler) // 38
     2b8:	f001 f956 	bl	1568 <reset_mcu>

000002bc <USART3_handler>:
_default_handler(USART3_handler) // 39
     2bc:	f001 f954 	bl	1568 <reset_mcu>

000002c0 <strcmp>:
extern unsigned int _FLASH_FREE;
extern unsigned int _DATA_ROM_START;

uint32_t proga;

int strcmp(const char *s1, const char *s2){
     2c0:	b480      	push	{r7}
     2c2:	b085      	sub	sp, #20
     2c4:	af00      	add	r7, sp, #0
     2c6:	6078      	str	r0, [r7, #4]
     2c8:	6039      	str	r1, [r7, #0]
	int result=0;
     2ca:	2300      	movs	r3, #0
     2cc:	60fb      	str	r3, [r7, #12]
	while (*s1 && *s2){
     2ce:	e018      	b.n	302 <strcmp+0x42>
		if (*s1<*s2){
     2d0:	687b      	ldr	r3, [r7, #4]
     2d2:	781a      	ldrb	r2, [r3, #0]
     2d4:	683b      	ldr	r3, [r7, #0]
     2d6:	781b      	ldrb	r3, [r3, #0]
     2d8:	429a      	cmp	r2, r3
     2da:	d203      	bcs.n	2e4 <strcmp+0x24>
			result=-1;
     2dc:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     2e0:	60fb      	str	r3, [r7, #12]
			break;
     2e2:	e016      	b.n	312 <strcmp+0x52>
		}else if (*s1>*s2){
     2e4:	687b      	ldr	r3, [r7, #4]
     2e6:	781a      	ldrb	r2, [r3, #0]
     2e8:	683b      	ldr	r3, [r7, #0]
     2ea:	781b      	ldrb	r3, [r3, #0]
     2ec:	429a      	cmp	r2, r3
     2ee:	d902      	bls.n	2f6 <strcmp+0x36>
			result=1;
     2f0:	2301      	movs	r3, #1
     2f2:	60fb      	str	r3, [r7, #12]
			break;
     2f4:	e00d      	b.n	312 <strcmp+0x52>
		}
		s1++;
     2f6:	687b      	ldr	r3, [r7, #4]
     2f8:	3301      	adds	r3, #1
     2fa:	607b      	str	r3, [r7, #4]
		s2++;
     2fc:	683b      	ldr	r3, [r7, #0]
     2fe:	3301      	adds	r3, #1
     300:	603b      	str	r3, [r7, #0]

uint32_t proga;

int strcmp(const char *s1, const char *s2){
	int result=0;
	while (*s1 && *s2){
     302:	687b      	ldr	r3, [r7, #4]
     304:	781b      	ldrb	r3, [r3, #0]
     306:	2b00      	cmp	r3, #0
     308:	d003      	beq.n	312 <strcmp+0x52>
     30a:	683b      	ldr	r3, [r7, #0]
     30c:	781b      	ldrb	r3, [r3, #0]
     30e:	2b00      	cmp	r3, #0
     310:	d1de      	bne.n	2d0 <strcmp+0x10>
			break;
		}
		s1++;
		s2++;
	}
	if (!result){
     312:	68fb      	ldr	r3, [r7, #12]
     314:	2b00      	cmp	r3, #0
     316:	d115      	bne.n	344 <strcmp+0x84>
		if (!*s1 && *s2){
     318:	687b      	ldr	r3, [r7, #4]
     31a:	781b      	ldrb	r3, [r3, #0]
     31c:	2b00      	cmp	r3, #0
     31e:	d107      	bne.n	330 <strcmp+0x70>
     320:	683b      	ldr	r3, [r7, #0]
     322:	781b      	ldrb	r3, [r3, #0]
     324:	2b00      	cmp	r3, #0
     326:	d003      	beq.n	330 <strcmp+0x70>
			result=-1;
     328:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     32c:	60fb      	str	r3, [r7, #12]
     32e:	e009      	b.n	344 <strcmp+0x84>
		}else if (*s1 && !*s2) {
     330:	687b      	ldr	r3, [r7, #4]
     332:	781b      	ldrb	r3, [r3, #0]
     334:	2b00      	cmp	r3, #0
     336:	d005      	beq.n	344 <strcmp+0x84>
     338:	683b      	ldr	r3, [r7, #0]
     33a:	781b      	ldrb	r3, [r3, #0]
     33c:	2b00      	cmp	r3, #0
     33e:	d101      	bne.n	344 <strcmp+0x84>
			result=1;
     340:	2301      	movs	r3, #1
     342:	60fb      	str	r3, [r7, #12]
		}
	}
	return result;
     344:	68fb      	ldr	r3, [r7, #12]
}
     346:	4618      	mov	r0, r3
     348:	3714      	adds	r7, #20
     34a:	46bd      	mov	sp, r7
     34c:	f85d 7b04 	ldr.w	r7, [sp], #4
     350:	4770      	bx	lr
     352:	bf00      	nop

00000354 <digit>:

int digit(char c){
     354:	b480      	push	{r7}
     356:	b083      	sub	sp, #12
     358:	af00      	add	r7, sp, #0
     35a:	4603      	mov	r3, r0
     35c:	71fb      	strb	r3, [r7, #7]
   return ((c>='0') && (c<='9'));
     35e:	79fb      	ldrb	r3, [r7, #7]
     360:	2b2f      	cmp	r3, #47	; 0x2f
     362:	d904      	bls.n	36e <digit+0x1a>
     364:	79fb      	ldrb	r3, [r7, #7]
     366:	2b39      	cmp	r3, #57	; 0x39
     368:	d801      	bhi.n	36e <digit+0x1a>
     36a:	2301      	movs	r3, #1
     36c:	e000      	b.n	370 <digit+0x1c>
     36e:	2300      	movs	r3, #0
}
     370:	4618      	mov	r0, r3
     372:	370c      	adds	r7, #12
     374:	46bd      	mov	sp, r7
     376:	f85d 7b04 	ldr.w	r7, [sp], #4
     37a:	4770      	bx	lr

0000037c <hexdigit>:

int hexdigit(char c){
     37c:	b580      	push	{r7, lr}
     37e:	b082      	sub	sp, #8
     380:	af00      	add	r7, sp, #0
     382:	4603      	mov	r3, r0
     384:	71fb      	strb	r3, [r7, #7]
	if (c>='a') c-=32;
     386:	79fb      	ldrb	r3, [r7, #7]
     388:	2b60      	cmp	r3, #96	; 0x60
     38a:	d902      	bls.n	392 <hexdigit+0x16>
     38c:	79fb      	ldrb	r3, [r7, #7]
     38e:	3b20      	subs	r3, #32
     390:	71fb      	strb	r3, [r7, #7]
	return (digit(c) || (c>='A' && c<='F'));
     392:	79fb      	ldrb	r3, [r7, #7]
     394:	4618      	mov	r0, r3
     396:	f7ff ffdd 	bl	354 <digit>
     39a:	4603      	mov	r3, r0
     39c:	2b00      	cmp	r3, #0
     39e:	d105      	bne.n	3ac <hexdigit+0x30>
     3a0:	79fb      	ldrb	r3, [r7, #7]
     3a2:	2b40      	cmp	r3, #64	; 0x40
     3a4:	d904      	bls.n	3b0 <hexdigit+0x34>
     3a6:	79fb      	ldrb	r3, [r7, #7]
     3a8:	2b46      	cmp	r3, #70	; 0x46
     3aa:	d801      	bhi.n	3b0 <hexdigit+0x34>
     3ac:	2301      	movs	r3, #1
     3ae:	e000      	b.n	3b2 <hexdigit+0x36>
     3b0:	2300      	movs	r3, #0
}
     3b2:	4618      	mov	r0, r3
     3b4:	3708      	adds	r7, #8
     3b6:	46bd      	mov	sp, r7
     3b8:	bd80      	pop	{r7, pc}
     3ba:	bf00      	nop

000003bc <atoi>:

int atoi(const char *str){
     3bc:	b580      	push	{r7, lr}
     3be:	b086      	sub	sp, #24
     3c0:	af00      	add	r7, sp, #0
     3c2:	6078      	str	r0, [r7, #4]
	int n=0,sign=1,base=10;
     3c4:	2300      	movs	r3, #0
     3c6:	617b      	str	r3, [r7, #20]
     3c8:	2301      	movs	r3, #1
     3ca:	613b      	str	r3, [r7, #16]
     3cc:	230a      	movs	r3, #10
     3ce:	60fb      	str	r3, [r7, #12]
    char c;
    
	while (*str && (*str==SPACE)) str++;
     3d0:	e002      	b.n	3d8 <atoi+0x1c>
     3d2:	687b      	ldr	r3, [r7, #4]
     3d4:	3301      	adds	r3, #1
     3d6:	607b      	str	r3, [r7, #4]
     3d8:	687b      	ldr	r3, [r7, #4]
     3da:	781b      	ldrb	r3, [r3, #0]
     3dc:	2b00      	cmp	r3, #0
     3de:	d003      	beq.n	3e8 <atoi+0x2c>
     3e0:	687b      	ldr	r3, [r7, #4]
     3e2:	781b      	ldrb	r3, [r3, #0]
     3e4:	2b20      	cmp	r3, #32
     3e6:	d0f4      	beq.n	3d2 <atoi+0x16>
	if (*str=='-'){
     3e8:	687b      	ldr	r3, [r7, #4]
     3ea:	781b      	ldrb	r3, [r3, #0]
     3ec:	2b2d      	cmp	r3, #45	; 0x2d
     3ee:	d105      	bne.n	3fc <atoi+0x40>
		sign=-1;
     3f0:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     3f4:	613b      	str	r3, [r7, #16]
		str++;
     3f6:	687b      	ldr	r3, [r7, #4]
     3f8:	3301      	adds	r3, #1
     3fa:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
     3fc:	687b      	ldr	r3, [r7, #4]
     3fe:	781b      	ldrb	r3, [r3, #0]
     400:	2b30      	cmp	r3, #48	; 0x30
     402:	d10e      	bne.n	422 <atoi+0x66>
     404:	687b      	ldr	r3, [r7, #4]
     406:	3301      	adds	r3, #1
     408:	781b      	ldrb	r3, [r3, #0]
     40a:	2b78      	cmp	r3, #120	; 0x78
     40c:	d004      	beq.n	418 <atoi+0x5c>
     40e:	687b      	ldr	r3, [r7, #4]
     410:	3301      	adds	r3, #1
     412:	781b      	ldrb	r3, [r3, #0]
     414:	2b58      	cmp	r3, #88	; 0x58
     416:	d104      	bne.n	422 <atoi+0x66>
		base=16;
     418:	2310      	movs	r3, #16
     41a:	60fb      	str	r3, [r7, #12]
		str+=2;
     41c:	687b      	ldr	r3, [r7, #4]
     41e:	3302      	adds	r3, #2
     420:	607b      	str	r3, [r7, #4]
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     422:	e018      	b.n	456 <atoi+0x9a>
		if (c>='a'){c-=32;}
     424:	7afb      	ldrb	r3, [r7, #11]
     426:	2b60      	cmp	r3, #96	; 0x60
     428:	d902      	bls.n	430 <atoi+0x74>
     42a:	7afb      	ldrb	r3, [r7, #11]
     42c:	3b20      	subs	r3, #32
     42e:	72fb      	strb	r3, [r7, #11]
		c-='0';
     430:	7afb      	ldrb	r3, [r7, #11]
     432:	3b30      	subs	r3, #48	; 0x30
     434:	72fb      	strb	r3, [r7, #11]
		if (c>9){c-=7;}
     436:	7afb      	ldrb	r3, [r7, #11]
     438:	2b09      	cmp	r3, #9
     43a:	d902      	bls.n	442 <atoi+0x86>
     43c:	7afb      	ldrb	r3, [r7, #11]
     43e:	3b07      	subs	r3, #7
     440:	72fb      	strb	r3, [r7, #11]
		n=n*base+c;
     442:	697b      	ldr	r3, [r7, #20]
     444:	68fa      	ldr	r2, [r7, #12]
     446:	fb02 f203 	mul.w	r2, r2, r3
     44a:	7afb      	ldrb	r3, [r7, #11]
     44c:	4413      	add	r3, r2
     44e:	617b      	str	r3, [r7, #20]
		str++;
     450:	687b      	ldr	r3, [r7, #4]
     452:	3301      	adds	r3, #1
     454:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
		base=16;
		str+=2;
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     456:	687b      	ldr	r3, [r7, #4]
     458:	781b      	ldrb	r3, [r3, #0]
     45a:	72fb      	strb	r3, [r7, #11]
     45c:	7afb      	ldrb	r3, [r7, #11]
     45e:	2b00      	cmp	r3, #0
     460:	d00d      	beq.n	47e <atoi+0xc2>
     462:	68fb      	ldr	r3, [r7, #12]
     464:	2b0a      	cmp	r3, #10
     466:	d10a      	bne.n	47e <atoi+0xc2>
     468:	7afb      	ldrb	r3, [r7, #11]
     46a:	4618      	mov	r0, r3
     46c:	f7ff ff72 	bl	354 <digit>
     470:	4603      	mov	r3, r0
     472:	2b00      	cmp	r3, #0
     474:	bf14      	ite	ne
     476:	2301      	movne	r3, #1
     478:	2300      	moveq	r3, #0
     47a:	b2db      	uxtb	r3, r3
     47c:	e009      	b.n	492 <atoi+0xd6>
     47e:	7afb      	ldrb	r3, [r7, #11]
     480:	4618      	mov	r0, r3
     482:	f7ff ff7b 	bl	37c <hexdigit>
     486:	4603      	mov	r3, r0
     488:	2b00      	cmp	r3, #0
     48a:	bf14      	ite	ne
     48c:	2301      	movne	r3, #1
     48e:	2300      	moveq	r3, #0
     490:	b2db      	uxtb	r3, r3
     492:	2b00      	cmp	r3, #0
     494:	d1c6      	bne.n	424 <atoi+0x68>
		c-='0';
		if (c>9){c-=7;}
		n=n*base+c;
		str++;
	}
	return sign*n;
     496:	693b      	ldr	r3, [r7, #16]
     498:	697a      	ldr	r2, [r7, #20]
     49a:	fb02 f303 	mul.w	r3, r2, r3
}
     49e:	4618      	mov	r0, r3
     4a0:	3718      	adds	r7, #24
     4a2:	46bd      	mov	sp, r7
     4a4:	bd80      	pop	{r7, pc}
     4a6:	bf00      	nop

000004a8 <led_on>:
static void move(char *src , char *dest, int len);
static void word();

// routine de services

inline void led_on(){
     4a8:	b480      	push	{r7}
     4aa:	af00      	add	r7, sp, #0
	GPIOC_BRR->brr=GRN_LED;
     4ac:	4b03      	ldr	r3, [pc, #12]	; (4bc <led_on+0x14>)
     4ae:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4b2:	601a      	str	r2, [r3, #0]
}
     4b4:	46bd      	mov	sp, r7
     4b6:	f85d 7b04 	ldr.w	r7, [sp], #4
     4ba:	4770      	bx	lr
     4bc:	40011014 	.word	0x40011014

000004c0 <led_off>:

inline void led_off(){
     4c0:	b480      	push	{r7}
     4c2:	af00      	add	r7, sp, #0
	GPIOC_BSRR->bsrr=GRN_LED;
     4c4:	4b03      	ldr	r3, [pc, #12]	; (4d4 <led_off+0x14>)
     4c6:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4ca:	601a      	str	r2, [r3, #0]
}
     4cc:	46bd      	mov	sp, r7
     4ce:	f85d 7b04 	ldr.w	r7, [sp], #4
     4d2:	4770      	bx	lr
     4d4:	40011010 	.word	0x40011010

000004d8 <set_timer>:

inline void set_timer(unsigned time){
     4d8:	b480      	push	{r7}
     4da:	b083      	sub	sp, #12
     4dc:	af00      	add	r7, sp, #0
     4de:	6078      	str	r0, [r7, #4]
	timer=time;
     4e0:	4a03      	ldr	r2, [pc, #12]	; (4f0 <set_timer+0x18>)
     4e2:	687b      	ldr	r3, [r7, #4]
     4e4:	6013      	str	r3, [r2, #0]
}
     4e6:	370c      	adds	r7, #12
     4e8:	46bd      	mov	sp, r7
     4ea:	f85d 7b04 	ldr.w	r7, [sp], #4
     4ee:	4770      	bx	lr
     4f0:	20000008 	.word	0x20000008

000004f4 <get_timer>:


inline unsigned get_timer(){
     4f4:	b480      	push	{r7}
     4f6:	af00      	add	r7, sp, #0
	return timer;
     4f8:	4b03      	ldr	r3, [pc, #12]	; (508 <get_timer+0x14>)
     4fa:	681b      	ldr	r3, [r3, #0]
}
     4fc:	4618      	mov	r0, r3
     4fe:	46bd      	mov	sp, r7
     500:	f85d 7b04 	ldr.w	r7, [sp], #4
     504:	4770      	bx	lr
     506:	bf00      	nop
     508:	20000008 	.word	0x20000008

0000050c <peek8>:


inline uint8_t peek8(uint8_t *adr){
     50c:	b480      	push	{r7}
     50e:	b083      	sub	sp, #12
     510:	af00      	add	r7, sp, #0
     512:	6078      	str	r0, [r7, #4]
	return *adr;
     514:	687b      	ldr	r3, [r7, #4]
     516:	781b      	ldrb	r3, [r3, #0]
}
     518:	4618      	mov	r0, r3
     51a:	370c      	adds	r7, #12
     51c:	46bd      	mov	sp, r7
     51e:	f85d 7b04 	ldr.w	r7, [sp], #4
     522:	4770      	bx	lr

00000524 <peek16>:

inline uint16_t peek16(uint16_t *adr){
     524:	b480      	push	{r7}
     526:	b083      	sub	sp, #12
     528:	af00      	add	r7, sp, #0
     52a:	6078      	str	r0, [r7, #4]
	return *adr;
     52c:	687b      	ldr	r3, [r7, #4]
     52e:	881b      	ldrh	r3, [r3, #0]
}
     530:	4618      	mov	r0, r3
     532:	370c      	adds	r7, #12
     534:	46bd      	mov	sp, r7
     536:	f85d 7b04 	ldr.w	r7, [sp], #4
     53a:	4770      	bx	lr

0000053c <peek32>:

inline uint32_t peek32(uint32_t *adr){
     53c:	b480      	push	{r7}
     53e:	b083      	sub	sp, #12
     540:	af00      	add	r7, sp, #0
     542:	6078      	str	r0, [r7, #4]
	return *adr;
     544:	687b      	ldr	r3, [r7, #4]
     546:	681b      	ldr	r3, [r3, #0]
}
     548:	4618      	mov	r0, r3
     54a:	370c      	adds	r7, #12
     54c:	46bd      	mov	sp, r7
     54e:	f85d 7b04 	ldr.w	r7, [sp], #4
     552:	4770      	bx	lr

00000554 <poke8>:

inline void poke8(uint8_t *adr, uint8_t value){
     554:	b480      	push	{r7}
     556:	b083      	sub	sp, #12
     558:	af00      	add	r7, sp, #0
     55a:	6078      	str	r0, [r7, #4]
     55c:	460b      	mov	r3, r1
     55e:	70fb      	strb	r3, [r7, #3]
	*adr=value;
     560:	687b      	ldr	r3, [r7, #4]
     562:	78fa      	ldrb	r2, [r7, #3]
     564:	701a      	strb	r2, [r3, #0]
}
     566:	370c      	adds	r7, #12
     568:	46bd      	mov	sp, r7
     56a:	f85d 7b04 	ldr.w	r7, [sp], #4
     56e:	4770      	bx	lr

00000570 <poke16>:

inline void poke16(uint16_t *adr, uint16_t value){
     570:	b480      	push	{r7}
     572:	b083      	sub	sp, #12
     574:	af00      	add	r7, sp, #0
     576:	6078      	str	r0, [r7, #4]
     578:	460b      	mov	r3, r1
     57a:	807b      	strh	r3, [r7, #2]
	*adr=value;
     57c:	687b      	ldr	r3, [r7, #4]
     57e:	887a      	ldrh	r2, [r7, #2]
     580:	801a      	strh	r2, [r3, #0]
}
     582:	370c      	adds	r7, #12
     584:	46bd      	mov	sp, r7
     586:	f85d 7b04 	ldr.w	r7, [sp], #4
     58a:	4770      	bx	lr

0000058c <poke32>:

inline void poke32(uint32_t *adr, uint32_t value){
     58c:	b480      	push	{r7}
     58e:	b083      	sub	sp, #12
     590:	af00      	add	r7, sp, #0
     592:	6078      	str	r0, [r7, #4]
     594:	6039      	str	r1, [r7, #0]
	*adr=value;
     596:	687b      	ldr	r3, [r7, #4]
     598:	683a      	ldr	r2, [r7, #0]
     59a:	601a      	str	r2, [r3, #0]
}
     59c:	370c      	adds	r7, #12
     59e:	46bd      	mov	sp, r7
     5a0:	f85d 7b04 	ldr.w	r7, [sp], #4
     5a4:	4770      	bx	lr
     5a6:	bf00      	nop

000005a8 <SVC_handler>:

// interruption multiplexeur des appels de services
void __attribute__((__interrupt__)) SVC_handler(){
     5a8:	4668      	mov	r0, sp
     5aa:	f020 0107 	bic.w	r1, r0, #7
     5ae:	468d      	mov	sp, r1
     5b0:	b591      	push	{r0, r4, r7, lr}
     5b2:	b084      	sub	sp, #16
     5b4:	af00      	add	r7, sp, #0
	int svc_id;
	void *arg1, *arg2; 
	asm volatile (
     5b6:	f3ef 8009 	mrs	r0, PSP
     5ba:	6981      	ldr	r1, [r0, #24]
     5bc:	f811 4c02 	ldrb.w	r4, [r1, #-2]
     5c0:	6802      	ldr	r2, [r0, #0]
     5c2:	6843      	ldr	r3, [r0, #4]
     5c4:	60fc      	str	r4, [r7, #12]
     5c6:	60ba      	str	r2, [r7, #8]
     5c8:	607b      	str	r3, [r7, #4]
    "ldr %[arg1],[r0]\n\t"
    "ldr %[arg2],[r0,#4]\n\t"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [arg2] "=r" (arg2)
    :: "r0","r1" 
    );
	switch (svc_id){
     5ca:	68fb      	ldr	r3, [r7, #12]
     5cc:	2b10      	cmp	r3, #16
     5ce:	f200 809b 	bhi.w	708 <SVC_handler+0x160>
     5d2:	a201      	add	r2, pc, #4	; (adr r2, 5d8 <SVC_handler+0x30>)
     5d4:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     5d8:	00000703 	.word	0x00000703
     5dc:	0000061d 	.word	0x0000061d
     5e0:	00000623 	.word	0x00000623
     5e4:	00000629 	.word	0x00000629
     5e8:	00000635 	.word	0x00000635
     5ec:	00000641 	.word	0x00000641
     5f0:	0000064f 	.word	0x0000064f
     5f4:	0000065b 	.word	0x0000065b
     5f8:	0000066f 	.word	0x0000066f
     5fc:	00000677 	.word	0x00000677
     600:	00000683 	.word	0x00000683
     604:	0000068d 	.word	0x0000068d
     608:	000006a1 	.word	0x000006a1
     60c:	000006b5 	.word	0x000006b5
     610:	000006c7 	.word	0x000006c7
     614:	000006db 	.word	0x000006db
     618:	000006ef 	.word	0x000006ef
	case SVC_LED_ON: 
		led_on();
     61c:	f7ff ff44 	bl	4a8 <led_on>
		break;
     620:	e072      	b.n	708 <SVC_handler+0x160>
	case SVC_LED_OFF:
		led_off();
     622:	f7ff ff4d 	bl	4c0 <led_off>
		break;
     626:	e06f      	b.n	708 <SVC_handler+0x160>
	case SVC_TIMER:
		set_timer(*(unsigned*)arg1);
     628:	68bb      	ldr	r3, [r7, #8]
     62a:	681b      	ldr	r3, [r3, #0]
     62c:	4618      	mov	r0, r3
     62e:	f7ff ff53 	bl	4d8 <set_timer>
		break;
     632:	e069      	b.n	708 <SVC_handler+0x160>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=get_timer();
     634:	f7ff ff5e 	bl	4f4 <get_timer>
     638:	4602      	mov	r2, r0
     63a:	68bb      	ldr	r3, [r7, #8]
     63c:	601a      	str	r2, [r3, #0]
		break;
     63e:	e063      	b.n	708 <SVC_handler+0x160>
	case SVC_CONIN:
		*(char *)arg1=conin();
     640:	f000 fc76 	bl	f30 <conin>
     644:	4603      	mov	r3, r0
     646:	461a      	mov	r2, r3
     648:	68bb      	ldr	r3, [r7, #8]
     64a:	701a      	strb	r2, [r3, #0]
		break;
     64c:	e05c      	b.n	708 <SVC_handler+0x160>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     64e:	68bb      	ldr	r3, [r7, #8]
     650:	781b      	ldrb	r3, [r3, #0]
     652:	4618      	mov	r0, r3
     654:	f000 fc5c 	bl	f10 <conout>
		break;
     658:	e056      	b.n	708 <SVC_handler+0x160>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     65a:	68bb      	ldr	r3, [r7, #8]
     65c:	681b      	ldr	r3, [r3, #0]
     65e:	6878      	ldr	r0, [r7, #4]
     660:	4619      	mov	r1, r3
     662:	f000 fcdd 	bl	1020 <read_line>
     666:	4602      	mov	r2, r0
     668:	68bb      	ldr	r3, [r7, #8]
     66a:	601a      	str	r2, [r3, #0]
		break;
     66c:	e04c      	b.n	708 <SVC_handler+0x160>
	case SVC_PRINT:
		print((const char*)arg1);
     66e:	68b8      	ldr	r0, [r7, #8]
     670:	f000 fc80 	bl	f74 <print>
		break;
     674:	e048      	b.n	708 <SVC_handler+0x160>
	case SVC_PRINT_INT:
		print_int((int32_t)arg1,10);
     676:	68bb      	ldr	r3, [r7, #8]
     678:	4618      	mov	r0, r3
     67a:	210a      	movs	r1, #10
     67c:	f000 fd7a 	bl	1174 <print_int>
		break;
     680:	e042      	b.n	708 <SVC_handler+0x160>
	case SVC_PRINT_HEX:
		print_hex((uint32_t)arg1);
     682:	68bb      	ldr	r3, [r7, #8]
     684:	4618      	mov	r0, r3
     686:	f000 fde3 	bl	1250 <print_hex>
		break;
     68a:	e03d      	b.n	708 <SVC_handler+0x160>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     68c:	68bb      	ldr	r3, [r7, #8]
     68e:	681b      	ldr	r3, [r3, #0]
     690:	4618      	mov	r0, r3
     692:	f7ff ff3b 	bl	50c <peek8>
     696:	4603      	mov	r3, r0
     698:	461a      	mov	r2, r3
     69a:	68bb      	ldr	r3, [r7, #8]
     69c:	701a      	strb	r2, [r3, #0]
		break;
     69e:	e033      	b.n	708 <SVC_handler+0x160>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     6a0:	68bb      	ldr	r3, [r7, #8]
     6a2:	681b      	ldr	r3, [r3, #0]
     6a4:	4618      	mov	r0, r3
     6a6:	f7ff ff3d 	bl	524 <peek16>
     6aa:	4603      	mov	r3, r0
     6ac:	461a      	mov	r2, r3
     6ae:	68bb      	ldr	r3, [r7, #8]
     6b0:	801a      	strh	r2, [r3, #0]
		break;
     6b2:	e029      	b.n	708 <SVC_handler+0x160>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     6b4:	68bb      	ldr	r3, [r7, #8]
     6b6:	681b      	ldr	r3, [r3, #0]
     6b8:	4618      	mov	r0, r3
     6ba:	f7ff ff3f 	bl	53c <peek32>
     6be:	4602      	mov	r2, r0
     6c0:	68bb      	ldr	r3, [r7, #8]
     6c2:	601a      	str	r2, [r3, #0]
		break;
     6c4:	e020      	b.n	708 <SVC_handler+0x160>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
     6c6:	68bb      	ldr	r3, [r7, #8]
     6c8:	681b      	ldr	r3, [r3, #0]
     6ca:	461a      	mov	r2, r3
     6cc:	687b      	ldr	r3, [r7, #4]
     6ce:	781b      	ldrb	r3, [r3, #0]
     6d0:	4610      	mov	r0, r2
     6d2:	4619      	mov	r1, r3
     6d4:	f7ff ff3e 	bl	554 <poke8>
		break;
     6d8:	e016      	b.n	708 <SVC_handler+0x160>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
     6da:	68bb      	ldr	r3, [r7, #8]
     6dc:	681b      	ldr	r3, [r3, #0]
     6de:	461a      	mov	r2, r3
     6e0:	687b      	ldr	r3, [r7, #4]
     6e2:	881b      	ldrh	r3, [r3, #0]
     6e4:	4610      	mov	r0, r2
     6e6:	4619      	mov	r1, r3
     6e8:	f7ff ff42 	bl	570 <poke16>
		break;
     6ec:	e00c      	b.n	708 <SVC_handler+0x160>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
     6ee:	68bb      	ldr	r3, [r7, #8]
     6f0:	681b      	ldr	r3, [r3, #0]
     6f2:	461a      	mov	r2, r3
     6f4:	687b      	ldr	r3, [r7, #4]
     6f6:	681b      	ldr	r3, [r3, #0]
     6f8:	4610      	mov	r0, r2
     6fa:	4619      	mov	r1, r3
     6fc:	f7ff ff46 	bl	58c <poke32>
		break;
     700:	e002      	b.n	708 <SVC_handler+0x160>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     702:	f000 ff31 	bl	1568 <reset_mcu>
	    break;
     706:	bf00      	nop
	}	
}
     708:	3710      	adds	r7, #16
     70a:	46bd      	mov	sp, r7
     70c:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     710:	4685      	mov	sp, r0
     712:	4770      	bx	lr

00000714 <STK_handler>:

// interruption coretimer
void __attribute__((naked)) STK_handler(){
	ticks++;
     714:	4b06      	ldr	r3, [pc, #24]	; (730 <STK_handler+0x1c>)
     716:	681b      	ldr	r3, [r3, #0]
     718:	3301      	adds	r3, #1
     71a:	4a05      	ldr	r2, [pc, #20]	; (730 <STK_handler+0x1c>)
     71c:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
     71e:	4b05      	ldr	r3, [pc, #20]	; (734 <STK_handler+0x20>)
     720:	681b      	ldr	r3, [r3, #0]
     722:	2b00      	cmp	r3, #0
     724:	d004      	beq.n	730 <STK_handler+0x1c>
     726:	4b03      	ldr	r3, [pc, #12]	; (734 <STK_handler+0x20>)
     728:	681b      	ldr	r3, [r3, #0]
     72a:	3b01      	subs	r3, #1
     72c:	4a01      	ldr	r2, [pc, #4]	; (734 <STK_handler+0x20>)
     72e:	6013      	str	r3, [r2, #0]
     730:	20000004 	.word	0x20000004
     734:	20000008 	.word	0x20000008

00000738 <set_sysclock>:
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     738:	b480      	push	{r7}
     73a:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC_CR|=1<<RCC_CR_HSEON;
     73c:	4a1a      	ldr	r2, [pc, #104]	; (7a8 <set_sysclock+0x70>)
     73e:	4b1a      	ldr	r3, [pc, #104]	; (7a8 <set_sysclock+0x70>)
     740:	681b      	ldr	r3, [r3, #0]
     742:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     746:	6013      	str	r3, [r2, #0]
	 // attend que l'oscillateur soit prêt
   while (! (RCC_CR & (1<<RCC_CR_HSERDY)));
     748:	bf00      	nop
     74a:	4b17      	ldr	r3, [pc, #92]	; (7a8 <set_sysclock+0x70>)
     74c:	681b      	ldr	r3, [r3, #0]
     74e:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
     752:	2b00      	cmp	r3, #0
     754:	d0f9      	beq.n	74a <set_sysclock+0x12>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
     756:	4a15      	ldr	r2, [pc, #84]	; (7ac <set_sysclock+0x74>)
     758:	4b14      	ldr	r3, [pc, #80]	; (7ac <set_sysclock+0x74>)
     75a:	681b      	ldr	r3, [r3, #0]
     75c:	f443 13e8 	orr.w	r3, r3, #1900544	; 0x1d0000
     760:	6013      	str	r3, [r2, #0]
    // active le PLL
    RCC_CR|=1<<RCC_CR_PLLON;
     762:	4a11      	ldr	r2, [pc, #68]	; (7a8 <set_sysclock+0x70>)
     764:	4b10      	ldr	r3, [pc, #64]	; (7a8 <set_sysclock+0x70>)
     766:	681b      	ldr	r3, [r3, #0]
     768:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
     76c:	6013      	str	r3, [r2, #0]
    // Attend que le PLL soit prêt
    while (! (RCC_CR & (1<<RCC_CR_PLLRDY)));
     76e:	bf00      	nop
     770:	4b0d      	ldr	r3, [pc, #52]	; (7a8 <set_sysclock+0x70>)
     772:	681b      	ldr	r3, [r3, #0]
     774:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
     778:	2b00      	cmp	r3, #0
     77a:	d0f9      	beq.n	770 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR|=WAIT_2_CY;
     77c:	4a0c      	ldr	r2, [pc, #48]	; (7b0 <set_sysclock+0x78>)
     77e:	4b0c      	ldr	r3, [pc, #48]	; (7b0 <set_sysclock+0x78>)
     780:	681b      	ldr	r3, [r3, #0]
     782:	f043 0302 	orr.w	r3, r3, #2
     786:	6013      	str	r3, [r2, #0]
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR|=PLL_CLK<<RCC_CFGR_SW;
     788:	4a08      	ldr	r2, [pc, #32]	; (7ac <set_sysclock+0x74>)
     78a:	4b08      	ldr	r3, [pc, #32]	; (7ac <set_sysclock+0x74>)
     78c:	681b      	ldr	r3, [r3, #0]
     78e:	f043 0302 	orr.w	r3, r3, #2
     792:	6013      	str	r3, [r2, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR|=PPRECLK_DIV2<<RCC_CFGR_PPRE1;
     794:	4a05      	ldr	r2, [pc, #20]	; (7ac <set_sysclock+0x74>)
     796:	4b05      	ldr	r3, [pc, #20]	; (7ac <set_sysclock+0x74>)
     798:	681b      	ldr	r3, [r3, #0]
     79a:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     79e:	6013      	str	r3, [r2, #0]
}
     7a0:	46bd      	mov	sp, r7
     7a2:	f85d 7b04 	ldr.w	r7, [sp], #4
     7a6:	4770      	bx	lr
     7a8:	40021000 	.word	0x40021000
     7ac:	40021004 	.word	0x40021004
     7b0:	40022000 	.word	0x40022000

000007b4 <config_systicks>:

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
     7b4:	b480      	push	{r7}
     7b6:	af00      	add	r7, sp, #0
	STK_LOAD=MSEC_DLY-1;
     7b8:	4b05      	ldr	r3, [pc, #20]	; (7d0 <config_systicks+0x1c>)
     7ba:	f242 3227 	movw	r2, #8999	; 0x2327
     7be:	601a      	str	r2, [r3, #0]
	STK_CTRL=(1<<STK_TICKINT)|(1<<STK_ENABLE);
     7c0:	4b04      	ldr	r3, [pc, #16]	; (7d4 <config_systicks+0x20>)
     7c2:	2203      	movs	r2, #3
     7c4:	601a      	str	r2, [r3, #0]
}
     7c6:	46bd      	mov	sp, r7
     7c8:	f85d 7b04 	ldr.w	r7, [sp], #4
     7cc:	4770      	bx	lr
     7ce:	bf00      	nop
     7d0:	e000e014 	.word	0xe000e014
     7d4:	e000e010 	.word	0xe000e010

000007d8 <port_c_setup>:

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
     7d8:	b480      	push	{r7}
     7da:	af00      	add	r7, sp, #0
	RCC_APB2ENR|=1<<GPIOC_EN;
     7dc:	4a06      	ldr	r2, [pc, #24]	; (7f8 <port_c_setup+0x20>)
     7de:	4b06      	ldr	r3, [pc, #24]	; (7f8 <port_c_setup+0x20>)
     7e0:	681b      	ldr	r3, [r3, #0]
     7e2:	f043 0310 	orr.w	r3, r3, #16
     7e6:	6013      	str	r3, [r2, #0]
	GPIOC_CRH->cr=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
     7e8:	4b04      	ldr	r3, [pc, #16]	; (7fc <port_c_setup+0x24>)
     7ea:	4a05      	ldr	r2, [pc, #20]	; (800 <port_c_setup+0x28>)
     7ec:	601a      	str	r2, [r3, #0]
}
     7ee:	46bd      	mov	sp, r7
     7f0:	f85d 7b04 	ldr.w	r7, [sp], #4
     7f4:	4770      	bx	lr
     7f6:	bf00      	nop
     7f8:	40021018 	.word	0x40021018
     7fc:	40011004 	.word	0x40011004
     800:	44644444 	.word	0x44644444

00000804 <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     804:	b480      	push	{r7}
     806:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     808:	2300      	movs	r3, #0
     80a:	2200      	movs	r2, #0
     80c:	4618      	mov	r0, r3
     80e:	4611      	mov	r1, r2
     810:	df00      	svc	0
}
     812:	46bd      	mov	sp, r7
     814:	f85d 7b04 	ldr.w	r7, [sp], #4
     818:	4770      	bx	lr
     81a:	bf00      	nop

0000081c <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     81c:	b480      	push	{r7}
     81e:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     820:	2300      	movs	r3, #0
     822:	2200      	movs	r2, #0
     824:	4618      	mov	r0, r3
     826:	4611      	mov	r1, r2
     828:	df01      	svc	1
}
     82a:	46bd      	mov	sp, r7
     82c:	f85d 7b04 	ldr.w	r7, [sp], #4
     830:	4770      	bx	lr
     832:	bf00      	nop

00000834 <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     834:	b480      	push	{r7}
     836:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     838:	2300      	movs	r3, #0
     83a:	2200      	movs	r2, #0
     83c:	4618      	mov	r0, r3
     83e:	4611      	mov	r1, r2
     840:	df02      	svc	2
}
     842:	46bd      	mov	sp, r7
     844:	f85d 7b04 	ldr.w	r7, [sp], #4
     848:	4770      	bx	lr
     84a:	bf00      	nop

0000084c <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     84c:	b580      	push	{r7, lr}
     84e:	b082      	sub	sp, #8
     850:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     852:	f000 fa57 	bl	d04 <word>
	n=atoi((const char*)pad);
     856:	4806      	ldr	r0, [pc, #24]	; (870 <cmd_set_timer+0x24>)
     858:	f7ff fdb0 	bl	3bc <atoi>
     85c:	4603      	mov	r3, r0
     85e:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     860:	1d3b      	adds	r3, r7, #4
     862:	2200      	movs	r2, #0
     864:	4618      	mov	r0, r3
     866:	4611      	mov	r1, r2
     868:	df03      	svc	3
}
     86a:	3708      	adds	r7, #8
     86c:	46bd      	mov	sp, r7
     86e:	bd80      	pop	{r7, pc}
     870:	2000005c 	.word	0x2000005c

00000874 <cmd_get_timer>:

static void cmd_get_timer(){
     874:	b480      	push	{r7}
     876:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     878:	4b04      	ldr	r3, [pc, #16]	; (88c <cmd_get_timer+0x18>)
     87a:	2200      	movs	r2, #0
     87c:	4618      	mov	r0, r3
     87e:	4611      	mov	r1, r2
     880:	df04      	svc	4
}
     882:	46bd      	mov	sp, r7
     884:	f85d 7b04 	ldr.w	r7, [sp], #4
     888:	4770      	bx	lr
     88a:	bf00      	nop
     88c:	2000005c 	.word	0x2000005c

00000890 <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     890:	b480      	push	{r7}
     892:	b083      	sub	sp, #12
     894:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     896:	1d3b      	adds	r3, r7, #4
     898:	2200      	movs	r2, #0
     89a:	4618      	mov	r0, r3
     89c:	4611      	mov	r1, r2
     89e:	df04      	svc	4
     8a0:	687b      	ldr	r3, [r7, #4]
     8a2:	2b00      	cmp	r3, #0
     8a4:	d1f7      	bne.n	896 <cmd_pause+0x6>
}
     8a6:	370c      	adds	r7, #12
     8a8:	46bd      	mov	sp, r7
     8aa:	f85d 7b04 	ldr.w	r7, [sp], #4
     8ae:	4770      	bx	lr

000008b0 <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     8b0:	b480      	push	{r7}
     8b2:	b083      	sub	sp, #12
     8b4:	af00      	add	r7, sp, #0
	volatile char n=0;
     8b6:	2300      	movs	r3, #0
     8b8:	71fb      	strb	r3, [r7, #7]
	while (!n){
     8ba:	e004      	b.n	8c6 <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     8bc:	1dfb      	adds	r3, r7, #7
     8be:	2200      	movs	r2, #0
     8c0:	4618      	mov	r0, r3
     8c2:	4611      	mov	r1, r2
     8c4:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     8c6:	79fb      	ldrb	r3, [r7, #7]
     8c8:	b2db      	uxtb	r3, r3
     8ca:	2b00      	cmp	r3, #0
     8cc:	d0f6      	beq.n	8bc <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     8ce:	79fb      	ldrb	r3, [r7, #7]
     8d0:	b2da      	uxtb	r2, r3
     8d2:	4b05      	ldr	r3, [pc, #20]	; (8e8 <cmd_getc+0x38>)
     8d4:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     8d6:	4b04      	ldr	r3, [pc, #16]	; (8e8 <cmd_getc+0x38>)
     8d8:	2200      	movs	r2, #0
     8da:	705a      	strb	r2, [r3, #1]
}
     8dc:	370c      	adds	r7, #12
     8de:	46bd      	mov	sp, r7
     8e0:	f85d 7b04 	ldr.w	r7, [sp], #4
     8e4:	4770      	bx	lr
     8e6:	bf00      	nop
     8e8:	2000005c 	.word	0x2000005c

000008ec <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     8ec:	b580      	push	{r7, lr}
     8ee:	b082      	sub	sp, #8
     8f0:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     8f2:	f000 fa07 	bl	d04 <word>
	cmd_id=search_command((const char*)pad);
     8f6:	480a      	ldr	r0, [pc, #40]	; (920 <cmd_putc+0x34>)
     8f8:	f000 f8ee 	bl	ad8 <search_command>
     8fc:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     8fe:	687b      	ldr	r3, [r7, #4]
     900:	2b00      	cmp	r3, #0
     902:	db05      	blt.n	910 <cmd_putc+0x24>
     904:	4a07      	ldr	r2, [pc, #28]	; (924 <cmd_putc+0x38>)
     906:	687b      	ldr	r3, [r7, #4]
     908:	00db      	lsls	r3, r3, #3
     90a:	4413      	add	r3, r2
     90c:	685b      	ldr	r3, [r3, #4]
     90e:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     910:	4b03      	ldr	r3, [pc, #12]	; (920 <cmd_putc+0x34>)
     912:	2200      	movs	r2, #0
     914:	4618      	mov	r0, r3
     916:	4611      	mov	r1, r2
     918:	df06      	svc	6
}
     91a:	3708      	adds	r7, #8
     91c:	46bd      	mov	sp, r7
     91e:	bd80      	pop	{r7, pc}
     920:	2000005c 	.word	0x2000005c
     924:	000018d8 	.word	0x000018d8

00000928 <cmd_readln>:

static void cmd_readln(){
     928:	b580      	push	{r7, lr}
     92a:	b082      	sub	sp, #8
     92c:	af00      	add	r7, sp, #0
	unsigned llen=80;
     92e:	2350      	movs	r3, #80	; 0x50
     930:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     932:	1d3b      	adds	r3, r7, #4
     934:	4a04      	ldr	r2, [pc, #16]	; (948 <cmd_readln+0x20>)
     936:	4618      	mov	r0, r3
     938:	4611      	mov	r1, r2
     93a:	df07      	svc	7
	print((const char*)pad);
     93c:	4802      	ldr	r0, [pc, #8]	; (948 <cmd_readln+0x20>)
     93e:	f000 fb19 	bl	f74 <print>
}
     942:	3708      	adds	r7, #8
     944:	46bd      	mov	sp, r7
     946:	bd80      	pop	{r7, pc}
     948:	2000005c 	.word	0x2000005c

0000094c <cmd_print>:

static void cmd_print(){
     94c:	b580      	push	{r7, lr}
     94e:	af00      	add	r7, sp, #0
	word();
     950:	f000 f9d8 	bl	d04 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     954:	4b02      	ldr	r3, [pc, #8]	; (960 <cmd_print+0x14>)
     956:	2200      	movs	r2, #0
     958:	4618      	mov	r0, r3
     95a:	4611      	mov	r1, r2
     95c:	df08      	svc	8
}
     95e:	bd80      	pop	{r7, pc}
     960:	2000005c 	.word	0x2000005c

00000964 <cmd_run>:


static void cmd_run(){
     964:	b580      	push	{r7, lr}
     966:	af00      	add	r7, sp, #0
	((fn)proga)();
     968:	4b01      	ldr	r3, [pc, #4]	; (970 <cmd_run+0xc>)
     96a:	681b      	ldr	r3, [r3, #0]
     96c:	4798      	blx	r3
	
}
     96e:	bd80      	pop	{r7, pc}
     970:	200000d8 	.word	0x200000d8

00000974 <cmd_peek8>:

static void cmd_peek8(){
     974:	b580      	push	{r7, lr}
     976:	b082      	sub	sp, #8
     978:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     97a:	f000 f9c3 	bl	d04 <word>
	u=atoi((const char*)pad);
     97e:	4808      	ldr	r0, [pc, #32]	; (9a0 <cmd_peek8+0x2c>)
     980:	f7ff fd1c 	bl	3bc <atoi>
     984:	4603      	mov	r3, r0
     986:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     988:	1d3b      	adds	r3, r7, #4
     98a:	2200      	movs	r2, #0
     98c:	4618      	mov	r0, r3
     98e:	4611      	mov	r1, r2
     990:	df0b      	svc	11
	pad[0]=(unsigned char)u;
     992:	687b      	ldr	r3, [r7, #4]
     994:	b2da      	uxtb	r2, r3
     996:	4b02      	ldr	r3, [pc, #8]	; (9a0 <cmd_peek8+0x2c>)
     998:	701a      	strb	r2, [r3, #0]
}
     99a:	3708      	adds	r7, #8
     99c:	46bd      	mov	sp, r7
     99e:	bd80      	pop	{r7, pc}
     9a0:	2000005c 	.word	0x2000005c

000009a4 <cmd_peek16>:

static void cmd_peek16(){
     9a4:	b580      	push	{r7, lr}
     9a6:	b082      	sub	sp, #8
     9a8:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9aa:	f000 f9ab 	bl	d04 <word>
	u=atoi((const char*)pad);
     9ae:	480b      	ldr	r0, [pc, #44]	; (9dc <cmd_peek16+0x38>)
     9b0:	f7ff fd04 	bl	3bc <atoi>
     9b4:	4603      	mov	r3, r0
     9b6:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     9b8:	1d3b      	adds	r3, r7, #4
     9ba:	2200      	movs	r2, #0
     9bc:	4618      	mov	r0, r3
     9be:	4611      	mov	r1, r2
     9c0:	df0c      	svc	12
	pad[0]=(unsigned char)(u&0xff);
     9c2:	687b      	ldr	r3, [r7, #4]
     9c4:	b2da      	uxtb	r2, r3
     9c6:	4b05      	ldr	r3, [pc, #20]	; (9dc <cmd_peek16+0x38>)
     9c8:	701a      	strb	r2, [r3, #0]
	pad[1]=(unsigned char)((u>>8)&0xff);
     9ca:	687b      	ldr	r3, [r7, #4]
     9cc:	0a1b      	lsrs	r3, r3, #8
     9ce:	b2da      	uxtb	r2, r3
     9d0:	4b02      	ldr	r3, [pc, #8]	; (9dc <cmd_peek16+0x38>)
     9d2:	705a      	strb	r2, [r3, #1]
}
     9d4:	3708      	adds	r7, #8
     9d6:	46bd      	mov	sp, r7
     9d8:	bd80      	pop	{r7, pc}
     9da:	bf00      	nop
     9dc:	2000005c 	.word	0x2000005c

000009e0 <cmd_peek32>:

static void cmd_peek32(){
     9e0:	b580      	push	{r7, lr}
     9e2:	b082      	sub	sp, #8
     9e4:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     9e6:	f000 f98d 	bl	d04 <word>
	u=atoi((const char*)pad);
     9ea:	4810      	ldr	r0, [pc, #64]	; (a2c <cmd_peek32+0x4c>)
     9ec:	f7ff fce6 	bl	3bc <atoi>
     9f0:	4603      	mov	r3, r0
     9f2:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_PEEK32,&u,NUL);
     9f4:	463b      	mov	r3, r7
     9f6:	2200      	movs	r2, #0
     9f8:	4618      	mov	r0, r3
     9fa:	4611      	mov	r1, r2
     9fc:	df0d      	svc	13
	for (i=0;i<4;i++){
     9fe:	2300      	movs	r3, #0
     a00:	607b      	str	r3, [r7, #4]
     a02:	e00c      	b.n	a1e <cmd_peek32+0x3e>
		pad[i]=(unsigned char)(u&0xff);
     a04:	683b      	ldr	r3, [r7, #0]
     a06:	b2d9      	uxtb	r1, r3
     a08:	4a08      	ldr	r2, [pc, #32]	; (a2c <cmd_peek32+0x4c>)
     a0a:	687b      	ldr	r3, [r7, #4]
     a0c:	4413      	add	r3, r2
     a0e:	460a      	mov	r2, r1
     a10:	701a      	strb	r2, [r3, #0]
		u>>=8;
     a12:	683b      	ldr	r3, [r7, #0]
     a14:	0a1b      	lsrs	r3, r3, #8
     a16:	603b      	str	r3, [r7, #0]
	uint32_t u;
	int i;
	word();
	u=atoi((const char*)pad);
	_svc_call(SVC_PEEK32,&u,NUL);
	for (i=0;i<4;i++){
     a18:	687b      	ldr	r3, [r7, #4]
     a1a:	3301      	adds	r3, #1
     a1c:	607b      	str	r3, [r7, #4]
     a1e:	687b      	ldr	r3, [r7, #4]
     a20:	2b03      	cmp	r3, #3
     a22:	ddef      	ble.n	a04 <cmd_peek32+0x24>
		pad[i]=(unsigned char)(u&0xff);
		u>>=8;
	}
}
     a24:	3708      	adds	r7, #8
     a26:	46bd      	mov	sp, r7
     a28:	bd80      	pop	{r7, pc}
     a2a:	bf00      	nop
     a2c:	2000005c 	.word	0x2000005c

00000a30 <cmd_poke8>:

static void cmd_poke8(){
     a30:	b580      	push	{r7, lr}
     a32:	b082      	sub	sp, #8
     a34:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     a36:	f000 f965 	bl	d04 <word>
	adr=atoi((const char*)pad);
     a3a:	480a      	ldr	r0, [pc, #40]	; (a64 <cmd_poke8+0x34>)
     a3c:	f7ff fcbe 	bl	3bc <atoi>
     a40:	4603      	mov	r3, r0
     a42:	607b      	str	r3, [r7, #4]
	word();
     a44:	f000 f95e 	bl	d04 <word>
	u8=atoi((const char*)pad);
     a48:	4806      	ldr	r0, [pc, #24]	; (a64 <cmd_poke8+0x34>)
     a4a:	f7ff fcb7 	bl	3bc <atoi>
     a4e:	4603      	mov	r3, r0
     a50:	b2db      	uxtb	r3, r3
     a52:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     a54:	1d3b      	adds	r3, r7, #4
     a56:	1cfa      	adds	r2, r7, #3
     a58:	4618      	mov	r0, r3
     a5a:	4611      	mov	r1, r2
     a5c:	df0e      	svc	14
}
     a5e:	3708      	adds	r7, #8
     a60:	46bd      	mov	sp, r7
     a62:	bd80      	pop	{r7, pc}
     a64:	2000005c 	.word	0x2000005c

00000a68 <cmd_poke16>:

static void cmd_poke16(){
     a68:	b580      	push	{r7, lr}
     a6a:	b082      	sub	sp, #8
     a6c:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     a6e:	f000 f949 	bl	d04 <word>
	adr=atoi((const char*)pad);
     a72:	480a      	ldr	r0, [pc, #40]	; (a9c <cmd_poke16+0x34>)
     a74:	f7ff fca2 	bl	3bc <atoi>
     a78:	4603      	mov	r3, r0
     a7a:	607b      	str	r3, [r7, #4]
	word();
     a7c:	f000 f942 	bl	d04 <word>
	u16=atoi((const char*)pad);
     a80:	4806      	ldr	r0, [pc, #24]	; (a9c <cmd_poke16+0x34>)
     a82:	f7ff fc9b 	bl	3bc <atoi>
     a86:	4603      	mov	r3, r0
     a88:	b29b      	uxth	r3, r3
     a8a:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     a8c:	1d3b      	adds	r3, r7, #4
     a8e:	1cba      	adds	r2, r7, #2
     a90:	4618      	mov	r0, r3
     a92:	4611      	mov	r1, r2
     a94:	df0f      	svc	15
}
     a96:	3708      	adds	r7, #8
     a98:	46bd      	mov	sp, r7
     a9a:	bd80      	pop	{r7, pc}
     a9c:	2000005c 	.word	0x2000005c

00000aa0 <cmd_poke32>:

static void cmd_poke32(){
     aa0:	b580      	push	{r7, lr}
     aa2:	b082      	sub	sp, #8
     aa4:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     aa6:	f000 f92d 	bl	d04 <word>
	adr=atoi((const char*)pad);
     aaa:	480a      	ldr	r0, [pc, #40]	; (ad4 <cmd_poke32+0x34>)
     aac:	f7ff fc86 	bl	3bc <atoi>
     ab0:	4603      	mov	r3, r0
     ab2:	607b      	str	r3, [r7, #4]
	word();
     ab4:	f000 f926 	bl	d04 <word>
	u32=atoi((const char*)pad);
     ab8:	4806      	ldr	r0, [pc, #24]	; (ad4 <cmd_poke32+0x34>)
     aba:	f7ff fc7f 	bl	3bc <atoi>
     abe:	4603      	mov	r3, r0
     ac0:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     ac2:	1d3b      	adds	r3, r7, #4
     ac4:	463a      	mov	r2, r7
     ac6:	4618      	mov	r0, r3
     ac8:	4611      	mov	r1, r2
     aca:	df10      	svc	16
}
     acc:	3708      	adds	r7, #8
     ace:	46bd      	mov	sp, r7
     ad0:	bd80      	pop	{r7, pc}
     ad2:	bf00      	nop
     ad4:	2000005c 	.word	0x2000005c

00000ad8 <search_command>:
	{"poke32",cmd_poke32}, 
	{NUL,NUL}
};


int search_command(const char * name){
     ad8:	b580      	push	{r7, lr}
     ada:	b084      	sub	sp, #16
     adc:	af00      	add	r7, sp, #0
     ade:	6078      	str	r0, [r7, #4]
	int i=0;
     ae0:	2300      	movs	r3, #0
     ae2:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     ae4:	e00e      	b.n	b04 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     ae6:	4a12      	ldr	r2, [pc, #72]	; (b30 <search_command+0x58>)
     ae8:	68fb      	ldr	r3, [r7, #12]
     aea:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     aee:	4618      	mov	r0, r3
     af0:	6879      	ldr	r1, [r7, #4]
     af2:	f7ff fbe5 	bl	2c0 <strcmp>
     af6:	4603      	mov	r3, r0
     af8:	2b00      	cmp	r3, #0
     afa:	d100      	bne.n	afe <search_command+0x26>
			break;
     afc:	e009      	b.n	b12 <search_command+0x3a>
		}
		i++;
     afe:	68fb      	ldr	r3, [r7, #12]
     b00:	3301      	adds	r3, #1
     b02:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     b04:	4a0a      	ldr	r2, [pc, #40]	; (b30 <search_command+0x58>)
     b06:	68fb      	ldr	r3, [r7, #12]
     b08:	00db      	lsls	r3, r3, #3
     b0a:	4413      	add	r3, r2
     b0c:	685b      	ldr	r3, [r3, #4]
     b0e:	2b00      	cmp	r3, #0
     b10:	d1e9      	bne.n	ae6 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     b12:	4a07      	ldr	r2, [pc, #28]	; (b30 <search_command+0x58>)
     b14:	68fb      	ldr	r3, [r7, #12]
     b16:	00db      	lsls	r3, r3, #3
     b18:	4413      	add	r3, r2
     b1a:	685b      	ldr	r3, [r3, #4]
     b1c:	2b00      	cmp	r3, #0
     b1e:	d102      	bne.n	b26 <search_command+0x4e>
     b20:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     b24:	60fb      	str	r3, [r7, #12]
	return i;
     b26:	68fb      	ldr	r3, [r7, #12]
}
     b28:	4618      	mov	r0, r3
     b2a:	3710      	adds	r7, #16
     b2c:	46bd      	mov	sp, r7
     b2e:	bd80      	pop	{r7, pc}
     b30:	000018d8 	.word	0x000018d8

00000b34 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     b34:	b480      	push	{r7}
     b36:	b085      	sub	sp, #20
     b38:	af00      	add	r7, sp, #0
     b3a:	60f8      	str	r0, [r7, #12]
     b3c:	60b9      	str	r1, [r7, #8]
     b3e:	4613      	mov	r3, r2
     b40:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     b42:	e002      	b.n	b4a <skip+0x16>
     b44:	68bb      	ldr	r3, [r7, #8]
     b46:	3301      	adds	r3, #1
     b48:	60bb      	str	r3, [r7, #8]
     b4a:	68bb      	ldr	r3, [r7, #8]
     b4c:	68fa      	ldr	r2, [r7, #12]
     b4e:	4413      	add	r3, r2
     b50:	781b      	ldrb	r3, [r3, #0]
     b52:	2b00      	cmp	r3, #0
     b54:	d006      	beq.n	b64 <skip+0x30>
     b56:	68bb      	ldr	r3, [r7, #8]
     b58:	68fa      	ldr	r2, [r7, #12]
     b5a:	4413      	add	r3, r2
     b5c:	781b      	ldrb	r3, [r3, #0]
     b5e:	79fa      	ldrb	r2, [r7, #7]
     b60:	429a      	cmp	r2, r3
     b62:	d0ef      	beq.n	b44 <skip+0x10>
	return start;
     b64:	68bb      	ldr	r3, [r7, #8]
}
     b66:	4618      	mov	r0, r3
     b68:	3714      	adds	r7, #20
     b6a:	46bd      	mov	sp, r7
     b6c:	f85d 7b04 	ldr.w	r7, [sp], #4
     b70:	4770      	bx	lr
     b72:	bf00      	nop

00000b74 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     b74:	b480      	push	{r7}
     b76:	b085      	sub	sp, #20
     b78:	af00      	add	r7, sp, #0
     b7a:	60f8      	str	r0, [r7, #12]
     b7c:	60b9      	str	r1, [r7, #8]
     b7e:	4613      	mov	r3, r2
     b80:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     b82:	e002      	b.n	b8a <scan+0x16>
     b84:	68bb      	ldr	r3, [r7, #8]
     b86:	3301      	adds	r3, #1
     b88:	60bb      	str	r3, [r7, #8]
     b8a:	68bb      	ldr	r3, [r7, #8]
     b8c:	68fa      	ldr	r2, [r7, #12]
     b8e:	4413      	add	r3, r2
     b90:	781b      	ldrb	r3, [r3, #0]
     b92:	2b00      	cmp	r3, #0
     b94:	d006      	beq.n	ba4 <scan+0x30>
     b96:	68bb      	ldr	r3, [r7, #8]
     b98:	68fa      	ldr	r2, [r7, #12]
     b9a:	4413      	add	r3, r2
     b9c:	781b      	ldrb	r3, [r3, #0]
     b9e:	79fa      	ldrb	r2, [r7, #7]
     ba0:	429a      	cmp	r2, r3
     ba2:	d1ef      	bne.n	b84 <scan+0x10>
	return start;
     ba4:	68bb      	ldr	r3, [r7, #8]
}
     ba6:	4618      	mov	r0, r3
     ba8:	3714      	adds	r7, #20
     baa:	46bd      	mov	sp, r7
     bac:	f85d 7b04 	ldr.w	r7, [sp], #4
     bb0:	4770      	bx	lr
     bb2:	bf00      	nop

00000bb4 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     bb4:	b480      	push	{r7}
     bb6:	b087      	sub	sp, #28
     bb8:	af00      	add	r7, sp, #0
     bba:	6078      	str	r0, [r7, #4]
     bbc:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     bbe:	2300      	movs	r3, #0
     bc0:	617b      	str	r3, [r7, #20]
     bc2:	683b      	ldr	r3, [r7, #0]
     bc4:	613b      	str	r3, [r7, #16]
     bc6:	2300      	movs	r3, #0
     bc8:	60fb      	str	r3, [r7, #12]
     bca:	2301      	movs	r3, #1
     bcc:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     bce:	e040      	b.n	c52 <quote+0x9e>
		switch (buffer[end]){
     bd0:	693b      	ldr	r3, [r7, #16]
     bd2:	687a      	ldr	r2, [r7, #4]
     bd4:	4413      	add	r3, r2
     bd6:	781b      	ldrb	r3, [r3, #0]
     bd8:	2b5c      	cmp	r3, #92	; 0x5c
     bda:	d012      	beq.n	c02 <quote+0x4e>
     bdc:	2b6e      	cmp	r3, #110	; 0x6e
     bde:	d022      	beq.n	c26 <quote+0x72>
     be0:	2b22      	cmp	r3, #34	; 0x22
     be2:	d128      	bne.n	c36 <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     be4:	697b      	ldr	r3, [r7, #20]
     be6:	2b00      	cmp	r3, #0
     be8:	d102      	bne.n	bf0 <quote+0x3c>
     bea:	2300      	movs	r3, #0
     bec:	60bb      	str	r3, [r7, #8]
			break;
     bee:	e02d      	b.n	c4c <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     bf0:	68fb      	ldr	r3, [r7, #12]
     bf2:	1c5a      	adds	r2, r3, #1
     bf4:	60fa      	str	r2, [r7, #12]
     bf6:	4a21      	ldr	r2, [pc, #132]	; (c7c <quote+0xc8>)
     bf8:	2122      	movs	r1, #34	; 0x22
     bfa:	54d1      	strb	r1, [r2, r3]
     bfc:	2300      	movs	r3, #0
     bfe:	617b      	str	r3, [r7, #20]
			break;
     c00:	e024      	b.n	c4c <quote+0x98>
		case '\\':
			if (!escaped){
     c02:	697b      	ldr	r3, [r7, #20]
     c04:	2b00      	cmp	r3, #0
     c06:	d102      	bne.n	c0e <quote+0x5a>
				escaped=1;
     c08:	2301      	movs	r3, #1
     c0a:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     c0c:	e01e      	b.n	c4c <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     c0e:	2300      	movs	r3, #0
     c10:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     c12:	68fb      	ldr	r3, [r7, #12]
     c14:	1c5a      	adds	r2, r3, #1
     c16:	60fa      	str	r2, [r7, #12]
     c18:	693a      	ldr	r2, [r7, #16]
     c1a:	6879      	ldr	r1, [r7, #4]
     c1c:	440a      	add	r2, r1
     c1e:	7811      	ldrb	r1, [r2, #0]
     c20:	4a16      	ldr	r2, [pc, #88]	; (c7c <quote+0xc8>)
     c22:	54d1      	strb	r1, [r2, r3]
			}
			break;
     c24:	e012      	b.n	c4c <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     c26:	697b      	ldr	r3, [r7, #20]
     c28:	2b00      	cmp	r3, #0
     c2a:	d004      	beq.n	c36 <quote+0x82>
     c2c:	693b      	ldr	r3, [r7, #16]
     c2e:	687a      	ldr	r2, [r7, #4]
     c30:	4413      	add	r3, r2
     c32:	220d      	movs	r2, #13
     c34:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     c36:	2300      	movs	r3, #0
     c38:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     c3a:	68fb      	ldr	r3, [r7, #12]
     c3c:	1c5a      	adds	r2, r3, #1
     c3e:	60fa      	str	r2, [r7, #12]
     c40:	693a      	ldr	r2, [r7, #16]
     c42:	6879      	ldr	r1, [r7, #4]
     c44:	440a      	add	r2, r1
     c46:	7811      	ldrb	r1, [r2, #0]
     c48:	4a0c      	ldr	r2, [pc, #48]	; (c7c <quote+0xc8>)
     c4a:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     c4c:	693b      	ldr	r3, [r7, #16]
     c4e:	3301      	adds	r3, #1
     c50:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     c52:	693b      	ldr	r3, [r7, #16]
     c54:	687a      	ldr	r2, [r7, #4]
     c56:	4413      	add	r3, r2
     c58:	781b      	ldrb	r3, [r3, #0]
     c5a:	2b00      	cmp	r3, #0
     c5c:	d002      	beq.n	c64 <quote+0xb0>
     c5e:	68bb      	ldr	r3, [r7, #8]
     c60:	2b00      	cmp	r3, #0
     c62:	d1b5      	bne.n	bd0 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     c64:	4a05      	ldr	r2, [pc, #20]	; (c7c <quote+0xc8>)
     c66:	68fb      	ldr	r3, [r7, #12]
     c68:	4413      	add	r3, r2
     c6a:	2200      	movs	r2, #0
     c6c:	701a      	strb	r2, [r3, #0]
	return end;
     c6e:	693b      	ldr	r3, [r7, #16]
}
     c70:	4618      	mov	r0, r3
     c72:	371c      	adds	r7, #28
     c74:	46bd      	mov	sp, r7
     c76:	f85d 7b04 	ldr.w	r7, [sp], #4
     c7a:	4770      	bx	lr
     c7c:	2000005c 	.word	0x2000005c

00000c80 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     c80:	b480      	push	{r7}
     c82:	b087      	sub	sp, #28
     c84:	af00      	add	r7, sp, #0
     c86:	60f8      	str	r0, [r7, #12]
     c88:	60b9      	str	r1, [r7, #8]
     c8a:	4613      	mov	r3, r2
     c8c:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     c8e:	68bb      	ldr	r3, [r7, #8]
     c90:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     c92:	e002      	b.n	c9a <next+0x1a>
     c94:	697b      	ldr	r3, [r7, #20]
     c96:	3301      	adds	r3, #1
     c98:	617b      	str	r3, [r7, #20]
     c9a:	697b      	ldr	r3, [r7, #20]
     c9c:	68fa      	ldr	r2, [r7, #12]
     c9e:	4413      	add	r3, r2
     ca0:	781b      	ldrb	r3, [r3, #0]
     ca2:	2b00      	cmp	r3, #0
     ca4:	d006      	beq.n	cb4 <next+0x34>
     ca6:	697b      	ldr	r3, [r7, #20]
     ca8:	68fa      	ldr	r2, [r7, #12]
     caa:	4413      	add	r3, r2
     cac:	781b      	ldrb	r3, [r3, #0]
     cae:	79fa      	ldrb	r2, [r7, #7]
     cb0:	429a      	cmp	r2, r3
     cb2:	d1ef      	bne.n	c94 <next+0x14>
	return end-start;
     cb4:	697a      	ldr	r2, [r7, #20]
     cb6:	68bb      	ldr	r3, [r7, #8]
     cb8:	1ad3      	subs	r3, r2, r3
}
     cba:	4618      	mov	r0, r3
     cbc:	371c      	adds	r7, #28
     cbe:	46bd      	mov	sp, r7
     cc0:	f85d 7b04 	ldr.w	r7, [sp], #4
     cc4:	4770      	bx	lr
     cc6:	bf00      	nop

00000cc8 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     cc8:	b480      	push	{r7}
     cca:	b085      	sub	sp, #20
     ccc:	af00      	add	r7, sp, #0
     cce:	60f8      	str	r0, [r7, #12]
     cd0:	60b9      	str	r1, [r7, #8]
     cd2:	607a      	str	r2, [r7, #4]
	while (len){
     cd4:	e00a      	b.n	cec <move+0x24>
		*dest++=*src++;
     cd6:	68bb      	ldr	r3, [r7, #8]
     cd8:	1c5a      	adds	r2, r3, #1
     cda:	60ba      	str	r2, [r7, #8]
     cdc:	68fa      	ldr	r2, [r7, #12]
     cde:	1c51      	adds	r1, r2, #1
     ce0:	60f9      	str	r1, [r7, #12]
     ce2:	7812      	ldrb	r2, [r2, #0]
     ce4:	701a      	strb	r2, [r3, #0]
		len--;
     ce6:	687b      	ldr	r3, [r7, #4]
     ce8:	3b01      	subs	r3, #1
     cea:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     cec:	687b      	ldr	r3, [r7, #4]
     cee:	2b00      	cmp	r3, #0
     cf0:	d1f1      	bne.n	cd6 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     cf2:	68bb      	ldr	r3, [r7, #8]
     cf4:	2200      	movs	r2, #0
     cf6:	701a      	strb	r2, [r3, #0]
}
     cf8:	3714      	adds	r7, #20
     cfa:	46bd      	mov	sp, r7
     cfc:	f85d 7b04 	ldr.w	r7, [sp], #4
     d00:	4770      	bx	lr
     d02:	bf00      	nop

00000d04 <word>:

// extrait le prochain mot du tib
static void word(){
     d04:	b580      	push	{r7, lr}
     d06:	b082      	sub	sp, #8
     d08:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     d0a:	4b1d      	ldr	r3, [pc, #116]	; (d80 <word+0x7c>)
     d0c:	681b      	ldr	r3, [r3, #0]
     d0e:	481d      	ldr	r0, [pc, #116]	; (d84 <word+0x80>)
     d10:	4619      	mov	r1, r3
     d12:	2220      	movs	r2, #32
     d14:	f7ff ff0e 	bl	b34 <skip>
     d18:	4603      	mov	r3, r0
     d1a:	461a      	mov	r2, r3
     d1c:	4b18      	ldr	r3, [pc, #96]	; (d80 <word+0x7c>)
     d1e:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     d20:	4b17      	ldr	r3, [pc, #92]	; (d80 <word+0x7c>)
     d22:	681b      	ldr	r3, [r3, #0]
     d24:	4a17      	ldr	r2, [pc, #92]	; (d84 <word+0x80>)
     d26:	5cd3      	ldrb	r3, [r2, r3]
     d28:	2b22      	cmp	r3, #34	; 0x22
     d2a:	d10f      	bne.n	d4c <word+0x48>
			in++;
     d2c:	4b14      	ldr	r3, [pc, #80]	; (d80 <word+0x7c>)
     d2e:	681b      	ldr	r3, [r3, #0]
     d30:	3301      	adds	r3, #1
     d32:	4a13      	ldr	r2, [pc, #76]	; (d80 <word+0x7c>)
     d34:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     d36:	4b12      	ldr	r3, [pc, #72]	; (d80 <word+0x7c>)
     d38:	681b      	ldr	r3, [r3, #0]
     d3a:	4812      	ldr	r0, [pc, #72]	; (d84 <word+0x80>)
     d3c:	4619      	mov	r1, r3
     d3e:	f7ff ff39 	bl	bb4 <quote>
     d42:	4603      	mov	r3, r0
     d44:	461a      	mov	r2, r3
     d46:	4b0e      	ldr	r3, [pc, #56]	; (d80 <word+0x7c>)
     d48:	601a      	str	r2, [r3, #0]
     d4a:	e016      	b.n	d7a <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     d4c:	4b0c      	ldr	r3, [pc, #48]	; (d80 <word+0x7c>)
     d4e:	681b      	ldr	r3, [r3, #0]
     d50:	480c      	ldr	r0, [pc, #48]	; (d84 <word+0x80>)
     d52:	4619      	mov	r1, r3
     d54:	2220      	movs	r2, #32
     d56:	f7ff ff93 	bl	c80 <next>
     d5a:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     d5c:	4b08      	ldr	r3, [pc, #32]	; (d80 <word+0x7c>)
     d5e:	681b      	ldr	r3, [r3, #0]
     d60:	4a08      	ldr	r2, [pc, #32]	; (d84 <word+0x80>)
     d62:	4413      	add	r3, r2
     d64:	4618      	mov	r0, r3
     d66:	4908      	ldr	r1, [pc, #32]	; (d88 <word+0x84>)
     d68:	687a      	ldr	r2, [r7, #4]
     d6a:	f7ff ffad 	bl	cc8 <move>
			in+=len;
     d6e:	4b04      	ldr	r3, [pc, #16]	; (d80 <word+0x7c>)
     d70:	681a      	ldr	r2, [r3, #0]
     d72:	687b      	ldr	r3, [r7, #4]
     d74:	4413      	add	r3, r2
     d76:	4a02      	ldr	r2, [pc, #8]	; (d80 <word+0x7c>)
     d78:	6013      	str	r3, [r2, #0]
		}
}
     d7a:	3708      	adds	r7, #8
     d7c:	46bd      	mov	sp, r7
     d7e:	bd80      	pop	{r7, pc}
     d80:	200000ac 	.word	0x200000ac
     d84:	2000000c 	.word	0x2000000c
     d88:	2000005c 	.word	0x2000005c

00000d8c <parse_line>:

static void parse_line(unsigned llen){
     d8c:	b580      	push	{r7, lr}
     d8e:	b084      	sub	sp, #16
     d90:	af00      	add	r7, sp, #0
     d92:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     d94:	4b12      	ldr	r3, [pc, #72]	; (de0 <parse_line+0x54>)
     d96:	2200      	movs	r2, #0
     d98:	601a      	str	r2, [r3, #0]
	while (in<llen){
     d9a:	e016      	b.n	dca <parse_line+0x3e>
		word();
     d9c:	f7ff ffb2 	bl	d04 <word>
		cmd_id=search_command((const char*) pad);
     da0:	4810      	ldr	r0, [pc, #64]	; (de4 <parse_line+0x58>)
     da2:	f7ff fe99 	bl	ad8 <search_command>
     da6:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     da8:	68fb      	ldr	r3, [r7, #12]
     daa:	2b00      	cmp	r3, #0
     dac:	db06      	blt.n	dbc <parse_line+0x30>
			commands[cmd_id].fn();
     dae:	4a0e      	ldr	r2, [pc, #56]	; (de8 <parse_line+0x5c>)
     db0:	68fb      	ldr	r3, [r7, #12]
     db2:	00db      	lsls	r3, r3, #3
     db4:	4413      	add	r3, r2
     db6:	685b      	ldr	r3, [r3, #4]
     db8:	4798      	blx	r3
     dba:	e006      	b.n	dca <parse_line+0x3e>
		}else{
			print((const char*)pad); conout('?');
     dbc:	4809      	ldr	r0, [pc, #36]	; (de4 <parse_line+0x58>)
     dbe:	f000 f8d9 	bl	f74 <print>
     dc2:	203f      	movs	r0, #63	; 0x3f
     dc4:	f000 f8a4 	bl	f10 <conout>
			break;
     dc8:	e004      	b.n	dd4 <parse_line+0x48>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     dca:	4b05      	ldr	r3, [pc, #20]	; (de0 <parse_line+0x54>)
     dcc:	681a      	ldr	r2, [r3, #0]
     dce:	687b      	ldr	r3, [r7, #4]
     dd0:	429a      	cmp	r2, r3
     dd2:	d3e3      	bcc.n	d9c <parse_line+0x10>
		}else{
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     dd4:	200d      	movs	r0, #13
     dd6:	f000 f89b 	bl	f10 <conout>
}
     dda:	3710      	adds	r7, #16
     ddc:	46bd      	mov	sp, r7
     dde:	bd80      	pop	{r7, pc}
     de0:	200000ac 	.word	0x200000ac
     de4:	2000005c 	.word	0x2000005c
     de8:	000018d8 	.word	0x000018d8

00000dec <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     dec:	b480      	push	{r7}
     dee:	b085      	sub	sp, #20
     df0:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     df2:	4b0c      	ldr	r3, [pc, #48]	; (e24 <copy_blink_in_ram+0x38>)
     df4:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     df6:	4b0c      	ldr	r3, [pc, #48]	; (e28 <copy_blink_in_ram+0x3c>)
     df8:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     dfa:	4b0c      	ldr	r3, [pc, #48]	; (e2c <copy_blink_in_ram+0x40>)
     dfc:	60bb      	str	r3, [r7, #8]
	while (start<end){
     dfe:	e007      	b.n	e10 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     e00:	68bb      	ldr	r3, [r7, #8]
     e02:	1d1a      	adds	r2, r3, #4
     e04:	60ba      	str	r2, [r7, #8]
     e06:	68fa      	ldr	r2, [r7, #12]
     e08:	1d11      	adds	r1, r2, #4
     e0a:	60f9      	str	r1, [r7, #12]
     e0c:	6812      	ldr	r2, [r2, #0]
     e0e:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     e10:	68fa      	ldr	r2, [r7, #12]
     e12:	687b      	ldr	r3, [r7, #4]
     e14:	429a      	cmp	r2, r3
     e16:	d3f3      	bcc.n	e00 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     e18:	3714      	adds	r7, #20
     e1a:	46bd      	mov	sp, r7
     e1c:	f85d 7b04 	ldr.w	r7, [sp], #4
     e20:	4770      	bx	lr
     e22:	bf00      	nop
     e24:	00001a00 	.word	0x00001a00
     e28:	00001a80 	.word	0x00001a80
     e2c:	200000e0 	.word	0x200000e0

00000e30 <main>:

extern void print_fault(const char *msg, sfrp_t adr);

void main(void){
     e30:	b580      	push	{r7, lr}
     e32:	b082      	sub	sp, #8
     e34:	af00      	add	r7, sp, #0
	set_sysclock();
     e36:	f7ff fc7f 	bl	738 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     e3a:	f06f 000a 	mvn.w	r0, #10
     e3e:	210f      	movs	r1, #15
     e40:	f000 fb62 	bl	1508 <set_int_priority>
	config_systicks();
     e44:	f7ff fcb6 	bl	7b4 <config_systicks>
	port_c_setup();
     e48:	f7ff fcc6 	bl	7d8 <port_c_setup>
	uart_open_channel(CON,115200,FLOW_HARD);
     e4c:	4816      	ldr	r0, [pc, #88]	; (ea8 <main+0x78>)
     e4e:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     e52:	2201      	movs	r2, #1
     e54:	f000 fc18 	bl	1688 <uart_open_channel>
	cls();
     e58:	f000 f8bc 	bl	fd4 <cls>
	print(VERSION); 
     e5c:	4b13      	ldr	r3, [pc, #76]	; (eac <main+0x7c>)
     e5e:	681b      	ldr	r3, [r3, #0]
     e60:	4618      	mov	r0, r3
     e62:	f000 f887 	bl	f74 <print>
	copy_blink_in_ram();
     e66:	f7ff ffc1 	bl	dec <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,proga&0xfffffffe,NUL); conout(CR);
     e6a:	4811      	ldr	r0, [pc, #68]	; (eb0 <main+0x80>)
     e6c:	f000 f882 	bl	f74 <print>
     e70:	4b10      	ldr	r3, [pc, #64]	; (eb4 <main+0x84>)
     e72:	681b      	ldr	r3, [r3, #0]
     e74:	f023 0301 	bic.w	r3, r3, #1
     e78:	2200      	movs	r2, #0
     e7a:	4618      	mov	r0, r3
     e7c:	4611      	mov	r1, r2
     e7e:	df0a      	svc	10
     e80:	200d      	movs	r0, #13
     e82:	f000 f845 	bl	f10 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     e86:	2300      	movs	r3, #0
     e88:	2200      	movs	r2, #0
     e8a:	4618      	mov	r0, r3
     e8c:	4611      	mov	r1, r2
     e8e:	df01      	svc	1
	flush_rx_queue();
     e90:	f000 fa40 	bl	1314 <flush_rx_queue>
	unsigned llen;// char c;
	while (1){ // if ((c=conin())) conout(c);
		llen=read_line(tib,CMD_MAX_LEN);
     e94:	4808      	ldr	r0, [pc, #32]	; (eb8 <main+0x88>)
     e96:	2150      	movs	r1, #80	; 0x50
     e98:	f000 f8c2 	bl	1020 <read_line>
     e9c:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     e9e:	6878      	ldr	r0, [r7, #4]
     ea0:	f7ff ff74 	bl	d8c <parse_line>
	}
     ea4:	e7f6      	b.n	e94 <main+0x64>
     ea6:	bf00      	nop
     ea8:	40004400 	.word	0x40004400
     eac:	20000000 	.word	0x20000000
     eb0:	00001960 	.word	0x00001960
     eb4:	200000d8 	.word	0x200000d8
     eb8:	2000000c 	.word	0x2000000c

00000ebc <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
     ebc:	4668      	mov	r0, sp
     ebe:	f020 0107 	bic.w	r1, r0, #7
     ec2:	468d      	mov	sp, r1
     ec4:	b481      	push	{r0, r7}
     ec6:	af00      	add	r7, sp, #0
	if (USART2_SR&(1<<USART_SR_RXNE)){
     ec8:	4b0e      	ldr	r3, [pc, #56]	; (f04 <USART2_handler+0x48>)
     eca:	681b      	ldr	r3, [r3, #0]
     ecc:	f003 0320 	and.w	r3, r3, #32
     ed0:	2b00      	cmp	r3, #0
     ed2:	d012      	beq.n	efa <USART2_handler+0x3e>
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
     ed4:	4b0c      	ldr	r3, [pc, #48]	; (f08 <USART2_handler+0x4c>)
     ed6:	6a1b      	ldr	r3, [r3, #32]
     ed8:	1c5a      	adds	r2, r3, #1
     eda:	490b      	ldr	r1, [pc, #44]	; (f08 <USART2_handler+0x4c>)
     edc:	620a      	str	r2, [r1, #32]
     ede:	4a0b      	ldr	r2, [pc, #44]	; (f0c <USART2_handler+0x50>)
     ee0:	6812      	ldr	r2, [r2, #0]
     ee2:	b2d2      	uxtb	r2, r2
     ee4:	f002 027f 	and.w	r2, r2, #127	; 0x7f
     ee8:	b2d1      	uxtb	r1, r2
     eea:	4a07      	ldr	r2, [pc, #28]	; (f08 <USART2_handler+0x4c>)
     eec:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
     eee:	4b06      	ldr	r3, [pc, #24]	; (f08 <USART2_handler+0x4c>)
     ef0:	6a1b      	ldr	r3, [r3, #32]
     ef2:	f003 031f 	and.w	r3, r3, #31
     ef6:	4a04      	ldr	r2, [pc, #16]	; (f08 <USART2_handler+0x4c>)
     ef8:	6213      	str	r3, [r2, #32]
	}
}
     efa:	46bd      	mov	sp, r7
     efc:	bc81      	pop	{r0, r7}
     efe:	4685      	mov	sp, r0
     f00:	4770      	bx	lr
     f02:	bf00      	nop
     f04:	40004400 	.word	0x40004400
     f08:	200000b0 	.word	0x200000b0
     f0c:	40004404 	.word	0x40004404

00000f10 <conout>:


// envoie d'un caractère à la console
void conout(char c){
     f10:	b580      	push	{r7, lr}
     f12:	b082      	sub	sp, #8
     f14:	af00      	add	r7, sp, #0
     f16:	4603      	mov	r3, r0
     f18:	71fb      	strb	r3, [r7, #7]
	uart_putc(CON,c);
     f1a:	79fb      	ldrb	r3, [r7, #7]
     f1c:	4803      	ldr	r0, [pc, #12]	; (f2c <conout+0x1c>)
     f1e:	4619      	mov	r1, r3
     f20:	f000 fc78 	bl	1814 <uart_putc>
}
     f24:	3708      	adds	r7, #8
     f26:	46bd      	mov	sp, r7
     f28:	bd80      	pop	{r7, pc}
     f2a:	bf00      	nop
     f2c:	40004400 	.word	0x40004400

00000f30 <conin>:


// réception d'un caractère de la console
char conin(){
     f30:	b480      	push	{r7}
     f32:	b083      	sub	sp, #12
     f34:	af00      	add	r7, sp, #0
	char c=0;
     f36:	2300      	movs	r3, #0
     f38:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
     f3a:	4b0d      	ldr	r3, [pc, #52]	; (f70 <conin+0x40>)
     f3c:	6a1a      	ldr	r2, [r3, #32]
     f3e:	4b0c      	ldr	r3, [pc, #48]	; (f70 <conin+0x40>)
     f40:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     f42:	429a      	cmp	r2, r3
     f44:	d00d      	beq.n	f62 <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
     f46:	4b0a      	ldr	r3, [pc, #40]	; (f70 <conin+0x40>)
     f48:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     f4a:	1c5a      	adds	r2, r3, #1
     f4c:	4908      	ldr	r1, [pc, #32]	; (f70 <conin+0x40>)
     f4e:	624a      	str	r2, [r1, #36]	; 0x24
     f50:	4a07      	ldr	r2, [pc, #28]	; (f70 <conin+0x40>)
     f52:	5cd3      	ldrb	r3, [r2, r3]
     f54:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
     f56:	4b06      	ldr	r3, [pc, #24]	; (f70 <conin+0x40>)
     f58:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     f5a:	f003 031f 	and.w	r3, r3, #31
     f5e:	4a04      	ldr	r2, [pc, #16]	; (f70 <conin+0x40>)
     f60:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
     f62:	79fb      	ldrb	r3, [r7, #7]
}
     f64:	4618      	mov	r0, r3
     f66:	370c      	adds	r7, #12
     f68:	46bd      	mov	sp, r7
     f6a:	f85d 7b04 	ldr.w	r7, [sp], #4
     f6e:	4770      	bx	lr
     f70:	200000b0 	.word	0x200000b0

00000f74 <print>:

// imprime un chaîne sur la console
void print(const char *str){
     f74:	b580      	push	{r7, lr}
     f76:	b082      	sub	sp, #8
     f78:	af00      	add	r7, sp, #0
     f7a:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
     f7c:	e006      	b.n	f8c <print+0x18>
     f7e:	687b      	ldr	r3, [r7, #4]
     f80:	1c5a      	adds	r2, r3, #1
     f82:	607a      	str	r2, [r7, #4]
     f84:	781b      	ldrb	r3, [r3, #0]
     f86:	4618      	mov	r0, r3
     f88:	f7ff ffc2 	bl	f10 <conout>
     f8c:	687b      	ldr	r3, [r7, #4]
     f8e:	781b      	ldrb	r3, [r3, #0]
     f90:	2b00      	cmp	r3, #0
     f92:	d1f4      	bne.n	f7e <print+0xa>
}
     f94:	3708      	adds	r7, #8
     f96:	46bd      	mov	sp, r7
     f98:	bd80      	pop	{r7, pc}
     f9a:	bf00      	nop

00000f9c <beep>:

void beep(){
     f9c:	b480      	push	{r7}
     f9e:	af00      	add	r7, sp, #0
}
     fa0:	46bd      	mov	sp, r7
     fa2:	f85d 7b04 	ldr.w	r7, [sp], #4
     fa6:	4770      	bx	lr

00000fa8 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
     fa8:	b580      	push	{r7, lr}
     faa:	af00      	add	r7, sp, #0
	conout(BS);
     fac:	2008      	movs	r0, #8
     fae:	f7ff ffaf 	bl	f10 <conout>
	conout(SPACE);
     fb2:	2020      	movs	r0, #32
     fb4:	f7ff ffac 	bl	f10 <conout>
	conout(BS);
     fb8:	2008      	movs	r0, #8
     fba:	f7ff ffa9 	bl	f10 <conout>
}
     fbe:	bd80      	pop	{r7, pc}

00000fc0 <esc_seq>:

void esc_seq(){
     fc0:	b580      	push	{r7, lr}
     fc2:	af00      	add	r7, sp, #0
	conout(ESC);
     fc4:	201b      	movs	r0, #27
     fc6:	f7ff ffa3 	bl	f10 <conout>
	conout('[');
     fca:	205b      	movs	r0, #91	; 0x5b
     fcc:	f7ff ffa0 	bl	f10 <conout>
}
     fd0:	bd80      	pop	{r7, pc}
     fd2:	bf00      	nop

00000fd4 <cls>:

// vide l'écran de la console
void cls(){
     fd4:	b580      	push	{r7, lr}
     fd6:	af00      	add	r7, sp, #0
	esc_seq();
     fd8:	f7ff fff2 	bl	fc0 <esc_seq>
	conout('2');
     fdc:	2032      	movs	r0, #50	; 0x32
     fde:	f7ff ff97 	bl	f10 <conout>
	conout('J');
     fe2:	204a      	movs	r0, #74	; 0x4a
     fe4:	f7ff ff94 	bl	f10 <conout>
}
     fe8:	bd80      	pop	{r7, pc}
     fea:	bf00      	nop

00000fec <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
     fec:	b580      	push	{r7, lr}
     fee:	b082      	sub	sp, #8
     ff0:	af00      	add	r7, sp, #0
     ff2:	6078      	str	r0, [r7, #4]
	esc_seq();
     ff4:	f7ff ffe4 	bl	fc0 <esc_seq>
	conout('2');
     ff8:	2032      	movs	r0, #50	; 0x32
     ffa:	f7ff ff89 	bl	f10 <conout>
	conout('K');
     ffe:	204b      	movs	r0, #75	; 0x4b
    1000:	f7ff ff86 	bl	f10 <conout>
	while (n){conout(BS);n--;}
    1004:	e005      	b.n	1012 <clear_line+0x26>
    1006:	2008      	movs	r0, #8
    1008:	f7ff ff82 	bl	f10 <conout>
    100c:	687b      	ldr	r3, [r7, #4]
    100e:	3b01      	subs	r3, #1
    1010:	607b      	str	r3, [r7, #4]
    1012:	687b      	ldr	r3, [r7, #4]
    1014:	2b00      	cmp	r3, #0
    1016:	d1f6      	bne.n	1006 <clear_line+0x1a>
}
    1018:	3708      	adds	r7, #8
    101a:	46bd      	mov	sp, r7
    101c:	bd80      	pop	{r7, pc}
    101e:	bf00      	nop

00001020 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    1020:	b580      	push	{r7, lr}
    1022:	b084      	sub	sp, #16
    1024:	af00      	add	r7, sp, #0
    1026:	6078      	str	r0, [r7, #4]
    1028:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    102a:	2300      	movs	r3, #0
    102c:	60fb      	str	r3, [r7, #12]
	char c=0;
    102e:	2300      	movs	r3, #0
    1030:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    1032:	683b      	ldr	r3, [r7, #0]
    1034:	3b01      	subs	r3, #1
    1036:	603b      	str	r3, [r7, #0]
	while (c!=13){
    1038:	e08e      	b.n	1158 <read_line+0x138>
			c=conin();
    103a:	f7ff ff79 	bl	f30 <conin>
    103e:	4603      	mov	r3, r0
    1040:	72fb      	strb	r3, [r7, #11]
			switch(c){
    1042:	7afb      	ldrb	r3, [r7, #11]
    1044:	2b18      	cmp	r3, #24
    1046:	d872      	bhi.n	112e <read_line+0x10e>
    1048:	a201      	add	r2, pc, #4	; (adr r2, 1050 <read_line+0x30>)
    104a:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    104e:	bf00      	nop
    1050:	00001159 	.word	0x00001159
    1054:	0000112f 	.word	0x0000112f
    1058:	0000112f 	.word	0x0000112f
    105c:	0000112f 	.word	0x0000112f
    1060:	0000112f 	.word	0x0000112f
    1064:	00001121 	.word	0x00001121
    1068:	0000112f 	.word	0x0000112f
    106c:	0000112f 	.word	0x0000112f
    1070:	0000110f 	.word	0x0000110f
    1074:	0000112b 	.word	0x0000112b
    1078:	000010b5 	.word	0x000010b5
    107c:	0000112f 	.word	0x0000112f
    1080:	0000112f 	.word	0x0000112f
    1084:	000010b5 	.word	0x000010b5
    1088:	0000112f 	.word	0x0000112f
    108c:	0000112f 	.word	0x0000112f
    1090:	0000112f 	.word	0x0000112f
    1094:	0000112f 	.word	0x0000112f
    1098:	0000112f 	.word	0x0000112f
    109c:	0000112f 	.word	0x0000112f
    10a0:	0000112f 	.word	0x0000112f
    10a4:	000010c3 	.word	0x000010c3
    10a8:	0000112f 	.word	0x0000112f
    10ac:	000010d9 	.word	0x000010d9
    10b0:	000010c3 	.word	0x000010c3
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    10b4:	230d      	movs	r3, #13
    10b6:	72fb      	strb	r3, [r7, #11]
				conout(c);
    10b8:	7afb      	ldrb	r3, [r7, #11]
    10ba:	4618      	mov	r0, r3
    10bc:	f7ff ff28 	bl	f10 <conout>
				break;
    10c0:	e04a      	b.n	1158 <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
    10c2:	68f8      	ldr	r0, [r7, #12]
    10c4:	f7ff ff92 	bl	fec <clear_line>
				line_len=0;
    10c8:	2300      	movs	r3, #0
    10ca:	60fb      	str	r3, [r7, #12]
				break;
    10cc:	e044      	b.n	1158 <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    10ce:	f7ff ff6b 	bl	fa8 <delete_back>
					line_len--;
    10d2:	68fb      	ldr	r3, [r7, #12]
    10d4:	3b01      	subs	r3, #1
    10d6:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    10d8:	68fb      	ldr	r3, [r7, #12]
    10da:	2b00      	cmp	r3, #0
    10dc:	d006      	beq.n	10ec <read_line+0xcc>
    10de:	68fb      	ldr	r3, [r7, #12]
    10e0:	3b01      	subs	r3, #1
    10e2:	687a      	ldr	r2, [r7, #4]
    10e4:	4413      	add	r3, r2
    10e6:	781b      	ldrb	r3, [r3, #0]
    10e8:	2b20      	cmp	r3, #32
    10ea:	d0f0      	beq.n	10ce <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    10ec:	e004      	b.n	10f8 <read_line+0xd8>
					delete_back();
    10ee:	f7ff ff5b 	bl	fa8 <delete_back>
					line_len--;
    10f2:	68fb      	ldr	r3, [r7, #12]
    10f4:	3b01      	subs	r3, #1
    10f6:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    10f8:	68fb      	ldr	r3, [r7, #12]
    10fa:	2b00      	cmp	r3, #0
    10fc:	d006      	beq.n	110c <read_line+0xec>
    10fe:	68fb      	ldr	r3, [r7, #12]
    1100:	3b01      	subs	r3, #1
    1102:	687a      	ldr	r2, [r7, #4]
    1104:	4413      	add	r3, r2
    1106:	781b      	ldrb	r3, [r3, #0]
    1108:	2b20      	cmp	r3, #32
    110a:	d1f0      	bne.n	10ee <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    110c:	e024      	b.n	1158 <read_line+0x138>
				case BS:
				if (line_len){
    110e:	68fb      	ldr	r3, [r7, #12]
    1110:	2b00      	cmp	r3, #0
    1112:	d004      	beq.n	111e <read_line+0xfe>
					delete_back();
    1114:	f7ff ff48 	bl	fa8 <delete_back>
					line_len--;
    1118:	68fb      	ldr	r3, [r7, #12]
    111a:	3b01      	subs	r3, #1
    111c:	60fb      	str	r3, [r7, #12]
				}
				break;
    111e:	e01b      	b.n	1158 <read_line+0x138>
				case CTRL_E:
				cls();
    1120:	f7ff ff58 	bl	fd4 <cls>
				line_len=0;
    1124:	2300      	movs	r3, #0
    1126:	60fb      	str	r3, [r7, #12]
				break;
    1128:	e016      	b.n	1158 <read_line+0x138>
				case TAB:
				c=SPACE;
    112a:	2320      	movs	r3, #32
    112c:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    112e:	68fa      	ldr	r2, [r7, #12]
    1130:	683b      	ldr	r3, [r7, #0]
    1132:	429a      	cmp	r2, r3
    1134:	d20e      	bcs.n	1154 <read_line+0x134>
    1136:	7afb      	ldrb	r3, [r7, #11]
    1138:	2b1f      	cmp	r3, #31
    113a:	d90b      	bls.n	1154 <read_line+0x134>
					buffer[line_len++]=c;
    113c:	68fb      	ldr	r3, [r7, #12]
    113e:	1c5a      	adds	r2, r3, #1
    1140:	60fa      	str	r2, [r7, #12]
    1142:	687a      	ldr	r2, [r7, #4]
    1144:	4413      	add	r3, r2
    1146:	7afa      	ldrb	r2, [r7, #11]
    1148:	701a      	strb	r2, [r3, #0]
					conout(c);
    114a:	7afb      	ldrb	r3, [r7, #11]
    114c:	4618      	mov	r0, r3
    114e:	f7ff fedf 	bl	f10 <conout>
    1152:	e001      	b.n	1158 <read_line+0x138>
				}else{
					beep();
    1154:	f7ff ff22 	bl	f9c <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    1158:	7afb      	ldrb	r3, [r7, #11]
    115a:	2b0d      	cmp	r3, #13
    115c:	f47f af6d 	bne.w	103a <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1160:	687a      	ldr	r2, [r7, #4]
    1162:	68fb      	ldr	r3, [r7, #12]
    1164:	4413      	add	r3, r2
    1166:	2200      	movs	r2, #0
    1168:	701a      	strb	r2, [r3, #0]
	return line_len;
    116a:	68fb      	ldr	r3, [r7, #12]
}
    116c:	4618      	mov	r0, r3
    116e:	3710      	adds	r7, #16
    1170:	46bd      	mov	sp, r7
    1172:	bd80      	pop	{r7, pc}

00001174 <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    1174:	b580      	push	{r7, lr}
    1176:	b08e      	sub	sp, #56	; 0x38
    1178:	af00      	add	r7, sp, #0
    117a:	6078      	str	r0, [r7, #4]
    117c:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    117e:	2301      	movs	r3, #1
    1180:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    1182:	2322      	movs	r3, #34	; 0x22
    1184:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    1186:	2300      	movs	r3, #0
    1188:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    118c:	687b      	ldr	r3, [r7, #4]
    118e:	2b00      	cmp	r3, #0
    1190:	da05      	bge.n	119e <print_int+0x2a>
    1192:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1196:	637b      	str	r3, [r7, #52]	; 0x34
    1198:	687b      	ldr	r3, [r7, #4]
    119a:	425b      	negs	r3, r3
    119c:	607b      	str	r3, [r7, #4]
	while (i){
    119e:	e02c      	b.n	11fa <print_int+0x86>
		fmt[pos]=i%base+'0';
    11a0:	687b      	ldr	r3, [r7, #4]
    11a2:	683a      	ldr	r2, [r7, #0]
    11a4:	fbb3 f2f2 	udiv	r2, r3, r2
    11a8:	6839      	ldr	r1, [r7, #0]
    11aa:	fb01 f202 	mul.w	r2, r1, r2
    11ae:	1a9b      	subs	r3, r3, r2
    11b0:	b2db      	uxtb	r3, r3
    11b2:	3330      	adds	r3, #48	; 0x30
    11b4:	b2d9      	uxtb	r1, r3
    11b6:	f107 020c 	add.w	r2, r7, #12
    11ba:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11bc:	4413      	add	r3, r2
    11be:	460a      	mov	r2, r1
    11c0:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    11c2:	f107 020c 	add.w	r2, r7, #12
    11c6:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11c8:	4413      	add	r3, r2
    11ca:	781b      	ldrb	r3, [r3, #0]
    11cc:	2b39      	cmp	r3, #57	; 0x39
    11ce:	d90c      	bls.n	11ea <print_int+0x76>
    11d0:	f107 020c 	add.w	r2, r7, #12
    11d4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11d6:	4413      	add	r3, r2
    11d8:	781b      	ldrb	r3, [r3, #0]
    11da:	3307      	adds	r3, #7
    11dc:	b2d9      	uxtb	r1, r3
    11de:	f107 020c 	add.w	r2, r7, #12
    11e2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11e4:	4413      	add	r3, r2
    11e6:	460a      	mov	r2, r1
    11e8:	701a      	strb	r2, [r3, #0]
		pos--;
    11ea:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11ec:	3b01      	subs	r3, #1
    11ee:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    11f0:	687a      	ldr	r2, [r7, #4]
    11f2:	683b      	ldr	r3, [r7, #0]
    11f4:	fbb2 f3f3 	udiv	r3, r2, r3
    11f8:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    11fa:	687b      	ldr	r3, [r7, #4]
    11fc:	2b00      	cmp	r3, #0
    11fe:	d1cf      	bne.n	11a0 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    1200:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1202:	2b22      	cmp	r3, #34	; 0x22
    1204:	d108      	bne.n	1218 <print_int+0xa4>
    1206:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1208:	1e5a      	subs	r2, r3, #1
    120a:	633a      	str	r2, [r7, #48]	; 0x30
    120c:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1210:	4413      	add	r3, r2
    1212:	2230      	movs	r2, #48	; 0x30
    1214:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    1218:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    121a:	2b00      	cmp	r3, #0
    121c:	da08      	bge.n	1230 <print_int+0xbc>
    121e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1220:	1e5a      	subs	r2, r3, #1
    1222:	633a      	str	r2, [r7, #48]	; 0x30
    1224:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1228:	4413      	add	r3, r2
    122a:	222d      	movs	r2, #45	; 0x2d
    122c:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    1230:	f107 020c 	add.w	r2, r7, #12
    1234:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1236:	4413      	add	r3, r2
    1238:	2220      	movs	r2, #32
    123a:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    123c:	f107 020c 	add.w	r2, r7, #12
    1240:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1242:	4413      	add	r3, r2
    1244:	4618      	mov	r0, r3
    1246:	f7ff fe95 	bl	f74 <print>
}
    124a:	3738      	adds	r7, #56	; 0x38
    124c:	46bd      	mov	sp, r7
    124e:	bd80      	pop	{r7, pc}

00001250 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    1250:	b580      	push	{r7, lr}
    1252:	b088      	sub	sp, #32
    1254:	af00      	add	r7, sp, #0
    1256:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    1258:	230c      	movs	r3, #12
    125a:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    125c:	2300      	movs	r3, #0
    125e:	767b      	strb	r3, [r7, #25]
	while (u){
    1260:	e026      	b.n	12b0 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    1262:	687b      	ldr	r3, [r7, #4]
    1264:	b2db      	uxtb	r3, r3
    1266:	f003 030f 	and.w	r3, r3, #15
    126a:	b2db      	uxtb	r3, r3
    126c:	3330      	adds	r3, #48	; 0x30
    126e:	b2d9      	uxtb	r1, r3
    1270:	f107 020c 	add.w	r2, r7, #12
    1274:	69fb      	ldr	r3, [r7, #28]
    1276:	4413      	add	r3, r2
    1278:	460a      	mov	r2, r1
    127a:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    127c:	f107 020c 	add.w	r2, r7, #12
    1280:	69fb      	ldr	r3, [r7, #28]
    1282:	4413      	add	r3, r2
    1284:	781b      	ldrb	r3, [r3, #0]
    1286:	2b39      	cmp	r3, #57	; 0x39
    1288:	d90c      	bls.n	12a4 <print_hex+0x54>
    128a:	f107 020c 	add.w	r2, r7, #12
    128e:	69fb      	ldr	r3, [r7, #28]
    1290:	4413      	add	r3, r2
    1292:	781b      	ldrb	r3, [r3, #0]
    1294:	3307      	adds	r3, #7
    1296:	b2d9      	uxtb	r1, r3
    1298:	f107 020c 	add.w	r2, r7, #12
    129c:	69fb      	ldr	r3, [r7, #28]
    129e:	4413      	add	r3, r2
    12a0:	460a      	mov	r2, r1
    12a2:	701a      	strb	r2, [r3, #0]
		pos--;
    12a4:	69fb      	ldr	r3, [r7, #28]
    12a6:	3b01      	subs	r3, #1
    12a8:	61fb      	str	r3, [r7, #28]
		u/=16;
    12aa:	687b      	ldr	r3, [r7, #4]
    12ac:	091b      	lsrs	r3, r3, #4
    12ae:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    12b0:	687b      	ldr	r3, [r7, #4]
    12b2:	2b00      	cmp	r3, #0
    12b4:	d1d5      	bne.n	1262 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    12b6:	69fb      	ldr	r3, [r7, #28]
    12b8:	2b0c      	cmp	r3, #12
    12ba:	d108      	bne.n	12ce <print_hex+0x7e>
    12bc:	69fb      	ldr	r3, [r7, #28]
    12be:	1e5a      	subs	r2, r3, #1
    12c0:	61fa      	str	r2, [r7, #28]
    12c2:	f107 0220 	add.w	r2, r7, #32
    12c6:	4413      	add	r3, r2
    12c8:	2230      	movs	r2, #48	; 0x30
    12ca:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    12ce:	69fb      	ldr	r3, [r7, #28]
    12d0:	1e5a      	subs	r2, r3, #1
    12d2:	61fa      	str	r2, [r7, #28]
    12d4:	f107 0220 	add.w	r2, r7, #32
    12d8:	4413      	add	r3, r2
    12da:	2278      	movs	r2, #120	; 0x78
    12dc:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    12e0:	69fb      	ldr	r3, [r7, #28]
    12e2:	1e5a      	subs	r2, r3, #1
    12e4:	61fa      	str	r2, [r7, #28]
    12e6:	f107 0220 	add.w	r2, r7, #32
    12ea:	4413      	add	r3, r2
    12ec:	2230      	movs	r2, #48	; 0x30
    12ee:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    12f2:	f107 020c 	add.w	r2, r7, #12
    12f6:	69fb      	ldr	r3, [r7, #28]
    12f8:	4413      	add	r3, r2
    12fa:	2220      	movs	r2, #32
    12fc:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    12fe:	f107 020c 	add.w	r2, r7, #12
    1302:	69fb      	ldr	r3, [r7, #28]
    1304:	4413      	add	r3, r2
    1306:	4618      	mov	r0, r3
    1308:	f7ff fe34 	bl	f74 <print>
}
    130c:	3720      	adds	r7, #32
    130e:	46bd      	mov	sp, r7
    1310:	bd80      	pop	{r7, pc}
    1312:	bf00      	nop

00001314 <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    1314:	b480      	push	{r7}
    1316:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    1318:	4b04      	ldr	r3, [pc, #16]	; (132c <flush_rx_queue+0x18>)
    131a:	2200      	movs	r2, #0
    131c:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    131e:	4b03      	ldr	r3, [pc, #12]	; (132c <flush_rx_queue+0x18>)
    1320:	2200      	movs	r2, #0
    1322:	625a      	str	r2, [r3, #36]	; 0x24
}
    1324:	46bd      	mov	sp, r7
    1326:	f85d 7b04 	ldr.w	r7, [sp], #4
    132a:	4770      	bx	lr
    132c:	200000b0 	.word	0x200000b0

00001330 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    1330:	b480      	push	{r7}
    1332:	b085      	sub	sp, #20
    1334:	af00      	add	r7, sp, #0
    1336:	60f8      	str	r0, [r7, #12]
    1338:	60b9      	str	r1, [r7, #8]
    133a:	607a      	str	r2, [r7, #4]
	switch (port){
    133c:	68fb      	ldr	r3, [r7, #12]
    133e:	2b01      	cmp	r3, #1
    1340:	d034      	beq.n	13ac <config_pin+0x7c>
    1342:	2b01      	cmp	r3, #1
    1344:	d302      	bcc.n	134c <config_pin+0x1c>
    1346:	2b02      	cmp	r3, #2
    1348:	d060      	beq.n	140c <config_pin+0xdc>
    134a:	e08f      	b.n	146c <config_pin+0x13c>
		case GPIOA:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    134c:	68bb      	ldr	r3, [r7, #8]
    134e:	08db      	lsrs	r3, r3, #3
    1350:	009b      	lsls	r3, r3, #2
    1352:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    1356:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    135a:	68ba      	ldr	r2, [r7, #8]
    135c:	08d2      	lsrs	r2, r2, #3
    135e:	0092      	lsls	r2, r2, #2
    1360:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    1364:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    1368:	6812      	ldr	r2, [r2, #0]
    136a:	68b9      	ldr	r1, [r7, #8]
    136c:	f001 0107 	and.w	r1, r1, #7
    1370:	200f      	movs	r0, #15
    1372:	fa00 f101 	lsl.w	r1, r0, r1
    1376:	43c9      	mvns	r1, r1
    1378:	400a      	ands	r2, r1
    137a:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    137c:	68bb      	ldr	r3, [r7, #8]
    137e:	08db      	lsrs	r3, r3, #3
    1380:	009b      	lsls	r3, r3, #2
    1382:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    1386:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    138a:	68ba      	ldr	r2, [r7, #8]
    138c:	08d2      	lsrs	r2, r2, #3
    138e:	0092      	lsls	r2, r2, #2
    1390:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    1394:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    1398:	6811      	ldr	r1, [r2, #0]
    139a:	68ba      	ldr	r2, [r7, #8]
    139c:	f002 0207 	and.w	r2, r2, #7
    13a0:	6878      	ldr	r0, [r7, #4]
    13a2:	fa00 f202 	lsl.w	r2, r0, r2
    13a6:	430a      	orrs	r2, r1
    13a8:	601a      	str	r2, [r3, #0]
		break;
    13aa:	e05f      	b.n	146c <config_pin+0x13c>
		case GPIOB:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    13ac:	68bb      	ldr	r3, [r7, #8]
    13ae:	08db      	lsrs	r3, r3, #3
    13b0:	009b      	lsls	r3, r3, #2
    13b2:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    13b6:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    13ba:	68ba      	ldr	r2, [r7, #8]
    13bc:	08d2      	lsrs	r2, r2, #3
    13be:	0092      	lsls	r2, r2, #2
    13c0:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    13c4:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    13c8:	6812      	ldr	r2, [r2, #0]
    13ca:	68b9      	ldr	r1, [r7, #8]
    13cc:	f001 0107 	and.w	r1, r1, #7
    13d0:	200f      	movs	r0, #15
    13d2:	fa00 f101 	lsl.w	r1, r0, r1
    13d6:	43c9      	mvns	r1, r1
    13d8:	400a      	ands	r2, r1
    13da:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    13dc:	68bb      	ldr	r3, [r7, #8]
    13de:	08db      	lsrs	r3, r3, #3
    13e0:	009b      	lsls	r3, r3, #2
    13e2:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    13e6:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    13ea:	68ba      	ldr	r2, [r7, #8]
    13ec:	08d2      	lsrs	r2, r2, #3
    13ee:	0092      	lsls	r2, r2, #2
    13f0:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    13f4:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    13f8:	6811      	ldr	r1, [r2, #0]
    13fa:	68ba      	ldr	r2, [r7, #8]
    13fc:	f002 0207 	and.w	r2, r2, #7
    1400:	6878      	ldr	r0, [r7, #4]
    1402:	fa00 f202 	lsl.w	r2, r0, r2
    1406:	430a      	orrs	r2, r1
    1408:	601a      	str	r2, [r3, #0]
		break;
    140a:	e02f      	b.n	146c <config_pin+0x13c>
		case GPIOC:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    140c:	68bb      	ldr	r3, [r7, #8]
    140e:	08db      	lsrs	r3, r3, #3
    1410:	009b      	lsls	r3, r3, #2
    1412:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    1416:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    141a:	68ba      	ldr	r2, [r7, #8]
    141c:	08d2      	lsrs	r2, r2, #3
    141e:	0092      	lsls	r2, r2, #2
    1420:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    1424:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    1428:	6812      	ldr	r2, [r2, #0]
    142a:	68b9      	ldr	r1, [r7, #8]
    142c:	f001 0107 	and.w	r1, r1, #7
    1430:	200f      	movs	r0, #15
    1432:	fa00 f101 	lsl.w	r1, r0, r1
    1436:	43c9      	mvns	r1, r1
    1438:	400a      	ands	r2, r1
    143a:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    143c:	68bb      	ldr	r3, [r7, #8]
    143e:	08db      	lsrs	r3, r3, #3
    1440:	009b      	lsls	r3, r3, #2
    1442:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    1446:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    144a:	68ba      	ldr	r2, [r7, #8]
    144c:	08d2      	lsrs	r2, r2, #3
    144e:	0092      	lsls	r2, r2, #2
    1450:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    1454:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    1458:	6811      	ldr	r1, [r2, #0]
    145a:	68ba      	ldr	r2, [r7, #8]
    145c:	f002 0207 	and.w	r2, r2, #7
    1460:	6878      	ldr	r0, [r7, #4]
    1462:	fa00 f202 	lsl.w	r2, r0, r2
    1466:	430a      	orrs	r2, r1
    1468:	601a      	str	r2, [r3, #0]
		break;
    146a:	bf00      	nop
	}
}
    146c:	3714      	adds	r7, #20
    146e:	46bd      	mov	sp, r7
    1470:	f85d 7b04 	ldr.w	r7, [sp], #4
    1474:	4770      	bx	lr
    1476:	bf00      	nop

00001478 <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    1478:	b480      	push	{r7}
    147a:	b083      	sub	sp, #12
    147c:	af00      	add	r7, sp, #0
    147e:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    1480:	687b      	ldr	r3, [r7, #4]
    1482:	2b3b      	cmp	r3, #59	; 0x3b
    1484:	d900      	bls.n	1488 <enable_interrupt+0x10>
    1486:	e016      	b.n	14b6 <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    1488:	687b      	ldr	r3, [r7, #4]
    148a:	095b      	lsrs	r3, r3, #5
    148c:	009b      	lsls	r3, r3, #2
    148e:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    1492:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    1496:	687a      	ldr	r2, [r7, #4]
    1498:	0952      	lsrs	r2, r2, #5
    149a:	0092      	lsls	r2, r2, #2
    149c:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    14a0:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    14a4:	6812      	ldr	r2, [r2, #0]
    14a6:	6879      	ldr	r1, [r7, #4]
    14a8:	f001 011f 	and.w	r1, r1, #31
    14ac:	2001      	movs	r0, #1
    14ae:	fa00 f101 	lsl.w	r1, r0, r1
    14b2:	430a      	orrs	r2, r1
    14b4:	601a      	str	r2, [r3, #0]
}
    14b6:	370c      	adds	r7, #12
    14b8:	46bd      	mov	sp, r7
    14ba:	f85d 7b04 	ldr.w	r7, [sp], #4
    14be:	4770      	bx	lr

000014c0 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    14c0:	b480      	push	{r7}
    14c2:	b083      	sub	sp, #12
    14c4:	af00      	add	r7, sp, #0
    14c6:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    14c8:	687b      	ldr	r3, [r7, #4]
    14ca:	2b3b      	cmp	r3, #59	; 0x3b
    14cc:	d900      	bls.n	14d0 <disable_interrupt+0x10>
    14ce:	e013      	b.n	14f8 <disable_interrupt+0x38>
	ICER[irq>>5]&=~(1<<(irq&0x1f));
    14d0:	687b      	ldr	r3, [r7, #4]
    14d2:	095b      	lsrs	r3, r3, #5
    14d4:	009a      	lsls	r2, r3, #2
    14d6:	4b0b      	ldr	r3, [pc, #44]	; (1504 <disable_interrupt+0x44>)
    14d8:	4413      	add	r3, r2
    14da:	687a      	ldr	r2, [r7, #4]
    14dc:	0952      	lsrs	r2, r2, #5
    14de:	0091      	lsls	r1, r2, #2
    14e0:	4a08      	ldr	r2, [pc, #32]	; (1504 <disable_interrupt+0x44>)
    14e2:	440a      	add	r2, r1
    14e4:	6812      	ldr	r2, [r2, #0]
    14e6:	6879      	ldr	r1, [r7, #4]
    14e8:	f001 011f 	and.w	r1, r1, #31
    14ec:	2001      	movs	r0, #1
    14ee:	fa00 f101 	lsl.w	r1, r0, r1
    14f2:	43c9      	mvns	r1, r1
    14f4:	400a      	ands	r2, r1
    14f6:	601a      	str	r2, [r3, #0]
}
    14f8:	370c      	adds	r7, #12
    14fa:	46bd      	mov	sp, r7
    14fc:	f85d 7b04 	ldr.w	r7, [sp], #4
    1500:	4770      	bx	lr
    1502:	bf00      	nop
    1504:	e000e180 	.word	0xe000e180

00001508 <set_int_priority>:



void set_int_priority(int32_t irq, unsigned priority){
    1508:	b480      	push	{r7}
    150a:	b083      	sub	sp, #12
    150c:	af00      	add	r7, sp, #0
    150e:	6078      	str	r0, [r7, #4]
    1510:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    1512:	687b      	ldr	r3, [r7, #4]
    1514:	2b00      	cmp	r3, #0
    1516:	db0d      	blt.n	1534 <set_int_priority+0x2c>
    1518:	687b      	ldr	r3, [r7, #4]
    151a:	2b3b      	cmp	r3, #59	; 0x3b
    151c:	dc0a      	bgt.n	1534 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    151e:	687b      	ldr	r3, [r7, #4]
    1520:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    1524:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    1528:	683a      	ldr	r2, [r7, #0]
    152a:	b2d2      	uxtb	r2, r2
    152c:	0112      	lsls	r2, r2, #4
    152e:	b2d2      	uxtb	r2, r2
    1530:	701a      	strb	r2, [r3, #0]
    1532:	e012      	b.n	155a <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    1534:	687b      	ldr	r3, [r7, #4]
    1536:	2b00      	cmp	r3, #0
    1538:	da0f      	bge.n	155a <set_int_priority+0x52>
    153a:	687b      	ldr	r3, [r7, #4]
    153c:	f113 0f0f 	cmn.w	r3, #15
    1540:	db0b      	blt.n	155a <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    1542:	687a      	ldr	r2, [r7, #4]
    1544:	f06f 0303 	mvn.w	r3, #3
    1548:	1a9b      	subs	r3, r3, r2
    154a:	461a      	mov	r2, r3
    154c:	4b05      	ldr	r3, [pc, #20]	; (1564 <set_int_priority+0x5c>)
    154e:	4413      	add	r3, r2
    1550:	683a      	ldr	r2, [r7, #0]
    1552:	b2d2      	uxtb	r2, r2
    1554:	0112      	lsls	r2, r2, #4
    1556:	b2d2      	uxtb	r2, r2
    1558:	701a      	strb	r2, [r3, #0]
	}
}
    155a:	370c      	adds	r7, #12
    155c:	46bd      	mov	sp, r7
    155e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1562:	4770      	bx	lr
    1564:	e000ed18 	.word	0xe000ed18

00001568 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    1568:	4b01      	ldr	r3, [pc, #4]	; (1570 <reset_mcu+0x8>)
    156a:	4a02      	ldr	r2, [pc, #8]	; (1574 <reset_mcu+0xc>)
    156c:	601a      	str	r2, [r3, #0]
    156e:	bf00      	nop
    1570:	e000ed0c 	.word	0xe000ed0c
    1574:	05fa0004 	.word	0x05fa0004

00001578 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    1578:	b580      	push	{r7, lr}
    157a:	b082      	sub	sp, #8
    157c:	af00      	add	r7, sp, #0
    157e:	6078      	str	r0, [r7, #4]
    1580:	6039      	str	r1, [r7, #0]
	print(msg);
    1582:	6878      	ldr	r0, [r7, #4]
    1584:	f7ff fcf6 	bl	f74 <print>
	print("at address ");
    1588:	4814      	ldr	r0, [pc, #80]	; (15dc <print_fault+0x64>)
    158a:	f7ff fcf3 	bl	f74 <print>
	if (adr) {
    158e:	683b      	ldr	r3, [r7, #0]
    1590:	2b00      	cmp	r3, #0
    1592:	d002      	beq.n	159a <print_fault+0x22>
		print_hex(adr);
    1594:	6838      	ldr	r0, [r7, #0]
    1596:	f7ff fe5b 	bl	1250 <print_hex>
	};
	conout(CR);
    159a:	200d      	movs	r0, #13
    159c:	f7ff fcb8 	bl	f10 <conout>
	print("UFSR=");
    15a0:	480f      	ldr	r0, [pc, #60]	; (15e0 <print_fault+0x68>)
    15a2:	f7ff fce7 	bl	f74 <print>
	print_hex(CFSR->fsr.usageFalt);
    15a6:	4b0f      	ldr	r3, [pc, #60]	; (15e4 <print_fault+0x6c>)
    15a8:	681b      	ldr	r3, [r3, #0]
    15aa:	0c1b      	lsrs	r3, r3, #16
    15ac:	b29b      	uxth	r3, r3
    15ae:	4618      	mov	r0, r3
    15b0:	f7ff fe4e 	bl	1250 <print_hex>
	print(", BFSR=");
    15b4:	480c      	ldr	r0, [pc, #48]	; (15e8 <print_fault+0x70>)
    15b6:	f7ff fcdd 	bl	f74 <print>
	print_hex(CFSR->fsr.busFault);
    15ba:	4b0a      	ldr	r3, [pc, #40]	; (15e4 <print_fault+0x6c>)
    15bc:	681b      	ldr	r3, [r3, #0]
    15be:	0a1b      	lsrs	r3, r3, #8
    15c0:	b2db      	uxtb	r3, r3
    15c2:	4618      	mov	r0, r3
    15c4:	f7ff fe44 	bl	1250 <print_hex>
	print(", MMFSR=");
    15c8:	4808      	ldr	r0, [pc, #32]	; (15ec <print_fault+0x74>)
    15ca:	f7ff fcd3 	bl	f74 <print>
	print_hex(CFSR->fsr.mmFault);
    15ce:	4b05      	ldr	r3, [pc, #20]	; (15e4 <print_fault+0x6c>)
    15d0:	681b      	ldr	r3, [r3, #0]
    15d2:	b2db      	uxtb	r3, r3
    15d4:	4618      	mov	r0, r3
    15d6:	f7ff fe3b 	bl	1250 <print_hex>
	while(1);
    15da:	e7fe      	b.n	15da <print_fault+0x62>
    15dc:	0000197c 	.word	0x0000197c
    15e0:	00001988 	.word	0x00001988
    15e4:	e000ed28 	.word	0xe000ed28
    15e8:	00001990 	.word	0x00001990
    15ec:	00001998 	.word	0x00001998

000015f0 <uart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
    15f0:	b480      	push	{r7}
    15f2:	b085      	sub	sp, #20
    15f4:	af00      	add	r7, sp, #0
    15f6:	6078      	str	r0, [r7, #4]
    15f8:	6039      	str	r1, [r7, #0]
	sfrp_t brr;
	uint32_t rate;

    brr=(sfrp_t)(channel+USART_BRR_OFS);		
    15fa:	687b      	ldr	r3, [r7, #4]
    15fc:	3308      	adds	r3, #8
    15fe:	60bb      	str	r3, [r7, #8]
	switch (channel){
    1600:	687b      	ldr	r3, [r7, #4]
    1602:	4a1a      	ldr	r2, [pc, #104]	; (166c <uart_set_baud+0x7c>)
    1604:	4293      	cmp	r3, r2
    1606:	d019      	beq.n	163c <uart_set_baud+0x4c>
    1608:	4a19      	ldr	r2, [pc, #100]	; (1670 <uart_set_baud+0x80>)
    160a:	4293      	cmp	r3, r2
    160c:	d003      	beq.n	1616 <uart_set_baud+0x26>
    160e:	4a19      	ldr	r2, [pc, #100]	; (1674 <uart_set_baud+0x84>)
    1610:	4293      	cmp	r3, r2
    1612:	d013      	beq.n	163c <uart_set_baud+0x4c>
    1614:	e021      	b.n	165a <uart_set_baud+0x6a>
	case USART1:
		rate=(FAPB2/baud/16)<<4;
    1616:	4a18      	ldr	r2, [pc, #96]	; (1678 <uart_set_baud+0x88>)
    1618:	683b      	ldr	r3, [r7, #0]
    161a:	fbb2 f3f3 	udiv	r3, r2, r3
    161e:	011b      	lsls	r3, r3, #4
    1620:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    1622:	4a16      	ldr	r2, [pc, #88]	; (167c <uart_set_baud+0x8c>)
    1624:	683b      	ldr	r3, [r7, #0]
    1626:	fbb2 f3f3 	udiv	r3, r2, r3
    162a:	f003 030f 	and.w	r3, r3, #15
    162e:	68fa      	ldr	r2, [r7, #12]
    1630:	4313      	orrs	r3, r2
    1632:	60fb      	str	r3, [r7, #12]
		*brr=rate;
    1634:	68bb      	ldr	r3, [r7, #8]
    1636:	68fa      	ldr	r2, [r7, #12]
    1638:	601a      	str	r2, [r3, #0]
		return;
    163a:	e011      	b.n	1660 <uart_set_baud+0x70>
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
    163c:	4a10      	ldr	r2, [pc, #64]	; (1680 <uart_set_baud+0x90>)
    163e:	683b      	ldr	r3, [r7, #0]
    1640:	fbb2 f3f3 	udiv	r3, r2, r3
    1644:	011b      	lsls	r3, r3, #4
    1646:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    1648:	4a0e      	ldr	r2, [pc, #56]	; (1684 <uart_set_baud+0x94>)
    164a:	683b      	ldr	r3, [r7, #0]
    164c:	fbb2 f3f3 	udiv	r3, r2, r3
    1650:	f003 030f 	and.w	r3, r3, #15
    1654:	68fa      	ldr	r2, [r7, #12]
    1656:	4313      	orrs	r3, r2
    1658:	60fb      	str	r3, [r7, #12]
	}
	*brr=rate;
    165a:	68bb      	ldr	r3, [r7, #8]
    165c:	68fa      	ldr	r2, [r7, #12]
    165e:	601a      	str	r2, [r3, #0]
}
    1660:	3714      	adds	r7, #20
    1662:	46bd      	mov	sp, r7
    1664:	f85d 7b04 	ldr.w	r7, [sp], #4
    1668:	4770      	bx	lr
    166a:	bf00      	nop
    166c:	40004800 	.word	0x40004800
    1670:	40013800 	.word	0x40013800
    1674:	40004400 	.word	0x40004400
    1678:	0044aa20 	.word	0x0044aa20
    167c:	044aa200 	.word	0x044aa200
    1680:	00225510 	.word	0x00225510
    1684:	02255100 	.word	0x02255100

00001688 <uart_open_channel>:

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl){
    1688:	b580      	push	{r7, lr}
    168a:	b086      	sub	sp, #24
    168c:	af00      	add	r7, sp, #0
    168e:	60f8      	str	r0, [r7, #12]
    1690:	60b9      	str	r1, [r7, #8]
    1692:	607a      	str	r2, [r7, #4]
	sfrp_t cr1, cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
    1694:	68fb      	ldr	r3, [r7, #12]
    1696:	4a42      	ldr	r2, [pc, #264]	; (17a0 <uart_open_channel+0x118>)
    1698:	4293      	cmp	r3, r2
    169a:	d046      	beq.n	172a <uart_open_channel+0xa2>
    169c:	4a41      	ldr	r2, [pc, #260]	; (17a4 <uart_open_channel+0x11c>)
    169e:	4293      	cmp	r3, r2
    16a0:	d003      	beq.n	16aa <uart_open_channel+0x22>
    16a2:	4a41      	ldr	r2, [pc, #260]	; (17a8 <uart_open_channel+0x120>)
    16a4:	4293      	cmp	r3, r2
    16a6:	d020      	beq.n	16ea <uart_open_channel+0x62>
    16a8:	e05f      	b.n	176a <uart_open_channel+0xe2>
	case USART1:
		RCC_APB2ENR|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
    16aa:	4a40      	ldr	r2, [pc, #256]	; (17ac <uart_open_channel+0x124>)
    16ac:	4b3f      	ldr	r3, [pc, #252]	; (17ac <uart_open_channel+0x124>)
    16ae:	681b      	ldr	r3, [r3, #0]
    16b0:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    16b4:	f043 0304 	orr.w	r3, r3, #4
    16b8:	6013      	str	r3, [r2, #0]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    16ba:	4a3d      	ldr	r2, [pc, #244]	; (17b0 <uart_open_channel+0x128>)
    16bc:	4b3c      	ldr	r3, [pc, #240]	; (17b0 <uart_open_channel+0x128>)
    16be:	681b      	ldr	r3, [r3, #0]
    16c0:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    16c4:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    16c8:	6013      	str	r3, [r2, #0]
		GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    16ca:	4a39      	ldr	r2, [pc, #228]	; (17b0 <uart_open_channel+0x128>)
    16cc:	4b38      	ldr	r3, [pc, #224]	; (17b0 <uart_open_channel+0x128>)
    16ce:	681b      	ldr	r3, [r3, #0]
    16d0:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    16d4:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    16d8:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART1,7);
    16da:	2025      	movs	r0, #37	; 0x25
    16dc:	2107      	movs	r1, #7
    16de:	f7ff ff13 	bl	1508 <set_int_priority>
		enable_interrupt(USART1_IRQ);
    16e2:	2025      	movs	r0, #37	; 0x25
    16e4:	f7ff fec8 	bl	1478 <enable_interrupt>
		break;
    16e8:	e03f      	b.n	176a <uart_open_channel+0xe2>
	case USART2:
		RCC_APB1ENR|=(1<<RCC_APB1ENR_USART2EN);
    16ea:	4a32      	ldr	r2, [pc, #200]	; (17b4 <uart_open_channel+0x12c>)
    16ec:	4b31      	ldr	r3, [pc, #196]	; (17b4 <uart_open_channel+0x12c>)
    16ee:	681b      	ldr	r3, [r3, #0]
    16f0:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    16f4:	6013      	str	r3, [r2, #0]
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPAEN);
    16f6:	4a2d      	ldr	r2, [pc, #180]	; (17ac <uart_open_channel+0x124>)
    16f8:	4b2c      	ldr	r3, [pc, #176]	; (17ac <uart_open_channel+0x124>)
    16fa:	681b      	ldr	r3, [r3, #0]
    16fc:	f043 0304 	orr.w	r3, r3, #4
    1700:	6013      	str	r3, [r2, #0]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    1702:	4a2d      	ldr	r2, [pc, #180]	; (17b8 <uart_open_channel+0x130>)
    1704:	4b2c      	ldr	r3, [pc, #176]	; (17b8 <uart_open_channel+0x130>)
    1706:	681b      	ldr	r3, [r3, #0]
    1708:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    170c:	6013      	str	r3, [r2, #0]
		GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    170e:	4a2a      	ldr	r2, [pc, #168]	; (17b8 <uart_open_channel+0x130>)
    1710:	4b29      	ldr	r3, [pc, #164]	; (17b8 <uart_open_channel+0x130>)
    1712:	681b      	ldr	r3, [r3, #0]
    1714:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    1718:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART2,7);
    171a:	2026      	movs	r0, #38	; 0x26
    171c:	2107      	movs	r1, #7
    171e:	f7ff fef3 	bl	1508 <set_int_priority>
		enable_interrupt(USART2_IRQ);
    1722:	2026      	movs	r0, #38	; 0x26
    1724:	f7ff fea8 	bl	1478 <enable_interrupt>
		break;
    1728:	e01f      	b.n	176a <uart_open_channel+0xe2>
	case USART3:
		RCC_APB1ENR|=1<<RCC_APB1ENR_USART3EN;
    172a:	4a22      	ldr	r2, [pc, #136]	; (17b4 <uart_open_channel+0x12c>)
    172c:	4b21      	ldr	r3, [pc, #132]	; (17b4 <uart_open_channel+0x12c>)
    172e:	681b      	ldr	r3, [r3, #0]
    1730:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    1734:	6013      	str	r3, [r2, #0]
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPBEN);
    1736:	4a1d      	ldr	r2, [pc, #116]	; (17ac <uart_open_channel+0x124>)
    1738:	4b1c      	ldr	r3, [pc, #112]	; (17ac <uart_open_channel+0x124>)
    173a:	681b      	ldr	r3, [r3, #0]
    173c:	f043 0308 	orr.w	r3, r3, #8
    1740:	6013      	str	r3, [r2, #0]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    1742:	4a1e      	ldr	r2, [pc, #120]	; (17bc <uart_open_channel+0x134>)
    1744:	4b1d      	ldr	r3, [pc, #116]	; (17bc <uart_open_channel+0x134>)
    1746:	681b      	ldr	r3, [r3, #0]
    1748:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    174c:	6013      	str	r3, [r2, #0]
		GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    174e:	4a1b      	ldr	r2, [pc, #108]	; (17bc <uart_open_channel+0x134>)
    1750:	4b1a      	ldr	r3, [pc, #104]	; (17bc <uart_open_channel+0x134>)
    1752:	681b      	ldr	r3, [r3, #0]
    1754:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    1758:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART3,7);
    175a:	2027      	movs	r0, #39	; 0x27
    175c:	2107      	movs	r1, #7
    175e:	f7ff fed3 	bl	1508 <set_int_priority>
		enable_interrupt(USART3_IRQ);
    1762:	2027      	movs	r0, #39	; 0x27
    1764:	f7ff fe88 	bl	1478 <enable_interrupt>
		break;
    1768:	bf00      	nop
	}
	uart_set_baud(channel,baud);
    176a:	68f8      	ldr	r0, [r7, #12]
    176c:	68b9      	ldr	r1, [r7, #8]
    176e:	f7ff ff3f 	bl	15f0 <uart_set_baud>
	if (flow_ctrl==FLOW_HARD){
    1772:	687b      	ldr	r3, [r7, #4]
    1774:	2b01      	cmp	r3, #1
    1776:	d106      	bne.n	1786 <uart_open_channel+0xfe>
		cr3=(sfrp_t)(channel+USART_CR3_OFS);
    1778:	68fb      	ldr	r3, [r7, #12]
    177a:	3314      	adds	r3, #20
    177c:	617b      	str	r3, [r7, #20]
		*cr3=(1<<USART_CR3_CTSE)|(1<<USART_CR3_RTSE);
    177e:	697b      	ldr	r3, [r7, #20]
    1780:	f44f 7240 	mov.w	r2, #768	; 0x300
    1784:	601a      	str	r2, [r3, #0]
	}
	cr1=(sfrp_t)(channel+USART_CR1_OFS);
    1786:	68fb      	ldr	r3, [r7, #12]
    1788:	330c      	adds	r3, #12
    178a:	613b      	str	r3, [r7, #16]
	uart_getc(channel);
    178c:	68f8      	ldr	r0, [r7, #12]
    178e:	f000 f82d 	bl	17ec <uart_getc>
	*cr1=(1<<USART_CR1_UE)|(1<<USART_CR1_TE)|(1<<USART_CR1_RE)|(1<<USART_CR1_RXNEIE);
    1792:	693b      	ldr	r3, [r7, #16]
    1794:	f242 022c 	movw	r2, #8236	; 0x202c
    1798:	601a      	str	r2, [r3, #0]
}
    179a:	3718      	adds	r7, #24
    179c:	46bd      	mov	sp, r7
    179e:	bd80      	pop	{r7, pc}
    17a0:	40004800 	.word	0x40004800
    17a4:	40013800 	.word	0x40013800
    17a8:	40004400 	.word	0x40004400
    17ac:	40021018 	.word	0x40021018
    17b0:	40010804 	.word	0x40010804
    17b4:	4002101c 	.word	0x4002101c
    17b8:	40010800 	.word	0x40010800
    17bc:	40010c04 	.word	0x40010c04

000017c0 <uart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int uart_stat(unsigned channel){
    17c0:	b480      	push	{r7}
    17c2:	b085      	sub	sp, #20
    17c4:	af00      	add	r7, sp, #0
    17c6:	6078      	str	r0, [r7, #4]
	sfrp_t sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    17c8:	687b      	ldr	r3, [r7, #4]
    17ca:	60fb      	str	r3, [r7, #12]
	return *sr&(1<<USART_SR_RXNE)?-1:0;
    17cc:	68fb      	ldr	r3, [r7, #12]
    17ce:	681b      	ldr	r3, [r3, #0]
    17d0:	f003 0320 	and.w	r3, r3, #32
    17d4:	2b00      	cmp	r3, #0
    17d6:	d002      	beq.n	17de <uart_stat+0x1e>
    17d8:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    17dc:	e000      	b.n	17e0 <uart_stat+0x20>
    17de:	2300      	movs	r3, #0
}
    17e0:	4618      	mov	r0, r3
    17e2:	3714      	adds	r7, #20
    17e4:	46bd      	mov	sp, r7
    17e6:	f85d 7b04 	ldr.w	r7, [sp], #4
    17ea:	4770      	bx	lr

000017ec <uart_getc>:

// reçoit un caractère de la console
char uart_getc(unsigned channel){
    17ec:	b480      	push	{r7}
    17ee:	b085      	sub	sp, #20
    17f0:	af00      	add	r7, sp, #0
    17f2:	6078      	str	r0, [r7, #4]
	sfrp_t dr;
	
	dr=(sfrp_t)(channel+USART_DR_OFS);
    17f4:	687b      	ldr	r3, [r7, #4]
    17f6:	3304      	adds	r3, #4
    17f8:	60fb      	str	r3, [r7, #12]
	return *dr&0x7f;
    17fa:	68fb      	ldr	r3, [r7, #12]
    17fc:	681b      	ldr	r3, [r3, #0]
    17fe:	b2db      	uxtb	r3, r3
    1800:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    1804:	b2db      	uxtb	r3, r3
}
    1806:	4618      	mov	r0, r3
    1808:	3714      	adds	r7, #20
    180a:	46bd      	mov	sp, r7
    180c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1810:	4770      	bx	lr
    1812:	bf00      	nop

00001814 <uart_putc>:

// transmet un caractère à la console
void uart_putc(unsigned channel, char c){
    1814:	b480      	push	{r7}
    1816:	b085      	sub	sp, #20
    1818:	af00      	add	r7, sp, #0
    181a:	6078      	str	r0, [r7, #4]
    181c:	460b      	mov	r3, r1
    181e:	70fb      	strb	r3, [r7, #3]
	sfrp_t dr, sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    1820:	687b      	ldr	r3, [r7, #4]
    1822:	60fb      	str	r3, [r7, #12]
	dr=(sfrp_t)(channel+USART_DR_OFS);
    1824:	687b      	ldr	r3, [r7, #4]
    1826:	3304      	adds	r3, #4
    1828:	60bb      	str	r3, [r7, #8]
	//attend que dr soit vide
	while (!(*sr&(1<<USART_SR_TXE)));
    182a:	bf00      	nop
    182c:	68fb      	ldr	r3, [r7, #12]
    182e:	681b      	ldr	r3, [r3, #0]
    1830:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1834:	2b00      	cmp	r3, #0
    1836:	d0f9      	beq.n	182c <uart_putc+0x18>
	*dr=c&0x7f;
    1838:	78fb      	ldrb	r3, [r7, #3]
    183a:	f003 027f 	and.w	r2, r3, #127	; 0x7f
    183e:	68bb      	ldr	r3, [r7, #8]
    1840:	601a      	str	r2, [r3, #0]
}
    1842:	3714      	adds	r7, #20
    1844:	46bd      	mov	sp, r7
    1846:	f85d 7b04 	ldr.w	r7, [sp], #4
    184a:	4770      	bx	lr

Disassembly of section .user_code:

00001a00 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    1a00:	b480      	push	{r7}
    1a02:	b085      	sub	sp, #20
    1a04:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    1a06:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    1a0a:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    1a0c:	2300      	movs	r3, #0
    1a0e:	71fb      	strb	r3, [r7, #7]
	
	
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    1a10:	2300      	movs	r3, #0
    1a12:	2200      	movs	r2, #0
    1a14:	4618      	mov	r0, r3
    1a16:	4611      	mov	r1, r2
    1a18:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    1a1a:	f107 030c 	add.w	r3, r7, #12
    1a1e:	2200      	movs	r2, #0
    1a20:	4618      	mov	r0, r3
    1a22:	4611      	mov	r1, r2
    1a24:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    1a26:	f107 0308 	add.w	r3, r7, #8
    1a2a:	2200      	movs	r2, #0
    1a2c:	4618      	mov	r0, r3
    1a2e:	4611      	mov	r1, r2
    1a30:	df04      	svc	4
    1a32:	68bb      	ldr	r3, [r7, #8]
    1a34:	2b00      	cmp	r3, #0
    1a36:	d1f6      	bne.n	1a26 <blink+0x26>
		_svc_call(SVC_LED_ON,NUL,NUL);
    1a38:	2300      	movs	r3, #0
    1a3a:	2200      	movs	r2, #0
    1a3c:	4618      	mov	r0, r3
    1a3e:	4611      	mov	r1, r2
    1a40:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    1a42:	f107 030c 	add.w	r3, r7, #12
    1a46:	2200      	movs	r2, #0
    1a48:	4618      	mov	r0, r3
    1a4a:	4611      	mov	r1, r2
    1a4c:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    1a4e:	f107 0308 	add.w	r3, r7, #8
    1a52:	2200      	movs	r2, #0
    1a54:	4618      	mov	r0, r3
    1a56:	4611      	mov	r1, r2
    1a58:	df04      	svc	4
    1a5a:	68bb      	ldr	r3, [r7, #8]
    1a5c:	2b00      	cmp	r3, #0
    1a5e:	d1f6      	bne.n	1a4e <blink+0x4e>
		_svc_call(SVC_CONIN,&c,NUL);
    1a60:	1dfb      	adds	r3, r7, #7
    1a62:	2200      	movs	r2, #0
    1a64:	4618      	mov	r0, r3
    1a66:	4611      	mov	r1, r2
    1a68:	df05      	svc	5
		if (c) break;
    1a6a:	79fb      	ldrb	r3, [r7, #7]
    1a6c:	b2db      	uxtb	r3, r3
    1a6e:	2b00      	cmp	r3, #0
    1a70:	d000      	beq.n	1a74 <blink+0x74>
    1a72:	e000      	b.n	1a76 <blink+0x76>
	}
    1a74:	e7cc      	b.n	1a10 <blink+0x10>
}
    1a76:	3714      	adds	r7, #20
    1a78:	46bd      	mov	sp, r7
    1a7a:	f85d 7b04 	ldr.w	r7, [sp], #4
    1a7e:	4770      	bx	lr
