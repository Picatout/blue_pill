
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 35 22 00 00     i...m...q...5"..
      20:	35 22 00 00 35 22 00 00 35 22 00 00 b9 05 00 00     5"..5"..5"......
      30:	35 22 00 00 35 22 00 00 79 02 00 00 6d 07 00 00     5"..5"..y...m...
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 35 22 00 00 35 22 00 00 bd 25 00 00     ....5"..5"...%..
      80:	35 22 00 00 35 22 00 00 35 22 00 00 35 22 00 00     5"..5"..5"..5"..
      90:	35 22 00 00 35 22 00 00 35 22 00 00 75 1d 00 00     5"..5"..5"..u...
      a0:	35 22 00 00 35 22 00 00 35 22 00 00 55 24 00 00     5"..5"..5"..U$..
      b0:	bd 1e 00 00 35 22 00 00 35 22 00 00 35 22 00 00     ....5"..5"..5"..
      c0:	35 22 00 00 35 22 00 00 35 22 00 00 35 22 00 00     5"..5"..5"..5"..
      d0:	35 22 00 00 c5 02 00 00 25 10 00 00 cd 02 00 00     5"......%.......
      e0:	35 22 00 00 35 22 00 00 35 22 00 00 35 22 00 00     5"..5"..5"..5"..
      f0:	35 22 00 00 35 22 00 00 35 22 00 00 35 22 00 00     5"..5"..5"..5"..
     100:	35 22 00 00 35 22 00 00 35 22 00 00 35 22 00 00     5"..5"..5"..5"..
     110:	35 22 00 00 35 22 00 00 35 22 00 00 35 22 00 00     5"..5"..5"..5"..
     120:	35 22 00 00 35 22 00 00 35 22 00 00 35 22 00 00     5"..5"..5"..5"..

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
     1b0:	f000 fed8 	bl	f64 <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	20000008 	.word	0x20000008
     1c0:	200026b4 	.word	0x200026b4
     1c4:	00003080 	.word	0x00003080
     1c8:	20000000 	.word	0x20000000
     1cc:	20000008 	.word	0x20000008
     1d0:	20002700 	.word	0x20002700
     1d4:	20000130 	.word	0x20000130
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
     208:	f002 f81c 	bl	2244 <print_fault>
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
     21e:	f002 f811 	bl	2244 <print_fault>
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
     234:	f002 f806 	bl	2244 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f002 f801 	bl	2244 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	00002f30 	.word	0x00002f30
     258:	00002f48 	.word	0x00002f48
     25c:	00002f54 	.word	0x00002f54
     260:	00002f64 	.word	0x00002f64

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f001 ffe6 	bl	2234 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f001 ffe4 	bl	2234 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f001 ffe2 	bl	2234 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f001 ffe0 	bl	2234 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f001 ffde 	bl	2234 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f001 ffdc 	bl	2234 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f001 ffda 	bl	2234 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f001 ffd8 	bl	2234 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f001 ffd6 	bl	2234 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f001 ffd4 	bl	2234 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f001 ffd2 	bl	2234 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f001 ffd0 	bl	2234 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f001 ffce 	bl	2234 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f001 ffcc 	bl	2234 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f001 ffca 	bl	2234 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f001 ffc8 	bl	2234 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f001 ffc6 	bl	2234 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f001 ffc4 	bl	2234 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f001 ffc2 	bl	2234 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f001 ffc0 	bl	2234 <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f001 ffbe 	bl	2234 <reset_mcu>
_default_handler(EXTI9_5_handler) // 23
     2b8:	f001 ffbc 	bl	2234 <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2bc:	f001 ffba 	bl	2234 <reset_mcu>
_default_handler(TIM2_handler) // 28
     2c0:	f001 ffb8 	bl	2234 <reset_mcu>

000002c4 <USART1_handler>:
_default_handler(USART1_handler) // 37
     2c4:	f001 ffb6 	bl	2234 <reset_mcu>
_default_handler(USART2_handler) // 38
     2c8:	f001 ffb4 	bl	2234 <reset_mcu>

000002cc <USART3_handler>:
_default_handler(USART3_handler) // 39
     2cc:	f001 ffb2 	bl	2234 <reset_mcu>

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

000004b8 <led_on>:
static void move(char *src , char *dest, int len);
static void word();

// routine de services

static inline void led_on(){
     4b8:	b480      	push	{r7}
     4ba:	af00      	add	r7, sp, #0
	GPIOC_BRR->brr=GRN_LED;
     4bc:	4b03      	ldr	r3, [pc, #12]	; (4cc <led_on+0x14>)
     4be:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4c2:	601a      	str	r2, [r3, #0]
}
     4c4:	46bd      	mov	sp, r7
     4c6:	f85d 7b04 	ldr.w	r7, [sp], #4
     4ca:	4770      	bx	lr
     4cc:	40011014 	.word	0x40011014

000004d0 <led_off>:

static inline void led_off(){
     4d0:	b480      	push	{r7}
     4d2:	af00      	add	r7, sp, #0
	GPIOC_BSRR->bsrr=GRN_LED;
     4d4:	4b03      	ldr	r3, [pc, #12]	; (4e4 <led_off+0x14>)
     4d6:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4da:	601a      	str	r2, [r3, #0]
}
     4dc:	46bd      	mov	sp, r7
     4de:	f85d 7b04 	ldr.w	r7, [sp], #4
     4e2:	4770      	bx	lr
     4e4:	40011010 	.word	0x40011010

000004e8 <set_timer>:

static inline void set_timer(unsigned time){
     4e8:	b480      	push	{r7}
     4ea:	b083      	sub	sp, #12
     4ec:	af00      	add	r7, sp, #0
     4ee:	6078      	str	r0, [r7, #4]
	timer=time;
     4f0:	4a03      	ldr	r2, [pc, #12]	; (500 <set_timer+0x18>)
     4f2:	687b      	ldr	r3, [r7, #4]
     4f4:	6013      	str	r3, [r2, #0]
}
     4f6:	370c      	adds	r7, #12
     4f8:	46bd      	mov	sp, r7
     4fa:	f85d 7b04 	ldr.w	r7, [sp], #4
     4fe:	4770      	bx	lr
     500:	2000000c 	.word	0x2000000c

00000504 <get_timer>:


static inline unsigned get_timer(){
     504:	b480      	push	{r7}
     506:	af00      	add	r7, sp, #0
	return timer;
     508:	4b03      	ldr	r3, [pc, #12]	; (518 <get_timer+0x14>)
     50a:	681b      	ldr	r3, [r3, #0]
}
     50c:	4618      	mov	r0, r3
     50e:	46bd      	mov	sp, r7
     510:	f85d 7b04 	ldr.w	r7, [sp], #4
     514:	4770      	bx	lr
     516:	bf00      	nop
     518:	2000000c 	.word	0x2000000c

0000051c <peek8>:


static inline uint8_t peek8(uint8_t *adr){
     51c:	b480      	push	{r7}
     51e:	b083      	sub	sp, #12
     520:	af00      	add	r7, sp, #0
     522:	6078      	str	r0, [r7, #4]
	return *adr;
     524:	687b      	ldr	r3, [r7, #4]
     526:	781b      	ldrb	r3, [r3, #0]
}
     528:	4618      	mov	r0, r3
     52a:	370c      	adds	r7, #12
     52c:	46bd      	mov	sp, r7
     52e:	f85d 7b04 	ldr.w	r7, [sp], #4
     532:	4770      	bx	lr

00000534 <peek16>:

static inline uint16_t peek16(uint16_t *adr){
     534:	b480      	push	{r7}
     536:	b083      	sub	sp, #12
     538:	af00      	add	r7, sp, #0
     53a:	6078      	str	r0, [r7, #4]
	return *adr;
     53c:	687b      	ldr	r3, [r7, #4]
     53e:	881b      	ldrh	r3, [r3, #0]
}
     540:	4618      	mov	r0, r3
     542:	370c      	adds	r7, #12
     544:	46bd      	mov	sp, r7
     546:	f85d 7b04 	ldr.w	r7, [sp], #4
     54a:	4770      	bx	lr

0000054c <peek32>:

static inline uint32_t peek32(uint32_t *adr){
     54c:	b480      	push	{r7}
     54e:	b083      	sub	sp, #12
     550:	af00      	add	r7, sp, #0
     552:	6078      	str	r0, [r7, #4]
	return *adr;
     554:	687b      	ldr	r3, [r7, #4]
     556:	681b      	ldr	r3, [r3, #0]
}
     558:	4618      	mov	r0, r3
     55a:	370c      	adds	r7, #12
     55c:	46bd      	mov	sp, r7
     55e:	f85d 7b04 	ldr.w	r7, [sp], #4
     562:	4770      	bx	lr

00000564 <poke8>:

static inline void poke8(uint8_t *adr, uint8_t value){
     564:	b480      	push	{r7}
     566:	b083      	sub	sp, #12
     568:	af00      	add	r7, sp, #0
     56a:	6078      	str	r0, [r7, #4]
     56c:	460b      	mov	r3, r1
     56e:	70fb      	strb	r3, [r7, #3]
	*adr=value;
     570:	687b      	ldr	r3, [r7, #4]
     572:	78fa      	ldrb	r2, [r7, #3]
     574:	701a      	strb	r2, [r3, #0]
}
     576:	370c      	adds	r7, #12
     578:	46bd      	mov	sp, r7
     57a:	f85d 7b04 	ldr.w	r7, [sp], #4
     57e:	4770      	bx	lr

00000580 <poke16>:

static inline void poke16(uint16_t *adr, uint16_t value){
     580:	b480      	push	{r7}
     582:	b083      	sub	sp, #12
     584:	af00      	add	r7, sp, #0
     586:	6078      	str	r0, [r7, #4]
     588:	460b      	mov	r3, r1
     58a:	807b      	strh	r3, [r7, #2]
	*adr=value;
     58c:	687b      	ldr	r3, [r7, #4]
     58e:	887a      	ldrh	r2, [r7, #2]
     590:	801a      	strh	r2, [r3, #0]
}
     592:	370c      	adds	r7, #12
     594:	46bd      	mov	sp, r7
     596:	f85d 7b04 	ldr.w	r7, [sp], #4
     59a:	4770      	bx	lr

0000059c <poke32>:

static inline void poke32(uint32_t *adr, uint32_t value){
     59c:	b480      	push	{r7}
     59e:	b083      	sub	sp, #12
     5a0:	af00      	add	r7, sp, #0
     5a2:	6078      	str	r0, [r7, #4]
     5a4:	6039      	str	r1, [r7, #0]
	*adr=value;
     5a6:	687b      	ldr	r3, [r7, #4]
     5a8:	683a      	ldr	r2, [r7, #0]
     5aa:	601a      	str	r2, [r3, #0]
}
     5ac:	370c      	adds	r7, #12
     5ae:	46bd      	mov	sp, r7
     5b0:	f85d 7b04 	ldr.w	r7, [sp], #4
     5b4:	4770      	bx	lr
     5b6:	bf00      	nop

000005b8 <SVC_handler>:

// interruption multiplexeur des appels de services
void __attribute__((__interrupt__)) SVC_handler(){
     5b8:	4668      	mov	r0, sp
     5ba:	f020 0107 	bic.w	r1, r0, #7
     5be:	468d      	mov	sp, r1
     5c0:	b591      	push	{r0, r4, r7, lr}
     5c2:	b084      	sub	sp, #16
     5c4:	af00      	add	r7, sp, #0
	int svc_id;
	void *arg1, *arg2; 
	asm volatile (
     5c6:	f3ef 8009 	mrs	r0, PSP
     5ca:	6981      	ldr	r1, [r0, #24]
     5cc:	f811 4c02 	ldrb.w	r4, [r1, #-2]
     5d0:	6802      	ldr	r2, [r0, #0]
     5d2:	6843      	ldr	r3, [r0, #4]
     5d4:	60fc      	str	r4, [r7, #12]
     5d6:	60ba      	str	r2, [r7, #8]
     5d8:	607b      	str	r3, [r7, #4]
    "ldr %[arg1],[r0]\n\t"
    "ldr %[arg2],[r0,#4]\n\t"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [arg2] "=r" (arg2)
    :: "r0","r1" 
    );
	switch (svc_id){
     5da:	68fb      	ldr	r3, [r7, #12]
     5dc:	2b13      	cmp	r3, #19
     5de:	f200 80bd 	bhi.w	75c <SVC_handler+0x1a4>
     5e2:	a201      	add	r2, pc, #4	; (adr r2, 5e8 <SVC_handler+0x30>)
     5e4:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     5e8:	00000757 	.word	0x00000757
     5ec:	00000639 	.word	0x00000639
     5f0:	0000063f 	.word	0x0000063f
     5f4:	00000645 	.word	0x00000645
     5f8:	00000651 	.word	0x00000651
     5fc:	0000065d 	.word	0x0000065d
     600:	0000066b 	.word	0x0000066b
     604:	00000677 	.word	0x00000677
     608:	0000068b 	.word	0x0000068b
     60c:	00000693 	.word	0x00000693
     610:	000006a1 	.word	0x000006a1
     614:	000006ad 	.word	0x000006ad
     618:	000006c1 	.word	0x000006c1
     61c:	000006d5 	.word	0x000006d5
     620:	000006e7 	.word	0x000006e7
     624:	000006fb 	.word	0x000006fb
     628:	0000070f 	.word	0x0000070f
     62c:	00000723 	.word	0x00000723
     630:	0000073b 	.word	0x0000073b
     634:	0000074d 	.word	0x0000074d
	case SVC_LED_ON: 
		led_on();
     638:	f7ff ff3e 	bl	4b8 <led_on>
		break;
     63c:	e08e      	b.n	75c <SVC_handler+0x1a4>
	case SVC_LED_OFF:
		led_off();
     63e:	f7ff ff47 	bl	4d0 <led_off>
		break;
     642:	e08b      	b.n	75c <SVC_handler+0x1a4>
	case SVC_TIMER:
		set_timer(*(unsigned*)arg1);
     644:	68bb      	ldr	r3, [r7, #8]
     646:	681b      	ldr	r3, [r3, #0]
     648:	4618      	mov	r0, r3
     64a:	f7ff ff4d 	bl	4e8 <set_timer>
		break;
     64e:	e085      	b.n	75c <SVC_handler+0x1a4>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=get_timer();
     650:	f7ff ff58 	bl	504 <get_timer>
     654:	4602      	mov	r2, r0
     656:	68bb      	ldr	r3, [r7, #8]
     658:	601a      	str	r2, [r3, #0]
		break;
     65a:	e07f      	b.n	75c <SVC_handler+0x1a4>
	case SVC_CONIN:
		*(char *)arg1=conin();
     65c:	f000 fd54 	bl	1108 <conin>
     660:	4603      	mov	r3, r0
     662:	461a      	mov	r2, r3
     664:	68bb      	ldr	r3, [r7, #8]
     666:	701a      	strb	r2, [r3, #0]
		break;
     668:	e078      	b.n	75c <SVC_handler+0x1a4>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     66a:	68bb      	ldr	r3, [r7, #8]
     66c:	781b      	ldrb	r3, [r3, #0]
     66e:	4618      	mov	r0, r3
     670:	f000 fd3a 	bl	10e8 <conout>
		break;
     674:	e072      	b.n	75c <SVC_handler+0x1a4>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     676:	68bb      	ldr	r3, [r7, #8]
     678:	681b      	ldr	r3, [r3, #0]
     67a:	6878      	ldr	r0, [r7, #4]
     67c:	4619      	mov	r1, r3
     67e:	f000 fdbb 	bl	11f8 <read_line>
     682:	4602      	mov	r2, r0
     684:	68bb      	ldr	r3, [r7, #8]
     686:	601a      	str	r2, [r3, #0]
		break;
     688:	e068      	b.n	75c <SVC_handler+0x1a4>
	case SVC_PRINT:
		print((const char*)arg1);
     68a:	68b8      	ldr	r0, [r7, #8]
     68c:	f000 fd5e 	bl	114c <print>
		break;
     690:	e064      	b.n	75c <SVC_handler+0x1a4>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     692:	68bb      	ldr	r3, [r7, #8]
     694:	681b      	ldr	r3, [r3, #0]
     696:	4618      	mov	r0, r3
     698:	210a      	movs	r1, #10
     69a:	f000 fe57 	bl	134c <print_int>
		break;
     69e:	e05d      	b.n	75c <SVC_handler+0x1a4>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     6a0:	68bb      	ldr	r3, [r7, #8]
     6a2:	681b      	ldr	r3, [r3, #0]
     6a4:	4618      	mov	r0, r3
     6a6:	f000 febf 	bl	1428 <print_hex>
		break;
     6aa:	e057      	b.n	75c <SVC_handler+0x1a4>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     6ac:	68bb      	ldr	r3, [r7, #8]
     6ae:	681b      	ldr	r3, [r3, #0]
     6b0:	4618      	mov	r0, r3
     6b2:	f7ff ff33 	bl	51c <peek8>
     6b6:	4603      	mov	r3, r0
     6b8:	461a      	mov	r2, r3
     6ba:	68bb      	ldr	r3, [r7, #8]
     6bc:	701a      	strb	r2, [r3, #0]
		break;
     6be:	e04d      	b.n	75c <SVC_handler+0x1a4>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     6c0:	68bb      	ldr	r3, [r7, #8]
     6c2:	681b      	ldr	r3, [r3, #0]
     6c4:	4618      	mov	r0, r3
     6c6:	f7ff ff35 	bl	534 <peek16>
     6ca:	4603      	mov	r3, r0
     6cc:	461a      	mov	r2, r3
     6ce:	68bb      	ldr	r3, [r7, #8]
     6d0:	801a      	strh	r2, [r3, #0]
		break;
     6d2:	e043      	b.n	75c <SVC_handler+0x1a4>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     6d4:	68bb      	ldr	r3, [r7, #8]
     6d6:	681b      	ldr	r3, [r3, #0]
     6d8:	4618      	mov	r0, r3
     6da:	f7ff ff37 	bl	54c <peek32>
     6de:	4602      	mov	r2, r0
     6e0:	68bb      	ldr	r3, [r7, #8]
     6e2:	601a      	str	r2, [r3, #0]
		break;
     6e4:	e03a      	b.n	75c <SVC_handler+0x1a4>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
     6e6:	68bb      	ldr	r3, [r7, #8]
     6e8:	681b      	ldr	r3, [r3, #0]
     6ea:	461a      	mov	r2, r3
     6ec:	687b      	ldr	r3, [r7, #4]
     6ee:	781b      	ldrb	r3, [r3, #0]
     6f0:	4610      	mov	r0, r2
     6f2:	4619      	mov	r1, r3
     6f4:	f7ff ff36 	bl	564 <poke8>
		break;
     6f8:	e030      	b.n	75c <SVC_handler+0x1a4>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
     6fa:	68bb      	ldr	r3, [r7, #8]
     6fc:	681b      	ldr	r3, [r3, #0]
     6fe:	461a      	mov	r2, r3
     700:	687b      	ldr	r3, [r7, #4]
     702:	881b      	ldrh	r3, [r3, #0]
     704:	4610      	mov	r0, r2
     706:	4619      	mov	r1, r3
     708:	f7ff ff3a 	bl	580 <poke16>
		break;
     70c:	e026      	b.n	75c <SVC_handler+0x1a4>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
     70e:	68bb      	ldr	r3, [r7, #8]
     710:	681b      	ldr	r3, [r3, #0]
     712:	461a      	mov	r2, r3
     714:	687b      	ldr	r3, [r7, #4]
     716:	681b      	ldr	r3, [r3, #0]
     718:	4610      	mov	r0, r2
     71a:	4619      	mov	r1, r3
     71c:	f7ff ff3e 	bl	59c <poke32>
		break;
     720:	e01c      	b.n	75c <SVC_handler+0x1a4>
	case SVC_FLASH_WR:
		*(int*)arg1=flash_write(*(uint32_t*)arg1,*(uint16_t*)arg2);
     722:	68bb      	ldr	r3, [r7, #8]
     724:	681a      	ldr	r2, [r3, #0]
     726:	687b      	ldr	r3, [r7, #4]
     728:	881b      	ldrh	r3, [r3, #0]
     72a:	4610      	mov	r0, r2
     72c:	4619      	mov	r1, r3
     72e:	f000 ff2b 	bl	1588 <flash_write>
     732:	4602      	mov	r2, r0
     734:	68bb      	ldr	r3, [r7, #8]
     736:	601a      	str	r2, [r3, #0]
		break;
     738:	e010      	b.n	75c <SVC_handler+0x1a4>
	case SVC_FLASH_PGER:
		*(int*)arg1=flash_erase_page(*(uint32_t*)arg1);
     73a:	68bb      	ldr	r3, [r7, #8]
     73c:	681b      	ldr	r3, [r3, #0]
     73e:	4618      	mov	r0, r3
     740:	f000 ff66 	bl	1610 <flash_erase_page>
     744:	4602      	mov	r2, r0
     746:	68bb      	ldr	r3, [r7, #8]
     748:	601a      	str	r2, [r3, #0]
		break;
     74a:	e007      	b.n	75c <SVC_handler+0x1a4>
	case SVC_TICKS:
		*(unsigned*)arg1=ticks;
     74c:	4b06      	ldr	r3, [pc, #24]	; (768 <SVC_handler+0x1b0>)
     74e:	681a      	ldr	r2, [r3, #0]
     750:	68bb      	ldr	r3, [r7, #8]
     752:	601a      	str	r2, [r3, #0]
		break;
     754:	e002      	b.n	75c <SVC_handler+0x1a4>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     756:	f001 fd6d 	bl	2234 <reset_mcu>
	    break;
     75a:	bf00      	nop
	}	
}
     75c:	3710      	adds	r7, #16
     75e:	46bd      	mov	sp, r7
     760:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     764:	4685      	mov	sp, r0
     766:	4770      	bx	lr
     768:	20000008 	.word	0x20000008

0000076c <STK_handler>:

// interruption coretimer
void __attribute__((naked)) STK_handler(){
	ticks++;
     76c:	4b06      	ldr	r3, [pc, #24]	; (788 <STK_handler+0x1c>)
     76e:	681b      	ldr	r3, [r3, #0]
     770:	3301      	adds	r3, #1
     772:	4a05      	ldr	r2, [pc, #20]	; (788 <STK_handler+0x1c>)
     774:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
     776:	4b05      	ldr	r3, [pc, #20]	; (78c <STK_handler+0x20>)
     778:	681b      	ldr	r3, [r3, #0]
     77a:	2b00      	cmp	r3, #0
     77c:	d004      	beq.n	788 <STK_handler+0x1c>
     77e:	4b03      	ldr	r3, [pc, #12]	; (78c <STK_handler+0x20>)
     780:	681b      	ldr	r3, [r3, #0]
     782:	3b01      	subs	r3, #1
     784:	4a01      	ldr	r2, [pc, #4]	; (78c <STK_handler+0x20>)
     786:	6013      	str	r3, [r2, #0]
     788:	20000008 	.word	0x20000008
     78c:	2000000c 	.word	0x2000000c

00000790 <set_sysclock>:
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     790:	b480      	push	{r7}
     792:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC->CR|=RCC_CR_HSEON;
     794:	4a18      	ldr	r2, [pc, #96]	; (7f8 <set_sysclock+0x68>)
     796:	4b18      	ldr	r3, [pc, #96]	; (7f8 <set_sysclock+0x68>)
     798:	681b      	ldr	r3, [r3, #0]
     79a:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     79e:	6013      	str	r3, [r2, #0]
	 // attend que l'oscillateur soit prêt
   while (!(RCC->CR&RCC_CR_HSERDY));
     7a0:	bf00      	nop
     7a2:	4b15      	ldr	r3, [pc, #84]	; (7f8 <set_sysclock+0x68>)
     7a4:	681b      	ldr	r3, [r3, #0]
     7a6:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
     7aa:	2b00      	cmp	r3, #0
     7ac:	d0f9      	beq.n	7a2 <set_sysclock+0x12>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 8 
     // pour une fréquence  Fsysclk de 64 Mhz
    RCC->CFGR|=RCC_CFGR_PLLSRC_HSE|(RCC_CFGR_PLLMUL8<<RCC_CFGR_PLLMUL_POS);
     7ae:	4a12      	ldr	r2, [pc, #72]	; (7f8 <set_sysclock+0x68>)
     7b0:	4b11      	ldr	r3, [pc, #68]	; (7f8 <set_sysclock+0x68>)
     7b2:	685b      	ldr	r3, [r3, #4]
     7b4:	f443 13c8 	orr.w	r3, r3, #1638400	; 0x190000
     7b8:	6053      	str	r3, [r2, #4]
    // active le PLL
    RCC->CR|=RCC_CR_PLLON;
     7ba:	4a0f      	ldr	r2, [pc, #60]	; (7f8 <set_sysclock+0x68>)
     7bc:	4b0e      	ldr	r3, [pc, #56]	; (7f8 <set_sysclock+0x68>)
     7be:	681b      	ldr	r3, [r3, #0]
     7c0:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
     7c4:	6013      	str	r3, [r2, #0]
    // Attend que le PLL soit prêt
    while (!(RCC->CR&RCC_CR_PLLRDY));
     7c6:	bf00      	nop
     7c8:	4b0b      	ldr	r3, [pc, #44]	; (7f8 <set_sysclock+0x68>)
     7ca:	681b      	ldr	r3, [r3, #0]
     7cc:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
     7d0:	2b00      	cmp	r3, #0
     7d2:	d0f9      	beq.n	7c8 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    // active le prefetch buffer
    FLASH->ACR|=(WAIT_2_CY<<FLASH_ACR_LATENCY_POS)|FLASH_ACR_PRFTBE;
     7d4:	4a09      	ldr	r2, [pc, #36]	; (7fc <set_sysclock+0x6c>)
     7d6:	4b09      	ldr	r3, [pc, #36]	; (7fc <set_sysclock+0x6c>)
     7d8:	681b      	ldr	r3, [r3, #0]
     7da:	f043 0312 	orr.w	r3, r3, #18
     7de:	6013      	str	r3, [r2, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
    // Sélectionne le PLL comme source pour SYSCLK dans CR
	RCC->CFGR|=(RCC_CFGR_PPREx_DIV2<<RCC_CFGR_PPRE1_POS)|(RCC_CFGR_SW_PLL<<RCC_CFGR_SW_POS);
     7e0:	4a05      	ldr	r2, [pc, #20]	; (7f8 <set_sysclock+0x68>)
     7e2:	4b05      	ldr	r3, [pc, #20]	; (7f8 <set_sysclock+0x68>)
     7e4:	685b      	ldr	r3, [r3, #4]
     7e6:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     7ea:	f043 0302 	orr.w	r3, r3, #2
     7ee:	6053      	str	r3, [r2, #4]
}
     7f0:	46bd      	mov	sp, r7
     7f2:	f85d 7b04 	ldr.w	r7, [sp], #4
     7f6:	4770      	bx	lr
     7f8:	40021000 	.word	0x40021000
     7fc:	40022000 	.word	0x40022000

00000800 <config_systicks>:

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
     800:	b580      	push	{r7, lr}
     802:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,9);
     804:	f06f 000e 	mvn.w	r0, #14
     808:	2109      	movs	r1, #9
     80a:	f001 fbcf 	bl	1fac <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
     80e:	4b04      	ldr	r3, [pc, #16]	; (820 <config_systicks+0x20>)
     810:	f242 3227 	movw	r2, #8999	; 0x2327
     814:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
     816:	4b03      	ldr	r3, [pc, #12]	; (824 <config_systicks+0x24>)
     818:	2203      	movs	r2, #3
     81a:	601a      	str	r2, [r3, #0]
}
     81c:	bd80      	pop	{r7, pc}
     81e:	bf00      	nop
     820:	e000e014 	.word	0xe000e014
     824:	e000e010 	.word	0xe000e010

00000828 <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     828:	b480      	push	{r7}
     82a:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     82c:	2300      	movs	r3, #0
     82e:	2200      	movs	r2, #0
     830:	4618      	mov	r0, r3
     832:	4611      	mov	r1, r2
     834:	df00      	svc	0
}
     836:	46bd      	mov	sp, r7
     838:	f85d 7b04 	ldr.w	r7, [sp], #4
     83c:	4770      	bx	lr
     83e:	bf00      	nop

00000840 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     840:	b480      	push	{r7}
     842:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     844:	2300      	movs	r3, #0
     846:	2200      	movs	r2, #0
     848:	4618      	mov	r0, r3
     84a:	4611      	mov	r1, r2
     84c:	df01      	svc	1
}
     84e:	46bd      	mov	sp, r7
     850:	f85d 7b04 	ldr.w	r7, [sp], #4
     854:	4770      	bx	lr
     856:	bf00      	nop

00000858 <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     858:	b480      	push	{r7}
     85a:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     85c:	2300      	movs	r3, #0
     85e:	2200      	movs	r2, #0
     860:	4618      	mov	r0, r3
     862:	4611      	mov	r1, r2
     864:	df02      	svc	2
}
     866:	46bd      	mov	sp, r7
     868:	f85d 7b04 	ldr.w	r7, [sp], #4
     86c:	4770      	bx	lr
     86e:	bf00      	nop

00000870 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     870:	b580      	push	{r7, lr}
     872:	b082      	sub	sp, #8
     874:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     876:	f000 fadb 	bl	e30 <word>
	n=atoi((const char*)pad);
     87a:	4806      	ldr	r0, [pc, #24]	; (894 <cmd_set_timer+0x24>)
     87c:	f7ff fda6 	bl	3cc <atoi>
     880:	4603      	mov	r3, r0
     882:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     884:	1d3b      	adds	r3, r7, #4
     886:	2200      	movs	r2, #0
     888:	4618      	mov	r0, r3
     88a:	4611      	mov	r1, r2
     88c:	df03      	svc	3
}
     88e:	3708      	adds	r7, #8
     890:	46bd      	mov	sp, r7
     892:	bd80      	pop	{r7, pc}
     894:	20000060 	.word	0x20000060

00000898 <cmd_get_timer>:

static void cmd_get_timer(){
     898:	b480      	push	{r7}
     89a:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     89c:	4b04      	ldr	r3, [pc, #16]	; (8b0 <cmd_get_timer+0x18>)
     89e:	2200      	movs	r2, #0
     8a0:	4618      	mov	r0, r3
     8a2:	4611      	mov	r1, r2
     8a4:	df04      	svc	4
}
     8a6:	46bd      	mov	sp, r7
     8a8:	f85d 7b04 	ldr.w	r7, [sp], #4
     8ac:	4770      	bx	lr
     8ae:	bf00      	nop
     8b0:	20000060 	.word	0x20000060

000008b4 <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     8b4:	b480      	push	{r7}
     8b6:	b083      	sub	sp, #12
     8b8:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     8ba:	1d3b      	adds	r3, r7, #4
     8bc:	2200      	movs	r2, #0
     8be:	4618      	mov	r0, r3
     8c0:	4611      	mov	r1, r2
     8c2:	df04      	svc	4
     8c4:	687b      	ldr	r3, [r7, #4]
     8c6:	2b00      	cmp	r3, #0
     8c8:	d1f7      	bne.n	8ba <cmd_pause+0x6>
}
     8ca:	370c      	adds	r7, #12
     8cc:	46bd      	mov	sp, r7
     8ce:	f85d 7b04 	ldr.w	r7, [sp], #4
     8d2:	4770      	bx	lr

000008d4 <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     8d4:	b480      	push	{r7}
     8d6:	b083      	sub	sp, #12
     8d8:	af00      	add	r7, sp, #0
	volatile char n=0;
     8da:	2300      	movs	r3, #0
     8dc:	71fb      	strb	r3, [r7, #7]
	while (!n){
     8de:	e004      	b.n	8ea <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     8e0:	1dfb      	adds	r3, r7, #7
     8e2:	2200      	movs	r2, #0
     8e4:	4618      	mov	r0, r3
     8e6:	4611      	mov	r1, r2
     8e8:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     8ea:	79fb      	ldrb	r3, [r7, #7]
     8ec:	b2db      	uxtb	r3, r3
     8ee:	2b00      	cmp	r3, #0
     8f0:	d0f6      	beq.n	8e0 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     8f2:	79fb      	ldrb	r3, [r7, #7]
     8f4:	b2da      	uxtb	r2, r3
     8f6:	4b05      	ldr	r3, [pc, #20]	; (90c <cmd_getc+0x38>)
     8f8:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     8fa:	4b04      	ldr	r3, [pc, #16]	; (90c <cmd_getc+0x38>)
     8fc:	2200      	movs	r2, #0
     8fe:	705a      	strb	r2, [r3, #1]
}
     900:	370c      	adds	r7, #12
     902:	46bd      	mov	sp, r7
     904:	f85d 7b04 	ldr.w	r7, [sp], #4
     908:	4770      	bx	lr
     90a:	bf00      	nop
     90c:	20000060 	.word	0x20000060

00000910 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     910:	b580      	push	{r7, lr}
     912:	b082      	sub	sp, #8
     914:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     916:	f000 fa8b 	bl	e30 <word>
	cmd_id=search_command((const char*)pad);
     91a:	480a      	ldr	r0, [pc, #40]	; (944 <cmd_putc+0x34>)
     91c:	f000 f972 	bl	c04 <search_command>
     920:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     922:	687b      	ldr	r3, [r7, #4]
     924:	2b00      	cmp	r3, #0
     926:	db05      	blt.n	934 <cmd_putc+0x24>
     928:	4a07      	ldr	r2, [pc, #28]	; (948 <cmd_putc+0x38>)
     92a:	687b      	ldr	r3, [r7, #4]
     92c:	00db      	lsls	r3, r3, #3
     92e:	4413      	add	r3, r2
     930:	685b      	ldr	r3, [r3, #4]
     932:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     934:	4b03      	ldr	r3, [pc, #12]	; (944 <cmd_putc+0x34>)
     936:	2200      	movs	r2, #0
     938:	4618      	mov	r0, r3
     93a:	4611      	mov	r1, r2
     93c:	df06      	svc	6
}
     93e:	3708      	adds	r7, #8
     940:	46bd      	mov	sp, r7
     942:	bd80      	pop	{r7, pc}
     944:	20000060 	.word	0x20000060
     948:	00002984 	.word	0x00002984

0000094c <cmd_readln>:

static void cmd_readln(){
     94c:	b580      	push	{r7, lr}
     94e:	b082      	sub	sp, #8
     950:	af00      	add	r7, sp, #0
	unsigned llen=80;
     952:	2350      	movs	r3, #80	; 0x50
     954:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     956:	1d3b      	adds	r3, r7, #4
     958:	4a04      	ldr	r2, [pc, #16]	; (96c <cmd_readln+0x20>)
     95a:	4618      	mov	r0, r3
     95c:	4611      	mov	r1, r2
     95e:	df07      	svc	7
	print((const char*)pad);
     960:	4802      	ldr	r0, [pc, #8]	; (96c <cmd_readln+0x20>)
     962:	f000 fbf3 	bl	114c <print>
}
     966:	3708      	adds	r7, #8
     968:	46bd      	mov	sp, r7
     96a:	bd80      	pop	{r7, pc}
     96c:	20000060 	.word	0x20000060

00000970 <cmd_print>:

static void cmd_print(){
     970:	b580      	push	{r7, lr}
     972:	af00      	add	r7, sp, #0
	word();
     974:	f000 fa5c 	bl	e30 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     978:	4b02      	ldr	r3, [pc, #8]	; (984 <cmd_print+0x14>)
     97a:	2200      	movs	r2, #0
     97c:	4618      	mov	r0, r3
     97e:	4611      	mov	r1, r2
     980:	df08      	svc	8
}
     982:	bd80      	pop	{r7, pc}
     984:	20000060 	.word	0x20000060

00000988 <cmd_print_int>:

static void cmd_print_int(){
     988:	b580      	push	{r7, lr}
     98a:	b082      	sub	sp, #8
     98c:	af00      	add	r7, sp, #0
	int cmd_id;
    unsigned u32;
    
	word();
     98e:	f000 fa4f 	bl	e30 <word>
	cmd_id=search_command((const char*)pad);
     992:	480e      	ldr	r0, [pc, #56]	; (9cc <cmd_print_int+0x44>)
     994:	f000 f936 	bl	c04 <search_command>
     998:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     99a:	687b      	ldr	r3, [r7, #4]
     99c:	2b00      	cmp	r3, #0
     99e:	db06      	blt.n	9ae <cmd_print_int+0x26>
		 commands[cmd_id].fn();
     9a0:	4a0b      	ldr	r2, [pc, #44]	; (9d0 <cmd_print_int+0x48>)
     9a2:	687b      	ldr	r3, [r7, #4]
     9a4:	00db      	lsls	r3, r3, #3
     9a6:	4413      	add	r3, r2
     9a8:	685b      	ldr	r3, [r3, #4]
     9aa:	4798      	blx	r3
     9ac:	e006      	b.n	9bc <cmd_print_int+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     9ae:	4807      	ldr	r0, [pc, #28]	; (9cc <cmd_print_int+0x44>)
     9b0:	f7ff fd0c 	bl	3cc <atoi>
     9b4:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     9b6:	4a05      	ldr	r2, [pc, #20]	; (9cc <cmd_print_int+0x44>)
     9b8:	687b      	ldr	r3, [r7, #4]
     9ba:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_INT,pad,NUL);
     9bc:	4b03      	ldr	r3, [pc, #12]	; (9cc <cmd_print_int+0x44>)
     9be:	2200      	movs	r2, #0
     9c0:	4618      	mov	r0, r3
     9c2:	4611      	mov	r1, r2
     9c4:	df09      	svc	9
}
     9c6:	3708      	adds	r7, #8
     9c8:	46bd      	mov	sp, r7
     9ca:	bd80      	pop	{r7, pc}
     9cc:	20000060 	.word	0x20000060
     9d0:	00002984 	.word	0x00002984

000009d4 <cmd_print_hex>:

static void cmd_print_hex(){
     9d4:	b580      	push	{r7, lr}
     9d6:	b082      	sub	sp, #8
     9d8:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     9da:	f000 fa29 	bl	e30 <word>
	cmd_id=search_command((const char*)pad);
     9de:	480e      	ldr	r0, [pc, #56]	; (a18 <cmd_print_hex+0x44>)
     9e0:	f000 f910 	bl	c04 <search_command>
     9e4:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     9e6:	687b      	ldr	r3, [r7, #4]
     9e8:	2b00      	cmp	r3, #0
     9ea:	db06      	blt.n	9fa <cmd_print_hex+0x26>
		 commands[cmd_id].fn();
     9ec:	4a0b      	ldr	r2, [pc, #44]	; (a1c <cmd_print_hex+0x48>)
     9ee:	687b      	ldr	r3, [r7, #4]
     9f0:	00db      	lsls	r3, r3, #3
     9f2:	4413      	add	r3, r2
     9f4:	685b      	ldr	r3, [r3, #4]
     9f6:	4798      	blx	r3
     9f8:	e006      	b.n	a08 <cmd_print_hex+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     9fa:	4807      	ldr	r0, [pc, #28]	; (a18 <cmd_print_hex+0x44>)
     9fc:	f7ff fce6 	bl	3cc <atoi>
     a00:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     a02:	4a05      	ldr	r2, [pc, #20]	; (a18 <cmd_print_hex+0x44>)
     a04:	687b      	ldr	r3, [r7, #4]
     a06:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_HEX,pad,NUL);
     a08:	4b03      	ldr	r3, [pc, #12]	; (a18 <cmd_print_hex+0x44>)
     a0a:	2200      	movs	r2, #0
     a0c:	4618      	mov	r0, r3
     a0e:	4611      	mov	r1, r2
     a10:	df0a      	svc	10
}
     a12:	3708      	adds	r7, #8
     a14:	46bd      	mov	sp, r7
     a16:	bd80      	pop	{r7, pc}
     a18:	20000060 	.word	0x20000060
     a1c:	00002984 	.word	0x00002984

00000a20 <cmd_run>:

static void cmd_run(){
     a20:	b580      	push	{r7, lr}
     a22:	af00      	add	r7, sp, #0
	((fn)proga)();
     a24:	4b01      	ldr	r3, [pc, #4]	; (a2c <cmd_run+0xc>)
     a26:	681b      	ldr	r3, [r3, #0]
     a28:	4798      	blx	r3
	
}
     a2a:	bd80      	pop	{r7, pc}
     a2c:	20000130 	.word	0x20000130

00000a30 <cmd_peek8>:

static void cmd_peek8(){
     a30:	b580      	push	{r7, lr}
     a32:	b082      	sub	sp, #8
     a34:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     a36:	f000 f9fb 	bl	e30 <word>
	u=atoi((const char*)pad);
     a3a:	4808      	ldr	r0, [pc, #32]	; (a5c <cmd_peek8+0x2c>)
     a3c:	f7ff fcc6 	bl	3cc <atoi>
     a40:	4603      	mov	r3, r0
     a42:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     a44:	1d3b      	adds	r3, r7, #4
     a46:	2200      	movs	r2, #0
     a48:	4618      	mov	r0, r3
     a4a:	4611      	mov	r1, r2
     a4c:	df0b      	svc	11
	*(uint32_t*)pad=u&0xff;
     a4e:	4a03      	ldr	r2, [pc, #12]	; (a5c <cmd_peek8+0x2c>)
     a50:	687b      	ldr	r3, [r7, #4]
     a52:	b2db      	uxtb	r3, r3
     a54:	6013      	str	r3, [r2, #0]
}
     a56:	3708      	adds	r7, #8
     a58:	46bd      	mov	sp, r7
     a5a:	bd80      	pop	{r7, pc}
     a5c:	20000060 	.word	0x20000060

00000a60 <cmd_peek16>:

static void cmd_peek16(){
     a60:	b580      	push	{r7, lr}
     a62:	b082      	sub	sp, #8
     a64:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     a66:	f000 f9e3 	bl	e30 <word>
	u=atoi((const char*)pad);
     a6a:	4808      	ldr	r0, [pc, #32]	; (a8c <cmd_peek16+0x2c>)
     a6c:	f7ff fcae 	bl	3cc <atoi>
     a70:	4603      	mov	r3, r0
     a72:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     a74:	1d3b      	adds	r3, r7, #4
     a76:	2200      	movs	r2, #0
     a78:	4618      	mov	r0, r3
     a7a:	4611      	mov	r1, r2
     a7c:	df0c      	svc	12
	*(uint32_t*)pad=u&0xffff;
     a7e:	4a03      	ldr	r2, [pc, #12]	; (a8c <cmd_peek16+0x2c>)
     a80:	687b      	ldr	r3, [r7, #4]
     a82:	b29b      	uxth	r3, r3
     a84:	6013      	str	r3, [r2, #0]
}
     a86:	3708      	adds	r7, #8
     a88:	46bd      	mov	sp, r7
     a8a:	bd80      	pop	{r7, pc}
     a8c:	20000060 	.word	0x20000060

00000a90 <cmd_peek32>:

static void cmd_peek32(){
     a90:	b580      	push	{r7, lr}
     a92:	b082      	sub	sp, #8
     a94:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     a96:	f000 f9cb 	bl	e30 <word>
	u=atoi((const char*)pad);
     a9a:	4808      	ldr	r0, [pc, #32]	; (abc <cmd_peek32+0x2c>)
     a9c:	f7ff fc96 	bl	3cc <atoi>
     aa0:	4603      	mov	r3, r0
     aa2:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK32,&u,NUL);
     aa4:	1d3b      	adds	r3, r7, #4
     aa6:	2200      	movs	r2, #0
     aa8:	4618      	mov	r0, r3
     aaa:	4611      	mov	r1, r2
     aac:	df0d      	svc	13
	*(uint32_t*)pad=u;
     aae:	4a03      	ldr	r2, [pc, #12]	; (abc <cmd_peek32+0x2c>)
     ab0:	687b      	ldr	r3, [r7, #4]
     ab2:	6013      	str	r3, [r2, #0]
}
     ab4:	3708      	adds	r7, #8
     ab6:	46bd      	mov	sp, r7
     ab8:	bd80      	pop	{r7, pc}
     aba:	bf00      	nop
     abc:	20000060 	.word	0x20000060

00000ac0 <cmd_poke8>:

static void cmd_poke8(){
     ac0:	b580      	push	{r7, lr}
     ac2:	b082      	sub	sp, #8
     ac4:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     ac6:	f000 f9b3 	bl	e30 <word>
	adr=atoi((const char*)pad);
     aca:	480a      	ldr	r0, [pc, #40]	; (af4 <cmd_poke8+0x34>)
     acc:	f7ff fc7e 	bl	3cc <atoi>
     ad0:	4603      	mov	r3, r0
     ad2:	607b      	str	r3, [r7, #4]
	word();
     ad4:	f000 f9ac 	bl	e30 <word>
	u8=atoi((const char*)pad);
     ad8:	4806      	ldr	r0, [pc, #24]	; (af4 <cmd_poke8+0x34>)
     ada:	f7ff fc77 	bl	3cc <atoi>
     ade:	4603      	mov	r3, r0
     ae0:	b2db      	uxtb	r3, r3
     ae2:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     ae4:	1d3b      	adds	r3, r7, #4
     ae6:	1cfa      	adds	r2, r7, #3
     ae8:	4618      	mov	r0, r3
     aea:	4611      	mov	r1, r2
     aec:	df0e      	svc	14
}
     aee:	3708      	adds	r7, #8
     af0:	46bd      	mov	sp, r7
     af2:	bd80      	pop	{r7, pc}
     af4:	20000060 	.word	0x20000060

00000af8 <cmd_poke16>:

static void cmd_poke16(){
     af8:	b580      	push	{r7, lr}
     afa:	b082      	sub	sp, #8
     afc:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     afe:	f000 f997 	bl	e30 <word>
	adr=atoi((const char*)pad);
     b02:	480a      	ldr	r0, [pc, #40]	; (b2c <cmd_poke16+0x34>)
     b04:	f7ff fc62 	bl	3cc <atoi>
     b08:	4603      	mov	r3, r0
     b0a:	607b      	str	r3, [r7, #4]
	word();
     b0c:	f000 f990 	bl	e30 <word>
	u16=atoi((const char*)pad);
     b10:	4806      	ldr	r0, [pc, #24]	; (b2c <cmd_poke16+0x34>)
     b12:	f7ff fc5b 	bl	3cc <atoi>
     b16:	4603      	mov	r3, r0
     b18:	b29b      	uxth	r3, r3
     b1a:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     b1c:	1d3b      	adds	r3, r7, #4
     b1e:	1cba      	adds	r2, r7, #2
     b20:	4618      	mov	r0, r3
     b22:	4611      	mov	r1, r2
     b24:	df0f      	svc	15
}
     b26:	3708      	adds	r7, #8
     b28:	46bd      	mov	sp, r7
     b2a:	bd80      	pop	{r7, pc}
     b2c:	20000060 	.word	0x20000060

00000b30 <cmd_poke32>:

static void cmd_poke32(){
     b30:	b580      	push	{r7, lr}
     b32:	b082      	sub	sp, #8
     b34:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     b36:	f000 f97b 	bl	e30 <word>
	adr=atoi((const char*)pad);
     b3a:	480a      	ldr	r0, [pc, #40]	; (b64 <cmd_poke32+0x34>)
     b3c:	f7ff fc46 	bl	3cc <atoi>
     b40:	4603      	mov	r3, r0
     b42:	607b      	str	r3, [r7, #4]
	word();
     b44:	f000 f974 	bl	e30 <word>
	u32=atoi((const char*)pad);
     b48:	4806      	ldr	r0, [pc, #24]	; (b64 <cmd_poke32+0x34>)
     b4a:	f7ff fc3f 	bl	3cc <atoi>
     b4e:	4603      	mov	r3, r0
     b50:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     b52:	1d3b      	adds	r3, r7, #4
     b54:	463a      	mov	r2, r7
     b56:	4618      	mov	r0, r3
     b58:	4611      	mov	r1, r2
     b5a:	df10      	svc	16
}
     b5c:	3708      	adds	r7, #8
     b5e:	46bd      	mov	sp, r7
     b60:	bd80      	pop	{r7, pc}
     b62:	bf00      	nop
     b64:	20000060 	.word	0x20000060

00000b68 <cmd_fwrite>:

static void cmd_fwrite(){
     b68:	b580      	push	{r7, lr}
     b6a:	b082      	sub	sp, #8
     b6c:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	word();
     b6e:	f000 f95f 	bl	e30 <word>
	adr=atoi((const char*)pad);
     b72:	480d      	ldr	r0, [pc, #52]	; (ba8 <cmd_fwrite+0x40>)
     b74:	f7ff fc2a 	bl	3cc <atoi>
     b78:	4603      	mov	r3, r0
     b7a:	607b      	str	r3, [r7, #4]
	word();
     b7c:	f000 f958 	bl	e30 <word>
	u32=atoi((const char*)pad);
     b80:	4809      	ldr	r0, [pc, #36]	; (ba8 <cmd_fwrite+0x40>)
     b82:	f7ff fc23 	bl	3cc <atoi>
     b86:	4603      	mov	r3, r0
     b88:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_FLASH_WR,&adr,&u32);
     b8a:	1d3b      	adds	r3, r7, #4
     b8c:	463a      	mov	r2, r7
     b8e:	4618      	mov	r0, r3
     b90:	4611      	mov	r1, r2
     b92:	df11      	svc	17
	if (!adr) print(" failed\n");
     b94:	687b      	ldr	r3, [r7, #4]
     b96:	2b00      	cmp	r3, #0
     b98:	d102      	bne.n	ba0 <cmd_fwrite+0x38>
     b9a:	4804      	ldr	r0, [pc, #16]	; (bac <cmd_fwrite+0x44>)
     b9c:	f000 fad6 	bl	114c <print>
}
     ba0:	3708      	adds	r7, #8
     ba2:	46bd      	mov	sp, r7
     ba4:	bd80      	pop	{r7, pc}
     ba6:	bf00      	nop
     ba8:	20000060 	.word	0x20000060
     bac:	000028d0 	.word	0x000028d0

00000bb0 <cmd_pgerase>:

static void cmd_pgerase(){
     bb0:	b580      	push	{r7, lr}
     bb2:	b082      	sub	sp, #8
     bb4:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     bb6:	f000 f93b 	bl	e30 <word>
	adr=atoi((const char*)pad);
     bba:	4809      	ldr	r0, [pc, #36]	; (be0 <cmd_pgerase+0x30>)
     bbc:	f7ff fc06 	bl	3cc <atoi>
     bc0:	4603      	mov	r3, r0
     bc2:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_FLASH_PGER,&adr,0);
     bc4:	1d3b      	adds	r3, r7, #4
     bc6:	2200      	movs	r2, #0
     bc8:	4618      	mov	r0, r3
     bca:	4611      	mov	r1, r2
     bcc:	df12      	svc	18
	if (!adr) print(" failed\n");
     bce:	687b      	ldr	r3, [r7, #4]
     bd0:	2b00      	cmp	r3, #0
     bd2:	d102      	bne.n	bda <cmd_pgerase+0x2a>
     bd4:	4803      	ldr	r0, [pc, #12]	; (be4 <cmd_pgerase+0x34>)
     bd6:	f000 fab9 	bl	114c <print>
}
     bda:	3708      	adds	r7, #8
     bdc:	46bd      	mov	sp, r7
     bde:	bd80      	pop	{r7, pc}
     be0:	20000060 	.word	0x20000060
     be4:	000028d0 	.word	0x000028d0

00000be8 <cmd_ticks>:

static void cmd_ticks(){
     be8:	b480      	push	{r7}
     bea:	af00      	add	r7, sp, #0
	_svc_call(SVC_TICKS,&pad,0);
     bec:	4b04      	ldr	r3, [pc, #16]	; (c00 <cmd_ticks+0x18>)
     bee:	2200      	movs	r2, #0
     bf0:	4618      	mov	r0, r3
     bf2:	4611      	mov	r1, r2
     bf4:	df13      	svc	19
}
     bf6:	46bd      	mov	sp, r7
     bf8:	f85d 7b04 	ldr.w	r7, [sp], #4
     bfc:	4770      	bx	lr
     bfe:	bf00      	nop
     c00:	20000060 	.word	0x20000060

00000c04 <search_command>:
	{"ticks",cmd_ticks},
	{NUL,NUL}
};


int search_command(const char * name){
     c04:	b580      	push	{r7, lr}
     c06:	b084      	sub	sp, #16
     c08:	af00      	add	r7, sp, #0
     c0a:	6078      	str	r0, [r7, #4]
	int i=0;
     c0c:	2300      	movs	r3, #0
     c0e:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     c10:	e00e      	b.n	c30 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     c12:	4a12      	ldr	r2, [pc, #72]	; (c5c <search_command+0x58>)
     c14:	68fb      	ldr	r3, [r7, #12]
     c16:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     c1a:	4618      	mov	r0, r3
     c1c:	6879      	ldr	r1, [r7, #4]
     c1e:	f7ff fb57 	bl	2d0 <strcmp>
     c22:	4603      	mov	r3, r0
     c24:	2b00      	cmp	r3, #0
     c26:	d100      	bne.n	c2a <search_command+0x26>
			break;
     c28:	e009      	b.n	c3e <search_command+0x3a>
		}
		i++;
     c2a:	68fb      	ldr	r3, [r7, #12]
     c2c:	3301      	adds	r3, #1
     c2e:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     c30:	4a0a      	ldr	r2, [pc, #40]	; (c5c <search_command+0x58>)
     c32:	68fb      	ldr	r3, [r7, #12]
     c34:	00db      	lsls	r3, r3, #3
     c36:	4413      	add	r3, r2
     c38:	685b      	ldr	r3, [r3, #4]
     c3a:	2b00      	cmp	r3, #0
     c3c:	d1e9      	bne.n	c12 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     c3e:	4a07      	ldr	r2, [pc, #28]	; (c5c <search_command+0x58>)
     c40:	68fb      	ldr	r3, [r7, #12]
     c42:	00db      	lsls	r3, r3, #3
     c44:	4413      	add	r3, r2
     c46:	685b      	ldr	r3, [r3, #4]
     c48:	2b00      	cmp	r3, #0
     c4a:	d102      	bne.n	c52 <search_command+0x4e>
     c4c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     c50:	60fb      	str	r3, [r7, #12]
	return i;
     c52:	68fb      	ldr	r3, [r7, #12]
}
     c54:	4618      	mov	r0, r3
     c56:	3710      	adds	r7, #16
     c58:	46bd      	mov	sp, r7
     c5a:	bd80      	pop	{r7, pc}
     c5c:	00002984 	.word	0x00002984

00000c60 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     c60:	b480      	push	{r7}
     c62:	b085      	sub	sp, #20
     c64:	af00      	add	r7, sp, #0
     c66:	60f8      	str	r0, [r7, #12]
     c68:	60b9      	str	r1, [r7, #8]
     c6a:	4613      	mov	r3, r2
     c6c:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     c6e:	e002      	b.n	c76 <skip+0x16>
     c70:	68bb      	ldr	r3, [r7, #8]
     c72:	3301      	adds	r3, #1
     c74:	60bb      	str	r3, [r7, #8]
     c76:	68bb      	ldr	r3, [r7, #8]
     c78:	68fa      	ldr	r2, [r7, #12]
     c7a:	4413      	add	r3, r2
     c7c:	781b      	ldrb	r3, [r3, #0]
     c7e:	2b00      	cmp	r3, #0
     c80:	d006      	beq.n	c90 <skip+0x30>
     c82:	68bb      	ldr	r3, [r7, #8]
     c84:	68fa      	ldr	r2, [r7, #12]
     c86:	4413      	add	r3, r2
     c88:	781b      	ldrb	r3, [r3, #0]
     c8a:	79fa      	ldrb	r2, [r7, #7]
     c8c:	429a      	cmp	r2, r3
     c8e:	d0ef      	beq.n	c70 <skip+0x10>
	return start;
     c90:	68bb      	ldr	r3, [r7, #8]
}
     c92:	4618      	mov	r0, r3
     c94:	3714      	adds	r7, #20
     c96:	46bd      	mov	sp, r7
     c98:	f85d 7b04 	ldr.w	r7, [sp], #4
     c9c:	4770      	bx	lr
     c9e:	bf00      	nop

00000ca0 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     ca0:	b480      	push	{r7}
     ca2:	b085      	sub	sp, #20
     ca4:	af00      	add	r7, sp, #0
     ca6:	60f8      	str	r0, [r7, #12]
     ca8:	60b9      	str	r1, [r7, #8]
     caa:	4613      	mov	r3, r2
     cac:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     cae:	e002      	b.n	cb6 <scan+0x16>
     cb0:	68bb      	ldr	r3, [r7, #8]
     cb2:	3301      	adds	r3, #1
     cb4:	60bb      	str	r3, [r7, #8]
     cb6:	68bb      	ldr	r3, [r7, #8]
     cb8:	68fa      	ldr	r2, [r7, #12]
     cba:	4413      	add	r3, r2
     cbc:	781b      	ldrb	r3, [r3, #0]
     cbe:	2b00      	cmp	r3, #0
     cc0:	d006      	beq.n	cd0 <scan+0x30>
     cc2:	68bb      	ldr	r3, [r7, #8]
     cc4:	68fa      	ldr	r2, [r7, #12]
     cc6:	4413      	add	r3, r2
     cc8:	781b      	ldrb	r3, [r3, #0]
     cca:	79fa      	ldrb	r2, [r7, #7]
     ccc:	429a      	cmp	r2, r3
     cce:	d1ef      	bne.n	cb0 <scan+0x10>
	return start;
     cd0:	68bb      	ldr	r3, [r7, #8]
}
     cd2:	4618      	mov	r0, r3
     cd4:	3714      	adds	r7, #20
     cd6:	46bd      	mov	sp, r7
     cd8:	f85d 7b04 	ldr.w	r7, [sp], #4
     cdc:	4770      	bx	lr
     cde:	bf00      	nop

00000ce0 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     ce0:	b480      	push	{r7}
     ce2:	b087      	sub	sp, #28
     ce4:	af00      	add	r7, sp, #0
     ce6:	6078      	str	r0, [r7, #4]
     ce8:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     cea:	2300      	movs	r3, #0
     cec:	617b      	str	r3, [r7, #20]
     cee:	683b      	ldr	r3, [r7, #0]
     cf0:	613b      	str	r3, [r7, #16]
     cf2:	2300      	movs	r3, #0
     cf4:	60fb      	str	r3, [r7, #12]
     cf6:	2301      	movs	r3, #1
     cf8:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     cfa:	e040      	b.n	d7e <quote+0x9e>
		switch (buffer[end]){
     cfc:	693b      	ldr	r3, [r7, #16]
     cfe:	687a      	ldr	r2, [r7, #4]
     d00:	4413      	add	r3, r2
     d02:	781b      	ldrb	r3, [r3, #0]
     d04:	2b5c      	cmp	r3, #92	; 0x5c
     d06:	d012      	beq.n	d2e <quote+0x4e>
     d08:	2b6e      	cmp	r3, #110	; 0x6e
     d0a:	d022      	beq.n	d52 <quote+0x72>
     d0c:	2b22      	cmp	r3, #34	; 0x22
     d0e:	d128      	bne.n	d62 <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     d10:	697b      	ldr	r3, [r7, #20]
     d12:	2b00      	cmp	r3, #0
     d14:	d102      	bne.n	d1c <quote+0x3c>
     d16:	2300      	movs	r3, #0
     d18:	60bb      	str	r3, [r7, #8]
			break;
     d1a:	e02d      	b.n	d78 <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     d1c:	68fb      	ldr	r3, [r7, #12]
     d1e:	1c5a      	adds	r2, r3, #1
     d20:	60fa      	str	r2, [r7, #12]
     d22:	4a21      	ldr	r2, [pc, #132]	; (da8 <quote+0xc8>)
     d24:	2122      	movs	r1, #34	; 0x22
     d26:	54d1      	strb	r1, [r2, r3]
     d28:	2300      	movs	r3, #0
     d2a:	617b      	str	r3, [r7, #20]
			break;
     d2c:	e024      	b.n	d78 <quote+0x98>
		case '\\':
			if (!escaped){
     d2e:	697b      	ldr	r3, [r7, #20]
     d30:	2b00      	cmp	r3, #0
     d32:	d102      	bne.n	d3a <quote+0x5a>
				escaped=1;
     d34:	2301      	movs	r3, #1
     d36:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     d38:	e01e      	b.n	d78 <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     d3a:	2300      	movs	r3, #0
     d3c:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     d3e:	68fb      	ldr	r3, [r7, #12]
     d40:	1c5a      	adds	r2, r3, #1
     d42:	60fa      	str	r2, [r7, #12]
     d44:	693a      	ldr	r2, [r7, #16]
     d46:	6879      	ldr	r1, [r7, #4]
     d48:	440a      	add	r2, r1
     d4a:	7811      	ldrb	r1, [r2, #0]
     d4c:	4a16      	ldr	r2, [pc, #88]	; (da8 <quote+0xc8>)
     d4e:	54d1      	strb	r1, [r2, r3]
			}
			break;
     d50:	e012      	b.n	d78 <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     d52:	697b      	ldr	r3, [r7, #20]
     d54:	2b00      	cmp	r3, #0
     d56:	d004      	beq.n	d62 <quote+0x82>
     d58:	693b      	ldr	r3, [r7, #16]
     d5a:	687a      	ldr	r2, [r7, #4]
     d5c:	4413      	add	r3, r2
     d5e:	220d      	movs	r2, #13
     d60:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     d62:	2300      	movs	r3, #0
     d64:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     d66:	68fb      	ldr	r3, [r7, #12]
     d68:	1c5a      	adds	r2, r3, #1
     d6a:	60fa      	str	r2, [r7, #12]
     d6c:	693a      	ldr	r2, [r7, #16]
     d6e:	6879      	ldr	r1, [r7, #4]
     d70:	440a      	add	r2, r1
     d72:	7811      	ldrb	r1, [r2, #0]
     d74:	4a0c      	ldr	r2, [pc, #48]	; (da8 <quote+0xc8>)
     d76:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     d78:	693b      	ldr	r3, [r7, #16]
     d7a:	3301      	adds	r3, #1
     d7c:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     d7e:	693b      	ldr	r3, [r7, #16]
     d80:	687a      	ldr	r2, [r7, #4]
     d82:	4413      	add	r3, r2
     d84:	781b      	ldrb	r3, [r3, #0]
     d86:	2b00      	cmp	r3, #0
     d88:	d002      	beq.n	d90 <quote+0xb0>
     d8a:	68bb      	ldr	r3, [r7, #8]
     d8c:	2b00      	cmp	r3, #0
     d8e:	d1b5      	bne.n	cfc <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     d90:	4a05      	ldr	r2, [pc, #20]	; (da8 <quote+0xc8>)
     d92:	68fb      	ldr	r3, [r7, #12]
     d94:	4413      	add	r3, r2
     d96:	2200      	movs	r2, #0
     d98:	701a      	strb	r2, [r3, #0]
	return end;
     d9a:	693b      	ldr	r3, [r7, #16]
}
     d9c:	4618      	mov	r0, r3
     d9e:	371c      	adds	r7, #28
     da0:	46bd      	mov	sp, r7
     da2:	f85d 7b04 	ldr.w	r7, [sp], #4
     da6:	4770      	bx	lr
     da8:	20000060 	.word	0x20000060

00000dac <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     dac:	b480      	push	{r7}
     dae:	b087      	sub	sp, #28
     db0:	af00      	add	r7, sp, #0
     db2:	60f8      	str	r0, [r7, #12]
     db4:	60b9      	str	r1, [r7, #8]
     db6:	4613      	mov	r3, r2
     db8:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     dba:	68bb      	ldr	r3, [r7, #8]
     dbc:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     dbe:	e002      	b.n	dc6 <next+0x1a>
     dc0:	697b      	ldr	r3, [r7, #20]
     dc2:	3301      	adds	r3, #1
     dc4:	617b      	str	r3, [r7, #20]
     dc6:	697b      	ldr	r3, [r7, #20]
     dc8:	68fa      	ldr	r2, [r7, #12]
     dca:	4413      	add	r3, r2
     dcc:	781b      	ldrb	r3, [r3, #0]
     dce:	2b00      	cmp	r3, #0
     dd0:	d006      	beq.n	de0 <next+0x34>
     dd2:	697b      	ldr	r3, [r7, #20]
     dd4:	68fa      	ldr	r2, [r7, #12]
     dd6:	4413      	add	r3, r2
     dd8:	781b      	ldrb	r3, [r3, #0]
     dda:	79fa      	ldrb	r2, [r7, #7]
     ddc:	429a      	cmp	r2, r3
     dde:	d1ef      	bne.n	dc0 <next+0x14>
	return end-start;
     de0:	697a      	ldr	r2, [r7, #20]
     de2:	68bb      	ldr	r3, [r7, #8]
     de4:	1ad3      	subs	r3, r2, r3
}
     de6:	4618      	mov	r0, r3
     de8:	371c      	adds	r7, #28
     dea:	46bd      	mov	sp, r7
     dec:	f85d 7b04 	ldr.w	r7, [sp], #4
     df0:	4770      	bx	lr
     df2:	bf00      	nop

00000df4 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     df4:	b480      	push	{r7}
     df6:	b085      	sub	sp, #20
     df8:	af00      	add	r7, sp, #0
     dfa:	60f8      	str	r0, [r7, #12]
     dfc:	60b9      	str	r1, [r7, #8]
     dfe:	607a      	str	r2, [r7, #4]
	while (len){
     e00:	e00a      	b.n	e18 <move+0x24>
		*dest++=*src++;
     e02:	68bb      	ldr	r3, [r7, #8]
     e04:	1c5a      	adds	r2, r3, #1
     e06:	60ba      	str	r2, [r7, #8]
     e08:	68fa      	ldr	r2, [r7, #12]
     e0a:	1c51      	adds	r1, r2, #1
     e0c:	60f9      	str	r1, [r7, #12]
     e0e:	7812      	ldrb	r2, [r2, #0]
     e10:	701a      	strb	r2, [r3, #0]
		len--;
     e12:	687b      	ldr	r3, [r7, #4]
     e14:	3b01      	subs	r3, #1
     e16:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     e18:	687b      	ldr	r3, [r7, #4]
     e1a:	2b00      	cmp	r3, #0
     e1c:	d1f1      	bne.n	e02 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     e1e:	68bb      	ldr	r3, [r7, #8]
     e20:	2200      	movs	r2, #0
     e22:	701a      	strb	r2, [r3, #0]
}
     e24:	3714      	adds	r7, #20
     e26:	46bd      	mov	sp, r7
     e28:	f85d 7b04 	ldr.w	r7, [sp], #4
     e2c:	4770      	bx	lr
     e2e:	bf00      	nop

00000e30 <word>:

// extrait le prochain mot du tib
static void word(){
     e30:	b580      	push	{r7, lr}
     e32:	b082      	sub	sp, #8
     e34:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     e36:	4b1d      	ldr	r3, [pc, #116]	; (eac <word+0x7c>)
     e38:	681b      	ldr	r3, [r3, #0]
     e3a:	481d      	ldr	r0, [pc, #116]	; (eb0 <word+0x80>)
     e3c:	4619      	mov	r1, r3
     e3e:	2220      	movs	r2, #32
     e40:	f7ff ff0e 	bl	c60 <skip>
     e44:	4603      	mov	r3, r0
     e46:	461a      	mov	r2, r3
     e48:	4b18      	ldr	r3, [pc, #96]	; (eac <word+0x7c>)
     e4a:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     e4c:	4b17      	ldr	r3, [pc, #92]	; (eac <word+0x7c>)
     e4e:	681b      	ldr	r3, [r3, #0]
     e50:	4a17      	ldr	r2, [pc, #92]	; (eb0 <word+0x80>)
     e52:	5cd3      	ldrb	r3, [r2, r3]
     e54:	2b22      	cmp	r3, #34	; 0x22
     e56:	d10f      	bne.n	e78 <word+0x48>
			in++;
     e58:	4b14      	ldr	r3, [pc, #80]	; (eac <word+0x7c>)
     e5a:	681b      	ldr	r3, [r3, #0]
     e5c:	3301      	adds	r3, #1
     e5e:	4a13      	ldr	r2, [pc, #76]	; (eac <word+0x7c>)
     e60:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     e62:	4b12      	ldr	r3, [pc, #72]	; (eac <word+0x7c>)
     e64:	681b      	ldr	r3, [r3, #0]
     e66:	4812      	ldr	r0, [pc, #72]	; (eb0 <word+0x80>)
     e68:	4619      	mov	r1, r3
     e6a:	f7ff ff39 	bl	ce0 <quote>
     e6e:	4603      	mov	r3, r0
     e70:	461a      	mov	r2, r3
     e72:	4b0e      	ldr	r3, [pc, #56]	; (eac <word+0x7c>)
     e74:	601a      	str	r2, [r3, #0]
     e76:	e016      	b.n	ea6 <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     e78:	4b0c      	ldr	r3, [pc, #48]	; (eac <word+0x7c>)
     e7a:	681b      	ldr	r3, [r3, #0]
     e7c:	480c      	ldr	r0, [pc, #48]	; (eb0 <word+0x80>)
     e7e:	4619      	mov	r1, r3
     e80:	2220      	movs	r2, #32
     e82:	f7ff ff93 	bl	dac <next>
     e86:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     e88:	4b08      	ldr	r3, [pc, #32]	; (eac <word+0x7c>)
     e8a:	681b      	ldr	r3, [r3, #0]
     e8c:	4a08      	ldr	r2, [pc, #32]	; (eb0 <word+0x80>)
     e8e:	4413      	add	r3, r2
     e90:	4618      	mov	r0, r3
     e92:	4908      	ldr	r1, [pc, #32]	; (eb4 <word+0x84>)
     e94:	687a      	ldr	r2, [r7, #4]
     e96:	f7ff ffad 	bl	df4 <move>
			in+=len;
     e9a:	4b04      	ldr	r3, [pc, #16]	; (eac <word+0x7c>)
     e9c:	681a      	ldr	r2, [r3, #0]
     e9e:	687b      	ldr	r3, [r7, #4]
     ea0:	4413      	add	r3, r2
     ea2:	4a02      	ldr	r2, [pc, #8]	; (eac <word+0x7c>)
     ea4:	6013      	str	r3, [r2, #0]
		}
}
     ea6:	3708      	adds	r7, #8
     ea8:	46bd      	mov	sp, r7
     eaa:	bd80      	pop	{r7, pc}
     eac:	200000b0 	.word	0x200000b0
     eb0:	20000010 	.word	0x20000010
     eb4:	20000060 	.word	0x20000060

00000eb8 <parse_line>:

static void parse_line(unsigned llen){
     eb8:	b580      	push	{r7, lr}
     eba:	b084      	sub	sp, #16
     ebc:	af00      	add	r7, sp, #0
     ebe:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     ec0:	4b14      	ldr	r3, [pc, #80]	; (f14 <parse_line+0x5c>)
     ec2:	2200      	movs	r2, #0
     ec4:	601a      	str	r2, [r3, #0]
	while (in<llen){
     ec6:	e019      	b.n	efc <parse_line+0x44>
		word();
     ec8:	f7ff ffb2 	bl	e30 <word>
		cmd_id=search_command((const char*) pad);
     ecc:	4812      	ldr	r0, [pc, #72]	; (f18 <parse_line+0x60>)
     ece:	f7ff fe99 	bl	c04 <search_command>
     ed2:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     ed4:	68fb      	ldr	r3, [r7, #12]
     ed6:	2b00      	cmp	r3, #0
     ed8:	db06      	blt.n	ee8 <parse_line+0x30>
			commands[cmd_id].fn();
     eda:	4a10      	ldr	r2, [pc, #64]	; (f1c <parse_line+0x64>)
     edc:	68fb      	ldr	r3, [r7, #12]
     ede:	00db      	lsls	r3, r3, #3
     ee0:	4413      	add	r3, r2
     ee2:	685b      	ldr	r3, [r3, #4]
     ee4:	4798      	blx	r3
     ee6:	e009      	b.n	efc <parse_line+0x44>
		}else{
			conout(CR);
     ee8:	200d      	movs	r0, #13
     eea:	f000 f8fd 	bl	10e8 <conout>
			print((const char*)pad); conout('?');
     eee:	480a      	ldr	r0, [pc, #40]	; (f18 <parse_line+0x60>)
     ef0:	f000 f92c 	bl	114c <print>
     ef4:	203f      	movs	r0, #63	; 0x3f
     ef6:	f000 f8f7 	bl	10e8 <conout>
			break;
     efa:	e004      	b.n	f06 <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     efc:	4b05      	ldr	r3, [pc, #20]	; (f14 <parse_line+0x5c>)
     efe:	681a      	ldr	r2, [r3, #0]
     f00:	687b      	ldr	r3, [r7, #4]
     f02:	429a      	cmp	r2, r3
     f04:	d3e0      	bcc.n	ec8 <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     f06:	200d      	movs	r0, #13
     f08:	f000 f8ee 	bl	10e8 <conout>
}
     f0c:	3710      	adds	r7, #16
     f0e:	46bd      	mov	sp, r7
     f10:	bd80      	pop	{r7, pc}
     f12:	bf00      	nop
     f14:	200000b0 	.word	0x200000b0
     f18:	20000060 	.word	0x20000060
     f1c:	00002984 	.word	0x00002984

00000f20 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     f20:	b480      	push	{r7}
     f22:	b085      	sub	sp, #20
     f24:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     f26:	4b0c      	ldr	r3, [pc, #48]	; (f58 <copy_blink_in_ram+0x38>)
     f28:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     f2a:	4b0c      	ldr	r3, [pc, #48]	; (f5c <copy_blink_in_ram+0x3c>)
     f2c:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     f2e:	4b0c      	ldr	r3, [pc, #48]	; (f60 <copy_blink_in_ram+0x40>)
     f30:	60bb      	str	r3, [r7, #8]
	while (start<end){
     f32:	e007      	b.n	f44 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     f34:	68bb      	ldr	r3, [r7, #8]
     f36:	1d1a      	adds	r2, r3, #4
     f38:	60ba      	str	r2, [r7, #8]
     f3a:	68fa      	ldr	r2, [r7, #12]
     f3c:	1d11      	adds	r1, r2, #4
     f3e:	60f9      	str	r1, [r7, #12]
     f40:	6812      	ldr	r2, [r2, #0]
     f42:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     f44:	68fa      	ldr	r2, [r7, #12]
     f46:	687b      	ldr	r3, [r7, #4]
     f48:	429a      	cmp	r2, r3
     f4a:	d3f3      	bcc.n	f34 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     f4c:	3714      	adds	r7, #20
     f4e:	46bd      	mov	sp, r7
     f50:	f85d 7b04 	ldr.w	r7, [sp], #4
     f54:	4770      	bx	lr
     f56:	bf00      	nop
     f58:	00003000 	.word	0x00003000
     f5c:	00003080 	.word	0x00003080
     f60:	20002700 	.word	0x20002700

00000f64 <main>:

extern void print_fault(const char *msg, sfrp_t adr);

void main(void){
     f64:	b580      	push	{r7, lr}
     f66:	b082      	sub	sp, #8
     f68:	af00      	add	r7, sp, #0
	set_sysclock();
     f6a:	f7ff fc11 	bl	790 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     f6e:	f06f 000a 	mvn.w	r0, #10
     f72:	210f      	movs	r1, #15
     f74:	f001 f81a 	bl	1fac <set_int_priority>
	config_systicks();
     f78:	f7ff fc42 	bl	800 <config_systicks>
	flash_enable();
     f7c:	f000 fac4 	bl	1508 <flash_enable>
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
     f80:	4b24      	ldr	r3, [pc, #144]	; (1014 <main+0xb0>)
     f82:	221d      	movs	r2, #29
     f84:	619a      	str	r2, [r3, #24]
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
     f86:	4b23      	ldr	r3, [pc, #140]	; (1014 <main+0xb0>)
     f88:	f44f 4280 	mov.w	r2, #16384	; 0x4000
     f8c:	61da      	str	r2, [r3, #28]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     f8e:	4a21      	ldr	r2, [pc, #132]	; (1014 <main+0xb0>)
     f90:	4b20      	ldr	r3, [pc, #128]	; (1014 <main+0xb0>)
     f92:	695b      	ldr	r3, [r3, #20]
     f94:	f043 0301 	orr.w	r3, r3, #1
     f98:	6153      	str	r3, [r2, #20]
	config_pin(GPIOC,LED_PIN,OUTPUT_OD_SLOW);
     f9a:	2002      	movs	r0, #2
     f9c:	210d      	movs	r1, #13
     f9e:	2206      	movs	r2, #6
     fa0:	f000 fc9a 	bl	18d8 <config_pin>
	console_init();
     fa4:	f000 f862 	bl	106c <console_init>
	cls();
     fa8:	f000 f900 	bl	11ac <cls>
	keyboard_init();
     fac:	f000 fcd8 	bl	1960 <keyboard_init>
	tvout_init();
     fb0:	f001 f990 	bl	22d4 <tvout_init>
	print(VERSION);
     fb4:	4b18      	ldr	r3, [pc, #96]	; (1018 <main+0xb4>)
     fb6:	681b      	ldr	r3, [r3, #0]
     fb8:	4618      	mov	r0, r3
     fba:	f000 f8c7 	bl	114c <print>
	copy_blink_in_ram();
     fbe:	f7ff ffaf 	bl	f20 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
     fc2:	4816      	ldr	r0, [pc, #88]	; (101c <main+0xb8>)
     fc4:	f000 f8c2 	bl	114c <print>
     fc8:	4b15      	ldr	r3, [pc, #84]	; (1020 <main+0xbc>)
     fca:	2200      	movs	r2, #0
     fcc:	4618      	mov	r0, r3
     fce:	4611      	mov	r1, r2
     fd0:	df0a      	svc	10
     fd2:	200d      	movs	r0, #13
     fd4:	f000 f888 	bl	10e8 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     fd8:	2300      	movs	r3, #0
     fda:	2200      	movs	r2, #0
     fdc:	4618      	mov	r0, r3
     fde:	4611      	mov	r1, r2
     fe0:	df01      	svc	1
	flush_rx_queue();
     fe2:	f000 fa83 	bl	14ec <flush_rx_queue>
	char c;
	gdi_clear_screen();
     fe6:	f000 fb69 	bl	16bc <gdi_clear_screen>
	gdi_putc('O'); gdi_putc('K');gdi_putc(' ');
     fea:	204f      	movs	r0, #79	; 0x4f
     fec:	f000 fc42 	bl	1874 <gdi_putc>
     ff0:	204b      	movs	r0, #75	; 0x4b
     ff2:	f000 fc3f 	bl	1874 <gdi_putc>
     ff6:	2020      	movs	r0, #32
     ff8:	f000 fc3c 	bl	1874 <gdi_putc>
	while (1){
		c=kbd_getc();
     ffc:	f000 fd00 	bl	1a00 <kbd_getc>
    1000:	4603      	mov	r3, r0
    1002:	71fb      	strb	r3, [r7, #7]
		if (c){
    1004:	79fb      	ldrb	r3, [r7, #7]
    1006:	2b00      	cmp	r3, #0
    1008:	d003      	beq.n	1012 <main+0xae>
			gdi_putc(c);
    100a:	79fb      	ldrb	r3, [r7, #7]
    100c:	4618      	mov	r0, r3
    100e:	f000 fc31 	bl	1874 <gdi_putc>
		}
	 }
    1012:	e7f3      	b.n	ffc <main+0x98>
    1014:	40021000 	.word	0x40021000
    1018:	20000000 	.word	0x20000000
    101c:	00002a34 	.word	0x00002a34
    1020:	20000130 	.word	0x20000130

00001024 <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void CON_handler(){
    1024:	b480      	push	{r7}
    1026:	af00      	add	r7, sp, #0
	if (CON->SR&USART_SR_RXNE){
    1028:	4b0e      	ldr	r3, [pc, #56]	; (1064 <USART2_handler+0x40>)
    102a:	681b      	ldr	r3, [r3, #0]
    102c:	f003 0320 	and.w	r3, r3, #32
    1030:	2b00      	cmp	r3, #0
    1032:	d012      	beq.n	105a <USART2_handler+0x36>
		rx_queue.queue[rx_queue.head++]=CON->DR&0x7f;
    1034:	4b0c      	ldr	r3, [pc, #48]	; (1068 <USART2_handler+0x44>)
    1036:	6a1b      	ldr	r3, [r3, #32]
    1038:	1c5a      	adds	r2, r3, #1
    103a:	490b      	ldr	r1, [pc, #44]	; (1068 <USART2_handler+0x44>)
    103c:	620a      	str	r2, [r1, #32]
    103e:	4a09      	ldr	r2, [pc, #36]	; (1064 <USART2_handler+0x40>)
    1040:	6852      	ldr	r2, [r2, #4]
    1042:	b2d2      	uxtb	r2, r2
    1044:	f002 027f 	and.w	r2, r2, #127	; 0x7f
    1048:	b2d1      	uxtb	r1, r2
    104a:	4a07      	ldr	r2, [pc, #28]	; (1068 <USART2_handler+0x44>)
    104c:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
    104e:	4b06      	ldr	r3, [pc, #24]	; (1068 <USART2_handler+0x44>)
    1050:	6a1b      	ldr	r3, [r3, #32]
    1052:	f003 031f 	and.w	r3, r3, #31
    1056:	4a04      	ldr	r2, [pc, #16]	; (1068 <USART2_handler+0x44>)
    1058:	6213      	str	r3, [r2, #32]
	}
}
    105a:	46bd      	mov	sp, r7
    105c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1060:	4770      	bx	lr
    1062:	bf00      	nop
    1064:	40004400 	.word	0x40004400
    1068:	200000b4 	.word	0x200000b4

0000106c <console_init>:

void console_init(){
    106c:	b580      	push	{r7, lr}
    106e:	af00      	add	r7, sp, #0
	// activation clock USART2
	RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    1070:	4a1a      	ldr	r2, [pc, #104]	; (10dc <console_init+0x70>)
    1072:	4b1a      	ldr	r3, [pc, #104]	; (10dc <console_init+0x70>)
    1074:	69db      	ldr	r3, [r3, #28]
    1076:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    107a:	61d3      	str	r3, [r2, #28]
	//configure USART pins
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    107c:	4a17      	ldr	r2, [pc, #92]	; (10dc <console_init+0x70>)
    107e:	4b17      	ldr	r3, [pc, #92]	; (10dc <console_init+0x70>)
    1080:	699b      	ldr	r3, [r3, #24]
    1082:	f043 0304 	orr.w	r3, r3, #4
    1086:	6193      	str	r3, [r2, #24]
	// PA0 -> CTS input   (floating)
	// PA1 -> RTS output  (push-pull)
	// PA2 -> TX  output (push-pull)
	// PA3 -> RX input (floating)
	usart_set_baud(CON,115200);
    1088:	4815      	ldr	r0, [pc, #84]	; (10e0 <console_init+0x74>)
    108a:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
    108e:	f001 fab1 	bl	25f4 <usart_set_baud>
	CON_PORT->CRL&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    1092:	4a14      	ldr	r2, [pc, #80]	; (10e4 <console_init+0x78>)
    1094:	4b13      	ldr	r3, [pc, #76]	; (10e4 <console_init+0x78>)
    1096:	681b      	ldr	r3, [r3, #0]
    1098:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    109c:	6013      	str	r3, [r2, #0]
	CON_PORT->CRL|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    109e:	4a11      	ldr	r2, [pc, #68]	; (10e4 <console_init+0x78>)
    10a0:	4b10      	ldr	r3, [pc, #64]	; (10e4 <console_init+0x78>)
    10a2:	681b      	ldr	r3, [r3, #0]
    10a4:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    10a8:	6013      	str	r3, [r2, #0]
	CON->CR1|=USART_CR1_TE|USART_CR1_RE|USART_CR1_RXNEIE;
    10aa:	4a0d      	ldr	r2, [pc, #52]	; (10e0 <console_init+0x74>)
    10ac:	4b0c      	ldr	r3, [pc, #48]	; (10e0 <console_init+0x74>)
    10ae:	68db      	ldr	r3, [r3, #12]
    10b0:	f043 032c 	orr.w	r3, r3, #44	; 0x2c
    10b4:	60d3      	str	r3, [r2, #12]
	CON->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    10b6:	4b0a      	ldr	r3, [pc, #40]	; (10e0 <console_init+0x74>)
    10b8:	f44f 7240 	mov.w	r2, #768	; 0x300
    10bc:	615a      	str	r2, [r3, #20]
	set_int_priority(IRQ_CON,7);
    10be:	2026      	movs	r0, #38	; 0x26
    10c0:	2107      	movs	r1, #7
    10c2:	f000 ff73 	bl	1fac <set_int_priority>
	enable_interrupt(IRQ_CON);
    10c6:	2026      	movs	r0, #38	; 0x26
    10c8:	f000 ff28 	bl	1f1c <enable_interrupt>
	CON->CR1|=USART_CR1_UE;
    10cc:	4a04      	ldr	r2, [pc, #16]	; (10e0 <console_init+0x74>)
    10ce:	4b04      	ldr	r3, [pc, #16]	; (10e0 <console_init+0x74>)
    10d0:	68db      	ldr	r3, [r3, #12]
    10d2:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
    10d6:	60d3      	str	r3, [r2, #12]
}
    10d8:	bd80      	pop	{r7, pc}
    10da:	bf00      	nop
    10dc:	40021000 	.word	0x40021000
    10e0:	40004400 	.word	0x40004400
    10e4:	40010800 	.word	0x40010800

000010e8 <conout>:

// envoie d'un caractère à la console
void conout(char c){
    10e8:	b580      	push	{r7, lr}
    10ea:	b082      	sub	sp, #8
    10ec:	af00      	add	r7, sp, #0
    10ee:	4603      	mov	r3, r0
    10f0:	71fb      	strb	r3, [r7, #7]
	usart_putc(CON,c);
    10f2:	79fb      	ldrb	r3, [r7, #7]
    10f4:	4803      	ldr	r0, [pc, #12]	; (1104 <conout+0x1c>)
    10f6:	4619      	mov	r1, r3
    10f8:	f001 fbca 	bl	2890 <usart_putc>
}
    10fc:	3708      	adds	r7, #8
    10fe:	46bd      	mov	sp, r7
    1100:	bd80      	pop	{r7, pc}
    1102:	bf00      	nop
    1104:	40004400 	.word	0x40004400

00001108 <conin>:


// réception d'un caractère de la console
char conin(){
    1108:	b480      	push	{r7}
    110a:	b083      	sub	sp, #12
    110c:	af00      	add	r7, sp, #0
	char c=0;
    110e:	2300      	movs	r3, #0
    1110:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
    1112:	4b0d      	ldr	r3, [pc, #52]	; (1148 <conin+0x40>)
    1114:	6a1a      	ldr	r2, [r3, #32]
    1116:	4b0c      	ldr	r3, [pc, #48]	; (1148 <conin+0x40>)
    1118:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    111a:	429a      	cmp	r2, r3
    111c:	d00d      	beq.n	113a <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
    111e:	4b0a      	ldr	r3, [pc, #40]	; (1148 <conin+0x40>)
    1120:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1122:	1c5a      	adds	r2, r3, #1
    1124:	4908      	ldr	r1, [pc, #32]	; (1148 <conin+0x40>)
    1126:	624a      	str	r2, [r1, #36]	; 0x24
    1128:	4a07      	ldr	r2, [pc, #28]	; (1148 <conin+0x40>)
    112a:	5cd3      	ldrb	r3, [r2, r3]
    112c:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
    112e:	4b06      	ldr	r3, [pc, #24]	; (1148 <conin+0x40>)
    1130:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1132:	f003 031f 	and.w	r3, r3, #31
    1136:	4a04      	ldr	r2, [pc, #16]	; (1148 <conin+0x40>)
    1138:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
    113a:	79fb      	ldrb	r3, [r7, #7]
}
    113c:	4618      	mov	r0, r3
    113e:	370c      	adds	r7, #12
    1140:	46bd      	mov	sp, r7
    1142:	f85d 7b04 	ldr.w	r7, [sp], #4
    1146:	4770      	bx	lr
    1148:	200000b4 	.word	0x200000b4

0000114c <print>:

// imprime un chaîne sur la console
void print(const char *str){
    114c:	b580      	push	{r7, lr}
    114e:	b082      	sub	sp, #8
    1150:	af00      	add	r7, sp, #0
    1152:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
    1154:	e006      	b.n	1164 <print+0x18>
    1156:	687b      	ldr	r3, [r7, #4]
    1158:	1c5a      	adds	r2, r3, #1
    115a:	607a      	str	r2, [r7, #4]
    115c:	781b      	ldrb	r3, [r3, #0]
    115e:	4618      	mov	r0, r3
    1160:	f7ff ffc2 	bl	10e8 <conout>
    1164:	687b      	ldr	r3, [r7, #4]
    1166:	781b      	ldrb	r3, [r3, #0]
    1168:	2b00      	cmp	r3, #0
    116a:	d1f4      	bne.n	1156 <print+0xa>
}
    116c:	3708      	adds	r7, #8
    116e:	46bd      	mov	sp, r7
    1170:	bd80      	pop	{r7, pc}
    1172:	bf00      	nop

00001174 <beep>:

void beep(){
    1174:	b480      	push	{r7}
    1176:	af00      	add	r7, sp, #0
}
    1178:	46bd      	mov	sp, r7
    117a:	f85d 7b04 	ldr.w	r7, [sp], #4
    117e:	4770      	bx	lr

00001180 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    1180:	b580      	push	{r7, lr}
    1182:	af00      	add	r7, sp, #0
	conout(BS);
    1184:	2008      	movs	r0, #8
    1186:	f7ff ffaf 	bl	10e8 <conout>
	conout(SPACE);
    118a:	2020      	movs	r0, #32
    118c:	f7ff ffac 	bl	10e8 <conout>
	conout(BS);
    1190:	2008      	movs	r0, #8
    1192:	f7ff ffa9 	bl	10e8 <conout>
}
    1196:	bd80      	pop	{r7, pc}

00001198 <esc_seq>:

void esc_seq(){
    1198:	b580      	push	{r7, lr}
    119a:	af00      	add	r7, sp, #0
	conout(ESC);
    119c:	201b      	movs	r0, #27
    119e:	f7ff ffa3 	bl	10e8 <conout>
	conout('[');
    11a2:	205b      	movs	r0, #91	; 0x5b
    11a4:	f7ff ffa0 	bl	10e8 <conout>
}
    11a8:	bd80      	pop	{r7, pc}
    11aa:	bf00      	nop

000011ac <cls>:

// vide l'écran de la console
void cls(){
    11ac:	b580      	push	{r7, lr}
    11ae:	af00      	add	r7, sp, #0
	esc_seq();
    11b0:	f7ff fff2 	bl	1198 <esc_seq>
	conout('2');
    11b4:	2032      	movs	r0, #50	; 0x32
    11b6:	f7ff ff97 	bl	10e8 <conout>
	conout('J');
    11ba:	204a      	movs	r0, #74	; 0x4a
    11bc:	f7ff ff94 	bl	10e8 <conout>
}
    11c0:	bd80      	pop	{r7, pc}
    11c2:	bf00      	nop

000011c4 <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
    11c4:	b580      	push	{r7, lr}
    11c6:	b082      	sub	sp, #8
    11c8:	af00      	add	r7, sp, #0
    11ca:	6078      	str	r0, [r7, #4]
	esc_seq();
    11cc:	f7ff ffe4 	bl	1198 <esc_seq>
	conout('2');
    11d0:	2032      	movs	r0, #50	; 0x32
    11d2:	f7ff ff89 	bl	10e8 <conout>
	conout('K');
    11d6:	204b      	movs	r0, #75	; 0x4b
    11d8:	f7ff ff86 	bl	10e8 <conout>
	while (n){conout(BS);n--;}
    11dc:	e005      	b.n	11ea <clear_line+0x26>
    11de:	2008      	movs	r0, #8
    11e0:	f7ff ff82 	bl	10e8 <conout>
    11e4:	687b      	ldr	r3, [r7, #4]
    11e6:	3b01      	subs	r3, #1
    11e8:	607b      	str	r3, [r7, #4]
    11ea:	687b      	ldr	r3, [r7, #4]
    11ec:	2b00      	cmp	r3, #0
    11ee:	d1f6      	bne.n	11de <clear_line+0x1a>
}
    11f0:	3708      	adds	r7, #8
    11f2:	46bd      	mov	sp, r7
    11f4:	bd80      	pop	{r7, pc}
    11f6:	bf00      	nop

000011f8 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    11f8:	b580      	push	{r7, lr}
    11fa:	b084      	sub	sp, #16
    11fc:	af00      	add	r7, sp, #0
    11fe:	6078      	str	r0, [r7, #4]
    1200:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    1202:	2300      	movs	r3, #0
    1204:	60fb      	str	r3, [r7, #12]
	char c=0;
    1206:	2300      	movs	r3, #0
    1208:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    120a:	683b      	ldr	r3, [r7, #0]
    120c:	3b01      	subs	r3, #1
    120e:	603b      	str	r3, [r7, #0]
	while (c!=13){
    1210:	e08e      	b.n	1330 <read_line+0x138>
			c=conin();
    1212:	f7ff ff79 	bl	1108 <conin>
    1216:	4603      	mov	r3, r0
    1218:	72fb      	strb	r3, [r7, #11]
			switch(c){
    121a:	7afb      	ldrb	r3, [r7, #11]
    121c:	2b18      	cmp	r3, #24
    121e:	d872      	bhi.n	1306 <read_line+0x10e>
    1220:	a201      	add	r2, pc, #4	; (adr r2, 1228 <read_line+0x30>)
    1222:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1226:	bf00      	nop
    1228:	00001331 	.word	0x00001331
    122c:	00001307 	.word	0x00001307
    1230:	00001307 	.word	0x00001307
    1234:	00001307 	.word	0x00001307
    1238:	00001307 	.word	0x00001307
    123c:	000012f9 	.word	0x000012f9
    1240:	00001307 	.word	0x00001307
    1244:	00001307 	.word	0x00001307
    1248:	000012e7 	.word	0x000012e7
    124c:	00001303 	.word	0x00001303
    1250:	0000128d 	.word	0x0000128d
    1254:	00001307 	.word	0x00001307
    1258:	00001307 	.word	0x00001307
    125c:	0000128d 	.word	0x0000128d
    1260:	00001307 	.word	0x00001307
    1264:	00001307 	.word	0x00001307
    1268:	00001307 	.word	0x00001307
    126c:	00001307 	.word	0x00001307
    1270:	00001307 	.word	0x00001307
    1274:	00001307 	.word	0x00001307
    1278:	00001307 	.word	0x00001307
    127c:	0000129b 	.word	0x0000129b
    1280:	00001307 	.word	0x00001307
    1284:	000012b1 	.word	0x000012b1
    1288:	0000129b 	.word	0x0000129b
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    128c:	230d      	movs	r3, #13
    128e:	72fb      	strb	r3, [r7, #11]
				conout(c);
    1290:	7afb      	ldrb	r3, [r7, #11]
    1292:	4618      	mov	r0, r3
    1294:	f7ff ff28 	bl	10e8 <conout>
				break;
    1298:	e04a      	b.n	1330 <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
    129a:	68f8      	ldr	r0, [r7, #12]
    129c:	f7ff ff92 	bl	11c4 <clear_line>
				line_len=0;
    12a0:	2300      	movs	r3, #0
    12a2:	60fb      	str	r3, [r7, #12]
				break;
    12a4:	e044      	b.n	1330 <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    12a6:	f7ff ff6b 	bl	1180 <delete_back>
					line_len--;
    12aa:	68fb      	ldr	r3, [r7, #12]
    12ac:	3b01      	subs	r3, #1
    12ae:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    12b0:	68fb      	ldr	r3, [r7, #12]
    12b2:	2b00      	cmp	r3, #0
    12b4:	d006      	beq.n	12c4 <read_line+0xcc>
    12b6:	68fb      	ldr	r3, [r7, #12]
    12b8:	3b01      	subs	r3, #1
    12ba:	687a      	ldr	r2, [r7, #4]
    12bc:	4413      	add	r3, r2
    12be:	781b      	ldrb	r3, [r3, #0]
    12c0:	2b20      	cmp	r3, #32
    12c2:	d0f0      	beq.n	12a6 <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    12c4:	e004      	b.n	12d0 <read_line+0xd8>
					delete_back();
    12c6:	f7ff ff5b 	bl	1180 <delete_back>
					line_len--;
    12ca:	68fb      	ldr	r3, [r7, #12]
    12cc:	3b01      	subs	r3, #1
    12ce:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    12d0:	68fb      	ldr	r3, [r7, #12]
    12d2:	2b00      	cmp	r3, #0
    12d4:	d006      	beq.n	12e4 <read_line+0xec>
    12d6:	68fb      	ldr	r3, [r7, #12]
    12d8:	3b01      	subs	r3, #1
    12da:	687a      	ldr	r2, [r7, #4]
    12dc:	4413      	add	r3, r2
    12de:	781b      	ldrb	r3, [r3, #0]
    12e0:	2b20      	cmp	r3, #32
    12e2:	d1f0      	bne.n	12c6 <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    12e4:	e024      	b.n	1330 <read_line+0x138>
				case BS:
				if (line_len){
    12e6:	68fb      	ldr	r3, [r7, #12]
    12e8:	2b00      	cmp	r3, #0
    12ea:	d004      	beq.n	12f6 <read_line+0xfe>
					delete_back();
    12ec:	f7ff ff48 	bl	1180 <delete_back>
					line_len--;
    12f0:	68fb      	ldr	r3, [r7, #12]
    12f2:	3b01      	subs	r3, #1
    12f4:	60fb      	str	r3, [r7, #12]
				}
				break;
    12f6:	e01b      	b.n	1330 <read_line+0x138>
				case CTRL_E:
				cls();
    12f8:	f7ff ff58 	bl	11ac <cls>
				line_len=0;
    12fc:	2300      	movs	r3, #0
    12fe:	60fb      	str	r3, [r7, #12]
				break;
    1300:	e016      	b.n	1330 <read_line+0x138>
				case TAB:
				c=SPACE;
    1302:	2320      	movs	r3, #32
    1304:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    1306:	68fa      	ldr	r2, [r7, #12]
    1308:	683b      	ldr	r3, [r7, #0]
    130a:	429a      	cmp	r2, r3
    130c:	d20e      	bcs.n	132c <read_line+0x134>
    130e:	7afb      	ldrb	r3, [r7, #11]
    1310:	2b1f      	cmp	r3, #31
    1312:	d90b      	bls.n	132c <read_line+0x134>
					buffer[line_len++]=c;
    1314:	68fb      	ldr	r3, [r7, #12]
    1316:	1c5a      	adds	r2, r3, #1
    1318:	60fa      	str	r2, [r7, #12]
    131a:	687a      	ldr	r2, [r7, #4]
    131c:	4413      	add	r3, r2
    131e:	7afa      	ldrb	r2, [r7, #11]
    1320:	701a      	strb	r2, [r3, #0]
					conout(c);
    1322:	7afb      	ldrb	r3, [r7, #11]
    1324:	4618      	mov	r0, r3
    1326:	f7ff fedf 	bl	10e8 <conout>
    132a:	e001      	b.n	1330 <read_line+0x138>
				}else{
					beep();
    132c:	f7ff ff22 	bl	1174 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    1330:	7afb      	ldrb	r3, [r7, #11]
    1332:	2b0d      	cmp	r3, #13
    1334:	f47f af6d 	bne.w	1212 <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1338:	687a      	ldr	r2, [r7, #4]
    133a:	68fb      	ldr	r3, [r7, #12]
    133c:	4413      	add	r3, r2
    133e:	2200      	movs	r2, #0
    1340:	701a      	strb	r2, [r3, #0]
	return line_len;
    1342:	68fb      	ldr	r3, [r7, #12]
}
    1344:	4618      	mov	r0, r3
    1346:	3710      	adds	r7, #16
    1348:	46bd      	mov	sp, r7
    134a:	bd80      	pop	{r7, pc}

0000134c <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    134c:	b580      	push	{r7, lr}
    134e:	b08e      	sub	sp, #56	; 0x38
    1350:	af00      	add	r7, sp, #0
    1352:	6078      	str	r0, [r7, #4]
    1354:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    1356:	2301      	movs	r3, #1
    1358:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    135a:	2322      	movs	r3, #34	; 0x22
    135c:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    135e:	2300      	movs	r3, #0
    1360:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1364:	687b      	ldr	r3, [r7, #4]
    1366:	2b00      	cmp	r3, #0
    1368:	da05      	bge.n	1376 <print_int+0x2a>
    136a:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    136e:	637b      	str	r3, [r7, #52]	; 0x34
    1370:	687b      	ldr	r3, [r7, #4]
    1372:	425b      	negs	r3, r3
    1374:	607b      	str	r3, [r7, #4]
	while (i){
    1376:	e02c      	b.n	13d2 <print_int+0x86>
		fmt[pos]=i%base+'0';
    1378:	687b      	ldr	r3, [r7, #4]
    137a:	683a      	ldr	r2, [r7, #0]
    137c:	fbb3 f2f2 	udiv	r2, r3, r2
    1380:	6839      	ldr	r1, [r7, #0]
    1382:	fb01 f202 	mul.w	r2, r1, r2
    1386:	1a9b      	subs	r3, r3, r2
    1388:	b2db      	uxtb	r3, r3
    138a:	3330      	adds	r3, #48	; 0x30
    138c:	b2d9      	uxtb	r1, r3
    138e:	f107 020c 	add.w	r2, r7, #12
    1392:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1394:	4413      	add	r3, r2
    1396:	460a      	mov	r2, r1
    1398:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    139a:	f107 020c 	add.w	r2, r7, #12
    139e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13a0:	4413      	add	r3, r2
    13a2:	781b      	ldrb	r3, [r3, #0]
    13a4:	2b39      	cmp	r3, #57	; 0x39
    13a6:	d90c      	bls.n	13c2 <print_int+0x76>
    13a8:	f107 020c 	add.w	r2, r7, #12
    13ac:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13ae:	4413      	add	r3, r2
    13b0:	781b      	ldrb	r3, [r3, #0]
    13b2:	3307      	adds	r3, #7
    13b4:	b2d9      	uxtb	r1, r3
    13b6:	f107 020c 	add.w	r2, r7, #12
    13ba:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13bc:	4413      	add	r3, r2
    13be:	460a      	mov	r2, r1
    13c0:	701a      	strb	r2, [r3, #0]
		pos--;
    13c2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13c4:	3b01      	subs	r3, #1
    13c6:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    13c8:	687a      	ldr	r2, [r7, #4]
    13ca:	683b      	ldr	r3, [r7, #0]
    13cc:	fbb2 f3f3 	udiv	r3, r2, r3
    13d0:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    13d2:	687b      	ldr	r3, [r7, #4]
    13d4:	2b00      	cmp	r3, #0
    13d6:	d1cf      	bne.n	1378 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    13d8:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13da:	2b22      	cmp	r3, #34	; 0x22
    13dc:	d108      	bne.n	13f0 <print_int+0xa4>
    13de:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13e0:	1e5a      	subs	r2, r3, #1
    13e2:	633a      	str	r2, [r7, #48]	; 0x30
    13e4:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13e8:	4413      	add	r3, r2
    13ea:	2230      	movs	r2, #48	; 0x30
    13ec:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    13f0:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    13f2:	2b00      	cmp	r3, #0
    13f4:	da08      	bge.n	1408 <print_int+0xbc>
    13f6:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13f8:	1e5a      	subs	r2, r3, #1
    13fa:	633a      	str	r2, [r7, #48]	; 0x30
    13fc:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1400:	4413      	add	r3, r2
    1402:	222d      	movs	r2, #45	; 0x2d
    1404:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    1408:	f107 020c 	add.w	r2, r7, #12
    140c:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    140e:	4413      	add	r3, r2
    1410:	2220      	movs	r2, #32
    1412:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1414:	f107 020c 	add.w	r2, r7, #12
    1418:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    141a:	4413      	add	r3, r2
    141c:	4618      	mov	r0, r3
    141e:	f7ff fe95 	bl	114c <print>
}
    1422:	3738      	adds	r7, #56	; 0x38
    1424:	46bd      	mov	sp, r7
    1426:	bd80      	pop	{r7, pc}

00001428 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    1428:	b580      	push	{r7, lr}
    142a:	b088      	sub	sp, #32
    142c:	af00      	add	r7, sp, #0
    142e:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    1430:	230c      	movs	r3, #12
    1432:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    1434:	2300      	movs	r3, #0
    1436:	767b      	strb	r3, [r7, #25]
	while (u){
    1438:	e026      	b.n	1488 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    143a:	687b      	ldr	r3, [r7, #4]
    143c:	b2db      	uxtb	r3, r3
    143e:	f003 030f 	and.w	r3, r3, #15
    1442:	b2db      	uxtb	r3, r3
    1444:	3330      	adds	r3, #48	; 0x30
    1446:	b2d9      	uxtb	r1, r3
    1448:	f107 020c 	add.w	r2, r7, #12
    144c:	69fb      	ldr	r3, [r7, #28]
    144e:	4413      	add	r3, r2
    1450:	460a      	mov	r2, r1
    1452:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1454:	f107 020c 	add.w	r2, r7, #12
    1458:	69fb      	ldr	r3, [r7, #28]
    145a:	4413      	add	r3, r2
    145c:	781b      	ldrb	r3, [r3, #0]
    145e:	2b39      	cmp	r3, #57	; 0x39
    1460:	d90c      	bls.n	147c <print_hex+0x54>
    1462:	f107 020c 	add.w	r2, r7, #12
    1466:	69fb      	ldr	r3, [r7, #28]
    1468:	4413      	add	r3, r2
    146a:	781b      	ldrb	r3, [r3, #0]
    146c:	3307      	adds	r3, #7
    146e:	b2d9      	uxtb	r1, r3
    1470:	f107 020c 	add.w	r2, r7, #12
    1474:	69fb      	ldr	r3, [r7, #28]
    1476:	4413      	add	r3, r2
    1478:	460a      	mov	r2, r1
    147a:	701a      	strb	r2, [r3, #0]
		pos--;
    147c:	69fb      	ldr	r3, [r7, #28]
    147e:	3b01      	subs	r3, #1
    1480:	61fb      	str	r3, [r7, #28]
		u/=16;
    1482:	687b      	ldr	r3, [r7, #4]
    1484:	091b      	lsrs	r3, r3, #4
    1486:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    1488:	687b      	ldr	r3, [r7, #4]
    148a:	2b00      	cmp	r3, #0
    148c:	d1d5      	bne.n	143a <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    148e:	69fb      	ldr	r3, [r7, #28]
    1490:	2b0c      	cmp	r3, #12
    1492:	d108      	bne.n	14a6 <print_hex+0x7e>
    1494:	69fb      	ldr	r3, [r7, #28]
    1496:	1e5a      	subs	r2, r3, #1
    1498:	61fa      	str	r2, [r7, #28]
    149a:	f107 0220 	add.w	r2, r7, #32
    149e:	4413      	add	r3, r2
    14a0:	2230      	movs	r2, #48	; 0x30
    14a2:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    14a6:	69fb      	ldr	r3, [r7, #28]
    14a8:	1e5a      	subs	r2, r3, #1
    14aa:	61fa      	str	r2, [r7, #28]
    14ac:	f107 0220 	add.w	r2, r7, #32
    14b0:	4413      	add	r3, r2
    14b2:	2278      	movs	r2, #120	; 0x78
    14b4:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    14b8:	69fb      	ldr	r3, [r7, #28]
    14ba:	1e5a      	subs	r2, r3, #1
    14bc:	61fa      	str	r2, [r7, #28]
    14be:	f107 0220 	add.w	r2, r7, #32
    14c2:	4413      	add	r3, r2
    14c4:	2230      	movs	r2, #48	; 0x30
    14c6:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    14ca:	f107 020c 	add.w	r2, r7, #12
    14ce:	69fb      	ldr	r3, [r7, #28]
    14d0:	4413      	add	r3, r2
    14d2:	2220      	movs	r2, #32
    14d4:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    14d6:	f107 020c 	add.w	r2, r7, #12
    14da:	69fb      	ldr	r3, [r7, #28]
    14dc:	4413      	add	r3, r2
    14de:	4618      	mov	r0, r3
    14e0:	f7ff fe34 	bl	114c <print>
}
    14e4:	3720      	adds	r7, #32
    14e6:	46bd      	mov	sp, r7
    14e8:	bd80      	pop	{r7, pc}
    14ea:	bf00      	nop

000014ec <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    14ec:	b480      	push	{r7}
    14ee:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    14f0:	4b04      	ldr	r3, [pc, #16]	; (1504 <flush_rx_queue+0x18>)
    14f2:	2200      	movs	r2, #0
    14f4:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    14f6:	4b03      	ldr	r3, [pc, #12]	; (1504 <flush_rx_queue+0x18>)
    14f8:	2200      	movs	r2, #0
    14fa:	625a      	str	r2, [r3, #36]	; 0x24
}
    14fc:	46bd      	mov	sp, r7
    14fe:	f85d 7b04 	ldr.w	r7, [sp], #4
    1502:	4770      	bx	lr
    1504:	200000b4 	.word	0x200000b4

00001508 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    1508:	b480      	push	{r7}
    150a:	af00      	add	r7, sp, #0
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
    150c:	4b13      	ldr	r3, [pc, #76]	; (155c <flash_enable+0x54>)
    150e:	681b      	ldr	r3, [r3, #0]
    1510:	f003 0301 	and.w	r3, r3, #1
    1514:	2b00      	cmp	r3, #0
    1516:	d10c      	bne.n	1532 <flash_enable+0x2a>
		RCC->CR|=RCC_CR_HSION;
    1518:	4a10      	ldr	r2, [pc, #64]	; (155c <flash_enable+0x54>)
    151a:	4b10      	ldr	r3, [pc, #64]	; (155c <flash_enable+0x54>)
    151c:	681b      	ldr	r3, [r3, #0]
    151e:	f043 0301 	orr.w	r3, r3, #1
    1522:	6013      	str	r3, [r2, #0]
		while (!(RCC->CR&RCC_CR_HSIRDY));
    1524:	bf00      	nop
    1526:	4b0d      	ldr	r3, [pc, #52]	; (155c <flash_enable+0x54>)
    1528:	681b      	ldr	r3, [r3, #0]
    152a:	f003 0302 	and.w	r3, r3, #2
    152e:	2b00      	cmp	r3, #0
    1530:	d0f9      	beq.n	1526 <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    1532:	4b0b      	ldr	r3, [pc, #44]	; (1560 <flash_enable+0x58>)
    1534:	4a0b      	ldr	r2, [pc, #44]	; (1564 <flash_enable+0x5c>)
    1536:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    1538:	4b09      	ldr	r3, [pc, #36]	; (1560 <flash_enable+0x58>)
    153a:	4a0b      	ldr	r2, [pc, #44]	; (1568 <flash_enable+0x60>)
    153c:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    153e:	4b08      	ldr	r3, [pc, #32]	; (1560 <flash_enable+0x58>)
    1540:	691b      	ldr	r3, [r3, #16]
    1542:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1546:	2b00      	cmp	r3, #0
    1548:	bf0c      	ite	eq
    154a:	2301      	moveq	r3, #1
    154c:	2300      	movne	r3, #0
    154e:	b2db      	uxtb	r3, r3
}
    1550:	4618      	mov	r0, r3
    1552:	46bd      	mov	sp, r7
    1554:	f85d 7b04 	ldr.w	r7, [sp], #4
    1558:	4770      	bx	lr
    155a:	bf00      	nop
    155c:	40021000 	.word	0x40021000
    1560:	40022000 	.word	0x40022000
    1564:	45670123 	.word	0x45670123
    1568:	cdef89ab 	.word	0xcdef89ab

0000156c <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    156c:	b480      	push	{r7}
    156e:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    1570:	4a04      	ldr	r2, [pc, #16]	; (1584 <flash_disable+0x18>)
    1572:	4b04      	ldr	r3, [pc, #16]	; (1584 <flash_disable+0x18>)
    1574:	691b      	ldr	r3, [r3, #16]
    1576:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    157a:	6113      	str	r3, [r2, #16]
}
    157c:	46bd      	mov	sp, r7
    157e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1582:	4770      	bx	lr
    1584:	40022000 	.word	0x40022000

00001588 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1588:	b480      	push	{r7}
    158a:	b083      	sub	sp, #12
    158c:	af00      	add	r7, sp, #0
    158e:	6078      	str	r0, [r7, #4]
    1590:	460b      	mov	r3, r1
    1592:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    1594:	4b1d      	ldr	r3, [pc, #116]	; (160c <flash_write+0x84>)
    1596:	691b      	ldr	r3, [r3, #16]
    1598:	f003 0380 	and.w	r3, r3, #128	; 0x80
    159c:	2b00      	cmp	r3, #0
    159e:	d105      	bne.n	15ac <flash_write+0x24>
    15a0:	687b      	ldr	r3, [r7, #4]
    15a2:	881b      	ldrh	r3, [r3, #0]
    15a4:	f64f 72ff 	movw	r2, #65535	; 0xffff
    15a8:	4293      	cmp	r3, r2
    15aa:	d001      	beq.n	15b0 <flash_write+0x28>
    15ac:	2300      	movs	r3, #0
    15ae:	e027      	b.n	1600 <flash_write+0x78>
	while (_flash_busy);
    15b0:	bf00      	nop
    15b2:	4b16      	ldr	r3, [pc, #88]	; (160c <flash_write+0x84>)
    15b4:	68db      	ldr	r3, [r3, #12]
    15b6:	f003 0301 	and.w	r3, r3, #1
    15ba:	2b00      	cmp	r3, #0
    15bc:	d1f9      	bne.n	15b2 <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    15be:	4a13      	ldr	r2, [pc, #76]	; (160c <flash_write+0x84>)
    15c0:	4b12      	ldr	r3, [pc, #72]	; (160c <flash_write+0x84>)
    15c2:	68db      	ldr	r3, [r3, #12]
    15c4:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    15c8:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    15ca:	4b10      	ldr	r3, [pc, #64]	; (160c <flash_write+0x84>)
    15cc:	2201      	movs	r2, #1
    15ce:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    15d0:	687b      	ldr	r3, [r7, #4]
    15d2:	887a      	ldrh	r2, [r7, #2]
    15d4:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    15d6:	bf00      	nop
    15d8:	4b0c      	ldr	r3, [pc, #48]	; (160c <flash_write+0x84>)
    15da:	68db      	ldr	r3, [r3, #12]
    15dc:	f003 0301 	and.w	r3, r3, #1
    15e0:	2b00      	cmp	r3, #0
    15e2:	d005      	beq.n	15f0 <flash_write+0x68>
    15e4:	4b09      	ldr	r3, [pc, #36]	; (160c <flash_write+0x84>)
    15e6:	68db      	ldr	r3, [r3, #12]
    15e8:	f003 0320 	and.w	r3, r3, #32
    15ec:	2b00      	cmp	r3, #0
    15ee:	d0f3      	beq.n	15d8 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    15f0:	687b      	ldr	r3, [r7, #4]
    15f2:	881b      	ldrh	r3, [r3, #0]
    15f4:	887a      	ldrh	r2, [r7, #2]
    15f6:	429a      	cmp	r2, r3
    15f8:	bf0c      	ite	eq
    15fa:	2301      	moveq	r3, #1
    15fc:	2300      	movne	r3, #0
    15fe:	b2db      	uxtb	r3, r3
}
    1600:	4618      	mov	r0, r3
    1602:	370c      	adds	r7, #12
    1604:	46bd      	mov	sp, r7
    1606:	f85d 7b04 	ldr.w	r7, [sp], #4
    160a:	4770      	bx	lr
    160c:	40022000 	.word	0x40022000

00001610 <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    1610:	b480      	push	{r7}
    1612:	b087      	sub	sp, #28
    1614:	af00      	add	r7, sp, #0
    1616:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    1618:	4b27      	ldr	r3, [pc, #156]	; (16b8 <flash_erase_page+0xa8>)
    161a:	691b      	ldr	r3, [r3, #16]
    161c:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1620:	2b00      	cmp	r3, #0
    1622:	d001      	beq.n	1628 <flash_erase_page+0x18>
    1624:	2300      	movs	r3, #0
    1626:	e040      	b.n	16aa <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1628:	4a23      	ldr	r2, [pc, #140]	; (16b8 <flash_erase_page+0xa8>)
    162a:	4b23      	ldr	r3, [pc, #140]	; (16b8 <flash_erase_page+0xa8>)
    162c:	68db      	ldr	r3, [r3, #12]
    162e:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1632:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    1634:	687b      	ldr	r3, [r7, #4]
    1636:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    163a:	f023 0303 	bic.w	r3, r3, #3
    163e:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    1640:	4b1d      	ldr	r3, [pc, #116]	; (16b8 <flash_erase_page+0xa8>)
    1642:	2202      	movs	r2, #2
    1644:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    1646:	4a1c      	ldr	r2, [pc, #112]	; (16b8 <flash_erase_page+0xa8>)
    1648:	687b      	ldr	r3, [r7, #4]
    164a:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    164c:	4a1a      	ldr	r2, [pc, #104]	; (16b8 <flash_erase_page+0xa8>)
    164e:	4b1a      	ldr	r3, [pc, #104]	; (16b8 <flash_erase_page+0xa8>)
    1650:	691b      	ldr	r3, [r3, #16]
    1652:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1656:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    1658:	bf00      	nop
    165a:	4b17      	ldr	r3, [pc, #92]	; (16b8 <flash_erase_page+0xa8>)
    165c:	68db      	ldr	r3, [r3, #12]
    165e:	f003 0301 	and.w	r3, r3, #1
    1662:	2b00      	cmp	r3, #0
    1664:	d005      	beq.n	1672 <flash_erase_page+0x62>
    1666:	4b14      	ldr	r3, [pc, #80]	; (16b8 <flash_erase_page+0xa8>)
    1668:	68db      	ldr	r3, [r3, #12]
    166a:	f003 0320 	and.w	r3, r3, #32
    166e:	2b00      	cmp	r3, #0
    1670:	d0f3      	beq.n	165a <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    1672:	687b      	ldr	r3, [r7, #4]
    1674:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    1676:	2300      	movs	r3, #0
    1678:	60fb      	str	r3, [r7, #12]
    167a:	e00c      	b.n	1696 <flash_erase_page+0x86>
		u32=*adr++;
    167c:	697b      	ldr	r3, [r7, #20]
    167e:	1d1a      	adds	r2, r3, #4
    1680:	617a      	str	r2, [r7, #20]
    1682:	681b      	ldr	r3, [r3, #0]
    1684:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    1686:	693b      	ldr	r3, [r7, #16]
    1688:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    168c:	d000      	beq.n	1690 <flash_erase_page+0x80>
    168e:	e005      	b.n	169c <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    1690:	68fb      	ldr	r3, [r7, #12]
    1692:	3301      	adds	r3, #1
    1694:	60fb      	str	r3, [r7, #12]
    1696:	68fb      	ldr	r3, [r7, #12]
    1698:	2bff      	cmp	r3, #255	; 0xff
    169a:	ddef      	ble.n	167c <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    169c:	693b      	ldr	r3, [r7, #16]
    169e:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    16a2:	bf0c      	ite	eq
    16a4:	2301      	moveq	r3, #1
    16a6:	2300      	movne	r3, #0
    16a8:	b2db      	uxtb	r3, r3
}
    16aa:	4618      	mov	r0, r3
    16ac:	371c      	adds	r7, #28
    16ae:	46bd      	mov	sp, r7
    16b0:	f85d 7b04 	ldr.w	r7, [sp], #4
    16b4:	4770      	bx	lr
    16b6:	bf00      	nop
    16b8:	40022000 	.word	0x40022000

000016bc <gdi_clear_screen>:
#include "gdi.h"

// position  du curseur texte.
static int cursor_x, cursor_y;

void gdi_clear_screen(){
    16bc:	b480      	push	{r7}
    16be:	b083      	sub	sp, #12
    16c0:	af00      	add	r7, sp, #0
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    16c2:	2300      	movs	r3, #0
    16c4:	607b      	str	r3, [r7, #4]
    16c6:	e006      	b.n	16d6 <gdi_clear_screen+0x1a>
		video_buffer[i++]=0;
    16c8:	687b      	ldr	r3, [r7, #4]
    16ca:	1c5a      	adds	r2, r3, #1
    16cc:	607a      	str	r2, [r7, #4]
    16ce:	4a06      	ldr	r2, [pc, #24]	; (16e8 <gdi_clear_screen+0x2c>)
    16d0:	2100      	movs	r1, #0
    16d2:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
// position  du curseur texte.
static int cursor_x, cursor_y;

void gdi_clear_screen(){
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    16d6:	687b      	ldr	r3, [r7, #4]
    16d8:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    16dc:	dbf4      	blt.n	16c8 <gdi_clear_screen+0xc>
		video_buffer[i++]=0;
	}
}
    16de:	370c      	adds	r7, #12
    16e0:	46bd      	mov	sp, r7
    16e2:	f85d 7b04 	ldr.w	r7, [sp], #4
    16e6:	4770      	bx	lr
    16e8:	20000134 	.word	0x20000134

000016ec <gdi_scroll_up>:

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
    16ec:	b480      	push	{r7}
    16ee:	b083      	sub	sp, #12
    16f0:	af00      	add	r7, sp, #0
	int i,j;
	j=0;
    16f2:	2300      	movs	r3, #0
    16f4:	603b      	str	r3, [r7, #0]
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    16f6:	23a0      	movs	r3, #160	; 0xa0
    16f8:	607b      	str	r3, [r7, #4]
    16fa:	e00b      	b.n	1714 <gdi_scroll_up+0x28>
		video_buffer[j++]=video_buffer[i++];
    16fc:	683b      	ldr	r3, [r7, #0]
    16fe:	1c5a      	adds	r2, r3, #1
    1700:	603a      	str	r2, [r7, #0]
    1702:	687a      	ldr	r2, [r7, #4]
    1704:	1c51      	adds	r1, r2, #1
    1706:	6079      	str	r1, [r7, #4]
    1708:	490e      	ldr	r1, [pc, #56]	; (1744 <gdi_scroll_up+0x58>)
    170a:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    170e:	4a0d      	ldr	r2, [pc, #52]	; (1744 <gdi_scroll_up+0x58>)
    1710:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
	int i,j;
	j=0;
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    1714:	687b      	ldr	r3, [r7, #4]
    1716:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    171a:	dbef      	blt.n	16fc <gdi_scroll_up+0x10>
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    171c:	f44f 5391 	mov.w	r3, #4640	; 0x1220
    1720:	607b      	str	r3, [r7, #4]
    1722:	e006      	b.n	1732 <gdi_scroll_up+0x46>
		video_buffer[i++]=0;
    1724:	687b      	ldr	r3, [r7, #4]
    1726:	1c5a      	adds	r2, r3, #1
    1728:	607a      	str	r2, [r7, #4]
    172a:	4a06      	ldr	r2, [pc, #24]	; (1744 <gdi_scroll_up+0x58>)
    172c:	2100      	movs	r1, #0
    172e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i,j;
	j=0;
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1732:	687b      	ldr	r3, [r7, #4]
    1734:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1738:	dbf4      	blt.n	1724 <gdi_scroll_up+0x38>
		video_buffer[i++]=0;
	}
}
    173a:	370c      	adds	r7, #12
    173c:	46bd      	mov	sp, r7
    173e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1742:	4770      	bx	lr
    1744:	20000134 	.word	0x20000134

00001748 <gdi_new_line>:

// avance le curseur texte au début 
// de la ligne suivante.
void gdi_new_line(){
    1748:	b580      	push	{r7, lr}
    174a:	af00      	add	r7, sp, #0
	cursor_x=0;
    174c:	4b08      	ldr	r3, [pc, #32]	; (1770 <gdi_new_line+0x28>)
    174e:	2200      	movs	r2, #0
    1750:	601a      	str	r2, [r3, #0]
	cursor_y+=CHAR_HEIGHT;
    1752:	4b08      	ldr	r3, [pc, #32]	; (1774 <gdi_new_line+0x2c>)
    1754:	681b      	ldr	r3, [r3, #0]
    1756:	3308      	adds	r3, #8
    1758:	4a06      	ldr	r2, [pc, #24]	; (1774 <gdi_new_line+0x2c>)
    175a:	6013      	str	r3, [r2, #0]
	if (cursor_y>(VRES-CHAR_HEIGHT)){
    175c:	4b05      	ldr	r3, [pc, #20]	; (1774 <gdi_new_line+0x2c>)
    175e:	681b      	ldr	r3, [r3, #0]
    1760:	2be8      	cmp	r3, #232	; 0xe8
    1762:	dd04      	ble.n	176e <gdi_new_line+0x26>
		cursor_y=VRES-CHAR_HEIGHT;
    1764:	4b03      	ldr	r3, [pc, #12]	; (1774 <gdi_new_line+0x2c>)
    1766:	22e8      	movs	r2, #232	; 0xe8
    1768:	601a      	str	r2, [r3, #0]
		gdi_scroll_up();
    176a:	f7ff ffbf 	bl	16ec <gdi_scroll_up>
	}
}
    176e:	bd80      	pop	{r7, pc}
    1770:	200000dc 	.word	0x200000dc
    1774:	200000e0 	.word	0x200000e0

00001778 <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
    1778:	b480      	push	{r7}
    177a:	b089      	sub	sp, #36	; 0x24
    177c:	af00      	add	r7, sp, #0
    177e:	60f8      	str	r0, [r7, #12]
    1780:	60b9      	str	r1, [r7, #8]
    1782:	607a      	str	r2, [r7, #4]
    1784:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1786:	2300      	movs	r3, #0
    1788:	61fb      	str	r3, [r7, #28]
    178a:	e067      	b.n	185c <gdi_put_sprite+0xe4>
		mask=128;
    178c:	2380      	movs	r3, #128	; 0x80
    178e:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    1790:	2300      	movs	r3, #0
    1792:	61bb      	str	r3, [r7, #24]
    1794:	e05b      	b.n	184e <gdi_put_sprite+0xd6>
			if (!mask){
    1796:	7dfb      	ldrb	r3, [r7, #23]
    1798:	2b00      	cmp	r3, #0
    179a:	d104      	bne.n	17a6 <gdi_put_sprite+0x2e>
				sprite++;
    179c:	6abb      	ldr	r3, [r7, #40]	; 0x28
    179e:	3301      	adds	r3, #1
    17a0:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    17a2:	2380      	movs	r3, #128	; 0x80
    17a4:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    17a6:	68fa      	ldr	r2, [r7, #12]
    17a8:	69bb      	ldr	r3, [r7, #24]
    17aa:	4413      	add	r3, r2
    17ac:	2b00      	cmp	r3, #0
    17ae:	db48      	blt.n	1842 <gdi_put_sprite+0xca>
    17b0:	68fa      	ldr	r2, [r7, #12]
    17b2:	69bb      	ldr	r3, [r7, #24]
    17b4:	4413      	add	r3, r2
    17b6:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    17ba:	da42      	bge.n	1842 <gdi_put_sprite+0xca>
    17bc:	69fa      	ldr	r2, [r7, #28]
    17be:	68bb      	ldr	r3, [r7, #8]
    17c0:	4413      	add	r3, r2
    17c2:	2b00      	cmp	r3, #0
    17c4:	db3d      	blt.n	1842 <gdi_put_sprite+0xca>
    17c6:	69fa      	ldr	r2, [r7, #28]
    17c8:	68bb      	ldr	r3, [r7, #8]
    17ca:	4413      	add	r3, r2
    17cc:	2bef      	cmp	r3, #239	; 0xef
    17ce:	dc38      	bgt.n	1842 <gdi_put_sprite+0xca>
				bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
    17d0:	69fb      	ldr	r3, [r7, #28]
    17d2:	6aba      	ldr	r2, [r7, #40]	; 0x28
    17d4:	4413      	add	r3, r2
    17d6:	781a      	ldrb	r2, [r3, #0]
    17d8:	7dfb      	ldrb	r3, [r7, #23]
    17da:	4013      	ands	r3, r2
    17dc:	b2db      	uxtb	r3, r3
    17de:	2b00      	cmp	r3, #0
    17e0:	d00a      	beq.n	17f8 <gdi_put_sprite+0x80>
    17e2:	69ba      	ldr	r2, [r7, #24]
    17e4:	68fb      	ldr	r3, [r7, #12]
    17e6:	4413      	add	r3, r2
    17e8:	43db      	mvns	r3, r3
    17ea:	f003 030f 	and.w	r3, r3, #15
    17ee:	2201      	movs	r2, #1
    17f0:	fa02 f303 	lsl.w	r3, r2, r3
    17f4:	b29b      	uxth	r3, r3
    17f6:	e000      	b.n	17fa <gdi_put_sprite+0x82>
    17f8:	2300      	movs	r3, #0
    17fa:	82bb      	strh	r3, [r7, #20]
				video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]^=bit;
    17fc:	69fa      	ldr	r2, [r7, #28]
    17fe:	68bb      	ldr	r3, [r7, #8]
    1800:	441a      	add	r2, r3
    1802:	4613      	mov	r3, r2
    1804:	009b      	lsls	r3, r3, #2
    1806:	4413      	add	r3, r2
    1808:	009b      	lsls	r3, r3, #2
    180a:	4619      	mov	r1, r3
    180c:	69ba      	ldr	r2, [r7, #24]
    180e:	68fb      	ldr	r3, [r7, #12]
    1810:	4413      	add	r3, r2
    1812:	111b      	asrs	r3, r3, #4
    1814:	4419      	add	r1, r3
    1816:	69fa      	ldr	r2, [r7, #28]
    1818:	68bb      	ldr	r3, [r7, #8]
    181a:	441a      	add	r2, r3
    181c:	4613      	mov	r3, r2
    181e:	009b      	lsls	r3, r3, #2
    1820:	4413      	add	r3, r2
    1822:	009b      	lsls	r3, r3, #2
    1824:	4618      	mov	r0, r3
    1826:	69ba      	ldr	r2, [r7, #24]
    1828:	68fb      	ldr	r3, [r7, #12]
    182a:	4413      	add	r3, r2
    182c:	111b      	asrs	r3, r3, #4
    182e:	4403      	add	r3, r0
    1830:	4a0f      	ldr	r2, [pc, #60]	; (1870 <gdi_put_sprite+0xf8>)
    1832:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1836:	8abb      	ldrh	r3, [r7, #20]
    1838:	4053      	eors	r3, r2
    183a:	b29a      	uxth	r2, r3
    183c:	4b0c      	ldr	r3, [pc, #48]	; (1870 <gdi_put_sprite+0xf8>)
    183e:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
			}
			mask>>=1;
    1842:	7dfb      	ldrb	r3, [r7, #23]
    1844:	085b      	lsrs	r3, r3, #1
    1846:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    1848:	69bb      	ldr	r3, [r7, #24]
    184a:	3301      	adds	r3, #1
    184c:	61bb      	str	r3, [r7, #24]
    184e:	69ba      	ldr	r2, [r7, #24]
    1850:	687b      	ldr	r3, [r7, #4]
    1852:	429a      	cmp	r2, r3
    1854:	db9f      	blt.n	1796 <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1856:	69fb      	ldr	r3, [r7, #28]
    1858:	3301      	adds	r3, #1
    185a:	61fb      	str	r3, [r7, #28]
    185c:	69fa      	ldr	r2, [r7, #28]
    185e:	683b      	ldr	r3, [r7, #0]
    1860:	429a      	cmp	r2, r3
    1862:	db93      	blt.n	178c <gdi_put_sprite+0x14>
				video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]^=bit;
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    1864:	3724      	adds	r7, #36	; 0x24
    1866:	46bd      	mov	sp, r7
    1868:	f85d 7b04 	ldr.w	r7, [sp], #4
    186c:	4770      	bx	lr
    186e:	bf00      	nop
    1870:	20000134 	.word	0x20000134

00001874 <gdi_putc>:


// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void gdi_putc(unsigned char c){
    1874:	b580      	push	{r7, lr}
    1876:	b084      	sub	sp, #16
    1878:	af02      	add	r7, sp, #8
    187a:	4603      	mov	r3, r0
    187c:	71fb      	strb	r3, [r7, #7]
		switch (c){
    187e:	79fb      	ldrb	r3, [r7, #7]
    1880:	2b0d      	cmp	r3, #13
    1882:	d102      	bne.n	188a <gdi_putc+0x16>
		case CR:
			gdi_new_line();
    1884:	f7ff ff60 	bl	1748 <gdi_new_line>
			break;
    1888:	e01d      	b.n	18c6 <gdi_putc+0x52>
		default:
			if (c<FONT_SIZE){
    188a:	79fb      	ldrb	r3, [r7, #7]
    188c:	b25b      	sxtb	r3, r3
    188e:	2b00      	cmp	r3, #0
    1890:	db18      	blt.n	18c4 <gdi_putc+0x50>
				gdi_put_sprite(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,&font6x8[c]);
    1892:	4b0e      	ldr	r3, [pc, #56]	; (18cc <gdi_putc+0x58>)
    1894:	6818      	ldr	r0, [r3, #0]
    1896:	4b0e      	ldr	r3, [pc, #56]	; (18d0 <gdi_putc+0x5c>)
    1898:	6819      	ldr	r1, [r3, #0]
    189a:	79fb      	ldrb	r3, [r7, #7]
    189c:	00db      	lsls	r3, r3, #3
    189e:	4a0d      	ldr	r2, [pc, #52]	; (18d4 <gdi_putc+0x60>)
    18a0:	4413      	add	r3, r2
    18a2:	9300      	str	r3, [sp, #0]
    18a4:	2206      	movs	r2, #6
    18a6:	2308      	movs	r3, #8
    18a8:	f7ff ff66 	bl	1778 <gdi_put_sprite>
				cursor_x+=CHAR_WIDTH;
    18ac:	4b07      	ldr	r3, [pc, #28]	; (18cc <gdi_putc+0x58>)
    18ae:	681b      	ldr	r3, [r3, #0]
    18b0:	3306      	adds	r3, #6
    18b2:	4a06      	ldr	r2, [pc, #24]	; (18cc <gdi_putc+0x58>)
    18b4:	6013      	str	r3, [r2, #0]
				if (cursor_x>(HRES-CHAR_WIDTH)){
    18b6:	4b05      	ldr	r3, [pc, #20]	; (18cc <gdi_putc+0x58>)
    18b8:	681b      	ldr	r3, [r3, #0]
    18ba:	f5b3 7f9d 	cmp.w	r3, #314	; 0x13a
    18be:	dd01      	ble.n	18c4 <gdi_putc+0x50>
					gdi_new_line();
    18c0:	f7ff ff42 	bl	1748 <gdi_new_line>
				}
			}
			break;
    18c4:	bf00      	nop
		}//switch
}
    18c6:	3708      	adds	r7, #8
    18c8:	46bd      	mov	sp, r7
    18ca:	bd80      	pop	{r7, pc}
    18cc:	200000dc 	.word	0x200000dc
    18d0:	200000e0 	.word	0x200000e0
    18d4:	00002a50 	.word	0x00002a50

000018d8 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    18d8:	b490      	push	{r4, r7}
    18da:	b086      	sub	sp, #24
    18dc:	af00      	add	r7, sp, #0
    18de:	60f8      	str	r0, [r7, #12]
    18e0:	60b9      	str	r1, [r7, #8]
    18e2:	607a      	str	r2, [r7, #4]
	register gpio_crl_t* cr;
	uint8_t shift;
	switch (port){
    18e4:	68fb      	ldr	r3, [r7, #12]
    18e6:	2b01      	cmp	r3, #1
    18e8:	d006      	beq.n	18f8 <config_pin+0x20>
    18ea:	2b01      	cmp	r3, #1
    18ec:	d302      	bcc.n	18f4 <config_pin+0x1c>
    18ee:	2b02      	cmp	r3, #2
    18f0:	d004      	beq.n	18fc <config_pin+0x24>
    18f2:	e005      	b.n	1900 <config_pin+0x28>
		case GPIOA:
		cr=(gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS);
    18f4:	4c17      	ldr	r4, [pc, #92]	; (1954 <config_pin+0x7c>)
		break;
    18f6:	e003      	b.n	1900 <config_pin+0x28>
		case GPIOB:
		cr=(gpio_crl_t*)(GPIOB_BASE_ADR+GPIO_CRL_OFS);
    18f8:	4c17      	ldr	r4, [pc, #92]	; (1958 <config_pin+0x80>)
		break;
    18fa:	e001      	b.n	1900 <config_pin+0x28>
		case GPIOC:
		cr=(gpio_crl_t*)(GPIOC_BASE_ADR+GPIO_CRL_OFS);
    18fc:	4c17      	ldr	r4, [pc, #92]	; (195c <config_pin+0x84>)
		break;
    18fe:	bf00      	nop
	}
	shift=(pin&7)<<2;
    1900:	68bb      	ldr	r3, [r7, #8]
    1902:	b2db      	uxtb	r3, r3
    1904:	f003 0307 	and.w	r3, r3, #7
    1908:	b2db      	uxtb	r3, r3
    190a:	009b      	lsls	r3, r3, #2
    190c:	75fb      	strb	r3, [r7, #23]
	cr[pin>>3].cr&=~(15<<shift);
    190e:	68bb      	ldr	r3, [r7, #8]
    1910:	08db      	lsrs	r3, r3, #3
    1912:	009b      	lsls	r3, r3, #2
    1914:	4423      	add	r3, r4
    1916:	68ba      	ldr	r2, [r7, #8]
    1918:	08d2      	lsrs	r2, r2, #3
    191a:	0092      	lsls	r2, r2, #2
    191c:	4422      	add	r2, r4
    191e:	6812      	ldr	r2, [r2, #0]
    1920:	7df9      	ldrb	r1, [r7, #23]
    1922:	200f      	movs	r0, #15
    1924:	fa00 f101 	lsl.w	r1, r0, r1
    1928:	43c9      	mvns	r1, r1
    192a:	400a      	ands	r2, r1
    192c:	601a      	str	r2, [r3, #0]
	cr[pin>>3].cr|=config<<shift;
    192e:	68bb      	ldr	r3, [r7, #8]
    1930:	08db      	lsrs	r3, r3, #3
    1932:	009b      	lsls	r3, r3, #2
    1934:	4423      	add	r3, r4
    1936:	68ba      	ldr	r2, [r7, #8]
    1938:	08d2      	lsrs	r2, r2, #3
    193a:	0092      	lsls	r2, r2, #2
    193c:	4422      	add	r2, r4
    193e:	6811      	ldr	r1, [r2, #0]
    1940:	7dfa      	ldrb	r2, [r7, #23]
    1942:	6878      	ldr	r0, [r7, #4]
    1944:	fa00 f202 	lsl.w	r2, r0, r2
    1948:	430a      	orrs	r2, r1
    194a:	601a      	str	r2, [r3, #0]
}
    194c:	3718      	adds	r7, #24
    194e:	46bd      	mov	sp, r7
    1950:	bc90      	pop	{r4, r7}
    1952:	4770      	bx	lr
    1954:	40010800 	.word	0x40010800
    1958:	40010c00 	.word	0x40010c00
    195c:	40011000 	.word	0x40011000

00001960 <keyboard_init>:

#define QUEUE_SIZE (32)
static unsigned char queue[QUEUE_SIZE];
static int head=0,tail=0;
 
void keyboard_init(){
    1960:	b580      	push	{r7, lr}
    1962:	af00      	add	r7, sp, #0
	head=0;
    1964:	4b22      	ldr	r3, [pc, #136]	; (19f0 <keyboard_init+0x90>)
    1966:	2200      	movs	r2, #0
    1968:	601a      	str	r2, [r3, #0]
	tail=0;
    196a:	4b22      	ldr	r3, [pc, #136]	; (19f4 <keyboard_init+0x94>)
    196c:	2200      	movs	r2, #0
    196e:	601a      	str	r2, [r3, #0]
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
    1970:	4a21      	ldr	r2, [pc, #132]	; (19f8 <keyboard_init+0x98>)
    1972:	4b21      	ldr	r3, [pc, #132]	; (19f8 <keyboard_init+0x98>)
    1974:	699b      	ldr	r3, [r3, #24]
    1976:	f043 0305 	orr.w	r3, r3, #5
    197a:	6193      	str	r3, [r2, #24]
	// activation clock TMR2
	RCC->APB1ENR|=RCC_APB1ENR_TIM2EN; 
    197c:	4a1e      	ldr	r2, [pc, #120]	; (19f8 <keyboard_init+0x98>)
    197e:	4b1e      	ldr	r3, [pc, #120]	; (19f8 <keyboard_init+0x98>)
    1980:	69db      	ldr	r3, [r3, #28]
    1982:	f043 0301 	orr.w	r3, r3, #1
    1986:	61d3      	str	r3, [r2, #28]
	TMR2->ARR=FAPB1/20*.04;
    1988:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    198c:	f44f 427a 	mov.w	r2, #64000	; 0xfa00
    1990:	62da      	str	r2, [r3, #44]	; 0x2c
	TMR2->PSC=20;
    1992:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1996:	2214      	movs	r2, #20
    1998:	629a      	str	r2, [r3, #40]	; 0x28
	TMR2->CR1=BIT0|BIT7; // ARPE
    199a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    199e:	2281      	movs	r2, #129	; 0x81
    19a0:	601a      	str	r2, [r3, #0]
	TMR2->DIER=BIT0; // UIE
    19a2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    19a6:	2201      	movs	r2, #1
    19a8:	60da      	str	r2, [r3, #12]
	set_int_priority(IRQ_KBD_CLK,2);
    19aa:	2017      	movs	r0, #23
    19ac:	2102      	movs	r1, #2
    19ae:	f000 fafd 	bl	1fac <set_int_priority>
	set_int_priority(IRQ_TIM2,14);
    19b2:	201c      	movs	r0, #28
    19b4:	210e      	movs	r1, #14
    19b6:	f000 faf9 	bl	1fac <set_int_priority>
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
    19ba:	4a10      	ldr	r2, [pc, #64]	; (19fc <keyboard_init+0x9c>)
    19bc:	4b0f      	ldr	r3, [pc, #60]	; (19fc <keyboard_init+0x9c>)
    19be:	68db      	ldr	r3, [r3, #12]
    19c0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    19c4:	60d3      	str	r3, [r2, #12]
	EXTI->IMR|=KBD_CLK_PIN;
    19c6:	4a0d      	ldr	r2, [pc, #52]	; (19fc <keyboard_init+0x9c>)
    19c8:	4b0c      	ldr	r3, [pc, #48]	; (19fc <keyboard_init+0x9c>)
    19ca:	681b      	ldr	r3, [r3, #0]
    19cc:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    19d0:	6013      	str	r3, [r2, #0]
	enable_interrupt(IRQ_KBD_CLK);
    19d2:	2017      	movs	r0, #23
    19d4:	f000 faa2 	bl	1f1c <enable_interrupt>
	TMR2->SR&=~BIT0;
    19d8:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    19dc:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    19e0:	691b      	ldr	r3, [r3, #16]
    19e2:	f023 0301 	bic.w	r3, r3, #1
    19e6:	6113      	str	r3, [r2, #16]
	enable_interrupt(IRQ_TIM2);
    19e8:	201c      	movs	r0, #28
    19ea:	f000 fa97 	bl	1f1c <enable_interrupt>
}
    19ee:	bd80      	pop	{r7, pc}
    19f0:	20000104 	.word	0x20000104
    19f4:	20000108 	.word	0x20000108
    19f8:	40021000 	.word	0x40021000
    19fc:	40010400 	.word	0x40010400

00001a00 <kbd_getc>:


unsigned char kbd_getc(){
    1a00:	b480      	push	{r7}
    1a02:	b083      	sub	sp, #12
    1a04:	af00      	add	r7, sp, #0
	unsigned char c=0;
    1a06:	2300      	movs	r3, #0
    1a08:	71fb      	strb	r3, [r7, #7]
	if (head!=tail){
    1a0a:	4b0d      	ldr	r3, [pc, #52]	; (1a40 <kbd_getc+0x40>)
    1a0c:	681a      	ldr	r2, [r3, #0]
    1a0e:	4b0d      	ldr	r3, [pc, #52]	; (1a44 <kbd_getc+0x44>)
    1a10:	681b      	ldr	r3, [r3, #0]
    1a12:	429a      	cmp	r2, r3
    1a14:	d00d      	beq.n	1a32 <kbd_getc+0x32>
		c=queue[head++];
    1a16:	4b0a      	ldr	r3, [pc, #40]	; (1a40 <kbd_getc+0x40>)
    1a18:	681b      	ldr	r3, [r3, #0]
    1a1a:	1c5a      	adds	r2, r3, #1
    1a1c:	4908      	ldr	r1, [pc, #32]	; (1a40 <kbd_getc+0x40>)
    1a1e:	600a      	str	r2, [r1, #0]
    1a20:	4a09      	ldr	r2, [pc, #36]	; (1a48 <kbd_getc+0x48>)
    1a22:	5cd3      	ldrb	r3, [r2, r3]
    1a24:	71fb      	strb	r3, [r7, #7]
		head&=QUEUE_SIZE-1;
    1a26:	4b06      	ldr	r3, [pc, #24]	; (1a40 <kbd_getc+0x40>)
    1a28:	681b      	ldr	r3, [r3, #0]
    1a2a:	f003 031f 	and.w	r3, r3, #31
    1a2e:	4a04      	ldr	r2, [pc, #16]	; (1a40 <kbd_getc+0x40>)
    1a30:	6013      	str	r3, [r2, #0]
	}
	return c;
    1a32:	79fb      	ldrb	r3, [r7, #7]
}
    1a34:	4618      	mov	r0, r3
    1a36:	370c      	adds	r7, #12
    1a38:	46bd      	mov	sp, r7
    1a3a:	f85d 7b04 	ldr.w	r7, [sp], #4
    1a3e:	4770      	bx	lr
    1a40:	20000104 	.word	0x20000104
    1a44:	20000108 	.word	0x20000108
    1a48:	200000e4 	.word	0x200000e4

00001a4c <search_table>:
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
    1a4c:	b480      	push	{r7}
    1a4e:	b083      	sub	sp, #12
    1a50:	af00      	add	r7, sp, #0
    1a52:	6078      	str	r0, [r7, #4]
    1a54:	460b      	mov	r3, r1
    1a56:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    1a58:	e008      	b.n	1a6c <search_table+0x20>
		if (table->code==code) break;
    1a5a:	687b      	ldr	r3, [r7, #4]
    1a5c:	781b      	ldrb	r3, [r3, #0]
    1a5e:	78fa      	ldrb	r2, [r7, #3]
    1a60:	429a      	cmp	r2, r3
    1a62:	d100      	bne.n	1a66 <search_table+0x1a>
    1a64:	e006      	b.n	1a74 <search_table+0x28>
		table++;
    1a66:	687b      	ldr	r3, [r7, #4]
    1a68:	3302      	adds	r3, #2
    1a6a:	607b      	str	r3, [r7, #4]

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
    1a6c:	687b      	ldr	r3, [r7, #4]
    1a6e:	781b      	ldrb	r3, [r3, #0]
    1a70:	2b00      	cmp	r3, #0
    1a72:	d1f2      	bne.n	1a5a <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    1a74:	687b      	ldr	r3, [r7, #4]
    1a76:	785b      	ldrb	r3, [r3, #1]
}
    1a78:	4618      	mov	r0, r3
    1a7a:	370c      	adds	r7, #12
    1a7c:	46bd      	mov	sp, r7
    1a7e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1a82:	4770      	bx	lr

00001a84 <convert_code>:

static void convert_code(unsigned char code){
    1a84:	b580      	push	{r7, lr}
    1a86:	b086      	sub	sp, #24
    1a88:	af00      	add	r7, sp, #0
    1a8a:	4603      	mov	r3, r0
    1a8c:	71fb      	strb	r3, [r7, #7]
		unsigned char c,s;
		int shift;
		
		switch (code){
    1a8e:	79fb      	ldrb	r3, [r7, #7]
    1a90:	2b59      	cmp	r3, #89	; 0x59
    1a92:	f000 80a3 	beq.w	1bdc <convert_code+0x158>
    1a96:	2b59      	cmp	r3, #89	; 0x59
    1a98:	dc0e      	bgt.n	1ab8 <convert_code+0x34>
    1a9a:	2b12      	cmp	r3, #18
    1a9c:	d042      	beq.n	1b24 <convert_code+0xa0>
    1a9e:	2b12      	cmp	r3, #18
    1aa0:	dc03      	bgt.n	1aaa <convert_code+0x26>
    1aa2:	2b11      	cmp	r3, #17
    1aa4:	f000 80c2 	beq.w	1c2c <convert_code+0x1a8>
    1aa8:	e0e8      	b.n	1c7c <convert_code+0x1f8>
    1aaa:	2b14      	cmp	r3, #20
    1aac:	f000 80aa 	beq.w	1c04 <convert_code+0x180>
    1ab0:	2b58      	cmp	r3, #88	; 0x58
    1ab2:	f000 80cf 	beq.w	1c54 <convert_code+0x1d0>
    1ab6:	e0e1      	b.n	1c7c <convert_code+0x1f8>
    1ab8:	2be0      	cmp	r3, #224	; 0xe0
    1aba:	d010      	beq.n	1ade <convert_code+0x5a>
    1abc:	2be0      	cmp	r3, #224	; 0xe0
    1abe:	dc02      	bgt.n	1ac6 <convert_code+0x42>
    1ac0:	2b7c      	cmp	r3, #124	; 0x7c
    1ac2:	d051      	beq.n	1b68 <convert_code+0xe4>
    1ac4:	e0da      	b.n	1c7c <convert_code+0x1f8>
    1ac6:	2be1      	cmp	r3, #225	; 0xe1
    1ac8:	d010      	beq.n	1aec <convert_code+0x68>
    1aca:	2bf0      	cmp	r3, #240	; 0xf0
    1acc:	f040 80d6 	bne.w	1c7c <convert_code+0x1f8>
		case 0xF0:
			flags |= RELEASE;
    1ad0:	4b9c      	ldr	r3, [pc, #624]	; (1d44 <convert_code+0x2c0>)
    1ad2:	681b      	ldr	r3, [r3, #0]
    1ad4:	f043 0302 	orr.w	r3, r3, #2
    1ad8:	4a9a      	ldr	r2, [pc, #616]	; (1d44 <convert_code+0x2c0>)
    1ada:	6013      	str	r3, [r2, #0]
			break;
    1adc:	e145      	b.n	1d6a <convert_code+0x2e6>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    1ade:	4b99      	ldr	r3, [pc, #612]	; (1d44 <convert_code+0x2c0>)
    1ae0:	681b      	ldr	r3, [r3, #0]
    1ae2:	f043 0301 	orr.w	r3, r3, #1
    1ae6:	4a97      	ldr	r2, [pc, #604]	; (1d44 <convert_code+0x2c0>)
    1ae8:	6013      	str	r3, [r2, #0]
			break;
    1aea:	e13e      	b.n	1d6a <convert_code+0x2e6>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    1aec:	4b95      	ldr	r3, [pc, #596]	; (1d44 <convert_code+0x2c0>)
    1aee:	681b      	ldr	r3, [r3, #0]
    1af0:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    1af4:	4a93      	ldr	r2, [pc, #588]	; (1d44 <convert_code+0x2c0>)
    1af6:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    1af8:	4b92      	ldr	r3, [pc, #584]	; (1d44 <convert_code+0x2c0>)
    1afa:	681b      	ldr	r3, [r3, #0]
    1afc:	f403 7380 	and.w	r3, r3, #256	; 0x100
    1b00:	2b00      	cmp	r3, #0
    1b02:	d10e      	bne.n	1b22 <convert_code+0x9e>
				queue[tail++]=PAUSE;
    1b04:	4b90      	ldr	r3, [pc, #576]	; (1d48 <convert_code+0x2c4>)
    1b06:	681b      	ldr	r3, [r3, #0]
    1b08:	1c5a      	adds	r2, r3, #1
    1b0a:	498f      	ldr	r1, [pc, #572]	; (1d48 <convert_code+0x2c4>)
    1b0c:	600a      	str	r2, [r1, #0]
    1b0e:	4a8f      	ldr	r2, [pc, #572]	; (1d4c <convert_code+0x2c8>)
    1b10:	2194      	movs	r1, #148	; 0x94
    1b12:	54d1      	strb	r1, [r2, r3]
				tail&=QUEUE_SIZE-1;
    1b14:	4b8c      	ldr	r3, [pc, #560]	; (1d48 <convert_code+0x2c4>)
    1b16:	681b      	ldr	r3, [r3, #0]
    1b18:	f003 031f 	and.w	r3, r3, #31
    1b1c:	4a8a      	ldr	r2, [pc, #552]	; (1d48 <convert_code+0x2c4>)
    1b1e:	6013      	str	r3, [r2, #0]
			}
			break;
    1b20:	e123      	b.n	1d6a <convert_code+0x2e6>
    1b22:	e122      	b.n	1d6a <convert_code+0x2e6>
		case LSHIFT:
			if (flags&RELEASE){
    1b24:	4b87      	ldr	r3, [pc, #540]	; (1d44 <convert_code+0x2c0>)
    1b26:	681b      	ldr	r3, [r3, #0]
    1b28:	f003 0302 	and.w	r3, r3, #2
    1b2c:	2b00      	cmp	r3, #0
    1b2e:	d006      	beq.n	1b3e <convert_code+0xba>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    1b30:	4b84      	ldr	r3, [pc, #528]	; (1d44 <convert_code+0x2c0>)
    1b32:	681b      	ldr	r3, [r3, #0]
    1b34:	f023 0307 	bic.w	r3, r3, #7
    1b38:	4a82      	ldr	r2, [pc, #520]	; (1d44 <convert_code+0x2c0>)
    1b3a:	6013      	str	r3, [r2, #0]
    1b3c:	e013      	b.n	1b66 <convert_code+0xe2>
			}else{
				if (flags&XTD_CODE){
    1b3e:	4b81      	ldr	r3, [pc, #516]	; (1d44 <convert_code+0x2c0>)
    1b40:	681b      	ldr	r3, [r3, #0]
    1b42:	f003 0301 	and.w	r3, r3, #1
    1b46:	2b00      	cmp	r3, #0
    1b48:	d006      	beq.n	1b58 <convert_code+0xd4>
					flags|=PRNSCR;
    1b4a:	4b7e      	ldr	r3, [pc, #504]	; (1d44 <convert_code+0x2c0>)
    1b4c:	681b      	ldr	r3, [r3, #0]
    1b4e:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1b52:	4a7c      	ldr	r2, [pc, #496]	; (1d44 <convert_code+0x2c0>)
    1b54:	6013      	str	r3, [r2, #0]
    1b56:	e006      	b.n	1b66 <convert_code+0xe2>
				}else{
					flags|=LEFT_SHIFT;
    1b58:	4b7a      	ldr	r3, [pc, #488]	; (1d44 <convert_code+0x2c0>)
    1b5a:	681b      	ldr	r3, [r3, #0]
    1b5c:	f043 0304 	orr.w	r3, r3, #4
    1b60:	4a78      	ldr	r2, [pc, #480]	; (1d44 <convert_code+0x2c0>)
    1b62:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1b64:	e101      	b.n	1d6a <convert_code+0x2e6>
    1b66:	e100      	b.n	1d6a <convert_code+0x2e6>
		case KPMUL:
			if (flags&RELEASE){
    1b68:	4b76      	ldr	r3, [pc, #472]	; (1d44 <convert_code+0x2c0>)
    1b6a:	681b      	ldr	r3, [r3, #0]
    1b6c:	f003 0302 	and.w	r3, r3, #2
    1b70:	2b00      	cmp	r3, #0
    1b72:	d006      	beq.n	1b82 <convert_code+0xfe>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    1b74:	4b73      	ldr	r3, [pc, #460]	; (1d44 <convert_code+0x2c0>)
    1b76:	681b      	ldr	r3, [r3, #0]
    1b78:	f023 0303 	bic.w	r3, r3, #3
    1b7c:	4a71      	ldr	r2, [pc, #452]	; (1d44 <convert_code+0x2c0>)
    1b7e:	6013      	str	r3, [r2, #0]
    1b80:	e02b      	b.n	1bda <convert_code+0x156>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    1b82:	4b70      	ldr	r3, [pc, #448]	; (1d44 <convert_code+0x2c0>)
    1b84:	681b      	ldr	r3, [r3, #0]
    1b86:	f003 0301 	and.w	r3, r3, #1
    1b8a:	2b00      	cmp	r3, #0
    1b8c:	d016      	beq.n	1bbc <convert_code+0x138>
					flags&=~(XTD_CODE|PRNSCR);
    1b8e:	4b6d      	ldr	r3, [pc, #436]	; (1d44 <convert_code+0x2c0>)
    1b90:	681b      	ldr	r3, [r3, #0]
    1b92:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    1b96:	f023 0301 	bic.w	r3, r3, #1
    1b9a:	4a6a      	ldr	r2, [pc, #424]	; (1d44 <convert_code+0x2c0>)
    1b9c:	6013      	str	r3, [r2, #0]
					queue[tail++]=PRN;
    1b9e:	4b6a      	ldr	r3, [pc, #424]	; (1d48 <convert_code+0x2c4>)
    1ba0:	681b      	ldr	r3, [r3, #0]
    1ba2:	1c5a      	adds	r2, r3, #1
    1ba4:	4968      	ldr	r1, [pc, #416]	; (1d48 <convert_code+0x2c4>)
    1ba6:	600a      	str	r2, [r1, #0]
    1ba8:	4a68      	ldr	r2, [pc, #416]	; (1d4c <convert_code+0x2c8>)
    1baa:	2192      	movs	r1, #146	; 0x92
    1bac:	54d1      	strb	r1, [r2, r3]
					tail&=QUEUE_SIZE-1;
    1bae:	4b66      	ldr	r3, [pc, #408]	; (1d48 <convert_code+0x2c4>)
    1bb0:	681b      	ldr	r3, [r3, #0]
    1bb2:	f003 031f 	and.w	r3, r3, #31
    1bb6:	4a64      	ldr	r2, [pc, #400]	; (1d48 <convert_code+0x2c4>)
    1bb8:	6013      	str	r3, [r2, #0]
    1bba:	e00e      	b.n	1bda <convert_code+0x156>
				}else{
					queue[tail++]='*';
    1bbc:	4b62      	ldr	r3, [pc, #392]	; (1d48 <convert_code+0x2c4>)
    1bbe:	681b      	ldr	r3, [r3, #0]
    1bc0:	1c5a      	adds	r2, r3, #1
    1bc2:	4961      	ldr	r1, [pc, #388]	; (1d48 <convert_code+0x2c4>)
    1bc4:	600a      	str	r2, [r1, #0]
    1bc6:	4a61      	ldr	r2, [pc, #388]	; (1d4c <convert_code+0x2c8>)
    1bc8:	212a      	movs	r1, #42	; 0x2a
    1bca:	54d1      	strb	r1, [r2, r3]
					tail&=QUEUE_SIZE-1;
    1bcc:	4b5e      	ldr	r3, [pc, #376]	; (1d48 <convert_code+0x2c4>)
    1bce:	681b      	ldr	r3, [r3, #0]
    1bd0:	f003 031f 	and.w	r3, r3, #31
    1bd4:	4a5c      	ldr	r2, [pc, #368]	; (1d48 <convert_code+0x2c4>)
    1bd6:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1bd8:	e0c7      	b.n	1d6a <convert_code+0x2e6>
    1bda:	e0c6      	b.n	1d6a <convert_code+0x2e6>
		case RSHIFT:
			if (flags&RELEASE){
    1bdc:	4b59      	ldr	r3, [pc, #356]	; (1d44 <convert_code+0x2c0>)
    1bde:	681b      	ldr	r3, [r3, #0]
    1be0:	f003 0302 	and.w	r3, r3, #2
    1be4:	2b00      	cmp	r3, #0
    1be6:	d006      	beq.n	1bf6 <convert_code+0x172>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    1be8:	4b56      	ldr	r3, [pc, #344]	; (1d44 <convert_code+0x2c0>)
    1bea:	681b      	ldr	r3, [r3, #0]
    1bec:	f023 030b 	bic.w	r3, r3, #11
    1bf0:	4a54      	ldr	r2, [pc, #336]	; (1d44 <convert_code+0x2c0>)
    1bf2:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    1bf4:	e0b9      	b.n	1d6a <convert_code+0x2e6>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    1bf6:	4b53      	ldr	r3, [pc, #332]	; (1d44 <convert_code+0x2c0>)
    1bf8:	681b      	ldr	r3, [r3, #0]
    1bfa:	f043 0308 	orr.w	r3, r3, #8
    1bfe:	4a51      	ldr	r2, [pc, #324]	; (1d44 <convert_code+0x2c0>)
    1c00:	6013      	str	r3, [r2, #0]
			}
			break;
    1c02:	e0b2      	b.n	1d6a <convert_code+0x2e6>
		case LCTRL:
			if (flags&RELEASE){
    1c04:	4b4f      	ldr	r3, [pc, #316]	; (1d44 <convert_code+0x2c0>)
    1c06:	681b      	ldr	r3, [r3, #0]
    1c08:	f003 0302 	and.w	r3, r3, #2
    1c0c:	2b00      	cmp	r3, #0
    1c0e:	d006      	beq.n	1c1e <convert_code+0x19a>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    1c10:	4b4c      	ldr	r3, [pc, #304]	; (1d44 <convert_code+0x2c0>)
    1c12:	681b      	ldr	r3, [r3, #0]
    1c14:	f023 0313 	bic.w	r3, r3, #19
    1c18:	4a4a      	ldr	r2, [pc, #296]	; (1d44 <convert_code+0x2c0>)
    1c1a:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_CTRL;
			}
			break;
    1c1c:	e0a5      	b.n	1d6a <convert_code+0x2e6>
			break;
		case LCTRL:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
			}else{
				flags|=LEFT_CTRL;
    1c1e:	4b49      	ldr	r3, [pc, #292]	; (1d44 <convert_code+0x2c0>)
    1c20:	681b      	ldr	r3, [r3, #0]
    1c22:	f043 0310 	orr.w	r3, r3, #16
    1c26:	4a47      	ldr	r2, [pc, #284]	; (1d44 <convert_code+0x2c0>)
    1c28:	6013      	str	r3, [r2, #0]
			}
			break;
    1c2a:	e09e      	b.n	1d6a <convert_code+0x2e6>
		case LALT:
			if (flags&RELEASE){
    1c2c:	4b45      	ldr	r3, [pc, #276]	; (1d44 <convert_code+0x2c0>)
    1c2e:	681b      	ldr	r3, [r3, #0]
    1c30:	f003 0302 	and.w	r3, r3, #2
    1c34:	2b00      	cmp	r3, #0
    1c36:	d006      	beq.n	1c46 <convert_code+0x1c2>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    1c38:	4b42      	ldr	r3, [pc, #264]	; (1d44 <convert_code+0x2c0>)
    1c3a:	681b      	ldr	r3, [r3, #0]
    1c3c:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    1c40:	4a40      	ldr	r2, [pc, #256]	; (1d44 <convert_code+0x2c0>)
    1c42:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    1c44:	e091      	b.n	1d6a <convert_code+0x2e6>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    1c46:	4b3f      	ldr	r3, [pc, #252]	; (1d44 <convert_code+0x2c0>)
    1c48:	681b      	ldr	r3, [r3, #0]
    1c4a:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1c4e:	4a3d      	ldr	r2, [pc, #244]	; (1d44 <convert_code+0x2c0>)
    1c50:	6013      	str	r3, [r2, #0]
			}
			break;
    1c52:	e08a      	b.n	1d6a <convert_code+0x2e6>
		case CAPS_LOCK:
			if (flags&RELEASE){
    1c54:	4b3b      	ldr	r3, [pc, #236]	; (1d44 <convert_code+0x2c0>)
    1c56:	681b      	ldr	r3, [r3, #0]
    1c58:	f003 0302 	and.w	r3, r3, #2
    1c5c:	2b00      	cmp	r3, #0
    1c5e:	d006      	beq.n	1c6e <convert_code+0x1ea>
				flags&=~(RELEASE|XTD_CODE);
    1c60:	4b38      	ldr	r3, [pc, #224]	; (1d44 <convert_code+0x2c0>)
    1c62:	681b      	ldr	r3, [r3, #0]
    1c64:	f023 0303 	bic.w	r3, r3, #3
    1c68:	4a36      	ldr	r2, [pc, #216]	; (1d44 <convert_code+0x2c0>)
    1c6a:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    1c6c:	e07d      	b.n	1d6a <convert_code+0x2e6>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    1c6e:	4b35      	ldr	r3, [pc, #212]	; (1d44 <convert_code+0x2c0>)
    1c70:	681b      	ldr	r3, [r3, #0]
    1c72:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    1c76:	4a33      	ldr	r2, [pc, #204]	; (1d44 <convert_code+0x2c0>)
    1c78:	6013      	str	r3, [r2, #0]
			}
			break;
    1c7a:	e076      	b.n	1d6a <convert_code+0x2e6>
		default:
			if (!(flags&RELEASE)){
    1c7c:	4b31      	ldr	r3, [pc, #196]	; (1d44 <convert_code+0x2c0>)
    1c7e:	681b      	ldr	r3, [r3, #0]
    1c80:	f003 0302 	and.w	r3, r3, #2
    1c84:	2b00      	cmp	r3, #0
    1c86:	d169      	bne.n	1d5c <convert_code+0x2d8>
					if (flags&XTD_CODE){
    1c88:	4b2e      	ldr	r3, [pc, #184]	; (1d44 <convert_code+0x2c0>)
    1c8a:	681b      	ldr	r3, [r3, #0]
    1c8c:	f003 0301 	and.w	r3, r3, #1
    1c90:	2b00      	cmp	r3, #0
    1c92:	d00d      	beq.n	1cb0 <convert_code+0x22c>
						c=search_table(mcsaite_xkey,code);
    1c94:	79fb      	ldrb	r3, [r7, #7]
    1c96:	482e      	ldr	r0, [pc, #184]	; (1d50 <convert_code+0x2cc>)
    1c98:	4619      	mov	r1, r3
    1c9a:	f7ff fed7 	bl	1a4c <search_table>
    1c9e:	4603      	mov	r3, r0
    1ca0:	75fb      	strb	r3, [r7, #23]
						flags&=~XTD_CODE;
    1ca2:	4b28      	ldr	r3, [pc, #160]	; (1d44 <convert_code+0x2c0>)
    1ca4:	681b      	ldr	r3, [r3, #0]
    1ca6:	f023 0301 	bic.w	r3, r3, #1
    1caa:	4a26      	ldr	r2, [pc, #152]	; (1d44 <convert_code+0x2c0>)
    1cac:	6013      	str	r3, [r2, #0]
    1cae:	e006      	b.n	1cbe <convert_code+0x23a>
					}else{
						c=search_table(mcsaite_key,code);
    1cb0:	79fb      	ldrb	r3, [r7, #7]
    1cb2:	4828      	ldr	r0, [pc, #160]	; (1d54 <convert_code+0x2d0>)
    1cb4:	4619      	mov	r1, r3
    1cb6:	f7ff fec9 	bl	1a4c <search_table>
    1cba:	4603      	mov	r3, r0
    1cbc:	75fb      	strb	r3, [r7, #23]
					}
					shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    1cbe:	4b21      	ldr	r3, [pc, #132]	; (1d44 <convert_code+0x2c0>)
    1cc0:	681b      	ldr	r3, [r3, #0]
    1cc2:	f003 030c 	and.w	r3, r3, #12
    1cc6:	613b      	str	r3, [r7, #16]
					if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    1cc8:	7dfb      	ldrb	r3, [r7, #23]
    1cca:	2b60      	cmp	r3, #96	; 0x60
    1ccc:	d918      	bls.n	1d00 <convert_code+0x27c>
    1cce:	7dfb      	ldrb	r3, [r7, #23]
    1cd0:	2b7a      	cmp	r3, #122	; 0x7a
    1cd2:	d815      	bhi.n	1d00 <convert_code+0x27c>
    1cd4:	693b      	ldr	r3, [r7, #16]
    1cd6:	2b00      	cmp	r3, #0
    1cd8:	d005      	beq.n	1ce6 <convert_code+0x262>
    1cda:	4b1a      	ldr	r3, [pc, #104]	; (1d44 <convert_code+0x2c0>)
    1cdc:	681b      	ldr	r3, [r3, #0]
    1cde:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1ce2:	2b00      	cmp	r3, #0
    1ce4:	d008      	beq.n	1cf8 <convert_code+0x274>
    1ce6:	693b      	ldr	r3, [r7, #16]
    1ce8:	2b00      	cmp	r3, #0
    1cea:	d109      	bne.n	1d00 <convert_code+0x27c>
    1cec:	4b15      	ldr	r3, [pc, #84]	; (1d44 <convert_code+0x2c0>)
    1cee:	681b      	ldr	r3, [r3, #0]
    1cf0:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1cf4:	2b00      	cmp	r3, #0
    1cf6:	d003      	beq.n	1d00 <convert_code+0x27c>
						c-=32;
    1cf8:	7dfb      	ldrb	r3, [r7, #23]
    1cfa:	3b20      	subs	r3, #32
    1cfc:	75fb      	strb	r3, [r7, #23]
    1cfe:	e00e      	b.n	1d1e <convert_code+0x29a>
					}else if (shift && (s=search_table(mcsaite_shey,c))){
    1d00:	693b      	ldr	r3, [r7, #16]
    1d02:	2b00      	cmp	r3, #0
    1d04:	d00b      	beq.n	1d1e <convert_code+0x29a>
    1d06:	7dfb      	ldrb	r3, [r7, #23]
    1d08:	4813      	ldr	r0, [pc, #76]	; (1d58 <convert_code+0x2d4>)
    1d0a:	4619      	mov	r1, r3
    1d0c:	f7ff fe9e 	bl	1a4c <search_table>
    1d10:	4603      	mov	r3, r0
    1d12:	73fb      	strb	r3, [r7, #15]
    1d14:	7bfb      	ldrb	r3, [r7, #15]
    1d16:	2b00      	cmp	r3, #0
    1d18:	d001      	beq.n	1d1e <convert_code+0x29a>
						c=s;
    1d1a:	7bfb      	ldrb	r3, [r7, #15]
    1d1c:	75fb      	strb	r3, [r7, #23]
					}
					if (c){
    1d1e:	7dfb      	ldrb	r3, [r7, #23]
    1d20:	2b00      	cmp	r3, #0
    1d22:	d021      	beq.n	1d68 <convert_code+0x2e4>
						queue[tail++]=c;
    1d24:	4b08      	ldr	r3, [pc, #32]	; (1d48 <convert_code+0x2c4>)
    1d26:	681b      	ldr	r3, [r3, #0]
    1d28:	1c5a      	adds	r2, r3, #1
    1d2a:	4907      	ldr	r1, [pc, #28]	; (1d48 <convert_code+0x2c4>)
    1d2c:	600a      	str	r2, [r1, #0]
    1d2e:	4907      	ldr	r1, [pc, #28]	; (1d4c <convert_code+0x2c8>)
    1d30:	7dfa      	ldrb	r2, [r7, #23]
    1d32:	54ca      	strb	r2, [r1, r3]
						tail&=QUEUE_SIZE-1;
    1d34:	4b04      	ldr	r3, [pc, #16]	; (1d48 <convert_code+0x2c4>)
    1d36:	681b      	ldr	r3, [r3, #0]
    1d38:	f003 031f 	and.w	r3, r3, #31
    1d3c:	4a02      	ldr	r2, [pc, #8]	; (1d48 <convert_code+0x2c4>)
    1d3e:	6013      	str	r3, [r2, #0]
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    1d40:	e013      	b.n	1d6a <convert_code+0x2e6>
    1d42:	bf00      	nop
    1d44:	2000010c 	.word	0x2000010c
    1d48:	20000108 	.word	0x20000108
    1d4c:	200000e4 	.word	0x200000e4
    1d50:	00002f08 	.word	0x00002f08
    1d54:	00002e50 	.word	0x00002e50
    1d58:	00002edc 	.word	0x00002edc
					if (c){
						queue[tail++]=c;
						tail&=QUEUE_SIZE-1;
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    1d5c:	4b04      	ldr	r3, [pc, #16]	; (1d70 <convert_code+0x2ec>)
    1d5e:	681b      	ldr	r3, [r3, #0]
    1d60:	f023 0303 	bic.w	r3, r3, #3
    1d64:	4a02      	ldr	r2, [pc, #8]	; (1d70 <convert_code+0x2ec>)
    1d66:	6013      	str	r3, [r2, #0]
			}
			break;
    1d68:	bf00      	nop
		}//switch
}// convert_code()
    1d6a:	3718      	adds	r7, #24
    1d6c:	46bd      	mov	sp, r7
    1d6e:	bd80      	pop	{r7, pc}
    1d70:	2000010c 	.word	0x2000010c

00001d74 <EXTI9_5_handler>:
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];
volatile static unsigned char ps2_flags;
volatile  static unsigned char  in_byte=0,bit_cnt=0;
// signal clock du clavier PS/2
/*__attribute__((optimize("-O3")))*/ void KBD_CLK_handler(){
    1d74:	b480      	push	{r7}
    1d76:	b083      	sub	sp, #12
    1d78:	af00      	add	r7, sp, #0
   volatile unsigned char parity; 
    switch (bit_cnt){
    1d7a:	4b49      	ldr	r3, [pc, #292]	; (1ea0 <EXTI9_5_handler+0x12c>)
    1d7c:	781b      	ldrb	r3, [r3, #0]
    1d7e:	b2db      	uxtb	r3, r3
    1d80:	2b09      	cmp	r3, #9
    1d82:	d01a      	beq.n	1dba <EXTI9_5_handler+0x46>
    1d84:	2b0a      	cmp	r3, #10
    1d86:	d039      	beq.n	1dfc <EXTI9_5_handler+0x88>
    1d88:	2b00      	cmp	r3, #0
    1d8a:	d15b      	bne.n	1e44 <EXTI9_5_handler+0xd0>
	case 0:   // start bit
		ps2_flags=0;
    1d8c:	4b45      	ldr	r3, [pc, #276]	; (1ea4 <EXTI9_5_handler+0x130>)
    1d8e:	2200      	movs	r2, #0
    1d90:	701a      	strb	r2, [r3, #0]
		if (!(KBD_PORT->IDR & KBD_DAT_PIN)){
    1d92:	4b45      	ldr	r3, [pc, #276]	; (1ea8 <EXTI9_5_handler+0x134>)
    1d94:	689b      	ldr	r3, [r3, #8]
    1d96:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1d9a:	2b00      	cmp	r3, #0
    1d9c:	d10c      	bne.n	1db8 <EXTI9_5_handler+0x44>
			in_byte=0;
    1d9e:	4b43      	ldr	r3, [pc, #268]	; (1eac <EXTI9_5_handler+0x138>)
    1da0:	2200      	movs	r2, #0
    1da2:	701a      	strb	r2, [r3, #0]
            parity=0;
    1da4:	2300      	movs	r3, #0
    1da6:	71fb      	strb	r3, [r7, #7]
            bit_cnt++;
    1da8:	4b3d      	ldr	r3, [pc, #244]	; (1ea0 <EXTI9_5_handler+0x12c>)
    1daa:	781b      	ldrb	r3, [r3, #0]
    1dac:	b2db      	uxtb	r3, r3
    1dae:	3301      	adds	r3, #1
    1db0:	b2da      	uxtb	r2, r3
    1db2:	4b3b      	ldr	r3, [pc, #236]	; (1ea0 <EXTI9_5_handler+0x12c>)
    1db4:	701a      	strb	r2, [r3, #0]
        }
		break;
    1db6:	e067      	b.n	1e88 <EXTI9_5_handler+0x114>
    1db8:	e066      	b.n	1e88 <EXTI9_5_handler+0x114>
	case 9:   // paritée
		if (KBD_PORT->IDR & KBD_DAT_PIN) parity++;
    1dba:	4b3b      	ldr	r3, [pc, #236]	; (1ea8 <EXTI9_5_handler+0x134>)
    1dbc:	689b      	ldr	r3, [r3, #8]
    1dbe:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1dc2:	2b00      	cmp	r3, #0
    1dc4:	d004      	beq.n	1dd0 <EXTI9_5_handler+0x5c>
    1dc6:	79fb      	ldrb	r3, [r7, #7]
    1dc8:	b2db      	uxtb	r3, r3
    1dca:	3301      	adds	r3, #1
    1dcc:	b2db      	uxtb	r3, r3
    1dce:	71fb      	strb	r3, [r7, #7]
		if (!(parity & 1)){
    1dd0:	79fb      	ldrb	r3, [r7, #7]
    1dd2:	b2db      	uxtb	r3, r3
    1dd4:	f003 0301 	and.w	r3, r3, #1
    1dd8:	2b00      	cmp	r3, #0
    1dda:	d107      	bne.n	1dec <EXTI9_5_handler+0x78>
			ps2_flags |= F_ERROR;
    1ddc:	4b31      	ldr	r3, [pc, #196]	; (1ea4 <EXTI9_5_handler+0x130>)
    1dde:	781b      	ldrb	r3, [r3, #0]
    1de0:	b2db      	uxtb	r3, r3
    1de2:	f043 0301 	orr.w	r3, r3, #1
    1de6:	b2da      	uxtb	r2, r3
    1de8:	4b2e      	ldr	r3, [pc, #184]	; (1ea4 <EXTI9_5_handler+0x130>)
    1dea:	701a      	strb	r2, [r3, #0]
		}
		bit_cnt++;
    1dec:	4b2c      	ldr	r3, [pc, #176]	; (1ea0 <EXTI9_5_handler+0x12c>)
    1dee:	781b      	ldrb	r3, [r3, #0]
    1df0:	b2db      	uxtb	r3, r3
    1df2:	3301      	adds	r3, #1
    1df4:	b2da      	uxtb	r2, r3
    1df6:	4b2a      	ldr	r3, [pc, #168]	; (1ea0 <EXTI9_5_handler+0x12c>)
    1df8:	701a      	strb	r2, [r3, #0]
		break;
    1dfa:	e045      	b.n	1e88 <EXTI9_5_handler+0x114>
	case 10:  // stop bit
		if (!ps2_flags && (KBD_PORT->IDR&KBD_DAT_PIN)){
    1dfc:	4b29      	ldr	r3, [pc, #164]	; (1ea4 <EXTI9_5_handler+0x130>)
    1dfe:	781b      	ldrb	r3, [r3, #0]
    1e00:	b2db      	uxtb	r3, r3
    1e02:	2b00      	cmp	r3, #0
    1e04:	d11a      	bne.n	1e3c <EXTI9_5_handler+0xc8>
    1e06:	4b28      	ldr	r3, [pc, #160]	; (1ea8 <EXTI9_5_handler+0x134>)
    1e08:	689b      	ldr	r3, [r3, #8]
    1e0a:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1e0e:	2b00      	cmp	r3, #0
    1e10:	d014      	beq.n	1e3c <EXTI9_5_handler+0xc8>
			ps2_queue[ps2_tail++]=in_byte;
    1e12:	4b27      	ldr	r3, [pc, #156]	; (1eb0 <EXTI9_5_handler+0x13c>)
    1e14:	781b      	ldrb	r3, [r3, #0]
    1e16:	b2db      	uxtb	r3, r3
    1e18:	1c5a      	adds	r2, r3, #1
    1e1a:	b2d1      	uxtb	r1, r2
    1e1c:	4a24      	ldr	r2, [pc, #144]	; (1eb0 <EXTI9_5_handler+0x13c>)
    1e1e:	7011      	strb	r1, [r2, #0]
    1e20:	461a      	mov	r2, r3
    1e22:	4b22      	ldr	r3, [pc, #136]	; (1eac <EXTI9_5_handler+0x138>)
    1e24:	781b      	ldrb	r3, [r3, #0]
    1e26:	b2d9      	uxtb	r1, r3
    1e28:	4b22      	ldr	r3, [pc, #136]	; (1eb4 <EXTI9_5_handler+0x140>)
    1e2a:	5499      	strb	r1, [r3, r2]
			ps2_tail&=PS2_QUEUE_SIZE-1;
    1e2c:	4b20      	ldr	r3, [pc, #128]	; (1eb0 <EXTI9_5_handler+0x13c>)
    1e2e:	781b      	ldrb	r3, [r3, #0]
    1e30:	b2db      	uxtb	r3, r3
    1e32:	f003 030f 	and.w	r3, r3, #15
    1e36:	b2da      	uxtb	r2, r3
    1e38:	4b1d      	ldr	r3, [pc, #116]	; (1eb0 <EXTI9_5_handler+0x13c>)
    1e3a:	701a      	strb	r2, [r3, #0]
	    }
	    bit_cnt=0;
    1e3c:	4b18      	ldr	r3, [pc, #96]	; (1ea0 <EXTI9_5_handler+0x12c>)
    1e3e:	2200      	movs	r2, #0
    1e40:	701a      	strb	r2, [r3, #0]
		break;
    1e42:	e021      	b.n	1e88 <EXTI9_5_handler+0x114>
	default:
		in_byte >>=1;
    1e44:	4b19      	ldr	r3, [pc, #100]	; (1eac <EXTI9_5_handler+0x138>)
    1e46:	781b      	ldrb	r3, [r3, #0]
    1e48:	b2db      	uxtb	r3, r3
    1e4a:	085b      	lsrs	r3, r3, #1
    1e4c:	b2da      	uxtb	r2, r3
    1e4e:	4b17      	ldr	r3, [pc, #92]	; (1eac <EXTI9_5_handler+0x138>)
    1e50:	701a      	strb	r2, [r3, #0]
		if(KBD_PORT->IDR & KBD_DAT_PIN){
    1e52:	4b15      	ldr	r3, [pc, #84]	; (1ea8 <EXTI9_5_handler+0x134>)
    1e54:	689b      	ldr	r3, [r3, #8]
    1e56:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1e5a:	2b00      	cmp	r3, #0
    1e5c:	d00c      	beq.n	1e78 <EXTI9_5_handler+0x104>
			in_byte |=128;
    1e5e:	4b13      	ldr	r3, [pc, #76]	; (1eac <EXTI9_5_handler+0x138>)
    1e60:	781b      	ldrb	r3, [r3, #0]
    1e62:	b2db      	uxtb	r3, r3
    1e64:	f063 037f 	orn	r3, r3, #127	; 0x7f
    1e68:	b2da      	uxtb	r2, r3
    1e6a:	4b10      	ldr	r3, [pc, #64]	; (1eac <EXTI9_5_handler+0x138>)
    1e6c:	701a      	strb	r2, [r3, #0]
			parity++;
    1e6e:	79fb      	ldrb	r3, [r7, #7]
    1e70:	b2db      	uxtb	r3, r3
    1e72:	3301      	adds	r3, #1
    1e74:	b2db      	uxtb	r3, r3
    1e76:	71fb      	strb	r3, [r7, #7]
		}
		bit_cnt++;
    1e78:	4b09      	ldr	r3, [pc, #36]	; (1ea0 <EXTI9_5_handler+0x12c>)
    1e7a:	781b      	ldrb	r3, [r3, #0]
    1e7c:	b2db      	uxtb	r3, r3
    1e7e:	3301      	adds	r3, #1
    1e80:	b2da      	uxtb	r2, r3
    1e82:	4b07      	ldr	r3, [pc, #28]	; (1ea0 <EXTI9_5_handler+0x12c>)
    1e84:	701a      	strb	r2, [r3, #0]
		break;
    1e86:	bf00      	nop
	}
	EXTI->PR|=KBD_CLK_PIN;
    1e88:	4a0b      	ldr	r2, [pc, #44]	; (1eb8 <EXTI9_5_handler+0x144>)
    1e8a:	4b0b      	ldr	r3, [pc, #44]	; (1eb8 <EXTI9_5_handler+0x144>)
    1e8c:	695b      	ldr	r3, [r3, #20]
    1e8e:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1e92:	6153      	str	r3, [r2, #20]
}
    1e94:	370c      	adds	r7, #12
    1e96:	46bd      	mov	sp, r7
    1e98:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e9c:	4770      	bx	lr
    1e9e:	bf00      	nop
    1ea0:	20000126 	.word	0x20000126
    1ea4:	20000124 	.word	0x20000124
    1ea8:	40010800 	.word	0x40010800
    1eac:	20000125 	.word	0x20000125
    1eb0:	20000111 	.word	0x20000111
    1eb4:	20000114 	.word	0x20000114
    1eb8:	40010400 	.word	0x40010400

00001ebc <TIM2_handler>:

void TIM2_handler(){
    1ebc:	b580      	push	{r7, lr}
    1ebe:	af00      	add	r7, sp, #0
	TMR2->SR&=~(BIT0);
    1ec0:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    1ec4:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1ec8:	691b      	ldr	r3, [r3, #16]
    1eca:	f023 0301 	bic.w	r3, r3, #1
    1ece:	6113      	str	r3, [r2, #16]
	if (ps2_tail!=ps2_head){
    1ed0:	4b0f      	ldr	r3, [pc, #60]	; (1f10 <TIM2_handler+0x54>)
    1ed2:	781b      	ldrb	r3, [r3, #0]
    1ed4:	b2da      	uxtb	r2, r3
    1ed6:	4b0f      	ldr	r3, [pc, #60]	; (1f14 <TIM2_handler+0x58>)
    1ed8:	781b      	ldrb	r3, [r3, #0]
    1eda:	b2db      	uxtb	r3, r3
    1edc:	429a      	cmp	r2, r3
    1ede:	d015      	beq.n	1f0c <TIM2_handler+0x50>
		convert_code(ps2_queue[ps2_head++]);
    1ee0:	4b0c      	ldr	r3, [pc, #48]	; (1f14 <TIM2_handler+0x58>)
    1ee2:	781b      	ldrb	r3, [r3, #0]
    1ee4:	b2db      	uxtb	r3, r3
    1ee6:	1c5a      	adds	r2, r3, #1
    1ee8:	b2d1      	uxtb	r1, r2
    1eea:	4a0a      	ldr	r2, [pc, #40]	; (1f14 <TIM2_handler+0x58>)
    1eec:	7011      	strb	r1, [r2, #0]
    1eee:	461a      	mov	r2, r3
    1ef0:	4b09      	ldr	r3, [pc, #36]	; (1f18 <TIM2_handler+0x5c>)
    1ef2:	5c9b      	ldrb	r3, [r3, r2]
    1ef4:	b2db      	uxtb	r3, r3
    1ef6:	4618      	mov	r0, r3
    1ef8:	f7ff fdc4 	bl	1a84 <convert_code>
		ps2_head&=PS2_QUEUE_SIZE-1;
    1efc:	4b05      	ldr	r3, [pc, #20]	; (1f14 <TIM2_handler+0x58>)
    1efe:	781b      	ldrb	r3, [r3, #0]
    1f00:	b2db      	uxtb	r3, r3
    1f02:	f003 030f 	and.w	r3, r3, #15
    1f06:	b2da      	uxtb	r2, r3
    1f08:	4b02      	ldr	r3, [pc, #8]	; (1f14 <TIM2_handler+0x58>)
    1f0a:	701a      	strb	r2, [r3, #0]
	}
}
    1f0c:	bd80      	pop	{r7, pc}
    1f0e:	bf00      	nop
    1f10:	20000111 	.word	0x20000111
    1f14:	20000110 	.word	0x20000110
    1f18:	20000114 	.word	0x20000114

00001f1c <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    1f1c:	b480      	push	{r7}
    1f1e:	b083      	sub	sp, #12
    1f20:	af00      	add	r7, sp, #0
    1f22:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    1f24:	687b      	ldr	r3, [r7, #4]
    1f26:	2b3b      	cmp	r3, #59	; 0x3b
    1f28:	d900      	bls.n	1f2c <enable_interrupt+0x10>
    1f2a:	e016      	b.n	1f5a <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    1f2c:	687b      	ldr	r3, [r7, #4]
    1f2e:	095b      	lsrs	r3, r3, #5
    1f30:	009b      	lsls	r3, r3, #2
    1f32:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    1f36:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    1f3a:	687a      	ldr	r2, [r7, #4]
    1f3c:	0952      	lsrs	r2, r2, #5
    1f3e:	0092      	lsls	r2, r2, #2
    1f40:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    1f44:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    1f48:	6812      	ldr	r2, [r2, #0]
    1f4a:	6879      	ldr	r1, [r7, #4]
    1f4c:	f001 011f 	and.w	r1, r1, #31
    1f50:	2001      	movs	r0, #1
    1f52:	fa00 f101 	lsl.w	r1, r0, r1
    1f56:	430a      	orrs	r2, r1
    1f58:	601a      	str	r2, [r3, #0]
}
    1f5a:	370c      	adds	r7, #12
    1f5c:	46bd      	mov	sp, r7
    1f5e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1f62:	4770      	bx	lr

00001f64 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    1f64:	b480      	push	{r7}
    1f66:	b083      	sub	sp, #12
    1f68:	af00      	add	r7, sp, #0
    1f6a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    1f6c:	687b      	ldr	r3, [r7, #4]
    1f6e:	2b3b      	cmp	r3, #59	; 0x3b
    1f70:	d900      	bls.n	1f74 <disable_interrupt+0x10>
    1f72:	e013      	b.n	1f9c <disable_interrupt+0x38>
	ICER[irq>>5]&=~(1<<(irq&0x1f));
    1f74:	687b      	ldr	r3, [r7, #4]
    1f76:	095b      	lsrs	r3, r3, #5
    1f78:	009a      	lsls	r2, r3, #2
    1f7a:	4b0b      	ldr	r3, [pc, #44]	; (1fa8 <disable_interrupt+0x44>)
    1f7c:	4413      	add	r3, r2
    1f7e:	687a      	ldr	r2, [r7, #4]
    1f80:	0952      	lsrs	r2, r2, #5
    1f82:	0091      	lsls	r1, r2, #2
    1f84:	4a08      	ldr	r2, [pc, #32]	; (1fa8 <disable_interrupt+0x44>)
    1f86:	440a      	add	r2, r1
    1f88:	6812      	ldr	r2, [r2, #0]
    1f8a:	6879      	ldr	r1, [r7, #4]
    1f8c:	f001 011f 	and.w	r1, r1, #31
    1f90:	2001      	movs	r0, #1
    1f92:	fa00 f101 	lsl.w	r1, r0, r1
    1f96:	43c9      	mvns	r1, r1
    1f98:	400a      	ands	r2, r1
    1f9a:	601a      	str	r2, [r3, #0]
}
    1f9c:	370c      	adds	r7, #12
    1f9e:	46bd      	mov	sp, r7
    1fa0:	f85d 7b04 	ldr.w	r7, [sp], #4
    1fa4:	4770      	bx	lr
    1fa6:	bf00      	nop
    1fa8:	e000e180 	.word	0xe000e180

00001fac <set_int_priority>:



void set_int_priority(int32_t irq, unsigned priority){
    1fac:	b480      	push	{r7}
    1fae:	b083      	sub	sp, #12
    1fb0:	af00      	add	r7, sp, #0
    1fb2:	6078      	str	r0, [r7, #4]
    1fb4:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    1fb6:	687b      	ldr	r3, [r7, #4]
    1fb8:	2b00      	cmp	r3, #0
    1fba:	db0d      	blt.n	1fd8 <set_int_priority+0x2c>
    1fbc:	687b      	ldr	r3, [r7, #4]
    1fbe:	2b3b      	cmp	r3, #59	; 0x3b
    1fc0:	dc0a      	bgt.n	1fd8 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    1fc2:	687b      	ldr	r3, [r7, #4]
    1fc4:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    1fc8:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    1fcc:	683a      	ldr	r2, [r7, #0]
    1fce:	b2d2      	uxtb	r2, r2
    1fd0:	0112      	lsls	r2, r2, #4
    1fd2:	b2d2      	uxtb	r2, r2
    1fd4:	701a      	strb	r2, [r3, #0]
    1fd6:	e012      	b.n	1ffe <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    1fd8:	687b      	ldr	r3, [r7, #4]
    1fda:	2b00      	cmp	r3, #0
    1fdc:	da0f      	bge.n	1ffe <set_int_priority+0x52>
    1fde:	687b      	ldr	r3, [r7, #4]
    1fe0:	f113 0f0f 	cmn.w	r3, #15
    1fe4:	db0b      	blt.n	1ffe <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    1fe6:	687a      	ldr	r2, [r7, #4]
    1fe8:	f06f 0303 	mvn.w	r3, #3
    1fec:	1a9b      	subs	r3, r3, r2
    1fee:	461a      	mov	r2, r3
    1ff0:	4b05      	ldr	r3, [pc, #20]	; (2008 <set_int_priority+0x5c>)
    1ff2:	4413      	add	r3, r2
    1ff4:	683a      	ldr	r2, [r7, #0]
    1ff6:	b2d2      	uxtb	r2, r2
    1ff8:	0112      	lsls	r2, r2, #4
    1ffa:	b2d2      	uxtb	r2, r2
    1ffc:	701a      	strb	r2, [r3, #0]
	}
}
    1ffe:	370c      	adds	r7, #12
    2000:	46bd      	mov	sp, r7
    2002:	f85d 7b04 	ldr.w	r7, [sp], #4
    2006:	4770      	bx	lr
    2008:	e000ed18 	.word	0xe000ed18

0000200c <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    200c:	b480      	push	{r7}
    200e:	b083      	sub	sp, #12
    2010:	af00      	add	r7, sp, #0
    2012:	6078      	str	r0, [r7, #4]
    2014:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    2016:	687b      	ldr	r3, [r7, #4]
    2018:	881b      	ldrh	r3, [r3, #0]
    201a:	b29b      	uxth	r3, r3
    201c:	f423 63e0 	bic.w	r3, r3, #1792	; 0x700
    2020:	b29a      	uxth	r2, r3
    2022:	687b      	ldr	r3, [r7, #4]
    2024:	801a      	strh	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    2026:	687b      	ldr	r3, [r7, #4]
    2028:	881b      	ldrh	r3, [r3, #0]
    202a:	b29a      	uxth	r2, r3
    202c:	683b      	ldr	r3, [r7, #0]
    202e:	b29b      	uxth	r3, r3
    2030:	00db      	lsls	r3, r3, #3
    2032:	b29b      	uxth	r3, r3
    2034:	4313      	orrs	r3, r2
    2036:	b29a      	uxth	r2, r3
    2038:	687b      	ldr	r3, [r7, #4]
    203a:	801a      	strh	r2, [r3, #0]
}
    203c:	370c      	adds	r7, #12
    203e:	46bd      	mov	sp, r7
    2040:	f85d 7b04 	ldr.w	r7, [sp], #4
    2044:	4770      	bx	lr
    2046:	bf00      	nop

00002048 <spi_init>:


void spi_init(spi_sfr_t* channel, unsigned baud){
    2048:	b580      	push	{r7, lr}
    204a:	b082      	sub	sp, #8
    204c:	af00      	add	r7, sp, #0
    204e:	6078      	str	r0, [r7, #4]
    2050:	6039      	str	r1, [r7, #0]
	spi_baudrate(channel,baud);
    2052:	6878      	ldr	r0, [r7, #4]
    2054:	6839      	ldr	r1, [r7, #0]
    2056:	f7ff ffd9 	bl	200c <spi_baudrate>
	channel->CR1=SPI_CR1_MSTR|SPI_CR1_SSM;
    205a:	687b      	ldr	r3, [r7, #4]
    205c:	f44f 7201 	mov.w	r2, #516	; 0x204
    2060:	801a      	strh	r2, [r3, #0]
	//channel->CR2|=SPI_CR2_SSOE;
	if (channel==SPI1){
    2062:	687b      	ldr	r3, [r7, #4]
    2064:	4a17      	ldr	r2, [pc, #92]	; (20c4 <spi_init+0x7c>)
    2066:	4293      	cmp	r3, r2
    2068:	d114      	bne.n	2094 <spi_init+0x4c>
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(GPIOA,4,OUTPUT_PP_FAST);
    206a:	2000      	movs	r0, #0
    206c:	2104      	movs	r1, #4
    206e:	2203      	movs	r2, #3
    2070:	f7ff fc32 	bl	18d8 <config_pin>
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(GPIOA,5,OUTPUT_PP_FAST);
    2074:	2000      	movs	r0, #0
    2076:	2105      	movs	r1, #5
    2078:	2203      	movs	r2, #3
    207a:	f7ff fc2d 	bl	18d8 <config_pin>
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(GPIOA,6,INPUT_FLOAT);
    207e:	2000      	movs	r0, #0
    2080:	2106      	movs	r1, #6
    2082:	2204      	movs	r2, #4
    2084:	f7ff fc28 	bl	18d8 <config_pin>
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(GPIOA,7,OUTPUT_PP_FAST);
    2088:	2000      	movs	r0, #0
    208a:	2107      	movs	r1, #7
    208c:	2203      	movs	r2, #3
    208e:	f7ff fc23 	bl	18d8 <config_pin>
    2092:	e013      	b.n	20bc <spi_init+0x74>
	}else{
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(GPIOB,2,OUTPUT_PP_FAST);
    2094:	2001      	movs	r0, #1
    2096:	2102      	movs	r1, #2
    2098:	2203      	movs	r2, #3
    209a:	f7ff fc1d 	bl	18d8 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(GPIOB,13,OUTPUT_PP_FAST);
    209e:	2001      	movs	r0, #1
    20a0:	210d      	movs	r1, #13
    20a2:	2203      	movs	r2, #3
    20a4:	f7ff fc18 	bl	18d8 <config_pin>
		// PB14 MISO input (floating)
		config_pin(GPIOB,14,INPUT_FLOAT);
    20a8:	2001      	movs	r0, #1
    20aa:	210e      	movs	r1, #14
    20ac:	2204      	movs	r2, #4
    20ae:	f7ff fc13 	bl	18d8 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(GPIOB,15,OUTPUT_PP_FAST);
    20b2:	2001      	movs	r0, #1
    20b4:	210f      	movs	r1, #15
    20b6:	2203      	movs	r2, #3
    20b8:	f7ff fc0e 	bl	18d8 <config_pin>
	}
}
    20bc:	3708      	adds	r7, #8
    20be:	46bd      	mov	sp, r7
    20c0:	bd80      	pop	{r7, pc}
    20c2:	bf00      	nop
    20c4:	40013000 	.word	0x40013000

000020c8 <spi_enable>:

void spi_enable(spi_sfr_t* channel, unsigned mode){
    20c8:	b480      	push	{r7}
    20ca:	b083      	sub	sp, #12
    20cc:	af00      	add	r7, sp, #0
    20ce:	6078      	str	r0, [r7, #4]
    20d0:	6039      	str	r1, [r7, #0]
	switch (mode){
    20d2:	683b      	ldr	r3, [r7, #0]
    20d4:	2b01      	cmp	r3, #1
    20d6:	d00d      	beq.n	20f4 <spi_enable+0x2c>
    20d8:	2b01      	cmp	r3, #1
    20da:	d302      	bcc.n	20e2 <spi_enable+0x1a>
    20dc:	2b02      	cmp	r3, #2
    20de:	d005      	beq.n	20ec <spi_enable+0x24>
    20e0:	e00d      	b.n	20fe <spi_enable+0x36>
		case SPI_MODE_READ:
		channel->CR1=SPI_CR1_RXONLY|SPI_CR1_SPE;
    20e2:	687b      	ldr	r3, [r7, #4]
    20e4:	f44f 6288 	mov.w	r2, #1088	; 0x440
    20e8:	801a      	strh	r2, [r3, #0]
		break;
    20ea:	e008      	b.n	20fe <spi_enable+0x36>
		case SPI_MODE_READ_WRITE:
		channel->CR1=SPI_CR1_SPE;
    20ec:	687b      	ldr	r3, [r7, #4]
    20ee:	2240      	movs	r2, #64	; 0x40
    20f0:	801a      	strh	r2, [r3, #0]
		break;
    20f2:	e004      	b.n	20fe <spi_enable+0x36>
		case SPI_MODE_WRITE:
		channel->CR1=SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE|SPI_CR1_SPE;
    20f4:	687b      	ldr	r3, [r7, #4]
    20f6:	f24c 0240 	movw	r2, #49216	; 0xc040
    20fa:	801a      	strh	r2, [r3, #0]
		break;
    20fc:	bf00      	nop
	}
}
    20fe:	370c      	adds	r7, #12
    2100:	46bd      	mov	sp, r7
    2102:	f85d 7b04 	ldr.w	r7, [sp], #4
    2106:	4770      	bx	lr

00002108 <spi_disable>:

void spi_disable(spi_sfr_t* channel){
    2108:	b480      	push	{r7}
    210a:	b083      	sub	sp, #12
    210c:	af00      	add	r7, sp, #0
    210e:	6078      	str	r0, [r7, #4]
	channel->CR1&=~SPI_CR1_SPE;
    2110:	687b      	ldr	r3, [r7, #4]
    2112:	881b      	ldrh	r3, [r3, #0]
    2114:	b29b      	uxth	r3, r3
    2116:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    211a:	b29a      	uxth	r2, r3
    211c:	687b      	ldr	r3, [r7, #4]
    211e:	801a      	strh	r2, [r3, #0]
}
    2120:	370c      	adds	r7, #12
    2122:	46bd      	mov	sp, r7
    2124:	f85d 7b04 	ldr.w	r7, [sp], #4
    2128:	4770      	bx	lr
    212a:	bf00      	nop

0000212c <spi_write>:

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
    212c:	b580      	push	{r7, lr}
    212e:	b082      	sub	sp, #8
    2130:	af00      	add	r7, sp, #0
    2132:	6078      	str	r0, [r7, #4]
    2134:	460b      	mov	r3, r1
    2136:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
    2138:	6878      	ldr	r0, [r7, #4]
    213a:	2101      	movs	r1, #1
    213c:	f7ff ffc4 	bl	20c8 <spi_enable>
	channel->DR=b;
    2140:	78fb      	ldrb	r3, [r7, #3]
    2142:	b29a      	uxth	r2, r3
    2144:	687b      	ldr	r3, [r7, #4]
    2146:	819a      	strh	r2, [r3, #12]
	spi_disable(channel);
    2148:	6878      	ldr	r0, [r7, #4]
    214a:	f7ff ffdd 	bl	2108 <spi_disable>
}
    214e:	3708      	adds	r7, #8
    2150:	46bd      	mov	sp, r7
    2152:	bd80      	pop	{r7, pc}

00002154 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    2154:	b580      	push	{r7, lr}
    2156:	b084      	sub	sp, #16
    2158:	af00      	add	r7, sp, #0
    215a:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
    215c:	6878      	ldr	r0, [r7, #4]
    215e:	2100      	movs	r1, #0
    2160:	f7ff ffb2 	bl	20c8 <spi_enable>
	channel->DR=255;
    2164:	687b      	ldr	r3, [r7, #4]
    2166:	22ff      	movs	r2, #255	; 0xff
    2168:	819a      	strh	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    216a:	bf00      	nop
    216c:	687b      	ldr	r3, [r7, #4]
    216e:	891b      	ldrh	r3, [r3, #8]
    2170:	b29b      	uxth	r3, r3
    2172:	f003 0301 	and.w	r3, r3, #1
    2176:	2b00      	cmp	r3, #0
    2178:	d0f8      	beq.n	216c <spi_read+0x18>
	rx=(uint8_t)channel->DR;
    217a:	687b      	ldr	r3, [r7, #4]
    217c:	899b      	ldrh	r3, [r3, #12]
    217e:	b29b      	uxth	r3, r3
    2180:	73fb      	strb	r3, [r7, #15]
	spi_disable(channel);
    2182:	6878      	ldr	r0, [r7, #4]
    2184:	f7ff ffc0 	bl	2108 <spi_disable>
	return rx;
    2188:	7bfb      	ldrb	r3, [r7, #15]
}
    218a:	4618      	mov	r0, r3
    218c:	3710      	adds	r7, #16
    218e:	46bd      	mov	sp, r7
    2190:	bd80      	pop	{r7, pc}
    2192:	bf00      	nop

00002194 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    2194:	b580      	push	{r7, lr}
    2196:	b084      	sub	sp, #16
    2198:	af00      	add	r7, sp, #0
    219a:	60f8      	str	r0, [r7, #12]
    219c:	60b9      	str	r1, [r7, #8]
    219e:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_WRITE);
    21a0:	68f8      	ldr	r0, [r7, #12]
    21a2:	2101      	movs	r1, #1
    21a4:	f7ff ff90 	bl	20c8 <spi_enable>
	while (count){
    21a8:	e011      	b.n	21ce <spi_block_write+0x3a>
		channel->DR=*buffer++;
    21aa:	68bb      	ldr	r3, [r7, #8]
    21ac:	1c5a      	adds	r2, r3, #1
    21ae:	60ba      	str	r2, [r7, #8]
    21b0:	781b      	ldrb	r3, [r3, #0]
    21b2:	b29a      	uxth	r2, r3
    21b4:	68fb      	ldr	r3, [r7, #12]
    21b6:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    21b8:	bf00      	nop
    21ba:	68fb      	ldr	r3, [r7, #12]
    21bc:	891b      	ldrh	r3, [r3, #8]
    21be:	b29b      	uxth	r3, r3
    21c0:	f003 0302 	and.w	r3, r3, #2
    21c4:	2b00      	cmp	r3, #0
    21c6:	d0f8      	beq.n	21ba <spi_block_write+0x26>
		count--;
    21c8:	687b      	ldr	r3, [r7, #4]
    21ca:	3b01      	subs	r3, #1
    21cc:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_enable(channel,SPI_MODE_WRITE);
	while (count){
    21ce:	687b      	ldr	r3, [r7, #4]
    21d0:	2b00      	cmp	r3, #0
    21d2:	d1ea      	bne.n	21aa <spi_block_write+0x16>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	spi_disable(channel);
    21d4:	68f8      	ldr	r0, [r7, #12]
    21d6:	f7ff ff97 	bl	2108 <spi_disable>
}
    21da:	3710      	adds	r7, #16
    21dc:	46bd      	mov	sp, r7
    21de:	bd80      	pop	{r7, pc}

000021e0 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    21e0:	b580      	push	{r7, lr}
    21e2:	b084      	sub	sp, #16
    21e4:	af00      	add	r7, sp, #0
    21e6:	60f8      	str	r0, [r7, #12]
    21e8:	60b9      	str	r1, [r7, #8]
    21ea:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_READ);
    21ec:	68f8      	ldr	r0, [r7, #12]
    21ee:	2100      	movs	r1, #0
    21f0:	f7ff ff6a 	bl	20c8 <spi_enable>
	while (count){
    21f4:	e015      	b.n	2222 <spi_block_read+0x42>
		channel->DR=0;
    21f6:	68fb      	ldr	r3, [r7, #12]
    21f8:	2200      	movs	r2, #0
    21fa:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    21fc:	bf00      	nop
    21fe:	68fb      	ldr	r3, [r7, #12]
    2200:	891b      	ldrh	r3, [r3, #8]
    2202:	b29b      	uxth	r3, r3
    2204:	f003 0301 	and.w	r3, r3, #1
    2208:	2b00      	cmp	r3, #0
    220a:	d0f8      	beq.n	21fe <spi_block_read+0x1e>
		*buffer++=(uint8_t)channel->DR;
    220c:	68bb      	ldr	r3, [r7, #8]
    220e:	1c5a      	adds	r2, r3, #1
    2210:	60ba      	str	r2, [r7, #8]
    2212:	68fa      	ldr	r2, [r7, #12]
    2214:	8992      	ldrh	r2, [r2, #12]
    2216:	b292      	uxth	r2, r2
    2218:	b2d2      	uxtb	r2, r2
    221a:	701a      	strb	r2, [r3, #0]
		count--;
    221c:	687b      	ldr	r3, [r7, #4]
    221e:	3b01      	subs	r3, #1
    2220:	607b      	str	r3, [r7, #4]
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_enable(channel,SPI_MODE_READ);
	while (count){
    2222:	687b      	ldr	r3, [r7, #4]
    2224:	2b00      	cmp	r3, #0
    2226:	d1e6      	bne.n	21f6 <spi_block_read+0x16>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
	spi_disable(channel);
    2228:	68f8      	ldr	r0, [r7, #12]
    222a:	f7ff ff6d 	bl	2108 <spi_disable>
}
    222e:	3710      	adds	r7, #16
    2230:	46bd      	mov	sp, r7
    2232:	bd80      	pop	{r7, pc}

00002234 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    2234:	4b01      	ldr	r3, [pc, #4]	; (223c <reset_mcu+0x8>)
    2236:	4a02      	ldr	r2, [pc, #8]	; (2240 <reset_mcu+0xc>)
    2238:	601a      	str	r2, [r3, #0]
    223a:	bf00      	nop
    223c:	e000ed0c 	.word	0xe000ed0c
    2240:	05fa0004 	.word	0x05fa0004

00002244 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    2244:	b580      	push	{r7, lr}
    2246:	b082      	sub	sp, #8
    2248:	af00      	add	r7, sp, #0
    224a:	6078      	str	r0, [r7, #4]
    224c:	6039      	str	r1, [r7, #0]
	print(msg);
    224e:	6878      	ldr	r0, [r7, #4]
    2250:	f7fe ff7c 	bl	114c <print>
	print("at address ");
    2254:	4814      	ldr	r0, [pc, #80]	; (22a8 <print_fault+0x64>)
    2256:	f7fe ff79 	bl	114c <print>
	if (adr) {
    225a:	683b      	ldr	r3, [r7, #0]
    225c:	2b00      	cmp	r3, #0
    225e:	d002      	beq.n	2266 <print_fault+0x22>
		print_hex(adr);
    2260:	6838      	ldr	r0, [r7, #0]
    2262:	f7ff f8e1 	bl	1428 <print_hex>
	};
	conout(CR);
    2266:	200d      	movs	r0, #13
    2268:	f7fe ff3e 	bl	10e8 <conout>
	print("UFSR=");
    226c:	480f      	ldr	r0, [pc, #60]	; (22ac <print_fault+0x68>)
    226e:	f7fe ff6d 	bl	114c <print>
	print_hex(CFSR->fsr.usageFalt);
    2272:	4b0f      	ldr	r3, [pc, #60]	; (22b0 <print_fault+0x6c>)
    2274:	681b      	ldr	r3, [r3, #0]
    2276:	0c1b      	lsrs	r3, r3, #16
    2278:	b29b      	uxth	r3, r3
    227a:	4618      	mov	r0, r3
    227c:	f7ff f8d4 	bl	1428 <print_hex>
	print(", BFSR=");
    2280:	480c      	ldr	r0, [pc, #48]	; (22b4 <print_fault+0x70>)
    2282:	f7fe ff63 	bl	114c <print>
	print_hex(CFSR->fsr.busFault);
    2286:	4b0a      	ldr	r3, [pc, #40]	; (22b0 <print_fault+0x6c>)
    2288:	681b      	ldr	r3, [r3, #0]
    228a:	0a1b      	lsrs	r3, r3, #8
    228c:	b2db      	uxtb	r3, r3
    228e:	4618      	mov	r0, r3
    2290:	f7ff f8ca 	bl	1428 <print_hex>
	print(", MMFSR=");
    2294:	4808      	ldr	r0, [pc, #32]	; (22b8 <print_fault+0x74>)
    2296:	f7fe ff59 	bl	114c <print>
	print_hex(CFSR->fsr.mmFault);
    229a:	4b05      	ldr	r3, [pc, #20]	; (22b0 <print_fault+0x6c>)
    229c:	681b      	ldr	r3, [r3, #0]
    229e:	b2db      	uxtb	r3, r3
    22a0:	4618      	mov	r0, r3
    22a2:	f7ff f8c1 	bl	1428 <print_hex>
	while(1);
    22a6:	e7fe      	b.n	22a6 <print_fault+0x62>
    22a8:	00002f08 	.word	0x00002f08
    22ac:	00002f14 	.word	0x00002f14
    22b0:	e000ed28 	.word	0xe000ed28
    22b4:	00002f1c 	.word	0x00002f1c
    22b8:	00002f24 	.word	0x00002f24

000022bc <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    22bc:	b480      	push	{r7}
    22be:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    22c0:	2300      	movs	r3, #0
    22c2:	2200      	movs	r2, #0
    22c4:	4618      	mov	r0, r3
    22c6:	4611      	mov	r1, r2
    22c8:	df02      	svc	2
}
    22ca:	46bd      	mov	sp, r7
    22cc:	f85d 7b04 	ldr.w	r7, [sp], #4
    22d0:	4770      	bx	lr
    22d2:	bf00      	nop

000022d4 <tvout_init>:

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
    22d4:	b580      	push	{r7, lr}
    22d6:	b082      	sub	sp, #8
    22d8:	af00      	add	r7, sp, #0
	//sortie sync sur PA8
	config_pin(GPIOA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    22da:	2000      	movs	r0, #0
    22dc:	2108      	movs	r1, #8
    22de:	220a      	movs	r2, #10
    22e0:	f7ff fafa 	bl	18d8 <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(GPIOB,15,OUTPUT_ALT_PP_FAST);
    22e4:	2001      	movs	r0, #1
    22e6:	210f      	movs	r1, #15
    22e8:	220b      	movs	r2, #11
    22ea:	f7ff faf5 	bl	18d8 <config_pin>
	PORTB->BRR=BIT15;
    22ee:	4b4b      	ldr	r3, [pc, #300]	; (241c <tvout_init+0x148>)
    22f0:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    22f4:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
    22f6:	4a4a      	ldr	r2, [pc, #296]	; (2420 <tvout_init+0x14c>)
    22f8:	4b49      	ldr	r3, [pc, #292]	; (2420 <tvout_init+0x14c>)
    22fa:	699b      	ldr	r3, [r3, #24]
    22fc:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    2300:	6193      	str	r3, [r2, #24]
	// clock source division
	*TIMER1_PSC=0;
    2302:	4b48      	ldr	r3, [pc, #288]	; (2424 <tvout_init+0x150>)
    2304:	2200      	movs	r2, #0
    2306:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    2308:	4b47      	ldr	r3, [pc, #284]	; (2428 <tvout_init+0x154>)
    230a:	f640 72ff 	movw	r2, #4095	; 0xfff
    230e:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    2310:	4b46      	ldr	r3, [pc, #280]	; (242c <tvout_init+0x158>)
    2312:	f240 122b 	movw	r2, #299	; 0x12b
    2316:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    2318:	4b45      	ldr	r3, [pc, #276]	; (2430 <tvout_init+0x15c>)
    231a:	681a      	ldr	r2, [r3, #0]
    231c:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    2320:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    2324:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    2326:	4b42      	ldr	r3, [pc, #264]	; (2430 <tvout_init+0x15c>)
    2328:	681a      	ldr	r2, [r3, #0]
    232a:	f042 0208 	orr.w	r2, r2, #8
    232e:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    2330:	4b40      	ldr	r3, [pc, #256]	; (2434 <tvout_init+0x160>)
    2332:	681a      	ldr	r2, [r3, #0]
    2334:	f042 0201 	orr.w	r2, r2, #1
    2338:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    233a:	4b3e      	ldr	r3, [pc, #248]	; (2434 <tvout_init+0x160>)
    233c:	681a      	ldr	r2, [r3, #0]
    233e:	f042 0202 	orr.w	r2, r2, #2
    2342:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    2344:	4a3c      	ldr	r2, [pc, #240]	; (2438 <tvout_init+0x164>)
    2346:	8813      	ldrh	r3, [r2, #0]
    2348:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    234c:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    2350:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    2352:	4b3a      	ldr	r3, [pc, #232]	; (243c <tvout_init+0x168>)
    2354:	681a      	ldr	r2, [r3, #0]
    2356:	f042 0201 	orr.w	r2, r2, #1
    235a:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    235c:	4b38      	ldr	r3, [pc, #224]	; (2440 <tvout_init+0x16c>)
    235e:	f640 324c 	movw	r2, #2892	; 0xb4c
    2362:	801a      	strh	r2, [r3, #0]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    2364:	4b37      	ldr	r3, [pc, #220]	; (2444 <tvout_init+0x170>)
    2366:	f243 5292 	movw	r2, #13714	; 0x3592
    236a:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    236c:	4b35      	ldr	r3, [pc, #212]	; (2444 <tvout_init+0x170>)
    236e:	4a36      	ldr	r2, [pc, #216]	; (2448 <tvout_init+0x174>)
    2370:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    2372:	4a33      	ldr	r2, [pc, #204]	; (2440 <tvout_init+0x16c>)
    2374:	4b32      	ldr	r3, [pc, #200]	; (2440 <tvout_init+0x16c>)
    2376:	889b      	ldrh	r3, [r3, #4]
    2378:	b29b      	uxth	r3, r3
    237a:	f043 0302 	orr.w	r3, r3, #2
    237e:	b29b      	uxth	r3, r3
    2380:	8093      	strh	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,7);
    2382:	200f      	movs	r0, #15
    2384:	2107      	movs	r1, #7
    2386:	f7ff fe11 	bl	1fac <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    238a:	200f      	movs	r0, #15
    238c:	f7ff fdc6 	bl	1f1c <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    2390:	4b2e      	ldr	r3, [pc, #184]	; (244c <tvout_init+0x178>)
    2392:	681a      	ldr	r2, [r3, #0]
    2394:	f042 0202 	orr.w	r2, r2, #2
    2398:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,7);
    239a:	201b      	movs	r0, #27
    239c:	2107      	movs	r1, #7
    239e:	f7ff fe05 	bl	1fac <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    23a2:	201b      	movs	r0, #27
    23a4:	f7ff fdba 	bl	1f1c <enable_interrupt>
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    23a8:	2300      	movs	r3, #0
    23aa:	607b      	str	r3, [r7, #4]
    23ac:	e011      	b.n	23d2 <tvout_init+0xfe>
		video_buffer[i]=0xffff;
    23ae:	4a28      	ldr	r2, [pc, #160]	; (2450 <tvout_init+0x17c>)
    23b0:	687b      	ldr	r3, [r7, #4]
    23b2:	f64f 71ff 	movw	r1, #65535	; 0xffff
    23b6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
    23ba:	687b      	ldr	r3, [r7, #4]
    23bc:	f503 5395 	add.w	r3, r3, #4768	; 0x12a0
    23c0:	330c      	adds	r3, #12
    23c2:	4a23      	ldr	r2, [pc, #140]	; (2450 <tvout_init+0x17c>)
    23c4:	f64f 71ff 	movw	r1, #65535	; 0xffff
    23c8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,7);
	enable_interrupt(IRQ_TIM1_CC);
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    23cc:	687b      	ldr	r3, [r7, #4]
    23ce:	3301      	adds	r3, #1
    23d0:	607b      	str	r3, [r7, #4]
    23d2:	687b      	ldr	r3, [r7, #4]
    23d4:	2b13      	cmp	r3, #19
    23d6:	ddea      	ble.n	23ae <tvout_init+0xda>
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    23d8:	2301      	movs	r3, #1
    23da:	607b      	str	r3, [r7, #4]
    23dc:	e018      	b.n	2410 <tvout_init+0x13c>
		video_buffer[i*ROW_SIZE]=0x8000;
    23de:	687a      	ldr	r2, [r7, #4]
    23e0:	4613      	mov	r3, r2
    23e2:	009b      	lsls	r3, r3, #2
    23e4:	4413      	add	r3, r2
    23e6:	009b      	lsls	r3, r3, #2
    23e8:	461a      	mov	r2, r3
    23ea:	4b19      	ldr	r3, [pc, #100]	; (2450 <tvout_init+0x17c>)
    23ec:	f44f 4100 	mov.w	r1, #32768	; 0x8000
    23f0:	f823 1012 	strh.w	r1, [r3, r2, lsl #1]
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
    23f4:	687b      	ldr	r3, [r7, #4]
    23f6:	1c5a      	adds	r2, r3, #1
    23f8:	4613      	mov	r3, r2
    23fa:	009b      	lsls	r3, r3, #2
    23fc:	4413      	add	r3, r2
    23fe:	009b      	lsls	r3, r3, #2
    2400:	3b01      	subs	r3, #1
    2402:	4a13      	ldr	r2, [pc, #76]	; (2450 <tvout_init+0x17c>)
    2404:	2101      	movs	r1, #1
    2406:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i;
	for (i=0;i<ROW_SIZE;i++){
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    240a:	687b      	ldr	r3, [r7, #4]
    240c:	3301      	adds	r3, #1
    240e:	607b      	str	r3, [r7, #4]
    2410:	687b      	ldr	r3, [r7, #4]
    2412:	2bed      	cmp	r3, #237	; 0xed
    2414:	dde3      	ble.n	23de <tvout_init+0x10a>
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	// test end
 }
    2416:	3708      	adds	r7, #8
    2418:	46bd      	mov	sp, r7
    241a:	bd80      	pop	{r7, pc}
    241c:	40010c00 	.word	0x40010c00
    2420:	40021000 	.word	0x40021000
    2424:	40012c28 	.word	0x40012c28
    2428:	40012c2c 	.word	0x40012c2c
    242c:	40012c34 	.word	0x40012c34
    2430:	40012c18 	.word	0x40012c18
    2434:	40012c20 	.word	0x40012c20
    2438:	40012c44 	.word	0x40012c44
    243c:	40012c00 	.word	0x40012c00
    2440:	40003800 	.word	0x40003800
    2444:	40020058 	.word	0x40020058
    2448:	4000380c 	.word	0x4000380c
    244c:	40012c0c 	.word	0x40012c0c
    2450:	20000134 	.word	0x20000134

00002454 <TIM1_CC_handler>:
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
    2454:	b410      	push	{r4}
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
    2456:	4b50      	ldr	r3, [pc, #320]	; (2598 <TIM1_CC_handler+0x144>)
	TIMER1_SR->fld.cc1if=0;
    2458:	4950      	ldr	r1, [pc, #320]	; (259c <TIM1_CC_handler+0x148>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
    245a:	681a      	ldr	r2, [r3, #0]
    245c:	3201      	adds	r2, #1
    245e:	601a      	str	r2, [r3, #0]
	TIMER1_SR->fld.cc1if=0;
    2460:	680a      	ldr	r2, [r1, #0]
    2462:	f022 0202 	bic.w	r2, r2, #2
    2466:	600a      	str	r2, [r1, #0]
	switch(line_count){
    2468:	681a      	ldr	r2, [r3, #0]
    246a:	2a12      	cmp	r2, #18
    246c:	f000 808f 	beq.w	258e <TIM1_CC_handler+0x13a>
    2470:	dd1b      	ble.n	24aa <TIM1_CC_handler+0x56>
    2472:	f5b2 7f96 	cmp.w	r2, #300	; 0x12c
    2476:	d07d      	beq.n	2574 <TIM1_CC_handler+0x120>
    2478:	dd42      	ble.n	2500 <TIM1_CC_handler+0xac>
    247a:	f240 1141 	movw	r1, #321	; 0x141
    247e:	428a      	cmp	r2, r1
    2480:	d029      	beq.n	24d6 <TIM1_CC_handler+0x82>
    2482:	f5b2 7fa1 	cmp.w	r2, #322	; 0x142
    2486:	d151      	bne.n	252c <TIM1_CC_handler+0xd8>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    2488:	4a45      	ldr	r2, [pc, #276]	; (25a0 <TIM1_CC_handler+0x14c>)
    248a:	6811      	ldr	r1, [r2, #0]
    248c:	b151      	cbz	r1, 24a4 <TIM1_CC_handler+0x50>
			*TIMER1_ARR/=2;
    248e:	4845      	ldr	r0, [pc, #276]	; (25a4 <TIM1_CC_handler+0x150>)
			line_count=-1;
    2490:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    2494:	8801      	ldrh	r1, [r0, #0]
    2496:	f3c1 014e 	ubfx	r1, r1, #1, #15
    249a:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    249c:	601c      	str	r4, [r3, #0]
			even=-even;
    249e:	6813      	ldr	r3, [r2, #0]
    24a0:	425b      	negs	r3, r3
    24a2:	6013      	str	r3, [r2, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    24a4:	f85d 4b04 	ldr.w	r4, [sp], #4
    24a8:	4770      	bx	lr
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    24aa:	2a06      	cmp	r2, #6
    24ac:	d068      	beq.n	2580 <TIM1_CC_handler+0x12c>
    24ae:	dd2f      	ble.n	2510 <TIM1_CC_handler+0xbc>
    24b0:	2a0c      	cmp	r2, #12
    24b2:	d01b      	beq.n	24ec <TIM1_CC_handler+0x98>
    24b4:	2a11      	cmp	r2, #17
    24b6:	d139      	bne.n	252c <TIM1_CC_handler+0xd8>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
		break;
	case 17: // fin sync champ paire
		if (even){
    24b8:	4b39      	ldr	r3, [pc, #228]	; (25a0 <TIM1_CC_handler+0x14c>)
    24ba:	681b      	ldr	r3, [r3, #0]
    24bc:	2b00      	cmp	r3, #0
    24be:	d0f1      	beq.n	24a4 <TIM1_CC_handler+0x50>
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    24c0:	f640 70ff 	movw	r0, #4095	; 0xfff
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    24c4:	f240 122b 	movw	r2, #299	; 0x12b
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    24c8:	4936      	ldr	r1, [pc, #216]	; (25a4 <TIM1_CC_handler+0x150>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    24ca:	4b37      	ldr	r3, [pc, #220]	; (25a8 <TIM1_CC_handler+0x154>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    24cc:	8008      	strh	r0, [r1, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    24ce:	801a      	strh	r2, [r3, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    24d0:	f85d 4b04 	ldr.w	r4, [sp], #4
    24d4:	4770      	bx	lr
	case (TOP_LINE+VRES):
		video=0;
		//_disable_dma();
		break;
	case FIELD_END:
		if (!even){
    24d6:	4a32      	ldr	r2, [pc, #200]	; (25a0 <TIM1_CC_handler+0x14c>)
    24d8:	6811      	ldr	r1, [r2, #0]
    24da:	2900      	cmp	r1, #0
    24dc:	d1e2      	bne.n	24a4 <TIM1_CC_handler+0x50>
			line_count=-1;
    24de:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    24e2:	6019      	str	r1, [r3, #0]
			even=-even;
    24e4:	6813      	ldr	r3, [r2, #0]
    24e6:	425b      	negs	r3, r3
    24e8:	6013      	str	r3, [r2, #0]
    24ea:	e7db      	b.n	24a4 <TIM1_CC_handler+0x50>
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    24ec:	f240 70ff 	movw	r0, #2047	; 0x7ff
    24f0:	492c      	ldr	r1, [pc, #176]	; (25a4 <TIM1_CC_handler+0x150>)
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    24f2:	4b2d      	ldr	r3, [pc, #180]	; (25a8 <TIM1_CC_handler+0x154>)
    24f4:	2295      	movs	r2, #149	; 0x95
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    24f6:	8008      	strh	r0, [r1, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    24f8:	801a      	strh	r2, [r3, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    24fa:	f85d 4b04 	ldr.w	r4, [sp], #4
    24fe:	4770      	bx	lr
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2500:	2a3b      	cmp	r2, #59	; 0x3b
    2502:	d113      	bne.n	252c <TIM1_CC_handler+0xd8>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    2504:	4b29      	ldr	r3, [pc, #164]	; (25ac <TIM1_CC_handler+0x158>)
    2506:	2201      	movs	r2, #1
    2508:	601a      	str	r2, [r3, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    250a:	f85d 4b04 	ldr.w	r4, [sp], #4
    250e:	4770      	bx	lr
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2510:	b962      	cbnz	r2, 252c <TIM1_CC_handler+0xd8>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    2512:	4924      	ldr	r1, [pc, #144]	; (25a4 <TIM1_CC_handler+0x150>)
		*TIMER1_CCR1/=2;
    2514:	4a24      	ldr	r2, [pc, #144]	; (25a8 <TIM1_CC_handler+0x154>)
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    2516:	880b      	ldrh	r3, [r1, #0]
    2518:	f3c3 034e 	ubfx	r3, r3, #1, #15
    251c:	800b      	strh	r3, [r1, #0]
		*TIMER1_CCR1/=2;
    251e:	8813      	ldrh	r3, [r2, #0]
    2520:	f3c3 034e 	ubfx	r3, r3, #1, #15
    2524:	8013      	strh	r3, [r2, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    2526:	f85d 4b04 	ldr.w	r4, [sp], #4
    252a:	4770      	bx	lr
			line_count=-1;
			even=-even;
		}
	    break;
	default: 
		if (video){
    252c:	4a1f      	ldr	r2, [pc, #124]	; (25ac <TIM1_CC_handler+0x158>)
    252e:	6812      	ldr	r2, [r2, #0]
    2530:	2a00      	cmp	r2, #0
    2532:	d0b7      	beq.n	24a4 <TIM1_CC_handler+0x50>
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
    2534:	491e      	ldr	r1, [pc, #120]	; (25b0 <TIM1_CC_handler+0x15c>)
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2536:	481f      	ldr	r0, [pc, #124]	; (25b4 <TIM1_CC_handler+0x160>)
		}
	    break;
	default: 
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
    2538:	680a      	ldr	r2, [r1, #0]
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			DMA1[DMACH5].cndtr=ROW_SIZE;
    253a:	2414      	movs	r4, #20
		}
	    break;
	default: 
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
    253c:	f022 0201 	bic.w	r2, r2, #1
    2540:	600a      	str	r2, [r1, #0]
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2542:	681b      	ldr	r3, [r3, #0]
			DMA1[DMACH5].cndtr=ROW_SIZE;
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    2544:	4a1c      	ldr	r2, [pc, #112]	; (25b8 <TIM1_CC_handler+0x164>)
	    break;
	default: 
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2546:	3b3c      	subs	r3, #60	; 0x3c
    2548:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    254c:	eb00 03c3 	add.w	r3, r0, r3, lsl #3
    2550:	60cb      	str	r3, [r1, #12]
			DMA1[DMACH5].cndtr=ROW_SIZE;
    2552:	604c      	str	r4, [r1, #4]
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    2554:	8813      	ldrh	r3, [r2, #0]
    2556:	b29b      	uxth	r3, r3
    2558:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
    255c:	d204      	bcs.n	2568 <TIM1_CC_handler+0x114>
    255e:	8813      	ldrh	r3, [r2, #0]
    2560:	b29b      	uxth	r3, r3
    2562:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
    2566:	d3fa      	bcc.n	255e <TIM1_CC_handler+0x10a>
			_enable_dma();
    2568:	4a11      	ldr	r2, [pc, #68]	; (25b0 <TIM1_CC_handler+0x15c>)
    256a:	6813      	ldr	r3, [r2, #0]
    256c:	f043 0301 	orr.w	r3, r3, #1
    2570:	6013      	str	r3, [r2, #0]
    2572:	e797      	b.n	24a4 <TIM1_CC_handler+0x50>
	case TOP_LINE-1:
		video=1;
		//_enable_dma();
		break;
	case (TOP_LINE+VRES):
		video=0;
    2574:	4b0d      	ldr	r3, [pc, #52]	; (25ac <TIM1_CC_handler+0x158>)
    2576:	2200      	movs	r2, #0
    2578:	601a      	str	r2, [r3, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    257a:	f85d 4b04 	ldr.w	r4, [sp], #4
    257e:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    2580:	f240 7269 	movw	r2, #1897	; 0x769
    2584:	4b08      	ldr	r3, [pc, #32]	; (25a8 <TIM1_CC_handler+0x154>)
    2586:	801a      	strh	r2, [r3, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    2588:	f85d 4b04 	ldr.w	r4, [sp], #4
    258c:	4770      	bx	lr
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
    258e:	4b04      	ldr	r3, [pc, #16]	; (25a0 <TIM1_CC_handler+0x14c>)
    2590:	681b      	ldr	r3, [r3, #0]
    2592:	2b00      	cmp	r3, #0
    2594:	d186      	bne.n	24a4 <TIM1_CC_handler+0x50>
    2596:	e793      	b.n	24c0 <TIM1_CC_handler+0x6c>
    2598:	20000004 	.word	0x20000004
    259c:	40012c10 	.word	0x40012c10
    25a0:	2000012c 	.word	0x2000012c
    25a4:	40012c2c 	.word	0x40012c2c
    25a8:	40012c34 	.word	0x40012c34
    25ac:	20000128 	.word	0x20000128
    25b0:	40020058 	.word	0x40020058
    25b4:	20000134 	.word	0x20000134
    25b8:	40012c24 	.word	0x40012c24

000025bc <DMA1CH5_handler>:
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
    25bc:	b480      	push	{r7}
    25be:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    25c0:	4a0a      	ldr	r2, [pc, #40]	; (25ec <DMA1CH5_handler+0x30>)
    25c2:	4b0a      	ldr	r3, [pc, #40]	; (25ec <DMA1CH5_handler+0x30>)
    25c4:	685b      	ldr	r3, [r3, #4]
    25c6:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    25ca:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    25cc:	bf00      	nop
    25ce:	4b08      	ldr	r3, [pc, #32]	; (25f0 <DMA1CH5_handler+0x34>)
    25d0:	891b      	ldrh	r3, [r3, #8]
    25d2:	b29b      	uxth	r3, r3
    25d4:	f003 0302 	and.w	r3, r3, #2
    25d8:	2b00      	cmp	r3, #0
    25da:	d0f8      	beq.n	25ce <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    25dc:	4b04      	ldr	r3, [pc, #16]	; (25f0 <DMA1CH5_handler+0x34>)
    25de:	2200      	movs	r2, #0
    25e0:	819a      	strh	r2, [r3, #12]
}
    25e2:	46bd      	mov	sp, r7
    25e4:	f85d 7b04 	ldr.w	r7, [sp], #4
    25e8:	4770      	bx	lr
    25ea:	bf00      	nop
    25ec:	40020000 	.word	0x40020000
    25f0:	40003800 	.word	0x40003800

000025f4 <usart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
    25f4:	b480      	push	{r7}
    25f6:	b085      	sub	sp, #20
    25f8:	af00      	add	r7, sp, #0
    25fa:	6078      	str	r0, [r7, #4]
    25fc:	6039      	str	r1, [r7, #0]
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
    25fe:	687b      	ldr	r3, [r7, #4]
    2600:	4a14      	ldr	r2, [pc, #80]	; (2654 <usart_set_baud+0x60>)
    2602:	4293      	cmp	r3, r2
    2604:	d10f      	bne.n	2626 <usart_set_baud+0x32>
		rate=(FAPB2/baud/16)<<4;
    2606:	4a14      	ldr	r2, [pc, #80]	; (2658 <usart_set_baud+0x64>)
    2608:	683b      	ldr	r3, [r7, #0]
    260a:	fbb2 f3f3 	udiv	r3, r2, r3
    260e:	011b      	lsls	r3, r3, #4
    2610:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    2612:	4a12      	ldr	r2, [pc, #72]	; (265c <usart_set_baud+0x68>)
    2614:	683b      	ldr	r3, [r7, #0]
    2616:	fbb2 f3f3 	udiv	r3, r2, r3
    261a:	f003 030f 	and.w	r3, r3, #15
    261e:	68fa      	ldr	r2, [r7, #12]
    2620:	4313      	orrs	r3, r2
    2622:	60fb      	str	r3, [r7, #12]
    2624:	e00e      	b.n	2644 <usart_set_baud+0x50>
	}else{
		rate=(FAPB1/baud/16)<<4;
    2626:	4a0e      	ldr	r2, [pc, #56]	; (2660 <usart_set_baud+0x6c>)
    2628:	683b      	ldr	r3, [r7, #0]
    262a:	fbb2 f3f3 	udiv	r3, r2, r3
    262e:	011b      	lsls	r3, r3, #4
    2630:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    2632:	4a0c      	ldr	r2, [pc, #48]	; (2664 <usart_set_baud+0x70>)
    2634:	683b      	ldr	r3, [r7, #0]
    2636:	fbb2 f3f3 	udiv	r3, r2, r3
    263a:	f003 030f 	and.w	r3, r3, #15
    263e:	68fa      	ldr	r2, [r7, #12]
    2640:	4313      	orrs	r3, r2
    2642:	60fb      	str	r3, [r7, #12]
	}
	channel->BRR=rate;
    2644:	687b      	ldr	r3, [r7, #4]
    2646:	68fa      	ldr	r2, [r7, #12]
    2648:	609a      	str	r2, [r3, #8]
}
    264a:	3714      	adds	r7, #20
    264c:	46bd      	mov	sp, r7
    264e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2652:	4770      	bx	lr
    2654:	40013800 	.word	0x40013800
    2658:	003d0900 	.word	0x003d0900
    265c:	03d09000 	.word	0x03d09000
    2660:	001e8480 	.word	0x001e8480
    2664:	01e84800 	.word	0x01e84800

00002668 <usart_comm_dir>:

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
    2668:	b480      	push	{r7}
    266a:	b083      	sub	sp, #12
    266c:	af00      	add	r7, sp, #0
    266e:	6078      	str	r0, [r7, #4]
    2670:	6039      	str	r1, [r7, #0]
	channel->CR1&=USART_CR1_DIR_MASK;
    2672:	687b      	ldr	r3, [r7, #4]
    2674:	68db      	ldr	r3, [r3, #12]
    2676:	f023 020c 	bic.w	r2, r3, #12
    267a:	687b      	ldr	r3, [r7, #4]
    267c:	60da      	str	r2, [r3, #12]
	channel->CR1|=direction<<USART_CR1_DIR_POS;
    267e:	687b      	ldr	r3, [r7, #4]
    2680:	68da      	ldr	r2, [r3, #12]
    2682:	683b      	ldr	r3, [r7, #0]
    2684:	009b      	lsls	r3, r3, #2
    2686:	431a      	orrs	r2, r3
    2688:	687b      	ldr	r3, [r7, #4]
    268a:	60da      	str	r2, [r3, #12]
}
    268c:	370c      	adds	r7, #12
    268e:	46bd      	mov	sp, r7
    2690:	f85d 7b04 	ldr.w	r7, [sp], #4
    2694:	4770      	bx	lr
    2696:	bf00      	nop

00002698 <usart_open_channel>:


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
    2698:	b580      	push	{r7, lr}
    269a:	b084      	sub	sp, #16
    269c:	af00      	add	r7, sp, #0
    269e:	60f8      	str	r0, [r7, #12]
    26a0:	60b9      	str	r1, [r7, #8]
    26a2:	607a      	str	r2, [r7, #4]
    26a4:	603b      	str	r3, [r7, #0]
	usart_set_baud(channel,baud);
    26a6:	68f8      	ldr	r0, [r7, #12]
    26a8:	68b9      	ldr	r1, [r7, #8]
    26aa:	f7ff ffa3 	bl	25f4 <usart_set_baud>
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    26ae:	68fb      	ldr	r3, [r7, #12]
    26b0:	4a62      	ldr	r2, [pc, #392]	; (283c <usart_open_channel+0x1a4>)
    26b2:	4293      	cmp	r3, r2
    26b4:	d066      	beq.n	2784 <usart_open_channel+0xec>
    26b6:	4a62      	ldr	r2, [pc, #392]	; (2840 <usart_open_channel+0x1a8>)
    26b8:	4293      	cmp	r3, r2
    26ba:	d003      	beq.n	26c4 <usart_open_channel+0x2c>
    26bc:	4a61      	ldr	r2, [pc, #388]	; (2844 <usart_open_channel+0x1ac>)
    26be:	4293      	cmp	r3, r2
    26c0:	d030      	beq.n	2724 <usart_open_channel+0x8c>
    26c2:	e08f      	b.n	27e4 <usart_open_channel+0x14c>
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
    26c4:	4a60      	ldr	r2, [pc, #384]	; (2848 <usart_open_channel+0x1b0>)
    26c6:	4b60      	ldr	r3, [pc, #384]	; (2848 <usart_open_channel+0x1b0>)
    26c8:	699b      	ldr	r3, [r3, #24]
    26ca:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    26ce:	f043 0304 	orr.w	r3, r3, #4
    26d2:	6193      	str	r3, [r2, #24]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    26d4:	69bb      	ldr	r3, [r7, #24]
    26d6:	2b01      	cmp	r3, #1
    26d8:	d110      	bne.n	26fc <usart_open_channel+0x64>
			GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    26da:	4a5c      	ldr	r2, [pc, #368]	; (284c <usart_open_channel+0x1b4>)
    26dc:	4b5b      	ldr	r3, [pc, #364]	; (284c <usart_open_channel+0x1b4>)
    26de:	681b      	ldr	r3, [r3, #0]
    26e0:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    26e4:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    26e8:	6013      	str	r3, [r2, #0]
			GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    26ea:	4a58      	ldr	r2, [pc, #352]	; (284c <usart_open_channel+0x1b4>)
    26ec:	4b57      	ldr	r3, [pc, #348]	; (284c <usart_open_channel+0x1b4>)
    26ee:	681b      	ldr	r3, [r3, #0]
    26f0:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    26f4:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    26f8:	6013      	str	r3, [r2, #0]
    26fa:	e00b      	b.n	2714 <usart_open_channel+0x7c>
		}else{
			GPIOA_CRH->cr&=~(15<<GPIO_MODE9);
    26fc:	4a53      	ldr	r2, [pc, #332]	; (284c <usart_open_channel+0x1b4>)
    26fe:	4b53      	ldr	r3, [pc, #332]	; (284c <usart_open_channel+0x1b4>)
    2700:	681b      	ldr	r3, [r3, #0]
    2702:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    2706:	6013      	str	r3, [r2, #0]
			GPIOA_CRH->cr|=(0xA<<GPIO_MODE9);
    2708:	4a50      	ldr	r2, [pc, #320]	; (284c <usart_open_channel+0x1b4>)
    270a:	4b50      	ldr	r3, [pc, #320]	; (284c <usart_open_channel+0x1b4>)
    270c:	681b      	ldr	r3, [r3, #0]
    270e:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    2712:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART1,7);
    2714:	2025      	movs	r0, #37	; 0x25
    2716:	2107      	movs	r1, #7
    2718:	f7ff fc48 	bl	1fac <set_int_priority>
		enable_interrupt(IRQ_USART1);
    271c:	2025      	movs	r0, #37	; 0x25
    271e:	f7ff fbfd 	bl	1f1c <enable_interrupt>
		break;
    2722:	e05f      	b.n	27e4 <usart_open_channel+0x14c>
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    2724:	4a48      	ldr	r2, [pc, #288]	; (2848 <usart_open_channel+0x1b0>)
    2726:	4b48      	ldr	r3, [pc, #288]	; (2848 <usart_open_channel+0x1b0>)
    2728:	69db      	ldr	r3, [r3, #28]
    272a:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    272e:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    2730:	4a45      	ldr	r2, [pc, #276]	; (2848 <usart_open_channel+0x1b0>)
    2732:	4b45      	ldr	r3, [pc, #276]	; (2848 <usart_open_channel+0x1b0>)
    2734:	699b      	ldr	r3, [r3, #24]
    2736:	f043 0304 	orr.w	r3, r3, #4
    273a:	6193      	str	r3, [r2, #24]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
    273c:	69bb      	ldr	r3, [r7, #24]
    273e:	2b01      	cmp	r3, #1
    2740:	d10c      	bne.n	275c <usart_open_channel+0xc4>
			GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    2742:	4a43      	ldr	r2, [pc, #268]	; (2850 <usart_open_channel+0x1b8>)
    2744:	4b42      	ldr	r3, [pc, #264]	; (2850 <usart_open_channel+0x1b8>)
    2746:	681b      	ldr	r3, [r3, #0]
    2748:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    274c:	6013      	str	r3, [r2, #0]
			GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    274e:	4a40      	ldr	r2, [pc, #256]	; (2850 <usart_open_channel+0x1b8>)
    2750:	4b3f      	ldr	r3, [pc, #252]	; (2850 <usart_open_channel+0x1b8>)
    2752:	681b      	ldr	r3, [r3, #0]
    2754:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    2758:	6013      	str	r3, [r2, #0]
    275a:	e00b      	b.n	2774 <usart_open_channel+0xdc>
		}else{
			GPIOA_CRL->cr&=~(15<<GPIO_MODE2);
    275c:	4a3c      	ldr	r2, [pc, #240]	; (2850 <usart_open_channel+0x1b8>)
    275e:	4b3c      	ldr	r3, [pc, #240]	; (2850 <usart_open_channel+0x1b8>)
    2760:	681b      	ldr	r3, [r3, #0]
    2762:	f423 6370 	bic.w	r3, r3, #3840	; 0xf00
    2766:	6013      	str	r3, [r2, #0]
			GPIOA_CRL->cr|=(0xA<<GPIO_MODE2);
    2768:	4a39      	ldr	r2, [pc, #228]	; (2850 <usart_open_channel+0x1b8>)
    276a:	4b39      	ldr	r3, [pc, #228]	; (2850 <usart_open_channel+0x1b8>)
    276c:	681b      	ldr	r3, [r3, #0]
    276e:	f443 6320 	orr.w	r3, r3, #2560	; 0xa00
    2772:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART2,7);
    2774:	2026      	movs	r0, #38	; 0x26
    2776:	2107      	movs	r1, #7
    2778:	f7ff fc18 	bl	1fac <set_int_priority>
		enable_interrupt(IRQ_USART2);
    277c:	2026      	movs	r0, #38	; 0x26
    277e:	f7ff fbcd 	bl	1f1c <enable_interrupt>
		break;
    2782:	e02f      	b.n	27e4 <usart_open_channel+0x14c>
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
    2784:	4a30      	ldr	r2, [pc, #192]	; (2848 <usart_open_channel+0x1b0>)
    2786:	4b30      	ldr	r3, [pc, #192]	; (2848 <usart_open_channel+0x1b0>)
    2788:	69db      	ldr	r3, [r3, #28]
    278a:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    278e:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    2790:	4a2d      	ldr	r2, [pc, #180]	; (2848 <usart_open_channel+0x1b0>)
    2792:	4b2d      	ldr	r3, [pc, #180]	; (2848 <usart_open_channel+0x1b0>)
    2794:	699b      	ldr	r3, [r3, #24]
    2796:	f043 0308 	orr.w	r3, r3, #8
    279a:	6193      	str	r3, [r2, #24]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    279c:	69bb      	ldr	r3, [r7, #24]
    279e:	2b01      	cmp	r3, #1
    27a0:	d10c      	bne.n	27bc <usart_open_channel+0x124>
			GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    27a2:	4a2c      	ldr	r2, [pc, #176]	; (2854 <usart_open_channel+0x1bc>)
    27a4:	4b2b      	ldr	r3, [pc, #172]	; (2854 <usart_open_channel+0x1bc>)
    27a6:	681b      	ldr	r3, [r3, #0]
    27a8:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    27ac:	6013      	str	r3, [r2, #0]
			GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    27ae:	4a29      	ldr	r2, [pc, #164]	; (2854 <usart_open_channel+0x1bc>)
    27b0:	4b28      	ldr	r3, [pc, #160]	; (2854 <usart_open_channel+0x1bc>)
    27b2:	681b      	ldr	r3, [r3, #0]
    27b4:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    27b8:	6013      	str	r3, [r2, #0]
    27ba:	e00b      	b.n	27d4 <usart_open_channel+0x13c>
		}else{
			GPIOB_CRH->cr&=~((15<<GPIO_MODE10));
    27bc:	4a25      	ldr	r2, [pc, #148]	; (2854 <usart_open_channel+0x1bc>)
    27be:	4b25      	ldr	r3, [pc, #148]	; (2854 <usart_open_channel+0x1bc>)
    27c0:	681b      	ldr	r3, [r3, #0]
    27c2:	f423 6370 	bic.w	r3, r3, #3840	; 0xf00
    27c6:	6013      	str	r3, [r2, #0]
			GPIOB_CRH->cr|=(0xA<<GPIO_MODE10);
    27c8:	4a22      	ldr	r2, [pc, #136]	; (2854 <usart_open_channel+0x1bc>)
    27ca:	4b22      	ldr	r3, [pc, #136]	; (2854 <usart_open_channel+0x1bc>)
    27cc:	681b      	ldr	r3, [r3, #0]
    27ce:	f443 6320 	orr.w	r3, r3, #2560	; 0xa00
    27d2:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART3,7);
    27d4:	2027      	movs	r0, #39	; 0x27
    27d6:	2107      	movs	r1, #7
    27d8:	f7ff fbe8 	bl	1fac <set_int_priority>
		enable_interrupt(IRQ_USART3);
    27dc:	2027      	movs	r0, #39	; 0x27
    27de:	f7ff fb9d 	bl	1f1c <enable_interrupt>
		break;
    27e2:	bf00      	nop
	}
	if (flow_ctrl==FLOW_HARD){
    27e4:	69bb      	ldr	r3, [r7, #24]
    27e6:	2b01      	cmp	r3, #1
    27e8:	d103      	bne.n	27f2 <usart_open_channel+0x15a>
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    27ea:	68fb      	ldr	r3, [r7, #12]
    27ec:	f44f 7240 	mov.w	r2, #768	; 0x300
    27f0:	615a      	str	r2, [r3, #20]
	}
	usart_comm_dir(channel,dir);
    27f2:	68f8      	ldr	r0, [r7, #12]
    27f4:	6839      	ldr	r1, [r7, #0]
    27f6:	f7ff ff37 	bl	2668 <usart_comm_dir>
	switch (parity){
    27fa:	687b      	ldr	r3, [r7, #4]
    27fc:	2b01      	cmp	r3, #1
    27fe:	d00b      	beq.n	2818 <usart_open_channel+0x180>
    2800:	2b01      	cmp	r3, #1
    2802:	d302      	bcc.n	280a <usart_open_channel+0x172>
    2804:	2b02      	cmp	r3, #2
    2806:	d00e      	beq.n	2826 <usart_open_channel+0x18e>
    2808:	e014      	b.n	2834 <usart_open_channel+0x19c>
	case PARITY_NONE:
		channel->CR1|=USART_CR1_UE;
    280a:	68fb      	ldr	r3, [r7, #12]
    280c:	68db      	ldr	r3, [r3, #12]
    280e:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
    2812:	68fb      	ldr	r3, [r7, #12]
    2814:	60da      	str	r2, [r3, #12]
		break;
    2816:	e00d      	b.n	2834 <usart_open_channel+0x19c>
	case PARITY_ODD:
		channel->CR1|=USART_CR1_UE|USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS;
    2818:	68fb      	ldr	r3, [r7, #12]
    281a:	68db      	ldr	r3, [r3, #12]
    281c:	f443 521c 	orr.w	r2, r3, #9984	; 0x2700
    2820:	68fb      	ldr	r3, [r7, #12]
    2822:	60da      	str	r2, [r3, #12]
		break;
    2824:	e006      	b.n	2834 <usart_open_channel+0x19c>
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_UE|USART_CR1_PEIE|USART_CR1_PCE;
    2826:	68fb      	ldr	r3, [r7, #12]
    2828:	68db      	ldr	r3, [r3, #12]
    282a:	f443 5214 	orr.w	r2, r3, #9472	; 0x2500
    282e:	68fb      	ldr	r3, [r7, #12]
    2830:	60da      	str	r2, [r3, #12]
		break;
    2832:	bf00      	nop
    }
}
    2834:	3710      	adds	r7, #16
    2836:	46bd      	mov	sp, r7
    2838:	bd80      	pop	{r7, pc}
    283a:	bf00      	nop
    283c:	40004800 	.word	0x40004800
    2840:	40013800 	.word	0x40013800
    2844:	40004400 	.word	0x40004400
    2848:	40021000 	.word	0x40021000
    284c:	40010804 	.word	0x40010804
    2850:	40010800 	.word	0x40010800
    2854:	40010c04 	.word	0x40010c04

00002858 <usart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
    2858:	b480      	push	{r7}
    285a:	b083      	sub	sp, #12
    285c:	af00      	add	r7, sp, #0
    285e:	6078      	str	r0, [r7, #4]
	return channel->SR&USART_SR_RXNE;
    2860:	687b      	ldr	r3, [r7, #4]
    2862:	681b      	ldr	r3, [r3, #0]
    2864:	f003 0320 	and.w	r3, r3, #32
}
    2868:	4618      	mov	r0, r3
    286a:	370c      	adds	r7, #12
    286c:	46bd      	mov	sp, r7
    286e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2872:	4770      	bx	lr

00002874 <usart_getc>:

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
    2874:	b480      	push	{r7}
    2876:	b083      	sub	sp, #12
    2878:	af00      	add	r7, sp, #0
    287a:	6078      	str	r0, [r7, #4]
	return channel->DR;
    287c:	687b      	ldr	r3, [r7, #4]
    287e:	685b      	ldr	r3, [r3, #4]
    2880:	b2db      	uxtb	r3, r3
}
    2882:	4618      	mov	r0, r3
    2884:	370c      	adds	r7, #12
    2886:	46bd      	mov	sp, r7
    2888:	f85d 7b04 	ldr.w	r7, [sp], #4
    288c:	4770      	bx	lr
    288e:	bf00      	nop

00002890 <usart_putc>:

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
    2890:	b480      	push	{r7}
    2892:	b083      	sub	sp, #12
    2894:	af00      	add	r7, sp, #0
    2896:	6078      	str	r0, [r7, #4]
    2898:	460b      	mov	r3, r1
    289a:	70fb      	strb	r3, [r7, #3]
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
    289c:	bf00      	nop
    289e:	687b      	ldr	r3, [r7, #4]
    28a0:	681b      	ldr	r3, [r3, #0]
    28a2:	f003 0380 	and.w	r3, r3, #128	; 0x80
    28a6:	2b00      	cmp	r3, #0
    28a8:	d0f9      	beq.n	289e <usart_putc+0xe>
	channel->DR=c;
    28aa:	78fa      	ldrb	r2, [r7, #3]
    28ac:	687b      	ldr	r3, [r7, #4]
    28ae:	605a      	str	r2, [r3, #4]
}
    28b0:	370c      	adds	r7, #12
    28b2:	46bd      	mov	sp, r7
    28b4:	f85d 7b04 	ldr.w	r7, [sp], #4
    28b8:	4770      	bx	lr
    28ba:	bf00      	nop

Disassembly of section .user_code:

00003000 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    3000:	b480      	push	{r7}
    3002:	b085      	sub	sp, #20
    3004:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    3006:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    300a:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    300c:	2300      	movs	r3, #0
    300e:	71fb      	strb	r3, [r7, #7]
	
	
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    3010:	2300      	movs	r3, #0
    3012:	2200      	movs	r2, #0
    3014:	4618      	mov	r0, r3
    3016:	4611      	mov	r1, r2
    3018:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    301a:	f107 030c 	add.w	r3, r7, #12
    301e:	2200      	movs	r2, #0
    3020:	4618      	mov	r0, r3
    3022:	4611      	mov	r1, r2
    3024:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    3026:	f107 0308 	add.w	r3, r7, #8
    302a:	2200      	movs	r2, #0
    302c:	4618      	mov	r0, r3
    302e:	4611      	mov	r1, r2
    3030:	df04      	svc	4
    3032:	68bb      	ldr	r3, [r7, #8]
    3034:	2b00      	cmp	r3, #0
    3036:	d1f6      	bne.n	3026 <blink+0x26>
		_svc_call(SVC_LED_ON,NUL,NUL);
    3038:	2300      	movs	r3, #0
    303a:	2200      	movs	r2, #0
    303c:	4618      	mov	r0, r3
    303e:	4611      	mov	r1, r2
    3040:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    3042:	f107 030c 	add.w	r3, r7, #12
    3046:	2200      	movs	r2, #0
    3048:	4618      	mov	r0, r3
    304a:	4611      	mov	r1, r2
    304c:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    304e:	f107 0308 	add.w	r3, r7, #8
    3052:	2200      	movs	r2, #0
    3054:	4618      	mov	r0, r3
    3056:	4611      	mov	r1, r2
    3058:	df04      	svc	4
    305a:	68bb      	ldr	r3, [r7, #8]
    305c:	2b00      	cmp	r3, #0
    305e:	d1f6      	bne.n	304e <blink+0x4e>
		_svc_call(SVC_CONIN,&c,NUL);
    3060:	1dfb      	adds	r3, r7, #7
    3062:	2200      	movs	r2, #0
    3064:	4618      	mov	r0, r3
    3066:	4611      	mov	r1, r2
    3068:	df05      	svc	5
		if (c) break;
    306a:	79fb      	ldrb	r3, [r7, #7]
    306c:	b2db      	uxtb	r3, r3
    306e:	2b00      	cmp	r3, #0
    3070:	d000      	beq.n	3074 <blink+0x74>
    3072:	e000      	b.n	3076 <blink+0x76>
	}
    3074:	e7cc      	b.n	3010 <blink+0x10>
}
    3076:	3714      	adds	r7, #20
    3078:	46bd      	mov	sp, r7
    307a:	f85d 7b04 	ldr.w	r7, [sp], #4
    307e:	4770      	bx	lr
