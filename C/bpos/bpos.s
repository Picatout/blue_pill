
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 0d 27 00 00     i...m...q....'..
      20:	0d 27 00 00 0d 27 00 00 0d 27 00 00 5d 05 00 00     .'...'...'..]...
      30:	0d 27 00 00 0d 27 00 00 79 02 00 00 e5 27 00 00     .'...'..y....'..
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 0d 27 00 00 0d 27 00 00 89 2a 00 00     .....'...'...*..
      80:	0d 27 00 00 0d 27 00 00 0d 27 00 00 0d 27 00 00     .'...'...'...'..
      90:	0d 27 00 00 0d 27 00 00 0d 27 00 00 3d 21 00 00     .'...'...'..=!..
      a0:	0d 27 00 00 0d 27 00 00 0d 27 00 00 39 29 00 00     .'...'...'..9)..
      b0:	a5 22 00 00 c5 02 00 00 8d 1c 00 00 0d 27 00 00     ."...........'..
      c0:	0d 27 00 00 0d 27 00 00 0d 27 00 00 0d 27 00 00     .'...'...'...'..
      d0:	0d 27 00 00 cd 02 00 00 4d 2f 00 00 d5 02 00 00     .'......M/......
      e0:	0d 27 00 00 0d 27 00 00 0d 27 00 00 0d 27 00 00     .'...'...'...'..
      f0:	0d 27 00 00 0d 27 00 00 0d 27 00 00 0d 27 00 00     .'...'...'...'..
     100:	0d 27 00 00 0d 27 00 00 0d 27 00 00 0d 27 00 00     .'...'...'...'..
     110:	0d 27 00 00 0d 27 00 00 0d 27 00 00 0d 27 00 00     .'...'...'...'..
     120:	0d 27 00 00 0d 27 00 00 0d 27 00 00 0d 27 00 00     .'...'...'...'..

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
     1b0:	f000 fea8 	bl	f04 <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	20000008 	.word	0x20000008
     1c0:	200026b0 	.word	0x200026b0
     1c4:	00003880 	.word	0x00003880
     1c8:	20000000 	.word	0x20000000
     1cc:	20000008 	.word	0x20000008
     1d0:	20002700 	.word	0x20002700
     1d4:	200000ec 	.word	0x200000ec
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
     208:	f002 fa88 	bl	271c <print_fault>
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
     21e:	f002 fa7d 	bl	271c <print_fault>
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
     234:	f002 fa72 	bl	271c <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f002 fa6d 	bl	271c <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	0000360c 	.word	0x0000360c
     258:	00003624 	.word	0x00003624
     25c:	00003630 	.word	0x00003630
     260:	00003640 	.word	0x00003640

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f002 fa52 	bl	270c <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f002 fa50 	bl	270c <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f002 fa4e 	bl	270c <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f002 fa4c 	bl	270c <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f002 fa4a 	bl	270c <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f002 fa48 	bl	270c <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f002 fa46 	bl	270c <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f002 fa44 	bl	270c <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f002 fa42 	bl	270c <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f002 fa40 	bl	270c <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f002 fa3e 	bl	270c <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f002 fa3c 	bl	270c <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f002 fa3a 	bl	270c <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f002 fa38 	bl	270c <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f002 fa36 	bl	270c <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f002 fa34 	bl	270c <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f002 fa32 	bl	270c <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f002 fa30 	bl	270c <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f002 fa2e 	bl	270c <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f002 fa2c 	bl	270c <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f002 fa2a 	bl	270c <reset_mcu>
_default_handler(EXTI9_5_handler) // 23
     2b8:	f002 fa28 	bl	270c <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2bc:	f002 fa26 	bl	270c <reset_mcu>
_default_handler(TIM2_handler) // 28
     2c0:	f002 fa24 	bl	270c <reset_mcu>

000002c4 <TIM3_handler>:
_default_handler(TIM3_handler) // 29
     2c4:	f002 fa22 	bl	270c <reset_mcu>
_default_handler(TIM4_handler) // 30
     2c8:	f002 fa20 	bl	270c <reset_mcu>

000002cc <USART1_handler>:
_default_handler(USART1_handler) // 37
     2cc:	f002 fa1e 	bl	270c <reset_mcu>
_default_handler(USART2_handler) // 38
     2d0:	f002 fa1c 	bl	270c <reset_mcu>

000002d4 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2d4:	f002 fa1a 	bl	270c <reset_mcu>

000002d8 <strcmp>:
extern unsigned int _FLASH_FREE;
extern unsigned int _DATA_ROM_START;

uint32_t proga;

int strcmp(const char *s1, const char *s2){
     2d8:	b480      	push	{r7}
     2da:	b085      	sub	sp, #20
     2dc:	af00      	add	r7, sp, #0
     2de:	6078      	str	r0, [r7, #4]
     2e0:	6039      	str	r1, [r7, #0]
	int result=0;
     2e2:	2300      	movs	r3, #0
     2e4:	60fb      	str	r3, [r7, #12]
	while (*s1 && *s2){
     2e6:	e018      	b.n	31a <strcmp+0x42>
		if (*s1<*s2){
     2e8:	687b      	ldr	r3, [r7, #4]
     2ea:	781a      	ldrb	r2, [r3, #0]
     2ec:	683b      	ldr	r3, [r7, #0]
     2ee:	781b      	ldrb	r3, [r3, #0]
     2f0:	429a      	cmp	r2, r3
     2f2:	d203      	bcs.n	2fc <strcmp+0x24>
			result=-1;
     2f4:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     2f8:	60fb      	str	r3, [r7, #12]
			break;
     2fa:	e016      	b.n	32a <strcmp+0x52>
		}else if (*s1>*s2){
     2fc:	687b      	ldr	r3, [r7, #4]
     2fe:	781a      	ldrb	r2, [r3, #0]
     300:	683b      	ldr	r3, [r7, #0]
     302:	781b      	ldrb	r3, [r3, #0]
     304:	429a      	cmp	r2, r3
     306:	d902      	bls.n	30e <strcmp+0x36>
			result=1;
     308:	2301      	movs	r3, #1
     30a:	60fb      	str	r3, [r7, #12]
			break;
     30c:	e00d      	b.n	32a <strcmp+0x52>
		}
		s1++;
     30e:	687b      	ldr	r3, [r7, #4]
     310:	3301      	adds	r3, #1
     312:	607b      	str	r3, [r7, #4]
		s2++;
     314:	683b      	ldr	r3, [r7, #0]
     316:	3301      	adds	r3, #1
     318:	603b      	str	r3, [r7, #0]

uint32_t proga;

int strcmp(const char *s1, const char *s2){
	int result=0;
	while (*s1 && *s2){
     31a:	687b      	ldr	r3, [r7, #4]
     31c:	781b      	ldrb	r3, [r3, #0]
     31e:	2b00      	cmp	r3, #0
     320:	d003      	beq.n	32a <strcmp+0x52>
     322:	683b      	ldr	r3, [r7, #0]
     324:	781b      	ldrb	r3, [r3, #0]
     326:	2b00      	cmp	r3, #0
     328:	d1de      	bne.n	2e8 <strcmp+0x10>
			break;
		}
		s1++;
		s2++;
	}
	if (!result){
     32a:	68fb      	ldr	r3, [r7, #12]
     32c:	2b00      	cmp	r3, #0
     32e:	d115      	bne.n	35c <strcmp+0x84>
		if (!*s1 && *s2){
     330:	687b      	ldr	r3, [r7, #4]
     332:	781b      	ldrb	r3, [r3, #0]
     334:	2b00      	cmp	r3, #0
     336:	d107      	bne.n	348 <strcmp+0x70>
     338:	683b      	ldr	r3, [r7, #0]
     33a:	781b      	ldrb	r3, [r3, #0]
     33c:	2b00      	cmp	r3, #0
     33e:	d003      	beq.n	348 <strcmp+0x70>
			result=-1;
     340:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     344:	60fb      	str	r3, [r7, #12]
     346:	e009      	b.n	35c <strcmp+0x84>
		}else if (*s1 && !*s2) {
     348:	687b      	ldr	r3, [r7, #4]
     34a:	781b      	ldrb	r3, [r3, #0]
     34c:	2b00      	cmp	r3, #0
     34e:	d005      	beq.n	35c <strcmp+0x84>
     350:	683b      	ldr	r3, [r7, #0]
     352:	781b      	ldrb	r3, [r3, #0]
     354:	2b00      	cmp	r3, #0
     356:	d101      	bne.n	35c <strcmp+0x84>
			result=1;
     358:	2301      	movs	r3, #1
     35a:	60fb      	str	r3, [r7, #12]
		}
	}
	return result;
     35c:	68fb      	ldr	r3, [r7, #12]
}
     35e:	4618      	mov	r0, r3
     360:	3714      	adds	r7, #20
     362:	46bd      	mov	sp, r7
     364:	f85d 7b04 	ldr.w	r7, [sp], #4
     368:	4770      	bx	lr
     36a:	bf00      	nop

0000036c <digit>:

int digit(char c){
     36c:	b480      	push	{r7}
     36e:	b083      	sub	sp, #12
     370:	af00      	add	r7, sp, #0
     372:	4603      	mov	r3, r0
     374:	71fb      	strb	r3, [r7, #7]
   return ((c>='0') && (c<='9'));
     376:	79fb      	ldrb	r3, [r7, #7]
     378:	2b2f      	cmp	r3, #47	; 0x2f
     37a:	d904      	bls.n	386 <digit+0x1a>
     37c:	79fb      	ldrb	r3, [r7, #7]
     37e:	2b39      	cmp	r3, #57	; 0x39
     380:	d801      	bhi.n	386 <digit+0x1a>
     382:	2301      	movs	r3, #1
     384:	e000      	b.n	388 <digit+0x1c>
     386:	2300      	movs	r3, #0
}
     388:	4618      	mov	r0, r3
     38a:	370c      	adds	r7, #12
     38c:	46bd      	mov	sp, r7
     38e:	f85d 7b04 	ldr.w	r7, [sp], #4
     392:	4770      	bx	lr

00000394 <hexdigit>:

int hexdigit(char c){
     394:	b580      	push	{r7, lr}
     396:	b082      	sub	sp, #8
     398:	af00      	add	r7, sp, #0
     39a:	4603      	mov	r3, r0
     39c:	71fb      	strb	r3, [r7, #7]
	if (c>='a') c-=32;
     39e:	79fb      	ldrb	r3, [r7, #7]
     3a0:	2b60      	cmp	r3, #96	; 0x60
     3a2:	d902      	bls.n	3aa <hexdigit+0x16>
     3a4:	79fb      	ldrb	r3, [r7, #7]
     3a6:	3b20      	subs	r3, #32
     3a8:	71fb      	strb	r3, [r7, #7]
	return (digit(c) || (c>='A' && c<='F'));
     3aa:	79fb      	ldrb	r3, [r7, #7]
     3ac:	4618      	mov	r0, r3
     3ae:	f7ff ffdd 	bl	36c <digit>
     3b2:	4603      	mov	r3, r0
     3b4:	2b00      	cmp	r3, #0
     3b6:	d105      	bne.n	3c4 <hexdigit+0x30>
     3b8:	79fb      	ldrb	r3, [r7, #7]
     3ba:	2b40      	cmp	r3, #64	; 0x40
     3bc:	d904      	bls.n	3c8 <hexdigit+0x34>
     3be:	79fb      	ldrb	r3, [r7, #7]
     3c0:	2b46      	cmp	r3, #70	; 0x46
     3c2:	d801      	bhi.n	3c8 <hexdigit+0x34>
     3c4:	2301      	movs	r3, #1
     3c6:	e000      	b.n	3ca <hexdigit+0x36>
     3c8:	2300      	movs	r3, #0
}
     3ca:	4618      	mov	r0, r3
     3cc:	3708      	adds	r7, #8
     3ce:	46bd      	mov	sp, r7
     3d0:	bd80      	pop	{r7, pc}
     3d2:	bf00      	nop

000003d4 <atoi>:

int atoi(const char *str){
     3d4:	b580      	push	{r7, lr}
     3d6:	b086      	sub	sp, #24
     3d8:	af00      	add	r7, sp, #0
     3da:	6078      	str	r0, [r7, #4]
	int n=0,sign=1,base=10;
     3dc:	2300      	movs	r3, #0
     3de:	617b      	str	r3, [r7, #20]
     3e0:	2301      	movs	r3, #1
     3e2:	613b      	str	r3, [r7, #16]
     3e4:	230a      	movs	r3, #10
     3e6:	60fb      	str	r3, [r7, #12]
    char c;
    
	while (*str && (*str==SPACE)) str++;
     3e8:	e002      	b.n	3f0 <atoi+0x1c>
     3ea:	687b      	ldr	r3, [r7, #4]
     3ec:	3301      	adds	r3, #1
     3ee:	607b      	str	r3, [r7, #4]
     3f0:	687b      	ldr	r3, [r7, #4]
     3f2:	781b      	ldrb	r3, [r3, #0]
     3f4:	2b00      	cmp	r3, #0
     3f6:	d003      	beq.n	400 <atoi+0x2c>
     3f8:	687b      	ldr	r3, [r7, #4]
     3fa:	781b      	ldrb	r3, [r3, #0]
     3fc:	2b20      	cmp	r3, #32
     3fe:	d0f4      	beq.n	3ea <atoi+0x16>
	if (*str=='-'){
     400:	687b      	ldr	r3, [r7, #4]
     402:	781b      	ldrb	r3, [r3, #0]
     404:	2b2d      	cmp	r3, #45	; 0x2d
     406:	d105      	bne.n	414 <atoi+0x40>
		sign=-1;
     408:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     40c:	613b      	str	r3, [r7, #16]
		str++;
     40e:	687b      	ldr	r3, [r7, #4]
     410:	3301      	adds	r3, #1
     412:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
     414:	687b      	ldr	r3, [r7, #4]
     416:	781b      	ldrb	r3, [r3, #0]
     418:	2b30      	cmp	r3, #48	; 0x30
     41a:	d10e      	bne.n	43a <atoi+0x66>
     41c:	687b      	ldr	r3, [r7, #4]
     41e:	3301      	adds	r3, #1
     420:	781b      	ldrb	r3, [r3, #0]
     422:	2b78      	cmp	r3, #120	; 0x78
     424:	d004      	beq.n	430 <atoi+0x5c>
     426:	687b      	ldr	r3, [r7, #4]
     428:	3301      	adds	r3, #1
     42a:	781b      	ldrb	r3, [r3, #0]
     42c:	2b58      	cmp	r3, #88	; 0x58
     42e:	d104      	bne.n	43a <atoi+0x66>
		base=16;
     430:	2310      	movs	r3, #16
     432:	60fb      	str	r3, [r7, #12]
		str+=2;
     434:	687b      	ldr	r3, [r7, #4]
     436:	3302      	adds	r3, #2
     438:	607b      	str	r3, [r7, #4]
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     43a:	e018      	b.n	46e <atoi+0x9a>
		if (c>='a'){c-=32;}
     43c:	7afb      	ldrb	r3, [r7, #11]
     43e:	2b60      	cmp	r3, #96	; 0x60
     440:	d902      	bls.n	448 <atoi+0x74>
     442:	7afb      	ldrb	r3, [r7, #11]
     444:	3b20      	subs	r3, #32
     446:	72fb      	strb	r3, [r7, #11]
		c-='0';
     448:	7afb      	ldrb	r3, [r7, #11]
     44a:	3b30      	subs	r3, #48	; 0x30
     44c:	72fb      	strb	r3, [r7, #11]
		if (c>9){c-=7;}
     44e:	7afb      	ldrb	r3, [r7, #11]
     450:	2b09      	cmp	r3, #9
     452:	d902      	bls.n	45a <atoi+0x86>
     454:	7afb      	ldrb	r3, [r7, #11]
     456:	3b07      	subs	r3, #7
     458:	72fb      	strb	r3, [r7, #11]
		n=n*base+c;
     45a:	697b      	ldr	r3, [r7, #20]
     45c:	68fa      	ldr	r2, [r7, #12]
     45e:	fb02 f203 	mul.w	r2, r2, r3
     462:	7afb      	ldrb	r3, [r7, #11]
     464:	4413      	add	r3, r2
     466:	617b      	str	r3, [r7, #20]
		str++;
     468:	687b      	ldr	r3, [r7, #4]
     46a:	3301      	adds	r3, #1
     46c:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
		base=16;
		str+=2;
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     46e:	687b      	ldr	r3, [r7, #4]
     470:	781b      	ldrb	r3, [r3, #0]
     472:	72fb      	strb	r3, [r7, #11]
     474:	7afb      	ldrb	r3, [r7, #11]
     476:	2b00      	cmp	r3, #0
     478:	d00d      	beq.n	496 <atoi+0xc2>
     47a:	68fb      	ldr	r3, [r7, #12]
     47c:	2b0a      	cmp	r3, #10
     47e:	d10a      	bne.n	496 <atoi+0xc2>
     480:	7afb      	ldrb	r3, [r7, #11]
     482:	4618      	mov	r0, r3
     484:	f7ff ff72 	bl	36c <digit>
     488:	4603      	mov	r3, r0
     48a:	2b00      	cmp	r3, #0
     48c:	bf14      	ite	ne
     48e:	2301      	movne	r3, #1
     490:	2300      	moveq	r3, #0
     492:	b2db      	uxtb	r3, r3
     494:	e009      	b.n	4aa <atoi+0xd6>
     496:	7afb      	ldrb	r3, [r7, #11]
     498:	4618      	mov	r0, r3
     49a:	f7ff ff7b 	bl	394 <hexdigit>
     49e:	4603      	mov	r3, r0
     4a0:	2b00      	cmp	r3, #0
     4a2:	bf14      	ite	ne
     4a4:	2301      	movne	r3, #1
     4a6:	2300      	moveq	r3, #0
     4a8:	b2db      	uxtb	r3, r3
     4aa:	2b00      	cmp	r3, #0
     4ac:	d1c6      	bne.n	43c <atoi+0x68>
		c-='0';
		if (c>9){c-=7;}
		n=n*base+c;
		str++;
	}
	return sign*n;
     4ae:	693b      	ldr	r3, [r7, #16]
     4b0:	697a      	ldr	r2, [r7, #20]
     4b2:	fb02 f303 	mul.w	r3, r2, r3
}
     4b6:	4618      	mov	r0, r3
     4b8:	3718      	adds	r7, #24
     4ba:	46bd      	mov	sp, r7
     4bc:	bd80      	pop	{r7, pc}
     4be:	bf00      	nop

000004c0 <peek8>:
static void word();

// routine de services


static inline uint8_t peek8(uint8_t *adr){
     4c0:	b480      	push	{r7}
     4c2:	b083      	sub	sp, #12
     4c4:	af00      	add	r7, sp, #0
     4c6:	6078      	str	r0, [r7, #4]
	return *adr;
     4c8:	687b      	ldr	r3, [r7, #4]
     4ca:	781b      	ldrb	r3, [r3, #0]
}
     4cc:	4618      	mov	r0, r3
     4ce:	370c      	adds	r7, #12
     4d0:	46bd      	mov	sp, r7
     4d2:	f85d 7b04 	ldr.w	r7, [sp], #4
     4d6:	4770      	bx	lr

000004d8 <peek16>:

static inline uint16_t peek16(uint16_t *adr){
     4d8:	b480      	push	{r7}
     4da:	b083      	sub	sp, #12
     4dc:	af00      	add	r7, sp, #0
     4de:	6078      	str	r0, [r7, #4]
	return *adr;
     4e0:	687b      	ldr	r3, [r7, #4]
     4e2:	881b      	ldrh	r3, [r3, #0]
}
     4e4:	4618      	mov	r0, r3
     4e6:	370c      	adds	r7, #12
     4e8:	46bd      	mov	sp, r7
     4ea:	f85d 7b04 	ldr.w	r7, [sp], #4
     4ee:	4770      	bx	lr

000004f0 <peek32>:

static inline uint32_t peek32(uint32_t *adr){
     4f0:	b480      	push	{r7}
     4f2:	b083      	sub	sp, #12
     4f4:	af00      	add	r7, sp, #0
     4f6:	6078      	str	r0, [r7, #4]
	return *adr;
     4f8:	687b      	ldr	r3, [r7, #4]
     4fa:	681b      	ldr	r3, [r3, #0]
}
     4fc:	4618      	mov	r0, r3
     4fe:	370c      	adds	r7, #12
     500:	46bd      	mov	sp, r7
     502:	f85d 7b04 	ldr.w	r7, [sp], #4
     506:	4770      	bx	lr

00000508 <poke8>:

static inline void poke8(uint8_t *adr, uint8_t value){
     508:	b480      	push	{r7}
     50a:	b083      	sub	sp, #12
     50c:	af00      	add	r7, sp, #0
     50e:	6078      	str	r0, [r7, #4]
     510:	460b      	mov	r3, r1
     512:	70fb      	strb	r3, [r7, #3]
	*adr=value;
     514:	687b      	ldr	r3, [r7, #4]
     516:	78fa      	ldrb	r2, [r7, #3]
     518:	701a      	strb	r2, [r3, #0]
}
     51a:	370c      	adds	r7, #12
     51c:	46bd      	mov	sp, r7
     51e:	f85d 7b04 	ldr.w	r7, [sp], #4
     522:	4770      	bx	lr

00000524 <poke16>:

static inline void poke16(uint16_t *adr, uint16_t value){
     524:	b480      	push	{r7}
     526:	b083      	sub	sp, #12
     528:	af00      	add	r7, sp, #0
     52a:	6078      	str	r0, [r7, #4]
     52c:	460b      	mov	r3, r1
     52e:	807b      	strh	r3, [r7, #2]
	*adr=value;
     530:	687b      	ldr	r3, [r7, #4]
     532:	887a      	ldrh	r2, [r7, #2]
     534:	801a      	strh	r2, [r3, #0]
}
     536:	370c      	adds	r7, #12
     538:	46bd      	mov	sp, r7
     53a:	f85d 7b04 	ldr.w	r7, [sp], #4
     53e:	4770      	bx	lr

00000540 <poke32>:

static inline void poke32(uint32_t *adr, uint32_t value){
     540:	b480      	push	{r7}
     542:	b083      	sub	sp, #12
     544:	af00      	add	r7, sp, #0
     546:	6078      	str	r0, [r7, #4]
     548:	6039      	str	r1, [r7, #0]
	*adr=value;
     54a:	687b      	ldr	r3, [r7, #4]
     54c:	683a      	ldr	r2, [r7, #0]
     54e:	601a      	str	r2, [r3, #0]
}
     550:	370c      	adds	r7, #12
     552:	46bd      	mov	sp, r7
     554:	f85d 7b04 	ldr.w	r7, [sp], #4
     558:	4770      	bx	lr
     55a:	bf00      	nop

0000055c <SVC_handler>:

// interruption multiplexeur des appels de services
void __attribute__((__interrupt__)) SVC_handler(){
     55c:	4668      	mov	r0, sp
     55e:	f020 0107 	bic.w	r1, r0, #7
     562:	468d      	mov	sp, r1
     564:	b591      	push	{r0, r4, r7, lr}
     566:	b084      	sub	sp, #16
     568:	af00      	add	r7, sp, #0
	int svc_id;
	void *arg1, *arg2; 
	asm volatile (
     56a:	f3ef 8009 	mrs	r0, PSP
     56e:	6981      	ldr	r1, [r0, #24]
     570:	f811 4c02 	ldrb.w	r4, [r1, #-2]
     574:	6802      	ldr	r2, [r0, #0]
     576:	6843      	ldr	r3, [r0, #4]
     578:	60fc      	str	r4, [r7, #12]
     57a:	60ba      	str	r2, [r7, #8]
     57c:	607b      	str	r3, [r7, #4]
    "ldr %[arg1],[r0]\n\t"
    "ldr %[arg2],[r0,#4]\n\t"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [arg2] "=r" (arg2)
    :: "r0","r1" 
    );
	switch (svc_id){
     57e:	68fb      	ldr	r3, [r7, #12]
     580:	2b13      	cmp	r3, #19
     582:	f200 80c1 	bhi.w	708 <SVC_handler+0x1ac>
     586:	a201      	add	r2, pc, #4	; (adr r2, 58c <SVC_handler+0x30>)
     588:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     58c:	00000703 	.word	0x00000703
     590:	000005dd 	.word	0x000005dd
     594:	000005e9 	.word	0x000005e9
     598:	000005f5 	.word	0x000005f5
     59c:	000005ff 	.word	0x000005ff
     5a0:	00000609 	.word	0x00000609
     5a4:	00000617 	.word	0x00000617
     5a8:	00000623 	.word	0x00000623
     5ac:	00000637 	.word	0x00000637
     5b0:	0000063f 	.word	0x0000063f
     5b4:	0000064d 	.word	0x0000064d
     5b8:	00000659 	.word	0x00000659
     5bc:	0000066d 	.word	0x0000066d
     5c0:	00000681 	.word	0x00000681
     5c4:	00000693 	.word	0x00000693
     5c8:	000006a7 	.word	0x000006a7
     5cc:	000006bb 	.word	0x000006bb
     5d0:	000006cf 	.word	0x000006cf
     5d4:	000006e7 	.word	0x000006e7
     5d8:	000006f9 	.word	0x000006f9
	case SVC_LED_ON:
		write_pin(LED_PORT,LED_PIN,LED_ON);
     5dc:	484d      	ldr	r0, [pc, #308]	; (714 <SVC_handler+0x1b8>)
     5de:	210d      	movs	r1, #13
     5e0:	2200      	movs	r2, #0
     5e2:	f001 fbc1 	bl	1d68 <write_pin>
		//led_on();
		break;
     5e6:	e08f      	b.n	708 <SVC_handler+0x1ac>
	case SVC_LED_OFF:
		write_pin(LED_PORT,LED_PIN,LED_OFF);
     5e8:	484a      	ldr	r0, [pc, #296]	; (714 <SVC_handler+0x1b8>)
     5ea:	210d      	movs	r1, #13
     5ec:	2201      	movs	r2, #1
     5ee:	f001 fbbb 	bl	1d68 <write_pin>
		//led_off();
		break;
     5f2:	e089      	b.n	708 <SVC_handler+0x1ac>
	case SVC_TIMER:
		timer=(*(unsigned*)arg1);
     5f4:	68bb      	ldr	r3, [r7, #8]
     5f6:	681b      	ldr	r3, [r3, #0]
     5f8:	4a47      	ldr	r2, [pc, #284]	; (718 <SVC_handler+0x1bc>)
     5fa:	6013      	str	r3, [r2, #0]
		break;
     5fc:	e084      	b.n	708 <SVC_handler+0x1ac>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=timer;
     5fe:	4b46      	ldr	r3, [pc, #280]	; (718 <SVC_handler+0x1bc>)
     600:	681a      	ldr	r2, [r3, #0]
     602:	68bb      	ldr	r3, [r7, #8]
     604:	601a      	str	r2, [r3, #0]
		break;
     606:	e07f      	b.n	708 <SVC_handler+0x1ac>
	case SVC_CONIN:
		*(char *)arg1=conin();
     608:	f000 fd8e 	bl	1128 <conin>
     60c:	4603      	mov	r3, r0
     60e:	461a      	mov	r2, r3
     610:	68bb      	ldr	r3, [r7, #8]
     612:	701a      	strb	r2, [r3, #0]
		break;
     614:	e078      	b.n	708 <SVC_handler+0x1ac>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     616:	68bb      	ldr	r3, [r7, #8]
     618:	781b      	ldrb	r3, [r3, #0]
     61a:	4618      	mov	r0, r3
     61c:	f000 fd74 	bl	1108 <conout>
		break;
     620:	e072      	b.n	708 <SVC_handler+0x1ac>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     622:	68bb      	ldr	r3, [r7, #8]
     624:	681b      	ldr	r3, [r3, #0]
     626:	6878      	ldr	r0, [r7, #4]
     628:	4619      	mov	r1, r3
     62a:	f000 fdab 	bl	1184 <read_line>
     62e:	4602      	mov	r2, r0
     630:	68bb      	ldr	r3, [r7, #8]
     632:	601a      	str	r2, [r3, #0]
		break;
     634:	e068      	b.n	708 <SVC_handler+0x1ac>
	case SVC_PRINT:
		print((const char*)arg1);
     636:	68b8      	ldr	r0, [r7, #8]
     638:	f000 fd80 	bl	113c <print>
		break;
     63c:	e064      	b.n	708 <SVC_handler+0x1ac>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     63e:	68bb      	ldr	r3, [r7, #8]
     640:	681b      	ldr	r3, [r3, #0]
     642:	4618      	mov	r0, r3
     644:	210a      	movs	r1, #10
     646:	f000 fe53 	bl	12f0 <print_int>
		break;
     64a:	e05d      	b.n	708 <SVC_handler+0x1ac>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     64c:	68bb      	ldr	r3, [r7, #8]
     64e:	681b      	ldr	r3, [r3, #0]
     650:	4618      	mov	r0, r3
     652:	f000 febb 	bl	13cc <print_hex>
		break;
     656:	e057      	b.n	708 <SVC_handler+0x1ac>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     658:	68bb      	ldr	r3, [r7, #8]
     65a:	681b      	ldr	r3, [r3, #0]
     65c:	4618      	mov	r0, r3
     65e:	f7ff ff2f 	bl	4c0 <peek8>
     662:	4603      	mov	r3, r0
     664:	461a      	mov	r2, r3
     666:	68bb      	ldr	r3, [r7, #8]
     668:	701a      	strb	r2, [r3, #0]
		break;
     66a:	e04d      	b.n	708 <SVC_handler+0x1ac>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     66c:	68bb      	ldr	r3, [r7, #8]
     66e:	681b      	ldr	r3, [r3, #0]
     670:	4618      	mov	r0, r3
     672:	f7ff ff31 	bl	4d8 <peek16>
     676:	4603      	mov	r3, r0
     678:	461a      	mov	r2, r3
     67a:	68bb      	ldr	r3, [r7, #8]
     67c:	801a      	strh	r2, [r3, #0]
		break;
     67e:	e043      	b.n	708 <SVC_handler+0x1ac>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     680:	68bb      	ldr	r3, [r7, #8]
     682:	681b      	ldr	r3, [r3, #0]
     684:	4618      	mov	r0, r3
     686:	f7ff ff33 	bl	4f0 <peek32>
     68a:	4602      	mov	r2, r0
     68c:	68bb      	ldr	r3, [r7, #8]
     68e:	601a      	str	r2, [r3, #0]
		break;
     690:	e03a      	b.n	708 <SVC_handler+0x1ac>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
     692:	68bb      	ldr	r3, [r7, #8]
     694:	681b      	ldr	r3, [r3, #0]
     696:	461a      	mov	r2, r3
     698:	687b      	ldr	r3, [r7, #4]
     69a:	781b      	ldrb	r3, [r3, #0]
     69c:	4610      	mov	r0, r2
     69e:	4619      	mov	r1, r3
     6a0:	f7ff ff32 	bl	508 <poke8>
		break;
     6a4:	e030      	b.n	708 <SVC_handler+0x1ac>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
     6a6:	68bb      	ldr	r3, [r7, #8]
     6a8:	681b      	ldr	r3, [r3, #0]
     6aa:	461a      	mov	r2, r3
     6ac:	687b      	ldr	r3, [r7, #4]
     6ae:	881b      	ldrh	r3, [r3, #0]
     6b0:	4610      	mov	r0, r2
     6b2:	4619      	mov	r1, r3
     6b4:	f7ff ff36 	bl	524 <poke16>
		break;
     6b8:	e026      	b.n	708 <SVC_handler+0x1ac>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
     6ba:	68bb      	ldr	r3, [r7, #8]
     6bc:	681b      	ldr	r3, [r3, #0]
     6be:	461a      	mov	r2, r3
     6c0:	687b      	ldr	r3, [r7, #4]
     6c2:	681b      	ldr	r3, [r3, #0]
     6c4:	4610      	mov	r0, r2
     6c6:	4619      	mov	r1, r3
     6c8:	f7ff ff3a 	bl	540 <poke32>
		break;
     6cc:	e01c      	b.n	708 <SVC_handler+0x1ac>
	case SVC_FLASH_WR:
		*(int*)arg1=flash_write(*(uint32_t*)arg1,*(uint16_t*)arg2);
     6ce:	68bb      	ldr	r3, [r7, #8]
     6d0:	681a      	ldr	r2, [r3, #0]
     6d2:	687b      	ldr	r3, [r7, #4]
     6d4:	881b      	ldrh	r3, [r3, #0]
     6d6:	4610      	mov	r0, r2
     6d8:	4619      	mov	r1, r3
     6da:	f000 ff21 	bl	1520 <flash_write>
     6de:	4602      	mov	r2, r0
     6e0:	68bb      	ldr	r3, [r7, #8]
     6e2:	601a      	str	r2, [r3, #0]
		break;
     6e4:	e010      	b.n	708 <SVC_handler+0x1ac>
	case SVC_FLASH_PGER:
		*(int*)arg1=flash_erase_page(*(uint32_t*)arg1);
     6e6:	68bb      	ldr	r3, [r7, #8]
     6e8:	681b      	ldr	r3, [r3, #0]
     6ea:	4618      	mov	r0, r3
     6ec:	f000 ff5c 	bl	15a8 <flash_erase_page>
     6f0:	4602      	mov	r2, r0
     6f2:	68bb      	ldr	r3, [r7, #8]
     6f4:	601a      	str	r2, [r3, #0]
		break;
     6f6:	e007      	b.n	708 <SVC_handler+0x1ac>
	case SVC_TICKS:
		*(unsigned*)arg1=ticks;
     6f8:	4b08      	ldr	r3, [pc, #32]	; (71c <SVC_handler+0x1c0>)
     6fa:	681a      	ldr	r2, [r3, #0]
     6fc:	68bb      	ldr	r3, [r7, #8]
     6fe:	601a      	str	r2, [r3, #0]
		break;
     700:	e002      	b.n	708 <SVC_handler+0x1ac>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     702:	f002 f803 	bl	270c <reset_mcu>
	    break;
     706:	bf00      	nop
	}	
}
     708:	3710      	adds	r7, #16
     70a:	46bd      	mov	sp, r7
     70c:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     710:	4685      	mov	sp, r0
     712:	4770      	bx	lr
     714:	40011000 	.word	0x40011000
     718:	200000e0 	.word	0x200000e0
     71c:	200000dc 	.word	0x200000dc

00000720 <set_sysclock>:


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     720:	b480      	push	{r7}
     722:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC->CR|=RCC_CR_HSEON;
     724:	4a18      	ldr	r2, [pc, #96]	; (788 <set_sysclock+0x68>)
     726:	4b18      	ldr	r3, [pc, #96]	; (788 <set_sysclock+0x68>)
     728:	681b      	ldr	r3, [r3, #0]
     72a:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     72e:	6013      	str	r3, [r2, #0]
	 // attend que l'oscillateur soit prêt
   while (!(RCC->CR&RCC_CR_HSERDY));
     730:	bf00      	nop
     732:	4b15      	ldr	r3, [pc, #84]	; (788 <set_sysclock+0x68>)
     734:	681b      	ldr	r3, [r3, #0]
     736:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
     73a:	2b00      	cmp	r3, #0
     73c:	d0f9      	beq.n	732 <set_sysclock+0x12>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 8 
     // pour une fréquence  Fsysclk de 64 Mhz
    RCC->CFGR|=RCC_CFGR_PLLSRC_HSE|(PLLMUL<<RCC_CFGR_PLLMUL_POS);
     73e:	4a12      	ldr	r2, [pc, #72]	; (788 <set_sysclock+0x68>)
     740:	4b11      	ldr	r3, [pc, #68]	; (788 <set_sysclock+0x68>)
     742:	685b      	ldr	r3, [r3, #4]
     744:	f443 2310 	orr.w	r3, r3, #589824	; 0x90000
     748:	6053      	str	r3, [r2, #4]
    // active le PLL
    RCC->CR|=RCC_CR_PLLON;
     74a:	4a0f      	ldr	r2, [pc, #60]	; (788 <set_sysclock+0x68>)
     74c:	4b0e      	ldr	r3, [pc, #56]	; (788 <set_sysclock+0x68>)
     74e:	681b      	ldr	r3, [r3, #0]
     750:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
     754:	6013      	str	r3, [r2, #0]
    // Attend que le PLL soit prêt
    while (!(RCC->CR&RCC_CR_PLLRDY));
     756:	bf00      	nop
     758:	4b0b      	ldr	r3, [pc, #44]	; (788 <set_sysclock+0x68>)
     75a:	681b      	ldr	r3, [r3, #0]
     75c:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
     760:	2b00      	cmp	r3, #0
     762:	d0f9      	beq.n	758 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    // active le prefetch buffer
    FLASH->ACR|=(WAIT_2_CY<<FLASH_ACR_LATENCY_POS)|FLASH_ACR_PRFTBE;
     764:	4a09      	ldr	r2, [pc, #36]	; (78c <set_sysclock+0x6c>)
     766:	4b09      	ldr	r3, [pc, #36]	; (78c <set_sysclock+0x6c>)
     768:	681b      	ldr	r3, [r3, #0]
     76a:	f043 0312 	orr.w	r3, r3, #18
     76e:	6013      	str	r3, [r2, #0]
	// La fréquence maximale pour APB1 doit-être de <=36 Mhz
	// donc divise SYSCLK/2
    // Sélectionne le PLL comme source pour SYSCLK dans CR
	RCC->CFGR|=(RCC_CFGR_PPREx_DIV2<<RCC_CFGR_PPRE1_POS)|(RCC_CFGR_SW_PLL<<RCC_CFGR_SW_POS);
     770:	4a05      	ldr	r2, [pc, #20]	; (788 <set_sysclock+0x68>)
     772:	4b05      	ldr	r3, [pc, #20]	; (788 <set_sysclock+0x68>)
     774:	685b      	ldr	r3, [r3, #4]
     776:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     77a:	f043 0302 	orr.w	r3, r3, #2
     77e:	6053      	str	r3, [r2, #4]
}
     780:	46bd      	mov	sp, r7
     782:	f85d 7b04 	ldr.w	r7, [sp], #4
     786:	4770      	bx	lr
     788:	40021000 	.word	0x40021000
     78c:	40022000 	.word	0x40022000

00000790 <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     790:	b480      	push	{r7}
     792:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     794:	2300      	movs	r3, #0
     796:	2200      	movs	r2, #0
     798:	4618      	mov	r0, r3
     79a:	4611      	mov	r1, r2
     79c:	df00      	svc	0
}
     79e:	46bd      	mov	sp, r7
     7a0:	f85d 7b04 	ldr.w	r7, [sp], #4
     7a4:	4770      	bx	lr
     7a6:	bf00      	nop

000007a8 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     7a8:	b480      	push	{r7}
     7aa:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     7ac:	2300      	movs	r3, #0
     7ae:	2200      	movs	r2, #0
     7b0:	4618      	mov	r0, r3
     7b2:	4611      	mov	r1, r2
     7b4:	df01      	svc	1
}
     7b6:	46bd      	mov	sp, r7
     7b8:	f85d 7b04 	ldr.w	r7, [sp], #4
     7bc:	4770      	bx	lr
     7be:	bf00      	nop

000007c0 <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     7c0:	b480      	push	{r7}
     7c2:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     7c4:	2300      	movs	r3, #0
     7c6:	2200      	movs	r2, #0
     7c8:	4618      	mov	r0, r3
     7ca:	4611      	mov	r1, r2
     7cc:	df02      	svc	2
}
     7ce:	46bd      	mov	sp, r7
     7d0:	f85d 7b04 	ldr.w	r7, [sp], #4
     7d4:	4770      	bx	lr
     7d6:	bf00      	nop

000007d8 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     7d8:	b580      	push	{r7, lr}
     7da:	b082      	sub	sp, #8
     7dc:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     7de:	f000 faf7 	bl	dd0 <word>
	n=atoi((const char*)pad);
     7e2:	4806      	ldr	r0, [pc, #24]	; (7fc <cmd_set_timer+0x24>)
     7e4:	f7ff fdf6 	bl	3d4 <atoi>
     7e8:	4603      	mov	r3, r0
     7ea:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     7ec:	1d3b      	adds	r3, r7, #4
     7ee:	2200      	movs	r2, #0
     7f0:	4618      	mov	r0, r3
     7f2:	4611      	mov	r1, r2
     7f4:	df03      	svc	3
}
     7f6:	3708      	adds	r7, #8
     7f8:	46bd      	mov	sp, r7
     7fa:	bd80      	pop	{r7, pc}
     7fc:	20000058 	.word	0x20000058

00000800 <cmd_get_timer>:

static void cmd_get_timer(){
     800:	b480      	push	{r7}
     802:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     804:	4b04      	ldr	r3, [pc, #16]	; (818 <cmd_get_timer+0x18>)
     806:	2200      	movs	r2, #0
     808:	4618      	mov	r0, r3
     80a:	4611      	mov	r1, r2
     80c:	df04      	svc	4
}
     80e:	46bd      	mov	sp, r7
     810:	f85d 7b04 	ldr.w	r7, [sp], #4
     814:	4770      	bx	lr
     816:	bf00      	nop
     818:	20000058 	.word	0x20000058

0000081c <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     81c:	b480      	push	{r7}
     81e:	b083      	sub	sp, #12
     820:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     822:	1d3b      	adds	r3, r7, #4
     824:	2200      	movs	r2, #0
     826:	4618      	mov	r0, r3
     828:	4611      	mov	r1, r2
     82a:	df04      	svc	4
     82c:	687b      	ldr	r3, [r7, #4]
     82e:	2b00      	cmp	r3, #0
     830:	d1f7      	bne.n	822 <cmd_pause+0x6>
}
     832:	370c      	adds	r7, #12
     834:	46bd      	mov	sp, r7
     836:	f85d 7b04 	ldr.w	r7, [sp], #4
     83a:	4770      	bx	lr

0000083c <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     83c:	b480      	push	{r7}
     83e:	b083      	sub	sp, #12
     840:	af00      	add	r7, sp, #0
	volatile char n=0;
     842:	2300      	movs	r3, #0
     844:	71fb      	strb	r3, [r7, #7]
	while (!n){
     846:	e004      	b.n	852 <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     848:	1dfb      	adds	r3, r7, #7
     84a:	2200      	movs	r2, #0
     84c:	4618      	mov	r0, r3
     84e:	4611      	mov	r1, r2
     850:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     852:	79fb      	ldrb	r3, [r7, #7]
     854:	b2db      	uxtb	r3, r3
     856:	2b00      	cmp	r3, #0
     858:	d0f6      	beq.n	848 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     85a:	79fb      	ldrb	r3, [r7, #7]
     85c:	b2da      	uxtb	r2, r3
     85e:	4b05      	ldr	r3, [pc, #20]	; (874 <cmd_getc+0x38>)
     860:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     862:	4b04      	ldr	r3, [pc, #16]	; (874 <cmd_getc+0x38>)
     864:	2200      	movs	r2, #0
     866:	705a      	strb	r2, [r3, #1]
}
     868:	370c      	adds	r7, #12
     86a:	46bd      	mov	sp, r7
     86c:	f85d 7b04 	ldr.w	r7, [sp], #4
     870:	4770      	bx	lr
     872:	bf00      	nop
     874:	20000058 	.word	0x20000058

00000878 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     878:	b580      	push	{r7, lr}
     87a:	b082      	sub	sp, #8
     87c:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     87e:	f000 faa7 	bl	dd0 <word>
	cmd_id=search_command((const char*)pad);
     882:	480a      	ldr	r0, [pc, #40]	; (8ac <cmd_putc+0x34>)
     884:	f000 f98e 	bl	ba4 <search_command>
     888:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     88a:	687b      	ldr	r3, [r7, #4]
     88c:	2b00      	cmp	r3, #0
     88e:	db05      	blt.n	89c <cmd_putc+0x24>
     890:	4a07      	ldr	r2, [pc, #28]	; (8b0 <cmd_putc+0x38>)
     892:	687b      	ldr	r3, [r7, #4]
     894:	00db      	lsls	r3, r3, #3
     896:	4413      	add	r3, r2
     898:	685b      	ldr	r3, [r3, #4]
     89a:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     89c:	4b03      	ldr	r3, [pc, #12]	; (8ac <cmd_putc+0x34>)
     89e:	2200      	movs	r2, #0
     8a0:	4618      	mov	r0, r3
     8a2:	4611      	mov	r1, r2
     8a4:	df06      	svc	6
}
     8a6:	3708      	adds	r7, #8
     8a8:	46bd      	mov	sp, r7
     8aa:	bd80      	pop	{r7, pc}
     8ac:	20000058 	.word	0x20000058
     8b0:	00003050 	.word	0x00003050

000008b4 <cmd_readln>:

static void cmd_readln(){
     8b4:	b580      	push	{r7, lr}
     8b6:	b082      	sub	sp, #8
     8b8:	af00      	add	r7, sp, #0
	unsigned llen=80;
     8ba:	2350      	movs	r3, #80	; 0x50
     8bc:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     8be:	1d3b      	adds	r3, r7, #4
     8c0:	4a04      	ldr	r2, [pc, #16]	; (8d4 <cmd_readln+0x20>)
     8c2:	4618      	mov	r0, r3
     8c4:	4611      	mov	r1, r2
     8c6:	df07      	svc	7
	print((const char*)pad);
     8c8:	4802      	ldr	r0, [pc, #8]	; (8d4 <cmd_readln+0x20>)
     8ca:	f000 fc37 	bl	113c <print>
}
     8ce:	3708      	adds	r7, #8
     8d0:	46bd      	mov	sp, r7
     8d2:	bd80      	pop	{r7, pc}
     8d4:	20000058 	.word	0x20000058

000008d8 <cmd_print>:

static void cmd_print(){
     8d8:	b580      	push	{r7, lr}
     8da:	af00      	add	r7, sp, #0
	word();
     8dc:	f000 fa78 	bl	dd0 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     8e0:	4b02      	ldr	r3, [pc, #8]	; (8ec <cmd_print+0x14>)
     8e2:	2200      	movs	r2, #0
     8e4:	4618      	mov	r0, r3
     8e6:	4611      	mov	r1, r2
     8e8:	df08      	svc	8
}
     8ea:	bd80      	pop	{r7, pc}
     8ec:	20000058 	.word	0x20000058

000008f0 <cmd_print_int>:

static void cmd_print_int(){
     8f0:	b580      	push	{r7, lr}
     8f2:	b082      	sub	sp, #8
     8f4:	af00      	add	r7, sp, #0
	int cmd_id;
    unsigned u32;
    
	word();
     8f6:	f000 fa6b 	bl	dd0 <word>
	cmd_id=search_command((const char*)pad);
     8fa:	480e      	ldr	r0, [pc, #56]	; (934 <cmd_print_int+0x44>)
     8fc:	f000 f952 	bl	ba4 <search_command>
     900:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     902:	687b      	ldr	r3, [r7, #4]
     904:	2b00      	cmp	r3, #0
     906:	db06      	blt.n	916 <cmd_print_int+0x26>
		 commands[cmd_id].fn();
     908:	4a0b      	ldr	r2, [pc, #44]	; (938 <cmd_print_int+0x48>)
     90a:	687b      	ldr	r3, [r7, #4]
     90c:	00db      	lsls	r3, r3, #3
     90e:	4413      	add	r3, r2
     910:	685b      	ldr	r3, [r3, #4]
     912:	4798      	blx	r3
     914:	e006      	b.n	924 <cmd_print_int+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     916:	4807      	ldr	r0, [pc, #28]	; (934 <cmd_print_int+0x44>)
     918:	f7ff fd5c 	bl	3d4 <atoi>
     91c:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     91e:	4a05      	ldr	r2, [pc, #20]	; (934 <cmd_print_int+0x44>)
     920:	687b      	ldr	r3, [r7, #4]
     922:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_INT,pad,NUL);
     924:	4b03      	ldr	r3, [pc, #12]	; (934 <cmd_print_int+0x44>)
     926:	2200      	movs	r2, #0
     928:	4618      	mov	r0, r3
     92a:	4611      	mov	r1, r2
     92c:	df09      	svc	9
}
     92e:	3708      	adds	r7, #8
     930:	46bd      	mov	sp, r7
     932:	bd80      	pop	{r7, pc}
     934:	20000058 	.word	0x20000058
     938:	00003050 	.word	0x00003050

0000093c <cmd_print_hex>:

static void cmd_print_hex(){
     93c:	b580      	push	{r7, lr}
     93e:	b082      	sub	sp, #8
     940:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     942:	f000 fa45 	bl	dd0 <word>
	cmd_id=search_command((const char*)pad);
     946:	480e      	ldr	r0, [pc, #56]	; (980 <cmd_print_hex+0x44>)
     948:	f000 f92c 	bl	ba4 <search_command>
     94c:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     94e:	687b      	ldr	r3, [r7, #4]
     950:	2b00      	cmp	r3, #0
     952:	db06      	blt.n	962 <cmd_print_hex+0x26>
		 commands[cmd_id].fn();
     954:	4a0b      	ldr	r2, [pc, #44]	; (984 <cmd_print_hex+0x48>)
     956:	687b      	ldr	r3, [r7, #4]
     958:	00db      	lsls	r3, r3, #3
     95a:	4413      	add	r3, r2
     95c:	685b      	ldr	r3, [r3, #4]
     95e:	4798      	blx	r3
     960:	e006      	b.n	970 <cmd_print_hex+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     962:	4807      	ldr	r0, [pc, #28]	; (980 <cmd_print_hex+0x44>)
     964:	f7ff fd36 	bl	3d4 <atoi>
     968:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     96a:	4a05      	ldr	r2, [pc, #20]	; (980 <cmd_print_hex+0x44>)
     96c:	687b      	ldr	r3, [r7, #4]
     96e:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_HEX,pad,NUL);
     970:	4b03      	ldr	r3, [pc, #12]	; (980 <cmd_print_hex+0x44>)
     972:	2200      	movs	r2, #0
     974:	4618      	mov	r0, r3
     976:	4611      	mov	r1, r2
     978:	df0a      	svc	10
}
     97a:	3708      	adds	r7, #8
     97c:	46bd      	mov	sp, r7
     97e:	bd80      	pop	{r7, pc}
     980:	20000058 	.word	0x20000058
     984:	00003050 	.word	0x00003050

00000988 <cmd_run>:

static void cmd_run(){
     988:	b580      	push	{r7, lr}
     98a:	af00      	add	r7, sp, #0
	((fn)proga)();
     98c:	4b01      	ldr	r3, [pc, #4]	; (994 <cmd_run+0xc>)
     98e:	681b      	ldr	r3, [r3, #0]
     990:	4798      	blx	r3
	
}
     992:	bd80      	pop	{r7, pc}
     994:	200000ec 	.word	0x200000ec

00000998 <cmd_peek8>:

static void cmd_peek8(){
     998:	b580      	push	{r7, lr}
     99a:	b082      	sub	sp, #8
     99c:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     99e:	f000 fa17 	bl	dd0 <word>
	u=atoi((const char*)pad);
     9a2:	4808      	ldr	r0, [pc, #32]	; (9c4 <cmd_peek8+0x2c>)
     9a4:	f7ff fd16 	bl	3d4 <atoi>
     9a8:	4603      	mov	r3, r0
     9aa:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     9ac:	1d3b      	adds	r3, r7, #4
     9ae:	2200      	movs	r2, #0
     9b0:	4618      	mov	r0, r3
     9b2:	4611      	mov	r1, r2
     9b4:	df0b      	svc	11
	*(uint32_t*)pad=u&0xff;
     9b6:	4a03      	ldr	r2, [pc, #12]	; (9c4 <cmd_peek8+0x2c>)
     9b8:	687b      	ldr	r3, [r7, #4]
     9ba:	b2db      	uxtb	r3, r3
     9bc:	6013      	str	r3, [r2, #0]
}
     9be:	3708      	adds	r7, #8
     9c0:	46bd      	mov	sp, r7
     9c2:	bd80      	pop	{r7, pc}
     9c4:	20000058 	.word	0x20000058

000009c8 <cmd_peek16>:

static void cmd_peek16(){
     9c8:	b580      	push	{r7, lr}
     9ca:	b082      	sub	sp, #8
     9cc:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9ce:	f000 f9ff 	bl	dd0 <word>
	u=atoi((const char*)pad);
     9d2:	4808      	ldr	r0, [pc, #32]	; (9f4 <cmd_peek16+0x2c>)
     9d4:	f7ff fcfe 	bl	3d4 <atoi>
     9d8:	4603      	mov	r3, r0
     9da:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     9dc:	1d3b      	adds	r3, r7, #4
     9de:	2200      	movs	r2, #0
     9e0:	4618      	mov	r0, r3
     9e2:	4611      	mov	r1, r2
     9e4:	df0c      	svc	12
	*(uint32_t*)pad=u&0xffff;
     9e6:	4a03      	ldr	r2, [pc, #12]	; (9f4 <cmd_peek16+0x2c>)
     9e8:	687b      	ldr	r3, [r7, #4]
     9ea:	b29b      	uxth	r3, r3
     9ec:	6013      	str	r3, [r2, #0]
}
     9ee:	3708      	adds	r7, #8
     9f0:	46bd      	mov	sp, r7
     9f2:	bd80      	pop	{r7, pc}
     9f4:	20000058 	.word	0x20000058

000009f8 <cmd_peek32>:

static void cmd_peek32(){
     9f8:	b580      	push	{r7, lr}
     9fa:	b082      	sub	sp, #8
     9fc:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     9fe:	f000 f9e7 	bl	dd0 <word>
	u=atoi((const char*)pad);
     a02:	4808      	ldr	r0, [pc, #32]	; (a24 <cmd_peek32+0x2c>)
     a04:	f7ff fce6 	bl	3d4 <atoi>
     a08:	4603      	mov	r3, r0
     a0a:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK32,&u,NUL);
     a0c:	1d3b      	adds	r3, r7, #4
     a0e:	2200      	movs	r2, #0
     a10:	4618      	mov	r0, r3
     a12:	4611      	mov	r1, r2
     a14:	df0d      	svc	13
	*(uint32_t*)pad=u;
     a16:	4a03      	ldr	r2, [pc, #12]	; (a24 <cmd_peek32+0x2c>)
     a18:	687b      	ldr	r3, [r7, #4]
     a1a:	6013      	str	r3, [r2, #0]
}
     a1c:	3708      	adds	r7, #8
     a1e:	46bd      	mov	sp, r7
     a20:	bd80      	pop	{r7, pc}
     a22:	bf00      	nop
     a24:	20000058 	.word	0x20000058

00000a28 <cmd_poke8>:

static void cmd_poke8(){
     a28:	b580      	push	{r7, lr}
     a2a:	b082      	sub	sp, #8
     a2c:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     a2e:	f000 f9cf 	bl	dd0 <word>
	adr=atoi((const char*)pad);
     a32:	480a      	ldr	r0, [pc, #40]	; (a5c <cmd_poke8+0x34>)
     a34:	f7ff fcce 	bl	3d4 <atoi>
     a38:	4603      	mov	r3, r0
     a3a:	607b      	str	r3, [r7, #4]
	word();
     a3c:	f000 f9c8 	bl	dd0 <word>
	u8=atoi((const char*)pad);
     a40:	4806      	ldr	r0, [pc, #24]	; (a5c <cmd_poke8+0x34>)
     a42:	f7ff fcc7 	bl	3d4 <atoi>
     a46:	4603      	mov	r3, r0
     a48:	b2db      	uxtb	r3, r3
     a4a:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     a4c:	1d3b      	adds	r3, r7, #4
     a4e:	1cfa      	adds	r2, r7, #3
     a50:	4618      	mov	r0, r3
     a52:	4611      	mov	r1, r2
     a54:	df0e      	svc	14
}
     a56:	3708      	adds	r7, #8
     a58:	46bd      	mov	sp, r7
     a5a:	bd80      	pop	{r7, pc}
     a5c:	20000058 	.word	0x20000058

00000a60 <cmd_poke16>:

static void cmd_poke16(){
     a60:	b580      	push	{r7, lr}
     a62:	b082      	sub	sp, #8
     a64:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     a66:	f000 f9b3 	bl	dd0 <word>
	adr=atoi((const char*)pad);
     a6a:	480a      	ldr	r0, [pc, #40]	; (a94 <cmd_poke16+0x34>)
     a6c:	f7ff fcb2 	bl	3d4 <atoi>
     a70:	4603      	mov	r3, r0
     a72:	607b      	str	r3, [r7, #4]
	word();
     a74:	f000 f9ac 	bl	dd0 <word>
	u16=atoi((const char*)pad);
     a78:	4806      	ldr	r0, [pc, #24]	; (a94 <cmd_poke16+0x34>)
     a7a:	f7ff fcab 	bl	3d4 <atoi>
     a7e:	4603      	mov	r3, r0
     a80:	b29b      	uxth	r3, r3
     a82:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     a84:	1d3b      	adds	r3, r7, #4
     a86:	1cba      	adds	r2, r7, #2
     a88:	4618      	mov	r0, r3
     a8a:	4611      	mov	r1, r2
     a8c:	df0f      	svc	15
}
     a8e:	3708      	adds	r7, #8
     a90:	46bd      	mov	sp, r7
     a92:	bd80      	pop	{r7, pc}
     a94:	20000058 	.word	0x20000058

00000a98 <cmd_poke32>:

static void cmd_poke32(){
     a98:	b580      	push	{r7, lr}
     a9a:	b082      	sub	sp, #8
     a9c:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     a9e:	f000 f997 	bl	dd0 <word>
	adr=atoi((const char*)pad);
     aa2:	480a      	ldr	r0, [pc, #40]	; (acc <cmd_poke32+0x34>)
     aa4:	f7ff fc96 	bl	3d4 <atoi>
     aa8:	4603      	mov	r3, r0
     aaa:	607b      	str	r3, [r7, #4]
	word();
     aac:	f000 f990 	bl	dd0 <word>
	u32=atoi((const char*)pad);
     ab0:	4806      	ldr	r0, [pc, #24]	; (acc <cmd_poke32+0x34>)
     ab2:	f7ff fc8f 	bl	3d4 <atoi>
     ab6:	4603      	mov	r3, r0
     ab8:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     aba:	1d3b      	adds	r3, r7, #4
     abc:	463a      	mov	r2, r7
     abe:	4618      	mov	r0, r3
     ac0:	4611      	mov	r1, r2
     ac2:	df10      	svc	16
}
     ac4:	3708      	adds	r7, #8
     ac6:	46bd      	mov	sp, r7
     ac8:	bd80      	pop	{r7, pc}
     aca:	bf00      	nop
     acc:	20000058 	.word	0x20000058

00000ad0 <cmd_fwrite>:

static void cmd_fwrite(){
     ad0:	b580      	push	{r7, lr}
     ad2:	b082      	sub	sp, #8
     ad4:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	word();
     ad6:	f000 f97b 	bl	dd0 <word>
	adr=atoi((const char*)pad);
     ada:	480d      	ldr	r0, [pc, #52]	; (b10 <cmd_fwrite+0x40>)
     adc:	f7ff fc7a 	bl	3d4 <atoi>
     ae0:	4603      	mov	r3, r0
     ae2:	607b      	str	r3, [r7, #4]
	word();
     ae4:	f000 f974 	bl	dd0 <word>
	u32=atoi((const char*)pad);
     ae8:	4809      	ldr	r0, [pc, #36]	; (b10 <cmd_fwrite+0x40>)
     aea:	f7ff fc73 	bl	3d4 <atoi>
     aee:	4603      	mov	r3, r0
     af0:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_FLASH_WR,&adr,&u32);
     af2:	1d3b      	adds	r3, r7, #4
     af4:	463a      	mov	r2, r7
     af6:	4618      	mov	r0, r3
     af8:	4611      	mov	r1, r2
     afa:	df11      	svc	17
	if (!adr) print(" failed\n");
     afc:	687b      	ldr	r3, [r7, #4]
     afe:	2b00      	cmp	r3, #0
     b00:	d102      	bne.n	b08 <cmd_fwrite+0x38>
     b02:	4804      	ldr	r0, [pc, #16]	; (b14 <cmd_fwrite+0x44>)
     b04:	f000 fb1a 	bl	113c <print>
}
     b08:	3708      	adds	r7, #8
     b0a:	46bd      	mov	sp, r7
     b0c:	bd80      	pop	{r7, pc}
     b0e:	bf00      	nop
     b10:	20000058 	.word	0x20000058
     b14:	00002f90 	.word	0x00002f90

00000b18 <cmd_pgerase>:

static void cmd_pgerase(){
     b18:	b580      	push	{r7, lr}
     b1a:	b082      	sub	sp, #8
     b1c:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     b1e:	f000 f957 	bl	dd0 <word>
	adr=atoi((const char*)pad);
     b22:	4809      	ldr	r0, [pc, #36]	; (b48 <cmd_pgerase+0x30>)
     b24:	f7ff fc56 	bl	3d4 <atoi>
     b28:	4603      	mov	r3, r0
     b2a:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_FLASH_PGER,&adr,0);
     b2c:	1d3b      	adds	r3, r7, #4
     b2e:	2200      	movs	r2, #0
     b30:	4618      	mov	r0, r3
     b32:	4611      	mov	r1, r2
     b34:	df12      	svc	18
	if (!adr) print(" failed\n");
     b36:	687b      	ldr	r3, [r7, #4]
     b38:	2b00      	cmp	r3, #0
     b3a:	d102      	bne.n	b42 <cmd_pgerase+0x2a>
     b3c:	4803      	ldr	r0, [pc, #12]	; (b4c <cmd_pgerase+0x34>)
     b3e:	f000 fafd 	bl	113c <print>
}
     b42:	3708      	adds	r7, #8
     b44:	46bd      	mov	sp, r7
     b46:	bd80      	pop	{r7, pc}
     b48:	20000058 	.word	0x20000058
     b4c:	00002f90 	.word	0x00002f90

00000b50 <cmd_ticks>:

static void cmd_ticks(){
     b50:	b480      	push	{r7}
     b52:	af00      	add	r7, sp, #0
	_svc_call(SVC_TICKS,&pad,0);
     b54:	4b04      	ldr	r3, [pc, #16]	; (b68 <cmd_ticks+0x18>)
     b56:	2200      	movs	r2, #0
     b58:	4618      	mov	r0, r3
     b5a:	4611      	mov	r1, r2
     b5c:	df13      	svc	19
}
     b5e:	46bd      	mov	sp, r7
     b60:	f85d 7b04 	ldr.w	r7, [sp], #4
     b64:	4770      	bx	lr
     b66:	bf00      	nop
     b68:	20000058 	.word	0x20000058

00000b6c <cmd_con>:

static void cmd_con(){
     b6c:	b580      	push	{r7, lr}
     b6e:	b082      	sub	sp, #8
     b70:	af00      	add	r7, sp, #0
	console_dev_t dev;
	word();
     b72:	f000 f92d 	bl	dd0 <word>
	if (!strcmp("local",(const char*)pad)){
     b76:	4809      	ldr	r0, [pc, #36]	; (b9c <cmd_con+0x30>)
     b78:	4909      	ldr	r1, [pc, #36]	; (ba0 <cmd_con+0x34>)
     b7a:	f7ff fbad 	bl	2d8 <strcmp>
     b7e:	4603      	mov	r3, r0
     b80:	2b00      	cmp	r3, #0
     b82:	d102      	bne.n	b8a <cmd_con+0x1e>
		dev=LOCAL;
     b84:	2300      	movs	r3, #0
     b86:	71fb      	strb	r3, [r7, #7]
     b88:	e001      	b.n	b8e <cmd_con+0x22>
	}else{
		dev=SERIAL;
     b8a:	2301      	movs	r3, #1
     b8c:	71fb      	strb	r3, [r7, #7]
	}
	con_select(dev);
     b8e:	79fb      	ldrb	r3, [r7, #7]
     b90:	4618      	mov	r0, r3
     b92:	f000 fa65 	bl	1060 <con_select>
}
     b96:	3708      	adds	r7, #8
     b98:	46bd      	mov	sp, r7
     b9a:	bd80      	pop	{r7, pc}
     b9c:	00002f9c 	.word	0x00002f9c
     ba0:	20000058 	.word	0x20000058

00000ba4 <search_command>:
	{"con",cmd_con},
	{NUL,NUL}
};


int search_command(const char * name){
     ba4:	b580      	push	{r7, lr}
     ba6:	b084      	sub	sp, #16
     ba8:	af00      	add	r7, sp, #0
     baa:	6078      	str	r0, [r7, #4]
	int i=0;
     bac:	2300      	movs	r3, #0
     bae:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     bb0:	e00e      	b.n	bd0 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     bb2:	4a12      	ldr	r2, [pc, #72]	; (bfc <search_command+0x58>)
     bb4:	68fb      	ldr	r3, [r7, #12]
     bb6:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     bba:	4618      	mov	r0, r3
     bbc:	6879      	ldr	r1, [r7, #4]
     bbe:	f7ff fb8b 	bl	2d8 <strcmp>
     bc2:	4603      	mov	r3, r0
     bc4:	2b00      	cmp	r3, #0
     bc6:	d100      	bne.n	bca <search_command+0x26>
			break;
     bc8:	e009      	b.n	bde <search_command+0x3a>
		}
		i++;
     bca:	68fb      	ldr	r3, [r7, #12]
     bcc:	3301      	adds	r3, #1
     bce:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     bd0:	4a0a      	ldr	r2, [pc, #40]	; (bfc <search_command+0x58>)
     bd2:	68fb      	ldr	r3, [r7, #12]
     bd4:	00db      	lsls	r3, r3, #3
     bd6:	4413      	add	r3, r2
     bd8:	685b      	ldr	r3, [r3, #4]
     bda:	2b00      	cmp	r3, #0
     bdc:	d1e9      	bne.n	bb2 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     bde:	4a07      	ldr	r2, [pc, #28]	; (bfc <search_command+0x58>)
     be0:	68fb      	ldr	r3, [r7, #12]
     be2:	00db      	lsls	r3, r3, #3
     be4:	4413      	add	r3, r2
     be6:	685b      	ldr	r3, [r3, #4]
     be8:	2b00      	cmp	r3, #0
     bea:	d102      	bne.n	bf2 <search_command+0x4e>
     bec:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     bf0:	60fb      	str	r3, [r7, #12]
	return i;
     bf2:	68fb      	ldr	r3, [r7, #12]
}
     bf4:	4618      	mov	r0, r3
     bf6:	3710      	adds	r7, #16
     bf8:	46bd      	mov	sp, r7
     bfa:	bd80      	pop	{r7, pc}
     bfc:	00003050 	.word	0x00003050

00000c00 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     c00:	b480      	push	{r7}
     c02:	b085      	sub	sp, #20
     c04:	af00      	add	r7, sp, #0
     c06:	60f8      	str	r0, [r7, #12]
     c08:	60b9      	str	r1, [r7, #8]
     c0a:	4613      	mov	r3, r2
     c0c:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     c0e:	e002      	b.n	c16 <skip+0x16>
     c10:	68bb      	ldr	r3, [r7, #8]
     c12:	3301      	adds	r3, #1
     c14:	60bb      	str	r3, [r7, #8]
     c16:	68bb      	ldr	r3, [r7, #8]
     c18:	68fa      	ldr	r2, [r7, #12]
     c1a:	4413      	add	r3, r2
     c1c:	781b      	ldrb	r3, [r3, #0]
     c1e:	2b00      	cmp	r3, #0
     c20:	d006      	beq.n	c30 <skip+0x30>
     c22:	68bb      	ldr	r3, [r7, #8]
     c24:	68fa      	ldr	r2, [r7, #12]
     c26:	4413      	add	r3, r2
     c28:	781b      	ldrb	r3, [r3, #0]
     c2a:	79fa      	ldrb	r2, [r7, #7]
     c2c:	429a      	cmp	r2, r3
     c2e:	d0ef      	beq.n	c10 <skip+0x10>
	return start;
     c30:	68bb      	ldr	r3, [r7, #8]
}
     c32:	4618      	mov	r0, r3
     c34:	3714      	adds	r7, #20
     c36:	46bd      	mov	sp, r7
     c38:	f85d 7b04 	ldr.w	r7, [sp], #4
     c3c:	4770      	bx	lr
     c3e:	bf00      	nop

00000c40 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     c40:	b480      	push	{r7}
     c42:	b085      	sub	sp, #20
     c44:	af00      	add	r7, sp, #0
     c46:	60f8      	str	r0, [r7, #12]
     c48:	60b9      	str	r1, [r7, #8]
     c4a:	4613      	mov	r3, r2
     c4c:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     c4e:	e002      	b.n	c56 <scan+0x16>
     c50:	68bb      	ldr	r3, [r7, #8]
     c52:	3301      	adds	r3, #1
     c54:	60bb      	str	r3, [r7, #8]
     c56:	68bb      	ldr	r3, [r7, #8]
     c58:	68fa      	ldr	r2, [r7, #12]
     c5a:	4413      	add	r3, r2
     c5c:	781b      	ldrb	r3, [r3, #0]
     c5e:	2b00      	cmp	r3, #0
     c60:	d006      	beq.n	c70 <scan+0x30>
     c62:	68bb      	ldr	r3, [r7, #8]
     c64:	68fa      	ldr	r2, [r7, #12]
     c66:	4413      	add	r3, r2
     c68:	781b      	ldrb	r3, [r3, #0]
     c6a:	79fa      	ldrb	r2, [r7, #7]
     c6c:	429a      	cmp	r2, r3
     c6e:	d1ef      	bne.n	c50 <scan+0x10>
	return start;
     c70:	68bb      	ldr	r3, [r7, #8]
}
     c72:	4618      	mov	r0, r3
     c74:	3714      	adds	r7, #20
     c76:	46bd      	mov	sp, r7
     c78:	f85d 7b04 	ldr.w	r7, [sp], #4
     c7c:	4770      	bx	lr
     c7e:	bf00      	nop

00000c80 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     c80:	b480      	push	{r7}
     c82:	b087      	sub	sp, #28
     c84:	af00      	add	r7, sp, #0
     c86:	6078      	str	r0, [r7, #4]
     c88:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     c8a:	2300      	movs	r3, #0
     c8c:	617b      	str	r3, [r7, #20]
     c8e:	683b      	ldr	r3, [r7, #0]
     c90:	613b      	str	r3, [r7, #16]
     c92:	2300      	movs	r3, #0
     c94:	60fb      	str	r3, [r7, #12]
     c96:	2301      	movs	r3, #1
     c98:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     c9a:	e040      	b.n	d1e <quote+0x9e>
		switch (buffer[end]){
     c9c:	693b      	ldr	r3, [r7, #16]
     c9e:	687a      	ldr	r2, [r7, #4]
     ca0:	4413      	add	r3, r2
     ca2:	781b      	ldrb	r3, [r3, #0]
     ca4:	2b5c      	cmp	r3, #92	; 0x5c
     ca6:	d012      	beq.n	cce <quote+0x4e>
     ca8:	2b6e      	cmp	r3, #110	; 0x6e
     caa:	d022      	beq.n	cf2 <quote+0x72>
     cac:	2b22      	cmp	r3, #34	; 0x22
     cae:	d128      	bne.n	d02 <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     cb0:	697b      	ldr	r3, [r7, #20]
     cb2:	2b00      	cmp	r3, #0
     cb4:	d102      	bne.n	cbc <quote+0x3c>
     cb6:	2300      	movs	r3, #0
     cb8:	60bb      	str	r3, [r7, #8]
			break;
     cba:	e02d      	b.n	d18 <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     cbc:	68fb      	ldr	r3, [r7, #12]
     cbe:	1c5a      	adds	r2, r3, #1
     cc0:	60fa      	str	r2, [r7, #12]
     cc2:	4a21      	ldr	r2, [pc, #132]	; (d48 <quote+0xc8>)
     cc4:	2122      	movs	r1, #34	; 0x22
     cc6:	54d1      	strb	r1, [r2, r3]
     cc8:	2300      	movs	r3, #0
     cca:	617b      	str	r3, [r7, #20]
			break;
     ccc:	e024      	b.n	d18 <quote+0x98>
		case '\\':
			if (!escaped){
     cce:	697b      	ldr	r3, [r7, #20]
     cd0:	2b00      	cmp	r3, #0
     cd2:	d102      	bne.n	cda <quote+0x5a>
				escaped=1;
     cd4:	2301      	movs	r3, #1
     cd6:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     cd8:	e01e      	b.n	d18 <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     cda:	2300      	movs	r3, #0
     cdc:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     cde:	68fb      	ldr	r3, [r7, #12]
     ce0:	1c5a      	adds	r2, r3, #1
     ce2:	60fa      	str	r2, [r7, #12]
     ce4:	693a      	ldr	r2, [r7, #16]
     ce6:	6879      	ldr	r1, [r7, #4]
     ce8:	440a      	add	r2, r1
     cea:	7811      	ldrb	r1, [r2, #0]
     cec:	4a16      	ldr	r2, [pc, #88]	; (d48 <quote+0xc8>)
     cee:	54d1      	strb	r1, [r2, r3]
			}
			break;
     cf0:	e012      	b.n	d18 <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     cf2:	697b      	ldr	r3, [r7, #20]
     cf4:	2b00      	cmp	r3, #0
     cf6:	d004      	beq.n	d02 <quote+0x82>
     cf8:	693b      	ldr	r3, [r7, #16]
     cfa:	687a      	ldr	r2, [r7, #4]
     cfc:	4413      	add	r3, r2
     cfe:	220d      	movs	r2, #13
     d00:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     d02:	2300      	movs	r3, #0
     d04:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     d06:	68fb      	ldr	r3, [r7, #12]
     d08:	1c5a      	adds	r2, r3, #1
     d0a:	60fa      	str	r2, [r7, #12]
     d0c:	693a      	ldr	r2, [r7, #16]
     d0e:	6879      	ldr	r1, [r7, #4]
     d10:	440a      	add	r2, r1
     d12:	7811      	ldrb	r1, [r2, #0]
     d14:	4a0c      	ldr	r2, [pc, #48]	; (d48 <quote+0xc8>)
     d16:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     d18:	693b      	ldr	r3, [r7, #16]
     d1a:	3301      	adds	r3, #1
     d1c:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     d1e:	693b      	ldr	r3, [r7, #16]
     d20:	687a      	ldr	r2, [r7, #4]
     d22:	4413      	add	r3, r2
     d24:	781b      	ldrb	r3, [r3, #0]
     d26:	2b00      	cmp	r3, #0
     d28:	d002      	beq.n	d30 <quote+0xb0>
     d2a:	68bb      	ldr	r3, [r7, #8]
     d2c:	2b00      	cmp	r3, #0
     d2e:	d1b5      	bne.n	c9c <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     d30:	4a05      	ldr	r2, [pc, #20]	; (d48 <quote+0xc8>)
     d32:	68fb      	ldr	r3, [r7, #12]
     d34:	4413      	add	r3, r2
     d36:	2200      	movs	r2, #0
     d38:	701a      	strb	r2, [r3, #0]
	return end;
     d3a:	693b      	ldr	r3, [r7, #16]
}
     d3c:	4618      	mov	r0, r3
     d3e:	371c      	adds	r7, #28
     d40:	46bd      	mov	sp, r7
     d42:	f85d 7b04 	ldr.w	r7, [sp], #4
     d46:	4770      	bx	lr
     d48:	20000058 	.word	0x20000058

00000d4c <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     d4c:	b480      	push	{r7}
     d4e:	b087      	sub	sp, #28
     d50:	af00      	add	r7, sp, #0
     d52:	60f8      	str	r0, [r7, #12]
     d54:	60b9      	str	r1, [r7, #8]
     d56:	4613      	mov	r3, r2
     d58:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     d5a:	68bb      	ldr	r3, [r7, #8]
     d5c:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     d5e:	e002      	b.n	d66 <next+0x1a>
     d60:	697b      	ldr	r3, [r7, #20]
     d62:	3301      	adds	r3, #1
     d64:	617b      	str	r3, [r7, #20]
     d66:	697b      	ldr	r3, [r7, #20]
     d68:	68fa      	ldr	r2, [r7, #12]
     d6a:	4413      	add	r3, r2
     d6c:	781b      	ldrb	r3, [r3, #0]
     d6e:	2b00      	cmp	r3, #0
     d70:	d006      	beq.n	d80 <next+0x34>
     d72:	697b      	ldr	r3, [r7, #20]
     d74:	68fa      	ldr	r2, [r7, #12]
     d76:	4413      	add	r3, r2
     d78:	781b      	ldrb	r3, [r3, #0]
     d7a:	79fa      	ldrb	r2, [r7, #7]
     d7c:	429a      	cmp	r2, r3
     d7e:	d1ef      	bne.n	d60 <next+0x14>
	return end-start;
     d80:	697a      	ldr	r2, [r7, #20]
     d82:	68bb      	ldr	r3, [r7, #8]
     d84:	1ad3      	subs	r3, r2, r3
}
     d86:	4618      	mov	r0, r3
     d88:	371c      	adds	r7, #28
     d8a:	46bd      	mov	sp, r7
     d8c:	f85d 7b04 	ldr.w	r7, [sp], #4
     d90:	4770      	bx	lr
     d92:	bf00      	nop

00000d94 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     d94:	b480      	push	{r7}
     d96:	b085      	sub	sp, #20
     d98:	af00      	add	r7, sp, #0
     d9a:	60f8      	str	r0, [r7, #12]
     d9c:	60b9      	str	r1, [r7, #8]
     d9e:	607a      	str	r2, [r7, #4]
	while (len){
     da0:	e00a      	b.n	db8 <move+0x24>
		*dest++=*src++;
     da2:	68bb      	ldr	r3, [r7, #8]
     da4:	1c5a      	adds	r2, r3, #1
     da6:	60ba      	str	r2, [r7, #8]
     da8:	68fa      	ldr	r2, [r7, #12]
     daa:	1c51      	adds	r1, r2, #1
     dac:	60f9      	str	r1, [r7, #12]
     dae:	7812      	ldrb	r2, [r2, #0]
     db0:	701a      	strb	r2, [r3, #0]
		len--;
     db2:	687b      	ldr	r3, [r7, #4]
     db4:	3b01      	subs	r3, #1
     db6:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     db8:	687b      	ldr	r3, [r7, #4]
     dba:	2b00      	cmp	r3, #0
     dbc:	d1f1      	bne.n	da2 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     dbe:	68bb      	ldr	r3, [r7, #8]
     dc0:	2200      	movs	r2, #0
     dc2:	701a      	strb	r2, [r3, #0]
}
     dc4:	3714      	adds	r7, #20
     dc6:	46bd      	mov	sp, r7
     dc8:	f85d 7b04 	ldr.w	r7, [sp], #4
     dcc:	4770      	bx	lr
     dce:	bf00      	nop

00000dd0 <word>:

// extrait le prochain mot du tib
static void word(){
     dd0:	b580      	push	{r7, lr}
     dd2:	b082      	sub	sp, #8
     dd4:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     dd6:	4b1d      	ldr	r3, [pc, #116]	; (e4c <word+0x7c>)
     dd8:	681b      	ldr	r3, [r3, #0]
     dda:	481d      	ldr	r0, [pc, #116]	; (e50 <word+0x80>)
     ddc:	4619      	mov	r1, r3
     dde:	2220      	movs	r2, #32
     de0:	f7ff ff0e 	bl	c00 <skip>
     de4:	4603      	mov	r3, r0
     de6:	461a      	mov	r2, r3
     de8:	4b18      	ldr	r3, [pc, #96]	; (e4c <word+0x7c>)
     dea:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     dec:	4b17      	ldr	r3, [pc, #92]	; (e4c <word+0x7c>)
     dee:	681b      	ldr	r3, [r3, #0]
     df0:	4a17      	ldr	r2, [pc, #92]	; (e50 <word+0x80>)
     df2:	5cd3      	ldrb	r3, [r2, r3]
     df4:	2b22      	cmp	r3, #34	; 0x22
     df6:	d10f      	bne.n	e18 <word+0x48>
			in++;
     df8:	4b14      	ldr	r3, [pc, #80]	; (e4c <word+0x7c>)
     dfa:	681b      	ldr	r3, [r3, #0]
     dfc:	3301      	adds	r3, #1
     dfe:	4a13      	ldr	r2, [pc, #76]	; (e4c <word+0x7c>)
     e00:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     e02:	4b12      	ldr	r3, [pc, #72]	; (e4c <word+0x7c>)
     e04:	681b      	ldr	r3, [r3, #0]
     e06:	4812      	ldr	r0, [pc, #72]	; (e50 <word+0x80>)
     e08:	4619      	mov	r1, r3
     e0a:	f7ff ff39 	bl	c80 <quote>
     e0e:	4603      	mov	r3, r0
     e10:	461a      	mov	r2, r3
     e12:	4b0e      	ldr	r3, [pc, #56]	; (e4c <word+0x7c>)
     e14:	601a      	str	r2, [r3, #0]
     e16:	e016      	b.n	e46 <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     e18:	4b0c      	ldr	r3, [pc, #48]	; (e4c <word+0x7c>)
     e1a:	681b      	ldr	r3, [r3, #0]
     e1c:	480c      	ldr	r0, [pc, #48]	; (e50 <word+0x80>)
     e1e:	4619      	mov	r1, r3
     e20:	2220      	movs	r2, #32
     e22:	f7ff ff93 	bl	d4c <next>
     e26:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     e28:	4b08      	ldr	r3, [pc, #32]	; (e4c <word+0x7c>)
     e2a:	681b      	ldr	r3, [r3, #0]
     e2c:	4a08      	ldr	r2, [pc, #32]	; (e50 <word+0x80>)
     e2e:	4413      	add	r3, r2
     e30:	4618      	mov	r0, r3
     e32:	4908      	ldr	r1, [pc, #32]	; (e54 <word+0x84>)
     e34:	687a      	ldr	r2, [r7, #4]
     e36:	f7ff ffad 	bl	d94 <move>
			in+=len;
     e3a:	4b04      	ldr	r3, [pc, #16]	; (e4c <word+0x7c>)
     e3c:	681a      	ldr	r2, [r3, #0]
     e3e:	687b      	ldr	r3, [r7, #4]
     e40:	4413      	add	r3, r2
     e42:	4a02      	ldr	r2, [pc, #8]	; (e4c <word+0x7c>)
     e44:	6013      	str	r3, [r2, #0]
		}
}
     e46:	3708      	adds	r7, #8
     e48:	46bd      	mov	sp, r7
     e4a:	bd80      	pop	{r7, pc}
     e4c:	200000a8 	.word	0x200000a8
     e50:	20000008 	.word	0x20000008
     e54:	20000058 	.word	0x20000058

00000e58 <parse_line>:

static void parse_line(unsigned llen){
     e58:	b580      	push	{r7, lr}
     e5a:	b084      	sub	sp, #16
     e5c:	af00      	add	r7, sp, #0
     e5e:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     e60:	4b14      	ldr	r3, [pc, #80]	; (eb4 <parse_line+0x5c>)
     e62:	2200      	movs	r2, #0
     e64:	601a      	str	r2, [r3, #0]
	while (in<llen){
     e66:	e019      	b.n	e9c <parse_line+0x44>
		word();
     e68:	f7ff ffb2 	bl	dd0 <word>
		cmd_id=search_command((const char*) pad);
     e6c:	4812      	ldr	r0, [pc, #72]	; (eb8 <parse_line+0x60>)
     e6e:	f7ff fe99 	bl	ba4 <search_command>
     e72:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     e74:	68fb      	ldr	r3, [r7, #12]
     e76:	2b00      	cmp	r3, #0
     e78:	db06      	blt.n	e88 <parse_line+0x30>
			commands[cmd_id].fn();
     e7a:	4a10      	ldr	r2, [pc, #64]	; (ebc <parse_line+0x64>)
     e7c:	68fb      	ldr	r3, [r7, #12]
     e7e:	00db      	lsls	r3, r3, #3
     e80:	4413      	add	r3, r2
     e82:	685b      	ldr	r3, [r3, #4]
     e84:	4798      	blx	r3
     e86:	e009      	b.n	e9c <parse_line+0x44>
		}else{
			conout(CR);
     e88:	200d      	movs	r0, #13
     e8a:	f000 f93d 	bl	1108 <conout>
			print((const char*)pad); conout('?');
     e8e:	480a      	ldr	r0, [pc, #40]	; (eb8 <parse_line+0x60>)
     e90:	f000 f954 	bl	113c <print>
     e94:	203f      	movs	r0, #63	; 0x3f
     e96:	f000 f937 	bl	1108 <conout>
			break;
     e9a:	e004      	b.n	ea6 <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     e9c:	4b05      	ldr	r3, [pc, #20]	; (eb4 <parse_line+0x5c>)
     e9e:	681a      	ldr	r2, [r3, #0]
     ea0:	687b      	ldr	r3, [r7, #4]
     ea2:	429a      	cmp	r2, r3
     ea4:	d3e0      	bcc.n	e68 <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     ea6:	200d      	movs	r0, #13
     ea8:	f000 f92e 	bl	1108 <conout>
}
     eac:	3710      	adds	r7, #16
     eae:	46bd      	mov	sp, r7
     eb0:	bd80      	pop	{r7, pc}
     eb2:	bf00      	nop
     eb4:	200000a8 	.word	0x200000a8
     eb8:	20000058 	.word	0x20000058
     ebc:	00003050 	.word	0x00003050

00000ec0 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     ec0:	b480      	push	{r7}
     ec2:	b085      	sub	sp, #20
     ec4:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     ec6:	4b0c      	ldr	r3, [pc, #48]	; (ef8 <copy_blink_in_ram+0x38>)
     ec8:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     eca:	4b0c      	ldr	r3, [pc, #48]	; (efc <copy_blink_in_ram+0x3c>)
     ecc:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     ece:	4b0c      	ldr	r3, [pc, #48]	; (f00 <copy_blink_in_ram+0x40>)
     ed0:	60bb      	str	r3, [r7, #8]
	while (start<end){
     ed2:	e007      	b.n	ee4 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     ed4:	68bb      	ldr	r3, [r7, #8]
     ed6:	1d1a      	adds	r2, r3, #4
     ed8:	60ba      	str	r2, [r7, #8]
     eda:	68fa      	ldr	r2, [r7, #12]
     edc:	1d11      	adds	r1, r2, #4
     ede:	60f9      	str	r1, [r7, #12]
     ee0:	6812      	ldr	r2, [r2, #0]
     ee2:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     ee4:	68fa      	ldr	r2, [r7, #12]
     ee6:	687b      	ldr	r3, [r7, #4]
     ee8:	429a      	cmp	r2, r3
     eea:	d3f3      	bcc.n	ed4 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     eec:	3714      	adds	r7, #20
     eee:	46bd      	mov	sp, r7
     ef0:	f85d 7b04 	ldr.w	r7, [sp], #4
     ef4:	4770      	bx	lr
     ef6:	bf00      	nop
     ef8:	00003800 	.word	0x00003800
     efc:	00003880 	.word	0x00003880
     f00:	20002700 	.word	0x20002700

00000f04 <main>:

extern void print_fault(const char *msg, sfrp_t adr);



void main(void){
     f04:	b580      	push	{r7, lr}
     f06:	b082      	sub	sp, #8
     f08:	af00      	add	r7, sp, #0
	set_sysclock();
     f0a:	f7ff fc09 	bl	720 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     f0e:	f06f 000a 	mvn.w	r0, #10
     f12:	210f      	movs	r1, #15
     f14:	f001 fab2 	bl	247c <set_int_priority>
	config_systicks();
     f18:	f001 fc3c 	bl	2794 <config_systicks>
	flash_enable();
     f1c:	f000 fac0 	bl	14a0 <flash_enable>
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
     f20:	4b22      	ldr	r3, [pc, #136]	; (fac <main+0xa8>)
     f22:	221d      	movs	r2, #29
     f24:	619a      	str	r2, [r3, #24]
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
     f26:	4b21      	ldr	r3, [pc, #132]	; (fac <main+0xa8>)
     f28:	f44f 4280 	mov.w	r2, #16384	; 0x4000
     f2c:	61da      	str	r2, [r3, #28]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     f2e:	4a1f      	ldr	r2, [pc, #124]	; (fac <main+0xa8>)
     f30:	4b1e      	ldr	r3, [pc, #120]	; (fac <main+0xa8>)
     f32:	695b      	ldr	r3, [r3, #20]
     f34:	f043 0301 	orr.w	r3, r3, #1
     f38:	6153      	str	r3, [r2, #20]
	config_pin(LED_PORT,LED_PIN,OUTPUT_OD_SLOW);
     f3a:	481d      	ldr	r0, [pc, #116]	; (fb0 <main+0xac>)
     f3c:	210d      	movs	r1, #13
     f3e:	2206      	movs	r2, #6
     f40:	f000 fece 	bl	1ce0 <config_pin>
	vt_init();
     f44:	f001 ff82 	bl	2e4c <vt_init>
	keyboard_init();
     f48:	f000 ff44 	bl	1dd4 <keyboard_init>
	tvout_init();
     f4c:	f001 fc6e 	bl	282c <tvout_init>
	console_init(SERIAL);
     f50:	2001      	movs	r0, #1
     f52:	f000 f8c1 	bl	10d8 <console_init>
	if (!vt_ready()){con_select(LOCAL);}
     f56:	f001 ffe7 	bl	2f28 <vt_ready>
     f5a:	4603      	mov	r3, r0
     f5c:	2b00      	cmp	r3, #0
     f5e:	d102      	bne.n	f66 <main+0x62>
     f60:	2000      	movs	r0, #0
     f62:	f000 f87d 	bl	1060 <con_select>
	cls();
     f66:	f000 fa93 	bl	1490 <cls>
	print(VERSION);
     f6a:	4b12      	ldr	r3, [pc, #72]	; (fb4 <main+0xb0>)
     f6c:	681b      	ldr	r3, [r3, #0]
     f6e:	4618      	mov	r0, r3
     f70:	f000 f8e4 	bl	113c <print>
	copy_blink_in_ram();
     f74:	f7ff ffa4 	bl	ec0 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
     f78:	480f      	ldr	r0, [pc, #60]	; (fb8 <main+0xb4>)
     f7a:	f000 f8df 	bl	113c <print>
     f7e:	4b0f      	ldr	r3, [pc, #60]	; (fbc <main+0xb8>)
     f80:	2200      	movs	r2, #0
     f82:	4618      	mov	r0, r3
     f84:	4611      	mov	r1, r2
     f86:	df0a      	svc	10
     f88:	200d      	movs	r0, #13
     f8a:	f000 f8bd 	bl	1108 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     f8e:	2300      	movs	r3, #0
     f90:	2200      	movs	r2, #0
     f92:	4618      	mov	r0, r3
     f94:	4611      	mov	r1, r2
     f96:	df01      	svc	1
	
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
     f98:	4809      	ldr	r0, [pc, #36]	; (fc0 <main+0xbc>)
     f9a:	2150      	movs	r1, #80	; 0x50
     f9c:	f000 f8f2 	bl	1184 <read_line>
     fa0:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     fa2:	6878      	ldr	r0, [r7, #4]
     fa4:	f7ff ff58 	bl	e58 <parse_line>
	}
     fa8:	e7f6      	b.n	f98 <main+0x94>
     faa:	bf00      	nop
     fac:	40021000 	.word	0x40021000
     fb0:	40011000 	.word	0x40011000
     fb4:	20000000 	.word	0x20000000
     fb8:	00003108 	.word	0x00003108
     fbc:	200000ec 	.word	0x200000ec
     fc0:	20000008 	.word	0x20000008

00000fc4 <queue_insert>:
#include "vt100.h"

console_t con;


static void queue_insert(char c){
     fc4:	b480      	push	{r7}
     fc6:	b083      	sub	sp, #12
     fc8:	af00      	add	r7, sp, #0
     fca:	4603      	mov	r3, r0
     fcc:	71fb      	strb	r3, [r7, #7]
		con.queue[con.head++]=c;
     fce:	4b0a      	ldr	r3, [pc, #40]	; (ff8 <queue_insert+0x34>)
     fd0:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     fd2:	1c5a      	adds	r2, r3, #1
     fd4:	4908      	ldr	r1, [pc, #32]	; (ff8 <queue_insert+0x34>)
     fd6:	624a      	str	r2, [r1, #36]	; 0x24
     fd8:	4a07      	ldr	r2, [pc, #28]	; (ff8 <queue_insert+0x34>)
     fda:	4413      	add	r3, r2
     fdc:	79fa      	ldrb	r2, [r7, #7]
     fde:	705a      	strb	r2, [r3, #1]
		con.head&=CON_QUEUE_SIZE-1;
     fe0:	4b05      	ldr	r3, [pc, #20]	; (ff8 <queue_insert+0x34>)
     fe2:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     fe4:	f003 031f 	and.w	r3, r3, #31
     fe8:	4a03      	ldr	r2, [pc, #12]	; (ff8 <queue_insert+0x34>)
     fea:	6253      	str	r3, [r2, #36]	; 0x24
}
     fec:	370c      	adds	r7, #12
     fee:	46bd      	mov	sp, r7
     ff0:	f85d 7b04 	ldr.w	r7, [sp], #4
     ff4:	4770      	bx	lr
     ff6:	bf00      	nop
     ff8:	200000f0 	.word	0x200000f0

00000ffc <queue_getc>:

static char queue_getc(){
     ffc:	b480      	push	{r7}
     ffe:	b083      	sub	sp, #12
    1000:	af00      	add	r7, sp, #0
	char c=0;
    1002:	2300      	movs	r3, #0
    1004:	71fb      	strb	r3, [r7, #7]
	if (con.tail!=con.head){
    1006:	4b0e      	ldr	r3, [pc, #56]	; (1040 <queue_getc+0x44>)
    1008:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    100a:	4b0d      	ldr	r3, [pc, #52]	; (1040 <queue_getc+0x44>)
    100c:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    100e:	429a      	cmp	r2, r3
    1010:	d00e      	beq.n	1030 <queue_getc+0x34>
		c=con.queue[con.tail++];
    1012:	4b0b      	ldr	r3, [pc, #44]	; (1040 <queue_getc+0x44>)
    1014:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    1016:	1c5a      	adds	r2, r3, #1
    1018:	4909      	ldr	r1, [pc, #36]	; (1040 <queue_getc+0x44>)
    101a:	628a      	str	r2, [r1, #40]	; 0x28
    101c:	4a08      	ldr	r2, [pc, #32]	; (1040 <queue_getc+0x44>)
    101e:	4413      	add	r3, r2
    1020:	785b      	ldrb	r3, [r3, #1]
    1022:	71fb      	strb	r3, [r7, #7]
		con.tail&=CON_QUEUE_SIZE-1;
    1024:	4b06      	ldr	r3, [pc, #24]	; (1040 <queue_getc+0x44>)
    1026:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    1028:	f003 031f 	and.w	r3, r3, #31
    102c:	4a04      	ldr	r2, [pc, #16]	; (1040 <queue_getc+0x44>)
    102e:	6293      	str	r3, [r2, #40]	; 0x28
	}
	return c;
    1030:	79fb      	ldrb	r3, [r7, #7]
}
    1032:	4618      	mov	r0, r3
    1034:	370c      	adds	r7, #12
    1036:	46bd      	mov	sp, r7
    1038:	f85d 7b04 	ldr.w	r7, [sp], #4
    103c:	4770      	bx	lr
    103e:	bf00      	nop
    1040:	200000f0 	.word	0x200000f0

00001044 <con_queue_flush>:

void con_queue_flush(){
    1044:	b480      	push	{r7}
    1046:	af00      	add	r7, sp, #0
	con.tail=con.head=0;
    1048:	2300      	movs	r3, #0
    104a:	4a04      	ldr	r2, [pc, #16]	; (105c <con_queue_flush+0x18>)
    104c:	6253      	str	r3, [r2, #36]	; 0x24
    104e:	4a03      	ldr	r2, [pc, #12]	; (105c <con_queue_flush+0x18>)
    1050:	6293      	str	r3, [r2, #40]	; 0x28
}
    1052:	46bd      	mov	sp, r7
    1054:	f85d 7b04 	ldr.w	r7, [sp], #4
    1058:	4770      	bx	lr
    105a:	bf00      	nop
    105c:	200000f0 	.word	0x200000f0

00001060 <con_select>:

static const char PROMPT[]=" OK\n";

void con_select(console_dev_t dev){
    1060:	b580      	push	{r7, lr}
    1062:	b082      	sub	sp, #8
    1064:	af00      	add	r7, sp, #0
    1066:	4603      	mov	r3, r0
    1068:	71fb      	strb	r3, [r7, #7]
	con_queue_flush();
    106a:	f7ff ffeb 	bl	1044 <con_queue_flush>
	con.dev=dev;
    106e:	4a12      	ldr	r2, [pc, #72]	; (10b8 <con_select+0x58>)
    1070:	79fb      	ldrb	r3, [r7, #7]
    1072:	7013      	strb	r3, [r2, #0]
	if (dev==LOCAL){
    1074:	79fb      	ldrb	r3, [r7, #7]
    1076:	2b00      	cmp	r3, #0
    1078:	d10c      	bne.n	1094 <con_select+0x34>
		con.putc=gdi_putc;
    107a:	4b0f      	ldr	r3, [pc, #60]	; (10b8 <con_select+0x58>)
    107c:	4a0f      	ldr	r2, [pc, #60]	; (10bc <con_select+0x5c>)
    107e:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=gdi_clear_screen;
    1080:	4b0d      	ldr	r3, [pc, #52]	; (10b8 <con_select+0x58>)
    1082:	4a0f      	ldr	r2, [pc, #60]	; (10c0 <con_select+0x60>)
    1084:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=gdi_del_back;
    1086:	4b0c      	ldr	r3, [pc, #48]	; (10b8 <con_select+0x58>)
    1088:	4a0e      	ldr	r2, [pc, #56]	; (10c4 <con_select+0x64>)
    108a:	639a      	str	r2, [r3, #56]	; 0x38
		gdi_text_cursor(1);
    108c:	2001      	movs	r0, #1
    108e:	f000 fda1 	bl	1bd4 <gdi_text_cursor>
    1092:	e00b      	b.n	10ac <con_select+0x4c>
	}else{
		gdi_text_cursor(0);
    1094:	2000      	movs	r0, #0
    1096:	f000 fd9d 	bl	1bd4 <gdi_text_cursor>
		con.putc=vt_putc;
    109a:	4b07      	ldr	r3, [pc, #28]	; (10b8 <con_select+0x58>)
    109c:	4a0a      	ldr	r2, [pc, #40]	; (10c8 <con_select+0x68>)
    109e:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=vt_cls;
    10a0:	4b05      	ldr	r3, [pc, #20]	; (10b8 <con_select+0x58>)
    10a2:	4a0a      	ldr	r2, [pc, #40]	; (10cc <con_select+0x6c>)
    10a4:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=vt_del_back;
    10a6:	4b04      	ldr	r3, [pc, #16]	; (10b8 <con_select+0x58>)
    10a8:	4a09      	ldr	r2, [pc, #36]	; (10d0 <con_select+0x70>)
    10aa:	639a      	str	r2, [r3, #56]	; 0x38
	}
	print(PROMPT);
    10ac:	4809      	ldr	r0, [pc, #36]	; (10d4 <con_select+0x74>)
    10ae:	f000 f845 	bl	113c <print>
}
    10b2:	3708      	adds	r7, #8
    10b4:	46bd      	mov	sp, r7
    10b6:	bd80      	pop	{r7, pc}
    10b8:	200000f0 	.word	0x200000f0
    10bc:	00001ac9 	.word	0x00001ac9
    10c0:	00001699 	.word	0x00001699
    10c4:	00001a85 	.word	0x00001a85
    10c8:	00002e6d 	.word	0x00002e6d
    10cc:	00002ecd 	.word	0x00002ecd
    10d0:	00002e8d 	.word	0x00002e8d
    10d4:	00003124 	.word	0x00003124

000010d8 <console_init>:

void console_init(console_dev_t dev){
    10d8:	b580      	push	{r7, lr}
    10da:	b082      	sub	sp, #8
    10dc:	af00      	add	r7, sp, #0
    10de:	4603      	mov	r3, r0
    10e0:	71fb      	strb	r3, [r7, #7]
	con.getc=queue_getc;
    10e2:	4b06      	ldr	r3, [pc, #24]	; (10fc <console_init+0x24>)
    10e4:	4a06      	ldr	r2, [pc, #24]	; (1100 <console_init+0x28>)
    10e6:	631a      	str	r2, [r3, #48]	; 0x30
	con.insert=queue_insert;
    10e8:	4b04      	ldr	r3, [pc, #16]	; (10fc <console_init+0x24>)
    10ea:	4a06      	ldr	r2, [pc, #24]	; (1104 <console_init+0x2c>)
    10ec:	62da      	str	r2, [r3, #44]	; 0x2c
	con_select(dev);
    10ee:	79fb      	ldrb	r3, [r7, #7]
    10f0:	4618      	mov	r0, r3
    10f2:	f7ff ffb5 	bl	1060 <con_select>
}
    10f6:	3708      	adds	r7, #8
    10f8:	46bd      	mov	sp, r7
    10fa:	bd80      	pop	{r7, pc}
    10fc:	200000f0 	.word	0x200000f0
    1100:	00000ffd 	.word	0x00000ffd
    1104:	00000fc5 	.word	0x00000fc5

00001108 <conout>:

// envoie d'un caractère à la console
void conout(char c){
    1108:	b580      	push	{r7, lr}
    110a:	b082      	sub	sp, #8
    110c:	af00      	add	r7, sp, #0
    110e:	4603      	mov	r3, r0
    1110:	71fb      	strb	r3, [r7, #7]
	con.putc(c);
    1112:	4b04      	ldr	r3, [pc, #16]	; (1124 <conout+0x1c>)
    1114:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1116:	79fa      	ldrb	r2, [r7, #7]
    1118:	4610      	mov	r0, r2
    111a:	4798      	blx	r3
}
    111c:	3708      	adds	r7, #8
    111e:	46bd      	mov	sp, r7
    1120:	bd80      	pop	{r7, pc}
    1122:	bf00      	nop
    1124:	200000f0 	.word	0x200000f0

00001128 <conin>:


// réception d'un caractère de la console
char conin(){
    1128:	b580      	push	{r7, lr}
    112a:	af00      	add	r7, sp, #0
	return con.getc();
    112c:	4b02      	ldr	r3, [pc, #8]	; (1138 <conin+0x10>)
    112e:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    1130:	4798      	blx	r3
    1132:	4603      	mov	r3, r0
}
    1134:	4618      	mov	r0, r3
    1136:	bd80      	pop	{r7, pc}
    1138:	200000f0 	.word	0x200000f0

0000113c <print>:

// imprime un chaîne sur la console
void print(const char *str){
    113c:	b580      	push	{r7, lr}
    113e:	b082      	sub	sp, #8
    1140:	af00      	add	r7, sp, #0
    1142:	6078      	str	r0, [r7, #4]
	while (*str) {con.putc(*str++);}
    1144:	e007      	b.n	1156 <print+0x1a>
    1146:	4b07      	ldr	r3, [pc, #28]	; (1164 <print+0x28>)
    1148:	6b5a      	ldr	r2, [r3, #52]	; 0x34
    114a:	687b      	ldr	r3, [r7, #4]
    114c:	1c59      	adds	r1, r3, #1
    114e:	6079      	str	r1, [r7, #4]
    1150:	781b      	ldrb	r3, [r3, #0]
    1152:	4618      	mov	r0, r3
    1154:	4790      	blx	r2
    1156:	687b      	ldr	r3, [r7, #4]
    1158:	781b      	ldrb	r3, [r3, #0]
    115a:	2b00      	cmp	r3, #0
    115c:	d1f3      	bne.n	1146 <print+0xa>
}
    115e:	3708      	adds	r7, #8
    1160:	46bd      	mov	sp, r7
    1162:	bd80      	pop	{r7, pc}
    1164:	200000f0 	.word	0x200000f0

00001168 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    1168:	b580      	push	{r7, lr}
    116a:	af00      	add	r7, sp, #0
	con.delete_back();
    116c:	4b01      	ldr	r3, [pc, #4]	; (1174 <delete_back+0xc>)
    116e:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1170:	4798      	blx	r3
}
    1172:	bd80      	pop	{r7, pc}
    1174:	200000f0 	.word	0x200000f0

00001178 <beep>:

static void beep(){
    1178:	b480      	push	{r7}
    117a:	af00      	add	r7, sp, #0
}
    117c:	46bd      	mov	sp, r7
    117e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1182:	4770      	bx	lr

00001184 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    1184:	b580      	push	{r7, lr}
    1186:	b084      	sub	sp, #16
    1188:	af00      	add	r7, sp, #0
    118a:	6078      	str	r0, [r7, #4]
    118c:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    118e:	2300      	movs	r3, #0
    1190:	60fb      	str	r3, [r7, #12]
	char c=0;
    1192:	2300      	movs	r3, #0
    1194:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    1196:	683b      	ldr	r3, [r7, #0]
    1198:	3b01      	subs	r3, #1
    119a:	603b      	str	r3, [r7, #0]
	while (c!=13){
    119c:	e098      	b.n	12d0 <read_line+0x14c>
			c=con.getc();
    119e:	4b53      	ldr	r3, [pc, #332]	; (12ec <read_line+0x168>)
    11a0:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    11a2:	4798      	blx	r3
    11a4:	4603      	mov	r3, r0
    11a6:	72fb      	strb	r3, [r7, #11]
			switch(c){
    11a8:	7afb      	ldrb	r3, [r7, #11]
    11aa:	2b18      	cmp	r3, #24
    11ac:	d87a      	bhi.n	12a4 <read_line+0x120>
    11ae:	a201      	add	r2, pc, #4	; (adr r2, 11b4 <read_line+0x30>)
    11b0:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    11b4:	000012d1 	.word	0x000012d1
    11b8:	000012a5 	.word	0x000012a5
    11bc:	000012a5 	.word	0x000012a5
    11c0:	000012a5 	.word	0x000012a5
    11c4:	000012a5 	.word	0x000012a5
    11c8:	00001295 	.word	0x00001295
    11cc:	000012a5 	.word	0x000012a5
    11d0:	000012a5 	.word	0x000012a5
    11d4:	00001281 	.word	0x00001281
    11d8:	000012a1 	.word	0x000012a1
    11dc:	00001219 	.word	0x00001219
    11e0:	000012a5 	.word	0x000012a5
    11e4:	000012a5 	.word	0x000012a5
    11e8:	00001219 	.word	0x00001219
    11ec:	000012a5 	.word	0x000012a5
    11f0:	000012a5 	.word	0x000012a5
    11f4:	000012a5 	.word	0x000012a5
    11f8:	000012a5 	.word	0x000012a5
    11fc:	000012a5 	.word	0x000012a5
    1200:	000012a5 	.word	0x000012a5
    1204:	000012a5 	.word	0x000012a5
    1208:	00001235 	.word	0x00001235
    120c:	000012a5 	.word	0x000012a5
    1210:	00001249 	.word	0x00001249
    1214:	00001235 	.word	0x00001235
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    1218:	230d      	movs	r3, #13
    121a:	72fb      	strb	r3, [r7, #11]
				con.putc(c);
    121c:	4b33      	ldr	r3, [pc, #204]	; (12ec <read_line+0x168>)
    121e:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1220:	7afa      	ldrb	r2, [r7, #11]
    1222:	4610      	mov	r0, r2
    1224:	4798      	blx	r3
				break;
    1226:	e053      	b.n	12d0 <read_line+0x14c>
				case CTRL_X:
				case CTRL_U:
				while (line_len){con.delete_back();line_len--;}
    1228:	4b30      	ldr	r3, [pc, #192]	; (12ec <read_line+0x168>)
    122a:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    122c:	4798      	blx	r3
    122e:	68fb      	ldr	r3, [r7, #12]
    1230:	3b01      	subs	r3, #1
    1232:	60fb      	str	r3, [r7, #12]
    1234:	68fb      	ldr	r3, [r7, #12]
    1236:	2b00      	cmp	r3, #0
    1238:	d1f6      	bne.n	1228 <read_line+0xa4>
				//con.clear_line(line_len);
				//line_len=0;
				break;
    123a:	e049      	b.n	12d0 <read_line+0x14c>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
    123c:	4b2b      	ldr	r3, [pc, #172]	; (12ec <read_line+0x168>)
    123e:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1240:	4798      	blx	r3
					line_len--;
    1242:	68fb      	ldr	r3, [r7, #12]
    1244:	3b01      	subs	r3, #1
    1246:	60fb      	str	r3, [r7, #12]
				while (line_len){con.delete_back();line_len--;}
				//con.clear_line(line_len);
				//line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    1248:	68fb      	ldr	r3, [r7, #12]
    124a:	2b00      	cmp	r3, #0
    124c:	d006      	beq.n	125c <read_line+0xd8>
    124e:	68fb      	ldr	r3, [r7, #12]
    1250:	3b01      	subs	r3, #1
    1252:	687a      	ldr	r2, [r7, #4]
    1254:	4413      	add	r3, r2
    1256:	781b      	ldrb	r3, [r3, #0]
    1258:	2b20      	cmp	r3, #32
    125a:	d0ef      	beq.n	123c <read_line+0xb8>
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    125c:	e005      	b.n	126a <read_line+0xe6>
					con.delete_back();
    125e:	4b23      	ldr	r3, [pc, #140]	; (12ec <read_line+0x168>)
    1260:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1262:	4798      	blx	r3
					line_len--;
    1264:	68fb      	ldr	r3, [r7, #12]
    1266:	3b01      	subs	r3, #1
    1268:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    126a:	68fb      	ldr	r3, [r7, #12]
    126c:	2b00      	cmp	r3, #0
    126e:	d006      	beq.n	127e <read_line+0xfa>
    1270:	68fb      	ldr	r3, [r7, #12]
    1272:	3b01      	subs	r3, #1
    1274:	687a      	ldr	r2, [r7, #4]
    1276:	4413      	add	r3, r2
    1278:	781b      	ldrb	r3, [r3, #0]
    127a:	2b20      	cmp	r3, #32
    127c:	d1ef      	bne.n	125e <read_line+0xda>
					con.delete_back();
					line_len--;
				}
				break;
    127e:	e027      	b.n	12d0 <read_line+0x14c>
				case BS:
				if (line_len){
    1280:	68fb      	ldr	r3, [r7, #12]
    1282:	2b00      	cmp	r3, #0
    1284:	d005      	beq.n	1292 <read_line+0x10e>
					con.delete_back();
    1286:	4b19      	ldr	r3, [pc, #100]	; (12ec <read_line+0x168>)
    1288:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    128a:	4798      	blx	r3
					line_len--;
    128c:	68fb      	ldr	r3, [r7, #12]
    128e:	3b01      	subs	r3, #1
    1290:	60fb      	str	r3, [r7, #12]
				}
				break;
    1292:	e01d      	b.n	12d0 <read_line+0x14c>
				case CTRL_E:
				con.cls();
    1294:	4b15      	ldr	r3, [pc, #84]	; (12ec <read_line+0x168>)
    1296:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    1298:	4798      	blx	r3
				line_len=0;
    129a:	2300      	movs	r3, #0
    129c:	60fb      	str	r3, [r7, #12]
				break;
    129e:	e017      	b.n	12d0 <read_line+0x14c>
				case TAB:
				c=SPACE;
    12a0:	2320      	movs	r3, #32
    12a2:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    12a4:	68fa      	ldr	r2, [r7, #12]
    12a6:	683b      	ldr	r3, [r7, #0]
    12a8:	429a      	cmp	r2, r3
    12aa:	d20f      	bcs.n	12cc <read_line+0x148>
    12ac:	7afb      	ldrb	r3, [r7, #11]
    12ae:	2b1f      	cmp	r3, #31
    12b0:	d90c      	bls.n	12cc <read_line+0x148>
					buffer[line_len++]=c;
    12b2:	68fb      	ldr	r3, [r7, #12]
    12b4:	1c5a      	adds	r2, r3, #1
    12b6:	60fa      	str	r2, [r7, #12]
    12b8:	687a      	ldr	r2, [r7, #4]
    12ba:	4413      	add	r3, r2
    12bc:	7afa      	ldrb	r2, [r7, #11]
    12be:	701a      	strb	r2, [r3, #0]
					con.putc(c);
    12c0:	4b0a      	ldr	r3, [pc, #40]	; (12ec <read_line+0x168>)
    12c2:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    12c4:	7afa      	ldrb	r2, [r7, #11]
    12c6:	4610      	mov	r0, r2
    12c8:	4798      	blx	r3
    12ca:	e001      	b.n	12d0 <read_line+0x14c>
				}else{
					beep();
    12cc:	f7ff ff54 	bl	1178 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    12d0:	7afb      	ldrb	r3, [r7, #11]
    12d2:	2b0d      	cmp	r3, #13
    12d4:	f47f af63 	bne.w	119e <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    12d8:	687a      	ldr	r2, [r7, #4]
    12da:	68fb      	ldr	r3, [r7, #12]
    12dc:	4413      	add	r3, r2
    12de:	2200      	movs	r2, #0
    12e0:	701a      	strb	r2, [r3, #0]
	return line_len;
    12e2:	68fb      	ldr	r3, [r7, #12]
}
    12e4:	4618      	mov	r0, r3
    12e6:	3710      	adds	r7, #16
    12e8:	46bd      	mov	sp, r7
    12ea:	bd80      	pop	{r7, pc}
    12ec:	200000f0 	.word	0x200000f0

000012f0 <print_int>:

// imprime un entier
// i entier à imprimer
// base  numérique
void print_int(int i, unsigned base){
    12f0:	b580      	push	{r7, lr}
    12f2:	b08e      	sub	sp, #56	; 0x38
    12f4:	af00      	add	r7, sp, #0
    12f6:	6078      	str	r0, [r7, #4]
    12f8:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    12fa:	2301      	movs	r3, #1
    12fc:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    12fe:	2322      	movs	r3, #34	; 0x22
    1300:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    1302:	2300      	movs	r3, #0
    1304:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1308:	687b      	ldr	r3, [r7, #4]
    130a:	2b00      	cmp	r3, #0
    130c:	da05      	bge.n	131a <print_int+0x2a>
    130e:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1312:	637b      	str	r3, [r7, #52]	; 0x34
    1314:	687b      	ldr	r3, [r7, #4]
    1316:	425b      	negs	r3, r3
    1318:	607b      	str	r3, [r7, #4]
	while (i){
    131a:	e02c      	b.n	1376 <print_int+0x86>
		fmt[pos]=i%base+'0';
    131c:	687b      	ldr	r3, [r7, #4]
    131e:	683a      	ldr	r2, [r7, #0]
    1320:	fbb3 f2f2 	udiv	r2, r3, r2
    1324:	6839      	ldr	r1, [r7, #0]
    1326:	fb01 f202 	mul.w	r2, r1, r2
    132a:	1a9b      	subs	r3, r3, r2
    132c:	b2db      	uxtb	r3, r3
    132e:	3330      	adds	r3, #48	; 0x30
    1330:	b2d9      	uxtb	r1, r3
    1332:	f107 020c 	add.w	r2, r7, #12
    1336:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1338:	4413      	add	r3, r2
    133a:	460a      	mov	r2, r1
    133c:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    133e:	f107 020c 	add.w	r2, r7, #12
    1342:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1344:	4413      	add	r3, r2
    1346:	781b      	ldrb	r3, [r3, #0]
    1348:	2b39      	cmp	r3, #57	; 0x39
    134a:	d90c      	bls.n	1366 <print_int+0x76>
    134c:	f107 020c 	add.w	r2, r7, #12
    1350:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1352:	4413      	add	r3, r2
    1354:	781b      	ldrb	r3, [r3, #0]
    1356:	3307      	adds	r3, #7
    1358:	b2d9      	uxtb	r1, r3
    135a:	f107 020c 	add.w	r2, r7, #12
    135e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1360:	4413      	add	r3, r2
    1362:	460a      	mov	r2, r1
    1364:	701a      	strb	r2, [r3, #0]
		pos--;
    1366:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1368:	3b01      	subs	r3, #1
    136a:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    136c:	687a      	ldr	r2, [r7, #4]
    136e:	683b      	ldr	r3, [r7, #0]
    1370:	fbb2 f3f3 	udiv	r3, r2, r3
    1374:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    1376:	687b      	ldr	r3, [r7, #4]
    1378:	2b00      	cmp	r3, #0
    137a:	d1cf      	bne.n	131c <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    137c:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    137e:	2b22      	cmp	r3, #34	; 0x22
    1380:	d108      	bne.n	1394 <print_int+0xa4>
    1382:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1384:	1e5a      	subs	r2, r3, #1
    1386:	633a      	str	r2, [r7, #48]	; 0x30
    1388:	f107 0238 	add.w	r2, r7, #56	; 0x38
    138c:	4413      	add	r3, r2
    138e:	2230      	movs	r2, #48	; 0x30
    1390:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    1394:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    1396:	2b00      	cmp	r3, #0
    1398:	da08      	bge.n	13ac <print_int+0xbc>
    139a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    139c:	1e5a      	subs	r2, r3, #1
    139e:	633a      	str	r2, [r7, #48]	; 0x30
    13a0:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13a4:	4413      	add	r3, r2
    13a6:	222d      	movs	r2, #45	; 0x2d
    13a8:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    13ac:	f107 020c 	add.w	r2, r7, #12
    13b0:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13b2:	4413      	add	r3, r2
    13b4:	2220      	movs	r2, #32
    13b6:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    13b8:	f107 020c 	add.w	r2, r7, #12
    13bc:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13be:	4413      	add	r3, r2
    13c0:	4618      	mov	r0, r3
    13c2:	f7ff febb 	bl	113c <print>
}
    13c6:	3738      	adds	r7, #56	; 0x38
    13c8:	46bd      	mov	sp, r7
    13ca:	bd80      	pop	{r7, pc}

000013cc <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    13cc:	b580      	push	{r7, lr}
    13ce:	b088      	sub	sp, #32
    13d0:	af00      	add	r7, sp, #0
    13d2:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    13d4:	230c      	movs	r3, #12
    13d6:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    13d8:	2300      	movs	r3, #0
    13da:	767b      	strb	r3, [r7, #25]
	while (u){
    13dc:	e026      	b.n	142c <print_hex+0x60>
		fmt[pos]=u%16+'0';
    13de:	687b      	ldr	r3, [r7, #4]
    13e0:	b2db      	uxtb	r3, r3
    13e2:	f003 030f 	and.w	r3, r3, #15
    13e6:	b2db      	uxtb	r3, r3
    13e8:	3330      	adds	r3, #48	; 0x30
    13ea:	b2d9      	uxtb	r1, r3
    13ec:	f107 020c 	add.w	r2, r7, #12
    13f0:	69fb      	ldr	r3, [r7, #28]
    13f2:	4413      	add	r3, r2
    13f4:	460a      	mov	r2, r1
    13f6:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    13f8:	f107 020c 	add.w	r2, r7, #12
    13fc:	69fb      	ldr	r3, [r7, #28]
    13fe:	4413      	add	r3, r2
    1400:	781b      	ldrb	r3, [r3, #0]
    1402:	2b39      	cmp	r3, #57	; 0x39
    1404:	d90c      	bls.n	1420 <print_hex+0x54>
    1406:	f107 020c 	add.w	r2, r7, #12
    140a:	69fb      	ldr	r3, [r7, #28]
    140c:	4413      	add	r3, r2
    140e:	781b      	ldrb	r3, [r3, #0]
    1410:	3307      	adds	r3, #7
    1412:	b2d9      	uxtb	r1, r3
    1414:	f107 020c 	add.w	r2, r7, #12
    1418:	69fb      	ldr	r3, [r7, #28]
    141a:	4413      	add	r3, r2
    141c:	460a      	mov	r2, r1
    141e:	701a      	strb	r2, [r3, #0]
		pos--;
    1420:	69fb      	ldr	r3, [r7, #28]
    1422:	3b01      	subs	r3, #1
    1424:	61fb      	str	r3, [r7, #28]
		u/=16;
    1426:	687b      	ldr	r3, [r7, #4]
    1428:	091b      	lsrs	r3, r3, #4
    142a:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    142c:	687b      	ldr	r3, [r7, #4]
    142e:	2b00      	cmp	r3, #0
    1430:	d1d5      	bne.n	13de <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    1432:	69fb      	ldr	r3, [r7, #28]
    1434:	2b0c      	cmp	r3, #12
    1436:	d108      	bne.n	144a <print_hex+0x7e>
    1438:	69fb      	ldr	r3, [r7, #28]
    143a:	1e5a      	subs	r2, r3, #1
    143c:	61fa      	str	r2, [r7, #28]
    143e:	f107 0220 	add.w	r2, r7, #32
    1442:	4413      	add	r3, r2
    1444:	2230      	movs	r2, #48	; 0x30
    1446:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    144a:	69fb      	ldr	r3, [r7, #28]
    144c:	1e5a      	subs	r2, r3, #1
    144e:	61fa      	str	r2, [r7, #28]
    1450:	f107 0220 	add.w	r2, r7, #32
    1454:	4413      	add	r3, r2
    1456:	2278      	movs	r2, #120	; 0x78
    1458:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    145c:	69fb      	ldr	r3, [r7, #28]
    145e:	1e5a      	subs	r2, r3, #1
    1460:	61fa      	str	r2, [r7, #28]
    1462:	f107 0220 	add.w	r2, r7, #32
    1466:	4413      	add	r3, r2
    1468:	2230      	movs	r2, #48	; 0x30
    146a:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    146e:	f107 020c 	add.w	r2, r7, #12
    1472:	69fb      	ldr	r3, [r7, #28]
    1474:	4413      	add	r3, r2
    1476:	2220      	movs	r2, #32
    1478:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    147a:	f107 020c 	add.w	r2, r7, #12
    147e:	69fb      	ldr	r3, [r7, #28]
    1480:	4413      	add	r3, r2
    1482:	4618      	mov	r0, r3
    1484:	f7ff fe5a 	bl	113c <print>
}
    1488:	3720      	adds	r7, #32
    148a:	46bd      	mov	sp, r7
    148c:	bd80      	pop	{r7, pc}
    148e:	bf00      	nop

00001490 <cls>:

void cls(){
    1490:	b580      	push	{r7, lr}
    1492:	af00      	add	r7, sp, #0
	con.cls();
    1494:	4b01      	ldr	r3, [pc, #4]	; (149c <cls+0xc>)
    1496:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    1498:	4798      	blx	r3
}
    149a:	bd80      	pop	{r7, pc}
    149c:	200000f0 	.word	0x200000f0

000014a0 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    14a0:	b480      	push	{r7}
    14a2:	af00      	add	r7, sp, #0
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
    14a4:	4b13      	ldr	r3, [pc, #76]	; (14f4 <flash_enable+0x54>)
    14a6:	681b      	ldr	r3, [r3, #0]
    14a8:	f003 0301 	and.w	r3, r3, #1
    14ac:	2b00      	cmp	r3, #0
    14ae:	d10c      	bne.n	14ca <flash_enable+0x2a>
		RCC->CR|=RCC_CR_HSION;
    14b0:	4a10      	ldr	r2, [pc, #64]	; (14f4 <flash_enable+0x54>)
    14b2:	4b10      	ldr	r3, [pc, #64]	; (14f4 <flash_enable+0x54>)
    14b4:	681b      	ldr	r3, [r3, #0]
    14b6:	f043 0301 	orr.w	r3, r3, #1
    14ba:	6013      	str	r3, [r2, #0]
		while (!(RCC->CR&RCC_CR_HSIRDY));
    14bc:	bf00      	nop
    14be:	4b0d      	ldr	r3, [pc, #52]	; (14f4 <flash_enable+0x54>)
    14c0:	681b      	ldr	r3, [r3, #0]
    14c2:	f003 0302 	and.w	r3, r3, #2
    14c6:	2b00      	cmp	r3, #0
    14c8:	d0f9      	beq.n	14be <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    14ca:	4b0b      	ldr	r3, [pc, #44]	; (14f8 <flash_enable+0x58>)
    14cc:	4a0b      	ldr	r2, [pc, #44]	; (14fc <flash_enable+0x5c>)
    14ce:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    14d0:	4b09      	ldr	r3, [pc, #36]	; (14f8 <flash_enable+0x58>)
    14d2:	4a0b      	ldr	r2, [pc, #44]	; (1500 <flash_enable+0x60>)
    14d4:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    14d6:	4b08      	ldr	r3, [pc, #32]	; (14f8 <flash_enable+0x58>)
    14d8:	691b      	ldr	r3, [r3, #16]
    14da:	f003 0380 	and.w	r3, r3, #128	; 0x80
    14de:	2b00      	cmp	r3, #0
    14e0:	bf0c      	ite	eq
    14e2:	2301      	moveq	r3, #1
    14e4:	2300      	movne	r3, #0
    14e6:	b2db      	uxtb	r3, r3
}
    14e8:	4618      	mov	r0, r3
    14ea:	46bd      	mov	sp, r7
    14ec:	f85d 7b04 	ldr.w	r7, [sp], #4
    14f0:	4770      	bx	lr
    14f2:	bf00      	nop
    14f4:	40021000 	.word	0x40021000
    14f8:	40022000 	.word	0x40022000
    14fc:	45670123 	.word	0x45670123
    1500:	cdef89ab 	.word	0xcdef89ab

00001504 <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    1504:	b480      	push	{r7}
    1506:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    1508:	4a04      	ldr	r2, [pc, #16]	; (151c <flash_disable+0x18>)
    150a:	4b04      	ldr	r3, [pc, #16]	; (151c <flash_disable+0x18>)
    150c:	691b      	ldr	r3, [r3, #16]
    150e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    1512:	6113      	str	r3, [r2, #16]
}
    1514:	46bd      	mov	sp, r7
    1516:	f85d 7b04 	ldr.w	r7, [sp], #4
    151a:	4770      	bx	lr
    151c:	40022000 	.word	0x40022000

00001520 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1520:	b480      	push	{r7}
    1522:	b083      	sub	sp, #12
    1524:	af00      	add	r7, sp, #0
    1526:	6078      	str	r0, [r7, #4]
    1528:	460b      	mov	r3, r1
    152a:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    152c:	4b1d      	ldr	r3, [pc, #116]	; (15a4 <flash_write+0x84>)
    152e:	691b      	ldr	r3, [r3, #16]
    1530:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1534:	2b00      	cmp	r3, #0
    1536:	d105      	bne.n	1544 <flash_write+0x24>
    1538:	687b      	ldr	r3, [r7, #4]
    153a:	881b      	ldrh	r3, [r3, #0]
    153c:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1540:	4293      	cmp	r3, r2
    1542:	d001      	beq.n	1548 <flash_write+0x28>
    1544:	2300      	movs	r3, #0
    1546:	e027      	b.n	1598 <flash_write+0x78>
	while (_flash_busy);
    1548:	bf00      	nop
    154a:	4b16      	ldr	r3, [pc, #88]	; (15a4 <flash_write+0x84>)
    154c:	68db      	ldr	r3, [r3, #12]
    154e:	f003 0301 	and.w	r3, r3, #1
    1552:	2b00      	cmp	r3, #0
    1554:	d1f9      	bne.n	154a <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1556:	4a13      	ldr	r2, [pc, #76]	; (15a4 <flash_write+0x84>)
    1558:	4b12      	ldr	r3, [pc, #72]	; (15a4 <flash_write+0x84>)
    155a:	68db      	ldr	r3, [r3, #12]
    155c:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1560:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    1562:	4b10      	ldr	r3, [pc, #64]	; (15a4 <flash_write+0x84>)
    1564:	2201      	movs	r2, #1
    1566:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    1568:	687b      	ldr	r3, [r7, #4]
    156a:	887a      	ldrh	r2, [r7, #2]
    156c:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    156e:	bf00      	nop
    1570:	4b0c      	ldr	r3, [pc, #48]	; (15a4 <flash_write+0x84>)
    1572:	68db      	ldr	r3, [r3, #12]
    1574:	f003 0301 	and.w	r3, r3, #1
    1578:	2b00      	cmp	r3, #0
    157a:	d005      	beq.n	1588 <flash_write+0x68>
    157c:	4b09      	ldr	r3, [pc, #36]	; (15a4 <flash_write+0x84>)
    157e:	68db      	ldr	r3, [r3, #12]
    1580:	f003 0320 	and.w	r3, r3, #32
    1584:	2b00      	cmp	r3, #0
    1586:	d0f3      	beq.n	1570 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    1588:	687b      	ldr	r3, [r7, #4]
    158a:	881b      	ldrh	r3, [r3, #0]
    158c:	887a      	ldrh	r2, [r7, #2]
    158e:	429a      	cmp	r2, r3
    1590:	bf0c      	ite	eq
    1592:	2301      	moveq	r3, #1
    1594:	2300      	movne	r3, #0
    1596:	b2db      	uxtb	r3, r3
}
    1598:	4618      	mov	r0, r3
    159a:	370c      	adds	r7, #12
    159c:	46bd      	mov	sp, r7
    159e:	f85d 7b04 	ldr.w	r7, [sp], #4
    15a2:	4770      	bx	lr
    15a4:	40022000 	.word	0x40022000

000015a8 <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    15a8:	b480      	push	{r7}
    15aa:	b087      	sub	sp, #28
    15ac:	af00      	add	r7, sp, #0
    15ae:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    15b0:	4b27      	ldr	r3, [pc, #156]	; (1650 <flash_erase_page+0xa8>)
    15b2:	691b      	ldr	r3, [r3, #16]
    15b4:	f003 0380 	and.w	r3, r3, #128	; 0x80
    15b8:	2b00      	cmp	r3, #0
    15ba:	d001      	beq.n	15c0 <flash_erase_page+0x18>
    15bc:	2300      	movs	r3, #0
    15be:	e040      	b.n	1642 <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    15c0:	4a23      	ldr	r2, [pc, #140]	; (1650 <flash_erase_page+0xa8>)
    15c2:	4b23      	ldr	r3, [pc, #140]	; (1650 <flash_erase_page+0xa8>)
    15c4:	68db      	ldr	r3, [r3, #12]
    15c6:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    15ca:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    15cc:	687b      	ldr	r3, [r7, #4]
    15ce:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    15d2:	f023 0303 	bic.w	r3, r3, #3
    15d6:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    15d8:	4b1d      	ldr	r3, [pc, #116]	; (1650 <flash_erase_page+0xa8>)
    15da:	2202      	movs	r2, #2
    15dc:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    15de:	4a1c      	ldr	r2, [pc, #112]	; (1650 <flash_erase_page+0xa8>)
    15e0:	687b      	ldr	r3, [r7, #4]
    15e2:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    15e4:	4a1a      	ldr	r2, [pc, #104]	; (1650 <flash_erase_page+0xa8>)
    15e6:	4b1a      	ldr	r3, [pc, #104]	; (1650 <flash_erase_page+0xa8>)
    15e8:	691b      	ldr	r3, [r3, #16]
    15ea:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    15ee:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    15f0:	bf00      	nop
    15f2:	4b17      	ldr	r3, [pc, #92]	; (1650 <flash_erase_page+0xa8>)
    15f4:	68db      	ldr	r3, [r3, #12]
    15f6:	f003 0301 	and.w	r3, r3, #1
    15fa:	2b00      	cmp	r3, #0
    15fc:	d005      	beq.n	160a <flash_erase_page+0x62>
    15fe:	4b14      	ldr	r3, [pc, #80]	; (1650 <flash_erase_page+0xa8>)
    1600:	68db      	ldr	r3, [r3, #12]
    1602:	f003 0320 	and.w	r3, r3, #32
    1606:	2b00      	cmp	r3, #0
    1608:	d0f3      	beq.n	15f2 <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    160a:	687b      	ldr	r3, [r7, #4]
    160c:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    160e:	2300      	movs	r3, #0
    1610:	60fb      	str	r3, [r7, #12]
    1612:	e00c      	b.n	162e <flash_erase_page+0x86>
		u32=*adr++;
    1614:	697b      	ldr	r3, [r7, #20]
    1616:	1d1a      	adds	r2, r3, #4
    1618:	617a      	str	r2, [r7, #20]
    161a:	681b      	ldr	r3, [r3, #0]
    161c:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    161e:	693b      	ldr	r3, [r7, #16]
    1620:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1624:	d000      	beq.n	1628 <flash_erase_page+0x80>
    1626:	e005      	b.n	1634 <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    1628:	68fb      	ldr	r3, [r7, #12]
    162a:	3301      	adds	r3, #1
    162c:	60fb      	str	r3, [r7, #12]
    162e:	68fb      	ldr	r3, [r7, #12]
    1630:	2bff      	cmp	r3, #255	; 0xff
    1632:	ddef      	ble.n	1614 <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    1634:	693b      	ldr	r3, [r7, #16]
    1636:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    163a:	bf0c      	ite	eq
    163c:	2301      	moveq	r3, #1
    163e:	2300      	movne	r3, #0
    1640:	b2db      	uxtb	r3, r3
}
    1642:	4618      	mov	r0, r3
    1644:	371c      	adds	r7, #28
    1646:	46bd      	mov	sp, r7
    1648:	f85d 7b04 	ldr.w	r7, [sp], #4
    164c:	4770      	bx	lr
    164e:	bf00      	nop
    1650:	40022000 	.word	0x40022000

00001654 <hide_cursor>:
// position  du curseur texte.
static int cursor_x, cursor_y;
static int cursor_visible=0;
static int cursor_blink=0;

static void hide_cursor(){
    1654:	b580      	push	{r7, lr}
    1656:	b082      	sub	sp, #8
    1658:	af02      	add	r7, sp, #8
	if (cursor_visible){
    165a:	4b0c      	ldr	r3, [pc, #48]	; (168c <hide_cursor+0x38>)
    165c:	681b      	ldr	r3, [r3, #0]
    165e:	2b00      	cmp	r3, #0
    1660:	d011      	beq.n	1686 <hide_cursor+0x32>
		disable_interrupt(IRQ_CURSOR_BLINK);
    1662:	201e      	movs	r0, #30
    1664:	f000 fe72 	bl	234c <disable_interrupt>
		gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    1668:	4b09      	ldr	r3, [pc, #36]	; (1690 <hide_cursor+0x3c>)
    166a:	6819      	ldr	r1, [r3, #0]
    166c:	4b09      	ldr	r3, [pc, #36]	; (1694 <hide_cursor+0x40>)
    166e:	681a      	ldr	r2, [r3, #0]
    1670:	2300      	movs	r3, #0
    1672:	9300      	str	r3, [sp, #0]
    1674:	4608      	mov	r0, r1
    1676:	4611      	mov	r1, r2
    1678:	2206      	movs	r2, #6
    167a:	2308      	movs	r3, #8
    167c:	f000 f912 	bl	18a4 <gdi_box>
		cursor_visible=0;
    1680:	4b02      	ldr	r3, [pc, #8]	; (168c <hide_cursor+0x38>)
    1682:	2200      	movs	r2, #0
    1684:	601a      	str	r2, [r3, #0]
	}
}
    1686:	46bd      	mov	sp, r7
    1688:	bd80      	pop	{r7, pc}
    168a:	bf00      	nop
    168c:	200000b4 	.word	0x200000b4
    1690:	200000ac 	.word	0x200000ac
    1694:	200000b0 	.word	0x200000b0

00001698 <gdi_clear_screen>:

void gdi_clear_screen(){
    1698:	b580      	push	{r7, lr}
    169a:	b082      	sub	sp, #8
    169c:	af00      	add	r7, sp, #0
	int i;
	hide_cursor();
    169e:	f7ff ffd9 	bl	1654 <hide_cursor>
	for (i=0;i<(ROW_SIZE*VRES);){
    16a2:	2300      	movs	r3, #0
    16a4:	607b      	str	r3, [r7, #4]
    16a6:	e006      	b.n	16b6 <gdi_clear_screen+0x1e>
		video_buffer[i++]=0;
    16a8:	687b      	ldr	r3, [r7, #4]
    16aa:	1c5a      	adds	r2, r3, #1
    16ac:	607a      	str	r2, [r7, #4]
    16ae:	4a09      	ldr	r2, [pc, #36]	; (16d4 <gdi_clear_screen+0x3c>)
    16b0:	2100      	movs	r1, #0
    16b2:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
}

void gdi_clear_screen(){
	int i;
	hide_cursor();
	for (i=0;i<(ROW_SIZE*VRES);){
    16b6:	687b      	ldr	r3, [r7, #4]
    16b8:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    16bc:	dbf4      	blt.n	16a8 <gdi_clear_screen+0x10>
		video_buffer[i++]=0;
	}
	if (cursor_blink){
    16be:	4b06      	ldr	r3, [pc, #24]	; (16d8 <gdi_clear_screen+0x40>)
    16c0:	681b      	ldr	r3, [r3, #0]
    16c2:	2b00      	cmp	r3, #0
    16c4:	d002      	beq.n	16cc <gdi_clear_screen+0x34>
		enable_interrupt(IRQ_CURSOR_BLINK);
    16c6:	201e      	movs	r0, #30
    16c8:	f000 fe1c 	bl	2304 <enable_interrupt>
	}
}
    16cc:	3708      	adds	r7, #8
    16ce:	46bd      	mov	sp, r7
    16d0:	bd80      	pop	{r7, pc}
    16d2:	bf00      	nop
    16d4:	20000130 	.word	0x20000130
    16d8:	200000b8 	.word	0x200000b8

000016dc <gdi_scroll_up>:

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
    16dc:	b580      	push	{r7, lr}
    16de:	b082      	sub	sp, #8
    16e0:	af00      	add	r7, sp, #0
	int i,j=0;
    16e2:	2300      	movs	r3, #0
    16e4:	603b      	str	r3, [r7, #0]
	hide_cursor();
    16e6:	f7ff ffb5 	bl	1654 <hide_cursor>
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    16ea:	23a0      	movs	r3, #160	; 0xa0
    16ec:	607b      	str	r3, [r7, #4]
    16ee:	e00b      	b.n	1708 <gdi_scroll_up+0x2c>
		video_buffer[j++]=video_buffer[i++];
    16f0:	683b      	ldr	r3, [r7, #0]
    16f2:	1c5a      	adds	r2, r3, #1
    16f4:	603a      	str	r2, [r7, #0]
    16f6:	687a      	ldr	r2, [r7, #4]
    16f8:	1c51      	adds	r1, r2, #1
    16fa:	6079      	str	r1, [r7, #4]
    16fc:	4911      	ldr	r1, [pc, #68]	; (1744 <gdi_scroll_up+0x68>)
    16fe:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    1702:	4a10      	ldr	r2, [pc, #64]	; (1744 <gdi_scroll_up+0x68>)
    1704:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
	int i,j=0;
	hide_cursor();
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    1708:	687b      	ldr	r3, [r7, #4]
    170a:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    170e:	dbef      	blt.n	16f0 <gdi_scroll_up+0x14>
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1710:	f44f 5391 	mov.w	r3, #4640	; 0x1220
    1714:	607b      	str	r3, [r7, #4]
    1716:	e006      	b.n	1726 <gdi_scroll_up+0x4a>
		video_buffer[i++]=0;
    1718:	687b      	ldr	r3, [r7, #4]
    171a:	1c5a      	adds	r2, r3, #1
    171c:	607a      	str	r2, [r7, #4]
    171e:	4a09      	ldr	r2, [pc, #36]	; (1744 <gdi_scroll_up+0x68>)
    1720:	2100      	movs	r1, #0
    1722:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i,j=0;
	hide_cursor();
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1726:	687b      	ldr	r3, [r7, #4]
    1728:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    172c:	dbf4      	blt.n	1718 <gdi_scroll_up+0x3c>
		video_buffer[i++]=0;
	}
	if (cursor_blink){
    172e:	4b06      	ldr	r3, [pc, #24]	; (1748 <gdi_scroll_up+0x6c>)
    1730:	681b      	ldr	r3, [r3, #0]
    1732:	2b00      	cmp	r3, #0
    1734:	d002      	beq.n	173c <gdi_scroll_up+0x60>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1736:	201e      	movs	r0, #30
    1738:	f000 fde4 	bl	2304 <enable_interrupt>
	}
}
    173c:	3708      	adds	r7, #8
    173e:	46bd      	mov	sp, r7
    1740:	bd80      	pop	{r7, pc}
    1742:	bf00      	nop
    1744:	20000130 	.word	0x20000130
    1748:	200000b8 	.word	0x200000b8

0000174c <gdi_new_line>:

// avance le curseur texte au début 
// de la ligne suivante.
void gdi_new_line(){
    174c:	b580      	push	{r7, lr}
    174e:	af00      	add	r7, sp, #0
	hide_cursor();
    1750:	f7ff ff80 	bl	1654 <hide_cursor>
	
	cursor_x=0;
    1754:	4b0c      	ldr	r3, [pc, #48]	; (1788 <gdi_new_line+0x3c>)
    1756:	2200      	movs	r2, #0
    1758:	601a      	str	r2, [r3, #0]
	cursor_y+=CHAR_HEIGHT;
    175a:	4b0c      	ldr	r3, [pc, #48]	; (178c <gdi_new_line+0x40>)
    175c:	681b      	ldr	r3, [r3, #0]
    175e:	3308      	adds	r3, #8
    1760:	4a0a      	ldr	r2, [pc, #40]	; (178c <gdi_new_line+0x40>)
    1762:	6013      	str	r3, [r2, #0]
	if (cursor_y>(VRES-CHAR_HEIGHT)){
    1764:	4b09      	ldr	r3, [pc, #36]	; (178c <gdi_new_line+0x40>)
    1766:	681b      	ldr	r3, [r3, #0]
    1768:	2be8      	cmp	r3, #232	; 0xe8
    176a:	dd04      	ble.n	1776 <gdi_new_line+0x2a>
		cursor_y=VRES-CHAR_HEIGHT;
    176c:	4b07      	ldr	r3, [pc, #28]	; (178c <gdi_new_line+0x40>)
    176e:	22e8      	movs	r2, #232	; 0xe8
    1770:	601a      	str	r2, [r3, #0]
		gdi_scroll_up();
    1772:	f7ff ffb3 	bl	16dc <gdi_scroll_up>
	}
	if (cursor_blink){
    1776:	4b06      	ldr	r3, [pc, #24]	; (1790 <gdi_new_line+0x44>)
    1778:	681b      	ldr	r3, [r3, #0]
    177a:	2b00      	cmp	r3, #0
    177c:	d002      	beq.n	1784 <gdi_new_line+0x38>
		enable_interrupt(IRQ_CURSOR_BLINK);
    177e:	201e      	movs	r0, #30
    1780:	f000 fdc0 	bl	2304 <enable_interrupt>
	}
}
    1784:	bd80      	pop	{r7, pc}
    1786:	bf00      	nop
    1788:	200000ac 	.word	0x200000ac
    178c:	200000b0 	.word	0x200000b0
    1790:	200000b8 	.word	0x200000b8

00001794 <gdi_cursor_left>:

void gdi_cursor_left(){
    1794:	b580      	push	{r7, lr}
    1796:	af00      	add	r7, sp, #0
	hide_cursor();
    1798:	f7ff ff5c 	bl	1654 <hide_cursor>
	if (!(cursor_x|cursor_y)) return;
    179c:	4b16      	ldr	r3, [pc, #88]	; (17f8 <gdi_cursor_left+0x64>)
    179e:	681a      	ldr	r2, [r3, #0]
    17a0:	4b16      	ldr	r3, [pc, #88]	; (17fc <gdi_cursor_left+0x68>)
    17a2:	681b      	ldr	r3, [r3, #0]
    17a4:	4313      	orrs	r3, r2
    17a6:	2b00      	cmp	r3, #0
    17a8:	d100      	bne.n	17ac <gdi_cursor_left+0x18>
    17aa:	e024      	b.n	17f6 <gdi_cursor_left+0x62>
	if (cursor_x>=CHAR_WIDTH){
    17ac:	4b12      	ldr	r3, [pc, #72]	; (17f8 <gdi_cursor_left+0x64>)
    17ae:	681b      	ldr	r3, [r3, #0]
    17b0:	2b05      	cmp	r3, #5
    17b2:	dd05      	ble.n	17c0 <gdi_cursor_left+0x2c>
		cursor_x-=CHAR_WIDTH;
    17b4:	4b10      	ldr	r3, [pc, #64]	; (17f8 <gdi_cursor_left+0x64>)
    17b6:	681b      	ldr	r3, [r3, #0]
    17b8:	3b06      	subs	r3, #6
    17ba:	4a0f      	ldr	r2, [pc, #60]	; (17f8 <gdi_cursor_left+0x64>)
    17bc:	6013      	str	r3, [r2, #0]
    17be:	e013      	b.n	17e8 <gdi_cursor_left+0x54>
	}else if (cursor_y) {
    17c0:	4b0e      	ldr	r3, [pc, #56]	; (17fc <gdi_cursor_left+0x68>)
    17c2:	681b      	ldr	r3, [r3, #0]
    17c4:	2b00      	cmp	r3, #0
    17c6:	d00f      	beq.n	17e8 <gdi_cursor_left+0x54>
		cursor_x=CHAR_WIDTH*(CHARS_PER_LINE-1);
    17c8:	4b0b      	ldr	r3, [pc, #44]	; (17f8 <gdi_cursor_left+0x64>)
    17ca:	f44f 729c 	mov.w	r2, #312	; 0x138
    17ce:	601a      	str	r2, [r3, #0]
		cursor_y-=CHAR_HEIGHT;
    17d0:	4b0a      	ldr	r3, [pc, #40]	; (17fc <gdi_cursor_left+0x68>)
    17d2:	681b      	ldr	r3, [r3, #0]
    17d4:	3b08      	subs	r3, #8
    17d6:	4a09      	ldr	r2, [pc, #36]	; (17fc <gdi_cursor_left+0x68>)
    17d8:	6013      	str	r3, [r2, #0]
		if (cursor_y<0) cursor_y=0;
    17da:	4b08      	ldr	r3, [pc, #32]	; (17fc <gdi_cursor_left+0x68>)
    17dc:	681b      	ldr	r3, [r3, #0]
    17de:	2b00      	cmp	r3, #0
    17e0:	da02      	bge.n	17e8 <gdi_cursor_left+0x54>
    17e2:	4b06      	ldr	r3, [pc, #24]	; (17fc <gdi_cursor_left+0x68>)
    17e4:	2200      	movs	r2, #0
    17e6:	601a      	str	r2, [r3, #0]
	}
	if (cursor_blink){
    17e8:	4b05      	ldr	r3, [pc, #20]	; (1800 <gdi_cursor_left+0x6c>)
    17ea:	681b      	ldr	r3, [r3, #0]
    17ec:	2b00      	cmp	r3, #0
    17ee:	d002      	beq.n	17f6 <gdi_cursor_left+0x62>
		enable_interrupt(IRQ_CURSOR_BLINK);
    17f0:	201e      	movs	r0, #30
    17f2:	f000 fd87 	bl	2304 <enable_interrupt>
	}
}
    17f6:	bd80      	pop	{r7, pc}
    17f8:	200000ac 	.word	0x200000ac
    17fc:	200000b0 	.word	0x200000b0
    1800:	200000b8 	.word	0x200000b8

00001804 <gdi_bit_op>:


void gdi_bit_op(int x, int y, bitop_e op){
    1804:	b480      	push	{r7}
    1806:	b087      	sub	sp, #28
    1808:	af00      	add	r7, sp, #0
    180a:	60f8      	str	r0, [r7, #12]
    180c:	60b9      	str	r1, [r7, #8]
    180e:	4613      	mov	r3, r2
    1810:	71fb      	strb	r3, [r7, #7]
	uint16_t bit;
	int offset=y*ROW_SIZE+(x>>4);
    1812:	68ba      	ldr	r2, [r7, #8]
    1814:	4613      	mov	r3, r2
    1816:	009b      	lsls	r3, r3, #2
    1818:	4413      	add	r3, r2
    181a:	009b      	lsls	r3, r3, #2
    181c:	461a      	mov	r2, r3
    181e:	68fb      	ldr	r3, [r7, #12]
    1820:	111b      	asrs	r3, r3, #4
    1822:	4413      	add	r3, r2
    1824:	617b      	str	r3, [r7, #20]
	bit=1<<(15-(x&15));
    1826:	68fb      	ldr	r3, [r7, #12]
    1828:	43db      	mvns	r3, r3
    182a:	f003 030f 	and.w	r3, r3, #15
    182e:	2201      	movs	r2, #1
    1830:	fa02 f303 	lsl.w	r3, r2, r3
    1834:	827b      	strh	r3, [r7, #18]
	switch (op){
    1836:	79fb      	ldrb	r3, [r7, #7]
    1838:	2b01      	cmp	r3, #1
    183a:	d013      	beq.n	1864 <gdi_bit_op+0x60>
    183c:	2b02      	cmp	r3, #2
    183e:	d01d      	beq.n	187c <gdi_bit_op+0x78>
    1840:	2b00      	cmp	r3, #0
    1842:	d127      	bne.n	1894 <gdi_bit_op+0x90>
	case BLACK_BIT:
		video_buffer[offset]&=~bit;
    1844:	4a16      	ldr	r2, [pc, #88]	; (18a0 <gdi_bit_op+0x9c>)
    1846:	697b      	ldr	r3, [r7, #20]
    1848:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    184c:	b29a      	uxth	r2, r3
    184e:	8a7b      	ldrh	r3, [r7, #18]
    1850:	43db      	mvns	r3, r3
    1852:	b29b      	uxth	r3, r3
    1854:	4013      	ands	r3, r2
    1856:	b29b      	uxth	r3, r3
    1858:	b299      	uxth	r1, r3
    185a:	4a11      	ldr	r2, [pc, #68]	; (18a0 <gdi_bit_op+0x9c>)
    185c:	697b      	ldr	r3, [r7, #20]
    185e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1862:	e017      	b.n	1894 <gdi_bit_op+0x90>
	case WHITE_BIT:
		video_buffer[offset]|=bit;
    1864:	4a0e      	ldr	r2, [pc, #56]	; (18a0 <gdi_bit_op+0x9c>)
    1866:	697b      	ldr	r3, [r7, #20]
    1868:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    186c:	8a7b      	ldrh	r3, [r7, #18]
    186e:	4313      	orrs	r3, r2
    1870:	b299      	uxth	r1, r3
    1872:	4a0b      	ldr	r2, [pc, #44]	; (18a0 <gdi_bit_op+0x9c>)
    1874:	697b      	ldr	r3, [r7, #20]
    1876:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    187a:	e00b      	b.n	1894 <gdi_bit_op+0x90>
	case XOR_BIT:
		video_buffer[offset]^=bit;
    187c:	4a08      	ldr	r2, [pc, #32]	; (18a0 <gdi_bit_op+0x9c>)
    187e:	697b      	ldr	r3, [r7, #20]
    1880:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1884:	8a7b      	ldrh	r3, [r7, #18]
    1886:	4053      	eors	r3, r2
    1888:	b299      	uxth	r1, r3
    188a:	4a05      	ldr	r2, [pc, #20]	; (18a0 <gdi_bit_op+0x9c>)
    188c:	697b      	ldr	r3, [r7, #20]
    188e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1892:	bf00      	nop
	}
}
    1894:	371c      	adds	r7, #28
    1896:	46bd      	mov	sp, r7
    1898:	f85d 7b04 	ldr.w	r7, [sp], #4
    189c:	4770      	bx	lr
    189e:	bf00      	nop
    18a0:	20000130 	.word	0x20000130

000018a4 <gdi_box>:

void gdi_box(int x, int y, int w, int h, bitop_e op){
    18a4:	b580      	push	{r7, lr}
    18a6:	b086      	sub	sp, #24
    18a8:	af00      	add	r7, sp, #0
    18aa:	60f8      	str	r0, [r7, #12]
    18ac:	60b9      	str	r1, [r7, #8]
    18ae:	607a      	str	r2, [r7, #4]
    18b0:	603b      	str	r3, [r7, #0]
	int r,c;
	
	for (r=0;r<h;r++){
    18b2:	2300      	movs	r3, #0
    18b4:	617b      	str	r3, [r7, #20]
    18b6:	e02e      	b.n	1916 <gdi_box+0x72>
		for (c=0;c<w;c++){
    18b8:	2300      	movs	r3, #0
    18ba:	613b      	str	r3, [r7, #16]
    18bc:	e024      	b.n	1908 <gdi_box+0x64>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    18be:	68fa      	ldr	r2, [r7, #12]
    18c0:	693b      	ldr	r3, [r7, #16]
    18c2:	4413      	add	r3, r2
    18c4:	2b00      	cmp	r3, #0
    18c6:	db1c      	blt.n	1902 <gdi_box+0x5e>
    18c8:	68fa      	ldr	r2, [r7, #12]
    18ca:	693b      	ldr	r3, [r7, #16]
    18cc:	4413      	add	r3, r2
    18ce:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    18d2:	da16      	bge.n	1902 <gdi_box+0x5e>
    18d4:	697a      	ldr	r2, [r7, #20]
    18d6:	68bb      	ldr	r3, [r7, #8]
    18d8:	4413      	add	r3, r2
    18da:	2b00      	cmp	r3, #0
    18dc:	db11      	blt.n	1902 <gdi_box+0x5e>
    18de:	697a      	ldr	r2, [r7, #20]
    18e0:	68bb      	ldr	r3, [r7, #8]
    18e2:	4413      	add	r3, r2
    18e4:	2bef      	cmp	r3, #239	; 0xef
    18e6:	dc0c      	bgt.n	1902 <gdi_box+0x5e>
				gdi_bit_op(c+x,r+y,op);
    18e8:	693a      	ldr	r2, [r7, #16]
    18ea:	68fb      	ldr	r3, [r7, #12]
    18ec:	18d1      	adds	r1, r2, r3
    18ee:	697a      	ldr	r2, [r7, #20]
    18f0:	68bb      	ldr	r3, [r7, #8]
    18f2:	441a      	add	r2, r3
    18f4:	f897 3020 	ldrb.w	r3, [r7, #32]
    18f8:	4608      	mov	r0, r1
    18fa:	4611      	mov	r1, r2
    18fc:	461a      	mov	r2, r3
    18fe:	f7ff ff81 	bl	1804 <gdi_bit_op>

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
		for (c=0;c<w;c++){
    1902:	693b      	ldr	r3, [r7, #16]
    1904:	3301      	adds	r3, #1
    1906:	613b      	str	r3, [r7, #16]
    1908:	693a      	ldr	r2, [r7, #16]
    190a:	687b      	ldr	r3, [r7, #4]
    190c:	429a      	cmp	r2, r3
    190e:	dbd6      	blt.n	18be <gdi_box+0x1a>
}

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
    1910:	697b      	ldr	r3, [r7, #20]
    1912:	3301      	adds	r3, #1
    1914:	617b      	str	r3, [r7, #20]
    1916:	697a      	ldr	r2, [r7, #20]
    1918:	683b      	ldr	r3, [r7, #0]
    191a:	429a      	cmp	r2, r3
    191c:	dbcc      	blt.n	18b8 <gdi_box+0x14>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				gdi_bit_op(c+x,r+y,op);
			}
		}
	}
}
    191e:	3718      	adds	r7, #24
    1920:	46bd      	mov	sp, r7
    1922:	bd80      	pop	{r7, pc}

00001924 <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
    1924:	b480      	push	{r7}
    1926:	b089      	sub	sp, #36	; 0x24
    1928:	af00      	add	r7, sp, #0
    192a:	60f8      	str	r0, [r7, #12]
    192c:	60b9      	str	r1, [r7, #8]
    192e:	607a      	str	r2, [r7, #4]
    1930:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1932:	2300      	movs	r3, #0
    1934:	61fb      	str	r3, [r7, #28]
    1936:	e099      	b.n	1a6c <gdi_put_sprite+0x148>
		mask=128;
    1938:	2380      	movs	r3, #128	; 0x80
    193a:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    193c:	2300      	movs	r3, #0
    193e:	61bb      	str	r3, [r7, #24]
    1940:	e08c      	b.n	1a5c <gdi_put_sprite+0x138>
			if (!mask){
    1942:	7dfb      	ldrb	r3, [r7, #23]
    1944:	2b00      	cmp	r3, #0
    1946:	d104      	bne.n	1952 <gdi_put_sprite+0x2e>
				sprite++;
    1948:	6abb      	ldr	r3, [r7, #40]	; 0x28
    194a:	3301      	adds	r3, #1
    194c:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    194e:	2380      	movs	r3, #128	; 0x80
    1950:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    1952:	68fa      	ldr	r2, [r7, #12]
    1954:	69bb      	ldr	r3, [r7, #24]
    1956:	4413      	add	r3, r2
    1958:	2b00      	cmp	r3, #0
    195a:	db79      	blt.n	1a50 <gdi_put_sprite+0x12c>
    195c:	68fa      	ldr	r2, [r7, #12]
    195e:	69bb      	ldr	r3, [r7, #24]
    1960:	4413      	add	r3, r2
    1962:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    1966:	da73      	bge.n	1a50 <gdi_put_sprite+0x12c>
    1968:	69fa      	ldr	r2, [r7, #28]
    196a:	68bb      	ldr	r3, [r7, #8]
    196c:	4413      	add	r3, r2
    196e:	2b00      	cmp	r3, #0
    1970:	db6e      	blt.n	1a50 <gdi_put_sprite+0x12c>
    1972:	69fa      	ldr	r2, [r7, #28]
    1974:	68bb      	ldr	r3, [r7, #8]
    1976:	4413      	add	r3, r2
    1978:	2bef      	cmp	r3, #239	; 0xef
    197a:	dc69      	bgt.n	1a50 <gdi_put_sprite+0x12c>
				if (sprite[r]&mask){
    197c:	69fb      	ldr	r3, [r7, #28]
    197e:	6aba      	ldr	r2, [r7, #40]	; 0x28
    1980:	4413      	add	r3, r2
    1982:	781a      	ldrb	r2, [r3, #0]
    1984:	7dfb      	ldrb	r3, [r7, #23]
    1986:	4013      	ands	r3, r2
    1988:	b2db      	uxtb	r3, r3
    198a:	2b00      	cmp	r3, #0
    198c:	d02f      	beq.n	19ee <gdi_put_sprite+0xca>
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]|=(1<<(15-((c+x)&15)));
    198e:	69fa      	ldr	r2, [r7, #28]
    1990:	68bb      	ldr	r3, [r7, #8]
    1992:	441a      	add	r2, r3
    1994:	4613      	mov	r3, r2
    1996:	009b      	lsls	r3, r3, #2
    1998:	4413      	add	r3, r2
    199a:	009b      	lsls	r3, r3, #2
    199c:	4619      	mov	r1, r3
    199e:	69ba      	ldr	r2, [r7, #24]
    19a0:	68fb      	ldr	r3, [r7, #12]
    19a2:	4413      	add	r3, r2
    19a4:	111b      	asrs	r3, r3, #4
    19a6:	4419      	add	r1, r3
    19a8:	69fa      	ldr	r2, [r7, #28]
    19aa:	68bb      	ldr	r3, [r7, #8]
    19ac:	441a      	add	r2, r3
    19ae:	4613      	mov	r3, r2
    19b0:	009b      	lsls	r3, r3, #2
    19b2:	4413      	add	r3, r2
    19b4:	009b      	lsls	r3, r3, #2
    19b6:	4618      	mov	r0, r3
    19b8:	69ba      	ldr	r2, [r7, #24]
    19ba:	68fb      	ldr	r3, [r7, #12]
    19bc:	4413      	add	r3, r2
    19be:	111b      	asrs	r3, r3, #4
    19c0:	4403      	add	r3, r0
    19c2:	4a2f      	ldr	r2, [pc, #188]	; (1a80 <gdi_put_sprite+0x15c>)
    19c4:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    19c8:	b298      	uxth	r0, r3
    19ca:	69ba      	ldr	r2, [r7, #24]
    19cc:	68fb      	ldr	r3, [r7, #12]
    19ce:	4413      	add	r3, r2
    19d0:	43db      	mvns	r3, r3
    19d2:	f003 030f 	and.w	r3, r3, #15
    19d6:	2201      	movs	r2, #1
    19d8:	fa02 f303 	lsl.w	r3, r2, r3
    19dc:	b29b      	uxth	r3, r3
    19de:	4602      	mov	r2, r0
    19e0:	4313      	orrs	r3, r2
    19e2:	b29b      	uxth	r3, r3
    19e4:	b29a      	uxth	r2, r3
    19e6:	4b26      	ldr	r3, [pc, #152]	; (1a80 <gdi_put_sprite+0x15c>)
    19e8:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
    19ec:	e030      	b.n	1a50 <gdi_put_sprite+0x12c>
				}else{
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]&=~(1<<(15-((c+x)&15)));
    19ee:	69fa      	ldr	r2, [r7, #28]
    19f0:	68bb      	ldr	r3, [r7, #8]
    19f2:	441a      	add	r2, r3
    19f4:	4613      	mov	r3, r2
    19f6:	009b      	lsls	r3, r3, #2
    19f8:	4413      	add	r3, r2
    19fa:	009b      	lsls	r3, r3, #2
    19fc:	4619      	mov	r1, r3
    19fe:	69ba      	ldr	r2, [r7, #24]
    1a00:	68fb      	ldr	r3, [r7, #12]
    1a02:	4413      	add	r3, r2
    1a04:	111b      	asrs	r3, r3, #4
    1a06:	4419      	add	r1, r3
    1a08:	69fa      	ldr	r2, [r7, #28]
    1a0a:	68bb      	ldr	r3, [r7, #8]
    1a0c:	441a      	add	r2, r3
    1a0e:	4613      	mov	r3, r2
    1a10:	009b      	lsls	r3, r3, #2
    1a12:	4413      	add	r3, r2
    1a14:	009b      	lsls	r3, r3, #2
    1a16:	4618      	mov	r0, r3
    1a18:	69ba      	ldr	r2, [r7, #24]
    1a1a:	68fb      	ldr	r3, [r7, #12]
    1a1c:	4413      	add	r3, r2
    1a1e:	111b      	asrs	r3, r3, #4
    1a20:	4403      	add	r3, r0
    1a22:	4a17      	ldr	r2, [pc, #92]	; (1a80 <gdi_put_sprite+0x15c>)
    1a24:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1a28:	b298      	uxth	r0, r3
    1a2a:	69ba      	ldr	r2, [r7, #24]
    1a2c:	68fb      	ldr	r3, [r7, #12]
    1a2e:	4413      	add	r3, r2
    1a30:	43db      	mvns	r3, r3
    1a32:	f003 030f 	and.w	r3, r3, #15
    1a36:	2201      	movs	r2, #1
    1a38:	fa02 f303 	lsl.w	r3, r2, r3
    1a3c:	b29b      	uxth	r3, r3
    1a3e:	43db      	mvns	r3, r3
    1a40:	b29b      	uxth	r3, r3
    1a42:	4602      	mov	r2, r0
    1a44:	4013      	ands	r3, r2
    1a46:	b29b      	uxth	r3, r3
    1a48:	b29a      	uxth	r2, r3
    1a4a:	4b0d      	ldr	r3, [pc, #52]	; (1a80 <gdi_put_sprite+0x15c>)
    1a4c:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
				//bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
				//video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]|=bit;
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
    1a50:	7dfb      	ldrb	r3, [r7, #23]
    1a52:	085b      	lsrs	r3, r3, #1
    1a54:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    1a56:	69bb      	ldr	r3, [r7, #24]
    1a58:	3301      	adds	r3, #1
    1a5a:	61bb      	str	r3, [r7, #24]
    1a5c:	69ba      	ldr	r2, [r7, #24]
    1a5e:	687b      	ldr	r3, [r7, #4]
    1a60:	429a      	cmp	r2, r3
    1a62:	f6ff af6e 	blt.w	1942 <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1a66:	69fb      	ldr	r3, [r7, #28]
    1a68:	3301      	adds	r3, #1
    1a6a:	61fb      	str	r3, [r7, #28]
    1a6c:	69fa      	ldr	r2, [r7, #28]
    1a6e:	683b      	ldr	r3, [r7, #0]
    1a70:	429a      	cmp	r2, r3
    1a72:	f6ff af61 	blt.w	1938 <gdi_put_sprite+0x14>
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    1a76:	3724      	adds	r7, #36	; 0x24
    1a78:	46bd      	mov	sp, r7
    1a7a:	f85d 7b04 	ldr.w	r7, [sp], #4
    1a7e:	4770      	bx	lr
    1a80:	20000130 	.word	0x20000130

00001a84 <gdi_del_back>:

void gdi_del_back(){
    1a84:	b580      	push	{r7, lr}
    1a86:	b082      	sub	sp, #8
    1a88:	af02      	add	r7, sp, #8
	gdi_cursor_left();
    1a8a:	f7ff fe83 	bl	1794 <gdi_cursor_left>
	hide_cursor();
    1a8e:	f7ff fde1 	bl	1654 <hide_cursor>
	gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    1a92:	4b0a      	ldr	r3, [pc, #40]	; (1abc <gdi_del_back+0x38>)
    1a94:	6819      	ldr	r1, [r3, #0]
    1a96:	4b0a      	ldr	r3, [pc, #40]	; (1ac0 <gdi_del_back+0x3c>)
    1a98:	681a      	ldr	r2, [r3, #0]
    1a9a:	2300      	movs	r3, #0
    1a9c:	9300      	str	r3, [sp, #0]
    1a9e:	4608      	mov	r0, r1
    1aa0:	4611      	mov	r1, r2
    1aa2:	2206      	movs	r2, #6
    1aa4:	2308      	movs	r3, #8
    1aa6:	f7ff fefd 	bl	18a4 <gdi_box>
	if (cursor_blink){
    1aaa:	4b06      	ldr	r3, [pc, #24]	; (1ac4 <gdi_del_back+0x40>)
    1aac:	681b      	ldr	r3, [r3, #0]
    1aae:	2b00      	cmp	r3, #0
    1ab0:	d002      	beq.n	1ab8 <gdi_del_back+0x34>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1ab2:	201e      	movs	r0, #30
    1ab4:	f000 fc26 	bl	2304 <enable_interrupt>
	}
}
    1ab8:	46bd      	mov	sp, r7
    1aba:	bd80      	pop	{r7, pc}
    1abc:	200000ac 	.word	0x200000ac
    1ac0:	200000b0 	.word	0x200000b0
    1ac4:	200000b8 	.word	0x200000b8

00001ac8 <gdi_putc>:

// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void gdi_putc(char c){
    1ac8:	b580      	push	{r7, lr}
    1aca:	b084      	sub	sp, #16
    1acc:	af02      	add	r7, sp, #8
    1ace:	4603      	mov	r3, r0
    1ad0:	71fb      	strb	r3, [r7, #7]
		hide_cursor();
    1ad2:	f7ff fdbf 	bl	1654 <hide_cursor>
		switch (c){
    1ad6:	79fb      	ldrb	r3, [r7, #7]
    1ad8:	2b0a      	cmp	r3, #10
    1ada:	d004      	beq.n	1ae6 <gdi_putc+0x1e>
    1adc:	2b0d      	cmp	r3, #13
    1ade:	d002      	beq.n	1ae6 <gdi_putc+0x1e>
    1ae0:	2b08      	cmp	r3, #8
    1ae2:	d003      	beq.n	1aec <gdi_putc+0x24>
    1ae4:	e005      	b.n	1af2 <gdi_putc+0x2a>
		case '\n':
		case CR:
			gdi_new_line();
    1ae6:	f7ff fe31 	bl	174c <gdi_new_line>
			break;
    1aea:	e021      	b.n	1b30 <gdi_putc+0x68>
		case BS:
			gdi_del_back();
    1aec:	f7ff ffca 	bl	1a84 <gdi_del_back>
			break;
    1af0:	e01e      	b.n	1b30 <gdi_putc+0x68>
		default:
			if (c<FONT_SIZE){
    1af2:	79fb      	ldrb	r3, [r7, #7]
    1af4:	b25b      	sxtb	r3, r3
    1af6:	2b00      	cmp	r3, #0
    1af8:	db19      	blt.n	1b2e <gdi_putc+0x66>
				gdi_put_sprite(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,(const unsigned char *)&font6x8[c]);
    1afa:	4b12      	ldr	r3, [pc, #72]	; (1b44 <gdi_putc+0x7c>)
    1afc:	6818      	ldr	r0, [r3, #0]
    1afe:	4b12      	ldr	r3, [pc, #72]	; (1b48 <gdi_putc+0x80>)
    1b00:	6819      	ldr	r1, [r3, #0]
    1b02:	79fb      	ldrb	r3, [r7, #7]
    1b04:	00db      	lsls	r3, r3, #3
    1b06:	4a11      	ldr	r2, [pc, #68]	; (1b4c <gdi_putc+0x84>)
    1b08:	4413      	add	r3, r2
    1b0a:	9300      	str	r3, [sp, #0]
    1b0c:	2206      	movs	r2, #6
    1b0e:	2308      	movs	r3, #8
    1b10:	f7ff ff08 	bl	1924 <gdi_put_sprite>
				cursor_x+=CHAR_WIDTH;
    1b14:	4b0b      	ldr	r3, [pc, #44]	; (1b44 <gdi_putc+0x7c>)
    1b16:	681b      	ldr	r3, [r3, #0]
    1b18:	3306      	adds	r3, #6
    1b1a:	4a0a      	ldr	r2, [pc, #40]	; (1b44 <gdi_putc+0x7c>)
    1b1c:	6013      	str	r3, [r2, #0]
				if (cursor_x>(HRES-CHAR_WIDTH)){
    1b1e:	4b09      	ldr	r3, [pc, #36]	; (1b44 <gdi_putc+0x7c>)
    1b20:	681b      	ldr	r3, [r3, #0]
    1b22:	f5b3 7f9d 	cmp.w	r3, #314	; 0x13a
    1b26:	dd02      	ble.n	1b2e <gdi_putc+0x66>
					gdi_new_line();
    1b28:	f7ff fe10 	bl	174c <gdi_new_line>
				}
			}
			break;
    1b2c:	e7ff      	b.n	1b2e <gdi_putc+0x66>
    1b2e:	bf00      	nop
		}//switch
		if (cursor_blink){
    1b30:	4b07      	ldr	r3, [pc, #28]	; (1b50 <gdi_putc+0x88>)
    1b32:	681b      	ldr	r3, [r3, #0]
    1b34:	2b00      	cmp	r3, #0
    1b36:	d002      	beq.n	1b3e <gdi_putc+0x76>
			enable_interrupt(IRQ_CURSOR_BLINK);
    1b38:	201e      	movs	r0, #30
    1b3a:	f000 fbe3 	bl	2304 <enable_interrupt>
		}
}
    1b3e:	3708      	adds	r7, #8
    1b40:	46bd      	mov	sp, r7
    1b42:	bd80      	pop	{r7, pc}
    1b44:	200000ac 	.word	0x200000ac
    1b48:	200000b0 	.word	0x200000b0
    1b4c:	0000312c 	.word	0x0000312c
    1b50:	200000b8 	.word	0x200000b8

00001b54 <gdi_print>:

void gdi_print(const char *str){
    1b54:	b580      	push	{r7, lr}
    1b56:	b082      	sub	sp, #8
    1b58:	af00      	add	r7, sp, #0
    1b5a:	6078      	str	r0, [r7, #4]
	while (*str) gdi_putc(*str++);
    1b5c:	e006      	b.n	1b6c <gdi_print+0x18>
    1b5e:	687b      	ldr	r3, [r7, #4]
    1b60:	1c5a      	adds	r2, r3, #1
    1b62:	607a      	str	r2, [r7, #4]
    1b64:	781b      	ldrb	r3, [r3, #0]
    1b66:	4618      	mov	r0, r3
    1b68:	f7ff ffae 	bl	1ac8 <gdi_putc>
    1b6c:	687b      	ldr	r3, [r7, #4]
    1b6e:	781b      	ldrb	r3, [r3, #0]
    1b70:	2b00      	cmp	r3, #0
    1b72:	d1f4      	bne.n	1b5e <gdi_print+0xa>
}
    1b74:	3708      	adds	r7, #8
    1b76:	46bd      	mov	sp, r7
    1b78:	bd80      	pop	{r7, pc}
    1b7a:	bf00      	nop

00001b7c <gdi_clrln>:

void gdi_clrln(){
    1b7c:	b480      	push	{r7}
    1b7e:	b083      	sub	sp, #12
    1b80:	af00      	add	r7, sp, #0
	int i;
	cursor_x=0;
    1b82:	4b11      	ldr	r3, [pc, #68]	; (1bc8 <gdi_clrln+0x4c>)
    1b84:	2200      	movs	r2, #0
    1b86:	601a      	str	r2, [r3, #0]
	for (i=cursor_y*ROW_SIZE;i<cursor_y*ROW_SIZE*8;i++){
    1b88:	4b10      	ldr	r3, [pc, #64]	; (1bcc <gdi_clrln+0x50>)
    1b8a:	681a      	ldr	r2, [r3, #0]
    1b8c:	4613      	mov	r3, r2
    1b8e:	009b      	lsls	r3, r3, #2
    1b90:	4413      	add	r3, r2
    1b92:	009b      	lsls	r3, r3, #2
    1b94:	607b      	str	r3, [r7, #4]
    1b96:	e007      	b.n	1ba8 <gdi_clrln+0x2c>
		video_buffer[i]=0;
    1b98:	4a0d      	ldr	r2, [pc, #52]	; (1bd0 <gdi_clrln+0x54>)
    1b9a:	687b      	ldr	r3, [r7, #4]
    1b9c:	2100      	movs	r1, #0
    1b9e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
}

void gdi_clrln(){
	int i;
	cursor_x=0;
	for (i=cursor_y*ROW_SIZE;i<cursor_y*ROW_SIZE*8;i++){
    1ba2:	687b      	ldr	r3, [r7, #4]
    1ba4:	3301      	adds	r3, #1
    1ba6:	607b      	str	r3, [r7, #4]
    1ba8:	4b08      	ldr	r3, [pc, #32]	; (1bcc <gdi_clrln+0x50>)
    1baa:	681a      	ldr	r2, [r3, #0]
    1bac:	4613      	mov	r3, r2
    1bae:	009b      	lsls	r3, r3, #2
    1bb0:	4413      	add	r3, r2
    1bb2:	015b      	lsls	r3, r3, #5
    1bb4:	461a      	mov	r2, r3
    1bb6:	687b      	ldr	r3, [r7, #4]
    1bb8:	429a      	cmp	r2, r3
    1bba:	dced      	bgt.n	1b98 <gdi_clrln+0x1c>
		video_buffer[i]=0;
	}
}
    1bbc:	370c      	adds	r7, #12
    1bbe:	46bd      	mov	sp, r7
    1bc0:	f85d 7b04 	ldr.w	r7, [sp], #4
    1bc4:	4770      	bx	lr
    1bc6:	bf00      	nop
    1bc8:	200000ac 	.word	0x200000ac
    1bcc:	200000b0 	.word	0x200000b0
    1bd0:	20000130 	.word	0x20000130

00001bd4 <gdi_text_cursor>:

void gdi_text_cursor(int enable){
    1bd4:	b580      	push	{r7, lr}
    1bd6:	b084      	sub	sp, #16
    1bd8:	af02      	add	r7, sp, #8
    1bda:	6078      	str	r0, [r7, #4]
	if (enable){
    1bdc:	687b      	ldr	r3, [r7, #4]
    1bde:	2b00      	cmp	r3, #0
    1be0:	d024      	beq.n	1c2c <gdi_text_cursor+0x58>
		// activation clock CURSOR_TMR
		RCC->CURSOR_RCC_ENR|=CURSOR_RCC_EN_BIT; 
    1be2:	4a24      	ldr	r2, [pc, #144]	; (1c74 <gdi_text_cursor+0xa0>)
    1be4:	4b23      	ldr	r3, [pc, #140]	; (1c74 <gdi_text_cursor+0xa0>)
    1be6:	69db      	ldr	r3, [r3, #28]
    1be8:	f043 0304 	orr.w	r3, r3, #4
    1bec:	61d3      	str	r3, [r2, #28]
		CURSOR_TMR->ARR=FAPB1/1000/2;
    1bee:	4b22      	ldr	r3, [pc, #136]	; (1c78 <gdi_text_cursor+0xa4>)
    1bf0:	f243 72ee 	movw	r2, #14318	; 0x37ee
    1bf4:	62da      	str	r2, [r3, #44]	; 0x2c
		CURSOR_TMR->PSC=1000;
    1bf6:	4b20      	ldr	r3, [pc, #128]	; (1c78 <gdi_text_cursor+0xa4>)
    1bf8:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    1bfc:	629a      	str	r2, [r3, #40]	; 0x28
		CURSOR_TMR->CR1=BIT0|BIT7; // ARPE
    1bfe:	4b1e      	ldr	r3, [pc, #120]	; (1c78 <gdi_text_cursor+0xa4>)
    1c00:	2281      	movs	r2, #129	; 0x81
    1c02:	601a      	str	r2, [r3, #0]
		CURSOR_TMR->DIER=BIT0; // UIE
    1c04:	4b1c      	ldr	r3, [pc, #112]	; (1c78 <gdi_text_cursor+0xa4>)
    1c06:	2201      	movs	r2, #1
    1c08:	60da      	str	r2, [r3, #12]
		set_int_priority(IRQ_CURSOR_BLINK,15);
    1c0a:	201e      	movs	r0, #30
    1c0c:	210f      	movs	r1, #15
    1c0e:	f000 fc35 	bl	247c <set_int_priority>
		CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
    1c12:	4a19      	ldr	r2, [pc, #100]	; (1c78 <gdi_text_cursor+0xa4>)
    1c14:	4b18      	ldr	r3, [pc, #96]	; (1c78 <gdi_text_cursor+0xa4>)
    1c16:	691b      	ldr	r3, [r3, #16]
    1c18:	f023 0301 	bic.w	r3, r3, #1
    1c1c:	6113      	str	r3, [r2, #16]
		enable_interrupt(IRQ_CURSOR_BLINK);
    1c1e:	201e      	movs	r0, #30
    1c20:	f000 fb70 	bl	2304 <enable_interrupt>
		cursor_blink=1;
    1c24:	4b15      	ldr	r3, [pc, #84]	; (1c7c <gdi_text_cursor+0xa8>)
    1c26:	2201      	movs	r2, #1
    1c28:	601a      	str	r2, [r3, #0]
    1c2a:	e020      	b.n	1c6e <gdi_text_cursor+0x9a>
	}else{
		disable_interrupt(IRQ_CURSOR_BLINK);
    1c2c:	201e      	movs	r0, #30
    1c2e:	f000 fb8d 	bl	234c <disable_interrupt>
		if (cursor_visible){
    1c32:	4b13      	ldr	r3, [pc, #76]	; (1c80 <gdi_text_cursor+0xac>)
    1c34:	681b      	ldr	r3, [r3, #0]
    1c36:	2b00      	cmp	r3, #0
    1c38:	d010      	beq.n	1c5c <gdi_text_cursor+0x88>
			gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    1c3a:	4b12      	ldr	r3, [pc, #72]	; (1c84 <gdi_text_cursor+0xb0>)
    1c3c:	6819      	ldr	r1, [r3, #0]
    1c3e:	4b12      	ldr	r3, [pc, #72]	; (1c88 <gdi_text_cursor+0xb4>)
    1c40:	681a      	ldr	r2, [r3, #0]
    1c42:	2302      	movs	r3, #2
    1c44:	9300      	str	r3, [sp, #0]
    1c46:	4608      	mov	r0, r1
    1c48:	4611      	mov	r1, r2
    1c4a:	2206      	movs	r2, #6
    1c4c:	2308      	movs	r3, #8
    1c4e:	f7ff fe29 	bl	18a4 <gdi_box>
			cursor_visible=~cursor_visible;
    1c52:	4b0b      	ldr	r3, [pc, #44]	; (1c80 <gdi_text_cursor+0xac>)
    1c54:	681b      	ldr	r3, [r3, #0]
    1c56:	43db      	mvns	r3, r3
    1c58:	4a09      	ldr	r2, [pc, #36]	; (1c80 <gdi_text_cursor+0xac>)
    1c5a:	6013      	str	r3, [r2, #0]
		}
		CURSOR_TMR->DIER&=~BIT0;
    1c5c:	4a06      	ldr	r2, [pc, #24]	; (1c78 <gdi_text_cursor+0xa4>)
    1c5e:	4b06      	ldr	r3, [pc, #24]	; (1c78 <gdi_text_cursor+0xa4>)
    1c60:	68db      	ldr	r3, [r3, #12]
    1c62:	f023 0301 	bic.w	r3, r3, #1
    1c66:	60d3      	str	r3, [r2, #12]
		cursor_blink=0;
    1c68:	4b04      	ldr	r3, [pc, #16]	; (1c7c <gdi_text_cursor+0xa8>)
    1c6a:	2200      	movs	r2, #0
    1c6c:	601a      	str	r2, [r3, #0]
	}
}
    1c6e:	3708      	adds	r7, #8
    1c70:	46bd      	mov	sp, r7
    1c72:	bd80      	pop	{r7, pc}
    1c74:	40021000 	.word	0x40021000
    1c78:	40000800 	.word	0x40000800
    1c7c:	200000b8 	.word	0x200000b8
    1c80:	200000b4 	.word	0x200000b4
    1c84:	200000ac 	.word	0x200000ac
    1c88:	200000b0 	.word	0x200000b0

00001c8c <TIM4_handler>:

// interruption clignotement
// curseur texte
void CURSOR_blink_handler(){
    1c8c:	b580      	push	{r7, lr}
    1c8e:	b082      	sub	sp, #8
    1c90:	af02      	add	r7, sp, #8
	//CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
	if (CURSOR_TMR->SR&BIT0){ // UIF
    1c92:	4b0f      	ldr	r3, [pc, #60]	; (1cd0 <TIM4_handler+0x44>)
    1c94:	691b      	ldr	r3, [r3, #16]
    1c96:	f003 0301 	and.w	r3, r3, #1
    1c9a:	2b00      	cmp	r3, #0
    1c9c:	d016      	beq.n	1ccc <TIM4_handler+0x40>
		CURSOR_TMR->SR&=~BIT0;
    1c9e:	4a0c      	ldr	r2, [pc, #48]	; (1cd0 <TIM4_handler+0x44>)
    1ca0:	4b0b      	ldr	r3, [pc, #44]	; (1cd0 <TIM4_handler+0x44>)
    1ca2:	691b      	ldr	r3, [r3, #16]
    1ca4:	f023 0301 	bic.w	r3, r3, #1
    1ca8:	6113      	str	r3, [r2, #16]
		gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    1caa:	4b0a      	ldr	r3, [pc, #40]	; (1cd4 <TIM4_handler+0x48>)
    1cac:	6819      	ldr	r1, [r3, #0]
    1cae:	4b0a      	ldr	r3, [pc, #40]	; (1cd8 <TIM4_handler+0x4c>)
    1cb0:	681a      	ldr	r2, [r3, #0]
    1cb2:	2302      	movs	r3, #2
    1cb4:	9300      	str	r3, [sp, #0]
    1cb6:	4608      	mov	r0, r1
    1cb8:	4611      	mov	r1, r2
    1cba:	2206      	movs	r2, #6
    1cbc:	2308      	movs	r3, #8
    1cbe:	f7ff fdf1 	bl	18a4 <gdi_box>
		cursor_visible=~cursor_visible;
    1cc2:	4b06      	ldr	r3, [pc, #24]	; (1cdc <TIM4_handler+0x50>)
    1cc4:	681b      	ldr	r3, [r3, #0]
    1cc6:	43db      	mvns	r3, r3
    1cc8:	4a04      	ldr	r2, [pc, #16]	; (1cdc <TIM4_handler+0x50>)
    1cca:	6013      	str	r3, [r2, #0]
	}
}
    1ccc:	46bd      	mov	sp, r7
    1cce:	bd80      	pop	{r7, pc}
    1cd0:	40000800 	.word	0x40000800
    1cd4:	200000ac 	.word	0x200000ac
    1cd8:	200000b0 	.word	0x200000b0
    1cdc:	200000b4 	.word	0x200000b4

00001ce0 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(gpio_t* port, unsigned pin, unsigned config){
    1ce0:	b480      	push	{r7}
    1ce2:	b087      	sub	sp, #28
    1ce4:	af00      	add	r7, sp, #0
    1ce6:	60f8      	str	r0, [r7, #12]
    1ce8:	60b9      	str	r1, [r7, #8]
    1cea:	607a      	str	r2, [r7, #4]
	uint8_t shift;
	shift=(pin&7)<<2;
    1cec:	68bb      	ldr	r3, [r7, #8]
    1cee:	b2db      	uxtb	r3, r3
    1cf0:	f003 0307 	and.w	r3, r3, #7
    1cf4:	b2db      	uxtb	r3, r3
    1cf6:	009b      	lsls	r3, r3, #2
    1cf8:	75fb      	strb	r3, [r7, #23]
	port->CR[pin>>3]&=~(15<<shift);
    1cfa:	68bb      	ldr	r3, [r7, #8]
    1cfc:	08da      	lsrs	r2, r3, #3
    1cfe:	68bb      	ldr	r3, [r7, #8]
    1d00:	08d9      	lsrs	r1, r3, #3
    1d02:	68fb      	ldr	r3, [r7, #12]
    1d04:	f853 3021 	ldr.w	r3, [r3, r1, lsl #2]
    1d08:	7df9      	ldrb	r1, [r7, #23]
    1d0a:	200f      	movs	r0, #15
    1d0c:	fa00 f101 	lsl.w	r1, r0, r1
    1d10:	43c9      	mvns	r1, r1
    1d12:	4019      	ands	r1, r3
    1d14:	68fb      	ldr	r3, [r7, #12]
    1d16:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
	port->CR[pin>>3]|=config<<shift;
    1d1a:	68bb      	ldr	r3, [r7, #8]
    1d1c:	08da      	lsrs	r2, r3, #3
    1d1e:	68bb      	ldr	r3, [r7, #8]
    1d20:	08d9      	lsrs	r1, r3, #3
    1d22:	68fb      	ldr	r3, [r7, #12]
    1d24:	f853 1021 	ldr.w	r1, [r3, r1, lsl #2]
    1d28:	7dfb      	ldrb	r3, [r7, #23]
    1d2a:	6878      	ldr	r0, [r7, #4]
    1d2c:	fa00 f303 	lsl.w	r3, r0, r3
    1d30:	4319      	orrs	r1, r3
    1d32:	68fb      	ldr	r3, [r7, #12]
    1d34:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
}
    1d38:	371c      	adds	r7, #28
    1d3a:	46bd      	mov	sp, r7
    1d3c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1d40:	4770      	bx	lr
    1d42:	bf00      	nop

00001d44 <read_pin>:

int read_pin(gpio_t* port, unsigned pin){
    1d44:	b480      	push	{r7}
    1d46:	b083      	sub	sp, #12
    1d48:	af00      	add	r7, sp, #0
    1d4a:	6078      	str	r0, [r7, #4]
    1d4c:	6039      	str	r1, [r7, #0]
	return port->IDR&(1<<pin);
    1d4e:	687b      	ldr	r3, [r7, #4]
    1d50:	689b      	ldr	r3, [r3, #8]
    1d52:	683a      	ldr	r2, [r7, #0]
    1d54:	2101      	movs	r1, #1
    1d56:	fa01 f202 	lsl.w	r2, r1, r2
    1d5a:	4013      	ands	r3, r2
}
    1d5c:	4618      	mov	r0, r3
    1d5e:	370c      	adds	r7, #12
    1d60:	46bd      	mov	sp, r7
    1d62:	f85d 7b04 	ldr.w	r7, [sp], #4
    1d66:	4770      	bx	lr

00001d68 <write_pin>:

void write_pin(gpio_t* port, unsigned pin, int value){
    1d68:	b480      	push	{r7}
    1d6a:	b085      	sub	sp, #20
    1d6c:	af00      	add	r7, sp, #0
    1d6e:	60f8      	str	r0, [r7, #12]
    1d70:	60b9      	str	r1, [r7, #8]
    1d72:	607a      	str	r2, [r7, #4]
	value?(port->ODR|=(1<<pin)):(port->ODR&=~(1<<pin));
    1d74:	687b      	ldr	r3, [r7, #4]
    1d76:	2b00      	cmp	r3, #0
    1d78:	d009      	beq.n	1d8e <write_pin+0x26>
    1d7a:	68fb      	ldr	r3, [r7, #12]
    1d7c:	68db      	ldr	r3, [r3, #12]
    1d7e:	68ba      	ldr	r2, [r7, #8]
    1d80:	2101      	movs	r1, #1
    1d82:	fa01 f202 	lsl.w	r2, r1, r2
    1d86:	431a      	orrs	r2, r3
    1d88:	68fb      	ldr	r3, [r7, #12]
    1d8a:	60da      	str	r2, [r3, #12]
    1d8c:	e009      	b.n	1da2 <write_pin+0x3a>
    1d8e:	68fb      	ldr	r3, [r7, #12]
    1d90:	68db      	ldr	r3, [r3, #12]
    1d92:	68ba      	ldr	r2, [r7, #8]
    1d94:	2101      	movs	r1, #1
    1d96:	fa01 f202 	lsl.w	r2, r1, r2
    1d9a:	43d2      	mvns	r2, r2
    1d9c:	401a      	ands	r2, r3
    1d9e:	68fb      	ldr	r3, [r7, #12]
    1da0:	60da      	str	r2, [r3, #12]
}
    1da2:	3714      	adds	r7, #20
    1da4:	46bd      	mov	sp, r7
    1da6:	f85d 7b04 	ldr.w	r7, [sp], #4
    1daa:	4770      	bx	lr

00001dac <toggle_pin>:

void toggle_pin(gpio_t* port, unsigned pin){
    1dac:	b480      	push	{r7}
    1dae:	b083      	sub	sp, #12
    1db0:	af00      	add	r7, sp, #0
    1db2:	6078      	str	r0, [r7, #4]
    1db4:	6039      	str	r1, [r7, #0]
	port->ODR^=(1<<pin);
    1db6:	687b      	ldr	r3, [r7, #4]
    1db8:	68db      	ldr	r3, [r3, #12]
    1dba:	683a      	ldr	r2, [r7, #0]
    1dbc:	2101      	movs	r1, #1
    1dbe:	fa01 f202 	lsl.w	r2, r1, r2
    1dc2:	405a      	eors	r2, r3
    1dc4:	687b      	ldr	r3, [r7, #4]
    1dc6:	60da      	str	r2, [r3, #12]
}
    1dc8:	370c      	adds	r7, #12
    1dca:	46bd      	mov	sp, r7
    1dcc:	f85d 7b04 	ldr.w	r7, [sp], #4
    1dd0:	4770      	bx	lr
    1dd2:	bf00      	nop

00001dd4 <keyboard_init>:
    ps2_flags = 0;
    return KbdSend(KBD_RESET);
}//KbdReset()
*/
 
void keyboard_init(){
    1dd4:	b580      	push	{r7, lr}
    1dd6:	af00      	add	r7, sp, #0
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
    1dd8:	4a1f      	ldr	r2, [pc, #124]	; (1e58 <keyboard_init+0x84>)
    1dda:	4b1f      	ldr	r3, [pc, #124]	; (1e58 <keyboard_init+0x84>)
    1ddc:	699b      	ldr	r3, [r3, #24]
    1dde:	f043 0305 	orr.w	r3, r3, #5
    1de2:	6193      	str	r3, [r2, #24]
	// activation clock TMR2
	RCC->APB1ENR|=RCC_APB1ENR_TIM2EN; 
    1de4:	4a1c      	ldr	r2, [pc, #112]	; (1e58 <keyboard_init+0x84>)
    1de6:	4b1c      	ldr	r3, [pc, #112]	; (1e58 <keyboard_init+0x84>)
    1de8:	69db      	ldr	r3, [r3, #28]
    1dea:	f043 0301 	orr.w	r3, r3, #1
    1dee:	61d3      	str	r3, [r2, #28]
	TMR2->ARR=FAPB1/20*.01;
    1df0:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1df4:	f243 72ee 	movw	r2, #14318	; 0x37ee
    1df8:	62da      	str	r2, [r3, #44]	; 0x2c
	TMR2->PSC=20;
    1dfa:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1dfe:	2214      	movs	r2, #20
    1e00:	629a      	str	r2, [r3, #40]	; 0x28
	TMR2->CR1=BIT0|BIT7; // ARPE
    1e02:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e06:	2281      	movs	r2, #129	; 0x81
    1e08:	601a      	str	r2, [r3, #0]
	TMR2->DIER=BIT0; // UIE
    1e0a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e0e:	2201      	movs	r2, #1
    1e10:	60da      	str	r2, [r3, #12]
	set_int_priority(IRQ_KBD_CLK,0);
    1e12:	2017      	movs	r0, #23
    1e14:	2100      	movs	r1, #0
    1e16:	f000 fb31 	bl	247c <set_int_priority>
	set_int_priority(IRQ_TIM2,14);
    1e1a:	201c      	movs	r0, #28
    1e1c:	210e      	movs	r1, #14
    1e1e:	f000 fb2d 	bl	247c <set_int_priority>
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
    1e22:	4a0e      	ldr	r2, [pc, #56]	; (1e5c <keyboard_init+0x88>)
    1e24:	4b0d      	ldr	r3, [pc, #52]	; (1e5c <keyboard_init+0x88>)
    1e26:	68db      	ldr	r3, [r3, #12]
    1e28:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1e2c:	60d3      	str	r3, [r2, #12]
	EXTI->IMR|=KBD_CLK_PIN;
    1e2e:	4a0b      	ldr	r2, [pc, #44]	; (1e5c <keyboard_init+0x88>)
    1e30:	4b0a      	ldr	r3, [pc, #40]	; (1e5c <keyboard_init+0x88>)
    1e32:	681b      	ldr	r3, [r3, #0]
    1e34:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1e38:	6013      	str	r3, [r2, #0]
	enable_interrupt(IRQ_KBD_CLK);
    1e3a:	2017      	movs	r0, #23
    1e3c:	f000 fa62 	bl	2304 <enable_interrupt>
	TMR2->SR&=~BIT0;
    1e40:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    1e44:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e48:	691b      	ldr	r3, [r3, #16]
    1e4a:	f023 0301 	bic.w	r3, r3, #1
    1e4e:	6113      	str	r3, [r2, #16]
	enable_interrupt(IRQ_TIM2);
    1e50:	201c      	movs	r0, #28
    1e52:	f000 fa57 	bl	2304 <enable_interrupt>
	//pause(700);
	//if (!KbdReset()) print("keyboard reset failed\n");
}
    1e56:	bd80      	pop	{r7, pc}
    1e58:	40021000 	.word	0x40021000
    1e5c:	40010400 	.word	0x40010400

00001e60 <search_table>:
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
    1e60:	b480      	push	{r7}
    1e62:	b083      	sub	sp, #12
    1e64:	af00      	add	r7, sp, #0
    1e66:	6078      	str	r0, [r7, #4]
    1e68:	460b      	mov	r3, r1
    1e6a:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    1e6c:	e008      	b.n	1e80 <search_table+0x20>
		if (table->code==code) break;
    1e6e:	687b      	ldr	r3, [r7, #4]
    1e70:	781b      	ldrb	r3, [r3, #0]
    1e72:	78fa      	ldrb	r2, [r7, #3]
    1e74:	429a      	cmp	r2, r3
    1e76:	d100      	bne.n	1e7a <search_table+0x1a>
    1e78:	e006      	b.n	1e88 <search_table+0x28>
		table++;
    1e7a:	687b      	ldr	r3, [r7, #4]
    1e7c:	3302      	adds	r3, #2
    1e7e:	607b      	str	r3, [r7, #4]

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
    1e80:	687b      	ldr	r3, [r7, #4]
    1e82:	781b      	ldrb	r3, [r3, #0]
    1e84:	2b00      	cmp	r3, #0
    1e86:	d1f2      	bne.n	1e6e <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    1e88:	687b      	ldr	r3, [r7, #4]
    1e8a:	785b      	ldrb	r3, [r3, #1]
}
    1e8c:	4618      	mov	r0, r3
    1e8e:	370c      	adds	r7, #12
    1e90:	46bd      	mov	sp, r7
    1e92:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e96:	4770      	bx	lr

00001e98 <convert_code>:

static void convert_code(unsigned char code){
    1e98:	b580      	push	{r7, lr}
    1e9a:	b086      	sub	sp, #24
    1e9c:	af00      	add	r7, sp, #0
    1e9e:	4603      	mov	r3, r0
    1ea0:	71fb      	strb	r3, [r7, #7]
		unsigned char c,s;
		int shift;
		if (!(con.dev==LOCAL)) return;
    1ea2:	4ba1      	ldr	r3, [pc, #644]	; (2128 <convert_code+0x290>)
    1ea4:	781b      	ldrb	r3, [r3, #0]
    1ea6:	2b00      	cmp	r3, #0
    1ea8:	d000      	beq.n	1eac <convert_code+0x14>
    1eaa:	e139      	b.n	2120 <convert_code+0x288>
		switch (code){
    1eac:	79fb      	ldrb	r3, [r7, #7]
    1eae:	2b59      	cmp	r3, #89	; 0x59
    1eb0:	f000 8085 	beq.w	1fbe <convert_code+0x126>
    1eb4:	2b59      	cmp	r3, #89	; 0x59
    1eb6:	dc0e      	bgt.n	1ed6 <convert_code+0x3e>
    1eb8:	2b12      	cmp	r3, #18
    1eba:	d038      	beq.n	1f2e <convert_code+0x96>
    1ebc:	2b12      	cmp	r3, #18
    1ebe:	dc03      	bgt.n	1ec8 <convert_code+0x30>
    1ec0:	2b11      	cmp	r3, #17
    1ec2:	f000 80a4 	beq.w	200e <convert_code+0x176>
    1ec6:	e0ca      	b.n	205e <convert_code+0x1c6>
    1ec8:	2b14      	cmp	r3, #20
    1eca:	f000 808c 	beq.w	1fe6 <convert_code+0x14e>
    1ece:	2b58      	cmp	r3, #88	; 0x58
    1ed0:	f000 80b1 	beq.w	2036 <convert_code+0x19e>
    1ed4:	e0c3      	b.n	205e <convert_code+0x1c6>
    1ed6:	2be0      	cmp	r3, #224	; 0xe0
    1ed8:	d010      	beq.n	1efc <convert_code+0x64>
    1eda:	2be0      	cmp	r3, #224	; 0xe0
    1edc:	dc02      	bgt.n	1ee4 <convert_code+0x4c>
    1ede:	2b7c      	cmp	r3, #124	; 0x7c
    1ee0:	d047      	beq.n	1f72 <convert_code+0xda>
    1ee2:	e0bc      	b.n	205e <convert_code+0x1c6>
    1ee4:	2be1      	cmp	r3, #225	; 0xe1
    1ee6:	d010      	beq.n	1f0a <convert_code+0x72>
    1ee8:	2bf0      	cmp	r3, #240	; 0xf0
    1eea:	f040 80b8 	bne.w	205e <convert_code+0x1c6>
		case 0xF0:
			flags |= RELEASE;
    1eee:	4b8f      	ldr	r3, [pc, #572]	; (212c <convert_code+0x294>)
    1ef0:	681b      	ldr	r3, [r3, #0]
    1ef2:	f043 0302 	orr.w	r3, r3, #2
    1ef6:	4a8d      	ldr	r2, [pc, #564]	; (212c <convert_code+0x294>)
    1ef8:	6013      	str	r3, [r2, #0]
			break;
    1efa:	e111      	b.n	2120 <convert_code+0x288>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    1efc:	4b8b      	ldr	r3, [pc, #556]	; (212c <convert_code+0x294>)
    1efe:	681b      	ldr	r3, [r3, #0]
    1f00:	f043 0301 	orr.w	r3, r3, #1
    1f04:	4a89      	ldr	r2, [pc, #548]	; (212c <convert_code+0x294>)
    1f06:	6013      	str	r3, [r2, #0]
			break;
    1f08:	e10a      	b.n	2120 <convert_code+0x288>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    1f0a:	4b88      	ldr	r3, [pc, #544]	; (212c <convert_code+0x294>)
    1f0c:	681b      	ldr	r3, [r3, #0]
    1f0e:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    1f12:	4a86      	ldr	r2, [pc, #536]	; (212c <convert_code+0x294>)
    1f14:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    1f16:	4b85      	ldr	r3, [pc, #532]	; (212c <convert_code+0x294>)
    1f18:	681b      	ldr	r3, [r3, #0]
    1f1a:	f403 7380 	and.w	r3, r3, #256	; 0x100
    1f1e:	2b00      	cmp	r3, #0
    1f20:	d104      	bne.n	1f2c <convert_code+0x94>
				con.insert(PAUSE);
    1f22:	4b81      	ldr	r3, [pc, #516]	; (2128 <convert_code+0x290>)
    1f24:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    1f26:	2094      	movs	r0, #148	; 0x94
    1f28:	4798      	blx	r3
			}
			break;
    1f2a:	e0f9      	b.n	2120 <convert_code+0x288>
    1f2c:	e0f8      	b.n	2120 <convert_code+0x288>
		case LSHIFT:
			if (flags&RELEASE){
    1f2e:	4b7f      	ldr	r3, [pc, #508]	; (212c <convert_code+0x294>)
    1f30:	681b      	ldr	r3, [r3, #0]
    1f32:	f003 0302 	and.w	r3, r3, #2
    1f36:	2b00      	cmp	r3, #0
    1f38:	d006      	beq.n	1f48 <convert_code+0xb0>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    1f3a:	4b7c      	ldr	r3, [pc, #496]	; (212c <convert_code+0x294>)
    1f3c:	681b      	ldr	r3, [r3, #0]
    1f3e:	f023 0307 	bic.w	r3, r3, #7
    1f42:	4a7a      	ldr	r2, [pc, #488]	; (212c <convert_code+0x294>)
    1f44:	6013      	str	r3, [r2, #0]
    1f46:	e013      	b.n	1f70 <convert_code+0xd8>
			}else{
				if (flags&XTD_CODE){
    1f48:	4b78      	ldr	r3, [pc, #480]	; (212c <convert_code+0x294>)
    1f4a:	681b      	ldr	r3, [r3, #0]
    1f4c:	f003 0301 	and.w	r3, r3, #1
    1f50:	2b00      	cmp	r3, #0
    1f52:	d006      	beq.n	1f62 <convert_code+0xca>
					flags|=PRNSCR;
    1f54:	4b75      	ldr	r3, [pc, #468]	; (212c <convert_code+0x294>)
    1f56:	681b      	ldr	r3, [r3, #0]
    1f58:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1f5c:	4a73      	ldr	r2, [pc, #460]	; (212c <convert_code+0x294>)
    1f5e:	6013      	str	r3, [r2, #0]
    1f60:	e006      	b.n	1f70 <convert_code+0xd8>
				}else{
					flags|=LEFT_SHIFT;
    1f62:	4b72      	ldr	r3, [pc, #456]	; (212c <convert_code+0x294>)
    1f64:	681b      	ldr	r3, [r3, #0]
    1f66:	f043 0304 	orr.w	r3, r3, #4
    1f6a:	4a70      	ldr	r2, [pc, #448]	; (212c <convert_code+0x294>)
    1f6c:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1f6e:	e0d7      	b.n	2120 <convert_code+0x288>
    1f70:	e0d6      	b.n	2120 <convert_code+0x288>
		case KPMUL:
			if (flags&RELEASE){
    1f72:	4b6e      	ldr	r3, [pc, #440]	; (212c <convert_code+0x294>)
    1f74:	681b      	ldr	r3, [r3, #0]
    1f76:	f003 0302 	and.w	r3, r3, #2
    1f7a:	2b00      	cmp	r3, #0
    1f7c:	d006      	beq.n	1f8c <convert_code+0xf4>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    1f7e:	4b6b      	ldr	r3, [pc, #428]	; (212c <convert_code+0x294>)
    1f80:	681b      	ldr	r3, [r3, #0]
    1f82:	f023 0303 	bic.w	r3, r3, #3
    1f86:	4a69      	ldr	r2, [pc, #420]	; (212c <convert_code+0x294>)
    1f88:	6013      	str	r3, [r2, #0]
    1f8a:	e017      	b.n	1fbc <convert_code+0x124>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    1f8c:	4b67      	ldr	r3, [pc, #412]	; (212c <convert_code+0x294>)
    1f8e:	681b      	ldr	r3, [r3, #0]
    1f90:	f003 0301 	and.w	r3, r3, #1
    1f94:	2b00      	cmp	r3, #0
    1f96:	d00c      	beq.n	1fb2 <convert_code+0x11a>
					flags&=~(XTD_CODE|PRNSCR);
    1f98:	4b64      	ldr	r3, [pc, #400]	; (212c <convert_code+0x294>)
    1f9a:	681b      	ldr	r3, [r3, #0]
    1f9c:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    1fa0:	f023 0301 	bic.w	r3, r3, #1
    1fa4:	4a61      	ldr	r2, [pc, #388]	; (212c <convert_code+0x294>)
    1fa6:	6013      	str	r3, [r2, #0]
					con.insert(PRN);
    1fa8:	4b5f      	ldr	r3, [pc, #380]	; (2128 <convert_code+0x290>)
    1faa:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    1fac:	2092      	movs	r0, #146	; 0x92
    1fae:	4798      	blx	r3
    1fb0:	e004      	b.n	1fbc <convert_code+0x124>
				}else{
					con.insert('*');
    1fb2:	4b5d      	ldr	r3, [pc, #372]	; (2128 <convert_code+0x290>)
    1fb4:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    1fb6:	202a      	movs	r0, #42	; 0x2a
    1fb8:	4798      	blx	r3
				}
			}
			break;
    1fba:	e0b1      	b.n	2120 <convert_code+0x288>
    1fbc:	e0b0      	b.n	2120 <convert_code+0x288>
		case RSHIFT:
			if (flags&RELEASE){
    1fbe:	4b5b      	ldr	r3, [pc, #364]	; (212c <convert_code+0x294>)
    1fc0:	681b      	ldr	r3, [r3, #0]
    1fc2:	f003 0302 	and.w	r3, r3, #2
    1fc6:	2b00      	cmp	r3, #0
    1fc8:	d006      	beq.n	1fd8 <convert_code+0x140>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    1fca:	4b58      	ldr	r3, [pc, #352]	; (212c <convert_code+0x294>)
    1fcc:	681b      	ldr	r3, [r3, #0]
    1fce:	f023 030b 	bic.w	r3, r3, #11
    1fd2:	4a56      	ldr	r2, [pc, #344]	; (212c <convert_code+0x294>)
    1fd4:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    1fd6:	e0a3      	b.n	2120 <convert_code+0x288>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    1fd8:	4b54      	ldr	r3, [pc, #336]	; (212c <convert_code+0x294>)
    1fda:	681b      	ldr	r3, [r3, #0]
    1fdc:	f043 0308 	orr.w	r3, r3, #8
    1fe0:	4a52      	ldr	r2, [pc, #328]	; (212c <convert_code+0x294>)
    1fe2:	6013      	str	r3, [r2, #0]
			}
			break;
    1fe4:	e09c      	b.n	2120 <convert_code+0x288>
		case LCTRL:
			if (flags&RELEASE){
    1fe6:	4b51      	ldr	r3, [pc, #324]	; (212c <convert_code+0x294>)
    1fe8:	681b      	ldr	r3, [r3, #0]
    1fea:	f003 0302 	and.w	r3, r3, #2
    1fee:	2b00      	cmp	r3, #0
    1ff0:	d006      	beq.n	2000 <convert_code+0x168>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    1ff2:	4b4e      	ldr	r3, [pc, #312]	; (212c <convert_code+0x294>)
    1ff4:	681b      	ldr	r3, [r3, #0]
    1ff6:	f023 0313 	bic.w	r3, r3, #19
    1ffa:	4a4c      	ldr	r2, [pc, #304]	; (212c <convert_code+0x294>)
    1ffc:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_CTRL;
			}
			break;
    1ffe:	e08f      	b.n	2120 <convert_code+0x288>
			break;
		case LCTRL:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
			}else{
				flags|=LEFT_CTRL;
    2000:	4b4a      	ldr	r3, [pc, #296]	; (212c <convert_code+0x294>)
    2002:	681b      	ldr	r3, [r3, #0]
    2004:	f043 0310 	orr.w	r3, r3, #16
    2008:	4a48      	ldr	r2, [pc, #288]	; (212c <convert_code+0x294>)
    200a:	6013      	str	r3, [r2, #0]
			}
			break;
    200c:	e088      	b.n	2120 <convert_code+0x288>
		case LALT:
			if (flags&RELEASE){
    200e:	4b47      	ldr	r3, [pc, #284]	; (212c <convert_code+0x294>)
    2010:	681b      	ldr	r3, [r3, #0]
    2012:	f003 0302 	and.w	r3, r3, #2
    2016:	2b00      	cmp	r3, #0
    2018:	d006      	beq.n	2028 <convert_code+0x190>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    201a:	4b44      	ldr	r3, [pc, #272]	; (212c <convert_code+0x294>)
    201c:	681b      	ldr	r3, [r3, #0]
    201e:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    2022:	4a42      	ldr	r2, [pc, #264]	; (212c <convert_code+0x294>)
    2024:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    2026:	e07b      	b.n	2120 <convert_code+0x288>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    2028:	4b40      	ldr	r3, [pc, #256]	; (212c <convert_code+0x294>)
    202a:	681b      	ldr	r3, [r3, #0]
    202c:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    2030:	4a3e      	ldr	r2, [pc, #248]	; (212c <convert_code+0x294>)
    2032:	6013      	str	r3, [r2, #0]
			}
			break;
    2034:	e074      	b.n	2120 <convert_code+0x288>
		case CAPS_LOCK:
			if (flags&RELEASE){
    2036:	4b3d      	ldr	r3, [pc, #244]	; (212c <convert_code+0x294>)
    2038:	681b      	ldr	r3, [r3, #0]
    203a:	f003 0302 	and.w	r3, r3, #2
    203e:	2b00      	cmp	r3, #0
    2040:	d006      	beq.n	2050 <convert_code+0x1b8>
				flags&=~(RELEASE|XTD_CODE);
    2042:	4b3a      	ldr	r3, [pc, #232]	; (212c <convert_code+0x294>)
    2044:	681b      	ldr	r3, [r3, #0]
    2046:	f023 0303 	bic.w	r3, r3, #3
    204a:	4a38      	ldr	r2, [pc, #224]	; (212c <convert_code+0x294>)
    204c:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    204e:	e067      	b.n	2120 <convert_code+0x288>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    2050:	4b36      	ldr	r3, [pc, #216]	; (212c <convert_code+0x294>)
    2052:	681b      	ldr	r3, [r3, #0]
    2054:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    2058:	4a34      	ldr	r2, [pc, #208]	; (212c <convert_code+0x294>)
    205a:	6013      	str	r3, [r2, #0]
			}
			break;
    205c:	e060      	b.n	2120 <convert_code+0x288>
		default:
			if (!(flags&RELEASE)){
    205e:	4b33      	ldr	r3, [pc, #204]	; (212c <convert_code+0x294>)
    2060:	681b      	ldr	r3, [r3, #0]
    2062:	f003 0302 	and.w	r3, r3, #2
    2066:	2b00      	cmp	r3, #0
    2068:	d153      	bne.n	2112 <convert_code+0x27a>
					if (flags&XTD_CODE){
    206a:	4b30      	ldr	r3, [pc, #192]	; (212c <convert_code+0x294>)
    206c:	681b      	ldr	r3, [r3, #0]
    206e:	f003 0301 	and.w	r3, r3, #1
    2072:	2b00      	cmp	r3, #0
    2074:	d00d      	beq.n	2092 <convert_code+0x1fa>
						c=search_table(mcsaite_xkey,code);
    2076:	79fb      	ldrb	r3, [r7, #7]
    2078:	482d      	ldr	r0, [pc, #180]	; (2130 <convert_code+0x298>)
    207a:	4619      	mov	r1, r3
    207c:	f7ff fef0 	bl	1e60 <search_table>
    2080:	4603      	mov	r3, r0
    2082:	75fb      	strb	r3, [r7, #23]
						flags&=~XTD_CODE;
    2084:	4b29      	ldr	r3, [pc, #164]	; (212c <convert_code+0x294>)
    2086:	681b      	ldr	r3, [r3, #0]
    2088:	f023 0301 	bic.w	r3, r3, #1
    208c:	4a27      	ldr	r2, [pc, #156]	; (212c <convert_code+0x294>)
    208e:	6013      	str	r3, [r2, #0]
    2090:	e006      	b.n	20a0 <convert_code+0x208>
					}else{
						c=search_table(mcsaite_key,code);
    2092:	79fb      	ldrb	r3, [r7, #7]
    2094:	4827      	ldr	r0, [pc, #156]	; (2134 <convert_code+0x29c>)
    2096:	4619      	mov	r1, r3
    2098:	f7ff fee2 	bl	1e60 <search_table>
    209c:	4603      	mov	r3, r0
    209e:	75fb      	strb	r3, [r7, #23]
					}
					shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    20a0:	4b22      	ldr	r3, [pc, #136]	; (212c <convert_code+0x294>)
    20a2:	681b      	ldr	r3, [r3, #0]
    20a4:	f003 030c 	and.w	r3, r3, #12
    20a8:	613b      	str	r3, [r7, #16]
					if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    20aa:	7dfb      	ldrb	r3, [r7, #23]
    20ac:	2b60      	cmp	r3, #96	; 0x60
    20ae:	d918      	bls.n	20e2 <convert_code+0x24a>
    20b0:	7dfb      	ldrb	r3, [r7, #23]
    20b2:	2b7a      	cmp	r3, #122	; 0x7a
    20b4:	d815      	bhi.n	20e2 <convert_code+0x24a>
    20b6:	693b      	ldr	r3, [r7, #16]
    20b8:	2b00      	cmp	r3, #0
    20ba:	d005      	beq.n	20c8 <convert_code+0x230>
    20bc:	4b1b      	ldr	r3, [pc, #108]	; (212c <convert_code+0x294>)
    20be:	681b      	ldr	r3, [r3, #0]
    20c0:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    20c4:	2b00      	cmp	r3, #0
    20c6:	d008      	beq.n	20da <convert_code+0x242>
    20c8:	693b      	ldr	r3, [r7, #16]
    20ca:	2b00      	cmp	r3, #0
    20cc:	d109      	bne.n	20e2 <convert_code+0x24a>
    20ce:	4b17      	ldr	r3, [pc, #92]	; (212c <convert_code+0x294>)
    20d0:	681b      	ldr	r3, [r3, #0]
    20d2:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    20d6:	2b00      	cmp	r3, #0
    20d8:	d003      	beq.n	20e2 <convert_code+0x24a>
						c-=32;
    20da:	7dfb      	ldrb	r3, [r7, #23]
    20dc:	3b20      	subs	r3, #32
    20de:	75fb      	strb	r3, [r7, #23]
    20e0:	e00e      	b.n	2100 <convert_code+0x268>
					}else if (shift && (s=search_table(mcsaite_shey,c))){
    20e2:	693b      	ldr	r3, [r7, #16]
    20e4:	2b00      	cmp	r3, #0
    20e6:	d00b      	beq.n	2100 <convert_code+0x268>
    20e8:	7dfb      	ldrb	r3, [r7, #23]
    20ea:	4813      	ldr	r0, [pc, #76]	; (2138 <convert_code+0x2a0>)
    20ec:	4619      	mov	r1, r3
    20ee:	f7ff feb7 	bl	1e60 <search_table>
    20f2:	4603      	mov	r3, r0
    20f4:	73fb      	strb	r3, [r7, #15]
    20f6:	7bfb      	ldrb	r3, [r7, #15]
    20f8:	2b00      	cmp	r3, #0
    20fa:	d001      	beq.n	2100 <convert_code+0x268>
						c=s;
    20fc:	7bfb      	ldrb	r3, [r7, #15]
    20fe:	75fb      	strb	r3, [r7, #23]
					}
					if (c){
    2100:	7dfb      	ldrb	r3, [r7, #23]
    2102:	2b00      	cmp	r3, #0
    2104:	d00b      	beq.n	211e <convert_code+0x286>
						con.insert(c);
    2106:	4b08      	ldr	r3, [pc, #32]	; (2128 <convert_code+0x290>)
    2108:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    210a:	7dfa      	ldrb	r2, [r7, #23]
    210c:	4610      	mov	r0, r2
    210e:	4798      	blx	r3
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    2110:	e006      	b.n	2120 <convert_code+0x288>
					}
					if (c){
						con.insert(c);
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    2112:	4b06      	ldr	r3, [pc, #24]	; (212c <convert_code+0x294>)
    2114:	681b      	ldr	r3, [r3, #0]
    2116:	f023 0303 	bic.w	r3, r3, #3
    211a:	4a04      	ldr	r2, [pc, #16]	; (212c <convert_code+0x294>)
    211c:	6013      	str	r3, [r2, #0]
			}
			break;
    211e:	bf00      	nop
		}//switch
}// convert_code()
    2120:	3718      	adds	r7, #24
    2122:	46bd      	mov	sp, r7
    2124:	bd80      	pop	{r7, pc}
    2126:	bf00      	nop
    2128:	200000f0 	.word	0x200000f0
    212c:	200000c0 	.word	0x200000c0
    2130:	000035e4 	.word	0x000035e4
    2134:	0000352c 	.word	0x0000352c
    2138:	000035b8 	.word	0x000035b8

0000213c <EXTI9_5_handler>:
#define PS2_QUEUE_SIZE (16)
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];

// signal clock du clavier PS/2
__attribute__((optimize("-O0"))) void KBD_CLK_handler(){
    213c:	b480      	push	{r7}
    213e:	b083      	sub	sp, #12
    2140:	af00      	add	r7, sp, #0
	volatile  static unsigned char  in_byte=0,bit_cnt=0;
    volatile unsigned char parity; 

#define data_bit  (KBD_PORT->IDR & KBD_DAT_PIN)
	EXTI->PR|=KBD_CLK_PIN; 
    2142:	4a51      	ldr	r2, [pc, #324]	; (2288 <EXTI9_5_handler+0x14c>)
    2144:	4b50      	ldr	r3, [pc, #320]	; (2288 <EXTI9_5_handler+0x14c>)
    2146:	695b      	ldr	r3, [r3, #20]
    2148:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    214c:	6153      	str	r3, [r2, #20]
    switch (bit_cnt){
    214e:	4b4f      	ldr	r3, [pc, #316]	; (228c <EXTI9_5_handler+0x150>)
    2150:	781b      	ldrb	r3, [r3, #0]
    2152:	b2db      	uxtb	r3, r3
    2154:	2b09      	cmp	r3, #9
    2156:	d01f      	beq.n	2198 <EXTI9_5_handler+0x5c>
    2158:	2b0a      	cmp	r3, #10
    215a:	d031      	beq.n	21c0 <EXTI9_5_handler+0x84>
    215c:	2b00      	cmp	r3, #0
    215e:	d16c      	bne.n	223a <EXTI9_5_handler+0xfe>
	case 0:   // start bit
		ps2_flags&=~(F_ERROR|F_RCVD);
    2160:	4b4b      	ldr	r3, [pc, #300]	; (2290 <EXTI9_5_handler+0x154>)
    2162:	781b      	ldrb	r3, [r3, #0]
    2164:	b2db      	uxtb	r3, r3
    2166:	f023 030b 	bic.w	r3, r3, #11
    216a:	b2da      	uxtb	r2, r3
    216c:	4b48      	ldr	r3, [pc, #288]	; (2290 <EXTI9_5_handler+0x154>)
    216e:	701a      	strb	r2, [r3, #0]
		if (!data_bit){
    2170:	4b48      	ldr	r3, [pc, #288]	; (2294 <EXTI9_5_handler+0x158>)
    2172:	689b      	ldr	r3, [r3, #8]
    2174:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2178:	2b00      	cmp	r3, #0
    217a:	d10c      	bne.n	2196 <EXTI9_5_handler+0x5a>
			in_byte=0;
    217c:	4b46      	ldr	r3, [pc, #280]	; (2298 <EXTI9_5_handler+0x15c>)
    217e:	2200      	movs	r2, #0
    2180:	701a      	strb	r2, [r3, #0]
            parity=0;
    2182:	2300      	movs	r3, #0
    2184:	71fb      	strb	r3, [r7, #7]
            bit_cnt++;
    2186:	4b41      	ldr	r3, [pc, #260]	; (228c <EXTI9_5_handler+0x150>)
    2188:	781b      	ldrb	r3, [r3, #0]
    218a:	b2db      	uxtb	r3, r3
    218c:	3301      	adds	r3, #1
    218e:	b2da      	uxtb	r2, r3
    2190:	4b3e      	ldr	r3, [pc, #248]	; (228c <EXTI9_5_handler+0x150>)
    2192:	701a      	strb	r2, [r3, #0]
        }
		break;
    2194:	e073      	b.n	227e <EXTI9_5_handler+0x142>
    2196:	e072      	b.n	227e <EXTI9_5_handler+0x142>
	case 9:   // paritée
		if (data_bit) parity++;
    2198:	4b3e      	ldr	r3, [pc, #248]	; (2294 <EXTI9_5_handler+0x158>)
    219a:	689b      	ldr	r3, [r3, #8]
    219c:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    21a0:	2b00      	cmp	r3, #0
    21a2:	d004      	beq.n	21ae <EXTI9_5_handler+0x72>
    21a4:	79fb      	ldrb	r3, [r7, #7]
    21a6:	b2db      	uxtb	r3, r3
    21a8:	3301      	adds	r3, #1
    21aa:	b2db      	uxtb	r3, r3
    21ac:	71fb      	strb	r3, [r7, #7]
		if (!(parity & 1)){
    21ae:	79fb      	ldrb	r3, [r7, #7]
			//ps2_flags |= F_ERR_PARITY;
			
		}
		bit_cnt++;
    21b0:	4b36      	ldr	r3, [pc, #216]	; (228c <EXTI9_5_handler+0x150>)
    21b2:	781b      	ldrb	r3, [r3, #0]
    21b4:	b2db      	uxtb	r3, r3
    21b6:	3301      	adds	r3, #1
    21b8:	b2da      	uxtb	r2, r3
    21ba:	4b34      	ldr	r3, [pc, #208]	; (228c <EXTI9_5_handler+0x150>)
    21bc:	701a      	strb	r2, [r3, #0]
		break;
    21be:	e05e      	b.n	227e <EXTI9_5_handler+0x142>
	case 10:  // stop bit
	    if (!data_bit){
    21c0:	4b34      	ldr	r3, [pc, #208]	; (2294 <EXTI9_5_handler+0x158>)
    21c2:	689b      	ldr	r3, [r3, #8]
    21c4:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    21c8:	2b00      	cmp	r3, #0
    21ca:	d108      	bne.n	21de <EXTI9_5_handler+0xa2>
			ps2_flags|=F_ERR_FRAME;
    21cc:	4b30      	ldr	r3, [pc, #192]	; (2290 <EXTI9_5_handler+0x154>)
    21ce:	781b      	ldrb	r3, [r3, #0]
    21d0:	b2db      	uxtb	r3, r3
    21d2:	f043 0308 	orr.w	r3, r3, #8
    21d6:	b2da      	uxtb	r2, r3
    21d8:	4b2d      	ldr	r3, [pc, #180]	; (2290 <EXTI9_5_handler+0x154>)
    21da:	701a      	strb	r2, [r3, #0]
    21dc:	e029      	b.n	2232 <EXTI9_5_handler+0xf6>
		}else if (!(ps2_flags&F_ERROR)){
    21de:	4b2c      	ldr	r3, [pc, #176]	; (2290 <EXTI9_5_handler+0x154>)
    21e0:	781b      	ldrb	r3, [r3, #0]
    21e2:	b2db      	uxtb	r3, r3
    21e4:	f003 0309 	and.w	r3, r3, #9
    21e8:	2b00      	cmp	r3, #0
    21ea:	d122      	bne.n	2232 <EXTI9_5_handler+0xf6>
			if (in_byte==BAT_OK){
    21ec:	4b2a      	ldr	r3, [pc, #168]	; (2298 <EXTI9_5_handler+0x15c>)
    21ee:	781b      	ldrb	r3, [r3, #0]
    21f0:	b2db      	uxtb	r3, r3
    21f2:	2baa      	cmp	r3, #170	; 0xaa
    21f4:	d108      	bne.n	2208 <EXTI9_5_handler+0xcc>
				ps2_flags|=F_BATOK;
    21f6:	4b26      	ldr	r3, [pc, #152]	; (2290 <EXTI9_5_handler+0x154>)
    21f8:	781b      	ldrb	r3, [r3, #0]
    21fa:	b2db      	uxtb	r3, r3
    21fc:	f043 0304 	orr.w	r3, r3, #4
    2200:	b2da      	uxtb	r2, r3
    2202:	4b23      	ldr	r3, [pc, #140]	; (2290 <EXTI9_5_handler+0x154>)
    2204:	701a      	strb	r2, [r3, #0]
    2206:	e014      	b.n	2232 <EXTI9_5_handler+0xf6>
			}else{
				ps2_queue[ps2_tail++]=in_byte;
    2208:	4b24      	ldr	r3, [pc, #144]	; (229c <EXTI9_5_handler+0x160>)
    220a:	781b      	ldrb	r3, [r3, #0]
    220c:	b2db      	uxtb	r3, r3
    220e:	1c5a      	adds	r2, r3, #1
    2210:	b2d1      	uxtb	r1, r2
    2212:	4a22      	ldr	r2, [pc, #136]	; (229c <EXTI9_5_handler+0x160>)
    2214:	7011      	strb	r1, [r2, #0]
    2216:	461a      	mov	r2, r3
    2218:	4b1f      	ldr	r3, [pc, #124]	; (2298 <EXTI9_5_handler+0x15c>)
    221a:	781b      	ldrb	r3, [r3, #0]
    221c:	b2d9      	uxtb	r1, r3
    221e:	4b20      	ldr	r3, [pc, #128]	; (22a0 <EXTI9_5_handler+0x164>)
    2220:	5499      	strb	r1, [r3, r2]
				ps2_tail&=PS2_QUEUE_SIZE-1;
    2222:	4b1e      	ldr	r3, [pc, #120]	; (229c <EXTI9_5_handler+0x160>)
    2224:	781b      	ldrb	r3, [r3, #0]
    2226:	b2db      	uxtb	r3, r3
    2228:	f003 030f 	and.w	r3, r3, #15
    222c:	b2da      	uxtb	r2, r3
    222e:	4b1b      	ldr	r3, [pc, #108]	; (229c <EXTI9_5_handler+0x160>)
    2230:	701a      	strb	r2, [r3, #0]
			}
	    }
	    bit_cnt=0;
    2232:	4b16      	ldr	r3, [pc, #88]	; (228c <EXTI9_5_handler+0x150>)
    2234:	2200      	movs	r2, #0
    2236:	701a      	strb	r2, [r3, #0]
		break;
    2238:	e021      	b.n	227e <EXTI9_5_handler+0x142>
	default:
		in_byte >>=1;
    223a:	4b17      	ldr	r3, [pc, #92]	; (2298 <EXTI9_5_handler+0x15c>)
    223c:	781b      	ldrb	r3, [r3, #0]
    223e:	b2db      	uxtb	r3, r3
    2240:	085b      	lsrs	r3, r3, #1
    2242:	b2da      	uxtb	r2, r3
    2244:	4b14      	ldr	r3, [pc, #80]	; (2298 <EXTI9_5_handler+0x15c>)
    2246:	701a      	strb	r2, [r3, #0]
		if(data_bit){
    2248:	4b12      	ldr	r3, [pc, #72]	; (2294 <EXTI9_5_handler+0x158>)
    224a:	689b      	ldr	r3, [r3, #8]
    224c:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2250:	2b00      	cmp	r3, #0
    2252:	d00c      	beq.n	226e <EXTI9_5_handler+0x132>
			in_byte |=128;
    2254:	4b10      	ldr	r3, [pc, #64]	; (2298 <EXTI9_5_handler+0x15c>)
    2256:	781b      	ldrb	r3, [r3, #0]
    2258:	b2db      	uxtb	r3, r3
    225a:	f063 037f 	orn	r3, r3, #127	; 0x7f
    225e:	b2da      	uxtb	r2, r3
    2260:	4b0d      	ldr	r3, [pc, #52]	; (2298 <EXTI9_5_handler+0x15c>)
    2262:	701a      	strb	r2, [r3, #0]
			parity++;
    2264:	79fb      	ldrb	r3, [r7, #7]
    2266:	b2db      	uxtb	r3, r3
    2268:	3301      	adds	r3, #1
    226a:	b2db      	uxtb	r3, r3
    226c:	71fb      	strb	r3, [r7, #7]
		}
		bit_cnt++;
    226e:	4b07      	ldr	r3, [pc, #28]	; (228c <EXTI9_5_handler+0x150>)
    2270:	781b      	ldrb	r3, [r3, #0]
    2272:	b2db      	uxtb	r3, r3
    2274:	3301      	adds	r3, #1
    2276:	b2da      	uxtb	r2, r3
    2278:	4b04      	ldr	r3, [pc, #16]	; (228c <EXTI9_5_handler+0x150>)
    227a:	701a      	strb	r2, [r3, #0]
		break;
    227c:	bf00      	nop
	}
}
    227e:	370c      	adds	r7, #12
    2280:	46bd      	mov	sp, r7
    2282:	f85d 7b04 	ldr.w	r7, [sp], #4
    2286:	4770      	bx	lr
    2288:	40010400 	.word	0x40010400
    228c:	200000d8 	.word	0x200000d8
    2290:	200000bc 	.word	0x200000bc
    2294:	40010800 	.word	0x40010800
    2298:	200000d9 	.word	0x200000d9
    229c:	200000c5 	.word	0x200000c5
    22a0:	200000c8 	.word	0x200000c8

000022a4 <TIM2_handler>:

void TIM2_handler(){
    22a4:	b580      	push	{r7, lr}
    22a6:	af00      	add	r7, sp, #0
	TMR2->SR&=~(BIT0); // clear interrupt bit
    22a8:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    22ac:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    22b0:	691b      	ldr	r3, [r3, #16]
    22b2:	f023 0301 	bic.w	r3, r3, #1
    22b6:	6113      	str	r3, [r2, #16]
	if (ps2_tail!=ps2_head){
    22b8:	4b0f      	ldr	r3, [pc, #60]	; (22f8 <TIM2_handler+0x54>)
    22ba:	781b      	ldrb	r3, [r3, #0]
    22bc:	b2da      	uxtb	r2, r3
    22be:	4b0f      	ldr	r3, [pc, #60]	; (22fc <TIM2_handler+0x58>)
    22c0:	781b      	ldrb	r3, [r3, #0]
    22c2:	b2db      	uxtb	r3, r3
    22c4:	429a      	cmp	r2, r3
    22c6:	d015      	beq.n	22f4 <TIM2_handler+0x50>
		convert_code(ps2_queue[ps2_head++]);
    22c8:	4b0c      	ldr	r3, [pc, #48]	; (22fc <TIM2_handler+0x58>)
    22ca:	781b      	ldrb	r3, [r3, #0]
    22cc:	b2db      	uxtb	r3, r3
    22ce:	1c5a      	adds	r2, r3, #1
    22d0:	b2d1      	uxtb	r1, r2
    22d2:	4a0a      	ldr	r2, [pc, #40]	; (22fc <TIM2_handler+0x58>)
    22d4:	7011      	strb	r1, [r2, #0]
    22d6:	461a      	mov	r2, r3
    22d8:	4b09      	ldr	r3, [pc, #36]	; (2300 <TIM2_handler+0x5c>)
    22da:	5c9b      	ldrb	r3, [r3, r2]
    22dc:	b2db      	uxtb	r3, r3
    22de:	4618      	mov	r0, r3
    22e0:	f7ff fdda 	bl	1e98 <convert_code>
		ps2_head&=PS2_QUEUE_SIZE-1;
    22e4:	4b05      	ldr	r3, [pc, #20]	; (22fc <TIM2_handler+0x58>)
    22e6:	781b      	ldrb	r3, [r3, #0]
    22e8:	b2db      	uxtb	r3, r3
    22ea:	f003 030f 	and.w	r3, r3, #15
    22ee:	b2da      	uxtb	r2, r3
    22f0:	4b02      	ldr	r3, [pc, #8]	; (22fc <TIM2_handler+0x58>)
    22f2:	701a      	strb	r2, [r3, #0]
	}
}
    22f4:	bd80      	pop	{r7, pc}
    22f6:	bf00      	nop
    22f8:	200000c5 	.word	0x200000c5
    22fc:	200000c4 	.word	0x200000c4
    2300:	200000c8 	.word	0x200000c8

00002304 <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    2304:	b480      	push	{r7}
    2306:	b083      	sub	sp, #12
    2308:	af00      	add	r7, sp, #0
    230a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    230c:	687b      	ldr	r3, [r7, #4]
    230e:	2b3b      	cmp	r3, #59	; 0x3b
    2310:	d900      	bls.n	2314 <enable_interrupt+0x10>
    2312:	e016      	b.n	2342 <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    2314:	687b      	ldr	r3, [r7, #4]
    2316:	095b      	lsrs	r3, r3, #5
    2318:	009b      	lsls	r3, r3, #2
    231a:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    231e:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    2322:	687a      	ldr	r2, [r7, #4]
    2324:	0952      	lsrs	r2, r2, #5
    2326:	0092      	lsls	r2, r2, #2
    2328:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    232c:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    2330:	6812      	ldr	r2, [r2, #0]
    2332:	6879      	ldr	r1, [r7, #4]
    2334:	f001 011f 	and.w	r1, r1, #31
    2338:	2001      	movs	r0, #1
    233a:	fa00 f101 	lsl.w	r1, r0, r1
    233e:	430a      	orrs	r2, r1
    2340:	601a      	str	r2, [r3, #0]
}
    2342:	370c      	adds	r7, #12
    2344:	46bd      	mov	sp, r7
    2346:	f85d 7b04 	ldr.w	r7, [sp], #4
    234a:	4770      	bx	lr

0000234c <disable_interrupt>:


void disable_interrupt(unsigned irq){
    234c:	b480      	push	{r7}
    234e:	b083      	sub	sp, #12
    2350:	af00      	add	r7, sp, #0
    2352:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    2354:	687b      	ldr	r3, [r7, #4]
    2356:	2b3b      	cmp	r3, #59	; 0x3b
    2358:	d900      	bls.n	235c <disable_interrupt+0x10>
    235a:	e00b      	b.n	2374 <disable_interrupt+0x28>
	ICER[irq>>5]=(1<<(irq&0x1f));
    235c:	687b      	ldr	r3, [r7, #4]
    235e:	095b      	lsrs	r3, r3, #5
    2360:	009a      	lsls	r2, r3, #2
    2362:	4b07      	ldr	r3, [pc, #28]	; (2380 <disable_interrupt+0x34>)
    2364:	4413      	add	r3, r2
    2366:	687a      	ldr	r2, [r7, #4]
    2368:	f002 021f 	and.w	r2, r2, #31
    236c:	2101      	movs	r1, #1
    236e:	fa01 f202 	lsl.w	r2, r1, r2
    2372:	601a      	str	r2, [r3, #0]
}
    2374:	370c      	adds	r7, #12
    2376:	46bd      	mov	sp, r7
    2378:	f85d 7b04 	ldr.w	r7, [sp], #4
    237c:	4770      	bx	lr
    237e:	bf00      	nop
    2380:	e000e180 	.word	0xe000e180

00002384 <get_pending>:

unsigned get_pending(unsigned irq){
    2384:	b480      	push	{r7}
    2386:	b083      	sub	sp, #12
    2388:	af00      	add	r7, sp, #0
    238a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    238c:	687b      	ldr	r3, [r7, #4]
    238e:	2b3b      	cmp	r3, #59	; 0x3b
    2390:	d901      	bls.n	2396 <get_pending+0x12>
    2392:	2300      	movs	r3, #0
    2394:	e00c      	b.n	23b0 <get_pending+0x2c>
	return ICPR[irq>>5]&(1<<(irq&0x1f));
    2396:	687b      	ldr	r3, [r7, #4]
    2398:	095b      	lsrs	r3, r3, #5
    239a:	009a      	lsls	r2, r3, #2
    239c:	4b07      	ldr	r3, [pc, #28]	; (23bc <get_pending+0x38>)
    239e:	4413      	add	r3, r2
    23a0:	681b      	ldr	r3, [r3, #0]
    23a2:	687a      	ldr	r2, [r7, #4]
    23a4:	f002 021f 	and.w	r2, r2, #31
    23a8:	2101      	movs	r1, #1
    23aa:	fa01 f202 	lsl.w	r2, r1, r2
    23ae:	4013      	ands	r3, r2
}
    23b0:	4618      	mov	r0, r3
    23b2:	370c      	adds	r7, #12
    23b4:	46bd      	mov	sp, r7
    23b6:	f85d 7b04 	ldr.w	r7, [sp], #4
    23ba:	4770      	bx	lr
    23bc:	e000e280 	.word	0xe000e280

000023c0 <get_active>:

unsigned get_active(unsigned irq){
    23c0:	b480      	push	{r7}
    23c2:	b083      	sub	sp, #12
    23c4:	af00      	add	r7, sp, #0
    23c6:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    23c8:	687b      	ldr	r3, [r7, #4]
    23ca:	2b3b      	cmp	r3, #59	; 0x3b
    23cc:	d901      	bls.n	23d2 <get_active+0x12>
    23ce:	2300      	movs	r3, #0
    23d0:	e00e      	b.n	23f0 <get_active+0x30>
	return IABR[irq>>5]&(1<<(irq&0x1f));
    23d2:	687b      	ldr	r3, [r7, #4]
    23d4:	095b      	lsrs	r3, r3, #5
    23d6:	009b      	lsls	r3, r3, #2
    23d8:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    23dc:	f503 4363 	add.w	r3, r3, #58112	; 0xe300
    23e0:	681b      	ldr	r3, [r3, #0]
    23e2:	687a      	ldr	r2, [r7, #4]
    23e4:	f002 021f 	and.w	r2, r2, #31
    23e8:	2101      	movs	r1, #1
    23ea:	fa01 f202 	lsl.w	r2, r1, r2
    23ee:	4013      	ands	r3, r2
}
    23f0:	4618      	mov	r0, r3
    23f2:	370c      	adds	r7, #12
    23f4:	46bd      	mov	sp, r7
    23f6:	f85d 7b04 	ldr.w	r7, [sp], #4
    23fa:	4770      	bx	lr

000023fc <set_pending>:

void set_pending(unsigned irq){
    23fc:	b480      	push	{r7}
    23fe:	b083      	sub	sp, #12
    2400:	af00      	add	r7, sp, #0
    2402:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    2404:	687b      	ldr	r3, [r7, #4]
    2406:	2b3b      	cmp	r3, #59	; 0x3b
    2408:	d900      	bls.n	240c <set_pending+0x10>
    240a:	e016      	b.n	243a <set_pending+0x3e>
	ISPR[irq>>5]|=1<<(irq&0x1f);
    240c:	687b      	ldr	r3, [r7, #4]
    240e:	095b      	lsrs	r3, r3, #5
    2410:	009b      	lsls	r3, r3, #2
    2412:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2416:	f503 4362 	add.w	r3, r3, #57856	; 0xe200
    241a:	687a      	ldr	r2, [r7, #4]
    241c:	0952      	lsrs	r2, r2, #5
    241e:	0092      	lsls	r2, r2, #2
    2420:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    2424:	f502 4262 	add.w	r2, r2, #57856	; 0xe200
    2428:	6812      	ldr	r2, [r2, #0]
    242a:	6879      	ldr	r1, [r7, #4]
    242c:	f001 011f 	and.w	r1, r1, #31
    2430:	2001      	movs	r0, #1
    2432:	fa00 f101 	lsl.w	r1, r0, r1
    2436:	430a      	orrs	r2, r1
    2438:	601a      	str	r2, [r3, #0]
}
    243a:	370c      	adds	r7, #12
    243c:	46bd      	mov	sp, r7
    243e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2442:	4770      	bx	lr

00002444 <clear_pending>:

void clear_pending(unsigned irq){
    2444:	b480      	push	{r7}
    2446:	b083      	sub	sp, #12
    2448:	af00      	add	r7, sp, #0
    244a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    244c:	687b      	ldr	r3, [r7, #4]
    244e:	2b3b      	cmp	r3, #59	; 0x3b
    2450:	d900      	bls.n	2454 <clear_pending+0x10>
    2452:	e00b      	b.n	246c <clear_pending+0x28>
	ICPR[irq>>5]=(1<<(irq&0x1f));
    2454:	687b      	ldr	r3, [r7, #4]
    2456:	095b      	lsrs	r3, r3, #5
    2458:	009a      	lsls	r2, r3, #2
    245a:	4b07      	ldr	r3, [pc, #28]	; (2478 <clear_pending+0x34>)
    245c:	4413      	add	r3, r2
    245e:	687a      	ldr	r2, [r7, #4]
    2460:	f002 021f 	and.w	r2, r2, #31
    2464:	2101      	movs	r1, #1
    2466:	fa01 f202 	lsl.w	r2, r1, r2
    246a:	601a      	str	r2, [r3, #0]
}
    246c:	370c      	adds	r7, #12
    246e:	46bd      	mov	sp, r7
    2470:	f85d 7b04 	ldr.w	r7, [sp], #4
    2474:	4770      	bx	lr
    2476:	bf00      	nop
    2478:	e000e280 	.word	0xe000e280

0000247c <set_int_priority>:


void set_int_priority(int32_t irq, unsigned priority){
    247c:	b480      	push	{r7}
    247e:	b083      	sub	sp, #12
    2480:	af00      	add	r7, sp, #0
    2482:	6078      	str	r0, [r7, #4]
    2484:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    2486:	687b      	ldr	r3, [r7, #4]
    2488:	2b00      	cmp	r3, #0
    248a:	db0d      	blt.n	24a8 <set_int_priority+0x2c>
    248c:	687b      	ldr	r3, [r7, #4]
    248e:	2b3b      	cmp	r3, #59	; 0x3b
    2490:	dc0a      	bgt.n	24a8 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    2492:	687b      	ldr	r3, [r7, #4]
    2494:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2498:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    249c:	683a      	ldr	r2, [r7, #0]
    249e:	b2d2      	uxtb	r2, r2
    24a0:	0112      	lsls	r2, r2, #4
    24a2:	b2d2      	uxtb	r2, r2
    24a4:	701a      	strb	r2, [r3, #0]
    24a6:	e012      	b.n	24ce <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    24a8:	687b      	ldr	r3, [r7, #4]
    24aa:	2b00      	cmp	r3, #0
    24ac:	da0f      	bge.n	24ce <set_int_priority+0x52>
    24ae:	687b      	ldr	r3, [r7, #4]
    24b0:	f113 0f0f 	cmn.w	r3, #15
    24b4:	db0b      	blt.n	24ce <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    24b6:	687a      	ldr	r2, [r7, #4]
    24b8:	f06f 0303 	mvn.w	r3, #3
    24bc:	1a9b      	subs	r3, r3, r2
    24be:	461a      	mov	r2, r3
    24c0:	4b05      	ldr	r3, [pc, #20]	; (24d8 <set_int_priority+0x5c>)
    24c2:	4413      	add	r3, r2
    24c4:	683a      	ldr	r2, [r7, #0]
    24c6:	b2d2      	uxtb	r2, r2
    24c8:	0112      	lsls	r2, r2, #4
    24ca:	b2d2      	uxtb	r2, r2
    24cc:	701a      	strb	r2, [r3, #0]
	}
}
    24ce:	370c      	adds	r7, #12
    24d0:	46bd      	mov	sp, r7
    24d2:	f85d 7b04 	ldr.w	r7, [sp], #4
    24d6:	4770      	bx	lr
    24d8:	e000ed18 	.word	0xe000ed18

000024dc <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    24dc:	b480      	push	{r7}
    24de:	b083      	sub	sp, #12
    24e0:	af00      	add	r7, sp, #0
    24e2:	6078      	str	r0, [r7, #4]
    24e4:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    24e6:	687b      	ldr	r3, [r7, #4]
    24e8:	881b      	ldrh	r3, [r3, #0]
    24ea:	b29b      	uxth	r3, r3
    24ec:	f423 63e0 	bic.w	r3, r3, #1792	; 0x700
    24f0:	b29a      	uxth	r2, r3
    24f2:	687b      	ldr	r3, [r7, #4]
    24f4:	801a      	strh	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    24f6:	687b      	ldr	r3, [r7, #4]
    24f8:	881b      	ldrh	r3, [r3, #0]
    24fa:	b29a      	uxth	r2, r3
    24fc:	683b      	ldr	r3, [r7, #0]
    24fe:	b29b      	uxth	r3, r3
    2500:	00db      	lsls	r3, r3, #3
    2502:	b29b      	uxth	r3, r3
    2504:	4313      	orrs	r3, r2
    2506:	b29a      	uxth	r2, r3
    2508:	687b      	ldr	r3, [r7, #4]
    250a:	801a      	strh	r2, [r3, #0]
}
    250c:	370c      	adds	r7, #12
    250e:	46bd      	mov	sp, r7
    2510:	f85d 7b04 	ldr.w	r7, [sp], #4
    2514:	4770      	bx	lr
    2516:	bf00      	nop

00002518 <spi_init>:


void spi_init(spi_sfr_t* channel, unsigned baud){
    2518:	b580      	push	{r7, lr}
    251a:	b082      	sub	sp, #8
    251c:	af00      	add	r7, sp, #0
    251e:	6078      	str	r0, [r7, #4]
    2520:	6039      	str	r1, [r7, #0]
	spi_baudrate(channel,baud);
    2522:	6878      	ldr	r0, [r7, #4]
    2524:	6839      	ldr	r1, [r7, #0]
    2526:	f7ff ffd9 	bl	24dc <spi_baudrate>
	channel->CR1=SPI_CR1_MSTR|SPI_CR1_SSM;
    252a:	687b      	ldr	r3, [r7, #4]
    252c:	f44f 7201 	mov.w	r2, #516	; 0x204
    2530:	801a      	strh	r2, [r3, #0]
	//channel->CR2|=SPI_CR2_SSOE;
	if (channel==SPI1){
    2532:	687b      	ldr	r3, [r7, #4]
    2534:	4a17      	ldr	r2, [pc, #92]	; (2594 <spi_init+0x7c>)
    2536:	4293      	cmp	r3, r2
    2538:	d114      	bne.n	2564 <spi_init+0x4c>
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(PORTA,4,OUTPUT_PP_FAST);
    253a:	4817      	ldr	r0, [pc, #92]	; (2598 <spi_init+0x80>)
    253c:	2104      	movs	r1, #4
    253e:	2203      	movs	r2, #3
    2540:	f7ff fbce 	bl	1ce0 <config_pin>
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(PORTA,5,OUTPUT_PP_FAST);
    2544:	4814      	ldr	r0, [pc, #80]	; (2598 <spi_init+0x80>)
    2546:	2105      	movs	r1, #5
    2548:	2203      	movs	r2, #3
    254a:	f7ff fbc9 	bl	1ce0 <config_pin>
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(PORTA,6,INPUT_FLOAT);
    254e:	4812      	ldr	r0, [pc, #72]	; (2598 <spi_init+0x80>)
    2550:	2106      	movs	r1, #6
    2552:	2204      	movs	r2, #4
    2554:	f7ff fbc4 	bl	1ce0 <config_pin>
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(PORTA,7,OUTPUT_PP_FAST);
    2558:	480f      	ldr	r0, [pc, #60]	; (2598 <spi_init+0x80>)
    255a:	2107      	movs	r1, #7
    255c:	2203      	movs	r2, #3
    255e:	f7ff fbbf 	bl	1ce0 <config_pin>
    2562:	e013      	b.n	258c <spi_init+0x74>
	}else{
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(PORTB,2,OUTPUT_PP_FAST);
    2564:	480d      	ldr	r0, [pc, #52]	; (259c <spi_init+0x84>)
    2566:	2102      	movs	r1, #2
    2568:	2203      	movs	r2, #3
    256a:	f7ff fbb9 	bl	1ce0 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(PORTB,13,OUTPUT_PP_FAST);
    256e:	480b      	ldr	r0, [pc, #44]	; (259c <spi_init+0x84>)
    2570:	210d      	movs	r1, #13
    2572:	2203      	movs	r2, #3
    2574:	f7ff fbb4 	bl	1ce0 <config_pin>
		// PB14 MISO input (floating)
		config_pin(PORTB,14,INPUT_FLOAT);
    2578:	4808      	ldr	r0, [pc, #32]	; (259c <spi_init+0x84>)
    257a:	210e      	movs	r1, #14
    257c:	2204      	movs	r2, #4
    257e:	f7ff fbaf 	bl	1ce0 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(PORTB,15,OUTPUT_PP_FAST);
    2582:	4806      	ldr	r0, [pc, #24]	; (259c <spi_init+0x84>)
    2584:	210f      	movs	r1, #15
    2586:	2203      	movs	r2, #3
    2588:	f7ff fbaa 	bl	1ce0 <config_pin>
	}
}
    258c:	3708      	adds	r7, #8
    258e:	46bd      	mov	sp, r7
    2590:	bd80      	pop	{r7, pc}
    2592:	bf00      	nop
    2594:	40013000 	.word	0x40013000
    2598:	40010800 	.word	0x40010800
    259c:	40010c00 	.word	0x40010c00

000025a0 <spi_enable>:

void spi_enable(spi_sfr_t* channel, unsigned mode){
    25a0:	b480      	push	{r7}
    25a2:	b083      	sub	sp, #12
    25a4:	af00      	add	r7, sp, #0
    25a6:	6078      	str	r0, [r7, #4]
    25a8:	6039      	str	r1, [r7, #0]
	switch (mode){
    25aa:	683b      	ldr	r3, [r7, #0]
    25ac:	2b01      	cmp	r3, #1
    25ae:	d00d      	beq.n	25cc <spi_enable+0x2c>
    25b0:	2b01      	cmp	r3, #1
    25b2:	d302      	bcc.n	25ba <spi_enable+0x1a>
    25b4:	2b02      	cmp	r3, #2
    25b6:	d005      	beq.n	25c4 <spi_enable+0x24>
    25b8:	e00d      	b.n	25d6 <spi_enable+0x36>
		case SPI_MODE_READ:
		channel->CR1=SPI_CR1_RXONLY|SPI_CR1_SPE;
    25ba:	687b      	ldr	r3, [r7, #4]
    25bc:	f44f 6288 	mov.w	r2, #1088	; 0x440
    25c0:	801a      	strh	r2, [r3, #0]
		break;
    25c2:	e008      	b.n	25d6 <spi_enable+0x36>
		case SPI_MODE_READ_WRITE:
		channel->CR1=SPI_CR1_SPE;
    25c4:	687b      	ldr	r3, [r7, #4]
    25c6:	2240      	movs	r2, #64	; 0x40
    25c8:	801a      	strh	r2, [r3, #0]
		break;
    25ca:	e004      	b.n	25d6 <spi_enable+0x36>
		case SPI_MODE_WRITE:
		channel->CR1=SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE|SPI_CR1_SPE;
    25cc:	687b      	ldr	r3, [r7, #4]
    25ce:	f24c 0240 	movw	r2, #49216	; 0xc040
    25d2:	801a      	strh	r2, [r3, #0]
		break;
    25d4:	bf00      	nop
	}
}
    25d6:	370c      	adds	r7, #12
    25d8:	46bd      	mov	sp, r7
    25da:	f85d 7b04 	ldr.w	r7, [sp], #4
    25de:	4770      	bx	lr

000025e0 <spi_disable>:

void spi_disable(spi_sfr_t* channel){
    25e0:	b480      	push	{r7}
    25e2:	b083      	sub	sp, #12
    25e4:	af00      	add	r7, sp, #0
    25e6:	6078      	str	r0, [r7, #4]
	channel->CR1&=~SPI_CR1_SPE;
    25e8:	687b      	ldr	r3, [r7, #4]
    25ea:	881b      	ldrh	r3, [r3, #0]
    25ec:	b29b      	uxth	r3, r3
    25ee:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    25f2:	b29a      	uxth	r2, r3
    25f4:	687b      	ldr	r3, [r7, #4]
    25f6:	801a      	strh	r2, [r3, #0]
}
    25f8:	370c      	adds	r7, #12
    25fa:	46bd      	mov	sp, r7
    25fc:	f85d 7b04 	ldr.w	r7, [sp], #4
    2600:	4770      	bx	lr
    2602:	bf00      	nop

00002604 <spi_write>:

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
    2604:	b580      	push	{r7, lr}
    2606:	b082      	sub	sp, #8
    2608:	af00      	add	r7, sp, #0
    260a:	6078      	str	r0, [r7, #4]
    260c:	460b      	mov	r3, r1
    260e:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
    2610:	6878      	ldr	r0, [r7, #4]
    2612:	2101      	movs	r1, #1
    2614:	f7ff ffc4 	bl	25a0 <spi_enable>
	channel->DR=b;
    2618:	78fb      	ldrb	r3, [r7, #3]
    261a:	b29a      	uxth	r2, r3
    261c:	687b      	ldr	r3, [r7, #4]
    261e:	819a      	strh	r2, [r3, #12]
	spi_disable(channel);
    2620:	6878      	ldr	r0, [r7, #4]
    2622:	f7ff ffdd 	bl	25e0 <spi_disable>
}
    2626:	3708      	adds	r7, #8
    2628:	46bd      	mov	sp, r7
    262a:	bd80      	pop	{r7, pc}

0000262c <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    262c:	b580      	push	{r7, lr}
    262e:	b084      	sub	sp, #16
    2630:	af00      	add	r7, sp, #0
    2632:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
    2634:	6878      	ldr	r0, [r7, #4]
    2636:	2100      	movs	r1, #0
    2638:	f7ff ffb2 	bl	25a0 <spi_enable>
	channel->DR=255;
    263c:	687b      	ldr	r3, [r7, #4]
    263e:	22ff      	movs	r2, #255	; 0xff
    2640:	819a      	strh	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    2642:	bf00      	nop
    2644:	687b      	ldr	r3, [r7, #4]
    2646:	891b      	ldrh	r3, [r3, #8]
    2648:	b29b      	uxth	r3, r3
    264a:	f003 0301 	and.w	r3, r3, #1
    264e:	2b00      	cmp	r3, #0
    2650:	d0f8      	beq.n	2644 <spi_read+0x18>
	rx=(uint8_t)channel->DR;
    2652:	687b      	ldr	r3, [r7, #4]
    2654:	899b      	ldrh	r3, [r3, #12]
    2656:	b29b      	uxth	r3, r3
    2658:	73fb      	strb	r3, [r7, #15]
	spi_disable(channel);
    265a:	6878      	ldr	r0, [r7, #4]
    265c:	f7ff ffc0 	bl	25e0 <spi_disable>
	return rx;
    2660:	7bfb      	ldrb	r3, [r7, #15]
}
    2662:	4618      	mov	r0, r3
    2664:	3710      	adds	r7, #16
    2666:	46bd      	mov	sp, r7
    2668:	bd80      	pop	{r7, pc}
    266a:	bf00      	nop

0000266c <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    266c:	b580      	push	{r7, lr}
    266e:	b084      	sub	sp, #16
    2670:	af00      	add	r7, sp, #0
    2672:	60f8      	str	r0, [r7, #12]
    2674:	60b9      	str	r1, [r7, #8]
    2676:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_WRITE);
    2678:	68f8      	ldr	r0, [r7, #12]
    267a:	2101      	movs	r1, #1
    267c:	f7ff ff90 	bl	25a0 <spi_enable>
	while (count){
    2680:	e011      	b.n	26a6 <spi_block_write+0x3a>
		channel->DR=*buffer++;
    2682:	68bb      	ldr	r3, [r7, #8]
    2684:	1c5a      	adds	r2, r3, #1
    2686:	60ba      	str	r2, [r7, #8]
    2688:	781b      	ldrb	r3, [r3, #0]
    268a:	b29a      	uxth	r2, r3
    268c:	68fb      	ldr	r3, [r7, #12]
    268e:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    2690:	bf00      	nop
    2692:	68fb      	ldr	r3, [r7, #12]
    2694:	891b      	ldrh	r3, [r3, #8]
    2696:	b29b      	uxth	r3, r3
    2698:	f003 0302 	and.w	r3, r3, #2
    269c:	2b00      	cmp	r3, #0
    269e:	d0f8      	beq.n	2692 <spi_block_write+0x26>
		count--;
    26a0:	687b      	ldr	r3, [r7, #4]
    26a2:	3b01      	subs	r3, #1
    26a4:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_enable(channel,SPI_MODE_WRITE);
	while (count){
    26a6:	687b      	ldr	r3, [r7, #4]
    26a8:	2b00      	cmp	r3, #0
    26aa:	d1ea      	bne.n	2682 <spi_block_write+0x16>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	spi_disable(channel);
    26ac:	68f8      	ldr	r0, [r7, #12]
    26ae:	f7ff ff97 	bl	25e0 <spi_disable>
}
    26b2:	3710      	adds	r7, #16
    26b4:	46bd      	mov	sp, r7
    26b6:	bd80      	pop	{r7, pc}

000026b8 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    26b8:	b580      	push	{r7, lr}
    26ba:	b084      	sub	sp, #16
    26bc:	af00      	add	r7, sp, #0
    26be:	60f8      	str	r0, [r7, #12]
    26c0:	60b9      	str	r1, [r7, #8]
    26c2:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_READ);
    26c4:	68f8      	ldr	r0, [r7, #12]
    26c6:	2100      	movs	r1, #0
    26c8:	f7ff ff6a 	bl	25a0 <spi_enable>
	while (count){
    26cc:	e015      	b.n	26fa <spi_block_read+0x42>
		channel->DR=0;
    26ce:	68fb      	ldr	r3, [r7, #12]
    26d0:	2200      	movs	r2, #0
    26d2:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    26d4:	bf00      	nop
    26d6:	68fb      	ldr	r3, [r7, #12]
    26d8:	891b      	ldrh	r3, [r3, #8]
    26da:	b29b      	uxth	r3, r3
    26dc:	f003 0301 	and.w	r3, r3, #1
    26e0:	2b00      	cmp	r3, #0
    26e2:	d0f8      	beq.n	26d6 <spi_block_read+0x1e>
		*buffer++=(uint8_t)channel->DR;
    26e4:	68bb      	ldr	r3, [r7, #8]
    26e6:	1c5a      	adds	r2, r3, #1
    26e8:	60ba      	str	r2, [r7, #8]
    26ea:	68fa      	ldr	r2, [r7, #12]
    26ec:	8992      	ldrh	r2, [r2, #12]
    26ee:	b292      	uxth	r2, r2
    26f0:	b2d2      	uxtb	r2, r2
    26f2:	701a      	strb	r2, [r3, #0]
		count--;
    26f4:	687b      	ldr	r3, [r7, #4]
    26f6:	3b01      	subs	r3, #1
    26f8:	607b      	str	r3, [r7, #4]
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_enable(channel,SPI_MODE_READ);
	while (count){
    26fa:	687b      	ldr	r3, [r7, #4]
    26fc:	2b00      	cmp	r3, #0
    26fe:	d1e6      	bne.n	26ce <spi_block_read+0x16>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
	spi_disable(channel);
    2700:	68f8      	ldr	r0, [r7, #12]
    2702:	f7ff ff6d 	bl	25e0 <spi_disable>
}
    2706:	3710      	adds	r7, #16
    2708:	46bd      	mov	sp, r7
    270a:	bd80      	pop	{r7, pc}

0000270c <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    270c:	4b01      	ldr	r3, [pc, #4]	; (2714 <reset_mcu+0x8>)
    270e:	4a02      	ldr	r2, [pc, #8]	; (2718 <reset_mcu+0xc>)
    2710:	601a      	str	r2, [r3, #0]
    2712:	bf00      	nop
    2714:	e000ed0c 	.word	0xe000ed0c
    2718:	05fa0004 	.word	0x05fa0004

0000271c <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    271c:	b580      	push	{r7, lr}
    271e:	b082      	sub	sp, #8
    2720:	af00      	add	r7, sp, #0
    2722:	6078      	str	r0, [r7, #4]
    2724:	6039      	str	r1, [r7, #0]
	print(msg);
    2726:	6878      	ldr	r0, [r7, #4]
    2728:	f7fe fd08 	bl	113c <print>
	print("at address ");
    272c:	4814      	ldr	r0, [pc, #80]	; (2780 <print_fault+0x64>)
    272e:	f7fe fd05 	bl	113c <print>
	if (adr) {
    2732:	683b      	ldr	r3, [r7, #0]
    2734:	2b00      	cmp	r3, #0
    2736:	d002      	beq.n	273e <print_fault+0x22>
		print_hex(adr);
    2738:	6838      	ldr	r0, [r7, #0]
    273a:	f7fe fe47 	bl	13cc <print_hex>
	};
	conout(CR);
    273e:	200d      	movs	r0, #13
    2740:	f7fe fce2 	bl	1108 <conout>
	print("UFSR=");
    2744:	480f      	ldr	r0, [pc, #60]	; (2784 <print_fault+0x68>)
    2746:	f7fe fcf9 	bl	113c <print>
	print_hex(CFSR->fsr.usageFalt);
    274a:	4b0f      	ldr	r3, [pc, #60]	; (2788 <print_fault+0x6c>)
    274c:	681b      	ldr	r3, [r3, #0]
    274e:	0c1b      	lsrs	r3, r3, #16
    2750:	b29b      	uxth	r3, r3
    2752:	4618      	mov	r0, r3
    2754:	f7fe fe3a 	bl	13cc <print_hex>
	print(", BFSR=");
    2758:	480c      	ldr	r0, [pc, #48]	; (278c <print_fault+0x70>)
    275a:	f7fe fcef 	bl	113c <print>
	print_hex(CFSR->fsr.busFault);
    275e:	4b0a      	ldr	r3, [pc, #40]	; (2788 <print_fault+0x6c>)
    2760:	681b      	ldr	r3, [r3, #0]
    2762:	0a1b      	lsrs	r3, r3, #8
    2764:	b2db      	uxtb	r3, r3
    2766:	4618      	mov	r0, r3
    2768:	f7fe fe30 	bl	13cc <print_hex>
	print(", MMFSR=");
    276c:	4808      	ldr	r0, [pc, #32]	; (2790 <print_fault+0x74>)
    276e:	f7fe fce5 	bl	113c <print>
	print_hex(CFSR->fsr.mmFault);
    2772:	4b05      	ldr	r3, [pc, #20]	; (2788 <print_fault+0x6c>)
    2774:	681b      	ldr	r3, [r3, #0]
    2776:	b2db      	uxtb	r3, r3
    2778:	4618      	mov	r0, r3
    277a:	f7fe fe27 	bl	13cc <print_hex>
	while(1);
    277e:	e7fe      	b.n	277e <print_fault+0x62>
    2780:	000035e4 	.word	0x000035e4
    2784:	000035f0 	.word	0x000035f0
    2788:	e000ed28 	.word	0xe000ed28
    278c:	000035f8 	.word	0x000035f8
    2790:	00003600 	.word	0x00003600

00002794 <config_systicks>:


// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
#define MSEC_DLY FCLK/8/1000
void config_systicks(){
    2794:	b580      	push	{r7, lr}
    2796:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,9);
    2798:	f06f 000e 	mvn.w	r0, #14
    279c:	2109      	movs	r1, #9
    279e:	f7ff fe6d 	bl	247c <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
    27a2:	4b04      	ldr	r3, [pc, #16]	; (27b4 <config_systicks+0x20>)
    27a4:	f641 32f6 	movw	r2, #7158	; 0x1bf6
    27a8:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
    27aa:	4b03      	ldr	r3, [pc, #12]	; (27b8 <config_systicks+0x24>)
    27ac:	2203      	movs	r2, #3
    27ae:	601a      	str	r2, [r3, #0]
}
    27b0:	bd80      	pop	{r7, pc}
    27b2:	bf00      	nop
    27b4:	e000e014 	.word	0xe000e014
    27b8:	e000e010 	.word	0xe000e010

000027bc <pause>:



void pause(unsigned msec){
    27bc:	b480      	push	{r7}
    27be:	b083      	sub	sp, #12
    27c0:	af00      	add	r7, sp, #0
    27c2:	6078      	str	r0, [r7, #4]
	timer=msec;
    27c4:	4a06      	ldr	r2, [pc, #24]	; (27e0 <pause+0x24>)
    27c6:	687b      	ldr	r3, [r7, #4]
    27c8:	6013      	str	r3, [r2, #0]
	while (timer);
    27ca:	bf00      	nop
    27cc:	4b04      	ldr	r3, [pc, #16]	; (27e0 <pause+0x24>)
    27ce:	681b      	ldr	r3, [r3, #0]
    27d0:	2b00      	cmp	r3, #0
    27d2:	d1fb      	bne.n	27cc <pause+0x10>
}
    27d4:	370c      	adds	r7, #12
    27d6:	46bd      	mov	sp, r7
    27d8:	f85d 7b04 	ldr.w	r7, [sp], #4
    27dc:	4770      	bx	lr
    27de:	bf00      	nop
    27e0:	200000e0 	.word	0x200000e0

000027e4 <STK_handler>:


// interruption coretimer
void STK_handler(){
    27e4:	b480      	push	{r7}
    27e6:	af00      	add	r7, sp, #0
	ticks++;
    27e8:	4b08      	ldr	r3, [pc, #32]	; (280c <STK_handler+0x28>)
    27ea:	681b      	ldr	r3, [r3, #0]
    27ec:	3301      	adds	r3, #1
    27ee:	4a07      	ldr	r2, [pc, #28]	; (280c <STK_handler+0x28>)
    27f0:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
    27f2:	4b07      	ldr	r3, [pc, #28]	; (2810 <STK_handler+0x2c>)
    27f4:	681b      	ldr	r3, [r3, #0]
    27f6:	2b00      	cmp	r3, #0
    27f8:	d004      	beq.n	2804 <STK_handler+0x20>
    27fa:	4b05      	ldr	r3, [pc, #20]	; (2810 <STK_handler+0x2c>)
    27fc:	681b      	ldr	r3, [r3, #0]
    27fe:	3b01      	subs	r3, #1
    2800:	4a03      	ldr	r2, [pc, #12]	; (2810 <STK_handler+0x2c>)
    2802:	6013      	str	r3, [r2, #0]
}
    2804:	46bd      	mov	sp, r7
    2806:	f85d 7b04 	ldr.w	r7, [sp], #4
    280a:	4770      	bx	lr
    280c:	200000dc 	.word	0x200000dc
    2810:	200000e0 	.word	0x200000e0

00002814 <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    2814:	b480      	push	{r7}
    2816:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    2818:	2300      	movs	r3, #0
    281a:	2200      	movs	r2, #0
    281c:	4618      	mov	r0, r3
    281e:	4611      	mov	r1, r2
    2820:	df02      	svc	2
}
    2822:	46bd      	mov	sp, r7
    2824:	f85d 7b04 	ldr.w	r7, [sp], #4
    2828:	4770      	bx	lr
    282a:	bf00      	nop

0000282c <tvout_init>:

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
    282c:	b580      	push	{r7, lr}
    282e:	af00      	add	r7, sp, #0
	//sortie sync sur PA8
	config_pin(PORTA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    2830:	4833      	ldr	r0, [pc, #204]	; (2900 <tvout_init+0xd4>)
    2832:	2108      	movs	r1, #8
    2834:	220a      	movs	r2, #10
    2836:	f7ff fa53 	bl	1ce0 <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    283a:	4832      	ldr	r0, [pc, #200]	; (2904 <tvout_init+0xd8>)
    283c:	210f      	movs	r1, #15
    283e:	220b      	movs	r2, #11
    2840:	f7ff fa4e 	bl	1ce0 <config_pin>
	PORTB->BRR=BIT15;
    2844:	4b2f      	ldr	r3, [pc, #188]	; (2904 <tvout_init+0xd8>)
    2846:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    284a:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
    284c:	4a2e      	ldr	r2, [pc, #184]	; (2908 <tvout_init+0xdc>)
    284e:	4b2e      	ldr	r3, [pc, #184]	; (2908 <tvout_init+0xdc>)
    2850:	699b      	ldr	r3, [r3, #24]
    2852:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    2856:	6193      	str	r3, [r2, #24]
	// clock source division
	*TIMER1_PSC=0;
    2858:	4b2c      	ldr	r3, [pc, #176]	; (290c <tvout_init+0xe0>)
    285a:	2200      	movs	r2, #0
    285c:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    285e:	4b2c      	ldr	r3, [pc, #176]	; (2910 <tvout_init+0xe4>)
    2860:	f44f 6265 	mov.w	r2, #3664	; 0xe50
    2864:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    2866:	4b2b      	ldr	r3, [pc, #172]	; (2914 <tvout_init+0xe8>)
    2868:	f44f 7286 	mov.w	r2, #268	; 0x10c
    286c:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    286e:	4b2a      	ldr	r3, [pc, #168]	; (2918 <tvout_init+0xec>)
    2870:	681a      	ldr	r2, [r3, #0]
    2872:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    2876:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    287a:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    287c:	4b26      	ldr	r3, [pc, #152]	; (2918 <tvout_init+0xec>)
    287e:	681a      	ldr	r2, [r3, #0]
    2880:	f042 0208 	orr.w	r2, r2, #8
    2884:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    2886:	4b25      	ldr	r3, [pc, #148]	; (291c <tvout_init+0xf0>)
    2888:	681a      	ldr	r2, [r3, #0]
    288a:	f042 0201 	orr.w	r2, r2, #1
    288e:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    2890:	4b22      	ldr	r3, [pc, #136]	; (291c <tvout_init+0xf0>)
    2892:	681a      	ldr	r2, [r3, #0]
    2894:	f042 0202 	orr.w	r2, r2, #2
    2898:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    289a:	4a21      	ldr	r2, [pc, #132]	; (2920 <tvout_init+0xf4>)
    289c:	8813      	ldrh	r3, [r2, #0]
    289e:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    28a2:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    28a6:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    28a8:	4b1e      	ldr	r3, [pc, #120]	; (2924 <tvout_init+0xf8>)
    28aa:	681a      	ldr	r2, [r3, #0]
    28ac:	f042 0201 	orr.w	r2, r2, #1
    28b0:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=SPI_PIXELS; //(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    28b2:	4b1d      	ldr	r3, [pc, #116]	; (2928 <tvout_init+0xfc>)
    28b4:	f640 324c 	movw	r2, #2892	; 0xb4c
    28b8:	801a      	strh	r2, [r3, #0]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    28ba:	4b1c      	ldr	r3, [pc, #112]	; (292c <tvout_init+0x100>)
    28bc:	f243 5292 	movw	r2, #13714	; 0x3592
    28c0:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    28c2:	4b1a      	ldr	r3, [pc, #104]	; (292c <tvout_init+0x100>)
    28c4:	4a1a      	ldr	r2, [pc, #104]	; (2930 <tvout_init+0x104>)
    28c6:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    28c8:	4a17      	ldr	r2, [pc, #92]	; (2928 <tvout_init+0xfc>)
    28ca:	4b17      	ldr	r3, [pc, #92]	; (2928 <tvout_init+0xfc>)
    28cc:	889b      	ldrh	r3, [r3, #4]
    28ce:	b29b      	uxth	r3, r3
    28d0:	f043 0302 	orr.w	r3, r3, #2
    28d4:	b29b      	uxth	r3, r3
    28d6:	8093      	strh	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,7);
    28d8:	200f      	movs	r0, #15
    28da:	2107      	movs	r1, #7
    28dc:	f7ff fdce 	bl	247c <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    28e0:	200f      	movs	r0, #15
    28e2:	f7ff fd0f 	bl	2304 <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    28e6:	4b13      	ldr	r3, [pc, #76]	; (2934 <tvout_init+0x108>)
    28e8:	681a      	ldr	r2, [r3, #0]
    28ea:	f042 0202 	orr.w	r2, r2, #2
    28ee:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,7);
    28f0:	201b      	movs	r0, #27
    28f2:	2107      	movs	r1, #7
    28f4:	f7ff fdc2 	bl	247c <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    28f8:	201b      	movs	r0, #27
    28fa:	f7ff fd03 	bl	2304 <enable_interrupt>
	for(i=1;i<(VRES-2);i++){
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	 test end */
 }
    28fe:	bd80      	pop	{r7, pc}
    2900:	40010800 	.word	0x40010800
    2904:	40010c00 	.word	0x40010c00
    2908:	40021000 	.word	0x40021000
    290c:	40012c28 	.word	0x40012c28
    2910:	40012c2c 	.word	0x40012c2c
    2914:	40012c34 	.word	0x40012c34
    2918:	40012c18 	.word	0x40012c18
    291c:	40012c20 	.word	0x40012c20
    2920:	40012c44 	.word	0x40012c44
    2924:	40012c00 	.word	0x40012c00
    2928:	40003800 	.word	0x40003800
    292c:	40020058 	.word	0x40020058
    2930:	4000380c 	.word	0x4000380c
    2934:	40012c0c 	.word	0x40012c0c

00002938 <TIM1_CC_handler>:
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    2938:	484a      	ldr	r0, [pc, #296]	; (2a64 <TIM1_CC_handler+0x12c>)
	line_count++;
    293a:	4b4b      	ldr	r3, [pc, #300]	; (2a68 <TIM1_CC_handler+0x130>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    293c:	6802      	ldr	r2, [r0, #0]
	line_count++;
	TIMER1_SR->fld.cc1if=0;
    293e:	494b      	ldr	r1, [pc, #300]	; (2a6c <TIM1_CC_handler+0x134>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    2940:	f022 0201 	bic.w	r2, r2, #1
    2944:	6002      	str	r2, [r0, #0]
	line_count++;
    2946:	681a      	ldr	r2, [r3, #0]
    2948:	3201      	adds	r2, #1
    294a:	601a      	str	r2, [r3, #0]
	TIMER1_SR->fld.cc1if=0;
    294c:	680a      	ldr	r2, [r1, #0]
    294e:	f022 0202 	bic.w	r2, r2, #2
    2952:	600a      	str	r2, [r1, #0]
	switch(line_count){
    2954:	681a      	ldr	r2, [r3, #0]
    2956:	2a12      	cmp	r2, #18
    2958:	d07f      	beq.n	2a5a <TIM1_CC_handler+0x122>
    295a:	dd1c      	ble.n	2996 <TIM1_CC_handler+0x5e>
    295c:	f5b2 7f96 	cmp.w	r2, #300	; 0x12c
    2960:	d072      	beq.n	2a48 <TIM1_CC_handler+0x110>
    2962:	dd3f      	ble.n	29e4 <TIM1_CC_handler+0xac>
    2964:	f240 1141 	movw	r1, #321	; 0x141
    2968:	428a      	cmp	r2, r1
    296a:	d028      	beq.n	29be <TIM1_CC_handler+0x86>
    296c:	f5b2 7fa1 	cmp.w	r2, #322	; 0x142
    2970:	d14a      	bne.n	2a08 <TIM1_CC_handler+0xd0>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    2972:	4a3f      	ldr	r2, [pc, #252]	; (2a70 <TIM1_CC_handler+0x138>)
    2974:	6811      	ldr	r1, [r2, #0]
    2976:	b169      	cbz	r1, 2994 <TIM1_CC_handler+0x5c>
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
    2978:	b410      	push	{r4}
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    297a:	483e      	ldr	r0, [pc, #248]	; (2a74 <TIM1_CC_handler+0x13c>)
			line_count=-1;
    297c:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    2980:	8801      	ldrh	r1, [r0, #0]
    2982:	f3c1 014e 	ubfx	r1, r1, #1, #15
    2986:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    2988:	601c      	str	r4, [r3, #0]
			even=-even;
    298a:	6813      	ldr	r3, [r2, #0]
    298c:	425b      	negs	r3, r3
    298e:	6013      	str	r3, [r2, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    2990:	f85d 4b04 	ldr.w	r4, [sp], #4
    2994:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2996:	2a06      	cmp	r2, #6
    2998:	d05a      	beq.n	2a50 <TIM1_CC_handler+0x118>
    299a:	dd29      	ble.n	29f0 <TIM1_CC_handler+0xb8>
    299c:	2a0c      	cmp	r2, #12
    299e:	d019      	beq.n	29d4 <TIM1_CC_handler+0x9c>
    29a0:	2a11      	cmp	r2, #17
    29a2:	d131      	bne.n	2a08 <TIM1_CC_handler+0xd0>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
		break;
	case 17: // fin sync champ paire
		if (even){
    29a4:	4b32      	ldr	r3, [pc, #200]	; (2a70 <TIM1_CC_handler+0x138>)
    29a6:	681b      	ldr	r3, [r3, #0]
    29a8:	2b00      	cmp	r3, #0
    29aa:	d0f3      	beq.n	2994 <TIM1_CC_handler+0x5c>
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    29ac:	4931      	ldr	r1, [pc, #196]	; (2a74 <TIM1_CC_handler+0x13c>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    29ae:	4b32      	ldr	r3, [pc, #200]	; (2a78 <TIM1_CC_handler+0x140>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    29b0:	f44f 6065 	mov.w	r0, #3664	; 0xe50
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    29b4:	f44f 7286 	mov.w	r2, #268	; 0x10c
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    29b8:	8008      	strh	r0, [r1, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    29ba:	801a      	strh	r2, [r3, #0]
    29bc:	4770      	bx	lr
		break;
	case (TOP_LINE+VRES):
		video=0;
		break;
	case FIELD_END:
		if (!even){
    29be:	4a2c      	ldr	r2, [pc, #176]	; (2a70 <TIM1_CC_handler+0x138>)
    29c0:	6811      	ldr	r1, [r2, #0]
    29c2:	2900      	cmp	r1, #0
    29c4:	d1e6      	bne.n	2994 <TIM1_CC_handler+0x5c>
			line_count=-1;
    29c6:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    29ca:	6019      	str	r1, [r3, #0]
			even=-even;
    29cc:	6813      	ldr	r3, [r2, #0]
    29ce:	425b      	negs	r3, r3
    29d0:	6013      	str	r3, [r2, #0]
    29d2:	4770      	bx	lr
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    29d4:	4927      	ldr	r1, [pc, #156]	; (2a74 <TIM1_CC_handler+0x13c>)
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    29d6:	4b28      	ldr	r3, [pc, #160]	; (2a78 <TIM1_CC_handler+0x140>)
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    29d8:	f44f 60e5 	mov.w	r0, #1832	; 0x728
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    29dc:	2286      	movs	r2, #134	; 0x86
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    29de:	8008      	strh	r0, [r1, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    29e0:	801a      	strh	r2, [r3, #0]
		break;
    29e2:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    29e4:	2a3b      	cmp	r2, #59	; 0x3b
    29e6:	d10f      	bne.n	2a08 <TIM1_CC_handler+0xd0>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    29e8:	4b24      	ldr	r3, [pc, #144]	; (2a7c <TIM1_CC_handler+0x144>)
    29ea:	2201      	movs	r2, #1
    29ec:	601a      	str	r2, [r3, #0]
		break;
    29ee:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    29f0:	b952      	cbnz	r2, 2a08 <TIM1_CC_handler+0xd0>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    29f2:	4920      	ldr	r1, [pc, #128]	; (2a74 <TIM1_CC_handler+0x13c>)
		*TIMER1_CCR1/=2;
    29f4:	4a20      	ldr	r2, [pc, #128]	; (2a78 <TIM1_CC_handler+0x140>)
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    29f6:	880b      	ldrh	r3, [r1, #0]
    29f8:	f3c3 034e 	ubfx	r3, r3, #1, #15
    29fc:	800b      	strh	r3, [r1, #0]
		*TIMER1_CCR1/=2;
    29fe:	8813      	ldrh	r3, [r2, #0]
    2a00:	f3c3 034e 	ubfx	r3, r3, #1, #15
    2a04:	8013      	strh	r3, [r2, #0]
		break;
    2a06:	4770      	bx	lr
		SPI2->DR=0xaaaa;
		while (SPI2->SR&SPI_SR_BSY);
		SPI2->CR1=SPI_PIXELS;
		SPI2->DR=0;
*/	
		if (video){
    2a08:	4a1c      	ldr	r2, [pc, #112]	; (2a7c <TIM1_CC_handler+0x144>)
    2a0a:	6812      	ldr	r2, [r2, #0]
    2a0c:	2a00      	cmp	r2, #0
    2a0e:	d0c1      	beq.n	2994 <TIM1_CC_handler+0x5c>
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2a10:	681b      	ldr	r3, [r3, #0]
    2a12:	4a1b      	ldr	r2, [pc, #108]	; (2a80 <TIM1_CC_handler+0x148>)
    2a14:	3b3c      	subs	r3, #60	; 0x3c
    2a16:	4913      	ldr	r1, [pc, #76]	; (2a64 <TIM1_CC_handler+0x12c>)
    2a18:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    2a1c:	eb02 03c3 	add.w	r3, r2, r3, lsl #3
			DMA1[DMACH5].cndtr=ROW_SIZE;
    2a20:	2014      	movs	r0, #20
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    2a22:	4a18      	ldr	r2, [pc, #96]	; (2a84 <TIM1_CC_handler+0x14c>)
		SPI2->DR=0;
*/	
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2a24:	60cb      	str	r3, [r1, #12]
			DMA1[DMACH5].cndtr=ROW_SIZE;
    2a26:	6048      	str	r0, [r1, #4]
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    2a28:	8813      	ldrh	r3, [r2, #0]
    2a2a:	b29b      	uxth	r3, r3
    2a2c:	f5b3 7f2f 	cmp.w	r3, #700	; 0x2bc
    2a30:	d204      	bcs.n	2a3c <TIM1_CC_handler+0x104>
    2a32:	8813      	ldrh	r3, [r2, #0]
    2a34:	b29b      	uxth	r3, r3
    2a36:	f5b3 7f2f 	cmp.w	r3, #700	; 0x2bc
    2a3a:	d3fa      	bcc.n	2a32 <TIM1_CC_handler+0xfa>
			_enable_dma();
    2a3c:	4a09      	ldr	r2, [pc, #36]	; (2a64 <TIM1_CC_handler+0x12c>)
    2a3e:	6813      	ldr	r3, [r2, #0]
    2a40:	f043 0301 	orr.w	r3, r3, #1
    2a44:	6013      	str	r3, [r2, #0]
    2a46:	4770      	bx	lr
		break;
	case TOP_LINE-1:
		video=1;
		break;
	case (TOP_LINE+VRES):
		video=0;
    2a48:	4b0c      	ldr	r3, [pc, #48]	; (2a7c <TIM1_CC_handler+0x144>)
    2a4a:	2200      	movs	r2, #0
    2a4c:	601a      	str	r2, [r3, #0]
		break;
    2a4e:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    2a50:	f240 62a1 	movw	r2, #1697	; 0x6a1
    2a54:	4b08      	ldr	r3, [pc, #32]	; (2a78 <TIM1_CC_handler+0x140>)
    2a56:	801a      	strh	r2, [r3, #0]
	    break;
    2a58:	4770      	bx	lr
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
    2a5a:	4b05      	ldr	r3, [pc, #20]	; (2a70 <TIM1_CC_handler+0x138>)
    2a5c:	681b      	ldr	r3, [r3, #0]
    2a5e:	2b00      	cmp	r3, #0
    2a60:	d198      	bne.n	2994 <TIM1_CC_handler+0x5c>
    2a62:	e7a3      	b.n	29ac <TIM1_CC_handler+0x74>
    2a64:	40020058 	.word	0x40020058
    2a68:	20000004 	.word	0x20000004
    2a6c:	40012c10 	.word	0x40012c10
    2a70:	200000e8 	.word	0x200000e8
    2a74:	40012c2c 	.word	0x40012c2c
    2a78:	40012c34 	.word	0x40012c34
    2a7c:	200000e4 	.word	0x200000e4
    2a80:	20000130 	.word	0x20000130
    2a84:	40012c24 	.word	0x40012c24

00002a88 <DMA1CH5_handler>:
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
    2a88:	b480      	push	{r7}
    2a8a:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    2a8c:	4a0a      	ldr	r2, [pc, #40]	; (2ab8 <DMA1CH5_handler+0x30>)
    2a8e:	4b0a      	ldr	r3, [pc, #40]	; (2ab8 <DMA1CH5_handler+0x30>)
    2a90:	685b      	ldr	r3, [r3, #4]
    2a92:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    2a96:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    2a98:	bf00      	nop
    2a9a:	4b08      	ldr	r3, [pc, #32]	; (2abc <DMA1CH5_handler+0x34>)
    2a9c:	891b      	ldrh	r3, [r3, #8]
    2a9e:	b29b      	uxth	r3, r3
    2aa0:	f003 0302 	and.w	r3, r3, #2
    2aa4:	2b00      	cmp	r3, #0
    2aa6:	d0f8      	beq.n	2a9a <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    2aa8:	4b04      	ldr	r3, [pc, #16]	; (2abc <DMA1CH5_handler+0x34>)
    2aaa:	2200      	movs	r2, #0
    2aac:	819a      	strh	r2, [r3, #12]
}
    2aae:	46bd      	mov	sp, r7
    2ab0:	f85d 7b04 	ldr.w	r7, [sp], #4
    2ab4:	4770      	bx	lr
    2ab6:	bf00      	nop
    2ab8:	40020000 	.word	0x40020000
    2abc:	40003800 	.word	0x40003800

00002ac0 <usart_config_port>:

#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 

// configuration dse broches
void usart_config_port(usart_t* channel, gpio_t *port, unsigned flow_ctrl){
    2ac0:	b480      	push	{r7}
    2ac2:	b085      	sub	sp, #20
    2ac4:	af00      	add	r7, sp, #0
    2ac6:	60f8      	str	r0, [r7, #12]
    2ac8:	60b9      	str	r1, [r7, #8]
    2aca:	607a      	str	r2, [r7, #4]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    2acc:	68fb      	ldr	r3, [r7, #12]
    2ace:	4a45      	ldr	r2, [pc, #276]	; (2be4 <usart_config_port+0x124>)
    2ad0:	4293      	cmp	r3, r2
    2ad2:	d058      	beq.n	2b86 <usart_config_port+0xc6>
    2ad4:	4a44      	ldr	r2, [pc, #272]	; (2be8 <usart_config_port+0x128>)
    2ad6:	4293      	cmp	r3, r2
    2ad8:	d003      	beq.n	2ae2 <usart_config_port+0x22>
    2ada:	4a44      	ldr	r2, [pc, #272]	; (2bec <usart_config_port+0x12c>)
    2adc:	4293      	cmp	r3, r2
    2ade:	d029      	beq.n	2b34 <usart_config_port+0x74>
    2ae0:	e07a      	b.n	2bd8 <usart_config_port+0x118>
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
    2ae2:	4a43      	ldr	r2, [pc, #268]	; (2bf0 <usart_config_port+0x130>)
    2ae4:	4b42      	ldr	r3, [pc, #264]	; (2bf0 <usart_config_port+0x130>)
    2ae6:	699b      	ldr	r3, [r3, #24]
    2ae8:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    2aec:	f043 0304 	orr.w	r3, r3, #4
    2af0:	6193      	str	r3, [r2, #24]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    2af2:	687b      	ldr	r3, [r7, #4]
    2af4:	2b01      	cmp	r3, #1
    2af6:	d110      	bne.n	2b1a <usart_config_port+0x5a>
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
    2af8:	68bb      	ldr	r3, [r7, #8]
    2afa:	685b      	ldr	r3, [r3, #4]
    2afc:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    2b00:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    2b04:	68ba      	ldr	r2, [r7, #8]
    2b06:	6053      	str	r3, [r2, #4]
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
    2b08:	68bb      	ldr	r3, [r7, #8]
    2b0a:	685b      	ldr	r3, [r3, #4]
    2b0c:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    2b10:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    2b14:	68ba      	ldr	r2, [r7, #8]
    2b16:	6053      	str	r3, [r2, #4]
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
		}
		break;
    2b18:	e05e      	b.n	2bd8 <usart_config_port+0x118>
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
    2b1a:	68bb      	ldr	r3, [r7, #8]
    2b1c:	685b      	ldr	r3, [r3, #4]
    2b1e:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
    2b22:	68bb      	ldr	r3, [r7, #8]
    2b24:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
    2b26:	68bb      	ldr	r3, [r7, #8]
    2b28:	685b      	ldr	r3, [r3, #4]
    2b2a:	f043 02a0 	orr.w	r2, r3, #160	; 0xa0
    2b2e:	68bb      	ldr	r3, [r7, #8]
    2b30:	605a      	str	r2, [r3, #4]
		}
		break;
    2b32:	e051      	b.n	2bd8 <usart_config_port+0x118>
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    2b34:	4a2e      	ldr	r2, [pc, #184]	; (2bf0 <usart_config_port+0x130>)
    2b36:	4b2e      	ldr	r3, [pc, #184]	; (2bf0 <usart_config_port+0x130>)
    2b38:	69db      	ldr	r3, [r3, #28]
    2b3a:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    2b3e:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    2b40:	4a2b      	ldr	r2, [pc, #172]	; (2bf0 <usart_config_port+0x130>)
    2b42:	4b2b      	ldr	r3, [pc, #172]	; (2bf0 <usart_config_port+0x130>)
    2b44:	699b      	ldr	r3, [r3, #24]
    2b46:	f043 0304 	orr.w	r3, r3, #4
    2b4a:	6193      	str	r3, [r2, #24]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
    2b4c:	687b      	ldr	r3, [r7, #4]
    2b4e:	2b01      	cmp	r3, #1
    2b50:	d10c      	bne.n	2b6c <usart_config_port+0xac>
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
    2b52:	68bb      	ldr	r3, [r7, #8]
    2b54:	681b      	ldr	r3, [r3, #0]
    2b56:	f423 627f 	bic.w	r2, r3, #4080	; 0xff0
    2b5a:	68bb      	ldr	r3, [r7, #8]
    2b5c:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
    2b5e:	68bb      	ldr	r3, [r7, #8]
    2b60:	681b      	ldr	r3, [r3, #0]
    2b62:	f443 622a 	orr.w	r2, r3, #2720	; 0xaa0
    2b66:	68bb      	ldr	r3, [r7, #8]
    2b68:	601a      	str	r2, [r3, #0]
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
		}
		break;
    2b6a:	e035      	b.n	2bd8 <usart_config_port+0x118>
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
    2b6c:	68bb      	ldr	r3, [r7, #8]
    2b6e:	681b      	ldr	r3, [r3, #0]
    2b70:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    2b74:	68bb      	ldr	r3, [r7, #8]
    2b76:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
    2b78:	68bb      	ldr	r3, [r7, #8]
    2b7a:	681b      	ldr	r3, [r3, #0]
    2b7c:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    2b80:	68bb      	ldr	r3, [r7, #8]
    2b82:	601a      	str	r2, [r3, #0]
		}
		break;
    2b84:	e028      	b.n	2bd8 <usart_config_port+0x118>
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
    2b86:	4a1a      	ldr	r2, [pc, #104]	; (2bf0 <usart_config_port+0x130>)
    2b88:	4b19      	ldr	r3, [pc, #100]	; (2bf0 <usart_config_port+0x130>)
    2b8a:	69db      	ldr	r3, [r3, #28]
    2b8c:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    2b90:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    2b92:	4a17      	ldr	r2, [pc, #92]	; (2bf0 <usart_config_port+0x130>)
    2b94:	4b16      	ldr	r3, [pc, #88]	; (2bf0 <usart_config_port+0x130>)
    2b96:	699b      	ldr	r3, [r3, #24]
    2b98:	f043 0308 	orr.w	r3, r3, #8
    2b9c:	6193      	str	r3, [r2, #24]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    2b9e:	687b      	ldr	r3, [r7, #4]
    2ba0:	2b01      	cmp	r3, #1
    2ba2:	d10c      	bne.n	2bbe <usart_config_port+0xfe>
			port->CR[1]&=~((15<<((USART3_TX_PIN-8)*4))|(15<<((USART3_RTS_PIN-8)*4)));
    2ba4:	68bb      	ldr	r3, [r7, #8]
    2ba6:	685b      	ldr	r3, [r3, #4]
    2ba8:	f023 220f 	bic.w	r2, r3, #251662080	; 0xf000f00
    2bac:	68bb      	ldr	r3, [r7, #8]
    2bae:	605a      	str	r2, [r3, #4]
			port->CR[1]|=(0xA<<((USART3_TX_PIN-8)*4))|(0xA<<((USART3_RTS_PIN-8)*4));
    2bb0:	68bb      	ldr	r3, [r7, #8]
    2bb2:	685b      	ldr	r3, [r3, #4]
    2bb4:	f043 220a 	orr.w	r2, r3, #167774720	; 0xa000a00
    2bb8:	68bb      	ldr	r3, [r7, #8]
    2bba:	605a      	str	r2, [r3, #4]
    2bbc:	e00b      	b.n	2bd6 <usart_config_port+0x116>
		}else{
			port->CR[1]&=~(15<<((USART3_TX_PIN-8)*4));
    2bbe:	68bb      	ldr	r3, [r7, #8]
    2bc0:	685b      	ldr	r3, [r3, #4]
    2bc2:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    2bc6:	68bb      	ldr	r3, [r7, #8]
    2bc8:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART3_TX_PIN-8)*4);
    2bca:	68bb      	ldr	r3, [r7, #8]
    2bcc:	685b      	ldr	r3, [r3, #4]
    2bce:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    2bd2:	68bb      	ldr	r3, [r7, #8]
    2bd4:	605a      	str	r2, [r3, #4]
		}
		break;
    2bd6:	bf00      	nop
	}
}
    2bd8:	3714      	adds	r7, #20
    2bda:	46bd      	mov	sp, r7
    2bdc:	f85d 7b04 	ldr.w	r7, [sp], #4
    2be0:	4770      	bx	lr
    2be2:	bf00      	nop
    2be4:	40004800 	.word	0x40004800
    2be8:	40013800 	.word	0x40013800
    2bec:	40004400 	.word	0x40004400
    2bf0:	40021000 	.word	0x40021000

00002bf4 <usart_set_baud>:

// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
    2bf4:	b480      	push	{r7}
    2bf6:	b085      	sub	sp, #20
    2bf8:	af00      	add	r7, sp, #0
    2bfa:	6078      	str	r0, [r7, #4]
    2bfc:	6039      	str	r1, [r7, #0]
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
    2bfe:	687b      	ldr	r3, [r7, #4]
    2c00:	4a15      	ldr	r2, [pc, #84]	; (2c58 <usart_set_baud+0x64>)
    2c02:	4293      	cmp	r3, r2
    2c04:	d110      	bne.n	2c28 <usart_set_baud+0x34>
		rate=(FAPB2/baud/16)<<4;
    2c06:	4a15      	ldr	r2, [pc, #84]	; (2c5c <usart_set_baud+0x68>)
    2c08:	683b      	ldr	r3, [r7, #0]
    2c0a:	fbb2 f3f3 	udiv	r3, r2, r3
    2c0e:	091b      	lsrs	r3, r3, #4
    2c10:	011b      	lsls	r3, r3, #4
    2c12:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    2c14:	4a11      	ldr	r2, [pc, #68]	; (2c5c <usart_set_baud+0x68>)
    2c16:	683b      	ldr	r3, [r7, #0]
    2c18:	fbb2 f3f3 	udiv	r3, r2, r3
    2c1c:	f003 030f 	and.w	r3, r3, #15
    2c20:	68fa      	ldr	r2, [r7, #12]
    2c22:	4313      	orrs	r3, r2
    2c24:	60fb      	str	r3, [r7, #12]
    2c26:	e00f      	b.n	2c48 <usart_set_baud+0x54>
	}else{
		rate=(FAPB1/baud/16)<<4;
    2c28:	4a0d      	ldr	r2, [pc, #52]	; (2c60 <usart_set_baud+0x6c>)
    2c2a:	683b      	ldr	r3, [r7, #0]
    2c2c:	fbb2 f3f3 	udiv	r3, r2, r3
    2c30:	091b      	lsrs	r3, r3, #4
    2c32:	011b      	lsls	r3, r3, #4
    2c34:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    2c36:	4a0a      	ldr	r2, [pc, #40]	; (2c60 <usart_set_baud+0x6c>)
    2c38:	683b      	ldr	r3, [r7, #0]
    2c3a:	fbb2 f3f3 	udiv	r3, r2, r3
    2c3e:	f003 030f 	and.w	r3, r3, #15
    2c42:	68fa      	ldr	r2, [r7, #12]
    2c44:	4313      	orrs	r3, r2
    2c46:	60fb      	str	r3, [r7, #12]
	}
	channel->BRR=rate;
    2c48:	687b      	ldr	r3, [r7, #4]
    2c4a:	68fa      	ldr	r2, [r7, #12]
    2c4c:	609a      	str	r2, [r3, #8]
}
    2c4e:	3714      	adds	r7, #20
    2c50:	46bd      	mov	sp, r7
    2c52:	f85d 7b04 	ldr.w	r7, [sp], #4
    2c56:	4770      	bx	lr
    2c58:	40013800 	.word	0x40013800
    2c5c:	0369e994 	.word	0x0369e994
    2c60:	01b4f4ca 	.word	0x01b4f4ca

00002c64 <usart_comm_dir>:

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
    2c64:	b480      	push	{r7}
    2c66:	b083      	sub	sp, #12
    2c68:	af00      	add	r7, sp, #0
    2c6a:	6078      	str	r0, [r7, #4]
    2c6c:	6039      	str	r1, [r7, #0]
	channel->CR1&=USART_CR1_DIR_MASK;
    2c6e:	687b      	ldr	r3, [r7, #4]
    2c70:	68db      	ldr	r3, [r3, #12]
    2c72:	f023 020c 	bic.w	r2, r3, #12
    2c76:	687b      	ldr	r3, [r7, #4]
    2c78:	60da      	str	r2, [r3, #12]
	channel->CR1|=direction<<USART_CR1_DIR_POS;
    2c7a:	687b      	ldr	r3, [r7, #4]
    2c7c:	68da      	ldr	r2, [r3, #12]
    2c7e:	683b      	ldr	r3, [r7, #0]
    2c80:	009b      	lsls	r3, r3, #2
    2c82:	431a      	orrs	r2, r3
    2c84:	687b      	ldr	r3, [r7, #4]
    2c86:	60da      	str	r2, [r3, #12]
}
    2c88:	370c      	adds	r7, #12
    2c8a:	46bd      	mov	sp, r7
    2c8c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2c90:	4770      	bx	lr
    2c92:	bf00      	nop

00002c94 <usart_open_channel>:


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
    2c94:	b580      	push	{r7, lr}
    2c96:	b084      	sub	sp, #16
    2c98:	af00      	add	r7, sp, #0
    2c9a:	60f8      	str	r0, [r7, #12]
    2c9c:	60b9      	str	r1, [r7, #8]
    2c9e:	607a      	str	r2, [r7, #4]
    2ca0:	603b      	str	r3, [r7, #0]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    2ca2:	68fb      	ldr	r3, [r7, #12]
    2ca4:	4a32      	ldr	r2, [pc, #200]	; (2d70 <usart_open_channel+0xdc>)
    2ca6:	4293      	cmp	r3, r2
    2ca8:	d020      	beq.n	2cec <usart_open_channel+0x58>
    2caa:	4a32      	ldr	r2, [pc, #200]	; (2d74 <usart_open_channel+0xe0>)
    2cac:	4293      	cmp	r3, r2
    2cae:	d003      	beq.n	2cb8 <usart_open_channel+0x24>
    2cb0:	4a31      	ldr	r2, [pc, #196]	; (2d78 <usart_open_channel+0xe4>)
    2cb2:	4293      	cmp	r3, r2
    2cb4:	d00d      	beq.n	2cd2 <usart_open_channel+0x3e>
    2cb6:	e026      	b.n	2d06 <usart_open_channel+0x72>
	case (uint32_t)USART1:
		usart_config_port(channel,USART1_PORT,flow_ctrl);
    2cb8:	68f8      	ldr	r0, [r7, #12]
    2cba:	4930      	ldr	r1, [pc, #192]	; (2d7c <usart_open_channel+0xe8>)
    2cbc:	69ba      	ldr	r2, [r7, #24]
    2cbe:	f7ff feff 	bl	2ac0 <usart_config_port>
		set_int_priority(IRQ_USART1,7);
    2cc2:	2025      	movs	r0, #37	; 0x25
    2cc4:	2107      	movs	r1, #7
    2cc6:	f7ff fbd9 	bl	247c <set_int_priority>
		enable_interrupt(IRQ_USART1);
    2cca:	2025      	movs	r0, #37	; 0x25
    2ccc:	f7ff fb1a 	bl	2304 <enable_interrupt>
		break;
    2cd0:	e019      	b.n	2d06 <usart_open_channel+0x72>
	case (uint32_t)USART2:
		usart_config_port(channel,USART2_PORT,flow_ctrl);
    2cd2:	68f8      	ldr	r0, [r7, #12]
    2cd4:	4929      	ldr	r1, [pc, #164]	; (2d7c <usart_open_channel+0xe8>)
    2cd6:	69ba      	ldr	r2, [r7, #24]
    2cd8:	f7ff fef2 	bl	2ac0 <usart_config_port>
		set_int_priority(IRQ_USART2,7);
    2cdc:	2026      	movs	r0, #38	; 0x26
    2cde:	2107      	movs	r1, #7
    2ce0:	f7ff fbcc 	bl	247c <set_int_priority>
		enable_interrupt(IRQ_USART2);
    2ce4:	2026      	movs	r0, #38	; 0x26
    2ce6:	f7ff fb0d 	bl	2304 <enable_interrupt>
		break;
    2cea:	e00c      	b.n	2d06 <usart_open_channel+0x72>
	case (uint32_t)USART3:
		usart_config_port(channel,USART3_PORT,flow_ctrl);
    2cec:	68f8      	ldr	r0, [r7, #12]
    2cee:	4924      	ldr	r1, [pc, #144]	; (2d80 <usart_open_channel+0xec>)
    2cf0:	69ba      	ldr	r2, [r7, #24]
    2cf2:	f7ff fee5 	bl	2ac0 <usart_config_port>
		set_int_priority(IRQ_USART3,7);
    2cf6:	2027      	movs	r0, #39	; 0x27
    2cf8:	2107      	movs	r1, #7
    2cfa:	f7ff fbbf 	bl	247c <set_int_priority>
		enable_interrupt(IRQ_USART3);
    2cfe:	2027      	movs	r0, #39	; 0x27
    2d00:	f7ff fb00 	bl	2304 <enable_interrupt>
		break;
    2d04:	bf00      	nop
	}
	if (flow_ctrl==FLOW_HARD){
    2d06:	69bb      	ldr	r3, [r7, #24]
    2d08:	2b01      	cmp	r3, #1
    2d0a:	d103      	bne.n	2d14 <usart_open_channel+0x80>
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    2d0c:	68fb      	ldr	r3, [r7, #12]
    2d0e:	f44f 7240 	mov.w	r2, #768	; 0x300
    2d12:	615a      	str	r2, [r3, #20]
	}
	usart_comm_dir(channel,dir);
    2d14:	68f8      	ldr	r0, [r7, #12]
    2d16:	6839      	ldr	r1, [r7, #0]
    2d18:	f7ff ffa4 	bl	2c64 <usart_comm_dir>
	switch (parity){
    2d1c:	687b      	ldr	r3, [r7, #4]
    2d1e:	2b01      	cmp	r3, #1
    2d20:	d00b      	beq.n	2d3a <usart_open_channel+0xa6>
    2d22:	2b01      	cmp	r3, #1
    2d24:	d302      	bcc.n	2d2c <usart_open_channel+0x98>
    2d26:	2b02      	cmp	r3, #2
    2d28:	d00e      	beq.n	2d48 <usart_open_channel+0xb4>
    2d2a:	e014      	b.n	2d56 <usart_open_channel+0xc2>
	case PARITY_NONE:
		channel->CR1|=USART_CR1_RXNEIE;
    2d2c:	68fb      	ldr	r3, [r7, #12]
    2d2e:	68db      	ldr	r3, [r3, #12]
    2d30:	f043 0220 	orr.w	r2, r3, #32
    2d34:	68fb      	ldr	r3, [r7, #12]
    2d36:	60da      	str	r2, [r3, #12]
		break;
    2d38:	e00d      	b.n	2d56 <usart_open_channel+0xc2>
	case PARITY_ODD:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS|USART_CR1_RXNEIE;
    2d3a:	68fb      	ldr	r3, [r7, #12]
    2d3c:	68db      	ldr	r3, [r3, #12]
    2d3e:	f443 62e4 	orr.w	r2, r3, #1824	; 0x720
    2d42:	68fb      	ldr	r3, [r7, #12]
    2d44:	60da      	str	r2, [r3, #12]
		break;
    2d46:	e006      	b.n	2d56 <usart_open_channel+0xc2>
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_RXNEIE;
    2d48:	68fb      	ldr	r3, [r7, #12]
    2d4a:	68db      	ldr	r3, [r3, #12]
    2d4c:	f443 62a4 	orr.w	r2, r3, #1312	; 0x520
    2d50:	68fb      	ldr	r3, [r7, #12]
    2d52:	60da      	str	r2, [r3, #12]
		break;
    2d54:	bf00      	nop
    }
	usart_set_baud(channel,baud);
    2d56:	68f8      	ldr	r0, [r7, #12]
    2d58:	68b9      	ldr	r1, [r7, #8]
    2d5a:	f7ff ff4b 	bl	2bf4 <usart_set_baud>
    channel->CR1|=USART_CR1_UE;
    2d5e:	68fb      	ldr	r3, [r7, #12]
    2d60:	68db      	ldr	r3, [r3, #12]
    2d62:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
    2d66:	68fb      	ldr	r3, [r7, #12]
    2d68:	60da      	str	r2, [r3, #12]
}
    2d6a:	3710      	adds	r7, #16
    2d6c:	46bd      	mov	sp, r7
    2d6e:	bd80      	pop	{r7, pc}
    2d70:	40004800 	.word	0x40004800
    2d74:	40013800 	.word	0x40013800
    2d78:	40004400 	.word	0x40004400
    2d7c:	40010800 	.word	0x40010800
    2d80:	40010c00 	.word	0x40010c00

00002d84 <usart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
    2d84:	b480      	push	{r7}
    2d86:	b083      	sub	sp, #12
    2d88:	af00      	add	r7, sp, #0
    2d8a:	6078      	str	r0, [r7, #4]
	return channel->SR&USART_SR_RXNE;
    2d8c:	687b      	ldr	r3, [r7, #4]
    2d8e:	681b      	ldr	r3, [r3, #0]
    2d90:	f003 0320 	and.w	r3, r3, #32
}
    2d94:	4618      	mov	r0, r3
    2d96:	370c      	adds	r7, #12
    2d98:	46bd      	mov	sp, r7
    2d9a:	f85d 7b04 	ldr.w	r7, [sp], #4
    2d9e:	4770      	bx	lr

00002da0 <usart_getc>:

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
    2da0:	b480      	push	{r7}
    2da2:	b083      	sub	sp, #12
    2da4:	af00      	add	r7, sp, #0
    2da6:	6078      	str	r0, [r7, #4]
	return channel->DR;
    2da8:	687b      	ldr	r3, [r7, #4]
    2daa:	685b      	ldr	r3, [r3, #4]
    2dac:	b2db      	uxtb	r3, r3
}
    2dae:	4618      	mov	r0, r3
    2db0:	370c      	adds	r7, #12
    2db2:	46bd      	mov	sp, r7
    2db4:	f85d 7b04 	ldr.w	r7, [sp], #4
    2db8:	4770      	bx	lr
    2dba:	bf00      	nop

00002dbc <usart_putc>:

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
    2dbc:	b480      	push	{r7}
    2dbe:	b083      	sub	sp, #12
    2dc0:	af00      	add	r7, sp, #0
    2dc2:	6078      	str	r0, [r7, #4]
    2dc4:	460b      	mov	r3, r1
    2dc6:	70fb      	strb	r3, [r7, #3]
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
    2dc8:	bf00      	nop
    2dca:	687b      	ldr	r3, [r7, #4]
    2dcc:	681b      	ldr	r3, [r3, #0]
    2dce:	f003 0380 	and.w	r3, r3, #128	; 0x80
    2dd2:	2b00      	cmp	r3, #0
    2dd4:	d0f9      	beq.n	2dca <usart_putc+0xe>
	channel->DR=c;
    2dd6:	78fa      	ldrb	r2, [r7, #3]
    2dd8:	687b      	ldr	r3, [r7, #4]
    2dda:	605a      	str	r2, [r3, #4]
}
    2ddc:	370c      	adds	r7, #12
    2dde:	46bd      	mov	sp, r7
    2de0:	f85d 7b04 	ldr.w	r7, [sp], #4
    2de4:	4770      	bx	lr
    2de6:	bf00      	nop

00002de8 <usart_cts>:


int usart_cts(usart_t* channel){
    2de8:	b480      	push	{r7}
    2dea:	b085      	sub	sp, #20
    2dec:	af00      	add	r7, sp, #0
    2dee:	6078      	str	r0, [r7, #4]
	int cts;
	switch ((uint32_t)channel){
    2df0:	687b      	ldr	r3, [r7, #4]
    2df2:	4a11      	ldr	r2, [pc, #68]	; (2e38 <usart_cts+0x50>)
    2df4:	4293      	cmp	r3, r2
    2df6:	d012      	beq.n	2e1e <usart_cts+0x36>
    2df8:	4a10      	ldr	r2, [pc, #64]	; (2e3c <usart_cts+0x54>)
    2dfa:	4293      	cmp	r3, r2
    2dfc:	d003      	beq.n	2e06 <usart_cts+0x1e>
    2dfe:	4a10      	ldr	r2, [pc, #64]	; (2e40 <usart_cts+0x58>)
    2e00:	4293      	cmp	r3, r2
    2e02:	d006      	beq.n	2e12 <usart_cts+0x2a>
    2e04:	e011      	b.n	2e2a <usart_cts+0x42>
		case (uint32_t)USART1:
			cts=USART1_PORT->IDR&USART1_CTS_BIT;
    2e06:	4b0f      	ldr	r3, [pc, #60]	; (2e44 <usart_cts+0x5c>)
    2e08:	689b      	ldr	r3, [r3, #8]
    2e0a:	f403 6300 	and.w	r3, r3, #2048	; 0x800
    2e0e:	60fb      	str	r3, [r7, #12]
			break;
    2e10:	e00b      	b.n	2e2a <usart_cts+0x42>
		case (uint32_t)USART2:
			cts=USART2_PORT->IDR&USART2_CTS_BIT;
    2e12:	4b0c      	ldr	r3, [pc, #48]	; (2e44 <usart_cts+0x5c>)
    2e14:	689b      	ldr	r3, [r3, #8]
    2e16:	f003 0301 	and.w	r3, r3, #1
    2e1a:	60fb      	str	r3, [r7, #12]
			break;
    2e1c:	e005      	b.n	2e2a <usart_cts+0x42>
		case (uint32_t)USART3:
			cts=USART3_PORT->IDR&USART3_CTS_BIT;
    2e1e:	4b0a      	ldr	r3, [pc, #40]	; (2e48 <usart_cts+0x60>)
    2e20:	689b      	ldr	r3, [r3, #8]
    2e22:	f403 5300 	and.w	r3, r3, #8192	; 0x2000
    2e26:	60fb      	str	r3, [r7, #12]
			break;
    2e28:	bf00      	nop
	}
	return cts;
    2e2a:	68fb      	ldr	r3, [r7, #12]
}
    2e2c:	4618      	mov	r0, r3
    2e2e:	3714      	adds	r7, #20
    2e30:	46bd      	mov	sp, r7
    2e32:	f85d 7b04 	ldr.w	r7, [sp], #4
    2e36:	4770      	bx	lr
    2e38:	40004800 	.word	0x40004800
    2e3c:	40013800 	.word	0x40013800
    2e40:	40004400 	.word	0x40004400
    2e44:	40010800 	.word	0x40010800
    2e48:	40010c00 	.word	0x40010c00

00002e4c <vt_init>:

#include "../include/blue_pill.h"
#include "vt100.h"
#include "console.h"

void vt_init(){
    2e4c:	b580      	push	{r7, lr}
    2e4e:	b082      	sub	sp, #8
    2e50:	af02      	add	r7, sp, #8
	usart_open_channel(VT_USART,115200,PARITY_NONE,USART_DIR_BIDI,FLOW_HARD);
    2e52:	2301      	movs	r3, #1
    2e54:	9300      	str	r3, [sp, #0]
    2e56:	4804      	ldr	r0, [pc, #16]	; (2e68 <vt_init+0x1c>)
    2e58:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
    2e5c:	2200      	movs	r2, #0
    2e5e:	2303      	movs	r3, #3
    2e60:	f7ff ff18 	bl	2c94 <usart_open_channel>
}
    2e64:	46bd      	mov	sp, r7
    2e66:	bd80      	pop	{r7, pc}
    2e68:	40004400 	.word	0x40004400

00002e6c <vt_putc>:

void vt_putc(char c){
    2e6c:	b580      	push	{r7, lr}
    2e6e:	b082      	sub	sp, #8
    2e70:	af00      	add	r7, sp, #0
    2e72:	4603      	mov	r3, r0
    2e74:	71fb      	strb	r3, [r7, #7]
	usart_putc(VT_USART,c);
    2e76:	79fb      	ldrb	r3, [r7, #7]
    2e78:	4803      	ldr	r0, [pc, #12]	; (2e88 <vt_putc+0x1c>)
    2e7a:	4619      	mov	r1, r3
    2e7c:	f7ff ff9e 	bl	2dbc <usart_putc>
}
    2e80:	3708      	adds	r7, #8
    2e82:	46bd      	mov	sp, r7
    2e84:	bd80      	pop	{r7, pc}
    2e86:	bf00      	nop
    2e88:	40004400 	.word	0x40004400

00002e8c <vt_del_back>:

void vt_del_back(){
    2e8c:	b580      	push	{r7, lr}
    2e8e:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,BS);
    2e90:	4806      	ldr	r0, [pc, #24]	; (2eac <vt_del_back+0x20>)
    2e92:	2108      	movs	r1, #8
    2e94:	f7ff ff92 	bl	2dbc <usart_putc>
	usart_putc(VT_USART,SPACE);
    2e98:	4804      	ldr	r0, [pc, #16]	; (2eac <vt_del_back+0x20>)
    2e9a:	2120      	movs	r1, #32
    2e9c:	f7ff ff8e 	bl	2dbc <usart_putc>
	usart_putc(VT_USART,BS);
    2ea0:	4802      	ldr	r0, [pc, #8]	; (2eac <vt_del_back+0x20>)
    2ea2:	2108      	movs	r1, #8
    2ea4:	f7ff ff8a 	bl	2dbc <usart_putc>
}
    2ea8:	bd80      	pop	{r7, pc}
    2eaa:	bf00      	nop
    2eac:	40004400 	.word	0x40004400

00002eb0 <vt_esc_seq>:

static void vt_esc_seq(){
    2eb0:	b580      	push	{r7, lr}
    2eb2:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,ESC);
    2eb4:	4804      	ldr	r0, [pc, #16]	; (2ec8 <vt_esc_seq+0x18>)
    2eb6:	211b      	movs	r1, #27
    2eb8:	f7ff ff80 	bl	2dbc <usart_putc>
	usart_putc(VT_USART,'[');
    2ebc:	4802      	ldr	r0, [pc, #8]	; (2ec8 <vt_esc_seq+0x18>)
    2ebe:	215b      	movs	r1, #91	; 0x5b
    2ec0:	f7ff ff7c 	bl	2dbc <usart_putc>
}
    2ec4:	bd80      	pop	{r7, pc}
    2ec6:	bf00      	nop
    2ec8:	40004400 	.word	0x40004400

00002ecc <vt_cls>:


// vide l'écran de la console
void vt_cls(){
    2ecc:	b580      	push	{r7, lr}
    2ece:	af00      	add	r7, sp, #0
	vt_esc_seq();
    2ed0:	f7ff ffee 	bl	2eb0 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    2ed4:	4804      	ldr	r0, [pc, #16]	; (2ee8 <vt_cls+0x1c>)
    2ed6:	2132      	movs	r1, #50	; 0x32
    2ed8:	f7ff ff70 	bl	2dbc <usart_putc>
	usart_putc(VT_USART,'J');
    2edc:	4802      	ldr	r0, [pc, #8]	; (2ee8 <vt_cls+0x1c>)
    2ede:	214a      	movs	r1, #74	; 0x4a
    2ee0:	f7ff ff6c 	bl	2dbc <usart_putc>
}
    2ee4:	bd80      	pop	{r7, pc}
    2ee6:	bf00      	nop
    2ee8:	40004400 	.word	0x40004400

00002eec <vt_clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void vt_clear_line(unsigned n){
    2eec:	b580      	push	{r7, lr}
    2eee:	b082      	sub	sp, #8
    2ef0:	af00      	add	r7, sp, #0
    2ef2:	6078      	str	r0, [r7, #4]
	vt_esc_seq();
    2ef4:	f7ff ffdc 	bl	2eb0 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    2ef8:	480a      	ldr	r0, [pc, #40]	; (2f24 <vt_clear_line+0x38>)
    2efa:	2132      	movs	r1, #50	; 0x32
    2efc:	f7ff ff5e 	bl	2dbc <usart_putc>
	usart_putc(VT_USART,'K');
    2f00:	4808      	ldr	r0, [pc, #32]	; (2f24 <vt_clear_line+0x38>)
    2f02:	214b      	movs	r1, #75	; 0x4b
    2f04:	f7ff ff5a 	bl	2dbc <usart_putc>
	while (n){usart_putc(VT_USART,BS);n--;}
    2f08:	e006      	b.n	2f18 <vt_clear_line+0x2c>
    2f0a:	4806      	ldr	r0, [pc, #24]	; (2f24 <vt_clear_line+0x38>)
    2f0c:	2108      	movs	r1, #8
    2f0e:	f7ff ff55 	bl	2dbc <usart_putc>
    2f12:	687b      	ldr	r3, [r7, #4]
    2f14:	3b01      	subs	r3, #1
    2f16:	607b      	str	r3, [r7, #4]
    2f18:	687b      	ldr	r3, [r7, #4]
    2f1a:	2b00      	cmp	r3, #0
    2f1c:	d1f5      	bne.n	2f0a <vt_clear_line+0x1e>
}
    2f1e:	3708      	adds	r7, #8
    2f20:	46bd      	mov	sp, r7
    2f22:	bd80      	pop	{r7, pc}
    2f24:	40004400 	.word	0x40004400

00002f28 <vt_ready>:

// vérifie si le terminal est prêt
int vt_ready(){
    2f28:	b480      	push	{r7}
    2f2a:	af00      	add	r7, sp, #0
	return !(VT_PORT->IDR&VT_CTS_BIT);
    2f2c:	4b06      	ldr	r3, [pc, #24]	; (2f48 <vt_ready+0x20>)
    2f2e:	689b      	ldr	r3, [r3, #8]
    2f30:	f003 0301 	and.w	r3, r3, #1
    2f34:	2b00      	cmp	r3, #0
    2f36:	bf0c      	ite	eq
    2f38:	2301      	moveq	r3, #1
    2f3a:	2300      	movne	r3, #0
    2f3c:	b2db      	uxtb	r3, r3
}
    2f3e:	4618      	mov	r0, r3
    2f40:	46bd      	mov	sp, r7
    2f42:	f85d 7b04 	ldr.w	r7, [sp], #4
    2f46:	4770      	bx	lr
    2f48:	40010800 	.word	0x40010800

00002f4c <USART2_handler>:

// interruption serial console
void VT_handler(){
    2f4c:	b580      	push	{r7, lr}
    2f4e:	af00      	add	r7, sp, #0
	if ((con.dev==SERIAL) && (VT_USART->SR&USART_SR_RXNE)){
    2f50:	4b08      	ldr	r3, [pc, #32]	; (2f74 <USART2_handler+0x28>)
    2f52:	781b      	ldrb	r3, [r3, #0]
    2f54:	2b01      	cmp	r3, #1
    2f56:	d10c      	bne.n	2f72 <USART2_handler+0x26>
    2f58:	4b07      	ldr	r3, [pc, #28]	; (2f78 <USART2_handler+0x2c>)
    2f5a:	681b      	ldr	r3, [r3, #0]
    2f5c:	f003 0320 	and.w	r3, r3, #32
    2f60:	2b00      	cmp	r3, #0
    2f62:	d006      	beq.n	2f72 <USART2_handler+0x26>
		con.insert(VT_USART->DR);
    2f64:	4b03      	ldr	r3, [pc, #12]	; (2f74 <USART2_handler+0x28>)
    2f66:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    2f68:	4a03      	ldr	r2, [pc, #12]	; (2f78 <USART2_handler+0x2c>)
    2f6a:	6852      	ldr	r2, [r2, #4]
    2f6c:	b2d2      	uxtb	r2, r2
    2f6e:	4610      	mov	r0, r2
    2f70:	4798      	blx	r3
	}
}
    2f72:	bd80      	pop	{r7, pc}
    2f74:	200000f0 	.word	0x200000f0
    2f78:	40004400 	.word	0x40004400

Disassembly of section .user_code:

00003800 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    3800:	b480      	push	{r7}
    3802:	b085      	sub	sp, #20
    3804:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    3806:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    380a:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    380c:	2300      	movs	r3, #0
    380e:	71fb      	strb	r3, [r7, #7]
	
	
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    3810:	2300      	movs	r3, #0
    3812:	2200      	movs	r2, #0
    3814:	4618      	mov	r0, r3
    3816:	4611      	mov	r1, r2
    3818:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    381a:	f107 030c 	add.w	r3, r7, #12
    381e:	2200      	movs	r2, #0
    3820:	4618      	mov	r0, r3
    3822:	4611      	mov	r1, r2
    3824:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    3826:	f107 0308 	add.w	r3, r7, #8
    382a:	2200      	movs	r2, #0
    382c:	4618      	mov	r0, r3
    382e:	4611      	mov	r1, r2
    3830:	df04      	svc	4
    3832:	68bb      	ldr	r3, [r7, #8]
    3834:	2b00      	cmp	r3, #0
    3836:	d1f6      	bne.n	3826 <blink+0x26>
		_svc_call(SVC_LED_ON,NUL,NUL);
    3838:	2300      	movs	r3, #0
    383a:	2200      	movs	r2, #0
    383c:	4618      	mov	r0, r3
    383e:	4611      	mov	r1, r2
    3840:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    3842:	f107 030c 	add.w	r3, r7, #12
    3846:	2200      	movs	r2, #0
    3848:	4618      	mov	r0, r3
    384a:	4611      	mov	r1, r2
    384c:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    384e:	f107 0308 	add.w	r3, r7, #8
    3852:	2200      	movs	r2, #0
    3854:	4618      	mov	r0, r3
    3856:	4611      	mov	r1, r2
    3858:	df04      	svc	4
    385a:	68bb      	ldr	r3, [r7, #8]
    385c:	2b00      	cmp	r3, #0
    385e:	d1f6      	bne.n	384e <blink+0x4e>
		_svc_call(SVC_CONIN,&c,NUL);
    3860:	1dfb      	adds	r3, r7, #7
    3862:	2200      	movs	r2, #0
    3864:	4618      	mov	r0, r3
    3866:	4611      	mov	r1, r2
    3868:	df05      	svc	5
		if (c) break;
    386a:	79fb      	ldrb	r3, [r7, #7]
    386c:	b2db      	uxtb	r3, r3
    386e:	2b00      	cmp	r3, #0
    3870:	d000      	beq.n	3874 <blink+0x74>
    3872:	e000      	b.n	3876 <blink+0x76>
	}
    3874:	e7cc      	b.n	3810 <blink+0x10>
}
    3876:	3714      	adds	r7, #20
    3878:	46bd      	mov	sp, r7
    387a:	f85d 7b04 	ldr.w	r7, [sp], #4
    387e:	4770      	bx	lr
