
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 69 31 00 00     i...m...q...i1..
      20:	69 31 00 00 69 31 00 00 69 31 00 00 5d 05 00 00     i1..i1..i1..]...
      30:	69 31 00 00 69 31 00 00 79 02 00 00 41 32 00 00     i1..i1..y...A2..
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 69 31 00 00 69 31 00 00 61 35 00 00     ....i1..i1..a5..
      80:	69 31 00 00 69 31 00 00 69 31 00 00 69 31 00 00     i1..i1..i1..i1..
      90:	69 31 00 00 69 31 00 00 69 31 00 00 35 26 00 00     i1..i1..i1..5&..
      a0:	69 31 00 00 69 31 00 00 69 31 00 00 d9 33 00 00     i1..i1..i1...3..
      b0:	9d 27 00 00 c5 02 00 00 19 1b 00 00 69 31 00 00     .'..........i1..
      c0:	69 31 00 00 69 31 00 00 69 31 00 00 69 31 00 00     i1..i1..i1..i1..
      d0:	69 31 00 00 cd 02 00 00 61 3a 00 00 d5 02 00 00     i1......a:......
      e0:	69 31 00 00 69 31 00 00 69 31 00 00 69 31 00 00     i1..i1..i1..i1..
      f0:	69 31 00 00 69 31 00 00 69 31 00 00 69 31 00 00     i1..i1..i1..i1..
     100:	69 31 00 00 69 31 00 00 69 31 00 00 69 31 00 00     i1..i1..i1..i1..
     110:	69 31 00 00 69 31 00 00 69 31 00 00 69 31 00 00     i1..i1..i1..i1..
     120:	69 31 00 00 69 31 00 00 69 31 00 00 69 31 00 00     i1..i1..i1..i1..

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
     1b0:	f000 ff1a 	bl	fe8 <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	2000000c 	.word	0x2000000c
     1c0:	200026c8 	.word	0x200026c8
     1c4:	00004490 	.word	0x00004490
     1c8:	20000000 	.word	0x20000000
     1cc:	2000000c 	.word	0x2000000c
     1d0:	20002700 	.word	0x20002700
     1d4:	200000f8 	.word	0x200000f8
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
     208:	f002 ffb6 	bl	3178 <print_fault>
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
     21e:	f002 ffab 	bl	3178 <print_fault>
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
     234:	f002 ffa0 	bl	3178 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f002 ff9b 	bl	3178 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	000041e8 	.word	0x000041e8
     258:	00004200 	.word	0x00004200
     25c:	0000420c 	.word	0x0000420c
     260:	0000421c 	.word	0x0000421c

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f002 ff80 	bl	3168 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f002 ff7e 	bl	3168 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f002 ff7c 	bl	3168 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f002 ff7a 	bl	3168 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f002 ff78 	bl	3168 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f002 ff76 	bl	3168 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f002 ff74 	bl	3168 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f002 ff72 	bl	3168 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f002 ff70 	bl	3168 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f002 ff6e 	bl	3168 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f002 ff6c 	bl	3168 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f002 ff6a 	bl	3168 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f002 ff68 	bl	3168 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f002 ff66 	bl	3168 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f002 ff64 	bl	3168 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f002 ff62 	bl	3168 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f002 ff60 	bl	3168 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f002 ff5e 	bl	3168 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f002 ff5c 	bl	3168 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f002 ff5a 	bl	3168 <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f002 ff58 	bl	3168 <reset_mcu>
_default_handler(EXTI9_5_handler) // 23
     2b8:	f002 ff56 	bl	3168 <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2bc:	f002 ff54 	bl	3168 <reset_mcu>
_default_handler(TIM2_handler) // 28
     2c0:	f002 ff52 	bl	3168 <reset_mcu>

000002c4 <TIM3_handler>:
_default_handler(TIM3_handler) // 29
     2c4:	f002 ff50 	bl	3168 <reset_mcu>
_default_handler(TIM4_handler) // 30
     2c8:	f002 ff4e 	bl	3168 <reset_mcu>

000002cc <USART1_handler>:
_default_handler(USART1_handler) // 37
     2cc:	f002 ff4c 	bl	3168 <reset_mcu>
_default_handler(USART2_handler) // 38
     2d0:	f002 ff4a 	bl	3168 <reset_mcu>

000002d4 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2d4:	f002 ff48 	bl	3168 <reset_mcu>

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
     5e6:	f001 fdf5 	bl	21d4 <write_pin>
		//led_on();
		break;
     5ea:	e092      	b.n	712 <SVC_handler+0x1b6>
	case SVC_LED_OFF:
		write_pin(LED_PORT,LED_PIN,LED_OFF);
     5ec:	484c      	ldr	r0, [pc, #304]	; (720 <SVC_handler+0x1c4>)
     5ee:	210d      	movs	r1, #13
     5f0:	2201      	movs	r2, #1
     5f2:	f001 fdef 	bl	21d4 <write_pin>
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
     60c:	f001 f8b6 	bl	177c <conin>
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
     620:	f001 f858 	bl	16d4 <conout>
		break;
     624:	e075      	b.n	712 <SVC_handler+0x1b6>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     626:	68bb      	ldr	r3, [r7, #8]
     628:	681b      	ldr	r3, [r3, #0]
     62a:	6878      	ldr	r0, [r7, #4]
     62c:	4619      	mov	r1, r3
     62e:	f001 f8d1 	bl	17d4 <read_line>
     632:	4602      	mov	r2, r0
     634:	68bb      	ldr	r3, [r7, #8]
     636:	601a      	str	r2, [r3, #0]
		break;
     638:	e06b      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT:
		print((const char*)arg1);
     63a:	68b8      	ldr	r0, [r7, #8]
     63c:	f001 f8a8 	bl	1790 <print>
		break;
     640:	e067      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT_DEC:
		print_int(*(int32_t*)arg1,10);
     642:	68bb      	ldr	r3, [r7, #8]
     644:	681b      	ldr	r3, [r3, #0]
     646:	4618      	mov	r0, r3
     648:	210a      	movs	r1, #10
     64a:	f001 f98d 	bl	1968 <print_int>
		break;
     64e:	e060      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     650:	68bb      	ldr	r3, [r7, #8]
     652:	681b      	ldr	r3, [r3, #0]
     654:	4618      	mov	r0, r3
     656:	f001 f9f5 	bl	1a44 <print_hex>
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
     6de:	f001 fa8b 	bl	1bf8 <flash_write>
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
     6f0:	f001 fac6 	bl	1c80 <flash_erase_page>
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
     706:	f001 f9ff 	bl	1b08 <cls>
		break;
     70a:	e002      	b.n	712 <SVC_handler+0x1b6>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     70c:	f002 fd2c 	bl	3168 <reset_mcu>
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
     724:	200000ec 	.word	0x200000ec
     728:	200000e8 	.word	0x200000e8

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
     7ea:	f000 fb63 	bl	eb4 <word>
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
     808:	2000005c 	.word	0x2000005c

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
     824:	2000005c 	.word	0x2000005c

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
     880:	2000005c 	.word	0x2000005c

00000884 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     884:	b580      	push	{r7, lr}
     886:	b082      	sub	sp, #8
     888:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     88a:	f000 fb13 	bl	eb4 <word>
	cmd_id=search_command((const char*)pad);
     88e:	480a      	ldr	r0, [pc, #40]	; (8b8 <cmd_putc+0x34>)
     890:	f000 f9fa 	bl	c88 <search_command>
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
     8b8:	2000005c 	.word	0x2000005c
     8bc:	00003b80 	.word	0x00003b80

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
     8d6:	f000 ff5b 	bl	1790 <print>
}
     8da:	3708      	adds	r7, #8
     8dc:	46bd      	mov	sp, r7
     8de:	bd80      	pop	{r7, pc}
     8e0:	2000005c 	.word	0x2000005c

000008e4 <cmd_print>:

static void cmd_print(){
     8e4:	b580      	push	{r7, lr}
     8e6:	af00      	add	r7, sp, #0
	word();
     8e8:	f000 fae4 	bl	eb4 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     8ec:	4b02      	ldr	r3, [pc, #8]	; (8f8 <cmd_print+0x14>)
     8ee:	2200      	movs	r2, #0
     8f0:	4618      	mov	r0, r3
     8f2:	4611      	mov	r1, r2
     8f4:	df08      	svc	8
}
     8f6:	bd80      	pop	{r7, pc}
     8f8:	2000005c 	.word	0x2000005c

000008fc <cmd_print_dec>:

static void cmd_print_dec(){
     8fc:	b580      	push	{r7, lr}
     8fe:	b082      	sub	sp, #8
     900:	af00      	add	r7, sp, #0
	int cmd_id;
    unsigned u32;
    
	word();
     902:	f000 fad7 	bl	eb4 <word>
	cmd_id=search_command((const char*)pad);
     906:	480e      	ldr	r0, [pc, #56]	; (940 <cmd_print_dec+0x44>)
     908:	f000 f9be 	bl	c88 <search_command>
     90c:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     90e:	687b      	ldr	r3, [r7, #4]
     910:	2b00      	cmp	r3, #0
     912:	db06      	blt.n	922 <cmd_print_dec+0x26>
		 commands[cmd_id].fn();
     914:	4a0b      	ldr	r2, [pc, #44]	; (944 <cmd_print_dec+0x48>)
     916:	687b      	ldr	r3, [r7, #4]
     918:	00db      	lsls	r3, r3, #3
     91a:	4413      	add	r3, r2
     91c:	685b      	ldr	r3, [r3, #4]
     91e:	4798      	blx	r3
     920:	e006      	b.n	930 <cmd_print_dec+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     922:	4807      	ldr	r0, [pc, #28]	; (940 <cmd_print_dec+0x44>)
     924:	f7ff fd56 	bl	3d4 <atoi>
     928:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     92a:	4a05      	ldr	r2, [pc, #20]	; (940 <cmd_print_dec+0x44>)
     92c:	687b      	ldr	r3, [r7, #4]
     92e:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_DEC,pad,NUL);
     930:	4b03      	ldr	r3, [pc, #12]	; (940 <cmd_print_dec+0x44>)
     932:	2200      	movs	r2, #0
     934:	4618      	mov	r0, r3
     936:	4611      	mov	r1, r2
     938:	df09      	svc	9
}
     93a:	3708      	adds	r7, #8
     93c:	46bd      	mov	sp, r7
     93e:	bd80      	pop	{r7, pc}
     940:	2000005c 	.word	0x2000005c
     944:	00003b80 	.word	0x00003b80

00000948 <cmd_print_hex>:

static void cmd_print_hex(){
     948:	b580      	push	{r7, lr}
     94a:	b082      	sub	sp, #8
     94c:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     94e:	f000 fab1 	bl	eb4 <word>
	cmd_id=search_command((const char*)pad);
     952:	480e      	ldr	r0, [pc, #56]	; (98c <cmd_print_hex+0x44>)
     954:	f000 f998 	bl	c88 <search_command>
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
     98c:	2000005c 	.word	0x2000005c
     990:	00003b80 	.word	0x00003b80

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
     9a0:	200000f8 	.word	0x200000f8

000009a4 <cmd_peek8>:

static void cmd_peek8(){
     9a4:	b580      	push	{r7, lr}
     9a6:	b082      	sub	sp, #8
     9a8:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9aa:	f000 fa83 	bl	eb4 <word>
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
     9d0:	2000005c 	.word	0x2000005c

000009d4 <cmd_peek16>:

static void cmd_peek16(){
     9d4:	b580      	push	{r7, lr}
     9d6:	b082      	sub	sp, #8
     9d8:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9da:	f000 fa6b 	bl	eb4 <word>
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
     a00:	2000005c 	.word	0x2000005c

00000a04 <cmd_peek32>:

static void cmd_peek32(){
     a04:	b580      	push	{r7, lr}
     a06:	b082      	sub	sp, #8
     a08:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     a0a:	f000 fa53 	bl	eb4 <word>
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
     a30:	2000005c 	.word	0x2000005c

00000a34 <cmd_poke8>:

static void cmd_poke8(){
     a34:	b580      	push	{r7, lr}
     a36:	b082      	sub	sp, #8
     a38:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     a3a:	f000 fa3b 	bl	eb4 <word>
	adr=atoi((const char*)pad);
     a3e:	480a      	ldr	r0, [pc, #40]	; (a68 <cmd_poke8+0x34>)
     a40:	f7ff fcc8 	bl	3d4 <atoi>
     a44:	4603      	mov	r3, r0
     a46:	607b      	str	r3, [r7, #4]
	word();
     a48:	f000 fa34 	bl	eb4 <word>
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
     a68:	2000005c 	.word	0x2000005c

00000a6c <cmd_poke16>:

static void cmd_poke16(){
     a6c:	b580      	push	{r7, lr}
     a6e:	b082      	sub	sp, #8
     a70:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     a72:	f000 fa1f 	bl	eb4 <word>
	adr=atoi((const char*)pad);
     a76:	480a      	ldr	r0, [pc, #40]	; (aa0 <cmd_poke16+0x34>)
     a78:	f7ff fcac 	bl	3d4 <atoi>
     a7c:	4603      	mov	r3, r0
     a7e:	607b      	str	r3, [r7, #4]
	word();
     a80:	f000 fa18 	bl	eb4 <word>
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
     aa0:	2000005c 	.word	0x2000005c

00000aa4 <cmd_poke32>:

static void cmd_poke32(){
     aa4:	b580      	push	{r7, lr}
     aa6:	b082      	sub	sp, #8
     aa8:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     aaa:	f000 fa03 	bl	eb4 <word>
	adr=atoi((const char*)pad);
     aae:	480a      	ldr	r0, [pc, #40]	; (ad8 <cmd_poke32+0x34>)
     ab0:	f7ff fc90 	bl	3d4 <atoi>
     ab4:	4603      	mov	r3, r0
     ab6:	607b      	str	r3, [r7, #4]
	word();
     ab8:	f000 f9fc 	bl	eb4 <word>
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
     ad8:	2000005c 	.word	0x2000005c

00000adc <cmd_fwrite>:

static void cmd_fwrite(){
     adc:	b580      	push	{r7, lr}
     ade:	b082      	sub	sp, #8
     ae0:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	word();
     ae2:	f000 f9e7 	bl	eb4 <word>
	adr=atoi((const char*)pad);
     ae6:	480d      	ldr	r0, [pc, #52]	; (b1c <cmd_fwrite+0x40>)
     ae8:	f7ff fc74 	bl	3d4 <atoi>
     aec:	4603      	mov	r3, r0
     aee:	607b      	str	r3, [r7, #4]
	word();
     af0:	f000 f9e0 	bl	eb4 <word>
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
     b10:	f000 fe3e 	bl	1790 <print>
}
     b14:	3708      	adds	r7, #8
     b16:	46bd      	mov	sp, r7
     b18:	bd80      	pop	{r7, pc}
     b1a:	bf00      	nop
     b1c:	2000005c 	.word	0x2000005c
     b20:	00003aa4 	.word	0x00003aa4

00000b24 <cmd_pgerase>:

static void cmd_pgerase(){
     b24:	b580      	push	{r7, lr}
     b26:	b082      	sub	sp, #8
     b28:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     b2a:	f000 f9c3 	bl	eb4 <word>
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
     b4a:	f000 fe21 	bl	1790 <print>
}
     b4e:	3708      	adds	r7, #8
     b50:	46bd      	mov	sp, r7
     b52:	bd80      	pop	{r7, pc}
     b54:	2000005c 	.word	0x2000005c
     b58:	00003aa4 	.word	0x00003aa4

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
     b74:	2000005c 	.word	0x2000005c

00000b78 <cmd_con>:

static void cmd_con(){
     b78:	b580      	push	{r7, lr}
     b7a:	b082      	sub	sp, #8
     b7c:	af00      	add	r7, sp, #0
	console_dev_t dev;
	word();
     b7e:	f000 f999 	bl	eb4 <word>
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
     b9e:	f000 fd11 	bl	15c4 <con_select>
}
     ba2:	3708      	adds	r7, #8
     ba4:	46bd      	mov	sp, r7
     ba6:	bd80      	pop	{r7, pc}
     ba8:	00003ab0 	.word	0x00003ab0
     bac:	2000005c 	.word	0x2000005c

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

00000bc8 <cmd_help>:

void cmd_help(){
     bc8:	b580      	push	{r7, lr}
     bca:	b082      	sub	sp, #8
     bcc:	af00      	add	r7, sp, #0
	const char *str;
	int i=0;
     bce:	2300      	movs	r3, #0
     bd0:	603b      	str	r3, [r7, #0]
	print("commands list:\n");
     bd2:	4816      	ldr	r0, [pc, #88]	; (c2c <cmd_help+0x64>)
     bd4:	f000 fddc 	bl	1790 <print>
	str=commands[i].name;
     bd8:	4a15      	ldr	r2, [pc, #84]	; (c30 <cmd_help+0x68>)
     bda:	683b      	ldr	r3, [r7, #0]
     bdc:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     be0:	607b      	str	r3, [r7, #4]
	while (str){
     be2:	e01d      	b.n	c20 <cmd_help+0x58>
		print(str);
     be4:	6878      	ldr	r0, [r7, #4]
     be6:	f000 fdd3 	bl	1790 <print>
		conout('\t');
     bea:	2009      	movs	r0, #9
     bec:	f000 fd72 	bl	16d4 <conout>
		i++;
     bf0:	683b      	ldr	r3, [r7, #0]
     bf2:	3301      	adds	r3, #1
     bf4:	603b      	str	r3, [r7, #0]
		if (!(i%6)) {conout('\n');}
     bf6:	6839      	ldr	r1, [r7, #0]
     bf8:	4b0e      	ldr	r3, [pc, #56]	; (c34 <cmd_help+0x6c>)
     bfa:	fb83 3201 	smull	r3, r2, r3, r1
     bfe:	17cb      	asrs	r3, r1, #31
     c00:	1ad2      	subs	r2, r2, r3
     c02:	4613      	mov	r3, r2
     c04:	005b      	lsls	r3, r3, #1
     c06:	4413      	add	r3, r2
     c08:	005b      	lsls	r3, r3, #1
     c0a:	1aca      	subs	r2, r1, r3
     c0c:	2a00      	cmp	r2, #0
     c0e:	d102      	bne.n	c16 <cmd_help+0x4e>
     c10:	200a      	movs	r0, #10
     c12:	f000 fd5f 	bl	16d4 <conout>
		str=commands[i].name;	
     c16:	4a06      	ldr	r2, [pc, #24]	; (c30 <cmd_help+0x68>)
     c18:	683b      	ldr	r3, [r7, #0]
     c1a:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     c1e:	607b      	str	r3, [r7, #4]
void cmd_help(){
	const char *str;
	int i=0;
	print("commands list:\n");
	str=commands[i].name;
	while (str){
     c20:	687b      	ldr	r3, [r7, #4]
     c22:	2b00      	cmp	r3, #0
     c24:	d1de      	bne.n	be4 <cmd_help+0x1c>
		conout('\t');
		i++;
		if (!(i%6)) {conout('\n');}
		str=commands[i].name;	
	}
}
     c26:	3708      	adds	r7, #8
     c28:	46bd      	mov	sp, r7
     c2a:	bd80      	pop	{r7, pc}
     c2c:	00003ab8 	.word	0x00003ab8
     c30:	00003b80 	.word	0x00003b80
     c34:	2aaaaaab 	.word	0x2aaaaaab

00000c38 <cmd_rect>:

void cmd_rect(){
     c38:	b580      	push	{r7, lr}
     c3a:	b086      	sub	sp, #24
     c3c:	af02      	add	r7, sp, #8
	int x,y,w,h;
	word();
     c3e:	f000 f939 	bl	eb4 <word>
	x=atoi((const char*)pad);
     c42:	4810      	ldr	r0, [pc, #64]	; (c84 <cmd_rect+0x4c>)
     c44:	f7ff fbc6 	bl	3d4 <atoi>
     c48:	60f8      	str	r0, [r7, #12]
	word();
     c4a:	f000 f933 	bl	eb4 <word>
	y=atoi((const char*)pad);
     c4e:	480d      	ldr	r0, [pc, #52]	; (c84 <cmd_rect+0x4c>)
     c50:	f7ff fbc0 	bl	3d4 <atoi>
     c54:	60b8      	str	r0, [r7, #8]
	word();
     c56:	f000 f92d 	bl	eb4 <word>
	w=atoi((const char*)pad);
     c5a:	480a      	ldr	r0, [pc, #40]	; (c84 <cmd_rect+0x4c>)
     c5c:	f7ff fbba 	bl	3d4 <atoi>
     c60:	6078      	str	r0, [r7, #4]
	word();
     c62:	f000 f927 	bl	eb4 <word>
	h=atoi((const char*)pad);
     c66:	4807      	ldr	r0, [pc, #28]	; (c84 <cmd_rect+0x4c>)
     c68:	f7ff fbb4 	bl	3d4 <atoi>
     c6c:	6038      	str	r0, [r7, #0]
	gdi_rect(x,y,w,h,WHITE_BIT);		
     c6e:	2301      	movs	r3, #1
     c70:	9300      	str	r3, [sp, #0]
     c72:	68f8      	ldr	r0, [r7, #12]
     c74:	68b9      	ldr	r1, [r7, #8]
     c76:	687a      	ldr	r2, [r7, #4]
     c78:	683b      	ldr	r3, [r7, #0]
     c7a:	f001 fa1f 	bl	20bc <gdi_rect>
}
     c7e:	3710      	adds	r7, #16
     c80:	46bd      	mov	sp, r7
     c82:	bd80      	pop	{r7, pc}
     c84:	2000005c 	.word	0x2000005c

00000c88 <search_command>:
	{"timer",cmd_set_timer},
	{NUL,NUL}
};


int search_command(const char * name){
     c88:	b580      	push	{r7, lr}
     c8a:	b084      	sub	sp, #16
     c8c:	af00      	add	r7, sp, #0
     c8e:	6078      	str	r0, [r7, #4]
	int i=0;
     c90:	2300      	movs	r3, #0
     c92:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     c94:	e00e      	b.n	cb4 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     c96:	4a12      	ldr	r2, [pc, #72]	; (ce0 <search_command+0x58>)
     c98:	68fb      	ldr	r3, [r7, #12]
     c9a:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     c9e:	4618      	mov	r0, r3
     ca0:	6879      	ldr	r1, [r7, #4]
     ca2:	f7ff fb19 	bl	2d8 <strcmp>
     ca6:	4603      	mov	r3, r0
     ca8:	2b00      	cmp	r3, #0
     caa:	d100      	bne.n	cae <search_command+0x26>
			break;
     cac:	e009      	b.n	cc2 <search_command+0x3a>
		}
		i++;
     cae:	68fb      	ldr	r3, [r7, #12]
     cb0:	3301      	adds	r3, #1
     cb2:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     cb4:	4a0a      	ldr	r2, [pc, #40]	; (ce0 <search_command+0x58>)
     cb6:	68fb      	ldr	r3, [r7, #12]
     cb8:	00db      	lsls	r3, r3, #3
     cba:	4413      	add	r3, r2
     cbc:	685b      	ldr	r3, [r3, #4]
     cbe:	2b00      	cmp	r3, #0
     cc0:	d1e9      	bne.n	c96 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     cc2:	4a07      	ldr	r2, [pc, #28]	; (ce0 <search_command+0x58>)
     cc4:	68fb      	ldr	r3, [r7, #12]
     cc6:	00db      	lsls	r3, r3, #3
     cc8:	4413      	add	r3, r2
     cca:	685b      	ldr	r3, [r3, #4]
     ccc:	2b00      	cmp	r3, #0
     cce:	d102      	bne.n	cd6 <search_command+0x4e>
     cd0:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     cd4:	60fb      	str	r3, [r7, #12]
	return i;
     cd6:	68fb      	ldr	r3, [r7, #12]
}
     cd8:	4618      	mov	r0, r3
     cda:	3710      	adds	r7, #16
     cdc:	46bd      	mov	sp, r7
     cde:	bd80      	pop	{r7, pc}
     ce0:	00003b80 	.word	0x00003b80

00000ce4 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     ce4:	b480      	push	{r7}
     ce6:	b085      	sub	sp, #20
     ce8:	af00      	add	r7, sp, #0
     cea:	60f8      	str	r0, [r7, #12]
     cec:	60b9      	str	r1, [r7, #8]
     cee:	4613      	mov	r3, r2
     cf0:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     cf2:	e002      	b.n	cfa <skip+0x16>
     cf4:	68bb      	ldr	r3, [r7, #8]
     cf6:	3301      	adds	r3, #1
     cf8:	60bb      	str	r3, [r7, #8]
     cfa:	68bb      	ldr	r3, [r7, #8]
     cfc:	68fa      	ldr	r2, [r7, #12]
     cfe:	4413      	add	r3, r2
     d00:	781b      	ldrb	r3, [r3, #0]
     d02:	2b00      	cmp	r3, #0
     d04:	d006      	beq.n	d14 <skip+0x30>
     d06:	68bb      	ldr	r3, [r7, #8]
     d08:	68fa      	ldr	r2, [r7, #12]
     d0a:	4413      	add	r3, r2
     d0c:	781b      	ldrb	r3, [r3, #0]
     d0e:	79fa      	ldrb	r2, [r7, #7]
     d10:	429a      	cmp	r2, r3
     d12:	d0ef      	beq.n	cf4 <skip+0x10>
	return start;
     d14:	68bb      	ldr	r3, [r7, #8]
}
     d16:	4618      	mov	r0, r3
     d18:	3714      	adds	r7, #20
     d1a:	46bd      	mov	sp, r7
     d1c:	f85d 7b04 	ldr.w	r7, [sp], #4
     d20:	4770      	bx	lr
     d22:	bf00      	nop

00000d24 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     d24:	b480      	push	{r7}
     d26:	b085      	sub	sp, #20
     d28:	af00      	add	r7, sp, #0
     d2a:	60f8      	str	r0, [r7, #12]
     d2c:	60b9      	str	r1, [r7, #8]
     d2e:	4613      	mov	r3, r2
     d30:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     d32:	e002      	b.n	d3a <scan+0x16>
     d34:	68bb      	ldr	r3, [r7, #8]
     d36:	3301      	adds	r3, #1
     d38:	60bb      	str	r3, [r7, #8]
     d3a:	68bb      	ldr	r3, [r7, #8]
     d3c:	68fa      	ldr	r2, [r7, #12]
     d3e:	4413      	add	r3, r2
     d40:	781b      	ldrb	r3, [r3, #0]
     d42:	2b00      	cmp	r3, #0
     d44:	d006      	beq.n	d54 <scan+0x30>
     d46:	68bb      	ldr	r3, [r7, #8]
     d48:	68fa      	ldr	r2, [r7, #12]
     d4a:	4413      	add	r3, r2
     d4c:	781b      	ldrb	r3, [r3, #0]
     d4e:	79fa      	ldrb	r2, [r7, #7]
     d50:	429a      	cmp	r2, r3
     d52:	d1ef      	bne.n	d34 <scan+0x10>
	return start;
     d54:	68bb      	ldr	r3, [r7, #8]
}
     d56:	4618      	mov	r0, r3
     d58:	3714      	adds	r7, #20
     d5a:	46bd      	mov	sp, r7
     d5c:	f85d 7b04 	ldr.w	r7, [sp], #4
     d60:	4770      	bx	lr
     d62:	bf00      	nop

00000d64 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     d64:	b480      	push	{r7}
     d66:	b087      	sub	sp, #28
     d68:	af00      	add	r7, sp, #0
     d6a:	6078      	str	r0, [r7, #4]
     d6c:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     d6e:	2300      	movs	r3, #0
     d70:	617b      	str	r3, [r7, #20]
     d72:	683b      	ldr	r3, [r7, #0]
     d74:	613b      	str	r3, [r7, #16]
     d76:	2300      	movs	r3, #0
     d78:	60fb      	str	r3, [r7, #12]
     d7a:	2301      	movs	r3, #1
     d7c:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     d7e:	e040      	b.n	e02 <quote+0x9e>
		switch (buffer[end]){
     d80:	693b      	ldr	r3, [r7, #16]
     d82:	687a      	ldr	r2, [r7, #4]
     d84:	4413      	add	r3, r2
     d86:	781b      	ldrb	r3, [r3, #0]
     d88:	2b5c      	cmp	r3, #92	; 0x5c
     d8a:	d012      	beq.n	db2 <quote+0x4e>
     d8c:	2b6e      	cmp	r3, #110	; 0x6e
     d8e:	d022      	beq.n	dd6 <quote+0x72>
     d90:	2b22      	cmp	r3, #34	; 0x22
     d92:	d128      	bne.n	de6 <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     d94:	697b      	ldr	r3, [r7, #20]
     d96:	2b00      	cmp	r3, #0
     d98:	d102      	bne.n	da0 <quote+0x3c>
     d9a:	2300      	movs	r3, #0
     d9c:	60bb      	str	r3, [r7, #8]
			break;
     d9e:	e02d      	b.n	dfc <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     da0:	68fb      	ldr	r3, [r7, #12]
     da2:	1c5a      	adds	r2, r3, #1
     da4:	60fa      	str	r2, [r7, #12]
     da6:	4a21      	ldr	r2, [pc, #132]	; (e2c <quote+0xc8>)
     da8:	2122      	movs	r1, #34	; 0x22
     daa:	54d1      	strb	r1, [r2, r3]
     dac:	2300      	movs	r3, #0
     dae:	617b      	str	r3, [r7, #20]
			break;
     db0:	e024      	b.n	dfc <quote+0x98>
		case '\\':
			if (!escaped){
     db2:	697b      	ldr	r3, [r7, #20]
     db4:	2b00      	cmp	r3, #0
     db6:	d102      	bne.n	dbe <quote+0x5a>
				escaped=1;
     db8:	2301      	movs	r3, #1
     dba:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     dbc:	e01e      	b.n	dfc <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     dbe:	2300      	movs	r3, #0
     dc0:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     dc2:	68fb      	ldr	r3, [r7, #12]
     dc4:	1c5a      	adds	r2, r3, #1
     dc6:	60fa      	str	r2, [r7, #12]
     dc8:	693a      	ldr	r2, [r7, #16]
     dca:	6879      	ldr	r1, [r7, #4]
     dcc:	440a      	add	r2, r1
     dce:	7811      	ldrb	r1, [r2, #0]
     dd0:	4a16      	ldr	r2, [pc, #88]	; (e2c <quote+0xc8>)
     dd2:	54d1      	strb	r1, [r2, r3]
			}
			break;
     dd4:	e012      	b.n	dfc <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     dd6:	697b      	ldr	r3, [r7, #20]
     dd8:	2b00      	cmp	r3, #0
     dda:	d004      	beq.n	de6 <quote+0x82>
     ddc:	693b      	ldr	r3, [r7, #16]
     dde:	687a      	ldr	r2, [r7, #4]
     de0:	4413      	add	r3, r2
     de2:	220d      	movs	r2, #13
     de4:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     de6:	2300      	movs	r3, #0
     de8:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     dea:	68fb      	ldr	r3, [r7, #12]
     dec:	1c5a      	adds	r2, r3, #1
     dee:	60fa      	str	r2, [r7, #12]
     df0:	693a      	ldr	r2, [r7, #16]
     df2:	6879      	ldr	r1, [r7, #4]
     df4:	440a      	add	r2, r1
     df6:	7811      	ldrb	r1, [r2, #0]
     df8:	4a0c      	ldr	r2, [pc, #48]	; (e2c <quote+0xc8>)
     dfa:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     dfc:	693b      	ldr	r3, [r7, #16]
     dfe:	3301      	adds	r3, #1
     e00:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     e02:	693b      	ldr	r3, [r7, #16]
     e04:	687a      	ldr	r2, [r7, #4]
     e06:	4413      	add	r3, r2
     e08:	781b      	ldrb	r3, [r3, #0]
     e0a:	2b00      	cmp	r3, #0
     e0c:	d002      	beq.n	e14 <quote+0xb0>
     e0e:	68bb      	ldr	r3, [r7, #8]
     e10:	2b00      	cmp	r3, #0
     e12:	d1b5      	bne.n	d80 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     e14:	4a05      	ldr	r2, [pc, #20]	; (e2c <quote+0xc8>)
     e16:	68fb      	ldr	r3, [r7, #12]
     e18:	4413      	add	r3, r2
     e1a:	2200      	movs	r2, #0
     e1c:	701a      	strb	r2, [r3, #0]
	return end;
     e1e:	693b      	ldr	r3, [r7, #16]
}
     e20:	4618      	mov	r0, r3
     e22:	371c      	adds	r7, #28
     e24:	46bd      	mov	sp, r7
     e26:	f85d 7b04 	ldr.w	r7, [sp], #4
     e2a:	4770      	bx	lr
     e2c:	2000005c 	.word	0x2000005c

00000e30 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     e30:	b480      	push	{r7}
     e32:	b087      	sub	sp, #28
     e34:	af00      	add	r7, sp, #0
     e36:	60f8      	str	r0, [r7, #12]
     e38:	60b9      	str	r1, [r7, #8]
     e3a:	4613      	mov	r3, r2
     e3c:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     e3e:	68bb      	ldr	r3, [r7, #8]
     e40:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     e42:	e002      	b.n	e4a <next+0x1a>
     e44:	697b      	ldr	r3, [r7, #20]
     e46:	3301      	adds	r3, #1
     e48:	617b      	str	r3, [r7, #20]
     e4a:	697b      	ldr	r3, [r7, #20]
     e4c:	68fa      	ldr	r2, [r7, #12]
     e4e:	4413      	add	r3, r2
     e50:	781b      	ldrb	r3, [r3, #0]
     e52:	2b00      	cmp	r3, #0
     e54:	d006      	beq.n	e64 <next+0x34>
     e56:	697b      	ldr	r3, [r7, #20]
     e58:	68fa      	ldr	r2, [r7, #12]
     e5a:	4413      	add	r3, r2
     e5c:	781b      	ldrb	r3, [r3, #0]
     e5e:	79fa      	ldrb	r2, [r7, #7]
     e60:	429a      	cmp	r2, r3
     e62:	d1ef      	bne.n	e44 <next+0x14>
	return end-start;
     e64:	697a      	ldr	r2, [r7, #20]
     e66:	68bb      	ldr	r3, [r7, #8]
     e68:	1ad3      	subs	r3, r2, r3
}
     e6a:	4618      	mov	r0, r3
     e6c:	371c      	adds	r7, #28
     e6e:	46bd      	mov	sp, r7
     e70:	f85d 7b04 	ldr.w	r7, [sp], #4
     e74:	4770      	bx	lr
     e76:	bf00      	nop

00000e78 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     e78:	b480      	push	{r7}
     e7a:	b085      	sub	sp, #20
     e7c:	af00      	add	r7, sp, #0
     e7e:	60f8      	str	r0, [r7, #12]
     e80:	60b9      	str	r1, [r7, #8]
     e82:	607a      	str	r2, [r7, #4]
	while (len){
     e84:	e00a      	b.n	e9c <move+0x24>
		*dest++=*src++;
     e86:	68bb      	ldr	r3, [r7, #8]
     e88:	1c5a      	adds	r2, r3, #1
     e8a:	60ba      	str	r2, [r7, #8]
     e8c:	68fa      	ldr	r2, [r7, #12]
     e8e:	1c51      	adds	r1, r2, #1
     e90:	60f9      	str	r1, [r7, #12]
     e92:	7812      	ldrb	r2, [r2, #0]
     e94:	701a      	strb	r2, [r3, #0]
		len--;
     e96:	687b      	ldr	r3, [r7, #4]
     e98:	3b01      	subs	r3, #1
     e9a:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     e9c:	687b      	ldr	r3, [r7, #4]
     e9e:	2b00      	cmp	r3, #0
     ea0:	d1f1      	bne.n	e86 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     ea2:	68bb      	ldr	r3, [r7, #8]
     ea4:	2200      	movs	r2, #0
     ea6:	701a      	strb	r2, [r3, #0]
}
     ea8:	3714      	adds	r7, #20
     eaa:	46bd      	mov	sp, r7
     eac:	f85d 7b04 	ldr.w	r7, [sp], #4
     eb0:	4770      	bx	lr
     eb2:	bf00      	nop

00000eb4 <word>:

// extrait le prochain mot du tib
static void word(){
     eb4:	b580      	push	{r7, lr}
     eb6:	b082      	sub	sp, #8
     eb8:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     eba:	4b1d      	ldr	r3, [pc, #116]	; (f30 <word+0x7c>)
     ebc:	681b      	ldr	r3, [r3, #0]
     ebe:	481d      	ldr	r0, [pc, #116]	; (f34 <word+0x80>)
     ec0:	4619      	mov	r1, r3
     ec2:	2220      	movs	r2, #32
     ec4:	f7ff ff0e 	bl	ce4 <skip>
     ec8:	4603      	mov	r3, r0
     eca:	461a      	mov	r2, r3
     ecc:	4b18      	ldr	r3, [pc, #96]	; (f30 <word+0x7c>)
     ece:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     ed0:	4b17      	ldr	r3, [pc, #92]	; (f30 <word+0x7c>)
     ed2:	681b      	ldr	r3, [r3, #0]
     ed4:	4a17      	ldr	r2, [pc, #92]	; (f34 <word+0x80>)
     ed6:	5cd3      	ldrb	r3, [r2, r3]
     ed8:	2b22      	cmp	r3, #34	; 0x22
     eda:	d10f      	bne.n	efc <word+0x48>
			in++;
     edc:	4b14      	ldr	r3, [pc, #80]	; (f30 <word+0x7c>)
     ede:	681b      	ldr	r3, [r3, #0]
     ee0:	3301      	adds	r3, #1
     ee2:	4a13      	ldr	r2, [pc, #76]	; (f30 <word+0x7c>)
     ee4:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     ee6:	4b12      	ldr	r3, [pc, #72]	; (f30 <word+0x7c>)
     ee8:	681b      	ldr	r3, [r3, #0]
     eea:	4812      	ldr	r0, [pc, #72]	; (f34 <word+0x80>)
     eec:	4619      	mov	r1, r3
     eee:	f7ff ff39 	bl	d64 <quote>
     ef2:	4603      	mov	r3, r0
     ef4:	461a      	mov	r2, r3
     ef6:	4b0e      	ldr	r3, [pc, #56]	; (f30 <word+0x7c>)
     ef8:	601a      	str	r2, [r3, #0]
     efa:	e016      	b.n	f2a <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     efc:	4b0c      	ldr	r3, [pc, #48]	; (f30 <word+0x7c>)
     efe:	681b      	ldr	r3, [r3, #0]
     f00:	480c      	ldr	r0, [pc, #48]	; (f34 <word+0x80>)
     f02:	4619      	mov	r1, r3
     f04:	2220      	movs	r2, #32
     f06:	f7ff ff93 	bl	e30 <next>
     f0a:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     f0c:	4b08      	ldr	r3, [pc, #32]	; (f30 <word+0x7c>)
     f0e:	681b      	ldr	r3, [r3, #0]
     f10:	4a08      	ldr	r2, [pc, #32]	; (f34 <word+0x80>)
     f12:	4413      	add	r3, r2
     f14:	4618      	mov	r0, r3
     f16:	4908      	ldr	r1, [pc, #32]	; (f38 <word+0x84>)
     f18:	687a      	ldr	r2, [r7, #4]
     f1a:	f7ff ffad 	bl	e78 <move>
			in+=len;
     f1e:	4b04      	ldr	r3, [pc, #16]	; (f30 <word+0x7c>)
     f20:	681a      	ldr	r2, [r3, #0]
     f22:	687b      	ldr	r3, [r7, #4]
     f24:	4413      	add	r3, r2
     f26:	4a02      	ldr	r2, [pc, #8]	; (f30 <word+0x7c>)
     f28:	6013      	str	r3, [r2, #0]
		}
}
     f2a:	3708      	adds	r7, #8
     f2c:	46bd      	mov	sp, r7
     f2e:	bd80      	pop	{r7, pc}
     f30:	200000ac 	.word	0x200000ac
     f34:	2000000c 	.word	0x2000000c
     f38:	2000005c 	.word	0x2000005c

00000f3c <parse_line>:

static void parse_line(unsigned llen){
     f3c:	b580      	push	{r7, lr}
     f3e:	b084      	sub	sp, #16
     f40:	af00      	add	r7, sp, #0
     f42:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     f44:	4b14      	ldr	r3, [pc, #80]	; (f98 <parse_line+0x5c>)
     f46:	2200      	movs	r2, #0
     f48:	601a      	str	r2, [r3, #0]
	while (in<llen){
     f4a:	e019      	b.n	f80 <parse_line+0x44>
		word();
     f4c:	f7ff ffb2 	bl	eb4 <word>
		cmd_id=search_command((const char*) pad);
     f50:	4812      	ldr	r0, [pc, #72]	; (f9c <parse_line+0x60>)
     f52:	f7ff fe99 	bl	c88 <search_command>
     f56:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     f58:	68fb      	ldr	r3, [r7, #12]
     f5a:	2b00      	cmp	r3, #0
     f5c:	db06      	blt.n	f6c <parse_line+0x30>
			commands[cmd_id].fn();
     f5e:	4a10      	ldr	r2, [pc, #64]	; (fa0 <parse_line+0x64>)
     f60:	68fb      	ldr	r3, [r7, #12]
     f62:	00db      	lsls	r3, r3, #3
     f64:	4413      	add	r3, r2
     f66:	685b      	ldr	r3, [r3, #4]
     f68:	4798      	blx	r3
     f6a:	e009      	b.n	f80 <parse_line+0x44>
		}else{
			conout(CR);
     f6c:	200d      	movs	r0, #13
     f6e:	f000 fbb1 	bl	16d4 <conout>
			print((const char*)pad); conout('?');
     f72:	480a      	ldr	r0, [pc, #40]	; (f9c <parse_line+0x60>)
     f74:	f000 fc0c 	bl	1790 <print>
     f78:	203f      	movs	r0, #63	; 0x3f
     f7a:	f000 fbab 	bl	16d4 <conout>
			break;
     f7e:	e004      	b.n	f8a <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     f80:	4b05      	ldr	r3, [pc, #20]	; (f98 <parse_line+0x5c>)
     f82:	681a      	ldr	r2, [r3, #0]
     f84:	687b      	ldr	r3, [r7, #4]
     f86:	429a      	cmp	r2, r3
     f88:	d3e0      	bcc.n	f4c <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     f8a:	200d      	movs	r0, #13
     f8c:	f000 fba2 	bl	16d4 <conout>
}
     f90:	3710      	adds	r7, #16
     f92:	46bd      	mov	sp, r7
     f94:	bd80      	pop	{r7, pc}
     f96:	bf00      	nop
     f98:	200000ac 	.word	0x200000ac
     f9c:	2000005c 	.word	0x2000005c
     fa0:	00003b80 	.word	0x00003b80

00000fa4 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     fa4:	b480      	push	{r7}
     fa6:	b085      	sub	sp, #20
     fa8:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     faa:	4b0c      	ldr	r3, [pc, #48]	; (fdc <copy_blink_in_ram+0x38>)
     fac:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     fae:	4b0c      	ldr	r3, [pc, #48]	; (fe0 <copy_blink_in_ram+0x3c>)
     fb0:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     fb2:	4b0c      	ldr	r3, [pc, #48]	; (fe4 <copy_blink_in_ram+0x40>)
     fb4:	60bb      	str	r3, [r7, #8]
	while (start<end){
     fb6:	e007      	b.n	fc8 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     fb8:	68bb      	ldr	r3, [r7, #8]
     fba:	1d1a      	adds	r2, r3, #4
     fbc:	60ba      	str	r2, [r7, #8]
     fbe:	68fa      	ldr	r2, [r7, #12]
     fc0:	1d11      	adds	r1, r2, #4
     fc2:	60f9      	str	r1, [r7, #12]
     fc4:	6812      	ldr	r2, [r2, #0]
     fc6:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     fc8:	68fa      	ldr	r2, [r7, #12]
     fca:	687b      	ldr	r3, [r7, #4]
     fcc:	429a      	cmp	r2, r3
     fce:	d3f3      	bcc.n	fb8 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     fd0:	3714      	adds	r7, #20
     fd2:	46bd      	mov	sp, r7
     fd4:	f85d 7b04 	ldr.w	r7, [sp], #4
     fd8:	4770      	bx	lr
     fda:	bf00      	nop
     fdc:	00004400 	.word	0x00004400
     fe0:	00004490 	.word	0x00004490
     fe4:	20002700 	.word	0x20002700

00000fe8 <main>:

extern void print_fault(const char *msg, sfrp_t adr);



void main(void){
     fe8:	b580      	push	{r7, lr}
     fea:	b082      	sub	sp, #8
     fec:	af00      	add	r7, sp, #0
	set_sysclock();
     fee:	f7ff fb9d 	bl	72c <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     ff2:	f06f 000a 	mvn.w	r0, #10
     ff6:	210f      	movs	r1, #15
     ff8:	f001 fcbc 	bl	2974 <set_int_priority>
	config_systicks();
     ffc:	f002 f8f8 	bl	31f0 <config_systicks>
	flash_enable();
    1000:	f000 fdba 	bl	1b78 <flash_enable>
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
    1004:	4b32      	ldr	r3, [pc, #200]	; (10d0 <main+0xe8>)
    1006:	221d      	movs	r2, #29
    1008:	619a      	str	r2, [r3, #24]
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
    100a:	4b31      	ldr	r3, [pc, #196]	; (10d0 <main+0xe8>)
    100c:	f44f 4280 	mov.w	r2, #16384	; 0x4000
    1010:	61da      	str	r2, [r3, #28]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
    1012:	4a2f      	ldr	r2, [pc, #188]	; (10d0 <main+0xe8>)
    1014:	4b2e      	ldr	r3, [pc, #184]	; (10d0 <main+0xe8>)
    1016:	695b      	ldr	r3, [r3, #20]
    1018:	f043 0301 	orr.w	r3, r3, #1
    101c:	6153      	str	r3, [r2, #20]
	config_pin(LED_PORT,LED_PIN,OUTPUT_OD_SLOW);
    101e:	482d      	ldr	r0, [pc, #180]	; (10d4 <main+0xec>)
    1020:	210d      	movs	r1, #13
    1022:	2206      	movs	r2, #6
    1024:	f001 f892 	bl	214c <config_pin>
	vt_init();
    1028:	f002 fc7c 	bl	3924 <vt_init>
	keyboard_init();
    102c:	f001 f93a 	bl	22a4 <keyboard_init>
	tvout_init();
    1030:	f002 f92a 	bl	3288 <tvout_init>
	console_init(SERIAL);
    1034:	2001      	movs	r0, #1
    1036:	f000 fb35 	bl	16a4 <console_init>
	if (!vt_ready()){con_select(LOCAL);}
    103a:	f002 fce1 	bl	3a00 <vt_ready>
    103e:	4603      	mov	r3, r0
    1040:	2b00      	cmp	r3, #0
    1042:	d102      	bne.n	104a <main+0x62>
    1044:	2000      	movs	r0, #0
    1046:	f000 fabd 	bl	15c4 <con_select>
	cls();
    104a:	f000 fd5d 	bl	1b08 <cls>
	print(VERSION);
    104e:	4b22      	ldr	r3, [pc, #136]	; (10d8 <main+0xf0>)
    1050:	681b      	ldr	r3, [r3, #0]
    1052:	4618      	mov	r0, r3
    1054:	f000 fb9c 	bl	1790 <print>
	copy_blink_in_ram();
    1058:	f7ff ffa4 	bl	fa4 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
    105c:	481f      	ldr	r0, [pc, #124]	; (10dc <main+0xf4>)
    105e:	f000 fb97 	bl	1790 <print>
    1062:	4b1f      	ldr	r3, [pc, #124]	; (10e0 <main+0xf8>)
    1064:	2200      	movs	r2, #0
    1066:	4618      	mov	r0, r3
    1068:	4611      	mov	r1, r2
    106a:	df0a      	svc	10
    106c:	200d      	movs	r0, #13
    106e:	f000 fb31 	bl	16d4 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
    1072:	2300      	movs	r3, #0
    1074:	2200      	movs	r2, #0
    1076:	4618      	mov	r0, r3
    1078:	4611      	mov	r1, r2
    107a:	df01      	svc	1
	print("initializing SDcard\n");
    107c:	4819      	ldr	r0, [pc, #100]	; (10e4 <main+0xfc>)
    107e:	f000 fb87 	bl	1790 <print>
	if (sdcard_init()){
    1082:	f001 fde9 	bl	2c58 <sdcard_init>
    1086:	4603      	mov	r3, r0
    1088:	2b00      	cmp	r3, #0
    108a:	d00d      	beq.n	10a8 <main+0xc0>
			print("SDcard capacity: ");print_int(sdcard_capacity(),10);print(" Mo\n");
    108c:	4816      	ldr	r0, [pc, #88]	; (10e8 <main+0x100>)
    108e:	f000 fb7f 	bl	1790 <print>
    1092:	f001 fc9f 	bl	29d4 <sdcard_capacity>
    1096:	4603      	mov	r3, r0
    1098:	4618      	mov	r0, r3
    109a:	210a      	movs	r1, #10
    109c:	f000 fc64 	bl	1968 <print_int>
    10a0:	4812      	ldr	r0, [pc, #72]	; (10ec <main+0x104>)
    10a2:	f000 fb75 	bl	1790 <print>
    10a6:	e00a      	b.n	10be <main+0xd6>
	}else{
		print("SDcard initialization failed, status code: "); print_hex(sdc_status);conout('\n');
    10a8:	4811      	ldr	r0, [pc, #68]	; (10f0 <main+0x108>)
    10aa:	f000 fb71 	bl	1790 <print>
    10ae:	4b11      	ldr	r3, [pc, #68]	; (10f4 <main+0x10c>)
    10b0:	881b      	ldrh	r3, [r3, #0]
    10b2:	4618      	mov	r0, r3
    10b4:	f000 fcc6 	bl	1a44 <print_hex>
    10b8:	200a      	movs	r0, #10
    10ba:	f000 fb0b 	bl	16d4 <conout>
	} 
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
    10be:	480e      	ldr	r0, [pc, #56]	; (10f8 <main+0x110>)
    10c0:	2150      	movs	r1, #80	; 0x50
    10c2:	f000 fb87 	bl	17d4 <read_line>
    10c6:	6078      	str	r0, [r7, #4]
		parse_line(llen);
    10c8:	6878      	ldr	r0, [r7, #4]
    10ca:	f7ff ff37 	bl	f3c <parse_line>
	}
    10ce:	e7f6      	b.n	10be <main+0xd6>
    10d0:	40021000 	.word	0x40021000
    10d4:	40011000 	.word	0x40011000
    10d8:	20000000 	.word	0x20000000
    10dc:	00003c70 	.word	0x00003c70
    10e0:	200000f8 	.word	0x200000f8
    10e4:	00003c8c 	.word	0x00003c8c
    10e8:	00003ca4 	.word	0x00003ca4
    10ec:	00003cb8 	.word	0x00003cb8
    10f0:	00003cc0 	.word	0x00003cc0
    10f4:	20000144 	.word	0x20000144
    10f8:	2000000c 	.word	0x2000000c

000010fc <cursor_home>:
static int screen_width, screen_height;

static int cursor_visible=0;
static int cursor_blink=0;

static void cursor_home(){
    10fc:	b480      	push	{r7}
    10fe:	af00      	add	r7, sp, #0
	cursor_x=0;
    1100:	4b04      	ldr	r3, [pc, #16]	; (1114 <cursor_home+0x18>)
    1102:	2200      	movs	r2, #0
    1104:	601a      	str	r2, [r3, #0]
	cursor_y=0;
    1106:	4b04      	ldr	r3, [pc, #16]	; (1118 <cursor_home+0x1c>)
    1108:	2200      	movs	r2, #0
    110a:	601a      	str	r2, [r3, #0]
}
    110c:	46bd      	mov	sp, r7
    110e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1112:	4770      	bx	lr
    1114:	200000b0 	.word	0x200000b0
    1118:	200000b4 	.word	0x200000b4

0000111c <local_hide_cursor>:

/**************************
 * fonctions console locale
 *************************/
 
static void local_hide_cursor(){
    111c:	b580      	push	{r7, lr}
    111e:	b082      	sub	sp, #8
    1120:	af02      	add	r7, sp, #8
	if (cursor_visible){
    1122:	4b0f      	ldr	r3, [pc, #60]	; (1160 <local_hide_cursor+0x44>)
    1124:	681b      	ldr	r3, [r3, #0]
    1126:	2b00      	cmp	r3, #0
    1128:	d017      	beq.n	115a <local_hide_cursor+0x3e>
		disable_interrupt(IRQ_CURSOR_BLINK);
    112a:	201e      	movs	r0, #30
    112c:	f001 fb8a 	bl	2844 <disable_interrupt>
		gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    1130:	4b0c      	ldr	r3, [pc, #48]	; (1164 <local_hide_cursor+0x48>)
    1132:	681a      	ldr	r2, [r3, #0]
    1134:	4613      	mov	r3, r2
    1136:	005b      	lsls	r3, r3, #1
    1138:	4413      	add	r3, r2
    113a:	005b      	lsls	r3, r3, #1
    113c:	4619      	mov	r1, r3
    113e:	4b0a      	ldr	r3, [pc, #40]	; (1168 <local_hide_cursor+0x4c>)
    1140:	681b      	ldr	r3, [r3, #0]
    1142:	00da      	lsls	r2, r3, #3
    1144:	2300      	movs	r3, #0
    1146:	9300      	str	r3, [sp, #0]
    1148:	4608      	mov	r0, r1
    114a:	4611      	mov	r1, r2
    114c:	2206      	movs	r2, #6
    114e:	2308      	movs	r3, #8
    1150:	f000 fe90 	bl	1e74 <gdi_box>
		cursor_visible=0;
    1154:	4b02      	ldr	r3, [pc, #8]	; (1160 <local_hide_cursor+0x44>)
    1156:	2200      	movs	r2, #0
    1158:	601a      	str	r2, [r3, #0]
	}
}
    115a:	46bd      	mov	sp, r7
    115c:	bd80      	pop	{r7, pc}
    115e:	bf00      	nop
    1160:	200000c0 	.word	0x200000c0
    1164:	200000b0 	.word	0x200000b0
    1168:	200000b4 	.word	0x200000b4

0000116c <local_crlf>:

// avance le curseur texte au début 
// de la ligne suivante.
static void local_crlf(){
    116c:	b580      	push	{r7, lr}
    116e:	af00      	add	r7, sp, #0
	local_hide_cursor();
    1170:	f7ff ffd4 	bl	111c <local_hide_cursor>
	cursor_x=0;
    1174:	4b0e      	ldr	r3, [pc, #56]	; (11b0 <local_crlf+0x44>)
    1176:	2200      	movs	r2, #0
    1178:	601a      	str	r2, [r3, #0]
	cursor_y++;
    117a:	4b0e      	ldr	r3, [pc, #56]	; (11b4 <local_crlf+0x48>)
    117c:	681b      	ldr	r3, [r3, #0]
    117e:	3301      	adds	r3, #1
    1180:	4a0c      	ldr	r2, [pc, #48]	; (11b4 <local_crlf+0x48>)
    1182:	6013      	str	r3, [r2, #0]
	if (cursor_y>=screen_height){
    1184:	4b0b      	ldr	r3, [pc, #44]	; (11b4 <local_crlf+0x48>)
    1186:	681a      	ldr	r2, [r3, #0]
    1188:	4b0b      	ldr	r3, [pc, #44]	; (11b8 <local_crlf+0x4c>)
    118a:	681b      	ldr	r3, [r3, #0]
    118c:	429a      	cmp	r2, r3
    118e:	db07      	blt.n	11a0 <local_crlf+0x34>
		cursor_y--;
    1190:	4b08      	ldr	r3, [pc, #32]	; (11b4 <local_crlf+0x48>)
    1192:	681b      	ldr	r3, [r3, #0]
    1194:	3b01      	subs	r3, #1
    1196:	4a07      	ldr	r2, [pc, #28]	; (11b4 <local_crlf+0x48>)
    1198:	6013      	str	r3, [r2, #0]
		gdi_scroll_up(CHAR_HEIGHT);
    119a:	2008      	movs	r0, #8
    119c:	f000 fdde 	bl	1d5c <gdi_scroll_up>
	}
	if (cursor_blink){
    11a0:	4b06      	ldr	r3, [pc, #24]	; (11bc <local_crlf+0x50>)
    11a2:	681b      	ldr	r3, [r3, #0]
    11a4:	2b00      	cmp	r3, #0
    11a6:	d002      	beq.n	11ae <local_crlf+0x42>
		enable_interrupt(IRQ_CURSOR_BLINK);
    11a8:	201e      	movs	r0, #30
    11aa:	f001 fb27 	bl	27fc <enable_interrupt>
	}
}
    11ae:	bd80      	pop	{r7, pc}
    11b0:	200000b0 	.word	0x200000b0
    11b4:	200000b4 	.word	0x200000b4
    11b8:	200000bc 	.word	0x200000bc
    11bc:	200000c4 	.word	0x200000c4

000011c0 <local_cursor_left>:

static void local_cursor_left(){
    11c0:	b580      	push	{r7, lr}
    11c2:	af00      	add	r7, sp, #0
	if (!(cursor_x|cursor_y)) return; // curseur à {0,0}
    11c4:	4b12      	ldr	r3, [pc, #72]	; (1210 <local_cursor_left+0x50>)
    11c6:	681a      	ldr	r2, [r3, #0]
    11c8:	4b12      	ldr	r3, [pc, #72]	; (1214 <local_cursor_left+0x54>)
    11ca:	681b      	ldr	r3, [r3, #0]
    11cc:	4313      	orrs	r3, r2
    11ce:	2b00      	cmp	r3, #0
    11d0:	d100      	bne.n	11d4 <local_cursor_left+0x14>
    11d2:	e01c      	b.n	120e <local_cursor_left+0x4e>
	local_hide_cursor();
    11d4:	f7ff ffa2 	bl	111c <local_hide_cursor>
	if (cursor_x){
    11d8:	4b0d      	ldr	r3, [pc, #52]	; (1210 <local_cursor_left+0x50>)
    11da:	681b      	ldr	r3, [r3, #0]
    11dc:	2b00      	cmp	r3, #0
    11de:	d005      	beq.n	11ec <local_cursor_left+0x2c>
		cursor_x--;
    11e0:	4b0b      	ldr	r3, [pc, #44]	; (1210 <local_cursor_left+0x50>)
    11e2:	681b      	ldr	r3, [r3, #0]
    11e4:	3b01      	subs	r3, #1
    11e6:	4a0a      	ldr	r2, [pc, #40]	; (1210 <local_cursor_left+0x50>)
    11e8:	6013      	str	r3, [r2, #0]
    11ea:	e009      	b.n	1200 <local_cursor_left+0x40>
	}else{
		cursor_x=screen_width-1;
    11ec:	4b0a      	ldr	r3, [pc, #40]	; (1218 <local_cursor_left+0x58>)
    11ee:	681b      	ldr	r3, [r3, #0]
    11f0:	3b01      	subs	r3, #1
    11f2:	4a07      	ldr	r2, [pc, #28]	; (1210 <local_cursor_left+0x50>)
    11f4:	6013      	str	r3, [r2, #0]
		cursor_y--;
    11f6:	4b07      	ldr	r3, [pc, #28]	; (1214 <local_cursor_left+0x54>)
    11f8:	681b      	ldr	r3, [r3, #0]
    11fa:	3b01      	subs	r3, #1
    11fc:	4a05      	ldr	r2, [pc, #20]	; (1214 <local_cursor_left+0x54>)
    11fe:	6013      	str	r3, [r2, #0]
	}
	if (cursor_blink){
    1200:	4b06      	ldr	r3, [pc, #24]	; (121c <local_cursor_left+0x5c>)
    1202:	681b      	ldr	r3, [r3, #0]
    1204:	2b00      	cmp	r3, #0
    1206:	d002      	beq.n	120e <local_cursor_left+0x4e>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1208:	201e      	movs	r0, #30
    120a:	f001 faf7 	bl	27fc <enable_interrupt>
	}
}
    120e:	bd80      	pop	{r7, pc}
    1210:	200000b0 	.word	0x200000b0
    1214:	200000b4 	.word	0x200000b4
    1218:	200000b8 	.word	0x200000b8
    121c:	200000c4 	.word	0x200000c4

00001220 <local_cursor_right>:

static void local_cursor_right(){
    1220:	b580      	push	{r7, lr}
    1222:	af00      	add	r7, sp, #0
	local_hide_cursor();
    1224:	f7ff ff7a 	bl	111c <local_hide_cursor>
	cursor_x++;
    1228:	4b0a      	ldr	r3, [pc, #40]	; (1254 <local_cursor_right+0x34>)
    122a:	681b      	ldr	r3, [r3, #0]
    122c:	3301      	adds	r3, #1
    122e:	4a09      	ldr	r2, [pc, #36]	; (1254 <local_cursor_right+0x34>)
    1230:	6013      	str	r3, [r2, #0]
	if (cursor_x>=screen_width){
    1232:	4b08      	ldr	r3, [pc, #32]	; (1254 <local_cursor_right+0x34>)
    1234:	681a      	ldr	r2, [r3, #0]
    1236:	4b08      	ldr	r3, [pc, #32]	; (1258 <local_cursor_right+0x38>)
    1238:	681b      	ldr	r3, [r3, #0]
    123a:	429a      	cmp	r2, r3
    123c:	db01      	blt.n	1242 <local_cursor_right+0x22>
		local_crlf();
    123e:	f7ff ff95 	bl	116c <local_crlf>
	}	
	if (cursor_blink){
    1242:	4b06      	ldr	r3, [pc, #24]	; (125c <local_cursor_right+0x3c>)
    1244:	681b      	ldr	r3, [r3, #0]
    1246:	2b00      	cmp	r3, #0
    1248:	d002      	beq.n	1250 <local_cursor_right+0x30>
		enable_interrupt(IRQ_CURSOR_BLINK);
    124a:	201e      	movs	r0, #30
    124c:	f001 fad6 	bl	27fc <enable_interrupt>
	}
}
    1250:	bd80      	pop	{r7, pc}
    1252:	bf00      	nop
    1254:	200000b0 	.word	0x200000b0
    1258:	200000b8 	.word	0x200000b8
    125c:	200000c4 	.word	0x200000c4

00001260 <local_del_back>:


static void local_del_back(){
    1260:	b580      	push	{r7, lr}
    1262:	b082      	sub	sp, #8
    1264:	af02      	add	r7, sp, #8
	if (!(cursor_x|cursor_y)) return; 
    1266:	4b13      	ldr	r3, [pc, #76]	; (12b4 <local_del_back+0x54>)
    1268:	681a      	ldr	r2, [r3, #0]
    126a:	4b13      	ldr	r3, [pc, #76]	; (12b8 <local_del_back+0x58>)
    126c:	681b      	ldr	r3, [r3, #0]
    126e:	4313      	orrs	r3, r2
    1270:	2b00      	cmp	r3, #0
    1272:	d100      	bne.n	1276 <local_del_back+0x16>
    1274:	e01c      	b.n	12b0 <local_del_back+0x50>
	local_cursor_left();
    1276:	f7ff ffa3 	bl	11c0 <local_cursor_left>
	local_hide_cursor();
    127a:	f7ff ff4f 	bl	111c <local_hide_cursor>
	gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    127e:	4b0d      	ldr	r3, [pc, #52]	; (12b4 <local_del_back+0x54>)
    1280:	681a      	ldr	r2, [r3, #0]
    1282:	4613      	mov	r3, r2
    1284:	005b      	lsls	r3, r3, #1
    1286:	4413      	add	r3, r2
    1288:	005b      	lsls	r3, r3, #1
    128a:	4619      	mov	r1, r3
    128c:	4b0a      	ldr	r3, [pc, #40]	; (12b8 <local_del_back+0x58>)
    128e:	681b      	ldr	r3, [r3, #0]
    1290:	00da      	lsls	r2, r3, #3
    1292:	2300      	movs	r3, #0
    1294:	9300      	str	r3, [sp, #0]
    1296:	4608      	mov	r0, r1
    1298:	4611      	mov	r1, r2
    129a:	2206      	movs	r2, #6
    129c:	2308      	movs	r3, #8
    129e:	f000 fde9 	bl	1e74 <gdi_box>
	if (cursor_blink){
    12a2:	4b06      	ldr	r3, [pc, #24]	; (12bc <local_del_back+0x5c>)
    12a4:	681b      	ldr	r3, [r3, #0]
    12a6:	2b00      	cmp	r3, #0
    12a8:	d002      	beq.n	12b0 <local_del_back+0x50>
		enable_interrupt(IRQ_CURSOR_BLINK);
    12aa:	201e      	movs	r0, #30
    12ac:	f001 faa6 	bl	27fc <enable_interrupt>
	}
}
    12b0:	46bd      	mov	sp, r7
    12b2:	bd80      	pop	{r7, pc}
    12b4:	200000b0 	.word	0x200000b0
    12b8:	200000b4 	.word	0x200000b4
    12bc:	200000c4 	.word	0x200000c4

000012c0 <local_putc>:

// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void local_putc(char c){
    12c0:	b580      	push	{r7, lr}
    12c2:	b084      	sub	sp, #16
    12c4:	af02      	add	r7, sp, #8
    12c6:	4603      	mov	r3, r0
    12c8:	71fb      	strb	r3, [r7, #7]
		local_hide_cursor();
    12ca:	f7ff ff27 	bl	111c <local_hide_cursor>
		gdi_put_sprite(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,(const unsigned char *)&font6x8[c]);
    12ce:	4b0c      	ldr	r3, [pc, #48]	; (1300 <local_putc+0x40>)
    12d0:	681a      	ldr	r2, [r3, #0]
    12d2:	4613      	mov	r3, r2
    12d4:	005b      	lsls	r3, r3, #1
    12d6:	4413      	add	r3, r2
    12d8:	005b      	lsls	r3, r3, #1
    12da:	4618      	mov	r0, r3
    12dc:	4b09      	ldr	r3, [pc, #36]	; (1304 <local_putc+0x44>)
    12de:	681b      	ldr	r3, [r3, #0]
    12e0:	00d9      	lsls	r1, r3, #3
    12e2:	79fb      	ldrb	r3, [r7, #7]
    12e4:	00db      	lsls	r3, r3, #3
    12e6:	4a08      	ldr	r2, [pc, #32]	; (1308 <local_putc+0x48>)
    12e8:	4413      	add	r3, r2
    12ea:	9300      	str	r3, [sp, #0]
    12ec:	2206      	movs	r2, #6
    12ee:	2308      	movs	r3, #8
    12f0:	f000 fe00 	bl	1ef4 <gdi_put_sprite>
		local_cursor_right();
    12f4:	f7ff ff94 	bl	1220 <local_cursor_right>
/*
		if (cursor_blink){
			enable_interrupt(IRQ_CURSOR_BLINK);
		}
*/
}
    12f8:	3708      	adds	r7, #8
    12fa:	46bd      	mov	sp, r7
    12fc:	bd80      	pop	{r7, pc}
    12fe:	bf00      	nop
    1300:	200000b0 	.word	0x200000b0
    1304:	200000b4 	.word	0x200000b4
    1308:	00003cf4 	.word	0x00003cf4

0000130c <local_clear_line>:


static void local_clear_line(){
    130c:	b580      	push	{r7, lr}
    130e:	af00      	add	r7, sp, #0
	local_hide_cursor();
    1310:	f7ff ff04 	bl	111c <local_hide_cursor>
	cursor_x=0;
    1314:	4b08      	ldr	r3, [pc, #32]	; (1338 <local_clear_line+0x2c>)
    1316:	2200      	movs	r2, #0
    1318:	601a      	str	r2, [r3, #0]
	gdi_clear_rows(cursor_y*CHAR_HEIGHT,CHAR_HEIGHT);
    131a:	4b08      	ldr	r3, [pc, #32]	; (133c <local_clear_line+0x30>)
    131c:	681b      	ldr	r3, [r3, #0]
    131e:	00db      	lsls	r3, r3, #3
    1320:	4618      	mov	r0, r3
    1322:	2108      	movs	r1, #8
    1324:	f000 fe96 	bl	2054 <gdi_clear_rows>
	if (cursor_blink){
    1328:	4b05      	ldr	r3, [pc, #20]	; (1340 <local_clear_line+0x34>)
    132a:	681b      	ldr	r3, [r3, #0]
    132c:	2b00      	cmp	r3, #0
    132e:	d002      	beq.n	1336 <local_clear_line+0x2a>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1330:	201e      	movs	r0, #30
    1332:	f001 fa63 	bl	27fc <enable_interrupt>
	}
}
    1336:	bd80      	pop	{r7, pc}
    1338:	200000b0 	.word	0x200000b0
    133c:	200000b4 	.word	0x200000b4
    1340:	200000c4 	.word	0x200000c4

00001344 <local_clear_screen>:

static void local_clear_screen(){
    1344:	b580      	push	{r7, lr}
    1346:	af00      	add	r7, sp, #0
	local_hide_cursor();
    1348:	f7ff fee8 	bl	111c <local_hide_cursor>
	gdi_clear_screen();
    134c:	f000 fcee 	bl	1d2c <gdi_clear_screen>
	cursor_home();
    1350:	f7ff fed4 	bl	10fc <cursor_home>
	if (cursor_blink){
    1354:	4b03      	ldr	r3, [pc, #12]	; (1364 <local_clear_screen+0x20>)
    1356:	681b      	ldr	r3, [r3, #0]
    1358:	2b00      	cmp	r3, #0
    135a:	d002      	beq.n	1362 <local_clear_screen+0x1e>
		enable_interrupt(IRQ_CURSOR_BLINK);
    135c:	201e      	movs	r0, #30
    135e:	f001 fa4d 	bl	27fc <enable_interrupt>
	}
}
    1362:	bd80      	pop	{r7, pc}
    1364:	200000c4 	.word	0x200000c4

00001368 <local_text_cursor>:

static void local_text_cursor(int enable){
    1368:	b580      	push	{r7, lr}
    136a:	b084      	sub	sp, #16
    136c:	af02      	add	r7, sp, #8
    136e:	6078      	str	r0, [r7, #4]
	if (enable){
    1370:	687b      	ldr	r3, [r7, #4]
    1372:	2b00      	cmp	r3, #0
    1374:	d024      	beq.n	13c0 <local_text_cursor+0x58>
		// activation clock CURSOR_TMR
		RCC->CURSOR_RCC_ENR|=CURSOR_RCC_EN_BIT; 
    1376:	4a27      	ldr	r2, [pc, #156]	; (1414 <local_text_cursor+0xac>)
    1378:	4b26      	ldr	r3, [pc, #152]	; (1414 <local_text_cursor+0xac>)
    137a:	69db      	ldr	r3, [r3, #28]
    137c:	f043 0304 	orr.w	r3, r3, #4
    1380:	61d3      	str	r3, [r2, #28]
		CURSOR_TMR->ARR=FTMR2_4/1000/2;
    1382:	4b25      	ldr	r3, [pc, #148]	; (1418 <local_text_cursor+0xb0>)
    1384:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    1388:	62da      	str	r2, [r3, #44]	; 0x2c
		CURSOR_TMR->PSC=1000;
    138a:	4b23      	ldr	r3, [pc, #140]	; (1418 <local_text_cursor+0xb0>)
    138c:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    1390:	629a      	str	r2, [r3, #40]	; 0x28
		CURSOR_TMR->CR1=BIT0|BIT7; // ARPE
    1392:	4b21      	ldr	r3, [pc, #132]	; (1418 <local_text_cursor+0xb0>)
    1394:	2281      	movs	r2, #129	; 0x81
    1396:	601a      	str	r2, [r3, #0]
		CURSOR_TMR->DIER=BIT0; // UIE
    1398:	4b1f      	ldr	r3, [pc, #124]	; (1418 <local_text_cursor+0xb0>)
    139a:	2201      	movs	r2, #1
    139c:	60da      	str	r2, [r3, #12]
		set_int_priority(IRQ_CURSOR_BLINK,15);
    139e:	201e      	movs	r0, #30
    13a0:	210f      	movs	r1, #15
    13a2:	f001 fae7 	bl	2974 <set_int_priority>
		CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
    13a6:	4a1c      	ldr	r2, [pc, #112]	; (1418 <local_text_cursor+0xb0>)
    13a8:	4b1b      	ldr	r3, [pc, #108]	; (1418 <local_text_cursor+0xb0>)
    13aa:	691b      	ldr	r3, [r3, #16]
    13ac:	f023 0301 	bic.w	r3, r3, #1
    13b0:	6113      	str	r3, [r2, #16]
		enable_interrupt(IRQ_CURSOR_BLINK);
    13b2:	201e      	movs	r0, #30
    13b4:	f001 fa22 	bl	27fc <enable_interrupt>
		cursor_blink=1;
    13b8:	4b18      	ldr	r3, [pc, #96]	; (141c <local_text_cursor+0xb4>)
    13ba:	2201      	movs	r2, #1
    13bc:	601a      	str	r2, [r3, #0]
    13be:	e026      	b.n	140e <local_text_cursor+0xa6>
	}else{
		disable_interrupt(IRQ_CURSOR_BLINK);
    13c0:	201e      	movs	r0, #30
    13c2:	f001 fa3f 	bl	2844 <disable_interrupt>
		if (cursor_visible){
    13c6:	4b16      	ldr	r3, [pc, #88]	; (1420 <local_text_cursor+0xb8>)
    13c8:	681b      	ldr	r3, [r3, #0]
    13ca:	2b00      	cmp	r3, #0
    13cc:	d016      	beq.n	13fc <local_text_cursor+0x94>
			gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    13ce:	4b15      	ldr	r3, [pc, #84]	; (1424 <local_text_cursor+0xbc>)
    13d0:	681a      	ldr	r2, [r3, #0]
    13d2:	4613      	mov	r3, r2
    13d4:	005b      	lsls	r3, r3, #1
    13d6:	4413      	add	r3, r2
    13d8:	005b      	lsls	r3, r3, #1
    13da:	4619      	mov	r1, r3
    13dc:	4b12      	ldr	r3, [pc, #72]	; (1428 <local_text_cursor+0xc0>)
    13de:	681b      	ldr	r3, [r3, #0]
    13e0:	00da      	lsls	r2, r3, #3
    13e2:	2302      	movs	r3, #2
    13e4:	9300      	str	r3, [sp, #0]
    13e6:	4608      	mov	r0, r1
    13e8:	4611      	mov	r1, r2
    13ea:	2206      	movs	r2, #6
    13ec:	2308      	movs	r3, #8
    13ee:	f000 fd41 	bl	1e74 <gdi_box>
			cursor_visible=~cursor_visible;
    13f2:	4b0b      	ldr	r3, [pc, #44]	; (1420 <local_text_cursor+0xb8>)
    13f4:	681b      	ldr	r3, [r3, #0]
    13f6:	43db      	mvns	r3, r3
    13f8:	4a09      	ldr	r2, [pc, #36]	; (1420 <local_text_cursor+0xb8>)
    13fa:	6013      	str	r3, [r2, #0]
		}
		CURSOR_TMR->DIER&=~BIT0;
    13fc:	4a06      	ldr	r2, [pc, #24]	; (1418 <local_text_cursor+0xb0>)
    13fe:	4b06      	ldr	r3, [pc, #24]	; (1418 <local_text_cursor+0xb0>)
    1400:	68db      	ldr	r3, [r3, #12]
    1402:	f023 0301 	bic.w	r3, r3, #1
    1406:	60d3      	str	r3, [r2, #12]
		cursor_blink=0;
    1408:	4b04      	ldr	r3, [pc, #16]	; (141c <local_text_cursor+0xb4>)
    140a:	2200      	movs	r2, #0
    140c:	601a      	str	r2, [r3, #0]
	}
}
    140e:	3708      	adds	r7, #8
    1410:	46bd      	mov	sp, r7
    1412:	bd80      	pop	{r7, pc}
    1414:	40021000 	.word	0x40021000
    1418:	40000800 	.word	0x40000800
    141c:	200000c4 	.word	0x200000c4
    1420:	200000c0 	.word	0x200000c0
    1424:	200000b0 	.word	0x200000b0
    1428:	200000b4 	.word	0x200000b4

0000142c <serial_cursor_crlf>:
/**********************************
 * fonctions console sérielle
 **********************************/
 
// cursor au début de la ligne suivante.
static void serial_cursor_crlf(){
    142c:	b480      	push	{r7}
    142e:	af00      	add	r7, sp, #0
	cursor_x=0;
    1430:	4b09      	ldr	r3, [pc, #36]	; (1458 <serial_cursor_crlf+0x2c>)
    1432:	2200      	movs	r2, #0
    1434:	601a      	str	r2, [r3, #0]
	if (cursor_y<(screen_height-1)){
    1436:	4b09      	ldr	r3, [pc, #36]	; (145c <serial_cursor_crlf+0x30>)
    1438:	681b      	ldr	r3, [r3, #0]
    143a:	1e5a      	subs	r2, r3, #1
    143c:	4b08      	ldr	r3, [pc, #32]	; (1460 <serial_cursor_crlf+0x34>)
    143e:	681b      	ldr	r3, [r3, #0]
    1440:	429a      	cmp	r2, r3
    1442:	dd04      	ble.n	144e <serial_cursor_crlf+0x22>
		cursor_y++;
    1444:	4b06      	ldr	r3, [pc, #24]	; (1460 <serial_cursor_crlf+0x34>)
    1446:	681b      	ldr	r3, [r3, #0]
    1448:	3301      	adds	r3, #1
    144a:	4a05      	ldr	r2, [pc, #20]	; (1460 <serial_cursor_crlf+0x34>)
    144c:	6013      	str	r3, [r2, #0]
	}
	
}
    144e:	46bd      	mov	sp, r7
    1450:	f85d 7b04 	ldr.w	r7, [sp], #4
    1454:	4770      	bx	lr
    1456:	bf00      	nop
    1458:	200000b0 	.word	0x200000b0
    145c:	200000bc 	.word	0x200000bc
    1460:	200000b4 	.word	0x200000b4

00001464 <serial_cursor_left>:

static void serial_cursor_left(){
    1464:	b480      	push	{r7}
    1466:	af00      	add	r7, sp, #0
	if (cursor_x){
    1468:	4b0d      	ldr	r3, [pc, #52]	; (14a0 <serial_cursor_left+0x3c>)
    146a:	681b      	ldr	r3, [r3, #0]
    146c:	2b00      	cmp	r3, #0
    146e:	d005      	beq.n	147c <serial_cursor_left+0x18>
		cursor_x--;
    1470:	4b0b      	ldr	r3, [pc, #44]	; (14a0 <serial_cursor_left+0x3c>)
    1472:	681b      	ldr	r3, [r3, #0]
    1474:	3b01      	subs	r3, #1
    1476:	4a0a      	ldr	r2, [pc, #40]	; (14a0 <serial_cursor_left+0x3c>)
    1478:	6013      	str	r3, [r2, #0]
    147a:	e00d      	b.n	1498 <serial_cursor_left+0x34>
	}else if (cursor_y){
    147c:	4b09      	ldr	r3, [pc, #36]	; (14a4 <serial_cursor_left+0x40>)
    147e:	681b      	ldr	r3, [r3, #0]
    1480:	2b00      	cmp	r3, #0
    1482:	d009      	beq.n	1498 <serial_cursor_left+0x34>
		cursor_x=screen_width-1;
    1484:	4b08      	ldr	r3, [pc, #32]	; (14a8 <serial_cursor_left+0x44>)
    1486:	681b      	ldr	r3, [r3, #0]
    1488:	3b01      	subs	r3, #1
    148a:	4a05      	ldr	r2, [pc, #20]	; (14a0 <serial_cursor_left+0x3c>)
    148c:	6013      	str	r3, [r2, #0]
		cursor_y--;
    148e:	4b05      	ldr	r3, [pc, #20]	; (14a4 <serial_cursor_left+0x40>)
    1490:	681b      	ldr	r3, [r3, #0]
    1492:	3b01      	subs	r3, #1
    1494:	4a03      	ldr	r2, [pc, #12]	; (14a4 <serial_cursor_left+0x40>)
    1496:	6013      	str	r3, [r2, #0]
	}
}
    1498:	46bd      	mov	sp, r7
    149a:	f85d 7b04 	ldr.w	r7, [sp], #4
    149e:	4770      	bx	lr
    14a0:	200000b0 	.word	0x200000b0
    14a4:	200000b4 	.word	0x200000b4
    14a8:	200000b8 	.word	0x200000b8

000014ac <serial_cursor_right>:

static void serial_cursor_right(){
    14ac:	b580      	push	{r7, lr}
    14ae:	af00      	add	r7, sp, #0
	cursor_x++;
    14b0:	4b06      	ldr	r3, [pc, #24]	; (14cc <serial_cursor_right+0x20>)
    14b2:	681b      	ldr	r3, [r3, #0]
    14b4:	3301      	adds	r3, #1
    14b6:	4a05      	ldr	r2, [pc, #20]	; (14cc <serial_cursor_right+0x20>)
    14b8:	6013      	str	r3, [r2, #0]
	if (cursor_x>=screen_width){
    14ba:	4b04      	ldr	r3, [pc, #16]	; (14cc <serial_cursor_right+0x20>)
    14bc:	681a      	ldr	r2, [r3, #0]
    14be:	4b04      	ldr	r3, [pc, #16]	; (14d0 <serial_cursor_right+0x24>)
    14c0:	681b      	ldr	r3, [r3, #0]
    14c2:	429a      	cmp	r2, r3
    14c4:	db01      	blt.n	14ca <serial_cursor_right+0x1e>
		serial_cursor_crlf();
    14c6:	f7ff ffb1 	bl	142c <serial_cursor_crlf>
	}
}
    14ca:	bd80      	pop	{r7, pc}
    14cc:	200000b0 	.word	0x200000b0
    14d0:	200000b8 	.word	0x200000b8

000014d4 <serial_putc>:

static void serial_putc(char c){
    14d4:	b580      	push	{r7, lr}
    14d6:	b082      	sub	sp, #8
    14d8:	af00      	add	r7, sp, #0
    14da:	4603      	mov	r3, r0
    14dc:	71fb      	strb	r3, [r7, #7]
	vt_putc(c);
    14de:	79fb      	ldrb	r3, [r7, #7]
    14e0:	4618      	mov	r0, r3
    14e2:	f002 fa2f 	bl	3944 <vt_putc>
	serial_cursor_right();
    14e6:	f7ff ffe1 	bl	14ac <serial_cursor_right>
}
    14ea:	3708      	adds	r7, #8
    14ec:	46bd      	mov	sp, r7
    14ee:	bd80      	pop	{r7, pc}

000014f0 <serial_crlf>:

static void serial_crlf(){
    14f0:	b580      	push	{r7, lr}
    14f2:	af00      	add	r7, sp, #0
	vt_putc(CR);
    14f4:	200d      	movs	r0, #13
    14f6:	f002 fa25 	bl	3944 <vt_putc>
	serial_cursor_crlf();
    14fa:	f7ff ff97 	bl	142c <serial_cursor_crlf>
}
    14fe:	bd80      	pop	{r7, pc}

00001500 <serial_clear_line>:

static void serial_clear_line(){
    1500:	b580      	push	{r7, lr}
    1502:	af00      	add	r7, sp, #0
	vt_clear_line(cursor_y+1);
    1504:	4b03      	ldr	r3, [pc, #12]	; (1514 <serial_clear_line+0x14>)
    1506:	681b      	ldr	r3, [r3, #0]
    1508:	3301      	adds	r3, #1
    150a:	4618      	mov	r0, r3
    150c:	f002 fa5a 	bl	39c4 <vt_clear_line>
}
    1510:	bd80      	pop	{r7, pc}
    1512:	bf00      	nop
    1514:	200000b4 	.word	0x200000b4

00001518 <serial_clear_screen>:

static void serial_clear_screen(){
    1518:	b580      	push	{r7, lr}
    151a:	af00      	add	r7, sp, #0
	vt_cls();
    151c:	f002 fa42 	bl	39a4 <vt_cls>
	cursor_home();
    1520:	f7ff fdec 	bl	10fc <cursor_home>
}
    1524:	bd80      	pop	{r7, pc}
    1526:	bf00      	nop

00001528 <queue_insert>:

//************************************************

static void queue_insert(char c){
    1528:	b480      	push	{r7}
    152a:	b083      	sub	sp, #12
    152c:	af00      	add	r7, sp, #0
    152e:	4603      	mov	r3, r0
    1530:	71fb      	strb	r3, [r7, #7]
		con.queue[con.head++]=c;
    1532:	4b0a      	ldr	r3, [pc, #40]	; (155c <queue_insert+0x34>)
    1534:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1536:	1c5a      	adds	r2, r3, #1
    1538:	4908      	ldr	r1, [pc, #32]	; (155c <queue_insert+0x34>)
    153a:	624a      	str	r2, [r1, #36]	; 0x24
    153c:	4a07      	ldr	r2, [pc, #28]	; (155c <queue_insert+0x34>)
    153e:	4413      	add	r3, r2
    1540:	79fa      	ldrb	r2, [r7, #7]
    1542:	705a      	strb	r2, [r3, #1]
		con.head&=CON_QUEUE_SIZE-1;
    1544:	4b05      	ldr	r3, [pc, #20]	; (155c <queue_insert+0x34>)
    1546:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1548:	f003 031f 	and.w	r3, r3, #31
    154c:	4a03      	ldr	r2, [pc, #12]	; (155c <queue_insert+0x34>)
    154e:	6253      	str	r3, [r2, #36]	; 0x24
}
    1550:	370c      	adds	r7, #12
    1552:	46bd      	mov	sp, r7
    1554:	f85d 7b04 	ldr.w	r7, [sp], #4
    1558:	4770      	bx	lr
    155a:	bf00      	nop
    155c:	200000fc 	.word	0x200000fc

00001560 <queue_getc>:

static char queue_getc(){
    1560:	b480      	push	{r7}
    1562:	b083      	sub	sp, #12
    1564:	af00      	add	r7, sp, #0
	char c=0;
    1566:	2300      	movs	r3, #0
    1568:	71fb      	strb	r3, [r7, #7]
	if (con.tail!=con.head){
    156a:	4b0e      	ldr	r3, [pc, #56]	; (15a4 <queue_getc+0x44>)
    156c:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    156e:	4b0d      	ldr	r3, [pc, #52]	; (15a4 <queue_getc+0x44>)
    1570:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1572:	429a      	cmp	r2, r3
    1574:	d00e      	beq.n	1594 <queue_getc+0x34>
		c=con.queue[con.tail++];
    1576:	4b0b      	ldr	r3, [pc, #44]	; (15a4 <queue_getc+0x44>)
    1578:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    157a:	1c5a      	adds	r2, r3, #1
    157c:	4909      	ldr	r1, [pc, #36]	; (15a4 <queue_getc+0x44>)
    157e:	628a      	str	r2, [r1, #40]	; 0x28
    1580:	4a08      	ldr	r2, [pc, #32]	; (15a4 <queue_getc+0x44>)
    1582:	4413      	add	r3, r2
    1584:	785b      	ldrb	r3, [r3, #1]
    1586:	71fb      	strb	r3, [r7, #7]
		con.tail&=CON_QUEUE_SIZE-1;
    1588:	4b06      	ldr	r3, [pc, #24]	; (15a4 <queue_getc+0x44>)
    158a:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    158c:	f003 031f 	and.w	r3, r3, #31
    1590:	4a04      	ldr	r2, [pc, #16]	; (15a4 <queue_getc+0x44>)
    1592:	6293      	str	r3, [r2, #40]	; 0x28
	}
	return c;
    1594:	79fb      	ldrb	r3, [r7, #7]
}
    1596:	4618      	mov	r0, r3
    1598:	370c      	adds	r7, #12
    159a:	46bd      	mov	sp, r7
    159c:	f85d 7b04 	ldr.w	r7, [sp], #4
    15a0:	4770      	bx	lr
    15a2:	bf00      	nop
    15a4:	200000fc 	.word	0x200000fc

000015a8 <con_queue_flush>:


void con_queue_flush(){
    15a8:	b480      	push	{r7}
    15aa:	af00      	add	r7, sp, #0
	con.tail=con.head=0;
    15ac:	2300      	movs	r3, #0
    15ae:	4a04      	ldr	r2, [pc, #16]	; (15c0 <con_queue_flush+0x18>)
    15b0:	6253      	str	r3, [r2, #36]	; 0x24
    15b2:	4a03      	ldr	r2, [pc, #12]	; (15c0 <con_queue_flush+0x18>)
    15b4:	6293      	str	r3, [r2, #40]	; 0x28
}
    15b6:	46bd      	mov	sp, r7
    15b8:	f85d 7b04 	ldr.w	r7, [sp], #4
    15bc:	4770      	bx	lr
    15be:	bf00      	nop
    15c0:	200000fc 	.word	0x200000fc

000015c4 <con_select>:

static const char PROMPT[]=" OK\n";

void con_select(console_dev_t dev){
    15c4:	b580      	push	{r7, lr}
    15c6:	b082      	sub	sp, #8
    15c8:	af00      	add	r7, sp, #0
    15ca:	4603      	mov	r3, r0
    15cc:	71fb      	strb	r3, [r7, #7]
	local_text_cursor(0);
    15ce:	2000      	movs	r0, #0
    15d0:	f7ff feca 	bl	1368 <local_text_cursor>
	kbd_enable(0);
    15d4:	2000      	movs	r0, #0
    15d6:	f000 fe33 	bl	2240 <kbd_enable>
	vt_rx_enable(0);
    15da:	2000      	movs	r0, #0
    15dc:	f002 fa22 	bl	3a24 <vt_rx_enable>
	con_queue_flush();
    15e0:	f7ff ffe2 	bl	15a8 <con_queue_flush>
	con.dev=dev;
    15e4:	4a21      	ldr	r2, [pc, #132]	; (166c <con_select+0xa8>)
    15e6:	79fb      	ldrb	r3, [r7, #7]
    15e8:	7013      	strb	r3, [r2, #0]
	cursor_home();
    15ea:	f7ff fd87 	bl	10fc <cursor_home>
	if (dev==LOCAL){
    15ee:	79fb      	ldrb	r3, [r7, #7]
    15f0:	2b00      	cmp	r3, #0
    15f2:	d11b      	bne.n	162c <con_select+0x68>
		screen_width=GDI_SCREEN_WIDTH;
    15f4:	4b1e      	ldr	r3, [pc, #120]	; (1670 <con_select+0xac>)
    15f6:	2235      	movs	r2, #53	; 0x35
    15f8:	601a      	str	r2, [r3, #0]
		screen_height=GDI_SCREEN_HEIGHT;
    15fa:	4b1e      	ldr	r3, [pc, #120]	; (1674 <con_select+0xb0>)
    15fc:	221e      	movs	r2, #30
    15fe:	601a      	str	r2, [r3, #0]
		con.putc=local_putc;
    1600:	4b1a      	ldr	r3, [pc, #104]	; (166c <con_select+0xa8>)
    1602:	4a1d      	ldr	r2, [pc, #116]	; (1678 <con_select+0xb4>)
    1604:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=local_clear_screen;
    1606:	4b19      	ldr	r3, [pc, #100]	; (166c <con_select+0xa8>)
    1608:	4a1c      	ldr	r2, [pc, #112]	; (167c <con_select+0xb8>)
    160a:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=local_del_back;
    160c:	4b17      	ldr	r3, [pc, #92]	; (166c <con_select+0xa8>)
    160e:	4a1c      	ldr	r2, [pc, #112]	; (1680 <con_select+0xbc>)
    1610:	639a      	str	r2, [r3, #56]	; 0x38
		con.clrln=local_clear_line;
    1612:	4b16      	ldr	r3, [pc, #88]	; (166c <con_select+0xa8>)
    1614:	4a1b      	ldr	r2, [pc, #108]	; (1684 <con_select+0xc0>)
    1616:	641a      	str	r2, [r3, #64]	; 0x40
		con.crlf=local_crlf;
    1618:	4b14      	ldr	r3, [pc, #80]	; (166c <con_select+0xa8>)
    161a:	4a1b      	ldr	r2, [pc, #108]	; (1688 <con_select+0xc4>)
    161c:	645a      	str	r2, [r3, #68]	; 0x44
		kbd_enable(1);
    161e:	2001      	movs	r0, #1
    1620:	f000 fe0e 	bl	2240 <kbd_enable>
		local_text_cursor(1);
    1624:	2001      	movs	r0, #1
    1626:	f7ff fe9f 	bl	1368 <local_text_cursor>
    162a:	e017      	b.n	165c <con_select+0x98>
	}else{
		screen_width=VT_SCREEN_WIDTH;
    162c:	4b10      	ldr	r3, [pc, #64]	; (1670 <con_select+0xac>)
    162e:	2250      	movs	r2, #80	; 0x50
    1630:	601a      	str	r2, [r3, #0]
		screen_height=VT_SCREEN_HEIGHT;
    1632:	4b10      	ldr	r3, [pc, #64]	; (1674 <con_select+0xb0>)
    1634:	2218      	movs	r2, #24
    1636:	601a      	str	r2, [r3, #0]
		con.putc=serial_putc;
    1638:	4b0c      	ldr	r3, [pc, #48]	; (166c <con_select+0xa8>)
    163a:	4a14      	ldr	r2, [pc, #80]	; (168c <con_select+0xc8>)
    163c:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=serial_clear_screen;
    163e:	4b0b      	ldr	r3, [pc, #44]	; (166c <con_select+0xa8>)
    1640:	4a13      	ldr	r2, [pc, #76]	; (1690 <con_select+0xcc>)
    1642:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=vt_del_back;
    1644:	4b09      	ldr	r3, [pc, #36]	; (166c <con_select+0xa8>)
    1646:	4a13      	ldr	r2, [pc, #76]	; (1694 <con_select+0xd0>)
    1648:	639a      	str	r2, [r3, #56]	; 0x38
		con.clrln=serial_clear_line;
    164a:	4b08      	ldr	r3, [pc, #32]	; (166c <con_select+0xa8>)
    164c:	4a12      	ldr	r2, [pc, #72]	; (1698 <con_select+0xd4>)
    164e:	641a      	str	r2, [r3, #64]	; 0x40
		con.crlf=serial_crlf;
    1650:	4b06      	ldr	r3, [pc, #24]	; (166c <con_select+0xa8>)
    1652:	4a12      	ldr	r2, [pc, #72]	; (169c <con_select+0xd8>)
    1654:	645a      	str	r2, [r3, #68]	; 0x44
		vt_rx_enable(1);
    1656:	2001      	movs	r0, #1
    1658:	f002 f9e4 	bl	3a24 <vt_rx_enable>
	}
	cls();
    165c:	f000 fa54 	bl	1b08 <cls>
	print(PROMPT);
    1660:	480f      	ldr	r0, [pc, #60]	; (16a0 <con_select+0xdc>)
    1662:	f000 f895 	bl	1790 <print>
}
    1666:	3708      	adds	r7, #8
    1668:	46bd      	mov	sp, r7
    166a:	bd80      	pop	{r7, pc}
    166c:	200000fc 	.word	0x200000fc
    1670:	200000b8 	.word	0x200000b8
    1674:	200000bc 	.word	0x200000bc
    1678:	000012c1 	.word	0x000012c1
    167c:	00001345 	.word	0x00001345
    1680:	00001261 	.word	0x00001261
    1684:	0000130d 	.word	0x0000130d
    1688:	0000116d 	.word	0x0000116d
    168c:	000014d5 	.word	0x000014d5
    1690:	00001519 	.word	0x00001519
    1694:	00003965 	.word	0x00003965
    1698:	00001501 	.word	0x00001501
    169c:	000014f1 	.word	0x000014f1
    16a0:	00003cec 	.word	0x00003cec

000016a4 <console_init>:

void console_init(console_dev_t dev){
    16a4:	b580      	push	{r7, lr}
    16a6:	b082      	sub	sp, #8
    16a8:	af00      	add	r7, sp, #0
    16aa:	4603      	mov	r3, r0
    16ac:	71fb      	strb	r3, [r7, #7]
	con.getc=queue_getc;
    16ae:	4b06      	ldr	r3, [pc, #24]	; (16c8 <console_init+0x24>)
    16b0:	4a06      	ldr	r2, [pc, #24]	; (16cc <console_init+0x28>)
    16b2:	631a      	str	r2, [r3, #48]	; 0x30
	con.insert=queue_insert;
    16b4:	4b04      	ldr	r3, [pc, #16]	; (16c8 <console_init+0x24>)
    16b6:	4a06      	ldr	r2, [pc, #24]	; (16d0 <console_init+0x2c>)
    16b8:	62da      	str	r2, [r3, #44]	; 0x2c
	con_select(dev);
    16ba:	79fb      	ldrb	r3, [r7, #7]
    16bc:	4618      	mov	r0, r3
    16be:	f7ff ff81 	bl	15c4 <con_select>
}
    16c2:	3708      	adds	r7, #8
    16c4:	46bd      	mov	sp, r7
    16c6:	bd80      	pop	{r7, pc}
    16c8:	200000fc 	.word	0x200000fc
    16cc:	00001561 	.word	0x00001561
    16d0:	00001529 	.word	0x00001529

000016d4 <conout>:


// envoie d'un caractère à la console
void conout(char c){
    16d4:	b580      	push	{r7, lr}
    16d6:	b082      	sub	sp, #8
    16d8:	af00      	add	r7, sp, #0
    16da:	4603      	mov	r3, r0
    16dc:	71fb      	strb	r3, [r7, #7]
	switch(c){
    16de:	79fb      	ldrb	r3, [r7, #7]
    16e0:	3b08      	subs	r3, #8
    16e2:	2b05      	cmp	r3, #5
    16e4:	d83b      	bhi.n	175e <conout+0x8a>
    16e6:	a201      	add	r2, pc, #4	; (adr r2, 16ec <conout+0x18>)
    16e8:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    16ec:	00001743 	.word	0x00001743
    16f0:	0000170d 	.word	0x0000170d
    16f4:	00001705 	.word	0x00001705
    16f8:	0000175f 	.word	0x0000175f
    16fc:	0000175f 	.word	0x0000175f
    1700:	00001705 	.word	0x00001705
		case CR:
		case '\n':
			con.crlf();
    1704:	4b1a      	ldr	r3, [pc, #104]	; (1770 <conout+0x9c>)
    1706:	6c5b      	ldr	r3, [r3, #68]	; 0x44
    1708:	4798      	blx	r3
			break;
    170a:	e02d      	b.n	1768 <conout+0x94>
		case TAB:
			con.putc(SPACE);
    170c:	4b18      	ldr	r3, [pc, #96]	; (1770 <conout+0x9c>)
    170e:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1710:	2020      	movs	r0, #32
    1712:	4798      	blx	r3
			if (!cursor_x){
    1714:	4b17      	ldr	r3, [pc, #92]	; (1774 <conout+0xa0>)
    1716:	681b      	ldr	r3, [r3, #0]
    1718:	2b00      	cmp	r3, #0
    171a:	d100      	bne.n	171e <conout+0x4a>
				break;
    171c:	e024      	b.n	1768 <conout+0x94>
			}
			while (cursor_x%tab_width){
    171e:	e003      	b.n	1728 <conout+0x54>
				con.putc(SPACE);
    1720:	4b13      	ldr	r3, [pc, #76]	; (1770 <conout+0x9c>)
    1722:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1724:	2020      	movs	r0, #32
    1726:	4798      	blx	r3
		case TAB:
			con.putc(SPACE);
			if (!cursor_x){
				break;
			}
			while (cursor_x%tab_width){
    1728:	4b12      	ldr	r3, [pc, #72]	; (1774 <conout+0xa0>)
    172a:	681b      	ldr	r3, [r3, #0]
    172c:	461a      	mov	r2, r3
    172e:	4b12      	ldr	r3, [pc, #72]	; (1778 <conout+0xa4>)
    1730:	681b      	ldr	r3, [r3, #0]
    1732:	fbb2 f1f3 	udiv	r1, r2, r3
    1736:	fb03 f301 	mul.w	r3, r3, r1
    173a:	1ad3      	subs	r3, r2, r3
    173c:	2b00      	cmp	r3, #0
    173e:	d1ef      	bne.n	1720 <conout+0x4c>
				con.putc(SPACE);
			}
			break;
    1740:	e012      	b.n	1768 <conout+0x94>
		case BS:
			if (cursor_x){
    1742:	4b0c      	ldr	r3, [pc, #48]	; (1774 <conout+0xa0>)
    1744:	681b      	ldr	r3, [r3, #0]
    1746:	2b00      	cmp	r3, #0
    1748:	d008      	beq.n	175c <conout+0x88>
				con.delete_back();
    174a:	4b09      	ldr	r3, [pc, #36]	; (1770 <conout+0x9c>)
    174c:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    174e:	4798      	blx	r3
				cursor_x--;
    1750:	4b08      	ldr	r3, [pc, #32]	; (1774 <conout+0xa0>)
    1752:	681b      	ldr	r3, [r3, #0]
    1754:	3b01      	subs	r3, #1
    1756:	4a07      	ldr	r2, [pc, #28]	; (1774 <conout+0xa0>)
    1758:	6013      	str	r3, [r2, #0]
			}
			break;
    175a:	e005      	b.n	1768 <conout+0x94>
    175c:	e004      	b.n	1768 <conout+0x94>
		default:
			con.putc(c);
    175e:	4b04      	ldr	r3, [pc, #16]	; (1770 <conout+0x9c>)
    1760:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1762:	79fa      	ldrb	r2, [r7, #7]
    1764:	4610      	mov	r0, r2
    1766:	4798      	blx	r3
	}
}
    1768:	3708      	adds	r7, #8
    176a:	46bd      	mov	sp, r7
    176c:	bd80      	pop	{r7, pc}
    176e:	bf00      	nop
    1770:	200000fc 	.word	0x200000fc
    1774:	200000b0 	.word	0x200000b0
    1778:	20000004 	.word	0x20000004

0000177c <conin>:


// réception d'un caractère de la console
char conin(){
    177c:	b580      	push	{r7, lr}
    177e:	af00      	add	r7, sp, #0
	return con.getc();
    1780:	4b02      	ldr	r3, [pc, #8]	; (178c <conin+0x10>)
    1782:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    1784:	4798      	blx	r3
    1786:	4603      	mov	r3, r0
}
    1788:	4618      	mov	r0, r3
    178a:	bd80      	pop	{r7, pc}
    178c:	200000fc 	.word	0x200000fc

00001790 <print>:

// imprime un chaîne sur la console
void print(const char *str){
    1790:	b580      	push	{r7, lr}
    1792:	b082      	sub	sp, #8
    1794:	af00      	add	r7, sp, #0
    1796:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
    1798:	e006      	b.n	17a8 <print+0x18>
    179a:	687b      	ldr	r3, [r7, #4]
    179c:	1c5a      	adds	r2, r3, #1
    179e:	607a      	str	r2, [r7, #4]
    17a0:	781b      	ldrb	r3, [r3, #0]
    17a2:	4618      	mov	r0, r3
    17a4:	f7ff ff96 	bl	16d4 <conout>
    17a8:	687b      	ldr	r3, [r7, #4]
    17aa:	781b      	ldrb	r3, [r3, #0]
    17ac:	2b00      	cmp	r3, #0
    17ae:	d1f4      	bne.n	179a <print+0xa>
}
    17b0:	3708      	adds	r7, #8
    17b2:	46bd      	mov	sp, r7
    17b4:	bd80      	pop	{r7, pc}
    17b6:	bf00      	nop

000017b8 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    17b8:	b580      	push	{r7, lr}
    17ba:	af00      	add	r7, sp, #0
	con.delete_back();
    17bc:	4b01      	ldr	r3, [pc, #4]	; (17c4 <delete_back+0xc>)
    17be:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    17c0:	4798      	blx	r3
}
    17c2:	bd80      	pop	{r7, pc}
    17c4:	200000fc 	.word	0x200000fc

000017c8 <beep>:

static void beep(){
    17c8:	b480      	push	{r7}
    17ca:	af00      	add	r7, sp, #0
}
    17cc:	46bd      	mov	sp, r7
    17ce:	f85d 7b04 	ldr.w	r7, [sp], #4
    17d2:	4770      	bx	lr

000017d4 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    17d4:	b580      	push	{r7, lr}
    17d6:	b084      	sub	sp, #16
    17d8:	af00      	add	r7, sp, #0
    17da:	6078      	str	r0, [r7, #4]
    17dc:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    17de:	2300      	movs	r3, #0
    17e0:	60fb      	str	r3, [r7, #12]
	char c=0;
    17e2:	2300      	movs	r3, #0
    17e4:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    17e6:	683b      	ldr	r3, [r7, #0]
    17e8:	3b01      	subs	r3, #1
    17ea:	603b      	str	r3, [r7, #0]
	if (buf_len>(screen_width-cursor_x-1)){
    17ec:	4b5b      	ldr	r3, [pc, #364]	; (195c <read_line+0x188>)
    17ee:	681a      	ldr	r2, [r3, #0]
    17f0:	4b5b      	ldr	r3, [pc, #364]	; (1960 <read_line+0x18c>)
    17f2:	681b      	ldr	r3, [r3, #0]
    17f4:	1ad3      	subs	r3, r2, r3
    17f6:	3b01      	subs	r3, #1
    17f8:	461a      	mov	r2, r3
    17fa:	683b      	ldr	r3, [r7, #0]
    17fc:	429a      	cmp	r2, r3
    17fe:	d206      	bcs.n	180e <read_line+0x3a>
		buf_len=screen_width-cursor_x-1;
    1800:	4b56      	ldr	r3, [pc, #344]	; (195c <read_line+0x188>)
    1802:	681a      	ldr	r2, [r3, #0]
    1804:	4b56      	ldr	r3, [pc, #344]	; (1960 <read_line+0x18c>)
    1806:	681b      	ldr	r3, [r3, #0]
    1808:	1ad3      	subs	r3, r2, r3
    180a:	3b01      	subs	r3, #1
    180c:	603b      	str	r3, [r7, #0]
	}
	while (c!=CR){
    180e:	e097      	b.n	1940 <read_line+0x16c>
			c=con.getc();
    1810:	4b54      	ldr	r3, [pc, #336]	; (1964 <read_line+0x190>)
    1812:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    1814:	4798      	blx	r3
    1816:	4603      	mov	r3, r0
    1818:	72fb      	strb	r3, [r7, #11]
			switch(c){
    181a:	7afb      	ldrb	r3, [r7, #11]
    181c:	2b18      	cmp	r3, #24
    181e:	d879      	bhi.n	1914 <read_line+0x140>
    1820:	a201      	add	r2, pc, #4	; (adr r2, 1828 <read_line+0x54>)
    1822:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1826:	bf00      	nop
    1828:	00001941 	.word	0x00001941
    182c:	00001915 	.word	0x00001915
    1830:	00001915 	.word	0x00001915
    1834:	00001915 	.word	0x00001915
    1838:	00001915 	.word	0x00001915
    183c:	00001905 	.word	0x00001905
    1840:	00001915 	.word	0x00001915
    1844:	00001915 	.word	0x00001915
    1848:	000018f1 	.word	0x000018f1
    184c:	00001911 	.word	0x00001911
    1850:	0000188d 	.word	0x0000188d
    1854:	00001915 	.word	0x00001915
    1858:	00001915 	.word	0x00001915
    185c:	0000188d 	.word	0x0000188d
    1860:	00001915 	.word	0x00001915
    1864:	00001915 	.word	0x00001915
    1868:	00001915 	.word	0x00001915
    186c:	00001915 	.word	0x00001915
    1870:	00001915 	.word	0x00001915
    1874:	00001915 	.word	0x00001915
    1878:	00001915 	.word	0x00001915
    187c:	000018a5 	.word	0x000018a5
    1880:	00001915 	.word	0x00001915
    1884:	000018b9 	.word	0x000018b9
    1888:	000018a5 	.word	0x000018a5
			case NUL:
				break;
			case CR:
			case LF:
				c=CR;
    188c:	230d      	movs	r3, #13
    188e:	72fb      	strb	r3, [r7, #11]
				con.crlf();
    1890:	4b34      	ldr	r3, [pc, #208]	; (1964 <read_line+0x190>)
    1892:	6c5b      	ldr	r3, [r3, #68]	; 0x44
    1894:	4798      	blx	r3
				break;
    1896:	e053      	b.n	1940 <read_line+0x16c>
			case CTRL_X:
			case CTRL_U: // efface la ligne
				while (line_len){con.delete_back();line_len--;}
    1898:	4b32      	ldr	r3, [pc, #200]	; (1964 <read_line+0x190>)
    189a:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    189c:	4798      	blx	r3
    189e:	68fb      	ldr	r3, [r7, #12]
    18a0:	3b01      	subs	r3, #1
    18a2:	60fb      	str	r3, [r7, #12]
    18a4:	68fb      	ldr	r3, [r7, #12]
    18a6:	2b00      	cmp	r3, #0
    18a8:	d1f6      	bne.n	1898 <read_line+0xc4>
				//con.clear_line(line_len);
				//line_len=0;
				break;
    18aa:	e049      	b.n	1940 <read_line+0x16c>
			case CTRL_W: // efacce le dernier mot
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
    18ac:	4b2d      	ldr	r3, [pc, #180]	; (1964 <read_line+0x190>)
    18ae:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    18b0:	4798      	blx	r3
					line_len--;
    18b2:	68fb      	ldr	r3, [r7, #12]
    18b4:	3b01      	subs	r3, #1
    18b6:	60fb      	str	r3, [r7, #12]
				while (line_len){con.delete_back();line_len--;}
				//con.clear_line(line_len);
				//line_len=0;
				break;
			case CTRL_W: // efacce le dernier mot
				while (line_len && (buffer[line_len-1]==SPACE)){
    18b8:	68fb      	ldr	r3, [r7, #12]
    18ba:	2b00      	cmp	r3, #0
    18bc:	d006      	beq.n	18cc <read_line+0xf8>
    18be:	68fb      	ldr	r3, [r7, #12]
    18c0:	3b01      	subs	r3, #1
    18c2:	687a      	ldr	r2, [r7, #4]
    18c4:	4413      	add	r3, r2
    18c6:	781b      	ldrb	r3, [r3, #0]
    18c8:	2b20      	cmp	r3, #32
    18ca:	d0ef      	beq.n	18ac <read_line+0xd8>
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    18cc:	e005      	b.n	18da <read_line+0x106>
					con.delete_back();
    18ce:	4b25      	ldr	r3, [pc, #148]	; (1964 <read_line+0x190>)
    18d0:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    18d2:	4798      	blx	r3
					line_len--;
    18d4:	68fb      	ldr	r3, [r7, #12]
    18d6:	3b01      	subs	r3, #1
    18d8:	60fb      	str	r3, [r7, #12]
			case CTRL_W: // efacce le dernier mot
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    18da:	68fb      	ldr	r3, [r7, #12]
    18dc:	2b00      	cmp	r3, #0
    18de:	d006      	beq.n	18ee <read_line+0x11a>
    18e0:	68fb      	ldr	r3, [r7, #12]
    18e2:	3b01      	subs	r3, #1
    18e4:	687a      	ldr	r2, [r7, #4]
    18e6:	4413      	add	r3, r2
    18e8:	781b      	ldrb	r3, [r3, #0]
    18ea:	2b20      	cmp	r3, #32
    18ec:	d1ef      	bne.n	18ce <read_line+0xfa>
					con.delete_back();
					line_len--;
				}
				break;
    18ee:	e027      	b.n	1940 <read_line+0x16c>
			case BS:
				if (line_len){
    18f0:	68fb      	ldr	r3, [r7, #12]
    18f2:	2b00      	cmp	r3, #0
    18f4:	d005      	beq.n	1902 <read_line+0x12e>
					con.delete_back();
    18f6:	4b1b      	ldr	r3, [pc, #108]	; (1964 <read_line+0x190>)
    18f8:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    18fa:	4798      	blx	r3
					line_len--;
    18fc:	68fb      	ldr	r3, [r7, #12]
    18fe:	3b01      	subs	r3, #1
    1900:	60fb      	str	r3, [r7, #12]
				}
				break;
    1902:	e01d      	b.n	1940 <read_line+0x16c>
			case CTRL_E: // efface l'écran
				con.cls();
    1904:	4b17      	ldr	r3, [pc, #92]	; (1964 <read_line+0x190>)
    1906:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    1908:	4798      	blx	r3
				line_len=0;
    190a:	2300      	movs	r3, #0
    190c:	60fb      	str	r3, [r7, #12]
				break;
    190e:	e017      	b.n	1940 <read_line+0x16c>
			case TAB:
				c=SPACE;
    1910:	2320      	movs	r3, #32
    1912:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    1914:	68fa      	ldr	r2, [r7, #12]
    1916:	683b      	ldr	r3, [r7, #0]
    1918:	429a      	cmp	r2, r3
    191a:	d20f      	bcs.n	193c <read_line+0x168>
    191c:	7afb      	ldrb	r3, [r7, #11]
    191e:	2b1f      	cmp	r3, #31
    1920:	d90c      	bls.n	193c <read_line+0x168>
					buffer[line_len++]=c;
    1922:	68fb      	ldr	r3, [r7, #12]
    1924:	1c5a      	adds	r2, r3, #1
    1926:	60fa      	str	r2, [r7, #12]
    1928:	687a      	ldr	r2, [r7, #4]
    192a:	4413      	add	r3, r2
    192c:	7afa      	ldrb	r2, [r7, #11]
    192e:	701a      	strb	r2, [r3, #0]
					con.putc(c);
    1930:	4b0c      	ldr	r3, [pc, #48]	; (1964 <read_line+0x190>)
    1932:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1934:	7afa      	ldrb	r2, [r7, #11]
    1936:	4610      	mov	r0, r2
    1938:	4798      	blx	r3
    193a:	e001      	b.n	1940 <read_line+0x16c>
				}else{
					beep();
    193c:	f7ff ff44 	bl	17c8 <beep>
	
	buf_len--;
	if (buf_len>(screen_width-cursor_x-1)){
		buf_len=screen_width-cursor_x-1;
	}
	while (c!=CR){
    1940:	7afb      	ldrb	r3, [r7, #11]
    1942:	2b0d      	cmp	r3, #13
    1944:	f47f af64 	bne.w	1810 <read_line+0x3c>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1948:	687a      	ldr	r2, [r7, #4]
    194a:	68fb      	ldr	r3, [r7, #12]
    194c:	4413      	add	r3, r2
    194e:	2200      	movs	r2, #0
    1950:	701a      	strb	r2, [r3, #0]
	return line_len;
    1952:	68fb      	ldr	r3, [r7, #12]
}
    1954:	4618      	mov	r0, r3
    1956:	3710      	adds	r7, #16
    1958:	46bd      	mov	sp, r7
    195a:	bd80      	pop	{r7, pc}
    195c:	200000b8 	.word	0x200000b8
    1960:	200000b0 	.word	0x200000b0
    1964:	200000fc 	.word	0x200000fc

00001968 <print_int>:

// imprime un entier
// i entier à imprimer
// base  numérique
void print_int(int i, unsigned base){
    1968:	b580      	push	{r7, lr}
    196a:	b08e      	sub	sp, #56	; 0x38
    196c:	af00      	add	r7, sp, #0
    196e:	6078      	str	r0, [r7, #4]
    1970:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    1972:	2301      	movs	r3, #1
    1974:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    1976:	2322      	movs	r3, #34	; 0x22
    1978:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    197a:	2300      	movs	r3, #0
    197c:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1980:	687b      	ldr	r3, [r7, #4]
    1982:	2b00      	cmp	r3, #0
    1984:	da05      	bge.n	1992 <print_int+0x2a>
    1986:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    198a:	637b      	str	r3, [r7, #52]	; 0x34
    198c:	687b      	ldr	r3, [r7, #4]
    198e:	425b      	negs	r3, r3
    1990:	607b      	str	r3, [r7, #4]
	while (i){
    1992:	e02c      	b.n	19ee <print_int+0x86>
		fmt[pos]=i%base+'0';
    1994:	687b      	ldr	r3, [r7, #4]
    1996:	683a      	ldr	r2, [r7, #0]
    1998:	fbb3 f2f2 	udiv	r2, r3, r2
    199c:	6839      	ldr	r1, [r7, #0]
    199e:	fb01 f202 	mul.w	r2, r1, r2
    19a2:	1a9b      	subs	r3, r3, r2
    19a4:	b2db      	uxtb	r3, r3
    19a6:	3330      	adds	r3, #48	; 0x30
    19a8:	b2d9      	uxtb	r1, r3
    19aa:	f107 020c 	add.w	r2, r7, #12
    19ae:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19b0:	4413      	add	r3, r2
    19b2:	460a      	mov	r2, r1
    19b4:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    19b6:	f107 020c 	add.w	r2, r7, #12
    19ba:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19bc:	4413      	add	r3, r2
    19be:	781b      	ldrb	r3, [r3, #0]
    19c0:	2b39      	cmp	r3, #57	; 0x39
    19c2:	d90c      	bls.n	19de <print_int+0x76>
    19c4:	f107 020c 	add.w	r2, r7, #12
    19c8:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19ca:	4413      	add	r3, r2
    19cc:	781b      	ldrb	r3, [r3, #0]
    19ce:	3307      	adds	r3, #7
    19d0:	b2d9      	uxtb	r1, r3
    19d2:	f107 020c 	add.w	r2, r7, #12
    19d6:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19d8:	4413      	add	r3, r2
    19da:	460a      	mov	r2, r1
    19dc:	701a      	strb	r2, [r3, #0]
		pos--;
    19de:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19e0:	3b01      	subs	r3, #1
    19e2:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    19e4:	687a      	ldr	r2, [r7, #4]
    19e6:	683b      	ldr	r3, [r7, #0]
    19e8:	fbb2 f3f3 	udiv	r3, r2, r3
    19ec:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    19ee:	687b      	ldr	r3, [r7, #4]
    19f0:	2b00      	cmp	r3, #0
    19f2:	d1cf      	bne.n	1994 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    19f4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19f6:	2b22      	cmp	r3, #34	; 0x22
    19f8:	d108      	bne.n	1a0c <print_int+0xa4>
    19fa:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19fc:	1e5a      	subs	r2, r3, #1
    19fe:	633a      	str	r2, [r7, #48]	; 0x30
    1a00:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1a04:	4413      	add	r3, r2
    1a06:	2230      	movs	r2, #48	; 0x30
    1a08:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    1a0c:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    1a0e:	2b00      	cmp	r3, #0
    1a10:	da08      	bge.n	1a24 <print_int+0xbc>
    1a12:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1a14:	1e5a      	subs	r2, r3, #1
    1a16:	633a      	str	r2, [r7, #48]	; 0x30
    1a18:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1a1c:	4413      	add	r3, r2
    1a1e:	222d      	movs	r2, #45	; 0x2d
    1a20:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    1a24:	f107 020c 	add.w	r2, r7, #12
    1a28:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1a2a:	4413      	add	r3, r2
    1a2c:	2220      	movs	r2, #32
    1a2e:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1a30:	f107 020c 	add.w	r2, r7, #12
    1a34:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1a36:	4413      	add	r3, r2
    1a38:	4618      	mov	r0, r3
    1a3a:	f7ff fea9 	bl	1790 <print>
}
    1a3e:	3738      	adds	r7, #56	; 0x38
    1a40:	46bd      	mov	sp, r7
    1a42:	bd80      	pop	{r7, pc}

00001a44 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    1a44:	b580      	push	{r7, lr}
    1a46:	b088      	sub	sp, #32
    1a48:	af00      	add	r7, sp, #0
    1a4a:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    1a4c:	230c      	movs	r3, #12
    1a4e:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    1a50:	2300      	movs	r3, #0
    1a52:	767b      	strb	r3, [r7, #25]
	while (u){
    1a54:	e026      	b.n	1aa4 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    1a56:	687b      	ldr	r3, [r7, #4]
    1a58:	b2db      	uxtb	r3, r3
    1a5a:	f003 030f 	and.w	r3, r3, #15
    1a5e:	b2db      	uxtb	r3, r3
    1a60:	3330      	adds	r3, #48	; 0x30
    1a62:	b2d9      	uxtb	r1, r3
    1a64:	f107 020c 	add.w	r2, r7, #12
    1a68:	69fb      	ldr	r3, [r7, #28]
    1a6a:	4413      	add	r3, r2
    1a6c:	460a      	mov	r2, r1
    1a6e:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1a70:	f107 020c 	add.w	r2, r7, #12
    1a74:	69fb      	ldr	r3, [r7, #28]
    1a76:	4413      	add	r3, r2
    1a78:	781b      	ldrb	r3, [r3, #0]
    1a7a:	2b39      	cmp	r3, #57	; 0x39
    1a7c:	d90c      	bls.n	1a98 <print_hex+0x54>
    1a7e:	f107 020c 	add.w	r2, r7, #12
    1a82:	69fb      	ldr	r3, [r7, #28]
    1a84:	4413      	add	r3, r2
    1a86:	781b      	ldrb	r3, [r3, #0]
    1a88:	3307      	adds	r3, #7
    1a8a:	b2d9      	uxtb	r1, r3
    1a8c:	f107 020c 	add.w	r2, r7, #12
    1a90:	69fb      	ldr	r3, [r7, #28]
    1a92:	4413      	add	r3, r2
    1a94:	460a      	mov	r2, r1
    1a96:	701a      	strb	r2, [r3, #0]
		pos--;
    1a98:	69fb      	ldr	r3, [r7, #28]
    1a9a:	3b01      	subs	r3, #1
    1a9c:	61fb      	str	r3, [r7, #28]
		u/=16;
    1a9e:	687b      	ldr	r3, [r7, #4]
    1aa0:	091b      	lsrs	r3, r3, #4
    1aa2:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    1aa4:	687b      	ldr	r3, [r7, #4]
    1aa6:	2b00      	cmp	r3, #0
    1aa8:	d1d5      	bne.n	1a56 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    1aaa:	69fb      	ldr	r3, [r7, #28]
    1aac:	2b0c      	cmp	r3, #12
    1aae:	d108      	bne.n	1ac2 <print_hex+0x7e>
    1ab0:	69fb      	ldr	r3, [r7, #28]
    1ab2:	1e5a      	subs	r2, r3, #1
    1ab4:	61fa      	str	r2, [r7, #28]
    1ab6:	f107 0220 	add.w	r2, r7, #32
    1aba:	4413      	add	r3, r2
    1abc:	2230      	movs	r2, #48	; 0x30
    1abe:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    1ac2:	69fb      	ldr	r3, [r7, #28]
    1ac4:	1e5a      	subs	r2, r3, #1
    1ac6:	61fa      	str	r2, [r7, #28]
    1ac8:	f107 0220 	add.w	r2, r7, #32
    1acc:	4413      	add	r3, r2
    1ace:	2278      	movs	r2, #120	; 0x78
    1ad0:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    1ad4:	69fb      	ldr	r3, [r7, #28]
    1ad6:	1e5a      	subs	r2, r3, #1
    1ad8:	61fa      	str	r2, [r7, #28]
    1ada:	f107 0220 	add.w	r2, r7, #32
    1ade:	4413      	add	r3, r2
    1ae0:	2230      	movs	r2, #48	; 0x30
    1ae2:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    1ae6:	f107 020c 	add.w	r2, r7, #12
    1aea:	69fb      	ldr	r3, [r7, #28]
    1aec:	4413      	add	r3, r2
    1aee:	2220      	movs	r2, #32
    1af0:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1af2:	f107 020c 	add.w	r2, r7, #12
    1af6:	69fb      	ldr	r3, [r7, #28]
    1af8:	4413      	add	r3, r2
    1afa:	4618      	mov	r0, r3
    1afc:	f7ff fe48 	bl	1790 <print>
}
    1b00:	3720      	adds	r7, #32
    1b02:	46bd      	mov	sp, r7
    1b04:	bd80      	pop	{r7, pc}
    1b06:	bf00      	nop

00001b08 <cls>:

void cls(){
    1b08:	b580      	push	{r7, lr}
    1b0a:	af00      	add	r7, sp, #0
	con.cls();
    1b0c:	4b01      	ldr	r3, [pc, #4]	; (1b14 <cls+0xc>)
    1b0e:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    1b10:	4798      	blx	r3
}
    1b12:	bd80      	pop	{r7, pc}
    1b14:	200000fc 	.word	0x200000fc

00001b18 <TIM4_handler>:

// interruption clignotement
// curseur texte
void CURSOR_blink_handler(){
    1b18:	b580      	push	{r7, lr}
    1b1a:	b082      	sub	sp, #8
    1b1c:	af02      	add	r7, sp, #8
	//CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
	if (CURSOR_TMR->SR&BIT0){ // UIF
    1b1e:	4b12      	ldr	r3, [pc, #72]	; (1b68 <TIM4_handler+0x50>)
    1b20:	691b      	ldr	r3, [r3, #16]
    1b22:	f003 0301 	and.w	r3, r3, #1
    1b26:	2b00      	cmp	r3, #0
    1b28:	d01c      	beq.n	1b64 <TIM4_handler+0x4c>
		CURSOR_TMR->SR&=~BIT0;
    1b2a:	4a0f      	ldr	r2, [pc, #60]	; (1b68 <TIM4_handler+0x50>)
    1b2c:	4b0e      	ldr	r3, [pc, #56]	; (1b68 <TIM4_handler+0x50>)
    1b2e:	691b      	ldr	r3, [r3, #16]
    1b30:	f023 0301 	bic.w	r3, r3, #1
    1b34:	6113      	str	r3, [r2, #16]
		gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    1b36:	4b0d      	ldr	r3, [pc, #52]	; (1b6c <TIM4_handler+0x54>)
    1b38:	681a      	ldr	r2, [r3, #0]
    1b3a:	4613      	mov	r3, r2
    1b3c:	005b      	lsls	r3, r3, #1
    1b3e:	4413      	add	r3, r2
    1b40:	005b      	lsls	r3, r3, #1
    1b42:	4619      	mov	r1, r3
    1b44:	4b0a      	ldr	r3, [pc, #40]	; (1b70 <TIM4_handler+0x58>)
    1b46:	681b      	ldr	r3, [r3, #0]
    1b48:	00da      	lsls	r2, r3, #3
    1b4a:	2302      	movs	r3, #2
    1b4c:	9300      	str	r3, [sp, #0]
    1b4e:	4608      	mov	r0, r1
    1b50:	4611      	mov	r1, r2
    1b52:	2206      	movs	r2, #6
    1b54:	2308      	movs	r3, #8
    1b56:	f000 f98d 	bl	1e74 <gdi_box>
		cursor_visible=~cursor_visible;
    1b5a:	4b06      	ldr	r3, [pc, #24]	; (1b74 <TIM4_handler+0x5c>)
    1b5c:	681b      	ldr	r3, [r3, #0]
    1b5e:	43db      	mvns	r3, r3
    1b60:	4a04      	ldr	r2, [pc, #16]	; (1b74 <TIM4_handler+0x5c>)
    1b62:	6013      	str	r3, [r2, #0]
	}
}
    1b64:	46bd      	mov	sp, r7
    1b66:	bd80      	pop	{r7, pc}
    1b68:	40000800 	.word	0x40000800
    1b6c:	200000b0 	.word	0x200000b0
    1b70:	200000b4 	.word	0x200000b4
    1b74:	200000c0 	.word	0x200000c0

00001b78 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    1b78:	b480      	push	{r7}
    1b7a:	af00      	add	r7, sp, #0
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
    1b7c:	4b13      	ldr	r3, [pc, #76]	; (1bcc <flash_enable+0x54>)
    1b7e:	681b      	ldr	r3, [r3, #0]
    1b80:	f003 0301 	and.w	r3, r3, #1
    1b84:	2b00      	cmp	r3, #0
    1b86:	d10c      	bne.n	1ba2 <flash_enable+0x2a>
		RCC->CR|=RCC_CR_HSION;
    1b88:	4a10      	ldr	r2, [pc, #64]	; (1bcc <flash_enable+0x54>)
    1b8a:	4b10      	ldr	r3, [pc, #64]	; (1bcc <flash_enable+0x54>)
    1b8c:	681b      	ldr	r3, [r3, #0]
    1b8e:	f043 0301 	orr.w	r3, r3, #1
    1b92:	6013      	str	r3, [r2, #0]
		while (!(RCC->CR&RCC_CR_HSIRDY));
    1b94:	bf00      	nop
    1b96:	4b0d      	ldr	r3, [pc, #52]	; (1bcc <flash_enable+0x54>)
    1b98:	681b      	ldr	r3, [r3, #0]
    1b9a:	f003 0302 	and.w	r3, r3, #2
    1b9e:	2b00      	cmp	r3, #0
    1ba0:	d0f9      	beq.n	1b96 <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    1ba2:	4b0b      	ldr	r3, [pc, #44]	; (1bd0 <flash_enable+0x58>)
    1ba4:	4a0b      	ldr	r2, [pc, #44]	; (1bd4 <flash_enable+0x5c>)
    1ba6:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    1ba8:	4b09      	ldr	r3, [pc, #36]	; (1bd0 <flash_enable+0x58>)
    1baa:	4a0b      	ldr	r2, [pc, #44]	; (1bd8 <flash_enable+0x60>)
    1bac:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    1bae:	4b08      	ldr	r3, [pc, #32]	; (1bd0 <flash_enable+0x58>)
    1bb0:	691b      	ldr	r3, [r3, #16]
    1bb2:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1bb6:	2b00      	cmp	r3, #0
    1bb8:	bf0c      	ite	eq
    1bba:	2301      	moveq	r3, #1
    1bbc:	2300      	movne	r3, #0
    1bbe:	b2db      	uxtb	r3, r3
}
    1bc0:	4618      	mov	r0, r3
    1bc2:	46bd      	mov	sp, r7
    1bc4:	f85d 7b04 	ldr.w	r7, [sp], #4
    1bc8:	4770      	bx	lr
    1bca:	bf00      	nop
    1bcc:	40021000 	.word	0x40021000
    1bd0:	40022000 	.word	0x40022000
    1bd4:	45670123 	.word	0x45670123
    1bd8:	cdef89ab 	.word	0xcdef89ab

00001bdc <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    1bdc:	b480      	push	{r7}
    1bde:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    1be0:	4a04      	ldr	r2, [pc, #16]	; (1bf4 <flash_disable+0x18>)
    1be2:	4b04      	ldr	r3, [pc, #16]	; (1bf4 <flash_disable+0x18>)
    1be4:	691b      	ldr	r3, [r3, #16]
    1be6:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    1bea:	6113      	str	r3, [r2, #16]
}
    1bec:	46bd      	mov	sp, r7
    1bee:	f85d 7b04 	ldr.w	r7, [sp], #4
    1bf2:	4770      	bx	lr
    1bf4:	40022000 	.word	0x40022000

00001bf8 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1bf8:	b480      	push	{r7}
    1bfa:	b083      	sub	sp, #12
    1bfc:	af00      	add	r7, sp, #0
    1bfe:	6078      	str	r0, [r7, #4]
    1c00:	460b      	mov	r3, r1
    1c02:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    1c04:	4b1d      	ldr	r3, [pc, #116]	; (1c7c <flash_write+0x84>)
    1c06:	691b      	ldr	r3, [r3, #16]
    1c08:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1c0c:	2b00      	cmp	r3, #0
    1c0e:	d105      	bne.n	1c1c <flash_write+0x24>
    1c10:	687b      	ldr	r3, [r7, #4]
    1c12:	881b      	ldrh	r3, [r3, #0]
    1c14:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1c18:	4293      	cmp	r3, r2
    1c1a:	d001      	beq.n	1c20 <flash_write+0x28>
    1c1c:	2300      	movs	r3, #0
    1c1e:	e027      	b.n	1c70 <flash_write+0x78>
	while (_flash_busy);
    1c20:	bf00      	nop
    1c22:	4b16      	ldr	r3, [pc, #88]	; (1c7c <flash_write+0x84>)
    1c24:	68db      	ldr	r3, [r3, #12]
    1c26:	f003 0301 	and.w	r3, r3, #1
    1c2a:	2b00      	cmp	r3, #0
    1c2c:	d1f9      	bne.n	1c22 <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1c2e:	4a13      	ldr	r2, [pc, #76]	; (1c7c <flash_write+0x84>)
    1c30:	4b12      	ldr	r3, [pc, #72]	; (1c7c <flash_write+0x84>)
    1c32:	68db      	ldr	r3, [r3, #12]
    1c34:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1c38:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    1c3a:	4b10      	ldr	r3, [pc, #64]	; (1c7c <flash_write+0x84>)
    1c3c:	2201      	movs	r2, #1
    1c3e:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    1c40:	687b      	ldr	r3, [r7, #4]
    1c42:	887a      	ldrh	r2, [r7, #2]
    1c44:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    1c46:	bf00      	nop
    1c48:	4b0c      	ldr	r3, [pc, #48]	; (1c7c <flash_write+0x84>)
    1c4a:	68db      	ldr	r3, [r3, #12]
    1c4c:	f003 0301 	and.w	r3, r3, #1
    1c50:	2b00      	cmp	r3, #0
    1c52:	d005      	beq.n	1c60 <flash_write+0x68>
    1c54:	4b09      	ldr	r3, [pc, #36]	; (1c7c <flash_write+0x84>)
    1c56:	68db      	ldr	r3, [r3, #12]
    1c58:	f003 0320 	and.w	r3, r3, #32
    1c5c:	2b00      	cmp	r3, #0
    1c5e:	d0f3      	beq.n	1c48 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    1c60:	687b      	ldr	r3, [r7, #4]
    1c62:	881b      	ldrh	r3, [r3, #0]
    1c64:	887a      	ldrh	r2, [r7, #2]
    1c66:	429a      	cmp	r2, r3
    1c68:	bf0c      	ite	eq
    1c6a:	2301      	moveq	r3, #1
    1c6c:	2300      	movne	r3, #0
    1c6e:	b2db      	uxtb	r3, r3
}
    1c70:	4618      	mov	r0, r3
    1c72:	370c      	adds	r7, #12
    1c74:	46bd      	mov	sp, r7
    1c76:	f85d 7b04 	ldr.w	r7, [sp], #4
    1c7a:	4770      	bx	lr
    1c7c:	40022000 	.word	0x40022000

00001c80 <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    1c80:	b480      	push	{r7}
    1c82:	b087      	sub	sp, #28
    1c84:	af00      	add	r7, sp, #0
    1c86:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    1c88:	4b27      	ldr	r3, [pc, #156]	; (1d28 <flash_erase_page+0xa8>)
    1c8a:	691b      	ldr	r3, [r3, #16]
    1c8c:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1c90:	2b00      	cmp	r3, #0
    1c92:	d001      	beq.n	1c98 <flash_erase_page+0x18>
    1c94:	2300      	movs	r3, #0
    1c96:	e040      	b.n	1d1a <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1c98:	4a23      	ldr	r2, [pc, #140]	; (1d28 <flash_erase_page+0xa8>)
    1c9a:	4b23      	ldr	r3, [pc, #140]	; (1d28 <flash_erase_page+0xa8>)
    1c9c:	68db      	ldr	r3, [r3, #12]
    1c9e:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1ca2:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    1ca4:	687b      	ldr	r3, [r7, #4]
    1ca6:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    1caa:	f023 0303 	bic.w	r3, r3, #3
    1cae:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    1cb0:	4b1d      	ldr	r3, [pc, #116]	; (1d28 <flash_erase_page+0xa8>)
    1cb2:	2202      	movs	r2, #2
    1cb4:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    1cb6:	4a1c      	ldr	r2, [pc, #112]	; (1d28 <flash_erase_page+0xa8>)
    1cb8:	687b      	ldr	r3, [r7, #4]
    1cba:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    1cbc:	4a1a      	ldr	r2, [pc, #104]	; (1d28 <flash_erase_page+0xa8>)
    1cbe:	4b1a      	ldr	r3, [pc, #104]	; (1d28 <flash_erase_page+0xa8>)
    1cc0:	691b      	ldr	r3, [r3, #16]
    1cc2:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1cc6:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    1cc8:	bf00      	nop
    1cca:	4b17      	ldr	r3, [pc, #92]	; (1d28 <flash_erase_page+0xa8>)
    1ccc:	68db      	ldr	r3, [r3, #12]
    1cce:	f003 0301 	and.w	r3, r3, #1
    1cd2:	2b00      	cmp	r3, #0
    1cd4:	d005      	beq.n	1ce2 <flash_erase_page+0x62>
    1cd6:	4b14      	ldr	r3, [pc, #80]	; (1d28 <flash_erase_page+0xa8>)
    1cd8:	68db      	ldr	r3, [r3, #12]
    1cda:	f003 0320 	and.w	r3, r3, #32
    1cde:	2b00      	cmp	r3, #0
    1ce0:	d0f3      	beq.n	1cca <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    1ce2:	687b      	ldr	r3, [r7, #4]
    1ce4:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    1ce6:	2300      	movs	r3, #0
    1ce8:	60fb      	str	r3, [r7, #12]
    1cea:	e00c      	b.n	1d06 <flash_erase_page+0x86>
		u32=*adr++;
    1cec:	697b      	ldr	r3, [r7, #20]
    1cee:	1d1a      	adds	r2, r3, #4
    1cf0:	617a      	str	r2, [r7, #20]
    1cf2:	681b      	ldr	r3, [r3, #0]
    1cf4:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    1cf6:	693b      	ldr	r3, [r7, #16]
    1cf8:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1cfc:	d000      	beq.n	1d00 <flash_erase_page+0x80>
    1cfe:	e005      	b.n	1d0c <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    1d00:	68fb      	ldr	r3, [r7, #12]
    1d02:	3301      	adds	r3, #1
    1d04:	60fb      	str	r3, [r7, #12]
    1d06:	68fb      	ldr	r3, [r7, #12]
    1d08:	2bff      	cmp	r3, #255	; 0xff
    1d0a:	ddef      	ble.n	1cec <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    1d0c:	693b      	ldr	r3, [r7, #16]
    1d0e:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1d12:	bf0c      	ite	eq
    1d14:	2301      	moveq	r3, #1
    1d16:	2300      	movne	r3, #0
    1d18:	b2db      	uxtb	r3, r3
}
    1d1a:	4618      	mov	r0, r3
    1d1c:	371c      	adds	r7, #28
    1d1e:	46bd      	mov	sp, r7
    1d20:	f85d 7b04 	ldr.w	r7, [sp], #4
    1d24:	4770      	bx	lr
    1d26:	bf00      	nop
    1d28:	40022000 	.word	0x40022000

00001d2c <gdi_clear_screen>:
 * 
 */

#include "gdi.h"

void gdi_clear_screen(){
    1d2c:	b480      	push	{r7}
    1d2e:	b083      	sub	sp, #12
    1d30:	af00      	add	r7, sp, #0
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    1d32:	2300      	movs	r3, #0
    1d34:	607b      	str	r3, [r7, #4]
    1d36:	e006      	b.n	1d46 <gdi_clear_screen+0x1a>
		video_buffer[i++]=0;
    1d38:	687b      	ldr	r3, [r7, #4]
    1d3a:	1c5a      	adds	r2, r3, #1
    1d3c:	607a      	str	r2, [r7, #4]
    1d3e:	4a06      	ldr	r2, [pc, #24]	; (1d58 <gdi_clear_screen+0x2c>)
    1d40:	2100      	movs	r1, #0
    1d42:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

#include "gdi.h"

void gdi_clear_screen(){
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    1d46:	687b      	ldr	r3, [r7, #4]
    1d48:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1d4c:	dbf4      	blt.n	1d38 <gdi_clear_screen+0xc>
		video_buffer[i++]=0;
	}
}
    1d4e:	370c      	adds	r7, #12
    1d50:	46bd      	mov	sp, r7
    1d52:	f85d 7b04 	ldr.w	r7, [sp], #4
    1d56:	4770      	bx	lr
    1d58:	20000148 	.word	0x20000148

00001d5c <gdi_scroll_up>:

// glisse vers le haut de n lignes.
void gdi_scroll_up(unsigned n){
    1d5c:	b580      	push	{r7, lr}
    1d5e:	b084      	sub	sp, #16
    1d60:	af00      	add	r7, sp, #0
    1d62:	6078      	str	r0, [r7, #4]
	int i,j=0;
    1d64:	2300      	movs	r3, #0
    1d66:	60bb      	str	r3, [r7, #8]
	if (n>=VRES){gdi_clear_screen();return;}
    1d68:	687b      	ldr	r3, [r7, #4]
    1d6a:	2bef      	cmp	r3, #239	; 0xef
    1d6c:	d902      	bls.n	1d74 <gdi_scroll_up+0x18>
    1d6e:	f7ff ffdd 	bl	1d2c <gdi_clear_screen>
    1d72:	e02a      	b.n	1dca <gdi_scroll_up+0x6e>
	for (i=n*ROW_SIZE;i<ROW_SIZE*VRES;){
    1d74:	687a      	ldr	r2, [r7, #4]
    1d76:	4613      	mov	r3, r2
    1d78:	009b      	lsls	r3, r3, #2
    1d7a:	4413      	add	r3, r2
    1d7c:	009b      	lsls	r3, r3, #2
    1d7e:	60fb      	str	r3, [r7, #12]
    1d80:	e00b      	b.n	1d9a <gdi_scroll_up+0x3e>
		video_buffer[j++]=video_buffer[i++];
    1d82:	68bb      	ldr	r3, [r7, #8]
    1d84:	1c5a      	adds	r2, r3, #1
    1d86:	60ba      	str	r2, [r7, #8]
    1d88:	68fa      	ldr	r2, [r7, #12]
    1d8a:	1c51      	adds	r1, r2, #1
    1d8c:	60f9      	str	r1, [r7, #12]
    1d8e:	4910      	ldr	r1, [pc, #64]	; (1dd0 <gdi_scroll_up+0x74>)
    1d90:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    1d94:	4a0e      	ldr	r2, [pc, #56]	; (1dd0 <gdi_scroll_up+0x74>)
    1d96:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut de n lignes.
void gdi_scroll_up(unsigned n){
	int i,j=0;
	if (n>=VRES){gdi_clear_screen();return;}
	for (i=n*ROW_SIZE;i<ROW_SIZE*VRES;){
    1d9a:	68fb      	ldr	r3, [r7, #12]
    1d9c:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1da0:	dbef      	blt.n	1d82 <gdi_scroll_up+0x26>
		video_buffer[j++]=video_buffer[i++];
	}
	// efface bas de l'écran
	for (i=ROW_SIZE*VRES-n*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1da2:	687a      	ldr	r2, [r7, #4]
    1da4:	4613      	mov	r3, r2
    1da6:	009b      	lsls	r3, r3, #2
    1da8:	4413      	add	r3, r2
    1daa:	009b      	lsls	r3, r3, #2
    1dac:	f5c3 5396 	rsb	r3, r3, #4800	; 0x12c0
    1db0:	60fb      	str	r3, [r7, #12]
    1db2:	e006      	b.n	1dc2 <gdi_scroll_up+0x66>
		video_buffer[i++]=0;
    1db4:	68fb      	ldr	r3, [r7, #12]
    1db6:	1c5a      	adds	r2, r3, #1
    1db8:	60fa      	str	r2, [r7, #12]
    1dba:	4a05      	ldr	r2, [pc, #20]	; (1dd0 <gdi_scroll_up+0x74>)
    1dbc:	2100      	movs	r1, #0
    1dbe:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	if (n>=VRES){gdi_clear_screen();return;}
	for (i=n*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	// efface bas de l'écran
	for (i=ROW_SIZE*VRES-n*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1dc2:	68fb      	ldr	r3, [r7, #12]
    1dc4:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1dc8:	dbf4      	blt.n	1db4 <gdi_scroll_up+0x58>
		video_buffer[i++]=0;
	}
}
    1dca:	3710      	adds	r7, #16
    1dcc:	46bd      	mov	sp, r7
    1dce:	bd80      	pop	{r7, pc}
    1dd0:	20000148 	.word	0x20000148

00001dd4 <gdi_bit_op>:

void gdi_bit_op(int x, int y, bitop_e op){
    1dd4:	b480      	push	{r7}
    1dd6:	b087      	sub	sp, #28
    1dd8:	af00      	add	r7, sp, #0
    1dda:	60f8      	str	r0, [r7, #12]
    1ddc:	60b9      	str	r1, [r7, #8]
    1dde:	4613      	mov	r3, r2
    1de0:	71fb      	strb	r3, [r7, #7]
	uint16_t bit;
	int offset=y*ROW_SIZE+(x>>4);
    1de2:	68ba      	ldr	r2, [r7, #8]
    1de4:	4613      	mov	r3, r2
    1de6:	009b      	lsls	r3, r3, #2
    1de8:	4413      	add	r3, r2
    1dea:	009b      	lsls	r3, r3, #2
    1dec:	461a      	mov	r2, r3
    1dee:	68fb      	ldr	r3, [r7, #12]
    1df0:	111b      	asrs	r3, r3, #4
    1df2:	4413      	add	r3, r2
    1df4:	617b      	str	r3, [r7, #20]
	bit=1<<(15-(x&15));
    1df6:	68fb      	ldr	r3, [r7, #12]
    1df8:	43db      	mvns	r3, r3
    1dfa:	f003 030f 	and.w	r3, r3, #15
    1dfe:	2201      	movs	r2, #1
    1e00:	fa02 f303 	lsl.w	r3, r2, r3
    1e04:	827b      	strh	r3, [r7, #18]
	switch (op){
    1e06:	79fb      	ldrb	r3, [r7, #7]
    1e08:	2b01      	cmp	r3, #1
    1e0a:	d013      	beq.n	1e34 <gdi_bit_op+0x60>
    1e0c:	2b02      	cmp	r3, #2
    1e0e:	d01d      	beq.n	1e4c <gdi_bit_op+0x78>
    1e10:	2b00      	cmp	r3, #0
    1e12:	d127      	bne.n	1e64 <gdi_bit_op+0x90>
	case BLACK_BIT:
		video_buffer[offset]&=~bit;
    1e14:	4a16      	ldr	r2, [pc, #88]	; (1e70 <gdi_bit_op+0x9c>)
    1e16:	697b      	ldr	r3, [r7, #20]
    1e18:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1e1c:	b29a      	uxth	r2, r3
    1e1e:	8a7b      	ldrh	r3, [r7, #18]
    1e20:	43db      	mvns	r3, r3
    1e22:	b29b      	uxth	r3, r3
    1e24:	4013      	ands	r3, r2
    1e26:	b29b      	uxth	r3, r3
    1e28:	b299      	uxth	r1, r3
    1e2a:	4a11      	ldr	r2, [pc, #68]	; (1e70 <gdi_bit_op+0x9c>)
    1e2c:	697b      	ldr	r3, [r7, #20]
    1e2e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1e32:	e017      	b.n	1e64 <gdi_bit_op+0x90>
	case WHITE_BIT:
		video_buffer[offset]|=bit;
    1e34:	4a0e      	ldr	r2, [pc, #56]	; (1e70 <gdi_bit_op+0x9c>)
    1e36:	697b      	ldr	r3, [r7, #20]
    1e38:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1e3c:	8a7b      	ldrh	r3, [r7, #18]
    1e3e:	4313      	orrs	r3, r2
    1e40:	b299      	uxth	r1, r3
    1e42:	4a0b      	ldr	r2, [pc, #44]	; (1e70 <gdi_bit_op+0x9c>)
    1e44:	697b      	ldr	r3, [r7, #20]
    1e46:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1e4a:	e00b      	b.n	1e64 <gdi_bit_op+0x90>
	case XOR_BIT:
		video_buffer[offset]^=bit;
    1e4c:	4a08      	ldr	r2, [pc, #32]	; (1e70 <gdi_bit_op+0x9c>)
    1e4e:	697b      	ldr	r3, [r7, #20]
    1e50:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1e54:	8a7b      	ldrh	r3, [r7, #18]
    1e56:	4053      	eors	r3, r2
    1e58:	b299      	uxth	r1, r3
    1e5a:	4a05      	ldr	r2, [pc, #20]	; (1e70 <gdi_bit_op+0x9c>)
    1e5c:	697b      	ldr	r3, [r7, #20]
    1e5e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1e62:	bf00      	nop
	}
}
    1e64:	371c      	adds	r7, #28
    1e66:	46bd      	mov	sp, r7
    1e68:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e6c:	4770      	bx	lr
    1e6e:	bf00      	nop
    1e70:	20000148 	.word	0x20000148

00001e74 <gdi_box>:

void gdi_box(int x, int y, int w, int h, bitop_e op){
    1e74:	b580      	push	{r7, lr}
    1e76:	b086      	sub	sp, #24
    1e78:	af00      	add	r7, sp, #0
    1e7a:	60f8      	str	r0, [r7, #12]
    1e7c:	60b9      	str	r1, [r7, #8]
    1e7e:	607a      	str	r2, [r7, #4]
    1e80:	603b      	str	r3, [r7, #0]
	int r,c;
	
	for (r=0;r<h;r++){
    1e82:	2300      	movs	r3, #0
    1e84:	617b      	str	r3, [r7, #20]
    1e86:	e02e      	b.n	1ee6 <gdi_box+0x72>
		for (c=0;c<w;c++){
    1e88:	2300      	movs	r3, #0
    1e8a:	613b      	str	r3, [r7, #16]
    1e8c:	e024      	b.n	1ed8 <gdi_box+0x64>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    1e8e:	68fa      	ldr	r2, [r7, #12]
    1e90:	693b      	ldr	r3, [r7, #16]
    1e92:	4413      	add	r3, r2
    1e94:	2b00      	cmp	r3, #0
    1e96:	db1c      	blt.n	1ed2 <gdi_box+0x5e>
    1e98:	68fa      	ldr	r2, [r7, #12]
    1e9a:	693b      	ldr	r3, [r7, #16]
    1e9c:	4413      	add	r3, r2
    1e9e:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    1ea2:	da16      	bge.n	1ed2 <gdi_box+0x5e>
    1ea4:	697a      	ldr	r2, [r7, #20]
    1ea6:	68bb      	ldr	r3, [r7, #8]
    1ea8:	4413      	add	r3, r2
    1eaa:	2b00      	cmp	r3, #0
    1eac:	db11      	blt.n	1ed2 <gdi_box+0x5e>
    1eae:	697a      	ldr	r2, [r7, #20]
    1eb0:	68bb      	ldr	r3, [r7, #8]
    1eb2:	4413      	add	r3, r2
    1eb4:	2bef      	cmp	r3, #239	; 0xef
    1eb6:	dc0c      	bgt.n	1ed2 <gdi_box+0x5e>
				gdi_bit_op(c+x,r+y,op);
    1eb8:	693a      	ldr	r2, [r7, #16]
    1eba:	68fb      	ldr	r3, [r7, #12]
    1ebc:	18d1      	adds	r1, r2, r3
    1ebe:	697a      	ldr	r2, [r7, #20]
    1ec0:	68bb      	ldr	r3, [r7, #8]
    1ec2:	441a      	add	r2, r3
    1ec4:	f897 3020 	ldrb.w	r3, [r7, #32]
    1ec8:	4608      	mov	r0, r1
    1eca:	4611      	mov	r1, r2
    1ecc:	461a      	mov	r2, r3
    1ece:	f7ff ff81 	bl	1dd4 <gdi_bit_op>

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
		for (c=0;c<w;c++){
    1ed2:	693b      	ldr	r3, [r7, #16]
    1ed4:	3301      	adds	r3, #1
    1ed6:	613b      	str	r3, [r7, #16]
    1ed8:	693a      	ldr	r2, [r7, #16]
    1eda:	687b      	ldr	r3, [r7, #4]
    1edc:	429a      	cmp	r2, r3
    1ede:	dbd6      	blt.n	1e8e <gdi_box+0x1a>
}

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
    1ee0:	697b      	ldr	r3, [r7, #20]
    1ee2:	3301      	adds	r3, #1
    1ee4:	617b      	str	r3, [r7, #20]
    1ee6:	697a      	ldr	r2, [r7, #20]
    1ee8:	683b      	ldr	r3, [r7, #0]
    1eea:	429a      	cmp	r2, r3
    1eec:	dbcc      	blt.n	1e88 <gdi_box+0x14>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				gdi_bit_op(c+x,r+y,op);
			}
		}
	}
}
    1eee:	3718      	adds	r7, #24
    1ef0:	46bd      	mov	sp, r7
    1ef2:	bd80      	pop	{r7, pc}

00001ef4 <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
    1ef4:	b480      	push	{r7}
    1ef6:	b089      	sub	sp, #36	; 0x24
    1ef8:	af00      	add	r7, sp, #0
    1efa:	60f8      	str	r0, [r7, #12]
    1efc:	60b9      	str	r1, [r7, #8]
    1efe:	607a      	str	r2, [r7, #4]
    1f00:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1f02:	2300      	movs	r3, #0
    1f04:	61fb      	str	r3, [r7, #28]
    1f06:	e099      	b.n	203c <gdi_put_sprite+0x148>
		mask=128;
    1f08:	2380      	movs	r3, #128	; 0x80
    1f0a:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    1f0c:	2300      	movs	r3, #0
    1f0e:	61bb      	str	r3, [r7, #24]
    1f10:	e08c      	b.n	202c <gdi_put_sprite+0x138>
			if (!mask){
    1f12:	7dfb      	ldrb	r3, [r7, #23]
    1f14:	2b00      	cmp	r3, #0
    1f16:	d104      	bne.n	1f22 <gdi_put_sprite+0x2e>
				sprite++;
    1f18:	6abb      	ldr	r3, [r7, #40]	; 0x28
    1f1a:	3301      	adds	r3, #1
    1f1c:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    1f1e:	2380      	movs	r3, #128	; 0x80
    1f20:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    1f22:	68fa      	ldr	r2, [r7, #12]
    1f24:	69bb      	ldr	r3, [r7, #24]
    1f26:	4413      	add	r3, r2
    1f28:	2b00      	cmp	r3, #0
    1f2a:	db79      	blt.n	2020 <gdi_put_sprite+0x12c>
    1f2c:	68fa      	ldr	r2, [r7, #12]
    1f2e:	69bb      	ldr	r3, [r7, #24]
    1f30:	4413      	add	r3, r2
    1f32:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    1f36:	da73      	bge.n	2020 <gdi_put_sprite+0x12c>
    1f38:	69fa      	ldr	r2, [r7, #28]
    1f3a:	68bb      	ldr	r3, [r7, #8]
    1f3c:	4413      	add	r3, r2
    1f3e:	2b00      	cmp	r3, #0
    1f40:	db6e      	blt.n	2020 <gdi_put_sprite+0x12c>
    1f42:	69fa      	ldr	r2, [r7, #28]
    1f44:	68bb      	ldr	r3, [r7, #8]
    1f46:	4413      	add	r3, r2
    1f48:	2bef      	cmp	r3, #239	; 0xef
    1f4a:	dc69      	bgt.n	2020 <gdi_put_sprite+0x12c>
				if (sprite[r]&mask){
    1f4c:	69fb      	ldr	r3, [r7, #28]
    1f4e:	6aba      	ldr	r2, [r7, #40]	; 0x28
    1f50:	4413      	add	r3, r2
    1f52:	781a      	ldrb	r2, [r3, #0]
    1f54:	7dfb      	ldrb	r3, [r7, #23]
    1f56:	4013      	ands	r3, r2
    1f58:	b2db      	uxtb	r3, r3
    1f5a:	2b00      	cmp	r3, #0
    1f5c:	d02f      	beq.n	1fbe <gdi_put_sprite+0xca>
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]|=(1<<(15-((c+x)&15)));
    1f5e:	69fa      	ldr	r2, [r7, #28]
    1f60:	68bb      	ldr	r3, [r7, #8]
    1f62:	441a      	add	r2, r3
    1f64:	4613      	mov	r3, r2
    1f66:	009b      	lsls	r3, r3, #2
    1f68:	4413      	add	r3, r2
    1f6a:	009b      	lsls	r3, r3, #2
    1f6c:	4619      	mov	r1, r3
    1f6e:	69ba      	ldr	r2, [r7, #24]
    1f70:	68fb      	ldr	r3, [r7, #12]
    1f72:	4413      	add	r3, r2
    1f74:	111b      	asrs	r3, r3, #4
    1f76:	4419      	add	r1, r3
    1f78:	69fa      	ldr	r2, [r7, #28]
    1f7a:	68bb      	ldr	r3, [r7, #8]
    1f7c:	441a      	add	r2, r3
    1f7e:	4613      	mov	r3, r2
    1f80:	009b      	lsls	r3, r3, #2
    1f82:	4413      	add	r3, r2
    1f84:	009b      	lsls	r3, r3, #2
    1f86:	4618      	mov	r0, r3
    1f88:	69ba      	ldr	r2, [r7, #24]
    1f8a:	68fb      	ldr	r3, [r7, #12]
    1f8c:	4413      	add	r3, r2
    1f8e:	111b      	asrs	r3, r3, #4
    1f90:	4403      	add	r3, r0
    1f92:	4a2f      	ldr	r2, [pc, #188]	; (2050 <gdi_put_sprite+0x15c>)
    1f94:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1f98:	b298      	uxth	r0, r3
    1f9a:	69ba      	ldr	r2, [r7, #24]
    1f9c:	68fb      	ldr	r3, [r7, #12]
    1f9e:	4413      	add	r3, r2
    1fa0:	43db      	mvns	r3, r3
    1fa2:	f003 030f 	and.w	r3, r3, #15
    1fa6:	2201      	movs	r2, #1
    1fa8:	fa02 f303 	lsl.w	r3, r2, r3
    1fac:	b29b      	uxth	r3, r3
    1fae:	4602      	mov	r2, r0
    1fb0:	4313      	orrs	r3, r2
    1fb2:	b29b      	uxth	r3, r3
    1fb4:	b29a      	uxth	r2, r3
    1fb6:	4b26      	ldr	r3, [pc, #152]	; (2050 <gdi_put_sprite+0x15c>)
    1fb8:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
    1fbc:	e030      	b.n	2020 <gdi_put_sprite+0x12c>
				}else{
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]&=~(1<<(15-((c+x)&15)));
    1fbe:	69fa      	ldr	r2, [r7, #28]
    1fc0:	68bb      	ldr	r3, [r7, #8]
    1fc2:	441a      	add	r2, r3
    1fc4:	4613      	mov	r3, r2
    1fc6:	009b      	lsls	r3, r3, #2
    1fc8:	4413      	add	r3, r2
    1fca:	009b      	lsls	r3, r3, #2
    1fcc:	4619      	mov	r1, r3
    1fce:	69ba      	ldr	r2, [r7, #24]
    1fd0:	68fb      	ldr	r3, [r7, #12]
    1fd2:	4413      	add	r3, r2
    1fd4:	111b      	asrs	r3, r3, #4
    1fd6:	4419      	add	r1, r3
    1fd8:	69fa      	ldr	r2, [r7, #28]
    1fda:	68bb      	ldr	r3, [r7, #8]
    1fdc:	441a      	add	r2, r3
    1fde:	4613      	mov	r3, r2
    1fe0:	009b      	lsls	r3, r3, #2
    1fe2:	4413      	add	r3, r2
    1fe4:	009b      	lsls	r3, r3, #2
    1fe6:	4618      	mov	r0, r3
    1fe8:	69ba      	ldr	r2, [r7, #24]
    1fea:	68fb      	ldr	r3, [r7, #12]
    1fec:	4413      	add	r3, r2
    1fee:	111b      	asrs	r3, r3, #4
    1ff0:	4403      	add	r3, r0
    1ff2:	4a17      	ldr	r2, [pc, #92]	; (2050 <gdi_put_sprite+0x15c>)
    1ff4:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1ff8:	b298      	uxth	r0, r3
    1ffa:	69ba      	ldr	r2, [r7, #24]
    1ffc:	68fb      	ldr	r3, [r7, #12]
    1ffe:	4413      	add	r3, r2
    2000:	43db      	mvns	r3, r3
    2002:	f003 030f 	and.w	r3, r3, #15
    2006:	2201      	movs	r2, #1
    2008:	fa02 f303 	lsl.w	r3, r2, r3
    200c:	b29b      	uxth	r3, r3
    200e:	43db      	mvns	r3, r3
    2010:	b29b      	uxth	r3, r3
    2012:	4602      	mov	r2, r0
    2014:	4013      	ands	r3, r2
    2016:	b29b      	uxth	r3, r3
    2018:	b29a      	uxth	r2, r3
    201a:	4b0d      	ldr	r3, [pc, #52]	; (2050 <gdi_put_sprite+0x15c>)
    201c:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
				//bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
				//video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]|=bit;
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
    2020:	7dfb      	ldrb	r3, [r7, #23]
    2022:	085b      	lsrs	r3, r3, #1
    2024:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    2026:	69bb      	ldr	r3, [r7, #24]
    2028:	3301      	adds	r3, #1
    202a:	61bb      	str	r3, [r7, #24]
    202c:	69ba      	ldr	r2, [r7, #24]
    202e:	687b      	ldr	r3, [r7, #4]
    2030:	429a      	cmp	r2, r3
    2032:	f6ff af6e 	blt.w	1f12 <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    2036:	69fb      	ldr	r3, [r7, #28]
    2038:	3301      	adds	r3, #1
    203a:	61fb      	str	r3, [r7, #28]
    203c:	69fa      	ldr	r2, [r7, #28]
    203e:	683b      	ldr	r3, [r7, #0]
    2040:	429a      	cmp	r2, r3
    2042:	f6ff af61 	blt.w	1f08 <gdi_put_sprite+0x14>
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    2046:	3724      	adds	r7, #36	; 0x24
    2048:	46bd      	mov	sp, r7
    204a:	f85d 7b04 	ldr.w	r7, [sp], #4
    204e:	4770      	bx	lr
    2050:	20000148 	.word	0x20000148

00002054 <gdi_clear_rows>:

void gdi_clear_rows(int y, int count){
    2054:	b480      	push	{r7}
    2056:	b085      	sub	sp, #20
    2058:	af00      	add	r7, sp, #0
    205a:	6078      	str	r0, [r7, #4]
    205c:	6039      	str	r1, [r7, #0]
	int i,limit;
	if (y<0){y=0;}
    205e:	687b      	ldr	r3, [r7, #4]
    2060:	2b00      	cmp	r3, #0
    2062:	da01      	bge.n	2068 <gdi_clear_rows+0x14>
    2064:	2300      	movs	r3, #0
    2066:	607b      	str	r3, [r7, #4]
	limit=(y+count)*ROW_SIZE;
    2068:	687a      	ldr	r2, [r7, #4]
    206a:	683b      	ldr	r3, [r7, #0]
    206c:	441a      	add	r2, r3
    206e:	4613      	mov	r3, r2
    2070:	009b      	lsls	r3, r3, #2
    2072:	4413      	add	r3, r2
    2074:	009b      	lsls	r3, r3, #2
    2076:	60bb      	str	r3, [r7, #8]
	if (limit>(HRES*VRES)){limit=HRES*VRES;}
    2078:	68bb      	ldr	r3, [r7, #8]
    207a:	f5b3 3f96 	cmp.w	r3, #76800	; 0x12c00
    207e:	dd02      	ble.n	2086 <gdi_clear_rows+0x32>
    2080:	f44f 3396 	mov.w	r3, #76800	; 0x12c00
    2084:	60bb      	str	r3, [r7, #8]
	for (i=y*ROW_SIZE;i<limit;i++){
    2086:	687a      	ldr	r2, [r7, #4]
    2088:	4613      	mov	r3, r2
    208a:	009b      	lsls	r3, r3, #2
    208c:	4413      	add	r3, r2
    208e:	009b      	lsls	r3, r3, #2
    2090:	60fb      	str	r3, [r7, #12]
    2092:	e007      	b.n	20a4 <gdi_clear_rows+0x50>
		video_buffer[i]=0;
    2094:	4a08      	ldr	r2, [pc, #32]	; (20b8 <gdi_clear_rows+0x64>)
    2096:	68fb      	ldr	r3, [r7, #12]
    2098:	2100      	movs	r1, #0
    209a:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
void gdi_clear_rows(int y, int count){
	int i,limit;
	if (y<0){y=0;}
	limit=(y+count)*ROW_SIZE;
	if (limit>(HRES*VRES)){limit=HRES*VRES;}
	for (i=y*ROW_SIZE;i<limit;i++){
    209e:	68fb      	ldr	r3, [r7, #12]
    20a0:	3301      	adds	r3, #1
    20a2:	60fb      	str	r3, [r7, #12]
    20a4:	68fa      	ldr	r2, [r7, #12]
    20a6:	68bb      	ldr	r3, [r7, #8]
    20a8:	429a      	cmp	r2, r3
    20aa:	dbf3      	blt.n	2094 <gdi_clear_rows+0x40>
		video_buffer[i]=0;
	}
}
    20ac:	3714      	adds	r7, #20
    20ae:	46bd      	mov	sp, r7
    20b0:	f85d 7b04 	ldr.w	r7, [sp], #4
    20b4:	4770      	bx	lr
    20b6:	bf00      	nop
    20b8:	20000148 	.word	0x20000148

000020bc <gdi_rect>:

void gdi_rect(int x, int y, int w, int h, bitop_e op){
    20bc:	b580      	push	{r7, lr}
    20be:	b086      	sub	sp, #24
    20c0:	af00      	add	r7, sp, #0
    20c2:	60f8      	str	r0, [r7, #12]
    20c4:	60b9      	str	r1, [r7, #8]
    20c6:	607a      	str	r2, [r7, #4]
    20c8:	603b      	str	r3, [r7, #0]
	int i;
	//ligne horizontales
	for (i=x;i<(x+w);i++){
    20ca:	68fb      	ldr	r3, [r7, #12]
    20cc:	617b      	str	r3, [r7, #20]
    20ce:	e014      	b.n	20fa <gdi_rect+0x3e>
			gdi_bit_op(i,y,op);
    20d0:	f897 3020 	ldrb.w	r3, [r7, #32]
    20d4:	6978      	ldr	r0, [r7, #20]
    20d6:	68b9      	ldr	r1, [r7, #8]
    20d8:	461a      	mov	r2, r3
    20da:	f7ff fe7b 	bl	1dd4 <gdi_bit_op>
			gdi_bit_op(i,y+h-1,op);
    20de:	68ba      	ldr	r2, [r7, #8]
    20e0:	683b      	ldr	r3, [r7, #0]
    20e2:	4413      	add	r3, r2
    20e4:	1e5a      	subs	r2, r3, #1
    20e6:	f897 3020 	ldrb.w	r3, [r7, #32]
    20ea:	6978      	ldr	r0, [r7, #20]
    20ec:	4611      	mov	r1, r2
    20ee:	461a      	mov	r2, r3
    20f0:	f7ff fe70 	bl	1dd4 <gdi_bit_op>
}

void gdi_rect(int x, int y, int w, int h, bitop_e op){
	int i;
	//ligne horizontales
	for (i=x;i<(x+w);i++){
    20f4:	697b      	ldr	r3, [r7, #20]
    20f6:	3301      	adds	r3, #1
    20f8:	617b      	str	r3, [r7, #20]
    20fa:	68fa      	ldr	r2, [r7, #12]
    20fc:	687b      	ldr	r3, [r7, #4]
    20fe:	441a      	add	r2, r3
    2100:	697b      	ldr	r3, [r7, #20]
    2102:	429a      	cmp	r2, r3
    2104:	dce4      	bgt.n	20d0 <gdi_rect+0x14>
			gdi_bit_op(i,y,op);
			gdi_bit_op(i,y+h-1,op);
	}
    // lignes verticales
	for (i=y+1;i<(y+h-1);i++){
    2106:	68bb      	ldr	r3, [r7, #8]
    2108:	3301      	adds	r3, #1
    210a:	617b      	str	r3, [r7, #20]
    210c:	e014      	b.n	2138 <gdi_rect+0x7c>
			gdi_bit_op(x,i,op);
    210e:	f897 3020 	ldrb.w	r3, [r7, #32]
    2112:	68f8      	ldr	r0, [r7, #12]
    2114:	6979      	ldr	r1, [r7, #20]
    2116:	461a      	mov	r2, r3
    2118:	f7ff fe5c 	bl	1dd4 <gdi_bit_op>
			gdi_bit_op(x+w-1,i,op);
    211c:	68fa      	ldr	r2, [r7, #12]
    211e:	687b      	ldr	r3, [r7, #4]
    2120:	4413      	add	r3, r2
    2122:	1e5a      	subs	r2, r3, #1
    2124:	f897 3020 	ldrb.w	r3, [r7, #32]
    2128:	4610      	mov	r0, r2
    212a:	6979      	ldr	r1, [r7, #20]
    212c:	461a      	mov	r2, r3
    212e:	f7ff fe51 	bl	1dd4 <gdi_bit_op>
	for (i=x;i<(x+w);i++){
			gdi_bit_op(i,y,op);
			gdi_bit_op(i,y+h-1,op);
	}
    // lignes verticales
	for (i=y+1;i<(y+h-1);i++){
    2132:	697b      	ldr	r3, [r7, #20]
    2134:	3301      	adds	r3, #1
    2136:	617b      	str	r3, [r7, #20]
    2138:	68ba      	ldr	r2, [r7, #8]
    213a:	683b      	ldr	r3, [r7, #0]
    213c:	4413      	add	r3, r2
    213e:	1e5a      	subs	r2, r3, #1
    2140:	697b      	ldr	r3, [r7, #20]
    2142:	429a      	cmp	r2, r3
    2144:	dce3      	bgt.n	210e <gdi_rect+0x52>
			gdi_bit_op(x,i,op);
			gdi_bit_op(x+w-1,i,op);
	}
}
    2146:	3718      	adds	r7, #24
    2148:	46bd      	mov	sp, r7
    214a:	bd80      	pop	{r7, pc}

0000214c <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(gpio_t* port, unsigned pin, unsigned config){
    214c:	b480      	push	{r7}
    214e:	b087      	sub	sp, #28
    2150:	af00      	add	r7, sp, #0
    2152:	60f8      	str	r0, [r7, #12]
    2154:	60b9      	str	r1, [r7, #8]
    2156:	607a      	str	r2, [r7, #4]
	uint8_t shift;
	shift=(pin&7)<<2;
    2158:	68bb      	ldr	r3, [r7, #8]
    215a:	b2db      	uxtb	r3, r3
    215c:	f003 0307 	and.w	r3, r3, #7
    2160:	b2db      	uxtb	r3, r3
    2162:	009b      	lsls	r3, r3, #2
    2164:	75fb      	strb	r3, [r7, #23]
	port->CR[pin>>3]&=~(15<<shift);
    2166:	68bb      	ldr	r3, [r7, #8]
    2168:	08da      	lsrs	r2, r3, #3
    216a:	68bb      	ldr	r3, [r7, #8]
    216c:	08d9      	lsrs	r1, r3, #3
    216e:	68fb      	ldr	r3, [r7, #12]
    2170:	f853 3021 	ldr.w	r3, [r3, r1, lsl #2]
    2174:	7df9      	ldrb	r1, [r7, #23]
    2176:	200f      	movs	r0, #15
    2178:	fa00 f101 	lsl.w	r1, r0, r1
    217c:	43c9      	mvns	r1, r1
    217e:	4019      	ands	r1, r3
    2180:	68fb      	ldr	r3, [r7, #12]
    2182:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
	port->CR[pin>>3]|=config<<shift;
    2186:	68bb      	ldr	r3, [r7, #8]
    2188:	08da      	lsrs	r2, r3, #3
    218a:	68bb      	ldr	r3, [r7, #8]
    218c:	08d9      	lsrs	r1, r3, #3
    218e:	68fb      	ldr	r3, [r7, #12]
    2190:	f853 1021 	ldr.w	r1, [r3, r1, lsl #2]
    2194:	7dfb      	ldrb	r3, [r7, #23]
    2196:	6878      	ldr	r0, [r7, #4]
    2198:	fa00 f303 	lsl.w	r3, r0, r3
    219c:	4319      	orrs	r1, r3
    219e:	68fb      	ldr	r3, [r7, #12]
    21a0:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
}
    21a4:	371c      	adds	r7, #28
    21a6:	46bd      	mov	sp, r7
    21a8:	f85d 7b04 	ldr.w	r7, [sp], #4
    21ac:	4770      	bx	lr
    21ae:	bf00      	nop

000021b0 <read_pin>:

int read_pin(gpio_t* port, unsigned pin){
    21b0:	b480      	push	{r7}
    21b2:	b083      	sub	sp, #12
    21b4:	af00      	add	r7, sp, #0
    21b6:	6078      	str	r0, [r7, #4]
    21b8:	6039      	str	r1, [r7, #0]
	return port->IDR&(1<<pin);
    21ba:	687b      	ldr	r3, [r7, #4]
    21bc:	689b      	ldr	r3, [r3, #8]
    21be:	683a      	ldr	r2, [r7, #0]
    21c0:	2101      	movs	r1, #1
    21c2:	fa01 f202 	lsl.w	r2, r1, r2
    21c6:	4013      	ands	r3, r2
}
    21c8:	4618      	mov	r0, r3
    21ca:	370c      	adds	r7, #12
    21cc:	46bd      	mov	sp, r7
    21ce:	f85d 7b04 	ldr.w	r7, [sp], #4
    21d2:	4770      	bx	lr

000021d4 <write_pin>:

void write_pin(gpio_t* port, unsigned pin, int value){
    21d4:	b480      	push	{r7}
    21d6:	b085      	sub	sp, #20
    21d8:	af00      	add	r7, sp, #0
    21da:	60f8      	str	r0, [r7, #12]
    21dc:	60b9      	str	r1, [r7, #8]
    21de:	607a      	str	r2, [r7, #4]
	value?(port->ODR|=(1<<pin)):(port->ODR&=~(1<<pin));
    21e0:	687b      	ldr	r3, [r7, #4]
    21e2:	2b00      	cmp	r3, #0
    21e4:	d009      	beq.n	21fa <write_pin+0x26>
    21e6:	68fb      	ldr	r3, [r7, #12]
    21e8:	68db      	ldr	r3, [r3, #12]
    21ea:	68ba      	ldr	r2, [r7, #8]
    21ec:	2101      	movs	r1, #1
    21ee:	fa01 f202 	lsl.w	r2, r1, r2
    21f2:	431a      	orrs	r2, r3
    21f4:	68fb      	ldr	r3, [r7, #12]
    21f6:	60da      	str	r2, [r3, #12]
    21f8:	e009      	b.n	220e <write_pin+0x3a>
    21fa:	68fb      	ldr	r3, [r7, #12]
    21fc:	68db      	ldr	r3, [r3, #12]
    21fe:	68ba      	ldr	r2, [r7, #8]
    2200:	2101      	movs	r1, #1
    2202:	fa01 f202 	lsl.w	r2, r1, r2
    2206:	43d2      	mvns	r2, r2
    2208:	401a      	ands	r2, r3
    220a:	68fb      	ldr	r3, [r7, #12]
    220c:	60da      	str	r2, [r3, #12]
}
    220e:	3714      	adds	r7, #20
    2210:	46bd      	mov	sp, r7
    2212:	f85d 7b04 	ldr.w	r7, [sp], #4
    2216:	4770      	bx	lr

00002218 <toggle_pin>:

void toggle_pin(gpio_t* port, unsigned pin){
    2218:	b480      	push	{r7}
    221a:	b083      	sub	sp, #12
    221c:	af00      	add	r7, sp, #0
    221e:	6078      	str	r0, [r7, #4]
    2220:	6039      	str	r1, [r7, #0]
	port->ODR^=(1<<pin);
    2222:	687b      	ldr	r3, [r7, #4]
    2224:	68db      	ldr	r3, [r3, #12]
    2226:	683a      	ldr	r2, [r7, #0]
    2228:	2101      	movs	r1, #1
    222a:	fa01 f202 	lsl.w	r2, r1, r2
    222e:	405a      	eors	r2, r3
    2230:	687b      	ldr	r3, [r7, #4]
    2232:	60da      	str	r2, [r3, #12]
}
    2234:	370c      	adds	r7, #12
    2236:	46bd      	mov	sp, r7
    2238:	f85d 7b04 	ldr.w	r7, [sp], #4
    223c:	4770      	bx	lr
    223e:	bf00      	nop

00002240 <kbd_enable>:
#define PS2_QUEUE_SIZE (16)
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];


void kbd_enable(int enable){
    2240:	b580      	push	{r7, lr}
    2242:	b082      	sub	sp, #8
    2244:	af00      	add	r7, sp, #0
    2246:	6078      	str	r0, [r7, #4]
	if (enable){
    2248:	687b      	ldr	r3, [r7, #4]
    224a:	2b00      	cmp	r3, #0
    224c:	d01b      	beq.n	2286 <kbd_enable+0x46>
		ps2_head=ps2_tail=0;
    224e:	2100      	movs	r1, #0
    2250:	4b11      	ldr	r3, [pc, #68]	; (2298 <kbd_enable+0x58>)
    2252:	460a      	mov	r2, r1
    2254:	701a      	strb	r2, [r3, #0]
    2256:	4b11      	ldr	r3, [pc, #68]	; (229c <kbd_enable+0x5c>)
    2258:	460a      	mov	r2, r1
    225a:	701a      	strb	r2, [r3, #0]
		EXTI->IMR|=KBD_CLK_PIN;
    225c:	4a10      	ldr	r2, [pc, #64]	; (22a0 <kbd_enable+0x60>)
    225e:	4b10      	ldr	r3, [pc, #64]	; (22a0 <kbd_enable+0x60>)
    2260:	681b      	ldr	r3, [r3, #0]
    2262:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    2266:	6013      	str	r3, [r2, #0]
		enable_interrupt(IRQ_KBD_CLK);
    2268:	2017      	movs	r0, #23
    226a:	f000 fac7 	bl	27fc <enable_interrupt>
		KBD_TMR->SR&=~BIT0;
    226e:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    2272:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    2276:	691b      	ldr	r3, [r3, #16]
    2278:	f023 0301 	bic.w	r3, r3, #1
    227c:	6113      	str	r3, [r2, #16]
		enable_interrupt(IRQ_KBD_TMR);
    227e:	201c      	movs	r0, #28
    2280:	f000 fabc 	bl	27fc <enable_interrupt>
    2284:	e005      	b.n	2292 <kbd_enable+0x52>
	}else{
		disable_interrupt(IRQ_KBD_CLK);
    2286:	2017      	movs	r0, #23
    2288:	f000 fadc 	bl	2844 <disable_interrupt>
		disable_interrupt(IRQ_KBD_TMR);
    228c:	201c      	movs	r0, #28
    228e:	f000 fad9 	bl	2844 <disable_interrupt>
	}
}
    2292:	3708      	adds	r7, #8
    2294:	46bd      	mov	sp, r7
    2296:	bd80      	pop	{r7, pc}
    2298:	200000ca 	.word	0x200000ca
    229c:	200000c9 	.word	0x200000c9
    22a0:	40010400 	.word	0x40010400

000022a4 <keyboard_init>:
 
void keyboard_init(){
    22a4:	b580      	push	{r7, lr}
    22a6:	af00      	add	r7, sp, #0
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
    22a8:	4a15      	ldr	r2, [pc, #84]	; (2300 <keyboard_init+0x5c>)
    22aa:	4b15      	ldr	r3, [pc, #84]	; (2300 <keyboard_init+0x5c>)
    22ac:	699b      	ldr	r3, [r3, #24]
    22ae:	f043 0305 	orr.w	r3, r3, #5
    22b2:	6193      	str	r3, [r2, #24]
	// activation clock KBD_TMR
	RCC->KBD_TMR_ENR|=KBD_TMR_EN; 
    22b4:	4a12      	ldr	r2, [pc, #72]	; (2300 <keyboard_init+0x5c>)
    22b6:	4b12      	ldr	r3, [pc, #72]	; (2300 <keyboard_init+0x5c>)
    22b8:	69db      	ldr	r3, [r3, #28]
    22ba:	f043 0301 	orr.w	r3, r3, #1
    22be:	61d3      	str	r3, [r2, #28]
	KBD_TMR->ARR=FTMR2_4/20*.01;
    22c0:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    22c4:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    22c8:	62da      	str	r2, [r3, #44]	; 0x2c
	KBD_TMR->PSC=20;
    22ca:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    22ce:	2214      	movs	r2, #20
    22d0:	629a      	str	r2, [r3, #40]	; 0x28
	KBD_TMR->CR1=BIT0|BIT7; // ARPE
    22d2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    22d6:	2281      	movs	r2, #129	; 0x81
    22d8:	601a      	str	r2, [r3, #0]
	KBD_TMR->DIER=BIT0; // UIE
    22da:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    22de:	2201      	movs	r2, #1
    22e0:	60da      	str	r2, [r3, #12]
	set_int_priority(IRQ_KBD_CLK,0);
    22e2:	2017      	movs	r0, #23
    22e4:	2100      	movs	r1, #0
    22e6:	f000 fb45 	bl	2974 <set_int_priority>
	set_int_priority(IRQ_KBD_TMR,14);
    22ea:	201c      	movs	r0, #28
    22ec:	210e      	movs	r1, #14
    22ee:	f000 fb41 	bl	2974 <set_int_priority>
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
    22f2:	4a04      	ldr	r2, [pc, #16]	; (2304 <keyboard_init+0x60>)
    22f4:	4b03      	ldr	r3, [pc, #12]	; (2304 <keyboard_init+0x60>)
    22f6:	68db      	ldr	r3, [r3, #12]
    22f8:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    22fc:	60d3      	str	r3, [r2, #12]
//	enable_interrupt(IRQ_KBD_CLK);
//	KBD_TMR->SR&=~BIT0;
//	enable_interrupt(IRQ_KBD_TMR);
	//pause(700);
	//if (!KbdReset()) print("keyboard reset failed\n");
}
    22fe:	bd80      	pop	{r7, pc}
    2300:	40021000 	.word	0x40021000
    2304:	40010400 	.word	0x40010400

00002308 <search_table>:
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
    2308:	b480      	push	{r7}
    230a:	b083      	sub	sp, #12
    230c:	af00      	add	r7, sp, #0
    230e:	6078      	str	r0, [r7, #4]
    2310:	460b      	mov	r3, r1
    2312:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    2314:	e008      	b.n	2328 <search_table+0x20>
		if (table->code==code) break;
    2316:	687b      	ldr	r3, [r7, #4]
    2318:	781b      	ldrb	r3, [r3, #0]
    231a:	78fa      	ldrb	r2, [r7, #3]
    231c:	429a      	cmp	r2, r3
    231e:	d100      	bne.n	2322 <search_table+0x1a>
    2320:	e006      	b.n	2330 <search_table+0x28>
		table++;
    2322:	687b      	ldr	r3, [r7, #4]
    2324:	3302      	adds	r3, #2
    2326:	607b      	str	r3, [r7, #4]

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
    2328:	687b      	ldr	r3, [r7, #4]
    232a:	781b      	ldrb	r3, [r3, #0]
    232c:	2b00      	cmp	r3, #0
    232e:	d1f2      	bne.n	2316 <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    2330:	687b      	ldr	r3, [r7, #4]
    2332:	785b      	ldrb	r3, [r3, #1]
}
    2334:	4618      	mov	r0, r3
    2336:	370c      	adds	r7, #12
    2338:	46bd      	mov	sp, r7
    233a:	f85d 7b04 	ldr.w	r7, [sp], #4
    233e:	4770      	bx	lr

00002340 <convert_code>:

static void convert_code(unsigned char code){
    2340:	b580      	push	{r7, lr}
    2342:	b086      	sub	sp, #24
    2344:	af00      	add	r7, sp, #0
    2346:	4603      	mov	r3, r0
    2348:	71fb      	strb	r3, [r7, #7]
		unsigned char c,s;
		int shift;
		if (!(con.dev==LOCAL)) return;
    234a:	4b91      	ldr	r3, [pc, #580]	; (2590 <convert_code+0x250>)
    234c:	781b      	ldrb	r3, [r3, #0]
    234e:	2b00      	cmp	r3, #0
    2350:	d000      	beq.n	2354 <convert_code+0x14>
    2352:	e165      	b.n	2620 <convert_code+0x2e0>
		switch (code){
    2354:	79fb      	ldrb	r3, [r7, #7]
    2356:	2b59      	cmp	r3, #89	; 0x59
    2358:	f000 8085 	beq.w	2466 <convert_code+0x126>
    235c:	2b59      	cmp	r3, #89	; 0x59
    235e:	dc0e      	bgt.n	237e <convert_code+0x3e>
    2360:	2b12      	cmp	r3, #18
    2362:	d038      	beq.n	23d6 <convert_code+0x96>
    2364:	2b12      	cmp	r3, #18
    2366:	dc03      	bgt.n	2370 <convert_code+0x30>
    2368:	2b11      	cmp	r3, #17
    236a:	f000 80b8 	beq.w	24de <convert_code+0x19e>
    236e:	e0de      	b.n	252e <convert_code+0x1ee>
    2370:	2b14      	cmp	r3, #20
    2372:	f000 808c 	beq.w	248e <convert_code+0x14e>
    2376:	2b58      	cmp	r3, #88	; 0x58
    2378:	f000 80c5 	beq.w	2506 <convert_code+0x1c6>
    237c:	e0d7      	b.n	252e <convert_code+0x1ee>
    237e:	2be0      	cmp	r3, #224	; 0xe0
    2380:	d010      	beq.n	23a4 <convert_code+0x64>
    2382:	2be0      	cmp	r3, #224	; 0xe0
    2384:	dc02      	bgt.n	238c <convert_code+0x4c>
    2386:	2b7c      	cmp	r3, #124	; 0x7c
    2388:	d047      	beq.n	241a <convert_code+0xda>
    238a:	e0d0      	b.n	252e <convert_code+0x1ee>
    238c:	2be1      	cmp	r3, #225	; 0xe1
    238e:	d010      	beq.n	23b2 <convert_code+0x72>
    2390:	2bf0      	cmp	r3, #240	; 0xf0
    2392:	f040 80cc 	bne.w	252e <convert_code+0x1ee>
		case 0xF0:
			flags |= RELEASE;
    2396:	4b7f      	ldr	r3, [pc, #508]	; (2594 <convert_code+0x254>)
    2398:	681b      	ldr	r3, [r3, #0]
    239a:	f043 0302 	orr.w	r3, r3, #2
    239e:	4a7d      	ldr	r2, [pc, #500]	; (2594 <convert_code+0x254>)
    23a0:	6013      	str	r3, [r2, #0]
			break;
    23a2:	e13d      	b.n	2620 <convert_code+0x2e0>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    23a4:	4b7b      	ldr	r3, [pc, #492]	; (2594 <convert_code+0x254>)
    23a6:	681b      	ldr	r3, [r3, #0]
    23a8:	f043 0301 	orr.w	r3, r3, #1
    23ac:	4a79      	ldr	r2, [pc, #484]	; (2594 <convert_code+0x254>)
    23ae:	6013      	str	r3, [r2, #0]
			break;
    23b0:	e136      	b.n	2620 <convert_code+0x2e0>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    23b2:	4b78      	ldr	r3, [pc, #480]	; (2594 <convert_code+0x254>)
    23b4:	681b      	ldr	r3, [r3, #0]
    23b6:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    23ba:	4a76      	ldr	r2, [pc, #472]	; (2594 <convert_code+0x254>)
    23bc:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    23be:	4b75      	ldr	r3, [pc, #468]	; (2594 <convert_code+0x254>)
    23c0:	681b      	ldr	r3, [r3, #0]
    23c2:	f403 7380 	and.w	r3, r3, #256	; 0x100
    23c6:	2b00      	cmp	r3, #0
    23c8:	d104      	bne.n	23d4 <convert_code+0x94>
				con.insert(PAUSE);
    23ca:	4b71      	ldr	r3, [pc, #452]	; (2590 <convert_code+0x250>)
    23cc:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    23ce:	2094      	movs	r0, #148	; 0x94
    23d0:	4798      	blx	r3
			}
			break;
    23d2:	e125      	b.n	2620 <convert_code+0x2e0>
    23d4:	e124      	b.n	2620 <convert_code+0x2e0>
		case LSHIFT:
			if (flags&RELEASE){
    23d6:	4b6f      	ldr	r3, [pc, #444]	; (2594 <convert_code+0x254>)
    23d8:	681b      	ldr	r3, [r3, #0]
    23da:	f003 0302 	and.w	r3, r3, #2
    23de:	2b00      	cmp	r3, #0
    23e0:	d006      	beq.n	23f0 <convert_code+0xb0>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    23e2:	4b6c      	ldr	r3, [pc, #432]	; (2594 <convert_code+0x254>)
    23e4:	681b      	ldr	r3, [r3, #0]
    23e6:	f023 0307 	bic.w	r3, r3, #7
    23ea:	4a6a      	ldr	r2, [pc, #424]	; (2594 <convert_code+0x254>)
    23ec:	6013      	str	r3, [r2, #0]
    23ee:	e013      	b.n	2418 <convert_code+0xd8>
			}else{
				if (flags&XTD_CODE){
    23f0:	4b68      	ldr	r3, [pc, #416]	; (2594 <convert_code+0x254>)
    23f2:	681b      	ldr	r3, [r3, #0]
    23f4:	f003 0301 	and.w	r3, r3, #1
    23f8:	2b00      	cmp	r3, #0
    23fa:	d006      	beq.n	240a <convert_code+0xca>
					flags|=PRNSCR;
    23fc:	4b65      	ldr	r3, [pc, #404]	; (2594 <convert_code+0x254>)
    23fe:	681b      	ldr	r3, [r3, #0]
    2400:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    2404:	4a63      	ldr	r2, [pc, #396]	; (2594 <convert_code+0x254>)
    2406:	6013      	str	r3, [r2, #0]
    2408:	e006      	b.n	2418 <convert_code+0xd8>
				}else{
					flags|=LEFT_SHIFT;
    240a:	4b62      	ldr	r3, [pc, #392]	; (2594 <convert_code+0x254>)
    240c:	681b      	ldr	r3, [r3, #0]
    240e:	f043 0304 	orr.w	r3, r3, #4
    2412:	4a60      	ldr	r2, [pc, #384]	; (2594 <convert_code+0x254>)
    2414:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    2416:	e103      	b.n	2620 <convert_code+0x2e0>
    2418:	e102      	b.n	2620 <convert_code+0x2e0>
		case KPMUL:
			if (flags&RELEASE){
    241a:	4b5e      	ldr	r3, [pc, #376]	; (2594 <convert_code+0x254>)
    241c:	681b      	ldr	r3, [r3, #0]
    241e:	f003 0302 	and.w	r3, r3, #2
    2422:	2b00      	cmp	r3, #0
    2424:	d006      	beq.n	2434 <convert_code+0xf4>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    2426:	4b5b      	ldr	r3, [pc, #364]	; (2594 <convert_code+0x254>)
    2428:	681b      	ldr	r3, [r3, #0]
    242a:	f023 0303 	bic.w	r3, r3, #3
    242e:	4a59      	ldr	r2, [pc, #356]	; (2594 <convert_code+0x254>)
    2430:	6013      	str	r3, [r2, #0]
    2432:	e017      	b.n	2464 <convert_code+0x124>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    2434:	4b57      	ldr	r3, [pc, #348]	; (2594 <convert_code+0x254>)
    2436:	681b      	ldr	r3, [r3, #0]
    2438:	f003 0301 	and.w	r3, r3, #1
    243c:	2b00      	cmp	r3, #0
    243e:	d00c      	beq.n	245a <convert_code+0x11a>
					flags&=~(XTD_CODE|PRNSCR);
    2440:	4b54      	ldr	r3, [pc, #336]	; (2594 <convert_code+0x254>)
    2442:	681b      	ldr	r3, [r3, #0]
    2444:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    2448:	f023 0301 	bic.w	r3, r3, #1
    244c:	4a51      	ldr	r2, [pc, #324]	; (2594 <convert_code+0x254>)
    244e:	6013      	str	r3, [r2, #0]
					con.insert(PRN);
    2450:	4b4f      	ldr	r3, [pc, #316]	; (2590 <convert_code+0x250>)
    2452:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    2454:	2092      	movs	r0, #146	; 0x92
    2456:	4798      	blx	r3
    2458:	e004      	b.n	2464 <convert_code+0x124>
				}else{
					con.insert('*');
    245a:	4b4d      	ldr	r3, [pc, #308]	; (2590 <convert_code+0x250>)
    245c:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    245e:	202a      	movs	r0, #42	; 0x2a
    2460:	4798      	blx	r3
				}
			}
			break;
    2462:	e0dd      	b.n	2620 <convert_code+0x2e0>
    2464:	e0dc      	b.n	2620 <convert_code+0x2e0>
		case RSHIFT:
			if (flags&RELEASE){
    2466:	4b4b      	ldr	r3, [pc, #300]	; (2594 <convert_code+0x254>)
    2468:	681b      	ldr	r3, [r3, #0]
    246a:	f003 0302 	and.w	r3, r3, #2
    246e:	2b00      	cmp	r3, #0
    2470:	d006      	beq.n	2480 <convert_code+0x140>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    2472:	4b48      	ldr	r3, [pc, #288]	; (2594 <convert_code+0x254>)
    2474:	681b      	ldr	r3, [r3, #0]
    2476:	f023 030b 	bic.w	r3, r3, #11
    247a:	4a46      	ldr	r2, [pc, #280]	; (2594 <convert_code+0x254>)
    247c:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    247e:	e0cf      	b.n	2620 <convert_code+0x2e0>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    2480:	4b44      	ldr	r3, [pc, #272]	; (2594 <convert_code+0x254>)
    2482:	681b      	ldr	r3, [r3, #0]
    2484:	f043 0308 	orr.w	r3, r3, #8
    2488:	4a42      	ldr	r2, [pc, #264]	; (2594 <convert_code+0x254>)
    248a:	6013      	str	r3, [r2, #0]
			}
			break;
    248c:	e0c8      	b.n	2620 <convert_code+0x2e0>
		case LCTRL:
			if (flags&RELEASE){
    248e:	4b41      	ldr	r3, [pc, #260]	; (2594 <convert_code+0x254>)
    2490:	681b      	ldr	r3, [r3, #0]
    2492:	f003 0302 	and.w	r3, r3, #2
    2496:	2b00      	cmp	r3, #0
    2498:	d006      	beq.n	24a8 <convert_code+0x168>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    249a:	4b3e      	ldr	r3, [pc, #248]	; (2594 <convert_code+0x254>)
    249c:	681b      	ldr	r3, [r3, #0]
    249e:	f023 0313 	bic.w	r3, r3, #19
    24a2:	4a3c      	ldr	r2, [pc, #240]	; (2594 <convert_code+0x254>)
    24a4:	6013      	str	r3, [r2, #0]
    24a6:	e019      	b.n	24dc <convert_code+0x19c>
			}else{
				if (flags&XTD_CODE){
    24a8:	4b3a      	ldr	r3, [pc, #232]	; (2594 <convert_code+0x254>)
    24aa:	681b      	ldr	r3, [r3, #0]
    24ac:	f003 0301 	and.w	r3, r3, #1
    24b0:	2b00      	cmp	r3, #0
    24b2:	d00c      	beq.n	24ce <convert_code+0x18e>
					flags|=RIGHT_CTRL;
    24b4:	4b37      	ldr	r3, [pc, #220]	; (2594 <convert_code+0x254>)
    24b6:	681b      	ldr	r3, [r3, #0]
    24b8:	f043 0320 	orr.w	r3, r3, #32
    24bc:	4a35      	ldr	r2, [pc, #212]	; (2594 <convert_code+0x254>)
    24be:	6013      	str	r3, [r2, #0]
					flags&=~XTD_CODE;
    24c0:	4b34      	ldr	r3, [pc, #208]	; (2594 <convert_code+0x254>)
    24c2:	681b      	ldr	r3, [r3, #0]
    24c4:	f023 0301 	bic.w	r3, r3, #1
    24c8:	4a32      	ldr	r2, [pc, #200]	; (2594 <convert_code+0x254>)
    24ca:	6013      	str	r3, [r2, #0]
    24cc:	e006      	b.n	24dc <convert_code+0x19c>
				}else{
					flags|=LEFT_CTRL;
    24ce:	4b31      	ldr	r3, [pc, #196]	; (2594 <convert_code+0x254>)
    24d0:	681b      	ldr	r3, [r3, #0]
    24d2:	f043 0310 	orr.w	r3, r3, #16
    24d6:	4a2f      	ldr	r2, [pc, #188]	; (2594 <convert_code+0x254>)
    24d8:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    24da:	e0a1      	b.n	2620 <convert_code+0x2e0>
    24dc:	e0a0      	b.n	2620 <convert_code+0x2e0>
		case LALT:
			if (flags&RELEASE){
    24de:	4b2d      	ldr	r3, [pc, #180]	; (2594 <convert_code+0x254>)
    24e0:	681b      	ldr	r3, [r3, #0]
    24e2:	f003 0302 	and.w	r3, r3, #2
    24e6:	2b00      	cmp	r3, #0
    24e8:	d006      	beq.n	24f8 <convert_code+0x1b8>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    24ea:	4b2a      	ldr	r3, [pc, #168]	; (2594 <convert_code+0x254>)
    24ec:	681b      	ldr	r3, [r3, #0]
    24ee:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    24f2:	4a28      	ldr	r2, [pc, #160]	; (2594 <convert_code+0x254>)
    24f4:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    24f6:	e093      	b.n	2620 <convert_code+0x2e0>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    24f8:	4b26      	ldr	r3, [pc, #152]	; (2594 <convert_code+0x254>)
    24fa:	681b      	ldr	r3, [r3, #0]
    24fc:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    2500:	4a24      	ldr	r2, [pc, #144]	; (2594 <convert_code+0x254>)
    2502:	6013      	str	r3, [r2, #0]
			}
			break;
    2504:	e08c      	b.n	2620 <convert_code+0x2e0>
		case CAPS_LOCK:
			if (flags&RELEASE){
    2506:	4b23      	ldr	r3, [pc, #140]	; (2594 <convert_code+0x254>)
    2508:	681b      	ldr	r3, [r3, #0]
    250a:	f003 0302 	and.w	r3, r3, #2
    250e:	2b00      	cmp	r3, #0
    2510:	d006      	beq.n	2520 <convert_code+0x1e0>
				flags&=~(RELEASE|XTD_CODE);
    2512:	4b20      	ldr	r3, [pc, #128]	; (2594 <convert_code+0x254>)
    2514:	681b      	ldr	r3, [r3, #0]
    2516:	f023 0303 	bic.w	r3, r3, #3
    251a:	4a1e      	ldr	r2, [pc, #120]	; (2594 <convert_code+0x254>)
    251c:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    251e:	e07f      	b.n	2620 <convert_code+0x2e0>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    2520:	4b1c      	ldr	r3, [pc, #112]	; (2594 <convert_code+0x254>)
    2522:	681b      	ldr	r3, [r3, #0]
    2524:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    2528:	4a1a      	ldr	r2, [pc, #104]	; (2594 <convert_code+0x254>)
    252a:	6013      	str	r3, [r2, #0]
			}
			break;
    252c:	e078      	b.n	2620 <convert_code+0x2e0>
		default:
			if (!(flags&RELEASE)){
    252e:	4b19      	ldr	r3, [pc, #100]	; (2594 <convert_code+0x254>)
    2530:	681b      	ldr	r3, [r3, #0]
    2532:	f003 0302 	and.w	r3, r3, #2
    2536:	2b00      	cmp	r3, #0
    2538:	d16b      	bne.n	2612 <convert_code+0x2d2>
					if (flags&XTD_CODE){
    253a:	4b16      	ldr	r3, [pc, #88]	; (2594 <convert_code+0x254>)
    253c:	681b      	ldr	r3, [r3, #0]
    253e:	f003 0301 	and.w	r3, r3, #1
    2542:	2b00      	cmp	r3, #0
    2544:	d00d      	beq.n	2562 <convert_code+0x222>
						c=search_table(mcsaite_xkey,code);
    2546:	79fb      	ldrb	r3, [r7, #7]
    2548:	4813      	ldr	r0, [pc, #76]	; (2598 <convert_code+0x258>)
    254a:	4619      	mov	r1, r3
    254c:	f7ff fedc 	bl	2308 <search_table>
    2550:	4603      	mov	r3, r0
    2552:	75fb      	strb	r3, [r7, #23]
						flags&=~XTD_CODE;
    2554:	4b0f      	ldr	r3, [pc, #60]	; (2594 <convert_code+0x254>)
    2556:	681b      	ldr	r3, [r3, #0]
    2558:	f023 0301 	bic.w	r3, r3, #1
    255c:	4a0d      	ldr	r2, [pc, #52]	; (2594 <convert_code+0x254>)
    255e:	6013      	str	r3, [r2, #0]
    2560:	e006      	b.n	2570 <convert_code+0x230>
					}else{
						c=search_table(mcsaite_key,code);
    2562:	79fb      	ldrb	r3, [r7, #7]
    2564:	480d      	ldr	r0, [pc, #52]	; (259c <convert_code+0x25c>)
    2566:	4619      	mov	r1, r3
    2568:	f7ff fece 	bl	2308 <search_table>
    256c:	4603      	mov	r3, r0
    256e:	75fb      	strb	r3, [r7, #23]
					}
					if (flags&(LEFT_CTRL|RIGHT_CTRL) && (c>='a') && (c<='z')){
    2570:	4b08      	ldr	r3, [pc, #32]	; (2594 <convert_code+0x254>)
    2572:	681b      	ldr	r3, [r3, #0]
    2574:	f003 0330 	and.w	r3, r3, #48	; 0x30
    2578:	2b00      	cmp	r3, #0
    257a:	d011      	beq.n	25a0 <convert_code+0x260>
    257c:	7dfb      	ldrb	r3, [r7, #23]
    257e:	2b60      	cmp	r3, #96	; 0x60
    2580:	d90e      	bls.n	25a0 <convert_code+0x260>
    2582:	7dfb      	ldrb	r3, [r7, #23]
    2584:	2b7a      	cmp	r3, #122	; 0x7a
    2586:	d80b      	bhi.n	25a0 <convert_code+0x260>
						c=c-32-'@';
    2588:	7dfb      	ldrb	r3, [r7, #23]
    258a:	3b60      	subs	r3, #96	; 0x60
    258c:	75fb      	strb	r3, [r7, #23]
    258e:	e037      	b.n	2600 <convert_code+0x2c0>
    2590:	200000fc 	.word	0x200000fc
    2594:	200000dc 	.word	0x200000dc
    2598:	000041ac 	.word	0x000041ac
    259c:	000040f4 	.word	0x000040f4
					}else{
						shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    25a0:	4b21      	ldr	r3, [pc, #132]	; (2628 <convert_code+0x2e8>)
    25a2:	681b      	ldr	r3, [r3, #0]
    25a4:	f003 030c 	and.w	r3, r3, #12
    25a8:	613b      	str	r3, [r7, #16]
						if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    25aa:	7dfb      	ldrb	r3, [r7, #23]
    25ac:	2b60      	cmp	r3, #96	; 0x60
    25ae:	d918      	bls.n	25e2 <convert_code+0x2a2>
    25b0:	7dfb      	ldrb	r3, [r7, #23]
    25b2:	2b7a      	cmp	r3, #122	; 0x7a
    25b4:	d815      	bhi.n	25e2 <convert_code+0x2a2>
    25b6:	693b      	ldr	r3, [r7, #16]
    25b8:	2b00      	cmp	r3, #0
    25ba:	d005      	beq.n	25c8 <convert_code+0x288>
    25bc:	4b1a      	ldr	r3, [pc, #104]	; (2628 <convert_code+0x2e8>)
    25be:	681b      	ldr	r3, [r3, #0]
    25c0:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    25c4:	2b00      	cmp	r3, #0
    25c6:	d008      	beq.n	25da <convert_code+0x29a>
    25c8:	693b      	ldr	r3, [r7, #16]
    25ca:	2b00      	cmp	r3, #0
    25cc:	d109      	bne.n	25e2 <convert_code+0x2a2>
    25ce:	4b16      	ldr	r3, [pc, #88]	; (2628 <convert_code+0x2e8>)
    25d0:	681b      	ldr	r3, [r3, #0]
    25d2:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    25d6:	2b00      	cmp	r3, #0
    25d8:	d003      	beq.n	25e2 <convert_code+0x2a2>
							c-=32;
    25da:	7dfb      	ldrb	r3, [r7, #23]
    25dc:	3b20      	subs	r3, #32
    25de:	75fb      	strb	r3, [r7, #23]
    25e0:	e00e      	b.n	2600 <convert_code+0x2c0>
						}else if (shift && (s=search_table(mcsaite_shey,c))){
    25e2:	693b      	ldr	r3, [r7, #16]
    25e4:	2b00      	cmp	r3, #0
    25e6:	d00b      	beq.n	2600 <convert_code+0x2c0>
    25e8:	7dfb      	ldrb	r3, [r7, #23]
    25ea:	4810      	ldr	r0, [pc, #64]	; (262c <convert_code+0x2ec>)
    25ec:	4619      	mov	r1, r3
    25ee:	f7ff fe8b 	bl	2308 <search_table>
    25f2:	4603      	mov	r3, r0
    25f4:	73fb      	strb	r3, [r7, #15]
    25f6:	7bfb      	ldrb	r3, [r7, #15]
    25f8:	2b00      	cmp	r3, #0
    25fa:	d001      	beq.n	2600 <convert_code+0x2c0>
							c=s;
    25fc:	7bfb      	ldrb	r3, [r7, #15]
    25fe:	75fb      	strb	r3, [r7, #23]
						}
					}
					if (c){
    2600:	7dfb      	ldrb	r3, [r7, #23]
    2602:	2b00      	cmp	r3, #0
    2604:	d00b      	beq.n	261e <convert_code+0x2de>
						con.insert(c);
    2606:	4b0a      	ldr	r3, [pc, #40]	; (2630 <convert_code+0x2f0>)
    2608:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    260a:	7dfa      	ldrb	r2, [r7, #23]
    260c:	4610      	mov	r0, r2
    260e:	4798      	blx	r3
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    2610:	e006      	b.n	2620 <convert_code+0x2e0>
					}
					if (c){
						con.insert(c);
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    2612:	4b05      	ldr	r3, [pc, #20]	; (2628 <convert_code+0x2e8>)
    2614:	681b      	ldr	r3, [r3, #0]
    2616:	f023 0303 	bic.w	r3, r3, #3
    261a:	4a03      	ldr	r2, [pc, #12]	; (2628 <convert_code+0x2e8>)
    261c:	6013      	str	r3, [r2, #0]
			}
			break;
    261e:	bf00      	nop
		}//switch
}// convert_code()
    2620:	3718      	adds	r7, #24
    2622:	46bd      	mov	sp, r7
    2624:	bd80      	pop	{r7, pc}
    2626:	bf00      	nop
    2628:	200000dc 	.word	0x200000dc
    262c:	00004180 	.word	0x00004180
    2630:	200000fc 	.word	0x200000fc

00002634 <EXTI9_5_handler>:



// signal clock du clavier PS/2
__attribute__((optimize("-O0"))) void KBD_CLK_handler(){
    2634:	b480      	push	{r7}
    2636:	b083      	sub	sp, #12
    2638:	af00      	add	r7, sp, #0
	volatile  static unsigned char  in_byte=0,bit_cnt=0;
    volatile unsigned char parity; 

#define data_bit  (KBD_PORT->IDR & KBD_DAT_PIN)
	EXTI->PR|=KBD_CLK_PIN; 
    263a:	4a51      	ldr	r2, [pc, #324]	; (2780 <EXTI9_5_handler+0x14c>)
    263c:	4b50      	ldr	r3, [pc, #320]	; (2780 <EXTI9_5_handler+0x14c>)
    263e:	695b      	ldr	r3, [r3, #20]
    2640:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    2644:	6153      	str	r3, [r2, #20]
    switch (bit_cnt){
    2646:	4b4f      	ldr	r3, [pc, #316]	; (2784 <EXTI9_5_handler+0x150>)
    2648:	781b      	ldrb	r3, [r3, #0]
    264a:	b2db      	uxtb	r3, r3
    264c:	2b09      	cmp	r3, #9
    264e:	d01f      	beq.n	2690 <EXTI9_5_handler+0x5c>
    2650:	2b0a      	cmp	r3, #10
    2652:	d031      	beq.n	26b8 <EXTI9_5_handler+0x84>
    2654:	2b00      	cmp	r3, #0
    2656:	d16c      	bne.n	2732 <EXTI9_5_handler+0xfe>
	case 0:   // start bit
		ps2_flags&=~(F_ERROR|F_RCVD);
    2658:	4b4b      	ldr	r3, [pc, #300]	; (2788 <EXTI9_5_handler+0x154>)
    265a:	781b      	ldrb	r3, [r3, #0]
    265c:	b2db      	uxtb	r3, r3
    265e:	f023 030b 	bic.w	r3, r3, #11
    2662:	b2da      	uxtb	r2, r3
    2664:	4b48      	ldr	r3, [pc, #288]	; (2788 <EXTI9_5_handler+0x154>)
    2666:	701a      	strb	r2, [r3, #0]
		if (!data_bit){
    2668:	4b48      	ldr	r3, [pc, #288]	; (278c <EXTI9_5_handler+0x158>)
    266a:	689b      	ldr	r3, [r3, #8]
    266c:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2670:	2b00      	cmp	r3, #0
    2672:	d10c      	bne.n	268e <EXTI9_5_handler+0x5a>
			in_byte=0;
    2674:	4b46      	ldr	r3, [pc, #280]	; (2790 <EXTI9_5_handler+0x15c>)
    2676:	2200      	movs	r2, #0
    2678:	701a      	strb	r2, [r3, #0]
            parity=0;
    267a:	2300      	movs	r3, #0
    267c:	71fb      	strb	r3, [r7, #7]
            bit_cnt++;
    267e:	4b41      	ldr	r3, [pc, #260]	; (2784 <EXTI9_5_handler+0x150>)
    2680:	781b      	ldrb	r3, [r3, #0]
    2682:	b2db      	uxtb	r3, r3
    2684:	3301      	adds	r3, #1
    2686:	b2da      	uxtb	r2, r3
    2688:	4b3e      	ldr	r3, [pc, #248]	; (2784 <EXTI9_5_handler+0x150>)
    268a:	701a      	strb	r2, [r3, #0]
        }
		break;
    268c:	e073      	b.n	2776 <EXTI9_5_handler+0x142>
    268e:	e072      	b.n	2776 <EXTI9_5_handler+0x142>
	case 9:   // paritée
		if (data_bit) parity++;
    2690:	4b3e      	ldr	r3, [pc, #248]	; (278c <EXTI9_5_handler+0x158>)
    2692:	689b      	ldr	r3, [r3, #8]
    2694:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2698:	2b00      	cmp	r3, #0
    269a:	d004      	beq.n	26a6 <EXTI9_5_handler+0x72>
    269c:	79fb      	ldrb	r3, [r7, #7]
    269e:	b2db      	uxtb	r3, r3
    26a0:	3301      	adds	r3, #1
    26a2:	b2db      	uxtb	r3, r3
    26a4:	71fb      	strb	r3, [r7, #7]
		if (!(parity & 1)){
    26a6:	79fb      	ldrb	r3, [r7, #7]
			//ps2_flags |= F_ERR_PARITY;
			
		}
		bit_cnt++;
    26a8:	4b36      	ldr	r3, [pc, #216]	; (2784 <EXTI9_5_handler+0x150>)
    26aa:	781b      	ldrb	r3, [r3, #0]
    26ac:	b2db      	uxtb	r3, r3
    26ae:	3301      	adds	r3, #1
    26b0:	b2da      	uxtb	r2, r3
    26b2:	4b34      	ldr	r3, [pc, #208]	; (2784 <EXTI9_5_handler+0x150>)
    26b4:	701a      	strb	r2, [r3, #0]
		break;
    26b6:	e05e      	b.n	2776 <EXTI9_5_handler+0x142>
	case 10:  // stop bit
	    if (!data_bit){
    26b8:	4b34      	ldr	r3, [pc, #208]	; (278c <EXTI9_5_handler+0x158>)
    26ba:	689b      	ldr	r3, [r3, #8]
    26bc:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    26c0:	2b00      	cmp	r3, #0
    26c2:	d108      	bne.n	26d6 <EXTI9_5_handler+0xa2>
			ps2_flags|=F_ERR_FRAME;
    26c4:	4b30      	ldr	r3, [pc, #192]	; (2788 <EXTI9_5_handler+0x154>)
    26c6:	781b      	ldrb	r3, [r3, #0]
    26c8:	b2db      	uxtb	r3, r3
    26ca:	f043 0308 	orr.w	r3, r3, #8
    26ce:	b2da      	uxtb	r2, r3
    26d0:	4b2d      	ldr	r3, [pc, #180]	; (2788 <EXTI9_5_handler+0x154>)
    26d2:	701a      	strb	r2, [r3, #0]
    26d4:	e029      	b.n	272a <EXTI9_5_handler+0xf6>
		}else if (!(ps2_flags&F_ERROR)){
    26d6:	4b2c      	ldr	r3, [pc, #176]	; (2788 <EXTI9_5_handler+0x154>)
    26d8:	781b      	ldrb	r3, [r3, #0]
    26da:	b2db      	uxtb	r3, r3
    26dc:	f003 0309 	and.w	r3, r3, #9
    26e0:	2b00      	cmp	r3, #0
    26e2:	d122      	bne.n	272a <EXTI9_5_handler+0xf6>
			if (in_byte==BAT_OK){
    26e4:	4b2a      	ldr	r3, [pc, #168]	; (2790 <EXTI9_5_handler+0x15c>)
    26e6:	781b      	ldrb	r3, [r3, #0]
    26e8:	b2db      	uxtb	r3, r3
    26ea:	2baa      	cmp	r3, #170	; 0xaa
    26ec:	d108      	bne.n	2700 <EXTI9_5_handler+0xcc>
				ps2_flags|=F_BATOK;
    26ee:	4b26      	ldr	r3, [pc, #152]	; (2788 <EXTI9_5_handler+0x154>)
    26f0:	781b      	ldrb	r3, [r3, #0]
    26f2:	b2db      	uxtb	r3, r3
    26f4:	f043 0304 	orr.w	r3, r3, #4
    26f8:	b2da      	uxtb	r2, r3
    26fa:	4b23      	ldr	r3, [pc, #140]	; (2788 <EXTI9_5_handler+0x154>)
    26fc:	701a      	strb	r2, [r3, #0]
    26fe:	e014      	b.n	272a <EXTI9_5_handler+0xf6>
			}else{
				ps2_queue[ps2_tail++]=in_byte;
    2700:	4b24      	ldr	r3, [pc, #144]	; (2794 <EXTI9_5_handler+0x160>)
    2702:	781b      	ldrb	r3, [r3, #0]
    2704:	b2db      	uxtb	r3, r3
    2706:	1c5a      	adds	r2, r3, #1
    2708:	b2d1      	uxtb	r1, r2
    270a:	4a22      	ldr	r2, [pc, #136]	; (2794 <EXTI9_5_handler+0x160>)
    270c:	7011      	strb	r1, [r2, #0]
    270e:	461a      	mov	r2, r3
    2710:	4b1f      	ldr	r3, [pc, #124]	; (2790 <EXTI9_5_handler+0x15c>)
    2712:	781b      	ldrb	r3, [r3, #0]
    2714:	b2d9      	uxtb	r1, r3
    2716:	4b20      	ldr	r3, [pc, #128]	; (2798 <EXTI9_5_handler+0x164>)
    2718:	5499      	strb	r1, [r3, r2]
				ps2_tail&=PS2_QUEUE_SIZE-1;
    271a:	4b1e      	ldr	r3, [pc, #120]	; (2794 <EXTI9_5_handler+0x160>)
    271c:	781b      	ldrb	r3, [r3, #0]
    271e:	b2db      	uxtb	r3, r3
    2720:	f003 030f 	and.w	r3, r3, #15
    2724:	b2da      	uxtb	r2, r3
    2726:	4b1b      	ldr	r3, [pc, #108]	; (2794 <EXTI9_5_handler+0x160>)
    2728:	701a      	strb	r2, [r3, #0]
			}
	    }
	    bit_cnt=0;
    272a:	4b16      	ldr	r3, [pc, #88]	; (2784 <EXTI9_5_handler+0x150>)
    272c:	2200      	movs	r2, #0
    272e:	701a      	strb	r2, [r3, #0]
		break;
    2730:	e021      	b.n	2776 <EXTI9_5_handler+0x142>
	default:
		in_byte >>=1;
    2732:	4b17      	ldr	r3, [pc, #92]	; (2790 <EXTI9_5_handler+0x15c>)
    2734:	781b      	ldrb	r3, [r3, #0]
    2736:	b2db      	uxtb	r3, r3
    2738:	085b      	lsrs	r3, r3, #1
    273a:	b2da      	uxtb	r2, r3
    273c:	4b14      	ldr	r3, [pc, #80]	; (2790 <EXTI9_5_handler+0x15c>)
    273e:	701a      	strb	r2, [r3, #0]
		if(data_bit){
    2740:	4b12      	ldr	r3, [pc, #72]	; (278c <EXTI9_5_handler+0x158>)
    2742:	689b      	ldr	r3, [r3, #8]
    2744:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2748:	2b00      	cmp	r3, #0
    274a:	d00c      	beq.n	2766 <EXTI9_5_handler+0x132>
			in_byte |=128;
    274c:	4b10      	ldr	r3, [pc, #64]	; (2790 <EXTI9_5_handler+0x15c>)
    274e:	781b      	ldrb	r3, [r3, #0]
    2750:	b2db      	uxtb	r3, r3
    2752:	f063 037f 	orn	r3, r3, #127	; 0x7f
    2756:	b2da      	uxtb	r2, r3
    2758:	4b0d      	ldr	r3, [pc, #52]	; (2790 <EXTI9_5_handler+0x15c>)
    275a:	701a      	strb	r2, [r3, #0]
			parity++;
    275c:	79fb      	ldrb	r3, [r7, #7]
    275e:	b2db      	uxtb	r3, r3
    2760:	3301      	adds	r3, #1
    2762:	b2db      	uxtb	r3, r3
    2764:	71fb      	strb	r3, [r7, #7]
		}
		bit_cnt++;
    2766:	4b07      	ldr	r3, [pc, #28]	; (2784 <EXTI9_5_handler+0x150>)
    2768:	781b      	ldrb	r3, [r3, #0]
    276a:	b2db      	uxtb	r3, r3
    276c:	3301      	adds	r3, #1
    276e:	b2da      	uxtb	r2, r3
    2770:	4b04      	ldr	r3, [pc, #16]	; (2784 <EXTI9_5_handler+0x150>)
    2772:	701a      	strb	r2, [r3, #0]
		break;
    2774:	bf00      	nop
	}
}
    2776:	370c      	adds	r7, #12
    2778:	46bd      	mov	sp, r7
    277a:	f85d 7b04 	ldr.w	r7, [sp], #4
    277e:	4770      	bx	lr
    2780:	40010400 	.word	0x40010400
    2784:	200000e0 	.word	0x200000e0
    2788:	200000c8 	.word	0x200000c8
    278c:	40010800 	.word	0x40010800
    2790:	200000e1 	.word	0x200000e1
    2794:	200000ca 	.word	0x200000ca
    2798:	200000cc 	.word	0x200000cc

0000279c <TIM2_handler>:

void KBD_TMR_handler(){
    279c:	b580      	push	{r7, lr}
    279e:	af00      	add	r7, sp, #0
	KBD_TMR->SR&=~(BIT0); // clear interrupt bit
    27a0:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    27a4:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    27a8:	691b      	ldr	r3, [r3, #16]
    27aa:	f023 0301 	bic.w	r3, r3, #1
    27ae:	6113      	str	r3, [r2, #16]
	if (ps2_tail!=ps2_head){
    27b0:	4b0f      	ldr	r3, [pc, #60]	; (27f0 <TIM2_handler+0x54>)
    27b2:	781b      	ldrb	r3, [r3, #0]
    27b4:	b2da      	uxtb	r2, r3
    27b6:	4b0f      	ldr	r3, [pc, #60]	; (27f4 <TIM2_handler+0x58>)
    27b8:	781b      	ldrb	r3, [r3, #0]
    27ba:	b2db      	uxtb	r3, r3
    27bc:	429a      	cmp	r2, r3
    27be:	d015      	beq.n	27ec <TIM2_handler+0x50>
		convert_code(ps2_queue[ps2_head++]);
    27c0:	4b0c      	ldr	r3, [pc, #48]	; (27f4 <TIM2_handler+0x58>)
    27c2:	781b      	ldrb	r3, [r3, #0]
    27c4:	b2db      	uxtb	r3, r3
    27c6:	1c5a      	adds	r2, r3, #1
    27c8:	b2d1      	uxtb	r1, r2
    27ca:	4a0a      	ldr	r2, [pc, #40]	; (27f4 <TIM2_handler+0x58>)
    27cc:	7011      	strb	r1, [r2, #0]
    27ce:	461a      	mov	r2, r3
    27d0:	4b09      	ldr	r3, [pc, #36]	; (27f8 <TIM2_handler+0x5c>)
    27d2:	5c9b      	ldrb	r3, [r3, r2]
    27d4:	b2db      	uxtb	r3, r3
    27d6:	4618      	mov	r0, r3
    27d8:	f7ff fdb2 	bl	2340 <convert_code>
		ps2_head&=PS2_QUEUE_SIZE-1;
    27dc:	4b05      	ldr	r3, [pc, #20]	; (27f4 <TIM2_handler+0x58>)
    27de:	781b      	ldrb	r3, [r3, #0]
    27e0:	b2db      	uxtb	r3, r3
    27e2:	f003 030f 	and.w	r3, r3, #15
    27e6:	b2da      	uxtb	r2, r3
    27e8:	4b02      	ldr	r3, [pc, #8]	; (27f4 <TIM2_handler+0x58>)
    27ea:	701a      	strb	r2, [r3, #0]
	}
}
    27ec:	bd80      	pop	{r7, pc}
    27ee:	bf00      	nop
    27f0:	200000ca 	.word	0x200000ca
    27f4:	200000c9 	.word	0x200000c9
    27f8:	200000cc 	.word	0x200000cc

000027fc <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(int irq){
    27fc:	b480      	push	{r7}
    27fe:	b083      	sub	sp, #12
    2800:	af00      	add	r7, sp, #0
    2802:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    2804:	687b      	ldr	r3, [r7, #4]
    2806:	2b3b      	cmp	r3, #59	; 0x3b
    2808:	dd00      	ble.n	280c <enable_interrupt+0x10>
    280a:	e016      	b.n	283a <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    280c:	687b      	ldr	r3, [r7, #4]
    280e:	115b      	asrs	r3, r3, #5
    2810:	009b      	lsls	r3, r3, #2
    2812:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2816:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    281a:	687a      	ldr	r2, [r7, #4]
    281c:	1152      	asrs	r2, r2, #5
    281e:	0092      	lsls	r2, r2, #2
    2820:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    2824:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    2828:	6812      	ldr	r2, [r2, #0]
    282a:	6879      	ldr	r1, [r7, #4]
    282c:	f001 011f 	and.w	r1, r1, #31
    2830:	2001      	movs	r0, #1
    2832:	fa00 f101 	lsl.w	r1, r0, r1
    2836:	430a      	orrs	r2, r1
    2838:	601a      	str	r2, [r3, #0]
}
    283a:	370c      	adds	r7, #12
    283c:	46bd      	mov	sp, r7
    283e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2842:	4770      	bx	lr

00002844 <disable_interrupt>:


void disable_interrupt(int irq){
    2844:	b480      	push	{r7}
    2846:	b083      	sub	sp, #12
    2848:	af00      	add	r7, sp, #0
    284a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    284c:	687b      	ldr	r3, [r7, #4]
    284e:	2b3b      	cmp	r3, #59	; 0x3b
    2850:	dd00      	ble.n	2854 <disable_interrupt+0x10>
    2852:	e00b      	b.n	286c <disable_interrupt+0x28>
	ICER[irq>>5]=(1<<(irq&0x1f));
    2854:	687b      	ldr	r3, [r7, #4]
    2856:	115b      	asrs	r3, r3, #5
    2858:	009a      	lsls	r2, r3, #2
    285a:	4b07      	ldr	r3, [pc, #28]	; (2878 <disable_interrupt+0x34>)
    285c:	4413      	add	r3, r2
    285e:	687a      	ldr	r2, [r7, #4]
    2860:	f002 021f 	and.w	r2, r2, #31
    2864:	2101      	movs	r1, #1
    2866:	fa01 f202 	lsl.w	r2, r1, r2
    286a:	601a      	str	r2, [r3, #0]
}
    286c:	370c      	adds	r7, #12
    286e:	46bd      	mov	sp, r7
    2870:	f85d 7b04 	ldr.w	r7, [sp], #4
    2874:	4770      	bx	lr
    2876:	bf00      	nop
    2878:	e000e180 	.word	0xe000e180

0000287c <get_pending>:

unsigned get_pending(int irq){
    287c:	b480      	push	{r7}
    287e:	b083      	sub	sp, #12
    2880:	af00      	add	r7, sp, #0
    2882:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    2884:	687b      	ldr	r3, [r7, #4]
    2886:	2b3b      	cmp	r3, #59	; 0x3b
    2888:	dd01      	ble.n	288e <get_pending+0x12>
    288a:	2300      	movs	r3, #0
    288c:	e00c      	b.n	28a8 <get_pending+0x2c>
	return ICPR[irq>>5]&(1<<(irq&0x1f));
    288e:	687b      	ldr	r3, [r7, #4]
    2890:	115b      	asrs	r3, r3, #5
    2892:	009a      	lsls	r2, r3, #2
    2894:	4b07      	ldr	r3, [pc, #28]	; (28b4 <get_pending+0x38>)
    2896:	4413      	add	r3, r2
    2898:	681b      	ldr	r3, [r3, #0]
    289a:	687a      	ldr	r2, [r7, #4]
    289c:	f002 021f 	and.w	r2, r2, #31
    28a0:	2101      	movs	r1, #1
    28a2:	fa01 f202 	lsl.w	r2, r1, r2
    28a6:	4013      	ands	r3, r2
}
    28a8:	4618      	mov	r0, r3
    28aa:	370c      	adds	r7, #12
    28ac:	46bd      	mov	sp, r7
    28ae:	f85d 7b04 	ldr.w	r7, [sp], #4
    28b2:	4770      	bx	lr
    28b4:	e000e280 	.word	0xe000e280

000028b8 <get_active>:

unsigned get_active(int irq){
    28b8:	b480      	push	{r7}
    28ba:	b083      	sub	sp, #12
    28bc:	af00      	add	r7, sp, #0
    28be:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    28c0:	687b      	ldr	r3, [r7, #4]
    28c2:	2b3b      	cmp	r3, #59	; 0x3b
    28c4:	dd01      	ble.n	28ca <get_active+0x12>
    28c6:	2300      	movs	r3, #0
    28c8:	e00e      	b.n	28e8 <get_active+0x30>
	return IABR[irq>>5]&(1<<(irq&0x1f));
    28ca:	687b      	ldr	r3, [r7, #4]
    28cc:	115b      	asrs	r3, r3, #5
    28ce:	009b      	lsls	r3, r3, #2
    28d0:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    28d4:	f503 4363 	add.w	r3, r3, #58112	; 0xe300
    28d8:	681b      	ldr	r3, [r3, #0]
    28da:	687a      	ldr	r2, [r7, #4]
    28dc:	f002 021f 	and.w	r2, r2, #31
    28e0:	2101      	movs	r1, #1
    28e2:	fa01 f202 	lsl.w	r2, r1, r2
    28e6:	4013      	ands	r3, r2
}
    28e8:	4618      	mov	r0, r3
    28ea:	370c      	adds	r7, #12
    28ec:	46bd      	mov	sp, r7
    28ee:	f85d 7b04 	ldr.w	r7, [sp], #4
    28f2:	4770      	bx	lr

000028f4 <set_pending>:

void set_pending(int irq){
    28f4:	b480      	push	{r7}
    28f6:	b083      	sub	sp, #12
    28f8:	af00      	add	r7, sp, #0
    28fa:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    28fc:	687b      	ldr	r3, [r7, #4]
    28fe:	2b3b      	cmp	r3, #59	; 0x3b
    2900:	dd00      	ble.n	2904 <set_pending+0x10>
    2902:	e016      	b.n	2932 <set_pending+0x3e>
	ISPR[irq>>5]|=1<<(irq&0x1f);
    2904:	687b      	ldr	r3, [r7, #4]
    2906:	115b      	asrs	r3, r3, #5
    2908:	009b      	lsls	r3, r3, #2
    290a:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    290e:	f503 4362 	add.w	r3, r3, #57856	; 0xe200
    2912:	687a      	ldr	r2, [r7, #4]
    2914:	1152      	asrs	r2, r2, #5
    2916:	0092      	lsls	r2, r2, #2
    2918:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    291c:	f502 4262 	add.w	r2, r2, #57856	; 0xe200
    2920:	6812      	ldr	r2, [r2, #0]
    2922:	6879      	ldr	r1, [r7, #4]
    2924:	f001 011f 	and.w	r1, r1, #31
    2928:	2001      	movs	r0, #1
    292a:	fa00 f101 	lsl.w	r1, r0, r1
    292e:	430a      	orrs	r2, r1
    2930:	601a      	str	r2, [r3, #0]
}
    2932:	370c      	adds	r7, #12
    2934:	46bd      	mov	sp, r7
    2936:	f85d 7b04 	ldr.w	r7, [sp], #4
    293a:	4770      	bx	lr

0000293c <clear_pending>:

void clear_pending(int irq){
    293c:	b480      	push	{r7}
    293e:	b083      	sub	sp, #12
    2940:	af00      	add	r7, sp, #0
    2942:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    2944:	687b      	ldr	r3, [r7, #4]
    2946:	2b3b      	cmp	r3, #59	; 0x3b
    2948:	dd00      	ble.n	294c <clear_pending+0x10>
    294a:	e00b      	b.n	2964 <clear_pending+0x28>
	ICPR[irq>>5]=(1<<(irq&0x1f));
    294c:	687b      	ldr	r3, [r7, #4]
    294e:	115b      	asrs	r3, r3, #5
    2950:	009a      	lsls	r2, r3, #2
    2952:	4b07      	ldr	r3, [pc, #28]	; (2970 <clear_pending+0x34>)
    2954:	4413      	add	r3, r2
    2956:	687a      	ldr	r2, [r7, #4]
    2958:	f002 021f 	and.w	r2, r2, #31
    295c:	2101      	movs	r1, #1
    295e:	fa01 f202 	lsl.w	r2, r1, r2
    2962:	601a      	str	r2, [r3, #0]
}
    2964:	370c      	adds	r7, #12
    2966:	46bd      	mov	sp, r7
    2968:	f85d 7b04 	ldr.w	r7, [sp], #4
    296c:	4770      	bx	lr
    296e:	bf00      	nop
    2970:	e000e280 	.word	0xe000e280

00002974 <set_int_priority>:


void set_int_priority(int irq, unsigned priority){
    2974:	b480      	push	{r7}
    2976:	b083      	sub	sp, #12
    2978:	af00      	add	r7, sp, #0
    297a:	6078      	str	r0, [r7, #4]
    297c:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    297e:	687b      	ldr	r3, [r7, #4]
    2980:	2b00      	cmp	r3, #0
    2982:	db0d      	blt.n	29a0 <set_int_priority+0x2c>
    2984:	687b      	ldr	r3, [r7, #4]
    2986:	2b3b      	cmp	r3, #59	; 0x3b
    2988:	dc0a      	bgt.n	29a0 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    298a:	687b      	ldr	r3, [r7, #4]
    298c:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2990:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    2994:	683a      	ldr	r2, [r7, #0]
    2996:	b2d2      	uxtb	r2, r2
    2998:	0112      	lsls	r2, r2, #4
    299a:	b2d2      	uxtb	r2, r2
    299c:	701a      	strb	r2, [r3, #0]
    299e:	e012      	b.n	29c6 <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    29a0:	687b      	ldr	r3, [r7, #4]
    29a2:	2b00      	cmp	r3, #0
    29a4:	da0f      	bge.n	29c6 <set_int_priority+0x52>
    29a6:	687b      	ldr	r3, [r7, #4]
    29a8:	f113 0f0f 	cmn.w	r3, #15
    29ac:	db0b      	blt.n	29c6 <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    29ae:	687a      	ldr	r2, [r7, #4]
    29b0:	f06f 0303 	mvn.w	r3, #3
    29b4:	1a9b      	subs	r3, r3, r2
    29b6:	461a      	mov	r2, r3
    29b8:	4b05      	ldr	r3, [pc, #20]	; (29d0 <set_int_priority+0x5c>)
    29ba:	4413      	add	r3, r2
    29bc:	683a      	ldr	r2, [r7, #0]
    29be:	b2d2      	uxtb	r2, r2
    29c0:	0112      	lsls	r2, r2, #4
    29c2:	b2d2      	uxtb	r2, r2
    29c4:	701a      	strb	r2, [r3, #0]
	}
}
    29c6:	370c      	adds	r7, #12
    29c8:	46bd      	mov	sp, r7
    29ca:	f85d 7b04 	ldr.w	r7, [sp], #4
    29ce:	4770      	bx	lr
    29d0:	e000ed18 	.word	0xe000ed18

000029d4 <sdcard_capacity>:

uint16_t sdc_status; // indicateurs booléens carte SD
static unsigned blocks_count; // nombre de bloc de 512 octets

// retourne la capacité en Mo
unsigned sdcard_capacity(){
    29d4:	b480      	push	{r7}
    29d6:	af00      	add	r7, sp, #0
	return blocks_count/2048;
    29d8:	4b03      	ldr	r3, [pc, #12]	; (29e8 <sdcard_capacity+0x14>)
    29da:	681b      	ldr	r3, [r3, #0]
    29dc:	0adb      	lsrs	r3, r3, #11
}
    29de:	4618      	mov	r0, r3
    29e0:	46bd      	mov	sp, r7
    29e2:	f85d 7b04 	ldr.w	r7, [sp], #4
    29e6:	4770      	bx	lr
    29e8:	200000e4 	.word	0x200000e4

000029ec <dummy_clock>:

// après la mise sous tension la carte
// doit-être activée par 80 clock
static void dummy_clock(){
    29ec:	b580      	push	{r7, lr}
    29ee:	b082      	sub	sp, #8
    29f0:	af00      	add	r7, sp, #0
		int i;
		_sdcard_cs_high();
    29f2:	4a0a      	ldr	r2, [pc, #40]	; (2a1c <dummy_clock+0x30>)
    29f4:	4b09      	ldr	r3, [pc, #36]	; (2a1c <dummy_clock+0x30>)
    29f6:	68db      	ldr	r3, [r3, #12]
    29f8:	f043 0310 	orr.w	r3, r3, #16
    29fc:	60d3      	str	r3, [r2, #12]
		// envoie de 80 clock pour activer la carte
		for (i=0;i<10;i++)spi_read(SDC_SPI);
    29fe:	2300      	movs	r3, #0
    2a00:	607b      	str	r3, [r7, #4]
    2a02:	e005      	b.n	2a10 <dummy_clock+0x24>
    2a04:	4806      	ldr	r0, [pc, #24]	; (2a20 <dummy_clock+0x34>)
    2a06:	f000 fb41 	bl	308c <spi_read>
    2a0a:	687b      	ldr	r3, [r7, #4]
    2a0c:	3301      	adds	r3, #1
    2a0e:	607b      	str	r3, [r7, #4]
    2a10:	687b      	ldr	r3, [r7, #4]
    2a12:	2b09      	cmp	r3, #9
    2a14:	ddf6      	ble.n	2a04 <dummy_clock+0x18>
}
    2a16:	3708      	adds	r7, #8
    2a18:	46bd      	mov	sp, r7
    2a1a:	bd80      	pop	{r7, pc}
    2a1c:	40010800 	.word	0x40010800
    2a20:	40013000 	.word	0x40013000

00002a24 <sdc_wait_ready>:

// attend que la carte soie prête
// lit des caractère de la carte 
// jusqu'à ce que le caractèr lu soit 0xff
// expire après 10msec
static int sdc_wait_ready(){
    2a24:	b580      	push	{r7, lr}
    2a26:	b082      	sub	sp, #8
    2a28:	af00      	add	r7, sp, #0
	unsigned char c;
	unsigned t0;
	t0=ticks+500;
    2a2a:	4b0f      	ldr	r3, [pc, #60]	; (2a68 <sdc_wait_ready+0x44>)
    2a2c:	681b      	ldr	r3, [r3, #0]
    2a2e:	f503 73fa 	add.w	r3, r3, #500	; 0x1f4
    2a32:	603b      	str	r3, [r7, #0]
	while (ticks<t0){
    2a34:	e008      	b.n	2a48 <sdc_wait_ready+0x24>
		c=spi_read(SDC_SPI);
    2a36:	480d      	ldr	r0, [pc, #52]	; (2a6c <sdc_wait_ready+0x48>)
    2a38:	f000 fb28 	bl	308c <spi_read>
    2a3c:	4603      	mov	r3, r0
    2a3e:	71fb      	strb	r3, [r7, #7]
	    if (c==0xff){break;}
    2a40:	79fb      	ldrb	r3, [r7, #7]
    2a42:	2bff      	cmp	r3, #255	; 0xff
    2a44:	d100      	bne.n	2a48 <sdc_wait_ready+0x24>
    2a46:	e004      	b.n	2a52 <sdc_wait_ready+0x2e>
// expire après 10msec
static int sdc_wait_ready(){
	unsigned char c;
	unsigned t0;
	t0=ticks+500;
	while (ticks<t0){
    2a48:	4b07      	ldr	r3, [pc, #28]	; (2a68 <sdc_wait_ready+0x44>)
    2a4a:	681a      	ldr	r2, [r3, #0]
    2a4c:	683b      	ldr	r3, [r7, #0]
    2a4e:	429a      	cmp	r2, r3
    2a50:	d3f1      	bcc.n	2a36 <sdc_wait_ready+0x12>
		c=spi_read(SDC_SPI);
	    if (c==0xff){break;}
	}
	return c==0xff;
    2a52:	79fb      	ldrb	r3, [r7, #7]
    2a54:	2bff      	cmp	r3, #255	; 0xff
    2a56:	bf0c      	ite	eq
    2a58:	2301      	moveq	r3, #1
    2a5a:	2300      	movne	r3, #0
    2a5c:	b2db      	uxtb	r3, r3
}
    2a5e:	4618      	mov	r0, r3
    2a60:	3708      	adds	r7, #8
    2a62:	46bd      	mov	sp, r7
    2a64:	bd80      	pop	{r7, pc}
    2a66:	bf00      	nop
    2a68:	200000e8 	.word	0x200000e8
    2a6c:	40013000 	.word	0x40013000

00002a70 <sdcard_deselect>:

// desactivation de l'interface avec la carte
void sdcard_deselect(){
    2a70:	b580      	push	{r7, lr}
    2a72:	af00      	add	r7, sp, #0
	_sdcard_cs_high();
    2a74:	4a05      	ldr	r2, [pc, #20]	; (2a8c <sdcard_deselect+0x1c>)
    2a76:	4b05      	ldr	r3, [pc, #20]	; (2a8c <sdcard_deselect+0x1c>)
    2a78:	68db      	ldr	r3, [r3, #12]
    2a7a:	f043 0310 	orr.w	r3, r3, #16
    2a7e:	60d3      	str	r3, [r2, #12]
	spi_write(SDC_SPI,0xff);
    2a80:	4803      	ldr	r0, [pc, #12]	; (2a90 <sdcard_deselect+0x20>)
    2a82:	21ff      	movs	r1, #255	; 0xff
    2a84:	f000 fae2 	bl	304c <spi_write>
}
    2a88:	bd80      	pop	{r7, pc}
    2a8a:	bf00      	nop
    2a8c:	40010800 	.word	0x40010800
    2a90:	40013000 	.word	0x40013000

00002a94 <sdcard_select>:

// sélection la carte
int sdcard_select(){
    2a94:	b580      	push	{r7, lr}
    2a96:	af00      	add	r7, sp, #0
	_sdcard_cs_low();
    2a98:	4a0a      	ldr	r2, [pc, #40]	; (2ac4 <sdcard_select+0x30>)
    2a9a:	4b0a      	ldr	r3, [pc, #40]	; (2ac4 <sdcard_select+0x30>)
    2a9c:	68db      	ldr	r3, [r3, #12]
    2a9e:	f023 0310 	bic.w	r3, r3, #16
    2aa2:	60d3      	str	r3, [r2, #12]
	spi_write(SDC_SPI,0xff);
    2aa4:	4808      	ldr	r0, [pc, #32]	; (2ac8 <sdcard_select+0x34>)
    2aa6:	21ff      	movs	r1, #255	; 0xff
    2aa8:	f000 fad0 	bl	304c <spi_write>
	if (sdc_wait_ready()){
    2aac:	f7ff ffba 	bl	2a24 <sdc_wait_ready>
    2ab0:	4603      	mov	r3, r0
    2ab2:	2b00      	cmp	r3, #0
    2ab4:	d001      	beq.n	2aba <sdcard_select+0x26>
		return 1;
    2ab6:	2301      	movs	r3, #1
    2ab8:	e002      	b.n	2ac0 <sdcard_select+0x2c>
	}else{
		sdcard_deselect();
    2aba:	f7ff ffd9 	bl	2a70 <sdcard_deselect>
		return 0;
    2abe:	2300      	movs	r3, #0
	}
}
    2ac0:	4618      	mov	r0, r3
    2ac2:	bd80      	pop	{r7, pc}
    2ac4:	40010800 	.word	0x40010800
    2ac8:	40013000 	.word	0x40013000

00002acc <sdc_cmd>:
*    cmd  index de la commande
*    args arguments de la commande
* retourne:
*   r1 1ier octet réponse de la carte
***********************************/
unsigned char sdc_cmd(unsigned char cmd,unsigned char *args){
    2acc:	b580      	push	{r7, lr}
    2ace:	b084      	sub	sp, #16
    2ad0:	af00      	add	r7, sp, #0
    2ad2:	4603      	mov	r3, r0
    2ad4:	6039      	str	r1, [r7, #0]
    2ad6:	71fb      	strb	r3, [r7, #7]
    unsigned char r1;
    int i;
    
    sdcard_deselect();
    2ad8:	f7ff ffca 	bl	2a70 <sdcard_deselect>
    if (!sdcard_select()) return 0xff;
    2adc:	f7ff ffda 	bl	2a94 <sdcard_select>
    2ae0:	4603      	mov	r3, r0
    2ae2:	2b00      	cmp	r3, #0
    2ae4:	d101      	bne.n	2aea <sdc_cmd+0x1e>
    2ae6:	23ff      	movs	r3, #255	; 0xff
    2ae8:	e020      	b.n	2b2c <sdc_cmd+0x60>
    spi_write(SDC_SPI,cmd|0x40);
    2aea:	79fb      	ldrb	r3, [r7, #7]
    2aec:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    2af0:	b2db      	uxtb	r3, r3
    2af2:	4810      	ldr	r0, [pc, #64]	; (2b34 <sdc_cmd+0x68>)
    2af4:	4619      	mov	r1, r3
    2af6:	f000 faa9 	bl	304c <spi_write>
    spi_block_write(SDC_SPI,args,5);
    2afa:	480e      	ldr	r0, [pc, #56]	; (2b34 <sdc_cmd+0x68>)
    2afc:	6839      	ldr	r1, [r7, #0]
    2afe:	2205      	movs	r2, #5
    2b00:	f000 fae4 	bl	30cc <spi_block_write>
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
    2b04:	2308      	movs	r3, #8
    2b06:	60bb      	str	r3, [r7, #8]
    2b08:	e00c      	b.n	2b24 <sdc_cmd+0x58>
		r1=spi_read(SDC_SPI);
    2b0a:	480a      	ldr	r0, [pc, #40]	; (2b34 <sdc_cmd+0x68>)
    2b0c:	f000 fabe 	bl	308c <spi_read>
    2b10:	4603      	mov	r3, r0
    2b12:	73fb      	strb	r3, [r7, #15]
		if (r1<128) {break;}
    2b14:	7bfb      	ldrb	r3, [r7, #15]
    2b16:	b25b      	sxtb	r3, r3
    2b18:	2b00      	cmp	r3, #0
    2b1a:	db00      	blt.n	2b1e <sdc_cmd+0x52>
    2b1c:	e005      	b.n	2b2a <sdc_cmd+0x5e>
    if (!sdcard_select()) return 0xff;
    spi_write(SDC_SPI,cmd|0x40);
    spi_block_write(SDC_SPI,args,5);
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
    2b1e:	68bb      	ldr	r3, [r7, #8]
    2b20:	3b01      	subs	r3, #1
    2b22:	60bb      	str	r3, [r7, #8]
    2b24:	68bb      	ldr	r3, [r7, #8]
    2b26:	2b00      	cmp	r3, #0
    2b28:	d1ef      	bne.n	2b0a <sdc_cmd+0x3e>
		r1=spi_read(SDC_SPI);
		if (r1<128) {break;}
	}
    return r1;
    2b2a:	7bfb      	ldrb	r3, [r7, #15]
}
    2b2c:	4618      	mov	r0, r3
    2b2e:	3710      	adds	r7, #16
    2b30:	46bd      	mov	sp, r7
    2b32:	bd80      	pop	{r7, pc}
    2b34:	40013000 	.word	0x40013000

00002b38 <sdc_read_register>:

unsigned char sdc_read_register(unsigned char index, unsigned char *reg){
    2b38:	b580      	push	{r7, lr}
    2b3a:	b084      	sub	sp, #16
    2b3c:	af00      	add	r7, sp, #0
    2b3e:	4603      	mov	r3, r0
    2b40:	6039      	str	r1, [r7, #0]
    2b42:	71fb      	strb	r3, [r7, #7]
	unsigned char c=0xff, r1, args[5]={0,0,0,0,0};
    2b44:	23ff      	movs	r3, #255	; 0xff
    2b46:	73fb      	strb	r3, [r7, #15]
    2b48:	2300      	movs	r3, #0
    2b4a:	723b      	strb	r3, [r7, #8]
    2b4c:	2300      	movs	r3, #0
    2b4e:	727b      	strb	r3, [r7, #9]
    2b50:	2300      	movs	r3, #0
    2b52:	72bb      	strb	r3, [r7, #10]
    2b54:	2300      	movs	r3, #0
    2b56:	72fb      	strb	r3, [r7, #11]
    2b58:	2300      	movs	r3, #0
    2b5a:	733b      	strb	r3, [r7, #12]
	r1=sdc_cmd(index,args);
    2b5c:	79fa      	ldrb	r2, [r7, #7]
    2b5e:	f107 0308 	add.w	r3, r7, #8
    2b62:	4610      	mov	r0, r2
    2b64:	4619      	mov	r1, r3
    2b66:	f7ff ffb1 	bl	2acc <sdc_cmd>
    2b6a:	4603      	mov	r3, r0
    2b6c:	73bb      	strb	r3, [r7, #14]
	if (!r1){
    2b6e:	7bbb      	ldrb	r3, [r7, #14]
    2b70:	2b00      	cmp	r3, #0
    2b72:	d115      	bne.n	2ba0 <sdc_read_register+0x68>
		do {
			c=spi_read(SDC_SPI);
    2b74:	480f      	ldr	r0, [pc, #60]	; (2bb4 <sdc_read_register+0x7c>)
    2b76:	f000 fa89 	bl	308c <spi_read>
    2b7a:	4603      	mov	r3, r0
    2b7c:	73fb      	strb	r3, [r7, #15]
		}while (c==0xff);
    2b7e:	7bfb      	ldrb	r3, [r7, #15]
    2b80:	2bff      	cmp	r3, #255	; 0xff
    2b82:	d0f7      	beq.n	2b74 <sdc_read_register+0x3c>
		if (c==0xfe){ // lecture de 16 octets
    2b84:	7bfb      	ldrb	r3, [r7, #15]
    2b86:	2bfe      	cmp	r3, #254	; 0xfe
    2b88:	d10a      	bne.n	2ba0 <sdc_read_register+0x68>
			spi_block_read(SDC_SPI,reg,16);
    2b8a:	480a      	ldr	r0, [pc, #40]	; (2bb4 <sdc_read_register+0x7c>)
    2b8c:	6839      	ldr	r1, [r7, #0]
    2b8e:	2210      	movs	r2, #16
    2b90:	f000 fac6 	bl	3120 <spi_block_read>
			// lecture du CRC 16 bits
			spi_read(SDC_SPI);
    2b94:	4807      	ldr	r0, [pc, #28]	; (2bb4 <sdc_read_register+0x7c>)
    2b96:	f000 fa79 	bl	308c <spi_read>
			spi_read(SDC_SPI);
    2b9a:	4806      	ldr	r0, [pc, #24]	; (2bb4 <sdc_read_register+0x7c>)
    2b9c:	f000 fa76 	bl	308c <spi_read>
		}
	}
//	sdcard_deselect();
	return !r1;
    2ba0:	7bbb      	ldrb	r3, [r7, #14]
    2ba2:	2b00      	cmp	r3, #0
    2ba4:	bf0c      	ite	eq
    2ba6:	2301      	moveq	r3, #1
    2ba8:	2300      	movne	r3, #0
    2baa:	b2db      	uxtb	r3, r3
}
    2bac:	4618      	mov	r0, r3
    2bae:	3710      	adds	r7, #16
    2bb0:	46bd      	mov	sp, r7
    2bb2:	bd80      	pop	{r7, pc}
    2bb4:	40013000 	.word	0x40013000

00002bb8 <sdc_set_size>:

// détermine la capacité de la carte
static unsigned char sdc_set_size(){
    2bb8:	b580      	push	{r7, lr}
    2bba:	b088      	sub	sp, #32
    2bbc:	af00      	add	r7, sp, #0
	unsigned char r1,csd[16];
	unsigned block_len,c_size,c_size_mult;
	r1=sdc_read_register(SEND_CSD,csd);
    2bbe:	463b      	mov	r3, r7
    2bc0:	2009      	movs	r0, #9
    2bc2:	4619      	mov	r1, r3
    2bc4:	f7ff ffb8 	bl	2b38 <sdc_read_register>
    2bc8:	4603      	mov	r3, r0
    2bca:	77fb      	strb	r3, [r7, #31]
	if (r1){
    2bcc:	7ffb      	ldrb	r3, [r7, #31]
    2bce:	2b00      	cmp	r3, #0
    2bd0:	d038      	beq.n	2c44 <sdc_set_size+0x8c>
		if (sdc_status&F_SDC_HC){//version 2, carte haute capacité
    2bd2:	4b1f      	ldr	r3, [pc, #124]	; (2c50 <sdc_set_size+0x98>)
    2bd4:	881b      	ldrh	r3, [r3, #0]
    2bd6:	f003 0308 	and.w	r3, r3, #8
    2bda:	2b00      	cmp	r3, #0
    2bdc:	d008      	beq.n	2bf0 <sdc_set_size+0x38>
			blocks_count=1024*((csd[8]<<8)+csd[9]);
    2bde:	7a3b      	ldrb	r3, [r7, #8]
    2be0:	021b      	lsls	r3, r3, #8
    2be2:	7a7a      	ldrb	r2, [r7, #9]
    2be4:	4413      	add	r3, r2
    2be6:	029b      	lsls	r3, r3, #10
    2be8:	461a      	mov	r2, r3
    2bea:	4b1a      	ldr	r3, [pc, #104]	; (2c54 <sdc_set_size+0x9c>)
    2bec:	601a      	str	r2, [r3, #0]
    2bee:	e029      	b.n	2c44 <sdc_set_size+0x8c>
		}else{// version 1
			block_len=1<<((csd[5]&0xf)-1);
    2bf0:	797b      	ldrb	r3, [r7, #5]
    2bf2:	f003 030f 	and.w	r3, r3, #15
    2bf6:	3b01      	subs	r3, #1
    2bf8:	2201      	movs	r2, #1
    2bfa:	fa02 f303 	lsl.w	r3, r2, r3
    2bfe:	61bb      	str	r3, [r7, #24]
			c_size=(csd[6]&0xf<<10)+(csd[7]<<2)+((csd[8]>>6)&3)+1;
    2c00:	79bb      	ldrb	r3, [r7, #6]
    2c02:	f403 5270 	and.w	r2, r3, #15360	; 0x3c00
    2c06:	79fb      	ldrb	r3, [r7, #7]
    2c08:	009b      	lsls	r3, r3, #2
    2c0a:	441a      	add	r2, r3
    2c0c:	7a3b      	ldrb	r3, [r7, #8]
    2c0e:	099b      	lsrs	r3, r3, #6
    2c10:	b2db      	uxtb	r3, r3
    2c12:	f003 0303 	and.w	r3, r3, #3
    2c16:	4413      	add	r3, r2
    2c18:	3301      	adds	r3, #1
    2c1a:	617b      	str	r3, [r7, #20]
			c_size_mult=1<<(((csd[9]&0x3)<<1)+(csd[10]>>7)+2);
    2c1c:	7a7b      	ldrb	r3, [r7, #9]
    2c1e:	f003 0303 	and.w	r3, r3, #3
    2c22:	005b      	lsls	r3, r3, #1
    2c24:	7aba      	ldrb	r2, [r7, #10]
    2c26:	09d2      	lsrs	r2, r2, #7
    2c28:	b2d2      	uxtb	r2, r2
    2c2a:	4413      	add	r3, r2
    2c2c:	3302      	adds	r3, #2
    2c2e:	2201      	movs	r2, #1
    2c30:	fa02 f303 	lsl.w	r3, r2, r3
    2c34:	613b      	str	r3, [r7, #16]
			blocks_count=(c_size*c_size_mult)>>9;
    2c36:	697b      	ldr	r3, [r7, #20]
    2c38:	693a      	ldr	r2, [r7, #16]
    2c3a:	fb02 f303 	mul.w	r3, r2, r3
    2c3e:	0a5b      	lsrs	r3, r3, #9
    2c40:	4a04      	ldr	r2, [pc, #16]	; (2c54 <sdc_set_size+0x9c>)
    2c42:	6013      	str	r3, [r2, #0]
		}
	}
	return r1;
    2c44:	7ffb      	ldrb	r3, [r7, #31]
}
    2c46:	4618      	mov	r0, r3
    2c48:	3720      	adds	r7, #32
    2c4a:	46bd      	mov	sp, r7
    2c4c:	bd80      	pop	{r7, pc}
    2c4e:	bf00      	nop
    2c50:	20000144 	.word	0x20000144
    2c54:	200000e4 	.word	0x200000e4

00002c58 <sdcard_init>:

// flow chart REF: http://elm-chan.org/docs/mmc/ima/sdinit.png
int sdcard_init(){
    2c58:	b580      	push	{r7, lr}
    2c5a:	b088      	sub	sp, #32
    2c5c:	af00      	add	r7, sp, #0
		int i;
		unsigned t0;
		uint8_t r1,args[5], resp[16];
		
		sdc_status=0;
    2c5e:	4b97      	ldr	r3, [pc, #604]	; (2ebc <sdcard_init+0x264>)
    2c60:	2200      	movs	r2, #0
    2c62:	801a      	strh	r2, [r3, #0]
		blocks_count=0;
    2c64:	4b96      	ldr	r3, [pc, #600]	; (2ec0 <sdcard_init+0x268>)
    2c66:	2200      	movs	r2, #0
    2c68:	601a      	str	r2, [r3, #0]
		// initialise le périphérique SPI à la vitesse la plus lente.
		spi_init(SDC_SPI, SDC_CLK_SLOW, SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI, SPI_STD_PORT);
    2c6a:	4896      	ldr	r0, [pc, #600]	; (2ec4 <sdcard_init+0x26c>)
    2c6c:	2107      	movs	r1, #7
    2c6e:	f44f 7241 	mov.w	r2, #772	; 0x304
    2c72:	2300      	movs	r3, #0
    2c74:	f000 f9ba 	bl	2fec <spi_init>
		// delais 2 msec
		pause(2);
    2c78:	2002      	movs	r0, #2
    2c7a:	f000 facd 	bl	3218 <pause>
		sdcard_deselect();
    2c7e:	f7ff fef7 	bl	2a70 <sdcard_deselect>
		dummy_clock();
    2c82:	f7ff feb3 	bl	29ec <dummy_clock>
		if (!sdcard_select()){
    2c86:	f7ff ff05 	bl	2a94 <sdcard_select>
    2c8a:	4603      	mov	r3, r0
    2c8c:	2b00      	cmp	r3, #0
    2c8e:	d108      	bne.n	2ca2 <sdcard_init+0x4a>
				sdc_status|=F_SDC_IE;
    2c90:	4b8a      	ldr	r3, [pc, #552]	; (2ebc <sdcard_init+0x264>)
    2c92:	881b      	ldrh	r3, [r3, #0]
    2c94:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    2c98:	b29a      	uxth	r2, r3
    2c9a:	4b88      	ldr	r3, [pc, #544]	; (2ebc <sdcard_init+0x264>)
    2c9c:	801a      	strh	r2, [r3, #0]
				return 0;
    2c9e:	2300      	movs	r3, #0
    2ca0:	e108      	b.n	2eb4 <sdcard_init+0x25c>
		}
		// envoie GO_IDLE_STATE, CMD0 
		// si succès r1==1
//		print("sending CMD0\n");
		args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMD0_CRC;
    2ca2:	2300      	movs	r3, #0
    2ca4:	743b      	strb	r3, [r7, #16]
    2ca6:	2300      	movs	r3, #0
    2ca8:	747b      	strb	r3, [r7, #17]
    2caa:	2300      	movs	r3, #0
    2cac:	74bb      	strb	r3, [r7, #18]
    2cae:	2300      	movs	r3, #0
    2cb0:	74fb      	strb	r3, [r7, #19]
    2cb2:	2395      	movs	r3, #149	; 0x95
    2cb4:	753b      	strb	r3, [r7, #20]
		r1=sdc_cmd(GO_IDLE_STATE,args);
    2cb6:	f107 0310 	add.w	r3, r7, #16
    2cba:	2000      	movs	r0, #0
    2cbc:	4619      	mov	r1, r3
    2cbe:	f7ff ff05 	bl	2acc <sdc_cmd>
    2cc2:	4603      	mov	r3, r0
    2cc4:	77fb      	strb	r3, [r7, #31]
		switch (r1){
    2cc6:	7ffb      	ldrb	r3, [r7, #31]
    2cc8:	2b01      	cmp	r3, #1
    2cca:	d013      	beq.n	2cf4 <sdcard_init+0x9c>
    2ccc:	2bff      	cmp	r3, #255	; 0xff
    2cce:	d108      	bne.n	2ce2 <sdcard_init+0x8a>
		case 1:
			break;
		case 0xff:
			sdc_status|=F_SDC_TO;
    2cd0:	4b7a      	ldr	r3, [pc, #488]	; (2ebc <sdcard_init+0x264>)
    2cd2:	881b      	ldrh	r3, [r3, #0]
    2cd4:	f043 0310 	orr.w	r3, r3, #16
    2cd8:	b29a      	uxth	r2, r3
    2cda:	4b78      	ldr	r3, [pc, #480]	; (2ebc <sdcard_init+0x264>)
    2cdc:	801a      	strh	r2, [r3, #0]
			return 0;
    2cde:	2300      	movs	r3, #0
    2ce0:	e0e8      	b.n	2eb4 <sdcard_init+0x25c>
		default:
			sdc_status|=F_SDC_IE;
    2ce2:	4b76      	ldr	r3, [pc, #472]	; (2ebc <sdcard_init+0x264>)
    2ce4:	881b      	ldrh	r3, [r3, #0]
    2ce6:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    2cea:	b29a      	uxth	r2, r3
    2cec:	4b73      	ldr	r3, [pc, #460]	; (2ebc <sdcard_init+0x264>)
    2cee:	801a      	strh	r2, [r3, #0]
			return 0;
    2cf0:	2300      	movs	r3, #0
    2cf2:	e0df      	b.n	2eb4 <sdcard_init+0x25c>
//		print("sending CMD0\n");
		args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMD0_CRC;
		r1=sdc_cmd(GO_IDLE_STATE,args);
		switch (r1){
		case 1:
			break;
    2cf4:	bf00      	nop
			return 0;
		default:
			sdc_status|=F_SDC_IE;
			return 0;
		}//switch (r1)
		sdc_status|=F_SDC_IN;
    2cf6:	4b71      	ldr	r3, [pc, #452]	; (2ebc <sdcard_init+0x264>)
    2cf8:	881b      	ldrh	r3, [r3, #0]
    2cfa:	f043 0301 	orr.w	r3, r3, #1
    2cfe:	b29a      	uxth	r2, r3
    2d00:	4b6e      	ldr	r3, [pc, #440]	; (2ebc <sdcard_init+0x264>)
    2d02:	801a      	strh	r2, [r3, #0]
//		print("sending CMD8\n");
		args[2]=1;args[3]=0xaa;args[4]=CMD8_CRC;
    2d04:	2301      	movs	r3, #1
    2d06:	74bb      	strb	r3, [r7, #18]
    2d08:	23aa      	movs	r3, #170	; 0xaa
    2d0a:	74fb      	strb	r3, [r7, #19]
    2d0c:	2387      	movs	r3, #135	; 0x87
    2d0e:	753b      	strb	r3, [r7, #20]
		r1=sdc_cmd(SEND_IF_COND,args);
    2d10:	f107 0310 	add.w	r3, r7, #16
    2d14:	2008      	movs	r0, #8
    2d16:	4619      	mov	r1, r3
    2d18:	f7ff fed8 	bl	2acc <sdc_cmd>
    2d1c:	4603      	mov	r3, r0
    2d1e:	77fb      	strb	r3, [r7, #31]
		if (r1==1){
    2d20:	7ffb      	ldrb	r3, [r7, #31]
    2d22:	2b01      	cmp	r3, #1
    2d24:	d11c      	bne.n	2d60 <sdcard_init+0x108>
			spi_block_read(SDC_SPI,resp,4);
    2d26:	463b      	mov	r3, r7
    2d28:	4866      	ldr	r0, [pc, #408]	; (2ec4 <sdcard_init+0x26c>)
    2d2a:	4619      	mov	r1, r3
    2d2c:	2204      	movs	r2, #4
    2d2e:	f000 f9f7 	bl	3120 <spi_block_read>
			if ((resp[2]==1) && (resp[3]==0xAA)){
    2d32:	78bb      	ldrb	r3, [r7, #2]
    2d34:	2b01      	cmp	r3, #1
    2d36:	d10a      	bne.n	2d4e <sdcard_init+0xf6>
    2d38:	78fb      	ldrb	r3, [r7, #3]
    2d3a:	2baa      	cmp	r3, #170	; 0xaa
    2d3c:	d107      	bne.n	2d4e <sdcard_init+0xf6>
				sdc_status|=F_SDC_V2;
    2d3e:	4b5f      	ldr	r3, [pc, #380]	; (2ebc <sdcard_init+0x264>)
    2d40:	881b      	ldrh	r3, [r3, #0]
    2d42:	f043 0304 	orr.w	r3, r3, #4
    2d46:	b29a      	uxth	r2, r3
    2d48:	4b5c      	ldr	r3, [pc, #368]	; (2ebc <sdcard_init+0x264>)
    2d4a:	801a      	strh	r2, [r3, #0]
    2d4c:	e008      	b.n	2d60 <sdcard_init+0x108>
//				print("card version 2\n");
			}else{
				sdc_status|=F_SDC_BAD_CARD;
    2d4e:	4b5b      	ldr	r3, [pc, #364]	; (2ebc <sdcard_init+0x264>)
    2d50:	881b      	ldrh	r3, [r3, #0]
    2d52:	f443 7380 	orr.w	r3, r3, #256	; 0x100
    2d56:	b29a      	uxth	r2, r3
    2d58:	4b58      	ldr	r3, [pc, #352]	; (2ebc <sdcard_init+0x264>)
    2d5a:	801a      	strh	r2, [r3, #0]
				return 0;
    2d5c:	2300      	movs	r3, #0
    2d5e:	e0a9      	b.n	2eb4 <sdcard_init+0x25c>
			}
		}
		// envoie commande acmd41  APP_SEND_OP_COND
		// cette boucle peu prendre 1 seconde
//		print("sending ACMD41\n");
		t0=ticks+1000;
    2d60:	4b59      	ldr	r3, [pc, #356]	; (2ec8 <sdcard_init+0x270>)
    2d62:	681b      	ldr	r3, [r3, #0]
    2d64:	f503 737a 	add.w	r3, r3, #1000	; 0x3e8
    2d68:	61bb      	str	r3, [r7, #24]
		args[1]=0;args[2]=0;args[3]=0;args[4]=CMDX_CRC;
    2d6a:	2300      	movs	r3, #0
    2d6c:	747b      	strb	r3, [r7, #17]
    2d6e:	2300      	movs	r3, #0
    2d70:	74bb      	strb	r3, [r7, #18]
    2d72:	2300      	movs	r3, #0
    2d74:	74fb      	strb	r3, [r7, #19]
    2d76:	23ff      	movs	r3, #255	; 0xff
    2d78:	753b      	strb	r3, [r7, #20]
		do {
			args[0]=0;
    2d7a:	2300      	movs	r3, #0
    2d7c:	743b      	strb	r3, [r7, #16]
			sdc_cmd(APP_CMD,args);
    2d7e:	f107 0310 	add.w	r3, r7, #16
    2d82:	2037      	movs	r0, #55	; 0x37
    2d84:	4619      	mov	r1, r3
    2d86:	f7ff fea1 	bl	2acc <sdc_cmd>
			if (sdc_status&F_SDC_V2)args[0]=0x40;
    2d8a:	4b4c      	ldr	r3, [pc, #304]	; (2ebc <sdcard_init+0x264>)
    2d8c:	881b      	ldrh	r3, [r3, #0]
    2d8e:	f003 0304 	and.w	r3, r3, #4
    2d92:	2b00      	cmp	r3, #0
    2d94:	d001      	beq.n	2d9a <sdcard_init+0x142>
    2d96:	2340      	movs	r3, #64	; 0x40
    2d98:	743b      	strb	r3, [r7, #16]
			r1=sdc_cmd(APP_SEND_OP_COND,args);
    2d9a:	f107 0310 	add.w	r3, r7, #16
    2d9e:	2029      	movs	r0, #41	; 0x29
    2da0:	4619      	mov	r1, r3
    2da2:	f7ff fe93 	bl	2acc <sdc_cmd>
    2da6:	4603      	mov	r3, r0
    2da8:	77fb      	strb	r3, [r7, #31]
			if (!r1){
    2daa:	7ffb      	ldrb	r3, [r7, #31]
    2dac:	2b00      	cmp	r3, #0
    2dae:	d100      	bne.n	2db2 <sdcard_init+0x15a>
				break;
    2db0:	e004      	b.n	2dbc <sdcard_init+0x164>
		    }
		}while (ticks<t0);
    2db2:	4b45      	ldr	r3, [pc, #276]	; (2ec8 <sdcard_init+0x270>)
    2db4:	681a      	ldr	r2, [r3, #0]
    2db6:	69bb      	ldr	r3, [r7, #24]
    2db8:	429a      	cmp	r2, r3
    2dba:	d3de      	bcc.n	2d7a <sdcard_init+0x122>
		if (r1) {
    2dbc:	7ffb      	ldrb	r3, [r7, #31]
    2dbe:	2b00      	cmp	r3, #0
    2dc0:	d00a      	beq.n	2dd8 <sdcard_init+0x180>
			sdc_status|=F_SDC_TO;
    2dc2:	4b3e      	ldr	r3, [pc, #248]	; (2ebc <sdcard_init+0x264>)
    2dc4:	881b      	ldrh	r3, [r3, #0]
    2dc6:	f043 0310 	orr.w	r3, r3, #16
    2dca:	b29a      	uxth	r2, r3
    2dcc:	4b3b      	ldr	r3, [pc, #236]	; (2ebc <sdcard_init+0x264>)
    2dce:	801a      	strh	r2, [r3, #0]
			sdcard_deselect();
    2dd0:	f7ff fe4e 	bl	2a70 <sdcard_deselect>
			return 0;
    2dd4:	2300      	movs	r3, #0
    2dd6:	e06d      	b.n	2eb4 <sdcard_init+0x25c>
		}
		if (sdc_status&F_SDC_V2){
    2dd8:	4b38      	ldr	r3, [pc, #224]	; (2ebc <sdcard_init+0x264>)
    2dda:	881b      	ldrh	r3, [r3, #0]
    2ddc:	f003 0304 	and.w	r3, r3, #4
    2de0:	2b00      	cmp	r3, #0
    2de2:	d024      	beq.n	2e2e <sdcard_init+0x1d6>
//			print("carte V2, envoie CMD58\n");
	    // evoie commande cmd58 READ_OCR
			args[0]=0;args[1]=0;args[2]=0;args[3]=0;
    2de4:	2300      	movs	r3, #0
    2de6:	743b      	strb	r3, [r7, #16]
    2de8:	2300      	movs	r3, #0
    2dea:	747b      	strb	r3, [r7, #17]
    2dec:	2300      	movs	r3, #0
    2dee:	74bb      	strb	r3, [r7, #18]
    2df0:	2300      	movs	r3, #0
    2df2:	74fb      	strb	r3, [r7, #19]
			r1=sdc_cmd(READ_OCR,args);
    2df4:	f107 0310 	add.w	r3, r7, #16
    2df8:	203a      	movs	r0, #58	; 0x3a
    2dfa:	4619      	mov	r1, r3
    2dfc:	f7ff fe66 	bl	2acc <sdc_cmd>
    2e00:	4603      	mov	r3, r0
    2e02:	77fb      	strb	r3, [r7, #31]
			if (!r1){
    2e04:	7ffb      	ldrb	r3, [r7, #31]
    2e06:	2b00      	cmp	r3, #0
    2e08:	d111      	bne.n	2e2e <sdcard_init+0x1d6>
			    spi_block_read(SDC_SPI,resp,4);
    2e0a:	463b      	mov	r3, r7
    2e0c:	482d      	ldr	r0, [pc, #180]	; (2ec4 <sdcard_init+0x26c>)
    2e0e:	4619      	mov	r1, r3
    2e10:	2204      	movs	r2, #4
    2e12:	f000 f985 	bl	3120 <spi_block_read>
			    if (resp[0]&BIT6){
    2e16:	783b      	ldrb	r3, [r7, #0]
    2e18:	f003 0340 	and.w	r3, r3, #64	; 0x40
    2e1c:	2b00      	cmp	r3, #0
    2e1e:	d006      	beq.n	2e2e <sdcard_init+0x1d6>
					sdc_status|=F_SDC_HC; // block address
    2e20:	4b26      	ldr	r3, [pc, #152]	; (2ebc <sdcard_init+0x264>)
    2e22:	881b      	ldrh	r3, [r3, #0]
    2e24:	f043 0308 	orr.w	r3, r3, #8
    2e28:	b29a      	uxth	r2, r3
    2e2a:	4b24      	ldr	r3, [pc, #144]	; (2ebc <sdcard_init+0x264>)
    2e2c:	801a      	strh	r2, [r3, #0]
				}
			}
		}
		// envoie CMD16 SET_BLOCKLEN
		if (!(sdc_status&F_SDC_HC)){
    2e2e:	4b23      	ldr	r3, [pc, #140]	; (2ebc <sdcard_init+0x264>)
    2e30:	881b      	ldrh	r3, [r3, #0]
    2e32:	f003 0308 	and.w	r3, r3, #8
    2e36:	2b00      	cmp	r3, #0
    2e38:	d120      	bne.n	2e7c <sdcard_init+0x224>
			print("setting block size\n");
    2e3a:	4824      	ldr	r0, [pc, #144]	; (2ecc <sdcard_init+0x274>)
    2e3c:	f7fe fca8 	bl	1790 <print>
			args[0]=0;args[1]=0;args[2]=2;args[3]=0;
    2e40:	2300      	movs	r3, #0
    2e42:	743b      	strb	r3, [r7, #16]
    2e44:	2300      	movs	r3, #0
    2e46:	747b      	strb	r3, [r7, #17]
    2e48:	2302      	movs	r3, #2
    2e4a:	74bb      	strb	r3, [r7, #18]
    2e4c:	2300      	movs	r3, #0
    2e4e:	74fb      	strb	r3, [r7, #19]
			if((r1=sdc_cmd(SET_BLOCKLEN,args))){
    2e50:	f107 0310 	add.w	r3, r7, #16
    2e54:	2010      	movs	r0, #16
    2e56:	4619      	mov	r1, r3
    2e58:	f7ff fe38 	bl	2acc <sdc_cmd>
    2e5c:	4603      	mov	r3, r0
    2e5e:	77fb      	strb	r3, [r7, #31]
    2e60:	7ffb      	ldrb	r3, [r7, #31]
    2e62:	2b00      	cmp	r3, #0
    2e64:	d00a      	beq.n	2e7c <sdcard_init+0x224>
				sdc_status|=F_SDC_IE;
    2e66:	4b15      	ldr	r3, [pc, #84]	; (2ebc <sdcard_init+0x264>)
    2e68:	881b      	ldrh	r3, [r3, #0]
    2e6a:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    2e6e:	b29a      	uxth	r2, r3
    2e70:	4b12      	ldr	r3, [pc, #72]	; (2ebc <sdcard_init+0x264>)
    2e72:	801a      	strh	r2, [r3, #0]
				sdcard_deselect();
    2e74:	f7ff fdfc 	bl	2a70 <sdcard_deselect>
				return 0;
    2e78:	2300      	movs	r3, #0
    2e7a:	e01b      	b.n	2eb4 <sdcard_init+0x25c>
			}
		}
		r1=sdc_set_size();
    2e7c:	f7ff fe9c 	bl	2bb8 <sdc_set_size>
    2e80:	4603      	mov	r3, r0
    2e82:	77fb      	strb	r3, [r7, #31]
		sdc_status|=F_SDC_OK;
    2e84:	4b0d      	ldr	r3, [pc, #52]	; (2ebc <sdcard_init+0x264>)
    2e86:	881b      	ldrh	r3, [r3, #0]
    2e88:	f043 0302 	orr.w	r3, r3, #2
    2e8c:	b29a      	uxth	r2, r3
    2e8e:	4b0b      	ldr	r3, [pc, #44]	; (2ebc <sdcard_init+0x264>)
    2e90:	801a      	strh	r2, [r3, #0]
		_spi_disable(SDC_SPI);
    2e92:	4a0c      	ldr	r2, [pc, #48]	; (2ec4 <sdcard_init+0x26c>)
    2e94:	4b0b      	ldr	r3, [pc, #44]	; (2ec4 <sdcard_init+0x26c>)
    2e96:	681b      	ldr	r3, [r3, #0]
    2e98:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    2e9c:	6013      	str	r3, [r2, #0]
		spi_baudrate(SDC_SPI,SDC_CLK_FAST);
    2e9e:	4809      	ldr	r0, [pc, #36]	; (2ec4 <sdcard_init+0x26c>)
    2ea0:	2101      	movs	r1, #1
    2ea2:	f000 f815 	bl	2ed0 <spi_baudrate>
		_spi_enable(SDC_SPI);
    2ea6:	4a07      	ldr	r2, [pc, #28]	; (2ec4 <sdcard_init+0x26c>)
    2ea8:	4b06      	ldr	r3, [pc, #24]	; (2ec4 <sdcard_init+0x26c>)
    2eaa:	681b      	ldr	r3, [r3, #0]
    2eac:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    2eb0:	6013      	str	r3, [r2, #0]
		return 1;
    2eb2:	2301      	movs	r3, #1
}
    2eb4:	4618      	mov	r0, r3
    2eb6:	3720      	adds	r7, #32
    2eb8:	46bd      	mov	sp, r7
    2eba:	bd80      	pop	{r7, pc}
    2ebc:	20000144 	.word	0x20000144
    2ec0:	200000e4 	.word	0x200000e4
    2ec4:	40013000 	.word	0x40013000
    2ec8:	200000e8 	.word	0x200000e8
    2ecc:	000041ac 	.word	0x000041ac

00002ed0 <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    2ed0:	b480      	push	{r7}
    2ed2:	b083      	sub	sp, #12
    2ed4:	af00      	add	r7, sp, #0
    2ed6:	6078      	str	r0, [r7, #4]
    2ed8:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    2eda:	687b      	ldr	r3, [r7, #4]
    2edc:	681b      	ldr	r3, [r3, #0]
    2ede:	f023 0238 	bic.w	r2, r3, #56	; 0x38
    2ee2:	687b      	ldr	r3, [r7, #4]
    2ee4:	601a      	str	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    2ee6:	687b      	ldr	r3, [r7, #4]
    2ee8:	681a      	ldr	r2, [r3, #0]
    2eea:	683b      	ldr	r3, [r7, #0]
    2eec:	00db      	lsls	r3, r3, #3
    2eee:	431a      	orrs	r2, r3
    2ef0:	687b      	ldr	r3, [r7, #4]
    2ef2:	601a      	str	r2, [r3, #0]
}
    2ef4:	370c      	adds	r7, #12
    2ef6:	46bd      	mov	sp, r7
    2ef8:	f85d 7b04 	ldr.w	r7, [sp], #4
    2efc:	4770      	bx	lr
    2efe:	bf00      	nop

00002f00 <spi_config_port>:

void spi_config_port(spi_sfr_t *channel, int afio_cfg){
    2f00:	b580      	push	{r7, lr}
    2f02:	b082      	sub	sp, #8
    2f04:	af00      	add	r7, sp, #0
    2f06:	6078      	str	r0, [r7, #4]
    2f08:	6039      	str	r1, [r7, #0]
	RCC->APB2ENR|=RCC_APB2ENR_AFIOEN;
    2f0a:	4a33      	ldr	r2, [pc, #204]	; (2fd8 <spi_config_port+0xd8>)
    2f0c:	4b32      	ldr	r3, [pc, #200]	; (2fd8 <spi_config_port+0xd8>)
    2f0e:	699b      	ldr	r3, [r3, #24]
    2f10:	f043 0301 	orr.w	r3, r3, #1
    2f14:	6193      	str	r3, [r2, #24]
	if (channel==SPI1){
    2f16:	687b      	ldr	r3, [r7, #4]
    2f18:	4a30      	ldr	r2, [pc, #192]	; (2fdc <spi_config_port+0xdc>)
    2f1a:	4293      	cmp	r3, r2
    2f1c:	d13e      	bne.n	2f9c <spi_config_port+0x9c>
		if (!afio_cfg){
    2f1e:	683b      	ldr	r3, [r7, #0]
    2f20:	2b00      	cmp	r3, #0
    2f22:	d11a      	bne.n	2f5a <spi_config_port+0x5a>
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    2f24:	4a2c      	ldr	r2, [pc, #176]	; (2fd8 <spi_config_port+0xd8>)
    2f26:	4b2c      	ldr	r3, [pc, #176]	; (2fd8 <spi_config_port+0xd8>)
    2f28:	699b      	ldr	r3, [r3, #24]
    2f2a:	f043 0304 	orr.w	r3, r3, #4
    2f2e:	6193      	str	r3, [r2, #24]
			// configuration port
			// PA4 -> NSS output (push-pull)
			config_pin(PORTA,4,OUTPUT_PP_FAST);
    2f30:	482b      	ldr	r0, [pc, #172]	; (2fe0 <spi_config_port+0xe0>)
    2f32:	2104      	movs	r1, #4
    2f34:	2203      	movs	r2, #3
    2f36:	f7ff f909 	bl	214c <config_pin>
			// PA5 -> SCK output (push-pull)
			config_pin(PORTA,5,OUTPUT_ALT_PP_FAST);
    2f3a:	4829      	ldr	r0, [pc, #164]	; (2fe0 <spi_config_port+0xe0>)
    2f3c:	2105      	movs	r1, #5
    2f3e:	220b      	movs	r2, #11
    2f40:	f7ff f904 	bl	214c <config_pin>
			// PA6 -> MISO input (floating)
			config_pin(PORTA,6,INPUT_FLOAT);
    2f44:	4826      	ldr	r0, [pc, #152]	; (2fe0 <spi_config_port+0xe0>)
    2f46:	2106      	movs	r1, #6
    2f48:	2204      	movs	r2, #4
    2f4a:	f7ff f8ff 	bl	214c <config_pin>
			// PA7 -> MOSI output (push-pull)
			config_pin(PORTA,7,OUTPUT_ALT_PP_FAST);
    2f4e:	4824      	ldr	r0, [pc, #144]	; (2fe0 <spi_config_port+0xe0>)
    2f50:	2107      	movs	r1, #7
    2f52:	220b      	movs	r2, #11
    2f54:	f7ff f8fa 	bl	214c <config_pin>
    2f58:	e03a      	b.n	2fd0 <spi_config_port+0xd0>
		}else{// mappage I/O alternatif
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPBEN+RCC_APB2ENR_IOPAEN+RCC_APB2ENR_AFIOEN;
    2f5a:	4a1f      	ldr	r2, [pc, #124]	; (2fd8 <spi_config_port+0xd8>)
    2f5c:	4b1e      	ldr	r3, [pc, #120]	; (2fd8 <spi_config_port+0xd8>)
    2f5e:	699b      	ldr	r3, [r3, #24]
    2f60:	f043 030d 	orr.w	r3, r3, #13
    2f64:	6193      	str	r3, [r2, #24]
			AFIO->MAPR|=AFIO_MAPR_SPI1_REMAP;
    2f66:	4a1f      	ldr	r2, [pc, #124]	; (2fe4 <spi_config_port+0xe4>)
    2f68:	4b1e      	ldr	r3, [pc, #120]	; (2fe4 <spi_config_port+0xe4>)
    2f6a:	685b      	ldr	r3, [r3, #4]
    2f6c:	f043 0301 	orr.w	r3, r3, #1
    2f70:	6053      	str	r3, [r2, #4]
			// configuration port
			// PA4 -> NSS output (push-pull),  alt PA15
			config_pin(PORTA,15,OUTPUT_PP_FAST);
    2f72:	481b      	ldr	r0, [pc, #108]	; (2fe0 <spi_config_port+0xe0>)
    2f74:	210f      	movs	r1, #15
    2f76:	2203      	movs	r2, #3
    2f78:	f7ff f8e8 	bl	214c <config_pin>
			// PA5 -> SCK output (push-pull),  alt PB3
			config_pin(PORTB,3,OUTPUT_ALT_PP_FAST);
    2f7c:	481a      	ldr	r0, [pc, #104]	; (2fe8 <spi_config_port+0xe8>)
    2f7e:	2103      	movs	r1, #3
    2f80:	220b      	movs	r2, #11
    2f82:	f7ff f8e3 	bl	214c <config_pin>
			// PA6 -> MISO input (floating),   alt PB4
			config_pin(PORTB,4,INPUT_FLOAT);
    2f86:	4818      	ldr	r0, [pc, #96]	; (2fe8 <spi_config_port+0xe8>)
    2f88:	2104      	movs	r1, #4
    2f8a:	2204      	movs	r2, #4
    2f8c:	f7ff f8de 	bl	214c <config_pin>
			// PA7 -> MOSI output (push-pull), alt PB5
			config_pin(PORTB,5,OUTPUT_ALT_PP_FAST);
    2f90:	4815      	ldr	r0, [pc, #84]	; (2fe8 <spi_config_port+0xe8>)
    2f92:	2105      	movs	r1, #5
    2f94:	220b      	movs	r2, #11
    2f96:	f7ff f8d9 	bl	214c <config_pin>
    2f9a:	e019      	b.n	2fd0 <spi_config_port+0xd0>
		}
	}else{
		// activation clock du port
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    2f9c:	4a0e      	ldr	r2, [pc, #56]	; (2fd8 <spi_config_port+0xd8>)
    2f9e:	4b0e      	ldr	r3, [pc, #56]	; (2fd8 <spi_config_port+0xd8>)
    2fa0:	699b      	ldr	r3, [r3, #24]
    2fa2:	f043 0308 	orr.w	r3, r3, #8
    2fa6:	6193      	str	r3, [r2, #24]
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(PORTB,2,OUTPUT_PP_FAST);
    2fa8:	480f      	ldr	r0, [pc, #60]	; (2fe8 <spi_config_port+0xe8>)
    2faa:	2102      	movs	r1, #2
    2fac:	2203      	movs	r2, #3
    2fae:	f7ff f8cd 	bl	214c <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(PORTB,13,OUTPUT_ALT_PP_FAST);
    2fb2:	480d      	ldr	r0, [pc, #52]	; (2fe8 <spi_config_port+0xe8>)
    2fb4:	210d      	movs	r1, #13
    2fb6:	220b      	movs	r2, #11
    2fb8:	f7ff f8c8 	bl	214c <config_pin>
		// PB14 MISO input (floating)
		config_pin(PORTB,14,INPUT_FLOAT);
    2fbc:	480a      	ldr	r0, [pc, #40]	; (2fe8 <spi_config_port+0xe8>)
    2fbe:	210e      	movs	r1, #14
    2fc0:	2204      	movs	r2, #4
    2fc2:	f7ff f8c3 	bl	214c <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    2fc6:	4808      	ldr	r0, [pc, #32]	; (2fe8 <spi_config_port+0xe8>)
    2fc8:	210f      	movs	r1, #15
    2fca:	220b      	movs	r2, #11
    2fcc:	f7ff f8be 	bl	214c <config_pin>
	}
}
    2fd0:	3708      	adds	r7, #8
    2fd2:	46bd      	mov	sp, r7
    2fd4:	bd80      	pop	{r7, pc}
    2fd6:	bf00      	nop
    2fd8:	40021000 	.word	0x40021000
    2fdc:	40013000 	.word	0x40013000
    2fe0:	40010800 	.word	0x40010800
    2fe4:	40010000 	.word	0x40010000
    2fe8:	40010c00 	.word	0x40010c00

00002fec <spi_init>:

void spi_init(spi_sfr_t* channel, unsigned baud,unsigned mode, int afio_cfg){
    2fec:	b580      	push	{r7, lr}
    2fee:	b084      	sub	sp, #16
    2ff0:	af00      	add	r7, sp, #0
    2ff2:	60f8      	str	r0, [r7, #12]
    2ff4:	60b9      	str	r1, [r7, #8]
    2ff6:	607a      	str	r2, [r7, #4]
    2ff8:	603b      	str	r3, [r7, #0]
	spi_config_port(channel,afio_cfg);
    2ffa:	68f8      	ldr	r0, [r7, #12]
    2ffc:	6839      	ldr	r1, [r7, #0]
    2ffe:	f7ff ff7f 	bl	2f00 <spi_config_port>
	// activation clock SPI
	if (channel==SPI1){
    3002:	68fb      	ldr	r3, [r7, #12]
    3004:	4a0f      	ldr	r2, [pc, #60]	; (3044 <spi_init+0x58>)
    3006:	4293      	cmp	r3, r2
    3008:	d106      	bne.n	3018 <spi_init+0x2c>
		RCC->APB2ENR|=RCC_APB2ENR_SPI1EN;
    300a:	4a0f      	ldr	r2, [pc, #60]	; (3048 <spi_init+0x5c>)
    300c:	4b0e      	ldr	r3, [pc, #56]	; (3048 <spi_init+0x5c>)
    300e:	699b      	ldr	r3, [r3, #24]
    3010:	f443 5380 	orr.w	r3, r3, #4096	; 0x1000
    3014:	6193      	str	r3, [r2, #24]
    3016:	e005      	b.n	3024 <spi_init+0x38>
	}else{
		RCC->APB1ENR|=RCC_APB1ENR_SPI2EN;
    3018:	4a0b      	ldr	r2, [pc, #44]	; (3048 <spi_init+0x5c>)
    301a:	4b0b      	ldr	r3, [pc, #44]	; (3048 <spi_init+0x5c>)
    301c:	69db      	ldr	r3, [r3, #28]
    301e:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    3022:	61d3      	str	r3, [r2, #28]
	}
	channel->CR1=mode;
    3024:	68fb      	ldr	r3, [r7, #12]
    3026:	687a      	ldr	r2, [r7, #4]
    3028:	601a      	str	r2, [r3, #0]
	spi_baudrate(channel,baud);
    302a:	68f8      	ldr	r0, [r7, #12]
    302c:	68b9      	ldr	r1, [r7, #8]
    302e:	f7ff ff4f 	bl	2ed0 <spi_baudrate>
	_spi_enable(channel);
    3032:	68fb      	ldr	r3, [r7, #12]
    3034:	681b      	ldr	r3, [r3, #0]
    3036:	f043 0240 	orr.w	r2, r3, #64	; 0x40
    303a:	68fb      	ldr	r3, [r7, #12]
    303c:	601a      	str	r2, [r3, #0]
}
    303e:	3710      	adds	r7, #16
    3040:	46bd      	mov	sp, r7
    3042:	bd80      	pop	{r7, pc}
    3044:	40013000 	.word	0x40013000
    3048:	40021000 	.word	0x40021000

0000304c <spi_write>:


// envoie un octet via le canla SPI
inline void spi_write(spi_sfr_t* channel, uint8_t b){
    304c:	b480      	push	{r7}
    304e:	b085      	sub	sp, #20
    3050:	af00      	add	r7, sp, #0
    3052:	6078      	str	r0, [r7, #4]
    3054:	460b      	mov	r3, r1
    3056:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	while (!(channel->SR&SPI_SR_TXE));
    3058:	bf00      	nop
    305a:	687b      	ldr	r3, [r7, #4]
    305c:	689b      	ldr	r3, [r3, #8]
    305e:	f003 0302 	and.w	r3, r3, #2
    3062:	2b00      	cmp	r3, #0
    3064:	d0f9      	beq.n	305a <spi_write+0xe>
	channel->DR=b;
    3066:	78fa      	ldrb	r2, [r7, #3]
    3068:	687b      	ldr	r3, [r7, #4]
    306a:	60da      	str	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    306c:	bf00      	nop
    306e:	687b      	ldr	r3, [r7, #4]
    3070:	689b      	ldr	r3, [r3, #8]
    3072:	f003 0301 	and.w	r3, r3, #1
    3076:	2b00      	cmp	r3, #0
    3078:	d0f9      	beq.n	306e <spi_write+0x22>
	rx=(uint8_t)channel->DR;
    307a:	687b      	ldr	r3, [r7, #4]
    307c:	68db      	ldr	r3, [r3, #12]
    307e:	73fb      	strb	r3, [r7, #15]
}
    3080:	3714      	adds	r7, #20
    3082:	46bd      	mov	sp, r7
    3084:	f85d 7b04 	ldr.w	r7, [sp], #4
    3088:	4770      	bx	lr
    308a:	bf00      	nop

0000308c <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    308c:	b480      	push	{r7}
    308e:	b085      	sub	sp, #20
    3090:	af00      	add	r7, sp, #0
    3092:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	while (!(channel->SR&SPI_SR_TXE));
    3094:	bf00      	nop
    3096:	687b      	ldr	r3, [r7, #4]
    3098:	689b      	ldr	r3, [r3, #8]
    309a:	f003 0302 	and.w	r3, r3, #2
    309e:	2b00      	cmp	r3, #0
    30a0:	d0f9      	beq.n	3096 <spi_read+0xa>
	channel->DR=255;
    30a2:	687b      	ldr	r3, [r7, #4]
    30a4:	22ff      	movs	r2, #255	; 0xff
    30a6:	60da      	str	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    30a8:	bf00      	nop
    30aa:	687b      	ldr	r3, [r7, #4]
    30ac:	689b      	ldr	r3, [r3, #8]
    30ae:	f003 0301 	and.w	r3, r3, #1
    30b2:	2b00      	cmp	r3, #0
    30b4:	d0f9      	beq.n	30aa <spi_read+0x1e>
	rx=(uint8_t)channel->DR;
    30b6:	687b      	ldr	r3, [r7, #4]
    30b8:	68db      	ldr	r3, [r3, #12]
    30ba:	73fb      	strb	r3, [r7, #15]
	return rx;
    30bc:	7bfb      	ldrb	r3, [r7, #15]
}
    30be:	4618      	mov	r0, r3
    30c0:	3714      	adds	r7, #20
    30c2:	46bd      	mov	sp, r7
    30c4:	f85d 7b04 	ldr.w	r7, [sp], #4
    30c8:	4770      	bx	lr
    30ca:	bf00      	nop

000030cc <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    30cc:	b480      	push	{r7}
    30ce:	b087      	sub	sp, #28
    30d0:	af00      	add	r7, sp, #0
    30d2:	60f8      	str	r0, [r7, #12]
    30d4:	60b9      	str	r1, [r7, #8]
    30d6:	607a      	str	r2, [r7, #4]
	uint8_t rx;
	while (count){
    30d8:	e010      	b.n	30fc <spi_block_write+0x30>
		channel->DR=*buffer++;
    30da:	68bb      	ldr	r3, [r7, #8]
    30dc:	1c5a      	adds	r2, r3, #1
    30de:	60ba      	str	r2, [r7, #8]
    30e0:	781b      	ldrb	r3, [r3, #0]
    30e2:	461a      	mov	r2, r3
    30e4:	68fb      	ldr	r3, [r7, #12]
    30e6:	60da      	str	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    30e8:	bf00      	nop
    30ea:	68fb      	ldr	r3, [r7, #12]
    30ec:	689b      	ldr	r3, [r3, #8]
    30ee:	f003 0302 	and.w	r3, r3, #2
    30f2:	2b00      	cmp	r3, #0
    30f4:	d0f9      	beq.n	30ea <spi_block_write+0x1e>
		count--;
    30f6:	687b      	ldr	r3, [r7, #4]
    30f8:	3b01      	subs	r3, #1
    30fa:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	uint8_t rx;
	while (count){
    30fc:	687b      	ldr	r3, [r7, #4]
    30fe:	2b00      	cmp	r3, #0
    3100:	d1eb      	bne.n	30da <spi_block_write+0xe>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	while (channel->SR&SPI_SR_BSY);
    3102:	bf00      	nop
    3104:	68fb      	ldr	r3, [r7, #12]
    3106:	689b      	ldr	r3, [r3, #8]
    3108:	f003 0380 	and.w	r3, r3, #128	; 0x80
    310c:	2b00      	cmp	r3, #0
    310e:	d1f9      	bne.n	3104 <spi_block_write+0x38>
	rx=(uint8_t)channel->DR;
    3110:	68fb      	ldr	r3, [r7, #12]
    3112:	68db      	ldr	r3, [r3, #12]
    3114:	75fb      	strb	r3, [r7, #23]
}
    3116:	371c      	adds	r7, #28
    3118:	46bd      	mov	sp, r7
    311a:	f85d 7b04 	ldr.w	r7, [sp], #4
    311e:	4770      	bx	lr

00003120 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    3120:	b480      	push	{r7}
    3122:	b085      	sub	sp, #20
    3124:	af00      	add	r7, sp, #0
    3126:	60f8      	str	r0, [r7, #12]
    3128:	60b9      	str	r1, [r7, #8]
    312a:	607a      	str	r2, [r7, #4]
	while (count){
    312c:	e013      	b.n	3156 <spi_block_read+0x36>
		channel->DR=0;
    312e:	68fb      	ldr	r3, [r7, #12]
    3130:	2200      	movs	r2, #0
    3132:	60da      	str	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    3134:	bf00      	nop
    3136:	68fb      	ldr	r3, [r7, #12]
    3138:	689b      	ldr	r3, [r3, #8]
    313a:	f003 0301 	and.w	r3, r3, #1
    313e:	2b00      	cmp	r3, #0
    3140:	d0f9      	beq.n	3136 <spi_block_read+0x16>
		*buffer++=(uint8_t)channel->DR;
    3142:	68bb      	ldr	r3, [r7, #8]
    3144:	1c5a      	adds	r2, r3, #1
    3146:	60ba      	str	r2, [r7, #8]
    3148:	68fa      	ldr	r2, [r7, #12]
    314a:	68d2      	ldr	r2, [r2, #12]
    314c:	b2d2      	uxtb	r2, r2
    314e:	701a      	strb	r2, [r3, #0]
		count--;
    3150:	687b      	ldr	r3, [r7, #4]
    3152:	3b01      	subs	r3, #1
    3154:	607b      	str	r3, [r7, #4]
	rx=(uint8_t)channel->DR;
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	while (count){
    3156:	687b      	ldr	r3, [r7, #4]
    3158:	2b00      	cmp	r3, #0
    315a:	d1e8      	bne.n	312e <spi_block_read+0xe>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
}
    315c:	3714      	adds	r7, #20
    315e:	46bd      	mov	sp, r7
    3160:	f85d 7b04 	ldr.w	r7, [sp], #4
    3164:	4770      	bx	lr
    3166:	bf00      	nop

00003168 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    3168:	4b01      	ldr	r3, [pc, #4]	; (3170 <reset_mcu+0x8>)
    316a:	4a02      	ldr	r2, [pc, #8]	; (3174 <reset_mcu+0xc>)
    316c:	601a      	str	r2, [r3, #0]
    316e:	bf00      	nop
    3170:	e000ed0c 	.word	0xe000ed0c
    3174:	05fa0004 	.word	0x05fa0004

00003178 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    3178:	b580      	push	{r7, lr}
    317a:	b082      	sub	sp, #8
    317c:	af00      	add	r7, sp, #0
    317e:	6078      	str	r0, [r7, #4]
    3180:	6039      	str	r1, [r7, #0]
	print(msg);
    3182:	6878      	ldr	r0, [r7, #4]
    3184:	f7fe fb04 	bl	1790 <print>
	print("at address ");
    3188:	4814      	ldr	r0, [pc, #80]	; (31dc <print_fault+0x64>)
    318a:	f7fe fb01 	bl	1790 <print>
	if (adr) {
    318e:	683b      	ldr	r3, [r7, #0]
    3190:	2b00      	cmp	r3, #0
    3192:	d002      	beq.n	319a <print_fault+0x22>
		print_hex(adr);
    3194:	6838      	ldr	r0, [r7, #0]
    3196:	f7fe fc55 	bl	1a44 <print_hex>
	};
	conout(CR);
    319a:	200d      	movs	r0, #13
    319c:	f7fe fa9a 	bl	16d4 <conout>
	print("UFSR=");
    31a0:	480f      	ldr	r0, [pc, #60]	; (31e0 <print_fault+0x68>)
    31a2:	f7fe faf5 	bl	1790 <print>
	print_hex(CFSR->fsr.usageFalt);
    31a6:	4b0f      	ldr	r3, [pc, #60]	; (31e4 <print_fault+0x6c>)
    31a8:	681b      	ldr	r3, [r3, #0]
    31aa:	0c1b      	lsrs	r3, r3, #16
    31ac:	b29b      	uxth	r3, r3
    31ae:	4618      	mov	r0, r3
    31b0:	f7fe fc48 	bl	1a44 <print_hex>
	print(", BFSR=");
    31b4:	480c      	ldr	r0, [pc, #48]	; (31e8 <print_fault+0x70>)
    31b6:	f7fe faeb 	bl	1790 <print>
	print_hex(CFSR->fsr.busFault);
    31ba:	4b0a      	ldr	r3, [pc, #40]	; (31e4 <print_fault+0x6c>)
    31bc:	681b      	ldr	r3, [r3, #0]
    31be:	0a1b      	lsrs	r3, r3, #8
    31c0:	b2db      	uxtb	r3, r3
    31c2:	4618      	mov	r0, r3
    31c4:	f7fe fc3e 	bl	1a44 <print_hex>
	print(", MMFSR=");
    31c8:	4808      	ldr	r0, [pc, #32]	; (31ec <print_fault+0x74>)
    31ca:	f7fe fae1 	bl	1790 <print>
	print_hex(CFSR->fsr.mmFault);
    31ce:	4b05      	ldr	r3, [pc, #20]	; (31e4 <print_fault+0x6c>)
    31d0:	681b      	ldr	r3, [r3, #0]
    31d2:	b2db      	uxtb	r3, r3
    31d4:	4618      	mov	r0, r3
    31d6:	f7fe fc35 	bl	1a44 <print_hex>
	while(1);
    31da:	e7fe      	b.n	31da <print_fault+0x62>
    31dc:	000041c0 	.word	0x000041c0
    31e0:	000041cc 	.word	0x000041cc
    31e4:	e000ed28 	.word	0xe000ed28
    31e8:	000041d4 	.word	0x000041d4
    31ec:	000041dc 	.word	0x000041dc

000031f0 <config_systicks>:


// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
#define MSEC_DLY FCLK/8/1000
void config_systicks(){
    31f0:	b580      	push	{r7, lr}
    31f2:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,9);
    31f4:	f06f 000e 	mvn.w	r0, #14
    31f8:	2109      	movs	r1, #9
    31fa:	f7ff fbbb 	bl	2974 <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
    31fe:	4b04      	ldr	r3, [pc, #16]	; (3210 <config_systicks+0x20>)
    3200:	f641 723f 	movw	r2, #7999	; 0x1f3f
    3204:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
    3206:	4b03      	ldr	r3, [pc, #12]	; (3214 <config_systicks+0x24>)
    3208:	2203      	movs	r2, #3
    320a:	601a      	str	r2, [r3, #0]
}
    320c:	bd80      	pop	{r7, pc}
    320e:	bf00      	nop
    3210:	e000e014 	.word	0xe000e014
    3214:	e000e010 	.word	0xe000e010

00003218 <pause>:



void pause(unsigned msec){
    3218:	b480      	push	{r7}
    321a:	b083      	sub	sp, #12
    321c:	af00      	add	r7, sp, #0
    321e:	6078      	str	r0, [r7, #4]
	timer=msec;
    3220:	4a06      	ldr	r2, [pc, #24]	; (323c <pause+0x24>)
    3222:	687b      	ldr	r3, [r7, #4]
    3224:	6013      	str	r3, [r2, #0]
	while (timer);
    3226:	bf00      	nop
    3228:	4b04      	ldr	r3, [pc, #16]	; (323c <pause+0x24>)
    322a:	681b      	ldr	r3, [r3, #0]
    322c:	2b00      	cmp	r3, #0
    322e:	d1fb      	bne.n	3228 <pause+0x10>
}
    3230:	370c      	adds	r7, #12
    3232:	46bd      	mov	sp, r7
    3234:	f85d 7b04 	ldr.w	r7, [sp], #4
    3238:	4770      	bx	lr
    323a:	bf00      	nop
    323c:	200000ec 	.word	0x200000ec

00003240 <STK_handler>:


// interruption coretimer
void STK_handler(){
    3240:	b480      	push	{r7}
    3242:	af00      	add	r7, sp, #0
	ticks++;
    3244:	4b08      	ldr	r3, [pc, #32]	; (3268 <STK_handler+0x28>)
    3246:	681b      	ldr	r3, [r3, #0]
    3248:	3301      	adds	r3, #1
    324a:	4a07      	ldr	r2, [pc, #28]	; (3268 <STK_handler+0x28>)
    324c:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
    324e:	4b07      	ldr	r3, [pc, #28]	; (326c <STK_handler+0x2c>)
    3250:	681b      	ldr	r3, [r3, #0]
    3252:	2b00      	cmp	r3, #0
    3254:	d004      	beq.n	3260 <STK_handler+0x20>
    3256:	4b05      	ldr	r3, [pc, #20]	; (326c <STK_handler+0x2c>)
    3258:	681b      	ldr	r3, [r3, #0]
    325a:	3b01      	subs	r3, #1
    325c:	4a03      	ldr	r2, [pc, #12]	; (326c <STK_handler+0x2c>)
    325e:	6013      	str	r3, [r2, #0]
}
    3260:	46bd      	mov	sp, r7
    3262:	f85d 7b04 	ldr.w	r7, [sp], #4
    3266:	4770      	bx	lr
    3268:	200000e8 	.word	0x200000e8
    326c:	200000ec 	.word	0x200000ec

00003270 <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    3270:	b480      	push	{r7}
    3272:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    3274:	2300      	movs	r3, #0
    3276:	2200      	movs	r2, #0
    3278:	4618      	mov	r0, r3
    327a:	4611      	mov	r1, r2
    327c:	df02      	svc	2
}
    327e:	46bd      	mov	sp, r7
    3280:	f85d 7b04 	ldr.w	r7, [sp], #4
    3284:	4770      	bx	lr
    3286:	bf00      	nop

00003288 <tvout_init>:
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN 
#define _disable_pixel_int() TIMER1_DIER->fld.cc2ie=0
#define _enable_pixel_int() ({TIMER1_SR->fld.cc2if=0;TIMER1_DIER->fld.cc2ie=1;})

void tvout_init(){
    3288:	b580      	push	{r7, lr}
    328a:	b082      	sub	sp, #8
    328c:	af02      	add	r7, sp, #8
	//sortie sync sur PA8
	config_pin(PORTA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    328e:	4843      	ldr	r0, [pc, #268]	; (339c <tvout_init+0x114>)
    3290:	2108      	movs	r1, #8
    3292:	220a      	movs	r2, #10
    3294:	f7fe ff5a 	bl	214c <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    3298:	4841      	ldr	r0, [pc, #260]	; (33a0 <tvout_init+0x118>)
    329a:	210f      	movs	r1, #15
    329c:	220b      	movs	r2, #11
    329e:	f7fe ff55 	bl	214c <config_pin>
	PORTB->BRR=BIT15;
    32a2:	4b3f      	ldr	r3, [pc, #252]	; (33a0 <tvout_init+0x118>)
    32a4:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    32a8:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
    32aa:	4a3e      	ldr	r2, [pc, #248]	; (33a4 <tvout_init+0x11c>)
    32ac:	4b3d      	ldr	r3, [pc, #244]	; (33a4 <tvout_init+0x11c>)
    32ae:	699b      	ldr	r3, [r3, #24]
    32b0:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    32b4:	6193      	str	r3, [r2, #24]
	// clock source division
	*TIMER1_PSC=0;
    32b6:	4b3c      	ldr	r3, [pc, #240]	; (33a8 <tvout_init+0x120>)
    32b8:	2200      	movs	r2, #0
    32ba:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    32bc:	4b3b      	ldr	r3, [pc, #236]	; (33ac <tvout_init+0x124>)
    32be:	f640 72ff 	movw	r2, #4095	; 0xfff
    32c2:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    32c4:	4b3a      	ldr	r3, [pc, #232]	; (33b0 <tvout_init+0x128>)
    32c6:	f240 122b 	movw	r2, #299	; 0x12b
    32ca:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    32cc:	4b39      	ldr	r3, [pc, #228]	; (33b4 <tvout_init+0x12c>)
    32ce:	681a      	ldr	r2, [r3, #0]
    32d0:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    32d4:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    32d8:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    32da:	4b36      	ldr	r3, [pc, #216]	; (33b4 <tvout_init+0x12c>)
    32dc:	681a      	ldr	r2, [r3, #0]
    32de:	f042 0208 	orr.w	r2, r2, #8
    32e2:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    32e4:	4b34      	ldr	r3, [pc, #208]	; (33b8 <tvout_init+0x130>)
    32e6:	681a      	ldr	r2, [r3, #0]
    32e8:	f042 0201 	orr.w	r2, r2, #1
    32ec:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    32ee:	4b32      	ldr	r3, [pc, #200]	; (33b8 <tvout_init+0x130>)
    32f0:	681a      	ldr	r2, [r3, #0]
    32f2:	f042 0202 	orr.w	r2, r2, #2
    32f6:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    32f8:	4a30      	ldr	r2, [pc, #192]	; (33bc <tvout_init+0x134>)
    32fa:	8813      	ldrh	r3, [r2, #0]
    32fc:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    3300:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    3304:	8013      	strh	r3, [r2, #0]
	// canal 2 utilisé pour démarrer sortie pixels
	*TIMER1_CCR2=VIDEO_DELAY;
    3306:	4b2e      	ldr	r3, [pc, #184]	; (33c0 <tvout_init+0x138>)
    3308:	f240 4219 	movw	r2, #1049	; 0x419
    330c:	801a      	strh	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc2m=6;
    330e:	4b29      	ldr	r3, [pc, #164]	; (33b4 <tvout_init+0x12c>)
    3310:	681a      	ldr	r2, [r3, #0]
    3312:	f422 42e0 	bic.w	r2, r2, #28672	; 0x7000
    3316:	f442 42c0 	orr.w	r2, r2, #24576	; 0x6000
    331a:	601a      	str	r2, [r3, #0]
	//TIMER1_CCMR1_OCM->fld.oc2pe=1;
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    331c:	4b29      	ldr	r3, [pc, #164]	; (33c4 <tvout_init+0x13c>)
    331e:	681a      	ldr	r2, [r3, #0]
    3320:	f042 0201 	orr.w	r2, r2, #1
    3324:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    3326:	4b28      	ldr	r3, [pc, #160]	; (33c8 <tvout_init+0x140>)
    3328:	f640 324c 	movw	r2, #2892	; 0xb4c
    332c:	601a      	str	r2, [r3, #0]
	SPI2->DR=0;
    332e:	4b26      	ldr	r3, [pc, #152]	; (33c8 <tvout_init+0x140>)
    3330:	2200      	movs	r2, #0
    3332:	60da      	str	r2, [r3, #12]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    3334:	4b25      	ldr	r3, [pc, #148]	; (33cc <tvout_init+0x144>)
    3336:	f243 5292 	movw	r2, #13714	; 0x3592
    333a:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    333c:	4b23      	ldr	r3, [pc, #140]	; (33cc <tvout_init+0x144>)
    333e:	4a24      	ldr	r2, [pc, #144]	; (33d0 <tvout_init+0x148>)
    3340:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    3342:	4a21      	ldr	r2, [pc, #132]	; (33c8 <tvout_init+0x140>)
    3344:	4b20      	ldr	r3, [pc, #128]	; (33c8 <tvout_init+0x140>)
    3346:	685b      	ldr	r3, [r3, #4]
    3348:	f043 0302 	orr.w	r3, r3, #2
    334c:	6053      	str	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,1);
    334e:	200f      	movs	r0, #15
    3350:	2101      	movs	r1, #1
    3352:	f7ff fb0f 	bl	2974 <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    3356:	200f      	movs	r0, #15
    3358:	f7ff fa50 	bl	27fc <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    335c:	4b1d      	ldr	r3, [pc, #116]	; (33d4 <tvout_init+0x14c>)
    335e:	681a      	ldr	r2, [r3, #0]
    3360:	f042 0202 	orr.w	r2, r2, #2
    3364:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TV_SYNC,1);
    3366:	201b      	movs	r0, #27
    3368:	2101      	movs	r1, #1
    336a:	f7ff fb03 	bl	2974 <set_int_priority>
	enable_interrupt(IRQ_TV_SYNC);
    336e:	201b      	movs	r0, #27
    3370:	f7ff fa44 	bl	27fc <enable_interrupt>
	//video test
	gdi_rect(0,0,HRES,VRES,WHITE_BIT);
    3374:	2301      	movs	r3, #1
    3376:	9300      	str	r3, [sp, #0]
    3378:	2000      	movs	r0, #0
    337a:	2100      	movs	r1, #0
    337c:	f44f 72a0 	mov.w	r2, #320	; 0x140
    3380:	23f0      	movs	r3, #240	; 0xf0
    3382:	f7fe fe9b 	bl	20bc <gdi_rect>
	gdi_box(80,60,160,120,WHITE_BIT);
    3386:	2301      	movs	r3, #1
    3388:	9300      	str	r3, [sp, #0]
    338a:	2050      	movs	r0, #80	; 0x50
    338c:	213c      	movs	r1, #60	; 0x3c
    338e:	22a0      	movs	r2, #160	; 0xa0
    3390:	2378      	movs	r3, #120	; 0x78
    3392:	f7fe fd6f 	bl	1e74 <gdi_box>
	// test end */
 }
    3396:	46bd      	mov	sp, r7
    3398:	bd80      	pop	{r7, pc}
    339a:	bf00      	nop
    339c:	40010800 	.word	0x40010800
    33a0:	40010c00 	.word	0x40010c00
    33a4:	40021000 	.word	0x40021000
    33a8:	40012c28 	.word	0x40012c28
    33ac:	40012c2c 	.word	0x40012c2c
    33b0:	40012c34 	.word	0x40012c34
    33b4:	40012c18 	.word	0x40012c18
    33b8:	40012c20 	.word	0x40012c20
    33bc:	40012c44 	.word	0x40012c44
    33c0:	40012c38 	.word	0x40012c38
    33c4:	40012c00 	.word	0x40012c00
    33c8:	40003800 	.word	0x40003800
    33cc:	40020058 	.word	0x40020058
    33d0:	4000380c 	.word	0x4000380c
    33d4:	40012c0c 	.word	0x40012c0c

000033d8 <TIM1_CC_handler>:
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
 __attribute__((optimize("-O1")))  void TV_SYNC_handler(){

	_disable_dma();
    33d8:	4a58      	ldr	r2, [pc, #352]	; (353c <TIM1_CC_handler+0x164>)
    33da:	6813      	ldr	r3, [r2, #0]
    33dc:	f023 0301 	bic.w	r3, r3, #1
    33e0:	6013      	str	r3, [r2, #0]
	if (video && TIMER1_SR->fld.cc2if){ 
    33e2:	4b57      	ldr	r3, [pc, #348]	; (3540 <TIM1_CC_handler+0x168>)
    33e4:	681b      	ldr	r3, [r3, #0]
    33e6:	b1e3      	cbz	r3, 3422 <TIM1_CC_handler+0x4a>
    33e8:	4b56      	ldr	r3, [pc, #344]	; (3544 <TIM1_CC_handler+0x16c>)
    33ea:	681b      	ldr	r3, [r3, #0]
    33ec:	f013 0f04 	tst.w	r3, #4
    33f0:	d017      	beq.n	3422 <TIM1_CC_handler+0x4a>
		TIMER1_SR->fld.cc2if=0;
    33f2:	f5a2 4254 	sub.w	r2, r2, #54272	; 0xd400
    33f6:	3a48      	subs	r2, #72	; 0x48
    33f8:	6813      	ldr	r3, [r2, #0]
    33fa:	f023 0304 	bic.w	r3, r3, #4
    33fe:	6013      	str	r3, [r2, #0]
		DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    3400:	4b51      	ldr	r3, [pc, #324]	; (3548 <TIM1_CC_handler+0x170>)
    3402:	681b      	ldr	r3, [r3, #0]
    3404:	3b3c      	subs	r3, #60	; 0x3c
    3406:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    340a:	4a50      	ldr	r2, [pc, #320]	; (354c <TIM1_CC_handler+0x174>)
    340c:	eb02 03c3 	add.w	r3, r2, r3, lsl #3
    3410:	4a4a      	ldr	r2, [pc, #296]	; (353c <TIM1_CC_handler+0x164>)
    3412:	60d3      	str	r3, [r2, #12]
		DMA1[DMACH5].cndtr=ROW_SIZE;
    3414:	2314      	movs	r3, #20
    3416:	6053      	str	r3, [r2, #4]
		"nop\n\t"
		"nop\n\t"
		::"r" (TIMER1_CNT)
		);
*/
		_enable_dma();
    3418:	6813      	ldr	r3, [r2, #0]
    341a:	f043 0301 	orr.w	r3, r3, #1
    341e:	6013      	str	r3, [r2, #0]
		return;
    3420:	4770      	bx	lr
	}
	TIMER1_SR->fld.cc1if=0;
    3422:	4a48      	ldr	r2, [pc, #288]	; (3544 <TIM1_CC_handler+0x16c>)
    3424:	6813      	ldr	r3, [r2, #0]
    3426:	f023 0302 	bic.w	r3, r3, #2
    342a:	6013      	str	r3, [r2, #0]
	line_count++;
    342c:	4b46      	ldr	r3, [pc, #280]	; (3548 <TIM1_CC_handler+0x170>)
    342e:	681a      	ldr	r2, [r3, #0]
    3430:	3201      	adds	r2, #1
    3432:	601a      	str	r2, [r3, #0]
	switch(line_count){
    3434:	681b      	ldr	r3, [r3, #0]
    3436:	2b12      	cmp	r3, #18
    3438:	d03e      	beq.n	34b8 <TIM1_CC_handler+0xe0>
    343a:	dc09      	bgt.n	3450 <TIM1_CC_handler+0x78>
    343c:	2b06      	cmp	r3, #6
    343e:	d021      	beq.n	3484 <TIM1_CC_handler+0xac>
    3440:	dc01      	bgt.n	3446 <TIM1_CC_handler+0x6e>
    3442:	b1a3      	cbz	r3, 346e <TIM1_CC_handler+0x96>
    3444:	4770      	bx	lr
    3446:	2b0c      	cmp	r3, #12
    3448:	d021      	beq.n	348e <TIM1_CC_handler+0xb6>
    344a:	2b11      	cmp	r3, #17
    344c:	d027      	beq.n	349e <TIM1_CC_handler+0xc6>
    344e:	4770      	bx	lr
    3450:	f5b3 7f96 	cmp.w	r3, #300	; 0x12c
    3454:	d04b      	beq.n	34ee <TIM1_CC_handler+0x116>
    3456:	dc02      	bgt.n	345e <TIM1_CC_handler+0x86>
    3458:	2b3c      	cmp	r3, #60	; 0x3c
    345a:	d03a      	beq.n	34d2 <TIM1_CC_handler+0xfa>
    345c:	4770      	bx	lr
    345e:	f240 1241 	movw	r2, #321	; 0x141
    3462:	4293      	cmp	r3, r2
    3464:	d04c      	beq.n	3500 <TIM1_CC_handler+0x128>
    3466:	f5b3 7fa1 	cmp.w	r3, #322	; 0x142
    346a:	d055      	beq.n	3518 <TIM1_CC_handler+0x140>
    346c:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    346e:	4a38      	ldr	r2, [pc, #224]	; (3550 <TIM1_CC_handler+0x178>)
    3470:	8813      	ldrh	r3, [r2, #0]
    3472:	f3c3 034e 	ubfx	r3, r3, #1, #15
    3476:	8013      	strh	r3, [r2, #0]
		*TIMER1_CCR1/=2;
    3478:	3208      	adds	r2, #8
    347a:	8813      	ldrh	r3, [r2, #0]
    347c:	f3c3 034e 	ubfx	r3, r3, #1, #15
    3480:	8013      	strh	r3, [r2, #0]
		break;
    3482:	4770      	bx	lr
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    3484:	f240 7269 	movw	r2, #1897	; 0x769
    3488:	4b32      	ldr	r3, [pc, #200]	; (3554 <TIM1_CC_handler+0x17c>)
    348a:	801a      	strh	r2, [r3, #0]
	    break;
    348c:	4770      	bx	lr
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    348e:	f240 72ff 	movw	r2, #2047	; 0x7ff
    3492:	4b2f      	ldr	r3, [pc, #188]	; (3550 <TIM1_CC_handler+0x178>)
    3494:	801a      	strh	r2, [r3, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    3496:	2295      	movs	r2, #149	; 0x95
    3498:	3308      	adds	r3, #8
    349a:	801a      	strh	r2, [r3, #0]
		break;
    349c:	4770      	bx	lr
	case 17: // fin sync champ paire
		if (even){
    349e:	4b2e      	ldr	r3, [pc, #184]	; (3558 <TIM1_CC_handler+0x180>)
    34a0:	681b      	ldr	r3, [r3, #0]
    34a2:	2b00      	cmp	r3, #0
    34a4:	d048      	beq.n	3538 <TIM1_CC_handler+0x160>
			*TIMER1_ARR=(FCLK/HFREQ-1);
    34a6:	f640 72ff 	movw	r2, #4095	; 0xfff
    34aa:	4b29      	ldr	r3, [pc, #164]	; (3550 <TIM1_CC_handler+0x178>)
    34ac:	801a      	strh	r2, [r3, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    34ae:	f240 122b 	movw	r2, #299	; 0x12b
    34b2:	3308      	adds	r3, #8
    34b4:	801a      	strh	r2, [r3, #0]
    34b6:	4770      	bx	lr
		}
		break;
	case 18: // fin vsync
		if (!even){
    34b8:	4b27      	ldr	r3, [pc, #156]	; (3558 <TIM1_CC_handler+0x180>)
    34ba:	681b      	ldr	r3, [r3, #0]
    34bc:	2b00      	cmp	r3, #0
    34be:	d13b      	bne.n	3538 <TIM1_CC_handler+0x160>
			*TIMER1_ARR=(FCLK/HFREQ-1);
    34c0:	f640 72ff 	movw	r2, #4095	; 0xfff
    34c4:	4b22      	ldr	r3, [pc, #136]	; (3550 <TIM1_CC_handler+0x178>)
    34c6:	801a      	strh	r2, [r3, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    34c8:	f240 122b 	movw	r2, #299	; 0x12b
    34cc:	3308      	adds	r3, #8
    34ce:	801a      	strh	r2, [r3, #0]
    34d0:	4770      	bx	lr
		}
		break;
	case TOP_LINE:
		_enable_pixel_int();
    34d2:	4a1c      	ldr	r2, [pc, #112]	; (3544 <TIM1_CC_handler+0x16c>)
    34d4:	6813      	ldr	r3, [r2, #0]
    34d6:	f023 0304 	bic.w	r3, r3, #4
    34da:	6013      	str	r3, [r2, #0]
    34dc:	3a04      	subs	r2, #4
    34de:	6813      	ldr	r3, [r2, #0]
    34e0:	f043 0304 	orr.w	r3, r3, #4
    34e4:	6013      	str	r3, [r2, #0]
		video=1;
    34e6:	2201      	movs	r2, #1
    34e8:	4b15      	ldr	r3, [pc, #84]	; (3540 <TIM1_CC_handler+0x168>)
    34ea:	601a      	str	r2, [r3, #0]
		break;
    34ec:	4770      	bx	lr
	case (TOP_LINE+VRES):
		_disable_pixel_int();
    34ee:	4a1b      	ldr	r2, [pc, #108]	; (355c <TIM1_CC_handler+0x184>)
    34f0:	6813      	ldr	r3, [r2, #0]
    34f2:	f023 0304 	bic.w	r3, r3, #4
    34f6:	6013      	str	r3, [r2, #0]
		video=0;
    34f8:	2200      	movs	r2, #0
    34fa:	4b11      	ldr	r3, [pc, #68]	; (3540 <TIM1_CC_handler+0x168>)
    34fc:	601a      	str	r2, [r3, #0]
		break;
    34fe:	4770      	bx	lr
	case FIELD_END:
		if (!even){
    3500:	4b15      	ldr	r3, [pc, #84]	; (3558 <TIM1_CC_handler+0x180>)
    3502:	681b      	ldr	r3, [r3, #0]
    3504:	b9c3      	cbnz	r3, 3538 <TIM1_CC_handler+0x160>
			line_count=-1;
    3506:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    350a:	4b0f      	ldr	r3, [pc, #60]	; (3548 <TIM1_CC_handler+0x170>)
    350c:	601a      	str	r2, [r3, #0]
			even=-even;
    350e:	4a12      	ldr	r2, [pc, #72]	; (3558 <TIM1_CC_handler+0x180>)
    3510:	6813      	ldr	r3, [r2, #0]
    3512:	425b      	negs	r3, r3
    3514:	6013      	str	r3, [r2, #0]
    3516:	4770      	bx	lr
		}
		break;
	case (FIELD_END+1):
		if (even){
    3518:	4b0f      	ldr	r3, [pc, #60]	; (3558 <TIM1_CC_handler+0x180>)
    351a:	681b      	ldr	r3, [r3, #0]
    351c:	b163      	cbz	r3, 3538 <TIM1_CC_handler+0x160>
			*TIMER1_ARR/=2;
    351e:	4a0c      	ldr	r2, [pc, #48]	; (3550 <TIM1_CC_handler+0x178>)
    3520:	8813      	ldrh	r3, [r2, #0]
    3522:	f3c3 034e 	ubfx	r3, r3, #1, #15
    3526:	8013      	strh	r3, [r2, #0]
			line_count=-1;
    3528:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    352c:	4b06      	ldr	r3, [pc, #24]	; (3548 <TIM1_CC_handler+0x170>)
    352e:	601a      	str	r2, [r3, #0]
			even=-even;
    3530:	4a09      	ldr	r2, [pc, #36]	; (3558 <TIM1_CC_handler+0x180>)
    3532:	6813      	ldr	r3, [r2, #0]
    3534:	425b      	negs	r3, r3
    3536:	6013      	str	r3, [r2, #0]
    3538:	4770      	bx	lr
    353a:	bf00      	nop
    353c:	40020058 	.word	0x40020058
    3540:	200000f0 	.word	0x200000f0
    3544:	40012c10 	.word	0x40012c10
    3548:	20000008 	.word	0x20000008
    354c:	20000148 	.word	0x20000148
    3550:	40012c2c 	.word	0x40012c2c
    3554:	40012c34 	.word	0x40012c34
    3558:	200000f4 	.word	0x200000f4
    355c:	40012c0c 	.word	0x40012c0c

00003560 <DMA1CH5_handler>:
	    break;
	}//switch (line_count)
}


void DMA1CH5_handler(){
    3560:	b480      	push	{r7}
    3562:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    3564:	4a09      	ldr	r2, [pc, #36]	; (358c <DMA1CH5_handler+0x2c>)
    3566:	4b09      	ldr	r3, [pc, #36]	; (358c <DMA1CH5_handler+0x2c>)
    3568:	685b      	ldr	r3, [r3, #4]
    356a:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    356e:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    3570:	bf00      	nop
    3572:	4b07      	ldr	r3, [pc, #28]	; (3590 <DMA1CH5_handler+0x30>)
    3574:	689b      	ldr	r3, [r3, #8]
    3576:	f003 0302 	and.w	r3, r3, #2
    357a:	2b00      	cmp	r3, #0
    357c:	d0f9      	beq.n	3572 <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    357e:	4b04      	ldr	r3, [pc, #16]	; (3590 <DMA1CH5_handler+0x30>)
    3580:	2200      	movs	r2, #0
    3582:	60da      	str	r2, [r3, #12]
}
    3584:	46bd      	mov	sp, r7
    3586:	f85d 7b04 	ldr.w	r7, [sp], #4
    358a:	4770      	bx	lr
    358c:	40020000 	.word	0x40020000
    3590:	40003800 	.word	0x40003800

00003594 <usart_config_port>:

#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 

// configuration dse broches
void usart_config_port(usart_t* channel, gpio_t *port, unsigned flow_ctrl){
    3594:	b480      	push	{r7}
    3596:	b085      	sub	sp, #20
    3598:	af00      	add	r7, sp, #0
    359a:	60f8      	str	r0, [r7, #12]
    359c:	60b9      	str	r1, [r7, #8]
    359e:	607a      	str	r2, [r7, #4]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    35a0:	68fb      	ldr	r3, [r7, #12]
    35a2:	4a45      	ldr	r2, [pc, #276]	; (36b8 <usart_config_port+0x124>)
    35a4:	4293      	cmp	r3, r2
    35a6:	d058      	beq.n	365a <usart_config_port+0xc6>
    35a8:	4a44      	ldr	r2, [pc, #272]	; (36bc <usart_config_port+0x128>)
    35aa:	4293      	cmp	r3, r2
    35ac:	d003      	beq.n	35b6 <usart_config_port+0x22>
    35ae:	4a44      	ldr	r2, [pc, #272]	; (36c0 <usart_config_port+0x12c>)
    35b0:	4293      	cmp	r3, r2
    35b2:	d029      	beq.n	3608 <usart_config_port+0x74>
    35b4:	e07a      	b.n	36ac <usart_config_port+0x118>
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
    35b6:	4a43      	ldr	r2, [pc, #268]	; (36c4 <usart_config_port+0x130>)
    35b8:	4b42      	ldr	r3, [pc, #264]	; (36c4 <usart_config_port+0x130>)
    35ba:	699b      	ldr	r3, [r3, #24]
    35bc:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    35c0:	f043 0304 	orr.w	r3, r3, #4
    35c4:	6193      	str	r3, [r2, #24]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    35c6:	687b      	ldr	r3, [r7, #4]
    35c8:	2b01      	cmp	r3, #1
    35ca:	d110      	bne.n	35ee <usart_config_port+0x5a>
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
    35cc:	68bb      	ldr	r3, [r7, #8]
    35ce:	685b      	ldr	r3, [r3, #4]
    35d0:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    35d4:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    35d8:	68ba      	ldr	r2, [r7, #8]
    35da:	6053      	str	r3, [r2, #4]
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
    35dc:	68bb      	ldr	r3, [r7, #8]
    35de:	685b      	ldr	r3, [r3, #4]
    35e0:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    35e4:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    35e8:	68ba      	ldr	r2, [r7, #8]
    35ea:	6053      	str	r3, [r2, #4]
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
		}
		break;
    35ec:	e05e      	b.n	36ac <usart_config_port+0x118>
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
    35ee:	68bb      	ldr	r3, [r7, #8]
    35f0:	685b      	ldr	r3, [r3, #4]
    35f2:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
    35f6:	68bb      	ldr	r3, [r7, #8]
    35f8:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
    35fa:	68bb      	ldr	r3, [r7, #8]
    35fc:	685b      	ldr	r3, [r3, #4]
    35fe:	f043 02a0 	orr.w	r2, r3, #160	; 0xa0
    3602:	68bb      	ldr	r3, [r7, #8]
    3604:	605a      	str	r2, [r3, #4]
		}
		break;
    3606:	e051      	b.n	36ac <usart_config_port+0x118>
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    3608:	4a2e      	ldr	r2, [pc, #184]	; (36c4 <usart_config_port+0x130>)
    360a:	4b2e      	ldr	r3, [pc, #184]	; (36c4 <usart_config_port+0x130>)
    360c:	69db      	ldr	r3, [r3, #28]
    360e:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    3612:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    3614:	4a2b      	ldr	r2, [pc, #172]	; (36c4 <usart_config_port+0x130>)
    3616:	4b2b      	ldr	r3, [pc, #172]	; (36c4 <usart_config_port+0x130>)
    3618:	699b      	ldr	r3, [r3, #24]
    361a:	f043 0304 	orr.w	r3, r3, #4
    361e:	6193      	str	r3, [r2, #24]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
    3620:	687b      	ldr	r3, [r7, #4]
    3622:	2b01      	cmp	r3, #1
    3624:	d10c      	bne.n	3640 <usart_config_port+0xac>
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
    3626:	68bb      	ldr	r3, [r7, #8]
    3628:	681b      	ldr	r3, [r3, #0]
    362a:	f423 627f 	bic.w	r2, r3, #4080	; 0xff0
    362e:	68bb      	ldr	r3, [r7, #8]
    3630:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
    3632:	68bb      	ldr	r3, [r7, #8]
    3634:	681b      	ldr	r3, [r3, #0]
    3636:	f443 622a 	orr.w	r2, r3, #2720	; 0xaa0
    363a:	68bb      	ldr	r3, [r7, #8]
    363c:	601a      	str	r2, [r3, #0]
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
		}
		break;
    363e:	e035      	b.n	36ac <usart_config_port+0x118>
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
    3640:	68bb      	ldr	r3, [r7, #8]
    3642:	681b      	ldr	r3, [r3, #0]
    3644:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    3648:	68bb      	ldr	r3, [r7, #8]
    364a:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
    364c:	68bb      	ldr	r3, [r7, #8]
    364e:	681b      	ldr	r3, [r3, #0]
    3650:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    3654:	68bb      	ldr	r3, [r7, #8]
    3656:	601a      	str	r2, [r3, #0]
		}
		break;
    3658:	e028      	b.n	36ac <usart_config_port+0x118>
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
    365a:	4a1a      	ldr	r2, [pc, #104]	; (36c4 <usart_config_port+0x130>)
    365c:	4b19      	ldr	r3, [pc, #100]	; (36c4 <usart_config_port+0x130>)
    365e:	69db      	ldr	r3, [r3, #28]
    3660:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    3664:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    3666:	4a17      	ldr	r2, [pc, #92]	; (36c4 <usart_config_port+0x130>)
    3668:	4b16      	ldr	r3, [pc, #88]	; (36c4 <usart_config_port+0x130>)
    366a:	699b      	ldr	r3, [r3, #24]
    366c:	f043 0308 	orr.w	r3, r3, #8
    3670:	6193      	str	r3, [r2, #24]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    3672:	687b      	ldr	r3, [r7, #4]
    3674:	2b01      	cmp	r3, #1
    3676:	d10c      	bne.n	3692 <usart_config_port+0xfe>
			port->CR[1]&=~((15<<((USART3_TX_PIN-8)*4))|(15<<((USART3_RTS_PIN-8)*4)));
    3678:	68bb      	ldr	r3, [r7, #8]
    367a:	685b      	ldr	r3, [r3, #4]
    367c:	f023 220f 	bic.w	r2, r3, #251662080	; 0xf000f00
    3680:	68bb      	ldr	r3, [r7, #8]
    3682:	605a      	str	r2, [r3, #4]
			port->CR[1]|=(0xA<<((USART3_TX_PIN-8)*4))|(0xA<<((USART3_RTS_PIN-8)*4));
    3684:	68bb      	ldr	r3, [r7, #8]
    3686:	685b      	ldr	r3, [r3, #4]
    3688:	f043 220a 	orr.w	r2, r3, #167774720	; 0xa000a00
    368c:	68bb      	ldr	r3, [r7, #8]
    368e:	605a      	str	r2, [r3, #4]
    3690:	e00b      	b.n	36aa <usart_config_port+0x116>
		}else{
			port->CR[1]&=~(15<<((USART3_TX_PIN-8)*4));
    3692:	68bb      	ldr	r3, [r7, #8]
    3694:	685b      	ldr	r3, [r3, #4]
    3696:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    369a:	68bb      	ldr	r3, [r7, #8]
    369c:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART3_TX_PIN-8)*4);
    369e:	68bb      	ldr	r3, [r7, #8]
    36a0:	685b      	ldr	r3, [r3, #4]
    36a2:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    36a6:	68bb      	ldr	r3, [r7, #8]
    36a8:	605a      	str	r2, [r3, #4]
		}
		break;
    36aa:	bf00      	nop
	}
}
    36ac:	3714      	adds	r7, #20
    36ae:	46bd      	mov	sp, r7
    36b0:	f85d 7b04 	ldr.w	r7, [sp], #4
    36b4:	4770      	bx	lr
    36b6:	bf00      	nop
    36b8:	40004800 	.word	0x40004800
    36bc:	40013800 	.word	0x40013800
    36c0:	40004400 	.word	0x40004400
    36c4:	40021000 	.word	0x40021000

000036c8 <usart_set_baud>:

// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
    36c8:	b480      	push	{r7}
    36ca:	b085      	sub	sp, #20
    36cc:	af00      	add	r7, sp, #0
    36ce:	6078      	str	r0, [r7, #4]
    36d0:	6039      	str	r1, [r7, #0]
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
    36d2:	687b      	ldr	r3, [r7, #4]
    36d4:	4a14      	ldr	r2, [pc, #80]	; (3728 <usart_set_baud+0x60>)
    36d6:	4293      	cmp	r3, r2
    36d8:	d10f      	bne.n	36fa <usart_set_baud+0x32>
		rate=(FAPB2/baud/16)<<4;
    36da:	4a14      	ldr	r2, [pc, #80]	; (372c <usart_set_baud+0x64>)
    36dc:	683b      	ldr	r3, [r7, #0]
    36de:	fbb2 f3f3 	udiv	r3, r2, r3
    36e2:	011b      	lsls	r3, r3, #4
    36e4:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    36e6:	4a12      	ldr	r2, [pc, #72]	; (3730 <usart_set_baud+0x68>)
    36e8:	683b      	ldr	r3, [r7, #0]
    36ea:	fbb2 f3f3 	udiv	r3, r2, r3
    36ee:	f003 030f 	and.w	r3, r3, #15
    36f2:	68fa      	ldr	r2, [r7, #12]
    36f4:	4313      	orrs	r3, r2
    36f6:	60fb      	str	r3, [r7, #12]
    36f8:	e00e      	b.n	3718 <usart_set_baud+0x50>
	}else{
		rate=(FAPB1/baud/16)<<4;
    36fa:	4a0e      	ldr	r2, [pc, #56]	; (3734 <usart_set_baud+0x6c>)
    36fc:	683b      	ldr	r3, [r7, #0]
    36fe:	fbb2 f3f3 	udiv	r3, r2, r3
    3702:	011b      	lsls	r3, r3, #4
    3704:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    3706:	4a0c      	ldr	r2, [pc, #48]	; (3738 <usart_set_baud+0x70>)
    3708:	683b      	ldr	r3, [r7, #0]
    370a:	fbb2 f3f3 	udiv	r3, r2, r3
    370e:	f003 030f 	and.w	r3, r3, #15
    3712:	68fa      	ldr	r2, [r7, #12]
    3714:	4313      	orrs	r3, r2
    3716:	60fb      	str	r3, [r7, #12]
	}
	channel->BRR=rate;
    3718:	687b      	ldr	r3, [r7, #4]
    371a:	68fa      	ldr	r2, [r7, #12]
    371c:	609a      	str	r2, [r3, #8]
}
    371e:	3714      	adds	r7, #20
    3720:	46bd      	mov	sp, r7
    3722:	f85d 7b04 	ldr.w	r7, [sp], #4
    3726:	4770      	bx	lr
    3728:	40013800 	.word	0x40013800
    372c:	003d0900 	.word	0x003d0900
    3730:	03d09000 	.word	0x03d09000
    3734:	001e8480 	.word	0x001e8480
    3738:	01e84800 	.word	0x01e84800

0000373c <usart_comm_dir>:

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
    373c:	b480      	push	{r7}
    373e:	b083      	sub	sp, #12
    3740:	af00      	add	r7, sp, #0
    3742:	6078      	str	r0, [r7, #4]
    3744:	6039      	str	r1, [r7, #0]
	channel->CR1&=USART_CR1_DIR_MASK;
    3746:	687b      	ldr	r3, [r7, #4]
    3748:	68db      	ldr	r3, [r3, #12]
    374a:	f023 020c 	bic.w	r2, r3, #12
    374e:	687b      	ldr	r3, [r7, #4]
    3750:	60da      	str	r2, [r3, #12]
	channel->CR1|=direction<<USART_CR1_DIR_POS;
    3752:	687b      	ldr	r3, [r7, #4]
    3754:	68da      	ldr	r2, [r3, #12]
    3756:	683b      	ldr	r3, [r7, #0]
    3758:	009b      	lsls	r3, r3, #2
    375a:	431a      	orrs	r2, r3
    375c:	687b      	ldr	r3, [r7, #4]
    375e:	60da      	str	r2, [r3, #12]
}
    3760:	370c      	adds	r7, #12
    3762:	46bd      	mov	sp, r7
    3764:	f85d 7b04 	ldr.w	r7, [sp], #4
    3768:	4770      	bx	lr
    376a:	bf00      	nop

0000376c <usart_open_channel>:


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
    376c:	b580      	push	{r7, lr}
    376e:	b084      	sub	sp, #16
    3770:	af00      	add	r7, sp, #0
    3772:	60f8      	str	r0, [r7, #12]
    3774:	60b9      	str	r1, [r7, #8]
    3776:	607a      	str	r2, [r7, #4]
    3778:	603b      	str	r3, [r7, #0]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    377a:	68fb      	ldr	r3, [r7, #12]
    377c:	4a32      	ldr	r2, [pc, #200]	; (3848 <usart_open_channel+0xdc>)
    377e:	4293      	cmp	r3, r2
    3780:	d020      	beq.n	37c4 <usart_open_channel+0x58>
    3782:	4a32      	ldr	r2, [pc, #200]	; (384c <usart_open_channel+0xe0>)
    3784:	4293      	cmp	r3, r2
    3786:	d003      	beq.n	3790 <usart_open_channel+0x24>
    3788:	4a31      	ldr	r2, [pc, #196]	; (3850 <usart_open_channel+0xe4>)
    378a:	4293      	cmp	r3, r2
    378c:	d00d      	beq.n	37aa <usart_open_channel+0x3e>
    378e:	e026      	b.n	37de <usart_open_channel+0x72>
	case (uint32_t)USART1:
		usart_config_port(channel,USART1_PORT,flow_ctrl);
    3790:	68f8      	ldr	r0, [r7, #12]
    3792:	4930      	ldr	r1, [pc, #192]	; (3854 <usart_open_channel+0xe8>)
    3794:	69ba      	ldr	r2, [r7, #24]
    3796:	f7ff fefd 	bl	3594 <usart_config_port>
		set_int_priority(IRQ_USART1,7);
    379a:	2025      	movs	r0, #37	; 0x25
    379c:	2107      	movs	r1, #7
    379e:	f7ff f8e9 	bl	2974 <set_int_priority>
		enable_interrupt(IRQ_USART1);
    37a2:	2025      	movs	r0, #37	; 0x25
    37a4:	f7ff f82a 	bl	27fc <enable_interrupt>
		break;
    37a8:	e019      	b.n	37de <usart_open_channel+0x72>
	case (uint32_t)USART2:
		usart_config_port(channel,USART2_PORT,flow_ctrl);
    37aa:	68f8      	ldr	r0, [r7, #12]
    37ac:	4929      	ldr	r1, [pc, #164]	; (3854 <usart_open_channel+0xe8>)
    37ae:	69ba      	ldr	r2, [r7, #24]
    37b0:	f7ff fef0 	bl	3594 <usart_config_port>
		set_int_priority(IRQ_USART2,7);
    37b4:	2026      	movs	r0, #38	; 0x26
    37b6:	2107      	movs	r1, #7
    37b8:	f7ff f8dc 	bl	2974 <set_int_priority>
		enable_interrupt(IRQ_USART2);
    37bc:	2026      	movs	r0, #38	; 0x26
    37be:	f7ff f81d 	bl	27fc <enable_interrupt>
		break;
    37c2:	e00c      	b.n	37de <usart_open_channel+0x72>
	case (uint32_t)USART3:
		usart_config_port(channel,USART3_PORT,flow_ctrl);
    37c4:	68f8      	ldr	r0, [r7, #12]
    37c6:	4924      	ldr	r1, [pc, #144]	; (3858 <usart_open_channel+0xec>)
    37c8:	69ba      	ldr	r2, [r7, #24]
    37ca:	f7ff fee3 	bl	3594 <usart_config_port>
		set_int_priority(IRQ_USART3,7);
    37ce:	2027      	movs	r0, #39	; 0x27
    37d0:	2107      	movs	r1, #7
    37d2:	f7ff f8cf 	bl	2974 <set_int_priority>
		enable_interrupt(IRQ_USART3);
    37d6:	2027      	movs	r0, #39	; 0x27
    37d8:	f7ff f810 	bl	27fc <enable_interrupt>
		break;
    37dc:	bf00      	nop
	}
	if (flow_ctrl==FLOW_HARD){
    37de:	69bb      	ldr	r3, [r7, #24]
    37e0:	2b01      	cmp	r3, #1
    37e2:	d103      	bne.n	37ec <usart_open_channel+0x80>
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    37e4:	68fb      	ldr	r3, [r7, #12]
    37e6:	f44f 7240 	mov.w	r2, #768	; 0x300
    37ea:	615a      	str	r2, [r3, #20]
	}
	usart_comm_dir(channel,dir);
    37ec:	68f8      	ldr	r0, [r7, #12]
    37ee:	6839      	ldr	r1, [r7, #0]
    37f0:	f7ff ffa4 	bl	373c <usart_comm_dir>
	switch (parity){
    37f4:	687b      	ldr	r3, [r7, #4]
    37f6:	2b01      	cmp	r3, #1
    37f8:	d00b      	beq.n	3812 <usart_open_channel+0xa6>
    37fa:	2b01      	cmp	r3, #1
    37fc:	d302      	bcc.n	3804 <usart_open_channel+0x98>
    37fe:	2b02      	cmp	r3, #2
    3800:	d00e      	beq.n	3820 <usart_open_channel+0xb4>
    3802:	e014      	b.n	382e <usart_open_channel+0xc2>
	case PARITY_NONE:
		channel->CR1|=USART_CR1_RXNEIE;
    3804:	68fb      	ldr	r3, [r7, #12]
    3806:	68db      	ldr	r3, [r3, #12]
    3808:	f043 0220 	orr.w	r2, r3, #32
    380c:	68fb      	ldr	r3, [r7, #12]
    380e:	60da      	str	r2, [r3, #12]
		break;
    3810:	e00d      	b.n	382e <usart_open_channel+0xc2>
	case PARITY_ODD:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS|USART_CR1_RXNEIE;
    3812:	68fb      	ldr	r3, [r7, #12]
    3814:	68db      	ldr	r3, [r3, #12]
    3816:	f443 62e4 	orr.w	r2, r3, #1824	; 0x720
    381a:	68fb      	ldr	r3, [r7, #12]
    381c:	60da      	str	r2, [r3, #12]
		break;
    381e:	e006      	b.n	382e <usart_open_channel+0xc2>
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_RXNEIE;
    3820:	68fb      	ldr	r3, [r7, #12]
    3822:	68db      	ldr	r3, [r3, #12]
    3824:	f443 62a4 	orr.w	r2, r3, #1312	; 0x520
    3828:	68fb      	ldr	r3, [r7, #12]
    382a:	60da      	str	r2, [r3, #12]
		break;
    382c:	bf00      	nop
    }
	usart_set_baud(channel,baud);
    382e:	68f8      	ldr	r0, [r7, #12]
    3830:	68b9      	ldr	r1, [r7, #8]
    3832:	f7ff ff49 	bl	36c8 <usart_set_baud>
    channel->CR1|=USART_CR1_UE;
    3836:	68fb      	ldr	r3, [r7, #12]
    3838:	68db      	ldr	r3, [r3, #12]
    383a:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
    383e:	68fb      	ldr	r3, [r7, #12]
    3840:	60da      	str	r2, [r3, #12]
}
    3842:	3710      	adds	r7, #16
    3844:	46bd      	mov	sp, r7
    3846:	bd80      	pop	{r7, pc}
    3848:	40004800 	.word	0x40004800
    384c:	40013800 	.word	0x40013800
    3850:	40004400 	.word	0x40004400
    3854:	40010800 	.word	0x40010800
    3858:	40010c00 	.word	0x40010c00

0000385c <usart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
    385c:	b480      	push	{r7}
    385e:	b083      	sub	sp, #12
    3860:	af00      	add	r7, sp, #0
    3862:	6078      	str	r0, [r7, #4]
	return channel->SR&USART_SR_RXNE;
    3864:	687b      	ldr	r3, [r7, #4]
    3866:	681b      	ldr	r3, [r3, #0]
    3868:	f003 0320 	and.w	r3, r3, #32
}
    386c:	4618      	mov	r0, r3
    386e:	370c      	adds	r7, #12
    3870:	46bd      	mov	sp, r7
    3872:	f85d 7b04 	ldr.w	r7, [sp], #4
    3876:	4770      	bx	lr

00003878 <usart_getc>:

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
    3878:	b480      	push	{r7}
    387a:	b083      	sub	sp, #12
    387c:	af00      	add	r7, sp, #0
    387e:	6078      	str	r0, [r7, #4]
	return channel->DR;
    3880:	687b      	ldr	r3, [r7, #4]
    3882:	685b      	ldr	r3, [r3, #4]
    3884:	b2db      	uxtb	r3, r3
}
    3886:	4618      	mov	r0, r3
    3888:	370c      	adds	r7, #12
    388a:	46bd      	mov	sp, r7
    388c:	f85d 7b04 	ldr.w	r7, [sp], #4
    3890:	4770      	bx	lr
    3892:	bf00      	nop

00003894 <usart_putc>:

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
    3894:	b480      	push	{r7}
    3896:	b083      	sub	sp, #12
    3898:	af00      	add	r7, sp, #0
    389a:	6078      	str	r0, [r7, #4]
    389c:	460b      	mov	r3, r1
    389e:	70fb      	strb	r3, [r7, #3]
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
    38a0:	bf00      	nop
    38a2:	687b      	ldr	r3, [r7, #4]
    38a4:	681b      	ldr	r3, [r3, #0]
    38a6:	f003 0380 	and.w	r3, r3, #128	; 0x80
    38aa:	2b00      	cmp	r3, #0
    38ac:	d0f9      	beq.n	38a2 <usart_putc+0xe>
	channel->DR=c;
    38ae:	78fa      	ldrb	r2, [r7, #3]
    38b0:	687b      	ldr	r3, [r7, #4]
    38b2:	605a      	str	r2, [r3, #4]
}
    38b4:	370c      	adds	r7, #12
    38b6:	46bd      	mov	sp, r7
    38b8:	f85d 7b04 	ldr.w	r7, [sp], #4
    38bc:	4770      	bx	lr
    38be:	bf00      	nop

000038c0 <usart_cts>:


int usart_cts(usart_t* channel){
    38c0:	b480      	push	{r7}
    38c2:	b085      	sub	sp, #20
    38c4:	af00      	add	r7, sp, #0
    38c6:	6078      	str	r0, [r7, #4]
	int cts;
	switch ((uint32_t)channel){
    38c8:	687b      	ldr	r3, [r7, #4]
    38ca:	4a11      	ldr	r2, [pc, #68]	; (3910 <usart_cts+0x50>)
    38cc:	4293      	cmp	r3, r2
    38ce:	d012      	beq.n	38f6 <usart_cts+0x36>
    38d0:	4a10      	ldr	r2, [pc, #64]	; (3914 <usart_cts+0x54>)
    38d2:	4293      	cmp	r3, r2
    38d4:	d003      	beq.n	38de <usart_cts+0x1e>
    38d6:	4a10      	ldr	r2, [pc, #64]	; (3918 <usart_cts+0x58>)
    38d8:	4293      	cmp	r3, r2
    38da:	d006      	beq.n	38ea <usart_cts+0x2a>
    38dc:	e011      	b.n	3902 <usart_cts+0x42>
		case (uint32_t)USART1:
			cts=USART1_PORT->IDR&USART1_CTS_BIT;
    38de:	4b0f      	ldr	r3, [pc, #60]	; (391c <usart_cts+0x5c>)
    38e0:	689b      	ldr	r3, [r3, #8]
    38e2:	f403 6300 	and.w	r3, r3, #2048	; 0x800
    38e6:	60fb      	str	r3, [r7, #12]
			break;
    38e8:	e00b      	b.n	3902 <usart_cts+0x42>
		case (uint32_t)USART2:
			cts=USART2_PORT->IDR&USART2_CTS_BIT;
    38ea:	4b0c      	ldr	r3, [pc, #48]	; (391c <usart_cts+0x5c>)
    38ec:	689b      	ldr	r3, [r3, #8]
    38ee:	f003 0301 	and.w	r3, r3, #1
    38f2:	60fb      	str	r3, [r7, #12]
			break;
    38f4:	e005      	b.n	3902 <usart_cts+0x42>
		case (uint32_t)USART3:
			cts=USART3_PORT->IDR&USART3_CTS_BIT;
    38f6:	4b0a      	ldr	r3, [pc, #40]	; (3920 <usart_cts+0x60>)
    38f8:	689b      	ldr	r3, [r3, #8]
    38fa:	f403 5300 	and.w	r3, r3, #8192	; 0x2000
    38fe:	60fb      	str	r3, [r7, #12]
			break;
    3900:	bf00      	nop
	}
	return cts;
    3902:	68fb      	ldr	r3, [r7, #12]
}
    3904:	4618      	mov	r0, r3
    3906:	3714      	adds	r7, #20
    3908:	46bd      	mov	sp, r7
    390a:	f85d 7b04 	ldr.w	r7, [sp], #4
    390e:	4770      	bx	lr
    3910:	40004800 	.word	0x40004800
    3914:	40013800 	.word	0x40013800
    3918:	40004400 	.word	0x40004400
    391c:	40010800 	.word	0x40010800
    3920:	40010c00 	.word	0x40010c00

00003924 <vt_init>:

#include "../include/blue_pill.h"
#include "vt100.h"
#include "console.h"

void vt_init(){
    3924:	b580      	push	{r7, lr}
    3926:	b082      	sub	sp, #8
    3928:	af02      	add	r7, sp, #8
	usart_open_channel(VT_USART,115200,PARITY_NONE,USART_DIR_BIDI,FLOW_HARD);
    392a:	2301      	movs	r3, #1
    392c:	9300      	str	r3, [sp, #0]
    392e:	4804      	ldr	r0, [pc, #16]	; (3940 <vt_init+0x1c>)
    3930:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
    3934:	2200      	movs	r2, #0
    3936:	2303      	movs	r3, #3
    3938:	f7ff ff18 	bl	376c <usart_open_channel>
}
    393c:	46bd      	mov	sp, r7
    393e:	bd80      	pop	{r7, pc}
    3940:	40004400 	.word	0x40004400

00003944 <vt_putc>:

void vt_putc(char c){
    3944:	b580      	push	{r7, lr}
    3946:	b082      	sub	sp, #8
    3948:	af00      	add	r7, sp, #0
    394a:	4603      	mov	r3, r0
    394c:	71fb      	strb	r3, [r7, #7]
	usart_putc(VT_USART,c);
    394e:	79fb      	ldrb	r3, [r7, #7]
    3950:	4803      	ldr	r0, [pc, #12]	; (3960 <vt_putc+0x1c>)
    3952:	4619      	mov	r1, r3
    3954:	f7ff ff9e 	bl	3894 <usart_putc>
}
    3958:	3708      	adds	r7, #8
    395a:	46bd      	mov	sp, r7
    395c:	bd80      	pop	{r7, pc}
    395e:	bf00      	nop
    3960:	40004400 	.word	0x40004400

00003964 <vt_del_back>:

void vt_del_back(){
    3964:	b580      	push	{r7, lr}
    3966:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,BS);
    3968:	4806      	ldr	r0, [pc, #24]	; (3984 <vt_del_back+0x20>)
    396a:	2108      	movs	r1, #8
    396c:	f7ff ff92 	bl	3894 <usart_putc>
	usart_putc(VT_USART,SPACE);
    3970:	4804      	ldr	r0, [pc, #16]	; (3984 <vt_del_back+0x20>)
    3972:	2120      	movs	r1, #32
    3974:	f7ff ff8e 	bl	3894 <usart_putc>
	usart_putc(VT_USART,BS);
    3978:	4802      	ldr	r0, [pc, #8]	; (3984 <vt_del_back+0x20>)
    397a:	2108      	movs	r1, #8
    397c:	f7ff ff8a 	bl	3894 <usart_putc>
}
    3980:	bd80      	pop	{r7, pc}
    3982:	bf00      	nop
    3984:	40004400 	.word	0x40004400

00003988 <vt_esc_seq>:

static void vt_esc_seq(){
    3988:	b580      	push	{r7, lr}
    398a:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,ESC);
    398c:	4804      	ldr	r0, [pc, #16]	; (39a0 <vt_esc_seq+0x18>)
    398e:	211b      	movs	r1, #27
    3990:	f7ff ff80 	bl	3894 <usart_putc>
	usart_putc(VT_USART,'[');
    3994:	4802      	ldr	r0, [pc, #8]	; (39a0 <vt_esc_seq+0x18>)
    3996:	215b      	movs	r1, #91	; 0x5b
    3998:	f7ff ff7c 	bl	3894 <usart_putc>
}
    399c:	bd80      	pop	{r7, pc}
    399e:	bf00      	nop
    39a0:	40004400 	.word	0x40004400

000039a4 <vt_cls>:


// vide l'écran de la console
void vt_cls(){
    39a4:	b580      	push	{r7, lr}
    39a6:	af00      	add	r7, sp, #0
	vt_esc_seq();
    39a8:	f7ff ffee 	bl	3988 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    39ac:	4804      	ldr	r0, [pc, #16]	; (39c0 <vt_cls+0x1c>)
    39ae:	2132      	movs	r1, #50	; 0x32
    39b0:	f7ff ff70 	bl	3894 <usart_putc>
	usart_putc(VT_USART,'J');
    39b4:	4802      	ldr	r0, [pc, #8]	; (39c0 <vt_cls+0x1c>)
    39b6:	214a      	movs	r1, #74	; 0x4a
    39b8:	f7ff ff6c 	bl	3894 <usart_putc>
}
    39bc:	bd80      	pop	{r7, pc}
    39be:	bf00      	nop
    39c0:	40004400 	.word	0x40004400

000039c4 <vt_clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void vt_clear_line(unsigned n){
    39c4:	b580      	push	{r7, lr}
    39c6:	b082      	sub	sp, #8
    39c8:	af00      	add	r7, sp, #0
    39ca:	6078      	str	r0, [r7, #4]
	vt_esc_seq();
    39cc:	f7ff ffdc 	bl	3988 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    39d0:	480a      	ldr	r0, [pc, #40]	; (39fc <vt_clear_line+0x38>)
    39d2:	2132      	movs	r1, #50	; 0x32
    39d4:	f7ff ff5e 	bl	3894 <usart_putc>
	usart_putc(VT_USART,'K');
    39d8:	4808      	ldr	r0, [pc, #32]	; (39fc <vt_clear_line+0x38>)
    39da:	214b      	movs	r1, #75	; 0x4b
    39dc:	f7ff ff5a 	bl	3894 <usart_putc>
	while (n){usart_putc(VT_USART,BS);n--;}
    39e0:	e006      	b.n	39f0 <vt_clear_line+0x2c>
    39e2:	4806      	ldr	r0, [pc, #24]	; (39fc <vt_clear_line+0x38>)
    39e4:	2108      	movs	r1, #8
    39e6:	f7ff ff55 	bl	3894 <usart_putc>
    39ea:	687b      	ldr	r3, [r7, #4]
    39ec:	3b01      	subs	r3, #1
    39ee:	607b      	str	r3, [r7, #4]
    39f0:	687b      	ldr	r3, [r7, #4]
    39f2:	2b00      	cmp	r3, #0
    39f4:	d1f5      	bne.n	39e2 <vt_clear_line+0x1e>
}
    39f6:	3708      	adds	r7, #8
    39f8:	46bd      	mov	sp, r7
    39fa:	bd80      	pop	{r7, pc}
    39fc:	40004400 	.word	0x40004400

00003a00 <vt_ready>:

// vérifie si le terminal est prêt
int vt_ready(){
    3a00:	b480      	push	{r7}
    3a02:	af00      	add	r7, sp, #0
	return !(VT_PORT->IDR&VT_CTS_BIT);
    3a04:	4b06      	ldr	r3, [pc, #24]	; (3a20 <vt_ready+0x20>)
    3a06:	689b      	ldr	r3, [r3, #8]
    3a08:	f003 0301 	and.w	r3, r3, #1
    3a0c:	2b00      	cmp	r3, #0
    3a0e:	bf0c      	ite	eq
    3a10:	2301      	moveq	r3, #1
    3a12:	2300      	movne	r3, #0
    3a14:	b2db      	uxtb	r3, r3
}
    3a16:	4618      	mov	r0, r3
    3a18:	46bd      	mov	sp, r7
    3a1a:	f85d 7b04 	ldr.w	r7, [sp], #4
    3a1e:	4770      	bx	lr
    3a20:	40010800 	.word	0x40010800

00003a24 <vt_rx_enable>:

void vt_rx_enable(int enable){
    3a24:	b480      	push	{r7}
    3a26:	b085      	sub	sp, #20
    3a28:	af00      	add	r7, sp, #0
    3a2a:	6078      	str	r0, [r7, #4]
	char c;
	if (enable){
    3a2c:	687b      	ldr	r3, [r7, #4]
    3a2e:	2b00      	cmp	r3, #0
    3a30:	d006      	beq.n	3a40 <vt_rx_enable+0x1c>
		VT_USART->CR1|=USART_CR1_RXNEIE;
    3a32:	4a0a      	ldr	r2, [pc, #40]	; (3a5c <vt_rx_enable+0x38>)
    3a34:	4b09      	ldr	r3, [pc, #36]	; (3a5c <vt_rx_enable+0x38>)
    3a36:	68db      	ldr	r3, [r3, #12]
    3a38:	f043 0320 	orr.w	r3, r3, #32
    3a3c:	60d3      	str	r3, [r2, #12]
    3a3e:	e008      	b.n	3a52 <vt_rx_enable+0x2e>
	}else{
		c=VT_USART->DR;
    3a40:	4b06      	ldr	r3, [pc, #24]	; (3a5c <vt_rx_enable+0x38>)
    3a42:	685b      	ldr	r3, [r3, #4]
    3a44:	73fb      	strb	r3, [r7, #15]
		VT_USART->CR1&=~USART_CR1_RXNEIE;
    3a46:	4a05      	ldr	r2, [pc, #20]	; (3a5c <vt_rx_enable+0x38>)
    3a48:	4b04      	ldr	r3, [pc, #16]	; (3a5c <vt_rx_enable+0x38>)
    3a4a:	68db      	ldr	r3, [r3, #12]
    3a4c:	f023 0320 	bic.w	r3, r3, #32
    3a50:	60d3      	str	r3, [r2, #12]
	}
}
    3a52:	3714      	adds	r7, #20
    3a54:	46bd      	mov	sp, r7
    3a56:	f85d 7b04 	ldr.w	r7, [sp], #4
    3a5a:	4770      	bx	lr
    3a5c:	40004400 	.word	0x40004400

00003a60 <USART2_handler>:

// interruption serial console
void VT_handler(){
    3a60:	b580      	push	{r7, lr}
    3a62:	af00      	add	r7, sp, #0
	if ((con.dev==SERIAL) && (VT_USART->SR&USART_SR_RXNE)){
    3a64:	4b08      	ldr	r3, [pc, #32]	; (3a88 <USART2_handler+0x28>)
    3a66:	781b      	ldrb	r3, [r3, #0]
    3a68:	2b01      	cmp	r3, #1
    3a6a:	d10c      	bne.n	3a86 <USART2_handler+0x26>
    3a6c:	4b07      	ldr	r3, [pc, #28]	; (3a8c <USART2_handler+0x2c>)
    3a6e:	681b      	ldr	r3, [r3, #0]
    3a70:	f003 0320 	and.w	r3, r3, #32
    3a74:	2b00      	cmp	r3, #0
    3a76:	d006      	beq.n	3a86 <USART2_handler+0x26>
		con.insert(VT_USART->DR);
    3a78:	4b03      	ldr	r3, [pc, #12]	; (3a88 <USART2_handler+0x28>)
    3a7a:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    3a7c:	4a03      	ldr	r2, [pc, #12]	; (3a8c <USART2_handler+0x2c>)
    3a7e:	6852      	ldr	r2, [r2, #4]
    3a80:	b2d2      	uxtb	r2, r2
    3a82:	4610      	mov	r0, r2
    3a84:	4798      	blx	r3
	}
}
    3a86:	bd80      	pop	{r7, pc}
    3a88:	200000fc 	.word	0x200000fc
    3a8c:	40004400 	.word	0x40004400

Disassembly of section .user_code:

00004400 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    4400:	b480      	push	{r7}
    4402:	b085      	sub	sp, #20
    4404:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    4406:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    440a:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    440c:	2300      	movs	r3, #0
    440e:	71fb      	strb	r3, [r7, #7]
	
	_svc_call(SVC_PRINT,"blinking led, any key to stop.\n",0);
    4410:	4b1e      	ldr	r3, [pc, #120]	; (448c <blink+0x8c>)
    4412:	2200      	movs	r2, #0
    4414:	4618      	mov	r0, r3
    4416:	4611      	mov	r1, r2
    4418:	df08      	svc	8
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    441a:	2300      	movs	r3, #0
    441c:	2200      	movs	r2, #0
    441e:	4618      	mov	r0, r3
    4420:	4611      	mov	r1, r2
    4422:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    4424:	f107 030c 	add.w	r3, r7, #12
    4428:	2200      	movs	r2, #0
    442a:	4618      	mov	r0, r3
    442c:	4611      	mov	r1, r2
    442e:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    4430:	f107 0308 	add.w	r3, r7, #8
    4434:	2200      	movs	r2, #0
    4436:	4618      	mov	r0, r3
    4438:	4611      	mov	r1, r2
    443a:	df04      	svc	4
    443c:	68bb      	ldr	r3, [r7, #8]
    443e:	2b00      	cmp	r3, #0
    4440:	d1f6      	bne.n	4430 <blink+0x30>
		_svc_call(SVC_LED_ON,NUL,NUL);
    4442:	2300      	movs	r3, #0
    4444:	2200      	movs	r2, #0
    4446:	4618      	mov	r0, r3
    4448:	4611      	mov	r1, r2
    444a:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    444c:	f107 030c 	add.w	r3, r7, #12
    4450:	2200      	movs	r2, #0
    4452:	4618      	mov	r0, r3
    4454:	4611      	mov	r1, r2
    4456:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    4458:	f107 0308 	add.w	r3, r7, #8
    445c:	2200      	movs	r2, #0
    445e:	4618      	mov	r0, r3
    4460:	4611      	mov	r1, r2
    4462:	df04      	svc	4
    4464:	68bb      	ldr	r3, [r7, #8]
    4466:	2b00      	cmp	r3, #0
    4468:	d1f6      	bne.n	4458 <blink+0x58>
		_svc_call(SVC_CONIN,&c,NUL);
    446a:	1dfb      	adds	r3, r7, #7
    446c:	2200      	movs	r2, #0
    446e:	4618      	mov	r0, r3
    4470:	4611      	mov	r1, r2
    4472:	df05      	svc	5
		if (c) break;
    4474:	79fb      	ldrb	r3, [r7, #7]
    4476:	b2db      	uxtb	r3, r3
    4478:	2b00      	cmp	r3, #0
    447a:	d000      	beq.n	447e <blink+0x7e>
    447c:	e000      	b.n	4480 <blink+0x80>
	}
    447e:	e7cc      	b.n	441a <blink+0x1a>
}
    4480:	3714      	adds	r7, #20
    4482:	46bd      	mov	sp, r7
    4484:	f85d 7b04 	ldr.w	r7, [sp], #4
    4488:	4770      	bx	lr
    448a:	bf00      	nop
    448c:	00003c50 	.word	0x00003c50
