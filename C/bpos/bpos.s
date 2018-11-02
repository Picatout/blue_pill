
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 01 1a 00 00     i...m...q.......
      20:	01 1a 00 00 01 1a 00 00 01 1a 00 00 ad 05 00 00     ................
      30:	01 1a 00 00 01 1a 00 00 79 02 00 00 51 07 00 00     ........y...Q...
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 01 1a 00 00 01 1a 00 00 01 1a 00 00     ................
      80:	01 1a 00 00 01 1a 00 00 01 1a 00 00 01 1a 00 00     ................
      90:	01 1a 00 00 01 1a 00 00 01 1a 00 00 01 1a 00 00     ................
      a0:	01 1a 00 00 01 1a 00 00 01 1a 00 00 59 1c 00 00     ............Y...
      b0:	01 1a 00 00 01 1a 00 00 01 1a 00 00 01 1a 00 00     ................
      c0:	01 1a 00 00 01 1a 00 00 01 1a 00 00 01 1a 00 00     ................
      d0:	01 1a 00 00 b9 02 00 00 3d 10 00 00 c1 02 00 00     ........=.......
      e0:	01 1a 00 00 01 1a 00 00 01 1a 00 00 01 1a 00 00     ................
      f0:	01 1a 00 00 01 1a 00 00 01 1a 00 00 01 1a 00 00     ................
     100:	01 1a 00 00 01 1a 00 00 01 1a 00 00 01 1a 00 00     ................
     110:	01 1a 00 00 01 1a 00 00 01 1a 00 00 01 1a 00 00     ................
     120:	01 1a 00 00 01 1a 00 00 01 1a 00 00 01 1a 00 00     ................

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
     1b0:	f000 fede 	bl	f70 <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	2000000c 	.word	0x2000000c
     1c0:	20000a88 	.word	0x20000a88
     1c4:	000025e0 	.word	0x000025e0
     1c8:	20000000 	.word	0x20000000
     1cc:	2000000c 	.word	0x2000000c
     1d0:	20000aa0 	.word	0x20000aa0
     1d4:	20000124 	.word	0x20000124
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
     208:	f001 fc02 	bl	1a10 <print_fault>
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
     21e:	f001 fbf7 	bl	1a10 <print_fault>
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
     234:	f001 fbec 	bl	1a10 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f001 fbe7 	bl	1a10 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	00002508 	.word	0x00002508
     258:	00002520 	.word	0x00002520
     25c:	0000252c 	.word	0x0000252c
     260:	0000253c 	.word	0x0000253c

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f001 fbcc 	bl	1a00 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f001 fbca 	bl	1a00 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f001 fbc8 	bl	1a00 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f001 fbc6 	bl	1a00 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f001 fbc4 	bl	1a00 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f001 fbc2 	bl	1a00 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f001 fbc0 	bl	1a00 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f001 fbbe 	bl	1a00 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f001 fbbc 	bl	1a00 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f001 fbba 	bl	1a00 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f001 fbb8 	bl	1a00 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f001 fbb6 	bl	1a00 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f001 fbb4 	bl	1a00 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f001 fbb2 	bl	1a00 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f001 fbb0 	bl	1a00 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f001 fbae 	bl	1a00 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f001 fbac 	bl	1a00 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f001 fbaa 	bl	1a00 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f001 fba8 	bl	1a00 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f001 fba6 	bl	1a00 <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2b4:	f001 fba4 	bl	1a00 <reset_mcu>

000002b8 <USART1_handler>:
_default_handler(USART1_handler) // 37
     2b8:	f001 fba2 	bl	1a00 <reset_mcu>
_default_handler(USART2_handler) // 38
     2bc:	f001 fba0 	bl	1a00 <reset_mcu>

000002c0 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2c0:	f001 fb9e 	bl	1a00 <reset_mcu>

000002c4 <strcmp>:
extern unsigned int _FLASH_FREE;
extern unsigned int _DATA_ROM_START;

uint32_t proga;

int strcmp(const char *s1, const char *s2){
     2c4:	b480      	push	{r7}
     2c6:	b085      	sub	sp, #20
     2c8:	af00      	add	r7, sp, #0
     2ca:	6078      	str	r0, [r7, #4]
     2cc:	6039      	str	r1, [r7, #0]
	int result=0;
     2ce:	2300      	movs	r3, #0
     2d0:	60fb      	str	r3, [r7, #12]
	while (*s1 && *s2){
     2d2:	e018      	b.n	306 <strcmp+0x42>
		if (*s1<*s2){
     2d4:	687b      	ldr	r3, [r7, #4]
     2d6:	781a      	ldrb	r2, [r3, #0]
     2d8:	683b      	ldr	r3, [r7, #0]
     2da:	781b      	ldrb	r3, [r3, #0]
     2dc:	429a      	cmp	r2, r3
     2de:	d203      	bcs.n	2e8 <strcmp+0x24>
			result=-1;
     2e0:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     2e4:	60fb      	str	r3, [r7, #12]
			break;
     2e6:	e016      	b.n	316 <strcmp+0x52>
		}else if (*s1>*s2){
     2e8:	687b      	ldr	r3, [r7, #4]
     2ea:	781a      	ldrb	r2, [r3, #0]
     2ec:	683b      	ldr	r3, [r7, #0]
     2ee:	781b      	ldrb	r3, [r3, #0]
     2f0:	429a      	cmp	r2, r3
     2f2:	d902      	bls.n	2fa <strcmp+0x36>
			result=1;
     2f4:	2301      	movs	r3, #1
     2f6:	60fb      	str	r3, [r7, #12]
			break;
     2f8:	e00d      	b.n	316 <strcmp+0x52>
		}
		s1++;
     2fa:	687b      	ldr	r3, [r7, #4]
     2fc:	3301      	adds	r3, #1
     2fe:	607b      	str	r3, [r7, #4]
		s2++;
     300:	683b      	ldr	r3, [r7, #0]
     302:	3301      	adds	r3, #1
     304:	603b      	str	r3, [r7, #0]

uint32_t proga;

int strcmp(const char *s1, const char *s2){
	int result=0;
	while (*s1 && *s2){
     306:	687b      	ldr	r3, [r7, #4]
     308:	781b      	ldrb	r3, [r3, #0]
     30a:	2b00      	cmp	r3, #0
     30c:	d003      	beq.n	316 <strcmp+0x52>
     30e:	683b      	ldr	r3, [r7, #0]
     310:	781b      	ldrb	r3, [r3, #0]
     312:	2b00      	cmp	r3, #0
     314:	d1de      	bne.n	2d4 <strcmp+0x10>
			break;
		}
		s1++;
		s2++;
	}
	if (!result){
     316:	68fb      	ldr	r3, [r7, #12]
     318:	2b00      	cmp	r3, #0
     31a:	d115      	bne.n	348 <strcmp+0x84>
		if (!*s1 && *s2){
     31c:	687b      	ldr	r3, [r7, #4]
     31e:	781b      	ldrb	r3, [r3, #0]
     320:	2b00      	cmp	r3, #0
     322:	d107      	bne.n	334 <strcmp+0x70>
     324:	683b      	ldr	r3, [r7, #0]
     326:	781b      	ldrb	r3, [r3, #0]
     328:	2b00      	cmp	r3, #0
     32a:	d003      	beq.n	334 <strcmp+0x70>
			result=-1;
     32c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     330:	60fb      	str	r3, [r7, #12]
     332:	e009      	b.n	348 <strcmp+0x84>
		}else if (*s1 && !*s2) {
     334:	687b      	ldr	r3, [r7, #4]
     336:	781b      	ldrb	r3, [r3, #0]
     338:	2b00      	cmp	r3, #0
     33a:	d005      	beq.n	348 <strcmp+0x84>
     33c:	683b      	ldr	r3, [r7, #0]
     33e:	781b      	ldrb	r3, [r3, #0]
     340:	2b00      	cmp	r3, #0
     342:	d101      	bne.n	348 <strcmp+0x84>
			result=1;
     344:	2301      	movs	r3, #1
     346:	60fb      	str	r3, [r7, #12]
		}
	}
	return result;
     348:	68fb      	ldr	r3, [r7, #12]
}
     34a:	4618      	mov	r0, r3
     34c:	3714      	adds	r7, #20
     34e:	46bd      	mov	sp, r7
     350:	f85d 7b04 	ldr.w	r7, [sp], #4
     354:	4770      	bx	lr
     356:	bf00      	nop

00000358 <digit>:

int digit(char c){
     358:	b480      	push	{r7}
     35a:	b083      	sub	sp, #12
     35c:	af00      	add	r7, sp, #0
     35e:	4603      	mov	r3, r0
     360:	71fb      	strb	r3, [r7, #7]
   return ((c>='0') && (c<='9'));
     362:	79fb      	ldrb	r3, [r7, #7]
     364:	2b2f      	cmp	r3, #47	; 0x2f
     366:	d904      	bls.n	372 <digit+0x1a>
     368:	79fb      	ldrb	r3, [r7, #7]
     36a:	2b39      	cmp	r3, #57	; 0x39
     36c:	d801      	bhi.n	372 <digit+0x1a>
     36e:	2301      	movs	r3, #1
     370:	e000      	b.n	374 <digit+0x1c>
     372:	2300      	movs	r3, #0
}
     374:	4618      	mov	r0, r3
     376:	370c      	adds	r7, #12
     378:	46bd      	mov	sp, r7
     37a:	f85d 7b04 	ldr.w	r7, [sp], #4
     37e:	4770      	bx	lr

00000380 <hexdigit>:

int hexdigit(char c){
     380:	b580      	push	{r7, lr}
     382:	b082      	sub	sp, #8
     384:	af00      	add	r7, sp, #0
     386:	4603      	mov	r3, r0
     388:	71fb      	strb	r3, [r7, #7]
	if (c>='a') c-=32;
     38a:	79fb      	ldrb	r3, [r7, #7]
     38c:	2b60      	cmp	r3, #96	; 0x60
     38e:	d902      	bls.n	396 <hexdigit+0x16>
     390:	79fb      	ldrb	r3, [r7, #7]
     392:	3b20      	subs	r3, #32
     394:	71fb      	strb	r3, [r7, #7]
	return (digit(c) || (c>='A' && c<='F'));
     396:	79fb      	ldrb	r3, [r7, #7]
     398:	4618      	mov	r0, r3
     39a:	f7ff ffdd 	bl	358 <digit>
     39e:	4603      	mov	r3, r0
     3a0:	2b00      	cmp	r3, #0
     3a2:	d105      	bne.n	3b0 <hexdigit+0x30>
     3a4:	79fb      	ldrb	r3, [r7, #7]
     3a6:	2b40      	cmp	r3, #64	; 0x40
     3a8:	d904      	bls.n	3b4 <hexdigit+0x34>
     3aa:	79fb      	ldrb	r3, [r7, #7]
     3ac:	2b46      	cmp	r3, #70	; 0x46
     3ae:	d801      	bhi.n	3b4 <hexdigit+0x34>
     3b0:	2301      	movs	r3, #1
     3b2:	e000      	b.n	3b6 <hexdigit+0x36>
     3b4:	2300      	movs	r3, #0
}
     3b6:	4618      	mov	r0, r3
     3b8:	3708      	adds	r7, #8
     3ba:	46bd      	mov	sp, r7
     3bc:	bd80      	pop	{r7, pc}
     3be:	bf00      	nop

000003c0 <atoi>:

int atoi(const char *str){
     3c0:	b580      	push	{r7, lr}
     3c2:	b086      	sub	sp, #24
     3c4:	af00      	add	r7, sp, #0
     3c6:	6078      	str	r0, [r7, #4]
	int n=0,sign=1,base=10;
     3c8:	2300      	movs	r3, #0
     3ca:	617b      	str	r3, [r7, #20]
     3cc:	2301      	movs	r3, #1
     3ce:	613b      	str	r3, [r7, #16]
     3d0:	230a      	movs	r3, #10
     3d2:	60fb      	str	r3, [r7, #12]
    char c;
    
	while (*str && (*str==SPACE)) str++;
     3d4:	e002      	b.n	3dc <atoi+0x1c>
     3d6:	687b      	ldr	r3, [r7, #4]
     3d8:	3301      	adds	r3, #1
     3da:	607b      	str	r3, [r7, #4]
     3dc:	687b      	ldr	r3, [r7, #4]
     3de:	781b      	ldrb	r3, [r3, #0]
     3e0:	2b00      	cmp	r3, #0
     3e2:	d003      	beq.n	3ec <atoi+0x2c>
     3e4:	687b      	ldr	r3, [r7, #4]
     3e6:	781b      	ldrb	r3, [r3, #0]
     3e8:	2b20      	cmp	r3, #32
     3ea:	d0f4      	beq.n	3d6 <atoi+0x16>
	if (*str=='-'){
     3ec:	687b      	ldr	r3, [r7, #4]
     3ee:	781b      	ldrb	r3, [r3, #0]
     3f0:	2b2d      	cmp	r3, #45	; 0x2d
     3f2:	d105      	bne.n	400 <atoi+0x40>
		sign=-1;
     3f4:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     3f8:	613b      	str	r3, [r7, #16]
		str++;
     3fa:	687b      	ldr	r3, [r7, #4]
     3fc:	3301      	adds	r3, #1
     3fe:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
     400:	687b      	ldr	r3, [r7, #4]
     402:	781b      	ldrb	r3, [r3, #0]
     404:	2b30      	cmp	r3, #48	; 0x30
     406:	d10e      	bne.n	426 <atoi+0x66>
     408:	687b      	ldr	r3, [r7, #4]
     40a:	3301      	adds	r3, #1
     40c:	781b      	ldrb	r3, [r3, #0]
     40e:	2b78      	cmp	r3, #120	; 0x78
     410:	d004      	beq.n	41c <atoi+0x5c>
     412:	687b      	ldr	r3, [r7, #4]
     414:	3301      	adds	r3, #1
     416:	781b      	ldrb	r3, [r3, #0]
     418:	2b58      	cmp	r3, #88	; 0x58
     41a:	d104      	bne.n	426 <atoi+0x66>
		base=16;
     41c:	2310      	movs	r3, #16
     41e:	60fb      	str	r3, [r7, #12]
		str+=2;
     420:	687b      	ldr	r3, [r7, #4]
     422:	3302      	adds	r3, #2
     424:	607b      	str	r3, [r7, #4]
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     426:	e018      	b.n	45a <atoi+0x9a>
		if (c>='a'){c-=32;}
     428:	7afb      	ldrb	r3, [r7, #11]
     42a:	2b60      	cmp	r3, #96	; 0x60
     42c:	d902      	bls.n	434 <atoi+0x74>
     42e:	7afb      	ldrb	r3, [r7, #11]
     430:	3b20      	subs	r3, #32
     432:	72fb      	strb	r3, [r7, #11]
		c-='0';
     434:	7afb      	ldrb	r3, [r7, #11]
     436:	3b30      	subs	r3, #48	; 0x30
     438:	72fb      	strb	r3, [r7, #11]
		if (c>9){c-=7;}
     43a:	7afb      	ldrb	r3, [r7, #11]
     43c:	2b09      	cmp	r3, #9
     43e:	d902      	bls.n	446 <atoi+0x86>
     440:	7afb      	ldrb	r3, [r7, #11]
     442:	3b07      	subs	r3, #7
     444:	72fb      	strb	r3, [r7, #11]
		n=n*base+c;
     446:	697b      	ldr	r3, [r7, #20]
     448:	68fa      	ldr	r2, [r7, #12]
     44a:	fb02 f203 	mul.w	r2, r2, r3
     44e:	7afb      	ldrb	r3, [r7, #11]
     450:	4413      	add	r3, r2
     452:	617b      	str	r3, [r7, #20]
		str++;
     454:	687b      	ldr	r3, [r7, #4]
     456:	3301      	adds	r3, #1
     458:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
		base=16;
		str+=2;
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     45a:	687b      	ldr	r3, [r7, #4]
     45c:	781b      	ldrb	r3, [r3, #0]
     45e:	72fb      	strb	r3, [r7, #11]
     460:	7afb      	ldrb	r3, [r7, #11]
     462:	2b00      	cmp	r3, #0
     464:	d00d      	beq.n	482 <atoi+0xc2>
     466:	68fb      	ldr	r3, [r7, #12]
     468:	2b0a      	cmp	r3, #10
     46a:	d10a      	bne.n	482 <atoi+0xc2>
     46c:	7afb      	ldrb	r3, [r7, #11]
     46e:	4618      	mov	r0, r3
     470:	f7ff ff72 	bl	358 <digit>
     474:	4603      	mov	r3, r0
     476:	2b00      	cmp	r3, #0
     478:	bf14      	ite	ne
     47a:	2301      	movne	r3, #1
     47c:	2300      	moveq	r3, #0
     47e:	b2db      	uxtb	r3, r3
     480:	e009      	b.n	496 <atoi+0xd6>
     482:	7afb      	ldrb	r3, [r7, #11]
     484:	4618      	mov	r0, r3
     486:	f7ff ff7b 	bl	380 <hexdigit>
     48a:	4603      	mov	r3, r0
     48c:	2b00      	cmp	r3, #0
     48e:	bf14      	ite	ne
     490:	2301      	movne	r3, #1
     492:	2300      	moveq	r3, #0
     494:	b2db      	uxtb	r3, r3
     496:	2b00      	cmp	r3, #0
     498:	d1c6      	bne.n	428 <atoi+0x68>
		c-='0';
		if (c>9){c-=7;}
		n=n*base+c;
		str++;
	}
	return sign*n;
     49a:	693b      	ldr	r3, [r7, #16]
     49c:	697a      	ldr	r2, [r7, #20]
     49e:	fb02 f303 	mul.w	r3, r2, r3
}
     4a2:	4618      	mov	r0, r3
     4a4:	3718      	adds	r7, #24
     4a6:	46bd      	mov	sp, r7
     4a8:	bd80      	pop	{r7, pc}
     4aa:	bf00      	nop

000004ac <led_on>:
static void move(char *src , char *dest, int len);
static void word();

// routine de services

static inline void led_on(){
     4ac:	b480      	push	{r7}
     4ae:	af00      	add	r7, sp, #0
	GPIOC_BRR->brr=GRN_LED;
     4b0:	4b03      	ldr	r3, [pc, #12]	; (4c0 <led_on+0x14>)
     4b2:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4b6:	601a      	str	r2, [r3, #0]
}
     4b8:	46bd      	mov	sp, r7
     4ba:	f85d 7b04 	ldr.w	r7, [sp], #4
     4be:	4770      	bx	lr
     4c0:	40011014 	.word	0x40011014

000004c4 <led_off>:

static inline void led_off(){
     4c4:	b480      	push	{r7}
     4c6:	af00      	add	r7, sp, #0
	GPIOC_BSRR->bsrr=GRN_LED;
     4c8:	4b03      	ldr	r3, [pc, #12]	; (4d8 <led_off+0x14>)
     4ca:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4ce:	601a      	str	r2, [r3, #0]
}
     4d0:	46bd      	mov	sp, r7
     4d2:	f85d 7b04 	ldr.w	r7, [sp], #4
     4d6:	4770      	bx	lr
     4d8:	40011010 	.word	0x40011010

000004dc <set_timer>:

static inline void set_timer(unsigned time){
     4dc:	b480      	push	{r7}
     4de:	b083      	sub	sp, #12
     4e0:	af00      	add	r7, sp, #0
     4e2:	6078      	str	r0, [r7, #4]
	timer=time;
     4e4:	4a03      	ldr	r2, [pc, #12]	; (4f4 <set_timer+0x18>)
     4e6:	687b      	ldr	r3, [r7, #4]
     4e8:	6013      	str	r3, [r2, #0]
}
     4ea:	370c      	adds	r7, #12
     4ec:	46bd      	mov	sp, r7
     4ee:	f85d 7b04 	ldr.w	r7, [sp], #4
     4f2:	4770      	bx	lr
     4f4:	20000010 	.word	0x20000010

000004f8 <get_timer>:


static inline unsigned get_timer(){
     4f8:	b480      	push	{r7}
     4fa:	af00      	add	r7, sp, #0
	return timer;
     4fc:	4b03      	ldr	r3, [pc, #12]	; (50c <get_timer+0x14>)
     4fe:	681b      	ldr	r3, [r3, #0]
}
     500:	4618      	mov	r0, r3
     502:	46bd      	mov	sp, r7
     504:	f85d 7b04 	ldr.w	r7, [sp], #4
     508:	4770      	bx	lr
     50a:	bf00      	nop
     50c:	20000010 	.word	0x20000010

00000510 <peek8>:


static inline uint8_t peek8(uint8_t *adr){
     510:	b480      	push	{r7}
     512:	b083      	sub	sp, #12
     514:	af00      	add	r7, sp, #0
     516:	6078      	str	r0, [r7, #4]
	return *adr;
     518:	687b      	ldr	r3, [r7, #4]
     51a:	781b      	ldrb	r3, [r3, #0]
}
     51c:	4618      	mov	r0, r3
     51e:	370c      	adds	r7, #12
     520:	46bd      	mov	sp, r7
     522:	f85d 7b04 	ldr.w	r7, [sp], #4
     526:	4770      	bx	lr

00000528 <peek16>:

static inline uint16_t peek16(uint16_t *adr){
     528:	b480      	push	{r7}
     52a:	b083      	sub	sp, #12
     52c:	af00      	add	r7, sp, #0
     52e:	6078      	str	r0, [r7, #4]
	return *adr;
     530:	687b      	ldr	r3, [r7, #4]
     532:	881b      	ldrh	r3, [r3, #0]
}
     534:	4618      	mov	r0, r3
     536:	370c      	adds	r7, #12
     538:	46bd      	mov	sp, r7
     53a:	f85d 7b04 	ldr.w	r7, [sp], #4
     53e:	4770      	bx	lr

00000540 <peek32>:

static inline uint32_t peek32(uint32_t *adr){
     540:	b480      	push	{r7}
     542:	b083      	sub	sp, #12
     544:	af00      	add	r7, sp, #0
     546:	6078      	str	r0, [r7, #4]
	return *adr;
     548:	687b      	ldr	r3, [r7, #4]
     54a:	681b      	ldr	r3, [r3, #0]
}
     54c:	4618      	mov	r0, r3
     54e:	370c      	adds	r7, #12
     550:	46bd      	mov	sp, r7
     552:	f85d 7b04 	ldr.w	r7, [sp], #4
     556:	4770      	bx	lr

00000558 <poke8>:

static inline void poke8(uint8_t *adr, uint8_t value){
     558:	b480      	push	{r7}
     55a:	b083      	sub	sp, #12
     55c:	af00      	add	r7, sp, #0
     55e:	6078      	str	r0, [r7, #4]
     560:	460b      	mov	r3, r1
     562:	70fb      	strb	r3, [r7, #3]
	*adr=value;
     564:	687b      	ldr	r3, [r7, #4]
     566:	78fa      	ldrb	r2, [r7, #3]
     568:	701a      	strb	r2, [r3, #0]
}
     56a:	370c      	adds	r7, #12
     56c:	46bd      	mov	sp, r7
     56e:	f85d 7b04 	ldr.w	r7, [sp], #4
     572:	4770      	bx	lr

00000574 <poke16>:

static inline void poke16(uint16_t *adr, uint16_t value){
     574:	b480      	push	{r7}
     576:	b083      	sub	sp, #12
     578:	af00      	add	r7, sp, #0
     57a:	6078      	str	r0, [r7, #4]
     57c:	460b      	mov	r3, r1
     57e:	807b      	strh	r3, [r7, #2]
	*adr=value;
     580:	687b      	ldr	r3, [r7, #4]
     582:	887a      	ldrh	r2, [r7, #2]
     584:	801a      	strh	r2, [r3, #0]
}
     586:	370c      	adds	r7, #12
     588:	46bd      	mov	sp, r7
     58a:	f85d 7b04 	ldr.w	r7, [sp], #4
     58e:	4770      	bx	lr

00000590 <poke32>:

static inline void poke32(uint32_t *adr, uint32_t value){
     590:	b480      	push	{r7}
     592:	b083      	sub	sp, #12
     594:	af00      	add	r7, sp, #0
     596:	6078      	str	r0, [r7, #4]
     598:	6039      	str	r1, [r7, #0]
	*adr=value;
     59a:	687b      	ldr	r3, [r7, #4]
     59c:	683a      	ldr	r2, [r7, #0]
     59e:	601a      	str	r2, [r3, #0]
}
     5a0:	370c      	adds	r7, #12
     5a2:	46bd      	mov	sp, r7
     5a4:	f85d 7b04 	ldr.w	r7, [sp], #4
     5a8:	4770      	bx	lr
     5aa:	bf00      	nop

000005ac <SVC_handler>:

// interruption multiplexeur des appels de services
void __attribute__((__interrupt__)) SVC_handler(){
     5ac:	4668      	mov	r0, sp
     5ae:	f020 0107 	bic.w	r1, r0, #7
     5b2:	468d      	mov	sp, r1
     5b4:	b591      	push	{r0, r4, r7, lr}
     5b6:	b084      	sub	sp, #16
     5b8:	af00      	add	r7, sp, #0
	int svc_id;
	void *arg1, *arg2; 
	asm volatile (
     5ba:	f3ef 8009 	mrs	r0, PSP
     5be:	6981      	ldr	r1, [r0, #24]
     5c0:	f811 4c02 	ldrb.w	r4, [r1, #-2]
     5c4:	6802      	ldr	r2, [r0, #0]
     5c6:	6843      	ldr	r3, [r0, #4]
     5c8:	60fc      	str	r4, [r7, #12]
     5ca:	60ba      	str	r2, [r7, #8]
     5cc:	607b      	str	r3, [r7, #4]
    "ldr %[arg1],[r0]\n\t"
    "ldr %[arg2],[r0,#4]\n\t"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [arg2] "=r" (arg2)
    :: "r0","r1" 
    );
	switch (svc_id){
     5ce:	68fb      	ldr	r3, [r7, #12]
     5d0:	2b12      	cmp	r3, #18
     5d2:	f200 80b6 	bhi.w	742 <SVC_handler+0x196>
     5d6:	a201      	add	r2, pc, #4	; (adr r2, 5dc <SVC_handler+0x30>)
     5d8:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     5dc:	0000073d 	.word	0x0000073d
     5e0:	00000629 	.word	0x00000629
     5e4:	0000062f 	.word	0x0000062f
     5e8:	00000635 	.word	0x00000635
     5ec:	00000641 	.word	0x00000641
     5f0:	0000064d 	.word	0x0000064d
     5f4:	0000065b 	.word	0x0000065b
     5f8:	00000667 	.word	0x00000667
     5fc:	0000067b 	.word	0x0000067b
     600:	00000683 	.word	0x00000683
     604:	00000691 	.word	0x00000691
     608:	0000069d 	.word	0x0000069d
     60c:	000006b1 	.word	0x000006b1
     610:	000006c5 	.word	0x000006c5
     614:	000006d7 	.word	0x000006d7
     618:	000006eb 	.word	0x000006eb
     61c:	000006ff 	.word	0x000006ff
     620:	00000713 	.word	0x00000713
     624:	0000072b 	.word	0x0000072b
	case SVC_LED_ON: 
		led_on();
     628:	f7ff ff40 	bl	4ac <led_on>
		break;
     62c:	e089      	b.n	742 <SVC_handler+0x196>
	case SVC_LED_OFF:
		led_off();
     62e:	f7ff ff49 	bl	4c4 <led_off>
		break;
     632:	e086      	b.n	742 <SVC_handler+0x196>
	case SVC_TIMER:
		set_timer(*(unsigned*)arg1);
     634:	68bb      	ldr	r3, [r7, #8]
     636:	681b      	ldr	r3, [r3, #0]
     638:	4618      	mov	r0, r3
     63a:	f7ff ff4f 	bl	4dc <set_timer>
		break;
     63e:	e080      	b.n	742 <SVC_handler+0x196>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=get_timer();
     640:	f7ff ff5a 	bl	4f8 <get_timer>
     644:	4602      	mov	r2, r0
     646:	68bb      	ldr	r3, [r7, #8]
     648:	601a      	str	r2, [r3, #0]
		break;
     64a:	e07a      	b.n	742 <SVC_handler+0x196>
	case SVC_CONIN:
		*(char *)arg1=conin();
     64c:	f000 fd30 	bl	10b0 <conin>
     650:	4603      	mov	r3, r0
     652:	461a      	mov	r2, r3
     654:	68bb      	ldr	r3, [r7, #8]
     656:	701a      	strb	r2, [r3, #0]
		break;
     658:	e073      	b.n	742 <SVC_handler+0x196>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     65a:	68bb      	ldr	r3, [r7, #8]
     65c:	781b      	ldrb	r3, [r3, #0]
     65e:	4618      	mov	r0, r3
     660:	f000 fd16 	bl	1090 <conout>
		break;
     664:	e06d      	b.n	742 <SVC_handler+0x196>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     666:	68bb      	ldr	r3, [r7, #8]
     668:	681b      	ldr	r3, [r3, #0]
     66a:	6878      	ldr	r0, [r7, #4]
     66c:	4619      	mov	r1, r3
     66e:	f000 fd97 	bl	11a0 <read_line>
     672:	4602      	mov	r2, r0
     674:	68bb      	ldr	r3, [r7, #8]
     676:	601a      	str	r2, [r3, #0]
		break;
     678:	e063      	b.n	742 <SVC_handler+0x196>
	case SVC_PRINT:
		print((const char*)arg1);
     67a:	68b8      	ldr	r0, [r7, #8]
     67c:	f000 fd3a 	bl	10f4 <print>
		break;
     680:	e05f      	b.n	742 <SVC_handler+0x196>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     682:	68bb      	ldr	r3, [r7, #8]
     684:	681b      	ldr	r3, [r3, #0]
     686:	4618      	mov	r0, r3
     688:	210a      	movs	r1, #10
     68a:	f000 fe33 	bl	12f4 <print_int>
		break;
     68e:	e058      	b.n	742 <SVC_handler+0x196>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     690:	68bb      	ldr	r3, [r7, #8]
     692:	681b      	ldr	r3, [r3, #0]
     694:	4618      	mov	r0, r3
     696:	f000 fe9b 	bl	13d0 <print_hex>
		break;
     69a:	e052      	b.n	742 <SVC_handler+0x196>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     69c:	68bb      	ldr	r3, [r7, #8]
     69e:	681b      	ldr	r3, [r3, #0]
     6a0:	4618      	mov	r0, r3
     6a2:	f7ff ff35 	bl	510 <peek8>
     6a6:	4603      	mov	r3, r0
     6a8:	461a      	mov	r2, r3
     6aa:	68bb      	ldr	r3, [r7, #8]
     6ac:	701a      	strb	r2, [r3, #0]
		break;
     6ae:	e048      	b.n	742 <SVC_handler+0x196>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     6b0:	68bb      	ldr	r3, [r7, #8]
     6b2:	681b      	ldr	r3, [r3, #0]
     6b4:	4618      	mov	r0, r3
     6b6:	f7ff ff37 	bl	528 <peek16>
     6ba:	4603      	mov	r3, r0
     6bc:	461a      	mov	r2, r3
     6be:	68bb      	ldr	r3, [r7, #8]
     6c0:	801a      	strh	r2, [r3, #0]
		break;
     6c2:	e03e      	b.n	742 <SVC_handler+0x196>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     6c4:	68bb      	ldr	r3, [r7, #8]
     6c6:	681b      	ldr	r3, [r3, #0]
     6c8:	4618      	mov	r0, r3
     6ca:	f7ff ff39 	bl	540 <peek32>
     6ce:	4602      	mov	r2, r0
     6d0:	68bb      	ldr	r3, [r7, #8]
     6d2:	601a      	str	r2, [r3, #0]
		break;
     6d4:	e035      	b.n	742 <SVC_handler+0x196>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
     6d6:	68bb      	ldr	r3, [r7, #8]
     6d8:	681b      	ldr	r3, [r3, #0]
     6da:	461a      	mov	r2, r3
     6dc:	687b      	ldr	r3, [r7, #4]
     6de:	781b      	ldrb	r3, [r3, #0]
     6e0:	4610      	mov	r0, r2
     6e2:	4619      	mov	r1, r3
     6e4:	f7ff ff38 	bl	558 <poke8>
		break;
     6e8:	e02b      	b.n	742 <SVC_handler+0x196>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
     6ea:	68bb      	ldr	r3, [r7, #8]
     6ec:	681b      	ldr	r3, [r3, #0]
     6ee:	461a      	mov	r2, r3
     6f0:	687b      	ldr	r3, [r7, #4]
     6f2:	881b      	ldrh	r3, [r3, #0]
     6f4:	4610      	mov	r0, r2
     6f6:	4619      	mov	r1, r3
     6f8:	f7ff ff3c 	bl	574 <poke16>
		break;
     6fc:	e021      	b.n	742 <SVC_handler+0x196>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
     6fe:	68bb      	ldr	r3, [r7, #8]
     700:	681b      	ldr	r3, [r3, #0]
     702:	461a      	mov	r2, r3
     704:	687b      	ldr	r3, [r7, #4]
     706:	681b      	ldr	r3, [r3, #0]
     708:	4610      	mov	r0, r2
     70a:	4619      	mov	r1, r3
     70c:	f7ff ff40 	bl	590 <poke32>
		break;
     710:	e017      	b.n	742 <SVC_handler+0x196>
	case SVC_FLASH_WR:
		*(int*)arg1=flash_write(*(uint32_t*)arg1,*(uint16_t*)arg2);
     712:	68bb      	ldr	r3, [r7, #8]
     714:	681a      	ldr	r2, [r3, #0]
     716:	687b      	ldr	r3, [r7, #4]
     718:	881b      	ldrh	r3, [r3, #0]
     71a:	4610      	mov	r0, r2
     71c:	4619      	mov	r1, r3
     71e:	f000 ff09 	bl	1534 <flash_write>
     722:	4602      	mov	r2, r0
     724:	68bb      	ldr	r3, [r7, #8]
     726:	601a      	str	r2, [r3, #0]
		break;
     728:	e00b      	b.n	742 <SVC_handler+0x196>
	case SVC_FLASH_PGER:
		*(int*)arg1=flash_erase_page(*(uint32_t*)arg1);
     72a:	68bb      	ldr	r3, [r7, #8]
     72c:	681b      	ldr	r3, [r3, #0]
     72e:	4618      	mov	r0, r3
     730:	f000 ff44 	bl	15bc <flash_erase_page>
     734:	4602      	mov	r2, r0
     736:	68bb      	ldr	r3, [r7, #8]
     738:	601a      	str	r2, [r3, #0]
		break;
     73a:	e002      	b.n	742 <SVC_handler+0x196>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     73c:	f001 f960 	bl	1a00 <reset_mcu>
	    break;
     740:	bf00      	nop
	}	
}
     742:	3710      	adds	r7, #16
     744:	46bd      	mov	sp, r7
     746:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     74a:	4685      	mov	sp, r0
     74c:	4770      	bx	lr
     74e:	bf00      	nop

00000750 <STK_handler>:

// interruption coretimer
void __attribute__((naked)) STK_handler(){
	ticks++;
     750:	4b06      	ldr	r3, [pc, #24]	; (76c <STK_handler+0x1c>)
     752:	681b      	ldr	r3, [r3, #0]
     754:	3301      	adds	r3, #1
     756:	4a05      	ldr	r2, [pc, #20]	; (76c <STK_handler+0x1c>)
     758:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
     75a:	4b05      	ldr	r3, [pc, #20]	; (770 <STK_handler+0x20>)
     75c:	681b      	ldr	r3, [r3, #0]
     75e:	2b00      	cmp	r3, #0
     760:	d004      	beq.n	76c <STK_handler+0x1c>
     762:	4b03      	ldr	r3, [pc, #12]	; (770 <STK_handler+0x20>)
     764:	681b      	ldr	r3, [r3, #0]
     766:	3b01      	subs	r3, #1
     768:	4a01      	ldr	r2, [pc, #4]	; (770 <STK_handler+0x20>)
     76a:	6013      	str	r3, [r2, #0]
     76c:	2000000c 	.word	0x2000000c
     770:	20000010 	.word	0x20000010

00000774 <set_sysclock>:
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     774:	b480      	push	{r7}
     776:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC_CR->fld.hseon=1;
     778:	4b1f      	ldr	r3, [pc, #124]	; (7f8 <set_sysclock+0x84>)
     77a:	681a      	ldr	r2, [r3, #0]
     77c:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
     780:	601a      	str	r2, [r3, #0]
	 // attend que l'oscillateur soit prêt
   while (!RCC_CR->fld.hserdy);
     782:	bf00      	nop
     784:	4b1c      	ldr	r3, [pc, #112]	; (7f8 <set_sysclock+0x84>)
     786:	681b      	ldr	r3, [r3, #0]
     788:	0c5b      	lsrs	r3, r3, #17
     78a:	f003 0301 	and.w	r3, r3, #1
     78e:	b2db      	uxtb	r3, r3
     790:	2b00      	cmp	r3, #0
     792:	d0f7      	beq.n	784 <set_sysclock+0x10>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR->cfgr|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
     794:	4a19      	ldr	r2, [pc, #100]	; (7fc <set_sysclock+0x88>)
     796:	4b19      	ldr	r3, [pc, #100]	; (7fc <set_sysclock+0x88>)
     798:	681b      	ldr	r3, [r3, #0]
     79a:	f443 13e8 	orr.w	r3, r3, #1900544	; 0x1d0000
     79e:	6013      	str	r3, [r2, #0]
    // active le PLL
    RCC_CR->fld.pllon=1;
     7a0:	4b15      	ldr	r3, [pc, #84]	; (7f8 <set_sysclock+0x84>)
     7a2:	681a      	ldr	r2, [r3, #0]
     7a4:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
     7a8:	601a      	str	r2, [r3, #0]
    // Attend que le PLL soit prêt
    while (!RCC_CR->fld.pllrdy);
     7aa:	bf00      	nop
     7ac:	4b12      	ldr	r3, [pc, #72]	; (7f8 <set_sysclock+0x84>)
     7ae:	681b      	ldr	r3, [r3, #0]
     7b0:	0e5b      	lsrs	r3, r3, #25
     7b2:	f003 0301 	and.w	r3, r3, #1
     7b6:	b2db      	uxtb	r3, r3
     7b8:	2b00      	cmp	r3, #0
     7ba:	d0f7      	beq.n	7ac <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR->fld.latency=WAIT_2_CY;
     7bc:	4b10      	ldr	r3, [pc, #64]	; (800 <set_sysclock+0x8c>)
     7be:	681a      	ldr	r2, [r3, #0]
     7c0:	f022 0207 	bic.w	r2, r2, #7
     7c4:	f042 0202 	orr.w	r2, r2, #2
     7c8:	601a      	str	r2, [r3, #0]
    // active le prefetch buffer
    FLASH_ACR->fld.prftbe=1;
     7ca:	4b0d      	ldr	r3, [pc, #52]	; (800 <set_sysclock+0x8c>)
     7cc:	681a      	ldr	r2, [r3, #0]
     7ce:	f042 0210 	orr.w	r2, r2, #16
     7d2:	601a      	str	r2, [r3, #0]
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR->fld.sw=PLL_CLK;
     7d4:	4b09      	ldr	r3, [pc, #36]	; (7fc <set_sysclock+0x88>)
     7d6:	681a      	ldr	r2, [r3, #0]
     7d8:	f022 0203 	bic.w	r2, r2, #3
     7dc:	f042 0202 	orr.w	r2, r2, #2
     7e0:	601a      	str	r2, [r3, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR->fld.ppre1=PPRECLK_DIV2;
     7e2:	4b06      	ldr	r3, [pc, #24]	; (7fc <set_sysclock+0x88>)
     7e4:	681a      	ldr	r2, [r3, #0]
     7e6:	f422 62e0 	bic.w	r2, r2, #1792	; 0x700
     7ea:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     7ee:	601a      	str	r2, [r3, #0]
}
     7f0:	46bd      	mov	sp, r7
     7f2:	f85d 7b04 	ldr.w	r7, [sp], #4
     7f6:	4770      	bx	lr
     7f8:	40021000 	.word	0x40021000
     7fc:	40021004 	.word	0x40021004
     800:	40022000 	.word	0x40022000

00000804 <config_systicks>:

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
     804:	b480      	push	{r7}
     806:	af00      	add	r7, sp, #0
	*SYST_RVR=MSEC_DLY-1;
     808:	4b05      	ldr	r3, [pc, #20]	; (820 <config_systicks+0x1c>)
     80a:	f242 3227 	movw	r2, #8999	; 0x2327
     80e:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
     810:	4b04      	ldr	r3, [pc, #16]	; (824 <config_systicks+0x20>)
     812:	2203      	movs	r2, #3
     814:	601a      	str	r2, [r3, #0]
}
     816:	46bd      	mov	sp, r7
     818:	f85d 7b04 	ldr.w	r7, [sp], #4
     81c:	4770      	bx	lr
     81e:	bf00      	nop
     820:	e000e014 	.word	0xe000e014
     824:	e000e010 	.word	0xe000e010

00000828 <port_c_setup>:

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
     828:	b480      	push	{r7}
     82a:	af00      	add	r7, sp, #0
	APB2ENR->fld.iopcen=1;
     82c:	4a05      	ldr	r2, [pc, #20]	; (844 <port_c_setup+0x1c>)
     82e:	7813      	ldrb	r3, [r2, #0]
     830:	f043 0310 	orr.w	r3, r3, #16
     834:	7013      	strb	r3, [r2, #0]
	GPIOC_CRH->cr=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
     836:	4b04      	ldr	r3, [pc, #16]	; (848 <port_c_setup+0x20>)
     838:	4a04      	ldr	r2, [pc, #16]	; (84c <port_c_setup+0x24>)
     83a:	601a      	str	r2, [r3, #0]
}
     83c:	46bd      	mov	sp, r7
     83e:	f85d 7b04 	ldr.w	r7, [sp], #4
     842:	4770      	bx	lr
     844:	40021018 	.word	0x40021018
     848:	40011004 	.word	0x40011004
     84c:	44644444 	.word	0x44644444

00000850 <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     850:	b480      	push	{r7}
     852:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     854:	2300      	movs	r3, #0
     856:	2200      	movs	r2, #0
     858:	4618      	mov	r0, r3
     85a:	4611      	mov	r1, r2
     85c:	df00      	svc	0
}
     85e:	46bd      	mov	sp, r7
     860:	f85d 7b04 	ldr.w	r7, [sp], #4
     864:	4770      	bx	lr
     866:	bf00      	nop

00000868 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     868:	b480      	push	{r7}
     86a:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     86c:	2300      	movs	r3, #0
     86e:	2200      	movs	r2, #0
     870:	4618      	mov	r0, r3
     872:	4611      	mov	r1, r2
     874:	df01      	svc	1
}
     876:	46bd      	mov	sp, r7
     878:	f85d 7b04 	ldr.w	r7, [sp], #4
     87c:	4770      	bx	lr
     87e:	bf00      	nop

00000880 <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     880:	b480      	push	{r7}
     882:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     884:	2300      	movs	r3, #0
     886:	2200      	movs	r2, #0
     888:	4618      	mov	r0, r3
     88a:	4611      	mov	r1, r2
     88c:	df02      	svc	2
}
     88e:	46bd      	mov	sp, r7
     890:	f85d 7b04 	ldr.w	r7, [sp], #4
     894:	4770      	bx	lr
     896:	bf00      	nop

00000898 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     898:	b580      	push	{r7, lr}
     89a:	b082      	sub	sp, #8
     89c:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     89e:	f000 facd 	bl	e3c <word>
	n=atoi((const char*)pad);
     8a2:	4806      	ldr	r0, [pc, #24]	; (8bc <cmd_set_timer+0x24>)
     8a4:	f7ff fd8c 	bl	3c0 <atoi>
     8a8:	4603      	mov	r3, r0
     8aa:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     8ac:	1d3b      	adds	r3, r7, #4
     8ae:	2200      	movs	r2, #0
     8b0:	4618      	mov	r0, r3
     8b2:	4611      	mov	r1, r2
     8b4:	df03      	svc	3
}
     8b6:	3708      	adds	r7, #8
     8b8:	46bd      	mov	sp, r7
     8ba:	bd80      	pop	{r7, pc}
     8bc:	20000064 	.word	0x20000064

000008c0 <cmd_get_timer>:

static void cmd_get_timer(){
     8c0:	b480      	push	{r7}
     8c2:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     8c4:	4b04      	ldr	r3, [pc, #16]	; (8d8 <cmd_get_timer+0x18>)
     8c6:	2200      	movs	r2, #0
     8c8:	4618      	mov	r0, r3
     8ca:	4611      	mov	r1, r2
     8cc:	df04      	svc	4
}
     8ce:	46bd      	mov	sp, r7
     8d0:	f85d 7b04 	ldr.w	r7, [sp], #4
     8d4:	4770      	bx	lr
     8d6:	bf00      	nop
     8d8:	20000064 	.word	0x20000064

000008dc <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     8dc:	b480      	push	{r7}
     8de:	b083      	sub	sp, #12
     8e0:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     8e2:	1d3b      	adds	r3, r7, #4
     8e4:	2200      	movs	r2, #0
     8e6:	4618      	mov	r0, r3
     8e8:	4611      	mov	r1, r2
     8ea:	df04      	svc	4
     8ec:	687b      	ldr	r3, [r7, #4]
     8ee:	2b00      	cmp	r3, #0
     8f0:	d1f7      	bne.n	8e2 <cmd_pause+0x6>
}
     8f2:	370c      	adds	r7, #12
     8f4:	46bd      	mov	sp, r7
     8f6:	f85d 7b04 	ldr.w	r7, [sp], #4
     8fa:	4770      	bx	lr

000008fc <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     8fc:	b480      	push	{r7}
     8fe:	b083      	sub	sp, #12
     900:	af00      	add	r7, sp, #0
	volatile char n=0;
     902:	2300      	movs	r3, #0
     904:	71fb      	strb	r3, [r7, #7]
	while (!n){
     906:	e004      	b.n	912 <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     908:	1dfb      	adds	r3, r7, #7
     90a:	2200      	movs	r2, #0
     90c:	4618      	mov	r0, r3
     90e:	4611      	mov	r1, r2
     910:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     912:	79fb      	ldrb	r3, [r7, #7]
     914:	b2db      	uxtb	r3, r3
     916:	2b00      	cmp	r3, #0
     918:	d0f6      	beq.n	908 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     91a:	79fb      	ldrb	r3, [r7, #7]
     91c:	b2da      	uxtb	r2, r3
     91e:	4b05      	ldr	r3, [pc, #20]	; (934 <cmd_getc+0x38>)
     920:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     922:	4b04      	ldr	r3, [pc, #16]	; (934 <cmd_getc+0x38>)
     924:	2200      	movs	r2, #0
     926:	705a      	strb	r2, [r3, #1]
}
     928:	370c      	adds	r7, #12
     92a:	46bd      	mov	sp, r7
     92c:	f85d 7b04 	ldr.w	r7, [sp], #4
     930:	4770      	bx	lr
     932:	bf00      	nop
     934:	20000064 	.word	0x20000064

00000938 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     938:	b580      	push	{r7, lr}
     93a:	b082      	sub	sp, #8
     93c:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     93e:	f000 fa7d 	bl	e3c <word>
	cmd_id=search_command((const char*)pad);
     942:	480a      	ldr	r0, [pc, #40]	; (96c <cmd_putc+0x34>)
     944:	f000 f964 	bl	c10 <search_command>
     948:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     94a:	687b      	ldr	r3, [r7, #4]
     94c:	2b00      	cmp	r3, #0
     94e:	db05      	blt.n	95c <cmd_putc+0x24>
     950:	4a07      	ldr	r2, [pc, #28]	; (970 <cmd_putc+0x38>)
     952:	687b      	ldr	r3, [r7, #4]
     954:	00db      	lsls	r3, r3, #3
     956:	4413      	add	r3, r2
     958:	685b      	ldr	r3, [r3, #4]
     95a:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     95c:	4b03      	ldr	r3, [pc, #12]	; (96c <cmd_putc+0x34>)
     95e:	2200      	movs	r2, #0
     960:	4618      	mov	r0, r3
     962:	4611      	mov	r1, r2
     964:	df06      	svc	6
}
     966:	3708      	adds	r7, #8
     968:	46bd      	mov	sp, r7
     96a:	bd80      	pop	{r7, pc}
     96c:	20000064 	.word	0x20000064
     970:	0000211c 	.word	0x0000211c

00000974 <cmd_readln>:

static void cmd_readln(){
     974:	b580      	push	{r7, lr}
     976:	b082      	sub	sp, #8
     978:	af00      	add	r7, sp, #0
	unsigned llen=80;
     97a:	2350      	movs	r3, #80	; 0x50
     97c:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     97e:	1d3b      	adds	r3, r7, #4
     980:	4a04      	ldr	r2, [pc, #16]	; (994 <cmd_readln+0x20>)
     982:	4618      	mov	r0, r3
     984:	4611      	mov	r1, r2
     986:	df07      	svc	7
	print((const char*)pad);
     988:	4802      	ldr	r0, [pc, #8]	; (994 <cmd_readln+0x20>)
     98a:	f000 fbb3 	bl	10f4 <print>
}
     98e:	3708      	adds	r7, #8
     990:	46bd      	mov	sp, r7
     992:	bd80      	pop	{r7, pc}
     994:	20000064 	.word	0x20000064

00000998 <cmd_print>:

static void cmd_print(){
     998:	b580      	push	{r7, lr}
     99a:	af00      	add	r7, sp, #0
	word();
     99c:	f000 fa4e 	bl	e3c <word>
	_svc_call(SVC_PRINT,pad,NUL);
     9a0:	4b02      	ldr	r3, [pc, #8]	; (9ac <cmd_print+0x14>)
     9a2:	2200      	movs	r2, #0
     9a4:	4618      	mov	r0, r3
     9a6:	4611      	mov	r1, r2
     9a8:	df08      	svc	8
}
     9aa:	bd80      	pop	{r7, pc}
     9ac:	20000064 	.word	0x20000064

000009b0 <cmd_print_int>:

static void cmd_print_int(){
     9b0:	b580      	push	{r7, lr}
     9b2:	b082      	sub	sp, #8
     9b4:	af00      	add	r7, sp, #0
	int cmd_id;
    unsigned u32;
    
	word();
     9b6:	f000 fa41 	bl	e3c <word>
	cmd_id=search_command((const char*)pad);
     9ba:	480e      	ldr	r0, [pc, #56]	; (9f4 <cmd_print_int+0x44>)
     9bc:	f000 f928 	bl	c10 <search_command>
     9c0:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     9c2:	687b      	ldr	r3, [r7, #4]
     9c4:	2b00      	cmp	r3, #0
     9c6:	db06      	blt.n	9d6 <cmd_print_int+0x26>
		 commands[cmd_id].fn();
     9c8:	4a0b      	ldr	r2, [pc, #44]	; (9f8 <cmd_print_int+0x48>)
     9ca:	687b      	ldr	r3, [r7, #4]
     9cc:	00db      	lsls	r3, r3, #3
     9ce:	4413      	add	r3, r2
     9d0:	685b      	ldr	r3, [r3, #4]
     9d2:	4798      	blx	r3
     9d4:	e006      	b.n	9e4 <cmd_print_int+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     9d6:	4807      	ldr	r0, [pc, #28]	; (9f4 <cmd_print_int+0x44>)
     9d8:	f7ff fcf2 	bl	3c0 <atoi>
     9dc:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     9de:	4a05      	ldr	r2, [pc, #20]	; (9f4 <cmd_print_int+0x44>)
     9e0:	687b      	ldr	r3, [r7, #4]
     9e2:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_INT,pad,NUL);
     9e4:	4b03      	ldr	r3, [pc, #12]	; (9f4 <cmd_print_int+0x44>)
     9e6:	2200      	movs	r2, #0
     9e8:	4618      	mov	r0, r3
     9ea:	4611      	mov	r1, r2
     9ec:	df09      	svc	9
}
     9ee:	3708      	adds	r7, #8
     9f0:	46bd      	mov	sp, r7
     9f2:	bd80      	pop	{r7, pc}
     9f4:	20000064 	.word	0x20000064
     9f8:	0000211c 	.word	0x0000211c

000009fc <cmd_print_hex>:

static void cmd_print_hex(){
     9fc:	b580      	push	{r7, lr}
     9fe:	b082      	sub	sp, #8
     a00:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     a02:	f000 fa1b 	bl	e3c <word>
	cmd_id=search_command((const char*)pad);
     a06:	480e      	ldr	r0, [pc, #56]	; (a40 <cmd_print_hex+0x44>)
     a08:	f000 f902 	bl	c10 <search_command>
     a0c:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     a0e:	687b      	ldr	r3, [r7, #4]
     a10:	2b00      	cmp	r3, #0
     a12:	db06      	blt.n	a22 <cmd_print_hex+0x26>
		 commands[cmd_id].fn();
     a14:	4a0b      	ldr	r2, [pc, #44]	; (a44 <cmd_print_hex+0x48>)
     a16:	687b      	ldr	r3, [r7, #4]
     a18:	00db      	lsls	r3, r3, #3
     a1a:	4413      	add	r3, r2
     a1c:	685b      	ldr	r3, [r3, #4]
     a1e:	4798      	blx	r3
     a20:	e006      	b.n	a30 <cmd_print_hex+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     a22:	4807      	ldr	r0, [pc, #28]	; (a40 <cmd_print_hex+0x44>)
     a24:	f7ff fccc 	bl	3c0 <atoi>
     a28:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     a2a:	4a05      	ldr	r2, [pc, #20]	; (a40 <cmd_print_hex+0x44>)
     a2c:	687b      	ldr	r3, [r7, #4]
     a2e:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_HEX,pad,NUL);
     a30:	4b03      	ldr	r3, [pc, #12]	; (a40 <cmd_print_hex+0x44>)
     a32:	2200      	movs	r2, #0
     a34:	4618      	mov	r0, r3
     a36:	4611      	mov	r1, r2
     a38:	df0a      	svc	10
}
     a3a:	3708      	adds	r7, #8
     a3c:	46bd      	mov	sp, r7
     a3e:	bd80      	pop	{r7, pc}
     a40:	20000064 	.word	0x20000064
     a44:	0000211c 	.word	0x0000211c

00000a48 <cmd_run>:

static void cmd_run(){
     a48:	b580      	push	{r7, lr}
     a4a:	af00      	add	r7, sp, #0
	((fn)proga)();
     a4c:	4b01      	ldr	r3, [pc, #4]	; (a54 <cmd_run+0xc>)
     a4e:	681b      	ldr	r3, [r3, #0]
     a50:	4798      	blx	r3
	
}
     a52:	bd80      	pop	{r7, pc}
     a54:	20000124 	.word	0x20000124

00000a58 <cmd_peek8>:

static void cmd_peek8(){
     a58:	b580      	push	{r7, lr}
     a5a:	b082      	sub	sp, #8
     a5c:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     a5e:	f000 f9ed 	bl	e3c <word>
	u=atoi((const char*)pad);
     a62:	4808      	ldr	r0, [pc, #32]	; (a84 <cmd_peek8+0x2c>)
     a64:	f7ff fcac 	bl	3c0 <atoi>
     a68:	4603      	mov	r3, r0
     a6a:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     a6c:	1d3b      	adds	r3, r7, #4
     a6e:	2200      	movs	r2, #0
     a70:	4618      	mov	r0, r3
     a72:	4611      	mov	r1, r2
     a74:	df0b      	svc	11
	*(uint32_t*)pad=u&0xff;
     a76:	4a03      	ldr	r2, [pc, #12]	; (a84 <cmd_peek8+0x2c>)
     a78:	687b      	ldr	r3, [r7, #4]
     a7a:	b2db      	uxtb	r3, r3
     a7c:	6013      	str	r3, [r2, #0]
}
     a7e:	3708      	adds	r7, #8
     a80:	46bd      	mov	sp, r7
     a82:	bd80      	pop	{r7, pc}
     a84:	20000064 	.word	0x20000064

00000a88 <cmd_peek16>:

static void cmd_peek16(){
     a88:	b580      	push	{r7, lr}
     a8a:	b082      	sub	sp, #8
     a8c:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     a8e:	f000 f9d5 	bl	e3c <word>
	u=atoi((const char*)pad);
     a92:	4808      	ldr	r0, [pc, #32]	; (ab4 <cmd_peek16+0x2c>)
     a94:	f7ff fc94 	bl	3c0 <atoi>
     a98:	4603      	mov	r3, r0
     a9a:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     a9c:	1d3b      	adds	r3, r7, #4
     a9e:	2200      	movs	r2, #0
     aa0:	4618      	mov	r0, r3
     aa2:	4611      	mov	r1, r2
     aa4:	df0c      	svc	12
	*(uint32_t*)pad=u&0xffff;
     aa6:	4a03      	ldr	r2, [pc, #12]	; (ab4 <cmd_peek16+0x2c>)
     aa8:	687b      	ldr	r3, [r7, #4]
     aaa:	b29b      	uxth	r3, r3
     aac:	6013      	str	r3, [r2, #0]
}
     aae:	3708      	adds	r7, #8
     ab0:	46bd      	mov	sp, r7
     ab2:	bd80      	pop	{r7, pc}
     ab4:	20000064 	.word	0x20000064

00000ab8 <cmd_peek32>:

static void cmd_peek32(){
     ab8:	b580      	push	{r7, lr}
     aba:	b082      	sub	sp, #8
     abc:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     abe:	f000 f9bd 	bl	e3c <word>
	u=atoi((const char*)pad);
     ac2:	4808      	ldr	r0, [pc, #32]	; (ae4 <cmd_peek32+0x2c>)
     ac4:	f7ff fc7c 	bl	3c0 <atoi>
     ac8:	4603      	mov	r3, r0
     aca:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK32,&u,NUL);
     acc:	1d3b      	adds	r3, r7, #4
     ace:	2200      	movs	r2, #0
     ad0:	4618      	mov	r0, r3
     ad2:	4611      	mov	r1, r2
     ad4:	df0d      	svc	13
	*(uint32_t*)pad=u;
     ad6:	4a03      	ldr	r2, [pc, #12]	; (ae4 <cmd_peek32+0x2c>)
     ad8:	687b      	ldr	r3, [r7, #4]
     ada:	6013      	str	r3, [r2, #0]
}
     adc:	3708      	adds	r7, #8
     ade:	46bd      	mov	sp, r7
     ae0:	bd80      	pop	{r7, pc}
     ae2:	bf00      	nop
     ae4:	20000064 	.word	0x20000064

00000ae8 <cmd_poke8>:

static void cmd_poke8(){
     ae8:	b580      	push	{r7, lr}
     aea:	b082      	sub	sp, #8
     aec:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     aee:	f000 f9a5 	bl	e3c <word>
	adr=atoi((const char*)pad);
     af2:	480a      	ldr	r0, [pc, #40]	; (b1c <cmd_poke8+0x34>)
     af4:	f7ff fc64 	bl	3c0 <atoi>
     af8:	4603      	mov	r3, r0
     afa:	607b      	str	r3, [r7, #4]
	word();
     afc:	f000 f99e 	bl	e3c <word>
	u8=atoi((const char*)pad);
     b00:	4806      	ldr	r0, [pc, #24]	; (b1c <cmd_poke8+0x34>)
     b02:	f7ff fc5d 	bl	3c0 <atoi>
     b06:	4603      	mov	r3, r0
     b08:	b2db      	uxtb	r3, r3
     b0a:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     b0c:	1d3b      	adds	r3, r7, #4
     b0e:	1cfa      	adds	r2, r7, #3
     b10:	4618      	mov	r0, r3
     b12:	4611      	mov	r1, r2
     b14:	df0e      	svc	14
}
     b16:	3708      	adds	r7, #8
     b18:	46bd      	mov	sp, r7
     b1a:	bd80      	pop	{r7, pc}
     b1c:	20000064 	.word	0x20000064

00000b20 <cmd_poke16>:

static void cmd_poke16(){
     b20:	b580      	push	{r7, lr}
     b22:	b082      	sub	sp, #8
     b24:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     b26:	f000 f989 	bl	e3c <word>
	adr=atoi((const char*)pad);
     b2a:	480a      	ldr	r0, [pc, #40]	; (b54 <cmd_poke16+0x34>)
     b2c:	f7ff fc48 	bl	3c0 <atoi>
     b30:	4603      	mov	r3, r0
     b32:	607b      	str	r3, [r7, #4]
	word();
     b34:	f000 f982 	bl	e3c <word>
	u16=atoi((const char*)pad);
     b38:	4806      	ldr	r0, [pc, #24]	; (b54 <cmd_poke16+0x34>)
     b3a:	f7ff fc41 	bl	3c0 <atoi>
     b3e:	4603      	mov	r3, r0
     b40:	b29b      	uxth	r3, r3
     b42:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     b44:	1d3b      	adds	r3, r7, #4
     b46:	1cba      	adds	r2, r7, #2
     b48:	4618      	mov	r0, r3
     b4a:	4611      	mov	r1, r2
     b4c:	df0f      	svc	15
}
     b4e:	3708      	adds	r7, #8
     b50:	46bd      	mov	sp, r7
     b52:	bd80      	pop	{r7, pc}
     b54:	20000064 	.word	0x20000064

00000b58 <cmd_poke32>:

static void cmd_poke32(){
     b58:	b580      	push	{r7, lr}
     b5a:	b082      	sub	sp, #8
     b5c:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     b5e:	f000 f96d 	bl	e3c <word>
	adr=atoi((const char*)pad);
     b62:	480a      	ldr	r0, [pc, #40]	; (b8c <cmd_poke32+0x34>)
     b64:	f7ff fc2c 	bl	3c0 <atoi>
     b68:	4603      	mov	r3, r0
     b6a:	607b      	str	r3, [r7, #4]
	word();
     b6c:	f000 f966 	bl	e3c <word>
	u32=atoi((const char*)pad);
     b70:	4806      	ldr	r0, [pc, #24]	; (b8c <cmd_poke32+0x34>)
     b72:	f7ff fc25 	bl	3c0 <atoi>
     b76:	4603      	mov	r3, r0
     b78:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     b7a:	1d3b      	adds	r3, r7, #4
     b7c:	463a      	mov	r2, r7
     b7e:	4618      	mov	r0, r3
     b80:	4611      	mov	r1, r2
     b82:	df10      	svc	16
}
     b84:	3708      	adds	r7, #8
     b86:	46bd      	mov	sp, r7
     b88:	bd80      	pop	{r7, pc}
     b8a:	bf00      	nop
     b8c:	20000064 	.word	0x20000064

00000b90 <cmd_fwrite>:

static void cmd_fwrite(){
     b90:	b580      	push	{r7, lr}
     b92:	b082      	sub	sp, #8
     b94:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	word();
     b96:	f000 f951 	bl	e3c <word>
	adr=atoi((const char*)pad);
     b9a:	480d      	ldr	r0, [pc, #52]	; (bd0 <cmd_fwrite+0x40>)
     b9c:	f7ff fc10 	bl	3c0 <atoi>
     ba0:	4603      	mov	r3, r0
     ba2:	607b      	str	r3, [r7, #4]
	word();
     ba4:	f000 f94a 	bl	e3c <word>
	u32=atoi((const char*)pad);
     ba8:	4809      	ldr	r0, [pc, #36]	; (bd0 <cmd_fwrite+0x40>)
     baa:	f7ff fc09 	bl	3c0 <atoi>
     bae:	4603      	mov	r3, r0
     bb0:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_FLASH_WR,&adr,&u32);
     bb2:	1d3b      	adds	r3, r7, #4
     bb4:	463a      	mov	r2, r7
     bb6:	4618      	mov	r0, r3
     bb8:	4611      	mov	r1, r2
     bba:	df11      	svc	17
	if (!adr) print(" failed\n");
     bbc:	687b      	ldr	r3, [r7, #4]
     bbe:	2b00      	cmp	r3, #0
     bc0:	d102      	bne.n	bc8 <cmd_fwrite+0x38>
     bc2:	4804      	ldr	r0, [pc, #16]	; (bd4 <cmd_fwrite+0x44>)
     bc4:	f000 fa96 	bl	10f4 <print>
}
     bc8:	3708      	adds	r7, #8
     bca:	46bd      	mov	sp, r7
     bcc:	bd80      	pop	{r7, pc}
     bce:	bf00      	nop
     bd0:	20000064 	.word	0x20000064
     bd4:	00002070 	.word	0x00002070

00000bd8 <cmd_pgerase>:

static void cmd_pgerase(){
     bd8:	b580      	push	{r7, lr}
     bda:	b082      	sub	sp, #8
     bdc:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     bde:	f000 f92d 	bl	e3c <word>
	adr=atoi((const char*)pad);
     be2:	4809      	ldr	r0, [pc, #36]	; (c08 <cmd_pgerase+0x30>)
     be4:	f7ff fbec 	bl	3c0 <atoi>
     be8:	4603      	mov	r3, r0
     bea:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_FLASH_PGER,&adr,0);
     bec:	1d3b      	adds	r3, r7, #4
     bee:	2200      	movs	r2, #0
     bf0:	4618      	mov	r0, r3
     bf2:	4611      	mov	r1, r2
     bf4:	df12      	svc	18
	if (!adr) print(" failed\n");
     bf6:	687b      	ldr	r3, [r7, #4]
     bf8:	2b00      	cmp	r3, #0
     bfa:	d102      	bne.n	c02 <cmd_pgerase+0x2a>
     bfc:	4803      	ldr	r0, [pc, #12]	; (c0c <cmd_pgerase+0x34>)
     bfe:	f000 fa79 	bl	10f4 <print>
}
     c02:	3708      	adds	r7, #8
     c04:	46bd      	mov	sp, r7
     c06:	bd80      	pop	{r7, pc}
     c08:	20000064 	.word	0x20000064
     c0c:	00002070 	.word	0x00002070

00000c10 <search_command>:
	{"pgerase",cmd_pgerase}, 
	{NUL,NUL}
};


int search_command(const char * name){
     c10:	b580      	push	{r7, lr}
     c12:	b084      	sub	sp, #16
     c14:	af00      	add	r7, sp, #0
     c16:	6078      	str	r0, [r7, #4]
	int i=0;
     c18:	2300      	movs	r3, #0
     c1a:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     c1c:	e00e      	b.n	c3c <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     c1e:	4a12      	ldr	r2, [pc, #72]	; (c68 <search_command+0x58>)
     c20:	68fb      	ldr	r3, [r7, #12]
     c22:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     c26:	4618      	mov	r0, r3
     c28:	6879      	ldr	r1, [r7, #4]
     c2a:	f7ff fb4b 	bl	2c4 <strcmp>
     c2e:	4603      	mov	r3, r0
     c30:	2b00      	cmp	r3, #0
     c32:	d100      	bne.n	c36 <search_command+0x26>
			break;
     c34:	e009      	b.n	c4a <search_command+0x3a>
		}
		i++;
     c36:	68fb      	ldr	r3, [r7, #12]
     c38:	3301      	adds	r3, #1
     c3a:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     c3c:	4a0a      	ldr	r2, [pc, #40]	; (c68 <search_command+0x58>)
     c3e:	68fb      	ldr	r3, [r7, #12]
     c40:	00db      	lsls	r3, r3, #3
     c42:	4413      	add	r3, r2
     c44:	685b      	ldr	r3, [r3, #4]
     c46:	2b00      	cmp	r3, #0
     c48:	d1e9      	bne.n	c1e <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     c4a:	4a07      	ldr	r2, [pc, #28]	; (c68 <search_command+0x58>)
     c4c:	68fb      	ldr	r3, [r7, #12]
     c4e:	00db      	lsls	r3, r3, #3
     c50:	4413      	add	r3, r2
     c52:	685b      	ldr	r3, [r3, #4]
     c54:	2b00      	cmp	r3, #0
     c56:	d102      	bne.n	c5e <search_command+0x4e>
     c58:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     c5c:	60fb      	str	r3, [r7, #12]
	return i;
     c5e:	68fb      	ldr	r3, [r7, #12]
}
     c60:	4618      	mov	r0, r3
     c62:	3710      	adds	r7, #16
     c64:	46bd      	mov	sp, r7
     c66:	bd80      	pop	{r7, pc}
     c68:	0000211c 	.word	0x0000211c

00000c6c <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     c6c:	b480      	push	{r7}
     c6e:	b085      	sub	sp, #20
     c70:	af00      	add	r7, sp, #0
     c72:	60f8      	str	r0, [r7, #12]
     c74:	60b9      	str	r1, [r7, #8]
     c76:	4613      	mov	r3, r2
     c78:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     c7a:	e002      	b.n	c82 <skip+0x16>
     c7c:	68bb      	ldr	r3, [r7, #8]
     c7e:	3301      	adds	r3, #1
     c80:	60bb      	str	r3, [r7, #8]
     c82:	68bb      	ldr	r3, [r7, #8]
     c84:	68fa      	ldr	r2, [r7, #12]
     c86:	4413      	add	r3, r2
     c88:	781b      	ldrb	r3, [r3, #0]
     c8a:	2b00      	cmp	r3, #0
     c8c:	d006      	beq.n	c9c <skip+0x30>
     c8e:	68bb      	ldr	r3, [r7, #8]
     c90:	68fa      	ldr	r2, [r7, #12]
     c92:	4413      	add	r3, r2
     c94:	781b      	ldrb	r3, [r3, #0]
     c96:	79fa      	ldrb	r2, [r7, #7]
     c98:	429a      	cmp	r2, r3
     c9a:	d0ef      	beq.n	c7c <skip+0x10>
	return start;
     c9c:	68bb      	ldr	r3, [r7, #8]
}
     c9e:	4618      	mov	r0, r3
     ca0:	3714      	adds	r7, #20
     ca2:	46bd      	mov	sp, r7
     ca4:	f85d 7b04 	ldr.w	r7, [sp], #4
     ca8:	4770      	bx	lr
     caa:	bf00      	nop

00000cac <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     cac:	b480      	push	{r7}
     cae:	b085      	sub	sp, #20
     cb0:	af00      	add	r7, sp, #0
     cb2:	60f8      	str	r0, [r7, #12]
     cb4:	60b9      	str	r1, [r7, #8]
     cb6:	4613      	mov	r3, r2
     cb8:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     cba:	e002      	b.n	cc2 <scan+0x16>
     cbc:	68bb      	ldr	r3, [r7, #8]
     cbe:	3301      	adds	r3, #1
     cc0:	60bb      	str	r3, [r7, #8]
     cc2:	68bb      	ldr	r3, [r7, #8]
     cc4:	68fa      	ldr	r2, [r7, #12]
     cc6:	4413      	add	r3, r2
     cc8:	781b      	ldrb	r3, [r3, #0]
     cca:	2b00      	cmp	r3, #0
     ccc:	d006      	beq.n	cdc <scan+0x30>
     cce:	68bb      	ldr	r3, [r7, #8]
     cd0:	68fa      	ldr	r2, [r7, #12]
     cd2:	4413      	add	r3, r2
     cd4:	781b      	ldrb	r3, [r3, #0]
     cd6:	79fa      	ldrb	r2, [r7, #7]
     cd8:	429a      	cmp	r2, r3
     cda:	d1ef      	bne.n	cbc <scan+0x10>
	return start;
     cdc:	68bb      	ldr	r3, [r7, #8]
}
     cde:	4618      	mov	r0, r3
     ce0:	3714      	adds	r7, #20
     ce2:	46bd      	mov	sp, r7
     ce4:	f85d 7b04 	ldr.w	r7, [sp], #4
     ce8:	4770      	bx	lr
     cea:	bf00      	nop

00000cec <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     cec:	b480      	push	{r7}
     cee:	b087      	sub	sp, #28
     cf0:	af00      	add	r7, sp, #0
     cf2:	6078      	str	r0, [r7, #4]
     cf4:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     cf6:	2300      	movs	r3, #0
     cf8:	617b      	str	r3, [r7, #20]
     cfa:	683b      	ldr	r3, [r7, #0]
     cfc:	613b      	str	r3, [r7, #16]
     cfe:	2300      	movs	r3, #0
     d00:	60fb      	str	r3, [r7, #12]
     d02:	2301      	movs	r3, #1
     d04:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     d06:	e040      	b.n	d8a <quote+0x9e>
		switch (buffer[end]){
     d08:	693b      	ldr	r3, [r7, #16]
     d0a:	687a      	ldr	r2, [r7, #4]
     d0c:	4413      	add	r3, r2
     d0e:	781b      	ldrb	r3, [r3, #0]
     d10:	2b5c      	cmp	r3, #92	; 0x5c
     d12:	d012      	beq.n	d3a <quote+0x4e>
     d14:	2b6e      	cmp	r3, #110	; 0x6e
     d16:	d022      	beq.n	d5e <quote+0x72>
     d18:	2b22      	cmp	r3, #34	; 0x22
     d1a:	d128      	bne.n	d6e <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     d1c:	697b      	ldr	r3, [r7, #20]
     d1e:	2b00      	cmp	r3, #0
     d20:	d102      	bne.n	d28 <quote+0x3c>
     d22:	2300      	movs	r3, #0
     d24:	60bb      	str	r3, [r7, #8]
			break;
     d26:	e02d      	b.n	d84 <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     d28:	68fb      	ldr	r3, [r7, #12]
     d2a:	1c5a      	adds	r2, r3, #1
     d2c:	60fa      	str	r2, [r7, #12]
     d2e:	4a21      	ldr	r2, [pc, #132]	; (db4 <quote+0xc8>)
     d30:	2122      	movs	r1, #34	; 0x22
     d32:	54d1      	strb	r1, [r2, r3]
     d34:	2300      	movs	r3, #0
     d36:	617b      	str	r3, [r7, #20]
			break;
     d38:	e024      	b.n	d84 <quote+0x98>
		case '\\':
			if (!escaped){
     d3a:	697b      	ldr	r3, [r7, #20]
     d3c:	2b00      	cmp	r3, #0
     d3e:	d102      	bne.n	d46 <quote+0x5a>
				escaped=1;
     d40:	2301      	movs	r3, #1
     d42:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     d44:	e01e      	b.n	d84 <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     d46:	2300      	movs	r3, #0
     d48:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     d4a:	68fb      	ldr	r3, [r7, #12]
     d4c:	1c5a      	adds	r2, r3, #1
     d4e:	60fa      	str	r2, [r7, #12]
     d50:	693a      	ldr	r2, [r7, #16]
     d52:	6879      	ldr	r1, [r7, #4]
     d54:	440a      	add	r2, r1
     d56:	7811      	ldrb	r1, [r2, #0]
     d58:	4a16      	ldr	r2, [pc, #88]	; (db4 <quote+0xc8>)
     d5a:	54d1      	strb	r1, [r2, r3]
			}
			break;
     d5c:	e012      	b.n	d84 <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     d5e:	697b      	ldr	r3, [r7, #20]
     d60:	2b00      	cmp	r3, #0
     d62:	d004      	beq.n	d6e <quote+0x82>
     d64:	693b      	ldr	r3, [r7, #16]
     d66:	687a      	ldr	r2, [r7, #4]
     d68:	4413      	add	r3, r2
     d6a:	220d      	movs	r2, #13
     d6c:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     d6e:	2300      	movs	r3, #0
     d70:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     d72:	68fb      	ldr	r3, [r7, #12]
     d74:	1c5a      	adds	r2, r3, #1
     d76:	60fa      	str	r2, [r7, #12]
     d78:	693a      	ldr	r2, [r7, #16]
     d7a:	6879      	ldr	r1, [r7, #4]
     d7c:	440a      	add	r2, r1
     d7e:	7811      	ldrb	r1, [r2, #0]
     d80:	4a0c      	ldr	r2, [pc, #48]	; (db4 <quote+0xc8>)
     d82:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     d84:	693b      	ldr	r3, [r7, #16]
     d86:	3301      	adds	r3, #1
     d88:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     d8a:	693b      	ldr	r3, [r7, #16]
     d8c:	687a      	ldr	r2, [r7, #4]
     d8e:	4413      	add	r3, r2
     d90:	781b      	ldrb	r3, [r3, #0]
     d92:	2b00      	cmp	r3, #0
     d94:	d002      	beq.n	d9c <quote+0xb0>
     d96:	68bb      	ldr	r3, [r7, #8]
     d98:	2b00      	cmp	r3, #0
     d9a:	d1b5      	bne.n	d08 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     d9c:	4a05      	ldr	r2, [pc, #20]	; (db4 <quote+0xc8>)
     d9e:	68fb      	ldr	r3, [r7, #12]
     da0:	4413      	add	r3, r2
     da2:	2200      	movs	r2, #0
     da4:	701a      	strb	r2, [r3, #0]
	return end;
     da6:	693b      	ldr	r3, [r7, #16]
}
     da8:	4618      	mov	r0, r3
     daa:	371c      	adds	r7, #28
     dac:	46bd      	mov	sp, r7
     dae:	f85d 7b04 	ldr.w	r7, [sp], #4
     db2:	4770      	bx	lr
     db4:	20000064 	.word	0x20000064

00000db8 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     db8:	b480      	push	{r7}
     dba:	b087      	sub	sp, #28
     dbc:	af00      	add	r7, sp, #0
     dbe:	60f8      	str	r0, [r7, #12]
     dc0:	60b9      	str	r1, [r7, #8]
     dc2:	4613      	mov	r3, r2
     dc4:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     dc6:	68bb      	ldr	r3, [r7, #8]
     dc8:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     dca:	e002      	b.n	dd2 <next+0x1a>
     dcc:	697b      	ldr	r3, [r7, #20]
     dce:	3301      	adds	r3, #1
     dd0:	617b      	str	r3, [r7, #20]
     dd2:	697b      	ldr	r3, [r7, #20]
     dd4:	68fa      	ldr	r2, [r7, #12]
     dd6:	4413      	add	r3, r2
     dd8:	781b      	ldrb	r3, [r3, #0]
     dda:	2b00      	cmp	r3, #0
     ddc:	d006      	beq.n	dec <next+0x34>
     dde:	697b      	ldr	r3, [r7, #20]
     de0:	68fa      	ldr	r2, [r7, #12]
     de2:	4413      	add	r3, r2
     de4:	781b      	ldrb	r3, [r3, #0]
     de6:	79fa      	ldrb	r2, [r7, #7]
     de8:	429a      	cmp	r2, r3
     dea:	d1ef      	bne.n	dcc <next+0x14>
	return end-start;
     dec:	697a      	ldr	r2, [r7, #20]
     dee:	68bb      	ldr	r3, [r7, #8]
     df0:	1ad3      	subs	r3, r2, r3
}
     df2:	4618      	mov	r0, r3
     df4:	371c      	adds	r7, #28
     df6:	46bd      	mov	sp, r7
     df8:	f85d 7b04 	ldr.w	r7, [sp], #4
     dfc:	4770      	bx	lr
     dfe:	bf00      	nop

00000e00 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     e00:	b480      	push	{r7}
     e02:	b085      	sub	sp, #20
     e04:	af00      	add	r7, sp, #0
     e06:	60f8      	str	r0, [r7, #12]
     e08:	60b9      	str	r1, [r7, #8]
     e0a:	607a      	str	r2, [r7, #4]
	while (len){
     e0c:	e00a      	b.n	e24 <move+0x24>
		*dest++=*src++;
     e0e:	68bb      	ldr	r3, [r7, #8]
     e10:	1c5a      	adds	r2, r3, #1
     e12:	60ba      	str	r2, [r7, #8]
     e14:	68fa      	ldr	r2, [r7, #12]
     e16:	1c51      	adds	r1, r2, #1
     e18:	60f9      	str	r1, [r7, #12]
     e1a:	7812      	ldrb	r2, [r2, #0]
     e1c:	701a      	strb	r2, [r3, #0]
		len--;
     e1e:	687b      	ldr	r3, [r7, #4]
     e20:	3b01      	subs	r3, #1
     e22:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     e24:	687b      	ldr	r3, [r7, #4]
     e26:	2b00      	cmp	r3, #0
     e28:	d1f1      	bne.n	e0e <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     e2a:	68bb      	ldr	r3, [r7, #8]
     e2c:	2200      	movs	r2, #0
     e2e:	701a      	strb	r2, [r3, #0]
}
     e30:	3714      	adds	r7, #20
     e32:	46bd      	mov	sp, r7
     e34:	f85d 7b04 	ldr.w	r7, [sp], #4
     e38:	4770      	bx	lr
     e3a:	bf00      	nop

00000e3c <word>:

// extrait le prochain mot du tib
static void word(){
     e3c:	b580      	push	{r7, lr}
     e3e:	b082      	sub	sp, #8
     e40:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     e42:	4b1d      	ldr	r3, [pc, #116]	; (eb8 <word+0x7c>)
     e44:	681b      	ldr	r3, [r3, #0]
     e46:	481d      	ldr	r0, [pc, #116]	; (ebc <word+0x80>)
     e48:	4619      	mov	r1, r3
     e4a:	2220      	movs	r2, #32
     e4c:	f7ff ff0e 	bl	c6c <skip>
     e50:	4603      	mov	r3, r0
     e52:	461a      	mov	r2, r3
     e54:	4b18      	ldr	r3, [pc, #96]	; (eb8 <word+0x7c>)
     e56:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     e58:	4b17      	ldr	r3, [pc, #92]	; (eb8 <word+0x7c>)
     e5a:	681b      	ldr	r3, [r3, #0]
     e5c:	4a17      	ldr	r2, [pc, #92]	; (ebc <word+0x80>)
     e5e:	5cd3      	ldrb	r3, [r2, r3]
     e60:	2b22      	cmp	r3, #34	; 0x22
     e62:	d10f      	bne.n	e84 <word+0x48>
			in++;
     e64:	4b14      	ldr	r3, [pc, #80]	; (eb8 <word+0x7c>)
     e66:	681b      	ldr	r3, [r3, #0]
     e68:	3301      	adds	r3, #1
     e6a:	4a13      	ldr	r2, [pc, #76]	; (eb8 <word+0x7c>)
     e6c:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     e6e:	4b12      	ldr	r3, [pc, #72]	; (eb8 <word+0x7c>)
     e70:	681b      	ldr	r3, [r3, #0]
     e72:	4812      	ldr	r0, [pc, #72]	; (ebc <word+0x80>)
     e74:	4619      	mov	r1, r3
     e76:	f7ff ff39 	bl	cec <quote>
     e7a:	4603      	mov	r3, r0
     e7c:	461a      	mov	r2, r3
     e7e:	4b0e      	ldr	r3, [pc, #56]	; (eb8 <word+0x7c>)
     e80:	601a      	str	r2, [r3, #0]
     e82:	e016      	b.n	eb2 <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     e84:	4b0c      	ldr	r3, [pc, #48]	; (eb8 <word+0x7c>)
     e86:	681b      	ldr	r3, [r3, #0]
     e88:	480c      	ldr	r0, [pc, #48]	; (ebc <word+0x80>)
     e8a:	4619      	mov	r1, r3
     e8c:	2220      	movs	r2, #32
     e8e:	f7ff ff93 	bl	db8 <next>
     e92:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     e94:	4b08      	ldr	r3, [pc, #32]	; (eb8 <word+0x7c>)
     e96:	681b      	ldr	r3, [r3, #0]
     e98:	4a08      	ldr	r2, [pc, #32]	; (ebc <word+0x80>)
     e9a:	4413      	add	r3, r2
     e9c:	4618      	mov	r0, r3
     e9e:	4908      	ldr	r1, [pc, #32]	; (ec0 <word+0x84>)
     ea0:	687a      	ldr	r2, [r7, #4]
     ea2:	f7ff ffad 	bl	e00 <move>
			in+=len;
     ea6:	4b04      	ldr	r3, [pc, #16]	; (eb8 <word+0x7c>)
     ea8:	681a      	ldr	r2, [r3, #0]
     eaa:	687b      	ldr	r3, [r7, #4]
     eac:	4413      	add	r3, r2
     eae:	4a02      	ldr	r2, [pc, #8]	; (eb8 <word+0x7c>)
     eb0:	6013      	str	r3, [r2, #0]
		}
}
     eb2:	3708      	adds	r7, #8
     eb4:	46bd      	mov	sp, r7
     eb6:	bd80      	pop	{r7, pc}
     eb8:	200000b4 	.word	0x200000b4
     ebc:	20000014 	.word	0x20000014
     ec0:	20000064 	.word	0x20000064

00000ec4 <parse_line>:

static void parse_line(unsigned llen){
     ec4:	b580      	push	{r7, lr}
     ec6:	b084      	sub	sp, #16
     ec8:	af00      	add	r7, sp, #0
     eca:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     ecc:	4b14      	ldr	r3, [pc, #80]	; (f20 <parse_line+0x5c>)
     ece:	2200      	movs	r2, #0
     ed0:	601a      	str	r2, [r3, #0]
	while (in<llen){
     ed2:	e019      	b.n	f08 <parse_line+0x44>
		word();
     ed4:	f7ff ffb2 	bl	e3c <word>
		cmd_id=search_command((const char*) pad);
     ed8:	4812      	ldr	r0, [pc, #72]	; (f24 <parse_line+0x60>)
     eda:	f7ff fe99 	bl	c10 <search_command>
     ede:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     ee0:	68fb      	ldr	r3, [r7, #12]
     ee2:	2b00      	cmp	r3, #0
     ee4:	db06      	blt.n	ef4 <parse_line+0x30>
			commands[cmd_id].fn();
     ee6:	4a10      	ldr	r2, [pc, #64]	; (f28 <parse_line+0x64>)
     ee8:	68fb      	ldr	r3, [r7, #12]
     eea:	00db      	lsls	r3, r3, #3
     eec:	4413      	add	r3, r2
     eee:	685b      	ldr	r3, [r3, #4]
     ef0:	4798      	blx	r3
     ef2:	e009      	b.n	f08 <parse_line+0x44>
		}else{
			conout(CR);
     ef4:	200d      	movs	r0, #13
     ef6:	f000 f8cb 	bl	1090 <conout>
			print((const char*)pad); conout('?');
     efa:	480a      	ldr	r0, [pc, #40]	; (f24 <parse_line+0x60>)
     efc:	f000 f8fa 	bl	10f4 <print>
     f00:	203f      	movs	r0, #63	; 0x3f
     f02:	f000 f8c5 	bl	1090 <conout>
			break;
     f06:	e004      	b.n	f12 <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     f08:	4b05      	ldr	r3, [pc, #20]	; (f20 <parse_line+0x5c>)
     f0a:	681a      	ldr	r2, [r3, #0]
     f0c:	687b      	ldr	r3, [r7, #4]
     f0e:	429a      	cmp	r2, r3
     f10:	d3e0      	bcc.n	ed4 <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     f12:	200d      	movs	r0, #13
     f14:	f000 f8bc 	bl	1090 <conout>
}
     f18:	3710      	adds	r7, #16
     f1a:	46bd      	mov	sp, r7
     f1c:	bd80      	pop	{r7, pc}
     f1e:	bf00      	nop
     f20:	200000b4 	.word	0x200000b4
     f24:	20000064 	.word	0x20000064
     f28:	0000211c 	.word	0x0000211c

00000f2c <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     f2c:	b480      	push	{r7}
     f2e:	b085      	sub	sp, #20
     f30:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     f32:	4b0c      	ldr	r3, [pc, #48]	; (f64 <copy_blink_in_ram+0x38>)
     f34:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     f36:	4b0c      	ldr	r3, [pc, #48]	; (f68 <copy_blink_in_ram+0x3c>)
     f38:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     f3a:	4b0c      	ldr	r3, [pc, #48]	; (f6c <copy_blink_in_ram+0x40>)
     f3c:	60bb      	str	r3, [r7, #8]
	while (start<end){
     f3e:	e007      	b.n	f50 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     f40:	68bb      	ldr	r3, [r7, #8]
     f42:	1d1a      	adds	r2, r3, #4
     f44:	60ba      	str	r2, [r7, #8]
     f46:	68fa      	ldr	r2, [r7, #12]
     f48:	1d11      	adds	r1, r2, #4
     f4a:	60f9      	str	r1, [r7, #12]
     f4c:	6812      	ldr	r2, [r2, #0]
     f4e:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     f50:	68fa      	ldr	r2, [r7, #12]
     f52:	687b      	ldr	r3, [r7, #4]
     f54:	429a      	cmp	r2, r3
     f56:	d3f3      	bcc.n	f40 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     f58:	3714      	adds	r7, #20
     f5a:	46bd      	mov	sp, r7
     f5c:	f85d 7b04 	ldr.w	r7, [sp], #4
     f60:	4770      	bx	lr
     f62:	bf00      	nop
     f64:	00002560 	.word	0x00002560
     f68:	000025e0 	.word	0x000025e0
     f6c:	20000aa0 	.word	0x20000aa0

00000f70 <main>:

extern void print_fault(const char *msg, sfrp_t adr);

void main(void){
     f70:	b580      	push	{r7, lr}
     f72:	b082      	sub	sp, #8
     f74:	af00      	add	r7, sp, #0
	set_sysclock();
     f76:	f7ff fbfd 	bl	774 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     f7a:	f06f 000a 	mvn.w	r0, #10
     f7e:	210f      	movs	r1, #15
     f80:	f000 fbfe 	bl	1780 <set_int_priority>
	config_systicks();
     f84:	f7ff fc3e 	bl	804 <config_systicks>
	flash_enable();
     f88:	f000 fa92 	bl	14b0 <flash_enable>
	//port_c_setup();
	APB2ENR->fld.iopcen=1;
     f8c:	4a24      	ldr	r2, [pc, #144]	; (1020 <main+0xb0>)
     f8e:	7813      	ldrb	r3, [r2, #0]
     f90:	f043 0310 	orr.w	r3, r3, #16
     f94:	7013      	strb	r3, [r2, #0]
	APB2ENR->fld.iopaen=1;
     f96:	4a22      	ldr	r2, [pc, #136]	; (1020 <main+0xb0>)
     f98:	7813      	ldrb	r3, [r2, #0]
     f9a:	f043 0304 	orr.w	r3, r3, #4
     f9e:	7013      	strb	r3, [r2, #0]
	APB2ENR->fld.iopben=1;
     fa0:	4a1f      	ldr	r2, [pc, #124]	; (1020 <main+0xb0>)
     fa2:	7813      	ldrb	r3, [r2, #0]
     fa4:	f043 0308 	orr.w	r3, r3, #8
     fa8:	7013      	strb	r3, [r2, #0]
	APB2ENR->fld.afioen=1;
     faa:	4a1d      	ldr	r2, [pc, #116]	; (1020 <main+0xb0>)
     fac:	7813      	ldrb	r3, [r2, #0]
     fae:	f043 0301 	orr.w	r3, r3, #1
     fb2:	7013      	strb	r3, [r2, #0]
	APB1ENR->fld.spi2en=1;
     fb4:	4a1b      	ldr	r2, [pc, #108]	; (1024 <main+0xb4>)
     fb6:	7853      	ldrb	r3, [r2, #1]
     fb8:	f043 0340 	orr.w	r3, r3, #64	; 0x40
     fbc:	7053      	strb	r3, [r2, #1]
	config_pin(GPIOC,LED_PIN,OUTPUT_OD_SLOW);
     fbe:	2002      	movs	r0, #2
     fc0:	210d      	movs	r1, #13
     fc2:	2206      	movs	r2, #6
     fc4:	f000 fb50 	bl	1668 <config_pin>
	tvout_init();
     fc8:	f000 fd6a 	bl	1aa0 <tvout_init>
	uart_open_channel(CON,115200,FLOW_HARD);
     fcc:	4816      	ldr	r0, [pc, #88]	; (1028 <main+0xb8>)
     fce:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     fd2:	2201      	movs	r2, #1
     fd4:	f000 ff64 	bl	1ea0 <uart_open_channel>
	cls();
     fd8:	f000 f8bc 	bl	1154 <cls>
	print(VERSION); 
     fdc:	4b13      	ldr	r3, [pc, #76]	; (102c <main+0xbc>)
     fde:	681b      	ldr	r3, [r3, #0]
     fe0:	4618      	mov	r0, r3
     fe2:	f000 f887 	bl	10f4 <print>
	copy_blink_in_ram();
     fe6:	f7ff ffa1 	bl	f2c <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
     fea:	4811      	ldr	r0, [pc, #68]	; (1030 <main+0xc0>)
     fec:	f000 f882 	bl	10f4 <print>
     ff0:	4b10      	ldr	r3, [pc, #64]	; (1034 <main+0xc4>)
     ff2:	2200      	movs	r2, #0
     ff4:	4618      	mov	r0, r3
     ff6:	4611      	mov	r1, r2
     ff8:	df0a      	svc	10
     ffa:	200d      	movs	r0, #13
     ffc:	f000 f848 	bl	1090 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
    1000:	2300      	movs	r3, #0
    1002:	2200      	movs	r2, #0
    1004:	4618      	mov	r0, r3
    1006:	4611      	mov	r1, r2
    1008:	df01      	svc	1
	flush_rx_queue();
    100a:	f000 fa43 	bl	1494 <flush_rx_queue>
	unsigned llen;// char c;
	while (1){ // if ((c=conin())) conout(c);
		llen=read_line(tib,CMD_MAX_LEN);
    100e:	480a      	ldr	r0, [pc, #40]	; (1038 <main+0xc8>)
    1010:	2150      	movs	r1, #80	; 0x50
    1012:	f000 f8c5 	bl	11a0 <read_line>
    1016:	6078      	str	r0, [r7, #4]
		parse_line(llen);
    1018:	6878      	ldr	r0, [r7, #4]
    101a:	f7ff ff53 	bl	ec4 <parse_line>
	}
    101e:	e7f6      	b.n	100e <main+0x9e>
    1020:	40021018 	.word	0x40021018
    1024:	4002101c 	.word	0x4002101c
    1028:	40004400 	.word	0x40004400
    102c:	20000000 	.word	0x20000000
    1030:	000021c4 	.word	0x000021c4
    1034:	20000124 	.word	0x20000124
    1038:	20000014 	.word	0x20000014

0000103c <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
    103c:	4668      	mov	r0, sp
    103e:	f020 0107 	bic.w	r1, r0, #7
    1042:	468d      	mov	sp, r1
    1044:	b481      	push	{r0, r7}
    1046:	af00      	add	r7, sp, #0
	if (USART2_SR&(1<<USART_SR_RXNE)){
    1048:	4b0e      	ldr	r3, [pc, #56]	; (1084 <USART2_handler+0x48>)
    104a:	681b      	ldr	r3, [r3, #0]
    104c:	f003 0320 	and.w	r3, r3, #32
    1050:	2b00      	cmp	r3, #0
    1052:	d012      	beq.n	107a <USART2_handler+0x3e>
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
    1054:	4b0c      	ldr	r3, [pc, #48]	; (1088 <USART2_handler+0x4c>)
    1056:	6a1b      	ldr	r3, [r3, #32]
    1058:	1c5a      	adds	r2, r3, #1
    105a:	490b      	ldr	r1, [pc, #44]	; (1088 <USART2_handler+0x4c>)
    105c:	620a      	str	r2, [r1, #32]
    105e:	4a0b      	ldr	r2, [pc, #44]	; (108c <USART2_handler+0x50>)
    1060:	6812      	ldr	r2, [r2, #0]
    1062:	b2d2      	uxtb	r2, r2
    1064:	f002 027f 	and.w	r2, r2, #127	; 0x7f
    1068:	b2d1      	uxtb	r1, r2
    106a:	4a07      	ldr	r2, [pc, #28]	; (1088 <USART2_handler+0x4c>)
    106c:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
    106e:	4b06      	ldr	r3, [pc, #24]	; (1088 <USART2_handler+0x4c>)
    1070:	6a1b      	ldr	r3, [r3, #32]
    1072:	f003 031f 	and.w	r3, r3, #31
    1076:	4a04      	ldr	r2, [pc, #16]	; (1088 <USART2_handler+0x4c>)
    1078:	6213      	str	r3, [r2, #32]
	}
}
    107a:	46bd      	mov	sp, r7
    107c:	bc81      	pop	{r0, r7}
    107e:	4685      	mov	sp, r0
    1080:	4770      	bx	lr
    1082:	bf00      	nop
    1084:	40004400 	.word	0x40004400
    1088:	200000b8 	.word	0x200000b8
    108c:	40004404 	.word	0x40004404

00001090 <conout>:


// envoie d'un caractère à la console
void conout(char c){
    1090:	b580      	push	{r7, lr}
    1092:	b082      	sub	sp, #8
    1094:	af00      	add	r7, sp, #0
    1096:	4603      	mov	r3, r0
    1098:	71fb      	strb	r3, [r7, #7]
	uart_putc(CON,c);
    109a:	79fb      	ldrb	r3, [r7, #7]
    109c:	4803      	ldr	r0, [pc, #12]	; (10ac <conout+0x1c>)
    109e:	4619      	mov	r1, r3
    10a0:	f000 ffc0 	bl	2024 <uart_putc>
}
    10a4:	3708      	adds	r7, #8
    10a6:	46bd      	mov	sp, r7
    10a8:	bd80      	pop	{r7, pc}
    10aa:	bf00      	nop
    10ac:	40004400 	.word	0x40004400

000010b0 <conin>:


// réception d'un caractère de la console
char conin(){
    10b0:	b480      	push	{r7}
    10b2:	b083      	sub	sp, #12
    10b4:	af00      	add	r7, sp, #0
	char c=0;
    10b6:	2300      	movs	r3, #0
    10b8:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
    10ba:	4b0d      	ldr	r3, [pc, #52]	; (10f0 <conin+0x40>)
    10bc:	6a1a      	ldr	r2, [r3, #32]
    10be:	4b0c      	ldr	r3, [pc, #48]	; (10f0 <conin+0x40>)
    10c0:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10c2:	429a      	cmp	r2, r3
    10c4:	d00d      	beq.n	10e2 <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
    10c6:	4b0a      	ldr	r3, [pc, #40]	; (10f0 <conin+0x40>)
    10c8:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10ca:	1c5a      	adds	r2, r3, #1
    10cc:	4908      	ldr	r1, [pc, #32]	; (10f0 <conin+0x40>)
    10ce:	624a      	str	r2, [r1, #36]	; 0x24
    10d0:	4a07      	ldr	r2, [pc, #28]	; (10f0 <conin+0x40>)
    10d2:	5cd3      	ldrb	r3, [r2, r3]
    10d4:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
    10d6:	4b06      	ldr	r3, [pc, #24]	; (10f0 <conin+0x40>)
    10d8:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10da:	f003 031f 	and.w	r3, r3, #31
    10de:	4a04      	ldr	r2, [pc, #16]	; (10f0 <conin+0x40>)
    10e0:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
    10e2:	79fb      	ldrb	r3, [r7, #7]
}
    10e4:	4618      	mov	r0, r3
    10e6:	370c      	adds	r7, #12
    10e8:	46bd      	mov	sp, r7
    10ea:	f85d 7b04 	ldr.w	r7, [sp], #4
    10ee:	4770      	bx	lr
    10f0:	200000b8 	.word	0x200000b8

000010f4 <print>:

// imprime un chaîne sur la console
void print(const char *str){
    10f4:	b580      	push	{r7, lr}
    10f6:	b082      	sub	sp, #8
    10f8:	af00      	add	r7, sp, #0
    10fa:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
    10fc:	e006      	b.n	110c <print+0x18>
    10fe:	687b      	ldr	r3, [r7, #4]
    1100:	1c5a      	adds	r2, r3, #1
    1102:	607a      	str	r2, [r7, #4]
    1104:	781b      	ldrb	r3, [r3, #0]
    1106:	4618      	mov	r0, r3
    1108:	f7ff ffc2 	bl	1090 <conout>
    110c:	687b      	ldr	r3, [r7, #4]
    110e:	781b      	ldrb	r3, [r3, #0]
    1110:	2b00      	cmp	r3, #0
    1112:	d1f4      	bne.n	10fe <print+0xa>
}
    1114:	3708      	adds	r7, #8
    1116:	46bd      	mov	sp, r7
    1118:	bd80      	pop	{r7, pc}
    111a:	bf00      	nop

0000111c <beep>:

void beep(){
    111c:	b480      	push	{r7}
    111e:	af00      	add	r7, sp, #0
}
    1120:	46bd      	mov	sp, r7
    1122:	f85d 7b04 	ldr.w	r7, [sp], #4
    1126:	4770      	bx	lr

00001128 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    1128:	b580      	push	{r7, lr}
    112a:	af00      	add	r7, sp, #0
	conout(BS);
    112c:	2008      	movs	r0, #8
    112e:	f7ff ffaf 	bl	1090 <conout>
	conout(SPACE);
    1132:	2020      	movs	r0, #32
    1134:	f7ff ffac 	bl	1090 <conout>
	conout(BS);
    1138:	2008      	movs	r0, #8
    113a:	f7ff ffa9 	bl	1090 <conout>
}
    113e:	bd80      	pop	{r7, pc}

00001140 <esc_seq>:

void esc_seq(){
    1140:	b580      	push	{r7, lr}
    1142:	af00      	add	r7, sp, #0
	conout(ESC);
    1144:	201b      	movs	r0, #27
    1146:	f7ff ffa3 	bl	1090 <conout>
	conout('[');
    114a:	205b      	movs	r0, #91	; 0x5b
    114c:	f7ff ffa0 	bl	1090 <conout>
}
    1150:	bd80      	pop	{r7, pc}
    1152:	bf00      	nop

00001154 <cls>:

// vide l'écran de la console
void cls(){
    1154:	b580      	push	{r7, lr}
    1156:	af00      	add	r7, sp, #0
	esc_seq();
    1158:	f7ff fff2 	bl	1140 <esc_seq>
	conout('2');
    115c:	2032      	movs	r0, #50	; 0x32
    115e:	f7ff ff97 	bl	1090 <conout>
	conout('J');
    1162:	204a      	movs	r0, #74	; 0x4a
    1164:	f7ff ff94 	bl	1090 <conout>
}
    1168:	bd80      	pop	{r7, pc}
    116a:	bf00      	nop

0000116c <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
    116c:	b580      	push	{r7, lr}
    116e:	b082      	sub	sp, #8
    1170:	af00      	add	r7, sp, #0
    1172:	6078      	str	r0, [r7, #4]
	esc_seq();
    1174:	f7ff ffe4 	bl	1140 <esc_seq>
	conout('2');
    1178:	2032      	movs	r0, #50	; 0x32
    117a:	f7ff ff89 	bl	1090 <conout>
	conout('K');
    117e:	204b      	movs	r0, #75	; 0x4b
    1180:	f7ff ff86 	bl	1090 <conout>
	while (n){conout(BS);n--;}
    1184:	e005      	b.n	1192 <clear_line+0x26>
    1186:	2008      	movs	r0, #8
    1188:	f7ff ff82 	bl	1090 <conout>
    118c:	687b      	ldr	r3, [r7, #4]
    118e:	3b01      	subs	r3, #1
    1190:	607b      	str	r3, [r7, #4]
    1192:	687b      	ldr	r3, [r7, #4]
    1194:	2b00      	cmp	r3, #0
    1196:	d1f6      	bne.n	1186 <clear_line+0x1a>
}
    1198:	3708      	adds	r7, #8
    119a:	46bd      	mov	sp, r7
    119c:	bd80      	pop	{r7, pc}
    119e:	bf00      	nop

000011a0 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    11a0:	b580      	push	{r7, lr}
    11a2:	b084      	sub	sp, #16
    11a4:	af00      	add	r7, sp, #0
    11a6:	6078      	str	r0, [r7, #4]
    11a8:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    11aa:	2300      	movs	r3, #0
    11ac:	60fb      	str	r3, [r7, #12]
	char c=0;
    11ae:	2300      	movs	r3, #0
    11b0:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    11b2:	683b      	ldr	r3, [r7, #0]
    11b4:	3b01      	subs	r3, #1
    11b6:	603b      	str	r3, [r7, #0]
	while (c!=13){
    11b8:	e08e      	b.n	12d8 <read_line+0x138>
			c=conin();
    11ba:	f7ff ff79 	bl	10b0 <conin>
    11be:	4603      	mov	r3, r0
    11c0:	72fb      	strb	r3, [r7, #11]
			switch(c){
    11c2:	7afb      	ldrb	r3, [r7, #11]
    11c4:	2b18      	cmp	r3, #24
    11c6:	d872      	bhi.n	12ae <read_line+0x10e>
    11c8:	a201      	add	r2, pc, #4	; (adr r2, 11d0 <read_line+0x30>)
    11ca:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    11ce:	bf00      	nop
    11d0:	000012d9 	.word	0x000012d9
    11d4:	000012af 	.word	0x000012af
    11d8:	000012af 	.word	0x000012af
    11dc:	000012af 	.word	0x000012af
    11e0:	000012af 	.word	0x000012af
    11e4:	000012a1 	.word	0x000012a1
    11e8:	000012af 	.word	0x000012af
    11ec:	000012af 	.word	0x000012af
    11f0:	0000128f 	.word	0x0000128f
    11f4:	000012ab 	.word	0x000012ab
    11f8:	00001235 	.word	0x00001235
    11fc:	000012af 	.word	0x000012af
    1200:	000012af 	.word	0x000012af
    1204:	00001235 	.word	0x00001235
    1208:	000012af 	.word	0x000012af
    120c:	000012af 	.word	0x000012af
    1210:	000012af 	.word	0x000012af
    1214:	000012af 	.word	0x000012af
    1218:	000012af 	.word	0x000012af
    121c:	000012af 	.word	0x000012af
    1220:	000012af 	.word	0x000012af
    1224:	00001243 	.word	0x00001243
    1228:	000012af 	.word	0x000012af
    122c:	00001259 	.word	0x00001259
    1230:	00001243 	.word	0x00001243
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    1234:	230d      	movs	r3, #13
    1236:	72fb      	strb	r3, [r7, #11]
				conout(c);
    1238:	7afb      	ldrb	r3, [r7, #11]
    123a:	4618      	mov	r0, r3
    123c:	f7ff ff28 	bl	1090 <conout>
				break;
    1240:	e04a      	b.n	12d8 <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
    1242:	68f8      	ldr	r0, [r7, #12]
    1244:	f7ff ff92 	bl	116c <clear_line>
				line_len=0;
    1248:	2300      	movs	r3, #0
    124a:	60fb      	str	r3, [r7, #12]
				break;
    124c:	e044      	b.n	12d8 <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    124e:	f7ff ff6b 	bl	1128 <delete_back>
					line_len--;
    1252:	68fb      	ldr	r3, [r7, #12]
    1254:	3b01      	subs	r3, #1
    1256:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    1258:	68fb      	ldr	r3, [r7, #12]
    125a:	2b00      	cmp	r3, #0
    125c:	d006      	beq.n	126c <read_line+0xcc>
    125e:	68fb      	ldr	r3, [r7, #12]
    1260:	3b01      	subs	r3, #1
    1262:	687a      	ldr	r2, [r7, #4]
    1264:	4413      	add	r3, r2
    1266:	781b      	ldrb	r3, [r3, #0]
    1268:	2b20      	cmp	r3, #32
    126a:	d0f0      	beq.n	124e <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    126c:	e004      	b.n	1278 <read_line+0xd8>
					delete_back();
    126e:	f7ff ff5b 	bl	1128 <delete_back>
					line_len--;
    1272:	68fb      	ldr	r3, [r7, #12]
    1274:	3b01      	subs	r3, #1
    1276:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1278:	68fb      	ldr	r3, [r7, #12]
    127a:	2b00      	cmp	r3, #0
    127c:	d006      	beq.n	128c <read_line+0xec>
    127e:	68fb      	ldr	r3, [r7, #12]
    1280:	3b01      	subs	r3, #1
    1282:	687a      	ldr	r2, [r7, #4]
    1284:	4413      	add	r3, r2
    1286:	781b      	ldrb	r3, [r3, #0]
    1288:	2b20      	cmp	r3, #32
    128a:	d1f0      	bne.n	126e <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    128c:	e024      	b.n	12d8 <read_line+0x138>
				case BS:
				if (line_len){
    128e:	68fb      	ldr	r3, [r7, #12]
    1290:	2b00      	cmp	r3, #0
    1292:	d004      	beq.n	129e <read_line+0xfe>
					delete_back();
    1294:	f7ff ff48 	bl	1128 <delete_back>
					line_len--;
    1298:	68fb      	ldr	r3, [r7, #12]
    129a:	3b01      	subs	r3, #1
    129c:	60fb      	str	r3, [r7, #12]
				}
				break;
    129e:	e01b      	b.n	12d8 <read_line+0x138>
				case CTRL_E:
				cls();
    12a0:	f7ff ff58 	bl	1154 <cls>
				line_len=0;
    12a4:	2300      	movs	r3, #0
    12a6:	60fb      	str	r3, [r7, #12]
				break;
    12a8:	e016      	b.n	12d8 <read_line+0x138>
				case TAB:
				c=SPACE;
    12aa:	2320      	movs	r3, #32
    12ac:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    12ae:	68fa      	ldr	r2, [r7, #12]
    12b0:	683b      	ldr	r3, [r7, #0]
    12b2:	429a      	cmp	r2, r3
    12b4:	d20e      	bcs.n	12d4 <read_line+0x134>
    12b6:	7afb      	ldrb	r3, [r7, #11]
    12b8:	2b1f      	cmp	r3, #31
    12ba:	d90b      	bls.n	12d4 <read_line+0x134>
					buffer[line_len++]=c;
    12bc:	68fb      	ldr	r3, [r7, #12]
    12be:	1c5a      	adds	r2, r3, #1
    12c0:	60fa      	str	r2, [r7, #12]
    12c2:	687a      	ldr	r2, [r7, #4]
    12c4:	4413      	add	r3, r2
    12c6:	7afa      	ldrb	r2, [r7, #11]
    12c8:	701a      	strb	r2, [r3, #0]
					conout(c);
    12ca:	7afb      	ldrb	r3, [r7, #11]
    12cc:	4618      	mov	r0, r3
    12ce:	f7ff fedf 	bl	1090 <conout>
    12d2:	e001      	b.n	12d8 <read_line+0x138>
				}else{
					beep();
    12d4:	f7ff ff22 	bl	111c <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    12d8:	7afb      	ldrb	r3, [r7, #11]
    12da:	2b0d      	cmp	r3, #13
    12dc:	f47f af6d 	bne.w	11ba <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    12e0:	687a      	ldr	r2, [r7, #4]
    12e2:	68fb      	ldr	r3, [r7, #12]
    12e4:	4413      	add	r3, r2
    12e6:	2200      	movs	r2, #0
    12e8:	701a      	strb	r2, [r3, #0]
	return line_len;
    12ea:	68fb      	ldr	r3, [r7, #12]
}
    12ec:	4618      	mov	r0, r3
    12ee:	3710      	adds	r7, #16
    12f0:	46bd      	mov	sp, r7
    12f2:	bd80      	pop	{r7, pc}

000012f4 <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    12f4:	b580      	push	{r7, lr}
    12f6:	b08e      	sub	sp, #56	; 0x38
    12f8:	af00      	add	r7, sp, #0
    12fa:	6078      	str	r0, [r7, #4]
    12fc:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    12fe:	2301      	movs	r3, #1
    1300:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    1302:	2322      	movs	r3, #34	; 0x22
    1304:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    1306:	2300      	movs	r3, #0
    1308:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    130c:	687b      	ldr	r3, [r7, #4]
    130e:	2b00      	cmp	r3, #0
    1310:	da05      	bge.n	131e <print_int+0x2a>
    1312:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1316:	637b      	str	r3, [r7, #52]	; 0x34
    1318:	687b      	ldr	r3, [r7, #4]
    131a:	425b      	negs	r3, r3
    131c:	607b      	str	r3, [r7, #4]
	while (i){
    131e:	e02c      	b.n	137a <print_int+0x86>
		fmt[pos]=i%base+'0';
    1320:	687b      	ldr	r3, [r7, #4]
    1322:	683a      	ldr	r2, [r7, #0]
    1324:	fbb3 f2f2 	udiv	r2, r3, r2
    1328:	6839      	ldr	r1, [r7, #0]
    132a:	fb01 f202 	mul.w	r2, r1, r2
    132e:	1a9b      	subs	r3, r3, r2
    1330:	b2db      	uxtb	r3, r3
    1332:	3330      	adds	r3, #48	; 0x30
    1334:	b2d9      	uxtb	r1, r3
    1336:	f107 020c 	add.w	r2, r7, #12
    133a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    133c:	4413      	add	r3, r2
    133e:	460a      	mov	r2, r1
    1340:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    1342:	f107 020c 	add.w	r2, r7, #12
    1346:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1348:	4413      	add	r3, r2
    134a:	781b      	ldrb	r3, [r3, #0]
    134c:	2b39      	cmp	r3, #57	; 0x39
    134e:	d90c      	bls.n	136a <print_int+0x76>
    1350:	f107 020c 	add.w	r2, r7, #12
    1354:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1356:	4413      	add	r3, r2
    1358:	781b      	ldrb	r3, [r3, #0]
    135a:	3307      	adds	r3, #7
    135c:	b2d9      	uxtb	r1, r3
    135e:	f107 020c 	add.w	r2, r7, #12
    1362:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1364:	4413      	add	r3, r2
    1366:	460a      	mov	r2, r1
    1368:	701a      	strb	r2, [r3, #0]
		pos--;
    136a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    136c:	3b01      	subs	r3, #1
    136e:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    1370:	687a      	ldr	r2, [r7, #4]
    1372:	683b      	ldr	r3, [r7, #0]
    1374:	fbb2 f3f3 	udiv	r3, r2, r3
    1378:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    137a:	687b      	ldr	r3, [r7, #4]
    137c:	2b00      	cmp	r3, #0
    137e:	d1cf      	bne.n	1320 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    1380:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1382:	2b22      	cmp	r3, #34	; 0x22
    1384:	d108      	bne.n	1398 <print_int+0xa4>
    1386:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1388:	1e5a      	subs	r2, r3, #1
    138a:	633a      	str	r2, [r7, #48]	; 0x30
    138c:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1390:	4413      	add	r3, r2
    1392:	2230      	movs	r2, #48	; 0x30
    1394:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    1398:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    139a:	2b00      	cmp	r3, #0
    139c:	da08      	bge.n	13b0 <print_int+0xbc>
    139e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13a0:	1e5a      	subs	r2, r3, #1
    13a2:	633a      	str	r2, [r7, #48]	; 0x30
    13a4:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13a8:	4413      	add	r3, r2
    13aa:	222d      	movs	r2, #45	; 0x2d
    13ac:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    13b0:	f107 020c 	add.w	r2, r7, #12
    13b4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13b6:	4413      	add	r3, r2
    13b8:	2220      	movs	r2, #32
    13ba:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    13bc:	f107 020c 	add.w	r2, r7, #12
    13c0:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13c2:	4413      	add	r3, r2
    13c4:	4618      	mov	r0, r3
    13c6:	f7ff fe95 	bl	10f4 <print>
}
    13ca:	3738      	adds	r7, #56	; 0x38
    13cc:	46bd      	mov	sp, r7
    13ce:	bd80      	pop	{r7, pc}

000013d0 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    13d0:	b580      	push	{r7, lr}
    13d2:	b088      	sub	sp, #32
    13d4:	af00      	add	r7, sp, #0
    13d6:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    13d8:	230c      	movs	r3, #12
    13da:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    13dc:	2300      	movs	r3, #0
    13de:	767b      	strb	r3, [r7, #25]
	while (u){
    13e0:	e026      	b.n	1430 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    13e2:	687b      	ldr	r3, [r7, #4]
    13e4:	b2db      	uxtb	r3, r3
    13e6:	f003 030f 	and.w	r3, r3, #15
    13ea:	b2db      	uxtb	r3, r3
    13ec:	3330      	adds	r3, #48	; 0x30
    13ee:	b2d9      	uxtb	r1, r3
    13f0:	f107 020c 	add.w	r2, r7, #12
    13f4:	69fb      	ldr	r3, [r7, #28]
    13f6:	4413      	add	r3, r2
    13f8:	460a      	mov	r2, r1
    13fa:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    13fc:	f107 020c 	add.w	r2, r7, #12
    1400:	69fb      	ldr	r3, [r7, #28]
    1402:	4413      	add	r3, r2
    1404:	781b      	ldrb	r3, [r3, #0]
    1406:	2b39      	cmp	r3, #57	; 0x39
    1408:	d90c      	bls.n	1424 <print_hex+0x54>
    140a:	f107 020c 	add.w	r2, r7, #12
    140e:	69fb      	ldr	r3, [r7, #28]
    1410:	4413      	add	r3, r2
    1412:	781b      	ldrb	r3, [r3, #0]
    1414:	3307      	adds	r3, #7
    1416:	b2d9      	uxtb	r1, r3
    1418:	f107 020c 	add.w	r2, r7, #12
    141c:	69fb      	ldr	r3, [r7, #28]
    141e:	4413      	add	r3, r2
    1420:	460a      	mov	r2, r1
    1422:	701a      	strb	r2, [r3, #0]
		pos--;
    1424:	69fb      	ldr	r3, [r7, #28]
    1426:	3b01      	subs	r3, #1
    1428:	61fb      	str	r3, [r7, #28]
		u/=16;
    142a:	687b      	ldr	r3, [r7, #4]
    142c:	091b      	lsrs	r3, r3, #4
    142e:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    1430:	687b      	ldr	r3, [r7, #4]
    1432:	2b00      	cmp	r3, #0
    1434:	d1d5      	bne.n	13e2 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    1436:	69fb      	ldr	r3, [r7, #28]
    1438:	2b0c      	cmp	r3, #12
    143a:	d108      	bne.n	144e <print_hex+0x7e>
    143c:	69fb      	ldr	r3, [r7, #28]
    143e:	1e5a      	subs	r2, r3, #1
    1440:	61fa      	str	r2, [r7, #28]
    1442:	f107 0220 	add.w	r2, r7, #32
    1446:	4413      	add	r3, r2
    1448:	2230      	movs	r2, #48	; 0x30
    144a:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    144e:	69fb      	ldr	r3, [r7, #28]
    1450:	1e5a      	subs	r2, r3, #1
    1452:	61fa      	str	r2, [r7, #28]
    1454:	f107 0220 	add.w	r2, r7, #32
    1458:	4413      	add	r3, r2
    145a:	2278      	movs	r2, #120	; 0x78
    145c:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    1460:	69fb      	ldr	r3, [r7, #28]
    1462:	1e5a      	subs	r2, r3, #1
    1464:	61fa      	str	r2, [r7, #28]
    1466:	f107 0220 	add.w	r2, r7, #32
    146a:	4413      	add	r3, r2
    146c:	2230      	movs	r2, #48	; 0x30
    146e:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    1472:	f107 020c 	add.w	r2, r7, #12
    1476:	69fb      	ldr	r3, [r7, #28]
    1478:	4413      	add	r3, r2
    147a:	2220      	movs	r2, #32
    147c:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    147e:	f107 020c 	add.w	r2, r7, #12
    1482:	69fb      	ldr	r3, [r7, #28]
    1484:	4413      	add	r3, r2
    1486:	4618      	mov	r0, r3
    1488:	f7ff fe34 	bl	10f4 <print>
}
    148c:	3720      	adds	r7, #32
    148e:	46bd      	mov	sp, r7
    1490:	bd80      	pop	{r7, pc}
    1492:	bf00      	nop

00001494 <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    1494:	b480      	push	{r7}
    1496:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    1498:	4b04      	ldr	r3, [pc, #16]	; (14ac <flush_rx_queue+0x18>)
    149a:	2200      	movs	r2, #0
    149c:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    149e:	4b03      	ldr	r3, [pc, #12]	; (14ac <flush_rx_queue+0x18>)
    14a0:	2200      	movs	r2, #0
    14a2:	625a      	str	r2, [r3, #36]	; 0x24
}
    14a4:	46bd      	mov	sp, r7
    14a6:	f85d 7b04 	ldr.w	r7, [sp], #4
    14aa:	4770      	bx	lr
    14ac:	200000b8 	.word	0x200000b8

000014b0 <flash_enable>:
#define _flash_busy (FLASH_ITRF->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH_ITRF->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    14b0:	b480      	push	{r7}
    14b2:	af00      	add	r7, sp, #0
	if (!RCC_CR->fld.hsion){ // activation clock HSI
    14b4:	4b14      	ldr	r3, [pc, #80]	; (1508 <flash_enable+0x58>)
    14b6:	681b      	ldr	r3, [r3, #0]
    14b8:	f003 0301 	and.w	r3, r3, #1
    14bc:	b2db      	uxtb	r3, r3
    14be:	2b00      	cmp	r3, #0
    14c0:	d10d      	bne.n	14de <flash_enable+0x2e>
		RCC_CR->fld.hsion=1;
    14c2:	4b11      	ldr	r3, [pc, #68]	; (1508 <flash_enable+0x58>)
    14c4:	681a      	ldr	r2, [r3, #0]
    14c6:	f042 0201 	orr.w	r2, r2, #1
    14ca:	601a      	str	r2, [r3, #0]
		while (!RCC_CR->fld.hsirdy);
    14cc:	bf00      	nop
    14ce:	4b0e      	ldr	r3, [pc, #56]	; (1508 <flash_enable+0x58>)
    14d0:	681b      	ldr	r3, [r3, #0]
    14d2:	085b      	lsrs	r3, r3, #1
    14d4:	f003 0301 	and.w	r3, r3, #1
    14d8:	b2db      	uxtb	r3, r3
    14da:	2b00      	cmp	r3, #0
    14dc:	d0f7      	beq.n	14ce <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH_ITRF->KEYR=0x45670123;
    14de:	4b0b      	ldr	r3, [pc, #44]	; (150c <flash_enable+0x5c>)
    14e0:	4a0b      	ldr	r2, [pc, #44]	; (1510 <flash_enable+0x60>)
    14e2:	605a      	str	r2, [r3, #4]
	FLASH_ITRF->KEYR=0xCDEF89AB;
    14e4:	4b09      	ldr	r3, [pc, #36]	; (150c <flash_enable+0x5c>)
    14e6:	4a0b      	ldr	r2, [pc, #44]	; (1514 <flash_enable+0x64>)
    14e8:	605a      	str	r2, [r3, #4]
	return !(FLASH_ITRF->CR&FLASH_CR_LOCK);
    14ea:	4b08      	ldr	r3, [pc, #32]	; (150c <flash_enable+0x5c>)
    14ec:	691b      	ldr	r3, [r3, #16]
    14ee:	f003 0340 	and.w	r3, r3, #64	; 0x40
    14f2:	2b00      	cmp	r3, #0
    14f4:	bf0c      	ite	eq
    14f6:	2301      	moveq	r3, #1
    14f8:	2300      	movne	r3, #0
    14fa:	b2db      	uxtb	r3, r3
}
    14fc:	4618      	mov	r0, r3
    14fe:	46bd      	mov	sp, r7
    1500:	f85d 7b04 	ldr.w	r7, [sp], #4
    1504:	4770      	bx	lr
    1506:	bf00      	nop
    1508:	40021000 	.word	0x40021000
    150c:	40022000 	.word	0x40022000
    1510:	45670123 	.word	0x45670123
    1514:	cdef89ab 	.word	0xcdef89ab

00001518 <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    1518:	b480      	push	{r7}
    151a:	af00      	add	r7, sp, #0
	FLASH_ITRF->CR|=FLASH_CR_LOCK;
    151c:	4a04      	ldr	r2, [pc, #16]	; (1530 <flash_disable+0x18>)
    151e:	4b04      	ldr	r3, [pc, #16]	; (1530 <flash_disable+0x18>)
    1520:	691b      	ldr	r3, [r3, #16]
    1522:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1526:	6113      	str	r3, [r2, #16]
}
    1528:	46bd      	mov	sp, r7
    152a:	f85d 7b04 	ldr.w	r7, [sp], #4
    152e:	4770      	bx	lr
    1530:	40022000 	.word	0x40022000

00001534 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1534:	b480      	push	{r7}
    1536:	b083      	sub	sp, #12
    1538:	af00      	add	r7, sp, #0
    153a:	6078      	str	r0, [r7, #4]
    153c:	460b      	mov	r3, r1
    153e:	807b      	strh	r3, [r7, #2]
	if (FLASH_ITRF->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    1540:	4b1d      	ldr	r3, [pc, #116]	; (15b8 <flash_write+0x84>)
    1542:	691b      	ldr	r3, [r3, #16]
    1544:	f003 0340 	and.w	r3, r3, #64	; 0x40
    1548:	2b00      	cmp	r3, #0
    154a:	d105      	bne.n	1558 <flash_write+0x24>
    154c:	687b      	ldr	r3, [r7, #4]
    154e:	881b      	ldrh	r3, [r3, #0]
    1550:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1554:	4293      	cmp	r3, r2
    1556:	d001      	beq.n	155c <flash_write+0x28>
    1558:	2300      	movs	r3, #0
    155a:	e027      	b.n	15ac <flash_write+0x78>
	while (_flash_busy);
    155c:	bf00      	nop
    155e:	4b16      	ldr	r3, [pc, #88]	; (15b8 <flash_write+0x84>)
    1560:	68db      	ldr	r3, [r3, #12]
    1562:	f003 0301 	and.w	r3, r3, #1
    1566:	2b00      	cmp	r3, #0
    1568:	d1f9      	bne.n	155e <flash_write+0x2a>
	FLASH_ITRF->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    156a:	4a13      	ldr	r2, [pc, #76]	; (15b8 <flash_write+0x84>)
    156c:	4b12      	ldr	r3, [pc, #72]	; (15b8 <flash_write+0x84>)
    156e:	68db      	ldr	r3, [r3, #12]
    1570:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1574:	60d3      	str	r3, [r2, #12]
	FLASH_ITRF->CR=FLASH_CR_PG;
    1576:	4b10      	ldr	r3, [pc, #64]	; (15b8 <flash_write+0x84>)
    1578:	2201      	movs	r2, #1
    157a:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    157c:	687b      	ldr	r3, [r7, #4]
    157e:	887a      	ldrh	r2, [r7, #2]
    1580:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    1582:	bf00      	nop
    1584:	4b0c      	ldr	r3, [pc, #48]	; (15b8 <flash_write+0x84>)
    1586:	68db      	ldr	r3, [r3, #12]
    1588:	f003 0301 	and.w	r3, r3, #1
    158c:	2b00      	cmp	r3, #0
    158e:	d005      	beq.n	159c <flash_write+0x68>
    1590:	4b09      	ldr	r3, [pc, #36]	; (15b8 <flash_write+0x84>)
    1592:	68db      	ldr	r3, [r3, #12]
    1594:	f003 0320 	and.w	r3, r3, #32
    1598:	2b00      	cmp	r3, #0
    159a:	d0f3      	beq.n	1584 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    159c:	687b      	ldr	r3, [r7, #4]
    159e:	881b      	ldrh	r3, [r3, #0]
    15a0:	887a      	ldrh	r2, [r7, #2]
    15a2:	429a      	cmp	r2, r3
    15a4:	bf0c      	ite	eq
    15a6:	2301      	moveq	r3, #1
    15a8:	2300      	movne	r3, #0
    15aa:	b2db      	uxtb	r3, r3
}
    15ac:	4618      	mov	r0, r3
    15ae:	370c      	adds	r7, #12
    15b0:	46bd      	mov	sp, r7
    15b2:	f85d 7b04 	ldr.w	r7, [sp], #4
    15b6:	4770      	bx	lr
    15b8:	40022000 	.word	0x40022000

000015bc <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    15bc:	b480      	push	{r7}
    15be:	b087      	sub	sp, #28
    15c0:	af00      	add	r7, sp, #0
    15c2:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH_ITRF->CR&FLASH_CR_LOCK) return 0; 
    15c4:	4b27      	ldr	r3, [pc, #156]	; (1664 <flash_erase_page+0xa8>)
    15c6:	691b      	ldr	r3, [r3, #16]
    15c8:	f003 0340 	and.w	r3, r3, #64	; 0x40
    15cc:	2b00      	cmp	r3, #0
    15ce:	d001      	beq.n	15d4 <flash_erase_page+0x18>
    15d0:	2300      	movs	r3, #0
    15d2:	e040      	b.n	1656 <flash_erase_page+0x9a>
	FLASH_ITRF->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    15d4:	4a23      	ldr	r2, [pc, #140]	; (1664 <flash_erase_page+0xa8>)
    15d6:	4b23      	ldr	r3, [pc, #140]	; (1664 <flash_erase_page+0xa8>)
    15d8:	68db      	ldr	r3, [r3, #12]
    15da:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    15de:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    15e0:	687b      	ldr	r3, [r7, #4]
    15e2:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    15e6:	f023 0303 	bic.w	r3, r3, #3
    15ea:	607b      	str	r3, [r7, #4]
	FLASH_ITRF->CR=FLASH_CR_PER;
    15ec:	4b1d      	ldr	r3, [pc, #116]	; (1664 <flash_erase_page+0xa8>)
    15ee:	2202      	movs	r2, #2
    15f0:	611a      	str	r2, [r3, #16]
	FLASH_ITRF->AR=address;
    15f2:	4a1c      	ldr	r2, [pc, #112]	; (1664 <flash_erase_page+0xa8>)
    15f4:	687b      	ldr	r3, [r7, #4]
    15f6:	6153      	str	r3, [r2, #20]
	FLASH_ITRF->CR|=FLASH_CR_STRT;
    15f8:	4a1a      	ldr	r2, [pc, #104]	; (1664 <flash_erase_page+0xa8>)
    15fa:	4b1a      	ldr	r3, [pc, #104]	; (1664 <flash_erase_page+0xa8>)
    15fc:	691b      	ldr	r3, [r3, #16]
    15fe:	f043 0320 	orr.w	r3, r3, #32
    1602:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    1604:	bf00      	nop
    1606:	4b17      	ldr	r3, [pc, #92]	; (1664 <flash_erase_page+0xa8>)
    1608:	68db      	ldr	r3, [r3, #12]
    160a:	f003 0301 	and.w	r3, r3, #1
    160e:	2b00      	cmp	r3, #0
    1610:	d005      	beq.n	161e <flash_erase_page+0x62>
    1612:	4b14      	ldr	r3, [pc, #80]	; (1664 <flash_erase_page+0xa8>)
    1614:	68db      	ldr	r3, [r3, #12]
    1616:	f003 0320 	and.w	r3, r3, #32
    161a:	2b00      	cmp	r3, #0
    161c:	d0f3      	beq.n	1606 <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    161e:	687b      	ldr	r3, [r7, #4]
    1620:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    1622:	2300      	movs	r3, #0
    1624:	60fb      	str	r3, [r7, #12]
    1626:	e00c      	b.n	1642 <flash_erase_page+0x86>
		u32=*adr++;
    1628:	697b      	ldr	r3, [r7, #20]
    162a:	1d1a      	adds	r2, r3, #4
    162c:	617a      	str	r2, [r7, #20]
    162e:	681b      	ldr	r3, [r3, #0]
    1630:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    1632:	693b      	ldr	r3, [r7, #16]
    1634:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1638:	d000      	beq.n	163c <flash_erase_page+0x80>
    163a:	e005      	b.n	1648 <flash_erase_page+0x8c>
	FLASH_ITRF->CR=FLASH_CR_PER;
	FLASH_ITRF->AR=address;
	FLASH_ITRF->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    163c:	68fb      	ldr	r3, [r7, #12]
    163e:	3301      	adds	r3, #1
    1640:	60fb      	str	r3, [r7, #12]
    1642:	68fb      	ldr	r3, [r7, #12]
    1644:	2bff      	cmp	r3, #255	; 0xff
    1646:	ddef      	ble.n	1628 <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    1648:	693b      	ldr	r3, [r7, #16]
    164a:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    164e:	bf0c      	ite	eq
    1650:	2301      	moveq	r3, #1
    1652:	2300      	movne	r3, #0
    1654:	b2db      	uxtb	r3, r3
}
    1656:	4618      	mov	r0, r3
    1658:	371c      	adds	r7, #28
    165a:	46bd      	mov	sp, r7
    165c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1660:	4770      	bx	lr
    1662:	bf00      	nop
    1664:	40022000 	.word	0x40022000

00001668 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    1668:	b490      	push	{r4, r7}
    166a:	b086      	sub	sp, #24
    166c:	af00      	add	r7, sp, #0
    166e:	60f8      	str	r0, [r7, #12]
    1670:	60b9      	str	r1, [r7, #8]
    1672:	607a      	str	r2, [r7, #4]
	register gpio_crl_t* cr;
	uint8_t shift;
	switch (port){
    1674:	68fb      	ldr	r3, [r7, #12]
    1676:	2b01      	cmp	r3, #1
    1678:	d006      	beq.n	1688 <config_pin+0x20>
    167a:	2b01      	cmp	r3, #1
    167c:	d302      	bcc.n	1684 <config_pin+0x1c>
    167e:	2b02      	cmp	r3, #2
    1680:	d004      	beq.n	168c <config_pin+0x24>
    1682:	e005      	b.n	1690 <config_pin+0x28>
		case GPIOA:
		cr=(gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS);
    1684:	4c17      	ldr	r4, [pc, #92]	; (16e4 <config_pin+0x7c>)
		break;
    1686:	e003      	b.n	1690 <config_pin+0x28>
		case GPIOB:
		cr=(gpio_crl_t*)(GPIOB_BASE_ADR+GPIO_CRL_OFS);
    1688:	4c17      	ldr	r4, [pc, #92]	; (16e8 <config_pin+0x80>)
		break;
    168a:	e001      	b.n	1690 <config_pin+0x28>
		case GPIOC:
		cr=(gpio_crl_t*)(GPIOC_BASE_ADR+GPIO_CRL_OFS);
    168c:	4c17      	ldr	r4, [pc, #92]	; (16ec <config_pin+0x84>)
		break;
    168e:	bf00      	nop
	}
	shift=(pin&7)<<2;
    1690:	68bb      	ldr	r3, [r7, #8]
    1692:	b2db      	uxtb	r3, r3
    1694:	f003 0307 	and.w	r3, r3, #7
    1698:	b2db      	uxtb	r3, r3
    169a:	009b      	lsls	r3, r3, #2
    169c:	75fb      	strb	r3, [r7, #23]
	cr[pin>>3].cr&=~(15<<shift);
    169e:	68bb      	ldr	r3, [r7, #8]
    16a0:	08db      	lsrs	r3, r3, #3
    16a2:	009b      	lsls	r3, r3, #2
    16a4:	4423      	add	r3, r4
    16a6:	68ba      	ldr	r2, [r7, #8]
    16a8:	08d2      	lsrs	r2, r2, #3
    16aa:	0092      	lsls	r2, r2, #2
    16ac:	4422      	add	r2, r4
    16ae:	6812      	ldr	r2, [r2, #0]
    16b0:	7df9      	ldrb	r1, [r7, #23]
    16b2:	200f      	movs	r0, #15
    16b4:	fa00 f101 	lsl.w	r1, r0, r1
    16b8:	43c9      	mvns	r1, r1
    16ba:	400a      	ands	r2, r1
    16bc:	601a      	str	r2, [r3, #0]
	cr[pin>>3].cr|=config<<shift;
    16be:	68bb      	ldr	r3, [r7, #8]
    16c0:	08db      	lsrs	r3, r3, #3
    16c2:	009b      	lsls	r3, r3, #2
    16c4:	4423      	add	r3, r4
    16c6:	68ba      	ldr	r2, [r7, #8]
    16c8:	08d2      	lsrs	r2, r2, #3
    16ca:	0092      	lsls	r2, r2, #2
    16cc:	4422      	add	r2, r4
    16ce:	6811      	ldr	r1, [r2, #0]
    16d0:	7dfa      	ldrb	r2, [r7, #23]
    16d2:	6878      	ldr	r0, [r7, #4]
    16d4:	fa00 f202 	lsl.w	r2, r0, r2
    16d8:	430a      	orrs	r2, r1
    16da:	601a      	str	r2, [r3, #0]
}
    16dc:	3718      	adds	r7, #24
    16de:	46bd      	mov	sp, r7
    16e0:	bc90      	pop	{r4, r7}
    16e2:	4770      	bx	lr
    16e4:	40010800 	.word	0x40010800
    16e8:	40010c00 	.word	0x40010c00
    16ec:	40011000 	.word	0x40011000

000016f0 <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    16f0:	b480      	push	{r7}
    16f2:	b083      	sub	sp, #12
    16f4:	af00      	add	r7, sp, #0
    16f6:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    16f8:	687b      	ldr	r3, [r7, #4]
    16fa:	2b3b      	cmp	r3, #59	; 0x3b
    16fc:	d900      	bls.n	1700 <enable_interrupt+0x10>
    16fe:	e016      	b.n	172e <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    1700:	687b      	ldr	r3, [r7, #4]
    1702:	095b      	lsrs	r3, r3, #5
    1704:	009b      	lsls	r3, r3, #2
    1706:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    170a:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    170e:	687a      	ldr	r2, [r7, #4]
    1710:	0952      	lsrs	r2, r2, #5
    1712:	0092      	lsls	r2, r2, #2
    1714:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    1718:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    171c:	6812      	ldr	r2, [r2, #0]
    171e:	6879      	ldr	r1, [r7, #4]
    1720:	f001 011f 	and.w	r1, r1, #31
    1724:	2001      	movs	r0, #1
    1726:	fa00 f101 	lsl.w	r1, r0, r1
    172a:	430a      	orrs	r2, r1
    172c:	601a      	str	r2, [r3, #0]
}
    172e:	370c      	adds	r7, #12
    1730:	46bd      	mov	sp, r7
    1732:	f85d 7b04 	ldr.w	r7, [sp], #4
    1736:	4770      	bx	lr

00001738 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    1738:	b480      	push	{r7}
    173a:	b083      	sub	sp, #12
    173c:	af00      	add	r7, sp, #0
    173e:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    1740:	687b      	ldr	r3, [r7, #4]
    1742:	2b3b      	cmp	r3, #59	; 0x3b
    1744:	d900      	bls.n	1748 <disable_interrupt+0x10>
    1746:	e013      	b.n	1770 <disable_interrupt+0x38>
	ICER[irq>>5]&=~(1<<(irq&0x1f));
    1748:	687b      	ldr	r3, [r7, #4]
    174a:	095b      	lsrs	r3, r3, #5
    174c:	009a      	lsls	r2, r3, #2
    174e:	4b0b      	ldr	r3, [pc, #44]	; (177c <disable_interrupt+0x44>)
    1750:	4413      	add	r3, r2
    1752:	687a      	ldr	r2, [r7, #4]
    1754:	0952      	lsrs	r2, r2, #5
    1756:	0091      	lsls	r1, r2, #2
    1758:	4a08      	ldr	r2, [pc, #32]	; (177c <disable_interrupt+0x44>)
    175a:	440a      	add	r2, r1
    175c:	6812      	ldr	r2, [r2, #0]
    175e:	6879      	ldr	r1, [r7, #4]
    1760:	f001 011f 	and.w	r1, r1, #31
    1764:	2001      	movs	r0, #1
    1766:	fa00 f101 	lsl.w	r1, r0, r1
    176a:	43c9      	mvns	r1, r1
    176c:	400a      	ands	r2, r1
    176e:	601a      	str	r2, [r3, #0]
}
    1770:	370c      	adds	r7, #12
    1772:	46bd      	mov	sp, r7
    1774:	f85d 7b04 	ldr.w	r7, [sp], #4
    1778:	4770      	bx	lr
    177a:	bf00      	nop
    177c:	e000e180 	.word	0xe000e180

00001780 <set_int_priority>:



void set_int_priority(int32_t irq, unsigned priority){
    1780:	b480      	push	{r7}
    1782:	b083      	sub	sp, #12
    1784:	af00      	add	r7, sp, #0
    1786:	6078      	str	r0, [r7, #4]
    1788:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    178a:	687b      	ldr	r3, [r7, #4]
    178c:	2b00      	cmp	r3, #0
    178e:	db0d      	blt.n	17ac <set_int_priority+0x2c>
    1790:	687b      	ldr	r3, [r7, #4]
    1792:	2b3b      	cmp	r3, #59	; 0x3b
    1794:	dc0a      	bgt.n	17ac <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    1796:	687b      	ldr	r3, [r7, #4]
    1798:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    179c:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    17a0:	683a      	ldr	r2, [r7, #0]
    17a2:	b2d2      	uxtb	r2, r2
    17a4:	0112      	lsls	r2, r2, #4
    17a6:	b2d2      	uxtb	r2, r2
    17a8:	701a      	strb	r2, [r3, #0]
    17aa:	e012      	b.n	17d2 <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    17ac:	687b      	ldr	r3, [r7, #4]
    17ae:	2b00      	cmp	r3, #0
    17b0:	da0f      	bge.n	17d2 <set_int_priority+0x52>
    17b2:	687b      	ldr	r3, [r7, #4]
    17b4:	f113 0f0f 	cmn.w	r3, #15
    17b8:	db0b      	blt.n	17d2 <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    17ba:	687a      	ldr	r2, [r7, #4]
    17bc:	f06f 0303 	mvn.w	r3, #3
    17c0:	1a9b      	subs	r3, r3, r2
    17c2:	461a      	mov	r2, r3
    17c4:	4b05      	ldr	r3, [pc, #20]	; (17dc <set_int_priority+0x5c>)
    17c6:	4413      	add	r3, r2
    17c8:	683a      	ldr	r2, [r7, #0]
    17ca:	b2d2      	uxtb	r2, r2
    17cc:	0112      	lsls	r2, r2, #4
    17ce:	b2d2      	uxtb	r2, r2
    17d0:	701a      	strb	r2, [r3, #0]
	}
}
    17d2:	370c      	adds	r7, #12
    17d4:	46bd      	mov	sp, r7
    17d6:	f85d 7b04 	ldr.w	r7, [sp], #4
    17da:	4770      	bx	lr
    17dc:	e000ed18 	.word	0xe000ed18

000017e0 <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    17e0:	b480      	push	{r7}
    17e2:	b083      	sub	sp, #12
    17e4:	af00      	add	r7, sp, #0
    17e6:	6078      	str	r0, [r7, #4]
    17e8:	6039      	str	r1, [r7, #0]
	spi_cr1_t *cr1;
	channel->cr1&=SPI_CR1_BR_MASK;
    17ea:	687b      	ldr	r3, [r7, #4]
    17ec:	681b      	ldr	r3, [r3, #0]
    17ee:	f423 62e0 	bic.w	r2, r3, #1792	; 0x700
    17f2:	687b      	ldr	r3, [r7, #4]
    17f4:	601a      	str	r2, [r3, #0]
	channel->cr1|=baud<<SPI_CR1_BR_POS;
    17f6:	687b      	ldr	r3, [r7, #4]
    17f8:	681a      	ldr	r2, [r3, #0]
    17fa:	683b      	ldr	r3, [r7, #0]
    17fc:	021b      	lsls	r3, r3, #8
    17fe:	431a      	orrs	r2, r3
    1800:	687b      	ldr	r3, [r7, #4]
    1802:	601a      	str	r2, [r3, #0]
}
    1804:	370c      	adds	r7, #12
    1806:	46bd      	mov	sp, r7
    1808:	f85d 7b04 	ldr.w	r7, [sp], #4
    180c:	4770      	bx	lr
    180e:	bf00      	nop

00001810 <spi_init>:


void spi_init(spi_sfr_t* channel, unsigned baud){
    1810:	b580      	push	{r7, lr}
    1812:	b082      	sub	sp, #8
    1814:	af00      	add	r7, sp, #0
    1816:	6078      	str	r0, [r7, #4]
    1818:	6039      	str	r1, [r7, #0]
	spi_baudrate(channel,baud);
    181a:	6878      	ldr	r0, [r7, #4]
    181c:	6839      	ldr	r1, [r7, #0]
    181e:	f7ff ffdf 	bl	17e0 <spi_baudrate>
	channel->cr1|=SPI_CR1_MSTR;
    1822:	687b      	ldr	r3, [r7, #4]
    1824:	681b      	ldr	r3, [r3, #0]
    1826:	f043 0204 	orr.w	r2, r3, #4
    182a:	687b      	ldr	r3, [r7, #4]
    182c:	601a      	str	r2, [r3, #0]
	channel->cr2|=SPI_CR2_SSOE;
    182e:	687b      	ldr	r3, [r7, #4]
    1830:	685b      	ldr	r3, [r3, #4]
    1832:	f043 0204 	orr.w	r2, r3, #4
    1836:	687b      	ldr	r3, [r7, #4]
    1838:	605a      	str	r2, [r3, #4]
	if (channel==SPI1){
    183a:	687b      	ldr	r3, [r7, #4]
    183c:	4a17      	ldr	r2, [pc, #92]	; (189c <spi_init+0x8c>)
    183e:	4293      	cmp	r3, r2
    1840:	d114      	bne.n	186c <spi_init+0x5c>
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(GPIOA,4,OUTPUT_PP_FAST);
    1842:	2000      	movs	r0, #0
    1844:	2104      	movs	r1, #4
    1846:	2203      	movs	r2, #3
    1848:	f7ff ff0e 	bl	1668 <config_pin>
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(GPIOA,5,OUTPUT_PP_FAST);
    184c:	2000      	movs	r0, #0
    184e:	2105      	movs	r1, #5
    1850:	2203      	movs	r2, #3
    1852:	f7ff ff09 	bl	1668 <config_pin>
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(GPIOA,6,INPUT_FLOAT);
    1856:	2000      	movs	r0, #0
    1858:	2106      	movs	r1, #6
    185a:	2204      	movs	r2, #4
    185c:	f7ff ff04 	bl	1668 <config_pin>
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(GPIOA,7,OUTPUT_PP_FAST);
    1860:	2000      	movs	r0, #0
    1862:	2107      	movs	r1, #7
    1864:	2203      	movs	r2, #3
    1866:	f7ff feff 	bl	1668 <config_pin>
    186a:	e013      	b.n	1894 <spi_init+0x84>
	}else{
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(GPIOB,2,OUTPUT_PP_FAST);
    186c:	2001      	movs	r0, #1
    186e:	2102      	movs	r1, #2
    1870:	2203      	movs	r2, #3
    1872:	f7ff fef9 	bl	1668 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(GPIOB,13,OUTPUT_PP_FAST);
    1876:	2001      	movs	r0, #1
    1878:	210d      	movs	r1, #13
    187a:	2203      	movs	r2, #3
    187c:	f7ff fef4 	bl	1668 <config_pin>
		// PB14 MISO input (floating)
		config_pin(GPIOB,14,INPUT_FLOAT);
    1880:	2001      	movs	r0, #1
    1882:	210e      	movs	r1, #14
    1884:	2204      	movs	r2, #4
    1886:	f7ff feef 	bl	1668 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(GPIOB,15,OUTPUT_PP_FAST);
    188a:	2001      	movs	r0, #1
    188c:	210f      	movs	r1, #15
    188e:	2203      	movs	r2, #3
    1890:	f7ff feea 	bl	1668 <config_pin>
	}
}
    1894:	3708      	adds	r7, #8
    1896:	46bd      	mov	sp, r7
    1898:	bd80      	pop	{r7, pc}
    189a:	bf00      	nop
    189c:	40013000 	.word	0x40013000

000018a0 <spi_enable>:

void spi_enable(spi_sfr_t* channel, unsigned mode){
    18a0:	b480      	push	{r7}
    18a2:	b083      	sub	sp, #12
    18a4:	af00      	add	r7, sp, #0
    18a6:	6078      	str	r0, [r7, #4]
    18a8:	6039      	str	r1, [r7, #0]
	switch (mode){
    18aa:	683b      	ldr	r3, [r7, #0]
    18ac:	2b01      	cmp	r3, #1
    18ae:	d00d      	beq.n	18cc <spi_enable+0x2c>
    18b0:	2b01      	cmp	r3, #1
    18b2:	d302      	bcc.n	18ba <spi_enable+0x1a>
    18b4:	2b02      	cmp	r3, #2
    18b6:	d005      	beq.n	18c4 <spi_enable+0x24>
    18b8:	e00d      	b.n	18d6 <spi_enable+0x36>
		case SPI_MODE_READ:
		channel->cr1=SPI_CR1_RXONLY|SPI_CR1_SPE;
    18ba:	687b      	ldr	r3, [r7, #4]
    18bc:	f44f 6288 	mov.w	r2, #1088	; 0x440
    18c0:	601a      	str	r2, [r3, #0]
		break;
    18c2:	e008      	b.n	18d6 <spi_enable+0x36>
		case SPI_MODE_READ_WRITE:
		channel->cr1=SPI_CR1_SPE;
    18c4:	687b      	ldr	r3, [r7, #4]
    18c6:	2240      	movs	r2, #64	; 0x40
    18c8:	601a      	str	r2, [r3, #0]
		break;
    18ca:	e004      	b.n	18d6 <spi_enable+0x36>
		case SPI_MODE_WRITE:
		channel->cr1=SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE|SPI_CR1_SPE;
    18cc:	687b      	ldr	r3, [r7, #4]
    18ce:	f24c 0240 	movw	r2, #49216	; 0xc040
    18d2:	601a      	str	r2, [r3, #0]
		break;
    18d4:	bf00      	nop
	}
}
    18d6:	370c      	adds	r7, #12
    18d8:	46bd      	mov	sp, r7
    18da:	f85d 7b04 	ldr.w	r7, [sp], #4
    18de:	4770      	bx	lr

000018e0 <spi_disable>:

void spi_disable(spi_sfr_t* channel){
    18e0:	b480      	push	{r7}
    18e2:	b083      	sub	sp, #12
    18e4:	af00      	add	r7, sp, #0
    18e6:	6078      	str	r0, [r7, #4]
	channel->cr1&=~SPI_CR1_SPE;
    18e8:	687b      	ldr	r3, [r7, #4]
    18ea:	681b      	ldr	r3, [r3, #0]
    18ec:	f023 0240 	bic.w	r2, r3, #64	; 0x40
    18f0:	687b      	ldr	r3, [r7, #4]
    18f2:	601a      	str	r2, [r3, #0]
}
    18f4:	370c      	adds	r7, #12
    18f6:	46bd      	mov	sp, r7
    18f8:	f85d 7b04 	ldr.w	r7, [sp], #4
    18fc:	4770      	bx	lr
    18fe:	bf00      	nop

00001900 <spi_write>:

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
    1900:	b580      	push	{r7, lr}
    1902:	b082      	sub	sp, #8
    1904:	af00      	add	r7, sp, #0
    1906:	6078      	str	r0, [r7, #4]
    1908:	460b      	mov	r3, r1
    190a:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
    190c:	6878      	ldr	r0, [r7, #4]
    190e:	2101      	movs	r1, #1
    1910:	f7ff ffc6 	bl	18a0 <spi_enable>
	channel->dr=b;
    1914:	78fa      	ldrb	r2, [r7, #3]
    1916:	687b      	ldr	r3, [r7, #4]
    1918:	60da      	str	r2, [r3, #12]
	spi_disable(channel);
    191a:	6878      	ldr	r0, [r7, #4]
    191c:	f7ff ffe0 	bl	18e0 <spi_disable>
}
    1920:	3708      	adds	r7, #8
    1922:	46bd      	mov	sp, r7
    1924:	bd80      	pop	{r7, pc}
    1926:	bf00      	nop

00001928 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    1928:	b580      	push	{r7, lr}
    192a:	b084      	sub	sp, #16
    192c:	af00      	add	r7, sp, #0
    192e:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
    1930:	6878      	ldr	r0, [r7, #4]
    1932:	2100      	movs	r1, #0
    1934:	f7ff ffb4 	bl	18a0 <spi_enable>
	channel->dr=255;
    1938:	687b      	ldr	r3, [r7, #4]
    193a:	22ff      	movs	r2, #255	; 0xff
    193c:	60da      	str	r2, [r3, #12]
	while (!(channel->sr&SPI_SR_RXNE));
    193e:	bf00      	nop
    1940:	687b      	ldr	r3, [r7, #4]
    1942:	689b      	ldr	r3, [r3, #8]
    1944:	f003 0301 	and.w	r3, r3, #1
    1948:	2b00      	cmp	r3, #0
    194a:	d0f9      	beq.n	1940 <spi_read+0x18>
	rx=(uint8_t)channel->dr;
    194c:	687b      	ldr	r3, [r7, #4]
    194e:	68db      	ldr	r3, [r3, #12]
    1950:	73fb      	strb	r3, [r7, #15]
	spi_disable(channel);
    1952:	6878      	ldr	r0, [r7, #4]
    1954:	f7ff ffc4 	bl	18e0 <spi_disable>
	return rx;
    1958:	7bfb      	ldrb	r3, [r7, #15]
}
    195a:	4618      	mov	r0, r3
    195c:	3710      	adds	r7, #16
    195e:	46bd      	mov	sp, r7
    1960:	bd80      	pop	{r7, pc}
    1962:	bf00      	nop

00001964 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    1964:	b580      	push	{r7, lr}
    1966:	b084      	sub	sp, #16
    1968:	af00      	add	r7, sp, #0
    196a:	60f8      	str	r0, [r7, #12]
    196c:	60b9      	str	r1, [r7, #8]
    196e:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_WRITE);
    1970:	68f8      	ldr	r0, [r7, #12]
    1972:	2101      	movs	r1, #1
    1974:	f7ff ff94 	bl	18a0 <spi_enable>
	while (count){
    1978:	e010      	b.n	199c <spi_block_write+0x38>
		channel->dr=*buffer++;
    197a:	68bb      	ldr	r3, [r7, #8]
    197c:	1c5a      	adds	r2, r3, #1
    197e:	60ba      	str	r2, [r7, #8]
    1980:	781b      	ldrb	r3, [r3, #0]
    1982:	461a      	mov	r2, r3
    1984:	68fb      	ldr	r3, [r7, #12]
    1986:	60da      	str	r2, [r3, #12]
		while (!(channel->sr&SPI_SR_TXE));
    1988:	bf00      	nop
    198a:	68fb      	ldr	r3, [r7, #12]
    198c:	689b      	ldr	r3, [r3, #8]
    198e:	f003 0302 	and.w	r3, r3, #2
    1992:	2b00      	cmp	r3, #0
    1994:	d0f9      	beq.n	198a <spi_block_write+0x26>
		count--;
    1996:	687b      	ldr	r3, [r7, #4]
    1998:	3b01      	subs	r3, #1
    199a:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_enable(channel,SPI_MODE_WRITE);
	while (count){
    199c:	687b      	ldr	r3, [r7, #4]
    199e:	2b00      	cmp	r3, #0
    19a0:	d1eb      	bne.n	197a <spi_block_write+0x16>
		channel->dr=*buffer++;
		while (!(channel->sr&SPI_SR_TXE));
		count--;
	}
	spi_disable(channel);
    19a2:	68f8      	ldr	r0, [r7, #12]
    19a4:	f7ff ff9c 	bl	18e0 <spi_disable>
}
    19a8:	3710      	adds	r7, #16
    19aa:	46bd      	mov	sp, r7
    19ac:	bd80      	pop	{r7, pc}
    19ae:	bf00      	nop

000019b0 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    19b0:	b580      	push	{r7, lr}
    19b2:	b084      	sub	sp, #16
    19b4:	af00      	add	r7, sp, #0
    19b6:	60f8      	str	r0, [r7, #12]
    19b8:	60b9      	str	r1, [r7, #8]
    19ba:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_READ);
    19bc:	68f8      	ldr	r0, [r7, #12]
    19be:	2100      	movs	r1, #0
    19c0:	f7ff ff6e 	bl	18a0 <spi_enable>
	while (count){
    19c4:	e013      	b.n	19ee <spi_block_read+0x3e>
		channel->dr=0;
    19c6:	68fb      	ldr	r3, [r7, #12]
    19c8:	2200      	movs	r2, #0
    19ca:	60da      	str	r2, [r3, #12]
		while (!(channel->sr&SPI_SR_RXNE));
    19cc:	bf00      	nop
    19ce:	68fb      	ldr	r3, [r7, #12]
    19d0:	689b      	ldr	r3, [r3, #8]
    19d2:	f003 0301 	and.w	r3, r3, #1
    19d6:	2b00      	cmp	r3, #0
    19d8:	d0f9      	beq.n	19ce <spi_block_read+0x1e>
		*buffer++=(uint8_t)channel->dr;
    19da:	68bb      	ldr	r3, [r7, #8]
    19dc:	1c5a      	adds	r2, r3, #1
    19de:	60ba      	str	r2, [r7, #8]
    19e0:	68fa      	ldr	r2, [r7, #12]
    19e2:	68d2      	ldr	r2, [r2, #12]
    19e4:	b2d2      	uxtb	r2, r2
    19e6:	701a      	strb	r2, [r3, #0]
		count--;
    19e8:	687b      	ldr	r3, [r7, #4]
    19ea:	3b01      	subs	r3, #1
    19ec:	607b      	str	r3, [r7, #4]
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_enable(channel,SPI_MODE_READ);
	while (count){
    19ee:	687b      	ldr	r3, [r7, #4]
    19f0:	2b00      	cmp	r3, #0
    19f2:	d1e8      	bne.n	19c6 <spi_block_read+0x16>
		channel->dr=0;
		while (!(channel->sr&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->dr;
		count--;
	}
	spi_disable(channel);
    19f4:	68f8      	ldr	r0, [r7, #12]
    19f6:	f7ff ff73 	bl	18e0 <spi_disable>
}
    19fa:	3710      	adds	r7, #16
    19fc:	46bd      	mov	sp, r7
    19fe:	bd80      	pop	{r7, pc}

00001a00 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    1a00:	4b01      	ldr	r3, [pc, #4]	; (1a08 <reset_mcu+0x8>)
    1a02:	4a02      	ldr	r2, [pc, #8]	; (1a0c <reset_mcu+0xc>)
    1a04:	601a      	str	r2, [r3, #0]
    1a06:	bf00      	nop
    1a08:	e000ed0c 	.word	0xe000ed0c
    1a0c:	05fa0004 	.word	0x05fa0004

00001a10 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    1a10:	b580      	push	{r7, lr}
    1a12:	b082      	sub	sp, #8
    1a14:	af00      	add	r7, sp, #0
    1a16:	6078      	str	r0, [r7, #4]
    1a18:	6039      	str	r1, [r7, #0]
	print(msg);
    1a1a:	6878      	ldr	r0, [r7, #4]
    1a1c:	f7ff fb6a 	bl	10f4 <print>
	print("at address ");
    1a20:	4814      	ldr	r0, [pc, #80]	; (1a74 <print_fault+0x64>)
    1a22:	f7ff fb67 	bl	10f4 <print>
	if (adr) {
    1a26:	683b      	ldr	r3, [r7, #0]
    1a28:	2b00      	cmp	r3, #0
    1a2a:	d002      	beq.n	1a32 <print_fault+0x22>
		print_hex(adr);
    1a2c:	6838      	ldr	r0, [r7, #0]
    1a2e:	f7ff fccf 	bl	13d0 <print_hex>
	};
	conout(CR);
    1a32:	200d      	movs	r0, #13
    1a34:	f7ff fb2c 	bl	1090 <conout>
	print("UFSR=");
    1a38:	480f      	ldr	r0, [pc, #60]	; (1a78 <print_fault+0x68>)
    1a3a:	f7ff fb5b 	bl	10f4 <print>
	print_hex(CFSR->fsr.usageFalt);
    1a3e:	4b0f      	ldr	r3, [pc, #60]	; (1a7c <print_fault+0x6c>)
    1a40:	681b      	ldr	r3, [r3, #0]
    1a42:	0c1b      	lsrs	r3, r3, #16
    1a44:	b29b      	uxth	r3, r3
    1a46:	4618      	mov	r0, r3
    1a48:	f7ff fcc2 	bl	13d0 <print_hex>
	print(", BFSR=");
    1a4c:	480c      	ldr	r0, [pc, #48]	; (1a80 <print_fault+0x70>)
    1a4e:	f7ff fb51 	bl	10f4 <print>
	print_hex(CFSR->fsr.busFault);
    1a52:	4b0a      	ldr	r3, [pc, #40]	; (1a7c <print_fault+0x6c>)
    1a54:	681b      	ldr	r3, [r3, #0]
    1a56:	0a1b      	lsrs	r3, r3, #8
    1a58:	b2db      	uxtb	r3, r3
    1a5a:	4618      	mov	r0, r3
    1a5c:	f7ff fcb8 	bl	13d0 <print_hex>
	print(", MMFSR=");
    1a60:	4808      	ldr	r0, [pc, #32]	; (1a84 <print_fault+0x74>)
    1a62:	f7ff fb47 	bl	10f4 <print>
	print_hex(CFSR->fsr.mmFault);
    1a66:	4b05      	ldr	r3, [pc, #20]	; (1a7c <print_fault+0x6c>)
    1a68:	681b      	ldr	r3, [r3, #0]
    1a6a:	b2db      	uxtb	r3, r3
    1a6c:	4618      	mov	r0, r3
    1a6e:	f7ff fcaf 	bl	13d0 <print_hex>
	while(1);
    1a72:	e7fe      	b.n	1a72 <print_fault+0x62>
    1a74:	000024e0 	.word	0x000024e0
    1a78:	000024ec 	.word	0x000024ec
    1a7c:	e000ed28 	.word	0xe000ed28
    1a80:	000024f4 	.word	0x000024f4
    1a84:	000024fc 	.word	0x000024fc

00001a88 <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    1a88:	b480      	push	{r7}
    1a8a:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    1a8c:	2300      	movs	r3, #0
    1a8e:	2200      	movs	r2, #0
    1a90:	4618      	mov	r0, r3
    1a92:	4611      	mov	r1, r2
    1a94:	df02      	svc	2
}
    1a96:	46bd      	mov	sp, r7
    1a98:	f85d 7b04 	ldr.w	r7, [sp], #4
    1a9c:	4770      	bx	lr
    1a9e:	bf00      	nop

00001aa0 <tvout_init>:
#define _enable_dma()  dma[DMACHAN].ccr|=DMA_CCR_EN
#define _disable_dma() dma[DMACHAN].ccr&=~DMA_CCR_EN
#define _enable_spi()  SPI2->cr1|=SPI_CR1_SPE;
#define _disable_spi()  SPI2->cr1&=~SPI_CR1_SPE;
 
 void tvout_init(){
    1aa0:	b580      	push	{r7, lr}
    1aa2:	b082      	sub	sp, #8
    1aa4:	af00      	add	r7, sp, #0
	//sortie sync sur PA8
	config_pin(GPIOA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    1aa6:	2000      	movs	r0, #0
    1aa8:	2108      	movs	r1, #8
    1aaa:	220a      	movs	r2, #10
    1aac:	f7ff fddc 	bl	1668 <config_pin>
	//sortie video sur PB15
	config_pin(GPIOB,15,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_50M);
    1ab0:	2001      	movs	r0, #1
    1ab2:	210f      	movs	r1, #15
    1ab4:	220b      	movs	r2, #11
    1ab6:	f7ff fdd7 	bl	1668 <config_pin>
	//timer 1 utilisé pour sync
	APB2ENR->fld.tim1en=1;
    1aba:	4a3b      	ldr	r2, [pc, #236]	; (1ba8 <tvout_init+0x108>)
    1abc:	7853      	ldrb	r3, [r2, #1]
    1abe:	f043 0308 	orr.w	r3, r3, #8
    1ac2:	7053      	strb	r3, [r2, #1]
	// clock source division
	*TIMER1_PSC=0;
    1ac4:	4b39      	ldr	r3, [pc, #228]	; (1bac <tvout_init+0x10c>)
    1ac6:	2200      	movs	r2, #0
    1ac8:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    1aca:	4b39      	ldr	r3, [pc, #228]	; (1bb0 <tvout_init+0x110>)
    1acc:	f241 12df 	movw	r2, #4575	; 0x11df
    1ad0:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    1ad2:	4b38      	ldr	r3, [pc, #224]	; (1bb4 <tvout_init+0x114>)
    1ad4:	f240 1251 	movw	r2, #337	; 0x151
    1ad8:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;
    1ada:	4b37      	ldr	r3, [pc, #220]	; (1bb8 <tvout_init+0x118>)
    1adc:	681a      	ldr	r2, [r3, #0]
    1ade:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    1ae2:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    1ae6:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1;
    1ae8:	4b33      	ldr	r3, [pc, #204]	; (1bb8 <tvout_init+0x118>)
    1aea:	681a      	ldr	r2, [r3, #0]
    1aec:	f042 0208 	orr.w	r2, r2, #8
    1af0:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1;
    1af2:	4b32      	ldr	r3, [pc, #200]	; (1bbc <tvout_init+0x11c>)
    1af4:	681a      	ldr	r2, [r3, #0]
    1af6:	f042 0201 	orr.w	r2, r2, #1
    1afa:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1;
    1afc:	4b2f      	ldr	r3, [pc, #188]	; (1bbc <tvout_init+0x11c>)
    1afe:	681a      	ldr	r2, [r3, #0]
    1b00:	f042 0202 	orr.w	r2, r2, #2
    1b04:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;
    1b06:	4a2e      	ldr	r2, [pc, #184]	; (1bc0 <tvout_init+0x120>)
    1b08:	8813      	ldrh	r3, [r2, #0]
    1b0a:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    1b0e:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    1b12:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    1b14:	4b2b      	ldr	r3, [pc, #172]	; (1bc4 <tvout_init+0x124>)
    1b16:	681a      	ldr	r2, [r3, #0]
    1b18:	f042 0201 	orr.w	r2, r2, #1
    1b1c:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->cr1=(FSPI_9M<<SPI_CR1_BR_POS)|SPI_CR1_MSTR;//|SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE;
    1b1e:	4b2a      	ldr	r3, [pc, #168]	; (1bc8 <tvout_init+0x128>)
    1b20:	f44f 7201 	mov.w	r2, #516	; 0x204
    1b24:	601a      	str	r2, [r3, #0]
	// configuration du canal dma
	dma[DMACHAN].ccr=DMA_CCR_DIR|DMA_CCR_CIRC|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS);
    1b26:	4b29      	ldr	r3, [pc, #164]	; (1bcc <tvout_init+0x12c>)
    1b28:	681b      	ldr	r3, [r3, #0]
    1b2a:	3364      	adds	r3, #100	; 0x64
    1b2c:	f243 02b0 	movw	r2, #12464	; 0x30b0
    1b30:	601a      	str	r2, [r3, #0]
	dma[DMACHAN].cndtr=ROW_SIZE;
    1b32:	4b26      	ldr	r3, [pc, #152]	; (1bcc <tvout_init+0x12c>)
    1b34:	681b      	ldr	r3, [r3, #0]
    1b36:	3364      	adds	r3, #100	; 0x64
    1b38:	223c      	movs	r2, #60	; 0x3c
    1b3a:	605a      	str	r2, [r3, #4]
	dma[DMACHAN].cmar=(uint32_t)line_buffer;
    1b3c:	4b23      	ldr	r3, [pc, #140]	; (1bcc <tvout_init+0x12c>)
    1b3e:	681b      	ldr	r3, [r3, #0]
    1b40:	3364      	adds	r3, #100	; 0x64
    1b42:	4a23      	ldr	r2, [pc, #140]	; (1bd0 <tvout_init+0x130>)
    1b44:	60da      	str	r2, [r3, #12]
	dma[DMACHAN].cpar=(uint32_t)SPI2_DR;
    1b46:	4b21      	ldr	r3, [pc, #132]	; (1bcc <tvout_init+0x12c>)
    1b48:	681b      	ldr	r3, [r3, #0]
    1b4a:	3364      	adds	r3, #100	; 0x64
    1b4c:	4a21      	ldr	r2, [pc, #132]	; (1bd4 <tvout_init+0x134>)
    1b4e:	609a      	str	r2, [r3, #8]
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    1b50:	4b21      	ldr	r3, [pc, #132]	; (1bd8 <tvout_init+0x138>)
    1b52:	681a      	ldr	r2, [r3, #0]
    1b54:	f042 0202 	orr.w	r2, r2, #2
    1b58:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,7);
    1b5a:	201b      	movs	r0, #27
    1b5c:	2107      	movs	r1, #7
    1b5e:	f7ff fe0f 	bl	1780 <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    1b62:	201b      	movs	r0, #27
    1b64:	f7ff fdc4 	bl	16f0 <enable_interrupt>
	// video test
	int i;
	for(i=0;i<(CHARS_PER_LINE*LINES_PER_SCREEN);i++){
    1b68:	2300      	movs	r3, #0
    1b6a:	607b      	str	r3, [r7, #4]
    1b6c:	e015      	b.n	1b9a <tvout_init+0xfa>
		*((uint8_t*)video_buffer+i)=(uint8_t)(i%FONT_SIZE+32);
    1b6e:	687b      	ldr	r3, [r7, #4]
    1b70:	4a1a      	ldr	r2, [pc, #104]	; (1bdc <tvout_init+0x13c>)
    1b72:	1898      	adds	r0, r3, r2
    1b74:	687a      	ldr	r2, [r7, #4]
    1b76:	4b1a      	ldr	r3, [pc, #104]	; (1be0 <tvout_init+0x140>)
    1b78:	fb83 1302 	smull	r1, r3, r3, r2
    1b7c:	1119      	asrs	r1, r3, #4
    1b7e:	17d3      	asrs	r3, r2, #31
    1b80:	1ac9      	subs	r1, r1, r3
    1b82:	460b      	mov	r3, r1
    1b84:	005b      	lsls	r3, r3, #1
    1b86:	440b      	add	r3, r1
    1b88:	015b      	lsls	r3, r3, #5
    1b8a:	1ad1      	subs	r1, r2, r3
    1b8c:	b2cb      	uxtb	r3, r1
    1b8e:	3320      	adds	r3, #32
    1b90:	b2db      	uxtb	r3, r3
    1b92:	7003      	strb	r3, [r0, #0]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,7);
	enable_interrupt(IRQ_TIM1_CC);
	// video test
	int i;
	for(i=0;i<(CHARS_PER_LINE*LINES_PER_SCREEN);i++){
    1b94:	687b      	ldr	r3, [r7, #4]
    1b96:	3301      	adds	r3, #1
    1b98:	607b      	str	r3, [r7, #4]
    1b9a:	687b      	ldr	r3, [r7, #4]
    1b9c:	f5b3 6f16 	cmp.w	r3, #2400	; 0x960
    1ba0:	dbe5      	blt.n	1b6e <tvout_init+0xce>
		*((uint8_t*)video_buffer+i)=(uint8_t)(i%FONT_SIZE+32);
	}
	// test end
 }
    1ba2:	3708      	adds	r7, #8
    1ba4:	46bd      	mov	sp, r7
    1ba6:	bd80      	pop	{r7, pc}
    1ba8:	40021018 	.word	0x40021018
    1bac:	40012c28 	.word	0x40012c28
    1bb0:	40012c2c 	.word	0x40012c2c
    1bb4:	40012c34 	.word	0x40012c34
    1bb8:	40012c18 	.word	0x40012c18
    1bbc:	40012c20 	.word	0x40012c20
    1bc0:	40012c44 	.word	0x40012c44
    1bc4:	40012c00 	.word	0x40012c00
    1bc8:	40003800 	.word	0x40003800
    1bcc:	20000004 	.word	0x20000004
    1bd0:	200000e0 	.word	0x200000e0
    1bd4:	4000380c 	.word	0x4000380c
    1bd8:	40012c0c 	.word	0x40012c0c
    1bdc:	20000128 	.word	0x20000128
    1be0:	2aaaaaab 	.word	0x2aaaaaab

00001be4 <put_bits>:

volatile static uint8_t line_buffer[60];

void put_bits(int pos, uint8_t bits){
    1be4:	b480      	push	{r7}
    1be6:	b085      	sub	sp, #20
    1be8:	af00      	add	r7, sp, #0
    1bea:	6078      	str	r0, [r7, #4]
    1bec:	460b      	mov	r3, r1
    1bee:	70fb      	strb	r3, [r7, #3]
	int bpos,ofs;
	
	bpos=pos>>3;
    1bf0:	687b      	ldr	r3, [r7, #4]
    1bf2:	10db      	asrs	r3, r3, #3
    1bf4:	60fb      	str	r3, [r7, #12]
	ofs=pos&0x7;
    1bf6:	687b      	ldr	r3, [r7, #4]
    1bf8:	f003 0307 	and.w	r3, r3, #7
    1bfc:	60bb      	str	r3, [r7, #8]
	line_buffer[bpos]|=bits>>ofs;
    1bfe:	4a15      	ldr	r2, [pc, #84]	; (1c54 <put_bits+0x70>)
    1c00:	68fb      	ldr	r3, [r7, #12]
    1c02:	4413      	add	r3, r2
    1c04:	781b      	ldrb	r3, [r3, #0]
    1c06:	b2db      	uxtb	r3, r3
    1c08:	b2d9      	uxtb	r1, r3
    1c0a:	78fa      	ldrb	r2, [r7, #3]
    1c0c:	68bb      	ldr	r3, [r7, #8]
    1c0e:	fa42 f303 	asr.w	r3, r2, r3
    1c12:	b2db      	uxtb	r3, r3
    1c14:	460a      	mov	r2, r1
    1c16:	4313      	orrs	r3, r2
    1c18:	b2db      	uxtb	r3, r3
    1c1a:	b2d9      	uxtb	r1, r3
    1c1c:	4a0d      	ldr	r2, [pc, #52]	; (1c54 <put_bits+0x70>)
    1c1e:	68fb      	ldr	r3, [r7, #12]
    1c20:	4413      	add	r3, r2
    1c22:	460a      	mov	r2, r1
    1c24:	701a      	strb	r2, [r3, #0]
	if ((ofs+CHAR_WIDTH)>8){
    1c26:	68bb      	ldr	r3, [r7, #8]
    1c28:	3306      	adds	r3, #6
    1c2a:	2b08      	cmp	r3, #8
    1c2c:	dd0c      	ble.n	1c48 <put_bits+0x64>
		bits<<=ofs;
    1c2e:	78fa      	ldrb	r2, [r7, #3]
    1c30:	68bb      	ldr	r3, [r7, #8]
    1c32:	fa02 f303 	lsl.w	r3, r2, r3
    1c36:	70fb      	strb	r3, [r7, #3]
		bpos++;
    1c38:	68fb      	ldr	r3, [r7, #12]
    1c3a:	3301      	adds	r3, #1
    1c3c:	60fb      	str	r3, [r7, #12]
		line_buffer[bpos]=bits;
    1c3e:	4a05      	ldr	r2, [pc, #20]	; (1c54 <put_bits+0x70>)
    1c40:	68fb      	ldr	r3, [r7, #12]
    1c42:	4413      	add	r3, r2
    1c44:	78fa      	ldrb	r2, [r7, #3]
    1c46:	701a      	strb	r2, [r3, #0]
	}
}
    1c48:	3714      	adds	r7, #20
    1c4a:	46bd      	mov	sp, r7
    1c4c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1c50:	4770      	bx	lr
    1c52:	bf00      	nop
    1c54:	200000e0 	.word	0x200000e0

00001c58 <TIM1_CC_handler>:
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
void TIM1_CC_handler(){
    1c58:	b480      	push	{r7}
    1c5a:	af00      	add	r7, sp, #0
	int r,c,fr;
	uint8_t ch;

	//_disable_spi();
	line_count++;
    1c5c:	4b62      	ldr	r3, [pc, #392]	; (1de8 <TIM1_CC_handler+0x190>)
    1c5e:	681b      	ldr	r3, [r3, #0]
    1c60:	3301      	adds	r3, #1
    1c62:	4a61      	ldr	r2, [pc, #388]	; (1de8 <TIM1_CC_handler+0x190>)
    1c64:	6013      	str	r3, [r2, #0]
	TIMER1_SR->fld.cc1if=0;
    1c66:	4b61      	ldr	r3, [pc, #388]	; (1dec <TIM1_CC_handler+0x194>)
    1c68:	681a      	ldr	r2, [r3, #0]
    1c6a:	f022 0202 	bic.w	r2, r2, #2
    1c6e:	601a      	str	r2, [r3, #0]
	switch(line_count){
    1c70:	4b5d      	ldr	r3, [pc, #372]	; (1de8 <TIM1_CC_handler+0x190>)
    1c72:	681b      	ldr	r3, [r3, #0]
    1c74:	2b12      	cmp	r3, #18
    1c76:	d048      	beq.n	1d0a <TIM1_CC_handler+0xb2>
    1c78:	2b12      	cmp	r3, #18
    1c7a:	dc0b      	bgt.n	1c94 <TIM1_CC_handler+0x3c>
    1c7c:	2b06      	cmp	r3, #6
    1c7e:	d029      	beq.n	1cd4 <TIM1_CC_handler+0x7c>
    1c80:	2b06      	cmp	r3, #6
    1c82:	dc02      	bgt.n	1c8a <TIM1_CC_handler+0x32>
    1c84:	2b00      	cmp	r3, #0
    1c86:	d016      	beq.n	1cb6 <TIM1_CC_handler+0x5e>
    1c88:	e086      	b.n	1d98 <TIM1_CC_handler+0x140>
    1c8a:	2b0c      	cmp	r3, #12
    1c8c:	d027      	beq.n	1cde <TIM1_CC_handler+0x86>
    1c8e:	2b11      	cmp	r3, #17
    1c90:	d02d      	beq.n	1cee <TIM1_CC_handler+0x96>
    1c92:	e081      	b.n	1d98 <TIM1_CC_handler+0x140>
    1c94:	f5b3 7f87 	cmp.w	r3, #270	; 0x10e
    1c98:	d04f      	beq.n	1d3a <TIM1_CC_handler+0xe2>
    1c9a:	f5b3 7f87 	cmp.w	r3, #270	; 0x10e
    1c9e:	dc02      	bgt.n	1ca6 <TIM1_CC_handler+0x4e>
    1ca0:	2b1e      	cmp	r3, #30
    1ca2:	d040      	beq.n	1d26 <TIM1_CC_handler+0xce>
    1ca4:	e078      	b.n	1d98 <TIM1_CC_handler+0x140>
    1ca6:	f240 120f 	movw	r2, #271	; 0x10f
    1caa:	4293      	cmp	r3, r2
    1cac:	d04f      	beq.n	1d4e <TIM1_CC_handler+0xf6>
    1cae:	f5b3 7f88 	cmp.w	r3, #272	; 0x110
    1cb2:	d05b      	beq.n	1d6c <TIM1_CC_handler+0x114>
    1cb4:	e070      	b.n	1d98 <TIM1_CC_handler+0x140>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    1cb6:	4a4e      	ldr	r2, [pc, #312]	; (1df0 <TIM1_CC_handler+0x198>)
    1cb8:	4b4d      	ldr	r3, [pc, #308]	; (1df0 <TIM1_CC_handler+0x198>)
    1cba:	881b      	ldrh	r3, [r3, #0]
    1cbc:	b29b      	uxth	r3, r3
    1cbe:	085b      	lsrs	r3, r3, #1
    1cc0:	b29b      	uxth	r3, r3
    1cc2:	8013      	strh	r3, [r2, #0]
		*TIMER1_CCR1/=2;
    1cc4:	4a4b      	ldr	r2, [pc, #300]	; (1df4 <TIM1_CC_handler+0x19c>)
    1cc6:	4b4b      	ldr	r3, [pc, #300]	; (1df4 <TIM1_CC_handler+0x19c>)
    1cc8:	881b      	ldrh	r3, [r3, #0]
    1cca:	b29b      	uxth	r3, r3
    1ccc:	085b      	lsrs	r3, r3, #1
    1cce:	b29b      	uxth	r3, r3
    1cd0:	8013      	strh	r3, [r2, #0]
		break;
    1cd2:	e084      	b.n	1dde <TIM1_CC_handler+0x186>
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    1cd4:	4b47      	ldr	r3, [pc, #284]	; (1df4 <TIM1_CC_handler+0x19c>)
    1cd6:	f640 0246 	movw	r2, #2118	; 0x846
    1cda:	801a      	strh	r2, [r3, #0]
	    break;
    1cdc:	e07f      	b.n	1dde <TIM1_CC_handler+0x186>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    1cde:	4b44      	ldr	r3, [pc, #272]	; (1df0 <TIM1_CC_handler+0x198>)
    1ce0:	f640 02ef 	movw	r2, #2287	; 0x8ef
    1ce4:	801a      	strh	r2, [r3, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    1ce6:	4b43      	ldr	r3, [pc, #268]	; (1df4 <TIM1_CC_handler+0x19c>)
    1ce8:	22a8      	movs	r2, #168	; 0xa8
    1cea:	801a      	strh	r2, [r3, #0]
		break;
    1cec:	e077      	b.n	1dde <TIM1_CC_handler+0x186>
	case 17: // fin sync champ paire
		if (even){
    1cee:	4b42      	ldr	r3, [pc, #264]	; (1df8 <TIM1_CC_handler+0x1a0>)
    1cf0:	681b      	ldr	r3, [r3, #0]
    1cf2:	2b00      	cmp	r3, #0
    1cf4:	d008      	beq.n	1d08 <TIM1_CC_handler+0xb0>
			*TIMER1_ARR=(FCLK/HFREQ-1);
    1cf6:	4b3e      	ldr	r3, [pc, #248]	; (1df0 <TIM1_CC_handler+0x198>)
    1cf8:	f241 12df 	movw	r2, #4575	; 0x11df
    1cfc:	801a      	strh	r2, [r3, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    1cfe:	4b3d      	ldr	r3, [pc, #244]	; (1df4 <TIM1_CC_handler+0x19c>)
    1d00:	f240 1251 	movw	r2, #337	; 0x151
    1d04:	801a      	strh	r2, [r3, #0]
		}
		break;
    1d06:	e06a      	b.n	1dde <TIM1_CC_handler+0x186>
    1d08:	e069      	b.n	1dde <TIM1_CC_handler+0x186>
	case 18: // fin vsync
		if (!even){
    1d0a:	4b3b      	ldr	r3, [pc, #236]	; (1df8 <TIM1_CC_handler+0x1a0>)
    1d0c:	681b      	ldr	r3, [r3, #0]
    1d0e:	2b00      	cmp	r3, #0
    1d10:	d108      	bne.n	1d24 <TIM1_CC_handler+0xcc>
			*TIMER1_ARR=(FCLK/HFREQ-1);
    1d12:	4b37      	ldr	r3, [pc, #220]	; (1df0 <TIM1_CC_handler+0x198>)
    1d14:	f241 12df 	movw	r2, #4575	; 0x11df
    1d18:	801a      	strh	r2, [r3, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    1d1a:	4b36      	ldr	r3, [pc, #216]	; (1df4 <TIM1_CC_handler+0x19c>)
    1d1c:	f240 1251 	movw	r2, #337	; 0x151
    1d20:	801a      	strh	r2, [r3, #0]
		}
		break;
    1d22:	e05c      	b.n	1dde <TIM1_CC_handler+0x186>
    1d24:	e05b      	b.n	1dde <TIM1_CC_handler+0x186>
	case TOP_LINE:
		video=1;
    1d26:	4b35      	ldr	r3, [pc, #212]	; (1dfc <TIM1_CC_handler+0x1a4>)
    1d28:	2201      	movs	r2, #1
    1d2a:	601a      	str	r2, [r3, #0]
		_enable_spi();
    1d2c:	4a34      	ldr	r2, [pc, #208]	; (1e00 <TIM1_CC_handler+0x1a8>)
    1d2e:	4b34      	ldr	r3, [pc, #208]	; (1e00 <TIM1_CC_handler+0x1a8>)
    1d30:	681b      	ldr	r3, [r3, #0]
    1d32:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1d36:	6013      	str	r3, [r2, #0]
		//_enable_dma();
		break;
    1d38:	e051      	b.n	1dde <TIM1_CC_handler+0x186>
	case (TOP_LINE+VRES):
		video=0;
    1d3a:	4b30      	ldr	r3, [pc, #192]	; (1dfc <TIM1_CC_handler+0x1a4>)
    1d3c:	2200      	movs	r2, #0
    1d3e:	601a      	str	r2, [r3, #0]
		_disable_spi();
    1d40:	4a2f      	ldr	r2, [pc, #188]	; (1e00 <TIM1_CC_handler+0x1a8>)
    1d42:	4b2f      	ldr	r3, [pc, #188]	; (1e00 <TIM1_CC_handler+0x1a8>)
    1d44:	681b      	ldr	r3, [r3, #0]
    1d46:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    1d4a:	6013      	str	r3, [r2, #0]
		//_disable_dma();
		break;
    1d4c:	e047      	b.n	1dde <TIM1_CC_handler+0x186>
	case FIELD_END:
		if (!even){
    1d4e:	4b2a      	ldr	r3, [pc, #168]	; (1df8 <TIM1_CC_handler+0x1a0>)
    1d50:	681b      	ldr	r3, [r3, #0]
    1d52:	2b00      	cmp	r3, #0
    1d54:	d109      	bne.n	1d6a <TIM1_CC_handler+0x112>
			line_count=-1;
    1d56:	4b24      	ldr	r3, [pc, #144]	; (1de8 <TIM1_CC_handler+0x190>)
    1d58:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    1d5c:	601a      	str	r2, [r3, #0]
			even=-even;
    1d5e:	4b26      	ldr	r3, [pc, #152]	; (1df8 <TIM1_CC_handler+0x1a0>)
    1d60:	681b      	ldr	r3, [r3, #0]
    1d62:	425b      	negs	r3, r3
    1d64:	4a24      	ldr	r2, [pc, #144]	; (1df8 <TIM1_CC_handler+0x1a0>)
    1d66:	6013      	str	r3, [r2, #0]
		}
		break;
    1d68:	e039      	b.n	1dde <TIM1_CC_handler+0x186>
    1d6a:	e038      	b.n	1dde <TIM1_CC_handler+0x186>
	case (FIELD_END+1):
		if (even){
    1d6c:	4b22      	ldr	r3, [pc, #136]	; (1df8 <TIM1_CC_handler+0x1a0>)
    1d6e:	681b      	ldr	r3, [r3, #0]
    1d70:	2b00      	cmp	r3, #0
    1d72:	d010      	beq.n	1d96 <TIM1_CC_handler+0x13e>
			*TIMER1_ARR/=2;
    1d74:	4a1e      	ldr	r2, [pc, #120]	; (1df0 <TIM1_CC_handler+0x198>)
    1d76:	4b1e      	ldr	r3, [pc, #120]	; (1df0 <TIM1_CC_handler+0x198>)
    1d78:	881b      	ldrh	r3, [r3, #0]
    1d7a:	b29b      	uxth	r3, r3
    1d7c:	085b      	lsrs	r3, r3, #1
    1d7e:	b29b      	uxth	r3, r3
    1d80:	8013      	strh	r3, [r2, #0]
			line_count=-1;
    1d82:	4b19      	ldr	r3, [pc, #100]	; (1de8 <TIM1_CC_handler+0x190>)
    1d84:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    1d88:	601a      	str	r2, [r3, #0]
			even=-even;
    1d8a:	4b1b      	ldr	r3, [pc, #108]	; (1df8 <TIM1_CC_handler+0x1a0>)
    1d8c:	681b      	ldr	r3, [r3, #0]
    1d8e:	425b      	negs	r3, r3
    1d90:	4a19      	ldr	r2, [pc, #100]	; (1df8 <TIM1_CC_handler+0x1a0>)
    1d92:	6013      	str	r3, [r2, #0]
		}
	    break;
    1d94:	e023      	b.n	1dde <TIM1_CC_handler+0x186>
    1d96:	e022      	b.n	1dde <TIM1_CC_handler+0x186>
				put_bits(c*CHAR_WIDTH,ch);
			}
			_enable_dma();
			_enable_spi();
		};*/
		if (video){
    1d98:	4b18      	ldr	r3, [pc, #96]	; (1dfc <TIM1_CC_handler+0x1a4>)
    1d9a:	681b      	ldr	r3, [r3, #0]
    1d9c:	2b00      	cmp	r3, #0
    1d9e:	d01e      	beq.n	1dde <TIM1_CC_handler+0x186>
			while (*TIMER1_CNT<((FCLK/HFREQ-1)/4));
    1da0:	bf00      	nop
    1da2:	4b18      	ldr	r3, [pc, #96]	; (1e04 <TIM1_CC_handler+0x1ac>)
    1da4:	881b      	ldrh	r3, [r3, #0]
    1da6:	b29b      	uxth	r3, r3
    1da8:	f240 4276 	movw	r2, #1142	; 0x476
    1dac:	4293      	cmp	r3, r2
    1dae:	d9f8      	bls.n	1da2 <TIM1_CC_handler+0x14a>
			_enable_spi();
    1db0:	4a13      	ldr	r2, [pc, #76]	; (1e00 <TIM1_CC_handler+0x1a8>)
    1db2:	4b13      	ldr	r3, [pc, #76]	; (1e00 <TIM1_CC_handler+0x1a8>)
    1db4:	681b      	ldr	r3, [r3, #0]
    1db6:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1dba:	6013      	str	r3, [r2, #0]
			SPI2->dr=255;
    1dbc:	4b10      	ldr	r3, [pc, #64]	; (1e00 <TIM1_CC_handler+0x1a8>)
    1dbe:	22ff      	movs	r2, #255	; 0xff
    1dc0:	60da      	str	r2, [r3, #12]
			while (*TIMER1_CNT<((FCLK/HFREQ-1)/2));
    1dc2:	bf00      	nop
    1dc4:	4b0f      	ldr	r3, [pc, #60]	; (1e04 <TIM1_CC_handler+0x1ac>)
    1dc6:	881b      	ldrh	r3, [r3, #0]
    1dc8:	b29b      	uxth	r3, r3
    1dca:	f640 02ee 	movw	r2, #2286	; 0x8ee
    1dce:	4293      	cmp	r3, r2
    1dd0:	d9f8      	bls.n	1dc4 <TIM1_CC_handler+0x16c>
			//while (!(SPI2->sr&SPI_SR_TXE));
			_disable_spi();
    1dd2:	4a0b      	ldr	r2, [pc, #44]	; (1e00 <TIM1_CC_handler+0x1a8>)
    1dd4:	4b0a      	ldr	r3, [pc, #40]	; (1e00 <TIM1_CC_handler+0x1a8>)
    1dd6:	681b      	ldr	r3, [r3, #0]
    1dd8:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    1ddc:	6013      	str	r3, [r2, #0]
		}
	}//switch (line_count)
}
    1dde:	46bd      	mov	sp, r7
    1de0:	f85d 7b04 	ldr.w	r7, [sp], #4
    1de4:	4770      	bx	lr
    1de6:	bf00      	nop
    1de8:	20000008 	.word	0x20000008
    1dec:	40012c10 	.word	0x40012c10
    1df0:	40012c2c 	.word	0x40012c2c
    1df4:	40012c34 	.word	0x40012c34
    1df8:	20000120 	.word	0x20000120
    1dfc:	2000011c 	.word	0x2000011c
    1e00:	40003800 	.word	0x40003800
    1e04:	40012c24 	.word	0x40012c24

00001e08 <uart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
    1e08:	b480      	push	{r7}
    1e0a:	b085      	sub	sp, #20
    1e0c:	af00      	add	r7, sp, #0
    1e0e:	6078      	str	r0, [r7, #4]
    1e10:	6039      	str	r1, [r7, #0]
	sfrp_t brr;
	uint32_t rate;

    brr=(sfrp_t)(channel+USART_BRR_OFS);		
    1e12:	687b      	ldr	r3, [r7, #4]
    1e14:	3308      	adds	r3, #8
    1e16:	60bb      	str	r3, [r7, #8]
	switch (channel){
    1e18:	687b      	ldr	r3, [r7, #4]
    1e1a:	4a1a      	ldr	r2, [pc, #104]	; (1e84 <uart_set_baud+0x7c>)
    1e1c:	4293      	cmp	r3, r2
    1e1e:	d019      	beq.n	1e54 <uart_set_baud+0x4c>
    1e20:	4a19      	ldr	r2, [pc, #100]	; (1e88 <uart_set_baud+0x80>)
    1e22:	4293      	cmp	r3, r2
    1e24:	d003      	beq.n	1e2e <uart_set_baud+0x26>
    1e26:	4a19      	ldr	r2, [pc, #100]	; (1e8c <uart_set_baud+0x84>)
    1e28:	4293      	cmp	r3, r2
    1e2a:	d013      	beq.n	1e54 <uart_set_baud+0x4c>
    1e2c:	e021      	b.n	1e72 <uart_set_baud+0x6a>
	case USART1:
		rate=(FAPB2/baud/16)<<4;
    1e2e:	4a18      	ldr	r2, [pc, #96]	; (1e90 <uart_set_baud+0x88>)
    1e30:	683b      	ldr	r3, [r7, #0]
    1e32:	fbb2 f3f3 	udiv	r3, r2, r3
    1e36:	011b      	lsls	r3, r3, #4
    1e38:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    1e3a:	4a16      	ldr	r2, [pc, #88]	; (1e94 <uart_set_baud+0x8c>)
    1e3c:	683b      	ldr	r3, [r7, #0]
    1e3e:	fbb2 f3f3 	udiv	r3, r2, r3
    1e42:	f003 030f 	and.w	r3, r3, #15
    1e46:	68fa      	ldr	r2, [r7, #12]
    1e48:	4313      	orrs	r3, r2
    1e4a:	60fb      	str	r3, [r7, #12]
		*brr=rate;
    1e4c:	68bb      	ldr	r3, [r7, #8]
    1e4e:	68fa      	ldr	r2, [r7, #12]
    1e50:	601a      	str	r2, [r3, #0]
		return;
    1e52:	e011      	b.n	1e78 <uart_set_baud+0x70>
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
    1e54:	4a10      	ldr	r2, [pc, #64]	; (1e98 <uart_set_baud+0x90>)
    1e56:	683b      	ldr	r3, [r7, #0]
    1e58:	fbb2 f3f3 	udiv	r3, r2, r3
    1e5c:	011b      	lsls	r3, r3, #4
    1e5e:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    1e60:	4a0e      	ldr	r2, [pc, #56]	; (1e9c <uart_set_baud+0x94>)
    1e62:	683b      	ldr	r3, [r7, #0]
    1e64:	fbb2 f3f3 	udiv	r3, r2, r3
    1e68:	f003 030f 	and.w	r3, r3, #15
    1e6c:	68fa      	ldr	r2, [r7, #12]
    1e6e:	4313      	orrs	r3, r2
    1e70:	60fb      	str	r3, [r7, #12]
	}
	*brr=rate;
    1e72:	68bb      	ldr	r3, [r7, #8]
    1e74:	68fa      	ldr	r2, [r7, #12]
    1e76:	601a      	str	r2, [r3, #0]
}
    1e78:	3714      	adds	r7, #20
    1e7a:	46bd      	mov	sp, r7
    1e7c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e80:	4770      	bx	lr
    1e82:	bf00      	nop
    1e84:	40004800 	.word	0x40004800
    1e88:	40013800 	.word	0x40013800
    1e8c:	40004400 	.word	0x40004400
    1e90:	0044aa20 	.word	0x0044aa20
    1e94:	044aa200 	.word	0x044aa200
    1e98:	00225510 	.word	0x00225510
    1e9c:	02255100 	.word	0x02255100

00001ea0 <uart_open_channel>:

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl){
    1ea0:	b580      	push	{r7, lr}
    1ea2:	b086      	sub	sp, #24
    1ea4:	af00      	add	r7, sp, #0
    1ea6:	60f8      	str	r0, [r7, #12]
    1ea8:	60b9      	str	r1, [r7, #8]
    1eaa:	607a      	str	r2, [r7, #4]
	sfrp_t cr1, cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
    1eac:	68fb      	ldr	r3, [r7, #12]
    1eae:	4a40      	ldr	r2, [pc, #256]	; (1fb0 <uart_open_channel+0x110>)
    1eb0:	4293      	cmp	r3, r2
    1eb2:	d044      	beq.n	1f3e <uart_open_channel+0x9e>
    1eb4:	4a3f      	ldr	r2, [pc, #252]	; (1fb4 <uart_open_channel+0x114>)
    1eb6:	4293      	cmp	r3, r2
    1eb8:	d003      	beq.n	1ec2 <uart_open_channel+0x22>
    1eba:	4a3f      	ldr	r2, [pc, #252]	; (1fb8 <uart_open_channel+0x118>)
    1ebc:	4293      	cmp	r3, r2
    1ebe:	d020      	beq.n	1f02 <uart_open_channel+0x62>
    1ec0:	e05b      	b.n	1f7a <uart_open_channel+0xda>
	case USART1:
		APB2ENR->apb2enr|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
    1ec2:	4a3e      	ldr	r2, [pc, #248]	; (1fbc <uart_open_channel+0x11c>)
    1ec4:	4b3d      	ldr	r3, [pc, #244]	; (1fbc <uart_open_channel+0x11c>)
    1ec6:	681b      	ldr	r3, [r3, #0]
    1ec8:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    1ecc:	f043 0304 	orr.w	r3, r3, #4
    1ed0:	6013      	str	r3, [r2, #0]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    1ed2:	4a3b      	ldr	r2, [pc, #236]	; (1fc0 <uart_open_channel+0x120>)
    1ed4:	4b3a      	ldr	r3, [pc, #232]	; (1fc0 <uart_open_channel+0x120>)
    1ed6:	681b      	ldr	r3, [r3, #0]
    1ed8:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    1edc:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    1ee0:	6013      	str	r3, [r2, #0]
		GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    1ee2:	4a37      	ldr	r2, [pc, #220]	; (1fc0 <uart_open_channel+0x120>)
    1ee4:	4b36      	ldr	r3, [pc, #216]	; (1fc0 <uart_open_channel+0x120>)
    1ee6:	681b      	ldr	r3, [r3, #0]
    1ee8:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    1eec:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    1ef0:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART1,7);
    1ef2:	2025      	movs	r0, #37	; 0x25
    1ef4:	2107      	movs	r1, #7
    1ef6:	f7ff fc43 	bl	1780 <set_int_priority>
		enable_interrupt(USART1_IRQ);
    1efa:	2025      	movs	r0, #37	; 0x25
    1efc:	f7ff fbf8 	bl	16f0 <enable_interrupt>
		break;
    1f00:	e03b      	b.n	1f7a <uart_open_channel+0xda>
	case USART2:
		APB1ENR->fld.usart2en=1;
    1f02:	4a30      	ldr	r2, [pc, #192]	; (1fc4 <uart_open_channel+0x124>)
    1f04:	7893      	ldrb	r3, [r2, #2]
    1f06:	f043 0302 	orr.w	r3, r3, #2
    1f0a:	7093      	strb	r3, [r2, #2]
		APB2ENR->fld.iopaen=1;
    1f0c:	4a2b      	ldr	r2, [pc, #172]	; (1fbc <uart_open_channel+0x11c>)
    1f0e:	7813      	ldrb	r3, [r2, #0]
    1f10:	f043 0304 	orr.w	r3, r3, #4
    1f14:	7013      	strb	r3, [r2, #0]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    1f16:	4a2c      	ldr	r2, [pc, #176]	; (1fc8 <uart_open_channel+0x128>)
    1f18:	4b2b      	ldr	r3, [pc, #172]	; (1fc8 <uart_open_channel+0x128>)
    1f1a:	681b      	ldr	r3, [r3, #0]
    1f1c:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    1f20:	6013      	str	r3, [r2, #0]
		GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    1f22:	4a29      	ldr	r2, [pc, #164]	; (1fc8 <uart_open_channel+0x128>)
    1f24:	4b28      	ldr	r3, [pc, #160]	; (1fc8 <uart_open_channel+0x128>)
    1f26:	681b      	ldr	r3, [r3, #0]
    1f28:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    1f2c:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART2,7);
    1f2e:	2026      	movs	r0, #38	; 0x26
    1f30:	2107      	movs	r1, #7
    1f32:	f7ff fc25 	bl	1780 <set_int_priority>
		enable_interrupt(USART2_IRQ);
    1f36:	2026      	movs	r0, #38	; 0x26
    1f38:	f7ff fbda 	bl	16f0 <enable_interrupt>
		break;
    1f3c:	e01d      	b.n	1f7a <uart_open_channel+0xda>
	case USART3:
		APB1ENR->fld.usart3en=1;
    1f3e:	4a21      	ldr	r2, [pc, #132]	; (1fc4 <uart_open_channel+0x124>)
    1f40:	7893      	ldrb	r3, [r2, #2]
    1f42:	f043 0304 	orr.w	r3, r3, #4
    1f46:	7093      	strb	r3, [r2, #2]
		APB2ENR->fld.iopben=1;
    1f48:	4a1c      	ldr	r2, [pc, #112]	; (1fbc <uart_open_channel+0x11c>)
    1f4a:	7813      	ldrb	r3, [r2, #0]
    1f4c:	f043 0308 	orr.w	r3, r3, #8
    1f50:	7013      	strb	r3, [r2, #0]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    1f52:	4a1e      	ldr	r2, [pc, #120]	; (1fcc <uart_open_channel+0x12c>)
    1f54:	4b1d      	ldr	r3, [pc, #116]	; (1fcc <uart_open_channel+0x12c>)
    1f56:	681b      	ldr	r3, [r3, #0]
    1f58:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    1f5c:	6013      	str	r3, [r2, #0]
		GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    1f5e:	4a1b      	ldr	r2, [pc, #108]	; (1fcc <uart_open_channel+0x12c>)
    1f60:	4b1a      	ldr	r3, [pc, #104]	; (1fcc <uart_open_channel+0x12c>)
    1f62:	681b      	ldr	r3, [r3, #0]
    1f64:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    1f68:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART3,7);
    1f6a:	2027      	movs	r0, #39	; 0x27
    1f6c:	2107      	movs	r1, #7
    1f6e:	f7ff fc07 	bl	1780 <set_int_priority>
		enable_interrupt(USART3_IRQ);
    1f72:	2027      	movs	r0, #39	; 0x27
    1f74:	f7ff fbbc 	bl	16f0 <enable_interrupt>
		break;
    1f78:	bf00      	nop
	}
	uart_set_baud(channel,baud);
    1f7a:	68f8      	ldr	r0, [r7, #12]
    1f7c:	68b9      	ldr	r1, [r7, #8]
    1f7e:	f7ff ff43 	bl	1e08 <uart_set_baud>
	if (flow_ctrl==FLOW_HARD){
    1f82:	687b      	ldr	r3, [r7, #4]
    1f84:	2b01      	cmp	r3, #1
    1f86:	d106      	bne.n	1f96 <uart_open_channel+0xf6>
		cr3=(sfrp_t)(channel+USART_CR3_OFS);
    1f88:	68fb      	ldr	r3, [r7, #12]
    1f8a:	3314      	adds	r3, #20
    1f8c:	617b      	str	r3, [r7, #20]
		*cr3=(1<<USART_CR3_CTSE)|(1<<USART_CR3_RTSE);
    1f8e:	697b      	ldr	r3, [r7, #20]
    1f90:	f44f 7240 	mov.w	r2, #768	; 0x300
    1f94:	601a      	str	r2, [r3, #0]
	}
	cr1=(sfrp_t)(channel+USART_CR1_OFS);
    1f96:	68fb      	ldr	r3, [r7, #12]
    1f98:	330c      	adds	r3, #12
    1f9a:	613b      	str	r3, [r7, #16]
	uart_getc(channel);
    1f9c:	68f8      	ldr	r0, [r7, #12]
    1f9e:	f000 f82d 	bl	1ffc <uart_getc>
	*cr1=(1<<USART_CR1_UE)|(1<<USART_CR1_TE)|(1<<USART_CR1_RE)|(1<<USART_CR1_RXNEIE);
    1fa2:	693b      	ldr	r3, [r7, #16]
    1fa4:	f242 022c 	movw	r2, #8236	; 0x202c
    1fa8:	601a      	str	r2, [r3, #0]
}
    1faa:	3718      	adds	r7, #24
    1fac:	46bd      	mov	sp, r7
    1fae:	bd80      	pop	{r7, pc}
    1fb0:	40004800 	.word	0x40004800
    1fb4:	40013800 	.word	0x40013800
    1fb8:	40004400 	.word	0x40004400
    1fbc:	40021018 	.word	0x40021018
    1fc0:	40010804 	.word	0x40010804
    1fc4:	4002101c 	.word	0x4002101c
    1fc8:	40010800 	.word	0x40010800
    1fcc:	40010c04 	.word	0x40010c04

00001fd0 <uart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int uart_stat(unsigned channel){
    1fd0:	b480      	push	{r7}
    1fd2:	b085      	sub	sp, #20
    1fd4:	af00      	add	r7, sp, #0
    1fd6:	6078      	str	r0, [r7, #4]
	sfrp_t sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    1fd8:	687b      	ldr	r3, [r7, #4]
    1fda:	60fb      	str	r3, [r7, #12]
	return *sr&(1<<USART_SR_RXNE)?-1:0;
    1fdc:	68fb      	ldr	r3, [r7, #12]
    1fde:	681b      	ldr	r3, [r3, #0]
    1fe0:	f003 0320 	and.w	r3, r3, #32
    1fe4:	2b00      	cmp	r3, #0
    1fe6:	d002      	beq.n	1fee <uart_stat+0x1e>
    1fe8:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1fec:	e000      	b.n	1ff0 <uart_stat+0x20>
    1fee:	2300      	movs	r3, #0
}
    1ff0:	4618      	mov	r0, r3
    1ff2:	3714      	adds	r7, #20
    1ff4:	46bd      	mov	sp, r7
    1ff6:	f85d 7b04 	ldr.w	r7, [sp], #4
    1ffa:	4770      	bx	lr

00001ffc <uart_getc>:

// reçoit un caractère de la console
char uart_getc(unsigned channel){
    1ffc:	b480      	push	{r7}
    1ffe:	b085      	sub	sp, #20
    2000:	af00      	add	r7, sp, #0
    2002:	6078      	str	r0, [r7, #4]
	sfrp_t dr;
	
	dr=(sfrp_t)(channel+USART_DR_OFS);
    2004:	687b      	ldr	r3, [r7, #4]
    2006:	3304      	adds	r3, #4
    2008:	60fb      	str	r3, [r7, #12]
	return *dr&0x7f;
    200a:	68fb      	ldr	r3, [r7, #12]
    200c:	681b      	ldr	r3, [r3, #0]
    200e:	b2db      	uxtb	r3, r3
    2010:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    2014:	b2db      	uxtb	r3, r3
}
    2016:	4618      	mov	r0, r3
    2018:	3714      	adds	r7, #20
    201a:	46bd      	mov	sp, r7
    201c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2020:	4770      	bx	lr
    2022:	bf00      	nop

00002024 <uart_putc>:

// transmet un caractère à la console
void uart_putc(unsigned channel, char c){
    2024:	b480      	push	{r7}
    2026:	b085      	sub	sp, #20
    2028:	af00      	add	r7, sp, #0
    202a:	6078      	str	r0, [r7, #4]
    202c:	460b      	mov	r3, r1
    202e:	70fb      	strb	r3, [r7, #3]
	sfrp_t dr, sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    2030:	687b      	ldr	r3, [r7, #4]
    2032:	60fb      	str	r3, [r7, #12]
	dr=(sfrp_t)(channel+USART_DR_OFS);
    2034:	687b      	ldr	r3, [r7, #4]
    2036:	3304      	adds	r3, #4
    2038:	60bb      	str	r3, [r7, #8]
	//attend que dr soit vide
	while (!(*sr&(1<<USART_SR_TXE)));
    203a:	bf00      	nop
    203c:	68fb      	ldr	r3, [r7, #12]
    203e:	681b      	ldr	r3, [r3, #0]
    2040:	f003 0380 	and.w	r3, r3, #128	; 0x80
    2044:	2b00      	cmp	r3, #0
    2046:	d0f9      	beq.n	203c <uart_putc+0x18>
	*dr=c&0x7f;
    2048:	78fb      	ldrb	r3, [r7, #3]
    204a:	f003 027f 	and.w	r2, r3, #127	; 0x7f
    204e:	68bb      	ldr	r3, [r7, #8]
    2050:	601a      	str	r2, [r3, #0]
}
    2052:	3714      	adds	r7, #20
    2054:	46bd      	mov	sp, r7
    2056:	f85d 7b04 	ldr.w	r7, [sp], #4
    205a:	4770      	bx	lr

Disassembly of section .user_code:

00002560 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    2560:	b480      	push	{r7}
    2562:	b085      	sub	sp, #20
    2564:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    2566:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    256a:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    256c:	2300      	movs	r3, #0
    256e:	71fb      	strb	r3, [r7, #7]
	
	
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    2570:	2300      	movs	r3, #0
    2572:	2200      	movs	r2, #0
    2574:	4618      	mov	r0, r3
    2576:	4611      	mov	r1, r2
    2578:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    257a:	f107 030c 	add.w	r3, r7, #12
    257e:	2200      	movs	r2, #0
    2580:	4618      	mov	r0, r3
    2582:	4611      	mov	r1, r2
    2584:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    2586:	f107 0308 	add.w	r3, r7, #8
    258a:	2200      	movs	r2, #0
    258c:	4618      	mov	r0, r3
    258e:	4611      	mov	r1, r2
    2590:	df04      	svc	4
    2592:	68bb      	ldr	r3, [r7, #8]
    2594:	2b00      	cmp	r3, #0
    2596:	d1f6      	bne.n	2586 <blink+0x26>
		_svc_call(SVC_LED_ON,NUL,NUL);
    2598:	2300      	movs	r3, #0
    259a:	2200      	movs	r2, #0
    259c:	4618      	mov	r0, r3
    259e:	4611      	mov	r1, r2
    25a0:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    25a2:	f107 030c 	add.w	r3, r7, #12
    25a6:	2200      	movs	r2, #0
    25a8:	4618      	mov	r0, r3
    25aa:	4611      	mov	r1, r2
    25ac:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    25ae:	f107 0308 	add.w	r3, r7, #8
    25b2:	2200      	movs	r2, #0
    25b4:	4618      	mov	r0, r3
    25b6:	4611      	mov	r1, r2
    25b8:	df04      	svc	4
    25ba:	68bb      	ldr	r3, [r7, #8]
    25bc:	2b00      	cmp	r3, #0
    25be:	d1f6      	bne.n	25ae <blink+0x4e>
		_svc_call(SVC_CONIN,&c,NUL);
    25c0:	1dfb      	adds	r3, r7, #7
    25c2:	2200      	movs	r2, #0
    25c4:	4618      	mov	r0, r3
    25c6:	4611      	mov	r1, r2
    25c8:	df05      	svc	5
		if (c) break;
    25ca:	79fb      	ldrb	r3, [r7, #7]
    25cc:	b2db      	uxtb	r3, r3
    25ce:	2b00      	cmp	r3, #0
    25d0:	d000      	beq.n	25d4 <blink+0x74>
    25d2:	e000      	b.n	25d6 <blink+0x76>
	}
    25d4:	e7cc      	b.n	2570 <blink+0x10>
}
    25d6:	3714      	adds	r7, #20
    25d8:	46bd      	mov	sp, r7
    25da:	f85d 7b04 	ldr.w	r7, [sp], #4
    25de:	4770      	bx	lr
