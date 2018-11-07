
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 45 20 00 00     i...m...q...E ..
      20:	45 20 00 00 45 20 00 00 45 20 00 00 b1 05 00 00     E ..E ..E ......
      30:	45 20 00 00 45 20 00 00 79 02 00 00 65 07 00 00     E ..E ..y...e...
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 45 20 00 00 45 20 00 00 a1 23 00 00     ....E ..E ...#..
      80:	45 20 00 00 45 20 00 00 45 20 00 00 45 20 00 00     E ..E ..E ..E ..
      90:	45 20 00 00 45 20 00 00 45 20 00 00 45 20 00 00     E ..E ..E ..E ..
      a0:	45 20 00 00 45 20 00 00 45 20 00 00 79 22 00 00     E ..E ..E ..y"..
      b0:	45 20 00 00 45 20 00 00 45 20 00 00 45 20 00 00     E ..E ..E ..E ..
      c0:	45 20 00 00 45 20 00 00 45 20 00 00 45 20 00 00     E ..E ..E ..E ..
      d0:	45 20 00 00 09 1a 00 00 81 10 00 00 c5 02 00 00     E ..............
      e0:	45 20 00 00 45 20 00 00 45 20 00 00 45 20 00 00     E ..E ..E ..E ..
      f0:	45 20 00 00 45 20 00 00 45 20 00 00 45 20 00 00     E ..E ..E ..E ..
     100:	45 20 00 00 45 20 00 00 45 20 00 00 45 20 00 00     E ..E ..E ..E ..
     110:	45 20 00 00 45 20 00 00 45 20 00 00 45 20 00 00     E ..E ..E ..E ..
     120:	45 20 00 00 45 20 00 00 45 20 00 00 45 20 00 00     E ..E ..E ..E ..

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
     1b0:	f000 fee4 	bl	f7c <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	20000008 	.word	0x20000008
     1c0:	200026a0 	.word	0x200026a0
     1c4:	00003080 	.word	0x00003080
     1c8:	20000000 	.word	0x20000000
     1cc:	20000008 	.word	0x20000008
     1d0:	20002700 	.word	0x20002700
     1d4:	20000118 	.word	0x20000118
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
     208:	f001 ff24 	bl	2054 <print_fault>
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
     21e:	f001 ff19 	bl	2054 <print_fault>
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
     234:	f001 ff0e 	bl	2054 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f001 ff09 	bl	2054 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	00002ca8 	.word	0x00002ca8
     258:	00002cc0 	.word	0x00002cc0
     25c:	00002ccc 	.word	0x00002ccc
     260:	00002cdc 	.word	0x00002cdc

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f001 feee 	bl	2044 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f001 feec 	bl	2044 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f001 feea 	bl	2044 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f001 fee8 	bl	2044 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f001 fee6 	bl	2044 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f001 fee4 	bl	2044 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f001 fee2 	bl	2044 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f001 fee0 	bl	2044 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f001 fede 	bl	2044 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f001 fedc 	bl	2044 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f001 feda 	bl	2044 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f001 fed8 	bl	2044 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f001 fed6 	bl	2044 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f001 fed4 	bl	2044 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f001 fed2 	bl	2044 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f001 fed0 	bl	2044 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f001 fece 	bl	2044 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f001 fecc 	bl	2044 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f001 feca 	bl	2044 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f001 fec8 	bl	2044 <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f001 fec6 	bl	2044 <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2b8:	f001 fec4 	bl	2044 <reset_mcu>
_default_handler(USART1_handler) // 37
     2bc:	f001 fec2 	bl	2044 <reset_mcu>
_default_handler(USART2_handler) // 38
     2c0:	f001 fec0 	bl	2044 <reset_mcu>

000002c4 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2c4:	f001 febe 	bl	2044 <reset_mcu>

000002c8 <strcmp>:
extern unsigned int _FLASH_FREE;
extern unsigned int _DATA_ROM_START;

uint32_t proga;

int strcmp(const char *s1, const char *s2){
     2c8:	b480      	push	{r7}
     2ca:	b085      	sub	sp, #20
     2cc:	af00      	add	r7, sp, #0
     2ce:	6078      	str	r0, [r7, #4]
     2d0:	6039      	str	r1, [r7, #0]
	int result=0;
     2d2:	2300      	movs	r3, #0
     2d4:	60fb      	str	r3, [r7, #12]
	while (*s1 && *s2){
     2d6:	e018      	b.n	30a <strcmp+0x42>
		if (*s1<*s2){
     2d8:	687b      	ldr	r3, [r7, #4]
     2da:	781a      	ldrb	r2, [r3, #0]
     2dc:	683b      	ldr	r3, [r7, #0]
     2de:	781b      	ldrb	r3, [r3, #0]
     2e0:	429a      	cmp	r2, r3
     2e2:	d203      	bcs.n	2ec <strcmp+0x24>
			result=-1;
     2e4:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     2e8:	60fb      	str	r3, [r7, #12]
			break;
     2ea:	e016      	b.n	31a <strcmp+0x52>
		}else if (*s1>*s2){
     2ec:	687b      	ldr	r3, [r7, #4]
     2ee:	781a      	ldrb	r2, [r3, #0]
     2f0:	683b      	ldr	r3, [r7, #0]
     2f2:	781b      	ldrb	r3, [r3, #0]
     2f4:	429a      	cmp	r2, r3
     2f6:	d902      	bls.n	2fe <strcmp+0x36>
			result=1;
     2f8:	2301      	movs	r3, #1
     2fa:	60fb      	str	r3, [r7, #12]
			break;
     2fc:	e00d      	b.n	31a <strcmp+0x52>
		}
		s1++;
     2fe:	687b      	ldr	r3, [r7, #4]
     300:	3301      	adds	r3, #1
     302:	607b      	str	r3, [r7, #4]
		s2++;
     304:	683b      	ldr	r3, [r7, #0]
     306:	3301      	adds	r3, #1
     308:	603b      	str	r3, [r7, #0]

uint32_t proga;

int strcmp(const char *s1, const char *s2){
	int result=0;
	while (*s1 && *s2){
     30a:	687b      	ldr	r3, [r7, #4]
     30c:	781b      	ldrb	r3, [r3, #0]
     30e:	2b00      	cmp	r3, #0
     310:	d003      	beq.n	31a <strcmp+0x52>
     312:	683b      	ldr	r3, [r7, #0]
     314:	781b      	ldrb	r3, [r3, #0]
     316:	2b00      	cmp	r3, #0
     318:	d1de      	bne.n	2d8 <strcmp+0x10>
			break;
		}
		s1++;
		s2++;
	}
	if (!result){
     31a:	68fb      	ldr	r3, [r7, #12]
     31c:	2b00      	cmp	r3, #0
     31e:	d115      	bne.n	34c <strcmp+0x84>
		if (!*s1 && *s2){
     320:	687b      	ldr	r3, [r7, #4]
     322:	781b      	ldrb	r3, [r3, #0]
     324:	2b00      	cmp	r3, #0
     326:	d107      	bne.n	338 <strcmp+0x70>
     328:	683b      	ldr	r3, [r7, #0]
     32a:	781b      	ldrb	r3, [r3, #0]
     32c:	2b00      	cmp	r3, #0
     32e:	d003      	beq.n	338 <strcmp+0x70>
			result=-1;
     330:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     334:	60fb      	str	r3, [r7, #12]
     336:	e009      	b.n	34c <strcmp+0x84>
		}else if (*s1 && !*s2) {
     338:	687b      	ldr	r3, [r7, #4]
     33a:	781b      	ldrb	r3, [r3, #0]
     33c:	2b00      	cmp	r3, #0
     33e:	d005      	beq.n	34c <strcmp+0x84>
     340:	683b      	ldr	r3, [r7, #0]
     342:	781b      	ldrb	r3, [r3, #0]
     344:	2b00      	cmp	r3, #0
     346:	d101      	bne.n	34c <strcmp+0x84>
			result=1;
     348:	2301      	movs	r3, #1
     34a:	60fb      	str	r3, [r7, #12]
		}
	}
	return result;
     34c:	68fb      	ldr	r3, [r7, #12]
}
     34e:	4618      	mov	r0, r3
     350:	3714      	adds	r7, #20
     352:	46bd      	mov	sp, r7
     354:	f85d 7b04 	ldr.w	r7, [sp], #4
     358:	4770      	bx	lr
     35a:	bf00      	nop

0000035c <digit>:

int digit(char c){
     35c:	b480      	push	{r7}
     35e:	b083      	sub	sp, #12
     360:	af00      	add	r7, sp, #0
     362:	4603      	mov	r3, r0
     364:	71fb      	strb	r3, [r7, #7]
   return ((c>='0') && (c<='9'));
     366:	79fb      	ldrb	r3, [r7, #7]
     368:	2b2f      	cmp	r3, #47	; 0x2f
     36a:	d904      	bls.n	376 <digit+0x1a>
     36c:	79fb      	ldrb	r3, [r7, #7]
     36e:	2b39      	cmp	r3, #57	; 0x39
     370:	d801      	bhi.n	376 <digit+0x1a>
     372:	2301      	movs	r3, #1
     374:	e000      	b.n	378 <digit+0x1c>
     376:	2300      	movs	r3, #0
}
     378:	4618      	mov	r0, r3
     37a:	370c      	adds	r7, #12
     37c:	46bd      	mov	sp, r7
     37e:	f85d 7b04 	ldr.w	r7, [sp], #4
     382:	4770      	bx	lr

00000384 <hexdigit>:

int hexdigit(char c){
     384:	b580      	push	{r7, lr}
     386:	b082      	sub	sp, #8
     388:	af00      	add	r7, sp, #0
     38a:	4603      	mov	r3, r0
     38c:	71fb      	strb	r3, [r7, #7]
	if (c>='a') c-=32;
     38e:	79fb      	ldrb	r3, [r7, #7]
     390:	2b60      	cmp	r3, #96	; 0x60
     392:	d902      	bls.n	39a <hexdigit+0x16>
     394:	79fb      	ldrb	r3, [r7, #7]
     396:	3b20      	subs	r3, #32
     398:	71fb      	strb	r3, [r7, #7]
	return (digit(c) || (c>='A' && c<='F'));
     39a:	79fb      	ldrb	r3, [r7, #7]
     39c:	4618      	mov	r0, r3
     39e:	f7ff ffdd 	bl	35c <digit>
     3a2:	4603      	mov	r3, r0
     3a4:	2b00      	cmp	r3, #0
     3a6:	d105      	bne.n	3b4 <hexdigit+0x30>
     3a8:	79fb      	ldrb	r3, [r7, #7]
     3aa:	2b40      	cmp	r3, #64	; 0x40
     3ac:	d904      	bls.n	3b8 <hexdigit+0x34>
     3ae:	79fb      	ldrb	r3, [r7, #7]
     3b0:	2b46      	cmp	r3, #70	; 0x46
     3b2:	d801      	bhi.n	3b8 <hexdigit+0x34>
     3b4:	2301      	movs	r3, #1
     3b6:	e000      	b.n	3ba <hexdigit+0x36>
     3b8:	2300      	movs	r3, #0
}
     3ba:	4618      	mov	r0, r3
     3bc:	3708      	adds	r7, #8
     3be:	46bd      	mov	sp, r7
     3c0:	bd80      	pop	{r7, pc}
     3c2:	bf00      	nop

000003c4 <atoi>:

int atoi(const char *str){
     3c4:	b580      	push	{r7, lr}
     3c6:	b086      	sub	sp, #24
     3c8:	af00      	add	r7, sp, #0
     3ca:	6078      	str	r0, [r7, #4]
	int n=0,sign=1,base=10;
     3cc:	2300      	movs	r3, #0
     3ce:	617b      	str	r3, [r7, #20]
     3d0:	2301      	movs	r3, #1
     3d2:	613b      	str	r3, [r7, #16]
     3d4:	230a      	movs	r3, #10
     3d6:	60fb      	str	r3, [r7, #12]
    char c;
    
	while (*str && (*str==SPACE)) str++;
     3d8:	e002      	b.n	3e0 <atoi+0x1c>
     3da:	687b      	ldr	r3, [r7, #4]
     3dc:	3301      	adds	r3, #1
     3de:	607b      	str	r3, [r7, #4]
     3e0:	687b      	ldr	r3, [r7, #4]
     3e2:	781b      	ldrb	r3, [r3, #0]
     3e4:	2b00      	cmp	r3, #0
     3e6:	d003      	beq.n	3f0 <atoi+0x2c>
     3e8:	687b      	ldr	r3, [r7, #4]
     3ea:	781b      	ldrb	r3, [r3, #0]
     3ec:	2b20      	cmp	r3, #32
     3ee:	d0f4      	beq.n	3da <atoi+0x16>
	if (*str=='-'){
     3f0:	687b      	ldr	r3, [r7, #4]
     3f2:	781b      	ldrb	r3, [r3, #0]
     3f4:	2b2d      	cmp	r3, #45	; 0x2d
     3f6:	d105      	bne.n	404 <atoi+0x40>
		sign=-1;
     3f8:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     3fc:	613b      	str	r3, [r7, #16]
		str++;
     3fe:	687b      	ldr	r3, [r7, #4]
     400:	3301      	adds	r3, #1
     402:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
     404:	687b      	ldr	r3, [r7, #4]
     406:	781b      	ldrb	r3, [r3, #0]
     408:	2b30      	cmp	r3, #48	; 0x30
     40a:	d10e      	bne.n	42a <atoi+0x66>
     40c:	687b      	ldr	r3, [r7, #4]
     40e:	3301      	adds	r3, #1
     410:	781b      	ldrb	r3, [r3, #0]
     412:	2b78      	cmp	r3, #120	; 0x78
     414:	d004      	beq.n	420 <atoi+0x5c>
     416:	687b      	ldr	r3, [r7, #4]
     418:	3301      	adds	r3, #1
     41a:	781b      	ldrb	r3, [r3, #0]
     41c:	2b58      	cmp	r3, #88	; 0x58
     41e:	d104      	bne.n	42a <atoi+0x66>
		base=16;
     420:	2310      	movs	r3, #16
     422:	60fb      	str	r3, [r7, #12]
		str+=2;
     424:	687b      	ldr	r3, [r7, #4]
     426:	3302      	adds	r3, #2
     428:	607b      	str	r3, [r7, #4]
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     42a:	e018      	b.n	45e <atoi+0x9a>
		if (c>='a'){c-=32;}
     42c:	7afb      	ldrb	r3, [r7, #11]
     42e:	2b60      	cmp	r3, #96	; 0x60
     430:	d902      	bls.n	438 <atoi+0x74>
     432:	7afb      	ldrb	r3, [r7, #11]
     434:	3b20      	subs	r3, #32
     436:	72fb      	strb	r3, [r7, #11]
		c-='0';
     438:	7afb      	ldrb	r3, [r7, #11]
     43a:	3b30      	subs	r3, #48	; 0x30
     43c:	72fb      	strb	r3, [r7, #11]
		if (c>9){c-=7;}
     43e:	7afb      	ldrb	r3, [r7, #11]
     440:	2b09      	cmp	r3, #9
     442:	d902      	bls.n	44a <atoi+0x86>
     444:	7afb      	ldrb	r3, [r7, #11]
     446:	3b07      	subs	r3, #7
     448:	72fb      	strb	r3, [r7, #11]
		n=n*base+c;
     44a:	697b      	ldr	r3, [r7, #20]
     44c:	68fa      	ldr	r2, [r7, #12]
     44e:	fb02 f203 	mul.w	r2, r2, r3
     452:	7afb      	ldrb	r3, [r7, #11]
     454:	4413      	add	r3, r2
     456:	617b      	str	r3, [r7, #20]
		str++;
     458:	687b      	ldr	r3, [r7, #4]
     45a:	3301      	adds	r3, #1
     45c:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
		base=16;
		str+=2;
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     45e:	687b      	ldr	r3, [r7, #4]
     460:	781b      	ldrb	r3, [r3, #0]
     462:	72fb      	strb	r3, [r7, #11]
     464:	7afb      	ldrb	r3, [r7, #11]
     466:	2b00      	cmp	r3, #0
     468:	d00d      	beq.n	486 <atoi+0xc2>
     46a:	68fb      	ldr	r3, [r7, #12]
     46c:	2b0a      	cmp	r3, #10
     46e:	d10a      	bne.n	486 <atoi+0xc2>
     470:	7afb      	ldrb	r3, [r7, #11]
     472:	4618      	mov	r0, r3
     474:	f7ff ff72 	bl	35c <digit>
     478:	4603      	mov	r3, r0
     47a:	2b00      	cmp	r3, #0
     47c:	bf14      	ite	ne
     47e:	2301      	movne	r3, #1
     480:	2300      	moveq	r3, #0
     482:	b2db      	uxtb	r3, r3
     484:	e009      	b.n	49a <atoi+0xd6>
     486:	7afb      	ldrb	r3, [r7, #11]
     488:	4618      	mov	r0, r3
     48a:	f7ff ff7b 	bl	384 <hexdigit>
     48e:	4603      	mov	r3, r0
     490:	2b00      	cmp	r3, #0
     492:	bf14      	ite	ne
     494:	2301      	movne	r3, #1
     496:	2300      	moveq	r3, #0
     498:	b2db      	uxtb	r3, r3
     49a:	2b00      	cmp	r3, #0
     49c:	d1c6      	bne.n	42c <atoi+0x68>
		c-='0';
		if (c>9){c-=7;}
		n=n*base+c;
		str++;
	}
	return sign*n;
     49e:	693b      	ldr	r3, [r7, #16]
     4a0:	697a      	ldr	r2, [r7, #20]
     4a2:	fb02 f303 	mul.w	r3, r2, r3
}
     4a6:	4618      	mov	r0, r3
     4a8:	3718      	adds	r7, #24
     4aa:	46bd      	mov	sp, r7
     4ac:	bd80      	pop	{r7, pc}
     4ae:	bf00      	nop

000004b0 <led_on>:
static void move(char *src , char *dest, int len);
static void word();

// routine de services

static inline void led_on(){
     4b0:	b480      	push	{r7}
     4b2:	af00      	add	r7, sp, #0
	GPIOC_BRR->brr=GRN_LED;
     4b4:	4b03      	ldr	r3, [pc, #12]	; (4c4 <led_on+0x14>)
     4b6:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4ba:	601a      	str	r2, [r3, #0]
}
     4bc:	46bd      	mov	sp, r7
     4be:	f85d 7b04 	ldr.w	r7, [sp], #4
     4c2:	4770      	bx	lr
     4c4:	40011014 	.word	0x40011014

000004c8 <led_off>:

static inline void led_off(){
     4c8:	b480      	push	{r7}
     4ca:	af00      	add	r7, sp, #0
	GPIOC_BSRR->bsrr=GRN_LED;
     4cc:	4b03      	ldr	r3, [pc, #12]	; (4dc <led_off+0x14>)
     4ce:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4d2:	601a      	str	r2, [r3, #0]
}
     4d4:	46bd      	mov	sp, r7
     4d6:	f85d 7b04 	ldr.w	r7, [sp], #4
     4da:	4770      	bx	lr
     4dc:	40011010 	.word	0x40011010

000004e0 <set_timer>:

static inline void set_timer(unsigned time){
     4e0:	b480      	push	{r7}
     4e2:	b083      	sub	sp, #12
     4e4:	af00      	add	r7, sp, #0
     4e6:	6078      	str	r0, [r7, #4]
	timer=time;
     4e8:	4a03      	ldr	r2, [pc, #12]	; (4f8 <set_timer+0x18>)
     4ea:	687b      	ldr	r3, [r7, #4]
     4ec:	6013      	str	r3, [r2, #0]
}
     4ee:	370c      	adds	r7, #12
     4f0:	46bd      	mov	sp, r7
     4f2:	f85d 7b04 	ldr.w	r7, [sp], #4
     4f6:	4770      	bx	lr
     4f8:	2000000c 	.word	0x2000000c

000004fc <get_timer>:


static inline unsigned get_timer(){
     4fc:	b480      	push	{r7}
     4fe:	af00      	add	r7, sp, #0
	return timer;
     500:	4b03      	ldr	r3, [pc, #12]	; (510 <get_timer+0x14>)
     502:	681b      	ldr	r3, [r3, #0]
}
     504:	4618      	mov	r0, r3
     506:	46bd      	mov	sp, r7
     508:	f85d 7b04 	ldr.w	r7, [sp], #4
     50c:	4770      	bx	lr
     50e:	bf00      	nop
     510:	2000000c 	.word	0x2000000c

00000514 <peek8>:


static inline uint8_t peek8(uint8_t *adr){
     514:	b480      	push	{r7}
     516:	b083      	sub	sp, #12
     518:	af00      	add	r7, sp, #0
     51a:	6078      	str	r0, [r7, #4]
	return *adr;
     51c:	687b      	ldr	r3, [r7, #4]
     51e:	781b      	ldrb	r3, [r3, #0]
}
     520:	4618      	mov	r0, r3
     522:	370c      	adds	r7, #12
     524:	46bd      	mov	sp, r7
     526:	f85d 7b04 	ldr.w	r7, [sp], #4
     52a:	4770      	bx	lr

0000052c <peek16>:

static inline uint16_t peek16(uint16_t *adr){
     52c:	b480      	push	{r7}
     52e:	b083      	sub	sp, #12
     530:	af00      	add	r7, sp, #0
     532:	6078      	str	r0, [r7, #4]
	return *adr;
     534:	687b      	ldr	r3, [r7, #4]
     536:	881b      	ldrh	r3, [r3, #0]
}
     538:	4618      	mov	r0, r3
     53a:	370c      	adds	r7, #12
     53c:	46bd      	mov	sp, r7
     53e:	f85d 7b04 	ldr.w	r7, [sp], #4
     542:	4770      	bx	lr

00000544 <peek32>:

static inline uint32_t peek32(uint32_t *adr){
     544:	b480      	push	{r7}
     546:	b083      	sub	sp, #12
     548:	af00      	add	r7, sp, #0
     54a:	6078      	str	r0, [r7, #4]
	return *adr;
     54c:	687b      	ldr	r3, [r7, #4]
     54e:	681b      	ldr	r3, [r3, #0]
}
     550:	4618      	mov	r0, r3
     552:	370c      	adds	r7, #12
     554:	46bd      	mov	sp, r7
     556:	f85d 7b04 	ldr.w	r7, [sp], #4
     55a:	4770      	bx	lr

0000055c <poke8>:

static inline void poke8(uint8_t *adr, uint8_t value){
     55c:	b480      	push	{r7}
     55e:	b083      	sub	sp, #12
     560:	af00      	add	r7, sp, #0
     562:	6078      	str	r0, [r7, #4]
     564:	460b      	mov	r3, r1
     566:	70fb      	strb	r3, [r7, #3]
	*adr=value;
     568:	687b      	ldr	r3, [r7, #4]
     56a:	78fa      	ldrb	r2, [r7, #3]
     56c:	701a      	strb	r2, [r3, #0]
}
     56e:	370c      	adds	r7, #12
     570:	46bd      	mov	sp, r7
     572:	f85d 7b04 	ldr.w	r7, [sp], #4
     576:	4770      	bx	lr

00000578 <poke16>:

static inline void poke16(uint16_t *adr, uint16_t value){
     578:	b480      	push	{r7}
     57a:	b083      	sub	sp, #12
     57c:	af00      	add	r7, sp, #0
     57e:	6078      	str	r0, [r7, #4]
     580:	460b      	mov	r3, r1
     582:	807b      	strh	r3, [r7, #2]
	*adr=value;
     584:	687b      	ldr	r3, [r7, #4]
     586:	887a      	ldrh	r2, [r7, #2]
     588:	801a      	strh	r2, [r3, #0]
}
     58a:	370c      	adds	r7, #12
     58c:	46bd      	mov	sp, r7
     58e:	f85d 7b04 	ldr.w	r7, [sp], #4
     592:	4770      	bx	lr

00000594 <poke32>:

static inline void poke32(uint32_t *adr, uint32_t value){
     594:	b480      	push	{r7}
     596:	b083      	sub	sp, #12
     598:	af00      	add	r7, sp, #0
     59a:	6078      	str	r0, [r7, #4]
     59c:	6039      	str	r1, [r7, #0]
	*adr=value;
     59e:	687b      	ldr	r3, [r7, #4]
     5a0:	683a      	ldr	r2, [r7, #0]
     5a2:	601a      	str	r2, [r3, #0]
}
     5a4:	370c      	adds	r7, #12
     5a6:	46bd      	mov	sp, r7
     5a8:	f85d 7b04 	ldr.w	r7, [sp], #4
     5ac:	4770      	bx	lr
     5ae:	bf00      	nop

000005b0 <SVC_handler>:

// interruption multiplexeur des appels de services
void __attribute__((__interrupt__)) SVC_handler(){
     5b0:	4668      	mov	r0, sp
     5b2:	f020 0107 	bic.w	r1, r0, #7
     5b6:	468d      	mov	sp, r1
     5b8:	b591      	push	{r0, r4, r7, lr}
     5ba:	b084      	sub	sp, #16
     5bc:	af00      	add	r7, sp, #0
	int svc_id;
	void *arg1, *arg2; 
	asm volatile (
     5be:	f3ef 8009 	mrs	r0, PSP
     5c2:	6981      	ldr	r1, [r0, #24]
     5c4:	f811 4c02 	ldrb.w	r4, [r1, #-2]
     5c8:	6802      	ldr	r2, [r0, #0]
     5ca:	6843      	ldr	r3, [r0, #4]
     5cc:	60fc      	str	r4, [r7, #12]
     5ce:	60ba      	str	r2, [r7, #8]
     5d0:	607b      	str	r3, [r7, #4]
    "ldr %[arg1],[r0]\n\t"
    "ldr %[arg2],[r0,#4]\n\t"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [arg2] "=r" (arg2)
    :: "r0","r1" 
    );
	switch (svc_id){
     5d2:	68fb      	ldr	r3, [r7, #12]
     5d4:	2b13      	cmp	r3, #19
     5d6:	f200 80bd 	bhi.w	754 <SVC_handler+0x1a4>
     5da:	a201      	add	r2, pc, #4	; (adr r2, 5e0 <SVC_handler+0x30>)
     5dc:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     5e0:	0000074f 	.word	0x0000074f
     5e4:	00000631 	.word	0x00000631
     5e8:	00000637 	.word	0x00000637
     5ec:	0000063d 	.word	0x0000063d
     5f0:	00000649 	.word	0x00000649
     5f4:	00000655 	.word	0x00000655
     5f8:	00000663 	.word	0x00000663
     5fc:	0000066f 	.word	0x0000066f
     600:	00000683 	.word	0x00000683
     604:	0000068b 	.word	0x0000068b
     608:	00000699 	.word	0x00000699
     60c:	000006a5 	.word	0x000006a5
     610:	000006b9 	.word	0x000006b9
     614:	000006cd 	.word	0x000006cd
     618:	000006df 	.word	0x000006df
     61c:	000006f3 	.word	0x000006f3
     620:	00000707 	.word	0x00000707
     624:	0000071b 	.word	0x0000071b
     628:	00000733 	.word	0x00000733
     62c:	00000745 	.word	0x00000745
	case SVC_LED_ON: 
		led_on();
     630:	f7ff ff3e 	bl	4b0 <led_on>
		break;
     634:	e08e      	b.n	754 <SVC_handler+0x1a4>
	case SVC_LED_OFF:
		led_off();
     636:	f7ff ff47 	bl	4c8 <led_off>
		break;
     63a:	e08b      	b.n	754 <SVC_handler+0x1a4>
	case SVC_TIMER:
		set_timer(*(unsigned*)arg1);
     63c:	68bb      	ldr	r3, [r7, #8]
     63e:	681b      	ldr	r3, [r3, #0]
     640:	4618      	mov	r0, r3
     642:	f7ff ff4d 	bl	4e0 <set_timer>
		break;
     646:	e085      	b.n	754 <SVC_handler+0x1a4>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=get_timer();
     648:	f7ff ff58 	bl	4fc <get_timer>
     64c:	4602      	mov	r2, r0
     64e:	68bb      	ldr	r3, [r7, #8]
     650:	601a      	str	r2, [r3, #0]
		break;
     652:	e07f      	b.n	754 <SVC_handler+0x1a4>
	case SVC_CONIN:
		*(char *)arg1=conin();
     654:	f000 fd4e 	bl	10f4 <conin>
     658:	4603      	mov	r3, r0
     65a:	461a      	mov	r2, r3
     65c:	68bb      	ldr	r3, [r7, #8]
     65e:	701a      	strb	r2, [r3, #0]
		break;
     660:	e078      	b.n	754 <SVC_handler+0x1a4>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     662:	68bb      	ldr	r3, [r7, #8]
     664:	781b      	ldrb	r3, [r3, #0]
     666:	4618      	mov	r0, r3
     668:	f000 fd34 	bl	10d4 <conout>
		break;
     66c:	e072      	b.n	754 <SVC_handler+0x1a4>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     66e:	68bb      	ldr	r3, [r7, #8]
     670:	681b      	ldr	r3, [r3, #0]
     672:	6878      	ldr	r0, [r7, #4]
     674:	4619      	mov	r1, r3
     676:	f000 fdb5 	bl	11e4 <read_line>
     67a:	4602      	mov	r2, r0
     67c:	68bb      	ldr	r3, [r7, #8]
     67e:	601a      	str	r2, [r3, #0]
		break;
     680:	e068      	b.n	754 <SVC_handler+0x1a4>
	case SVC_PRINT:
		print((const char*)arg1);
     682:	68b8      	ldr	r0, [r7, #8]
     684:	f000 fd58 	bl	1138 <print>
		break;
     688:	e064      	b.n	754 <SVC_handler+0x1a4>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     68a:	68bb      	ldr	r3, [r7, #8]
     68c:	681b      	ldr	r3, [r3, #0]
     68e:	4618      	mov	r0, r3
     690:	210a      	movs	r1, #10
     692:	f000 fe51 	bl	1338 <print_int>
		break;
     696:	e05d      	b.n	754 <SVC_handler+0x1a4>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     698:	68bb      	ldr	r3, [r7, #8]
     69a:	681b      	ldr	r3, [r3, #0]
     69c:	4618      	mov	r0, r3
     69e:	f000 feb9 	bl	1414 <print_hex>
		break;
     6a2:	e057      	b.n	754 <SVC_handler+0x1a4>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     6a4:	68bb      	ldr	r3, [r7, #8]
     6a6:	681b      	ldr	r3, [r3, #0]
     6a8:	4618      	mov	r0, r3
     6aa:	f7ff ff33 	bl	514 <peek8>
     6ae:	4603      	mov	r3, r0
     6b0:	461a      	mov	r2, r3
     6b2:	68bb      	ldr	r3, [r7, #8]
     6b4:	701a      	strb	r2, [r3, #0]
		break;
     6b6:	e04d      	b.n	754 <SVC_handler+0x1a4>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     6b8:	68bb      	ldr	r3, [r7, #8]
     6ba:	681b      	ldr	r3, [r3, #0]
     6bc:	4618      	mov	r0, r3
     6be:	f7ff ff35 	bl	52c <peek16>
     6c2:	4603      	mov	r3, r0
     6c4:	461a      	mov	r2, r3
     6c6:	68bb      	ldr	r3, [r7, #8]
     6c8:	801a      	strh	r2, [r3, #0]
		break;
     6ca:	e043      	b.n	754 <SVC_handler+0x1a4>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     6cc:	68bb      	ldr	r3, [r7, #8]
     6ce:	681b      	ldr	r3, [r3, #0]
     6d0:	4618      	mov	r0, r3
     6d2:	f7ff ff37 	bl	544 <peek32>
     6d6:	4602      	mov	r2, r0
     6d8:	68bb      	ldr	r3, [r7, #8]
     6da:	601a      	str	r2, [r3, #0]
		break;
     6dc:	e03a      	b.n	754 <SVC_handler+0x1a4>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
     6de:	68bb      	ldr	r3, [r7, #8]
     6e0:	681b      	ldr	r3, [r3, #0]
     6e2:	461a      	mov	r2, r3
     6e4:	687b      	ldr	r3, [r7, #4]
     6e6:	781b      	ldrb	r3, [r3, #0]
     6e8:	4610      	mov	r0, r2
     6ea:	4619      	mov	r1, r3
     6ec:	f7ff ff36 	bl	55c <poke8>
		break;
     6f0:	e030      	b.n	754 <SVC_handler+0x1a4>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
     6f2:	68bb      	ldr	r3, [r7, #8]
     6f4:	681b      	ldr	r3, [r3, #0]
     6f6:	461a      	mov	r2, r3
     6f8:	687b      	ldr	r3, [r7, #4]
     6fa:	881b      	ldrh	r3, [r3, #0]
     6fc:	4610      	mov	r0, r2
     6fe:	4619      	mov	r1, r3
     700:	f7ff ff3a 	bl	578 <poke16>
		break;
     704:	e026      	b.n	754 <SVC_handler+0x1a4>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
     706:	68bb      	ldr	r3, [r7, #8]
     708:	681b      	ldr	r3, [r3, #0]
     70a:	461a      	mov	r2, r3
     70c:	687b      	ldr	r3, [r7, #4]
     70e:	681b      	ldr	r3, [r3, #0]
     710:	4610      	mov	r0, r2
     712:	4619      	mov	r1, r3
     714:	f7ff ff3e 	bl	594 <poke32>
		break;
     718:	e01c      	b.n	754 <SVC_handler+0x1a4>
	case SVC_FLASH_WR:
		*(int*)arg1=flash_write(*(uint32_t*)arg1,*(uint16_t*)arg2);
     71a:	68bb      	ldr	r3, [r7, #8]
     71c:	681a      	ldr	r2, [r3, #0]
     71e:	687b      	ldr	r3, [r7, #4]
     720:	881b      	ldrh	r3, [r3, #0]
     722:	4610      	mov	r0, r2
     724:	4619      	mov	r1, r3
     726:	f000 ff27 	bl	1578 <flash_write>
     72a:	4602      	mov	r2, r0
     72c:	68bb      	ldr	r3, [r7, #8]
     72e:	601a      	str	r2, [r3, #0]
		break;
     730:	e010      	b.n	754 <SVC_handler+0x1a4>
	case SVC_FLASH_PGER:
		*(int*)arg1=flash_erase_page(*(uint32_t*)arg1);
     732:	68bb      	ldr	r3, [r7, #8]
     734:	681b      	ldr	r3, [r3, #0]
     736:	4618      	mov	r0, r3
     738:	f000 ff62 	bl	1600 <flash_erase_page>
     73c:	4602      	mov	r2, r0
     73e:	68bb      	ldr	r3, [r7, #8]
     740:	601a      	str	r2, [r3, #0]
		break;
     742:	e007      	b.n	754 <SVC_handler+0x1a4>
	case SVC_TICKS:
		*(unsigned*)arg1=ticks;
     744:	4b06      	ldr	r3, [pc, #24]	; (760 <SVC_handler+0x1b0>)
     746:	681a      	ldr	r2, [r3, #0]
     748:	68bb      	ldr	r3, [r7, #8]
     74a:	601a      	str	r2, [r3, #0]
		break;
     74c:	e002      	b.n	754 <SVC_handler+0x1a4>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     74e:	f001 fc79 	bl	2044 <reset_mcu>
	    break;
     752:	bf00      	nop
	}	
}
     754:	3710      	adds	r7, #16
     756:	46bd      	mov	sp, r7
     758:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     75c:	4685      	mov	sp, r0
     75e:	4770      	bx	lr
     760:	20000008 	.word	0x20000008

00000764 <STK_handler>:

// interruption coretimer
void __attribute__((naked)) STK_handler(){
	ticks++;
     764:	4b06      	ldr	r3, [pc, #24]	; (780 <STK_handler+0x1c>)
     766:	681b      	ldr	r3, [r3, #0]
     768:	3301      	adds	r3, #1
     76a:	4a05      	ldr	r2, [pc, #20]	; (780 <STK_handler+0x1c>)
     76c:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
     76e:	4b05      	ldr	r3, [pc, #20]	; (784 <STK_handler+0x20>)
     770:	681b      	ldr	r3, [r3, #0]
     772:	2b00      	cmp	r3, #0
     774:	d004      	beq.n	780 <STK_handler+0x1c>
     776:	4b03      	ldr	r3, [pc, #12]	; (784 <STK_handler+0x20>)
     778:	681b      	ldr	r3, [r3, #0]
     77a:	3b01      	subs	r3, #1
     77c:	4a01      	ldr	r2, [pc, #4]	; (784 <STK_handler+0x20>)
     77e:	6013      	str	r3, [r2, #0]
     780:	20000008 	.word	0x20000008
     784:	2000000c 	.word	0x2000000c

00000788 <set_sysclock>:
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     788:	b480      	push	{r7}
     78a:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC_CR->fld.hseon=1;
     78c:	4b1f      	ldr	r3, [pc, #124]	; (80c <set_sysclock+0x84>)
     78e:	681a      	ldr	r2, [r3, #0]
     790:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
     794:	601a      	str	r2, [r3, #0]
	 // attend que l'oscillateur soit prêt
   while (!RCC_CR->fld.hserdy);
     796:	bf00      	nop
     798:	4b1c      	ldr	r3, [pc, #112]	; (80c <set_sysclock+0x84>)
     79a:	681b      	ldr	r3, [r3, #0]
     79c:	0c5b      	lsrs	r3, r3, #17
     79e:	f003 0301 	and.w	r3, r3, #1
     7a2:	b2db      	uxtb	r3, r3
     7a4:	2b00      	cmp	r3, #0
     7a6:	d0f7      	beq.n	798 <set_sysclock+0x10>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR->cfgr|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL8<<RCC_CFGR_PLLMUL);
     7a8:	4a19      	ldr	r2, [pc, #100]	; (810 <set_sysclock+0x88>)
     7aa:	4b19      	ldr	r3, [pc, #100]	; (810 <set_sysclock+0x88>)
     7ac:	681b      	ldr	r3, [r3, #0]
     7ae:	f443 13c8 	orr.w	r3, r3, #1638400	; 0x190000
     7b2:	6013      	str	r3, [r2, #0]
    // active le PLL
    RCC_CR->fld.pllon=1;
     7b4:	4b15      	ldr	r3, [pc, #84]	; (80c <set_sysclock+0x84>)
     7b6:	681a      	ldr	r2, [r3, #0]
     7b8:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
     7bc:	601a      	str	r2, [r3, #0]
    // Attend que le PLL soit prêt
    while (!RCC_CR->fld.pllrdy);
     7be:	bf00      	nop
     7c0:	4b12      	ldr	r3, [pc, #72]	; (80c <set_sysclock+0x84>)
     7c2:	681b      	ldr	r3, [r3, #0]
     7c4:	0e5b      	lsrs	r3, r3, #25
     7c6:	f003 0301 	and.w	r3, r3, #1
     7ca:	b2db      	uxtb	r3, r3
     7cc:	2b00      	cmp	r3, #0
     7ce:	d0f7      	beq.n	7c0 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR->fld.latency=WAIT_2_CY;
     7d0:	4b10      	ldr	r3, [pc, #64]	; (814 <set_sysclock+0x8c>)
     7d2:	681a      	ldr	r2, [r3, #0]
     7d4:	f022 0207 	bic.w	r2, r2, #7
     7d8:	f042 0202 	orr.w	r2, r2, #2
     7dc:	601a      	str	r2, [r3, #0]
    // active le prefetch buffer
    FLASH_ACR->fld.prftbe=1;
     7de:	4b0d      	ldr	r3, [pc, #52]	; (814 <set_sysclock+0x8c>)
     7e0:	681a      	ldr	r2, [r3, #0]
     7e2:	f042 0210 	orr.w	r2, r2, #16
     7e6:	601a      	str	r2, [r3, #0]
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR->fld.sw=PLL_CLK;
     7e8:	4b09      	ldr	r3, [pc, #36]	; (810 <set_sysclock+0x88>)
     7ea:	681a      	ldr	r2, [r3, #0]
     7ec:	f022 0203 	bic.w	r2, r2, #3
     7f0:	f042 0202 	orr.w	r2, r2, #2
     7f4:	601a      	str	r2, [r3, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR->fld.ppre1=PPRECLK_DIV2;
     7f6:	4b06      	ldr	r3, [pc, #24]	; (810 <set_sysclock+0x88>)
     7f8:	681a      	ldr	r2, [r3, #0]
     7fa:	f422 62e0 	bic.w	r2, r2, #1792	; 0x700
     7fe:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     802:	601a      	str	r2, [r3, #0]
}
     804:	46bd      	mov	sp, r7
     806:	f85d 7b04 	ldr.w	r7, [sp], #4
     80a:	4770      	bx	lr
     80c:	40021000 	.word	0x40021000
     810:	40021004 	.word	0x40021004
     814:	40022000 	.word	0x40022000

00000818 <config_systicks>:

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
     818:	b580      	push	{r7, lr}
     81a:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,8);
     81c:	f06f 000e 	mvn.w	r0, #14
     820:	2108      	movs	r1, #8
     822:	f001 facb 	bl	1dbc <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
     826:	4b04      	ldr	r3, [pc, #16]	; (838 <config_systicks+0x20>)
     828:	f242 3227 	movw	r2, #8999	; 0x2327
     82c:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
     82e:	4b03      	ldr	r3, [pc, #12]	; (83c <config_systicks+0x24>)
     830:	2203      	movs	r2, #3
     832:	601a      	str	r2, [r3, #0]
}
     834:	bd80      	pop	{r7, pc}
     836:	bf00      	nop
     838:	e000e014 	.word	0xe000e014
     83c:	e000e010 	.word	0xe000e010

00000840 <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     840:	b480      	push	{r7}
     842:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     844:	2300      	movs	r3, #0
     846:	2200      	movs	r2, #0
     848:	4618      	mov	r0, r3
     84a:	4611      	mov	r1, r2
     84c:	df00      	svc	0
}
     84e:	46bd      	mov	sp, r7
     850:	f85d 7b04 	ldr.w	r7, [sp], #4
     854:	4770      	bx	lr
     856:	bf00      	nop

00000858 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     858:	b480      	push	{r7}
     85a:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     85c:	2300      	movs	r3, #0
     85e:	2200      	movs	r2, #0
     860:	4618      	mov	r0, r3
     862:	4611      	mov	r1, r2
     864:	df01      	svc	1
}
     866:	46bd      	mov	sp, r7
     868:	f85d 7b04 	ldr.w	r7, [sp], #4
     86c:	4770      	bx	lr
     86e:	bf00      	nop

00000870 <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     870:	b480      	push	{r7}
     872:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     874:	2300      	movs	r3, #0
     876:	2200      	movs	r2, #0
     878:	4618      	mov	r0, r3
     87a:	4611      	mov	r1, r2
     87c:	df02      	svc	2
}
     87e:	46bd      	mov	sp, r7
     880:	f85d 7b04 	ldr.w	r7, [sp], #4
     884:	4770      	bx	lr
     886:	bf00      	nop

00000888 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     888:	b580      	push	{r7, lr}
     88a:	b082      	sub	sp, #8
     88c:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     88e:	f000 fadb 	bl	e48 <word>
	n=atoi((const char*)pad);
     892:	4806      	ldr	r0, [pc, #24]	; (8ac <cmd_set_timer+0x24>)
     894:	f7ff fd96 	bl	3c4 <atoi>
     898:	4603      	mov	r3, r0
     89a:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     89c:	1d3b      	adds	r3, r7, #4
     89e:	2200      	movs	r2, #0
     8a0:	4618      	mov	r0, r3
     8a2:	4611      	mov	r1, r2
     8a4:	df03      	svc	3
}
     8a6:	3708      	adds	r7, #8
     8a8:	46bd      	mov	sp, r7
     8aa:	bd80      	pop	{r7, pc}
     8ac:	20000060 	.word	0x20000060

000008b0 <cmd_get_timer>:

static void cmd_get_timer(){
     8b0:	b480      	push	{r7}
     8b2:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     8b4:	4b04      	ldr	r3, [pc, #16]	; (8c8 <cmd_get_timer+0x18>)
     8b6:	2200      	movs	r2, #0
     8b8:	4618      	mov	r0, r3
     8ba:	4611      	mov	r1, r2
     8bc:	df04      	svc	4
}
     8be:	46bd      	mov	sp, r7
     8c0:	f85d 7b04 	ldr.w	r7, [sp], #4
     8c4:	4770      	bx	lr
     8c6:	bf00      	nop
     8c8:	20000060 	.word	0x20000060

000008cc <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     8cc:	b480      	push	{r7}
     8ce:	b083      	sub	sp, #12
     8d0:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     8d2:	1d3b      	adds	r3, r7, #4
     8d4:	2200      	movs	r2, #0
     8d6:	4618      	mov	r0, r3
     8d8:	4611      	mov	r1, r2
     8da:	df04      	svc	4
     8dc:	687b      	ldr	r3, [r7, #4]
     8de:	2b00      	cmp	r3, #0
     8e0:	d1f7      	bne.n	8d2 <cmd_pause+0x6>
}
     8e2:	370c      	adds	r7, #12
     8e4:	46bd      	mov	sp, r7
     8e6:	f85d 7b04 	ldr.w	r7, [sp], #4
     8ea:	4770      	bx	lr

000008ec <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     8ec:	b480      	push	{r7}
     8ee:	b083      	sub	sp, #12
     8f0:	af00      	add	r7, sp, #0
	volatile char n=0;
     8f2:	2300      	movs	r3, #0
     8f4:	71fb      	strb	r3, [r7, #7]
	while (!n){
     8f6:	e004      	b.n	902 <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     8f8:	1dfb      	adds	r3, r7, #7
     8fa:	2200      	movs	r2, #0
     8fc:	4618      	mov	r0, r3
     8fe:	4611      	mov	r1, r2
     900:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     902:	79fb      	ldrb	r3, [r7, #7]
     904:	b2db      	uxtb	r3, r3
     906:	2b00      	cmp	r3, #0
     908:	d0f6      	beq.n	8f8 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     90a:	79fb      	ldrb	r3, [r7, #7]
     90c:	b2da      	uxtb	r2, r3
     90e:	4b05      	ldr	r3, [pc, #20]	; (924 <cmd_getc+0x38>)
     910:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     912:	4b04      	ldr	r3, [pc, #16]	; (924 <cmd_getc+0x38>)
     914:	2200      	movs	r2, #0
     916:	705a      	strb	r2, [r3, #1]
}
     918:	370c      	adds	r7, #12
     91a:	46bd      	mov	sp, r7
     91c:	f85d 7b04 	ldr.w	r7, [sp], #4
     920:	4770      	bx	lr
     922:	bf00      	nop
     924:	20000060 	.word	0x20000060

00000928 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     928:	b580      	push	{r7, lr}
     92a:	b082      	sub	sp, #8
     92c:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     92e:	f000 fa8b 	bl	e48 <word>
	cmd_id=search_command((const char*)pad);
     932:	480a      	ldr	r0, [pc, #40]	; (95c <cmd_putc+0x34>)
     934:	f000 f972 	bl	c1c <search_command>
     938:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     93a:	687b      	ldr	r3, [r7, #4]
     93c:	2b00      	cmp	r3, #0
     93e:	db05      	blt.n	94c <cmd_putc+0x24>
     940:	4a07      	ldr	r2, [pc, #28]	; (960 <cmd_putc+0x38>)
     942:	687b      	ldr	r3, [r7, #4]
     944:	00db      	lsls	r3, r3, #3
     946:	4413      	add	r3, r2
     948:	685b      	ldr	r3, [r3, #4]
     94a:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     94c:	4b03      	ldr	r3, [pc, #12]	; (95c <cmd_putc+0x34>)
     94e:	2200      	movs	r2, #0
     950:	4618      	mov	r0, r3
     952:	4611      	mov	r1, r2
     954:	df06      	svc	6
}
     956:	3708      	adds	r7, #8
     958:	46bd      	mov	sp, r7
     95a:	bd80      	pop	{r7, pc}
     95c:	20000060 	.word	0x20000060
     960:	000026fc 	.word	0x000026fc

00000964 <cmd_readln>:

static void cmd_readln(){
     964:	b580      	push	{r7, lr}
     966:	b082      	sub	sp, #8
     968:	af00      	add	r7, sp, #0
	unsigned llen=80;
     96a:	2350      	movs	r3, #80	; 0x50
     96c:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     96e:	1d3b      	adds	r3, r7, #4
     970:	4a04      	ldr	r2, [pc, #16]	; (984 <cmd_readln+0x20>)
     972:	4618      	mov	r0, r3
     974:	4611      	mov	r1, r2
     976:	df07      	svc	7
	print((const char*)pad);
     978:	4802      	ldr	r0, [pc, #8]	; (984 <cmd_readln+0x20>)
     97a:	f000 fbdd 	bl	1138 <print>
}
     97e:	3708      	adds	r7, #8
     980:	46bd      	mov	sp, r7
     982:	bd80      	pop	{r7, pc}
     984:	20000060 	.word	0x20000060

00000988 <cmd_print>:

static void cmd_print(){
     988:	b580      	push	{r7, lr}
     98a:	af00      	add	r7, sp, #0
	word();
     98c:	f000 fa5c 	bl	e48 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     990:	4b02      	ldr	r3, [pc, #8]	; (99c <cmd_print+0x14>)
     992:	2200      	movs	r2, #0
     994:	4618      	mov	r0, r3
     996:	4611      	mov	r1, r2
     998:	df08      	svc	8
}
     99a:	bd80      	pop	{r7, pc}
     99c:	20000060 	.word	0x20000060

000009a0 <cmd_print_int>:

static void cmd_print_int(){
     9a0:	b580      	push	{r7, lr}
     9a2:	b082      	sub	sp, #8
     9a4:	af00      	add	r7, sp, #0
	int cmd_id;
    unsigned u32;
    
	word();
     9a6:	f000 fa4f 	bl	e48 <word>
	cmd_id=search_command((const char*)pad);
     9aa:	480e      	ldr	r0, [pc, #56]	; (9e4 <cmd_print_int+0x44>)
     9ac:	f000 f936 	bl	c1c <search_command>
     9b0:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     9b2:	687b      	ldr	r3, [r7, #4]
     9b4:	2b00      	cmp	r3, #0
     9b6:	db06      	blt.n	9c6 <cmd_print_int+0x26>
		 commands[cmd_id].fn();
     9b8:	4a0b      	ldr	r2, [pc, #44]	; (9e8 <cmd_print_int+0x48>)
     9ba:	687b      	ldr	r3, [r7, #4]
     9bc:	00db      	lsls	r3, r3, #3
     9be:	4413      	add	r3, r2
     9c0:	685b      	ldr	r3, [r3, #4]
     9c2:	4798      	blx	r3
     9c4:	e006      	b.n	9d4 <cmd_print_int+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     9c6:	4807      	ldr	r0, [pc, #28]	; (9e4 <cmd_print_int+0x44>)
     9c8:	f7ff fcfc 	bl	3c4 <atoi>
     9cc:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     9ce:	4a05      	ldr	r2, [pc, #20]	; (9e4 <cmd_print_int+0x44>)
     9d0:	687b      	ldr	r3, [r7, #4]
     9d2:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_INT,pad,NUL);
     9d4:	4b03      	ldr	r3, [pc, #12]	; (9e4 <cmd_print_int+0x44>)
     9d6:	2200      	movs	r2, #0
     9d8:	4618      	mov	r0, r3
     9da:	4611      	mov	r1, r2
     9dc:	df09      	svc	9
}
     9de:	3708      	adds	r7, #8
     9e0:	46bd      	mov	sp, r7
     9e2:	bd80      	pop	{r7, pc}
     9e4:	20000060 	.word	0x20000060
     9e8:	000026fc 	.word	0x000026fc

000009ec <cmd_print_hex>:

static void cmd_print_hex(){
     9ec:	b580      	push	{r7, lr}
     9ee:	b082      	sub	sp, #8
     9f0:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     9f2:	f000 fa29 	bl	e48 <word>
	cmd_id=search_command((const char*)pad);
     9f6:	480e      	ldr	r0, [pc, #56]	; (a30 <cmd_print_hex+0x44>)
     9f8:	f000 f910 	bl	c1c <search_command>
     9fc:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     9fe:	687b      	ldr	r3, [r7, #4]
     a00:	2b00      	cmp	r3, #0
     a02:	db06      	blt.n	a12 <cmd_print_hex+0x26>
		 commands[cmd_id].fn();
     a04:	4a0b      	ldr	r2, [pc, #44]	; (a34 <cmd_print_hex+0x48>)
     a06:	687b      	ldr	r3, [r7, #4]
     a08:	00db      	lsls	r3, r3, #3
     a0a:	4413      	add	r3, r2
     a0c:	685b      	ldr	r3, [r3, #4]
     a0e:	4798      	blx	r3
     a10:	e006      	b.n	a20 <cmd_print_hex+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     a12:	4807      	ldr	r0, [pc, #28]	; (a30 <cmd_print_hex+0x44>)
     a14:	f7ff fcd6 	bl	3c4 <atoi>
     a18:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     a1a:	4a05      	ldr	r2, [pc, #20]	; (a30 <cmd_print_hex+0x44>)
     a1c:	687b      	ldr	r3, [r7, #4]
     a1e:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_HEX,pad,NUL);
     a20:	4b03      	ldr	r3, [pc, #12]	; (a30 <cmd_print_hex+0x44>)
     a22:	2200      	movs	r2, #0
     a24:	4618      	mov	r0, r3
     a26:	4611      	mov	r1, r2
     a28:	df0a      	svc	10
}
     a2a:	3708      	adds	r7, #8
     a2c:	46bd      	mov	sp, r7
     a2e:	bd80      	pop	{r7, pc}
     a30:	20000060 	.word	0x20000060
     a34:	000026fc 	.word	0x000026fc

00000a38 <cmd_run>:

static void cmd_run(){
     a38:	b580      	push	{r7, lr}
     a3a:	af00      	add	r7, sp, #0
	((fn)proga)();
     a3c:	4b01      	ldr	r3, [pc, #4]	; (a44 <cmd_run+0xc>)
     a3e:	681b      	ldr	r3, [r3, #0]
     a40:	4798      	blx	r3
	
}
     a42:	bd80      	pop	{r7, pc}
     a44:	20000118 	.word	0x20000118

00000a48 <cmd_peek8>:

static void cmd_peek8(){
     a48:	b580      	push	{r7, lr}
     a4a:	b082      	sub	sp, #8
     a4c:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     a4e:	f000 f9fb 	bl	e48 <word>
	u=atoi((const char*)pad);
     a52:	4808      	ldr	r0, [pc, #32]	; (a74 <cmd_peek8+0x2c>)
     a54:	f7ff fcb6 	bl	3c4 <atoi>
     a58:	4603      	mov	r3, r0
     a5a:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     a5c:	1d3b      	adds	r3, r7, #4
     a5e:	2200      	movs	r2, #0
     a60:	4618      	mov	r0, r3
     a62:	4611      	mov	r1, r2
     a64:	df0b      	svc	11
	*(uint32_t*)pad=u&0xff;
     a66:	4a03      	ldr	r2, [pc, #12]	; (a74 <cmd_peek8+0x2c>)
     a68:	687b      	ldr	r3, [r7, #4]
     a6a:	b2db      	uxtb	r3, r3
     a6c:	6013      	str	r3, [r2, #0]
}
     a6e:	3708      	adds	r7, #8
     a70:	46bd      	mov	sp, r7
     a72:	bd80      	pop	{r7, pc}
     a74:	20000060 	.word	0x20000060

00000a78 <cmd_peek16>:

static void cmd_peek16(){
     a78:	b580      	push	{r7, lr}
     a7a:	b082      	sub	sp, #8
     a7c:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     a7e:	f000 f9e3 	bl	e48 <word>
	u=atoi((const char*)pad);
     a82:	4808      	ldr	r0, [pc, #32]	; (aa4 <cmd_peek16+0x2c>)
     a84:	f7ff fc9e 	bl	3c4 <atoi>
     a88:	4603      	mov	r3, r0
     a8a:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     a8c:	1d3b      	adds	r3, r7, #4
     a8e:	2200      	movs	r2, #0
     a90:	4618      	mov	r0, r3
     a92:	4611      	mov	r1, r2
     a94:	df0c      	svc	12
	*(uint32_t*)pad=u&0xffff;
     a96:	4a03      	ldr	r2, [pc, #12]	; (aa4 <cmd_peek16+0x2c>)
     a98:	687b      	ldr	r3, [r7, #4]
     a9a:	b29b      	uxth	r3, r3
     a9c:	6013      	str	r3, [r2, #0]
}
     a9e:	3708      	adds	r7, #8
     aa0:	46bd      	mov	sp, r7
     aa2:	bd80      	pop	{r7, pc}
     aa4:	20000060 	.word	0x20000060

00000aa8 <cmd_peek32>:

static void cmd_peek32(){
     aa8:	b580      	push	{r7, lr}
     aaa:	b082      	sub	sp, #8
     aac:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     aae:	f000 f9cb 	bl	e48 <word>
	u=atoi((const char*)pad);
     ab2:	4808      	ldr	r0, [pc, #32]	; (ad4 <cmd_peek32+0x2c>)
     ab4:	f7ff fc86 	bl	3c4 <atoi>
     ab8:	4603      	mov	r3, r0
     aba:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK32,&u,NUL);
     abc:	1d3b      	adds	r3, r7, #4
     abe:	2200      	movs	r2, #0
     ac0:	4618      	mov	r0, r3
     ac2:	4611      	mov	r1, r2
     ac4:	df0d      	svc	13
	*(uint32_t*)pad=u;
     ac6:	4a03      	ldr	r2, [pc, #12]	; (ad4 <cmd_peek32+0x2c>)
     ac8:	687b      	ldr	r3, [r7, #4]
     aca:	6013      	str	r3, [r2, #0]
}
     acc:	3708      	adds	r7, #8
     ace:	46bd      	mov	sp, r7
     ad0:	bd80      	pop	{r7, pc}
     ad2:	bf00      	nop
     ad4:	20000060 	.word	0x20000060

00000ad8 <cmd_poke8>:

static void cmd_poke8(){
     ad8:	b580      	push	{r7, lr}
     ada:	b082      	sub	sp, #8
     adc:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     ade:	f000 f9b3 	bl	e48 <word>
	adr=atoi((const char*)pad);
     ae2:	480a      	ldr	r0, [pc, #40]	; (b0c <cmd_poke8+0x34>)
     ae4:	f7ff fc6e 	bl	3c4 <atoi>
     ae8:	4603      	mov	r3, r0
     aea:	607b      	str	r3, [r7, #4]
	word();
     aec:	f000 f9ac 	bl	e48 <word>
	u8=atoi((const char*)pad);
     af0:	4806      	ldr	r0, [pc, #24]	; (b0c <cmd_poke8+0x34>)
     af2:	f7ff fc67 	bl	3c4 <atoi>
     af6:	4603      	mov	r3, r0
     af8:	b2db      	uxtb	r3, r3
     afa:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     afc:	1d3b      	adds	r3, r7, #4
     afe:	1cfa      	adds	r2, r7, #3
     b00:	4618      	mov	r0, r3
     b02:	4611      	mov	r1, r2
     b04:	df0e      	svc	14
}
     b06:	3708      	adds	r7, #8
     b08:	46bd      	mov	sp, r7
     b0a:	bd80      	pop	{r7, pc}
     b0c:	20000060 	.word	0x20000060

00000b10 <cmd_poke16>:

static void cmd_poke16(){
     b10:	b580      	push	{r7, lr}
     b12:	b082      	sub	sp, #8
     b14:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     b16:	f000 f997 	bl	e48 <word>
	adr=atoi((const char*)pad);
     b1a:	480a      	ldr	r0, [pc, #40]	; (b44 <cmd_poke16+0x34>)
     b1c:	f7ff fc52 	bl	3c4 <atoi>
     b20:	4603      	mov	r3, r0
     b22:	607b      	str	r3, [r7, #4]
	word();
     b24:	f000 f990 	bl	e48 <word>
	u16=atoi((const char*)pad);
     b28:	4806      	ldr	r0, [pc, #24]	; (b44 <cmd_poke16+0x34>)
     b2a:	f7ff fc4b 	bl	3c4 <atoi>
     b2e:	4603      	mov	r3, r0
     b30:	b29b      	uxth	r3, r3
     b32:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     b34:	1d3b      	adds	r3, r7, #4
     b36:	1cba      	adds	r2, r7, #2
     b38:	4618      	mov	r0, r3
     b3a:	4611      	mov	r1, r2
     b3c:	df0f      	svc	15
}
     b3e:	3708      	adds	r7, #8
     b40:	46bd      	mov	sp, r7
     b42:	bd80      	pop	{r7, pc}
     b44:	20000060 	.word	0x20000060

00000b48 <cmd_poke32>:

static void cmd_poke32(){
     b48:	b580      	push	{r7, lr}
     b4a:	b082      	sub	sp, #8
     b4c:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     b4e:	f000 f97b 	bl	e48 <word>
	adr=atoi((const char*)pad);
     b52:	480a      	ldr	r0, [pc, #40]	; (b7c <cmd_poke32+0x34>)
     b54:	f7ff fc36 	bl	3c4 <atoi>
     b58:	4603      	mov	r3, r0
     b5a:	607b      	str	r3, [r7, #4]
	word();
     b5c:	f000 f974 	bl	e48 <word>
	u32=atoi((const char*)pad);
     b60:	4806      	ldr	r0, [pc, #24]	; (b7c <cmd_poke32+0x34>)
     b62:	f7ff fc2f 	bl	3c4 <atoi>
     b66:	4603      	mov	r3, r0
     b68:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     b6a:	1d3b      	adds	r3, r7, #4
     b6c:	463a      	mov	r2, r7
     b6e:	4618      	mov	r0, r3
     b70:	4611      	mov	r1, r2
     b72:	df10      	svc	16
}
     b74:	3708      	adds	r7, #8
     b76:	46bd      	mov	sp, r7
     b78:	bd80      	pop	{r7, pc}
     b7a:	bf00      	nop
     b7c:	20000060 	.word	0x20000060

00000b80 <cmd_fwrite>:

static void cmd_fwrite(){
     b80:	b580      	push	{r7, lr}
     b82:	b082      	sub	sp, #8
     b84:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	word();
     b86:	f000 f95f 	bl	e48 <word>
	adr=atoi((const char*)pad);
     b8a:	480d      	ldr	r0, [pc, #52]	; (bc0 <cmd_fwrite+0x40>)
     b8c:	f7ff fc1a 	bl	3c4 <atoi>
     b90:	4603      	mov	r3, r0
     b92:	607b      	str	r3, [r7, #4]
	word();
     b94:	f000 f958 	bl	e48 <word>
	u32=atoi((const char*)pad);
     b98:	4809      	ldr	r0, [pc, #36]	; (bc0 <cmd_fwrite+0x40>)
     b9a:	f7ff fc13 	bl	3c4 <atoi>
     b9e:	4603      	mov	r3, r0
     ba0:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_FLASH_WR,&adr,&u32);
     ba2:	1d3b      	adds	r3, r7, #4
     ba4:	463a      	mov	r2, r7
     ba6:	4618      	mov	r0, r3
     ba8:	4611      	mov	r1, r2
     baa:	df11      	svc	17
	if (!adr) print(" failed\n");
     bac:	687b      	ldr	r3, [r7, #4]
     bae:	2b00      	cmp	r3, #0
     bb0:	d102      	bne.n	bb8 <cmd_fwrite+0x38>
     bb2:	4804      	ldr	r0, [pc, #16]	; (bc4 <cmd_fwrite+0x44>)
     bb4:	f000 fac0 	bl	1138 <print>
}
     bb8:	3708      	adds	r7, #8
     bba:	46bd      	mov	sp, r7
     bbc:	bd80      	pop	{r7, pc}
     bbe:	bf00      	nop
     bc0:	20000060 	.word	0x20000060
     bc4:	00002648 	.word	0x00002648

00000bc8 <cmd_pgerase>:

static void cmd_pgerase(){
     bc8:	b580      	push	{r7, lr}
     bca:	b082      	sub	sp, #8
     bcc:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     bce:	f000 f93b 	bl	e48 <word>
	adr=atoi((const char*)pad);
     bd2:	4809      	ldr	r0, [pc, #36]	; (bf8 <cmd_pgerase+0x30>)
     bd4:	f7ff fbf6 	bl	3c4 <atoi>
     bd8:	4603      	mov	r3, r0
     bda:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_FLASH_PGER,&adr,0);
     bdc:	1d3b      	adds	r3, r7, #4
     bde:	2200      	movs	r2, #0
     be0:	4618      	mov	r0, r3
     be2:	4611      	mov	r1, r2
     be4:	df12      	svc	18
	if (!adr) print(" failed\n");
     be6:	687b      	ldr	r3, [r7, #4]
     be8:	2b00      	cmp	r3, #0
     bea:	d102      	bne.n	bf2 <cmd_pgerase+0x2a>
     bec:	4803      	ldr	r0, [pc, #12]	; (bfc <cmd_pgerase+0x34>)
     bee:	f000 faa3 	bl	1138 <print>
}
     bf2:	3708      	adds	r7, #8
     bf4:	46bd      	mov	sp, r7
     bf6:	bd80      	pop	{r7, pc}
     bf8:	20000060 	.word	0x20000060
     bfc:	00002648 	.word	0x00002648

00000c00 <cmd_ticks>:

static void cmd_ticks(){
     c00:	b480      	push	{r7}
     c02:	af00      	add	r7, sp, #0
	_svc_call(SVC_TICKS,&pad,0);
     c04:	4b04      	ldr	r3, [pc, #16]	; (c18 <cmd_ticks+0x18>)
     c06:	2200      	movs	r2, #0
     c08:	4618      	mov	r0, r3
     c0a:	4611      	mov	r1, r2
     c0c:	df13      	svc	19
}
     c0e:	46bd      	mov	sp, r7
     c10:	f85d 7b04 	ldr.w	r7, [sp], #4
     c14:	4770      	bx	lr
     c16:	bf00      	nop
     c18:	20000060 	.word	0x20000060

00000c1c <search_command>:
	{"ticks",cmd_ticks},
	{NUL,NUL}
};


int search_command(const char * name){
     c1c:	b580      	push	{r7, lr}
     c1e:	b084      	sub	sp, #16
     c20:	af00      	add	r7, sp, #0
     c22:	6078      	str	r0, [r7, #4]
	int i=0;
     c24:	2300      	movs	r3, #0
     c26:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     c28:	e00e      	b.n	c48 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     c2a:	4a12      	ldr	r2, [pc, #72]	; (c74 <search_command+0x58>)
     c2c:	68fb      	ldr	r3, [r7, #12]
     c2e:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     c32:	4618      	mov	r0, r3
     c34:	6879      	ldr	r1, [r7, #4]
     c36:	f7ff fb47 	bl	2c8 <strcmp>
     c3a:	4603      	mov	r3, r0
     c3c:	2b00      	cmp	r3, #0
     c3e:	d100      	bne.n	c42 <search_command+0x26>
			break;
     c40:	e009      	b.n	c56 <search_command+0x3a>
		}
		i++;
     c42:	68fb      	ldr	r3, [r7, #12]
     c44:	3301      	adds	r3, #1
     c46:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     c48:	4a0a      	ldr	r2, [pc, #40]	; (c74 <search_command+0x58>)
     c4a:	68fb      	ldr	r3, [r7, #12]
     c4c:	00db      	lsls	r3, r3, #3
     c4e:	4413      	add	r3, r2
     c50:	685b      	ldr	r3, [r3, #4]
     c52:	2b00      	cmp	r3, #0
     c54:	d1e9      	bne.n	c2a <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     c56:	4a07      	ldr	r2, [pc, #28]	; (c74 <search_command+0x58>)
     c58:	68fb      	ldr	r3, [r7, #12]
     c5a:	00db      	lsls	r3, r3, #3
     c5c:	4413      	add	r3, r2
     c5e:	685b      	ldr	r3, [r3, #4]
     c60:	2b00      	cmp	r3, #0
     c62:	d102      	bne.n	c6a <search_command+0x4e>
     c64:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     c68:	60fb      	str	r3, [r7, #12]
	return i;
     c6a:	68fb      	ldr	r3, [r7, #12]
}
     c6c:	4618      	mov	r0, r3
     c6e:	3710      	adds	r7, #16
     c70:	46bd      	mov	sp, r7
     c72:	bd80      	pop	{r7, pc}
     c74:	000026fc 	.word	0x000026fc

00000c78 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     c78:	b480      	push	{r7}
     c7a:	b085      	sub	sp, #20
     c7c:	af00      	add	r7, sp, #0
     c7e:	60f8      	str	r0, [r7, #12]
     c80:	60b9      	str	r1, [r7, #8]
     c82:	4613      	mov	r3, r2
     c84:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     c86:	e002      	b.n	c8e <skip+0x16>
     c88:	68bb      	ldr	r3, [r7, #8]
     c8a:	3301      	adds	r3, #1
     c8c:	60bb      	str	r3, [r7, #8]
     c8e:	68bb      	ldr	r3, [r7, #8]
     c90:	68fa      	ldr	r2, [r7, #12]
     c92:	4413      	add	r3, r2
     c94:	781b      	ldrb	r3, [r3, #0]
     c96:	2b00      	cmp	r3, #0
     c98:	d006      	beq.n	ca8 <skip+0x30>
     c9a:	68bb      	ldr	r3, [r7, #8]
     c9c:	68fa      	ldr	r2, [r7, #12]
     c9e:	4413      	add	r3, r2
     ca0:	781b      	ldrb	r3, [r3, #0]
     ca2:	79fa      	ldrb	r2, [r7, #7]
     ca4:	429a      	cmp	r2, r3
     ca6:	d0ef      	beq.n	c88 <skip+0x10>
	return start;
     ca8:	68bb      	ldr	r3, [r7, #8]
}
     caa:	4618      	mov	r0, r3
     cac:	3714      	adds	r7, #20
     cae:	46bd      	mov	sp, r7
     cb0:	f85d 7b04 	ldr.w	r7, [sp], #4
     cb4:	4770      	bx	lr
     cb6:	bf00      	nop

00000cb8 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     cb8:	b480      	push	{r7}
     cba:	b085      	sub	sp, #20
     cbc:	af00      	add	r7, sp, #0
     cbe:	60f8      	str	r0, [r7, #12]
     cc0:	60b9      	str	r1, [r7, #8]
     cc2:	4613      	mov	r3, r2
     cc4:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     cc6:	e002      	b.n	cce <scan+0x16>
     cc8:	68bb      	ldr	r3, [r7, #8]
     cca:	3301      	adds	r3, #1
     ccc:	60bb      	str	r3, [r7, #8]
     cce:	68bb      	ldr	r3, [r7, #8]
     cd0:	68fa      	ldr	r2, [r7, #12]
     cd2:	4413      	add	r3, r2
     cd4:	781b      	ldrb	r3, [r3, #0]
     cd6:	2b00      	cmp	r3, #0
     cd8:	d006      	beq.n	ce8 <scan+0x30>
     cda:	68bb      	ldr	r3, [r7, #8]
     cdc:	68fa      	ldr	r2, [r7, #12]
     cde:	4413      	add	r3, r2
     ce0:	781b      	ldrb	r3, [r3, #0]
     ce2:	79fa      	ldrb	r2, [r7, #7]
     ce4:	429a      	cmp	r2, r3
     ce6:	d1ef      	bne.n	cc8 <scan+0x10>
	return start;
     ce8:	68bb      	ldr	r3, [r7, #8]
}
     cea:	4618      	mov	r0, r3
     cec:	3714      	adds	r7, #20
     cee:	46bd      	mov	sp, r7
     cf0:	f85d 7b04 	ldr.w	r7, [sp], #4
     cf4:	4770      	bx	lr
     cf6:	bf00      	nop

00000cf8 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     cf8:	b480      	push	{r7}
     cfa:	b087      	sub	sp, #28
     cfc:	af00      	add	r7, sp, #0
     cfe:	6078      	str	r0, [r7, #4]
     d00:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     d02:	2300      	movs	r3, #0
     d04:	617b      	str	r3, [r7, #20]
     d06:	683b      	ldr	r3, [r7, #0]
     d08:	613b      	str	r3, [r7, #16]
     d0a:	2300      	movs	r3, #0
     d0c:	60fb      	str	r3, [r7, #12]
     d0e:	2301      	movs	r3, #1
     d10:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     d12:	e040      	b.n	d96 <quote+0x9e>
		switch (buffer[end]){
     d14:	693b      	ldr	r3, [r7, #16]
     d16:	687a      	ldr	r2, [r7, #4]
     d18:	4413      	add	r3, r2
     d1a:	781b      	ldrb	r3, [r3, #0]
     d1c:	2b5c      	cmp	r3, #92	; 0x5c
     d1e:	d012      	beq.n	d46 <quote+0x4e>
     d20:	2b6e      	cmp	r3, #110	; 0x6e
     d22:	d022      	beq.n	d6a <quote+0x72>
     d24:	2b22      	cmp	r3, #34	; 0x22
     d26:	d128      	bne.n	d7a <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     d28:	697b      	ldr	r3, [r7, #20]
     d2a:	2b00      	cmp	r3, #0
     d2c:	d102      	bne.n	d34 <quote+0x3c>
     d2e:	2300      	movs	r3, #0
     d30:	60bb      	str	r3, [r7, #8]
			break;
     d32:	e02d      	b.n	d90 <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     d34:	68fb      	ldr	r3, [r7, #12]
     d36:	1c5a      	adds	r2, r3, #1
     d38:	60fa      	str	r2, [r7, #12]
     d3a:	4a21      	ldr	r2, [pc, #132]	; (dc0 <quote+0xc8>)
     d3c:	2122      	movs	r1, #34	; 0x22
     d3e:	54d1      	strb	r1, [r2, r3]
     d40:	2300      	movs	r3, #0
     d42:	617b      	str	r3, [r7, #20]
			break;
     d44:	e024      	b.n	d90 <quote+0x98>
		case '\\':
			if (!escaped){
     d46:	697b      	ldr	r3, [r7, #20]
     d48:	2b00      	cmp	r3, #0
     d4a:	d102      	bne.n	d52 <quote+0x5a>
				escaped=1;
     d4c:	2301      	movs	r3, #1
     d4e:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     d50:	e01e      	b.n	d90 <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     d52:	2300      	movs	r3, #0
     d54:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     d56:	68fb      	ldr	r3, [r7, #12]
     d58:	1c5a      	adds	r2, r3, #1
     d5a:	60fa      	str	r2, [r7, #12]
     d5c:	693a      	ldr	r2, [r7, #16]
     d5e:	6879      	ldr	r1, [r7, #4]
     d60:	440a      	add	r2, r1
     d62:	7811      	ldrb	r1, [r2, #0]
     d64:	4a16      	ldr	r2, [pc, #88]	; (dc0 <quote+0xc8>)
     d66:	54d1      	strb	r1, [r2, r3]
			}
			break;
     d68:	e012      	b.n	d90 <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     d6a:	697b      	ldr	r3, [r7, #20]
     d6c:	2b00      	cmp	r3, #0
     d6e:	d004      	beq.n	d7a <quote+0x82>
     d70:	693b      	ldr	r3, [r7, #16]
     d72:	687a      	ldr	r2, [r7, #4]
     d74:	4413      	add	r3, r2
     d76:	220d      	movs	r2, #13
     d78:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     d7a:	2300      	movs	r3, #0
     d7c:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     d7e:	68fb      	ldr	r3, [r7, #12]
     d80:	1c5a      	adds	r2, r3, #1
     d82:	60fa      	str	r2, [r7, #12]
     d84:	693a      	ldr	r2, [r7, #16]
     d86:	6879      	ldr	r1, [r7, #4]
     d88:	440a      	add	r2, r1
     d8a:	7811      	ldrb	r1, [r2, #0]
     d8c:	4a0c      	ldr	r2, [pc, #48]	; (dc0 <quote+0xc8>)
     d8e:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     d90:	693b      	ldr	r3, [r7, #16]
     d92:	3301      	adds	r3, #1
     d94:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     d96:	693b      	ldr	r3, [r7, #16]
     d98:	687a      	ldr	r2, [r7, #4]
     d9a:	4413      	add	r3, r2
     d9c:	781b      	ldrb	r3, [r3, #0]
     d9e:	2b00      	cmp	r3, #0
     da0:	d002      	beq.n	da8 <quote+0xb0>
     da2:	68bb      	ldr	r3, [r7, #8]
     da4:	2b00      	cmp	r3, #0
     da6:	d1b5      	bne.n	d14 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     da8:	4a05      	ldr	r2, [pc, #20]	; (dc0 <quote+0xc8>)
     daa:	68fb      	ldr	r3, [r7, #12]
     dac:	4413      	add	r3, r2
     dae:	2200      	movs	r2, #0
     db0:	701a      	strb	r2, [r3, #0]
	return end;
     db2:	693b      	ldr	r3, [r7, #16]
}
     db4:	4618      	mov	r0, r3
     db6:	371c      	adds	r7, #28
     db8:	46bd      	mov	sp, r7
     dba:	f85d 7b04 	ldr.w	r7, [sp], #4
     dbe:	4770      	bx	lr
     dc0:	20000060 	.word	0x20000060

00000dc4 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     dc4:	b480      	push	{r7}
     dc6:	b087      	sub	sp, #28
     dc8:	af00      	add	r7, sp, #0
     dca:	60f8      	str	r0, [r7, #12]
     dcc:	60b9      	str	r1, [r7, #8]
     dce:	4613      	mov	r3, r2
     dd0:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     dd2:	68bb      	ldr	r3, [r7, #8]
     dd4:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     dd6:	e002      	b.n	dde <next+0x1a>
     dd8:	697b      	ldr	r3, [r7, #20]
     dda:	3301      	adds	r3, #1
     ddc:	617b      	str	r3, [r7, #20]
     dde:	697b      	ldr	r3, [r7, #20]
     de0:	68fa      	ldr	r2, [r7, #12]
     de2:	4413      	add	r3, r2
     de4:	781b      	ldrb	r3, [r3, #0]
     de6:	2b00      	cmp	r3, #0
     de8:	d006      	beq.n	df8 <next+0x34>
     dea:	697b      	ldr	r3, [r7, #20]
     dec:	68fa      	ldr	r2, [r7, #12]
     dee:	4413      	add	r3, r2
     df0:	781b      	ldrb	r3, [r3, #0]
     df2:	79fa      	ldrb	r2, [r7, #7]
     df4:	429a      	cmp	r2, r3
     df6:	d1ef      	bne.n	dd8 <next+0x14>
	return end-start;
     df8:	697a      	ldr	r2, [r7, #20]
     dfa:	68bb      	ldr	r3, [r7, #8]
     dfc:	1ad3      	subs	r3, r2, r3
}
     dfe:	4618      	mov	r0, r3
     e00:	371c      	adds	r7, #28
     e02:	46bd      	mov	sp, r7
     e04:	f85d 7b04 	ldr.w	r7, [sp], #4
     e08:	4770      	bx	lr
     e0a:	bf00      	nop

00000e0c <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     e0c:	b480      	push	{r7}
     e0e:	b085      	sub	sp, #20
     e10:	af00      	add	r7, sp, #0
     e12:	60f8      	str	r0, [r7, #12]
     e14:	60b9      	str	r1, [r7, #8]
     e16:	607a      	str	r2, [r7, #4]
	while (len){
     e18:	e00a      	b.n	e30 <move+0x24>
		*dest++=*src++;
     e1a:	68bb      	ldr	r3, [r7, #8]
     e1c:	1c5a      	adds	r2, r3, #1
     e1e:	60ba      	str	r2, [r7, #8]
     e20:	68fa      	ldr	r2, [r7, #12]
     e22:	1c51      	adds	r1, r2, #1
     e24:	60f9      	str	r1, [r7, #12]
     e26:	7812      	ldrb	r2, [r2, #0]
     e28:	701a      	strb	r2, [r3, #0]
		len--;
     e2a:	687b      	ldr	r3, [r7, #4]
     e2c:	3b01      	subs	r3, #1
     e2e:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     e30:	687b      	ldr	r3, [r7, #4]
     e32:	2b00      	cmp	r3, #0
     e34:	d1f1      	bne.n	e1a <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     e36:	68bb      	ldr	r3, [r7, #8]
     e38:	2200      	movs	r2, #0
     e3a:	701a      	strb	r2, [r3, #0]
}
     e3c:	3714      	adds	r7, #20
     e3e:	46bd      	mov	sp, r7
     e40:	f85d 7b04 	ldr.w	r7, [sp], #4
     e44:	4770      	bx	lr
     e46:	bf00      	nop

00000e48 <word>:

// extrait le prochain mot du tib
static void word(){
     e48:	b580      	push	{r7, lr}
     e4a:	b082      	sub	sp, #8
     e4c:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     e4e:	4b1d      	ldr	r3, [pc, #116]	; (ec4 <word+0x7c>)
     e50:	681b      	ldr	r3, [r3, #0]
     e52:	481d      	ldr	r0, [pc, #116]	; (ec8 <word+0x80>)
     e54:	4619      	mov	r1, r3
     e56:	2220      	movs	r2, #32
     e58:	f7ff ff0e 	bl	c78 <skip>
     e5c:	4603      	mov	r3, r0
     e5e:	461a      	mov	r2, r3
     e60:	4b18      	ldr	r3, [pc, #96]	; (ec4 <word+0x7c>)
     e62:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     e64:	4b17      	ldr	r3, [pc, #92]	; (ec4 <word+0x7c>)
     e66:	681b      	ldr	r3, [r3, #0]
     e68:	4a17      	ldr	r2, [pc, #92]	; (ec8 <word+0x80>)
     e6a:	5cd3      	ldrb	r3, [r2, r3]
     e6c:	2b22      	cmp	r3, #34	; 0x22
     e6e:	d10f      	bne.n	e90 <word+0x48>
			in++;
     e70:	4b14      	ldr	r3, [pc, #80]	; (ec4 <word+0x7c>)
     e72:	681b      	ldr	r3, [r3, #0]
     e74:	3301      	adds	r3, #1
     e76:	4a13      	ldr	r2, [pc, #76]	; (ec4 <word+0x7c>)
     e78:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     e7a:	4b12      	ldr	r3, [pc, #72]	; (ec4 <word+0x7c>)
     e7c:	681b      	ldr	r3, [r3, #0]
     e7e:	4812      	ldr	r0, [pc, #72]	; (ec8 <word+0x80>)
     e80:	4619      	mov	r1, r3
     e82:	f7ff ff39 	bl	cf8 <quote>
     e86:	4603      	mov	r3, r0
     e88:	461a      	mov	r2, r3
     e8a:	4b0e      	ldr	r3, [pc, #56]	; (ec4 <word+0x7c>)
     e8c:	601a      	str	r2, [r3, #0]
     e8e:	e016      	b.n	ebe <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     e90:	4b0c      	ldr	r3, [pc, #48]	; (ec4 <word+0x7c>)
     e92:	681b      	ldr	r3, [r3, #0]
     e94:	480c      	ldr	r0, [pc, #48]	; (ec8 <word+0x80>)
     e96:	4619      	mov	r1, r3
     e98:	2220      	movs	r2, #32
     e9a:	f7ff ff93 	bl	dc4 <next>
     e9e:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     ea0:	4b08      	ldr	r3, [pc, #32]	; (ec4 <word+0x7c>)
     ea2:	681b      	ldr	r3, [r3, #0]
     ea4:	4a08      	ldr	r2, [pc, #32]	; (ec8 <word+0x80>)
     ea6:	4413      	add	r3, r2
     ea8:	4618      	mov	r0, r3
     eaa:	4908      	ldr	r1, [pc, #32]	; (ecc <word+0x84>)
     eac:	687a      	ldr	r2, [r7, #4]
     eae:	f7ff ffad 	bl	e0c <move>
			in+=len;
     eb2:	4b04      	ldr	r3, [pc, #16]	; (ec4 <word+0x7c>)
     eb4:	681a      	ldr	r2, [r3, #0]
     eb6:	687b      	ldr	r3, [r7, #4]
     eb8:	4413      	add	r3, r2
     eba:	4a02      	ldr	r2, [pc, #8]	; (ec4 <word+0x7c>)
     ebc:	6013      	str	r3, [r2, #0]
		}
}
     ebe:	3708      	adds	r7, #8
     ec0:	46bd      	mov	sp, r7
     ec2:	bd80      	pop	{r7, pc}
     ec4:	200000b0 	.word	0x200000b0
     ec8:	20000010 	.word	0x20000010
     ecc:	20000060 	.word	0x20000060

00000ed0 <parse_line>:

static void parse_line(unsigned llen){
     ed0:	b580      	push	{r7, lr}
     ed2:	b084      	sub	sp, #16
     ed4:	af00      	add	r7, sp, #0
     ed6:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     ed8:	4b14      	ldr	r3, [pc, #80]	; (f2c <parse_line+0x5c>)
     eda:	2200      	movs	r2, #0
     edc:	601a      	str	r2, [r3, #0]
	while (in<llen){
     ede:	e019      	b.n	f14 <parse_line+0x44>
		word();
     ee0:	f7ff ffb2 	bl	e48 <word>
		cmd_id=search_command((const char*) pad);
     ee4:	4812      	ldr	r0, [pc, #72]	; (f30 <parse_line+0x60>)
     ee6:	f7ff fe99 	bl	c1c <search_command>
     eea:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     eec:	68fb      	ldr	r3, [r7, #12]
     eee:	2b00      	cmp	r3, #0
     ef0:	db06      	blt.n	f00 <parse_line+0x30>
			commands[cmd_id].fn();
     ef2:	4a10      	ldr	r2, [pc, #64]	; (f34 <parse_line+0x64>)
     ef4:	68fb      	ldr	r3, [r7, #12]
     ef6:	00db      	lsls	r3, r3, #3
     ef8:	4413      	add	r3, r2
     efa:	685b      	ldr	r3, [r3, #4]
     efc:	4798      	blx	r3
     efe:	e009      	b.n	f14 <parse_line+0x44>
		}else{
			conout(CR);
     f00:	200d      	movs	r0, #13
     f02:	f000 f8e7 	bl	10d4 <conout>
			print((const char*)pad); conout('?');
     f06:	480a      	ldr	r0, [pc, #40]	; (f30 <parse_line+0x60>)
     f08:	f000 f916 	bl	1138 <print>
     f0c:	203f      	movs	r0, #63	; 0x3f
     f0e:	f000 f8e1 	bl	10d4 <conout>
			break;
     f12:	e004      	b.n	f1e <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     f14:	4b05      	ldr	r3, [pc, #20]	; (f2c <parse_line+0x5c>)
     f16:	681a      	ldr	r2, [r3, #0]
     f18:	687b      	ldr	r3, [r7, #4]
     f1a:	429a      	cmp	r2, r3
     f1c:	d3e0      	bcc.n	ee0 <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     f1e:	200d      	movs	r0, #13
     f20:	f000 f8d8 	bl	10d4 <conout>
}
     f24:	3710      	adds	r7, #16
     f26:	46bd      	mov	sp, r7
     f28:	bd80      	pop	{r7, pc}
     f2a:	bf00      	nop
     f2c:	200000b0 	.word	0x200000b0
     f30:	20000060 	.word	0x20000060
     f34:	000026fc 	.word	0x000026fc

00000f38 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     f38:	b480      	push	{r7}
     f3a:	b085      	sub	sp, #20
     f3c:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     f3e:	4b0c      	ldr	r3, [pc, #48]	; (f70 <copy_blink_in_ram+0x38>)
     f40:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     f42:	4b0c      	ldr	r3, [pc, #48]	; (f74 <copy_blink_in_ram+0x3c>)
     f44:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     f46:	4b0c      	ldr	r3, [pc, #48]	; (f78 <copy_blink_in_ram+0x40>)
     f48:	60bb      	str	r3, [r7, #8]
	while (start<end){
     f4a:	e007      	b.n	f5c <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     f4c:	68bb      	ldr	r3, [r7, #8]
     f4e:	1d1a      	adds	r2, r3, #4
     f50:	60ba      	str	r2, [r7, #8]
     f52:	68fa      	ldr	r2, [r7, #12]
     f54:	1d11      	adds	r1, r2, #4
     f56:	60f9      	str	r1, [r7, #12]
     f58:	6812      	ldr	r2, [r2, #0]
     f5a:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     f5c:	68fa      	ldr	r2, [r7, #12]
     f5e:	687b      	ldr	r3, [r7, #4]
     f60:	429a      	cmp	r2, r3
     f62:	d3f3      	bcc.n	f4c <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     f64:	3714      	adds	r7, #20
     f66:	46bd      	mov	sp, r7
     f68:	f85d 7b04 	ldr.w	r7, [sp], #4
     f6c:	4770      	bx	lr
     f6e:	bf00      	nop
     f70:	00003000 	.word	0x00003000
     f74:	00003080 	.word	0x00003080
     f78:	20002700 	.word	0x20002700

00000f7c <main>:

extern void print_fault(const char *msg, sfrp_t adr);


void main(void){
     f7c:	b580      	push	{r7, lr}
     f7e:	b082      	sub	sp, #8
     f80:	af00      	add	r7, sp, #0
	set_sysclock();
     f82:	f7ff fc01 	bl	788 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     f86:	f06f 000a 	mvn.w	r0, #10
     f8a:	210f      	movs	r1, #15
     f8c:	f000 ff16 	bl	1dbc <set_int_priority>
	config_systicks();
     f90:	f7ff fc42 	bl	818 <config_systicks>
	flash_enable();
     f94:	f000 faae 	bl	14f4 <flash_enable>
	APB2ENR->fld.iopcen=1;
     f98:	4b31      	ldr	r3, [pc, #196]	; (1060 <main+0xe4>)
     f9a:	681a      	ldr	r2, [r3, #0]
     f9c:	f042 0210 	orr.w	r2, r2, #16
     fa0:	601a      	str	r2, [r3, #0]
	APB2ENR->fld.iopaen=1;
     fa2:	4b2f      	ldr	r3, [pc, #188]	; (1060 <main+0xe4>)
     fa4:	681a      	ldr	r2, [r3, #0]
     fa6:	f042 0204 	orr.w	r2, r2, #4
     faa:	601a      	str	r2, [r3, #0]
	APB2ENR->fld.iopben=1;
     fac:	4b2c      	ldr	r3, [pc, #176]	; (1060 <main+0xe4>)
     fae:	681a      	ldr	r2, [r3, #0]
     fb0:	f042 0208 	orr.w	r2, r2, #8
     fb4:	601a      	str	r2, [r3, #0]
	APB2ENR->fld.afioen=1;
     fb6:	4b2a      	ldr	r3, [pc, #168]	; (1060 <main+0xe4>)
     fb8:	681a      	ldr	r2, [r3, #0]
     fba:	f042 0201 	orr.w	r2, r2, #1
     fbe:	601a      	str	r2, [r3, #0]
	APB1ENR->fld.spi2en=1;
     fc0:	4b28      	ldr	r3, [pc, #160]	; (1064 <main+0xe8>)
     fc2:	681a      	ldr	r2, [r3, #0]
     fc4:	f442 4280 	orr.w	r2, r2, #16384	; 0x4000
     fc8:	601a      	str	r2, [r3, #0]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     fca:	4a27      	ldr	r2, [pc, #156]	; (1068 <main+0xec>)
     fcc:	4b26      	ldr	r3, [pc, #152]	; (1068 <main+0xec>)
     fce:	695b      	ldr	r3, [r3, #20]
     fd0:	f043 0301 	orr.w	r3, r3, #1
     fd4:	6153      	str	r3, [r2, #20]
	config_pin(GPIOC,LED_PIN,OUTPUT_OD_SLOW);
     fd6:	2002      	movs	r0, #2
     fd8:	210d      	movs	r1, #13
     fda:	2206      	movs	r2, #6
     fdc:	f000 fc74 	bl	18c8 <config_pin>
	uart_open_channel(CON,115200,PARITY_DISABLE,FLOW_HARD);
     fe0:	4822      	ldr	r0, [pc, #136]	; (106c <main+0xf0>)
     fe2:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     fe6:	2200      	movs	r2, #0
     fe8:	2301      	movs	r3, #1
     fea:	f001 fa41 	bl	2470 <uart_open_channel>
	keyboard_init();
     fee:	f000 fcaf 	bl	1950 <keyboard_init>
	tvout_init();
     ff2:	f001 f877 	bl	20e4 <tvout_init>
	cls();
     ff6:	f000 f8cf 	bl	1198 <cls>
	print(VERSION);
     ffa:	4b1d      	ldr	r3, [pc, #116]	; (1070 <main+0xf4>)
     ffc:	681b      	ldr	r3, [r3, #0]
     ffe:	4618      	mov	r0, r3
    1000:	f000 f89a 	bl	1138 <print>
	copy_blink_in_ram();
    1004:	f7ff ff98 	bl	f38 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
    1008:	481a      	ldr	r0, [pc, #104]	; (1074 <main+0xf8>)
    100a:	f000 f895 	bl	1138 <print>
    100e:	4b1a      	ldr	r3, [pc, #104]	; (1078 <main+0xfc>)
    1010:	2200      	movs	r2, #0
    1012:	4618      	mov	r0, r3
    1014:	4611      	mov	r1, r2
    1016:	df0a      	svc	10
    1018:	200d      	movs	r0, #13
    101a:	f000 f85b 	bl	10d4 <conout>
	//print_int(VIDEO_DELAY,10);
	_svc_call(SVC_LED_ON,NUL,NUL);
    101e:	2300      	movs	r3, #0
    1020:	2200      	movs	r2, #0
    1022:	4618      	mov	r0, r3
    1024:	4611      	mov	r1, r2
    1026:	df01      	svc	1
	flush_rx_queue();
    1028:	f000 fa56 	bl	14d8 <flush_rx_queue>
	unsigned llen;// char c;
	char c;
	int i;
	gdi_clear_screen();
    102c:	f000 fb3e 	bl	16ac <gdi_clear_screen>
	for (i=0;i<128;i++){
    1030:	2300      	movs	r3, #0
    1032:	607b      	str	r3, [r7, #4]
    1034:	e007      	b.n	1046 <main+0xca>
		gdi_putc((unsigned char)i);
    1036:	687b      	ldr	r3, [r7, #4]
    1038:	b2db      	uxtb	r3, r3
    103a:	4618      	mov	r0, r3
    103c:	f000 fc12 	bl	1864 <gdi_putc>
	flush_rx_queue();
	unsigned llen;// char c;
	char c;
	int i;
	gdi_clear_screen();
	for (i=0;i<128;i++){
    1040:	687b      	ldr	r3, [r7, #4]
    1042:	3301      	adds	r3, #1
    1044:	607b      	str	r3, [r7, #4]
    1046:	687b      	ldr	r3, [r7, #4]
    1048:	2b7f      	cmp	r3, #127	; 0x7f
    104a:	ddf4      	ble.n	1036 <main+0xba>
		gdi_putc((unsigned char)i);
	}
	while (1){ // if ((c=conin())) conout(c);
		llen=read_line(tib,CMD_MAX_LEN);
    104c:	480b      	ldr	r0, [pc, #44]	; (107c <main+0x100>)
    104e:	2150      	movs	r1, #80	; 0x50
    1050:	f000 f8c8 	bl	11e4 <read_line>
    1054:	6038      	str	r0, [r7, #0]
		parse_line(llen);
    1056:	6838      	ldr	r0, [r7, #0]
    1058:	f7ff ff3a 	bl	ed0 <parse_line>
	}
    105c:	e7f6      	b.n	104c <main+0xd0>
    105e:	bf00      	nop
    1060:	40021018 	.word	0x40021018
    1064:	4002101c 	.word	0x4002101c
    1068:	40021000 	.word	0x40021000
    106c:	40004400 	.word	0x40004400
    1070:	20000000 	.word	0x20000000
    1074:	000027ac 	.word	0x000027ac
    1078:	20000118 	.word	0x20000118
    107c:	20000010 	.word	0x20000010

00001080 <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
    1080:	4668      	mov	r0, sp
    1082:	f020 0107 	bic.w	r1, r0, #7
    1086:	468d      	mov	sp, r1
    1088:	b481      	push	{r0, r7}
    108a:	af00      	add	r7, sp, #0
	if (USART2_SR&(1<<USART_SR_RXNE)){
    108c:	4b0e      	ldr	r3, [pc, #56]	; (10c8 <USART2_handler+0x48>)
    108e:	681b      	ldr	r3, [r3, #0]
    1090:	f003 0320 	and.w	r3, r3, #32
    1094:	2b00      	cmp	r3, #0
    1096:	d012      	beq.n	10be <USART2_handler+0x3e>
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
    1098:	4b0c      	ldr	r3, [pc, #48]	; (10cc <USART2_handler+0x4c>)
    109a:	6a1b      	ldr	r3, [r3, #32]
    109c:	1c5a      	adds	r2, r3, #1
    109e:	490b      	ldr	r1, [pc, #44]	; (10cc <USART2_handler+0x4c>)
    10a0:	620a      	str	r2, [r1, #32]
    10a2:	4a0b      	ldr	r2, [pc, #44]	; (10d0 <USART2_handler+0x50>)
    10a4:	6812      	ldr	r2, [r2, #0]
    10a6:	b2d2      	uxtb	r2, r2
    10a8:	f002 027f 	and.w	r2, r2, #127	; 0x7f
    10ac:	b2d1      	uxtb	r1, r2
    10ae:	4a07      	ldr	r2, [pc, #28]	; (10cc <USART2_handler+0x4c>)
    10b0:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
    10b2:	4b06      	ldr	r3, [pc, #24]	; (10cc <USART2_handler+0x4c>)
    10b4:	6a1b      	ldr	r3, [r3, #32]
    10b6:	f003 031f 	and.w	r3, r3, #31
    10ba:	4a04      	ldr	r2, [pc, #16]	; (10cc <USART2_handler+0x4c>)
    10bc:	6213      	str	r3, [r2, #32]
	}
}
    10be:	46bd      	mov	sp, r7
    10c0:	bc81      	pop	{r0, r7}
    10c2:	4685      	mov	sp, r0
    10c4:	4770      	bx	lr
    10c6:	bf00      	nop
    10c8:	40004400 	.word	0x40004400
    10cc:	200000b4 	.word	0x200000b4
    10d0:	40004404 	.word	0x40004404

000010d4 <conout>:


// envoie d'un caractère à la console
void conout(char c){
    10d4:	b580      	push	{r7, lr}
    10d6:	b082      	sub	sp, #8
    10d8:	af00      	add	r7, sp, #0
    10da:	4603      	mov	r3, r0
    10dc:	71fb      	strb	r3, [r7, #7]
	uart_putc(CON,c);
    10de:	79fb      	ldrb	r3, [r7, #7]
    10e0:	4803      	ldr	r0, [pc, #12]	; (10f0 <conout+0x1c>)
    10e2:	4619      	mov	r1, r3
    10e4:	f001 fa8c 	bl	2600 <uart_putc>
}
    10e8:	3708      	adds	r7, #8
    10ea:	46bd      	mov	sp, r7
    10ec:	bd80      	pop	{r7, pc}
    10ee:	bf00      	nop
    10f0:	40004400 	.word	0x40004400

000010f4 <conin>:


// réception d'un caractère de la console
char conin(){
    10f4:	b480      	push	{r7}
    10f6:	b083      	sub	sp, #12
    10f8:	af00      	add	r7, sp, #0
	char c=0;
    10fa:	2300      	movs	r3, #0
    10fc:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
    10fe:	4b0d      	ldr	r3, [pc, #52]	; (1134 <conin+0x40>)
    1100:	6a1a      	ldr	r2, [r3, #32]
    1102:	4b0c      	ldr	r3, [pc, #48]	; (1134 <conin+0x40>)
    1104:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1106:	429a      	cmp	r2, r3
    1108:	d00d      	beq.n	1126 <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
    110a:	4b0a      	ldr	r3, [pc, #40]	; (1134 <conin+0x40>)
    110c:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    110e:	1c5a      	adds	r2, r3, #1
    1110:	4908      	ldr	r1, [pc, #32]	; (1134 <conin+0x40>)
    1112:	624a      	str	r2, [r1, #36]	; 0x24
    1114:	4a07      	ldr	r2, [pc, #28]	; (1134 <conin+0x40>)
    1116:	5cd3      	ldrb	r3, [r2, r3]
    1118:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
    111a:	4b06      	ldr	r3, [pc, #24]	; (1134 <conin+0x40>)
    111c:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    111e:	f003 031f 	and.w	r3, r3, #31
    1122:	4a04      	ldr	r2, [pc, #16]	; (1134 <conin+0x40>)
    1124:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
    1126:	79fb      	ldrb	r3, [r7, #7]
}
    1128:	4618      	mov	r0, r3
    112a:	370c      	adds	r7, #12
    112c:	46bd      	mov	sp, r7
    112e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1132:	4770      	bx	lr
    1134:	200000b4 	.word	0x200000b4

00001138 <print>:

// imprime un chaîne sur la console
void print(const char *str){
    1138:	b580      	push	{r7, lr}
    113a:	b082      	sub	sp, #8
    113c:	af00      	add	r7, sp, #0
    113e:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
    1140:	e006      	b.n	1150 <print+0x18>
    1142:	687b      	ldr	r3, [r7, #4]
    1144:	1c5a      	adds	r2, r3, #1
    1146:	607a      	str	r2, [r7, #4]
    1148:	781b      	ldrb	r3, [r3, #0]
    114a:	4618      	mov	r0, r3
    114c:	f7ff ffc2 	bl	10d4 <conout>
    1150:	687b      	ldr	r3, [r7, #4]
    1152:	781b      	ldrb	r3, [r3, #0]
    1154:	2b00      	cmp	r3, #0
    1156:	d1f4      	bne.n	1142 <print+0xa>
}
    1158:	3708      	adds	r7, #8
    115a:	46bd      	mov	sp, r7
    115c:	bd80      	pop	{r7, pc}
    115e:	bf00      	nop

00001160 <beep>:

void beep(){
    1160:	b480      	push	{r7}
    1162:	af00      	add	r7, sp, #0
}
    1164:	46bd      	mov	sp, r7
    1166:	f85d 7b04 	ldr.w	r7, [sp], #4
    116a:	4770      	bx	lr

0000116c <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    116c:	b580      	push	{r7, lr}
    116e:	af00      	add	r7, sp, #0
	conout(BS);
    1170:	2008      	movs	r0, #8
    1172:	f7ff ffaf 	bl	10d4 <conout>
	conout(SPACE);
    1176:	2020      	movs	r0, #32
    1178:	f7ff ffac 	bl	10d4 <conout>
	conout(BS);
    117c:	2008      	movs	r0, #8
    117e:	f7ff ffa9 	bl	10d4 <conout>
}
    1182:	bd80      	pop	{r7, pc}

00001184 <esc_seq>:

void esc_seq(){
    1184:	b580      	push	{r7, lr}
    1186:	af00      	add	r7, sp, #0
	conout(ESC);
    1188:	201b      	movs	r0, #27
    118a:	f7ff ffa3 	bl	10d4 <conout>
	conout('[');
    118e:	205b      	movs	r0, #91	; 0x5b
    1190:	f7ff ffa0 	bl	10d4 <conout>
}
    1194:	bd80      	pop	{r7, pc}
    1196:	bf00      	nop

00001198 <cls>:

// vide l'écran de la console
void cls(){
    1198:	b580      	push	{r7, lr}
    119a:	af00      	add	r7, sp, #0
	esc_seq();
    119c:	f7ff fff2 	bl	1184 <esc_seq>
	conout('2');
    11a0:	2032      	movs	r0, #50	; 0x32
    11a2:	f7ff ff97 	bl	10d4 <conout>
	conout('J');
    11a6:	204a      	movs	r0, #74	; 0x4a
    11a8:	f7ff ff94 	bl	10d4 <conout>
}
    11ac:	bd80      	pop	{r7, pc}
    11ae:	bf00      	nop

000011b0 <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
    11b0:	b580      	push	{r7, lr}
    11b2:	b082      	sub	sp, #8
    11b4:	af00      	add	r7, sp, #0
    11b6:	6078      	str	r0, [r7, #4]
	esc_seq();
    11b8:	f7ff ffe4 	bl	1184 <esc_seq>
	conout('2');
    11bc:	2032      	movs	r0, #50	; 0x32
    11be:	f7ff ff89 	bl	10d4 <conout>
	conout('K');
    11c2:	204b      	movs	r0, #75	; 0x4b
    11c4:	f7ff ff86 	bl	10d4 <conout>
	while (n){conout(BS);n--;}
    11c8:	e005      	b.n	11d6 <clear_line+0x26>
    11ca:	2008      	movs	r0, #8
    11cc:	f7ff ff82 	bl	10d4 <conout>
    11d0:	687b      	ldr	r3, [r7, #4]
    11d2:	3b01      	subs	r3, #1
    11d4:	607b      	str	r3, [r7, #4]
    11d6:	687b      	ldr	r3, [r7, #4]
    11d8:	2b00      	cmp	r3, #0
    11da:	d1f6      	bne.n	11ca <clear_line+0x1a>
}
    11dc:	3708      	adds	r7, #8
    11de:	46bd      	mov	sp, r7
    11e0:	bd80      	pop	{r7, pc}
    11e2:	bf00      	nop

000011e4 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    11e4:	b580      	push	{r7, lr}
    11e6:	b084      	sub	sp, #16
    11e8:	af00      	add	r7, sp, #0
    11ea:	6078      	str	r0, [r7, #4]
    11ec:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    11ee:	2300      	movs	r3, #0
    11f0:	60fb      	str	r3, [r7, #12]
	char c=0;
    11f2:	2300      	movs	r3, #0
    11f4:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    11f6:	683b      	ldr	r3, [r7, #0]
    11f8:	3b01      	subs	r3, #1
    11fa:	603b      	str	r3, [r7, #0]
	while (c!=13){
    11fc:	e08e      	b.n	131c <read_line+0x138>
			c=conin();
    11fe:	f7ff ff79 	bl	10f4 <conin>
    1202:	4603      	mov	r3, r0
    1204:	72fb      	strb	r3, [r7, #11]
			switch(c){
    1206:	7afb      	ldrb	r3, [r7, #11]
    1208:	2b18      	cmp	r3, #24
    120a:	d872      	bhi.n	12f2 <read_line+0x10e>
    120c:	a201      	add	r2, pc, #4	; (adr r2, 1214 <read_line+0x30>)
    120e:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1212:	bf00      	nop
    1214:	0000131d 	.word	0x0000131d
    1218:	000012f3 	.word	0x000012f3
    121c:	000012f3 	.word	0x000012f3
    1220:	000012f3 	.word	0x000012f3
    1224:	000012f3 	.word	0x000012f3
    1228:	000012e5 	.word	0x000012e5
    122c:	000012f3 	.word	0x000012f3
    1230:	000012f3 	.word	0x000012f3
    1234:	000012d3 	.word	0x000012d3
    1238:	000012ef 	.word	0x000012ef
    123c:	00001279 	.word	0x00001279
    1240:	000012f3 	.word	0x000012f3
    1244:	000012f3 	.word	0x000012f3
    1248:	00001279 	.word	0x00001279
    124c:	000012f3 	.word	0x000012f3
    1250:	000012f3 	.word	0x000012f3
    1254:	000012f3 	.word	0x000012f3
    1258:	000012f3 	.word	0x000012f3
    125c:	000012f3 	.word	0x000012f3
    1260:	000012f3 	.word	0x000012f3
    1264:	000012f3 	.word	0x000012f3
    1268:	00001287 	.word	0x00001287
    126c:	000012f3 	.word	0x000012f3
    1270:	0000129d 	.word	0x0000129d
    1274:	00001287 	.word	0x00001287
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    1278:	230d      	movs	r3, #13
    127a:	72fb      	strb	r3, [r7, #11]
				conout(c);
    127c:	7afb      	ldrb	r3, [r7, #11]
    127e:	4618      	mov	r0, r3
    1280:	f7ff ff28 	bl	10d4 <conout>
				break;
    1284:	e04a      	b.n	131c <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
    1286:	68f8      	ldr	r0, [r7, #12]
    1288:	f7ff ff92 	bl	11b0 <clear_line>
				line_len=0;
    128c:	2300      	movs	r3, #0
    128e:	60fb      	str	r3, [r7, #12]
				break;
    1290:	e044      	b.n	131c <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    1292:	f7ff ff6b 	bl	116c <delete_back>
					line_len--;
    1296:	68fb      	ldr	r3, [r7, #12]
    1298:	3b01      	subs	r3, #1
    129a:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    129c:	68fb      	ldr	r3, [r7, #12]
    129e:	2b00      	cmp	r3, #0
    12a0:	d006      	beq.n	12b0 <read_line+0xcc>
    12a2:	68fb      	ldr	r3, [r7, #12]
    12a4:	3b01      	subs	r3, #1
    12a6:	687a      	ldr	r2, [r7, #4]
    12a8:	4413      	add	r3, r2
    12aa:	781b      	ldrb	r3, [r3, #0]
    12ac:	2b20      	cmp	r3, #32
    12ae:	d0f0      	beq.n	1292 <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    12b0:	e004      	b.n	12bc <read_line+0xd8>
					delete_back();
    12b2:	f7ff ff5b 	bl	116c <delete_back>
					line_len--;
    12b6:	68fb      	ldr	r3, [r7, #12]
    12b8:	3b01      	subs	r3, #1
    12ba:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    12bc:	68fb      	ldr	r3, [r7, #12]
    12be:	2b00      	cmp	r3, #0
    12c0:	d006      	beq.n	12d0 <read_line+0xec>
    12c2:	68fb      	ldr	r3, [r7, #12]
    12c4:	3b01      	subs	r3, #1
    12c6:	687a      	ldr	r2, [r7, #4]
    12c8:	4413      	add	r3, r2
    12ca:	781b      	ldrb	r3, [r3, #0]
    12cc:	2b20      	cmp	r3, #32
    12ce:	d1f0      	bne.n	12b2 <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    12d0:	e024      	b.n	131c <read_line+0x138>
				case BS:
				if (line_len){
    12d2:	68fb      	ldr	r3, [r7, #12]
    12d4:	2b00      	cmp	r3, #0
    12d6:	d004      	beq.n	12e2 <read_line+0xfe>
					delete_back();
    12d8:	f7ff ff48 	bl	116c <delete_back>
					line_len--;
    12dc:	68fb      	ldr	r3, [r7, #12]
    12de:	3b01      	subs	r3, #1
    12e0:	60fb      	str	r3, [r7, #12]
				}
				break;
    12e2:	e01b      	b.n	131c <read_line+0x138>
				case CTRL_E:
				cls();
    12e4:	f7ff ff58 	bl	1198 <cls>
				line_len=0;
    12e8:	2300      	movs	r3, #0
    12ea:	60fb      	str	r3, [r7, #12]
				break;
    12ec:	e016      	b.n	131c <read_line+0x138>
				case TAB:
				c=SPACE;
    12ee:	2320      	movs	r3, #32
    12f0:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    12f2:	68fa      	ldr	r2, [r7, #12]
    12f4:	683b      	ldr	r3, [r7, #0]
    12f6:	429a      	cmp	r2, r3
    12f8:	d20e      	bcs.n	1318 <read_line+0x134>
    12fa:	7afb      	ldrb	r3, [r7, #11]
    12fc:	2b1f      	cmp	r3, #31
    12fe:	d90b      	bls.n	1318 <read_line+0x134>
					buffer[line_len++]=c;
    1300:	68fb      	ldr	r3, [r7, #12]
    1302:	1c5a      	adds	r2, r3, #1
    1304:	60fa      	str	r2, [r7, #12]
    1306:	687a      	ldr	r2, [r7, #4]
    1308:	4413      	add	r3, r2
    130a:	7afa      	ldrb	r2, [r7, #11]
    130c:	701a      	strb	r2, [r3, #0]
					conout(c);
    130e:	7afb      	ldrb	r3, [r7, #11]
    1310:	4618      	mov	r0, r3
    1312:	f7ff fedf 	bl	10d4 <conout>
    1316:	e001      	b.n	131c <read_line+0x138>
				}else{
					beep();
    1318:	f7ff ff22 	bl	1160 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    131c:	7afb      	ldrb	r3, [r7, #11]
    131e:	2b0d      	cmp	r3, #13
    1320:	f47f af6d 	bne.w	11fe <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1324:	687a      	ldr	r2, [r7, #4]
    1326:	68fb      	ldr	r3, [r7, #12]
    1328:	4413      	add	r3, r2
    132a:	2200      	movs	r2, #0
    132c:	701a      	strb	r2, [r3, #0]
	return line_len;
    132e:	68fb      	ldr	r3, [r7, #12]
}
    1330:	4618      	mov	r0, r3
    1332:	3710      	adds	r7, #16
    1334:	46bd      	mov	sp, r7
    1336:	bd80      	pop	{r7, pc}

00001338 <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    1338:	b580      	push	{r7, lr}
    133a:	b08e      	sub	sp, #56	; 0x38
    133c:	af00      	add	r7, sp, #0
    133e:	6078      	str	r0, [r7, #4]
    1340:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    1342:	2301      	movs	r3, #1
    1344:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    1346:	2322      	movs	r3, #34	; 0x22
    1348:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    134a:	2300      	movs	r3, #0
    134c:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1350:	687b      	ldr	r3, [r7, #4]
    1352:	2b00      	cmp	r3, #0
    1354:	da05      	bge.n	1362 <print_int+0x2a>
    1356:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    135a:	637b      	str	r3, [r7, #52]	; 0x34
    135c:	687b      	ldr	r3, [r7, #4]
    135e:	425b      	negs	r3, r3
    1360:	607b      	str	r3, [r7, #4]
	while (i){
    1362:	e02c      	b.n	13be <print_int+0x86>
		fmt[pos]=i%base+'0';
    1364:	687b      	ldr	r3, [r7, #4]
    1366:	683a      	ldr	r2, [r7, #0]
    1368:	fbb3 f2f2 	udiv	r2, r3, r2
    136c:	6839      	ldr	r1, [r7, #0]
    136e:	fb01 f202 	mul.w	r2, r1, r2
    1372:	1a9b      	subs	r3, r3, r2
    1374:	b2db      	uxtb	r3, r3
    1376:	3330      	adds	r3, #48	; 0x30
    1378:	b2d9      	uxtb	r1, r3
    137a:	f107 020c 	add.w	r2, r7, #12
    137e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1380:	4413      	add	r3, r2
    1382:	460a      	mov	r2, r1
    1384:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    1386:	f107 020c 	add.w	r2, r7, #12
    138a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    138c:	4413      	add	r3, r2
    138e:	781b      	ldrb	r3, [r3, #0]
    1390:	2b39      	cmp	r3, #57	; 0x39
    1392:	d90c      	bls.n	13ae <print_int+0x76>
    1394:	f107 020c 	add.w	r2, r7, #12
    1398:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    139a:	4413      	add	r3, r2
    139c:	781b      	ldrb	r3, [r3, #0]
    139e:	3307      	adds	r3, #7
    13a0:	b2d9      	uxtb	r1, r3
    13a2:	f107 020c 	add.w	r2, r7, #12
    13a6:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13a8:	4413      	add	r3, r2
    13aa:	460a      	mov	r2, r1
    13ac:	701a      	strb	r2, [r3, #0]
		pos--;
    13ae:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13b0:	3b01      	subs	r3, #1
    13b2:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    13b4:	687a      	ldr	r2, [r7, #4]
    13b6:	683b      	ldr	r3, [r7, #0]
    13b8:	fbb2 f3f3 	udiv	r3, r2, r3
    13bc:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    13be:	687b      	ldr	r3, [r7, #4]
    13c0:	2b00      	cmp	r3, #0
    13c2:	d1cf      	bne.n	1364 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    13c4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13c6:	2b22      	cmp	r3, #34	; 0x22
    13c8:	d108      	bne.n	13dc <print_int+0xa4>
    13ca:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13cc:	1e5a      	subs	r2, r3, #1
    13ce:	633a      	str	r2, [r7, #48]	; 0x30
    13d0:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13d4:	4413      	add	r3, r2
    13d6:	2230      	movs	r2, #48	; 0x30
    13d8:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    13dc:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    13de:	2b00      	cmp	r3, #0
    13e0:	da08      	bge.n	13f4 <print_int+0xbc>
    13e2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13e4:	1e5a      	subs	r2, r3, #1
    13e6:	633a      	str	r2, [r7, #48]	; 0x30
    13e8:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13ec:	4413      	add	r3, r2
    13ee:	222d      	movs	r2, #45	; 0x2d
    13f0:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    13f4:	f107 020c 	add.w	r2, r7, #12
    13f8:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13fa:	4413      	add	r3, r2
    13fc:	2220      	movs	r2, #32
    13fe:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1400:	f107 020c 	add.w	r2, r7, #12
    1404:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1406:	4413      	add	r3, r2
    1408:	4618      	mov	r0, r3
    140a:	f7ff fe95 	bl	1138 <print>
}
    140e:	3738      	adds	r7, #56	; 0x38
    1410:	46bd      	mov	sp, r7
    1412:	bd80      	pop	{r7, pc}

00001414 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    1414:	b580      	push	{r7, lr}
    1416:	b088      	sub	sp, #32
    1418:	af00      	add	r7, sp, #0
    141a:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    141c:	230c      	movs	r3, #12
    141e:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    1420:	2300      	movs	r3, #0
    1422:	767b      	strb	r3, [r7, #25]
	while (u){
    1424:	e026      	b.n	1474 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    1426:	687b      	ldr	r3, [r7, #4]
    1428:	b2db      	uxtb	r3, r3
    142a:	f003 030f 	and.w	r3, r3, #15
    142e:	b2db      	uxtb	r3, r3
    1430:	3330      	adds	r3, #48	; 0x30
    1432:	b2d9      	uxtb	r1, r3
    1434:	f107 020c 	add.w	r2, r7, #12
    1438:	69fb      	ldr	r3, [r7, #28]
    143a:	4413      	add	r3, r2
    143c:	460a      	mov	r2, r1
    143e:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1440:	f107 020c 	add.w	r2, r7, #12
    1444:	69fb      	ldr	r3, [r7, #28]
    1446:	4413      	add	r3, r2
    1448:	781b      	ldrb	r3, [r3, #0]
    144a:	2b39      	cmp	r3, #57	; 0x39
    144c:	d90c      	bls.n	1468 <print_hex+0x54>
    144e:	f107 020c 	add.w	r2, r7, #12
    1452:	69fb      	ldr	r3, [r7, #28]
    1454:	4413      	add	r3, r2
    1456:	781b      	ldrb	r3, [r3, #0]
    1458:	3307      	adds	r3, #7
    145a:	b2d9      	uxtb	r1, r3
    145c:	f107 020c 	add.w	r2, r7, #12
    1460:	69fb      	ldr	r3, [r7, #28]
    1462:	4413      	add	r3, r2
    1464:	460a      	mov	r2, r1
    1466:	701a      	strb	r2, [r3, #0]
		pos--;
    1468:	69fb      	ldr	r3, [r7, #28]
    146a:	3b01      	subs	r3, #1
    146c:	61fb      	str	r3, [r7, #28]
		u/=16;
    146e:	687b      	ldr	r3, [r7, #4]
    1470:	091b      	lsrs	r3, r3, #4
    1472:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    1474:	687b      	ldr	r3, [r7, #4]
    1476:	2b00      	cmp	r3, #0
    1478:	d1d5      	bne.n	1426 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    147a:	69fb      	ldr	r3, [r7, #28]
    147c:	2b0c      	cmp	r3, #12
    147e:	d108      	bne.n	1492 <print_hex+0x7e>
    1480:	69fb      	ldr	r3, [r7, #28]
    1482:	1e5a      	subs	r2, r3, #1
    1484:	61fa      	str	r2, [r7, #28]
    1486:	f107 0220 	add.w	r2, r7, #32
    148a:	4413      	add	r3, r2
    148c:	2230      	movs	r2, #48	; 0x30
    148e:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    1492:	69fb      	ldr	r3, [r7, #28]
    1494:	1e5a      	subs	r2, r3, #1
    1496:	61fa      	str	r2, [r7, #28]
    1498:	f107 0220 	add.w	r2, r7, #32
    149c:	4413      	add	r3, r2
    149e:	2278      	movs	r2, #120	; 0x78
    14a0:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    14a4:	69fb      	ldr	r3, [r7, #28]
    14a6:	1e5a      	subs	r2, r3, #1
    14a8:	61fa      	str	r2, [r7, #28]
    14aa:	f107 0220 	add.w	r2, r7, #32
    14ae:	4413      	add	r3, r2
    14b0:	2230      	movs	r2, #48	; 0x30
    14b2:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    14b6:	f107 020c 	add.w	r2, r7, #12
    14ba:	69fb      	ldr	r3, [r7, #28]
    14bc:	4413      	add	r3, r2
    14be:	2220      	movs	r2, #32
    14c0:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    14c2:	f107 020c 	add.w	r2, r7, #12
    14c6:	69fb      	ldr	r3, [r7, #28]
    14c8:	4413      	add	r3, r2
    14ca:	4618      	mov	r0, r3
    14cc:	f7ff fe34 	bl	1138 <print>
}
    14d0:	3720      	adds	r7, #32
    14d2:	46bd      	mov	sp, r7
    14d4:	bd80      	pop	{r7, pc}
    14d6:	bf00      	nop

000014d8 <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    14d8:	b480      	push	{r7}
    14da:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    14dc:	4b04      	ldr	r3, [pc, #16]	; (14f0 <flush_rx_queue+0x18>)
    14de:	2200      	movs	r2, #0
    14e0:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    14e2:	4b03      	ldr	r3, [pc, #12]	; (14f0 <flush_rx_queue+0x18>)
    14e4:	2200      	movs	r2, #0
    14e6:	625a      	str	r2, [r3, #36]	; 0x24
}
    14e8:	46bd      	mov	sp, r7
    14ea:	f85d 7b04 	ldr.w	r7, [sp], #4
    14ee:	4770      	bx	lr
    14f0:	200000b4 	.word	0x200000b4

000014f4 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    14f4:	b480      	push	{r7}
    14f6:	af00      	add	r7, sp, #0
	if (!RCC_CR->fld.hsion){ // activation clock HSI
    14f8:	4b14      	ldr	r3, [pc, #80]	; (154c <flash_enable+0x58>)
    14fa:	681b      	ldr	r3, [r3, #0]
    14fc:	f003 0301 	and.w	r3, r3, #1
    1500:	b2db      	uxtb	r3, r3
    1502:	2b00      	cmp	r3, #0
    1504:	d10d      	bne.n	1522 <flash_enable+0x2e>
		RCC_CR->fld.hsion=1;
    1506:	4b11      	ldr	r3, [pc, #68]	; (154c <flash_enable+0x58>)
    1508:	681a      	ldr	r2, [r3, #0]
    150a:	f042 0201 	orr.w	r2, r2, #1
    150e:	601a      	str	r2, [r3, #0]
		while (!RCC_CR->fld.hsirdy);
    1510:	bf00      	nop
    1512:	4b0e      	ldr	r3, [pc, #56]	; (154c <flash_enable+0x58>)
    1514:	681b      	ldr	r3, [r3, #0]
    1516:	085b      	lsrs	r3, r3, #1
    1518:	f003 0301 	and.w	r3, r3, #1
    151c:	b2db      	uxtb	r3, r3
    151e:	2b00      	cmp	r3, #0
    1520:	d0f7      	beq.n	1512 <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    1522:	4b0b      	ldr	r3, [pc, #44]	; (1550 <flash_enable+0x5c>)
    1524:	4a0b      	ldr	r2, [pc, #44]	; (1554 <flash_enable+0x60>)
    1526:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    1528:	4b09      	ldr	r3, [pc, #36]	; (1550 <flash_enable+0x5c>)
    152a:	4a0b      	ldr	r2, [pc, #44]	; (1558 <flash_enable+0x64>)
    152c:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    152e:	4b08      	ldr	r3, [pc, #32]	; (1550 <flash_enable+0x5c>)
    1530:	691b      	ldr	r3, [r3, #16]
    1532:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1536:	2b00      	cmp	r3, #0
    1538:	bf0c      	ite	eq
    153a:	2301      	moveq	r3, #1
    153c:	2300      	movne	r3, #0
    153e:	b2db      	uxtb	r3, r3
}
    1540:	4618      	mov	r0, r3
    1542:	46bd      	mov	sp, r7
    1544:	f85d 7b04 	ldr.w	r7, [sp], #4
    1548:	4770      	bx	lr
    154a:	bf00      	nop
    154c:	40021000 	.word	0x40021000
    1550:	40022000 	.word	0x40022000
    1554:	45670123 	.word	0x45670123
    1558:	cdef89ab 	.word	0xcdef89ab

0000155c <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    155c:	b480      	push	{r7}
    155e:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    1560:	4a04      	ldr	r2, [pc, #16]	; (1574 <flash_disable+0x18>)
    1562:	4b04      	ldr	r3, [pc, #16]	; (1574 <flash_disable+0x18>)
    1564:	691b      	ldr	r3, [r3, #16]
    1566:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    156a:	6113      	str	r3, [r2, #16]
}
    156c:	46bd      	mov	sp, r7
    156e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1572:	4770      	bx	lr
    1574:	40022000 	.word	0x40022000

00001578 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1578:	b480      	push	{r7}
    157a:	b083      	sub	sp, #12
    157c:	af00      	add	r7, sp, #0
    157e:	6078      	str	r0, [r7, #4]
    1580:	460b      	mov	r3, r1
    1582:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    1584:	4b1d      	ldr	r3, [pc, #116]	; (15fc <flash_write+0x84>)
    1586:	691b      	ldr	r3, [r3, #16]
    1588:	f003 0380 	and.w	r3, r3, #128	; 0x80
    158c:	2b00      	cmp	r3, #0
    158e:	d105      	bne.n	159c <flash_write+0x24>
    1590:	687b      	ldr	r3, [r7, #4]
    1592:	881b      	ldrh	r3, [r3, #0]
    1594:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1598:	4293      	cmp	r3, r2
    159a:	d001      	beq.n	15a0 <flash_write+0x28>
    159c:	2300      	movs	r3, #0
    159e:	e027      	b.n	15f0 <flash_write+0x78>
	while (_flash_busy);
    15a0:	bf00      	nop
    15a2:	4b16      	ldr	r3, [pc, #88]	; (15fc <flash_write+0x84>)
    15a4:	68db      	ldr	r3, [r3, #12]
    15a6:	f003 0301 	and.w	r3, r3, #1
    15aa:	2b00      	cmp	r3, #0
    15ac:	d1f9      	bne.n	15a2 <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    15ae:	4a13      	ldr	r2, [pc, #76]	; (15fc <flash_write+0x84>)
    15b0:	4b12      	ldr	r3, [pc, #72]	; (15fc <flash_write+0x84>)
    15b2:	68db      	ldr	r3, [r3, #12]
    15b4:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    15b8:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    15ba:	4b10      	ldr	r3, [pc, #64]	; (15fc <flash_write+0x84>)
    15bc:	2201      	movs	r2, #1
    15be:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    15c0:	687b      	ldr	r3, [r7, #4]
    15c2:	887a      	ldrh	r2, [r7, #2]
    15c4:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    15c6:	bf00      	nop
    15c8:	4b0c      	ldr	r3, [pc, #48]	; (15fc <flash_write+0x84>)
    15ca:	68db      	ldr	r3, [r3, #12]
    15cc:	f003 0301 	and.w	r3, r3, #1
    15d0:	2b00      	cmp	r3, #0
    15d2:	d005      	beq.n	15e0 <flash_write+0x68>
    15d4:	4b09      	ldr	r3, [pc, #36]	; (15fc <flash_write+0x84>)
    15d6:	68db      	ldr	r3, [r3, #12]
    15d8:	f003 0320 	and.w	r3, r3, #32
    15dc:	2b00      	cmp	r3, #0
    15de:	d0f3      	beq.n	15c8 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    15e0:	687b      	ldr	r3, [r7, #4]
    15e2:	881b      	ldrh	r3, [r3, #0]
    15e4:	887a      	ldrh	r2, [r7, #2]
    15e6:	429a      	cmp	r2, r3
    15e8:	bf0c      	ite	eq
    15ea:	2301      	moveq	r3, #1
    15ec:	2300      	movne	r3, #0
    15ee:	b2db      	uxtb	r3, r3
}
    15f0:	4618      	mov	r0, r3
    15f2:	370c      	adds	r7, #12
    15f4:	46bd      	mov	sp, r7
    15f6:	f85d 7b04 	ldr.w	r7, [sp], #4
    15fa:	4770      	bx	lr
    15fc:	40022000 	.word	0x40022000

00001600 <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    1600:	b480      	push	{r7}
    1602:	b087      	sub	sp, #28
    1604:	af00      	add	r7, sp, #0
    1606:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    1608:	4b27      	ldr	r3, [pc, #156]	; (16a8 <flash_erase_page+0xa8>)
    160a:	691b      	ldr	r3, [r3, #16]
    160c:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1610:	2b00      	cmp	r3, #0
    1612:	d001      	beq.n	1618 <flash_erase_page+0x18>
    1614:	2300      	movs	r3, #0
    1616:	e040      	b.n	169a <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1618:	4a23      	ldr	r2, [pc, #140]	; (16a8 <flash_erase_page+0xa8>)
    161a:	4b23      	ldr	r3, [pc, #140]	; (16a8 <flash_erase_page+0xa8>)
    161c:	68db      	ldr	r3, [r3, #12]
    161e:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1622:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    1624:	687b      	ldr	r3, [r7, #4]
    1626:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    162a:	f023 0303 	bic.w	r3, r3, #3
    162e:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    1630:	4b1d      	ldr	r3, [pc, #116]	; (16a8 <flash_erase_page+0xa8>)
    1632:	2202      	movs	r2, #2
    1634:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    1636:	4a1c      	ldr	r2, [pc, #112]	; (16a8 <flash_erase_page+0xa8>)
    1638:	687b      	ldr	r3, [r7, #4]
    163a:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    163c:	4a1a      	ldr	r2, [pc, #104]	; (16a8 <flash_erase_page+0xa8>)
    163e:	4b1a      	ldr	r3, [pc, #104]	; (16a8 <flash_erase_page+0xa8>)
    1640:	691b      	ldr	r3, [r3, #16]
    1642:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1646:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    1648:	bf00      	nop
    164a:	4b17      	ldr	r3, [pc, #92]	; (16a8 <flash_erase_page+0xa8>)
    164c:	68db      	ldr	r3, [r3, #12]
    164e:	f003 0301 	and.w	r3, r3, #1
    1652:	2b00      	cmp	r3, #0
    1654:	d005      	beq.n	1662 <flash_erase_page+0x62>
    1656:	4b14      	ldr	r3, [pc, #80]	; (16a8 <flash_erase_page+0xa8>)
    1658:	68db      	ldr	r3, [r3, #12]
    165a:	f003 0320 	and.w	r3, r3, #32
    165e:	2b00      	cmp	r3, #0
    1660:	d0f3      	beq.n	164a <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    1662:	687b      	ldr	r3, [r7, #4]
    1664:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    1666:	2300      	movs	r3, #0
    1668:	60fb      	str	r3, [r7, #12]
    166a:	e00c      	b.n	1686 <flash_erase_page+0x86>
		u32=*adr++;
    166c:	697b      	ldr	r3, [r7, #20]
    166e:	1d1a      	adds	r2, r3, #4
    1670:	617a      	str	r2, [r7, #20]
    1672:	681b      	ldr	r3, [r3, #0]
    1674:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    1676:	693b      	ldr	r3, [r7, #16]
    1678:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    167c:	d000      	beq.n	1680 <flash_erase_page+0x80>
    167e:	e005      	b.n	168c <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    1680:	68fb      	ldr	r3, [r7, #12]
    1682:	3301      	adds	r3, #1
    1684:	60fb      	str	r3, [r7, #12]
    1686:	68fb      	ldr	r3, [r7, #12]
    1688:	2bff      	cmp	r3, #255	; 0xff
    168a:	ddef      	ble.n	166c <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    168c:	693b      	ldr	r3, [r7, #16]
    168e:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1692:	bf0c      	ite	eq
    1694:	2301      	moveq	r3, #1
    1696:	2300      	movne	r3, #0
    1698:	b2db      	uxtb	r3, r3
}
    169a:	4618      	mov	r0, r3
    169c:	371c      	adds	r7, #28
    169e:	46bd      	mov	sp, r7
    16a0:	f85d 7b04 	ldr.w	r7, [sp], #4
    16a4:	4770      	bx	lr
    16a6:	bf00      	nop
    16a8:	40022000 	.word	0x40022000

000016ac <gdi_clear_screen>:
#include "gdi.h"

// position  du curseur texte.
static int cursor_x, cursor_y;

void gdi_clear_screen(){
    16ac:	b480      	push	{r7}
    16ae:	b083      	sub	sp, #12
    16b0:	af00      	add	r7, sp, #0
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    16b2:	2300      	movs	r3, #0
    16b4:	607b      	str	r3, [r7, #4]
    16b6:	e006      	b.n	16c6 <gdi_clear_screen+0x1a>
		video_buffer[i++]=0;
    16b8:	687b      	ldr	r3, [r7, #4]
    16ba:	1c5a      	adds	r2, r3, #1
    16bc:	607a      	str	r2, [r7, #4]
    16be:	4a06      	ldr	r2, [pc, #24]	; (16d8 <gdi_clear_screen+0x2c>)
    16c0:	2100      	movs	r1, #0
    16c2:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
// position  du curseur texte.
static int cursor_x, cursor_y;

void gdi_clear_screen(){
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    16c6:	687b      	ldr	r3, [r7, #4]
    16c8:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    16cc:	dbf4      	blt.n	16b8 <gdi_clear_screen+0xc>
		video_buffer[i++]=0;
	}
}
    16ce:	370c      	adds	r7, #12
    16d0:	46bd      	mov	sp, r7
    16d2:	f85d 7b04 	ldr.w	r7, [sp], #4
    16d6:	4770      	bx	lr
    16d8:	20000120 	.word	0x20000120

000016dc <gdi_scroll_up>:

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
    16dc:	b480      	push	{r7}
    16de:	b083      	sub	sp, #12
    16e0:	af00      	add	r7, sp, #0
	int i,j;
	j=0;
    16e2:	2300      	movs	r3, #0
    16e4:	603b      	str	r3, [r7, #0]
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    16e6:	23a0      	movs	r3, #160	; 0xa0
    16e8:	607b      	str	r3, [r7, #4]
    16ea:	e00b      	b.n	1704 <gdi_scroll_up+0x28>
		video_buffer[j++]=video_buffer[i++];
    16ec:	683b      	ldr	r3, [r7, #0]
    16ee:	1c5a      	adds	r2, r3, #1
    16f0:	603a      	str	r2, [r7, #0]
    16f2:	687a      	ldr	r2, [r7, #4]
    16f4:	1c51      	adds	r1, r2, #1
    16f6:	6079      	str	r1, [r7, #4]
    16f8:	490e      	ldr	r1, [pc, #56]	; (1734 <gdi_scroll_up+0x58>)
    16fa:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    16fe:	4a0d      	ldr	r2, [pc, #52]	; (1734 <gdi_scroll_up+0x58>)
    1700:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
	int i,j;
	j=0;
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    1704:	687b      	ldr	r3, [r7, #4]
    1706:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    170a:	dbef      	blt.n	16ec <gdi_scroll_up+0x10>
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    170c:	f44f 5391 	mov.w	r3, #4640	; 0x1220
    1710:	607b      	str	r3, [r7, #4]
    1712:	e006      	b.n	1722 <gdi_scroll_up+0x46>
		video_buffer[i++]=0;
    1714:	687b      	ldr	r3, [r7, #4]
    1716:	1c5a      	adds	r2, r3, #1
    1718:	607a      	str	r2, [r7, #4]
    171a:	4a06      	ldr	r2, [pc, #24]	; (1734 <gdi_scroll_up+0x58>)
    171c:	2100      	movs	r1, #0
    171e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i,j;
	j=0;
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1722:	687b      	ldr	r3, [r7, #4]
    1724:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1728:	dbf4      	blt.n	1714 <gdi_scroll_up+0x38>
		video_buffer[i++]=0;
	}
}
    172a:	370c      	adds	r7, #12
    172c:	46bd      	mov	sp, r7
    172e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1732:	4770      	bx	lr
    1734:	20000120 	.word	0x20000120

00001738 <gdi_new_line>:

// avance le curseur texte au début 
// de la ligne suivante.
void gdi_new_line(){
    1738:	b580      	push	{r7, lr}
    173a:	af00      	add	r7, sp, #0
	cursor_x=0;
    173c:	4b08      	ldr	r3, [pc, #32]	; (1760 <gdi_new_line+0x28>)
    173e:	2200      	movs	r2, #0
    1740:	601a      	str	r2, [r3, #0]
	cursor_y+=CHAR_HEIGHT;
    1742:	4b08      	ldr	r3, [pc, #32]	; (1764 <gdi_new_line+0x2c>)
    1744:	681b      	ldr	r3, [r3, #0]
    1746:	3308      	adds	r3, #8
    1748:	4a06      	ldr	r2, [pc, #24]	; (1764 <gdi_new_line+0x2c>)
    174a:	6013      	str	r3, [r2, #0]
	if (cursor_y>(VRES-CHAR_HEIGHT)){
    174c:	4b05      	ldr	r3, [pc, #20]	; (1764 <gdi_new_line+0x2c>)
    174e:	681b      	ldr	r3, [r3, #0]
    1750:	2be8      	cmp	r3, #232	; 0xe8
    1752:	dd04      	ble.n	175e <gdi_new_line+0x26>
		cursor_y=VRES-CHAR_HEIGHT;
    1754:	4b03      	ldr	r3, [pc, #12]	; (1764 <gdi_new_line+0x2c>)
    1756:	22e8      	movs	r2, #232	; 0xe8
    1758:	601a      	str	r2, [r3, #0]
		gdi_scroll_up();
    175a:	f7ff ffbf 	bl	16dc <gdi_scroll_up>
	}
}
    175e:	bd80      	pop	{r7, pc}
    1760:	200000dc 	.word	0x200000dc
    1764:	200000e0 	.word	0x200000e0

00001768 <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const char *sprite){
    1768:	b480      	push	{r7}
    176a:	b089      	sub	sp, #36	; 0x24
    176c:	af00      	add	r7, sp, #0
    176e:	60f8      	str	r0, [r7, #12]
    1770:	60b9      	str	r1, [r7, #8]
    1772:	607a      	str	r2, [r7, #4]
    1774:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1776:	2300      	movs	r3, #0
    1778:	61fb      	str	r3, [r7, #28]
    177a:	e067      	b.n	184c <gdi_put_sprite+0xe4>
		mask=128;
    177c:	2380      	movs	r3, #128	; 0x80
    177e:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    1780:	2300      	movs	r3, #0
    1782:	61bb      	str	r3, [r7, #24]
    1784:	e05b      	b.n	183e <gdi_put_sprite+0xd6>
			if (!mask){
    1786:	7dfb      	ldrb	r3, [r7, #23]
    1788:	2b00      	cmp	r3, #0
    178a:	d104      	bne.n	1796 <gdi_put_sprite+0x2e>
				sprite++;
    178c:	6abb      	ldr	r3, [r7, #40]	; 0x28
    178e:	3301      	adds	r3, #1
    1790:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    1792:	2380      	movs	r3, #128	; 0x80
    1794:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    1796:	68fa      	ldr	r2, [r7, #12]
    1798:	69bb      	ldr	r3, [r7, #24]
    179a:	4413      	add	r3, r2
    179c:	2b00      	cmp	r3, #0
    179e:	db48      	blt.n	1832 <gdi_put_sprite+0xca>
    17a0:	68fa      	ldr	r2, [r7, #12]
    17a2:	69bb      	ldr	r3, [r7, #24]
    17a4:	4413      	add	r3, r2
    17a6:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    17aa:	da42      	bge.n	1832 <gdi_put_sprite+0xca>
    17ac:	69fa      	ldr	r2, [r7, #28]
    17ae:	68bb      	ldr	r3, [r7, #8]
    17b0:	4413      	add	r3, r2
    17b2:	2b00      	cmp	r3, #0
    17b4:	db3d      	blt.n	1832 <gdi_put_sprite+0xca>
    17b6:	69fa      	ldr	r2, [r7, #28]
    17b8:	68bb      	ldr	r3, [r7, #8]
    17ba:	4413      	add	r3, r2
    17bc:	2bef      	cmp	r3, #239	; 0xef
    17be:	dc38      	bgt.n	1832 <gdi_put_sprite+0xca>
				bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
    17c0:	69fb      	ldr	r3, [r7, #28]
    17c2:	6aba      	ldr	r2, [r7, #40]	; 0x28
    17c4:	4413      	add	r3, r2
    17c6:	781a      	ldrb	r2, [r3, #0]
    17c8:	7dfb      	ldrb	r3, [r7, #23]
    17ca:	4013      	ands	r3, r2
    17cc:	b2db      	uxtb	r3, r3
    17ce:	2b00      	cmp	r3, #0
    17d0:	d00a      	beq.n	17e8 <gdi_put_sprite+0x80>
    17d2:	69ba      	ldr	r2, [r7, #24]
    17d4:	68fb      	ldr	r3, [r7, #12]
    17d6:	4413      	add	r3, r2
    17d8:	43db      	mvns	r3, r3
    17da:	f003 030f 	and.w	r3, r3, #15
    17de:	2201      	movs	r2, #1
    17e0:	fa02 f303 	lsl.w	r3, r2, r3
    17e4:	b29b      	uxth	r3, r3
    17e6:	e000      	b.n	17ea <gdi_put_sprite+0x82>
    17e8:	2300      	movs	r3, #0
    17ea:	82bb      	strh	r3, [r7, #20]
				video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]^=bit;
    17ec:	69fa      	ldr	r2, [r7, #28]
    17ee:	68bb      	ldr	r3, [r7, #8]
    17f0:	441a      	add	r2, r3
    17f2:	4613      	mov	r3, r2
    17f4:	009b      	lsls	r3, r3, #2
    17f6:	4413      	add	r3, r2
    17f8:	009b      	lsls	r3, r3, #2
    17fa:	4619      	mov	r1, r3
    17fc:	69ba      	ldr	r2, [r7, #24]
    17fe:	68fb      	ldr	r3, [r7, #12]
    1800:	4413      	add	r3, r2
    1802:	111b      	asrs	r3, r3, #4
    1804:	4419      	add	r1, r3
    1806:	69fa      	ldr	r2, [r7, #28]
    1808:	68bb      	ldr	r3, [r7, #8]
    180a:	441a      	add	r2, r3
    180c:	4613      	mov	r3, r2
    180e:	009b      	lsls	r3, r3, #2
    1810:	4413      	add	r3, r2
    1812:	009b      	lsls	r3, r3, #2
    1814:	4618      	mov	r0, r3
    1816:	69ba      	ldr	r2, [r7, #24]
    1818:	68fb      	ldr	r3, [r7, #12]
    181a:	4413      	add	r3, r2
    181c:	111b      	asrs	r3, r3, #4
    181e:	4403      	add	r3, r0
    1820:	4a0f      	ldr	r2, [pc, #60]	; (1860 <gdi_put_sprite+0xf8>)
    1822:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1826:	8abb      	ldrh	r3, [r7, #20]
    1828:	4053      	eors	r3, r2
    182a:	b29a      	uxth	r2, r3
    182c:	4b0c      	ldr	r3, [pc, #48]	; (1860 <gdi_put_sprite+0xf8>)
    182e:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
			}
			mask>>=1;
    1832:	7dfb      	ldrb	r3, [r7, #23]
    1834:	085b      	lsrs	r3, r3, #1
    1836:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    1838:	69bb      	ldr	r3, [r7, #24]
    183a:	3301      	adds	r3, #1
    183c:	61bb      	str	r3, [r7, #24]
    183e:	69ba      	ldr	r2, [r7, #24]
    1840:	687b      	ldr	r3, [r7, #4]
    1842:	429a      	cmp	r2, r3
    1844:	db9f      	blt.n	1786 <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1846:	69fb      	ldr	r3, [r7, #28]
    1848:	3301      	adds	r3, #1
    184a:	61fb      	str	r3, [r7, #28]
    184c:	69fa      	ldr	r2, [r7, #28]
    184e:	683b      	ldr	r3, [r7, #0]
    1850:	429a      	cmp	r2, r3
    1852:	db93      	blt.n	177c <gdi_put_sprite+0x14>
				video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]^=bit;
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    1854:	3724      	adds	r7, #36	; 0x24
    1856:	46bd      	mov	sp, r7
    1858:	f85d 7b04 	ldr.w	r7, [sp], #4
    185c:	4770      	bx	lr
    185e:	bf00      	nop
    1860:	20000120 	.word	0x20000120

00001864 <gdi_putc>:


// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void gdi_putc(unsigned char c){
    1864:	b580      	push	{r7, lr}
    1866:	b084      	sub	sp, #16
    1868:	af02      	add	r7, sp, #8
    186a:	4603      	mov	r3, r0
    186c:	71fb      	strb	r3, [r7, #7]
		switch (c){
    186e:	79fb      	ldrb	r3, [r7, #7]
    1870:	2b0d      	cmp	r3, #13
    1872:	d102      	bne.n	187a <gdi_putc+0x16>
		case CR:
			gdi_new_line();
    1874:	f7ff ff60 	bl	1738 <gdi_new_line>
			break;
    1878:	e01d      	b.n	18b6 <gdi_putc+0x52>
		default:
			if (c<FONT_SIZE){
    187a:	79fb      	ldrb	r3, [r7, #7]
    187c:	b25b      	sxtb	r3, r3
    187e:	2b00      	cmp	r3, #0
    1880:	db18      	blt.n	18b4 <gdi_putc+0x50>
				gdi_put_sprite(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,&font6x8[c]);
    1882:	4b0e      	ldr	r3, [pc, #56]	; (18bc <gdi_putc+0x58>)
    1884:	6818      	ldr	r0, [r3, #0]
    1886:	4b0e      	ldr	r3, [pc, #56]	; (18c0 <gdi_putc+0x5c>)
    1888:	6819      	ldr	r1, [r3, #0]
    188a:	79fb      	ldrb	r3, [r7, #7]
    188c:	00db      	lsls	r3, r3, #3
    188e:	4a0d      	ldr	r2, [pc, #52]	; (18c4 <gdi_putc+0x60>)
    1890:	4413      	add	r3, r2
    1892:	9300      	str	r3, [sp, #0]
    1894:	2206      	movs	r2, #6
    1896:	2308      	movs	r3, #8
    1898:	f7ff ff66 	bl	1768 <gdi_put_sprite>
				cursor_x+=CHAR_WIDTH;
    189c:	4b07      	ldr	r3, [pc, #28]	; (18bc <gdi_putc+0x58>)
    189e:	681b      	ldr	r3, [r3, #0]
    18a0:	3306      	adds	r3, #6
    18a2:	4a06      	ldr	r2, [pc, #24]	; (18bc <gdi_putc+0x58>)
    18a4:	6013      	str	r3, [r2, #0]
				if (cursor_x>(HRES-CHAR_WIDTH)){
    18a6:	4b05      	ldr	r3, [pc, #20]	; (18bc <gdi_putc+0x58>)
    18a8:	681b      	ldr	r3, [r3, #0]
    18aa:	f5b3 7f9d 	cmp.w	r3, #314	; 0x13a
    18ae:	dd01      	ble.n	18b4 <gdi_putc+0x50>
					gdi_new_line();
    18b0:	f7ff ff42 	bl	1738 <gdi_new_line>
				}
			}
			break;
    18b4:	bf00      	nop
		}//switch
}
    18b6:	3708      	adds	r7, #8
    18b8:	46bd      	mov	sp, r7
    18ba:	bd80      	pop	{r7, pc}
    18bc:	200000dc 	.word	0x200000dc
    18c0:	200000e0 	.word	0x200000e0
    18c4:	000027c8 	.word	0x000027c8

000018c8 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    18c8:	b490      	push	{r4, r7}
    18ca:	b086      	sub	sp, #24
    18cc:	af00      	add	r7, sp, #0
    18ce:	60f8      	str	r0, [r7, #12]
    18d0:	60b9      	str	r1, [r7, #8]
    18d2:	607a      	str	r2, [r7, #4]
	register gpio_crl_t* cr;
	uint8_t shift;
	switch (port){
    18d4:	68fb      	ldr	r3, [r7, #12]
    18d6:	2b01      	cmp	r3, #1
    18d8:	d006      	beq.n	18e8 <config_pin+0x20>
    18da:	2b01      	cmp	r3, #1
    18dc:	d302      	bcc.n	18e4 <config_pin+0x1c>
    18de:	2b02      	cmp	r3, #2
    18e0:	d004      	beq.n	18ec <config_pin+0x24>
    18e2:	e005      	b.n	18f0 <config_pin+0x28>
		case GPIOA:
		cr=(gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS);
    18e4:	4c17      	ldr	r4, [pc, #92]	; (1944 <config_pin+0x7c>)
		break;
    18e6:	e003      	b.n	18f0 <config_pin+0x28>
		case GPIOB:
		cr=(gpio_crl_t*)(GPIOB_BASE_ADR+GPIO_CRL_OFS);
    18e8:	4c17      	ldr	r4, [pc, #92]	; (1948 <config_pin+0x80>)
		break;
    18ea:	e001      	b.n	18f0 <config_pin+0x28>
		case GPIOC:
		cr=(gpio_crl_t*)(GPIOC_BASE_ADR+GPIO_CRL_OFS);
    18ec:	4c17      	ldr	r4, [pc, #92]	; (194c <config_pin+0x84>)
		break;
    18ee:	bf00      	nop
	}
	shift=(pin&7)<<2;
    18f0:	68bb      	ldr	r3, [r7, #8]
    18f2:	b2db      	uxtb	r3, r3
    18f4:	f003 0307 	and.w	r3, r3, #7
    18f8:	b2db      	uxtb	r3, r3
    18fa:	009b      	lsls	r3, r3, #2
    18fc:	75fb      	strb	r3, [r7, #23]
	cr[pin>>3].cr&=~(15<<shift);
    18fe:	68bb      	ldr	r3, [r7, #8]
    1900:	08db      	lsrs	r3, r3, #3
    1902:	009b      	lsls	r3, r3, #2
    1904:	4423      	add	r3, r4
    1906:	68ba      	ldr	r2, [r7, #8]
    1908:	08d2      	lsrs	r2, r2, #3
    190a:	0092      	lsls	r2, r2, #2
    190c:	4422      	add	r2, r4
    190e:	6812      	ldr	r2, [r2, #0]
    1910:	7df9      	ldrb	r1, [r7, #23]
    1912:	200f      	movs	r0, #15
    1914:	fa00 f101 	lsl.w	r1, r0, r1
    1918:	43c9      	mvns	r1, r1
    191a:	400a      	ands	r2, r1
    191c:	601a      	str	r2, [r3, #0]
	cr[pin>>3].cr|=config<<shift;
    191e:	68bb      	ldr	r3, [r7, #8]
    1920:	08db      	lsrs	r3, r3, #3
    1922:	009b      	lsls	r3, r3, #2
    1924:	4423      	add	r3, r4
    1926:	68ba      	ldr	r2, [r7, #8]
    1928:	08d2      	lsrs	r2, r2, #3
    192a:	0092      	lsls	r2, r2, #2
    192c:	4422      	add	r2, r4
    192e:	6811      	ldr	r1, [r2, #0]
    1930:	7dfa      	ldrb	r2, [r7, #23]
    1932:	6878      	ldr	r0, [r7, #4]
    1934:	fa00 f202 	lsl.w	r2, r0, r2
    1938:	430a      	orrs	r2, r1
    193a:	601a      	str	r2, [r3, #0]
}
    193c:	3718      	adds	r7, #24
    193e:	46bd      	mov	sp, r7
    1940:	bc90      	pop	{r4, r7}
    1942:	4770      	bx	lr
    1944:	40010800 	.word	0x40010800
    1948:	40010c00 	.word	0x40010c00
    194c:	40011000 	.word	0x40011000

00001950 <keyboard_init>:

#define QUEUE_SIZE (32)
static char queue[QUEUE_SIZE];
static int head=0,tail=0;
 
void keyboard_init(){
    1950:	b580      	push	{r7, lr}
    1952:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_USART1,8);
    1954:	2025      	movs	r0, #37	; 0x25
    1956:	2108      	movs	r1, #8
    1958:	f000 fa30 	bl	1dbc <set_int_priority>
	uart_open_channel(KEYBRD,12500,PARITY_ENABLE,FLOW_SOFT);
    195c:	4806      	ldr	r0, [pc, #24]	; (1978 <keyboard_init+0x28>)
    195e:	f243 01d4 	movw	r1, #12500	; 0x30d4
    1962:	2201      	movs	r2, #1
    1964:	2300      	movs	r3, #0
    1966:	f000 fd83 	bl	2470 <uart_open_channel>
	head=0;
    196a:	4b04      	ldr	r3, [pc, #16]	; (197c <keyboard_init+0x2c>)
    196c:	2200      	movs	r2, #0
    196e:	601a      	str	r2, [r3, #0]
	tail=0;
    1970:	4b03      	ldr	r3, [pc, #12]	; (1980 <keyboard_init+0x30>)
    1972:	2200      	movs	r2, #0
    1974:	601a      	str	r2, [r3, #0]
}
    1976:	bd80      	pop	{r7, pc}
    1978:	40013800 	.word	0x40013800
    197c:	20000104 	.word	0x20000104
    1980:	20000108 	.word	0x20000108

00001984 <kbd_getc>:


char kbd_getc(){
    1984:	b480      	push	{r7}
    1986:	b083      	sub	sp, #12
    1988:	af00      	add	r7, sp, #0
	char c=0;
    198a:	2300      	movs	r3, #0
    198c:	71fb      	strb	r3, [r7, #7]
	if (head!=tail){
    198e:	4b0d      	ldr	r3, [pc, #52]	; (19c4 <kbd_getc+0x40>)
    1990:	681a      	ldr	r2, [r3, #0]
    1992:	4b0d      	ldr	r3, [pc, #52]	; (19c8 <kbd_getc+0x44>)
    1994:	681b      	ldr	r3, [r3, #0]
    1996:	429a      	cmp	r2, r3
    1998:	d00d      	beq.n	19b6 <kbd_getc+0x32>
		c=queue[head++];
    199a:	4b0a      	ldr	r3, [pc, #40]	; (19c4 <kbd_getc+0x40>)
    199c:	681b      	ldr	r3, [r3, #0]
    199e:	1c5a      	adds	r2, r3, #1
    19a0:	4908      	ldr	r1, [pc, #32]	; (19c4 <kbd_getc+0x40>)
    19a2:	600a      	str	r2, [r1, #0]
    19a4:	4a09      	ldr	r2, [pc, #36]	; (19cc <kbd_getc+0x48>)
    19a6:	5cd3      	ldrb	r3, [r2, r3]
    19a8:	71fb      	strb	r3, [r7, #7]
		head&=QUEUE_SIZE-1;
    19aa:	4b06      	ldr	r3, [pc, #24]	; (19c4 <kbd_getc+0x40>)
    19ac:	681b      	ldr	r3, [r3, #0]
    19ae:	f003 031f 	and.w	r3, r3, #31
    19b2:	4a04      	ldr	r2, [pc, #16]	; (19c4 <kbd_getc+0x40>)
    19b4:	6013      	str	r3, [r2, #0]
	}
	return c;
    19b6:	79fb      	ldrb	r3, [r7, #7]
}
    19b8:	4618      	mov	r0, r3
    19ba:	370c      	adds	r7, #12
    19bc:	46bd      	mov	sp, r7
    19be:	f85d 7b04 	ldr.w	r7, [sp], #4
    19c2:	4770      	bx	lr
    19c4:	20000104 	.word	0x20000104
    19c8:	20000108 	.word	0x20000108
    19cc:	200000e4 	.word	0x200000e4

000019d0 <search_table>:
};

const key_translate_t mcsaite_xkey[]={
};

char search_table(const key_translate_t *table,char code){
    19d0:	b480      	push	{r7}
    19d2:	b083      	sub	sp, #12
    19d4:	af00      	add	r7, sp, #0
    19d6:	6078      	str	r0, [r7, #4]
    19d8:	460b      	mov	r3, r1
    19da:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    19dc:	e008      	b.n	19f0 <search_table+0x20>
		if (table->code==code) break;
    19de:	687b      	ldr	r3, [r7, #4]
    19e0:	781b      	ldrb	r3, [r3, #0]
    19e2:	78fa      	ldrb	r2, [r7, #3]
    19e4:	429a      	cmp	r2, r3
    19e6:	d100      	bne.n	19ea <search_table+0x1a>
    19e8:	e006      	b.n	19f8 <search_table+0x28>
		table++;
    19ea:	687b      	ldr	r3, [r7, #4]
    19ec:	3302      	adds	r3, #2
    19ee:	607b      	str	r3, [r7, #4]

const key_translate_t mcsaite_xkey[]={
};

char search_table(const key_translate_t *table,char code){
	while (table->code){
    19f0:	687b      	ldr	r3, [r7, #4]
    19f2:	781b      	ldrb	r3, [r3, #0]
    19f4:	2b00      	cmp	r3, #0
    19f6:	d1f2      	bne.n	19de <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    19f8:	687b      	ldr	r3, [r7, #4]
    19fa:	785b      	ldrb	r3, [r3, #1]
}
    19fc:	4618      	mov	r0, r3
    19fe:	370c      	adds	r7, #12
    1a00:	46bd      	mov	sp, r7
    1a02:	f85d 7b04 	ldr.w	r7, [sp], #4
    1a06:	4770      	bx	lr

00001a08 <USART1_handler>:

// interruption USART1 (clavier PS/2)
void USART1_handler(){
    1a08:	b580      	push	{r7, lr}
    1a0a:	b084      	sub	sp, #16
    1a0c:	af00      	add	r7, sp, #0
	char c,s;
	int shift;
	if (USART1_SR&(1<<USART_SR_PE)){
    1a0e:	4b93      	ldr	r3, [pc, #588]	; (1c5c <USART1_handler+0x254>)
    1a10:	681b      	ldr	r3, [r3, #0]
    1a12:	f003 0301 	and.w	r3, r3, #1
    1a16:	2b00      	cmp	r3, #0
    1a18:	d003      	beq.n	1a22 <USART1_handler+0x1a>
		uart_getc(USART1);
    1a1a:	4890      	ldr	r0, [pc, #576]	; (1c5c <USART1_handler+0x254>)
    1a1c:	f000 fde0 	bl	25e0 <uart_getc>
    1a20:	e176      	b.n	1d10 <USART1_handler+0x308>
	}else if (USART1_SR&(1<<USART_SR_RXNE)){
    1a22:	4b8e      	ldr	r3, [pc, #568]	; (1c5c <USART1_handler+0x254>)
    1a24:	681b      	ldr	r3, [r3, #0]
    1a26:	f003 0320 	and.w	r3, r3, #32
    1a2a:	2b00      	cmp	r3, #0
    1a2c:	f000 8170 	beq.w	1d10 <USART1_handler+0x308>
		c=uart_getc(USART1);
    1a30:	488a      	ldr	r0, [pc, #552]	; (1c5c <USART1_handler+0x254>)
    1a32:	f000 fdd5 	bl	25e0 <uart_getc>
    1a36:	4603      	mov	r3, r0
    1a38:	73fb      	strb	r3, [r7, #15]
		switch (c){
    1a3a:	7bfb      	ldrb	r3, [r7, #15]
    1a3c:	2b59      	cmp	r3, #89	; 0x59
    1a3e:	f000 80a3 	beq.w	1b88 <USART1_handler+0x180>
    1a42:	2b59      	cmp	r3, #89	; 0x59
    1a44:	dc0e      	bgt.n	1a64 <USART1_handler+0x5c>
    1a46:	2b12      	cmp	r3, #18
    1a48:	d042      	beq.n	1ad0 <USART1_handler+0xc8>
    1a4a:	2b12      	cmp	r3, #18
    1a4c:	dc03      	bgt.n	1a56 <USART1_handler+0x4e>
    1a4e:	2b11      	cmp	r3, #17
    1a50:	f000 80c2 	beq.w	1bd8 <USART1_handler+0x1d0>
    1a54:	e0e8      	b.n	1c28 <USART1_handler+0x220>
    1a56:	2b14      	cmp	r3, #20
    1a58:	f000 80aa 	beq.w	1bb0 <USART1_handler+0x1a8>
    1a5c:	2b58      	cmp	r3, #88	; 0x58
    1a5e:	f000 80cf 	beq.w	1c00 <USART1_handler+0x1f8>
    1a62:	e0e1      	b.n	1c28 <USART1_handler+0x220>
    1a64:	2be0      	cmp	r3, #224	; 0xe0
    1a66:	d010      	beq.n	1a8a <USART1_handler+0x82>
    1a68:	2be0      	cmp	r3, #224	; 0xe0
    1a6a:	dc02      	bgt.n	1a72 <USART1_handler+0x6a>
    1a6c:	2b7c      	cmp	r3, #124	; 0x7c
    1a6e:	d051      	beq.n	1b14 <USART1_handler+0x10c>
    1a70:	e0da      	b.n	1c28 <USART1_handler+0x220>
    1a72:	2be1      	cmp	r3, #225	; 0xe1
    1a74:	d010      	beq.n	1a98 <USART1_handler+0x90>
    1a76:	2bf0      	cmp	r3, #240	; 0xf0
    1a78:	f040 80d6 	bne.w	1c28 <USART1_handler+0x220>
		case 0xF0:
			flags |= RELEASE;
    1a7c:	4b78      	ldr	r3, [pc, #480]	; (1c60 <USART1_handler+0x258>)
    1a7e:	681b      	ldr	r3, [r3, #0]
    1a80:	f043 0302 	orr.w	r3, r3, #2
    1a84:	4a76      	ldr	r2, [pc, #472]	; (1c60 <USART1_handler+0x258>)
    1a86:	6013      	str	r3, [r2, #0]
			break;
    1a88:	e142      	b.n	1d10 <USART1_handler+0x308>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    1a8a:	4b75      	ldr	r3, [pc, #468]	; (1c60 <USART1_handler+0x258>)
    1a8c:	681b      	ldr	r3, [r3, #0]
    1a8e:	f043 0301 	orr.w	r3, r3, #1
    1a92:	4a73      	ldr	r2, [pc, #460]	; (1c60 <USART1_handler+0x258>)
    1a94:	6013      	str	r3, [r2, #0]
			break;
    1a96:	e13b      	b.n	1d10 <USART1_handler+0x308>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    1a98:	4b71      	ldr	r3, [pc, #452]	; (1c60 <USART1_handler+0x258>)
    1a9a:	681b      	ldr	r3, [r3, #0]
    1a9c:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    1aa0:	4a6f      	ldr	r2, [pc, #444]	; (1c60 <USART1_handler+0x258>)
    1aa2:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    1aa4:	4b6e      	ldr	r3, [pc, #440]	; (1c60 <USART1_handler+0x258>)
    1aa6:	681b      	ldr	r3, [r3, #0]
    1aa8:	f403 7380 	and.w	r3, r3, #256	; 0x100
    1aac:	2b00      	cmp	r3, #0
    1aae:	d10e      	bne.n	1ace <USART1_handler+0xc6>
				queue[tail++]=PAUSE;
    1ab0:	4b6c      	ldr	r3, [pc, #432]	; (1c64 <USART1_handler+0x25c>)
    1ab2:	681b      	ldr	r3, [r3, #0]
    1ab4:	1c5a      	adds	r2, r3, #1
    1ab6:	496b      	ldr	r1, [pc, #428]	; (1c64 <USART1_handler+0x25c>)
    1ab8:	600a      	str	r2, [r1, #0]
    1aba:	4a6b      	ldr	r2, [pc, #428]	; (1c68 <USART1_handler+0x260>)
    1abc:	2194      	movs	r1, #148	; 0x94
    1abe:	54d1      	strb	r1, [r2, r3]
				tail&=QUEUE_SIZE-1;
    1ac0:	4b68      	ldr	r3, [pc, #416]	; (1c64 <USART1_handler+0x25c>)
    1ac2:	681b      	ldr	r3, [r3, #0]
    1ac4:	f003 031f 	and.w	r3, r3, #31
    1ac8:	4a66      	ldr	r2, [pc, #408]	; (1c64 <USART1_handler+0x25c>)
    1aca:	6013      	str	r3, [r2, #0]
			}
			break;
    1acc:	e120      	b.n	1d10 <USART1_handler+0x308>
    1ace:	e11f      	b.n	1d10 <USART1_handler+0x308>
		case LSHIFT:
			if (flags&RELEASE){
    1ad0:	4b63      	ldr	r3, [pc, #396]	; (1c60 <USART1_handler+0x258>)
    1ad2:	681b      	ldr	r3, [r3, #0]
    1ad4:	f003 0302 	and.w	r3, r3, #2
    1ad8:	2b00      	cmp	r3, #0
    1ada:	d006      	beq.n	1aea <USART1_handler+0xe2>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    1adc:	4b60      	ldr	r3, [pc, #384]	; (1c60 <USART1_handler+0x258>)
    1ade:	681b      	ldr	r3, [r3, #0]
    1ae0:	f023 0307 	bic.w	r3, r3, #7
    1ae4:	4a5e      	ldr	r2, [pc, #376]	; (1c60 <USART1_handler+0x258>)
    1ae6:	6013      	str	r3, [r2, #0]
    1ae8:	e013      	b.n	1b12 <USART1_handler+0x10a>
			}else{
				if (flags&XTD_CODE){
    1aea:	4b5d      	ldr	r3, [pc, #372]	; (1c60 <USART1_handler+0x258>)
    1aec:	681b      	ldr	r3, [r3, #0]
    1aee:	f003 0301 	and.w	r3, r3, #1
    1af2:	2b00      	cmp	r3, #0
    1af4:	d006      	beq.n	1b04 <USART1_handler+0xfc>
					flags|=PRNSCR;
    1af6:	4b5a      	ldr	r3, [pc, #360]	; (1c60 <USART1_handler+0x258>)
    1af8:	681b      	ldr	r3, [r3, #0]
    1afa:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1afe:	4a58      	ldr	r2, [pc, #352]	; (1c60 <USART1_handler+0x258>)
    1b00:	6013      	str	r3, [r2, #0]
    1b02:	e006      	b.n	1b12 <USART1_handler+0x10a>
				}else{
					flags|=LEFT_SHIFT;
    1b04:	4b56      	ldr	r3, [pc, #344]	; (1c60 <USART1_handler+0x258>)
    1b06:	681b      	ldr	r3, [r3, #0]
    1b08:	f043 0304 	orr.w	r3, r3, #4
    1b0c:	4a54      	ldr	r2, [pc, #336]	; (1c60 <USART1_handler+0x258>)
    1b0e:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1b10:	e0fe      	b.n	1d10 <USART1_handler+0x308>
    1b12:	e0fd      	b.n	1d10 <USART1_handler+0x308>
		case KPMUL:
			if (flags&RELEASE){
    1b14:	4b52      	ldr	r3, [pc, #328]	; (1c60 <USART1_handler+0x258>)
    1b16:	681b      	ldr	r3, [r3, #0]
    1b18:	f003 0302 	and.w	r3, r3, #2
    1b1c:	2b00      	cmp	r3, #0
    1b1e:	d006      	beq.n	1b2e <USART1_handler+0x126>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    1b20:	4b4f      	ldr	r3, [pc, #316]	; (1c60 <USART1_handler+0x258>)
    1b22:	681b      	ldr	r3, [r3, #0]
    1b24:	f023 0303 	bic.w	r3, r3, #3
    1b28:	4a4d      	ldr	r2, [pc, #308]	; (1c60 <USART1_handler+0x258>)
    1b2a:	6013      	str	r3, [r2, #0]
    1b2c:	e02b      	b.n	1b86 <USART1_handler+0x17e>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    1b2e:	4b4c      	ldr	r3, [pc, #304]	; (1c60 <USART1_handler+0x258>)
    1b30:	681b      	ldr	r3, [r3, #0]
    1b32:	f003 0301 	and.w	r3, r3, #1
    1b36:	2b00      	cmp	r3, #0
    1b38:	d016      	beq.n	1b68 <USART1_handler+0x160>
					flags&=~(XTD_CODE|PRNSCR);
    1b3a:	4b49      	ldr	r3, [pc, #292]	; (1c60 <USART1_handler+0x258>)
    1b3c:	681b      	ldr	r3, [r3, #0]
    1b3e:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    1b42:	f023 0301 	bic.w	r3, r3, #1
    1b46:	4a46      	ldr	r2, [pc, #280]	; (1c60 <USART1_handler+0x258>)
    1b48:	6013      	str	r3, [r2, #0]
					queue[tail++]=PRN;
    1b4a:	4b46      	ldr	r3, [pc, #280]	; (1c64 <USART1_handler+0x25c>)
    1b4c:	681b      	ldr	r3, [r3, #0]
    1b4e:	1c5a      	adds	r2, r3, #1
    1b50:	4944      	ldr	r1, [pc, #272]	; (1c64 <USART1_handler+0x25c>)
    1b52:	600a      	str	r2, [r1, #0]
    1b54:	4a44      	ldr	r2, [pc, #272]	; (1c68 <USART1_handler+0x260>)
    1b56:	2192      	movs	r1, #146	; 0x92
    1b58:	54d1      	strb	r1, [r2, r3]
					tail&=QUEUE_SIZE-1;
    1b5a:	4b42      	ldr	r3, [pc, #264]	; (1c64 <USART1_handler+0x25c>)
    1b5c:	681b      	ldr	r3, [r3, #0]
    1b5e:	f003 031f 	and.w	r3, r3, #31
    1b62:	4a40      	ldr	r2, [pc, #256]	; (1c64 <USART1_handler+0x25c>)
    1b64:	6013      	str	r3, [r2, #0]
    1b66:	e00e      	b.n	1b86 <USART1_handler+0x17e>
				}else{
					queue[tail++]='*';
    1b68:	4b3e      	ldr	r3, [pc, #248]	; (1c64 <USART1_handler+0x25c>)
    1b6a:	681b      	ldr	r3, [r3, #0]
    1b6c:	1c5a      	adds	r2, r3, #1
    1b6e:	493d      	ldr	r1, [pc, #244]	; (1c64 <USART1_handler+0x25c>)
    1b70:	600a      	str	r2, [r1, #0]
    1b72:	4a3d      	ldr	r2, [pc, #244]	; (1c68 <USART1_handler+0x260>)
    1b74:	212a      	movs	r1, #42	; 0x2a
    1b76:	54d1      	strb	r1, [r2, r3]
					tail&=QUEUE_SIZE-1;
    1b78:	4b3a      	ldr	r3, [pc, #232]	; (1c64 <USART1_handler+0x25c>)
    1b7a:	681b      	ldr	r3, [r3, #0]
    1b7c:	f003 031f 	and.w	r3, r3, #31
    1b80:	4a38      	ldr	r2, [pc, #224]	; (1c64 <USART1_handler+0x25c>)
    1b82:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1b84:	e0c4      	b.n	1d10 <USART1_handler+0x308>
    1b86:	e0c3      	b.n	1d10 <USART1_handler+0x308>
		case RSHIFT:
			if (flags&RELEASE){
    1b88:	4b35      	ldr	r3, [pc, #212]	; (1c60 <USART1_handler+0x258>)
    1b8a:	681b      	ldr	r3, [r3, #0]
    1b8c:	f003 0302 	and.w	r3, r3, #2
    1b90:	2b00      	cmp	r3, #0
    1b92:	d006      	beq.n	1ba2 <USART1_handler+0x19a>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    1b94:	4b32      	ldr	r3, [pc, #200]	; (1c60 <USART1_handler+0x258>)
    1b96:	681b      	ldr	r3, [r3, #0]
    1b98:	f023 030b 	bic.w	r3, r3, #11
    1b9c:	4a30      	ldr	r2, [pc, #192]	; (1c60 <USART1_handler+0x258>)
    1b9e:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    1ba0:	e0b6      	b.n	1d10 <USART1_handler+0x308>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    1ba2:	4b2f      	ldr	r3, [pc, #188]	; (1c60 <USART1_handler+0x258>)
    1ba4:	681b      	ldr	r3, [r3, #0]
    1ba6:	f043 0308 	orr.w	r3, r3, #8
    1baa:	4a2d      	ldr	r2, [pc, #180]	; (1c60 <USART1_handler+0x258>)
    1bac:	6013      	str	r3, [r2, #0]
			}
			break;
    1bae:	e0af      	b.n	1d10 <USART1_handler+0x308>
		case LCTRL:
			if (flags&RELEASE){
    1bb0:	4b2b      	ldr	r3, [pc, #172]	; (1c60 <USART1_handler+0x258>)
    1bb2:	681b      	ldr	r3, [r3, #0]
    1bb4:	f003 0302 	and.w	r3, r3, #2
    1bb8:	2b00      	cmp	r3, #0
    1bba:	d006      	beq.n	1bca <USART1_handler+0x1c2>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    1bbc:	4b28      	ldr	r3, [pc, #160]	; (1c60 <USART1_handler+0x258>)
    1bbe:	681b      	ldr	r3, [r3, #0]
    1bc0:	f023 0313 	bic.w	r3, r3, #19
    1bc4:	4a26      	ldr	r2, [pc, #152]	; (1c60 <USART1_handler+0x258>)
    1bc6:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_CTRL;
			}
			break;
    1bc8:	e0a2      	b.n	1d10 <USART1_handler+0x308>
			break;
		case LCTRL:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
			}else{
				flags|=LEFT_CTRL;
    1bca:	4b25      	ldr	r3, [pc, #148]	; (1c60 <USART1_handler+0x258>)
    1bcc:	681b      	ldr	r3, [r3, #0]
    1bce:	f043 0310 	orr.w	r3, r3, #16
    1bd2:	4a23      	ldr	r2, [pc, #140]	; (1c60 <USART1_handler+0x258>)
    1bd4:	6013      	str	r3, [r2, #0]
			}
			break;
    1bd6:	e09b      	b.n	1d10 <USART1_handler+0x308>
		case LALT:
			if (flags&RELEASE){
    1bd8:	4b21      	ldr	r3, [pc, #132]	; (1c60 <USART1_handler+0x258>)
    1bda:	681b      	ldr	r3, [r3, #0]
    1bdc:	f003 0302 	and.w	r3, r3, #2
    1be0:	2b00      	cmp	r3, #0
    1be2:	d006      	beq.n	1bf2 <USART1_handler+0x1ea>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    1be4:	4b1e      	ldr	r3, [pc, #120]	; (1c60 <USART1_handler+0x258>)
    1be6:	681b      	ldr	r3, [r3, #0]
    1be8:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    1bec:	4a1c      	ldr	r2, [pc, #112]	; (1c60 <USART1_handler+0x258>)
    1bee:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    1bf0:	e08e      	b.n	1d10 <USART1_handler+0x308>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    1bf2:	4b1b      	ldr	r3, [pc, #108]	; (1c60 <USART1_handler+0x258>)
    1bf4:	681b      	ldr	r3, [r3, #0]
    1bf6:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1bfa:	4a19      	ldr	r2, [pc, #100]	; (1c60 <USART1_handler+0x258>)
    1bfc:	6013      	str	r3, [r2, #0]
			}
			break;
    1bfe:	e087      	b.n	1d10 <USART1_handler+0x308>
		case CAPS_LOCK:
			if (flags&RELEASE){
    1c00:	4b17      	ldr	r3, [pc, #92]	; (1c60 <USART1_handler+0x258>)
    1c02:	681b      	ldr	r3, [r3, #0]
    1c04:	f003 0302 	and.w	r3, r3, #2
    1c08:	2b00      	cmp	r3, #0
    1c0a:	d006      	beq.n	1c1a <USART1_handler+0x212>
				flags&=~(RELEASE|XTD_CODE);
    1c0c:	4b14      	ldr	r3, [pc, #80]	; (1c60 <USART1_handler+0x258>)
    1c0e:	681b      	ldr	r3, [r3, #0]
    1c10:	f023 0303 	bic.w	r3, r3, #3
    1c14:	4a12      	ldr	r2, [pc, #72]	; (1c60 <USART1_handler+0x258>)
    1c16:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    1c18:	e07a      	b.n	1d10 <USART1_handler+0x308>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    1c1a:	4b11      	ldr	r3, [pc, #68]	; (1c60 <USART1_handler+0x258>)
    1c1c:	681b      	ldr	r3, [r3, #0]
    1c1e:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    1c22:	4a0f      	ldr	r2, [pc, #60]	; (1c60 <USART1_handler+0x258>)
    1c24:	6013      	str	r3, [r2, #0]
			}
			break;
    1c26:	e073      	b.n	1d10 <USART1_handler+0x308>
		default:
			if (!(flags&RELEASE)){
    1c28:	4b0d      	ldr	r3, [pc, #52]	; (1c60 <USART1_handler+0x258>)
    1c2a:	681b      	ldr	r3, [r3, #0]
    1c2c:	f003 0302 	and.w	r3, r3, #2
    1c30:	2b00      	cmp	r3, #0
    1c32:	d166      	bne.n	1d02 <USART1_handler+0x2fa>
					if (flags&XTD_CODE){
    1c34:	4b0a      	ldr	r3, [pc, #40]	; (1c60 <USART1_handler+0x258>)
    1c36:	681b      	ldr	r3, [r3, #0]
    1c38:	f003 0301 	and.w	r3, r3, #1
    1c3c:	2b00      	cmp	r3, #0
    1c3e:	d017      	beq.n	1c70 <USART1_handler+0x268>
						c=search_table(mcsaite_xkey,c);
    1c40:	7bfb      	ldrb	r3, [r7, #15]
    1c42:	480a      	ldr	r0, [pc, #40]	; (1c6c <USART1_handler+0x264>)
    1c44:	4619      	mov	r1, r3
    1c46:	f7ff fec3 	bl	19d0 <search_table>
    1c4a:	4603      	mov	r3, r0
    1c4c:	73fb      	strb	r3, [r7, #15]
						flags&=~XTD_CODE;
    1c4e:	4b04      	ldr	r3, [pc, #16]	; (1c60 <USART1_handler+0x258>)
    1c50:	681b      	ldr	r3, [r3, #0]
    1c52:	f023 0301 	bic.w	r3, r3, #1
    1c56:	4a02      	ldr	r2, [pc, #8]	; (1c60 <USART1_handler+0x258>)
    1c58:	6013      	str	r3, [r2, #0]
    1c5a:	e010      	b.n	1c7e <USART1_handler+0x276>
    1c5c:	40013800 	.word	0x40013800
    1c60:	2000010c 	.word	0x2000010c
    1c64:	20000108 	.word	0x20000108
    1c68:	200000e4 	.word	0x200000e4
    1c6c:	00002c80 	.word	0x00002c80
					}else{
						c=search_table(mcsaite_key,c);
    1c70:	7bfb      	ldrb	r3, [r7, #15]
    1c72:	4829      	ldr	r0, [pc, #164]	; (1d18 <USART1_handler+0x310>)
    1c74:	4619      	mov	r1, r3
    1c76:	f7ff feab 	bl	19d0 <search_table>
    1c7a:	4603      	mov	r3, r0
    1c7c:	73fb      	strb	r3, [r7, #15]
					}
					shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    1c7e:	4b27      	ldr	r3, [pc, #156]	; (1d1c <USART1_handler+0x314>)
    1c80:	681b      	ldr	r3, [r3, #0]
    1c82:	f003 030c 	and.w	r3, r3, #12
    1c86:	60bb      	str	r3, [r7, #8]
					if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    1c88:	7bfb      	ldrb	r3, [r7, #15]
    1c8a:	2b60      	cmp	r3, #96	; 0x60
    1c8c:	d918      	bls.n	1cc0 <USART1_handler+0x2b8>
    1c8e:	7bfb      	ldrb	r3, [r7, #15]
    1c90:	2b7a      	cmp	r3, #122	; 0x7a
    1c92:	d815      	bhi.n	1cc0 <USART1_handler+0x2b8>
    1c94:	68bb      	ldr	r3, [r7, #8]
    1c96:	2b00      	cmp	r3, #0
    1c98:	d005      	beq.n	1ca6 <USART1_handler+0x29e>
    1c9a:	4b20      	ldr	r3, [pc, #128]	; (1d1c <USART1_handler+0x314>)
    1c9c:	681b      	ldr	r3, [r3, #0]
    1c9e:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1ca2:	2b00      	cmp	r3, #0
    1ca4:	d008      	beq.n	1cb8 <USART1_handler+0x2b0>
    1ca6:	68bb      	ldr	r3, [r7, #8]
    1ca8:	2b00      	cmp	r3, #0
    1caa:	d109      	bne.n	1cc0 <USART1_handler+0x2b8>
    1cac:	4b1b      	ldr	r3, [pc, #108]	; (1d1c <USART1_handler+0x314>)
    1cae:	681b      	ldr	r3, [r3, #0]
    1cb0:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    1cb4:	2b00      	cmp	r3, #0
    1cb6:	d003      	beq.n	1cc0 <USART1_handler+0x2b8>
						c-=32;
    1cb8:	7bfb      	ldrb	r3, [r7, #15]
    1cba:	3b20      	subs	r3, #32
    1cbc:	73fb      	strb	r3, [r7, #15]
    1cbe:	e00e      	b.n	1cde <USART1_handler+0x2d6>
					}else if (shift && (s=search_table(mcsaite_shey,c))){
    1cc0:	68bb      	ldr	r3, [r7, #8]
    1cc2:	2b00      	cmp	r3, #0
    1cc4:	d00b      	beq.n	1cde <USART1_handler+0x2d6>
    1cc6:	7bfb      	ldrb	r3, [r7, #15]
    1cc8:	4815      	ldr	r0, [pc, #84]	; (1d20 <USART1_handler+0x318>)
    1cca:	4619      	mov	r1, r3
    1ccc:	f7ff fe80 	bl	19d0 <search_table>
    1cd0:	4603      	mov	r3, r0
    1cd2:	71fb      	strb	r3, [r7, #7]
    1cd4:	79fb      	ldrb	r3, [r7, #7]
    1cd6:	2b00      	cmp	r3, #0
    1cd8:	d001      	beq.n	1cde <USART1_handler+0x2d6>
						c=s;
    1cda:	79fb      	ldrb	r3, [r7, #7]
    1cdc:	73fb      	strb	r3, [r7, #15]
					}
					if (c){
    1cde:	7bfb      	ldrb	r3, [r7, #15]
    1ce0:	2b00      	cmp	r3, #0
    1ce2:	d014      	beq.n	1d0e <USART1_handler+0x306>
						queue[tail++]=c;
    1ce4:	4b0f      	ldr	r3, [pc, #60]	; (1d24 <USART1_handler+0x31c>)
    1ce6:	681b      	ldr	r3, [r3, #0]
    1ce8:	1c5a      	adds	r2, r3, #1
    1cea:	490e      	ldr	r1, [pc, #56]	; (1d24 <USART1_handler+0x31c>)
    1cec:	600a      	str	r2, [r1, #0]
    1cee:	490e      	ldr	r1, [pc, #56]	; (1d28 <USART1_handler+0x320>)
    1cf0:	7bfa      	ldrb	r2, [r7, #15]
    1cf2:	54ca      	strb	r2, [r1, r3]
						tail&=QUEUE_SIZE-1;
    1cf4:	4b0b      	ldr	r3, [pc, #44]	; (1d24 <USART1_handler+0x31c>)
    1cf6:	681b      	ldr	r3, [r3, #0]
    1cf8:	f003 031f 	and.w	r3, r3, #31
    1cfc:	4a09      	ldr	r2, [pc, #36]	; (1d24 <USART1_handler+0x31c>)
    1cfe:	6013      	str	r3, [r2, #0]
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    1d00:	e006      	b.n	1d10 <USART1_handler+0x308>
					if (c){
						queue[tail++]=c;
						tail&=QUEUE_SIZE-1;
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    1d02:	4b06      	ldr	r3, [pc, #24]	; (1d1c <USART1_handler+0x314>)
    1d04:	681b      	ldr	r3, [r3, #0]
    1d06:	f023 0303 	bic.w	r3, r3, #3
    1d0a:	4a04      	ldr	r2, [pc, #16]	; (1d1c <USART1_handler+0x314>)
    1d0c:	6013      	str	r3, [r2, #0]
			}
			break;
    1d0e:	bf00      	nop
		}
	}
}
    1d10:	3710      	adds	r7, #16
    1d12:	46bd      	mov	sp, r7
    1d14:	bd80      	pop	{r7, pc}
    1d16:	bf00      	nop
    1d18:	00002bc8 	.word	0x00002bc8
    1d1c:	2000010c 	.word	0x2000010c
    1d20:	00002c54 	.word	0x00002c54
    1d24:	20000108 	.word	0x20000108
    1d28:	200000e4 	.word	0x200000e4

00001d2c <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    1d2c:	b480      	push	{r7}
    1d2e:	b083      	sub	sp, #12
    1d30:	af00      	add	r7, sp, #0
    1d32:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    1d34:	687b      	ldr	r3, [r7, #4]
    1d36:	2b3b      	cmp	r3, #59	; 0x3b
    1d38:	d900      	bls.n	1d3c <enable_interrupt+0x10>
    1d3a:	e016      	b.n	1d6a <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    1d3c:	687b      	ldr	r3, [r7, #4]
    1d3e:	095b      	lsrs	r3, r3, #5
    1d40:	009b      	lsls	r3, r3, #2
    1d42:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    1d46:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    1d4a:	687a      	ldr	r2, [r7, #4]
    1d4c:	0952      	lsrs	r2, r2, #5
    1d4e:	0092      	lsls	r2, r2, #2
    1d50:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    1d54:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    1d58:	6812      	ldr	r2, [r2, #0]
    1d5a:	6879      	ldr	r1, [r7, #4]
    1d5c:	f001 011f 	and.w	r1, r1, #31
    1d60:	2001      	movs	r0, #1
    1d62:	fa00 f101 	lsl.w	r1, r0, r1
    1d66:	430a      	orrs	r2, r1
    1d68:	601a      	str	r2, [r3, #0]
}
    1d6a:	370c      	adds	r7, #12
    1d6c:	46bd      	mov	sp, r7
    1d6e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1d72:	4770      	bx	lr

00001d74 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    1d74:	b480      	push	{r7}
    1d76:	b083      	sub	sp, #12
    1d78:	af00      	add	r7, sp, #0
    1d7a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    1d7c:	687b      	ldr	r3, [r7, #4]
    1d7e:	2b3b      	cmp	r3, #59	; 0x3b
    1d80:	d900      	bls.n	1d84 <disable_interrupt+0x10>
    1d82:	e013      	b.n	1dac <disable_interrupt+0x38>
	ICER[irq>>5]&=~(1<<(irq&0x1f));
    1d84:	687b      	ldr	r3, [r7, #4]
    1d86:	095b      	lsrs	r3, r3, #5
    1d88:	009a      	lsls	r2, r3, #2
    1d8a:	4b0b      	ldr	r3, [pc, #44]	; (1db8 <disable_interrupt+0x44>)
    1d8c:	4413      	add	r3, r2
    1d8e:	687a      	ldr	r2, [r7, #4]
    1d90:	0952      	lsrs	r2, r2, #5
    1d92:	0091      	lsls	r1, r2, #2
    1d94:	4a08      	ldr	r2, [pc, #32]	; (1db8 <disable_interrupt+0x44>)
    1d96:	440a      	add	r2, r1
    1d98:	6812      	ldr	r2, [r2, #0]
    1d9a:	6879      	ldr	r1, [r7, #4]
    1d9c:	f001 011f 	and.w	r1, r1, #31
    1da0:	2001      	movs	r0, #1
    1da2:	fa00 f101 	lsl.w	r1, r0, r1
    1da6:	43c9      	mvns	r1, r1
    1da8:	400a      	ands	r2, r1
    1daa:	601a      	str	r2, [r3, #0]
}
    1dac:	370c      	adds	r7, #12
    1dae:	46bd      	mov	sp, r7
    1db0:	f85d 7b04 	ldr.w	r7, [sp], #4
    1db4:	4770      	bx	lr
    1db6:	bf00      	nop
    1db8:	e000e180 	.word	0xe000e180

00001dbc <set_int_priority>:



void set_int_priority(int32_t irq, unsigned priority){
    1dbc:	b480      	push	{r7}
    1dbe:	b083      	sub	sp, #12
    1dc0:	af00      	add	r7, sp, #0
    1dc2:	6078      	str	r0, [r7, #4]
    1dc4:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    1dc6:	687b      	ldr	r3, [r7, #4]
    1dc8:	2b00      	cmp	r3, #0
    1dca:	db0d      	blt.n	1de8 <set_int_priority+0x2c>
    1dcc:	687b      	ldr	r3, [r7, #4]
    1dce:	2b3b      	cmp	r3, #59	; 0x3b
    1dd0:	dc0a      	bgt.n	1de8 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    1dd2:	687b      	ldr	r3, [r7, #4]
    1dd4:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    1dd8:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    1ddc:	683a      	ldr	r2, [r7, #0]
    1dde:	b2d2      	uxtb	r2, r2
    1de0:	0112      	lsls	r2, r2, #4
    1de2:	b2d2      	uxtb	r2, r2
    1de4:	701a      	strb	r2, [r3, #0]
    1de6:	e012      	b.n	1e0e <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    1de8:	687b      	ldr	r3, [r7, #4]
    1dea:	2b00      	cmp	r3, #0
    1dec:	da0f      	bge.n	1e0e <set_int_priority+0x52>
    1dee:	687b      	ldr	r3, [r7, #4]
    1df0:	f113 0f0f 	cmn.w	r3, #15
    1df4:	db0b      	blt.n	1e0e <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    1df6:	687a      	ldr	r2, [r7, #4]
    1df8:	f06f 0303 	mvn.w	r3, #3
    1dfc:	1a9b      	subs	r3, r3, r2
    1dfe:	461a      	mov	r2, r3
    1e00:	4b05      	ldr	r3, [pc, #20]	; (1e18 <set_int_priority+0x5c>)
    1e02:	4413      	add	r3, r2
    1e04:	683a      	ldr	r2, [r7, #0]
    1e06:	b2d2      	uxtb	r2, r2
    1e08:	0112      	lsls	r2, r2, #4
    1e0a:	b2d2      	uxtb	r2, r2
    1e0c:	701a      	strb	r2, [r3, #0]
	}
}
    1e0e:	370c      	adds	r7, #12
    1e10:	46bd      	mov	sp, r7
    1e12:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e16:	4770      	bx	lr
    1e18:	e000ed18 	.word	0xe000ed18

00001e1c <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    1e1c:	b480      	push	{r7}
    1e1e:	b083      	sub	sp, #12
    1e20:	af00      	add	r7, sp, #0
    1e22:	6078      	str	r0, [r7, #4]
    1e24:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    1e26:	687b      	ldr	r3, [r7, #4]
    1e28:	881b      	ldrh	r3, [r3, #0]
    1e2a:	b29b      	uxth	r3, r3
    1e2c:	f423 63e0 	bic.w	r3, r3, #1792	; 0x700
    1e30:	b29a      	uxth	r2, r3
    1e32:	687b      	ldr	r3, [r7, #4]
    1e34:	801a      	strh	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    1e36:	687b      	ldr	r3, [r7, #4]
    1e38:	881b      	ldrh	r3, [r3, #0]
    1e3a:	b29a      	uxth	r2, r3
    1e3c:	683b      	ldr	r3, [r7, #0]
    1e3e:	b29b      	uxth	r3, r3
    1e40:	00db      	lsls	r3, r3, #3
    1e42:	b29b      	uxth	r3, r3
    1e44:	4313      	orrs	r3, r2
    1e46:	b29a      	uxth	r2, r3
    1e48:	687b      	ldr	r3, [r7, #4]
    1e4a:	801a      	strh	r2, [r3, #0]
}
    1e4c:	370c      	adds	r7, #12
    1e4e:	46bd      	mov	sp, r7
    1e50:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e54:	4770      	bx	lr
    1e56:	bf00      	nop

00001e58 <spi_init>:


void spi_init(spi_sfr_t* channel, unsigned baud){
    1e58:	b580      	push	{r7, lr}
    1e5a:	b082      	sub	sp, #8
    1e5c:	af00      	add	r7, sp, #0
    1e5e:	6078      	str	r0, [r7, #4]
    1e60:	6039      	str	r1, [r7, #0]
	spi_baudrate(channel,baud);
    1e62:	6878      	ldr	r0, [r7, #4]
    1e64:	6839      	ldr	r1, [r7, #0]
    1e66:	f7ff ffd9 	bl	1e1c <spi_baudrate>
	channel->CR1=SPI_CR1_MSTR|SPI_CR1_SSM;
    1e6a:	687b      	ldr	r3, [r7, #4]
    1e6c:	f44f 7201 	mov.w	r2, #516	; 0x204
    1e70:	801a      	strh	r2, [r3, #0]
	//channel->CR2|=SPI_CR2_SSOE;
	if (channel==SPI1){
    1e72:	687b      	ldr	r3, [r7, #4]
    1e74:	4a17      	ldr	r2, [pc, #92]	; (1ed4 <spi_init+0x7c>)
    1e76:	4293      	cmp	r3, r2
    1e78:	d114      	bne.n	1ea4 <spi_init+0x4c>
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(GPIOA,4,OUTPUT_PP_FAST);
    1e7a:	2000      	movs	r0, #0
    1e7c:	2104      	movs	r1, #4
    1e7e:	2203      	movs	r2, #3
    1e80:	f7ff fd22 	bl	18c8 <config_pin>
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(GPIOA,5,OUTPUT_PP_FAST);
    1e84:	2000      	movs	r0, #0
    1e86:	2105      	movs	r1, #5
    1e88:	2203      	movs	r2, #3
    1e8a:	f7ff fd1d 	bl	18c8 <config_pin>
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(GPIOA,6,INPUT_FLOAT);
    1e8e:	2000      	movs	r0, #0
    1e90:	2106      	movs	r1, #6
    1e92:	2204      	movs	r2, #4
    1e94:	f7ff fd18 	bl	18c8 <config_pin>
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(GPIOA,7,OUTPUT_PP_FAST);
    1e98:	2000      	movs	r0, #0
    1e9a:	2107      	movs	r1, #7
    1e9c:	2203      	movs	r2, #3
    1e9e:	f7ff fd13 	bl	18c8 <config_pin>
    1ea2:	e013      	b.n	1ecc <spi_init+0x74>
	}else{
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(GPIOB,2,OUTPUT_PP_FAST);
    1ea4:	2001      	movs	r0, #1
    1ea6:	2102      	movs	r1, #2
    1ea8:	2203      	movs	r2, #3
    1eaa:	f7ff fd0d 	bl	18c8 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(GPIOB,13,OUTPUT_PP_FAST);
    1eae:	2001      	movs	r0, #1
    1eb0:	210d      	movs	r1, #13
    1eb2:	2203      	movs	r2, #3
    1eb4:	f7ff fd08 	bl	18c8 <config_pin>
		// PB14 MISO input (floating)
		config_pin(GPIOB,14,INPUT_FLOAT);
    1eb8:	2001      	movs	r0, #1
    1eba:	210e      	movs	r1, #14
    1ebc:	2204      	movs	r2, #4
    1ebe:	f7ff fd03 	bl	18c8 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(GPIOB,15,OUTPUT_PP_FAST);
    1ec2:	2001      	movs	r0, #1
    1ec4:	210f      	movs	r1, #15
    1ec6:	2203      	movs	r2, #3
    1ec8:	f7ff fcfe 	bl	18c8 <config_pin>
	}
}
    1ecc:	3708      	adds	r7, #8
    1ece:	46bd      	mov	sp, r7
    1ed0:	bd80      	pop	{r7, pc}
    1ed2:	bf00      	nop
    1ed4:	40013000 	.word	0x40013000

00001ed8 <spi_enable>:

void spi_enable(spi_sfr_t* channel, unsigned mode){
    1ed8:	b480      	push	{r7}
    1eda:	b083      	sub	sp, #12
    1edc:	af00      	add	r7, sp, #0
    1ede:	6078      	str	r0, [r7, #4]
    1ee0:	6039      	str	r1, [r7, #0]
	switch (mode){
    1ee2:	683b      	ldr	r3, [r7, #0]
    1ee4:	2b01      	cmp	r3, #1
    1ee6:	d00d      	beq.n	1f04 <spi_enable+0x2c>
    1ee8:	2b01      	cmp	r3, #1
    1eea:	d302      	bcc.n	1ef2 <spi_enable+0x1a>
    1eec:	2b02      	cmp	r3, #2
    1eee:	d005      	beq.n	1efc <spi_enable+0x24>
    1ef0:	e00d      	b.n	1f0e <spi_enable+0x36>
		case SPI_MODE_READ:
		channel->CR1=SPI_CR1_RXONLY|SPI_CR1_SPE;
    1ef2:	687b      	ldr	r3, [r7, #4]
    1ef4:	f44f 6288 	mov.w	r2, #1088	; 0x440
    1ef8:	801a      	strh	r2, [r3, #0]
		break;
    1efa:	e008      	b.n	1f0e <spi_enable+0x36>
		case SPI_MODE_READ_WRITE:
		channel->CR1=SPI_CR1_SPE;
    1efc:	687b      	ldr	r3, [r7, #4]
    1efe:	2240      	movs	r2, #64	; 0x40
    1f00:	801a      	strh	r2, [r3, #0]
		break;
    1f02:	e004      	b.n	1f0e <spi_enable+0x36>
		case SPI_MODE_WRITE:
		channel->CR1=SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE|SPI_CR1_SPE;
    1f04:	687b      	ldr	r3, [r7, #4]
    1f06:	f24c 0240 	movw	r2, #49216	; 0xc040
    1f0a:	801a      	strh	r2, [r3, #0]
		break;
    1f0c:	bf00      	nop
	}
}
    1f0e:	370c      	adds	r7, #12
    1f10:	46bd      	mov	sp, r7
    1f12:	f85d 7b04 	ldr.w	r7, [sp], #4
    1f16:	4770      	bx	lr

00001f18 <spi_disable>:

void spi_disable(spi_sfr_t* channel){
    1f18:	b480      	push	{r7}
    1f1a:	b083      	sub	sp, #12
    1f1c:	af00      	add	r7, sp, #0
    1f1e:	6078      	str	r0, [r7, #4]
	channel->CR1&=~SPI_CR1_SPE;
    1f20:	687b      	ldr	r3, [r7, #4]
    1f22:	881b      	ldrh	r3, [r3, #0]
    1f24:	b29b      	uxth	r3, r3
    1f26:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    1f2a:	b29a      	uxth	r2, r3
    1f2c:	687b      	ldr	r3, [r7, #4]
    1f2e:	801a      	strh	r2, [r3, #0]
}
    1f30:	370c      	adds	r7, #12
    1f32:	46bd      	mov	sp, r7
    1f34:	f85d 7b04 	ldr.w	r7, [sp], #4
    1f38:	4770      	bx	lr
    1f3a:	bf00      	nop

00001f3c <spi_write>:

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
    1f3c:	b580      	push	{r7, lr}
    1f3e:	b082      	sub	sp, #8
    1f40:	af00      	add	r7, sp, #0
    1f42:	6078      	str	r0, [r7, #4]
    1f44:	460b      	mov	r3, r1
    1f46:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
    1f48:	6878      	ldr	r0, [r7, #4]
    1f4a:	2101      	movs	r1, #1
    1f4c:	f7ff ffc4 	bl	1ed8 <spi_enable>
	channel->DR=b;
    1f50:	78fb      	ldrb	r3, [r7, #3]
    1f52:	b29a      	uxth	r2, r3
    1f54:	687b      	ldr	r3, [r7, #4]
    1f56:	819a      	strh	r2, [r3, #12]
	spi_disable(channel);
    1f58:	6878      	ldr	r0, [r7, #4]
    1f5a:	f7ff ffdd 	bl	1f18 <spi_disable>
}
    1f5e:	3708      	adds	r7, #8
    1f60:	46bd      	mov	sp, r7
    1f62:	bd80      	pop	{r7, pc}

00001f64 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    1f64:	b580      	push	{r7, lr}
    1f66:	b084      	sub	sp, #16
    1f68:	af00      	add	r7, sp, #0
    1f6a:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
    1f6c:	6878      	ldr	r0, [r7, #4]
    1f6e:	2100      	movs	r1, #0
    1f70:	f7ff ffb2 	bl	1ed8 <spi_enable>
	channel->DR=255;
    1f74:	687b      	ldr	r3, [r7, #4]
    1f76:	22ff      	movs	r2, #255	; 0xff
    1f78:	819a      	strh	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    1f7a:	bf00      	nop
    1f7c:	687b      	ldr	r3, [r7, #4]
    1f7e:	891b      	ldrh	r3, [r3, #8]
    1f80:	b29b      	uxth	r3, r3
    1f82:	f003 0301 	and.w	r3, r3, #1
    1f86:	2b00      	cmp	r3, #0
    1f88:	d0f8      	beq.n	1f7c <spi_read+0x18>
	rx=(uint8_t)channel->DR;
    1f8a:	687b      	ldr	r3, [r7, #4]
    1f8c:	899b      	ldrh	r3, [r3, #12]
    1f8e:	b29b      	uxth	r3, r3
    1f90:	73fb      	strb	r3, [r7, #15]
	spi_disable(channel);
    1f92:	6878      	ldr	r0, [r7, #4]
    1f94:	f7ff ffc0 	bl	1f18 <spi_disable>
	return rx;
    1f98:	7bfb      	ldrb	r3, [r7, #15]
}
    1f9a:	4618      	mov	r0, r3
    1f9c:	3710      	adds	r7, #16
    1f9e:	46bd      	mov	sp, r7
    1fa0:	bd80      	pop	{r7, pc}
    1fa2:	bf00      	nop

00001fa4 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    1fa4:	b580      	push	{r7, lr}
    1fa6:	b084      	sub	sp, #16
    1fa8:	af00      	add	r7, sp, #0
    1faa:	60f8      	str	r0, [r7, #12]
    1fac:	60b9      	str	r1, [r7, #8]
    1fae:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_WRITE);
    1fb0:	68f8      	ldr	r0, [r7, #12]
    1fb2:	2101      	movs	r1, #1
    1fb4:	f7ff ff90 	bl	1ed8 <spi_enable>
	while (count){
    1fb8:	e011      	b.n	1fde <spi_block_write+0x3a>
		channel->DR=*buffer++;
    1fba:	68bb      	ldr	r3, [r7, #8]
    1fbc:	1c5a      	adds	r2, r3, #1
    1fbe:	60ba      	str	r2, [r7, #8]
    1fc0:	781b      	ldrb	r3, [r3, #0]
    1fc2:	b29a      	uxth	r2, r3
    1fc4:	68fb      	ldr	r3, [r7, #12]
    1fc6:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    1fc8:	bf00      	nop
    1fca:	68fb      	ldr	r3, [r7, #12]
    1fcc:	891b      	ldrh	r3, [r3, #8]
    1fce:	b29b      	uxth	r3, r3
    1fd0:	f003 0302 	and.w	r3, r3, #2
    1fd4:	2b00      	cmp	r3, #0
    1fd6:	d0f8      	beq.n	1fca <spi_block_write+0x26>
		count--;
    1fd8:	687b      	ldr	r3, [r7, #4]
    1fda:	3b01      	subs	r3, #1
    1fdc:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_enable(channel,SPI_MODE_WRITE);
	while (count){
    1fde:	687b      	ldr	r3, [r7, #4]
    1fe0:	2b00      	cmp	r3, #0
    1fe2:	d1ea      	bne.n	1fba <spi_block_write+0x16>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	spi_disable(channel);
    1fe4:	68f8      	ldr	r0, [r7, #12]
    1fe6:	f7ff ff97 	bl	1f18 <spi_disable>
}
    1fea:	3710      	adds	r7, #16
    1fec:	46bd      	mov	sp, r7
    1fee:	bd80      	pop	{r7, pc}

00001ff0 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    1ff0:	b580      	push	{r7, lr}
    1ff2:	b084      	sub	sp, #16
    1ff4:	af00      	add	r7, sp, #0
    1ff6:	60f8      	str	r0, [r7, #12]
    1ff8:	60b9      	str	r1, [r7, #8]
    1ffa:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_READ);
    1ffc:	68f8      	ldr	r0, [r7, #12]
    1ffe:	2100      	movs	r1, #0
    2000:	f7ff ff6a 	bl	1ed8 <spi_enable>
	while (count){
    2004:	e015      	b.n	2032 <spi_block_read+0x42>
		channel->DR=0;
    2006:	68fb      	ldr	r3, [r7, #12]
    2008:	2200      	movs	r2, #0
    200a:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    200c:	bf00      	nop
    200e:	68fb      	ldr	r3, [r7, #12]
    2010:	891b      	ldrh	r3, [r3, #8]
    2012:	b29b      	uxth	r3, r3
    2014:	f003 0301 	and.w	r3, r3, #1
    2018:	2b00      	cmp	r3, #0
    201a:	d0f8      	beq.n	200e <spi_block_read+0x1e>
		*buffer++=(uint8_t)channel->DR;
    201c:	68bb      	ldr	r3, [r7, #8]
    201e:	1c5a      	adds	r2, r3, #1
    2020:	60ba      	str	r2, [r7, #8]
    2022:	68fa      	ldr	r2, [r7, #12]
    2024:	8992      	ldrh	r2, [r2, #12]
    2026:	b292      	uxth	r2, r2
    2028:	b2d2      	uxtb	r2, r2
    202a:	701a      	strb	r2, [r3, #0]
		count--;
    202c:	687b      	ldr	r3, [r7, #4]
    202e:	3b01      	subs	r3, #1
    2030:	607b      	str	r3, [r7, #4]
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_enable(channel,SPI_MODE_READ);
	while (count){
    2032:	687b      	ldr	r3, [r7, #4]
    2034:	2b00      	cmp	r3, #0
    2036:	d1e6      	bne.n	2006 <spi_block_read+0x16>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
	spi_disable(channel);
    2038:	68f8      	ldr	r0, [r7, #12]
    203a:	f7ff ff6d 	bl	1f18 <spi_disable>
}
    203e:	3710      	adds	r7, #16
    2040:	46bd      	mov	sp, r7
    2042:	bd80      	pop	{r7, pc}

00002044 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    2044:	4b01      	ldr	r3, [pc, #4]	; (204c <reset_mcu+0x8>)
    2046:	4a02      	ldr	r2, [pc, #8]	; (2050 <reset_mcu+0xc>)
    2048:	601a      	str	r2, [r3, #0]
    204a:	bf00      	nop
    204c:	e000ed0c 	.word	0xe000ed0c
    2050:	05fa0004 	.word	0x05fa0004

00002054 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    2054:	b580      	push	{r7, lr}
    2056:	b082      	sub	sp, #8
    2058:	af00      	add	r7, sp, #0
    205a:	6078      	str	r0, [r7, #4]
    205c:	6039      	str	r1, [r7, #0]
	print(msg);
    205e:	6878      	ldr	r0, [r7, #4]
    2060:	f7ff f86a 	bl	1138 <print>
	print("at address ");
    2064:	4814      	ldr	r0, [pc, #80]	; (20b8 <print_fault+0x64>)
    2066:	f7ff f867 	bl	1138 <print>
	if (adr) {
    206a:	683b      	ldr	r3, [r7, #0]
    206c:	2b00      	cmp	r3, #0
    206e:	d002      	beq.n	2076 <print_fault+0x22>
		print_hex(adr);
    2070:	6838      	ldr	r0, [r7, #0]
    2072:	f7ff f9cf 	bl	1414 <print_hex>
	};
	conout(CR);
    2076:	200d      	movs	r0, #13
    2078:	f7ff f82c 	bl	10d4 <conout>
	print("UFSR=");
    207c:	480f      	ldr	r0, [pc, #60]	; (20bc <print_fault+0x68>)
    207e:	f7ff f85b 	bl	1138 <print>
	print_hex(CFSR->fsr.usageFalt);
    2082:	4b0f      	ldr	r3, [pc, #60]	; (20c0 <print_fault+0x6c>)
    2084:	681b      	ldr	r3, [r3, #0]
    2086:	0c1b      	lsrs	r3, r3, #16
    2088:	b29b      	uxth	r3, r3
    208a:	4618      	mov	r0, r3
    208c:	f7ff f9c2 	bl	1414 <print_hex>
	print(", BFSR=");
    2090:	480c      	ldr	r0, [pc, #48]	; (20c4 <print_fault+0x70>)
    2092:	f7ff f851 	bl	1138 <print>
	print_hex(CFSR->fsr.busFault);
    2096:	4b0a      	ldr	r3, [pc, #40]	; (20c0 <print_fault+0x6c>)
    2098:	681b      	ldr	r3, [r3, #0]
    209a:	0a1b      	lsrs	r3, r3, #8
    209c:	b2db      	uxtb	r3, r3
    209e:	4618      	mov	r0, r3
    20a0:	f7ff f9b8 	bl	1414 <print_hex>
	print(", MMFSR=");
    20a4:	4808      	ldr	r0, [pc, #32]	; (20c8 <print_fault+0x74>)
    20a6:	f7ff f847 	bl	1138 <print>
	print_hex(CFSR->fsr.mmFault);
    20aa:	4b05      	ldr	r3, [pc, #20]	; (20c0 <print_fault+0x6c>)
    20ac:	681b      	ldr	r3, [r3, #0]
    20ae:	b2db      	uxtb	r3, r3
    20b0:	4618      	mov	r0, r3
    20b2:	f7ff f9af 	bl	1414 <print_hex>
	while(1);
    20b6:	e7fe      	b.n	20b6 <print_fault+0x62>
    20b8:	00002c80 	.word	0x00002c80
    20bc:	00002c8c 	.word	0x00002c8c
    20c0:	e000ed28 	.word	0xe000ed28
    20c4:	00002c94 	.word	0x00002c94
    20c8:	00002c9c 	.word	0x00002c9c

000020cc <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    20cc:	b480      	push	{r7}
    20ce:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    20d0:	2300      	movs	r3, #0
    20d2:	2200      	movs	r2, #0
    20d4:	4618      	mov	r0, r3
    20d6:	4611      	mov	r1, r2
    20d8:	df02      	svc	2
}
    20da:	46bd      	mov	sp, r7
    20dc:	f85d 7b04 	ldr.w	r7, [sp], #4
    20e0:	4770      	bx	lr
    20e2:	bf00      	nop

000020e4 <tvout_init>:

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
    20e4:	b580      	push	{r7, lr}
    20e6:	b082      	sub	sp, #8
    20e8:	af00      	add	r7, sp, #0
	video_bb = (uint32_t*)(0x22000000+(((unsigned int)video_buffer&0x7ffff)<<5)); 
    20ea:	4b54      	ldr	r3, [pc, #336]	; (223c <tvout_init+0x158>)
    20ec:	f3c3 0312 	ubfx	r3, r3, #0, #19
    20f0:	015b      	lsls	r3, r3, #5
    20f2:	f103 5308 	add.w	r3, r3, #570425344	; 0x22000000
    20f6:	461a      	mov	r2, r3
    20f8:	4b51      	ldr	r3, [pc, #324]	; (2240 <tvout_init+0x15c>)
    20fa:	601a      	str	r2, [r3, #0]
	//sortie sync sur PA8
	config_pin(GPIOA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    20fc:	2000      	movs	r0, #0
    20fe:	2108      	movs	r1, #8
    2100:	220a      	movs	r2, #10
    2102:	f7ff fbe1 	bl	18c8 <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(GPIOB,15,OUTPUT_ALT_PP_FAST);
    2106:	2001      	movs	r0, #1
    2108:	210f      	movs	r1, #15
    210a:	220b      	movs	r2, #11
    210c:	f7ff fbdc 	bl	18c8 <config_pin>
	PORTB->BRR=BIT15;
    2110:	4b4c      	ldr	r3, [pc, #304]	; (2244 <tvout_init+0x160>)
    2112:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    2116:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	APB2ENR->fld.tim1en=1;
    2118:	4b4b      	ldr	r3, [pc, #300]	; (2248 <tvout_init+0x164>)
    211a:	681a      	ldr	r2, [r3, #0]
    211c:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
    2120:	601a      	str	r2, [r3, #0]
	// clock source division
	*TIMER1_PSC=0;
    2122:	4b4a      	ldr	r3, [pc, #296]	; (224c <tvout_init+0x168>)
    2124:	2200      	movs	r2, #0
    2126:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    2128:	4b49      	ldr	r3, [pc, #292]	; (2250 <tvout_init+0x16c>)
    212a:	f640 72ff 	movw	r2, #4095	; 0xfff
    212e:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    2130:	4b48      	ldr	r3, [pc, #288]	; (2254 <tvout_init+0x170>)
    2132:	f240 122b 	movw	r2, #299	; 0x12b
    2136:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    2138:	4b47      	ldr	r3, [pc, #284]	; (2258 <tvout_init+0x174>)
    213a:	681a      	ldr	r2, [r3, #0]
    213c:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    2140:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    2144:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    2146:	4b44      	ldr	r3, [pc, #272]	; (2258 <tvout_init+0x174>)
    2148:	681a      	ldr	r2, [r3, #0]
    214a:	f042 0208 	orr.w	r2, r2, #8
    214e:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    2150:	4b42      	ldr	r3, [pc, #264]	; (225c <tvout_init+0x178>)
    2152:	681a      	ldr	r2, [r3, #0]
    2154:	f042 0201 	orr.w	r2, r2, #1
    2158:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    215a:	4b40      	ldr	r3, [pc, #256]	; (225c <tvout_init+0x178>)
    215c:	681a      	ldr	r2, [r3, #0]
    215e:	f042 0202 	orr.w	r2, r2, #2
    2162:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    2164:	4a3e      	ldr	r2, [pc, #248]	; (2260 <tvout_init+0x17c>)
    2166:	8813      	ldrh	r3, [r2, #0]
    2168:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    216c:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    2170:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    2172:	4b3c      	ldr	r3, [pc, #240]	; (2264 <tvout_init+0x180>)
    2174:	681a      	ldr	r2, [r3, #0]
    2176:	f042 0201 	orr.w	r2, r2, #1
    217a:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    217c:	4b3a      	ldr	r3, [pc, #232]	; (2268 <tvout_init+0x184>)
    217e:	f640 324c 	movw	r2, #2892	; 0xb4c
    2182:	801a      	strh	r2, [r3, #0]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    2184:	4b39      	ldr	r3, [pc, #228]	; (226c <tvout_init+0x188>)
    2186:	f243 5292 	movw	r2, #13714	; 0x3592
    218a:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    218c:	4b37      	ldr	r3, [pc, #220]	; (226c <tvout_init+0x188>)
    218e:	4a38      	ldr	r2, [pc, #224]	; (2270 <tvout_init+0x18c>)
    2190:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    2192:	4a35      	ldr	r2, [pc, #212]	; (2268 <tvout_init+0x184>)
    2194:	4b34      	ldr	r3, [pc, #208]	; (2268 <tvout_init+0x184>)
    2196:	889b      	ldrh	r3, [r3, #4]
    2198:	b29b      	uxth	r3, r3
    219a:	f043 0302 	orr.w	r3, r3, #2
    219e:	b29b      	uxth	r3, r3
    21a0:	8093      	strh	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,7);
    21a2:	200f      	movs	r0, #15
    21a4:	2107      	movs	r1, #7
    21a6:	f7ff fe09 	bl	1dbc <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    21aa:	200f      	movs	r0, #15
    21ac:	f7ff fdbe 	bl	1d2c <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    21b0:	4b30      	ldr	r3, [pc, #192]	; (2274 <tvout_init+0x190>)
    21b2:	681a      	ldr	r2, [r3, #0]
    21b4:	f042 0202 	orr.w	r2, r2, #2
    21b8:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,7);
    21ba:	201b      	movs	r0, #27
    21bc:	2107      	movs	r1, #7
    21be:	f7ff fdfd 	bl	1dbc <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    21c2:	201b      	movs	r0, #27
    21c4:	f7ff fdb2 	bl	1d2c <enable_interrupt>
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    21c8:	2300      	movs	r3, #0
    21ca:	607b      	str	r3, [r7, #4]
    21cc:	e011      	b.n	21f2 <tvout_init+0x10e>
		video_buffer[i]=0xffff;
    21ce:	4a1b      	ldr	r2, [pc, #108]	; (223c <tvout_init+0x158>)
    21d0:	687b      	ldr	r3, [r7, #4]
    21d2:	f64f 71ff 	movw	r1, #65535	; 0xffff
    21d6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
    21da:	687b      	ldr	r3, [r7, #4]
    21dc:	f503 5395 	add.w	r3, r3, #4768	; 0x12a0
    21e0:	330c      	adds	r3, #12
    21e2:	4a16      	ldr	r2, [pc, #88]	; (223c <tvout_init+0x158>)
    21e4:	f64f 71ff 	movw	r1, #65535	; 0xffff
    21e8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,7);
	enable_interrupt(IRQ_TIM1_CC);
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    21ec:	687b      	ldr	r3, [r7, #4]
    21ee:	3301      	adds	r3, #1
    21f0:	607b      	str	r3, [r7, #4]
    21f2:	687b      	ldr	r3, [r7, #4]
    21f4:	2b13      	cmp	r3, #19
    21f6:	ddea      	ble.n	21ce <tvout_init+0xea>
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    21f8:	2301      	movs	r3, #1
    21fa:	607b      	str	r3, [r7, #4]
    21fc:	e018      	b.n	2230 <tvout_init+0x14c>
		video_buffer[i*ROW_SIZE]=0x8000;
    21fe:	687a      	ldr	r2, [r7, #4]
    2200:	4613      	mov	r3, r2
    2202:	009b      	lsls	r3, r3, #2
    2204:	4413      	add	r3, r2
    2206:	009b      	lsls	r3, r3, #2
    2208:	461a      	mov	r2, r3
    220a:	4b0c      	ldr	r3, [pc, #48]	; (223c <tvout_init+0x158>)
    220c:	f44f 4100 	mov.w	r1, #32768	; 0x8000
    2210:	f823 1012 	strh.w	r1, [r3, r2, lsl #1]
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
    2214:	687b      	ldr	r3, [r7, #4]
    2216:	1c5a      	adds	r2, r3, #1
    2218:	4613      	mov	r3, r2
    221a:	009b      	lsls	r3, r3, #2
    221c:	4413      	add	r3, r2
    221e:	009b      	lsls	r3, r3, #2
    2220:	3b01      	subs	r3, #1
    2222:	4a06      	ldr	r2, [pc, #24]	; (223c <tvout_init+0x158>)
    2224:	2101      	movs	r1, #1
    2226:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i;
	for (i=0;i<ROW_SIZE;i++){
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    222a:	687b      	ldr	r3, [r7, #4]
    222c:	3301      	adds	r3, #1
    222e:	607b      	str	r3, [r7, #4]
    2230:	687b      	ldr	r3, [r7, #4]
    2232:	2bed      	cmp	r3, #237	; 0xed
    2234:	dde3      	ble.n	21fe <tvout_init+0x11a>
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	// test end
 }
    2236:	3708      	adds	r7, #8
    2238:	46bd      	mov	sp, r7
    223a:	bd80      	pop	{r7, pc}
    223c:	20000120 	.word	0x20000120
    2240:	2000011c 	.word	0x2000011c
    2244:	40010c00 	.word	0x40010c00
    2248:	40021018 	.word	0x40021018
    224c:	40012c28 	.word	0x40012c28
    2250:	40012c2c 	.word	0x40012c2c
    2254:	40012c34 	.word	0x40012c34
    2258:	40012c18 	.word	0x40012c18
    225c:	40012c20 	.word	0x40012c20
    2260:	40012c44 	.word	0x40012c44
    2264:	40012c00 	.word	0x40012c00
    2268:	40003800 	.word	0x40003800
    226c:	40020058 	.word	0x40020058
    2270:	4000380c 	.word	0x4000380c
    2274:	40012c0c 	.word	0x40012c0c

00002278 <TIM1_CC_handler>:
__attribute__((optimize("-Os"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
    2278:	4a40      	ldr	r2, [pc, #256]	; (237c <TIM1_CC_handler+0x104>)
	TIMER1_SR->fld.cc1if=0;
    227a:	4941      	ldr	r1, [pc, #260]	; (2380 <TIM1_CC_handler+0x108>)
__attribute__((optimize("-Os"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
    227c:	6813      	ldr	r3, [r2, #0]
    227e:	3301      	adds	r3, #1
    2280:	6013      	str	r3, [r2, #0]
	TIMER1_SR->fld.cc1if=0;
    2282:	680b      	ldr	r3, [r1, #0]
    2284:	f023 0302 	bic.w	r3, r3, #2
    2288:	600b      	str	r3, [r1, #0]
	switch(line_count){
    228a:	6813      	ldr	r3, [r2, #0]
    228c:	4611      	mov	r1, r2
    228e:	2b12      	cmp	r3, #18
    2290:	d03b      	beq.n	230a <TIM1_CC_handler+0x92>
    2292:	dc13      	bgt.n	22bc <TIM1_CC_handler+0x44>
    2294:	2b06      	cmp	r3, #6
    2296:	d021      	beq.n	22dc <TIM1_CC_handler+0x64>
    2298:	dc0b      	bgt.n	22b2 <TIM1_CC_handler+0x3a>
    229a:	2b00      	cmp	r3, #0
    229c:	d150      	bne.n	2340 <TIM1_CC_handler+0xc8>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    229e:	4a39      	ldr	r2, [pc, #228]	; (2384 <TIM1_CC_handler+0x10c>)
    22a0:	8813      	ldrh	r3, [r2, #0]
    22a2:	f3c3 034e 	ubfx	r3, r3, #1, #15
    22a6:	8013      	strh	r3, [r2, #0]
		*TIMER1_CCR1/=2;
    22a8:	8913      	ldrh	r3, [r2, #8]
    22aa:	f3c3 034e 	ubfx	r3, r3, #1, #15
    22ae:	8113      	strh	r3, [r2, #8]
		break;
    22b0:	4770      	bx	lr
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    22b2:	2b0c      	cmp	r3, #12
    22b4:	d017      	beq.n	22e6 <TIM1_CC_handler+0x6e>
    22b6:	2b11      	cmp	r3, #17
    22b8:	d01b      	beq.n	22f2 <TIM1_CC_handler+0x7a>
    22ba:	e041      	b.n	2340 <TIM1_CC_handler+0xc8>
    22bc:	f5b3 7f96 	cmp.w	r3, #300	; 0x12c
    22c0:	d028      	beq.n	2314 <TIM1_CC_handler+0x9c>
    22c2:	dc03      	bgt.n	22cc <TIM1_CC_handler+0x54>
    22c4:	2b3b      	cmp	r3, #59	; 0x3b
    22c6:	d13b      	bne.n	2340 <TIM1_CC_handler+0xc8>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    22c8:	2201      	movs	r2, #1
    22ca:	e024      	b.n	2316 <TIM1_CC_handler+0x9e>
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    22cc:	f240 1041 	movw	r0, #321	; 0x141
    22d0:	4283      	cmp	r3, r0
    22d2:	d022      	beq.n	231a <TIM1_CC_handler+0xa2>
    22d4:	f5b3 7fa1 	cmp.w	r3, #322	; 0x142
    22d8:	d024      	beq.n	2324 <TIM1_CC_handler+0xac>
    22da:	e031      	b.n	2340 <TIM1_CC_handler+0xc8>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    22dc:	f240 7269 	movw	r2, #1897	; 0x769
    22e0:	4b29      	ldr	r3, [pc, #164]	; (2388 <TIM1_CC_handler+0x110>)
    22e2:	801a      	strh	r2, [r3, #0]
	    break;
    22e4:	4770      	bx	lr
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    22e6:	f240 72ff 	movw	r2, #2047	; 0x7ff
    22ea:	4b26      	ldr	r3, [pc, #152]	; (2384 <TIM1_CC_handler+0x10c>)
    22ec:	801a      	strh	r2, [r3, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    22ee:	2295      	movs	r2, #149	; 0x95
    22f0:	e009      	b.n	2306 <TIM1_CC_handler+0x8e>
		break;
	case 17: // fin sync champ paire
		if (even){
    22f2:	4b26      	ldr	r3, [pc, #152]	; (238c <TIM1_CC_handler+0x114>)
    22f4:	681b      	ldr	r3, [r3, #0]
    22f6:	2b00      	cmp	r3, #0
    22f8:	d03f      	beq.n	237a <TIM1_CC_handler+0x102>
			*TIMER1_ARR=(FCLK/HFREQ-1);
    22fa:	f640 72ff 	movw	r2, #4095	; 0xfff
    22fe:	4b21      	ldr	r3, [pc, #132]	; (2384 <TIM1_CC_handler+0x10c>)
    2300:	801a      	strh	r2, [r3, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    2302:	f240 122b 	movw	r2, #299	; 0x12b
    2306:	811a      	strh	r2, [r3, #8]
    2308:	4770      	bx	lr
		}
		break;
	case 18: // fin vsync
		if (!even){
    230a:	4b20      	ldr	r3, [pc, #128]	; (238c <TIM1_CC_handler+0x114>)
    230c:	681b      	ldr	r3, [r3, #0]
    230e:	2b00      	cmp	r3, #0
    2310:	d133      	bne.n	237a <TIM1_CC_handler+0x102>
    2312:	e7f2      	b.n	22fa <TIM1_CC_handler+0x82>
	case TOP_LINE-1:
		video=1;
		//_enable_dma();
		break;
	case (TOP_LINE+VRES):
		video=0;
    2314:	2200      	movs	r2, #0
    2316:	4b1e      	ldr	r3, [pc, #120]	; (2390 <TIM1_CC_handler+0x118>)
    2318:	e02e      	b.n	2378 <TIM1_CC_handler+0x100>
		//_disable_dma();
		break;
	case FIELD_END:
		if (!even){
    231a:	4b1c      	ldr	r3, [pc, #112]	; (238c <TIM1_CC_handler+0x114>)
    231c:	6819      	ldr	r1, [r3, #0]
    231e:	2900      	cmp	r1, #0
    2320:	d12b      	bne.n	237a <TIM1_CC_handler+0x102>
    2322:	e007      	b.n	2334 <TIM1_CC_handler+0xbc>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    2324:	4b19      	ldr	r3, [pc, #100]	; (238c <TIM1_CC_handler+0x114>)
    2326:	6819      	ldr	r1, [r3, #0]
    2328:	b339      	cbz	r1, 237a <TIM1_CC_handler+0x102>
			*TIMER1_ARR/=2;
    232a:	4816      	ldr	r0, [pc, #88]	; (2384 <TIM1_CC_handler+0x10c>)
    232c:	8801      	ldrh	r1, [r0, #0]
    232e:	f3c1 014e 	ubfx	r1, r1, #1, #15
    2332:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    2334:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    2338:	6011      	str	r1, [r2, #0]
			even=-even;
    233a:	681a      	ldr	r2, [r3, #0]
    233c:	4252      	negs	r2, r2
    233e:	e01b      	b.n	2378 <TIM1_CC_handler+0x100>
		}
	    break;
	default: 
		if (video){
    2340:	4b13      	ldr	r3, [pc, #76]	; (2390 <TIM1_CC_handler+0x118>)
    2342:	681b      	ldr	r3, [r3, #0]
    2344:	b1cb      	cbz	r3, 237a <TIM1_CC_handler+0x102>
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
    2346:	4b13      	ldr	r3, [pc, #76]	; (2394 <TIM1_CC_handler+0x11c>)
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2348:	2028      	movs	r0, #40	; 0x28
		}
	    break;
	default: 
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
    234a:	681a      	ldr	r2, [r3, #0]
    234c:	f022 0201 	bic.w	r2, r2, #1
    2350:	601a      	str	r2, [r3, #0]
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2352:	680a      	ldr	r2, [r1, #0]
    2354:	f1a2 013c 	sub.w	r1, r2, #60	; 0x3c
    2358:	4a0f      	ldr	r2, [pc, #60]	; (2398 <TIM1_CC_handler+0x120>)
    235a:	fb00 2201 	mla	r2, r0, r1, r2
			DMA1[DMACH5].cndtr=ROW_SIZE;
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    235e:	490f      	ldr	r1, [pc, #60]	; (239c <TIM1_CC_handler+0x124>)
	    break;
	default: 
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2360:	60da      	str	r2, [r3, #12]
			DMA1[DMACH5].cndtr=ROW_SIZE;
    2362:	2214      	movs	r2, #20
    2364:	605a      	str	r2, [r3, #4]
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    2366:	880a      	ldrh	r2, [r1, #0]
    2368:	b292      	uxth	r2, r2
    236a:	f5b2 7f7a 	cmp.w	r2, #1000	; 0x3e8
    236e:	d200      	bcs.n	2372 <TIM1_CC_handler+0xfa>
    2370:	e7f9      	b.n	2366 <TIM1_CC_handler+0xee>
			_enable_dma();
    2372:	681a      	ldr	r2, [r3, #0]
    2374:	f042 0201 	orr.w	r2, r2, #1
    2378:	601a      	str	r2, [r3, #0]
    237a:	4770      	bx	lr
    237c:	20000004 	.word	0x20000004
    2380:	40012c10 	.word	0x40012c10
    2384:	40012c2c 	.word	0x40012c2c
    2388:	40012c34 	.word	0x40012c34
    238c:	20000114 	.word	0x20000114
    2390:	20000110 	.word	0x20000110
    2394:	40020058 	.word	0x40020058
    2398:	20000120 	.word	0x20000120
    239c:	40012c24 	.word	0x40012c24

000023a0 <DMA1CH5_handler>:
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
    23a0:	b480      	push	{r7}
    23a2:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    23a4:	4a0a      	ldr	r2, [pc, #40]	; (23d0 <DMA1CH5_handler+0x30>)
    23a6:	4b0a      	ldr	r3, [pc, #40]	; (23d0 <DMA1CH5_handler+0x30>)
    23a8:	685b      	ldr	r3, [r3, #4]
    23aa:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    23ae:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    23b0:	bf00      	nop
    23b2:	4b08      	ldr	r3, [pc, #32]	; (23d4 <DMA1CH5_handler+0x34>)
    23b4:	891b      	ldrh	r3, [r3, #8]
    23b6:	b29b      	uxth	r3, r3
    23b8:	f003 0302 	and.w	r3, r3, #2
    23bc:	2b00      	cmp	r3, #0
    23be:	d0f8      	beq.n	23b2 <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    23c0:	4b04      	ldr	r3, [pc, #16]	; (23d4 <DMA1CH5_handler+0x34>)
    23c2:	2200      	movs	r2, #0
    23c4:	819a      	strh	r2, [r3, #12]
}
    23c6:	46bd      	mov	sp, r7
    23c8:	f85d 7b04 	ldr.w	r7, [sp], #4
    23cc:	4770      	bx	lr
    23ce:	bf00      	nop
    23d0:	40020000 	.word	0x40020000
    23d4:	40003800 	.word	0x40003800

000023d8 <uart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
    23d8:	b480      	push	{r7}
    23da:	b085      	sub	sp, #20
    23dc:	af00      	add	r7, sp, #0
    23de:	6078      	str	r0, [r7, #4]
    23e0:	6039      	str	r1, [r7, #0]
	sfrp_t brr;
	uint32_t rate;

    brr=(sfrp_t)(channel+USART_BRR_OFS);		
    23e2:	687b      	ldr	r3, [r7, #4]
    23e4:	3308      	adds	r3, #8
    23e6:	60bb      	str	r3, [r7, #8]
	switch (channel){
    23e8:	687b      	ldr	r3, [r7, #4]
    23ea:	4a1a      	ldr	r2, [pc, #104]	; (2454 <uart_set_baud+0x7c>)
    23ec:	4293      	cmp	r3, r2
    23ee:	d019      	beq.n	2424 <uart_set_baud+0x4c>
    23f0:	4a19      	ldr	r2, [pc, #100]	; (2458 <uart_set_baud+0x80>)
    23f2:	4293      	cmp	r3, r2
    23f4:	d003      	beq.n	23fe <uart_set_baud+0x26>
    23f6:	4a19      	ldr	r2, [pc, #100]	; (245c <uart_set_baud+0x84>)
    23f8:	4293      	cmp	r3, r2
    23fa:	d013      	beq.n	2424 <uart_set_baud+0x4c>
    23fc:	e021      	b.n	2442 <uart_set_baud+0x6a>
	case USART1:
		rate=(FAPB2/baud/16)<<4;
    23fe:	4a18      	ldr	r2, [pc, #96]	; (2460 <uart_set_baud+0x88>)
    2400:	683b      	ldr	r3, [r7, #0]
    2402:	fbb2 f3f3 	udiv	r3, r2, r3
    2406:	011b      	lsls	r3, r3, #4
    2408:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    240a:	4a16      	ldr	r2, [pc, #88]	; (2464 <uart_set_baud+0x8c>)
    240c:	683b      	ldr	r3, [r7, #0]
    240e:	fbb2 f3f3 	udiv	r3, r2, r3
    2412:	f003 030f 	and.w	r3, r3, #15
    2416:	68fa      	ldr	r2, [r7, #12]
    2418:	4313      	orrs	r3, r2
    241a:	60fb      	str	r3, [r7, #12]
		*brr=rate;
    241c:	68bb      	ldr	r3, [r7, #8]
    241e:	68fa      	ldr	r2, [r7, #12]
    2420:	601a      	str	r2, [r3, #0]
		return;
    2422:	e011      	b.n	2448 <uart_set_baud+0x70>
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
    2424:	4a10      	ldr	r2, [pc, #64]	; (2468 <uart_set_baud+0x90>)
    2426:	683b      	ldr	r3, [r7, #0]
    2428:	fbb2 f3f3 	udiv	r3, r2, r3
    242c:	011b      	lsls	r3, r3, #4
    242e:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    2430:	4a0e      	ldr	r2, [pc, #56]	; (246c <uart_set_baud+0x94>)
    2432:	683b      	ldr	r3, [r7, #0]
    2434:	fbb2 f3f3 	udiv	r3, r2, r3
    2438:	f003 030f 	and.w	r3, r3, #15
    243c:	68fa      	ldr	r2, [r7, #12]
    243e:	4313      	orrs	r3, r2
    2440:	60fb      	str	r3, [r7, #12]
	}
	*brr=rate;
    2442:	68bb      	ldr	r3, [r7, #8]
    2444:	68fa      	ldr	r2, [r7, #12]
    2446:	601a      	str	r2, [r3, #0]
}
    2448:	3714      	adds	r7, #20
    244a:	46bd      	mov	sp, r7
    244c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2450:	4770      	bx	lr
    2452:	bf00      	nop
    2454:	40004800 	.word	0x40004800
    2458:	40013800 	.word	0x40013800
    245c:	40004400 	.word	0x40004400
    2460:	003d0900 	.word	0x003d0900
    2464:	03d09000 	.word	0x03d09000
    2468:	001e8480 	.word	0x001e8480
    246c:	01e84800 	.word	0x01e84800

00002470 <uart_open_channel>:

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud,unsigned parity, unsigned flow_ctrl){
    2470:	b580      	push	{r7, lr}
    2472:	b086      	sub	sp, #24
    2474:	af00      	add	r7, sp, #0
    2476:	60f8      	str	r0, [r7, #12]
    2478:	60b9      	str	r1, [r7, #8]
    247a:	607a      	str	r2, [r7, #4]
    247c:	603b      	str	r3, [r7, #0]
	sfrp_t cr1, cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
    247e:	68fb      	ldr	r3, [r7, #12]
    2480:	4a44      	ldr	r2, [pc, #272]	; (2594 <uart_open_channel+0x124>)
    2482:	4293      	cmp	r3, r2
    2484:	d044      	beq.n	2510 <uart_open_channel+0xa0>
    2486:	4a44      	ldr	r2, [pc, #272]	; (2598 <uart_open_channel+0x128>)
    2488:	4293      	cmp	r3, r2
    248a:	d003      	beq.n	2494 <uart_open_channel+0x24>
    248c:	4a43      	ldr	r2, [pc, #268]	; (259c <uart_open_channel+0x12c>)
    248e:	4293      	cmp	r3, r2
    2490:	d020      	beq.n	24d4 <uart_open_channel+0x64>
    2492:	e05b      	b.n	254c <uart_open_channel+0xdc>
	case USART1:
		APB2ENR->apb2enr|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
    2494:	4a42      	ldr	r2, [pc, #264]	; (25a0 <uart_open_channel+0x130>)
    2496:	4b42      	ldr	r3, [pc, #264]	; (25a0 <uart_open_channel+0x130>)
    2498:	681b      	ldr	r3, [r3, #0]
    249a:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    249e:	f043 0304 	orr.w	r3, r3, #4
    24a2:	6013      	str	r3, [r2, #0]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    24a4:	4a3f      	ldr	r2, [pc, #252]	; (25a4 <uart_open_channel+0x134>)
    24a6:	4b3f      	ldr	r3, [pc, #252]	; (25a4 <uart_open_channel+0x134>)
    24a8:	681b      	ldr	r3, [r3, #0]
    24aa:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    24ae:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    24b2:	6013      	str	r3, [r2, #0]
		GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    24b4:	4a3b      	ldr	r2, [pc, #236]	; (25a4 <uart_open_channel+0x134>)
    24b6:	4b3b      	ldr	r3, [pc, #236]	; (25a4 <uart_open_channel+0x134>)
    24b8:	681b      	ldr	r3, [r3, #0]
    24ba:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    24be:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    24c2:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART1,7);
    24c4:	2025      	movs	r0, #37	; 0x25
    24c6:	2107      	movs	r1, #7
    24c8:	f7ff fc78 	bl	1dbc <set_int_priority>
		enable_interrupt(USART1_IRQ);
    24cc:	2025      	movs	r0, #37	; 0x25
    24ce:	f7ff fc2d 	bl	1d2c <enable_interrupt>
		break;
    24d2:	e03b      	b.n	254c <uart_open_channel+0xdc>
	case USART2:
		APB1ENR->fld.usart2en=1;
    24d4:	4b34      	ldr	r3, [pc, #208]	; (25a8 <uart_open_channel+0x138>)
    24d6:	681a      	ldr	r2, [r3, #0]
    24d8:	f442 3200 	orr.w	r2, r2, #131072	; 0x20000
    24dc:	601a      	str	r2, [r3, #0]
		APB2ENR->fld.iopaen=1;
    24de:	4b30      	ldr	r3, [pc, #192]	; (25a0 <uart_open_channel+0x130>)
    24e0:	681a      	ldr	r2, [r3, #0]
    24e2:	f042 0204 	orr.w	r2, r2, #4
    24e6:	601a      	str	r2, [r3, #0]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    24e8:	4a30      	ldr	r2, [pc, #192]	; (25ac <uart_open_channel+0x13c>)
    24ea:	4b30      	ldr	r3, [pc, #192]	; (25ac <uart_open_channel+0x13c>)
    24ec:	681b      	ldr	r3, [r3, #0]
    24ee:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    24f2:	6013      	str	r3, [r2, #0]
		GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    24f4:	4a2d      	ldr	r2, [pc, #180]	; (25ac <uart_open_channel+0x13c>)
    24f6:	4b2d      	ldr	r3, [pc, #180]	; (25ac <uart_open_channel+0x13c>)
    24f8:	681b      	ldr	r3, [r3, #0]
    24fa:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    24fe:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART2,7);
    2500:	2026      	movs	r0, #38	; 0x26
    2502:	2107      	movs	r1, #7
    2504:	f7ff fc5a 	bl	1dbc <set_int_priority>
		enable_interrupt(USART2_IRQ);
    2508:	2026      	movs	r0, #38	; 0x26
    250a:	f7ff fc0f 	bl	1d2c <enable_interrupt>
		break;
    250e:	e01d      	b.n	254c <uart_open_channel+0xdc>
	case USART3:
		APB1ENR->fld.usart3en=1;
    2510:	4b25      	ldr	r3, [pc, #148]	; (25a8 <uart_open_channel+0x138>)
    2512:	681a      	ldr	r2, [r3, #0]
    2514:	f442 2280 	orr.w	r2, r2, #262144	; 0x40000
    2518:	601a      	str	r2, [r3, #0]
		APB2ENR->fld.iopben=1;
    251a:	4b21      	ldr	r3, [pc, #132]	; (25a0 <uart_open_channel+0x130>)
    251c:	681a      	ldr	r2, [r3, #0]
    251e:	f042 0208 	orr.w	r2, r2, #8
    2522:	601a      	str	r2, [r3, #0]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    2524:	4a22      	ldr	r2, [pc, #136]	; (25b0 <uart_open_channel+0x140>)
    2526:	4b22      	ldr	r3, [pc, #136]	; (25b0 <uart_open_channel+0x140>)
    2528:	681b      	ldr	r3, [r3, #0]
    252a:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    252e:	6013      	str	r3, [r2, #0]
		GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    2530:	4a1f      	ldr	r2, [pc, #124]	; (25b0 <uart_open_channel+0x140>)
    2532:	4b1f      	ldr	r3, [pc, #124]	; (25b0 <uart_open_channel+0x140>)
    2534:	681b      	ldr	r3, [r3, #0]
    2536:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    253a:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART3,7);
    253c:	2027      	movs	r0, #39	; 0x27
    253e:	2107      	movs	r1, #7
    2540:	f7ff fc3c 	bl	1dbc <set_int_priority>
		enable_interrupt(USART3_IRQ);
    2544:	2027      	movs	r0, #39	; 0x27
    2546:	f7ff fbf1 	bl	1d2c <enable_interrupt>
		break;
    254a:	bf00      	nop
	}
	uart_set_baud(channel,baud);
    254c:	68f8      	ldr	r0, [r7, #12]
    254e:	68b9      	ldr	r1, [r7, #8]
    2550:	f7ff ff42 	bl	23d8 <uart_set_baud>
	if (flow_ctrl==FLOW_HARD){
    2554:	683b      	ldr	r3, [r7, #0]
    2556:	2b01      	cmp	r3, #1
    2558:	d106      	bne.n	2568 <uart_open_channel+0xf8>
		cr3=(sfrp_t)(channel+USART_CR3_OFS);
    255a:	68fb      	ldr	r3, [r7, #12]
    255c:	3314      	adds	r3, #20
    255e:	617b      	str	r3, [r7, #20]
		*cr3=(1<<USART_CR3_CTSE)|(1<<USART_CR3_RTSE);
    2560:	697b      	ldr	r3, [r7, #20]
    2562:	f44f 7240 	mov.w	r2, #768	; 0x300
    2566:	601a      	str	r2, [r3, #0]
	}
	cr1=(sfrp_t)(channel+USART_CR1_OFS);
    2568:	68fb      	ldr	r3, [r7, #12]
    256a:	330c      	adds	r3, #12
    256c:	613b      	str	r3, [r7, #16]
	uart_getc(channel);
    256e:	68f8      	ldr	r0, [r7, #12]
    2570:	f000 f836 	bl	25e0 <uart_getc>
	*cr1=(1<<USART_CR1_UE)|(1<<USART_CR1_TE)|(1<<USART_CR1_RE)|(1<<USART_CR1_RXNEIE);
    2574:	693b      	ldr	r3, [r7, #16]
    2576:	f242 022c 	movw	r2, #8236	; 0x202c
    257a:	601a      	str	r2, [r3, #0]
	if (parity){
    257c:	687b      	ldr	r3, [r7, #4]
    257e:	2b00      	cmp	r3, #0
    2580:	d005      	beq.n	258e <uart_open_channel+0x11e>
		*cr1|=(1<<USART_CR1_PEIE)|(1<<USART_CR1_PCE);
    2582:	693b      	ldr	r3, [r7, #16]
    2584:	681b      	ldr	r3, [r3, #0]
    2586:	f443 62a0 	orr.w	r2, r3, #1280	; 0x500
    258a:	693b      	ldr	r3, [r7, #16]
    258c:	601a      	str	r2, [r3, #0]
    }
}
    258e:	3718      	adds	r7, #24
    2590:	46bd      	mov	sp, r7
    2592:	bd80      	pop	{r7, pc}
    2594:	40004800 	.word	0x40004800
    2598:	40013800 	.word	0x40013800
    259c:	40004400 	.word	0x40004400
    25a0:	40021018 	.word	0x40021018
    25a4:	40010804 	.word	0x40010804
    25a8:	4002101c 	.word	0x4002101c
    25ac:	40010800 	.word	0x40010800
    25b0:	40010c04 	.word	0x40010c04

000025b4 <uart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int uart_stat(unsigned channel){
    25b4:	b480      	push	{r7}
    25b6:	b085      	sub	sp, #20
    25b8:	af00      	add	r7, sp, #0
    25ba:	6078      	str	r0, [r7, #4]
	sfrp_t sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    25bc:	687b      	ldr	r3, [r7, #4]
    25be:	60fb      	str	r3, [r7, #12]
	return *sr&(1<<USART_SR_RXNE)?-1:0;
    25c0:	68fb      	ldr	r3, [r7, #12]
    25c2:	681b      	ldr	r3, [r3, #0]
    25c4:	f003 0320 	and.w	r3, r3, #32
    25c8:	2b00      	cmp	r3, #0
    25ca:	d002      	beq.n	25d2 <uart_stat+0x1e>
    25cc:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    25d0:	e000      	b.n	25d4 <uart_stat+0x20>
    25d2:	2300      	movs	r3, #0
}
    25d4:	4618      	mov	r0, r3
    25d6:	3714      	adds	r7, #20
    25d8:	46bd      	mov	sp, r7
    25da:	f85d 7b04 	ldr.w	r7, [sp], #4
    25de:	4770      	bx	lr

000025e0 <uart_getc>:

// reçoit un caractère de la console
char uart_getc(unsigned channel){
    25e0:	b480      	push	{r7}
    25e2:	b085      	sub	sp, #20
    25e4:	af00      	add	r7, sp, #0
    25e6:	6078      	str	r0, [r7, #4]
	sfrp_t dr;
	
	dr=(sfrp_t)(channel+USART_DR_OFS);
    25e8:	687b      	ldr	r3, [r7, #4]
    25ea:	3304      	adds	r3, #4
    25ec:	60fb      	str	r3, [r7, #12]
	return *dr;
    25ee:	68fb      	ldr	r3, [r7, #12]
    25f0:	681b      	ldr	r3, [r3, #0]
    25f2:	b2db      	uxtb	r3, r3
}
    25f4:	4618      	mov	r0, r3
    25f6:	3714      	adds	r7, #20
    25f8:	46bd      	mov	sp, r7
    25fa:	f85d 7b04 	ldr.w	r7, [sp], #4
    25fe:	4770      	bx	lr

00002600 <uart_putc>:

// transmet un caractère à la console
void uart_putc(unsigned channel, char c){
    2600:	b480      	push	{r7}
    2602:	b085      	sub	sp, #20
    2604:	af00      	add	r7, sp, #0
    2606:	6078      	str	r0, [r7, #4]
    2608:	460b      	mov	r3, r1
    260a:	70fb      	strb	r3, [r7, #3]
	sfrp_t dr, sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    260c:	687b      	ldr	r3, [r7, #4]
    260e:	60fb      	str	r3, [r7, #12]
	dr=(sfrp_t)(channel+USART_DR_OFS);
    2610:	687b      	ldr	r3, [r7, #4]
    2612:	3304      	adds	r3, #4
    2614:	60bb      	str	r3, [r7, #8]
	//attend que dr soit vide
	while (!(*sr&(1<<USART_SR_TXE)));
    2616:	bf00      	nop
    2618:	68fb      	ldr	r3, [r7, #12]
    261a:	681b      	ldr	r3, [r3, #0]
    261c:	f003 0380 	and.w	r3, r3, #128	; 0x80
    2620:	2b00      	cmp	r3, #0
    2622:	d0f9      	beq.n	2618 <uart_putc+0x18>
	*dr=c;
    2624:	78fa      	ldrb	r2, [r7, #3]
    2626:	68bb      	ldr	r3, [r7, #8]
    2628:	601a      	str	r2, [r3, #0]
}
    262a:	3714      	adds	r7, #20
    262c:	46bd      	mov	sp, r7
    262e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2632:	4770      	bx	lr

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
