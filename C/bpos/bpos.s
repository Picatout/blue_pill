
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 65 25 00 00     i...m...q...e%..
      20:	65 25 00 00 65 25 00 00 65 25 00 00 55 05 00 00     e%..e%..e%..U...
      30:	65 25 00 00 65 25 00 00 79 02 00 00 3d 26 00 00     e%..e%..y...=&..
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 65 25 00 00 65 25 00 00 59 29 00 00     ....e%..e%..Y)..
      80:	65 25 00 00 65 25 00 00 65 25 00 00 65 25 00 00     e%..e%..e%..e%..
      90:	65 25 00 00 65 25 00 00 65 25 00 00 75 1f 00 00     e%..e%..e%..u...
      a0:	65 25 00 00 65 25 00 00 65 25 00 00 09 28 00 00     e%..e%..e%...(..
      b0:	dd 20 00 00 65 25 00 00 65 25 00 00 65 25 00 00     . ..e%..e%..e%..
      c0:	65 25 00 00 65 25 00 00 65 25 00 00 65 25 00 00     e%..e%..e%..e%..
      d0:	65 25 00 00 c5 02 00 00 85 0f 00 00 cd 02 00 00     e%..............
      e0:	65 25 00 00 65 25 00 00 65 25 00 00 65 25 00 00     e%..e%..e%..e%..
      f0:	65 25 00 00 65 25 00 00 65 25 00 00 65 25 00 00     e%..e%..e%..e%..
     100:	65 25 00 00 65 25 00 00 65 25 00 00 65 25 00 00     e%..e%..e%..e%..
     110:	65 25 00 00 65 25 00 00 65 25 00 00 65 25 00 00     e%..e%..e%..e%..
     120:	65 25 00 00 65 25 00 00 65 25 00 00 65 25 00 00     e%..e%..e%..e%..

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
     1b0:	f000 fe88 	bl	ec4 <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	20000008 	.word	0x20000008
     1c0:	200026b8 	.word	0x200026b8
     1c4:	00003480 	.word	0x00003480
     1c8:	20000000 	.word	0x20000000
     1cc:	20000008 	.word	0x20000008
     1d0:	20002700 	.word	0x20002700
     1d4:	20000134 	.word	0x20000134
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
     208:	f002 f9b4 	bl	2574 <print_fault>
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
     21e:	f002 f9a9 	bl	2574 <print_fault>
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
     234:	f002 f99e 	bl	2574 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f002 f999 	bl	2574 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	000032d0 	.word	0x000032d0
     258:	000032e8 	.word	0x000032e8
     25c:	000032f4 	.word	0x000032f4
     260:	00003304 	.word	0x00003304

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f002 f97e 	bl	2564 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f002 f97c 	bl	2564 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f002 f97a 	bl	2564 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f002 f978 	bl	2564 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f002 f976 	bl	2564 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f002 f974 	bl	2564 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f002 f972 	bl	2564 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f002 f970 	bl	2564 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f002 f96e 	bl	2564 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f002 f96c 	bl	2564 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f002 f96a 	bl	2564 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f002 f968 	bl	2564 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f002 f966 	bl	2564 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f002 f964 	bl	2564 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f002 f962 	bl	2564 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f002 f960 	bl	2564 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f002 f95e 	bl	2564 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f002 f95c 	bl	2564 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f002 f95a 	bl	2564 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f002 f958 	bl	2564 <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f002 f956 	bl	2564 <reset_mcu>
_default_handler(EXTI9_5_handler) // 23
     2b8:	f002 f954 	bl	2564 <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2bc:	f002 f952 	bl	2564 <reset_mcu>
_default_handler(TIM2_handler) // 28
     2c0:	f002 f950 	bl	2564 <reset_mcu>

000002c4 <USART1_handler>:
_default_handler(USART1_handler) // 37
     2c4:	f002 f94e 	bl	2564 <reset_mcu>
_default_handler(USART2_handler) // 38
     2c8:	f002 f94c 	bl	2564 <reset_mcu>

000002cc <USART3_handler>:
_default_handler(USART3_handler) // 39
     2cc:	f002 f94a 	bl	2564 <reset_mcu>

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
     5da:	f001 fa8b 	bl	1af4 <write_pin>
		//led_on();
		break;
     5de:	e08f      	b.n	700 <SVC_handler+0x1ac>
	case SVC_LED_OFF:
		write_pin(LED_PORT,LED_PIN,LED_OFF);
     5e0:	484a      	ldr	r0, [pc, #296]	; (70c <SVC_handler+0x1b8>)
     5e2:	210d      	movs	r1, #13
     5e4:	2201      	movs	r2, #1
     5e6:	f001 fa85 	bl	1af4 <write_pin>
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
     600:	f000 fd32 	bl	1068 <conin>
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
     614:	f000 fd18 	bl	1048 <conout>
		break;
     618:	e072      	b.n	700 <SVC_handler+0x1ac>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     61a:	68bb      	ldr	r3, [r7, #8]
     61c:	681b      	ldr	r3, [r3, #0]
     61e:	6878      	ldr	r0, [r7, #4]
     620:	4619      	mov	r1, r3
     622:	f000 fd99 	bl	1158 <read_line>
     626:	4602      	mov	r2, r0
     628:	68bb      	ldr	r3, [r7, #8]
     62a:	601a      	str	r2, [r3, #0]
		break;
     62c:	e068      	b.n	700 <SVC_handler+0x1ac>
	case SVC_PRINT:
		print((const char*)arg1);
     62e:	68b8      	ldr	r0, [r7, #8]
     630:	f000 fd3c 	bl	10ac <print>
		break;
     634:	e064      	b.n	700 <SVC_handler+0x1ac>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     636:	68bb      	ldr	r3, [r7, #8]
     638:	681b      	ldr	r3, [r3, #0]
     63a:	4618      	mov	r0, r3
     63c:	210a      	movs	r1, #10
     63e:	f000 fe35 	bl	12ac <print_int>
		break;
     642:	e05d      	b.n	700 <SVC_handler+0x1ac>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     644:	68bb      	ldr	r3, [r7, #8]
     646:	681b      	ldr	r3, [r3, #0]
     648:	4618      	mov	r0, r3
     64a:	f000 fe9d 	bl	1388 <print_hex>
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
     6d2:	f000 ff09 	bl	14e8 <flash_write>
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
     6e4:	f000 ff44 	bl	1570 <flash_erase_page>
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
     6fa:	f001 ff33 	bl	2564 <reset_mcu>
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
     710:	20000128 	.word	0x20000128
     714:	20000124 	.word	0x20000124

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
     7d6:	f000 fadb 	bl	d90 <word>
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
     876:	f000 fa8b 	bl	d90 <word>
	cmd_id=search_command((const char*)pad);
     87a:	480a      	ldr	r0, [pc, #40]	; (8a4 <cmd_putc+0x34>)
     87c:	f000 f972 	bl	b64 <search_command>
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
     8a8:	00002d1c 	.word	0x00002d1c

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
     8c2:	f000 fbf3 	bl	10ac <print>
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
     8d4:	f000 fa5c 	bl	d90 <word>
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
     8ee:	f000 fa4f 	bl	d90 <word>
	cmd_id=search_command((const char*)pad);
     8f2:	480e      	ldr	r0, [pc, #56]	; (92c <cmd_print_int+0x44>)
     8f4:	f000 f936 	bl	b64 <search_command>
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
     930:	00002d1c 	.word	0x00002d1c

00000934 <cmd_print_hex>:

static void cmd_print_hex(){
     934:	b580      	push	{r7, lr}
     936:	b082      	sub	sp, #8
     938:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     93a:	f000 fa29 	bl	d90 <word>
	cmd_id=search_command((const char*)pad);
     93e:	480e      	ldr	r0, [pc, #56]	; (978 <cmd_print_hex+0x44>)
     940:	f000 f910 	bl	b64 <search_command>
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
     97c:	00002d1c 	.word	0x00002d1c

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
     98c:	20000134 	.word	0x20000134

00000990 <cmd_peek8>:

static void cmd_peek8(){
     990:	b580      	push	{r7, lr}
     992:	b082      	sub	sp, #8
     994:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     996:	f000 f9fb 	bl	d90 <word>
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
     9c6:	f000 f9e3 	bl	d90 <word>
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
     9f6:	f000 f9cb 	bl	d90 <word>
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
     a26:	f000 f9b3 	bl	d90 <word>
	adr=atoi((const char*)pad);
     a2a:	480a      	ldr	r0, [pc, #40]	; (a54 <cmd_poke8+0x34>)
     a2c:	f7ff fcce 	bl	3cc <atoi>
     a30:	4603      	mov	r3, r0
     a32:	607b      	str	r3, [r7, #4]
	word();
     a34:	f000 f9ac 	bl	d90 <word>
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
     a5e:	f000 f997 	bl	d90 <word>
	adr=atoi((const char*)pad);
     a62:	480a      	ldr	r0, [pc, #40]	; (a8c <cmd_poke16+0x34>)
     a64:	f7ff fcb2 	bl	3cc <atoi>
     a68:	4603      	mov	r3, r0
     a6a:	607b      	str	r3, [r7, #4]
	word();
     a6c:	f000 f990 	bl	d90 <word>
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
     a96:	f000 f97b 	bl	d90 <word>
	adr=atoi((const char*)pad);
     a9a:	480a      	ldr	r0, [pc, #40]	; (ac4 <cmd_poke32+0x34>)
     a9c:	f7ff fc96 	bl	3cc <atoi>
     aa0:	4603      	mov	r3, r0
     aa2:	607b      	str	r3, [r7, #4]
	word();
     aa4:	f000 f974 	bl	d90 <word>
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
     ace:	f000 f95f 	bl	d90 <word>
	adr=atoi((const char*)pad);
     ad2:	480d      	ldr	r0, [pc, #52]	; (b08 <cmd_fwrite+0x40>)
     ad4:	f7ff fc7a 	bl	3cc <atoi>
     ad8:	4603      	mov	r3, r0
     ada:	607b      	str	r3, [r7, #4]
	word();
     adc:	f000 f958 	bl	d90 <word>
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
     afc:	f000 fad6 	bl	10ac <print>
}
     b00:	3708      	adds	r7, #8
     b02:	46bd      	mov	sp, r7
     b04:	bd80      	pop	{r7, pc}
     b06:	bf00      	nop
     b08:	20000058 	.word	0x20000058
     b0c:	00002c68 	.word	0x00002c68

00000b10 <cmd_pgerase>:

static void cmd_pgerase(){
     b10:	b580      	push	{r7, lr}
     b12:	b082      	sub	sp, #8
     b14:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     b16:	f000 f93b 	bl	d90 <word>
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
     b36:	f000 fab9 	bl	10ac <print>
}
     b3a:	3708      	adds	r7, #8
     b3c:	46bd      	mov	sp, r7
     b3e:	bd80      	pop	{r7, pc}
     b40:	20000058 	.word	0x20000058
     b44:	00002c68 	.word	0x00002c68

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

00000b64 <search_command>:
	{"ticks",cmd_ticks},
	{NUL,NUL}
};


int search_command(const char * name){
     b64:	b580      	push	{r7, lr}
     b66:	b084      	sub	sp, #16
     b68:	af00      	add	r7, sp, #0
     b6a:	6078      	str	r0, [r7, #4]
	int i=0;
     b6c:	2300      	movs	r3, #0
     b6e:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     b70:	e00e      	b.n	b90 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     b72:	4a12      	ldr	r2, [pc, #72]	; (bbc <search_command+0x58>)
     b74:	68fb      	ldr	r3, [r7, #12]
     b76:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     b7a:	4618      	mov	r0, r3
     b7c:	6879      	ldr	r1, [r7, #4]
     b7e:	f7ff fba7 	bl	2d0 <strcmp>
     b82:	4603      	mov	r3, r0
     b84:	2b00      	cmp	r3, #0
     b86:	d100      	bne.n	b8a <search_command+0x26>
			break;
     b88:	e009      	b.n	b9e <search_command+0x3a>
		}
		i++;
     b8a:	68fb      	ldr	r3, [r7, #12]
     b8c:	3301      	adds	r3, #1
     b8e:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     b90:	4a0a      	ldr	r2, [pc, #40]	; (bbc <search_command+0x58>)
     b92:	68fb      	ldr	r3, [r7, #12]
     b94:	00db      	lsls	r3, r3, #3
     b96:	4413      	add	r3, r2
     b98:	685b      	ldr	r3, [r3, #4]
     b9a:	2b00      	cmp	r3, #0
     b9c:	d1e9      	bne.n	b72 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     b9e:	4a07      	ldr	r2, [pc, #28]	; (bbc <search_command+0x58>)
     ba0:	68fb      	ldr	r3, [r7, #12]
     ba2:	00db      	lsls	r3, r3, #3
     ba4:	4413      	add	r3, r2
     ba6:	685b      	ldr	r3, [r3, #4]
     ba8:	2b00      	cmp	r3, #0
     baa:	d102      	bne.n	bb2 <search_command+0x4e>
     bac:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     bb0:	60fb      	str	r3, [r7, #12]
	return i;
     bb2:	68fb      	ldr	r3, [r7, #12]
}
     bb4:	4618      	mov	r0, r3
     bb6:	3710      	adds	r7, #16
     bb8:	46bd      	mov	sp, r7
     bba:	bd80      	pop	{r7, pc}
     bbc:	00002d1c 	.word	0x00002d1c

00000bc0 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     bc0:	b480      	push	{r7}
     bc2:	b085      	sub	sp, #20
     bc4:	af00      	add	r7, sp, #0
     bc6:	60f8      	str	r0, [r7, #12]
     bc8:	60b9      	str	r1, [r7, #8]
     bca:	4613      	mov	r3, r2
     bcc:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     bce:	e002      	b.n	bd6 <skip+0x16>
     bd0:	68bb      	ldr	r3, [r7, #8]
     bd2:	3301      	adds	r3, #1
     bd4:	60bb      	str	r3, [r7, #8]
     bd6:	68bb      	ldr	r3, [r7, #8]
     bd8:	68fa      	ldr	r2, [r7, #12]
     bda:	4413      	add	r3, r2
     bdc:	781b      	ldrb	r3, [r3, #0]
     bde:	2b00      	cmp	r3, #0
     be0:	d006      	beq.n	bf0 <skip+0x30>
     be2:	68bb      	ldr	r3, [r7, #8]
     be4:	68fa      	ldr	r2, [r7, #12]
     be6:	4413      	add	r3, r2
     be8:	781b      	ldrb	r3, [r3, #0]
     bea:	79fa      	ldrb	r2, [r7, #7]
     bec:	429a      	cmp	r2, r3
     bee:	d0ef      	beq.n	bd0 <skip+0x10>
	return start;
     bf0:	68bb      	ldr	r3, [r7, #8]
}
     bf2:	4618      	mov	r0, r3
     bf4:	3714      	adds	r7, #20
     bf6:	46bd      	mov	sp, r7
     bf8:	f85d 7b04 	ldr.w	r7, [sp], #4
     bfc:	4770      	bx	lr
     bfe:	bf00      	nop

00000c00 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     c00:	b480      	push	{r7}
     c02:	b085      	sub	sp, #20
     c04:	af00      	add	r7, sp, #0
     c06:	60f8      	str	r0, [r7, #12]
     c08:	60b9      	str	r1, [r7, #8]
     c0a:	4613      	mov	r3, r2
     c0c:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     c0e:	e002      	b.n	c16 <scan+0x16>
     c10:	68bb      	ldr	r3, [r7, #8]
     c12:	3301      	adds	r3, #1
     c14:	60bb      	str	r3, [r7, #8]
     c16:	68bb      	ldr	r3, [r7, #8]
     c18:	68fa      	ldr	r2, [r7, #12]
     c1a:	4413      	add	r3, r2
     c1c:	781b      	ldrb	r3, [r3, #0]
     c1e:	2b00      	cmp	r3, #0
     c20:	d006      	beq.n	c30 <scan+0x30>
     c22:	68bb      	ldr	r3, [r7, #8]
     c24:	68fa      	ldr	r2, [r7, #12]
     c26:	4413      	add	r3, r2
     c28:	781b      	ldrb	r3, [r3, #0]
     c2a:	79fa      	ldrb	r2, [r7, #7]
     c2c:	429a      	cmp	r2, r3
     c2e:	d1ef      	bne.n	c10 <scan+0x10>
	return start;
     c30:	68bb      	ldr	r3, [r7, #8]
}
     c32:	4618      	mov	r0, r3
     c34:	3714      	adds	r7, #20
     c36:	46bd      	mov	sp, r7
     c38:	f85d 7b04 	ldr.w	r7, [sp], #4
     c3c:	4770      	bx	lr
     c3e:	bf00      	nop

00000c40 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     c40:	b480      	push	{r7}
     c42:	b087      	sub	sp, #28
     c44:	af00      	add	r7, sp, #0
     c46:	6078      	str	r0, [r7, #4]
     c48:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     c4a:	2300      	movs	r3, #0
     c4c:	617b      	str	r3, [r7, #20]
     c4e:	683b      	ldr	r3, [r7, #0]
     c50:	613b      	str	r3, [r7, #16]
     c52:	2300      	movs	r3, #0
     c54:	60fb      	str	r3, [r7, #12]
     c56:	2301      	movs	r3, #1
     c58:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     c5a:	e040      	b.n	cde <quote+0x9e>
		switch (buffer[end]){
     c5c:	693b      	ldr	r3, [r7, #16]
     c5e:	687a      	ldr	r2, [r7, #4]
     c60:	4413      	add	r3, r2
     c62:	781b      	ldrb	r3, [r3, #0]
     c64:	2b5c      	cmp	r3, #92	; 0x5c
     c66:	d012      	beq.n	c8e <quote+0x4e>
     c68:	2b6e      	cmp	r3, #110	; 0x6e
     c6a:	d022      	beq.n	cb2 <quote+0x72>
     c6c:	2b22      	cmp	r3, #34	; 0x22
     c6e:	d128      	bne.n	cc2 <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     c70:	697b      	ldr	r3, [r7, #20]
     c72:	2b00      	cmp	r3, #0
     c74:	d102      	bne.n	c7c <quote+0x3c>
     c76:	2300      	movs	r3, #0
     c78:	60bb      	str	r3, [r7, #8]
			break;
     c7a:	e02d      	b.n	cd8 <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     c7c:	68fb      	ldr	r3, [r7, #12]
     c7e:	1c5a      	adds	r2, r3, #1
     c80:	60fa      	str	r2, [r7, #12]
     c82:	4a21      	ldr	r2, [pc, #132]	; (d08 <quote+0xc8>)
     c84:	2122      	movs	r1, #34	; 0x22
     c86:	54d1      	strb	r1, [r2, r3]
     c88:	2300      	movs	r3, #0
     c8a:	617b      	str	r3, [r7, #20]
			break;
     c8c:	e024      	b.n	cd8 <quote+0x98>
		case '\\':
			if (!escaped){
     c8e:	697b      	ldr	r3, [r7, #20]
     c90:	2b00      	cmp	r3, #0
     c92:	d102      	bne.n	c9a <quote+0x5a>
				escaped=1;
     c94:	2301      	movs	r3, #1
     c96:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     c98:	e01e      	b.n	cd8 <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     c9a:	2300      	movs	r3, #0
     c9c:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     c9e:	68fb      	ldr	r3, [r7, #12]
     ca0:	1c5a      	adds	r2, r3, #1
     ca2:	60fa      	str	r2, [r7, #12]
     ca4:	693a      	ldr	r2, [r7, #16]
     ca6:	6879      	ldr	r1, [r7, #4]
     ca8:	440a      	add	r2, r1
     caa:	7811      	ldrb	r1, [r2, #0]
     cac:	4a16      	ldr	r2, [pc, #88]	; (d08 <quote+0xc8>)
     cae:	54d1      	strb	r1, [r2, r3]
			}
			break;
     cb0:	e012      	b.n	cd8 <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     cb2:	697b      	ldr	r3, [r7, #20]
     cb4:	2b00      	cmp	r3, #0
     cb6:	d004      	beq.n	cc2 <quote+0x82>
     cb8:	693b      	ldr	r3, [r7, #16]
     cba:	687a      	ldr	r2, [r7, #4]
     cbc:	4413      	add	r3, r2
     cbe:	220d      	movs	r2, #13
     cc0:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     cc2:	2300      	movs	r3, #0
     cc4:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     cc6:	68fb      	ldr	r3, [r7, #12]
     cc8:	1c5a      	adds	r2, r3, #1
     cca:	60fa      	str	r2, [r7, #12]
     ccc:	693a      	ldr	r2, [r7, #16]
     cce:	6879      	ldr	r1, [r7, #4]
     cd0:	440a      	add	r2, r1
     cd2:	7811      	ldrb	r1, [r2, #0]
     cd4:	4a0c      	ldr	r2, [pc, #48]	; (d08 <quote+0xc8>)
     cd6:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     cd8:	693b      	ldr	r3, [r7, #16]
     cda:	3301      	adds	r3, #1
     cdc:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     cde:	693b      	ldr	r3, [r7, #16]
     ce0:	687a      	ldr	r2, [r7, #4]
     ce2:	4413      	add	r3, r2
     ce4:	781b      	ldrb	r3, [r3, #0]
     ce6:	2b00      	cmp	r3, #0
     ce8:	d002      	beq.n	cf0 <quote+0xb0>
     cea:	68bb      	ldr	r3, [r7, #8]
     cec:	2b00      	cmp	r3, #0
     cee:	d1b5      	bne.n	c5c <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     cf0:	4a05      	ldr	r2, [pc, #20]	; (d08 <quote+0xc8>)
     cf2:	68fb      	ldr	r3, [r7, #12]
     cf4:	4413      	add	r3, r2
     cf6:	2200      	movs	r2, #0
     cf8:	701a      	strb	r2, [r3, #0]
	return end;
     cfa:	693b      	ldr	r3, [r7, #16]
}
     cfc:	4618      	mov	r0, r3
     cfe:	371c      	adds	r7, #28
     d00:	46bd      	mov	sp, r7
     d02:	f85d 7b04 	ldr.w	r7, [sp], #4
     d06:	4770      	bx	lr
     d08:	20000058 	.word	0x20000058

00000d0c <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     d0c:	b480      	push	{r7}
     d0e:	b087      	sub	sp, #28
     d10:	af00      	add	r7, sp, #0
     d12:	60f8      	str	r0, [r7, #12]
     d14:	60b9      	str	r1, [r7, #8]
     d16:	4613      	mov	r3, r2
     d18:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     d1a:	68bb      	ldr	r3, [r7, #8]
     d1c:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     d1e:	e002      	b.n	d26 <next+0x1a>
     d20:	697b      	ldr	r3, [r7, #20]
     d22:	3301      	adds	r3, #1
     d24:	617b      	str	r3, [r7, #20]
     d26:	697b      	ldr	r3, [r7, #20]
     d28:	68fa      	ldr	r2, [r7, #12]
     d2a:	4413      	add	r3, r2
     d2c:	781b      	ldrb	r3, [r3, #0]
     d2e:	2b00      	cmp	r3, #0
     d30:	d006      	beq.n	d40 <next+0x34>
     d32:	697b      	ldr	r3, [r7, #20]
     d34:	68fa      	ldr	r2, [r7, #12]
     d36:	4413      	add	r3, r2
     d38:	781b      	ldrb	r3, [r3, #0]
     d3a:	79fa      	ldrb	r2, [r7, #7]
     d3c:	429a      	cmp	r2, r3
     d3e:	d1ef      	bne.n	d20 <next+0x14>
	return end-start;
     d40:	697a      	ldr	r2, [r7, #20]
     d42:	68bb      	ldr	r3, [r7, #8]
     d44:	1ad3      	subs	r3, r2, r3
}
     d46:	4618      	mov	r0, r3
     d48:	371c      	adds	r7, #28
     d4a:	46bd      	mov	sp, r7
     d4c:	f85d 7b04 	ldr.w	r7, [sp], #4
     d50:	4770      	bx	lr
     d52:	bf00      	nop

00000d54 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     d54:	b480      	push	{r7}
     d56:	b085      	sub	sp, #20
     d58:	af00      	add	r7, sp, #0
     d5a:	60f8      	str	r0, [r7, #12]
     d5c:	60b9      	str	r1, [r7, #8]
     d5e:	607a      	str	r2, [r7, #4]
	while (len){
     d60:	e00a      	b.n	d78 <move+0x24>
		*dest++=*src++;
     d62:	68bb      	ldr	r3, [r7, #8]
     d64:	1c5a      	adds	r2, r3, #1
     d66:	60ba      	str	r2, [r7, #8]
     d68:	68fa      	ldr	r2, [r7, #12]
     d6a:	1c51      	adds	r1, r2, #1
     d6c:	60f9      	str	r1, [r7, #12]
     d6e:	7812      	ldrb	r2, [r2, #0]
     d70:	701a      	strb	r2, [r3, #0]
		len--;
     d72:	687b      	ldr	r3, [r7, #4]
     d74:	3b01      	subs	r3, #1
     d76:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     d78:	687b      	ldr	r3, [r7, #4]
     d7a:	2b00      	cmp	r3, #0
     d7c:	d1f1      	bne.n	d62 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     d7e:	68bb      	ldr	r3, [r7, #8]
     d80:	2200      	movs	r2, #0
     d82:	701a      	strb	r2, [r3, #0]
}
     d84:	3714      	adds	r7, #20
     d86:	46bd      	mov	sp, r7
     d88:	f85d 7b04 	ldr.w	r7, [sp], #4
     d8c:	4770      	bx	lr
     d8e:	bf00      	nop

00000d90 <word>:

// extrait le prochain mot du tib
static void word(){
     d90:	b580      	push	{r7, lr}
     d92:	b082      	sub	sp, #8
     d94:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     d96:	4b1d      	ldr	r3, [pc, #116]	; (e0c <word+0x7c>)
     d98:	681b      	ldr	r3, [r3, #0]
     d9a:	481d      	ldr	r0, [pc, #116]	; (e10 <word+0x80>)
     d9c:	4619      	mov	r1, r3
     d9e:	2220      	movs	r2, #32
     da0:	f7ff ff0e 	bl	bc0 <skip>
     da4:	4603      	mov	r3, r0
     da6:	461a      	mov	r2, r3
     da8:	4b18      	ldr	r3, [pc, #96]	; (e0c <word+0x7c>)
     daa:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     dac:	4b17      	ldr	r3, [pc, #92]	; (e0c <word+0x7c>)
     dae:	681b      	ldr	r3, [r3, #0]
     db0:	4a17      	ldr	r2, [pc, #92]	; (e10 <word+0x80>)
     db2:	5cd3      	ldrb	r3, [r2, r3]
     db4:	2b22      	cmp	r3, #34	; 0x22
     db6:	d10f      	bne.n	dd8 <word+0x48>
			in++;
     db8:	4b14      	ldr	r3, [pc, #80]	; (e0c <word+0x7c>)
     dba:	681b      	ldr	r3, [r3, #0]
     dbc:	3301      	adds	r3, #1
     dbe:	4a13      	ldr	r2, [pc, #76]	; (e0c <word+0x7c>)
     dc0:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     dc2:	4b12      	ldr	r3, [pc, #72]	; (e0c <word+0x7c>)
     dc4:	681b      	ldr	r3, [r3, #0]
     dc6:	4812      	ldr	r0, [pc, #72]	; (e10 <word+0x80>)
     dc8:	4619      	mov	r1, r3
     dca:	f7ff ff39 	bl	c40 <quote>
     dce:	4603      	mov	r3, r0
     dd0:	461a      	mov	r2, r3
     dd2:	4b0e      	ldr	r3, [pc, #56]	; (e0c <word+0x7c>)
     dd4:	601a      	str	r2, [r3, #0]
     dd6:	e016      	b.n	e06 <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     dd8:	4b0c      	ldr	r3, [pc, #48]	; (e0c <word+0x7c>)
     dda:	681b      	ldr	r3, [r3, #0]
     ddc:	480c      	ldr	r0, [pc, #48]	; (e10 <word+0x80>)
     dde:	4619      	mov	r1, r3
     de0:	2220      	movs	r2, #32
     de2:	f7ff ff93 	bl	d0c <next>
     de6:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     de8:	4b08      	ldr	r3, [pc, #32]	; (e0c <word+0x7c>)
     dea:	681b      	ldr	r3, [r3, #0]
     dec:	4a08      	ldr	r2, [pc, #32]	; (e10 <word+0x80>)
     dee:	4413      	add	r3, r2
     df0:	4618      	mov	r0, r3
     df2:	4908      	ldr	r1, [pc, #32]	; (e14 <word+0x84>)
     df4:	687a      	ldr	r2, [r7, #4]
     df6:	f7ff ffad 	bl	d54 <move>
			in+=len;
     dfa:	4b04      	ldr	r3, [pc, #16]	; (e0c <word+0x7c>)
     dfc:	681a      	ldr	r2, [r3, #0]
     dfe:	687b      	ldr	r3, [r7, #4]
     e00:	4413      	add	r3, r2
     e02:	4a02      	ldr	r2, [pc, #8]	; (e0c <word+0x7c>)
     e04:	6013      	str	r3, [r2, #0]
		}
}
     e06:	3708      	adds	r7, #8
     e08:	46bd      	mov	sp, r7
     e0a:	bd80      	pop	{r7, pc}
     e0c:	200000a8 	.word	0x200000a8
     e10:	20000008 	.word	0x20000008
     e14:	20000058 	.word	0x20000058

00000e18 <parse_line>:

static void parse_line(unsigned llen){
     e18:	b580      	push	{r7, lr}
     e1a:	b084      	sub	sp, #16
     e1c:	af00      	add	r7, sp, #0
     e1e:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     e20:	4b14      	ldr	r3, [pc, #80]	; (e74 <parse_line+0x5c>)
     e22:	2200      	movs	r2, #0
     e24:	601a      	str	r2, [r3, #0]
	while (in<llen){
     e26:	e019      	b.n	e5c <parse_line+0x44>
		word();
     e28:	f7ff ffb2 	bl	d90 <word>
		cmd_id=search_command((const char*) pad);
     e2c:	4812      	ldr	r0, [pc, #72]	; (e78 <parse_line+0x60>)
     e2e:	f7ff fe99 	bl	b64 <search_command>
     e32:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     e34:	68fb      	ldr	r3, [r7, #12]
     e36:	2b00      	cmp	r3, #0
     e38:	db06      	blt.n	e48 <parse_line+0x30>
			commands[cmd_id].fn();
     e3a:	4a10      	ldr	r2, [pc, #64]	; (e7c <parse_line+0x64>)
     e3c:	68fb      	ldr	r3, [r7, #12]
     e3e:	00db      	lsls	r3, r3, #3
     e40:	4413      	add	r3, r2
     e42:	685b      	ldr	r3, [r3, #4]
     e44:	4798      	blx	r3
     e46:	e009      	b.n	e5c <parse_line+0x44>
		}else{
			conout(CR);
     e48:	200d      	movs	r0, #13
     e4a:	f000 f8fd 	bl	1048 <conout>
			print((const char*)pad); conout('?');
     e4e:	480a      	ldr	r0, [pc, #40]	; (e78 <parse_line+0x60>)
     e50:	f000 f92c 	bl	10ac <print>
     e54:	203f      	movs	r0, #63	; 0x3f
     e56:	f000 f8f7 	bl	1048 <conout>
			break;
     e5a:	e004      	b.n	e66 <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     e5c:	4b05      	ldr	r3, [pc, #20]	; (e74 <parse_line+0x5c>)
     e5e:	681a      	ldr	r2, [r3, #0]
     e60:	687b      	ldr	r3, [r7, #4]
     e62:	429a      	cmp	r2, r3
     e64:	d3e0      	bcc.n	e28 <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     e66:	200d      	movs	r0, #13
     e68:	f000 f8ee 	bl	1048 <conout>
}
     e6c:	3710      	adds	r7, #16
     e6e:	46bd      	mov	sp, r7
     e70:	bd80      	pop	{r7, pc}
     e72:	bf00      	nop
     e74:	200000a8 	.word	0x200000a8
     e78:	20000058 	.word	0x20000058
     e7c:	00002d1c 	.word	0x00002d1c

00000e80 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     e80:	b480      	push	{r7}
     e82:	b085      	sub	sp, #20
     e84:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     e86:	4b0c      	ldr	r3, [pc, #48]	; (eb8 <copy_blink_in_ram+0x38>)
     e88:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     e8a:	4b0c      	ldr	r3, [pc, #48]	; (ebc <copy_blink_in_ram+0x3c>)
     e8c:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     e8e:	4b0c      	ldr	r3, [pc, #48]	; (ec0 <copy_blink_in_ram+0x40>)
     e90:	60bb      	str	r3, [r7, #8]
	while (start<end){
     e92:	e007      	b.n	ea4 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     e94:	68bb      	ldr	r3, [r7, #8]
     e96:	1d1a      	adds	r2, r3, #4
     e98:	60ba      	str	r2, [r7, #8]
     e9a:	68fa      	ldr	r2, [r7, #12]
     e9c:	1d11      	adds	r1, r2, #4
     e9e:	60f9      	str	r1, [r7, #12]
     ea0:	6812      	ldr	r2, [r2, #0]
     ea2:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     ea4:	68fa      	ldr	r2, [r7, #12]
     ea6:	687b      	ldr	r3, [r7, #4]
     ea8:	429a      	cmp	r2, r3
     eaa:	d3f3      	bcc.n	e94 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     eac:	3714      	adds	r7, #20
     eae:	46bd      	mov	sp, r7
     eb0:	f85d 7b04 	ldr.w	r7, [sp], #4
     eb4:	4770      	bx	lr
     eb6:	bf00      	nop
     eb8:	00003400 	.word	0x00003400
     ebc:	00003480 	.word	0x00003480
     ec0:	20002700 	.word	0x20002700

00000ec4 <main>:

extern void print_fault(const char *msg, sfrp_t adr);
const char PROMPT[]=" OK\n";


void main(void){
     ec4:	b580      	push	{r7, lr}
     ec6:	b082      	sub	sp, #8
     ec8:	af00      	add	r7, sp, #0
	set_sysclock();
     eca:	f7ff fc25 	bl	718 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     ece:	f06f 000a 	mvn.w	r0, #10
     ed2:	210f      	movs	r1, #15
     ed4:	f001 f9fe 	bl	22d4 <set_int_priority>
	config_systicks();
     ed8:	f001 fb88 	bl	25ec <config_systicks>
	flash_enable();
     edc:	f000 fac4 	bl	1468 <flash_enable>
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
     ee0:	4b21      	ldr	r3, [pc, #132]	; (f68 <main+0xa4>)
     ee2:	221d      	movs	r2, #29
     ee4:	619a      	str	r2, [r3, #24]
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
     ee6:	4b20      	ldr	r3, [pc, #128]	; (f68 <main+0xa4>)
     ee8:	f44f 4280 	mov.w	r2, #16384	; 0x4000
     eec:	61da      	str	r2, [r3, #28]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     eee:	4a1e      	ldr	r2, [pc, #120]	; (f68 <main+0xa4>)
     ef0:	4b1d      	ldr	r3, [pc, #116]	; (f68 <main+0xa4>)
     ef2:	695b      	ldr	r3, [r3, #20]
     ef4:	f043 0301 	orr.w	r3, r3, #1
     ef8:	6153      	str	r3, [r2, #20]
	config_pin(LED_PORT,LED_PIN,OUTPUT_OD_SLOW);
     efa:	481c      	ldr	r0, [pc, #112]	; (f6c <main+0xa8>)
     efc:	210d      	movs	r1, #13
     efe:	2206      	movs	r2, #6
     f00:	f000 fdb4 	bl	1a6c <config_pin>
	console_init();
     f04:	f000 f862 	bl	fcc <console_init>
	cls();
     f08:	f000 f900 	bl	110c <cls>
	keyboard_init();
     f0c:	f000 fe28 	bl	1b60 <keyboard_init>
	tvout_init();
     f10:	f001 fbb8 	bl	2684 <tvout_init>
	print(VERSION);
     f14:	4b16      	ldr	r3, [pc, #88]	; (f70 <main+0xac>)
     f16:	681b      	ldr	r3, [r3, #0]
     f18:	4618      	mov	r0, r3
     f1a:	f000 f8c7 	bl	10ac <print>
	copy_blink_in_ram();
     f1e:	f7ff ffaf 	bl	e80 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
     f22:	4814      	ldr	r0, [pc, #80]	; (f74 <main+0xb0>)
     f24:	f000 f8c2 	bl	10ac <print>
     f28:	4b13      	ldr	r3, [pc, #76]	; (f78 <main+0xb4>)
     f2a:	2200      	movs	r2, #0
     f2c:	4618      	mov	r0, r3
     f2e:	4611      	mov	r1, r2
     f30:	df0a      	svc	10
     f32:	200d      	movs	r0, #13
     f34:	f000 f888 	bl	1048 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     f38:	2300      	movs	r3, #0
     f3a:	2200      	movs	r2, #0
     f3c:	4618      	mov	r0, r3
     f3e:	4611      	mov	r1, r2
     f40:	df01      	svc	1
	flush_rx_queue();
     f42:	f000 fa83 	bl	144c <flush_rx_queue>
	
	char c;
	//gdi_clear_screen();
	gdi_print(VERSION);
     f46:	4b0a      	ldr	r3, [pc, #40]	; (f70 <main+0xac>)
     f48:	681b      	ldr	r3, [r3, #0]
     f4a:	4618      	mov	r0, r3
     f4c:	f000 fd7a 	bl	1a44 <gdi_print>
	gdi_print(PROMPT);
     f50:	480a      	ldr	r0, [pc, #40]	; (f7c <main+0xb8>)
     f52:	f000 fd77 	bl	1a44 <gdi_print>
		}
	 }
*/	 
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
     f56:	480a      	ldr	r0, [pc, #40]	; (f80 <main+0xbc>)
     f58:	2150      	movs	r1, #80	; 0x50
     f5a:	f000 f8fd 	bl	1158 <read_line>
     f5e:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     f60:	6878      	ldr	r0, [r7, #4]
     f62:	f7ff ff59 	bl	e18 <parse_line>
	}
     f66:	e7f6      	b.n	f56 <main+0x92>
     f68:	40021000 	.word	0x40021000
     f6c:	40011000 	.word	0x40011000
     f70:	20000000 	.word	0x20000000
     f74:	00002dd4 	.word	0x00002dd4
     f78:	20000134 	.word	0x20000134
     f7c:	00002dcc 	.word	0x00002dcc
     f80:	20000008 	.word	0x20000008

00000f84 <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void CON_handler(){
     f84:	b480      	push	{r7}
     f86:	af00      	add	r7, sp, #0
	if (CON->SR&USART_SR_RXNE){
     f88:	4b0e      	ldr	r3, [pc, #56]	; (fc4 <USART2_handler+0x40>)
     f8a:	681b      	ldr	r3, [r3, #0]
     f8c:	f003 0320 	and.w	r3, r3, #32
     f90:	2b00      	cmp	r3, #0
     f92:	d012      	beq.n	fba <USART2_handler+0x36>
		rx_queue.queue[rx_queue.head++]=CON->DR&0x7f;
     f94:	4b0c      	ldr	r3, [pc, #48]	; (fc8 <USART2_handler+0x44>)
     f96:	6a1b      	ldr	r3, [r3, #32]
     f98:	1c5a      	adds	r2, r3, #1
     f9a:	490b      	ldr	r1, [pc, #44]	; (fc8 <USART2_handler+0x44>)
     f9c:	620a      	str	r2, [r1, #32]
     f9e:	4a09      	ldr	r2, [pc, #36]	; (fc4 <USART2_handler+0x40>)
     fa0:	6852      	ldr	r2, [r2, #4]
     fa2:	b2d2      	uxtb	r2, r2
     fa4:	f002 027f 	and.w	r2, r2, #127	; 0x7f
     fa8:	b2d1      	uxtb	r1, r2
     faa:	4a07      	ldr	r2, [pc, #28]	; (fc8 <USART2_handler+0x44>)
     fac:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
     fae:	4b06      	ldr	r3, [pc, #24]	; (fc8 <USART2_handler+0x44>)
     fb0:	6a1b      	ldr	r3, [r3, #32]
     fb2:	f003 031f 	and.w	r3, r3, #31
     fb6:	4a04      	ldr	r2, [pc, #16]	; (fc8 <USART2_handler+0x44>)
     fb8:	6213      	str	r3, [r2, #32]
	}
}
     fba:	46bd      	mov	sp, r7
     fbc:	f85d 7b04 	ldr.w	r7, [sp], #4
     fc0:	4770      	bx	lr
     fc2:	bf00      	nop
     fc4:	40004400 	.word	0x40004400
     fc8:	200000ac 	.word	0x200000ac

00000fcc <console_init>:

void console_init(){
     fcc:	b580      	push	{r7, lr}
     fce:	af00      	add	r7, sp, #0
	// activation clock USART2
	RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
     fd0:	4a1a      	ldr	r2, [pc, #104]	; (103c <console_init+0x70>)
     fd2:	4b1a      	ldr	r3, [pc, #104]	; (103c <console_init+0x70>)
     fd4:	69db      	ldr	r3, [r3, #28]
     fd6:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
     fda:	61d3      	str	r3, [r2, #28]
	//configure USART pins
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
     fdc:	4a17      	ldr	r2, [pc, #92]	; (103c <console_init+0x70>)
     fde:	4b17      	ldr	r3, [pc, #92]	; (103c <console_init+0x70>)
     fe0:	699b      	ldr	r3, [r3, #24]
     fe2:	f043 0304 	orr.w	r3, r3, #4
     fe6:	6193      	str	r3, [r2, #24]
	// PA0 -> CTS input   (floating)
	// PA1 -> RTS output  (push-pull)
	// PA2 -> TX  output (push-pull)
	// PA3 -> RX input (floating)
	usart_set_baud(CON,115200);
     fe8:	4815      	ldr	r0, [pc, #84]	; (1040 <console_init+0x74>)
     fea:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     fee:	f001 fccf 	bl	2990 <usart_set_baud>
	CON_PORT->CR[0]&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
     ff2:	4a14      	ldr	r2, [pc, #80]	; (1044 <console_init+0x78>)
     ff4:	4b13      	ldr	r3, [pc, #76]	; (1044 <console_init+0x78>)
     ff6:	681b      	ldr	r3, [r3, #0]
     ff8:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
     ffc:	6013      	str	r3, [r2, #0]
	CON_PORT->CR[0]|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
     ffe:	4a11      	ldr	r2, [pc, #68]	; (1044 <console_init+0x78>)
    1000:	4b10      	ldr	r3, [pc, #64]	; (1044 <console_init+0x78>)
    1002:	681b      	ldr	r3, [r3, #0]
    1004:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    1008:	6013      	str	r3, [r2, #0]
	CON->CR1|=USART_CR1_TE|USART_CR1_RE|USART_CR1_RXNEIE;
    100a:	4a0d      	ldr	r2, [pc, #52]	; (1040 <console_init+0x74>)
    100c:	4b0c      	ldr	r3, [pc, #48]	; (1040 <console_init+0x74>)
    100e:	68db      	ldr	r3, [r3, #12]
    1010:	f043 032c 	orr.w	r3, r3, #44	; 0x2c
    1014:	60d3      	str	r3, [r2, #12]
	CON->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    1016:	4b0a      	ldr	r3, [pc, #40]	; (1040 <console_init+0x74>)
    1018:	f44f 7240 	mov.w	r2, #768	; 0x300
    101c:	615a      	str	r2, [r3, #20]
	set_int_priority(IRQ_CON,7);
    101e:	2026      	movs	r0, #38	; 0x26
    1020:	2107      	movs	r1, #7
    1022:	f001 f957 	bl	22d4 <set_int_priority>
	enable_interrupt(IRQ_CON);
    1026:	2026      	movs	r0, #38	; 0x26
    1028:	f001 f888 	bl	213c <enable_interrupt>
	CON->CR1|=USART_CR1_UE;
    102c:	4a04      	ldr	r2, [pc, #16]	; (1040 <console_init+0x74>)
    102e:	4b04      	ldr	r3, [pc, #16]	; (1040 <console_init+0x74>)
    1030:	68db      	ldr	r3, [r3, #12]
    1032:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
    1036:	60d3      	str	r3, [r2, #12]
}
    1038:	bd80      	pop	{r7, pc}
    103a:	bf00      	nop
    103c:	40021000 	.word	0x40021000
    1040:	40004400 	.word	0x40004400
    1044:	40010800 	.word	0x40010800

00001048 <conout>:

// envoie d'un caractère à la console
void conout(char c){
    1048:	b580      	push	{r7, lr}
    104a:	b082      	sub	sp, #8
    104c:	af00      	add	r7, sp, #0
    104e:	4603      	mov	r3, r0
    1050:	71fb      	strb	r3, [r7, #7]
	usart_putc(CON,c);
    1052:	79fb      	ldrb	r3, [r7, #7]
    1054:	4803      	ldr	r0, [pc, #12]	; (1064 <conout+0x1c>)
    1056:	4619      	mov	r1, r3
    1058:	f001 fde6 	bl	2c28 <usart_putc>
}
    105c:	3708      	adds	r7, #8
    105e:	46bd      	mov	sp, r7
    1060:	bd80      	pop	{r7, pc}
    1062:	bf00      	nop
    1064:	40004400 	.word	0x40004400

00001068 <conin>:


// réception d'un caractère de la console
char conin(){
    1068:	b480      	push	{r7}
    106a:	b083      	sub	sp, #12
    106c:	af00      	add	r7, sp, #0
	char c=0;
    106e:	2300      	movs	r3, #0
    1070:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
    1072:	4b0d      	ldr	r3, [pc, #52]	; (10a8 <conin+0x40>)
    1074:	6a1a      	ldr	r2, [r3, #32]
    1076:	4b0c      	ldr	r3, [pc, #48]	; (10a8 <conin+0x40>)
    1078:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    107a:	429a      	cmp	r2, r3
    107c:	d00d      	beq.n	109a <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
    107e:	4b0a      	ldr	r3, [pc, #40]	; (10a8 <conin+0x40>)
    1080:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1082:	1c5a      	adds	r2, r3, #1
    1084:	4908      	ldr	r1, [pc, #32]	; (10a8 <conin+0x40>)
    1086:	624a      	str	r2, [r1, #36]	; 0x24
    1088:	4a07      	ldr	r2, [pc, #28]	; (10a8 <conin+0x40>)
    108a:	5cd3      	ldrb	r3, [r2, r3]
    108c:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
    108e:	4b06      	ldr	r3, [pc, #24]	; (10a8 <conin+0x40>)
    1090:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1092:	f003 031f 	and.w	r3, r3, #31
    1096:	4a04      	ldr	r2, [pc, #16]	; (10a8 <conin+0x40>)
    1098:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
    109a:	79fb      	ldrb	r3, [r7, #7]
}
    109c:	4618      	mov	r0, r3
    109e:	370c      	adds	r7, #12
    10a0:	46bd      	mov	sp, r7
    10a2:	f85d 7b04 	ldr.w	r7, [sp], #4
    10a6:	4770      	bx	lr
    10a8:	200000ac 	.word	0x200000ac

000010ac <print>:

// imprime un chaîne sur la console
void print(const char *str){
    10ac:	b580      	push	{r7, lr}
    10ae:	b082      	sub	sp, #8
    10b0:	af00      	add	r7, sp, #0
    10b2:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
    10b4:	e006      	b.n	10c4 <print+0x18>
    10b6:	687b      	ldr	r3, [r7, #4]
    10b8:	1c5a      	adds	r2, r3, #1
    10ba:	607a      	str	r2, [r7, #4]
    10bc:	781b      	ldrb	r3, [r3, #0]
    10be:	4618      	mov	r0, r3
    10c0:	f7ff ffc2 	bl	1048 <conout>
    10c4:	687b      	ldr	r3, [r7, #4]
    10c6:	781b      	ldrb	r3, [r3, #0]
    10c8:	2b00      	cmp	r3, #0
    10ca:	d1f4      	bne.n	10b6 <print+0xa>
}
    10cc:	3708      	adds	r7, #8
    10ce:	46bd      	mov	sp, r7
    10d0:	bd80      	pop	{r7, pc}
    10d2:	bf00      	nop

000010d4 <beep>:

void beep(){
    10d4:	b480      	push	{r7}
    10d6:	af00      	add	r7, sp, #0
}
    10d8:	46bd      	mov	sp, r7
    10da:	f85d 7b04 	ldr.w	r7, [sp], #4
    10de:	4770      	bx	lr

000010e0 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    10e0:	b580      	push	{r7, lr}
    10e2:	af00      	add	r7, sp, #0
	conout(BS);
    10e4:	2008      	movs	r0, #8
    10e6:	f7ff ffaf 	bl	1048 <conout>
	conout(SPACE);
    10ea:	2020      	movs	r0, #32
    10ec:	f7ff ffac 	bl	1048 <conout>
	conout(BS);
    10f0:	2008      	movs	r0, #8
    10f2:	f7ff ffa9 	bl	1048 <conout>
}
    10f6:	bd80      	pop	{r7, pc}

000010f8 <esc_seq>:

void esc_seq(){
    10f8:	b580      	push	{r7, lr}
    10fa:	af00      	add	r7, sp, #0
	conout(ESC);
    10fc:	201b      	movs	r0, #27
    10fe:	f7ff ffa3 	bl	1048 <conout>
	conout('[');
    1102:	205b      	movs	r0, #91	; 0x5b
    1104:	f7ff ffa0 	bl	1048 <conout>
}
    1108:	bd80      	pop	{r7, pc}
    110a:	bf00      	nop

0000110c <cls>:

// vide l'écran de la console
void cls(){
    110c:	b580      	push	{r7, lr}
    110e:	af00      	add	r7, sp, #0
	esc_seq();
    1110:	f7ff fff2 	bl	10f8 <esc_seq>
	conout('2');
    1114:	2032      	movs	r0, #50	; 0x32
    1116:	f7ff ff97 	bl	1048 <conout>
	conout('J');
    111a:	204a      	movs	r0, #74	; 0x4a
    111c:	f7ff ff94 	bl	1048 <conout>
}
    1120:	bd80      	pop	{r7, pc}
    1122:	bf00      	nop

00001124 <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
    1124:	b580      	push	{r7, lr}
    1126:	b082      	sub	sp, #8
    1128:	af00      	add	r7, sp, #0
    112a:	6078      	str	r0, [r7, #4]
	esc_seq();
    112c:	f7ff ffe4 	bl	10f8 <esc_seq>
	conout('2');
    1130:	2032      	movs	r0, #50	; 0x32
    1132:	f7ff ff89 	bl	1048 <conout>
	conout('K');
    1136:	204b      	movs	r0, #75	; 0x4b
    1138:	f7ff ff86 	bl	1048 <conout>
	while (n){conout(BS);n--;}
    113c:	e005      	b.n	114a <clear_line+0x26>
    113e:	2008      	movs	r0, #8
    1140:	f7ff ff82 	bl	1048 <conout>
    1144:	687b      	ldr	r3, [r7, #4]
    1146:	3b01      	subs	r3, #1
    1148:	607b      	str	r3, [r7, #4]
    114a:	687b      	ldr	r3, [r7, #4]
    114c:	2b00      	cmp	r3, #0
    114e:	d1f6      	bne.n	113e <clear_line+0x1a>
}
    1150:	3708      	adds	r7, #8
    1152:	46bd      	mov	sp, r7
    1154:	bd80      	pop	{r7, pc}
    1156:	bf00      	nop

00001158 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    1158:	b580      	push	{r7, lr}
    115a:	b084      	sub	sp, #16
    115c:	af00      	add	r7, sp, #0
    115e:	6078      	str	r0, [r7, #4]
    1160:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    1162:	2300      	movs	r3, #0
    1164:	60fb      	str	r3, [r7, #12]
	char c=0;
    1166:	2300      	movs	r3, #0
    1168:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    116a:	683b      	ldr	r3, [r7, #0]
    116c:	3b01      	subs	r3, #1
    116e:	603b      	str	r3, [r7, #0]
	while (c!=13){
    1170:	e08e      	b.n	1290 <read_line+0x138>
			c=conin();
    1172:	f7ff ff79 	bl	1068 <conin>
    1176:	4603      	mov	r3, r0
    1178:	72fb      	strb	r3, [r7, #11]
			switch(c){
    117a:	7afb      	ldrb	r3, [r7, #11]
    117c:	2b18      	cmp	r3, #24
    117e:	d872      	bhi.n	1266 <read_line+0x10e>
    1180:	a201      	add	r2, pc, #4	; (adr r2, 1188 <read_line+0x30>)
    1182:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1186:	bf00      	nop
    1188:	00001291 	.word	0x00001291
    118c:	00001267 	.word	0x00001267
    1190:	00001267 	.word	0x00001267
    1194:	00001267 	.word	0x00001267
    1198:	00001267 	.word	0x00001267
    119c:	00001259 	.word	0x00001259
    11a0:	00001267 	.word	0x00001267
    11a4:	00001267 	.word	0x00001267
    11a8:	00001247 	.word	0x00001247
    11ac:	00001263 	.word	0x00001263
    11b0:	000011ed 	.word	0x000011ed
    11b4:	00001267 	.word	0x00001267
    11b8:	00001267 	.word	0x00001267
    11bc:	000011ed 	.word	0x000011ed
    11c0:	00001267 	.word	0x00001267
    11c4:	00001267 	.word	0x00001267
    11c8:	00001267 	.word	0x00001267
    11cc:	00001267 	.word	0x00001267
    11d0:	00001267 	.word	0x00001267
    11d4:	00001267 	.word	0x00001267
    11d8:	00001267 	.word	0x00001267
    11dc:	000011fb 	.word	0x000011fb
    11e0:	00001267 	.word	0x00001267
    11e4:	00001211 	.word	0x00001211
    11e8:	000011fb 	.word	0x000011fb
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    11ec:	230d      	movs	r3, #13
    11ee:	72fb      	strb	r3, [r7, #11]
				conout(c);
    11f0:	7afb      	ldrb	r3, [r7, #11]
    11f2:	4618      	mov	r0, r3
    11f4:	f7ff ff28 	bl	1048 <conout>
				break;
    11f8:	e04a      	b.n	1290 <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
    11fa:	68f8      	ldr	r0, [r7, #12]
    11fc:	f7ff ff92 	bl	1124 <clear_line>
				line_len=0;
    1200:	2300      	movs	r3, #0
    1202:	60fb      	str	r3, [r7, #12]
				break;
    1204:	e044      	b.n	1290 <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    1206:	f7ff ff6b 	bl	10e0 <delete_back>
					line_len--;
    120a:	68fb      	ldr	r3, [r7, #12]
    120c:	3b01      	subs	r3, #1
    120e:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    1210:	68fb      	ldr	r3, [r7, #12]
    1212:	2b00      	cmp	r3, #0
    1214:	d006      	beq.n	1224 <read_line+0xcc>
    1216:	68fb      	ldr	r3, [r7, #12]
    1218:	3b01      	subs	r3, #1
    121a:	687a      	ldr	r2, [r7, #4]
    121c:	4413      	add	r3, r2
    121e:	781b      	ldrb	r3, [r3, #0]
    1220:	2b20      	cmp	r3, #32
    1222:	d0f0      	beq.n	1206 <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1224:	e004      	b.n	1230 <read_line+0xd8>
					delete_back();
    1226:	f7ff ff5b 	bl	10e0 <delete_back>
					line_len--;
    122a:	68fb      	ldr	r3, [r7, #12]
    122c:	3b01      	subs	r3, #1
    122e:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1230:	68fb      	ldr	r3, [r7, #12]
    1232:	2b00      	cmp	r3, #0
    1234:	d006      	beq.n	1244 <read_line+0xec>
    1236:	68fb      	ldr	r3, [r7, #12]
    1238:	3b01      	subs	r3, #1
    123a:	687a      	ldr	r2, [r7, #4]
    123c:	4413      	add	r3, r2
    123e:	781b      	ldrb	r3, [r3, #0]
    1240:	2b20      	cmp	r3, #32
    1242:	d1f0      	bne.n	1226 <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    1244:	e024      	b.n	1290 <read_line+0x138>
				case BS:
				if (line_len){
    1246:	68fb      	ldr	r3, [r7, #12]
    1248:	2b00      	cmp	r3, #0
    124a:	d004      	beq.n	1256 <read_line+0xfe>
					delete_back();
    124c:	f7ff ff48 	bl	10e0 <delete_back>
					line_len--;
    1250:	68fb      	ldr	r3, [r7, #12]
    1252:	3b01      	subs	r3, #1
    1254:	60fb      	str	r3, [r7, #12]
				}
				break;
    1256:	e01b      	b.n	1290 <read_line+0x138>
				case CTRL_E:
				cls();
    1258:	f7ff ff58 	bl	110c <cls>
				line_len=0;
    125c:	2300      	movs	r3, #0
    125e:	60fb      	str	r3, [r7, #12]
				break;
    1260:	e016      	b.n	1290 <read_line+0x138>
				case TAB:
				c=SPACE;
    1262:	2320      	movs	r3, #32
    1264:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    1266:	68fa      	ldr	r2, [r7, #12]
    1268:	683b      	ldr	r3, [r7, #0]
    126a:	429a      	cmp	r2, r3
    126c:	d20e      	bcs.n	128c <read_line+0x134>
    126e:	7afb      	ldrb	r3, [r7, #11]
    1270:	2b1f      	cmp	r3, #31
    1272:	d90b      	bls.n	128c <read_line+0x134>
					buffer[line_len++]=c;
    1274:	68fb      	ldr	r3, [r7, #12]
    1276:	1c5a      	adds	r2, r3, #1
    1278:	60fa      	str	r2, [r7, #12]
    127a:	687a      	ldr	r2, [r7, #4]
    127c:	4413      	add	r3, r2
    127e:	7afa      	ldrb	r2, [r7, #11]
    1280:	701a      	strb	r2, [r3, #0]
					conout(c);
    1282:	7afb      	ldrb	r3, [r7, #11]
    1284:	4618      	mov	r0, r3
    1286:	f7ff fedf 	bl	1048 <conout>
    128a:	e001      	b.n	1290 <read_line+0x138>
				}else{
					beep();
    128c:	f7ff ff22 	bl	10d4 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    1290:	7afb      	ldrb	r3, [r7, #11]
    1292:	2b0d      	cmp	r3, #13
    1294:	f47f af6d 	bne.w	1172 <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1298:	687a      	ldr	r2, [r7, #4]
    129a:	68fb      	ldr	r3, [r7, #12]
    129c:	4413      	add	r3, r2
    129e:	2200      	movs	r2, #0
    12a0:	701a      	strb	r2, [r3, #0]
	return line_len;
    12a2:	68fb      	ldr	r3, [r7, #12]
}
    12a4:	4618      	mov	r0, r3
    12a6:	3710      	adds	r7, #16
    12a8:	46bd      	mov	sp, r7
    12aa:	bd80      	pop	{r7, pc}

000012ac <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    12ac:	b580      	push	{r7, lr}
    12ae:	b08e      	sub	sp, #56	; 0x38
    12b0:	af00      	add	r7, sp, #0
    12b2:	6078      	str	r0, [r7, #4]
    12b4:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    12b6:	2301      	movs	r3, #1
    12b8:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    12ba:	2322      	movs	r3, #34	; 0x22
    12bc:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    12be:	2300      	movs	r3, #0
    12c0:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    12c4:	687b      	ldr	r3, [r7, #4]
    12c6:	2b00      	cmp	r3, #0
    12c8:	da05      	bge.n	12d6 <print_int+0x2a>
    12ca:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    12ce:	637b      	str	r3, [r7, #52]	; 0x34
    12d0:	687b      	ldr	r3, [r7, #4]
    12d2:	425b      	negs	r3, r3
    12d4:	607b      	str	r3, [r7, #4]
	while (i){
    12d6:	e02c      	b.n	1332 <print_int+0x86>
		fmt[pos]=i%base+'0';
    12d8:	687b      	ldr	r3, [r7, #4]
    12da:	683a      	ldr	r2, [r7, #0]
    12dc:	fbb3 f2f2 	udiv	r2, r3, r2
    12e0:	6839      	ldr	r1, [r7, #0]
    12e2:	fb01 f202 	mul.w	r2, r1, r2
    12e6:	1a9b      	subs	r3, r3, r2
    12e8:	b2db      	uxtb	r3, r3
    12ea:	3330      	adds	r3, #48	; 0x30
    12ec:	b2d9      	uxtb	r1, r3
    12ee:	f107 020c 	add.w	r2, r7, #12
    12f2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    12f4:	4413      	add	r3, r2
    12f6:	460a      	mov	r2, r1
    12f8:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    12fa:	f107 020c 	add.w	r2, r7, #12
    12fe:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1300:	4413      	add	r3, r2
    1302:	781b      	ldrb	r3, [r3, #0]
    1304:	2b39      	cmp	r3, #57	; 0x39
    1306:	d90c      	bls.n	1322 <print_int+0x76>
    1308:	f107 020c 	add.w	r2, r7, #12
    130c:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    130e:	4413      	add	r3, r2
    1310:	781b      	ldrb	r3, [r3, #0]
    1312:	3307      	adds	r3, #7
    1314:	b2d9      	uxtb	r1, r3
    1316:	f107 020c 	add.w	r2, r7, #12
    131a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    131c:	4413      	add	r3, r2
    131e:	460a      	mov	r2, r1
    1320:	701a      	strb	r2, [r3, #0]
		pos--;
    1322:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1324:	3b01      	subs	r3, #1
    1326:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    1328:	687a      	ldr	r2, [r7, #4]
    132a:	683b      	ldr	r3, [r7, #0]
    132c:	fbb2 f3f3 	udiv	r3, r2, r3
    1330:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    1332:	687b      	ldr	r3, [r7, #4]
    1334:	2b00      	cmp	r3, #0
    1336:	d1cf      	bne.n	12d8 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    1338:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    133a:	2b22      	cmp	r3, #34	; 0x22
    133c:	d108      	bne.n	1350 <print_int+0xa4>
    133e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1340:	1e5a      	subs	r2, r3, #1
    1342:	633a      	str	r2, [r7, #48]	; 0x30
    1344:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1348:	4413      	add	r3, r2
    134a:	2230      	movs	r2, #48	; 0x30
    134c:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    1350:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    1352:	2b00      	cmp	r3, #0
    1354:	da08      	bge.n	1368 <print_int+0xbc>
    1356:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1358:	1e5a      	subs	r2, r3, #1
    135a:	633a      	str	r2, [r7, #48]	; 0x30
    135c:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1360:	4413      	add	r3, r2
    1362:	222d      	movs	r2, #45	; 0x2d
    1364:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    1368:	f107 020c 	add.w	r2, r7, #12
    136c:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    136e:	4413      	add	r3, r2
    1370:	2220      	movs	r2, #32
    1372:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1374:	f107 020c 	add.w	r2, r7, #12
    1378:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    137a:	4413      	add	r3, r2
    137c:	4618      	mov	r0, r3
    137e:	f7ff fe95 	bl	10ac <print>
}
    1382:	3738      	adds	r7, #56	; 0x38
    1384:	46bd      	mov	sp, r7
    1386:	bd80      	pop	{r7, pc}

00001388 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    1388:	b580      	push	{r7, lr}
    138a:	b088      	sub	sp, #32
    138c:	af00      	add	r7, sp, #0
    138e:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    1390:	230c      	movs	r3, #12
    1392:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    1394:	2300      	movs	r3, #0
    1396:	767b      	strb	r3, [r7, #25]
	while (u){
    1398:	e026      	b.n	13e8 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    139a:	687b      	ldr	r3, [r7, #4]
    139c:	b2db      	uxtb	r3, r3
    139e:	f003 030f 	and.w	r3, r3, #15
    13a2:	b2db      	uxtb	r3, r3
    13a4:	3330      	adds	r3, #48	; 0x30
    13a6:	b2d9      	uxtb	r1, r3
    13a8:	f107 020c 	add.w	r2, r7, #12
    13ac:	69fb      	ldr	r3, [r7, #28]
    13ae:	4413      	add	r3, r2
    13b0:	460a      	mov	r2, r1
    13b2:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    13b4:	f107 020c 	add.w	r2, r7, #12
    13b8:	69fb      	ldr	r3, [r7, #28]
    13ba:	4413      	add	r3, r2
    13bc:	781b      	ldrb	r3, [r3, #0]
    13be:	2b39      	cmp	r3, #57	; 0x39
    13c0:	d90c      	bls.n	13dc <print_hex+0x54>
    13c2:	f107 020c 	add.w	r2, r7, #12
    13c6:	69fb      	ldr	r3, [r7, #28]
    13c8:	4413      	add	r3, r2
    13ca:	781b      	ldrb	r3, [r3, #0]
    13cc:	3307      	adds	r3, #7
    13ce:	b2d9      	uxtb	r1, r3
    13d0:	f107 020c 	add.w	r2, r7, #12
    13d4:	69fb      	ldr	r3, [r7, #28]
    13d6:	4413      	add	r3, r2
    13d8:	460a      	mov	r2, r1
    13da:	701a      	strb	r2, [r3, #0]
		pos--;
    13dc:	69fb      	ldr	r3, [r7, #28]
    13de:	3b01      	subs	r3, #1
    13e0:	61fb      	str	r3, [r7, #28]
		u/=16;
    13e2:	687b      	ldr	r3, [r7, #4]
    13e4:	091b      	lsrs	r3, r3, #4
    13e6:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    13e8:	687b      	ldr	r3, [r7, #4]
    13ea:	2b00      	cmp	r3, #0
    13ec:	d1d5      	bne.n	139a <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    13ee:	69fb      	ldr	r3, [r7, #28]
    13f0:	2b0c      	cmp	r3, #12
    13f2:	d108      	bne.n	1406 <print_hex+0x7e>
    13f4:	69fb      	ldr	r3, [r7, #28]
    13f6:	1e5a      	subs	r2, r3, #1
    13f8:	61fa      	str	r2, [r7, #28]
    13fa:	f107 0220 	add.w	r2, r7, #32
    13fe:	4413      	add	r3, r2
    1400:	2230      	movs	r2, #48	; 0x30
    1402:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    1406:	69fb      	ldr	r3, [r7, #28]
    1408:	1e5a      	subs	r2, r3, #1
    140a:	61fa      	str	r2, [r7, #28]
    140c:	f107 0220 	add.w	r2, r7, #32
    1410:	4413      	add	r3, r2
    1412:	2278      	movs	r2, #120	; 0x78
    1414:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    1418:	69fb      	ldr	r3, [r7, #28]
    141a:	1e5a      	subs	r2, r3, #1
    141c:	61fa      	str	r2, [r7, #28]
    141e:	f107 0220 	add.w	r2, r7, #32
    1422:	4413      	add	r3, r2
    1424:	2230      	movs	r2, #48	; 0x30
    1426:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    142a:	f107 020c 	add.w	r2, r7, #12
    142e:	69fb      	ldr	r3, [r7, #28]
    1430:	4413      	add	r3, r2
    1432:	2220      	movs	r2, #32
    1434:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1436:	f107 020c 	add.w	r2, r7, #12
    143a:	69fb      	ldr	r3, [r7, #28]
    143c:	4413      	add	r3, r2
    143e:	4618      	mov	r0, r3
    1440:	f7ff fe34 	bl	10ac <print>
}
    1444:	3720      	adds	r7, #32
    1446:	46bd      	mov	sp, r7
    1448:	bd80      	pop	{r7, pc}
    144a:	bf00      	nop

0000144c <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    144c:	b480      	push	{r7}
    144e:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    1450:	4b04      	ldr	r3, [pc, #16]	; (1464 <flush_rx_queue+0x18>)
    1452:	2200      	movs	r2, #0
    1454:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    1456:	4b03      	ldr	r3, [pc, #12]	; (1464 <flush_rx_queue+0x18>)
    1458:	2200      	movs	r2, #0
    145a:	625a      	str	r2, [r3, #36]	; 0x24
}
    145c:	46bd      	mov	sp, r7
    145e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1462:	4770      	bx	lr
    1464:	200000ac 	.word	0x200000ac

00001468 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    1468:	b480      	push	{r7}
    146a:	af00      	add	r7, sp, #0
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
    146c:	4b13      	ldr	r3, [pc, #76]	; (14bc <flash_enable+0x54>)
    146e:	681b      	ldr	r3, [r3, #0]
    1470:	f003 0301 	and.w	r3, r3, #1
    1474:	2b00      	cmp	r3, #0
    1476:	d10c      	bne.n	1492 <flash_enable+0x2a>
		RCC->CR|=RCC_CR_HSION;
    1478:	4a10      	ldr	r2, [pc, #64]	; (14bc <flash_enable+0x54>)
    147a:	4b10      	ldr	r3, [pc, #64]	; (14bc <flash_enable+0x54>)
    147c:	681b      	ldr	r3, [r3, #0]
    147e:	f043 0301 	orr.w	r3, r3, #1
    1482:	6013      	str	r3, [r2, #0]
		while (!(RCC->CR&RCC_CR_HSIRDY));
    1484:	bf00      	nop
    1486:	4b0d      	ldr	r3, [pc, #52]	; (14bc <flash_enable+0x54>)
    1488:	681b      	ldr	r3, [r3, #0]
    148a:	f003 0302 	and.w	r3, r3, #2
    148e:	2b00      	cmp	r3, #0
    1490:	d0f9      	beq.n	1486 <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    1492:	4b0b      	ldr	r3, [pc, #44]	; (14c0 <flash_enable+0x58>)
    1494:	4a0b      	ldr	r2, [pc, #44]	; (14c4 <flash_enable+0x5c>)
    1496:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    1498:	4b09      	ldr	r3, [pc, #36]	; (14c0 <flash_enable+0x58>)
    149a:	4a0b      	ldr	r2, [pc, #44]	; (14c8 <flash_enable+0x60>)
    149c:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    149e:	4b08      	ldr	r3, [pc, #32]	; (14c0 <flash_enable+0x58>)
    14a0:	691b      	ldr	r3, [r3, #16]
    14a2:	f003 0380 	and.w	r3, r3, #128	; 0x80
    14a6:	2b00      	cmp	r3, #0
    14a8:	bf0c      	ite	eq
    14aa:	2301      	moveq	r3, #1
    14ac:	2300      	movne	r3, #0
    14ae:	b2db      	uxtb	r3, r3
}
    14b0:	4618      	mov	r0, r3
    14b2:	46bd      	mov	sp, r7
    14b4:	f85d 7b04 	ldr.w	r7, [sp], #4
    14b8:	4770      	bx	lr
    14ba:	bf00      	nop
    14bc:	40021000 	.word	0x40021000
    14c0:	40022000 	.word	0x40022000
    14c4:	45670123 	.word	0x45670123
    14c8:	cdef89ab 	.word	0xcdef89ab

000014cc <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    14cc:	b480      	push	{r7}
    14ce:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    14d0:	4a04      	ldr	r2, [pc, #16]	; (14e4 <flash_disable+0x18>)
    14d2:	4b04      	ldr	r3, [pc, #16]	; (14e4 <flash_disable+0x18>)
    14d4:	691b      	ldr	r3, [r3, #16]
    14d6:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    14da:	6113      	str	r3, [r2, #16]
}
    14dc:	46bd      	mov	sp, r7
    14de:	f85d 7b04 	ldr.w	r7, [sp], #4
    14e2:	4770      	bx	lr
    14e4:	40022000 	.word	0x40022000

000014e8 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    14e8:	b480      	push	{r7}
    14ea:	b083      	sub	sp, #12
    14ec:	af00      	add	r7, sp, #0
    14ee:	6078      	str	r0, [r7, #4]
    14f0:	460b      	mov	r3, r1
    14f2:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    14f4:	4b1d      	ldr	r3, [pc, #116]	; (156c <flash_write+0x84>)
    14f6:	691b      	ldr	r3, [r3, #16]
    14f8:	f003 0380 	and.w	r3, r3, #128	; 0x80
    14fc:	2b00      	cmp	r3, #0
    14fe:	d105      	bne.n	150c <flash_write+0x24>
    1500:	687b      	ldr	r3, [r7, #4]
    1502:	881b      	ldrh	r3, [r3, #0]
    1504:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1508:	4293      	cmp	r3, r2
    150a:	d001      	beq.n	1510 <flash_write+0x28>
    150c:	2300      	movs	r3, #0
    150e:	e027      	b.n	1560 <flash_write+0x78>
	while (_flash_busy);
    1510:	bf00      	nop
    1512:	4b16      	ldr	r3, [pc, #88]	; (156c <flash_write+0x84>)
    1514:	68db      	ldr	r3, [r3, #12]
    1516:	f003 0301 	and.w	r3, r3, #1
    151a:	2b00      	cmp	r3, #0
    151c:	d1f9      	bne.n	1512 <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    151e:	4a13      	ldr	r2, [pc, #76]	; (156c <flash_write+0x84>)
    1520:	4b12      	ldr	r3, [pc, #72]	; (156c <flash_write+0x84>)
    1522:	68db      	ldr	r3, [r3, #12]
    1524:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1528:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    152a:	4b10      	ldr	r3, [pc, #64]	; (156c <flash_write+0x84>)
    152c:	2201      	movs	r2, #1
    152e:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    1530:	687b      	ldr	r3, [r7, #4]
    1532:	887a      	ldrh	r2, [r7, #2]
    1534:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    1536:	bf00      	nop
    1538:	4b0c      	ldr	r3, [pc, #48]	; (156c <flash_write+0x84>)
    153a:	68db      	ldr	r3, [r3, #12]
    153c:	f003 0301 	and.w	r3, r3, #1
    1540:	2b00      	cmp	r3, #0
    1542:	d005      	beq.n	1550 <flash_write+0x68>
    1544:	4b09      	ldr	r3, [pc, #36]	; (156c <flash_write+0x84>)
    1546:	68db      	ldr	r3, [r3, #12]
    1548:	f003 0320 	and.w	r3, r3, #32
    154c:	2b00      	cmp	r3, #0
    154e:	d0f3      	beq.n	1538 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    1550:	687b      	ldr	r3, [r7, #4]
    1552:	881b      	ldrh	r3, [r3, #0]
    1554:	887a      	ldrh	r2, [r7, #2]
    1556:	429a      	cmp	r2, r3
    1558:	bf0c      	ite	eq
    155a:	2301      	moveq	r3, #1
    155c:	2300      	movne	r3, #0
    155e:	b2db      	uxtb	r3, r3
}
    1560:	4618      	mov	r0, r3
    1562:	370c      	adds	r7, #12
    1564:	46bd      	mov	sp, r7
    1566:	f85d 7b04 	ldr.w	r7, [sp], #4
    156a:	4770      	bx	lr
    156c:	40022000 	.word	0x40022000

00001570 <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    1570:	b480      	push	{r7}
    1572:	b087      	sub	sp, #28
    1574:	af00      	add	r7, sp, #0
    1576:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    1578:	4b27      	ldr	r3, [pc, #156]	; (1618 <flash_erase_page+0xa8>)
    157a:	691b      	ldr	r3, [r3, #16]
    157c:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1580:	2b00      	cmp	r3, #0
    1582:	d001      	beq.n	1588 <flash_erase_page+0x18>
    1584:	2300      	movs	r3, #0
    1586:	e040      	b.n	160a <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1588:	4a23      	ldr	r2, [pc, #140]	; (1618 <flash_erase_page+0xa8>)
    158a:	4b23      	ldr	r3, [pc, #140]	; (1618 <flash_erase_page+0xa8>)
    158c:	68db      	ldr	r3, [r3, #12]
    158e:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1592:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    1594:	687b      	ldr	r3, [r7, #4]
    1596:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    159a:	f023 0303 	bic.w	r3, r3, #3
    159e:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    15a0:	4b1d      	ldr	r3, [pc, #116]	; (1618 <flash_erase_page+0xa8>)
    15a2:	2202      	movs	r2, #2
    15a4:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    15a6:	4a1c      	ldr	r2, [pc, #112]	; (1618 <flash_erase_page+0xa8>)
    15a8:	687b      	ldr	r3, [r7, #4]
    15aa:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    15ac:	4a1a      	ldr	r2, [pc, #104]	; (1618 <flash_erase_page+0xa8>)
    15ae:	4b1a      	ldr	r3, [pc, #104]	; (1618 <flash_erase_page+0xa8>)
    15b0:	691b      	ldr	r3, [r3, #16]
    15b2:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    15b6:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    15b8:	bf00      	nop
    15ba:	4b17      	ldr	r3, [pc, #92]	; (1618 <flash_erase_page+0xa8>)
    15bc:	68db      	ldr	r3, [r3, #12]
    15be:	f003 0301 	and.w	r3, r3, #1
    15c2:	2b00      	cmp	r3, #0
    15c4:	d005      	beq.n	15d2 <flash_erase_page+0x62>
    15c6:	4b14      	ldr	r3, [pc, #80]	; (1618 <flash_erase_page+0xa8>)
    15c8:	68db      	ldr	r3, [r3, #12]
    15ca:	f003 0320 	and.w	r3, r3, #32
    15ce:	2b00      	cmp	r3, #0
    15d0:	d0f3      	beq.n	15ba <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    15d2:	687b      	ldr	r3, [r7, #4]
    15d4:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    15d6:	2300      	movs	r3, #0
    15d8:	60fb      	str	r3, [r7, #12]
    15da:	e00c      	b.n	15f6 <flash_erase_page+0x86>
		u32=*adr++;
    15dc:	697b      	ldr	r3, [r7, #20]
    15de:	1d1a      	adds	r2, r3, #4
    15e0:	617a      	str	r2, [r7, #20]
    15e2:	681b      	ldr	r3, [r3, #0]
    15e4:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    15e6:	693b      	ldr	r3, [r7, #16]
    15e8:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    15ec:	d000      	beq.n	15f0 <flash_erase_page+0x80>
    15ee:	e005      	b.n	15fc <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    15f0:	68fb      	ldr	r3, [r7, #12]
    15f2:	3301      	adds	r3, #1
    15f4:	60fb      	str	r3, [r7, #12]
    15f6:	68fb      	ldr	r3, [r7, #12]
    15f8:	2bff      	cmp	r3, #255	; 0xff
    15fa:	ddef      	ble.n	15dc <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    15fc:	693b      	ldr	r3, [r7, #16]
    15fe:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1602:	bf0c      	ite	eq
    1604:	2301      	moveq	r3, #1
    1606:	2300      	movne	r3, #0
    1608:	b2db      	uxtb	r3, r3
}
    160a:	4618      	mov	r0, r3
    160c:	371c      	adds	r7, #28
    160e:	46bd      	mov	sp, r7
    1610:	f85d 7b04 	ldr.w	r7, [sp], #4
    1614:	4770      	bx	lr
    1616:	bf00      	nop
    1618:	40022000 	.word	0x40022000

0000161c <gdi_clear_screen>:
#include "gdi.h"

// position  du curseur texte.
static int cursor_x, cursor_y;

void gdi_clear_screen(){
    161c:	b480      	push	{r7}
    161e:	b083      	sub	sp, #12
    1620:	af00      	add	r7, sp, #0
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    1622:	2300      	movs	r3, #0
    1624:	607b      	str	r3, [r7, #4]
    1626:	e006      	b.n	1636 <gdi_clear_screen+0x1a>
		video_buffer[i++]=0;
    1628:	687b      	ldr	r3, [r7, #4]
    162a:	1c5a      	adds	r2, r3, #1
    162c:	607a      	str	r2, [r7, #4]
    162e:	4a06      	ldr	r2, [pc, #24]	; (1648 <gdi_clear_screen+0x2c>)
    1630:	2100      	movs	r1, #0
    1632:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
// position  du curseur texte.
static int cursor_x, cursor_y;

void gdi_clear_screen(){
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    1636:	687b      	ldr	r3, [r7, #4]
    1638:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    163c:	dbf4      	blt.n	1628 <gdi_clear_screen+0xc>
		video_buffer[i++]=0;
	}
}
    163e:	370c      	adds	r7, #12
    1640:	46bd      	mov	sp, r7
    1642:	f85d 7b04 	ldr.w	r7, [sp], #4
    1646:	4770      	bx	lr
    1648:	20000138 	.word	0x20000138

0000164c <gdi_scroll_up>:

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
    164c:	b480      	push	{r7}
    164e:	b083      	sub	sp, #12
    1650:	af00      	add	r7, sp, #0
	int i,j;
	j=0;
    1652:	2300      	movs	r3, #0
    1654:	603b      	str	r3, [r7, #0]
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    1656:	23a0      	movs	r3, #160	; 0xa0
    1658:	607b      	str	r3, [r7, #4]
    165a:	e00b      	b.n	1674 <gdi_scroll_up+0x28>
		video_buffer[j++]=video_buffer[i++];
    165c:	683b      	ldr	r3, [r7, #0]
    165e:	1c5a      	adds	r2, r3, #1
    1660:	603a      	str	r2, [r7, #0]
    1662:	687a      	ldr	r2, [r7, #4]
    1664:	1c51      	adds	r1, r2, #1
    1666:	6079      	str	r1, [r7, #4]
    1668:	490e      	ldr	r1, [pc, #56]	; (16a4 <gdi_scroll_up+0x58>)
    166a:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    166e:	4a0d      	ldr	r2, [pc, #52]	; (16a4 <gdi_scroll_up+0x58>)
    1670:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
	int i,j;
	j=0;
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    1674:	687b      	ldr	r3, [r7, #4]
    1676:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    167a:	dbef      	blt.n	165c <gdi_scroll_up+0x10>
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    167c:	f44f 5391 	mov.w	r3, #4640	; 0x1220
    1680:	607b      	str	r3, [r7, #4]
    1682:	e006      	b.n	1692 <gdi_scroll_up+0x46>
		video_buffer[i++]=0;
    1684:	687b      	ldr	r3, [r7, #4]
    1686:	1c5a      	adds	r2, r3, #1
    1688:	607a      	str	r2, [r7, #4]
    168a:	4a06      	ldr	r2, [pc, #24]	; (16a4 <gdi_scroll_up+0x58>)
    168c:	2100      	movs	r1, #0
    168e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i,j;
	j=0;
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1692:	687b      	ldr	r3, [r7, #4]
    1694:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1698:	dbf4      	blt.n	1684 <gdi_scroll_up+0x38>
		video_buffer[i++]=0;
	}
}
    169a:	370c      	adds	r7, #12
    169c:	46bd      	mov	sp, r7
    169e:	f85d 7b04 	ldr.w	r7, [sp], #4
    16a2:	4770      	bx	lr
    16a4:	20000138 	.word	0x20000138

000016a8 <gdi_new_line>:

// avance le curseur texte au début 
// de la ligne suivante.
void gdi_new_line(){
    16a8:	b580      	push	{r7, lr}
    16aa:	af00      	add	r7, sp, #0
	cursor_x=0;
    16ac:	4b08      	ldr	r3, [pc, #32]	; (16d0 <gdi_new_line+0x28>)
    16ae:	2200      	movs	r2, #0
    16b0:	601a      	str	r2, [r3, #0]
	cursor_y+=CHAR_HEIGHT;
    16b2:	4b08      	ldr	r3, [pc, #32]	; (16d4 <gdi_new_line+0x2c>)
    16b4:	681b      	ldr	r3, [r3, #0]
    16b6:	3308      	adds	r3, #8
    16b8:	4a06      	ldr	r2, [pc, #24]	; (16d4 <gdi_new_line+0x2c>)
    16ba:	6013      	str	r3, [r2, #0]
	if (cursor_y>(VRES-CHAR_HEIGHT)){
    16bc:	4b05      	ldr	r3, [pc, #20]	; (16d4 <gdi_new_line+0x2c>)
    16be:	681b      	ldr	r3, [r3, #0]
    16c0:	2be8      	cmp	r3, #232	; 0xe8
    16c2:	dd04      	ble.n	16ce <gdi_new_line+0x26>
		cursor_y=VRES-CHAR_HEIGHT;
    16c4:	4b03      	ldr	r3, [pc, #12]	; (16d4 <gdi_new_line+0x2c>)
    16c6:	22e8      	movs	r2, #232	; 0xe8
    16c8:	601a      	str	r2, [r3, #0]
		gdi_scroll_up();
    16ca:	f7ff ffbf 	bl	164c <gdi_scroll_up>
	}
}
    16ce:	bd80      	pop	{r7, pc}
    16d0:	200000d4 	.word	0x200000d4
    16d4:	200000d8 	.word	0x200000d8

000016d8 <gdi_cursor_left>:

void gdi_cursor_left(){
    16d8:	b480      	push	{r7}
    16da:	af00      	add	r7, sp, #0
	if (!(cursor_x|cursor_y)) return;
    16dc:	4b14      	ldr	r3, [pc, #80]	; (1730 <gdi_cursor_left+0x58>)
    16de:	681a      	ldr	r2, [r3, #0]
    16e0:	4b14      	ldr	r3, [pc, #80]	; (1734 <gdi_cursor_left+0x5c>)
    16e2:	681b      	ldr	r3, [r3, #0]
    16e4:	4313      	orrs	r3, r2
    16e6:	2b00      	cmp	r3, #0
    16e8:	d100      	bne.n	16ec <gdi_cursor_left+0x14>
    16ea:	e01d      	b.n	1728 <gdi_cursor_left+0x50>
	if (cursor_x>=CHAR_WIDTH){
    16ec:	4b10      	ldr	r3, [pc, #64]	; (1730 <gdi_cursor_left+0x58>)
    16ee:	681b      	ldr	r3, [r3, #0]
    16f0:	2b05      	cmp	r3, #5
    16f2:	dd05      	ble.n	1700 <gdi_cursor_left+0x28>
		cursor_x-=CHAR_WIDTH;
    16f4:	4b0e      	ldr	r3, [pc, #56]	; (1730 <gdi_cursor_left+0x58>)
    16f6:	681b      	ldr	r3, [r3, #0]
    16f8:	3b06      	subs	r3, #6
    16fa:	4a0d      	ldr	r2, [pc, #52]	; (1730 <gdi_cursor_left+0x58>)
    16fc:	6013      	str	r3, [r2, #0]
    16fe:	e013      	b.n	1728 <gdi_cursor_left+0x50>
	}else if (cursor_y) {
    1700:	4b0c      	ldr	r3, [pc, #48]	; (1734 <gdi_cursor_left+0x5c>)
    1702:	681b      	ldr	r3, [r3, #0]
    1704:	2b00      	cmp	r3, #0
    1706:	d00f      	beq.n	1728 <gdi_cursor_left+0x50>
		cursor_x=CHAR_WIDTH*(CHARS_PER_LINE-1);
    1708:	4b09      	ldr	r3, [pc, #36]	; (1730 <gdi_cursor_left+0x58>)
    170a:	f44f 729c 	mov.w	r2, #312	; 0x138
    170e:	601a      	str	r2, [r3, #0]
		cursor_y-=CHAR_HEIGHT;
    1710:	4b08      	ldr	r3, [pc, #32]	; (1734 <gdi_cursor_left+0x5c>)
    1712:	681b      	ldr	r3, [r3, #0]
    1714:	3b08      	subs	r3, #8
    1716:	4a07      	ldr	r2, [pc, #28]	; (1734 <gdi_cursor_left+0x5c>)
    1718:	6013      	str	r3, [r2, #0]
		if (cursor_y<0) cursor_y=0;
    171a:	4b06      	ldr	r3, [pc, #24]	; (1734 <gdi_cursor_left+0x5c>)
    171c:	681b      	ldr	r3, [r3, #0]
    171e:	2b00      	cmp	r3, #0
    1720:	da02      	bge.n	1728 <gdi_cursor_left+0x50>
    1722:	4b04      	ldr	r3, [pc, #16]	; (1734 <gdi_cursor_left+0x5c>)
    1724:	2200      	movs	r2, #0
    1726:	601a      	str	r2, [r3, #0]
	}
}
    1728:	46bd      	mov	sp, r7
    172a:	f85d 7b04 	ldr.w	r7, [sp], #4
    172e:	4770      	bx	lr
    1730:	200000d4 	.word	0x200000d4
    1734:	200000d8 	.word	0x200000d8

00001738 <gdi_bit_op>:


void gdi_bit_op(int x, int y, bitop_e op){
    1738:	b480      	push	{r7}
    173a:	b087      	sub	sp, #28
    173c:	af00      	add	r7, sp, #0
    173e:	60f8      	str	r0, [r7, #12]
    1740:	60b9      	str	r1, [r7, #8]
    1742:	4613      	mov	r3, r2
    1744:	71fb      	strb	r3, [r7, #7]
	uint16_t bit;
	int offset=y*ROW_SIZE+(x>>4);
    1746:	68ba      	ldr	r2, [r7, #8]
    1748:	4613      	mov	r3, r2
    174a:	009b      	lsls	r3, r3, #2
    174c:	4413      	add	r3, r2
    174e:	009b      	lsls	r3, r3, #2
    1750:	461a      	mov	r2, r3
    1752:	68fb      	ldr	r3, [r7, #12]
    1754:	111b      	asrs	r3, r3, #4
    1756:	4413      	add	r3, r2
    1758:	617b      	str	r3, [r7, #20]
	bit=1<<(15-(x&15));
    175a:	68fb      	ldr	r3, [r7, #12]
    175c:	43db      	mvns	r3, r3
    175e:	f003 030f 	and.w	r3, r3, #15
    1762:	2201      	movs	r2, #1
    1764:	fa02 f303 	lsl.w	r3, r2, r3
    1768:	827b      	strh	r3, [r7, #18]
	switch (op){
    176a:	79fb      	ldrb	r3, [r7, #7]
    176c:	2b01      	cmp	r3, #1
    176e:	d013      	beq.n	1798 <gdi_bit_op+0x60>
    1770:	2b02      	cmp	r3, #2
    1772:	d01d      	beq.n	17b0 <gdi_bit_op+0x78>
    1774:	2b00      	cmp	r3, #0
    1776:	d127      	bne.n	17c8 <gdi_bit_op+0x90>
	case BLACK_BIT:
		video_buffer[offset]&=~bit;
    1778:	4a16      	ldr	r2, [pc, #88]	; (17d4 <gdi_bit_op+0x9c>)
    177a:	697b      	ldr	r3, [r7, #20]
    177c:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1780:	b29a      	uxth	r2, r3
    1782:	8a7b      	ldrh	r3, [r7, #18]
    1784:	43db      	mvns	r3, r3
    1786:	b29b      	uxth	r3, r3
    1788:	4013      	ands	r3, r2
    178a:	b29b      	uxth	r3, r3
    178c:	b299      	uxth	r1, r3
    178e:	4a11      	ldr	r2, [pc, #68]	; (17d4 <gdi_bit_op+0x9c>)
    1790:	697b      	ldr	r3, [r7, #20]
    1792:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1796:	e017      	b.n	17c8 <gdi_bit_op+0x90>
	case WHITE_BIT:
		video_buffer[offset]|=bit;
    1798:	4a0e      	ldr	r2, [pc, #56]	; (17d4 <gdi_bit_op+0x9c>)
    179a:	697b      	ldr	r3, [r7, #20]
    179c:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    17a0:	8a7b      	ldrh	r3, [r7, #18]
    17a2:	4313      	orrs	r3, r2
    17a4:	b299      	uxth	r1, r3
    17a6:	4a0b      	ldr	r2, [pc, #44]	; (17d4 <gdi_bit_op+0x9c>)
    17a8:	697b      	ldr	r3, [r7, #20]
    17aa:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    17ae:	e00b      	b.n	17c8 <gdi_bit_op+0x90>
	case XOR_BIT:
		video_buffer[offset]^=bit;
    17b0:	4a08      	ldr	r2, [pc, #32]	; (17d4 <gdi_bit_op+0x9c>)
    17b2:	697b      	ldr	r3, [r7, #20]
    17b4:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    17b8:	8a7b      	ldrh	r3, [r7, #18]
    17ba:	4053      	eors	r3, r2
    17bc:	b299      	uxth	r1, r3
    17be:	4a05      	ldr	r2, [pc, #20]	; (17d4 <gdi_bit_op+0x9c>)
    17c0:	697b      	ldr	r3, [r7, #20]
    17c2:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    17c6:	bf00      	nop
	}
}
    17c8:	371c      	adds	r7, #28
    17ca:	46bd      	mov	sp, r7
    17cc:	f85d 7b04 	ldr.w	r7, [sp], #4
    17d0:	4770      	bx	lr
    17d2:	bf00      	nop
    17d4:	20000138 	.word	0x20000138

000017d8 <gdi_box>:

void gdi_box(int x, int y, int w, int h, bitop_e op){
    17d8:	b580      	push	{r7, lr}
    17da:	b086      	sub	sp, #24
    17dc:	af00      	add	r7, sp, #0
    17de:	60f8      	str	r0, [r7, #12]
    17e0:	60b9      	str	r1, [r7, #8]
    17e2:	607a      	str	r2, [r7, #4]
    17e4:	603b      	str	r3, [r7, #0]
	int r,c;
	
	for (r=0;r<h;r++){
    17e6:	2300      	movs	r3, #0
    17e8:	617b      	str	r3, [r7, #20]
    17ea:	e02e      	b.n	184a <gdi_box+0x72>
		for (c=0;c<w;c++){
    17ec:	2300      	movs	r3, #0
    17ee:	613b      	str	r3, [r7, #16]
    17f0:	e024      	b.n	183c <gdi_box+0x64>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    17f2:	68fa      	ldr	r2, [r7, #12]
    17f4:	693b      	ldr	r3, [r7, #16]
    17f6:	4413      	add	r3, r2
    17f8:	2b00      	cmp	r3, #0
    17fa:	db1c      	blt.n	1836 <gdi_box+0x5e>
    17fc:	68fa      	ldr	r2, [r7, #12]
    17fe:	693b      	ldr	r3, [r7, #16]
    1800:	4413      	add	r3, r2
    1802:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    1806:	da16      	bge.n	1836 <gdi_box+0x5e>
    1808:	697a      	ldr	r2, [r7, #20]
    180a:	68bb      	ldr	r3, [r7, #8]
    180c:	4413      	add	r3, r2
    180e:	2b00      	cmp	r3, #0
    1810:	db11      	blt.n	1836 <gdi_box+0x5e>
    1812:	697a      	ldr	r2, [r7, #20]
    1814:	68bb      	ldr	r3, [r7, #8]
    1816:	4413      	add	r3, r2
    1818:	2bef      	cmp	r3, #239	; 0xef
    181a:	dc0c      	bgt.n	1836 <gdi_box+0x5e>
				gdi_bit_op(c+x,r+y,op);
    181c:	693a      	ldr	r2, [r7, #16]
    181e:	68fb      	ldr	r3, [r7, #12]
    1820:	18d1      	adds	r1, r2, r3
    1822:	697a      	ldr	r2, [r7, #20]
    1824:	68bb      	ldr	r3, [r7, #8]
    1826:	441a      	add	r2, r3
    1828:	f897 3020 	ldrb.w	r3, [r7, #32]
    182c:	4608      	mov	r0, r1
    182e:	4611      	mov	r1, r2
    1830:	461a      	mov	r2, r3
    1832:	f7ff ff81 	bl	1738 <gdi_bit_op>

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
		for (c=0;c<w;c++){
    1836:	693b      	ldr	r3, [r7, #16]
    1838:	3301      	adds	r3, #1
    183a:	613b      	str	r3, [r7, #16]
    183c:	693a      	ldr	r2, [r7, #16]
    183e:	687b      	ldr	r3, [r7, #4]
    1840:	429a      	cmp	r2, r3
    1842:	dbd6      	blt.n	17f2 <gdi_box+0x1a>
}

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
    1844:	697b      	ldr	r3, [r7, #20]
    1846:	3301      	adds	r3, #1
    1848:	617b      	str	r3, [r7, #20]
    184a:	697a      	ldr	r2, [r7, #20]
    184c:	683b      	ldr	r3, [r7, #0]
    184e:	429a      	cmp	r2, r3
    1850:	dbcc      	blt.n	17ec <gdi_box+0x14>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				gdi_bit_op(c+x,r+y,op);
			}
		}
	}
}
    1852:	3718      	adds	r7, #24
    1854:	46bd      	mov	sp, r7
    1856:	bd80      	pop	{r7, pc}

00001858 <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
    1858:	b480      	push	{r7}
    185a:	b089      	sub	sp, #36	; 0x24
    185c:	af00      	add	r7, sp, #0
    185e:	60f8      	str	r0, [r7, #12]
    1860:	60b9      	str	r1, [r7, #8]
    1862:	607a      	str	r2, [r7, #4]
    1864:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1866:	2300      	movs	r3, #0
    1868:	61fb      	str	r3, [r7, #28]
    186a:	e099      	b.n	19a0 <gdi_put_sprite+0x148>
		mask=128;
    186c:	2380      	movs	r3, #128	; 0x80
    186e:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    1870:	2300      	movs	r3, #0
    1872:	61bb      	str	r3, [r7, #24]
    1874:	e08c      	b.n	1990 <gdi_put_sprite+0x138>
			if (!mask){
    1876:	7dfb      	ldrb	r3, [r7, #23]
    1878:	2b00      	cmp	r3, #0
    187a:	d104      	bne.n	1886 <gdi_put_sprite+0x2e>
				sprite++;
    187c:	6abb      	ldr	r3, [r7, #40]	; 0x28
    187e:	3301      	adds	r3, #1
    1880:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    1882:	2380      	movs	r3, #128	; 0x80
    1884:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    1886:	68fa      	ldr	r2, [r7, #12]
    1888:	69bb      	ldr	r3, [r7, #24]
    188a:	4413      	add	r3, r2
    188c:	2b00      	cmp	r3, #0
    188e:	db79      	blt.n	1984 <gdi_put_sprite+0x12c>
    1890:	68fa      	ldr	r2, [r7, #12]
    1892:	69bb      	ldr	r3, [r7, #24]
    1894:	4413      	add	r3, r2
    1896:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    189a:	da73      	bge.n	1984 <gdi_put_sprite+0x12c>
    189c:	69fa      	ldr	r2, [r7, #28]
    189e:	68bb      	ldr	r3, [r7, #8]
    18a0:	4413      	add	r3, r2
    18a2:	2b00      	cmp	r3, #0
    18a4:	db6e      	blt.n	1984 <gdi_put_sprite+0x12c>
    18a6:	69fa      	ldr	r2, [r7, #28]
    18a8:	68bb      	ldr	r3, [r7, #8]
    18aa:	4413      	add	r3, r2
    18ac:	2bef      	cmp	r3, #239	; 0xef
    18ae:	dc69      	bgt.n	1984 <gdi_put_sprite+0x12c>
				if (sprite[r]&mask){
    18b0:	69fb      	ldr	r3, [r7, #28]
    18b2:	6aba      	ldr	r2, [r7, #40]	; 0x28
    18b4:	4413      	add	r3, r2
    18b6:	781a      	ldrb	r2, [r3, #0]
    18b8:	7dfb      	ldrb	r3, [r7, #23]
    18ba:	4013      	ands	r3, r2
    18bc:	b2db      	uxtb	r3, r3
    18be:	2b00      	cmp	r3, #0
    18c0:	d02f      	beq.n	1922 <gdi_put_sprite+0xca>
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]|=(1<<(15-((c+x)&15)));
    18c2:	69fa      	ldr	r2, [r7, #28]
    18c4:	68bb      	ldr	r3, [r7, #8]
    18c6:	441a      	add	r2, r3
    18c8:	4613      	mov	r3, r2
    18ca:	009b      	lsls	r3, r3, #2
    18cc:	4413      	add	r3, r2
    18ce:	009b      	lsls	r3, r3, #2
    18d0:	4619      	mov	r1, r3
    18d2:	69ba      	ldr	r2, [r7, #24]
    18d4:	68fb      	ldr	r3, [r7, #12]
    18d6:	4413      	add	r3, r2
    18d8:	111b      	asrs	r3, r3, #4
    18da:	4419      	add	r1, r3
    18dc:	69fa      	ldr	r2, [r7, #28]
    18de:	68bb      	ldr	r3, [r7, #8]
    18e0:	441a      	add	r2, r3
    18e2:	4613      	mov	r3, r2
    18e4:	009b      	lsls	r3, r3, #2
    18e6:	4413      	add	r3, r2
    18e8:	009b      	lsls	r3, r3, #2
    18ea:	4618      	mov	r0, r3
    18ec:	69ba      	ldr	r2, [r7, #24]
    18ee:	68fb      	ldr	r3, [r7, #12]
    18f0:	4413      	add	r3, r2
    18f2:	111b      	asrs	r3, r3, #4
    18f4:	4403      	add	r3, r0
    18f6:	4a2f      	ldr	r2, [pc, #188]	; (19b4 <gdi_put_sprite+0x15c>)
    18f8:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    18fc:	b298      	uxth	r0, r3
    18fe:	69ba      	ldr	r2, [r7, #24]
    1900:	68fb      	ldr	r3, [r7, #12]
    1902:	4413      	add	r3, r2
    1904:	43db      	mvns	r3, r3
    1906:	f003 030f 	and.w	r3, r3, #15
    190a:	2201      	movs	r2, #1
    190c:	fa02 f303 	lsl.w	r3, r2, r3
    1910:	b29b      	uxth	r3, r3
    1912:	4602      	mov	r2, r0
    1914:	4313      	orrs	r3, r2
    1916:	b29b      	uxth	r3, r3
    1918:	b29a      	uxth	r2, r3
    191a:	4b26      	ldr	r3, [pc, #152]	; (19b4 <gdi_put_sprite+0x15c>)
    191c:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
    1920:	e030      	b.n	1984 <gdi_put_sprite+0x12c>
				}else{
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]&=~(1<<(15-((c+x)&15)));
    1922:	69fa      	ldr	r2, [r7, #28]
    1924:	68bb      	ldr	r3, [r7, #8]
    1926:	441a      	add	r2, r3
    1928:	4613      	mov	r3, r2
    192a:	009b      	lsls	r3, r3, #2
    192c:	4413      	add	r3, r2
    192e:	009b      	lsls	r3, r3, #2
    1930:	4619      	mov	r1, r3
    1932:	69ba      	ldr	r2, [r7, #24]
    1934:	68fb      	ldr	r3, [r7, #12]
    1936:	4413      	add	r3, r2
    1938:	111b      	asrs	r3, r3, #4
    193a:	4419      	add	r1, r3
    193c:	69fa      	ldr	r2, [r7, #28]
    193e:	68bb      	ldr	r3, [r7, #8]
    1940:	441a      	add	r2, r3
    1942:	4613      	mov	r3, r2
    1944:	009b      	lsls	r3, r3, #2
    1946:	4413      	add	r3, r2
    1948:	009b      	lsls	r3, r3, #2
    194a:	4618      	mov	r0, r3
    194c:	69ba      	ldr	r2, [r7, #24]
    194e:	68fb      	ldr	r3, [r7, #12]
    1950:	4413      	add	r3, r2
    1952:	111b      	asrs	r3, r3, #4
    1954:	4403      	add	r3, r0
    1956:	4a17      	ldr	r2, [pc, #92]	; (19b4 <gdi_put_sprite+0x15c>)
    1958:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    195c:	b298      	uxth	r0, r3
    195e:	69ba      	ldr	r2, [r7, #24]
    1960:	68fb      	ldr	r3, [r7, #12]
    1962:	4413      	add	r3, r2
    1964:	43db      	mvns	r3, r3
    1966:	f003 030f 	and.w	r3, r3, #15
    196a:	2201      	movs	r2, #1
    196c:	fa02 f303 	lsl.w	r3, r2, r3
    1970:	b29b      	uxth	r3, r3
    1972:	43db      	mvns	r3, r3
    1974:	b29b      	uxth	r3, r3
    1976:	4602      	mov	r2, r0
    1978:	4013      	ands	r3, r2
    197a:	b29b      	uxth	r3, r3
    197c:	b29a      	uxth	r2, r3
    197e:	4b0d      	ldr	r3, [pc, #52]	; (19b4 <gdi_put_sprite+0x15c>)
    1980:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
				//bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
				//video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]|=bit;
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
    1984:	7dfb      	ldrb	r3, [r7, #23]
    1986:	085b      	lsrs	r3, r3, #1
    1988:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    198a:	69bb      	ldr	r3, [r7, #24]
    198c:	3301      	adds	r3, #1
    198e:	61bb      	str	r3, [r7, #24]
    1990:	69ba      	ldr	r2, [r7, #24]
    1992:	687b      	ldr	r3, [r7, #4]
    1994:	429a      	cmp	r2, r3
    1996:	f6ff af6e 	blt.w	1876 <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    199a:	69fb      	ldr	r3, [r7, #28]
    199c:	3301      	adds	r3, #1
    199e:	61fb      	str	r3, [r7, #28]
    19a0:	69fa      	ldr	r2, [r7, #28]
    19a2:	683b      	ldr	r3, [r7, #0]
    19a4:	429a      	cmp	r2, r3
    19a6:	f6ff af61 	blt.w	186c <gdi_put_sprite+0x14>
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    19aa:	3724      	adds	r7, #36	; 0x24
    19ac:	46bd      	mov	sp, r7
    19ae:	f85d 7b04 	ldr.w	r7, [sp], #4
    19b2:	4770      	bx	lr
    19b4:	20000138 	.word	0x20000138

000019b8 <gdi_putc>:


// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void gdi_putc(unsigned char c){
    19b8:	b580      	push	{r7, lr}
    19ba:	b084      	sub	sp, #16
    19bc:	af02      	add	r7, sp, #8
    19be:	4603      	mov	r3, r0
    19c0:	71fb      	strb	r3, [r7, #7]
		switch (c){
    19c2:	79fb      	ldrb	r3, [r7, #7]
    19c4:	2b0a      	cmp	r3, #10
    19c6:	d004      	beq.n	19d2 <gdi_putc+0x1a>
    19c8:	2b0d      	cmp	r3, #13
    19ca:	d002      	beq.n	19d2 <gdi_putc+0x1a>
    19cc:	2b08      	cmp	r3, #8
    19ce:	d003      	beq.n	19d8 <gdi_putc+0x20>
    19d0:	e011      	b.n	19f6 <gdi_putc+0x3e>
		case '\n':
		case CR:
			gdi_new_line();
    19d2:	f7ff fe69 	bl	16a8 <gdi_new_line>
			break;
    19d6:	e02c      	b.n	1a32 <gdi_putc+0x7a>
		case BS:
			gdi_cursor_left();
    19d8:	f7ff fe7e 	bl	16d8 <gdi_cursor_left>
			gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    19dc:	4b16      	ldr	r3, [pc, #88]	; (1a38 <gdi_putc+0x80>)
    19de:	6819      	ldr	r1, [r3, #0]
    19e0:	4b16      	ldr	r3, [pc, #88]	; (1a3c <gdi_putc+0x84>)
    19e2:	681a      	ldr	r2, [r3, #0]
    19e4:	2300      	movs	r3, #0
    19e6:	9300      	str	r3, [sp, #0]
    19e8:	4608      	mov	r0, r1
    19ea:	4611      	mov	r1, r2
    19ec:	2206      	movs	r2, #6
    19ee:	2308      	movs	r3, #8
    19f0:	f7ff fef2 	bl	17d8 <gdi_box>
			break;
    19f4:	e01d      	b.n	1a32 <gdi_putc+0x7a>
		default:
			if (c<FONT_SIZE){
    19f6:	79fb      	ldrb	r3, [r7, #7]
    19f8:	b25b      	sxtb	r3, r3
    19fa:	2b00      	cmp	r3, #0
    19fc:	db18      	blt.n	1a30 <gdi_putc+0x78>
				gdi_put_sprite(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,&font6x8[c]);
    19fe:	4b0e      	ldr	r3, [pc, #56]	; (1a38 <gdi_putc+0x80>)
    1a00:	6818      	ldr	r0, [r3, #0]
    1a02:	4b0e      	ldr	r3, [pc, #56]	; (1a3c <gdi_putc+0x84>)
    1a04:	6819      	ldr	r1, [r3, #0]
    1a06:	79fb      	ldrb	r3, [r7, #7]
    1a08:	00db      	lsls	r3, r3, #3
    1a0a:	4a0d      	ldr	r2, [pc, #52]	; (1a40 <gdi_putc+0x88>)
    1a0c:	4413      	add	r3, r2
    1a0e:	9300      	str	r3, [sp, #0]
    1a10:	2206      	movs	r2, #6
    1a12:	2308      	movs	r3, #8
    1a14:	f7ff ff20 	bl	1858 <gdi_put_sprite>
				cursor_x+=CHAR_WIDTH;
    1a18:	4b07      	ldr	r3, [pc, #28]	; (1a38 <gdi_putc+0x80>)
    1a1a:	681b      	ldr	r3, [r3, #0]
    1a1c:	3306      	adds	r3, #6
    1a1e:	4a06      	ldr	r2, [pc, #24]	; (1a38 <gdi_putc+0x80>)
    1a20:	6013      	str	r3, [r2, #0]
				if (cursor_x>(HRES-CHAR_WIDTH)){
    1a22:	4b05      	ldr	r3, [pc, #20]	; (1a38 <gdi_putc+0x80>)
    1a24:	681b      	ldr	r3, [r3, #0]
    1a26:	f5b3 7f9d 	cmp.w	r3, #314	; 0x13a
    1a2a:	dd01      	ble.n	1a30 <gdi_putc+0x78>
					gdi_new_line();
    1a2c:	f7ff fe3c 	bl	16a8 <gdi_new_line>
				}
			}
			break;
    1a30:	bf00      	nop
		}//switch
}
    1a32:	3708      	adds	r7, #8
    1a34:	46bd      	mov	sp, r7
    1a36:	bd80      	pop	{r7, pc}
    1a38:	200000d4 	.word	0x200000d4
    1a3c:	200000d8 	.word	0x200000d8
    1a40:	00002df0 	.word	0x00002df0

00001a44 <gdi_print>:

void gdi_print(const char *str){
    1a44:	b580      	push	{r7, lr}
    1a46:	b082      	sub	sp, #8
    1a48:	af00      	add	r7, sp, #0
    1a4a:	6078      	str	r0, [r7, #4]
	while (*str) gdi_putc(*str++);
    1a4c:	e006      	b.n	1a5c <gdi_print+0x18>
    1a4e:	687b      	ldr	r3, [r7, #4]
    1a50:	1c5a      	adds	r2, r3, #1
    1a52:	607a      	str	r2, [r7, #4]
    1a54:	781b      	ldrb	r3, [r3, #0]
    1a56:	4618      	mov	r0, r3
    1a58:	f7ff ffae 	bl	19b8 <gdi_putc>
    1a5c:	687b      	ldr	r3, [r7, #4]
    1a5e:	781b      	ldrb	r3, [r3, #0]
    1a60:	2b00      	cmp	r3, #0
    1a62:	d1f4      	bne.n	1a4e <gdi_print+0xa>
}
    1a64:	3708      	adds	r7, #8
    1a66:	46bd      	mov	sp, r7
    1a68:	bd80      	pop	{r7, pc}
    1a6a:	bf00      	nop

00001a6c <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(gpio_t* port, unsigned pin, unsigned config){
    1a6c:	b480      	push	{r7}
    1a6e:	b087      	sub	sp, #28
    1a70:	af00      	add	r7, sp, #0
    1a72:	60f8      	str	r0, [r7, #12]
    1a74:	60b9      	str	r1, [r7, #8]
    1a76:	607a      	str	r2, [r7, #4]
	uint8_t shift;
	shift=(pin&7)<<2;
    1a78:	68bb      	ldr	r3, [r7, #8]
    1a7a:	b2db      	uxtb	r3, r3
    1a7c:	f003 0307 	and.w	r3, r3, #7
    1a80:	b2db      	uxtb	r3, r3
    1a82:	009b      	lsls	r3, r3, #2
    1a84:	75fb      	strb	r3, [r7, #23]
	port->CR[pin>>3]&=~(15<<shift);
    1a86:	68bb      	ldr	r3, [r7, #8]
    1a88:	08da      	lsrs	r2, r3, #3
    1a8a:	68bb      	ldr	r3, [r7, #8]
    1a8c:	08d9      	lsrs	r1, r3, #3
    1a8e:	68fb      	ldr	r3, [r7, #12]
    1a90:	f853 3021 	ldr.w	r3, [r3, r1, lsl #2]
    1a94:	7df9      	ldrb	r1, [r7, #23]
    1a96:	200f      	movs	r0, #15
    1a98:	fa00 f101 	lsl.w	r1, r0, r1
    1a9c:	43c9      	mvns	r1, r1
    1a9e:	4019      	ands	r1, r3
    1aa0:	68fb      	ldr	r3, [r7, #12]
    1aa2:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
	port->CR[pin>>3]|=config<<shift;
    1aa6:	68bb      	ldr	r3, [r7, #8]
    1aa8:	08da      	lsrs	r2, r3, #3
    1aaa:	68bb      	ldr	r3, [r7, #8]
    1aac:	08d9      	lsrs	r1, r3, #3
    1aae:	68fb      	ldr	r3, [r7, #12]
    1ab0:	f853 1021 	ldr.w	r1, [r3, r1, lsl #2]
    1ab4:	7dfb      	ldrb	r3, [r7, #23]
    1ab6:	6878      	ldr	r0, [r7, #4]
    1ab8:	fa00 f303 	lsl.w	r3, r0, r3
    1abc:	4319      	orrs	r1, r3
    1abe:	68fb      	ldr	r3, [r7, #12]
    1ac0:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
}
    1ac4:	371c      	adds	r7, #28
    1ac6:	46bd      	mov	sp, r7
    1ac8:	f85d 7b04 	ldr.w	r7, [sp], #4
    1acc:	4770      	bx	lr
    1ace:	bf00      	nop

00001ad0 <read_pin>:

int read_pin(gpio_t* port, unsigned pin){
    1ad0:	b480      	push	{r7}
    1ad2:	b083      	sub	sp, #12
    1ad4:	af00      	add	r7, sp, #0
    1ad6:	6078      	str	r0, [r7, #4]
    1ad8:	6039      	str	r1, [r7, #0]
	return port->IDR&(1<<pin);
    1ada:	687b      	ldr	r3, [r7, #4]
    1adc:	689b      	ldr	r3, [r3, #8]
    1ade:	683a      	ldr	r2, [r7, #0]
    1ae0:	2101      	movs	r1, #1
    1ae2:	fa01 f202 	lsl.w	r2, r1, r2
    1ae6:	4013      	ands	r3, r2
}
    1ae8:	4618      	mov	r0, r3
    1aea:	370c      	adds	r7, #12
    1aec:	46bd      	mov	sp, r7
    1aee:	f85d 7b04 	ldr.w	r7, [sp], #4
    1af2:	4770      	bx	lr

00001af4 <write_pin>:

void write_pin(gpio_t* port, unsigned pin, int value){
    1af4:	b480      	push	{r7}
    1af6:	b085      	sub	sp, #20
    1af8:	af00      	add	r7, sp, #0
    1afa:	60f8      	str	r0, [r7, #12]
    1afc:	60b9      	str	r1, [r7, #8]
    1afe:	607a      	str	r2, [r7, #4]
	value?(port->ODR|=(1<<pin)):(port->ODR&=~(1<<pin));
    1b00:	687b      	ldr	r3, [r7, #4]
    1b02:	2b00      	cmp	r3, #0
    1b04:	d009      	beq.n	1b1a <write_pin+0x26>
    1b06:	68fb      	ldr	r3, [r7, #12]
    1b08:	68db      	ldr	r3, [r3, #12]
    1b0a:	68ba      	ldr	r2, [r7, #8]
    1b0c:	2101      	movs	r1, #1
    1b0e:	fa01 f202 	lsl.w	r2, r1, r2
    1b12:	431a      	orrs	r2, r3
    1b14:	68fb      	ldr	r3, [r7, #12]
    1b16:	60da      	str	r2, [r3, #12]
    1b18:	e009      	b.n	1b2e <write_pin+0x3a>
    1b1a:	68fb      	ldr	r3, [r7, #12]
    1b1c:	68db      	ldr	r3, [r3, #12]
    1b1e:	68ba      	ldr	r2, [r7, #8]
    1b20:	2101      	movs	r1, #1
    1b22:	fa01 f202 	lsl.w	r2, r1, r2
    1b26:	43d2      	mvns	r2, r2
    1b28:	401a      	ands	r2, r3
    1b2a:	68fb      	ldr	r3, [r7, #12]
    1b2c:	60da      	str	r2, [r3, #12]
}
    1b2e:	3714      	adds	r7, #20
    1b30:	46bd      	mov	sp, r7
    1b32:	f85d 7b04 	ldr.w	r7, [sp], #4
    1b36:	4770      	bx	lr

00001b38 <toggle_pin>:

void toggle_pin(gpio_t* port, unsigned pin){
    1b38:	b480      	push	{r7}
    1b3a:	b083      	sub	sp, #12
    1b3c:	af00      	add	r7, sp, #0
    1b3e:	6078      	str	r0, [r7, #4]
    1b40:	6039      	str	r1, [r7, #0]
	port->ODR^=(1<<pin);
    1b42:	687b      	ldr	r3, [r7, #4]
    1b44:	68db      	ldr	r3, [r3, #12]
    1b46:	683a      	ldr	r2, [r7, #0]
    1b48:	2101      	movs	r1, #1
    1b4a:	fa01 f202 	lsl.w	r2, r1, r2
    1b4e:	405a      	eors	r2, r3
    1b50:	687b      	ldr	r3, [r7, #4]
    1b52:	60da      	str	r2, [r3, #12]
}
    1b54:	370c      	adds	r7, #12
    1b56:	46bd      	mov	sp, r7
    1b58:	f85d 7b04 	ldr.w	r7, [sp], #4
    1b5c:	4770      	bx	lr
    1b5e:	bf00      	nop

00001b60 <keyboard_init>:
    ps2_flags = 0;
    return KbdSend(KBD_RESET);
}//KbdReset()
*/
 
void keyboard_init(){
    1b60:	b580      	push	{r7, lr}
    1b62:	af00      	add	r7, sp, #0
	head=0;
    1b64:	4b22      	ldr	r3, [pc, #136]	; (1bf0 <keyboard_init+0x90>)
    1b66:	2200      	movs	r2, #0
    1b68:	601a      	str	r2, [r3, #0]
	tail=0;
    1b6a:	4b22      	ldr	r3, [pc, #136]	; (1bf4 <keyboard_init+0x94>)
    1b6c:	2200      	movs	r2, #0
    1b6e:	601a      	str	r2, [r3, #0]
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
    1b70:	4a21      	ldr	r2, [pc, #132]	; (1bf8 <keyboard_init+0x98>)
    1b72:	4b21      	ldr	r3, [pc, #132]	; (1bf8 <keyboard_init+0x98>)
    1b74:	699b      	ldr	r3, [r3, #24]
    1b76:	f043 0305 	orr.w	r3, r3, #5
    1b7a:	6193      	str	r3, [r2, #24]
	// activation clock TMR2
	RCC->APB1ENR|=RCC_APB1ENR_TIM2EN; 
    1b7c:	4a1e      	ldr	r2, [pc, #120]	; (1bf8 <keyboard_init+0x98>)
    1b7e:	4b1e      	ldr	r3, [pc, #120]	; (1bf8 <keyboard_init+0x98>)
    1b80:	69db      	ldr	r3, [r3, #28]
    1b82:	f043 0301 	orr.w	r3, r3, #1
    1b86:	61d3      	str	r3, [r2, #28]
	TMR2->ARR=FAPB1/20*.01;
    1b88:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1b8c:	f243 72ee 	movw	r2, #14318	; 0x37ee
    1b90:	62da      	str	r2, [r3, #44]	; 0x2c
	TMR2->PSC=20;
    1b92:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1b96:	2214      	movs	r2, #20
    1b98:	629a      	str	r2, [r3, #40]	; 0x28
	TMR2->CR1=BIT0|BIT7; // ARPE
    1b9a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1b9e:	2281      	movs	r2, #129	; 0x81
    1ba0:	601a      	str	r2, [r3, #0]
	TMR2->DIER=BIT0; // UIE
    1ba2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1ba6:	2201      	movs	r2, #1
    1ba8:	60da      	str	r2, [r3, #12]
	set_int_priority(IRQ_KBD_CLK,0);
    1baa:	2017      	movs	r0, #23
    1bac:	2100      	movs	r1, #0
    1bae:	f000 fb91 	bl	22d4 <set_int_priority>
	set_int_priority(IRQ_TIM2,14);
    1bb2:	201c      	movs	r0, #28
    1bb4:	210e      	movs	r1, #14
    1bb6:	f000 fb8d 	bl	22d4 <set_int_priority>
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
    1bba:	4a10      	ldr	r2, [pc, #64]	; (1bfc <keyboard_init+0x9c>)
    1bbc:	4b0f      	ldr	r3, [pc, #60]	; (1bfc <keyboard_init+0x9c>)
    1bbe:	68db      	ldr	r3, [r3, #12]
    1bc0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1bc4:	60d3      	str	r3, [r2, #12]
	EXTI->IMR|=KBD_CLK_PIN;
    1bc6:	4a0d      	ldr	r2, [pc, #52]	; (1bfc <keyboard_init+0x9c>)
    1bc8:	4b0c      	ldr	r3, [pc, #48]	; (1bfc <keyboard_init+0x9c>)
    1bca:	681b      	ldr	r3, [r3, #0]
    1bcc:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1bd0:	6013      	str	r3, [r2, #0]
	enable_interrupt(IRQ_KBD_CLK);
    1bd2:	2017      	movs	r0, #23
    1bd4:	f000 fab2 	bl	213c <enable_interrupt>
	TMR2->SR&=~BIT0;
    1bd8:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    1bdc:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1be0:	691b      	ldr	r3, [r3, #16]
    1be2:	f023 0301 	bic.w	r3, r3, #1
    1be6:	6113      	str	r3, [r2, #16]
	enable_interrupt(IRQ_TIM2);
    1be8:	201c      	movs	r0, #28
    1bea:	f000 faa7 	bl	213c <enable_interrupt>
	//pause(700);
	//if (!KbdReset()) print("keyboard reset failed\n");
}
    1bee:	bd80      	pop	{r7, pc}
    1bf0:	200000fc 	.word	0x200000fc
    1bf4:	20000100 	.word	0x20000100
    1bf8:	40021000 	.word	0x40021000
    1bfc:	40010400 	.word	0x40010400

00001c00 <kbd_getc>:


unsigned char kbd_getc(){
    1c00:	b480      	push	{r7}
    1c02:	b083      	sub	sp, #12
    1c04:	af00      	add	r7, sp, #0
	unsigned char c=0;
    1c06:	2300      	movs	r3, #0
    1c08:	71fb      	strb	r3, [r7, #7]
	if (head!=tail){
    1c0a:	4b0d      	ldr	r3, [pc, #52]	; (1c40 <kbd_getc+0x40>)
    1c0c:	681a      	ldr	r2, [r3, #0]
    1c0e:	4b0d      	ldr	r3, [pc, #52]	; (1c44 <kbd_getc+0x44>)
    1c10:	681b      	ldr	r3, [r3, #0]
    1c12:	429a      	cmp	r2, r3
    1c14:	d00d      	beq.n	1c32 <kbd_getc+0x32>
		c=queue[head++];
    1c16:	4b0a      	ldr	r3, [pc, #40]	; (1c40 <kbd_getc+0x40>)
    1c18:	681b      	ldr	r3, [r3, #0]
    1c1a:	1c5a      	adds	r2, r3, #1
    1c1c:	4908      	ldr	r1, [pc, #32]	; (1c40 <kbd_getc+0x40>)
    1c1e:	600a      	str	r2, [r1, #0]
    1c20:	4a09      	ldr	r2, [pc, #36]	; (1c48 <kbd_getc+0x48>)
    1c22:	5cd3      	ldrb	r3, [r2, r3]
    1c24:	71fb      	strb	r3, [r7, #7]
		head&=QUEUE_SIZE-1;
    1c26:	4b06      	ldr	r3, [pc, #24]	; (1c40 <kbd_getc+0x40>)
    1c28:	681b      	ldr	r3, [r3, #0]
    1c2a:	f003 031f 	and.w	r3, r3, #31
    1c2e:	4a04      	ldr	r2, [pc, #16]	; (1c40 <kbd_getc+0x40>)
    1c30:	6013      	str	r3, [r2, #0]
	}
	return c;
    1c32:	79fb      	ldrb	r3, [r7, #7]
}
    1c34:	4618      	mov	r0, r3
    1c36:	370c      	adds	r7, #12
    1c38:	46bd      	mov	sp, r7
    1c3a:	f85d 7b04 	ldr.w	r7, [sp], #4
    1c3e:	4770      	bx	lr
    1c40:	200000fc 	.word	0x200000fc
    1c44:	20000100 	.word	0x20000100
    1c48:	200000dc 	.word	0x200000dc

00001c4c <search_table>:
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
    1c4c:	b480      	push	{r7}
    1c4e:	b083      	sub	sp, #12
    1c50:	af00      	add	r7, sp, #0
    1c52:	6078      	str	r0, [r7, #4]
    1c54:	460b      	mov	r3, r1
    1c56:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    1c58:	e008      	b.n	1c6c <search_table+0x20>
		if (table->code==code) break;
    1c5a:	687b      	ldr	r3, [r7, #4]
    1c5c:	781b      	ldrb	r3, [r3, #0]
    1c5e:	78fa      	ldrb	r2, [r7, #3]
    1c60:	429a      	cmp	r2, r3
    1c62:	d100      	bne.n	1c66 <search_table+0x1a>
    1c64:	e006      	b.n	1c74 <search_table+0x28>
		table++;
    1c66:	687b      	ldr	r3, [r7, #4]
    1c68:	3302      	adds	r3, #2
    1c6a:	607b      	str	r3, [r7, #4]

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
    1c6c:	687b      	ldr	r3, [r7, #4]
    1c6e:	781b      	ldrb	r3, [r3, #0]
    1c70:	2b00      	cmp	r3, #0
    1c72:	d1f2      	bne.n	1c5a <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    1c74:	687b      	ldr	r3, [r7, #4]
    1c76:	785b      	ldrb	r3, [r3, #1]
}
    1c78:	4618      	mov	r0, r3
    1c7a:	370c      	adds	r7, #12
    1c7c:	46bd      	mov	sp, r7
    1c7e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1c82:	4770      	bx	lr

00001c84 <convert_code>:

static void convert_code(unsigned char code){
    1c84:	b580      	push	{r7, lr}
    1c86:	b086      	sub	sp, #24
    1c88:	af00      	add	r7, sp, #0
    1c8a:	4603      	mov	r3, r0
    1c8c:	71fb      	strb	r3, [r7, #7]
		unsigned char c,s;
		int shift;
		
		switch (code){
    1c8e:	79fb      	ldrb	r3, [r7, #7]
    1c90:	2b59      	cmp	r3, #89	; 0x59
    1c92:	f000 80a3 	beq.w	1ddc <convert_code+0x158>
    1c96:	2b59      	cmp	r3, #89	; 0x59
    1c98:	dc0e      	bgt.n	1cb8 <convert_code+0x34>
    1c9a:	2b12      	cmp	r3, #18
    1c9c:	d042      	beq.n	1d24 <convert_code+0xa0>
    1c9e:	2b12      	cmp	r3, #18
    1ca0:	dc03      	bgt.n	1caa <convert_code+0x26>
    1ca2:	2b11      	cmp	r3, #17
    1ca4:	f000 80c2 	beq.w	1e2c <convert_code+0x1a8>
    1ca8:	e0e8      	b.n	1e7c <convert_code+0x1f8>
    1caa:	2b14      	cmp	r3, #20
    1cac:	f000 80aa 	beq.w	1e04 <convert_code+0x180>
    1cb0:	2b58      	cmp	r3, #88	; 0x58
    1cb2:	f000 80cf 	beq.w	1e54 <convert_code+0x1d0>
    1cb6:	e0e1      	b.n	1e7c <convert_code+0x1f8>
    1cb8:	2be0      	cmp	r3, #224	; 0xe0
    1cba:	d010      	beq.n	1cde <convert_code+0x5a>
    1cbc:	2be0      	cmp	r3, #224	; 0xe0
    1cbe:	dc02      	bgt.n	1cc6 <convert_code+0x42>
    1cc0:	2b7c      	cmp	r3, #124	; 0x7c
    1cc2:	d051      	beq.n	1d68 <convert_code+0xe4>
    1cc4:	e0da      	b.n	1e7c <convert_code+0x1f8>
    1cc6:	2be1      	cmp	r3, #225	; 0xe1
    1cc8:	d010      	beq.n	1cec <convert_code+0x68>
    1cca:	2bf0      	cmp	r3, #240	; 0xf0
    1ccc:	f040 80d6 	bne.w	1e7c <convert_code+0x1f8>
		case 0xF0:
			flags |= RELEASE;
    1cd0:	4b9c      	ldr	r3, [pc, #624]	; (1f44 <convert_code+0x2c0>)
    1cd2:	681b      	ldr	r3, [r3, #0]
    1cd4:	f043 0302 	orr.w	r3, r3, #2
    1cd8:	4a9a      	ldr	r2, [pc, #616]	; (1f44 <convert_code+0x2c0>)
    1cda:	6013      	str	r3, [r2, #0]
			break;
    1cdc:	e145      	b.n	1f6a <convert_code+0x2e6>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    1cde:	4b99      	ldr	r3, [pc, #612]	; (1f44 <convert_code+0x2c0>)
    1ce0:	681b      	ldr	r3, [r3, #0]
    1ce2:	f043 0301 	orr.w	r3, r3, #1
    1ce6:	4a97      	ldr	r2, [pc, #604]	; (1f44 <convert_code+0x2c0>)
    1ce8:	6013      	str	r3, [r2, #0]
			break;
    1cea:	e13e      	b.n	1f6a <convert_code+0x2e6>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    1cec:	4b95      	ldr	r3, [pc, #596]	; (1f44 <convert_code+0x2c0>)
    1cee:	681b      	ldr	r3, [r3, #0]
    1cf0:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    1cf4:	4a93      	ldr	r2, [pc, #588]	; (1f44 <convert_code+0x2c0>)
    1cf6:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    1cf8:	4b92      	ldr	r3, [pc, #584]	; (1f44 <convert_code+0x2c0>)
    1cfa:	681b      	ldr	r3, [r3, #0]
    1cfc:	f403 7380 	and.w	r3, r3, #256	; 0x100
    1d00:	2b00      	cmp	r3, #0
    1d02:	d10e      	bne.n	1d22 <convert_code+0x9e>
				queue[tail++]=PAUSE;
    1d04:	4b90      	ldr	r3, [pc, #576]	; (1f48 <convert_code+0x2c4>)
    1d06:	681b      	ldr	r3, [r3, #0]
    1d08:	1c5a      	adds	r2, r3, #1
    1d0a:	498f      	ldr	r1, [pc, #572]	; (1f48 <convert_code+0x2c4>)
    1d0c:	600a      	str	r2, [r1, #0]
    1d0e:	4a8f      	ldr	r2, [pc, #572]	; (1f4c <convert_code+0x2c8>)
    1d10:	2194      	movs	r1, #148	; 0x94
    1d12:	54d1      	strb	r1, [r2, r3]
				tail&=QUEUE_SIZE-1;
    1d14:	4b8c      	ldr	r3, [pc, #560]	; (1f48 <convert_code+0x2c4>)
    1d16:	681b      	ldr	r3, [r3, #0]
    1d18:	f003 031f 	and.w	r3, r3, #31
    1d1c:	4a8a      	ldr	r2, [pc, #552]	; (1f48 <convert_code+0x2c4>)
    1d1e:	6013      	str	r3, [r2, #0]
			}
			break;
    1d20:	e123      	b.n	1f6a <convert_code+0x2e6>
    1d22:	e122      	b.n	1f6a <convert_code+0x2e6>
		case LSHIFT:
			if (flags&RELEASE){
    1d24:	4b87      	ldr	r3, [pc, #540]	; (1f44 <convert_code+0x2c0>)
    1d26:	681b      	ldr	r3, [r3, #0]
    1d28:	f003 0302 	and.w	r3, r3, #2
    1d2c:	2b00      	cmp	r3, #0
    1d2e:	d006      	beq.n	1d3e <convert_code+0xba>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    1d30:	4b84      	ldr	r3, [pc, #528]	; (1f44 <convert_code+0x2c0>)
    1d32:	681b      	ldr	r3, [r3, #0]
    1d34:	f023 0307 	bic.w	r3, r3, #7
    1d38:	4a82      	ldr	r2, [pc, #520]	; (1f44 <convert_code+0x2c0>)
    1d3a:	6013      	str	r3, [r2, #0]
    1d3c:	e013      	b.n	1d66 <convert_code+0xe2>
			}else{
				if (flags&XTD_CODE){
    1d3e:	4b81      	ldr	r3, [pc, #516]	; (1f44 <convert_code+0x2c0>)
    1d40:	681b      	ldr	r3, [r3, #0]
    1d42:	f003 0301 	and.w	r3, r3, #1
    1d46:	2b00      	cmp	r3, #0
    1d48:	d006      	beq.n	1d58 <convert_code+0xd4>
					flags|=PRNSCR;
    1d4a:	4b7e      	ldr	r3, [pc, #504]	; (1f44 <convert_code+0x2c0>)
    1d4c:	681b      	ldr	r3, [r3, #0]
    1d4e:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1d52:	4a7c      	ldr	r2, [pc, #496]	; (1f44 <convert_code+0x2c0>)
    1d54:	6013      	str	r3, [r2, #0]
    1d56:	e006      	b.n	1d66 <convert_code+0xe2>
				}else{
					flags|=LEFT_SHIFT;
    1d58:	4b7a      	ldr	r3, [pc, #488]	; (1f44 <convert_code+0x2c0>)
    1d5a:	681b      	ldr	r3, [r3, #0]
    1d5c:	f043 0304 	orr.w	r3, r3, #4
    1d60:	4a78      	ldr	r2, [pc, #480]	; (1f44 <convert_code+0x2c0>)
    1d62:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1d64:	e101      	b.n	1f6a <convert_code+0x2e6>
    1d66:	e100      	b.n	1f6a <convert_code+0x2e6>
		case KPMUL:
			if (flags&RELEASE){
    1d68:	4b76      	ldr	r3, [pc, #472]	; (1f44 <convert_code+0x2c0>)
    1d6a:	681b      	ldr	r3, [r3, #0]
    1d6c:	f003 0302 	and.w	r3, r3, #2
    1d70:	2b00      	cmp	r3, #0
    1d72:	d006      	beq.n	1d82 <convert_code+0xfe>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    1d74:	4b73      	ldr	r3, [pc, #460]	; (1f44 <convert_code+0x2c0>)
    1d76:	681b      	ldr	r3, [r3, #0]
    1d78:	f023 0303 	bic.w	r3, r3, #3
    1d7c:	4a71      	ldr	r2, [pc, #452]	; (1f44 <convert_code+0x2c0>)
    1d7e:	6013      	str	r3, [r2, #0]
    1d80:	e02b      	b.n	1dda <convert_code+0x156>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    1d82:	4b70      	ldr	r3, [pc, #448]	; (1f44 <convert_code+0x2c0>)
    1d84:	681b      	ldr	r3, [r3, #0]
    1d86:	f003 0301 	and.w	r3, r3, #1
    1d8a:	2b00      	cmp	r3, #0
    1d8c:	d016      	beq.n	1dbc <convert_code+0x138>
					flags&=~(XTD_CODE|PRNSCR);
    1d8e:	4b6d      	ldr	r3, [pc, #436]	; (1f44 <convert_code+0x2c0>)
    1d90:	681b      	ldr	r3, [r3, #0]
    1d92:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    1d96:	f023 0301 	bic.w	r3, r3, #1
    1d9a:	4a6a      	ldr	r2, [pc, #424]	; (1f44 <convert_code+0x2c0>)
    1d9c:	6013      	str	r3, [r2, #0]
					queue[tail++]=PRN;
    1d9e:	4b6a      	ldr	r3, [pc, #424]	; (1f48 <convert_code+0x2c4>)
    1da0:	681b      	ldr	r3, [r3, #0]
    1da2:	1c5a      	adds	r2, r3, #1
    1da4:	4968      	ldr	r1, [pc, #416]	; (1f48 <convert_code+0x2c4>)
    1da6:	600a      	str	r2, [r1, #0]
    1da8:	4a68      	ldr	r2, [pc, #416]	; (1f4c <convert_code+0x2c8>)
    1daa:	2192      	movs	r1, #146	; 0x92
    1dac:	54d1      	strb	r1, [r2, r3]
					tail&=QUEUE_SIZE-1;
    1dae:	4b66      	ldr	r3, [pc, #408]	; (1f48 <convert_code+0x2c4>)
    1db0:	681b      	ldr	r3, [r3, #0]
    1db2:	f003 031f 	and.w	r3, r3, #31
    1db6:	4a64      	ldr	r2, [pc, #400]	; (1f48 <convert_code+0x2c4>)
    1db8:	6013      	str	r3, [r2, #0]
    1dba:	e00e      	b.n	1dda <convert_code+0x156>
				}else{
					queue[tail++]='*';
    1dbc:	4b62      	ldr	r3, [pc, #392]	; (1f48 <convert_code+0x2c4>)
    1dbe:	681b      	ldr	r3, [r3, #0]
    1dc0:	1c5a      	adds	r2, r3, #1
    1dc2:	4961      	ldr	r1, [pc, #388]	; (1f48 <convert_code+0x2c4>)
    1dc4:	600a      	str	r2, [r1, #0]
    1dc6:	4a61      	ldr	r2, [pc, #388]	; (1f4c <convert_code+0x2c8>)
    1dc8:	212a      	movs	r1, #42	; 0x2a
    1dca:	54d1      	strb	r1, [r2, r3]
					tail&=QUEUE_SIZE-1;
    1dcc:	4b5e      	ldr	r3, [pc, #376]	; (1f48 <convert_code+0x2c4>)
    1dce:	681b      	ldr	r3, [r3, #0]
    1dd0:	f003 031f 	and.w	r3, r3, #31
    1dd4:	4a5c      	ldr	r2, [pc, #368]	; (1f48 <convert_code+0x2c4>)
    1dd6:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1dd8:	e0c7      	b.n	1f6a <convert_code+0x2e6>
    1dda:	e0c6      	b.n	1f6a <convert_code+0x2e6>
		case RSHIFT:
			if (flags&RELEASE){
    1ddc:	4b59      	ldr	r3, [pc, #356]	; (1f44 <convert_code+0x2c0>)
    1dde:	681b      	ldr	r3, [r3, #0]
    1de0:	f003 0302 	and.w	r3, r3, #2
    1de4:	2b00      	cmp	r3, #0
    1de6:	d006      	beq.n	1df6 <convert_code+0x172>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    1de8:	4b56      	ldr	r3, [pc, #344]	; (1f44 <convert_code+0x2c0>)
    1dea:	681b      	ldr	r3, [r3, #0]
    1dec:	f023 030b 	bic.w	r3, r3, #11
    1df0:	4a54      	ldr	r2, [pc, #336]	; (1f44 <convert_code+0x2c0>)
    1df2:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    1df4:	e0b9      	b.n	1f6a <convert_code+0x2e6>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    1df6:	4b53      	ldr	r3, [pc, #332]	; (1f44 <convert_code+0x2c0>)
    1df8:	681b      	ldr	r3, [r3, #0]
    1dfa:	f043 0308 	orr.w	r3, r3, #8
    1dfe:	4a51      	ldr	r2, [pc, #324]	; (1f44 <convert_code+0x2c0>)
    1e00:	6013      	str	r3, [r2, #0]
			}
			break;
    1e02:	e0b2      	b.n	1f6a <convert_code+0x2e6>
		case LCTRL:
			if (flags&RELEASE){
    1e04:	4b4f      	ldr	r3, [pc, #316]	; (1f44 <convert_code+0x2c0>)
    1e06:	681b      	ldr	r3, [r3, #0]
    1e08:	f003 0302 	and.w	r3, r3, #2
    1e0c:	2b00      	cmp	r3, #0
    1e0e:	d006      	beq.n	1e1e <convert_code+0x19a>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    1e10:	4b4c      	ldr	r3, [pc, #304]	; (1f44 <convert_code+0x2c0>)
    1e12:	681b      	ldr	r3, [r3, #0]
    1e14:	f023 0313 	bic.w	r3, r3, #19
    1e18:	4a4a      	ldr	r2, [pc, #296]	; (1f44 <convert_code+0x2c0>)
    1e1a:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_CTRL;
			}
			break;
    1e1c:	e0a5      	b.n	1f6a <convert_code+0x2e6>
			break;
		case LCTRL:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
			}else{
				flags|=LEFT_CTRL;
    1e1e:	4b49      	ldr	r3, [pc, #292]	; (1f44 <convert_code+0x2c0>)
    1e20:	681b      	ldr	r3, [r3, #0]
    1e22:	f043 0310 	orr.w	r3, r3, #16
    1e26:	4a47      	ldr	r2, [pc, #284]	; (1f44 <convert_code+0x2c0>)
    1e28:	6013      	str	r3, [r2, #0]
			}
			break;
    1e2a:	e09e      	b.n	1f6a <convert_code+0x2e6>
		case LALT:
			if (flags&RELEASE){
    1e2c:	4b45      	ldr	r3, [pc, #276]	; (1f44 <convert_code+0x2c0>)
    1e2e:	681b      	ldr	r3, [r3, #0]
    1e30:	f003 0302 	and.w	r3, r3, #2
    1e34:	2b00      	cmp	r3, #0
    1e36:	d006      	beq.n	1e46 <convert_code+0x1c2>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    1e38:	4b42      	ldr	r3, [pc, #264]	; (1f44 <convert_code+0x2c0>)
    1e3a:	681b      	ldr	r3, [r3, #0]
    1e3c:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    1e40:	4a40      	ldr	r2, [pc, #256]	; (1f44 <convert_code+0x2c0>)
    1e42:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    1e44:	e091      	b.n	1f6a <convert_code+0x2e6>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    1e46:	4b3f      	ldr	r3, [pc, #252]	; (1f44 <convert_code+0x2c0>)
    1e48:	681b      	ldr	r3, [r3, #0]
    1e4a:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1e4e:	4a3d      	ldr	r2, [pc, #244]	; (1f44 <convert_code+0x2c0>)
    1e50:	6013      	str	r3, [r2, #0]
			}
			break;
    1e52:	e08a      	b.n	1f6a <convert_code+0x2e6>
		case CAPS_LOCK:
			if (flags&RELEASE){
    1e54:	4b3b      	ldr	r3, [pc, #236]	; (1f44 <convert_code+0x2c0>)
    1e56:	681b      	ldr	r3, [r3, #0]
    1e58:	f003 0302 	and.w	r3, r3, #2
    1e5c:	2b00      	cmp	r3, #0
    1e5e:	d006      	beq.n	1e6e <convert_code+0x1ea>
				flags&=~(RELEASE|XTD_CODE);
    1e60:	4b38      	ldr	r3, [pc, #224]	; (1f44 <convert_code+0x2c0>)
    1e62:	681b      	ldr	r3, [r3, #0]
    1e64:	f023 0303 	bic.w	r3, r3, #3
    1e68:	4a36      	ldr	r2, [pc, #216]	; (1f44 <convert_code+0x2c0>)
    1e6a:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    1e6c:	e07d      	b.n	1f6a <convert_code+0x2e6>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    1e6e:	4b35      	ldr	r3, [pc, #212]	; (1f44 <convert_code+0x2c0>)
    1e70:	681b      	ldr	r3, [r3, #0]
    1e72:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    1e76:	4a33      	ldr	r2, [pc, #204]	; (1f44 <convert_code+0x2c0>)
    1e78:	6013      	str	r3, [r2, #0]
			}
			break;
    1e7a:	e076      	b.n	1f6a <convert_code+0x2e6>
		default:
			if (!(flags&RELEASE)){
    1e7c:	4b31      	ldr	r3, [pc, #196]	; (1f44 <convert_code+0x2c0>)
    1e7e:	681b      	ldr	r3, [r3, #0]
    1e80:	f003 0302 	and.w	r3, r3, #2
    1e84:	2b00      	cmp	r3, #0
    1e86:	d169      	bne.n	1f5c <convert_code+0x2d8>
					if (flags&XTD_CODE){
    1e88:	4b2e      	ldr	r3, [pc, #184]	; (1f44 <convert_code+0x2c0>)
    1e8a:	681b      	ldr	r3, [r3, #0]
    1e8c:	f003 0301 	and.w	r3, r3, #1
    1e90:	2b00      	cmp	r3, #0
    1e92:	d00d      	beq.n	1eb0 <convert_code+0x22c>
						c=search_table(mcsaite_xkey,code);
    1e94:	79fb      	ldrb	r3, [r7, #7]
    1e96:	482e      	ldr	r0, [pc, #184]	; (1f50 <convert_code+0x2cc>)
    1e98:	4619      	mov	r1, r3
    1e9a:	f7ff fed7 	bl	1c4c <search_table>
    1e9e:	4603      	mov	r3, r0
    1ea0:	75fb      	strb	r3, [r7, #23]
						flags&=~XTD_CODE;
    1ea2:	4b28      	ldr	r3, [pc, #160]	; (1f44 <convert_code+0x2c0>)
    1ea4:	681b      	ldr	r3, [r3, #0]
    1ea6:	f023 0301 	bic.w	r3, r3, #1
    1eaa:	4a26      	ldr	r2, [pc, #152]	; (1f44 <convert_code+0x2c0>)
    1eac:	6013      	str	r3, [r2, #0]
    1eae:	e006      	b.n	1ebe <convert_code+0x23a>
					}else{
						c=search_table(mcsaite_key,code);
    1eb0:	79fb      	ldrb	r3, [r7, #7]
    1eb2:	4828      	ldr	r0, [pc, #160]	; (1f54 <convert_code+0x2d0>)
    1eb4:	4619      	mov	r1, r3
    1eb6:	f7ff fec9 	bl	1c4c <search_table>
    1eba:	4603      	mov	r3, r0
    1ebc:	75fb      	strb	r3, [r7, #23]
					}
					shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    1ebe:	4b21      	ldr	r3, [pc, #132]	; (1f44 <convert_code+0x2c0>)
    1ec0:	681b      	ldr	r3, [r3, #0]
    1ec2:	f003 030c 	and.w	r3, r3, #12
    1ec6:	613b      	str	r3, [r7, #16]
					if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    1ec8:	7dfb      	ldrb	r3, [r7, #23]
    1eca:	2b60      	cmp	r3, #96	; 0x60
    1ecc:	d918      	bls.n	1f00 <convert_code+0x27c>
    1ece:	7dfb      	ldrb	r3, [r7, #23]
    1ed0:	2b7a      	cmp	r3, #122	; 0x7a
    1ed2:	d815      	bhi.n	1f00 <convert_code+0x27c>
    1ed4:	693b      	ldr	r3, [r7, #16]
    1ed6:	2b00      	cmp	r3, #0
    1ed8:	d005      	beq.n	1ee6 <convert_code+0x262>
    1eda:	4b1a      	ldr	r3, [pc, #104]	; (1f44 <convert_code+0x2c0>)
    1edc:	681b      	ldr	r3, [r3, #0]
    1ede:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1ee2:	2b00      	cmp	r3, #0
    1ee4:	d008      	beq.n	1ef8 <convert_code+0x274>
    1ee6:	693b      	ldr	r3, [r7, #16]
    1ee8:	2b00      	cmp	r3, #0
    1eea:	d109      	bne.n	1f00 <convert_code+0x27c>
    1eec:	4b15      	ldr	r3, [pc, #84]	; (1f44 <convert_code+0x2c0>)
    1eee:	681b      	ldr	r3, [r3, #0]
    1ef0:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1ef4:	2b00      	cmp	r3, #0
    1ef6:	d003      	beq.n	1f00 <convert_code+0x27c>
						c-=32;
    1ef8:	7dfb      	ldrb	r3, [r7, #23]
    1efa:	3b20      	subs	r3, #32
    1efc:	75fb      	strb	r3, [r7, #23]
    1efe:	e00e      	b.n	1f1e <convert_code+0x29a>
					}else if (shift && (s=search_table(mcsaite_shey,c))){
    1f00:	693b      	ldr	r3, [r7, #16]
    1f02:	2b00      	cmp	r3, #0
    1f04:	d00b      	beq.n	1f1e <convert_code+0x29a>
    1f06:	7dfb      	ldrb	r3, [r7, #23]
    1f08:	4813      	ldr	r0, [pc, #76]	; (1f58 <convert_code+0x2d4>)
    1f0a:	4619      	mov	r1, r3
    1f0c:	f7ff fe9e 	bl	1c4c <search_table>
    1f10:	4603      	mov	r3, r0
    1f12:	73fb      	strb	r3, [r7, #15]
    1f14:	7bfb      	ldrb	r3, [r7, #15]
    1f16:	2b00      	cmp	r3, #0
    1f18:	d001      	beq.n	1f1e <convert_code+0x29a>
						c=s;
    1f1a:	7bfb      	ldrb	r3, [r7, #15]
    1f1c:	75fb      	strb	r3, [r7, #23]
					}
					if (c){
    1f1e:	7dfb      	ldrb	r3, [r7, #23]
    1f20:	2b00      	cmp	r3, #0
    1f22:	d021      	beq.n	1f68 <convert_code+0x2e4>
						queue[tail++]=c;
    1f24:	4b08      	ldr	r3, [pc, #32]	; (1f48 <convert_code+0x2c4>)
    1f26:	681b      	ldr	r3, [r3, #0]
    1f28:	1c5a      	adds	r2, r3, #1
    1f2a:	4907      	ldr	r1, [pc, #28]	; (1f48 <convert_code+0x2c4>)
    1f2c:	600a      	str	r2, [r1, #0]
    1f2e:	4907      	ldr	r1, [pc, #28]	; (1f4c <convert_code+0x2c8>)
    1f30:	7dfa      	ldrb	r2, [r7, #23]
    1f32:	54ca      	strb	r2, [r1, r3]
						tail&=QUEUE_SIZE-1;
    1f34:	4b04      	ldr	r3, [pc, #16]	; (1f48 <convert_code+0x2c4>)
    1f36:	681b      	ldr	r3, [r3, #0]
    1f38:	f003 031f 	and.w	r3, r3, #31
    1f3c:	4a02      	ldr	r2, [pc, #8]	; (1f48 <convert_code+0x2c4>)
    1f3e:	6013      	str	r3, [r2, #0]
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    1f40:	e013      	b.n	1f6a <convert_code+0x2e6>
    1f42:	bf00      	nop
    1f44:	20000108 	.word	0x20000108
    1f48:	20000100 	.word	0x20000100
    1f4c:	200000dc 	.word	0x200000dc
    1f50:	000032a8 	.word	0x000032a8
    1f54:	000031f0 	.word	0x000031f0
    1f58:	0000327c 	.word	0x0000327c
					if (c){
						queue[tail++]=c;
						tail&=QUEUE_SIZE-1;
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    1f5c:	4b04      	ldr	r3, [pc, #16]	; (1f70 <convert_code+0x2ec>)
    1f5e:	681b      	ldr	r3, [r3, #0]
    1f60:	f023 0303 	bic.w	r3, r3, #3
    1f64:	4a02      	ldr	r2, [pc, #8]	; (1f70 <convert_code+0x2ec>)
    1f66:	6013      	str	r3, [r2, #0]
			}
			break;
    1f68:	bf00      	nop
		}//switch
}// convert_code()
    1f6a:	3718      	adds	r7, #24
    1f6c:	46bd      	mov	sp, r7
    1f6e:	bd80      	pop	{r7, pc}
    1f70:	20000108 	.word	0x20000108

00001f74 <EXTI9_5_handler>:
#define PS2_QUEUE_SIZE (16)
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];

// signal clock du clavier PS/2
__attribute__((optimize("-O0"))) void KBD_CLK_handler(){
    1f74:	b480      	push	{r7}
    1f76:	b083      	sub	sp, #12
    1f78:	af00      	add	r7, sp, #0
	volatile  static unsigned char  in_byte=0,bit_cnt=0;
    volatile unsigned char parity; 

#define data_bit  (KBD_PORT->IDR & KBD_DAT_PIN)
	EXTI->PR|=KBD_CLK_PIN; 
    1f7a:	4a51      	ldr	r2, [pc, #324]	; (20c0 <EXTI9_5_handler+0x14c>)
    1f7c:	4b50      	ldr	r3, [pc, #320]	; (20c0 <EXTI9_5_handler+0x14c>)
    1f7e:	695b      	ldr	r3, [r3, #20]
    1f80:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1f84:	6153      	str	r3, [r2, #20]
    switch (bit_cnt){
    1f86:	4b4f      	ldr	r3, [pc, #316]	; (20c4 <EXTI9_5_handler+0x150>)
    1f88:	781b      	ldrb	r3, [r3, #0]
    1f8a:	b2db      	uxtb	r3, r3
    1f8c:	2b09      	cmp	r3, #9
    1f8e:	d01f      	beq.n	1fd0 <EXTI9_5_handler+0x5c>
    1f90:	2b0a      	cmp	r3, #10
    1f92:	d031      	beq.n	1ff8 <EXTI9_5_handler+0x84>
    1f94:	2b00      	cmp	r3, #0
    1f96:	d16c      	bne.n	2072 <EXTI9_5_handler+0xfe>
	case 0:   // start bit
		ps2_flags&=~(F_ERROR|F_RCVD);
    1f98:	4b4b      	ldr	r3, [pc, #300]	; (20c8 <EXTI9_5_handler+0x154>)
    1f9a:	781b      	ldrb	r3, [r3, #0]
    1f9c:	b2db      	uxtb	r3, r3
    1f9e:	f023 030b 	bic.w	r3, r3, #11
    1fa2:	b2da      	uxtb	r2, r3
    1fa4:	4b48      	ldr	r3, [pc, #288]	; (20c8 <EXTI9_5_handler+0x154>)
    1fa6:	701a      	strb	r2, [r3, #0]
		if (!data_bit){
    1fa8:	4b48      	ldr	r3, [pc, #288]	; (20cc <EXTI9_5_handler+0x158>)
    1faa:	689b      	ldr	r3, [r3, #8]
    1fac:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1fb0:	2b00      	cmp	r3, #0
    1fb2:	d10c      	bne.n	1fce <EXTI9_5_handler+0x5a>
			in_byte=0;
    1fb4:	4b46      	ldr	r3, [pc, #280]	; (20d0 <EXTI9_5_handler+0x15c>)
    1fb6:	2200      	movs	r2, #0
    1fb8:	701a      	strb	r2, [r3, #0]
            parity=0;
    1fba:	2300      	movs	r3, #0
    1fbc:	71fb      	strb	r3, [r7, #7]
            bit_cnt++;
    1fbe:	4b41      	ldr	r3, [pc, #260]	; (20c4 <EXTI9_5_handler+0x150>)
    1fc0:	781b      	ldrb	r3, [r3, #0]
    1fc2:	b2db      	uxtb	r3, r3
    1fc4:	3301      	adds	r3, #1
    1fc6:	b2da      	uxtb	r2, r3
    1fc8:	4b3e      	ldr	r3, [pc, #248]	; (20c4 <EXTI9_5_handler+0x150>)
    1fca:	701a      	strb	r2, [r3, #0]
        }
		break;
    1fcc:	e073      	b.n	20b6 <EXTI9_5_handler+0x142>
    1fce:	e072      	b.n	20b6 <EXTI9_5_handler+0x142>
	case 9:   // paritée
		if (data_bit) parity++;
    1fd0:	4b3e      	ldr	r3, [pc, #248]	; (20cc <EXTI9_5_handler+0x158>)
    1fd2:	689b      	ldr	r3, [r3, #8]
    1fd4:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1fd8:	2b00      	cmp	r3, #0
    1fda:	d004      	beq.n	1fe6 <EXTI9_5_handler+0x72>
    1fdc:	79fb      	ldrb	r3, [r7, #7]
    1fde:	b2db      	uxtb	r3, r3
    1fe0:	3301      	adds	r3, #1
    1fe2:	b2db      	uxtb	r3, r3
    1fe4:	71fb      	strb	r3, [r7, #7]
		if (!(parity & 1)){
    1fe6:	79fb      	ldrb	r3, [r7, #7]
			//ps2_flags |= F_ERR_PARITY;
			
		}
		bit_cnt++;
    1fe8:	4b36      	ldr	r3, [pc, #216]	; (20c4 <EXTI9_5_handler+0x150>)
    1fea:	781b      	ldrb	r3, [r3, #0]
    1fec:	b2db      	uxtb	r3, r3
    1fee:	3301      	adds	r3, #1
    1ff0:	b2da      	uxtb	r2, r3
    1ff2:	4b34      	ldr	r3, [pc, #208]	; (20c4 <EXTI9_5_handler+0x150>)
    1ff4:	701a      	strb	r2, [r3, #0]
		break;
    1ff6:	e05e      	b.n	20b6 <EXTI9_5_handler+0x142>
	case 10:  // stop bit
	    if (!data_bit){
    1ff8:	4b34      	ldr	r3, [pc, #208]	; (20cc <EXTI9_5_handler+0x158>)
    1ffa:	689b      	ldr	r3, [r3, #8]
    1ffc:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2000:	2b00      	cmp	r3, #0
    2002:	d108      	bne.n	2016 <EXTI9_5_handler+0xa2>
			ps2_flags|=F_ERR_FRAME;
    2004:	4b30      	ldr	r3, [pc, #192]	; (20c8 <EXTI9_5_handler+0x154>)
    2006:	781b      	ldrb	r3, [r3, #0]
    2008:	b2db      	uxtb	r3, r3
    200a:	f043 0308 	orr.w	r3, r3, #8
    200e:	b2da      	uxtb	r2, r3
    2010:	4b2d      	ldr	r3, [pc, #180]	; (20c8 <EXTI9_5_handler+0x154>)
    2012:	701a      	strb	r2, [r3, #0]
    2014:	e029      	b.n	206a <EXTI9_5_handler+0xf6>
		}else if (!(ps2_flags&F_ERROR)){
    2016:	4b2c      	ldr	r3, [pc, #176]	; (20c8 <EXTI9_5_handler+0x154>)
    2018:	781b      	ldrb	r3, [r3, #0]
    201a:	b2db      	uxtb	r3, r3
    201c:	f003 0309 	and.w	r3, r3, #9
    2020:	2b00      	cmp	r3, #0
    2022:	d122      	bne.n	206a <EXTI9_5_handler+0xf6>
			if (in_byte==BAT_OK){
    2024:	4b2a      	ldr	r3, [pc, #168]	; (20d0 <EXTI9_5_handler+0x15c>)
    2026:	781b      	ldrb	r3, [r3, #0]
    2028:	b2db      	uxtb	r3, r3
    202a:	2baa      	cmp	r3, #170	; 0xaa
    202c:	d108      	bne.n	2040 <EXTI9_5_handler+0xcc>
				ps2_flags|=F_BATOK;
    202e:	4b26      	ldr	r3, [pc, #152]	; (20c8 <EXTI9_5_handler+0x154>)
    2030:	781b      	ldrb	r3, [r3, #0]
    2032:	b2db      	uxtb	r3, r3
    2034:	f043 0304 	orr.w	r3, r3, #4
    2038:	b2da      	uxtb	r2, r3
    203a:	4b23      	ldr	r3, [pc, #140]	; (20c8 <EXTI9_5_handler+0x154>)
    203c:	701a      	strb	r2, [r3, #0]
    203e:	e014      	b.n	206a <EXTI9_5_handler+0xf6>
			}else{
				ps2_queue[ps2_tail++]=in_byte;
    2040:	4b24      	ldr	r3, [pc, #144]	; (20d4 <EXTI9_5_handler+0x160>)
    2042:	781b      	ldrb	r3, [r3, #0]
    2044:	b2db      	uxtb	r3, r3
    2046:	1c5a      	adds	r2, r3, #1
    2048:	b2d1      	uxtb	r1, r2
    204a:	4a22      	ldr	r2, [pc, #136]	; (20d4 <EXTI9_5_handler+0x160>)
    204c:	7011      	strb	r1, [r2, #0]
    204e:	461a      	mov	r2, r3
    2050:	4b1f      	ldr	r3, [pc, #124]	; (20d0 <EXTI9_5_handler+0x15c>)
    2052:	781b      	ldrb	r3, [r3, #0]
    2054:	b2d9      	uxtb	r1, r3
    2056:	4b20      	ldr	r3, [pc, #128]	; (20d8 <EXTI9_5_handler+0x164>)
    2058:	5499      	strb	r1, [r3, r2]
				ps2_tail&=PS2_QUEUE_SIZE-1;
    205a:	4b1e      	ldr	r3, [pc, #120]	; (20d4 <EXTI9_5_handler+0x160>)
    205c:	781b      	ldrb	r3, [r3, #0]
    205e:	b2db      	uxtb	r3, r3
    2060:	f003 030f 	and.w	r3, r3, #15
    2064:	b2da      	uxtb	r2, r3
    2066:	4b1b      	ldr	r3, [pc, #108]	; (20d4 <EXTI9_5_handler+0x160>)
    2068:	701a      	strb	r2, [r3, #0]
			}
	    }
	    bit_cnt=0;
    206a:	4b16      	ldr	r3, [pc, #88]	; (20c4 <EXTI9_5_handler+0x150>)
    206c:	2200      	movs	r2, #0
    206e:	701a      	strb	r2, [r3, #0]
		break;
    2070:	e021      	b.n	20b6 <EXTI9_5_handler+0x142>
	default:
		in_byte >>=1;
    2072:	4b17      	ldr	r3, [pc, #92]	; (20d0 <EXTI9_5_handler+0x15c>)
    2074:	781b      	ldrb	r3, [r3, #0]
    2076:	b2db      	uxtb	r3, r3
    2078:	085b      	lsrs	r3, r3, #1
    207a:	b2da      	uxtb	r2, r3
    207c:	4b14      	ldr	r3, [pc, #80]	; (20d0 <EXTI9_5_handler+0x15c>)
    207e:	701a      	strb	r2, [r3, #0]
		if(data_bit){
    2080:	4b12      	ldr	r3, [pc, #72]	; (20cc <EXTI9_5_handler+0x158>)
    2082:	689b      	ldr	r3, [r3, #8]
    2084:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2088:	2b00      	cmp	r3, #0
    208a:	d00c      	beq.n	20a6 <EXTI9_5_handler+0x132>
			in_byte |=128;
    208c:	4b10      	ldr	r3, [pc, #64]	; (20d0 <EXTI9_5_handler+0x15c>)
    208e:	781b      	ldrb	r3, [r3, #0]
    2090:	b2db      	uxtb	r3, r3
    2092:	f063 037f 	orn	r3, r3, #127	; 0x7f
    2096:	b2da      	uxtb	r2, r3
    2098:	4b0d      	ldr	r3, [pc, #52]	; (20d0 <EXTI9_5_handler+0x15c>)
    209a:	701a      	strb	r2, [r3, #0]
			parity++;
    209c:	79fb      	ldrb	r3, [r7, #7]
    209e:	b2db      	uxtb	r3, r3
    20a0:	3301      	adds	r3, #1
    20a2:	b2db      	uxtb	r3, r3
    20a4:	71fb      	strb	r3, [r7, #7]
		}
		bit_cnt++;
    20a6:	4b07      	ldr	r3, [pc, #28]	; (20c4 <EXTI9_5_handler+0x150>)
    20a8:	781b      	ldrb	r3, [r3, #0]
    20aa:	b2db      	uxtb	r3, r3
    20ac:	3301      	adds	r3, #1
    20ae:	b2da      	uxtb	r2, r3
    20b0:	4b04      	ldr	r3, [pc, #16]	; (20c4 <EXTI9_5_handler+0x150>)
    20b2:	701a      	strb	r2, [r3, #0]
		break;
    20b4:	bf00      	nop
	}
}
    20b6:	370c      	adds	r7, #12
    20b8:	46bd      	mov	sp, r7
    20ba:	f85d 7b04 	ldr.w	r7, [sp], #4
    20be:	4770      	bx	lr
    20c0:	40010400 	.word	0x40010400
    20c4:	20000120 	.word	0x20000120
    20c8:	20000104 	.word	0x20000104
    20cc:	40010800 	.word	0x40010800
    20d0:	20000121 	.word	0x20000121
    20d4:	2000010d 	.word	0x2000010d
    20d8:	20000110 	.word	0x20000110

000020dc <TIM2_handler>:

void TIM2_handler(){
    20dc:	b580      	push	{r7, lr}
    20de:	af00      	add	r7, sp, #0
	TMR2->SR&=~(BIT0); // clear interrupt bit
    20e0:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    20e4:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    20e8:	691b      	ldr	r3, [r3, #16]
    20ea:	f023 0301 	bic.w	r3, r3, #1
    20ee:	6113      	str	r3, [r2, #16]
	if (ps2_tail!=ps2_head){
    20f0:	4b0f      	ldr	r3, [pc, #60]	; (2130 <TIM2_handler+0x54>)
    20f2:	781b      	ldrb	r3, [r3, #0]
    20f4:	b2da      	uxtb	r2, r3
    20f6:	4b0f      	ldr	r3, [pc, #60]	; (2134 <TIM2_handler+0x58>)
    20f8:	781b      	ldrb	r3, [r3, #0]
    20fa:	b2db      	uxtb	r3, r3
    20fc:	429a      	cmp	r2, r3
    20fe:	d015      	beq.n	212c <TIM2_handler+0x50>
		convert_code(ps2_queue[ps2_head++]);
    2100:	4b0c      	ldr	r3, [pc, #48]	; (2134 <TIM2_handler+0x58>)
    2102:	781b      	ldrb	r3, [r3, #0]
    2104:	b2db      	uxtb	r3, r3
    2106:	1c5a      	adds	r2, r3, #1
    2108:	b2d1      	uxtb	r1, r2
    210a:	4a0a      	ldr	r2, [pc, #40]	; (2134 <TIM2_handler+0x58>)
    210c:	7011      	strb	r1, [r2, #0]
    210e:	461a      	mov	r2, r3
    2110:	4b09      	ldr	r3, [pc, #36]	; (2138 <TIM2_handler+0x5c>)
    2112:	5c9b      	ldrb	r3, [r3, r2]
    2114:	b2db      	uxtb	r3, r3
    2116:	4618      	mov	r0, r3
    2118:	f7ff fdb4 	bl	1c84 <convert_code>
		ps2_head&=PS2_QUEUE_SIZE-1;
    211c:	4b05      	ldr	r3, [pc, #20]	; (2134 <TIM2_handler+0x58>)
    211e:	781b      	ldrb	r3, [r3, #0]
    2120:	b2db      	uxtb	r3, r3
    2122:	f003 030f 	and.w	r3, r3, #15
    2126:	b2da      	uxtb	r2, r3
    2128:	4b02      	ldr	r3, [pc, #8]	; (2134 <TIM2_handler+0x58>)
    212a:	701a      	strb	r2, [r3, #0]
	}
}
    212c:	bd80      	pop	{r7, pc}
    212e:	bf00      	nop
    2130:	2000010d 	.word	0x2000010d
    2134:	2000010c 	.word	0x2000010c
    2138:	20000110 	.word	0x20000110

0000213c <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    213c:	b480      	push	{r7}
    213e:	b083      	sub	sp, #12
    2140:	af00      	add	r7, sp, #0
    2142:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    2144:	687b      	ldr	r3, [r7, #4]
    2146:	2b3b      	cmp	r3, #59	; 0x3b
    2148:	d900      	bls.n	214c <enable_interrupt+0x10>
    214a:	e016      	b.n	217a <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    214c:	687b      	ldr	r3, [r7, #4]
    214e:	095b      	lsrs	r3, r3, #5
    2150:	009b      	lsls	r3, r3, #2
    2152:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2156:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    215a:	687a      	ldr	r2, [r7, #4]
    215c:	0952      	lsrs	r2, r2, #5
    215e:	0092      	lsls	r2, r2, #2
    2160:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    2164:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    2168:	6812      	ldr	r2, [r2, #0]
    216a:	6879      	ldr	r1, [r7, #4]
    216c:	f001 011f 	and.w	r1, r1, #31
    2170:	2001      	movs	r0, #1
    2172:	fa00 f101 	lsl.w	r1, r0, r1
    2176:	430a      	orrs	r2, r1
    2178:	601a      	str	r2, [r3, #0]
}
    217a:	370c      	adds	r7, #12
    217c:	46bd      	mov	sp, r7
    217e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2182:	4770      	bx	lr

00002184 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    2184:	b480      	push	{r7}
    2186:	b083      	sub	sp, #12
    2188:	af00      	add	r7, sp, #0
    218a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    218c:	687b      	ldr	r3, [r7, #4]
    218e:	2b3b      	cmp	r3, #59	; 0x3b
    2190:	d900      	bls.n	2194 <disable_interrupt+0x10>
    2192:	e013      	b.n	21bc <disable_interrupt+0x38>
	ICER[irq>>5]&=~(1<<(irq&0x1f));
    2194:	687b      	ldr	r3, [r7, #4]
    2196:	095b      	lsrs	r3, r3, #5
    2198:	009a      	lsls	r2, r3, #2
    219a:	4b0b      	ldr	r3, [pc, #44]	; (21c8 <disable_interrupt+0x44>)
    219c:	4413      	add	r3, r2
    219e:	687a      	ldr	r2, [r7, #4]
    21a0:	0952      	lsrs	r2, r2, #5
    21a2:	0091      	lsls	r1, r2, #2
    21a4:	4a08      	ldr	r2, [pc, #32]	; (21c8 <disable_interrupt+0x44>)
    21a6:	440a      	add	r2, r1
    21a8:	6812      	ldr	r2, [r2, #0]
    21aa:	6879      	ldr	r1, [r7, #4]
    21ac:	f001 011f 	and.w	r1, r1, #31
    21b0:	2001      	movs	r0, #1
    21b2:	fa00 f101 	lsl.w	r1, r0, r1
    21b6:	43c9      	mvns	r1, r1
    21b8:	400a      	ands	r2, r1
    21ba:	601a      	str	r2, [r3, #0]
}
    21bc:	370c      	adds	r7, #12
    21be:	46bd      	mov	sp, r7
    21c0:	f85d 7b04 	ldr.w	r7, [sp], #4
    21c4:	4770      	bx	lr
    21c6:	bf00      	nop
    21c8:	e000e180 	.word	0xe000e180

000021cc <get_pending>:

unsigned get_pending(unsigned irq){
    21cc:	b480      	push	{r7}
    21ce:	b083      	sub	sp, #12
    21d0:	af00      	add	r7, sp, #0
    21d2:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    21d4:	687b      	ldr	r3, [r7, #4]
    21d6:	2b3b      	cmp	r3, #59	; 0x3b
    21d8:	d901      	bls.n	21de <get_pending+0x12>
    21da:	2300      	movs	r3, #0
    21dc:	e00c      	b.n	21f8 <get_pending+0x2c>
	return ICPR[irq>>5]&(1<<(irq&0x1f));
    21de:	687b      	ldr	r3, [r7, #4]
    21e0:	095b      	lsrs	r3, r3, #5
    21e2:	009a      	lsls	r2, r3, #2
    21e4:	4b07      	ldr	r3, [pc, #28]	; (2204 <get_pending+0x38>)
    21e6:	4413      	add	r3, r2
    21e8:	681b      	ldr	r3, [r3, #0]
    21ea:	687a      	ldr	r2, [r7, #4]
    21ec:	f002 021f 	and.w	r2, r2, #31
    21f0:	2101      	movs	r1, #1
    21f2:	fa01 f202 	lsl.w	r2, r1, r2
    21f6:	4013      	ands	r3, r2
}
    21f8:	4618      	mov	r0, r3
    21fa:	370c      	adds	r7, #12
    21fc:	46bd      	mov	sp, r7
    21fe:	f85d 7b04 	ldr.w	r7, [sp], #4
    2202:	4770      	bx	lr
    2204:	e000e280 	.word	0xe000e280

00002208 <get_active>:

unsigned get_active(unsigned irq){
    2208:	b480      	push	{r7}
    220a:	b083      	sub	sp, #12
    220c:	af00      	add	r7, sp, #0
    220e:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    2210:	687b      	ldr	r3, [r7, #4]
    2212:	2b3b      	cmp	r3, #59	; 0x3b
    2214:	d901      	bls.n	221a <get_active+0x12>
    2216:	2300      	movs	r3, #0
    2218:	e00e      	b.n	2238 <get_active+0x30>
	return IABR[irq>>5]&(1<<(irq&0x1f));
    221a:	687b      	ldr	r3, [r7, #4]
    221c:	095b      	lsrs	r3, r3, #5
    221e:	009b      	lsls	r3, r3, #2
    2220:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2224:	f503 4363 	add.w	r3, r3, #58112	; 0xe300
    2228:	681b      	ldr	r3, [r3, #0]
    222a:	687a      	ldr	r2, [r7, #4]
    222c:	f002 021f 	and.w	r2, r2, #31
    2230:	2101      	movs	r1, #1
    2232:	fa01 f202 	lsl.w	r2, r1, r2
    2236:	4013      	ands	r3, r2
}
    2238:	4618      	mov	r0, r3
    223a:	370c      	adds	r7, #12
    223c:	46bd      	mov	sp, r7
    223e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2242:	4770      	bx	lr

00002244 <set_pending>:

void set_pending(unsigned irq){
    2244:	b480      	push	{r7}
    2246:	b083      	sub	sp, #12
    2248:	af00      	add	r7, sp, #0
    224a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    224c:	687b      	ldr	r3, [r7, #4]
    224e:	2b3b      	cmp	r3, #59	; 0x3b
    2250:	d900      	bls.n	2254 <set_pending+0x10>
    2252:	e016      	b.n	2282 <set_pending+0x3e>
	ISPR[irq>>5]|=1<<(irq&0x1f);
    2254:	687b      	ldr	r3, [r7, #4]
    2256:	095b      	lsrs	r3, r3, #5
    2258:	009b      	lsls	r3, r3, #2
    225a:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    225e:	f503 4362 	add.w	r3, r3, #57856	; 0xe200
    2262:	687a      	ldr	r2, [r7, #4]
    2264:	0952      	lsrs	r2, r2, #5
    2266:	0092      	lsls	r2, r2, #2
    2268:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    226c:	f502 4262 	add.w	r2, r2, #57856	; 0xe200
    2270:	6812      	ldr	r2, [r2, #0]
    2272:	6879      	ldr	r1, [r7, #4]
    2274:	f001 011f 	and.w	r1, r1, #31
    2278:	2001      	movs	r0, #1
    227a:	fa00 f101 	lsl.w	r1, r0, r1
    227e:	430a      	orrs	r2, r1
    2280:	601a      	str	r2, [r3, #0]
}
    2282:	370c      	adds	r7, #12
    2284:	46bd      	mov	sp, r7
    2286:	f85d 7b04 	ldr.w	r7, [sp], #4
    228a:	4770      	bx	lr

0000228c <clear_pending>:

void clear_pending(unsigned irq){
    228c:	b480      	push	{r7}
    228e:	b083      	sub	sp, #12
    2290:	af00      	add	r7, sp, #0
    2292:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    2294:	687b      	ldr	r3, [r7, #4]
    2296:	2b3b      	cmp	r3, #59	; 0x3b
    2298:	d900      	bls.n	229c <clear_pending+0x10>
    229a:	e013      	b.n	22c4 <clear_pending+0x38>
	ICPR[irq>>5]&=~(1<<(irq&0x1f));
    229c:	687b      	ldr	r3, [r7, #4]
    229e:	095b      	lsrs	r3, r3, #5
    22a0:	009a      	lsls	r2, r3, #2
    22a2:	4b0b      	ldr	r3, [pc, #44]	; (22d0 <clear_pending+0x44>)
    22a4:	4413      	add	r3, r2
    22a6:	687a      	ldr	r2, [r7, #4]
    22a8:	0952      	lsrs	r2, r2, #5
    22aa:	0091      	lsls	r1, r2, #2
    22ac:	4a08      	ldr	r2, [pc, #32]	; (22d0 <clear_pending+0x44>)
    22ae:	440a      	add	r2, r1
    22b0:	6812      	ldr	r2, [r2, #0]
    22b2:	6879      	ldr	r1, [r7, #4]
    22b4:	f001 011f 	and.w	r1, r1, #31
    22b8:	2001      	movs	r0, #1
    22ba:	fa00 f101 	lsl.w	r1, r0, r1
    22be:	43c9      	mvns	r1, r1
    22c0:	400a      	ands	r2, r1
    22c2:	601a      	str	r2, [r3, #0]
}
    22c4:	370c      	adds	r7, #12
    22c6:	46bd      	mov	sp, r7
    22c8:	f85d 7b04 	ldr.w	r7, [sp], #4
    22cc:	4770      	bx	lr
    22ce:	bf00      	nop
    22d0:	e000e280 	.word	0xe000e280

000022d4 <set_int_priority>:


void set_int_priority(int32_t irq, unsigned priority){
    22d4:	b480      	push	{r7}
    22d6:	b083      	sub	sp, #12
    22d8:	af00      	add	r7, sp, #0
    22da:	6078      	str	r0, [r7, #4]
    22dc:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    22de:	687b      	ldr	r3, [r7, #4]
    22e0:	2b00      	cmp	r3, #0
    22e2:	db0d      	blt.n	2300 <set_int_priority+0x2c>
    22e4:	687b      	ldr	r3, [r7, #4]
    22e6:	2b3b      	cmp	r3, #59	; 0x3b
    22e8:	dc0a      	bgt.n	2300 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    22ea:	687b      	ldr	r3, [r7, #4]
    22ec:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    22f0:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    22f4:	683a      	ldr	r2, [r7, #0]
    22f6:	b2d2      	uxtb	r2, r2
    22f8:	0112      	lsls	r2, r2, #4
    22fa:	b2d2      	uxtb	r2, r2
    22fc:	701a      	strb	r2, [r3, #0]
    22fe:	e012      	b.n	2326 <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    2300:	687b      	ldr	r3, [r7, #4]
    2302:	2b00      	cmp	r3, #0
    2304:	da0f      	bge.n	2326 <set_int_priority+0x52>
    2306:	687b      	ldr	r3, [r7, #4]
    2308:	f113 0f0f 	cmn.w	r3, #15
    230c:	db0b      	blt.n	2326 <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    230e:	687a      	ldr	r2, [r7, #4]
    2310:	f06f 0303 	mvn.w	r3, #3
    2314:	1a9b      	subs	r3, r3, r2
    2316:	461a      	mov	r2, r3
    2318:	4b05      	ldr	r3, [pc, #20]	; (2330 <set_int_priority+0x5c>)
    231a:	4413      	add	r3, r2
    231c:	683a      	ldr	r2, [r7, #0]
    231e:	b2d2      	uxtb	r2, r2
    2320:	0112      	lsls	r2, r2, #4
    2322:	b2d2      	uxtb	r2, r2
    2324:	701a      	strb	r2, [r3, #0]
	}
}
    2326:	370c      	adds	r7, #12
    2328:	46bd      	mov	sp, r7
    232a:	f85d 7b04 	ldr.w	r7, [sp], #4
    232e:	4770      	bx	lr
    2330:	e000ed18 	.word	0xe000ed18

00002334 <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    2334:	b480      	push	{r7}
    2336:	b083      	sub	sp, #12
    2338:	af00      	add	r7, sp, #0
    233a:	6078      	str	r0, [r7, #4]
    233c:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    233e:	687b      	ldr	r3, [r7, #4]
    2340:	881b      	ldrh	r3, [r3, #0]
    2342:	b29b      	uxth	r3, r3
    2344:	f423 63e0 	bic.w	r3, r3, #1792	; 0x700
    2348:	b29a      	uxth	r2, r3
    234a:	687b      	ldr	r3, [r7, #4]
    234c:	801a      	strh	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    234e:	687b      	ldr	r3, [r7, #4]
    2350:	881b      	ldrh	r3, [r3, #0]
    2352:	b29a      	uxth	r2, r3
    2354:	683b      	ldr	r3, [r7, #0]
    2356:	b29b      	uxth	r3, r3
    2358:	00db      	lsls	r3, r3, #3
    235a:	b29b      	uxth	r3, r3
    235c:	4313      	orrs	r3, r2
    235e:	b29a      	uxth	r2, r3
    2360:	687b      	ldr	r3, [r7, #4]
    2362:	801a      	strh	r2, [r3, #0]
}
    2364:	370c      	adds	r7, #12
    2366:	46bd      	mov	sp, r7
    2368:	f85d 7b04 	ldr.w	r7, [sp], #4
    236c:	4770      	bx	lr
    236e:	bf00      	nop

00002370 <spi_init>:


void spi_init(spi_sfr_t* channel, unsigned baud){
    2370:	b580      	push	{r7, lr}
    2372:	b082      	sub	sp, #8
    2374:	af00      	add	r7, sp, #0
    2376:	6078      	str	r0, [r7, #4]
    2378:	6039      	str	r1, [r7, #0]
	spi_baudrate(channel,baud);
    237a:	6878      	ldr	r0, [r7, #4]
    237c:	6839      	ldr	r1, [r7, #0]
    237e:	f7ff ffd9 	bl	2334 <spi_baudrate>
	channel->CR1=SPI_CR1_MSTR|SPI_CR1_SSM;
    2382:	687b      	ldr	r3, [r7, #4]
    2384:	f44f 7201 	mov.w	r2, #516	; 0x204
    2388:	801a      	strh	r2, [r3, #0]
	//channel->CR2|=SPI_CR2_SSOE;
	if (channel==SPI1){
    238a:	687b      	ldr	r3, [r7, #4]
    238c:	4a17      	ldr	r2, [pc, #92]	; (23ec <spi_init+0x7c>)
    238e:	4293      	cmp	r3, r2
    2390:	d114      	bne.n	23bc <spi_init+0x4c>
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(PORTA,4,OUTPUT_PP_FAST);
    2392:	4817      	ldr	r0, [pc, #92]	; (23f0 <spi_init+0x80>)
    2394:	2104      	movs	r1, #4
    2396:	2203      	movs	r2, #3
    2398:	f7ff fb68 	bl	1a6c <config_pin>
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(PORTA,5,OUTPUT_PP_FAST);
    239c:	4814      	ldr	r0, [pc, #80]	; (23f0 <spi_init+0x80>)
    239e:	2105      	movs	r1, #5
    23a0:	2203      	movs	r2, #3
    23a2:	f7ff fb63 	bl	1a6c <config_pin>
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(PORTA,6,INPUT_FLOAT);
    23a6:	4812      	ldr	r0, [pc, #72]	; (23f0 <spi_init+0x80>)
    23a8:	2106      	movs	r1, #6
    23aa:	2204      	movs	r2, #4
    23ac:	f7ff fb5e 	bl	1a6c <config_pin>
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(PORTA,7,OUTPUT_PP_FAST);
    23b0:	480f      	ldr	r0, [pc, #60]	; (23f0 <spi_init+0x80>)
    23b2:	2107      	movs	r1, #7
    23b4:	2203      	movs	r2, #3
    23b6:	f7ff fb59 	bl	1a6c <config_pin>
    23ba:	e013      	b.n	23e4 <spi_init+0x74>
	}else{
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(PORTB,2,OUTPUT_PP_FAST);
    23bc:	480d      	ldr	r0, [pc, #52]	; (23f4 <spi_init+0x84>)
    23be:	2102      	movs	r1, #2
    23c0:	2203      	movs	r2, #3
    23c2:	f7ff fb53 	bl	1a6c <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(PORTB,13,OUTPUT_PP_FAST);
    23c6:	480b      	ldr	r0, [pc, #44]	; (23f4 <spi_init+0x84>)
    23c8:	210d      	movs	r1, #13
    23ca:	2203      	movs	r2, #3
    23cc:	f7ff fb4e 	bl	1a6c <config_pin>
		// PB14 MISO input (floating)
		config_pin(PORTB,14,INPUT_FLOAT);
    23d0:	4808      	ldr	r0, [pc, #32]	; (23f4 <spi_init+0x84>)
    23d2:	210e      	movs	r1, #14
    23d4:	2204      	movs	r2, #4
    23d6:	f7ff fb49 	bl	1a6c <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(PORTB,15,OUTPUT_PP_FAST);
    23da:	4806      	ldr	r0, [pc, #24]	; (23f4 <spi_init+0x84>)
    23dc:	210f      	movs	r1, #15
    23de:	2203      	movs	r2, #3
    23e0:	f7ff fb44 	bl	1a6c <config_pin>
	}
}
    23e4:	3708      	adds	r7, #8
    23e6:	46bd      	mov	sp, r7
    23e8:	bd80      	pop	{r7, pc}
    23ea:	bf00      	nop
    23ec:	40013000 	.word	0x40013000
    23f0:	40010800 	.word	0x40010800
    23f4:	40010c00 	.word	0x40010c00

000023f8 <spi_enable>:

void spi_enable(spi_sfr_t* channel, unsigned mode){
    23f8:	b480      	push	{r7}
    23fa:	b083      	sub	sp, #12
    23fc:	af00      	add	r7, sp, #0
    23fe:	6078      	str	r0, [r7, #4]
    2400:	6039      	str	r1, [r7, #0]
	switch (mode){
    2402:	683b      	ldr	r3, [r7, #0]
    2404:	2b01      	cmp	r3, #1
    2406:	d00d      	beq.n	2424 <spi_enable+0x2c>
    2408:	2b01      	cmp	r3, #1
    240a:	d302      	bcc.n	2412 <spi_enable+0x1a>
    240c:	2b02      	cmp	r3, #2
    240e:	d005      	beq.n	241c <spi_enable+0x24>
    2410:	e00d      	b.n	242e <spi_enable+0x36>
		case SPI_MODE_READ:
		channel->CR1=SPI_CR1_RXONLY|SPI_CR1_SPE;
    2412:	687b      	ldr	r3, [r7, #4]
    2414:	f44f 6288 	mov.w	r2, #1088	; 0x440
    2418:	801a      	strh	r2, [r3, #0]
		break;
    241a:	e008      	b.n	242e <spi_enable+0x36>
		case SPI_MODE_READ_WRITE:
		channel->CR1=SPI_CR1_SPE;
    241c:	687b      	ldr	r3, [r7, #4]
    241e:	2240      	movs	r2, #64	; 0x40
    2420:	801a      	strh	r2, [r3, #0]
		break;
    2422:	e004      	b.n	242e <spi_enable+0x36>
		case SPI_MODE_WRITE:
		channel->CR1=SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE|SPI_CR1_SPE;
    2424:	687b      	ldr	r3, [r7, #4]
    2426:	f24c 0240 	movw	r2, #49216	; 0xc040
    242a:	801a      	strh	r2, [r3, #0]
		break;
    242c:	bf00      	nop
	}
}
    242e:	370c      	adds	r7, #12
    2430:	46bd      	mov	sp, r7
    2432:	f85d 7b04 	ldr.w	r7, [sp], #4
    2436:	4770      	bx	lr

00002438 <spi_disable>:

void spi_disable(spi_sfr_t* channel){
    2438:	b480      	push	{r7}
    243a:	b083      	sub	sp, #12
    243c:	af00      	add	r7, sp, #0
    243e:	6078      	str	r0, [r7, #4]
	channel->CR1&=~SPI_CR1_SPE;
    2440:	687b      	ldr	r3, [r7, #4]
    2442:	881b      	ldrh	r3, [r3, #0]
    2444:	b29b      	uxth	r3, r3
    2446:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    244a:	b29a      	uxth	r2, r3
    244c:	687b      	ldr	r3, [r7, #4]
    244e:	801a      	strh	r2, [r3, #0]
}
    2450:	370c      	adds	r7, #12
    2452:	46bd      	mov	sp, r7
    2454:	f85d 7b04 	ldr.w	r7, [sp], #4
    2458:	4770      	bx	lr
    245a:	bf00      	nop

0000245c <spi_write>:

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
    245c:	b580      	push	{r7, lr}
    245e:	b082      	sub	sp, #8
    2460:	af00      	add	r7, sp, #0
    2462:	6078      	str	r0, [r7, #4]
    2464:	460b      	mov	r3, r1
    2466:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
    2468:	6878      	ldr	r0, [r7, #4]
    246a:	2101      	movs	r1, #1
    246c:	f7ff ffc4 	bl	23f8 <spi_enable>
	channel->DR=b;
    2470:	78fb      	ldrb	r3, [r7, #3]
    2472:	b29a      	uxth	r2, r3
    2474:	687b      	ldr	r3, [r7, #4]
    2476:	819a      	strh	r2, [r3, #12]
	spi_disable(channel);
    2478:	6878      	ldr	r0, [r7, #4]
    247a:	f7ff ffdd 	bl	2438 <spi_disable>
}
    247e:	3708      	adds	r7, #8
    2480:	46bd      	mov	sp, r7
    2482:	bd80      	pop	{r7, pc}

00002484 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    2484:	b580      	push	{r7, lr}
    2486:	b084      	sub	sp, #16
    2488:	af00      	add	r7, sp, #0
    248a:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
    248c:	6878      	ldr	r0, [r7, #4]
    248e:	2100      	movs	r1, #0
    2490:	f7ff ffb2 	bl	23f8 <spi_enable>
	channel->DR=255;
    2494:	687b      	ldr	r3, [r7, #4]
    2496:	22ff      	movs	r2, #255	; 0xff
    2498:	819a      	strh	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    249a:	bf00      	nop
    249c:	687b      	ldr	r3, [r7, #4]
    249e:	891b      	ldrh	r3, [r3, #8]
    24a0:	b29b      	uxth	r3, r3
    24a2:	f003 0301 	and.w	r3, r3, #1
    24a6:	2b00      	cmp	r3, #0
    24a8:	d0f8      	beq.n	249c <spi_read+0x18>
	rx=(uint8_t)channel->DR;
    24aa:	687b      	ldr	r3, [r7, #4]
    24ac:	899b      	ldrh	r3, [r3, #12]
    24ae:	b29b      	uxth	r3, r3
    24b0:	73fb      	strb	r3, [r7, #15]
	spi_disable(channel);
    24b2:	6878      	ldr	r0, [r7, #4]
    24b4:	f7ff ffc0 	bl	2438 <spi_disable>
	return rx;
    24b8:	7bfb      	ldrb	r3, [r7, #15]
}
    24ba:	4618      	mov	r0, r3
    24bc:	3710      	adds	r7, #16
    24be:	46bd      	mov	sp, r7
    24c0:	bd80      	pop	{r7, pc}
    24c2:	bf00      	nop

000024c4 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    24c4:	b580      	push	{r7, lr}
    24c6:	b084      	sub	sp, #16
    24c8:	af00      	add	r7, sp, #0
    24ca:	60f8      	str	r0, [r7, #12]
    24cc:	60b9      	str	r1, [r7, #8]
    24ce:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_WRITE);
    24d0:	68f8      	ldr	r0, [r7, #12]
    24d2:	2101      	movs	r1, #1
    24d4:	f7ff ff90 	bl	23f8 <spi_enable>
	while (count){
    24d8:	e011      	b.n	24fe <spi_block_write+0x3a>
		channel->DR=*buffer++;
    24da:	68bb      	ldr	r3, [r7, #8]
    24dc:	1c5a      	adds	r2, r3, #1
    24de:	60ba      	str	r2, [r7, #8]
    24e0:	781b      	ldrb	r3, [r3, #0]
    24e2:	b29a      	uxth	r2, r3
    24e4:	68fb      	ldr	r3, [r7, #12]
    24e6:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    24e8:	bf00      	nop
    24ea:	68fb      	ldr	r3, [r7, #12]
    24ec:	891b      	ldrh	r3, [r3, #8]
    24ee:	b29b      	uxth	r3, r3
    24f0:	f003 0302 	and.w	r3, r3, #2
    24f4:	2b00      	cmp	r3, #0
    24f6:	d0f8      	beq.n	24ea <spi_block_write+0x26>
		count--;
    24f8:	687b      	ldr	r3, [r7, #4]
    24fa:	3b01      	subs	r3, #1
    24fc:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_enable(channel,SPI_MODE_WRITE);
	while (count){
    24fe:	687b      	ldr	r3, [r7, #4]
    2500:	2b00      	cmp	r3, #0
    2502:	d1ea      	bne.n	24da <spi_block_write+0x16>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	spi_disable(channel);
    2504:	68f8      	ldr	r0, [r7, #12]
    2506:	f7ff ff97 	bl	2438 <spi_disable>
}
    250a:	3710      	adds	r7, #16
    250c:	46bd      	mov	sp, r7
    250e:	bd80      	pop	{r7, pc}

00002510 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    2510:	b580      	push	{r7, lr}
    2512:	b084      	sub	sp, #16
    2514:	af00      	add	r7, sp, #0
    2516:	60f8      	str	r0, [r7, #12]
    2518:	60b9      	str	r1, [r7, #8]
    251a:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_READ);
    251c:	68f8      	ldr	r0, [r7, #12]
    251e:	2100      	movs	r1, #0
    2520:	f7ff ff6a 	bl	23f8 <spi_enable>
	while (count){
    2524:	e015      	b.n	2552 <spi_block_read+0x42>
		channel->DR=0;
    2526:	68fb      	ldr	r3, [r7, #12]
    2528:	2200      	movs	r2, #0
    252a:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    252c:	bf00      	nop
    252e:	68fb      	ldr	r3, [r7, #12]
    2530:	891b      	ldrh	r3, [r3, #8]
    2532:	b29b      	uxth	r3, r3
    2534:	f003 0301 	and.w	r3, r3, #1
    2538:	2b00      	cmp	r3, #0
    253a:	d0f8      	beq.n	252e <spi_block_read+0x1e>
		*buffer++=(uint8_t)channel->DR;
    253c:	68bb      	ldr	r3, [r7, #8]
    253e:	1c5a      	adds	r2, r3, #1
    2540:	60ba      	str	r2, [r7, #8]
    2542:	68fa      	ldr	r2, [r7, #12]
    2544:	8992      	ldrh	r2, [r2, #12]
    2546:	b292      	uxth	r2, r2
    2548:	b2d2      	uxtb	r2, r2
    254a:	701a      	strb	r2, [r3, #0]
		count--;
    254c:	687b      	ldr	r3, [r7, #4]
    254e:	3b01      	subs	r3, #1
    2550:	607b      	str	r3, [r7, #4]
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_enable(channel,SPI_MODE_READ);
	while (count){
    2552:	687b      	ldr	r3, [r7, #4]
    2554:	2b00      	cmp	r3, #0
    2556:	d1e6      	bne.n	2526 <spi_block_read+0x16>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
	spi_disable(channel);
    2558:	68f8      	ldr	r0, [r7, #12]
    255a:	f7ff ff6d 	bl	2438 <spi_disable>
}
    255e:	3710      	adds	r7, #16
    2560:	46bd      	mov	sp, r7
    2562:	bd80      	pop	{r7, pc}

00002564 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    2564:	4b01      	ldr	r3, [pc, #4]	; (256c <reset_mcu+0x8>)
    2566:	4a02      	ldr	r2, [pc, #8]	; (2570 <reset_mcu+0xc>)
    2568:	601a      	str	r2, [r3, #0]
    256a:	bf00      	nop
    256c:	e000ed0c 	.word	0xe000ed0c
    2570:	05fa0004 	.word	0x05fa0004

00002574 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    2574:	b580      	push	{r7, lr}
    2576:	b082      	sub	sp, #8
    2578:	af00      	add	r7, sp, #0
    257a:	6078      	str	r0, [r7, #4]
    257c:	6039      	str	r1, [r7, #0]
	print(msg);
    257e:	6878      	ldr	r0, [r7, #4]
    2580:	f7fe fd94 	bl	10ac <print>
	print("at address ");
    2584:	4814      	ldr	r0, [pc, #80]	; (25d8 <print_fault+0x64>)
    2586:	f7fe fd91 	bl	10ac <print>
	if (adr) {
    258a:	683b      	ldr	r3, [r7, #0]
    258c:	2b00      	cmp	r3, #0
    258e:	d002      	beq.n	2596 <print_fault+0x22>
		print_hex(adr);
    2590:	6838      	ldr	r0, [r7, #0]
    2592:	f7fe fef9 	bl	1388 <print_hex>
	};
	conout(CR);
    2596:	200d      	movs	r0, #13
    2598:	f7fe fd56 	bl	1048 <conout>
	print("UFSR=");
    259c:	480f      	ldr	r0, [pc, #60]	; (25dc <print_fault+0x68>)
    259e:	f7fe fd85 	bl	10ac <print>
	print_hex(CFSR->fsr.usageFalt);
    25a2:	4b0f      	ldr	r3, [pc, #60]	; (25e0 <print_fault+0x6c>)
    25a4:	681b      	ldr	r3, [r3, #0]
    25a6:	0c1b      	lsrs	r3, r3, #16
    25a8:	b29b      	uxth	r3, r3
    25aa:	4618      	mov	r0, r3
    25ac:	f7fe feec 	bl	1388 <print_hex>
	print(", BFSR=");
    25b0:	480c      	ldr	r0, [pc, #48]	; (25e4 <print_fault+0x70>)
    25b2:	f7fe fd7b 	bl	10ac <print>
	print_hex(CFSR->fsr.busFault);
    25b6:	4b0a      	ldr	r3, [pc, #40]	; (25e0 <print_fault+0x6c>)
    25b8:	681b      	ldr	r3, [r3, #0]
    25ba:	0a1b      	lsrs	r3, r3, #8
    25bc:	b2db      	uxtb	r3, r3
    25be:	4618      	mov	r0, r3
    25c0:	f7fe fee2 	bl	1388 <print_hex>
	print(", MMFSR=");
    25c4:	4808      	ldr	r0, [pc, #32]	; (25e8 <print_fault+0x74>)
    25c6:	f7fe fd71 	bl	10ac <print>
	print_hex(CFSR->fsr.mmFault);
    25ca:	4b05      	ldr	r3, [pc, #20]	; (25e0 <print_fault+0x6c>)
    25cc:	681b      	ldr	r3, [r3, #0]
    25ce:	b2db      	uxtb	r3, r3
    25d0:	4618      	mov	r0, r3
    25d2:	f7fe fed9 	bl	1388 <print_hex>
	while(1);
    25d6:	e7fe      	b.n	25d6 <print_fault+0x62>
    25d8:	000032a8 	.word	0x000032a8
    25dc:	000032b4 	.word	0x000032b4
    25e0:	e000ed28 	.word	0xe000ed28
    25e4:	000032bc 	.word	0x000032bc
    25e8:	000032c4 	.word	0x000032c4

000025ec <config_systicks>:


// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
#define MSEC_DLY FCLK/8/1000
void config_systicks(){
    25ec:	b580      	push	{r7, lr}
    25ee:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,9);
    25f0:	f06f 000e 	mvn.w	r0, #14
    25f4:	2109      	movs	r1, #9
    25f6:	f7ff fe6d 	bl	22d4 <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
    25fa:	4b04      	ldr	r3, [pc, #16]	; (260c <config_systicks+0x20>)
    25fc:	f641 32f6 	movw	r2, #7158	; 0x1bf6
    2600:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
    2602:	4b03      	ldr	r3, [pc, #12]	; (2610 <config_systicks+0x24>)
    2604:	2203      	movs	r2, #3
    2606:	601a      	str	r2, [r3, #0]
}
    2608:	bd80      	pop	{r7, pc}
    260a:	bf00      	nop
    260c:	e000e014 	.word	0xe000e014
    2610:	e000e010 	.word	0xe000e010

00002614 <pause>:



void pause(unsigned msec){
    2614:	b480      	push	{r7}
    2616:	b083      	sub	sp, #12
    2618:	af00      	add	r7, sp, #0
    261a:	6078      	str	r0, [r7, #4]
	timer=msec;
    261c:	4a06      	ldr	r2, [pc, #24]	; (2638 <pause+0x24>)
    261e:	687b      	ldr	r3, [r7, #4]
    2620:	6013      	str	r3, [r2, #0]
	while (timer);
    2622:	bf00      	nop
    2624:	4b04      	ldr	r3, [pc, #16]	; (2638 <pause+0x24>)
    2626:	681b      	ldr	r3, [r3, #0]
    2628:	2b00      	cmp	r3, #0
    262a:	d1fb      	bne.n	2624 <pause+0x10>
}
    262c:	370c      	adds	r7, #12
    262e:	46bd      	mov	sp, r7
    2630:	f85d 7b04 	ldr.w	r7, [sp], #4
    2634:	4770      	bx	lr
    2636:	bf00      	nop
    2638:	20000128 	.word	0x20000128

0000263c <STK_handler>:


// interruption coretimer
void STK_handler(){
    263c:	b480      	push	{r7}
    263e:	af00      	add	r7, sp, #0
	ticks++;
    2640:	4b08      	ldr	r3, [pc, #32]	; (2664 <STK_handler+0x28>)
    2642:	681b      	ldr	r3, [r3, #0]
    2644:	3301      	adds	r3, #1
    2646:	4a07      	ldr	r2, [pc, #28]	; (2664 <STK_handler+0x28>)
    2648:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
    264a:	4b07      	ldr	r3, [pc, #28]	; (2668 <STK_handler+0x2c>)
    264c:	681b      	ldr	r3, [r3, #0]
    264e:	2b00      	cmp	r3, #0
    2650:	d004      	beq.n	265c <STK_handler+0x20>
    2652:	4b05      	ldr	r3, [pc, #20]	; (2668 <STK_handler+0x2c>)
    2654:	681b      	ldr	r3, [r3, #0]
    2656:	3b01      	subs	r3, #1
    2658:	4a03      	ldr	r2, [pc, #12]	; (2668 <STK_handler+0x2c>)
    265a:	6013      	str	r3, [r2, #0]
}
    265c:	46bd      	mov	sp, r7
    265e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2662:	4770      	bx	lr
    2664:	20000124 	.word	0x20000124
    2668:	20000128 	.word	0x20000128

0000266c <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    266c:	b480      	push	{r7}
    266e:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    2670:	2300      	movs	r3, #0
    2672:	2200      	movs	r2, #0
    2674:	4618      	mov	r0, r3
    2676:	4611      	mov	r1, r2
    2678:	df02      	svc	2
}
    267a:	46bd      	mov	sp, r7
    267c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2680:	4770      	bx	lr
    2682:	bf00      	nop

00002684 <tvout_init>:

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
    2684:	b580      	push	{r7, lr}
    2686:	b082      	sub	sp, #8
    2688:	af00      	add	r7, sp, #0
	//sortie sync sur PA8
	config_pin(PORTA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    268a:	4850      	ldr	r0, [pc, #320]	; (27cc <tvout_init+0x148>)
    268c:	2108      	movs	r1, #8
    268e:	220a      	movs	r2, #10
    2690:	f7ff f9ec 	bl	1a6c <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    2694:	484e      	ldr	r0, [pc, #312]	; (27d0 <tvout_init+0x14c>)
    2696:	210f      	movs	r1, #15
    2698:	220b      	movs	r2, #11
    269a:	f7ff f9e7 	bl	1a6c <config_pin>
	PORTB->BRR=BIT15;
    269e:	4b4c      	ldr	r3, [pc, #304]	; (27d0 <tvout_init+0x14c>)
    26a0:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    26a4:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
    26a6:	4a4b      	ldr	r2, [pc, #300]	; (27d4 <tvout_init+0x150>)
    26a8:	4b4a      	ldr	r3, [pc, #296]	; (27d4 <tvout_init+0x150>)
    26aa:	699b      	ldr	r3, [r3, #24]
    26ac:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    26b0:	6193      	str	r3, [r2, #24]
	// clock source division
	*TIMER1_PSC=0;
    26b2:	4b49      	ldr	r3, [pc, #292]	; (27d8 <tvout_init+0x154>)
    26b4:	2200      	movs	r2, #0
    26b6:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    26b8:	4b48      	ldr	r3, [pc, #288]	; (27dc <tvout_init+0x158>)
    26ba:	f44f 6265 	mov.w	r2, #3664	; 0xe50
    26be:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    26c0:	4b47      	ldr	r3, [pc, #284]	; (27e0 <tvout_init+0x15c>)
    26c2:	f44f 7286 	mov.w	r2, #268	; 0x10c
    26c6:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    26c8:	4b46      	ldr	r3, [pc, #280]	; (27e4 <tvout_init+0x160>)
    26ca:	681a      	ldr	r2, [r3, #0]
    26cc:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    26d0:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    26d4:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    26d6:	4b43      	ldr	r3, [pc, #268]	; (27e4 <tvout_init+0x160>)
    26d8:	681a      	ldr	r2, [r3, #0]
    26da:	f042 0208 	orr.w	r2, r2, #8
    26de:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    26e0:	4b41      	ldr	r3, [pc, #260]	; (27e8 <tvout_init+0x164>)
    26e2:	681a      	ldr	r2, [r3, #0]
    26e4:	f042 0201 	orr.w	r2, r2, #1
    26e8:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    26ea:	4b3f      	ldr	r3, [pc, #252]	; (27e8 <tvout_init+0x164>)
    26ec:	681a      	ldr	r2, [r3, #0]
    26ee:	f042 0202 	orr.w	r2, r2, #2
    26f2:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    26f4:	4a3d      	ldr	r2, [pc, #244]	; (27ec <tvout_init+0x168>)
    26f6:	8813      	ldrh	r3, [r2, #0]
    26f8:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    26fc:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    2700:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    2702:	4b3b      	ldr	r3, [pc, #236]	; (27f0 <tvout_init+0x16c>)
    2704:	681a      	ldr	r2, [r3, #0]
    2706:	f042 0201 	orr.w	r2, r2, #1
    270a:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=SPI_PIXELS; //(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    270c:	4b39      	ldr	r3, [pc, #228]	; (27f4 <tvout_init+0x170>)
    270e:	f640 324c 	movw	r2, #2892	; 0xb4c
    2712:	801a      	strh	r2, [r3, #0]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    2714:	4b38      	ldr	r3, [pc, #224]	; (27f8 <tvout_init+0x174>)
    2716:	f243 5292 	movw	r2, #13714	; 0x3592
    271a:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    271c:	4b36      	ldr	r3, [pc, #216]	; (27f8 <tvout_init+0x174>)
    271e:	4a37      	ldr	r2, [pc, #220]	; (27fc <tvout_init+0x178>)
    2720:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    2722:	4a34      	ldr	r2, [pc, #208]	; (27f4 <tvout_init+0x170>)
    2724:	4b33      	ldr	r3, [pc, #204]	; (27f4 <tvout_init+0x170>)
    2726:	889b      	ldrh	r3, [r3, #4]
    2728:	b29b      	uxth	r3, r3
    272a:	f043 0302 	orr.w	r3, r3, #2
    272e:	b29b      	uxth	r3, r3
    2730:	8093      	strh	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,7);
    2732:	200f      	movs	r0, #15
    2734:	2107      	movs	r1, #7
    2736:	f7ff fdcd 	bl	22d4 <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    273a:	200f      	movs	r0, #15
    273c:	f7ff fcfe 	bl	213c <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    2740:	4b2f      	ldr	r3, [pc, #188]	; (2800 <tvout_init+0x17c>)
    2742:	681a      	ldr	r2, [r3, #0]
    2744:	f042 0202 	orr.w	r2, r2, #2
    2748:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,7);
    274a:	201b      	movs	r0, #27
    274c:	2107      	movs	r1, #7
    274e:	f7ff fdc1 	bl	22d4 <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    2752:	201b      	movs	r0, #27
    2754:	f7ff fcf2 	bl	213c <enable_interrupt>
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    2758:	2300      	movs	r3, #0
    275a:	607b      	str	r3, [r7, #4]
    275c:	e011      	b.n	2782 <tvout_init+0xfe>
		video_buffer[i]=0xffff;
    275e:	4a29      	ldr	r2, [pc, #164]	; (2804 <tvout_init+0x180>)
    2760:	687b      	ldr	r3, [r7, #4]
    2762:	f64f 71ff 	movw	r1, #65535	; 0xffff
    2766:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
    276a:	687b      	ldr	r3, [r7, #4]
    276c:	f503 5395 	add.w	r3, r3, #4768	; 0x12a0
    2770:	330c      	adds	r3, #12
    2772:	4a24      	ldr	r2, [pc, #144]	; (2804 <tvout_init+0x180>)
    2774:	f64f 71ff 	movw	r1, #65535	; 0xffff
    2778:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,7);
	enable_interrupt(IRQ_TIM1_CC);
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    277c:	687b      	ldr	r3, [r7, #4]
    277e:	3301      	adds	r3, #1
    2780:	607b      	str	r3, [r7, #4]
    2782:	687b      	ldr	r3, [r7, #4]
    2784:	2b13      	cmp	r3, #19
    2786:	ddea      	ble.n	275e <tvout_init+0xda>
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    2788:	2301      	movs	r3, #1
    278a:	607b      	str	r3, [r7, #4]
    278c:	e018      	b.n	27c0 <tvout_init+0x13c>
		video_buffer[i*ROW_SIZE]=0x8000;
    278e:	687a      	ldr	r2, [r7, #4]
    2790:	4613      	mov	r3, r2
    2792:	009b      	lsls	r3, r3, #2
    2794:	4413      	add	r3, r2
    2796:	009b      	lsls	r3, r3, #2
    2798:	461a      	mov	r2, r3
    279a:	4b1a      	ldr	r3, [pc, #104]	; (2804 <tvout_init+0x180>)
    279c:	f44f 4100 	mov.w	r1, #32768	; 0x8000
    27a0:	f823 1012 	strh.w	r1, [r3, r2, lsl #1]
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
    27a4:	687b      	ldr	r3, [r7, #4]
    27a6:	1c5a      	adds	r2, r3, #1
    27a8:	4613      	mov	r3, r2
    27aa:	009b      	lsls	r3, r3, #2
    27ac:	4413      	add	r3, r2
    27ae:	009b      	lsls	r3, r3, #2
    27b0:	3b01      	subs	r3, #1
    27b2:	4a14      	ldr	r2, [pc, #80]	; (2804 <tvout_init+0x180>)
    27b4:	2101      	movs	r1, #1
    27b6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i;
	for (i=0;i<ROW_SIZE;i++){
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    27ba:	687b      	ldr	r3, [r7, #4]
    27bc:	3301      	adds	r3, #1
    27be:	607b      	str	r3, [r7, #4]
    27c0:	687b      	ldr	r3, [r7, #4]
    27c2:	2bed      	cmp	r3, #237	; 0xed
    27c4:	dde3      	ble.n	278e <tvout_init+0x10a>
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	// test end
 }
    27c6:	3708      	adds	r7, #8
    27c8:	46bd      	mov	sp, r7
    27ca:	bd80      	pop	{r7, pc}
    27cc:	40010800 	.word	0x40010800
    27d0:	40010c00 	.word	0x40010c00
    27d4:	40021000 	.word	0x40021000
    27d8:	40012c28 	.word	0x40012c28
    27dc:	40012c2c 	.word	0x40012c2c
    27e0:	40012c34 	.word	0x40012c34
    27e4:	40012c18 	.word	0x40012c18
    27e8:	40012c20 	.word	0x40012c20
    27ec:	40012c44 	.word	0x40012c44
    27f0:	40012c00 	.word	0x40012c00
    27f4:	40003800 	.word	0x40003800
    27f8:	40020058 	.word	0x40020058
    27fc:	4000380c 	.word	0x4000380c
    2800:	40012c0c 	.word	0x40012c0c
    2804:	20000138 	.word	0x20000138

00002808 <TIM1_CC_handler>:
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    2808:	484a      	ldr	r0, [pc, #296]	; (2934 <TIM1_CC_handler+0x12c>)
	line_count++;
    280a:	4b4b      	ldr	r3, [pc, #300]	; (2938 <TIM1_CC_handler+0x130>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    280c:	6802      	ldr	r2, [r0, #0]
	line_count++;
	TIMER1_SR->fld.cc1if=0;
    280e:	494b      	ldr	r1, [pc, #300]	; (293c <TIM1_CC_handler+0x134>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    2810:	f022 0201 	bic.w	r2, r2, #1
    2814:	6002      	str	r2, [r0, #0]
	line_count++;
    2816:	681a      	ldr	r2, [r3, #0]
    2818:	3201      	adds	r2, #1
    281a:	601a      	str	r2, [r3, #0]
	TIMER1_SR->fld.cc1if=0;
    281c:	680a      	ldr	r2, [r1, #0]
    281e:	f022 0202 	bic.w	r2, r2, #2
    2822:	600a      	str	r2, [r1, #0]
	switch(line_count){
    2824:	681a      	ldr	r2, [r3, #0]
    2826:	2a12      	cmp	r2, #18
    2828:	d07f      	beq.n	292a <TIM1_CC_handler+0x122>
    282a:	dd1c      	ble.n	2866 <TIM1_CC_handler+0x5e>
    282c:	f5b2 7f96 	cmp.w	r2, #300	; 0x12c
    2830:	d072      	beq.n	2918 <TIM1_CC_handler+0x110>
    2832:	dd3f      	ble.n	28b4 <TIM1_CC_handler+0xac>
    2834:	f240 1141 	movw	r1, #321	; 0x141
    2838:	428a      	cmp	r2, r1
    283a:	d028      	beq.n	288e <TIM1_CC_handler+0x86>
    283c:	f5b2 7fa1 	cmp.w	r2, #322	; 0x142
    2840:	d14a      	bne.n	28d8 <TIM1_CC_handler+0xd0>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    2842:	4a3f      	ldr	r2, [pc, #252]	; (2940 <TIM1_CC_handler+0x138>)
    2844:	6811      	ldr	r1, [r2, #0]
    2846:	b169      	cbz	r1, 2864 <TIM1_CC_handler+0x5c>
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
    2848:	b410      	push	{r4}
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    284a:	483e      	ldr	r0, [pc, #248]	; (2944 <TIM1_CC_handler+0x13c>)
			line_count=-1;
    284c:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    2850:	8801      	ldrh	r1, [r0, #0]
    2852:	f3c1 014e 	ubfx	r1, r1, #1, #15
    2856:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    2858:	601c      	str	r4, [r3, #0]
			even=-even;
    285a:	6813      	ldr	r3, [r2, #0]
    285c:	425b      	negs	r3, r3
    285e:	6013      	str	r3, [r2, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    2860:	f85d 4b04 	ldr.w	r4, [sp], #4
    2864:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2866:	2a06      	cmp	r2, #6
    2868:	d05a      	beq.n	2920 <TIM1_CC_handler+0x118>
    286a:	dd29      	ble.n	28c0 <TIM1_CC_handler+0xb8>
    286c:	2a0c      	cmp	r2, #12
    286e:	d019      	beq.n	28a4 <TIM1_CC_handler+0x9c>
    2870:	2a11      	cmp	r2, #17
    2872:	d131      	bne.n	28d8 <TIM1_CC_handler+0xd0>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
		break;
	case 17: // fin sync champ paire
		if (even){
    2874:	4b32      	ldr	r3, [pc, #200]	; (2940 <TIM1_CC_handler+0x138>)
    2876:	681b      	ldr	r3, [r3, #0]
    2878:	2b00      	cmp	r3, #0
    287a:	d0f3      	beq.n	2864 <TIM1_CC_handler+0x5c>
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    287c:	4931      	ldr	r1, [pc, #196]	; (2944 <TIM1_CC_handler+0x13c>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    287e:	4b32      	ldr	r3, [pc, #200]	; (2948 <TIM1_CC_handler+0x140>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    2880:	f44f 6065 	mov.w	r0, #3664	; 0xe50
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    2884:	f44f 7286 	mov.w	r2, #268	; 0x10c
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    2888:	8008      	strh	r0, [r1, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    288a:	801a      	strh	r2, [r3, #0]
    288c:	4770      	bx	lr
		break;
	case (TOP_LINE+VRES):
		video=0;
		break;
	case FIELD_END:
		if (!even){
    288e:	4a2c      	ldr	r2, [pc, #176]	; (2940 <TIM1_CC_handler+0x138>)
    2890:	6811      	ldr	r1, [r2, #0]
    2892:	2900      	cmp	r1, #0
    2894:	d1e6      	bne.n	2864 <TIM1_CC_handler+0x5c>
			line_count=-1;
    2896:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    289a:	6019      	str	r1, [r3, #0]
			even=-even;
    289c:	6813      	ldr	r3, [r2, #0]
    289e:	425b      	negs	r3, r3
    28a0:	6013      	str	r3, [r2, #0]
    28a2:	4770      	bx	lr
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    28a4:	4927      	ldr	r1, [pc, #156]	; (2944 <TIM1_CC_handler+0x13c>)
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    28a6:	4b28      	ldr	r3, [pc, #160]	; (2948 <TIM1_CC_handler+0x140>)
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    28a8:	f44f 60e5 	mov.w	r0, #1832	; 0x728
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    28ac:	2286      	movs	r2, #134	; 0x86
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    28ae:	8008      	strh	r0, [r1, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    28b0:	801a      	strh	r2, [r3, #0]
		break;
    28b2:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    28b4:	2a3b      	cmp	r2, #59	; 0x3b
    28b6:	d10f      	bne.n	28d8 <TIM1_CC_handler+0xd0>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    28b8:	4b24      	ldr	r3, [pc, #144]	; (294c <TIM1_CC_handler+0x144>)
    28ba:	2201      	movs	r2, #1
    28bc:	601a      	str	r2, [r3, #0]
		break;
    28be:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    28c0:	b952      	cbnz	r2, 28d8 <TIM1_CC_handler+0xd0>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    28c2:	4920      	ldr	r1, [pc, #128]	; (2944 <TIM1_CC_handler+0x13c>)
		*TIMER1_CCR1/=2;
    28c4:	4a20      	ldr	r2, [pc, #128]	; (2948 <TIM1_CC_handler+0x140>)
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    28c6:	880b      	ldrh	r3, [r1, #0]
    28c8:	f3c3 034e 	ubfx	r3, r3, #1, #15
    28cc:	800b      	strh	r3, [r1, #0]
		*TIMER1_CCR1/=2;
    28ce:	8813      	ldrh	r3, [r2, #0]
    28d0:	f3c3 034e 	ubfx	r3, r3, #1, #15
    28d4:	8013      	strh	r3, [r2, #0]
		break;
    28d6:	4770      	bx	lr
		SPI2->DR=0xaaaa;
		while (SPI2->SR&SPI_SR_BSY);
		SPI2->CR1=SPI_PIXELS;
		SPI2->DR=0;
*/	
		if (video){
    28d8:	4a1c      	ldr	r2, [pc, #112]	; (294c <TIM1_CC_handler+0x144>)
    28da:	6812      	ldr	r2, [r2, #0]
    28dc:	2a00      	cmp	r2, #0
    28de:	d0c1      	beq.n	2864 <TIM1_CC_handler+0x5c>
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    28e0:	681b      	ldr	r3, [r3, #0]
    28e2:	4a1b      	ldr	r2, [pc, #108]	; (2950 <TIM1_CC_handler+0x148>)
    28e4:	3b3c      	subs	r3, #60	; 0x3c
    28e6:	4913      	ldr	r1, [pc, #76]	; (2934 <TIM1_CC_handler+0x12c>)
    28e8:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    28ec:	eb02 03c3 	add.w	r3, r2, r3, lsl #3
			DMA1[DMACH5].cndtr=ROW_SIZE;
    28f0:	2014      	movs	r0, #20
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    28f2:	4a18      	ldr	r2, [pc, #96]	; (2954 <TIM1_CC_handler+0x14c>)
		SPI2->DR=0;
*/	
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    28f4:	60cb      	str	r3, [r1, #12]
			DMA1[DMACH5].cndtr=ROW_SIZE;
    28f6:	6048      	str	r0, [r1, #4]
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    28f8:	8813      	ldrh	r3, [r2, #0]
    28fa:	b29b      	uxth	r3, r3
    28fc:	f5b3 7f2f 	cmp.w	r3, #700	; 0x2bc
    2900:	d204      	bcs.n	290c <TIM1_CC_handler+0x104>
    2902:	8813      	ldrh	r3, [r2, #0]
    2904:	b29b      	uxth	r3, r3
    2906:	f5b3 7f2f 	cmp.w	r3, #700	; 0x2bc
    290a:	d3fa      	bcc.n	2902 <TIM1_CC_handler+0xfa>
			_enable_dma();
    290c:	4a09      	ldr	r2, [pc, #36]	; (2934 <TIM1_CC_handler+0x12c>)
    290e:	6813      	ldr	r3, [r2, #0]
    2910:	f043 0301 	orr.w	r3, r3, #1
    2914:	6013      	str	r3, [r2, #0]
    2916:	4770      	bx	lr
		break;
	case TOP_LINE-1:
		video=1;
		break;
	case (TOP_LINE+VRES):
		video=0;
    2918:	4b0c      	ldr	r3, [pc, #48]	; (294c <TIM1_CC_handler+0x144>)
    291a:	2200      	movs	r2, #0
    291c:	601a      	str	r2, [r3, #0]
		break;
    291e:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    2920:	f240 62a1 	movw	r2, #1697	; 0x6a1
    2924:	4b08      	ldr	r3, [pc, #32]	; (2948 <TIM1_CC_handler+0x140>)
    2926:	801a      	strh	r2, [r3, #0]
	    break;
    2928:	4770      	bx	lr
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
    292a:	4b05      	ldr	r3, [pc, #20]	; (2940 <TIM1_CC_handler+0x138>)
    292c:	681b      	ldr	r3, [r3, #0]
    292e:	2b00      	cmp	r3, #0
    2930:	d198      	bne.n	2864 <TIM1_CC_handler+0x5c>
    2932:	e7a3      	b.n	287c <TIM1_CC_handler+0x74>
    2934:	40020058 	.word	0x40020058
    2938:	20000004 	.word	0x20000004
    293c:	40012c10 	.word	0x40012c10
    2940:	20000130 	.word	0x20000130
    2944:	40012c2c 	.word	0x40012c2c
    2948:	40012c34 	.word	0x40012c34
    294c:	2000012c 	.word	0x2000012c
    2950:	20000138 	.word	0x20000138
    2954:	40012c24 	.word	0x40012c24

00002958 <DMA1CH5_handler>:
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
    2958:	b480      	push	{r7}
    295a:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    295c:	4a0a      	ldr	r2, [pc, #40]	; (2988 <DMA1CH5_handler+0x30>)
    295e:	4b0a      	ldr	r3, [pc, #40]	; (2988 <DMA1CH5_handler+0x30>)
    2960:	685b      	ldr	r3, [r3, #4]
    2962:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    2966:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    2968:	bf00      	nop
    296a:	4b08      	ldr	r3, [pc, #32]	; (298c <DMA1CH5_handler+0x34>)
    296c:	891b      	ldrh	r3, [r3, #8]
    296e:	b29b      	uxth	r3, r3
    2970:	f003 0302 	and.w	r3, r3, #2
    2974:	2b00      	cmp	r3, #0
    2976:	d0f8      	beq.n	296a <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    2978:	4b04      	ldr	r3, [pc, #16]	; (298c <DMA1CH5_handler+0x34>)
    297a:	2200      	movs	r2, #0
    297c:	819a      	strh	r2, [r3, #12]
}
    297e:	46bd      	mov	sp, r7
    2980:	f85d 7b04 	ldr.w	r7, [sp], #4
    2984:	4770      	bx	lr
    2986:	bf00      	nop
    2988:	40020000 	.word	0x40020000
    298c:	40003800 	.word	0x40003800

00002990 <usart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
    2990:	b480      	push	{r7}
    2992:	b085      	sub	sp, #20
    2994:	af00      	add	r7, sp, #0
    2996:	6078      	str	r0, [r7, #4]
    2998:	6039      	str	r1, [r7, #0]
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
    299a:	687b      	ldr	r3, [r7, #4]
    299c:	4a15      	ldr	r2, [pc, #84]	; (29f4 <usart_set_baud+0x64>)
    299e:	4293      	cmp	r3, r2
    29a0:	d110      	bne.n	29c4 <usart_set_baud+0x34>
		rate=(FAPB2/baud/16)<<4;
    29a2:	4a15      	ldr	r2, [pc, #84]	; (29f8 <usart_set_baud+0x68>)
    29a4:	683b      	ldr	r3, [r7, #0]
    29a6:	fbb2 f3f3 	udiv	r3, r2, r3
    29aa:	091b      	lsrs	r3, r3, #4
    29ac:	011b      	lsls	r3, r3, #4
    29ae:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    29b0:	4a11      	ldr	r2, [pc, #68]	; (29f8 <usart_set_baud+0x68>)
    29b2:	683b      	ldr	r3, [r7, #0]
    29b4:	fbb2 f3f3 	udiv	r3, r2, r3
    29b8:	f003 030f 	and.w	r3, r3, #15
    29bc:	68fa      	ldr	r2, [r7, #12]
    29be:	4313      	orrs	r3, r2
    29c0:	60fb      	str	r3, [r7, #12]
    29c2:	e00f      	b.n	29e4 <usart_set_baud+0x54>
	}else{
		rate=(FAPB1/baud/16)<<4;
    29c4:	4a0d      	ldr	r2, [pc, #52]	; (29fc <usart_set_baud+0x6c>)
    29c6:	683b      	ldr	r3, [r7, #0]
    29c8:	fbb2 f3f3 	udiv	r3, r2, r3
    29cc:	091b      	lsrs	r3, r3, #4
    29ce:	011b      	lsls	r3, r3, #4
    29d0:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    29d2:	4a0a      	ldr	r2, [pc, #40]	; (29fc <usart_set_baud+0x6c>)
    29d4:	683b      	ldr	r3, [r7, #0]
    29d6:	fbb2 f3f3 	udiv	r3, r2, r3
    29da:	f003 030f 	and.w	r3, r3, #15
    29de:	68fa      	ldr	r2, [r7, #12]
    29e0:	4313      	orrs	r3, r2
    29e2:	60fb      	str	r3, [r7, #12]
	}
	channel->BRR=rate;
    29e4:	687b      	ldr	r3, [r7, #4]
    29e6:	68fa      	ldr	r2, [r7, #12]
    29e8:	609a      	str	r2, [r3, #8]
}
    29ea:	3714      	adds	r7, #20
    29ec:	46bd      	mov	sp, r7
    29ee:	f85d 7b04 	ldr.w	r7, [sp], #4
    29f2:	4770      	bx	lr
    29f4:	40013800 	.word	0x40013800
    29f8:	0369e994 	.word	0x0369e994
    29fc:	01b4f4ca 	.word	0x01b4f4ca

00002a00 <usart_comm_dir>:

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
    2a00:	b480      	push	{r7}
    2a02:	b083      	sub	sp, #12
    2a04:	af00      	add	r7, sp, #0
    2a06:	6078      	str	r0, [r7, #4]
    2a08:	6039      	str	r1, [r7, #0]
	channel->CR1&=USART_CR1_DIR_MASK;
    2a0a:	687b      	ldr	r3, [r7, #4]
    2a0c:	68db      	ldr	r3, [r3, #12]
    2a0e:	f023 020c 	bic.w	r2, r3, #12
    2a12:	687b      	ldr	r3, [r7, #4]
    2a14:	60da      	str	r2, [r3, #12]
	channel->CR1|=direction<<USART_CR1_DIR_POS;
    2a16:	687b      	ldr	r3, [r7, #4]
    2a18:	68da      	ldr	r2, [r3, #12]
    2a1a:	683b      	ldr	r3, [r7, #0]
    2a1c:	009b      	lsls	r3, r3, #2
    2a1e:	431a      	orrs	r2, r3
    2a20:	687b      	ldr	r3, [r7, #4]
    2a22:	60da      	str	r2, [r3, #12]
}
    2a24:	370c      	adds	r7, #12
    2a26:	46bd      	mov	sp, r7
    2a28:	f85d 7b04 	ldr.w	r7, [sp], #4
    2a2c:	4770      	bx	lr
    2a2e:	bf00      	nop

00002a30 <usart_open_channel>:


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
    2a30:	b580      	push	{r7, lr}
    2a32:	b084      	sub	sp, #16
    2a34:	af00      	add	r7, sp, #0
    2a36:	60f8      	str	r0, [r7, #12]
    2a38:	60b9      	str	r1, [r7, #8]
    2a3a:	607a      	str	r2, [r7, #4]
    2a3c:	603b      	str	r3, [r7, #0]
	usart_set_baud(channel,baud);
    2a3e:	68f8      	ldr	r0, [r7, #12]
    2a40:	68b9      	ldr	r1, [r7, #8]
    2a42:	f7ff ffa5 	bl	2990 <usart_set_baud>
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    2a46:	68fb      	ldr	r3, [r7, #12]
    2a48:	4a62      	ldr	r2, [pc, #392]	; (2bd4 <usart_open_channel+0x1a4>)
    2a4a:	4293      	cmp	r3, r2
    2a4c:	d066      	beq.n	2b1c <usart_open_channel+0xec>
    2a4e:	4a62      	ldr	r2, [pc, #392]	; (2bd8 <usart_open_channel+0x1a8>)
    2a50:	4293      	cmp	r3, r2
    2a52:	d003      	beq.n	2a5c <usart_open_channel+0x2c>
    2a54:	4a61      	ldr	r2, [pc, #388]	; (2bdc <usart_open_channel+0x1ac>)
    2a56:	4293      	cmp	r3, r2
    2a58:	d030      	beq.n	2abc <usart_open_channel+0x8c>
    2a5a:	e08f      	b.n	2b7c <usart_open_channel+0x14c>
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
    2a5c:	4a60      	ldr	r2, [pc, #384]	; (2be0 <usart_open_channel+0x1b0>)
    2a5e:	4b60      	ldr	r3, [pc, #384]	; (2be0 <usart_open_channel+0x1b0>)
    2a60:	699b      	ldr	r3, [r3, #24]
    2a62:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    2a66:	f043 0304 	orr.w	r3, r3, #4
    2a6a:	6193      	str	r3, [r2, #24]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    2a6c:	69bb      	ldr	r3, [r7, #24]
    2a6e:	2b01      	cmp	r3, #1
    2a70:	d110      	bne.n	2a94 <usart_open_channel+0x64>
			GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    2a72:	4a5c      	ldr	r2, [pc, #368]	; (2be4 <usart_open_channel+0x1b4>)
    2a74:	4b5b      	ldr	r3, [pc, #364]	; (2be4 <usart_open_channel+0x1b4>)
    2a76:	681b      	ldr	r3, [r3, #0]
    2a78:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    2a7c:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    2a80:	6013      	str	r3, [r2, #0]
			GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    2a82:	4a58      	ldr	r2, [pc, #352]	; (2be4 <usart_open_channel+0x1b4>)
    2a84:	4b57      	ldr	r3, [pc, #348]	; (2be4 <usart_open_channel+0x1b4>)
    2a86:	681b      	ldr	r3, [r3, #0]
    2a88:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    2a8c:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    2a90:	6013      	str	r3, [r2, #0]
    2a92:	e00b      	b.n	2aac <usart_open_channel+0x7c>
		}else{
			GPIOA_CRH->cr&=~(15<<GPIO_MODE9);
    2a94:	4a53      	ldr	r2, [pc, #332]	; (2be4 <usart_open_channel+0x1b4>)
    2a96:	4b53      	ldr	r3, [pc, #332]	; (2be4 <usart_open_channel+0x1b4>)
    2a98:	681b      	ldr	r3, [r3, #0]
    2a9a:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    2a9e:	6013      	str	r3, [r2, #0]
			GPIOA_CRH->cr|=(0xA<<GPIO_MODE9);
    2aa0:	4a50      	ldr	r2, [pc, #320]	; (2be4 <usart_open_channel+0x1b4>)
    2aa2:	4b50      	ldr	r3, [pc, #320]	; (2be4 <usart_open_channel+0x1b4>)
    2aa4:	681b      	ldr	r3, [r3, #0]
    2aa6:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    2aaa:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART1,7);
    2aac:	2025      	movs	r0, #37	; 0x25
    2aae:	2107      	movs	r1, #7
    2ab0:	f7ff fc10 	bl	22d4 <set_int_priority>
		enable_interrupt(IRQ_USART1);
    2ab4:	2025      	movs	r0, #37	; 0x25
    2ab6:	f7ff fb41 	bl	213c <enable_interrupt>
		break;
    2aba:	e05f      	b.n	2b7c <usart_open_channel+0x14c>
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    2abc:	4a48      	ldr	r2, [pc, #288]	; (2be0 <usart_open_channel+0x1b0>)
    2abe:	4b48      	ldr	r3, [pc, #288]	; (2be0 <usart_open_channel+0x1b0>)
    2ac0:	69db      	ldr	r3, [r3, #28]
    2ac2:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    2ac6:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    2ac8:	4a45      	ldr	r2, [pc, #276]	; (2be0 <usart_open_channel+0x1b0>)
    2aca:	4b45      	ldr	r3, [pc, #276]	; (2be0 <usart_open_channel+0x1b0>)
    2acc:	699b      	ldr	r3, [r3, #24]
    2ace:	f043 0304 	orr.w	r3, r3, #4
    2ad2:	6193      	str	r3, [r2, #24]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
    2ad4:	69bb      	ldr	r3, [r7, #24]
    2ad6:	2b01      	cmp	r3, #1
    2ad8:	d10c      	bne.n	2af4 <usart_open_channel+0xc4>
			GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    2ada:	4a43      	ldr	r2, [pc, #268]	; (2be8 <usart_open_channel+0x1b8>)
    2adc:	4b42      	ldr	r3, [pc, #264]	; (2be8 <usart_open_channel+0x1b8>)
    2ade:	681b      	ldr	r3, [r3, #0]
    2ae0:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    2ae4:	6013      	str	r3, [r2, #0]
			GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    2ae6:	4a40      	ldr	r2, [pc, #256]	; (2be8 <usart_open_channel+0x1b8>)
    2ae8:	4b3f      	ldr	r3, [pc, #252]	; (2be8 <usart_open_channel+0x1b8>)
    2aea:	681b      	ldr	r3, [r3, #0]
    2aec:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    2af0:	6013      	str	r3, [r2, #0]
    2af2:	e00b      	b.n	2b0c <usart_open_channel+0xdc>
		}else{
			GPIOA_CRL->cr&=~(15<<GPIO_MODE2);
    2af4:	4a3c      	ldr	r2, [pc, #240]	; (2be8 <usart_open_channel+0x1b8>)
    2af6:	4b3c      	ldr	r3, [pc, #240]	; (2be8 <usart_open_channel+0x1b8>)
    2af8:	681b      	ldr	r3, [r3, #0]
    2afa:	f423 6370 	bic.w	r3, r3, #3840	; 0xf00
    2afe:	6013      	str	r3, [r2, #0]
			GPIOA_CRL->cr|=(0xA<<GPIO_MODE2);
    2b00:	4a39      	ldr	r2, [pc, #228]	; (2be8 <usart_open_channel+0x1b8>)
    2b02:	4b39      	ldr	r3, [pc, #228]	; (2be8 <usart_open_channel+0x1b8>)
    2b04:	681b      	ldr	r3, [r3, #0]
    2b06:	f443 6320 	orr.w	r3, r3, #2560	; 0xa00
    2b0a:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART2,7);
    2b0c:	2026      	movs	r0, #38	; 0x26
    2b0e:	2107      	movs	r1, #7
    2b10:	f7ff fbe0 	bl	22d4 <set_int_priority>
		enable_interrupt(IRQ_USART2);
    2b14:	2026      	movs	r0, #38	; 0x26
    2b16:	f7ff fb11 	bl	213c <enable_interrupt>
		break;
    2b1a:	e02f      	b.n	2b7c <usart_open_channel+0x14c>
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
    2b1c:	4a30      	ldr	r2, [pc, #192]	; (2be0 <usart_open_channel+0x1b0>)
    2b1e:	4b30      	ldr	r3, [pc, #192]	; (2be0 <usart_open_channel+0x1b0>)
    2b20:	69db      	ldr	r3, [r3, #28]
    2b22:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    2b26:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    2b28:	4a2d      	ldr	r2, [pc, #180]	; (2be0 <usart_open_channel+0x1b0>)
    2b2a:	4b2d      	ldr	r3, [pc, #180]	; (2be0 <usart_open_channel+0x1b0>)
    2b2c:	699b      	ldr	r3, [r3, #24]
    2b2e:	f043 0308 	orr.w	r3, r3, #8
    2b32:	6193      	str	r3, [r2, #24]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    2b34:	69bb      	ldr	r3, [r7, #24]
    2b36:	2b01      	cmp	r3, #1
    2b38:	d10c      	bne.n	2b54 <usart_open_channel+0x124>
			GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    2b3a:	4a2c      	ldr	r2, [pc, #176]	; (2bec <usart_open_channel+0x1bc>)
    2b3c:	4b2b      	ldr	r3, [pc, #172]	; (2bec <usart_open_channel+0x1bc>)
    2b3e:	681b      	ldr	r3, [r3, #0]
    2b40:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    2b44:	6013      	str	r3, [r2, #0]
			GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    2b46:	4a29      	ldr	r2, [pc, #164]	; (2bec <usart_open_channel+0x1bc>)
    2b48:	4b28      	ldr	r3, [pc, #160]	; (2bec <usart_open_channel+0x1bc>)
    2b4a:	681b      	ldr	r3, [r3, #0]
    2b4c:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    2b50:	6013      	str	r3, [r2, #0]
    2b52:	e00b      	b.n	2b6c <usart_open_channel+0x13c>
		}else{
			GPIOB_CRH->cr&=~((15<<GPIO_MODE10));
    2b54:	4a25      	ldr	r2, [pc, #148]	; (2bec <usart_open_channel+0x1bc>)
    2b56:	4b25      	ldr	r3, [pc, #148]	; (2bec <usart_open_channel+0x1bc>)
    2b58:	681b      	ldr	r3, [r3, #0]
    2b5a:	f423 6370 	bic.w	r3, r3, #3840	; 0xf00
    2b5e:	6013      	str	r3, [r2, #0]
			GPIOB_CRH->cr|=(0xA<<GPIO_MODE10);
    2b60:	4a22      	ldr	r2, [pc, #136]	; (2bec <usart_open_channel+0x1bc>)
    2b62:	4b22      	ldr	r3, [pc, #136]	; (2bec <usart_open_channel+0x1bc>)
    2b64:	681b      	ldr	r3, [r3, #0]
    2b66:	f443 6320 	orr.w	r3, r3, #2560	; 0xa00
    2b6a:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART3,7);
    2b6c:	2027      	movs	r0, #39	; 0x27
    2b6e:	2107      	movs	r1, #7
    2b70:	f7ff fbb0 	bl	22d4 <set_int_priority>
		enable_interrupt(IRQ_USART3);
    2b74:	2027      	movs	r0, #39	; 0x27
    2b76:	f7ff fae1 	bl	213c <enable_interrupt>
		break;
    2b7a:	bf00      	nop
	}
	if (flow_ctrl==FLOW_HARD){
    2b7c:	69bb      	ldr	r3, [r7, #24]
    2b7e:	2b01      	cmp	r3, #1
    2b80:	d103      	bne.n	2b8a <usart_open_channel+0x15a>
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    2b82:	68fb      	ldr	r3, [r7, #12]
    2b84:	f44f 7240 	mov.w	r2, #768	; 0x300
    2b88:	615a      	str	r2, [r3, #20]
	}
	usart_comm_dir(channel,dir);
    2b8a:	68f8      	ldr	r0, [r7, #12]
    2b8c:	6839      	ldr	r1, [r7, #0]
    2b8e:	f7ff ff37 	bl	2a00 <usart_comm_dir>
	switch (parity){
    2b92:	687b      	ldr	r3, [r7, #4]
    2b94:	2b01      	cmp	r3, #1
    2b96:	d00b      	beq.n	2bb0 <usart_open_channel+0x180>
    2b98:	2b01      	cmp	r3, #1
    2b9a:	d302      	bcc.n	2ba2 <usart_open_channel+0x172>
    2b9c:	2b02      	cmp	r3, #2
    2b9e:	d00e      	beq.n	2bbe <usart_open_channel+0x18e>
    2ba0:	e014      	b.n	2bcc <usart_open_channel+0x19c>
	case PARITY_NONE:
		channel->CR1|=USART_CR1_UE;
    2ba2:	68fb      	ldr	r3, [r7, #12]
    2ba4:	68db      	ldr	r3, [r3, #12]
    2ba6:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
    2baa:	68fb      	ldr	r3, [r7, #12]
    2bac:	60da      	str	r2, [r3, #12]
		break;
    2bae:	e00d      	b.n	2bcc <usart_open_channel+0x19c>
	case PARITY_ODD:
		channel->CR1|=USART_CR1_UE|USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS;
    2bb0:	68fb      	ldr	r3, [r7, #12]
    2bb2:	68db      	ldr	r3, [r3, #12]
    2bb4:	f443 521c 	orr.w	r2, r3, #9984	; 0x2700
    2bb8:	68fb      	ldr	r3, [r7, #12]
    2bba:	60da      	str	r2, [r3, #12]
		break;
    2bbc:	e006      	b.n	2bcc <usart_open_channel+0x19c>
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_UE|USART_CR1_PEIE|USART_CR1_PCE;
    2bbe:	68fb      	ldr	r3, [r7, #12]
    2bc0:	68db      	ldr	r3, [r3, #12]
    2bc2:	f443 5214 	orr.w	r2, r3, #9472	; 0x2500
    2bc6:	68fb      	ldr	r3, [r7, #12]
    2bc8:	60da      	str	r2, [r3, #12]
		break;
    2bca:	bf00      	nop
    }
}
    2bcc:	3710      	adds	r7, #16
    2bce:	46bd      	mov	sp, r7
    2bd0:	bd80      	pop	{r7, pc}
    2bd2:	bf00      	nop
    2bd4:	40004800 	.word	0x40004800
    2bd8:	40013800 	.word	0x40013800
    2bdc:	40004400 	.word	0x40004400
    2be0:	40021000 	.word	0x40021000
    2be4:	40010804 	.word	0x40010804
    2be8:	40010800 	.word	0x40010800
    2bec:	40010c04 	.word	0x40010c04

00002bf0 <usart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
    2bf0:	b480      	push	{r7}
    2bf2:	b083      	sub	sp, #12
    2bf4:	af00      	add	r7, sp, #0
    2bf6:	6078      	str	r0, [r7, #4]
	return channel->SR&USART_SR_RXNE;
    2bf8:	687b      	ldr	r3, [r7, #4]
    2bfa:	681b      	ldr	r3, [r3, #0]
    2bfc:	f003 0320 	and.w	r3, r3, #32
}
    2c00:	4618      	mov	r0, r3
    2c02:	370c      	adds	r7, #12
    2c04:	46bd      	mov	sp, r7
    2c06:	f85d 7b04 	ldr.w	r7, [sp], #4
    2c0a:	4770      	bx	lr

00002c0c <usart_getc>:

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
    2c0c:	b480      	push	{r7}
    2c0e:	b083      	sub	sp, #12
    2c10:	af00      	add	r7, sp, #0
    2c12:	6078      	str	r0, [r7, #4]
	return channel->DR;
    2c14:	687b      	ldr	r3, [r7, #4]
    2c16:	685b      	ldr	r3, [r3, #4]
    2c18:	b2db      	uxtb	r3, r3
}
    2c1a:	4618      	mov	r0, r3
    2c1c:	370c      	adds	r7, #12
    2c1e:	46bd      	mov	sp, r7
    2c20:	f85d 7b04 	ldr.w	r7, [sp], #4
    2c24:	4770      	bx	lr
    2c26:	bf00      	nop

00002c28 <usart_putc>:

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
    2c28:	b480      	push	{r7}
    2c2a:	b083      	sub	sp, #12
    2c2c:	af00      	add	r7, sp, #0
    2c2e:	6078      	str	r0, [r7, #4]
    2c30:	460b      	mov	r3, r1
    2c32:	70fb      	strb	r3, [r7, #3]
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
    2c34:	bf00      	nop
    2c36:	687b      	ldr	r3, [r7, #4]
    2c38:	681b      	ldr	r3, [r3, #0]
    2c3a:	f003 0380 	and.w	r3, r3, #128	; 0x80
    2c3e:	2b00      	cmp	r3, #0
    2c40:	d0f9      	beq.n	2c36 <usart_putc+0xe>
	channel->DR=c;
    2c42:	78fa      	ldrb	r2, [r7, #3]
    2c44:	687b      	ldr	r3, [r7, #4]
    2c46:	605a      	str	r2, [r3, #4]
}
    2c48:	370c      	adds	r7, #12
    2c4a:	46bd      	mov	sp, r7
    2c4c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2c50:	4770      	bx	lr
    2c52:	bf00      	nop

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
