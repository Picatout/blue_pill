
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 11 1a 00 00     i...m...q.......
      20:	11 1a 00 00 11 1a 00 00 11 1a 00 00 ad 05 00 00     ................
      30:	11 1a 00 00 11 1a 00 00 79 02 00 00 61 07 00 00     ........y...a...
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 11 1a 00 00 11 1a 00 00 11 1a 00 00     ................
      80:	11 1a 00 00 11 1a 00 00 11 1a 00 00 11 1a 00 00     ................
      90:	11 1a 00 00 11 1a 00 00 11 1a 00 00 11 1a 00 00     ................
      a0:	11 1a 00 00 11 1a 00 00 11 1a 00 00 39 1c 00 00     ............9...
      b0:	11 1a 00 00 11 1a 00 00 11 1a 00 00 11 1a 00 00     ................
      c0:	11 1a 00 00 11 1a 00 00 11 1a 00 00 11 1a 00 00     ................
      d0:	11 1a 00 00 b9 02 00 00 45 10 00 00 c1 02 00 00     ........E.......
      e0:	11 1a 00 00 11 1a 00 00 11 1a 00 00 11 1a 00 00     ................
      f0:	11 1a 00 00 11 1a 00 00 11 1a 00 00 11 1a 00 00     ................
     100:	11 1a 00 00 11 1a 00 00 11 1a 00 00 11 1a 00 00     ................
     110:	11 1a 00 00 11 1a 00 00 11 1a 00 00 11 1a 00 00     ................
     120:	11 1a 00 00 11 1a 00 00 11 1a 00 00 11 1a 00 00     ................

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
     1b0:	f000 fee2 	bl	f78 <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	2000000c 	.word	0x2000000c
     1c0:	20002670 	.word	0x20002670
     1c4:	00002880 	.word	0x00002880
     1c8:	20000000 	.word	0x20000000
     1cc:	2000000c 	.word	0x2000000c
     1d0:	20002700 	.word	0x20002700
     1d4:	200000e8 	.word	0x200000e8
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
     208:	f001 fc0a 	bl	1a20 <print_fault>
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
     21e:	f001 fbff 	bl	1a20 <print_fault>
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
     234:	f001 fbf4 	bl	1a20 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f001 fbef 	bl	1a20 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	00002488 	.word	0x00002488
     258:	000024a0 	.word	0x000024a0
     25c:	000024ac 	.word	0x000024ac
     260:	000024bc 	.word	0x000024bc

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f001 fbd4 	bl	1a10 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f001 fbd2 	bl	1a10 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f001 fbd0 	bl	1a10 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f001 fbce 	bl	1a10 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f001 fbcc 	bl	1a10 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f001 fbca 	bl	1a10 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f001 fbc8 	bl	1a10 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f001 fbc6 	bl	1a10 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f001 fbc4 	bl	1a10 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f001 fbc2 	bl	1a10 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f001 fbc0 	bl	1a10 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f001 fbbe 	bl	1a10 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f001 fbbc 	bl	1a10 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f001 fbba 	bl	1a10 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f001 fbb8 	bl	1a10 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f001 fbb6 	bl	1a10 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f001 fbb4 	bl	1a10 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f001 fbb2 	bl	1a10 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f001 fbb0 	bl	1a10 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f001 fbae 	bl	1a10 <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2b4:	f001 fbac 	bl	1a10 <reset_mcu>

000002b8 <USART1_handler>:
_default_handler(USART1_handler) // 37
     2b8:	f001 fbaa 	bl	1a10 <reset_mcu>
_default_handler(USART2_handler) // 38
     2bc:	f001 fba8 	bl	1a10 <reset_mcu>

000002c0 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2c0:	f001 fba6 	bl	1a10 <reset_mcu>

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
     5d0:	2b13      	cmp	r3, #19
     5d2:	f200 80bd 	bhi.w	750 <SVC_handler+0x1a4>
     5d6:	a201      	add	r2, pc, #4	; (adr r2, 5dc <SVC_handler+0x30>)
     5d8:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     5dc:	0000074b 	.word	0x0000074b
     5e0:	0000062d 	.word	0x0000062d
     5e4:	00000633 	.word	0x00000633
     5e8:	00000639 	.word	0x00000639
     5ec:	00000645 	.word	0x00000645
     5f0:	00000651 	.word	0x00000651
     5f4:	0000065f 	.word	0x0000065f
     5f8:	0000066b 	.word	0x0000066b
     5fc:	0000067f 	.word	0x0000067f
     600:	00000687 	.word	0x00000687
     604:	00000695 	.word	0x00000695
     608:	000006a1 	.word	0x000006a1
     60c:	000006b5 	.word	0x000006b5
     610:	000006c9 	.word	0x000006c9
     614:	000006db 	.word	0x000006db
     618:	000006ef 	.word	0x000006ef
     61c:	00000703 	.word	0x00000703
     620:	00000717 	.word	0x00000717
     624:	0000072f 	.word	0x0000072f
     628:	00000741 	.word	0x00000741
	case SVC_LED_ON: 
		led_on();
     62c:	f7ff ff3e 	bl	4ac <led_on>
		break;
     630:	e08e      	b.n	750 <SVC_handler+0x1a4>
	case SVC_LED_OFF:
		led_off();
     632:	f7ff ff47 	bl	4c4 <led_off>
		break;
     636:	e08b      	b.n	750 <SVC_handler+0x1a4>
	case SVC_TIMER:
		set_timer(*(unsigned*)arg1);
     638:	68bb      	ldr	r3, [r7, #8]
     63a:	681b      	ldr	r3, [r3, #0]
     63c:	4618      	mov	r0, r3
     63e:	f7ff ff4d 	bl	4dc <set_timer>
		break;
     642:	e085      	b.n	750 <SVC_handler+0x1a4>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=get_timer();
     644:	f7ff ff58 	bl	4f8 <get_timer>
     648:	4602      	mov	r2, r0
     64a:	68bb      	ldr	r3, [r7, #8]
     64c:	601a      	str	r2, [r3, #0]
		break;
     64e:	e07f      	b.n	750 <SVC_handler+0x1a4>
	case SVC_CONIN:
		*(char *)arg1=conin();
     650:	f000 fd32 	bl	10b8 <conin>
     654:	4603      	mov	r3, r0
     656:	461a      	mov	r2, r3
     658:	68bb      	ldr	r3, [r7, #8]
     65a:	701a      	strb	r2, [r3, #0]
		break;
     65c:	e078      	b.n	750 <SVC_handler+0x1a4>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     65e:	68bb      	ldr	r3, [r7, #8]
     660:	781b      	ldrb	r3, [r3, #0]
     662:	4618      	mov	r0, r3
     664:	f000 fd18 	bl	1098 <conout>
		break;
     668:	e072      	b.n	750 <SVC_handler+0x1a4>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     66a:	68bb      	ldr	r3, [r7, #8]
     66c:	681b      	ldr	r3, [r3, #0]
     66e:	6878      	ldr	r0, [r7, #4]
     670:	4619      	mov	r1, r3
     672:	f000 fd99 	bl	11a8 <read_line>
     676:	4602      	mov	r2, r0
     678:	68bb      	ldr	r3, [r7, #8]
     67a:	601a      	str	r2, [r3, #0]
		break;
     67c:	e068      	b.n	750 <SVC_handler+0x1a4>
	case SVC_PRINT:
		print((const char*)arg1);
     67e:	68b8      	ldr	r0, [r7, #8]
     680:	f000 fd3c 	bl	10fc <print>
		break;
     684:	e064      	b.n	750 <SVC_handler+0x1a4>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     686:	68bb      	ldr	r3, [r7, #8]
     688:	681b      	ldr	r3, [r3, #0]
     68a:	4618      	mov	r0, r3
     68c:	210a      	movs	r1, #10
     68e:	f000 fe35 	bl	12fc <print_int>
		break;
     692:	e05d      	b.n	750 <SVC_handler+0x1a4>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     694:	68bb      	ldr	r3, [r7, #8]
     696:	681b      	ldr	r3, [r3, #0]
     698:	4618      	mov	r0, r3
     69a:	f000 fe9d 	bl	13d8 <print_hex>
		break;
     69e:	e057      	b.n	750 <SVC_handler+0x1a4>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     6a0:	68bb      	ldr	r3, [r7, #8]
     6a2:	681b      	ldr	r3, [r3, #0]
     6a4:	4618      	mov	r0, r3
     6a6:	f7ff ff33 	bl	510 <peek8>
     6aa:	4603      	mov	r3, r0
     6ac:	461a      	mov	r2, r3
     6ae:	68bb      	ldr	r3, [r7, #8]
     6b0:	701a      	strb	r2, [r3, #0]
		break;
     6b2:	e04d      	b.n	750 <SVC_handler+0x1a4>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     6b4:	68bb      	ldr	r3, [r7, #8]
     6b6:	681b      	ldr	r3, [r3, #0]
     6b8:	4618      	mov	r0, r3
     6ba:	f7ff ff35 	bl	528 <peek16>
     6be:	4603      	mov	r3, r0
     6c0:	461a      	mov	r2, r3
     6c2:	68bb      	ldr	r3, [r7, #8]
     6c4:	801a      	strh	r2, [r3, #0]
		break;
     6c6:	e043      	b.n	750 <SVC_handler+0x1a4>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     6c8:	68bb      	ldr	r3, [r7, #8]
     6ca:	681b      	ldr	r3, [r3, #0]
     6cc:	4618      	mov	r0, r3
     6ce:	f7ff ff37 	bl	540 <peek32>
     6d2:	4602      	mov	r2, r0
     6d4:	68bb      	ldr	r3, [r7, #8]
     6d6:	601a      	str	r2, [r3, #0]
		break;
     6d8:	e03a      	b.n	750 <SVC_handler+0x1a4>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
     6da:	68bb      	ldr	r3, [r7, #8]
     6dc:	681b      	ldr	r3, [r3, #0]
     6de:	461a      	mov	r2, r3
     6e0:	687b      	ldr	r3, [r7, #4]
     6e2:	781b      	ldrb	r3, [r3, #0]
     6e4:	4610      	mov	r0, r2
     6e6:	4619      	mov	r1, r3
     6e8:	f7ff ff36 	bl	558 <poke8>
		break;
     6ec:	e030      	b.n	750 <SVC_handler+0x1a4>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
     6ee:	68bb      	ldr	r3, [r7, #8]
     6f0:	681b      	ldr	r3, [r3, #0]
     6f2:	461a      	mov	r2, r3
     6f4:	687b      	ldr	r3, [r7, #4]
     6f6:	881b      	ldrh	r3, [r3, #0]
     6f8:	4610      	mov	r0, r2
     6fa:	4619      	mov	r1, r3
     6fc:	f7ff ff3a 	bl	574 <poke16>
		break;
     700:	e026      	b.n	750 <SVC_handler+0x1a4>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
     702:	68bb      	ldr	r3, [r7, #8]
     704:	681b      	ldr	r3, [r3, #0]
     706:	461a      	mov	r2, r3
     708:	687b      	ldr	r3, [r7, #4]
     70a:	681b      	ldr	r3, [r3, #0]
     70c:	4610      	mov	r0, r2
     70e:	4619      	mov	r1, r3
     710:	f7ff ff3e 	bl	590 <poke32>
		break;
     714:	e01c      	b.n	750 <SVC_handler+0x1a4>
	case SVC_FLASH_WR:
		*(int*)arg1=flash_write(*(uint32_t*)arg1,*(uint16_t*)arg2);
     716:	68bb      	ldr	r3, [r7, #8]
     718:	681a      	ldr	r2, [r3, #0]
     71a:	687b      	ldr	r3, [r7, #4]
     71c:	881b      	ldrh	r3, [r3, #0]
     71e:	4610      	mov	r0, r2
     720:	4619      	mov	r1, r3
     722:	f000 ff0b 	bl	153c <flash_write>
     726:	4602      	mov	r2, r0
     728:	68bb      	ldr	r3, [r7, #8]
     72a:	601a      	str	r2, [r3, #0]
		break;
     72c:	e010      	b.n	750 <SVC_handler+0x1a4>
	case SVC_FLASH_PGER:
		*(int*)arg1=flash_erase_page(*(uint32_t*)arg1);
     72e:	68bb      	ldr	r3, [r7, #8]
     730:	681b      	ldr	r3, [r3, #0]
     732:	4618      	mov	r0, r3
     734:	f000 ff46 	bl	15c4 <flash_erase_page>
     738:	4602      	mov	r2, r0
     73a:	68bb      	ldr	r3, [r7, #8]
     73c:	601a      	str	r2, [r3, #0]
		break;
     73e:	e007      	b.n	750 <SVC_handler+0x1a4>
	case SVC_TICKS:
		*(unsigned*)arg1=ticks;
     740:	4b06      	ldr	r3, [pc, #24]	; (75c <SVC_handler+0x1b0>)
     742:	681a      	ldr	r2, [r3, #0]
     744:	68bb      	ldr	r3, [r7, #8]
     746:	601a      	str	r2, [r3, #0]
		break;
     748:	e002      	b.n	750 <SVC_handler+0x1a4>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     74a:	f001 f961 	bl	1a10 <reset_mcu>
	    break;
     74e:	bf00      	nop
	}	
}
     750:	3710      	adds	r7, #16
     752:	46bd      	mov	sp, r7
     754:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     758:	4685      	mov	sp, r0
     75a:	4770      	bx	lr
     75c:	2000000c 	.word	0x2000000c

00000760 <STK_handler>:

// interruption coretimer
void __attribute__((naked)) STK_handler(){
	ticks++;
     760:	4b06      	ldr	r3, [pc, #24]	; (77c <STK_handler+0x1c>)
     762:	681b      	ldr	r3, [r3, #0]
     764:	3301      	adds	r3, #1
     766:	4a05      	ldr	r2, [pc, #20]	; (77c <STK_handler+0x1c>)
     768:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
     76a:	4b05      	ldr	r3, [pc, #20]	; (780 <STK_handler+0x20>)
     76c:	681b      	ldr	r3, [r3, #0]
     76e:	2b00      	cmp	r3, #0
     770:	d004      	beq.n	77c <STK_handler+0x1c>
     772:	4b03      	ldr	r3, [pc, #12]	; (780 <STK_handler+0x20>)
     774:	681b      	ldr	r3, [r3, #0]
     776:	3b01      	subs	r3, #1
     778:	4a01      	ldr	r2, [pc, #4]	; (780 <STK_handler+0x20>)
     77a:	6013      	str	r3, [r2, #0]
     77c:	2000000c 	.word	0x2000000c
     780:	20000010 	.word	0x20000010

00000784 <set_sysclock>:
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     784:	b480      	push	{r7}
     786:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC_CR->fld.hseon=1;
     788:	4b1f      	ldr	r3, [pc, #124]	; (808 <set_sysclock+0x84>)
     78a:	681a      	ldr	r2, [r3, #0]
     78c:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
     790:	601a      	str	r2, [r3, #0]
	 // attend que l'oscillateur soit prêt
   while (!RCC_CR->fld.hserdy);
     792:	bf00      	nop
     794:	4b1c      	ldr	r3, [pc, #112]	; (808 <set_sysclock+0x84>)
     796:	681b      	ldr	r3, [r3, #0]
     798:	0c5b      	lsrs	r3, r3, #17
     79a:	f003 0301 	and.w	r3, r3, #1
     79e:	b2db      	uxtb	r3, r3
     7a0:	2b00      	cmp	r3, #0
     7a2:	d0f7      	beq.n	794 <set_sysclock+0x10>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR->cfgr|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL8<<RCC_CFGR_PLLMUL);
     7a4:	4a19      	ldr	r2, [pc, #100]	; (80c <set_sysclock+0x88>)
     7a6:	4b19      	ldr	r3, [pc, #100]	; (80c <set_sysclock+0x88>)
     7a8:	681b      	ldr	r3, [r3, #0]
     7aa:	f443 13c8 	orr.w	r3, r3, #1638400	; 0x190000
     7ae:	6013      	str	r3, [r2, #0]
    // active le PLL
    RCC_CR->fld.pllon=1;
     7b0:	4b15      	ldr	r3, [pc, #84]	; (808 <set_sysclock+0x84>)
     7b2:	681a      	ldr	r2, [r3, #0]
     7b4:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
     7b8:	601a      	str	r2, [r3, #0]
    // Attend que le PLL soit prêt
    while (!RCC_CR->fld.pllrdy);
     7ba:	bf00      	nop
     7bc:	4b12      	ldr	r3, [pc, #72]	; (808 <set_sysclock+0x84>)
     7be:	681b      	ldr	r3, [r3, #0]
     7c0:	0e5b      	lsrs	r3, r3, #25
     7c2:	f003 0301 	and.w	r3, r3, #1
     7c6:	b2db      	uxtb	r3, r3
     7c8:	2b00      	cmp	r3, #0
     7ca:	d0f7      	beq.n	7bc <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR->fld.latency=WAIT_2_CY;
     7cc:	4b10      	ldr	r3, [pc, #64]	; (810 <set_sysclock+0x8c>)
     7ce:	681a      	ldr	r2, [r3, #0]
     7d0:	f022 0207 	bic.w	r2, r2, #7
     7d4:	f042 0202 	orr.w	r2, r2, #2
     7d8:	601a      	str	r2, [r3, #0]
    // active le prefetch buffer
    FLASH_ACR->fld.prftbe=1;
     7da:	4b0d      	ldr	r3, [pc, #52]	; (810 <set_sysclock+0x8c>)
     7dc:	681a      	ldr	r2, [r3, #0]
     7de:	f042 0210 	orr.w	r2, r2, #16
     7e2:	601a      	str	r2, [r3, #0]
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR->fld.sw=PLL_CLK;
     7e4:	4b09      	ldr	r3, [pc, #36]	; (80c <set_sysclock+0x88>)
     7e6:	681a      	ldr	r2, [r3, #0]
     7e8:	f022 0203 	bic.w	r2, r2, #3
     7ec:	f042 0202 	orr.w	r2, r2, #2
     7f0:	601a      	str	r2, [r3, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR->fld.ppre1=PPRECLK_DIV2;
     7f2:	4b06      	ldr	r3, [pc, #24]	; (80c <set_sysclock+0x88>)
     7f4:	681a      	ldr	r2, [r3, #0]
     7f6:	f422 62e0 	bic.w	r2, r2, #1792	; 0x700
     7fa:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     7fe:	601a      	str	r2, [r3, #0]
}
     800:	46bd      	mov	sp, r7
     802:	f85d 7b04 	ldr.w	r7, [sp], #4
     806:	4770      	bx	lr
     808:	40021000 	.word	0x40021000
     80c:	40021004 	.word	0x40021004
     810:	40022000 	.word	0x40022000

00000814 <config_systicks>:

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
     814:	b580      	push	{r7, lr}
     816:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,8);
     818:	f06f 000e 	mvn.w	r0, #14
     81c:	2108      	movs	r1, #8
     81e:	f000 ffb3 	bl	1788 <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
     822:	4b04      	ldr	r3, [pc, #16]	; (834 <config_systicks+0x20>)
     824:	f242 3227 	movw	r2, #8999	; 0x2327
     828:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
     82a:	4b03      	ldr	r3, [pc, #12]	; (838 <config_systicks+0x24>)
     82c:	2203      	movs	r2, #3
     82e:	601a      	str	r2, [r3, #0]
}
     830:	bd80      	pop	{r7, pc}
     832:	bf00      	nop
     834:	e000e014 	.word	0xe000e014
     838:	e000e010 	.word	0xe000e010

0000083c <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     83c:	b480      	push	{r7}
     83e:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     840:	2300      	movs	r3, #0
     842:	2200      	movs	r2, #0
     844:	4618      	mov	r0, r3
     846:	4611      	mov	r1, r2
     848:	df00      	svc	0
}
     84a:	46bd      	mov	sp, r7
     84c:	f85d 7b04 	ldr.w	r7, [sp], #4
     850:	4770      	bx	lr
     852:	bf00      	nop

00000854 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     854:	b480      	push	{r7}
     856:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     858:	2300      	movs	r3, #0
     85a:	2200      	movs	r2, #0
     85c:	4618      	mov	r0, r3
     85e:	4611      	mov	r1, r2
     860:	df01      	svc	1
}
     862:	46bd      	mov	sp, r7
     864:	f85d 7b04 	ldr.w	r7, [sp], #4
     868:	4770      	bx	lr
     86a:	bf00      	nop

0000086c <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     86c:	b480      	push	{r7}
     86e:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     870:	2300      	movs	r3, #0
     872:	2200      	movs	r2, #0
     874:	4618      	mov	r0, r3
     876:	4611      	mov	r1, r2
     878:	df02      	svc	2
}
     87a:	46bd      	mov	sp, r7
     87c:	f85d 7b04 	ldr.w	r7, [sp], #4
     880:	4770      	bx	lr
     882:	bf00      	nop

00000884 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     884:	b580      	push	{r7, lr}
     886:	b082      	sub	sp, #8
     888:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     88a:	f000 fadb 	bl	e44 <word>
	n=atoi((const char*)pad);
     88e:	4806      	ldr	r0, [pc, #24]	; (8a8 <cmd_set_timer+0x24>)
     890:	f7ff fd96 	bl	3c0 <atoi>
     894:	4603      	mov	r3, r0
     896:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     898:	1d3b      	adds	r3, r7, #4
     89a:	2200      	movs	r2, #0
     89c:	4618      	mov	r0, r3
     89e:	4611      	mov	r1, r2
     8a0:	df03      	svc	3
}
     8a2:	3708      	adds	r7, #8
     8a4:	46bd      	mov	sp, r7
     8a6:	bd80      	pop	{r7, pc}
     8a8:	20000064 	.word	0x20000064

000008ac <cmd_get_timer>:

static void cmd_get_timer(){
     8ac:	b480      	push	{r7}
     8ae:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     8b0:	4b04      	ldr	r3, [pc, #16]	; (8c4 <cmd_get_timer+0x18>)
     8b2:	2200      	movs	r2, #0
     8b4:	4618      	mov	r0, r3
     8b6:	4611      	mov	r1, r2
     8b8:	df04      	svc	4
}
     8ba:	46bd      	mov	sp, r7
     8bc:	f85d 7b04 	ldr.w	r7, [sp], #4
     8c0:	4770      	bx	lr
     8c2:	bf00      	nop
     8c4:	20000064 	.word	0x20000064

000008c8 <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     8c8:	b480      	push	{r7}
     8ca:	b083      	sub	sp, #12
     8cc:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     8ce:	1d3b      	adds	r3, r7, #4
     8d0:	2200      	movs	r2, #0
     8d2:	4618      	mov	r0, r3
     8d4:	4611      	mov	r1, r2
     8d6:	df04      	svc	4
     8d8:	687b      	ldr	r3, [r7, #4]
     8da:	2b00      	cmp	r3, #0
     8dc:	d1f7      	bne.n	8ce <cmd_pause+0x6>
}
     8de:	370c      	adds	r7, #12
     8e0:	46bd      	mov	sp, r7
     8e2:	f85d 7b04 	ldr.w	r7, [sp], #4
     8e6:	4770      	bx	lr

000008e8 <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     8e8:	b480      	push	{r7}
     8ea:	b083      	sub	sp, #12
     8ec:	af00      	add	r7, sp, #0
	volatile char n=0;
     8ee:	2300      	movs	r3, #0
     8f0:	71fb      	strb	r3, [r7, #7]
	while (!n){
     8f2:	e004      	b.n	8fe <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     8f4:	1dfb      	adds	r3, r7, #7
     8f6:	2200      	movs	r2, #0
     8f8:	4618      	mov	r0, r3
     8fa:	4611      	mov	r1, r2
     8fc:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     8fe:	79fb      	ldrb	r3, [r7, #7]
     900:	b2db      	uxtb	r3, r3
     902:	2b00      	cmp	r3, #0
     904:	d0f6      	beq.n	8f4 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     906:	79fb      	ldrb	r3, [r7, #7]
     908:	b2da      	uxtb	r2, r3
     90a:	4b05      	ldr	r3, [pc, #20]	; (920 <cmd_getc+0x38>)
     90c:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     90e:	4b04      	ldr	r3, [pc, #16]	; (920 <cmd_getc+0x38>)
     910:	2200      	movs	r2, #0
     912:	705a      	strb	r2, [r3, #1]
}
     914:	370c      	adds	r7, #12
     916:	46bd      	mov	sp, r7
     918:	f85d 7b04 	ldr.w	r7, [sp], #4
     91c:	4770      	bx	lr
     91e:	bf00      	nop
     920:	20000064 	.word	0x20000064

00000924 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     924:	b580      	push	{r7, lr}
     926:	b082      	sub	sp, #8
     928:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     92a:	f000 fa8b 	bl	e44 <word>
	cmd_id=search_command((const char*)pad);
     92e:	480a      	ldr	r0, [pc, #40]	; (958 <cmd_putc+0x34>)
     930:	f000 f972 	bl	c18 <search_command>
     934:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     936:	687b      	ldr	r3, [r7, #4]
     938:	2b00      	cmp	r3, #0
     93a:	db05      	blt.n	948 <cmd_putc+0x24>
     93c:	4a07      	ldr	r2, [pc, #28]	; (95c <cmd_putc+0x38>)
     93e:	687b      	ldr	r3, [r7, #4]
     940:	00db      	lsls	r3, r3, #3
     942:	4413      	add	r3, r2
     944:	685b      	ldr	r3, [r3, #4]
     946:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     948:	4b03      	ldr	r3, [pc, #12]	; (958 <cmd_putc+0x34>)
     94a:	2200      	movs	r2, #0
     94c:	4618      	mov	r0, r3
     94e:	4611      	mov	r1, r2
     950:	df06      	svc	6
}
     952:	3708      	adds	r7, #8
     954:	46bd      	mov	sp, r7
     956:	bd80      	pop	{r7, pc}
     958:	20000064 	.word	0x20000064
     95c:	00002094 	.word	0x00002094

00000960 <cmd_readln>:

static void cmd_readln(){
     960:	b580      	push	{r7, lr}
     962:	b082      	sub	sp, #8
     964:	af00      	add	r7, sp, #0
	unsigned llen=80;
     966:	2350      	movs	r3, #80	; 0x50
     968:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     96a:	1d3b      	adds	r3, r7, #4
     96c:	4a04      	ldr	r2, [pc, #16]	; (980 <cmd_readln+0x20>)
     96e:	4618      	mov	r0, r3
     970:	4611      	mov	r1, r2
     972:	df07      	svc	7
	print((const char*)pad);
     974:	4802      	ldr	r0, [pc, #8]	; (980 <cmd_readln+0x20>)
     976:	f000 fbc1 	bl	10fc <print>
}
     97a:	3708      	adds	r7, #8
     97c:	46bd      	mov	sp, r7
     97e:	bd80      	pop	{r7, pc}
     980:	20000064 	.word	0x20000064

00000984 <cmd_print>:

static void cmd_print(){
     984:	b580      	push	{r7, lr}
     986:	af00      	add	r7, sp, #0
	word();
     988:	f000 fa5c 	bl	e44 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     98c:	4b02      	ldr	r3, [pc, #8]	; (998 <cmd_print+0x14>)
     98e:	2200      	movs	r2, #0
     990:	4618      	mov	r0, r3
     992:	4611      	mov	r1, r2
     994:	df08      	svc	8
}
     996:	bd80      	pop	{r7, pc}
     998:	20000064 	.word	0x20000064

0000099c <cmd_print_int>:

static void cmd_print_int(){
     99c:	b580      	push	{r7, lr}
     99e:	b082      	sub	sp, #8
     9a0:	af00      	add	r7, sp, #0
	int cmd_id;
    unsigned u32;
    
	word();
     9a2:	f000 fa4f 	bl	e44 <word>
	cmd_id=search_command((const char*)pad);
     9a6:	480e      	ldr	r0, [pc, #56]	; (9e0 <cmd_print_int+0x44>)
     9a8:	f000 f936 	bl	c18 <search_command>
     9ac:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     9ae:	687b      	ldr	r3, [r7, #4]
     9b0:	2b00      	cmp	r3, #0
     9b2:	db06      	blt.n	9c2 <cmd_print_int+0x26>
		 commands[cmd_id].fn();
     9b4:	4a0b      	ldr	r2, [pc, #44]	; (9e4 <cmd_print_int+0x48>)
     9b6:	687b      	ldr	r3, [r7, #4]
     9b8:	00db      	lsls	r3, r3, #3
     9ba:	4413      	add	r3, r2
     9bc:	685b      	ldr	r3, [r3, #4]
     9be:	4798      	blx	r3
     9c0:	e006      	b.n	9d0 <cmd_print_int+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     9c2:	4807      	ldr	r0, [pc, #28]	; (9e0 <cmd_print_int+0x44>)
     9c4:	f7ff fcfc 	bl	3c0 <atoi>
     9c8:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     9ca:	4a05      	ldr	r2, [pc, #20]	; (9e0 <cmd_print_int+0x44>)
     9cc:	687b      	ldr	r3, [r7, #4]
     9ce:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_INT,pad,NUL);
     9d0:	4b03      	ldr	r3, [pc, #12]	; (9e0 <cmd_print_int+0x44>)
     9d2:	2200      	movs	r2, #0
     9d4:	4618      	mov	r0, r3
     9d6:	4611      	mov	r1, r2
     9d8:	df09      	svc	9
}
     9da:	3708      	adds	r7, #8
     9dc:	46bd      	mov	sp, r7
     9de:	bd80      	pop	{r7, pc}
     9e0:	20000064 	.word	0x20000064
     9e4:	00002094 	.word	0x00002094

000009e8 <cmd_print_hex>:

static void cmd_print_hex(){
     9e8:	b580      	push	{r7, lr}
     9ea:	b082      	sub	sp, #8
     9ec:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     9ee:	f000 fa29 	bl	e44 <word>
	cmd_id=search_command((const char*)pad);
     9f2:	480e      	ldr	r0, [pc, #56]	; (a2c <cmd_print_hex+0x44>)
     9f4:	f000 f910 	bl	c18 <search_command>
     9f8:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     9fa:	687b      	ldr	r3, [r7, #4]
     9fc:	2b00      	cmp	r3, #0
     9fe:	db06      	blt.n	a0e <cmd_print_hex+0x26>
		 commands[cmd_id].fn();
     a00:	4a0b      	ldr	r2, [pc, #44]	; (a30 <cmd_print_hex+0x48>)
     a02:	687b      	ldr	r3, [r7, #4]
     a04:	00db      	lsls	r3, r3, #3
     a06:	4413      	add	r3, r2
     a08:	685b      	ldr	r3, [r3, #4]
     a0a:	4798      	blx	r3
     a0c:	e006      	b.n	a1c <cmd_print_hex+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     a0e:	4807      	ldr	r0, [pc, #28]	; (a2c <cmd_print_hex+0x44>)
     a10:	f7ff fcd6 	bl	3c0 <atoi>
     a14:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     a16:	4a05      	ldr	r2, [pc, #20]	; (a2c <cmd_print_hex+0x44>)
     a18:	687b      	ldr	r3, [r7, #4]
     a1a:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_HEX,pad,NUL);
     a1c:	4b03      	ldr	r3, [pc, #12]	; (a2c <cmd_print_hex+0x44>)
     a1e:	2200      	movs	r2, #0
     a20:	4618      	mov	r0, r3
     a22:	4611      	mov	r1, r2
     a24:	df0a      	svc	10
}
     a26:	3708      	adds	r7, #8
     a28:	46bd      	mov	sp, r7
     a2a:	bd80      	pop	{r7, pc}
     a2c:	20000064 	.word	0x20000064
     a30:	00002094 	.word	0x00002094

00000a34 <cmd_run>:

static void cmd_run(){
     a34:	b580      	push	{r7, lr}
     a36:	af00      	add	r7, sp, #0
	((fn)proga)();
     a38:	4b01      	ldr	r3, [pc, #4]	; (a40 <cmd_run+0xc>)
     a3a:	681b      	ldr	r3, [r3, #0]
     a3c:	4798      	blx	r3
	
}
     a3e:	bd80      	pop	{r7, pc}
     a40:	200000e8 	.word	0x200000e8

00000a44 <cmd_peek8>:

static void cmd_peek8(){
     a44:	b580      	push	{r7, lr}
     a46:	b082      	sub	sp, #8
     a48:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     a4a:	f000 f9fb 	bl	e44 <word>
	u=atoi((const char*)pad);
     a4e:	4808      	ldr	r0, [pc, #32]	; (a70 <cmd_peek8+0x2c>)
     a50:	f7ff fcb6 	bl	3c0 <atoi>
     a54:	4603      	mov	r3, r0
     a56:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     a58:	1d3b      	adds	r3, r7, #4
     a5a:	2200      	movs	r2, #0
     a5c:	4618      	mov	r0, r3
     a5e:	4611      	mov	r1, r2
     a60:	df0b      	svc	11
	*(uint32_t*)pad=u&0xff;
     a62:	4a03      	ldr	r2, [pc, #12]	; (a70 <cmd_peek8+0x2c>)
     a64:	687b      	ldr	r3, [r7, #4]
     a66:	b2db      	uxtb	r3, r3
     a68:	6013      	str	r3, [r2, #0]
}
     a6a:	3708      	adds	r7, #8
     a6c:	46bd      	mov	sp, r7
     a6e:	bd80      	pop	{r7, pc}
     a70:	20000064 	.word	0x20000064

00000a74 <cmd_peek16>:

static void cmd_peek16(){
     a74:	b580      	push	{r7, lr}
     a76:	b082      	sub	sp, #8
     a78:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     a7a:	f000 f9e3 	bl	e44 <word>
	u=atoi((const char*)pad);
     a7e:	4808      	ldr	r0, [pc, #32]	; (aa0 <cmd_peek16+0x2c>)
     a80:	f7ff fc9e 	bl	3c0 <atoi>
     a84:	4603      	mov	r3, r0
     a86:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     a88:	1d3b      	adds	r3, r7, #4
     a8a:	2200      	movs	r2, #0
     a8c:	4618      	mov	r0, r3
     a8e:	4611      	mov	r1, r2
     a90:	df0c      	svc	12
	*(uint32_t*)pad=u&0xffff;
     a92:	4a03      	ldr	r2, [pc, #12]	; (aa0 <cmd_peek16+0x2c>)
     a94:	687b      	ldr	r3, [r7, #4]
     a96:	b29b      	uxth	r3, r3
     a98:	6013      	str	r3, [r2, #0]
}
     a9a:	3708      	adds	r7, #8
     a9c:	46bd      	mov	sp, r7
     a9e:	bd80      	pop	{r7, pc}
     aa0:	20000064 	.word	0x20000064

00000aa4 <cmd_peek32>:

static void cmd_peek32(){
     aa4:	b580      	push	{r7, lr}
     aa6:	b082      	sub	sp, #8
     aa8:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     aaa:	f000 f9cb 	bl	e44 <word>
	u=atoi((const char*)pad);
     aae:	4808      	ldr	r0, [pc, #32]	; (ad0 <cmd_peek32+0x2c>)
     ab0:	f7ff fc86 	bl	3c0 <atoi>
     ab4:	4603      	mov	r3, r0
     ab6:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK32,&u,NUL);
     ab8:	1d3b      	adds	r3, r7, #4
     aba:	2200      	movs	r2, #0
     abc:	4618      	mov	r0, r3
     abe:	4611      	mov	r1, r2
     ac0:	df0d      	svc	13
	*(uint32_t*)pad=u;
     ac2:	4a03      	ldr	r2, [pc, #12]	; (ad0 <cmd_peek32+0x2c>)
     ac4:	687b      	ldr	r3, [r7, #4]
     ac6:	6013      	str	r3, [r2, #0]
}
     ac8:	3708      	adds	r7, #8
     aca:	46bd      	mov	sp, r7
     acc:	bd80      	pop	{r7, pc}
     ace:	bf00      	nop
     ad0:	20000064 	.word	0x20000064

00000ad4 <cmd_poke8>:

static void cmd_poke8(){
     ad4:	b580      	push	{r7, lr}
     ad6:	b082      	sub	sp, #8
     ad8:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     ada:	f000 f9b3 	bl	e44 <word>
	adr=atoi((const char*)pad);
     ade:	480a      	ldr	r0, [pc, #40]	; (b08 <cmd_poke8+0x34>)
     ae0:	f7ff fc6e 	bl	3c0 <atoi>
     ae4:	4603      	mov	r3, r0
     ae6:	607b      	str	r3, [r7, #4]
	word();
     ae8:	f000 f9ac 	bl	e44 <word>
	u8=atoi((const char*)pad);
     aec:	4806      	ldr	r0, [pc, #24]	; (b08 <cmd_poke8+0x34>)
     aee:	f7ff fc67 	bl	3c0 <atoi>
     af2:	4603      	mov	r3, r0
     af4:	b2db      	uxtb	r3, r3
     af6:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     af8:	1d3b      	adds	r3, r7, #4
     afa:	1cfa      	adds	r2, r7, #3
     afc:	4618      	mov	r0, r3
     afe:	4611      	mov	r1, r2
     b00:	df0e      	svc	14
}
     b02:	3708      	adds	r7, #8
     b04:	46bd      	mov	sp, r7
     b06:	bd80      	pop	{r7, pc}
     b08:	20000064 	.word	0x20000064

00000b0c <cmd_poke16>:

static void cmd_poke16(){
     b0c:	b580      	push	{r7, lr}
     b0e:	b082      	sub	sp, #8
     b10:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     b12:	f000 f997 	bl	e44 <word>
	adr=atoi((const char*)pad);
     b16:	480a      	ldr	r0, [pc, #40]	; (b40 <cmd_poke16+0x34>)
     b18:	f7ff fc52 	bl	3c0 <atoi>
     b1c:	4603      	mov	r3, r0
     b1e:	607b      	str	r3, [r7, #4]
	word();
     b20:	f000 f990 	bl	e44 <word>
	u16=atoi((const char*)pad);
     b24:	4806      	ldr	r0, [pc, #24]	; (b40 <cmd_poke16+0x34>)
     b26:	f7ff fc4b 	bl	3c0 <atoi>
     b2a:	4603      	mov	r3, r0
     b2c:	b29b      	uxth	r3, r3
     b2e:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     b30:	1d3b      	adds	r3, r7, #4
     b32:	1cba      	adds	r2, r7, #2
     b34:	4618      	mov	r0, r3
     b36:	4611      	mov	r1, r2
     b38:	df0f      	svc	15
}
     b3a:	3708      	adds	r7, #8
     b3c:	46bd      	mov	sp, r7
     b3e:	bd80      	pop	{r7, pc}
     b40:	20000064 	.word	0x20000064

00000b44 <cmd_poke32>:

static void cmd_poke32(){
     b44:	b580      	push	{r7, lr}
     b46:	b082      	sub	sp, #8
     b48:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     b4a:	f000 f97b 	bl	e44 <word>
	adr=atoi((const char*)pad);
     b4e:	480a      	ldr	r0, [pc, #40]	; (b78 <cmd_poke32+0x34>)
     b50:	f7ff fc36 	bl	3c0 <atoi>
     b54:	4603      	mov	r3, r0
     b56:	607b      	str	r3, [r7, #4]
	word();
     b58:	f000 f974 	bl	e44 <word>
	u32=atoi((const char*)pad);
     b5c:	4806      	ldr	r0, [pc, #24]	; (b78 <cmd_poke32+0x34>)
     b5e:	f7ff fc2f 	bl	3c0 <atoi>
     b62:	4603      	mov	r3, r0
     b64:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     b66:	1d3b      	adds	r3, r7, #4
     b68:	463a      	mov	r2, r7
     b6a:	4618      	mov	r0, r3
     b6c:	4611      	mov	r1, r2
     b6e:	df10      	svc	16
}
     b70:	3708      	adds	r7, #8
     b72:	46bd      	mov	sp, r7
     b74:	bd80      	pop	{r7, pc}
     b76:	bf00      	nop
     b78:	20000064 	.word	0x20000064

00000b7c <cmd_fwrite>:

static void cmd_fwrite(){
     b7c:	b580      	push	{r7, lr}
     b7e:	b082      	sub	sp, #8
     b80:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	word();
     b82:	f000 f95f 	bl	e44 <word>
	adr=atoi((const char*)pad);
     b86:	480d      	ldr	r0, [pc, #52]	; (bbc <cmd_fwrite+0x40>)
     b88:	f7ff fc1a 	bl	3c0 <atoi>
     b8c:	4603      	mov	r3, r0
     b8e:	607b      	str	r3, [r7, #4]
	word();
     b90:	f000 f958 	bl	e44 <word>
	u32=atoi((const char*)pad);
     b94:	4809      	ldr	r0, [pc, #36]	; (bbc <cmd_fwrite+0x40>)
     b96:	f7ff fc13 	bl	3c0 <atoi>
     b9a:	4603      	mov	r3, r0
     b9c:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_FLASH_WR,&adr,&u32);
     b9e:	1d3b      	adds	r3, r7, #4
     ba0:	463a      	mov	r2, r7
     ba2:	4618      	mov	r0, r3
     ba4:	4611      	mov	r1, r2
     ba6:	df11      	svc	17
	if (!adr) print(" failed\n");
     ba8:	687b      	ldr	r3, [r7, #4]
     baa:	2b00      	cmp	r3, #0
     bac:	d102      	bne.n	bb4 <cmd_fwrite+0x38>
     bae:	4804      	ldr	r0, [pc, #16]	; (bc0 <cmd_fwrite+0x44>)
     bb0:	f000 faa4 	bl	10fc <print>
}
     bb4:	3708      	adds	r7, #8
     bb6:	46bd      	mov	sp, r7
     bb8:	bd80      	pop	{r7, pc}
     bba:	bf00      	nop
     bbc:	20000064 	.word	0x20000064
     bc0:	00001fe0 	.word	0x00001fe0

00000bc4 <cmd_pgerase>:

static void cmd_pgerase(){
     bc4:	b580      	push	{r7, lr}
     bc6:	b082      	sub	sp, #8
     bc8:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     bca:	f000 f93b 	bl	e44 <word>
	adr=atoi((const char*)pad);
     bce:	4809      	ldr	r0, [pc, #36]	; (bf4 <cmd_pgerase+0x30>)
     bd0:	f7ff fbf6 	bl	3c0 <atoi>
     bd4:	4603      	mov	r3, r0
     bd6:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_FLASH_PGER,&adr,0);
     bd8:	1d3b      	adds	r3, r7, #4
     bda:	2200      	movs	r2, #0
     bdc:	4618      	mov	r0, r3
     bde:	4611      	mov	r1, r2
     be0:	df12      	svc	18
	if (!adr) print(" failed\n");
     be2:	687b      	ldr	r3, [r7, #4]
     be4:	2b00      	cmp	r3, #0
     be6:	d102      	bne.n	bee <cmd_pgerase+0x2a>
     be8:	4803      	ldr	r0, [pc, #12]	; (bf8 <cmd_pgerase+0x34>)
     bea:	f000 fa87 	bl	10fc <print>
}
     bee:	3708      	adds	r7, #8
     bf0:	46bd      	mov	sp, r7
     bf2:	bd80      	pop	{r7, pc}
     bf4:	20000064 	.word	0x20000064
     bf8:	00001fe0 	.word	0x00001fe0

00000bfc <cmd_ticks>:

static void cmd_ticks(){
     bfc:	b480      	push	{r7}
     bfe:	af00      	add	r7, sp, #0
	_svc_call(SVC_TICKS,&pad,0);
     c00:	4b04      	ldr	r3, [pc, #16]	; (c14 <cmd_ticks+0x18>)
     c02:	2200      	movs	r2, #0
     c04:	4618      	mov	r0, r3
     c06:	4611      	mov	r1, r2
     c08:	df13      	svc	19
}
     c0a:	46bd      	mov	sp, r7
     c0c:	f85d 7b04 	ldr.w	r7, [sp], #4
     c10:	4770      	bx	lr
     c12:	bf00      	nop
     c14:	20000064 	.word	0x20000064

00000c18 <search_command>:
	{"ticks",cmd_ticks},
	{NUL,NUL}
};


int search_command(const char * name){
     c18:	b580      	push	{r7, lr}
     c1a:	b084      	sub	sp, #16
     c1c:	af00      	add	r7, sp, #0
     c1e:	6078      	str	r0, [r7, #4]
	int i=0;
     c20:	2300      	movs	r3, #0
     c22:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     c24:	e00e      	b.n	c44 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     c26:	4a12      	ldr	r2, [pc, #72]	; (c70 <search_command+0x58>)
     c28:	68fb      	ldr	r3, [r7, #12]
     c2a:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     c2e:	4618      	mov	r0, r3
     c30:	6879      	ldr	r1, [r7, #4]
     c32:	f7ff fb47 	bl	2c4 <strcmp>
     c36:	4603      	mov	r3, r0
     c38:	2b00      	cmp	r3, #0
     c3a:	d100      	bne.n	c3e <search_command+0x26>
			break;
     c3c:	e009      	b.n	c52 <search_command+0x3a>
		}
		i++;
     c3e:	68fb      	ldr	r3, [r7, #12]
     c40:	3301      	adds	r3, #1
     c42:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     c44:	4a0a      	ldr	r2, [pc, #40]	; (c70 <search_command+0x58>)
     c46:	68fb      	ldr	r3, [r7, #12]
     c48:	00db      	lsls	r3, r3, #3
     c4a:	4413      	add	r3, r2
     c4c:	685b      	ldr	r3, [r3, #4]
     c4e:	2b00      	cmp	r3, #0
     c50:	d1e9      	bne.n	c26 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     c52:	4a07      	ldr	r2, [pc, #28]	; (c70 <search_command+0x58>)
     c54:	68fb      	ldr	r3, [r7, #12]
     c56:	00db      	lsls	r3, r3, #3
     c58:	4413      	add	r3, r2
     c5a:	685b      	ldr	r3, [r3, #4]
     c5c:	2b00      	cmp	r3, #0
     c5e:	d102      	bne.n	c66 <search_command+0x4e>
     c60:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     c64:	60fb      	str	r3, [r7, #12]
	return i;
     c66:	68fb      	ldr	r3, [r7, #12]
}
     c68:	4618      	mov	r0, r3
     c6a:	3710      	adds	r7, #16
     c6c:	46bd      	mov	sp, r7
     c6e:	bd80      	pop	{r7, pc}
     c70:	00002094 	.word	0x00002094

00000c74 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     c74:	b480      	push	{r7}
     c76:	b085      	sub	sp, #20
     c78:	af00      	add	r7, sp, #0
     c7a:	60f8      	str	r0, [r7, #12]
     c7c:	60b9      	str	r1, [r7, #8]
     c7e:	4613      	mov	r3, r2
     c80:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     c82:	e002      	b.n	c8a <skip+0x16>
     c84:	68bb      	ldr	r3, [r7, #8]
     c86:	3301      	adds	r3, #1
     c88:	60bb      	str	r3, [r7, #8]
     c8a:	68bb      	ldr	r3, [r7, #8]
     c8c:	68fa      	ldr	r2, [r7, #12]
     c8e:	4413      	add	r3, r2
     c90:	781b      	ldrb	r3, [r3, #0]
     c92:	2b00      	cmp	r3, #0
     c94:	d006      	beq.n	ca4 <skip+0x30>
     c96:	68bb      	ldr	r3, [r7, #8]
     c98:	68fa      	ldr	r2, [r7, #12]
     c9a:	4413      	add	r3, r2
     c9c:	781b      	ldrb	r3, [r3, #0]
     c9e:	79fa      	ldrb	r2, [r7, #7]
     ca0:	429a      	cmp	r2, r3
     ca2:	d0ef      	beq.n	c84 <skip+0x10>
	return start;
     ca4:	68bb      	ldr	r3, [r7, #8]
}
     ca6:	4618      	mov	r0, r3
     ca8:	3714      	adds	r7, #20
     caa:	46bd      	mov	sp, r7
     cac:	f85d 7b04 	ldr.w	r7, [sp], #4
     cb0:	4770      	bx	lr
     cb2:	bf00      	nop

00000cb4 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     cb4:	b480      	push	{r7}
     cb6:	b085      	sub	sp, #20
     cb8:	af00      	add	r7, sp, #0
     cba:	60f8      	str	r0, [r7, #12]
     cbc:	60b9      	str	r1, [r7, #8]
     cbe:	4613      	mov	r3, r2
     cc0:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     cc2:	e002      	b.n	cca <scan+0x16>
     cc4:	68bb      	ldr	r3, [r7, #8]
     cc6:	3301      	adds	r3, #1
     cc8:	60bb      	str	r3, [r7, #8]
     cca:	68bb      	ldr	r3, [r7, #8]
     ccc:	68fa      	ldr	r2, [r7, #12]
     cce:	4413      	add	r3, r2
     cd0:	781b      	ldrb	r3, [r3, #0]
     cd2:	2b00      	cmp	r3, #0
     cd4:	d006      	beq.n	ce4 <scan+0x30>
     cd6:	68bb      	ldr	r3, [r7, #8]
     cd8:	68fa      	ldr	r2, [r7, #12]
     cda:	4413      	add	r3, r2
     cdc:	781b      	ldrb	r3, [r3, #0]
     cde:	79fa      	ldrb	r2, [r7, #7]
     ce0:	429a      	cmp	r2, r3
     ce2:	d1ef      	bne.n	cc4 <scan+0x10>
	return start;
     ce4:	68bb      	ldr	r3, [r7, #8]
}
     ce6:	4618      	mov	r0, r3
     ce8:	3714      	adds	r7, #20
     cea:	46bd      	mov	sp, r7
     cec:	f85d 7b04 	ldr.w	r7, [sp], #4
     cf0:	4770      	bx	lr
     cf2:	bf00      	nop

00000cf4 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     cf4:	b480      	push	{r7}
     cf6:	b087      	sub	sp, #28
     cf8:	af00      	add	r7, sp, #0
     cfa:	6078      	str	r0, [r7, #4]
     cfc:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     cfe:	2300      	movs	r3, #0
     d00:	617b      	str	r3, [r7, #20]
     d02:	683b      	ldr	r3, [r7, #0]
     d04:	613b      	str	r3, [r7, #16]
     d06:	2300      	movs	r3, #0
     d08:	60fb      	str	r3, [r7, #12]
     d0a:	2301      	movs	r3, #1
     d0c:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     d0e:	e040      	b.n	d92 <quote+0x9e>
		switch (buffer[end]){
     d10:	693b      	ldr	r3, [r7, #16]
     d12:	687a      	ldr	r2, [r7, #4]
     d14:	4413      	add	r3, r2
     d16:	781b      	ldrb	r3, [r3, #0]
     d18:	2b5c      	cmp	r3, #92	; 0x5c
     d1a:	d012      	beq.n	d42 <quote+0x4e>
     d1c:	2b6e      	cmp	r3, #110	; 0x6e
     d1e:	d022      	beq.n	d66 <quote+0x72>
     d20:	2b22      	cmp	r3, #34	; 0x22
     d22:	d128      	bne.n	d76 <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     d24:	697b      	ldr	r3, [r7, #20]
     d26:	2b00      	cmp	r3, #0
     d28:	d102      	bne.n	d30 <quote+0x3c>
     d2a:	2300      	movs	r3, #0
     d2c:	60bb      	str	r3, [r7, #8]
			break;
     d2e:	e02d      	b.n	d8c <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     d30:	68fb      	ldr	r3, [r7, #12]
     d32:	1c5a      	adds	r2, r3, #1
     d34:	60fa      	str	r2, [r7, #12]
     d36:	4a21      	ldr	r2, [pc, #132]	; (dbc <quote+0xc8>)
     d38:	2122      	movs	r1, #34	; 0x22
     d3a:	54d1      	strb	r1, [r2, r3]
     d3c:	2300      	movs	r3, #0
     d3e:	617b      	str	r3, [r7, #20]
			break;
     d40:	e024      	b.n	d8c <quote+0x98>
		case '\\':
			if (!escaped){
     d42:	697b      	ldr	r3, [r7, #20]
     d44:	2b00      	cmp	r3, #0
     d46:	d102      	bne.n	d4e <quote+0x5a>
				escaped=1;
     d48:	2301      	movs	r3, #1
     d4a:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     d4c:	e01e      	b.n	d8c <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     d4e:	2300      	movs	r3, #0
     d50:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     d52:	68fb      	ldr	r3, [r7, #12]
     d54:	1c5a      	adds	r2, r3, #1
     d56:	60fa      	str	r2, [r7, #12]
     d58:	693a      	ldr	r2, [r7, #16]
     d5a:	6879      	ldr	r1, [r7, #4]
     d5c:	440a      	add	r2, r1
     d5e:	7811      	ldrb	r1, [r2, #0]
     d60:	4a16      	ldr	r2, [pc, #88]	; (dbc <quote+0xc8>)
     d62:	54d1      	strb	r1, [r2, r3]
			}
			break;
     d64:	e012      	b.n	d8c <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     d66:	697b      	ldr	r3, [r7, #20]
     d68:	2b00      	cmp	r3, #0
     d6a:	d004      	beq.n	d76 <quote+0x82>
     d6c:	693b      	ldr	r3, [r7, #16]
     d6e:	687a      	ldr	r2, [r7, #4]
     d70:	4413      	add	r3, r2
     d72:	220d      	movs	r2, #13
     d74:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     d76:	2300      	movs	r3, #0
     d78:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     d7a:	68fb      	ldr	r3, [r7, #12]
     d7c:	1c5a      	adds	r2, r3, #1
     d7e:	60fa      	str	r2, [r7, #12]
     d80:	693a      	ldr	r2, [r7, #16]
     d82:	6879      	ldr	r1, [r7, #4]
     d84:	440a      	add	r2, r1
     d86:	7811      	ldrb	r1, [r2, #0]
     d88:	4a0c      	ldr	r2, [pc, #48]	; (dbc <quote+0xc8>)
     d8a:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     d8c:	693b      	ldr	r3, [r7, #16]
     d8e:	3301      	adds	r3, #1
     d90:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     d92:	693b      	ldr	r3, [r7, #16]
     d94:	687a      	ldr	r2, [r7, #4]
     d96:	4413      	add	r3, r2
     d98:	781b      	ldrb	r3, [r3, #0]
     d9a:	2b00      	cmp	r3, #0
     d9c:	d002      	beq.n	da4 <quote+0xb0>
     d9e:	68bb      	ldr	r3, [r7, #8]
     da0:	2b00      	cmp	r3, #0
     da2:	d1b5      	bne.n	d10 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     da4:	4a05      	ldr	r2, [pc, #20]	; (dbc <quote+0xc8>)
     da6:	68fb      	ldr	r3, [r7, #12]
     da8:	4413      	add	r3, r2
     daa:	2200      	movs	r2, #0
     dac:	701a      	strb	r2, [r3, #0]
	return end;
     dae:	693b      	ldr	r3, [r7, #16]
}
     db0:	4618      	mov	r0, r3
     db2:	371c      	adds	r7, #28
     db4:	46bd      	mov	sp, r7
     db6:	f85d 7b04 	ldr.w	r7, [sp], #4
     dba:	4770      	bx	lr
     dbc:	20000064 	.word	0x20000064

00000dc0 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     dc0:	b480      	push	{r7}
     dc2:	b087      	sub	sp, #28
     dc4:	af00      	add	r7, sp, #0
     dc6:	60f8      	str	r0, [r7, #12]
     dc8:	60b9      	str	r1, [r7, #8]
     dca:	4613      	mov	r3, r2
     dcc:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     dce:	68bb      	ldr	r3, [r7, #8]
     dd0:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     dd2:	e002      	b.n	dda <next+0x1a>
     dd4:	697b      	ldr	r3, [r7, #20]
     dd6:	3301      	adds	r3, #1
     dd8:	617b      	str	r3, [r7, #20]
     dda:	697b      	ldr	r3, [r7, #20]
     ddc:	68fa      	ldr	r2, [r7, #12]
     dde:	4413      	add	r3, r2
     de0:	781b      	ldrb	r3, [r3, #0]
     de2:	2b00      	cmp	r3, #0
     de4:	d006      	beq.n	df4 <next+0x34>
     de6:	697b      	ldr	r3, [r7, #20]
     de8:	68fa      	ldr	r2, [r7, #12]
     dea:	4413      	add	r3, r2
     dec:	781b      	ldrb	r3, [r3, #0]
     dee:	79fa      	ldrb	r2, [r7, #7]
     df0:	429a      	cmp	r2, r3
     df2:	d1ef      	bne.n	dd4 <next+0x14>
	return end-start;
     df4:	697a      	ldr	r2, [r7, #20]
     df6:	68bb      	ldr	r3, [r7, #8]
     df8:	1ad3      	subs	r3, r2, r3
}
     dfa:	4618      	mov	r0, r3
     dfc:	371c      	adds	r7, #28
     dfe:	46bd      	mov	sp, r7
     e00:	f85d 7b04 	ldr.w	r7, [sp], #4
     e04:	4770      	bx	lr
     e06:	bf00      	nop

00000e08 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     e08:	b480      	push	{r7}
     e0a:	b085      	sub	sp, #20
     e0c:	af00      	add	r7, sp, #0
     e0e:	60f8      	str	r0, [r7, #12]
     e10:	60b9      	str	r1, [r7, #8]
     e12:	607a      	str	r2, [r7, #4]
	while (len){
     e14:	e00a      	b.n	e2c <move+0x24>
		*dest++=*src++;
     e16:	68bb      	ldr	r3, [r7, #8]
     e18:	1c5a      	adds	r2, r3, #1
     e1a:	60ba      	str	r2, [r7, #8]
     e1c:	68fa      	ldr	r2, [r7, #12]
     e1e:	1c51      	adds	r1, r2, #1
     e20:	60f9      	str	r1, [r7, #12]
     e22:	7812      	ldrb	r2, [r2, #0]
     e24:	701a      	strb	r2, [r3, #0]
		len--;
     e26:	687b      	ldr	r3, [r7, #4]
     e28:	3b01      	subs	r3, #1
     e2a:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     e2c:	687b      	ldr	r3, [r7, #4]
     e2e:	2b00      	cmp	r3, #0
     e30:	d1f1      	bne.n	e16 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     e32:	68bb      	ldr	r3, [r7, #8]
     e34:	2200      	movs	r2, #0
     e36:	701a      	strb	r2, [r3, #0]
}
     e38:	3714      	adds	r7, #20
     e3a:	46bd      	mov	sp, r7
     e3c:	f85d 7b04 	ldr.w	r7, [sp], #4
     e40:	4770      	bx	lr
     e42:	bf00      	nop

00000e44 <word>:

// extrait le prochain mot du tib
static void word(){
     e44:	b580      	push	{r7, lr}
     e46:	b082      	sub	sp, #8
     e48:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     e4a:	4b1d      	ldr	r3, [pc, #116]	; (ec0 <word+0x7c>)
     e4c:	681b      	ldr	r3, [r3, #0]
     e4e:	481d      	ldr	r0, [pc, #116]	; (ec4 <word+0x80>)
     e50:	4619      	mov	r1, r3
     e52:	2220      	movs	r2, #32
     e54:	f7ff ff0e 	bl	c74 <skip>
     e58:	4603      	mov	r3, r0
     e5a:	461a      	mov	r2, r3
     e5c:	4b18      	ldr	r3, [pc, #96]	; (ec0 <word+0x7c>)
     e5e:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     e60:	4b17      	ldr	r3, [pc, #92]	; (ec0 <word+0x7c>)
     e62:	681b      	ldr	r3, [r3, #0]
     e64:	4a17      	ldr	r2, [pc, #92]	; (ec4 <word+0x80>)
     e66:	5cd3      	ldrb	r3, [r2, r3]
     e68:	2b22      	cmp	r3, #34	; 0x22
     e6a:	d10f      	bne.n	e8c <word+0x48>
			in++;
     e6c:	4b14      	ldr	r3, [pc, #80]	; (ec0 <word+0x7c>)
     e6e:	681b      	ldr	r3, [r3, #0]
     e70:	3301      	adds	r3, #1
     e72:	4a13      	ldr	r2, [pc, #76]	; (ec0 <word+0x7c>)
     e74:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     e76:	4b12      	ldr	r3, [pc, #72]	; (ec0 <word+0x7c>)
     e78:	681b      	ldr	r3, [r3, #0]
     e7a:	4812      	ldr	r0, [pc, #72]	; (ec4 <word+0x80>)
     e7c:	4619      	mov	r1, r3
     e7e:	f7ff ff39 	bl	cf4 <quote>
     e82:	4603      	mov	r3, r0
     e84:	461a      	mov	r2, r3
     e86:	4b0e      	ldr	r3, [pc, #56]	; (ec0 <word+0x7c>)
     e88:	601a      	str	r2, [r3, #0]
     e8a:	e016      	b.n	eba <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     e8c:	4b0c      	ldr	r3, [pc, #48]	; (ec0 <word+0x7c>)
     e8e:	681b      	ldr	r3, [r3, #0]
     e90:	480c      	ldr	r0, [pc, #48]	; (ec4 <word+0x80>)
     e92:	4619      	mov	r1, r3
     e94:	2220      	movs	r2, #32
     e96:	f7ff ff93 	bl	dc0 <next>
     e9a:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     e9c:	4b08      	ldr	r3, [pc, #32]	; (ec0 <word+0x7c>)
     e9e:	681b      	ldr	r3, [r3, #0]
     ea0:	4a08      	ldr	r2, [pc, #32]	; (ec4 <word+0x80>)
     ea2:	4413      	add	r3, r2
     ea4:	4618      	mov	r0, r3
     ea6:	4908      	ldr	r1, [pc, #32]	; (ec8 <word+0x84>)
     ea8:	687a      	ldr	r2, [r7, #4]
     eaa:	f7ff ffad 	bl	e08 <move>
			in+=len;
     eae:	4b04      	ldr	r3, [pc, #16]	; (ec0 <word+0x7c>)
     eb0:	681a      	ldr	r2, [r3, #0]
     eb2:	687b      	ldr	r3, [r7, #4]
     eb4:	4413      	add	r3, r2
     eb6:	4a02      	ldr	r2, [pc, #8]	; (ec0 <word+0x7c>)
     eb8:	6013      	str	r3, [r2, #0]
		}
}
     eba:	3708      	adds	r7, #8
     ebc:	46bd      	mov	sp, r7
     ebe:	bd80      	pop	{r7, pc}
     ec0:	200000b4 	.word	0x200000b4
     ec4:	20000014 	.word	0x20000014
     ec8:	20000064 	.word	0x20000064

00000ecc <parse_line>:

static void parse_line(unsigned llen){
     ecc:	b580      	push	{r7, lr}
     ece:	b084      	sub	sp, #16
     ed0:	af00      	add	r7, sp, #0
     ed2:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     ed4:	4b14      	ldr	r3, [pc, #80]	; (f28 <parse_line+0x5c>)
     ed6:	2200      	movs	r2, #0
     ed8:	601a      	str	r2, [r3, #0]
	while (in<llen){
     eda:	e019      	b.n	f10 <parse_line+0x44>
		word();
     edc:	f7ff ffb2 	bl	e44 <word>
		cmd_id=search_command((const char*) pad);
     ee0:	4812      	ldr	r0, [pc, #72]	; (f2c <parse_line+0x60>)
     ee2:	f7ff fe99 	bl	c18 <search_command>
     ee6:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     ee8:	68fb      	ldr	r3, [r7, #12]
     eea:	2b00      	cmp	r3, #0
     eec:	db06      	blt.n	efc <parse_line+0x30>
			commands[cmd_id].fn();
     eee:	4a10      	ldr	r2, [pc, #64]	; (f30 <parse_line+0x64>)
     ef0:	68fb      	ldr	r3, [r7, #12]
     ef2:	00db      	lsls	r3, r3, #3
     ef4:	4413      	add	r3, r2
     ef6:	685b      	ldr	r3, [r3, #4]
     ef8:	4798      	blx	r3
     efa:	e009      	b.n	f10 <parse_line+0x44>
		}else{
			conout(CR);
     efc:	200d      	movs	r0, #13
     efe:	f000 f8cb 	bl	1098 <conout>
			print((const char*)pad); conout('?');
     f02:	480a      	ldr	r0, [pc, #40]	; (f2c <parse_line+0x60>)
     f04:	f000 f8fa 	bl	10fc <print>
     f08:	203f      	movs	r0, #63	; 0x3f
     f0a:	f000 f8c5 	bl	1098 <conout>
			break;
     f0e:	e004      	b.n	f1a <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     f10:	4b05      	ldr	r3, [pc, #20]	; (f28 <parse_line+0x5c>)
     f12:	681a      	ldr	r2, [r3, #0]
     f14:	687b      	ldr	r3, [r7, #4]
     f16:	429a      	cmp	r2, r3
     f18:	d3e0      	bcc.n	edc <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     f1a:	200d      	movs	r0, #13
     f1c:	f000 f8bc 	bl	1098 <conout>
}
     f20:	3710      	adds	r7, #16
     f22:	46bd      	mov	sp, r7
     f24:	bd80      	pop	{r7, pc}
     f26:	bf00      	nop
     f28:	200000b4 	.word	0x200000b4
     f2c:	20000064 	.word	0x20000064
     f30:	00002094 	.word	0x00002094

00000f34 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     f34:	b480      	push	{r7}
     f36:	b085      	sub	sp, #20
     f38:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     f3a:	4b0c      	ldr	r3, [pc, #48]	; (f6c <copy_blink_in_ram+0x38>)
     f3c:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     f3e:	4b0c      	ldr	r3, [pc, #48]	; (f70 <copy_blink_in_ram+0x3c>)
     f40:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     f42:	4b0c      	ldr	r3, [pc, #48]	; (f74 <copy_blink_in_ram+0x40>)
     f44:	60bb      	str	r3, [r7, #8]
	while (start<end){
     f46:	e007      	b.n	f58 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     f48:	68bb      	ldr	r3, [r7, #8]
     f4a:	1d1a      	adds	r2, r3, #4
     f4c:	60ba      	str	r2, [r7, #8]
     f4e:	68fa      	ldr	r2, [r7, #12]
     f50:	1d11      	adds	r1, r2, #4
     f52:	60f9      	str	r1, [r7, #12]
     f54:	6812      	ldr	r2, [r2, #0]
     f56:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     f58:	68fa      	ldr	r2, [r7, #12]
     f5a:	687b      	ldr	r3, [r7, #4]
     f5c:	429a      	cmp	r2, r3
     f5e:	d3f3      	bcc.n	f48 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     f60:	3714      	adds	r7, #20
     f62:	46bd      	mov	sp, r7
     f64:	f85d 7b04 	ldr.w	r7, [sp], #4
     f68:	4770      	bx	lr
     f6a:	bf00      	nop
     f6c:	00002800 	.word	0x00002800
     f70:	00002880 	.word	0x00002880
     f74:	20002700 	.word	0x20002700

00000f78 <main>:

extern void print_fault(const char *msg, sfrp_t adr);

void main(void){
     f78:	b580      	push	{r7, lr}
     f7a:	b082      	sub	sp, #8
     f7c:	af00      	add	r7, sp, #0
	set_sysclock();
     f7e:	f7ff fc01 	bl	784 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     f82:	f06f 000a 	mvn.w	r0, #10
     f86:	210f      	movs	r1, #15
     f88:	f000 fbfe 	bl	1788 <set_int_priority>
	config_systicks();
     f8c:	f7ff fc42 	bl	814 <config_systicks>
	flash_enable();
     f90:	f000 fa92 	bl	14b8 <flash_enable>
	APB2ENR->fld.iopcen=1;
     f94:	4b24      	ldr	r3, [pc, #144]	; (1028 <main+0xb0>)
     f96:	681a      	ldr	r2, [r3, #0]
     f98:	f042 0210 	orr.w	r2, r2, #16
     f9c:	601a      	str	r2, [r3, #0]
	APB2ENR->fld.iopaen=1;
     f9e:	4b22      	ldr	r3, [pc, #136]	; (1028 <main+0xb0>)
     fa0:	681a      	ldr	r2, [r3, #0]
     fa2:	f042 0204 	orr.w	r2, r2, #4
     fa6:	601a      	str	r2, [r3, #0]
	APB2ENR->fld.iopben=1;
     fa8:	4b1f      	ldr	r3, [pc, #124]	; (1028 <main+0xb0>)
     faa:	681a      	ldr	r2, [r3, #0]
     fac:	f042 0208 	orr.w	r2, r2, #8
     fb0:	601a      	str	r2, [r3, #0]
	APB2ENR->fld.afioen=1;
     fb2:	4b1d      	ldr	r3, [pc, #116]	; (1028 <main+0xb0>)
     fb4:	681a      	ldr	r2, [r3, #0]
     fb6:	f042 0201 	orr.w	r2, r2, #1
     fba:	601a      	str	r2, [r3, #0]
	APB1ENR->fld.spi2en=1;
     fbc:	4b1b      	ldr	r3, [pc, #108]	; (102c <main+0xb4>)
     fbe:	681a      	ldr	r2, [r3, #0]
     fc0:	f442 4280 	orr.w	r2, r2, #16384	; 0x4000
     fc4:	601a      	str	r2, [r3, #0]
	config_pin(GPIOC,LED_PIN,OUTPUT_OD_SLOW);
     fc6:	2002      	movs	r0, #2
     fc8:	210d      	movs	r1, #13
     fca:	2206      	movs	r2, #6
     fcc:	f000 fb50 	bl	1670 <config_pin>
	uart_open_channel(CON,115200,FLOW_HARD);
     fd0:	4817      	ldr	r0, [pc, #92]	; (1030 <main+0xb8>)
     fd2:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     fd6:	2201      	movs	r2, #1
     fd8:	f000 ff1a 	bl	1e10 <uart_open_channel>
	tvout_init();
     fdc:	f000 fd68 	bl	1ab0 <tvout_init>
	cls();
     fe0:	f000 f8bc 	bl	115c <cls>
	print(VERSION);
     fe4:	4b13      	ldr	r3, [pc, #76]	; (1034 <main+0xbc>)
     fe6:	681b      	ldr	r3, [r3, #0]
     fe8:	4618      	mov	r0, r3
     fea:	f000 f887 	bl	10fc <print>
	copy_blink_in_ram();
     fee:	f7ff ffa1 	bl	f34 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
     ff2:	4811      	ldr	r0, [pc, #68]	; (1038 <main+0xc0>)
     ff4:	f000 f882 	bl	10fc <print>
     ff8:	4b10      	ldr	r3, [pc, #64]	; (103c <main+0xc4>)
     ffa:	2200      	movs	r2, #0
     ffc:	4618      	mov	r0, r3
     ffe:	4611      	mov	r1, r2
    1000:	df0a      	svc	10
    1002:	200d      	movs	r0, #13
    1004:	f000 f848 	bl	1098 <conout>
	//print_int(VIDEO_DELAY,10);
	_svc_call(SVC_LED_ON,NUL,NUL);
    1008:	2300      	movs	r3, #0
    100a:	2200      	movs	r2, #0
    100c:	4618      	mov	r0, r3
    100e:	4611      	mov	r1, r2
    1010:	df01      	svc	1
	flush_rx_queue();
    1012:	f000 fa43 	bl	149c <flush_rx_queue>
	unsigned llen;// char c;
	while (1){ // if ((c=conin())) conout(c);
		llen=read_line(tib,CMD_MAX_LEN);
    1016:	480a      	ldr	r0, [pc, #40]	; (1040 <main+0xc8>)
    1018:	2150      	movs	r1, #80	; 0x50
    101a:	f000 f8c5 	bl	11a8 <read_line>
    101e:	6078      	str	r0, [r7, #4]
		parse_line(llen);
    1020:	6878      	ldr	r0, [r7, #4]
    1022:	f7ff ff53 	bl	ecc <parse_line>
	}
    1026:	e7f6      	b.n	1016 <main+0x9e>
    1028:	40021018 	.word	0x40021018
    102c:	4002101c 	.word	0x4002101c
    1030:	40004400 	.word	0x40004400
    1034:	20000000 	.word	0x20000000
    1038:	00002144 	.word	0x00002144
    103c:	200000e8 	.word	0x200000e8
    1040:	20000014 	.word	0x20000014

00001044 <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
    1044:	4668      	mov	r0, sp
    1046:	f020 0107 	bic.w	r1, r0, #7
    104a:	468d      	mov	sp, r1
    104c:	b481      	push	{r0, r7}
    104e:	af00      	add	r7, sp, #0
	if (USART2_SR&(1<<USART_SR_RXNE)){
    1050:	4b0e      	ldr	r3, [pc, #56]	; (108c <USART2_handler+0x48>)
    1052:	681b      	ldr	r3, [r3, #0]
    1054:	f003 0320 	and.w	r3, r3, #32
    1058:	2b00      	cmp	r3, #0
    105a:	d012      	beq.n	1082 <USART2_handler+0x3e>
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
    105c:	4b0c      	ldr	r3, [pc, #48]	; (1090 <USART2_handler+0x4c>)
    105e:	6a1b      	ldr	r3, [r3, #32]
    1060:	1c5a      	adds	r2, r3, #1
    1062:	490b      	ldr	r1, [pc, #44]	; (1090 <USART2_handler+0x4c>)
    1064:	620a      	str	r2, [r1, #32]
    1066:	4a0b      	ldr	r2, [pc, #44]	; (1094 <USART2_handler+0x50>)
    1068:	6812      	ldr	r2, [r2, #0]
    106a:	b2d2      	uxtb	r2, r2
    106c:	f002 027f 	and.w	r2, r2, #127	; 0x7f
    1070:	b2d1      	uxtb	r1, r2
    1072:	4a07      	ldr	r2, [pc, #28]	; (1090 <USART2_handler+0x4c>)
    1074:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
    1076:	4b06      	ldr	r3, [pc, #24]	; (1090 <USART2_handler+0x4c>)
    1078:	6a1b      	ldr	r3, [r3, #32]
    107a:	f003 031f 	and.w	r3, r3, #31
    107e:	4a04      	ldr	r2, [pc, #16]	; (1090 <USART2_handler+0x4c>)
    1080:	6213      	str	r3, [r2, #32]
	}
}
    1082:	46bd      	mov	sp, r7
    1084:	bc81      	pop	{r0, r7}
    1086:	4685      	mov	sp, r0
    1088:	4770      	bx	lr
    108a:	bf00      	nop
    108c:	40004400 	.word	0x40004400
    1090:	200000b8 	.word	0x200000b8
    1094:	40004404 	.word	0x40004404

00001098 <conout>:


// envoie d'un caractère à la console
void conout(char c){
    1098:	b580      	push	{r7, lr}
    109a:	b082      	sub	sp, #8
    109c:	af00      	add	r7, sp, #0
    109e:	4603      	mov	r3, r0
    10a0:	71fb      	strb	r3, [r7, #7]
	uart_putc(CON,c);
    10a2:	79fb      	ldrb	r3, [r7, #7]
    10a4:	4803      	ldr	r0, [pc, #12]	; (10b4 <conout+0x1c>)
    10a6:	4619      	mov	r1, r3
    10a8:	f000 ff74 	bl	1f94 <uart_putc>
}
    10ac:	3708      	adds	r7, #8
    10ae:	46bd      	mov	sp, r7
    10b0:	bd80      	pop	{r7, pc}
    10b2:	bf00      	nop
    10b4:	40004400 	.word	0x40004400

000010b8 <conin>:


// réception d'un caractère de la console
char conin(){
    10b8:	b480      	push	{r7}
    10ba:	b083      	sub	sp, #12
    10bc:	af00      	add	r7, sp, #0
	char c=0;
    10be:	2300      	movs	r3, #0
    10c0:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
    10c2:	4b0d      	ldr	r3, [pc, #52]	; (10f8 <conin+0x40>)
    10c4:	6a1a      	ldr	r2, [r3, #32]
    10c6:	4b0c      	ldr	r3, [pc, #48]	; (10f8 <conin+0x40>)
    10c8:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10ca:	429a      	cmp	r2, r3
    10cc:	d00d      	beq.n	10ea <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
    10ce:	4b0a      	ldr	r3, [pc, #40]	; (10f8 <conin+0x40>)
    10d0:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10d2:	1c5a      	adds	r2, r3, #1
    10d4:	4908      	ldr	r1, [pc, #32]	; (10f8 <conin+0x40>)
    10d6:	624a      	str	r2, [r1, #36]	; 0x24
    10d8:	4a07      	ldr	r2, [pc, #28]	; (10f8 <conin+0x40>)
    10da:	5cd3      	ldrb	r3, [r2, r3]
    10dc:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
    10de:	4b06      	ldr	r3, [pc, #24]	; (10f8 <conin+0x40>)
    10e0:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10e2:	f003 031f 	and.w	r3, r3, #31
    10e6:	4a04      	ldr	r2, [pc, #16]	; (10f8 <conin+0x40>)
    10e8:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
    10ea:	79fb      	ldrb	r3, [r7, #7]
}
    10ec:	4618      	mov	r0, r3
    10ee:	370c      	adds	r7, #12
    10f0:	46bd      	mov	sp, r7
    10f2:	f85d 7b04 	ldr.w	r7, [sp], #4
    10f6:	4770      	bx	lr
    10f8:	200000b8 	.word	0x200000b8

000010fc <print>:

// imprime un chaîne sur la console
void print(const char *str){
    10fc:	b580      	push	{r7, lr}
    10fe:	b082      	sub	sp, #8
    1100:	af00      	add	r7, sp, #0
    1102:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
    1104:	e006      	b.n	1114 <print+0x18>
    1106:	687b      	ldr	r3, [r7, #4]
    1108:	1c5a      	adds	r2, r3, #1
    110a:	607a      	str	r2, [r7, #4]
    110c:	781b      	ldrb	r3, [r3, #0]
    110e:	4618      	mov	r0, r3
    1110:	f7ff ffc2 	bl	1098 <conout>
    1114:	687b      	ldr	r3, [r7, #4]
    1116:	781b      	ldrb	r3, [r3, #0]
    1118:	2b00      	cmp	r3, #0
    111a:	d1f4      	bne.n	1106 <print+0xa>
}
    111c:	3708      	adds	r7, #8
    111e:	46bd      	mov	sp, r7
    1120:	bd80      	pop	{r7, pc}
    1122:	bf00      	nop

00001124 <beep>:

void beep(){
    1124:	b480      	push	{r7}
    1126:	af00      	add	r7, sp, #0
}
    1128:	46bd      	mov	sp, r7
    112a:	f85d 7b04 	ldr.w	r7, [sp], #4
    112e:	4770      	bx	lr

00001130 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    1130:	b580      	push	{r7, lr}
    1132:	af00      	add	r7, sp, #0
	conout(BS);
    1134:	2008      	movs	r0, #8
    1136:	f7ff ffaf 	bl	1098 <conout>
	conout(SPACE);
    113a:	2020      	movs	r0, #32
    113c:	f7ff ffac 	bl	1098 <conout>
	conout(BS);
    1140:	2008      	movs	r0, #8
    1142:	f7ff ffa9 	bl	1098 <conout>
}
    1146:	bd80      	pop	{r7, pc}

00001148 <esc_seq>:

void esc_seq(){
    1148:	b580      	push	{r7, lr}
    114a:	af00      	add	r7, sp, #0
	conout(ESC);
    114c:	201b      	movs	r0, #27
    114e:	f7ff ffa3 	bl	1098 <conout>
	conout('[');
    1152:	205b      	movs	r0, #91	; 0x5b
    1154:	f7ff ffa0 	bl	1098 <conout>
}
    1158:	bd80      	pop	{r7, pc}
    115a:	bf00      	nop

0000115c <cls>:

// vide l'écran de la console
void cls(){
    115c:	b580      	push	{r7, lr}
    115e:	af00      	add	r7, sp, #0
	esc_seq();
    1160:	f7ff fff2 	bl	1148 <esc_seq>
	conout('2');
    1164:	2032      	movs	r0, #50	; 0x32
    1166:	f7ff ff97 	bl	1098 <conout>
	conout('J');
    116a:	204a      	movs	r0, #74	; 0x4a
    116c:	f7ff ff94 	bl	1098 <conout>
}
    1170:	bd80      	pop	{r7, pc}
    1172:	bf00      	nop

00001174 <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
    1174:	b580      	push	{r7, lr}
    1176:	b082      	sub	sp, #8
    1178:	af00      	add	r7, sp, #0
    117a:	6078      	str	r0, [r7, #4]
	esc_seq();
    117c:	f7ff ffe4 	bl	1148 <esc_seq>
	conout('2');
    1180:	2032      	movs	r0, #50	; 0x32
    1182:	f7ff ff89 	bl	1098 <conout>
	conout('K');
    1186:	204b      	movs	r0, #75	; 0x4b
    1188:	f7ff ff86 	bl	1098 <conout>
	while (n){conout(BS);n--;}
    118c:	e005      	b.n	119a <clear_line+0x26>
    118e:	2008      	movs	r0, #8
    1190:	f7ff ff82 	bl	1098 <conout>
    1194:	687b      	ldr	r3, [r7, #4]
    1196:	3b01      	subs	r3, #1
    1198:	607b      	str	r3, [r7, #4]
    119a:	687b      	ldr	r3, [r7, #4]
    119c:	2b00      	cmp	r3, #0
    119e:	d1f6      	bne.n	118e <clear_line+0x1a>
}
    11a0:	3708      	adds	r7, #8
    11a2:	46bd      	mov	sp, r7
    11a4:	bd80      	pop	{r7, pc}
    11a6:	bf00      	nop

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
    11c0:	e08e      	b.n	12e0 <read_line+0x138>
			c=conin();
    11c2:	f7ff ff79 	bl	10b8 <conin>
    11c6:	4603      	mov	r3, r0
    11c8:	72fb      	strb	r3, [r7, #11]
			switch(c){
    11ca:	7afb      	ldrb	r3, [r7, #11]
    11cc:	2b18      	cmp	r3, #24
    11ce:	d872      	bhi.n	12b6 <read_line+0x10e>
    11d0:	a201      	add	r2, pc, #4	; (adr r2, 11d8 <read_line+0x30>)
    11d2:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    11d6:	bf00      	nop
    11d8:	000012e1 	.word	0x000012e1
    11dc:	000012b7 	.word	0x000012b7
    11e0:	000012b7 	.word	0x000012b7
    11e4:	000012b7 	.word	0x000012b7
    11e8:	000012b7 	.word	0x000012b7
    11ec:	000012a9 	.word	0x000012a9
    11f0:	000012b7 	.word	0x000012b7
    11f4:	000012b7 	.word	0x000012b7
    11f8:	00001297 	.word	0x00001297
    11fc:	000012b3 	.word	0x000012b3
    1200:	0000123d 	.word	0x0000123d
    1204:	000012b7 	.word	0x000012b7
    1208:	000012b7 	.word	0x000012b7
    120c:	0000123d 	.word	0x0000123d
    1210:	000012b7 	.word	0x000012b7
    1214:	000012b7 	.word	0x000012b7
    1218:	000012b7 	.word	0x000012b7
    121c:	000012b7 	.word	0x000012b7
    1220:	000012b7 	.word	0x000012b7
    1224:	000012b7 	.word	0x000012b7
    1228:	000012b7 	.word	0x000012b7
    122c:	0000124b 	.word	0x0000124b
    1230:	000012b7 	.word	0x000012b7
    1234:	00001261 	.word	0x00001261
    1238:	0000124b 	.word	0x0000124b
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    123c:	230d      	movs	r3, #13
    123e:	72fb      	strb	r3, [r7, #11]
				conout(c);
    1240:	7afb      	ldrb	r3, [r7, #11]
    1242:	4618      	mov	r0, r3
    1244:	f7ff ff28 	bl	1098 <conout>
				break;
    1248:	e04a      	b.n	12e0 <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
    124a:	68f8      	ldr	r0, [r7, #12]
    124c:	f7ff ff92 	bl	1174 <clear_line>
				line_len=0;
    1250:	2300      	movs	r3, #0
    1252:	60fb      	str	r3, [r7, #12]
				break;
    1254:	e044      	b.n	12e0 <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    1256:	f7ff ff6b 	bl	1130 <delete_back>
					line_len--;
    125a:	68fb      	ldr	r3, [r7, #12]
    125c:	3b01      	subs	r3, #1
    125e:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    1260:	68fb      	ldr	r3, [r7, #12]
    1262:	2b00      	cmp	r3, #0
    1264:	d006      	beq.n	1274 <read_line+0xcc>
    1266:	68fb      	ldr	r3, [r7, #12]
    1268:	3b01      	subs	r3, #1
    126a:	687a      	ldr	r2, [r7, #4]
    126c:	4413      	add	r3, r2
    126e:	781b      	ldrb	r3, [r3, #0]
    1270:	2b20      	cmp	r3, #32
    1272:	d0f0      	beq.n	1256 <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1274:	e004      	b.n	1280 <read_line+0xd8>
					delete_back();
    1276:	f7ff ff5b 	bl	1130 <delete_back>
					line_len--;
    127a:	68fb      	ldr	r3, [r7, #12]
    127c:	3b01      	subs	r3, #1
    127e:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1280:	68fb      	ldr	r3, [r7, #12]
    1282:	2b00      	cmp	r3, #0
    1284:	d006      	beq.n	1294 <read_line+0xec>
    1286:	68fb      	ldr	r3, [r7, #12]
    1288:	3b01      	subs	r3, #1
    128a:	687a      	ldr	r2, [r7, #4]
    128c:	4413      	add	r3, r2
    128e:	781b      	ldrb	r3, [r3, #0]
    1290:	2b20      	cmp	r3, #32
    1292:	d1f0      	bne.n	1276 <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    1294:	e024      	b.n	12e0 <read_line+0x138>
				case BS:
				if (line_len){
    1296:	68fb      	ldr	r3, [r7, #12]
    1298:	2b00      	cmp	r3, #0
    129a:	d004      	beq.n	12a6 <read_line+0xfe>
					delete_back();
    129c:	f7ff ff48 	bl	1130 <delete_back>
					line_len--;
    12a0:	68fb      	ldr	r3, [r7, #12]
    12a2:	3b01      	subs	r3, #1
    12a4:	60fb      	str	r3, [r7, #12]
				}
				break;
    12a6:	e01b      	b.n	12e0 <read_line+0x138>
				case CTRL_E:
				cls();
    12a8:	f7ff ff58 	bl	115c <cls>
				line_len=0;
    12ac:	2300      	movs	r3, #0
    12ae:	60fb      	str	r3, [r7, #12]
				break;
    12b0:	e016      	b.n	12e0 <read_line+0x138>
				case TAB:
				c=SPACE;
    12b2:	2320      	movs	r3, #32
    12b4:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    12b6:	68fa      	ldr	r2, [r7, #12]
    12b8:	683b      	ldr	r3, [r7, #0]
    12ba:	429a      	cmp	r2, r3
    12bc:	d20e      	bcs.n	12dc <read_line+0x134>
    12be:	7afb      	ldrb	r3, [r7, #11]
    12c0:	2b1f      	cmp	r3, #31
    12c2:	d90b      	bls.n	12dc <read_line+0x134>
					buffer[line_len++]=c;
    12c4:	68fb      	ldr	r3, [r7, #12]
    12c6:	1c5a      	adds	r2, r3, #1
    12c8:	60fa      	str	r2, [r7, #12]
    12ca:	687a      	ldr	r2, [r7, #4]
    12cc:	4413      	add	r3, r2
    12ce:	7afa      	ldrb	r2, [r7, #11]
    12d0:	701a      	strb	r2, [r3, #0]
					conout(c);
    12d2:	7afb      	ldrb	r3, [r7, #11]
    12d4:	4618      	mov	r0, r3
    12d6:	f7ff fedf 	bl	1098 <conout>
    12da:	e001      	b.n	12e0 <read_line+0x138>
				}else{
					beep();
    12dc:	f7ff ff22 	bl	1124 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    12e0:	7afb      	ldrb	r3, [r7, #11]
    12e2:	2b0d      	cmp	r3, #13
    12e4:	f47f af6d 	bne.w	11c2 <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    12e8:	687a      	ldr	r2, [r7, #4]
    12ea:	68fb      	ldr	r3, [r7, #12]
    12ec:	4413      	add	r3, r2
    12ee:	2200      	movs	r2, #0
    12f0:	701a      	strb	r2, [r3, #0]
	return line_len;
    12f2:	68fb      	ldr	r3, [r7, #12]
}
    12f4:	4618      	mov	r0, r3
    12f6:	3710      	adds	r7, #16
    12f8:	46bd      	mov	sp, r7
    12fa:	bd80      	pop	{r7, pc}

000012fc <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    12fc:	b580      	push	{r7, lr}
    12fe:	b08e      	sub	sp, #56	; 0x38
    1300:	af00      	add	r7, sp, #0
    1302:	6078      	str	r0, [r7, #4]
    1304:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    1306:	2301      	movs	r3, #1
    1308:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    130a:	2322      	movs	r3, #34	; 0x22
    130c:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    130e:	2300      	movs	r3, #0
    1310:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1314:	687b      	ldr	r3, [r7, #4]
    1316:	2b00      	cmp	r3, #0
    1318:	da05      	bge.n	1326 <print_int+0x2a>
    131a:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    131e:	637b      	str	r3, [r7, #52]	; 0x34
    1320:	687b      	ldr	r3, [r7, #4]
    1322:	425b      	negs	r3, r3
    1324:	607b      	str	r3, [r7, #4]
	while (i){
    1326:	e02c      	b.n	1382 <print_int+0x86>
		fmt[pos]=i%base+'0';
    1328:	687b      	ldr	r3, [r7, #4]
    132a:	683a      	ldr	r2, [r7, #0]
    132c:	fbb3 f2f2 	udiv	r2, r3, r2
    1330:	6839      	ldr	r1, [r7, #0]
    1332:	fb01 f202 	mul.w	r2, r1, r2
    1336:	1a9b      	subs	r3, r3, r2
    1338:	b2db      	uxtb	r3, r3
    133a:	3330      	adds	r3, #48	; 0x30
    133c:	b2d9      	uxtb	r1, r3
    133e:	f107 020c 	add.w	r2, r7, #12
    1342:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1344:	4413      	add	r3, r2
    1346:	460a      	mov	r2, r1
    1348:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    134a:	f107 020c 	add.w	r2, r7, #12
    134e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1350:	4413      	add	r3, r2
    1352:	781b      	ldrb	r3, [r3, #0]
    1354:	2b39      	cmp	r3, #57	; 0x39
    1356:	d90c      	bls.n	1372 <print_int+0x76>
    1358:	f107 020c 	add.w	r2, r7, #12
    135c:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    135e:	4413      	add	r3, r2
    1360:	781b      	ldrb	r3, [r3, #0]
    1362:	3307      	adds	r3, #7
    1364:	b2d9      	uxtb	r1, r3
    1366:	f107 020c 	add.w	r2, r7, #12
    136a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    136c:	4413      	add	r3, r2
    136e:	460a      	mov	r2, r1
    1370:	701a      	strb	r2, [r3, #0]
		pos--;
    1372:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1374:	3b01      	subs	r3, #1
    1376:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    1378:	687a      	ldr	r2, [r7, #4]
    137a:	683b      	ldr	r3, [r7, #0]
    137c:	fbb2 f3f3 	udiv	r3, r2, r3
    1380:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    1382:	687b      	ldr	r3, [r7, #4]
    1384:	2b00      	cmp	r3, #0
    1386:	d1cf      	bne.n	1328 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    1388:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    138a:	2b22      	cmp	r3, #34	; 0x22
    138c:	d108      	bne.n	13a0 <print_int+0xa4>
    138e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1390:	1e5a      	subs	r2, r3, #1
    1392:	633a      	str	r2, [r7, #48]	; 0x30
    1394:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1398:	4413      	add	r3, r2
    139a:	2230      	movs	r2, #48	; 0x30
    139c:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    13a0:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    13a2:	2b00      	cmp	r3, #0
    13a4:	da08      	bge.n	13b8 <print_int+0xbc>
    13a6:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13a8:	1e5a      	subs	r2, r3, #1
    13aa:	633a      	str	r2, [r7, #48]	; 0x30
    13ac:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13b0:	4413      	add	r3, r2
    13b2:	222d      	movs	r2, #45	; 0x2d
    13b4:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    13b8:	f107 020c 	add.w	r2, r7, #12
    13bc:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13be:	4413      	add	r3, r2
    13c0:	2220      	movs	r2, #32
    13c2:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    13c4:	f107 020c 	add.w	r2, r7, #12
    13c8:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13ca:	4413      	add	r3, r2
    13cc:	4618      	mov	r0, r3
    13ce:	f7ff fe95 	bl	10fc <print>
}
    13d2:	3738      	adds	r7, #56	; 0x38
    13d4:	46bd      	mov	sp, r7
    13d6:	bd80      	pop	{r7, pc}

000013d8 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    13d8:	b580      	push	{r7, lr}
    13da:	b088      	sub	sp, #32
    13dc:	af00      	add	r7, sp, #0
    13de:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    13e0:	230c      	movs	r3, #12
    13e2:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    13e4:	2300      	movs	r3, #0
    13e6:	767b      	strb	r3, [r7, #25]
	while (u){
    13e8:	e026      	b.n	1438 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    13ea:	687b      	ldr	r3, [r7, #4]
    13ec:	b2db      	uxtb	r3, r3
    13ee:	f003 030f 	and.w	r3, r3, #15
    13f2:	b2db      	uxtb	r3, r3
    13f4:	3330      	adds	r3, #48	; 0x30
    13f6:	b2d9      	uxtb	r1, r3
    13f8:	f107 020c 	add.w	r2, r7, #12
    13fc:	69fb      	ldr	r3, [r7, #28]
    13fe:	4413      	add	r3, r2
    1400:	460a      	mov	r2, r1
    1402:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1404:	f107 020c 	add.w	r2, r7, #12
    1408:	69fb      	ldr	r3, [r7, #28]
    140a:	4413      	add	r3, r2
    140c:	781b      	ldrb	r3, [r3, #0]
    140e:	2b39      	cmp	r3, #57	; 0x39
    1410:	d90c      	bls.n	142c <print_hex+0x54>
    1412:	f107 020c 	add.w	r2, r7, #12
    1416:	69fb      	ldr	r3, [r7, #28]
    1418:	4413      	add	r3, r2
    141a:	781b      	ldrb	r3, [r3, #0]
    141c:	3307      	adds	r3, #7
    141e:	b2d9      	uxtb	r1, r3
    1420:	f107 020c 	add.w	r2, r7, #12
    1424:	69fb      	ldr	r3, [r7, #28]
    1426:	4413      	add	r3, r2
    1428:	460a      	mov	r2, r1
    142a:	701a      	strb	r2, [r3, #0]
		pos--;
    142c:	69fb      	ldr	r3, [r7, #28]
    142e:	3b01      	subs	r3, #1
    1430:	61fb      	str	r3, [r7, #28]
		u/=16;
    1432:	687b      	ldr	r3, [r7, #4]
    1434:	091b      	lsrs	r3, r3, #4
    1436:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    1438:	687b      	ldr	r3, [r7, #4]
    143a:	2b00      	cmp	r3, #0
    143c:	d1d5      	bne.n	13ea <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    143e:	69fb      	ldr	r3, [r7, #28]
    1440:	2b0c      	cmp	r3, #12
    1442:	d108      	bne.n	1456 <print_hex+0x7e>
    1444:	69fb      	ldr	r3, [r7, #28]
    1446:	1e5a      	subs	r2, r3, #1
    1448:	61fa      	str	r2, [r7, #28]
    144a:	f107 0220 	add.w	r2, r7, #32
    144e:	4413      	add	r3, r2
    1450:	2230      	movs	r2, #48	; 0x30
    1452:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    1456:	69fb      	ldr	r3, [r7, #28]
    1458:	1e5a      	subs	r2, r3, #1
    145a:	61fa      	str	r2, [r7, #28]
    145c:	f107 0220 	add.w	r2, r7, #32
    1460:	4413      	add	r3, r2
    1462:	2278      	movs	r2, #120	; 0x78
    1464:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    1468:	69fb      	ldr	r3, [r7, #28]
    146a:	1e5a      	subs	r2, r3, #1
    146c:	61fa      	str	r2, [r7, #28]
    146e:	f107 0220 	add.w	r2, r7, #32
    1472:	4413      	add	r3, r2
    1474:	2230      	movs	r2, #48	; 0x30
    1476:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    147a:	f107 020c 	add.w	r2, r7, #12
    147e:	69fb      	ldr	r3, [r7, #28]
    1480:	4413      	add	r3, r2
    1482:	2220      	movs	r2, #32
    1484:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1486:	f107 020c 	add.w	r2, r7, #12
    148a:	69fb      	ldr	r3, [r7, #28]
    148c:	4413      	add	r3, r2
    148e:	4618      	mov	r0, r3
    1490:	f7ff fe34 	bl	10fc <print>
}
    1494:	3720      	adds	r7, #32
    1496:	46bd      	mov	sp, r7
    1498:	bd80      	pop	{r7, pc}
    149a:	bf00      	nop

0000149c <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    149c:	b480      	push	{r7}
    149e:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    14a0:	4b04      	ldr	r3, [pc, #16]	; (14b4 <flush_rx_queue+0x18>)
    14a2:	2200      	movs	r2, #0
    14a4:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    14a6:	4b03      	ldr	r3, [pc, #12]	; (14b4 <flush_rx_queue+0x18>)
    14a8:	2200      	movs	r2, #0
    14aa:	625a      	str	r2, [r3, #36]	; 0x24
}
    14ac:	46bd      	mov	sp, r7
    14ae:	f85d 7b04 	ldr.w	r7, [sp], #4
    14b2:	4770      	bx	lr
    14b4:	200000b8 	.word	0x200000b8

000014b8 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    14b8:	b480      	push	{r7}
    14ba:	af00      	add	r7, sp, #0
	if (!RCC_CR->fld.hsion){ // activation clock HSI
    14bc:	4b14      	ldr	r3, [pc, #80]	; (1510 <flash_enable+0x58>)
    14be:	681b      	ldr	r3, [r3, #0]
    14c0:	f003 0301 	and.w	r3, r3, #1
    14c4:	b2db      	uxtb	r3, r3
    14c6:	2b00      	cmp	r3, #0
    14c8:	d10d      	bne.n	14e6 <flash_enable+0x2e>
		RCC_CR->fld.hsion=1;
    14ca:	4b11      	ldr	r3, [pc, #68]	; (1510 <flash_enable+0x58>)
    14cc:	681a      	ldr	r2, [r3, #0]
    14ce:	f042 0201 	orr.w	r2, r2, #1
    14d2:	601a      	str	r2, [r3, #0]
		while (!RCC_CR->fld.hsirdy);
    14d4:	bf00      	nop
    14d6:	4b0e      	ldr	r3, [pc, #56]	; (1510 <flash_enable+0x58>)
    14d8:	681b      	ldr	r3, [r3, #0]
    14da:	085b      	lsrs	r3, r3, #1
    14dc:	f003 0301 	and.w	r3, r3, #1
    14e0:	b2db      	uxtb	r3, r3
    14e2:	2b00      	cmp	r3, #0
    14e4:	d0f7      	beq.n	14d6 <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    14e6:	4b0b      	ldr	r3, [pc, #44]	; (1514 <flash_enable+0x5c>)
    14e8:	4a0b      	ldr	r2, [pc, #44]	; (1518 <flash_enable+0x60>)
    14ea:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    14ec:	4b09      	ldr	r3, [pc, #36]	; (1514 <flash_enable+0x5c>)
    14ee:	4a0b      	ldr	r2, [pc, #44]	; (151c <flash_enable+0x64>)
    14f0:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    14f2:	4b08      	ldr	r3, [pc, #32]	; (1514 <flash_enable+0x5c>)
    14f4:	691b      	ldr	r3, [r3, #16]
    14f6:	f003 0380 	and.w	r3, r3, #128	; 0x80
    14fa:	2b00      	cmp	r3, #0
    14fc:	bf0c      	ite	eq
    14fe:	2301      	moveq	r3, #1
    1500:	2300      	movne	r3, #0
    1502:	b2db      	uxtb	r3, r3
}
    1504:	4618      	mov	r0, r3
    1506:	46bd      	mov	sp, r7
    1508:	f85d 7b04 	ldr.w	r7, [sp], #4
    150c:	4770      	bx	lr
    150e:	bf00      	nop
    1510:	40021000 	.word	0x40021000
    1514:	40022000 	.word	0x40022000
    1518:	45670123 	.word	0x45670123
    151c:	cdef89ab 	.word	0xcdef89ab

00001520 <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    1520:	b480      	push	{r7}
    1522:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    1524:	4a04      	ldr	r2, [pc, #16]	; (1538 <flash_disable+0x18>)
    1526:	4b04      	ldr	r3, [pc, #16]	; (1538 <flash_disable+0x18>)
    1528:	691b      	ldr	r3, [r3, #16]
    152a:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    152e:	6113      	str	r3, [r2, #16]
}
    1530:	46bd      	mov	sp, r7
    1532:	f85d 7b04 	ldr.w	r7, [sp], #4
    1536:	4770      	bx	lr
    1538:	40022000 	.word	0x40022000

0000153c <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    153c:	b480      	push	{r7}
    153e:	b083      	sub	sp, #12
    1540:	af00      	add	r7, sp, #0
    1542:	6078      	str	r0, [r7, #4]
    1544:	460b      	mov	r3, r1
    1546:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    1548:	4b1d      	ldr	r3, [pc, #116]	; (15c0 <flash_write+0x84>)
    154a:	691b      	ldr	r3, [r3, #16]
    154c:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1550:	2b00      	cmp	r3, #0
    1552:	d105      	bne.n	1560 <flash_write+0x24>
    1554:	687b      	ldr	r3, [r7, #4]
    1556:	881b      	ldrh	r3, [r3, #0]
    1558:	f64f 72ff 	movw	r2, #65535	; 0xffff
    155c:	4293      	cmp	r3, r2
    155e:	d001      	beq.n	1564 <flash_write+0x28>
    1560:	2300      	movs	r3, #0
    1562:	e027      	b.n	15b4 <flash_write+0x78>
	while (_flash_busy);
    1564:	bf00      	nop
    1566:	4b16      	ldr	r3, [pc, #88]	; (15c0 <flash_write+0x84>)
    1568:	68db      	ldr	r3, [r3, #12]
    156a:	f003 0301 	and.w	r3, r3, #1
    156e:	2b00      	cmp	r3, #0
    1570:	d1f9      	bne.n	1566 <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1572:	4a13      	ldr	r2, [pc, #76]	; (15c0 <flash_write+0x84>)
    1574:	4b12      	ldr	r3, [pc, #72]	; (15c0 <flash_write+0x84>)
    1576:	68db      	ldr	r3, [r3, #12]
    1578:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    157c:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    157e:	4b10      	ldr	r3, [pc, #64]	; (15c0 <flash_write+0x84>)
    1580:	2201      	movs	r2, #1
    1582:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    1584:	687b      	ldr	r3, [r7, #4]
    1586:	887a      	ldrh	r2, [r7, #2]
    1588:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    158a:	bf00      	nop
    158c:	4b0c      	ldr	r3, [pc, #48]	; (15c0 <flash_write+0x84>)
    158e:	68db      	ldr	r3, [r3, #12]
    1590:	f003 0301 	and.w	r3, r3, #1
    1594:	2b00      	cmp	r3, #0
    1596:	d005      	beq.n	15a4 <flash_write+0x68>
    1598:	4b09      	ldr	r3, [pc, #36]	; (15c0 <flash_write+0x84>)
    159a:	68db      	ldr	r3, [r3, #12]
    159c:	f003 0320 	and.w	r3, r3, #32
    15a0:	2b00      	cmp	r3, #0
    15a2:	d0f3      	beq.n	158c <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    15a4:	687b      	ldr	r3, [r7, #4]
    15a6:	881b      	ldrh	r3, [r3, #0]
    15a8:	887a      	ldrh	r2, [r7, #2]
    15aa:	429a      	cmp	r2, r3
    15ac:	bf0c      	ite	eq
    15ae:	2301      	moveq	r3, #1
    15b0:	2300      	movne	r3, #0
    15b2:	b2db      	uxtb	r3, r3
}
    15b4:	4618      	mov	r0, r3
    15b6:	370c      	adds	r7, #12
    15b8:	46bd      	mov	sp, r7
    15ba:	f85d 7b04 	ldr.w	r7, [sp], #4
    15be:	4770      	bx	lr
    15c0:	40022000 	.word	0x40022000

000015c4 <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    15c4:	b480      	push	{r7}
    15c6:	b087      	sub	sp, #28
    15c8:	af00      	add	r7, sp, #0
    15ca:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    15cc:	4b27      	ldr	r3, [pc, #156]	; (166c <flash_erase_page+0xa8>)
    15ce:	691b      	ldr	r3, [r3, #16]
    15d0:	f003 0380 	and.w	r3, r3, #128	; 0x80
    15d4:	2b00      	cmp	r3, #0
    15d6:	d001      	beq.n	15dc <flash_erase_page+0x18>
    15d8:	2300      	movs	r3, #0
    15da:	e040      	b.n	165e <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    15dc:	4a23      	ldr	r2, [pc, #140]	; (166c <flash_erase_page+0xa8>)
    15de:	4b23      	ldr	r3, [pc, #140]	; (166c <flash_erase_page+0xa8>)
    15e0:	68db      	ldr	r3, [r3, #12]
    15e2:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    15e6:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    15e8:	687b      	ldr	r3, [r7, #4]
    15ea:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    15ee:	f023 0303 	bic.w	r3, r3, #3
    15f2:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    15f4:	4b1d      	ldr	r3, [pc, #116]	; (166c <flash_erase_page+0xa8>)
    15f6:	2202      	movs	r2, #2
    15f8:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    15fa:	4a1c      	ldr	r2, [pc, #112]	; (166c <flash_erase_page+0xa8>)
    15fc:	687b      	ldr	r3, [r7, #4]
    15fe:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    1600:	4a1a      	ldr	r2, [pc, #104]	; (166c <flash_erase_page+0xa8>)
    1602:	4b1a      	ldr	r3, [pc, #104]	; (166c <flash_erase_page+0xa8>)
    1604:	691b      	ldr	r3, [r3, #16]
    1606:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    160a:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    160c:	bf00      	nop
    160e:	4b17      	ldr	r3, [pc, #92]	; (166c <flash_erase_page+0xa8>)
    1610:	68db      	ldr	r3, [r3, #12]
    1612:	f003 0301 	and.w	r3, r3, #1
    1616:	2b00      	cmp	r3, #0
    1618:	d005      	beq.n	1626 <flash_erase_page+0x62>
    161a:	4b14      	ldr	r3, [pc, #80]	; (166c <flash_erase_page+0xa8>)
    161c:	68db      	ldr	r3, [r3, #12]
    161e:	f003 0320 	and.w	r3, r3, #32
    1622:	2b00      	cmp	r3, #0
    1624:	d0f3      	beq.n	160e <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    1626:	687b      	ldr	r3, [r7, #4]
    1628:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    162a:	2300      	movs	r3, #0
    162c:	60fb      	str	r3, [r7, #12]
    162e:	e00c      	b.n	164a <flash_erase_page+0x86>
		u32=*adr++;
    1630:	697b      	ldr	r3, [r7, #20]
    1632:	1d1a      	adds	r2, r3, #4
    1634:	617a      	str	r2, [r7, #20]
    1636:	681b      	ldr	r3, [r3, #0]
    1638:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    163a:	693b      	ldr	r3, [r7, #16]
    163c:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1640:	d000      	beq.n	1644 <flash_erase_page+0x80>
    1642:	e005      	b.n	1650 <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    1644:	68fb      	ldr	r3, [r7, #12]
    1646:	3301      	adds	r3, #1
    1648:	60fb      	str	r3, [r7, #12]
    164a:	68fb      	ldr	r3, [r7, #12]
    164c:	2bff      	cmp	r3, #255	; 0xff
    164e:	ddef      	ble.n	1630 <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    1650:	693b      	ldr	r3, [r7, #16]
    1652:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1656:	bf0c      	ite	eq
    1658:	2301      	moveq	r3, #1
    165a:	2300      	movne	r3, #0
    165c:	b2db      	uxtb	r3, r3
}
    165e:	4618      	mov	r0, r3
    1660:	371c      	adds	r7, #28
    1662:	46bd      	mov	sp, r7
    1664:	f85d 7b04 	ldr.w	r7, [sp], #4
    1668:	4770      	bx	lr
    166a:	bf00      	nop
    166c:	40022000 	.word	0x40022000

00001670 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    1670:	b490      	push	{r4, r7}
    1672:	b086      	sub	sp, #24
    1674:	af00      	add	r7, sp, #0
    1676:	60f8      	str	r0, [r7, #12]
    1678:	60b9      	str	r1, [r7, #8]
    167a:	607a      	str	r2, [r7, #4]
	register gpio_crl_t* cr;
	uint8_t shift;
	switch (port){
    167c:	68fb      	ldr	r3, [r7, #12]
    167e:	2b01      	cmp	r3, #1
    1680:	d006      	beq.n	1690 <config_pin+0x20>
    1682:	2b01      	cmp	r3, #1
    1684:	d302      	bcc.n	168c <config_pin+0x1c>
    1686:	2b02      	cmp	r3, #2
    1688:	d004      	beq.n	1694 <config_pin+0x24>
    168a:	e005      	b.n	1698 <config_pin+0x28>
		case GPIOA:
		cr=(gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS);
    168c:	4c17      	ldr	r4, [pc, #92]	; (16ec <config_pin+0x7c>)
		break;
    168e:	e003      	b.n	1698 <config_pin+0x28>
		case GPIOB:
		cr=(gpio_crl_t*)(GPIOB_BASE_ADR+GPIO_CRL_OFS);
    1690:	4c17      	ldr	r4, [pc, #92]	; (16f0 <config_pin+0x80>)
		break;
    1692:	e001      	b.n	1698 <config_pin+0x28>
		case GPIOC:
		cr=(gpio_crl_t*)(GPIOC_BASE_ADR+GPIO_CRL_OFS);
    1694:	4c17      	ldr	r4, [pc, #92]	; (16f4 <config_pin+0x84>)
		break;
    1696:	bf00      	nop
	}
	shift=(pin&7)<<2;
    1698:	68bb      	ldr	r3, [r7, #8]
    169a:	b2db      	uxtb	r3, r3
    169c:	f003 0307 	and.w	r3, r3, #7
    16a0:	b2db      	uxtb	r3, r3
    16a2:	009b      	lsls	r3, r3, #2
    16a4:	75fb      	strb	r3, [r7, #23]
	cr[pin>>3].cr&=~(15<<shift);
    16a6:	68bb      	ldr	r3, [r7, #8]
    16a8:	08db      	lsrs	r3, r3, #3
    16aa:	009b      	lsls	r3, r3, #2
    16ac:	4423      	add	r3, r4
    16ae:	68ba      	ldr	r2, [r7, #8]
    16b0:	08d2      	lsrs	r2, r2, #3
    16b2:	0092      	lsls	r2, r2, #2
    16b4:	4422      	add	r2, r4
    16b6:	6812      	ldr	r2, [r2, #0]
    16b8:	7df9      	ldrb	r1, [r7, #23]
    16ba:	200f      	movs	r0, #15
    16bc:	fa00 f101 	lsl.w	r1, r0, r1
    16c0:	43c9      	mvns	r1, r1
    16c2:	400a      	ands	r2, r1
    16c4:	601a      	str	r2, [r3, #0]
	cr[pin>>3].cr|=config<<shift;
    16c6:	68bb      	ldr	r3, [r7, #8]
    16c8:	08db      	lsrs	r3, r3, #3
    16ca:	009b      	lsls	r3, r3, #2
    16cc:	4423      	add	r3, r4
    16ce:	68ba      	ldr	r2, [r7, #8]
    16d0:	08d2      	lsrs	r2, r2, #3
    16d2:	0092      	lsls	r2, r2, #2
    16d4:	4422      	add	r2, r4
    16d6:	6811      	ldr	r1, [r2, #0]
    16d8:	7dfa      	ldrb	r2, [r7, #23]
    16da:	6878      	ldr	r0, [r7, #4]
    16dc:	fa00 f202 	lsl.w	r2, r0, r2
    16e0:	430a      	orrs	r2, r1
    16e2:	601a      	str	r2, [r3, #0]
}
    16e4:	3718      	adds	r7, #24
    16e6:	46bd      	mov	sp, r7
    16e8:	bc90      	pop	{r4, r7}
    16ea:	4770      	bx	lr
    16ec:	40010800 	.word	0x40010800
    16f0:	40010c00 	.word	0x40010c00
    16f4:	40011000 	.word	0x40011000

000016f8 <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    16f8:	b480      	push	{r7}
    16fa:	b083      	sub	sp, #12
    16fc:	af00      	add	r7, sp, #0
    16fe:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    1700:	687b      	ldr	r3, [r7, #4]
    1702:	2b3b      	cmp	r3, #59	; 0x3b
    1704:	d900      	bls.n	1708 <enable_interrupt+0x10>
    1706:	e016      	b.n	1736 <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    1708:	687b      	ldr	r3, [r7, #4]
    170a:	095b      	lsrs	r3, r3, #5
    170c:	009b      	lsls	r3, r3, #2
    170e:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    1712:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    1716:	687a      	ldr	r2, [r7, #4]
    1718:	0952      	lsrs	r2, r2, #5
    171a:	0092      	lsls	r2, r2, #2
    171c:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    1720:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    1724:	6812      	ldr	r2, [r2, #0]
    1726:	6879      	ldr	r1, [r7, #4]
    1728:	f001 011f 	and.w	r1, r1, #31
    172c:	2001      	movs	r0, #1
    172e:	fa00 f101 	lsl.w	r1, r0, r1
    1732:	430a      	orrs	r2, r1
    1734:	601a      	str	r2, [r3, #0]
}
    1736:	370c      	adds	r7, #12
    1738:	46bd      	mov	sp, r7
    173a:	f85d 7b04 	ldr.w	r7, [sp], #4
    173e:	4770      	bx	lr

00001740 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    1740:	b480      	push	{r7}
    1742:	b083      	sub	sp, #12
    1744:	af00      	add	r7, sp, #0
    1746:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    1748:	687b      	ldr	r3, [r7, #4]
    174a:	2b3b      	cmp	r3, #59	; 0x3b
    174c:	d900      	bls.n	1750 <disable_interrupt+0x10>
    174e:	e013      	b.n	1778 <disable_interrupt+0x38>
	ICER[irq>>5]&=~(1<<(irq&0x1f));
    1750:	687b      	ldr	r3, [r7, #4]
    1752:	095b      	lsrs	r3, r3, #5
    1754:	009a      	lsls	r2, r3, #2
    1756:	4b0b      	ldr	r3, [pc, #44]	; (1784 <disable_interrupt+0x44>)
    1758:	4413      	add	r3, r2
    175a:	687a      	ldr	r2, [r7, #4]
    175c:	0952      	lsrs	r2, r2, #5
    175e:	0091      	lsls	r1, r2, #2
    1760:	4a08      	ldr	r2, [pc, #32]	; (1784 <disable_interrupt+0x44>)
    1762:	440a      	add	r2, r1
    1764:	6812      	ldr	r2, [r2, #0]
    1766:	6879      	ldr	r1, [r7, #4]
    1768:	f001 011f 	and.w	r1, r1, #31
    176c:	2001      	movs	r0, #1
    176e:	fa00 f101 	lsl.w	r1, r0, r1
    1772:	43c9      	mvns	r1, r1
    1774:	400a      	ands	r2, r1
    1776:	601a      	str	r2, [r3, #0]
}
    1778:	370c      	adds	r7, #12
    177a:	46bd      	mov	sp, r7
    177c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1780:	4770      	bx	lr
    1782:	bf00      	nop
    1784:	e000e180 	.word	0xe000e180

00001788 <set_int_priority>:



void set_int_priority(int32_t irq, unsigned priority){
    1788:	b480      	push	{r7}
    178a:	b083      	sub	sp, #12
    178c:	af00      	add	r7, sp, #0
    178e:	6078      	str	r0, [r7, #4]
    1790:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    1792:	687b      	ldr	r3, [r7, #4]
    1794:	2b00      	cmp	r3, #0
    1796:	db0d      	blt.n	17b4 <set_int_priority+0x2c>
    1798:	687b      	ldr	r3, [r7, #4]
    179a:	2b3b      	cmp	r3, #59	; 0x3b
    179c:	dc0a      	bgt.n	17b4 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    179e:	687b      	ldr	r3, [r7, #4]
    17a0:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    17a4:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    17a8:	683a      	ldr	r2, [r7, #0]
    17aa:	b2d2      	uxtb	r2, r2
    17ac:	0112      	lsls	r2, r2, #4
    17ae:	b2d2      	uxtb	r2, r2
    17b0:	701a      	strb	r2, [r3, #0]
    17b2:	e012      	b.n	17da <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    17b4:	687b      	ldr	r3, [r7, #4]
    17b6:	2b00      	cmp	r3, #0
    17b8:	da0f      	bge.n	17da <set_int_priority+0x52>
    17ba:	687b      	ldr	r3, [r7, #4]
    17bc:	f113 0f0f 	cmn.w	r3, #15
    17c0:	db0b      	blt.n	17da <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    17c2:	687a      	ldr	r2, [r7, #4]
    17c4:	f06f 0303 	mvn.w	r3, #3
    17c8:	1a9b      	subs	r3, r3, r2
    17ca:	461a      	mov	r2, r3
    17cc:	4b05      	ldr	r3, [pc, #20]	; (17e4 <set_int_priority+0x5c>)
    17ce:	4413      	add	r3, r2
    17d0:	683a      	ldr	r2, [r7, #0]
    17d2:	b2d2      	uxtb	r2, r2
    17d4:	0112      	lsls	r2, r2, #4
    17d6:	b2d2      	uxtb	r2, r2
    17d8:	701a      	strb	r2, [r3, #0]
	}
}
    17da:	370c      	adds	r7, #12
    17dc:	46bd      	mov	sp, r7
    17de:	f85d 7b04 	ldr.w	r7, [sp], #4
    17e2:	4770      	bx	lr
    17e4:	e000ed18 	.word	0xe000ed18

000017e8 <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    17e8:	b480      	push	{r7}
    17ea:	b083      	sub	sp, #12
    17ec:	af00      	add	r7, sp, #0
    17ee:	6078      	str	r0, [r7, #4]
    17f0:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    17f2:	687b      	ldr	r3, [r7, #4]
    17f4:	881b      	ldrh	r3, [r3, #0]
    17f6:	b29b      	uxth	r3, r3
    17f8:	f423 63e0 	bic.w	r3, r3, #1792	; 0x700
    17fc:	b29a      	uxth	r2, r3
    17fe:	687b      	ldr	r3, [r7, #4]
    1800:	801a      	strh	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    1802:	687b      	ldr	r3, [r7, #4]
    1804:	881b      	ldrh	r3, [r3, #0]
    1806:	b29a      	uxth	r2, r3
    1808:	683b      	ldr	r3, [r7, #0]
    180a:	b29b      	uxth	r3, r3
    180c:	00db      	lsls	r3, r3, #3
    180e:	b29b      	uxth	r3, r3
    1810:	4313      	orrs	r3, r2
    1812:	b29a      	uxth	r2, r3
    1814:	687b      	ldr	r3, [r7, #4]
    1816:	801a      	strh	r2, [r3, #0]
}
    1818:	370c      	adds	r7, #12
    181a:	46bd      	mov	sp, r7
    181c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1820:	4770      	bx	lr
    1822:	bf00      	nop

00001824 <spi_init>:


void spi_init(spi_sfr_t* channel, unsigned baud){
    1824:	b580      	push	{r7, lr}
    1826:	b082      	sub	sp, #8
    1828:	af00      	add	r7, sp, #0
    182a:	6078      	str	r0, [r7, #4]
    182c:	6039      	str	r1, [r7, #0]
	spi_baudrate(channel,baud);
    182e:	6878      	ldr	r0, [r7, #4]
    1830:	6839      	ldr	r1, [r7, #0]
    1832:	f7ff ffd9 	bl	17e8 <spi_baudrate>
	channel->CR1=SPI_CR1_MSTR|SPI_CR1_SSM;
    1836:	687b      	ldr	r3, [r7, #4]
    1838:	f44f 7201 	mov.w	r2, #516	; 0x204
    183c:	801a      	strh	r2, [r3, #0]
	//channel->CR2|=SPI_CR2_SSOE;
	if (channel==SPI1){
    183e:	687b      	ldr	r3, [r7, #4]
    1840:	4a17      	ldr	r2, [pc, #92]	; (18a0 <spi_init+0x7c>)
    1842:	4293      	cmp	r3, r2
    1844:	d114      	bne.n	1870 <spi_init+0x4c>
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(GPIOA,4,OUTPUT_PP_FAST);
    1846:	2000      	movs	r0, #0
    1848:	2104      	movs	r1, #4
    184a:	2203      	movs	r2, #3
    184c:	f7ff ff10 	bl	1670 <config_pin>
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(GPIOA,5,OUTPUT_PP_FAST);
    1850:	2000      	movs	r0, #0
    1852:	2105      	movs	r1, #5
    1854:	2203      	movs	r2, #3
    1856:	f7ff ff0b 	bl	1670 <config_pin>
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(GPIOA,6,INPUT_FLOAT);
    185a:	2000      	movs	r0, #0
    185c:	2106      	movs	r1, #6
    185e:	2204      	movs	r2, #4
    1860:	f7ff ff06 	bl	1670 <config_pin>
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(GPIOA,7,OUTPUT_PP_FAST);
    1864:	2000      	movs	r0, #0
    1866:	2107      	movs	r1, #7
    1868:	2203      	movs	r2, #3
    186a:	f7ff ff01 	bl	1670 <config_pin>
    186e:	e013      	b.n	1898 <spi_init+0x74>
	}else{
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(GPIOB,2,OUTPUT_PP_FAST);
    1870:	2001      	movs	r0, #1
    1872:	2102      	movs	r1, #2
    1874:	2203      	movs	r2, #3
    1876:	f7ff fefb 	bl	1670 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(GPIOB,13,OUTPUT_PP_FAST);
    187a:	2001      	movs	r0, #1
    187c:	210d      	movs	r1, #13
    187e:	2203      	movs	r2, #3
    1880:	f7ff fef6 	bl	1670 <config_pin>
		// PB14 MISO input (floating)
		config_pin(GPIOB,14,INPUT_FLOAT);
    1884:	2001      	movs	r0, #1
    1886:	210e      	movs	r1, #14
    1888:	2204      	movs	r2, #4
    188a:	f7ff fef1 	bl	1670 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(GPIOB,15,OUTPUT_PP_FAST);
    188e:	2001      	movs	r0, #1
    1890:	210f      	movs	r1, #15
    1892:	2203      	movs	r2, #3
    1894:	f7ff feec 	bl	1670 <config_pin>
	}
}
    1898:	3708      	adds	r7, #8
    189a:	46bd      	mov	sp, r7
    189c:	bd80      	pop	{r7, pc}
    189e:	bf00      	nop
    18a0:	40013000 	.word	0x40013000

000018a4 <spi_enable>:

void spi_enable(spi_sfr_t* channel, unsigned mode){
    18a4:	b480      	push	{r7}
    18a6:	b083      	sub	sp, #12
    18a8:	af00      	add	r7, sp, #0
    18aa:	6078      	str	r0, [r7, #4]
    18ac:	6039      	str	r1, [r7, #0]
	switch (mode){
    18ae:	683b      	ldr	r3, [r7, #0]
    18b0:	2b01      	cmp	r3, #1
    18b2:	d00d      	beq.n	18d0 <spi_enable+0x2c>
    18b4:	2b01      	cmp	r3, #1
    18b6:	d302      	bcc.n	18be <spi_enable+0x1a>
    18b8:	2b02      	cmp	r3, #2
    18ba:	d005      	beq.n	18c8 <spi_enable+0x24>
    18bc:	e00d      	b.n	18da <spi_enable+0x36>
		case SPI_MODE_READ:
		channel->CR1=SPI_CR1_RXONLY|SPI_CR1_SPE;
    18be:	687b      	ldr	r3, [r7, #4]
    18c0:	f44f 6288 	mov.w	r2, #1088	; 0x440
    18c4:	801a      	strh	r2, [r3, #0]
		break;
    18c6:	e008      	b.n	18da <spi_enable+0x36>
		case SPI_MODE_READ_WRITE:
		channel->CR1=SPI_CR1_SPE;
    18c8:	687b      	ldr	r3, [r7, #4]
    18ca:	2240      	movs	r2, #64	; 0x40
    18cc:	801a      	strh	r2, [r3, #0]
		break;
    18ce:	e004      	b.n	18da <spi_enable+0x36>
		case SPI_MODE_WRITE:
		channel->CR1=SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE|SPI_CR1_SPE;
    18d0:	687b      	ldr	r3, [r7, #4]
    18d2:	f24c 0240 	movw	r2, #49216	; 0xc040
    18d6:	801a      	strh	r2, [r3, #0]
		break;
    18d8:	bf00      	nop
	}
}
    18da:	370c      	adds	r7, #12
    18dc:	46bd      	mov	sp, r7
    18de:	f85d 7b04 	ldr.w	r7, [sp], #4
    18e2:	4770      	bx	lr

000018e4 <spi_disable>:

void spi_disable(spi_sfr_t* channel){
    18e4:	b480      	push	{r7}
    18e6:	b083      	sub	sp, #12
    18e8:	af00      	add	r7, sp, #0
    18ea:	6078      	str	r0, [r7, #4]
	channel->CR1&=~SPI_CR1_SPE;
    18ec:	687b      	ldr	r3, [r7, #4]
    18ee:	881b      	ldrh	r3, [r3, #0]
    18f0:	b29b      	uxth	r3, r3
    18f2:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    18f6:	b29a      	uxth	r2, r3
    18f8:	687b      	ldr	r3, [r7, #4]
    18fa:	801a      	strh	r2, [r3, #0]
}
    18fc:	370c      	adds	r7, #12
    18fe:	46bd      	mov	sp, r7
    1900:	f85d 7b04 	ldr.w	r7, [sp], #4
    1904:	4770      	bx	lr
    1906:	bf00      	nop

00001908 <spi_write>:

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
    1908:	b580      	push	{r7, lr}
    190a:	b082      	sub	sp, #8
    190c:	af00      	add	r7, sp, #0
    190e:	6078      	str	r0, [r7, #4]
    1910:	460b      	mov	r3, r1
    1912:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
    1914:	6878      	ldr	r0, [r7, #4]
    1916:	2101      	movs	r1, #1
    1918:	f7ff ffc4 	bl	18a4 <spi_enable>
	channel->DR=b;
    191c:	78fb      	ldrb	r3, [r7, #3]
    191e:	b29a      	uxth	r2, r3
    1920:	687b      	ldr	r3, [r7, #4]
    1922:	819a      	strh	r2, [r3, #12]
	spi_disable(channel);
    1924:	6878      	ldr	r0, [r7, #4]
    1926:	f7ff ffdd 	bl	18e4 <spi_disable>
}
    192a:	3708      	adds	r7, #8
    192c:	46bd      	mov	sp, r7
    192e:	bd80      	pop	{r7, pc}

00001930 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    1930:	b580      	push	{r7, lr}
    1932:	b084      	sub	sp, #16
    1934:	af00      	add	r7, sp, #0
    1936:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
    1938:	6878      	ldr	r0, [r7, #4]
    193a:	2100      	movs	r1, #0
    193c:	f7ff ffb2 	bl	18a4 <spi_enable>
	channel->DR=255;
    1940:	687b      	ldr	r3, [r7, #4]
    1942:	22ff      	movs	r2, #255	; 0xff
    1944:	819a      	strh	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    1946:	bf00      	nop
    1948:	687b      	ldr	r3, [r7, #4]
    194a:	891b      	ldrh	r3, [r3, #8]
    194c:	b29b      	uxth	r3, r3
    194e:	f003 0301 	and.w	r3, r3, #1
    1952:	2b00      	cmp	r3, #0
    1954:	d0f8      	beq.n	1948 <spi_read+0x18>
	rx=(uint8_t)channel->DR;
    1956:	687b      	ldr	r3, [r7, #4]
    1958:	899b      	ldrh	r3, [r3, #12]
    195a:	b29b      	uxth	r3, r3
    195c:	73fb      	strb	r3, [r7, #15]
	spi_disable(channel);
    195e:	6878      	ldr	r0, [r7, #4]
    1960:	f7ff ffc0 	bl	18e4 <spi_disable>
	return rx;
    1964:	7bfb      	ldrb	r3, [r7, #15]
}
    1966:	4618      	mov	r0, r3
    1968:	3710      	adds	r7, #16
    196a:	46bd      	mov	sp, r7
    196c:	bd80      	pop	{r7, pc}
    196e:	bf00      	nop

00001970 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    1970:	b580      	push	{r7, lr}
    1972:	b084      	sub	sp, #16
    1974:	af00      	add	r7, sp, #0
    1976:	60f8      	str	r0, [r7, #12]
    1978:	60b9      	str	r1, [r7, #8]
    197a:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_WRITE);
    197c:	68f8      	ldr	r0, [r7, #12]
    197e:	2101      	movs	r1, #1
    1980:	f7ff ff90 	bl	18a4 <spi_enable>
	while (count){
    1984:	e011      	b.n	19aa <spi_block_write+0x3a>
		channel->DR=*buffer++;
    1986:	68bb      	ldr	r3, [r7, #8]
    1988:	1c5a      	adds	r2, r3, #1
    198a:	60ba      	str	r2, [r7, #8]
    198c:	781b      	ldrb	r3, [r3, #0]
    198e:	b29a      	uxth	r2, r3
    1990:	68fb      	ldr	r3, [r7, #12]
    1992:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    1994:	bf00      	nop
    1996:	68fb      	ldr	r3, [r7, #12]
    1998:	891b      	ldrh	r3, [r3, #8]
    199a:	b29b      	uxth	r3, r3
    199c:	f003 0302 	and.w	r3, r3, #2
    19a0:	2b00      	cmp	r3, #0
    19a2:	d0f8      	beq.n	1996 <spi_block_write+0x26>
		count--;
    19a4:	687b      	ldr	r3, [r7, #4]
    19a6:	3b01      	subs	r3, #1
    19a8:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_enable(channel,SPI_MODE_WRITE);
	while (count){
    19aa:	687b      	ldr	r3, [r7, #4]
    19ac:	2b00      	cmp	r3, #0
    19ae:	d1ea      	bne.n	1986 <spi_block_write+0x16>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	spi_disable(channel);
    19b0:	68f8      	ldr	r0, [r7, #12]
    19b2:	f7ff ff97 	bl	18e4 <spi_disable>
}
    19b6:	3710      	adds	r7, #16
    19b8:	46bd      	mov	sp, r7
    19ba:	bd80      	pop	{r7, pc}

000019bc <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    19bc:	b580      	push	{r7, lr}
    19be:	b084      	sub	sp, #16
    19c0:	af00      	add	r7, sp, #0
    19c2:	60f8      	str	r0, [r7, #12]
    19c4:	60b9      	str	r1, [r7, #8]
    19c6:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_READ);
    19c8:	68f8      	ldr	r0, [r7, #12]
    19ca:	2100      	movs	r1, #0
    19cc:	f7ff ff6a 	bl	18a4 <spi_enable>
	while (count){
    19d0:	e015      	b.n	19fe <spi_block_read+0x42>
		channel->DR=0;
    19d2:	68fb      	ldr	r3, [r7, #12]
    19d4:	2200      	movs	r2, #0
    19d6:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    19d8:	bf00      	nop
    19da:	68fb      	ldr	r3, [r7, #12]
    19dc:	891b      	ldrh	r3, [r3, #8]
    19de:	b29b      	uxth	r3, r3
    19e0:	f003 0301 	and.w	r3, r3, #1
    19e4:	2b00      	cmp	r3, #0
    19e6:	d0f8      	beq.n	19da <spi_block_read+0x1e>
		*buffer++=(uint8_t)channel->DR;
    19e8:	68bb      	ldr	r3, [r7, #8]
    19ea:	1c5a      	adds	r2, r3, #1
    19ec:	60ba      	str	r2, [r7, #8]
    19ee:	68fa      	ldr	r2, [r7, #12]
    19f0:	8992      	ldrh	r2, [r2, #12]
    19f2:	b292      	uxth	r2, r2
    19f4:	b2d2      	uxtb	r2, r2
    19f6:	701a      	strb	r2, [r3, #0]
		count--;
    19f8:	687b      	ldr	r3, [r7, #4]
    19fa:	3b01      	subs	r3, #1
    19fc:	607b      	str	r3, [r7, #4]
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_enable(channel,SPI_MODE_READ);
	while (count){
    19fe:	687b      	ldr	r3, [r7, #4]
    1a00:	2b00      	cmp	r3, #0
    1a02:	d1e6      	bne.n	19d2 <spi_block_read+0x16>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
	spi_disable(channel);
    1a04:	68f8      	ldr	r0, [r7, #12]
    1a06:	f7ff ff6d 	bl	18e4 <spi_disable>
}
    1a0a:	3710      	adds	r7, #16
    1a0c:	46bd      	mov	sp, r7
    1a0e:	bd80      	pop	{r7, pc}

00001a10 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    1a10:	4b01      	ldr	r3, [pc, #4]	; (1a18 <reset_mcu+0x8>)
    1a12:	4a02      	ldr	r2, [pc, #8]	; (1a1c <reset_mcu+0xc>)
    1a14:	601a      	str	r2, [r3, #0]
    1a16:	bf00      	nop
    1a18:	e000ed0c 	.word	0xe000ed0c
    1a1c:	05fa0004 	.word	0x05fa0004

00001a20 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    1a20:	b580      	push	{r7, lr}
    1a22:	b082      	sub	sp, #8
    1a24:	af00      	add	r7, sp, #0
    1a26:	6078      	str	r0, [r7, #4]
    1a28:	6039      	str	r1, [r7, #0]
	print(msg);
    1a2a:	6878      	ldr	r0, [r7, #4]
    1a2c:	f7ff fb66 	bl	10fc <print>
	print("at address ");
    1a30:	4814      	ldr	r0, [pc, #80]	; (1a84 <print_fault+0x64>)
    1a32:	f7ff fb63 	bl	10fc <print>
	if (adr) {
    1a36:	683b      	ldr	r3, [r7, #0]
    1a38:	2b00      	cmp	r3, #0
    1a3a:	d002      	beq.n	1a42 <print_fault+0x22>
		print_hex(adr);
    1a3c:	6838      	ldr	r0, [r7, #0]
    1a3e:	f7ff fccb 	bl	13d8 <print_hex>
	};
	conout(CR);
    1a42:	200d      	movs	r0, #13
    1a44:	f7ff fb28 	bl	1098 <conout>
	print("UFSR=");
    1a48:	480f      	ldr	r0, [pc, #60]	; (1a88 <print_fault+0x68>)
    1a4a:	f7ff fb57 	bl	10fc <print>
	print_hex(CFSR->fsr.usageFalt);
    1a4e:	4b0f      	ldr	r3, [pc, #60]	; (1a8c <print_fault+0x6c>)
    1a50:	681b      	ldr	r3, [r3, #0]
    1a52:	0c1b      	lsrs	r3, r3, #16
    1a54:	b29b      	uxth	r3, r3
    1a56:	4618      	mov	r0, r3
    1a58:	f7ff fcbe 	bl	13d8 <print_hex>
	print(", BFSR=");
    1a5c:	480c      	ldr	r0, [pc, #48]	; (1a90 <print_fault+0x70>)
    1a5e:	f7ff fb4d 	bl	10fc <print>
	print_hex(CFSR->fsr.busFault);
    1a62:	4b0a      	ldr	r3, [pc, #40]	; (1a8c <print_fault+0x6c>)
    1a64:	681b      	ldr	r3, [r3, #0]
    1a66:	0a1b      	lsrs	r3, r3, #8
    1a68:	b2db      	uxtb	r3, r3
    1a6a:	4618      	mov	r0, r3
    1a6c:	f7ff fcb4 	bl	13d8 <print_hex>
	print(", MMFSR=");
    1a70:	4808      	ldr	r0, [pc, #32]	; (1a94 <print_fault+0x74>)
    1a72:	f7ff fb43 	bl	10fc <print>
	print_hex(CFSR->fsr.mmFault);
    1a76:	4b05      	ldr	r3, [pc, #20]	; (1a8c <print_fault+0x6c>)
    1a78:	681b      	ldr	r3, [r3, #0]
    1a7a:	b2db      	uxtb	r3, r3
    1a7c:	4618      	mov	r0, r3
    1a7e:	f7ff fcab 	bl	13d8 <print_hex>
	while(1);
    1a82:	e7fe      	b.n	1a82 <print_fault+0x62>
    1a84:	00002460 	.word	0x00002460
    1a88:	0000246c 	.word	0x0000246c
    1a8c:	e000ed28 	.word	0xe000ed28
    1a90:	00002474 	.word	0x00002474
    1a94:	0000247c 	.word	0x0000247c

00001a98 <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    1a98:	b480      	push	{r7}
    1a9a:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    1a9c:	2300      	movs	r3, #0
    1a9e:	2200      	movs	r2, #0
    1aa0:	4618      	mov	r0, r3
    1aa2:	4611      	mov	r1, r2
    1aa4:	df02      	svc	2
}
    1aa6:	46bd      	mov	sp, r7
    1aa8:	f85d 7b04 	ldr.w	r7, [sp], #4
    1aac:	4770      	bx	lr
    1aae:	bf00      	nop

00001ab0 <tvout_init>:
//volatile static uint8_t line_buffer[ROW_SIZE];

#define _enable_dma()  dma[DMACHAN].ccr|=DMA_CCR_EN
#define _disable_dma() dma[DMACHAN].ccr&=~DMA_CCR_EN
 
 void tvout_init(){
    1ab0:	b580      	push	{r7, lr}
    1ab2:	b082      	sub	sp, #8
    1ab4:	af00      	add	r7, sp, #0
	video_bb = (uint32_t*)(0x22000000+(((unsigned int)video_buffer&0x7ffff)<<5)); 
    1ab6:	4b51      	ldr	r3, [pc, #324]	; (1bfc <tvout_init+0x14c>)
    1ab8:	f3c3 0312 	ubfx	r3, r3, #0, #19
    1abc:	015b      	lsls	r3, r3, #5
    1abe:	f103 5308 	add.w	r3, r3, #570425344	; 0x22000000
    1ac2:	461a      	mov	r2, r3
    1ac4:	4b4e      	ldr	r3, [pc, #312]	; (1c00 <tvout_init+0x150>)
    1ac6:	601a      	str	r2, [r3, #0]
	//sortie sync sur PA8
	config_pin(GPIOA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    1ac8:	2000      	movs	r0, #0
    1aca:	2108      	movs	r1, #8
    1acc:	220a      	movs	r2, #10
    1ace:	f7ff fdcf 	bl	1670 <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(GPIOB,15,OUTPUT_ALT_PP_FAST);
    1ad2:	2001      	movs	r0, #1
    1ad4:	210f      	movs	r1, #15
    1ad6:	220b      	movs	r2, #11
    1ad8:	f7ff fdca 	bl	1670 <config_pin>
	PORTB->BRR=BIT15;
    1adc:	4b49      	ldr	r3, [pc, #292]	; (1c04 <tvout_init+0x154>)
    1ade:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    1ae2:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	APB2ENR->fld.tim1en=1;
    1ae4:	4b48      	ldr	r3, [pc, #288]	; (1c08 <tvout_init+0x158>)
    1ae6:	681a      	ldr	r2, [r3, #0]
    1ae8:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
    1aec:	601a      	str	r2, [r3, #0]
	// clock source division
	*TIMER1_PSC=0;
    1aee:	4b47      	ldr	r3, [pc, #284]	; (1c0c <tvout_init+0x15c>)
    1af0:	2200      	movs	r2, #0
    1af2:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    1af4:	4b46      	ldr	r3, [pc, #280]	; (1c10 <tvout_init+0x160>)
    1af6:	f640 72ff 	movw	r2, #4095	; 0xfff
    1afa:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    1afc:	4b45      	ldr	r3, [pc, #276]	; (1c14 <tvout_init+0x164>)
    1afe:	f240 122b 	movw	r2, #299	; 0x12b
    1b02:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    1b04:	4b44      	ldr	r3, [pc, #272]	; (1c18 <tvout_init+0x168>)
    1b06:	681a      	ldr	r2, [r3, #0]
    1b08:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    1b0c:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    1b10:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    1b12:	4b41      	ldr	r3, [pc, #260]	; (1c18 <tvout_init+0x168>)
    1b14:	681a      	ldr	r2, [r3, #0]
    1b16:	f042 0208 	orr.w	r2, r2, #8
    1b1a:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    1b1c:	4b3f      	ldr	r3, [pc, #252]	; (1c1c <tvout_init+0x16c>)
    1b1e:	681a      	ldr	r2, [r3, #0]
    1b20:	f042 0201 	orr.w	r2, r2, #1
    1b24:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    1b26:	4b3d      	ldr	r3, [pc, #244]	; (1c1c <tvout_init+0x16c>)
    1b28:	681a      	ldr	r2, [r3, #0]
    1b2a:	f042 0202 	orr.w	r2, r2, #2
    1b2e:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    1b30:	4a3b      	ldr	r2, [pc, #236]	; (1c20 <tvout_init+0x170>)
    1b32:	8813      	ldrh	r3, [r2, #0]
    1b34:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    1b38:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    1b3c:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    1b3e:	4b39      	ldr	r3, [pc, #228]	; (1c24 <tvout_init+0x174>)
    1b40:	681a      	ldr	r2, [r3, #0]
    1b42:	f042 0201 	orr.w	r2, r2, #1
    1b46:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    1b48:	4b37      	ldr	r3, [pc, #220]	; (1c28 <tvout_init+0x178>)
    1b4a:	f640 324c 	movw	r2, #2892	; 0xb4c
    1b4e:	801a      	strh	r2, [r3, #0]
	// configuration du canal dma
	
	dma[DMACHAN].ccr=DMA_CCR_DIR|DMA_CCR_CIRC|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    1b50:	4b36      	ldr	r3, [pc, #216]	; (1c2c <tvout_init+0x17c>)
    1b52:	681b      	ldr	r3, [r3, #0]
    1b54:	3364      	adds	r3, #100	; 0x64
    1b56:	f243 52b0 	movw	r2, #13744	; 0x35b0
    1b5a:	601a      	str	r2, [r3, #0]
	dma[DMACHAN].cndtr=ROW_SIZE;
    1b5c:	4b33      	ldr	r3, [pc, #204]	; (1c2c <tvout_init+0x17c>)
    1b5e:	681b      	ldr	r3, [r3, #0]
    1b60:	3364      	adds	r3, #100	; 0x64
    1b62:	2214      	movs	r2, #20
    1b64:	605a      	str	r2, [r3, #4]
	dma[DMACHAN].cpar=(uint32_t)SPI2_DR;
    1b66:	4b31      	ldr	r3, [pc, #196]	; (1c2c <tvout_init+0x17c>)
    1b68:	681b      	ldr	r3, [r3, #0]
    1b6a:	3364      	adds	r3, #100	; 0x64
    1b6c:	4a30      	ldr	r2, [pc, #192]	; (1c30 <tvout_init+0x180>)
    1b6e:	609a      	str	r2, [r3, #8]
	
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    1b70:	4b30      	ldr	r3, [pc, #192]	; (1c34 <tvout_init+0x184>)
    1b72:	681a      	ldr	r2, [r3, #0]
    1b74:	f042 0202 	orr.w	r2, r2, #2
    1b78:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,7);
    1b7a:	201b      	movs	r0, #27
    1b7c:	2107      	movs	r1, #7
    1b7e:	f7ff fe03 	bl	1788 <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    1b82:	201b      	movs	r0, #27
    1b84:	f7ff fdb8 	bl	16f8 <enable_interrupt>
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    1b88:	2300      	movs	r3, #0
    1b8a:	607b      	str	r3, [r7, #4]
    1b8c:	e011      	b.n	1bb2 <tvout_init+0x102>
		video_buffer[i]=0xffff;
    1b8e:	4a1b      	ldr	r2, [pc, #108]	; (1bfc <tvout_init+0x14c>)
    1b90:	687b      	ldr	r3, [r7, #4]
    1b92:	f64f 71ff 	movw	r1, #65535	; 0xffff
    1b96:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
    1b9a:	687b      	ldr	r3, [r7, #4]
    1b9c:	f503 5395 	add.w	r3, r3, #4768	; 0x12a0
    1ba0:	330c      	adds	r3, #12
    1ba2:	4a16      	ldr	r2, [pc, #88]	; (1bfc <tvout_init+0x14c>)
    1ba4:	f64f 71ff 	movw	r1, #65535	; 0xffff
    1ba8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,7);
	enable_interrupt(IRQ_TIM1_CC);
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    1bac:	687b      	ldr	r3, [r7, #4]
    1bae:	3301      	adds	r3, #1
    1bb0:	607b      	str	r3, [r7, #4]
    1bb2:	687b      	ldr	r3, [r7, #4]
    1bb4:	2b13      	cmp	r3, #19
    1bb6:	ddea      	ble.n	1b8e <tvout_init+0xde>
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    1bb8:	2301      	movs	r3, #1
    1bba:	607b      	str	r3, [r7, #4]
    1bbc:	e018      	b.n	1bf0 <tvout_init+0x140>
		video_buffer[i*ROW_SIZE]=0x8000;
    1bbe:	687a      	ldr	r2, [r7, #4]
    1bc0:	4613      	mov	r3, r2
    1bc2:	009b      	lsls	r3, r3, #2
    1bc4:	4413      	add	r3, r2
    1bc6:	009b      	lsls	r3, r3, #2
    1bc8:	461a      	mov	r2, r3
    1bca:	4b0c      	ldr	r3, [pc, #48]	; (1bfc <tvout_init+0x14c>)
    1bcc:	f44f 4100 	mov.w	r1, #32768	; 0x8000
    1bd0:	f823 1012 	strh.w	r1, [r3, r2, lsl #1]
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
    1bd4:	687b      	ldr	r3, [r7, #4]
    1bd6:	1c5a      	adds	r2, r3, #1
    1bd8:	4613      	mov	r3, r2
    1bda:	009b      	lsls	r3, r3, #2
    1bdc:	4413      	add	r3, r2
    1bde:	009b      	lsls	r3, r3, #2
    1be0:	3b01      	subs	r3, #1
    1be2:	4a06      	ldr	r2, [pc, #24]	; (1bfc <tvout_init+0x14c>)
    1be4:	2101      	movs	r1, #1
    1be6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i;
	for (i=0;i<ROW_SIZE;i++){
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    1bea:	687b      	ldr	r3, [r7, #4]
    1bec:	3301      	adds	r3, #1
    1bee:	607b      	str	r3, [r7, #4]
    1bf0:	687b      	ldr	r3, [r7, #4]
    1bf2:	2bed      	cmp	r3, #237	; 0xed
    1bf4:	dde3      	ble.n	1bbe <tvout_init+0x10e>
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	// test end
 }
    1bf6:	3708      	adds	r7, #8
    1bf8:	46bd      	mov	sp, r7
    1bfa:	bd80      	pop	{r7, pc}
    1bfc:	200000f0 	.word	0x200000f0
    1c00:	200000ec 	.word	0x200000ec
    1c04:	40010c00 	.word	0x40010c00
    1c08:	40021018 	.word	0x40021018
    1c0c:	40012c28 	.word	0x40012c28
    1c10:	40012c2c 	.word	0x40012c2c
    1c14:	40012c34 	.word	0x40012c34
    1c18:	40012c18 	.word	0x40012c18
    1c1c:	40012c20 	.word	0x40012c20
    1c20:	40012c44 	.word	0x40012c44
    1c24:	40012c00 	.word	0x40012c00
    1c28:	40003800 	.word	0x40003800
    1c2c:	20000004 	.word	0x20000004
    1c30:	4000380c 	.word	0x4000380c
    1c34:	40012c0c 	.word	0x40012c0c

00001c38 <TIM1_CC_handler>:
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
    
	//_disable_spi();
	line_count++;
    1c38:	4a46      	ldr	r2, [pc, #280]	; (1d54 <TIM1_CC_handler+0x11c>)
	TIMER1_SR->fld.cc1if=0;
    1c3a:	4947      	ldr	r1, [pc, #284]	; (1d58 <TIM1_CC_handler+0x120>)
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
    
	//_disable_spi();
	line_count++;
    1c3c:	6813      	ldr	r3, [r2, #0]
    1c3e:	3301      	adds	r3, #1
    1c40:	6013      	str	r3, [r2, #0]
	TIMER1_SR->fld.cc1if=0;
    1c42:	680b      	ldr	r3, [r1, #0]
    1c44:	f023 0302 	bic.w	r3, r3, #2
    1c48:	600b      	str	r3, [r1, #0]
	switch(line_count){
    1c4a:	6813      	ldr	r3, [r2, #0]
    1c4c:	2b12      	cmp	r3, #18
    1c4e:	d034      	beq.n	1cba <TIM1_CC_handler+0x82>
    1c50:	4611      	mov	r1, r2
    1c52:	dc13      	bgt.n	1c7c <TIM1_CC_handler+0x44>
    1c54:	2b06      	cmp	r3, #6
    1c56:	d025      	beq.n	1ca4 <TIM1_CC_handler+0x6c>
    1c58:	dc0b      	bgt.n	1c72 <TIM1_CC_handler+0x3a>
    1c5a:	2b00      	cmp	r3, #0
    1c5c:	d151      	bne.n	1d02 <TIM1_CC_handler+0xca>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    1c5e:	4a3f      	ldr	r2, [pc, #252]	; (1d5c <TIM1_CC_handler+0x124>)
    1c60:	8813      	ldrh	r3, [r2, #0]
    1c62:	f3c3 034e 	ubfx	r3, r3, #1, #15
    1c66:	8013      	strh	r3, [r2, #0]
		*TIMER1_CCR1/=2;
    1c68:	8913      	ldrh	r3, [r2, #8]
    1c6a:	f3c3 034e 	ubfx	r3, r3, #1, #15
    1c6e:	8113      	strh	r3, [r2, #8]
		break;
    1c70:	e017      	b.n	1ca2 <TIM1_CC_handler+0x6a>
	uint16_t* line_adr;
    
	//_disable_spi();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    1c72:	2b0c      	cmp	r3, #12
    1c74:	d01b      	beq.n	1cae <TIM1_CC_handler+0x76>
    1c76:	2b11      	cmp	r3, #17
    1c78:	d010      	beq.n	1c9c <TIM1_CC_handler+0x64>
    1c7a:	e042      	b.n	1d02 <TIM1_CC_handler+0xca>
    1c7c:	f5b3 7f96 	cmp.w	r3, #300	; 0x12c
    1c80:	d027      	beq.n	1cd2 <TIM1_CC_handler+0x9a>
    1c82:	dc03      	bgt.n	1c8c <TIM1_CC_handler+0x54>
    1c84:	2b3b      	cmp	r3, #59	; 0x3b
    1c86:	d13c      	bne.n	1d02 <TIM1_CC_handler+0xca>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    1c88:	2201      	movs	r2, #1
    1c8a:	e023      	b.n	1cd4 <TIM1_CC_handler+0x9c>
	uint16_t* line_adr;
    
	//_disable_spi();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    1c8c:	f240 1041 	movw	r0, #321	; 0x141
    1c90:	4283      	cmp	r3, r0
    1c92:	d021      	beq.n	1cd8 <TIM1_CC_handler+0xa0>
    1c94:	f5b3 7fa1 	cmp.w	r3, #322	; 0x142
    1c98:	d023      	beq.n	1ce2 <TIM1_CC_handler+0xaa>
    1c9a:	e032      	b.n	1d02 <TIM1_CC_handler+0xca>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
		break;
	case 17: // fin sync champ paire
		if (even){
    1c9c:	4b30      	ldr	r3, [pc, #192]	; (1d60 <TIM1_CC_handler+0x128>)
    1c9e:	681b      	ldr	r3, [r3, #0]
    1ca0:	b97b      	cbnz	r3, 1cc2 <TIM1_CC_handler+0x8a>
    1ca2:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    1ca4:	f240 7269 	movw	r2, #1897	; 0x769
    1ca8:	4b2e      	ldr	r3, [pc, #184]	; (1d64 <TIM1_CC_handler+0x12c>)
    1caa:	801a      	strh	r2, [r3, #0]
	    break;
    1cac:	4770      	bx	lr
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    1cae:	f240 72ff 	movw	r2, #2047	; 0x7ff
    1cb2:	4b2a      	ldr	r3, [pc, #168]	; (1d5c <TIM1_CC_handler+0x124>)
    1cb4:	801a      	strh	r2, [r3, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    1cb6:	2295      	movs	r2, #149	; 0x95
    1cb8:	e009      	b.n	1cce <TIM1_CC_handler+0x96>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
    1cba:	4b29      	ldr	r3, [pc, #164]	; (1d60 <TIM1_CC_handler+0x128>)
    1cbc:	681b      	ldr	r3, [r3, #0]
    1cbe:	2b00      	cmp	r3, #0
    1cc0:	d1ef      	bne.n	1ca2 <TIM1_CC_handler+0x6a>
			*TIMER1_ARR=(FCLK/HFREQ-1);
    1cc2:	f640 72ff 	movw	r2, #4095	; 0xfff
    1cc6:	4b25      	ldr	r3, [pc, #148]	; (1d5c <TIM1_CC_handler+0x124>)
    1cc8:	801a      	strh	r2, [r3, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    1cca:	f240 122b 	movw	r2, #299	; 0x12b
    1cce:	811a      	strh	r2, [r3, #8]
    1cd0:	4770      	bx	lr
	case TOP_LINE-1:
		video=1;
		//_enable_dma();
		break;
	case (TOP_LINE+VRES):
		video=0;
    1cd2:	2200      	movs	r2, #0
    1cd4:	4b24      	ldr	r3, [pc, #144]	; (1d68 <TIM1_CC_handler+0x130>)
    1cd6:	e012      	b.n	1cfe <TIM1_CC_handler+0xc6>
		//_disable_dma();
		break;
	case FIELD_END:
		if (!even){
    1cd8:	4b21      	ldr	r3, [pc, #132]	; (1d60 <TIM1_CC_handler+0x128>)
    1cda:	6819      	ldr	r1, [r3, #0]
    1cdc:	2900      	cmp	r1, #0
    1cde:	d1e0      	bne.n	1ca2 <TIM1_CC_handler+0x6a>
    1ce0:	e008      	b.n	1cf4 <TIM1_CC_handler+0xbc>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    1ce2:	4b1f      	ldr	r3, [pc, #124]	; (1d60 <TIM1_CC_handler+0x128>)
    1ce4:	6819      	ldr	r1, [r3, #0]
    1ce6:	2900      	cmp	r1, #0
    1ce8:	d0db      	beq.n	1ca2 <TIM1_CC_handler+0x6a>
			*TIMER1_ARR/=2;
    1cea:	481c      	ldr	r0, [pc, #112]	; (1d5c <TIM1_CC_handler+0x124>)
    1cec:	8801      	ldrh	r1, [r0, #0]
    1cee:	f3c1 014e 	ubfx	r1, r1, #1, #15
    1cf2:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    1cf4:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    1cf8:	6011      	str	r1, [r2, #0]
			even=-even;
    1cfa:	681a      	ldr	r2, [r3, #0]
    1cfc:	4252      	negs	r2, r2
    1cfe:	601a      	str	r2, [r3, #0]
    1d00:	4770      	bx	lr
		}
	    break;
	default: 
		if (video){
    1d02:	4b19      	ldr	r3, [pc, #100]	; (1d68 <TIM1_CC_handler+0x130>)
    1d04:	681b      	ldr	r3, [r3, #0]
    1d06:	2b00      	cmp	r3, #0
    1d08:	d0cb      	beq.n	1ca2 <TIM1_CC_handler+0x6a>
			line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    1d0a:	680a      	ldr	r2, [r1, #0]
    1d0c:	2328      	movs	r3, #40	; 0x28
    1d0e:	3a3c      	subs	r2, #60	; 0x3c
    1d10:	fb03 f102 	mul.w	r1, r3, r2
			//dma[DMACHAN].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    1d14:	f240 424b 	movw	r2, #1099	; 0x44b
    1d18:	4814      	ldr	r0, [pc, #80]	; (1d6c <TIM1_CC_handler+0x134>)
    1d1a:	8803      	ldrh	r3, [r0, #0]
    1d1c:	b29b      	uxth	r3, r3
    1d1e:	4293      	cmp	r3, r2
    1d20:	d800      	bhi.n	1d24 <TIM1_CC_handler+0xec>
    1d22:	e7fa      	b.n	1d1a <TIM1_CC_handler+0xe2>
			//dma[DMACHAN].ccr|=BIT0;
			
			for (i=0;i<(ROW_SIZE);i++){
				while (!(SPI2->SR&SPI_SR_TXE));
    1d24:	4812      	ldr	r0, [pc, #72]	; (1d70 <TIM1_CC_handler+0x138>)
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
__attribute__((optimize("-Os"))) void TIM1_CC_handler(){
    1d26:	b510      	push	{r4, lr}
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
			//dma[DMACHAN].ccr|=BIT0;
			
			for (i=0;i<(ROW_SIZE);i++){
				while (!(SPI2->SR&SPI_SR_TXE));
    1d28:	4604      	mov	r4, r0
    1d2a:	4a12      	ldr	r2, [pc, #72]	; (1d74 <TIM1_CC_handler+0x13c>)
    1d2c:	2300      	movs	r3, #0
    1d2e:	440a      	add	r2, r1
    1d30:	8901      	ldrh	r1, [r0, #8]
    1d32:	0789      	lsls	r1, r1, #30
    1d34:	d5fc      	bpl.n	1d30 <TIM1_CC_handler+0xf8>
				SPI2->DR=line_adr[i];
    1d36:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
			//dma[DMACHAN].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
			//dma[DMACHAN].ccr|=BIT0;
			
			for (i=0;i<(ROW_SIZE);i++){
    1d3a:	3301      	adds	r3, #1
    1d3c:	2b14      	cmp	r3, #20
				while (!(SPI2->SR&SPI_SR_TXE));
				SPI2->DR=line_adr[i];
    1d3e:	81a1      	strh	r1, [r4, #12]
			//dma[DMACHAN].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
			//dma[DMACHAN].ccr|=BIT0;
			
			for (i=0;i<(ROW_SIZE);i++){
    1d40:	d1f6      	bne.n	1d30 <TIM1_CC_handler+0xf8>
				while (!(SPI2->SR&SPI_SR_TXE));
				SPI2->DR=line_adr[i];
			}
			while (!(SPI2->SR&SPI_SR_TXE));
    1d42:	4a0b      	ldr	r2, [pc, #44]	; (1d70 <TIM1_CC_handler+0x138>)
    1d44:	8913      	ldrh	r3, [r2, #8]
    1d46:	079b      	lsls	r3, r3, #30
    1d48:	d5fc      	bpl.n	1d44 <TIM1_CC_handler+0x10c>
			SPI2->DR=0;
    1d4a:	4b09      	ldr	r3, [pc, #36]	; (1d70 <TIM1_CC_handler+0x138>)
    1d4c:	2200      	movs	r2, #0
    1d4e:	819a      	strh	r2, [r3, #12]
    1d50:	bd10      	pop	{r4, pc}
    1d52:	bf00      	nop
    1d54:	20000008 	.word	0x20000008
    1d58:	40012c10 	.word	0x40012c10
    1d5c:	40012c2c 	.word	0x40012c2c
    1d60:	200000e4 	.word	0x200000e4
    1d64:	40012c34 	.word	0x40012c34
    1d68:	200000e0 	.word	0x200000e0
    1d6c:	40012c24 	.word	0x40012c24
    1d70:	40003800 	.word	0x40003800
    1d74:	200000f0 	.word	0x200000f0

00001d78 <uart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
    1d78:	b480      	push	{r7}
    1d7a:	b085      	sub	sp, #20
    1d7c:	af00      	add	r7, sp, #0
    1d7e:	6078      	str	r0, [r7, #4]
    1d80:	6039      	str	r1, [r7, #0]
	sfrp_t brr;
	uint32_t rate;

    brr=(sfrp_t)(channel+USART_BRR_OFS);		
    1d82:	687b      	ldr	r3, [r7, #4]
    1d84:	3308      	adds	r3, #8
    1d86:	60bb      	str	r3, [r7, #8]
	switch (channel){
    1d88:	687b      	ldr	r3, [r7, #4]
    1d8a:	4a1a      	ldr	r2, [pc, #104]	; (1df4 <uart_set_baud+0x7c>)
    1d8c:	4293      	cmp	r3, r2
    1d8e:	d019      	beq.n	1dc4 <uart_set_baud+0x4c>
    1d90:	4a19      	ldr	r2, [pc, #100]	; (1df8 <uart_set_baud+0x80>)
    1d92:	4293      	cmp	r3, r2
    1d94:	d003      	beq.n	1d9e <uart_set_baud+0x26>
    1d96:	4a19      	ldr	r2, [pc, #100]	; (1dfc <uart_set_baud+0x84>)
    1d98:	4293      	cmp	r3, r2
    1d9a:	d013      	beq.n	1dc4 <uart_set_baud+0x4c>
    1d9c:	e021      	b.n	1de2 <uart_set_baud+0x6a>
	case USART1:
		rate=(FAPB2/baud/16)<<4;
    1d9e:	4a18      	ldr	r2, [pc, #96]	; (1e00 <uart_set_baud+0x88>)
    1da0:	683b      	ldr	r3, [r7, #0]
    1da2:	fbb2 f3f3 	udiv	r3, r2, r3
    1da6:	011b      	lsls	r3, r3, #4
    1da8:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    1daa:	4a16      	ldr	r2, [pc, #88]	; (1e04 <uart_set_baud+0x8c>)
    1dac:	683b      	ldr	r3, [r7, #0]
    1dae:	fbb2 f3f3 	udiv	r3, r2, r3
    1db2:	f003 030f 	and.w	r3, r3, #15
    1db6:	68fa      	ldr	r2, [r7, #12]
    1db8:	4313      	orrs	r3, r2
    1dba:	60fb      	str	r3, [r7, #12]
		*brr=rate;
    1dbc:	68bb      	ldr	r3, [r7, #8]
    1dbe:	68fa      	ldr	r2, [r7, #12]
    1dc0:	601a      	str	r2, [r3, #0]
		return;
    1dc2:	e011      	b.n	1de8 <uart_set_baud+0x70>
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
    1dc4:	4a10      	ldr	r2, [pc, #64]	; (1e08 <uart_set_baud+0x90>)
    1dc6:	683b      	ldr	r3, [r7, #0]
    1dc8:	fbb2 f3f3 	udiv	r3, r2, r3
    1dcc:	011b      	lsls	r3, r3, #4
    1dce:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    1dd0:	4a0e      	ldr	r2, [pc, #56]	; (1e0c <uart_set_baud+0x94>)
    1dd2:	683b      	ldr	r3, [r7, #0]
    1dd4:	fbb2 f3f3 	udiv	r3, r2, r3
    1dd8:	f003 030f 	and.w	r3, r3, #15
    1ddc:	68fa      	ldr	r2, [r7, #12]
    1dde:	4313      	orrs	r3, r2
    1de0:	60fb      	str	r3, [r7, #12]
	}
	*brr=rate;
    1de2:	68bb      	ldr	r3, [r7, #8]
    1de4:	68fa      	ldr	r2, [r7, #12]
    1de6:	601a      	str	r2, [r3, #0]
}
    1de8:	3714      	adds	r7, #20
    1dea:	46bd      	mov	sp, r7
    1dec:	f85d 7b04 	ldr.w	r7, [sp], #4
    1df0:	4770      	bx	lr
    1df2:	bf00      	nop
    1df4:	40004800 	.word	0x40004800
    1df8:	40013800 	.word	0x40013800
    1dfc:	40004400 	.word	0x40004400
    1e00:	003d0900 	.word	0x003d0900
    1e04:	03d09000 	.word	0x03d09000
    1e08:	001e8480 	.word	0x001e8480
    1e0c:	01e84800 	.word	0x01e84800

00001e10 <uart_open_channel>:

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl){
    1e10:	b580      	push	{r7, lr}
    1e12:	b086      	sub	sp, #24
    1e14:	af00      	add	r7, sp, #0
    1e16:	60f8      	str	r0, [r7, #12]
    1e18:	60b9      	str	r1, [r7, #8]
    1e1a:	607a      	str	r2, [r7, #4]
	sfrp_t cr1, cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
    1e1c:	68fb      	ldr	r3, [r7, #12]
    1e1e:	4a40      	ldr	r2, [pc, #256]	; (1f20 <uart_open_channel+0x110>)
    1e20:	4293      	cmp	r3, r2
    1e22:	d044      	beq.n	1eae <uart_open_channel+0x9e>
    1e24:	4a3f      	ldr	r2, [pc, #252]	; (1f24 <uart_open_channel+0x114>)
    1e26:	4293      	cmp	r3, r2
    1e28:	d003      	beq.n	1e32 <uart_open_channel+0x22>
    1e2a:	4a3f      	ldr	r2, [pc, #252]	; (1f28 <uart_open_channel+0x118>)
    1e2c:	4293      	cmp	r3, r2
    1e2e:	d020      	beq.n	1e72 <uart_open_channel+0x62>
    1e30:	e05b      	b.n	1eea <uart_open_channel+0xda>
	case USART1:
		APB2ENR->apb2enr|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
    1e32:	4a3e      	ldr	r2, [pc, #248]	; (1f2c <uart_open_channel+0x11c>)
    1e34:	4b3d      	ldr	r3, [pc, #244]	; (1f2c <uart_open_channel+0x11c>)
    1e36:	681b      	ldr	r3, [r3, #0]
    1e38:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    1e3c:	f043 0304 	orr.w	r3, r3, #4
    1e40:	6013      	str	r3, [r2, #0]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    1e42:	4a3b      	ldr	r2, [pc, #236]	; (1f30 <uart_open_channel+0x120>)
    1e44:	4b3a      	ldr	r3, [pc, #232]	; (1f30 <uart_open_channel+0x120>)
    1e46:	681b      	ldr	r3, [r3, #0]
    1e48:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    1e4c:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    1e50:	6013      	str	r3, [r2, #0]
		GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    1e52:	4a37      	ldr	r2, [pc, #220]	; (1f30 <uart_open_channel+0x120>)
    1e54:	4b36      	ldr	r3, [pc, #216]	; (1f30 <uart_open_channel+0x120>)
    1e56:	681b      	ldr	r3, [r3, #0]
    1e58:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    1e5c:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    1e60:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART1,7);
    1e62:	2025      	movs	r0, #37	; 0x25
    1e64:	2107      	movs	r1, #7
    1e66:	f7ff fc8f 	bl	1788 <set_int_priority>
		enable_interrupt(USART1_IRQ);
    1e6a:	2025      	movs	r0, #37	; 0x25
    1e6c:	f7ff fc44 	bl	16f8 <enable_interrupt>
		break;
    1e70:	e03b      	b.n	1eea <uart_open_channel+0xda>
	case USART2:
		APB1ENR->fld.usart2en=1;
    1e72:	4b30      	ldr	r3, [pc, #192]	; (1f34 <uart_open_channel+0x124>)
    1e74:	681a      	ldr	r2, [r3, #0]
    1e76:	f442 3200 	orr.w	r2, r2, #131072	; 0x20000
    1e7a:	601a      	str	r2, [r3, #0]
		APB2ENR->fld.iopaen=1;
    1e7c:	4b2b      	ldr	r3, [pc, #172]	; (1f2c <uart_open_channel+0x11c>)
    1e7e:	681a      	ldr	r2, [r3, #0]
    1e80:	f042 0204 	orr.w	r2, r2, #4
    1e84:	601a      	str	r2, [r3, #0]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    1e86:	4a2c      	ldr	r2, [pc, #176]	; (1f38 <uart_open_channel+0x128>)
    1e88:	4b2b      	ldr	r3, [pc, #172]	; (1f38 <uart_open_channel+0x128>)
    1e8a:	681b      	ldr	r3, [r3, #0]
    1e8c:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    1e90:	6013      	str	r3, [r2, #0]
		GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    1e92:	4a29      	ldr	r2, [pc, #164]	; (1f38 <uart_open_channel+0x128>)
    1e94:	4b28      	ldr	r3, [pc, #160]	; (1f38 <uart_open_channel+0x128>)
    1e96:	681b      	ldr	r3, [r3, #0]
    1e98:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    1e9c:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART2,7);
    1e9e:	2026      	movs	r0, #38	; 0x26
    1ea0:	2107      	movs	r1, #7
    1ea2:	f7ff fc71 	bl	1788 <set_int_priority>
		enable_interrupt(USART2_IRQ);
    1ea6:	2026      	movs	r0, #38	; 0x26
    1ea8:	f7ff fc26 	bl	16f8 <enable_interrupt>
		break;
    1eac:	e01d      	b.n	1eea <uart_open_channel+0xda>
	case USART3:
		APB1ENR->fld.usart3en=1;
    1eae:	4b21      	ldr	r3, [pc, #132]	; (1f34 <uart_open_channel+0x124>)
    1eb0:	681a      	ldr	r2, [r3, #0]
    1eb2:	f442 2280 	orr.w	r2, r2, #262144	; 0x40000
    1eb6:	601a      	str	r2, [r3, #0]
		APB2ENR->fld.iopben=1;
    1eb8:	4b1c      	ldr	r3, [pc, #112]	; (1f2c <uart_open_channel+0x11c>)
    1eba:	681a      	ldr	r2, [r3, #0]
    1ebc:	f042 0208 	orr.w	r2, r2, #8
    1ec0:	601a      	str	r2, [r3, #0]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    1ec2:	4a1e      	ldr	r2, [pc, #120]	; (1f3c <uart_open_channel+0x12c>)
    1ec4:	4b1d      	ldr	r3, [pc, #116]	; (1f3c <uart_open_channel+0x12c>)
    1ec6:	681b      	ldr	r3, [r3, #0]
    1ec8:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    1ecc:	6013      	str	r3, [r2, #0]
		GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    1ece:	4a1b      	ldr	r2, [pc, #108]	; (1f3c <uart_open_channel+0x12c>)
    1ed0:	4b1a      	ldr	r3, [pc, #104]	; (1f3c <uart_open_channel+0x12c>)
    1ed2:	681b      	ldr	r3, [r3, #0]
    1ed4:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    1ed8:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART3,7);
    1eda:	2027      	movs	r0, #39	; 0x27
    1edc:	2107      	movs	r1, #7
    1ede:	f7ff fc53 	bl	1788 <set_int_priority>
		enable_interrupt(USART3_IRQ);
    1ee2:	2027      	movs	r0, #39	; 0x27
    1ee4:	f7ff fc08 	bl	16f8 <enable_interrupt>
		break;
    1ee8:	bf00      	nop
	}
	uart_set_baud(channel,baud);
    1eea:	68f8      	ldr	r0, [r7, #12]
    1eec:	68b9      	ldr	r1, [r7, #8]
    1eee:	f7ff ff43 	bl	1d78 <uart_set_baud>
	if (flow_ctrl==FLOW_HARD){
    1ef2:	687b      	ldr	r3, [r7, #4]
    1ef4:	2b01      	cmp	r3, #1
    1ef6:	d106      	bne.n	1f06 <uart_open_channel+0xf6>
		cr3=(sfrp_t)(channel+USART_CR3_OFS);
    1ef8:	68fb      	ldr	r3, [r7, #12]
    1efa:	3314      	adds	r3, #20
    1efc:	617b      	str	r3, [r7, #20]
		*cr3=(1<<USART_CR3_CTSE)|(1<<USART_CR3_RTSE);
    1efe:	697b      	ldr	r3, [r7, #20]
    1f00:	f44f 7240 	mov.w	r2, #768	; 0x300
    1f04:	601a      	str	r2, [r3, #0]
	}
	cr1=(sfrp_t)(channel+USART_CR1_OFS);
    1f06:	68fb      	ldr	r3, [r7, #12]
    1f08:	330c      	adds	r3, #12
    1f0a:	613b      	str	r3, [r7, #16]
	uart_getc(channel);
    1f0c:	68f8      	ldr	r0, [r7, #12]
    1f0e:	f000 f82d 	bl	1f6c <uart_getc>
	*cr1=(1<<USART_CR1_UE)|(1<<USART_CR1_TE)|(1<<USART_CR1_RE)|(1<<USART_CR1_RXNEIE);
    1f12:	693b      	ldr	r3, [r7, #16]
    1f14:	f242 022c 	movw	r2, #8236	; 0x202c
    1f18:	601a      	str	r2, [r3, #0]
}
    1f1a:	3718      	adds	r7, #24
    1f1c:	46bd      	mov	sp, r7
    1f1e:	bd80      	pop	{r7, pc}
    1f20:	40004800 	.word	0x40004800
    1f24:	40013800 	.word	0x40013800
    1f28:	40004400 	.word	0x40004400
    1f2c:	40021018 	.word	0x40021018
    1f30:	40010804 	.word	0x40010804
    1f34:	4002101c 	.word	0x4002101c
    1f38:	40010800 	.word	0x40010800
    1f3c:	40010c04 	.word	0x40010c04

00001f40 <uart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int uart_stat(unsigned channel){
    1f40:	b480      	push	{r7}
    1f42:	b085      	sub	sp, #20
    1f44:	af00      	add	r7, sp, #0
    1f46:	6078      	str	r0, [r7, #4]
	sfrp_t sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    1f48:	687b      	ldr	r3, [r7, #4]
    1f4a:	60fb      	str	r3, [r7, #12]
	return *sr&(1<<USART_SR_RXNE)?-1:0;
    1f4c:	68fb      	ldr	r3, [r7, #12]
    1f4e:	681b      	ldr	r3, [r3, #0]
    1f50:	f003 0320 	and.w	r3, r3, #32
    1f54:	2b00      	cmp	r3, #0
    1f56:	d002      	beq.n	1f5e <uart_stat+0x1e>
    1f58:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1f5c:	e000      	b.n	1f60 <uart_stat+0x20>
    1f5e:	2300      	movs	r3, #0
}
    1f60:	4618      	mov	r0, r3
    1f62:	3714      	adds	r7, #20
    1f64:	46bd      	mov	sp, r7
    1f66:	f85d 7b04 	ldr.w	r7, [sp], #4
    1f6a:	4770      	bx	lr

00001f6c <uart_getc>:

// reçoit un caractère de la console
char uart_getc(unsigned channel){
    1f6c:	b480      	push	{r7}
    1f6e:	b085      	sub	sp, #20
    1f70:	af00      	add	r7, sp, #0
    1f72:	6078      	str	r0, [r7, #4]
	sfrp_t dr;
	
	dr=(sfrp_t)(channel+USART_DR_OFS);
    1f74:	687b      	ldr	r3, [r7, #4]
    1f76:	3304      	adds	r3, #4
    1f78:	60fb      	str	r3, [r7, #12]
	return *dr&0x7f;
    1f7a:	68fb      	ldr	r3, [r7, #12]
    1f7c:	681b      	ldr	r3, [r3, #0]
    1f7e:	b2db      	uxtb	r3, r3
    1f80:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    1f84:	b2db      	uxtb	r3, r3
}
    1f86:	4618      	mov	r0, r3
    1f88:	3714      	adds	r7, #20
    1f8a:	46bd      	mov	sp, r7
    1f8c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1f90:	4770      	bx	lr
    1f92:	bf00      	nop

00001f94 <uart_putc>:

// transmet un caractère à la console
void uart_putc(unsigned channel, char c){
    1f94:	b480      	push	{r7}
    1f96:	b085      	sub	sp, #20
    1f98:	af00      	add	r7, sp, #0
    1f9a:	6078      	str	r0, [r7, #4]
    1f9c:	460b      	mov	r3, r1
    1f9e:	70fb      	strb	r3, [r7, #3]
	sfrp_t dr, sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    1fa0:	687b      	ldr	r3, [r7, #4]
    1fa2:	60fb      	str	r3, [r7, #12]
	dr=(sfrp_t)(channel+USART_DR_OFS);
    1fa4:	687b      	ldr	r3, [r7, #4]
    1fa6:	3304      	adds	r3, #4
    1fa8:	60bb      	str	r3, [r7, #8]
	//attend que dr soit vide
	while (!(*sr&(1<<USART_SR_TXE)));
    1faa:	bf00      	nop
    1fac:	68fb      	ldr	r3, [r7, #12]
    1fae:	681b      	ldr	r3, [r3, #0]
    1fb0:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1fb4:	2b00      	cmp	r3, #0
    1fb6:	d0f9      	beq.n	1fac <uart_putc+0x18>
	*dr=c&0x7f;
    1fb8:	78fb      	ldrb	r3, [r7, #3]
    1fba:	f003 027f 	and.w	r2, r3, #127	; 0x7f
    1fbe:	68bb      	ldr	r3, [r7, #8]
    1fc0:	601a      	str	r2, [r3, #0]
}
    1fc2:	3714      	adds	r7, #20
    1fc4:	46bd      	mov	sp, r7
    1fc6:	f85d 7b04 	ldr.w	r7, [sp], #4
    1fca:	4770      	bx	lr

Disassembly of section .user_code:

00002800 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    2800:	b480      	push	{r7}
    2802:	b085      	sub	sp, #20
    2804:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    2806:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    280a:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    280c:	2300      	movs	r3, #0
    280e:	71fb      	strb	r3, [r7, #7]
	
	
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    2810:	2300      	movs	r3, #0
    2812:	2200      	movs	r2, #0
    2814:	4618      	mov	r0, r3
    2816:	4611      	mov	r1, r2
    2818:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    281a:	f107 030c 	add.w	r3, r7, #12
    281e:	2200      	movs	r2, #0
    2820:	4618      	mov	r0, r3
    2822:	4611      	mov	r1, r2
    2824:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    2826:	f107 0308 	add.w	r3, r7, #8
    282a:	2200      	movs	r2, #0
    282c:	4618      	mov	r0, r3
    282e:	4611      	mov	r1, r2
    2830:	df04      	svc	4
    2832:	68bb      	ldr	r3, [r7, #8]
    2834:	2b00      	cmp	r3, #0
    2836:	d1f6      	bne.n	2826 <blink+0x26>
		_svc_call(SVC_LED_ON,NUL,NUL);
    2838:	2300      	movs	r3, #0
    283a:	2200      	movs	r2, #0
    283c:	4618      	mov	r0, r3
    283e:	4611      	mov	r1, r2
    2840:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    2842:	f107 030c 	add.w	r3, r7, #12
    2846:	2200      	movs	r2, #0
    2848:	4618      	mov	r0, r3
    284a:	4611      	mov	r1, r2
    284c:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    284e:	f107 0308 	add.w	r3, r7, #8
    2852:	2200      	movs	r2, #0
    2854:	4618      	mov	r0, r3
    2856:	4611      	mov	r1, r2
    2858:	df04      	svc	4
    285a:	68bb      	ldr	r3, [r7, #8]
    285c:	2b00      	cmp	r3, #0
    285e:	d1f6      	bne.n	284e <blink+0x4e>
		_svc_call(SVC_CONIN,&c,NUL);
    2860:	1dfb      	adds	r3, r7, #7
    2862:	2200      	movs	r2, #0
    2864:	4618      	mov	r0, r3
    2866:	4611      	mov	r1, r2
    2868:	df05      	svc	5
		if (c) break;
    286a:	79fb      	ldrb	r3, [r7, #7]
    286c:	b2db      	uxtb	r3, r3
    286e:	2b00      	cmp	r3, #0
    2870:	d000      	beq.n	2874 <blink+0x74>
    2872:	e000      	b.n	2876 <blink+0x76>
	}
    2874:	e7cc      	b.n	2810 <blink+0x10>
}
    2876:	3714      	adds	r7, #20
    2878:	46bd      	mov	sp, r7
    287a:	f85d 7b04 	ldr.w	r7, [sp], #4
    287e:	4770      	bx	lr
