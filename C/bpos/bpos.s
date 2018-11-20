
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 45 27 00 00     i...m...q...E'..
      20:	45 27 00 00 45 27 00 00 45 27 00 00 5d 05 00 00     E'..E'..E'..]...
      30:	45 27 00 00 45 27 00 00 79 02 00 00 1d 28 00 00     E'..E'..y....(..
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 45 27 00 00 45 27 00 00 5d 2b 00 00     ....E'..E'..]+..
      80:	45 27 00 00 45 27 00 00 45 27 00 00 45 27 00 00     E'..E'..E'..E'..
      90:	45 27 00 00 45 27 00 00 45 27 00 00 75 21 00 00     E'..E'..E'..u!..
      a0:	45 27 00 00 45 27 00 00 45 27 00 00 e9 29 00 00     E'..E'..E'...)..
      b0:	dd 22 00 00 c5 02 00 00 c5 1c 00 00 45 27 00 00     ."..........E'..
      c0:	45 27 00 00 45 27 00 00 45 27 00 00 45 27 00 00     E'..E'..E'..E'..
      d0:	45 27 00 00 cd 02 00 00 25 30 00 00 d5 02 00 00     E'......%0......
      e0:	45 27 00 00 45 27 00 00 45 27 00 00 45 27 00 00     E'..E'..E'..E'..
      f0:	45 27 00 00 45 27 00 00 45 27 00 00 45 27 00 00     E'..E'..E'..E'..
     100:	45 27 00 00 45 27 00 00 45 27 00 00 45 27 00 00     E'..E'..E'..E'..
     110:	45 27 00 00 45 27 00 00 45 27 00 00 45 27 00 00     E'..E'..E'..E'..
     120:	45 27 00 00 45 27 00 00 45 27 00 00 45 27 00 00     E'..E'..E'..E'..

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
     1b0:	f000 feba 	bl	f28 <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	20000008 	.word	0x20000008
     1c0:	200026b0 	.word	0x200026b0
     1c4:	00003890 	.word	0x00003890
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
     208:	f002 faa4 	bl	2754 <print_fault>
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
     21e:	f002 fa99 	bl	2754 <print_fault>
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
     234:	f002 fa8e 	bl	2754 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f002 fa89 	bl	2754 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	00003710 	.word	0x00003710
     258:	00003728 	.word	0x00003728
     25c:	00003734 	.word	0x00003734
     260:	00003744 	.word	0x00003744

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f002 fa6e 	bl	2744 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f002 fa6c 	bl	2744 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f002 fa6a 	bl	2744 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f002 fa68 	bl	2744 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f002 fa66 	bl	2744 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f002 fa64 	bl	2744 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f002 fa62 	bl	2744 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f002 fa60 	bl	2744 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f002 fa5e 	bl	2744 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f002 fa5c 	bl	2744 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f002 fa5a 	bl	2744 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f002 fa58 	bl	2744 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f002 fa56 	bl	2744 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f002 fa54 	bl	2744 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f002 fa52 	bl	2744 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f002 fa50 	bl	2744 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f002 fa4e 	bl	2744 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f002 fa4c 	bl	2744 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f002 fa4a 	bl	2744 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f002 fa48 	bl	2744 <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f002 fa46 	bl	2744 <reset_mcu>
_default_handler(EXTI9_5_handler) // 23
     2b8:	f002 fa44 	bl	2744 <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2bc:	f002 fa42 	bl	2744 <reset_mcu>
_default_handler(TIM2_handler) // 28
     2c0:	f002 fa40 	bl	2744 <reset_mcu>

000002c4 <TIM3_handler>:
_default_handler(TIM3_handler) // 29
     2c4:	f002 fa3e 	bl	2744 <reset_mcu>
_default_handler(TIM4_handler) // 30
     2c8:	f002 fa3c 	bl	2744 <reset_mcu>

000002cc <USART1_handler>:
_default_handler(USART1_handler) // 37
     2cc:	f002 fa3a 	bl	2744 <reset_mcu>
_default_handler(USART2_handler) // 38
     2d0:	f002 fa38 	bl	2744 <reset_mcu>

000002d4 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2d4:	f002 fa36 	bl	2744 <reset_mcu>

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
     580:	2b14      	cmp	r3, #20
     582:	f200 80c6 	bhi.w	712 <SVC_handler+0x1b6>
     586:	a201      	add	r2, pc, #4	; (adr r2, 58c <SVC_handler+0x30>)
     588:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     58c:	0000070d 	.word	0x0000070d
     590:	000005e1 	.word	0x000005e1
     594:	000005ed 	.word	0x000005ed
     598:	000005f9 	.word	0x000005f9
     59c:	00000603 	.word	0x00000603
     5a0:	0000060d 	.word	0x0000060d
     5a4:	0000061b 	.word	0x0000061b
     5a8:	00000627 	.word	0x00000627
     5ac:	0000063b 	.word	0x0000063b
     5b0:	00000643 	.word	0x00000643
     5b4:	00000651 	.word	0x00000651
     5b8:	0000065d 	.word	0x0000065d
     5bc:	00000671 	.word	0x00000671
     5c0:	00000685 	.word	0x00000685
     5c4:	00000697 	.word	0x00000697
     5c8:	000006ab 	.word	0x000006ab
     5cc:	000006bf 	.word	0x000006bf
     5d0:	000006d3 	.word	0x000006d3
     5d4:	000006eb 	.word	0x000006eb
     5d8:	000006fd 	.word	0x000006fd
     5dc:	00000707 	.word	0x00000707
	case SVC_LED_ON:
		write_pin(LED_PORT,LED_PIN,LED_ON);
     5e0:	484f      	ldr	r0, [pc, #316]	; (720 <SVC_handler+0x1c4>)
     5e2:	210d      	movs	r1, #13
     5e4:	2200      	movs	r2, #0
     5e6:	f001 fbdb 	bl	1da0 <write_pin>
		//led_on();
		break;
     5ea:	e092      	b.n	712 <SVC_handler+0x1b6>
	case SVC_LED_OFF:
		write_pin(LED_PORT,LED_PIN,LED_OFF);
     5ec:	484c      	ldr	r0, [pc, #304]	; (720 <SVC_handler+0x1c4>)
     5ee:	210d      	movs	r1, #13
     5f0:	2201      	movs	r2, #1
     5f2:	f001 fbd5 	bl	1da0 <write_pin>
		//led_off();
		break;
     5f6:	e08c      	b.n	712 <SVC_handler+0x1b6>
	case SVC_TIMER:
		timer=(*(unsigned*)arg1);
     5f8:	68bb      	ldr	r3, [r7, #8]
     5fa:	681b      	ldr	r3, [r3, #0]
     5fc:	4a49      	ldr	r2, [pc, #292]	; (724 <SVC_handler+0x1c8>)
     5fe:	6013      	str	r3, [r2, #0]
		break;
     600:	e087      	b.n	712 <SVC_handler+0x1b6>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=timer;
     602:	4b48      	ldr	r3, [pc, #288]	; (724 <SVC_handler+0x1c8>)
     604:	681a      	ldr	r2, [r3, #0]
     606:	68bb      	ldr	r3, [r7, #8]
     608:	601a      	str	r2, [r3, #0]
		break;
     60a:	e082      	b.n	712 <SVC_handler+0x1b6>
	case SVC_CONIN:
		*(char *)arg1=conin();
     60c:	f000 fd9e 	bl	114c <conin>
     610:	4603      	mov	r3, r0
     612:	461a      	mov	r2, r3
     614:	68bb      	ldr	r3, [r7, #8]
     616:	701a      	strb	r2, [r3, #0]
		break;
     618:	e07b      	b.n	712 <SVC_handler+0x1b6>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     61a:	68bb      	ldr	r3, [r7, #8]
     61c:	781b      	ldrb	r3, [r3, #0]
     61e:	4618      	mov	r0, r3
     620:	f000 fd84 	bl	112c <conout>
		break;
     624:	e075      	b.n	712 <SVC_handler+0x1b6>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     626:	68bb      	ldr	r3, [r7, #8]
     628:	681b      	ldr	r3, [r3, #0]
     62a:	6878      	ldr	r0, [r7, #4]
     62c:	4619      	mov	r1, r3
     62e:	f000 fdbb 	bl	11a8 <read_line>
     632:	4602      	mov	r2, r0
     634:	68bb      	ldr	r3, [r7, #8]
     636:	601a      	str	r2, [r3, #0]
		break;
     638:	e06b      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT:
		print((const char*)arg1);
     63a:	68b8      	ldr	r0, [r7, #8]
     63c:	f000 fd90 	bl	1160 <print>
		break;
     640:	e067      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     642:	68bb      	ldr	r3, [r7, #8]
     644:	681b      	ldr	r3, [r3, #0]
     646:	4618      	mov	r0, r3
     648:	210a      	movs	r1, #10
     64a:	f000 fe63 	bl	1314 <print_int>
		break;
     64e:	e060      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     650:	68bb      	ldr	r3, [r7, #8]
     652:	681b      	ldr	r3, [r3, #0]
     654:	4618      	mov	r0, r3
     656:	f000 fecb 	bl	13f0 <print_hex>
		break;
     65a:	e05a      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     65c:	68bb      	ldr	r3, [r7, #8]
     65e:	681b      	ldr	r3, [r3, #0]
     660:	4618      	mov	r0, r3
     662:	f7ff ff2d 	bl	4c0 <peek8>
     666:	4603      	mov	r3, r0
     668:	461a      	mov	r2, r3
     66a:	68bb      	ldr	r3, [r7, #8]
     66c:	701a      	strb	r2, [r3, #0]
		break;
     66e:	e050      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     670:	68bb      	ldr	r3, [r7, #8]
     672:	681b      	ldr	r3, [r3, #0]
     674:	4618      	mov	r0, r3
     676:	f7ff ff2f 	bl	4d8 <peek16>
     67a:	4603      	mov	r3, r0
     67c:	461a      	mov	r2, r3
     67e:	68bb      	ldr	r3, [r7, #8]
     680:	801a      	strh	r2, [r3, #0]
		break;
     682:	e046      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     684:	68bb      	ldr	r3, [r7, #8]
     686:	681b      	ldr	r3, [r3, #0]
     688:	4618      	mov	r0, r3
     68a:	f7ff ff31 	bl	4f0 <peek32>
     68e:	4602      	mov	r2, r0
     690:	68bb      	ldr	r3, [r7, #8]
     692:	601a      	str	r2, [r3, #0]
		break;
     694:	e03d      	b.n	712 <SVC_handler+0x1b6>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
     696:	68bb      	ldr	r3, [r7, #8]
     698:	681b      	ldr	r3, [r3, #0]
     69a:	461a      	mov	r2, r3
     69c:	687b      	ldr	r3, [r7, #4]
     69e:	781b      	ldrb	r3, [r3, #0]
     6a0:	4610      	mov	r0, r2
     6a2:	4619      	mov	r1, r3
     6a4:	f7ff ff30 	bl	508 <poke8>
		break;
     6a8:	e033      	b.n	712 <SVC_handler+0x1b6>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
     6aa:	68bb      	ldr	r3, [r7, #8]
     6ac:	681b      	ldr	r3, [r3, #0]
     6ae:	461a      	mov	r2, r3
     6b0:	687b      	ldr	r3, [r7, #4]
     6b2:	881b      	ldrh	r3, [r3, #0]
     6b4:	4610      	mov	r0, r2
     6b6:	4619      	mov	r1, r3
     6b8:	f7ff ff34 	bl	524 <poke16>
		break;
     6bc:	e029      	b.n	712 <SVC_handler+0x1b6>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
     6be:	68bb      	ldr	r3, [r7, #8]
     6c0:	681b      	ldr	r3, [r3, #0]
     6c2:	461a      	mov	r2, r3
     6c4:	687b      	ldr	r3, [r7, #4]
     6c6:	681b      	ldr	r3, [r3, #0]
     6c8:	4610      	mov	r0, r2
     6ca:	4619      	mov	r1, r3
     6cc:	f7ff ff38 	bl	540 <poke32>
		break;
     6d0:	e01f      	b.n	712 <SVC_handler+0x1b6>
	case SVC_FLASH_WR:
		*(int*)arg1=flash_write(*(uint32_t*)arg1,*(uint16_t*)arg2);
     6d2:	68bb      	ldr	r3, [r7, #8]
     6d4:	681a      	ldr	r2, [r3, #0]
     6d6:	687b      	ldr	r3, [r7, #4]
     6d8:	881b      	ldrh	r3, [r3, #0]
     6da:	4610      	mov	r0, r2
     6dc:	4619      	mov	r1, r3
     6de:	f000 ff31 	bl	1544 <flash_write>
     6e2:	4602      	mov	r2, r0
     6e4:	68bb      	ldr	r3, [r7, #8]
     6e6:	601a      	str	r2, [r3, #0]
		break;
     6e8:	e013      	b.n	712 <SVC_handler+0x1b6>
	case SVC_FLASH_PGER:
		*(int*)arg1=flash_erase_page(*(uint32_t*)arg1);
     6ea:	68bb      	ldr	r3, [r7, #8]
     6ec:	681b      	ldr	r3, [r3, #0]
     6ee:	4618      	mov	r0, r3
     6f0:	f000 ff6c 	bl	15cc <flash_erase_page>
     6f4:	4602      	mov	r2, r0
     6f6:	68bb      	ldr	r3, [r7, #8]
     6f8:	601a      	str	r2, [r3, #0]
		break;
     6fa:	e00a      	b.n	712 <SVC_handler+0x1b6>
	case SVC_TICKS:
		*(unsigned*)arg1=ticks;
     6fc:	4b0a      	ldr	r3, [pc, #40]	; (728 <SVC_handler+0x1cc>)
     6fe:	681a      	ldr	r2, [r3, #0]
     700:	68bb      	ldr	r3, [r7, #8]
     702:	601a      	str	r2, [r3, #0]
		break;
     704:	e005      	b.n	712 <SVC_handler+0x1b6>
	case SVC_CLS:
		cls();
     706:	f000 fed5 	bl	14b4 <cls>
		break;
     70a:	e002      	b.n	712 <SVC_handler+0x1b6>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     70c:	f002 f81a 	bl	2744 <reset_mcu>
	    break;
     710:	bf00      	nop
	}	
}
     712:	3710      	adds	r7, #16
     714:	46bd      	mov	sp, r7
     716:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     71a:	4685      	mov	sp, r0
     71c:	4770      	bx	lr
     71e:	bf00      	nop
     720:	40011000 	.word	0x40011000
     724:	200000e0 	.word	0x200000e0
     728:	200000dc 	.word	0x200000dc

0000072c <set_sysclock>:


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     72c:	b480      	push	{r7}
     72e:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC->CR|=RCC_CR_HSEON;
     730:	4a18      	ldr	r2, [pc, #96]	; (794 <set_sysclock+0x68>)
     732:	4b18      	ldr	r3, [pc, #96]	; (794 <set_sysclock+0x68>)
     734:	681b      	ldr	r3, [r3, #0]
     736:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     73a:	6013      	str	r3, [r2, #0]
	 // attend que l'oscillateur soit prêt
   while (!(RCC->CR&RCC_CR_HSERDY));
     73c:	bf00      	nop
     73e:	4b15      	ldr	r3, [pc, #84]	; (794 <set_sysclock+0x68>)
     740:	681b      	ldr	r3, [r3, #0]
     742:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
     746:	2b00      	cmp	r3, #0
     748:	d0f9      	beq.n	73e <set_sysclock+0x12>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 8 
     // pour une fréquence  Fsysclk de 64 Mhz
    RCC->CFGR|=RCC_CFGR_PLLSRC_HSE|(PLLMUL<<RCC_CFGR_PLLMUL_POS);
     74a:	4a12      	ldr	r2, [pc, #72]	; (794 <set_sysclock+0x68>)
     74c:	4b11      	ldr	r3, [pc, #68]	; (794 <set_sysclock+0x68>)
     74e:	685b      	ldr	r3, [r3, #4]
     750:	f443 13c8 	orr.w	r3, r3, #1638400	; 0x190000
     754:	6053      	str	r3, [r2, #4]
    // active le PLL
    RCC->CR|=RCC_CR_PLLON;
     756:	4a0f      	ldr	r2, [pc, #60]	; (794 <set_sysclock+0x68>)
     758:	4b0e      	ldr	r3, [pc, #56]	; (794 <set_sysclock+0x68>)
     75a:	681b      	ldr	r3, [r3, #0]
     75c:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
     760:	6013      	str	r3, [r2, #0]
    // Attend que le PLL soit prêt
    while (!(RCC->CR&RCC_CR_PLLRDY));
     762:	bf00      	nop
     764:	4b0b      	ldr	r3, [pc, #44]	; (794 <set_sysclock+0x68>)
     766:	681b      	ldr	r3, [r3, #0]
     768:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
     76c:	2b00      	cmp	r3, #0
     76e:	d0f9      	beq.n	764 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    // active le prefetch buffer
    FLASH->ACR|=(WAIT_2_CY<<FLASH_ACR_LATENCY_POS)|FLASH_ACR_PRFTBE;
     770:	4a09      	ldr	r2, [pc, #36]	; (798 <set_sysclock+0x6c>)
     772:	4b09      	ldr	r3, [pc, #36]	; (798 <set_sysclock+0x6c>)
     774:	681b      	ldr	r3, [r3, #0]
     776:	f043 0312 	orr.w	r3, r3, #18
     77a:	6013      	str	r3, [r2, #0]
	// La fréquence maximale pour APB1 doit-être de <=36 Mhz
	// donc divise SYSCLK/2
    // Sélectionne le PLL comme source pour SYSCLK dans CR
	RCC->CFGR|=(RCC_CFGR_PPREx_DIV2<<RCC_CFGR_PPRE1_POS)|(RCC_CFGR_SW_PLL<<RCC_CFGR_SW_POS);
     77c:	4a05      	ldr	r2, [pc, #20]	; (794 <set_sysclock+0x68>)
     77e:	4b05      	ldr	r3, [pc, #20]	; (794 <set_sysclock+0x68>)
     780:	685b      	ldr	r3, [r3, #4]
     782:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     786:	f043 0302 	orr.w	r3, r3, #2
     78a:	6053      	str	r3, [r2, #4]
}
     78c:	46bd      	mov	sp, r7
     78e:	f85d 7b04 	ldr.w	r7, [sp], #4
     792:	4770      	bx	lr
     794:	40021000 	.word	0x40021000
     798:	40022000 	.word	0x40022000

0000079c <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     79c:	b480      	push	{r7}
     79e:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     7a0:	2300      	movs	r3, #0
     7a2:	2200      	movs	r2, #0
     7a4:	4618      	mov	r0, r3
     7a6:	4611      	mov	r1, r2
     7a8:	df00      	svc	0
}
     7aa:	46bd      	mov	sp, r7
     7ac:	f85d 7b04 	ldr.w	r7, [sp], #4
     7b0:	4770      	bx	lr
     7b2:	bf00      	nop

000007b4 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     7b4:	b480      	push	{r7}
     7b6:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     7b8:	2300      	movs	r3, #0
     7ba:	2200      	movs	r2, #0
     7bc:	4618      	mov	r0, r3
     7be:	4611      	mov	r1, r2
     7c0:	df01      	svc	1
}
     7c2:	46bd      	mov	sp, r7
     7c4:	f85d 7b04 	ldr.w	r7, [sp], #4
     7c8:	4770      	bx	lr
     7ca:	bf00      	nop

000007cc <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     7cc:	b480      	push	{r7}
     7ce:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     7d0:	2300      	movs	r3, #0
     7d2:	2200      	movs	r2, #0
     7d4:	4618      	mov	r0, r3
     7d6:	4611      	mov	r1, r2
     7d8:	df02      	svc	2
}
     7da:	46bd      	mov	sp, r7
     7dc:	f85d 7b04 	ldr.w	r7, [sp], #4
     7e0:	4770      	bx	lr
     7e2:	bf00      	nop

000007e4 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     7e4:	b580      	push	{r7, lr}
     7e6:	b082      	sub	sp, #8
     7e8:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     7ea:	f000 fb03 	bl	df4 <word>
	n=atoi((const char*)pad);
     7ee:	4806      	ldr	r0, [pc, #24]	; (808 <cmd_set_timer+0x24>)
     7f0:	f7ff fdf0 	bl	3d4 <atoi>
     7f4:	4603      	mov	r3, r0
     7f6:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     7f8:	1d3b      	adds	r3, r7, #4
     7fa:	2200      	movs	r2, #0
     7fc:	4618      	mov	r0, r3
     7fe:	4611      	mov	r1, r2
     800:	df03      	svc	3
}
     802:	3708      	adds	r7, #8
     804:	46bd      	mov	sp, r7
     806:	bd80      	pop	{r7, pc}
     808:	20000058 	.word	0x20000058

0000080c <cmd_get_timer>:

static void cmd_get_timer(){
     80c:	b480      	push	{r7}
     80e:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     810:	4b04      	ldr	r3, [pc, #16]	; (824 <cmd_get_timer+0x18>)
     812:	2200      	movs	r2, #0
     814:	4618      	mov	r0, r3
     816:	4611      	mov	r1, r2
     818:	df04      	svc	4
}
     81a:	46bd      	mov	sp, r7
     81c:	f85d 7b04 	ldr.w	r7, [sp], #4
     820:	4770      	bx	lr
     822:	bf00      	nop
     824:	20000058 	.word	0x20000058

00000828 <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     828:	b480      	push	{r7}
     82a:	b083      	sub	sp, #12
     82c:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     82e:	1d3b      	adds	r3, r7, #4
     830:	2200      	movs	r2, #0
     832:	4618      	mov	r0, r3
     834:	4611      	mov	r1, r2
     836:	df04      	svc	4
     838:	687b      	ldr	r3, [r7, #4]
     83a:	2b00      	cmp	r3, #0
     83c:	d1f7      	bne.n	82e <cmd_pause+0x6>
}
     83e:	370c      	adds	r7, #12
     840:	46bd      	mov	sp, r7
     842:	f85d 7b04 	ldr.w	r7, [sp], #4
     846:	4770      	bx	lr

00000848 <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     848:	b480      	push	{r7}
     84a:	b083      	sub	sp, #12
     84c:	af00      	add	r7, sp, #0
	volatile char n=0;
     84e:	2300      	movs	r3, #0
     850:	71fb      	strb	r3, [r7, #7]
	while (!n){
     852:	e004      	b.n	85e <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     854:	1dfb      	adds	r3, r7, #7
     856:	2200      	movs	r2, #0
     858:	4618      	mov	r0, r3
     85a:	4611      	mov	r1, r2
     85c:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     85e:	79fb      	ldrb	r3, [r7, #7]
     860:	b2db      	uxtb	r3, r3
     862:	2b00      	cmp	r3, #0
     864:	d0f6      	beq.n	854 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     866:	79fb      	ldrb	r3, [r7, #7]
     868:	b2da      	uxtb	r2, r3
     86a:	4b05      	ldr	r3, [pc, #20]	; (880 <cmd_getc+0x38>)
     86c:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     86e:	4b04      	ldr	r3, [pc, #16]	; (880 <cmd_getc+0x38>)
     870:	2200      	movs	r2, #0
     872:	705a      	strb	r2, [r3, #1]
}
     874:	370c      	adds	r7, #12
     876:	46bd      	mov	sp, r7
     878:	f85d 7b04 	ldr.w	r7, [sp], #4
     87c:	4770      	bx	lr
     87e:	bf00      	nop
     880:	20000058 	.word	0x20000058

00000884 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     884:	b580      	push	{r7, lr}
     886:	b082      	sub	sp, #8
     888:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     88a:	f000 fab3 	bl	df4 <word>
	cmd_id=search_command((const char*)pad);
     88e:	480a      	ldr	r0, [pc, #40]	; (8b8 <cmd_putc+0x34>)
     890:	f000 f99a 	bl	bc8 <search_command>
     894:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     896:	687b      	ldr	r3, [r7, #4]
     898:	2b00      	cmp	r3, #0
     89a:	db05      	blt.n	8a8 <cmd_putc+0x24>
     89c:	4a07      	ldr	r2, [pc, #28]	; (8bc <cmd_putc+0x38>)
     89e:	687b      	ldr	r3, [r7, #4]
     8a0:	00db      	lsls	r3, r3, #3
     8a2:	4413      	add	r3, r2
     8a4:	685b      	ldr	r3, [r3, #4]
     8a6:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     8a8:	4b03      	ldr	r3, [pc, #12]	; (8b8 <cmd_putc+0x34>)
     8aa:	2200      	movs	r2, #0
     8ac:	4618      	mov	r0, r3
     8ae:	4611      	mov	r1, r2
     8b0:	df06      	svc	6
}
     8b2:	3708      	adds	r7, #8
     8b4:	46bd      	mov	sp, r7
     8b6:	bd80      	pop	{r7, pc}
     8b8:	20000058 	.word	0x20000058
     8bc:	0000312c 	.word	0x0000312c

000008c0 <cmd_readln>:

static void cmd_readln(){
     8c0:	b580      	push	{r7, lr}
     8c2:	b082      	sub	sp, #8
     8c4:	af00      	add	r7, sp, #0
	unsigned llen=80;
     8c6:	2350      	movs	r3, #80	; 0x50
     8c8:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     8ca:	1d3b      	adds	r3, r7, #4
     8cc:	4a04      	ldr	r2, [pc, #16]	; (8e0 <cmd_readln+0x20>)
     8ce:	4618      	mov	r0, r3
     8d0:	4611      	mov	r1, r2
     8d2:	df07      	svc	7
	print((const char*)pad);
     8d4:	4802      	ldr	r0, [pc, #8]	; (8e0 <cmd_readln+0x20>)
     8d6:	f000 fc43 	bl	1160 <print>
}
     8da:	3708      	adds	r7, #8
     8dc:	46bd      	mov	sp, r7
     8de:	bd80      	pop	{r7, pc}
     8e0:	20000058 	.word	0x20000058

000008e4 <cmd_print>:

static void cmd_print(){
     8e4:	b580      	push	{r7, lr}
     8e6:	af00      	add	r7, sp, #0
	word();
     8e8:	f000 fa84 	bl	df4 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     8ec:	4b02      	ldr	r3, [pc, #8]	; (8f8 <cmd_print+0x14>)
     8ee:	2200      	movs	r2, #0
     8f0:	4618      	mov	r0, r3
     8f2:	4611      	mov	r1, r2
     8f4:	df08      	svc	8
}
     8f6:	bd80      	pop	{r7, pc}
     8f8:	20000058 	.word	0x20000058

000008fc <cmd_print_int>:

static void cmd_print_int(){
     8fc:	b580      	push	{r7, lr}
     8fe:	b082      	sub	sp, #8
     900:	af00      	add	r7, sp, #0
	int cmd_id;
    unsigned u32;
    
	word();
     902:	f000 fa77 	bl	df4 <word>
	cmd_id=search_command((const char*)pad);
     906:	480e      	ldr	r0, [pc, #56]	; (940 <cmd_print_int+0x44>)
     908:	f000 f95e 	bl	bc8 <search_command>
     90c:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     90e:	687b      	ldr	r3, [r7, #4]
     910:	2b00      	cmp	r3, #0
     912:	db06      	blt.n	922 <cmd_print_int+0x26>
		 commands[cmd_id].fn();
     914:	4a0b      	ldr	r2, [pc, #44]	; (944 <cmd_print_int+0x48>)
     916:	687b      	ldr	r3, [r7, #4]
     918:	00db      	lsls	r3, r3, #3
     91a:	4413      	add	r3, r2
     91c:	685b      	ldr	r3, [r3, #4]
     91e:	4798      	blx	r3
     920:	e006      	b.n	930 <cmd_print_int+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     922:	4807      	ldr	r0, [pc, #28]	; (940 <cmd_print_int+0x44>)
     924:	f7ff fd56 	bl	3d4 <atoi>
     928:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     92a:	4a05      	ldr	r2, [pc, #20]	; (940 <cmd_print_int+0x44>)
     92c:	687b      	ldr	r3, [r7, #4]
     92e:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_INT,pad,NUL);
     930:	4b03      	ldr	r3, [pc, #12]	; (940 <cmd_print_int+0x44>)
     932:	2200      	movs	r2, #0
     934:	4618      	mov	r0, r3
     936:	4611      	mov	r1, r2
     938:	df09      	svc	9
}
     93a:	3708      	adds	r7, #8
     93c:	46bd      	mov	sp, r7
     93e:	bd80      	pop	{r7, pc}
     940:	20000058 	.word	0x20000058
     944:	0000312c 	.word	0x0000312c

00000948 <cmd_print_hex>:

static void cmd_print_hex(){
     948:	b580      	push	{r7, lr}
     94a:	b082      	sub	sp, #8
     94c:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     94e:	f000 fa51 	bl	df4 <word>
	cmd_id=search_command((const char*)pad);
     952:	480e      	ldr	r0, [pc, #56]	; (98c <cmd_print_hex+0x44>)
     954:	f000 f938 	bl	bc8 <search_command>
     958:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     95a:	687b      	ldr	r3, [r7, #4]
     95c:	2b00      	cmp	r3, #0
     95e:	db06      	blt.n	96e <cmd_print_hex+0x26>
		 commands[cmd_id].fn();
     960:	4a0b      	ldr	r2, [pc, #44]	; (990 <cmd_print_hex+0x48>)
     962:	687b      	ldr	r3, [r7, #4]
     964:	00db      	lsls	r3, r3, #3
     966:	4413      	add	r3, r2
     968:	685b      	ldr	r3, [r3, #4]
     96a:	4798      	blx	r3
     96c:	e006      	b.n	97c <cmd_print_hex+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     96e:	4807      	ldr	r0, [pc, #28]	; (98c <cmd_print_hex+0x44>)
     970:	f7ff fd30 	bl	3d4 <atoi>
     974:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     976:	4a05      	ldr	r2, [pc, #20]	; (98c <cmd_print_hex+0x44>)
     978:	687b      	ldr	r3, [r7, #4]
     97a:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_HEX,pad,NUL);
     97c:	4b03      	ldr	r3, [pc, #12]	; (98c <cmd_print_hex+0x44>)
     97e:	2200      	movs	r2, #0
     980:	4618      	mov	r0, r3
     982:	4611      	mov	r1, r2
     984:	df0a      	svc	10
}
     986:	3708      	adds	r7, #8
     988:	46bd      	mov	sp, r7
     98a:	bd80      	pop	{r7, pc}
     98c:	20000058 	.word	0x20000058
     990:	0000312c 	.word	0x0000312c

00000994 <cmd_run>:

static void cmd_run(){
     994:	b580      	push	{r7, lr}
     996:	af00      	add	r7, sp, #0
	((fn)proga)();
     998:	4b01      	ldr	r3, [pc, #4]	; (9a0 <cmd_run+0xc>)
     99a:	681b      	ldr	r3, [r3, #0]
     99c:	4798      	blx	r3
	
}
     99e:	bd80      	pop	{r7, pc}
     9a0:	200000ec 	.word	0x200000ec

000009a4 <cmd_peek8>:

static void cmd_peek8(){
     9a4:	b580      	push	{r7, lr}
     9a6:	b082      	sub	sp, #8
     9a8:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9aa:	f000 fa23 	bl	df4 <word>
	u=atoi((const char*)pad);
     9ae:	4808      	ldr	r0, [pc, #32]	; (9d0 <cmd_peek8+0x2c>)
     9b0:	f7ff fd10 	bl	3d4 <atoi>
     9b4:	4603      	mov	r3, r0
     9b6:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     9b8:	1d3b      	adds	r3, r7, #4
     9ba:	2200      	movs	r2, #0
     9bc:	4618      	mov	r0, r3
     9be:	4611      	mov	r1, r2
     9c0:	df0b      	svc	11
	*(uint32_t*)pad=u&0xff;
     9c2:	4a03      	ldr	r2, [pc, #12]	; (9d0 <cmd_peek8+0x2c>)
     9c4:	687b      	ldr	r3, [r7, #4]
     9c6:	b2db      	uxtb	r3, r3
     9c8:	6013      	str	r3, [r2, #0]
}
     9ca:	3708      	adds	r7, #8
     9cc:	46bd      	mov	sp, r7
     9ce:	bd80      	pop	{r7, pc}
     9d0:	20000058 	.word	0x20000058

000009d4 <cmd_peek16>:

static void cmd_peek16(){
     9d4:	b580      	push	{r7, lr}
     9d6:	b082      	sub	sp, #8
     9d8:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9da:	f000 fa0b 	bl	df4 <word>
	u=atoi((const char*)pad);
     9de:	4808      	ldr	r0, [pc, #32]	; (a00 <cmd_peek16+0x2c>)
     9e0:	f7ff fcf8 	bl	3d4 <atoi>
     9e4:	4603      	mov	r3, r0
     9e6:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     9e8:	1d3b      	adds	r3, r7, #4
     9ea:	2200      	movs	r2, #0
     9ec:	4618      	mov	r0, r3
     9ee:	4611      	mov	r1, r2
     9f0:	df0c      	svc	12
	*(uint32_t*)pad=u&0xffff;
     9f2:	4a03      	ldr	r2, [pc, #12]	; (a00 <cmd_peek16+0x2c>)
     9f4:	687b      	ldr	r3, [r7, #4]
     9f6:	b29b      	uxth	r3, r3
     9f8:	6013      	str	r3, [r2, #0]
}
     9fa:	3708      	adds	r7, #8
     9fc:	46bd      	mov	sp, r7
     9fe:	bd80      	pop	{r7, pc}
     a00:	20000058 	.word	0x20000058

00000a04 <cmd_peek32>:

static void cmd_peek32(){
     a04:	b580      	push	{r7, lr}
     a06:	b082      	sub	sp, #8
     a08:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     a0a:	f000 f9f3 	bl	df4 <word>
	u=atoi((const char*)pad);
     a0e:	4808      	ldr	r0, [pc, #32]	; (a30 <cmd_peek32+0x2c>)
     a10:	f7ff fce0 	bl	3d4 <atoi>
     a14:	4603      	mov	r3, r0
     a16:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK32,&u,NUL);
     a18:	1d3b      	adds	r3, r7, #4
     a1a:	2200      	movs	r2, #0
     a1c:	4618      	mov	r0, r3
     a1e:	4611      	mov	r1, r2
     a20:	df0d      	svc	13
	*(uint32_t*)pad=u;
     a22:	4a03      	ldr	r2, [pc, #12]	; (a30 <cmd_peek32+0x2c>)
     a24:	687b      	ldr	r3, [r7, #4]
     a26:	6013      	str	r3, [r2, #0]
}
     a28:	3708      	adds	r7, #8
     a2a:	46bd      	mov	sp, r7
     a2c:	bd80      	pop	{r7, pc}
     a2e:	bf00      	nop
     a30:	20000058 	.word	0x20000058

00000a34 <cmd_poke8>:

static void cmd_poke8(){
     a34:	b580      	push	{r7, lr}
     a36:	b082      	sub	sp, #8
     a38:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     a3a:	f000 f9db 	bl	df4 <word>
	adr=atoi((const char*)pad);
     a3e:	480a      	ldr	r0, [pc, #40]	; (a68 <cmd_poke8+0x34>)
     a40:	f7ff fcc8 	bl	3d4 <atoi>
     a44:	4603      	mov	r3, r0
     a46:	607b      	str	r3, [r7, #4]
	word();
     a48:	f000 f9d4 	bl	df4 <word>
	u8=atoi((const char*)pad);
     a4c:	4806      	ldr	r0, [pc, #24]	; (a68 <cmd_poke8+0x34>)
     a4e:	f7ff fcc1 	bl	3d4 <atoi>
     a52:	4603      	mov	r3, r0
     a54:	b2db      	uxtb	r3, r3
     a56:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     a58:	1d3b      	adds	r3, r7, #4
     a5a:	1cfa      	adds	r2, r7, #3
     a5c:	4618      	mov	r0, r3
     a5e:	4611      	mov	r1, r2
     a60:	df0e      	svc	14
}
     a62:	3708      	adds	r7, #8
     a64:	46bd      	mov	sp, r7
     a66:	bd80      	pop	{r7, pc}
     a68:	20000058 	.word	0x20000058

00000a6c <cmd_poke16>:

static void cmd_poke16(){
     a6c:	b580      	push	{r7, lr}
     a6e:	b082      	sub	sp, #8
     a70:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     a72:	f000 f9bf 	bl	df4 <word>
	adr=atoi((const char*)pad);
     a76:	480a      	ldr	r0, [pc, #40]	; (aa0 <cmd_poke16+0x34>)
     a78:	f7ff fcac 	bl	3d4 <atoi>
     a7c:	4603      	mov	r3, r0
     a7e:	607b      	str	r3, [r7, #4]
	word();
     a80:	f000 f9b8 	bl	df4 <word>
	u16=atoi((const char*)pad);
     a84:	4806      	ldr	r0, [pc, #24]	; (aa0 <cmd_poke16+0x34>)
     a86:	f7ff fca5 	bl	3d4 <atoi>
     a8a:	4603      	mov	r3, r0
     a8c:	b29b      	uxth	r3, r3
     a8e:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     a90:	1d3b      	adds	r3, r7, #4
     a92:	1cba      	adds	r2, r7, #2
     a94:	4618      	mov	r0, r3
     a96:	4611      	mov	r1, r2
     a98:	df0f      	svc	15
}
     a9a:	3708      	adds	r7, #8
     a9c:	46bd      	mov	sp, r7
     a9e:	bd80      	pop	{r7, pc}
     aa0:	20000058 	.word	0x20000058

00000aa4 <cmd_poke32>:

static void cmd_poke32(){
     aa4:	b580      	push	{r7, lr}
     aa6:	b082      	sub	sp, #8
     aa8:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     aaa:	f000 f9a3 	bl	df4 <word>
	adr=atoi((const char*)pad);
     aae:	480a      	ldr	r0, [pc, #40]	; (ad8 <cmd_poke32+0x34>)
     ab0:	f7ff fc90 	bl	3d4 <atoi>
     ab4:	4603      	mov	r3, r0
     ab6:	607b      	str	r3, [r7, #4]
	word();
     ab8:	f000 f99c 	bl	df4 <word>
	u32=atoi((const char*)pad);
     abc:	4806      	ldr	r0, [pc, #24]	; (ad8 <cmd_poke32+0x34>)
     abe:	f7ff fc89 	bl	3d4 <atoi>
     ac2:	4603      	mov	r3, r0
     ac4:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     ac6:	1d3b      	adds	r3, r7, #4
     ac8:	463a      	mov	r2, r7
     aca:	4618      	mov	r0, r3
     acc:	4611      	mov	r1, r2
     ace:	df10      	svc	16
}
     ad0:	3708      	adds	r7, #8
     ad2:	46bd      	mov	sp, r7
     ad4:	bd80      	pop	{r7, pc}
     ad6:	bf00      	nop
     ad8:	20000058 	.word	0x20000058

00000adc <cmd_fwrite>:

static void cmd_fwrite(){
     adc:	b580      	push	{r7, lr}
     ade:	b082      	sub	sp, #8
     ae0:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	word();
     ae2:	f000 f987 	bl	df4 <word>
	adr=atoi((const char*)pad);
     ae6:	480d      	ldr	r0, [pc, #52]	; (b1c <cmd_fwrite+0x40>)
     ae8:	f7ff fc74 	bl	3d4 <atoi>
     aec:	4603      	mov	r3, r0
     aee:	607b      	str	r3, [r7, #4]
	word();
     af0:	f000 f980 	bl	df4 <word>
	u32=atoi((const char*)pad);
     af4:	4809      	ldr	r0, [pc, #36]	; (b1c <cmd_fwrite+0x40>)
     af6:	f7ff fc6d 	bl	3d4 <atoi>
     afa:	4603      	mov	r3, r0
     afc:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_FLASH_WR,&adr,&u32);
     afe:	1d3b      	adds	r3, r7, #4
     b00:	463a      	mov	r2, r7
     b02:	4618      	mov	r0, r3
     b04:	4611      	mov	r1, r2
     b06:	df11      	svc	17
	if (!adr) print(" failed\n");
     b08:	687b      	ldr	r3, [r7, #4]
     b0a:	2b00      	cmp	r3, #0
     b0c:	d102      	bne.n	b14 <cmd_fwrite+0x38>
     b0e:	4804      	ldr	r0, [pc, #16]	; (b20 <cmd_fwrite+0x44>)
     b10:	f000 fb26 	bl	1160 <print>
}
     b14:	3708      	adds	r7, #8
     b16:	46bd      	mov	sp, r7
     b18:	bd80      	pop	{r7, pc}
     b1a:	bf00      	nop
     b1c:	20000058 	.word	0x20000058
     b20:	00003068 	.word	0x00003068

00000b24 <cmd_pgerase>:

static void cmd_pgerase(){
     b24:	b580      	push	{r7, lr}
     b26:	b082      	sub	sp, #8
     b28:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     b2a:	f000 f963 	bl	df4 <word>
	adr=atoi((const char*)pad);
     b2e:	4809      	ldr	r0, [pc, #36]	; (b54 <cmd_pgerase+0x30>)
     b30:	f7ff fc50 	bl	3d4 <atoi>
     b34:	4603      	mov	r3, r0
     b36:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_FLASH_PGER,&adr,0);
     b38:	1d3b      	adds	r3, r7, #4
     b3a:	2200      	movs	r2, #0
     b3c:	4618      	mov	r0, r3
     b3e:	4611      	mov	r1, r2
     b40:	df12      	svc	18
	if (!adr) print(" failed\n");
     b42:	687b      	ldr	r3, [r7, #4]
     b44:	2b00      	cmp	r3, #0
     b46:	d102      	bne.n	b4e <cmd_pgerase+0x2a>
     b48:	4803      	ldr	r0, [pc, #12]	; (b58 <cmd_pgerase+0x34>)
     b4a:	f000 fb09 	bl	1160 <print>
}
     b4e:	3708      	adds	r7, #8
     b50:	46bd      	mov	sp, r7
     b52:	bd80      	pop	{r7, pc}
     b54:	20000058 	.word	0x20000058
     b58:	00003068 	.word	0x00003068

00000b5c <cmd_ticks>:

static void cmd_ticks(){
     b5c:	b480      	push	{r7}
     b5e:	af00      	add	r7, sp, #0
	_svc_call(SVC_TICKS,&pad,0);
     b60:	4b04      	ldr	r3, [pc, #16]	; (b74 <cmd_ticks+0x18>)
     b62:	2200      	movs	r2, #0
     b64:	4618      	mov	r0, r3
     b66:	4611      	mov	r1, r2
     b68:	df13      	svc	19
}
     b6a:	46bd      	mov	sp, r7
     b6c:	f85d 7b04 	ldr.w	r7, [sp], #4
     b70:	4770      	bx	lr
     b72:	bf00      	nop
     b74:	20000058 	.word	0x20000058

00000b78 <cmd_con>:

static void cmd_con(){
     b78:	b580      	push	{r7, lr}
     b7a:	b082      	sub	sp, #8
     b7c:	af00      	add	r7, sp, #0
	console_dev_t dev;
	word();
     b7e:	f000 f939 	bl	df4 <word>
	if (!strcmp("local",(const char*)pad)){
     b82:	4809      	ldr	r0, [pc, #36]	; (ba8 <cmd_con+0x30>)
     b84:	4909      	ldr	r1, [pc, #36]	; (bac <cmd_con+0x34>)
     b86:	f7ff fba7 	bl	2d8 <strcmp>
     b8a:	4603      	mov	r3, r0
     b8c:	2b00      	cmp	r3, #0
     b8e:	d102      	bne.n	b96 <cmd_con+0x1e>
		dev=LOCAL;
     b90:	2300      	movs	r3, #0
     b92:	71fb      	strb	r3, [r7, #7]
     b94:	e001      	b.n	b9a <cmd_con+0x22>
	}else{
		dev=SERIAL;
     b96:	2301      	movs	r3, #1
     b98:	71fb      	strb	r3, [r7, #7]
	}
	con_select(dev);
     b9a:	79fb      	ldrb	r3, [r7, #7]
     b9c:	4618      	mov	r0, r3
     b9e:	f000 fa71 	bl	1084 <con_select>
}
     ba2:	3708      	adds	r7, #8
     ba4:	46bd      	mov	sp, r7
     ba6:	bd80      	pop	{r7, pc}
     ba8:	00003074 	.word	0x00003074
     bac:	20000058 	.word	0x20000058

00000bb0 <cmd_cls>:

void cmd_cls(){
     bb0:	b480      	push	{r7}
     bb2:	af00      	add	r7, sp, #0
	_svc_call(SVC_CLS,0,0);
     bb4:	2300      	movs	r3, #0
     bb6:	2200      	movs	r2, #0
     bb8:	4618      	mov	r0, r3
     bba:	4611      	mov	r1, r2
     bbc:	df14      	svc	20
}
     bbe:	46bd      	mov	sp, r7
     bc0:	f85d 7b04 	ldr.w	r7, [sp], #4
     bc4:	4770      	bx	lr
     bc6:	bf00      	nop

00000bc8 <search_command>:
	{"cls",cmd_cls},
	{NUL,NUL}
};


int search_command(const char * name){
     bc8:	b580      	push	{r7, lr}
     bca:	b084      	sub	sp, #16
     bcc:	af00      	add	r7, sp, #0
     bce:	6078      	str	r0, [r7, #4]
	int i=0;
     bd0:	2300      	movs	r3, #0
     bd2:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     bd4:	e00e      	b.n	bf4 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     bd6:	4a12      	ldr	r2, [pc, #72]	; (c20 <search_command+0x58>)
     bd8:	68fb      	ldr	r3, [r7, #12]
     bda:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     bde:	4618      	mov	r0, r3
     be0:	6879      	ldr	r1, [r7, #4]
     be2:	f7ff fb79 	bl	2d8 <strcmp>
     be6:	4603      	mov	r3, r0
     be8:	2b00      	cmp	r3, #0
     bea:	d100      	bne.n	bee <search_command+0x26>
			break;
     bec:	e009      	b.n	c02 <search_command+0x3a>
		}
		i++;
     bee:	68fb      	ldr	r3, [r7, #12]
     bf0:	3301      	adds	r3, #1
     bf2:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     bf4:	4a0a      	ldr	r2, [pc, #40]	; (c20 <search_command+0x58>)
     bf6:	68fb      	ldr	r3, [r7, #12]
     bf8:	00db      	lsls	r3, r3, #3
     bfa:	4413      	add	r3, r2
     bfc:	685b      	ldr	r3, [r3, #4]
     bfe:	2b00      	cmp	r3, #0
     c00:	d1e9      	bne.n	bd6 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     c02:	4a07      	ldr	r2, [pc, #28]	; (c20 <search_command+0x58>)
     c04:	68fb      	ldr	r3, [r7, #12]
     c06:	00db      	lsls	r3, r3, #3
     c08:	4413      	add	r3, r2
     c0a:	685b      	ldr	r3, [r3, #4]
     c0c:	2b00      	cmp	r3, #0
     c0e:	d102      	bne.n	c16 <search_command+0x4e>
     c10:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     c14:	60fb      	str	r3, [r7, #12]
	return i;
     c16:	68fb      	ldr	r3, [r7, #12]
}
     c18:	4618      	mov	r0, r3
     c1a:	3710      	adds	r7, #16
     c1c:	46bd      	mov	sp, r7
     c1e:	bd80      	pop	{r7, pc}
     c20:	0000312c 	.word	0x0000312c

00000c24 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     c24:	b480      	push	{r7}
     c26:	b085      	sub	sp, #20
     c28:	af00      	add	r7, sp, #0
     c2a:	60f8      	str	r0, [r7, #12]
     c2c:	60b9      	str	r1, [r7, #8]
     c2e:	4613      	mov	r3, r2
     c30:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     c32:	e002      	b.n	c3a <skip+0x16>
     c34:	68bb      	ldr	r3, [r7, #8]
     c36:	3301      	adds	r3, #1
     c38:	60bb      	str	r3, [r7, #8]
     c3a:	68bb      	ldr	r3, [r7, #8]
     c3c:	68fa      	ldr	r2, [r7, #12]
     c3e:	4413      	add	r3, r2
     c40:	781b      	ldrb	r3, [r3, #0]
     c42:	2b00      	cmp	r3, #0
     c44:	d006      	beq.n	c54 <skip+0x30>
     c46:	68bb      	ldr	r3, [r7, #8]
     c48:	68fa      	ldr	r2, [r7, #12]
     c4a:	4413      	add	r3, r2
     c4c:	781b      	ldrb	r3, [r3, #0]
     c4e:	79fa      	ldrb	r2, [r7, #7]
     c50:	429a      	cmp	r2, r3
     c52:	d0ef      	beq.n	c34 <skip+0x10>
	return start;
     c54:	68bb      	ldr	r3, [r7, #8]
}
     c56:	4618      	mov	r0, r3
     c58:	3714      	adds	r7, #20
     c5a:	46bd      	mov	sp, r7
     c5c:	f85d 7b04 	ldr.w	r7, [sp], #4
     c60:	4770      	bx	lr
     c62:	bf00      	nop

00000c64 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     c64:	b480      	push	{r7}
     c66:	b085      	sub	sp, #20
     c68:	af00      	add	r7, sp, #0
     c6a:	60f8      	str	r0, [r7, #12]
     c6c:	60b9      	str	r1, [r7, #8]
     c6e:	4613      	mov	r3, r2
     c70:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     c72:	e002      	b.n	c7a <scan+0x16>
     c74:	68bb      	ldr	r3, [r7, #8]
     c76:	3301      	adds	r3, #1
     c78:	60bb      	str	r3, [r7, #8]
     c7a:	68bb      	ldr	r3, [r7, #8]
     c7c:	68fa      	ldr	r2, [r7, #12]
     c7e:	4413      	add	r3, r2
     c80:	781b      	ldrb	r3, [r3, #0]
     c82:	2b00      	cmp	r3, #0
     c84:	d006      	beq.n	c94 <scan+0x30>
     c86:	68bb      	ldr	r3, [r7, #8]
     c88:	68fa      	ldr	r2, [r7, #12]
     c8a:	4413      	add	r3, r2
     c8c:	781b      	ldrb	r3, [r3, #0]
     c8e:	79fa      	ldrb	r2, [r7, #7]
     c90:	429a      	cmp	r2, r3
     c92:	d1ef      	bne.n	c74 <scan+0x10>
	return start;
     c94:	68bb      	ldr	r3, [r7, #8]
}
     c96:	4618      	mov	r0, r3
     c98:	3714      	adds	r7, #20
     c9a:	46bd      	mov	sp, r7
     c9c:	f85d 7b04 	ldr.w	r7, [sp], #4
     ca0:	4770      	bx	lr
     ca2:	bf00      	nop

00000ca4 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     ca4:	b480      	push	{r7}
     ca6:	b087      	sub	sp, #28
     ca8:	af00      	add	r7, sp, #0
     caa:	6078      	str	r0, [r7, #4]
     cac:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     cae:	2300      	movs	r3, #0
     cb0:	617b      	str	r3, [r7, #20]
     cb2:	683b      	ldr	r3, [r7, #0]
     cb4:	613b      	str	r3, [r7, #16]
     cb6:	2300      	movs	r3, #0
     cb8:	60fb      	str	r3, [r7, #12]
     cba:	2301      	movs	r3, #1
     cbc:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     cbe:	e040      	b.n	d42 <quote+0x9e>
		switch (buffer[end]){
     cc0:	693b      	ldr	r3, [r7, #16]
     cc2:	687a      	ldr	r2, [r7, #4]
     cc4:	4413      	add	r3, r2
     cc6:	781b      	ldrb	r3, [r3, #0]
     cc8:	2b5c      	cmp	r3, #92	; 0x5c
     cca:	d012      	beq.n	cf2 <quote+0x4e>
     ccc:	2b6e      	cmp	r3, #110	; 0x6e
     cce:	d022      	beq.n	d16 <quote+0x72>
     cd0:	2b22      	cmp	r3, #34	; 0x22
     cd2:	d128      	bne.n	d26 <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     cd4:	697b      	ldr	r3, [r7, #20]
     cd6:	2b00      	cmp	r3, #0
     cd8:	d102      	bne.n	ce0 <quote+0x3c>
     cda:	2300      	movs	r3, #0
     cdc:	60bb      	str	r3, [r7, #8]
			break;
     cde:	e02d      	b.n	d3c <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     ce0:	68fb      	ldr	r3, [r7, #12]
     ce2:	1c5a      	adds	r2, r3, #1
     ce4:	60fa      	str	r2, [r7, #12]
     ce6:	4a21      	ldr	r2, [pc, #132]	; (d6c <quote+0xc8>)
     ce8:	2122      	movs	r1, #34	; 0x22
     cea:	54d1      	strb	r1, [r2, r3]
     cec:	2300      	movs	r3, #0
     cee:	617b      	str	r3, [r7, #20]
			break;
     cf0:	e024      	b.n	d3c <quote+0x98>
		case '\\':
			if (!escaped){
     cf2:	697b      	ldr	r3, [r7, #20]
     cf4:	2b00      	cmp	r3, #0
     cf6:	d102      	bne.n	cfe <quote+0x5a>
				escaped=1;
     cf8:	2301      	movs	r3, #1
     cfa:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     cfc:	e01e      	b.n	d3c <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     cfe:	2300      	movs	r3, #0
     d00:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     d02:	68fb      	ldr	r3, [r7, #12]
     d04:	1c5a      	adds	r2, r3, #1
     d06:	60fa      	str	r2, [r7, #12]
     d08:	693a      	ldr	r2, [r7, #16]
     d0a:	6879      	ldr	r1, [r7, #4]
     d0c:	440a      	add	r2, r1
     d0e:	7811      	ldrb	r1, [r2, #0]
     d10:	4a16      	ldr	r2, [pc, #88]	; (d6c <quote+0xc8>)
     d12:	54d1      	strb	r1, [r2, r3]
			}
			break;
     d14:	e012      	b.n	d3c <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     d16:	697b      	ldr	r3, [r7, #20]
     d18:	2b00      	cmp	r3, #0
     d1a:	d004      	beq.n	d26 <quote+0x82>
     d1c:	693b      	ldr	r3, [r7, #16]
     d1e:	687a      	ldr	r2, [r7, #4]
     d20:	4413      	add	r3, r2
     d22:	220d      	movs	r2, #13
     d24:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     d26:	2300      	movs	r3, #0
     d28:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     d2a:	68fb      	ldr	r3, [r7, #12]
     d2c:	1c5a      	adds	r2, r3, #1
     d2e:	60fa      	str	r2, [r7, #12]
     d30:	693a      	ldr	r2, [r7, #16]
     d32:	6879      	ldr	r1, [r7, #4]
     d34:	440a      	add	r2, r1
     d36:	7811      	ldrb	r1, [r2, #0]
     d38:	4a0c      	ldr	r2, [pc, #48]	; (d6c <quote+0xc8>)
     d3a:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     d3c:	693b      	ldr	r3, [r7, #16]
     d3e:	3301      	adds	r3, #1
     d40:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     d42:	693b      	ldr	r3, [r7, #16]
     d44:	687a      	ldr	r2, [r7, #4]
     d46:	4413      	add	r3, r2
     d48:	781b      	ldrb	r3, [r3, #0]
     d4a:	2b00      	cmp	r3, #0
     d4c:	d002      	beq.n	d54 <quote+0xb0>
     d4e:	68bb      	ldr	r3, [r7, #8]
     d50:	2b00      	cmp	r3, #0
     d52:	d1b5      	bne.n	cc0 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     d54:	4a05      	ldr	r2, [pc, #20]	; (d6c <quote+0xc8>)
     d56:	68fb      	ldr	r3, [r7, #12]
     d58:	4413      	add	r3, r2
     d5a:	2200      	movs	r2, #0
     d5c:	701a      	strb	r2, [r3, #0]
	return end;
     d5e:	693b      	ldr	r3, [r7, #16]
}
     d60:	4618      	mov	r0, r3
     d62:	371c      	adds	r7, #28
     d64:	46bd      	mov	sp, r7
     d66:	f85d 7b04 	ldr.w	r7, [sp], #4
     d6a:	4770      	bx	lr
     d6c:	20000058 	.word	0x20000058

00000d70 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     d70:	b480      	push	{r7}
     d72:	b087      	sub	sp, #28
     d74:	af00      	add	r7, sp, #0
     d76:	60f8      	str	r0, [r7, #12]
     d78:	60b9      	str	r1, [r7, #8]
     d7a:	4613      	mov	r3, r2
     d7c:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     d7e:	68bb      	ldr	r3, [r7, #8]
     d80:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     d82:	e002      	b.n	d8a <next+0x1a>
     d84:	697b      	ldr	r3, [r7, #20]
     d86:	3301      	adds	r3, #1
     d88:	617b      	str	r3, [r7, #20]
     d8a:	697b      	ldr	r3, [r7, #20]
     d8c:	68fa      	ldr	r2, [r7, #12]
     d8e:	4413      	add	r3, r2
     d90:	781b      	ldrb	r3, [r3, #0]
     d92:	2b00      	cmp	r3, #0
     d94:	d006      	beq.n	da4 <next+0x34>
     d96:	697b      	ldr	r3, [r7, #20]
     d98:	68fa      	ldr	r2, [r7, #12]
     d9a:	4413      	add	r3, r2
     d9c:	781b      	ldrb	r3, [r3, #0]
     d9e:	79fa      	ldrb	r2, [r7, #7]
     da0:	429a      	cmp	r2, r3
     da2:	d1ef      	bne.n	d84 <next+0x14>
	return end-start;
     da4:	697a      	ldr	r2, [r7, #20]
     da6:	68bb      	ldr	r3, [r7, #8]
     da8:	1ad3      	subs	r3, r2, r3
}
     daa:	4618      	mov	r0, r3
     dac:	371c      	adds	r7, #28
     dae:	46bd      	mov	sp, r7
     db0:	f85d 7b04 	ldr.w	r7, [sp], #4
     db4:	4770      	bx	lr
     db6:	bf00      	nop

00000db8 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     db8:	b480      	push	{r7}
     dba:	b085      	sub	sp, #20
     dbc:	af00      	add	r7, sp, #0
     dbe:	60f8      	str	r0, [r7, #12]
     dc0:	60b9      	str	r1, [r7, #8]
     dc2:	607a      	str	r2, [r7, #4]
	while (len){
     dc4:	e00a      	b.n	ddc <move+0x24>
		*dest++=*src++;
     dc6:	68bb      	ldr	r3, [r7, #8]
     dc8:	1c5a      	adds	r2, r3, #1
     dca:	60ba      	str	r2, [r7, #8]
     dcc:	68fa      	ldr	r2, [r7, #12]
     dce:	1c51      	adds	r1, r2, #1
     dd0:	60f9      	str	r1, [r7, #12]
     dd2:	7812      	ldrb	r2, [r2, #0]
     dd4:	701a      	strb	r2, [r3, #0]
		len--;
     dd6:	687b      	ldr	r3, [r7, #4]
     dd8:	3b01      	subs	r3, #1
     dda:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     ddc:	687b      	ldr	r3, [r7, #4]
     dde:	2b00      	cmp	r3, #0
     de0:	d1f1      	bne.n	dc6 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     de2:	68bb      	ldr	r3, [r7, #8]
     de4:	2200      	movs	r2, #0
     de6:	701a      	strb	r2, [r3, #0]
}
     de8:	3714      	adds	r7, #20
     dea:	46bd      	mov	sp, r7
     dec:	f85d 7b04 	ldr.w	r7, [sp], #4
     df0:	4770      	bx	lr
     df2:	bf00      	nop

00000df4 <word>:

// extrait le prochain mot du tib
static void word(){
     df4:	b580      	push	{r7, lr}
     df6:	b082      	sub	sp, #8
     df8:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     dfa:	4b1d      	ldr	r3, [pc, #116]	; (e70 <word+0x7c>)
     dfc:	681b      	ldr	r3, [r3, #0]
     dfe:	481d      	ldr	r0, [pc, #116]	; (e74 <word+0x80>)
     e00:	4619      	mov	r1, r3
     e02:	2220      	movs	r2, #32
     e04:	f7ff ff0e 	bl	c24 <skip>
     e08:	4603      	mov	r3, r0
     e0a:	461a      	mov	r2, r3
     e0c:	4b18      	ldr	r3, [pc, #96]	; (e70 <word+0x7c>)
     e0e:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     e10:	4b17      	ldr	r3, [pc, #92]	; (e70 <word+0x7c>)
     e12:	681b      	ldr	r3, [r3, #0]
     e14:	4a17      	ldr	r2, [pc, #92]	; (e74 <word+0x80>)
     e16:	5cd3      	ldrb	r3, [r2, r3]
     e18:	2b22      	cmp	r3, #34	; 0x22
     e1a:	d10f      	bne.n	e3c <word+0x48>
			in++;
     e1c:	4b14      	ldr	r3, [pc, #80]	; (e70 <word+0x7c>)
     e1e:	681b      	ldr	r3, [r3, #0]
     e20:	3301      	adds	r3, #1
     e22:	4a13      	ldr	r2, [pc, #76]	; (e70 <word+0x7c>)
     e24:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     e26:	4b12      	ldr	r3, [pc, #72]	; (e70 <word+0x7c>)
     e28:	681b      	ldr	r3, [r3, #0]
     e2a:	4812      	ldr	r0, [pc, #72]	; (e74 <word+0x80>)
     e2c:	4619      	mov	r1, r3
     e2e:	f7ff ff39 	bl	ca4 <quote>
     e32:	4603      	mov	r3, r0
     e34:	461a      	mov	r2, r3
     e36:	4b0e      	ldr	r3, [pc, #56]	; (e70 <word+0x7c>)
     e38:	601a      	str	r2, [r3, #0]
     e3a:	e016      	b.n	e6a <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     e3c:	4b0c      	ldr	r3, [pc, #48]	; (e70 <word+0x7c>)
     e3e:	681b      	ldr	r3, [r3, #0]
     e40:	480c      	ldr	r0, [pc, #48]	; (e74 <word+0x80>)
     e42:	4619      	mov	r1, r3
     e44:	2220      	movs	r2, #32
     e46:	f7ff ff93 	bl	d70 <next>
     e4a:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     e4c:	4b08      	ldr	r3, [pc, #32]	; (e70 <word+0x7c>)
     e4e:	681b      	ldr	r3, [r3, #0]
     e50:	4a08      	ldr	r2, [pc, #32]	; (e74 <word+0x80>)
     e52:	4413      	add	r3, r2
     e54:	4618      	mov	r0, r3
     e56:	4908      	ldr	r1, [pc, #32]	; (e78 <word+0x84>)
     e58:	687a      	ldr	r2, [r7, #4]
     e5a:	f7ff ffad 	bl	db8 <move>
			in+=len;
     e5e:	4b04      	ldr	r3, [pc, #16]	; (e70 <word+0x7c>)
     e60:	681a      	ldr	r2, [r3, #0]
     e62:	687b      	ldr	r3, [r7, #4]
     e64:	4413      	add	r3, r2
     e66:	4a02      	ldr	r2, [pc, #8]	; (e70 <word+0x7c>)
     e68:	6013      	str	r3, [r2, #0]
		}
}
     e6a:	3708      	adds	r7, #8
     e6c:	46bd      	mov	sp, r7
     e6e:	bd80      	pop	{r7, pc}
     e70:	200000a8 	.word	0x200000a8
     e74:	20000008 	.word	0x20000008
     e78:	20000058 	.word	0x20000058

00000e7c <parse_line>:

static void parse_line(unsigned llen){
     e7c:	b580      	push	{r7, lr}
     e7e:	b084      	sub	sp, #16
     e80:	af00      	add	r7, sp, #0
     e82:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     e84:	4b14      	ldr	r3, [pc, #80]	; (ed8 <parse_line+0x5c>)
     e86:	2200      	movs	r2, #0
     e88:	601a      	str	r2, [r3, #0]
	while (in<llen){
     e8a:	e019      	b.n	ec0 <parse_line+0x44>
		word();
     e8c:	f7ff ffb2 	bl	df4 <word>
		cmd_id=search_command((const char*) pad);
     e90:	4812      	ldr	r0, [pc, #72]	; (edc <parse_line+0x60>)
     e92:	f7ff fe99 	bl	bc8 <search_command>
     e96:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     e98:	68fb      	ldr	r3, [r7, #12]
     e9a:	2b00      	cmp	r3, #0
     e9c:	db06      	blt.n	eac <parse_line+0x30>
			commands[cmd_id].fn();
     e9e:	4a10      	ldr	r2, [pc, #64]	; (ee0 <parse_line+0x64>)
     ea0:	68fb      	ldr	r3, [r7, #12]
     ea2:	00db      	lsls	r3, r3, #3
     ea4:	4413      	add	r3, r2
     ea6:	685b      	ldr	r3, [r3, #4]
     ea8:	4798      	blx	r3
     eaa:	e009      	b.n	ec0 <parse_line+0x44>
		}else{
			conout(CR);
     eac:	200d      	movs	r0, #13
     eae:	f000 f93d 	bl	112c <conout>
			print((const char*)pad); conout('?');
     eb2:	480a      	ldr	r0, [pc, #40]	; (edc <parse_line+0x60>)
     eb4:	f000 f954 	bl	1160 <print>
     eb8:	203f      	movs	r0, #63	; 0x3f
     eba:	f000 f937 	bl	112c <conout>
			break;
     ebe:	e004      	b.n	eca <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     ec0:	4b05      	ldr	r3, [pc, #20]	; (ed8 <parse_line+0x5c>)
     ec2:	681a      	ldr	r2, [r3, #0]
     ec4:	687b      	ldr	r3, [r7, #4]
     ec6:	429a      	cmp	r2, r3
     ec8:	d3e0      	bcc.n	e8c <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     eca:	200d      	movs	r0, #13
     ecc:	f000 f92e 	bl	112c <conout>
}
     ed0:	3710      	adds	r7, #16
     ed2:	46bd      	mov	sp, r7
     ed4:	bd80      	pop	{r7, pc}
     ed6:	bf00      	nop
     ed8:	200000a8 	.word	0x200000a8
     edc:	20000058 	.word	0x20000058
     ee0:	0000312c 	.word	0x0000312c

00000ee4 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     ee4:	b480      	push	{r7}
     ee6:	b085      	sub	sp, #20
     ee8:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     eea:	4b0c      	ldr	r3, [pc, #48]	; (f1c <copy_blink_in_ram+0x38>)
     eec:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     eee:	4b0c      	ldr	r3, [pc, #48]	; (f20 <copy_blink_in_ram+0x3c>)
     ef0:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     ef2:	4b0c      	ldr	r3, [pc, #48]	; (f24 <copy_blink_in_ram+0x40>)
     ef4:	60bb      	str	r3, [r7, #8]
	while (start<end){
     ef6:	e007      	b.n	f08 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     ef8:	68bb      	ldr	r3, [r7, #8]
     efa:	1d1a      	adds	r2, r3, #4
     efc:	60ba      	str	r2, [r7, #8]
     efe:	68fa      	ldr	r2, [r7, #12]
     f00:	1d11      	adds	r1, r2, #4
     f02:	60f9      	str	r1, [r7, #12]
     f04:	6812      	ldr	r2, [r2, #0]
     f06:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     f08:	68fa      	ldr	r2, [r7, #12]
     f0a:	687b      	ldr	r3, [r7, #4]
     f0c:	429a      	cmp	r2, r3
     f0e:	d3f3      	bcc.n	ef8 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     f10:	3714      	adds	r7, #20
     f12:	46bd      	mov	sp, r7
     f14:	f85d 7b04 	ldr.w	r7, [sp], #4
     f18:	4770      	bx	lr
     f1a:	bf00      	nop
     f1c:	00003800 	.word	0x00003800
     f20:	00003890 	.word	0x00003890
     f24:	20002700 	.word	0x20002700

00000f28 <main>:

extern void print_fault(const char *msg, sfrp_t adr);



void main(void){
     f28:	b580      	push	{r7, lr}
     f2a:	b082      	sub	sp, #8
     f2c:	af00      	add	r7, sp, #0
	set_sysclock();
     f2e:	f7ff fbfd 	bl	72c <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     f32:	f06f 000a 	mvn.w	r0, #10
     f36:	210f      	movs	r1, #15
     f38:	f001 fabc 	bl	24b4 <set_int_priority>
	config_systicks();
     f3c:	f001 fc46 	bl	27cc <config_systicks>
	flash_enable();
     f40:	f000 fac0 	bl	14c4 <flash_enable>
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
     f44:	4b22      	ldr	r3, [pc, #136]	; (fd0 <main+0xa8>)
     f46:	221d      	movs	r2, #29
     f48:	619a      	str	r2, [r3, #24]
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
     f4a:	4b21      	ldr	r3, [pc, #132]	; (fd0 <main+0xa8>)
     f4c:	f44f 4280 	mov.w	r2, #16384	; 0x4000
     f50:	61da      	str	r2, [r3, #28]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     f52:	4a1f      	ldr	r2, [pc, #124]	; (fd0 <main+0xa8>)
     f54:	4b1e      	ldr	r3, [pc, #120]	; (fd0 <main+0xa8>)
     f56:	695b      	ldr	r3, [r3, #20]
     f58:	f043 0301 	orr.w	r3, r3, #1
     f5c:	6153      	str	r3, [r2, #20]
	config_pin(LED_PORT,LED_PIN,OUTPUT_OD_SLOW);
     f5e:	481d      	ldr	r0, [pc, #116]	; (fd4 <main+0xac>)
     f60:	210d      	movs	r1, #13
     f62:	2206      	movs	r2, #6
     f64:	f000 fed8 	bl	1d18 <config_pin>
	vt_init();
     f68:	f001 ffdc 	bl	2f24 <vt_init>
	keyboard_init();
     f6c:	f000 ff4e 	bl	1e0c <keyboard_init>
	tvout_init();
     f70:	f001 fc78 	bl	2864 <tvout_init>
	console_init(SERIAL);
     f74:	2001      	movs	r0, #1
     f76:	f000 f8c1 	bl	10fc <console_init>
	if (!vt_ready()){con_select(LOCAL);}
     f7a:	f002 f841 	bl	3000 <vt_ready>
     f7e:	4603      	mov	r3, r0
     f80:	2b00      	cmp	r3, #0
     f82:	d102      	bne.n	f8a <main+0x62>
     f84:	2000      	movs	r0, #0
     f86:	f000 f87d 	bl	1084 <con_select>
	cls();
     f8a:	f000 fa93 	bl	14b4 <cls>
	print(VERSION);
     f8e:	4b12      	ldr	r3, [pc, #72]	; (fd8 <main+0xb0>)
     f90:	681b      	ldr	r3, [r3, #0]
     f92:	4618      	mov	r0, r3
     f94:	f000 f8e4 	bl	1160 <print>
	copy_blink_in_ram();
     f98:	f7ff ffa4 	bl	ee4 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
     f9c:	480f      	ldr	r0, [pc, #60]	; (fdc <main+0xb4>)
     f9e:	f000 f8df 	bl	1160 <print>
     fa2:	4b0f      	ldr	r3, [pc, #60]	; (fe0 <main+0xb8>)
     fa4:	2200      	movs	r2, #0
     fa6:	4618      	mov	r0, r3
     fa8:	4611      	mov	r1, r2
     faa:	df0a      	svc	10
     fac:	200d      	movs	r0, #13
     fae:	f000 f8bd 	bl	112c <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     fb2:	2300      	movs	r3, #0
     fb4:	2200      	movs	r2, #0
     fb6:	4618      	mov	r0, r3
     fb8:	4611      	mov	r1, r2
     fba:	df01      	svc	1
	
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
     fbc:	4809      	ldr	r0, [pc, #36]	; (fe4 <main+0xbc>)
     fbe:	2150      	movs	r1, #80	; 0x50
     fc0:	f000 f8f2 	bl	11a8 <read_line>
     fc4:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     fc6:	6878      	ldr	r0, [r7, #4]
     fc8:	f7ff ff58 	bl	e7c <parse_line>
	}
     fcc:	e7f6      	b.n	fbc <main+0x94>
     fce:	bf00      	nop
     fd0:	40021000 	.word	0x40021000
     fd4:	40011000 	.word	0x40011000
     fd8:	20000000 	.word	0x20000000
     fdc:	0000320c 	.word	0x0000320c
     fe0:	200000ec 	.word	0x200000ec
     fe4:	20000008 	.word	0x20000008

00000fe8 <queue_insert>:
#include "vt100.h"

console_t con;


static void queue_insert(char c){
     fe8:	b480      	push	{r7}
     fea:	b083      	sub	sp, #12
     fec:	af00      	add	r7, sp, #0
     fee:	4603      	mov	r3, r0
     ff0:	71fb      	strb	r3, [r7, #7]
		con.queue[con.head++]=c;
     ff2:	4b0a      	ldr	r3, [pc, #40]	; (101c <queue_insert+0x34>)
     ff4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     ff6:	1c5a      	adds	r2, r3, #1
     ff8:	4908      	ldr	r1, [pc, #32]	; (101c <queue_insert+0x34>)
     ffa:	624a      	str	r2, [r1, #36]	; 0x24
     ffc:	4a07      	ldr	r2, [pc, #28]	; (101c <queue_insert+0x34>)
     ffe:	4413      	add	r3, r2
    1000:	79fa      	ldrb	r2, [r7, #7]
    1002:	705a      	strb	r2, [r3, #1]
		con.head&=CON_QUEUE_SIZE-1;
    1004:	4b05      	ldr	r3, [pc, #20]	; (101c <queue_insert+0x34>)
    1006:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1008:	f003 031f 	and.w	r3, r3, #31
    100c:	4a03      	ldr	r2, [pc, #12]	; (101c <queue_insert+0x34>)
    100e:	6253      	str	r3, [r2, #36]	; 0x24
}
    1010:	370c      	adds	r7, #12
    1012:	46bd      	mov	sp, r7
    1014:	f85d 7b04 	ldr.w	r7, [sp], #4
    1018:	4770      	bx	lr
    101a:	bf00      	nop
    101c:	200000f0 	.word	0x200000f0

00001020 <queue_getc>:

static char queue_getc(){
    1020:	b480      	push	{r7}
    1022:	b083      	sub	sp, #12
    1024:	af00      	add	r7, sp, #0
	char c=0;
    1026:	2300      	movs	r3, #0
    1028:	71fb      	strb	r3, [r7, #7]
	if (con.tail!=con.head){
    102a:	4b0e      	ldr	r3, [pc, #56]	; (1064 <queue_getc+0x44>)
    102c:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    102e:	4b0d      	ldr	r3, [pc, #52]	; (1064 <queue_getc+0x44>)
    1030:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1032:	429a      	cmp	r2, r3
    1034:	d00e      	beq.n	1054 <queue_getc+0x34>
		c=con.queue[con.tail++];
    1036:	4b0b      	ldr	r3, [pc, #44]	; (1064 <queue_getc+0x44>)
    1038:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    103a:	1c5a      	adds	r2, r3, #1
    103c:	4909      	ldr	r1, [pc, #36]	; (1064 <queue_getc+0x44>)
    103e:	628a      	str	r2, [r1, #40]	; 0x28
    1040:	4a08      	ldr	r2, [pc, #32]	; (1064 <queue_getc+0x44>)
    1042:	4413      	add	r3, r2
    1044:	785b      	ldrb	r3, [r3, #1]
    1046:	71fb      	strb	r3, [r7, #7]
		con.tail&=CON_QUEUE_SIZE-1;
    1048:	4b06      	ldr	r3, [pc, #24]	; (1064 <queue_getc+0x44>)
    104a:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    104c:	f003 031f 	and.w	r3, r3, #31
    1050:	4a04      	ldr	r2, [pc, #16]	; (1064 <queue_getc+0x44>)
    1052:	6293      	str	r3, [r2, #40]	; 0x28
	}
	return c;
    1054:	79fb      	ldrb	r3, [r7, #7]
}
    1056:	4618      	mov	r0, r3
    1058:	370c      	adds	r7, #12
    105a:	46bd      	mov	sp, r7
    105c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1060:	4770      	bx	lr
    1062:	bf00      	nop
    1064:	200000f0 	.word	0x200000f0

00001068 <con_queue_flush>:

void con_queue_flush(){
    1068:	b480      	push	{r7}
    106a:	af00      	add	r7, sp, #0
	con.tail=con.head=0;
    106c:	2300      	movs	r3, #0
    106e:	4a04      	ldr	r2, [pc, #16]	; (1080 <con_queue_flush+0x18>)
    1070:	6253      	str	r3, [r2, #36]	; 0x24
    1072:	4a03      	ldr	r2, [pc, #12]	; (1080 <con_queue_flush+0x18>)
    1074:	6293      	str	r3, [r2, #40]	; 0x28
}
    1076:	46bd      	mov	sp, r7
    1078:	f85d 7b04 	ldr.w	r7, [sp], #4
    107c:	4770      	bx	lr
    107e:	bf00      	nop
    1080:	200000f0 	.word	0x200000f0

00001084 <con_select>:

static const char PROMPT[]=" OK\n";

void con_select(console_dev_t dev){
    1084:	b580      	push	{r7, lr}
    1086:	b082      	sub	sp, #8
    1088:	af00      	add	r7, sp, #0
    108a:	4603      	mov	r3, r0
    108c:	71fb      	strb	r3, [r7, #7]
	con_queue_flush();
    108e:	f7ff ffeb 	bl	1068 <con_queue_flush>
	con.dev=dev;
    1092:	4a12      	ldr	r2, [pc, #72]	; (10dc <con_select+0x58>)
    1094:	79fb      	ldrb	r3, [r7, #7]
    1096:	7013      	strb	r3, [r2, #0]
	if (dev==LOCAL){
    1098:	79fb      	ldrb	r3, [r7, #7]
    109a:	2b00      	cmp	r3, #0
    109c:	d10c      	bne.n	10b8 <con_select+0x34>
		con.putc=gdi_putc;
    109e:	4b0f      	ldr	r3, [pc, #60]	; (10dc <con_select+0x58>)
    10a0:	4a0f      	ldr	r2, [pc, #60]	; (10e0 <con_select+0x5c>)
    10a2:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=gdi_clear_screen;
    10a4:	4b0d      	ldr	r3, [pc, #52]	; (10dc <con_select+0x58>)
    10a6:	4a0f      	ldr	r2, [pc, #60]	; (10e4 <con_select+0x60>)
    10a8:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=gdi_del_back;
    10aa:	4b0c      	ldr	r3, [pc, #48]	; (10dc <con_select+0x58>)
    10ac:	4a0e      	ldr	r2, [pc, #56]	; (10e8 <con_select+0x64>)
    10ae:	639a      	str	r2, [r3, #56]	; 0x38
		gdi_text_cursor(1);
    10b0:	2001      	movs	r0, #1
    10b2:	f000 fdab 	bl	1c0c <gdi_text_cursor>
    10b6:	e00b      	b.n	10d0 <con_select+0x4c>
	}else{
		gdi_text_cursor(0);
    10b8:	2000      	movs	r0, #0
    10ba:	f000 fda7 	bl	1c0c <gdi_text_cursor>
		con.putc=vt_putc;
    10be:	4b07      	ldr	r3, [pc, #28]	; (10dc <con_select+0x58>)
    10c0:	4a0a      	ldr	r2, [pc, #40]	; (10ec <con_select+0x68>)
    10c2:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=vt_cls;
    10c4:	4b05      	ldr	r3, [pc, #20]	; (10dc <con_select+0x58>)
    10c6:	4a0a      	ldr	r2, [pc, #40]	; (10f0 <con_select+0x6c>)
    10c8:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=vt_del_back;
    10ca:	4b04      	ldr	r3, [pc, #16]	; (10dc <con_select+0x58>)
    10cc:	4a09      	ldr	r2, [pc, #36]	; (10f4 <con_select+0x70>)
    10ce:	639a      	str	r2, [r3, #56]	; 0x38
	}
	print(PROMPT);
    10d0:	4809      	ldr	r0, [pc, #36]	; (10f8 <con_select+0x74>)
    10d2:	f000 f845 	bl	1160 <print>
}
    10d6:	3708      	adds	r7, #8
    10d8:	46bd      	mov	sp, r7
    10da:	bd80      	pop	{r7, pc}
    10dc:	200000f0 	.word	0x200000f0
    10e0:	00001b01 	.word	0x00001b01
    10e4:	000016bd 	.word	0x000016bd
    10e8:	00001abd 	.word	0x00001abd
    10ec:	00002f45 	.word	0x00002f45
    10f0:	00002fa5 	.word	0x00002fa5
    10f4:	00002f65 	.word	0x00002f65
    10f8:	00003228 	.word	0x00003228

000010fc <console_init>:

void console_init(console_dev_t dev){
    10fc:	b580      	push	{r7, lr}
    10fe:	b082      	sub	sp, #8
    1100:	af00      	add	r7, sp, #0
    1102:	4603      	mov	r3, r0
    1104:	71fb      	strb	r3, [r7, #7]
	con.getc=queue_getc;
    1106:	4b06      	ldr	r3, [pc, #24]	; (1120 <console_init+0x24>)
    1108:	4a06      	ldr	r2, [pc, #24]	; (1124 <console_init+0x28>)
    110a:	631a      	str	r2, [r3, #48]	; 0x30
	con.insert=queue_insert;
    110c:	4b04      	ldr	r3, [pc, #16]	; (1120 <console_init+0x24>)
    110e:	4a06      	ldr	r2, [pc, #24]	; (1128 <console_init+0x2c>)
    1110:	62da      	str	r2, [r3, #44]	; 0x2c
	con_select(dev);
    1112:	79fb      	ldrb	r3, [r7, #7]
    1114:	4618      	mov	r0, r3
    1116:	f7ff ffb5 	bl	1084 <con_select>
}
    111a:	3708      	adds	r7, #8
    111c:	46bd      	mov	sp, r7
    111e:	bd80      	pop	{r7, pc}
    1120:	200000f0 	.word	0x200000f0
    1124:	00001021 	.word	0x00001021
    1128:	00000fe9 	.word	0x00000fe9

0000112c <conout>:

// envoie d'un caractère à la console
void conout(char c){
    112c:	b580      	push	{r7, lr}
    112e:	b082      	sub	sp, #8
    1130:	af00      	add	r7, sp, #0
    1132:	4603      	mov	r3, r0
    1134:	71fb      	strb	r3, [r7, #7]
	con.putc(c);
    1136:	4b04      	ldr	r3, [pc, #16]	; (1148 <conout+0x1c>)
    1138:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    113a:	79fa      	ldrb	r2, [r7, #7]
    113c:	4610      	mov	r0, r2
    113e:	4798      	blx	r3
}
    1140:	3708      	adds	r7, #8
    1142:	46bd      	mov	sp, r7
    1144:	bd80      	pop	{r7, pc}
    1146:	bf00      	nop
    1148:	200000f0 	.word	0x200000f0

0000114c <conin>:


// réception d'un caractère de la console
char conin(){
    114c:	b580      	push	{r7, lr}
    114e:	af00      	add	r7, sp, #0
	return con.getc();
    1150:	4b02      	ldr	r3, [pc, #8]	; (115c <conin+0x10>)
    1152:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    1154:	4798      	blx	r3
    1156:	4603      	mov	r3, r0
}
    1158:	4618      	mov	r0, r3
    115a:	bd80      	pop	{r7, pc}
    115c:	200000f0 	.word	0x200000f0

00001160 <print>:

// imprime un chaîne sur la console
void print(const char *str){
    1160:	b580      	push	{r7, lr}
    1162:	b082      	sub	sp, #8
    1164:	af00      	add	r7, sp, #0
    1166:	6078      	str	r0, [r7, #4]
	while (*str) {con.putc(*str++);}
    1168:	e007      	b.n	117a <print+0x1a>
    116a:	4b07      	ldr	r3, [pc, #28]	; (1188 <print+0x28>)
    116c:	6b5a      	ldr	r2, [r3, #52]	; 0x34
    116e:	687b      	ldr	r3, [r7, #4]
    1170:	1c59      	adds	r1, r3, #1
    1172:	6079      	str	r1, [r7, #4]
    1174:	781b      	ldrb	r3, [r3, #0]
    1176:	4618      	mov	r0, r3
    1178:	4790      	blx	r2
    117a:	687b      	ldr	r3, [r7, #4]
    117c:	781b      	ldrb	r3, [r3, #0]
    117e:	2b00      	cmp	r3, #0
    1180:	d1f3      	bne.n	116a <print+0xa>
}
    1182:	3708      	adds	r7, #8
    1184:	46bd      	mov	sp, r7
    1186:	bd80      	pop	{r7, pc}
    1188:	200000f0 	.word	0x200000f0

0000118c <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    118c:	b580      	push	{r7, lr}
    118e:	af00      	add	r7, sp, #0
	con.delete_back();
    1190:	4b01      	ldr	r3, [pc, #4]	; (1198 <delete_back+0xc>)
    1192:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1194:	4798      	blx	r3
}
    1196:	bd80      	pop	{r7, pc}
    1198:	200000f0 	.word	0x200000f0

0000119c <beep>:

static void beep(){
    119c:	b480      	push	{r7}
    119e:	af00      	add	r7, sp, #0
}
    11a0:	46bd      	mov	sp, r7
    11a2:	f85d 7b04 	ldr.w	r7, [sp], #4
    11a6:	4770      	bx	lr

000011a8 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    11a8:	b580      	push	{r7, lr}
    11aa:	b084      	sub	sp, #16
    11ac:	af00      	add	r7, sp, #0
    11ae:	6078      	str	r0, [r7, #4]
    11b0:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    11b2:	2300      	movs	r3, #0
    11b4:	60fb      	str	r3, [r7, #12]
	char c=0;
    11b6:	2300      	movs	r3, #0
    11b8:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    11ba:	683b      	ldr	r3, [r7, #0]
    11bc:	3b01      	subs	r3, #1
    11be:	603b      	str	r3, [r7, #0]
	while (c!=13){
    11c0:	e098      	b.n	12f4 <read_line+0x14c>
			c=con.getc();
    11c2:	4b53      	ldr	r3, [pc, #332]	; (1310 <read_line+0x168>)
    11c4:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    11c6:	4798      	blx	r3
    11c8:	4603      	mov	r3, r0
    11ca:	72fb      	strb	r3, [r7, #11]
			switch(c){
    11cc:	7afb      	ldrb	r3, [r7, #11]
    11ce:	2b18      	cmp	r3, #24
    11d0:	d87a      	bhi.n	12c8 <read_line+0x120>
    11d2:	a201      	add	r2, pc, #4	; (adr r2, 11d8 <read_line+0x30>)
    11d4:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    11d8:	000012f5 	.word	0x000012f5
    11dc:	000012c9 	.word	0x000012c9
    11e0:	000012c9 	.word	0x000012c9
    11e4:	000012c9 	.word	0x000012c9
    11e8:	000012c9 	.word	0x000012c9
    11ec:	000012b9 	.word	0x000012b9
    11f0:	000012c9 	.word	0x000012c9
    11f4:	000012c9 	.word	0x000012c9
    11f8:	000012a5 	.word	0x000012a5
    11fc:	000012c5 	.word	0x000012c5
    1200:	0000123d 	.word	0x0000123d
    1204:	000012c9 	.word	0x000012c9
    1208:	000012c9 	.word	0x000012c9
    120c:	0000123d 	.word	0x0000123d
    1210:	000012c9 	.word	0x000012c9
    1214:	000012c9 	.word	0x000012c9
    1218:	000012c9 	.word	0x000012c9
    121c:	000012c9 	.word	0x000012c9
    1220:	000012c9 	.word	0x000012c9
    1224:	000012c9 	.word	0x000012c9
    1228:	000012c9 	.word	0x000012c9
    122c:	00001259 	.word	0x00001259
    1230:	000012c9 	.word	0x000012c9
    1234:	0000126d 	.word	0x0000126d
    1238:	00001259 	.word	0x00001259
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    123c:	230d      	movs	r3, #13
    123e:	72fb      	strb	r3, [r7, #11]
				con.putc(c);
    1240:	4b33      	ldr	r3, [pc, #204]	; (1310 <read_line+0x168>)
    1242:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1244:	7afa      	ldrb	r2, [r7, #11]
    1246:	4610      	mov	r0, r2
    1248:	4798      	blx	r3
				break;
    124a:	e053      	b.n	12f4 <read_line+0x14c>
				case CTRL_X:
				case CTRL_U:
				while (line_len){con.delete_back();line_len--;}
    124c:	4b30      	ldr	r3, [pc, #192]	; (1310 <read_line+0x168>)
    124e:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1250:	4798      	blx	r3
    1252:	68fb      	ldr	r3, [r7, #12]
    1254:	3b01      	subs	r3, #1
    1256:	60fb      	str	r3, [r7, #12]
    1258:	68fb      	ldr	r3, [r7, #12]
    125a:	2b00      	cmp	r3, #0
    125c:	d1f6      	bne.n	124c <read_line+0xa4>
				//con.clear_line(line_len);
				//line_len=0;
				break;
    125e:	e049      	b.n	12f4 <read_line+0x14c>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
    1260:	4b2b      	ldr	r3, [pc, #172]	; (1310 <read_line+0x168>)
    1262:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1264:	4798      	blx	r3
					line_len--;
    1266:	68fb      	ldr	r3, [r7, #12]
    1268:	3b01      	subs	r3, #1
    126a:	60fb      	str	r3, [r7, #12]
				while (line_len){con.delete_back();line_len--;}
				//con.clear_line(line_len);
				//line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    126c:	68fb      	ldr	r3, [r7, #12]
    126e:	2b00      	cmp	r3, #0
    1270:	d006      	beq.n	1280 <read_line+0xd8>
    1272:	68fb      	ldr	r3, [r7, #12]
    1274:	3b01      	subs	r3, #1
    1276:	687a      	ldr	r2, [r7, #4]
    1278:	4413      	add	r3, r2
    127a:	781b      	ldrb	r3, [r3, #0]
    127c:	2b20      	cmp	r3, #32
    127e:	d0ef      	beq.n	1260 <read_line+0xb8>
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1280:	e005      	b.n	128e <read_line+0xe6>
					con.delete_back();
    1282:	4b23      	ldr	r3, [pc, #140]	; (1310 <read_line+0x168>)
    1284:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1286:	4798      	blx	r3
					line_len--;
    1288:	68fb      	ldr	r3, [r7, #12]
    128a:	3b01      	subs	r3, #1
    128c:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    128e:	68fb      	ldr	r3, [r7, #12]
    1290:	2b00      	cmp	r3, #0
    1292:	d006      	beq.n	12a2 <read_line+0xfa>
    1294:	68fb      	ldr	r3, [r7, #12]
    1296:	3b01      	subs	r3, #1
    1298:	687a      	ldr	r2, [r7, #4]
    129a:	4413      	add	r3, r2
    129c:	781b      	ldrb	r3, [r3, #0]
    129e:	2b20      	cmp	r3, #32
    12a0:	d1ef      	bne.n	1282 <read_line+0xda>
					con.delete_back();
					line_len--;
				}
				break;
    12a2:	e027      	b.n	12f4 <read_line+0x14c>
				case BS:
				if (line_len){
    12a4:	68fb      	ldr	r3, [r7, #12]
    12a6:	2b00      	cmp	r3, #0
    12a8:	d005      	beq.n	12b6 <read_line+0x10e>
					con.delete_back();
    12aa:	4b19      	ldr	r3, [pc, #100]	; (1310 <read_line+0x168>)
    12ac:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    12ae:	4798      	blx	r3
					line_len--;
    12b0:	68fb      	ldr	r3, [r7, #12]
    12b2:	3b01      	subs	r3, #1
    12b4:	60fb      	str	r3, [r7, #12]
				}
				break;
    12b6:	e01d      	b.n	12f4 <read_line+0x14c>
				case CTRL_E:
				con.cls();
    12b8:	4b15      	ldr	r3, [pc, #84]	; (1310 <read_line+0x168>)
    12ba:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    12bc:	4798      	blx	r3
				line_len=0;
    12be:	2300      	movs	r3, #0
    12c0:	60fb      	str	r3, [r7, #12]
				break;
    12c2:	e017      	b.n	12f4 <read_line+0x14c>
				case TAB:
				c=SPACE;
    12c4:	2320      	movs	r3, #32
    12c6:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    12c8:	68fa      	ldr	r2, [r7, #12]
    12ca:	683b      	ldr	r3, [r7, #0]
    12cc:	429a      	cmp	r2, r3
    12ce:	d20f      	bcs.n	12f0 <read_line+0x148>
    12d0:	7afb      	ldrb	r3, [r7, #11]
    12d2:	2b1f      	cmp	r3, #31
    12d4:	d90c      	bls.n	12f0 <read_line+0x148>
					buffer[line_len++]=c;
    12d6:	68fb      	ldr	r3, [r7, #12]
    12d8:	1c5a      	adds	r2, r3, #1
    12da:	60fa      	str	r2, [r7, #12]
    12dc:	687a      	ldr	r2, [r7, #4]
    12de:	4413      	add	r3, r2
    12e0:	7afa      	ldrb	r2, [r7, #11]
    12e2:	701a      	strb	r2, [r3, #0]
					con.putc(c);
    12e4:	4b0a      	ldr	r3, [pc, #40]	; (1310 <read_line+0x168>)
    12e6:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    12e8:	7afa      	ldrb	r2, [r7, #11]
    12ea:	4610      	mov	r0, r2
    12ec:	4798      	blx	r3
    12ee:	e001      	b.n	12f4 <read_line+0x14c>
				}else{
					beep();
    12f0:	f7ff ff54 	bl	119c <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    12f4:	7afb      	ldrb	r3, [r7, #11]
    12f6:	2b0d      	cmp	r3, #13
    12f8:	f47f af63 	bne.w	11c2 <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    12fc:	687a      	ldr	r2, [r7, #4]
    12fe:	68fb      	ldr	r3, [r7, #12]
    1300:	4413      	add	r3, r2
    1302:	2200      	movs	r2, #0
    1304:	701a      	strb	r2, [r3, #0]
	return line_len;
    1306:	68fb      	ldr	r3, [r7, #12]
}
    1308:	4618      	mov	r0, r3
    130a:	3710      	adds	r7, #16
    130c:	46bd      	mov	sp, r7
    130e:	bd80      	pop	{r7, pc}
    1310:	200000f0 	.word	0x200000f0

00001314 <print_int>:

// imprime un entier
// i entier à imprimer
// base  numérique
void print_int(int i, unsigned base){
    1314:	b580      	push	{r7, lr}
    1316:	b08e      	sub	sp, #56	; 0x38
    1318:	af00      	add	r7, sp, #0
    131a:	6078      	str	r0, [r7, #4]
    131c:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    131e:	2301      	movs	r3, #1
    1320:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    1322:	2322      	movs	r3, #34	; 0x22
    1324:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    1326:	2300      	movs	r3, #0
    1328:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    132c:	687b      	ldr	r3, [r7, #4]
    132e:	2b00      	cmp	r3, #0
    1330:	da05      	bge.n	133e <print_int+0x2a>
    1332:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1336:	637b      	str	r3, [r7, #52]	; 0x34
    1338:	687b      	ldr	r3, [r7, #4]
    133a:	425b      	negs	r3, r3
    133c:	607b      	str	r3, [r7, #4]
	while (i){
    133e:	e02c      	b.n	139a <print_int+0x86>
		fmt[pos]=i%base+'0';
    1340:	687b      	ldr	r3, [r7, #4]
    1342:	683a      	ldr	r2, [r7, #0]
    1344:	fbb3 f2f2 	udiv	r2, r3, r2
    1348:	6839      	ldr	r1, [r7, #0]
    134a:	fb01 f202 	mul.w	r2, r1, r2
    134e:	1a9b      	subs	r3, r3, r2
    1350:	b2db      	uxtb	r3, r3
    1352:	3330      	adds	r3, #48	; 0x30
    1354:	b2d9      	uxtb	r1, r3
    1356:	f107 020c 	add.w	r2, r7, #12
    135a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    135c:	4413      	add	r3, r2
    135e:	460a      	mov	r2, r1
    1360:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    1362:	f107 020c 	add.w	r2, r7, #12
    1366:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1368:	4413      	add	r3, r2
    136a:	781b      	ldrb	r3, [r3, #0]
    136c:	2b39      	cmp	r3, #57	; 0x39
    136e:	d90c      	bls.n	138a <print_int+0x76>
    1370:	f107 020c 	add.w	r2, r7, #12
    1374:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1376:	4413      	add	r3, r2
    1378:	781b      	ldrb	r3, [r3, #0]
    137a:	3307      	adds	r3, #7
    137c:	b2d9      	uxtb	r1, r3
    137e:	f107 020c 	add.w	r2, r7, #12
    1382:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1384:	4413      	add	r3, r2
    1386:	460a      	mov	r2, r1
    1388:	701a      	strb	r2, [r3, #0]
		pos--;
    138a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    138c:	3b01      	subs	r3, #1
    138e:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    1390:	687a      	ldr	r2, [r7, #4]
    1392:	683b      	ldr	r3, [r7, #0]
    1394:	fbb2 f3f3 	udiv	r3, r2, r3
    1398:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    139a:	687b      	ldr	r3, [r7, #4]
    139c:	2b00      	cmp	r3, #0
    139e:	d1cf      	bne.n	1340 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    13a0:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13a2:	2b22      	cmp	r3, #34	; 0x22
    13a4:	d108      	bne.n	13b8 <print_int+0xa4>
    13a6:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13a8:	1e5a      	subs	r2, r3, #1
    13aa:	633a      	str	r2, [r7, #48]	; 0x30
    13ac:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13b0:	4413      	add	r3, r2
    13b2:	2230      	movs	r2, #48	; 0x30
    13b4:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    13b8:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    13ba:	2b00      	cmp	r3, #0
    13bc:	da08      	bge.n	13d0 <print_int+0xbc>
    13be:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13c0:	1e5a      	subs	r2, r3, #1
    13c2:	633a      	str	r2, [r7, #48]	; 0x30
    13c4:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13c8:	4413      	add	r3, r2
    13ca:	222d      	movs	r2, #45	; 0x2d
    13cc:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    13d0:	f107 020c 	add.w	r2, r7, #12
    13d4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13d6:	4413      	add	r3, r2
    13d8:	2220      	movs	r2, #32
    13da:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    13dc:	f107 020c 	add.w	r2, r7, #12
    13e0:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13e2:	4413      	add	r3, r2
    13e4:	4618      	mov	r0, r3
    13e6:	f7ff febb 	bl	1160 <print>
}
    13ea:	3738      	adds	r7, #56	; 0x38
    13ec:	46bd      	mov	sp, r7
    13ee:	bd80      	pop	{r7, pc}

000013f0 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    13f0:	b580      	push	{r7, lr}
    13f2:	b088      	sub	sp, #32
    13f4:	af00      	add	r7, sp, #0
    13f6:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    13f8:	230c      	movs	r3, #12
    13fa:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    13fc:	2300      	movs	r3, #0
    13fe:	767b      	strb	r3, [r7, #25]
	while (u){
    1400:	e026      	b.n	1450 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    1402:	687b      	ldr	r3, [r7, #4]
    1404:	b2db      	uxtb	r3, r3
    1406:	f003 030f 	and.w	r3, r3, #15
    140a:	b2db      	uxtb	r3, r3
    140c:	3330      	adds	r3, #48	; 0x30
    140e:	b2d9      	uxtb	r1, r3
    1410:	f107 020c 	add.w	r2, r7, #12
    1414:	69fb      	ldr	r3, [r7, #28]
    1416:	4413      	add	r3, r2
    1418:	460a      	mov	r2, r1
    141a:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    141c:	f107 020c 	add.w	r2, r7, #12
    1420:	69fb      	ldr	r3, [r7, #28]
    1422:	4413      	add	r3, r2
    1424:	781b      	ldrb	r3, [r3, #0]
    1426:	2b39      	cmp	r3, #57	; 0x39
    1428:	d90c      	bls.n	1444 <print_hex+0x54>
    142a:	f107 020c 	add.w	r2, r7, #12
    142e:	69fb      	ldr	r3, [r7, #28]
    1430:	4413      	add	r3, r2
    1432:	781b      	ldrb	r3, [r3, #0]
    1434:	3307      	adds	r3, #7
    1436:	b2d9      	uxtb	r1, r3
    1438:	f107 020c 	add.w	r2, r7, #12
    143c:	69fb      	ldr	r3, [r7, #28]
    143e:	4413      	add	r3, r2
    1440:	460a      	mov	r2, r1
    1442:	701a      	strb	r2, [r3, #0]
		pos--;
    1444:	69fb      	ldr	r3, [r7, #28]
    1446:	3b01      	subs	r3, #1
    1448:	61fb      	str	r3, [r7, #28]
		u/=16;
    144a:	687b      	ldr	r3, [r7, #4]
    144c:	091b      	lsrs	r3, r3, #4
    144e:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    1450:	687b      	ldr	r3, [r7, #4]
    1452:	2b00      	cmp	r3, #0
    1454:	d1d5      	bne.n	1402 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    1456:	69fb      	ldr	r3, [r7, #28]
    1458:	2b0c      	cmp	r3, #12
    145a:	d108      	bne.n	146e <print_hex+0x7e>
    145c:	69fb      	ldr	r3, [r7, #28]
    145e:	1e5a      	subs	r2, r3, #1
    1460:	61fa      	str	r2, [r7, #28]
    1462:	f107 0220 	add.w	r2, r7, #32
    1466:	4413      	add	r3, r2
    1468:	2230      	movs	r2, #48	; 0x30
    146a:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    146e:	69fb      	ldr	r3, [r7, #28]
    1470:	1e5a      	subs	r2, r3, #1
    1472:	61fa      	str	r2, [r7, #28]
    1474:	f107 0220 	add.w	r2, r7, #32
    1478:	4413      	add	r3, r2
    147a:	2278      	movs	r2, #120	; 0x78
    147c:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    1480:	69fb      	ldr	r3, [r7, #28]
    1482:	1e5a      	subs	r2, r3, #1
    1484:	61fa      	str	r2, [r7, #28]
    1486:	f107 0220 	add.w	r2, r7, #32
    148a:	4413      	add	r3, r2
    148c:	2230      	movs	r2, #48	; 0x30
    148e:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    1492:	f107 020c 	add.w	r2, r7, #12
    1496:	69fb      	ldr	r3, [r7, #28]
    1498:	4413      	add	r3, r2
    149a:	2220      	movs	r2, #32
    149c:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    149e:	f107 020c 	add.w	r2, r7, #12
    14a2:	69fb      	ldr	r3, [r7, #28]
    14a4:	4413      	add	r3, r2
    14a6:	4618      	mov	r0, r3
    14a8:	f7ff fe5a 	bl	1160 <print>
}
    14ac:	3720      	adds	r7, #32
    14ae:	46bd      	mov	sp, r7
    14b0:	bd80      	pop	{r7, pc}
    14b2:	bf00      	nop

000014b4 <cls>:

void cls(){
    14b4:	b580      	push	{r7, lr}
    14b6:	af00      	add	r7, sp, #0
	con.cls();
    14b8:	4b01      	ldr	r3, [pc, #4]	; (14c0 <cls+0xc>)
    14ba:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    14bc:	4798      	blx	r3
}
    14be:	bd80      	pop	{r7, pc}
    14c0:	200000f0 	.word	0x200000f0

000014c4 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    14c4:	b480      	push	{r7}
    14c6:	af00      	add	r7, sp, #0
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
    14c8:	4b13      	ldr	r3, [pc, #76]	; (1518 <flash_enable+0x54>)
    14ca:	681b      	ldr	r3, [r3, #0]
    14cc:	f003 0301 	and.w	r3, r3, #1
    14d0:	2b00      	cmp	r3, #0
    14d2:	d10c      	bne.n	14ee <flash_enable+0x2a>
		RCC->CR|=RCC_CR_HSION;
    14d4:	4a10      	ldr	r2, [pc, #64]	; (1518 <flash_enable+0x54>)
    14d6:	4b10      	ldr	r3, [pc, #64]	; (1518 <flash_enable+0x54>)
    14d8:	681b      	ldr	r3, [r3, #0]
    14da:	f043 0301 	orr.w	r3, r3, #1
    14de:	6013      	str	r3, [r2, #0]
		while (!(RCC->CR&RCC_CR_HSIRDY));
    14e0:	bf00      	nop
    14e2:	4b0d      	ldr	r3, [pc, #52]	; (1518 <flash_enable+0x54>)
    14e4:	681b      	ldr	r3, [r3, #0]
    14e6:	f003 0302 	and.w	r3, r3, #2
    14ea:	2b00      	cmp	r3, #0
    14ec:	d0f9      	beq.n	14e2 <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    14ee:	4b0b      	ldr	r3, [pc, #44]	; (151c <flash_enable+0x58>)
    14f0:	4a0b      	ldr	r2, [pc, #44]	; (1520 <flash_enable+0x5c>)
    14f2:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    14f4:	4b09      	ldr	r3, [pc, #36]	; (151c <flash_enable+0x58>)
    14f6:	4a0b      	ldr	r2, [pc, #44]	; (1524 <flash_enable+0x60>)
    14f8:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    14fa:	4b08      	ldr	r3, [pc, #32]	; (151c <flash_enable+0x58>)
    14fc:	691b      	ldr	r3, [r3, #16]
    14fe:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1502:	2b00      	cmp	r3, #0
    1504:	bf0c      	ite	eq
    1506:	2301      	moveq	r3, #1
    1508:	2300      	movne	r3, #0
    150a:	b2db      	uxtb	r3, r3
}
    150c:	4618      	mov	r0, r3
    150e:	46bd      	mov	sp, r7
    1510:	f85d 7b04 	ldr.w	r7, [sp], #4
    1514:	4770      	bx	lr
    1516:	bf00      	nop
    1518:	40021000 	.word	0x40021000
    151c:	40022000 	.word	0x40022000
    1520:	45670123 	.word	0x45670123
    1524:	cdef89ab 	.word	0xcdef89ab

00001528 <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    1528:	b480      	push	{r7}
    152a:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    152c:	4a04      	ldr	r2, [pc, #16]	; (1540 <flash_disable+0x18>)
    152e:	4b04      	ldr	r3, [pc, #16]	; (1540 <flash_disable+0x18>)
    1530:	691b      	ldr	r3, [r3, #16]
    1532:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    1536:	6113      	str	r3, [r2, #16]
}
    1538:	46bd      	mov	sp, r7
    153a:	f85d 7b04 	ldr.w	r7, [sp], #4
    153e:	4770      	bx	lr
    1540:	40022000 	.word	0x40022000

00001544 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1544:	b480      	push	{r7}
    1546:	b083      	sub	sp, #12
    1548:	af00      	add	r7, sp, #0
    154a:	6078      	str	r0, [r7, #4]
    154c:	460b      	mov	r3, r1
    154e:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    1550:	4b1d      	ldr	r3, [pc, #116]	; (15c8 <flash_write+0x84>)
    1552:	691b      	ldr	r3, [r3, #16]
    1554:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1558:	2b00      	cmp	r3, #0
    155a:	d105      	bne.n	1568 <flash_write+0x24>
    155c:	687b      	ldr	r3, [r7, #4]
    155e:	881b      	ldrh	r3, [r3, #0]
    1560:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1564:	4293      	cmp	r3, r2
    1566:	d001      	beq.n	156c <flash_write+0x28>
    1568:	2300      	movs	r3, #0
    156a:	e027      	b.n	15bc <flash_write+0x78>
	while (_flash_busy);
    156c:	bf00      	nop
    156e:	4b16      	ldr	r3, [pc, #88]	; (15c8 <flash_write+0x84>)
    1570:	68db      	ldr	r3, [r3, #12]
    1572:	f003 0301 	and.w	r3, r3, #1
    1576:	2b00      	cmp	r3, #0
    1578:	d1f9      	bne.n	156e <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    157a:	4a13      	ldr	r2, [pc, #76]	; (15c8 <flash_write+0x84>)
    157c:	4b12      	ldr	r3, [pc, #72]	; (15c8 <flash_write+0x84>)
    157e:	68db      	ldr	r3, [r3, #12]
    1580:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1584:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    1586:	4b10      	ldr	r3, [pc, #64]	; (15c8 <flash_write+0x84>)
    1588:	2201      	movs	r2, #1
    158a:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    158c:	687b      	ldr	r3, [r7, #4]
    158e:	887a      	ldrh	r2, [r7, #2]
    1590:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    1592:	bf00      	nop
    1594:	4b0c      	ldr	r3, [pc, #48]	; (15c8 <flash_write+0x84>)
    1596:	68db      	ldr	r3, [r3, #12]
    1598:	f003 0301 	and.w	r3, r3, #1
    159c:	2b00      	cmp	r3, #0
    159e:	d005      	beq.n	15ac <flash_write+0x68>
    15a0:	4b09      	ldr	r3, [pc, #36]	; (15c8 <flash_write+0x84>)
    15a2:	68db      	ldr	r3, [r3, #12]
    15a4:	f003 0320 	and.w	r3, r3, #32
    15a8:	2b00      	cmp	r3, #0
    15aa:	d0f3      	beq.n	1594 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    15ac:	687b      	ldr	r3, [r7, #4]
    15ae:	881b      	ldrh	r3, [r3, #0]
    15b0:	887a      	ldrh	r2, [r7, #2]
    15b2:	429a      	cmp	r2, r3
    15b4:	bf0c      	ite	eq
    15b6:	2301      	moveq	r3, #1
    15b8:	2300      	movne	r3, #0
    15ba:	b2db      	uxtb	r3, r3
}
    15bc:	4618      	mov	r0, r3
    15be:	370c      	adds	r7, #12
    15c0:	46bd      	mov	sp, r7
    15c2:	f85d 7b04 	ldr.w	r7, [sp], #4
    15c6:	4770      	bx	lr
    15c8:	40022000 	.word	0x40022000

000015cc <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    15cc:	b480      	push	{r7}
    15ce:	b087      	sub	sp, #28
    15d0:	af00      	add	r7, sp, #0
    15d2:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    15d4:	4b27      	ldr	r3, [pc, #156]	; (1674 <flash_erase_page+0xa8>)
    15d6:	691b      	ldr	r3, [r3, #16]
    15d8:	f003 0380 	and.w	r3, r3, #128	; 0x80
    15dc:	2b00      	cmp	r3, #0
    15de:	d001      	beq.n	15e4 <flash_erase_page+0x18>
    15e0:	2300      	movs	r3, #0
    15e2:	e040      	b.n	1666 <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    15e4:	4a23      	ldr	r2, [pc, #140]	; (1674 <flash_erase_page+0xa8>)
    15e6:	4b23      	ldr	r3, [pc, #140]	; (1674 <flash_erase_page+0xa8>)
    15e8:	68db      	ldr	r3, [r3, #12]
    15ea:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    15ee:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    15f0:	687b      	ldr	r3, [r7, #4]
    15f2:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    15f6:	f023 0303 	bic.w	r3, r3, #3
    15fa:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    15fc:	4b1d      	ldr	r3, [pc, #116]	; (1674 <flash_erase_page+0xa8>)
    15fe:	2202      	movs	r2, #2
    1600:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    1602:	4a1c      	ldr	r2, [pc, #112]	; (1674 <flash_erase_page+0xa8>)
    1604:	687b      	ldr	r3, [r7, #4]
    1606:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    1608:	4a1a      	ldr	r2, [pc, #104]	; (1674 <flash_erase_page+0xa8>)
    160a:	4b1a      	ldr	r3, [pc, #104]	; (1674 <flash_erase_page+0xa8>)
    160c:	691b      	ldr	r3, [r3, #16]
    160e:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1612:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    1614:	bf00      	nop
    1616:	4b17      	ldr	r3, [pc, #92]	; (1674 <flash_erase_page+0xa8>)
    1618:	68db      	ldr	r3, [r3, #12]
    161a:	f003 0301 	and.w	r3, r3, #1
    161e:	2b00      	cmp	r3, #0
    1620:	d005      	beq.n	162e <flash_erase_page+0x62>
    1622:	4b14      	ldr	r3, [pc, #80]	; (1674 <flash_erase_page+0xa8>)
    1624:	68db      	ldr	r3, [r3, #12]
    1626:	f003 0320 	and.w	r3, r3, #32
    162a:	2b00      	cmp	r3, #0
    162c:	d0f3      	beq.n	1616 <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    162e:	687b      	ldr	r3, [r7, #4]
    1630:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    1632:	2300      	movs	r3, #0
    1634:	60fb      	str	r3, [r7, #12]
    1636:	e00c      	b.n	1652 <flash_erase_page+0x86>
		u32=*adr++;
    1638:	697b      	ldr	r3, [r7, #20]
    163a:	1d1a      	adds	r2, r3, #4
    163c:	617a      	str	r2, [r7, #20]
    163e:	681b      	ldr	r3, [r3, #0]
    1640:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    1642:	693b      	ldr	r3, [r7, #16]
    1644:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1648:	d000      	beq.n	164c <flash_erase_page+0x80>
    164a:	e005      	b.n	1658 <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    164c:	68fb      	ldr	r3, [r7, #12]
    164e:	3301      	adds	r3, #1
    1650:	60fb      	str	r3, [r7, #12]
    1652:	68fb      	ldr	r3, [r7, #12]
    1654:	2bff      	cmp	r3, #255	; 0xff
    1656:	ddef      	ble.n	1638 <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    1658:	693b      	ldr	r3, [r7, #16]
    165a:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    165e:	bf0c      	ite	eq
    1660:	2301      	moveq	r3, #1
    1662:	2300      	movne	r3, #0
    1664:	b2db      	uxtb	r3, r3
}
    1666:	4618      	mov	r0, r3
    1668:	371c      	adds	r7, #28
    166a:	46bd      	mov	sp, r7
    166c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1670:	4770      	bx	lr
    1672:	bf00      	nop
    1674:	40022000 	.word	0x40022000

00001678 <hide_cursor>:
// position  du curseur texte.
static int cursor_x, cursor_y;
static int cursor_visible=0;
static int cursor_blink=0;

static void hide_cursor(){
    1678:	b580      	push	{r7, lr}
    167a:	b082      	sub	sp, #8
    167c:	af02      	add	r7, sp, #8
	if (cursor_visible){
    167e:	4b0c      	ldr	r3, [pc, #48]	; (16b0 <hide_cursor+0x38>)
    1680:	681b      	ldr	r3, [r3, #0]
    1682:	2b00      	cmp	r3, #0
    1684:	d011      	beq.n	16aa <hide_cursor+0x32>
		disable_interrupt(IRQ_CURSOR_BLINK);
    1686:	201e      	movs	r0, #30
    1688:	f000 fe7c 	bl	2384 <disable_interrupt>
		gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    168c:	4b09      	ldr	r3, [pc, #36]	; (16b4 <hide_cursor+0x3c>)
    168e:	6819      	ldr	r1, [r3, #0]
    1690:	4b09      	ldr	r3, [pc, #36]	; (16b8 <hide_cursor+0x40>)
    1692:	681a      	ldr	r2, [r3, #0]
    1694:	2300      	movs	r3, #0
    1696:	9300      	str	r3, [sp, #0]
    1698:	4608      	mov	r0, r1
    169a:	4611      	mov	r1, r2
    169c:	2206      	movs	r2, #6
    169e:	2308      	movs	r3, #8
    16a0:	f000 f91c 	bl	18dc <gdi_box>
		cursor_visible=0;
    16a4:	4b02      	ldr	r3, [pc, #8]	; (16b0 <hide_cursor+0x38>)
    16a6:	2200      	movs	r2, #0
    16a8:	601a      	str	r2, [r3, #0]
	}
}
    16aa:	46bd      	mov	sp, r7
    16ac:	bd80      	pop	{r7, pc}
    16ae:	bf00      	nop
    16b0:	200000b4 	.word	0x200000b4
    16b4:	200000ac 	.word	0x200000ac
    16b8:	200000b0 	.word	0x200000b0

000016bc <gdi_clear_screen>:

void gdi_clear_screen(){
    16bc:	b580      	push	{r7, lr}
    16be:	b082      	sub	sp, #8
    16c0:	af00      	add	r7, sp, #0
	int i;
	hide_cursor();
    16c2:	f7ff ffd9 	bl	1678 <hide_cursor>
	for (i=0;i<(ROW_SIZE*VRES);){
    16c6:	2300      	movs	r3, #0
    16c8:	607b      	str	r3, [r7, #4]
    16ca:	e00c      	b.n	16e6 <gdi_clear_screen+0x2a>
		video_buffer[i++]=0;
    16cc:	687b      	ldr	r3, [r7, #4]
    16ce:	1c5a      	adds	r2, r3, #1
    16d0:	607a      	str	r2, [r7, #4]
    16d2:	4a0c      	ldr	r2, [pc, #48]	; (1704 <gdi_clear_screen+0x48>)
    16d4:	2100      	movs	r1, #0
    16d6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		cursor_x=0;
    16da:	4b0b      	ldr	r3, [pc, #44]	; (1708 <gdi_clear_screen+0x4c>)
    16dc:	2200      	movs	r2, #0
    16de:	601a      	str	r2, [r3, #0]
		cursor_y=0;
    16e0:	4b0a      	ldr	r3, [pc, #40]	; (170c <gdi_clear_screen+0x50>)
    16e2:	2200      	movs	r2, #0
    16e4:	601a      	str	r2, [r3, #0]
}

void gdi_clear_screen(){
	int i;
	hide_cursor();
	for (i=0;i<(ROW_SIZE*VRES);){
    16e6:	687b      	ldr	r3, [r7, #4]
    16e8:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    16ec:	dbee      	blt.n	16cc <gdi_clear_screen+0x10>
		video_buffer[i++]=0;
		cursor_x=0;
		cursor_y=0;
	}
	if (cursor_blink){
    16ee:	4b08      	ldr	r3, [pc, #32]	; (1710 <gdi_clear_screen+0x54>)
    16f0:	681b      	ldr	r3, [r3, #0]
    16f2:	2b00      	cmp	r3, #0
    16f4:	d002      	beq.n	16fc <gdi_clear_screen+0x40>
		enable_interrupt(IRQ_CURSOR_BLINK);
    16f6:	201e      	movs	r0, #30
    16f8:	f000 fe20 	bl	233c <enable_interrupt>
	}
}
    16fc:	3708      	adds	r7, #8
    16fe:	46bd      	mov	sp, r7
    1700:	bd80      	pop	{r7, pc}
    1702:	bf00      	nop
    1704:	20000130 	.word	0x20000130
    1708:	200000ac 	.word	0x200000ac
    170c:	200000b0 	.word	0x200000b0
    1710:	200000b8 	.word	0x200000b8

00001714 <gdi_scroll_up>:

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
    1714:	b580      	push	{r7, lr}
    1716:	b082      	sub	sp, #8
    1718:	af00      	add	r7, sp, #0
	int i,j=0;
    171a:	2300      	movs	r3, #0
    171c:	603b      	str	r3, [r7, #0]
	hide_cursor();
    171e:	f7ff ffab 	bl	1678 <hide_cursor>
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    1722:	23a0      	movs	r3, #160	; 0xa0
    1724:	607b      	str	r3, [r7, #4]
    1726:	e00b      	b.n	1740 <gdi_scroll_up+0x2c>
		video_buffer[j++]=video_buffer[i++];
    1728:	683b      	ldr	r3, [r7, #0]
    172a:	1c5a      	adds	r2, r3, #1
    172c:	603a      	str	r2, [r7, #0]
    172e:	687a      	ldr	r2, [r7, #4]
    1730:	1c51      	adds	r1, r2, #1
    1732:	6079      	str	r1, [r7, #4]
    1734:	4911      	ldr	r1, [pc, #68]	; (177c <gdi_scroll_up+0x68>)
    1736:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    173a:	4a10      	ldr	r2, [pc, #64]	; (177c <gdi_scroll_up+0x68>)
    173c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
	int i,j=0;
	hide_cursor();
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    1740:	687b      	ldr	r3, [r7, #4]
    1742:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1746:	dbef      	blt.n	1728 <gdi_scroll_up+0x14>
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1748:	f44f 5391 	mov.w	r3, #4640	; 0x1220
    174c:	607b      	str	r3, [r7, #4]
    174e:	e006      	b.n	175e <gdi_scroll_up+0x4a>
		video_buffer[i++]=0;
    1750:	687b      	ldr	r3, [r7, #4]
    1752:	1c5a      	adds	r2, r3, #1
    1754:	607a      	str	r2, [r7, #4]
    1756:	4a09      	ldr	r2, [pc, #36]	; (177c <gdi_scroll_up+0x68>)
    1758:	2100      	movs	r1, #0
    175a:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i,j=0;
	hide_cursor();
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    175e:	687b      	ldr	r3, [r7, #4]
    1760:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1764:	dbf4      	blt.n	1750 <gdi_scroll_up+0x3c>
		video_buffer[i++]=0;
	}
	if (cursor_blink){
    1766:	4b06      	ldr	r3, [pc, #24]	; (1780 <gdi_scroll_up+0x6c>)
    1768:	681b      	ldr	r3, [r3, #0]
    176a:	2b00      	cmp	r3, #0
    176c:	d002      	beq.n	1774 <gdi_scroll_up+0x60>
		enable_interrupt(IRQ_CURSOR_BLINK);
    176e:	201e      	movs	r0, #30
    1770:	f000 fde4 	bl	233c <enable_interrupt>
	}
}
    1774:	3708      	adds	r7, #8
    1776:	46bd      	mov	sp, r7
    1778:	bd80      	pop	{r7, pc}
    177a:	bf00      	nop
    177c:	20000130 	.word	0x20000130
    1780:	200000b8 	.word	0x200000b8

00001784 <gdi_new_line>:

// avance le curseur texte au début 
// de la ligne suivante.
void gdi_new_line(){
    1784:	b580      	push	{r7, lr}
    1786:	af00      	add	r7, sp, #0
	hide_cursor();
    1788:	f7ff ff76 	bl	1678 <hide_cursor>
	
	cursor_x=0;
    178c:	4b0c      	ldr	r3, [pc, #48]	; (17c0 <gdi_new_line+0x3c>)
    178e:	2200      	movs	r2, #0
    1790:	601a      	str	r2, [r3, #0]
	cursor_y+=CHAR_HEIGHT;
    1792:	4b0c      	ldr	r3, [pc, #48]	; (17c4 <gdi_new_line+0x40>)
    1794:	681b      	ldr	r3, [r3, #0]
    1796:	3308      	adds	r3, #8
    1798:	4a0a      	ldr	r2, [pc, #40]	; (17c4 <gdi_new_line+0x40>)
    179a:	6013      	str	r3, [r2, #0]
	if (cursor_y>(VRES-CHAR_HEIGHT)){
    179c:	4b09      	ldr	r3, [pc, #36]	; (17c4 <gdi_new_line+0x40>)
    179e:	681b      	ldr	r3, [r3, #0]
    17a0:	2be8      	cmp	r3, #232	; 0xe8
    17a2:	dd04      	ble.n	17ae <gdi_new_line+0x2a>
		cursor_y=VRES-CHAR_HEIGHT;
    17a4:	4b07      	ldr	r3, [pc, #28]	; (17c4 <gdi_new_line+0x40>)
    17a6:	22e8      	movs	r2, #232	; 0xe8
    17a8:	601a      	str	r2, [r3, #0]
		gdi_scroll_up();
    17aa:	f7ff ffb3 	bl	1714 <gdi_scroll_up>
	}
	if (cursor_blink){
    17ae:	4b06      	ldr	r3, [pc, #24]	; (17c8 <gdi_new_line+0x44>)
    17b0:	681b      	ldr	r3, [r3, #0]
    17b2:	2b00      	cmp	r3, #0
    17b4:	d002      	beq.n	17bc <gdi_new_line+0x38>
		enable_interrupt(IRQ_CURSOR_BLINK);
    17b6:	201e      	movs	r0, #30
    17b8:	f000 fdc0 	bl	233c <enable_interrupt>
	}
}
    17bc:	bd80      	pop	{r7, pc}
    17be:	bf00      	nop
    17c0:	200000ac 	.word	0x200000ac
    17c4:	200000b0 	.word	0x200000b0
    17c8:	200000b8 	.word	0x200000b8

000017cc <gdi_cursor_left>:

void gdi_cursor_left(){
    17cc:	b580      	push	{r7, lr}
    17ce:	af00      	add	r7, sp, #0
	hide_cursor();
    17d0:	f7ff ff52 	bl	1678 <hide_cursor>
	if (!(cursor_x|cursor_y)) return;
    17d4:	4b16      	ldr	r3, [pc, #88]	; (1830 <gdi_cursor_left+0x64>)
    17d6:	681a      	ldr	r2, [r3, #0]
    17d8:	4b16      	ldr	r3, [pc, #88]	; (1834 <gdi_cursor_left+0x68>)
    17da:	681b      	ldr	r3, [r3, #0]
    17dc:	4313      	orrs	r3, r2
    17de:	2b00      	cmp	r3, #0
    17e0:	d100      	bne.n	17e4 <gdi_cursor_left+0x18>
    17e2:	e024      	b.n	182e <gdi_cursor_left+0x62>
	if (cursor_x>=CHAR_WIDTH){
    17e4:	4b12      	ldr	r3, [pc, #72]	; (1830 <gdi_cursor_left+0x64>)
    17e6:	681b      	ldr	r3, [r3, #0]
    17e8:	2b05      	cmp	r3, #5
    17ea:	dd05      	ble.n	17f8 <gdi_cursor_left+0x2c>
		cursor_x-=CHAR_WIDTH;
    17ec:	4b10      	ldr	r3, [pc, #64]	; (1830 <gdi_cursor_left+0x64>)
    17ee:	681b      	ldr	r3, [r3, #0]
    17f0:	3b06      	subs	r3, #6
    17f2:	4a0f      	ldr	r2, [pc, #60]	; (1830 <gdi_cursor_left+0x64>)
    17f4:	6013      	str	r3, [r2, #0]
    17f6:	e013      	b.n	1820 <gdi_cursor_left+0x54>
	}else if (cursor_y) {
    17f8:	4b0e      	ldr	r3, [pc, #56]	; (1834 <gdi_cursor_left+0x68>)
    17fa:	681b      	ldr	r3, [r3, #0]
    17fc:	2b00      	cmp	r3, #0
    17fe:	d00f      	beq.n	1820 <gdi_cursor_left+0x54>
		cursor_x=CHAR_WIDTH*(CHARS_PER_LINE-1);
    1800:	4b0b      	ldr	r3, [pc, #44]	; (1830 <gdi_cursor_left+0x64>)
    1802:	f44f 729c 	mov.w	r2, #312	; 0x138
    1806:	601a      	str	r2, [r3, #0]
		cursor_y-=CHAR_HEIGHT;
    1808:	4b0a      	ldr	r3, [pc, #40]	; (1834 <gdi_cursor_left+0x68>)
    180a:	681b      	ldr	r3, [r3, #0]
    180c:	3b08      	subs	r3, #8
    180e:	4a09      	ldr	r2, [pc, #36]	; (1834 <gdi_cursor_left+0x68>)
    1810:	6013      	str	r3, [r2, #0]
		if (cursor_y<0) cursor_y=0;
    1812:	4b08      	ldr	r3, [pc, #32]	; (1834 <gdi_cursor_left+0x68>)
    1814:	681b      	ldr	r3, [r3, #0]
    1816:	2b00      	cmp	r3, #0
    1818:	da02      	bge.n	1820 <gdi_cursor_left+0x54>
    181a:	4b06      	ldr	r3, [pc, #24]	; (1834 <gdi_cursor_left+0x68>)
    181c:	2200      	movs	r2, #0
    181e:	601a      	str	r2, [r3, #0]
	}
	if (cursor_blink){
    1820:	4b05      	ldr	r3, [pc, #20]	; (1838 <gdi_cursor_left+0x6c>)
    1822:	681b      	ldr	r3, [r3, #0]
    1824:	2b00      	cmp	r3, #0
    1826:	d002      	beq.n	182e <gdi_cursor_left+0x62>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1828:	201e      	movs	r0, #30
    182a:	f000 fd87 	bl	233c <enable_interrupt>
	}
}
    182e:	bd80      	pop	{r7, pc}
    1830:	200000ac 	.word	0x200000ac
    1834:	200000b0 	.word	0x200000b0
    1838:	200000b8 	.word	0x200000b8

0000183c <gdi_bit_op>:


void gdi_bit_op(int x, int y, bitop_e op){
    183c:	b480      	push	{r7}
    183e:	b087      	sub	sp, #28
    1840:	af00      	add	r7, sp, #0
    1842:	60f8      	str	r0, [r7, #12]
    1844:	60b9      	str	r1, [r7, #8]
    1846:	4613      	mov	r3, r2
    1848:	71fb      	strb	r3, [r7, #7]
	uint16_t bit;
	int offset=y*ROW_SIZE+(x>>4);
    184a:	68ba      	ldr	r2, [r7, #8]
    184c:	4613      	mov	r3, r2
    184e:	009b      	lsls	r3, r3, #2
    1850:	4413      	add	r3, r2
    1852:	009b      	lsls	r3, r3, #2
    1854:	461a      	mov	r2, r3
    1856:	68fb      	ldr	r3, [r7, #12]
    1858:	111b      	asrs	r3, r3, #4
    185a:	4413      	add	r3, r2
    185c:	617b      	str	r3, [r7, #20]
	bit=1<<(15-(x&15));
    185e:	68fb      	ldr	r3, [r7, #12]
    1860:	43db      	mvns	r3, r3
    1862:	f003 030f 	and.w	r3, r3, #15
    1866:	2201      	movs	r2, #1
    1868:	fa02 f303 	lsl.w	r3, r2, r3
    186c:	827b      	strh	r3, [r7, #18]
	switch (op){
    186e:	79fb      	ldrb	r3, [r7, #7]
    1870:	2b01      	cmp	r3, #1
    1872:	d013      	beq.n	189c <gdi_bit_op+0x60>
    1874:	2b02      	cmp	r3, #2
    1876:	d01d      	beq.n	18b4 <gdi_bit_op+0x78>
    1878:	2b00      	cmp	r3, #0
    187a:	d127      	bne.n	18cc <gdi_bit_op+0x90>
	case BLACK_BIT:
		video_buffer[offset]&=~bit;
    187c:	4a16      	ldr	r2, [pc, #88]	; (18d8 <gdi_bit_op+0x9c>)
    187e:	697b      	ldr	r3, [r7, #20]
    1880:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1884:	b29a      	uxth	r2, r3
    1886:	8a7b      	ldrh	r3, [r7, #18]
    1888:	43db      	mvns	r3, r3
    188a:	b29b      	uxth	r3, r3
    188c:	4013      	ands	r3, r2
    188e:	b29b      	uxth	r3, r3
    1890:	b299      	uxth	r1, r3
    1892:	4a11      	ldr	r2, [pc, #68]	; (18d8 <gdi_bit_op+0x9c>)
    1894:	697b      	ldr	r3, [r7, #20]
    1896:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    189a:	e017      	b.n	18cc <gdi_bit_op+0x90>
	case WHITE_BIT:
		video_buffer[offset]|=bit;
    189c:	4a0e      	ldr	r2, [pc, #56]	; (18d8 <gdi_bit_op+0x9c>)
    189e:	697b      	ldr	r3, [r7, #20]
    18a0:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    18a4:	8a7b      	ldrh	r3, [r7, #18]
    18a6:	4313      	orrs	r3, r2
    18a8:	b299      	uxth	r1, r3
    18aa:	4a0b      	ldr	r2, [pc, #44]	; (18d8 <gdi_bit_op+0x9c>)
    18ac:	697b      	ldr	r3, [r7, #20]
    18ae:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    18b2:	e00b      	b.n	18cc <gdi_bit_op+0x90>
	case XOR_BIT:
		video_buffer[offset]^=bit;
    18b4:	4a08      	ldr	r2, [pc, #32]	; (18d8 <gdi_bit_op+0x9c>)
    18b6:	697b      	ldr	r3, [r7, #20]
    18b8:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    18bc:	8a7b      	ldrh	r3, [r7, #18]
    18be:	4053      	eors	r3, r2
    18c0:	b299      	uxth	r1, r3
    18c2:	4a05      	ldr	r2, [pc, #20]	; (18d8 <gdi_bit_op+0x9c>)
    18c4:	697b      	ldr	r3, [r7, #20]
    18c6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    18ca:	bf00      	nop
	}
}
    18cc:	371c      	adds	r7, #28
    18ce:	46bd      	mov	sp, r7
    18d0:	f85d 7b04 	ldr.w	r7, [sp], #4
    18d4:	4770      	bx	lr
    18d6:	bf00      	nop
    18d8:	20000130 	.word	0x20000130

000018dc <gdi_box>:

void gdi_box(int x, int y, int w, int h, bitop_e op){
    18dc:	b580      	push	{r7, lr}
    18de:	b086      	sub	sp, #24
    18e0:	af00      	add	r7, sp, #0
    18e2:	60f8      	str	r0, [r7, #12]
    18e4:	60b9      	str	r1, [r7, #8]
    18e6:	607a      	str	r2, [r7, #4]
    18e8:	603b      	str	r3, [r7, #0]
	int r,c;
	
	for (r=0;r<h;r++){
    18ea:	2300      	movs	r3, #0
    18ec:	617b      	str	r3, [r7, #20]
    18ee:	e02e      	b.n	194e <gdi_box+0x72>
		for (c=0;c<w;c++){
    18f0:	2300      	movs	r3, #0
    18f2:	613b      	str	r3, [r7, #16]
    18f4:	e024      	b.n	1940 <gdi_box+0x64>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    18f6:	68fa      	ldr	r2, [r7, #12]
    18f8:	693b      	ldr	r3, [r7, #16]
    18fa:	4413      	add	r3, r2
    18fc:	2b00      	cmp	r3, #0
    18fe:	db1c      	blt.n	193a <gdi_box+0x5e>
    1900:	68fa      	ldr	r2, [r7, #12]
    1902:	693b      	ldr	r3, [r7, #16]
    1904:	4413      	add	r3, r2
    1906:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    190a:	da16      	bge.n	193a <gdi_box+0x5e>
    190c:	697a      	ldr	r2, [r7, #20]
    190e:	68bb      	ldr	r3, [r7, #8]
    1910:	4413      	add	r3, r2
    1912:	2b00      	cmp	r3, #0
    1914:	db11      	blt.n	193a <gdi_box+0x5e>
    1916:	697a      	ldr	r2, [r7, #20]
    1918:	68bb      	ldr	r3, [r7, #8]
    191a:	4413      	add	r3, r2
    191c:	2bef      	cmp	r3, #239	; 0xef
    191e:	dc0c      	bgt.n	193a <gdi_box+0x5e>
				gdi_bit_op(c+x,r+y,op);
    1920:	693a      	ldr	r2, [r7, #16]
    1922:	68fb      	ldr	r3, [r7, #12]
    1924:	18d1      	adds	r1, r2, r3
    1926:	697a      	ldr	r2, [r7, #20]
    1928:	68bb      	ldr	r3, [r7, #8]
    192a:	441a      	add	r2, r3
    192c:	f897 3020 	ldrb.w	r3, [r7, #32]
    1930:	4608      	mov	r0, r1
    1932:	4611      	mov	r1, r2
    1934:	461a      	mov	r2, r3
    1936:	f7ff ff81 	bl	183c <gdi_bit_op>

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
		for (c=0;c<w;c++){
    193a:	693b      	ldr	r3, [r7, #16]
    193c:	3301      	adds	r3, #1
    193e:	613b      	str	r3, [r7, #16]
    1940:	693a      	ldr	r2, [r7, #16]
    1942:	687b      	ldr	r3, [r7, #4]
    1944:	429a      	cmp	r2, r3
    1946:	dbd6      	blt.n	18f6 <gdi_box+0x1a>
}

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
    1948:	697b      	ldr	r3, [r7, #20]
    194a:	3301      	adds	r3, #1
    194c:	617b      	str	r3, [r7, #20]
    194e:	697a      	ldr	r2, [r7, #20]
    1950:	683b      	ldr	r3, [r7, #0]
    1952:	429a      	cmp	r2, r3
    1954:	dbcc      	blt.n	18f0 <gdi_box+0x14>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				gdi_bit_op(c+x,r+y,op);
			}
		}
	}
}
    1956:	3718      	adds	r7, #24
    1958:	46bd      	mov	sp, r7
    195a:	bd80      	pop	{r7, pc}

0000195c <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
    195c:	b480      	push	{r7}
    195e:	b089      	sub	sp, #36	; 0x24
    1960:	af00      	add	r7, sp, #0
    1962:	60f8      	str	r0, [r7, #12]
    1964:	60b9      	str	r1, [r7, #8]
    1966:	607a      	str	r2, [r7, #4]
    1968:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    196a:	2300      	movs	r3, #0
    196c:	61fb      	str	r3, [r7, #28]
    196e:	e099      	b.n	1aa4 <gdi_put_sprite+0x148>
		mask=128;
    1970:	2380      	movs	r3, #128	; 0x80
    1972:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    1974:	2300      	movs	r3, #0
    1976:	61bb      	str	r3, [r7, #24]
    1978:	e08c      	b.n	1a94 <gdi_put_sprite+0x138>
			if (!mask){
    197a:	7dfb      	ldrb	r3, [r7, #23]
    197c:	2b00      	cmp	r3, #0
    197e:	d104      	bne.n	198a <gdi_put_sprite+0x2e>
				sprite++;
    1980:	6abb      	ldr	r3, [r7, #40]	; 0x28
    1982:	3301      	adds	r3, #1
    1984:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    1986:	2380      	movs	r3, #128	; 0x80
    1988:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    198a:	68fa      	ldr	r2, [r7, #12]
    198c:	69bb      	ldr	r3, [r7, #24]
    198e:	4413      	add	r3, r2
    1990:	2b00      	cmp	r3, #0
    1992:	db79      	blt.n	1a88 <gdi_put_sprite+0x12c>
    1994:	68fa      	ldr	r2, [r7, #12]
    1996:	69bb      	ldr	r3, [r7, #24]
    1998:	4413      	add	r3, r2
    199a:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    199e:	da73      	bge.n	1a88 <gdi_put_sprite+0x12c>
    19a0:	69fa      	ldr	r2, [r7, #28]
    19a2:	68bb      	ldr	r3, [r7, #8]
    19a4:	4413      	add	r3, r2
    19a6:	2b00      	cmp	r3, #0
    19a8:	db6e      	blt.n	1a88 <gdi_put_sprite+0x12c>
    19aa:	69fa      	ldr	r2, [r7, #28]
    19ac:	68bb      	ldr	r3, [r7, #8]
    19ae:	4413      	add	r3, r2
    19b0:	2bef      	cmp	r3, #239	; 0xef
    19b2:	dc69      	bgt.n	1a88 <gdi_put_sprite+0x12c>
				if (sprite[r]&mask){
    19b4:	69fb      	ldr	r3, [r7, #28]
    19b6:	6aba      	ldr	r2, [r7, #40]	; 0x28
    19b8:	4413      	add	r3, r2
    19ba:	781a      	ldrb	r2, [r3, #0]
    19bc:	7dfb      	ldrb	r3, [r7, #23]
    19be:	4013      	ands	r3, r2
    19c0:	b2db      	uxtb	r3, r3
    19c2:	2b00      	cmp	r3, #0
    19c4:	d02f      	beq.n	1a26 <gdi_put_sprite+0xca>
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]|=(1<<(15-((c+x)&15)));
    19c6:	69fa      	ldr	r2, [r7, #28]
    19c8:	68bb      	ldr	r3, [r7, #8]
    19ca:	441a      	add	r2, r3
    19cc:	4613      	mov	r3, r2
    19ce:	009b      	lsls	r3, r3, #2
    19d0:	4413      	add	r3, r2
    19d2:	009b      	lsls	r3, r3, #2
    19d4:	4619      	mov	r1, r3
    19d6:	69ba      	ldr	r2, [r7, #24]
    19d8:	68fb      	ldr	r3, [r7, #12]
    19da:	4413      	add	r3, r2
    19dc:	111b      	asrs	r3, r3, #4
    19de:	4419      	add	r1, r3
    19e0:	69fa      	ldr	r2, [r7, #28]
    19e2:	68bb      	ldr	r3, [r7, #8]
    19e4:	441a      	add	r2, r3
    19e6:	4613      	mov	r3, r2
    19e8:	009b      	lsls	r3, r3, #2
    19ea:	4413      	add	r3, r2
    19ec:	009b      	lsls	r3, r3, #2
    19ee:	4618      	mov	r0, r3
    19f0:	69ba      	ldr	r2, [r7, #24]
    19f2:	68fb      	ldr	r3, [r7, #12]
    19f4:	4413      	add	r3, r2
    19f6:	111b      	asrs	r3, r3, #4
    19f8:	4403      	add	r3, r0
    19fa:	4a2f      	ldr	r2, [pc, #188]	; (1ab8 <gdi_put_sprite+0x15c>)
    19fc:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1a00:	b298      	uxth	r0, r3
    1a02:	69ba      	ldr	r2, [r7, #24]
    1a04:	68fb      	ldr	r3, [r7, #12]
    1a06:	4413      	add	r3, r2
    1a08:	43db      	mvns	r3, r3
    1a0a:	f003 030f 	and.w	r3, r3, #15
    1a0e:	2201      	movs	r2, #1
    1a10:	fa02 f303 	lsl.w	r3, r2, r3
    1a14:	b29b      	uxth	r3, r3
    1a16:	4602      	mov	r2, r0
    1a18:	4313      	orrs	r3, r2
    1a1a:	b29b      	uxth	r3, r3
    1a1c:	b29a      	uxth	r2, r3
    1a1e:	4b26      	ldr	r3, [pc, #152]	; (1ab8 <gdi_put_sprite+0x15c>)
    1a20:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
    1a24:	e030      	b.n	1a88 <gdi_put_sprite+0x12c>
				}else{
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]&=~(1<<(15-((c+x)&15)));
    1a26:	69fa      	ldr	r2, [r7, #28]
    1a28:	68bb      	ldr	r3, [r7, #8]
    1a2a:	441a      	add	r2, r3
    1a2c:	4613      	mov	r3, r2
    1a2e:	009b      	lsls	r3, r3, #2
    1a30:	4413      	add	r3, r2
    1a32:	009b      	lsls	r3, r3, #2
    1a34:	4619      	mov	r1, r3
    1a36:	69ba      	ldr	r2, [r7, #24]
    1a38:	68fb      	ldr	r3, [r7, #12]
    1a3a:	4413      	add	r3, r2
    1a3c:	111b      	asrs	r3, r3, #4
    1a3e:	4419      	add	r1, r3
    1a40:	69fa      	ldr	r2, [r7, #28]
    1a42:	68bb      	ldr	r3, [r7, #8]
    1a44:	441a      	add	r2, r3
    1a46:	4613      	mov	r3, r2
    1a48:	009b      	lsls	r3, r3, #2
    1a4a:	4413      	add	r3, r2
    1a4c:	009b      	lsls	r3, r3, #2
    1a4e:	4618      	mov	r0, r3
    1a50:	69ba      	ldr	r2, [r7, #24]
    1a52:	68fb      	ldr	r3, [r7, #12]
    1a54:	4413      	add	r3, r2
    1a56:	111b      	asrs	r3, r3, #4
    1a58:	4403      	add	r3, r0
    1a5a:	4a17      	ldr	r2, [pc, #92]	; (1ab8 <gdi_put_sprite+0x15c>)
    1a5c:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1a60:	b298      	uxth	r0, r3
    1a62:	69ba      	ldr	r2, [r7, #24]
    1a64:	68fb      	ldr	r3, [r7, #12]
    1a66:	4413      	add	r3, r2
    1a68:	43db      	mvns	r3, r3
    1a6a:	f003 030f 	and.w	r3, r3, #15
    1a6e:	2201      	movs	r2, #1
    1a70:	fa02 f303 	lsl.w	r3, r2, r3
    1a74:	b29b      	uxth	r3, r3
    1a76:	43db      	mvns	r3, r3
    1a78:	b29b      	uxth	r3, r3
    1a7a:	4602      	mov	r2, r0
    1a7c:	4013      	ands	r3, r2
    1a7e:	b29b      	uxth	r3, r3
    1a80:	b29a      	uxth	r2, r3
    1a82:	4b0d      	ldr	r3, [pc, #52]	; (1ab8 <gdi_put_sprite+0x15c>)
    1a84:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
				//bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
				//video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]|=bit;
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
    1a88:	7dfb      	ldrb	r3, [r7, #23]
    1a8a:	085b      	lsrs	r3, r3, #1
    1a8c:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    1a8e:	69bb      	ldr	r3, [r7, #24]
    1a90:	3301      	adds	r3, #1
    1a92:	61bb      	str	r3, [r7, #24]
    1a94:	69ba      	ldr	r2, [r7, #24]
    1a96:	687b      	ldr	r3, [r7, #4]
    1a98:	429a      	cmp	r2, r3
    1a9a:	f6ff af6e 	blt.w	197a <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1a9e:	69fb      	ldr	r3, [r7, #28]
    1aa0:	3301      	adds	r3, #1
    1aa2:	61fb      	str	r3, [r7, #28]
    1aa4:	69fa      	ldr	r2, [r7, #28]
    1aa6:	683b      	ldr	r3, [r7, #0]
    1aa8:	429a      	cmp	r2, r3
    1aaa:	f6ff af61 	blt.w	1970 <gdi_put_sprite+0x14>
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    1aae:	3724      	adds	r7, #36	; 0x24
    1ab0:	46bd      	mov	sp, r7
    1ab2:	f85d 7b04 	ldr.w	r7, [sp], #4
    1ab6:	4770      	bx	lr
    1ab8:	20000130 	.word	0x20000130

00001abc <gdi_del_back>:

void gdi_del_back(){
    1abc:	b580      	push	{r7, lr}
    1abe:	b082      	sub	sp, #8
    1ac0:	af02      	add	r7, sp, #8
	gdi_cursor_left();
    1ac2:	f7ff fe83 	bl	17cc <gdi_cursor_left>
	hide_cursor();
    1ac6:	f7ff fdd7 	bl	1678 <hide_cursor>
	gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    1aca:	4b0a      	ldr	r3, [pc, #40]	; (1af4 <gdi_del_back+0x38>)
    1acc:	6819      	ldr	r1, [r3, #0]
    1ace:	4b0a      	ldr	r3, [pc, #40]	; (1af8 <gdi_del_back+0x3c>)
    1ad0:	681a      	ldr	r2, [r3, #0]
    1ad2:	2300      	movs	r3, #0
    1ad4:	9300      	str	r3, [sp, #0]
    1ad6:	4608      	mov	r0, r1
    1ad8:	4611      	mov	r1, r2
    1ada:	2206      	movs	r2, #6
    1adc:	2308      	movs	r3, #8
    1ade:	f7ff fefd 	bl	18dc <gdi_box>
	if (cursor_blink){
    1ae2:	4b06      	ldr	r3, [pc, #24]	; (1afc <gdi_del_back+0x40>)
    1ae4:	681b      	ldr	r3, [r3, #0]
    1ae6:	2b00      	cmp	r3, #0
    1ae8:	d002      	beq.n	1af0 <gdi_del_back+0x34>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1aea:	201e      	movs	r0, #30
    1aec:	f000 fc26 	bl	233c <enable_interrupt>
	}
}
    1af0:	46bd      	mov	sp, r7
    1af2:	bd80      	pop	{r7, pc}
    1af4:	200000ac 	.word	0x200000ac
    1af8:	200000b0 	.word	0x200000b0
    1afc:	200000b8 	.word	0x200000b8

00001b00 <gdi_putc>:

// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void gdi_putc(char c){
    1b00:	b580      	push	{r7, lr}
    1b02:	b084      	sub	sp, #16
    1b04:	af02      	add	r7, sp, #8
    1b06:	4603      	mov	r3, r0
    1b08:	71fb      	strb	r3, [r7, #7]
		hide_cursor();
    1b0a:	f7ff fdb5 	bl	1678 <hide_cursor>
		switch (c){
    1b0e:	79fb      	ldrb	r3, [r7, #7]
    1b10:	2b0a      	cmp	r3, #10
    1b12:	d004      	beq.n	1b1e <gdi_putc+0x1e>
    1b14:	2b0d      	cmp	r3, #13
    1b16:	d002      	beq.n	1b1e <gdi_putc+0x1e>
    1b18:	2b08      	cmp	r3, #8
    1b1a:	d003      	beq.n	1b24 <gdi_putc+0x24>
    1b1c:	e005      	b.n	1b2a <gdi_putc+0x2a>
		case '\n':
		case CR:
			gdi_new_line();
    1b1e:	f7ff fe31 	bl	1784 <gdi_new_line>
			break;
    1b22:	e021      	b.n	1b68 <gdi_putc+0x68>
		case BS:
			gdi_del_back();
    1b24:	f7ff ffca 	bl	1abc <gdi_del_back>
			break;
    1b28:	e01e      	b.n	1b68 <gdi_putc+0x68>
		default:
			if (c<FONT_SIZE){
    1b2a:	79fb      	ldrb	r3, [r7, #7]
    1b2c:	b25b      	sxtb	r3, r3
    1b2e:	2b00      	cmp	r3, #0
    1b30:	db19      	blt.n	1b66 <gdi_putc+0x66>
				gdi_put_sprite(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,(const unsigned char *)&font6x8[c]);
    1b32:	4b12      	ldr	r3, [pc, #72]	; (1b7c <gdi_putc+0x7c>)
    1b34:	6818      	ldr	r0, [r3, #0]
    1b36:	4b12      	ldr	r3, [pc, #72]	; (1b80 <gdi_putc+0x80>)
    1b38:	6819      	ldr	r1, [r3, #0]
    1b3a:	79fb      	ldrb	r3, [r7, #7]
    1b3c:	00db      	lsls	r3, r3, #3
    1b3e:	4a11      	ldr	r2, [pc, #68]	; (1b84 <gdi_putc+0x84>)
    1b40:	4413      	add	r3, r2
    1b42:	9300      	str	r3, [sp, #0]
    1b44:	2206      	movs	r2, #6
    1b46:	2308      	movs	r3, #8
    1b48:	f7ff ff08 	bl	195c <gdi_put_sprite>
				cursor_x+=CHAR_WIDTH;
    1b4c:	4b0b      	ldr	r3, [pc, #44]	; (1b7c <gdi_putc+0x7c>)
    1b4e:	681b      	ldr	r3, [r3, #0]
    1b50:	3306      	adds	r3, #6
    1b52:	4a0a      	ldr	r2, [pc, #40]	; (1b7c <gdi_putc+0x7c>)
    1b54:	6013      	str	r3, [r2, #0]
				if (cursor_x>(HRES-CHAR_WIDTH)){
    1b56:	4b09      	ldr	r3, [pc, #36]	; (1b7c <gdi_putc+0x7c>)
    1b58:	681b      	ldr	r3, [r3, #0]
    1b5a:	f5b3 7f9d 	cmp.w	r3, #314	; 0x13a
    1b5e:	dd02      	ble.n	1b66 <gdi_putc+0x66>
					gdi_new_line();
    1b60:	f7ff fe10 	bl	1784 <gdi_new_line>
				}
			}
			break;
    1b64:	e7ff      	b.n	1b66 <gdi_putc+0x66>
    1b66:	bf00      	nop
		}//switch
		if (cursor_blink){
    1b68:	4b07      	ldr	r3, [pc, #28]	; (1b88 <gdi_putc+0x88>)
    1b6a:	681b      	ldr	r3, [r3, #0]
    1b6c:	2b00      	cmp	r3, #0
    1b6e:	d002      	beq.n	1b76 <gdi_putc+0x76>
			enable_interrupt(IRQ_CURSOR_BLINK);
    1b70:	201e      	movs	r0, #30
    1b72:	f000 fbe3 	bl	233c <enable_interrupt>
		}
}
    1b76:	3708      	adds	r7, #8
    1b78:	46bd      	mov	sp, r7
    1b7a:	bd80      	pop	{r7, pc}
    1b7c:	200000ac 	.word	0x200000ac
    1b80:	200000b0 	.word	0x200000b0
    1b84:	00003230 	.word	0x00003230
    1b88:	200000b8 	.word	0x200000b8

00001b8c <gdi_print>:

void gdi_print(const char *str){
    1b8c:	b580      	push	{r7, lr}
    1b8e:	b082      	sub	sp, #8
    1b90:	af00      	add	r7, sp, #0
    1b92:	6078      	str	r0, [r7, #4]
	while (*str) gdi_putc(*str++);
    1b94:	e006      	b.n	1ba4 <gdi_print+0x18>
    1b96:	687b      	ldr	r3, [r7, #4]
    1b98:	1c5a      	adds	r2, r3, #1
    1b9a:	607a      	str	r2, [r7, #4]
    1b9c:	781b      	ldrb	r3, [r3, #0]
    1b9e:	4618      	mov	r0, r3
    1ba0:	f7ff ffae 	bl	1b00 <gdi_putc>
    1ba4:	687b      	ldr	r3, [r7, #4]
    1ba6:	781b      	ldrb	r3, [r3, #0]
    1ba8:	2b00      	cmp	r3, #0
    1baa:	d1f4      	bne.n	1b96 <gdi_print+0xa>
}
    1bac:	3708      	adds	r7, #8
    1bae:	46bd      	mov	sp, r7
    1bb0:	bd80      	pop	{r7, pc}
    1bb2:	bf00      	nop

00001bb4 <gdi_clrln>:

void gdi_clrln(){
    1bb4:	b480      	push	{r7}
    1bb6:	b083      	sub	sp, #12
    1bb8:	af00      	add	r7, sp, #0
	int i;
	cursor_x=0;
    1bba:	4b11      	ldr	r3, [pc, #68]	; (1c00 <gdi_clrln+0x4c>)
    1bbc:	2200      	movs	r2, #0
    1bbe:	601a      	str	r2, [r3, #0]
	for (i=cursor_y*ROW_SIZE;i<cursor_y*ROW_SIZE*8;i++){
    1bc0:	4b10      	ldr	r3, [pc, #64]	; (1c04 <gdi_clrln+0x50>)
    1bc2:	681a      	ldr	r2, [r3, #0]
    1bc4:	4613      	mov	r3, r2
    1bc6:	009b      	lsls	r3, r3, #2
    1bc8:	4413      	add	r3, r2
    1bca:	009b      	lsls	r3, r3, #2
    1bcc:	607b      	str	r3, [r7, #4]
    1bce:	e007      	b.n	1be0 <gdi_clrln+0x2c>
		video_buffer[i]=0;
    1bd0:	4a0d      	ldr	r2, [pc, #52]	; (1c08 <gdi_clrln+0x54>)
    1bd2:	687b      	ldr	r3, [r7, #4]
    1bd4:	2100      	movs	r1, #0
    1bd6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
}

void gdi_clrln(){
	int i;
	cursor_x=0;
	for (i=cursor_y*ROW_SIZE;i<cursor_y*ROW_SIZE*8;i++){
    1bda:	687b      	ldr	r3, [r7, #4]
    1bdc:	3301      	adds	r3, #1
    1bde:	607b      	str	r3, [r7, #4]
    1be0:	4b08      	ldr	r3, [pc, #32]	; (1c04 <gdi_clrln+0x50>)
    1be2:	681a      	ldr	r2, [r3, #0]
    1be4:	4613      	mov	r3, r2
    1be6:	009b      	lsls	r3, r3, #2
    1be8:	4413      	add	r3, r2
    1bea:	015b      	lsls	r3, r3, #5
    1bec:	461a      	mov	r2, r3
    1bee:	687b      	ldr	r3, [r7, #4]
    1bf0:	429a      	cmp	r2, r3
    1bf2:	dced      	bgt.n	1bd0 <gdi_clrln+0x1c>
		video_buffer[i]=0;
	}
}
    1bf4:	370c      	adds	r7, #12
    1bf6:	46bd      	mov	sp, r7
    1bf8:	f85d 7b04 	ldr.w	r7, [sp], #4
    1bfc:	4770      	bx	lr
    1bfe:	bf00      	nop
    1c00:	200000ac 	.word	0x200000ac
    1c04:	200000b0 	.word	0x200000b0
    1c08:	20000130 	.word	0x20000130

00001c0c <gdi_text_cursor>:

void gdi_text_cursor(int enable){
    1c0c:	b580      	push	{r7, lr}
    1c0e:	b084      	sub	sp, #16
    1c10:	af02      	add	r7, sp, #8
    1c12:	6078      	str	r0, [r7, #4]
	if (enable){
    1c14:	687b      	ldr	r3, [r7, #4]
    1c16:	2b00      	cmp	r3, #0
    1c18:	d024      	beq.n	1c64 <gdi_text_cursor+0x58>
		// activation clock CURSOR_TMR
		RCC->CURSOR_RCC_ENR|=CURSOR_RCC_EN_BIT; 
    1c1a:	4a24      	ldr	r2, [pc, #144]	; (1cac <gdi_text_cursor+0xa0>)
    1c1c:	4b23      	ldr	r3, [pc, #140]	; (1cac <gdi_text_cursor+0xa0>)
    1c1e:	69db      	ldr	r3, [r3, #28]
    1c20:	f043 0304 	orr.w	r3, r3, #4
    1c24:	61d3      	str	r3, [r2, #28]
		CURSOR_TMR->ARR=FTMR2_4/1000/2;
    1c26:	4b22      	ldr	r3, [pc, #136]	; (1cb0 <gdi_text_cursor+0xa4>)
    1c28:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    1c2c:	62da      	str	r2, [r3, #44]	; 0x2c
		CURSOR_TMR->PSC=1000;
    1c2e:	4b20      	ldr	r3, [pc, #128]	; (1cb0 <gdi_text_cursor+0xa4>)
    1c30:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    1c34:	629a      	str	r2, [r3, #40]	; 0x28
		CURSOR_TMR->CR1=BIT0|BIT7; // ARPE
    1c36:	4b1e      	ldr	r3, [pc, #120]	; (1cb0 <gdi_text_cursor+0xa4>)
    1c38:	2281      	movs	r2, #129	; 0x81
    1c3a:	601a      	str	r2, [r3, #0]
		CURSOR_TMR->DIER=BIT0; // UIE
    1c3c:	4b1c      	ldr	r3, [pc, #112]	; (1cb0 <gdi_text_cursor+0xa4>)
    1c3e:	2201      	movs	r2, #1
    1c40:	60da      	str	r2, [r3, #12]
		set_int_priority(IRQ_CURSOR_BLINK,15);
    1c42:	201e      	movs	r0, #30
    1c44:	210f      	movs	r1, #15
    1c46:	f000 fc35 	bl	24b4 <set_int_priority>
		CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
    1c4a:	4a19      	ldr	r2, [pc, #100]	; (1cb0 <gdi_text_cursor+0xa4>)
    1c4c:	4b18      	ldr	r3, [pc, #96]	; (1cb0 <gdi_text_cursor+0xa4>)
    1c4e:	691b      	ldr	r3, [r3, #16]
    1c50:	f023 0301 	bic.w	r3, r3, #1
    1c54:	6113      	str	r3, [r2, #16]
		enable_interrupt(IRQ_CURSOR_BLINK);
    1c56:	201e      	movs	r0, #30
    1c58:	f000 fb70 	bl	233c <enable_interrupt>
		cursor_blink=1;
    1c5c:	4b15      	ldr	r3, [pc, #84]	; (1cb4 <gdi_text_cursor+0xa8>)
    1c5e:	2201      	movs	r2, #1
    1c60:	601a      	str	r2, [r3, #0]
    1c62:	e020      	b.n	1ca6 <gdi_text_cursor+0x9a>
	}else{
		disable_interrupt(IRQ_CURSOR_BLINK);
    1c64:	201e      	movs	r0, #30
    1c66:	f000 fb8d 	bl	2384 <disable_interrupt>
		if (cursor_visible){
    1c6a:	4b13      	ldr	r3, [pc, #76]	; (1cb8 <gdi_text_cursor+0xac>)
    1c6c:	681b      	ldr	r3, [r3, #0]
    1c6e:	2b00      	cmp	r3, #0
    1c70:	d010      	beq.n	1c94 <gdi_text_cursor+0x88>
			gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    1c72:	4b12      	ldr	r3, [pc, #72]	; (1cbc <gdi_text_cursor+0xb0>)
    1c74:	6819      	ldr	r1, [r3, #0]
    1c76:	4b12      	ldr	r3, [pc, #72]	; (1cc0 <gdi_text_cursor+0xb4>)
    1c78:	681a      	ldr	r2, [r3, #0]
    1c7a:	2302      	movs	r3, #2
    1c7c:	9300      	str	r3, [sp, #0]
    1c7e:	4608      	mov	r0, r1
    1c80:	4611      	mov	r1, r2
    1c82:	2206      	movs	r2, #6
    1c84:	2308      	movs	r3, #8
    1c86:	f7ff fe29 	bl	18dc <gdi_box>
			cursor_visible=~cursor_visible;
    1c8a:	4b0b      	ldr	r3, [pc, #44]	; (1cb8 <gdi_text_cursor+0xac>)
    1c8c:	681b      	ldr	r3, [r3, #0]
    1c8e:	43db      	mvns	r3, r3
    1c90:	4a09      	ldr	r2, [pc, #36]	; (1cb8 <gdi_text_cursor+0xac>)
    1c92:	6013      	str	r3, [r2, #0]
		}
		CURSOR_TMR->DIER&=~BIT0;
    1c94:	4a06      	ldr	r2, [pc, #24]	; (1cb0 <gdi_text_cursor+0xa4>)
    1c96:	4b06      	ldr	r3, [pc, #24]	; (1cb0 <gdi_text_cursor+0xa4>)
    1c98:	68db      	ldr	r3, [r3, #12]
    1c9a:	f023 0301 	bic.w	r3, r3, #1
    1c9e:	60d3      	str	r3, [r2, #12]
		cursor_blink=0;
    1ca0:	4b04      	ldr	r3, [pc, #16]	; (1cb4 <gdi_text_cursor+0xa8>)
    1ca2:	2200      	movs	r2, #0
    1ca4:	601a      	str	r2, [r3, #0]
	}
}
    1ca6:	3708      	adds	r7, #8
    1ca8:	46bd      	mov	sp, r7
    1caa:	bd80      	pop	{r7, pc}
    1cac:	40021000 	.word	0x40021000
    1cb0:	40000800 	.word	0x40000800
    1cb4:	200000b8 	.word	0x200000b8
    1cb8:	200000b4 	.word	0x200000b4
    1cbc:	200000ac 	.word	0x200000ac
    1cc0:	200000b0 	.word	0x200000b0

00001cc4 <TIM4_handler>:

// interruption clignotement
// curseur texte
void CURSOR_blink_handler(){
    1cc4:	b580      	push	{r7, lr}
    1cc6:	b082      	sub	sp, #8
    1cc8:	af02      	add	r7, sp, #8
	//CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
	if (CURSOR_TMR->SR&BIT0){ // UIF
    1cca:	4b0f      	ldr	r3, [pc, #60]	; (1d08 <TIM4_handler+0x44>)
    1ccc:	691b      	ldr	r3, [r3, #16]
    1cce:	f003 0301 	and.w	r3, r3, #1
    1cd2:	2b00      	cmp	r3, #0
    1cd4:	d016      	beq.n	1d04 <TIM4_handler+0x40>
		CURSOR_TMR->SR&=~BIT0;
    1cd6:	4a0c      	ldr	r2, [pc, #48]	; (1d08 <TIM4_handler+0x44>)
    1cd8:	4b0b      	ldr	r3, [pc, #44]	; (1d08 <TIM4_handler+0x44>)
    1cda:	691b      	ldr	r3, [r3, #16]
    1cdc:	f023 0301 	bic.w	r3, r3, #1
    1ce0:	6113      	str	r3, [r2, #16]
		gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    1ce2:	4b0a      	ldr	r3, [pc, #40]	; (1d0c <TIM4_handler+0x48>)
    1ce4:	6819      	ldr	r1, [r3, #0]
    1ce6:	4b0a      	ldr	r3, [pc, #40]	; (1d10 <TIM4_handler+0x4c>)
    1ce8:	681a      	ldr	r2, [r3, #0]
    1cea:	2302      	movs	r3, #2
    1cec:	9300      	str	r3, [sp, #0]
    1cee:	4608      	mov	r0, r1
    1cf0:	4611      	mov	r1, r2
    1cf2:	2206      	movs	r2, #6
    1cf4:	2308      	movs	r3, #8
    1cf6:	f7ff fdf1 	bl	18dc <gdi_box>
		cursor_visible=~cursor_visible;
    1cfa:	4b06      	ldr	r3, [pc, #24]	; (1d14 <TIM4_handler+0x50>)
    1cfc:	681b      	ldr	r3, [r3, #0]
    1cfe:	43db      	mvns	r3, r3
    1d00:	4a04      	ldr	r2, [pc, #16]	; (1d14 <TIM4_handler+0x50>)
    1d02:	6013      	str	r3, [r2, #0]
	}
}
    1d04:	46bd      	mov	sp, r7
    1d06:	bd80      	pop	{r7, pc}
    1d08:	40000800 	.word	0x40000800
    1d0c:	200000ac 	.word	0x200000ac
    1d10:	200000b0 	.word	0x200000b0
    1d14:	200000b4 	.word	0x200000b4

00001d18 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(gpio_t* port, unsigned pin, unsigned config){
    1d18:	b480      	push	{r7}
    1d1a:	b087      	sub	sp, #28
    1d1c:	af00      	add	r7, sp, #0
    1d1e:	60f8      	str	r0, [r7, #12]
    1d20:	60b9      	str	r1, [r7, #8]
    1d22:	607a      	str	r2, [r7, #4]
	uint8_t shift;
	shift=(pin&7)<<2;
    1d24:	68bb      	ldr	r3, [r7, #8]
    1d26:	b2db      	uxtb	r3, r3
    1d28:	f003 0307 	and.w	r3, r3, #7
    1d2c:	b2db      	uxtb	r3, r3
    1d2e:	009b      	lsls	r3, r3, #2
    1d30:	75fb      	strb	r3, [r7, #23]
	port->CR[pin>>3]&=~(15<<shift);
    1d32:	68bb      	ldr	r3, [r7, #8]
    1d34:	08da      	lsrs	r2, r3, #3
    1d36:	68bb      	ldr	r3, [r7, #8]
    1d38:	08d9      	lsrs	r1, r3, #3
    1d3a:	68fb      	ldr	r3, [r7, #12]
    1d3c:	f853 3021 	ldr.w	r3, [r3, r1, lsl #2]
    1d40:	7df9      	ldrb	r1, [r7, #23]
    1d42:	200f      	movs	r0, #15
    1d44:	fa00 f101 	lsl.w	r1, r0, r1
    1d48:	43c9      	mvns	r1, r1
    1d4a:	4019      	ands	r1, r3
    1d4c:	68fb      	ldr	r3, [r7, #12]
    1d4e:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
	port->CR[pin>>3]|=config<<shift;
    1d52:	68bb      	ldr	r3, [r7, #8]
    1d54:	08da      	lsrs	r2, r3, #3
    1d56:	68bb      	ldr	r3, [r7, #8]
    1d58:	08d9      	lsrs	r1, r3, #3
    1d5a:	68fb      	ldr	r3, [r7, #12]
    1d5c:	f853 1021 	ldr.w	r1, [r3, r1, lsl #2]
    1d60:	7dfb      	ldrb	r3, [r7, #23]
    1d62:	6878      	ldr	r0, [r7, #4]
    1d64:	fa00 f303 	lsl.w	r3, r0, r3
    1d68:	4319      	orrs	r1, r3
    1d6a:	68fb      	ldr	r3, [r7, #12]
    1d6c:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
}
    1d70:	371c      	adds	r7, #28
    1d72:	46bd      	mov	sp, r7
    1d74:	f85d 7b04 	ldr.w	r7, [sp], #4
    1d78:	4770      	bx	lr
    1d7a:	bf00      	nop

00001d7c <read_pin>:

int read_pin(gpio_t* port, unsigned pin){
    1d7c:	b480      	push	{r7}
    1d7e:	b083      	sub	sp, #12
    1d80:	af00      	add	r7, sp, #0
    1d82:	6078      	str	r0, [r7, #4]
    1d84:	6039      	str	r1, [r7, #0]
	return port->IDR&(1<<pin);
    1d86:	687b      	ldr	r3, [r7, #4]
    1d88:	689b      	ldr	r3, [r3, #8]
    1d8a:	683a      	ldr	r2, [r7, #0]
    1d8c:	2101      	movs	r1, #1
    1d8e:	fa01 f202 	lsl.w	r2, r1, r2
    1d92:	4013      	ands	r3, r2
}
    1d94:	4618      	mov	r0, r3
    1d96:	370c      	adds	r7, #12
    1d98:	46bd      	mov	sp, r7
    1d9a:	f85d 7b04 	ldr.w	r7, [sp], #4
    1d9e:	4770      	bx	lr

00001da0 <write_pin>:

void write_pin(gpio_t* port, unsigned pin, int value){
    1da0:	b480      	push	{r7}
    1da2:	b085      	sub	sp, #20
    1da4:	af00      	add	r7, sp, #0
    1da6:	60f8      	str	r0, [r7, #12]
    1da8:	60b9      	str	r1, [r7, #8]
    1daa:	607a      	str	r2, [r7, #4]
	value?(port->ODR|=(1<<pin)):(port->ODR&=~(1<<pin));
    1dac:	687b      	ldr	r3, [r7, #4]
    1dae:	2b00      	cmp	r3, #0
    1db0:	d009      	beq.n	1dc6 <write_pin+0x26>
    1db2:	68fb      	ldr	r3, [r7, #12]
    1db4:	68db      	ldr	r3, [r3, #12]
    1db6:	68ba      	ldr	r2, [r7, #8]
    1db8:	2101      	movs	r1, #1
    1dba:	fa01 f202 	lsl.w	r2, r1, r2
    1dbe:	431a      	orrs	r2, r3
    1dc0:	68fb      	ldr	r3, [r7, #12]
    1dc2:	60da      	str	r2, [r3, #12]
    1dc4:	e009      	b.n	1dda <write_pin+0x3a>
    1dc6:	68fb      	ldr	r3, [r7, #12]
    1dc8:	68db      	ldr	r3, [r3, #12]
    1dca:	68ba      	ldr	r2, [r7, #8]
    1dcc:	2101      	movs	r1, #1
    1dce:	fa01 f202 	lsl.w	r2, r1, r2
    1dd2:	43d2      	mvns	r2, r2
    1dd4:	401a      	ands	r2, r3
    1dd6:	68fb      	ldr	r3, [r7, #12]
    1dd8:	60da      	str	r2, [r3, #12]
}
    1dda:	3714      	adds	r7, #20
    1ddc:	46bd      	mov	sp, r7
    1dde:	f85d 7b04 	ldr.w	r7, [sp], #4
    1de2:	4770      	bx	lr

00001de4 <toggle_pin>:

void toggle_pin(gpio_t* port, unsigned pin){
    1de4:	b480      	push	{r7}
    1de6:	b083      	sub	sp, #12
    1de8:	af00      	add	r7, sp, #0
    1dea:	6078      	str	r0, [r7, #4]
    1dec:	6039      	str	r1, [r7, #0]
	port->ODR^=(1<<pin);
    1dee:	687b      	ldr	r3, [r7, #4]
    1df0:	68db      	ldr	r3, [r3, #12]
    1df2:	683a      	ldr	r2, [r7, #0]
    1df4:	2101      	movs	r1, #1
    1df6:	fa01 f202 	lsl.w	r2, r1, r2
    1dfa:	405a      	eors	r2, r3
    1dfc:	687b      	ldr	r3, [r7, #4]
    1dfe:	60da      	str	r2, [r3, #12]
}
    1e00:	370c      	adds	r7, #12
    1e02:	46bd      	mov	sp, r7
    1e04:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e08:	4770      	bx	lr
    1e0a:	bf00      	nop

00001e0c <keyboard_init>:
    ps2_flags = 0;
    return KbdSend(KBD_RESET);
}//KbdReset()
*/
 
void keyboard_init(){
    1e0c:	b580      	push	{r7, lr}
    1e0e:	af00      	add	r7, sp, #0
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
    1e10:	4a1f      	ldr	r2, [pc, #124]	; (1e90 <keyboard_init+0x84>)
    1e12:	4b1f      	ldr	r3, [pc, #124]	; (1e90 <keyboard_init+0x84>)
    1e14:	699b      	ldr	r3, [r3, #24]
    1e16:	f043 0305 	orr.w	r3, r3, #5
    1e1a:	6193      	str	r3, [r2, #24]
	// activation clock TMR2
	RCC->APB1ENR|=RCC_APB1ENR_TIM2EN; 
    1e1c:	4a1c      	ldr	r2, [pc, #112]	; (1e90 <keyboard_init+0x84>)
    1e1e:	4b1c      	ldr	r3, [pc, #112]	; (1e90 <keyboard_init+0x84>)
    1e20:	69db      	ldr	r3, [r3, #28]
    1e22:	f043 0301 	orr.w	r3, r3, #1
    1e26:	61d3      	str	r3, [r2, #28]
	TMR2->ARR=FTMR2_4/20*.01;
    1e28:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e2c:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    1e30:	62da      	str	r2, [r3, #44]	; 0x2c
	TMR2->PSC=20;
    1e32:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e36:	2214      	movs	r2, #20
    1e38:	629a      	str	r2, [r3, #40]	; 0x28
	TMR2->CR1=BIT0|BIT7; // ARPE
    1e3a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e3e:	2281      	movs	r2, #129	; 0x81
    1e40:	601a      	str	r2, [r3, #0]
	TMR2->DIER=BIT0; // UIE
    1e42:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e46:	2201      	movs	r2, #1
    1e48:	60da      	str	r2, [r3, #12]
	set_int_priority(IRQ_KBD_CLK,0);
    1e4a:	2017      	movs	r0, #23
    1e4c:	2100      	movs	r1, #0
    1e4e:	f000 fb31 	bl	24b4 <set_int_priority>
	set_int_priority(IRQ_TIM2,14);
    1e52:	201c      	movs	r0, #28
    1e54:	210e      	movs	r1, #14
    1e56:	f000 fb2d 	bl	24b4 <set_int_priority>
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
    1e5a:	4a0e      	ldr	r2, [pc, #56]	; (1e94 <keyboard_init+0x88>)
    1e5c:	4b0d      	ldr	r3, [pc, #52]	; (1e94 <keyboard_init+0x88>)
    1e5e:	68db      	ldr	r3, [r3, #12]
    1e60:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1e64:	60d3      	str	r3, [r2, #12]
	EXTI->IMR|=KBD_CLK_PIN;
    1e66:	4a0b      	ldr	r2, [pc, #44]	; (1e94 <keyboard_init+0x88>)
    1e68:	4b0a      	ldr	r3, [pc, #40]	; (1e94 <keyboard_init+0x88>)
    1e6a:	681b      	ldr	r3, [r3, #0]
    1e6c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1e70:	6013      	str	r3, [r2, #0]
	enable_interrupt(IRQ_KBD_CLK);
    1e72:	2017      	movs	r0, #23
    1e74:	f000 fa62 	bl	233c <enable_interrupt>
	TMR2->SR&=~BIT0;
    1e78:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    1e7c:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e80:	691b      	ldr	r3, [r3, #16]
    1e82:	f023 0301 	bic.w	r3, r3, #1
    1e86:	6113      	str	r3, [r2, #16]
	enable_interrupt(IRQ_TIM2);
    1e88:	201c      	movs	r0, #28
    1e8a:	f000 fa57 	bl	233c <enable_interrupt>
	//pause(700);
	//if (!KbdReset()) print("keyboard reset failed\n");
}
    1e8e:	bd80      	pop	{r7, pc}
    1e90:	40021000 	.word	0x40021000
    1e94:	40010400 	.word	0x40010400

00001e98 <search_table>:
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
    1e98:	b480      	push	{r7}
    1e9a:	b083      	sub	sp, #12
    1e9c:	af00      	add	r7, sp, #0
    1e9e:	6078      	str	r0, [r7, #4]
    1ea0:	460b      	mov	r3, r1
    1ea2:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    1ea4:	e008      	b.n	1eb8 <search_table+0x20>
		if (table->code==code) break;
    1ea6:	687b      	ldr	r3, [r7, #4]
    1ea8:	781b      	ldrb	r3, [r3, #0]
    1eaa:	78fa      	ldrb	r2, [r7, #3]
    1eac:	429a      	cmp	r2, r3
    1eae:	d100      	bne.n	1eb2 <search_table+0x1a>
    1eb0:	e006      	b.n	1ec0 <search_table+0x28>
		table++;
    1eb2:	687b      	ldr	r3, [r7, #4]
    1eb4:	3302      	adds	r3, #2
    1eb6:	607b      	str	r3, [r7, #4]

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
    1eb8:	687b      	ldr	r3, [r7, #4]
    1eba:	781b      	ldrb	r3, [r3, #0]
    1ebc:	2b00      	cmp	r3, #0
    1ebe:	d1f2      	bne.n	1ea6 <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    1ec0:	687b      	ldr	r3, [r7, #4]
    1ec2:	785b      	ldrb	r3, [r3, #1]
}
    1ec4:	4618      	mov	r0, r3
    1ec6:	370c      	adds	r7, #12
    1ec8:	46bd      	mov	sp, r7
    1eca:	f85d 7b04 	ldr.w	r7, [sp], #4
    1ece:	4770      	bx	lr

00001ed0 <convert_code>:

static void convert_code(unsigned char code){
    1ed0:	b580      	push	{r7, lr}
    1ed2:	b086      	sub	sp, #24
    1ed4:	af00      	add	r7, sp, #0
    1ed6:	4603      	mov	r3, r0
    1ed8:	71fb      	strb	r3, [r7, #7]
		unsigned char c,s;
		int shift;
		if (!(con.dev==LOCAL)) return;
    1eda:	4ba1      	ldr	r3, [pc, #644]	; (2160 <convert_code+0x290>)
    1edc:	781b      	ldrb	r3, [r3, #0]
    1ede:	2b00      	cmp	r3, #0
    1ee0:	d000      	beq.n	1ee4 <convert_code+0x14>
    1ee2:	e139      	b.n	2158 <convert_code+0x288>
		switch (code){
    1ee4:	79fb      	ldrb	r3, [r7, #7]
    1ee6:	2b59      	cmp	r3, #89	; 0x59
    1ee8:	f000 8085 	beq.w	1ff6 <convert_code+0x126>
    1eec:	2b59      	cmp	r3, #89	; 0x59
    1eee:	dc0e      	bgt.n	1f0e <convert_code+0x3e>
    1ef0:	2b12      	cmp	r3, #18
    1ef2:	d038      	beq.n	1f66 <convert_code+0x96>
    1ef4:	2b12      	cmp	r3, #18
    1ef6:	dc03      	bgt.n	1f00 <convert_code+0x30>
    1ef8:	2b11      	cmp	r3, #17
    1efa:	f000 80a4 	beq.w	2046 <convert_code+0x176>
    1efe:	e0ca      	b.n	2096 <convert_code+0x1c6>
    1f00:	2b14      	cmp	r3, #20
    1f02:	f000 808c 	beq.w	201e <convert_code+0x14e>
    1f06:	2b58      	cmp	r3, #88	; 0x58
    1f08:	f000 80b1 	beq.w	206e <convert_code+0x19e>
    1f0c:	e0c3      	b.n	2096 <convert_code+0x1c6>
    1f0e:	2be0      	cmp	r3, #224	; 0xe0
    1f10:	d010      	beq.n	1f34 <convert_code+0x64>
    1f12:	2be0      	cmp	r3, #224	; 0xe0
    1f14:	dc02      	bgt.n	1f1c <convert_code+0x4c>
    1f16:	2b7c      	cmp	r3, #124	; 0x7c
    1f18:	d047      	beq.n	1faa <convert_code+0xda>
    1f1a:	e0bc      	b.n	2096 <convert_code+0x1c6>
    1f1c:	2be1      	cmp	r3, #225	; 0xe1
    1f1e:	d010      	beq.n	1f42 <convert_code+0x72>
    1f20:	2bf0      	cmp	r3, #240	; 0xf0
    1f22:	f040 80b8 	bne.w	2096 <convert_code+0x1c6>
		case 0xF0:
			flags |= RELEASE;
    1f26:	4b8f      	ldr	r3, [pc, #572]	; (2164 <convert_code+0x294>)
    1f28:	681b      	ldr	r3, [r3, #0]
    1f2a:	f043 0302 	orr.w	r3, r3, #2
    1f2e:	4a8d      	ldr	r2, [pc, #564]	; (2164 <convert_code+0x294>)
    1f30:	6013      	str	r3, [r2, #0]
			break;
    1f32:	e111      	b.n	2158 <convert_code+0x288>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    1f34:	4b8b      	ldr	r3, [pc, #556]	; (2164 <convert_code+0x294>)
    1f36:	681b      	ldr	r3, [r3, #0]
    1f38:	f043 0301 	orr.w	r3, r3, #1
    1f3c:	4a89      	ldr	r2, [pc, #548]	; (2164 <convert_code+0x294>)
    1f3e:	6013      	str	r3, [r2, #0]
			break;
    1f40:	e10a      	b.n	2158 <convert_code+0x288>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    1f42:	4b88      	ldr	r3, [pc, #544]	; (2164 <convert_code+0x294>)
    1f44:	681b      	ldr	r3, [r3, #0]
    1f46:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    1f4a:	4a86      	ldr	r2, [pc, #536]	; (2164 <convert_code+0x294>)
    1f4c:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    1f4e:	4b85      	ldr	r3, [pc, #532]	; (2164 <convert_code+0x294>)
    1f50:	681b      	ldr	r3, [r3, #0]
    1f52:	f403 7380 	and.w	r3, r3, #256	; 0x100
    1f56:	2b00      	cmp	r3, #0
    1f58:	d104      	bne.n	1f64 <convert_code+0x94>
				con.insert(PAUSE);
    1f5a:	4b81      	ldr	r3, [pc, #516]	; (2160 <convert_code+0x290>)
    1f5c:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    1f5e:	2094      	movs	r0, #148	; 0x94
    1f60:	4798      	blx	r3
			}
			break;
    1f62:	e0f9      	b.n	2158 <convert_code+0x288>
    1f64:	e0f8      	b.n	2158 <convert_code+0x288>
		case LSHIFT:
			if (flags&RELEASE){
    1f66:	4b7f      	ldr	r3, [pc, #508]	; (2164 <convert_code+0x294>)
    1f68:	681b      	ldr	r3, [r3, #0]
    1f6a:	f003 0302 	and.w	r3, r3, #2
    1f6e:	2b00      	cmp	r3, #0
    1f70:	d006      	beq.n	1f80 <convert_code+0xb0>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    1f72:	4b7c      	ldr	r3, [pc, #496]	; (2164 <convert_code+0x294>)
    1f74:	681b      	ldr	r3, [r3, #0]
    1f76:	f023 0307 	bic.w	r3, r3, #7
    1f7a:	4a7a      	ldr	r2, [pc, #488]	; (2164 <convert_code+0x294>)
    1f7c:	6013      	str	r3, [r2, #0]
    1f7e:	e013      	b.n	1fa8 <convert_code+0xd8>
			}else{
				if (flags&XTD_CODE){
    1f80:	4b78      	ldr	r3, [pc, #480]	; (2164 <convert_code+0x294>)
    1f82:	681b      	ldr	r3, [r3, #0]
    1f84:	f003 0301 	and.w	r3, r3, #1
    1f88:	2b00      	cmp	r3, #0
    1f8a:	d006      	beq.n	1f9a <convert_code+0xca>
					flags|=PRNSCR;
    1f8c:	4b75      	ldr	r3, [pc, #468]	; (2164 <convert_code+0x294>)
    1f8e:	681b      	ldr	r3, [r3, #0]
    1f90:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1f94:	4a73      	ldr	r2, [pc, #460]	; (2164 <convert_code+0x294>)
    1f96:	6013      	str	r3, [r2, #0]
    1f98:	e006      	b.n	1fa8 <convert_code+0xd8>
				}else{
					flags|=LEFT_SHIFT;
    1f9a:	4b72      	ldr	r3, [pc, #456]	; (2164 <convert_code+0x294>)
    1f9c:	681b      	ldr	r3, [r3, #0]
    1f9e:	f043 0304 	orr.w	r3, r3, #4
    1fa2:	4a70      	ldr	r2, [pc, #448]	; (2164 <convert_code+0x294>)
    1fa4:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1fa6:	e0d7      	b.n	2158 <convert_code+0x288>
    1fa8:	e0d6      	b.n	2158 <convert_code+0x288>
		case KPMUL:
			if (flags&RELEASE){
    1faa:	4b6e      	ldr	r3, [pc, #440]	; (2164 <convert_code+0x294>)
    1fac:	681b      	ldr	r3, [r3, #0]
    1fae:	f003 0302 	and.w	r3, r3, #2
    1fb2:	2b00      	cmp	r3, #0
    1fb4:	d006      	beq.n	1fc4 <convert_code+0xf4>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    1fb6:	4b6b      	ldr	r3, [pc, #428]	; (2164 <convert_code+0x294>)
    1fb8:	681b      	ldr	r3, [r3, #0]
    1fba:	f023 0303 	bic.w	r3, r3, #3
    1fbe:	4a69      	ldr	r2, [pc, #420]	; (2164 <convert_code+0x294>)
    1fc0:	6013      	str	r3, [r2, #0]
    1fc2:	e017      	b.n	1ff4 <convert_code+0x124>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    1fc4:	4b67      	ldr	r3, [pc, #412]	; (2164 <convert_code+0x294>)
    1fc6:	681b      	ldr	r3, [r3, #0]
    1fc8:	f003 0301 	and.w	r3, r3, #1
    1fcc:	2b00      	cmp	r3, #0
    1fce:	d00c      	beq.n	1fea <convert_code+0x11a>
					flags&=~(XTD_CODE|PRNSCR);
    1fd0:	4b64      	ldr	r3, [pc, #400]	; (2164 <convert_code+0x294>)
    1fd2:	681b      	ldr	r3, [r3, #0]
    1fd4:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    1fd8:	f023 0301 	bic.w	r3, r3, #1
    1fdc:	4a61      	ldr	r2, [pc, #388]	; (2164 <convert_code+0x294>)
    1fde:	6013      	str	r3, [r2, #0]
					con.insert(PRN);
    1fe0:	4b5f      	ldr	r3, [pc, #380]	; (2160 <convert_code+0x290>)
    1fe2:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    1fe4:	2092      	movs	r0, #146	; 0x92
    1fe6:	4798      	blx	r3
    1fe8:	e004      	b.n	1ff4 <convert_code+0x124>
				}else{
					con.insert('*');
    1fea:	4b5d      	ldr	r3, [pc, #372]	; (2160 <convert_code+0x290>)
    1fec:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    1fee:	202a      	movs	r0, #42	; 0x2a
    1ff0:	4798      	blx	r3
				}
			}
			break;
    1ff2:	e0b1      	b.n	2158 <convert_code+0x288>
    1ff4:	e0b0      	b.n	2158 <convert_code+0x288>
		case RSHIFT:
			if (flags&RELEASE){
    1ff6:	4b5b      	ldr	r3, [pc, #364]	; (2164 <convert_code+0x294>)
    1ff8:	681b      	ldr	r3, [r3, #0]
    1ffa:	f003 0302 	and.w	r3, r3, #2
    1ffe:	2b00      	cmp	r3, #0
    2000:	d006      	beq.n	2010 <convert_code+0x140>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    2002:	4b58      	ldr	r3, [pc, #352]	; (2164 <convert_code+0x294>)
    2004:	681b      	ldr	r3, [r3, #0]
    2006:	f023 030b 	bic.w	r3, r3, #11
    200a:	4a56      	ldr	r2, [pc, #344]	; (2164 <convert_code+0x294>)
    200c:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    200e:	e0a3      	b.n	2158 <convert_code+0x288>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    2010:	4b54      	ldr	r3, [pc, #336]	; (2164 <convert_code+0x294>)
    2012:	681b      	ldr	r3, [r3, #0]
    2014:	f043 0308 	orr.w	r3, r3, #8
    2018:	4a52      	ldr	r2, [pc, #328]	; (2164 <convert_code+0x294>)
    201a:	6013      	str	r3, [r2, #0]
			}
			break;
    201c:	e09c      	b.n	2158 <convert_code+0x288>
		case LCTRL:
			if (flags&RELEASE){
    201e:	4b51      	ldr	r3, [pc, #324]	; (2164 <convert_code+0x294>)
    2020:	681b      	ldr	r3, [r3, #0]
    2022:	f003 0302 	and.w	r3, r3, #2
    2026:	2b00      	cmp	r3, #0
    2028:	d006      	beq.n	2038 <convert_code+0x168>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    202a:	4b4e      	ldr	r3, [pc, #312]	; (2164 <convert_code+0x294>)
    202c:	681b      	ldr	r3, [r3, #0]
    202e:	f023 0313 	bic.w	r3, r3, #19
    2032:	4a4c      	ldr	r2, [pc, #304]	; (2164 <convert_code+0x294>)
    2034:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_CTRL;
			}
			break;
    2036:	e08f      	b.n	2158 <convert_code+0x288>
			break;
		case LCTRL:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
			}else{
				flags|=LEFT_CTRL;
    2038:	4b4a      	ldr	r3, [pc, #296]	; (2164 <convert_code+0x294>)
    203a:	681b      	ldr	r3, [r3, #0]
    203c:	f043 0310 	orr.w	r3, r3, #16
    2040:	4a48      	ldr	r2, [pc, #288]	; (2164 <convert_code+0x294>)
    2042:	6013      	str	r3, [r2, #0]
			}
			break;
    2044:	e088      	b.n	2158 <convert_code+0x288>
		case LALT:
			if (flags&RELEASE){
    2046:	4b47      	ldr	r3, [pc, #284]	; (2164 <convert_code+0x294>)
    2048:	681b      	ldr	r3, [r3, #0]
    204a:	f003 0302 	and.w	r3, r3, #2
    204e:	2b00      	cmp	r3, #0
    2050:	d006      	beq.n	2060 <convert_code+0x190>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    2052:	4b44      	ldr	r3, [pc, #272]	; (2164 <convert_code+0x294>)
    2054:	681b      	ldr	r3, [r3, #0]
    2056:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    205a:	4a42      	ldr	r2, [pc, #264]	; (2164 <convert_code+0x294>)
    205c:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    205e:	e07b      	b.n	2158 <convert_code+0x288>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    2060:	4b40      	ldr	r3, [pc, #256]	; (2164 <convert_code+0x294>)
    2062:	681b      	ldr	r3, [r3, #0]
    2064:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    2068:	4a3e      	ldr	r2, [pc, #248]	; (2164 <convert_code+0x294>)
    206a:	6013      	str	r3, [r2, #0]
			}
			break;
    206c:	e074      	b.n	2158 <convert_code+0x288>
		case CAPS_LOCK:
			if (flags&RELEASE){
    206e:	4b3d      	ldr	r3, [pc, #244]	; (2164 <convert_code+0x294>)
    2070:	681b      	ldr	r3, [r3, #0]
    2072:	f003 0302 	and.w	r3, r3, #2
    2076:	2b00      	cmp	r3, #0
    2078:	d006      	beq.n	2088 <convert_code+0x1b8>
				flags&=~(RELEASE|XTD_CODE);
    207a:	4b3a      	ldr	r3, [pc, #232]	; (2164 <convert_code+0x294>)
    207c:	681b      	ldr	r3, [r3, #0]
    207e:	f023 0303 	bic.w	r3, r3, #3
    2082:	4a38      	ldr	r2, [pc, #224]	; (2164 <convert_code+0x294>)
    2084:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    2086:	e067      	b.n	2158 <convert_code+0x288>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    2088:	4b36      	ldr	r3, [pc, #216]	; (2164 <convert_code+0x294>)
    208a:	681b      	ldr	r3, [r3, #0]
    208c:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    2090:	4a34      	ldr	r2, [pc, #208]	; (2164 <convert_code+0x294>)
    2092:	6013      	str	r3, [r2, #0]
			}
			break;
    2094:	e060      	b.n	2158 <convert_code+0x288>
		default:
			if (!(flags&RELEASE)){
    2096:	4b33      	ldr	r3, [pc, #204]	; (2164 <convert_code+0x294>)
    2098:	681b      	ldr	r3, [r3, #0]
    209a:	f003 0302 	and.w	r3, r3, #2
    209e:	2b00      	cmp	r3, #0
    20a0:	d153      	bne.n	214a <convert_code+0x27a>
					if (flags&XTD_CODE){
    20a2:	4b30      	ldr	r3, [pc, #192]	; (2164 <convert_code+0x294>)
    20a4:	681b      	ldr	r3, [r3, #0]
    20a6:	f003 0301 	and.w	r3, r3, #1
    20aa:	2b00      	cmp	r3, #0
    20ac:	d00d      	beq.n	20ca <convert_code+0x1fa>
						c=search_table(mcsaite_xkey,code);
    20ae:	79fb      	ldrb	r3, [r7, #7]
    20b0:	482d      	ldr	r0, [pc, #180]	; (2168 <convert_code+0x298>)
    20b2:	4619      	mov	r1, r3
    20b4:	f7ff fef0 	bl	1e98 <search_table>
    20b8:	4603      	mov	r3, r0
    20ba:	75fb      	strb	r3, [r7, #23]
						flags&=~XTD_CODE;
    20bc:	4b29      	ldr	r3, [pc, #164]	; (2164 <convert_code+0x294>)
    20be:	681b      	ldr	r3, [r3, #0]
    20c0:	f023 0301 	bic.w	r3, r3, #1
    20c4:	4a27      	ldr	r2, [pc, #156]	; (2164 <convert_code+0x294>)
    20c6:	6013      	str	r3, [r2, #0]
    20c8:	e006      	b.n	20d8 <convert_code+0x208>
					}else{
						c=search_table(mcsaite_key,code);
    20ca:	79fb      	ldrb	r3, [r7, #7]
    20cc:	4827      	ldr	r0, [pc, #156]	; (216c <convert_code+0x29c>)
    20ce:	4619      	mov	r1, r3
    20d0:	f7ff fee2 	bl	1e98 <search_table>
    20d4:	4603      	mov	r3, r0
    20d6:	75fb      	strb	r3, [r7, #23]
					}
					shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    20d8:	4b22      	ldr	r3, [pc, #136]	; (2164 <convert_code+0x294>)
    20da:	681b      	ldr	r3, [r3, #0]
    20dc:	f003 030c 	and.w	r3, r3, #12
    20e0:	613b      	str	r3, [r7, #16]
					if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    20e2:	7dfb      	ldrb	r3, [r7, #23]
    20e4:	2b60      	cmp	r3, #96	; 0x60
    20e6:	d918      	bls.n	211a <convert_code+0x24a>
    20e8:	7dfb      	ldrb	r3, [r7, #23]
    20ea:	2b7a      	cmp	r3, #122	; 0x7a
    20ec:	d815      	bhi.n	211a <convert_code+0x24a>
    20ee:	693b      	ldr	r3, [r7, #16]
    20f0:	2b00      	cmp	r3, #0
    20f2:	d005      	beq.n	2100 <convert_code+0x230>
    20f4:	4b1b      	ldr	r3, [pc, #108]	; (2164 <convert_code+0x294>)
    20f6:	681b      	ldr	r3, [r3, #0]
    20f8:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    20fc:	2b00      	cmp	r3, #0
    20fe:	d008      	beq.n	2112 <convert_code+0x242>
    2100:	693b      	ldr	r3, [r7, #16]
    2102:	2b00      	cmp	r3, #0
    2104:	d109      	bne.n	211a <convert_code+0x24a>
    2106:	4b17      	ldr	r3, [pc, #92]	; (2164 <convert_code+0x294>)
    2108:	681b      	ldr	r3, [r3, #0]
    210a:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    210e:	2b00      	cmp	r3, #0
    2110:	d003      	beq.n	211a <convert_code+0x24a>
						c-=32;
    2112:	7dfb      	ldrb	r3, [r7, #23]
    2114:	3b20      	subs	r3, #32
    2116:	75fb      	strb	r3, [r7, #23]
    2118:	e00e      	b.n	2138 <convert_code+0x268>
					}else if (shift && (s=search_table(mcsaite_shey,c))){
    211a:	693b      	ldr	r3, [r7, #16]
    211c:	2b00      	cmp	r3, #0
    211e:	d00b      	beq.n	2138 <convert_code+0x268>
    2120:	7dfb      	ldrb	r3, [r7, #23]
    2122:	4813      	ldr	r0, [pc, #76]	; (2170 <convert_code+0x2a0>)
    2124:	4619      	mov	r1, r3
    2126:	f7ff feb7 	bl	1e98 <search_table>
    212a:	4603      	mov	r3, r0
    212c:	73fb      	strb	r3, [r7, #15]
    212e:	7bfb      	ldrb	r3, [r7, #15]
    2130:	2b00      	cmp	r3, #0
    2132:	d001      	beq.n	2138 <convert_code+0x268>
						c=s;
    2134:	7bfb      	ldrb	r3, [r7, #15]
    2136:	75fb      	strb	r3, [r7, #23]
					}
					if (c){
    2138:	7dfb      	ldrb	r3, [r7, #23]
    213a:	2b00      	cmp	r3, #0
    213c:	d00b      	beq.n	2156 <convert_code+0x286>
						con.insert(c);
    213e:	4b08      	ldr	r3, [pc, #32]	; (2160 <convert_code+0x290>)
    2140:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    2142:	7dfa      	ldrb	r2, [r7, #23]
    2144:	4610      	mov	r0, r2
    2146:	4798      	blx	r3
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    2148:	e006      	b.n	2158 <convert_code+0x288>
					}
					if (c){
						con.insert(c);
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    214a:	4b06      	ldr	r3, [pc, #24]	; (2164 <convert_code+0x294>)
    214c:	681b      	ldr	r3, [r3, #0]
    214e:	f023 0303 	bic.w	r3, r3, #3
    2152:	4a04      	ldr	r2, [pc, #16]	; (2164 <convert_code+0x294>)
    2154:	6013      	str	r3, [r2, #0]
			}
			break;
    2156:	bf00      	nop
		}//switch
}// convert_code()
    2158:	3718      	adds	r7, #24
    215a:	46bd      	mov	sp, r7
    215c:	bd80      	pop	{r7, pc}
    215e:	bf00      	nop
    2160:	200000f0 	.word	0x200000f0
    2164:	200000c0 	.word	0x200000c0
    2168:	000036e8 	.word	0x000036e8
    216c:	00003630 	.word	0x00003630
    2170:	000036bc 	.word	0x000036bc

00002174 <EXTI9_5_handler>:
#define PS2_QUEUE_SIZE (16)
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];

// signal clock du clavier PS/2
__attribute__((optimize("-O0"))) void KBD_CLK_handler(){
    2174:	b480      	push	{r7}
    2176:	b083      	sub	sp, #12
    2178:	af00      	add	r7, sp, #0
	volatile  static unsigned char  in_byte=0,bit_cnt=0;
    volatile unsigned char parity; 

#define data_bit  (KBD_PORT->IDR & KBD_DAT_PIN)
	EXTI->PR|=KBD_CLK_PIN; 
    217a:	4a51      	ldr	r2, [pc, #324]	; (22c0 <EXTI9_5_handler+0x14c>)
    217c:	4b50      	ldr	r3, [pc, #320]	; (22c0 <EXTI9_5_handler+0x14c>)
    217e:	695b      	ldr	r3, [r3, #20]
    2180:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    2184:	6153      	str	r3, [r2, #20]
    switch (bit_cnt){
    2186:	4b4f      	ldr	r3, [pc, #316]	; (22c4 <EXTI9_5_handler+0x150>)
    2188:	781b      	ldrb	r3, [r3, #0]
    218a:	b2db      	uxtb	r3, r3
    218c:	2b09      	cmp	r3, #9
    218e:	d01f      	beq.n	21d0 <EXTI9_5_handler+0x5c>
    2190:	2b0a      	cmp	r3, #10
    2192:	d031      	beq.n	21f8 <EXTI9_5_handler+0x84>
    2194:	2b00      	cmp	r3, #0
    2196:	d16c      	bne.n	2272 <EXTI9_5_handler+0xfe>
	case 0:   // start bit
		ps2_flags&=~(F_ERROR|F_RCVD);
    2198:	4b4b      	ldr	r3, [pc, #300]	; (22c8 <EXTI9_5_handler+0x154>)
    219a:	781b      	ldrb	r3, [r3, #0]
    219c:	b2db      	uxtb	r3, r3
    219e:	f023 030b 	bic.w	r3, r3, #11
    21a2:	b2da      	uxtb	r2, r3
    21a4:	4b48      	ldr	r3, [pc, #288]	; (22c8 <EXTI9_5_handler+0x154>)
    21a6:	701a      	strb	r2, [r3, #0]
		if (!data_bit){
    21a8:	4b48      	ldr	r3, [pc, #288]	; (22cc <EXTI9_5_handler+0x158>)
    21aa:	689b      	ldr	r3, [r3, #8]
    21ac:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    21b0:	2b00      	cmp	r3, #0
    21b2:	d10c      	bne.n	21ce <EXTI9_5_handler+0x5a>
			in_byte=0;
    21b4:	4b46      	ldr	r3, [pc, #280]	; (22d0 <EXTI9_5_handler+0x15c>)
    21b6:	2200      	movs	r2, #0
    21b8:	701a      	strb	r2, [r3, #0]
            parity=0;
    21ba:	2300      	movs	r3, #0
    21bc:	71fb      	strb	r3, [r7, #7]
            bit_cnt++;
    21be:	4b41      	ldr	r3, [pc, #260]	; (22c4 <EXTI9_5_handler+0x150>)
    21c0:	781b      	ldrb	r3, [r3, #0]
    21c2:	b2db      	uxtb	r3, r3
    21c4:	3301      	adds	r3, #1
    21c6:	b2da      	uxtb	r2, r3
    21c8:	4b3e      	ldr	r3, [pc, #248]	; (22c4 <EXTI9_5_handler+0x150>)
    21ca:	701a      	strb	r2, [r3, #0]
        }
		break;
    21cc:	e073      	b.n	22b6 <EXTI9_5_handler+0x142>
    21ce:	e072      	b.n	22b6 <EXTI9_5_handler+0x142>
	case 9:   // paritée
		if (data_bit) parity++;
    21d0:	4b3e      	ldr	r3, [pc, #248]	; (22cc <EXTI9_5_handler+0x158>)
    21d2:	689b      	ldr	r3, [r3, #8]
    21d4:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    21d8:	2b00      	cmp	r3, #0
    21da:	d004      	beq.n	21e6 <EXTI9_5_handler+0x72>
    21dc:	79fb      	ldrb	r3, [r7, #7]
    21de:	b2db      	uxtb	r3, r3
    21e0:	3301      	adds	r3, #1
    21e2:	b2db      	uxtb	r3, r3
    21e4:	71fb      	strb	r3, [r7, #7]
		if (!(parity & 1)){
    21e6:	79fb      	ldrb	r3, [r7, #7]
			//ps2_flags |= F_ERR_PARITY;
			
		}
		bit_cnt++;
    21e8:	4b36      	ldr	r3, [pc, #216]	; (22c4 <EXTI9_5_handler+0x150>)
    21ea:	781b      	ldrb	r3, [r3, #0]
    21ec:	b2db      	uxtb	r3, r3
    21ee:	3301      	adds	r3, #1
    21f0:	b2da      	uxtb	r2, r3
    21f2:	4b34      	ldr	r3, [pc, #208]	; (22c4 <EXTI9_5_handler+0x150>)
    21f4:	701a      	strb	r2, [r3, #0]
		break;
    21f6:	e05e      	b.n	22b6 <EXTI9_5_handler+0x142>
	case 10:  // stop bit
	    if (!data_bit){
    21f8:	4b34      	ldr	r3, [pc, #208]	; (22cc <EXTI9_5_handler+0x158>)
    21fa:	689b      	ldr	r3, [r3, #8]
    21fc:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2200:	2b00      	cmp	r3, #0
    2202:	d108      	bne.n	2216 <EXTI9_5_handler+0xa2>
			ps2_flags|=F_ERR_FRAME;
    2204:	4b30      	ldr	r3, [pc, #192]	; (22c8 <EXTI9_5_handler+0x154>)
    2206:	781b      	ldrb	r3, [r3, #0]
    2208:	b2db      	uxtb	r3, r3
    220a:	f043 0308 	orr.w	r3, r3, #8
    220e:	b2da      	uxtb	r2, r3
    2210:	4b2d      	ldr	r3, [pc, #180]	; (22c8 <EXTI9_5_handler+0x154>)
    2212:	701a      	strb	r2, [r3, #0]
    2214:	e029      	b.n	226a <EXTI9_5_handler+0xf6>
		}else if (!(ps2_flags&F_ERROR)){
    2216:	4b2c      	ldr	r3, [pc, #176]	; (22c8 <EXTI9_5_handler+0x154>)
    2218:	781b      	ldrb	r3, [r3, #0]
    221a:	b2db      	uxtb	r3, r3
    221c:	f003 0309 	and.w	r3, r3, #9
    2220:	2b00      	cmp	r3, #0
    2222:	d122      	bne.n	226a <EXTI9_5_handler+0xf6>
			if (in_byte==BAT_OK){
    2224:	4b2a      	ldr	r3, [pc, #168]	; (22d0 <EXTI9_5_handler+0x15c>)
    2226:	781b      	ldrb	r3, [r3, #0]
    2228:	b2db      	uxtb	r3, r3
    222a:	2baa      	cmp	r3, #170	; 0xaa
    222c:	d108      	bne.n	2240 <EXTI9_5_handler+0xcc>
				ps2_flags|=F_BATOK;
    222e:	4b26      	ldr	r3, [pc, #152]	; (22c8 <EXTI9_5_handler+0x154>)
    2230:	781b      	ldrb	r3, [r3, #0]
    2232:	b2db      	uxtb	r3, r3
    2234:	f043 0304 	orr.w	r3, r3, #4
    2238:	b2da      	uxtb	r2, r3
    223a:	4b23      	ldr	r3, [pc, #140]	; (22c8 <EXTI9_5_handler+0x154>)
    223c:	701a      	strb	r2, [r3, #0]
    223e:	e014      	b.n	226a <EXTI9_5_handler+0xf6>
			}else{
				ps2_queue[ps2_tail++]=in_byte;
    2240:	4b24      	ldr	r3, [pc, #144]	; (22d4 <EXTI9_5_handler+0x160>)
    2242:	781b      	ldrb	r3, [r3, #0]
    2244:	b2db      	uxtb	r3, r3
    2246:	1c5a      	adds	r2, r3, #1
    2248:	b2d1      	uxtb	r1, r2
    224a:	4a22      	ldr	r2, [pc, #136]	; (22d4 <EXTI9_5_handler+0x160>)
    224c:	7011      	strb	r1, [r2, #0]
    224e:	461a      	mov	r2, r3
    2250:	4b1f      	ldr	r3, [pc, #124]	; (22d0 <EXTI9_5_handler+0x15c>)
    2252:	781b      	ldrb	r3, [r3, #0]
    2254:	b2d9      	uxtb	r1, r3
    2256:	4b20      	ldr	r3, [pc, #128]	; (22d8 <EXTI9_5_handler+0x164>)
    2258:	5499      	strb	r1, [r3, r2]
				ps2_tail&=PS2_QUEUE_SIZE-1;
    225a:	4b1e      	ldr	r3, [pc, #120]	; (22d4 <EXTI9_5_handler+0x160>)
    225c:	781b      	ldrb	r3, [r3, #0]
    225e:	b2db      	uxtb	r3, r3
    2260:	f003 030f 	and.w	r3, r3, #15
    2264:	b2da      	uxtb	r2, r3
    2266:	4b1b      	ldr	r3, [pc, #108]	; (22d4 <EXTI9_5_handler+0x160>)
    2268:	701a      	strb	r2, [r3, #0]
			}
	    }
	    bit_cnt=0;
    226a:	4b16      	ldr	r3, [pc, #88]	; (22c4 <EXTI9_5_handler+0x150>)
    226c:	2200      	movs	r2, #0
    226e:	701a      	strb	r2, [r3, #0]
		break;
    2270:	e021      	b.n	22b6 <EXTI9_5_handler+0x142>
	default:
		in_byte >>=1;
    2272:	4b17      	ldr	r3, [pc, #92]	; (22d0 <EXTI9_5_handler+0x15c>)
    2274:	781b      	ldrb	r3, [r3, #0]
    2276:	b2db      	uxtb	r3, r3
    2278:	085b      	lsrs	r3, r3, #1
    227a:	b2da      	uxtb	r2, r3
    227c:	4b14      	ldr	r3, [pc, #80]	; (22d0 <EXTI9_5_handler+0x15c>)
    227e:	701a      	strb	r2, [r3, #0]
		if(data_bit){
    2280:	4b12      	ldr	r3, [pc, #72]	; (22cc <EXTI9_5_handler+0x158>)
    2282:	689b      	ldr	r3, [r3, #8]
    2284:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2288:	2b00      	cmp	r3, #0
    228a:	d00c      	beq.n	22a6 <EXTI9_5_handler+0x132>
			in_byte |=128;
    228c:	4b10      	ldr	r3, [pc, #64]	; (22d0 <EXTI9_5_handler+0x15c>)
    228e:	781b      	ldrb	r3, [r3, #0]
    2290:	b2db      	uxtb	r3, r3
    2292:	f063 037f 	orn	r3, r3, #127	; 0x7f
    2296:	b2da      	uxtb	r2, r3
    2298:	4b0d      	ldr	r3, [pc, #52]	; (22d0 <EXTI9_5_handler+0x15c>)
    229a:	701a      	strb	r2, [r3, #0]
			parity++;
    229c:	79fb      	ldrb	r3, [r7, #7]
    229e:	b2db      	uxtb	r3, r3
    22a0:	3301      	adds	r3, #1
    22a2:	b2db      	uxtb	r3, r3
    22a4:	71fb      	strb	r3, [r7, #7]
		}
		bit_cnt++;
    22a6:	4b07      	ldr	r3, [pc, #28]	; (22c4 <EXTI9_5_handler+0x150>)
    22a8:	781b      	ldrb	r3, [r3, #0]
    22aa:	b2db      	uxtb	r3, r3
    22ac:	3301      	adds	r3, #1
    22ae:	b2da      	uxtb	r2, r3
    22b0:	4b04      	ldr	r3, [pc, #16]	; (22c4 <EXTI9_5_handler+0x150>)
    22b2:	701a      	strb	r2, [r3, #0]
		break;
    22b4:	bf00      	nop
	}
}
    22b6:	370c      	adds	r7, #12
    22b8:	46bd      	mov	sp, r7
    22ba:	f85d 7b04 	ldr.w	r7, [sp], #4
    22be:	4770      	bx	lr
    22c0:	40010400 	.word	0x40010400
    22c4:	200000d8 	.word	0x200000d8
    22c8:	200000bc 	.word	0x200000bc
    22cc:	40010800 	.word	0x40010800
    22d0:	200000d9 	.word	0x200000d9
    22d4:	200000c5 	.word	0x200000c5
    22d8:	200000c8 	.word	0x200000c8

000022dc <TIM2_handler>:

void TIM2_handler(){
    22dc:	b580      	push	{r7, lr}
    22de:	af00      	add	r7, sp, #0
	TMR2->SR&=~(BIT0); // clear interrupt bit
    22e0:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    22e4:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    22e8:	691b      	ldr	r3, [r3, #16]
    22ea:	f023 0301 	bic.w	r3, r3, #1
    22ee:	6113      	str	r3, [r2, #16]
	if (ps2_tail!=ps2_head){
    22f0:	4b0f      	ldr	r3, [pc, #60]	; (2330 <TIM2_handler+0x54>)
    22f2:	781b      	ldrb	r3, [r3, #0]
    22f4:	b2da      	uxtb	r2, r3
    22f6:	4b0f      	ldr	r3, [pc, #60]	; (2334 <TIM2_handler+0x58>)
    22f8:	781b      	ldrb	r3, [r3, #0]
    22fa:	b2db      	uxtb	r3, r3
    22fc:	429a      	cmp	r2, r3
    22fe:	d015      	beq.n	232c <TIM2_handler+0x50>
		convert_code(ps2_queue[ps2_head++]);
    2300:	4b0c      	ldr	r3, [pc, #48]	; (2334 <TIM2_handler+0x58>)
    2302:	781b      	ldrb	r3, [r3, #0]
    2304:	b2db      	uxtb	r3, r3
    2306:	1c5a      	adds	r2, r3, #1
    2308:	b2d1      	uxtb	r1, r2
    230a:	4a0a      	ldr	r2, [pc, #40]	; (2334 <TIM2_handler+0x58>)
    230c:	7011      	strb	r1, [r2, #0]
    230e:	461a      	mov	r2, r3
    2310:	4b09      	ldr	r3, [pc, #36]	; (2338 <TIM2_handler+0x5c>)
    2312:	5c9b      	ldrb	r3, [r3, r2]
    2314:	b2db      	uxtb	r3, r3
    2316:	4618      	mov	r0, r3
    2318:	f7ff fdda 	bl	1ed0 <convert_code>
		ps2_head&=PS2_QUEUE_SIZE-1;
    231c:	4b05      	ldr	r3, [pc, #20]	; (2334 <TIM2_handler+0x58>)
    231e:	781b      	ldrb	r3, [r3, #0]
    2320:	b2db      	uxtb	r3, r3
    2322:	f003 030f 	and.w	r3, r3, #15
    2326:	b2da      	uxtb	r2, r3
    2328:	4b02      	ldr	r3, [pc, #8]	; (2334 <TIM2_handler+0x58>)
    232a:	701a      	strb	r2, [r3, #0]
	}
}
    232c:	bd80      	pop	{r7, pc}
    232e:	bf00      	nop
    2330:	200000c5 	.word	0x200000c5
    2334:	200000c4 	.word	0x200000c4
    2338:	200000c8 	.word	0x200000c8

0000233c <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(int irq){
    233c:	b480      	push	{r7}
    233e:	b083      	sub	sp, #12
    2340:	af00      	add	r7, sp, #0
    2342:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    2344:	687b      	ldr	r3, [r7, #4]
    2346:	2b3b      	cmp	r3, #59	; 0x3b
    2348:	dd00      	ble.n	234c <enable_interrupt+0x10>
    234a:	e016      	b.n	237a <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    234c:	687b      	ldr	r3, [r7, #4]
    234e:	115b      	asrs	r3, r3, #5
    2350:	009b      	lsls	r3, r3, #2
    2352:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2356:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    235a:	687a      	ldr	r2, [r7, #4]
    235c:	1152      	asrs	r2, r2, #5
    235e:	0092      	lsls	r2, r2, #2
    2360:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    2364:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    2368:	6812      	ldr	r2, [r2, #0]
    236a:	6879      	ldr	r1, [r7, #4]
    236c:	f001 011f 	and.w	r1, r1, #31
    2370:	2001      	movs	r0, #1
    2372:	fa00 f101 	lsl.w	r1, r0, r1
    2376:	430a      	orrs	r2, r1
    2378:	601a      	str	r2, [r3, #0]
}
    237a:	370c      	adds	r7, #12
    237c:	46bd      	mov	sp, r7
    237e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2382:	4770      	bx	lr

00002384 <disable_interrupt>:


void disable_interrupt(int irq){
    2384:	b480      	push	{r7}
    2386:	b083      	sub	sp, #12
    2388:	af00      	add	r7, sp, #0
    238a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    238c:	687b      	ldr	r3, [r7, #4]
    238e:	2b3b      	cmp	r3, #59	; 0x3b
    2390:	dd00      	ble.n	2394 <disable_interrupt+0x10>
    2392:	e00b      	b.n	23ac <disable_interrupt+0x28>
	ICER[irq>>5]=(1<<(irq&0x1f));
    2394:	687b      	ldr	r3, [r7, #4]
    2396:	115b      	asrs	r3, r3, #5
    2398:	009a      	lsls	r2, r3, #2
    239a:	4b07      	ldr	r3, [pc, #28]	; (23b8 <disable_interrupt+0x34>)
    239c:	4413      	add	r3, r2
    239e:	687a      	ldr	r2, [r7, #4]
    23a0:	f002 021f 	and.w	r2, r2, #31
    23a4:	2101      	movs	r1, #1
    23a6:	fa01 f202 	lsl.w	r2, r1, r2
    23aa:	601a      	str	r2, [r3, #0]
}
    23ac:	370c      	adds	r7, #12
    23ae:	46bd      	mov	sp, r7
    23b0:	f85d 7b04 	ldr.w	r7, [sp], #4
    23b4:	4770      	bx	lr
    23b6:	bf00      	nop
    23b8:	e000e180 	.word	0xe000e180

000023bc <get_pending>:

unsigned get_pending(int irq){
    23bc:	b480      	push	{r7}
    23be:	b083      	sub	sp, #12
    23c0:	af00      	add	r7, sp, #0
    23c2:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    23c4:	687b      	ldr	r3, [r7, #4]
    23c6:	2b3b      	cmp	r3, #59	; 0x3b
    23c8:	dd01      	ble.n	23ce <get_pending+0x12>
    23ca:	2300      	movs	r3, #0
    23cc:	e00c      	b.n	23e8 <get_pending+0x2c>
	return ICPR[irq>>5]&(1<<(irq&0x1f));
    23ce:	687b      	ldr	r3, [r7, #4]
    23d0:	115b      	asrs	r3, r3, #5
    23d2:	009a      	lsls	r2, r3, #2
    23d4:	4b07      	ldr	r3, [pc, #28]	; (23f4 <get_pending+0x38>)
    23d6:	4413      	add	r3, r2
    23d8:	681b      	ldr	r3, [r3, #0]
    23da:	687a      	ldr	r2, [r7, #4]
    23dc:	f002 021f 	and.w	r2, r2, #31
    23e0:	2101      	movs	r1, #1
    23e2:	fa01 f202 	lsl.w	r2, r1, r2
    23e6:	4013      	ands	r3, r2
}
    23e8:	4618      	mov	r0, r3
    23ea:	370c      	adds	r7, #12
    23ec:	46bd      	mov	sp, r7
    23ee:	f85d 7b04 	ldr.w	r7, [sp], #4
    23f2:	4770      	bx	lr
    23f4:	e000e280 	.word	0xe000e280

000023f8 <get_active>:

unsigned get_active(int irq){
    23f8:	b480      	push	{r7}
    23fa:	b083      	sub	sp, #12
    23fc:	af00      	add	r7, sp, #0
    23fe:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    2400:	687b      	ldr	r3, [r7, #4]
    2402:	2b3b      	cmp	r3, #59	; 0x3b
    2404:	dd01      	ble.n	240a <get_active+0x12>
    2406:	2300      	movs	r3, #0
    2408:	e00e      	b.n	2428 <get_active+0x30>
	return IABR[irq>>5]&(1<<(irq&0x1f));
    240a:	687b      	ldr	r3, [r7, #4]
    240c:	115b      	asrs	r3, r3, #5
    240e:	009b      	lsls	r3, r3, #2
    2410:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2414:	f503 4363 	add.w	r3, r3, #58112	; 0xe300
    2418:	681b      	ldr	r3, [r3, #0]
    241a:	687a      	ldr	r2, [r7, #4]
    241c:	f002 021f 	and.w	r2, r2, #31
    2420:	2101      	movs	r1, #1
    2422:	fa01 f202 	lsl.w	r2, r1, r2
    2426:	4013      	ands	r3, r2
}
    2428:	4618      	mov	r0, r3
    242a:	370c      	adds	r7, #12
    242c:	46bd      	mov	sp, r7
    242e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2432:	4770      	bx	lr

00002434 <set_pending>:

void set_pending(int irq){
    2434:	b480      	push	{r7}
    2436:	b083      	sub	sp, #12
    2438:	af00      	add	r7, sp, #0
    243a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    243c:	687b      	ldr	r3, [r7, #4]
    243e:	2b3b      	cmp	r3, #59	; 0x3b
    2440:	dd00      	ble.n	2444 <set_pending+0x10>
    2442:	e016      	b.n	2472 <set_pending+0x3e>
	ISPR[irq>>5]|=1<<(irq&0x1f);
    2444:	687b      	ldr	r3, [r7, #4]
    2446:	115b      	asrs	r3, r3, #5
    2448:	009b      	lsls	r3, r3, #2
    244a:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    244e:	f503 4362 	add.w	r3, r3, #57856	; 0xe200
    2452:	687a      	ldr	r2, [r7, #4]
    2454:	1152      	asrs	r2, r2, #5
    2456:	0092      	lsls	r2, r2, #2
    2458:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    245c:	f502 4262 	add.w	r2, r2, #57856	; 0xe200
    2460:	6812      	ldr	r2, [r2, #0]
    2462:	6879      	ldr	r1, [r7, #4]
    2464:	f001 011f 	and.w	r1, r1, #31
    2468:	2001      	movs	r0, #1
    246a:	fa00 f101 	lsl.w	r1, r0, r1
    246e:	430a      	orrs	r2, r1
    2470:	601a      	str	r2, [r3, #0]
}
    2472:	370c      	adds	r7, #12
    2474:	46bd      	mov	sp, r7
    2476:	f85d 7b04 	ldr.w	r7, [sp], #4
    247a:	4770      	bx	lr

0000247c <clear_pending>:

void clear_pending(int irq){
    247c:	b480      	push	{r7}
    247e:	b083      	sub	sp, #12
    2480:	af00      	add	r7, sp, #0
    2482:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    2484:	687b      	ldr	r3, [r7, #4]
    2486:	2b3b      	cmp	r3, #59	; 0x3b
    2488:	dd00      	ble.n	248c <clear_pending+0x10>
    248a:	e00b      	b.n	24a4 <clear_pending+0x28>
	ICPR[irq>>5]=(1<<(irq&0x1f));
    248c:	687b      	ldr	r3, [r7, #4]
    248e:	115b      	asrs	r3, r3, #5
    2490:	009a      	lsls	r2, r3, #2
    2492:	4b07      	ldr	r3, [pc, #28]	; (24b0 <clear_pending+0x34>)
    2494:	4413      	add	r3, r2
    2496:	687a      	ldr	r2, [r7, #4]
    2498:	f002 021f 	and.w	r2, r2, #31
    249c:	2101      	movs	r1, #1
    249e:	fa01 f202 	lsl.w	r2, r1, r2
    24a2:	601a      	str	r2, [r3, #0]
}
    24a4:	370c      	adds	r7, #12
    24a6:	46bd      	mov	sp, r7
    24a8:	f85d 7b04 	ldr.w	r7, [sp], #4
    24ac:	4770      	bx	lr
    24ae:	bf00      	nop
    24b0:	e000e280 	.word	0xe000e280

000024b4 <set_int_priority>:


void set_int_priority(int irq, unsigned priority){
    24b4:	b480      	push	{r7}
    24b6:	b083      	sub	sp, #12
    24b8:	af00      	add	r7, sp, #0
    24ba:	6078      	str	r0, [r7, #4]
    24bc:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    24be:	687b      	ldr	r3, [r7, #4]
    24c0:	2b00      	cmp	r3, #0
    24c2:	db0d      	blt.n	24e0 <set_int_priority+0x2c>
    24c4:	687b      	ldr	r3, [r7, #4]
    24c6:	2b3b      	cmp	r3, #59	; 0x3b
    24c8:	dc0a      	bgt.n	24e0 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    24ca:	687b      	ldr	r3, [r7, #4]
    24cc:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    24d0:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    24d4:	683a      	ldr	r2, [r7, #0]
    24d6:	b2d2      	uxtb	r2, r2
    24d8:	0112      	lsls	r2, r2, #4
    24da:	b2d2      	uxtb	r2, r2
    24dc:	701a      	strb	r2, [r3, #0]
    24de:	e012      	b.n	2506 <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    24e0:	687b      	ldr	r3, [r7, #4]
    24e2:	2b00      	cmp	r3, #0
    24e4:	da0f      	bge.n	2506 <set_int_priority+0x52>
    24e6:	687b      	ldr	r3, [r7, #4]
    24e8:	f113 0f0f 	cmn.w	r3, #15
    24ec:	db0b      	blt.n	2506 <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    24ee:	687a      	ldr	r2, [r7, #4]
    24f0:	f06f 0303 	mvn.w	r3, #3
    24f4:	1a9b      	subs	r3, r3, r2
    24f6:	461a      	mov	r2, r3
    24f8:	4b05      	ldr	r3, [pc, #20]	; (2510 <set_int_priority+0x5c>)
    24fa:	4413      	add	r3, r2
    24fc:	683a      	ldr	r2, [r7, #0]
    24fe:	b2d2      	uxtb	r2, r2
    2500:	0112      	lsls	r2, r2, #4
    2502:	b2d2      	uxtb	r2, r2
    2504:	701a      	strb	r2, [r3, #0]
	}
}
    2506:	370c      	adds	r7, #12
    2508:	46bd      	mov	sp, r7
    250a:	f85d 7b04 	ldr.w	r7, [sp], #4
    250e:	4770      	bx	lr
    2510:	e000ed18 	.word	0xe000ed18

00002514 <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    2514:	b480      	push	{r7}
    2516:	b083      	sub	sp, #12
    2518:	af00      	add	r7, sp, #0
    251a:	6078      	str	r0, [r7, #4]
    251c:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    251e:	687b      	ldr	r3, [r7, #4]
    2520:	881b      	ldrh	r3, [r3, #0]
    2522:	b29b      	uxth	r3, r3
    2524:	f423 63e0 	bic.w	r3, r3, #1792	; 0x700
    2528:	b29a      	uxth	r2, r3
    252a:	687b      	ldr	r3, [r7, #4]
    252c:	801a      	strh	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    252e:	687b      	ldr	r3, [r7, #4]
    2530:	881b      	ldrh	r3, [r3, #0]
    2532:	b29a      	uxth	r2, r3
    2534:	683b      	ldr	r3, [r7, #0]
    2536:	b29b      	uxth	r3, r3
    2538:	00db      	lsls	r3, r3, #3
    253a:	b29b      	uxth	r3, r3
    253c:	4313      	orrs	r3, r2
    253e:	b29a      	uxth	r2, r3
    2540:	687b      	ldr	r3, [r7, #4]
    2542:	801a      	strh	r2, [r3, #0]
}
    2544:	370c      	adds	r7, #12
    2546:	46bd      	mov	sp, r7
    2548:	f85d 7b04 	ldr.w	r7, [sp], #4
    254c:	4770      	bx	lr
    254e:	bf00      	nop

00002550 <spi_init>:


void spi_init(spi_sfr_t* channel, unsigned baud){
    2550:	b580      	push	{r7, lr}
    2552:	b082      	sub	sp, #8
    2554:	af00      	add	r7, sp, #0
    2556:	6078      	str	r0, [r7, #4]
    2558:	6039      	str	r1, [r7, #0]
	spi_baudrate(channel,baud);
    255a:	6878      	ldr	r0, [r7, #4]
    255c:	6839      	ldr	r1, [r7, #0]
    255e:	f7ff ffd9 	bl	2514 <spi_baudrate>
	channel->CR1=SPI_CR1_MSTR|SPI_CR1_SSM;
    2562:	687b      	ldr	r3, [r7, #4]
    2564:	f44f 7201 	mov.w	r2, #516	; 0x204
    2568:	801a      	strh	r2, [r3, #0]
	//channel->CR2|=SPI_CR2_SSOE;
	if (channel==SPI1){
    256a:	687b      	ldr	r3, [r7, #4]
    256c:	4a17      	ldr	r2, [pc, #92]	; (25cc <spi_init+0x7c>)
    256e:	4293      	cmp	r3, r2
    2570:	d114      	bne.n	259c <spi_init+0x4c>
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(PORTA,4,OUTPUT_PP_FAST);
    2572:	4817      	ldr	r0, [pc, #92]	; (25d0 <spi_init+0x80>)
    2574:	2104      	movs	r1, #4
    2576:	2203      	movs	r2, #3
    2578:	f7ff fbce 	bl	1d18 <config_pin>
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(PORTA,5,OUTPUT_PP_FAST);
    257c:	4814      	ldr	r0, [pc, #80]	; (25d0 <spi_init+0x80>)
    257e:	2105      	movs	r1, #5
    2580:	2203      	movs	r2, #3
    2582:	f7ff fbc9 	bl	1d18 <config_pin>
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(PORTA,6,INPUT_FLOAT);
    2586:	4812      	ldr	r0, [pc, #72]	; (25d0 <spi_init+0x80>)
    2588:	2106      	movs	r1, #6
    258a:	2204      	movs	r2, #4
    258c:	f7ff fbc4 	bl	1d18 <config_pin>
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(PORTA,7,OUTPUT_PP_FAST);
    2590:	480f      	ldr	r0, [pc, #60]	; (25d0 <spi_init+0x80>)
    2592:	2107      	movs	r1, #7
    2594:	2203      	movs	r2, #3
    2596:	f7ff fbbf 	bl	1d18 <config_pin>
    259a:	e013      	b.n	25c4 <spi_init+0x74>
	}else{
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(PORTB,2,OUTPUT_PP_FAST);
    259c:	480d      	ldr	r0, [pc, #52]	; (25d4 <spi_init+0x84>)
    259e:	2102      	movs	r1, #2
    25a0:	2203      	movs	r2, #3
    25a2:	f7ff fbb9 	bl	1d18 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(PORTB,13,OUTPUT_PP_FAST);
    25a6:	480b      	ldr	r0, [pc, #44]	; (25d4 <spi_init+0x84>)
    25a8:	210d      	movs	r1, #13
    25aa:	2203      	movs	r2, #3
    25ac:	f7ff fbb4 	bl	1d18 <config_pin>
		// PB14 MISO input (floating)
		config_pin(PORTB,14,INPUT_FLOAT);
    25b0:	4808      	ldr	r0, [pc, #32]	; (25d4 <spi_init+0x84>)
    25b2:	210e      	movs	r1, #14
    25b4:	2204      	movs	r2, #4
    25b6:	f7ff fbaf 	bl	1d18 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(PORTB,15,OUTPUT_PP_FAST);
    25ba:	4806      	ldr	r0, [pc, #24]	; (25d4 <spi_init+0x84>)
    25bc:	210f      	movs	r1, #15
    25be:	2203      	movs	r2, #3
    25c0:	f7ff fbaa 	bl	1d18 <config_pin>
	}
}
    25c4:	3708      	adds	r7, #8
    25c6:	46bd      	mov	sp, r7
    25c8:	bd80      	pop	{r7, pc}
    25ca:	bf00      	nop
    25cc:	40013000 	.word	0x40013000
    25d0:	40010800 	.word	0x40010800
    25d4:	40010c00 	.word	0x40010c00

000025d8 <spi_enable>:

void spi_enable(spi_sfr_t* channel, unsigned mode){
    25d8:	b480      	push	{r7}
    25da:	b083      	sub	sp, #12
    25dc:	af00      	add	r7, sp, #0
    25de:	6078      	str	r0, [r7, #4]
    25e0:	6039      	str	r1, [r7, #0]
	switch (mode){
    25e2:	683b      	ldr	r3, [r7, #0]
    25e4:	2b01      	cmp	r3, #1
    25e6:	d00d      	beq.n	2604 <spi_enable+0x2c>
    25e8:	2b01      	cmp	r3, #1
    25ea:	d302      	bcc.n	25f2 <spi_enable+0x1a>
    25ec:	2b02      	cmp	r3, #2
    25ee:	d005      	beq.n	25fc <spi_enable+0x24>
    25f0:	e00d      	b.n	260e <spi_enable+0x36>
		case SPI_MODE_READ:
		channel->CR1=SPI_CR1_RXONLY|SPI_CR1_SPE;
    25f2:	687b      	ldr	r3, [r7, #4]
    25f4:	f44f 6288 	mov.w	r2, #1088	; 0x440
    25f8:	801a      	strh	r2, [r3, #0]
		break;
    25fa:	e008      	b.n	260e <spi_enable+0x36>
		case SPI_MODE_READ_WRITE:
		channel->CR1=SPI_CR1_SPE;
    25fc:	687b      	ldr	r3, [r7, #4]
    25fe:	2240      	movs	r2, #64	; 0x40
    2600:	801a      	strh	r2, [r3, #0]
		break;
    2602:	e004      	b.n	260e <spi_enable+0x36>
		case SPI_MODE_WRITE:
		channel->CR1=SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE|SPI_CR1_SPE;
    2604:	687b      	ldr	r3, [r7, #4]
    2606:	f24c 0240 	movw	r2, #49216	; 0xc040
    260a:	801a      	strh	r2, [r3, #0]
		break;
    260c:	bf00      	nop
	}
}
    260e:	370c      	adds	r7, #12
    2610:	46bd      	mov	sp, r7
    2612:	f85d 7b04 	ldr.w	r7, [sp], #4
    2616:	4770      	bx	lr

00002618 <spi_disable>:

void spi_disable(spi_sfr_t* channel){
    2618:	b480      	push	{r7}
    261a:	b083      	sub	sp, #12
    261c:	af00      	add	r7, sp, #0
    261e:	6078      	str	r0, [r7, #4]
	channel->CR1&=~SPI_CR1_SPE;
    2620:	687b      	ldr	r3, [r7, #4]
    2622:	881b      	ldrh	r3, [r3, #0]
    2624:	b29b      	uxth	r3, r3
    2626:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    262a:	b29a      	uxth	r2, r3
    262c:	687b      	ldr	r3, [r7, #4]
    262e:	801a      	strh	r2, [r3, #0]
}
    2630:	370c      	adds	r7, #12
    2632:	46bd      	mov	sp, r7
    2634:	f85d 7b04 	ldr.w	r7, [sp], #4
    2638:	4770      	bx	lr
    263a:	bf00      	nop

0000263c <spi_write>:

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
    263c:	b580      	push	{r7, lr}
    263e:	b082      	sub	sp, #8
    2640:	af00      	add	r7, sp, #0
    2642:	6078      	str	r0, [r7, #4]
    2644:	460b      	mov	r3, r1
    2646:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
    2648:	6878      	ldr	r0, [r7, #4]
    264a:	2101      	movs	r1, #1
    264c:	f7ff ffc4 	bl	25d8 <spi_enable>
	channel->DR=b;
    2650:	78fb      	ldrb	r3, [r7, #3]
    2652:	b29a      	uxth	r2, r3
    2654:	687b      	ldr	r3, [r7, #4]
    2656:	819a      	strh	r2, [r3, #12]
	spi_disable(channel);
    2658:	6878      	ldr	r0, [r7, #4]
    265a:	f7ff ffdd 	bl	2618 <spi_disable>
}
    265e:	3708      	adds	r7, #8
    2660:	46bd      	mov	sp, r7
    2662:	bd80      	pop	{r7, pc}

00002664 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    2664:	b580      	push	{r7, lr}
    2666:	b084      	sub	sp, #16
    2668:	af00      	add	r7, sp, #0
    266a:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
    266c:	6878      	ldr	r0, [r7, #4]
    266e:	2100      	movs	r1, #0
    2670:	f7ff ffb2 	bl	25d8 <spi_enable>
	channel->DR=255;
    2674:	687b      	ldr	r3, [r7, #4]
    2676:	22ff      	movs	r2, #255	; 0xff
    2678:	819a      	strh	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    267a:	bf00      	nop
    267c:	687b      	ldr	r3, [r7, #4]
    267e:	891b      	ldrh	r3, [r3, #8]
    2680:	b29b      	uxth	r3, r3
    2682:	f003 0301 	and.w	r3, r3, #1
    2686:	2b00      	cmp	r3, #0
    2688:	d0f8      	beq.n	267c <spi_read+0x18>
	rx=(uint8_t)channel->DR;
    268a:	687b      	ldr	r3, [r7, #4]
    268c:	899b      	ldrh	r3, [r3, #12]
    268e:	b29b      	uxth	r3, r3
    2690:	73fb      	strb	r3, [r7, #15]
	spi_disable(channel);
    2692:	6878      	ldr	r0, [r7, #4]
    2694:	f7ff ffc0 	bl	2618 <spi_disable>
	return rx;
    2698:	7bfb      	ldrb	r3, [r7, #15]
}
    269a:	4618      	mov	r0, r3
    269c:	3710      	adds	r7, #16
    269e:	46bd      	mov	sp, r7
    26a0:	bd80      	pop	{r7, pc}
    26a2:	bf00      	nop

000026a4 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    26a4:	b580      	push	{r7, lr}
    26a6:	b084      	sub	sp, #16
    26a8:	af00      	add	r7, sp, #0
    26aa:	60f8      	str	r0, [r7, #12]
    26ac:	60b9      	str	r1, [r7, #8]
    26ae:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_WRITE);
    26b0:	68f8      	ldr	r0, [r7, #12]
    26b2:	2101      	movs	r1, #1
    26b4:	f7ff ff90 	bl	25d8 <spi_enable>
	while (count){
    26b8:	e011      	b.n	26de <spi_block_write+0x3a>
		channel->DR=*buffer++;
    26ba:	68bb      	ldr	r3, [r7, #8]
    26bc:	1c5a      	adds	r2, r3, #1
    26be:	60ba      	str	r2, [r7, #8]
    26c0:	781b      	ldrb	r3, [r3, #0]
    26c2:	b29a      	uxth	r2, r3
    26c4:	68fb      	ldr	r3, [r7, #12]
    26c6:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    26c8:	bf00      	nop
    26ca:	68fb      	ldr	r3, [r7, #12]
    26cc:	891b      	ldrh	r3, [r3, #8]
    26ce:	b29b      	uxth	r3, r3
    26d0:	f003 0302 	and.w	r3, r3, #2
    26d4:	2b00      	cmp	r3, #0
    26d6:	d0f8      	beq.n	26ca <spi_block_write+0x26>
		count--;
    26d8:	687b      	ldr	r3, [r7, #4]
    26da:	3b01      	subs	r3, #1
    26dc:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_enable(channel,SPI_MODE_WRITE);
	while (count){
    26de:	687b      	ldr	r3, [r7, #4]
    26e0:	2b00      	cmp	r3, #0
    26e2:	d1ea      	bne.n	26ba <spi_block_write+0x16>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	spi_disable(channel);
    26e4:	68f8      	ldr	r0, [r7, #12]
    26e6:	f7ff ff97 	bl	2618 <spi_disable>
}
    26ea:	3710      	adds	r7, #16
    26ec:	46bd      	mov	sp, r7
    26ee:	bd80      	pop	{r7, pc}

000026f0 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    26f0:	b580      	push	{r7, lr}
    26f2:	b084      	sub	sp, #16
    26f4:	af00      	add	r7, sp, #0
    26f6:	60f8      	str	r0, [r7, #12]
    26f8:	60b9      	str	r1, [r7, #8]
    26fa:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_READ);
    26fc:	68f8      	ldr	r0, [r7, #12]
    26fe:	2100      	movs	r1, #0
    2700:	f7ff ff6a 	bl	25d8 <spi_enable>
	while (count){
    2704:	e015      	b.n	2732 <spi_block_read+0x42>
		channel->DR=0;
    2706:	68fb      	ldr	r3, [r7, #12]
    2708:	2200      	movs	r2, #0
    270a:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    270c:	bf00      	nop
    270e:	68fb      	ldr	r3, [r7, #12]
    2710:	891b      	ldrh	r3, [r3, #8]
    2712:	b29b      	uxth	r3, r3
    2714:	f003 0301 	and.w	r3, r3, #1
    2718:	2b00      	cmp	r3, #0
    271a:	d0f8      	beq.n	270e <spi_block_read+0x1e>
		*buffer++=(uint8_t)channel->DR;
    271c:	68bb      	ldr	r3, [r7, #8]
    271e:	1c5a      	adds	r2, r3, #1
    2720:	60ba      	str	r2, [r7, #8]
    2722:	68fa      	ldr	r2, [r7, #12]
    2724:	8992      	ldrh	r2, [r2, #12]
    2726:	b292      	uxth	r2, r2
    2728:	b2d2      	uxtb	r2, r2
    272a:	701a      	strb	r2, [r3, #0]
		count--;
    272c:	687b      	ldr	r3, [r7, #4]
    272e:	3b01      	subs	r3, #1
    2730:	607b      	str	r3, [r7, #4]
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_enable(channel,SPI_MODE_READ);
	while (count){
    2732:	687b      	ldr	r3, [r7, #4]
    2734:	2b00      	cmp	r3, #0
    2736:	d1e6      	bne.n	2706 <spi_block_read+0x16>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
	spi_disable(channel);
    2738:	68f8      	ldr	r0, [r7, #12]
    273a:	f7ff ff6d 	bl	2618 <spi_disable>
}
    273e:	3710      	adds	r7, #16
    2740:	46bd      	mov	sp, r7
    2742:	bd80      	pop	{r7, pc}

00002744 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    2744:	4b01      	ldr	r3, [pc, #4]	; (274c <reset_mcu+0x8>)
    2746:	4a02      	ldr	r2, [pc, #8]	; (2750 <reset_mcu+0xc>)
    2748:	601a      	str	r2, [r3, #0]
    274a:	bf00      	nop
    274c:	e000ed0c 	.word	0xe000ed0c
    2750:	05fa0004 	.word	0x05fa0004

00002754 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    2754:	b580      	push	{r7, lr}
    2756:	b082      	sub	sp, #8
    2758:	af00      	add	r7, sp, #0
    275a:	6078      	str	r0, [r7, #4]
    275c:	6039      	str	r1, [r7, #0]
	print(msg);
    275e:	6878      	ldr	r0, [r7, #4]
    2760:	f7fe fcfe 	bl	1160 <print>
	print("at address ");
    2764:	4814      	ldr	r0, [pc, #80]	; (27b8 <print_fault+0x64>)
    2766:	f7fe fcfb 	bl	1160 <print>
	if (adr) {
    276a:	683b      	ldr	r3, [r7, #0]
    276c:	2b00      	cmp	r3, #0
    276e:	d002      	beq.n	2776 <print_fault+0x22>
		print_hex(adr);
    2770:	6838      	ldr	r0, [r7, #0]
    2772:	f7fe fe3d 	bl	13f0 <print_hex>
	};
	conout(CR);
    2776:	200d      	movs	r0, #13
    2778:	f7fe fcd8 	bl	112c <conout>
	print("UFSR=");
    277c:	480f      	ldr	r0, [pc, #60]	; (27bc <print_fault+0x68>)
    277e:	f7fe fcef 	bl	1160 <print>
	print_hex(CFSR->fsr.usageFalt);
    2782:	4b0f      	ldr	r3, [pc, #60]	; (27c0 <print_fault+0x6c>)
    2784:	681b      	ldr	r3, [r3, #0]
    2786:	0c1b      	lsrs	r3, r3, #16
    2788:	b29b      	uxth	r3, r3
    278a:	4618      	mov	r0, r3
    278c:	f7fe fe30 	bl	13f0 <print_hex>
	print(", BFSR=");
    2790:	480c      	ldr	r0, [pc, #48]	; (27c4 <print_fault+0x70>)
    2792:	f7fe fce5 	bl	1160 <print>
	print_hex(CFSR->fsr.busFault);
    2796:	4b0a      	ldr	r3, [pc, #40]	; (27c0 <print_fault+0x6c>)
    2798:	681b      	ldr	r3, [r3, #0]
    279a:	0a1b      	lsrs	r3, r3, #8
    279c:	b2db      	uxtb	r3, r3
    279e:	4618      	mov	r0, r3
    27a0:	f7fe fe26 	bl	13f0 <print_hex>
	print(", MMFSR=");
    27a4:	4808      	ldr	r0, [pc, #32]	; (27c8 <print_fault+0x74>)
    27a6:	f7fe fcdb 	bl	1160 <print>
	print_hex(CFSR->fsr.mmFault);
    27aa:	4b05      	ldr	r3, [pc, #20]	; (27c0 <print_fault+0x6c>)
    27ac:	681b      	ldr	r3, [r3, #0]
    27ae:	b2db      	uxtb	r3, r3
    27b0:	4618      	mov	r0, r3
    27b2:	f7fe fe1d 	bl	13f0 <print_hex>
	while(1);
    27b6:	e7fe      	b.n	27b6 <print_fault+0x62>
    27b8:	000036e8 	.word	0x000036e8
    27bc:	000036f4 	.word	0x000036f4
    27c0:	e000ed28 	.word	0xe000ed28
    27c4:	000036fc 	.word	0x000036fc
    27c8:	00003704 	.word	0x00003704

000027cc <config_systicks>:


// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
#define MSEC_DLY FCLK/8/1000
void config_systicks(){
    27cc:	b580      	push	{r7, lr}
    27ce:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,9);
    27d0:	f06f 000e 	mvn.w	r0, #14
    27d4:	2109      	movs	r1, #9
    27d6:	f7ff fe6d 	bl	24b4 <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
    27da:	4b04      	ldr	r3, [pc, #16]	; (27ec <config_systicks+0x20>)
    27dc:	f641 723f 	movw	r2, #7999	; 0x1f3f
    27e0:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
    27e2:	4b03      	ldr	r3, [pc, #12]	; (27f0 <config_systicks+0x24>)
    27e4:	2203      	movs	r2, #3
    27e6:	601a      	str	r2, [r3, #0]
}
    27e8:	bd80      	pop	{r7, pc}
    27ea:	bf00      	nop
    27ec:	e000e014 	.word	0xe000e014
    27f0:	e000e010 	.word	0xe000e010

000027f4 <pause>:



void pause(unsigned msec){
    27f4:	b480      	push	{r7}
    27f6:	b083      	sub	sp, #12
    27f8:	af00      	add	r7, sp, #0
    27fa:	6078      	str	r0, [r7, #4]
	timer=msec;
    27fc:	4a06      	ldr	r2, [pc, #24]	; (2818 <pause+0x24>)
    27fe:	687b      	ldr	r3, [r7, #4]
    2800:	6013      	str	r3, [r2, #0]
	while (timer);
    2802:	bf00      	nop
    2804:	4b04      	ldr	r3, [pc, #16]	; (2818 <pause+0x24>)
    2806:	681b      	ldr	r3, [r3, #0]
    2808:	2b00      	cmp	r3, #0
    280a:	d1fb      	bne.n	2804 <pause+0x10>
}
    280c:	370c      	adds	r7, #12
    280e:	46bd      	mov	sp, r7
    2810:	f85d 7b04 	ldr.w	r7, [sp], #4
    2814:	4770      	bx	lr
    2816:	bf00      	nop
    2818:	200000e0 	.word	0x200000e0

0000281c <STK_handler>:


// interruption coretimer
void STK_handler(){
    281c:	b480      	push	{r7}
    281e:	af00      	add	r7, sp, #0
	ticks++;
    2820:	4b08      	ldr	r3, [pc, #32]	; (2844 <STK_handler+0x28>)
    2822:	681b      	ldr	r3, [r3, #0]
    2824:	3301      	adds	r3, #1
    2826:	4a07      	ldr	r2, [pc, #28]	; (2844 <STK_handler+0x28>)
    2828:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
    282a:	4b07      	ldr	r3, [pc, #28]	; (2848 <STK_handler+0x2c>)
    282c:	681b      	ldr	r3, [r3, #0]
    282e:	2b00      	cmp	r3, #0
    2830:	d004      	beq.n	283c <STK_handler+0x20>
    2832:	4b05      	ldr	r3, [pc, #20]	; (2848 <STK_handler+0x2c>)
    2834:	681b      	ldr	r3, [r3, #0]
    2836:	3b01      	subs	r3, #1
    2838:	4a03      	ldr	r2, [pc, #12]	; (2848 <STK_handler+0x2c>)
    283a:	6013      	str	r3, [r2, #0]
}
    283c:	46bd      	mov	sp, r7
    283e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2842:	4770      	bx	lr
    2844:	200000dc 	.word	0x200000dc
    2848:	200000e0 	.word	0x200000e0

0000284c <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    284c:	b480      	push	{r7}
    284e:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    2850:	2300      	movs	r3, #0
    2852:	2200      	movs	r2, #0
    2854:	4618      	mov	r0, r3
    2856:	4611      	mov	r1, r2
    2858:	df02      	svc	2
}
    285a:	46bd      	mov	sp, r7
    285c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2860:	4770      	bx	lr
    2862:	bf00      	nop

00002864 <tvout_init>:

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
    2864:	b580      	push	{r7, lr}
    2866:	b082      	sub	sp, #8
    2868:	af00      	add	r7, sp, #0
	//sortie sync sur PA8
	config_pin(PORTA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    286a:	4850      	ldr	r0, [pc, #320]	; (29ac <tvout_init+0x148>)
    286c:	2108      	movs	r1, #8
    286e:	220a      	movs	r2, #10
    2870:	f7ff fa52 	bl	1d18 <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    2874:	484e      	ldr	r0, [pc, #312]	; (29b0 <tvout_init+0x14c>)
    2876:	210f      	movs	r1, #15
    2878:	220b      	movs	r2, #11
    287a:	f7ff fa4d 	bl	1d18 <config_pin>
	PORTB->BRR=BIT15;
    287e:	4b4c      	ldr	r3, [pc, #304]	; (29b0 <tvout_init+0x14c>)
    2880:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    2884:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
    2886:	4a4b      	ldr	r2, [pc, #300]	; (29b4 <tvout_init+0x150>)
    2888:	4b4a      	ldr	r3, [pc, #296]	; (29b4 <tvout_init+0x150>)
    288a:	699b      	ldr	r3, [r3, #24]
    288c:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    2890:	6193      	str	r3, [r2, #24]
	// clock source division
	*TIMER1_PSC=0;
    2892:	4b49      	ldr	r3, [pc, #292]	; (29b8 <tvout_init+0x154>)
    2894:	2200      	movs	r2, #0
    2896:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    2898:	4b48      	ldr	r3, [pc, #288]	; (29bc <tvout_init+0x158>)
    289a:	f640 72ff 	movw	r2, #4095	; 0xfff
    289e:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    28a0:	4b47      	ldr	r3, [pc, #284]	; (29c0 <tvout_init+0x15c>)
    28a2:	f240 122b 	movw	r2, #299	; 0x12b
    28a6:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    28a8:	4b46      	ldr	r3, [pc, #280]	; (29c4 <tvout_init+0x160>)
    28aa:	681a      	ldr	r2, [r3, #0]
    28ac:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    28b0:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    28b4:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    28b6:	4b43      	ldr	r3, [pc, #268]	; (29c4 <tvout_init+0x160>)
    28b8:	681a      	ldr	r2, [r3, #0]
    28ba:	f042 0208 	orr.w	r2, r2, #8
    28be:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    28c0:	4b41      	ldr	r3, [pc, #260]	; (29c8 <tvout_init+0x164>)
    28c2:	681a      	ldr	r2, [r3, #0]
    28c4:	f042 0201 	orr.w	r2, r2, #1
    28c8:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    28ca:	4b3f      	ldr	r3, [pc, #252]	; (29c8 <tvout_init+0x164>)
    28cc:	681a      	ldr	r2, [r3, #0]
    28ce:	f042 0202 	orr.w	r2, r2, #2
    28d2:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    28d4:	4a3d      	ldr	r2, [pc, #244]	; (29cc <tvout_init+0x168>)
    28d6:	8813      	ldrh	r3, [r2, #0]
    28d8:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    28dc:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    28e0:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    28e2:	4b3b      	ldr	r3, [pc, #236]	; (29d0 <tvout_init+0x16c>)
    28e4:	681a      	ldr	r2, [r3, #0]
    28e6:	f042 0201 	orr.w	r2, r2, #1
    28ea:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    28ec:	4b39      	ldr	r3, [pc, #228]	; (29d4 <tvout_init+0x170>)
    28ee:	f640 324c 	movw	r2, #2892	; 0xb4c
    28f2:	801a      	strh	r2, [r3, #0]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    28f4:	4b38      	ldr	r3, [pc, #224]	; (29d8 <tvout_init+0x174>)
    28f6:	f243 5292 	movw	r2, #13714	; 0x3592
    28fa:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    28fc:	4b36      	ldr	r3, [pc, #216]	; (29d8 <tvout_init+0x174>)
    28fe:	4a37      	ldr	r2, [pc, #220]	; (29dc <tvout_init+0x178>)
    2900:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    2902:	4a34      	ldr	r2, [pc, #208]	; (29d4 <tvout_init+0x170>)
    2904:	4b33      	ldr	r3, [pc, #204]	; (29d4 <tvout_init+0x170>)
    2906:	889b      	ldrh	r3, [r3, #4]
    2908:	b29b      	uxth	r3, r3
    290a:	f043 0302 	orr.w	r3, r3, #2
    290e:	b29b      	uxth	r3, r3
    2910:	8093      	strh	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,1);
    2912:	200f      	movs	r0, #15
    2914:	2101      	movs	r1, #1
    2916:	f7ff fdcd 	bl	24b4 <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    291a:	200f      	movs	r0, #15
    291c:	f7ff fd0e 	bl	233c <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    2920:	4b2f      	ldr	r3, [pc, #188]	; (29e0 <tvout_init+0x17c>)
    2922:	681a      	ldr	r2, [r3, #0]
    2924:	f042 0202 	orr.w	r2, r2, #2
    2928:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,1);
    292a:	201b      	movs	r0, #27
    292c:	2101      	movs	r1, #1
    292e:	f7ff fdc1 	bl	24b4 <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    2932:	201b      	movs	r0, #27
    2934:	f7ff fd02 	bl	233c <enable_interrupt>
	//video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    2938:	2300      	movs	r3, #0
    293a:	607b      	str	r3, [r7, #4]
    293c:	e011      	b.n	2962 <tvout_init+0xfe>
		video_buffer[i]=0xffff;
    293e:	4a29      	ldr	r2, [pc, #164]	; (29e4 <tvout_init+0x180>)
    2940:	687b      	ldr	r3, [r7, #4]
    2942:	f64f 71ff 	movw	r1, #65535	; 0xffff
    2946:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
    294a:	687b      	ldr	r3, [r7, #4]
    294c:	f503 5395 	add.w	r3, r3, #4768	; 0x12a0
    2950:	330c      	adds	r3, #12
    2952:	4a24      	ldr	r2, [pc, #144]	; (29e4 <tvout_init+0x180>)
    2954:	f64f 71ff 	movw	r1, #65535	; 0xffff
    2958:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,1);
	enable_interrupt(IRQ_TIM1_CC);
	//video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    295c:	687b      	ldr	r3, [r7, #4]
    295e:	3301      	adds	r3, #1
    2960:	607b      	str	r3, [r7, #4]
    2962:	687b      	ldr	r3, [r7, #4]
    2964:	2b13      	cmp	r3, #19
    2966:	ddea      	ble.n	293e <tvout_init+0xda>
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    2968:	2301      	movs	r3, #1
    296a:	607b      	str	r3, [r7, #4]
    296c:	e018      	b.n	29a0 <tvout_init+0x13c>
		video_buffer[i*ROW_SIZE]=0x8000;
    296e:	687a      	ldr	r2, [r7, #4]
    2970:	4613      	mov	r3, r2
    2972:	009b      	lsls	r3, r3, #2
    2974:	4413      	add	r3, r2
    2976:	009b      	lsls	r3, r3, #2
    2978:	461a      	mov	r2, r3
    297a:	4b1a      	ldr	r3, [pc, #104]	; (29e4 <tvout_init+0x180>)
    297c:	f44f 4100 	mov.w	r1, #32768	; 0x8000
    2980:	f823 1012 	strh.w	r1, [r3, r2, lsl #1]
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
    2984:	687b      	ldr	r3, [r7, #4]
    2986:	1c5a      	adds	r2, r3, #1
    2988:	4613      	mov	r3, r2
    298a:	009b      	lsls	r3, r3, #2
    298c:	4413      	add	r3, r2
    298e:	009b      	lsls	r3, r3, #2
    2990:	3b01      	subs	r3, #1
    2992:	4a14      	ldr	r2, [pc, #80]	; (29e4 <tvout_init+0x180>)
    2994:	2101      	movs	r1, #1
    2996:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i;
	for (i=0;i<ROW_SIZE;i++){
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    299a:	687b      	ldr	r3, [r7, #4]
    299c:	3301      	adds	r3, #1
    299e:	607b      	str	r3, [r7, #4]
    29a0:	687b      	ldr	r3, [r7, #4]
    29a2:	2bed      	cmp	r3, #237	; 0xed
    29a4:	dde3      	ble.n	296e <tvout_init+0x10a>
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	// test end */
 }
    29a6:	3708      	adds	r7, #8
    29a8:	46bd      	mov	sp, r7
    29aa:	bd80      	pop	{r7, pc}
    29ac:	40010800 	.word	0x40010800
    29b0:	40010c00 	.word	0x40010c00
    29b4:	40021000 	.word	0x40021000
    29b8:	40012c28 	.word	0x40012c28
    29bc:	40012c2c 	.word	0x40012c2c
    29c0:	40012c34 	.word	0x40012c34
    29c4:	40012c18 	.word	0x40012c18
    29c8:	40012c20 	.word	0x40012c20
    29cc:	40012c44 	.word	0x40012c44
    29d0:	40012c00 	.word	0x40012c00
    29d4:	40003800 	.word	0x40003800
    29d8:	40020058 	.word	0x40020058
    29dc:	4000380c 	.word	0x4000380c
    29e0:	40012c0c 	.word	0x40012c0c
    29e4:	20000130 	.word	0x20000130

000029e8 <TIM1_CC_handler>:
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    29e8:	4853      	ldr	r0, [pc, #332]	; (2b38 <TIM1_CC_handler+0x150>)
	line_count++;
    29ea:	4b54      	ldr	r3, [pc, #336]	; (2b3c <TIM1_CC_handler+0x154>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    29ec:	6802      	ldr	r2, [r0, #0]
	line_count++;
	TIMER1_SR->fld.cc1if=0;
    29ee:	4954      	ldr	r1, [pc, #336]	; (2b40 <TIM1_CC_handler+0x158>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    29f0:	f022 0201 	bic.w	r2, r2, #1
    29f4:	6002      	str	r2, [r0, #0]
	line_count++;
    29f6:	681a      	ldr	r2, [r3, #0]
    29f8:	3201      	adds	r2, #1
    29fa:	601a      	str	r2, [r3, #0]
	TIMER1_SR->fld.cc1if=0;
    29fc:	680a      	ldr	r2, [r1, #0]
    29fe:	f022 0202 	bic.w	r2, r2, #2
    2a02:	600a      	str	r2, [r1, #0]
	switch(line_count){
    2a04:	681a      	ldr	r2, [r3, #0]
    2a06:	2a12      	cmp	r2, #18
    2a08:	f000 8090 	beq.w	2b2c <TIM1_CC_handler+0x144>
    2a0c:	dd1d      	ble.n	2a4a <TIM1_CC_handler+0x62>
    2a0e:	f5b2 7f96 	cmp.w	r2, #300	; 0x12c
    2a12:	f000 8082 	beq.w	2b1a <TIM1_CC_handler+0x132>
    2a16:	dd3f      	ble.n	2a98 <TIM1_CC_handler+0xb0>
    2a18:	f240 1141 	movw	r1, #321	; 0x141
    2a1c:	428a      	cmp	r2, r1
    2a1e:	d028      	beq.n	2a72 <TIM1_CC_handler+0x8a>
    2a20:	f5b2 7fa1 	cmp.w	r2, #322	; 0x142
    2a24:	d14a      	bne.n	2abc <TIM1_CC_handler+0xd4>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    2a26:	4a47      	ldr	r2, [pc, #284]	; (2b44 <TIM1_CC_handler+0x15c>)
    2a28:	6811      	ldr	r1, [r2, #0]
    2a2a:	b169      	cbz	r1, 2a48 <TIM1_CC_handler+0x60>
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
    2a2c:	b410      	push	{r4}
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    2a2e:	4846      	ldr	r0, [pc, #280]	; (2b48 <TIM1_CC_handler+0x160>)
			line_count=-1;
    2a30:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    2a34:	8801      	ldrh	r1, [r0, #0]
    2a36:	f3c1 014e 	ubfx	r1, r1, #1, #15
    2a3a:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    2a3c:	601c      	str	r4, [r3, #0]
			even=-even;
    2a3e:	6813      	ldr	r3, [r2, #0]
    2a40:	425b      	negs	r3, r3
    2a42:	6013      	str	r3, [r2, #0]
			);
			_enable_dma();
		}
		break;
	}//switch (line_count)
}
    2a44:	f85d 4b04 	ldr.w	r4, [sp], #4
    2a48:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2a4a:	2a06      	cmp	r2, #6
    2a4c:	d069      	beq.n	2b22 <TIM1_CC_handler+0x13a>
    2a4e:	dd29      	ble.n	2aa4 <TIM1_CC_handler+0xbc>
    2a50:	2a0c      	cmp	r2, #12
    2a52:	d019      	beq.n	2a88 <TIM1_CC_handler+0xa0>
    2a54:	2a11      	cmp	r2, #17
    2a56:	d131      	bne.n	2abc <TIM1_CC_handler+0xd4>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
		break;
	case 17: // fin sync champ paire
		if (even){
    2a58:	4b3a      	ldr	r3, [pc, #232]	; (2b44 <TIM1_CC_handler+0x15c>)
    2a5a:	681b      	ldr	r3, [r3, #0]
    2a5c:	2b00      	cmp	r3, #0
    2a5e:	d0f3      	beq.n	2a48 <TIM1_CC_handler+0x60>
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    2a60:	f640 70ff 	movw	r0, #4095	; 0xfff
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    2a64:	f240 122b 	movw	r2, #299	; 0x12b
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    2a68:	4937      	ldr	r1, [pc, #220]	; (2b48 <TIM1_CC_handler+0x160>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    2a6a:	4b38      	ldr	r3, [pc, #224]	; (2b4c <TIM1_CC_handler+0x164>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    2a6c:	8008      	strh	r0, [r1, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    2a6e:	801a      	strh	r2, [r3, #0]
    2a70:	4770      	bx	lr
		break;
	case (TOP_LINE+VRES):
		video=0;
		break;
	case FIELD_END:
		if (!even){
    2a72:	4a34      	ldr	r2, [pc, #208]	; (2b44 <TIM1_CC_handler+0x15c>)
    2a74:	6811      	ldr	r1, [r2, #0]
    2a76:	2900      	cmp	r1, #0
    2a78:	d1e6      	bne.n	2a48 <TIM1_CC_handler+0x60>
			line_count=-1;
    2a7a:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    2a7e:	6019      	str	r1, [r3, #0]
			even=-even;
    2a80:	6813      	ldr	r3, [r2, #0]
    2a82:	425b      	negs	r3, r3
    2a84:	6013      	str	r3, [r2, #0]
    2a86:	4770      	bx	lr
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    2a88:	f240 70ff 	movw	r0, #2047	; 0x7ff
    2a8c:	492e      	ldr	r1, [pc, #184]	; (2b48 <TIM1_CC_handler+0x160>)
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    2a8e:	4b2f      	ldr	r3, [pc, #188]	; (2b4c <TIM1_CC_handler+0x164>)
    2a90:	2295      	movs	r2, #149	; 0x95
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    2a92:	8008      	strh	r0, [r1, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    2a94:	801a      	strh	r2, [r3, #0]
		break;
    2a96:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2a98:	2a3b      	cmp	r2, #59	; 0x3b
    2a9a:	d10f      	bne.n	2abc <TIM1_CC_handler+0xd4>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    2a9c:	4b2c      	ldr	r3, [pc, #176]	; (2b50 <TIM1_CC_handler+0x168>)
    2a9e:	2201      	movs	r2, #1
    2aa0:	601a      	str	r2, [r3, #0]
		break;
    2aa2:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2aa4:	b952      	cbnz	r2, 2abc <TIM1_CC_handler+0xd4>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    2aa6:	4928      	ldr	r1, [pc, #160]	; (2b48 <TIM1_CC_handler+0x160>)
		*TIMER1_CCR1/=2;
    2aa8:	4a28      	ldr	r2, [pc, #160]	; (2b4c <TIM1_CC_handler+0x164>)
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    2aaa:	880b      	ldrh	r3, [r1, #0]
    2aac:	f3c3 034e 	ubfx	r3, r3, #1, #15
    2ab0:	800b      	strh	r3, [r1, #0]
		*TIMER1_CCR1/=2;
    2ab2:	8813      	ldrh	r3, [r2, #0]
    2ab4:	f3c3 034e 	ubfx	r3, r3, #1, #15
    2ab8:	8013      	strh	r3, [r2, #0]
		break;
    2aba:	4770      	bx	lr
		SPI2->DR=0xaaaa;
		while (SPI2->SR&SPI_SR_BSY);
		SPI2->CR1=SPI_PIXELS;
		SPI2->DR=0;
*/	
		if (video){
    2abc:	4a24      	ldr	r2, [pc, #144]	; (2b50 <TIM1_CC_handler+0x168>)
    2abe:	6812      	ldr	r2, [r2, #0]
    2ac0:	2a00      	cmp	r2, #0
    2ac2:	d0c1      	beq.n	2a48 <TIM1_CC_handler+0x60>
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2ac4:	681b      	ldr	r3, [r3, #0]
    2ac6:	4a23      	ldr	r2, [pc, #140]	; (2b54 <TIM1_CC_handler+0x16c>)
    2ac8:	3b3c      	subs	r3, #60	; 0x3c
    2aca:	491b      	ldr	r1, [pc, #108]	; (2b38 <TIM1_CC_handler+0x150>)
    2acc:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    2ad0:	eb02 03c3 	add.w	r3, r2, r3, lsl #3
			DMA1[DMACH5].cndtr=ROW_SIZE;
    2ad4:	2014      	movs	r0, #20
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    2ad6:	4a20      	ldr	r2, [pc, #128]	; (2b58 <TIM1_CC_handler+0x170>)
		SPI2->DR=0;
*/	
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2ad8:	60cb      	str	r3, [r1, #12]
			DMA1[DMACH5].cndtr=ROW_SIZE;
    2ada:	6048      	str	r0, [r1, #4]
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    2adc:	8813      	ldrh	r3, [r2, #0]
    2ade:	b29b      	uxth	r3, r3
    2ae0:	f5b3 6f83 	cmp.w	r3, #1048	; 0x418
    2ae4:	d804      	bhi.n	2af0 <TIM1_CC_handler+0x108>
    2ae6:	8813      	ldrh	r3, [r2, #0]
    2ae8:	b29b      	uxth	r3, r3
    2aea:	f5b3 6f83 	cmp.w	r3, #1048	; 0x418
    2aee:	d9fa      	bls.n	2ae6 <TIM1_CC_handler+0xfe>
			// réduction de la gigue vidéo
			asm volatile(
    2af0:	4b19      	ldr	r3, [pc, #100]	; (2b58 <TIM1_CC_handler+0x170>)
    2af2:	461b      	mov	r3, r3
    2af4:	681b      	ldr	r3, [r3, #0]
    2af6:	f003 0307 	and.w	r3, r3, #7
    2afa:	005b      	lsls	r3, r3, #1
    2afc:	449f      	add	pc, r3
    2afe:	bf00      	nop
    2b00:	bf00      	nop
    2b02:	bf00      	nop
    2b04:	bf00      	nop
    2b06:	bf00      	nop
    2b08:	bf00      	nop
    2b0a:	bf00      	nop
    2b0c:	bf00      	nop
			"nop\n\t"
			"nop\n\t"
			"nop\n\t"
			::"r" (TIMER1_CNT)
			);
			_enable_dma();
    2b0e:	4a0a      	ldr	r2, [pc, #40]	; (2b38 <TIM1_CC_handler+0x150>)
    2b10:	6813      	ldr	r3, [r2, #0]
    2b12:	f043 0301 	orr.w	r3, r3, #1
    2b16:	6013      	str	r3, [r2, #0]
    2b18:	4770      	bx	lr
		break;
	case TOP_LINE-1:
		video=1;
		break;
	case (TOP_LINE+VRES):
		video=0;
    2b1a:	4b0d      	ldr	r3, [pc, #52]	; (2b50 <TIM1_CC_handler+0x168>)
    2b1c:	2200      	movs	r2, #0
    2b1e:	601a      	str	r2, [r3, #0]
		break;
    2b20:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    2b22:	f240 7269 	movw	r2, #1897	; 0x769
    2b26:	4b09      	ldr	r3, [pc, #36]	; (2b4c <TIM1_CC_handler+0x164>)
    2b28:	801a      	strh	r2, [r3, #0]
	    break;
    2b2a:	4770      	bx	lr
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
    2b2c:	4b05      	ldr	r3, [pc, #20]	; (2b44 <TIM1_CC_handler+0x15c>)
    2b2e:	681b      	ldr	r3, [r3, #0]
    2b30:	2b00      	cmp	r3, #0
    2b32:	d189      	bne.n	2a48 <TIM1_CC_handler+0x60>
    2b34:	e794      	b.n	2a60 <TIM1_CC_handler+0x78>
    2b36:	bf00      	nop
    2b38:	40020058 	.word	0x40020058
    2b3c:	20000004 	.word	0x20000004
    2b40:	40012c10 	.word	0x40012c10
    2b44:	200000e8 	.word	0x200000e8
    2b48:	40012c2c 	.word	0x40012c2c
    2b4c:	40012c34 	.word	0x40012c34
    2b50:	200000e4 	.word	0x200000e4
    2b54:	20000130 	.word	0x20000130
    2b58:	40012c24 	.word	0x40012c24

00002b5c <DMA1CH5_handler>:
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
    2b5c:	b480      	push	{r7}
    2b5e:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    2b60:	4a0a      	ldr	r2, [pc, #40]	; (2b8c <DMA1CH5_handler+0x30>)
    2b62:	4b0a      	ldr	r3, [pc, #40]	; (2b8c <DMA1CH5_handler+0x30>)
    2b64:	685b      	ldr	r3, [r3, #4]
    2b66:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    2b6a:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    2b6c:	bf00      	nop
    2b6e:	4b08      	ldr	r3, [pc, #32]	; (2b90 <DMA1CH5_handler+0x34>)
    2b70:	891b      	ldrh	r3, [r3, #8]
    2b72:	b29b      	uxth	r3, r3
    2b74:	f003 0302 	and.w	r3, r3, #2
    2b78:	2b00      	cmp	r3, #0
    2b7a:	d0f8      	beq.n	2b6e <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    2b7c:	4b04      	ldr	r3, [pc, #16]	; (2b90 <DMA1CH5_handler+0x34>)
    2b7e:	2200      	movs	r2, #0
    2b80:	819a      	strh	r2, [r3, #12]
}
    2b82:	46bd      	mov	sp, r7
    2b84:	f85d 7b04 	ldr.w	r7, [sp], #4
    2b88:	4770      	bx	lr
    2b8a:	bf00      	nop
    2b8c:	40020000 	.word	0x40020000
    2b90:	40003800 	.word	0x40003800

00002b94 <usart_config_port>:

#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 

// configuration dse broches
void usart_config_port(usart_t* channel, gpio_t *port, unsigned flow_ctrl){
    2b94:	b480      	push	{r7}
    2b96:	b085      	sub	sp, #20
    2b98:	af00      	add	r7, sp, #0
    2b9a:	60f8      	str	r0, [r7, #12]
    2b9c:	60b9      	str	r1, [r7, #8]
    2b9e:	607a      	str	r2, [r7, #4]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    2ba0:	68fb      	ldr	r3, [r7, #12]
    2ba2:	4a45      	ldr	r2, [pc, #276]	; (2cb8 <usart_config_port+0x124>)
    2ba4:	4293      	cmp	r3, r2
    2ba6:	d058      	beq.n	2c5a <usart_config_port+0xc6>
    2ba8:	4a44      	ldr	r2, [pc, #272]	; (2cbc <usart_config_port+0x128>)
    2baa:	4293      	cmp	r3, r2
    2bac:	d003      	beq.n	2bb6 <usart_config_port+0x22>
    2bae:	4a44      	ldr	r2, [pc, #272]	; (2cc0 <usart_config_port+0x12c>)
    2bb0:	4293      	cmp	r3, r2
    2bb2:	d029      	beq.n	2c08 <usart_config_port+0x74>
    2bb4:	e07a      	b.n	2cac <usart_config_port+0x118>
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
    2bb6:	4a43      	ldr	r2, [pc, #268]	; (2cc4 <usart_config_port+0x130>)
    2bb8:	4b42      	ldr	r3, [pc, #264]	; (2cc4 <usart_config_port+0x130>)
    2bba:	699b      	ldr	r3, [r3, #24]
    2bbc:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    2bc0:	f043 0304 	orr.w	r3, r3, #4
    2bc4:	6193      	str	r3, [r2, #24]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    2bc6:	687b      	ldr	r3, [r7, #4]
    2bc8:	2b01      	cmp	r3, #1
    2bca:	d110      	bne.n	2bee <usart_config_port+0x5a>
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
    2bcc:	68bb      	ldr	r3, [r7, #8]
    2bce:	685b      	ldr	r3, [r3, #4]
    2bd0:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    2bd4:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    2bd8:	68ba      	ldr	r2, [r7, #8]
    2bda:	6053      	str	r3, [r2, #4]
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
    2bdc:	68bb      	ldr	r3, [r7, #8]
    2bde:	685b      	ldr	r3, [r3, #4]
    2be0:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    2be4:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    2be8:	68ba      	ldr	r2, [r7, #8]
    2bea:	6053      	str	r3, [r2, #4]
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
		}
		break;
    2bec:	e05e      	b.n	2cac <usart_config_port+0x118>
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
    2bee:	68bb      	ldr	r3, [r7, #8]
    2bf0:	685b      	ldr	r3, [r3, #4]
    2bf2:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
    2bf6:	68bb      	ldr	r3, [r7, #8]
    2bf8:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
    2bfa:	68bb      	ldr	r3, [r7, #8]
    2bfc:	685b      	ldr	r3, [r3, #4]
    2bfe:	f043 02a0 	orr.w	r2, r3, #160	; 0xa0
    2c02:	68bb      	ldr	r3, [r7, #8]
    2c04:	605a      	str	r2, [r3, #4]
		}
		break;
    2c06:	e051      	b.n	2cac <usart_config_port+0x118>
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    2c08:	4a2e      	ldr	r2, [pc, #184]	; (2cc4 <usart_config_port+0x130>)
    2c0a:	4b2e      	ldr	r3, [pc, #184]	; (2cc4 <usart_config_port+0x130>)
    2c0c:	69db      	ldr	r3, [r3, #28]
    2c0e:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    2c12:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    2c14:	4a2b      	ldr	r2, [pc, #172]	; (2cc4 <usart_config_port+0x130>)
    2c16:	4b2b      	ldr	r3, [pc, #172]	; (2cc4 <usart_config_port+0x130>)
    2c18:	699b      	ldr	r3, [r3, #24]
    2c1a:	f043 0304 	orr.w	r3, r3, #4
    2c1e:	6193      	str	r3, [r2, #24]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
    2c20:	687b      	ldr	r3, [r7, #4]
    2c22:	2b01      	cmp	r3, #1
    2c24:	d10c      	bne.n	2c40 <usart_config_port+0xac>
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
    2c26:	68bb      	ldr	r3, [r7, #8]
    2c28:	681b      	ldr	r3, [r3, #0]
    2c2a:	f423 627f 	bic.w	r2, r3, #4080	; 0xff0
    2c2e:	68bb      	ldr	r3, [r7, #8]
    2c30:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
    2c32:	68bb      	ldr	r3, [r7, #8]
    2c34:	681b      	ldr	r3, [r3, #0]
    2c36:	f443 622a 	orr.w	r2, r3, #2720	; 0xaa0
    2c3a:	68bb      	ldr	r3, [r7, #8]
    2c3c:	601a      	str	r2, [r3, #0]
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
		}
		break;
    2c3e:	e035      	b.n	2cac <usart_config_port+0x118>
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
    2c40:	68bb      	ldr	r3, [r7, #8]
    2c42:	681b      	ldr	r3, [r3, #0]
    2c44:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    2c48:	68bb      	ldr	r3, [r7, #8]
    2c4a:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
    2c4c:	68bb      	ldr	r3, [r7, #8]
    2c4e:	681b      	ldr	r3, [r3, #0]
    2c50:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    2c54:	68bb      	ldr	r3, [r7, #8]
    2c56:	601a      	str	r2, [r3, #0]
		}
		break;
    2c58:	e028      	b.n	2cac <usart_config_port+0x118>
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
    2c5a:	4a1a      	ldr	r2, [pc, #104]	; (2cc4 <usart_config_port+0x130>)
    2c5c:	4b19      	ldr	r3, [pc, #100]	; (2cc4 <usart_config_port+0x130>)
    2c5e:	69db      	ldr	r3, [r3, #28]
    2c60:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    2c64:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    2c66:	4a17      	ldr	r2, [pc, #92]	; (2cc4 <usart_config_port+0x130>)
    2c68:	4b16      	ldr	r3, [pc, #88]	; (2cc4 <usart_config_port+0x130>)
    2c6a:	699b      	ldr	r3, [r3, #24]
    2c6c:	f043 0308 	orr.w	r3, r3, #8
    2c70:	6193      	str	r3, [r2, #24]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    2c72:	687b      	ldr	r3, [r7, #4]
    2c74:	2b01      	cmp	r3, #1
    2c76:	d10c      	bne.n	2c92 <usart_config_port+0xfe>
			port->CR[1]&=~((15<<((USART3_TX_PIN-8)*4))|(15<<((USART3_RTS_PIN-8)*4)));
    2c78:	68bb      	ldr	r3, [r7, #8]
    2c7a:	685b      	ldr	r3, [r3, #4]
    2c7c:	f023 220f 	bic.w	r2, r3, #251662080	; 0xf000f00
    2c80:	68bb      	ldr	r3, [r7, #8]
    2c82:	605a      	str	r2, [r3, #4]
			port->CR[1]|=(0xA<<((USART3_TX_PIN-8)*4))|(0xA<<((USART3_RTS_PIN-8)*4));
    2c84:	68bb      	ldr	r3, [r7, #8]
    2c86:	685b      	ldr	r3, [r3, #4]
    2c88:	f043 220a 	orr.w	r2, r3, #167774720	; 0xa000a00
    2c8c:	68bb      	ldr	r3, [r7, #8]
    2c8e:	605a      	str	r2, [r3, #4]
    2c90:	e00b      	b.n	2caa <usart_config_port+0x116>
		}else{
			port->CR[1]&=~(15<<((USART3_TX_PIN-8)*4));
    2c92:	68bb      	ldr	r3, [r7, #8]
    2c94:	685b      	ldr	r3, [r3, #4]
    2c96:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    2c9a:	68bb      	ldr	r3, [r7, #8]
    2c9c:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART3_TX_PIN-8)*4);
    2c9e:	68bb      	ldr	r3, [r7, #8]
    2ca0:	685b      	ldr	r3, [r3, #4]
    2ca2:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    2ca6:	68bb      	ldr	r3, [r7, #8]
    2ca8:	605a      	str	r2, [r3, #4]
		}
		break;
    2caa:	bf00      	nop
	}
}
    2cac:	3714      	adds	r7, #20
    2cae:	46bd      	mov	sp, r7
    2cb0:	f85d 7b04 	ldr.w	r7, [sp], #4
    2cb4:	4770      	bx	lr
    2cb6:	bf00      	nop
    2cb8:	40004800 	.word	0x40004800
    2cbc:	40013800 	.word	0x40013800
    2cc0:	40004400 	.word	0x40004400
    2cc4:	40021000 	.word	0x40021000

00002cc8 <usart_set_baud>:

// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
    2cc8:	b480      	push	{r7}
    2cca:	b085      	sub	sp, #20
    2ccc:	af00      	add	r7, sp, #0
    2cce:	6078      	str	r0, [r7, #4]
    2cd0:	6039      	str	r1, [r7, #0]
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
    2cd2:	687b      	ldr	r3, [r7, #4]
    2cd4:	4a14      	ldr	r2, [pc, #80]	; (2d28 <usart_set_baud+0x60>)
    2cd6:	4293      	cmp	r3, r2
    2cd8:	d10f      	bne.n	2cfa <usart_set_baud+0x32>
		rate=(FAPB2/baud/16)<<4;
    2cda:	4a14      	ldr	r2, [pc, #80]	; (2d2c <usart_set_baud+0x64>)
    2cdc:	683b      	ldr	r3, [r7, #0]
    2cde:	fbb2 f3f3 	udiv	r3, r2, r3
    2ce2:	011b      	lsls	r3, r3, #4
    2ce4:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    2ce6:	4a12      	ldr	r2, [pc, #72]	; (2d30 <usart_set_baud+0x68>)
    2ce8:	683b      	ldr	r3, [r7, #0]
    2cea:	fbb2 f3f3 	udiv	r3, r2, r3
    2cee:	f003 030f 	and.w	r3, r3, #15
    2cf2:	68fa      	ldr	r2, [r7, #12]
    2cf4:	4313      	orrs	r3, r2
    2cf6:	60fb      	str	r3, [r7, #12]
    2cf8:	e00e      	b.n	2d18 <usart_set_baud+0x50>
	}else{
		rate=(FAPB1/baud/16)<<4;
    2cfa:	4a0e      	ldr	r2, [pc, #56]	; (2d34 <usart_set_baud+0x6c>)
    2cfc:	683b      	ldr	r3, [r7, #0]
    2cfe:	fbb2 f3f3 	udiv	r3, r2, r3
    2d02:	011b      	lsls	r3, r3, #4
    2d04:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    2d06:	4a0c      	ldr	r2, [pc, #48]	; (2d38 <usart_set_baud+0x70>)
    2d08:	683b      	ldr	r3, [r7, #0]
    2d0a:	fbb2 f3f3 	udiv	r3, r2, r3
    2d0e:	f003 030f 	and.w	r3, r3, #15
    2d12:	68fa      	ldr	r2, [r7, #12]
    2d14:	4313      	orrs	r3, r2
    2d16:	60fb      	str	r3, [r7, #12]
	}
	channel->BRR=rate;
    2d18:	687b      	ldr	r3, [r7, #4]
    2d1a:	68fa      	ldr	r2, [r7, #12]
    2d1c:	609a      	str	r2, [r3, #8]
}
    2d1e:	3714      	adds	r7, #20
    2d20:	46bd      	mov	sp, r7
    2d22:	f85d 7b04 	ldr.w	r7, [sp], #4
    2d26:	4770      	bx	lr
    2d28:	40013800 	.word	0x40013800
    2d2c:	003d0900 	.word	0x003d0900
    2d30:	03d09000 	.word	0x03d09000
    2d34:	001e8480 	.word	0x001e8480
    2d38:	01e84800 	.word	0x01e84800

00002d3c <usart_comm_dir>:

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
    2d3c:	b480      	push	{r7}
    2d3e:	b083      	sub	sp, #12
    2d40:	af00      	add	r7, sp, #0
    2d42:	6078      	str	r0, [r7, #4]
    2d44:	6039      	str	r1, [r7, #0]
	channel->CR1&=USART_CR1_DIR_MASK;
    2d46:	687b      	ldr	r3, [r7, #4]
    2d48:	68db      	ldr	r3, [r3, #12]
    2d4a:	f023 020c 	bic.w	r2, r3, #12
    2d4e:	687b      	ldr	r3, [r7, #4]
    2d50:	60da      	str	r2, [r3, #12]
	channel->CR1|=direction<<USART_CR1_DIR_POS;
    2d52:	687b      	ldr	r3, [r7, #4]
    2d54:	68da      	ldr	r2, [r3, #12]
    2d56:	683b      	ldr	r3, [r7, #0]
    2d58:	009b      	lsls	r3, r3, #2
    2d5a:	431a      	orrs	r2, r3
    2d5c:	687b      	ldr	r3, [r7, #4]
    2d5e:	60da      	str	r2, [r3, #12]
}
    2d60:	370c      	adds	r7, #12
    2d62:	46bd      	mov	sp, r7
    2d64:	f85d 7b04 	ldr.w	r7, [sp], #4
    2d68:	4770      	bx	lr
    2d6a:	bf00      	nop

00002d6c <usart_open_channel>:


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
    2d6c:	b580      	push	{r7, lr}
    2d6e:	b084      	sub	sp, #16
    2d70:	af00      	add	r7, sp, #0
    2d72:	60f8      	str	r0, [r7, #12]
    2d74:	60b9      	str	r1, [r7, #8]
    2d76:	607a      	str	r2, [r7, #4]
    2d78:	603b      	str	r3, [r7, #0]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    2d7a:	68fb      	ldr	r3, [r7, #12]
    2d7c:	4a32      	ldr	r2, [pc, #200]	; (2e48 <usart_open_channel+0xdc>)
    2d7e:	4293      	cmp	r3, r2
    2d80:	d020      	beq.n	2dc4 <usart_open_channel+0x58>
    2d82:	4a32      	ldr	r2, [pc, #200]	; (2e4c <usart_open_channel+0xe0>)
    2d84:	4293      	cmp	r3, r2
    2d86:	d003      	beq.n	2d90 <usart_open_channel+0x24>
    2d88:	4a31      	ldr	r2, [pc, #196]	; (2e50 <usart_open_channel+0xe4>)
    2d8a:	4293      	cmp	r3, r2
    2d8c:	d00d      	beq.n	2daa <usart_open_channel+0x3e>
    2d8e:	e026      	b.n	2dde <usart_open_channel+0x72>
	case (uint32_t)USART1:
		usart_config_port(channel,USART1_PORT,flow_ctrl);
    2d90:	68f8      	ldr	r0, [r7, #12]
    2d92:	4930      	ldr	r1, [pc, #192]	; (2e54 <usart_open_channel+0xe8>)
    2d94:	69ba      	ldr	r2, [r7, #24]
    2d96:	f7ff fefd 	bl	2b94 <usart_config_port>
		set_int_priority(IRQ_USART1,7);
    2d9a:	2025      	movs	r0, #37	; 0x25
    2d9c:	2107      	movs	r1, #7
    2d9e:	f7ff fb89 	bl	24b4 <set_int_priority>
		enable_interrupt(IRQ_USART1);
    2da2:	2025      	movs	r0, #37	; 0x25
    2da4:	f7ff faca 	bl	233c <enable_interrupt>
		break;
    2da8:	e019      	b.n	2dde <usart_open_channel+0x72>
	case (uint32_t)USART2:
		usart_config_port(channel,USART2_PORT,flow_ctrl);
    2daa:	68f8      	ldr	r0, [r7, #12]
    2dac:	4929      	ldr	r1, [pc, #164]	; (2e54 <usart_open_channel+0xe8>)
    2dae:	69ba      	ldr	r2, [r7, #24]
    2db0:	f7ff fef0 	bl	2b94 <usart_config_port>
		set_int_priority(IRQ_USART2,7);
    2db4:	2026      	movs	r0, #38	; 0x26
    2db6:	2107      	movs	r1, #7
    2db8:	f7ff fb7c 	bl	24b4 <set_int_priority>
		enable_interrupt(IRQ_USART2);
    2dbc:	2026      	movs	r0, #38	; 0x26
    2dbe:	f7ff fabd 	bl	233c <enable_interrupt>
		break;
    2dc2:	e00c      	b.n	2dde <usart_open_channel+0x72>
	case (uint32_t)USART3:
		usart_config_port(channel,USART3_PORT,flow_ctrl);
    2dc4:	68f8      	ldr	r0, [r7, #12]
    2dc6:	4924      	ldr	r1, [pc, #144]	; (2e58 <usart_open_channel+0xec>)
    2dc8:	69ba      	ldr	r2, [r7, #24]
    2dca:	f7ff fee3 	bl	2b94 <usart_config_port>
		set_int_priority(IRQ_USART3,7);
    2dce:	2027      	movs	r0, #39	; 0x27
    2dd0:	2107      	movs	r1, #7
    2dd2:	f7ff fb6f 	bl	24b4 <set_int_priority>
		enable_interrupt(IRQ_USART3);
    2dd6:	2027      	movs	r0, #39	; 0x27
    2dd8:	f7ff fab0 	bl	233c <enable_interrupt>
		break;
    2ddc:	bf00      	nop
	}
	if (flow_ctrl==FLOW_HARD){
    2dde:	69bb      	ldr	r3, [r7, #24]
    2de0:	2b01      	cmp	r3, #1
    2de2:	d103      	bne.n	2dec <usart_open_channel+0x80>
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    2de4:	68fb      	ldr	r3, [r7, #12]
    2de6:	f44f 7240 	mov.w	r2, #768	; 0x300
    2dea:	615a      	str	r2, [r3, #20]
	}
	usart_comm_dir(channel,dir);
    2dec:	68f8      	ldr	r0, [r7, #12]
    2dee:	6839      	ldr	r1, [r7, #0]
    2df0:	f7ff ffa4 	bl	2d3c <usart_comm_dir>
	switch (parity){
    2df4:	687b      	ldr	r3, [r7, #4]
    2df6:	2b01      	cmp	r3, #1
    2df8:	d00b      	beq.n	2e12 <usart_open_channel+0xa6>
    2dfa:	2b01      	cmp	r3, #1
    2dfc:	d302      	bcc.n	2e04 <usart_open_channel+0x98>
    2dfe:	2b02      	cmp	r3, #2
    2e00:	d00e      	beq.n	2e20 <usart_open_channel+0xb4>
    2e02:	e014      	b.n	2e2e <usart_open_channel+0xc2>
	case PARITY_NONE:
		channel->CR1|=USART_CR1_RXNEIE;
    2e04:	68fb      	ldr	r3, [r7, #12]
    2e06:	68db      	ldr	r3, [r3, #12]
    2e08:	f043 0220 	orr.w	r2, r3, #32
    2e0c:	68fb      	ldr	r3, [r7, #12]
    2e0e:	60da      	str	r2, [r3, #12]
		break;
    2e10:	e00d      	b.n	2e2e <usart_open_channel+0xc2>
	case PARITY_ODD:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS|USART_CR1_RXNEIE;
    2e12:	68fb      	ldr	r3, [r7, #12]
    2e14:	68db      	ldr	r3, [r3, #12]
    2e16:	f443 62e4 	orr.w	r2, r3, #1824	; 0x720
    2e1a:	68fb      	ldr	r3, [r7, #12]
    2e1c:	60da      	str	r2, [r3, #12]
		break;
    2e1e:	e006      	b.n	2e2e <usart_open_channel+0xc2>
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_RXNEIE;
    2e20:	68fb      	ldr	r3, [r7, #12]
    2e22:	68db      	ldr	r3, [r3, #12]
    2e24:	f443 62a4 	orr.w	r2, r3, #1312	; 0x520
    2e28:	68fb      	ldr	r3, [r7, #12]
    2e2a:	60da      	str	r2, [r3, #12]
		break;
    2e2c:	bf00      	nop
    }
	usart_set_baud(channel,baud);
    2e2e:	68f8      	ldr	r0, [r7, #12]
    2e30:	68b9      	ldr	r1, [r7, #8]
    2e32:	f7ff ff49 	bl	2cc8 <usart_set_baud>
    channel->CR1|=USART_CR1_UE;
    2e36:	68fb      	ldr	r3, [r7, #12]
    2e38:	68db      	ldr	r3, [r3, #12]
    2e3a:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
    2e3e:	68fb      	ldr	r3, [r7, #12]
    2e40:	60da      	str	r2, [r3, #12]
}
    2e42:	3710      	adds	r7, #16
    2e44:	46bd      	mov	sp, r7
    2e46:	bd80      	pop	{r7, pc}
    2e48:	40004800 	.word	0x40004800
    2e4c:	40013800 	.word	0x40013800
    2e50:	40004400 	.word	0x40004400
    2e54:	40010800 	.word	0x40010800
    2e58:	40010c00 	.word	0x40010c00

00002e5c <usart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
    2e5c:	b480      	push	{r7}
    2e5e:	b083      	sub	sp, #12
    2e60:	af00      	add	r7, sp, #0
    2e62:	6078      	str	r0, [r7, #4]
	return channel->SR&USART_SR_RXNE;
    2e64:	687b      	ldr	r3, [r7, #4]
    2e66:	681b      	ldr	r3, [r3, #0]
    2e68:	f003 0320 	and.w	r3, r3, #32
}
    2e6c:	4618      	mov	r0, r3
    2e6e:	370c      	adds	r7, #12
    2e70:	46bd      	mov	sp, r7
    2e72:	f85d 7b04 	ldr.w	r7, [sp], #4
    2e76:	4770      	bx	lr

00002e78 <usart_getc>:

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
    2e78:	b480      	push	{r7}
    2e7a:	b083      	sub	sp, #12
    2e7c:	af00      	add	r7, sp, #0
    2e7e:	6078      	str	r0, [r7, #4]
	return channel->DR;
    2e80:	687b      	ldr	r3, [r7, #4]
    2e82:	685b      	ldr	r3, [r3, #4]
    2e84:	b2db      	uxtb	r3, r3
}
    2e86:	4618      	mov	r0, r3
    2e88:	370c      	adds	r7, #12
    2e8a:	46bd      	mov	sp, r7
    2e8c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2e90:	4770      	bx	lr
    2e92:	bf00      	nop

00002e94 <usart_putc>:

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
    2e94:	b480      	push	{r7}
    2e96:	b083      	sub	sp, #12
    2e98:	af00      	add	r7, sp, #0
    2e9a:	6078      	str	r0, [r7, #4]
    2e9c:	460b      	mov	r3, r1
    2e9e:	70fb      	strb	r3, [r7, #3]
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
    2ea0:	bf00      	nop
    2ea2:	687b      	ldr	r3, [r7, #4]
    2ea4:	681b      	ldr	r3, [r3, #0]
    2ea6:	f003 0380 	and.w	r3, r3, #128	; 0x80
    2eaa:	2b00      	cmp	r3, #0
    2eac:	d0f9      	beq.n	2ea2 <usart_putc+0xe>
	channel->DR=c;
    2eae:	78fa      	ldrb	r2, [r7, #3]
    2eb0:	687b      	ldr	r3, [r7, #4]
    2eb2:	605a      	str	r2, [r3, #4]
}
    2eb4:	370c      	adds	r7, #12
    2eb6:	46bd      	mov	sp, r7
    2eb8:	f85d 7b04 	ldr.w	r7, [sp], #4
    2ebc:	4770      	bx	lr
    2ebe:	bf00      	nop

00002ec0 <usart_cts>:


int usart_cts(usart_t* channel){
    2ec0:	b480      	push	{r7}
    2ec2:	b085      	sub	sp, #20
    2ec4:	af00      	add	r7, sp, #0
    2ec6:	6078      	str	r0, [r7, #4]
	int cts;
	switch ((uint32_t)channel){
    2ec8:	687b      	ldr	r3, [r7, #4]
    2eca:	4a11      	ldr	r2, [pc, #68]	; (2f10 <usart_cts+0x50>)
    2ecc:	4293      	cmp	r3, r2
    2ece:	d012      	beq.n	2ef6 <usart_cts+0x36>
    2ed0:	4a10      	ldr	r2, [pc, #64]	; (2f14 <usart_cts+0x54>)
    2ed2:	4293      	cmp	r3, r2
    2ed4:	d003      	beq.n	2ede <usart_cts+0x1e>
    2ed6:	4a10      	ldr	r2, [pc, #64]	; (2f18 <usart_cts+0x58>)
    2ed8:	4293      	cmp	r3, r2
    2eda:	d006      	beq.n	2eea <usart_cts+0x2a>
    2edc:	e011      	b.n	2f02 <usart_cts+0x42>
		case (uint32_t)USART1:
			cts=USART1_PORT->IDR&USART1_CTS_BIT;
    2ede:	4b0f      	ldr	r3, [pc, #60]	; (2f1c <usart_cts+0x5c>)
    2ee0:	689b      	ldr	r3, [r3, #8]
    2ee2:	f403 6300 	and.w	r3, r3, #2048	; 0x800
    2ee6:	60fb      	str	r3, [r7, #12]
			break;
    2ee8:	e00b      	b.n	2f02 <usart_cts+0x42>
		case (uint32_t)USART2:
			cts=USART2_PORT->IDR&USART2_CTS_BIT;
    2eea:	4b0c      	ldr	r3, [pc, #48]	; (2f1c <usart_cts+0x5c>)
    2eec:	689b      	ldr	r3, [r3, #8]
    2eee:	f003 0301 	and.w	r3, r3, #1
    2ef2:	60fb      	str	r3, [r7, #12]
			break;
    2ef4:	e005      	b.n	2f02 <usart_cts+0x42>
		case (uint32_t)USART3:
			cts=USART3_PORT->IDR&USART3_CTS_BIT;
    2ef6:	4b0a      	ldr	r3, [pc, #40]	; (2f20 <usart_cts+0x60>)
    2ef8:	689b      	ldr	r3, [r3, #8]
    2efa:	f403 5300 	and.w	r3, r3, #8192	; 0x2000
    2efe:	60fb      	str	r3, [r7, #12]
			break;
    2f00:	bf00      	nop
	}
	return cts;
    2f02:	68fb      	ldr	r3, [r7, #12]
}
    2f04:	4618      	mov	r0, r3
    2f06:	3714      	adds	r7, #20
    2f08:	46bd      	mov	sp, r7
    2f0a:	f85d 7b04 	ldr.w	r7, [sp], #4
    2f0e:	4770      	bx	lr
    2f10:	40004800 	.word	0x40004800
    2f14:	40013800 	.word	0x40013800
    2f18:	40004400 	.word	0x40004400
    2f1c:	40010800 	.word	0x40010800
    2f20:	40010c00 	.word	0x40010c00

00002f24 <vt_init>:

#include "../include/blue_pill.h"
#include "vt100.h"
#include "console.h"

void vt_init(){
    2f24:	b580      	push	{r7, lr}
    2f26:	b082      	sub	sp, #8
    2f28:	af02      	add	r7, sp, #8
	usart_open_channel(VT_USART,115200,PARITY_NONE,USART_DIR_BIDI,FLOW_HARD);
    2f2a:	2301      	movs	r3, #1
    2f2c:	9300      	str	r3, [sp, #0]
    2f2e:	4804      	ldr	r0, [pc, #16]	; (2f40 <vt_init+0x1c>)
    2f30:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
    2f34:	2200      	movs	r2, #0
    2f36:	2303      	movs	r3, #3
    2f38:	f7ff ff18 	bl	2d6c <usart_open_channel>
}
    2f3c:	46bd      	mov	sp, r7
    2f3e:	bd80      	pop	{r7, pc}
    2f40:	40004400 	.word	0x40004400

00002f44 <vt_putc>:

void vt_putc(char c){
    2f44:	b580      	push	{r7, lr}
    2f46:	b082      	sub	sp, #8
    2f48:	af00      	add	r7, sp, #0
    2f4a:	4603      	mov	r3, r0
    2f4c:	71fb      	strb	r3, [r7, #7]
	usart_putc(VT_USART,c);
    2f4e:	79fb      	ldrb	r3, [r7, #7]
    2f50:	4803      	ldr	r0, [pc, #12]	; (2f60 <vt_putc+0x1c>)
    2f52:	4619      	mov	r1, r3
    2f54:	f7ff ff9e 	bl	2e94 <usart_putc>
}
    2f58:	3708      	adds	r7, #8
    2f5a:	46bd      	mov	sp, r7
    2f5c:	bd80      	pop	{r7, pc}
    2f5e:	bf00      	nop
    2f60:	40004400 	.word	0x40004400

00002f64 <vt_del_back>:

void vt_del_back(){
    2f64:	b580      	push	{r7, lr}
    2f66:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,BS);
    2f68:	4806      	ldr	r0, [pc, #24]	; (2f84 <vt_del_back+0x20>)
    2f6a:	2108      	movs	r1, #8
    2f6c:	f7ff ff92 	bl	2e94 <usart_putc>
	usart_putc(VT_USART,SPACE);
    2f70:	4804      	ldr	r0, [pc, #16]	; (2f84 <vt_del_back+0x20>)
    2f72:	2120      	movs	r1, #32
    2f74:	f7ff ff8e 	bl	2e94 <usart_putc>
	usart_putc(VT_USART,BS);
    2f78:	4802      	ldr	r0, [pc, #8]	; (2f84 <vt_del_back+0x20>)
    2f7a:	2108      	movs	r1, #8
    2f7c:	f7ff ff8a 	bl	2e94 <usart_putc>
}
    2f80:	bd80      	pop	{r7, pc}
    2f82:	bf00      	nop
    2f84:	40004400 	.word	0x40004400

00002f88 <vt_esc_seq>:

static void vt_esc_seq(){
    2f88:	b580      	push	{r7, lr}
    2f8a:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,ESC);
    2f8c:	4804      	ldr	r0, [pc, #16]	; (2fa0 <vt_esc_seq+0x18>)
    2f8e:	211b      	movs	r1, #27
    2f90:	f7ff ff80 	bl	2e94 <usart_putc>
	usart_putc(VT_USART,'[');
    2f94:	4802      	ldr	r0, [pc, #8]	; (2fa0 <vt_esc_seq+0x18>)
    2f96:	215b      	movs	r1, #91	; 0x5b
    2f98:	f7ff ff7c 	bl	2e94 <usart_putc>
}
    2f9c:	bd80      	pop	{r7, pc}
    2f9e:	bf00      	nop
    2fa0:	40004400 	.word	0x40004400

00002fa4 <vt_cls>:


// vide l'écran de la console
void vt_cls(){
    2fa4:	b580      	push	{r7, lr}
    2fa6:	af00      	add	r7, sp, #0
	vt_esc_seq();
    2fa8:	f7ff ffee 	bl	2f88 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    2fac:	4804      	ldr	r0, [pc, #16]	; (2fc0 <vt_cls+0x1c>)
    2fae:	2132      	movs	r1, #50	; 0x32
    2fb0:	f7ff ff70 	bl	2e94 <usart_putc>
	usart_putc(VT_USART,'J');
    2fb4:	4802      	ldr	r0, [pc, #8]	; (2fc0 <vt_cls+0x1c>)
    2fb6:	214a      	movs	r1, #74	; 0x4a
    2fb8:	f7ff ff6c 	bl	2e94 <usart_putc>
}
    2fbc:	bd80      	pop	{r7, pc}
    2fbe:	bf00      	nop
    2fc0:	40004400 	.word	0x40004400

00002fc4 <vt_clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void vt_clear_line(unsigned n){
    2fc4:	b580      	push	{r7, lr}
    2fc6:	b082      	sub	sp, #8
    2fc8:	af00      	add	r7, sp, #0
    2fca:	6078      	str	r0, [r7, #4]
	vt_esc_seq();
    2fcc:	f7ff ffdc 	bl	2f88 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    2fd0:	480a      	ldr	r0, [pc, #40]	; (2ffc <vt_clear_line+0x38>)
    2fd2:	2132      	movs	r1, #50	; 0x32
    2fd4:	f7ff ff5e 	bl	2e94 <usart_putc>
	usart_putc(VT_USART,'K');
    2fd8:	4808      	ldr	r0, [pc, #32]	; (2ffc <vt_clear_line+0x38>)
    2fda:	214b      	movs	r1, #75	; 0x4b
    2fdc:	f7ff ff5a 	bl	2e94 <usart_putc>
	while (n){usart_putc(VT_USART,BS);n--;}
    2fe0:	e006      	b.n	2ff0 <vt_clear_line+0x2c>
    2fe2:	4806      	ldr	r0, [pc, #24]	; (2ffc <vt_clear_line+0x38>)
    2fe4:	2108      	movs	r1, #8
    2fe6:	f7ff ff55 	bl	2e94 <usart_putc>
    2fea:	687b      	ldr	r3, [r7, #4]
    2fec:	3b01      	subs	r3, #1
    2fee:	607b      	str	r3, [r7, #4]
    2ff0:	687b      	ldr	r3, [r7, #4]
    2ff2:	2b00      	cmp	r3, #0
    2ff4:	d1f5      	bne.n	2fe2 <vt_clear_line+0x1e>
}
    2ff6:	3708      	adds	r7, #8
    2ff8:	46bd      	mov	sp, r7
    2ffa:	bd80      	pop	{r7, pc}
    2ffc:	40004400 	.word	0x40004400

00003000 <vt_ready>:

// vérifie si le terminal est prêt
int vt_ready(){
    3000:	b480      	push	{r7}
    3002:	af00      	add	r7, sp, #0
	return !(VT_PORT->IDR&VT_CTS_BIT);
    3004:	4b06      	ldr	r3, [pc, #24]	; (3020 <vt_ready+0x20>)
    3006:	689b      	ldr	r3, [r3, #8]
    3008:	f003 0301 	and.w	r3, r3, #1
    300c:	2b00      	cmp	r3, #0
    300e:	bf0c      	ite	eq
    3010:	2301      	moveq	r3, #1
    3012:	2300      	movne	r3, #0
    3014:	b2db      	uxtb	r3, r3
}
    3016:	4618      	mov	r0, r3
    3018:	46bd      	mov	sp, r7
    301a:	f85d 7b04 	ldr.w	r7, [sp], #4
    301e:	4770      	bx	lr
    3020:	40010800 	.word	0x40010800

00003024 <USART2_handler>:

// interruption serial console
void VT_handler(){
    3024:	b580      	push	{r7, lr}
    3026:	af00      	add	r7, sp, #0
	if ((con.dev==SERIAL) && (VT_USART->SR&USART_SR_RXNE)){
    3028:	4b08      	ldr	r3, [pc, #32]	; (304c <USART2_handler+0x28>)
    302a:	781b      	ldrb	r3, [r3, #0]
    302c:	2b01      	cmp	r3, #1
    302e:	d10c      	bne.n	304a <USART2_handler+0x26>
    3030:	4b07      	ldr	r3, [pc, #28]	; (3050 <USART2_handler+0x2c>)
    3032:	681b      	ldr	r3, [r3, #0]
    3034:	f003 0320 	and.w	r3, r3, #32
    3038:	2b00      	cmp	r3, #0
    303a:	d006      	beq.n	304a <USART2_handler+0x26>
		con.insert(VT_USART->DR);
    303c:	4b03      	ldr	r3, [pc, #12]	; (304c <USART2_handler+0x28>)
    303e:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    3040:	4a03      	ldr	r2, [pc, #12]	; (3050 <USART2_handler+0x2c>)
    3042:	6852      	ldr	r2, [r2, #4]
    3044:	b2d2      	uxtb	r2, r2
    3046:	4610      	mov	r0, r2
    3048:	4798      	blx	r3
	}
}
    304a:	bd80      	pop	{r7, pc}
    304c:	200000f0 	.word	0x200000f0
    3050:	40004400 	.word	0x40004400

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
	
	_svc_call(SVC_PRINT,"blinking led, any key to stop.\n",0);
    3810:	4b1e      	ldr	r3, [pc, #120]	; (388c <blink+0x8c>)
    3812:	2200      	movs	r2, #0
    3814:	4618      	mov	r0, r3
    3816:	4611      	mov	r1, r2
    3818:	df08      	svc	8
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    381a:	2300      	movs	r3, #0
    381c:	2200      	movs	r2, #0
    381e:	4618      	mov	r0, r3
    3820:	4611      	mov	r1, r2
    3822:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    3824:	f107 030c 	add.w	r3, r7, #12
    3828:	2200      	movs	r2, #0
    382a:	4618      	mov	r0, r3
    382c:	4611      	mov	r1, r2
    382e:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    3830:	f107 0308 	add.w	r3, r7, #8
    3834:	2200      	movs	r2, #0
    3836:	4618      	mov	r0, r3
    3838:	4611      	mov	r1, r2
    383a:	df04      	svc	4
    383c:	68bb      	ldr	r3, [r7, #8]
    383e:	2b00      	cmp	r3, #0
    3840:	d1f6      	bne.n	3830 <blink+0x30>
		_svc_call(SVC_LED_ON,NUL,NUL);
    3842:	2300      	movs	r3, #0
    3844:	2200      	movs	r2, #0
    3846:	4618      	mov	r0, r3
    3848:	4611      	mov	r1, r2
    384a:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    384c:	f107 030c 	add.w	r3, r7, #12
    3850:	2200      	movs	r2, #0
    3852:	4618      	mov	r0, r3
    3854:	4611      	mov	r1, r2
    3856:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    3858:	f107 0308 	add.w	r3, r7, #8
    385c:	2200      	movs	r2, #0
    385e:	4618      	mov	r0, r3
    3860:	4611      	mov	r1, r2
    3862:	df04      	svc	4
    3864:	68bb      	ldr	r3, [r7, #8]
    3866:	2b00      	cmp	r3, #0
    3868:	d1f6      	bne.n	3858 <blink+0x58>
		_svc_call(SVC_CONIN,&c,NUL);
    386a:	1dfb      	adds	r3, r7, #7
    386c:	2200      	movs	r2, #0
    386e:	4618      	mov	r0, r3
    3870:	4611      	mov	r1, r2
    3872:	df05      	svc	5
		if (c) break;
    3874:	79fb      	ldrb	r3, [r7, #7]
    3876:	b2db      	uxtb	r3, r3
    3878:	2b00      	cmp	r3, #0
    387a:	d000      	beq.n	387e <blink+0x7e>
    387c:	e000      	b.n	3880 <blink+0x80>
	}
    387e:	e7cc      	b.n	381a <blink+0x1a>
}
    3880:	3714      	adds	r7, #20
    3882:	46bd      	mov	sp, r7
    3884:	f85d 7b04 	ldr.w	r7, [sp], #4
    3888:	4770      	bx	lr
    388a:	bf00      	nop
    388c:	000031ec 	.word	0x000031ec
