
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 71 15 00 00     i...m...q...q...
      20:	71 15 00 00 71 15 00 00 71 15 00 00 a9 05 00 00     q...q...q.......
      30:	71 15 00 00 71 15 00 00 79 02 00 00 15 07 00 00     q...q...y.......
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 71 15 00 00 71 15 00 00 71 15 00 00     ....q...q...q...
      80:	71 15 00 00 71 15 00 00 71 15 00 00 71 15 00 00     q...q...q...q...
      90:	71 15 00 00 71 15 00 00 71 15 00 00 71 15 00 00     q...q...q...q...
      a0:	71 15 00 00 71 15 00 00 71 15 00 00 71 15 00 00     q...q...q...q...
      b0:	71 15 00 00 71 15 00 00 71 15 00 00 71 15 00 00     q...q...q...q...
      c0:	71 15 00 00 71 15 00 00 71 15 00 00 71 15 00 00     q...q...q...q...
      d0:	71 15 00 00 b5 02 00 00 c5 0e 00 00 bd 02 00 00     q...............
      e0:	71 15 00 00 71 15 00 00 71 15 00 00 71 15 00 00     q...q...q...q...
      f0:	71 15 00 00 71 15 00 00 71 15 00 00 71 15 00 00     q...q...q...q...
     100:	71 15 00 00 71 15 00 00 71 15 00 00 71 15 00 00     q...q...q...q...
     110:	71 15 00 00 71 15 00 00 71 15 00 00 71 15 00 00     q...q...q...q...
     120:	71 15 00 00 71 15 00 00 71 15 00 00 71 15 00 00     q...q...q...q...

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
     1b0:	f000 fe42 	bl	e38 <main>
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
     208:	f001 f9ba 	bl	1580 <print_fault>
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
     21e:	f001 f9af 	bl	1580 <print_fault>
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
     234:	f001 f9a4 	bl	1580 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f001 f99f 	bl	1580 <print_fault>
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
     264:	f001 f984 	bl	1570 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f001 f982 	bl	1570 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f001 f980 	bl	1570 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f001 f97e 	bl	1570 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f001 f97c 	bl	1570 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f001 f97a 	bl	1570 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f001 f978 	bl	1570 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f001 f976 	bl	1570 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f001 f974 	bl	1570 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f001 f972 	bl	1570 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f001 f970 	bl	1570 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f001 f96e 	bl	1570 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f001 f96c 	bl	1570 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f001 f96a 	bl	1570 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f001 f968 	bl	1570 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f001 f966 	bl	1570 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f001 f964 	bl	1570 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f001 f962 	bl	1570 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f001 f960 	bl	1570 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f001 f95e 	bl	1570 <reset_mcu>

000002b4 <USART1_handler>:

_default_handler(USART1_handler) // 37
     2b4:	f001 f95c 	bl	1570 <reset_mcu>
_default_handler(USART2_handler) // 38
     2b8:	f001 f95a 	bl	1570 <reset_mcu>

000002bc <USART3_handler>:
_default_handler(USART3_handler) // 39
     2bc:	f001 f958 	bl	1570 <reset_mcu>

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

static inline void led_on(){
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

static inline void led_off(){
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

static inline void set_timer(unsigned time){
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


static inline unsigned get_timer(){
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


static inline uint8_t peek8(uint8_t *adr){
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

static inline uint16_t peek16(uint16_t *adr){
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

static inline uint32_t peek32(uint32_t *adr){
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

static inline void poke8(uint8_t *adr, uint8_t value){
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

static inline void poke16(uint16_t *adr, uint16_t value){
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

static inline void poke32(uint32_t *adr, uint32_t value){
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
     640:	f000 fc7a 	bl	f38 <conin>
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
     654:	f000 fc60 	bl	f18 <conout>
		break;
     658:	e056      	b.n	708 <SVC_handler+0x160>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     65a:	68bb      	ldr	r3, [r7, #8]
     65c:	681b      	ldr	r3, [r3, #0]
     65e:	6878      	ldr	r0, [r7, #4]
     660:	4619      	mov	r1, r3
     662:	f000 fce1 	bl	1028 <read_line>
     666:	4602      	mov	r2, r0
     668:	68bb      	ldr	r3, [r7, #8]
     66a:	601a      	str	r2, [r3, #0]
		break;
     66c:	e04c      	b.n	708 <SVC_handler+0x160>
	case SVC_PRINT:
		print((const char*)arg1);
     66e:	68b8      	ldr	r0, [r7, #8]
     670:	f000 fc84 	bl	f7c <print>
		break;
     674:	e048      	b.n	708 <SVC_handler+0x160>
	case SVC_PRINT_INT:
		print_int((int32_t)arg1,10);
     676:	68bb      	ldr	r3, [r7, #8]
     678:	4618      	mov	r0, r3
     67a:	210a      	movs	r1, #10
     67c:	f000 fd7e 	bl	117c <print_int>
		break;
     680:	e042      	b.n	708 <SVC_handler+0x160>
	case SVC_PRINT_HEX:
		print_hex((uint32_t)arg1);
     682:	68bb      	ldr	r3, [r7, #8]
     684:	4618      	mov	r0, r3
     686:	f000 fde7 	bl	1258 <print_hex>
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
     702:	f000 ff35 	bl	1570 <reset_mcu>
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
	RCC_CR->fld.hseon=1;
     73c:	4b1d      	ldr	r3, [pc, #116]	; (7b4 <set_sysclock+0x7c>)
     73e:	681a      	ldr	r2, [r3, #0]
     740:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
     744:	601a      	str	r2, [r3, #0]
	 // attend que l'oscillateur soit prêt
   while (!RCC_CR->fld.hserdy);
     746:	bf00      	nop
     748:	4b1a      	ldr	r3, [pc, #104]	; (7b4 <set_sysclock+0x7c>)
     74a:	681b      	ldr	r3, [r3, #0]
     74c:	0c5b      	lsrs	r3, r3, #17
     74e:	f003 0301 	and.w	r3, r3, #1
     752:	b2db      	uxtb	r3, r3
     754:	2b00      	cmp	r3, #0
     756:	d0f7      	beq.n	748 <set_sysclock+0x10>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR->cfgr|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
     758:	4a17      	ldr	r2, [pc, #92]	; (7b8 <set_sysclock+0x80>)
     75a:	4b17      	ldr	r3, [pc, #92]	; (7b8 <set_sysclock+0x80>)
     75c:	681b      	ldr	r3, [r3, #0]
     75e:	f443 13e8 	orr.w	r3, r3, #1900544	; 0x1d0000
     762:	6013      	str	r3, [r2, #0]
    // active le PLL
    RCC_CR->fld.pllon=1;
     764:	4b13      	ldr	r3, [pc, #76]	; (7b4 <set_sysclock+0x7c>)
     766:	681a      	ldr	r2, [r3, #0]
     768:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
     76c:	601a      	str	r2, [r3, #0]
    // Attend que le PLL soit prêt
    while (!RCC_CR->fld.pllrdy);
     76e:	bf00      	nop
     770:	4b10      	ldr	r3, [pc, #64]	; (7b4 <set_sysclock+0x7c>)
     772:	681b      	ldr	r3, [r3, #0]
     774:	0e5b      	lsrs	r3, r3, #25
     776:	f003 0301 	and.w	r3, r3, #1
     77a:	b2db      	uxtb	r3, r3
     77c:	2b00      	cmp	r3, #0
     77e:	d0f7      	beq.n	770 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR->fld.latency=WAIT_2_CY;
     780:	4b0e      	ldr	r3, [pc, #56]	; (7bc <set_sysclock+0x84>)
     782:	681a      	ldr	r2, [r3, #0]
     784:	f022 0207 	bic.w	r2, r2, #7
     788:	f042 0202 	orr.w	r2, r2, #2
     78c:	601a      	str	r2, [r3, #0]
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR->fld.sw=PLL_CLK;
     78e:	4b0a      	ldr	r3, [pc, #40]	; (7b8 <set_sysclock+0x80>)
     790:	681a      	ldr	r2, [r3, #0]
     792:	f022 0203 	bic.w	r2, r2, #3
     796:	f042 0202 	orr.w	r2, r2, #2
     79a:	601a      	str	r2, [r3, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR->fld.ppre1=PPRECLK_DIV2;
     79c:	4b06      	ldr	r3, [pc, #24]	; (7b8 <set_sysclock+0x80>)
     79e:	681a      	ldr	r2, [r3, #0]
     7a0:	f422 62e0 	bic.w	r2, r2, #1792	; 0x700
     7a4:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     7a8:	601a      	str	r2, [r3, #0]
}
     7aa:	46bd      	mov	sp, r7
     7ac:	f85d 7b04 	ldr.w	r7, [sp], #4
     7b0:	4770      	bx	lr
     7b2:	bf00      	nop
     7b4:	40021000 	.word	0x40021000
     7b8:	40021004 	.word	0x40021004
     7bc:	40022000 	.word	0x40022000

000007c0 <config_systicks>:

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
     7c0:	b480      	push	{r7}
     7c2:	af00      	add	r7, sp, #0
	SYST_RVR=MSEC_DLY-1;
     7c4:	4b05      	ldr	r3, [pc, #20]	; (7dc <config_systicks+0x1c>)
     7c6:	f242 3227 	movw	r2, #8999	; 0x2327
     7ca:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
     7cc:	4b04      	ldr	r3, [pc, #16]	; (7e0 <config_systicks+0x20>)
     7ce:	2203      	movs	r2, #3
     7d0:	601a      	str	r2, [r3, #0]
}
     7d2:	46bd      	mov	sp, r7
     7d4:	f85d 7b04 	ldr.w	r7, [sp], #4
     7d8:	4770      	bx	lr
     7da:	bf00      	nop
     7dc:	e000e014 	.word	0xe000e014
     7e0:	e000e010 	.word	0xe000e010

000007e4 <port_c_setup>:

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
     7e4:	b480      	push	{r7}
     7e6:	af00      	add	r7, sp, #0
	APB2ENR->fld.iopcen=1;
     7e8:	4b05      	ldr	r3, [pc, #20]	; (800 <port_c_setup+0x1c>)
     7ea:	681a      	ldr	r2, [r3, #0]
     7ec:	f042 0210 	orr.w	r2, r2, #16
     7f0:	601a      	str	r2, [r3, #0]
	GPIOC_CRH->cr=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
     7f2:	4b04      	ldr	r3, [pc, #16]	; (804 <port_c_setup+0x20>)
     7f4:	4a04      	ldr	r2, [pc, #16]	; (808 <port_c_setup+0x24>)
     7f6:	601a      	str	r2, [r3, #0]
}
     7f8:	46bd      	mov	sp, r7
     7fa:	f85d 7b04 	ldr.w	r7, [sp], #4
     7fe:	4770      	bx	lr
     800:	40021018 	.word	0x40021018
     804:	40011004 	.word	0x40011004
     808:	44644444 	.word	0x44644444

0000080c <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     80c:	b480      	push	{r7}
     80e:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     810:	2300      	movs	r3, #0
     812:	2200      	movs	r2, #0
     814:	4618      	mov	r0, r3
     816:	4611      	mov	r1, r2
     818:	df00      	svc	0
}
     81a:	46bd      	mov	sp, r7
     81c:	f85d 7b04 	ldr.w	r7, [sp], #4
     820:	4770      	bx	lr
     822:	bf00      	nop

00000824 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     824:	b480      	push	{r7}
     826:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     828:	2300      	movs	r3, #0
     82a:	2200      	movs	r2, #0
     82c:	4618      	mov	r0, r3
     82e:	4611      	mov	r1, r2
     830:	df01      	svc	1
}
     832:	46bd      	mov	sp, r7
     834:	f85d 7b04 	ldr.w	r7, [sp], #4
     838:	4770      	bx	lr
     83a:	bf00      	nop

0000083c <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     83c:	b480      	push	{r7}
     83e:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     840:	2300      	movs	r3, #0
     842:	2200      	movs	r2, #0
     844:	4618      	mov	r0, r3
     846:	4611      	mov	r1, r2
     848:	df02      	svc	2
}
     84a:	46bd      	mov	sp, r7
     84c:	f85d 7b04 	ldr.w	r7, [sp], #4
     850:	4770      	bx	lr
     852:	bf00      	nop

00000854 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     854:	b580      	push	{r7, lr}
     856:	b082      	sub	sp, #8
     858:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     85a:	f000 fa57 	bl	d0c <word>
	n=atoi((const char*)pad);
     85e:	4806      	ldr	r0, [pc, #24]	; (878 <cmd_set_timer+0x24>)
     860:	f7ff fdac 	bl	3bc <atoi>
     864:	4603      	mov	r3, r0
     866:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     868:	1d3b      	adds	r3, r7, #4
     86a:	2200      	movs	r2, #0
     86c:	4618      	mov	r0, r3
     86e:	4611      	mov	r1, r2
     870:	df03      	svc	3
}
     872:	3708      	adds	r7, #8
     874:	46bd      	mov	sp, r7
     876:	bd80      	pop	{r7, pc}
     878:	2000005c 	.word	0x2000005c

0000087c <cmd_get_timer>:

static void cmd_get_timer(){
     87c:	b480      	push	{r7}
     87e:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     880:	4b04      	ldr	r3, [pc, #16]	; (894 <cmd_get_timer+0x18>)
     882:	2200      	movs	r2, #0
     884:	4618      	mov	r0, r3
     886:	4611      	mov	r1, r2
     888:	df04      	svc	4
}
     88a:	46bd      	mov	sp, r7
     88c:	f85d 7b04 	ldr.w	r7, [sp], #4
     890:	4770      	bx	lr
     892:	bf00      	nop
     894:	2000005c 	.word	0x2000005c

00000898 <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     898:	b480      	push	{r7}
     89a:	b083      	sub	sp, #12
     89c:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     89e:	1d3b      	adds	r3, r7, #4
     8a0:	2200      	movs	r2, #0
     8a2:	4618      	mov	r0, r3
     8a4:	4611      	mov	r1, r2
     8a6:	df04      	svc	4
     8a8:	687b      	ldr	r3, [r7, #4]
     8aa:	2b00      	cmp	r3, #0
     8ac:	d1f7      	bne.n	89e <cmd_pause+0x6>
}
     8ae:	370c      	adds	r7, #12
     8b0:	46bd      	mov	sp, r7
     8b2:	f85d 7b04 	ldr.w	r7, [sp], #4
     8b6:	4770      	bx	lr

000008b8 <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     8b8:	b480      	push	{r7}
     8ba:	b083      	sub	sp, #12
     8bc:	af00      	add	r7, sp, #0
	volatile char n=0;
     8be:	2300      	movs	r3, #0
     8c0:	71fb      	strb	r3, [r7, #7]
	while (!n){
     8c2:	e004      	b.n	8ce <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     8c4:	1dfb      	adds	r3, r7, #7
     8c6:	2200      	movs	r2, #0
     8c8:	4618      	mov	r0, r3
     8ca:	4611      	mov	r1, r2
     8cc:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     8ce:	79fb      	ldrb	r3, [r7, #7]
     8d0:	b2db      	uxtb	r3, r3
     8d2:	2b00      	cmp	r3, #0
     8d4:	d0f6      	beq.n	8c4 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     8d6:	79fb      	ldrb	r3, [r7, #7]
     8d8:	b2da      	uxtb	r2, r3
     8da:	4b05      	ldr	r3, [pc, #20]	; (8f0 <cmd_getc+0x38>)
     8dc:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     8de:	4b04      	ldr	r3, [pc, #16]	; (8f0 <cmd_getc+0x38>)
     8e0:	2200      	movs	r2, #0
     8e2:	705a      	strb	r2, [r3, #1]
}
     8e4:	370c      	adds	r7, #12
     8e6:	46bd      	mov	sp, r7
     8e8:	f85d 7b04 	ldr.w	r7, [sp], #4
     8ec:	4770      	bx	lr
     8ee:	bf00      	nop
     8f0:	2000005c 	.word	0x2000005c

000008f4 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     8f4:	b580      	push	{r7, lr}
     8f6:	b082      	sub	sp, #8
     8f8:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     8fa:	f000 fa07 	bl	d0c <word>
	cmd_id=search_command((const char*)pad);
     8fe:	480a      	ldr	r0, [pc, #40]	; (928 <cmd_putc+0x34>)
     900:	f000 f8ee 	bl	ae0 <search_command>
     904:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     906:	687b      	ldr	r3, [r7, #4]
     908:	2b00      	cmp	r3, #0
     90a:	db05      	blt.n	918 <cmd_putc+0x24>
     90c:	4a07      	ldr	r2, [pc, #28]	; (92c <cmd_putc+0x38>)
     90e:	687b      	ldr	r3, [r7, #4]
     910:	00db      	lsls	r3, r3, #3
     912:	4413      	add	r3, r2
     914:	685b      	ldr	r3, [r3, #4]
     916:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     918:	4b03      	ldr	r3, [pc, #12]	; (928 <cmd_putc+0x34>)
     91a:	2200      	movs	r2, #0
     91c:	4618      	mov	r0, r3
     91e:	4611      	mov	r1, r2
     920:	df06      	svc	6
}
     922:	3708      	adds	r7, #8
     924:	46bd      	mov	sp, r7
     926:	bd80      	pop	{r7, pc}
     928:	2000005c 	.word	0x2000005c
     92c:	000018d8 	.word	0x000018d8

00000930 <cmd_readln>:

static void cmd_readln(){
     930:	b580      	push	{r7, lr}
     932:	b082      	sub	sp, #8
     934:	af00      	add	r7, sp, #0
	unsigned llen=80;
     936:	2350      	movs	r3, #80	; 0x50
     938:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     93a:	1d3b      	adds	r3, r7, #4
     93c:	4a04      	ldr	r2, [pc, #16]	; (950 <cmd_readln+0x20>)
     93e:	4618      	mov	r0, r3
     940:	4611      	mov	r1, r2
     942:	df07      	svc	7
	print((const char*)pad);
     944:	4802      	ldr	r0, [pc, #8]	; (950 <cmd_readln+0x20>)
     946:	f000 fb19 	bl	f7c <print>
}
     94a:	3708      	adds	r7, #8
     94c:	46bd      	mov	sp, r7
     94e:	bd80      	pop	{r7, pc}
     950:	2000005c 	.word	0x2000005c

00000954 <cmd_print>:

static void cmd_print(){
     954:	b580      	push	{r7, lr}
     956:	af00      	add	r7, sp, #0
	word();
     958:	f000 f9d8 	bl	d0c <word>
	_svc_call(SVC_PRINT,pad,NUL);
     95c:	4b02      	ldr	r3, [pc, #8]	; (968 <cmd_print+0x14>)
     95e:	2200      	movs	r2, #0
     960:	4618      	mov	r0, r3
     962:	4611      	mov	r1, r2
     964:	df08      	svc	8
}
     966:	bd80      	pop	{r7, pc}
     968:	2000005c 	.word	0x2000005c

0000096c <cmd_run>:


static void cmd_run(){
     96c:	b580      	push	{r7, lr}
     96e:	af00      	add	r7, sp, #0
	((fn)proga)();
     970:	4b01      	ldr	r3, [pc, #4]	; (978 <cmd_run+0xc>)
     972:	681b      	ldr	r3, [r3, #0]
     974:	4798      	blx	r3
	
}
     976:	bd80      	pop	{r7, pc}
     978:	200000d8 	.word	0x200000d8

0000097c <cmd_peek8>:

static void cmd_peek8(){
     97c:	b580      	push	{r7, lr}
     97e:	b082      	sub	sp, #8
     980:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     982:	f000 f9c3 	bl	d0c <word>
	u=atoi((const char*)pad);
     986:	4808      	ldr	r0, [pc, #32]	; (9a8 <cmd_peek8+0x2c>)
     988:	f7ff fd18 	bl	3bc <atoi>
     98c:	4603      	mov	r3, r0
     98e:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     990:	1d3b      	adds	r3, r7, #4
     992:	2200      	movs	r2, #0
     994:	4618      	mov	r0, r3
     996:	4611      	mov	r1, r2
     998:	df0b      	svc	11
	pad[0]=(unsigned char)u;
     99a:	687b      	ldr	r3, [r7, #4]
     99c:	b2da      	uxtb	r2, r3
     99e:	4b02      	ldr	r3, [pc, #8]	; (9a8 <cmd_peek8+0x2c>)
     9a0:	701a      	strb	r2, [r3, #0]
}
     9a2:	3708      	adds	r7, #8
     9a4:	46bd      	mov	sp, r7
     9a6:	bd80      	pop	{r7, pc}
     9a8:	2000005c 	.word	0x2000005c

000009ac <cmd_peek16>:

static void cmd_peek16(){
     9ac:	b580      	push	{r7, lr}
     9ae:	b082      	sub	sp, #8
     9b0:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9b2:	f000 f9ab 	bl	d0c <word>
	u=atoi((const char*)pad);
     9b6:	480b      	ldr	r0, [pc, #44]	; (9e4 <cmd_peek16+0x38>)
     9b8:	f7ff fd00 	bl	3bc <atoi>
     9bc:	4603      	mov	r3, r0
     9be:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     9c0:	1d3b      	adds	r3, r7, #4
     9c2:	2200      	movs	r2, #0
     9c4:	4618      	mov	r0, r3
     9c6:	4611      	mov	r1, r2
     9c8:	df0c      	svc	12
	pad[0]=(unsigned char)(u&0xff);
     9ca:	687b      	ldr	r3, [r7, #4]
     9cc:	b2da      	uxtb	r2, r3
     9ce:	4b05      	ldr	r3, [pc, #20]	; (9e4 <cmd_peek16+0x38>)
     9d0:	701a      	strb	r2, [r3, #0]
	pad[1]=(unsigned char)((u>>8)&0xff);
     9d2:	687b      	ldr	r3, [r7, #4]
     9d4:	0a1b      	lsrs	r3, r3, #8
     9d6:	b2da      	uxtb	r2, r3
     9d8:	4b02      	ldr	r3, [pc, #8]	; (9e4 <cmd_peek16+0x38>)
     9da:	705a      	strb	r2, [r3, #1]
}
     9dc:	3708      	adds	r7, #8
     9de:	46bd      	mov	sp, r7
     9e0:	bd80      	pop	{r7, pc}
     9e2:	bf00      	nop
     9e4:	2000005c 	.word	0x2000005c

000009e8 <cmd_peek32>:

static void cmd_peek32(){
     9e8:	b580      	push	{r7, lr}
     9ea:	b082      	sub	sp, #8
     9ec:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     9ee:	f000 f98d 	bl	d0c <word>
	u=atoi((const char*)pad);
     9f2:	4810      	ldr	r0, [pc, #64]	; (a34 <cmd_peek32+0x4c>)
     9f4:	f7ff fce2 	bl	3bc <atoi>
     9f8:	4603      	mov	r3, r0
     9fa:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_PEEK32,&u,NUL);
     9fc:	463b      	mov	r3, r7
     9fe:	2200      	movs	r2, #0
     a00:	4618      	mov	r0, r3
     a02:	4611      	mov	r1, r2
     a04:	df0d      	svc	13
	for (i=0;i<4;i++){
     a06:	2300      	movs	r3, #0
     a08:	607b      	str	r3, [r7, #4]
     a0a:	e00c      	b.n	a26 <cmd_peek32+0x3e>
		pad[i]=(unsigned char)(u&0xff);
     a0c:	683b      	ldr	r3, [r7, #0]
     a0e:	b2d9      	uxtb	r1, r3
     a10:	4a08      	ldr	r2, [pc, #32]	; (a34 <cmd_peek32+0x4c>)
     a12:	687b      	ldr	r3, [r7, #4]
     a14:	4413      	add	r3, r2
     a16:	460a      	mov	r2, r1
     a18:	701a      	strb	r2, [r3, #0]
		u>>=8;
     a1a:	683b      	ldr	r3, [r7, #0]
     a1c:	0a1b      	lsrs	r3, r3, #8
     a1e:	603b      	str	r3, [r7, #0]
	uint32_t u;
	int i;
	word();
	u=atoi((const char*)pad);
	_svc_call(SVC_PEEK32,&u,NUL);
	for (i=0;i<4;i++){
     a20:	687b      	ldr	r3, [r7, #4]
     a22:	3301      	adds	r3, #1
     a24:	607b      	str	r3, [r7, #4]
     a26:	687b      	ldr	r3, [r7, #4]
     a28:	2b03      	cmp	r3, #3
     a2a:	ddef      	ble.n	a0c <cmd_peek32+0x24>
		pad[i]=(unsigned char)(u&0xff);
		u>>=8;
	}
}
     a2c:	3708      	adds	r7, #8
     a2e:	46bd      	mov	sp, r7
     a30:	bd80      	pop	{r7, pc}
     a32:	bf00      	nop
     a34:	2000005c 	.word	0x2000005c

00000a38 <cmd_poke8>:

static void cmd_poke8(){
     a38:	b580      	push	{r7, lr}
     a3a:	b082      	sub	sp, #8
     a3c:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     a3e:	f000 f965 	bl	d0c <word>
	adr=atoi((const char*)pad);
     a42:	480a      	ldr	r0, [pc, #40]	; (a6c <cmd_poke8+0x34>)
     a44:	f7ff fcba 	bl	3bc <atoi>
     a48:	4603      	mov	r3, r0
     a4a:	607b      	str	r3, [r7, #4]
	word();
     a4c:	f000 f95e 	bl	d0c <word>
	u8=atoi((const char*)pad);
     a50:	4806      	ldr	r0, [pc, #24]	; (a6c <cmd_poke8+0x34>)
     a52:	f7ff fcb3 	bl	3bc <atoi>
     a56:	4603      	mov	r3, r0
     a58:	b2db      	uxtb	r3, r3
     a5a:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     a5c:	1d3b      	adds	r3, r7, #4
     a5e:	1cfa      	adds	r2, r7, #3
     a60:	4618      	mov	r0, r3
     a62:	4611      	mov	r1, r2
     a64:	df0e      	svc	14
}
     a66:	3708      	adds	r7, #8
     a68:	46bd      	mov	sp, r7
     a6a:	bd80      	pop	{r7, pc}
     a6c:	2000005c 	.word	0x2000005c

00000a70 <cmd_poke16>:

static void cmd_poke16(){
     a70:	b580      	push	{r7, lr}
     a72:	b082      	sub	sp, #8
     a74:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     a76:	f000 f949 	bl	d0c <word>
	adr=atoi((const char*)pad);
     a7a:	480a      	ldr	r0, [pc, #40]	; (aa4 <cmd_poke16+0x34>)
     a7c:	f7ff fc9e 	bl	3bc <atoi>
     a80:	4603      	mov	r3, r0
     a82:	607b      	str	r3, [r7, #4]
	word();
     a84:	f000 f942 	bl	d0c <word>
	u16=atoi((const char*)pad);
     a88:	4806      	ldr	r0, [pc, #24]	; (aa4 <cmd_poke16+0x34>)
     a8a:	f7ff fc97 	bl	3bc <atoi>
     a8e:	4603      	mov	r3, r0
     a90:	b29b      	uxth	r3, r3
     a92:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     a94:	1d3b      	adds	r3, r7, #4
     a96:	1cba      	adds	r2, r7, #2
     a98:	4618      	mov	r0, r3
     a9a:	4611      	mov	r1, r2
     a9c:	df0f      	svc	15
}
     a9e:	3708      	adds	r7, #8
     aa0:	46bd      	mov	sp, r7
     aa2:	bd80      	pop	{r7, pc}
     aa4:	2000005c 	.word	0x2000005c

00000aa8 <cmd_poke32>:

static void cmd_poke32(){
     aa8:	b580      	push	{r7, lr}
     aaa:	b082      	sub	sp, #8
     aac:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     aae:	f000 f92d 	bl	d0c <word>
	adr=atoi((const char*)pad);
     ab2:	480a      	ldr	r0, [pc, #40]	; (adc <cmd_poke32+0x34>)
     ab4:	f7ff fc82 	bl	3bc <atoi>
     ab8:	4603      	mov	r3, r0
     aba:	607b      	str	r3, [r7, #4]
	word();
     abc:	f000 f926 	bl	d0c <word>
	u32=atoi((const char*)pad);
     ac0:	4806      	ldr	r0, [pc, #24]	; (adc <cmd_poke32+0x34>)
     ac2:	f7ff fc7b 	bl	3bc <atoi>
     ac6:	4603      	mov	r3, r0
     ac8:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     aca:	1d3b      	adds	r3, r7, #4
     acc:	463a      	mov	r2, r7
     ace:	4618      	mov	r0, r3
     ad0:	4611      	mov	r1, r2
     ad2:	df10      	svc	16
}
     ad4:	3708      	adds	r7, #8
     ad6:	46bd      	mov	sp, r7
     ad8:	bd80      	pop	{r7, pc}
     ada:	bf00      	nop
     adc:	2000005c 	.word	0x2000005c

00000ae0 <search_command>:
	{"poke32",cmd_poke32}, 
	{NUL,NUL}
};


int search_command(const char * name){
     ae0:	b580      	push	{r7, lr}
     ae2:	b084      	sub	sp, #16
     ae4:	af00      	add	r7, sp, #0
     ae6:	6078      	str	r0, [r7, #4]
	int i=0;
     ae8:	2300      	movs	r3, #0
     aea:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     aec:	e00e      	b.n	b0c <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     aee:	4a12      	ldr	r2, [pc, #72]	; (b38 <search_command+0x58>)
     af0:	68fb      	ldr	r3, [r7, #12]
     af2:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     af6:	4618      	mov	r0, r3
     af8:	6879      	ldr	r1, [r7, #4]
     afa:	f7ff fbe1 	bl	2c0 <strcmp>
     afe:	4603      	mov	r3, r0
     b00:	2b00      	cmp	r3, #0
     b02:	d100      	bne.n	b06 <search_command+0x26>
			break;
     b04:	e009      	b.n	b1a <search_command+0x3a>
		}
		i++;
     b06:	68fb      	ldr	r3, [r7, #12]
     b08:	3301      	adds	r3, #1
     b0a:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     b0c:	4a0a      	ldr	r2, [pc, #40]	; (b38 <search_command+0x58>)
     b0e:	68fb      	ldr	r3, [r7, #12]
     b10:	00db      	lsls	r3, r3, #3
     b12:	4413      	add	r3, r2
     b14:	685b      	ldr	r3, [r3, #4]
     b16:	2b00      	cmp	r3, #0
     b18:	d1e9      	bne.n	aee <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     b1a:	4a07      	ldr	r2, [pc, #28]	; (b38 <search_command+0x58>)
     b1c:	68fb      	ldr	r3, [r7, #12]
     b1e:	00db      	lsls	r3, r3, #3
     b20:	4413      	add	r3, r2
     b22:	685b      	ldr	r3, [r3, #4]
     b24:	2b00      	cmp	r3, #0
     b26:	d102      	bne.n	b2e <search_command+0x4e>
     b28:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     b2c:	60fb      	str	r3, [r7, #12]
	return i;
     b2e:	68fb      	ldr	r3, [r7, #12]
}
     b30:	4618      	mov	r0, r3
     b32:	3710      	adds	r7, #16
     b34:	46bd      	mov	sp, r7
     b36:	bd80      	pop	{r7, pc}
     b38:	000018d8 	.word	0x000018d8

00000b3c <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     b3c:	b480      	push	{r7}
     b3e:	b085      	sub	sp, #20
     b40:	af00      	add	r7, sp, #0
     b42:	60f8      	str	r0, [r7, #12]
     b44:	60b9      	str	r1, [r7, #8]
     b46:	4613      	mov	r3, r2
     b48:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     b4a:	e002      	b.n	b52 <skip+0x16>
     b4c:	68bb      	ldr	r3, [r7, #8]
     b4e:	3301      	adds	r3, #1
     b50:	60bb      	str	r3, [r7, #8]
     b52:	68bb      	ldr	r3, [r7, #8]
     b54:	68fa      	ldr	r2, [r7, #12]
     b56:	4413      	add	r3, r2
     b58:	781b      	ldrb	r3, [r3, #0]
     b5a:	2b00      	cmp	r3, #0
     b5c:	d006      	beq.n	b6c <skip+0x30>
     b5e:	68bb      	ldr	r3, [r7, #8]
     b60:	68fa      	ldr	r2, [r7, #12]
     b62:	4413      	add	r3, r2
     b64:	781b      	ldrb	r3, [r3, #0]
     b66:	79fa      	ldrb	r2, [r7, #7]
     b68:	429a      	cmp	r2, r3
     b6a:	d0ef      	beq.n	b4c <skip+0x10>
	return start;
     b6c:	68bb      	ldr	r3, [r7, #8]
}
     b6e:	4618      	mov	r0, r3
     b70:	3714      	adds	r7, #20
     b72:	46bd      	mov	sp, r7
     b74:	f85d 7b04 	ldr.w	r7, [sp], #4
     b78:	4770      	bx	lr
     b7a:	bf00      	nop

00000b7c <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     b7c:	b480      	push	{r7}
     b7e:	b085      	sub	sp, #20
     b80:	af00      	add	r7, sp, #0
     b82:	60f8      	str	r0, [r7, #12]
     b84:	60b9      	str	r1, [r7, #8]
     b86:	4613      	mov	r3, r2
     b88:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     b8a:	e002      	b.n	b92 <scan+0x16>
     b8c:	68bb      	ldr	r3, [r7, #8]
     b8e:	3301      	adds	r3, #1
     b90:	60bb      	str	r3, [r7, #8]
     b92:	68bb      	ldr	r3, [r7, #8]
     b94:	68fa      	ldr	r2, [r7, #12]
     b96:	4413      	add	r3, r2
     b98:	781b      	ldrb	r3, [r3, #0]
     b9a:	2b00      	cmp	r3, #0
     b9c:	d006      	beq.n	bac <scan+0x30>
     b9e:	68bb      	ldr	r3, [r7, #8]
     ba0:	68fa      	ldr	r2, [r7, #12]
     ba2:	4413      	add	r3, r2
     ba4:	781b      	ldrb	r3, [r3, #0]
     ba6:	79fa      	ldrb	r2, [r7, #7]
     ba8:	429a      	cmp	r2, r3
     baa:	d1ef      	bne.n	b8c <scan+0x10>
	return start;
     bac:	68bb      	ldr	r3, [r7, #8]
}
     bae:	4618      	mov	r0, r3
     bb0:	3714      	adds	r7, #20
     bb2:	46bd      	mov	sp, r7
     bb4:	f85d 7b04 	ldr.w	r7, [sp], #4
     bb8:	4770      	bx	lr
     bba:	bf00      	nop

00000bbc <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     bbc:	b480      	push	{r7}
     bbe:	b087      	sub	sp, #28
     bc0:	af00      	add	r7, sp, #0
     bc2:	6078      	str	r0, [r7, #4]
     bc4:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     bc6:	2300      	movs	r3, #0
     bc8:	617b      	str	r3, [r7, #20]
     bca:	683b      	ldr	r3, [r7, #0]
     bcc:	613b      	str	r3, [r7, #16]
     bce:	2300      	movs	r3, #0
     bd0:	60fb      	str	r3, [r7, #12]
     bd2:	2301      	movs	r3, #1
     bd4:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     bd6:	e040      	b.n	c5a <quote+0x9e>
		switch (buffer[end]){
     bd8:	693b      	ldr	r3, [r7, #16]
     bda:	687a      	ldr	r2, [r7, #4]
     bdc:	4413      	add	r3, r2
     bde:	781b      	ldrb	r3, [r3, #0]
     be0:	2b5c      	cmp	r3, #92	; 0x5c
     be2:	d012      	beq.n	c0a <quote+0x4e>
     be4:	2b6e      	cmp	r3, #110	; 0x6e
     be6:	d022      	beq.n	c2e <quote+0x72>
     be8:	2b22      	cmp	r3, #34	; 0x22
     bea:	d128      	bne.n	c3e <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     bec:	697b      	ldr	r3, [r7, #20]
     bee:	2b00      	cmp	r3, #0
     bf0:	d102      	bne.n	bf8 <quote+0x3c>
     bf2:	2300      	movs	r3, #0
     bf4:	60bb      	str	r3, [r7, #8]
			break;
     bf6:	e02d      	b.n	c54 <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     bf8:	68fb      	ldr	r3, [r7, #12]
     bfa:	1c5a      	adds	r2, r3, #1
     bfc:	60fa      	str	r2, [r7, #12]
     bfe:	4a21      	ldr	r2, [pc, #132]	; (c84 <quote+0xc8>)
     c00:	2122      	movs	r1, #34	; 0x22
     c02:	54d1      	strb	r1, [r2, r3]
     c04:	2300      	movs	r3, #0
     c06:	617b      	str	r3, [r7, #20]
			break;
     c08:	e024      	b.n	c54 <quote+0x98>
		case '\\':
			if (!escaped){
     c0a:	697b      	ldr	r3, [r7, #20]
     c0c:	2b00      	cmp	r3, #0
     c0e:	d102      	bne.n	c16 <quote+0x5a>
				escaped=1;
     c10:	2301      	movs	r3, #1
     c12:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     c14:	e01e      	b.n	c54 <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     c16:	2300      	movs	r3, #0
     c18:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     c1a:	68fb      	ldr	r3, [r7, #12]
     c1c:	1c5a      	adds	r2, r3, #1
     c1e:	60fa      	str	r2, [r7, #12]
     c20:	693a      	ldr	r2, [r7, #16]
     c22:	6879      	ldr	r1, [r7, #4]
     c24:	440a      	add	r2, r1
     c26:	7811      	ldrb	r1, [r2, #0]
     c28:	4a16      	ldr	r2, [pc, #88]	; (c84 <quote+0xc8>)
     c2a:	54d1      	strb	r1, [r2, r3]
			}
			break;
     c2c:	e012      	b.n	c54 <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     c2e:	697b      	ldr	r3, [r7, #20]
     c30:	2b00      	cmp	r3, #0
     c32:	d004      	beq.n	c3e <quote+0x82>
     c34:	693b      	ldr	r3, [r7, #16]
     c36:	687a      	ldr	r2, [r7, #4]
     c38:	4413      	add	r3, r2
     c3a:	220d      	movs	r2, #13
     c3c:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     c3e:	2300      	movs	r3, #0
     c40:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     c42:	68fb      	ldr	r3, [r7, #12]
     c44:	1c5a      	adds	r2, r3, #1
     c46:	60fa      	str	r2, [r7, #12]
     c48:	693a      	ldr	r2, [r7, #16]
     c4a:	6879      	ldr	r1, [r7, #4]
     c4c:	440a      	add	r2, r1
     c4e:	7811      	ldrb	r1, [r2, #0]
     c50:	4a0c      	ldr	r2, [pc, #48]	; (c84 <quote+0xc8>)
     c52:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     c54:	693b      	ldr	r3, [r7, #16]
     c56:	3301      	adds	r3, #1
     c58:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     c5a:	693b      	ldr	r3, [r7, #16]
     c5c:	687a      	ldr	r2, [r7, #4]
     c5e:	4413      	add	r3, r2
     c60:	781b      	ldrb	r3, [r3, #0]
     c62:	2b00      	cmp	r3, #0
     c64:	d002      	beq.n	c6c <quote+0xb0>
     c66:	68bb      	ldr	r3, [r7, #8]
     c68:	2b00      	cmp	r3, #0
     c6a:	d1b5      	bne.n	bd8 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     c6c:	4a05      	ldr	r2, [pc, #20]	; (c84 <quote+0xc8>)
     c6e:	68fb      	ldr	r3, [r7, #12]
     c70:	4413      	add	r3, r2
     c72:	2200      	movs	r2, #0
     c74:	701a      	strb	r2, [r3, #0]
	return end;
     c76:	693b      	ldr	r3, [r7, #16]
}
     c78:	4618      	mov	r0, r3
     c7a:	371c      	adds	r7, #28
     c7c:	46bd      	mov	sp, r7
     c7e:	f85d 7b04 	ldr.w	r7, [sp], #4
     c82:	4770      	bx	lr
     c84:	2000005c 	.word	0x2000005c

00000c88 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     c88:	b480      	push	{r7}
     c8a:	b087      	sub	sp, #28
     c8c:	af00      	add	r7, sp, #0
     c8e:	60f8      	str	r0, [r7, #12]
     c90:	60b9      	str	r1, [r7, #8]
     c92:	4613      	mov	r3, r2
     c94:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     c96:	68bb      	ldr	r3, [r7, #8]
     c98:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     c9a:	e002      	b.n	ca2 <next+0x1a>
     c9c:	697b      	ldr	r3, [r7, #20]
     c9e:	3301      	adds	r3, #1
     ca0:	617b      	str	r3, [r7, #20]
     ca2:	697b      	ldr	r3, [r7, #20]
     ca4:	68fa      	ldr	r2, [r7, #12]
     ca6:	4413      	add	r3, r2
     ca8:	781b      	ldrb	r3, [r3, #0]
     caa:	2b00      	cmp	r3, #0
     cac:	d006      	beq.n	cbc <next+0x34>
     cae:	697b      	ldr	r3, [r7, #20]
     cb0:	68fa      	ldr	r2, [r7, #12]
     cb2:	4413      	add	r3, r2
     cb4:	781b      	ldrb	r3, [r3, #0]
     cb6:	79fa      	ldrb	r2, [r7, #7]
     cb8:	429a      	cmp	r2, r3
     cba:	d1ef      	bne.n	c9c <next+0x14>
	return end-start;
     cbc:	697a      	ldr	r2, [r7, #20]
     cbe:	68bb      	ldr	r3, [r7, #8]
     cc0:	1ad3      	subs	r3, r2, r3
}
     cc2:	4618      	mov	r0, r3
     cc4:	371c      	adds	r7, #28
     cc6:	46bd      	mov	sp, r7
     cc8:	f85d 7b04 	ldr.w	r7, [sp], #4
     ccc:	4770      	bx	lr
     cce:	bf00      	nop

00000cd0 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     cd0:	b480      	push	{r7}
     cd2:	b085      	sub	sp, #20
     cd4:	af00      	add	r7, sp, #0
     cd6:	60f8      	str	r0, [r7, #12]
     cd8:	60b9      	str	r1, [r7, #8]
     cda:	607a      	str	r2, [r7, #4]
	while (len){
     cdc:	e00a      	b.n	cf4 <move+0x24>
		*dest++=*src++;
     cde:	68bb      	ldr	r3, [r7, #8]
     ce0:	1c5a      	adds	r2, r3, #1
     ce2:	60ba      	str	r2, [r7, #8]
     ce4:	68fa      	ldr	r2, [r7, #12]
     ce6:	1c51      	adds	r1, r2, #1
     ce8:	60f9      	str	r1, [r7, #12]
     cea:	7812      	ldrb	r2, [r2, #0]
     cec:	701a      	strb	r2, [r3, #0]
		len--;
     cee:	687b      	ldr	r3, [r7, #4]
     cf0:	3b01      	subs	r3, #1
     cf2:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     cf4:	687b      	ldr	r3, [r7, #4]
     cf6:	2b00      	cmp	r3, #0
     cf8:	d1f1      	bne.n	cde <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     cfa:	68bb      	ldr	r3, [r7, #8]
     cfc:	2200      	movs	r2, #0
     cfe:	701a      	strb	r2, [r3, #0]
}
     d00:	3714      	adds	r7, #20
     d02:	46bd      	mov	sp, r7
     d04:	f85d 7b04 	ldr.w	r7, [sp], #4
     d08:	4770      	bx	lr
     d0a:	bf00      	nop

00000d0c <word>:

// extrait le prochain mot du tib
static void word(){
     d0c:	b580      	push	{r7, lr}
     d0e:	b082      	sub	sp, #8
     d10:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     d12:	4b1d      	ldr	r3, [pc, #116]	; (d88 <word+0x7c>)
     d14:	681b      	ldr	r3, [r3, #0]
     d16:	481d      	ldr	r0, [pc, #116]	; (d8c <word+0x80>)
     d18:	4619      	mov	r1, r3
     d1a:	2220      	movs	r2, #32
     d1c:	f7ff ff0e 	bl	b3c <skip>
     d20:	4603      	mov	r3, r0
     d22:	461a      	mov	r2, r3
     d24:	4b18      	ldr	r3, [pc, #96]	; (d88 <word+0x7c>)
     d26:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     d28:	4b17      	ldr	r3, [pc, #92]	; (d88 <word+0x7c>)
     d2a:	681b      	ldr	r3, [r3, #0]
     d2c:	4a17      	ldr	r2, [pc, #92]	; (d8c <word+0x80>)
     d2e:	5cd3      	ldrb	r3, [r2, r3]
     d30:	2b22      	cmp	r3, #34	; 0x22
     d32:	d10f      	bne.n	d54 <word+0x48>
			in++;
     d34:	4b14      	ldr	r3, [pc, #80]	; (d88 <word+0x7c>)
     d36:	681b      	ldr	r3, [r3, #0]
     d38:	3301      	adds	r3, #1
     d3a:	4a13      	ldr	r2, [pc, #76]	; (d88 <word+0x7c>)
     d3c:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     d3e:	4b12      	ldr	r3, [pc, #72]	; (d88 <word+0x7c>)
     d40:	681b      	ldr	r3, [r3, #0]
     d42:	4812      	ldr	r0, [pc, #72]	; (d8c <word+0x80>)
     d44:	4619      	mov	r1, r3
     d46:	f7ff ff39 	bl	bbc <quote>
     d4a:	4603      	mov	r3, r0
     d4c:	461a      	mov	r2, r3
     d4e:	4b0e      	ldr	r3, [pc, #56]	; (d88 <word+0x7c>)
     d50:	601a      	str	r2, [r3, #0]
     d52:	e016      	b.n	d82 <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     d54:	4b0c      	ldr	r3, [pc, #48]	; (d88 <word+0x7c>)
     d56:	681b      	ldr	r3, [r3, #0]
     d58:	480c      	ldr	r0, [pc, #48]	; (d8c <word+0x80>)
     d5a:	4619      	mov	r1, r3
     d5c:	2220      	movs	r2, #32
     d5e:	f7ff ff93 	bl	c88 <next>
     d62:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     d64:	4b08      	ldr	r3, [pc, #32]	; (d88 <word+0x7c>)
     d66:	681b      	ldr	r3, [r3, #0]
     d68:	4a08      	ldr	r2, [pc, #32]	; (d8c <word+0x80>)
     d6a:	4413      	add	r3, r2
     d6c:	4618      	mov	r0, r3
     d6e:	4908      	ldr	r1, [pc, #32]	; (d90 <word+0x84>)
     d70:	687a      	ldr	r2, [r7, #4]
     d72:	f7ff ffad 	bl	cd0 <move>
			in+=len;
     d76:	4b04      	ldr	r3, [pc, #16]	; (d88 <word+0x7c>)
     d78:	681a      	ldr	r2, [r3, #0]
     d7a:	687b      	ldr	r3, [r7, #4]
     d7c:	4413      	add	r3, r2
     d7e:	4a02      	ldr	r2, [pc, #8]	; (d88 <word+0x7c>)
     d80:	6013      	str	r3, [r2, #0]
		}
}
     d82:	3708      	adds	r7, #8
     d84:	46bd      	mov	sp, r7
     d86:	bd80      	pop	{r7, pc}
     d88:	200000ac 	.word	0x200000ac
     d8c:	2000000c 	.word	0x2000000c
     d90:	2000005c 	.word	0x2000005c

00000d94 <parse_line>:

static void parse_line(unsigned llen){
     d94:	b580      	push	{r7, lr}
     d96:	b084      	sub	sp, #16
     d98:	af00      	add	r7, sp, #0
     d9a:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     d9c:	4b12      	ldr	r3, [pc, #72]	; (de8 <parse_line+0x54>)
     d9e:	2200      	movs	r2, #0
     da0:	601a      	str	r2, [r3, #0]
	while (in<llen){
     da2:	e016      	b.n	dd2 <parse_line+0x3e>
		word();
     da4:	f7ff ffb2 	bl	d0c <word>
		cmd_id=search_command((const char*) pad);
     da8:	4810      	ldr	r0, [pc, #64]	; (dec <parse_line+0x58>)
     daa:	f7ff fe99 	bl	ae0 <search_command>
     dae:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     db0:	68fb      	ldr	r3, [r7, #12]
     db2:	2b00      	cmp	r3, #0
     db4:	db06      	blt.n	dc4 <parse_line+0x30>
			commands[cmd_id].fn();
     db6:	4a0e      	ldr	r2, [pc, #56]	; (df0 <parse_line+0x5c>)
     db8:	68fb      	ldr	r3, [r7, #12]
     dba:	00db      	lsls	r3, r3, #3
     dbc:	4413      	add	r3, r2
     dbe:	685b      	ldr	r3, [r3, #4]
     dc0:	4798      	blx	r3
     dc2:	e006      	b.n	dd2 <parse_line+0x3e>
		}else{
			print((const char*)pad); conout('?');
     dc4:	4809      	ldr	r0, [pc, #36]	; (dec <parse_line+0x58>)
     dc6:	f000 f8d9 	bl	f7c <print>
     dca:	203f      	movs	r0, #63	; 0x3f
     dcc:	f000 f8a4 	bl	f18 <conout>
			break;
     dd0:	e004      	b.n	ddc <parse_line+0x48>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     dd2:	4b05      	ldr	r3, [pc, #20]	; (de8 <parse_line+0x54>)
     dd4:	681a      	ldr	r2, [r3, #0]
     dd6:	687b      	ldr	r3, [r7, #4]
     dd8:	429a      	cmp	r2, r3
     dda:	d3e3      	bcc.n	da4 <parse_line+0x10>
		}else{
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     ddc:	200d      	movs	r0, #13
     dde:	f000 f89b 	bl	f18 <conout>
}
     de2:	3710      	adds	r7, #16
     de4:	46bd      	mov	sp, r7
     de6:	bd80      	pop	{r7, pc}
     de8:	200000ac 	.word	0x200000ac
     dec:	2000005c 	.word	0x2000005c
     df0:	000018d8 	.word	0x000018d8

00000df4 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     df4:	b480      	push	{r7}
     df6:	b085      	sub	sp, #20
     df8:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     dfa:	4b0c      	ldr	r3, [pc, #48]	; (e2c <copy_blink_in_ram+0x38>)
     dfc:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     dfe:	4b0c      	ldr	r3, [pc, #48]	; (e30 <copy_blink_in_ram+0x3c>)
     e00:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     e02:	4b0c      	ldr	r3, [pc, #48]	; (e34 <copy_blink_in_ram+0x40>)
     e04:	60bb      	str	r3, [r7, #8]
	while (start<end){
     e06:	e007      	b.n	e18 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     e08:	68bb      	ldr	r3, [r7, #8]
     e0a:	1d1a      	adds	r2, r3, #4
     e0c:	60ba      	str	r2, [r7, #8]
     e0e:	68fa      	ldr	r2, [r7, #12]
     e10:	1d11      	adds	r1, r2, #4
     e12:	60f9      	str	r1, [r7, #12]
     e14:	6812      	ldr	r2, [r2, #0]
     e16:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     e18:	68fa      	ldr	r2, [r7, #12]
     e1a:	687b      	ldr	r3, [r7, #4]
     e1c:	429a      	cmp	r2, r3
     e1e:	d3f3      	bcc.n	e08 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     e20:	3714      	adds	r7, #20
     e22:	46bd      	mov	sp, r7
     e24:	f85d 7b04 	ldr.w	r7, [sp], #4
     e28:	4770      	bx	lr
     e2a:	bf00      	nop
     e2c:	00001a00 	.word	0x00001a00
     e30:	00001a80 	.word	0x00001a80
     e34:	200000e0 	.word	0x200000e0

00000e38 <main>:

extern void print_fault(const char *msg, sfrp_t adr);

void main(void){
     e38:	b580      	push	{r7, lr}
     e3a:	b082      	sub	sp, #8
     e3c:	af00      	add	r7, sp, #0
	set_sysclock();
     e3e:	f7ff fc7b 	bl	738 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     e42:	f06f 000a 	mvn.w	r0, #10
     e46:	210f      	movs	r1, #15
     e48:	f000 fb62 	bl	1510 <set_int_priority>
	config_systicks();
     e4c:	f7ff fcb8 	bl	7c0 <config_systicks>
	port_c_setup();
     e50:	f7ff fcc8 	bl	7e4 <port_c_setup>
	uart_open_channel(CON,115200,FLOW_HARD);
     e54:	4816      	ldr	r0, [pc, #88]	; (eb0 <main+0x78>)
     e56:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     e5a:	2201      	movs	r2, #1
     e5c:	f000 fc18 	bl	1690 <uart_open_channel>
	cls();
     e60:	f000 f8bc 	bl	fdc <cls>
	print(VERSION); 
     e64:	4b13      	ldr	r3, [pc, #76]	; (eb4 <main+0x7c>)
     e66:	681b      	ldr	r3, [r3, #0]
     e68:	4618      	mov	r0, r3
     e6a:	f000 f887 	bl	f7c <print>
	copy_blink_in_ram();
     e6e:	f7ff ffc1 	bl	df4 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,proga&0xfffffffe,NUL); conout(CR);
     e72:	4811      	ldr	r0, [pc, #68]	; (eb8 <main+0x80>)
     e74:	f000 f882 	bl	f7c <print>
     e78:	4b10      	ldr	r3, [pc, #64]	; (ebc <main+0x84>)
     e7a:	681b      	ldr	r3, [r3, #0]
     e7c:	f023 0301 	bic.w	r3, r3, #1
     e80:	2200      	movs	r2, #0
     e82:	4618      	mov	r0, r3
     e84:	4611      	mov	r1, r2
     e86:	df0a      	svc	10
     e88:	200d      	movs	r0, #13
     e8a:	f000 f845 	bl	f18 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     e8e:	2300      	movs	r3, #0
     e90:	2200      	movs	r2, #0
     e92:	4618      	mov	r0, r3
     e94:	4611      	mov	r1, r2
     e96:	df01      	svc	1
	flush_rx_queue();
     e98:	f000 fa40 	bl	131c <flush_rx_queue>
	unsigned llen;// char c;
	while (1){ // if ((c=conin())) conout(c);
		llen=read_line(tib,CMD_MAX_LEN);
     e9c:	4808      	ldr	r0, [pc, #32]	; (ec0 <main+0x88>)
     e9e:	2150      	movs	r1, #80	; 0x50
     ea0:	f000 f8c2 	bl	1028 <read_line>
     ea4:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     ea6:	6878      	ldr	r0, [r7, #4]
     ea8:	f7ff ff74 	bl	d94 <parse_line>
	}
     eac:	e7f6      	b.n	e9c <main+0x64>
     eae:	bf00      	nop
     eb0:	40004400 	.word	0x40004400
     eb4:	20000000 	.word	0x20000000
     eb8:	00001960 	.word	0x00001960
     ebc:	200000d8 	.word	0x200000d8
     ec0:	2000000c 	.word	0x2000000c

00000ec4 <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
     ec4:	4668      	mov	r0, sp
     ec6:	f020 0107 	bic.w	r1, r0, #7
     eca:	468d      	mov	sp, r1
     ecc:	b481      	push	{r0, r7}
     ece:	af00      	add	r7, sp, #0
	if (USART2_SR&(1<<USART_SR_RXNE)){
     ed0:	4b0e      	ldr	r3, [pc, #56]	; (f0c <USART2_handler+0x48>)
     ed2:	681b      	ldr	r3, [r3, #0]
     ed4:	f003 0320 	and.w	r3, r3, #32
     ed8:	2b00      	cmp	r3, #0
     eda:	d012      	beq.n	f02 <USART2_handler+0x3e>
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
     edc:	4b0c      	ldr	r3, [pc, #48]	; (f10 <USART2_handler+0x4c>)
     ede:	6a1b      	ldr	r3, [r3, #32]
     ee0:	1c5a      	adds	r2, r3, #1
     ee2:	490b      	ldr	r1, [pc, #44]	; (f10 <USART2_handler+0x4c>)
     ee4:	620a      	str	r2, [r1, #32]
     ee6:	4a0b      	ldr	r2, [pc, #44]	; (f14 <USART2_handler+0x50>)
     ee8:	6812      	ldr	r2, [r2, #0]
     eea:	b2d2      	uxtb	r2, r2
     eec:	f002 027f 	and.w	r2, r2, #127	; 0x7f
     ef0:	b2d1      	uxtb	r1, r2
     ef2:	4a07      	ldr	r2, [pc, #28]	; (f10 <USART2_handler+0x4c>)
     ef4:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
     ef6:	4b06      	ldr	r3, [pc, #24]	; (f10 <USART2_handler+0x4c>)
     ef8:	6a1b      	ldr	r3, [r3, #32]
     efa:	f003 031f 	and.w	r3, r3, #31
     efe:	4a04      	ldr	r2, [pc, #16]	; (f10 <USART2_handler+0x4c>)
     f00:	6213      	str	r3, [r2, #32]
	}
}
     f02:	46bd      	mov	sp, r7
     f04:	bc81      	pop	{r0, r7}
     f06:	4685      	mov	sp, r0
     f08:	4770      	bx	lr
     f0a:	bf00      	nop
     f0c:	40004400 	.word	0x40004400
     f10:	200000b0 	.word	0x200000b0
     f14:	40004404 	.word	0x40004404

00000f18 <conout>:


// envoie d'un caractère à la console
void conout(char c){
     f18:	b580      	push	{r7, lr}
     f1a:	b082      	sub	sp, #8
     f1c:	af00      	add	r7, sp, #0
     f1e:	4603      	mov	r3, r0
     f20:	71fb      	strb	r3, [r7, #7]
	uart_putc(CON,c);
     f22:	79fb      	ldrb	r3, [r7, #7]
     f24:	4803      	ldr	r0, [pc, #12]	; (f34 <conout+0x1c>)
     f26:	4619      	mov	r1, r3
     f28:	f000 fc74 	bl	1814 <uart_putc>
}
     f2c:	3708      	adds	r7, #8
     f2e:	46bd      	mov	sp, r7
     f30:	bd80      	pop	{r7, pc}
     f32:	bf00      	nop
     f34:	40004400 	.word	0x40004400

00000f38 <conin>:


// réception d'un caractère de la console
char conin(){
     f38:	b480      	push	{r7}
     f3a:	b083      	sub	sp, #12
     f3c:	af00      	add	r7, sp, #0
	char c=0;
     f3e:	2300      	movs	r3, #0
     f40:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
     f42:	4b0d      	ldr	r3, [pc, #52]	; (f78 <conin+0x40>)
     f44:	6a1a      	ldr	r2, [r3, #32]
     f46:	4b0c      	ldr	r3, [pc, #48]	; (f78 <conin+0x40>)
     f48:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     f4a:	429a      	cmp	r2, r3
     f4c:	d00d      	beq.n	f6a <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
     f4e:	4b0a      	ldr	r3, [pc, #40]	; (f78 <conin+0x40>)
     f50:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     f52:	1c5a      	adds	r2, r3, #1
     f54:	4908      	ldr	r1, [pc, #32]	; (f78 <conin+0x40>)
     f56:	624a      	str	r2, [r1, #36]	; 0x24
     f58:	4a07      	ldr	r2, [pc, #28]	; (f78 <conin+0x40>)
     f5a:	5cd3      	ldrb	r3, [r2, r3]
     f5c:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
     f5e:	4b06      	ldr	r3, [pc, #24]	; (f78 <conin+0x40>)
     f60:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     f62:	f003 031f 	and.w	r3, r3, #31
     f66:	4a04      	ldr	r2, [pc, #16]	; (f78 <conin+0x40>)
     f68:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
     f6a:	79fb      	ldrb	r3, [r7, #7]
}
     f6c:	4618      	mov	r0, r3
     f6e:	370c      	adds	r7, #12
     f70:	46bd      	mov	sp, r7
     f72:	f85d 7b04 	ldr.w	r7, [sp], #4
     f76:	4770      	bx	lr
     f78:	200000b0 	.word	0x200000b0

00000f7c <print>:

// imprime un chaîne sur la console
void print(const char *str){
     f7c:	b580      	push	{r7, lr}
     f7e:	b082      	sub	sp, #8
     f80:	af00      	add	r7, sp, #0
     f82:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
     f84:	e006      	b.n	f94 <print+0x18>
     f86:	687b      	ldr	r3, [r7, #4]
     f88:	1c5a      	adds	r2, r3, #1
     f8a:	607a      	str	r2, [r7, #4]
     f8c:	781b      	ldrb	r3, [r3, #0]
     f8e:	4618      	mov	r0, r3
     f90:	f7ff ffc2 	bl	f18 <conout>
     f94:	687b      	ldr	r3, [r7, #4]
     f96:	781b      	ldrb	r3, [r3, #0]
     f98:	2b00      	cmp	r3, #0
     f9a:	d1f4      	bne.n	f86 <print+0xa>
}
     f9c:	3708      	adds	r7, #8
     f9e:	46bd      	mov	sp, r7
     fa0:	bd80      	pop	{r7, pc}
     fa2:	bf00      	nop

00000fa4 <beep>:

void beep(){
     fa4:	b480      	push	{r7}
     fa6:	af00      	add	r7, sp, #0
}
     fa8:	46bd      	mov	sp, r7
     faa:	f85d 7b04 	ldr.w	r7, [sp], #4
     fae:	4770      	bx	lr

00000fb0 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
     fb0:	b580      	push	{r7, lr}
     fb2:	af00      	add	r7, sp, #0
	conout(BS);
     fb4:	2008      	movs	r0, #8
     fb6:	f7ff ffaf 	bl	f18 <conout>
	conout(SPACE);
     fba:	2020      	movs	r0, #32
     fbc:	f7ff ffac 	bl	f18 <conout>
	conout(BS);
     fc0:	2008      	movs	r0, #8
     fc2:	f7ff ffa9 	bl	f18 <conout>
}
     fc6:	bd80      	pop	{r7, pc}

00000fc8 <esc_seq>:

void esc_seq(){
     fc8:	b580      	push	{r7, lr}
     fca:	af00      	add	r7, sp, #0
	conout(ESC);
     fcc:	201b      	movs	r0, #27
     fce:	f7ff ffa3 	bl	f18 <conout>
	conout('[');
     fd2:	205b      	movs	r0, #91	; 0x5b
     fd4:	f7ff ffa0 	bl	f18 <conout>
}
     fd8:	bd80      	pop	{r7, pc}
     fda:	bf00      	nop

00000fdc <cls>:

// vide l'écran de la console
void cls(){
     fdc:	b580      	push	{r7, lr}
     fde:	af00      	add	r7, sp, #0
	esc_seq();
     fe0:	f7ff fff2 	bl	fc8 <esc_seq>
	conout('2');
     fe4:	2032      	movs	r0, #50	; 0x32
     fe6:	f7ff ff97 	bl	f18 <conout>
	conout('J');
     fea:	204a      	movs	r0, #74	; 0x4a
     fec:	f7ff ff94 	bl	f18 <conout>
}
     ff0:	bd80      	pop	{r7, pc}
     ff2:	bf00      	nop

00000ff4 <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
     ff4:	b580      	push	{r7, lr}
     ff6:	b082      	sub	sp, #8
     ff8:	af00      	add	r7, sp, #0
     ffa:	6078      	str	r0, [r7, #4]
	esc_seq();
     ffc:	f7ff ffe4 	bl	fc8 <esc_seq>
	conout('2');
    1000:	2032      	movs	r0, #50	; 0x32
    1002:	f7ff ff89 	bl	f18 <conout>
	conout('K');
    1006:	204b      	movs	r0, #75	; 0x4b
    1008:	f7ff ff86 	bl	f18 <conout>
	while (n){conout(BS);n--;}
    100c:	e005      	b.n	101a <clear_line+0x26>
    100e:	2008      	movs	r0, #8
    1010:	f7ff ff82 	bl	f18 <conout>
    1014:	687b      	ldr	r3, [r7, #4]
    1016:	3b01      	subs	r3, #1
    1018:	607b      	str	r3, [r7, #4]
    101a:	687b      	ldr	r3, [r7, #4]
    101c:	2b00      	cmp	r3, #0
    101e:	d1f6      	bne.n	100e <clear_line+0x1a>
}
    1020:	3708      	adds	r7, #8
    1022:	46bd      	mov	sp, r7
    1024:	bd80      	pop	{r7, pc}
    1026:	bf00      	nop

00001028 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    1028:	b580      	push	{r7, lr}
    102a:	b084      	sub	sp, #16
    102c:	af00      	add	r7, sp, #0
    102e:	6078      	str	r0, [r7, #4]
    1030:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    1032:	2300      	movs	r3, #0
    1034:	60fb      	str	r3, [r7, #12]
	char c=0;
    1036:	2300      	movs	r3, #0
    1038:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    103a:	683b      	ldr	r3, [r7, #0]
    103c:	3b01      	subs	r3, #1
    103e:	603b      	str	r3, [r7, #0]
	while (c!=13){
    1040:	e08e      	b.n	1160 <read_line+0x138>
			c=conin();
    1042:	f7ff ff79 	bl	f38 <conin>
    1046:	4603      	mov	r3, r0
    1048:	72fb      	strb	r3, [r7, #11]
			switch(c){
    104a:	7afb      	ldrb	r3, [r7, #11]
    104c:	2b18      	cmp	r3, #24
    104e:	d872      	bhi.n	1136 <read_line+0x10e>
    1050:	a201      	add	r2, pc, #4	; (adr r2, 1058 <read_line+0x30>)
    1052:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1056:	bf00      	nop
    1058:	00001161 	.word	0x00001161
    105c:	00001137 	.word	0x00001137
    1060:	00001137 	.word	0x00001137
    1064:	00001137 	.word	0x00001137
    1068:	00001137 	.word	0x00001137
    106c:	00001129 	.word	0x00001129
    1070:	00001137 	.word	0x00001137
    1074:	00001137 	.word	0x00001137
    1078:	00001117 	.word	0x00001117
    107c:	00001133 	.word	0x00001133
    1080:	000010bd 	.word	0x000010bd
    1084:	00001137 	.word	0x00001137
    1088:	00001137 	.word	0x00001137
    108c:	000010bd 	.word	0x000010bd
    1090:	00001137 	.word	0x00001137
    1094:	00001137 	.word	0x00001137
    1098:	00001137 	.word	0x00001137
    109c:	00001137 	.word	0x00001137
    10a0:	00001137 	.word	0x00001137
    10a4:	00001137 	.word	0x00001137
    10a8:	00001137 	.word	0x00001137
    10ac:	000010cb 	.word	0x000010cb
    10b0:	00001137 	.word	0x00001137
    10b4:	000010e1 	.word	0x000010e1
    10b8:	000010cb 	.word	0x000010cb
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    10bc:	230d      	movs	r3, #13
    10be:	72fb      	strb	r3, [r7, #11]
				conout(c);
    10c0:	7afb      	ldrb	r3, [r7, #11]
    10c2:	4618      	mov	r0, r3
    10c4:	f7ff ff28 	bl	f18 <conout>
				break;
    10c8:	e04a      	b.n	1160 <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
    10ca:	68f8      	ldr	r0, [r7, #12]
    10cc:	f7ff ff92 	bl	ff4 <clear_line>
				line_len=0;
    10d0:	2300      	movs	r3, #0
    10d2:	60fb      	str	r3, [r7, #12]
				break;
    10d4:	e044      	b.n	1160 <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    10d6:	f7ff ff6b 	bl	fb0 <delete_back>
					line_len--;
    10da:	68fb      	ldr	r3, [r7, #12]
    10dc:	3b01      	subs	r3, #1
    10de:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    10e0:	68fb      	ldr	r3, [r7, #12]
    10e2:	2b00      	cmp	r3, #0
    10e4:	d006      	beq.n	10f4 <read_line+0xcc>
    10e6:	68fb      	ldr	r3, [r7, #12]
    10e8:	3b01      	subs	r3, #1
    10ea:	687a      	ldr	r2, [r7, #4]
    10ec:	4413      	add	r3, r2
    10ee:	781b      	ldrb	r3, [r3, #0]
    10f0:	2b20      	cmp	r3, #32
    10f2:	d0f0      	beq.n	10d6 <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    10f4:	e004      	b.n	1100 <read_line+0xd8>
					delete_back();
    10f6:	f7ff ff5b 	bl	fb0 <delete_back>
					line_len--;
    10fa:	68fb      	ldr	r3, [r7, #12]
    10fc:	3b01      	subs	r3, #1
    10fe:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1100:	68fb      	ldr	r3, [r7, #12]
    1102:	2b00      	cmp	r3, #0
    1104:	d006      	beq.n	1114 <read_line+0xec>
    1106:	68fb      	ldr	r3, [r7, #12]
    1108:	3b01      	subs	r3, #1
    110a:	687a      	ldr	r2, [r7, #4]
    110c:	4413      	add	r3, r2
    110e:	781b      	ldrb	r3, [r3, #0]
    1110:	2b20      	cmp	r3, #32
    1112:	d1f0      	bne.n	10f6 <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    1114:	e024      	b.n	1160 <read_line+0x138>
				case BS:
				if (line_len){
    1116:	68fb      	ldr	r3, [r7, #12]
    1118:	2b00      	cmp	r3, #0
    111a:	d004      	beq.n	1126 <read_line+0xfe>
					delete_back();
    111c:	f7ff ff48 	bl	fb0 <delete_back>
					line_len--;
    1120:	68fb      	ldr	r3, [r7, #12]
    1122:	3b01      	subs	r3, #1
    1124:	60fb      	str	r3, [r7, #12]
				}
				break;
    1126:	e01b      	b.n	1160 <read_line+0x138>
				case CTRL_E:
				cls();
    1128:	f7ff ff58 	bl	fdc <cls>
				line_len=0;
    112c:	2300      	movs	r3, #0
    112e:	60fb      	str	r3, [r7, #12]
				break;
    1130:	e016      	b.n	1160 <read_line+0x138>
				case TAB:
				c=SPACE;
    1132:	2320      	movs	r3, #32
    1134:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    1136:	68fa      	ldr	r2, [r7, #12]
    1138:	683b      	ldr	r3, [r7, #0]
    113a:	429a      	cmp	r2, r3
    113c:	d20e      	bcs.n	115c <read_line+0x134>
    113e:	7afb      	ldrb	r3, [r7, #11]
    1140:	2b1f      	cmp	r3, #31
    1142:	d90b      	bls.n	115c <read_line+0x134>
					buffer[line_len++]=c;
    1144:	68fb      	ldr	r3, [r7, #12]
    1146:	1c5a      	adds	r2, r3, #1
    1148:	60fa      	str	r2, [r7, #12]
    114a:	687a      	ldr	r2, [r7, #4]
    114c:	4413      	add	r3, r2
    114e:	7afa      	ldrb	r2, [r7, #11]
    1150:	701a      	strb	r2, [r3, #0]
					conout(c);
    1152:	7afb      	ldrb	r3, [r7, #11]
    1154:	4618      	mov	r0, r3
    1156:	f7ff fedf 	bl	f18 <conout>
    115a:	e001      	b.n	1160 <read_line+0x138>
				}else{
					beep();
    115c:	f7ff ff22 	bl	fa4 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    1160:	7afb      	ldrb	r3, [r7, #11]
    1162:	2b0d      	cmp	r3, #13
    1164:	f47f af6d 	bne.w	1042 <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1168:	687a      	ldr	r2, [r7, #4]
    116a:	68fb      	ldr	r3, [r7, #12]
    116c:	4413      	add	r3, r2
    116e:	2200      	movs	r2, #0
    1170:	701a      	strb	r2, [r3, #0]
	return line_len;
    1172:	68fb      	ldr	r3, [r7, #12]
}
    1174:	4618      	mov	r0, r3
    1176:	3710      	adds	r7, #16
    1178:	46bd      	mov	sp, r7
    117a:	bd80      	pop	{r7, pc}

0000117c <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    117c:	b580      	push	{r7, lr}
    117e:	b08e      	sub	sp, #56	; 0x38
    1180:	af00      	add	r7, sp, #0
    1182:	6078      	str	r0, [r7, #4]
    1184:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    1186:	2301      	movs	r3, #1
    1188:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    118a:	2322      	movs	r3, #34	; 0x22
    118c:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    118e:	2300      	movs	r3, #0
    1190:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1194:	687b      	ldr	r3, [r7, #4]
    1196:	2b00      	cmp	r3, #0
    1198:	da05      	bge.n	11a6 <print_int+0x2a>
    119a:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    119e:	637b      	str	r3, [r7, #52]	; 0x34
    11a0:	687b      	ldr	r3, [r7, #4]
    11a2:	425b      	negs	r3, r3
    11a4:	607b      	str	r3, [r7, #4]
	while (i){
    11a6:	e02c      	b.n	1202 <print_int+0x86>
		fmt[pos]=i%base+'0';
    11a8:	687b      	ldr	r3, [r7, #4]
    11aa:	683a      	ldr	r2, [r7, #0]
    11ac:	fbb3 f2f2 	udiv	r2, r3, r2
    11b0:	6839      	ldr	r1, [r7, #0]
    11b2:	fb01 f202 	mul.w	r2, r1, r2
    11b6:	1a9b      	subs	r3, r3, r2
    11b8:	b2db      	uxtb	r3, r3
    11ba:	3330      	adds	r3, #48	; 0x30
    11bc:	b2d9      	uxtb	r1, r3
    11be:	f107 020c 	add.w	r2, r7, #12
    11c2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11c4:	4413      	add	r3, r2
    11c6:	460a      	mov	r2, r1
    11c8:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    11ca:	f107 020c 	add.w	r2, r7, #12
    11ce:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11d0:	4413      	add	r3, r2
    11d2:	781b      	ldrb	r3, [r3, #0]
    11d4:	2b39      	cmp	r3, #57	; 0x39
    11d6:	d90c      	bls.n	11f2 <print_int+0x76>
    11d8:	f107 020c 	add.w	r2, r7, #12
    11dc:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11de:	4413      	add	r3, r2
    11e0:	781b      	ldrb	r3, [r3, #0]
    11e2:	3307      	adds	r3, #7
    11e4:	b2d9      	uxtb	r1, r3
    11e6:	f107 020c 	add.w	r2, r7, #12
    11ea:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11ec:	4413      	add	r3, r2
    11ee:	460a      	mov	r2, r1
    11f0:	701a      	strb	r2, [r3, #0]
		pos--;
    11f2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11f4:	3b01      	subs	r3, #1
    11f6:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    11f8:	687a      	ldr	r2, [r7, #4]
    11fa:	683b      	ldr	r3, [r7, #0]
    11fc:	fbb2 f3f3 	udiv	r3, r2, r3
    1200:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    1202:	687b      	ldr	r3, [r7, #4]
    1204:	2b00      	cmp	r3, #0
    1206:	d1cf      	bne.n	11a8 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    1208:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    120a:	2b22      	cmp	r3, #34	; 0x22
    120c:	d108      	bne.n	1220 <print_int+0xa4>
    120e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1210:	1e5a      	subs	r2, r3, #1
    1212:	633a      	str	r2, [r7, #48]	; 0x30
    1214:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1218:	4413      	add	r3, r2
    121a:	2230      	movs	r2, #48	; 0x30
    121c:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    1220:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    1222:	2b00      	cmp	r3, #0
    1224:	da08      	bge.n	1238 <print_int+0xbc>
    1226:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1228:	1e5a      	subs	r2, r3, #1
    122a:	633a      	str	r2, [r7, #48]	; 0x30
    122c:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1230:	4413      	add	r3, r2
    1232:	222d      	movs	r2, #45	; 0x2d
    1234:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    1238:	f107 020c 	add.w	r2, r7, #12
    123c:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    123e:	4413      	add	r3, r2
    1240:	2220      	movs	r2, #32
    1242:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1244:	f107 020c 	add.w	r2, r7, #12
    1248:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    124a:	4413      	add	r3, r2
    124c:	4618      	mov	r0, r3
    124e:	f7ff fe95 	bl	f7c <print>
}
    1252:	3738      	adds	r7, #56	; 0x38
    1254:	46bd      	mov	sp, r7
    1256:	bd80      	pop	{r7, pc}

00001258 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    1258:	b580      	push	{r7, lr}
    125a:	b088      	sub	sp, #32
    125c:	af00      	add	r7, sp, #0
    125e:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    1260:	230c      	movs	r3, #12
    1262:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    1264:	2300      	movs	r3, #0
    1266:	767b      	strb	r3, [r7, #25]
	while (u){
    1268:	e026      	b.n	12b8 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    126a:	687b      	ldr	r3, [r7, #4]
    126c:	b2db      	uxtb	r3, r3
    126e:	f003 030f 	and.w	r3, r3, #15
    1272:	b2db      	uxtb	r3, r3
    1274:	3330      	adds	r3, #48	; 0x30
    1276:	b2d9      	uxtb	r1, r3
    1278:	f107 020c 	add.w	r2, r7, #12
    127c:	69fb      	ldr	r3, [r7, #28]
    127e:	4413      	add	r3, r2
    1280:	460a      	mov	r2, r1
    1282:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1284:	f107 020c 	add.w	r2, r7, #12
    1288:	69fb      	ldr	r3, [r7, #28]
    128a:	4413      	add	r3, r2
    128c:	781b      	ldrb	r3, [r3, #0]
    128e:	2b39      	cmp	r3, #57	; 0x39
    1290:	d90c      	bls.n	12ac <print_hex+0x54>
    1292:	f107 020c 	add.w	r2, r7, #12
    1296:	69fb      	ldr	r3, [r7, #28]
    1298:	4413      	add	r3, r2
    129a:	781b      	ldrb	r3, [r3, #0]
    129c:	3307      	adds	r3, #7
    129e:	b2d9      	uxtb	r1, r3
    12a0:	f107 020c 	add.w	r2, r7, #12
    12a4:	69fb      	ldr	r3, [r7, #28]
    12a6:	4413      	add	r3, r2
    12a8:	460a      	mov	r2, r1
    12aa:	701a      	strb	r2, [r3, #0]
		pos--;
    12ac:	69fb      	ldr	r3, [r7, #28]
    12ae:	3b01      	subs	r3, #1
    12b0:	61fb      	str	r3, [r7, #28]
		u/=16;
    12b2:	687b      	ldr	r3, [r7, #4]
    12b4:	091b      	lsrs	r3, r3, #4
    12b6:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    12b8:	687b      	ldr	r3, [r7, #4]
    12ba:	2b00      	cmp	r3, #0
    12bc:	d1d5      	bne.n	126a <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    12be:	69fb      	ldr	r3, [r7, #28]
    12c0:	2b0c      	cmp	r3, #12
    12c2:	d108      	bne.n	12d6 <print_hex+0x7e>
    12c4:	69fb      	ldr	r3, [r7, #28]
    12c6:	1e5a      	subs	r2, r3, #1
    12c8:	61fa      	str	r2, [r7, #28]
    12ca:	f107 0220 	add.w	r2, r7, #32
    12ce:	4413      	add	r3, r2
    12d0:	2230      	movs	r2, #48	; 0x30
    12d2:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    12d6:	69fb      	ldr	r3, [r7, #28]
    12d8:	1e5a      	subs	r2, r3, #1
    12da:	61fa      	str	r2, [r7, #28]
    12dc:	f107 0220 	add.w	r2, r7, #32
    12e0:	4413      	add	r3, r2
    12e2:	2278      	movs	r2, #120	; 0x78
    12e4:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    12e8:	69fb      	ldr	r3, [r7, #28]
    12ea:	1e5a      	subs	r2, r3, #1
    12ec:	61fa      	str	r2, [r7, #28]
    12ee:	f107 0220 	add.w	r2, r7, #32
    12f2:	4413      	add	r3, r2
    12f4:	2230      	movs	r2, #48	; 0x30
    12f6:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    12fa:	f107 020c 	add.w	r2, r7, #12
    12fe:	69fb      	ldr	r3, [r7, #28]
    1300:	4413      	add	r3, r2
    1302:	2220      	movs	r2, #32
    1304:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1306:	f107 020c 	add.w	r2, r7, #12
    130a:	69fb      	ldr	r3, [r7, #28]
    130c:	4413      	add	r3, r2
    130e:	4618      	mov	r0, r3
    1310:	f7ff fe34 	bl	f7c <print>
}
    1314:	3720      	adds	r7, #32
    1316:	46bd      	mov	sp, r7
    1318:	bd80      	pop	{r7, pc}
    131a:	bf00      	nop

0000131c <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    131c:	b480      	push	{r7}
    131e:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    1320:	4b04      	ldr	r3, [pc, #16]	; (1334 <flush_rx_queue+0x18>)
    1322:	2200      	movs	r2, #0
    1324:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    1326:	4b03      	ldr	r3, [pc, #12]	; (1334 <flush_rx_queue+0x18>)
    1328:	2200      	movs	r2, #0
    132a:	625a      	str	r2, [r3, #36]	; 0x24
}
    132c:	46bd      	mov	sp, r7
    132e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1332:	4770      	bx	lr
    1334:	200000b0 	.word	0x200000b0

00001338 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    1338:	b480      	push	{r7}
    133a:	b085      	sub	sp, #20
    133c:	af00      	add	r7, sp, #0
    133e:	60f8      	str	r0, [r7, #12]
    1340:	60b9      	str	r1, [r7, #8]
    1342:	607a      	str	r2, [r7, #4]
	switch (port){
    1344:	68fb      	ldr	r3, [r7, #12]
    1346:	2b01      	cmp	r3, #1
    1348:	d034      	beq.n	13b4 <config_pin+0x7c>
    134a:	2b01      	cmp	r3, #1
    134c:	d302      	bcc.n	1354 <config_pin+0x1c>
    134e:	2b02      	cmp	r3, #2
    1350:	d060      	beq.n	1414 <config_pin+0xdc>
    1352:	e08f      	b.n	1474 <config_pin+0x13c>
		case GPIOA:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    1354:	68bb      	ldr	r3, [r7, #8]
    1356:	08db      	lsrs	r3, r3, #3
    1358:	009b      	lsls	r3, r3, #2
    135a:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    135e:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    1362:	68ba      	ldr	r2, [r7, #8]
    1364:	08d2      	lsrs	r2, r2, #3
    1366:	0092      	lsls	r2, r2, #2
    1368:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    136c:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    1370:	6812      	ldr	r2, [r2, #0]
    1372:	68b9      	ldr	r1, [r7, #8]
    1374:	f001 0107 	and.w	r1, r1, #7
    1378:	200f      	movs	r0, #15
    137a:	fa00 f101 	lsl.w	r1, r0, r1
    137e:	43c9      	mvns	r1, r1
    1380:	400a      	ands	r2, r1
    1382:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    1384:	68bb      	ldr	r3, [r7, #8]
    1386:	08db      	lsrs	r3, r3, #3
    1388:	009b      	lsls	r3, r3, #2
    138a:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    138e:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    1392:	68ba      	ldr	r2, [r7, #8]
    1394:	08d2      	lsrs	r2, r2, #3
    1396:	0092      	lsls	r2, r2, #2
    1398:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    139c:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    13a0:	6811      	ldr	r1, [r2, #0]
    13a2:	68ba      	ldr	r2, [r7, #8]
    13a4:	f002 0207 	and.w	r2, r2, #7
    13a8:	6878      	ldr	r0, [r7, #4]
    13aa:	fa00 f202 	lsl.w	r2, r0, r2
    13ae:	430a      	orrs	r2, r1
    13b0:	601a      	str	r2, [r3, #0]
		break;
    13b2:	e05f      	b.n	1474 <config_pin+0x13c>
		case GPIOB:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    13b4:	68bb      	ldr	r3, [r7, #8]
    13b6:	08db      	lsrs	r3, r3, #3
    13b8:	009b      	lsls	r3, r3, #2
    13ba:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    13be:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    13c2:	68ba      	ldr	r2, [r7, #8]
    13c4:	08d2      	lsrs	r2, r2, #3
    13c6:	0092      	lsls	r2, r2, #2
    13c8:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    13cc:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    13d0:	6812      	ldr	r2, [r2, #0]
    13d2:	68b9      	ldr	r1, [r7, #8]
    13d4:	f001 0107 	and.w	r1, r1, #7
    13d8:	200f      	movs	r0, #15
    13da:	fa00 f101 	lsl.w	r1, r0, r1
    13de:	43c9      	mvns	r1, r1
    13e0:	400a      	ands	r2, r1
    13e2:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    13e4:	68bb      	ldr	r3, [r7, #8]
    13e6:	08db      	lsrs	r3, r3, #3
    13e8:	009b      	lsls	r3, r3, #2
    13ea:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    13ee:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    13f2:	68ba      	ldr	r2, [r7, #8]
    13f4:	08d2      	lsrs	r2, r2, #3
    13f6:	0092      	lsls	r2, r2, #2
    13f8:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    13fc:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    1400:	6811      	ldr	r1, [r2, #0]
    1402:	68ba      	ldr	r2, [r7, #8]
    1404:	f002 0207 	and.w	r2, r2, #7
    1408:	6878      	ldr	r0, [r7, #4]
    140a:	fa00 f202 	lsl.w	r2, r0, r2
    140e:	430a      	orrs	r2, r1
    1410:	601a      	str	r2, [r3, #0]
		break;
    1412:	e02f      	b.n	1474 <config_pin+0x13c>
		case GPIOC:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    1414:	68bb      	ldr	r3, [r7, #8]
    1416:	08db      	lsrs	r3, r3, #3
    1418:	009b      	lsls	r3, r3, #2
    141a:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    141e:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    1422:	68ba      	ldr	r2, [r7, #8]
    1424:	08d2      	lsrs	r2, r2, #3
    1426:	0092      	lsls	r2, r2, #2
    1428:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    142c:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    1430:	6812      	ldr	r2, [r2, #0]
    1432:	68b9      	ldr	r1, [r7, #8]
    1434:	f001 0107 	and.w	r1, r1, #7
    1438:	200f      	movs	r0, #15
    143a:	fa00 f101 	lsl.w	r1, r0, r1
    143e:	43c9      	mvns	r1, r1
    1440:	400a      	ands	r2, r1
    1442:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    1444:	68bb      	ldr	r3, [r7, #8]
    1446:	08db      	lsrs	r3, r3, #3
    1448:	009b      	lsls	r3, r3, #2
    144a:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    144e:	f503 3384 	add.w	r3, r3, #67584	; 0x10800
    1452:	68ba      	ldr	r2, [r7, #8]
    1454:	08d2      	lsrs	r2, r2, #3
    1456:	0092      	lsls	r2, r2, #2
    1458:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    145c:	f502 3284 	add.w	r2, r2, #67584	; 0x10800
    1460:	6811      	ldr	r1, [r2, #0]
    1462:	68ba      	ldr	r2, [r7, #8]
    1464:	f002 0207 	and.w	r2, r2, #7
    1468:	6878      	ldr	r0, [r7, #4]
    146a:	fa00 f202 	lsl.w	r2, r0, r2
    146e:	430a      	orrs	r2, r1
    1470:	601a      	str	r2, [r3, #0]
		break;
    1472:	bf00      	nop
	}
}
    1474:	3714      	adds	r7, #20
    1476:	46bd      	mov	sp, r7
    1478:	f85d 7b04 	ldr.w	r7, [sp], #4
    147c:	4770      	bx	lr
    147e:	bf00      	nop

00001480 <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    1480:	b480      	push	{r7}
    1482:	b083      	sub	sp, #12
    1484:	af00      	add	r7, sp, #0
    1486:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    1488:	687b      	ldr	r3, [r7, #4]
    148a:	2b3b      	cmp	r3, #59	; 0x3b
    148c:	d900      	bls.n	1490 <enable_interrupt+0x10>
    148e:	e016      	b.n	14be <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    1490:	687b      	ldr	r3, [r7, #4]
    1492:	095b      	lsrs	r3, r3, #5
    1494:	009b      	lsls	r3, r3, #2
    1496:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    149a:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    149e:	687a      	ldr	r2, [r7, #4]
    14a0:	0952      	lsrs	r2, r2, #5
    14a2:	0092      	lsls	r2, r2, #2
    14a4:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    14a8:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    14ac:	6812      	ldr	r2, [r2, #0]
    14ae:	6879      	ldr	r1, [r7, #4]
    14b0:	f001 011f 	and.w	r1, r1, #31
    14b4:	2001      	movs	r0, #1
    14b6:	fa00 f101 	lsl.w	r1, r0, r1
    14ba:	430a      	orrs	r2, r1
    14bc:	601a      	str	r2, [r3, #0]
}
    14be:	370c      	adds	r7, #12
    14c0:	46bd      	mov	sp, r7
    14c2:	f85d 7b04 	ldr.w	r7, [sp], #4
    14c6:	4770      	bx	lr

000014c8 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    14c8:	b480      	push	{r7}
    14ca:	b083      	sub	sp, #12
    14cc:	af00      	add	r7, sp, #0
    14ce:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    14d0:	687b      	ldr	r3, [r7, #4]
    14d2:	2b3b      	cmp	r3, #59	; 0x3b
    14d4:	d900      	bls.n	14d8 <disable_interrupt+0x10>
    14d6:	e013      	b.n	1500 <disable_interrupt+0x38>
	ICER[irq>>5]&=~(1<<(irq&0x1f));
    14d8:	687b      	ldr	r3, [r7, #4]
    14da:	095b      	lsrs	r3, r3, #5
    14dc:	009a      	lsls	r2, r3, #2
    14de:	4b0b      	ldr	r3, [pc, #44]	; (150c <disable_interrupt+0x44>)
    14e0:	4413      	add	r3, r2
    14e2:	687a      	ldr	r2, [r7, #4]
    14e4:	0952      	lsrs	r2, r2, #5
    14e6:	0091      	lsls	r1, r2, #2
    14e8:	4a08      	ldr	r2, [pc, #32]	; (150c <disable_interrupt+0x44>)
    14ea:	440a      	add	r2, r1
    14ec:	6812      	ldr	r2, [r2, #0]
    14ee:	6879      	ldr	r1, [r7, #4]
    14f0:	f001 011f 	and.w	r1, r1, #31
    14f4:	2001      	movs	r0, #1
    14f6:	fa00 f101 	lsl.w	r1, r0, r1
    14fa:	43c9      	mvns	r1, r1
    14fc:	400a      	ands	r2, r1
    14fe:	601a      	str	r2, [r3, #0]
}
    1500:	370c      	adds	r7, #12
    1502:	46bd      	mov	sp, r7
    1504:	f85d 7b04 	ldr.w	r7, [sp], #4
    1508:	4770      	bx	lr
    150a:	bf00      	nop
    150c:	e000e180 	.word	0xe000e180

00001510 <set_int_priority>:



void set_int_priority(int32_t irq, unsigned priority){
    1510:	b480      	push	{r7}
    1512:	b083      	sub	sp, #12
    1514:	af00      	add	r7, sp, #0
    1516:	6078      	str	r0, [r7, #4]
    1518:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    151a:	687b      	ldr	r3, [r7, #4]
    151c:	2b00      	cmp	r3, #0
    151e:	db0d      	blt.n	153c <set_int_priority+0x2c>
    1520:	687b      	ldr	r3, [r7, #4]
    1522:	2b3b      	cmp	r3, #59	; 0x3b
    1524:	dc0a      	bgt.n	153c <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    1526:	687b      	ldr	r3, [r7, #4]
    1528:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    152c:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    1530:	683a      	ldr	r2, [r7, #0]
    1532:	b2d2      	uxtb	r2, r2
    1534:	0112      	lsls	r2, r2, #4
    1536:	b2d2      	uxtb	r2, r2
    1538:	701a      	strb	r2, [r3, #0]
    153a:	e012      	b.n	1562 <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    153c:	687b      	ldr	r3, [r7, #4]
    153e:	2b00      	cmp	r3, #0
    1540:	da0f      	bge.n	1562 <set_int_priority+0x52>
    1542:	687b      	ldr	r3, [r7, #4]
    1544:	f113 0f0f 	cmn.w	r3, #15
    1548:	db0b      	blt.n	1562 <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    154a:	687a      	ldr	r2, [r7, #4]
    154c:	f06f 0303 	mvn.w	r3, #3
    1550:	1a9b      	subs	r3, r3, r2
    1552:	461a      	mov	r2, r3
    1554:	4b05      	ldr	r3, [pc, #20]	; (156c <set_int_priority+0x5c>)
    1556:	4413      	add	r3, r2
    1558:	683a      	ldr	r2, [r7, #0]
    155a:	b2d2      	uxtb	r2, r2
    155c:	0112      	lsls	r2, r2, #4
    155e:	b2d2      	uxtb	r2, r2
    1560:	701a      	strb	r2, [r3, #0]
	}
}
    1562:	370c      	adds	r7, #12
    1564:	46bd      	mov	sp, r7
    1566:	f85d 7b04 	ldr.w	r7, [sp], #4
    156a:	4770      	bx	lr
    156c:	e000ed18 	.word	0xe000ed18

00001570 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    1570:	4b01      	ldr	r3, [pc, #4]	; (1578 <reset_mcu+0x8>)
    1572:	4a02      	ldr	r2, [pc, #8]	; (157c <reset_mcu+0xc>)
    1574:	601a      	str	r2, [r3, #0]
    1576:	bf00      	nop
    1578:	e000ed0c 	.word	0xe000ed0c
    157c:	05fa0004 	.word	0x05fa0004

00001580 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    1580:	b580      	push	{r7, lr}
    1582:	b082      	sub	sp, #8
    1584:	af00      	add	r7, sp, #0
    1586:	6078      	str	r0, [r7, #4]
    1588:	6039      	str	r1, [r7, #0]
	print(msg);
    158a:	6878      	ldr	r0, [r7, #4]
    158c:	f7ff fcf6 	bl	f7c <print>
	print("at address ");
    1590:	4814      	ldr	r0, [pc, #80]	; (15e4 <print_fault+0x64>)
    1592:	f7ff fcf3 	bl	f7c <print>
	if (adr) {
    1596:	683b      	ldr	r3, [r7, #0]
    1598:	2b00      	cmp	r3, #0
    159a:	d002      	beq.n	15a2 <print_fault+0x22>
		print_hex(adr);
    159c:	6838      	ldr	r0, [r7, #0]
    159e:	f7ff fe5b 	bl	1258 <print_hex>
	};
	conout(CR);
    15a2:	200d      	movs	r0, #13
    15a4:	f7ff fcb8 	bl	f18 <conout>
	print("UFSR=");
    15a8:	480f      	ldr	r0, [pc, #60]	; (15e8 <print_fault+0x68>)
    15aa:	f7ff fce7 	bl	f7c <print>
	print_hex(CFSR->fsr.usageFalt);
    15ae:	4b0f      	ldr	r3, [pc, #60]	; (15ec <print_fault+0x6c>)
    15b0:	681b      	ldr	r3, [r3, #0]
    15b2:	0c1b      	lsrs	r3, r3, #16
    15b4:	b29b      	uxth	r3, r3
    15b6:	4618      	mov	r0, r3
    15b8:	f7ff fe4e 	bl	1258 <print_hex>
	print(", BFSR=");
    15bc:	480c      	ldr	r0, [pc, #48]	; (15f0 <print_fault+0x70>)
    15be:	f7ff fcdd 	bl	f7c <print>
	print_hex(CFSR->fsr.busFault);
    15c2:	4b0a      	ldr	r3, [pc, #40]	; (15ec <print_fault+0x6c>)
    15c4:	681b      	ldr	r3, [r3, #0]
    15c6:	0a1b      	lsrs	r3, r3, #8
    15c8:	b2db      	uxtb	r3, r3
    15ca:	4618      	mov	r0, r3
    15cc:	f7ff fe44 	bl	1258 <print_hex>
	print(", MMFSR=");
    15d0:	4808      	ldr	r0, [pc, #32]	; (15f4 <print_fault+0x74>)
    15d2:	f7ff fcd3 	bl	f7c <print>
	print_hex(CFSR->fsr.mmFault);
    15d6:	4b05      	ldr	r3, [pc, #20]	; (15ec <print_fault+0x6c>)
    15d8:	681b      	ldr	r3, [r3, #0]
    15da:	b2db      	uxtb	r3, r3
    15dc:	4618      	mov	r0, r3
    15de:	f7ff fe3b 	bl	1258 <print_hex>
	while(1);
    15e2:	e7fe      	b.n	15e2 <print_fault+0x62>
    15e4:	0000197c 	.word	0x0000197c
    15e8:	00001988 	.word	0x00001988
    15ec:	e000ed28 	.word	0xe000ed28
    15f0:	00001990 	.word	0x00001990
    15f4:	00001998 	.word	0x00001998

000015f8 <uart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
    15f8:	b480      	push	{r7}
    15fa:	b085      	sub	sp, #20
    15fc:	af00      	add	r7, sp, #0
    15fe:	6078      	str	r0, [r7, #4]
    1600:	6039      	str	r1, [r7, #0]
	sfrp_t brr;
	uint32_t rate;

    brr=(sfrp_t)(channel+USART_BRR_OFS);		
    1602:	687b      	ldr	r3, [r7, #4]
    1604:	3308      	adds	r3, #8
    1606:	60bb      	str	r3, [r7, #8]
	switch (channel){
    1608:	687b      	ldr	r3, [r7, #4]
    160a:	4a1a      	ldr	r2, [pc, #104]	; (1674 <uart_set_baud+0x7c>)
    160c:	4293      	cmp	r3, r2
    160e:	d019      	beq.n	1644 <uart_set_baud+0x4c>
    1610:	4a19      	ldr	r2, [pc, #100]	; (1678 <uart_set_baud+0x80>)
    1612:	4293      	cmp	r3, r2
    1614:	d003      	beq.n	161e <uart_set_baud+0x26>
    1616:	4a19      	ldr	r2, [pc, #100]	; (167c <uart_set_baud+0x84>)
    1618:	4293      	cmp	r3, r2
    161a:	d013      	beq.n	1644 <uart_set_baud+0x4c>
    161c:	e021      	b.n	1662 <uart_set_baud+0x6a>
	case USART1:
		rate=(FAPB2/baud/16)<<4;
    161e:	4a18      	ldr	r2, [pc, #96]	; (1680 <uart_set_baud+0x88>)
    1620:	683b      	ldr	r3, [r7, #0]
    1622:	fbb2 f3f3 	udiv	r3, r2, r3
    1626:	011b      	lsls	r3, r3, #4
    1628:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    162a:	4a16      	ldr	r2, [pc, #88]	; (1684 <uart_set_baud+0x8c>)
    162c:	683b      	ldr	r3, [r7, #0]
    162e:	fbb2 f3f3 	udiv	r3, r2, r3
    1632:	f003 030f 	and.w	r3, r3, #15
    1636:	68fa      	ldr	r2, [r7, #12]
    1638:	4313      	orrs	r3, r2
    163a:	60fb      	str	r3, [r7, #12]
		*brr=rate;
    163c:	68bb      	ldr	r3, [r7, #8]
    163e:	68fa      	ldr	r2, [r7, #12]
    1640:	601a      	str	r2, [r3, #0]
		return;
    1642:	e011      	b.n	1668 <uart_set_baud+0x70>
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
    1644:	4a10      	ldr	r2, [pc, #64]	; (1688 <uart_set_baud+0x90>)
    1646:	683b      	ldr	r3, [r7, #0]
    1648:	fbb2 f3f3 	udiv	r3, r2, r3
    164c:	011b      	lsls	r3, r3, #4
    164e:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    1650:	4a0e      	ldr	r2, [pc, #56]	; (168c <uart_set_baud+0x94>)
    1652:	683b      	ldr	r3, [r7, #0]
    1654:	fbb2 f3f3 	udiv	r3, r2, r3
    1658:	f003 030f 	and.w	r3, r3, #15
    165c:	68fa      	ldr	r2, [r7, #12]
    165e:	4313      	orrs	r3, r2
    1660:	60fb      	str	r3, [r7, #12]
	}
	*brr=rate;
    1662:	68bb      	ldr	r3, [r7, #8]
    1664:	68fa      	ldr	r2, [r7, #12]
    1666:	601a      	str	r2, [r3, #0]
}
    1668:	3714      	adds	r7, #20
    166a:	46bd      	mov	sp, r7
    166c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1670:	4770      	bx	lr
    1672:	bf00      	nop
    1674:	40004800 	.word	0x40004800
    1678:	40013800 	.word	0x40013800
    167c:	40004400 	.word	0x40004400
    1680:	0044aa20 	.word	0x0044aa20
    1684:	044aa200 	.word	0x044aa200
    1688:	00225510 	.word	0x00225510
    168c:	02255100 	.word	0x02255100

00001690 <uart_open_channel>:

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl){
    1690:	b580      	push	{r7, lr}
    1692:	b086      	sub	sp, #24
    1694:	af00      	add	r7, sp, #0
    1696:	60f8      	str	r0, [r7, #12]
    1698:	60b9      	str	r1, [r7, #8]
    169a:	607a      	str	r2, [r7, #4]
	sfrp_t cr1, cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
    169c:	68fb      	ldr	r3, [r7, #12]
    169e:	4a40      	ldr	r2, [pc, #256]	; (17a0 <uart_open_channel+0x110>)
    16a0:	4293      	cmp	r3, r2
    16a2:	d044      	beq.n	172e <uart_open_channel+0x9e>
    16a4:	4a3f      	ldr	r2, [pc, #252]	; (17a4 <uart_open_channel+0x114>)
    16a6:	4293      	cmp	r3, r2
    16a8:	d003      	beq.n	16b2 <uart_open_channel+0x22>
    16aa:	4a3f      	ldr	r2, [pc, #252]	; (17a8 <uart_open_channel+0x118>)
    16ac:	4293      	cmp	r3, r2
    16ae:	d020      	beq.n	16f2 <uart_open_channel+0x62>
    16b0:	e05b      	b.n	176a <uart_open_channel+0xda>
	case USART1:
		APB2ENR->apb2enr|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
    16b2:	4a3e      	ldr	r2, [pc, #248]	; (17ac <uart_open_channel+0x11c>)
    16b4:	4b3d      	ldr	r3, [pc, #244]	; (17ac <uart_open_channel+0x11c>)
    16b6:	681b      	ldr	r3, [r3, #0]
    16b8:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    16bc:	f043 0304 	orr.w	r3, r3, #4
    16c0:	6013      	str	r3, [r2, #0]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    16c2:	4a3b      	ldr	r2, [pc, #236]	; (17b0 <uart_open_channel+0x120>)
    16c4:	4b3a      	ldr	r3, [pc, #232]	; (17b0 <uart_open_channel+0x120>)
    16c6:	681b      	ldr	r3, [r3, #0]
    16c8:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    16cc:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    16d0:	6013      	str	r3, [r2, #0]
		GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    16d2:	4a37      	ldr	r2, [pc, #220]	; (17b0 <uart_open_channel+0x120>)
    16d4:	4b36      	ldr	r3, [pc, #216]	; (17b0 <uart_open_channel+0x120>)
    16d6:	681b      	ldr	r3, [r3, #0]
    16d8:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    16dc:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    16e0:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART1,7);
    16e2:	2025      	movs	r0, #37	; 0x25
    16e4:	2107      	movs	r1, #7
    16e6:	f7ff ff13 	bl	1510 <set_int_priority>
		enable_interrupt(USART1_IRQ);
    16ea:	2025      	movs	r0, #37	; 0x25
    16ec:	f7ff fec8 	bl	1480 <enable_interrupt>
		break;
    16f0:	e03b      	b.n	176a <uart_open_channel+0xda>
	case USART2:
		APB1ENR->fld.usart2en=1;
    16f2:	4b30      	ldr	r3, [pc, #192]	; (17b4 <uart_open_channel+0x124>)
    16f4:	681a      	ldr	r2, [r3, #0]
    16f6:	f442 3200 	orr.w	r2, r2, #131072	; 0x20000
    16fa:	601a      	str	r2, [r3, #0]
		APB2ENR->fld.iopaen=1;
    16fc:	4b2b      	ldr	r3, [pc, #172]	; (17ac <uart_open_channel+0x11c>)
    16fe:	681a      	ldr	r2, [r3, #0]
    1700:	f042 0204 	orr.w	r2, r2, #4
    1704:	601a      	str	r2, [r3, #0]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    1706:	4a2c      	ldr	r2, [pc, #176]	; (17b8 <uart_open_channel+0x128>)
    1708:	4b2b      	ldr	r3, [pc, #172]	; (17b8 <uart_open_channel+0x128>)
    170a:	681b      	ldr	r3, [r3, #0]
    170c:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    1710:	6013      	str	r3, [r2, #0]
		GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    1712:	4a29      	ldr	r2, [pc, #164]	; (17b8 <uart_open_channel+0x128>)
    1714:	4b28      	ldr	r3, [pc, #160]	; (17b8 <uart_open_channel+0x128>)
    1716:	681b      	ldr	r3, [r3, #0]
    1718:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    171c:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART2,7);
    171e:	2026      	movs	r0, #38	; 0x26
    1720:	2107      	movs	r1, #7
    1722:	f7ff fef5 	bl	1510 <set_int_priority>
		enable_interrupt(USART2_IRQ);
    1726:	2026      	movs	r0, #38	; 0x26
    1728:	f7ff feaa 	bl	1480 <enable_interrupt>
		break;
    172c:	e01d      	b.n	176a <uart_open_channel+0xda>
	case USART3:
		APB1ENR->fld.usart3en=1;
    172e:	4b21      	ldr	r3, [pc, #132]	; (17b4 <uart_open_channel+0x124>)
    1730:	681a      	ldr	r2, [r3, #0]
    1732:	f442 2280 	orr.w	r2, r2, #262144	; 0x40000
    1736:	601a      	str	r2, [r3, #0]
		APB2ENR->fld.iopben=1;
    1738:	4b1c      	ldr	r3, [pc, #112]	; (17ac <uart_open_channel+0x11c>)
    173a:	681a      	ldr	r2, [r3, #0]
    173c:	f042 0208 	orr.w	r2, r2, #8
    1740:	601a      	str	r2, [r3, #0]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    1742:	4a1e      	ldr	r2, [pc, #120]	; (17bc <uart_open_channel+0x12c>)
    1744:	4b1d      	ldr	r3, [pc, #116]	; (17bc <uart_open_channel+0x12c>)
    1746:	681b      	ldr	r3, [r3, #0]
    1748:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    174c:	6013      	str	r3, [r2, #0]
		GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    174e:	4a1b      	ldr	r2, [pc, #108]	; (17bc <uart_open_channel+0x12c>)
    1750:	4b1a      	ldr	r3, [pc, #104]	; (17bc <uart_open_channel+0x12c>)
    1752:	681b      	ldr	r3, [r3, #0]
    1754:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    1758:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART3,7);
    175a:	2027      	movs	r0, #39	; 0x27
    175c:	2107      	movs	r1, #7
    175e:	f7ff fed7 	bl	1510 <set_int_priority>
		enable_interrupt(USART3_IRQ);
    1762:	2027      	movs	r0, #39	; 0x27
    1764:	f7ff fe8c 	bl	1480 <enable_interrupt>
		break;
    1768:	bf00      	nop
	}
	uart_set_baud(channel,baud);
    176a:	68f8      	ldr	r0, [r7, #12]
    176c:	68b9      	ldr	r1, [r7, #8]
    176e:	f7ff ff43 	bl	15f8 <uart_set_baud>
	if (flow_ctrl==FLOW_HARD){
    1772:	687b      	ldr	r3, [r7, #4]
    1774:	2b01      	cmp	r3, #1
    1776:	d106      	bne.n	1786 <uart_open_channel+0xf6>
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
