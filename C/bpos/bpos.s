
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 91 26 00 00     i...m...q....&..
      20:	91 26 00 00 91 26 00 00 91 26 00 00 55 05 00 00     .&...&...&..U...
      30:	91 26 00 00 91 26 00 00 79 02 00 00 69 27 00 00     .&...&..y...i'..
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 91 26 00 00 91 26 00 00 0d 2a 00 00     .....&...&...*..
      80:	91 26 00 00 91 26 00 00 91 26 00 00 91 26 00 00     .&...&...&...&..
      90:	91 26 00 00 91 26 00 00 91 26 00 00 a1 20 00 00     .&...&...&... ..
      a0:	91 26 00 00 91 26 00 00 91 26 00 00 bd 28 00 00     .&...&...&...(..
      b0:	09 22 00 00 91 26 00 00 91 26 00 00 91 26 00 00     ."...&...&...&..
      c0:	91 26 00 00 91 26 00 00 91 26 00 00 91 26 00 00     .&...&...&...&..
      d0:	91 26 00 00 c5 02 00 00 01 11 00 00 cd 02 00 00     .&..............
      e0:	91 26 00 00 91 26 00 00 91 26 00 00 91 26 00 00     .&...&...&...&..
      f0:	91 26 00 00 91 26 00 00 91 26 00 00 91 26 00 00     .&...&...&...&..
     100:	91 26 00 00 91 26 00 00 91 26 00 00 91 26 00 00     .&...&...&...&..
     110:	91 26 00 00 91 26 00 00 91 26 00 00 91 26 00 00     .&...&...&...&..
     120:	91 26 00 00 91 26 00 00 91 26 00 00 91 26 00 00     .&...&...&...&..

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
     1b0:	f000 fea4 	bl	efc <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	20000008 	.word	0x20000008
     1c0:	200026a8 	.word	0x200026a8
     1c4:	00003480 	.word	0x00003480
     1c8:	20000000 	.word	0x20000000
     1cc:	20000008 	.word	0x20000008
     1d0:	20002700 	.word	0x20002700
     1d4:	200000e4 	.word	0x200000e4
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
     208:	f002 fa4a 	bl	26a0 <print_fault>
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
     21e:	f002 fa3f 	bl	26a0 <print_fault>
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
     234:	f002 fa34 	bl	26a0 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f002 fa2f 	bl	26a0 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	00003398 	.word	0x00003398
     258:	000033b0 	.word	0x000033b0
     25c:	000033bc 	.word	0x000033bc
     260:	000033cc 	.word	0x000033cc

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f002 fa14 	bl	2690 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f002 fa12 	bl	2690 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f002 fa10 	bl	2690 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f002 fa0e 	bl	2690 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f002 fa0c 	bl	2690 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f002 fa0a 	bl	2690 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f002 fa08 	bl	2690 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f002 fa06 	bl	2690 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f002 fa04 	bl	2690 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f002 fa02 	bl	2690 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f002 fa00 	bl	2690 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f002 f9fe 	bl	2690 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f002 f9fc 	bl	2690 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f002 f9fa 	bl	2690 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f002 f9f8 	bl	2690 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f002 f9f6 	bl	2690 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f002 f9f4 	bl	2690 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f002 f9f2 	bl	2690 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f002 f9f0 	bl	2690 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f002 f9ee 	bl	2690 <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f002 f9ec 	bl	2690 <reset_mcu>
_default_handler(EXTI9_5_handler) // 23
     2b8:	f002 f9ea 	bl	2690 <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2bc:	f002 f9e8 	bl	2690 <reset_mcu>
_default_handler(TIM2_handler) // 28
     2c0:	f002 f9e6 	bl	2690 <reset_mcu>

000002c4 <USART1_handler>:
_default_handler(USART1_handler) // 37
     2c4:	f002 f9e4 	bl	2690 <reset_mcu>
_default_handler(USART2_handler) // 38
     2c8:	f002 f9e2 	bl	2690 <reset_mcu>

000002cc <USART3_handler>:
_default_handler(USART3_handler) // 39
     2cc:	f002 f9e0 	bl	2690 <reset_mcu>

000002d0 <strcmp>:
extern unsigned int _FLASH_FREE;
extern unsigned int _DATA_ROM_START;

uint32_t proga;

int strcmp(const char *s1, const char *s2){
     2d0:	b480      	push	{r7}
     2d2:	b085      	sub	sp, #20
     2d4:	af00      	add	r7, sp, #0
     2d6:	6078      	str	r0, [r7, #4]
     2d8:	6039      	str	r1, [r7, #0]
	int result=0;
     2da:	2300      	movs	r3, #0
     2dc:	60fb      	str	r3, [r7, #12]
	while (*s1 && *s2){
     2de:	e018      	b.n	312 <strcmp+0x42>
		if (*s1<*s2){
     2e0:	687b      	ldr	r3, [r7, #4]
     2e2:	781a      	ldrb	r2, [r3, #0]
     2e4:	683b      	ldr	r3, [r7, #0]
     2e6:	781b      	ldrb	r3, [r3, #0]
     2e8:	429a      	cmp	r2, r3
     2ea:	d203      	bcs.n	2f4 <strcmp+0x24>
			result=-1;
     2ec:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     2f0:	60fb      	str	r3, [r7, #12]
			break;
     2f2:	e016      	b.n	322 <strcmp+0x52>
		}else if (*s1>*s2){
     2f4:	687b      	ldr	r3, [r7, #4]
     2f6:	781a      	ldrb	r2, [r3, #0]
     2f8:	683b      	ldr	r3, [r7, #0]
     2fa:	781b      	ldrb	r3, [r3, #0]
     2fc:	429a      	cmp	r2, r3
     2fe:	d902      	bls.n	306 <strcmp+0x36>
			result=1;
     300:	2301      	movs	r3, #1
     302:	60fb      	str	r3, [r7, #12]
			break;
     304:	e00d      	b.n	322 <strcmp+0x52>
		}
		s1++;
     306:	687b      	ldr	r3, [r7, #4]
     308:	3301      	adds	r3, #1
     30a:	607b      	str	r3, [r7, #4]
		s2++;
     30c:	683b      	ldr	r3, [r7, #0]
     30e:	3301      	adds	r3, #1
     310:	603b      	str	r3, [r7, #0]

uint32_t proga;

int strcmp(const char *s1, const char *s2){
	int result=0;
	while (*s1 && *s2){
     312:	687b      	ldr	r3, [r7, #4]
     314:	781b      	ldrb	r3, [r3, #0]
     316:	2b00      	cmp	r3, #0
     318:	d003      	beq.n	322 <strcmp+0x52>
     31a:	683b      	ldr	r3, [r7, #0]
     31c:	781b      	ldrb	r3, [r3, #0]
     31e:	2b00      	cmp	r3, #0
     320:	d1de      	bne.n	2e0 <strcmp+0x10>
			break;
		}
		s1++;
		s2++;
	}
	if (!result){
     322:	68fb      	ldr	r3, [r7, #12]
     324:	2b00      	cmp	r3, #0
     326:	d115      	bne.n	354 <strcmp+0x84>
		if (!*s1 && *s2){
     328:	687b      	ldr	r3, [r7, #4]
     32a:	781b      	ldrb	r3, [r3, #0]
     32c:	2b00      	cmp	r3, #0
     32e:	d107      	bne.n	340 <strcmp+0x70>
     330:	683b      	ldr	r3, [r7, #0]
     332:	781b      	ldrb	r3, [r3, #0]
     334:	2b00      	cmp	r3, #0
     336:	d003      	beq.n	340 <strcmp+0x70>
			result=-1;
     338:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     33c:	60fb      	str	r3, [r7, #12]
     33e:	e009      	b.n	354 <strcmp+0x84>
		}else if (*s1 && !*s2) {
     340:	687b      	ldr	r3, [r7, #4]
     342:	781b      	ldrb	r3, [r3, #0]
     344:	2b00      	cmp	r3, #0
     346:	d005      	beq.n	354 <strcmp+0x84>
     348:	683b      	ldr	r3, [r7, #0]
     34a:	781b      	ldrb	r3, [r3, #0]
     34c:	2b00      	cmp	r3, #0
     34e:	d101      	bne.n	354 <strcmp+0x84>
			result=1;
     350:	2301      	movs	r3, #1
     352:	60fb      	str	r3, [r7, #12]
		}
	}
	return result;
     354:	68fb      	ldr	r3, [r7, #12]
}
     356:	4618      	mov	r0, r3
     358:	3714      	adds	r7, #20
     35a:	46bd      	mov	sp, r7
     35c:	f85d 7b04 	ldr.w	r7, [sp], #4
     360:	4770      	bx	lr
     362:	bf00      	nop

00000364 <digit>:

int digit(char c){
     364:	b480      	push	{r7}
     366:	b083      	sub	sp, #12
     368:	af00      	add	r7, sp, #0
     36a:	4603      	mov	r3, r0
     36c:	71fb      	strb	r3, [r7, #7]
   return ((c>='0') && (c<='9'));
     36e:	79fb      	ldrb	r3, [r7, #7]
     370:	2b2f      	cmp	r3, #47	; 0x2f
     372:	d904      	bls.n	37e <digit+0x1a>
     374:	79fb      	ldrb	r3, [r7, #7]
     376:	2b39      	cmp	r3, #57	; 0x39
     378:	d801      	bhi.n	37e <digit+0x1a>
     37a:	2301      	movs	r3, #1
     37c:	e000      	b.n	380 <digit+0x1c>
     37e:	2300      	movs	r3, #0
}
     380:	4618      	mov	r0, r3
     382:	370c      	adds	r7, #12
     384:	46bd      	mov	sp, r7
     386:	f85d 7b04 	ldr.w	r7, [sp], #4
     38a:	4770      	bx	lr

0000038c <hexdigit>:

int hexdigit(char c){
     38c:	b580      	push	{r7, lr}
     38e:	b082      	sub	sp, #8
     390:	af00      	add	r7, sp, #0
     392:	4603      	mov	r3, r0
     394:	71fb      	strb	r3, [r7, #7]
	if (c>='a') c-=32;
     396:	79fb      	ldrb	r3, [r7, #7]
     398:	2b60      	cmp	r3, #96	; 0x60
     39a:	d902      	bls.n	3a2 <hexdigit+0x16>
     39c:	79fb      	ldrb	r3, [r7, #7]
     39e:	3b20      	subs	r3, #32
     3a0:	71fb      	strb	r3, [r7, #7]
	return (digit(c) || (c>='A' && c<='F'));
     3a2:	79fb      	ldrb	r3, [r7, #7]
     3a4:	4618      	mov	r0, r3
     3a6:	f7ff ffdd 	bl	364 <digit>
     3aa:	4603      	mov	r3, r0
     3ac:	2b00      	cmp	r3, #0
     3ae:	d105      	bne.n	3bc <hexdigit+0x30>
     3b0:	79fb      	ldrb	r3, [r7, #7]
     3b2:	2b40      	cmp	r3, #64	; 0x40
     3b4:	d904      	bls.n	3c0 <hexdigit+0x34>
     3b6:	79fb      	ldrb	r3, [r7, #7]
     3b8:	2b46      	cmp	r3, #70	; 0x46
     3ba:	d801      	bhi.n	3c0 <hexdigit+0x34>
     3bc:	2301      	movs	r3, #1
     3be:	e000      	b.n	3c2 <hexdigit+0x36>
     3c0:	2300      	movs	r3, #0
}
     3c2:	4618      	mov	r0, r3
     3c4:	3708      	adds	r7, #8
     3c6:	46bd      	mov	sp, r7
     3c8:	bd80      	pop	{r7, pc}
     3ca:	bf00      	nop

000003cc <atoi>:

int atoi(const char *str){
     3cc:	b580      	push	{r7, lr}
     3ce:	b086      	sub	sp, #24
     3d0:	af00      	add	r7, sp, #0
     3d2:	6078      	str	r0, [r7, #4]
	int n=0,sign=1,base=10;
     3d4:	2300      	movs	r3, #0
     3d6:	617b      	str	r3, [r7, #20]
     3d8:	2301      	movs	r3, #1
     3da:	613b      	str	r3, [r7, #16]
     3dc:	230a      	movs	r3, #10
     3de:	60fb      	str	r3, [r7, #12]
    char c;
    
	while (*str && (*str==SPACE)) str++;
     3e0:	e002      	b.n	3e8 <atoi+0x1c>
     3e2:	687b      	ldr	r3, [r7, #4]
     3e4:	3301      	adds	r3, #1
     3e6:	607b      	str	r3, [r7, #4]
     3e8:	687b      	ldr	r3, [r7, #4]
     3ea:	781b      	ldrb	r3, [r3, #0]
     3ec:	2b00      	cmp	r3, #0
     3ee:	d003      	beq.n	3f8 <atoi+0x2c>
     3f0:	687b      	ldr	r3, [r7, #4]
     3f2:	781b      	ldrb	r3, [r3, #0]
     3f4:	2b20      	cmp	r3, #32
     3f6:	d0f4      	beq.n	3e2 <atoi+0x16>
	if (*str=='-'){
     3f8:	687b      	ldr	r3, [r7, #4]
     3fa:	781b      	ldrb	r3, [r3, #0]
     3fc:	2b2d      	cmp	r3, #45	; 0x2d
     3fe:	d105      	bne.n	40c <atoi+0x40>
		sign=-1;
     400:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     404:	613b      	str	r3, [r7, #16]
		str++;
     406:	687b      	ldr	r3, [r7, #4]
     408:	3301      	adds	r3, #1
     40a:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
     40c:	687b      	ldr	r3, [r7, #4]
     40e:	781b      	ldrb	r3, [r3, #0]
     410:	2b30      	cmp	r3, #48	; 0x30
     412:	d10e      	bne.n	432 <atoi+0x66>
     414:	687b      	ldr	r3, [r7, #4]
     416:	3301      	adds	r3, #1
     418:	781b      	ldrb	r3, [r3, #0]
     41a:	2b78      	cmp	r3, #120	; 0x78
     41c:	d004      	beq.n	428 <atoi+0x5c>
     41e:	687b      	ldr	r3, [r7, #4]
     420:	3301      	adds	r3, #1
     422:	781b      	ldrb	r3, [r3, #0]
     424:	2b58      	cmp	r3, #88	; 0x58
     426:	d104      	bne.n	432 <atoi+0x66>
		base=16;
     428:	2310      	movs	r3, #16
     42a:	60fb      	str	r3, [r7, #12]
		str+=2;
     42c:	687b      	ldr	r3, [r7, #4]
     42e:	3302      	adds	r3, #2
     430:	607b      	str	r3, [r7, #4]
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     432:	e018      	b.n	466 <atoi+0x9a>
		if (c>='a'){c-=32;}
     434:	7afb      	ldrb	r3, [r7, #11]
     436:	2b60      	cmp	r3, #96	; 0x60
     438:	d902      	bls.n	440 <atoi+0x74>
     43a:	7afb      	ldrb	r3, [r7, #11]
     43c:	3b20      	subs	r3, #32
     43e:	72fb      	strb	r3, [r7, #11]
		c-='0';
     440:	7afb      	ldrb	r3, [r7, #11]
     442:	3b30      	subs	r3, #48	; 0x30
     444:	72fb      	strb	r3, [r7, #11]
		if (c>9){c-=7;}
     446:	7afb      	ldrb	r3, [r7, #11]
     448:	2b09      	cmp	r3, #9
     44a:	d902      	bls.n	452 <atoi+0x86>
     44c:	7afb      	ldrb	r3, [r7, #11]
     44e:	3b07      	subs	r3, #7
     450:	72fb      	strb	r3, [r7, #11]
		n=n*base+c;
     452:	697b      	ldr	r3, [r7, #20]
     454:	68fa      	ldr	r2, [r7, #12]
     456:	fb02 f203 	mul.w	r2, r2, r3
     45a:	7afb      	ldrb	r3, [r7, #11]
     45c:	4413      	add	r3, r2
     45e:	617b      	str	r3, [r7, #20]
		str++;
     460:	687b      	ldr	r3, [r7, #4]
     462:	3301      	adds	r3, #1
     464:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
		base=16;
		str+=2;
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     466:	687b      	ldr	r3, [r7, #4]
     468:	781b      	ldrb	r3, [r3, #0]
     46a:	72fb      	strb	r3, [r7, #11]
     46c:	7afb      	ldrb	r3, [r7, #11]
     46e:	2b00      	cmp	r3, #0
     470:	d00d      	beq.n	48e <atoi+0xc2>
     472:	68fb      	ldr	r3, [r7, #12]
     474:	2b0a      	cmp	r3, #10
     476:	d10a      	bne.n	48e <atoi+0xc2>
     478:	7afb      	ldrb	r3, [r7, #11]
     47a:	4618      	mov	r0, r3
     47c:	f7ff ff72 	bl	364 <digit>
     480:	4603      	mov	r3, r0
     482:	2b00      	cmp	r3, #0
     484:	bf14      	ite	ne
     486:	2301      	movne	r3, #1
     488:	2300      	moveq	r3, #0
     48a:	b2db      	uxtb	r3, r3
     48c:	e009      	b.n	4a2 <atoi+0xd6>
     48e:	7afb      	ldrb	r3, [r7, #11]
     490:	4618      	mov	r0, r3
     492:	f7ff ff7b 	bl	38c <hexdigit>
     496:	4603      	mov	r3, r0
     498:	2b00      	cmp	r3, #0
     49a:	bf14      	ite	ne
     49c:	2301      	movne	r3, #1
     49e:	2300      	moveq	r3, #0
     4a0:	b2db      	uxtb	r3, r3
     4a2:	2b00      	cmp	r3, #0
     4a4:	d1c6      	bne.n	434 <atoi+0x68>
		c-='0';
		if (c>9){c-=7;}
		n=n*base+c;
		str++;
	}
	return sign*n;
     4a6:	693b      	ldr	r3, [r7, #16]
     4a8:	697a      	ldr	r2, [r7, #20]
     4aa:	fb02 f303 	mul.w	r3, r2, r3
}
     4ae:	4618      	mov	r0, r3
     4b0:	3718      	adds	r7, #24
     4b2:	46bd      	mov	sp, r7
     4b4:	bd80      	pop	{r7, pc}
     4b6:	bf00      	nop

000004b8 <peek8>:
static void word();

// routine de services


static inline uint8_t peek8(uint8_t *adr){
     4b8:	b480      	push	{r7}
     4ba:	b083      	sub	sp, #12
     4bc:	af00      	add	r7, sp, #0
     4be:	6078      	str	r0, [r7, #4]
	return *adr;
     4c0:	687b      	ldr	r3, [r7, #4]
     4c2:	781b      	ldrb	r3, [r3, #0]
}
     4c4:	4618      	mov	r0, r3
     4c6:	370c      	adds	r7, #12
     4c8:	46bd      	mov	sp, r7
     4ca:	f85d 7b04 	ldr.w	r7, [sp], #4
     4ce:	4770      	bx	lr

000004d0 <peek16>:

static inline uint16_t peek16(uint16_t *adr){
     4d0:	b480      	push	{r7}
     4d2:	b083      	sub	sp, #12
     4d4:	af00      	add	r7, sp, #0
     4d6:	6078      	str	r0, [r7, #4]
	return *adr;
     4d8:	687b      	ldr	r3, [r7, #4]
     4da:	881b      	ldrh	r3, [r3, #0]
}
     4dc:	4618      	mov	r0, r3
     4de:	370c      	adds	r7, #12
     4e0:	46bd      	mov	sp, r7
     4e2:	f85d 7b04 	ldr.w	r7, [sp], #4
     4e6:	4770      	bx	lr

000004e8 <peek32>:

static inline uint32_t peek32(uint32_t *adr){
     4e8:	b480      	push	{r7}
     4ea:	b083      	sub	sp, #12
     4ec:	af00      	add	r7, sp, #0
     4ee:	6078      	str	r0, [r7, #4]
	return *adr;
     4f0:	687b      	ldr	r3, [r7, #4]
     4f2:	681b      	ldr	r3, [r3, #0]
}
     4f4:	4618      	mov	r0, r3
     4f6:	370c      	adds	r7, #12
     4f8:	46bd      	mov	sp, r7
     4fa:	f85d 7b04 	ldr.w	r7, [sp], #4
     4fe:	4770      	bx	lr

00000500 <poke8>:

static inline void poke8(uint8_t *adr, uint8_t value){
     500:	b480      	push	{r7}
     502:	b083      	sub	sp, #12
     504:	af00      	add	r7, sp, #0
     506:	6078      	str	r0, [r7, #4]
     508:	460b      	mov	r3, r1
     50a:	70fb      	strb	r3, [r7, #3]
	*adr=value;
     50c:	687b      	ldr	r3, [r7, #4]
     50e:	78fa      	ldrb	r2, [r7, #3]
     510:	701a      	strb	r2, [r3, #0]
}
     512:	370c      	adds	r7, #12
     514:	46bd      	mov	sp, r7
     516:	f85d 7b04 	ldr.w	r7, [sp], #4
     51a:	4770      	bx	lr

0000051c <poke16>:

static inline void poke16(uint16_t *adr, uint16_t value){
     51c:	b480      	push	{r7}
     51e:	b083      	sub	sp, #12
     520:	af00      	add	r7, sp, #0
     522:	6078      	str	r0, [r7, #4]
     524:	460b      	mov	r3, r1
     526:	807b      	strh	r3, [r7, #2]
	*adr=value;
     528:	687b      	ldr	r3, [r7, #4]
     52a:	887a      	ldrh	r2, [r7, #2]
     52c:	801a      	strh	r2, [r3, #0]
}
     52e:	370c      	adds	r7, #12
     530:	46bd      	mov	sp, r7
     532:	f85d 7b04 	ldr.w	r7, [sp], #4
     536:	4770      	bx	lr

00000538 <poke32>:

static inline void poke32(uint32_t *adr, uint32_t value){
     538:	b480      	push	{r7}
     53a:	b083      	sub	sp, #12
     53c:	af00      	add	r7, sp, #0
     53e:	6078      	str	r0, [r7, #4]
     540:	6039      	str	r1, [r7, #0]
	*adr=value;
     542:	687b      	ldr	r3, [r7, #4]
     544:	683a      	ldr	r2, [r7, #0]
     546:	601a      	str	r2, [r3, #0]
}
     548:	370c      	adds	r7, #12
     54a:	46bd      	mov	sp, r7
     54c:	f85d 7b04 	ldr.w	r7, [sp], #4
     550:	4770      	bx	lr
     552:	bf00      	nop

00000554 <SVC_handler>:

// interruption multiplexeur des appels de services
void __attribute__((__interrupt__)) SVC_handler(){
     554:	4668      	mov	r0, sp
     556:	f020 0107 	bic.w	r1, r0, #7
     55a:	468d      	mov	sp, r1
     55c:	b591      	push	{r0, r4, r7, lr}
     55e:	b084      	sub	sp, #16
     560:	af00      	add	r7, sp, #0
	int svc_id;
	void *arg1, *arg2; 
	asm volatile (
     562:	f3ef 8009 	mrs	r0, PSP
     566:	6981      	ldr	r1, [r0, #24]
     568:	f811 4c02 	ldrb.w	r4, [r1, #-2]
     56c:	6802      	ldr	r2, [r0, #0]
     56e:	6843      	ldr	r3, [r0, #4]
     570:	60fc      	str	r4, [r7, #12]
     572:	60ba      	str	r2, [r7, #8]
     574:	607b      	str	r3, [r7, #4]
    "ldr %[arg1],[r0]\n\t"
    "ldr %[arg2],[r0,#4]\n\t"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [arg2] "=r" (arg2)
    :: "r0","r1" 
    );
	switch (svc_id){
     576:	68fb      	ldr	r3, [r7, #12]
     578:	2b13      	cmp	r3, #19
     57a:	f200 80c1 	bhi.w	700 <SVC_handler+0x1ac>
     57e:	a201      	add	r2, pc, #4	; (adr r2, 584 <SVC_handler+0x30>)
     580:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     584:	000006fb 	.word	0x000006fb
     588:	000005d5 	.word	0x000005d5
     58c:	000005e1 	.word	0x000005e1
     590:	000005ed 	.word	0x000005ed
     594:	000005f7 	.word	0x000005f7
     598:	00000601 	.word	0x00000601
     59c:	0000060f 	.word	0x0000060f
     5a0:	0000061b 	.word	0x0000061b
     5a4:	0000062f 	.word	0x0000062f
     5a8:	00000637 	.word	0x00000637
     5ac:	00000645 	.word	0x00000645
     5b0:	00000651 	.word	0x00000651
     5b4:	00000665 	.word	0x00000665
     5b8:	00000679 	.word	0x00000679
     5bc:	0000068b 	.word	0x0000068b
     5c0:	0000069f 	.word	0x0000069f
     5c4:	000006b3 	.word	0x000006b3
     5c8:	000006c7 	.word	0x000006c7
     5cc:	000006df 	.word	0x000006df
     5d0:	000006f1 	.word	0x000006f1
	case SVC_LED_ON:
		write_pin(LED_PORT,LED_PIN,LED_ON);
     5d4:	484d      	ldr	r0, [pc, #308]	; (70c <SVC_handler+0x1b8>)
     5d6:	210d      	movs	r1, #13
     5d8:	2200      	movs	r2, #0
     5da:	f001 fb77 	bl	1ccc <write_pin>
		//led_on();
		break;
     5de:	e08f      	b.n	700 <SVC_handler+0x1ac>
	case SVC_LED_OFF:
		write_pin(LED_PORT,LED_PIN,LED_OFF);
     5e0:	484a      	ldr	r0, [pc, #296]	; (70c <SVC_handler+0x1b8>)
     5e2:	210d      	movs	r1, #13
     5e4:	2201      	movs	r2, #1
     5e6:	f001 fb71 	bl	1ccc <write_pin>
		//led_off();
		break;
     5ea:	e089      	b.n	700 <SVC_handler+0x1ac>
	case SVC_TIMER:
		timer=(*(unsigned*)arg1);
     5ec:	68bb      	ldr	r3, [r7, #8]
     5ee:	681b      	ldr	r3, [r3, #0]
     5f0:	4a47      	ldr	r2, [pc, #284]	; (710 <SVC_handler+0x1bc>)
     5f2:	6013      	str	r3, [r2, #0]
		break;
     5f4:	e084      	b.n	700 <SVC_handler+0x1ac>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=timer;
     5f6:	4b46      	ldr	r3, [pc, #280]	; (710 <SVC_handler+0x1bc>)
     5f8:	681a      	ldr	r2, [r3, #0]
     5fa:	68bb      	ldr	r3, [r7, #8]
     5fc:	601a      	str	r2, [r3, #0]
		break;
     5fe:	e07f      	b.n	700 <SVC_handler+0x1ac>
	case SVC_CONIN:
		*(char *)arg1=conin();
     600:	f000 fe2a 	bl	1258 <conin>
     604:	4603      	mov	r3, r0
     606:	461a      	mov	r2, r3
     608:	68bb      	ldr	r3, [r7, #8]
     60a:	701a      	strb	r2, [r3, #0]
		break;
     60c:	e078      	b.n	700 <SVC_handler+0x1ac>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     60e:	68bb      	ldr	r3, [r7, #8]
     610:	781b      	ldrb	r3, [r3, #0]
     612:	4618      	mov	r0, r3
     614:	f000 fe10 	bl	1238 <conout>
		break;
     618:	e072      	b.n	700 <SVC_handler+0x1ac>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     61a:	68bb      	ldr	r3, [r7, #8]
     61c:	681b      	ldr	r3, [r3, #0]
     61e:	6878      	ldr	r0, [r7, #4]
     620:	4619      	mov	r1, r3
     622:	f000 fe47 	bl	12b4 <read_line>
     626:	4602      	mov	r2, r0
     628:	68bb      	ldr	r3, [r7, #8]
     62a:	601a      	str	r2, [r3, #0]
		break;
     62c:	e068      	b.n	700 <SVC_handler+0x1ac>
	case SVC_PRINT:
		print((const char*)arg1);
     62e:	68b8      	ldr	r0, [r7, #8]
     630:	f000 fe1c 	bl	126c <print>
		break;
     634:	e064      	b.n	700 <SVC_handler+0x1ac>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     636:	68bb      	ldr	r3, [r7, #8]
     638:	681b      	ldr	r3, [r3, #0]
     63a:	4618      	mov	r0, r3
     63c:	210a      	movs	r1, #10
     63e:	f000 feef 	bl	1420 <print_int>
		break;
     642:	e05d      	b.n	700 <SVC_handler+0x1ac>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     644:	68bb      	ldr	r3, [r7, #8]
     646:	681b      	ldr	r3, [r3, #0]
     648:	4618      	mov	r0, r3
     64a:	f000 ff57 	bl	14fc <print_hex>
		break;
     64e:	e057      	b.n	700 <SVC_handler+0x1ac>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     650:	68bb      	ldr	r3, [r7, #8]
     652:	681b      	ldr	r3, [r3, #0]
     654:	4618      	mov	r0, r3
     656:	f7ff ff2f 	bl	4b8 <peek8>
     65a:	4603      	mov	r3, r0
     65c:	461a      	mov	r2, r3
     65e:	68bb      	ldr	r3, [r7, #8]
     660:	701a      	strb	r2, [r3, #0]
		break;
     662:	e04d      	b.n	700 <SVC_handler+0x1ac>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     664:	68bb      	ldr	r3, [r7, #8]
     666:	681b      	ldr	r3, [r3, #0]
     668:	4618      	mov	r0, r3
     66a:	f7ff ff31 	bl	4d0 <peek16>
     66e:	4603      	mov	r3, r0
     670:	461a      	mov	r2, r3
     672:	68bb      	ldr	r3, [r7, #8]
     674:	801a      	strh	r2, [r3, #0]
		break;
     676:	e043      	b.n	700 <SVC_handler+0x1ac>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     678:	68bb      	ldr	r3, [r7, #8]
     67a:	681b      	ldr	r3, [r3, #0]
     67c:	4618      	mov	r0, r3
     67e:	f7ff ff33 	bl	4e8 <peek32>
     682:	4602      	mov	r2, r0
     684:	68bb      	ldr	r3, [r7, #8]
     686:	601a      	str	r2, [r3, #0]
		break;
     688:	e03a      	b.n	700 <SVC_handler+0x1ac>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
     68a:	68bb      	ldr	r3, [r7, #8]
     68c:	681b      	ldr	r3, [r3, #0]
     68e:	461a      	mov	r2, r3
     690:	687b      	ldr	r3, [r7, #4]
     692:	781b      	ldrb	r3, [r3, #0]
     694:	4610      	mov	r0, r2
     696:	4619      	mov	r1, r3
     698:	f7ff ff32 	bl	500 <poke8>
		break;
     69c:	e030      	b.n	700 <SVC_handler+0x1ac>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
     69e:	68bb      	ldr	r3, [r7, #8]
     6a0:	681b      	ldr	r3, [r3, #0]
     6a2:	461a      	mov	r2, r3
     6a4:	687b      	ldr	r3, [r7, #4]
     6a6:	881b      	ldrh	r3, [r3, #0]
     6a8:	4610      	mov	r0, r2
     6aa:	4619      	mov	r1, r3
     6ac:	f7ff ff36 	bl	51c <poke16>
		break;
     6b0:	e026      	b.n	700 <SVC_handler+0x1ac>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
     6b2:	68bb      	ldr	r3, [r7, #8]
     6b4:	681b      	ldr	r3, [r3, #0]
     6b6:	461a      	mov	r2, r3
     6b8:	687b      	ldr	r3, [r7, #4]
     6ba:	681b      	ldr	r3, [r3, #0]
     6bc:	4610      	mov	r0, r2
     6be:	4619      	mov	r1, r3
     6c0:	f7ff ff3a 	bl	538 <poke32>
		break;
     6c4:	e01c      	b.n	700 <SVC_handler+0x1ac>
	case SVC_FLASH_WR:
		*(int*)arg1=flash_write(*(uint32_t*)arg1,*(uint16_t*)arg2);
     6c6:	68bb      	ldr	r3, [r7, #8]
     6c8:	681a      	ldr	r2, [r3, #0]
     6ca:	687b      	ldr	r3, [r7, #4]
     6cc:	881b      	ldrh	r3, [r3, #0]
     6ce:	4610      	mov	r0, r2
     6d0:	4619      	mov	r1, r3
     6d2:	f000 ffbd 	bl	1650 <flash_write>
     6d6:	4602      	mov	r2, r0
     6d8:	68bb      	ldr	r3, [r7, #8]
     6da:	601a      	str	r2, [r3, #0]
		break;
     6dc:	e010      	b.n	700 <SVC_handler+0x1ac>
	case SVC_FLASH_PGER:
		*(int*)arg1=flash_erase_page(*(uint32_t*)arg1);
     6de:	68bb      	ldr	r3, [r7, #8]
     6e0:	681b      	ldr	r3, [r3, #0]
     6e2:	4618      	mov	r0, r3
     6e4:	f000 fff8 	bl	16d8 <flash_erase_page>
     6e8:	4602      	mov	r2, r0
     6ea:	68bb      	ldr	r3, [r7, #8]
     6ec:	601a      	str	r2, [r3, #0]
		break;
     6ee:	e007      	b.n	700 <SVC_handler+0x1ac>
	case SVC_TICKS:
		*(unsigned*)arg1=ticks;
     6f0:	4b08      	ldr	r3, [pc, #32]	; (714 <SVC_handler+0x1c0>)
     6f2:	681a      	ldr	r2, [r3, #0]
     6f4:	68bb      	ldr	r3, [r7, #8]
     6f6:	601a      	str	r2, [r3, #0]
		break;
     6f8:	e002      	b.n	700 <SVC_handler+0x1ac>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     6fa:	f001 ffc9 	bl	2690 <reset_mcu>
	    break;
     6fe:	bf00      	nop
	}	
}
     700:	3710      	adds	r7, #16
     702:	46bd      	mov	sp, r7
     704:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     708:	4685      	mov	sp, r0
     70a:	4770      	bx	lr
     70c:	40011000 	.word	0x40011000
     710:	200000d8 	.word	0x200000d8
     714:	200000d4 	.word	0x200000d4

00000718 <set_sysclock>:


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     718:	b480      	push	{r7}
     71a:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC->CR|=RCC_CR_HSEON;
     71c:	4a18      	ldr	r2, [pc, #96]	; (780 <set_sysclock+0x68>)
     71e:	4b18      	ldr	r3, [pc, #96]	; (780 <set_sysclock+0x68>)
     720:	681b      	ldr	r3, [r3, #0]
     722:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     726:	6013      	str	r3, [r2, #0]
	 // attend que l'oscillateur soit prêt
   while (!(RCC->CR&RCC_CR_HSERDY));
     728:	bf00      	nop
     72a:	4b15      	ldr	r3, [pc, #84]	; (780 <set_sysclock+0x68>)
     72c:	681b      	ldr	r3, [r3, #0]
     72e:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
     732:	2b00      	cmp	r3, #0
     734:	d0f9      	beq.n	72a <set_sysclock+0x12>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 8 
     // pour une fréquence  Fsysclk de 64 Mhz
    RCC->CFGR|=RCC_CFGR_PLLSRC_HSE|(PLLMUL<<RCC_CFGR_PLLMUL_POS);
     736:	4a12      	ldr	r2, [pc, #72]	; (780 <set_sysclock+0x68>)
     738:	4b11      	ldr	r3, [pc, #68]	; (780 <set_sysclock+0x68>)
     73a:	685b      	ldr	r3, [r3, #4]
     73c:	f443 2310 	orr.w	r3, r3, #589824	; 0x90000
     740:	6053      	str	r3, [r2, #4]
    // active le PLL
    RCC->CR|=RCC_CR_PLLON;
     742:	4a0f      	ldr	r2, [pc, #60]	; (780 <set_sysclock+0x68>)
     744:	4b0e      	ldr	r3, [pc, #56]	; (780 <set_sysclock+0x68>)
     746:	681b      	ldr	r3, [r3, #0]
     748:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
     74c:	6013      	str	r3, [r2, #0]
    // Attend que le PLL soit prêt
    while (!(RCC->CR&RCC_CR_PLLRDY));
     74e:	bf00      	nop
     750:	4b0b      	ldr	r3, [pc, #44]	; (780 <set_sysclock+0x68>)
     752:	681b      	ldr	r3, [r3, #0]
     754:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
     758:	2b00      	cmp	r3, #0
     75a:	d0f9      	beq.n	750 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    // active le prefetch buffer
    FLASH->ACR|=(WAIT_2_CY<<FLASH_ACR_LATENCY_POS)|FLASH_ACR_PRFTBE;
     75c:	4a09      	ldr	r2, [pc, #36]	; (784 <set_sysclock+0x6c>)
     75e:	4b09      	ldr	r3, [pc, #36]	; (784 <set_sysclock+0x6c>)
     760:	681b      	ldr	r3, [r3, #0]
     762:	f043 0312 	orr.w	r3, r3, #18
     766:	6013      	str	r3, [r2, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
    // Sélectionne le PLL comme source pour SYSCLK dans CR
	RCC->CFGR|=(RCC_CFGR_PPREx_DIV2<<RCC_CFGR_PPRE1_POS)|(RCC_CFGR_SW_PLL<<RCC_CFGR_SW_POS);
     768:	4a05      	ldr	r2, [pc, #20]	; (780 <set_sysclock+0x68>)
     76a:	4b05      	ldr	r3, [pc, #20]	; (780 <set_sysclock+0x68>)
     76c:	685b      	ldr	r3, [r3, #4]
     76e:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     772:	f043 0302 	orr.w	r3, r3, #2
     776:	6053      	str	r3, [r2, #4]
}
     778:	46bd      	mov	sp, r7
     77a:	f85d 7b04 	ldr.w	r7, [sp], #4
     77e:	4770      	bx	lr
     780:	40021000 	.word	0x40021000
     784:	40022000 	.word	0x40022000

00000788 <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     788:	b480      	push	{r7}
     78a:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     78c:	2300      	movs	r3, #0
     78e:	2200      	movs	r2, #0
     790:	4618      	mov	r0, r3
     792:	4611      	mov	r1, r2
     794:	df00      	svc	0
}
     796:	46bd      	mov	sp, r7
     798:	f85d 7b04 	ldr.w	r7, [sp], #4
     79c:	4770      	bx	lr
     79e:	bf00      	nop

000007a0 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     7a0:	b480      	push	{r7}
     7a2:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     7a4:	2300      	movs	r3, #0
     7a6:	2200      	movs	r2, #0
     7a8:	4618      	mov	r0, r3
     7aa:	4611      	mov	r1, r2
     7ac:	df01      	svc	1
}
     7ae:	46bd      	mov	sp, r7
     7b0:	f85d 7b04 	ldr.w	r7, [sp], #4
     7b4:	4770      	bx	lr
     7b6:	bf00      	nop

000007b8 <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     7b8:	b480      	push	{r7}
     7ba:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     7bc:	2300      	movs	r3, #0
     7be:	2200      	movs	r2, #0
     7c0:	4618      	mov	r0, r3
     7c2:	4611      	mov	r1, r2
     7c4:	df02      	svc	2
}
     7c6:	46bd      	mov	sp, r7
     7c8:	f85d 7b04 	ldr.w	r7, [sp], #4
     7cc:	4770      	bx	lr
     7ce:	bf00      	nop

000007d0 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     7d0:	b580      	push	{r7, lr}
     7d2:	b082      	sub	sp, #8
     7d4:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     7d6:	f000 faf7 	bl	dc8 <word>
	n=atoi((const char*)pad);
     7da:	4806      	ldr	r0, [pc, #24]	; (7f4 <cmd_set_timer+0x24>)
     7dc:	f7ff fdf6 	bl	3cc <atoi>
     7e0:	4603      	mov	r3, r0
     7e2:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     7e4:	1d3b      	adds	r3, r7, #4
     7e6:	2200      	movs	r2, #0
     7e8:	4618      	mov	r0, r3
     7ea:	4611      	mov	r1, r2
     7ec:	df03      	svc	3
}
     7ee:	3708      	adds	r7, #8
     7f0:	46bd      	mov	sp, r7
     7f2:	bd80      	pop	{r7, pc}
     7f4:	20000058 	.word	0x20000058

000007f8 <cmd_get_timer>:

static void cmd_get_timer(){
     7f8:	b480      	push	{r7}
     7fa:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     7fc:	4b04      	ldr	r3, [pc, #16]	; (810 <cmd_get_timer+0x18>)
     7fe:	2200      	movs	r2, #0
     800:	4618      	mov	r0, r3
     802:	4611      	mov	r1, r2
     804:	df04      	svc	4
}
     806:	46bd      	mov	sp, r7
     808:	f85d 7b04 	ldr.w	r7, [sp], #4
     80c:	4770      	bx	lr
     80e:	bf00      	nop
     810:	20000058 	.word	0x20000058

00000814 <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     814:	b480      	push	{r7}
     816:	b083      	sub	sp, #12
     818:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     81a:	1d3b      	adds	r3, r7, #4
     81c:	2200      	movs	r2, #0
     81e:	4618      	mov	r0, r3
     820:	4611      	mov	r1, r2
     822:	df04      	svc	4
     824:	687b      	ldr	r3, [r7, #4]
     826:	2b00      	cmp	r3, #0
     828:	d1f7      	bne.n	81a <cmd_pause+0x6>
}
     82a:	370c      	adds	r7, #12
     82c:	46bd      	mov	sp, r7
     82e:	f85d 7b04 	ldr.w	r7, [sp], #4
     832:	4770      	bx	lr

00000834 <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     834:	b480      	push	{r7}
     836:	b083      	sub	sp, #12
     838:	af00      	add	r7, sp, #0
	volatile char n=0;
     83a:	2300      	movs	r3, #0
     83c:	71fb      	strb	r3, [r7, #7]
	while (!n){
     83e:	e004      	b.n	84a <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     840:	1dfb      	adds	r3, r7, #7
     842:	2200      	movs	r2, #0
     844:	4618      	mov	r0, r3
     846:	4611      	mov	r1, r2
     848:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     84a:	79fb      	ldrb	r3, [r7, #7]
     84c:	b2db      	uxtb	r3, r3
     84e:	2b00      	cmp	r3, #0
     850:	d0f6      	beq.n	840 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     852:	79fb      	ldrb	r3, [r7, #7]
     854:	b2da      	uxtb	r2, r3
     856:	4b05      	ldr	r3, [pc, #20]	; (86c <cmd_getc+0x38>)
     858:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     85a:	4b04      	ldr	r3, [pc, #16]	; (86c <cmd_getc+0x38>)
     85c:	2200      	movs	r2, #0
     85e:	705a      	strb	r2, [r3, #1]
}
     860:	370c      	adds	r7, #12
     862:	46bd      	mov	sp, r7
     864:	f85d 7b04 	ldr.w	r7, [sp], #4
     868:	4770      	bx	lr
     86a:	bf00      	nop
     86c:	20000058 	.word	0x20000058

00000870 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     870:	b580      	push	{r7, lr}
     872:	b082      	sub	sp, #8
     874:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     876:	f000 faa7 	bl	dc8 <word>
	cmd_id=search_command((const char*)pad);
     87a:	480a      	ldr	r0, [pc, #40]	; (8a4 <cmd_putc+0x34>)
     87c:	f000 f98e 	bl	b9c <search_command>
     880:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     882:	687b      	ldr	r3, [r7, #4]
     884:	2b00      	cmp	r3, #0
     886:	db05      	blt.n	894 <cmd_putc+0x24>
     888:	4a07      	ldr	r2, [pc, #28]	; (8a8 <cmd_putc+0x38>)
     88a:	687b      	ldr	r3, [r7, #4]
     88c:	00db      	lsls	r3, r3, #3
     88e:	4413      	add	r3, r2
     890:	685b      	ldr	r3, [r3, #4]
     892:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     894:	4b03      	ldr	r3, [pc, #12]	; (8a4 <cmd_putc+0x34>)
     896:	2200      	movs	r2, #0
     898:	4618      	mov	r0, r3
     89a:	4611      	mov	r1, r2
     89c:	df06      	svc	6
}
     89e:	3708      	adds	r7, #8
     8a0:	46bd      	mov	sp, r7
     8a2:	bd80      	pop	{r7, pc}
     8a4:	20000058 	.word	0x20000058
     8a8:	00002ddc 	.word	0x00002ddc

000008ac <cmd_readln>:

static void cmd_readln(){
     8ac:	b580      	push	{r7, lr}
     8ae:	b082      	sub	sp, #8
     8b0:	af00      	add	r7, sp, #0
	unsigned llen=80;
     8b2:	2350      	movs	r3, #80	; 0x50
     8b4:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     8b6:	1d3b      	adds	r3, r7, #4
     8b8:	4a04      	ldr	r2, [pc, #16]	; (8cc <cmd_readln+0x20>)
     8ba:	4618      	mov	r0, r3
     8bc:	4611      	mov	r1, r2
     8be:	df07      	svc	7
	print((const char*)pad);
     8c0:	4802      	ldr	r0, [pc, #8]	; (8cc <cmd_readln+0x20>)
     8c2:	f000 fcd3 	bl	126c <print>
}
     8c6:	3708      	adds	r7, #8
     8c8:	46bd      	mov	sp, r7
     8ca:	bd80      	pop	{r7, pc}
     8cc:	20000058 	.word	0x20000058

000008d0 <cmd_print>:

static void cmd_print(){
     8d0:	b580      	push	{r7, lr}
     8d2:	af00      	add	r7, sp, #0
	word();
     8d4:	f000 fa78 	bl	dc8 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     8d8:	4b02      	ldr	r3, [pc, #8]	; (8e4 <cmd_print+0x14>)
     8da:	2200      	movs	r2, #0
     8dc:	4618      	mov	r0, r3
     8de:	4611      	mov	r1, r2
     8e0:	df08      	svc	8
}
     8e2:	bd80      	pop	{r7, pc}
     8e4:	20000058 	.word	0x20000058

000008e8 <cmd_print_int>:

static void cmd_print_int(){
     8e8:	b580      	push	{r7, lr}
     8ea:	b082      	sub	sp, #8
     8ec:	af00      	add	r7, sp, #0
	int cmd_id;
    unsigned u32;
    
	word();
     8ee:	f000 fa6b 	bl	dc8 <word>
	cmd_id=search_command((const char*)pad);
     8f2:	480e      	ldr	r0, [pc, #56]	; (92c <cmd_print_int+0x44>)
     8f4:	f000 f952 	bl	b9c <search_command>
     8f8:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     8fa:	687b      	ldr	r3, [r7, #4]
     8fc:	2b00      	cmp	r3, #0
     8fe:	db06      	blt.n	90e <cmd_print_int+0x26>
		 commands[cmd_id].fn();
     900:	4a0b      	ldr	r2, [pc, #44]	; (930 <cmd_print_int+0x48>)
     902:	687b      	ldr	r3, [r7, #4]
     904:	00db      	lsls	r3, r3, #3
     906:	4413      	add	r3, r2
     908:	685b      	ldr	r3, [r3, #4]
     90a:	4798      	blx	r3
     90c:	e006      	b.n	91c <cmd_print_int+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     90e:	4807      	ldr	r0, [pc, #28]	; (92c <cmd_print_int+0x44>)
     910:	f7ff fd5c 	bl	3cc <atoi>
     914:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     916:	4a05      	ldr	r2, [pc, #20]	; (92c <cmd_print_int+0x44>)
     918:	687b      	ldr	r3, [r7, #4]
     91a:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_INT,pad,NUL);
     91c:	4b03      	ldr	r3, [pc, #12]	; (92c <cmd_print_int+0x44>)
     91e:	2200      	movs	r2, #0
     920:	4618      	mov	r0, r3
     922:	4611      	mov	r1, r2
     924:	df09      	svc	9
}
     926:	3708      	adds	r7, #8
     928:	46bd      	mov	sp, r7
     92a:	bd80      	pop	{r7, pc}
     92c:	20000058 	.word	0x20000058
     930:	00002ddc 	.word	0x00002ddc

00000934 <cmd_print_hex>:

static void cmd_print_hex(){
     934:	b580      	push	{r7, lr}
     936:	b082      	sub	sp, #8
     938:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     93a:	f000 fa45 	bl	dc8 <word>
	cmd_id=search_command((const char*)pad);
     93e:	480e      	ldr	r0, [pc, #56]	; (978 <cmd_print_hex+0x44>)
     940:	f000 f92c 	bl	b9c <search_command>
     944:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     946:	687b      	ldr	r3, [r7, #4]
     948:	2b00      	cmp	r3, #0
     94a:	db06      	blt.n	95a <cmd_print_hex+0x26>
		 commands[cmd_id].fn();
     94c:	4a0b      	ldr	r2, [pc, #44]	; (97c <cmd_print_hex+0x48>)
     94e:	687b      	ldr	r3, [r7, #4]
     950:	00db      	lsls	r3, r3, #3
     952:	4413      	add	r3, r2
     954:	685b      	ldr	r3, [r3, #4]
     956:	4798      	blx	r3
     958:	e006      	b.n	968 <cmd_print_hex+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     95a:	4807      	ldr	r0, [pc, #28]	; (978 <cmd_print_hex+0x44>)
     95c:	f7ff fd36 	bl	3cc <atoi>
     960:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     962:	4a05      	ldr	r2, [pc, #20]	; (978 <cmd_print_hex+0x44>)
     964:	687b      	ldr	r3, [r7, #4]
     966:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_HEX,pad,NUL);
     968:	4b03      	ldr	r3, [pc, #12]	; (978 <cmd_print_hex+0x44>)
     96a:	2200      	movs	r2, #0
     96c:	4618      	mov	r0, r3
     96e:	4611      	mov	r1, r2
     970:	df0a      	svc	10
}
     972:	3708      	adds	r7, #8
     974:	46bd      	mov	sp, r7
     976:	bd80      	pop	{r7, pc}
     978:	20000058 	.word	0x20000058
     97c:	00002ddc 	.word	0x00002ddc

00000980 <cmd_run>:

static void cmd_run(){
     980:	b580      	push	{r7, lr}
     982:	af00      	add	r7, sp, #0
	((fn)proga)();
     984:	4b01      	ldr	r3, [pc, #4]	; (98c <cmd_run+0xc>)
     986:	681b      	ldr	r3, [r3, #0]
     988:	4798      	blx	r3
	
}
     98a:	bd80      	pop	{r7, pc}
     98c:	200000e4 	.word	0x200000e4

00000990 <cmd_peek8>:

static void cmd_peek8(){
     990:	b580      	push	{r7, lr}
     992:	b082      	sub	sp, #8
     994:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     996:	f000 fa17 	bl	dc8 <word>
	u=atoi((const char*)pad);
     99a:	4808      	ldr	r0, [pc, #32]	; (9bc <cmd_peek8+0x2c>)
     99c:	f7ff fd16 	bl	3cc <atoi>
     9a0:	4603      	mov	r3, r0
     9a2:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     9a4:	1d3b      	adds	r3, r7, #4
     9a6:	2200      	movs	r2, #0
     9a8:	4618      	mov	r0, r3
     9aa:	4611      	mov	r1, r2
     9ac:	df0b      	svc	11
	*(uint32_t*)pad=u&0xff;
     9ae:	4a03      	ldr	r2, [pc, #12]	; (9bc <cmd_peek8+0x2c>)
     9b0:	687b      	ldr	r3, [r7, #4]
     9b2:	b2db      	uxtb	r3, r3
     9b4:	6013      	str	r3, [r2, #0]
}
     9b6:	3708      	adds	r7, #8
     9b8:	46bd      	mov	sp, r7
     9ba:	bd80      	pop	{r7, pc}
     9bc:	20000058 	.word	0x20000058

000009c0 <cmd_peek16>:

static void cmd_peek16(){
     9c0:	b580      	push	{r7, lr}
     9c2:	b082      	sub	sp, #8
     9c4:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9c6:	f000 f9ff 	bl	dc8 <word>
	u=atoi((const char*)pad);
     9ca:	4808      	ldr	r0, [pc, #32]	; (9ec <cmd_peek16+0x2c>)
     9cc:	f7ff fcfe 	bl	3cc <atoi>
     9d0:	4603      	mov	r3, r0
     9d2:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     9d4:	1d3b      	adds	r3, r7, #4
     9d6:	2200      	movs	r2, #0
     9d8:	4618      	mov	r0, r3
     9da:	4611      	mov	r1, r2
     9dc:	df0c      	svc	12
	*(uint32_t*)pad=u&0xffff;
     9de:	4a03      	ldr	r2, [pc, #12]	; (9ec <cmd_peek16+0x2c>)
     9e0:	687b      	ldr	r3, [r7, #4]
     9e2:	b29b      	uxth	r3, r3
     9e4:	6013      	str	r3, [r2, #0]
}
     9e6:	3708      	adds	r7, #8
     9e8:	46bd      	mov	sp, r7
     9ea:	bd80      	pop	{r7, pc}
     9ec:	20000058 	.word	0x20000058

000009f0 <cmd_peek32>:

static void cmd_peek32(){
     9f0:	b580      	push	{r7, lr}
     9f2:	b082      	sub	sp, #8
     9f4:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     9f6:	f000 f9e7 	bl	dc8 <word>
	u=atoi((const char*)pad);
     9fa:	4808      	ldr	r0, [pc, #32]	; (a1c <cmd_peek32+0x2c>)
     9fc:	f7ff fce6 	bl	3cc <atoi>
     a00:	4603      	mov	r3, r0
     a02:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK32,&u,NUL);
     a04:	1d3b      	adds	r3, r7, #4
     a06:	2200      	movs	r2, #0
     a08:	4618      	mov	r0, r3
     a0a:	4611      	mov	r1, r2
     a0c:	df0d      	svc	13
	*(uint32_t*)pad=u;
     a0e:	4a03      	ldr	r2, [pc, #12]	; (a1c <cmd_peek32+0x2c>)
     a10:	687b      	ldr	r3, [r7, #4]
     a12:	6013      	str	r3, [r2, #0]
}
     a14:	3708      	adds	r7, #8
     a16:	46bd      	mov	sp, r7
     a18:	bd80      	pop	{r7, pc}
     a1a:	bf00      	nop
     a1c:	20000058 	.word	0x20000058

00000a20 <cmd_poke8>:

static void cmd_poke8(){
     a20:	b580      	push	{r7, lr}
     a22:	b082      	sub	sp, #8
     a24:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     a26:	f000 f9cf 	bl	dc8 <word>
	adr=atoi((const char*)pad);
     a2a:	480a      	ldr	r0, [pc, #40]	; (a54 <cmd_poke8+0x34>)
     a2c:	f7ff fcce 	bl	3cc <atoi>
     a30:	4603      	mov	r3, r0
     a32:	607b      	str	r3, [r7, #4]
	word();
     a34:	f000 f9c8 	bl	dc8 <word>
	u8=atoi((const char*)pad);
     a38:	4806      	ldr	r0, [pc, #24]	; (a54 <cmd_poke8+0x34>)
     a3a:	f7ff fcc7 	bl	3cc <atoi>
     a3e:	4603      	mov	r3, r0
     a40:	b2db      	uxtb	r3, r3
     a42:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     a44:	1d3b      	adds	r3, r7, #4
     a46:	1cfa      	adds	r2, r7, #3
     a48:	4618      	mov	r0, r3
     a4a:	4611      	mov	r1, r2
     a4c:	df0e      	svc	14
}
     a4e:	3708      	adds	r7, #8
     a50:	46bd      	mov	sp, r7
     a52:	bd80      	pop	{r7, pc}
     a54:	20000058 	.word	0x20000058

00000a58 <cmd_poke16>:

static void cmd_poke16(){
     a58:	b580      	push	{r7, lr}
     a5a:	b082      	sub	sp, #8
     a5c:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     a5e:	f000 f9b3 	bl	dc8 <word>
	adr=atoi((const char*)pad);
     a62:	480a      	ldr	r0, [pc, #40]	; (a8c <cmd_poke16+0x34>)
     a64:	f7ff fcb2 	bl	3cc <atoi>
     a68:	4603      	mov	r3, r0
     a6a:	607b      	str	r3, [r7, #4]
	word();
     a6c:	f000 f9ac 	bl	dc8 <word>
	u16=atoi((const char*)pad);
     a70:	4806      	ldr	r0, [pc, #24]	; (a8c <cmd_poke16+0x34>)
     a72:	f7ff fcab 	bl	3cc <atoi>
     a76:	4603      	mov	r3, r0
     a78:	b29b      	uxth	r3, r3
     a7a:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     a7c:	1d3b      	adds	r3, r7, #4
     a7e:	1cba      	adds	r2, r7, #2
     a80:	4618      	mov	r0, r3
     a82:	4611      	mov	r1, r2
     a84:	df0f      	svc	15
}
     a86:	3708      	adds	r7, #8
     a88:	46bd      	mov	sp, r7
     a8a:	bd80      	pop	{r7, pc}
     a8c:	20000058 	.word	0x20000058

00000a90 <cmd_poke32>:

static void cmd_poke32(){
     a90:	b580      	push	{r7, lr}
     a92:	b082      	sub	sp, #8
     a94:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     a96:	f000 f997 	bl	dc8 <word>
	adr=atoi((const char*)pad);
     a9a:	480a      	ldr	r0, [pc, #40]	; (ac4 <cmd_poke32+0x34>)
     a9c:	f7ff fc96 	bl	3cc <atoi>
     aa0:	4603      	mov	r3, r0
     aa2:	607b      	str	r3, [r7, #4]
	word();
     aa4:	f000 f990 	bl	dc8 <word>
	u32=atoi((const char*)pad);
     aa8:	4806      	ldr	r0, [pc, #24]	; (ac4 <cmd_poke32+0x34>)
     aaa:	f7ff fc8f 	bl	3cc <atoi>
     aae:	4603      	mov	r3, r0
     ab0:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     ab2:	1d3b      	adds	r3, r7, #4
     ab4:	463a      	mov	r2, r7
     ab6:	4618      	mov	r0, r3
     ab8:	4611      	mov	r1, r2
     aba:	df10      	svc	16
}
     abc:	3708      	adds	r7, #8
     abe:	46bd      	mov	sp, r7
     ac0:	bd80      	pop	{r7, pc}
     ac2:	bf00      	nop
     ac4:	20000058 	.word	0x20000058

00000ac8 <cmd_fwrite>:

static void cmd_fwrite(){
     ac8:	b580      	push	{r7, lr}
     aca:	b082      	sub	sp, #8
     acc:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	word();
     ace:	f000 f97b 	bl	dc8 <word>
	adr=atoi((const char*)pad);
     ad2:	480d      	ldr	r0, [pc, #52]	; (b08 <cmd_fwrite+0x40>)
     ad4:	f7ff fc7a 	bl	3cc <atoi>
     ad8:	4603      	mov	r3, r0
     ada:	607b      	str	r3, [r7, #4]
	word();
     adc:	f000 f974 	bl	dc8 <word>
	u32=atoi((const char*)pad);
     ae0:	4809      	ldr	r0, [pc, #36]	; (b08 <cmd_fwrite+0x40>)
     ae2:	f7ff fc73 	bl	3cc <atoi>
     ae6:	4603      	mov	r3, r0
     ae8:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_FLASH_WR,&adr,&u32);
     aea:	1d3b      	adds	r3, r7, #4
     aec:	463a      	mov	r2, r7
     aee:	4618      	mov	r0, r3
     af0:	4611      	mov	r1, r2
     af2:	df11      	svc	17
	if (!adr) print(" failed\n");
     af4:	687b      	ldr	r3, [r7, #4]
     af6:	2b00      	cmp	r3, #0
     af8:	d102      	bne.n	b00 <cmd_fwrite+0x38>
     afa:	4804      	ldr	r0, [pc, #16]	; (b0c <cmd_fwrite+0x44>)
     afc:	f000 fbb6 	bl	126c <print>
}
     b00:	3708      	adds	r7, #8
     b02:	46bd      	mov	sp, r7
     b04:	bd80      	pop	{r7, pc}
     b06:	bf00      	nop
     b08:	20000058 	.word	0x20000058
     b0c:	00002d1c 	.word	0x00002d1c

00000b10 <cmd_pgerase>:

static void cmd_pgerase(){
     b10:	b580      	push	{r7, lr}
     b12:	b082      	sub	sp, #8
     b14:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     b16:	f000 f957 	bl	dc8 <word>
	adr=atoi((const char*)pad);
     b1a:	4809      	ldr	r0, [pc, #36]	; (b40 <cmd_pgerase+0x30>)
     b1c:	f7ff fc56 	bl	3cc <atoi>
     b20:	4603      	mov	r3, r0
     b22:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_FLASH_PGER,&adr,0);
     b24:	1d3b      	adds	r3, r7, #4
     b26:	2200      	movs	r2, #0
     b28:	4618      	mov	r0, r3
     b2a:	4611      	mov	r1, r2
     b2c:	df12      	svc	18
	if (!adr) print(" failed\n");
     b2e:	687b      	ldr	r3, [r7, #4]
     b30:	2b00      	cmp	r3, #0
     b32:	d102      	bne.n	b3a <cmd_pgerase+0x2a>
     b34:	4803      	ldr	r0, [pc, #12]	; (b44 <cmd_pgerase+0x34>)
     b36:	f000 fb99 	bl	126c <print>
}
     b3a:	3708      	adds	r7, #8
     b3c:	46bd      	mov	sp, r7
     b3e:	bd80      	pop	{r7, pc}
     b40:	20000058 	.word	0x20000058
     b44:	00002d1c 	.word	0x00002d1c

00000b48 <cmd_ticks>:

static void cmd_ticks(){
     b48:	b480      	push	{r7}
     b4a:	af00      	add	r7, sp, #0
	_svc_call(SVC_TICKS,&pad,0);
     b4c:	4b04      	ldr	r3, [pc, #16]	; (b60 <cmd_ticks+0x18>)
     b4e:	2200      	movs	r2, #0
     b50:	4618      	mov	r0, r3
     b52:	4611      	mov	r1, r2
     b54:	df13      	svc	19
}
     b56:	46bd      	mov	sp, r7
     b58:	f85d 7b04 	ldr.w	r7, [sp], #4
     b5c:	4770      	bx	lr
     b5e:	bf00      	nop
     b60:	20000058 	.word	0x20000058

00000b64 <cmd_con>:

static void cmd_con(){
     b64:	b580      	push	{r7, lr}
     b66:	b082      	sub	sp, #8
     b68:	af00      	add	r7, sp, #0
	console_dev_t dev;
	word();
     b6a:	f000 f92d 	bl	dc8 <word>
	if (!strcmp("local",(const char*)pad)){
     b6e:	4809      	ldr	r0, [pc, #36]	; (b94 <cmd_con+0x30>)
     b70:	4909      	ldr	r1, [pc, #36]	; (b98 <cmd_con+0x34>)
     b72:	f7ff fbad 	bl	2d0 <strcmp>
     b76:	4603      	mov	r3, r0
     b78:	2b00      	cmp	r3, #0
     b7a:	d102      	bne.n	b82 <cmd_con+0x1e>
		dev=LOCAL;
     b7c:	2300      	movs	r3, #0
     b7e:	71fb      	strb	r3, [r7, #7]
     b80:	e001      	b.n	b86 <cmd_con+0x22>
	}else{
		dev=SERIAL;
     b82:	2301      	movs	r3, #1
     b84:	71fb      	strb	r3, [r7, #7]
	}
	con_select(dev);
     b86:	79fb      	ldrb	r3, [r7, #7]
     b88:	4618      	mov	r0, r3
     b8a:	f000 fad1 	bl	1130 <con_select>
}
     b8e:	3708      	adds	r7, #8
     b90:	46bd      	mov	sp, r7
     b92:	bd80      	pop	{r7, pc}
     b94:	00002d28 	.word	0x00002d28
     b98:	20000058 	.word	0x20000058

00000b9c <search_command>:
	{"con",cmd_con},
	{NUL,NUL}
};


int search_command(const char * name){
     b9c:	b580      	push	{r7, lr}
     b9e:	b084      	sub	sp, #16
     ba0:	af00      	add	r7, sp, #0
     ba2:	6078      	str	r0, [r7, #4]
	int i=0;
     ba4:	2300      	movs	r3, #0
     ba6:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     ba8:	e00e      	b.n	bc8 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     baa:	4a12      	ldr	r2, [pc, #72]	; (bf4 <search_command+0x58>)
     bac:	68fb      	ldr	r3, [r7, #12]
     bae:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     bb2:	4618      	mov	r0, r3
     bb4:	6879      	ldr	r1, [r7, #4]
     bb6:	f7ff fb8b 	bl	2d0 <strcmp>
     bba:	4603      	mov	r3, r0
     bbc:	2b00      	cmp	r3, #0
     bbe:	d100      	bne.n	bc2 <search_command+0x26>
			break;
     bc0:	e009      	b.n	bd6 <search_command+0x3a>
		}
		i++;
     bc2:	68fb      	ldr	r3, [r7, #12]
     bc4:	3301      	adds	r3, #1
     bc6:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     bc8:	4a0a      	ldr	r2, [pc, #40]	; (bf4 <search_command+0x58>)
     bca:	68fb      	ldr	r3, [r7, #12]
     bcc:	00db      	lsls	r3, r3, #3
     bce:	4413      	add	r3, r2
     bd0:	685b      	ldr	r3, [r3, #4]
     bd2:	2b00      	cmp	r3, #0
     bd4:	d1e9      	bne.n	baa <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     bd6:	4a07      	ldr	r2, [pc, #28]	; (bf4 <search_command+0x58>)
     bd8:	68fb      	ldr	r3, [r7, #12]
     bda:	00db      	lsls	r3, r3, #3
     bdc:	4413      	add	r3, r2
     bde:	685b      	ldr	r3, [r3, #4]
     be0:	2b00      	cmp	r3, #0
     be2:	d102      	bne.n	bea <search_command+0x4e>
     be4:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     be8:	60fb      	str	r3, [r7, #12]
	return i;
     bea:	68fb      	ldr	r3, [r7, #12]
}
     bec:	4618      	mov	r0, r3
     bee:	3710      	adds	r7, #16
     bf0:	46bd      	mov	sp, r7
     bf2:	bd80      	pop	{r7, pc}
     bf4:	00002ddc 	.word	0x00002ddc

00000bf8 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     bf8:	b480      	push	{r7}
     bfa:	b085      	sub	sp, #20
     bfc:	af00      	add	r7, sp, #0
     bfe:	60f8      	str	r0, [r7, #12]
     c00:	60b9      	str	r1, [r7, #8]
     c02:	4613      	mov	r3, r2
     c04:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     c06:	e002      	b.n	c0e <skip+0x16>
     c08:	68bb      	ldr	r3, [r7, #8]
     c0a:	3301      	adds	r3, #1
     c0c:	60bb      	str	r3, [r7, #8]
     c0e:	68bb      	ldr	r3, [r7, #8]
     c10:	68fa      	ldr	r2, [r7, #12]
     c12:	4413      	add	r3, r2
     c14:	781b      	ldrb	r3, [r3, #0]
     c16:	2b00      	cmp	r3, #0
     c18:	d006      	beq.n	c28 <skip+0x30>
     c1a:	68bb      	ldr	r3, [r7, #8]
     c1c:	68fa      	ldr	r2, [r7, #12]
     c1e:	4413      	add	r3, r2
     c20:	781b      	ldrb	r3, [r3, #0]
     c22:	79fa      	ldrb	r2, [r7, #7]
     c24:	429a      	cmp	r2, r3
     c26:	d0ef      	beq.n	c08 <skip+0x10>
	return start;
     c28:	68bb      	ldr	r3, [r7, #8]
}
     c2a:	4618      	mov	r0, r3
     c2c:	3714      	adds	r7, #20
     c2e:	46bd      	mov	sp, r7
     c30:	f85d 7b04 	ldr.w	r7, [sp], #4
     c34:	4770      	bx	lr
     c36:	bf00      	nop

00000c38 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     c38:	b480      	push	{r7}
     c3a:	b085      	sub	sp, #20
     c3c:	af00      	add	r7, sp, #0
     c3e:	60f8      	str	r0, [r7, #12]
     c40:	60b9      	str	r1, [r7, #8]
     c42:	4613      	mov	r3, r2
     c44:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     c46:	e002      	b.n	c4e <scan+0x16>
     c48:	68bb      	ldr	r3, [r7, #8]
     c4a:	3301      	adds	r3, #1
     c4c:	60bb      	str	r3, [r7, #8]
     c4e:	68bb      	ldr	r3, [r7, #8]
     c50:	68fa      	ldr	r2, [r7, #12]
     c52:	4413      	add	r3, r2
     c54:	781b      	ldrb	r3, [r3, #0]
     c56:	2b00      	cmp	r3, #0
     c58:	d006      	beq.n	c68 <scan+0x30>
     c5a:	68bb      	ldr	r3, [r7, #8]
     c5c:	68fa      	ldr	r2, [r7, #12]
     c5e:	4413      	add	r3, r2
     c60:	781b      	ldrb	r3, [r3, #0]
     c62:	79fa      	ldrb	r2, [r7, #7]
     c64:	429a      	cmp	r2, r3
     c66:	d1ef      	bne.n	c48 <scan+0x10>
	return start;
     c68:	68bb      	ldr	r3, [r7, #8]
}
     c6a:	4618      	mov	r0, r3
     c6c:	3714      	adds	r7, #20
     c6e:	46bd      	mov	sp, r7
     c70:	f85d 7b04 	ldr.w	r7, [sp], #4
     c74:	4770      	bx	lr
     c76:	bf00      	nop

00000c78 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     c78:	b480      	push	{r7}
     c7a:	b087      	sub	sp, #28
     c7c:	af00      	add	r7, sp, #0
     c7e:	6078      	str	r0, [r7, #4]
     c80:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     c82:	2300      	movs	r3, #0
     c84:	617b      	str	r3, [r7, #20]
     c86:	683b      	ldr	r3, [r7, #0]
     c88:	613b      	str	r3, [r7, #16]
     c8a:	2300      	movs	r3, #0
     c8c:	60fb      	str	r3, [r7, #12]
     c8e:	2301      	movs	r3, #1
     c90:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     c92:	e040      	b.n	d16 <quote+0x9e>
		switch (buffer[end]){
     c94:	693b      	ldr	r3, [r7, #16]
     c96:	687a      	ldr	r2, [r7, #4]
     c98:	4413      	add	r3, r2
     c9a:	781b      	ldrb	r3, [r3, #0]
     c9c:	2b5c      	cmp	r3, #92	; 0x5c
     c9e:	d012      	beq.n	cc6 <quote+0x4e>
     ca0:	2b6e      	cmp	r3, #110	; 0x6e
     ca2:	d022      	beq.n	cea <quote+0x72>
     ca4:	2b22      	cmp	r3, #34	; 0x22
     ca6:	d128      	bne.n	cfa <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     ca8:	697b      	ldr	r3, [r7, #20]
     caa:	2b00      	cmp	r3, #0
     cac:	d102      	bne.n	cb4 <quote+0x3c>
     cae:	2300      	movs	r3, #0
     cb0:	60bb      	str	r3, [r7, #8]
			break;
     cb2:	e02d      	b.n	d10 <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     cb4:	68fb      	ldr	r3, [r7, #12]
     cb6:	1c5a      	adds	r2, r3, #1
     cb8:	60fa      	str	r2, [r7, #12]
     cba:	4a21      	ldr	r2, [pc, #132]	; (d40 <quote+0xc8>)
     cbc:	2122      	movs	r1, #34	; 0x22
     cbe:	54d1      	strb	r1, [r2, r3]
     cc0:	2300      	movs	r3, #0
     cc2:	617b      	str	r3, [r7, #20]
			break;
     cc4:	e024      	b.n	d10 <quote+0x98>
		case '\\':
			if (!escaped){
     cc6:	697b      	ldr	r3, [r7, #20]
     cc8:	2b00      	cmp	r3, #0
     cca:	d102      	bne.n	cd2 <quote+0x5a>
				escaped=1;
     ccc:	2301      	movs	r3, #1
     cce:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     cd0:	e01e      	b.n	d10 <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     cd2:	2300      	movs	r3, #0
     cd4:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     cd6:	68fb      	ldr	r3, [r7, #12]
     cd8:	1c5a      	adds	r2, r3, #1
     cda:	60fa      	str	r2, [r7, #12]
     cdc:	693a      	ldr	r2, [r7, #16]
     cde:	6879      	ldr	r1, [r7, #4]
     ce0:	440a      	add	r2, r1
     ce2:	7811      	ldrb	r1, [r2, #0]
     ce4:	4a16      	ldr	r2, [pc, #88]	; (d40 <quote+0xc8>)
     ce6:	54d1      	strb	r1, [r2, r3]
			}
			break;
     ce8:	e012      	b.n	d10 <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     cea:	697b      	ldr	r3, [r7, #20]
     cec:	2b00      	cmp	r3, #0
     cee:	d004      	beq.n	cfa <quote+0x82>
     cf0:	693b      	ldr	r3, [r7, #16]
     cf2:	687a      	ldr	r2, [r7, #4]
     cf4:	4413      	add	r3, r2
     cf6:	220d      	movs	r2, #13
     cf8:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     cfa:	2300      	movs	r3, #0
     cfc:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     cfe:	68fb      	ldr	r3, [r7, #12]
     d00:	1c5a      	adds	r2, r3, #1
     d02:	60fa      	str	r2, [r7, #12]
     d04:	693a      	ldr	r2, [r7, #16]
     d06:	6879      	ldr	r1, [r7, #4]
     d08:	440a      	add	r2, r1
     d0a:	7811      	ldrb	r1, [r2, #0]
     d0c:	4a0c      	ldr	r2, [pc, #48]	; (d40 <quote+0xc8>)
     d0e:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     d10:	693b      	ldr	r3, [r7, #16]
     d12:	3301      	adds	r3, #1
     d14:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     d16:	693b      	ldr	r3, [r7, #16]
     d18:	687a      	ldr	r2, [r7, #4]
     d1a:	4413      	add	r3, r2
     d1c:	781b      	ldrb	r3, [r3, #0]
     d1e:	2b00      	cmp	r3, #0
     d20:	d002      	beq.n	d28 <quote+0xb0>
     d22:	68bb      	ldr	r3, [r7, #8]
     d24:	2b00      	cmp	r3, #0
     d26:	d1b5      	bne.n	c94 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     d28:	4a05      	ldr	r2, [pc, #20]	; (d40 <quote+0xc8>)
     d2a:	68fb      	ldr	r3, [r7, #12]
     d2c:	4413      	add	r3, r2
     d2e:	2200      	movs	r2, #0
     d30:	701a      	strb	r2, [r3, #0]
	return end;
     d32:	693b      	ldr	r3, [r7, #16]
}
     d34:	4618      	mov	r0, r3
     d36:	371c      	adds	r7, #28
     d38:	46bd      	mov	sp, r7
     d3a:	f85d 7b04 	ldr.w	r7, [sp], #4
     d3e:	4770      	bx	lr
     d40:	20000058 	.word	0x20000058

00000d44 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     d44:	b480      	push	{r7}
     d46:	b087      	sub	sp, #28
     d48:	af00      	add	r7, sp, #0
     d4a:	60f8      	str	r0, [r7, #12]
     d4c:	60b9      	str	r1, [r7, #8]
     d4e:	4613      	mov	r3, r2
     d50:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     d52:	68bb      	ldr	r3, [r7, #8]
     d54:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     d56:	e002      	b.n	d5e <next+0x1a>
     d58:	697b      	ldr	r3, [r7, #20]
     d5a:	3301      	adds	r3, #1
     d5c:	617b      	str	r3, [r7, #20]
     d5e:	697b      	ldr	r3, [r7, #20]
     d60:	68fa      	ldr	r2, [r7, #12]
     d62:	4413      	add	r3, r2
     d64:	781b      	ldrb	r3, [r3, #0]
     d66:	2b00      	cmp	r3, #0
     d68:	d006      	beq.n	d78 <next+0x34>
     d6a:	697b      	ldr	r3, [r7, #20]
     d6c:	68fa      	ldr	r2, [r7, #12]
     d6e:	4413      	add	r3, r2
     d70:	781b      	ldrb	r3, [r3, #0]
     d72:	79fa      	ldrb	r2, [r7, #7]
     d74:	429a      	cmp	r2, r3
     d76:	d1ef      	bne.n	d58 <next+0x14>
	return end-start;
     d78:	697a      	ldr	r2, [r7, #20]
     d7a:	68bb      	ldr	r3, [r7, #8]
     d7c:	1ad3      	subs	r3, r2, r3
}
     d7e:	4618      	mov	r0, r3
     d80:	371c      	adds	r7, #28
     d82:	46bd      	mov	sp, r7
     d84:	f85d 7b04 	ldr.w	r7, [sp], #4
     d88:	4770      	bx	lr
     d8a:	bf00      	nop

00000d8c <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     d8c:	b480      	push	{r7}
     d8e:	b085      	sub	sp, #20
     d90:	af00      	add	r7, sp, #0
     d92:	60f8      	str	r0, [r7, #12]
     d94:	60b9      	str	r1, [r7, #8]
     d96:	607a      	str	r2, [r7, #4]
	while (len){
     d98:	e00a      	b.n	db0 <move+0x24>
		*dest++=*src++;
     d9a:	68bb      	ldr	r3, [r7, #8]
     d9c:	1c5a      	adds	r2, r3, #1
     d9e:	60ba      	str	r2, [r7, #8]
     da0:	68fa      	ldr	r2, [r7, #12]
     da2:	1c51      	adds	r1, r2, #1
     da4:	60f9      	str	r1, [r7, #12]
     da6:	7812      	ldrb	r2, [r2, #0]
     da8:	701a      	strb	r2, [r3, #0]
		len--;
     daa:	687b      	ldr	r3, [r7, #4]
     dac:	3b01      	subs	r3, #1
     dae:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     db0:	687b      	ldr	r3, [r7, #4]
     db2:	2b00      	cmp	r3, #0
     db4:	d1f1      	bne.n	d9a <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     db6:	68bb      	ldr	r3, [r7, #8]
     db8:	2200      	movs	r2, #0
     dba:	701a      	strb	r2, [r3, #0]
}
     dbc:	3714      	adds	r7, #20
     dbe:	46bd      	mov	sp, r7
     dc0:	f85d 7b04 	ldr.w	r7, [sp], #4
     dc4:	4770      	bx	lr
     dc6:	bf00      	nop

00000dc8 <word>:

// extrait le prochain mot du tib
static void word(){
     dc8:	b580      	push	{r7, lr}
     dca:	b082      	sub	sp, #8
     dcc:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     dce:	4b1d      	ldr	r3, [pc, #116]	; (e44 <word+0x7c>)
     dd0:	681b      	ldr	r3, [r3, #0]
     dd2:	481d      	ldr	r0, [pc, #116]	; (e48 <word+0x80>)
     dd4:	4619      	mov	r1, r3
     dd6:	2220      	movs	r2, #32
     dd8:	f7ff ff0e 	bl	bf8 <skip>
     ddc:	4603      	mov	r3, r0
     dde:	461a      	mov	r2, r3
     de0:	4b18      	ldr	r3, [pc, #96]	; (e44 <word+0x7c>)
     de2:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     de4:	4b17      	ldr	r3, [pc, #92]	; (e44 <word+0x7c>)
     de6:	681b      	ldr	r3, [r3, #0]
     de8:	4a17      	ldr	r2, [pc, #92]	; (e48 <word+0x80>)
     dea:	5cd3      	ldrb	r3, [r2, r3]
     dec:	2b22      	cmp	r3, #34	; 0x22
     dee:	d10f      	bne.n	e10 <word+0x48>
			in++;
     df0:	4b14      	ldr	r3, [pc, #80]	; (e44 <word+0x7c>)
     df2:	681b      	ldr	r3, [r3, #0]
     df4:	3301      	adds	r3, #1
     df6:	4a13      	ldr	r2, [pc, #76]	; (e44 <word+0x7c>)
     df8:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     dfa:	4b12      	ldr	r3, [pc, #72]	; (e44 <word+0x7c>)
     dfc:	681b      	ldr	r3, [r3, #0]
     dfe:	4812      	ldr	r0, [pc, #72]	; (e48 <word+0x80>)
     e00:	4619      	mov	r1, r3
     e02:	f7ff ff39 	bl	c78 <quote>
     e06:	4603      	mov	r3, r0
     e08:	461a      	mov	r2, r3
     e0a:	4b0e      	ldr	r3, [pc, #56]	; (e44 <word+0x7c>)
     e0c:	601a      	str	r2, [r3, #0]
     e0e:	e016      	b.n	e3e <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     e10:	4b0c      	ldr	r3, [pc, #48]	; (e44 <word+0x7c>)
     e12:	681b      	ldr	r3, [r3, #0]
     e14:	480c      	ldr	r0, [pc, #48]	; (e48 <word+0x80>)
     e16:	4619      	mov	r1, r3
     e18:	2220      	movs	r2, #32
     e1a:	f7ff ff93 	bl	d44 <next>
     e1e:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     e20:	4b08      	ldr	r3, [pc, #32]	; (e44 <word+0x7c>)
     e22:	681b      	ldr	r3, [r3, #0]
     e24:	4a08      	ldr	r2, [pc, #32]	; (e48 <word+0x80>)
     e26:	4413      	add	r3, r2
     e28:	4618      	mov	r0, r3
     e2a:	4908      	ldr	r1, [pc, #32]	; (e4c <word+0x84>)
     e2c:	687a      	ldr	r2, [r7, #4]
     e2e:	f7ff ffad 	bl	d8c <move>
			in+=len;
     e32:	4b04      	ldr	r3, [pc, #16]	; (e44 <word+0x7c>)
     e34:	681a      	ldr	r2, [r3, #0]
     e36:	687b      	ldr	r3, [r7, #4]
     e38:	4413      	add	r3, r2
     e3a:	4a02      	ldr	r2, [pc, #8]	; (e44 <word+0x7c>)
     e3c:	6013      	str	r3, [r2, #0]
		}
}
     e3e:	3708      	adds	r7, #8
     e40:	46bd      	mov	sp, r7
     e42:	bd80      	pop	{r7, pc}
     e44:	200000a8 	.word	0x200000a8
     e48:	20000008 	.word	0x20000008
     e4c:	20000058 	.word	0x20000058

00000e50 <parse_line>:

static void parse_line(unsigned llen){
     e50:	b580      	push	{r7, lr}
     e52:	b084      	sub	sp, #16
     e54:	af00      	add	r7, sp, #0
     e56:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     e58:	4b14      	ldr	r3, [pc, #80]	; (eac <parse_line+0x5c>)
     e5a:	2200      	movs	r2, #0
     e5c:	601a      	str	r2, [r3, #0]
	while (in<llen){
     e5e:	e019      	b.n	e94 <parse_line+0x44>
		word();
     e60:	f7ff ffb2 	bl	dc8 <word>
		cmd_id=search_command((const char*) pad);
     e64:	4812      	ldr	r0, [pc, #72]	; (eb0 <parse_line+0x60>)
     e66:	f7ff fe99 	bl	b9c <search_command>
     e6a:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     e6c:	68fb      	ldr	r3, [r7, #12]
     e6e:	2b00      	cmp	r3, #0
     e70:	db06      	blt.n	e80 <parse_line+0x30>
			commands[cmd_id].fn();
     e72:	4a10      	ldr	r2, [pc, #64]	; (eb4 <parse_line+0x64>)
     e74:	68fb      	ldr	r3, [r7, #12]
     e76:	00db      	lsls	r3, r3, #3
     e78:	4413      	add	r3, r2
     e7a:	685b      	ldr	r3, [r3, #4]
     e7c:	4798      	blx	r3
     e7e:	e009      	b.n	e94 <parse_line+0x44>
		}else{
			conout(CR);
     e80:	200d      	movs	r0, #13
     e82:	f000 f9d9 	bl	1238 <conout>
			print((const char*)pad); conout('?');
     e86:	480a      	ldr	r0, [pc, #40]	; (eb0 <parse_line+0x60>)
     e88:	f000 f9f0 	bl	126c <print>
     e8c:	203f      	movs	r0, #63	; 0x3f
     e8e:	f000 f9d3 	bl	1238 <conout>
			break;
     e92:	e004      	b.n	e9e <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     e94:	4b05      	ldr	r3, [pc, #20]	; (eac <parse_line+0x5c>)
     e96:	681a      	ldr	r2, [r3, #0]
     e98:	687b      	ldr	r3, [r7, #4]
     e9a:	429a      	cmp	r2, r3
     e9c:	d3e0      	bcc.n	e60 <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     e9e:	200d      	movs	r0, #13
     ea0:	f000 f9ca 	bl	1238 <conout>
}
     ea4:	3710      	adds	r7, #16
     ea6:	46bd      	mov	sp, r7
     ea8:	bd80      	pop	{r7, pc}
     eaa:	bf00      	nop
     eac:	200000a8 	.word	0x200000a8
     eb0:	20000058 	.word	0x20000058
     eb4:	00002ddc 	.word	0x00002ddc

00000eb8 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     eb8:	b480      	push	{r7}
     eba:	b085      	sub	sp, #20
     ebc:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     ebe:	4b0c      	ldr	r3, [pc, #48]	; (ef0 <copy_blink_in_ram+0x38>)
     ec0:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     ec2:	4b0c      	ldr	r3, [pc, #48]	; (ef4 <copy_blink_in_ram+0x3c>)
     ec4:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     ec6:	4b0c      	ldr	r3, [pc, #48]	; (ef8 <copy_blink_in_ram+0x40>)
     ec8:	60bb      	str	r3, [r7, #8]
	while (start<end){
     eca:	e007      	b.n	edc <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     ecc:	68bb      	ldr	r3, [r7, #8]
     ece:	1d1a      	adds	r2, r3, #4
     ed0:	60ba      	str	r2, [r7, #8]
     ed2:	68fa      	ldr	r2, [r7, #12]
     ed4:	1d11      	adds	r1, r2, #4
     ed6:	60f9      	str	r1, [r7, #12]
     ed8:	6812      	ldr	r2, [r2, #0]
     eda:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     edc:	68fa      	ldr	r2, [r7, #12]
     ede:	687b      	ldr	r3, [r7, #4]
     ee0:	429a      	cmp	r2, r3
     ee2:	d3f3      	bcc.n	ecc <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     ee4:	3714      	adds	r7, #20
     ee6:	46bd      	mov	sp, r7
     ee8:	f85d 7b04 	ldr.w	r7, [sp], #4
     eec:	4770      	bx	lr
     eee:	bf00      	nop
     ef0:	00003400 	.word	0x00003400
     ef4:	00003480 	.word	0x00003480
     ef8:	20002700 	.word	0x20002700

00000efc <main>:

extern void print_fault(const char *msg, sfrp_t adr);
const char PROMPT[]=" OK\n";


void main(void){
     efc:	b580      	push	{r7, lr}
     efe:	b082      	sub	sp, #8
     f00:	af00      	add	r7, sp, #0
	set_sysclock();
     f02:	f7ff fc09 	bl	718 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     f06:	f06f 000a 	mvn.w	r0, #10
     f0a:	210f      	movs	r1, #15
     f0c:	f001 fa78 	bl	2400 <set_int_priority>
	config_systicks();
     f10:	f001 fc02 	bl	2718 <config_systicks>
	flash_enable();
     f14:	f000 fb5c 	bl	15d0 <flash_enable>
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
     f18:	4b1d      	ldr	r3, [pc, #116]	; (f90 <main+0x94>)
     f1a:	221d      	movs	r2, #29
     f1c:	619a      	str	r2, [r3, #24]
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
     f1e:	4b1c      	ldr	r3, [pc, #112]	; (f90 <main+0x94>)
     f20:	f44f 4280 	mov.w	r2, #16384	; 0x4000
     f24:	61da      	str	r2, [r3, #28]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     f26:	4a1a      	ldr	r2, [pc, #104]	; (f90 <main+0x94>)
     f28:	4b19      	ldr	r3, [pc, #100]	; (f90 <main+0x94>)
     f2a:	695b      	ldr	r3, [r3, #20]
     f2c:	f043 0301 	orr.w	r3, r3, #1
     f30:	6153      	str	r3, [r2, #20]
	config_pin(LED_PORT,LED_PIN,OUTPUT_OD_SLOW);
     f32:	4818      	ldr	r0, [pc, #96]	; (f94 <main+0x98>)
     f34:	210d      	movs	r1, #13
     f36:	2206      	movs	r2, #6
     f38:	f000 fe84 	bl	1c44 <config_pin>
	keyboard_init();
     f3c:	f000 fefc 	bl	1d38 <keyboard_init>
	tvout_init();
     f40:	f001 fc36 	bl	27b0 <tvout_init>
	console_init(SERIAL);
     f44:	2001      	movs	r0, #1
     f46:	f000 f925 	bl	1194 <console_init>
	cls();
     f4a:	f000 fb39 	bl	15c0 <cls>
	print(VERSION);
     f4e:	4b12      	ldr	r3, [pc, #72]	; (f98 <main+0x9c>)
     f50:	681b      	ldr	r3, [r3, #0]
     f52:	4618      	mov	r0, r3
     f54:	f000 f98a 	bl	126c <print>
	copy_blink_in_ram();
     f58:	f7ff ffae 	bl	eb8 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
     f5c:	480f      	ldr	r0, [pc, #60]	; (f9c <main+0xa0>)
     f5e:	f000 f985 	bl	126c <print>
     f62:	4b0f      	ldr	r3, [pc, #60]	; (fa0 <main+0xa4>)
     f64:	2200      	movs	r2, #0
     f66:	4618      	mov	r0, r3
     f68:	4611      	mov	r1, r2
     f6a:	df0a      	svc	10
     f6c:	200d      	movs	r0, #13
     f6e:	f000 f963 	bl	1238 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     f72:	2300      	movs	r3, #0
     f74:	2200      	movs	r2, #0
     f76:	4618      	mov	r0, r3
     f78:	4611      	mov	r1, r2
     f7a:	df01      	svc	1
	
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
     f7c:	4809      	ldr	r0, [pc, #36]	; (fa4 <main+0xa8>)
     f7e:	2150      	movs	r1, #80	; 0x50
     f80:	f000 f998 	bl	12b4 <read_line>
     f84:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     f86:	6878      	ldr	r0, [r7, #4]
     f88:	f7ff ff62 	bl	e50 <parse_line>
	}
     f8c:	e7f6      	b.n	f7c <main+0x80>
     f8e:	bf00      	nop
     f90:	40021000 	.word	0x40021000
     f94:	40011000 	.word	0x40011000
     f98:	20000000 	.word	0x20000000
     f9c:	00002e9c 	.word	0x00002e9c
     fa0:	200000e4 	.word	0x200000e4
     fa4:	20000008 	.word	0x20000008

00000fa8 <queue_insert>:
#include "gdi.h"

console_t con;


static void queue_insert(char c){
     fa8:	b480      	push	{r7}
     faa:	b083      	sub	sp, #12
     fac:	af00      	add	r7, sp, #0
     fae:	4603      	mov	r3, r0
     fb0:	71fb      	strb	r3, [r7, #7]
		con.queue[con.head++]=c;
     fb2:	4b0a      	ldr	r3, [pc, #40]	; (fdc <queue_insert+0x34>)
     fb4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     fb6:	1c5a      	adds	r2, r3, #1
     fb8:	4908      	ldr	r1, [pc, #32]	; (fdc <queue_insert+0x34>)
     fba:	624a      	str	r2, [r1, #36]	; 0x24
     fbc:	4a07      	ldr	r2, [pc, #28]	; (fdc <queue_insert+0x34>)
     fbe:	4413      	add	r3, r2
     fc0:	79fa      	ldrb	r2, [r7, #7]
     fc2:	705a      	strb	r2, [r3, #1]
		con.head&=CON_QUEUE_SIZE-1;
     fc4:	4b05      	ldr	r3, [pc, #20]	; (fdc <queue_insert+0x34>)
     fc6:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     fc8:	f003 031f 	and.w	r3, r3, #31
     fcc:	4a03      	ldr	r2, [pc, #12]	; (fdc <queue_insert+0x34>)
     fce:	6253      	str	r3, [r2, #36]	; 0x24
}
     fd0:	370c      	adds	r7, #12
     fd2:	46bd      	mov	sp, r7
     fd4:	f85d 7b04 	ldr.w	r7, [sp], #4
     fd8:	4770      	bx	lr
     fda:	bf00      	nop
     fdc:	200000e8 	.word	0x200000e8

00000fe0 <queue_getc>:

static char queue_getc(){
     fe0:	b480      	push	{r7}
     fe2:	b083      	sub	sp, #12
     fe4:	af00      	add	r7, sp, #0
	char c=0;
     fe6:	2300      	movs	r3, #0
     fe8:	71fb      	strb	r3, [r7, #7]
	if (con.tail!=con.head){
     fea:	4b0e      	ldr	r3, [pc, #56]	; (1024 <queue_getc+0x44>)
     fec:	6a9a      	ldr	r2, [r3, #40]	; 0x28
     fee:	4b0d      	ldr	r3, [pc, #52]	; (1024 <queue_getc+0x44>)
     ff0:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     ff2:	429a      	cmp	r2, r3
     ff4:	d00e      	beq.n	1014 <queue_getc+0x34>
		c=con.queue[con.tail++];
     ff6:	4b0b      	ldr	r3, [pc, #44]	; (1024 <queue_getc+0x44>)
     ff8:	6a9b      	ldr	r3, [r3, #40]	; 0x28
     ffa:	1c5a      	adds	r2, r3, #1
     ffc:	4909      	ldr	r1, [pc, #36]	; (1024 <queue_getc+0x44>)
     ffe:	628a      	str	r2, [r1, #40]	; 0x28
    1000:	4a08      	ldr	r2, [pc, #32]	; (1024 <queue_getc+0x44>)
    1002:	4413      	add	r3, r2
    1004:	785b      	ldrb	r3, [r3, #1]
    1006:	71fb      	strb	r3, [r7, #7]
		con.tail&=CON_QUEUE_SIZE-1;
    1008:	4b06      	ldr	r3, [pc, #24]	; (1024 <queue_getc+0x44>)
    100a:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    100c:	f003 031f 	and.w	r3, r3, #31
    1010:	4a04      	ldr	r2, [pc, #16]	; (1024 <queue_getc+0x44>)
    1012:	6293      	str	r3, [r2, #40]	; 0x28
	}
	return c;
    1014:	79fb      	ldrb	r3, [r7, #7]
}
    1016:	4618      	mov	r0, r3
    1018:	370c      	adds	r7, #12
    101a:	46bd      	mov	sp, r7
    101c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1020:	4770      	bx	lr
    1022:	bf00      	nop
    1024:	200000e8 	.word	0x200000e8

00001028 <con_queue_flush>:

void con_queue_flush(){
    1028:	b480      	push	{r7}
    102a:	af00      	add	r7, sp, #0
	con.tail=con.head=0;
    102c:	2300      	movs	r3, #0
    102e:	4a04      	ldr	r2, [pc, #16]	; (1040 <con_queue_flush+0x18>)
    1030:	6253      	str	r3, [r2, #36]	; 0x24
    1032:	4a03      	ldr	r2, [pc, #12]	; (1040 <con_queue_flush+0x18>)
    1034:	6293      	str	r3, [r2, #40]	; 0x28
}
    1036:	46bd      	mov	sp, r7
    1038:	f85d 7b04 	ldr.w	r7, [sp], #4
    103c:	4770      	bx	lr
    103e:	bf00      	nop
    1040:	200000e8 	.word	0x200000e8

00001044 <vt_putc>:

static void vt_putc(char c){
    1044:	b580      	push	{r7, lr}
    1046:	b082      	sub	sp, #8
    1048:	af00      	add	r7, sp, #0
    104a:	4603      	mov	r3, r0
    104c:	71fb      	strb	r3, [r7, #7]
	usart_putc(SERIAL_USART,c);
    104e:	79fb      	ldrb	r3, [r7, #7]
    1050:	4803      	ldr	r0, [pc, #12]	; (1060 <vt_putc+0x1c>)
    1052:	4619      	mov	r1, r3
    1054:	f001 fe42 	bl	2cdc <usart_putc>
}
    1058:	3708      	adds	r7, #8
    105a:	46bd      	mov	sp, r7
    105c:	bd80      	pop	{r7, pc}
    105e:	bf00      	nop
    1060:	40004400 	.word	0x40004400

00001064 <vt_del_back>:

static void vt_del_back(){
    1064:	b580      	push	{r7, lr}
    1066:	af00      	add	r7, sp, #0
	con.putc(BS);
    1068:	4b06      	ldr	r3, [pc, #24]	; (1084 <vt_del_back+0x20>)
    106a:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    106c:	2008      	movs	r0, #8
    106e:	4798      	blx	r3
	con.putc(SPACE);
    1070:	4b04      	ldr	r3, [pc, #16]	; (1084 <vt_del_back+0x20>)
    1072:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1074:	2020      	movs	r0, #32
    1076:	4798      	blx	r3
	con.putc(BS);
    1078:	4b02      	ldr	r3, [pc, #8]	; (1084 <vt_del_back+0x20>)
    107a:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    107c:	2008      	movs	r0, #8
    107e:	4798      	blx	r3
}
    1080:	bd80      	pop	{r7, pc}
    1082:	bf00      	nop
    1084:	200000e8 	.word	0x200000e8

00001088 <vt_esc_seq>:

static void vt_esc_seq(){
    1088:	b580      	push	{r7, lr}
    108a:	af00      	add	r7, sp, #0
	con.putc(ESC);
    108c:	4b04      	ldr	r3, [pc, #16]	; (10a0 <vt_esc_seq+0x18>)
    108e:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1090:	201b      	movs	r0, #27
    1092:	4798      	blx	r3
	con.putc('[');
    1094:	4b02      	ldr	r3, [pc, #8]	; (10a0 <vt_esc_seq+0x18>)
    1096:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1098:	205b      	movs	r0, #91	; 0x5b
    109a:	4798      	blx	r3
}
    109c:	bd80      	pop	{r7, pc}
    109e:	bf00      	nop
    10a0:	200000e8 	.word	0x200000e8

000010a4 <vt_cls>:


// vide l'écran de la console
static void vt_cls(){
    10a4:	b580      	push	{r7, lr}
    10a6:	af00      	add	r7, sp, #0
	vt_esc_seq();
    10a8:	f7ff ffee 	bl	1088 <vt_esc_seq>
	con.putc('2');
    10ac:	4b04      	ldr	r3, [pc, #16]	; (10c0 <vt_cls+0x1c>)
    10ae:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    10b0:	2032      	movs	r0, #50	; 0x32
    10b2:	4798      	blx	r3
	con.putc('J');
    10b4:	4b02      	ldr	r3, [pc, #8]	; (10c0 <vt_cls+0x1c>)
    10b6:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    10b8:	204a      	movs	r0, #74	; 0x4a
    10ba:	4798      	blx	r3
}
    10bc:	bd80      	pop	{r7, pc}
    10be:	bf00      	nop
    10c0:	200000e8 	.word	0x200000e8

000010c4 <vt_clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
static void vt_clear_line(unsigned n){
    10c4:	b580      	push	{r7, lr}
    10c6:	b082      	sub	sp, #8
    10c8:	af00      	add	r7, sp, #0
    10ca:	6078      	str	r0, [r7, #4]
	vt_esc_seq();
    10cc:	f7ff ffdc 	bl	1088 <vt_esc_seq>
	con.putc('2');
    10d0:	4b0a      	ldr	r3, [pc, #40]	; (10fc <vt_clear_line+0x38>)
    10d2:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    10d4:	2032      	movs	r0, #50	; 0x32
    10d6:	4798      	blx	r3
	con.putc('K');
    10d8:	4b08      	ldr	r3, [pc, #32]	; (10fc <vt_clear_line+0x38>)
    10da:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    10dc:	204b      	movs	r0, #75	; 0x4b
    10de:	4798      	blx	r3
	while (n){con.putc(BS);n--;}
    10e0:	e006      	b.n	10f0 <vt_clear_line+0x2c>
    10e2:	4b06      	ldr	r3, [pc, #24]	; (10fc <vt_clear_line+0x38>)
    10e4:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    10e6:	2008      	movs	r0, #8
    10e8:	4798      	blx	r3
    10ea:	687b      	ldr	r3, [r7, #4]
    10ec:	3b01      	subs	r3, #1
    10ee:	607b      	str	r3, [r7, #4]
    10f0:	687b      	ldr	r3, [r7, #4]
    10f2:	2b00      	cmp	r3, #0
    10f4:	d1f5      	bne.n	10e2 <vt_clear_line+0x1e>
}
    10f6:	3708      	adds	r7, #8
    10f8:	46bd      	mov	sp, r7
    10fa:	bd80      	pop	{r7, pc}
    10fc:	200000e8 	.word	0x200000e8

00001100 <USART2_handler>:

// interruption serial console
void SERIAL_handler(){
    1100:	b580      	push	{r7, lr}
    1102:	af00      	add	r7, sp, #0
	if ((con.dev==SERIAL) && (SERIAL_USART->SR&USART_SR_RXNE)){
    1104:	4b08      	ldr	r3, [pc, #32]	; (1128 <USART2_handler+0x28>)
    1106:	781b      	ldrb	r3, [r3, #0]
    1108:	2b01      	cmp	r3, #1
    110a:	d10c      	bne.n	1126 <USART2_handler+0x26>
    110c:	4b07      	ldr	r3, [pc, #28]	; (112c <USART2_handler+0x2c>)
    110e:	681b      	ldr	r3, [r3, #0]
    1110:	f003 0320 	and.w	r3, r3, #32
    1114:	2b00      	cmp	r3, #0
    1116:	d006      	beq.n	1126 <USART2_handler+0x26>
		con.insert(SERIAL_USART->DR);
    1118:	4b03      	ldr	r3, [pc, #12]	; (1128 <USART2_handler+0x28>)
    111a:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    111c:	4a03      	ldr	r2, [pc, #12]	; (112c <USART2_handler+0x2c>)
    111e:	6852      	ldr	r2, [r2, #4]
    1120:	b2d2      	uxtb	r2, r2
    1122:	4610      	mov	r0, r2
    1124:	4798      	blx	r3
	}
}
    1126:	bd80      	pop	{r7, pc}
    1128:	200000e8 	.word	0x200000e8
    112c:	40004400 	.word	0x40004400

00001130 <con_select>:

void con_select(console_dev_t dev){
    1130:	b580      	push	{r7, lr}
    1132:	b082      	sub	sp, #8
    1134:	af00      	add	r7, sp, #0
    1136:	4603      	mov	r3, r0
    1138:	71fb      	strb	r3, [r7, #7]
	con_queue_flush();
    113a:	f7ff ff75 	bl	1028 <con_queue_flush>
	con.dev=dev;
    113e:	4a0e      	ldr	r2, [pc, #56]	; (1178 <con_select+0x48>)
    1140:	79fb      	ldrb	r3, [r7, #7]
    1142:	7013      	strb	r3, [r2, #0]
	if (dev==LOCAL){
    1144:	79fb      	ldrb	r3, [r7, #7]
    1146:	2b00      	cmp	r3, #0
    1148:	d109      	bne.n	115e <con_select+0x2e>
		con.putc=gdi_putc;
    114a:	4b0b      	ldr	r3, [pc, #44]	; (1178 <con_select+0x48>)
    114c:	4a0b      	ldr	r2, [pc, #44]	; (117c <con_select+0x4c>)
    114e:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=gdi_clear_screen;
    1150:	4b09      	ldr	r3, [pc, #36]	; (1178 <con_select+0x48>)
    1152:	4a0b      	ldr	r2, [pc, #44]	; (1180 <con_select+0x50>)
    1154:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=gdi_del_back;
    1156:	4b08      	ldr	r3, [pc, #32]	; (1178 <con_select+0x48>)
    1158:	4a0a      	ldr	r2, [pc, #40]	; (1184 <con_select+0x54>)
    115a:	639a      	str	r2, [r3, #56]	; 0x38
    115c:	e008      	b.n	1170 <con_select+0x40>
	}else{
		con.putc=vt_putc;
    115e:	4b06      	ldr	r3, [pc, #24]	; (1178 <con_select+0x48>)
    1160:	4a09      	ldr	r2, [pc, #36]	; (1188 <con_select+0x58>)
    1162:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=vt_cls;
    1164:	4b04      	ldr	r3, [pc, #16]	; (1178 <con_select+0x48>)
    1166:	4a09      	ldr	r2, [pc, #36]	; (118c <con_select+0x5c>)
    1168:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=vt_del_back;
    116a:	4b03      	ldr	r3, [pc, #12]	; (1178 <con_select+0x48>)
    116c:	4a08      	ldr	r2, [pc, #32]	; (1190 <con_select+0x60>)
    116e:	639a      	str	r2, [r3, #56]	; 0x38
	}
}
    1170:	3708      	adds	r7, #8
    1172:	46bd      	mov	sp, r7
    1174:	bd80      	pop	{r7, pc}
    1176:	bf00      	nop
    1178:	200000e8 	.word	0x200000e8
    117c:	00001b51 	.word	0x00001b51
    1180:	00001785 	.word	0x00001785
    1184:	00001b21 	.word	0x00001b21
    1188:	00001045 	.word	0x00001045
    118c:	000010a5 	.word	0x000010a5
    1190:	00001065 	.word	0x00001065

00001194 <console_init>:

void console_init(console_dev_t dev){
    1194:	b580      	push	{r7, lr}
    1196:	b082      	sub	sp, #8
    1198:	af00      	add	r7, sp, #0
    119a:	4603      	mov	r3, r0
    119c:	71fb      	strb	r3, [r7, #7]
	// activation clock USART2
	RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    119e:	4a20      	ldr	r2, [pc, #128]	; (1220 <console_init+0x8c>)
    11a0:	4b1f      	ldr	r3, [pc, #124]	; (1220 <console_init+0x8c>)
    11a2:	69db      	ldr	r3, [r3, #28]
    11a4:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    11a8:	61d3      	str	r3, [r2, #28]
	//configure USART pins
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    11aa:	4a1d      	ldr	r2, [pc, #116]	; (1220 <console_init+0x8c>)
    11ac:	4b1c      	ldr	r3, [pc, #112]	; (1220 <console_init+0x8c>)
    11ae:	699b      	ldr	r3, [r3, #24]
    11b0:	f043 0304 	orr.w	r3, r3, #4
    11b4:	6193      	str	r3, [r2, #24]
	// PA0 -> CTS input   (floating)
	// PA1 -> RTS output  (push-pull)
	// PA2 -> TX  output (push-pull)
	// PA3 -> RX input (floating)
	usart_set_baud(SERIAL_USART,115200);
    11b6:	481b      	ldr	r0, [pc, #108]	; (1224 <console_init+0x90>)
    11b8:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
    11bc:	f001 fc42 	bl	2a44 <usart_set_baud>
	SERIAL_PORT->CR[0]&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    11c0:	4a19      	ldr	r2, [pc, #100]	; (1228 <console_init+0x94>)
    11c2:	4b19      	ldr	r3, [pc, #100]	; (1228 <console_init+0x94>)
    11c4:	681b      	ldr	r3, [r3, #0]
    11c6:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    11ca:	6013      	str	r3, [r2, #0]
	SERIAL_PORT->CR[0]|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    11cc:	4a16      	ldr	r2, [pc, #88]	; (1228 <console_init+0x94>)
    11ce:	4b16      	ldr	r3, [pc, #88]	; (1228 <console_init+0x94>)
    11d0:	681b      	ldr	r3, [r3, #0]
    11d2:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    11d6:	6013      	str	r3, [r2, #0]
	SERIAL_USART->CR1|=USART_CR1_TE|USART_CR1_RE|USART_CR1_RXNEIE;
    11d8:	4a12      	ldr	r2, [pc, #72]	; (1224 <console_init+0x90>)
    11da:	4b12      	ldr	r3, [pc, #72]	; (1224 <console_init+0x90>)
    11dc:	68db      	ldr	r3, [r3, #12]
    11de:	f043 032c 	orr.w	r3, r3, #44	; 0x2c
    11e2:	60d3      	str	r3, [r2, #12]
	SERIAL_USART->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    11e4:	4b0f      	ldr	r3, [pc, #60]	; (1224 <console_init+0x90>)
    11e6:	f44f 7240 	mov.w	r2, #768	; 0x300
    11ea:	615a      	str	r2, [r3, #20]
	set_int_priority(IRQ_SERIAL,7);
    11ec:	2026      	movs	r0, #38	; 0x26
    11ee:	2107      	movs	r1, #7
    11f0:	f001 f906 	bl	2400 <set_int_priority>
	enable_interrupt(IRQ_SERIAL);
    11f4:	2026      	movs	r0, #38	; 0x26
    11f6:	f001 f837 	bl	2268 <enable_interrupt>
	SERIAL_USART->CR1|=USART_CR1_UE;
    11fa:	4a0a      	ldr	r2, [pc, #40]	; (1224 <console_init+0x90>)
    11fc:	4b09      	ldr	r3, [pc, #36]	; (1224 <console_init+0x90>)
    11fe:	68db      	ldr	r3, [r3, #12]
    1200:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
    1204:	60d3      	str	r3, [r2, #12]
	con.getc=queue_getc;
    1206:	4b09      	ldr	r3, [pc, #36]	; (122c <console_init+0x98>)
    1208:	4a09      	ldr	r2, [pc, #36]	; (1230 <console_init+0x9c>)
    120a:	631a      	str	r2, [r3, #48]	; 0x30
	con.insert=queue_insert;
    120c:	4b07      	ldr	r3, [pc, #28]	; (122c <console_init+0x98>)
    120e:	4a09      	ldr	r2, [pc, #36]	; (1234 <console_init+0xa0>)
    1210:	62da      	str	r2, [r3, #44]	; 0x2c
	con_select(dev);
    1212:	79fb      	ldrb	r3, [r7, #7]
    1214:	4618      	mov	r0, r3
    1216:	f7ff ff8b 	bl	1130 <con_select>
}
    121a:	3708      	adds	r7, #8
    121c:	46bd      	mov	sp, r7
    121e:	bd80      	pop	{r7, pc}
    1220:	40021000 	.word	0x40021000
    1224:	40004400 	.word	0x40004400
    1228:	40010800 	.word	0x40010800
    122c:	200000e8 	.word	0x200000e8
    1230:	00000fe1 	.word	0x00000fe1
    1234:	00000fa9 	.word	0x00000fa9

00001238 <conout>:

// envoie d'un caractère à la console
void conout(char c){
    1238:	b580      	push	{r7, lr}
    123a:	b082      	sub	sp, #8
    123c:	af00      	add	r7, sp, #0
    123e:	4603      	mov	r3, r0
    1240:	71fb      	strb	r3, [r7, #7]
	con.putc(c);
    1242:	4b04      	ldr	r3, [pc, #16]	; (1254 <conout+0x1c>)
    1244:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1246:	79fa      	ldrb	r2, [r7, #7]
    1248:	4610      	mov	r0, r2
    124a:	4798      	blx	r3
}
    124c:	3708      	adds	r7, #8
    124e:	46bd      	mov	sp, r7
    1250:	bd80      	pop	{r7, pc}
    1252:	bf00      	nop
    1254:	200000e8 	.word	0x200000e8

00001258 <conin>:


// réception d'un caractère de la console
char conin(){
    1258:	b580      	push	{r7, lr}
    125a:	af00      	add	r7, sp, #0
	return con.getc();
    125c:	4b02      	ldr	r3, [pc, #8]	; (1268 <conin+0x10>)
    125e:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    1260:	4798      	blx	r3
    1262:	4603      	mov	r3, r0
}
    1264:	4618      	mov	r0, r3
    1266:	bd80      	pop	{r7, pc}
    1268:	200000e8 	.word	0x200000e8

0000126c <print>:

// imprime un chaîne sur la console
void print(const char *str){
    126c:	b580      	push	{r7, lr}
    126e:	b082      	sub	sp, #8
    1270:	af00      	add	r7, sp, #0
    1272:	6078      	str	r0, [r7, #4]
	while (*str) {con.putc(*str++);}
    1274:	e007      	b.n	1286 <print+0x1a>
    1276:	4b07      	ldr	r3, [pc, #28]	; (1294 <print+0x28>)
    1278:	6b5a      	ldr	r2, [r3, #52]	; 0x34
    127a:	687b      	ldr	r3, [r7, #4]
    127c:	1c59      	adds	r1, r3, #1
    127e:	6079      	str	r1, [r7, #4]
    1280:	781b      	ldrb	r3, [r3, #0]
    1282:	4618      	mov	r0, r3
    1284:	4790      	blx	r2
    1286:	687b      	ldr	r3, [r7, #4]
    1288:	781b      	ldrb	r3, [r3, #0]
    128a:	2b00      	cmp	r3, #0
    128c:	d1f3      	bne.n	1276 <print+0xa>
}
    128e:	3708      	adds	r7, #8
    1290:	46bd      	mov	sp, r7
    1292:	bd80      	pop	{r7, pc}
    1294:	200000e8 	.word	0x200000e8

00001298 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    1298:	b580      	push	{r7, lr}
    129a:	af00      	add	r7, sp, #0
	con.delete_back();
    129c:	4b01      	ldr	r3, [pc, #4]	; (12a4 <delete_back+0xc>)
    129e:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    12a0:	4798      	blx	r3
}
    12a2:	bd80      	pop	{r7, pc}
    12a4:	200000e8 	.word	0x200000e8

000012a8 <beep>:

static void beep(){
    12a8:	b480      	push	{r7}
    12aa:	af00      	add	r7, sp, #0
}
    12ac:	46bd      	mov	sp, r7
    12ae:	f85d 7b04 	ldr.w	r7, [sp], #4
    12b2:	4770      	bx	lr

000012b4 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    12b4:	b580      	push	{r7, lr}
    12b6:	b084      	sub	sp, #16
    12b8:	af00      	add	r7, sp, #0
    12ba:	6078      	str	r0, [r7, #4]
    12bc:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    12be:	2300      	movs	r3, #0
    12c0:	60fb      	str	r3, [r7, #12]
	char c=0;
    12c2:	2300      	movs	r3, #0
    12c4:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    12c6:	683b      	ldr	r3, [r7, #0]
    12c8:	3b01      	subs	r3, #1
    12ca:	603b      	str	r3, [r7, #0]
	while (c!=13){
    12cc:	e098      	b.n	1400 <read_line+0x14c>
			c=con.getc();
    12ce:	4b53      	ldr	r3, [pc, #332]	; (141c <read_line+0x168>)
    12d0:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    12d2:	4798      	blx	r3
    12d4:	4603      	mov	r3, r0
    12d6:	72fb      	strb	r3, [r7, #11]
			switch(c){
    12d8:	7afb      	ldrb	r3, [r7, #11]
    12da:	2b18      	cmp	r3, #24
    12dc:	d87a      	bhi.n	13d4 <read_line+0x120>
    12de:	a201      	add	r2, pc, #4	; (adr r2, 12e4 <read_line+0x30>)
    12e0:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    12e4:	00001401 	.word	0x00001401
    12e8:	000013d5 	.word	0x000013d5
    12ec:	000013d5 	.word	0x000013d5
    12f0:	000013d5 	.word	0x000013d5
    12f4:	000013d5 	.word	0x000013d5
    12f8:	000013c5 	.word	0x000013c5
    12fc:	000013d5 	.word	0x000013d5
    1300:	000013d5 	.word	0x000013d5
    1304:	000013b1 	.word	0x000013b1
    1308:	000013d1 	.word	0x000013d1
    130c:	00001349 	.word	0x00001349
    1310:	000013d5 	.word	0x000013d5
    1314:	000013d5 	.word	0x000013d5
    1318:	00001349 	.word	0x00001349
    131c:	000013d5 	.word	0x000013d5
    1320:	000013d5 	.word	0x000013d5
    1324:	000013d5 	.word	0x000013d5
    1328:	000013d5 	.word	0x000013d5
    132c:	000013d5 	.word	0x000013d5
    1330:	000013d5 	.word	0x000013d5
    1334:	000013d5 	.word	0x000013d5
    1338:	00001365 	.word	0x00001365
    133c:	000013d5 	.word	0x000013d5
    1340:	00001379 	.word	0x00001379
    1344:	00001365 	.word	0x00001365
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    1348:	230d      	movs	r3, #13
    134a:	72fb      	strb	r3, [r7, #11]
				con.putc(c);
    134c:	4b33      	ldr	r3, [pc, #204]	; (141c <read_line+0x168>)
    134e:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1350:	7afa      	ldrb	r2, [r7, #11]
    1352:	4610      	mov	r0, r2
    1354:	4798      	blx	r3
				break;
    1356:	e053      	b.n	1400 <read_line+0x14c>
				case CTRL_X:
				case CTRL_U:
				while (line_len){con.delete_back();line_len--;}
    1358:	4b30      	ldr	r3, [pc, #192]	; (141c <read_line+0x168>)
    135a:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    135c:	4798      	blx	r3
    135e:	68fb      	ldr	r3, [r7, #12]
    1360:	3b01      	subs	r3, #1
    1362:	60fb      	str	r3, [r7, #12]
    1364:	68fb      	ldr	r3, [r7, #12]
    1366:	2b00      	cmp	r3, #0
    1368:	d1f6      	bne.n	1358 <read_line+0xa4>
				//con.clear_line(line_len);
				//line_len=0;
				break;
    136a:	e049      	b.n	1400 <read_line+0x14c>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
    136c:	4b2b      	ldr	r3, [pc, #172]	; (141c <read_line+0x168>)
    136e:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1370:	4798      	blx	r3
					line_len--;
    1372:	68fb      	ldr	r3, [r7, #12]
    1374:	3b01      	subs	r3, #1
    1376:	60fb      	str	r3, [r7, #12]
				while (line_len){con.delete_back();line_len--;}
				//con.clear_line(line_len);
				//line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    1378:	68fb      	ldr	r3, [r7, #12]
    137a:	2b00      	cmp	r3, #0
    137c:	d006      	beq.n	138c <read_line+0xd8>
    137e:	68fb      	ldr	r3, [r7, #12]
    1380:	3b01      	subs	r3, #1
    1382:	687a      	ldr	r2, [r7, #4]
    1384:	4413      	add	r3, r2
    1386:	781b      	ldrb	r3, [r3, #0]
    1388:	2b20      	cmp	r3, #32
    138a:	d0ef      	beq.n	136c <read_line+0xb8>
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    138c:	e005      	b.n	139a <read_line+0xe6>
					con.delete_back();
    138e:	4b23      	ldr	r3, [pc, #140]	; (141c <read_line+0x168>)
    1390:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1392:	4798      	blx	r3
					line_len--;
    1394:	68fb      	ldr	r3, [r7, #12]
    1396:	3b01      	subs	r3, #1
    1398:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    139a:	68fb      	ldr	r3, [r7, #12]
    139c:	2b00      	cmp	r3, #0
    139e:	d006      	beq.n	13ae <read_line+0xfa>
    13a0:	68fb      	ldr	r3, [r7, #12]
    13a2:	3b01      	subs	r3, #1
    13a4:	687a      	ldr	r2, [r7, #4]
    13a6:	4413      	add	r3, r2
    13a8:	781b      	ldrb	r3, [r3, #0]
    13aa:	2b20      	cmp	r3, #32
    13ac:	d1ef      	bne.n	138e <read_line+0xda>
					con.delete_back();
					line_len--;
				}
				break;
    13ae:	e027      	b.n	1400 <read_line+0x14c>
				case BS:
				if (line_len){
    13b0:	68fb      	ldr	r3, [r7, #12]
    13b2:	2b00      	cmp	r3, #0
    13b4:	d005      	beq.n	13c2 <read_line+0x10e>
					con.delete_back();
    13b6:	4b19      	ldr	r3, [pc, #100]	; (141c <read_line+0x168>)
    13b8:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    13ba:	4798      	blx	r3
					line_len--;
    13bc:	68fb      	ldr	r3, [r7, #12]
    13be:	3b01      	subs	r3, #1
    13c0:	60fb      	str	r3, [r7, #12]
				}
				break;
    13c2:	e01d      	b.n	1400 <read_line+0x14c>
				case CTRL_E:
				con.cls();
    13c4:	4b15      	ldr	r3, [pc, #84]	; (141c <read_line+0x168>)
    13c6:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    13c8:	4798      	blx	r3
				line_len=0;
    13ca:	2300      	movs	r3, #0
    13cc:	60fb      	str	r3, [r7, #12]
				break;
    13ce:	e017      	b.n	1400 <read_line+0x14c>
				case TAB:
				c=SPACE;
    13d0:	2320      	movs	r3, #32
    13d2:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    13d4:	68fa      	ldr	r2, [r7, #12]
    13d6:	683b      	ldr	r3, [r7, #0]
    13d8:	429a      	cmp	r2, r3
    13da:	d20f      	bcs.n	13fc <read_line+0x148>
    13dc:	7afb      	ldrb	r3, [r7, #11]
    13de:	2b1f      	cmp	r3, #31
    13e0:	d90c      	bls.n	13fc <read_line+0x148>
					buffer[line_len++]=c;
    13e2:	68fb      	ldr	r3, [r7, #12]
    13e4:	1c5a      	adds	r2, r3, #1
    13e6:	60fa      	str	r2, [r7, #12]
    13e8:	687a      	ldr	r2, [r7, #4]
    13ea:	4413      	add	r3, r2
    13ec:	7afa      	ldrb	r2, [r7, #11]
    13ee:	701a      	strb	r2, [r3, #0]
					con.putc(c);
    13f0:	4b0a      	ldr	r3, [pc, #40]	; (141c <read_line+0x168>)
    13f2:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    13f4:	7afa      	ldrb	r2, [r7, #11]
    13f6:	4610      	mov	r0, r2
    13f8:	4798      	blx	r3
    13fa:	e001      	b.n	1400 <read_line+0x14c>
				}else{
					beep();
    13fc:	f7ff ff54 	bl	12a8 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    1400:	7afb      	ldrb	r3, [r7, #11]
    1402:	2b0d      	cmp	r3, #13
    1404:	f47f af63 	bne.w	12ce <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1408:	687a      	ldr	r2, [r7, #4]
    140a:	68fb      	ldr	r3, [r7, #12]
    140c:	4413      	add	r3, r2
    140e:	2200      	movs	r2, #0
    1410:	701a      	strb	r2, [r3, #0]
	return line_len;
    1412:	68fb      	ldr	r3, [r7, #12]
}
    1414:	4618      	mov	r0, r3
    1416:	3710      	adds	r7, #16
    1418:	46bd      	mov	sp, r7
    141a:	bd80      	pop	{r7, pc}
    141c:	200000e8 	.word	0x200000e8

00001420 <print_int>:

// imprime un entier
// i entier à imprimer
// base  numérique
void print_int(int i, unsigned base){
    1420:	b580      	push	{r7, lr}
    1422:	b08e      	sub	sp, #56	; 0x38
    1424:	af00      	add	r7, sp, #0
    1426:	6078      	str	r0, [r7, #4]
    1428:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    142a:	2301      	movs	r3, #1
    142c:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    142e:	2322      	movs	r3, #34	; 0x22
    1430:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    1432:	2300      	movs	r3, #0
    1434:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1438:	687b      	ldr	r3, [r7, #4]
    143a:	2b00      	cmp	r3, #0
    143c:	da05      	bge.n	144a <print_int+0x2a>
    143e:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1442:	637b      	str	r3, [r7, #52]	; 0x34
    1444:	687b      	ldr	r3, [r7, #4]
    1446:	425b      	negs	r3, r3
    1448:	607b      	str	r3, [r7, #4]
	while (i){
    144a:	e02c      	b.n	14a6 <print_int+0x86>
		fmt[pos]=i%base+'0';
    144c:	687b      	ldr	r3, [r7, #4]
    144e:	683a      	ldr	r2, [r7, #0]
    1450:	fbb3 f2f2 	udiv	r2, r3, r2
    1454:	6839      	ldr	r1, [r7, #0]
    1456:	fb01 f202 	mul.w	r2, r1, r2
    145a:	1a9b      	subs	r3, r3, r2
    145c:	b2db      	uxtb	r3, r3
    145e:	3330      	adds	r3, #48	; 0x30
    1460:	b2d9      	uxtb	r1, r3
    1462:	f107 020c 	add.w	r2, r7, #12
    1466:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1468:	4413      	add	r3, r2
    146a:	460a      	mov	r2, r1
    146c:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    146e:	f107 020c 	add.w	r2, r7, #12
    1472:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1474:	4413      	add	r3, r2
    1476:	781b      	ldrb	r3, [r3, #0]
    1478:	2b39      	cmp	r3, #57	; 0x39
    147a:	d90c      	bls.n	1496 <print_int+0x76>
    147c:	f107 020c 	add.w	r2, r7, #12
    1480:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1482:	4413      	add	r3, r2
    1484:	781b      	ldrb	r3, [r3, #0]
    1486:	3307      	adds	r3, #7
    1488:	b2d9      	uxtb	r1, r3
    148a:	f107 020c 	add.w	r2, r7, #12
    148e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1490:	4413      	add	r3, r2
    1492:	460a      	mov	r2, r1
    1494:	701a      	strb	r2, [r3, #0]
		pos--;
    1496:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1498:	3b01      	subs	r3, #1
    149a:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    149c:	687a      	ldr	r2, [r7, #4]
    149e:	683b      	ldr	r3, [r7, #0]
    14a0:	fbb2 f3f3 	udiv	r3, r2, r3
    14a4:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    14a6:	687b      	ldr	r3, [r7, #4]
    14a8:	2b00      	cmp	r3, #0
    14aa:	d1cf      	bne.n	144c <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    14ac:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    14ae:	2b22      	cmp	r3, #34	; 0x22
    14b0:	d108      	bne.n	14c4 <print_int+0xa4>
    14b2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    14b4:	1e5a      	subs	r2, r3, #1
    14b6:	633a      	str	r2, [r7, #48]	; 0x30
    14b8:	f107 0238 	add.w	r2, r7, #56	; 0x38
    14bc:	4413      	add	r3, r2
    14be:	2230      	movs	r2, #48	; 0x30
    14c0:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    14c4:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    14c6:	2b00      	cmp	r3, #0
    14c8:	da08      	bge.n	14dc <print_int+0xbc>
    14ca:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    14cc:	1e5a      	subs	r2, r3, #1
    14ce:	633a      	str	r2, [r7, #48]	; 0x30
    14d0:	f107 0238 	add.w	r2, r7, #56	; 0x38
    14d4:	4413      	add	r3, r2
    14d6:	222d      	movs	r2, #45	; 0x2d
    14d8:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    14dc:	f107 020c 	add.w	r2, r7, #12
    14e0:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    14e2:	4413      	add	r3, r2
    14e4:	2220      	movs	r2, #32
    14e6:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    14e8:	f107 020c 	add.w	r2, r7, #12
    14ec:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    14ee:	4413      	add	r3, r2
    14f0:	4618      	mov	r0, r3
    14f2:	f7ff febb 	bl	126c <print>
}
    14f6:	3738      	adds	r7, #56	; 0x38
    14f8:	46bd      	mov	sp, r7
    14fa:	bd80      	pop	{r7, pc}

000014fc <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    14fc:	b580      	push	{r7, lr}
    14fe:	b088      	sub	sp, #32
    1500:	af00      	add	r7, sp, #0
    1502:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    1504:	230c      	movs	r3, #12
    1506:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    1508:	2300      	movs	r3, #0
    150a:	767b      	strb	r3, [r7, #25]
	while (u){
    150c:	e026      	b.n	155c <print_hex+0x60>
		fmt[pos]=u%16+'0';
    150e:	687b      	ldr	r3, [r7, #4]
    1510:	b2db      	uxtb	r3, r3
    1512:	f003 030f 	and.w	r3, r3, #15
    1516:	b2db      	uxtb	r3, r3
    1518:	3330      	adds	r3, #48	; 0x30
    151a:	b2d9      	uxtb	r1, r3
    151c:	f107 020c 	add.w	r2, r7, #12
    1520:	69fb      	ldr	r3, [r7, #28]
    1522:	4413      	add	r3, r2
    1524:	460a      	mov	r2, r1
    1526:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1528:	f107 020c 	add.w	r2, r7, #12
    152c:	69fb      	ldr	r3, [r7, #28]
    152e:	4413      	add	r3, r2
    1530:	781b      	ldrb	r3, [r3, #0]
    1532:	2b39      	cmp	r3, #57	; 0x39
    1534:	d90c      	bls.n	1550 <print_hex+0x54>
    1536:	f107 020c 	add.w	r2, r7, #12
    153a:	69fb      	ldr	r3, [r7, #28]
    153c:	4413      	add	r3, r2
    153e:	781b      	ldrb	r3, [r3, #0]
    1540:	3307      	adds	r3, #7
    1542:	b2d9      	uxtb	r1, r3
    1544:	f107 020c 	add.w	r2, r7, #12
    1548:	69fb      	ldr	r3, [r7, #28]
    154a:	4413      	add	r3, r2
    154c:	460a      	mov	r2, r1
    154e:	701a      	strb	r2, [r3, #0]
		pos--;
    1550:	69fb      	ldr	r3, [r7, #28]
    1552:	3b01      	subs	r3, #1
    1554:	61fb      	str	r3, [r7, #28]
		u/=16;
    1556:	687b      	ldr	r3, [r7, #4]
    1558:	091b      	lsrs	r3, r3, #4
    155a:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    155c:	687b      	ldr	r3, [r7, #4]
    155e:	2b00      	cmp	r3, #0
    1560:	d1d5      	bne.n	150e <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    1562:	69fb      	ldr	r3, [r7, #28]
    1564:	2b0c      	cmp	r3, #12
    1566:	d108      	bne.n	157a <print_hex+0x7e>
    1568:	69fb      	ldr	r3, [r7, #28]
    156a:	1e5a      	subs	r2, r3, #1
    156c:	61fa      	str	r2, [r7, #28]
    156e:	f107 0220 	add.w	r2, r7, #32
    1572:	4413      	add	r3, r2
    1574:	2230      	movs	r2, #48	; 0x30
    1576:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    157a:	69fb      	ldr	r3, [r7, #28]
    157c:	1e5a      	subs	r2, r3, #1
    157e:	61fa      	str	r2, [r7, #28]
    1580:	f107 0220 	add.w	r2, r7, #32
    1584:	4413      	add	r3, r2
    1586:	2278      	movs	r2, #120	; 0x78
    1588:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    158c:	69fb      	ldr	r3, [r7, #28]
    158e:	1e5a      	subs	r2, r3, #1
    1590:	61fa      	str	r2, [r7, #28]
    1592:	f107 0220 	add.w	r2, r7, #32
    1596:	4413      	add	r3, r2
    1598:	2230      	movs	r2, #48	; 0x30
    159a:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    159e:	f107 020c 	add.w	r2, r7, #12
    15a2:	69fb      	ldr	r3, [r7, #28]
    15a4:	4413      	add	r3, r2
    15a6:	2220      	movs	r2, #32
    15a8:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    15aa:	f107 020c 	add.w	r2, r7, #12
    15ae:	69fb      	ldr	r3, [r7, #28]
    15b0:	4413      	add	r3, r2
    15b2:	4618      	mov	r0, r3
    15b4:	f7ff fe5a 	bl	126c <print>
}
    15b8:	3720      	adds	r7, #32
    15ba:	46bd      	mov	sp, r7
    15bc:	bd80      	pop	{r7, pc}
    15be:	bf00      	nop

000015c0 <cls>:

void cls(){
    15c0:	b580      	push	{r7, lr}
    15c2:	af00      	add	r7, sp, #0
	con.cls();
    15c4:	4b01      	ldr	r3, [pc, #4]	; (15cc <cls+0xc>)
    15c6:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    15c8:	4798      	blx	r3
}
    15ca:	bd80      	pop	{r7, pc}
    15cc:	200000e8 	.word	0x200000e8

000015d0 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    15d0:	b480      	push	{r7}
    15d2:	af00      	add	r7, sp, #0
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
    15d4:	4b13      	ldr	r3, [pc, #76]	; (1624 <flash_enable+0x54>)
    15d6:	681b      	ldr	r3, [r3, #0]
    15d8:	f003 0301 	and.w	r3, r3, #1
    15dc:	2b00      	cmp	r3, #0
    15de:	d10c      	bne.n	15fa <flash_enable+0x2a>
		RCC->CR|=RCC_CR_HSION;
    15e0:	4a10      	ldr	r2, [pc, #64]	; (1624 <flash_enable+0x54>)
    15e2:	4b10      	ldr	r3, [pc, #64]	; (1624 <flash_enable+0x54>)
    15e4:	681b      	ldr	r3, [r3, #0]
    15e6:	f043 0301 	orr.w	r3, r3, #1
    15ea:	6013      	str	r3, [r2, #0]
		while (!(RCC->CR&RCC_CR_HSIRDY));
    15ec:	bf00      	nop
    15ee:	4b0d      	ldr	r3, [pc, #52]	; (1624 <flash_enable+0x54>)
    15f0:	681b      	ldr	r3, [r3, #0]
    15f2:	f003 0302 	and.w	r3, r3, #2
    15f6:	2b00      	cmp	r3, #0
    15f8:	d0f9      	beq.n	15ee <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    15fa:	4b0b      	ldr	r3, [pc, #44]	; (1628 <flash_enable+0x58>)
    15fc:	4a0b      	ldr	r2, [pc, #44]	; (162c <flash_enable+0x5c>)
    15fe:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    1600:	4b09      	ldr	r3, [pc, #36]	; (1628 <flash_enable+0x58>)
    1602:	4a0b      	ldr	r2, [pc, #44]	; (1630 <flash_enable+0x60>)
    1604:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    1606:	4b08      	ldr	r3, [pc, #32]	; (1628 <flash_enable+0x58>)
    1608:	691b      	ldr	r3, [r3, #16]
    160a:	f003 0380 	and.w	r3, r3, #128	; 0x80
    160e:	2b00      	cmp	r3, #0
    1610:	bf0c      	ite	eq
    1612:	2301      	moveq	r3, #1
    1614:	2300      	movne	r3, #0
    1616:	b2db      	uxtb	r3, r3
}
    1618:	4618      	mov	r0, r3
    161a:	46bd      	mov	sp, r7
    161c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1620:	4770      	bx	lr
    1622:	bf00      	nop
    1624:	40021000 	.word	0x40021000
    1628:	40022000 	.word	0x40022000
    162c:	45670123 	.word	0x45670123
    1630:	cdef89ab 	.word	0xcdef89ab

00001634 <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    1634:	b480      	push	{r7}
    1636:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    1638:	4a04      	ldr	r2, [pc, #16]	; (164c <flash_disable+0x18>)
    163a:	4b04      	ldr	r3, [pc, #16]	; (164c <flash_disable+0x18>)
    163c:	691b      	ldr	r3, [r3, #16]
    163e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    1642:	6113      	str	r3, [r2, #16]
}
    1644:	46bd      	mov	sp, r7
    1646:	f85d 7b04 	ldr.w	r7, [sp], #4
    164a:	4770      	bx	lr
    164c:	40022000 	.word	0x40022000

00001650 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1650:	b480      	push	{r7}
    1652:	b083      	sub	sp, #12
    1654:	af00      	add	r7, sp, #0
    1656:	6078      	str	r0, [r7, #4]
    1658:	460b      	mov	r3, r1
    165a:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    165c:	4b1d      	ldr	r3, [pc, #116]	; (16d4 <flash_write+0x84>)
    165e:	691b      	ldr	r3, [r3, #16]
    1660:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1664:	2b00      	cmp	r3, #0
    1666:	d105      	bne.n	1674 <flash_write+0x24>
    1668:	687b      	ldr	r3, [r7, #4]
    166a:	881b      	ldrh	r3, [r3, #0]
    166c:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1670:	4293      	cmp	r3, r2
    1672:	d001      	beq.n	1678 <flash_write+0x28>
    1674:	2300      	movs	r3, #0
    1676:	e027      	b.n	16c8 <flash_write+0x78>
	while (_flash_busy);
    1678:	bf00      	nop
    167a:	4b16      	ldr	r3, [pc, #88]	; (16d4 <flash_write+0x84>)
    167c:	68db      	ldr	r3, [r3, #12]
    167e:	f003 0301 	and.w	r3, r3, #1
    1682:	2b00      	cmp	r3, #0
    1684:	d1f9      	bne.n	167a <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1686:	4a13      	ldr	r2, [pc, #76]	; (16d4 <flash_write+0x84>)
    1688:	4b12      	ldr	r3, [pc, #72]	; (16d4 <flash_write+0x84>)
    168a:	68db      	ldr	r3, [r3, #12]
    168c:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1690:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    1692:	4b10      	ldr	r3, [pc, #64]	; (16d4 <flash_write+0x84>)
    1694:	2201      	movs	r2, #1
    1696:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    1698:	687b      	ldr	r3, [r7, #4]
    169a:	887a      	ldrh	r2, [r7, #2]
    169c:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    169e:	bf00      	nop
    16a0:	4b0c      	ldr	r3, [pc, #48]	; (16d4 <flash_write+0x84>)
    16a2:	68db      	ldr	r3, [r3, #12]
    16a4:	f003 0301 	and.w	r3, r3, #1
    16a8:	2b00      	cmp	r3, #0
    16aa:	d005      	beq.n	16b8 <flash_write+0x68>
    16ac:	4b09      	ldr	r3, [pc, #36]	; (16d4 <flash_write+0x84>)
    16ae:	68db      	ldr	r3, [r3, #12]
    16b0:	f003 0320 	and.w	r3, r3, #32
    16b4:	2b00      	cmp	r3, #0
    16b6:	d0f3      	beq.n	16a0 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    16b8:	687b      	ldr	r3, [r7, #4]
    16ba:	881b      	ldrh	r3, [r3, #0]
    16bc:	887a      	ldrh	r2, [r7, #2]
    16be:	429a      	cmp	r2, r3
    16c0:	bf0c      	ite	eq
    16c2:	2301      	moveq	r3, #1
    16c4:	2300      	movne	r3, #0
    16c6:	b2db      	uxtb	r3, r3
}
    16c8:	4618      	mov	r0, r3
    16ca:	370c      	adds	r7, #12
    16cc:	46bd      	mov	sp, r7
    16ce:	f85d 7b04 	ldr.w	r7, [sp], #4
    16d2:	4770      	bx	lr
    16d4:	40022000 	.word	0x40022000

000016d8 <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    16d8:	b480      	push	{r7}
    16da:	b087      	sub	sp, #28
    16dc:	af00      	add	r7, sp, #0
    16de:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    16e0:	4b27      	ldr	r3, [pc, #156]	; (1780 <flash_erase_page+0xa8>)
    16e2:	691b      	ldr	r3, [r3, #16]
    16e4:	f003 0380 	and.w	r3, r3, #128	; 0x80
    16e8:	2b00      	cmp	r3, #0
    16ea:	d001      	beq.n	16f0 <flash_erase_page+0x18>
    16ec:	2300      	movs	r3, #0
    16ee:	e040      	b.n	1772 <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    16f0:	4a23      	ldr	r2, [pc, #140]	; (1780 <flash_erase_page+0xa8>)
    16f2:	4b23      	ldr	r3, [pc, #140]	; (1780 <flash_erase_page+0xa8>)
    16f4:	68db      	ldr	r3, [r3, #12]
    16f6:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    16fa:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    16fc:	687b      	ldr	r3, [r7, #4]
    16fe:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    1702:	f023 0303 	bic.w	r3, r3, #3
    1706:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    1708:	4b1d      	ldr	r3, [pc, #116]	; (1780 <flash_erase_page+0xa8>)
    170a:	2202      	movs	r2, #2
    170c:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    170e:	4a1c      	ldr	r2, [pc, #112]	; (1780 <flash_erase_page+0xa8>)
    1710:	687b      	ldr	r3, [r7, #4]
    1712:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    1714:	4a1a      	ldr	r2, [pc, #104]	; (1780 <flash_erase_page+0xa8>)
    1716:	4b1a      	ldr	r3, [pc, #104]	; (1780 <flash_erase_page+0xa8>)
    1718:	691b      	ldr	r3, [r3, #16]
    171a:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    171e:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    1720:	bf00      	nop
    1722:	4b17      	ldr	r3, [pc, #92]	; (1780 <flash_erase_page+0xa8>)
    1724:	68db      	ldr	r3, [r3, #12]
    1726:	f003 0301 	and.w	r3, r3, #1
    172a:	2b00      	cmp	r3, #0
    172c:	d005      	beq.n	173a <flash_erase_page+0x62>
    172e:	4b14      	ldr	r3, [pc, #80]	; (1780 <flash_erase_page+0xa8>)
    1730:	68db      	ldr	r3, [r3, #12]
    1732:	f003 0320 	and.w	r3, r3, #32
    1736:	2b00      	cmp	r3, #0
    1738:	d0f3      	beq.n	1722 <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    173a:	687b      	ldr	r3, [r7, #4]
    173c:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    173e:	2300      	movs	r3, #0
    1740:	60fb      	str	r3, [r7, #12]
    1742:	e00c      	b.n	175e <flash_erase_page+0x86>
		u32=*adr++;
    1744:	697b      	ldr	r3, [r7, #20]
    1746:	1d1a      	adds	r2, r3, #4
    1748:	617a      	str	r2, [r7, #20]
    174a:	681b      	ldr	r3, [r3, #0]
    174c:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    174e:	693b      	ldr	r3, [r7, #16]
    1750:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1754:	d000      	beq.n	1758 <flash_erase_page+0x80>
    1756:	e005      	b.n	1764 <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    1758:	68fb      	ldr	r3, [r7, #12]
    175a:	3301      	adds	r3, #1
    175c:	60fb      	str	r3, [r7, #12]
    175e:	68fb      	ldr	r3, [r7, #12]
    1760:	2bff      	cmp	r3, #255	; 0xff
    1762:	ddef      	ble.n	1744 <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    1764:	693b      	ldr	r3, [r7, #16]
    1766:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    176a:	bf0c      	ite	eq
    176c:	2301      	moveq	r3, #1
    176e:	2300      	movne	r3, #0
    1770:	b2db      	uxtb	r3, r3
}
    1772:	4618      	mov	r0, r3
    1774:	371c      	adds	r7, #28
    1776:	46bd      	mov	sp, r7
    1778:	f85d 7b04 	ldr.w	r7, [sp], #4
    177c:	4770      	bx	lr
    177e:	bf00      	nop
    1780:	40022000 	.word	0x40022000

00001784 <gdi_clear_screen>:
#include "gdi.h"

// position  du curseur texte.
static int cursor_x, cursor_y;

void gdi_clear_screen(){
    1784:	b480      	push	{r7}
    1786:	b083      	sub	sp, #12
    1788:	af00      	add	r7, sp, #0
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    178a:	2300      	movs	r3, #0
    178c:	607b      	str	r3, [r7, #4]
    178e:	e006      	b.n	179e <gdi_clear_screen+0x1a>
		video_buffer[i++]=0;
    1790:	687b      	ldr	r3, [r7, #4]
    1792:	1c5a      	adds	r2, r3, #1
    1794:	607a      	str	r2, [r7, #4]
    1796:	4a06      	ldr	r2, [pc, #24]	; (17b0 <gdi_clear_screen+0x2c>)
    1798:	2100      	movs	r1, #0
    179a:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
// position  du curseur texte.
static int cursor_x, cursor_y;

void gdi_clear_screen(){
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    179e:	687b      	ldr	r3, [r7, #4]
    17a0:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    17a4:	dbf4      	blt.n	1790 <gdi_clear_screen+0xc>
		video_buffer[i++]=0;
	}
}
    17a6:	370c      	adds	r7, #12
    17a8:	46bd      	mov	sp, r7
    17aa:	f85d 7b04 	ldr.w	r7, [sp], #4
    17ae:	4770      	bx	lr
    17b0:	20000128 	.word	0x20000128

000017b4 <gdi_scroll_up>:

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
    17b4:	b480      	push	{r7}
    17b6:	b083      	sub	sp, #12
    17b8:	af00      	add	r7, sp, #0
	int i,j;
	j=0;
    17ba:	2300      	movs	r3, #0
    17bc:	603b      	str	r3, [r7, #0]
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    17be:	23a0      	movs	r3, #160	; 0xa0
    17c0:	607b      	str	r3, [r7, #4]
    17c2:	e00b      	b.n	17dc <gdi_scroll_up+0x28>
		video_buffer[j++]=video_buffer[i++];
    17c4:	683b      	ldr	r3, [r7, #0]
    17c6:	1c5a      	adds	r2, r3, #1
    17c8:	603a      	str	r2, [r7, #0]
    17ca:	687a      	ldr	r2, [r7, #4]
    17cc:	1c51      	adds	r1, r2, #1
    17ce:	6079      	str	r1, [r7, #4]
    17d0:	490e      	ldr	r1, [pc, #56]	; (180c <gdi_scroll_up+0x58>)
    17d2:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    17d6:	4a0d      	ldr	r2, [pc, #52]	; (180c <gdi_scroll_up+0x58>)
    17d8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
	int i,j;
	j=0;
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    17dc:	687b      	ldr	r3, [r7, #4]
    17de:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    17e2:	dbef      	blt.n	17c4 <gdi_scroll_up+0x10>
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    17e4:	f44f 5391 	mov.w	r3, #4640	; 0x1220
    17e8:	607b      	str	r3, [r7, #4]
    17ea:	e006      	b.n	17fa <gdi_scroll_up+0x46>
		video_buffer[i++]=0;
    17ec:	687b      	ldr	r3, [r7, #4]
    17ee:	1c5a      	adds	r2, r3, #1
    17f0:	607a      	str	r2, [r7, #4]
    17f2:	4a06      	ldr	r2, [pc, #24]	; (180c <gdi_scroll_up+0x58>)
    17f4:	2100      	movs	r1, #0
    17f6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i,j;
	j=0;
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    17fa:	687b      	ldr	r3, [r7, #4]
    17fc:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1800:	dbf4      	blt.n	17ec <gdi_scroll_up+0x38>
		video_buffer[i++]=0;
	}
}
    1802:	370c      	adds	r7, #12
    1804:	46bd      	mov	sp, r7
    1806:	f85d 7b04 	ldr.w	r7, [sp], #4
    180a:	4770      	bx	lr
    180c:	20000128 	.word	0x20000128

00001810 <gdi_new_line>:

// avance le curseur texte au début 
// de la ligne suivante.
void gdi_new_line(){
    1810:	b580      	push	{r7, lr}
    1812:	af00      	add	r7, sp, #0
	cursor_x=0;
    1814:	4b08      	ldr	r3, [pc, #32]	; (1838 <gdi_new_line+0x28>)
    1816:	2200      	movs	r2, #0
    1818:	601a      	str	r2, [r3, #0]
	cursor_y+=CHAR_HEIGHT;
    181a:	4b08      	ldr	r3, [pc, #32]	; (183c <gdi_new_line+0x2c>)
    181c:	681b      	ldr	r3, [r3, #0]
    181e:	3308      	adds	r3, #8
    1820:	4a06      	ldr	r2, [pc, #24]	; (183c <gdi_new_line+0x2c>)
    1822:	6013      	str	r3, [r2, #0]
	if (cursor_y>(VRES-CHAR_HEIGHT)){
    1824:	4b05      	ldr	r3, [pc, #20]	; (183c <gdi_new_line+0x2c>)
    1826:	681b      	ldr	r3, [r3, #0]
    1828:	2be8      	cmp	r3, #232	; 0xe8
    182a:	dd04      	ble.n	1836 <gdi_new_line+0x26>
		cursor_y=VRES-CHAR_HEIGHT;
    182c:	4b03      	ldr	r3, [pc, #12]	; (183c <gdi_new_line+0x2c>)
    182e:	22e8      	movs	r2, #232	; 0xe8
    1830:	601a      	str	r2, [r3, #0]
		gdi_scroll_up();
    1832:	f7ff ffbf 	bl	17b4 <gdi_scroll_up>
	}
}
    1836:	bd80      	pop	{r7, pc}
    1838:	200000ac 	.word	0x200000ac
    183c:	200000b0 	.word	0x200000b0

00001840 <gdi_cursor_left>:

void gdi_cursor_left(){
    1840:	b480      	push	{r7}
    1842:	af00      	add	r7, sp, #0
	if (!(cursor_x|cursor_y)) return;
    1844:	4b14      	ldr	r3, [pc, #80]	; (1898 <gdi_cursor_left+0x58>)
    1846:	681a      	ldr	r2, [r3, #0]
    1848:	4b14      	ldr	r3, [pc, #80]	; (189c <gdi_cursor_left+0x5c>)
    184a:	681b      	ldr	r3, [r3, #0]
    184c:	4313      	orrs	r3, r2
    184e:	2b00      	cmp	r3, #0
    1850:	d100      	bne.n	1854 <gdi_cursor_left+0x14>
    1852:	e01d      	b.n	1890 <gdi_cursor_left+0x50>
	if (cursor_x>=CHAR_WIDTH){
    1854:	4b10      	ldr	r3, [pc, #64]	; (1898 <gdi_cursor_left+0x58>)
    1856:	681b      	ldr	r3, [r3, #0]
    1858:	2b05      	cmp	r3, #5
    185a:	dd05      	ble.n	1868 <gdi_cursor_left+0x28>
		cursor_x-=CHAR_WIDTH;
    185c:	4b0e      	ldr	r3, [pc, #56]	; (1898 <gdi_cursor_left+0x58>)
    185e:	681b      	ldr	r3, [r3, #0]
    1860:	3b06      	subs	r3, #6
    1862:	4a0d      	ldr	r2, [pc, #52]	; (1898 <gdi_cursor_left+0x58>)
    1864:	6013      	str	r3, [r2, #0]
    1866:	e013      	b.n	1890 <gdi_cursor_left+0x50>
	}else if (cursor_y) {
    1868:	4b0c      	ldr	r3, [pc, #48]	; (189c <gdi_cursor_left+0x5c>)
    186a:	681b      	ldr	r3, [r3, #0]
    186c:	2b00      	cmp	r3, #0
    186e:	d00f      	beq.n	1890 <gdi_cursor_left+0x50>
		cursor_x=CHAR_WIDTH*(CHARS_PER_LINE-1);
    1870:	4b09      	ldr	r3, [pc, #36]	; (1898 <gdi_cursor_left+0x58>)
    1872:	f44f 729c 	mov.w	r2, #312	; 0x138
    1876:	601a      	str	r2, [r3, #0]
		cursor_y-=CHAR_HEIGHT;
    1878:	4b08      	ldr	r3, [pc, #32]	; (189c <gdi_cursor_left+0x5c>)
    187a:	681b      	ldr	r3, [r3, #0]
    187c:	3b08      	subs	r3, #8
    187e:	4a07      	ldr	r2, [pc, #28]	; (189c <gdi_cursor_left+0x5c>)
    1880:	6013      	str	r3, [r2, #0]
		if (cursor_y<0) cursor_y=0;
    1882:	4b06      	ldr	r3, [pc, #24]	; (189c <gdi_cursor_left+0x5c>)
    1884:	681b      	ldr	r3, [r3, #0]
    1886:	2b00      	cmp	r3, #0
    1888:	da02      	bge.n	1890 <gdi_cursor_left+0x50>
    188a:	4b04      	ldr	r3, [pc, #16]	; (189c <gdi_cursor_left+0x5c>)
    188c:	2200      	movs	r2, #0
    188e:	601a      	str	r2, [r3, #0]
	}
}
    1890:	46bd      	mov	sp, r7
    1892:	f85d 7b04 	ldr.w	r7, [sp], #4
    1896:	4770      	bx	lr
    1898:	200000ac 	.word	0x200000ac
    189c:	200000b0 	.word	0x200000b0

000018a0 <gdi_bit_op>:


void gdi_bit_op(int x, int y, bitop_e op){
    18a0:	b480      	push	{r7}
    18a2:	b087      	sub	sp, #28
    18a4:	af00      	add	r7, sp, #0
    18a6:	60f8      	str	r0, [r7, #12]
    18a8:	60b9      	str	r1, [r7, #8]
    18aa:	4613      	mov	r3, r2
    18ac:	71fb      	strb	r3, [r7, #7]
	uint16_t bit;
	int offset=y*ROW_SIZE+(x>>4);
    18ae:	68ba      	ldr	r2, [r7, #8]
    18b0:	4613      	mov	r3, r2
    18b2:	009b      	lsls	r3, r3, #2
    18b4:	4413      	add	r3, r2
    18b6:	009b      	lsls	r3, r3, #2
    18b8:	461a      	mov	r2, r3
    18ba:	68fb      	ldr	r3, [r7, #12]
    18bc:	111b      	asrs	r3, r3, #4
    18be:	4413      	add	r3, r2
    18c0:	617b      	str	r3, [r7, #20]
	bit=1<<(15-(x&15));
    18c2:	68fb      	ldr	r3, [r7, #12]
    18c4:	43db      	mvns	r3, r3
    18c6:	f003 030f 	and.w	r3, r3, #15
    18ca:	2201      	movs	r2, #1
    18cc:	fa02 f303 	lsl.w	r3, r2, r3
    18d0:	827b      	strh	r3, [r7, #18]
	switch (op){
    18d2:	79fb      	ldrb	r3, [r7, #7]
    18d4:	2b01      	cmp	r3, #1
    18d6:	d013      	beq.n	1900 <gdi_bit_op+0x60>
    18d8:	2b02      	cmp	r3, #2
    18da:	d01d      	beq.n	1918 <gdi_bit_op+0x78>
    18dc:	2b00      	cmp	r3, #0
    18de:	d127      	bne.n	1930 <gdi_bit_op+0x90>
	case BLACK_BIT:
		video_buffer[offset]&=~bit;
    18e0:	4a16      	ldr	r2, [pc, #88]	; (193c <gdi_bit_op+0x9c>)
    18e2:	697b      	ldr	r3, [r7, #20]
    18e4:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    18e8:	b29a      	uxth	r2, r3
    18ea:	8a7b      	ldrh	r3, [r7, #18]
    18ec:	43db      	mvns	r3, r3
    18ee:	b29b      	uxth	r3, r3
    18f0:	4013      	ands	r3, r2
    18f2:	b29b      	uxth	r3, r3
    18f4:	b299      	uxth	r1, r3
    18f6:	4a11      	ldr	r2, [pc, #68]	; (193c <gdi_bit_op+0x9c>)
    18f8:	697b      	ldr	r3, [r7, #20]
    18fa:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    18fe:	e017      	b.n	1930 <gdi_bit_op+0x90>
	case WHITE_BIT:
		video_buffer[offset]|=bit;
    1900:	4a0e      	ldr	r2, [pc, #56]	; (193c <gdi_bit_op+0x9c>)
    1902:	697b      	ldr	r3, [r7, #20]
    1904:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1908:	8a7b      	ldrh	r3, [r7, #18]
    190a:	4313      	orrs	r3, r2
    190c:	b299      	uxth	r1, r3
    190e:	4a0b      	ldr	r2, [pc, #44]	; (193c <gdi_bit_op+0x9c>)
    1910:	697b      	ldr	r3, [r7, #20]
    1912:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1916:	e00b      	b.n	1930 <gdi_bit_op+0x90>
	case XOR_BIT:
		video_buffer[offset]^=bit;
    1918:	4a08      	ldr	r2, [pc, #32]	; (193c <gdi_bit_op+0x9c>)
    191a:	697b      	ldr	r3, [r7, #20]
    191c:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1920:	8a7b      	ldrh	r3, [r7, #18]
    1922:	4053      	eors	r3, r2
    1924:	b299      	uxth	r1, r3
    1926:	4a05      	ldr	r2, [pc, #20]	; (193c <gdi_bit_op+0x9c>)
    1928:	697b      	ldr	r3, [r7, #20]
    192a:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    192e:	bf00      	nop
	}
}
    1930:	371c      	adds	r7, #28
    1932:	46bd      	mov	sp, r7
    1934:	f85d 7b04 	ldr.w	r7, [sp], #4
    1938:	4770      	bx	lr
    193a:	bf00      	nop
    193c:	20000128 	.word	0x20000128

00001940 <gdi_box>:

void gdi_box(int x, int y, int w, int h, bitop_e op){
    1940:	b580      	push	{r7, lr}
    1942:	b086      	sub	sp, #24
    1944:	af00      	add	r7, sp, #0
    1946:	60f8      	str	r0, [r7, #12]
    1948:	60b9      	str	r1, [r7, #8]
    194a:	607a      	str	r2, [r7, #4]
    194c:	603b      	str	r3, [r7, #0]
	int r,c;
	
	for (r=0;r<h;r++){
    194e:	2300      	movs	r3, #0
    1950:	617b      	str	r3, [r7, #20]
    1952:	e02e      	b.n	19b2 <gdi_box+0x72>
		for (c=0;c<w;c++){
    1954:	2300      	movs	r3, #0
    1956:	613b      	str	r3, [r7, #16]
    1958:	e024      	b.n	19a4 <gdi_box+0x64>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    195a:	68fa      	ldr	r2, [r7, #12]
    195c:	693b      	ldr	r3, [r7, #16]
    195e:	4413      	add	r3, r2
    1960:	2b00      	cmp	r3, #0
    1962:	db1c      	blt.n	199e <gdi_box+0x5e>
    1964:	68fa      	ldr	r2, [r7, #12]
    1966:	693b      	ldr	r3, [r7, #16]
    1968:	4413      	add	r3, r2
    196a:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    196e:	da16      	bge.n	199e <gdi_box+0x5e>
    1970:	697a      	ldr	r2, [r7, #20]
    1972:	68bb      	ldr	r3, [r7, #8]
    1974:	4413      	add	r3, r2
    1976:	2b00      	cmp	r3, #0
    1978:	db11      	blt.n	199e <gdi_box+0x5e>
    197a:	697a      	ldr	r2, [r7, #20]
    197c:	68bb      	ldr	r3, [r7, #8]
    197e:	4413      	add	r3, r2
    1980:	2bef      	cmp	r3, #239	; 0xef
    1982:	dc0c      	bgt.n	199e <gdi_box+0x5e>
				gdi_bit_op(c+x,r+y,op);
    1984:	693a      	ldr	r2, [r7, #16]
    1986:	68fb      	ldr	r3, [r7, #12]
    1988:	18d1      	adds	r1, r2, r3
    198a:	697a      	ldr	r2, [r7, #20]
    198c:	68bb      	ldr	r3, [r7, #8]
    198e:	441a      	add	r2, r3
    1990:	f897 3020 	ldrb.w	r3, [r7, #32]
    1994:	4608      	mov	r0, r1
    1996:	4611      	mov	r1, r2
    1998:	461a      	mov	r2, r3
    199a:	f7ff ff81 	bl	18a0 <gdi_bit_op>

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
		for (c=0;c<w;c++){
    199e:	693b      	ldr	r3, [r7, #16]
    19a0:	3301      	adds	r3, #1
    19a2:	613b      	str	r3, [r7, #16]
    19a4:	693a      	ldr	r2, [r7, #16]
    19a6:	687b      	ldr	r3, [r7, #4]
    19a8:	429a      	cmp	r2, r3
    19aa:	dbd6      	blt.n	195a <gdi_box+0x1a>
}

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
    19ac:	697b      	ldr	r3, [r7, #20]
    19ae:	3301      	adds	r3, #1
    19b0:	617b      	str	r3, [r7, #20]
    19b2:	697a      	ldr	r2, [r7, #20]
    19b4:	683b      	ldr	r3, [r7, #0]
    19b6:	429a      	cmp	r2, r3
    19b8:	dbcc      	blt.n	1954 <gdi_box+0x14>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				gdi_bit_op(c+x,r+y,op);
			}
		}
	}
}
    19ba:	3718      	adds	r7, #24
    19bc:	46bd      	mov	sp, r7
    19be:	bd80      	pop	{r7, pc}

000019c0 <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
    19c0:	b480      	push	{r7}
    19c2:	b089      	sub	sp, #36	; 0x24
    19c4:	af00      	add	r7, sp, #0
    19c6:	60f8      	str	r0, [r7, #12]
    19c8:	60b9      	str	r1, [r7, #8]
    19ca:	607a      	str	r2, [r7, #4]
    19cc:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    19ce:	2300      	movs	r3, #0
    19d0:	61fb      	str	r3, [r7, #28]
    19d2:	e099      	b.n	1b08 <gdi_put_sprite+0x148>
		mask=128;
    19d4:	2380      	movs	r3, #128	; 0x80
    19d6:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    19d8:	2300      	movs	r3, #0
    19da:	61bb      	str	r3, [r7, #24]
    19dc:	e08c      	b.n	1af8 <gdi_put_sprite+0x138>
			if (!mask){
    19de:	7dfb      	ldrb	r3, [r7, #23]
    19e0:	2b00      	cmp	r3, #0
    19e2:	d104      	bne.n	19ee <gdi_put_sprite+0x2e>
				sprite++;
    19e4:	6abb      	ldr	r3, [r7, #40]	; 0x28
    19e6:	3301      	adds	r3, #1
    19e8:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    19ea:	2380      	movs	r3, #128	; 0x80
    19ec:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    19ee:	68fa      	ldr	r2, [r7, #12]
    19f0:	69bb      	ldr	r3, [r7, #24]
    19f2:	4413      	add	r3, r2
    19f4:	2b00      	cmp	r3, #0
    19f6:	db79      	blt.n	1aec <gdi_put_sprite+0x12c>
    19f8:	68fa      	ldr	r2, [r7, #12]
    19fa:	69bb      	ldr	r3, [r7, #24]
    19fc:	4413      	add	r3, r2
    19fe:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    1a02:	da73      	bge.n	1aec <gdi_put_sprite+0x12c>
    1a04:	69fa      	ldr	r2, [r7, #28]
    1a06:	68bb      	ldr	r3, [r7, #8]
    1a08:	4413      	add	r3, r2
    1a0a:	2b00      	cmp	r3, #0
    1a0c:	db6e      	blt.n	1aec <gdi_put_sprite+0x12c>
    1a0e:	69fa      	ldr	r2, [r7, #28]
    1a10:	68bb      	ldr	r3, [r7, #8]
    1a12:	4413      	add	r3, r2
    1a14:	2bef      	cmp	r3, #239	; 0xef
    1a16:	dc69      	bgt.n	1aec <gdi_put_sprite+0x12c>
				if (sprite[r]&mask){
    1a18:	69fb      	ldr	r3, [r7, #28]
    1a1a:	6aba      	ldr	r2, [r7, #40]	; 0x28
    1a1c:	4413      	add	r3, r2
    1a1e:	781a      	ldrb	r2, [r3, #0]
    1a20:	7dfb      	ldrb	r3, [r7, #23]
    1a22:	4013      	ands	r3, r2
    1a24:	b2db      	uxtb	r3, r3
    1a26:	2b00      	cmp	r3, #0
    1a28:	d02f      	beq.n	1a8a <gdi_put_sprite+0xca>
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]|=(1<<(15-((c+x)&15)));
    1a2a:	69fa      	ldr	r2, [r7, #28]
    1a2c:	68bb      	ldr	r3, [r7, #8]
    1a2e:	441a      	add	r2, r3
    1a30:	4613      	mov	r3, r2
    1a32:	009b      	lsls	r3, r3, #2
    1a34:	4413      	add	r3, r2
    1a36:	009b      	lsls	r3, r3, #2
    1a38:	4619      	mov	r1, r3
    1a3a:	69ba      	ldr	r2, [r7, #24]
    1a3c:	68fb      	ldr	r3, [r7, #12]
    1a3e:	4413      	add	r3, r2
    1a40:	111b      	asrs	r3, r3, #4
    1a42:	4419      	add	r1, r3
    1a44:	69fa      	ldr	r2, [r7, #28]
    1a46:	68bb      	ldr	r3, [r7, #8]
    1a48:	441a      	add	r2, r3
    1a4a:	4613      	mov	r3, r2
    1a4c:	009b      	lsls	r3, r3, #2
    1a4e:	4413      	add	r3, r2
    1a50:	009b      	lsls	r3, r3, #2
    1a52:	4618      	mov	r0, r3
    1a54:	69ba      	ldr	r2, [r7, #24]
    1a56:	68fb      	ldr	r3, [r7, #12]
    1a58:	4413      	add	r3, r2
    1a5a:	111b      	asrs	r3, r3, #4
    1a5c:	4403      	add	r3, r0
    1a5e:	4a2f      	ldr	r2, [pc, #188]	; (1b1c <gdi_put_sprite+0x15c>)
    1a60:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1a64:	b298      	uxth	r0, r3
    1a66:	69ba      	ldr	r2, [r7, #24]
    1a68:	68fb      	ldr	r3, [r7, #12]
    1a6a:	4413      	add	r3, r2
    1a6c:	43db      	mvns	r3, r3
    1a6e:	f003 030f 	and.w	r3, r3, #15
    1a72:	2201      	movs	r2, #1
    1a74:	fa02 f303 	lsl.w	r3, r2, r3
    1a78:	b29b      	uxth	r3, r3
    1a7a:	4602      	mov	r2, r0
    1a7c:	4313      	orrs	r3, r2
    1a7e:	b29b      	uxth	r3, r3
    1a80:	b29a      	uxth	r2, r3
    1a82:	4b26      	ldr	r3, [pc, #152]	; (1b1c <gdi_put_sprite+0x15c>)
    1a84:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
    1a88:	e030      	b.n	1aec <gdi_put_sprite+0x12c>
				}else{
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]&=~(1<<(15-((c+x)&15)));
    1a8a:	69fa      	ldr	r2, [r7, #28]
    1a8c:	68bb      	ldr	r3, [r7, #8]
    1a8e:	441a      	add	r2, r3
    1a90:	4613      	mov	r3, r2
    1a92:	009b      	lsls	r3, r3, #2
    1a94:	4413      	add	r3, r2
    1a96:	009b      	lsls	r3, r3, #2
    1a98:	4619      	mov	r1, r3
    1a9a:	69ba      	ldr	r2, [r7, #24]
    1a9c:	68fb      	ldr	r3, [r7, #12]
    1a9e:	4413      	add	r3, r2
    1aa0:	111b      	asrs	r3, r3, #4
    1aa2:	4419      	add	r1, r3
    1aa4:	69fa      	ldr	r2, [r7, #28]
    1aa6:	68bb      	ldr	r3, [r7, #8]
    1aa8:	441a      	add	r2, r3
    1aaa:	4613      	mov	r3, r2
    1aac:	009b      	lsls	r3, r3, #2
    1aae:	4413      	add	r3, r2
    1ab0:	009b      	lsls	r3, r3, #2
    1ab2:	4618      	mov	r0, r3
    1ab4:	69ba      	ldr	r2, [r7, #24]
    1ab6:	68fb      	ldr	r3, [r7, #12]
    1ab8:	4413      	add	r3, r2
    1aba:	111b      	asrs	r3, r3, #4
    1abc:	4403      	add	r3, r0
    1abe:	4a17      	ldr	r2, [pc, #92]	; (1b1c <gdi_put_sprite+0x15c>)
    1ac0:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1ac4:	b298      	uxth	r0, r3
    1ac6:	69ba      	ldr	r2, [r7, #24]
    1ac8:	68fb      	ldr	r3, [r7, #12]
    1aca:	4413      	add	r3, r2
    1acc:	43db      	mvns	r3, r3
    1ace:	f003 030f 	and.w	r3, r3, #15
    1ad2:	2201      	movs	r2, #1
    1ad4:	fa02 f303 	lsl.w	r3, r2, r3
    1ad8:	b29b      	uxth	r3, r3
    1ada:	43db      	mvns	r3, r3
    1adc:	b29b      	uxth	r3, r3
    1ade:	4602      	mov	r2, r0
    1ae0:	4013      	ands	r3, r2
    1ae2:	b29b      	uxth	r3, r3
    1ae4:	b29a      	uxth	r2, r3
    1ae6:	4b0d      	ldr	r3, [pc, #52]	; (1b1c <gdi_put_sprite+0x15c>)
    1ae8:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
				//bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
				//video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]|=bit;
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
    1aec:	7dfb      	ldrb	r3, [r7, #23]
    1aee:	085b      	lsrs	r3, r3, #1
    1af0:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    1af2:	69bb      	ldr	r3, [r7, #24]
    1af4:	3301      	adds	r3, #1
    1af6:	61bb      	str	r3, [r7, #24]
    1af8:	69ba      	ldr	r2, [r7, #24]
    1afa:	687b      	ldr	r3, [r7, #4]
    1afc:	429a      	cmp	r2, r3
    1afe:	f6ff af6e 	blt.w	19de <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1b02:	69fb      	ldr	r3, [r7, #28]
    1b04:	3301      	adds	r3, #1
    1b06:	61fb      	str	r3, [r7, #28]
    1b08:	69fa      	ldr	r2, [r7, #28]
    1b0a:	683b      	ldr	r3, [r7, #0]
    1b0c:	429a      	cmp	r2, r3
    1b0e:	f6ff af61 	blt.w	19d4 <gdi_put_sprite+0x14>
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    1b12:	3724      	adds	r7, #36	; 0x24
    1b14:	46bd      	mov	sp, r7
    1b16:	f85d 7b04 	ldr.w	r7, [sp], #4
    1b1a:	4770      	bx	lr
    1b1c:	20000128 	.word	0x20000128

00001b20 <gdi_del_back>:

void gdi_del_back(){
    1b20:	b580      	push	{r7, lr}
    1b22:	b082      	sub	sp, #8
    1b24:	af02      	add	r7, sp, #8
	gdi_cursor_left();
    1b26:	f7ff fe8b 	bl	1840 <gdi_cursor_left>
	gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    1b2a:	4b07      	ldr	r3, [pc, #28]	; (1b48 <gdi_del_back+0x28>)
    1b2c:	6819      	ldr	r1, [r3, #0]
    1b2e:	4b07      	ldr	r3, [pc, #28]	; (1b4c <gdi_del_back+0x2c>)
    1b30:	681a      	ldr	r2, [r3, #0]
    1b32:	2300      	movs	r3, #0
    1b34:	9300      	str	r3, [sp, #0]
    1b36:	4608      	mov	r0, r1
    1b38:	4611      	mov	r1, r2
    1b3a:	2206      	movs	r2, #6
    1b3c:	2308      	movs	r3, #8
    1b3e:	f7ff feff 	bl	1940 <gdi_box>
}
    1b42:	46bd      	mov	sp, r7
    1b44:	bd80      	pop	{r7, pc}
    1b46:	bf00      	nop
    1b48:	200000ac 	.word	0x200000ac
    1b4c:	200000b0 	.word	0x200000b0

00001b50 <gdi_putc>:

// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void gdi_putc(char c){
    1b50:	b580      	push	{r7, lr}
    1b52:	b084      	sub	sp, #16
    1b54:	af02      	add	r7, sp, #8
    1b56:	4603      	mov	r3, r0
    1b58:	71fb      	strb	r3, [r7, #7]
		switch (c){
    1b5a:	79fb      	ldrb	r3, [r7, #7]
    1b5c:	2b0a      	cmp	r3, #10
    1b5e:	d004      	beq.n	1b6a <gdi_putc+0x1a>
    1b60:	2b0d      	cmp	r3, #13
    1b62:	d002      	beq.n	1b6a <gdi_putc+0x1a>
    1b64:	2b08      	cmp	r3, #8
    1b66:	d003      	beq.n	1b70 <gdi_putc+0x20>
    1b68:	e005      	b.n	1b76 <gdi_putc+0x26>
		case '\n':
		case CR:
			gdi_new_line();
    1b6a:	f7ff fe51 	bl	1810 <gdi_new_line>
			break;
    1b6e:	e020      	b.n	1bb2 <gdi_putc+0x62>
		case BS:
			gdi_del_back();
    1b70:	f7ff ffd6 	bl	1b20 <gdi_del_back>
			break;
    1b74:	e01d      	b.n	1bb2 <gdi_putc+0x62>
		default:
			if (c<FONT_SIZE){
    1b76:	79fb      	ldrb	r3, [r7, #7]
    1b78:	b25b      	sxtb	r3, r3
    1b7a:	2b00      	cmp	r3, #0
    1b7c:	db18      	blt.n	1bb0 <gdi_putc+0x60>
				gdi_put_sprite(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,(const unsigned char *)&font6x8[c]);
    1b7e:	4b0e      	ldr	r3, [pc, #56]	; (1bb8 <gdi_putc+0x68>)
    1b80:	6818      	ldr	r0, [r3, #0]
    1b82:	4b0e      	ldr	r3, [pc, #56]	; (1bbc <gdi_putc+0x6c>)
    1b84:	6819      	ldr	r1, [r3, #0]
    1b86:	79fb      	ldrb	r3, [r7, #7]
    1b88:	00db      	lsls	r3, r3, #3
    1b8a:	4a0d      	ldr	r2, [pc, #52]	; (1bc0 <gdi_putc+0x70>)
    1b8c:	4413      	add	r3, r2
    1b8e:	9300      	str	r3, [sp, #0]
    1b90:	2206      	movs	r2, #6
    1b92:	2308      	movs	r3, #8
    1b94:	f7ff ff14 	bl	19c0 <gdi_put_sprite>
				cursor_x+=CHAR_WIDTH;
    1b98:	4b07      	ldr	r3, [pc, #28]	; (1bb8 <gdi_putc+0x68>)
    1b9a:	681b      	ldr	r3, [r3, #0]
    1b9c:	3306      	adds	r3, #6
    1b9e:	4a06      	ldr	r2, [pc, #24]	; (1bb8 <gdi_putc+0x68>)
    1ba0:	6013      	str	r3, [r2, #0]
				if (cursor_x>(HRES-CHAR_WIDTH)){
    1ba2:	4b05      	ldr	r3, [pc, #20]	; (1bb8 <gdi_putc+0x68>)
    1ba4:	681b      	ldr	r3, [r3, #0]
    1ba6:	f5b3 7f9d 	cmp.w	r3, #314	; 0x13a
    1baa:	dd01      	ble.n	1bb0 <gdi_putc+0x60>
					gdi_new_line();
    1bac:	f7ff fe30 	bl	1810 <gdi_new_line>
				}
			}
			break;
    1bb0:	bf00      	nop
		}//switch
}
    1bb2:	3708      	adds	r7, #8
    1bb4:	46bd      	mov	sp, r7
    1bb6:	bd80      	pop	{r7, pc}
    1bb8:	200000ac 	.word	0x200000ac
    1bbc:	200000b0 	.word	0x200000b0
    1bc0:	00002eb8 	.word	0x00002eb8

00001bc4 <gdi_print>:

void gdi_print(const char *str){
    1bc4:	b580      	push	{r7, lr}
    1bc6:	b082      	sub	sp, #8
    1bc8:	af00      	add	r7, sp, #0
    1bca:	6078      	str	r0, [r7, #4]
	while (*str) gdi_putc(*str++);
    1bcc:	e006      	b.n	1bdc <gdi_print+0x18>
    1bce:	687b      	ldr	r3, [r7, #4]
    1bd0:	1c5a      	adds	r2, r3, #1
    1bd2:	607a      	str	r2, [r7, #4]
    1bd4:	781b      	ldrb	r3, [r3, #0]
    1bd6:	4618      	mov	r0, r3
    1bd8:	f7ff ffba 	bl	1b50 <gdi_putc>
    1bdc:	687b      	ldr	r3, [r7, #4]
    1bde:	781b      	ldrb	r3, [r3, #0]
    1be0:	2b00      	cmp	r3, #0
    1be2:	d1f4      	bne.n	1bce <gdi_print+0xa>
}
    1be4:	3708      	adds	r7, #8
    1be6:	46bd      	mov	sp, r7
    1be8:	bd80      	pop	{r7, pc}
    1bea:	bf00      	nop

00001bec <gdi_clrln>:

void gdi_clrln(){
    1bec:	b480      	push	{r7}
    1bee:	b083      	sub	sp, #12
    1bf0:	af00      	add	r7, sp, #0
	int i;
	cursor_x=0;
    1bf2:	4b11      	ldr	r3, [pc, #68]	; (1c38 <gdi_clrln+0x4c>)
    1bf4:	2200      	movs	r2, #0
    1bf6:	601a      	str	r2, [r3, #0]
	for (i=cursor_y*ROW_SIZE;i<cursor_y*ROW_SIZE*8;i++){
    1bf8:	4b10      	ldr	r3, [pc, #64]	; (1c3c <gdi_clrln+0x50>)
    1bfa:	681a      	ldr	r2, [r3, #0]
    1bfc:	4613      	mov	r3, r2
    1bfe:	009b      	lsls	r3, r3, #2
    1c00:	4413      	add	r3, r2
    1c02:	009b      	lsls	r3, r3, #2
    1c04:	607b      	str	r3, [r7, #4]
    1c06:	e007      	b.n	1c18 <gdi_clrln+0x2c>
		video_buffer[i]=0;
    1c08:	4a0d      	ldr	r2, [pc, #52]	; (1c40 <gdi_clrln+0x54>)
    1c0a:	687b      	ldr	r3, [r7, #4]
    1c0c:	2100      	movs	r1, #0
    1c0e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
}

void gdi_clrln(){
	int i;
	cursor_x=0;
	for (i=cursor_y*ROW_SIZE;i<cursor_y*ROW_SIZE*8;i++){
    1c12:	687b      	ldr	r3, [r7, #4]
    1c14:	3301      	adds	r3, #1
    1c16:	607b      	str	r3, [r7, #4]
    1c18:	4b08      	ldr	r3, [pc, #32]	; (1c3c <gdi_clrln+0x50>)
    1c1a:	681a      	ldr	r2, [r3, #0]
    1c1c:	4613      	mov	r3, r2
    1c1e:	009b      	lsls	r3, r3, #2
    1c20:	4413      	add	r3, r2
    1c22:	015b      	lsls	r3, r3, #5
    1c24:	461a      	mov	r2, r3
    1c26:	687b      	ldr	r3, [r7, #4]
    1c28:	429a      	cmp	r2, r3
    1c2a:	dced      	bgt.n	1c08 <gdi_clrln+0x1c>
		video_buffer[i]=0;
	}
}
    1c2c:	370c      	adds	r7, #12
    1c2e:	46bd      	mov	sp, r7
    1c30:	f85d 7b04 	ldr.w	r7, [sp], #4
    1c34:	4770      	bx	lr
    1c36:	bf00      	nop
    1c38:	200000ac 	.word	0x200000ac
    1c3c:	200000b0 	.word	0x200000b0
    1c40:	20000128 	.word	0x20000128

00001c44 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(gpio_t* port, unsigned pin, unsigned config){
    1c44:	b480      	push	{r7}
    1c46:	b087      	sub	sp, #28
    1c48:	af00      	add	r7, sp, #0
    1c4a:	60f8      	str	r0, [r7, #12]
    1c4c:	60b9      	str	r1, [r7, #8]
    1c4e:	607a      	str	r2, [r7, #4]
	uint8_t shift;
	shift=(pin&7)<<2;
    1c50:	68bb      	ldr	r3, [r7, #8]
    1c52:	b2db      	uxtb	r3, r3
    1c54:	f003 0307 	and.w	r3, r3, #7
    1c58:	b2db      	uxtb	r3, r3
    1c5a:	009b      	lsls	r3, r3, #2
    1c5c:	75fb      	strb	r3, [r7, #23]
	port->CR[pin>>3]&=~(15<<shift);
    1c5e:	68bb      	ldr	r3, [r7, #8]
    1c60:	08da      	lsrs	r2, r3, #3
    1c62:	68bb      	ldr	r3, [r7, #8]
    1c64:	08d9      	lsrs	r1, r3, #3
    1c66:	68fb      	ldr	r3, [r7, #12]
    1c68:	f853 3021 	ldr.w	r3, [r3, r1, lsl #2]
    1c6c:	7df9      	ldrb	r1, [r7, #23]
    1c6e:	200f      	movs	r0, #15
    1c70:	fa00 f101 	lsl.w	r1, r0, r1
    1c74:	43c9      	mvns	r1, r1
    1c76:	4019      	ands	r1, r3
    1c78:	68fb      	ldr	r3, [r7, #12]
    1c7a:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
	port->CR[pin>>3]|=config<<shift;
    1c7e:	68bb      	ldr	r3, [r7, #8]
    1c80:	08da      	lsrs	r2, r3, #3
    1c82:	68bb      	ldr	r3, [r7, #8]
    1c84:	08d9      	lsrs	r1, r3, #3
    1c86:	68fb      	ldr	r3, [r7, #12]
    1c88:	f853 1021 	ldr.w	r1, [r3, r1, lsl #2]
    1c8c:	7dfb      	ldrb	r3, [r7, #23]
    1c8e:	6878      	ldr	r0, [r7, #4]
    1c90:	fa00 f303 	lsl.w	r3, r0, r3
    1c94:	4319      	orrs	r1, r3
    1c96:	68fb      	ldr	r3, [r7, #12]
    1c98:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
}
    1c9c:	371c      	adds	r7, #28
    1c9e:	46bd      	mov	sp, r7
    1ca0:	f85d 7b04 	ldr.w	r7, [sp], #4
    1ca4:	4770      	bx	lr
    1ca6:	bf00      	nop

00001ca8 <read_pin>:

int read_pin(gpio_t* port, unsigned pin){
    1ca8:	b480      	push	{r7}
    1caa:	b083      	sub	sp, #12
    1cac:	af00      	add	r7, sp, #0
    1cae:	6078      	str	r0, [r7, #4]
    1cb0:	6039      	str	r1, [r7, #0]
	return port->IDR&(1<<pin);
    1cb2:	687b      	ldr	r3, [r7, #4]
    1cb4:	689b      	ldr	r3, [r3, #8]
    1cb6:	683a      	ldr	r2, [r7, #0]
    1cb8:	2101      	movs	r1, #1
    1cba:	fa01 f202 	lsl.w	r2, r1, r2
    1cbe:	4013      	ands	r3, r2
}
    1cc0:	4618      	mov	r0, r3
    1cc2:	370c      	adds	r7, #12
    1cc4:	46bd      	mov	sp, r7
    1cc6:	f85d 7b04 	ldr.w	r7, [sp], #4
    1cca:	4770      	bx	lr

00001ccc <write_pin>:

void write_pin(gpio_t* port, unsigned pin, int value){
    1ccc:	b480      	push	{r7}
    1cce:	b085      	sub	sp, #20
    1cd0:	af00      	add	r7, sp, #0
    1cd2:	60f8      	str	r0, [r7, #12]
    1cd4:	60b9      	str	r1, [r7, #8]
    1cd6:	607a      	str	r2, [r7, #4]
	value?(port->ODR|=(1<<pin)):(port->ODR&=~(1<<pin));
    1cd8:	687b      	ldr	r3, [r7, #4]
    1cda:	2b00      	cmp	r3, #0
    1cdc:	d009      	beq.n	1cf2 <write_pin+0x26>
    1cde:	68fb      	ldr	r3, [r7, #12]
    1ce0:	68db      	ldr	r3, [r3, #12]
    1ce2:	68ba      	ldr	r2, [r7, #8]
    1ce4:	2101      	movs	r1, #1
    1ce6:	fa01 f202 	lsl.w	r2, r1, r2
    1cea:	431a      	orrs	r2, r3
    1cec:	68fb      	ldr	r3, [r7, #12]
    1cee:	60da      	str	r2, [r3, #12]
    1cf0:	e009      	b.n	1d06 <write_pin+0x3a>
    1cf2:	68fb      	ldr	r3, [r7, #12]
    1cf4:	68db      	ldr	r3, [r3, #12]
    1cf6:	68ba      	ldr	r2, [r7, #8]
    1cf8:	2101      	movs	r1, #1
    1cfa:	fa01 f202 	lsl.w	r2, r1, r2
    1cfe:	43d2      	mvns	r2, r2
    1d00:	401a      	ands	r2, r3
    1d02:	68fb      	ldr	r3, [r7, #12]
    1d04:	60da      	str	r2, [r3, #12]
}
    1d06:	3714      	adds	r7, #20
    1d08:	46bd      	mov	sp, r7
    1d0a:	f85d 7b04 	ldr.w	r7, [sp], #4
    1d0e:	4770      	bx	lr

00001d10 <toggle_pin>:

void toggle_pin(gpio_t* port, unsigned pin){
    1d10:	b480      	push	{r7}
    1d12:	b083      	sub	sp, #12
    1d14:	af00      	add	r7, sp, #0
    1d16:	6078      	str	r0, [r7, #4]
    1d18:	6039      	str	r1, [r7, #0]
	port->ODR^=(1<<pin);
    1d1a:	687b      	ldr	r3, [r7, #4]
    1d1c:	68db      	ldr	r3, [r3, #12]
    1d1e:	683a      	ldr	r2, [r7, #0]
    1d20:	2101      	movs	r1, #1
    1d22:	fa01 f202 	lsl.w	r2, r1, r2
    1d26:	405a      	eors	r2, r3
    1d28:	687b      	ldr	r3, [r7, #4]
    1d2a:	60da      	str	r2, [r3, #12]
}
    1d2c:	370c      	adds	r7, #12
    1d2e:	46bd      	mov	sp, r7
    1d30:	f85d 7b04 	ldr.w	r7, [sp], #4
    1d34:	4770      	bx	lr
    1d36:	bf00      	nop

00001d38 <keyboard_init>:
    ps2_flags = 0;
    return KbdSend(KBD_RESET);
}//KbdReset()
*/
 
void keyboard_init(){
    1d38:	b580      	push	{r7, lr}
    1d3a:	af00      	add	r7, sp, #0
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
    1d3c:	4a1f      	ldr	r2, [pc, #124]	; (1dbc <keyboard_init+0x84>)
    1d3e:	4b1f      	ldr	r3, [pc, #124]	; (1dbc <keyboard_init+0x84>)
    1d40:	699b      	ldr	r3, [r3, #24]
    1d42:	f043 0305 	orr.w	r3, r3, #5
    1d46:	6193      	str	r3, [r2, #24]
	// activation clock TMR2
	RCC->APB1ENR|=RCC_APB1ENR_TIM2EN; 
    1d48:	4a1c      	ldr	r2, [pc, #112]	; (1dbc <keyboard_init+0x84>)
    1d4a:	4b1c      	ldr	r3, [pc, #112]	; (1dbc <keyboard_init+0x84>)
    1d4c:	69db      	ldr	r3, [r3, #28]
    1d4e:	f043 0301 	orr.w	r3, r3, #1
    1d52:	61d3      	str	r3, [r2, #28]
	TMR2->ARR=FAPB1/20*.01;
    1d54:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1d58:	f243 72ee 	movw	r2, #14318	; 0x37ee
    1d5c:	62da      	str	r2, [r3, #44]	; 0x2c
	TMR2->PSC=20;
    1d5e:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1d62:	2214      	movs	r2, #20
    1d64:	629a      	str	r2, [r3, #40]	; 0x28
	TMR2->CR1=BIT0|BIT7; // ARPE
    1d66:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1d6a:	2281      	movs	r2, #129	; 0x81
    1d6c:	601a      	str	r2, [r3, #0]
	TMR2->DIER=BIT0; // UIE
    1d6e:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1d72:	2201      	movs	r2, #1
    1d74:	60da      	str	r2, [r3, #12]
	set_int_priority(IRQ_KBD_CLK,0);
    1d76:	2017      	movs	r0, #23
    1d78:	2100      	movs	r1, #0
    1d7a:	f000 fb41 	bl	2400 <set_int_priority>
	set_int_priority(IRQ_TIM2,14);
    1d7e:	201c      	movs	r0, #28
    1d80:	210e      	movs	r1, #14
    1d82:	f000 fb3d 	bl	2400 <set_int_priority>
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
    1d86:	4a0e      	ldr	r2, [pc, #56]	; (1dc0 <keyboard_init+0x88>)
    1d88:	4b0d      	ldr	r3, [pc, #52]	; (1dc0 <keyboard_init+0x88>)
    1d8a:	68db      	ldr	r3, [r3, #12]
    1d8c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1d90:	60d3      	str	r3, [r2, #12]
	EXTI->IMR|=KBD_CLK_PIN;
    1d92:	4a0b      	ldr	r2, [pc, #44]	; (1dc0 <keyboard_init+0x88>)
    1d94:	4b0a      	ldr	r3, [pc, #40]	; (1dc0 <keyboard_init+0x88>)
    1d96:	681b      	ldr	r3, [r3, #0]
    1d98:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1d9c:	6013      	str	r3, [r2, #0]
	enable_interrupt(IRQ_KBD_CLK);
    1d9e:	2017      	movs	r0, #23
    1da0:	f000 fa62 	bl	2268 <enable_interrupt>
	TMR2->SR&=~BIT0;
    1da4:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    1da8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1dac:	691b      	ldr	r3, [r3, #16]
    1dae:	f023 0301 	bic.w	r3, r3, #1
    1db2:	6113      	str	r3, [r2, #16]
	enable_interrupt(IRQ_TIM2);
    1db4:	201c      	movs	r0, #28
    1db6:	f000 fa57 	bl	2268 <enable_interrupt>
	//pause(700);
	//if (!KbdReset()) print("keyboard reset failed\n");
}
    1dba:	bd80      	pop	{r7, pc}
    1dbc:	40021000 	.word	0x40021000
    1dc0:	40010400 	.word	0x40010400

00001dc4 <search_table>:
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
    1dc4:	b480      	push	{r7}
    1dc6:	b083      	sub	sp, #12
    1dc8:	af00      	add	r7, sp, #0
    1dca:	6078      	str	r0, [r7, #4]
    1dcc:	460b      	mov	r3, r1
    1dce:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    1dd0:	e008      	b.n	1de4 <search_table+0x20>
		if (table->code==code) break;
    1dd2:	687b      	ldr	r3, [r7, #4]
    1dd4:	781b      	ldrb	r3, [r3, #0]
    1dd6:	78fa      	ldrb	r2, [r7, #3]
    1dd8:	429a      	cmp	r2, r3
    1dda:	d100      	bne.n	1dde <search_table+0x1a>
    1ddc:	e006      	b.n	1dec <search_table+0x28>
		table++;
    1dde:	687b      	ldr	r3, [r7, #4]
    1de0:	3302      	adds	r3, #2
    1de2:	607b      	str	r3, [r7, #4]

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
    1de4:	687b      	ldr	r3, [r7, #4]
    1de6:	781b      	ldrb	r3, [r3, #0]
    1de8:	2b00      	cmp	r3, #0
    1dea:	d1f2      	bne.n	1dd2 <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    1dec:	687b      	ldr	r3, [r7, #4]
    1dee:	785b      	ldrb	r3, [r3, #1]
}
    1df0:	4618      	mov	r0, r3
    1df2:	370c      	adds	r7, #12
    1df4:	46bd      	mov	sp, r7
    1df6:	f85d 7b04 	ldr.w	r7, [sp], #4
    1dfa:	4770      	bx	lr

00001dfc <convert_code>:

static void convert_code(unsigned char code){
    1dfc:	b580      	push	{r7, lr}
    1dfe:	b086      	sub	sp, #24
    1e00:	af00      	add	r7, sp, #0
    1e02:	4603      	mov	r3, r0
    1e04:	71fb      	strb	r3, [r7, #7]
		unsigned char c,s;
		int shift;
		if (!(con.dev==LOCAL)) return;
    1e06:	4ba1      	ldr	r3, [pc, #644]	; (208c <convert_code+0x290>)
    1e08:	781b      	ldrb	r3, [r3, #0]
    1e0a:	2b00      	cmp	r3, #0
    1e0c:	d000      	beq.n	1e10 <convert_code+0x14>
    1e0e:	e139      	b.n	2084 <convert_code+0x288>
		switch (code){
    1e10:	79fb      	ldrb	r3, [r7, #7]
    1e12:	2b59      	cmp	r3, #89	; 0x59
    1e14:	f000 8085 	beq.w	1f22 <convert_code+0x126>
    1e18:	2b59      	cmp	r3, #89	; 0x59
    1e1a:	dc0e      	bgt.n	1e3a <convert_code+0x3e>
    1e1c:	2b12      	cmp	r3, #18
    1e1e:	d038      	beq.n	1e92 <convert_code+0x96>
    1e20:	2b12      	cmp	r3, #18
    1e22:	dc03      	bgt.n	1e2c <convert_code+0x30>
    1e24:	2b11      	cmp	r3, #17
    1e26:	f000 80a4 	beq.w	1f72 <convert_code+0x176>
    1e2a:	e0ca      	b.n	1fc2 <convert_code+0x1c6>
    1e2c:	2b14      	cmp	r3, #20
    1e2e:	f000 808c 	beq.w	1f4a <convert_code+0x14e>
    1e32:	2b58      	cmp	r3, #88	; 0x58
    1e34:	f000 80b1 	beq.w	1f9a <convert_code+0x19e>
    1e38:	e0c3      	b.n	1fc2 <convert_code+0x1c6>
    1e3a:	2be0      	cmp	r3, #224	; 0xe0
    1e3c:	d010      	beq.n	1e60 <convert_code+0x64>
    1e3e:	2be0      	cmp	r3, #224	; 0xe0
    1e40:	dc02      	bgt.n	1e48 <convert_code+0x4c>
    1e42:	2b7c      	cmp	r3, #124	; 0x7c
    1e44:	d047      	beq.n	1ed6 <convert_code+0xda>
    1e46:	e0bc      	b.n	1fc2 <convert_code+0x1c6>
    1e48:	2be1      	cmp	r3, #225	; 0xe1
    1e4a:	d010      	beq.n	1e6e <convert_code+0x72>
    1e4c:	2bf0      	cmp	r3, #240	; 0xf0
    1e4e:	f040 80b8 	bne.w	1fc2 <convert_code+0x1c6>
		case 0xF0:
			flags |= RELEASE;
    1e52:	4b8f      	ldr	r3, [pc, #572]	; (2090 <convert_code+0x294>)
    1e54:	681b      	ldr	r3, [r3, #0]
    1e56:	f043 0302 	orr.w	r3, r3, #2
    1e5a:	4a8d      	ldr	r2, [pc, #564]	; (2090 <convert_code+0x294>)
    1e5c:	6013      	str	r3, [r2, #0]
			break;
    1e5e:	e111      	b.n	2084 <convert_code+0x288>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    1e60:	4b8b      	ldr	r3, [pc, #556]	; (2090 <convert_code+0x294>)
    1e62:	681b      	ldr	r3, [r3, #0]
    1e64:	f043 0301 	orr.w	r3, r3, #1
    1e68:	4a89      	ldr	r2, [pc, #548]	; (2090 <convert_code+0x294>)
    1e6a:	6013      	str	r3, [r2, #0]
			break;
    1e6c:	e10a      	b.n	2084 <convert_code+0x288>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    1e6e:	4b88      	ldr	r3, [pc, #544]	; (2090 <convert_code+0x294>)
    1e70:	681b      	ldr	r3, [r3, #0]
    1e72:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    1e76:	4a86      	ldr	r2, [pc, #536]	; (2090 <convert_code+0x294>)
    1e78:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    1e7a:	4b85      	ldr	r3, [pc, #532]	; (2090 <convert_code+0x294>)
    1e7c:	681b      	ldr	r3, [r3, #0]
    1e7e:	f403 7380 	and.w	r3, r3, #256	; 0x100
    1e82:	2b00      	cmp	r3, #0
    1e84:	d104      	bne.n	1e90 <convert_code+0x94>
				con.insert(PAUSE);
    1e86:	4b81      	ldr	r3, [pc, #516]	; (208c <convert_code+0x290>)
    1e88:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    1e8a:	2094      	movs	r0, #148	; 0x94
    1e8c:	4798      	blx	r3
			}
			break;
    1e8e:	e0f9      	b.n	2084 <convert_code+0x288>
    1e90:	e0f8      	b.n	2084 <convert_code+0x288>
		case LSHIFT:
			if (flags&RELEASE){
    1e92:	4b7f      	ldr	r3, [pc, #508]	; (2090 <convert_code+0x294>)
    1e94:	681b      	ldr	r3, [r3, #0]
    1e96:	f003 0302 	and.w	r3, r3, #2
    1e9a:	2b00      	cmp	r3, #0
    1e9c:	d006      	beq.n	1eac <convert_code+0xb0>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    1e9e:	4b7c      	ldr	r3, [pc, #496]	; (2090 <convert_code+0x294>)
    1ea0:	681b      	ldr	r3, [r3, #0]
    1ea2:	f023 0307 	bic.w	r3, r3, #7
    1ea6:	4a7a      	ldr	r2, [pc, #488]	; (2090 <convert_code+0x294>)
    1ea8:	6013      	str	r3, [r2, #0]
    1eaa:	e013      	b.n	1ed4 <convert_code+0xd8>
			}else{
				if (flags&XTD_CODE){
    1eac:	4b78      	ldr	r3, [pc, #480]	; (2090 <convert_code+0x294>)
    1eae:	681b      	ldr	r3, [r3, #0]
    1eb0:	f003 0301 	and.w	r3, r3, #1
    1eb4:	2b00      	cmp	r3, #0
    1eb6:	d006      	beq.n	1ec6 <convert_code+0xca>
					flags|=PRNSCR;
    1eb8:	4b75      	ldr	r3, [pc, #468]	; (2090 <convert_code+0x294>)
    1eba:	681b      	ldr	r3, [r3, #0]
    1ebc:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1ec0:	4a73      	ldr	r2, [pc, #460]	; (2090 <convert_code+0x294>)
    1ec2:	6013      	str	r3, [r2, #0]
    1ec4:	e006      	b.n	1ed4 <convert_code+0xd8>
				}else{
					flags|=LEFT_SHIFT;
    1ec6:	4b72      	ldr	r3, [pc, #456]	; (2090 <convert_code+0x294>)
    1ec8:	681b      	ldr	r3, [r3, #0]
    1eca:	f043 0304 	orr.w	r3, r3, #4
    1ece:	4a70      	ldr	r2, [pc, #448]	; (2090 <convert_code+0x294>)
    1ed0:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1ed2:	e0d7      	b.n	2084 <convert_code+0x288>
    1ed4:	e0d6      	b.n	2084 <convert_code+0x288>
		case KPMUL:
			if (flags&RELEASE){
    1ed6:	4b6e      	ldr	r3, [pc, #440]	; (2090 <convert_code+0x294>)
    1ed8:	681b      	ldr	r3, [r3, #0]
    1eda:	f003 0302 	and.w	r3, r3, #2
    1ede:	2b00      	cmp	r3, #0
    1ee0:	d006      	beq.n	1ef0 <convert_code+0xf4>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    1ee2:	4b6b      	ldr	r3, [pc, #428]	; (2090 <convert_code+0x294>)
    1ee4:	681b      	ldr	r3, [r3, #0]
    1ee6:	f023 0303 	bic.w	r3, r3, #3
    1eea:	4a69      	ldr	r2, [pc, #420]	; (2090 <convert_code+0x294>)
    1eec:	6013      	str	r3, [r2, #0]
    1eee:	e017      	b.n	1f20 <convert_code+0x124>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    1ef0:	4b67      	ldr	r3, [pc, #412]	; (2090 <convert_code+0x294>)
    1ef2:	681b      	ldr	r3, [r3, #0]
    1ef4:	f003 0301 	and.w	r3, r3, #1
    1ef8:	2b00      	cmp	r3, #0
    1efa:	d00c      	beq.n	1f16 <convert_code+0x11a>
					flags&=~(XTD_CODE|PRNSCR);
    1efc:	4b64      	ldr	r3, [pc, #400]	; (2090 <convert_code+0x294>)
    1efe:	681b      	ldr	r3, [r3, #0]
    1f00:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    1f04:	f023 0301 	bic.w	r3, r3, #1
    1f08:	4a61      	ldr	r2, [pc, #388]	; (2090 <convert_code+0x294>)
    1f0a:	6013      	str	r3, [r2, #0]
					con.insert(PRN);
    1f0c:	4b5f      	ldr	r3, [pc, #380]	; (208c <convert_code+0x290>)
    1f0e:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    1f10:	2092      	movs	r0, #146	; 0x92
    1f12:	4798      	blx	r3
    1f14:	e004      	b.n	1f20 <convert_code+0x124>
				}else{
					con.insert('*');
    1f16:	4b5d      	ldr	r3, [pc, #372]	; (208c <convert_code+0x290>)
    1f18:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    1f1a:	202a      	movs	r0, #42	; 0x2a
    1f1c:	4798      	blx	r3
				}
			}
			break;
    1f1e:	e0b1      	b.n	2084 <convert_code+0x288>
    1f20:	e0b0      	b.n	2084 <convert_code+0x288>
		case RSHIFT:
			if (flags&RELEASE){
    1f22:	4b5b      	ldr	r3, [pc, #364]	; (2090 <convert_code+0x294>)
    1f24:	681b      	ldr	r3, [r3, #0]
    1f26:	f003 0302 	and.w	r3, r3, #2
    1f2a:	2b00      	cmp	r3, #0
    1f2c:	d006      	beq.n	1f3c <convert_code+0x140>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    1f2e:	4b58      	ldr	r3, [pc, #352]	; (2090 <convert_code+0x294>)
    1f30:	681b      	ldr	r3, [r3, #0]
    1f32:	f023 030b 	bic.w	r3, r3, #11
    1f36:	4a56      	ldr	r2, [pc, #344]	; (2090 <convert_code+0x294>)
    1f38:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    1f3a:	e0a3      	b.n	2084 <convert_code+0x288>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    1f3c:	4b54      	ldr	r3, [pc, #336]	; (2090 <convert_code+0x294>)
    1f3e:	681b      	ldr	r3, [r3, #0]
    1f40:	f043 0308 	orr.w	r3, r3, #8
    1f44:	4a52      	ldr	r2, [pc, #328]	; (2090 <convert_code+0x294>)
    1f46:	6013      	str	r3, [r2, #0]
			}
			break;
    1f48:	e09c      	b.n	2084 <convert_code+0x288>
		case LCTRL:
			if (flags&RELEASE){
    1f4a:	4b51      	ldr	r3, [pc, #324]	; (2090 <convert_code+0x294>)
    1f4c:	681b      	ldr	r3, [r3, #0]
    1f4e:	f003 0302 	and.w	r3, r3, #2
    1f52:	2b00      	cmp	r3, #0
    1f54:	d006      	beq.n	1f64 <convert_code+0x168>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    1f56:	4b4e      	ldr	r3, [pc, #312]	; (2090 <convert_code+0x294>)
    1f58:	681b      	ldr	r3, [r3, #0]
    1f5a:	f023 0313 	bic.w	r3, r3, #19
    1f5e:	4a4c      	ldr	r2, [pc, #304]	; (2090 <convert_code+0x294>)
    1f60:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_CTRL;
			}
			break;
    1f62:	e08f      	b.n	2084 <convert_code+0x288>
			break;
		case LCTRL:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
			}else{
				flags|=LEFT_CTRL;
    1f64:	4b4a      	ldr	r3, [pc, #296]	; (2090 <convert_code+0x294>)
    1f66:	681b      	ldr	r3, [r3, #0]
    1f68:	f043 0310 	orr.w	r3, r3, #16
    1f6c:	4a48      	ldr	r2, [pc, #288]	; (2090 <convert_code+0x294>)
    1f6e:	6013      	str	r3, [r2, #0]
			}
			break;
    1f70:	e088      	b.n	2084 <convert_code+0x288>
		case LALT:
			if (flags&RELEASE){
    1f72:	4b47      	ldr	r3, [pc, #284]	; (2090 <convert_code+0x294>)
    1f74:	681b      	ldr	r3, [r3, #0]
    1f76:	f003 0302 	and.w	r3, r3, #2
    1f7a:	2b00      	cmp	r3, #0
    1f7c:	d006      	beq.n	1f8c <convert_code+0x190>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    1f7e:	4b44      	ldr	r3, [pc, #272]	; (2090 <convert_code+0x294>)
    1f80:	681b      	ldr	r3, [r3, #0]
    1f82:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    1f86:	4a42      	ldr	r2, [pc, #264]	; (2090 <convert_code+0x294>)
    1f88:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    1f8a:	e07b      	b.n	2084 <convert_code+0x288>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    1f8c:	4b40      	ldr	r3, [pc, #256]	; (2090 <convert_code+0x294>)
    1f8e:	681b      	ldr	r3, [r3, #0]
    1f90:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1f94:	4a3e      	ldr	r2, [pc, #248]	; (2090 <convert_code+0x294>)
    1f96:	6013      	str	r3, [r2, #0]
			}
			break;
    1f98:	e074      	b.n	2084 <convert_code+0x288>
		case CAPS_LOCK:
			if (flags&RELEASE){
    1f9a:	4b3d      	ldr	r3, [pc, #244]	; (2090 <convert_code+0x294>)
    1f9c:	681b      	ldr	r3, [r3, #0]
    1f9e:	f003 0302 	and.w	r3, r3, #2
    1fa2:	2b00      	cmp	r3, #0
    1fa4:	d006      	beq.n	1fb4 <convert_code+0x1b8>
				flags&=~(RELEASE|XTD_CODE);
    1fa6:	4b3a      	ldr	r3, [pc, #232]	; (2090 <convert_code+0x294>)
    1fa8:	681b      	ldr	r3, [r3, #0]
    1faa:	f023 0303 	bic.w	r3, r3, #3
    1fae:	4a38      	ldr	r2, [pc, #224]	; (2090 <convert_code+0x294>)
    1fb0:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    1fb2:	e067      	b.n	2084 <convert_code+0x288>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    1fb4:	4b36      	ldr	r3, [pc, #216]	; (2090 <convert_code+0x294>)
    1fb6:	681b      	ldr	r3, [r3, #0]
    1fb8:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    1fbc:	4a34      	ldr	r2, [pc, #208]	; (2090 <convert_code+0x294>)
    1fbe:	6013      	str	r3, [r2, #0]
			}
			break;
    1fc0:	e060      	b.n	2084 <convert_code+0x288>
		default:
			if (!(flags&RELEASE)){
    1fc2:	4b33      	ldr	r3, [pc, #204]	; (2090 <convert_code+0x294>)
    1fc4:	681b      	ldr	r3, [r3, #0]
    1fc6:	f003 0302 	and.w	r3, r3, #2
    1fca:	2b00      	cmp	r3, #0
    1fcc:	d153      	bne.n	2076 <convert_code+0x27a>
					if (flags&XTD_CODE){
    1fce:	4b30      	ldr	r3, [pc, #192]	; (2090 <convert_code+0x294>)
    1fd0:	681b      	ldr	r3, [r3, #0]
    1fd2:	f003 0301 	and.w	r3, r3, #1
    1fd6:	2b00      	cmp	r3, #0
    1fd8:	d00d      	beq.n	1ff6 <convert_code+0x1fa>
						c=search_table(mcsaite_xkey,code);
    1fda:	79fb      	ldrb	r3, [r7, #7]
    1fdc:	482d      	ldr	r0, [pc, #180]	; (2094 <convert_code+0x298>)
    1fde:	4619      	mov	r1, r3
    1fe0:	f7ff fef0 	bl	1dc4 <search_table>
    1fe4:	4603      	mov	r3, r0
    1fe6:	75fb      	strb	r3, [r7, #23]
						flags&=~XTD_CODE;
    1fe8:	4b29      	ldr	r3, [pc, #164]	; (2090 <convert_code+0x294>)
    1fea:	681b      	ldr	r3, [r3, #0]
    1fec:	f023 0301 	bic.w	r3, r3, #1
    1ff0:	4a27      	ldr	r2, [pc, #156]	; (2090 <convert_code+0x294>)
    1ff2:	6013      	str	r3, [r2, #0]
    1ff4:	e006      	b.n	2004 <convert_code+0x208>
					}else{
						c=search_table(mcsaite_key,code);
    1ff6:	79fb      	ldrb	r3, [r7, #7]
    1ff8:	4827      	ldr	r0, [pc, #156]	; (2098 <convert_code+0x29c>)
    1ffa:	4619      	mov	r1, r3
    1ffc:	f7ff fee2 	bl	1dc4 <search_table>
    2000:	4603      	mov	r3, r0
    2002:	75fb      	strb	r3, [r7, #23]
					}
					shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    2004:	4b22      	ldr	r3, [pc, #136]	; (2090 <convert_code+0x294>)
    2006:	681b      	ldr	r3, [r3, #0]
    2008:	f003 030c 	and.w	r3, r3, #12
    200c:	613b      	str	r3, [r7, #16]
					if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    200e:	7dfb      	ldrb	r3, [r7, #23]
    2010:	2b60      	cmp	r3, #96	; 0x60
    2012:	d918      	bls.n	2046 <convert_code+0x24a>
    2014:	7dfb      	ldrb	r3, [r7, #23]
    2016:	2b7a      	cmp	r3, #122	; 0x7a
    2018:	d815      	bhi.n	2046 <convert_code+0x24a>
    201a:	693b      	ldr	r3, [r7, #16]
    201c:	2b00      	cmp	r3, #0
    201e:	d005      	beq.n	202c <convert_code+0x230>
    2020:	4b1b      	ldr	r3, [pc, #108]	; (2090 <convert_code+0x294>)
    2022:	681b      	ldr	r3, [r3, #0]
    2024:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2028:	2b00      	cmp	r3, #0
    202a:	d008      	beq.n	203e <convert_code+0x242>
    202c:	693b      	ldr	r3, [r7, #16]
    202e:	2b00      	cmp	r3, #0
    2030:	d109      	bne.n	2046 <convert_code+0x24a>
    2032:	4b17      	ldr	r3, [pc, #92]	; (2090 <convert_code+0x294>)
    2034:	681b      	ldr	r3, [r3, #0]
    2036:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    203a:	2b00      	cmp	r3, #0
    203c:	d003      	beq.n	2046 <convert_code+0x24a>
						c-=32;
    203e:	7dfb      	ldrb	r3, [r7, #23]
    2040:	3b20      	subs	r3, #32
    2042:	75fb      	strb	r3, [r7, #23]
    2044:	e00e      	b.n	2064 <convert_code+0x268>
					}else if (shift && (s=search_table(mcsaite_shey,c))){
    2046:	693b      	ldr	r3, [r7, #16]
    2048:	2b00      	cmp	r3, #0
    204a:	d00b      	beq.n	2064 <convert_code+0x268>
    204c:	7dfb      	ldrb	r3, [r7, #23]
    204e:	4813      	ldr	r0, [pc, #76]	; (209c <convert_code+0x2a0>)
    2050:	4619      	mov	r1, r3
    2052:	f7ff feb7 	bl	1dc4 <search_table>
    2056:	4603      	mov	r3, r0
    2058:	73fb      	strb	r3, [r7, #15]
    205a:	7bfb      	ldrb	r3, [r7, #15]
    205c:	2b00      	cmp	r3, #0
    205e:	d001      	beq.n	2064 <convert_code+0x268>
						c=s;
    2060:	7bfb      	ldrb	r3, [r7, #15]
    2062:	75fb      	strb	r3, [r7, #23]
					}
					if (c){
    2064:	7dfb      	ldrb	r3, [r7, #23]
    2066:	2b00      	cmp	r3, #0
    2068:	d00b      	beq.n	2082 <convert_code+0x286>
						con.insert(c);
    206a:	4b08      	ldr	r3, [pc, #32]	; (208c <convert_code+0x290>)
    206c:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    206e:	7dfa      	ldrb	r2, [r7, #23]
    2070:	4610      	mov	r0, r2
    2072:	4798      	blx	r3
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    2074:	e006      	b.n	2084 <convert_code+0x288>
					}
					if (c){
						con.insert(c);
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    2076:	4b06      	ldr	r3, [pc, #24]	; (2090 <convert_code+0x294>)
    2078:	681b      	ldr	r3, [r3, #0]
    207a:	f023 0303 	bic.w	r3, r3, #3
    207e:	4a04      	ldr	r2, [pc, #16]	; (2090 <convert_code+0x294>)
    2080:	6013      	str	r3, [r2, #0]
			}
			break;
    2082:	bf00      	nop
		}//switch
}// convert_code()
    2084:	3718      	adds	r7, #24
    2086:	46bd      	mov	sp, r7
    2088:	bd80      	pop	{r7, pc}
    208a:	bf00      	nop
    208c:	200000e8 	.word	0x200000e8
    2090:	200000b8 	.word	0x200000b8
    2094:	00003370 	.word	0x00003370
    2098:	000032b8 	.word	0x000032b8
    209c:	00003344 	.word	0x00003344

000020a0 <EXTI9_5_handler>:
#define PS2_QUEUE_SIZE (16)
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];

// signal clock du clavier PS/2
__attribute__((optimize("-O0"))) void KBD_CLK_handler(){
    20a0:	b480      	push	{r7}
    20a2:	b083      	sub	sp, #12
    20a4:	af00      	add	r7, sp, #0
	volatile  static unsigned char  in_byte=0,bit_cnt=0;
    volatile unsigned char parity; 

#define data_bit  (KBD_PORT->IDR & KBD_DAT_PIN)
	EXTI->PR|=KBD_CLK_PIN; 
    20a6:	4a51      	ldr	r2, [pc, #324]	; (21ec <EXTI9_5_handler+0x14c>)
    20a8:	4b50      	ldr	r3, [pc, #320]	; (21ec <EXTI9_5_handler+0x14c>)
    20aa:	695b      	ldr	r3, [r3, #20]
    20ac:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    20b0:	6153      	str	r3, [r2, #20]
    switch (bit_cnt){
    20b2:	4b4f      	ldr	r3, [pc, #316]	; (21f0 <EXTI9_5_handler+0x150>)
    20b4:	781b      	ldrb	r3, [r3, #0]
    20b6:	b2db      	uxtb	r3, r3
    20b8:	2b09      	cmp	r3, #9
    20ba:	d01f      	beq.n	20fc <EXTI9_5_handler+0x5c>
    20bc:	2b0a      	cmp	r3, #10
    20be:	d031      	beq.n	2124 <EXTI9_5_handler+0x84>
    20c0:	2b00      	cmp	r3, #0
    20c2:	d16c      	bne.n	219e <EXTI9_5_handler+0xfe>
	case 0:   // start bit
		ps2_flags&=~(F_ERROR|F_RCVD);
    20c4:	4b4b      	ldr	r3, [pc, #300]	; (21f4 <EXTI9_5_handler+0x154>)
    20c6:	781b      	ldrb	r3, [r3, #0]
    20c8:	b2db      	uxtb	r3, r3
    20ca:	f023 030b 	bic.w	r3, r3, #11
    20ce:	b2da      	uxtb	r2, r3
    20d0:	4b48      	ldr	r3, [pc, #288]	; (21f4 <EXTI9_5_handler+0x154>)
    20d2:	701a      	strb	r2, [r3, #0]
		if (!data_bit){
    20d4:	4b48      	ldr	r3, [pc, #288]	; (21f8 <EXTI9_5_handler+0x158>)
    20d6:	689b      	ldr	r3, [r3, #8]
    20d8:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    20dc:	2b00      	cmp	r3, #0
    20de:	d10c      	bne.n	20fa <EXTI9_5_handler+0x5a>
			in_byte=0;
    20e0:	4b46      	ldr	r3, [pc, #280]	; (21fc <EXTI9_5_handler+0x15c>)
    20e2:	2200      	movs	r2, #0
    20e4:	701a      	strb	r2, [r3, #0]
            parity=0;
    20e6:	2300      	movs	r3, #0
    20e8:	71fb      	strb	r3, [r7, #7]
            bit_cnt++;
    20ea:	4b41      	ldr	r3, [pc, #260]	; (21f0 <EXTI9_5_handler+0x150>)
    20ec:	781b      	ldrb	r3, [r3, #0]
    20ee:	b2db      	uxtb	r3, r3
    20f0:	3301      	adds	r3, #1
    20f2:	b2da      	uxtb	r2, r3
    20f4:	4b3e      	ldr	r3, [pc, #248]	; (21f0 <EXTI9_5_handler+0x150>)
    20f6:	701a      	strb	r2, [r3, #0]
        }
		break;
    20f8:	e073      	b.n	21e2 <EXTI9_5_handler+0x142>
    20fa:	e072      	b.n	21e2 <EXTI9_5_handler+0x142>
	case 9:   // paritée
		if (data_bit) parity++;
    20fc:	4b3e      	ldr	r3, [pc, #248]	; (21f8 <EXTI9_5_handler+0x158>)
    20fe:	689b      	ldr	r3, [r3, #8]
    2100:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2104:	2b00      	cmp	r3, #0
    2106:	d004      	beq.n	2112 <EXTI9_5_handler+0x72>
    2108:	79fb      	ldrb	r3, [r7, #7]
    210a:	b2db      	uxtb	r3, r3
    210c:	3301      	adds	r3, #1
    210e:	b2db      	uxtb	r3, r3
    2110:	71fb      	strb	r3, [r7, #7]
		if (!(parity & 1)){
    2112:	79fb      	ldrb	r3, [r7, #7]
			//ps2_flags |= F_ERR_PARITY;
			
		}
		bit_cnt++;
    2114:	4b36      	ldr	r3, [pc, #216]	; (21f0 <EXTI9_5_handler+0x150>)
    2116:	781b      	ldrb	r3, [r3, #0]
    2118:	b2db      	uxtb	r3, r3
    211a:	3301      	adds	r3, #1
    211c:	b2da      	uxtb	r2, r3
    211e:	4b34      	ldr	r3, [pc, #208]	; (21f0 <EXTI9_5_handler+0x150>)
    2120:	701a      	strb	r2, [r3, #0]
		break;
    2122:	e05e      	b.n	21e2 <EXTI9_5_handler+0x142>
	case 10:  // stop bit
	    if (!data_bit){
    2124:	4b34      	ldr	r3, [pc, #208]	; (21f8 <EXTI9_5_handler+0x158>)
    2126:	689b      	ldr	r3, [r3, #8]
    2128:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    212c:	2b00      	cmp	r3, #0
    212e:	d108      	bne.n	2142 <EXTI9_5_handler+0xa2>
			ps2_flags|=F_ERR_FRAME;
    2130:	4b30      	ldr	r3, [pc, #192]	; (21f4 <EXTI9_5_handler+0x154>)
    2132:	781b      	ldrb	r3, [r3, #0]
    2134:	b2db      	uxtb	r3, r3
    2136:	f043 0308 	orr.w	r3, r3, #8
    213a:	b2da      	uxtb	r2, r3
    213c:	4b2d      	ldr	r3, [pc, #180]	; (21f4 <EXTI9_5_handler+0x154>)
    213e:	701a      	strb	r2, [r3, #0]
    2140:	e029      	b.n	2196 <EXTI9_5_handler+0xf6>
		}else if (!(ps2_flags&F_ERROR)){
    2142:	4b2c      	ldr	r3, [pc, #176]	; (21f4 <EXTI9_5_handler+0x154>)
    2144:	781b      	ldrb	r3, [r3, #0]
    2146:	b2db      	uxtb	r3, r3
    2148:	f003 0309 	and.w	r3, r3, #9
    214c:	2b00      	cmp	r3, #0
    214e:	d122      	bne.n	2196 <EXTI9_5_handler+0xf6>
			if (in_byte==BAT_OK){
    2150:	4b2a      	ldr	r3, [pc, #168]	; (21fc <EXTI9_5_handler+0x15c>)
    2152:	781b      	ldrb	r3, [r3, #0]
    2154:	b2db      	uxtb	r3, r3
    2156:	2baa      	cmp	r3, #170	; 0xaa
    2158:	d108      	bne.n	216c <EXTI9_5_handler+0xcc>
				ps2_flags|=F_BATOK;
    215a:	4b26      	ldr	r3, [pc, #152]	; (21f4 <EXTI9_5_handler+0x154>)
    215c:	781b      	ldrb	r3, [r3, #0]
    215e:	b2db      	uxtb	r3, r3
    2160:	f043 0304 	orr.w	r3, r3, #4
    2164:	b2da      	uxtb	r2, r3
    2166:	4b23      	ldr	r3, [pc, #140]	; (21f4 <EXTI9_5_handler+0x154>)
    2168:	701a      	strb	r2, [r3, #0]
    216a:	e014      	b.n	2196 <EXTI9_5_handler+0xf6>
			}else{
				ps2_queue[ps2_tail++]=in_byte;
    216c:	4b24      	ldr	r3, [pc, #144]	; (2200 <EXTI9_5_handler+0x160>)
    216e:	781b      	ldrb	r3, [r3, #0]
    2170:	b2db      	uxtb	r3, r3
    2172:	1c5a      	adds	r2, r3, #1
    2174:	b2d1      	uxtb	r1, r2
    2176:	4a22      	ldr	r2, [pc, #136]	; (2200 <EXTI9_5_handler+0x160>)
    2178:	7011      	strb	r1, [r2, #0]
    217a:	461a      	mov	r2, r3
    217c:	4b1f      	ldr	r3, [pc, #124]	; (21fc <EXTI9_5_handler+0x15c>)
    217e:	781b      	ldrb	r3, [r3, #0]
    2180:	b2d9      	uxtb	r1, r3
    2182:	4b20      	ldr	r3, [pc, #128]	; (2204 <EXTI9_5_handler+0x164>)
    2184:	5499      	strb	r1, [r3, r2]
				ps2_tail&=PS2_QUEUE_SIZE-1;
    2186:	4b1e      	ldr	r3, [pc, #120]	; (2200 <EXTI9_5_handler+0x160>)
    2188:	781b      	ldrb	r3, [r3, #0]
    218a:	b2db      	uxtb	r3, r3
    218c:	f003 030f 	and.w	r3, r3, #15
    2190:	b2da      	uxtb	r2, r3
    2192:	4b1b      	ldr	r3, [pc, #108]	; (2200 <EXTI9_5_handler+0x160>)
    2194:	701a      	strb	r2, [r3, #0]
			}
	    }
	    bit_cnt=0;
    2196:	4b16      	ldr	r3, [pc, #88]	; (21f0 <EXTI9_5_handler+0x150>)
    2198:	2200      	movs	r2, #0
    219a:	701a      	strb	r2, [r3, #0]
		break;
    219c:	e021      	b.n	21e2 <EXTI9_5_handler+0x142>
	default:
		in_byte >>=1;
    219e:	4b17      	ldr	r3, [pc, #92]	; (21fc <EXTI9_5_handler+0x15c>)
    21a0:	781b      	ldrb	r3, [r3, #0]
    21a2:	b2db      	uxtb	r3, r3
    21a4:	085b      	lsrs	r3, r3, #1
    21a6:	b2da      	uxtb	r2, r3
    21a8:	4b14      	ldr	r3, [pc, #80]	; (21fc <EXTI9_5_handler+0x15c>)
    21aa:	701a      	strb	r2, [r3, #0]
		if(data_bit){
    21ac:	4b12      	ldr	r3, [pc, #72]	; (21f8 <EXTI9_5_handler+0x158>)
    21ae:	689b      	ldr	r3, [r3, #8]
    21b0:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    21b4:	2b00      	cmp	r3, #0
    21b6:	d00c      	beq.n	21d2 <EXTI9_5_handler+0x132>
			in_byte |=128;
    21b8:	4b10      	ldr	r3, [pc, #64]	; (21fc <EXTI9_5_handler+0x15c>)
    21ba:	781b      	ldrb	r3, [r3, #0]
    21bc:	b2db      	uxtb	r3, r3
    21be:	f063 037f 	orn	r3, r3, #127	; 0x7f
    21c2:	b2da      	uxtb	r2, r3
    21c4:	4b0d      	ldr	r3, [pc, #52]	; (21fc <EXTI9_5_handler+0x15c>)
    21c6:	701a      	strb	r2, [r3, #0]
			parity++;
    21c8:	79fb      	ldrb	r3, [r7, #7]
    21ca:	b2db      	uxtb	r3, r3
    21cc:	3301      	adds	r3, #1
    21ce:	b2db      	uxtb	r3, r3
    21d0:	71fb      	strb	r3, [r7, #7]
		}
		bit_cnt++;
    21d2:	4b07      	ldr	r3, [pc, #28]	; (21f0 <EXTI9_5_handler+0x150>)
    21d4:	781b      	ldrb	r3, [r3, #0]
    21d6:	b2db      	uxtb	r3, r3
    21d8:	3301      	adds	r3, #1
    21da:	b2da      	uxtb	r2, r3
    21dc:	4b04      	ldr	r3, [pc, #16]	; (21f0 <EXTI9_5_handler+0x150>)
    21de:	701a      	strb	r2, [r3, #0]
		break;
    21e0:	bf00      	nop
	}
}
    21e2:	370c      	adds	r7, #12
    21e4:	46bd      	mov	sp, r7
    21e6:	f85d 7b04 	ldr.w	r7, [sp], #4
    21ea:	4770      	bx	lr
    21ec:	40010400 	.word	0x40010400
    21f0:	200000d0 	.word	0x200000d0
    21f4:	200000b4 	.word	0x200000b4
    21f8:	40010800 	.word	0x40010800
    21fc:	200000d1 	.word	0x200000d1
    2200:	200000bd 	.word	0x200000bd
    2204:	200000c0 	.word	0x200000c0

00002208 <TIM2_handler>:

void TIM2_handler(){
    2208:	b580      	push	{r7, lr}
    220a:	af00      	add	r7, sp, #0
	TMR2->SR&=~(BIT0); // clear interrupt bit
    220c:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    2210:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    2214:	691b      	ldr	r3, [r3, #16]
    2216:	f023 0301 	bic.w	r3, r3, #1
    221a:	6113      	str	r3, [r2, #16]
	if (ps2_tail!=ps2_head){
    221c:	4b0f      	ldr	r3, [pc, #60]	; (225c <TIM2_handler+0x54>)
    221e:	781b      	ldrb	r3, [r3, #0]
    2220:	b2da      	uxtb	r2, r3
    2222:	4b0f      	ldr	r3, [pc, #60]	; (2260 <TIM2_handler+0x58>)
    2224:	781b      	ldrb	r3, [r3, #0]
    2226:	b2db      	uxtb	r3, r3
    2228:	429a      	cmp	r2, r3
    222a:	d015      	beq.n	2258 <TIM2_handler+0x50>
		convert_code(ps2_queue[ps2_head++]);
    222c:	4b0c      	ldr	r3, [pc, #48]	; (2260 <TIM2_handler+0x58>)
    222e:	781b      	ldrb	r3, [r3, #0]
    2230:	b2db      	uxtb	r3, r3
    2232:	1c5a      	adds	r2, r3, #1
    2234:	b2d1      	uxtb	r1, r2
    2236:	4a0a      	ldr	r2, [pc, #40]	; (2260 <TIM2_handler+0x58>)
    2238:	7011      	strb	r1, [r2, #0]
    223a:	461a      	mov	r2, r3
    223c:	4b09      	ldr	r3, [pc, #36]	; (2264 <TIM2_handler+0x5c>)
    223e:	5c9b      	ldrb	r3, [r3, r2]
    2240:	b2db      	uxtb	r3, r3
    2242:	4618      	mov	r0, r3
    2244:	f7ff fdda 	bl	1dfc <convert_code>
		ps2_head&=PS2_QUEUE_SIZE-1;
    2248:	4b05      	ldr	r3, [pc, #20]	; (2260 <TIM2_handler+0x58>)
    224a:	781b      	ldrb	r3, [r3, #0]
    224c:	b2db      	uxtb	r3, r3
    224e:	f003 030f 	and.w	r3, r3, #15
    2252:	b2da      	uxtb	r2, r3
    2254:	4b02      	ldr	r3, [pc, #8]	; (2260 <TIM2_handler+0x58>)
    2256:	701a      	strb	r2, [r3, #0]
	}
}
    2258:	bd80      	pop	{r7, pc}
    225a:	bf00      	nop
    225c:	200000bd 	.word	0x200000bd
    2260:	200000bc 	.word	0x200000bc
    2264:	200000c0 	.word	0x200000c0

00002268 <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    2268:	b480      	push	{r7}
    226a:	b083      	sub	sp, #12
    226c:	af00      	add	r7, sp, #0
    226e:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    2270:	687b      	ldr	r3, [r7, #4]
    2272:	2b3b      	cmp	r3, #59	; 0x3b
    2274:	d900      	bls.n	2278 <enable_interrupt+0x10>
    2276:	e016      	b.n	22a6 <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    2278:	687b      	ldr	r3, [r7, #4]
    227a:	095b      	lsrs	r3, r3, #5
    227c:	009b      	lsls	r3, r3, #2
    227e:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2282:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    2286:	687a      	ldr	r2, [r7, #4]
    2288:	0952      	lsrs	r2, r2, #5
    228a:	0092      	lsls	r2, r2, #2
    228c:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    2290:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    2294:	6812      	ldr	r2, [r2, #0]
    2296:	6879      	ldr	r1, [r7, #4]
    2298:	f001 011f 	and.w	r1, r1, #31
    229c:	2001      	movs	r0, #1
    229e:	fa00 f101 	lsl.w	r1, r0, r1
    22a2:	430a      	orrs	r2, r1
    22a4:	601a      	str	r2, [r3, #0]
}
    22a6:	370c      	adds	r7, #12
    22a8:	46bd      	mov	sp, r7
    22aa:	f85d 7b04 	ldr.w	r7, [sp], #4
    22ae:	4770      	bx	lr

000022b0 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    22b0:	b480      	push	{r7}
    22b2:	b083      	sub	sp, #12
    22b4:	af00      	add	r7, sp, #0
    22b6:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    22b8:	687b      	ldr	r3, [r7, #4]
    22ba:	2b3b      	cmp	r3, #59	; 0x3b
    22bc:	d900      	bls.n	22c0 <disable_interrupt+0x10>
    22be:	e013      	b.n	22e8 <disable_interrupt+0x38>
	ICER[irq>>5]&=~(1<<(irq&0x1f));
    22c0:	687b      	ldr	r3, [r7, #4]
    22c2:	095b      	lsrs	r3, r3, #5
    22c4:	009a      	lsls	r2, r3, #2
    22c6:	4b0b      	ldr	r3, [pc, #44]	; (22f4 <disable_interrupt+0x44>)
    22c8:	4413      	add	r3, r2
    22ca:	687a      	ldr	r2, [r7, #4]
    22cc:	0952      	lsrs	r2, r2, #5
    22ce:	0091      	lsls	r1, r2, #2
    22d0:	4a08      	ldr	r2, [pc, #32]	; (22f4 <disable_interrupt+0x44>)
    22d2:	440a      	add	r2, r1
    22d4:	6812      	ldr	r2, [r2, #0]
    22d6:	6879      	ldr	r1, [r7, #4]
    22d8:	f001 011f 	and.w	r1, r1, #31
    22dc:	2001      	movs	r0, #1
    22de:	fa00 f101 	lsl.w	r1, r0, r1
    22e2:	43c9      	mvns	r1, r1
    22e4:	400a      	ands	r2, r1
    22e6:	601a      	str	r2, [r3, #0]
}
    22e8:	370c      	adds	r7, #12
    22ea:	46bd      	mov	sp, r7
    22ec:	f85d 7b04 	ldr.w	r7, [sp], #4
    22f0:	4770      	bx	lr
    22f2:	bf00      	nop
    22f4:	e000e180 	.word	0xe000e180

000022f8 <get_pending>:

unsigned get_pending(unsigned irq){
    22f8:	b480      	push	{r7}
    22fa:	b083      	sub	sp, #12
    22fc:	af00      	add	r7, sp, #0
    22fe:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    2300:	687b      	ldr	r3, [r7, #4]
    2302:	2b3b      	cmp	r3, #59	; 0x3b
    2304:	d901      	bls.n	230a <get_pending+0x12>
    2306:	2300      	movs	r3, #0
    2308:	e00c      	b.n	2324 <get_pending+0x2c>
	return ICPR[irq>>5]&(1<<(irq&0x1f));
    230a:	687b      	ldr	r3, [r7, #4]
    230c:	095b      	lsrs	r3, r3, #5
    230e:	009a      	lsls	r2, r3, #2
    2310:	4b07      	ldr	r3, [pc, #28]	; (2330 <get_pending+0x38>)
    2312:	4413      	add	r3, r2
    2314:	681b      	ldr	r3, [r3, #0]
    2316:	687a      	ldr	r2, [r7, #4]
    2318:	f002 021f 	and.w	r2, r2, #31
    231c:	2101      	movs	r1, #1
    231e:	fa01 f202 	lsl.w	r2, r1, r2
    2322:	4013      	ands	r3, r2
}
    2324:	4618      	mov	r0, r3
    2326:	370c      	adds	r7, #12
    2328:	46bd      	mov	sp, r7
    232a:	f85d 7b04 	ldr.w	r7, [sp], #4
    232e:	4770      	bx	lr
    2330:	e000e280 	.word	0xe000e280

00002334 <get_active>:

unsigned get_active(unsigned irq){
    2334:	b480      	push	{r7}
    2336:	b083      	sub	sp, #12
    2338:	af00      	add	r7, sp, #0
    233a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    233c:	687b      	ldr	r3, [r7, #4]
    233e:	2b3b      	cmp	r3, #59	; 0x3b
    2340:	d901      	bls.n	2346 <get_active+0x12>
    2342:	2300      	movs	r3, #0
    2344:	e00e      	b.n	2364 <get_active+0x30>
	return IABR[irq>>5]&(1<<(irq&0x1f));
    2346:	687b      	ldr	r3, [r7, #4]
    2348:	095b      	lsrs	r3, r3, #5
    234a:	009b      	lsls	r3, r3, #2
    234c:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2350:	f503 4363 	add.w	r3, r3, #58112	; 0xe300
    2354:	681b      	ldr	r3, [r3, #0]
    2356:	687a      	ldr	r2, [r7, #4]
    2358:	f002 021f 	and.w	r2, r2, #31
    235c:	2101      	movs	r1, #1
    235e:	fa01 f202 	lsl.w	r2, r1, r2
    2362:	4013      	ands	r3, r2
}
    2364:	4618      	mov	r0, r3
    2366:	370c      	adds	r7, #12
    2368:	46bd      	mov	sp, r7
    236a:	f85d 7b04 	ldr.w	r7, [sp], #4
    236e:	4770      	bx	lr

00002370 <set_pending>:

void set_pending(unsigned irq){
    2370:	b480      	push	{r7}
    2372:	b083      	sub	sp, #12
    2374:	af00      	add	r7, sp, #0
    2376:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    2378:	687b      	ldr	r3, [r7, #4]
    237a:	2b3b      	cmp	r3, #59	; 0x3b
    237c:	d900      	bls.n	2380 <set_pending+0x10>
    237e:	e016      	b.n	23ae <set_pending+0x3e>
	ISPR[irq>>5]|=1<<(irq&0x1f);
    2380:	687b      	ldr	r3, [r7, #4]
    2382:	095b      	lsrs	r3, r3, #5
    2384:	009b      	lsls	r3, r3, #2
    2386:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    238a:	f503 4362 	add.w	r3, r3, #57856	; 0xe200
    238e:	687a      	ldr	r2, [r7, #4]
    2390:	0952      	lsrs	r2, r2, #5
    2392:	0092      	lsls	r2, r2, #2
    2394:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    2398:	f502 4262 	add.w	r2, r2, #57856	; 0xe200
    239c:	6812      	ldr	r2, [r2, #0]
    239e:	6879      	ldr	r1, [r7, #4]
    23a0:	f001 011f 	and.w	r1, r1, #31
    23a4:	2001      	movs	r0, #1
    23a6:	fa00 f101 	lsl.w	r1, r0, r1
    23aa:	430a      	orrs	r2, r1
    23ac:	601a      	str	r2, [r3, #0]
}
    23ae:	370c      	adds	r7, #12
    23b0:	46bd      	mov	sp, r7
    23b2:	f85d 7b04 	ldr.w	r7, [sp], #4
    23b6:	4770      	bx	lr

000023b8 <clear_pending>:

void clear_pending(unsigned irq){
    23b8:	b480      	push	{r7}
    23ba:	b083      	sub	sp, #12
    23bc:	af00      	add	r7, sp, #0
    23be:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    23c0:	687b      	ldr	r3, [r7, #4]
    23c2:	2b3b      	cmp	r3, #59	; 0x3b
    23c4:	d900      	bls.n	23c8 <clear_pending+0x10>
    23c6:	e013      	b.n	23f0 <clear_pending+0x38>
	ICPR[irq>>5]&=~(1<<(irq&0x1f));
    23c8:	687b      	ldr	r3, [r7, #4]
    23ca:	095b      	lsrs	r3, r3, #5
    23cc:	009a      	lsls	r2, r3, #2
    23ce:	4b0b      	ldr	r3, [pc, #44]	; (23fc <clear_pending+0x44>)
    23d0:	4413      	add	r3, r2
    23d2:	687a      	ldr	r2, [r7, #4]
    23d4:	0952      	lsrs	r2, r2, #5
    23d6:	0091      	lsls	r1, r2, #2
    23d8:	4a08      	ldr	r2, [pc, #32]	; (23fc <clear_pending+0x44>)
    23da:	440a      	add	r2, r1
    23dc:	6812      	ldr	r2, [r2, #0]
    23de:	6879      	ldr	r1, [r7, #4]
    23e0:	f001 011f 	and.w	r1, r1, #31
    23e4:	2001      	movs	r0, #1
    23e6:	fa00 f101 	lsl.w	r1, r0, r1
    23ea:	43c9      	mvns	r1, r1
    23ec:	400a      	ands	r2, r1
    23ee:	601a      	str	r2, [r3, #0]
}
    23f0:	370c      	adds	r7, #12
    23f2:	46bd      	mov	sp, r7
    23f4:	f85d 7b04 	ldr.w	r7, [sp], #4
    23f8:	4770      	bx	lr
    23fa:	bf00      	nop
    23fc:	e000e280 	.word	0xe000e280

00002400 <set_int_priority>:


void set_int_priority(int32_t irq, unsigned priority){
    2400:	b480      	push	{r7}
    2402:	b083      	sub	sp, #12
    2404:	af00      	add	r7, sp, #0
    2406:	6078      	str	r0, [r7, #4]
    2408:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    240a:	687b      	ldr	r3, [r7, #4]
    240c:	2b00      	cmp	r3, #0
    240e:	db0d      	blt.n	242c <set_int_priority+0x2c>
    2410:	687b      	ldr	r3, [r7, #4]
    2412:	2b3b      	cmp	r3, #59	; 0x3b
    2414:	dc0a      	bgt.n	242c <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    2416:	687b      	ldr	r3, [r7, #4]
    2418:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    241c:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    2420:	683a      	ldr	r2, [r7, #0]
    2422:	b2d2      	uxtb	r2, r2
    2424:	0112      	lsls	r2, r2, #4
    2426:	b2d2      	uxtb	r2, r2
    2428:	701a      	strb	r2, [r3, #0]
    242a:	e012      	b.n	2452 <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    242c:	687b      	ldr	r3, [r7, #4]
    242e:	2b00      	cmp	r3, #0
    2430:	da0f      	bge.n	2452 <set_int_priority+0x52>
    2432:	687b      	ldr	r3, [r7, #4]
    2434:	f113 0f0f 	cmn.w	r3, #15
    2438:	db0b      	blt.n	2452 <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    243a:	687a      	ldr	r2, [r7, #4]
    243c:	f06f 0303 	mvn.w	r3, #3
    2440:	1a9b      	subs	r3, r3, r2
    2442:	461a      	mov	r2, r3
    2444:	4b05      	ldr	r3, [pc, #20]	; (245c <set_int_priority+0x5c>)
    2446:	4413      	add	r3, r2
    2448:	683a      	ldr	r2, [r7, #0]
    244a:	b2d2      	uxtb	r2, r2
    244c:	0112      	lsls	r2, r2, #4
    244e:	b2d2      	uxtb	r2, r2
    2450:	701a      	strb	r2, [r3, #0]
	}
}
    2452:	370c      	adds	r7, #12
    2454:	46bd      	mov	sp, r7
    2456:	f85d 7b04 	ldr.w	r7, [sp], #4
    245a:	4770      	bx	lr
    245c:	e000ed18 	.word	0xe000ed18

00002460 <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    2460:	b480      	push	{r7}
    2462:	b083      	sub	sp, #12
    2464:	af00      	add	r7, sp, #0
    2466:	6078      	str	r0, [r7, #4]
    2468:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    246a:	687b      	ldr	r3, [r7, #4]
    246c:	881b      	ldrh	r3, [r3, #0]
    246e:	b29b      	uxth	r3, r3
    2470:	f423 63e0 	bic.w	r3, r3, #1792	; 0x700
    2474:	b29a      	uxth	r2, r3
    2476:	687b      	ldr	r3, [r7, #4]
    2478:	801a      	strh	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    247a:	687b      	ldr	r3, [r7, #4]
    247c:	881b      	ldrh	r3, [r3, #0]
    247e:	b29a      	uxth	r2, r3
    2480:	683b      	ldr	r3, [r7, #0]
    2482:	b29b      	uxth	r3, r3
    2484:	00db      	lsls	r3, r3, #3
    2486:	b29b      	uxth	r3, r3
    2488:	4313      	orrs	r3, r2
    248a:	b29a      	uxth	r2, r3
    248c:	687b      	ldr	r3, [r7, #4]
    248e:	801a      	strh	r2, [r3, #0]
}
    2490:	370c      	adds	r7, #12
    2492:	46bd      	mov	sp, r7
    2494:	f85d 7b04 	ldr.w	r7, [sp], #4
    2498:	4770      	bx	lr
    249a:	bf00      	nop

0000249c <spi_init>:


void spi_init(spi_sfr_t* channel, unsigned baud){
    249c:	b580      	push	{r7, lr}
    249e:	b082      	sub	sp, #8
    24a0:	af00      	add	r7, sp, #0
    24a2:	6078      	str	r0, [r7, #4]
    24a4:	6039      	str	r1, [r7, #0]
	spi_baudrate(channel,baud);
    24a6:	6878      	ldr	r0, [r7, #4]
    24a8:	6839      	ldr	r1, [r7, #0]
    24aa:	f7ff ffd9 	bl	2460 <spi_baudrate>
	channel->CR1=SPI_CR1_MSTR|SPI_CR1_SSM;
    24ae:	687b      	ldr	r3, [r7, #4]
    24b0:	f44f 7201 	mov.w	r2, #516	; 0x204
    24b4:	801a      	strh	r2, [r3, #0]
	//channel->CR2|=SPI_CR2_SSOE;
	if (channel==SPI1){
    24b6:	687b      	ldr	r3, [r7, #4]
    24b8:	4a17      	ldr	r2, [pc, #92]	; (2518 <spi_init+0x7c>)
    24ba:	4293      	cmp	r3, r2
    24bc:	d114      	bne.n	24e8 <spi_init+0x4c>
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(PORTA,4,OUTPUT_PP_FAST);
    24be:	4817      	ldr	r0, [pc, #92]	; (251c <spi_init+0x80>)
    24c0:	2104      	movs	r1, #4
    24c2:	2203      	movs	r2, #3
    24c4:	f7ff fbbe 	bl	1c44 <config_pin>
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(PORTA,5,OUTPUT_PP_FAST);
    24c8:	4814      	ldr	r0, [pc, #80]	; (251c <spi_init+0x80>)
    24ca:	2105      	movs	r1, #5
    24cc:	2203      	movs	r2, #3
    24ce:	f7ff fbb9 	bl	1c44 <config_pin>
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(PORTA,6,INPUT_FLOAT);
    24d2:	4812      	ldr	r0, [pc, #72]	; (251c <spi_init+0x80>)
    24d4:	2106      	movs	r1, #6
    24d6:	2204      	movs	r2, #4
    24d8:	f7ff fbb4 	bl	1c44 <config_pin>
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(PORTA,7,OUTPUT_PP_FAST);
    24dc:	480f      	ldr	r0, [pc, #60]	; (251c <spi_init+0x80>)
    24de:	2107      	movs	r1, #7
    24e0:	2203      	movs	r2, #3
    24e2:	f7ff fbaf 	bl	1c44 <config_pin>
    24e6:	e013      	b.n	2510 <spi_init+0x74>
	}else{
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(PORTB,2,OUTPUT_PP_FAST);
    24e8:	480d      	ldr	r0, [pc, #52]	; (2520 <spi_init+0x84>)
    24ea:	2102      	movs	r1, #2
    24ec:	2203      	movs	r2, #3
    24ee:	f7ff fba9 	bl	1c44 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(PORTB,13,OUTPUT_PP_FAST);
    24f2:	480b      	ldr	r0, [pc, #44]	; (2520 <spi_init+0x84>)
    24f4:	210d      	movs	r1, #13
    24f6:	2203      	movs	r2, #3
    24f8:	f7ff fba4 	bl	1c44 <config_pin>
		// PB14 MISO input (floating)
		config_pin(PORTB,14,INPUT_FLOAT);
    24fc:	4808      	ldr	r0, [pc, #32]	; (2520 <spi_init+0x84>)
    24fe:	210e      	movs	r1, #14
    2500:	2204      	movs	r2, #4
    2502:	f7ff fb9f 	bl	1c44 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(PORTB,15,OUTPUT_PP_FAST);
    2506:	4806      	ldr	r0, [pc, #24]	; (2520 <spi_init+0x84>)
    2508:	210f      	movs	r1, #15
    250a:	2203      	movs	r2, #3
    250c:	f7ff fb9a 	bl	1c44 <config_pin>
	}
}
    2510:	3708      	adds	r7, #8
    2512:	46bd      	mov	sp, r7
    2514:	bd80      	pop	{r7, pc}
    2516:	bf00      	nop
    2518:	40013000 	.word	0x40013000
    251c:	40010800 	.word	0x40010800
    2520:	40010c00 	.word	0x40010c00

00002524 <spi_enable>:

void spi_enable(spi_sfr_t* channel, unsigned mode){
    2524:	b480      	push	{r7}
    2526:	b083      	sub	sp, #12
    2528:	af00      	add	r7, sp, #0
    252a:	6078      	str	r0, [r7, #4]
    252c:	6039      	str	r1, [r7, #0]
	switch (mode){
    252e:	683b      	ldr	r3, [r7, #0]
    2530:	2b01      	cmp	r3, #1
    2532:	d00d      	beq.n	2550 <spi_enable+0x2c>
    2534:	2b01      	cmp	r3, #1
    2536:	d302      	bcc.n	253e <spi_enable+0x1a>
    2538:	2b02      	cmp	r3, #2
    253a:	d005      	beq.n	2548 <spi_enable+0x24>
    253c:	e00d      	b.n	255a <spi_enable+0x36>
		case SPI_MODE_READ:
		channel->CR1=SPI_CR1_RXONLY|SPI_CR1_SPE;
    253e:	687b      	ldr	r3, [r7, #4]
    2540:	f44f 6288 	mov.w	r2, #1088	; 0x440
    2544:	801a      	strh	r2, [r3, #0]
		break;
    2546:	e008      	b.n	255a <spi_enable+0x36>
		case SPI_MODE_READ_WRITE:
		channel->CR1=SPI_CR1_SPE;
    2548:	687b      	ldr	r3, [r7, #4]
    254a:	2240      	movs	r2, #64	; 0x40
    254c:	801a      	strh	r2, [r3, #0]
		break;
    254e:	e004      	b.n	255a <spi_enable+0x36>
		case SPI_MODE_WRITE:
		channel->CR1=SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE|SPI_CR1_SPE;
    2550:	687b      	ldr	r3, [r7, #4]
    2552:	f24c 0240 	movw	r2, #49216	; 0xc040
    2556:	801a      	strh	r2, [r3, #0]
		break;
    2558:	bf00      	nop
	}
}
    255a:	370c      	adds	r7, #12
    255c:	46bd      	mov	sp, r7
    255e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2562:	4770      	bx	lr

00002564 <spi_disable>:

void spi_disable(spi_sfr_t* channel){
    2564:	b480      	push	{r7}
    2566:	b083      	sub	sp, #12
    2568:	af00      	add	r7, sp, #0
    256a:	6078      	str	r0, [r7, #4]
	channel->CR1&=~SPI_CR1_SPE;
    256c:	687b      	ldr	r3, [r7, #4]
    256e:	881b      	ldrh	r3, [r3, #0]
    2570:	b29b      	uxth	r3, r3
    2572:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    2576:	b29a      	uxth	r2, r3
    2578:	687b      	ldr	r3, [r7, #4]
    257a:	801a      	strh	r2, [r3, #0]
}
    257c:	370c      	adds	r7, #12
    257e:	46bd      	mov	sp, r7
    2580:	f85d 7b04 	ldr.w	r7, [sp], #4
    2584:	4770      	bx	lr
    2586:	bf00      	nop

00002588 <spi_write>:

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
    2588:	b580      	push	{r7, lr}
    258a:	b082      	sub	sp, #8
    258c:	af00      	add	r7, sp, #0
    258e:	6078      	str	r0, [r7, #4]
    2590:	460b      	mov	r3, r1
    2592:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
    2594:	6878      	ldr	r0, [r7, #4]
    2596:	2101      	movs	r1, #1
    2598:	f7ff ffc4 	bl	2524 <spi_enable>
	channel->DR=b;
    259c:	78fb      	ldrb	r3, [r7, #3]
    259e:	b29a      	uxth	r2, r3
    25a0:	687b      	ldr	r3, [r7, #4]
    25a2:	819a      	strh	r2, [r3, #12]
	spi_disable(channel);
    25a4:	6878      	ldr	r0, [r7, #4]
    25a6:	f7ff ffdd 	bl	2564 <spi_disable>
}
    25aa:	3708      	adds	r7, #8
    25ac:	46bd      	mov	sp, r7
    25ae:	bd80      	pop	{r7, pc}

000025b0 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    25b0:	b580      	push	{r7, lr}
    25b2:	b084      	sub	sp, #16
    25b4:	af00      	add	r7, sp, #0
    25b6:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
    25b8:	6878      	ldr	r0, [r7, #4]
    25ba:	2100      	movs	r1, #0
    25bc:	f7ff ffb2 	bl	2524 <spi_enable>
	channel->DR=255;
    25c0:	687b      	ldr	r3, [r7, #4]
    25c2:	22ff      	movs	r2, #255	; 0xff
    25c4:	819a      	strh	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    25c6:	bf00      	nop
    25c8:	687b      	ldr	r3, [r7, #4]
    25ca:	891b      	ldrh	r3, [r3, #8]
    25cc:	b29b      	uxth	r3, r3
    25ce:	f003 0301 	and.w	r3, r3, #1
    25d2:	2b00      	cmp	r3, #0
    25d4:	d0f8      	beq.n	25c8 <spi_read+0x18>
	rx=(uint8_t)channel->DR;
    25d6:	687b      	ldr	r3, [r7, #4]
    25d8:	899b      	ldrh	r3, [r3, #12]
    25da:	b29b      	uxth	r3, r3
    25dc:	73fb      	strb	r3, [r7, #15]
	spi_disable(channel);
    25de:	6878      	ldr	r0, [r7, #4]
    25e0:	f7ff ffc0 	bl	2564 <spi_disable>
	return rx;
    25e4:	7bfb      	ldrb	r3, [r7, #15]
}
    25e6:	4618      	mov	r0, r3
    25e8:	3710      	adds	r7, #16
    25ea:	46bd      	mov	sp, r7
    25ec:	bd80      	pop	{r7, pc}
    25ee:	bf00      	nop

000025f0 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    25f0:	b580      	push	{r7, lr}
    25f2:	b084      	sub	sp, #16
    25f4:	af00      	add	r7, sp, #0
    25f6:	60f8      	str	r0, [r7, #12]
    25f8:	60b9      	str	r1, [r7, #8]
    25fa:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_WRITE);
    25fc:	68f8      	ldr	r0, [r7, #12]
    25fe:	2101      	movs	r1, #1
    2600:	f7ff ff90 	bl	2524 <spi_enable>
	while (count){
    2604:	e011      	b.n	262a <spi_block_write+0x3a>
		channel->DR=*buffer++;
    2606:	68bb      	ldr	r3, [r7, #8]
    2608:	1c5a      	adds	r2, r3, #1
    260a:	60ba      	str	r2, [r7, #8]
    260c:	781b      	ldrb	r3, [r3, #0]
    260e:	b29a      	uxth	r2, r3
    2610:	68fb      	ldr	r3, [r7, #12]
    2612:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    2614:	bf00      	nop
    2616:	68fb      	ldr	r3, [r7, #12]
    2618:	891b      	ldrh	r3, [r3, #8]
    261a:	b29b      	uxth	r3, r3
    261c:	f003 0302 	and.w	r3, r3, #2
    2620:	2b00      	cmp	r3, #0
    2622:	d0f8      	beq.n	2616 <spi_block_write+0x26>
		count--;
    2624:	687b      	ldr	r3, [r7, #4]
    2626:	3b01      	subs	r3, #1
    2628:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_enable(channel,SPI_MODE_WRITE);
	while (count){
    262a:	687b      	ldr	r3, [r7, #4]
    262c:	2b00      	cmp	r3, #0
    262e:	d1ea      	bne.n	2606 <spi_block_write+0x16>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	spi_disable(channel);
    2630:	68f8      	ldr	r0, [r7, #12]
    2632:	f7ff ff97 	bl	2564 <spi_disable>
}
    2636:	3710      	adds	r7, #16
    2638:	46bd      	mov	sp, r7
    263a:	bd80      	pop	{r7, pc}

0000263c <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    263c:	b580      	push	{r7, lr}
    263e:	b084      	sub	sp, #16
    2640:	af00      	add	r7, sp, #0
    2642:	60f8      	str	r0, [r7, #12]
    2644:	60b9      	str	r1, [r7, #8]
    2646:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_READ);
    2648:	68f8      	ldr	r0, [r7, #12]
    264a:	2100      	movs	r1, #0
    264c:	f7ff ff6a 	bl	2524 <spi_enable>
	while (count){
    2650:	e015      	b.n	267e <spi_block_read+0x42>
		channel->DR=0;
    2652:	68fb      	ldr	r3, [r7, #12]
    2654:	2200      	movs	r2, #0
    2656:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    2658:	bf00      	nop
    265a:	68fb      	ldr	r3, [r7, #12]
    265c:	891b      	ldrh	r3, [r3, #8]
    265e:	b29b      	uxth	r3, r3
    2660:	f003 0301 	and.w	r3, r3, #1
    2664:	2b00      	cmp	r3, #0
    2666:	d0f8      	beq.n	265a <spi_block_read+0x1e>
		*buffer++=(uint8_t)channel->DR;
    2668:	68bb      	ldr	r3, [r7, #8]
    266a:	1c5a      	adds	r2, r3, #1
    266c:	60ba      	str	r2, [r7, #8]
    266e:	68fa      	ldr	r2, [r7, #12]
    2670:	8992      	ldrh	r2, [r2, #12]
    2672:	b292      	uxth	r2, r2
    2674:	b2d2      	uxtb	r2, r2
    2676:	701a      	strb	r2, [r3, #0]
		count--;
    2678:	687b      	ldr	r3, [r7, #4]
    267a:	3b01      	subs	r3, #1
    267c:	607b      	str	r3, [r7, #4]
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_enable(channel,SPI_MODE_READ);
	while (count){
    267e:	687b      	ldr	r3, [r7, #4]
    2680:	2b00      	cmp	r3, #0
    2682:	d1e6      	bne.n	2652 <spi_block_read+0x16>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
	spi_disable(channel);
    2684:	68f8      	ldr	r0, [r7, #12]
    2686:	f7ff ff6d 	bl	2564 <spi_disable>
}
    268a:	3710      	adds	r7, #16
    268c:	46bd      	mov	sp, r7
    268e:	bd80      	pop	{r7, pc}

00002690 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    2690:	4b01      	ldr	r3, [pc, #4]	; (2698 <reset_mcu+0x8>)
    2692:	4a02      	ldr	r2, [pc, #8]	; (269c <reset_mcu+0xc>)
    2694:	601a      	str	r2, [r3, #0]
    2696:	bf00      	nop
    2698:	e000ed0c 	.word	0xe000ed0c
    269c:	05fa0004 	.word	0x05fa0004

000026a0 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    26a0:	b580      	push	{r7, lr}
    26a2:	b082      	sub	sp, #8
    26a4:	af00      	add	r7, sp, #0
    26a6:	6078      	str	r0, [r7, #4]
    26a8:	6039      	str	r1, [r7, #0]
	print(msg);
    26aa:	6878      	ldr	r0, [r7, #4]
    26ac:	f7fe fdde 	bl	126c <print>
	print("at address ");
    26b0:	4814      	ldr	r0, [pc, #80]	; (2704 <print_fault+0x64>)
    26b2:	f7fe fddb 	bl	126c <print>
	if (adr) {
    26b6:	683b      	ldr	r3, [r7, #0]
    26b8:	2b00      	cmp	r3, #0
    26ba:	d002      	beq.n	26c2 <print_fault+0x22>
		print_hex(adr);
    26bc:	6838      	ldr	r0, [r7, #0]
    26be:	f7fe ff1d 	bl	14fc <print_hex>
	};
	conout(CR);
    26c2:	200d      	movs	r0, #13
    26c4:	f7fe fdb8 	bl	1238 <conout>
	print("UFSR=");
    26c8:	480f      	ldr	r0, [pc, #60]	; (2708 <print_fault+0x68>)
    26ca:	f7fe fdcf 	bl	126c <print>
	print_hex(CFSR->fsr.usageFalt);
    26ce:	4b0f      	ldr	r3, [pc, #60]	; (270c <print_fault+0x6c>)
    26d0:	681b      	ldr	r3, [r3, #0]
    26d2:	0c1b      	lsrs	r3, r3, #16
    26d4:	b29b      	uxth	r3, r3
    26d6:	4618      	mov	r0, r3
    26d8:	f7fe ff10 	bl	14fc <print_hex>
	print(", BFSR=");
    26dc:	480c      	ldr	r0, [pc, #48]	; (2710 <print_fault+0x70>)
    26de:	f7fe fdc5 	bl	126c <print>
	print_hex(CFSR->fsr.busFault);
    26e2:	4b0a      	ldr	r3, [pc, #40]	; (270c <print_fault+0x6c>)
    26e4:	681b      	ldr	r3, [r3, #0]
    26e6:	0a1b      	lsrs	r3, r3, #8
    26e8:	b2db      	uxtb	r3, r3
    26ea:	4618      	mov	r0, r3
    26ec:	f7fe ff06 	bl	14fc <print_hex>
	print(", MMFSR=");
    26f0:	4808      	ldr	r0, [pc, #32]	; (2714 <print_fault+0x74>)
    26f2:	f7fe fdbb 	bl	126c <print>
	print_hex(CFSR->fsr.mmFault);
    26f6:	4b05      	ldr	r3, [pc, #20]	; (270c <print_fault+0x6c>)
    26f8:	681b      	ldr	r3, [r3, #0]
    26fa:	b2db      	uxtb	r3, r3
    26fc:	4618      	mov	r0, r3
    26fe:	f7fe fefd 	bl	14fc <print_hex>
	while(1);
    2702:	e7fe      	b.n	2702 <print_fault+0x62>
    2704:	00003370 	.word	0x00003370
    2708:	0000337c 	.word	0x0000337c
    270c:	e000ed28 	.word	0xe000ed28
    2710:	00003384 	.word	0x00003384
    2714:	0000338c 	.word	0x0000338c

00002718 <config_systicks>:


// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
#define MSEC_DLY FCLK/8/1000
void config_systicks(){
    2718:	b580      	push	{r7, lr}
    271a:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,9);
    271c:	f06f 000e 	mvn.w	r0, #14
    2720:	2109      	movs	r1, #9
    2722:	f7ff fe6d 	bl	2400 <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
    2726:	4b04      	ldr	r3, [pc, #16]	; (2738 <config_systicks+0x20>)
    2728:	f641 32f6 	movw	r2, #7158	; 0x1bf6
    272c:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
    272e:	4b03      	ldr	r3, [pc, #12]	; (273c <config_systicks+0x24>)
    2730:	2203      	movs	r2, #3
    2732:	601a      	str	r2, [r3, #0]
}
    2734:	bd80      	pop	{r7, pc}
    2736:	bf00      	nop
    2738:	e000e014 	.word	0xe000e014
    273c:	e000e010 	.word	0xe000e010

00002740 <pause>:



void pause(unsigned msec){
    2740:	b480      	push	{r7}
    2742:	b083      	sub	sp, #12
    2744:	af00      	add	r7, sp, #0
    2746:	6078      	str	r0, [r7, #4]
	timer=msec;
    2748:	4a06      	ldr	r2, [pc, #24]	; (2764 <pause+0x24>)
    274a:	687b      	ldr	r3, [r7, #4]
    274c:	6013      	str	r3, [r2, #0]
	while (timer);
    274e:	bf00      	nop
    2750:	4b04      	ldr	r3, [pc, #16]	; (2764 <pause+0x24>)
    2752:	681b      	ldr	r3, [r3, #0]
    2754:	2b00      	cmp	r3, #0
    2756:	d1fb      	bne.n	2750 <pause+0x10>
}
    2758:	370c      	adds	r7, #12
    275a:	46bd      	mov	sp, r7
    275c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2760:	4770      	bx	lr
    2762:	bf00      	nop
    2764:	200000d8 	.word	0x200000d8

00002768 <STK_handler>:


// interruption coretimer
void STK_handler(){
    2768:	b480      	push	{r7}
    276a:	af00      	add	r7, sp, #0
	ticks++;
    276c:	4b08      	ldr	r3, [pc, #32]	; (2790 <STK_handler+0x28>)
    276e:	681b      	ldr	r3, [r3, #0]
    2770:	3301      	adds	r3, #1
    2772:	4a07      	ldr	r2, [pc, #28]	; (2790 <STK_handler+0x28>)
    2774:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
    2776:	4b07      	ldr	r3, [pc, #28]	; (2794 <STK_handler+0x2c>)
    2778:	681b      	ldr	r3, [r3, #0]
    277a:	2b00      	cmp	r3, #0
    277c:	d004      	beq.n	2788 <STK_handler+0x20>
    277e:	4b05      	ldr	r3, [pc, #20]	; (2794 <STK_handler+0x2c>)
    2780:	681b      	ldr	r3, [r3, #0]
    2782:	3b01      	subs	r3, #1
    2784:	4a03      	ldr	r2, [pc, #12]	; (2794 <STK_handler+0x2c>)
    2786:	6013      	str	r3, [r2, #0]
}
    2788:	46bd      	mov	sp, r7
    278a:	f85d 7b04 	ldr.w	r7, [sp], #4
    278e:	4770      	bx	lr
    2790:	200000d4 	.word	0x200000d4
    2794:	200000d8 	.word	0x200000d8

00002798 <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    2798:	b480      	push	{r7}
    279a:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    279c:	2300      	movs	r3, #0
    279e:	2200      	movs	r2, #0
    27a0:	4618      	mov	r0, r3
    27a2:	4611      	mov	r1, r2
    27a4:	df02      	svc	2
}
    27a6:	46bd      	mov	sp, r7
    27a8:	f85d 7b04 	ldr.w	r7, [sp], #4
    27ac:	4770      	bx	lr
    27ae:	bf00      	nop

000027b0 <tvout_init>:

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
    27b0:	b580      	push	{r7, lr}
    27b2:	af00      	add	r7, sp, #0
	//sortie sync sur PA8
	config_pin(PORTA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    27b4:	4833      	ldr	r0, [pc, #204]	; (2884 <tvout_init+0xd4>)
    27b6:	2108      	movs	r1, #8
    27b8:	220a      	movs	r2, #10
    27ba:	f7ff fa43 	bl	1c44 <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    27be:	4832      	ldr	r0, [pc, #200]	; (2888 <tvout_init+0xd8>)
    27c0:	210f      	movs	r1, #15
    27c2:	220b      	movs	r2, #11
    27c4:	f7ff fa3e 	bl	1c44 <config_pin>
	PORTB->BRR=BIT15;
    27c8:	4b2f      	ldr	r3, [pc, #188]	; (2888 <tvout_init+0xd8>)
    27ca:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    27ce:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
    27d0:	4a2e      	ldr	r2, [pc, #184]	; (288c <tvout_init+0xdc>)
    27d2:	4b2e      	ldr	r3, [pc, #184]	; (288c <tvout_init+0xdc>)
    27d4:	699b      	ldr	r3, [r3, #24]
    27d6:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    27da:	6193      	str	r3, [r2, #24]
	// clock source division
	*TIMER1_PSC=0;
    27dc:	4b2c      	ldr	r3, [pc, #176]	; (2890 <tvout_init+0xe0>)
    27de:	2200      	movs	r2, #0
    27e0:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    27e2:	4b2c      	ldr	r3, [pc, #176]	; (2894 <tvout_init+0xe4>)
    27e4:	f44f 6265 	mov.w	r2, #3664	; 0xe50
    27e8:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    27ea:	4b2b      	ldr	r3, [pc, #172]	; (2898 <tvout_init+0xe8>)
    27ec:	f44f 7286 	mov.w	r2, #268	; 0x10c
    27f0:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    27f2:	4b2a      	ldr	r3, [pc, #168]	; (289c <tvout_init+0xec>)
    27f4:	681a      	ldr	r2, [r3, #0]
    27f6:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    27fa:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    27fe:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    2800:	4b26      	ldr	r3, [pc, #152]	; (289c <tvout_init+0xec>)
    2802:	681a      	ldr	r2, [r3, #0]
    2804:	f042 0208 	orr.w	r2, r2, #8
    2808:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    280a:	4b25      	ldr	r3, [pc, #148]	; (28a0 <tvout_init+0xf0>)
    280c:	681a      	ldr	r2, [r3, #0]
    280e:	f042 0201 	orr.w	r2, r2, #1
    2812:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    2814:	4b22      	ldr	r3, [pc, #136]	; (28a0 <tvout_init+0xf0>)
    2816:	681a      	ldr	r2, [r3, #0]
    2818:	f042 0202 	orr.w	r2, r2, #2
    281c:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    281e:	4a21      	ldr	r2, [pc, #132]	; (28a4 <tvout_init+0xf4>)
    2820:	8813      	ldrh	r3, [r2, #0]
    2822:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    2826:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    282a:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    282c:	4b1e      	ldr	r3, [pc, #120]	; (28a8 <tvout_init+0xf8>)
    282e:	681a      	ldr	r2, [r3, #0]
    2830:	f042 0201 	orr.w	r2, r2, #1
    2834:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=SPI_PIXELS; //(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    2836:	4b1d      	ldr	r3, [pc, #116]	; (28ac <tvout_init+0xfc>)
    2838:	f640 324c 	movw	r2, #2892	; 0xb4c
    283c:	801a      	strh	r2, [r3, #0]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    283e:	4b1c      	ldr	r3, [pc, #112]	; (28b0 <tvout_init+0x100>)
    2840:	f243 5292 	movw	r2, #13714	; 0x3592
    2844:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    2846:	4b1a      	ldr	r3, [pc, #104]	; (28b0 <tvout_init+0x100>)
    2848:	4a1a      	ldr	r2, [pc, #104]	; (28b4 <tvout_init+0x104>)
    284a:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    284c:	4a17      	ldr	r2, [pc, #92]	; (28ac <tvout_init+0xfc>)
    284e:	4b17      	ldr	r3, [pc, #92]	; (28ac <tvout_init+0xfc>)
    2850:	889b      	ldrh	r3, [r3, #4]
    2852:	b29b      	uxth	r3, r3
    2854:	f043 0302 	orr.w	r3, r3, #2
    2858:	b29b      	uxth	r3, r3
    285a:	8093      	strh	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,7);
    285c:	200f      	movs	r0, #15
    285e:	2107      	movs	r1, #7
    2860:	f7ff fdce 	bl	2400 <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    2864:	200f      	movs	r0, #15
    2866:	f7ff fcff 	bl	2268 <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    286a:	4b13      	ldr	r3, [pc, #76]	; (28b8 <tvout_init+0x108>)
    286c:	681a      	ldr	r2, [r3, #0]
    286e:	f042 0202 	orr.w	r2, r2, #2
    2872:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,7);
    2874:	201b      	movs	r0, #27
    2876:	2107      	movs	r1, #7
    2878:	f7ff fdc2 	bl	2400 <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    287c:	201b      	movs	r0, #27
    287e:	f7ff fcf3 	bl	2268 <enable_interrupt>
	for(i=1;i<(VRES-2);i++){
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	 test end */
 }
    2882:	bd80      	pop	{r7, pc}
    2884:	40010800 	.word	0x40010800
    2888:	40010c00 	.word	0x40010c00
    288c:	40021000 	.word	0x40021000
    2890:	40012c28 	.word	0x40012c28
    2894:	40012c2c 	.word	0x40012c2c
    2898:	40012c34 	.word	0x40012c34
    289c:	40012c18 	.word	0x40012c18
    28a0:	40012c20 	.word	0x40012c20
    28a4:	40012c44 	.word	0x40012c44
    28a8:	40012c00 	.word	0x40012c00
    28ac:	40003800 	.word	0x40003800
    28b0:	40020058 	.word	0x40020058
    28b4:	4000380c 	.word	0x4000380c
    28b8:	40012c0c 	.word	0x40012c0c

000028bc <TIM1_CC_handler>:
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    28bc:	484a      	ldr	r0, [pc, #296]	; (29e8 <TIM1_CC_handler+0x12c>)
	line_count++;
    28be:	4b4b      	ldr	r3, [pc, #300]	; (29ec <TIM1_CC_handler+0x130>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    28c0:	6802      	ldr	r2, [r0, #0]
	line_count++;
	TIMER1_SR->fld.cc1if=0;
    28c2:	494b      	ldr	r1, [pc, #300]	; (29f0 <TIM1_CC_handler+0x134>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    28c4:	f022 0201 	bic.w	r2, r2, #1
    28c8:	6002      	str	r2, [r0, #0]
	line_count++;
    28ca:	681a      	ldr	r2, [r3, #0]
    28cc:	3201      	adds	r2, #1
    28ce:	601a      	str	r2, [r3, #0]
	TIMER1_SR->fld.cc1if=0;
    28d0:	680a      	ldr	r2, [r1, #0]
    28d2:	f022 0202 	bic.w	r2, r2, #2
    28d6:	600a      	str	r2, [r1, #0]
	switch(line_count){
    28d8:	681a      	ldr	r2, [r3, #0]
    28da:	2a12      	cmp	r2, #18
    28dc:	d07f      	beq.n	29de <TIM1_CC_handler+0x122>
    28de:	dd1c      	ble.n	291a <TIM1_CC_handler+0x5e>
    28e0:	f5b2 7f96 	cmp.w	r2, #300	; 0x12c
    28e4:	d072      	beq.n	29cc <TIM1_CC_handler+0x110>
    28e6:	dd3f      	ble.n	2968 <TIM1_CC_handler+0xac>
    28e8:	f240 1141 	movw	r1, #321	; 0x141
    28ec:	428a      	cmp	r2, r1
    28ee:	d028      	beq.n	2942 <TIM1_CC_handler+0x86>
    28f0:	f5b2 7fa1 	cmp.w	r2, #322	; 0x142
    28f4:	d14a      	bne.n	298c <TIM1_CC_handler+0xd0>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    28f6:	4a3f      	ldr	r2, [pc, #252]	; (29f4 <TIM1_CC_handler+0x138>)
    28f8:	6811      	ldr	r1, [r2, #0]
    28fa:	b169      	cbz	r1, 2918 <TIM1_CC_handler+0x5c>
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
    28fc:	b410      	push	{r4}
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    28fe:	483e      	ldr	r0, [pc, #248]	; (29f8 <TIM1_CC_handler+0x13c>)
			line_count=-1;
    2900:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    2904:	8801      	ldrh	r1, [r0, #0]
    2906:	f3c1 014e 	ubfx	r1, r1, #1, #15
    290a:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    290c:	601c      	str	r4, [r3, #0]
			even=-even;
    290e:	6813      	ldr	r3, [r2, #0]
    2910:	425b      	negs	r3, r3
    2912:	6013      	str	r3, [r2, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    2914:	f85d 4b04 	ldr.w	r4, [sp], #4
    2918:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    291a:	2a06      	cmp	r2, #6
    291c:	d05a      	beq.n	29d4 <TIM1_CC_handler+0x118>
    291e:	dd29      	ble.n	2974 <TIM1_CC_handler+0xb8>
    2920:	2a0c      	cmp	r2, #12
    2922:	d019      	beq.n	2958 <TIM1_CC_handler+0x9c>
    2924:	2a11      	cmp	r2, #17
    2926:	d131      	bne.n	298c <TIM1_CC_handler+0xd0>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
		break;
	case 17: // fin sync champ paire
		if (even){
    2928:	4b32      	ldr	r3, [pc, #200]	; (29f4 <TIM1_CC_handler+0x138>)
    292a:	681b      	ldr	r3, [r3, #0]
    292c:	2b00      	cmp	r3, #0
    292e:	d0f3      	beq.n	2918 <TIM1_CC_handler+0x5c>
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    2930:	4931      	ldr	r1, [pc, #196]	; (29f8 <TIM1_CC_handler+0x13c>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    2932:	4b32      	ldr	r3, [pc, #200]	; (29fc <TIM1_CC_handler+0x140>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    2934:	f44f 6065 	mov.w	r0, #3664	; 0xe50
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    2938:	f44f 7286 	mov.w	r2, #268	; 0x10c
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    293c:	8008      	strh	r0, [r1, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    293e:	801a      	strh	r2, [r3, #0]
    2940:	4770      	bx	lr
		break;
	case (TOP_LINE+VRES):
		video=0;
		break;
	case FIELD_END:
		if (!even){
    2942:	4a2c      	ldr	r2, [pc, #176]	; (29f4 <TIM1_CC_handler+0x138>)
    2944:	6811      	ldr	r1, [r2, #0]
    2946:	2900      	cmp	r1, #0
    2948:	d1e6      	bne.n	2918 <TIM1_CC_handler+0x5c>
			line_count=-1;
    294a:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    294e:	6019      	str	r1, [r3, #0]
			even=-even;
    2950:	6813      	ldr	r3, [r2, #0]
    2952:	425b      	negs	r3, r3
    2954:	6013      	str	r3, [r2, #0]
    2956:	4770      	bx	lr
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    2958:	4927      	ldr	r1, [pc, #156]	; (29f8 <TIM1_CC_handler+0x13c>)
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    295a:	4b28      	ldr	r3, [pc, #160]	; (29fc <TIM1_CC_handler+0x140>)
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    295c:	f44f 60e5 	mov.w	r0, #1832	; 0x728
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    2960:	2286      	movs	r2, #134	; 0x86
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    2962:	8008      	strh	r0, [r1, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    2964:	801a      	strh	r2, [r3, #0]
		break;
    2966:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2968:	2a3b      	cmp	r2, #59	; 0x3b
    296a:	d10f      	bne.n	298c <TIM1_CC_handler+0xd0>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    296c:	4b24      	ldr	r3, [pc, #144]	; (2a00 <TIM1_CC_handler+0x144>)
    296e:	2201      	movs	r2, #1
    2970:	601a      	str	r2, [r3, #0]
		break;
    2972:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2974:	b952      	cbnz	r2, 298c <TIM1_CC_handler+0xd0>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    2976:	4920      	ldr	r1, [pc, #128]	; (29f8 <TIM1_CC_handler+0x13c>)
		*TIMER1_CCR1/=2;
    2978:	4a20      	ldr	r2, [pc, #128]	; (29fc <TIM1_CC_handler+0x140>)
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    297a:	880b      	ldrh	r3, [r1, #0]
    297c:	f3c3 034e 	ubfx	r3, r3, #1, #15
    2980:	800b      	strh	r3, [r1, #0]
		*TIMER1_CCR1/=2;
    2982:	8813      	ldrh	r3, [r2, #0]
    2984:	f3c3 034e 	ubfx	r3, r3, #1, #15
    2988:	8013      	strh	r3, [r2, #0]
		break;
    298a:	4770      	bx	lr
		SPI2->DR=0xaaaa;
		while (SPI2->SR&SPI_SR_BSY);
		SPI2->CR1=SPI_PIXELS;
		SPI2->DR=0;
*/	
		if (video){
    298c:	4a1c      	ldr	r2, [pc, #112]	; (2a00 <TIM1_CC_handler+0x144>)
    298e:	6812      	ldr	r2, [r2, #0]
    2990:	2a00      	cmp	r2, #0
    2992:	d0c1      	beq.n	2918 <TIM1_CC_handler+0x5c>
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2994:	681b      	ldr	r3, [r3, #0]
    2996:	4a1b      	ldr	r2, [pc, #108]	; (2a04 <TIM1_CC_handler+0x148>)
    2998:	3b3c      	subs	r3, #60	; 0x3c
    299a:	4913      	ldr	r1, [pc, #76]	; (29e8 <TIM1_CC_handler+0x12c>)
    299c:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    29a0:	eb02 03c3 	add.w	r3, r2, r3, lsl #3
			DMA1[DMACH5].cndtr=ROW_SIZE;
    29a4:	2014      	movs	r0, #20
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    29a6:	4a18      	ldr	r2, [pc, #96]	; (2a08 <TIM1_CC_handler+0x14c>)
		SPI2->DR=0;
*/	
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    29a8:	60cb      	str	r3, [r1, #12]
			DMA1[DMACH5].cndtr=ROW_SIZE;
    29aa:	6048      	str	r0, [r1, #4]
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    29ac:	8813      	ldrh	r3, [r2, #0]
    29ae:	b29b      	uxth	r3, r3
    29b0:	f5b3 7f2f 	cmp.w	r3, #700	; 0x2bc
    29b4:	d204      	bcs.n	29c0 <TIM1_CC_handler+0x104>
    29b6:	8813      	ldrh	r3, [r2, #0]
    29b8:	b29b      	uxth	r3, r3
    29ba:	f5b3 7f2f 	cmp.w	r3, #700	; 0x2bc
    29be:	d3fa      	bcc.n	29b6 <TIM1_CC_handler+0xfa>
			_enable_dma();
    29c0:	4a09      	ldr	r2, [pc, #36]	; (29e8 <TIM1_CC_handler+0x12c>)
    29c2:	6813      	ldr	r3, [r2, #0]
    29c4:	f043 0301 	orr.w	r3, r3, #1
    29c8:	6013      	str	r3, [r2, #0]
    29ca:	4770      	bx	lr
		break;
	case TOP_LINE-1:
		video=1;
		break;
	case (TOP_LINE+VRES):
		video=0;
    29cc:	4b0c      	ldr	r3, [pc, #48]	; (2a00 <TIM1_CC_handler+0x144>)
    29ce:	2200      	movs	r2, #0
    29d0:	601a      	str	r2, [r3, #0]
		break;
    29d2:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    29d4:	f240 62a1 	movw	r2, #1697	; 0x6a1
    29d8:	4b08      	ldr	r3, [pc, #32]	; (29fc <TIM1_CC_handler+0x140>)
    29da:	801a      	strh	r2, [r3, #0]
	    break;
    29dc:	4770      	bx	lr
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
    29de:	4b05      	ldr	r3, [pc, #20]	; (29f4 <TIM1_CC_handler+0x138>)
    29e0:	681b      	ldr	r3, [r3, #0]
    29e2:	2b00      	cmp	r3, #0
    29e4:	d198      	bne.n	2918 <TIM1_CC_handler+0x5c>
    29e6:	e7a3      	b.n	2930 <TIM1_CC_handler+0x74>
    29e8:	40020058 	.word	0x40020058
    29ec:	20000004 	.word	0x20000004
    29f0:	40012c10 	.word	0x40012c10
    29f4:	200000e0 	.word	0x200000e0
    29f8:	40012c2c 	.word	0x40012c2c
    29fc:	40012c34 	.word	0x40012c34
    2a00:	200000dc 	.word	0x200000dc
    2a04:	20000128 	.word	0x20000128
    2a08:	40012c24 	.word	0x40012c24

00002a0c <DMA1CH5_handler>:
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
    2a0c:	b480      	push	{r7}
    2a0e:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    2a10:	4a0a      	ldr	r2, [pc, #40]	; (2a3c <DMA1CH5_handler+0x30>)
    2a12:	4b0a      	ldr	r3, [pc, #40]	; (2a3c <DMA1CH5_handler+0x30>)
    2a14:	685b      	ldr	r3, [r3, #4]
    2a16:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    2a1a:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    2a1c:	bf00      	nop
    2a1e:	4b08      	ldr	r3, [pc, #32]	; (2a40 <DMA1CH5_handler+0x34>)
    2a20:	891b      	ldrh	r3, [r3, #8]
    2a22:	b29b      	uxth	r3, r3
    2a24:	f003 0302 	and.w	r3, r3, #2
    2a28:	2b00      	cmp	r3, #0
    2a2a:	d0f8      	beq.n	2a1e <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    2a2c:	4b04      	ldr	r3, [pc, #16]	; (2a40 <DMA1CH5_handler+0x34>)
    2a2e:	2200      	movs	r2, #0
    2a30:	819a      	strh	r2, [r3, #12]
}
    2a32:	46bd      	mov	sp, r7
    2a34:	f85d 7b04 	ldr.w	r7, [sp], #4
    2a38:	4770      	bx	lr
    2a3a:	bf00      	nop
    2a3c:	40020000 	.word	0x40020000
    2a40:	40003800 	.word	0x40003800

00002a44 <usart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
    2a44:	b480      	push	{r7}
    2a46:	b085      	sub	sp, #20
    2a48:	af00      	add	r7, sp, #0
    2a4a:	6078      	str	r0, [r7, #4]
    2a4c:	6039      	str	r1, [r7, #0]
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
    2a4e:	687b      	ldr	r3, [r7, #4]
    2a50:	4a15      	ldr	r2, [pc, #84]	; (2aa8 <usart_set_baud+0x64>)
    2a52:	4293      	cmp	r3, r2
    2a54:	d110      	bne.n	2a78 <usart_set_baud+0x34>
		rate=(FAPB2/baud/16)<<4;
    2a56:	4a15      	ldr	r2, [pc, #84]	; (2aac <usart_set_baud+0x68>)
    2a58:	683b      	ldr	r3, [r7, #0]
    2a5a:	fbb2 f3f3 	udiv	r3, r2, r3
    2a5e:	091b      	lsrs	r3, r3, #4
    2a60:	011b      	lsls	r3, r3, #4
    2a62:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    2a64:	4a11      	ldr	r2, [pc, #68]	; (2aac <usart_set_baud+0x68>)
    2a66:	683b      	ldr	r3, [r7, #0]
    2a68:	fbb2 f3f3 	udiv	r3, r2, r3
    2a6c:	f003 030f 	and.w	r3, r3, #15
    2a70:	68fa      	ldr	r2, [r7, #12]
    2a72:	4313      	orrs	r3, r2
    2a74:	60fb      	str	r3, [r7, #12]
    2a76:	e00f      	b.n	2a98 <usart_set_baud+0x54>
	}else{
		rate=(FAPB1/baud/16)<<4;
    2a78:	4a0d      	ldr	r2, [pc, #52]	; (2ab0 <usart_set_baud+0x6c>)
    2a7a:	683b      	ldr	r3, [r7, #0]
    2a7c:	fbb2 f3f3 	udiv	r3, r2, r3
    2a80:	091b      	lsrs	r3, r3, #4
    2a82:	011b      	lsls	r3, r3, #4
    2a84:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    2a86:	4a0a      	ldr	r2, [pc, #40]	; (2ab0 <usart_set_baud+0x6c>)
    2a88:	683b      	ldr	r3, [r7, #0]
    2a8a:	fbb2 f3f3 	udiv	r3, r2, r3
    2a8e:	f003 030f 	and.w	r3, r3, #15
    2a92:	68fa      	ldr	r2, [r7, #12]
    2a94:	4313      	orrs	r3, r2
    2a96:	60fb      	str	r3, [r7, #12]
	}
	channel->BRR=rate;
    2a98:	687b      	ldr	r3, [r7, #4]
    2a9a:	68fa      	ldr	r2, [r7, #12]
    2a9c:	609a      	str	r2, [r3, #8]
}
    2a9e:	3714      	adds	r7, #20
    2aa0:	46bd      	mov	sp, r7
    2aa2:	f85d 7b04 	ldr.w	r7, [sp], #4
    2aa6:	4770      	bx	lr
    2aa8:	40013800 	.word	0x40013800
    2aac:	0369e994 	.word	0x0369e994
    2ab0:	01b4f4ca 	.word	0x01b4f4ca

00002ab4 <usart_comm_dir>:

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
    2ab4:	b480      	push	{r7}
    2ab6:	b083      	sub	sp, #12
    2ab8:	af00      	add	r7, sp, #0
    2aba:	6078      	str	r0, [r7, #4]
    2abc:	6039      	str	r1, [r7, #0]
	channel->CR1&=USART_CR1_DIR_MASK;
    2abe:	687b      	ldr	r3, [r7, #4]
    2ac0:	68db      	ldr	r3, [r3, #12]
    2ac2:	f023 020c 	bic.w	r2, r3, #12
    2ac6:	687b      	ldr	r3, [r7, #4]
    2ac8:	60da      	str	r2, [r3, #12]
	channel->CR1|=direction<<USART_CR1_DIR_POS;
    2aca:	687b      	ldr	r3, [r7, #4]
    2acc:	68da      	ldr	r2, [r3, #12]
    2ace:	683b      	ldr	r3, [r7, #0]
    2ad0:	009b      	lsls	r3, r3, #2
    2ad2:	431a      	orrs	r2, r3
    2ad4:	687b      	ldr	r3, [r7, #4]
    2ad6:	60da      	str	r2, [r3, #12]
}
    2ad8:	370c      	adds	r7, #12
    2ada:	46bd      	mov	sp, r7
    2adc:	f85d 7b04 	ldr.w	r7, [sp], #4
    2ae0:	4770      	bx	lr
    2ae2:	bf00      	nop

00002ae4 <usart_open_channel>:


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
    2ae4:	b580      	push	{r7, lr}
    2ae6:	b084      	sub	sp, #16
    2ae8:	af00      	add	r7, sp, #0
    2aea:	60f8      	str	r0, [r7, #12]
    2aec:	60b9      	str	r1, [r7, #8]
    2aee:	607a      	str	r2, [r7, #4]
    2af0:	603b      	str	r3, [r7, #0]
	usart_set_baud(channel,baud);
    2af2:	68f8      	ldr	r0, [r7, #12]
    2af4:	68b9      	ldr	r1, [r7, #8]
    2af6:	f7ff ffa5 	bl	2a44 <usart_set_baud>
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    2afa:	68fb      	ldr	r3, [r7, #12]
    2afc:	4a62      	ldr	r2, [pc, #392]	; (2c88 <usart_open_channel+0x1a4>)
    2afe:	4293      	cmp	r3, r2
    2b00:	d066      	beq.n	2bd0 <usart_open_channel+0xec>
    2b02:	4a62      	ldr	r2, [pc, #392]	; (2c8c <usart_open_channel+0x1a8>)
    2b04:	4293      	cmp	r3, r2
    2b06:	d003      	beq.n	2b10 <usart_open_channel+0x2c>
    2b08:	4a61      	ldr	r2, [pc, #388]	; (2c90 <usart_open_channel+0x1ac>)
    2b0a:	4293      	cmp	r3, r2
    2b0c:	d030      	beq.n	2b70 <usart_open_channel+0x8c>
    2b0e:	e08f      	b.n	2c30 <usart_open_channel+0x14c>
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
    2b10:	4a60      	ldr	r2, [pc, #384]	; (2c94 <usart_open_channel+0x1b0>)
    2b12:	4b60      	ldr	r3, [pc, #384]	; (2c94 <usart_open_channel+0x1b0>)
    2b14:	699b      	ldr	r3, [r3, #24]
    2b16:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    2b1a:	f043 0304 	orr.w	r3, r3, #4
    2b1e:	6193      	str	r3, [r2, #24]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    2b20:	69bb      	ldr	r3, [r7, #24]
    2b22:	2b01      	cmp	r3, #1
    2b24:	d110      	bne.n	2b48 <usart_open_channel+0x64>
			GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    2b26:	4a5c      	ldr	r2, [pc, #368]	; (2c98 <usart_open_channel+0x1b4>)
    2b28:	4b5b      	ldr	r3, [pc, #364]	; (2c98 <usart_open_channel+0x1b4>)
    2b2a:	681b      	ldr	r3, [r3, #0]
    2b2c:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    2b30:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    2b34:	6013      	str	r3, [r2, #0]
			GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    2b36:	4a58      	ldr	r2, [pc, #352]	; (2c98 <usart_open_channel+0x1b4>)
    2b38:	4b57      	ldr	r3, [pc, #348]	; (2c98 <usart_open_channel+0x1b4>)
    2b3a:	681b      	ldr	r3, [r3, #0]
    2b3c:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    2b40:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    2b44:	6013      	str	r3, [r2, #0]
    2b46:	e00b      	b.n	2b60 <usart_open_channel+0x7c>
		}else{
			GPIOA_CRH->cr&=~(15<<GPIO_MODE9);
    2b48:	4a53      	ldr	r2, [pc, #332]	; (2c98 <usart_open_channel+0x1b4>)
    2b4a:	4b53      	ldr	r3, [pc, #332]	; (2c98 <usart_open_channel+0x1b4>)
    2b4c:	681b      	ldr	r3, [r3, #0]
    2b4e:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    2b52:	6013      	str	r3, [r2, #0]
			GPIOA_CRH->cr|=(0xA<<GPIO_MODE9);
    2b54:	4a50      	ldr	r2, [pc, #320]	; (2c98 <usart_open_channel+0x1b4>)
    2b56:	4b50      	ldr	r3, [pc, #320]	; (2c98 <usart_open_channel+0x1b4>)
    2b58:	681b      	ldr	r3, [r3, #0]
    2b5a:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    2b5e:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART1,7);
    2b60:	2025      	movs	r0, #37	; 0x25
    2b62:	2107      	movs	r1, #7
    2b64:	f7ff fc4c 	bl	2400 <set_int_priority>
		enable_interrupt(IRQ_USART1);
    2b68:	2025      	movs	r0, #37	; 0x25
    2b6a:	f7ff fb7d 	bl	2268 <enable_interrupt>
		break;
    2b6e:	e05f      	b.n	2c30 <usart_open_channel+0x14c>
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    2b70:	4a48      	ldr	r2, [pc, #288]	; (2c94 <usart_open_channel+0x1b0>)
    2b72:	4b48      	ldr	r3, [pc, #288]	; (2c94 <usart_open_channel+0x1b0>)
    2b74:	69db      	ldr	r3, [r3, #28]
    2b76:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    2b7a:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    2b7c:	4a45      	ldr	r2, [pc, #276]	; (2c94 <usart_open_channel+0x1b0>)
    2b7e:	4b45      	ldr	r3, [pc, #276]	; (2c94 <usart_open_channel+0x1b0>)
    2b80:	699b      	ldr	r3, [r3, #24]
    2b82:	f043 0304 	orr.w	r3, r3, #4
    2b86:	6193      	str	r3, [r2, #24]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
    2b88:	69bb      	ldr	r3, [r7, #24]
    2b8a:	2b01      	cmp	r3, #1
    2b8c:	d10c      	bne.n	2ba8 <usart_open_channel+0xc4>
			GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    2b8e:	4a43      	ldr	r2, [pc, #268]	; (2c9c <usart_open_channel+0x1b8>)
    2b90:	4b42      	ldr	r3, [pc, #264]	; (2c9c <usart_open_channel+0x1b8>)
    2b92:	681b      	ldr	r3, [r3, #0]
    2b94:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    2b98:	6013      	str	r3, [r2, #0]
			GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    2b9a:	4a40      	ldr	r2, [pc, #256]	; (2c9c <usart_open_channel+0x1b8>)
    2b9c:	4b3f      	ldr	r3, [pc, #252]	; (2c9c <usart_open_channel+0x1b8>)
    2b9e:	681b      	ldr	r3, [r3, #0]
    2ba0:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    2ba4:	6013      	str	r3, [r2, #0]
    2ba6:	e00b      	b.n	2bc0 <usart_open_channel+0xdc>
		}else{
			GPIOA_CRL->cr&=~(15<<GPIO_MODE2);
    2ba8:	4a3c      	ldr	r2, [pc, #240]	; (2c9c <usart_open_channel+0x1b8>)
    2baa:	4b3c      	ldr	r3, [pc, #240]	; (2c9c <usart_open_channel+0x1b8>)
    2bac:	681b      	ldr	r3, [r3, #0]
    2bae:	f423 6370 	bic.w	r3, r3, #3840	; 0xf00
    2bb2:	6013      	str	r3, [r2, #0]
			GPIOA_CRL->cr|=(0xA<<GPIO_MODE2);
    2bb4:	4a39      	ldr	r2, [pc, #228]	; (2c9c <usart_open_channel+0x1b8>)
    2bb6:	4b39      	ldr	r3, [pc, #228]	; (2c9c <usart_open_channel+0x1b8>)
    2bb8:	681b      	ldr	r3, [r3, #0]
    2bba:	f443 6320 	orr.w	r3, r3, #2560	; 0xa00
    2bbe:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART2,7);
    2bc0:	2026      	movs	r0, #38	; 0x26
    2bc2:	2107      	movs	r1, #7
    2bc4:	f7ff fc1c 	bl	2400 <set_int_priority>
		enable_interrupt(IRQ_USART2);
    2bc8:	2026      	movs	r0, #38	; 0x26
    2bca:	f7ff fb4d 	bl	2268 <enable_interrupt>
		break;
    2bce:	e02f      	b.n	2c30 <usart_open_channel+0x14c>
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
    2bd0:	4a30      	ldr	r2, [pc, #192]	; (2c94 <usart_open_channel+0x1b0>)
    2bd2:	4b30      	ldr	r3, [pc, #192]	; (2c94 <usart_open_channel+0x1b0>)
    2bd4:	69db      	ldr	r3, [r3, #28]
    2bd6:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    2bda:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    2bdc:	4a2d      	ldr	r2, [pc, #180]	; (2c94 <usart_open_channel+0x1b0>)
    2bde:	4b2d      	ldr	r3, [pc, #180]	; (2c94 <usart_open_channel+0x1b0>)
    2be0:	699b      	ldr	r3, [r3, #24]
    2be2:	f043 0308 	orr.w	r3, r3, #8
    2be6:	6193      	str	r3, [r2, #24]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    2be8:	69bb      	ldr	r3, [r7, #24]
    2bea:	2b01      	cmp	r3, #1
    2bec:	d10c      	bne.n	2c08 <usart_open_channel+0x124>
			GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    2bee:	4a2c      	ldr	r2, [pc, #176]	; (2ca0 <usart_open_channel+0x1bc>)
    2bf0:	4b2b      	ldr	r3, [pc, #172]	; (2ca0 <usart_open_channel+0x1bc>)
    2bf2:	681b      	ldr	r3, [r3, #0]
    2bf4:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    2bf8:	6013      	str	r3, [r2, #0]
			GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    2bfa:	4a29      	ldr	r2, [pc, #164]	; (2ca0 <usart_open_channel+0x1bc>)
    2bfc:	4b28      	ldr	r3, [pc, #160]	; (2ca0 <usart_open_channel+0x1bc>)
    2bfe:	681b      	ldr	r3, [r3, #0]
    2c00:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    2c04:	6013      	str	r3, [r2, #0]
    2c06:	e00b      	b.n	2c20 <usart_open_channel+0x13c>
		}else{
			GPIOB_CRH->cr&=~((15<<GPIO_MODE10));
    2c08:	4a25      	ldr	r2, [pc, #148]	; (2ca0 <usart_open_channel+0x1bc>)
    2c0a:	4b25      	ldr	r3, [pc, #148]	; (2ca0 <usart_open_channel+0x1bc>)
    2c0c:	681b      	ldr	r3, [r3, #0]
    2c0e:	f423 6370 	bic.w	r3, r3, #3840	; 0xf00
    2c12:	6013      	str	r3, [r2, #0]
			GPIOB_CRH->cr|=(0xA<<GPIO_MODE10);
    2c14:	4a22      	ldr	r2, [pc, #136]	; (2ca0 <usart_open_channel+0x1bc>)
    2c16:	4b22      	ldr	r3, [pc, #136]	; (2ca0 <usart_open_channel+0x1bc>)
    2c18:	681b      	ldr	r3, [r3, #0]
    2c1a:	f443 6320 	orr.w	r3, r3, #2560	; 0xa00
    2c1e:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART3,7);
    2c20:	2027      	movs	r0, #39	; 0x27
    2c22:	2107      	movs	r1, #7
    2c24:	f7ff fbec 	bl	2400 <set_int_priority>
		enable_interrupt(IRQ_USART3);
    2c28:	2027      	movs	r0, #39	; 0x27
    2c2a:	f7ff fb1d 	bl	2268 <enable_interrupt>
		break;
    2c2e:	bf00      	nop
	}
	if (flow_ctrl==FLOW_HARD){
    2c30:	69bb      	ldr	r3, [r7, #24]
    2c32:	2b01      	cmp	r3, #1
    2c34:	d103      	bne.n	2c3e <usart_open_channel+0x15a>
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    2c36:	68fb      	ldr	r3, [r7, #12]
    2c38:	f44f 7240 	mov.w	r2, #768	; 0x300
    2c3c:	615a      	str	r2, [r3, #20]
	}
	usart_comm_dir(channel,dir);
    2c3e:	68f8      	ldr	r0, [r7, #12]
    2c40:	6839      	ldr	r1, [r7, #0]
    2c42:	f7ff ff37 	bl	2ab4 <usart_comm_dir>
	switch (parity){
    2c46:	687b      	ldr	r3, [r7, #4]
    2c48:	2b01      	cmp	r3, #1
    2c4a:	d00b      	beq.n	2c64 <usart_open_channel+0x180>
    2c4c:	2b01      	cmp	r3, #1
    2c4e:	d302      	bcc.n	2c56 <usart_open_channel+0x172>
    2c50:	2b02      	cmp	r3, #2
    2c52:	d00e      	beq.n	2c72 <usart_open_channel+0x18e>
    2c54:	e014      	b.n	2c80 <usart_open_channel+0x19c>
	case PARITY_NONE:
		channel->CR1|=USART_CR1_UE;
    2c56:	68fb      	ldr	r3, [r7, #12]
    2c58:	68db      	ldr	r3, [r3, #12]
    2c5a:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
    2c5e:	68fb      	ldr	r3, [r7, #12]
    2c60:	60da      	str	r2, [r3, #12]
		break;
    2c62:	e00d      	b.n	2c80 <usart_open_channel+0x19c>
	case PARITY_ODD:
		channel->CR1|=USART_CR1_UE|USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS;
    2c64:	68fb      	ldr	r3, [r7, #12]
    2c66:	68db      	ldr	r3, [r3, #12]
    2c68:	f443 521c 	orr.w	r2, r3, #9984	; 0x2700
    2c6c:	68fb      	ldr	r3, [r7, #12]
    2c6e:	60da      	str	r2, [r3, #12]
		break;
    2c70:	e006      	b.n	2c80 <usart_open_channel+0x19c>
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_UE|USART_CR1_PEIE|USART_CR1_PCE;
    2c72:	68fb      	ldr	r3, [r7, #12]
    2c74:	68db      	ldr	r3, [r3, #12]
    2c76:	f443 5214 	orr.w	r2, r3, #9472	; 0x2500
    2c7a:	68fb      	ldr	r3, [r7, #12]
    2c7c:	60da      	str	r2, [r3, #12]
		break;
    2c7e:	bf00      	nop
    }
}
    2c80:	3710      	adds	r7, #16
    2c82:	46bd      	mov	sp, r7
    2c84:	bd80      	pop	{r7, pc}
    2c86:	bf00      	nop
    2c88:	40004800 	.word	0x40004800
    2c8c:	40013800 	.word	0x40013800
    2c90:	40004400 	.word	0x40004400
    2c94:	40021000 	.word	0x40021000
    2c98:	40010804 	.word	0x40010804
    2c9c:	40010800 	.word	0x40010800
    2ca0:	40010c04 	.word	0x40010c04

00002ca4 <usart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
    2ca4:	b480      	push	{r7}
    2ca6:	b083      	sub	sp, #12
    2ca8:	af00      	add	r7, sp, #0
    2caa:	6078      	str	r0, [r7, #4]
	return channel->SR&USART_SR_RXNE;
    2cac:	687b      	ldr	r3, [r7, #4]
    2cae:	681b      	ldr	r3, [r3, #0]
    2cb0:	f003 0320 	and.w	r3, r3, #32
}
    2cb4:	4618      	mov	r0, r3
    2cb6:	370c      	adds	r7, #12
    2cb8:	46bd      	mov	sp, r7
    2cba:	f85d 7b04 	ldr.w	r7, [sp], #4
    2cbe:	4770      	bx	lr

00002cc0 <usart_getc>:

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
    2cc0:	b480      	push	{r7}
    2cc2:	b083      	sub	sp, #12
    2cc4:	af00      	add	r7, sp, #0
    2cc6:	6078      	str	r0, [r7, #4]
	return channel->DR;
    2cc8:	687b      	ldr	r3, [r7, #4]
    2cca:	685b      	ldr	r3, [r3, #4]
    2ccc:	b2db      	uxtb	r3, r3
}
    2cce:	4618      	mov	r0, r3
    2cd0:	370c      	adds	r7, #12
    2cd2:	46bd      	mov	sp, r7
    2cd4:	f85d 7b04 	ldr.w	r7, [sp], #4
    2cd8:	4770      	bx	lr
    2cda:	bf00      	nop

00002cdc <usart_putc>:

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
    2cdc:	b480      	push	{r7}
    2cde:	b083      	sub	sp, #12
    2ce0:	af00      	add	r7, sp, #0
    2ce2:	6078      	str	r0, [r7, #4]
    2ce4:	460b      	mov	r3, r1
    2ce6:	70fb      	strb	r3, [r7, #3]
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
    2ce8:	bf00      	nop
    2cea:	687b      	ldr	r3, [r7, #4]
    2cec:	681b      	ldr	r3, [r3, #0]
    2cee:	f003 0380 	and.w	r3, r3, #128	; 0x80
    2cf2:	2b00      	cmp	r3, #0
    2cf4:	d0f9      	beq.n	2cea <usart_putc+0xe>
	channel->DR=c;
    2cf6:	78fa      	ldrb	r2, [r7, #3]
    2cf8:	687b      	ldr	r3, [r7, #4]
    2cfa:	605a      	str	r2, [r3, #4]
}
    2cfc:	370c      	adds	r7, #12
    2cfe:	46bd      	mov	sp, r7
    2d00:	f85d 7b04 	ldr.w	r7, [sp], #4
    2d04:	4770      	bx	lr
    2d06:	bf00      	nop

Disassembly of section .user_code:

00003400 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    3400:	b480      	push	{r7}
    3402:	b085      	sub	sp, #20
    3404:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    3406:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    340a:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    340c:	2300      	movs	r3, #0
    340e:	71fb      	strb	r3, [r7, #7]
	
	
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    3410:	2300      	movs	r3, #0
    3412:	2200      	movs	r2, #0
    3414:	4618      	mov	r0, r3
    3416:	4611      	mov	r1, r2
    3418:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    341a:	f107 030c 	add.w	r3, r7, #12
    341e:	2200      	movs	r2, #0
    3420:	4618      	mov	r0, r3
    3422:	4611      	mov	r1, r2
    3424:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    3426:	f107 0308 	add.w	r3, r7, #8
    342a:	2200      	movs	r2, #0
    342c:	4618      	mov	r0, r3
    342e:	4611      	mov	r1, r2
    3430:	df04      	svc	4
    3432:	68bb      	ldr	r3, [r7, #8]
    3434:	2b00      	cmp	r3, #0
    3436:	d1f6      	bne.n	3426 <blink+0x26>
		_svc_call(SVC_LED_ON,NUL,NUL);
    3438:	2300      	movs	r3, #0
    343a:	2200      	movs	r2, #0
    343c:	4618      	mov	r0, r3
    343e:	4611      	mov	r1, r2
    3440:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    3442:	f107 030c 	add.w	r3, r7, #12
    3446:	2200      	movs	r2, #0
    3448:	4618      	mov	r0, r3
    344a:	4611      	mov	r1, r2
    344c:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    344e:	f107 0308 	add.w	r3, r7, #8
    3452:	2200      	movs	r2, #0
    3454:	4618      	mov	r0, r3
    3456:	4611      	mov	r1, r2
    3458:	df04      	svc	4
    345a:	68bb      	ldr	r3, [r7, #8]
    345c:	2b00      	cmp	r3, #0
    345e:	d1f6      	bne.n	344e <blink+0x4e>
		_svc_call(SVC_CONIN,&c,NUL);
    3460:	1dfb      	adds	r3, r7, #7
    3462:	2200      	movs	r2, #0
    3464:	4618      	mov	r0, r3
    3466:	4611      	mov	r1, r2
    3468:	df05      	svc	5
		if (c) break;
    346a:	79fb      	ldrb	r3, [r7, #7]
    346c:	b2db      	uxtb	r3, r3
    346e:	2b00      	cmp	r3, #0
    3470:	d000      	beq.n	3474 <blink+0x74>
    3472:	e000      	b.n	3476 <blink+0x76>
	}
    3474:	e7cc      	b.n	3410 <blink+0x10>
}
    3476:	3714      	adds	r7, #20
    3478:	46bd      	mov	sp, r7
    347a:	f85d 7b04 	ldr.w	r7, [sp], #4
    347e:	4770      	bx	lr
