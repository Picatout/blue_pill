
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 95 23 00 00     i...m...q....#..
      20:	95 23 00 00 95 23 00 00 95 23 00 00 b9 05 00 00     .#...#...#......
      30:	95 23 00 00 95 23 00 00 79 02 00 00 6d 24 00 00     .#...#..y...m$..
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 95 23 00 00 95 23 00 00 9d 27 00 00     .....#...#...'..
      80:	95 23 00 00 95 23 00 00 95 23 00 00 95 23 00 00     .#...#...#...#..
      90:	95 23 00 00 95 23 00 00 95 23 00 00 b5 1e 00 00     .#...#...#......
      a0:	95 23 00 00 95 23 00 00 95 23 00 00 35 26 00 00     .#...#...#..5&..
      b0:	1d 20 00 00 95 23 00 00 95 23 00 00 95 23 00 00     . ...#...#...#..
      c0:	95 23 00 00 95 23 00 00 95 23 00 00 95 23 00 00     .#...#...#...#..
      d0:	95 23 00 00 c5 02 00 00 c1 0f 00 00 cd 02 00 00     .#..............
      e0:	95 23 00 00 95 23 00 00 95 23 00 00 95 23 00 00     .#...#...#...#..
      f0:	95 23 00 00 95 23 00 00 95 23 00 00 95 23 00 00     .#...#...#...#..
     100:	95 23 00 00 95 23 00 00 95 23 00 00 95 23 00 00     .#...#...#...#..
     110:	95 23 00 00 95 23 00 00 95 23 00 00 95 23 00 00     .#...#...#...#..
     120:	95 23 00 00 95 23 00 00 95 23 00 00 95 23 00 00     .#...#...#...#..

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
     1b0:	f000 feb2 	bl	f18 <main>
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
     208:	f002 f8cc 	bl	23a4 <print_fault>
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
     21e:	f002 f8c1 	bl	23a4 <print_fault>
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
     234:	f002 f8b6 	bl	23a4 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f002 f8b1 	bl	23a4 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	00003110 	.word	0x00003110
     258:	00003128 	.word	0x00003128
     25c:	00003134 	.word	0x00003134
     260:	00003144 	.word	0x00003144

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f002 f896 	bl	2394 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f002 f894 	bl	2394 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f002 f892 	bl	2394 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f002 f890 	bl	2394 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f002 f88e 	bl	2394 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f002 f88c 	bl	2394 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f002 f88a 	bl	2394 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f002 f888 	bl	2394 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f002 f886 	bl	2394 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f002 f884 	bl	2394 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f002 f882 	bl	2394 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f002 f880 	bl	2394 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f002 f87e 	bl	2394 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f002 f87c 	bl	2394 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f002 f87a 	bl	2394 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f002 f878 	bl	2394 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f002 f876 	bl	2394 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f002 f874 	bl	2394 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f002 f872 	bl	2394 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f002 f870 	bl	2394 <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f002 f86e 	bl	2394 <reset_mcu>
_default_handler(EXTI9_5_handler) // 23
     2b8:	f002 f86c 	bl	2394 <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2bc:	f002 f86a 	bl	2394 <reset_mcu>
_default_handler(TIM2_handler) // 28
     2c0:	f002 f868 	bl	2394 <reset_mcu>

000002c4 <USART1_handler>:
_default_handler(USART1_handler) // 37
     2c4:	f002 f866 	bl	2394 <reset_mcu>
_default_handler(USART2_handler) // 38
     2c8:	f002 f864 	bl	2394 <reset_mcu>

000002cc <USART3_handler>:
_default_handler(USART3_handler) // 39
     2cc:	f002 f862 	bl	2394 <reset_mcu>

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
     500:	20000128 	.word	0x20000128

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
     518:	20000128 	.word	0x20000128

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
     65c:	f000 fd22 	bl	10a4 <conin>
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
     670:	f000 fd08 	bl	1084 <conout>
		break;
     674:	e072      	b.n	75c <SVC_handler+0x1a4>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     676:	68bb      	ldr	r3, [r7, #8]
     678:	681b      	ldr	r3, [r3, #0]
     67a:	6878      	ldr	r0, [r7, #4]
     67c:	4619      	mov	r1, r3
     67e:	f000 fd89 	bl	1194 <read_line>
     682:	4602      	mov	r2, r0
     684:	68bb      	ldr	r3, [r7, #8]
     686:	601a      	str	r2, [r3, #0]
		break;
     688:	e068      	b.n	75c <SVC_handler+0x1a4>
	case SVC_PRINT:
		print((const char*)arg1);
     68a:	68b8      	ldr	r0, [r7, #8]
     68c:	f000 fd2c 	bl	10e8 <print>
		break;
     690:	e064      	b.n	75c <SVC_handler+0x1a4>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     692:	68bb      	ldr	r3, [r7, #8]
     694:	681b      	ldr	r3, [r3, #0]
     696:	4618      	mov	r0, r3
     698:	210a      	movs	r1, #10
     69a:	f000 fe25 	bl	12e8 <print_int>
		break;
     69e:	e05d      	b.n	75c <SVC_handler+0x1a4>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     6a0:	68bb      	ldr	r3, [r7, #8]
     6a2:	681b      	ldr	r3, [r3, #0]
     6a4:	4618      	mov	r0, r3
     6a6:	f000 fe8d 	bl	13c4 <print_hex>
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
     72e:	f000 fef9 	bl	1524 <flash_write>
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
     740:	f000 ff34 	bl	15ac <flash_erase_page>
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
     756:	f001 fe1d 	bl	2394 <reset_mcu>
	    break;
     75a:	bf00      	nop
	}	
}
     75c:	3710      	adds	r7, #16
     75e:	46bd      	mov	sp, r7
     760:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     764:	4685      	mov	sp, r0
     766:	4770      	bx	lr
     768:	20000124 	.word	0x20000124

0000076c <set_sysclock>:


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     76c:	b480      	push	{r7}
     76e:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC->CR|=RCC_CR_HSEON;
     770:	4a18      	ldr	r2, [pc, #96]	; (7d4 <set_sysclock+0x68>)
     772:	4b18      	ldr	r3, [pc, #96]	; (7d4 <set_sysclock+0x68>)
     774:	681b      	ldr	r3, [r3, #0]
     776:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     77a:	6013      	str	r3, [r2, #0]
	 // attend que l'oscillateur soit prêt
   while (!(RCC->CR&RCC_CR_HSERDY));
     77c:	bf00      	nop
     77e:	4b15      	ldr	r3, [pc, #84]	; (7d4 <set_sysclock+0x68>)
     780:	681b      	ldr	r3, [r3, #0]
     782:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
     786:	2b00      	cmp	r3, #0
     788:	d0f9      	beq.n	77e <set_sysclock+0x12>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 8 
     // pour une fréquence  Fsysclk de 64 Mhz
    RCC->CFGR|=RCC_CFGR_PLLSRC_HSE|(RCC_CFGR_PLLMUL8<<RCC_CFGR_PLLMUL_POS);
     78a:	4a12      	ldr	r2, [pc, #72]	; (7d4 <set_sysclock+0x68>)
     78c:	4b11      	ldr	r3, [pc, #68]	; (7d4 <set_sysclock+0x68>)
     78e:	685b      	ldr	r3, [r3, #4]
     790:	f443 13c8 	orr.w	r3, r3, #1638400	; 0x190000
     794:	6053      	str	r3, [r2, #4]
    // active le PLL
    RCC->CR|=RCC_CR_PLLON;
     796:	4a0f      	ldr	r2, [pc, #60]	; (7d4 <set_sysclock+0x68>)
     798:	4b0e      	ldr	r3, [pc, #56]	; (7d4 <set_sysclock+0x68>)
     79a:	681b      	ldr	r3, [r3, #0]
     79c:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
     7a0:	6013      	str	r3, [r2, #0]
    // Attend que le PLL soit prêt
    while (!(RCC->CR&RCC_CR_PLLRDY));
     7a2:	bf00      	nop
     7a4:	4b0b      	ldr	r3, [pc, #44]	; (7d4 <set_sysclock+0x68>)
     7a6:	681b      	ldr	r3, [r3, #0]
     7a8:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
     7ac:	2b00      	cmp	r3, #0
     7ae:	d0f9      	beq.n	7a4 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    // active le prefetch buffer
    FLASH->ACR|=(WAIT_2_CY<<FLASH_ACR_LATENCY_POS)|FLASH_ACR_PRFTBE;
     7b0:	4a09      	ldr	r2, [pc, #36]	; (7d8 <set_sysclock+0x6c>)
     7b2:	4b09      	ldr	r3, [pc, #36]	; (7d8 <set_sysclock+0x6c>)
     7b4:	681b      	ldr	r3, [r3, #0]
     7b6:	f043 0312 	orr.w	r3, r3, #18
     7ba:	6013      	str	r3, [r2, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
    // Sélectionne le PLL comme source pour SYSCLK dans CR
	RCC->CFGR|=(RCC_CFGR_PPREx_DIV2<<RCC_CFGR_PPRE1_POS)|(RCC_CFGR_SW_PLL<<RCC_CFGR_SW_POS);
     7bc:	4a05      	ldr	r2, [pc, #20]	; (7d4 <set_sysclock+0x68>)
     7be:	4b05      	ldr	r3, [pc, #20]	; (7d4 <set_sysclock+0x68>)
     7c0:	685b      	ldr	r3, [r3, #4]
     7c2:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     7c6:	f043 0302 	orr.w	r3, r3, #2
     7ca:	6053      	str	r3, [r2, #4]
}
     7cc:	46bd      	mov	sp, r7
     7ce:	f85d 7b04 	ldr.w	r7, [sp], #4
     7d2:	4770      	bx	lr
     7d4:	40021000 	.word	0x40021000
     7d8:	40022000 	.word	0x40022000

000007dc <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     7dc:	b480      	push	{r7}
     7de:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     7e0:	2300      	movs	r3, #0
     7e2:	2200      	movs	r2, #0
     7e4:	4618      	mov	r0, r3
     7e6:	4611      	mov	r1, r2
     7e8:	df00      	svc	0
}
     7ea:	46bd      	mov	sp, r7
     7ec:	f85d 7b04 	ldr.w	r7, [sp], #4
     7f0:	4770      	bx	lr
     7f2:	bf00      	nop

000007f4 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     7f4:	b480      	push	{r7}
     7f6:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     7f8:	2300      	movs	r3, #0
     7fa:	2200      	movs	r2, #0
     7fc:	4618      	mov	r0, r3
     7fe:	4611      	mov	r1, r2
     800:	df01      	svc	1
}
     802:	46bd      	mov	sp, r7
     804:	f85d 7b04 	ldr.w	r7, [sp], #4
     808:	4770      	bx	lr
     80a:	bf00      	nop

0000080c <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     80c:	b480      	push	{r7}
     80e:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     810:	2300      	movs	r3, #0
     812:	2200      	movs	r2, #0
     814:	4618      	mov	r0, r3
     816:	4611      	mov	r1, r2
     818:	df02      	svc	2
}
     81a:	46bd      	mov	sp, r7
     81c:	f85d 7b04 	ldr.w	r7, [sp], #4
     820:	4770      	bx	lr
     822:	bf00      	nop

00000824 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     824:	b580      	push	{r7, lr}
     826:	b082      	sub	sp, #8
     828:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     82a:	f000 fadb 	bl	de4 <word>
	n=atoi((const char*)pad);
     82e:	4806      	ldr	r0, [pc, #24]	; (848 <cmd_set_timer+0x24>)
     830:	f7ff fdcc 	bl	3cc <atoi>
     834:	4603      	mov	r3, r0
     836:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     838:	1d3b      	adds	r3, r7, #4
     83a:	2200      	movs	r2, #0
     83c:	4618      	mov	r0, r3
     83e:	4611      	mov	r1, r2
     840:	df03      	svc	3
}
     842:	3708      	adds	r7, #8
     844:	46bd      	mov	sp, r7
     846:	bd80      	pop	{r7, pc}
     848:	20000058 	.word	0x20000058

0000084c <cmd_get_timer>:

static void cmd_get_timer(){
     84c:	b480      	push	{r7}
     84e:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     850:	4b04      	ldr	r3, [pc, #16]	; (864 <cmd_get_timer+0x18>)
     852:	2200      	movs	r2, #0
     854:	4618      	mov	r0, r3
     856:	4611      	mov	r1, r2
     858:	df04      	svc	4
}
     85a:	46bd      	mov	sp, r7
     85c:	f85d 7b04 	ldr.w	r7, [sp], #4
     860:	4770      	bx	lr
     862:	bf00      	nop
     864:	20000058 	.word	0x20000058

00000868 <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     868:	b480      	push	{r7}
     86a:	b083      	sub	sp, #12
     86c:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     86e:	1d3b      	adds	r3, r7, #4
     870:	2200      	movs	r2, #0
     872:	4618      	mov	r0, r3
     874:	4611      	mov	r1, r2
     876:	df04      	svc	4
     878:	687b      	ldr	r3, [r7, #4]
     87a:	2b00      	cmp	r3, #0
     87c:	d1f7      	bne.n	86e <cmd_pause+0x6>
}
     87e:	370c      	adds	r7, #12
     880:	46bd      	mov	sp, r7
     882:	f85d 7b04 	ldr.w	r7, [sp], #4
     886:	4770      	bx	lr

00000888 <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     888:	b480      	push	{r7}
     88a:	b083      	sub	sp, #12
     88c:	af00      	add	r7, sp, #0
	volatile char n=0;
     88e:	2300      	movs	r3, #0
     890:	71fb      	strb	r3, [r7, #7]
	while (!n){
     892:	e004      	b.n	89e <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     894:	1dfb      	adds	r3, r7, #7
     896:	2200      	movs	r2, #0
     898:	4618      	mov	r0, r3
     89a:	4611      	mov	r1, r2
     89c:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     89e:	79fb      	ldrb	r3, [r7, #7]
     8a0:	b2db      	uxtb	r3, r3
     8a2:	2b00      	cmp	r3, #0
     8a4:	d0f6      	beq.n	894 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     8a6:	79fb      	ldrb	r3, [r7, #7]
     8a8:	b2da      	uxtb	r2, r3
     8aa:	4b05      	ldr	r3, [pc, #20]	; (8c0 <cmd_getc+0x38>)
     8ac:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     8ae:	4b04      	ldr	r3, [pc, #16]	; (8c0 <cmd_getc+0x38>)
     8b0:	2200      	movs	r2, #0
     8b2:	705a      	strb	r2, [r3, #1]
}
     8b4:	370c      	adds	r7, #12
     8b6:	46bd      	mov	sp, r7
     8b8:	f85d 7b04 	ldr.w	r7, [sp], #4
     8bc:	4770      	bx	lr
     8be:	bf00      	nop
     8c0:	20000058 	.word	0x20000058

000008c4 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     8c4:	b580      	push	{r7, lr}
     8c6:	b082      	sub	sp, #8
     8c8:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     8ca:	f000 fa8b 	bl	de4 <word>
	cmd_id=search_command((const char*)pad);
     8ce:	480a      	ldr	r0, [pc, #40]	; (8f8 <cmd_putc+0x34>)
     8d0:	f000 f972 	bl	bb8 <search_command>
     8d4:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     8d6:	687b      	ldr	r3, [r7, #4]
     8d8:	2b00      	cmp	r3, #0
     8da:	db05      	blt.n	8e8 <cmd_putc+0x24>
     8dc:	4a07      	ldr	r2, [pc, #28]	; (8fc <cmd_putc+0x38>)
     8de:	687b      	ldr	r3, [r7, #4]
     8e0:	00db      	lsls	r3, r3, #3
     8e2:	4413      	add	r3, r2
     8e4:	685b      	ldr	r3, [r3, #4]
     8e6:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     8e8:	4b03      	ldr	r3, [pc, #12]	; (8f8 <cmd_putc+0x34>)
     8ea:	2200      	movs	r2, #0
     8ec:	4618      	mov	r0, r3
     8ee:	4611      	mov	r1, r2
     8f0:	df06      	svc	6
}
     8f2:	3708      	adds	r7, #8
     8f4:	46bd      	mov	sp, r7
     8f6:	bd80      	pop	{r7, pc}
     8f8:	20000058 	.word	0x20000058
     8fc:	00002b64 	.word	0x00002b64

00000900 <cmd_readln>:

static void cmd_readln(){
     900:	b580      	push	{r7, lr}
     902:	b082      	sub	sp, #8
     904:	af00      	add	r7, sp, #0
	unsigned llen=80;
     906:	2350      	movs	r3, #80	; 0x50
     908:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     90a:	1d3b      	adds	r3, r7, #4
     90c:	4a04      	ldr	r2, [pc, #16]	; (920 <cmd_readln+0x20>)
     90e:	4618      	mov	r0, r3
     910:	4611      	mov	r1, r2
     912:	df07      	svc	7
	print((const char*)pad);
     914:	4802      	ldr	r0, [pc, #8]	; (920 <cmd_readln+0x20>)
     916:	f000 fbe7 	bl	10e8 <print>
}
     91a:	3708      	adds	r7, #8
     91c:	46bd      	mov	sp, r7
     91e:	bd80      	pop	{r7, pc}
     920:	20000058 	.word	0x20000058

00000924 <cmd_print>:

static void cmd_print(){
     924:	b580      	push	{r7, lr}
     926:	af00      	add	r7, sp, #0
	word();
     928:	f000 fa5c 	bl	de4 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     92c:	4b02      	ldr	r3, [pc, #8]	; (938 <cmd_print+0x14>)
     92e:	2200      	movs	r2, #0
     930:	4618      	mov	r0, r3
     932:	4611      	mov	r1, r2
     934:	df08      	svc	8
}
     936:	bd80      	pop	{r7, pc}
     938:	20000058 	.word	0x20000058

0000093c <cmd_print_int>:

static void cmd_print_int(){
     93c:	b580      	push	{r7, lr}
     93e:	b082      	sub	sp, #8
     940:	af00      	add	r7, sp, #0
	int cmd_id;
    unsigned u32;
    
	word();
     942:	f000 fa4f 	bl	de4 <word>
	cmd_id=search_command((const char*)pad);
     946:	480e      	ldr	r0, [pc, #56]	; (980 <cmd_print_int+0x44>)
     948:	f000 f936 	bl	bb8 <search_command>
     94c:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     94e:	687b      	ldr	r3, [r7, #4]
     950:	2b00      	cmp	r3, #0
     952:	db06      	blt.n	962 <cmd_print_int+0x26>
		 commands[cmd_id].fn();
     954:	4a0b      	ldr	r2, [pc, #44]	; (984 <cmd_print_int+0x48>)
     956:	687b      	ldr	r3, [r7, #4]
     958:	00db      	lsls	r3, r3, #3
     95a:	4413      	add	r3, r2
     95c:	685b      	ldr	r3, [r3, #4]
     95e:	4798      	blx	r3
     960:	e006      	b.n	970 <cmd_print_int+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     962:	4807      	ldr	r0, [pc, #28]	; (980 <cmd_print_int+0x44>)
     964:	f7ff fd32 	bl	3cc <atoi>
     968:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     96a:	4a05      	ldr	r2, [pc, #20]	; (980 <cmd_print_int+0x44>)
     96c:	687b      	ldr	r3, [r7, #4]
     96e:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_INT,pad,NUL);
     970:	4b03      	ldr	r3, [pc, #12]	; (980 <cmd_print_int+0x44>)
     972:	2200      	movs	r2, #0
     974:	4618      	mov	r0, r3
     976:	4611      	mov	r1, r2
     978:	df09      	svc	9
}
     97a:	3708      	adds	r7, #8
     97c:	46bd      	mov	sp, r7
     97e:	bd80      	pop	{r7, pc}
     980:	20000058 	.word	0x20000058
     984:	00002b64 	.word	0x00002b64

00000988 <cmd_print_hex>:

static void cmd_print_hex(){
     988:	b580      	push	{r7, lr}
     98a:	b082      	sub	sp, #8
     98c:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     98e:	f000 fa29 	bl	de4 <word>
	cmd_id=search_command((const char*)pad);
     992:	480e      	ldr	r0, [pc, #56]	; (9cc <cmd_print_hex+0x44>)
     994:	f000 f910 	bl	bb8 <search_command>
     998:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     99a:	687b      	ldr	r3, [r7, #4]
     99c:	2b00      	cmp	r3, #0
     99e:	db06      	blt.n	9ae <cmd_print_hex+0x26>
		 commands[cmd_id].fn();
     9a0:	4a0b      	ldr	r2, [pc, #44]	; (9d0 <cmd_print_hex+0x48>)
     9a2:	687b      	ldr	r3, [r7, #4]
     9a4:	00db      	lsls	r3, r3, #3
     9a6:	4413      	add	r3, r2
     9a8:	685b      	ldr	r3, [r3, #4]
     9aa:	4798      	blx	r3
     9ac:	e006      	b.n	9bc <cmd_print_hex+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     9ae:	4807      	ldr	r0, [pc, #28]	; (9cc <cmd_print_hex+0x44>)
     9b0:	f7ff fd0c 	bl	3cc <atoi>
     9b4:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     9b6:	4a05      	ldr	r2, [pc, #20]	; (9cc <cmd_print_hex+0x44>)
     9b8:	687b      	ldr	r3, [r7, #4]
     9ba:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_HEX,pad,NUL);
     9bc:	4b03      	ldr	r3, [pc, #12]	; (9cc <cmd_print_hex+0x44>)
     9be:	2200      	movs	r2, #0
     9c0:	4618      	mov	r0, r3
     9c2:	4611      	mov	r1, r2
     9c4:	df0a      	svc	10
}
     9c6:	3708      	adds	r7, #8
     9c8:	46bd      	mov	sp, r7
     9ca:	bd80      	pop	{r7, pc}
     9cc:	20000058 	.word	0x20000058
     9d0:	00002b64 	.word	0x00002b64

000009d4 <cmd_run>:

static void cmd_run(){
     9d4:	b580      	push	{r7, lr}
     9d6:	af00      	add	r7, sp, #0
	((fn)proga)();
     9d8:	4b01      	ldr	r3, [pc, #4]	; (9e0 <cmd_run+0xc>)
     9da:	681b      	ldr	r3, [r3, #0]
     9dc:	4798      	blx	r3
	
}
     9de:	bd80      	pop	{r7, pc}
     9e0:	20000134 	.word	0x20000134

000009e4 <cmd_peek8>:

static void cmd_peek8(){
     9e4:	b580      	push	{r7, lr}
     9e6:	b082      	sub	sp, #8
     9e8:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9ea:	f000 f9fb 	bl	de4 <word>
	u=atoi((const char*)pad);
     9ee:	4808      	ldr	r0, [pc, #32]	; (a10 <cmd_peek8+0x2c>)
     9f0:	f7ff fcec 	bl	3cc <atoi>
     9f4:	4603      	mov	r3, r0
     9f6:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     9f8:	1d3b      	adds	r3, r7, #4
     9fa:	2200      	movs	r2, #0
     9fc:	4618      	mov	r0, r3
     9fe:	4611      	mov	r1, r2
     a00:	df0b      	svc	11
	*(uint32_t*)pad=u&0xff;
     a02:	4a03      	ldr	r2, [pc, #12]	; (a10 <cmd_peek8+0x2c>)
     a04:	687b      	ldr	r3, [r7, #4]
     a06:	b2db      	uxtb	r3, r3
     a08:	6013      	str	r3, [r2, #0]
}
     a0a:	3708      	adds	r7, #8
     a0c:	46bd      	mov	sp, r7
     a0e:	bd80      	pop	{r7, pc}
     a10:	20000058 	.word	0x20000058

00000a14 <cmd_peek16>:

static void cmd_peek16(){
     a14:	b580      	push	{r7, lr}
     a16:	b082      	sub	sp, #8
     a18:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     a1a:	f000 f9e3 	bl	de4 <word>
	u=atoi((const char*)pad);
     a1e:	4808      	ldr	r0, [pc, #32]	; (a40 <cmd_peek16+0x2c>)
     a20:	f7ff fcd4 	bl	3cc <atoi>
     a24:	4603      	mov	r3, r0
     a26:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     a28:	1d3b      	adds	r3, r7, #4
     a2a:	2200      	movs	r2, #0
     a2c:	4618      	mov	r0, r3
     a2e:	4611      	mov	r1, r2
     a30:	df0c      	svc	12
	*(uint32_t*)pad=u&0xffff;
     a32:	4a03      	ldr	r2, [pc, #12]	; (a40 <cmd_peek16+0x2c>)
     a34:	687b      	ldr	r3, [r7, #4]
     a36:	b29b      	uxth	r3, r3
     a38:	6013      	str	r3, [r2, #0]
}
     a3a:	3708      	adds	r7, #8
     a3c:	46bd      	mov	sp, r7
     a3e:	bd80      	pop	{r7, pc}
     a40:	20000058 	.word	0x20000058

00000a44 <cmd_peek32>:

static void cmd_peek32(){
     a44:	b580      	push	{r7, lr}
     a46:	b082      	sub	sp, #8
     a48:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     a4a:	f000 f9cb 	bl	de4 <word>
	u=atoi((const char*)pad);
     a4e:	4808      	ldr	r0, [pc, #32]	; (a70 <cmd_peek32+0x2c>)
     a50:	f7ff fcbc 	bl	3cc <atoi>
     a54:	4603      	mov	r3, r0
     a56:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK32,&u,NUL);
     a58:	1d3b      	adds	r3, r7, #4
     a5a:	2200      	movs	r2, #0
     a5c:	4618      	mov	r0, r3
     a5e:	4611      	mov	r1, r2
     a60:	df0d      	svc	13
	*(uint32_t*)pad=u;
     a62:	4a03      	ldr	r2, [pc, #12]	; (a70 <cmd_peek32+0x2c>)
     a64:	687b      	ldr	r3, [r7, #4]
     a66:	6013      	str	r3, [r2, #0]
}
     a68:	3708      	adds	r7, #8
     a6a:	46bd      	mov	sp, r7
     a6c:	bd80      	pop	{r7, pc}
     a6e:	bf00      	nop
     a70:	20000058 	.word	0x20000058

00000a74 <cmd_poke8>:

static void cmd_poke8(){
     a74:	b580      	push	{r7, lr}
     a76:	b082      	sub	sp, #8
     a78:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     a7a:	f000 f9b3 	bl	de4 <word>
	adr=atoi((const char*)pad);
     a7e:	480a      	ldr	r0, [pc, #40]	; (aa8 <cmd_poke8+0x34>)
     a80:	f7ff fca4 	bl	3cc <atoi>
     a84:	4603      	mov	r3, r0
     a86:	607b      	str	r3, [r7, #4]
	word();
     a88:	f000 f9ac 	bl	de4 <word>
	u8=atoi((const char*)pad);
     a8c:	4806      	ldr	r0, [pc, #24]	; (aa8 <cmd_poke8+0x34>)
     a8e:	f7ff fc9d 	bl	3cc <atoi>
     a92:	4603      	mov	r3, r0
     a94:	b2db      	uxtb	r3, r3
     a96:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     a98:	1d3b      	adds	r3, r7, #4
     a9a:	1cfa      	adds	r2, r7, #3
     a9c:	4618      	mov	r0, r3
     a9e:	4611      	mov	r1, r2
     aa0:	df0e      	svc	14
}
     aa2:	3708      	adds	r7, #8
     aa4:	46bd      	mov	sp, r7
     aa6:	bd80      	pop	{r7, pc}
     aa8:	20000058 	.word	0x20000058

00000aac <cmd_poke16>:

static void cmd_poke16(){
     aac:	b580      	push	{r7, lr}
     aae:	b082      	sub	sp, #8
     ab0:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     ab2:	f000 f997 	bl	de4 <word>
	adr=atoi((const char*)pad);
     ab6:	480a      	ldr	r0, [pc, #40]	; (ae0 <cmd_poke16+0x34>)
     ab8:	f7ff fc88 	bl	3cc <atoi>
     abc:	4603      	mov	r3, r0
     abe:	607b      	str	r3, [r7, #4]
	word();
     ac0:	f000 f990 	bl	de4 <word>
	u16=atoi((const char*)pad);
     ac4:	4806      	ldr	r0, [pc, #24]	; (ae0 <cmd_poke16+0x34>)
     ac6:	f7ff fc81 	bl	3cc <atoi>
     aca:	4603      	mov	r3, r0
     acc:	b29b      	uxth	r3, r3
     ace:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     ad0:	1d3b      	adds	r3, r7, #4
     ad2:	1cba      	adds	r2, r7, #2
     ad4:	4618      	mov	r0, r3
     ad6:	4611      	mov	r1, r2
     ad8:	df0f      	svc	15
}
     ada:	3708      	adds	r7, #8
     adc:	46bd      	mov	sp, r7
     ade:	bd80      	pop	{r7, pc}
     ae0:	20000058 	.word	0x20000058

00000ae4 <cmd_poke32>:

static void cmd_poke32(){
     ae4:	b580      	push	{r7, lr}
     ae6:	b082      	sub	sp, #8
     ae8:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     aea:	f000 f97b 	bl	de4 <word>
	adr=atoi((const char*)pad);
     aee:	480a      	ldr	r0, [pc, #40]	; (b18 <cmd_poke32+0x34>)
     af0:	f7ff fc6c 	bl	3cc <atoi>
     af4:	4603      	mov	r3, r0
     af6:	607b      	str	r3, [r7, #4]
	word();
     af8:	f000 f974 	bl	de4 <word>
	u32=atoi((const char*)pad);
     afc:	4806      	ldr	r0, [pc, #24]	; (b18 <cmd_poke32+0x34>)
     afe:	f7ff fc65 	bl	3cc <atoi>
     b02:	4603      	mov	r3, r0
     b04:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     b06:	1d3b      	adds	r3, r7, #4
     b08:	463a      	mov	r2, r7
     b0a:	4618      	mov	r0, r3
     b0c:	4611      	mov	r1, r2
     b0e:	df10      	svc	16
}
     b10:	3708      	adds	r7, #8
     b12:	46bd      	mov	sp, r7
     b14:	bd80      	pop	{r7, pc}
     b16:	bf00      	nop
     b18:	20000058 	.word	0x20000058

00000b1c <cmd_fwrite>:

static void cmd_fwrite(){
     b1c:	b580      	push	{r7, lr}
     b1e:	b082      	sub	sp, #8
     b20:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	word();
     b22:	f000 f95f 	bl	de4 <word>
	adr=atoi((const char*)pad);
     b26:	480d      	ldr	r0, [pc, #52]	; (b5c <cmd_fwrite+0x40>)
     b28:	f7ff fc50 	bl	3cc <atoi>
     b2c:	4603      	mov	r3, r0
     b2e:	607b      	str	r3, [r7, #4]
	word();
     b30:	f000 f958 	bl	de4 <word>
	u32=atoi((const char*)pad);
     b34:	4809      	ldr	r0, [pc, #36]	; (b5c <cmd_fwrite+0x40>)
     b36:	f7ff fc49 	bl	3cc <atoi>
     b3a:	4603      	mov	r3, r0
     b3c:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_FLASH_WR,&adr,&u32);
     b3e:	1d3b      	adds	r3, r7, #4
     b40:	463a      	mov	r2, r7
     b42:	4618      	mov	r0, r3
     b44:	4611      	mov	r1, r2
     b46:	df11      	svc	17
	if (!adr) print(" failed\n");
     b48:	687b      	ldr	r3, [r7, #4]
     b4a:	2b00      	cmp	r3, #0
     b4c:	d102      	bne.n	b54 <cmd_fwrite+0x38>
     b4e:	4804      	ldr	r0, [pc, #16]	; (b60 <cmd_fwrite+0x44>)
     b50:	f000 faca 	bl	10e8 <print>
}
     b54:	3708      	adds	r7, #8
     b56:	46bd      	mov	sp, r7
     b58:	bd80      	pop	{r7, pc}
     b5a:	bf00      	nop
     b5c:	20000058 	.word	0x20000058
     b60:	00002ab0 	.word	0x00002ab0

00000b64 <cmd_pgerase>:

static void cmd_pgerase(){
     b64:	b580      	push	{r7, lr}
     b66:	b082      	sub	sp, #8
     b68:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     b6a:	f000 f93b 	bl	de4 <word>
	adr=atoi((const char*)pad);
     b6e:	4809      	ldr	r0, [pc, #36]	; (b94 <cmd_pgerase+0x30>)
     b70:	f7ff fc2c 	bl	3cc <atoi>
     b74:	4603      	mov	r3, r0
     b76:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_FLASH_PGER,&adr,0);
     b78:	1d3b      	adds	r3, r7, #4
     b7a:	2200      	movs	r2, #0
     b7c:	4618      	mov	r0, r3
     b7e:	4611      	mov	r1, r2
     b80:	df12      	svc	18
	if (!adr) print(" failed\n");
     b82:	687b      	ldr	r3, [r7, #4]
     b84:	2b00      	cmp	r3, #0
     b86:	d102      	bne.n	b8e <cmd_pgerase+0x2a>
     b88:	4803      	ldr	r0, [pc, #12]	; (b98 <cmd_pgerase+0x34>)
     b8a:	f000 faad 	bl	10e8 <print>
}
     b8e:	3708      	adds	r7, #8
     b90:	46bd      	mov	sp, r7
     b92:	bd80      	pop	{r7, pc}
     b94:	20000058 	.word	0x20000058
     b98:	00002ab0 	.word	0x00002ab0

00000b9c <cmd_ticks>:

static void cmd_ticks(){
     b9c:	b480      	push	{r7}
     b9e:	af00      	add	r7, sp, #0
	_svc_call(SVC_TICKS,&pad,0);
     ba0:	4b04      	ldr	r3, [pc, #16]	; (bb4 <cmd_ticks+0x18>)
     ba2:	2200      	movs	r2, #0
     ba4:	4618      	mov	r0, r3
     ba6:	4611      	mov	r1, r2
     ba8:	df13      	svc	19
}
     baa:	46bd      	mov	sp, r7
     bac:	f85d 7b04 	ldr.w	r7, [sp], #4
     bb0:	4770      	bx	lr
     bb2:	bf00      	nop
     bb4:	20000058 	.word	0x20000058

00000bb8 <search_command>:
	{"ticks",cmd_ticks},
	{NUL,NUL}
};


int search_command(const char * name){
     bb8:	b580      	push	{r7, lr}
     bba:	b084      	sub	sp, #16
     bbc:	af00      	add	r7, sp, #0
     bbe:	6078      	str	r0, [r7, #4]
	int i=0;
     bc0:	2300      	movs	r3, #0
     bc2:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     bc4:	e00e      	b.n	be4 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     bc6:	4a12      	ldr	r2, [pc, #72]	; (c10 <search_command+0x58>)
     bc8:	68fb      	ldr	r3, [r7, #12]
     bca:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     bce:	4618      	mov	r0, r3
     bd0:	6879      	ldr	r1, [r7, #4]
     bd2:	f7ff fb7d 	bl	2d0 <strcmp>
     bd6:	4603      	mov	r3, r0
     bd8:	2b00      	cmp	r3, #0
     bda:	d100      	bne.n	bde <search_command+0x26>
			break;
     bdc:	e009      	b.n	bf2 <search_command+0x3a>
		}
		i++;
     bde:	68fb      	ldr	r3, [r7, #12]
     be0:	3301      	adds	r3, #1
     be2:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     be4:	4a0a      	ldr	r2, [pc, #40]	; (c10 <search_command+0x58>)
     be6:	68fb      	ldr	r3, [r7, #12]
     be8:	00db      	lsls	r3, r3, #3
     bea:	4413      	add	r3, r2
     bec:	685b      	ldr	r3, [r3, #4]
     bee:	2b00      	cmp	r3, #0
     bf0:	d1e9      	bne.n	bc6 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     bf2:	4a07      	ldr	r2, [pc, #28]	; (c10 <search_command+0x58>)
     bf4:	68fb      	ldr	r3, [r7, #12]
     bf6:	00db      	lsls	r3, r3, #3
     bf8:	4413      	add	r3, r2
     bfa:	685b      	ldr	r3, [r3, #4]
     bfc:	2b00      	cmp	r3, #0
     bfe:	d102      	bne.n	c06 <search_command+0x4e>
     c00:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     c04:	60fb      	str	r3, [r7, #12]
	return i;
     c06:	68fb      	ldr	r3, [r7, #12]
}
     c08:	4618      	mov	r0, r3
     c0a:	3710      	adds	r7, #16
     c0c:	46bd      	mov	sp, r7
     c0e:	bd80      	pop	{r7, pc}
     c10:	00002b64 	.word	0x00002b64

00000c14 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     c14:	b480      	push	{r7}
     c16:	b085      	sub	sp, #20
     c18:	af00      	add	r7, sp, #0
     c1a:	60f8      	str	r0, [r7, #12]
     c1c:	60b9      	str	r1, [r7, #8]
     c1e:	4613      	mov	r3, r2
     c20:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     c22:	e002      	b.n	c2a <skip+0x16>
     c24:	68bb      	ldr	r3, [r7, #8]
     c26:	3301      	adds	r3, #1
     c28:	60bb      	str	r3, [r7, #8]
     c2a:	68bb      	ldr	r3, [r7, #8]
     c2c:	68fa      	ldr	r2, [r7, #12]
     c2e:	4413      	add	r3, r2
     c30:	781b      	ldrb	r3, [r3, #0]
     c32:	2b00      	cmp	r3, #0
     c34:	d006      	beq.n	c44 <skip+0x30>
     c36:	68bb      	ldr	r3, [r7, #8]
     c38:	68fa      	ldr	r2, [r7, #12]
     c3a:	4413      	add	r3, r2
     c3c:	781b      	ldrb	r3, [r3, #0]
     c3e:	79fa      	ldrb	r2, [r7, #7]
     c40:	429a      	cmp	r2, r3
     c42:	d0ef      	beq.n	c24 <skip+0x10>
	return start;
     c44:	68bb      	ldr	r3, [r7, #8]
}
     c46:	4618      	mov	r0, r3
     c48:	3714      	adds	r7, #20
     c4a:	46bd      	mov	sp, r7
     c4c:	f85d 7b04 	ldr.w	r7, [sp], #4
     c50:	4770      	bx	lr
     c52:	bf00      	nop

00000c54 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     c54:	b480      	push	{r7}
     c56:	b085      	sub	sp, #20
     c58:	af00      	add	r7, sp, #0
     c5a:	60f8      	str	r0, [r7, #12]
     c5c:	60b9      	str	r1, [r7, #8]
     c5e:	4613      	mov	r3, r2
     c60:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     c62:	e002      	b.n	c6a <scan+0x16>
     c64:	68bb      	ldr	r3, [r7, #8]
     c66:	3301      	adds	r3, #1
     c68:	60bb      	str	r3, [r7, #8]
     c6a:	68bb      	ldr	r3, [r7, #8]
     c6c:	68fa      	ldr	r2, [r7, #12]
     c6e:	4413      	add	r3, r2
     c70:	781b      	ldrb	r3, [r3, #0]
     c72:	2b00      	cmp	r3, #0
     c74:	d006      	beq.n	c84 <scan+0x30>
     c76:	68bb      	ldr	r3, [r7, #8]
     c78:	68fa      	ldr	r2, [r7, #12]
     c7a:	4413      	add	r3, r2
     c7c:	781b      	ldrb	r3, [r3, #0]
     c7e:	79fa      	ldrb	r2, [r7, #7]
     c80:	429a      	cmp	r2, r3
     c82:	d1ef      	bne.n	c64 <scan+0x10>
	return start;
     c84:	68bb      	ldr	r3, [r7, #8]
}
     c86:	4618      	mov	r0, r3
     c88:	3714      	adds	r7, #20
     c8a:	46bd      	mov	sp, r7
     c8c:	f85d 7b04 	ldr.w	r7, [sp], #4
     c90:	4770      	bx	lr
     c92:	bf00      	nop

00000c94 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     c94:	b480      	push	{r7}
     c96:	b087      	sub	sp, #28
     c98:	af00      	add	r7, sp, #0
     c9a:	6078      	str	r0, [r7, #4]
     c9c:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     c9e:	2300      	movs	r3, #0
     ca0:	617b      	str	r3, [r7, #20]
     ca2:	683b      	ldr	r3, [r7, #0]
     ca4:	613b      	str	r3, [r7, #16]
     ca6:	2300      	movs	r3, #0
     ca8:	60fb      	str	r3, [r7, #12]
     caa:	2301      	movs	r3, #1
     cac:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     cae:	e040      	b.n	d32 <quote+0x9e>
		switch (buffer[end]){
     cb0:	693b      	ldr	r3, [r7, #16]
     cb2:	687a      	ldr	r2, [r7, #4]
     cb4:	4413      	add	r3, r2
     cb6:	781b      	ldrb	r3, [r3, #0]
     cb8:	2b5c      	cmp	r3, #92	; 0x5c
     cba:	d012      	beq.n	ce2 <quote+0x4e>
     cbc:	2b6e      	cmp	r3, #110	; 0x6e
     cbe:	d022      	beq.n	d06 <quote+0x72>
     cc0:	2b22      	cmp	r3, #34	; 0x22
     cc2:	d128      	bne.n	d16 <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     cc4:	697b      	ldr	r3, [r7, #20]
     cc6:	2b00      	cmp	r3, #0
     cc8:	d102      	bne.n	cd0 <quote+0x3c>
     cca:	2300      	movs	r3, #0
     ccc:	60bb      	str	r3, [r7, #8]
			break;
     cce:	e02d      	b.n	d2c <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     cd0:	68fb      	ldr	r3, [r7, #12]
     cd2:	1c5a      	adds	r2, r3, #1
     cd4:	60fa      	str	r2, [r7, #12]
     cd6:	4a21      	ldr	r2, [pc, #132]	; (d5c <quote+0xc8>)
     cd8:	2122      	movs	r1, #34	; 0x22
     cda:	54d1      	strb	r1, [r2, r3]
     cdc:	2300      	movs	r3, #0
     cde:	617b      	str	r3, [r7, #20]
			break;
     ce0:	e024      	b.n	d2c <quote+0x98>
		case '\\':
			if (!escaped){
     ce2:	697b      	ldr	r3, [r7, #20]
     ce4:	2b00      	cmp	r3, #0
     ce6:	d102      	bne.n	cee <quote+0x5a>
				escaped=1;
     ce8:	2301      	movs	r3, #1
     cea:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     cec:	e01e      	b.n	d2c <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     cee:	2300      	movs	r3, #0
     cf0:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     cf2:	68fb      	ldr	r3, [r7, #12]
     cf4:	1c5a      	adds	r2, r3, #1
     cf6:	60fa      	str	r2, [r7, #12]
     cf8:	693a      	ldr	r2, [r7, #16]
     cfa:	6879      	ldr	r1, [r7, #4]
     cfc:	440a      	add	r2, r1
     cfe:	7811      	ldrb	r1, [r2, #0]
     d00:	4a16      	ldr	r2, [pc, #88]	; (d5c <quote+0xc8>)
     d02:	54d1      	strb	r1, [r2, r3]
			}
			break;
     d04:	e012      	b.n	d2c <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     d06:	697b      	ldr	r3, [r7, #20]
     d08:	2b00      	cmp	r3, #0
     d0a:	d004      	beq.n	d16 <quote+0x82>
     d0c:	693b      	ldr	r3, [r7, #16]
     d0e:	687a      	ldr	r2, [r7, #4]
     d10:	4413      	add	r3, r2
     d12:	220d      	movs	r2, #13
     d14:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     d16:	2300      	movs	r3, #0
     d18:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     d1a:	68fb      	ldr	r3, [r7, #12]
     d1c:	1c5a      	adds	r2, r3, #1
     d1e:	60fa      	str	r2, [r7, #12]
     d20:	693a      	ldr	r2, [r7, #16]
     d22:	6879      	ldr	r1, [r7, #4]
     d24:	440a      	add	r2, r1
     d26:	7811      	ldrb	r1, [r2, #0]
     d28:	4a0c      	ldr	r2, [pc, #48]	; (d5c <quote+0xc8>)
     d2a:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     d2c:	693b      	ldr	r3, [r7, #16]
     d2e:	3301      	adds	r3, #1
     d30:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     d32:	693b      	ldr	r3, [r7, #16]
     d34:	687a      	ldr	r2, [r7, #4]
     d36:	4413      	add	r3, r2
     d38:	781b      	ldrb	r3, [r3, #0]
     d3a:	2b00      	cmp	r3, #0
     d3c:	d002      	beq.n	d44 <quote+0xb0>
     d3e:	68bb      	ldr	r3, [r7, #8]
     d40:	2b00      	cmp	r3, #0
     d42:	d1b5      	bne.n	cb0 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     d44:	4a05      	ldr	r2, [pc, #20]	; (d5c <quote+0xc8>)
     d46:	68fb      	ldr	r3, [r7, #12]
     d48:	4413      	add	r3, r2
     d4a:	2200      	movs	r2, #0
     d4c:	701a      	strb	r2, [r3, #0]
	return end;
     d4e:	693b      	ldr	r3, [r7, #16]
}
     d50:	4618      	mov	r0, r3
     d52:	371c      	adds	r7, #28
     d54:	46bd      	mov	sp, r7
     d56:	f85d 7b04 	ldr.w	r7, [sp], #4
     d5a:	4770      	bx	lr
     d5c:	20000058 	.word	0x20000058

00000d60 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     d60:	b480      	push	{r7}
     d62:	b087      	sub	sp, #28
     d64:	af00      	add	r7, sp, #0
     d66:	60f8      	str	r0, [r7, #12]
     d68:	60b9      	str	r1, [r7, #8]
     d6a:	4613      	mov	r3, r2
     d6c:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     d6e:	68bb      	ldr	r3, [r7, #8]
     d70:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     d72:	e002      	b.n	d7a <next+0x1a>
     d74:	697b      	ldr	r3, [r7, #20]
     d76:	3301      	adds	r3, #1
     d78:	617b      	str	r3, [r7, #20]
     d7a:	697b      	ldr	r3, [r7, #20]
     d7c:	68fa      	ldr	r2, [r7, #12]
     d7e:	4413      	add	r3, r2
     d80:	781b      	ldrb	r3, [r3, #0]
     d82:	2b00      	cmp	r3, #0
     d84:	d006      	beq.n	d94 <next+0x34>
     d86:	697b      	ldr	r3, [r7, #20]
     d88:	68fa      	ldr	r2, [r7, #12]
     d8a:	4413      	add	r3, r2
     d8c:	781b      	ldrb	r3, [r3, #0]
     d8e:	79fa      	ldrb	r2, [r7, #7]
     d90:	429a      	cmp	r2, r3
     d92:	d1ef      	bne.n	d74 <next+0x14>
	return end-start;
     d94:	697a      	ldr	r2, [r7, #20]
     d96:	68bb      	ldr	r3, [r7, #8]
     d98:	1ad3      	subs	r3, r2, r3
}
     d9a:	4618      	mov	r0, r3
     d9c:	371c      	adds	r7, #28
     d9e:	46bd      	mov	sp, r7
     da0:	f85d 7b04 	ldr.w	r7, [sp], #4
     da4:	4770      	bx	lr
     da6:	bf00      	nop

00000da8 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     da8:	b480      	push	{r7}
     daa:	b085      	sub	sp, #20
     dac:	af00      	add	r7, sp, #0
     dae:	60f8      	str	r0, [r7, #12]
     db0:	60b9      	str	r1, [r7, #8]
     db2:	607a      	str	r2, [r7, #4]
	while (len){
     db4:	e00a      	b.n	dcc <move+0x24>
		*dest++=*src++;
     db6:	68bb      	ldr	r3, [r7, #8]
     db8:	1c5a      	adds	r2, r3, #1
     dba:	60ba      	str	r2, [r7, #8]
     dbc:	68fa      	ldr	r2, [r7, #12]
     dbe:	1c51      	adds	r1, r2, #1
     dc0:	60f9      	str	r1, [r7, #12]
     dc2:	7812      	ldrb	r2, [r2, #0]
     dc4:	701a      	strb	r2, [r3, #0]
		len--;
     dc6:	687b      	ldr	r3, [r7, #4]
     dc8:	3b01      	subs	r3, #1
     dca:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     dcc:	687b      	ldr	r3, [r7, #4]
     dce:	2b00      	cmp	r3, #0
     dd0:	d1f1      	bne.n	db6 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     dd2:	68bb      	ldr	r3, [r7, #8]
     dd4:	2200      	movs	r2, #0
     dd6:	701a      	strb	r2, [r3, #0]
}
     dd8:	3714      	adds	r7, #20
     dda:	46bd      	mov	sp, r7
     ddc:	f85d 7b04 	ldr.w	r7, [sp], #4
     de0:	4770      	bx	lr
     de2:	bf00      	nop

00000de4 <word>:

// extrait le prochain mot du tib
static void word(){
     de4:	b580      	push	{r7, lr}
     de6:	b082      	sub	sp, #8
     de8:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     dea:	4b1d      	ldr	r3, [pc, #116]	; (e60 <word+0x7c>)
     dec:	681b      	ldr	r3, [r3, #0]
     dee:	481d      	ldr	r0, [pc, #116]	; (e64 <word+0x80>)
     df0:	4619      	mov	r1, r3
     df2:	2220      	movs	r2, #32
     df4:	f7ff ff0e 	bl	c14 <skip>
     df8:	4603      	mov	r3, r0
     dfa:	461a      	mov	r2, r3
     dfc:	4b18      	ldr	r3, [pc, #96]	; (e60 <word+0x7c>)
     dfe:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     e00:	4b17      	ldr	r3, [pc, #92]	; (e60 <word+0x7c>)
     e02:	681b      	ldr	r3, [r3, #0]
     e04:	4a17      	ldr	r2, [pc, #92]	; (e64 <word+0x80>)
     e06:	5cd3      	ldrb	r3, [r2, r3]
     e08:	2b22      	cmp	r3, #34	; 0x22
     e0a:	d10f      	bne.n	e2c <word+0x48>
			in++;
     e0c:	4b14      	ldr	r3, [pc, #80]	; (e60 <word+0x7c>)
     e0e:	681b      	ldr	r3, [r3, #0]
     e10:	3301      	adds	r3, #1
     e12:	4a13      	ldr	r2, [pc, #76]	; (e60 <word+0x7c>)
     e14:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     e16:	4b12      	ldr	r3, [pc, #72]	; (e60 <word+0x7c>)
     e18:	681b      	ldr	r3, [r3, #0]
     e1a:	4812      	ldr	r0, [pc, #72]	; (e64 <word+0x80>)
     e1c:	4619      	mov	r1, r3
     e1e:	f7ff ff39 	bl	c94 <quote>
     e22:	4603      	mov	r3, r0
     e24:	461a      	mov	r2, r3
     e26:	4b0e      	ldr	r3, [pc, #56]	; (e60 <word+0x7c>)
     e28:	601a      	str	r2, [r3, #0]
     e2a:	e016      	b.n	e5a <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     e2c:	4b0c      	ldr	r3, [pc, #48]	; (e60 <word+0x7c>)
     e2e:	681b      	ldr	r3, [r3, #0]
     e30:	480c      	ldr	r0, [pc, #48]	; (e64 <word+0x80>)
     e32:	4619      	mov	r1, r3
     e34:	2220      	movs	r2, #32
     e36:	f7ff ff93 	bl	d60 <next>
     e3a:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     e3c:	4b08      	ldr	r3, [pc, #32]	; (e60 <word+0x7c>)
     e3e:	681b      	ldr	r3, [r3, #0]
     e40:	4a08      	ldr	r2, [pc, #32]	; (e64 <word+0x80>)
     e42:	4413      	add	r3, r2
     e44:	4618      	mov	r0, r3
     e46:	4908      	ldr	r1, [pc, #32]	; (e68 <word+0x84>)
     e48:	687a      	ldr	r2, [r7, #4]
     e4a:	f7ff ffad 	bl	da8 <move>
			in+=len;
     e4e:	4b04      	ldr	r3, [pc, #16]	; (e60 <word+0x7c>)
     e50:	681a      	ldr	r2, [r3, #0]
     e52:	687b      	ldr	r3, [r7, #4]
     e54:	4413      	add	r3, r2
     e56:	4a02      	ldr	r2, [pc, #8]	; (e60 <word+0x7c>)
     e58:	6013      	str	r3, [r2, #0]
		}
}
     e5a:	3708      	adds	r7, #8
     e5c:	46bd      	mov	sp, r7
     e5e:	bd80      	pop	{r7, pc}
     e60:	200000a8 	.word	0x200000a8
     e64:	20000008 	.word	0x20000008
     e68:	20000058 	.word	0x20000058

00000e6c <parse_line>:

static void parse_line(unsigned llen){
     e6c:	b580      	push	{r7, lr}
     e6e:	b084      	sub	sp, #16
     e70:	af00      	add	r7, sp, #0
     e72:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     e74:	4b14      	ldr	r3, [pc, #80]	; (ec8 <parse_line+0x5c>)
     e76:	2200      	movs	r2, #0
     e78:	601a      	str	r2, [r3, #0]
	while (in<llen){
     e7a:	e019      	b.n	eb0 <parse_line+0x44>
		word();
     e7c:	f7ff ffb2 	bl	de4 <word>
		cmd_id=search_command((const char*) pad);
     e80:	4812      	ldr	r0, [pc, #72]	; (ecc <parse_line+0x60>)
     e82:	f7ff fe99 	bl	bb8 <search_command>
     e86:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     e88:	68fb      	ldr	r3, [r7, #12]
     e8a:	2b00      	cmp	r3, #0
     e8c:	db06      	blt.n	e9c <parse_line+0x30>
			commands[cmd_id].fn();
     e8e:	4a10      	ldr	r2, [pc, #64]	; (ed0 <parse_line+0x64>)
     e90:	68fb      	ldr	r3, [r7, #12]
     e92:	00db      	lsls	r3, r3, #3
     e94:	4413      	add	r3, r2
     e96:	685b      	ldr	r3, [r3, #4]
     e98:	4798      	blx	r3
     e9a:	e009      	b.n	eb0 <parse_line+0x44>
		}else{
			conout(CR);
     e9c:	200d      	movs	r0, #13
     e9e:	f000 f8f1 	bl	1084 <conout>
			print((const char*)pad); conout('?');
     ea2:	480a      	ldr	r0, [pc, #40]	; (ecc <parse_line+0x60>)
     ea4:	f000 f920 	bl	10e8 <print>
     ea8:	203f      	movs	r0, #63	; 0x3f
     eaa:	f000 f8eb 	bl	1084 <conout>
			break;
     eae:	e004      	b.n	eba <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     eb0:	4b05      	ldr	r3, [pc, #20]	; (ec8 <parse_line+0x5c>)
     eb2:	681a      	ldr	r2, [r3, #0]
     eb4:	687b      	ldr	r3, [r7, #4]
     eb6:	429a      	cmp	r2, r3
     eb8:	d3e0      	bcc.n	e7c <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     eba:	200d      	movs	r0, #13
     ebc:	f000 f8e2 	bl	1084 <conout>
}
     ec0:	3710      	adds	r7, #16
     ec2:	46bd      	mov	sp, r7
     ec4:	bd80      	pop	{r7, pc}
     ec6:	bf00      	nop
     ec8:	200000a8 	.word	0x200000a8
     ecc:	20000058 	.word	0x20000058
     ed0:	00002b64 	.word	0x00002b64

00000ed4 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     ed4:	b480      	push	{r7}
     ed6:	b085      	sub	sp, #20
     ed8:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     eda:	4b0c      	ldr	r3, [pc, #48]	; (f0c <copy_blink_in_ram+0x38>)
     edc:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     ede:	4b0c      	ldr	r3, [pc, #48]	; (f10 <copy_blink_in_ram+0x3c>)
     ee0:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     ee2:	4b0c      	ldr	r3, [pc, #48]	; (f14 <copy_blink_in_ram+0x40>)
     ee4:	60bb      	str	r3, [r7, #8]
	while (start<end){
     ee6:	e007      	b.n	ef8 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     ee8:	68bb      	ldr	r3, [r7, #8]
     eea:	1d1a      	adds	r2, r3, #4
     eec:	60ba      	str	r2, [r7, #8]
     eee:	68fa      	ldr	r2, [r7, #12]
     ef0:	1d11      	adds	r1, r2, #4
     ef2:	60f9      	str	r1, [r7, #12]
     ef4:	6812      	ldr	r2, [r2, #0]
     ef6:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     ef8:	68fa      	ldr	r2, [r7, #12]
     efa:	687b      	ldr	r3, [r7, #4]
     efc:	429a      	cmp	r2, r3
     efe:	d3f3      	bcc.n	ee8 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     f00:	3714      	adds	r7, #20
     f02:	46bd      	mov	sp, r7
     f04:	f85d 7b04 	ldr.w	r7, [sp], #4
     f08:	4770      	bx	lr
     f0a:	bf00      	nop
     f0c:	00003400 	.word	0x00003400
     f10:	00003480 	.word	0x00003480
     f14:	20002700 	.word	0x20002700

00000f18 <main>:

extern void print_fault(const char *msg, sfrp_t adr);

void main(void){
     f18:	b580      	push	{r7, lr}
     f1a:	b082      	sub	sp, #8
     f1c:	af00      	add	r7, sp, #0
	set_sysclock();
     f1e:	f7ff fc25 	bl	76c <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     f22:	f06f 000a 	mvn.w	r0, #10
     f26:	210f      	movs	r1, #15
     f28:	f001 f8f0 	bl	210c <set_int_priority>
	config_systicks();
     f2c:	f001 fa76 	bl	241c <config_systicks>
	flash_enable();
     f30:	f000 fab8 	bl	14a4 <flash_enable>
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
     f34:	4b1d      	ldr	r3, [pc, #116]	; (fac <main+0x94>)
     f36:	221d      	movs	r2, #29
     f38:	619a      	str	r2, [r3, #24]
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
     f3a:	4b1c      	ldr	r3, [pc, #112]	; (fac <main+0x94>)
     f3c:	f44f 4280 	mov.w	r2, #16384	; 0x4000
     f40:	61da      	str	r2, [r3, #28]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     f42:	4a1a      	ldr	r2, [pc, #104]	; (fac <main+0x94>)
     f44:	4b19      	ldr	r3, [pc, #100]	; (fac <main+0x94>)
     f46:	695b      	ldr	r3, [r3, #20]
     f48:	f043 0301 	orr.w	r3, r3, #1
     f4c:	6153      	str	r3, [r2, #20]
	config_pin(GPIOC,LED_PIN,OUTPUT_OD_SLOW);
     f4e:	2002      	movs	r0, #2
     f50:	210d      	movs	r1, #13
     f52:	2206      	movs	r2, #6
     f54:	f000 fd60 	bl	1a18 <config_pin>
	console_init();
     f58:	f000 f856 	bl	1008 <console_init>
	cls();
     f5c:	f000 f8f4 	bl	1148 <cls>
	keyboard_init();
     f60:	f000 fd9e 	bl	1aa0 <keyboard_init>
	tvout_init();
     f64:	f001 faa6 	bl	24b4 <tvout_init>
	print(VERSION);
     f68:	4b11      	ldr	r3, [pc, #68]	; (fb0 <main+0x98>)
     f6a:	681b      	ldr	r3, [r3, #0]
     f6c:	4618      	mov	r0, r3
     f6e:	f000 f8bb 	bl	10e8 <print>
	copy_blink_in_ram();
     f72:	f7ff ffaf 	bl	ed4 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
     f76:	480f      	ldr	r0, [pc, #60]	; (fb4 <main+0x9c>)
     f78:	f000 f8b6 	bl	10e8 <print>
     f7c:	4b0e      	ldr	r3, [pc, #56]	; (fb8 <main+0xa0>)
     f7e:	2200      	movs	r2, #0
     f80:	4618      	mov	r0, r3
     f82:	4611      	mov	r1, r2
     f84:	df0a      	svc	10
     f86:	200d      	movs	r0, #13
     f88:	f000 f87c 	bl	1084 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     f8c:	2300      	movs	r3, #0
     f8e:	2200      	movs	r2, #0
     f90:	4618      	mov	r0, r3
     f92:	4611      	mov	r1, r2
     f94:	df01      	svc	1
	flush_rx_queue();
     f96:	f000 fa77 	bl	1488 <flush_rx_queue>
		}
	 }
	 */
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
     f9a:	4808      	ldr	r0, [pc, #32]	; (fbc <main+0xa4>)
     f9c:	2150      	movs	r1, #80	; 0x50
     f9e:	f000 f8f9 	bl	1194 <read_line>
     fa2:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     fa4:	6878      	ldr	r0, [r7, #4]
     fa6:	f7ff ff61 	bl	e6c <parse_line>
	}
     faa:	e7f6      	b.n	f9a <main+0x82>
     fac:	40021000 	.word	0x40021000
     fb0:	20000000 	.word	0x20000000
     fb4:	00002c14 	.word	0x00002c14
     fb8:	20000134 	.word	0x20000134
     fbc:	20000008 	.word	0x20000008

00000fc0 <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void CON_handler(){
     fc0:	b480      	push	{r7}
     fc2:	af00      	add	r7, sp, #0
	if (CON->SR&USART_SR_RXNE){
     fc4:	4b0e      	ldr	r3, [pc, #56]	; (1000 <USART2_handler+0x40>)
     fc6:	681b      	ldr	r3, [r3, #0]
     fc8:	f003 0320 	and.w	r3, r3, #32
     fcc:	2b00      	cmp	r3, #0
     fce:	d012      	beq.n	ff6 <USART2_handler+0x36>
		rx_queue.queue[rx_queue.head++]=CON->DR&0x7f;
     fd0:	4b0c      	ldr	r3, [pc, #48]	; (1004 <USART2_handler+0x44>)
     fd2:	6a1b      	ldr	r3, [r3, #32]
     fd4:	1c5a      	adds	r2, r3, #1
     fd6:	490b      	ldr	r1, [pc, #44]	; (1004 <USART2_handler+0x44>)
     fd8:	620a      	str	r2, [r1, #32]
     fda:	4a09      	ldr	r2, [pc, #36]	; (1000 <USART2_handler+0x40>)
     fdc:	6852      	ldr	r2, [r2, #4]
     fde:	b2d2      	uxtb	r2, r2
     fe0:	f002 027f 	and.w	r2, r2, #127	; 0x7f
     fe4:	b2d1      	uxtb	r1, r2
     fe6:	4a07      	ldr	r2, [pc, #28]	; (1004 <USART2_handler+0x44>)
     fe8:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
     fea:	4b06      	ldr	r3, [pc, #24]	; (1004 <USART2_handler+0x44>)
     fec:	6a1b      	ldr	r3, [r3, #32]
     fee:	f003 031f 	and.w	r3, r3, #31
     ff2:	4a04      	ldr	r2, [pc, #16]	; (1004 <USART2_handler+0x44>)
     ff4:	6213      	str	r3, [r2, #32]
	}
}
     ff6:	46bd      	mov	sp, r7
     ff8:	f85d 7b04 	ldr.w	r7, [sp], #4
     ffc:	4770      	bx	lr
     ffe:	bf00      	nop
    1000:	40004400 	.word	0x40004400
    1004:	200000ac 	.word	0x200000ac

00001008 <console_init>:

void console_init(){
    1008:	b580      	push	{r7, lr}
    100a:	af00      	add	r7, sp, #0
	// activation clock USART2
	RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    100c:	4a1a      	ldr	r2, [pc, #104]	; (1078 <console_init+0x70>)
    100e:	4b1a      	ldr	r3, [pc, #104]	; (1078 <console_init+0x70>)
    1010:	69db      	ldr	r3, [r3, #28]
    1012:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    1016:	61d3      	str	r3, [r2, #28]
	//configure USART pins
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    1018:	4a17      	ldr	r2, [pc, #92]	; (1078 <console_init+0x70>)
    101a:	4b17      	ldr	r3, [pc, #92]	; (1078 <console_init+0x70>)
    101c:	699b      	ldr	r3, [r3, #24]
    101e:	f043 0304 	orr.w	r3, r3, #4
    1022:	6193      	str	r3, [r2, #24]
	// PA0 -> CTS input   (floating)
	// PA1 -> RTS output  (push-pull)
	// PA2 -> TX  output (push-pull)
	// PA3 -> RX input (floating)
	usart_set_baud(CON,115200);
    1024:	4815      	ldr	r0, [pc, #84]	; (107c <console_init+0x74>)
    1026:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
    102a:	f001 fbd3 	bl	27d4 <usart_set_baud>
	CON_PORT->CRL&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    102e:	4a14      	ldr	r2, [pc, #80]	; (1080 <console_init+0x78>)
    1030:	4b13      	ldr	r3, [pc, #76]	; (1080 <console_init+0x78>)
    1032:	681b      	ldr	r3, [r3, #0]
    1034:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    1038:	6013      	str	r3, [r2, #0]
	CON_PORT->CRL|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    103a:	4a11      	ldr	r2, [pc, #68]	; (1080 <console_init+0x78>)
    103c:	4b10      	ldr	r3, [pc, #64]	; (1080 <console_init+0x78>)
    103e:	681b      	ldr	r3, [r3, #0]
    1040:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    1044:	6013      	str	r3, [r2, #0]
	CON->CR1|=USART_CR1_TE|USART_CR1_RE|USART_CR1_RXNEIE;
    1046:	4a0d      	ldr	r2, [pc, #52]	; (107c <console_init+0x74>)
    1048:	4b0c      	ldr	r3, [pc, #48]	; (107c <console_init+0x74>)
    104a:	68db      	ldr	r3, [r3, #12]
    104c:	f043 032c 	orr.w	r3, r3, #44	; 0x2c
    1050:	60d3      	str	r3, [r2, #12]
	CON->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    1052:	4b0a      	ldr	r3, [pc, #40]	; (107c <console_init+0x74>)
    1054:	f44f 7240 	mov.w	r2, #768	; 0x300
    1058:	615a      	str	r2, [r3, #20]
	set_int_priority(IRQ_CON,7);
    105a:	2026      	movs	r0, #38	; 0x26
    105c:	2107      	movs	r1, #7
    105e:	f001 f855 	bl	210c <set_int_priority>
	enable_interrupt(IRQ_CON);
    1062:	2026      	movs	r0, #38	; 0x26
    1064:	f001 f80a 	bl	207c <enable_interrupt>
	CON->CR1|=USART_CR1_UE;
    1068:	4a04      	ldr	r2, [pc, #16]	; (107c <console_init+0x74>)
    106a:	4b04      	ldr	r3, [pc, #16]	; (107c <console_init+0x74>)
    106c:	68db      	ldr	r3, [r3, #12]
    106e:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
    1072:	60d3      	str	r3, [r2, #12]
}
    1074:	bd80      	pop	{r7, pc}
    1076:	bf00      	nop
    1078:	40021000 	.word	0x40021000
    107c:	40004400 	.word	0x40004400
    1080:	40010800 	.word	0x40010800

00001084 <conout>:

// envoie d'un caractère à la console
void conout(char c){
    1084:	b580      	push	{r7, lr}
    1086:	b082      	sub	sp, #8
    1088:	af00      	add	r7, sp, #0
    108a:	4603      	mov	r3, r0
    108c:	71fb      	strb	r3, [r7, #7]
	usart_putc(CON,c);
    108e:	79fb      	ldrb	r3, [r7, #7]
    1090:	4803      	ldr	r0, [pc, #12]	; (10a0 <conout+0x1c>)
    1092:	4619      	mov	r1, r3
    1094:	f001 fcec 	bl	2a70 <usart_putc>
}
    1098:	3708      	adds	r7, #8
    109a:	46bd      	mov	sp, r7
    109c:	bd80      	pop	{r7, pc}
    109e:	bf00      	nop
    10a0:	40004400 	.word	0x40004400

000010a4 <conin>:


// réception d'un caractère de la console
char conin(){
    10a4:	b480      	push	{r7}
    10a6:	b083      	sub	sp, #12
    10a8:	af00      	add	r7, sp, #0
	char c=0;
    10aa:	2300      	movs	r3, #0
    10ac:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
    10ae:	4b0d      	ldr	r3, [pc, #52]	; (10e4 <conin+0x40>)
    10b0:	6a1a      	ldr	r2, [r3, #32]
    10b2:	4b0c      	ldr	r3, [pc, #48]	; (10e4 <conin+0x40>)
    10b4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10b6:	429a      	cmp	r2, r3
    10b8:	d00d      	beq.n	10d6 <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
    10ba:	4b0a      	ldr	r3, [pc, #40]	; (10e4 <conin+0x40>)
    10bc:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10be:	1c5a      	adds	r2, r3, #1
    10c0:	4908      	ldr	r1, [pc, #32]	; (10e4 <conin+0x40>)
    10c2:	624a      	str	r2, [r1, #36]	; 0x24
    10c4:	4a07      	ldr	r2, [pc, #28]	; (10e4 <conin+0x40>)
    10c6:	5cd3      	ldrb	r3, [r2, r3]
    10c8:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
    10ca:	4b06      	ldr	r3, [pc, #24]	; (10e4 <conin+0x40>)
    10cc:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10ce:	f003 031f 	and.w	r3, r3, #31
    10d2:	4a04      	ldr	r2, [pc, #16]	; (10e4 <conin+0x40>)
    10d4:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
    10d6:	79fb      	ldrb	r3, [r7, #7]
}
    10d8:	4618      	mov	r0, r3
    10da:	370c      	adds	r7, #12
    10dc:	46bd      	mov	sp, r7
    10de:	f85d 7b04 	ldr.w	r7, [sp], #4
    10e2:	4770      	bx	lr
    10e4:	200000ac 	.word	0x200000ac

000010e8 <print>:

// imprime un chaîne sur la console
void print(const char *str){
    10e8:	b580      	push	{r7, lr}
    10ea:	b082      	sub	sp, #8
    10ec:	af00      	add	r7, sp, #0
    10ee:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
    10f0:	e006      	b.n	1100 <print+0x18>
    10f2:	687b      	ldr	r3, [r7, #4]
    10f4:	1c5a      	adds	r2, r3, #1
    10f6:	607a      	str	r2, [r7, #4]
    10f8:	781b      	ldrb	r3, [r3, #0]
    10fa:	4618      	mov	r0, r3
    10fc:	f7ff ffc2 	bl	1084 <conout>
    1100:	687b      	ldr	r3, [r7, #4]
    1102:	781b      	ldrb	r3, [r3, #0]
    1104:	2b00      	cmp	r3, #0
    1106:	d1f4      	bne.n	10f2 <print+0xa>
}
    1108:	3708      	adds	r7, #8
    110a:	46bd      	mov	sp, r7
    110c:	bd80      	pop	{r7, pc}
    110e:	bf00      	nop

00001110 <beep>:

void beep(){
    1110:	b480      	push	{r7}
    1112:	af00      	add	r7, sp, #0
}
    1114:	46bd      	mov	sp, r7
    1116:	f85d 7b04 	ldr.w	r7, [sp], #4
    111a:	4770      	bx	lr

0000111c <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    111c:	b580      	push	{r7, lr}
    111e:	af00      	add	r7, sp, #0
	conout(BS);
    1120:	2008      	movs	r0, #8
    1122:	f7ff ffaf 	bl	1084 <conout>
	conout(SPACE);
    1126:	2020      	movs	r0, #32
    1128:	f7ff ffac 	bl	1084 <conout>
	conout(BS);
    112c:	2008      	movs	r0, #8
    112e:	f7ff ffa9 	bl	1084 <conout>
}
    1132:	bd80      	pop	{r7, pc}

00001134 <esc_seq>:

void esc_seq(){
    1134:	b580      	push	{r7, lr}
    1136:	af00      	add	r7, sp, #0
	conout(ESC);
    1138:	201b      	movs	r0, #27
    113a:	f7ff ffa3 	bl	1084 <conout>
	conout('[');
    113e:	205b      	movs	r0, #91	; 0x5b
    1140:	f7ff ffa0 	bl	1084 <conout>
}
    1144:	bd80      	pop	{r7, pc}
    1146:	bf00      	nop

00001148 <cls>:

// vide l'écran de la console
void cls(){
    1148:	b580      	push	{r7, lr}
    114a:	af00      	add	r7, sp, #0
	esc_seq();
    114c:	f7ff fff2 	bl	1134 <esc_seq>
	conout('2');
    1150:	2032      	movs	r0, #50	; 0x32
    1152:	f7ff ff97 	bl	1084 <conout>
	conout('J');
    1156:	204a      	movs	r0, #74	; 0x4a
    1158:	f7ff ff94 	bl	1084 <conout>
}
    115c:	bd80      	pop	{r7, pc}
    115e:	bf00      	nop

00001160 <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
    1160:	b580      	push	{r7, lr}
    1162:	b082      	sub	sp, #8
    1164:	af00      	add	r7, sp, #0
    1166:	6078      	str	r0, [r7, #4]
	esc_seq();
    1168:	f7ff ffe4 	bl	1134 <esc_seq>
	conout('2');
    116c:	2032      	movs	r0, #50	; 0x32
    116e:	f7ff ff89 	bl	1084 <conout>
	conout('K');
    1172:	204b      	movs	r0, #75	; 0x4b
    1174:	f7ff ff86 	bl	1084 <conout>
	while (n){conout(BS);n--;}
    1178:	e005      	b.n	1186 <clear_line+0x26>
    117a:	2008      	movs	r0, #8
    117c:	f7ff ff82 	bl	1084 <conout>
    1180:	687b      	ldr	r3, [r7, #4]
    1182:	3b01      	subs	r3, #1
    1184:	607b      	str	r3, [r7, #4]
    1186:	687b      	ldr	r3, [r7, #4]
    1188:	2b00      	cmp	r3, #0
    118a:	d1f6      	bne.n	117a <clear_line+0x1a>
}
    118c:	3708      	adds	r7, #8
    118e:	46bd      	mov	sp, r7
    1190:	bd80      	pop	{r7, pc}
    1192:	bf00      	nop

00001194 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    1194:	b580      	push	{r7, lr}
    1196:	b084      	sub	sp, #16
    1198:	af00      	add	r7, sp, #0
    119a:	6078      	str	r0, [r7, #4]
    119c:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    119e:	2300      	movs	r3, #0
    11a0:	60fb      	str	r3, [r7, #12]
	char c=0;
    11a2:	2300      	movs	r3, #0
    11a4:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    11a6:	683b      	ldr	r3, [r7, #0]
    11a8:	3b01      	subs	r3, #1
    11aa:	603b      	str	r3, [r7, #0]
	while (c!=13){
    11ac:	e08e      	b.n	12cc <read_line+0x138>
			c=conin();
    11ae:	f7ff ff79 	bl	10a4 <conin>
    11b2:	4603      	mov	r3, r0
    11b4:	72fb      	strb	r3, [r7, #11]
			switch(c){
    11b6:	7afb      	ldrb	r3, [r7, #11]
    11b8:	2b18      	cmp	r3, #24
    11ba:	d872      	bhi.n	12a2 <read_line+0x10e>
    11bc:	a201      	add	r2, pc, #4	; (adr r2, 11c4 <read_line+0x30>)
    11be:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    11c2:	bf00      	nop
    11c4:	000012cd 	.word	0x000012cd
    11c8:	000012a3 	.word	0x000012a3
    11cc:	000012a3 	.word	0x000012a3
    11d0:	000012a3 	.word	0x000012a3
    11d4:	000012a3 	.word	0x000012a3
    11d8:	00001295 	.word	0x00001295
    11dc:	000012a3 	.word	0x000012a3
    11e0:	000012a3 	.word	0x000012a3
    11e4:	00001283 	.word	0x00001283
    11e8:	0000129f 	.word	0x0000129f
    11ec:	00001229 	.word	0x00001229
    11f0:	000012a3 	.word	0x000012a3
    11f4:	000012a3 	.word	0x000012a3
    11f8:	00001229 	.word	0x00001229
    11fc:	000012a3 	.word	0x000012a3
    1200:	000012a3 	.word	0x000012a3
    1204:	000012a3 	.word	0x000012a3
    1208:	000012a3 	.word	0x000012a3
    120c:	000012a3 	.word	0x000012a3
    1210:	000012a3 	.word	0x000012a3
    1214:	000012a3 	.word	0x000012a3
    1218:	00001237 	.word	0x00001237
    121c:	000012a3 	.word	0x000012a3
    1220:	0000124d 	.word	0x0000124d
    1224:	00001237 	.word	0x00001237
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    1228:	230d      	movs	r3, #13
    122a:	72fb      	strb	r3, [r7, #11]
				conout(c);
    122c:	7afb      	ldrb	r3, [r7, #11]
    122e:	4618      	mov	r0, r3
    1230:	f7ff ff28 	bl	1084 <conout>
				break;
    1234:	e04a      	b.n	12cc <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
    1236:	68f8      	ldr	r0, [r7, #12]
    1238:	f7ff ff92 	bl	1160 <clear_line>
				line_len=0;
    123c:	2300      	movs	r3, #0
    123e:	60fb      	str	r3, [r7, #12]
				break;
    1240:	e044      	b.n	12cc <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    1242:	f7ff ff6b 	bl	111c <delete_back>
					line_len--;
    1246:	68fb      	ldr	r3, [r7, #12]
    1248:	3b01      	subs	r3, #1
    124a:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    124c:	68fb      	ldr	r3, [r7, #12]
    124e:	2b00      	cmp	r3, #0
    1250:	d006      	beq.n	1260 <read_line+0xcc>
    1252:	68fb      	ldr	r3, [r7, #12]
    1254:	3b01      	subs	r3, #1
    1256:	687a      	ldr	r2, [r7, #4]
    1258:	4413      	add	r3, r2
    125a:	781b      	ldrb	r3, [r3, #0]
    125c:	2b20      	cmp	r3, #32
    125e:	d0f0      	beq.n	1242 <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1260:	e004      	b.n	126c <read_line+0xd8>
					delete_back();
    1262:	f7ff ff5b 	bl	111c <delete_back>
					line_len--;
    1266:	68fb      	ldr	r3, [r7, #12]
    1268:	3b01      	subs	r3, #1
    126a:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    126c:	68fb      	ldr	r3, [r7, #12]
    126e:	2b00      	cmp	r3, #0
    1270:	d006      	beq.n	1280 <read_line+0xec>
    1272:	68fb      	ldr	r3, [r7, #12]
    1274:	3b01      	subs	r3, #1
    1276:	687a      	ldr	r2, [r7, #4]
    1278:	4413      	add	r3, r2
    127a:	781b      	ldrb	r3, [r3, #0]
    127c:	2b20      	cmp	r3, #32
    127e:	d1f0      	bne.n	1262 <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    1280:	e024      	b.n	12cc <read_line+0x138>
				case BS:
				if (line_len){
    1282:	68fb      	ldr	r3, [r7, #12]
    1284:	2b00      	cmp	r3, #0
    1286:	d004      	beq.n	1292 <read_line+0xfe>
					delete_back();
    1288:	f7ff ff48 	bl	111c <delete_back>
					line_len--;
    128c:	68fb      	ldr	r3, [r7, #12]
    128e:	3b01      	subs	r3, #1
    1290:	60fb      	str	r3, [r7, #12]
				}
				break;
    1292:	e01b      	b.n	12cc <read_line+0x138>
				case CTRL_E:
				cls();
    1294:	f7ff ff58 	bl	1148 <cls>
				line_len=0;
    1298:	2300      	movs	r3, #0
    129a:	60fb      	str	r3, [r7, #12]
				break;
    129c:	e016      	b.n	12cc <read_line+0x138>
				case TAB:
				c=SPACE;
    129e:	2320      	movs	r3, #32
    12a0:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    12a2:	68fa      	ldr	r2, [r7, #12]
    12a4:	683b      	ldr	r3, [r7, #0]
    12a6:	429a      	cmp	r2, r3
    12a8:	d20e      	bcs.n	12c8 <read_line+0x134>
    12aa:	7afb      	ldrb	r3, [r7, #11]
    12ac:	2b1f      	cmp	r3, #31
    12ae:	d90b      	bls.n	12c8 <read_line+0x134>
					buffer[line_len++]=c;
    12b0:	68fb      	ldr	r3, [r7, #12]
    12b2:	1c5a      	adds	r2, r3, #1
    12b4:	60fa      	str	r2, [r7, #12]
    12b6:	687a      	ldr	r2, [r7, #4]
    12b8:	4413      	add	r3, r2
    12ba:	7afa      	ldrb	r2, [r7, #11]
    12bc:	701a      	strb	r2, [r3, #0]
					conout(c);
    12be:	7afb      	ldrb	r3, [r7, #11]
    12c0:	4618      	mov	r0, r3
    12c2:	f7ff fedf 	bl	1084 <conout>
    12c6:	e001      	b.n	12cc <read_line+0x138>
				}else{
					beep();
    12c8:	f7ff ff22 	bl	1110 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    12cc:	7afb      	ldrb	r3, [r7, #11]
    12ce:	2b0d      	cmp	r3, #13
    12d0:	f47f af6d 	bne.w	11ae <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    12d4:	687a      	ldr	r2, [r7, #4]
    12d6:	68fb      	ldr	r3, [r7, #12]
    12d8:	4413      	add	r3, r2
    12da:	2200      	movs	r2, #0
    12dc:	701a      	strb	r2, [r3, #0]
	return line_len;
    12de:	68fb      	ldr	r3, [r7, #12]
}
    12e0:	4618      	mov	r0, r3
    12e2:	3710      	adds	r7, #16
    12e4:	46bd      	mov	sp, r7
    12e6:	bd80      	pop	{r7, pc}

000012e8 <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    12e8:	b580      	push	{r7, lr}
    12ea:	b08e      	sub	sp, #56	; 0x38
    12ec:	af00      	add	r7, sp, #0
    12ee:	6078      	str	r0, [r7, #4]
    12f0:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    12f2:	2301      	movs	r3, #1
    12f4:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    12f6:	2322      	movs	r3, #34	; 0x22
    12f8:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    12fa:	2300      	movs	r3, #0
    12fc:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1300:	687b      	ldr	r3, [r7, #4]
    1302:	2b00      	cmp	r3, #0
    1304:	da05      	bge.n	1312 <print_int+0x2a>
    1306:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    130a:	637b      	str	r3, [r7, #52]	; 0x34
    130c:	687b      	ldr	r3, [r7, #4]
    130e:	425b      	negs	r3, r3
    1310:	607b      	str	r3, [r7, #4]
	while (i){
    1312:	e02c      	b.n	136e <print_int+0x86>
		fmt[pos]=i%base+'0';
    1314:	687b      	ldr	r3, [r7, #4]
    1316:	683a      	ldr	r2, [r7, #0]
    1318:	fbb3 f2f2 	udiv	r2, r3, r2
    131c:	6839      	ldr	r1, [r7, #0]
    131e:	fb01 f202 	mul.w	r2, r1, r2
    1322:	1a9b      	subs	r3, r3, r2
    1324:	b2db      	uxtb	r3, r3
    1326:	3330      	adds	r3, #48	; 0x30
    1328:	b2d9      	uxtb	r1, r3
    132a:	f107 020c 	add.w	r2, r7, #12
    132e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1330:	4413      	add	r3, r2
    1332:	460a      	mov	r2, r1
    1334:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    1336:	f107 020c 	add.w	r2, r7, #12
    133a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    133c:	4413      	add	r3, r2
    133e:	781b      	ldrb	r3, [r3, #0]
    1340:	2b39      	cmp	r3, #57	; 0x39
    1342:	d90c      	bls.n	135e <print_int+0x76>
    1344:	f107 020c 	add.w	r2, r7, #12
    1348:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    134a:	4413      	add	r3, r2
    134c:	781b      	ldrb	r3, [r3, #0]
    134e:	3307      	adds	r3, #7
    1350:	b2d9      	uxtb	r1, r3
    1352:	f107 020c 	add.w	r2, r7, #12
    1356:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1358:	4413      	add	r3, r2
    135a:	460a      	mov	r2, r1
    135c:	701a      	strb	r2, [r3, #0]
		pos--;
    135e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1360:	3b01      	subs	r3, #1
    1362:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    1364:	687a      	ldr	r2, [r7, #4]
    1366:	683b      	ldr	r3, [r7, #0]
    1368:	fbb2 f3f3 	udiv	r3, r2, r3
    136c:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    136e:	687b      	ldr	r3, [r7, #4]
    1370:	2b00      	cmp	r3, #0
    1372:	d1cf      	bne.n	1314 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    1374:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1376:	2b22      	cmp	r3, #34	; 0x22
    1378:	d108      	bne.n	138c <print_int+0xa4>
    137a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    137c:	1e5a      	subs	r2, r3, #1
    137e:	633a      	str	r2, [r7, #48]	; 0x30
    1380:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1384:	4413      	add	r3, r2
    1386:	2230      	movs	r2, #48	; 0x30
    1388:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    138c:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    138e:	2b00      	cmp	r3, #0
    1390:	da08      	bge.n	13a4 <print_int+0xbc>
    1392:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1394:	1e5a      	subs	r2, r3, #1
    1396:	633a      	str	r2, [r7, #48]	; 0x30
    1398:	f107 0238 	add.w	r2, r7, #56	; 0x38
    139c:	4413      	add	r3, r2
    139e:	222d      	movs	r2, #45	; 0x2d
    13a0:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    13a4:	f107 020c 	add.w	r2, r7, #12
    13a8:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13aa:	4413      	add	r3, r2
    13ac:	2220      	movs	r2, #32
    13ae:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    13b0:	f107 020c 	add.w	r2, r7, #12
    13b4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13b6:	4413      	add	r3, r2
    13b8:	4618      	mov	r0, r3
    13ba:	f7ff fe95 	bl	10e8 <print>
}
    13be:	3738      	adds	r7, #56	; 0x38
    13c0:	46bd      	mov	sp, r7
    13c2:	bd80      	pop	{r7, pc}

000013c4 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    13c4:	b580      	push	{r7, lr}
    13c6:	b088      	sub	sp, #32
    13c8:	af00      	add	r7, sp, #0
    13ca:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    13cc:	230c      	movs	r3, #12
    13ce:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    13d0:	2300      	movs	r3, #0
    13d2:	767b      	strb	r3, [r7, #25]
	while (u){
    13d4:	e026      	b.n	1424 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    13d6:	687b      	ldr	r3, [r7, #4]
    13d8:	b2db      	uxtb	r3, r3
    13da:	f003 030f 	and.w	r3, r3, #15
    13de:	b2db      	uxtb	r3, r3
    13e0:	3330      	adds	r3, #48	; 0x30
    13e2:	b2d9      	uxtb	r1, r3
    13e4:	f107 020c 	add.w	r2, r7, #12
    13e8:	69fb      	ldr	r3, [r7, #28]
    13ea:	4413      	add	r3, r2
    13ec:	460a      	mov	r2, r1
    13ee:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    13f0:	f107 020c 	add.w	r2, r7, #12
    13f4:	69fb      	ldr	r3, [r7, #28]
    13f6:	4413      	add	r3, r2
    13f8:	781b      	ldrb	r3, [r3, #0]
    13fa:	2b39      	cmp	r3, #57	; 0x39
    13fc:	d90c      	bls.n	1418 <print_hex+0x54>
    13fe:	f107 020c 	add.w	r2, r7, #12
    1402:	69fb      	ldr	r3, [r7, #28]
    1404:	4413      	add	r3, r2
    1406:	781b      	ldrb	r3, [r3, #0]
    1408:	3307      	adds	r3, #7
    140a:	b2d9      	uxtb	r1, r3
    140c:	f107 020c 	add.w	r2, r7, #12
    1410:	69fb      	ldr	r3, [r7, #28]
    1412:	4413      	add	r3, r2
    1414:	460a      	mov	r2, r1
    1416:	701a      	strb	r2, [r3, #0]
		pos--;
    1418:	69fb      	ldr	r3, [r7, #28]
    141a:	3b01      	subs	r3, #1
    141c:	61fb      	str	r3, [r7, #28]
		u/=16;
    141e:	687b      	ldr	r3, [r7, #4]
    1420:	091b      	lsrs	r3, r3, #4
    1422:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    1424:	687b      	ldr	r3, [r7, #4]
    1426:	2b00      	cmp	r3, #0
    1428:	d1d5      	bne.n	13d6 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    142a:	69fb      	ldr	r3, [r7, #28]
    142c:	2b0c      	cmp	r3, #12
    142e:	d108      	bne.n	1442 <print_hex+0x7e>
    1430:	69fb      	ldr	r3, [r7, #28]
    1432:	1e5a      	subs	r2, r3, #1
    1434:	61fa      	str	r2, [r7, #28]
    1436:	f107 0220 	add.w	r2, r7, #32
    143a:	4413      	add	r3, r2
    143c:	2230      	movs	r2, #48	; 0x30
    143e:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    1442:	69fb      	ldr	r3, [r7, #28]
    1444:	1e5a      	subs	r2, r3, #1
    1446:	61fa      	str	r2, [r7, #28]
    1448:	f107 0220 	add.w	r2, r7, #32
    144c:	4413      	add	r3, r2
    144e:	2278      	movs	r2, #120	; 0x78
    1450:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    1454:	69fb      	ldr	r3, [r7, #28]
    1456:	1e5a      	subs	r2, r3, #1
    1458:	61fa      	str	r2, [r7, #28]
    145a:	f107 0220 	add.w	r2, r7, #32
    145e:	4413      	add	r3, r2
    1460:	2230      	movs	r2, #48	; 0x30
    1462:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    1466:	f107 020c 	add.w	r2, r7, #12
    146a:	69fb      	ldr	r3, [r7, #28]
    146c:	4413      	add	r3, r2
    146e:	2220      	movs	r2, #32
    1470:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1472:	f107 020c 	add.w	r2, r7, #12
    1476:	69fb      	ldr	r3, [r7, #28]
    1478:	4413      	add	r3, r2
    147a:	4618      	mov	r0, r3
    147c:	f7ff fe34 	bl	10e8 <print>
}
    1480:	3720      	adds	r7, #32
    1482:	46bd      	mov	sp, r7
    1484:	bd80      	pop	{r7, pc}
    1486:	bf00      	nop

00001488 <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    1488:	b480      	push	{r7}
    148a:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    148c:	4b04      	ldr	r3, [pc, #16]	; (14a0 <flush_rx_queue+0x18>)
    148e:	2200      	movs	r2, #0
    1490:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    1492:	4b03      	ldr	r3, [pc, #12]	; (14a0 <flush_rx_queue+0x18>)
    1494:	2200      	movs	r2, #0
    1496:	625a      	str	r2, [r3, #36]	; 0x24
}
    1498:	46bd      	mov	sp, r7
    149a:	f85d 7b04 	ldr.w	r7, [sp], #4
    149e:	4770      	bx	lr
    14a0:	200000ac 	.word	0x200000ac

000014a4 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    14a4:	b480      	push	{r7}
    14a6:	af00      	add	r7, sp, #0
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
    14a8:	4b13      	ldr	r3, [pc, #76]	; (14f8 <flash_enable+0x54>)
    14aa:	681b      	ldr	r3, [r3, #0]
    14ac:	f003 0301 	and.w	r3, r3, #1
    14b0:	2b00      	cmp	r3, #0
    14b2:	d10c      	bne.n	14ce <flash_enable+0x2a>
		RCC->CR|=RCC_CR_HSION;
    14b4:	4a10      	ldr	r2, [pc, #64]	; (14f8 <flash_enable+0x54>)
    14b6:	4b10      	ldr	r3, [pc, #64]	; (14f8 <flash_enable+0x54>)
    14b8:	681b      	ldr	r3, [r3, #0]
    14ba:	f043 0301 	orr.w	r3, r3, #1
    14be:	6013      	str	r3, [r2, #0]
		while (!(RCC->CR&RCC_CR_HSIRDY));
    14c0:	bf00      	nop
    14c2:	4b0d      	ldr	r3, [pc, #52]	; (14f8 <flash_enable+0x54>)
    14c4:	681b      	ldr	r3, [r3, #0]
    14c6:	f003 0302 	and.w	r3, r3, #2
    14ca:	2b00      	cmp	r3, #0
    14cc:	d0f9      	beq.n	14c2 <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    14ce:	4b0b      	ldr	r3, [pc, #44]	; (14fc <flash_enable+0x58>)
    14d0:	4a0b      	ldr	r2, [pc, #44]	; (1500 <flash_enable+0x5c>)
    14d2:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    14d4:	4b09      	ldr	r3, [pc, #36]	; (14fc <flash_enable+0x58>)
    14d6:	4a0b      	ldr	r2, [pc, #44]	; (1504 <flash_enable+0x60>)
    14d8:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    14da:	4b08      	ldr	r3, [pc, #32]	; (14fc <flash_enable+0x58>)
    14dc:	691b      	ldr	r3, [r3, #16]
    14de:	f003 0380 	and.w	r3, r3, #128	; 0x80
    14e2:	2b00      	cmp	r3, #0
    14e4:	bf0c      	ite	eq
    14e6:	2301      	moveq	r3, #1
    14e8:	2300      	movne	r3, #0
    14ea:	b2db      	uxtb	r3, r3
}
    14ec:	4618      	mov	r0, r3
    14ee:	46bd      	mov	sp, r7
    14f0:	f85d 7b04 	ldr.w	r7, [sp], #4
    14f4:	4770      	bx	lr
    14f6:	bf00      	nop
    14f8:	40021000 	.word	0x40021000
    14fc:	40022000 	.word	0x40022000
    1500:	45670123 	.word	0x45670123
    1504:	cdef89ab 	.word	0xcdef89ab

00001508 <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    1508:	b480      	push	{r7}
    150a:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    150c:	4a04      	ldr	r2, [pc, #16]	; (1520 <flash_disable+0x18>)
    150e:	4b04      	ldr	r3, [pc, #16]	; (1520 <flash_disable+0x18>)
    1510:	691b      	ldr	r3, [r3, #16]
    1512:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    1516:	6113      	str	r3, [r2, #16]
}
    1518:	46bd      	mov	sp, r7
    151a:	f85d 7b04 	ldr.w	r7, [sp], #4
    151e:	4770      	bx	lr
    1520:	40022000 	.word	0x40022000

00001524 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1524:	b480      	push	{r7}
    1526:	b083      	sub	sp, #12
    1528:	af00      	add	r7, sp, #0
    152a:	6078      	str	r0, [r7, #4]
    152c:	460b      	mov	r3, r1
    152e:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    1530:	4b1d      	ldr	r3, [pc, #116]	; (15a8 <flash_write+0x84>)
    1532:	691b      	ldr	r3, [r3, #16]
    1534:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1538:	2b00      	cmp	r3, #0
    153a:	d105      	bne.n	1548 <flash_write+0x24>
    153c:	687b      	ldr	r3, [r7, #4]
    153e:	881b      	ldrh	r3, [r3, #0]
    1540:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1544:	4293      	cmp	r3, r2
    1546:	d001      	beq.n	154c <flash_write+0x28>
    1548:	2300      	movs	r3, #0
    154a:	e027      	b.n	159c <flash_write+0x78>
	while (_flash_busy);
    154c:	bf00      	nop
    154e:	4b16      	ldr	r3, [pc, #88]	; (15a8 <flash_write+0x84>)
    1550:	68db      	ldr	r3, [r3, #12]
    1552:	f003 0301 	and.w	r3, r3, #1
    1556:	2b00      	cmp	r3, #0
    1558:	d1f9      	bne.n	154e <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    155a:	4a13      	ldr	r2, [pc, #76]	; (15a8 <flash_write+0x84>)
    155c:	4b12      	ldr	r3, [pc, #72]	; (15a8 <flash_write+0x84>)
    155e:	68db      	ldr	r3, [r3, #12]
    1560:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1564:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    1566:	4b10      	ldr	r3, [pc, #64]	; (15a8 <flash_write+0x84>)
    1568:	2201      	movs	r2, #1
    156a:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    156c:	687b      	ldr	r3, [r7, #4]
    156e:	887a      	ldrh	r2, [r7, #2]
    1570:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    1572:	bf00      	nop
    1574:	4b0c      	ldr	r3, [pc, #48]	; (15a8 <flash_write+0x84>)
    1576:	68db      	ldr	r3, [r3, #12]
    1578:	f003 0301 	and.w	r3, r3, #1
    157c:	2b00      	cmp	r3, #0
    157e:	d005      	beq.n	158c <flash_write+0x68>
    1580:	4b09      	ldr	r3, [pc, #36]	; (15a8 <flash_write+0x84>)
    1582:	68db      	ldr	r3, [r3, #12]
    1584:	f003 0320 	and.w	r3, r3, #32
    1588:	2b00      	cmp	r3, #0
    158a:	d0f3      	beq.n	1574 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    158c:	687b      	ldr	r3, [r7, #4]
    158e:	881b      	ldrh	r3, [r3, #0]
    1590:	887a      	ldrh	r2, [r7, #2]
    1592:	429a      	cmp	r2, r3
    1594:	bf0c      	ite	eq
    1596:	2301      	moveq	r3, #1
    1598:	2300      	movne	r3, #0
    159a:	b2db      	uxtb	r3, r3
}
    159c:	4618      	mov	r0, r3
    159e:	370c      	adds	r7, #12
    15a0:	46bd      	mov	sp, r7
    15a2:	f85d 7b04 	ldr.w	r7, [sp], #4
    15a6:	4770      	bx	lr
    15a8:	40022000 	.word	0x40022000

000015ac <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    15ac:	b480      	push	{r7}
    15ae:	b087      	sub	sp, #28
    15b0:	af00      	add	r7, sp, #0
    15b2:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    15b4:	4b27      	ldr	r3, [pc, #156]	; (1654 <flash_erase_page+0xa8>)
    15b6:	691b      	ldr	r3, [r3, #16]
    15b8:	f003 0380 	and.w	r3, r3, #128	; 0x80
    15bc:	2b00      	cmp	r3, #0
    15be:	d001      	beq.n	15c4 <flash_erase_page+0x18>
    15c0:	2300      	movs	r3, #0
    15c2:	e040      	b.n	1646 <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    15c4:	4a23      	ldr	r2, [pc, #140]	; (1654 <flash_erase_page+0xa8>)
    15c6:	4b23      	ldr	r3, [pc, #140]	; (1654 <flash_erase_page+0xa8>)
    15c8:	68db      	ldr	r3, [r3, #12]
    15ca:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    15ce:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    15d0:	687b      	ldr	r3, [r7, #4]
    15d2:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    15d6:	f023 0303 	bic.w	r3, r3, #3
    15da:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    15dc:	4b1d      	ldr	r3, [pc, #116]	; (1654 <flash_erase_page+0xa8>)
    15de:	2202      	movs	r2, #2
    15e0:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    15e2:	4a1c      	ldr	r2, [pc, #112]	; (1654 <flash_erase_page+0xa8>)
    15e4:	687b      	ldr	r3, [r7, #4]
    15e6:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    15e8:	4a1a      	ldr	r2, [pc, #104]	; (1654 <flash_erase_page+0xa8>)
    15ea:	4b1a      	ldr	r3, [pc, #104]	; (1654 <flash_erase_page+0xa8>)
    15ec:	691b      	ldr	r3, [r3, #16]
    15ee:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    15f2:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    15f4:	bf00      	nop
    15f6:	4b17      	ldr	r3, [pc, #92]	; (1654 <flash_erase_page+0xa8>)
    15f8:	68db      	ldr	r3, [r3, #12]
    15fa:	f003 0301 	and.w	r3, r3, #1
    15fe:	2b00      	cmp	r3, #0
    1600:	d005      	beq.n	160e <flash_erase_page+0x62>
    1602:	4b14      	ldr	r3, [pc, #80]	; (1654 <flash_erase_page+0xa8>)
    1604:	68db      	ldr	r3, [r3, #12]
    1606:	f003 0320 	and.w	r3, r3, #32
    160a:	2b00      	cmp	r3, #0
    160c:	d0f3      	beq.n	15f6 <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    160e:	687b      	ldr	r3, [r7, #4]
    1610:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    1612:	2300      	movs	r3, #0
    1614:	60fb      	str	r3, [r7, #12]
    1616:	e00c      	b.n	1632 <flash_erase_page+0x86>
		u32=*adr++;
    1618:	697b      	ldr	r3, [r7, #20]
    161a:	1d1a      	adds	r2, r3, #4
    161c:	617a      	str	r2, [r7, #20]
    161e:	681b      	ldr	r3, [r3, #0]
    1620:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    1622:	693b      	ldr	r3, [r7, #16]
    1624:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1628:	d000      	beq.n	162c <flash_erase_page+0x80>
    162a:	e005      	b.n	1638 <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    162c:	68fb      	ldr	r3, [r7, #12]
    162e:	3301      	adds	r3, #1
    1630:	60fb      	str	r3, [r7, #12]
    1632:	68fb      	ldr	r3, [r7, #12]
    1634:	2bff      	cmp	r3, #255	; 0xff
    1636:	ddef      	ble.n	1618 <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    1638:	693b      	ldr	r3, [r7, #16]
    163a:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    163e:	bf0c      	ite	eq
    1640:	2301      	moveq	r3, #1
    1642:	2300      	movne	r3, #0
    1644:	b2db      	uxtb	r3, r3
}
    1646:	4618      	mov	r0, r3
    1648:	371c      	adds	r7, #28
    164a:	46bd      	mov	sp, r7
    164c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1650:	4770      	bx	lr
    1652:	bf00      	nop
    1654:	40022000 	.word	0x40022000

00001658 <gdi_clear_screen>:
#include "gdi.h"

// position  du curseur texte.
static int cursor_x, cursor_y;

void gdi_clear_screen(){
    1658:	b480      	push	{r7}
    165a:	b083      	sub	sp, #12
    165c:	af00      	add	r7, sp, #0
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    165e:	2300      	movs	r3, #0
    1660:	607b      	str	r3, [r7, #4]
    1662:	e006      	b.n	1672 <gdi_clear_screen+0x1a>
		video_buffer[i++]=0;
    1664:	687b      	ldr	r3, [r7, #4]
    1666:	1c5a      	adds	r2, r3, #1
    1668:	607a      	str	r2, [r7, #4]
    166a:	4a06      	ldr	r2, [pc, #24]	; (1684 <gdi_clear_screen+0x2c>)
    166c:	2100      	movs	r1, #0
    166e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
// position  du curseur texte.
static int cursor_x, cursor_y;

void gdi_clear_screen(){
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    1672:	687b      	ldr	r3, [r7, #4]
    1674:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1678:	dbf4      	blt.n	1664 <gdi_clear_screen+0xc>
		video_buffer[i++]=0;
	}
}
    167a:	370c      	adds	r7, #12
    167c:	46bd      	mov	sp, r7
    167e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1682:	4770      	bx	lr
    1684:	20000138 	.word	0x20000138

00001688 <gdi_scroll_up>:

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
    1688:	b480      	push	{r7}
    168a:	b083      	sub	sp, #12
    168c:	af00      	add	r7, sp, #0
	int i,j;
	j=0;
    168e:	2300      	movs	r3, #0
    1690:	603b      	str	r3, [r7, #0]
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    1692:	23a0      	movs	r3, #160	; 0xa0
    1694:	607b      	str	r3, [r7, #4]
    1696:	e00b      	b.n	16b0 <gdi_scroll_up+0x28>
		video_buffer[j++]=video_buffer[i++];
    1698:	683b      	ldr	r3, [r7, #0]
    169a:	1c5a      	adds	r2, r3, #1
    169c:	603a      	str	r2, [r7, #0]
    169e:	687a      	ldr	r2, [r7, #4]
    16a0:	1c51      	adds	r1, r2, #1
    16a2:	6079      	str	r1, [r7, #4]
    16a4:	490e      	ldr	r1, [pc, #56]	; (16e0 <gdi_scroll_up+0x58>)
    16a6:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    16aa:	4a0d      	ldr	r2, [pc, #52]	; (16e0 <gdi_scroll_up+0x58>)
    16ac:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
	int i,j;
	j=0;
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    16b0:	687b      	ldr	r3, [r7, #4]
    16b2:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    16b6:	dbef      	blt.n	1698 <gdi_scroll_up+0x10>
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    16b8:	f44f 5391 	mov.w	r3, #4640	; 0x1220
    16bc:	607b      	str	r3, [r7, #4]
    16be:	e006      	b.n	16ce <gdi_scroll_up+0x46>
		video_buffer[i++]=0;
    16c0:	687b      	ldr	r3, [r7, #4]
    16c2:	1c5a      	adds	r2, r3, #1
    16c4:	607a      	str	r2, [r7, #4]
    16c6:	4a06      	ldr	r2, [pc, #24]	; (16e0 <gdi_scroll_up+0x58>)
    16c8:	2100      	movs	r1, #0
    16ca:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i,j;
	j=0;
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    16ce:	687b      	ldr	r3, [r7, #4]
    16d0:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    16d4:	dbf4      	blt.n	16c0 <gdi_scroll_up+0x38>
		video_buffer[i++]=0;
	}
}
    16d6:	370c      	adds	r7, #12
    16d8:	46bd      	mov	sp, r7
    16da:	f85d 7b04 	ldr.w	r7, [sp], #4
    16de:	4770      	bx	lr
    16e0:	20000138 	.word	0x20000138

000016e4 <gdi_new_line>:

// avance le curseur texte au début 
// de la ligne suivante.
void gdi_new_line(){
    16e4:	b580      	push	{r7, lr}
    16e6:	af00      	add	r7, sp, #0
	cursor_x=0;
    16e8:	4b08      	ldr	r3, [pc, #32]	; (170c <gdi_new_line+0x28>)
    16ea:	2200      	movs	r2, #0
    16ec:	601a      	str	r2, [r3, #0]
	cursor_y+=CHAR_HEIGHT;
    16ee:	4b08      	ldr	r3, [pc, #32]	; (1710 <gdi_new_line+0x2c>)
    16f0:	681b      	ldr	r3, [r3, #0]
    16f2:	3308      	adds	r3, #8
    16f4:	4a06      	ldr	r2, [pc, #24]	; (1710 <gdi_new_line+0x2c>)
    16f6:	6013      	str	r3, [r2, #0]
	if (cursor_y>(VRES-CHAR_HEIGHT)){
    16f8:	4b05      	ldr	r3, [pc, #20]	; (1710 <gdi_new_line+0x2c>)
    16fa:	681b      	ldr	r3, [r3, #0]
    16fc:	2be8      	cmp	r3, #232	; 0xe8
    16fe:	dd04      	ble.n	170a <gdi_new_line+0x26>
		cursor_y=VRES-CHAR_HEIGHT;
    1700:	4b03      	ldr	r3, [pc, #12]	; (1710 <gdi_new_line+0x2c>)
    1702:	22e8      	movs	r2, #232	; 0xe8
    1704:	601a      	str	r2, [r3, #0]
		gdi_scroll_up();
    1706:	f7ff ffbf 	bl	1688 <gdi_scroll_up>
	}
}
    170a:	bd80      	pop	{r7, pc}
    170c:	200000d4 	.word	0x200000d4
    1710:	200000d8 	.word	0x200000d8

00001714 <gdi_cursor_left>:

void gdi_cursor_left(){
    1714:	b480      	push	{r7}
    1716:	af00      	add	r7, sp, #0
	if (!(cursor_x|cursor_y)) return;
    1718:	4b14      	ldr	r3, [pc, #80]	; (176c <gdi_cursor_left+0x58>)
    171a:	681a      	ldr	r2, [r3, #0]
    171c:	4b14      	ldr	r3, [pc, #80]	; (1770 <gdi_cursor_left+0x5c>)
    171e:	681b      	ldr	r3, [r3, #0]
    1720:	4313      	orrs	r3, r2
    1722:	2b00      	cmp	r3, #0
    1724:	d100      	bne.n	1728 <gdi_cursor_left+0x14>
    1726:	e01d      	b.n	1764 <gdi_cursor_left+0x50>
	if (cursor_x>=CHAR_WIDTH){
    1728:	4b10      	ldr	r3, [pc, #64]	; (176c <gdi_cursor_left+0x58>)
    172a:	681b      	ldr	r3, [r3, #0]
    172c:	2b05      	cmp	r3, #5
    172e:	dd05      	ble.n	173c <gdi_cursor_left+0x28>
		cursor_x-=CHAR_WIDTH;
    1730:	4b0e      	ldr	r3, [pc, #56]	; (176c <gdi_cursor_left+0x58>)
    1732:	681b      	ldr	r3, [r3, #0]
    1734:	3b06      	subs	r3, #6
    1736:	4a0d      	ldr	r2, [pc, #52]	; (176c <gdi_cursor_left+0x58>)
    1738:	6013      	str	r3, [r2, #0]
    173a:	e013      	b.n	1764 <gdi_cursor_left+0x50>
	}else if (cursor_y) {
    173c:	4b0c      	ldr	r3, [pc, #48]	; (1770 <gdi_cursor_left+0x5c>)
    173e:	681b      	ldr	r3, [r3, #0]
    1740:	2b00      	cmp	r3, #0
    1742:	d00f      	beq.n	1764 <gdi_cursor_left+0x50>
		cursor_x=CHAR_WIDTH*(CHARS_PER_LINE-1);
    1744:	4b09      	ldr	r3, [pc, #36]	; (176c <gdi_cursor_left+0x58>)
    1746:	f44f 729c 	mov.w	r2, #312	; 0x138
    174a:	601a      	str	r2, [r3, #0]
		cursor_y-=CHAR_HEIGHT;
    174c:	4b08      	ldr	r3, [pc, #32]	; (1770 <gdi_cursor_left+0x5c>)
    174e:	681b      	ldr	r3, [r3, #0]
    1750:	3b08      	subs	r3, #8
    1752:	4a07      	ldr	r2, [pc, #28]	; (1770 <gdi_cursor_left+0x5c>)
    1754:	6013      	str	r3, [r2, #0]
		if (cursor_y<0) cursor_y=0;
    1756:	4b06      	ldr	r3, [pc, #24]	; (1770 <gdi_cursor_left+0x5c>)
    1758:	681b      	ldr	r3, [r3, #0]
    175a:	2b00      	cmp	r3, #0
    175c:	da02      	bge.n	1764 <gdi_cursor_left+0x50>
    175e:	4b04      	ldr	r3, [pc, #16]	; (1770 <gdi_cursor_left+0x5c>)
    1760:	2200      	movs	r2, #0
    1762:	601a      	str	r2, [r3, #0]
	}
}
    1764:	46bd      	mov	sp, r7
    1766:	f85d 7b04 	ldr.w	r7, [sp], #4
    176a:	4770      	bx	lr
    176c:	200000d4 	.word	0x200000d4
    1770:	200000d8 	.word	0x200000d8

00001774 <gdi_bit_op>:


void gdi_bit_op(int x, int y, bitop_e op){
    1774:	b480      	push	{r7}
    1776:	b087      	sub	sp, #28
    1778:	af00      	add	r7, sp, #0
    177a:	60f8      	str	r0, [r7, #12]
    177c:	60b9      	str	r1, [r7, #8]
    177e:	4613      	mov	r3, r2
    1780:	71fb      	strb	r3, [r7, #7]
	uint16_t bit;
	int offset=y*ROW_SIZE+(x>>4);
    1782:	68ba      	ldr	r2, [r7, #8]
    1784:	4613      	mov	r3, r2
    1786:	009b      	lsls	r3, r3, #2
    1788:	4413      	add	r3, r2
    178a:	009b      	lsls	r3, r3, #2
    178c:	461a      	mov	r2, r3
    178e:	68fb      	ldr	r3, [r7, #12]
    1790:	111b      	asrs	r3, r3, #4
    1792:	4413      	add	r3, r2
    1794:	617b      	str	r3, [r7, #20]
	bit=1<<(15-(x&15));
    1796:	68fb      	ldr	r3, [r7, #12]
    1798:	43db      	mvns	r3, r3
    179a:	f003 030f 	and.w	r3, r3, #15
    179e:	2201      	movs	r2, #1
    17a0:	fa02 f303 	lsl.w	r3, r2, r3
    17a4:	827b      	strh	r3, [r7, #18]
	switch (op){
    17a6:	79fb      	ldrb	r3, [r7, #7]
    17a8:	2b01      	cmp	r3, #1
    17aa:	d013      	beq.n	17d4 <gdi_bit_op+0x60>
    17ac:	2b02      	cmp	r3, #2
    17ae:	d01d      	beq.n	17ec <gdi_bit_op+0x78>
    17b0:	2b00      	cmp	r3, #0
    17b2:	d127      	bne.n	1804 <gdi_bit_op+0x90>
	case BLACK_BIT:
		video_buffer[offset]&=~bit;
    17b4:	4a16      	ldr	r2, [pc, #88]	; (1810 <gdi_bit_op+0x9c>)
    17b6:	697b      	ldr	r3, [r7, #20]
    17b8:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    17bc:	b29a      	uxth	r2, r3
    17be:	8a7b      	ldrh	r3, [r7, #18]
    17c0:	43db      	mvns	r3, r3
    17c2:	b29b      	uxth	r3, r3
    17c4:	4013      	ands	r3, r2
    17c6:	b29b      	uxth	r3, r3
    17c8:	b299      	uxth	r1, r3
    17ca:	4a11      	ldr	r2, [pc, #68]	; (1810 <gdi_bit_op+0x9c>)
    17cc:	697b      	ldr	r3, [r7, #20]
    17ce:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    17d2:	e017      	b.n	1804 <gdi_bit_op+0x90>
	case WHITE_BIT:
		video_buffer[offset]|=bit;
    17d4:	4a0e      	ldr	r2, [pc, #56]	; (1810 <gdi_bit_op+0x9c>)
    17d6:	697b      	ldr	r3, [r7, #20]
    17d8:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    17dc:	8a7b      	ldrh	r3, [r7, #18]
    17de:	4313      	orrs	r3, r2
    17e0:	b299      	uxth	r1, r3
    17e2:	4a0b      	ldr	r2, [pc, #44]	; (1810 <gdi_bit_op+0x9c>)
    17e4:	697b      	ldr	r3, [r7, #20]
    17e6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    17ea:	e00b      	b.n	1804 <gdi_bit_op+0x90>
	case XOR_BIT:
		video_buffer[offset]^=bit;
    17ec:	4a08      	ldr	r2, [pc, #32]	; (1810 <gdi_bit_op+0x9c>)
    17ee:	697b      	ldr	r3, [r7, #20]
    17f0:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    17f4:	8a7b      	ldrh	r3, [r7, #18]
    17f6:	4053      	eors	r3, r2
    17f8:	b299      	uxth	r1, r3
    17fa:	4a05      	ldr	r2, [pc, #20]	; (1810 <gdi_bit_op+0x9c>)
    17fc:	697b      	ldr	r3, [r7, #20]
    17fe:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1802:	bf00      	nop
	}
}
    1804:	371c      	adds	r7, #28
    1806:	46bd      	mov	sp, r7
    1808:	f85d 7b04 	ldr.w	r7, [sp], #4
    180c:	4770      	bx	lr
    180e:	bf00      	nop
    1810:	20000138 	.word	0x20000138

00001814 <gdi_box>:

void gdi_box(int x, int y, int w, int h, bitop_e op){
    1814:	b580      	push	{r7, lr}
    1816:	b086      	sub	sp, #24
    1818:	af00      	add	r7, sp, #0
    181a:	60f8      	str	r0, [r7, #12]
    181c:	60b9      	str	r1, [r7, #8]
    181e:	607a      	str	r2, [r7, #4]
    1820:	603b      	str	r3, [r7, #0]
	int r,c;
	
	for (r=0;r<h;r++){
    1822:	2300      	movs	r3, #0
    1824:	617b      	str	r3, [r7, #20]
    1826:	e02e      	b.n	1886 <gdi_box+0x72>
		for (c=0;c<w;c++){
    1828:	2300      	movs	r3, #0
    182a:	613b      	str	r3, [r7, #16]
    182c:	e024      	b.n	1878 <gdi_box+0x64>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    182e:	68fa      	ldr	r2, [r7, #12]
    1830:	693b      	ldr	r3, [r7, #16]
    1832:	4413      	add	r3, r2
    1834:	2b00      	cmp	r3, #0
    1836:	db1c      	blt.n	1872 <gdi_box+0x5e>
    1838:	68fa      	ldr	r2, [r7, #12]
    183a:	693b      	ldr	r3, [r7, #16]
    183c:	4413      	add	r3, r2
    183e:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    1842:	da16      	bge.n	1872 <gdi_box+0x5e>
    1844:	697a      	ldr	r2, [r7, #20]
    1846:	68bb      	ldr	r3, [r7, #8]
    1848:	4413      	add	r3, r2
    184a:	2b00      	cmp	r3, #0
    184c:	db11      	blt.n	1872 <gdi_box+0x5e>
    184e:	697a      	ldr	r2, [r7, #20]
    1850:	68bb      	ldr	r3, [r7, #8]
    1852:	4413      	add	r3, r2
    1854:	2bef      	cmp	r3, #239	; 0xef
    1856:	dc0c      	bgt.n	1872 <gdi_box+0x5e>
				gdi_bit_op(c+x,r+y,op);
    1858:	693a      	ldr	r2, [r7, #16]
    185a:	68fb      	ldr	r3, [r7, #12]
    185c:	18d1      	adds	r1, r2, r3
    185e:	697a      	ldr	r2, [r7, #20]
    1860:	68bb      	ldr	r3, [r7, #8]
    1862:	441a      	add	r2, r3
    1864:	f897 3020 	ldrb.w	r3, [r7, #32]
    1868:	4608      	mov	r0, r1
    186a:	4611      	mov	r1, r2
    186c:	461a      	mov	r2, r3
    186e:	f7ff ff81 	bl	1774 <gdi_bit_op>

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
		for (c=0;c<w;c++){
    1872:	693b      	ldr	r3, [r7, #16]
    1874:	3301      	adds	r3, #1
    1876:	613b      	str	r3, [r7, #16]
    1878:	693a      	ldr	r2, [r7, #16]
    187a:	687b      	ldr	r3, [r7, #4]
    187c:	429a      	cmp	r2, r3
    187e:	dbd6      	blt.n	182e <gdi_box+0x1a>
}

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
    1880:	697b      	ldr	r3, [r7, #20]
    1882:	3301      	adds	r3, #1
    1884:	617b      	str	r3, [r7, #20]
    1886:	697a      	ldr	r2, [r7, #20]
    1888:	683b      	ldr	r3, [r7, #0]
    188a:	429a      	cmp	r2, r3
    188c:	dbcc      	blt.n	1828 <gdi_box+0x14>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				gdi_bit_op(c+x,r+y,op);
			}
		}
	}
}
    188e:	3718      	adds	r7, #24
    1890:	46bd      	mov	sp, r7
    1892:	bd80      	pop	{r7, pc}

00001894 <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
    1894:	b480      	push	{r7}
    1896:	b089      	sub	sp, #36	; 0x24
    1898:	af00      	add	r7, sp, #0
    189a:	60f8      	str	r0, [r7, #12]
    189c:	60b9      	str	r1, [r7, #8]
    189e:	607a      	str	r2, [r7, #4]
    18a0:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    18a2:	2300      	movs	r3, #0
    18a4:	61fb      	str	r3, [r7, #28]
    18a6:	e067      	b.n	1978 <gdi_put_sprite+0xe4>
		mask=128;
    18a8:	2380      	movs	r3, #128	; 0x80
    18aa:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    18ac:	2300      	movs	r3, #0
    18ae:	61bb      	str	r3, [r7, #24]
    18b0:	e05b      	b.n	196a <gdi_put_sprite+0xd6>
			if (!mask){
    18b2:	7dfb      	ldrb	r3, [r7, #23]
    18b4:	2b00      	cmp	r3, #0
    18b6:	d104      	bne.n	18c2 <gdi_put_sprite+0x2e>
				sprite++;
    18b8:	6abb      	ldr	r3, [r7, #40]	; 0x28
    18ba:	3301      	adds	r3, #1
    18bc:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    18be:	2380      	movs	r3, #128	; 0x80
    18c0:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    18c2:	68fa      	ldr	r2, [r7, #12]
    18c4:	69bb      	ldr	r3, [r7, #24]
    18c6:	4413      	add	r3, r2
    18c8:	2b00      	cmp	r3, #0
    18ca:	db48      	blt.n	195e <gdi_put_sprite+0xca>
    18cc:	68fa      	ldr	r2, [r7, #12]
    18ce:	69bb      	ldr	r3, [r7, #24]
    18d0:	4413      	add	r3, r2
    18d2:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    18d6:	da42      	bge.n	195e <gdi_put_sprite+0xca>
    18d8:	69fa      	ldr	r2, [r7, #28]
    18da:	68bb      	ldr	r3, [r7, #8]
    18dc:	4413      	add	r3, r2
    18de:	2b00      	cmp	r3, #0
    18e0:	db3d      	blt.n	195e <gdi_put_sprite+0xca>
    18e2:	69fa      	ldr	r2, [r7, #28]
    18e4:	68bb      	ldr	r3, [r7, #8]
    18e6:	4413      	add	r3, r2
    18e8:	2bef      	cmp	r3, #239	; 0xef
    18ea:	dc38      	bgt.n	195e <gdi_put_sprite+0xca>
				bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
    18ec:	69fb      	ldr	r3, [r7, #28]
    18ee:	6aba      	ldr	r2, [r7, #40]	; 0x28
    18f0:	4413      	add	r3, r2
    18f2:	781a      	ldrb	r2, [r3, #0]
    18f4:	7dfb      	ldrb	r3, [r7, #23]
    18f6:	4013      	ands	r3, r2
    18f8:	b2db      	uxtb	r3, r3
    18fa:	2b00      	cmp	r3, #0
    18fc:	d00a      	beq.n	1914 <gdi_put_sprite+0x80>
    18fe:	69ba      	ldr	r2, [r7, #24]
    1900:	68fb      	ldr	r3, [r7, #12]
    1902:	4413      	add	r3, r2
    1904:	43db      	mvns	r3, r3
    1906:	f003 030f 	and.w	r3, r3, #15
    190a:	2201      	movs	r2, #1
    190c:	fa02 f303 	lsl.w	r3, r2, r3
    1910:	b29b      	uxth	r3, r3
    1912:	e000      	b.n	1916 <gdi_put_sprite+0x82>
    1914:	2300      	movs	r3, #0
    1916:	82bb      	strh	r3, [r7, #20]
				video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]^=bit;
    1918:	69fa      	ldr	r2, [r7, #28]
    191a:	68bb      	ldr	r3, [r7, #8]
    191c:	441a      	add	r2, r3
    191e:	4613      	mov	r3, r2
    1920:	009b      	lsls	r3, r3, #2
    1922:	4413      	add	r3, r2
    1924:	009b      	lsls	r3, r3, #2
    1926:	4619      	mov	r1, r3
    1928:	69ba      	ldr	r2, [r7, #24]
    192a:	68fb      	ldr	r3, [r7, #12]
    192c:	4413      	add	r3, r2
    192e:	111b      	asrs	r3, r3, #4
    1930:	4419      	add	r1, r3
    1932:	69fa      	ldr	r2, [r7, #28]
    1934:	68bb      	ldr	r3, [r7, #8]
    1936:	441a      	add	r2, r3
    1938:	4613      	mov	r3, r2
    193a:	009b      	lsls	r3, r3, #2
    193c:	4413      	add	r3, r2
    193e:	009b      	lsls	r3, r3, #2
    1940:	4618      	mov	r0, r3
    1942:	69ba      	ldr	r2, [r7, #24]
    1944:	68fb      	ldr	r3, [r7, #12]
    1946:	4413      	add	r3, r2
    1948:	111b      	asrs	r3, r3, #4
    194a:	4403      	add	r3, r0
    194c:	4a0f      	ldr	r2, [pc, #60]	; (198c <gdi_put_sprite+0xf8>)
    194e:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1952:	8abb      	ldrh	r3, [r7, #20]
    1954:	4053      	eors	r3, r2
    1956:	b29a      	uxth	r2, r3
    1958:	4b0c      	ldr	r3, [pc, #48]	; (198c <gdi_put_sprite+0xf8>)
    195a:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
    195e:	7dfb      	ldrb	r3, [r7, #23]
    1960:	085b      	lsrs	r3, r3, #1
    1962:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    1964:	69bb      	ldr	r3, [r7, #24]
    1966:	3301      	adds	r3, #1
    1968:	61bb      	str	r3, [r7, #24]
    196a:	69ba      	ldr	r2, [r7, #24]
    196c:	687b      	ldr	r3, [r7, #4]
    196e:	429a      	cmp	r2, r3
    1970:	db9f      	blt.n	18b2 <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1972:	69fb      	ldr	r3, [r7, #28]
    1974:	3301      	adds	r3, #1
    1976:	61fb      	str	r3, [r7, #28]
    1978:	69fa      	ldr	r2, [r7, #28]
    197a:	683b      	ldr	r3, [r7, #0]
    197c:	429a      	cmp	r2, r3
    197e:	db93      	blt.n	18a8 <gdi_put_sprite+0x14>
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    1980:	3724      	adds	r7, #36	; 0x24
    1982:	46bd      	mov	sp, r7
    1984:	f85d 7b04 	ldr.w	r7, [sp], #4
    1988:	4770      	bx	lr
    198a:	bf00      	nop
    198c:	20000138 	.word	0x20000138

00001990 <gdi_putc>:


// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void gdi_putc(unsigned char c){
    1990:	b580      	push	{r7, lr}
    1992:	b084      	sub	sp, #16
    1994:	af02      	add	r7, sp, #8
    1996:	4603      	mov	r3, r0
    1998:	71fb      	strb	r3, [r7, #7]
		switch (c){
    199a:	79fb      	ldrb	r3, [r7, #7]
    199c:	2b08      	cmp	r3, #8
    199e:	d004      	beq.n	19aa <gdi_putc+0x1a>
    19a0:	2b0d      	cmp	r3, #13
    19a2:	d111      	bne.n	19c8 <gdi_putc+0x38>
		case CR:
			gdi_new_line();
    19a4:	f7ff fe9e 	bl	16e4 <gdi_new_line>
			break;
    19a8:	e02c      	b.n	1a04 <gdi_putc+0x74>
		case BS:
			gdi_cursor_left();
    19aa:	f7ff feb3 	bl	1714 <gdi_cursor_left>
			gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    19ae:	4b17      	ldr	r3, [pc, #92]	; (1a0c <gdi_putc+0x7c>)
    19b0:	6819      	ldr	r1, [r3, #0]
    19b2:	4b17      	ldr	r3, [pc, #92]	; (1a10 <gdi_putc+0x80>)
    19b4:	681a      	ldr	r2, [r3, #0]
    19b6:	2300      	movs	r3, #0
    19b8:	9300      	str	r3, [sp, #0]
    19ba:	4608      	mov	r0, r1
    19bc:	4611      	mov	r1, r2
    19be:	2206      	movs	r2, #6
    19c0:	2308      	movs	r3, #8
    19c2:	f7ff ff27 	bl	1814 <gdi_box>
			break;
    19c6:	e01d      	b.n	1a04 <gdi_putc+0x74>
		default:
			if (c<FONT_SIZE){
    19c8:	79fb      	ldrb	r3, [r7, #7]
    19ca:	b25b      	sxtb	r3, r3
    19cc:	2b00      	cmp	r3, #0
    19ce:	db18      	blt.n	1a02 <gdi_putc+0x72>
				gdi_put_sprite(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,&font6x8[c]);
    19d0:	4b0e      	ldr	r3, [pc, #56]	; (1a0c <gdi_putc+0x7c>)
    19d2:	6818      	ldr	r0, [r3, #0]
    19d4:	4b0e      	ldr	r3, [pc, #56]	; (1a10 <gdi_putc+0x80>)
    19d6:	6819      	ldr	r1, [r3, #0]
    19d8:	79fb      	ldrb	r3, [r7, #7]
    19da:	00db      	lsls	r3, r3, #3
    19dc:	4a0d      	ldr	r2, [pc, #52]	; (1a14 <gdi_putc+0x84>)
    19de:	4413      	add	r3, r2
    19e0:	9300      	str	r3, [sp, #0]
    19e2:	2206      	movs	r2, #6
    19e4:	2308      	movs	r3, #8
    19e6:	f7ff ff55 	bl	1894 <gdi_put_sprite>
				cursor_x+=CHAR_WIDTH;
    19ea:	4b08      	ldr	r3, [pc, #32]	; (1a0c <gdi_putc+0x7c>)
    19ec:	681b      	ldr	r3, [r3, #0]
    19ee:	3306      	adds	r3, #6
    19f0:	4a06      	ldr	r2, [pc, #24]	; (1a0c <gdi_putc+0x7c>)
    19f2:	6013      	str	r3, [r2, #0]
				if (cursor_x>(HRES-CHAR_WIDTH)){
    19f4:	4b05      	ldr	r3, [pc, #20]	; (1a0c <gdi_putc+0x7c>)
    19f6:	681b      	ldr	r3, [r3, #0]
    19f8:	f5b3 7f9d 	cmp.w	r3, #314	; 0x13a
    19fc:	dd01      	ble.n	1a02 <gdi_putc+0x72>
					gdi_new_line();
    19fe:	f7ff fe71 	bl	16e4 <gdi_new_line>
				}
			}
			break;
    1a02:	bf00      	nop
		}//switch
}
    1a04:	3708      	adds	r7, #8
    1a06:	46bd      	mov	sp, r7
    1a08:	bd80      	pop	{r7, pc}
    1a0a:	bf00      	nop
    1a0c:	200000d4 	.word	0x200000d4
    1a10:	200000d8 	.word	0x200000d8
    1a14:	00002c30 	.word	0x00002c30

00001a18 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    1a18:	b490      	push	{r4, r7}
    1a1a:	b086      	sub	sp, #24
    1a1c:	af00      	add	r7, sp, #0
    1a1e:	60f8      	str	r0, [r7, #12]
    1a20:	60b9      	str	r1, [r7, #8]
    1a22:	607a      	str	r2, [r7, #4]
	register gpio_crl_t* cr;
	uint8_t shift;
	switch (port){
    1a24:	68fb      	ldr	r3, [r7, #12]
    1a26:	2b01      	cmp	r3, #1
    1a28:	d006      	beq.n	1a38 <config_pin+0x20>
    1a2a:	2b01      	cmp	r3, #1
    1a2c:	d302      	bcc.n	1a34 <config_pin+0x1c>
    1a2e:	2b02      	cmp	r3, #2
    1a30:	d004      	beq.n	1a3c <config_pin+0x24>
    1a32:	e005      	b.n	1a40 <config_pin+0x28>
		case GPIOA:
		cr=(gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS);
    1a34:	4c17      	ldr	r4, [pc, #92]	; (1a94 <config_pin+0x7c>)
		break;
    1a36:	e003      	b.n	1a40 <config_pin+0x28>
		case GPIOB:
		cr=(gpio_crl_t*)(GPIOB_BASE_ADR+GPIO_CRL_OFS);
    1a38:	4c17      	ldr	r4, [pc, #92]	; (1a98 <config_pin+0x80>)
		break;
    1a3a:	e001      	b.n	1a40 <config_pin+0x28>
		case GPIOC:
		cr=(gpio_crl_t*)(GPIOC_BASE_ADR+GPIO_CRL_OFS);
    1a3c:	4c17      	ldr	r4, [pc, #92]	; (1a9c <config_pin+0x84>)
		break;
    1a3e:	bf00      	nop
	}
	shift=(pin&7)<<2;
    1a40:	68bb      	ldr	r3, [r7, #8]
    1a42:	b2db      	uxtb	r3, r3
    1a44:	f003 0307 	and.w	r3, r3, #7
    1a48:	b2db      	uxtb	r3, r3
    1a4a:	009b      	lsls	r3, r3, #2
    1a4c:	75fb      	strb	r3, [r7, #23]
	cr[pin>>3].cr&=~(15<<shift);
    1a4e:	68bb      	ldr	r3, [r7, #8]
    1a50:	08db      	lsrs	r3, r3, #3
    1a52:	009b      	lsls	r3, r3, #2
    1a54:	4423      	add	r3, r4
    1a56:	68ba      	ldr	r2, [r7, #8]
    1a58:	08d2      	lsrs	r2, r2, #3
    1a5a:	0092      	lsls	r2, r2, #2
    1a5c:	4422      	add	r2, r4
    1a5e:	6812      	ldr	r2, [r2, #0]
    1a60:	7df9      	ldrb	r1, [r7, #23]
    1a62:	200f      	movs	r0, #15
    1a64:	fa00 f101 	lsl.w	r1, r0, r1
    1a68:	43c9      	mvns	r1, r1
    1a6a:	400a      	ands	r2, r1
    1a6c:	601a      	str	r2, [r3, #0]
	cr[pin>>3].cr|=config<<shift;
    1a6e:	68bb      	ldr	r3, [r7, #8]
    1a70:	08db      	lsrs	r3, r3, #3
    1a72:	009b      	lsls	r3, r3, #2
    1a74:	4423      	add	r3, r4
    1a76:	68ba      	ldr	r2, [r7, #8]
    1a78:	08d2      	lsrs	r2, r2, #3
    1a7a:	0092      	lsls	r2, r2, #2
    1a7c:	4422      	add	r2, r4
    1a7e:	6811      	ldr	r1, [r2, #0]
    1a80:	7dfa      	ldrb	r2, [r7, #23]
    1a82:	6878      	ldr	r0, [r7, #4]
    1a84:	fa00 f202 	lsl.w	r2, r0, r2
    1a88:	430a      	orrs	r2, r1
    1a8a:	601a      	str	r2, [r3, #0]
}
    1a8c:	3718      	adds	r7, #24
    1a8e:	46bd      	mov	sp, r7
    1a90:	bc90      	pop	{r4, r7}
    1a92:	4770      	bx	lr
    1a94:	40010800 	.word	0x40010800
    1a98:	40010c00 	.word	0x40010c00
    1a9c:	40011000 	.word	0x40011000

00001aa0 <keyboard_init>:
    ps2_flags = 0;
    return KbdSend(KBD_RESET);
}//KbdReset()
*/
 
void keyboard_init(){
    1aa0:	b580      	push	{r7, lr}
    1aa2:	af00      	add	r7, sp, #0
	head=0;
    1aa4:	4b22      	ldr	r3, [pc, #136]	; (1b30 <keyboard_init+0x90>)
    1aa6:	2200      	movs	r2, #0
    1aa8:	601a      	str	r2, [r3, #0]
	tail=0;
    1aaa:	4b22      	ldr	r3, [pc, #136]	; (1b34 <keyboard_init+0x94>)
    1aac:	2200      	movs	r2, #0
    1aae:	601a      	str	r2, [r3, #0]
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
    1ab0:	4a21      	ldr	r2, [pc, #132]	; (1b38 <keyboard_init+0x98>)
    1ab2:	4b21      	ldr	r3, [pc, #132]	; (1b38 <keyboard_init+0x98>)
    1ab4:	699b      	ldr	r3, [r3, #24]
    1ab6:	f043 0305 	orr.w	r3, r3, #5
    1aba:	6193      	str	r3, [r2, #24]
	// activation clock TMR2
	RCC->APB1ENR|=RCC_APB1ENR_TIM2EN; 
    1abc:	4a1e      	ldr	r2, [pc, #120]	; (1b38 <keyboard_init+0x98>)
    1abe:	4b1e      	ldr	r3, [pc, #120]	; (1b38 <keyboard_init+0x98>)
    1ac0:	69db      	ldr	r3, [r3, #28]
    1ac2:	f043 0301 	orr.w	r3, r3, #1
    1ac6:	61d3      	str	r3, [r2, #28]
	TMR2->ARR=FAPB1/20*.01;
    1ac8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1acc:	f44f 527a 	mov.w	r2, #16000	; 0x3e80
    1ad0:	62da      	str	r2, [r3, #44]	; 0x2c
	TMR2->PSC=20;
    1ad2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1ad6:	2214      	movs	r2, #20
    1ad8:	629a      	str	r2, [r3, #40]	; 0x28
	TMR2->CR1=BIT0|BIT7; // ARPE
    1ada:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1ade:	2281      	movs	r2, #129	; 0x81
    1ae0:	601a      	str	r2, [r3, #0]
	TMR2->DIER=BIT0; // UIE
    1ae2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1ae6:	2201      	movs	r2, #1
    1ae8:	60da      	str	r2, [r3, #12]
	set_int_priority(IRQ_KBD_CLK,0);
    1aea:	2017      	movs	r0, #23
    1aec:	2100      	movs	r1, #0
    1aee:	f000 fb0d 	bl	210c <set_int_priority>
	set_int_priority(IRQ_TIM2,14);
    1af2:	201c      	movs	r0, #28
    1af4:	210e      	movs	r1, #14
    1af6:	f000 fb09 	bl	210c <set_int_priority>
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
    1afa:	4a10      	ldr	r2, [pc, #64]	; (1b3c <keyboard_init+0x9c>)
    1afc:	4b0f      	ldr	r3, [pc, #60]	; (1b3c <keyboard_init+0x9c>)
    1afe:	68db      	ldr	r3, [r3, #12]
    1b00:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1b04:	60d3      	str	r3, [r2, #12]
	EXTI->IMR|=KBD_CLK_PIN;
    1b06:	4a0d      	ldr	r2, [pc, #52]	; (1b3c <keyboard_init+0x9c>)
    1b08:	4b0c      	ldr	r3, [pc, #48]	; (1b3c <keyboard_init+0x9c>)
    1b0a:	681b      	ldr	r3, [r3, #0]
    1b0c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1b10:	6013      	str	r3, [r2, #0]
	enable_interrupt(IRQ_KBD_CLK);
    1b12:	2017      	movs	r0, #23
    1b14:	f000 fab2 	bl	207c <enable_interrupt>
	TMR2->SR&=~BIT0;
    1b18:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    1b1c:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1b20:	691b      	ldr	r3, [r3, #16]
    1b22:	f023 0301 	bic.w	r3, r3, #1
    1b26:	6113      	str	r3, [r2, #16]
	enable_interrupt(IRQ_TIM2);
    1b28:	201c      	movs	r0, #28
    1b2a:	f000 faa7 	bl	207c <enable_interrupt>
	//pause(700);
	//if (!KbdReset()) print("keyboard reset failed\n");
}
    1b2e:	bd80      	pop	{r7, pc}
    1b30:	200000fc 	.word	0x200000fc
    1b34:	20000100 	.word	0x20000100
    1b38:	40021000 	.word	0x40021000
    1b3c:	40010400 	.word	0x40010400

00001b40 <kbd_getc>:


unsigned char kbd_getc(){
    1b40:	b480      	push	{r7}
    1b42:	b083      	sub	sp, #12
    1b44:	af00      	add	r7, sp, #0
	unsigned char c=0;
    1b46:	2300      	movs	r3, #0
    1b48:	71fb      	strb	r3, [r7, #7]
	if (head!=tail){
    1b4a:	4b0d      	ldr	r3, [pc, #52]	; (1b80 <kbd_getc+0x40>)
    1b4c:	681a      	ldr	r2, [r3, #0]
    1b4e:	4b0d      	ldr	r3, [pc, #52]	; (1b84 <kbd_getc+0x44>)
    1b50:	681b      	ldr	r3, [r3, #0]
    1b52:	429a      	cmp	r2, r3
    1b54:	d00d      	beq.n	1b72 <kbd_getc+0x32>
		c=queue[head++];
    1b56:	4b0a      	ldr	r3, [pc, #40]	; (1b80 <kbd_getc+0x40>)
    1b58:	681b      	ldr	r3, [r3, #0]
    1b5a:	1c5a      	adds	r2, r3, #1
    1b5c:	4908      	ldr	r1, [pc, #32]	; (1b80 <kbd_getc+0x40>)
    1b5e:	600a      	str	r2, [r1, #0]
    1b60:	4a09      	ldr	r2, [pc, #36]	; (1b88 <kbd_getc+0x48>)
    1b62:	5cd3      	ldrb	r3, [r2, r3]
    1b64:	71fb      	strb	r3, [r7, #7]
		head&=QUEUE_SIZE-1;
    1b66:	4b06      	ldr	r3, [pc, #24]	; (1b80 <kbd_getc+0x40>)
    1b68:	681b      	ldr	r3, [r3, #0]
    1b6a:	f003 031f 	and.w	r3, r3, #31
    1b6e:	4a04      	ldr	r2, [pc, #16]	; (1b80 <kbd_getc+0x40>)
    1b70:	6013      	str	r3, [r2, #0]
	}
	return c;
    1b72:	79fb      	ldrb	r3, [r7, #7]
}
    1b74:	4618      	mov	r0, r3
    1b76:	370c      	adds	r7, #12
    1b78:	46bd      	mov	sp, r7
    1b7a:	f85d 7b04 	ldr.w	r7, [sp], #4
    1b7e:	4770      	bx	lr
    1b80:	200000fc 	.word	0x200000fc
    1b84:	20000100 	.word	0x20000100
    1b88:	200000dc 	.word	0x200000dc

00001b8c <search_table>:
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
    1b8c:	b480      	push	{r7}
    1b8e:	b083      	sub	sp, #12
    1b90:	af00      	add	r7, sp, #0
    1b92:	6078      	str	r0, [r7, #4]
    1b94:	460b      	mov	r3, r1
    1b96:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    1b98:	e008      	b.n	1bac <search_table+0x20>
		if (table->code==code) break;
    1b9a:	687b      	ldr	r3, [r7, #4]
    1b9c:	781b      	ldrb	r3, [r3, #0]
    1b9e:	78fa      	ldrb	r2, [r7, #3]
    1ba0:	429a      	cmp	r2, r3
    1ba2:	d100      	bne.n	1ba6 <search_table+0x1a>
    1ba4:	e006      	b.n	1bb4 <search_table+0x28>
		table++;
    1ba6:	687b      	ldr	r3, [r7, #4]
    1ba8:	3302      	adds	r3, #2
    1baa:	607b      	str	r3, [r7, #4]

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
    1bac:	687b      	ldr	r3, [r7, #4]
    1bae:	781b      	ldrb	r3, [r3, #0]
    1bb0:	2b00      	cmp	r3, #0
    1bb2:	d1f2      	bne.n	1b9a <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    1bb4:	687b      	ldr	r3, [r7, #4]
    1bb6:	785b      	ldrb	r3, [r3, #1]
}
    1bb8:	4618      	mov	r0, r3
    1bba:	370c      	adds	r7, #12
    1bbc:	46bd      	mov	sp, r7
    1bbe:	f85d 7b04 	ldr.w	r7, [sp], #4
    1bc2:	4770      	bx	lr

00001bc4 <convert_code>:

static void convert_code(unsigned char code){
    1bc4:	b580      	push	{r7, lr}
    1bc6:	b086      	sub	sp, #24
    1bc8:	af00      	add	r7, sp, #0
    1bca:	4603      	mov	r3, r0
    1bcc:	71fb      	strb	r3, [r7, #7]
		unsigned char c,s;
		int shift;
		
		switch (code){
    1bce:	79fb      	ldrb	r3, [r7, #7]
    1bd0:	2b59      	cmp	r3, #89	; 0x59
    1bd2:	f000 80a3 	beq.w	1d1c <convert_code+0x158>
    1bd6:	2b59      	cmp	r3, #89	; 0x59
    1bd8:	dc0e      	bgt.n	1bf8 <convert_code+0x34>
    1bda:	2b12      	cmp	r3, #18
    1bdc:	d042      	beq.n	1c64 <convert_code+0xa0>
    1bde:	2b12      	cmp	r3, #18
    1be0:	dc03      	bgt.n	1bea <convert_code+0x26>
    1be2:	2b11      	cmp	r3, #17
    1be4:	f000 80c2 	beq.w	1d6c <convert_code+0x1a8>
    1be8:	e0e8      	b.n	1dbc <convert_code+0x1f8>
    1bea:	2b14      	cmp	r3, #20
    1bec:	f000 80aa 	beq.w	1d44 <convert_code+0x180>
    1bf0:	2b58      	cmp	r3, #88	; 0x58
    1bf2:	f000 80cf 	beq.w	1d94 <convert_code+0x1d0>
    1bf6:	e0e1      	b.n	1dbc <convert_code+0x1f8>
    1bf8:	2be0      	cmp	r3, #224	; 0xe0
    1bfa:	d010      	beq.n	1c1e <convert_code+0x5a>
    1bfc:	2be0      	cmp	r3, #224	; 0xe0
    1bfe:	dc02      	bgt.n	1c06 <convert_code+0x42>
    1c00:	2b7c      	cmp	r3, #124	; 0x7c
    1c02:	d051      	beq.n	1ca8 <convert_code+0xe4>
    1c04:	e0da      	b.n	1dbc <convert_code+0x1f8>
    1c06:	2be1      	cmp	r3, #225	; 0xe1
    1c08:	d010      	beq.n	1c2c <convert_code+0x68>
    1c0a:	2bf0      	cmp	r3, #240	; 0xf0
    1c0c:	f040 80d6 	bne.w	1dbc <convert_code+0x1f8>
		case 0xF0:
			flags |= RELEASE;
    1c10:	4b9c      	ldr	r3, [pc, #624]	; (1e84 <convert_code+0x2c0>)
    1c12:	681b      	ldr	r3, [r3, #0]
    1c14:	f043 0302 	orr.w	r3, r3, #2
    1c18:	4a9a      	ldr	r2, [pc, #616]	; (1e84 <convert_code+0x2c0>)
    1c1a:	6013      	str	r3, [r2, #0]
			break;
    1c1c:	e145      	b.n	1eaa <convert_code+0x2e6>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    1c1e:	4b99      	ldr	r3, [pc, #612]	; (1e84 <convert_code+0x2c0>)
    1c20:	681b      	ldr	r3, [r3, #0]
    1c22:	f043 0301 	orr.w	r3, r3, #1
    1c26:	4a97      	ldr	r2, [pc, #604]	; (1e84 <convert_code+0x2c0>)
    1c28:	6013      	str	r3, [r2, #0]
			break;
    1c2a:	e13e      	b.n	1eaa <convert_code+0x2e6>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    1c2c:	4b95      	ldr	r3, [pc, #596]	; (1e84 <convert_code+0x2c0>)
    1c2e:	681b      	ldr	r3, [r3, #0]
    1c30:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    1c34:	4a93      	ldr	r2, [pc, #588]	; (1e84 <convert_code+0x2c0>)
    1c36:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    1c38:	4b92      	ldr	r3, [pc, #584]	; (1e84 <convert_code+0x2c0>)
    1c3a:	681b      	ldr	r3, [r3, #0]
    1c3c:	f403 7380 	and.w	r3, r3, #256	; 0x100
    1c40:	2b00      	cmp	r3, #0
    1c42:	d10e      	bne.n	1c62 <convert_code+0x9e>
				queue[tail++]=PAUSE;
    1c44:	4b90      	ldr	r3, [pc, #576]	; (1e88 <convert_code+0x2c4>)
    1c46:	681b      	ldr	r3, [r3, #0]
    1c48:	1c5a      	adds	r2, r3, #1
    1c4a:	498f      	ldr	r1, [pc, #572]	; (1e88 <convert_code+0x2c4>)
    1c4c:	600a      	str	r2, [r1, #0]
    1c4e:	4a8f      	ldr	r2, [pc, #572]	; (1e8c <convert_code+0x2c8>)
    1c50:	2194      	movs	r1, #148	; 0x94
    1c52:	54d1      	strb	r1, [r2, r3]
				tail&=QUEUE_SIZE-1;
    1c54:	4b8c      	ldr	r3, [pc, #560]	; (1e88 <convert_code+0x2c4>)
    1c56:	681b      	ldr	r3, [r3, #0]
    1c58:	f003 031f 	and.w	r3, r3, #31
    1c5c:	4a8a      	ldr	r2, [pc, #552]	; (1e88 <convert_code+0x2c4>)
    1c5e:	6013      	str	r3, [r2, #0]
			}
			break;
    1c60:	e123      	b.n	1eaa <convert_code+0x2e6>
    1c62:	e122      	b.n	1eaa <convert_code+0x2e6>
		case LSHIFT:
			if (flags&RELEASE){
    1c64:	4b87      	ldr	r3, [pc, #540]	; (1e84 <convert_code+0x2c0>)
    1c66:	681b      	ldr	r3, [r3, #0]
    1c68:	f003 0302 	and.w	r3, r3, #2
    1c6c:	2b00      	cmp	r3, #0
    1c6e:	d006      	beq.n	1c7e <convert_code+0xba>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    1c70:	4b84      	ldr	r3, [pc, #528]	; (1e84 <convert_code+0x2c0>)
    1c72:	681b      	ldr	r3, [r3, #0]
    1c74:	f023 0307 	bic.w	r3, r3, #7
    1c78:	4a82      	ldr	r2, [pc, #520]	; (1e84 <convert_code+0x2c0>)
    1c7a:	6013      	str	r3, [r2, #0]
    1c7c:	e013      	b.n	1ca6 <convert_code+0xe2>
			}else{
				if (flags&XTD_CODE){
    1c7e:	4b81      	ldr	r3, [pc, #516]	; (1e84 <convert_code+0x2c0>)
    1c80:	681b      	ldr	r3, [r3, #0]
    1c82:	f003 0301 	and.w	r3, r3, #1
    1c86:	2b00      	cmp	r3, #0
    1c88:	d006      	beq.n	1c98 <convert_code+0xd4>
					flags|=PRNSCR;
    1c8a:	4b7e      	ldr	r3, [pc, #504]	; (1e84 <convert_code+0x2c0>)
    1c8c:	681b      	ldr	r3, [r3, #0]
    1c8e:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1c92:	4a7c      	ldr	r2, [pc, #496]	; (1e84 <convert_code+0x2c0>)
    1c94:	6013      	str	r3, [r2, #0]
    1c96:	e006      	b.n	1ca6 <convert_code+0xe2>
				}else{
					flags|=LEFT_SHIFT;
    1c98:	4b7a      	ldr	r3, [pc, #488]	; (1e84 <convert_code+0x2c0>)
    1c9a:	681b      	ldr	r3, [r3, #0]
    1c9c:	f043 0304 	orr.w	r3, r3, #4
    1ca0:	4a78      	ldr	r2, [pc, #480]	; (1e84 <convert_code+0x2c0>)
    1ca2:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1ca4:	e101      	b.n	1eaa <convert_code+0x2e6>
    1ca6:	e100      	b.n	1eaa <convert_code+0x2e6>
		case KPMUL:
			if (flags&RELEASE){
    1ca8:	4b76      	ldr	r3, [pc, #472]	; (1e84 <convert_code+0x2c0>)
    1caa:	681b      	ldr	r3, [r3, #0]
    1cac:	f003 0302 	and.w	r3, r3, #2
    1cb0:	2b00      	cmp	r3, #0
    1cb2:	d006      	beq.n	1cc2 <convert_code+0xfe>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    1cb4:	4b73      	ldr	r3, [pc, #460]	; (1e84 <convert_code+0x2c0>)
    1cb6:	681b      	ldr	r3, [r3, #0]
    1cb8:	f023 0303 	bic.w	r3, r3, #3
    1cbc:	4a71      	ldr	r2, [pc, #452]	; (1e84 <convert_code+0x2c0>)
    1cbe:	6013      	str	r3, [r2, #0]
    1cc0:	e02b      	b.n	1d1a <convert_code+0x156>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    1cc2:	4b70      	ldr	r3, [pc, #448]	; (1e84 <convert_code+0x2c0>)
    1cc4:	681b      	ldr	r3, [r3, #0]
    1cc6:	f003 0301 	and.w	r3, r3, #1
    1cca:	2b00      	cmp	r3, #0
    1ccc:	d016      	beq.n	1cfc <convert_code+0x138>
					flags&=~(XTD_CODE|PRNSCR);
    1cce:	4b6d      	ldr	r3, [pc, #436]	; (1e84 <convert_code+0x2c0>)
    1cd0:	681b      	ldr	r3, [r3, #0]
    1cd2:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    1cd6:	f023 0301 	bic.w	r3, r3, #1
    1cda:	4a6a      	ldr	r2, [pc, #424]	; (1e84 <convert_code+0x2c0>)
    1cdc:	6013      	str	r3, [r2, #0]
					queue[tail++]=PRN;
    1cde:	4b6a      	ldr	r3, [pc, #424]	; (1e88 <convert_code+0x2c4>)
    1ce0:	681b      	ldr	r3, [r3, #0]
    1ce2:	1c5a      	adds	r2, r3, #1
    1ce4:	4968      	ldr	r1, [pc, #416]	; (1e88 <convert_code+0x2c4>)
    1ce6:	600a      	str	r2, [r1, #0]
    1ce8:	4a68      	ldr	r2, [pc, #416]	; (1e8c <convert_code+0x2c8>)
    1cea:	2192      	movs	r1, #146	; 0x92
    1cec:	54d1      	strb	r1, [r2, r3]
					tail&=QUEUE_SIZE-1;
    1cee:	4b66      	ldr	r3, [pc, #408]	; (1e88 <convert_code+0x2c4>)
    1cf0:	681b      	ldr	r3, [r3, #0]
    1cf2:	f003 031f 	and.w	r3, r3, #31
    1cf6:	4a64      	ldr	r2, [pc, #400]	; (1e88 <convert_code+0x2c4>)
    1cf8:	6013      	str	r3, [r2, #0]
    1cfa:	e00e      	b.n	1d1a <convert_code+0x156>
				}else{
					queue[tail++]='*';
    1cfc:	4b62      	ldr	r3, [pc, #392]	; (1e88 <convert_code+0x2c4>)
    1cfe:	681b      	ldr	r3, [r3, #0]
    1d00:	1c5a      	adds	r2, r3, #1
    1d02:	4961      	ldr	r1, [pc, #388]	; (1e88 <convert_code+0x2c4>)
    1d04:	600a      	str	r2, [r1, #0]
    1d06:	4a61      	ldr	r2, [pc, #388]	; (1e8c <convert_code+0x2c8>)
    1d08:	212a      	movs	r1, #42	; 0x2a
    1d0a:	54d1      	strb	r1, [r2, r3]
					tail&=QUEUE_SIZE-1;
    1d0c:	4b5e      	ldr	r3, [pc, #376]	; (1e88 <convert_code+0x2c4>)
    1d0e:	681b      	ldr	r3, [r3, #0]
    1d10:	f003 031f 	and.w	r3, r3, #31
    1d14:	4a5c      	ldr	r2, [pc, #368]	; (1e88 <convert_code+0x2c4>)
    1d16:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1d18:	e0c7      	b.n	1eaa <convert_code+0x2e6>
    1d1a:	e0c6      	b.n	1eaa <convert_code+0x2e6>
		case RSHIFT:
			if (flags&RELEASE){
    1d1c:	4b59      	ldr	r3, [pc, #356]	; (1e84 <convert_code+0x2c0>)
    1d1e:	681b      	ldr	r3, [r3, #0]
    1d20:	f003 0302 	and.w	r3, r3, #2
    1d24:	2b00      	cmp	r3, #0
    1d26:	d006      	beq.n	1d36 <convert_code+0x172>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    1d28:	4b56      	ldr	r3, [pc, #344]	; (1e84 <convert_code+0x2c0>)
    1d2a:	681b      	ldr	r3, [r3, #0]
    1d2c:	f023 030b 	bic.w	r3, r3, #11
    1d30:	4a54      	ldr	r2, [pc, #336]	; (1e84 <convert_code+0x2c0>)
    1d32:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    1d34:	e0b9      	b.n	1eaa <convert_code+0x2e6>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    1d36:	4b53      	ldr	r3, [pc, #332]	; (1e84 <convert_code+0x2c0>)
    1d38:	681b      	ldr	r3, [r3, #0]
    1d3a:	f043 0308 	orr.w	r3, r3, #8
    1d3e:	4a51      	ldr	r2, [pc, #324]	; (1e84 <convert_code+0x2c0>)
    1d40:	6013      	str	r3, [r2, #0]
			}
			break;
    1d42:	e0b2      	b.n	1eaa <convert_code+0x2e6>
		case LCTRL:
			if (flags&RELEASE){
    1d44:	4b4f      	ldr	r3, [pc, #316]	; (1e84 <convert_code+0x2c0>)
    1d46:	681b      	ldr	r3, [r3, #0]
    1d48:	f003 0302 	and.w	r3, r3, #2
    1d4c:	2b00      	cmp	r3, #0
    1d4e:	d006      	beq.n	1d5e <convert_code+0x19a>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    1d50:	4b4c      	ldr	r3, [pc, #304]	; (1e84 <convert_code+0x2c0>)
    1d52:	681b      	ldr	r3, [r3, #0]
    1d54:	f023 0313 	bic.w	r3, r3, #19
    1d58:	4a4a      	ldr	r2, [pc, #296]	; (1e84 <convert_code+0x2c0>)
    1d5a:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_CTRL;
			}
			break;
    1d5c:	e0a5      	b.n	1eaa <convert_code+0x2e6>
			break;
		case LCTRL:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
			}else{
				flags|=LEFT_CTRL;
    1d5e:	4b49      	ldr	r3, [pc, #292]	; (1e84 <convert_code+0x2c0>)
    1d60:	681b      	ldr	r3, [r3, #0]
    1d62:	f043 0310 	orr.w	r3, r3, #16
    1d66:	4a47      	ldr	r2, [pc, #284]	; (1e84 <convert_code+0x2c0>)
    1d68:	6013      	str	r3, [r2, #0]
			}
			break;
    1d6a:	e09e      	b.n	1eaa <convert_code+0x2e6>
		case LALT:
			if (flags&RELEASE){
    1d6c:	4b45      	ldr	r3, [pc, #276]	; (1e84 <convert_code+0x2c0>)
    1d6e:	681b      	ldr	r3, [r3, #0]
    1d70:	f003 0302 	and.w	r3, r3, #2
    1d74:	2b00      	cmp	r3, #0
    1d76:	d006      	beq.n	1d86 <convert_code+0x1c2>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    1d78:	4b42      	ldr	r3, [pc, #264]	; (1e84 <convert_code+0x2c0>)
    1d7a:	681b      	ldr	r3, [r3, #0]
    1d7c:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    1d80:	4a40      	ldr	r2, [pc, #256]	; (1e84 <convert_code+0x2c0>)
    1d82:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    1d84:	e091      	b.n	1eaa <convert_code+0x2e6>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    1d86:	4b3f      	ldr	r3, [pc, #252]	; (1e84 <convert_code+0x2c0>)
    1d88:	681b      	ldr	r3, [r3, #0]
    1d8a:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1d8e:	4a3d      	ldr	r2, [pc, #244]	; (1e84 <convert_code+0x2c0>)
    1d90:	6013      	str	r3, [r2, #0]
			}
			break;
    1d92:	e08a      	b.n	1eaa <convert_code+0x2e6>
		case CAPS_LOCK:
			if (flags&RELEASE){
    1d94:	4b3b      	ldr	r3, [pc, #236]	; (1e84 <convert_code+0x2c0>)
    1d96:	681b      	ldr	r3, [r3, #0]
    1d98:	f003 0302 	and.w	r3, r3, #2
    1d9c:	2b00      	cmp	r3, #0
    1d9e:	d006      	beq.n	1dae <convert_code+0x1ea>
				flags&=~(RELEASE|XTD_CODE);
    1da0:	4b38      	ldr	r3, [pc, #224]	; (1e84 <convert_code+0x2c0>)
    1da2:	681b      	ldr	r3, [r3, #0]
    1da4:	f023 0303 	bic.w	r3, r3, #3
    1da8:	4a36      	ldr	r2, [pc, #216]	; (1e84 <convert_code+0x2c0>)
    1daa:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    1dac:	e07d      	b.n	1eaa <convert_code+0x2e6>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    1dae:	4b35      	ldr	r3, [pc, #212]	; (1e84 <convert_code+0x2c0>)
    1db0:	681b      	ldr	r3, [r3, #0]
    1db2:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    1db6:	4a33      	ldr	r2, [pc, #204]	; (1e84 <convert_code+0x2c0>)
    1db8:	6013      	str	r3, [r2, #0]
			}
			break;
    1dba:	e076      	b.n	1eaa <convert_code+0x2e6>
		default:
			if (!(flags&RELEASE)){
    1dbc:	4b31      	ldr	r3, [pc, #196]	; (1e84 <convert_code+0x2c0>)
    1dbe:	681b      	ldr	r3, [r3, #0]
    1dc0:	f003 0302 	and.w	r3, r3, #2
    1dc4:	2b00      	cmp	r3, #0
    1dc6:	d169      	bne.n	1e9c <convert_code+0x2d8>
					if (flags&XTD_CODE){
    1dc8:	4b2e      	ldr	r3, [pc, #184]	; (1e84 <convert_code+0x2c0>)
    1dca:	681b      	ldr	r3, [r3, #0]
    1dcc:	f003 0301 	and.w	r3, r3, #1
    1dd0:	2b00      	cmp	r3, #0
    1dd2:	d00d      	beq.n	1df0 <convert_code+0x22c>
						c=search_table(mcsaite_xkey,code);
    1dd4:	79fb      	ldrb	r3, [r7, #7]
    1dd6:	482e      	ldr	r0, [pc, #184]	; (1e90 <convert_code+0x2cc>)
    1dd8:	4619      	mov	r1, r3
    1dda:	f7ff fed7 	bl	1b8c <search_table>
    1dde:	4603      	mov	r3, r0
    1de0:	75fb      	strb	r3, [r7, #23]
						flags&=~XTD_CODE;
    1de2:	4b28      	ldr	r3, [pc, #160]	; (1e84 <convert_code+0x2c0>)
    1de4:	681b      	ldr	r3, [r3, #0]
    1de6:	f023 0301 	bic.w	r3, r3, #1
    1dea:	4a26      	ldr	r2, [pc, #152]	; (1e84 <convert_code+0x2c0>)
    1dec:	6013      	str	r3, [r2, #0]
    1dee:	e006      	b.n	1dfe <convert_code+0x23a>
					}else{
						c=search_table(mcsaite_key,code);
    1df0:	79fb      	ldrb	r3, [r7, #7]
    1df2:	4828      	ldr	r0, [pc, #160]	; (1e94 <convert_code+0x2d0>)
    1df4:	4619      	mov	r1, r3
    1df6:	f7ff fec9 	bl	1b8c <search_table>
    1dfa:	4603      	mov	r3, r0
    1dfc:	75fb      	strb	r3, [r7, #23]
					}
					shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    1dfe:	4b21      	ldr	r3, [pc, #132]	; (1e84 <convert_code+0x2c0>)
    1e00:	681b      	ldr	r3, [r3, #0]
    1e02:	f003 030c 	and.w	r3, r3, #12
    1e06:	613b      	str	r3, [r7, #16]
					if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    1e08:	7dfb      	ldrb	r3, [r7, #23]
    1e0a:	2b60      	cmp	r3, #96	; 0x60
    1e0c:	d918      	bls.n	1e40 <convert_code+0x27c>
    1e0e:	7dfb      	ldrb	r3, [r7, #23]
    1e10:	2b7a      	cmp	r3, #122	; 0x7a
    1e12:	d815      	bhi.n	1e40 <convert_code+0x27c>
    1e14:	693b      	ldr	r3, [r7, #16]
    1e16:	2b00      	cmp	r3, #0
    1e18:	d005      	beq.n	1e26 <convert_code+0x262>
    1e1a:	4b1a      	ldr	r3, [pc, #104]	; (1e84 <convert_code+0x2c0>)
    1e1c:	681b      	ldr	r3, [r3, #0]
    1e1e:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1e22:	2b00      	cmp	r3, #0
    1e24:	d008      	beq.n	1e38 <convert_code+0x274>
    1e26:	693b      	ldr	r3, [r7, #16]
    1e28:	2b00      	cmp	r3, #0
    1e2a:	d109      	bne.n	1e40 <convert_code+0x27c>
    1e2c:	4b15      	ldr	r3, [pc, #84]	; (1e84 <convert_code+0x2c0>)
    1e2e:	681b      	ldr	r3, [r3, #0]
    1e30:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1e34:	2b00      	cmp	r3, #0
    1e36:	d003      	beq.n	1e40 <convert_code+0x27c>
						c-=32;
    1e38:	7dfb      	ldrb	r3, [r7, #23]
    1e3a:	3b20      	subs	r3, #32
    1e3c:	75fb      	strb	r3, [r7, #23]
    1e3e:	e00e      	b.n	1e5e <convert_code+0x29a>
					}else if (shift && (s=search_table(mcsaite_shey,c))){
    1e40:	693b      	ldr	r3, [r7, #16]
    1e42:	2b00      	cmp	r3, #0
    1e44:	d00b      	beq.n	1e5e <convert_code+0x29a>
    1e46:	7dfb      	ldrb	r3, [r7, #23]
    1e48:	4813      	ldr	r0, [pc, #76]	; (1e98 <convert_code+0x2d4>)
    1e4a:	4619      	mov	r1, r3
    1e4c:	f7ff fe9e 	bl	1b8c <search_table>
    1e50:	4603      	mov	r3, r0
    1e52:	73fb      	strb	r3, [r7, #15]
    1e54:	7bfb      	ldrb	r3, [r7, #15]
    1e56:	2b00      	cmp	r3, #0
    1e58:	d001      	beq.n	1e5e <convert_code+0x29a>
						c=s;
    1e5a:	7bfb      	ldrb	r3, [r7, #15]
    1e5c:	75fb      	strb	r3, [r7, #23]
					}
					if (c){
    1e5e:	7dfb      	ldrb	r3, [r7, #23]
    1e60:	2b00      	cmp	r3, #0
    1e62:	d021      	beq.n	1ea8 <convert_code+0x2e4>
						queue[tail++]=c;
    1e64:	4b08      	ldr	r3, [pc, #32]	; (1e88 <convert_code+0x2c4>)
    1e66:	681b      	ldr	r3, [r3, #0]
    1e68:	1c5a      	adds	r2, r3, #1
    1e6a:	4907      	ldr	r1, [pc, #28]	; (1e88 <convert_code+0x2c4>)
    1e6c:	600a      	str	r2, [r1, #0]
    1e6e:	4907      	ldr	r1, [pc, #28]	; (1e8c <convert_code+0x2c8>)
    1e70:	7dfa      	ldrb	r2, [r7, #23]
    1e72:	54ca      	strb	r2, [r1, r3]
						tail&=QUEUE_SIZE-1;
    1e74:	4b04      	ldr	r3, [pc, #16]	; (1e88 <convert_code+0x2c4>)
    1e76:	681b      	ldr	r3, [r3, #0]
    1e78:	f003 031f 	and.w	r3, r3, #31
    1e7c:	4a02      	ldr	r2, [pc, #8]	; (1e88 <convert_code+0x2c4>)
    1e7e:	6013      	str	r3, [r2, #0]
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    1e80:	e013      	b.n	1eaa <convert_code+0x2e6>
    1e82:	bf00      	nop
    1e84:	20000108 	.word	0x20000108
    1e88:	20000100 	.word	0x20000100
    1e8c:	200000dc 	.word	0x200000dc
    1e90:	000030e8 	.word	0x000030e8
    1e94:	00003030 	.word	0x00003030
    1e98:	000030bc 	.word	0x000030bc
					if (c){
						queue[tail++]=c;
						tail&=QUEUE_SIZE-1;
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    1e9c:	4b04      	ldr	r3, [pc, #16]	; (1eb0 <convert_code+0x2ec>)
    1e9e:	681b      	ldr	r3, [r3, #0]
    1ea0:	f023 0303 	bic.w	r3, r3, #3
    1ea4:	4a02      	ldr	r2, [pc, #8]	; (1eb0 <convert_code+0x2ec>)
    1ea6:	6013      	str	r3, [r2, #0]
			}
			break;
    1ea8:	bf00      	nop
		}//switch
}// convert_code()
    1eaa:	3718      	adds	r7, #24
    1eac:	46bd      	mov	sp, r7
    1eae:	bd80      	pop	{r7, pc}
    1eb0:	20000108 	.word	0x20000108

00001eb4 <EXTI9_5_handler>:
#define PS2_QUEUE_SIZE (16)
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];

// signal clock du clavier PS/2
__attribute__((optimize("-O0"))) void KBD_CLK_handler(){
    1eb4:	b480      	push	{r7}
    1eb6:	b083      	sub	sp, #12
    1eb8:	af00      	add	r7, sp, #0
	volatile  static unsigned char  in_byte=0,bit_cnt=0;
    volatile unsigned char parity; 

#define data_bit  (KBD_PORT->IDR & KBD_DAT_PIN)
    switch (bit_cnt){
    1eba:	4b51      	ldr	r3, [pc, #324]	; (2000 <EXTI9_5_handler+0x14c>)
    1ebc:	781b      	ldrb	r3, [r3, #0]
    1ebe:	b2db      	uxtb	r3, r3
    1ec0:	2b09      	cmp	r3, #9
    1ec2:	d01f      	beq.n	1f04 <EXTI9_5_handler+0x50>
    1ec4:	2b0a      	cmp	r3, #10
    1ec6:	d031      	beq.n	1f2c <EXTI9_5_handler+0x78>
    1ec8:	2b00      	cmp	r3, #0
    1eca:	d16c      	bne.n	1fa6 <EXTI9_5_handler+0xf2>
	case 0:   // start bit
		ps2_flags&=~(F_ERROR|F_RCVD);
    1ecc:	4b4d      	ldr	r3, [pc, #308]	; (2004 <EXTI9_5_handler+0x150>)
    1ece:	781b      	ldrb	r3, [r3, #0]
    1ed0:	b2db      	uxtb	r3, r3
    1ed2:	f023 030b 	bic.w	r3, r3, #11
    1ed6:	b2da      	uxtb	r2, r3
    1ed8:	4b4a      	ldr	r3, [pc, #296]	; (2004 <EXTI9_5_handler+0x150>)
    1eda:	701a      	strb	r2, [r3, #0]
		if (!data_bit){
    1edc:	4b4a      	ldr	r3, [pc, #296]	; (2008 <EXTI9_5_handler+0x154>)
    1ede:	689b      	ldr	r3, [r3, #8]
    1ee0:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1ee4:	2b00      	cmp	r3, #0
    1ee6:	d10c      	bne.n	1f02 <EXTI9_5_handler+0x4e>
			in_byte=0;
    1ee8:	4b48      	ldr	r3, [pc, #288]	; (200c <EXTI9_5_handler+0x158>)
    1eea:	2200      	movs	r2, #0
    1eec:	701a      	strb	r2, [r3, #0]
            parity=0;
    1eee:	2300      	movs	r3, #0
    1ef0:	71fb      	strb	r3, [r7, #7]
            bit_cnt++;
    1ef2:	4b43      	ldr	r3, [pc, #268]	; (2000 <EXTI9_5_handler+0x14c>)
    1ef4:	781b      	ldrb	r3, [r3, #0]
    1ef6:	b2db      	uxtb	r3, r3
    1ef8:	3301      	adds	r3, #1
    1efa:	b2da      	uxtb	r2, r3
    1efc:	4b40      	ldr	r3, [pc, #256]	; (2000 <EXTI9_5_handler+0x14c>)
    1efe:	701a      	strb	r2, [r3, #0]
        }
		break;
    1f00:	e073      	b.n	1fea <EXTI9_5_handler+0x136>
    1f02:	e072      	b.n	1fea <EXTI9_5_handler+0x136>
	case 9:   // paritée
		if (data_bit) parity++;
    1f04:	4b40      	ldr	r3, [pc, #256]	; (2008 <EXTI9_5_handler+0x154>)
    1f06:	689b      	ldr	r3, [r3, #8]
    1f08:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1f0c:	2b00      	cmp	r3, #0
    1f0e:	d004      	beq.n	1f1a <EXTI9_5_handler+0x66>
    1f10:	79fb      	ldrb	r3, [r7, #7]
    1f12:	b2db      	uxtb	r3, r3
    1f14:	3301      	adds	r3, #1
    1f16:	b2db      	uxtb	r3, r3
    1f18:	71fb      	strb	r3, [r7, #7]
		if (!(parity & 1)){
    1f1a:	79fb      	ldrb	r3, [r7, #7]
			//ps2_flags |= F_ERR_PARITY;
		}
		bit_cnt++;
    1f1c:	4b38      	ldr	r3, [pc, #224]	; (2000 <EXTI9_5_handler+0x14c>)
    1f1e:	781b      	ldrb	r3, [r3, #0]
    1f20:	b2db      	uxtb	r3, r3
    1f22:	3301      	adds	r3, #1
    1f24:	b2da      	uxtb	r2, r3
    1f26:	4b36      	ldr	r3, [pc, #216]	; (2000 <EXTI9_5_handler+0x14c>)
    1f28:	701a      	strb	r2, [r3, #0]
		break;
    1f2a:	e05e      	b.n	1fea <EXTI9_5_handler+0x136>
	case 10:  // stop bit
	    if (!data_bit){
    1f2c:	4b36      	ldr	r3, [pc, #216]	; (2008 <EXTI9_5_handler+0x154>)
    1f2e:	689b      	ldr	r3, [r3, #8]
    1f30:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1f34:	2b00      	cmp	r3, #0
    1f36:	d108      	bne.n	1f4a <EXTI9_5_handler+0x96>
			ps2_flags|=F_ERR_FRAME;
    1f38:	4b32      	ldr	r3, [pc, #200]	; (2004 <EXTI9_5_handler+0x150>)
    1f3a:	781b      	ldrb	r3, [r3, #0]
    1f3c:	b2db      	uxtb	r3, r3
    1f3e:	f043 0308 	orr.w	r3, r3, #8
    1f42:	b2da      	uxtb	r2, r3
    1f44:	4b2f      	ldr	r3, [pc, #188]	; (2004 <EXTI9_5_handler+0x150>)
    1f46:	701a      	strb	r2, [r3, #0]
    1f48:	e029      	b.n	1f9e <EXTI9_5_handler+0xea>
		}else if (!(ps2_flags&F_ERROR)){
    1f4a:	4b2e      	ldr	r3, [pc, #184]	; (2004 <EXTI9_5_handler+0x150>)
    1f4c:	781b      	ldrb	r3, [r3, #0]
    1f4e:	b2db      	uxtb	r3, r3
    1f50:	f003 0309 	and.w	r3, r3, #9
    1f54:	2b00      	cmp	r3, #0
    1f56:	d122      	bne.n	1f9e <EXTI9_5_handler+0xea>
			if (in_byte==BAT_OK){
    1f58:	4b2c      	ldr	r3, [pc, #176]	; (200c <EXTI9_5_handler+0x158>)
    1f5a:	781b      	ldrb	r3, [r3, #0]
    1f5c:	b2db      	uxtb	r3, r3
    1f5e:	2baa      	cmp	r3, #170	; 0xaa
    1f60:	d108      	bne.n	1f74 <EXTI9_5_handler+0xc0>
				ps2_flags|=F_BATOK;
    1f62:	4b28      	ldr	r3, [pc, #160]	; (2004 <EXTI9_5_handler+0x150>)
    1f64:	781b      	ldrb	r3, [r3, #0]
    1f66:	b2db      	uxtb	r3, r3
    1f68:	f043 0304 	orr.w	r3, r3, #4
    1f6c:	b2da      	uxtb	r2, r3
    1f6e:	4b25      	ldr	r3, [pc, #148]	; (2004 <EXTI9_5_handler+0x150>)
    1f70:	701a      	strb	r2, [r3, #0]
    1f72:	e014      	b.n	1f9e <EXTI9_5_handler+0xea>
			}else{
				ps2_queue[ps2_tail++]=in_byte;
    1f74:	4b26      	ldr	r3, [pc, #152]	; (2010 <EXTI9_5_handler+0x15c>)
    1f76:	781b      	ldrb	r3, [r3, #0]
    1f78:	b2db      	uxtb	r3, r3
    1f7a:	1c5a      	adds	r2, r3, #1
    1f7c:	b2d1      	uxtb	r1, r2
    1f7e:	4a24      	ldr	r2, [pc, #144]	; (2010 <EXTI9_5_handler+0x15c>)
    1f80:	7011      	strb	r1, [r2, #0]
    1f82:	461a      	mov	r2, r3
    1f84:	4b21      	ldr	r3, [pc, #132]	; (200c <EXTI9_5_handler+0x158>)
    1f86:	781b      	ldrb	r3, [r3, #0]
    1f88:	b2d9      	uxtb	r1, r3
    1f8a:	4b22      	ldr	r3, [pc, #136]	; (2014 <EXTI9_5_handler+0x160>)
    1f8c:	5499      	strb	r1, [r3, r2]
				ps2_tail&=PS2_QUEUE_SIZE-1;
    1f8e:	4b20      	ldr	r3, [pc, #128]	; (2010 <EXTI9_5_handler+0x15c>)
    1f90:	781b      	ldrb	r3, [r3, #0]
    1f92:	b2db      	uxtb	r3, r3
    1f94:	f003 030f 	and.w	r3, r3, #15
    1f98:	b2da      	uxtb	r2, r3
    1f9a:	4b1d      	ldr	r3, [pc, #116]	; (2010 <EXTI9_5_handler+0x15c>)
    1f9c:	701a      	strb	r2, [r3, #0]
			}
	    }
	    bit_cnt=0;
    1f9e:	4b18      	ldr	r3, [pc, #96]	; (2000 <EXTI9_5_handler+0x14c>)
    1fa0:	2200      	movs	r2, #0
    1fa2:	701a      	strb	r2, [r3, #0]
		break;
    1fa4:	e021      	b.n	1fea <EXTI9_5_handler+0x136>
	default:
		in_byte >>=1;
    1fa6:	4b19      	ldr	r3, [pc, #100]	; (200c <EXTI9_5_handler+0x158>)
    1fa8:	781b      	ldrb	r3, [r3, #0]
    1faa:	b2db      	uxtb	r3, r3
    1fac:	085b      	lsrs	r3, r3, #1
    1fae:	b2da      	uxtb	r2, r3
    1fb0:	4b16      	ldr	r3, [pc, #88]	; (200c <EXTI9_5_handler+0x158>)
    1fb2:	701a      	strb	r2, [r3, #0]
		if(data_bit){
    1fb4:	4b14      	ldr	r3, [pc, #80]	; (2008 <EXTI9_5_handler+0x154>)
    1fb6:	689b      	ldr	r3, [r3, #8]
    1fb8:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1fbc:	2b00      	cmp	r3, #0
    1fbe:	d00c      	beq.n	1fda <EXTI9_5_handler+0x126>
			in_byte |=128;
    1fc0:	4b12      	ldr	r3, [pc, #72]	; (200c <EXTI9_5_handler+0x158>)
    1fc2:	781b      	ldrb	r3, [r3, #0]
    1fc4:	b2db      	uxtb	r3, r3
    1fc6:	f063 037f 	orn	r3, r3, #127	; 0x7f
    1fca:	b2da      	uxtb	r2, r3
    1fcc:	4b0f      	ldr	r3, [pc, #60]	; (200c <EXTI9_5_handler+0x158>)
    1fce:	701a      	strb	r2, [r3, #0]
			parity++;
    1fd0:	79fb      	ldrb	r3, [r7, #7]
    1fd2:	b2db      	uxtb	r3, r3
    1fd4:	3301      	adds	r3, #1
    1fd6:	b2db      	uxtb	r3, r3
    1fd8:	71fb      	strb	r3, [r7, #7]
		}
		bit_cnt++;
    1fda:	4b09      	ldr	r3, [pc, #36]	; (2000 <EXTI9_5_handler+0x14c>)
    1fdc:	781b      	ldrb	r3, [r3, #0]
    1fde:	b2db      	uxtb	r3, r3
    1fe0:	3301      	adds	r3, #1
    1fe2:	b2da      	uxtb	r2, r3
    1fe4:	4b06      	ldr	r3, [pc, #24]	; (2000 <EXTI9_5_handler+0x14c>)
    1fe6:	701a      	strb	r2, [r3, #0]
		break;
    1fe8:	bf00      	nop
	}
	EXTI->PR|=KBD_CLK_PIN;
    1fea:	4a0b      	ldr	r2, [pc, #44]	; (2018 <EXTI9_5_handler+0x164>)
    1fec:	4b0a      	ldr	r3, [pc, #40]	; (2018 <EXTI9_5_handler+0x164>)
    1fee:	695b      	ldr	r3, [r3, #20]
    1ff0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1ff4:	6153      	str	r3, [r2, #20]
}
    1ff6:	370c      	adds	r7, #12
    1ff8:	46bd      	mov	sp, r7
    1ffa:	f85d 7b04 	ldr.w	r7, [sp], #4
    1ffe:	4770      	bx	lr
    2000:	20000120 	.word	0x20000120
    2004:	20000104 	.word	0x20000104
    2008:	40010800 	.word	0x40010800
    200c:	20000121 	.word	0x20000121
    2010:	2000010d 	.word	0x2000010d
    2014:	20000110 	.word	0x20000110
    2018:	40010400 	.word	0x40010400

0000201c <TIM2_handler>:

void TIM2_handler(){
    201c:	b580      	push	{r7, lr}
    201e:	af00      	add	r7, sp, #0
	TMR2->SR&=~(BIT0);
    2020:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    2024:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    2028:	691b      	ldr	r3, [r3, #16]
    202a:	f023 0301 	bic.w	r3, r3, #1
    202e:	6113      	str	r3, [r2, #16]
	if (ps2_tail!=ps2_head){
    2030:	4b0f      	ldr	r3, [pc, #60]	; (2070 <TIM2_handler+0x54>)
    2032:	781b      	ldrb	r3, [r3, #0]
    2034:	b2da      	uxtb	r2, r3
    2036:	4b0f      	ldr	r3, [pc, #60]	; (2074 <TIM2_handler+0x58>)
    2038:	781b      	ldrb	r3, [r3, #0]
    203a:	b2db      	uxtb	r3, r3
    203c:	429a      	cmp	r2, r3
    203e:	d015      	beq.n	206c <TIM2_handler+0x50>
		convert_code(ps2_queue[ps2_head++]);
    2040:	4b0c      	ldr	r3, [pc, #48]	; (2074 <TIM2_handler+0x58>)
    2042:	781b      	ldrb	r3, [r3, #0]
    2044:	b2db      	uxtb	r3, r3
    2046:	1c5a      	adds	r2, r3, #1
    2048:	b2d1      	uxtb	r1, r2
    204a:	4a0a      	ldr	r2, [pc, #40]	; (2074 <TIM2_handler+0x58>)
    204c:	7011      	strb	r1, [r2, #0]
    204e:	461a      	mov	r2, r3
    2050:	4b09      	ldr	r3, [pc, #36]	; (2078 <TIM2_handler+0x5c>)
    2052:	5c9b      	ldrb	r3, [r3, r2]
    2054:	b2db      	uxtb	r3, r3
    2056:	4618      	mov	r0, r3
    2058:	f7ff fdb4 	bl	1bc4 <convert_code>
		ps2_head&=PS2_QUEUE_SIZE-1;
    205c:	4b05      	ldr	r3, [pc, #20]	; (2074 <TIM2_handler+0x58>)
    205e:	781b      	ldrb	r3, [r3, #0]
    2060:	b2db      	uxtb	r3, r3
    2062:	f003 030f 	and.w	r3, r3, #15
    2066:	b2da      	uxtb	r2, r3
    2068:	4b02      	ldr	r3, [pc, #8]	; (2074 <TIM2_handler+0x58>)
    206a:	701a      	strb	r2, [r3, #0]
	}
}
    206c:	bd80      	pop	{r7, pc}
    206e:	bf00      	nop
    2070:	2000010d 	.word	0x2000010d
    2074:	2000010c 	.word	0x2000010c
    2078:	20000110 	.word	0x20000110

0000207c <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    207c:	b480      	push	{r7}
    207e:	b083      	sub	sp, #12
    2080:	af00      	add	r7, sp, #0
    2082:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    2084:	687b      	ldr	r3, [r7, #4]
    2086:	2b3b      	cmp	r3, #59	; 0x3b
    2088:	d900      	bls.n	208c <enable_interrupt+0x10>
    208a:	e016      	b.n	20ba <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    208c:	687b      	ldr	r3, [r7, #4]
    208e:	095b      	lsrs	r3, r3, #5
    2090:	009b      	lsls	r3, r3, #2
    2092:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2096:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    209a:	687a      	ldr	r2, [r7, #4]
    209c:	0952      	lsrs	r2, r2, #5
    209e:	0092      	lsls	r2, r2, #2
    20a0:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    20a4:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    20a8:	6812      	ldr	r2, [r2, #0]
    20aa:	6879      	ldr	r1, [r7, #4]
    20ac:	f001 011f 	and.w	r1, r1, #31
    20b0:	2001      	movs	r0, #1
    20b2:	fa00 f101 	lsl.w	r1, r0, r1
    20b6:	430a      	orrs	r2, r1
    20b8:	601a      	str	r2, [r3, #0]
}
    20ba:	370c      	adds	r7, #12
    20bc:	46bd      	mov	sp, r7
    20be:	f85d 7b04 	ldr.w	r7, [sp], #4
    20c2:	4770      	bx	lr

000020c4 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    20c4:	b480      	push	{r7}
    20c6:	b083      	sub	sp, #12
    20c8:	af00      	add	r7, sp, #0
    20ca:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    20cc:	687b      	ldr	r3, [r7, #4]
    20ce:	2b3b      	cmp	r3, #59	; 0x3b
    20d0:	d900      	bls.n	20d4 <disable_interrupt+0x10>
    20d2:	e013      	b.n	20fc <disable_interrupt+0x38>
	ICER[irq>>5]&=~(1<<(irq&0x1f));
    20d4:	687b      	ldr	r3, [r7, #4]
    20d6:	095b      	lsrs	r3, r3, #5
    20d8:	009a      	lsls	r2, r3, #2
    20da:	4b0b      	ldr	r3, [pc, #44]	; (2108 <disable_interrupt+0x44>)
    20dc:	4413      	add	r3, r2
    20de:	687a      	ldr	r2, [r7, #4]
    20e0:	0952      	lsrs	r2, r2, #5
    20e2:	0091      	lsls	r1, r2, #2
    20e4:	4a08      	ldr	r2, [pc, #32]	; (2108 <disable_interrupt+0x44>)
    20e6:	440a      	add	r2, r1
    20e8:	6812      	ldr	r2, [r2, #0]
    20ea:	6879      	ldr	r1, [r7, #4]
    20ec:	f001 011f 	and.w	r1, r1, #31
    20f0:	2001      	movs	r0, #1
    20f2:	fa00 f101 	lsl.w	r1, r0, r1
    20f6:	43c9      	mvns	r1, r1
    20f8:	400a      	ands	r2, r1
    20fa:	601a      	str	r2, [r3, #0]
}
    20fc:	370c      	adds	r7, #12
    20fe:	46bd      	mov	sp, r7
    2100:	f85d 7b04 	ldr.w	r7, [sp], #4
    2104:	4770      	bx	lr
    2106:	bf00      	nop
    2108:	e000e180 	.word	0xe000e180

0000210c <set_int_priority>:



void set_int_priority(int32_t irq, unsigned priority){
    210c:	b480      	push	{r7}
    210e:	b083      	sub	sp, #12
    2110:	af00      	add	r7, sp, #0
    2112:	6078      	str	r0, [r7, #4]
    2114:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    2116:	687b      	ldr	r3, [r7, #4]
    2118:	2b00      	cmp	r3, #0
    211a:	db0d      	blt.n	2138 <set_int_priority+0x2c>
    211c:	687b      	ldr	r3, [r7, #4]
    211e:	2b3b      	cmp	r3, #59	; 0x3b
    2120:	dc0a      	bgt.n	2138 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    2122:	687b      	ldr	r3, [r7, #4]
    2124:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2128:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    212c:	683a      	ldr	r2, [r7, #0]
    212e:	b2d2      	uxtb	r2, r2
    2130:	0112      	lsls	r2, r2, #4
    2132:	b2d2      	uxtb	r2, r2
    2134:	701a      	strb	r2, [r3, #0]
    2136:	e012      	b.n	215e <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    2138:	687b      	ldr	r3, [r7, #4]
    213a:	2b00      	cmp	r3, #0
    213c:	da0f      	bge.n	215e <set_int_priority+0x52>
    213e:	687b      	ldr	r3, [r7, #4]
    2140:	f113 0f0f 	cmn.w	r3, #15
    2144:	db0b      	blt.n	215e <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    2146:	687a      	ldr	r2, [r7, #4]
    2148:	f06f 0303 	mvn.w	r3, #3
    214c:	1a9b      	subs	r3, r3, r2
    214e:	461a      	mov	r2, r3
    2150:	4b05      	ldr	r3, [pc, #20]	; (2168 <set_int_priority+0x5c>)
    2152:	4413      	add	r3, r2
    2154:	683a      	ldr	r2, [r7, #0]
    2156:	b2d2      	uxtb	r2, r2
    2158:	0112      	lsls	r2, r2, #4
    215a:	b2d2      	uxtb	r2, r2
    215c:	701a      	strb	r2, [r3, #0]
	}
}
    215e:	370c      	adds	r7, #12
    2160:	46bd      	mov	sp, r7
    2162:	f85d 7b04 	ldr.w	r7, [sp], #4
    2166:	4770      	bx	lr
    2168:	e000ed18 	.word	0xe000ed18

0000216c <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    216c:	b480      	push	{r7}
    216e:	b083      	sub	sp, #12
    2170:	af00      	add	r7, sp, #0
    2172:	6078      	str	r0, [r7, #4]
    2174:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    2176:	687b      	ldr	r3, [r7, #4]
    2178:	881b      	ldrh	r3, [r3, #0]
    217a:	b29b      	uxth	r3, r3
    217c:	f423 63e0 	bic.w	r3, r3, #1792	; 0x700
    2180:	b29a      	uxth	r2, r3
    2182:	687b      	ldr	r3, [r7, #4]
    2184:	801a      	strh	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    2186:	687b      	ldr	r3, [r7, #4]
    2188:	881b      	ldrh	r3, [r3, #0]
    218a:	b29a      	uxth	r2, r3
    218c:	683b      	ldr	r3, [r7, #0]
    218e:	b29b      	uxth	r3, r3
    2190:	00db      	lsls	r3, r3, #3
    2192:	b29b      	uxth	r3, r3
    2194:	4313      	orrs	r3, r2
    2196:	b29a      	uxth	r2, r3
    2198:	687b      	ldr	r3, [r7, #4]
    219a:	801a      	strh	r2, [r3, #0]
}
    219c:	370c      	adds	r7, #12
    219e:	46bd      	mov	sp, r7
    21a0:	f85d 7b04 	ldr.w	r7, [sp], #4
    21a4:	4770      	bx	lr
    21a6:	bf00      	nop

000021a8 <spi_init>:


void spi_init(spi_sfr_t* channel, unsigned baud){
    21a8:	b580      	push	{r7, lr}
    21aa:	b082      	sub	sp, #8
    21ac:	af00      	add	r7, sp, #0
    21ae:	6078      	str	r0, [r7, #4]
    21b0:	6039      	str	r1, [r7, #0]
	spi_baudrate(channel,baud);
    21b2:	6878      	ldr	r0, [r7, #4]
    21b4:	6839      	ldr	r1, [r7, #0]
    21b6:	f7ff ffd9 	bl	216c <spi_baudrate>
	channel->CR1=SPI_CR1_MSTR|SPI_CR1_SSM;
    21ba:	687b      	ldr	r3, [r7, #4]
    21bc:	f44f 7201 	mov.w	r2, #516	; 0x204
    21c0:	801a      	strh	r2, [r3, #0]
	//channel->CR2|=SPI_CR2_SSOE;
	if (channel==SPI1){
    21c2:	687b      	ldr	r3, [r7, #4]
    21c4:	4a17      	ldr	r2, [pc, #92]	; (2224 <spi_init+0x7c>)
    21c6:	4293      	cmp	r3, r2
    21c8:	d114      	bne.n	21f4 <spi_init+0x4c>
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(GPIOA,4,OUTPUT_PP_FAST);
    21ca:	2000      	movs	r0, #0
    21cc:	2104      	movs	r1, #4
    21ce:	2203      	movs	r2, #3
    21d0:	f7ff fc22 	bl	1a18 <config_pin>
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(GPIOA,5,OUTPUT_PP_FAST);
    21d4:	2000      	movs	r0, #0
    21d6:	2105      	movs	r1, #5
    21d8:	2203      	movs	r2, #3
    21da:	f7ff fc1d 	bl	1a18 <config_pin>
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(GPIOA,6,INPUT_FLOAT);
    21de:	2000      	movs	r0, #0
    21e0:	2106      	movs	r1, #6
    21e2:	2204      	movs	r2, #4
    21e4:	f7ff fc18 	bl	1a18 <config_pin>
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(GPIOA,7,OUTPUT_PP_FAST);
    21e8:	2000      	movs	r0, #0
    21ea:	2107      	movs	r1, #7
    21ec:	2203      	movs	r2, #3
    21ee:	f7ff fc13 	bl	1a18 <config_pin>
    21f2:	e013      	b.n	221c <spi_init+0x74>
	}else{
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(GPIOB,2,OUTPUT_PP_FAST);
    21f4:	2001      	movs	r0, #1
    21f6:	2102      	movs	r1, #2
    21f8:	2203      	movs	r2, #3
    21fa:	f7ff fc0d 	bl	1a18 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(GPIOB,13,OUTPUT_PP_FAST);
    21fe:	2001      	movs	r0, #1
    2200:	210d      	movs	r1, #13
    2202:	2203      	movs	r2, #3
    2204:	f7ff fc08 	bl	1a18 <config_pin>
		// PB14 MISO input (floating)
		config_pin(GPIOB,14,INPUT_FLOAT);
    2208:	2001      	movs	r0, #1
    220a:	210e      	movs	r1, #14
    220c:	2204      	movs	r2, #4
    220e:	f7ff fc03 	bl	1a18 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(GPIOB,15,OUTPUT_PP_FAST);
    2212:	2001      	movs	r0, #1
    2214:	210f      	movs	r1, #15
    2216:	2203      	movs	r2, #3
    2218:	f7ff fbfe 	bl	1a18 <config_pin>
	}
}
    221c:	3708      	adds	r7, #8
    221e:	46bd      	mov	sp, r7
    2220:	bd80      	pop	{r7, pc}
    2222:	bf00      	nop
    2224:	40013000 	.word	0x40013000

00002228 <spi_enable>:

void spi_enable(spi_sfr_t* channel, unsigned mode){
    2228:	b480      	push	{r7}
    222a:	b083      	sub	sp, #12
    222c:	af00      	add	r7, sp, #0
    222e:	6078      	str	r0, [r7, #4]
    2230:	6039      	str	r1, [r7, #0]
	switch (mode){
    2232:	683b      	ldr	r3, [r7, #0]
    2234:	2b01      	cmp	r3, #1
    2236:	d00d      	beq.n	2254 <spi_enable+0x2c>
    2238:	2b01      	cmp	r3, #1
    223a:	d302      	bcc.n	2242 <spi_enable+0x1a>
    223c:	2b02      	cmp	r3, #2
    223e:	d005      	beq.n	224c <spi_enable+0x24>
    2240:	e00d      	b.n	225e <spi_enable+0x36>
		case SPI_MODE_READ:
		channel->CR1=SPI_CR1_RXONLY|SPI_CR1_SPE;
    2242:	687b      	ldr	r3, [r7, #4]
    2244:	f44f 6288 	mov.w	r2, #1088	; 0x440
    2248:	801a      	strh	r2, [r3, #0]
		break;
    224a:	e008      	b.n	225e <spi_enable+0x36>
		case SPI_MODE_READ_WRITE:
		channel->CR1=SPI_CR1_SPE;
    224c:	687b      	ldr	r3, [r7, #4]
    224e:	2240      	movs	r2, #64	; 0x40
    2250:	801a      	strh	r2, [r3, #0]
		break;
    2252:	e004      	b.n	225e <spi_enable+0x36>
		case SPI_MODE_WRITE:
		channel->CR1=SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE|SPI_CR1_SPE;
    2254:	687b      	ldr	r3, [r7, #4]
    2256:	f24c 0240 	movw	r2, #49216	; 0xc040
    225a:	801a      	strh	r2, [r3, #0]
		break;
    225c:	bf00      	nop
	}
}
    225e:	370c      	adds	r7, #12
    2260:	46bd      	mov	sp, r7
    2262:	f85d 7b04 	ldr.w	r7, [sp], #4
    2266:	4770      	bx	lr

00002268 <spi_disable>:

void spi_disable(spi_sfr_t* channel){
    2268:	b480      	push	{r7}
    226a:	b083      	sub	sp, #12
    226c:	af00      	add	r7, sp, #0
    226e:	6078      	str	r0, [r7, #4]
	channel->CR1&=~SPI_CR1_SPE;
    2270:	687b      	ldr	r3, [r7, #4]
    2272:	881b      	ldrh	r3, [r3, #0]
    2274:	b29b      	uxth	r3, r3
    2276:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    227a:	b29a      	uxth	r2, r3
    227c:	687b      	ldr	r3, [r7, #4]
    227e:	801a      	strh	r2, [r3, #0]
}
    2280:	370c      	adds	r7, #12
    2282:	46bd      	mov	sp, r7
    2284:	f85d 7b04 	ldr.w	r7, [sp], #4
    2288:	4770      	bx	lr
    228a:	bf00      	nop

0000228c <spi_write>:

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
    228c:	b580      	push	{r7, lr}
    228e:	b082      	sub	sp, #8
    2290:	af00      	add	r7, sp, #0
    2292:	6078      	str	r0, [r7, #4]
    2294:	460b      	mov	r3, r1
    2296:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
    2298:	6878      	ldr	r0, [r7, #4]
    229a:	2101      	movs	r1, #1
    229c:	f7ff ffc4 	bl	2228 <spi_enable>
	channel->DR=b;
    22a0:	78fb      	ldrb	r3, [r7, #3]
    22a2:	b29a      	uxth	r2, r3
    22a4:	687b      	ldr	r3, [r7, #4]
    22a6:	819a      	strh	r2, [r3, #12]
	spi_disable(channel);
    22a8:	6878      	ldr	r0, [r7, #4]
    22aa:	f7ff ffdd 	bl	2268 <spi_disable>
}
    22ae:	3708      	adds	r7, #8
    22b0:	46bd      	mov	sp, r7
    22b2:	bd80      	pop	{r7, pc}

000022b4 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    22b4:	b580      	push	{r7, lr}
    22b6:	b084      	sub	sp, #16
    22b8:	af00      	add	r7, sp, #0
    22ba:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
    22bc:	6878      	ldr	r0, [r7, #4]
    22be:	2100      	movs	r1, #0
    22c0:	f7ff ffb2 	bl	2228 <spi_enable>
	channel->DR=255;
    22c4:	687b      	ldr	r3, [r7, #4]
    22c6:	22ff      	movs	r2, #255	; 0xff
    22c8:	819a      	strh	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    22ca:	bf00      	nop
    22cc:	687b      	ldr	r3, [r7, #4]
    22ce:	891b      	ldrh	r3, [r3, #8]
    22d0:	b29b      	uxth	r3, r3
    22d2:	f003 0301 	and.w	r3, r3, #1
    22d6:	2b00      	cmp	r3, #0
    22d8:	d0f8      	beq.n	22cc <spi_read+0x18>
	rx=(uint8_t)channel->DR;
    22da:	687b      	ldr	r3, [r7, #4]
    22dc:	899b      	ldrh	r3, [r3, #12]
    22de:	b29b      	uxth	r3, r3
    22e0:	73fb      	strb	r3, [r7, #15]
	spi_disable(channel);
    22e2:	6878      	ldr	r0, [r7, #4]
    22e4:	f7ff ffc0 	bl	2268 <spi_disable>
	return rx;
    22e8:	7bfb      	ldrb	r3, [r7, #15]
}
    22ea:	4618      	mov	r0, r3
    22ec:	3710      	adds	r7, #16
    22ee:	46bd      	mov	sp, r7
    22f0:	bd80      	pop	{r7, pc}
    22f2:	bf00      	nop

000022f4 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    22f4:	b580      	push	{r7, lr}
    22f6:	b084      	sub	sp, #16
    22f8:	af00      	add	r7, sp, #0
    22fa:	60f8      	str	r0, [r7, #12]
    22fc:	60b9      	str	r1, [r7, #8]
    22fe:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_WRITE);
    2300:	68f8      	ldr	r0, [r7, #12]
    2302:	2101      	movs	r1, #1
    2304:	f7ff ff90 	bl	2228 <spi_enable>
	while (count){
    2308:	e011      	b.n	232e <spi_block_write+0x3a>
		channel->DR=*buffer++;
    230a:	68bb      	ldr	r3, [r7, #8]
    230c:	1c5a      	adds	r2, r3, #1
    230e:	60ba      	str	r2, [r7, #8]
    2310:	781b      	ldrb	r3, [r3, #0]
    2312:	b29a      	uxth	r2, r3
    2314:	68fb      	ldr	r3, [r7, #12]
    2316:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    2318:	bf00      	nop
    231a:	68fb      	ldr	r3, [r7, #12]
    231c:	891b      	ldrh	r3, [r3, #8]
    231e:	b29b      	uxth	r3, r3
    2320:	f003 0302 	and.w	r3, r3, #2
    2324:	2b00      	cmp	r3, #0
    2326:	d0f8      	beq.n	231a <spi_block_write+0x26>
		count--;
    2328:	687b      	ldr	r3, [r7, #4]
    232a:	3b01      	subs	r3, #1
    232c:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_enable(channel,SPI_MODE_WRITE);
	while (count){
    232e:	687b      	ldr	r3, [r7, #4]
    2330:	2b00      	cmp	r3, #0
    2332:	d1ea      	bne.n	230a <spi_block_write+0x16>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	spi_disable(channel);
    2334:	68f8      	ldr	r0, [r7, #12]
    2336:	f7ff ff97 	bl	2268 <spi_disable>
}
    233a:	3710      	adds	r7, #16
    233c:	46bd      	mov	sp, r7
    233e:	bd80      	pop	{r7, pc}

00002340 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    2340:	b580      	push	{r7, lr}
    2342:	b084      	sub	sp, #16
    2344:	af00      	add	r7, sp, #0
    2346:	60f8      	str	r0, [r7, #12]
    2348:	60b9      	str	r1, [r7, #8]
    234a:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_READ);
    234c:	68f8      	ldr	r0, [r7, #12]
    234e:	2100      	movs	r1, #0
    2350:	f7ff ff6a 	bl	2228 <spi_enable>
	while (count){
    2354:	e015      	b.n	2382 <spi_block_read+0x42>
		channel->DR=0;
    2356:	68fb      	ldr	r3, [r7, #12]
    2358:	2200      	movs	r2, #0
    235a:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    235c:	bf00      	nop
    235e:	68fb      	ldr	r3, [r7, #12]
    2360:	891b      	ldrh	r3, [r3, #8]
    2362:	b29b      	uxth	r3, r3
    2364:	f003 0301 	and.w	r3, r3, #1
    2368:	2b00      	cmp	r3, #0
    236a:	d0f8      	beq.n	235e <spi_block_read+0x1e>
		*buffer++=(uint8_t)channel->DR;
    236c:	68bb      	ldr	r3, [r7, #8]
    236e:	1c5a      	adds	r2, r3, #1
    2370:	60ba      	str	r2, [r7, #8]
    2372:	68fa      	ldr	r2, [r7, #12]
    2374:	8992      	ldrh	r2, [r2, #12]
    2376:	b292      	uxth	r2, r2
    2378:	b2d2      	uxtb	r2, r2
    237a:	701a      	strb	r2, [r3, #0]
		count--;
    237c:	687b      	ldr	r3, [r7, #4]
    237e:	3b01      	subs	r3, #1
    2380:	607b      	str	r3, [r7, #4]
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_enable(channel,SPI_MODE_READ);
	while (count){
    2382:	687b      	ldr	r3, [r7, #4]
    2384:	2b00      	cmp	r3, #0
    2386:	d1e6      	bne.n	2356 <spi_block_read+0x16>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
	spi_disable(channel);
    2388:	68f8      	ldr	r0, [r7, #12]
    238a:	f7ff ff6d 	bl	2268 <spi_disable>
}
    238e:	3710      	adds	r7, #16
    2390:	46bd      	mov	sp, r7
    2392:	bd80      	pop	{r7, pc}

00002394 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    2394:	4b01      	ldr	r3, [pc, #4]	; (239c <reset_mcu+0x8>)
    2396:	4a02      	ldr	r2, [pc, #8]	; (23a0 <reset_mcu+0xc>)
    2398:	601a      	str	r2, [r3, #0]
    239a:	bf00      	nop
    239c:	e000ed0c 	.word	0xe000ed0c
    23a0:	05fa0004 	.word	0x05fa0004

000023a4 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    23a4:	b580      	push	{r7, lr}
    23a6:	b082      	sub	sp, #8
    23a8:	af00      	add	r7, sp, #0
    23aa:	6078      	str	r0, [r7, #4]
    23ac:	6039      	str	r1, [r7, #0]
	print(msg);
    23ae:	6878      	ldr	r0, [r7, #4]
    23b0:	f7fe fe9a 	bl	10e8 <print>
	print("at address ");
    23b4:	4814      	ldr	r0, [pc, #80]	; (2408 <print_fault+0x64>)
    23b6:	f7fe fe97 	bl	10e8 <print>
	if (adr) {
    23ba:	683b      	ldr	r3, [r7, #0]
    23bc:	2b00      	cmp	r3, #0
    23be:	d002      	beq.n	23c6 <print_fault+0x22>
		print_hex(adr);
    23c0:	6838      	ldr	r0, [r7, #0]
    23c2:	f7fe ffff 	bl	13c4 <print_hex>
	};
	conout(CR);
    23c6:	200d      	movs	r0, #13
    23c8:	f7fe fe5c 	bl	1084 <conout>
	print("UFSR=");
    23cc:	480f      	ldr	r0, [pc, #60]	; (240c <print_fault+0x68>)
    23ce:	f7fe fe8b 	bl	10e8 <print>
	print_hex(CFSR->fsr.usageFalt);
    23d2:	4b0f      	ldr	r3, [pc, #60]	; (2410 <print_fault+0x6c>)
    23d4:	681b      	ldr	r3, [r3, #0]
    23d6:	0c1b      	lsrs	r3, r3, #16
    23d8:	b29b      	uxth	r3, r3
    23da:	4618      	mov	r0, r3
    23dc:	f7fe fff2 	bl	13c4 <print_hex>
	print(", BFSR=");
    23e0:	480c      	ldr	r0, [pc, #48]	; (2414 <print_fault+0x70>)
    23e2:	f7fe fe81 	bl	10e8 <print>
	print_hex(CFSR->fsr.busFault);
    23e6:	4b0a      	ldr	r3, [pc, #40]	; (2410 <print_fault+0x6c>)
    23e8:	681b      	ldr	r3, [r3, #0]
    23ea:	0a1b      	lsrs	r3, r3, #8
    23ec:	b2db      	uxtb	r3, r3
    23ee:	4618      	mov	r0, r3
    23f0:	f7fe ffe8 	bl	13c4 <print_hex>
	print(", MMFSR=");
    23f4:	4808      	ldr	r0, [pc, #32]	; (2418 <print_fault+0x74>)
    23f6:	f7fe fe77 	bl	10e8 <print>
	print_hex(CFSR->fsr.mmFault);
    23fa:	4b05      	ldr	r3, [pc, #20]	; (2410 <print_fault+0x6c>)
    23fc:	681b      	ldr	r3, [r3, #0]
    23fe:	b2db      	uxtb	r3, r3
    2400:	4618      	mov	r0, r3
    2402:	f7fe ffdf 	bl	13c4 <print_hex>
	while(1);
    2406:	e7fe      	b.n	2406 <print_fault+0x62>
    2408:	000030e8 	.word	0x000030e8
    240c:	000030f4 	.word	0x000030f4
    2410:	e000ed28 	.word	0xe000ed28
    2414:	000030fc 	.word	0x000030fc
    2418:	00003104 	.word	0x00003104

0000241c <config_systicks>:


// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
#define MSEC_DLY FCLK/8/1000
void config_systicks(){
    241c:	b580      	push	{r7, lr}
    241e:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,9);
    2420:	f06f 000e 	mvn.w	r0, #14
    2424:	2109      	movs	r1, #9
    2426:	f7ff fe71 	bl	210c <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
    242a:	4b04      	ldr	r3, [pc, #16]	; (243c <config_systicks+0x20>)
    242c:	f641 723f 	movw	r2, #7999	; 0x1f3f
    2430:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
    2432:	4b03      	ldr	r3, [pc, #12]	; (2440 <config_systicks+0x24>)
    2434:	2203      	movs	r2, #3
    2436:	601a      	str	r2, [r3, #0]
}
    2438:	bd80      	pop	{r7, pc}
    243a:	bf00      	nop
    243c:	e000e014 	.word	0xe000e014
    2440:	e000e010 	.word	0xe000e010

00002444 <pause>:



void pause(unsigned msec){
    2444:	b480      	push	{r7}
    2446:	b083      	sub	sp, #12
    2448:	af00      	add	r7, sp, #0
    244a:	6078      	str	r0, [r7, #4]
	timer=msec;
    244c:	4a06      	ldr	r2, [pc, #24]	; (2468 <pause+0x24>)
    244e:	687b      	ldr	r3, [r7, #4]
    2450:	6013      	str	r3, [r2, #0]
	while (timer);
    2452:	bf00      	nop
    2454:	4b04      	ldr	r3, [pc, #16]	; (2468 <pause+0x24>)
    2456:	681b      	ldr	r3, [r3, #0]
    2458:	2b00      	cmp	r3, #0
    245a:	d1fb      	bne.n	2454 <pause+0x10>
}
    245c:	370c      	adds	r7, #12
    245e:	46bd      	mov	sp, r7
    2460:	f85d 7b04 	ldr.w	r7, [sp], #4
    2464:	4770      	bx	lr
    2466:	bf00      	nop
    2468:	20000128 	.word	0x20000128

0000246c <STK_handler>:


// interruption coretimer
void STK_handler(){
    246c:	b480      	push	{r7}
    246e:	af00      	add	r7, sp, #0
	ticks++;
    2470:	4b08      	ldr	r3, [pc, #32]	; (2494 <STK_handler+0x28>)
    2472:	681b      	ldr	r3, [r3, #0]
    2474:	3301      	adds	r3, #1
    2476:	4a07      	ldr	r2, [pc, #28]	; (2494 <STK_handler+0x28>)
    2478:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
    247a:	4b07      	ldr	r3, [pc, #28]	; (2498 <STK_handler+0x2c>)
    247c:	681b      	ldr	r3, [r3, #0]
    247e:	2b00      	cmp	r3, #0
    2480:	d004      	beq.n	248c <STK_handler+0x20>
    2482:	4b05      	ldr	r3, [pc, #20]	; (2498 <STK_handler+0x2c>)
    2484:	681b      	ldr	r3, [r3, #0]
    2486:	3b01      	subs	r3, #1
    2488:	4a03      	ldr	r2, [pc, #12]	; (2498 <STK_handler+0x2c>)
    248a:	6013      	str	r3, [r2, #0]
}
    248c:	46bd      	mov	sp, r7
    248e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2492:	4770      	bx	lr
    2494:	20000124 	.word	0x20000124
    2498:	20000128 	.word	0x20000128

0000249c <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    249c:	b480      	push	{r7}
    249e:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    24a0:	2300      	movs	r3, #0
    24a2:	2200      	movs	r2, #0
    24a4:	4618      	mov	r0, r3
    24a6:	4611      	mov	r1, r2
    24a8:	df02      	svc	2
}
    24aa:	46bd      	mov	sp, r7
    24ac:	f85d 7b04 	ldr.w	r7, [sp], #4
    24b0:	4770      	bx	lr
    24b2:	bf00      	nop

000024b4 <tvout_init>:

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
    24b4:	b580      	push	{r7, lr}
    24b6:	b082      	sub	sp, #8
    24b8:	af00      	add	r7, sp, #0
	//sortie sync sur PA8
	config_pin(GPIOA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    24ba:	2000      	movs	r0, #0
    24bc:	2108      	movs	r1, #8
    24be:	220a      	movs	r2, #10
    24c0:	f7ff faaa 	bl	1a18 <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(GPIOB,15,OUTPUT_ALT_PP_FAST);
    24c4:	2001      	movs	r0, #1
    24c6:	210f      	movs	r1, #15
    24c8:	220b      	movs	r2, #11
    24ca:	f7ff faa5 	bl	1a18 <config_pin>
	PORTB->BRR=BIT15;
    24ce:	4b4b      	ldr	r3, [pc, #300]	; (25fc <tvout_init+0x148>)
    24d0:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    24d4:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
    24d6:	4a4a      	ldr	r2, [pc, #296]	; (2600 <tvout_init+0x14c>)
    24d8:	4b49      	ldr	r3, [pc, #292]	; (2600 <tvout_init+0x14c>)
    24da:	699b      	ldr	r3, [r3, #24]
    24dc:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    24e0:	6193      	str	r3, [r2, #24]
	// clock source division
	*TIMER1_PSC=0;
    24e2:	4b48      	ldr	r3, [pc, #288]	; (2604 <tvout_init+0x150>)
    24e4:	2200      	movs	r2, #0
    24e6:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    24e8:	4b47      	ldr	r3, [pc, #284]	; (2608 <tvout_init+0x154>)
    24ea:	f640 72ff 	movw	r2, #4095	; 0xfff
    24ee:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    24f0:	4b46      	ldr	r3, [pc, #280]	; (260c <tvout_init+0x158>)
    24f2:	f240 122b 	movw	r2, #299	; 0x12b
    24f6:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    24f8:	4b45      	ldr	r3, [pc, #276]	; (2610 <tvout_init+0x15c>)
    24fa:	681a      	ldr	r2, [r3, #0]
    24fc:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    2500:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    2504:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    2506:	4b42      	ldr	r3, [pc, #264]	; (2610 <tvout_init+0x15c>)
    2508:	681a      	ldr	r2, [r3, #0]
    250a:	f042 0208 	orr.w	r2, r2, #8
    250e:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    2510:	4b40      	ldr	r3, [pc, #256]	; (2614 <tvout_init+0x160>)
    2512:	681a      	ldr	r2, [r3, #0]
    2514:	f042 0201 	orr.w	r2, r2, #1
    2518:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    251a:	4b3e      	ldr	r3, [pc, #248]	; (2614 <tvout_init+0x160>)
    251c:	681a      	ldr	r2, [r3, #0]
    251e:	f042 0202 	orr.w	r2, r2, #2
    2522:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    2524:	4a3c      	ldr	r2, [pc, #240]	; (2618 <tvout_init+0x164>)
    2526:	8813      	ldrh	r3, [r2, #0]
    2528:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    252c:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    2530:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    2532:	4b3a      	ldr	r3, [pc, #232]	; (261c <tvout_init+0x168>)
    2534:	681a      	ldr	r2, [r3, #0]
    2536:	f042 0201 	orr.w	r2, r2, #1
    253a:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    253c:	4b38      	ldr	r3, [pc, #224]	; (2620 <tvout_init+0x16c>)
    253e:	f640 324c 	movw	r2, #2892	; 0xb4c
    2542:	801a      	strh	r2, [r3, #0]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    2544:	4b37      	ldr	r3, [pc, #220]	; (2624 <tvout_init+0x170>)
    2546:	f243 5292 	movw	r2, #13714	; 0x3592
    254a:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    254c:	4b35      	ldr	r3, [pc, #212]	; (2624 <tvout_init+0x170>)
    254e:	4a36      	ldr	r2, [pc, #216]	; (2628 <tvout_init+0x174>)
    2550:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    2552:	4a33      	ldr	r2, [pc, #204]	; (2620 <tvout_init+0x16c>)
    2554:	4b32      	ldr	r3, [pc, #200]	; (2620 <tvout_init+0x16c>)
    2556:	889b      	ldrh	r3, [r3, #4]
    2558:	b29b      	uxth	r3, r3
    255a:	f043 0302 	orr.w	r3, r3, #2
    255e:	b29b      	uxth	r3, r3
    2560:	8093      	strh	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,7);
    2562:	200f      	movs	r0, #15
    2564:	2107      	movs	r1, #7
    2566:	f7ff fdd1 	bl	210c <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    256a:	200f      	movs	r0, #15
    256c:	f7ff fd86 	bl	207c <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    2570:	4b2e      	ldr	r3, [pc, #184]	; (262c <tvout_init+0x178>)
    2572:	681a      	ldr	r2, [r3, #0]
    2574:	f042 0202 	orr.w	r2, r2, #2
    2578:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,7);
    257a:	201b      	movs	r0, #27
    257c:	2107      	movs	r1, #7
    257e:	f7ff fdc5 	bl	210c <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    2582:	201b      	movs	r0, #27
    2584:	f7ff fd7a 	bl	207c <enable_interrupt>
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    2588:	2300      	movs	r3, #0
    258a:	607b      	str	r3, [r7, #4]
    258c:	e011      	b.n	25b2 <tvout_init+0xfe>
		video_buffer[i]=0xffff;
    258e:	4a28      	ldr	r2, [pc, #160]	; (2630 <tvout_init+0x17c>)
    2590:	687b      	ldr	r3, [r7, #4]
    2592:	f64f 71ff 	movw	r1, #65535	; 0xffff
    2596:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
    259a:	687b      	ldr	r3, [r7, #4]
    259c:	f503 5395 	add.w	r3, r3, #4768	; 0x12a0
    25a0:	330c      	adds	r3, #12
    25a2:	4a23      	ldr	r2, [pc, #140]	; (2630 <tvout_init+0x17c>)
    25a4:	f64f 71ff 	movw	r1, #65535	; 0xffff
    25a8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,7);
	enable_interrupt(IRQ_TIM1_CC);
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    25ac:	687b      	ldr	r3, [r7, #4]
    25ae:	3301      	adds	r3, #1
    25b0:	607b      	str	r3, [r7, #4]
    25b2:	687b      	ldr	r3, [r7, #4]
    25b4:	2b13      	cmp	r3, #19
    25b6:	ddea      	ble.n	258e <tvout_init+0xda>
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    25b8:	2301      	movs	r3, #1
    25ba:	607b      	str	r3, [r7, #4]
    25bc:	e018      	b.n	25f0 <tvout_init+0x13c>
		video_buffer[i*ROW_SIZE]=0x8000;
    25be:	687a      	ldr	r2, [r7, #4]
    25c0:	4613      	mov	r3, r2
    25c2:	009b      	lsls	r3, r3, #2
    25c4:	4413      	add	r3, r2
    25c6:	009b      	lsls	r3, r3, #2
    25c8:	461a      	mov	r2, r3
    25ca:	4b19      	ldr	r3, [pc, #100]	; (2630 <tvout_init+0x17c>)
    25cc:	f44f 4100 	mov.w	r1, #32768	; 0x8000
    25d0:	f823 1012 	strh.w	r1, [r3, r2, lsl #1]
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
    25d4:	687b      	ldr	r3, [r7, #4]
    25d6:	1c5a      	adds	r2, r3, #1
    25d8:	4613      	mov	r3, r2
    25da:	009b      	lsls	r3, r3, #2
    25dc:	4413      	add	r3, r2
    25de:	009b      	lsls	r3, r3, #2
    25e0:	3b01      	subs	r3, #1
    25e2:	4a13      	ldr	r2, [pc, #76]	; (2630 <tvout_init+0x17c>)
    25e4:	2101      	movs	r1, #1
    25e6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i;
	for (i=0;i<ROW_SIZE;i++){
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    25ea:	687b      	ldr	r3, [r7, #4]
    25ec:	3301      	adds	r3, #1
    25ee:	607b      	str	r3, [r7, #4]
    25f0:	687b      	ldr	r3, [r7, #4]
    25f2:	2bed      	cmp	r3, #237	; 0xed
    25f4:	dde3      	ble.n	25be <tvout_init+0x10a>
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	// test end
 }
    25f6:	3708      	adds	r7, #8
    25f8:	46bd      	mov	sp, r7
    25fa:	bd80      	pop	{r7, pc}
    25fc:	40010c00 	.word	0x40010c00
    2600:	40021000 	.word	0x40021000
    2604:	40012c28 	.word	0x40012c28
    2608:	40012c2c 	.word	0x40012c2c
    260c:	40012c34 	.word	0x40012c34
    2610:	40012c18 	.word	0x40012c18
    2614:	40012c20 	.word	0x40012c20
    2618:	40012c44 	.word	0x40012c44
    261c:	40012c00 	.word	0x40012c00
    2620:	40003800 	.word	0x40003800
    2624:	40020058 	.word	0x40020058
    2628:	4000380c 	.word	0x4000380c
    262c:	40012c0c 	.word	0x40012c0c
    2630:	20000138 	.word	0x20000138

00002634 <TIM1_CC_handler>:
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
    2634:	b410      	push	{r4}
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
    2636:	4b50      	ldr	r3, [pc, #320]	; (2778 <TIM1_CC_handler+0x144>)
	TIMER1_SR->fld.cc1if=0;
    2638:	4950      	ldr	r1, [pc, #320]	; (277c <TIM1_CC_handler+0x148>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
    263a:	681a      	ldr	r2, [r3, #0]
    263c:	3201      	adds	r2, #1
    263e:	601a      	str	r2, [r3, #0]
	TIMER1_SR->fld.cc1if=0;
    2640:	680a      	ldr	r2, [r1, #0]
    2642:	f022 0202 	bic.w	r2, r2, #2
    2646:	600a      	str	r2, [r1, #0]
	switch(line_count){
    2648:	681a      	ldr	r2, [r3, #0]
    264a:	2a12      	cmp	r2, #18
    264c:	f000 808f 	beq.w	276e <TIM1_CC_handler+0x13a>
    2650:	dd1b      	ble.n	268a <TIM1_CC_handler+0x56>
    2652:	f5b2 7f96 	cmp.w	r2, #300	; 0x12c
    2656:	d07d      	beq.n	2754 <TIM1_CC_handler+0x120>
    2658:	dd42      	ble.n	26e0 <TIM1_CC_handler+0xac>
    265a:	f240 1141 	movw	r1, #321	; 0x141
    265e:	428a      	cmp	r2, r1
    2660:	d029      	beq.n	26b6 <TIM1_CC_handler+0x82>
    2662:	f5b2 7fa1 	cmp.w	r2, #322	; 0x142
    2666:	d151      	bne.n	270c <TIM1_CC_handler+0xd8>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    2668:	4a45      	ldr	r2, [pc, #276]	; (2780 <TIM1_CC_handler+0x14c>)
    266a:	6811      	ldr	r1, [r2, #0]
    266c:	b151      	cbz	r1, 2684 <TIM1_CC_handler+0x50>
			*TIMER1_ARR/=2;
    266e:	4845      	ldr	r0, [pc, #276]	; (2784 <TIM1_CC_handler+0x150>)
			line_count=-1;
    2670:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    2674:	8801      	ldrh	r1, [r0, #0]
    2676:	f3c1 014e 	ubfx	r1, r1, #1, #15
    267a:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    267c:	601c      	str	r4, [r3, #0]
			even=-even;
    267e:	6813      	ldr	r3, [r2, #0]
    2680:	425b      	negs	r3, r3
    2682:	6013      	str	r3, [r2, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    2684:	f85d 4b04 	ldr.w	r4, [sp], #4
    2688:	4770      	bx	lr
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    268a:	2a06      	cmp	r2, #6
    268c:	d068      	beq.n	2760 <TIM1_CC_handler+0x12c>
    268e:	dd2f      	ble.n	26f0 <TIM1_CC_handler+0xbc>
    2690:	2a0c      	cmp	r2, #12
    2692:	d01b      	beq.n	26cc <TIM1_CC_handler+0x98>
    2694:	2a11      	cmp	r2, #17
    2696:	d139      	bne.n	270c <TIM1_CC_handler+0xd8>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
		break;
	case 17: // fin sync champ paire
		if (even){
    2698:	4b39      	ldr	r3, [pc, #228]	; (2780 <TIM1_CC_handler+0x14c>)
    269a:	681b      	ldr	r3, [r3, #0]
    269c:	2b00      	cmp	r3, #0
    269e:	d0f1      	beq.n	2684 <TIM1_CC_handler+0x50>
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    26a0:	f640 70ff 	movw	r0, #4095	; 0xfff
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    26a4:	f240 122b 	movw	r2, #299	; 0x12b
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    26a8:	4936      	ldr	r1, [pc, #216]	; (2784 <TIM1_CC_handler+0x150>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    26aa:	4b37      	ldr	r3, [pc, #220]	; (2788 <TIM1_CC_handler+0x154>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    26ac:	8008      	strh	r0, [r1, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    26ae:	801a      	strh	r2, [r3, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    26b0:	f85d 4b04 	ldr.w	r4, [sp], #4
    26b4:	4770      	bx	lr
	case (TOP_LINE+VRES):
		video=0;
		//_disable_dma();
		break;
	case FIELD_END:
		if (!even){
    26b6:	4a32      	ldr	r2, [pc, #200]	; (2780 <TIM1_CC_handler+0x14c>)
    26b8:	6811      	ldr	r1, [r2, #0]
    26ba:	2900      	cmp	r1, #0
    26bc:	d1e2      	bne.n	2684 <TIM1_CC_handler+0x50>
			line_count=-1;
    26be:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    26c2:	6019      	str	r1, [r3, #0]
			even=-even;
    26c4:	6813      	ldr	r3, [r2, #0]
    26c6:	425b      	negs	r3, r3
    26c8:	6013      	str	r3, [r2, #0]
    26ca:	e7db      	b.n	2684 <TIM1_CC_handler+0x50>
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    26cc:	f240 70ff 	movw	r0, #2047	; 0x7ff
    26d0:	492c      	ldr	r1, [pc, #176]	; (2784 <TIM1_CC_handler+0x150>)
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    26d2:	4b2d      	ldr	r3, [pc, #180]	; (2788 <TIM1_CC_handler+0x154>)
    26d4:	2295      	movs	r2, #149	; 0x95
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    26d6:	8008      	strh	r0, [r1, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    26d8:	801a      	strh	r2, [r3, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    26da:	f85d 4b04 	ldr.w	r4, [sp], #4
    26de:	4770      	bx	lr
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    26e0:	2a3b      	cmp	r2, #59	; 0x3b
    26e2:	d113      	bne.n	270c <TIM1_CC_handler+0xd8>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    26e4:	4b29      	ldr	r3, [pc, #164]	; (278c <TIM1_CC_handler+0x158>)
    26e6:	2201      	movs	r2, #1
    26e8:	601a      	str	r2, [r3, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    26ea:	f85d 4b04 	ldr.w	r4, [sp], #4
    26ee:	4770      	bx	lr
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    26f0:	b962      	cbnz	r2, 270c <TIM1_CC_handler+0xd8>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    26f2:	4924      	ldr	r1, [pc, #144]	; (2784 <TIM1_CC_handler+0x150>)
		*TIMER1_CCR1/=2;
    26f4:	4a24      	ldr	r2, [pc, #144]	; (2788 <TIM1_CC_handler+0x154>)
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    26f6:	880b      	ldrh	r3, [r1, #0]
    26f8:	f3c3 034e 	ubfx	r3, r3, #1, #15
    26fc:	800b      	strh	r3, [r1, #0]
		*TIMER1_CCR1/=2;
    26fe:	8813      	ldrh	r3, [r2, #0]
    2700:	f3c3 034e 	ubfx	r3, r3, #1, #15
    2704:	8013      	strh	r3, [r2, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    2706:	f85d 4b04 	ldr.w	r4, [sp], #4
    270a:	4770      	bx	lr
			line_count=-1;
			even=-even;
		}
	    break;
	default: 
		if (video){
    270c:	4a1f      	ldr	r2, [pc, #124]	; (278c <TIM1_CC_handler+0x158>)
    270e:	6812      	ldr	r2, [r2, #0]
    2710:	2a00      	cmp	r2, #0
    2712:	d0b7      	beq.n	2684 <TIM1_CC_handler+0x50>
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
    2714:	491e      	ldr	r1, [pc, #120]	; (2790 <TIM1_CC_handler+0x15c>)
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2716:	481f      	ldr	r0, [pc, #124]	; (2794 <TIM1_CC_handler+0x160>)
		}
	    break;
	default: 
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
    2718:	680a      	ldr	r2, [r1, #0]
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			DMA1[DMACH5].cndtr=ROW_SIZE;
    271a:	2414      	movs	r4, #20
		}
	    break;
	default: 
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
    271c:	f022 0201 	bic.w	r2, r2, #1
    2720:	600a      	str	r2, [r1, #0]
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2722:	681b      	ldr	r3, [r3, #0]
			DMA1[DMACH5].cndtr=ROW_SIZE;
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    2724:	4a1c      	ldr	r2, [pc, #112]	; (2798 <TIM1_CC_handler+0x164>)
	    break;
	default: 
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2726:	3b3c      	subs	r3, #60	; 0x3c
    2728:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    272c:	eb00 03c3 	add.w	r3, r0, r3, lsl #3
    2730:	60cb      	str	r3, [r1, #12]
			DMA1[DMACH5].cndtr=ROW_SIZE;
    2732:	604c      	str	r4, [r1, #4]
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    2734:	8813      	ldrh	r3, [r2, #0]
    2736:	b29b      	uxth	r3, r3
    2738:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
    273c:	d204      	bcs.n	2748 <TIM1_CC_handler+0x114>
    273e:	8813      	ldrh	r3, [r2, #0]
    2740:	b29b      	uxth	r3, r3
    2742:	f5b3 7f7a 	cmp.w	r3, #1000	; 0x3e8
    2746:	d3fa      	bcc.n	273e <TIM1_CC_handler+0x10a>
			_enable_dma();
    2748:	4a11      	ldr	r2, [pc, #68]	; (2790 <TIM1_CC_handler+0x15c>)
    274a:	6813      	ldr	r3, [r2, #0]
    274c:	f043 0301 	orr.w	r3, r3, #1
    2750:	6013      	str	r3, [r2, #0]
    2752:	e797      	b.n	2684 <TIM1_CC_handler+0x50>
	case TOP_LINE-1:
		video=1;
		//_enable_dma();
		break;
	case (TOP_LINE+VRES):
		video=0;
    2754:	4b0d      	ldr	r3, [pc, #52]	; (278c <TIM1_CC_handler+0x158>)
    2756:	2200      	movs	r2, #0
    2758:	601a      	str	r2, [r3, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    275a:	f85d 4b04 	ldr.w	r4, [sp], #4
    275e:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    2760:	f240 7269 	movw	r2, #1897	; 0x769
    2764:	4b08      	ldr	r3, [pc, #32]	; (2788 <TIM1_CC_handler+0x154>)
    2766:	801a      	strh	r2, [r3, #0]
			SPI2->DR=0;
			*/
		}
		break;
	}//switch (line_count)
}
    2768:	f85d 4b04 	ldr.w	r4, [sp], #4
    276c:	4770      	bx	lr
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
    276e:	4b04      	ldr	r3, [pc, #16]	; (2780 <TIM1_CC_handler+0x14c>)
    2770:	681b      	ldr	r3, [r3, #0]
    2772:	2b00      	cmp	r3, #0
    2774:	d186      	bne.n	2684 <TIM1_CC_handler+0x50>
    2776:	e793      	b.n	26a0 <TIM1_CC_handler+0x6c>
    2778:	20000004 	.word	0x20000004
    277c:	40012c10 	.word	0x40012c10
    2780:	20000130 	.word	0x20000130
    2784:	40012c2c 	.word	0x40012c2c
    2788:	40012c34 	.word	0x40012c34
    278c:	2000012c 	.word	0x2000012c
    2790:	40020058 	.word	0x40020058
    2794:	20000138 	.word	0x20000138
    2798:	40012c24 	.word	0x40012c24

0000279c <DMA1CH5_handler>:
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
    279c:	b480      	push	{r7}
    279e:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    27a0:	4a0a      	ldr	r2, [pc, #40]	; (27cc <DMA1CH5_handler+0x30>)
    27a2:	4b0a      	ldr	r3, [pc, #40]	; (27cc <DMA1CH5_handler+0x30>)
    27a4:	685b      	ldr	r3, [r3, #4]
    27a6:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    27aa:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    27ac:	bf00      	nop
    27ae:	4b08      	ldr	r3, [pc, #32]	; (27d0 <DMA1CH5_handler+0x34>)
    27b0:	891b      	ldrh	r3, [r3, #8]
    27b2:	b29b      	uxth	r3, r3
    27b4:	f003 0302 	and.w	r3, r3, #2
    27b8:	2b00      	cmp	r3, #0
    27ba:	d0f8      	beq.n	27ae <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    27bc:	4b04      	ldr	r3, [pc, #16]	; (27d0 <DMA1CH5_handler+0x34>)
    27be:	2200      	movs	r2, #0
    27c0:	819a      	strh	r2, [r3, #12]
}
    27c2:	46bd      	mov	sp, r7
    27c4:	f85d 7b04 	ldr.w	r7, [sp], #4
    27c8:	4770      	bx	lr
    27ca:	bf00      	nop
    27cc:	40020000 	.word	0x40020000
    27d0:	40003800 	.word	0x40003800

000027d4 <usart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
    27d4:	b480      	push	{r7}
    27d6:	b085      	sub	sp, #20
    27d8:	af00      	add	r7, sp, #0
    27da:	6078      	str	r0, [r7, #4]
    27dc:	6039      	str	r1, [r7, #0]
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
    27de:	687b      	ldr	r3, [r7, #4]
    27e0:	4a14      	ldr	r2, [pc, #80]	; (2834 <usart_set_baud+0x60>)
    27e2:	4293      	cmp	r3, r2
    27e4:	d10f      	bne.n	2806 <usart_set_baud+0x32>
		rate=(FAPB2/baud/16)<<4;
    27e6:	4a14      	ldr	r2, [pc, #80]	; (2838 <usart_set_baud+0x64>)
    27e8:	683b      	ldr	r3, [r7, #0]
    27ea:	fbb2 f3f3 	udiv	r3, r2, r3
    27ee:	011b      	lsls	r3, r3, #4
    27f0:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    27f2:	4a12      	ldr	r2, [pc, #72]	; (283c <usart_set_baud+0x68>)
    27f4:	683b      	ldr	r3, [r7, #0]
    27f6:	fbb2 f3f3 	udiv	r3, r2, r3
    27fa:	f003 030f 	and.w	r3, r3, #15
    27fe:	68fa      	ldr	r2, [r7, #12]
    2800:	4313      	orrs	r3, r2
    2802:	60fb      	str	r3, [r7, #12]
    2804:	e00e      	b.n	2824 <usart_set_baud+0x50>
	}else{
		rate=(FAPB1/baud/16)<<4;
    2806:	4a0e      	ldr	r2, [pc, #56]	; (2840 <usart_set_baud+0x6c>)
    2808:	683b      	ldr	r3, [r7, #0]
    280a:	fbb2 f3f3 	udiv	r3, r2, r3
    280e:	011b      	lsls	r3, r3, #4
    2810:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    2812:	4a0c      	ldr	r2, [pc, #48]	; (2844 <usart_set_baud+0x70>)
    2814:	683b      	ldr	r3, [r7, #0]
    2816:	fbb2 f3f3 	udiv	r3, r2, r3
    281a:	f003 030f 	and.w	r3, r3, #15
    281e:	68fa      	ldr	r2, [r7, #12]
    2820:	4313      	orrs	r3, r2
    2822:	60fb      	str	r3, [r7, #12]
	}
	channel->BRR=rate;
    2824:	687b      	ldr	r3, [r7, #4]
    2826:	68fa      	ldr	r2, [r7, #12]
    2828:	609a      	str	r2, [r3, #8]
}
    282a:	3714      	adds	r7, #20
    282c:	46bd      	mov	sp, r7
    282e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2832:	4770      	bx	lr
    2834:	40013800 	.word	0x40013800
    2838:	003d0900 	.word	0x003d0900
    283c:	03d09000 	.word	0x03d09000
    2840:	001e8480 	.word	0x001e8480
    2844:	01e84800 	.word	0x01e84800

00002848 <usart_comm_dir>:

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
    2848:	b480      	push	{r7}
    284a:	b083      	sub	sp, #12
    284c:	af00      	add	r7, sp, #0
    284e:	6078      	str	r0, [r7, #4]
    2850:	6039      	str	r1, [r7, #0]
	channel->CR1&=USART_CR1_DIR_MASK;
    2852:	687b      	ldr	r3, [r7, #4]
    2854:	68db      	ldr	r3, [r3, #12]
    2856:	f023 020c 	bic.w	r2, r3, #12
    285a:	687b      	ldr	r3, [r7, #4]
    285c:	60da      	str	r2, [r3, #12]
	channel->CR1|=direction<<USART_CR1_DIR_POS;
    285e:	687b      	ldr	r3, [r7, #4]
    2860:	68da      	ldr	r2, [r3, #12]
    2862:	683b      	ldr	r3, [r7, #0]
    2864:	009b      	lsls	r3, r3, #2
    2866:	431a      	orrs	r2, r3
    2868:	687b      	ldr	r3, [r7, #4]
    286a:	60da      	str	r2, [r3, #12]
}
    286c:	370c      	adds	r7, #12
    286e:	46bd      	mov	sp, r7
    2870:	f85d 7b04 	ldr.w	r7, [sp], #4
    2874:	4770      	bx	lr
    2876:	bf00      	nop

00002878 <usart_open_channel>:


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
    2878:	b580      	push	{r7, lr}
    287a:	b084      	sub	sp, #16
    287c:	af00      	add	r7, sp, #0
    287e:	60f8      	str	r0, [r7, #12]
    2880:	60b9      	str	r1, [r7, #8]
    2882:	607a      	str	r2, [r7, #4]
    2884:	603b      	str	r3, [r7, #0]
	usart_set_baud(channel,baud);
    2886:	68f8      	ldr	r0, [r7, #12]
    2888:	68b9      	ldr	r1, [r7, #8]
    288a:	f7ff ffa3 	bl	27d4 <usart_set_baud>
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    288e:	68fb      	ldr	r3, [r7, #12]
    2890:	4a62      	ldr	r2, [pc, #392]	; (2a1c <usart_open_channel+0x1a4>)
    2892:	4293      	cmp	r3, r2
    2894:	d066      	beq.n	2964 <usart_open_channel+0xec>
    2896:	4a62      	ldr	r2, [pc, #392]	; (2a20 <usart_open_channel+0x1a8>)
    2898:	4293      	cmp	r3, r2
    289a:	d003      	beq.n	28a4 <usart_open_channel+0x2c>
    289c:	4a61      	ldr	r2, [pc, #388]	; (2a24 <usart_open_channel+0x1ac>)
    289e:	4293      	cmp	r3, r2
    28a0:	d030      	beq.n	2904 <usart_open_channel+0x8c>
    28a2:	e08f      	b.n	29c4 <usart_open_channel+0x14c>
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
    28a4:	4a60      	ldr	r2, [pc, #384]	; (2a28 <usart_open_channel+0x1b0>)
    28a6:	4b60      	ldr	r3, [pc, #384]	; (2a28 <usart_open_channel+0x1b0>)
    28a8:	699b      	ldr	r3, [r3, #24]
    28aa:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    28ae:	f043 0304 	orr.w	r3, r3, #4
    28b2:	6193      	str	r3, [r2, #24]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    28b4:	69bb      	ldr	r3, [r7, #24]
    28b6:	2b01      	cmp	r3, #1
    28b8:	d110      	bne.n	28dc <usart_open_channel+0x64>
			GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    28ba:	4a5c      	ldr	r2, [pc, #368]	; (2a2c <usart_open_channel+0x1b4>)
    28bc:	4b5b      	ldr	r3, [pc, #364]	; (2a2c <usart_open_channel+0x1b4>)
    28be:	681b      	ldr	r3, [r3, #0]
    28c0:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    28c4:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    28c8:	6013      	str	r3, [r2, #0]
			GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    28ca:	4a58      	ldr	r2, [pc, #352]	; (2a2c <usart_open_channel+0x1b4>)
    28cc:	4b57      	ldr	r3, [pc, #348]	; (2a2c <usart_open_channel+0x1b4>)
    28ce:	681b      	ldr	r3, [r3, #0]
    28d0:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    28d4:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    28d8:	6013      	str	r3, [r2, #0]
    28da:	e00b      	b.n	28f4 <usart_open_channel+0x7c>
		}else{
			GPIOA_CRH->cr&=~(15<<GPIO_MODE9);
    28dc:	4a53      	ldr	r2, [pc, #332]	; (2a2c <usart_open_channel+0x1b4>)
    28de:	4b53      	ldr	r3, [pc, #332]	; (2a2c <usart_open_channel+0x1b4>)
    28e0:	681b      	ldr	r3, [r3, #0]
    28e2:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    28e6:	6013      	str	r3, [r2, #0]
			GPIOA_CRH->cr|=(0xA<<GPIO_MODE9);
    28e8:	4a50      	ldr	r2, [pc, #320]	; (2a2c <usart_open_channel+0x1b4>)
    28ea:	4b50      	ldr	r3, [pc, #320]	; (2a2c <usart_open_channel+0x1b4>)
    28ec:	681b      	ldr	r3, [r3, #0]
    28ee:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    28f2:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART1,7);
    28f4:	2025      	movs	r0, #37	; 0x25
    28f6:	2107      	movs	r1, #7
    28f8:	f7ff fc08 	bl	210c <set_int_priority>
		enable_interrupt(IRQ_USART1);
    28fc:	2025      	movs	r0, #37	; 0x25
    28fe:	f7ff fbbd 	bl	207c <enable_interrupt>
		break;
    2902:	e05f      	b.n	29c4 <usart_open_channel+0x14c>
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    2904:	4a48      	ldr	r2, [pc, #288]	; (2a28 <usart_open_channel+0x1b0>)
    2906:	4b48      	ldr	r3, [pc, #288]	; (2a28 <usart_open_channel+0x1b0>)
    2908:	69db      	ldr	r3, [r3, #28]
    290a:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    290e:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    2910:	4a45      	ldr	r2, [pc, #276]	; (2a28 <usart_open_channel+0x1b0>)
    2912:	4b45      	ldr	r3, [pc, #276]	; (2a28 <usart_open_channel+0x1b0>)
    2914:	699b      	ldr	r3, [r3, #24]
    2916:	f043 0304 	orr.w	r3, r3, #4
    291a:	6193      	str	r3, [r2, #24]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
    291c:	69bb      	ldr	r3, [r7, #24]
    291e:	2b01      	cmp	r3, #1
    2920:	d10c      	bne.n	293c <usart_open_channel+0xc4>
			GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    2922:	4a43      	ldr	r2, [pc, #268]	; (2a30 <usart_open_channel+0x1b8>)
    2924:	4b42      	ldr	r3, [pc, #264]	; (2a30 <usart_open_channel+0x1b8>)
    2926:	681b      	ldr	r3, [r3, #0]
    2928:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    292c:	6013      	str	r3, [r2, #0]
			GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    292e:	4a40      	ldr	r2, [pc, #256]	; (2a30 <usart_open_channel+0x1b8>)
    2930:	4b3f      	ldr	r3, [pc, #252]	; (2a30 <usart_open_channel+0x1b8>)
    2932:	681b      	ldr	r3, [r3, #0]
    2934:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    2938:	6013      	str	r3, [r2, #0]
    293a:	e00b      	b.n	2954 <usart_open_channel+0xdc>
		}else{
			GPIOA_CRL->cr&=~(15<<GPIO_MODE2);
    293c:	4a3c      	ldr	r2, [pc, #240]	; (2a30 <usart_open_channel+0x1b8>)
    293e:	4b3c      	ldr	r3, [pc, #240]	; (2a30 <usart_open_channel+0x1b8>)
    2940:	681b      	ldr	r3, [r3, #0]
    2942:	f423 6370 	bic.w	r3, r3, #3840	; 0xf00
    2946:	6013      	str	r3, [r2, #0]
			GPIOA_CRL->cr|=(0xA<<GPIO_MODE2);
    2948:	4a39      	ldr	r2, [pc, #228]	; (2a30 <usart_open_channel+0x1b8>)
    294a:	4b39      	ldr	r3, [pc, #228]	; (2a30 <usart_open_channel+0x1b8>)
    294c:	681b      	ldr	r3, [r3, #0]
    294e:	f443 6320 	orr.w	r3, r3, #2560	; 0xa00
    2952:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART2,7);
    2954:	2026      	movs	r0, #38	; 0x26
    2956:	2107      	movs	r1, #7
    2958:	f7ff fbd8 	bl	210c <set_int_priority>
		enable_interrupt(IRQ_USART2);
    295c:	2026      	movs	r0, #38	; 0x26
    295e:	f7ff fb8d 	bl	207c <enable_interrupt>
		break;
    2962:	e02f      	b.n	29c4 <usart_open_channel+0x14c>
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
    2964:	4a30      	ldr	r2, [pc, #192]	; (2a28 <usart_open_channel+0x1b0>)
    2966:	4b30      	ldr	r3, [pc, #192]	; (2a28 <usart_open_channel+0x1b0>)
    2968:	69db      	ldr	r3, [r3, #28]
    296a:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    296e:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    2970:	4a2d      	ldr	r2, [pc, #180]	; (2a28 <usart_open_channel+0x1b0>)
    2972:	4b2d      	ldr	r3, [pc, #180]	; (2a28 <usart_open_channel+0x1b0>)
    2974:	699b      	ldr	r3, [r3, #24]
    2976:	f043 0308 	orr.w	r3, r3, #8
    297a:	6193      	str	r3, [r2, #24]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    297c:	69bb      	ldr	r3, [r7, #24]
    297e:	2b01      	cmp	r3, #1
    2980:	d10c      	bne.n	299c <usart_open_channel+0x124>
			GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    2982:	4a2c      	ldr	r2, [pc, #176]	; (2a34 <usart_open_channel+0x1bc>)
    2984:	4b2b      	ldr	r3, [pc, #172]	; (2a34 <usart_open_channel+0x1bc>)
    2986:	681b      	ldr	r3, [r3, #0]
    2988:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    298c:	6013      	str	r3, [r2, #0]
			GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    298e:	4a29      	ldr	r2, [pc, #164]	; (2a34 <usart_open_channel+0x1bc>)
    2990:	4b28      	ldr	r3, [pc, #160]	; (2a34 <usart_open_channel+0x1bc>)
    2992:	681b      	ldr	r3, [r3, #0]
    2994:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    2998:	6013      	str	r3, [r2, #0]
    299a:	e00b      	b.n	29b4 <usart_open_channel+0x13c>
		}else{
			GPIOB_CRH->cr&=~((15<<GPIO_MODE10));
    299c:	4a25      	ldr	r2, [pc, #148]	; (2a34 <usart_open_channel+0x1bc>)
    299e:	4b25      	ldr	r3, [pc, #148]	; (2a34 <usart_open_channel+0x1bc>)
    29a0:	681b      	ldr	r3, [r3, #0]
    29a2:	f423 6370 	bic.w	r3, r3, #3840	; 0xf00
    29a6:	6013      	str	r3, [r2, #0]
			GPIOB_CRH->cr|=(0xA<<GPIO_MODE10);
    29a8:	4a22      	ldr	r2, [pc, #136]	; (2a34 <usart_open_channel+0x1bc>)
    29aa:	4b22      	ldr	r3, [pc, #136]	; (2a34 <usart_open_channel+0x1bc>)
    29ac:	681b      	ldr	r3, [r3, #0]
    29ae:	f443 6320 	orr.w	r3, r3, #2560	; 0xa00
    29b2:	6013      	str	r3, [r2, #0]
		}
		set_int_priority(IRQ_USART3,7);
    29b4:	2027      	movs	r0, #39	; 0x27
    29b6:	2107      	movs	r1, #7
    29b8:	f7ff fba8 	bl	210c <set_int_priority>
		enable_interrupt(IRQ_USART3);
    29bc:	2027      	movs	r0, #39	; 0x27
    29be:	f7ff fb5d 	bl	207c <enable_interrupt>
		break;
    29c2:	bf00      	nop
	}
	if (flow_ctrl==FLOW_HARD){
    29c4:	69bb      	ldr	r3, [r7, #24]
    29c6:	2b01      	cmp	r3, #1
    29c8:	d103      	bne.n	29d2 <usart_open_channel+0x15a>
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    29ca:	68fb      	ldr	r3, [r7, #12]
    29cc:	f44f 7240 	mov.w	r2, #768	; 0x300
    29d0:	615a      	str	r2, [r3, #20]
	}
	usart_comm_dir(channel,dir);
    29d2:	68f8      	ldr	r0, [r7, #12]
    29d4:	6839      	ldr	r1, [r7, #0]
    29d6:	f7ff ff37 	bl	2848 <usart_comm_dir>
	switch (parity){
    29da:	687b      	ldr	r3, [r7, #4]
    29dc:	2b01      	cmp	r3, #1
    29de:	d00b      	beq.n	29f8 <usart_open_channel+0x180>
    29e0:	2b01      	cmp	r3, #1
    29e2:	d302      	bcc.n	29ea <usart_open_channel+0x172>
    29e4:	2b02      	cmp	r3, #2
    29e6:	d00e      	beq.n	2a06 <usart_open_channel+0x18e>
    29e8:	e014      	b.n	2a14 <usart_open_channel+0x19c>
	case PARITY_NONE:
		channel->CR1|=USART_CR1_UE;
    29ea:	68fb      	ldr	r3, [r7, #12]
    29ec:	68db      	ldr	r3, [r3, #12]
    29ee:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
    29f2:	68fb      	ldr	r3, [r7, #12]
    29f4:	60da      	str	r2, [r3, #12]
		break;
    29f6:	e00d      	b.n	2a14 <usart_open_channel+0x19c>
	case PARITY_ODD:
		channel->CR1|=USART_CR1_UE|USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS;
    29f8:	68fb      	ldr	r3, [r7, #12]
    29fa:	68db      	ldr	r3, [r3, #12]
    29fc:	f443 521c 	orr.w	r2, r3, #9984	; 0x2700
    2a00:	68fb      	ldr	r3, [r7, #12]
    2a02:	60da      	str	r2, [r3, #12]
		break;
    2a04:	e006      	b.n	2a14 <usart_open_channel+0x19c>
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_UE|USART_CR1_PEIE|USART_CR1_PCE;
    2a06:	68fb      	ldr	r3, [r7, #12]
    2a08:	68db      	ldr	r3, [r3, #12]
    2a0a:	f443 5214 	orr.w	r2, r3, #9472	; 0x2500
    2a0e:	68fb      	ldr	r3, [r7, #12]
    2a10:	60da      	str	r2, [r3, #12]
		break;
    2a12:	bf00      	nop
    }
}
    2a14:	3710      	adds	r7, #16
    2a16:	46bd      	mov	sp, r7
    2a18:	bd80      	pop	{r7, pc}
    2a1a:	bf00      	nop
    2a1c:	40004800 	.word	0x40004800
    2a20:	40013800 	.word	0x40013800
    2a24:	40004400 	.word	0x40004400
    2a28:	40021000 	.word	0x40021000
    2a2c:	40010804 	.word	0x40010804
    2a30:	40010800 	.word	0x40010800
    2a34:	40010c04 	.word	0x40010c04

00002a38 <usart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
    2a38:	b480      	push	{r7}
    2a3a:	b083      	sub	sp, #12
    2a3c:	af00      	add	r7, sp, #0
    2a3e:	6078      	str	r0, [r7, #4]
	return channel->SR&USART_SR_RXNE;
    2a40:	687b      	ldr	r3, [r7, #4]
    2a42:	681b      	ldr	r3, [r3, #0]
    2a44:	f003 0320 	and.w	r3, r3, #32
}
    2a48:	4618      	mov	r0, r3
    2a4a:	370c      	adds	r7, #12
    2a4c:	46bd      	mov	sp, r7
    2a4e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2a52:	4770      	bx	lr

00002a54 <usart_getc>:

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
    2a54:	b480      	push	{r7}
    2a56:	b083      	sub	sp, #12
    2a58:	af00      	add	r7, sp, #0
    2a5a:	6078      	str	r0, [r7, #4]
	return channel->DR;
    2a5c:	687b      	ldr	r3, [r7, #4]
    2a5e:	685b      	ldr	r3, [r3, #4]
    2a60:	b2db      	uxtb	r3, r3
}
    2a62:	4618      	mov	r0, r3
    2a64:	370c      	adds	r7, #12
    2a66:	46bd      	mov	sp, r7
    2a68:	f85d 7b04 	ldr.w	r7, [sp], #4
    2a6c:	4770      	bx	lr
    2a6e:	bf00      	nop

00002a70 <usart_putc>:

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
    2a70:	b480      	push	{r7}
    2a72:	b083      	sub	sp, #12
    2a74:	af00      	add	r7, sp, #0
    2a76:	6078      	str	r0, [r7, #4]
    2a78:	460b      	mov	r3, r1
    2a7a:	70fb      	strb	r3, [r7, #3]
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
    2a7c:	bf00      	nop
    2a7e:	687b      	ldr	r3, [r7, #4]
    2a80:	681b      	ldr	r3, [r3, #0]
    2a82:	f003 0380 	and.w	r3, r3, #128	; 0x80
    2a86:	2b00      	cmp	r3, #0
    2a88:	d0f9      	beq.n	2a7e <usart_putc+0xe>
	channel->DR=c;
    2a8a:	78fa      	ldrb	r2, [r7, #3]
    2a8c:	687b      	ldr	r3, [r7, #4]
    2a8e:	605a      	str	r2, [r3, #4]
}
    2a90:	370c      	adds	r7, #12
    2a92:	46bd      	mov	sp, r7
    2a94:	f85d 7b04 	ldr.w	r7, [sp], #4
    2a98:	4770      	bx	lr
    2a9a:	bf00      	nop

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
