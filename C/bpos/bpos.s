
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 cd 2b 00 00     i...m...q....+..
      20:	cd 2b 00 00 cd 2b 00 00 cd 2b 00 00 5d 05 00 00     .+...+...+..]...
      30:	cd 2b 00 00 cd 2b 00 00 79 02 00 00 a5 2c 00 00     .+...+..y....,..
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 cd 2b 00 00 cd 2b 00 00 e1 2f 00 00     .....+...+.../..
      80:	cd 2b 00 00 cd 2b 00 00 cd 2b 00 00 cd 2b 00 00     .+...+...+...+..
      90:	cd 2b 00 00 cd 2b 00 00 cd 2b 00 00 a1 21 00 00     .+...+...+...!..
      a0:	cd 2b 00 00 cd 2b 00 00 cd 2b 00 00 6d 2e 00 00     .+...+...+..m...
      b0:	09 23 00 00 c5 02 00 00 f1 1c 00 00 cd 2b 00 00     .#...........+..
      c0:	cd 2b 00 00 cd 2b 00 00 cd 2b 00 00 cd 2b 00 00     .+...+...+...+..
      d0:	cd 2b 00 00 cd 02 00 00 a5 34 00 00 d5 02 00 00     .+.......4......
      e0:	cd 2b 00 00 cd 2b 00 00 cd 2b 00 00 cd 2b 00 00     .+...+...+...+..
      f0:	cd 2b 00 00 cd 2b 00 00 cd 2b 00 00 cd 2b 00 00     .+...+...+...+..
     100:	cd 2b 00 00 cd 2b 00 00 cd 2b 00 00 cd 2b 00 00     .+...+...+...+..
     110:	cd 2b 00 00 cd 2b 00 00 cd 2b 00 00 cd 2b 00 00     .+...+...+...+..
     120:	cd 2b 00 00 cd 2b 00 00 cd 2b 00 00 cd 2b 00 00     .+...+...+...+..

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
     1c0:	200026b8 	.word	0x200026b8
     1c4:	00003c90 	.word	0x00003c90
     1c8:	20000000 	.word	0x20000000
     1cc:	20000008 	.word	0x20000008
     1d0:	20002700 	.word	0x20002700
     1d4:	200000f0 	.word	0x200000f0
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
     208:	f002 fce8 	bl	2bdc <print_fault>
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
     21e:	f002 fcdd 	bl	2bdc <print_fault>
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
     234:	f002 fcd2 	bl	2bdc <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f002 fccd 	bl	2bdc <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	00003bb8 	.word	0x00003bb8
     258:	00003bd0 	.word	0x00003bd0
     25c:	00003bdc 	.word	0x00003bdc
     260:	00003bec 	.word	0x00003bec

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f002 fcb2 	bl	2bcc <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f002 fcb0 	bl	2bcc <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f002 fcae 	bl	2bcc <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f002 fcac 	bl	2bcc <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f002 fcaa 	bl	2bcc <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f002 fca8 	bl	2bcc <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f002 fca6 	bl	2bcc <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f002 fca4 	bl	2bcc <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f002 fca2 	bl	2bcc <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f002 fca0 	bl	2bcc <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f002 fc9e 	bl	2bcc <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f002 fc9c 	bl	2bcc <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f002 fc9a 	bl	2bcc <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f002 fc98 	bl	2bcc <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f002 fc96 	bl	2bcc <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f002 fc94 	bl	2bcc <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f002 fc92 	bl	2bcc <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f002 fc90 	bl	2bcc <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f002 fc8e 	bl	2bcc <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f002 fc8c 	bl	2bcc <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f002 fc8a 	bl	2bcc <reset_mcu>
_default_handler(EXTI9_5_handler) // 23
     2b8:	f002 fc88 	bl	2bcc <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2bc:	f002 fc86 	bl	2bcc <reset_mcu>
_default_handler(TIM2_handler) // 28
     2c0:	f002 fc84 	bl	2bcc <reset_mcu>

000002c4 <TIM3_handler>:
_default_handler(TIM3_handler) // 29
     2c4:	f002 fc82 	bl	2bcc <reset_mcu>
_default_handler(TIM4_handler) // 30
     2c8:	f002 fc80 	bl	2bcc <reset_mcu>

000002cc <USART1_handler>:
_default_handler(USART1_handler) // 37
     2cc:	f002 fc7e 	bl	2bcc <reset_mcu>
_default_handler(USART2_handler) // 38
     2d0:	f002 fc7c 	bl	2bcc <reset_mcu>

000002d4 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2d4:	f002 fc7a 	bl	2bcc <reset_mcu>

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
     5e6:	f001 fbf1 	bl	1dcc <write_pin>
		//led_on();
		break;
     5ea:	e092      	b.n	712 <SVC_handler+0x1b6>
	case SVC_LED_OFF:
		write_pin(LED_PORT,LED_PIN,LED_OFF);
     5ec:	484c      	ldr	r0, [pc, #304]	; (720 <SVC_handler+0x1c4>)
     5ee:	210d      	movs	r1, #13
     5f0:	2201      	movs	r2, #1
     5f2:	f001 fbeb 	bl	1dcc <write_pin>
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
     60c:	f000 fdb4 	bl	1178 <conin>
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
     620:	f000 fd9a 	bl	1158 <conout>
		break;
     624:	e075      	b.n	712 <SVC_handler+0x1b6>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     626:	68bb      	ldr	r3, [r7, #8]
     628:	681b      	ldr	r3, [r3, #0]
     62a:	6878      	ldr	r0, [r7, #4]
     62c:	4619      	mov	r1, r3
     62e:	f000 fdd1 	bl	11d4 <read_line>
     632:	4602      	mov	r2, r0
     634:	68bb      	ldr	r3, [r7, #8]
     636:	601a      	str	r2, [r3, #0]
		break;
     638:	e06b      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT:
		print((const char*)arg1);
     63a:	68b8      	ldr	r0, [r7, #8]
     63c:	f000 fda6 	bl	118c <print>
		break;
     640:	e067      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     642:	68bb      	ldr	r3, [r7, #8]
     644:	681b      	ldr	r3, [r3, #0]
     646:	4618      	mov	r0, r3
     648:	210a      	movs	r1, #10
     64a:	f000 fe79 	bl	1340 <print_int>
		break;
     64e:	e060      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     650:	68bb      	ldr	r3, [r7, #8]
     652:	681b      	ldr	r3, [r3, #0]
     654:	4618      	mov	r0, r3
     656:	f000 fee1 	bl	141c <print_hex>
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
     6de:	f000 ff47 	bl	1570 <flash_write>
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
     6f0:	f000 ff82 	bl	15f8 <flash_erase_page>
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
     706:	f000 feeb 	bl	14e0 <cls>
		break;
     70a:	e002      	b.n	712 <SVC_handler+0x1b6>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     70c:	f002 fa5e 	bl	2bcc <reset_mcu>
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
     724:	200000e4 	.word	0x200000e4
     728:	200000e0 	.word	0x200000e0

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
     8bc:	000035ac 	.word	0x000035ac

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
     8d6:	f000 fc59 	bl	118c <print>
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
     944:	000035ac 	.word	0x000035ac

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
     990:	000035ac 	.word	0x000035ac

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
     9a0:	200000f0 	.word	0x200000f0

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
     b10:	f000 fb3c 	bl	118c <print>
}
     b14:	3708      	adds	r7, #8
     b16:	46bd      	mov	sp, r7
     b18:	bd80      	pop	{r7, pc}
     b1a:	bf00      	nop
     b1c:	20000058 	.word	0x20000058
     b20:	000034e8 	.word	0x000034e8

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
     b4a:	f000 fb1f 	bl	118c <print>
}
     b4e:	3708      	adds	r7, #8
     b50:	46bd      	mov	sp, r7
     b52:	bd80      	pop	{r7, pc}
     b54:	20000058 	.word	0x20000058
     b58:	000034e8 	.word	0x000034e8

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
     b9e:	f000 fa87 	bl	10b0 <con_select>
}
     ba2:	3708      	adds	r7, #8
     ba4:	46bd      	mov	sp, r7
     ba6:	bd80      	pop	{r7, pc}
     ba8:	000034f4 	.word	0x000034f4
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
     c20:	000035ac 	.word	0x000035ac

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
     eae:	f000 f953 	bl	1158 <conout>
			print((const char*)pad); conout('?');
     eb2:	480a      	ldr	r0, [pc, #40]	; (edc <parse_line+0x60>)
     eb4:	f000 f96a 	bl	118c <print>
     eb8:	203f      	movs	r0, #63	; 0x3f
     eba:	f000 f94d 	bl	1158 <conout>
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
     ecc:	f000 f944 	bl	1158 <conout>
}
     ed0:	3710      	adds	r7, #16
     ed2:	46bd      	mov	sp, r7
     ed4:	bd80      	pop	{r7, pc}
     ed6:	bf00      	nop
     ed8:	200000a8 	.word	0x200000a8
     edc:	20000058 	.word	0x20000058
     ee0:	000035ac 	.word	0x000035ac

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
     f1c:	00003c00 	.word	0x00003c00
     f20:	00003c90 	.word	0x00003c90
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
     f38:	f001 fad2 	bl	24e0 <set_int_priority>
	config_systicks();
     f3c:	f001 fe8a 	bl	2c54 <config_systicks>
	flash_enable();
     f40:	f000 fad6 	bl	14f0 <flash_enable>
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
     f44:	4b2a      	ldr	r3, [pc, #168]	; (ff0 <main+0xc8>)
     f46:	221d      	movs	r2, #29
     f48:	619a      	str	r2, [r3, #24]
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
     f4a:	4b29      	ldr	r3, [pc, #164]	; (ff0 <main+0xc8>)
     f4c:	f44f 4280 	mov.w	r2, #16384	; 0x4000
     f50:	61da      	str	r2, [r3, #28]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     f52:	4a27      	ldr	r2, [pc, #156]	; (ff0 <main+0xc8>)
     f54:	4b26      	ldr	r3, [pc, #152]	; (ff0 <main+0xc8>)
     f56:	695b      	ldr	r3, [r3, #20]
     f58:	f043 0301 	orr.w	r3, r3, #1
     f5c:	6153      	str	r3, [r2, #20]
	config_pin(LED_PORT,LED_PIN,OUTPUT_OD_SLOW);
     f5e:	4825      	ldr	r0, [pc, #148]	; (ff4 <main+0xcc>)
     f60:	210d      	movs	r1, #13
     f62:	2206      	movs	r2, #6
     f64:	f000 feee 	bl	1d44 <config_pin>
	vt_init();
     f68:	f002 fa1c 	bl	33a4 <vt_init>
	keyboard_init();
     f6c:	f000 ff64 	bl	1e38 <keyboard_init>
	tvout_init();
     f70:	f001 febc 	bl	2cec <tvout_init>
	console_init(SERIAL);
     f74:	2001      	movs	r0, #1
     f76:	f000 f8d7 	bl	1128 <console_init>
	if (!vt_ready()){con_select(LOCAL);}
     f7a:	f002 fa81 	bl	3480 <vt_ready>
     f7e:	4603      	mov	r3, r0
     f80:	2b00      	cmp	r3, #0
     f82:	d102      	bne.n	f8a <main+0x62>
     f84:	2000      	movs	r0, #0
     f86:	f000 f893 	bl	10b0 <con_select>
	cls();
     f8a:	f000 faa9 	bl	14e0 <cls>
	print(VERSION);
     f8e:	4b1a      	ldr	r3, [pc, #104]	; (ff8 <main+0xd0>)
     f90:	681b      	ldr	r3, [r3, #0]
     f92:	4618      	mov	r0, r3
     f94:	f000 f8fa 	bl	118c <print>
	copy_blink_in_ram();
     f98:	f7ff ffa4 	bl	ee4 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
     f9c:	4817      	ldr	r0, [pc, #92]	; (ffc <main+0xd4>)
     f9e:	f000 f8f5 	bl	118c <print>
     fa2:	4b17      	ldr	r3, [pc, #92]	; (1000 <main+0xd8>)
     fa4:	2200      	movs	r2, #0
     fa6:	4618      	mov	r0, r3
     fa8:	4611      	mov	r1, r2
     faa:	df0a      	svc	10
     fac:	200d      	movs	r0, #13
     fae:	f000 f8d3 	bl	1158 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     fb2:	2300      	movs	r3, #0
     fb4:	2200      	movs	r2, #0
     fb6:	4618      	mov	r0, r3
     fb8:	4611      	mov	r1, r2
     fba:	df01      	svc	1
	print("initializing SDcard\n");
     fbc:	4811      	ldr	r0, [pc, #68]	; (1004 <main+0xdc>)
     fbe:	f000 f8e5 	bl	118c <print>
	sdcard_init(); 
     fc2:	f001 fbeb 	bl	279c <sdcard_init>
	print("card status: ");
     fc6:	4810      	ldr	r0, [pc, #64]	; (1008 <main+0xe0>)
     fc8:	f000 f8e0 	bl	118c <print>
	 print_hex(sdc_status); conout(CR);
     fcc:	4b0f      	ldr	r3, [pc, #60]	; (100c <main+0xe4>)
     fce:	881b      	ldrh	r3, [r3, #0]
     fd0:	4618      	mov	r0, r3
     fd2:	f000 fa23 	bl	141c <print_hex>
     fd6:	200d      	movs	r0, #13
     fd8:	f000 f8be 	bl	1158 <conout>
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
     fdc:	480c      	ldr	r0, [pc, #48]	; (1010 <main+0xe8>)
     fde:	2150      	movs	r1, #80	; 0x50
     fe0:	f000 f8f8 	bl	11d4 <read_line>
     fe4:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     fe6:	6878      	ldr	r0, [r7, #4]
     fe8:	f7ff ff48 	bl	e7c <parse_line>
	}
     fec:	e7f6      	b.n	fdc <main+0xb4>
     fee:	bf00      	nop
     ff0:	40021000 	.word	0x40021000
     ff4:	40011000 	.word	0x40011000
     ff8:	20000000 	.word	0x20000000
     ffc:	0000368c 	.word	0x0000368c
    1000:	200000f0 	.word	0x200000f0
    1004:	000036a8 	.word	0x000036a8
    1008:	000036c0 	.word	0x000036c0
    100c:	20000134 	.word	0x20000134
    1010:	20000008 	.word	0x20000008

00001014 <queue_insert>:
#include "vt100.h"

console_t con;


static void queue_insert(char c){
    1014:	b480      	push	{r7}
    1016:	b083      	sub	sp, #12
    1018:	af00      	add	r7, sp, #0
    101a:	4603      	mov	r3, r0
    101c:	71fb      	strb	r3, [r7, #7]
		con.queue[con.head++]=c;
    101e:	4b0a      	ldr	r3, [pc, #40]	; (1048 <queue_insert+0x34>)
    1020:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1022:	1c5a      	adds	r2, r3, #1
    1024:	4908      	ldr	r1, [pc, #32]	; (1048 <queue_insert+0x34>)
    1026:	624a      	str	r2, [r1, #36]	; 0x24
    1028:	4a07      	ldr	r2, [pc, #28]	; (1048 <queue_insert+0x34>)
    102a:	4413      	add	r3, r2
    102c:	79fa      	ldrb	r2, [r7, #7]
    102e:	705a      	strb	r2, [r3, #1]
		con.head&=CON_QUEUE_SIZE-1;
    1030:	4b05      	ldr	r3, [pc, #20]	; (1048 <queue_insert+0x34>)
    1032:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1034:	f003 031f 	and.w	r3, r3, #31
    1038:	4a03      	ldr	r2, [pc, #12]	; (1048 <queue_insert+0x34>)
    103a:	6253      	str	r3, [r2, #36]	; 0x24
}
    103c:	370c      	adds	r7, #12
    103e:	46bd      	mov	sp, r7
    1040:	f85d 7b04 	ldr.w	r7, [sp], #4
    1044:	4770      	bx	lr
    1046:	bf00      	nop
    1048:	200000f4 	.word	0x200000f4

0000104c <queue_getc>:

static char queue_getc(){
    104c:	b480      	push	{r7}
    104e:	b083      	sub	sp, #12
    1050:	af00      	add	r7, sp, #0
	char c=0;
    1052:	2300      	movs	r3, #0
    1054:	71fb      	strb	r3, [r7, #7]
	if (con.tail!=con.head){
    1056:	4b0e      	ldr	r3, [pc, #56]	; (1090 <queue_getc+0x44>)
    1058:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    105a:	4b0d      	ldr	r3, [pc, #52]	; (1090 <queue_getc+0x44>)
    105c:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    105e:	429a      	cmp	r2, r3
    1060:	d00e      	beq.n	1080 <queue_getc+0x34>
		c=con.queue[con.tail++];
    1062:	4b0b      	ldr	r3, [pc, #44]	; (1090 <queue_getc+0x44>)
    1064:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    1066:	1c5a      	adds	r2, r3, #1
    1068:	4909      	ldr	r1, [pc, #36]	; (1090 <queue_getc+0x44>)
    106a:	628a      	str	r2, [r1, #40]	; 0x28
    106c:	4a08      	ldr	r2, [pc, #32]	; (1090 <queue_getc+0x44>)
    106e:	4413      	add	r3, r2
    1070:	785b      	ldrb	r3, [r3, #1]
    1072:	71fb      	strb	r3, [r7, #7]
		con.tail&=CON_QUEUE_SIZE-1;
    1074:	4b06      	ldr	r3, [pc, #24]	; (1090 <queue_getc+0x44>)
    1076:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    1078:	f003 031f 	and.w	r3, r3, #31
    107c:	4a04      	ldr	r2, [pc, #16]	; (1090 <queue_getc+0x44>)
    107e:	6293      	str	r3, [r2, #40]	; 0x28
	}
	return c;
    1080:	79fb      	ldrb	r3, [r7, #7]
}
    1082:	4618      	mov	r0, r3
    1084:	370c      	adds	r7, #12
    1086:	46bd      	mov	sp, r7
    1088:	f85d 7b04 	ldr.w	r7, [sp], #4
    108c:	4770      	bx	lr
    108e:	bf00      	nop
    1090:	200000f4 	.word	0x200000f4

00001094 <con_queue_flush>:

void con_queue_flush(){
    1094:	b480      	push	{r7}
    1096:	af00      	add	r7, sp, #0
	con.tail=con.head=0;
    1098:	2300      	movs	r3, #0
    109a:	4a04      	ldr	r2, [pc, #16]	; (10ac <con_queue_flush+0x18>)
    109c:	6253      	str	r3, [r2, #36]	; 0x24
    109e:	4a03      	ldr	r2, [pc, #12]	; (10ac <con_queue_flush+0x18>)
    10a0:	6293      	str	r3, [r2, #40]	; 0x28
}
    10a2:	46bd      	mov	sp, r7
    10a4:	f85d 7b04 	ldr.w	r7, [sp], #4
    10a8:	4770      	bx	lr
    10aa:	bf00      	nop
    10ac:	200000f4 	.word	0x200000f4

000010b0 <con_select>:

static const char PROMPT[]=" OK\n";

void con_select(console_dev_t dev){
    10b0:	b580      	push	{r7, lr}
    10b2:	b082      	sub	sp, #8
    10b4:	af00      	add	r7, sp, #0
    10b6:	4603      	mov	r3, r0
    10b8:	71fb      	strb	r3, [r7, #7]
	con_queue_flush();
    10ba:	f7ff ffeb 	bl	1094 <con_queue_flush>
	con.dev=dev;
    10be:	4a12      	ldr	r2, [pc, #72]	; (1108 <con_select+0x58>)
    10c0:	79fb      	ldrb	r3, [r7, #7]
    10c2:	7013      	strb	r3, [r2, #0]
	if (dev==LOCAL){
    10c4:	79fb      	ldrb	r3, [r7, #7]
    10c6:	2b00      	cmp	r3, #0
    10c8:	d10c      	bne.n	10e4 <con_select+0x34>
		con.putc=gdi_putc;
    10ca:	4b0f      	ldr	r3, [pc, #60]	; (1108 <con_select+0x58>)
    10cc:	4a0f      	ldr	r2, [pc, #60]	; (110c <con_select+0x5c>)
    10ce:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=gdi_clear_screen;
    10d0:	4b0d      	ldr	r3, [pc, #52]	; (1108 <con_select+0x58>)
    10d2:	4a0f      	ldr	r2, [pc, #60]	; (1110 <con_select+0x60>)
    10d4:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=gdi_del_back;
    10d6:	4b0c      	ldr	r3, [pc, #48]	; (1108 <con_select+0x58>)
    10d8:	4a0e      	ldr	r2, [pc, #56]	; (1114 <con_select+0x64>)
    10da:	639a      	str	r2, [r3, #56]	; 0x38
		gdi_text_cursor(1);
    10dc:	2001      	movs	r0, #1
    10de:	f000 fdab 	bl	1c38 <gdi_text_cursor>
    10e2:	e00b      	b.n	10fc <con_select+0x4c>
	}else{
		gdi_text_cursor(0);
    10e4:	2000      	movs	r0, #0
    10e6:	f000 fda7 	bl	1c38 <gdi_text_cursor>
		con.putc=vt_putc;
    10ea:	4b07      	ldr	r3, [pc, #28]	; (1108 <con_select+0x58>)
    10ec:	4a0a      	ldr	r2, [pc, #40]	; (1118 <con_select+0x68>)
    10ee:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=vt_cls;
    10f0:	4b05      	ldr	r3, [pc, #20]	; (1108 <con_select+0x58>)
    10f2:	4a0a      	ldr	r2, [pc, #40]	; (111c <con_select+0x6c>)
    10f4:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=vt_del_back;
    10f6:	4b04      	ldr	r3, [pc, #16]	; (1108 <con_select+0x58>)
    10f8:	4a09      	ldr	r2, [pc, #36]	; (1120 <con_select+0x70>)
    10fa:	639a      	str	r2, [r3, #56]	; 0x38
	}
	print(PROMPT);
    10fc:	4809      	ldr	r0, [pc, #36]	; (1124 <con_select+0x74>)
    10fe:	f000 f845 	bl	118c <print>
}
    1102:	3708      	adds	r7, #8
    1104:	46bd      	mov	sp, r7
    1106:	bd80      	pop	{r7, pc}
    1108:	200000f4 	.word	0x200000f4
    110c:	00001b2d 	.word	0x00001b2d
    1110:	000016e9 	.word	0x000016e9
    1114:	00001ae9 	.word	0x00001ae9
    1118:	000033c5 	.word	0x000033c5
    111c:	00003425 	.word	0x00003425
    1120:	000033e5 	.word	0x000033e5
    1124:	000036d0 	.word	0x000036d0

00001128 <console_init>:

void console_init(console_dev_t dev){
    1128:	b580      	push	{r7, lr}
    112a:	b082      	sub	sp, #8
    112c:	af00      	add	r7, sp, #0
    112e:	4603      	mov	r3, r0
    1130:	71fb      	strb	r3, [r7, #7]
	con.getc=queue_getc;
    1132:	4b06      	ldr	r3, [pc, #24]	; (114c <console_init+0x24>)
    1134:	4a06      	ldr	r2, [pc, #24]	; (1150 <console_init+0x28>)
    1136:	631a      	str	r2, [r3, #48]	; 0x30
	con.insert=queue_insert;
    1138:	4b04      	ldr	r3, [pc, #16]	; (114c <console_init+0x24>)
    113a:	4a06      	ldr	r2, [pc, #24]	; (1154 <console_init+0x2c>)
    113c:	62da      	str	r2, [r3, #44]	; 0x2c
	con_select(dev);
    113e:	79fb      	ldrb	r3, [r7, #7]
    1140:	4618      	mov	r0, r3
    1142:	f7ff ffb5 	bl	10b0 <con_select>
}
    1146:	3708      	adds	r7, #8
    1148:	46bd      	mov	sp, r7
    114a:	bd80      	pop	{r7, pc}
    114c:	200000f4 	.word	0x200000f4
    1150:	0000104d 	.word	0x0000104d
    1154:	00001015 	.word	0x00001015

00001158 <conout>:

// envoie d'un caractère à la console
void conout(char c){
    1158:	b580      	push	{r7, lr}
    115a:	b082      	sub	sp, #8
    115c:	af00      	add	r7, sp, #0
    115e:	4603      	mov	r3, r0
    1160:	71fb      	strb	r3, [r7, #7]
	con.putc(c);
    1162:	4b04      	ldr	r3, [pc, #16]	; (1174 <conout+0x1c>)
    1164:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1166:	79fa      	ldrb	r2, [r7, #7]
    1168:	4610      	mov	r0, r2
    116a:	4798      	blx	r3
}
    116c:	3708      	adds	r7, #8
    116e:	46bd      	mov	sp, r7
    1170:	bd80      	pop	{r7, pc}
    1172:	bf00      	nop
    1174:	200000f4 	.word	0x200000f4

00001178 <conin>:


// réception d'un caractère de la console
char conin(){
    1178:	b580      	push	{r7, lr}
    117a:	af00      	add	r7, sp, #0
	return con.getc();
    117c:	4b02      	ldr	r3, [pc, #8]	; (1188 <conin+0x10>)
    117e:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    1180:	4798      	blx	r3
    1182:	4603      	mov	r3, r0
}
    1184:	4618      	mov	r0, r3
    1186:	bd80      	pop	{r7, pc}
    1188:	200000f4 	.word	0x200000f4

0000118c <print>:

// imprime un chaîne sur la console
void print(const char *str){
    118c:	b580      	push	{r7, lr}
    118e:	b082      	sub	sp, #8
    1190:	af00      	add	r7, sp, #0
    1192:	6078      	str	r0, [r7, #4]
	while (*str) {con.putc(*str++);}
    1194:	e007      	b.n	11a6 <print+0x1a>
    1196:	4b07      	ldr	r3, [pc, #28]	; (11b4 <print+0x28>)
    1198:	6b5a      	ldr	r2, [r3, #52]	; 0x34
    119a:	687b      	ldr	r3, [r7, #4]
    119c:	1c59      	adds	r1, r3, #1
    119e:	6079      	str	r1, [r7, #4]
    11a0:	781b      	ldrb	r3, [r3, #0]
    11a2:	4618      	mov	r0, r3
    11a4:	4790      	blx	r2
    11a6:	687b      	ldr	r3, [r7, #4]
    11a8:	781b      	ldrb	r3, [r3, #0]
    11aa:	2b00      	cmp	r3, #0
    11ac:	d1f3      	bne.n	1196 <print+0xa>
}
    11ae:	3708      	adds	r7, #8
    11b0:	46bd      	mov	sp, r7
    11b2:	bd80      	pop	{r7, pc}
    11b4:	200000f4 	.word	0x200000f4

000011b8 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    11b8:	b580      	push	{r7, lr}
    11ba:	af00      	add	r7, sp, #0
	con.delete_back();
    11bc:	4b01      	ldr	r3, [pc, #4]	; (11c4 <delete_back+0xc>)
    11be:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    11c0:	4798      	blx	r3
}
    11c2:	bd80      	pop	{r7, pc}
    11c4:	200000f4 	.word	0x200000f4

000011c8 <beep>:

static void beep(){
    11c8:	b480      	push	{r7}
    11ca:	af00      	add	r7, sp, #0
}
    11cc:	46bd      	mov	sp, r7
    11ce:	f85d 7b04 	ldr.w	r7, [sp], #4
    11d2:	4770      	bx	lr

000011d4 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    11d4:	b580      	push	{r7, lr}
    11d6:	b084      	sub	sp, #16
    11d8:	af00      	add	r7, sp, #0
    11da:	6078      	str	r0, [r7, #4]
    11dc:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    11de:	2300      	movs	r3, #0
    11e0:	60fb      	str	r3, [r7, #12]
	char c=0;
    11e2:	2300      	movs	r3, #0
    11e4:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    11e6:	683b      	ldr	r3, [r7, #0]
    11e8:	3b01      	subs	r3, #1
    11ea:	603b      	str	r3, [r7, #0]
	while (c!=13){
    11ec:	e098      	b.n	1320 <read_line+0x14c>
			c=con.getc();
    11ee:	4b53      	ldr	r3, [pc, #332]	; (133c <read_line+0x168>)
    11f0:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    11f2:	4798      	blx	r3
    11f4:	4603      	mov	r3, r0
    11f6:	72fb      	strb	r3, [r7, #11]
			switch(c){
    11f8:	7afb      	ldrb	r3, [r7, #11]
    11fa:	2b18      	cmp	r3, #24
    11fc:	d87a      	bhi.n	12f4 <read_line+0x120>
    11fe:	a201      	add	r2, pc, #4	; (adr r2, 1204 <read_line+0x30>)
    1200:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1204:	00001321 	.word	0x00001321
    1208:	000012f5 	.word	0x000012f5
    120c:	000012f5 	.word	0x000012f5
    1210:	000012f5 	.word	0x000012f5
    1214:	000012f5 	.word	0x000012f5
    1218:	000012e5 	.word	0x000012e5
    121c:	000012f5 	.word	0x000012f5
    1220:	000012f5 	.word	0x000012f5
    1224:	000012d1 	.word	0x000012d1
    1228:	000012f1 	.word	0x000012f1
    122c:	00001269 	.word	0x00001269
    1230:	000012f5 	.word	0x000012f5
    1234:	000012f5 	.word	0x000012f5
    1238:	00001269 	.word	0x00001269
    123c:	000012f5 	.word	0x000012f5
    1240:	000012f5 	.word	0x000012f5
    1244:	000012f5 	.word	0x000012f5
    1248:	000012f5 	.word	0x000012f5
    124c:	000012f5 	.word	0x000012f5
    1250:	000012f5 	.word	0x000012f5
    1254:	000012f5 	.word	0x000012f5
    1258:	00001285 	.word	0x00001285
    125c:	000012f5 	.word	0x000012f5
    1260:	00001299 	.word	0x00001299
    1264:	00001285 	.word	0x00001285
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    1268:	230d      	movs	r3, #13
    126a:	72fb      	strb	r3, [r7, #11]
				con.putc(c);
    126c:	4b33      	ldr	r3, [pc, #204]	; (133c <read_line+0x168>)
    126e:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1270:	7afa      	ldrb	r2, [r7, #11]
    1272:	4610      	mov	r0, r2
    1274:	4798      	blx	r3
				break;
    1276:	e053      	b.n	1320 <read_line+0x14c>
				case CTRL_X:
				case CTRL_U:
				while (line_len){con.delete_back();line_len--;}
    1278:	4b30      	ldr	r3, [pc, #192]	; (133c <read_line+0x168>)
    127a:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    127c:	4798      	blx	r3
    127e:	68fb      	ldr	r3, [r7, #12]
    1280:	3b01      	subs	r3, #1
    1282:	60fb      	str	r3, [r7, #12]
    1284:	68fb      	ldr	r3, [r7, #12]
    1286:	2b00      	cmp	r3, #0
    1288:	d1f6      	bne.n	1278 <read_line+0xa4>
				//con.clear_line(line_len);
				//line_len=0;
				break;
    128a:	e049      	b.n	1320 <read_line+0x14c>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
    128c:	4b2b      	ldr	r3, [pc, #172]	; (133c <read_line+0x168>)
    128e:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1290:	4798      	blx	r3
					line_len--;
    1292:	68fb      	ldr	r3, [r7, #12]
    1294:	3b01      	subs	r3, #1
    1296:	60fb      	str	r3, [r7, #12]
				while (line_len){con.delete_back();line_len--;}
				//con.clear_line(line_len);
				//line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    1298:	68fb      	ldr	r3, [r7, #12]
    129a:	2b00      	cmp	r3, #0
    129c:	d006      	beq.n	12ac <read_line+0xd8>
    129e:	68fb      	ldr	r3, [r7, #12]
    12a0:	3b01      	subs	r3, #1
    12a2:	687a      	ldr	r2, [r7, #4]
    12a4:	4413      	add	r3, r2
    12a6:	781b      	ldrb	r3, [r3, #0]
    12a8:	2b20      	cmp	r3, #32
    12aa:	d0ef      	beq.n	128c <read_line+0xb8>
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    12ac:	e005      	b.n	12ba <read_line+0xe6>
					con.delete_back();
    12ae:	4b23      	ldr	r3, [pc, #140]	; (133c <read_line+0x168>)
    12b0:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    12b2:	4798      	blx	r3
					line_len--;
    12b4:	68fb      	ldr	r3, [r7, #12]
    12b6:	3b01      	subs	r3, #1
    12b8:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    12ba:	68fb      	ldr	r3, [r7, #12]
    12bc:	2b00      	cmp	r3, #0
    12be:	d006      	beq.n	12ce <read_line+0xfa>
    12c0:	68fb      	ldr	r3, [r7, #12]
    12c2:	3b01      	subs	r3, #1
    12c4:	687a      	ldr	r2, [r7, #4]
    12c6:	4413      	add	r3, r2
    12c8:	781b      	ldrb	r3, [r3, #0]
    12ca:	2b20      	cmp	r3, #32
    12cc:	d1ef      	bne.n	12ae <read_line+0xda>
					con.delete_back();
					line_len--;
				}
				break;
    12ce:	e027      	b.n	1320 <read_line+0x14c>
				case BS:
				if (line_len){
    12d0:	68fb      	ldr	r3, [r7, #12]
    12d2:	2b00      	cmp	r3, #0
    12d4:	d005      	beq.n	12e2 <read_line+0x10e>
					con.delete_back();
    12d6:	4b19      	ldr	r3, [pc, #100]	; (133c <read_line+0x168>)
    12d8:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    12da:	4798      	blx	r3
					line_len--;
    12dc:	68fb      	ldr	r3, [r7, #12]
    12de:	3b01      	subs	r3, #1
    12e0:	60fb      	str	r3, [r7, #12]
				}
				break;
    12e2:	e01d      	b.n	1320 <read_line+0x14c>
				case CTRL_E:
				con.cls();
    12e4:	4b15      	ldr	r3, [pc, #84]	; (133c <read_line+0x168>)
    12e6:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    12e8:	4798      	blx	r3
				line_len=0;
    12ea:	2300      	movs	r3, #0
    12ec:	60fb      	str	r3, [r7, #12]
				break;
    12ee:	e017      	b.n	1320 <read_line+0x14c>
				case TAB:
				c=SPACE;
    12f0:	2320      	movs	r3, #32
    12f2:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    12f4:	68fa      	ldr	r2, [r7, #12]
    12f6:	683b      	ldr	r3, [r7, #0]
    12f8:	429a      	cmp	r2, r3
    12fa:	d20f      	bcs.n	131c <read_line+0x148>
    12fc:	7afb      	ldrb	r3, [r7, #11]
    12fe:	2b1f      	cmp	r3, #31
    1300:	d90c      	bls.n	131c <read_line+0x148>
					buffer[line_len++]=c;
    1302:	68fb      	ldr	r3, [r7, #12]
    1304:	1c5a      	adds	r2, r3, #1
    1306:	60fa      	str	r2, [r7, #12]
    1308:	687a      	ldr	r2, [r7, #4]
    130a:	4413      	add	r3, r2
    130c:	7afa      	ldrb	r2, [r7, #11]
    130e:	701a      	strb	r2, [r3, #0]
					con.putc(c);
    1310:	4b0a      	ldr	r3, [pc, #40]	; (133c <read_line+0x168>)
    1312:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1314:	7afa      	ldrb	r2, [r7, #11]
    1316:	4610      	mov	r0, r2
    1318:	4798      	blx	r3
    131a:	e001      	b.n	1320 <read_line+0x14c>
				}else{
					beep();
    131c:	f7ff ff54 	bl	11c8 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    1320:	7afb      	ldrb	r3, [r7, #11]
    1322:	2b0d      	cmp	r3, #13
    1324:	f47f af63 	bne.w	11ee <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1328:	687a      	ldr	r2, [r7, #4]
    132a:	68fb      	ldr	r3, [r7, #12]
    132c:	4413      	add	r3, r2
    132e:	2200      	movs	r2, #0
    1330:	701a      	strb	r2, [r3, #0]
	return line_len;
    1332:	68fb      	ldr	r3, [r7, #12]
}
    1334:	4618      	mov	r0, r3
    1336:	3710      	adds	r7, #16
    1338:	46bd      	mov	sp, r7
    133a:	bd80      	pop	{r7, pc}
    133c:	200000f4 	.word	0x200000f4

00001340 <print_int>:

// imprime un entier
// i entier à imprimer
// base  numérique
void print_int(int i, unsigned base){
    1340:	b580      	push	{r7, lr}
    1342:	b08e      	sub	sp, #56	; 0x38
    1344:	af00      	add	r7, sp, #0
    1346:	6078      	str	r0, [r7, #4]
    1348:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    134a:	2301      	movs	r3, #1
    134c:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    134e:	2322      	movs	r3, #34	; 0x22
    1350:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    1352:	2300      	movs	r3, #0
    1354:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1358:	687b      	ldr	r3, [r7, #4]
    135a:	2b00      	cmp	r3, #0
    135c:	da05      	bge.n	136a <print_int+0x2a>
    135e:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1362:	637b      	str	r3, [r7, #52]	; 0x34
    1364:	687b      	ldr	r3, [r7, #4]
    1366:	425b      	negs	r3, r3
    1368:	607b      	str	r3, [r7, #4]
	while (i){
    136a:	e02c      	b.n	13c6 <print_int+0x86>
		fmt[pos]=i%base+'0';
    136c:	687b      	ldr	r3, [r7, #4]
    136e:	683a      	ldr	r2, [r7, #0]
    1370:	fbb3 f2f2 	udiv	r2, r3, r2
    1374:	6839      	ldr	r1, [r7, #0]
    1376:	fb01 f202 	mul.w	r2, r1, r2
    137a:	1a9b      	subs	r3, r3, r2
    137c:	b2db      	uxtb	r3, r3
    137e:	3330      	adds	r3, #48	; 0x30
    1380:	b2d9      	uxtb	r1, r3
    1382:	f107 020c 	add.w	r2, r7, #12
    1386:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1388:	4413      	add	r3, r2
    138a:	460a      	mov	r2, r1
    138c:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    138e:	f107 020c 	add.w	r2, r7, #12
    1392:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1394:	4413      	add	r3, r2
    1396:	781b      	ldrb	r3, [r3, #0]
    1398:	2b39      	cmp	r3, #57	; 0x39
    139a:	d90c      	bls.n	13b6 <print_int+0x76>
    139c:	f107 020c 	add.w	r2, r7, #12
    13a0:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13a2:	4413      	add	r3, r2
    13a4:	781b      	ldrb	r3, [r3, #0]
    13a6:	3307      	adds	r3, #7
    13a8:	b2d9      	uxtb	r1, r3
    13aa:	f107 020c 	add.w	r2, r7, #12
    13ae:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13b0:	4413      	add	r3, r2
    13b2:	460a      	mov	r2, r1
    13b4:	701a      	strb	r2, [r3, #0]
		pos--;
    13b6:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13b8:	3b01      	subs	r3, #1
    13ba:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    13bc:	687a      	ldr	r2, [r7, #4]
    13be:	683b      	ldr	r3, [r7, #0]
    13c0:	fbb2 f3f3 	udiv	r3, r2, r3
    13c4:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    13c6:	687b      	ldr	r3, [r7, #4]
    13c8:	2b00      	cmp	r3, #0
    13ca:	d1cf      	bne.n	136c <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    13cc:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13ce:	2b22      	cmp	r3, #34	; 0x22
    13d0:	d108      	bne.n	13e4 <print_int+0xa4>
    13d2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13d4:	1e5a      	subs	r2, r3, #1
    13d6:	633a      	str	r2, [r7, #48]	; 0x30
    13d8:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13dc:	4413      	add	r3, r2
    13de:	2230      	movs	r2, #48	; 0x30
    13e0:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    13e4:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    13e6:	2b00      	cmp	r3, #0
    13e8:	da08      	bge.n	13fc <print_int+0xbc>
    13ea:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13ec:	1e5a      	subs	r2, r3, #1
    13ee:	633a      	str	r2, [r7, #48]	; 0x30
    13f0:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13f4:	4413      	add	r3, r2
    13f6:	222d      	movs	r2, #45	; 0x2d
    13f8:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    13fc:	f107 020c 	add.w	r2, r7, #12
    1400:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1402:	4413      	add	r3, r2
    1404:	2220      	movs	r2, #32
    1406:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1408:	f107 020c 	add.w	r2, r7, #12
    140c:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    140e:	4413      	add	r3, r2
    1410:	4618      	mov	r0, r3
    1412:	f7ff febb 	bl	118c <print>
}
    1416:	3738      	adds	r7, #56	; 0x38
    1418:	46bd      	mov	sp, r7
    141a:	bd80      	pop	{r7, pc}

0000141c <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    141c:	b580      	push	{r7, lr}
    141e:	b088      	sub	sp, #32
    1420:	af00      	add	r7, sp, #0
    1422:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    1424:	230c      	movs	r3, #12
    1426:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    1428:	2300      	movs	r3, #0
    142a:	767b      	strb	r3, [r7, #25]
	while (u){
    142c:	e026      	b.n	147c <print_hex+0x60>
		fmt[pos]=u%16+'0';
    142e:	687b      	ldr	r3, [r7, #4]
    1430:	b2db      	uxtb	r3, r3
    1432:	f003 030f 	and.w	r3, r3, #15
    1436:	b2db      	uxtb	r3, r3
    1438:	3330      	adds	r3, #48	; 0x30
    143a:	b2d9      	uxtb	r1, r3
    143c:	f107 020c 	add.w	r2, r7, #12
    1440:	69fb      	ldr	r3, [r7, #28]
    1442:	4413      	add	r3, r2
    1444:	460a      	mov	r2, r1
    1446:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1448:	f107 020c 	add.w	r2, r7, #12
    144c:	69fb      	ldr	r3, [r7, #28]
    144e:	4413      	add	r3, r2
    1450:	781b      	ldrb	r3, [r3, #0]
    1452:	2b39      	cmp	r3, #57	; 0x39
    1454:	d90c      	bls.n	1470 <print_hex+0x54>
    1456:	f107 020c 	add.w	r2, r7, #12
    145a:	69fb      	ldr	r3, [r7, #28]
    145c:	4413      	add	r3, r2
    145e:	781b      	ldrb	r3, [r3, #0]
    1460:	3307      	adds	r3, #7
    1462:	b2d9      	uxtb	r1, r3
    1464:	f107 020c 	add.w	r2, r7, #12
    1468:	69fb      	ldr	r3, [r7, #28]
    146a:	4413      	add	r3, r2
    146c:	460a      	mov	r2, r1
    146e:	701a      	strb	r2, [r3, #0]
		pos--;
    1470:	69fb      	ldr	r3, [r7, #28]
    1472:	3b01      	subs	r3, #1
    1474:	61fb      	str	r3, [r7, #28]
		u/=16;
    1476:	687b      	ldr	r3, [r7, #4]
    1478:	091b      	lsrs	r3, r3, #4
    147a:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    147c:	687b      	ldr	r3, [r7, #4]
    147e:	2b00      	cmp	r3, #0
    1480:	d1d5      	bne.n	142e <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    1482:	69fb      	ldr	r3, [r7, #28]
    1484:	2b0c      	cmp	r3, #12
    1486:	d108      	bne.n	149a <print_hex+0x7e>
    1488:	69fb      	ldr	r3, [r7, #28]
    148a:	1e5a      	subs	r2, r3, #1
    148c:	61fa      	str	r2, [r7, #28]
    148e:	f107 0220 	add.w	r2, r7, #32
    1492:	4413      	add	r3, r2
    1494:	2230      	movs	r2, #48	; 0x30
    1496:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    149a:	69fb      	ldr	r3, [r7, #28]
    149c:	1e5a      	subs	r2, r3, #1
    149e:	61fa      	str	r2, [r7, #28]
    14a0:	f107 0220 	add.w	r2, r7, #32
    14a4:	4413      	add	r3, r2
    14a6:	2278      	movs	r2, #120	; 0x78
    14a8:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    14ac:	69fb      	ldr	r3, [r7, #28]
    14ae:	1e5a      	subs	r2, r3, #1
    14b0:	61fa      	str	r2, [r7, #28]
    14b2:	f107 0220 	add.w	r2, r7, #32
    14b6:	4413      	add	r3, r2
    14b8:	2230      	movs	r2, #48	; 0x30
    14ba:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    14be:	f107 020c 	add.w	r2, r7, #12
    14c2:	69fb      	ldr	r3, [r7, #28]
    14c4:	4413      	add	r3, r2
    14c6:	2220      	movs	r2, #32
    14c8:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    14ca:	f107 020c 	add.w	r2, r7, #12
    14ce:	69fb      	ldr	r3, [r7, #28]
    14d0:	4413      	add	r3, r2
    14d2:	4618      	mov	r0, r3
    14d4:	f7ff fe5a 	bl	118c <print>
}
    14d8:	3720      	adds	r7, #32
    14da:	46bd      	mov	sp, r7
    14dc:	bd80      	pop	{r7, pc}
    14de:	bf00      	nop

000014e0 <cls>:

void cls(){
    14e0:	b580      	push	{r7, lr}
    14e2:	af00      	add	r7, sp, #0
	con.cls();
    14e4:	4b01      	ldr	r3, [pc, #4]	; (14ec <cls+0xc>)
    14e6:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    14e8:	4798      	blx	r3
}
    14ea:	bd80      	pop	{r7, pc}
    14ec:	200000f4 	.word	0x200000f4

000014f0 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    14f0:	b480      	push	{r7}
    14f2:	af00      	add	r7, sp, #0
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
    14f4:	4b13      	ldr	r3, [pc, #76]	; (1544 <flash_enable+0x54>)
    14f6:	681b      	ldr	r3, [r3, #0]
    14f8:	f003 0301 	and.w	r3, r3, #1
    14fc:	2b00      	cmp	r3, #0
    14fe:	d10c      	bne.n	151a <flash_enable+0x2a>
		RCC->CR|=RCC_CR_HSION;
    1500:	4a10      	ldr	r2, [pc, #64]	; (1544 <flash_enable+0x54>)
    1502:	4b10      	ldr	r3, [pc, #64]	; (1544 <flash_enable+0x54>)
    1504:	681b      	ldr	r3, [r3, #0]
    1506:	f043 0301 	orr.w	r3, r3, #1
    150a:	6013      	str	r3, [r2, #0]
		while (!(RCC->CR&RCC_CR_HSIRDY));
    150c:	bf00      	nop
    150e:	4b0d      	ldr	r3, [pc, #52]	; (1544 <flash_enable+0x54>)
    1510:	681b      	ldr	r3, [r3, #0]
    1512:	f003 0302 	and.w	r3, r3, #2
    1516:	2b00      	cmp	r3, #0
    1518:	d0f9      	beq.n	150e <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    151a:	4b0b      	ldr	r3, [pc, #44]	; (1548 <flash_enable+0x58>)
    151c:	4a0b      	ldr	r2, [pc, #44]	; (154c <flash_enable+0x5c>)
    151e:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    1520:	4b09      	ldr	r3, [pc, #36]	; (1548 <flash_enable+0x58>)
    1522:	4a0b      	ldr	r2, [pc, #44]	; (1550 <flash_enable+0x60>)
    1524:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    1526:	4b08      	ldr	r3, [pc, #32]	; (1548 <flash_enable+0x58>)
    1528:	691b      	ldr	r3, [r3, #16]
    152a:	f003 0380 	and.w	r3, r3, #128	; 0x80
    152e:	2b00      	cmp	r3, #0
    1530:	bf0c      	ite	eq
    1532:	2301      	moveq	r3, #1
    1534:	2300      	movne	r3, #0
    1536:	b2db      	uxtb	r3, r3
}
    1538:	4618      	mov	r0, r3
    153a:	46bd      	mov	sp, r7
    153c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1540:	4770      	bx	lr
    1542:	bf00      	nop
    1544:	40021000 	.word	0x40021000
    1548:	40022000 	.word	0x40022000
    154c:	45670123 	.word	0x45670123
    1550:	cdef89ab 	.word	0xcdef89ab

00001554 <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    1554:	b480      	push	{r7}
    1556:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    1558:	4a04      	ldr	r2, [pc, #16]	; (156c <flash_disable+0x18>)
    155a:	4b04      	ldr	r3, [pc, #16]	; (156c <flash_disable+0x18>)
    155c:	691b      	ldr	r3, [r3, #16]
    155e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    1562:	6113      	str	r3, [r2, #16]
}
    1564:	46bd      	mov	sp, r7
    1566:	f85d 7b04 	ldr.w	r7, [sp], #4
    156a:	4770      	bx	lr
    156c:	40022000 	.word	0x40022000

00001570 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1570:	b480      	push	{r7}
    1572:	b083      	sub	sp, #12
    1574:	af00      	add	r7, sp, #0
    1576:	6078      	str	r0, [r7, #4]
    1578:	460b      	mov	r3, r1
    157a:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    157c:	4b1d      	ldr	r3, [pc, #116]	; (15f4 <flash_write+0x84>)
    157e:	691b      	ldr	r3, [r3, #16]
    1580:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1584:	2b00      	cmp	r3, #0
    1586:	d105      	bne.n	1594 <flash_write+0x24>
    1588:	687b      	ldr	r3, [r7, #4]
    158a:	881b      	ldrh	r3, [r3, #0]
    158c:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1590:	4293      	cmp	r3, r2
    1592:	d001      	beq.n	1598 <flash_write+0x28>
    1594:	2300      	movs	r3, #0
    1596:	e027      	b.n	15e8 <flash_write+0x78>
	while (_flash_busy);
    1598:	bf00      	nop
    159a:	4b16      	ldr	r3, [pc, #88]	; (15f4 <flash_write+0x84>)
    159c:	68db      	ldr	r3, [r3, #12]
    159e:	f003 0301 	and.w	r3, r3, #1
    15a2:	2b00      	cmp	r3, #0
    15a4:	d1f9      	bne.n	159a <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    15a6:	4a13      	ldr	r2, [pc, #76]	; (15f4 <flash_write+0x84>)
    15a8:	4b12      	ldr	r3, [pc, #72]	; (15f4 <flash_write+0x84>)
    15aa:	68db      	ldr	r3, [r3, #12]
    15ac:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    15b0:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    15b2:	4b10      	ldr	r3, [pc, #64]	; (15f4 <flash_write+0x84>)
    15b4:	2201      	movs	r2, #1
    15b6:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    15b8:	687b      	ldr	r3, [r7, #4]
    15ba:	887a      	ldrh	r2, [r7, #2]
    15bc:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    15be:	bf00      	nop
    15c0:	4b0c      	ldr	r3, [pc, #48]	; (15f4 <flash_write+0x84>)
    15c2:	68db      	ldr	r3, [r3, #12]
    15c4:	f003 0301 	and.w	r3, r3, #1
    15c8:	2b00      	cmp	r3, #0
    15ca:	d005      	beq.n	15d8 <flash_write+0x68>
    15cc:	4b09      	ldr	r3, [pc, #36]	; (15f4 <flash_write+0x84>)
    15ce:	68db      	ldr	r3, [r3, #12]
    15d0:	f003 0320 	and.w	r3, r3, #32
    15d4:	2b00      	cmp	r3, #0
    15d6:	d0f3      	beq.n	15c0 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    15d8:	687b      	ldr	r3, [r7, #4]
    15da:	881b      	ldrh	r3, [r3, #0]
    15dc:	887a      	ldrh	r2, [r7, #2]
    15de:	429a      	cmp	r2, r3
    15e0:	bf0c      	ite	eq
    15e2:	2301      	moveq	r3, #1
    15e4:	2300      	movne	r3, #0
    15e6:	b2db      	uxtb	r3, r3
}
    15e8:	4618      	mov	r0, r3
    15ea:	370c      	adds	r7, #12
    15ec:	46bd      	mov	sp, r7
    15ee:	f85d 7b04 	ldr.w	r7, [sp], #4
    15f2:	4770      	bx	lr
    15f4:	40022000 	.word	0x40022000

000015f8 <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    15f8:	b480      	push	{r7}
    15fa:	b087      	sub	sp, #28
    15fc:	af00      	add	r7, sp, #0
    15fe:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    1600:	4b27      	ldr	r3, [pc, #156]	; (16a0 <flash_erase_page+0xa8>)
    1602:	691b      	ldr	r3, [r3, #16]
    1604:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1608:	2b00      	cmp	r3, #0
    160a:	d001      	beq.n	1610 <flash_erase_page+0x18>
    160c:	2300      	movs	r3, #0
    160e:	e040      	b.n	1692 <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1610:	4a23      	ldr	r2, [pc, #140]	; (16a0 <flash_erase_page+0xa8>)
    1612:	4b23      	ldr	r3, [pc, #140]	; (16a0 <flash_erase_page+0xa8>)
    1614:	68db      	ldr	r3, [r3, #12]
    1616:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    161a:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    161c:	687b      	ldr	r3, [r7, #4]
    161e:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    1622:	f023 0303 	bic.w	r3, r3, #3
    1626:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    1628:	4b1d      	ldr	r3, [pc, #116]	; (16a0 <flash_erase_page+0xa8>)
    162a:	2202      	movs	r2, #2
    162c:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    162e:	4a1c      	ldr	r2, [pc, #112]	; (16a0 <flash_erase_page+0xa8>)
    1630:	687b      	ldr	r3, [r7, #4]
    1632:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    1634:	4a1a      	ldr	r2, [pc, #104]	; (16a0 <flash_erase_page+0xa8>)
    1636:	4b1a      	ldr	r3, [pc, #104]	; (16a0 <flash_erase_page+0xa8>)
    1638:	691b      	ldr	r3, [r3, #16]
    163a:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    163e:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    1640:	bf00      	nop
    1642:	4b17      	ldr	r3, [pc, #92]	; (16a0 <flash_erase_page+0xa8>)
    1644:	68db      	ldr	r3, [r3, #12]
    1646:	f003 0301 	and.w	r3, r3, #1
    164a:	2b00      	cmp	r3, #0
    164c:	d005      	beq.n	165a <flash_erase_page+0x62>
    164e:	4b14      	ldr	r3, [pc, #80]	; (16a0 <flash_erase_page+0xa8>)
    1650:	68db      	ldr	r3, [r3, #12]
    1652:	f003 0320 	and.w	r3, r3, #32
    1656:	2b00      	cmp	r3, #0
    1658:	d0f3      	beq.n	1642 <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    165a:	687b      	ldr	r3, [r7, #4]
    165c:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    165e:	2300      	movs	r3, #0
    1660:	60fb      	str	r3, [r7, #12]
    1662:	e00c      	b.n	167e <flash_erase_page+0x86>
		u32=*adr++;
    1664:	697b      	ldr	r3, [r7, #20]
    1666:	1d1a      	adds	r2, r3, #4
    1668:	617a      	str	r2, [r7, #20]
    166a:	681b      	ldr	r3, [r3, #0]
    166c:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    166e:	693b      	ldr	r3, [r7, #16]
    1670:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1674:	d000      	beq.n	1678 <flash_erase_page+0x80>
    1676:	e005      	b.n	1684 <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    1678:	68fb      	ldr	r3, [r7, #12]
    167a:	3301      	adds	r3, #1
    167c:	60fb      	str	r3, [r7, #12]
    167e:	68fb      	ldr	r3, [r7, #12]
    1680:	2bff      	cmp	r3, #255	; 0xff
    1682:	ddef      	ble.n	1664 <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    1684:	693b      	ldr	r3, [r7, #16]
    1686:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    168a:	bf0c      	ite	eq
    168c:	2301      	moveq	r3, #1
    168e:	2300      	movne	r3, #0
    1690:	b2db      	uxtb	r3, r3
}
    1692:	4618      	mov	r0, r3
    1694:	371c      	adds	r7, #28
    1696:	46bd      	mov	sp, r7
    1698:	f85d 7b04 	ldr.w	r7, [sp], #4
    169c:	4770      	bx	lr
    169e:	bf00      	nop
    16a0:	40022000 	.word	0x40022000

000016a4 <hide_cursor>:
// position  du curseur texte.
static int cursor_x, cursor_y;
static int cursor_visible=0;
static int cursor_blink=0;

static void hide_cursor(){
    16a4:	b580      	push	{r7, lr}
    16a6:	b082      	sub	sp, #8
    16a8:	af02      	add	r7, sp, #8
	if (cursor_visible){
    16aa:	4b0c      	ldr	r3, [pc, #48]	; (16dc <hide_cursor+0x38>)
    16ac:	681b      	ldr	r3, [r3, #0]
    16ae:	2b00      	cmp	r3, #0
    16b0:	d011      	beq.n	16d6 <hide_cursor+0x32>
		disable_interrupt(IRQ_CURSOR_BLINK);
    16b2:	201e      	movs	r0, #30
    16b4:	f000 fe7c 	bl	23b0 <disable_interrupt>
		gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    16b8:	4b09      	ldr	r3, [pc, #36]	; (16e0 <hide_cursor+0x3c>)
    16ba:	6819      	ldr	r1, [r3, #0]
    16bc:	4b09      	ldr	r3, [pc, #36]	; (16e4 <hide_cursor+0x40>)
    16be:	681a      	ldr	r2, [r3, #0]
    16c0:	2300      	movs	r3, #0
    16c2:	9300      	str	r3, [sp, #0]
    16c4:	4608      	mov	r0, r1
    16c6:	4611      	mov	r1, r2
    16c8:	2206      	movs	r2, #6
    16ca:	2308      	movs	r3, #8
    16cc:	f000 f91c 	bl	1908 <gdi_box>
		cursor_visible=0;
    16d0:	4b02      	ldr	r3, [pc, #8]	; (16dc <hide_cursor+0x38>)
    16d2:	2200      	movs	r2, #0
    16d4:	601a      	str	r2, [r3, #0]
	}
}
    16d6:	46bd      	mov	sp, r7
    16d8:	bd80      	pop	{r7, pc}
    16da:	bf00      	nop
    16dc:	200000b4 	.word	0x200000b4
    16e0:	200000ac 	.word	0x200000ac
    16e4:	200000b0 	.word	0x200000b0

000016e8 <gdi_clear_screen>:

void gdi_clear_screen(){
    16e8:	b580      	push	{r7, lr}
    16ea:	b082      	sub	sp, #8
    16ec:	af00      	add	r7, sp, #0
	int i;
	hide_cursor();
    16ee:	f7ff ffd9 	bl	16a4 <hide_cursor>
	for (i=0;i<(ROW_SIZE*VRES);){
    16f2:	2300      	movs	r3, #0
    16f4:	607b      	str	r3, [r7, #4]
    16f6:	e00c      	b.n	1712 <gdi_clear_screen+0x2a>
		video_buffer[i++]=0;
    16f8:	687b      	ldr	r3, [r7, #4]
    16fa:	1c5a      	adds	r2, r3, #1
    16fc:	607a      	str	r2, [r7, #4]
    16fe:	4a0c      	ldr	r2, [pc, #48]	; (1730 <gdi_clear_screen+0x48>)
    1700:	2100      	movs	r1, #0
    1702:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		cursor_x=0;
    1706:	4b0b      	ldr	r3, [pc, #44]	; (1734 <gdi_clear_screen+0x4c>)
    1708:	2200      	movs	r2, #0
    170a:	601a      	str	r2, [r3, #0]
		cursor_y=0;
    170c:	4b0a      	ldr	r3, [pc, #40]	; (1738 <gdi_clear_screen+0x50>)
    170e:	2200      	movs	r2, #0
    1710:	601a      	str	r2, [r3, #0]
}

void gdi_clear_screen(){
	int i;
	hide_cursor();
	for (i=0;i<(ROW_SIZE*VRES);){
    1712:	687b      	ldr	r3, [r7, #4]
    1714:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1718:	dbee      	blt.n	16f8 <gdi_clear_screen+0x10>
		video_buffer[i++]=0;
		cursor_x=0;
		cursor_y=0;
	}
	if (cursor_blink){
    171a:	4b08      	ldr	r3, [pc, #32]	; (173c <gdi_clear_screen+0x54>)
    171c:	681b      	ldr	r3, [r3, #0]
    171e:	2b00      	cmp	r3, #0
    1720:	d002      	beq.n	1728 <gdi_clear_screen+0x40>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1722:	201e      	movs	r0, #30
    1724:	f000 fe20 	bl	2368 <enable_interrupt>
	}
}
    1728:	3708      	adds	r7, #8
    172a:	46bd      	mov	sp, r7
    172c:	bd80      	pop	{r7, pc}
    172e:	bf00      	nop
    1730:	20000138 	.word	0x20000138
    1734:	200000ac 	.word	0x200000ac
    1738:	200000b0 	.word	0x200000b0
    173c:	200000b8 	.word	0x200000b8

00001740 <gdi_scroll_up>:

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
    1740:	b580      	push	{r7, lr}
    1742:	b082      	sub	sp, #8
    1744:	af00      	add	r7, sp, #0
	int i,j=0;
    1746:	2300      	movs	r3, #0
    1748:	603b      	str	r3, [r7, #0]
	hide_cursor();
    174a:	f7ff ffab 	bl	16a4 <hide_cursor>
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    174e:	23a0      	movs	r3, #160	; 0xa0
    1750:	607b      	str	r3, [r7, #4]
    1752:	e00b      	b.n	176c <gdi_scroll_up+0x2c>
		video_buffer[j++]=video_buffer[i++];
    1754:	683b      	ldr	r3, [r7, #0]
    1756:	1c5a      	adds	r2, r3, #1
    1758:	603a      	str	r2, [r7, #0]
    175a:	687a      	ldr	r2, [r7, #4]
    175c:	1c51      	adds	r1, r2, #1
    175e:	6079      	str	r1, [r7, #4]
    1760:	4911      	ldr	r1, [pc, #68]	; (17a8 <gdi_scroll_up+0x68>)
    1762:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    1766:	4a10      	ldr	r2, [pc, #64]	; (17a8 <gdi_scroll_up+0x68>)
    1768:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
	int i,j=0;
	hide_cursor();
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    176c:	687b      	ldr	r3, [r7, #4]
    176e:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1772:	dbef      	blt.n	1754 <gdi_scroll_up+0x14>
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1774:	f44f 5391 	mov.w	r3, #4640	; 0x1220
    1778:	607b      	str	r3, [r7, #4]
    177a:	e006      	b.n	178a <gdi_scroll_up+0x4a>
		video_buffer[i++]=0;
    177c:	687b      	ldr	r3, [r7, #4]
    177e:	1c5a      	adds	r2, r3, #1
    1780:	607a      	str	r2, [r7, #4]
    1782:	4a09      	ldr	r2, [pc, #36]	; (17a8 <gdi_scroll_up+0x68>)
    1784:	2100      	movs	r1, #0
    1786:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i,j=0;
	hide_cursor();
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    178a:	687b      	ldr	r3, [r7, #4]
    178c:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1790:	dbf4      	blt.n	177c <gdi_scroll_up+0x3c>
		video_buffer[i++]=0;
	}
	if (cursor_blink){
    1792:	4b06      	ldr	r3, [pc, #24]	; (17ac <gdi_scroll_up+0x6c>)
    1794:	681b      	ldr	r3, [r3, #0]
    1796:	2b00      	cmp	r3, #0
    1798:	d002      	beq.n	17a0 <gdi_scroll_up+0x60>
		enable_interrupt(IRQ_CURSOR_BLINK);
    179a:	201e      	movs	r0, #30
    179c:	f000 fde4 	bl	2368 <enable_interrupt>
	}
}
    17a0:	3708      	adds	r7, #8
    17a2:	46bd      	mov	sp, r7
    17a4:	bd80      	pop	{r7, pc}
    17a6:	bf00      	nop
    17a8:	20000138 	.word	0x20000138
    17ac:	200000b8 	.word	0x200000b8

000017b0 <gdi_new_line>:

// avance le curseur texte au début 
// de la ligne suivante.
void gdi_new_line(){
    17b0:	b580      	push	{r7, lr}
    17b2:	af00      	add	r7, sp, #0
	hide_cursor();
    17b4:	f7ff ff76 	bl	16a4 <hide_cursor>
	
	cursor_x=0;
    17b8:	4b0c      	ldr	r3, [pc, #48]	; (17ec <gdi_new_line+0x3c>)
    17ba:	2200      	movs	r2, #0
    17bc:	601a      	str	r2, [r3, #0]
	cursor_y+=CHAR_HEIGHT;
    17be:	4b0c      	ldr	r3, [pc, #48]	; (17f0 <gdi_new_line+0x40>)
    17c0:	681b      	ldr	r3, [r3, #0]
    17c2:	3308      	adds	r3, #8
    17c4:	4a0a      	ldr	r2, [pc, #40]	; (17f0 <gdi_new_line+0x40>)
    17c6:	6013      	str	r3, [r2, #0]
	if (cursor_y>(VRES-CHAR_HEIGHT)){
    17c8:	4b09      	ldr	r3, [pc, #36]	; (17f0 <gdi_new_line+0x40>)
    17ca:	681b      	ldr	r3, [r3, #0]
    17cc:	2be8      	cmp	r3, #232	; 0xe8
    17ce:	dd04      	ble.n	17da <gdi_new_line+0x2a>
		cursor_y=VRES-CHAR_HEIGHT;
    17d0:	4b07      	ldr	r3, [pc, #28]	; (17f0 <gdi_new_line+0x40>)
    17d2:	22e8      	movs	r2, #232	; 0xe8
    17d4:	601a      	str	r2, [r3, #0]
		gdi_scroll_up();
    17d6:	f7ff ffb3 	bl	1740 <gdi_scroll_up>
	}
	if (cursor_blink){
    17da:	4b06      	ldr	r3, [pc, #24]	; (17f4 <gdi_new_line+0x44>)
    17dc:	681b      	ldr	r3, [r3, #0]
    17de:	2b00      	cmp	r3, #0
    17e0:	d002      	beq.n	17e8 <gdi_new_line+0x38>
		enable_interrupt(IRQ_CURSOR_BLINK);
    17e2:	201e      	movs	r0, #30
    17e4:	f000 fdc0 	bl	2368 <enable_interrupt>
	}
}
    17e8:	bd80      	pop	{r7, pc}
    17ea:	bf00      	nop
    17ec:	200000ac 	.word	0x200000ac
    17f0:	200000b0 	.word	0x200000b0
    17f4:	200000b8 	.word	0x200000b8

000017f8 <gdi_cursor_left>:

void gdi_cursor_left(){
    17f8:	b580      	push	{r7, lr}
    17fa:	af00      	add	r7, sp, #0
	hide_cursor();
    17fc:	f7ff ff52 	bl	16a4 <hide_cursor>
	if (!(cursor_x|cursor_y)) return;
    1800:	4b16      	ldr	r3, [pc, #88]	; (185c <gdi_cursor_left+0x64>)
    1802:	681a      	ldr	r2, [r3, #0]
    1804:	4b16      	ldr	r3, [pc, #88]	; (1860 <gdi_cursor_left+0x68>)
    1806:	681b      	ldr	r3, [r3, #0]
    1808:	4313      	orrs	r3, r2
    180a:	2b00      	cmp	r3, #0
    180c:	d100      	bne.n	1810 <gdi_cursor_left+0x18>
    180e:	e024      	b.n	185a <gdi_cursor_left+0x62>
	if (cursor_x>=CHAR_WIDTH){
    1810:	4b12      	ldr	r3, [pc, #72]	; (185c <gdi_cursor_left+0x64>)
    1812:	681b      	ldr	r3, [r3, #0]
    1814:	2b05      	cmp	r3, #5
    1816:	dd05      	ble.n	1824 <gdi_cursor_left+0x2c>
		cursor_x-=CHAR_WIDTH;
    1818:	4b10      	ldr	r3, [pc, #64]	; (185c <gdi_cursor_left+0x64>)
    181a:	681b      	ldr	r3, [r3, #0]
    181c:	3b06      	subs	r3, #6
    181e:	4a0f      	ldr	r2, [pc, #60]	; (185c <gdi_cursor_left+0x64>)
    1820:	6013      	str	r3, [r2, #0]
    1822:	e013      	b.n	184c <gdi_cursor_left+0x54>
	}else if (cursor_y) {
    1824:	4b0e      	ldr	r3, [pc, #56]	; (1860 <gdi_cursor_left+0x68>)
    1826:	681b      	ldr	r3, [r3, #0]
    1828:	2b00      	cmp	r3, #0
    182a:	d00f      	beq.n	184c <gdi_cursor_left+0x54>
		cursor_x=CHAR_WIDTH*(CHARS_PER_LINE-1);
    182c:	4b0b      	ldr	r3, [pc, #44]	; (185c <gdi_cursor_left+0x64>)
    182e:	f44f 729c 	mov.w	r2, #312	; 0x138
    1832:	601a      	str	r2, [r3, #0]
		cursor_y-=CHAR_HEIGHT;
    1834:	4b0a      	ldr	r3, [pc, #40]	; (1860 <gdi_cursor_left+0x68>)
    1836:	681b      	ldr	r3, [r3, #0]
    1838:	3b08      	subs	r3, #8
    183a:	4a09      	ldr	r2, [pc, #36]	; (1860 <gdi_cursor_left+0x68>)
    183c:	6013      	str	r3, [r2, #0]
		if (cursor_y<0) cursor_y=0;
    183e:	4b08      	ldr	r3, [pc, #32]	; (1860 <gdi_cursor_left+0x68>)
    1840:	681b      	ldr	r3, [r3, #0]
    1842:	2b00      	cmp	r3, #0
    1844:	da02      	bge.n	184c <gdi_cursor_left+0x54>
    1846:	4b06      	ldr	r3, [pc, #24]	; (1860 <gdi_cursor_left+0x68>)
    1848:	2200      	movs	r2, #0
    184a:	601a      	str	r2, [r3, #0]
	}
	if (cursor_blink){
    184c:	4b05      	ldr	r3, [pc, #20]	; (1864 <gdi_cursor_left+0x6c>)
    184e:	681b      	ldr	r3, [r3, #0]
    1850:	2b00      	cmp	r3, #0
    1852:	d002      	beq.n	185a <gdi_cursor_left+0x62>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1854:	201e      	movs	r0, #30
    1856:	f000 fd87 	bl	2368 <enable_interrupt>
	}
}
    185a:	bd80      	pop	{r7, pc}
    185c:	200000ac 	.word	0x200000ac
    1860:	200000b0 	.word	0x200000b0
    1864:	200000b8 	.word	0x200000b8

00001868 <gdi_bit_op>:


void gdi_bit_op(int x, int y, bitop_e op){
    1868:	b480      	push	{r7}
    186a:	b087      	sub	sp, #28
    186c:	af00      	add	r7, sp, #0
    186e:	60f8      	str	r0, [r7, #12]
    1870:	60b9      	str	r1, [r7, #8]
    1872:	4613      	mov	r3, r2
    1874:	71fb      	strb	r3, [r7, #7]
	uint16_t bit;
	int offset=y*ROW_SIZE+(x>>4);
    1876:	68ba      	ldr	r2, [r7, #8]
    1878:	4613      	mov	r3, r2
    187a:	009b      	lsls	r3, r3, #2
    187c:	4413      	add	r3, r2
    187e:	009b      	lsls	r3, r3, #2
    1880:	461a      	mov	r2, r3
    1882:	68fb      	ldr	r3, [r7, #12]
    1884:	111b      	asrs	r3, r3, #4
    1886:	4413      	add	r3, r2
    1888:	617b      	str	r3, [r7, #20]
	bit=1<<(15-(x&15));
    188a:	68fb      	ldr	r3, [r7, #12]
    188c:	43db      	mvns	r3, r3
    188e:	f003 030f 	and.w	r3, r3, #15
    1892:	2201      	movs	r2, #1
    1894:	fa02 f303 	lsl.w	r3, r2, r3
    1898:	827b      	strh	r3, [r7, #18]
	switch (op){
    189a:	79fb      	ldrb	r3, [r7, #7]
    189c:	2b01      	cmp	r3, #1
    189e:	d013      	beq.n	18c8 <gdi_bit_op+0x60>
    18a0:	2b02      	cmp	r3, #2
    18a2:	d01d      	beq.n	18e0 <gdi_bit_op+0x78>
    18a4:	2b00      	cmp	r3, #0
    18a6:	d127      	bne.n	18f8 <gdi_bit_op+0x90>
	case BLACK_BIT:
		video_buffer[offset]&=~bit;
    18a8:	4a16      	ldr	r2, [pc, #88]	; (1904 <gdi_bit_op+0x9c>)
    18aa:	697b      	ldr	r3, [r7, #20]
    18ac:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    18b0:	b29a      	uxth	r2, r3
    18b2:	8a7b      	ldrh	r3, [r7, #18]
    18b4:	43db      	mvns	r3, r3
    18b6:	b29b      	uxth	r3, r3
    18b8:	4013      	ands	r3, r2
    18ba:	b29b      	uxth	r3, r3
    18bc:	b299      	uxth	r1, r3
    18be:	4a11      	ldr	r2, [pc, #68]	; (1904 <gdi_bit_op+0x9c>)
    18c0:	697b      	ldr	r3, [r7, #20]
    18c2:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    18c6:	e017      	b.n	18f8 <gdi_bit_op+0x90>
	case WHITE_BIT:
		video_buffer[offset]|=bit;
    18c8:	4a0e      	ldr	r2, [pc, #56]	; (1904 <gdi_bit_op+0x9c>)
    18ca:	697b      	ldr	r3, [r7, #20]
    18cc:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    18d0:	8a7b      	ldrh	r3, [r7, #18]
    18d2:	4313      	orrs	r3, r2
    18d4:	b299      	uxth	r1, r3
    18d6:	4a0b      	ldr	r2, [pc, #44]	; (1904 <gdi_bit_op+0x9c>)
    18d8:	697b      	ldr	r3, [r7, #20]
    18da:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    18de:	e00b      	b.n	18f8 <gdi_bit_op+0x90>
	case XOR_BIT:
		video_buffer[offset]^=bit;
    18e0:	4a08      	ldr	r2, [pc, #32]	; (1904 <gdi_bit_op+0x9c>)
    18e2:	697b      	ldr	r3, [r7, #20]
    18e4:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    18e8:	8a7b      	ldrh	r3, [r7, #18]
    18ea:	4053      	eors	r3, r2
    18ec:	b299      	uxth	r1, r3
    18ee:	4a05      	ldr	r2, [pc, #20]	; (1904 <gdi_bit_op+0x9c>)
    18f0:	697b      	ldr	r3, [r7, #20]
    18f2:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    18f6:	bf00      	nop
	}
}
    18f8:	371c      	adds	r7, #28
    18fa:	46bd      	mov	sp, r7
    18fc:	f85d 7b04 	ldr.w	r7, [sp], #4
    1900:	4770      	bx	lr
    1902:	bf00      	nop
    1904:	20000138 	.word	0x20000138

00001908 <gdi_box>:

void gdi_box(int x, int y, int w, int h, bitop_e op){
    1908:	b580      	push	{r7, lr}
    190a:	b086      	sub	sp, #24
    190c:	af00      	add	r7, sp, #0
    190e:	60f8      	str	r0, [r7, #12]
    1910:	60b9      	str	r1, [r7, #8]
    1912:	607a      	str	r2, [r7, #4]
    1914:	603b      	str	r3, [r7, #0]
	int r,c;
	
	for (r=0;r<h;r++){
    1916:	2300      	movs	r3, #0
    1918:	617b      	str	r3, [r7, #20]
    191a:	e02e      	b.n	197a <gdi_box+0x72>
		for (c=0;c<w;c++){
    191c:	2300      	movs	r3, #0
    191e:	613b      	str	r3, [r7, #16]
    1920:	e024      	b.n	196c <gdi_box+0x64>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    1922:	68fa      	ldr	r2, [r7, #12]
    1924:	693b      	ldr	r3, [r7, #16]
    1926:	4413      	add	r3, r2
    1928:	2b00      	cmp	r3, #0
    192a:	db1c      	blt.n	1966 <gdi_box+0x5e>
    192c:	68fa      	ldr	r2, [r7, #12]
    192e:	693b      	ldr	r3, [r7, #16]
    1930:	4413      	add	r3, r2
    1932:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    1936:	da16      	bge.n	1966 <gdi_box+0x5e>
    1938:	697a      	ldr	r2, [r7, #20]
    193a:	68bb      	ldr	r3, [r7, #8]
    193c:	4413      	add	r3, r2
    193e:	2b00      	cmp	r3, #0
    1940:	db11      	blt.n	1966 <gdi_box+0x5e>
    1942:	697a      	ldr	r2, [r7, #20]
    1944:	68bb      	ldr	r3, [r7, #8]
    1946:	4413      	add	r3, r2
    1948:	2bef      	cmp	r3, #239	; 0xef
    194a:	dc0c      	bgt.n	1966 <gdi_box+0x5e>
				gdi_bit_op(c+x,r+y,op);
    194c:	693a      	ldr	r2, [r7, #16]
    194e:	68fb      	ldr	r3, [r7, #12]
    1950:	18d1      	adds	r1, r2, r3
    1952:	697a      	ldr	r2, [r7, #20]
    1954:	68bb      	ldr	r3, [r7, #8]
    1956:	441a      	add	r2, r3
    1958:	f897 3020 	ldrb.w	r3, [r7, #32]
    195c:	4608      	mov	r0, r1
    195e:	4611      	mov	r1, r2
    1960:	461a      	mov	r2, r3
    1962:	f7ff ff81 	bl	1868 <gdi_bit_op>

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
		for (c=0;c<w;c++){
    1966:	693b      	ldr	r3, [r7, #16]
    1968:	3301      	adds	r3, #1
    196a:	613b      	str	r3, [r7, #16]
    196c:	693a      	ldr	r2, [r7, #16]
    196e:	687b      	ldr	r3, [r7, #4]
    1970:	429a      	cmp	r2, r3
    1972:	dbd6      	blt.n	1922 <gdi_box+0x1a>
}

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
    1974:	697b      	ldr	r3, [r7, #20]
    1976:	3301      	adds	r3, #1
    1978:	617b      	str	r3, [r7, #20]
    197a:	697a      	ldr	r2, [r7, #20]
    197c:	683b      	ldr	r3, [r7, #0]
    197e:	429a      	cmp	r2, r3
    1980:	dbcc      	blt.n	191c <gdi_box+0x14>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				gdi_bit_op(c+x,r+y,op);
			}
		}
	}
}
    1982:	3718      	adds	r7, #24
    1984:	46bd      	mov	sp, r7
    1986:	bd80      	pop	{r7, pc}

00001988 <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
    1988:	b480      	push	{r7}
    198a:	b089      	sub	sp, #36	; 0x24
    198c:	af00      	add	r7, sp, #0
    198e:	60f8      	str	r0, [r7, #12]
    1990:	60b9      	str	r1, [r7, #8]
    1992:	607a      	str	r2, [r7, #4]
    1994:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1996:	2300      	movs	r3, #0
    1998:	61fb      	str	r3, [r7, #28]
    199a:	e099      	b.n	1ad0 <gdi_put_sprite+0x148>
		mask=128;
    199c:	2380      	movs	r3, #128	; 0x80
    199e:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    19a0:	2300      	movs	r3, #0
    19a2:	61bb      	str	r3, [r7, #24]
    19a4:	e08c      	b.n	1ac0 <gdi_put_sprite+0x138>
			if (!mask){
    19a6:	7dfb      	ldrb	r3, [r7, #23]
    19a8:	2b00      	cmp	r3, #0
    19aa:	d104      	bne.n	19b6 <gdi_put_sprite+0x2e>
				sprite++;
    19ac:	6abb      	ldr	r3, [r7, #40]	; 0x28
    19ae:	3301      	adds	r3, #1
    19b0:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    19b2:	2380      	movs	r3, #128	; 0x80
    19b4:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    19b6:	68fa      	ldr	r2, [r7, #12]
    19b8:	69bb      	ldr	r3, [r7, #24]
    19ba:	4413      	add	r3, r2
    19bc:	2b00      	cmp	r3, #0
    19be:	db79      	blt.n	1ab4 <gdi_put_sprite+0x12c>
    19c0:	68fa      	ldr	r2, [r7, #12]
    19c2:	69bb      	ldr	r3, [r7, #24]
    19c4:	4413      	add	r3, r2
    19c6:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    19ca:	da73      	bge.n	1ab4 <gdi_put_sprite+0x12c>
    19cc:	69fa      	ldr	r2, [r7, #28]
    19ce:	68bb      	ldr	r3, [r7, #8]
    19d0:	4413      	add	r3, r2
    19d2:	2b00      	cmp	r3, #0
    19d4:	db6e      	blt.n	1ab4 <gdi_put_sprite+0x12c>
    19d6:	69fa      	ldr	r2, [r7, #28]
    19d8:	68bb      	ldr	r3, [r7, #8]
    19da:	4413      	add	r3, r2
    19dc:	2bef      	cmp	r3, #239	; 0xef
    19de:	dc69      	bgt.n	1ab4 <gdi_put_sprite+0x12c>
				if (sprite[r]&mask){
    19e0:	69fb      	ldr	r3, [r7, #28]
    19e2:	6aba      	ldr	r2, [r7, #40]	; 0x28
    19e4:	4413      	add	r3, r2
    19e6:	781a      	ldrb	r2, [r3, #0]
    19e8:	7dfb      	ldrb	r3, [r7, #23]
    19ea:	4013      	ands	r3, r2
    19ec:	b2db      	uxtb	r3, r3
    19ee:	2b00      	cmp	r3, #0
    19f0:	d02f      	beq.n	1a52 <gdi_put_sprite+0xca>
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]|=(1<<(15-((c+x)&15)));
    19f2:	69fa      	ldr	r2, [r7, #28]
    19f4:	68bb      	ldr	r3, [r7, #8]
    19f6:	441a      	add	r2, r3
    19f8:	4613      	mov	r3, r2
    19fa:	009b      	lsls	r3, r3, #2
    19fc:	4413      	add	r3, r2
    19fe:	009b      	lsls	r3, r3, #2
    1a00:	4619      	mov	r1, r3
    1a02:	69ba      	ldr	r2, [r7, #24]
    1a04:	68fb      	ldr	r3, [r7, #12]
    1a06:	4413      	add	r3, r2
    1a08:	111b      	asrs	r3, r3, #4
    1a0a:	4419      	add	r1, r3
    1a0c:	69fa      	ldr	r2, [r7, #28]
    1a0e:	68bb      	ldr	r3, [r7, #8]
    1a10:	441a      	add	r2, r3
    1a12:	4613      	mov	r3, r2
    1a14:	009b      	lsls	r3, r3, #2
    1a16:	4413      	add	r3, r2
    1a18:	009b      	lsls	r3, r3, #2
    1a1a:	4618      	mov	r0, r3
    1a1c:	69ba      	ldr	r2, [r7, #24]
    1a1e:	68fb      	ldr	r3, [r7, #12]
    1a20:	4413      	add	r3, r2
    1a22:	111b      	asrs	r3, r3, #4
    1a24:	4403      	add	r3, r0
    1a26:	4a2f      	ldr	r2, [pc, #188]	; (1ae4 <gdi_put_sprite+0x15c>)
    1a28:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1a2c:	b298      	uxth	r0, r3
    1a2e:	69ba      	ldr	r2, [r7, #24]
    1a30:	68fb      	ldr	r3, [r7, #12]
    1a32:	4413      	add	r3, r2
    1a34:	43db      	mvns	r3, r3
    1a36:	f003 030f 	and.w	r3, r3, #15
    1a3a:	2201      	movs	r2, #1
    1a3c:	fa02 f303 	lsl.w	r3, r2, r3
    1a40:	b29b      	uxth	r3, r3
    1a42:	4602      	mov	r2, r0
    1a44:	4313      	orrs	r3, r2
    1a46:	b29b      	uxth	r3, r3
    1a48:	b29a      	uxth	r2, r3
    1a4a:	4b26      	ldr	r3, [pc, #152]	; (1ae4 <gdi_put_sprite+0x15c>)
    1a4c:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
    1a50:	e030      	b.n	1ab4 <gdi_put_sprite+0x12c>
				}else{
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]&=~(1<<(15-((c+x)&15)));
    1a52:	69fa      	ldr	r2, [r7, #28]
    1a54:	68bb      	ldr	r3, [r7, #8]
    1a56:	441a      	add	r2, r3
    1a58:	4613      	mov	r3, r2
    1a5a:	009b      	lsls	r3, r3, #2
    1a5c:	4413      	add	r3, r2
    1a5e:	009b      	lsls	r3, r3, #2
    1a60:	4619      	mov	r1, r3
    1a62:	69ba      	ldr	r2, [r7, #24]
    1a64:	68fb      	ldr	r3, [r7, #12]
    1a66:	4413      	add	r3, r2
    1a68:	111b      	asrs	r3, r3, #4
    1a6a:	4419      	add	r1, r3
    1a6c:	69fa      	ldr	r2, [r7, #28]
    1a6e:	68bb      	ldr	r3, [r7, #8]
    1a70:	441a      	add	r2, r3
    1a72:	4613      	mov	r3, r2
    1a74:	009b      	lsls	r3, r3, #2
    1a76:	4413      	add	r3, r2
    1a78:	009b      	lsls	r3, r3, #2
    1a7a:	4618      	mov	r0, r3
    1a7c:	69ba      	ldr	r2, [r7, #24]
    1a7e:	68fb      	ldr	r3, [r7, #12]
    1a80:	4413      	add	r3, r2
    1a82:	111b      	asrs	r3, r3, #4
    1a84:	4403      	add	r3, r0
    1a86:	4a17      	ldr	r2, [pc, #92]	; (1ae4 <gdi_put_sprite+0x15c>)
    1a88:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1a8c:	b298      	uxth	r0, r3
    1a8e:	69ba      	ldr	r2, [r7, #24]
    1a90:	68fb      	ldr	r3, [r7, #12]
    1a92:	4413      	add	r3, r2
    1a94:	43db      	mvns	r3, r3
    1a96:	f003 030f 	and.w	r3, r3, #15
    1a9a:	2201      	movs	r2, #1
    1a9c:	fa02 f303 	lsl.w	r3, r2, r3
    1aa0:	b29b      	uxth	r3, r3
    1aa2:	43db      	mvns	r3, r3
    1aa4:	b29b      	uxth	r3, r3
    1aa6:	4602      	mov	r2, r0
    1aa8:	4013      	ands	r3, r2
    1aaa:	b29b      	uxth	r3, r3
    1aac:	b29a      	uxth	r2, r3
    1aae:	4b0d      	ldr	r3, [pc, #52]	; (1ae4 <gdi_put_sprite+0x15c>)
    1ab0:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
				//bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
				//video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]|=bit;
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
    1ab4:	7dfb      	ldrb	r3, [r7, #23]
    1ab6:	085b      	lsrs	r3, r3, #1
    1ab8:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    1aba:	69bb      	ldr	r3, [r7, #24]
    1abc:	3301      	adds	r3, #1
    1abe:	61bb      	str	r3, [r7, #24]
    1ac0:	69ba      	ldr	r2, [r7, #24]
    1ac2:	687b      	ldr	r3, [r7, #4]
    1ac4:	429a      	cmp	r2, r3
    1ac6:	f6ff af6e 	blt.w	19a6 <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1aca:	69fb      	ldr	r3, [r7, #28]
    1acc:	3301      	adds	r3, #1
    1ace:	61fb      	str	r3, [r7, #28]
    1ad0:	69fa      	ldr	r2, [r7, #28]
    1ad2:	683b      	ldr	r3, [r7, #0]
    1ad4:	429a      	cmp	r2, r3
    1ad6:	f6ff af61 	blt.w	199c <gdi_put_sprite+0x14>
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    1ada:	3724      	adds	r7, #36	; 0x24
    1adc:	46bd      	mov	sp, r7
    1ade:	f85d 7b04 	ldr.w	r7, [sp], #4
    1ae2:	4770      	bx	lr
    1ae4:	20000138 	.word	0x20000138

00001ae8 <gdi_del_back>:

void gdi_del_back(){
    1ae8:	b580      	push	{r7, lr}
    1aea:	b082      	sub	sp, #8
    1aec:	af02      	add	r7, sp, #8
	gdi_cursor_left();
    1aee:	f7ff fe83 	bl	17f8 <gdi_cursor_left>
	hide_cursor();
    1af2:	f7ff fdd7 	bl	16a4 <hide_cursor>
	gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    1af6:	4b0a      	ldr	r3, [pc, #40]	; (1b20 <gdi_del_back+0x38>)
    1af8:	6819      	ldr	r1, [r3, #0]
    1afa:	4b0a      	ldr	r3, [pc, #40]	; (1b24 <gdi_del_back+0x3c>)
    1afc:	681a      	ldr	r2, [r3, #0]
    1afe:	2300      	movs	r3, #0
    1b00:	9300      	str	r3, [sp, #0]
    1b02:	4608      	mov	r0, r1
    1b04:	4611      	mov	r1, r2
    1b06:	2206      	movs	r2, #6
    1b08:	2308      	movs	r3, #8
    1b0a:	f7ff fefd 	bl	1908 <gdi_box>
	if (cursor_blink){
    1b0e:	4b06      	ldr	r3, [pc, #24]	; (1b28 <gdi_del_back+0x40>)
    1b10:	681b      	ldr	r3, [r3, #0]
    1b12:	2b00      	cmp	r3, #0
    1b14:	d002      	beq.n	1b1c <gdi_del_back+0x34>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1b16:	201e      	movs	r0, #30
    1b18:	f000 fc26 	bl	2368 <enable_interrupt>
	}
}
    1b1c:	46bd      	mov	sp, r7
    1b1e:	bd80      	pop	{r7, pc}
    1b20:	200000ac 	.word	0x200000ac
    1b24:	200000b0 	.word	0x200000b0
    1b28:	200000b8 	.word	0x200000b8

00001b2c <gdi_putc>:

// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void gdi_putc(char c){
    1b2c:	b580      	push	{r7, lr}
    1b2e:	b084      	sub	sp, #16
    1b30:	af02      	add	r7, sp, #8
    1b32:	4603      	mov	r3, r0
    1b34:	71fb      	strb	r3, [r7, #7]
		hide_cursor();
    1b36:	f7ff fdb5 	bl	16a4 <hide_cursor>
		switch (c){
    1b3a:	79fb      	ldrb	r3, [r7, #7]
    1b3c:	2b0a      	cmp	r3, #10
    1b3e:	d004      	beq.n	1b4a <gdi_putc+0x1e>
    1b40:	2b0d      	cmp	r3, #13
    1b42:	d002      	beq.n	1b4a <gdi_putc+0x1e>
    1b44:	2b08      	cmp	r3, #8
    1b46:	d003      	beq.n	1b50 <gdi_putc+0x24>
    1b48:	e005      	b.n	1b56 <gdi_putc+0x2a>
		case '\n':
		case CR:
			gdi_new_line();
    1b4a:	f7ff fe31 	bl	17b0 <gdi_new_line>
			break;
    1b4e:	e021      	b.n	1b94 <gdi_putc+0x68>
		case BS:
			gdi_del_back();
    1b50:	f7ff ffca 	bl	1ae8 <gdi_del_back>
			break;
    1b54:	e01e      	b.n	1b94 <gdi_putc+0x68>
		default:
			if (c<FONT_SIZE){
    1b56:	79fb      	ldrb	r3, [r7, #7]
    1b58:	b25b      	sxtb	r3, r3
    1b5a:	2b00      	cmp	r3, #0
    1b5c:	db19      	blt.n	1b92 <gdi_putc+0x66>
				gdi_put_sprite(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,(const unsigned char *)&font6x8[c]);
    1b5e:	4b12      	ldr	r3, [pc, #72]	; (1ba8 <gdi_putc+0x7c>)
    1b60:	6818      	ldr	r0, [r3, #0]
    1b62:	4b12      	ldr	r3, [pc, #72]	; (1bac <gdi_putc+0x80>)
    1b64:	6819      	ldr	r1, [r3, #0]
    1b66:	79fb      	ldrb	r3, [r7, #7]
    1b68:	00db      	lsls	r3, r3, #3
    1b6a:	4a11      	ldr	r2, [pc, #68]	; (1bb0 <gdi_putc+0x84>)
    1b6c:	4413      	add	r3, r2
    1b6e:	9300      	str	r3, [sp, #0]
    1b70:	2206      	movs	r2, #6
    1b72:	2308      	movs	r3, #8
    1b74:	f7ff ff08 	bl	1988 <gdi_put_sprite>
				cursor_x+=CHAR_WIDTH;
    1b78:	4b0b      	ldr	r3, [pc, #44]	; (1ba8 <gdi_putc+0x7c>)
    1b7a:	681b      	ldr	r3, [r3, #0]
    1b7c:	3306      	adds	r3, #6
    1b7e:	4a0a      	ldr	r2, [pc, #40]	; (1ba8 <gdi_putc+0x7c>)
    1b80:	6013      	str	r3, [r2, #0]
				if (cursor_x>(HRES-CHAR_WIDTH)){
    1b82:	4b09      	ldr	r3, [pc, #36]	; (1ba8 <gdi_putc+0x7c>)
    1b84:	681b      	ldr	r3, [r3, #0]
    1b86:	f5b3 7f9d 	cmp.w	r3, #314	; 0x13a
    1b8a:	dd02      	ble.n	1b92 <gdi_putc+0x66>
					gdi_new_line();
    1b8c:	f7ff fe10 	bl	17b0 <gdi_new_line>
				}
			}
			break;
    1b90:	e7ff      	b.n	1b92 <gdi_putc+0x66>
    1b92:	bf00      	nop
		}//switch
		if (cursor_blink){
    1b94:	4b07      	ldr	r3, [pc, #28]	; (1bb4 <gdi_putc+0x88>)
    1b96:	681b      	ldr	r3, [r3, #0]
    1b98:	2b00      	cmp	r3, #0
    1b9a:	d002      	beq.n	1ba2 <gdi_putc+0x76>
			enable_interrupt(IRQ_CURSOR_BLINK);
    1b9c:	201e      	movs	r0, #30
    1b9e:	f000 fbe3 	bl	2368 <enable_interrupt>
		}
}
    1ba2:	3708      	adds	r7, #8
    1ba4:	46bd      	mov	sp, r7
    1ba6:	bd80      	pop	{r7, pc}
    1ba8:	200000ac 	.word	0x200000ac
    1bac:	200000b0 	.word	0x200000b0
    1bb0:	000036d8 	.word	0x000036d8
    1bb4:	200000b8 	.word	0x200000b8

00001bb8 <gdi_print>:

void gdi_print(const char *str){
    1bb8:	b580      	push	{r7, lr}
    1bba:	b082      	sub	sp, #8
    1bbc:	af00      	add	r7, sp, #0
    1bbe:	6078      	str	r0, [r7, #4]
	while (*str) gdi_putc(*str++);
    1bc0:	e006      	b.n	1bd0 <gdi_print+0x18>
    1bc2:	687b      	ldr	r3, [r7, #4]
    1bc4:	1c5a      	adds	r2, r3, #1
    1bc6:	607a      	str	r2, [r7, #4]
    1bc8:	781b      	ldrb	r3, [r3, #0]
    1bca:	4618      	mov	r0, r3
    1bcc:	f7ff ffae 	bl	1b2c <gdi_putc>
    1bd0:	687b      	ldr	r3, [r7, #4]
    1bd2:	781b      	ldrb	r3, [r3, #0]
    1bd4:	2b00      	cmp	r3, #0
    1bd6:	d1f4      	bne.n	1bc2 <gdi_print+0xa>
}
    1bd8:	3708      	adds	r7, #8
    1bda:	46bd      	mov	sp, r7
    1bdc:	bd80      	pop	{r7, pc}
    1bde:	bf00      	nop

00001be0 <gdi_clrln>:

void gdi_clrln(){
    1be0:	b480      	push	{r7}
    1be2:	b083      	sub	sp, #12
    1be4:	af00      	add	r7, sp, #0
	int i;
	cursor_x=0;
    1be6:	4b11      	ldr	r3, [pc, #68]	; (1c2c <gdi_clrln+0x4c>)
    1be8:	2200      	movs	r2, #0
    1bea:	601a      	str	r2, [r3, #0]
	for (i=cursor_y*ROW_SIZE;i<cursor_y*ROW_SIZE*8;i++){
    1bec:	4b10      	ldr	r3, [pc, #64]	; (1c30 <gdi_clrln+0x50>)
    1bee:	681a      	ldr	r2, [r3, #0]
    1bf0:	4613      	mov	r3, r2
    1bf2:	009b      	lsls	r3, r3, #2
    1bf4:	4413      	add	r3, r2
    1bf6:	009b      	lsls	r3, r3, #2
    1bf8:	607b      	str	r3, [r7, #4]
    1bfa:	e007      	b.n	1c0c <gdi_clrln+0x2c>
		video_buffer[i]=0;
    1bfc:	4a0d      	ldr	r2, [pc, #52]	; (1c34 <gdi_clrln+0x54>)
    1bfe:	687b      	ldr	r3, [r7, #4]
    1c00:	2100      	movs	r1, #0
    1c02:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
}

void gdi_clrln(){
	int i;
	cursor_x=0;
	for (i=cursor_y*ROW_SIZE;i<cursor_y*ROW_SIZE*8;i++){
    1c06:	687b      	ldr	r3, [r7, #4]
    1c08:	3301      	adds	r3, #1
    1c0a:	607b      	str	r3, [r7, #4]
    1c0c:	4b08      	ldr	r3, [pc, #32]	; (1c30 <gdi_clrln+0x50>)
    1c0e:	681a      	ldr	r2, [r3, #0]
    1c10:	4613      	mov	r3, r2
    1c12:	009b      	lsls	r3, r3, #2
    1c14:	4413      	add	r3, r2
    1c16:	015b      	lsls	r3, r3, #5
    1c18:	461a      	mov	r2, r3
    1c1a:	687b      	ldr	r3, [r7, #4]
    1c1c:	429a      	cmp	r2, r3
    1c1e:	dced      	bgt.n	1bfc <gdi_clrln+0x1c>
		video_buffer[i]=0;
	}
}
    1c20:	370c      	adds	r7, #12
    1c22:	46bd      	mov	sp, r7
    1c24:	f85d 7b04 	ldr.w	r7, [sp], #4
    1c28:	4770      	bx	lr
    1c2a:	bf00      	nop
    1c2c:	200000ac 	.word	0x200000ac
    1c30:	200000b0 	.word	0x200000b0
    1c34:	20000138 	.word	0x20000138

00001c38 <gdi_text_cursor>:

void gdi_text_cursor(int enable){
    1c38:	b580      	push	{r7, lr}
    1c3a:	b084      	sub	sp, #16
    1c3c:	af02      	add	r7, sp, #8
    1c3e:	6078      	str	r0, [r7, #4]
	if (enable){
    1c40:	687b      	ldr	r3, [r7, #4]
    1c42:	2b00      	cmp	r3, #0
    1c44:	d024      	beq.n	1c90 <gdi_text_cursor+0x58>
		// activation clock CURSOR_TMR
		RCC->CURSOR_RCC_ENR|=CURSOR_RCC_EN_BIT; 
    1c46:	4a24      	ldr	r2, [pc, #144]	; (1cd8 <gdi_text_cursor+0xa0>)
    1c48:	4b23      	ldr	r3, [pc, #140]	; (1cd8 <gdi_text_cursor+0xa0>)
    1c4a:	69db      	ldr	r3, [r3, #28]
    1c4c:	f043 0304 	orr.w	r3, r3, #4
    1c50:	61d3      	str	r3, [r2, #28]
		CURSOR_TMR->ARR=FTMR2_4/1000/2;
    1c52:	4b22      	ldr	r3, [pc, #136]	; (1cdc <gdi_text_cursor+0xa4>)
    1c54:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    1c58:	62da      	str	r2, [r3, #44]	; 0x2c
		CURSOR_TMR->PSC=1000;
    1c5a:	4b20      	ldr	r3, [pc, #128]	; (1cdc <gdi_text_cursor+0xa4>)
    1c5c:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    1c60:	629a      	str	r2, [r3, #40]	; 0x28
		CURSOR_TMR->CR1=BIT0|BIT7; // ARPE
    1c62:	4b1e      	ldr	r3, [pc, #120]	; (1cdc <gdi_text_cursor+0xa4>)
    1c64:	2281      	movs	r2, #129	; 0x81
    1c66:	601a      	str	r2, [r3, #0]
		CURSOR_TMR->DIER=BIT0; // UIE
    1c68:	4b1c      	ldr	r3, [pc, #112]	; (1cdc <gdi_text_cursor+0xa4>)
    1c6a:	2201      	movs	r2, #1
    1c6c:	60da      	str	r2, [r3, #12]
		set_int_priority(IRQ_CURSOR_BLINK,15);
    1c6e:	201e      	movs	r0, #30
    1c70:	210f      	movs	r1, #15
    1c72:	f000 fc35 	bl	24e0 <set_int_priority>
		CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
    1c76:	4a19      	ldr	r2, [pc, #100]	; (1cdc <gdi_text_cursor+0xa4>)
    1c78:	4b18      	ldr	r3, [pc, #96]	; (1cdc <gdi_text_cursor+0xa4>)
    1c7a:	691b      	ldr	r3, [r3, #16]
    1c7c:	f023 0301 	bic.w	r3, r3, #1
    1c80:	6113      	str	r3, [r2, #16]
		enable_interrupt(IRQ_CURSOR_BLINK);
    1c82:	201e      	movs	r0, #30
    1c84:	f000 fb70 	bl	2368 <enable_interrupt>
		cursor_blink=1;
    1c88:	4b15      	ldr	r3, [pc, #84]	; (1ce0 <gdi_text_cursor+0xa8>)
    1c8a:	2201      	movs	r2, #1
    1c8c:	601a      	str	r2, [r3, #0]
    1c8e:	e020      	b.n	1cd2 <gdi_text_cursor+0x9a>
	}else{
		disable_interrupt(IRQ_CURSOR_BLINK);
    1c90:	201e      	movs	r0, #30
    1c92:	f000 fb8d 	bl	23b0 <disable_interrupt>
		if (cursor_visible){
    1c96:	4b13      	ldr	r3, [pc, #76]	; (1ce4 <gdi_text_cursor+0xac>)
    1c98:	681b      	ldr	r3, [r3, #0]
    1c9a:	2b00      	cmp	r3, #0
    1c9c:	d010      	beq.n	1cc0 <gdi_text_cursor+0x88>
			gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    1c9e:	4b12      	ldr	r3, [pc, #72]	; (1ce8 <gdi_text_cursor+0xb0>)
    1ca0:	6819      	ldr	r1, [r3, #0]
    1ca2:	4b12      	ldr	r3, [pc, #72]	; (1cec <gdi_text_cursor+0xb4>)
    1ca4:	681a      	ldr	r2, [r3, #0]
    1ca6:	2302      	movs	r3, #2
    1ca8:	9300      	str	r3, [sp, #0]
    1caa:	4608      	mov	r0, r1
    1cac:	4611      	mov	r1, r2
    1cae:	2206      	movs	r2, #6
    1cb0:	2308      	movs	r3, #8
    1cb2:	f7ff fe29 	bl	1908 <gdi_box>
			cursor_visible=~cursor_visible;
    1cb6:	4b0b      	ldr	r3, [pc, #44]	; (1ce4 <gdi_text_cursor+0xac>)
    1cb8:	681b      	ldr	r3, [r3, #0]
    1cba:	43db      	mvns	r3, r3
    1cbc:	4a09      	ldr	r2, [pc, #36]	; (1ce4 <gdi_text_cursor+0xac>)
    1cbe:	6013      	str	r3, [r2, #0]
		}
		CURSOR_TMR->DIER&=~BIT0;
    1cc0:	4a06      	ldr	r2, [pc, #24]	; (1cdc <gdi_text_cursor+0xa4>)
    1cc2:	4b06      	ldr	r3, [pc, #24]	; (1cdc <gdi_text_cursor+0xa4>)
    1cc4:	68db      	ldr	r3, [r3, #12]
    1cc6:	f023 0301 	bic.w	r3, r3, #1
    1cca:	60d3      	str	r3, [r2, #12]
		cursor_blink=0;
    1ccc:	4b04      	ldr	r3, [pc, #16]	; (1ce0 <gdi_text_cursor+0xa8>)
    1cce:	2200      	movs	r2, #0
    1cd0:	601a      	str	r2, [r3, #0]
	}
}
    1cd2:	3708      	adds	r7, #8
    1cd4:	46bd      	mov	sp, r7
    1cd6:	bd80      	pop	{r7, pc}
    1cd8:	40021000 	.word	0x40021000
    1cdc:	40000800 	.word	0x40000800
    1ce0:	200000b8 	.word	0x200000b8
    1ce4:	200000b4 	.word	0x200000b4
    1ce8:	200000ac 	.word	0x200000ac
    1cec:	200000b0 	.word	0x200000b0

00001cf0 <TIM4_handler>:

// interruption clignotement
// curseur texte
void CURSOR_blink_handler(){
    1cf0:	b580      	push	{r7, lr}
    1cf2:	b082      	sub	sp, #8
    1cf4:	af02      	add	r7, sp, #8
	//CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
	if (CURSOR_TMR->SR&BIT0){ // UIF
    1cf6:	4b0f      	ldr	r3, [pc, #60]	; (1d34 <TIM4_handler+0x44>)
    1cf8:	691b      	ldr	r3, [r3, #16]
    1cfa:	f003 0301 	and.w	r3, r3, #1
    1cfe:	2b00      	cmp	r3, #0
    1d00:	d016      	beq.n	1d30 <TIM4_handler+0x40>
		CURSOR_TMR->SR&=~BIT0;
    1d02:	4a0c      	ldr	r2, [pc, #48]	; (1d34 <TIM4_handler+0x44>)
    1d04:	4b0b      	ldr	r3, [pc, #44]	; (1d34 <TIM4_handler+0x44>)
    1d06:	691b      	ldr	r3, [r3, #16]
    1d08:	f023 0301 	bic.w	r3, r3, #1
    1d0c:	6113      	str	r3, [r2, #16]
		gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    1d0e:	4b0a      	ldr	r3, [pc, #40]	; (1d38 <TIM4_handler+0x48>)
    1d10:	6819      	ldr	r1, [r3, #0]
    1d12:	4b0a      	ldr	r3, [pc, #40]	; (1d3c <TIM4_handler+0x4c>)
    1d14:	681a      	ldr	r2, [r3, #0]
    1d16:	2302      	movs	r3, #2
    1d18:	9300      	str	r3, [sp, #0]
    1d1a:	4608      	mov	r0, r1
    1d1c:	4611      	mov	r1, r2
    1d1e:	2206      	movs	r2, #6
    1d20:	2308      	movs	r3, #8
    1d22:	f7ff fdf1 	bl	1908 <gdi_box>
		cursor_visible=~cursor_visible;
    1d26:	4b06      	ldr	r3, [pc, #24]	; (1d40 <TIM4_handler+0x50>)
    1d28:	681b      	ldr	r3, [r3, #0]
    1d2a:	43db      	mvns	r3, r3
    1d2c:	4a04      	ldr	r2, [pc, #16]	; (1d40 <TIM4_handler+0x50>)
    1d2e:	6013      	str	r3, [r2, #0]
	}
}
    1d30:	46bd      	mov	sp, r7
    1d32:	bd80      	pop	{r7, pc}
    1d34:	40000800 	.word	0x40000800
    1d38:	200000ac 	.word	0x200000ac
    1d3c:	200000b0 	.word	0x200000b0
    1d40:	200000b4 	.word	0x200000b4

00001d44 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(gpio_t* port, unsigned pin, unsigned config){
    1d44:	b480      	push	{r7}
    1d46:	b087      	sub	sp, #28
    1d48:	af00      	add	r7, sp, #0
    1d4a:	60f8      	str	r0, [r7, #12]
    1d4c:	60b9      	str	r1, [r7, #8]
    1d4e:	607a      	str	r2, [r7, #4]
	uint8_t shift;
	shift=(pin&7)<<2;
    1d50:	68bb      	ldr	r3, [r7, #8]
    1d52:	b2db      	uxtb	r3, r3
    1d54:	f003 0307 	and.w	r3, r3, #7
    1d58:	b2db      	uxtb	r3, r3
    1d5a:	009b      	lsls	r3, r3, #2
    1d5c:	75fb      	strb	r3, [r7, #23]
	port->CR[pin>>3]&=~(15<<shift);
    1d5e:	68bb      	ldr	r3, [r7, #8]
    1d60:	08da      	lsrs	r2, r3, #3
    1d62:	68bb      	ldr	r3, [r7, #8]
    1d64:	08d9      	lsrs	r1, r3, #3
    1d66:	68fb      	ldr	r3, [r7, #12]
    1d68:	f853 3021 	ldr.w	r3, [r3, r1, lsl #2]
    1d6c:	7df9      	ldrb	r1, [r7, #23]
    1d6e:	200f      	movs	r0, #15
    1d70:	fa00 f101 	lsl.w	r1, r0, r1
    1d74:	43c9      	mvns	r1, r1
    1d76:	4019      	ands	r1, r3
    1d78:	68fb      	ldr	r3, [r7, #12]
    1d7a:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
	port->CR[pin>>3]|=config<<shift;
    1d7e:	68bb      	ldr	r3, [r7, #8]
    1d80:	08da      	lsrs	r2, r3, #3
    1d82:	68bb      	ldr	r3, [r7, #8]
    1d84:	08d9      	lsrs	r1, r3, #3
    1d86:	68fb      	ldr	r3, [r7, #12]
    1d88:	f853 1021 	ldr.w	r1, [r3, r1, lsl #2]
    1d8c:	7dfb      	ldrb	r3, [r7, #23]
    1d8e:	6878      	ldr	r0, [r7, #4]
    1d90:	fa00 f303 	lsl.w	r3, r0, r3
    1d94:	4319      	orrs	r1, r3
    1d96:	68fb      	ldr	r3, [r7, #12]
    1d98:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
}
    1d9c:	371c      	adds	r7, #28
    1d9e:	46bd      	mov	sp, r7
    1da0:	f85d 7b04 	ldr.w	r7, [sp], #4
    1da4:	4770      	bx	lr
    1da6:	bf00      	nop

00001da8 <read_pin>:

int read_pin(gpio_t* port, unsigned pin){
    1da8:	b480      	push	{r7}
    1daa:	b083      	sub	sp, #12
    1dac:	af00      	add	r7, sp, #0
    1dae:	6078      	str	r0, [r7, #4]
    1db0:	6039      	str	r1, [r7, #0]
	return port->IDR&(1<<pin);
    1db2:	687b      	ldr	r3, [r7, #4]
    1db4:	689b      	ldr	r3, [r3, #8]
    1db6:	683a      	ldr	r2, [r7, #0]
    1db8:	2101      	movs	r1, #1
    1dba:	fa01 f202 	lsl.w	r2, r1, r2
    1dbe:	4013      	ands	r3, r2
}
    1dc0:	4618      	mov	r0, r3
    1dc2:	370c      	adds	r7, #12
    1dc4:	46bd      	mov	sp, r7
    1dc6:	f85d 7b04 	ldr.w	r7, [sp], #4
    1dca:	4770      	bx	lr

00001dcc <write_pin>:

void write_pin(gpio_t* port, unsigned pin, int value){
    1dcc:	b480      	push	{r7}
    1dce:	b085      	sub	sp, #20
    1dd0:	af00      	add	r7, sp, #0
    1dd2:	60f8      	str	r0, [r7, #12]
    1dd4:	60b9      	str	r1, [r7, #8]
    1dd6:	607a      	str	r2, [r7, #4]
	value?(port->ODR|=(1<<pin)):(port->ODR&=~(1<<pin));
    1dd8:	687b      	ldr	r3, [r7, #4]
    1dda:	2b00      	cmp	r3, #0
    1ddc:	d009      	beq.n	1df2 <write_pin+0x26>
    1dde:	68fb      	ldr	r3, [r7, #12]
    1de0:	68db      	ldr	r3, [r3, #12]
    1de2:	68ba      	ldr	r2, [r7, #8]
    1de4:	2101      	movs	r1, #1
    1de6:	fa01 f202 	lsl.w	r2, r1, r2
    1dea:	431a      	orrs	r2, r3
    1dec:	68fb      	ldr	r3, [r7, #12]
    1dee:	60da      	str	r2, [r3, #12]
    1df0:	e009      	b.n	1e06 <write_pin+0x3a>
    1df2:	68fb      	ldr	r3, [r7, #12]
    1df4:	68db      	ldr	r3, [r3, #12]
    1df6:	68ba      	ldr	r2, [r7, #8]
    1df8:	2101      	movs	r1, #1
    1dfa:	fa01 f202 	lsl.w	r2, r1, r2
    1dfe:	43d2      	mvns	r2, r2
    1e00:	401a      	ands	r2, r3
    1e02:	68fb      	ldr	r3, [r7, #12]
    1e04:	60da      	str	r2, [r3, #12]
}
    1e06:	3714      	adds	r7, #20
    1e08:	46bd      	mov	sp, r7
    1e0a:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e0e:	4770      	bx	lr

00001e10 <toggle_pin>:

void toggle_pin(gpio_t* port, unsigned pin){
    1e10:	b480      	push	{r7}
    1e12:	b083      	sub	sp, #12
    1e14:	af00      	add	r7, sp, #0
    1e16:	6078      	str	r0, [r7, #4]
    1e18:	6039      	str	r1, [r7, #0]
	port->ODR^=(1<<pin);
    1e1a:	687b      	ldr	r3, [r7, #4]
    1e1c:	68db      	ldr	r3, [r3, #12]
    1e1e:	683a      	ldr	r2, [r7, #0]
    1e20:	2101      	movs	r1, #1
    1e22:	fa01 f202 	lsl.w	r2, r1, r2
    1e26:	405a      	eors	r2, r3
    1e28:	687b      	ldr	r3, [r7, #4]
    1e2a:	60da      	str	r2, [r3, #12]
}
    1e2c:	370c      	adds	r7, #12
    1e2e:	46bd      	mov	sp, r7
    1e30:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e34:	4770      	bx	lr
    1e36:	bf00      	nop

00001e38 <keyboard_init>:
    ps2_flags = 0;
    return KbdSend(KBD_RESET);
}//KbdReset()
*/
 
void keyboard_init(){
    1e38:	b580      	push	{r7, lr}
    1e3a:	af00      	add	r7, sp, #0
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
    1e3c:	4a1f      	ldr	r2, [pc, #124]	; (1ebc <keyboard_init+0x84>)
    1e3e:	4b1f      	ldr	r3, [pc, #124]	; (1ebc <keyboard_init+0x84>)
    1e40:	699b      	ldr	r3, [r3, #24]
    1e42:	f043 0305 	orr.w	r3, r3, #5
    1e46:	6193      	str	r3, [r2, #24]
	// activation clock TMR2
	RCC->APB1ENR|=RCC_APB1ENR_TIM2EN; 
    1e48:	4a1c      	ldr	r2, [pc, #112]	; (1ebc <keyboard_init+0x84>)
    1e4a:	4b1c      	ldr	r3, [pc, #112]	; (1ebc <keyboard_init+0x84>)
    1e4c:	69db      	ldr	r3, [r3, #28]
    1e4e:	f043 0301 	orr.w	r3, r3, #1
    1e52:	61d3      	str	r3, [r2, #28]
	TMR2->ARR=FTMR2_4/20*.01;
    1e54:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e58:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    1e5c:	62da      	str	r2, [r3, #44]	; 0x2c
	TMR2->PSC=20;
    1e5e:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e62:	2214      	movs	r2, #20
    1e64:	629a      	str	r2, [r3, #40]	; 0x28
	TMR2->CR1=BIT0|BIT7; // ARPE
    1e66:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e6a:	2281      	movs	r2, #129	; 0x81
    1e6c:	601a      	str	r2, [r3, #0]
	TMR2->DIER=BIT0; // UIE
    1e6e:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e72:	2201      	movs	r2, #1
    1e74:	60da      	str	r2, [r3, #12]
	set_int_priority(IRQ_KBD_CLK,0);
    1e76:	2017      	movs	r0, #23
    1e78:	2100      	movs	r1, #0
    1e7a:	f000 fb31 	bl	24e0 <set_int_priority>
	set_int_priority(IRQ_TIM2,14);
    1e7e:	201c      	movs	r0, #28
    1e80:	210e      	movs	r1, #14
    1e82:	f000 fb2d 	bl	24e0 <set_int_priority>
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
    1e86:	4a0e      	ldr	r2, [pc, #56]	; (1ec0 <keyboard_init+0x88>)
    1e88:	4b0d      	ldr	r3, [pc, #52]	; (1ec0 <keyboard_init+0x88>)
    1e8a:	68db      	ldr	r3, [r3, #12]
    1e8c:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1e90:	60d3      	str	r3, [r2, #12]
	EXTI->IMR|=KBD_CLK_PIN;
    1e92:	4a0b      	ldr	r2, [pc, #44]	; (1ec0 <keyboard_init+0x88>)
    1e94:	4b0a      	ldr	r3, [pc, #40]	; (1ec0 <keyboard_init+0x88>)
    1e96:	681b      	ldr	r3, [r3, #0]
    1e98:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1e9c:	6013      	str	r3, [r2, #0]
	enable_interrupt(IRQ_KBD_CLK);
    1e9e:	2017      	movs	r0, #23
    1ea0:	f000 fa62 	bl	2368 <enable_interrupt>
	TMR2->SR&=~BIT0;
    1ea4:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    1ea8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1eac:	691b      	ldr	r3, [r3, #16]
    1eae:	f023 0301 	bic.w	r3, r3, #1
    1eb2:	6113      	str	r3, [r2, #16]
	enable_interrupt(IRQ_TIM2);
    1eb4:	201c      	movs	r0, #28
    1eb6:	f000 fa57 	bl	2368 <enable_interrupt>
	//pause(700);
	//if (!KbdReset()) print("keyboard reset failed\n");
}
    1eba:	bd80      	pop	{r7, pc}
    1ebc:	40021000 	.word	0x40021000
    1ec0:	40010400 	.word	0x40010400

00001ec4 <search_table>:
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
    1ec4:	b480      	push	{r7}
    1ec6:	b083      	sub	sp, #12
    1ec8:	af00      	add	r7, sp, #0
    1eca:	6078      	str	r0, [r7, #4]
    1ecc:	460b      	mov	r3, r1
    1ece:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    1ed0:	e008      	b.n	1ee4 <search_table+0x20>
		if (table->code==code) break;
    1ed2:	687b      	ldr	r3, [r7, #4]
    1ed4:	781b      	ldrb	r3, [r3, #0]
    1ed6:	78fa      	ldrb	r2, [r7, #3]
    1ed8:	429a      	cmp	r2, r3
    1eda:	d100      	bne.n	1ede <search_table+0x1a>
    1edc:	e006      	b.n	1eec <search_table+0x28>
		table++;
    1ede:	687b      	ldr	r3, [r7, #4]
    1ee0:	3302      	adds	r3, #2
    1ee2:	607b      	str	r3, [r7, #4]

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
    1ee4:	687b      	ldr	r3, [r7, #4]
    1ee6:	781b      	ldrb	r3, [r3, #0]
    1ee8:	2b00      	cmp	r3, #0
    1eea:	d1f2      	bne.n	1ed2 <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    1eec:	687b      	ldr	r3, [r7, #4]
    1eee:	785b      	ldrb	r3, [r3, #1]
}
    1ef0:	4618      	mov	r0, r3
    1ef2:	370c      	adds	r7, #12
    1ef4:	46bd      	mov	sp, r7
    1ef6:	f85d 7b04 	ldr.w	r7, [sp], #4
    1efa:	4770      	bx	lr

00001efc <convert_code>:

static void convert_code(unsigned char code){
    1efc:	b580      	push	{r7, lr}
    1efe:	b086      	sub	sp, #24
    1f00:	af00      	add	r7, sp, #0
    1f02:	4603      	mov	r3, r0
    1f04:	71fb      	strb	r3, [r7, #7]
		unsigned char c,s;
		int shift;
		if (!(con.dev==LOCAL)) return;
    1f06:	4ba1      	ldr	r3, [pc, #644]	; (218c <convert_code+0x290>)
    1f08:	781b      	ldrb	r3, [r3, #0]
    1f0a:	2b00      	cmp	r3, #0
    1f0c:	d000      	beq.n	1f10 <convert_code+0x14>
    1f0e:	e139      	b.n	2184 <convert_code+0x288>
		switch (code){
    1f10:	79fb      	ldrb	r3, [r7, #7]
    1f12:	2b59      	cmp	r3, #89	; 0x59
    1f14:	f000 8085 	beq.w	2022 <convert_code+0x126>
    1f18:	2b59      	cmp	r3, #89	; 0x59
    1f1a:	dc0e      	bgt.n	1f3a <convert_code+0x3e>
    1f1c:	2b12      	cmp	r3, #18
    1f1e:	d038      	beq.n	1f92 <convert_code+0x96>
    1f20:	2b12      	cmp	r3, #18
    1f22:	dc03      	bgt.n	1f2c <convert_code+0x30>
    1f24:	2b11      	cmp	r3, #17
    1f26:	f000 80a4 	beq.w	2072 <convert_code+0x176>
    1f2a:	e0ca      	b.n	20c2 <convert_code+0x1c6>
    1f2c:	2b14      	cmp	r3, #20
    1f2e:	f000 808c 	beq.w	204a <convert_code+0x14e>
    1f32:	2b58      	cmp	r3, #88	; 0x58
    1f34:	f000 80b1 	beq.w	209a <convert_code+0x19e>
    1f38:	e0c3      	b.n	20c2 <convert_code+0x1c6>
    1f3a:	2be0      	cmp	r3, #224	; 0xe0
    1f3c:	d010      	beq.n	1f60 <convert_code+0x64>
    1f3e:	2be0      	cmp	r3, #224	; 0xe0
    1f40:	dc02      	bgt.n	1f48 <convert_code+0x4c>
    1f42:	2b7c      	cmp	r3, #124	; 0x7c
    1f44:	d047      	beq.n	1fd6 <convert_code+0xda>
    1f46:	e0bc      	b.n	20c2 <convert_code+0x1c6>
    1f48:	2be1      	cmp	r3, #225	; 0xe1
    1f4a:	d010      	beq.n	1f6e <convert_code+0x72>
    1f4c:	2bf0      	cmp	r3, #240	; 0xf0
    1f4e:	f040 80b8 	bne.w	20c2 <convert_code+0x1c6>
		case 0xF0:
			flags |= RELEASE;
    1f52:	4b8f      	ldr	r3, [pc, #572]	; (2190 <convert_code+0x294>)
    1f54:	681b      	ldr	r3, [r3, #0]
    1f56:	f043 0302 	orr.w	r3, r3, #2
    1f5a:	4a8d      	ldr	r2, [pc, #564]	; (2190 <convert_code+0x294>)
    1f5c:	6013      	str	r3, [r2, #0]
			break;
    1f5e:	e111      	b.n	2184 <convert_code+0x288>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    1f60:	4b8b      	ldr	r3, [pc, #556]	; (2190 <convert_code+0x294>)
    1f62:	681b      	ldr	r3, [r3, #0]
    1f64:	f043 0301 	orr.w	r3, r3, #1
    1f68:	4a89      	ldr	r2, [pc, #548]	; (2190 <convert_code+0x294>)
    1f6a:	6013      	str	r3, [r2, #0]
			break;
    1f6c:	e10a      	b.n	2184 <convert_code+0x288>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    1f6e:	4b88      	ldr	r3, [pc, #544]	; (2190 <convert_code+0x294>)
    1f70:	681b      	ldr	r3, [r3, #0]
    1f72:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    1f76:	4a86      	ldr	r2, [pc, #536]	; (2190 <convert_code+0x294>)
    1f78:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    1f7a:	4b85      	ldr	r3, [pc, #532]	; (2190 <convert_code+0x294>)
    1f7c:	681b      	ldr	r3, [r3, #0]
    1f7e:	f403 7380 	and.w	r3, r3, #256	; 0x100
    1f82:	2b00      	cmp	r3, #0
    1f84:	d104      	bne.n	1f90 <convert_code+0x94>
				con.insert(PAUSE);
    1f86:	4b81      	ldr	r3, [pc, #516]	; (218c <convert_code+0x290>)
    1f88:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    1f8a:	2094      	movs	r0, #148	; 0x94
    1f8c:	4798      	blx	r3
			}
			break;
    1f8e:	e0f9      	b.n	2184 <convert_code+0x288>
    1f90:	e0f8      	b.n	2184 <convert_code+0x288>
		case LSHIFT:
			if (flags&RELEASE){
    1f92:	4b7f      	ldr	r3, [pc, #508]	; (2190 <convert_code+0x294>)
    1f94:	681b      	ldr	r3, [r3, #0]
    1f96:	f003 0302 	and.w	r3, r3, #2
    1f9a:	2b00      	cmp	r3, #0
    1f9c:	d006      	beq.n	1fac <convert_code+0xb0>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    1f9e:	4b7c      	ldr	r3, [pc, #496]	; (2190 <convert_code+0x294>)
    1fa0:	681b      	ldr	r3, [r3, #0]
    1fa2:	f023 0307 	bic.w	r3, r3, #7
    1fa6:	4a7a      	ldr	r2, [pc, #488]	; (2190 <convert_code+0x294>)
    1fa8:	6013      	str	r3, [r2, #0]
    1faa:	e013      	b.n	1fd4 <convert_code+0xd8>
			}else{
				if (flags&XTD_CODE){
    1fac:	4b78      	ldr	r3, [pc, #480]	; (2190 <convert_code+0x294>)
    1fae:	681b      	ldr	r3, [r3, #0]
    1fb0:	f003 0301 	and.w	r3, r3, #1
    1fb4:	2b00      	cmp	r3, #0
    1fb6:	d006      	beq.n	1fc6 <convert_code+0xca>
					flags|=PRNSCR;
    1fb8:	4b75      	ldr	r3, [pc, #468]	; (2190 <convert_code+0x294>)
    1fba:	681b      	ldr	r3, [r3, #0]
    1fbc:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1fc0:	4a73      	ldr	r2, [pc, #460]	; (2190 <convert_code+0x294>)
    1fc2:	6013      	str	r3, [r2, #0]
    1fc4:	e006      	b.n	1fd4 <convert_code+0xd8>
				}else{
					flags|=LEFT_SHIFT;
    1fc6:	4b72      	ldr	r3, [pc, #456]	; (2190 <convert_code+0x294>)
    1fc8:	681b      	ldr	r3, [r3, #0]
    1fca:	f043 0304 	orr.w	r3, r3, #4
    1fce:	4a70      	ldr	r2, [pc, #448]	; (2190 <convert_code+0x294>)
    1fd0:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1fd2:	e0d7      	b.n	2184 <convert_code+0x288>
    1fd4:	e0d6      	b.n	2184 <convert_code+0x288>
		case KPMUL:
			if (flags&RELEASE){
    1fd6:	4b6e      	ldr	r3, [pc, #440]	; (2190 <convert_code+0x294>)
    1fd8:	681b      	ldr	r3, [r3, #0]
    1fda:	f003 0302 	and.w	r3, r3, #2
    1fde:	2b00      	cmp	r3, #0
    1fe0:	d006      	beq.n	1ff0 <convert_code+0xf4>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    1fe2:	4b6b      	ldr	r3, [pc, #428]	; (2190 <convert_code+0x294>)
    1fe4:	681b      	ldr	r3, [r3, #0]
    1fe6:	f023 0303 	bic.w	r3, r3, #3
    1fea:	4a69      	ldr	r2, [pc, #420]	; (2190 <convert_code+0x294>)
    1fec:	6013      	str	r3, [r2, #0]
    1fee:	e017      	b.n	2020 <convert_code+0x124>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    1ff0:	4b67      	ldr	r3, [pc, #412]	; (2190 <convert_code+0x294>)
    1ff2:	681b      	ldr	r3, [r3, #0]
    1ff4:	f003 0301 	and.w	r3, r3, #1
    1ff8:	2b00      	cmp	r3, #0
    1ffa:	d00c      	beq.n	2016 <convert_code+0x11a>
					flags&=~(XTD_CODE|PRNSCR);
    1ffc:	4b64      	ldr	r3, [pc, #400]	; (2190 <convert_code+0x294>)
    1ffe:	681b      	ldr	r3, [r3, #0]
    2000:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    2004:	f023 0301 	bic.w	r3, r3, #1
    2008:	4a61      	ldr	r2, [pc, #388]	; (2190 <convert_code+0x294>)
    200a:	6013      	str	r3, [r2, #0]
					con.insert(PRN);
    200c:	4b5f      	ldr	r3, [pc, #380]	; (218c <convert_code+0x290>)
    200e:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    2010:	2092      	movs	r0, #146	; 0x92
    2012:	4798      	blx	r3
    2014:	e004      	b.n	2020 <convert_code+0x124>
				}else{
					con.insert('*');
    2016:	4b5d      	ldr	r3, [pc, #372]	; (218c <convert_code+0x290>)
    2018:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    201a:	202a      	movs	r0, #42	; 0x2a
    201c:	4798      	blx	r3
				}
			}
			break;
    201e:	e0b1      	b.n	2184 <convert_code+0x288>
    2020:	e0b0      	b.n	2184 <convert_code+0x288>
		case RSHIFT:
			if (flags&RELEASE){
    2022:	4b5b      	ldr	r3, [pc, #364]	; (2190 <convert_code+0x294>)
    2024:	681b      	ldr	r3, [r3, #0]
    2026:	f003 0302 	and.w	r3, r3, #2
    202a:	2b00      	cmp	r3, #0
    202c:	d006      	beq.n	203c <convert_code+0x140>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    202e:	4b58      	ldr	r3, [pc, #352]	; (2190 <convert_code+0x294>)
    2030:	681b      	ldr	r3, [r3, #0]
    2032:	f023 030b 	bic.w	r3, r3, #11
    2036:	4a56      	ldr	r2, [pc, #344]	; (2190 <convert_code+0x294>)
    2038:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    203a:	e0a3      	b.n	2184 <convert_code+0x288>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    203c:	4b54      	ldr	r3, [pc, #336]	; (2190 <convert_code+0x294>)
    203e:	681b      	ldr	r3, [r3, #0]
    2040:	f043 0308 	orr.w	r3, r3, #8
    2044:	4a52      	ldr	r2, [pc, #328]	; (2190 <convert_code+0x294>)
    2046:	6013      	str	r3, [r2, #0]
			}
			break;
    2048:	e09c      	b.n	2184 <convert_code+0x288>
		case LCTRL:
			if (flags&RELEASE){
    204a:	4b51      	ldr	r3, [pc, #324]	; (2190 <convert_code+0x294>)
    204c:	681b      	ldr	r3, [r3, #0]
    204e:	f003 0302 	and.w	r3, r3, #2
    2052:	2b00      	cmp	r3, #0
    2054:	d006      	beq.n	2064 <convert_code+0x168>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    2056:	4b4e      	ldr	r3, [pc, #312]	; (2190 <convert_code+0x294>)
    2058:	681b      	ldr	r3, [r3, #0]
    205a:	f023 0313 	bic.w	r3, r3, #19
    205e:	4a4c      	ldr	r2, [pc, #304]	; (2190 <convert_code+0x294>)
    2060:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_CTRL;
			}
			break;
    2062:	e08f      	b.n	2184 <convert_code+0x288>
			break;
		case LCTRL:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
			}else{
				flags|=LEFT_CTRL;
    2064:	4b4a      	ldr	r3, [pc, #296]	; (2190 <convert_code+0x294>)
    2066:	681b      	ldr	r3, [r3, #0]
    2068:	f043 0310 	orr.w	r3, r3, #16
    206c:	4a48      	ldr	r2, [pc, #288]	; (2190 <convert_code+0x294>)
    206e:	6013      	str	r3, [r2, #0]
			}
			break;
    2070:	e088      	b.n	2184 <convert_code+0x288>
		case LALT:
			if (flags&RELEASE){
    2072:	4b47      	ldr	r3, [pc, #284]	; (2190 <convert_code+0x294>)
    2074:	681b      	ldr	r3, [r3, #0]
    2076:	f003 0302 	and.w	r3, r3, #2
    207a:	2b00      	cmp	r3, #0
    207c:	d006      	beq.n	208c <convert_code+0x190>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    207e:	4b44      	ldr	r3, [pc, #272]	; (2190 <convert_code+0x294>)
    2080:	681b      	ldr	r3, [r3, #0]
    2082:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    2086:	4a42      	ldr	r2, [pc, #264]	; (2190 <convert_code+0x294>)
    2088:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    208a:	e07b      	b.n	2184 <convert_code+0x288>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    208c:	4b40      	ldr	r3, [pc, #256]	; (2190 <convert_code+0x294>)
    208e:	681b      	ldr	r3, [r3, #0]
    2090:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    2094:	4a3e      	ldr	r2, [pc, #248]	; (2190 <convert_code+0x294>)
    2096:	6013      	str	r3, [r2, #0]
			}
			break;
    2098:	e074      	b.n	2184 <convert_code+0x288>
		case CAPS_LOCK:
			if (flags&RELEASE){
    209a:	4b3d      	ldr	r3, [pc, #244]	; (2190 <convert_code+0x294>)
    209c:	681b      	ldr	r3, [r3, #0]
    209e:	f003 0302 	and.w	r3, r3, #2
    20a2:	2b00      	cmp	r3, #0
    20a4:	d006      	beq.n	20b4 <convert_code+0x1b8>
				flags&=~(RELEASE|XTD_CODE);
    20a6:	4b3a      	ldr	r3, [pc, #232]	; (2190 <convert_code+0x294>)
    20a8:	681b      	ldr	r3, [r3, #0]
    20aa:	f023 0303 	bic.w	r3, r3, #3
    20ae:	4a38      	ldr	r2, [pc, #224]	; (2190 <convert_code+0x294>)
    20b0:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    20b2:	e067      	b.n	2184 <convert_code+0x288>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    20b4:	4b36      	ldr	r3, [pc, #216]	; (2190 <convert_code+0x294>)
    20b6:	681b      	ldr	r3, [r3, #0]
    20b8:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    20bc:	4a34      	ldr	r2, [pc, #208]	; (2190 <convert_code+0x294>)
    20be:	6013      	str	r3, [r2, #0]
			}
			break;
    20c0:	e060      	b.n	2184 <convert_code+0x288>
		default:
			if (!(flags&RELEASE)){
    20c2:	4b33      	ldr	r3, [pc, #204]	; (2190 <convert_code+0x294>)
    20c4:	681b      	ldr	r3, [r3, #0]
    20c6:	f003 0302 	and.w	r3, r3, #2
    20ca:	2b00      	cmp	r3, #0
    20cc:	d153      	bne.n	2176 <convert_code+0x27a>
					if (flags&XTD_CODE){
    20ce:	4b30      	ldr	r3, [pc, #192]	; (2190 <convert_code+0x294>)
    20d0:	681b      	ldr	r3, [r3, #0]
    20d2:	f003 0301 	and.w	r3, r3, #1
    20d6:	2b00      	cmp	r3, #0
    20d8:	d00d      	beq.n	20f6 <convert_code+0x1fa>
						c=search_table(mcsaite_xkey,code);
    20da:	79fb      	ldrb	r3, [r7, #7]
    20dc:	482d      	ldr	r0, [pc, #180]	; (2194 <convert_code+0x298>)
    20de:	4619      	mov	r1, r3
    20e0:	f7ff fef0 	bl	1ec4 <search_table>
    20e4:	4603      	mov	r3, r0
    20e6:	75fb      	strb	r3, [r7, #23]
						flags&=~XTD_CODE;
    20e8:	4b29      	ldr	r3, [pc, #164]	; (2190 <convert_code+0x294>)
    20ea:	681b      	ldr	r3, [r3, #0]
    20ec:	f023 0301 	bic.w	r3, r3, #1
    20f0:	4a27      	ldr	r2, [pc, #156]	; (2190 <convert_code+0x294>)
    20f2:	6013      	str	r3, [r2, #0]
    20f4:	e006      	b.n	2104 <convert_code+0x208>
					}else{
						c=search_table(mcsaite_key,code);
    20f6:	79fb      	ldrb	r3, [r7, #7]
    20f8:	4827      	ldr	r0, [pc, #156]	; (2198 <convert_code+0x29c>)
    20fa:	4619      	mov	r1, r3
    20fc:	f7ff fee2 	bl	1ec4 <search_table>
    2100:	4603      	mov	r3, r0
    2102:	75fb      	strb	r3, [r7, #23]
					}
					shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    2104:	4b22      	ldr	r3, [pc, #136]	; (2190 <convert_code+0x294>)
    2106:	681b      	ldr	r3, [r3, #0]
    2108:	f003 030c 	and.w	r3, r3, #12
    210c:	613b      	str	r3, [r7, #16]
					if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    210e:	7dfb      	ldrb	r3, [r7, #23]
    2110:	2b60      	cmp	r3, #96	; 0x60
    2112:	d918      	bls.n	2146 <convert_code+0x24a>
    2114:	7dfb      	ldrb	r3, [r7, #23]
    2116:	2b7a      	cmp	r3, #122	; 0x7a
    2118:	d815      	bhi.n	2146 <convert_code+0x24a>
    211a:	693b      	ldr	r3, [r7, #16]
    211c:	2b00      	cmp	r3, #0
    211e:	d005      	beq.n	212c <convert_code+0x230>
    2120:	4b1b      	ldr	r3, [pc, #108]	; (2190 <convert_code+0x294>)
    2122:	681b      	ldr	r3, [r3, #0]
    2124:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2128:	2b00      	cmp	r3, #0
    212a:	d008      	beq.n	213e <convert_code+0x242>
    212c:	693b      	ldr	r3, [r7, #16]
    212e:	2b00      	cmp	r3, #0
    2130:	d109      	bne.n	2146 <convert_code+0x24a>
    2132:	4b17      	ldr	r3, [pc, #92]	; (2190 <convert_code+0x294>)
    2134:	681b      	ldr	r3, [r3, #0]
    2136:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    213a:	2b00      	cmp	r3, #0
    213c:	d003      	beq.n	2146 <convert_code+0x24a>
						c-=32;
    213e:	7dfb      	ldrb	r3, [r7, #23]
    2140:	3b20      	subs	r3, #32
    2142:	75fb      	strb	r3, [r7, #23]
    2144:	e00e      	b.n	2164 <convert_code+0x268>
					}else if (shift && (s=search_table(mcsaite_shey,c))){
    2146:	693b      	ldr	r3, [r7, #16]
    2148:	2b00      	cmp	r3, #0
    214a:	d00b      	beq.n	2164 <convert_code+0x268>
    214c:	7dfb      	ldrb	r3, [r7, #23]
    214e:	4813      	ldr	r0, [pc, #76]	; (219c <convert_code+0x2a0>)
    2150:	4619      	mov	r1, r3
    2152:	f7ff feb7 	bl	1ec4 <search_table>
    2156:	4603      	mov	r3, r0
    2158:	73fb      	strb	r3, [r7, #15]
    215a:	7bfb      	ldrb	r3, [r7, #15]
    215c:	2b00      	cmp	r3, #0
    215e:	d001      	beq.n	2164 <convert_code+0x268>
						c=s;
    2160:	7bfb      	ldrb	r3, [r7, #15]
    2162:	75fb      	strb	r3, [r7, #23]
					}
					if (c){
    2164:	7dfb      	ldrb	r3, [r7, #23]
    2166:	2b00      	cmp	r3, #0
    2168:	d00b      	beq.n	2182 <convert_code+0x286>
						con.insert(c);
    216a:	4b08      	ldr	r3, [pc, #32]	; (218c <convert_code+0x290>)
    216c:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    216e:	7dfa      	ldrb	r2, [r7, #23]
    2170:	4610      	mov	r0, r2
    2172:	4798      	blx	r3
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    2174:	e006      	b.n	2184 <convert_code+0x288>
					}
					if (c){
						con.insert(c);
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    2176:	4b06      	ldr	r3, [pc, #24]	; (2190 <convert_code+0x294>)
    2178:	681b      	ldr	r3, [r3, #0]
    217a:	f023 0303 	bic.w	r3, r3, #3
    217e:	4a04      	ldr	r2, [pc, #16]	; (2190 <convert_code+0x294>)
    2180:	6013      	str	r3, [r2, #0]
			}
			break;
    2182:	bf00      	nop
		}//switch
}// convert_code()
    2184:	3718      	adds	r7, #24
    2186:	46bd      	mov	sp, r7
    2188:	bd80      	pop	{r7, pc}
    218a:	bf00      	nop
    218c:	200000f4 	.word	0x200000f4
    2190:	200000c0 	.word	0x200000c0
    2194:	00003b90 	.word	0x00003b90
    2198:	00003ad8 	.word	0x00003ad8
    219c:	00003b64 	.word	0x00003b64

000021a0 <EXTI9_5_handler>:
#define PS2_QUEUE_SIZE (16)
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];

// signal clock du clavier PS/2
__attribute__((optimize("-O0"))) void KBD_CLK_handler(){
    21a0:	b480      	push	{r7}
    21a2:	b083      	sub	sp, #12
    21a4:	af00      	add	r7, sp, #0
	volatile  static unsigned char  in_byte=0,bit_cnt=0;
    volatile unsigned char parity; 

#define data_bit  (KBD_PORT->IDR & KBD_DAT_PIN)
	EXTI->PR|=KBD_CLK_PIN; 
    21a6:	4a51      	ldr	r2, [pc, #324]	; (22ec <EXTI9_5_handler+0x14c>)
    21a8:	4b50      	ldr	r3, [pc, #320]	; (22ec <EXTI9_5_handler+0x14c>)
    21aa:	695b      	ldr	r3, [r3, #20]
    21ac:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    21b0:	6153      	str	r3, [r2, #20]
    switch (bit_cnt){
    21b2:	4b4f      	ldr	r3, [pc, #316]	; (22f0 <EXTI9_5_handler+0x150>)
    21b4:	781b      	ldrb	r3, [r3, #0]
    21b6:	b2db      	uxtb	r3, r3
    21b8:	2b09      	cmp	r3, #9
    21ba:	d01f      	beq.n	21fc <EXTI9_5_handler+0x5c>
    21bc:	2b0a      	cmp	r3, #10
    21be:	d031      	beq.n	2224 <EXTI9_5_handler+0x84>
    21c0:	2b00      	cmp	r3, #0
    21c2:	d16c      	bne.n	229e <EXTI9_5_handler+0xfe>
	case 0:   // start bit
		ps2_flags&=~(F_ERROR|F_RCVD);
    21c4:	4b4b      	ldr	r3, [pc, #300]	; (22f4 <EXTI9_5_handler+0x154>)
    21c6:	781b      	ldrb	r3, [r3, #0]
    21c8:	b2db      	uxtb	r3, r3
    21ca:	f023 030b 	bic.w	r3, r3, #11
    21ce:	b2da      	uxtb	r2, r3
    21d0:	4b48      	ldr	r3, [pc, #288]	; (22f4 <EXTI9_5_handler+0x154>)
    21d2:	701a      	strb	r2, [r3, #0]
		if (!data_bit){
    21d4:	4b48      	ldr	r3, [pc, #288]	; (22f8 <EXTI9_5_handler+0x158>)
    21d6:	689b      	ldr	r3, [r3, #8]
    21d8:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    21dc:	2b00      	cmp	r3, #0
    21de:	d10c      	bne.n	21fa <EXTI9_5_handler+0x5a>
			in_byte=0;
    21e0:	4b46      	ldr	r3, [pc, #280]	; (22fc <EXTI9_5_handler+0x15c>)
    21e2:	2200      	movs	r2, #0
    21e4:	701a      	strb	r2, [r3, #0]
            parity=0;
    21e6:	2300      	movs	r3, #0
    21e8:	71fb      	strb	r3, [r7, #7]
            bit_cnt++;
    21ea:	4b41      	ldr	r3, [pc, #260]	; (22f0 <EXTI9_5_handler+0x150>)
    21ec:	781b      	ldrb	r3, [r3, #0]
    21ee:	b2db      	uxtb	r3, r3
    21f0:	3301      	adds	r3, #1
    21f2:	b2da      	uxtb	r2, r3
    21f4:	4b3e      	ldr	r3, [pc, #248]	; (22f0 <EXTI9_5_handler+0x150>)
    21f6:	701a      	strb	r2, [r3, #0]
        }
		break;
    21f8:	e073      	b.n	22e2 <EXTI9_5_handler+0x142>
    21fa:	e072      	b.n	22e2 <EXTI9_5_handler+0x142>
	case 9:   // paritée
		if (data_bit) parity++;
    21fc:	4b3e      	ldr	r3, [pc, #248]	; (22f8 <EXTI9_5_handler+0x158>)
    21fe:	689b      	ldr	r3, [r3, #8]
    2200:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2204:	2b00      	cmp	r3, #0
    2206:	d004      	beq.n	2212 <EXTI9_5_handler+0x72>
    2208:	79fb      	ldrb	r3, [r7, #7]
    220a:	b2db      	uxtb	r3, r3
    220c:	3301      	adds	r3, #1
    220e:	b2db      	uxtb	r3, r3
    2210:	71fb      	strb	r3, [r7, #7]
		if (!(parity & 1)){
    2212:	79fb      	ldrb	r3, [r7, #7]
			//ps2_flags |= F_ERR_PARITY;
			
		}
		bit_cnt++;
    2214:	4b36      	ldr	r3, [pc, #216]	; (22f0 <EXTI9_5_handler+0x150>)
    2216:	781b      	ldrb	r3, [r3, #0]
    2218:	b2db      	uxtb	r3, r3
    221a:	3301      	adds	r3, #1
    221c:	b2da      	uxtb	r2, r3
    221e:	4b34      	ldr	r3, [pc, #208]	; (22f0 <EXTI9_5_handler+0x150>)
    2220:	701a      	strb	r2, [r3, #0]
		break;
    2222:	e05e      	b.n	22e2 <EXTI9_5_handler+0x142>
	case 10:  // stop bit
	    if (!data_bit){
    2224:	4b34      	ldr	r3, [pc, #208]	; (22f8 <EXTI9_5_handler+0x158>)
    2226:	689b      	ldr	r3, [r3, #8]
    2228:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    222c:	2b00      	cmp	r3, #0
    222e:	d108      	bne.n	2242 <EXTI9_5_handler+0xa2>
			ps2_flags|=F_ERR_FRAME;
    2230:	4b30      	ldr	r3, [pc, #192]	; (22f4 <EXTI9_5_handler+0x154>)
    2232:	781b      	ldrb	r3, [r3, #0]
    2234:	b2db      	uxtb	r3, r3
    2236:	f043 0308 	orr.w	r3, r3, #8
    223a:	b2da      	uxtb	r2, r3
    223c:	4b2d      	ldr	r3, [pc, #180]	; (22f4 <EXTI9_5_handler+0x154>)
    223e:	701a      	strb	r2, [r3, #0]
    2240:	e029      	b.n	2296 <EXTI9_5_handler+0xf6>
		}else if (!(ps2_flags&F_ERROR)){
    2242:	4b2c      	ldr	r3, [pc, #176]	; (22f4 <EXTI9_5_handler+0x154>)
    2244:	781b      	ldrb	r3, [r3, #0]
    2246:	b2db      	uxtb	r3, r3
    2248:	f003 0309 	and.w	r3, r3, #9
    224c:	2b00      	cmp	r3, #0
    224e:	d122      	bne.n	2296 <EXTI9_5_handler+0xf6>
			if (in_byte==BAT_OK){
    2250:	4b2a      	ldr	r3, [pc, #168]	; (22fc <EXTI9_5_handler+0x15c>)
    2252:	781b      	ldrb	r3, [r3, #0]
    2254:	b2db      	uxtb	r3, r3
    2256:	2baa      	cmp	r3, #170	; 0xaa
    2258:	d108      	bne.n	226c <EXTI9_5_handler+0xcc>
				ps2_flags|=F_BATOK;
    225a:	4b26      	ldr	r3, [pc, #152]	; (22f4 <EXTI9_5_handler+0x154>)
    225c:	781b      	ldrb	r3, [r3, #0]
    225e:	b2db      	uxtb	r3, r3
    2260:	f043 0304 	orr.w	r3, r3, #4
    2264:	b2da      	uxtb	r2, r3
    2266:	4b23      	ldr	r3, [pc, #140]	; (22f4 <EXTI9_5_handler+0x154>)
    2268:	701a      	strb	r2, [r3, #0]
    226a:	e014      	b.n	2296 <EXTI9_5_handler+0xf6>
			}else{
				ps2_queue[ps2_tail++]=in_byte;
    226c:	4b24      	ldr	r3, [pc, #144]	; (2300 <EXTI9_5_handler+0x160>)
    226e:	781b      	ldrb	r3, [r3, #0]
    2270:	b2db      	uxtb	r3, r3
    2272:	1c5a      	adds	r2, r3, #1
    2274:	b2d1      	uxtb	r1, r2
    2276:	4a22      	ldr	r2, [pc, #136]	; (2300 <EXTI9_5_handler+0x160>)
    2278:	7011      	strb	r1, [r2, #0]
    227a:	461a      	mov	r2, r3
    227c:	4b1f      	ldr	r3, [pc, #124]	; (22fc <EXTI9_5_handler+0x15c>)
    227e:	781b      	ldrb	r3, [r3, #0]
    2280:	b2d9      	uxtb	r1, r3
    2282:	4b20      	ldr	r3, [pc, #128]	; (2304 <EXTI9_5_handler+0x164>)
    2284:	5499      	strb	r1, [r3, r2]
				ps2_tail&=PS2_QUEUE_SIZE-1;
    2286:	4b1e      	ldr	r3, [pc, #120]	; (2300 <EXTI9_5_handler+0x160>)
    2288:	781b      	ldrb	r3, [r3, #0]
    228a:	b2db      	uxtb	r3, r3
    228c:	f003 030f 	and.w	r3, r3, #15
    2290:	b2da      	uxtb	r2, r3
    2292:	4b1b      	ldr	r3, [pc, #108]	; (2300 <EXTI9_5_handler+0x160>)
    2294:	701a      	strb	r2, [r3, #0]
			}
	    }
	    bit_cnt=0;
    2296:	4b16      	ldr	r3, [pc, #88]	; (22f0 <EXTI9_5_handler+0x150>)
    2298:	2200      	movs	r2, #0
    229a:	701a      	strb	r2, [r3, #0]
		break;
    229c:	e021      	b.n	22e2 <EXTI9_5_handler+0x142>
	default:
		in_byte >>=1;
    229e:	4b17      	ldr	r3, [pc, #92]	; (22fc <EXTI9_5_handler+0x15c>)
    22a0:	781b      	ldrb	r3, [r3, #0]
    22a2:	b2db      	uxtb	r3, r3
    22a4:	085b      	lsrs	r3, r3, #1
    22a6:	b2da      	uxtb	r2, r3
    22a8:	4b14      	ldr	r3, [pc, #80]	; (22fc <EXTI9_5_handler+0x15c>)
    22aa:	701a      	strb	r2, [r3, #0]
		if(data_bit){
    22ac:	4b12      	ldr	r3, [pc, #72]	; (22f8 <EXTI9_5_handler+0x158>)
    22ae:	689b      	ldr	r3, [r3, #8]
    22b0:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    22b4:	2b00      	cmp	r3, #0
    22b6:	d00c      	beq.n	22d2 <EXTI9_5_handler+0x132>
			in_byte |=128;
    22b8:	4b10      	ldr	r3, [pc, #64]	; (22fc <EXTI9_5_handler+0x15c>)
    22ba:	781b      	ldrb	r3, [r3, #0]
    22bc:	b2db      	uxtb	r3, r3
    22be:	f063 037f 	orn	r3, r3, #127	; 0x7f
    22c2:	b2da      	uxtb	r2, r3
    22c4:	4b0d      	ldr	r3, [pc, #52]	; (22fc <EXTI9_5_handler+0x15c>)
    22c6:	701a      	strb	r2, [r3, #0]
			parity++;
    22c8:	79fb      	ldrb	r3, [r7, #7]
    22ca:	b2db      	uxtb	r3, r3
    22cc:	3301      	adds	r3, #1
    22ce:	b2db      	uxtb	r3, r3
    22d0:	71fb      	strb	r3, [r7, #7]
		}
		bit_cnt++;
    22d2:	4b07      	ldr	r3, [pc, #28]	; (22f0 <EXTI9_5_handler+0x150>)
    22d4:	781b      	ldrb	r3, [r3, #0]
    22d6:	b2db      	uxtb	r3, r3
    22d8:	3301      	adds	r3, #1
    22da:	b2da      	uxtb	r2, r3
    22dc:	4b04      	ldr	r3, [pc, #16]	; (22f0 <EXTI9_5_handler+0x150>)
    22de:	701a      	strb	r2, [r3, #0]
		break;
    22e0:	bf00      	nop
	}
}
    22e2:	370c      	adds	r7, #12
    22e4:	46bd      	mov	sp, r7
    22e6:	f85d 7b04 	ldr.w	r7, [sp], #4
    22ea:	4770      	bx	lr
    22ec:	40010400 	.word	0x40010400
    22f0:	200000d8 	.word	0x200000d8
    22f4:	200000bc 	.word	0x200000bc
    22f8:	40010800 	.word	0x40010800
    22fc:	200000d9 	.word	0x200000d9
    2300:	200000c5 	.word	0x200000c5
    2304:	200000c8 	.word	0x200000c8

00002308 <TIM2_handler>:

void TIM2_handler(){
    2308:	b580      	push	{r7, lr}
    230a:	af00      	add	r7, sp, #0
	TMR2->SR&=~(BIT0); // clear interrupt bit
    230c:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    2310:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    2314:	691b      	ldr	r3, [r3, #16]
    2316:	f023 0301 	bic.w	r3, r3, #1
    231a:	6113      	str	r3, [r2, #16]
	if (ps2_tail!=ps2_head){
    231c:	4b0f      	ldr	r3, [pc, #60]	; (235c <TIM2_handler+0x54>)
    231e:	781b      	ldrb	r3, [r3, #0]
    2320:	b2da      	uxtb	r2, r3
    2322:	4b0f      	ldr	r3, [pc, #60]	; (2360 <TIM2_handler+0x58>)
    2324:	781b      	ldrb	r3, [r3, #0]
    2326:	b2db      	uxtb	r3, r3
    2328:	429a      	cmp	r2, r3
    232a:	d015      	beq.n	2358 <TIM2_handler+0x50>
		convert_code(ps2_queue[ps2_head++]);
    232c:	4b0c      	ldr	r3, [pc, #48]	; (2360 <TIM2_handler+0x58>)
    232e:	781b      	ldrb	r3, [r3, #0]
    2330:	b2db      	uxtb	r3, r3
    2332:	1c5a      	adds	r2, r3, #1
    2334:	b2d1      	uxtb	r1, r2
    2336:	4a0a      	ldr	r2, [pc, #40]	; (2360 <TIM2_handler+0x58>)
    2338:	7011      	strb	r1, [r2, #0]
    233a:	461a      	mov	r2, r3
    233c:	4b09      	ldr	r3, [pc, #36]	; (2364 <TIM2_handler+0x5c>)
    233e:	5c9b      	ldrb	r3, [r3, r2]
    2340:	b2db      	uxtb	r3, r3
    2342:	4618      	mov	r0, r3
    2344:	f7ff fdda 	bl	1efc <convert_code>
		ps2_head&=PS2_QUEUE_SIZE-1;
    2348:	4b05      	ldr	r3, [pc, #20]	; (2360 <TIM2_handler+0x58>)
    234a:	781b      	ldrb	r3, [r3, #0]
    234c:	b2db      	uxtb	r3, r3
    234e:	f003 030f 	and.w	r3, r3, #15
    2352:	b2da      	uxtb	r2, r3
    2354:	4b02      	ldr	r3, [pc, #8]	; (2360 <TIM2_handler+0x58>)
    2356:	701a      	strb	r2, [r3, #0]
	}
}
    2358:	bd80      	pop	{r7, pc}
    235a:	bf00      	nop
    235c:	200000c5 	.word	0x200000c5
    2360:	200000c4 	.word	0x200000c4
    2364:	200000c8 	.word	0x200000c8

00002368 <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(int irq){
    2368:	b480      	push	{r7}
    236a:	b083      	sub	sp, #12
    236c:	af00      	add	r7, sp, #0
    236e:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    2370:	687b      	ldr	r3, [r7, #4]
    2372:	2b3b      	cmp	r3, #59	; 0x3b
    2374:	dd00      	ble.n	2378 <enable_interrupt+0x10>
    2376:	e016      	b.n	23a6 <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    2378:	687b      	ldr	r3, [r7, #4]
    237a:	115b      	asrs	r3, r3, #5
    237c:	009b      	lsls	r3, r3, #2
    237e:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2382:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    2386:	687a      	ldr	r2, [r7, #4]
    2388:	1152      	asrs	r2, r2, #5
    238a:	0092      	lsls	r2, r2, #2
    238c:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    2390:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    2394:	6812      	ldr	r2, [r2, #0]
    2396:	6879      	ldr	r1, [r7, #4]
    2398:	f001 011f 	and.w	r1, r1, #31
    239c:	2001      	movs	r0, #1
    239e:	fa00 f101 	lsl.w	r1, r0, r1
    23a2:	430a      	orrs	r2, r1
    23a4:	601a      	str	r2, [r3, #0]
}
    23a6:	370c      	adds	r7, #12
    23a8:	46bd      	mov	sp, r7
    23aa:	f85d 7b04 	ldr.w	r7, [sp], #4
    23ae:	4770      	bx	lr

000023b0 <disable_interrupt>:


void disable_interrupt(int irq){
    23b0:	b480      	push	{r7}
    23b2:	b083      	sub	sp, #12
    23b4:	af00      	add	r7, sp, #0
    23b6:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    23b8:	687b      	ldr	r3, [r7, #4]
    23ba:	2b3b      	cmp	r3, #59	; 0x3b
    23bc:	dd00      	ble.n	23c0 <disable_interrupt+0x10>
    23be:	e00b      	b.n	23d8 <disable_interrupt+0x28>
	ICER[irq>>5]=(1<<(irq&0x1f));
    23c0:	687b      	ldr	r3, [r7, #4]
    23c2:	115b      	asrs	r3, r3, #5
    23c4:	009a      	lsls	r2, r3, #2
    23c6:	4b07      	ldr	r3, [pc, #28]	; (23e4 <disable_interrupt+0x34>)
    23c8:	4413      	add	r3, r2
    23ca:	687a      	ldr	r2, [r7, #4]
    23cc:	f002 021f 	and.w	r2, r2, #31
    23d0:	2101      	movs	r1, #1
    23d2:	fa01 f202 	lsl.w	r2, r1, r2
    23d6:	601a      	str	r2, [r3, #0]
}
    23d8:	370c      	adds	r7, #12
    23da:	46bd      	mov	sp, r7
    23dc:	f85d 7b04 	ldr.w	r7, [sp], #4
    23e0:	4770      	bx	lr
    23e2:	bf00      	nop
    23e4:	e000e180 	.word	0xe000e180

000023e8 <get_pending>:

unsigned get_pending(int irq){
    23e8:	b480      	push	{r7}
    23ea:	b083      	sub	sp, #12
    23ec:	af00      	add	r7, sp, #0
    23ee:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    23f0:	687b      	ldr	r3, [r7, #4]
    23f2:	2b3b      	cmp	r3, #59	; 0x3b
    23f4:	dd01      	ble.n	23fa <get_pending+0x12>
    23f6:	2300      	movs	r3, #0
    23f8:	e00c      	b.n	2414 <get_pending+0x2c>
	return ICPR[irq>>5]&(1<<(irq&0x1f));
    23fa:	687b      	ldr	r3, [r7, #4]
    23fc:	115b      	asrs	r3, r3, #5
    23fe:	009a      	lsls	r2, r3, #2
    2400:	4b07      	ldr	r3, [pc, #28]	; (2420 <get_pending+0x38>)
    2402:	4413      	add	r3, r2
    2404:	681b      	ldr	r3, [r3, #0]
    2406:	687a      	ldr	r2, [r7, #4]
    2408:	f002 021f 	and.w	r2, r2, #31
    240c:	2101      	movs	r1, #1
    240e:	fa01 f202 	lsl.w	r2, r1, r2
    2412:	4013      	ands	r3, r2
}
    2414:	4618      	mov	r0, r3
    2416:	370c      	adds	r7, #12
    2418:	46bd      	mov	sp, r7
    241a:	f85d 7b04 	ldr.w	r7, [sp], #4
    241e:	4770      	bx	lr
    2420:	e000e280 	.word	0xe000e280

00002424 <get_active>:

unsigned get_active(int irq){
    2424:	b480      	push	{r7}
    2426:	b083      	sub	sp, #12
    2428:	af00      	add	r7, sp, #0
    242a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    242c:	687b      	ldr	r3, [r7, #4]
    242e:	2b3b      	cmp	r3, #59	; 0x3b
    2430:	dd01      	ble.n	2436 <get_active+0x12>
    2432:	2300      	movs	r3, #0
    2434:	e00e      	b.n	2454 <get_active+0x30>
	return IABR[irq>>5]&(1<<(irq&0x1f));
    2436:	687b      	ldr	r3, [r7, #4]
    2438:	115b      	asrs	r3, r3, #5
    243a:	009b      	lsls	r3, r3, #2
    243c:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2440:	f503 4363 	add.w	r3, r3, #58112	; 0xe300
    2444:	681b      	ldr	r3, [r3, #0]
    2446:	687a      	ldr	r2, [r7, #4]
    2448:	f002 021f 	and.w	r2, r2, #31
    244c:	2101      	movs	r1, #1
    244e:	fa01 f202 	lsl.w	r2, r1, r2
    2452:	4013      	ands	r3, r2
}
    2454:	4618      	mov	r0, r3
    2456:	370c      	adds	r7, #12
    2458:	46bd      	mov	sp, r7
    245a:	f85d 7b04 	ldr.w	r7, [sp], #4
    245e:	4770      	bx	lr

00002460 <set_pending>:

void set_pending(int irq){
    2460:	b480      	push	{r7}
    2462:	b083      	sub	sp, #12
    2464:	af00      	add	r7, sp, #0
    2466:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    2468:	687b      	ldr	r3, [r7, #4]
    246a:	2b3b      	cmp	r3, #59	; 0x3b
    246c:	dd00      	ble.n	2470 <set_pending+0x10>
    246e:	e016      	b.n	249e <set_pending+0x3e>
	ISPR[irq>>5]|=1<<(irq&0x1f);
    2470:	687b      	ldr	r3, [r7, #4]
    2472:	115b      	asrs	r3, r3, #5
    2474:	009b      	lsls	r3, r3, #2
    2476:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    247a:	f503 4362 	add.w	r3, r3, #57856	; 0xe200
    247e:	687a      	ldr	r2, [r7, #4]
    2480:	1152      	asrs	r2, r2, #5
    2482:	0092      	lsls	r2, r2, #2
    2484:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    2488:	f502 4262 	add.w	r2, r2, #57856	; 0xe200
    248c:	6812      	ldr	r2, [r2, #0]
    248e:	6879      	ldr	r1, [r7, #4]
    2490:	f001 011f 	and.w	r1, r1, #31
    2494:	2001      	movs	r0, #1
    2496:	fa00 f101 	lsl.w	r1, r0, r1
    249a:	430a      	orrs	r2, r1
    249c:	601a      	str	r2, [r3, #0]
}
    249e:	370c      	adds	r7, #12
    24a0:	46bd      	mov	sp, r7
    24a2:	f85d 7b04 	ldr.w	r7, [sp], #4
    24a6:	4770      	bx	lr

000024a8 <clear_pending>:

void clear_pending(int irq){
    24a8:	b480      	push	{r7}
    24aa:	b083      	sub	sp, #12
    24ac:	af00      	add	r7, sp, #0
    24ae:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    24b0:	687b      	ldr	r3, [r7, #4]
    24b2:	2b3b      	cmp	r3, #59	; 0x3b
    24b4:	dd00      	ble.n	24b8 <clear_pending+0x10>
    24b6:	e00b      	b.n	24d0 <clear_pending+0x28>
	ICPR[irq>>5]=(1<<(irq&0x1f));
    24b8:	687b      	ldr	r3, [r7, #4]
    24ba:	115b      	asrs	r3, r3, #5
    24bc:	009a      	lsls	r2, r3, #2
    24be:	4b07      	ldr	r3, [pc, #28]	; (24dc <clear_pending+0x34>)
    24c0:	4413      	add	r3, r2
    24c2:	687a      	ldr	r2, [r7, #4]
    24c4:	f002 021f 	and.w	r2, r2, #31
    24c8:	2101      	movs	r1, #1
    24ca:	fa01 f202 	lsl.w	r2, r1, r2
    24ce:	601a      	str	r2, [r3, #0]
}
    24d0:	370c      	adds	r7, #12
    24d2:	46bd      	mov	sp, r7
    24d4:	f85d 7b04 	ldr.w	r7, [sp], #4
    24d8:	4770      	bx	lr
    24da:	bf00      	nop
    24dc:	e000e280 	.word	0xe000e280

000024e0 <set_int_priority>:


void set_int_priority(int irq, unsigned priority){
    24e0:	b480      	push	{r7}
    24e2:	b083      	sub	sp, #12
    24e4:	af00      	add	r7, sp, #0
    24e6:	6078      	str	r0, [r7, #4]
    24e8:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    24ea:	687b      	ldr	r3, [r7, #4]
    24ec:	2b00      	cmp	r3, #0
    24ee:	db0d      	blt.n	250c <set_int_priority+0x2c>
    24f0:	687b      	ldr	r3, [r7, #4]
    24f2:	2b3b      	cmp	r3, #59	; 0x3b
    24f4:	dc0a      	bgt.n	250c <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    24f6:	687b      	ldr	r3, [r7, #4]
    24f8:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    24fc:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    2500:	683a      	ldr	r2, [r7, #0]
    2502:	b2d2      	uxtb	r2, r2
    2504:	0112      	lsls	r2, r2, #4
    2506:	b2d2      	uxtb	r2, r2
    2508:	701a      	strb	r2, [r3, #0]
    250a:	e012      	b.n	2532 <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    250c:	687b      	ldr	r3, [r7, #4]
    250e:	2b00      	cmp	r3, #0
    2510:	da0f      	bge.n	2532 <set_int_priority+0x52>
    2512:	687b      	ldr	r3, [r7, #4]
    2514:	f113 0f0f 	cmn.w	r3, #15
    2518:	db0b      	blt.n	2532 <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    251a:	687a      	ldr	r2, [r7, #4]
    251c:	f06f 0303 	mvn.w	r3, #3
    2520:	1a9b      	subs	r3, r3, r2
    2522:	461a      	mov	r2, r3
    2524:	4b05      	ldr	r3, [pc, #20]	; (253c <set_int_priority+0x5c>)
    2526:	4413      	add	r3, r2
    2528:	683a      	ldr	r2, [r7, #0]
    252a:	b2d2      	uxtb	r2, r2
    252c:	0112      	lsls	r2, r2, #4
    252e:	b2d2      	uxtb	r2, r2
    2530:	701a      	strb	r2, [r3, #0]
	}
}
    2532:	370c      	adds	r7, #12
    2534:	46bd      	mov	sp, r7
    2536:	f85d 7b04 	ldr.w	r7, [sp], #4
    253a:	4770      	bx	lr
    253c:	e000ed18 	.word	0xe000ed18

00002540 <dummy_clock>:
uint16_t sdc_status; // indicateurs booléens carte SD
static unsigned blocks_count; // nombre de bloc de 512 octets

// après la mise sous tension la carte
// doit-être activée par 80 clock
static void dummy_clock(){
    2540:	b580      	push	{r7, lr}
    2542:	b082      	sub	sp, #8
    2544:	af00      	add	r7, sp, #0
		int i;
		_spi_slave_deselect(SDC_SPI);
    2546:	4a0a      	ldr	r2, [pc, #40]	; (2570 <dummy_clock+0x30>)
    2548:	4b09      	ldr	r3, [pc, #36]	; (2570 <dummy_clock+0x30>)
    254a:	681b      	ldr	r3, [r3, #0]
    254c:	f443 7380 	orr.w	r3, r3, #256	; 0x100
    2550:	6013      	str	r3, [r2, #0]
		// envoie de 80 clock pour activer la carte
		for (i=0;i<10;i++)spi_read(SDC_SPI);
    2552:	2300      	movs	r3, #0
    2554:	607b      	str	r3, [r7, #4]
    2556:	e005      	b.n	2564 <dummy_clock+0x24>
    2558:	4805      	ldr	r0, [pc, #20]	; (2570 <dummy_clock+0x30>)
    255a:	f000 fad1 	bl	2b00 <spi_read>
    255e:	687b      	ldr	r3, [r7, #4]
    2560:	3301      	adds	r3, #1
    2562:	607b      	str	r3, [r7, #4]
    2564:	687b      	ldr	r3, [r7, #4]
    2566:	2b09      	cmp	r3, #9
    2568:	ddf6      	ble.n	2558 <dummy_clock+0x18>
}
    256a:	3708      	adds	r7, #8
    256c:	46bd      	mov	sp, r7
    256e:	bd80      	pop	{r7, pc}
    2570:	40013000 	.word	0x40013000

00002574 <sdcard_deselect>:

// desactivation de l'interface avec la carte
void sdcard_deselect(){
    2574:	b580      	push	{r7, lr}
    2576:	af00      	add	r7, sp, #0
	SDC_PORT->ODR|=SDC_SS_BIT;
    2578:	4a05      	ldr	r2, [pc, #20]	; (2590 <sdcard_deselect+0x1c>)
    257a:	4b05      	ldr	r3, [pc, #20]	; (2590 <sdcard_deselect+0x1c>)
    257c:	68db      	ldr	r3, [r3, #12]
    257e:	f043 0310 	orr.w	r3, r3, #16
    2582:	60d3      	str	r3, [r2, #12]
	spi_write(SDC_SPI,0xff);
    2584:	4803      	ldr	r0, [pc, #12]	; (2594 <sdcard_deselect+0x20>)
    2586:	21ff      	movs	r1, #255	; 0xff
    2588:	f000 faa2 	bl	2ad0 <spi_write>
}
    258c:	bd80      	pop	{r7, pc}
    258e:	bf00      	nop
    2590:	40010800 	.word	0x40010800
    2594:	40013000 	.word	0x40013000

00002598 <sdc_wait_ready>:

// attend que la carte soie prête
// lit des caractère de la carte 
// jusqu'à ce que le caractèr lu soit 0xff
// expire après 10msec
static void sdc_wait_ready(){
    2598:	b580      	push	{r7, lr}
    259a:	b082      	sub	sp, #8
    259c:	af00      	add	r7, sp, #0
	unsigned char c;
	timer=10;
    259e:	4b0a      	ldr	r3, [pc, #40]	; (25c8 <sdc_wait_ready+0x30>)
    25a0:	220a      	movs	r2, #10
    25a2:	601a      	str	r2, [r3, #0]
	while (timer){
    25a4:	e008      	b.n	25b8 <sdc_wait_ready+0x20>
		c=spi_read(SDC_SPI);
    25a6:	4809      	ldr	r0, [pc, #36]	; (25cc <sdc_wait_ready+0x34>)
    25a8:	f000 faaa 	bl	2b00 <spi_read>
    25ac:	4603      	mov	r3, r0
    25ae:	71fb      	strb	r3, [r7, #7]
	    if (c==0xff){break;}
    25b0:	79fb      	ldrb	r3, [r7, #7]
    25b2:	2bff      	cmp	r3, #255	; 0xff
    25b4:	d100      	bne.n	25b8 <sdc_wait_ready+0x20>
    25b6:	e003      	b.n	25c0 <sdc_wait_ready+0x28>
// jusqu'à ce que le caractèr lu soit 0xff
// expire après 10msec
static void sdc_wait_ready(){
	unsigned char c;
	timer=10;
	while (timer){
    25b8:	4b03      	ldr	r3, [pc, #12]	; (25c8 <sdc_wait_ready+0x30>)
    25ba:	681b      	ldr	r3, [r3, #0]
    25bc:	2b00      	cmp	r3, #0
    25be:	d1f2      	bne.n	25a6 <sdc_wait_ready+0xe>
		c=spi_read(SDC_SPI);
	    if (c==0xff){break;}
	}
}
    25c0:	3708      	adds	r7, #8
    25c2:	46bd      	mov	sp, r7
    25c4:	bd80      	pop	{r7, pc}
    25c6:	bf00      	nop
    25c8:	200000e4 	.word	0x200000e4
    25cc:	40013000 	.word	0x40013000

000025d0 <sdc_cmd>:
*    supl  nombre d'octets supplémentaire dans la réponse
*    resp  réponse de la carte
* retourne:
*   r1 1ier octet réponse de la carte
***********************************/
unsigned char sdc_cmd(unsigned char cmd,unsigned char *args,unsigned supl, unsigned char* resp){
    25d0:	b580      	push	{r7, lr}
    25d2:	b086      	sub	sp, #24
    25d4:	af00      	add	r7, sp, #0
    25d6:	60b9      	str	r1, [r7, #8]
    25d8:	607a      	str	r2, [r7, #4]
    25da:	603b      	str	r3, [r7, #0]
    25dc:	4603      	mov	r3, r0
    25de:	73fb      	strb	r3, [r7, #15]
    unsigned char r1=-1;
    25e0:	23ff      	movs	r3, #255	; 0xff
    25e2:	75fb      	strb	r3, [r7, #23]
    int i;
    sdc_wait_ready();
    25e4:	f7ff ffd8 	bl	2598 <sdc_wait_ready>
    spi_write(SDC_SPI,cmd|0x40);
    25e8:	7bfb      	ldrb	r3, [r7, #15]
    25ea:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    25ee:	b2db      	uxtb	r3, r3
    25f0:	4818      	ldr	r0, [pc, #96]	; (2654 <sdc_cmd+0x84>)
    25f2:	4619      	mov	r1, r3
    25f4:	f000 fa6c 	bl	2ad0 <spi_write>
    spi_block_write(SDC_SPI,args,5);
    25f8:	4816      	ldr	r0, [pc, #88]	; (2654 <sdc_cmd+0x84>)
    25fa:	68b9      	ldr	r1, [r7, #8]
    25fc:	2205      	movs	r2, #5
    25fe:	f000 fa97 	bl	2b30 <spi_block_write>
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
    2602:	2308      	movs	r3, #8
    2604:	613b      	str	r3, [r7, #16]
    2606:	e00b      	b.n	2620 <sdc_cmd+0x50>
		r1=spi_read(SDC_SPI);
    2608:	4812      	ldr	r0, [pc, #72]	; (2654 <sdc_cmd+0x84>)
    260a:	f000 fa79 	bl	2b00 <spi_read>
    260e:	4603      	mov	r3, r0
    2610:	75fb      	strb	r3, [r7, #23]
		if (r1!=0xff) {break;}
    2612:	7dfb      	ldrb	r3, [r7, #23]
    2614:	2bff      	cmp	r3, #255	; 0xff
    2616:	d000      	beq.n	261a <sdc_cmd+0x4a>
    2618:	e005      	b.n	2626 <sdc_cmd+0x56>
    sdc_wait_ready();
    spi_write(SDC_SPI,cmd|0x40);
    spi_block_write(SDC_SPI,args,5);
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
    261a:	693b      	ldr	r3, [r7, #16]
    261c:	3b01      	subs	r3, #1
    261e:	613b      	str	r3, [r7, #16]
    2620:	693b      	ldr	r3, [r7, #16]
    2622:	2b00      	cmp	r3, #0
    2624:	d1f0      	bne.n	2608 <sdc_cmd+0x38>
		r1=spi_read(SDC_SPI);
		if (r1!=0xff) {break;}
	}
	if (r1==1){
    2626:	7dfb      	ldrb	r3, [r7, #23]
    2628:	2b01      	cmp	r3, #1
    262a:	d106      	bne.n	263a <sdc_cmd+0x6a>
	// réception des autres octets de la réponse.
		spi_block_read(SDC_SPI,resp,supl);
    262c:	687b      	ldr	r3, [r7, #4]
    262e:	4809      	ldr	r0, [pc, #36]	; (2654 <sdc_cmd+0x84>)
    2630:	6839      	ldr	r1, [r7, #0]
    2632:	461a      	mov	r2, r3
    2634:	f000 faa6 	bl	2b84 <spi_block_read>
    2638:	e006      	b.n	2648 <sdc_cmd+0x78>
	}else{
		sdc_status|=F_SDC_TO;
    263a:	4b07      	ldr	r3, [pc, #28]	; (2658 <sdc_cmd+0x88>)
    263c:	881b      	ldrh	r3, [r3, #0]
    263e:	f043 0304 	orr.w	r3, r3, #4
    2642:	b29a      	uxth	r2, r3
    2644:	4b04      	ldr	r3, [pc, #16]	; (2658 <sdc_cmd+0x88>)
    2646:	801a      	strh	r2, [r3, #0]
	}
    return r1;
    2648:	7dfb      	ldrb	r3, [r7, #23]
}
    264a:	4618      	mov	r0, r3
    264c:	3718      	adds	r7, #24
    264e:	46bd      	mov	sp, r7
    2650:	bd80      	pop	{r7, pc}
    2652:	bf00      	nop
    2654:	40013000 	.word	0x40013000
    2658:	20000134 	.word	0x20000134

0000265c <sdc_read_register>:

unsigned char sdc_read_register(unsigned char index, unsigned char *reg){
    265c:	b580      	push	{r7, lr}
    265e:	b084      	sub	sp, #16
    2660:	af00      	add	r7, sp, #0
    2662:	4603      	mov	r3, r0
    2664:	6039      	str	r1, [r7, #0]
    2666:	71fb      	strb	r3, [r7, #7]
	unsigned char c=0xff, r1, args[5]={0,0,0,0,0};
    2668:	23ff      	movs	r3, #255	; 0xff
    266a:	73bb      	strb	r3, [r7, #14]
    266c:	2300      	movs	r3, #0
    266e:	723b      	strb	r3, [r7, #8]
    2670:	2300      	movs	r3, #0
    2672:	727b      	strb	r3, [r7, #9]
    2674:	2300      	movs	r3, #0
    2676:	72bb      	strb	r3, [r7, #10]
    2678:	2300      	movs	r3, #0
    267a:	72fb      	strb	r3, [r7, #11]
    267c:	2300      	movs	r3, #0
    267e:	733b      	strb	r3, [r7, #12]
	_spi_enable(SDC_SPI);
    2680:	4a1c      	ldr	r2, [pc, #112]	; (26f4 <sdc_read_register+0x98>)
    2682:	4b1c      	ldr	r3, [pc, #112]	; (26f4 <sdc_read_register+0x98>)
    2684:	681b      	ldr	r3, [r3, #0]
    2686:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    268a:	6013      	str	r3, [r2, #0]
	_sdcard_select();
    268c:	4a1a      	ldr	r2, [pc, #104]	; (26f8 <sdc_read_register+0x9c>)
    268e:	4b1a      	ldr	r3, [pc, #104]	; (26f8 <sdc_read_register+0x9c>)
    2690:	68db      	ldr	r3, [r3, #12]
    2692:	f023 0310 	bic.w	r3, r3, #16
    2696:	60d3      	str	r3, [r2, #12]
	r1=sdc_cmd(index,args,0,0);
    2698:	79fa      	ldrb	r2, [r7, #7]
    269a:	f107 0308 	add.w	r3, r7, #8
    269e:	4610      	mov	r0, r2
    26a0:	4619      	mov	r1, r3
    26a2:	2200      	movs	r2, #0
    26a4:	2300      	movs	r3, #0
    26a6:	f7ff ff93 	bl	25d0 <sdc_cmd>
    26aa:	4603      	mov	r3, r0
    26ac:	73fb      	strb	r3, [r7, #15]
	if (r1){
    26ae:	7bfb      	ldrb	r3, [r7, #15]
    26b0:	2b00      	cmp	r3, #0
    26b2:	d018      	beq.n	26e6 <sdc_read_register+0x8a>
		do {
			c=spi_read(SDC_SPI);
    26b4:	480f      	ldr	r0, [pc, #60]	; (26f4 <sdc_read_register+0x98>)
    26b6:	f000 fa23 	bl	2b00 <spi_read>
    26ba:	4603      	mov	r3, r0
    26bc:	73bb      	strb	r3, [r7, #14]
		}while (c==0xff);
    26be:	7bbb      	ldrb	r3, [r7, #14]
    26c0:	2bff      	cmp	r3, #255	; 0xff
    26c2:	d0f7      	beq.n	26b4 <sdc_read_register+0x58>
		if (c==0xfe){ // lecture de 16 octets
    26c4:	7bbb      	ldrb	r3, [r7, #14]
    26c6:	2bfe      	cmp	r3, #254	; 0xfe
    26c8:	d10b      	bne.n	26e2 <sdc_read_register+0x86>
			spi_block_read(SDC_SPI,reg,16);
    26ca:	480a      	ldr	r0, [pc, #40]	; (26f4 <sdc_read_register+0x98>)
    26cc:	6839      	ldr	r1, [r7, #0]
    26ce:	2210      	movs	r2, #16
    26d0:	f000 fa58 	bl	2b84 <spi_block_read>
			// lecture du CRC 16 bits
			spi_read(SDC_SPI);
    26d4:	4807      	ldr	r0, [pc, #28]	; (26f4 <sdc_read_register+0x98>)
    26d6:	f000 fa13 	bl	2b00 <spi_read>
			spi_read(SDC_SPI);
    26da:	4806      	ldr	r0, [pc, #24]	; (26f4 <sdc_read_register+0x98>)
    26dc:	f000 fa10 	bl	2b00 <spi_read>
    26e0:	e001      	b.n	26e6 <sdc_read_register+0x8a>
		}else{
			r1=0;
    26e2:	2300      	movs	r3, #0
    26e4:	73fb      	strb	r3, [r7, #15]
		}
	}
	sdcard_deselect();
    26e6:	f7ff ff45 	bl	2574 <sdcard_deselect>
	return r1;
    26ea:	7bfb      	ldrb	r3, [r7, #15]
}
    26ec:	4618      	mov	r0, r3
    26ee:	3710      	adds	r7, #16
    26f0:	46bd      	mov	sp, r7
    26f2:	bd80      	pop	{r7, pc}
    26f4:	40013000 	.word	0x40013000
    26f8:	40010800 	.word	0x40010800

000026fc <sdc_set_size>:

// détermine la capacité de la carte
static unsigned char sdc_set_size(){
    26fc:	b580      	push	{r7, lr}
    26fe:	b088      	sub	sp, #32
    2700:	af00      	add	r7, sp, #0
	unsigned char r1,csd[16];
	unsigned block_len,c_size,c_size_mult;
	r1=sdc_read_register(SEND_CSD,csd);
    2702:	463b      	mov	r3, r7
    2704:	2009      	movs	r0, #9
    2706:	4619      	mov	r1, r3
    2708:	f7ff ffa8 	bl	265c <sdc_read_register>
    270c:	4603      	mov	r3, r0
    270e:	77fb      	strb	r3, [r7, #31]
	if (r1){
    2710:	7ffb      	ldrb	r3, [r7, #31]
    2712:	2b00      	cmp	r3, #0
    2714:	d038      	beq.n	2788 <sdc_set_size+0x8c>
		if (sdc_status&F_SDC_HC){//version 2, carte haute capacité
    2716:	4b1f      	ldr	r3, [pc, #124]	; (2794 <sdc_set_size+0x98>)
    2718:	881b      	ldrh	r3, [r3, #0]
    271a:	f003 0303 	and.w	r3, r3, #3
    271e:	2b00      	cmp	r3, #0
    2720:	d008      	beq.n	2734 <sdc_set_size+0x38>
			blocks_count=1024*((csd[8]<<8)+csd[9]);
    2722:	7a3b      	ldrb	r3, [r7, #8]
    2724:	021b      	lsls	r3, r3, #8
    2726:	7a7a      	ldrb	r2, [r7, #9]
    2728:	4413      	add	r3, r2
    272a:	029b      	lsls	r3, r3, #10
    272c:	461a      	mov	r2, r3
    272e:	4b1a      	ldr	r3, [pc, #104]	; (2798 <sdc_set_size+0x9c>)
    2730:	601a      	str	r2, [r3, #0]
    2732:	e029      	b.n	2788 <sdc_set_size+0x8c>
		}else{// version 1
			block_len=1<<((csd[5]&0xf)-1);
    2734:	797b      	ldrb	r3, [r7, #5]
    2736:	f003 030f 	and.w	r3, r3, #15
    273a:	3b01      	subs	r3, #1
    273c:	2201      	movs	r2, #1
    273e:	fa02 f303 	lsl.w	r3, r2, r3
    2742:	61bb      	str	r3, [r7, #24]
			c_size=(csd[6]&0xf<<10)+(csd[7]<<2)+((csd[8]>>6)&3)+1;
    2744:	79bb      	ldrb	r3, [r7, #6]
    2746:	f403 5270 	and.w	r2, r3, #15360	; 0x3c00
    274a:	79fb      	ldrb	r3, [r7, #7]
    274c:	009b      	lsls	r3, r3, #2
    274e:	441a      	add	r2, r3
    2750:	7a3b      	ldrb	r3, [r7, #8]
    2752:	099b      	lsrs	r3, r3, #6
    2754:	b2db      	uxtb	r3, r3
    2756:	f003 0303 	and.w	r3, r3, #3
    275a:	4413      	add	r3, r2
    275c:	3301      	adds	r3, #1
    275e:	617b      	str	r3, [r7, #20]
			c_size_mult=1<<(((csd[9]&0x3)<<1)+(csd[10]>>7)+2);
    2760:	7a7b      	ldrb	r3, [r7, #9]
    2762:	f003 0303 	and.w	r3, r3, #3
    2766:	005b      	lsls	r3, r3, #1
    2768:	7aba      	ldrb	r2, [r7, #10]
    276a:	09d2      	lsrs	r2, r2, #7
    276c:	b2d2      	uxtb	r2, r2
    276e:	4413      	add	r3, r2
    2770:	3302      	adds	r3, #2
    2772:	2201      	movs	r2, #1
    2774:	fa02 f303 	lsl.w	r3, r2, r3
    2778:	613b      	str	r3, [r7, #16]
			blocks_count=(c_size*c_size_mult)>>9;
    277a:	697b      	ldr	r3, [r7, #20]
    277c:	693a      	ldr	r2, [r7, #16]
    277e:	fb02 f303 	mul.w	r3, r2, r3
    2782:	0a5b      	lsrs	r3, r3, #9
    2784:	4a04      	ldr	r2, [pc, #16]	; (2798 <sdc_set_size+0x9c>)
    2786:	6013      	str	r3, [r2, #0]
		}
	}
	return r1;
    2788:	7ffb      	ldrb	r3, [r7, #31]
}
    278a:	4618      	mov	r0, r3
    278c:	3720      	adds	r7, #32
    278e:	46bd      	mov	sp, r7
    2790:	bd80      	pop	{r7, pc}
    2792:	bf00      	nop
    2794:	20000134 	.word	0x20000134
    2798:	200000dc 	.word	0x200000dc

0000279c <sdcard_init>:

// flow chart REF: http://elm-chan.org/docs/mmc/ima/sdinit.png
void sdcard_init(){
    279c:	b580      	push	{r7, lr}
    279e:	b086      	sub	sp, #24
    27a0:	af00      	add	r7, sp, #0
		int i;
		uint8_t r1,args[5], resp[16];
		
		sdc_status=0;
    27a2:	4b6a      	ldr	r3, [pc, #424]	; (294c <sdcard_init+0x1b0>)
    27a4:	2200      	movs	r2, #0
    27a6:	801a      	strh	r2, [r3, #0]
		blocks_count=0;
    27a8:	4b69      	ldr	r3, [pc, #420]	; (2950 <sdcard_init+0x1b4>)
    27aa:	2200      	movs	r2, #0
    27ac:	601a      	str	r2, [r3, #0]
		// initialise le périphérique SPI à la vitesse la plus lente.
		spi_init(SDC_SPI, SDC_CLK_SLOW, SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI, SPI_STD_PORT);
    27ae:	4869      	ldr	r0, [pc, #420]	; (2954 <sdcard_init+0x1b8>)
    27b0:	2107      	movs	r1, #7
    27b2:	f44f 7241 	mov.w	r2, #772	; 0x304
    27b6:	2300      	movs	r3, #0
    27b8:	f000 f95a 	bl	2a70 <spi_init>
		dummy_clock();
    27bc:	f7ff fec0 	bl	2540 <dummy_clock>
		// delais 2 msec
		pause(2);
    27c0:	2002      	movs	r0, #2
    27c2:	f000 fa5b 	bl	2c7c <pause>
		_sdcard_select();
    27c6:	4a64      	ldr	r2, [pc, #400]	; (2958 <sdcard_init+0x1bc>)
    27c8:	4b63      	ldr	r3, [pc, #396]	; (2958 <sdcard_init+0x1bc>)
    27ca:	68db      	ldr	r3, [r3, #12]
    27cc:	f023 0310 	bic.w	r3, r3, #16
    27d0:	60d3      	str	r3, [r2, #12]
		args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMD0_CRC;
    27d2:	2300      	movs	r3, #0
    27d4:	743b      	strb	r3, [r7, #16]
    27d6:	2300      	movs	r3, #0
    27d8:	747b      	strb	r3, [r7, #17]
    27da:	2300      	movs	r3, #0
    27dc:	74bb      	strb	r3, [r7, #18]
    27de:	2300      	movs	r3, #0
    27e0:	74fb      	strb	r3, [r7, #19]
    27e2:	2395      	movs	r3, #149	; 0x95
    27e4:	753b      	strb	r3, [r7, #20]
		r1=sdc_cmd(GO_IDLE_STATE,args,0,resp);
    27e6:	f107 0210 	add.w	r2, r7, #16
    27ea:	463b      	mov	r3, r7
    27ec:	2000      	movs	r0, #0
    27ee:	4611      	mov	r1, r2
    27f0:	2200      	movs	r2, #0
    27f2:	f7ff feed 	bl	25d0 <sdc_cmd>
    27f6:	4603      	mov	r3, r0
    27f8:	75fb      	strb	r3, [r7, #23]
		if (r1==1){
    27fa:	7dfb      	ldrb	r3, [r7, #23]
    27fc:	2b01      	cmp	r3, #1
    27fe:	d126      	bne.n	284e <sdcard_init+0xb2>
			args[2]=1;args[3]=0xaa;args[4]=CMD8_CRC;
    2800:	2301      	movs	r3, #1
    2802:	74bb      	strb	r3, [r7, #18]
    2804:	23aa      	movs	r3, #170	; 0xaa
    2806:	74fb      	strb	r3, [r7, #19]
    2808:	2387      	movs	r3, #135	; 0x87
    280a:	753b      	strb	r3, [r7, #20]
			r1=sdc_cmd(SEND_IF_COND,args,4,resp);
    280c:	f107 0210 	add.w	r2, r7, #16
    2810:	463b      	mov	r3, r7
    2812:	2008      	movs	r0, #8
    2814:	4611      	mov	r1, r2
    2816:	2204      	movs	r2, #4
    2818:	f7ff feda 	bl	25d0 <sdc_cmd>
    281c:	4603      	mov	r3, r0
    281e:	75fb      	strb	r3, [r7, #23]
			if (r1==1){
    2820:	7dfb      	ldrb	r3, [r7, #23]
    2822:	2b01      	cmp	r3, #1
    2824:	d113      	bne.n	284e <sdcard_init+0xb2>
				if ((args[2]==(resp[2]&0xf)) && (args[3]==resp[4])){
    2826:	7cbb      	ldrb	r3, [r7, #18]
    2828:	461a      	mov	r2, r3
    282a:	78bb      	ldrb	r3, [r7, #2]
    282c:	f003 030f 	and.w	r3, r3, #15
    2830:	429a      	cmp	r2, r3
    2832:	f040 8086 	bne.w	2942 <sdcard_init+0x1a6>
    2836:	7cfa      	ldrb	r2, [r7, #19]
    2838:	793b      	ldrb	r3, [r7, #4]
    283a:	429a      	cmp	r2, r3
    283c:	f040 8081 	bne.w	2942 <sdcard_init+0x1a6>
					sdc_status|=F_SDC_V2;
    2840:	4b42      	ldr	r3, [pc, #264]	; (294c <sdcard_init+0x1b0>)
    2842:	881b      	ldrh	r3, [r3, #0]
    2844:	f043 0302 	orr.w	r3, r3, #2
    2848:	b29a      	uxth	r2, r3
    284a:	4b40      	ldr	r3, [pc, #256]	; (294c <sdcard_init+0x1b0>)
    284c:	801a      	strh	r2, [r3, #0]
				}
			}
		}
		// envoie commande acmd41  APP_CMD
		// cette boucle peu prendre 1 seconde
		timer=1000;
    284e:	4b43      	ldr	r3, [pc, #268]	; (295c <sdcard_init+0x1c0>)
    2850:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    2854:	601a      	str	r2, [r3, #0]
		do {
			args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMDX_CRC;
    2856:	2300      	movs	r3, #0
    2858:	743b      	strb	r3, [r7, #16]
    285a:	2300      	movs	r3, #0
    285c:	747b      	strb	r3, [r7, #17]
    285e:	2300      	movs	r3, #0
    2860:	74bb      	strb	r3, [r7, #18]
    2862:	2300      	movs	r3, #0
    2864:	74fb      	strb	r3, [r7, #19]
    2866:	23ff      	movs	r3, #255	; 0xff
    2868:	753b      	strb	r3, [r7, #20]
			sdc_cmd(APP_CMD,args,0,resp);
    286a:	f107 0210 	add.w	r2, r7, #16
    286e:	463b      	mov	r3, r7
    2870:	2037      	movs	r0, #55	; 0x37
    2872:	4611      	mov	r1, r2
    2874:	2200      	movs	r2, #0
    2876:	f7ff feab 	bl	25d0 <sdc_cmd>
			if (sdc_status&F_SDC_V2)args[0]=0x40;
    287a:	4b34      	ldr	r3, [pc, #208]	; (294c <sdcard_init+0x1b0>)
    287c:	881b      	ldrh	r3, [r3, #0]
    287e:	f003 0302 	and.w	r3, r3, #2
    2882:	2b00      	cmp	r3, #0
    2884:	d001      	beq.n	288a <sdcard_init+0xee>
    2886:	2340      	movs	r3, #64	; 0x40
    2888:	743b      	strb	r3, [r7, #16]
			r1=sdc_cmd(APP_SEND_OP_COND,args,0,resp);
    288a:	f107 0210 	add.w	r2, r7, #16
    288e:	463b      	mov	r3, r7
    2890:	2029      	movs	r0, #41	; 0x29
    2892:	4611      	mov	r1, r2
    2894:	2200      	movs	r2, #0
    2896:	f7ff fe9b 	bl	25d0 <sdc_cmd>
    289a:	4603      	mov	r3, r0
    289c:	75fb      	strb	r3, [r7, #23]
			if (!r1){break;}
    289e:	7dfb      	ldrb	r3, [r7, #23]
    28a0:	2b00      	cmp	r3, #0
    28a2:	d100      	bne.n	28a6 <sdcard_init+0x10a>
    28a4:	e003      	b.n	28ae <sdcard_init+0x112>
		}while (timer);
    28a6:	4b2d      	ldr	r3, [pc, #180]	; (295c <sdcard_init+0x1c0>)
    28a8:	681b      	ldr	r3, [r3, #0]
    28aa:	2b00      	cmp	r3, #0
    28ac:	d1d3      	bne.n	2856 <sdcard_init+0xba>
		if (r1){
    28ae:	7dfb      	ldrb	r3, [r7, #23]
    28b0:	2b00      	cmp	r3, #0
    28b2:	d007      	beq.n	28c4 <sdcard_init+0x128>
			sdc_status|=F_SDC_TO;
    28b4:	4b25      	ldr	r3, [pc, #148]	; (294c <sdcard_init+0x1b0>)
    28b6:	881b      	ldrh	r3, [r3, #0]
    28b8:	f043 0304 	orr.w	r3, r3, #4
    28bc:	b29a      	uxth	r2, r3
    28be:	4b23      	ldr	r3, [pc, #140]	; (294c <sdcard_init+0x1b0>)
    28c0:	801a      	strh	r2, [r3, #0]
			goto failed;
    28c2:	e03e      	b.n	2942 <sdcard_init+0x1a6>
		}
		if (sdc_status&F_SDC_V2){
    28c4:	4b21      	ldr	r3, [pc, #132]	; (294c <sdcard_init+0x1b0>)
    28c6:	881b      	ldrh	r3, [r3, #0]
    28c8:	f003 0302 	and.w	r3, r3, #2
    28cc:	2b00      	cmp	r3, #0
    28ce:	d017      	beq.n	2900 <sdcard_init+0x164>
	    // evoie commande cmd58 READ_OCR
			args[0]=0;args[1]=0;args[2]=0;args[3]=0;
    28d0:	2300      	movs	r3, #0
    28d2:	743b      	strb	r3, [r7, #16]
    28d4:	2300      	movs	r3, #0
    28d6:	747b      	strb	r3, [r7, #17]
    28d8:	2300      	movs	r3, #0
    28da:	74bb      	strb	r3, [r7, #18]
    28dc:	2300      	movs	r3, #0
    28de:	74fb      	strb	r3, [r7, #19]
			r1=sdc_cmd(READ_OCR,args,4,resp);
    28e0:	f107 0210 	add.w	r2, r7, #16
    28e4:	463b      	mov	r3, r7
    28e6:	203a      	movs	r0, #58	; 0x3a
    28e8:	4611      	mov	r1, r2
    28ea:	2204      	movs	r2, #4
    28ec:	f7ff fe70 	bl	25d0 <sdc_cmd>
    28f0:	4603      	mov	r3, r0
    28f2:	75fb      	strb	r3, [r7, #23]
			if (resp[0]&BIT6){
    28f4:	783b      	ldrb	r3, [r7, #0]
    28f6:	f003 0340 	and.w	r3, r3, #64	; 0x40
    28fa:	2b00      	cmp	r3, #0
    28fc:	d000      	beq.n	2900 <sdcard_init+0x164>
				goto success;
    28fe:	e015      	b.n	292c <sdcard_init+0x190>
			}
		}
		// envoie CMD16 SET_BLOCKLEN
		args[0]=0;args[1]=0;args[2]=2;args[3]=0;
    2900:	2300      	movs	r3, #0
    2902:	743b      	strb	r3, [r7, #16]
    2904:	2300      	movs	r3, #0
    2906:	747b      	strb	r3, [r7, #17]
    2908:	2302      	movs	r3, #2
    290a:	74bb      	strb	r3, [r7, #18]
    290c:	2300      	movs	r3, #0
    290e:	74fb      	strb	r3, [r7, #19]
		r1=sdc_cmd(SET_BLOCKLEN,args,0,resp);
    2910:	f107 0210 	add.w	r2, r7, #16
    2914:	463b      	mov	r3, r7
    2916:	2010      	movs	r0, #16
    2918:	4611      	mov	r1, r2
    291a:	2200      	movs	r2, #0
    291c:	f7ff fe58 	bl	25d0 <sdc_cmd>
    2920:	4603      	mov	r3, r0
    2922:	75fb      	strb	r3, [r7, #23]
		r1=sdc_set_size();
    2924:	f7ff feea 	bl	26fc <sdc_set_size>
    2928:	4603      	mov	r3, r0
    292a:	75fb      	strb	r3, [r7, #23]
success:
	sdc_status|=F_SDC_OK;
    292c:	4b07      	ldr	r3, [pc, #28]	; (294c <sdcard_init+0x1b0>)
    292e:	881b      	ldrh	r3, [r3, #0]
    2930:	f043 0301 	orr.w	r3, r3, #1
    2934:	b29a      	uxth	r2, r3
    2936:	4b05      	ldr	r3, [pc, #20]	; (294c <sdcard_init+0x1b0>)
    2938:	801a      	strh	r2, [r3, #0]
	spi_baudrate(SDC_SPI,SDC_CLK_FAST);
    293a:	4806      	ldr	r0, [pc, #24]	; (2954 <sdcard_init+0x1b8>)
    293c:	2100      	movs	r1, #0
    293e:	f000 f80f 	bl	2960 <spi_baudrate>
failed:
	sdcard_deselect();
    2942:	f7ff fe17 	bl	2574 <sdcard_deselect>
}
    2946:	3718      	adds	r7, #24
    2948:	46bd      	mov	sp, r7
    294a:	bd80      	pop	{r7, pc}
    294c:	20000134 	.word	0x20000134
    2950:	200000dc 	.word	0x200000dc
    2954:	40013000 	.word	0x40013000
    2958:	40010800 	.word	0x40010800
    295c:	200000e4 	.word	0x200000e4

00002960 <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    2960:	b480      	push	{r7}
    2962:	b083      	sub	sp, #12
    2964:	af00      	add	r7, sp, #0
    2966:	6078      	str	r0, [r7, #4]
    2968:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    296a:	687b      	ldr	r3, [r7, #4]
    296c:	681b      	ldr	r3, [r3, #0]
    296e:	f023 0238 	bic.w	r2, r3, #56	; 0x38
    2972:	687b      	ldr	r3, [r7, #4]
    2974:	601a      	str	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    2976:	687b      	ldr	r3, [r7, #4]
    2978:	681a      	ldr	r2, [r3, #0]
    297a:	683b      	ldr	r3, [r7, #0]
    297c:	00db      	lsls	r3, r3, #3
    297e:	431a      	orrs	r2, r3
    2980:	687b      	ldr	r3, [r7, #4]
    2982:	601a      	str	r2, [r3, #0]
}
    2984:	370c      	adds	r7, #12
    2986:	46bd      	mov	sp, r7
    2988:	f85d 7b04 	ldr.w	r7, [sp], #4
    298c:	4770      	bx	lr
    298e:	bf00      	nop

00002990 <spi_config_port>:

void spi_config_port(spi_sfr_t *channel, int afio_cfg){
    2990:	b580      	push	{r7, lr}
    2992:	b082      	sub	sp, #8
    2994:	af00      	add	r7, sp, #0
    2996:	6078      	str	r0, [r7, #4]
    2998:	6039      	str	r1, [r7, #0]
	if (channel==SPI1){
    299a:	687b      	ldr	r3, [r7, #4]
    299c:	4a2f      	ldr	r2, [pc, #188]	; (2a5c <spi_config_port+0xcc>)
    299e:	4293      	cmp	r3, r2
    29a0:	d13e      	bne.n	2a20 <spi_config_port+0x90>
		if (!afio_cfg){
    29a2:	683b      	ldr	r3, [r7, #0]
    29a4:	2b00      	cmp	r3, #0
    29a6:	d11a      	bne.n	29de <spi_config_port+0x4e>
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    29a8:	4a2d      	ldr	r2, [pc, #180]	; (2a60 <spi_config_port+0xd0>)
    29aa:	4b2d      	ldr	r3, [pc, #180]	; (2a60 <spi_config_port+0xd0>)
    29ac:	699b      	ldr	r3, [r3, #24]
    29ae:	f043 0304 	orr.w	r3, r3, #4
    29b2:	6193      	str	r3, [r2, #24]
			// configuration port
			// PA4 -> NSS output (push-pull),  alt PA15
			config_pin(PORTA,4,OUTPUT_PP_FAST);
    29b4:	482b      	ldr	r0, [pc, #172]	; (2a64 <spi_config_port+0xd4>)
    29b6:	2104      	movs	r1, #4
    29b8:	2203      	movs	r2, #3
    29ba:	f7ff f9c3 	bl	1d44 <config_pin>
			// PA5 -> SCK output (push-pull),  alt PB3
			config_pin(PORTA,5,OUTPUT_PP_FAST);
    29be:	4829      	ldr	r0, [pc, #164]	; (2a64 <spi_config_port+0xd4>)
    29c0:	2105      	movs	r1, #5
    29c2:	2203      	movs	r2, #3
    29c4:	f7ff f9be 	bl	1d44 <config_pin>
			// PA6 -> MISO input (floating),   alt PB4
			config_pin(PORTA,6,INPUT_FLOAT);
    29c8:	4826      	ldr	r0, [pc, #152]	; (2a64 <spi_config_port+0xd4>)
    29ca:	2106      	movs	r1, #6
    29cc:	2204      	movs	r2, #4
    29ce:	f7ff f9b9 	bl	1d44 <config_pin>
			// PA7 -> MOSI output (push-pull), alt PB5
			config_pin(PORTA,7,OUTPUT_PP_FAST);
    29d2:	4824      	ldr	r0, [pc, #144]	; (2a64 <spi_config_port+0xd4>)
    29d4:	2107      	movs	r1, #7
    29d6:	2203      	movs	r2, #3
    29d8:	f7ff f9b4 	bl	1d44 <config_pin>
    29dc:	e03a      	b.n	2a54 <spi_config_port+0xc4>
		}else{// mappage I/O alternatif
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPBEN+RCC_APB2ENR_IOPAEN+RCC_APB2ENR_AFIOEN;
    29de:	4a20      	ldr	r2, [pc, #128]	; (2a60 <spi_config_port+0xd0>)
    29e0:	4b1f      	ldr	r3, [pc, #124]	; (2a60 <spi_config_port+0xd0>)
    29e2:	699b      	ldr	r3, [r3, #24]
    29e4:	f043 030d 	orr.w	r3, r3, #13
    29e8:	6193      	str	r3, [r2, #24]
			AFIO->MAPR|=AFIO_MAPR_SPI1_REMAP;
    29ea:	4a1f      	ldr	r2, [pc, #124]	; (2a68 <spi_config_port+0xd8>)
    29ec:	4b1e      	ldr	r3, [pc, #120]	; (2a68 <spi_config_port+0xd8>)
    29ee:	685b      	ldr	r3, [r3, #4]
    29f0:	f043 0301 	orr.w	r3, r3, #1
    29f4:	6053      	str	r3, [r2, #4]
			// configuration port
			// PA4 -> NSS output (push-pull),  alt PA15
			config_pin(PORTA,15,OUTPUT_PP_FAST);
    29f6:	481b      	ldr	r0, [pc, #108]	; (2a64 <spi_config_port+0xd4>)
    29f8:	210f      	movs	r1, #15
    29fa:	2203      	movs	r2, #3
    29fc:	f7ff f9a2 	bl	1d44 <config_pin>
			// PA5 -> SCK output (push-pull),  alt PB3
			config_pin(PORTB,3,OUTPUT_PP_FAST);
    2a00:	481a      	ldr	r0, [pc, #104]	; (2a6c <spi_config_port+0xdc>)
    2a02:	2103      	movs	r1, #3
    2a04:	2203      	movs	r2, #3
    2a06:	f7ff f99d 	bl	1d44 <config_pin>
			// PA6 -> MISO input (floating),   alt PB4
			config_pin(PORTB,4,INPUT_FLOAT);
    2a0a:	4818      	ldr	r0, [pc, #96]	; (2a6c <spi_config_port+0xdc>)
    2a0c:	2104      	movs	r1, #4
    2a0e:	2204      	movs	r2, #4
    2a10:	f7ff f998 	bl	1d44 <config_pin>
			// PA7 -> MOSI output (push-pull), alt PB5
			config_pin(PORTB,5,OUTPUT_PP_FAST);
    2a14:	4815      	ldr	r0, [pc, #84]	; (2a6c <spi_config_port+0xdc>)
    2a16:	2105      	movs	r1, #5
    2a18:	2203      	movs	r2, #3
    2a1a:	f7ff f993 	bl	1d44 <config_pin>
    2a1e:	e019      	b.n	2a54 <spi_config_port+0xc4>
		}
	}else{
		// activation clock du port
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    2a20:	4a0f      	ldr	r2, [pc, #60]	; (2a60 <spi_config_port+0xd0>)
    2a22:	4b0f      	ldr	r3, [pc, #60]	; (2a60 <spi_config_port+0xd0>)
    2a24:	699b      	ldr	r3, [r3, #24]
    2a26:	f043 0308 	orr.w	r3, r3, #8
    2a2a:	6193      	str	r3, [r2, #24]
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(PORTB,2,OUTPUT_PP_FAST);
    2a2c:	480f      	ldr	r0, [pc, #60]	; (2a6c <spi_config_port+0xdc>)
    2a2e:	2102      	movs	r1, #2
    2a30:	2203      	movs	r2, #3
    2a32:	f7ff f987 	bl	1d44 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(PORTB,13,OUTPUT_PP_FAST);
    2a36:	480d      	ldr	r0, [pc, #52]	; (2a6c <spi_config_port+0xdc>)
    2a38:	210d      	movs	r1, #13
    2a3a:	2203      	movs	r2, #3
    2a3c:	f7ff f982 	bl	1d44 <config_pin>
		// PB14 MISO input (floating)
		config_pin(PORTB,14,INPUT_FLOAT);
    2a40:	480a      	ldr	r0, [pc, #40]	; (2a6c <spi_config_port+0xdc>)
    2a42:	210e      	movs	r1, #14
    2a44:	2204      	movs	r2, #4
    2a46:	f7ff f97d 	bl	1d44 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(PORTB,15,OUTPUT_PP_FAST);
    2a4a:	4808      	ldr	r0, [pc, #32]	; (2a6c <spi_config_port+0xdc>)
    2a4c:	210f      	movs	r1, #15
    2a4e:	2203      	movs	r2, #3
    2a50:	f7ff f978 	bl	1d44 <config_pin>
	}
}
    2a54:	3708      	adds	r7, #8
    2a56:	46bd      	mov	sp, r7
    2a58:	bd80      	pop	{r7, pc}
    2a5a:	bf00      	nop
    2a5c:	40013000 	.word	0x40013000
    2a60:	40021000 	.word	0x40021000
    2a64:	40010800 	.word	0x40010800
    2a68:	40010000 	.word	0x40010000
    2a6c:	40010c00 	.word	0x40010c00

00002a70 <spi_init>:

void spi_init(spi_sfr_t* channel, unsigned baud,unsigned mode, int afio_cfg){
    2a70:	b580      	push	{r7, lr}
    2a72:	b084      	sub	sp, #16
    2a74:	af00      	add	r7, sp, #0
    2a76:	60f8      	str	r0, [r7, #12]
    2a78:	60b9      	str	r1, [r7, #8]
    2a7a:	607a      	str	r2, [r7, #4]
    2a7c:	603b      	str	r3, [r7, #0]
	spi_config_port(channel,afio_cfg);
    2a7e:	68f8      	ldr	r0, [r7, #12]
    2a80:	6839      	ldr	r1, [r7, #0]
    2a82:	f7ff ff85 	bl	2990 <spi_config_port>
	// activation clock SPI
	if (channel==SPI1){
    2a86:	68fb      	ldr	r3, [r7, #12]
    2a88:	4a0f      	ldr	r2, [pc, #60]	; (2ac8 <spi_init+0x58>)
    2a8a:	4293      	cmp	r3, r2
    2a8c:	d106      	bne.n	2a9c <spi_init+0x2c>
		RCC->APB2ENR|=RCC_APB2ENR_SPI1EN;
    2a8e:	4a0f      	ldr	r2, [pc, #60]	; (2acc <spi_init+0x5c>)
    2a90:	4b0e      	ldr	r3, [pc, #56]	; (2acc <spi_init+0x5c>)
    2a92:	699b      	ldr	r3, [r3, #24]
    2a94:	f443 5380 	orr.w	r3, r3, #4096	; 0x1000
    2a98:	6193      	str	r3, [r2, #24]
    2a9a:	e005      	b.n	2aa8 <spi_init+0x38>
	}else{
		RCC->APB1ENR|=RCC_APB1ENR_SPI2EN;
    2a9c:	4a0b      	ldr	r2, [pc, #44]	; (2acc <spi_init+0x5c>)
    2a9e:	4b0b      	ldr	r3, [pc, #44]	; (2acc <spi_init+0x5c>)
    2aa0:	69db      	ldr	r3, [r3, #28]
    2aa2:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    2aa6:	61d3      	str	r3, [r2, #28]
	}
	channel->CR1=mode;
    2aa8:	68fb      	ldr	r3, [r7, #12]
    2aaa:	687a      	ldr	r2, [r7, #4]
    2aac:	601a      	str	r2, [r3, #0]
	spi_baudrate(channel,baud);
    2aae:	68f8      	ldr	r0, [r7, #12]
    2ab0:	68b9      	ldr	r1, [r7, #8]
    2ab2:	f7ff ff55 	bl	2960 <spi_baudrate>
	_spi_enable(channel);
    2ab6:	68fb      	ldr	r3, [r7, #12]
    2ab8:	681b      	ldr	r3, [r3, #0]
    2aba:	f043 0240 	orr.w	r2, r3, #64	; 0x40
    2abe:	68fb      	ldr	r3, [r7, #12]
    2ac0:	601a      	str	r2, [r3, #0]
}
    2ac2:	3710      	adds	r7, #16
    2ac4:	46bd      	mov	sp, r7
    2ac6:	bd80      	pop	{r7, pc}
    2ac8:	40013000 	.word	0x40013000
    2acc:	40021000 	.word	0x40021000

00002ad0 <spi_write>:


// envoie un octet via le canla SPI
inline void spi_write(spi_sfr_t* channel, uint8_t b){
    2ad0:	b480      	push	{r7}
    2ad2:	b085      	sub	sp, #20
    2ad4:	af00      	add	r7, sp, #0
    2ad6:	6078      	str	r0, [r7, #4]
    2ad8:	460b      	mov	r3, r1
    2ada:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	channel->DR=b;
    2adc:	78fa      	ldrb	r2, [r7, #3]
    2ade:	687b      	ldr	r3, [r7, #4]
    2ae0:	60da      	str	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    2ae2:	bf00      	nop
    2ae4:	687b      	ldr	r3, [r7, #4]
    2ae6:	689b      	ldr	r3, [r3, #8]
    2ae8:	f003 0301 	and.w	r3, r3, #1
    2aec:	2b00      	cmp	r3, #0
    2aee:	d0f9      	beq.n	2ae4 <spi_write+0x14>
	rx=(uint8_t)channel->DR;
    2af0:	687b      	ldr	r3, [r7, #4]
    2af2:	68db      	ldr	r3, [r3, #12]
    2af4:	73fb      	strb	r3, [r7, #15]
}
    2af6:	3714      	adds	r7, #20
    2af8:	46bd      	mov	sp, r7
    2afa:	f85d 7b04 	ldr.w	r7, [sp], #4
    2afe:	4770      	bx	lr

00002b00 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    2b00:	b480      	push	{r7}
    2b02:	b085      	sub	sp, #20
    2b04:	af00      	add	r7, sp, #0
    2b06:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	channel->DR=255;
    2b08:	687b      	ldr	r3, [r7, #4]
    2b0a:	22ff      	movs	r2, #255	; 0xff
    2b0c:	60da      	str	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    2b0e:	bf00      	nop
    2b10:	687b      	ldr	r3, [r7, #4]
    2b12:	689b      	ldr	r3, [r3, #8]
    2b14:	f003 0301 	and.w	r3, r3, #1
    2b18:	2b00      	cmp	r3, #0
    2b1a:	d0f9      	beq.n	2b10 <spi_read+0x10>
	rx=(uint8_t)channel->DR;
    2b1c:	687b      	ldr	r3, [r7, #4]
    2b1e:	68db      	ldr	r3, [r3, #12]
    2b20:	73fb      	strb	r3, [r7, #15]
	return rx;
    2b22:	7bfb      	ldrb	r3, [r7, #15]
}
    2b24:	4618      	mov	r0, r3
    2b26:	3714      	adds	r7, #20
    2b28:	46bd      	mov	sp, r7
    2b2a:	f85d 7b04 	ldr.w	r7, [sp], #4
    2b2e:	4770      	bx	lr

00002b30 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    2b30:	b480      	push	{r7}
    2b32:	b087      	sub	sp, #28
    2b34:	af00      	add	r7, sp, #0
    2b36:	60f8      	str	r0, [r7, #12]
    2b38:	60b9      	str	r1, [r7, #8]
    2b3a:	607a      	str	r2, [r7, #4]
	uint8_t rx;
	while (count){
    2b3c:	e010      	b.n	2b60 <spi_block_write+0x30>
		channel->DR=*buffer++;
    2b3e:	68bb      	ldr	r3, [r7, #8]
    2b40:	1c5a      	adds	r2, r3, #1
    2b42:	60ba      	str	r2, [r7, #8]
    2b44:	781b      	ldrb	r3, [r3, #0]
    2b46:	461a      	mov	r2, r3
    2b48:	68fb      	ldr	r3, [r7, #12]
    2b4a:	60da      	str	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    2b4c:	bf00      	nop
    2b4e:	68fb      	ldr	r3, [r7, #12]
    2b50:	689b      	ldr	r3, [r3, #8]
    2b52:	f003 0302 	and.w	r3, r3, #2
    2b56:	2b00      	cmp	r3, #0
    2b58:	d0f9      	beq.n	2b4e <spi_block_write+0x1e>
		count--;
    2b5a:	687b      	ldr	r3, [r7, #4]
    2b5c:	3b01      	subs	r3, #1
    2b5e:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	uint8_t rx;
	while (count){
    2b60:	687b      	ldr	r3, [r7, #4]
    2b62:	2b00      	cmp	r3, #0
    2b64:	d1eb      	bne.n	2b3e <spi_block_write+0xe>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	while (channel->SR&SPI_SR_BSY);
    2b66:	bf00      	nop
    2b68:	68fb      	ldr	r3, [r7, #12]
    2b6a:	689b      	ldr	r3, [r3, #8]
    2b6c:	f003 0380 	and.w	r3, r3, #128	; 0x80
    2b70:	2b00      	cmp	r3, #0
    2b72:	d1f9      	bne.n	2b68 <spi_block_write+0x38>
	rx=(uint8_t)channel->DR;
    2b74:	68fb      	ldr	r3, [r7, #12]
    2b76:	68db      	ldr	r3, [r3, #12]
    2b78:	75fb      	strb	r3, [r7, #23]
}
    2b7a:	371c      	adds	r7, #28
    2b7c:	46bd      	mov	sp, r7
    2b7e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2b82:	4770      	bx	lr

00002b84 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    2b84:	b480      	push	{r7}
    2b86:	b085      	sub	sp, #20
    2b88:	af00      	add	r7, sp, #0
    2b8a:	60f8      	str	r0, [r7, #12]
    2b8c:	60b9      	str	r1, [r7, #8]
    2b8e:	607a      	str	r2, [r7, #4]
	while (count){
    2b90:	e013      	b.n	2bba <spi_block_read+0x36>
		channel->DR=0;
    2b92:	68fb      	ldr	r3, [r7, #12]
    2b94:	2200      	movs	r2, #0
    2b96:	60da      	str	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    2b98:	bf00      	nop
    2b9a:	68fb      	ldr	r3, [r7, #12]
    2b9c:	689b      	ldr	r3, [r3, #8]
    2b9e:	f003 0301 	and.w	r3, r3, #1
    2ba2:	2b00      	cmp	r3, #0
    2ba4:	d0f9      	beq.n	2b9a <spi_block_read+0x16>
		*buffer++=(uint8_t)channel->DR;
    2ba6:	68bb      	ldr	r3, [r7, #8]
    2ba8:	1c5a      	adds	r2, r3, #1
    2baa:	60ba      	str	r2, [r7, #8]
    2bac:	68fa      	ldr	r2, [r7, #12]
    2bae:	68d2      	ldr	r2, [r2, #12]
    2bb0:	b2d2      	uxtb	r2, r2
    2bb2:	701a      	strb	r2, [r3, #0]
		count--;
    2bb4:	687b      	ldr	r3, [r7, #4]
    2bb6:	3b01      	subs	r3, #1
    2bb8:	607b      	str	r3, [r7, #4]
	rx=(uint8_t)channel->DR;
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	while (count){
    2bba:	687b      	ldr	r3, [r7, #4]
    2bbc:	2b00      	cmp	r3, #0
    2bbe:	d1e8      	bne.n	2b92 <spi_block_read+0xe>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
}
    2bc0:	3714      	adds	r7, #20
    2bc2:	46bd      	mov	sp, r7
    2bc4:	f85d 7b04 	ldr.w	r7, [sp], #4
    2bc8:	4770      	bx	lr
    2bca:	bf00      	nop

00002bcc <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    2bcc:	4b01      	ldr	r3, [pc, #4]	; (2bd4 <reset_mcu+0x8>)
    2bce:	4a02      	ldr	r2, [pc, #8]	; (2bd8 <reset_mcu+0xc>)
    2bd0:	601a      	str	r2, [r3, #0]
    2bd2:	bf00      	nop
    2bd4:	e000ed0c 	.word	0xe000ed0c
    2bd8:	05fa0004 	.word	0x05fa0004

00002bdc <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    2bdc:	b580      	push	{r7, lr}
    2bde:	b082      	sub	sp, #8
    2be0:	af00      	add	r7, sp, #0
    2be2:	6078      	str	r0, [r7, #4]
    2be4:	6039      	str	r1, [r7, #0]
	print(msg);
    2be6:	6878      	ldr	r0, [r7, #4]
    2be8:	f7fe fad0 	bl	118c <print>
	print("at address ");
    2bec:	4814      	ldr	r0, [pc, #80]	; (2c40 <print_fault+0x64>)
    2bee:	f7fe facd 	bl	118c <print>
	if (adr) {
    2bf2:	683b      	ldr	r3, [r7, #0]
    2bf4:	2b00      	cmp	r3, #0
    2bf6:	d002      	beq.n	2bfe <print_fault+0x22>
		print_hex(adr);
    2bf8:	6838      	ldr	r0, [r7, #0]
    2bfa:	f7fe fc0f 	bl	141c <print_hex>
	};
	conout(CR);
    2bfe:	200d      	movs	r0, #13
    2c00:	f7fe faaa 	bl	1158 <conout>
	print("UFSR=");
    2c04:	480f      	ldr	r0, [pc, #60]	; (2c44 <print_fault+0x68>)
    2c06:	f7fe fac1 	bl	118c <print>
	print_hex(CFSR->fsr.usageFalt);
    2c0a:	4b0f      	ldr	r3, [pc, #60]	; (2c48 <print_fault+0x6c>)
    2c0c:	681b      	ldr	r3, [r3, #0]
    2c0e:	0c1b      	lsrs	r3, r3, #16
    2c10:	b29b      	uxth	r3, r3
    2c12:	4618      	mov	r0, r3
    2c14:	f7fe fc02 	bl	141c <print_hex>
	print(", BFSR=");
    2c18:	480c      	ldr	r0, [pc, #48]	; (2c4c <print_fault+0x70>)
    2c1a:	f7fe fab7 	bl	118c <print>
	print_hex(CFSR->fsr.busFault);
    2c1e:	4b0a      	ldr	r3, [pc, #40]	; (2c48 <print_fault+0x6c>)
    2c20:	681b      	ldr	r3, [r3, #0]
    2c22:	0a1b      	lsrs	r3, r3, #8
    2c24:	b2db      	uxtb	r3, r3
    2c26:	4618      	mov	r0, r3
    2c28:	f7fe fbf8 	bl	141c <print_hex>
	print(", MMFSR=");
    2c2c:	4808      	ldr	r0, [pc, #32]	; (2c50 <print_fault+0x74>)
    2c2e:	f7fe faad 	bl	118c <print>
	print_hex(CFSR->fsr.mmFault);
    2c32:	4b05      	ldr	r3, [pc, #20]	; (2c48 <print_fault+0x6c>)
    2c34:	681b      	ldr	r3, [r3, #0]
    2c36:	b2db      	uxtb	r3, r3
    2c38:	4618      	mov	r0, r3
    2c3a:	f7fe fbef 	bl	141c <print_hex>
	while(1);
    2c3e:	e7fe      	b.n	2c3e <print_fault+0x62>
    2c40:	00003b90 	.word	0x00003b90
    2c44:	00003b9c 	.word	0x00003b9c
    2c48:	e000ed28 	.word	0xe000ed28
    2c4c:	00003ba4 	.word	0x00003ba4
    2c50:	00003bac 	.word	0x00003bac

00002c54 <config_systicks>:


// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
#define MSEC_DLY FCLK/8/1000
void config_systicks(){
    2c54:	b580      	push	{r7, lr}
    2c56:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,9);
    2c58:	f06f 000e 	mvn.w	r0, #14
    2c5c:	2109      	movs	r1, #9
    2c5e:	f7ff fc3f 	bl	24e0 <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
    2c62:	4b04      	ldr	r3, [pc, #16]	; (2c74 <config_systicks+0x20>)
    2c64:	f641 723f 	movw	r2, #7999	; 0x1f3f
    2c68:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
    2c6a:	4b03      	ldr	r3, [pc, #12]	; (2c78 <config_systicks+0x24>)
    2c6c:	2203      	movs	r2, #3
    2c6e:	601a      	str	r2, [r3, #0]
}
    2c70:	bd80      	pop	{r7, pc}
    2c72:	bf00      	nop
    2c74:	e000e014 	.word	0xe000e014
    2c78:	e000e010 	.word	0xe000e010

00002c7c <pause>:



void pause(unsigned msec){
    2c7c:	b480      	push	{r7}
    2c7e:	b083      	sub	sp, #12
    2c80:	af00      	add	r7, sp, #0
    2c82:	6078      	str	r0, [r7, #4]
	timer=msec;
    2c84:	4a06      	ldr	r2, [pc, #24]	; (2ca0 <pause+0x24>)
    2c86:	687b      	ldr	r3, [r7, #4]
    2c88:	6013      	str	r3, [r2, #0]
	while (timer);
    2c8a:	bf00      	nop
    2c8c:	4b04      	ldr	r3, [pc, #16]	; (2ca0 <pause+0x24>)
    2c8e:	681b      	ldr	r3, [r3, #0]
    2c90:	2b00      	cmp	r3, #0
    2c92:	d1fb      	bne.n	2c8c <pause+0x10>
}
    2c94:	370c      	adds	r7, #12
    2c96:	46bd      	mov	sp, r7
    2c98:	f85d 7b04 	ldr.w	r7, [sp], #4
    2c9c:	4770      	bx	lr
    2c9e:	bf00      	nop
    2ca0:	200000e4 	.word	0x200000e4

00002ca4 <STK_handler>:


// interruption coretimer
void STK_handler(){
    2ca4:	b480      	push	{r7}
    2ca6:	af00      	add	r7, sp, #0
	ticks++;
    2ca8:	4b08      	ldr	r3, [pc, #32]	; (2ccc <STK_handler+0x28>)
    2caa:	681b      	ldr	r3, [r3, #0]
    2cac:	3301      	adds	r3, #1
    2cae:	4a07      	ldr	r2, [pc, #28]	; (2ccc <STK_handler+0x28>)
    2cb0:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
    2cb2:	4b07      	ldr	r3, [pc, #28]	; (2cd0 <STK_handler+0x2c>)
    2cb4:	681b      	ldr	r3, [r3, #0]
    2cb6:	2b00      	cmp	r3, #0
    2cb8:	d004      	beq.n	2cc4 <STK_handler+0x20>
    2cba:	4b05      	ldr	r3, [pc, #20]	; (2cd0 <STK_handler+0x2c>)
    2cbc:	681b      	ldr	r3, [r3, #0]
    2cbe:	3b01      	subs	r3, #1
    2cc0:	4a03      	ldr	r2, [pc, #12]	; (2cd0 <STK_handler+0x2c>)
    2cc2:	6013      	str	r3, [r2, #0]
}
    2cc4:	46bd      	mov	sp, r7
    2cc6:	f85d 7b04 	ldr.w	r7, [sp], #4
    2cca:	4770      	bx	lr
    2ccc:	200000e0 	.word	0x200000e0
    2cd0:	200000e4 	.word	0x200000e4

00002cd4 <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    2cd4:	b480      	push	{r7}
    2cd6:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    2cd8:	2300      	movs	r3, #0
    2cda:	2200      	movs	r2, #0
    2cdc:	4618      	mov	r0, r3
    2cde:	4611      	mov	r1, r2
    2ce0:	df02      	svc	2
}
    2ce2:	46bd      	mov	sp, r7
    2ce4:	f85d 7b04 	ldr.w	r7, [sp], #4
    2ce8:	4770      	bx	lr
    2cea:	bf00      	nop

00002cec <tvout_init>:

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
    2cec:	b580      	push	{r7, lr}
    2cee:	b082      	sub	sp, #8
    2cf0:	af00      	add	r7, sp, #0
	//sortie sync sur PA8
	config_pin(PORTA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    2cf2:	484f      	ldr	r0, [pc, #316]	; (2e30 <tvout_init+0x144>)
    2cf4:	2108      	movs	r1, #8
    2cf6:	220a      	movs	r2, #10
    2cf8:	f7ff f824 	bl	1d44 <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    2cfc:	484d      	ldr	r0, [pc, #308]	; (2e34 <tvout_init+0x148>)
    2cfe:	210f      	movs	r1, #15
    2d00:	220b      	movs	r2, #11
    2d02:	f7ff f81f 	bl	1d44 <config_pin>
	PORTB->BRR=BIT15;
    2d06:	4b4b      	ldr	r3, [pc, #300]	; (2e34 <tvout_init+0x148>)
    2d08:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    2d0c:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
    2d0e:	4a4a      	ldr	r2, [pc, #296]	; (2e38 <tvout_init+0x14c>)
    2d10:	4b49      	ldr	r3, [pc, #292]	; (2e38 <tvout_init+0x14c>)
    2d12:	699b      	ldr	r3, [r3, #24]
    2d14:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    2d18:	6193      	str	r3, [r2, #24]
	// clock source division
	*TIMER1_PSC=0;
    2d1a:	4b48      	ldr	r3, [pc, #288]	; (2e3c <tvout_init+0x150>)
    2d1c:	2200      	movs	r2, #0
    2d1e:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    2d20:	4b47      	ldr	r3, [pc, #284]	; (2e40 <tvout_init+0x154>)
    2d22:	f640 72ff 	movw	r2, #4095	; 0xfff
    2d26:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    2d28:	4b46      	ldr	r3, [pc, #280]	; (2e44 <tvout_init+0x158>)
    2d2a:	f240 122b 	movw	r2, #299	; 0x12b
    2d2e:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    2d30:	4b45      	ldr	r3, [pc, #276]	; (2e48 <tvout_init+0x15c>)
    2d32:	681a      	ldr	r2, [r3, #0]
    2d34:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    2d38:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    2d3c:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    2d3e:	4b42      	ldr	r3, [pc, #264]	; (2e48 <tvout_init+0x15c>)
    2d40:	681a      	ldr	r2, [r3, #0]
    2d42:	f042 0208 	orr.w	r2, r2, #8
    2d46:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    2d48:	4b40      	ldr	r3, [pc, #256]	; (2e4c <tvout_init+0x160>)
    2d4a:	681a      	ldr	r2, [r3, #0]
    2d4c:	f042 0201 	orr.w	r2, r2, #1
    2d50:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    2d52:	4b3e      	ldr	r3, [pc, #248]	; (2e4c <tvout_init+0x160>)
    2d54:	681a      	ldr	r2, [r3, #0]
    2d56:	f042 0202 	orr.w	r2, r2, #2
    2d5a:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    2d5c:	4a3c      	ldr	r2, [pc, #240]	; (2e50 <tvout_init+0x164>)
    2d5e:	8813      	ldrh	r3, [r2, #0]
    2d60:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    2d64:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    2d68:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    2d6a:	4b3a      	ldr	r3, [pc, #232]	; (2e54 <tvout_init+0x168>)
    2d6c:	681a      	ldr	r2, [r3, #0]
    2d6e:	f042 0201 	orr.w	r2, r2, #1
    2d72:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    2d74:	4b38      	ldr	r3, [pc, #224]	; (2e58 <tvout_init+0x16c>)
    2d76:	f640 324c 	movw	r2, #2892	; 0xb4c
    2d7a:	601a      	str	r2, [r3, #0]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    2d7c:	4b37      	ldr	r3, [pc, #220]	; (2e5c <tvout_init+0x170>)
    2d7e:	f243 5292 	movw	r2, #13714	; 0x3592
    2d82:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    2d84:	4b35      	ldr	r3, [pc, #212]	; (2e5c <tvout_init+0x170>)
    2d86:	4a36      	ldr	r2, [pc, #216]	; (2e60 <tvout_init+0x174>)
    2d88:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    2d8a:	4a33      	ldr	r2, [pc, #204]	; (2e58 <tvout_init+0x16c>)
    2d8c:	4b32      	ldr	r3, [pc, #200]	; (2e58 <tvout_init+0x16c>)
    2d8e:	685b      	ldr	r3, [r3, #4]
    2d90:	f043 0302 	orr.w	r3, r3, #2
    2d94:	6053      	str	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,1);
    2d96:	200f      	movs	r0, #15
    2d98:	2101      	movs	r1, #1
    2d9a:	f7ff fba1 	bl	24e0 <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    2d9e:	200f      	movs	r0, #15
    2da0:	f7ff fae2 	bl	2368 <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    2da4:	4b2f      	ldr	r3, [pc, #188]	; (2e64 <tvout_init+0x178>)
    2da6:	681a      	ldr	r2, [r3, #0]
    2da8:	f042 0202 	orr.w	r2, r2, #2
    2dac:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,1);
    2dae:	201b      	movs	r0, #27
    2db0:	2101      	movs	r1, #1
    2db2:	f7ff fb95 	bl	24e0 <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    2db6:	201b      	movs	r0, #27
    2db8:	f7ff fad6 	bl	2368 <enable_interrupt>
	//video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    2dbc:	2300      	movs	r3, #0
    2dbe:	607b      	str	r3, [r7, #4]
    2dc0:	e011      	b.n	2de6 <tvout_init+0xfa>
		video_buffer[i]=0xffff;
    2dc2:	4a29      	ldr	r2, [pc, #164]	; (2e68 <tvout_init+0x17c>)
    2dc4:	687b      	ldr	r3, [r7, #4]
    2dc6:	f64f 71ff 	movw	r1, #65535	; 0xffff
    2dca:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
    2dce:	687b      	ldr	r3, [r7, #4]
    2dd0:	f503 5395 	add.w	r3, r3, #4768	; 0x12a0
    2dd4:	330c      	adds	r3, #12
    2dd6:	4a24      	ldr	r2, [pc, #144]	; (2e68 <tvout_init+0x17c>)
    2dd8:	f64f 71ff 	movw	r1, #65535	; 0xffff
    2ddc:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,1);
	enable_interrupt(IRQ_TIM1_CC);
	//video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    2de0:	687b      	ldr	r3, [r7, #4]
    2de2:	3301      	adds	r3, #1
    2de4:	607b      	str	r3, [r7, #4]
    2de6:	687b      	ldr	r3, [r7, #4]
    2de8:	2b13      	cmp	r3, #19
    2dea:	ddea      	ble.n	2dc2 <tvout_init+0xd6>
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    2dec:	2301      	movs	r3, #1
    2dee:	607b      	str	r3, [r7, #4]
    2df0:	e018      	b.n	2e24 <tvout_init+0x138>
		video_buffer[i*ROW_SIZE]=0x8000;
    2df2:	687a      	ldr	r2, [r7, #4]
    2df4:	4613      	mov	r3, r2
    2df6:	009b      	lsls	r3, r3, #2
    2df8:	4413      	add	r3, r2
    2dfa:	009b      	lsls	r3, r3, #2
    2dfc:	461a      	mov	r2, r3
    2dfe:	4b1a      	ldr	r3, [pc, #104]	; (2e68 <tvout_init+0x17c>)
    2e00:	f44f 4100 	mov.w	r1, #32768	; 0x8000
    2e04:	f823 1012 	strh.w	r1, [r3, r2, lsl #1]
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
    2e08:	687b      	ldr	r3, [r7, #4]
    2e0a:	1c5a      	adds	r2, r3, #1
    2e0c:	4613      	mov	r3, r2
    2e0e:	009b      	lsls	r3, r3, #2
    2e10:	4413      	add	r3, r2
    2e12:	009b      	lsls	r3, r3, #2
    2e14:	3b01      	subs	r3, #1
    2e16:	4a14      	ldr	r2, [pc, #80]	; (2e68 <tvout_init+0x17c>)
    2e18:	2101      	movs	r1, #1
    2e1a:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i;
	for (i=0;i<ROW_SIZE;i++){
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    2e1e:	687b      	ldr	r3, [r7, #4]
    2e20:	3301      	adds	r3, #1
    2e22:	607b      	str	r3, [r7, #4]
    2e24:	687b      	ldr	r3, [r7, #4]
    2e26:	2bed      	cmp	r3, #237	; 0xed
    2e28:	dde3      	ble.n	2df2 <tvout_init+0x106>
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	// test end */
 }
    2e2a:	3708      	adds	r7, #8
    2e2c:	46bd      	mov	sp, r7
    2e2e:	bd80      	pop	{r7, pc}
    2e30:	40010800 	.word	0x40010800
    2e34:	40010c00 	.word	0x40010c00
    2e38:	40021000 	.word	0x40021000
    2e3c:	40012c28 	.word	0x40012c28
    2e40:	40012c2c 	.word	0x40012c2c
    2e44:	40012c34 	.word	0x40012c34
    2e48:	40012c18 	.word	0x40012c18
    2e4c:	40012c20 	.word	0x40012c20
    2e50:	40012c44 	.word	0x40012c44
    2e54:	40012c00 	.word	0x40012c00
    2e58:	40003800 	.word	0x40003800
    2e5c:	40020058 	.word	0x40020058
    2e60:	4000380c 	.word	0x4000380c
    2e64:	40012c0c 	.word	0x40012c0c
    2e68:	20000138 	.word	0x20000138

00002e6c <TIM1_CC_handler>:
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    2e6c:	4853      	ldr	r0, [pc, #332]	; (2fbc <TIM1_CC_handler+0x150>)
	line_count++;
    2e6e:	4b54      	ldr	r3, [pc, #336]	; (2fc0 <TIM1_CC_handler+0x154>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    2e70:	6802      	ldr	r2, [r0, #0]
	line_count++;
	TIMER1_SR->fld.cc1if=0;
    2e72:	4954      	ldr	r1, [pc, #336]	; (2fc4 <TIM1_CC_handler+0x158>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    2e74:	f022 0201 	bic.w	r2, r2, #1
    2e78:	6002      	str	r2, [r0, #0]
	line_count++;
    2e7a:	681a      	ldr	r2, [r3, #0]
    2e7c:	3201      	adds	r2, #1
    2e7e:	601a      	str	r2, [r3, #0]
	TIMER1_SR->fld.cc1if=0;
    2e80:	680a      	ldr	r2, [r1, #0]
    2e82:	f022 0202 	bic.w	r2, r2, #2
    2e86:	600a      	str	r2, [r1, #0]
	switch(line_count){
    2e88:	681a      	ldr	r2, [r3, #0]
    2e8a:	2a12      	cmp	r2, #18
    2e8c:	f000 8090 	beq.w	2fb0 <TIM1_CC_handler+0x144>
    2e90:	dd1d      	ble.n	2ece <TIM1_CC_handler+0x62>
    2e92:	f5b2 7f96 	cmp.w	r2, #300	; 0x12c
    2e96:	f000 8082 	beq.w	2f9e <TIM1_CC_handler+0x132>
    2e9a:	dd3f      	ble.n	2f1c <TIM1_CC_handler+0xb0>
    2e9c:	f240 1141 	movw	r1, #321	; 0x141
    2ea0:	428a      	cmp	r2, r1
    2ea2:	d028      	beq.n	2ef6 <TIM1_CC_handler+0x8a>
    2ea4:	f5b2 7fa1 	cmp.w	r2, #322	; 0x142
    2ea8:	d14a      	bne.n	2f40 <TIM1_CC_handler+0xd4>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    2eaa:	4a47      	ldr	r2, [pc, #284]	; (2fc8 <TIM1_CC_handler+0x15c>)
    2eac:	6811      	ldr	r1, [r2, #0]
    2eae:	b169      	cbz	r1, 2ecc <TIM1_CC_handler+0x60>
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
    2eb0:	b410      	push	{r4}
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    2eb2:	4846      	ldr	r0, [pc, #280]	; (2fcc <TIM1_CC_handler+0x160>)
			line_count=-1;
    2eb4:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    2eb8:	8801      	ldrh	r1, [r0, #0]
    2eba:	f3c1 014e 	ubfx	r1, r1, #1, #15
    2ebe:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    2ec0:	601c      	str	r4, [r3, #0]
			even=-even;
    2ec2:	6813      	ldr	r3, [r2, #0]
    2ec4:	425b      	negs	r3, r3
    2ec6:	6013      	str	r3, [r2, #0]
			);
			_enable_dma();
		}
		break;
	}//switch (line_count)
}
    2ec8:	f85d 4b04 	ldr.w	r4, [sp], #4
    2ecc:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2ece:	2a06      	cmp	r2, #6
    2ed0:	d069      	beq.n	2fa6 <TIM1_CC_handler+0x13a>
    2ed2:	dd29      	ble.n	2f28 <TIM1_CC_handler+0xbc>
    2ed4:	2a0c      	cmp	r2, #12
    2ed6:	d019      	beq.n	2f0c <TIM1_CC_handler+0xa0>
    2ed8:	2a11      	cmp	r2, #17
    2eda:	d131      	bne.n	2f40 <TIM1_CC_handler+0xd4>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
		break;
	case 17: // fin sync champ paire
		if (even){
    2edc:	4b3a      	ldr	r3, [pc, #232]	; (2fc8 <TIM1_CC_handler+0x15c>)
    2ede:	681b      	ldr	r3, [r3, #0]
    2ee0:	2b00      	cmp	r3, #0
    2ee2:	d0f3      	beq.n	2ecc <TIM1_CC_handler+0x60>
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    2ee4:	f640 70ff 	movw	r0, #4095	; 0xfff
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    2ee8:	f240 122b 	movw	r2, #299	; 0x12b
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    2eec:	4937      	ldr	r1, [pc, #220]	; (2fcc <TIM1_CC_handler+0x160>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    2eee:	4b38      	ldr	r3, [pc, #224]	; (2fd0 <TIM1_CC_handler+0x164>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    2ef0:	8008      	strh	r0, [r1, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    2ef2:	801a      	strh	r2, [r3, #0]
    2ef4:	4770      	bx	lr
		break;
	case (TOP_LINE+VRES):
		video=0;
		break;
	case FIELD_END:
		if (!even){
    2ef6:	4a34      	ldr	r2, [pc, #208]	; (2fc8 <TIM1_CC_handler+0x15c>)
    2ef8:	6811      	ldr	r1, [r2, #0]
    2efa:	2900      	cmp	r1, #0
    2efc:	d1e6      	bne.n	2ecc <TIM1_CC_handler+0x60>
			line_count=-1;
    2efe:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    2f02:	6019      	str	r1, [r3, #0]
			even=-even;
    2f04:	6813      	ldr	r3, [r2, #0]
    2f06:	425b      	negs	r3, r3
    2f08:	6013      	str	r3, [r2, #0]
    2f0a:	4770      	bx	lr
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    2f0c:	f240 70ff 	movw	r0, #2047	; 0x7ff
    2f10:	492e      	ldr	r1, [pc, #184]	; (2fcc <TIM1_CC_handler+0x160>)
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    2f12:	4b2f      	ldr	r3, [pc, #188]	; (2fd0 <TIM1_CC_handler+0x164>)
    2f14:	2295      	movs	r2, #149	; 0x95
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    2f16:	8008      	strh	r0, [r1, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    2f18:	801a      	strh	r2, [r3, #0]
		break;
    2f1a:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2f1c:	2a3b      	cmp	r2, #59	; 0x3b
    2f1e:	d10f      	bne.n	2f40 <TIM1_CC_handler+0xd4>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    2f20:	4b2c      	ldr	r3, [pc, #176]	; (2fd4 <TIM1_CC_handler+0x168>)
    2f22:	2201      	movs	r2, #1
    2f24:	601a      	str	r2, [r3, #0]
		break;
    2f26:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2f28:	b952      	cbnz	r2, 2f40 <TIM1_CC_handler+0xd4>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    2f2a:	4928      	ldr	r1, [pc, #160]	; (2fcc <TIM1_CC_handler+0x160>)
		*TIMER1_CCR1/=2;
    2f2c:	4a28      	ldr	r2, [pc, #160]	; (2fd0 <TIM1_CC_handler+0x164>)
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    2f2e:	880b      	ldrh	r3, [r1, #0]
    2f30:	f3c3 034e 	ubfx	r3, r3, #1, #15
    2f34:	800b      	strh	r3, [r1, #0]
		*TIMER1_CCR1/=2;
    2f36:	8813      	ldrh	r3, [r2, #0]
    2f38:	f3c3 034e 	ubfx	r3, r3, #1, #15
    2f3c:	8013      	strh	r3, [r2, #0]
		break;
    2f3e:	4770      	bx	lr
		SPI2->DR=0xaaaa;
		while (SPI2->SR&SPI_SR_BSY);
		SPI2->CR1=SPI_PIXELS;
		SPI2->DR=0;
*/	
		if (video){
    2f40:	4a24      	ldr	r2, [pc, #144]	; (2fd4 <TIM1_CC_handler+0x168>)
    2f42:	6812      	ldr	r2, [r2, #0]
    2f44:	2a00      	cmp	r2, #0
    2f46:	d0c1      	beq.n	2ecc <TIM1_CC_handler+0x60>
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2f48:	681b      	ldr	r3, [r3, #0]
    2f4a:	4a23      	ldr	r2, [pc, #140]	; (2fd8 <TIM1_CC_handler+0x16c>)
    2f4c:	3b3c      	subs	r3, #60	; 0x3c
    2f4e:	491b      	ldr	r1, [pc, #108]	; (2fbc <TIM1_CC_handler+0x150>)
    2f50:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    2f54:	eb02 03c3 	add.w	r3, r2, r3, lsl #3
			DMA1[DMACH5].cndtr=ROW_SIZE;
    2f58:	2014      	movs	r0, #20
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    2f5a:	4a20      	ldr	r2, [pc, #128]	; (2fdc <TIM1_CC_handler+0x170>)
		SPI2->DR=0;
*/	
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    2f5c:	60cb      	str	r3, [r1, #12]
			DMA1[DMACH5].cndtr=ROW_SIZE;
    2f5e:	6048      	str	r0, [r1, #4]
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    2f60:	8813      	ldrh	r3, [r2, #0]
    2f62:	b29b      	uxth	r3, r3
    2f64:	f5b3 6f83 	cmp.w	r3, #1048	; 0x418
    2f68:	d804      	bhi.n	2f74 <TIM1_CC_handler+0x108>
    2f6a:	8813      	ldrh	r3, [r2, #0]
    2f6c:	b29b      	uxth	r3, r3
    2f6e:	f5b3 6f83 	cmp.w	r3, #1048	; 0x418
    2f72:	d9fa      	bls.n	2f6a <TIM1_CC_handler+0xfe>
			// réduction de la gigue vidéo
			asm volatile(
    2f74:	4b19      	ldr	r3, [pc, #100]	; (2fdc <TIM1_CC_handler+0x170>)
    2f76:	461b      	mov	r3, r3
    2f78:	681b      	ldr	r3, [r3, #0]
    2f7a:	f003 0307 	and.w	r3, r3, #7
    2f7e:	005b      	lsls	r3, r3, #1
    2f80:	449f      	add	pc, r3
    2f82:	bf00      	nop
    2f84:	bf00      	nop
    2f86:	bf00      	nop
    2f88:	bf00      	nop
    2f8a:	bf00      	nop
    2f8c:	bf00      	nop
    2f8e:	bf00      	nop
    2f90:	bf00      	nop
			"nop\n\t"
			"nop\n\t"
			"nop\n\t"
			::"r" (TIMER1_CNT)
			);
			_enable_dma();
    2f92:	4a0a      	ldr	r2, [pc, #40]	; (2fbc <TIM1_CC_handler+0x150>)
    2f94:	6813      	ldr	r3, [r2, #0]
    2f96:	f043 0301 	orr.w	r3, r3, #1
    2f9a:	6013      	str	r3, [r2, #0]
    2f9c:	4770      	bx	lr
		break;
	case TOP_LINE-1:
		video=1;
		break;
	case (TOP_LINE+VRES):
		video=0;
    2f9e:	4b0d      	ldr	r3, [pc, #52]	; (2fd4 <TIM1_CC_handler+0x168>)
    2fa0:	2200      	movs	r2, #0
    2fa2:	601a      	str	r2, [r3, #0]
		break;
    2fa4:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    2fa6:	f240 7269 	movw	r2, #1897	; 0x769
    2faa:	4b09      	ldr	r3, [pc, #36]	; (2fd0 <TIM1_CC_handler+0x164>)
    2fac:	801a      	strh	r2, [r3, #0]
	    break;
    2fae:	4770      	bx	lr
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
    2fb0:	4b05      	ldr	r3, [pc, #20]	; (2fc8 <TIM1_CC_handler+0x15c>)
    2fb2:	681b      	ldr	r3, [r3, #0]
    2fb4:	2b00      	cmp	r3, #0
    2fb6:	d189      	bne.n	2ecc <TIM1_CC_handler+0x60>
    2fb8:	e794      	b.n	2ee4 <TIM1_CC_handler+0x78>
    2fba:	bf00      	nop
    2fbc:	40020058 	.word	0x40020058
    2fc0:	20000004 	.word	0x20000004
    2fc4:	40012c10 	.word	0x40012c10
    2fc8:	200000ec 	.word	0x200000ec
    2fcc:	40012c2c 	.word	0x40012c2c
    2fd0:	40012c34 	.word	0x40012c34
    2fd4:	200000e8 	.word	0x200000e8
    2fd8:	20000138 	.word	0x20000138
    2fdc:	40012c24 	.word	0x40012c24

00002fe0 <DMA1CH5_handler>:
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
    2fe0:	b480      	push	{r7}
    2fe2:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    2fe4:	4a09      	ldr	r2, [pc, #36]	; (300c <DMA1CH5_handler+0x2c>)
    2fe6:	4b09      	ldr	r3, [pc, #36]	; (300c <DMA1CH5_handler+0x2c>)
    2fe8:	685b      	ldr	r3, [r3, #4]
    2fea:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    2fee:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    2ff0:	bf00      	nop
    2ff2:	4b07      	ldr	r3, [pc, #28]	; (3010 <DMA1CH5_handler+0x30>)
    2ff4:	689b      	ldr	r3, [r3, #8]
    2ff6:	f003 0302 	and.w	r3, r3, #2
    2ffa:	2b00      	cmp	r3, #0
    2ffc:	d0f9      	beq.n	2ff2 <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    2ffe:	4b04      	ldr	r3, [pc, #16]	; (3010 <DMA1CH5_handler+0x30>)
    3000:	2200      	movs	r2, #0
    3002:	60da      	str	r2, [r3, #12]
}
    3004:	46bd      	mov	sp, r7
    3006:	f85d 7b04 	ldr.w	r7, [sp], #4
    300a:	4770      	bx	lr
    300c:	40020000 	.word	0x40020000
    3010:	40003800 	.word	0x40003800

00003014 <usart_config_port>:

#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 

// configuration dse broches
void usart_config_port(usart_t* channel, gpio_t *port, unsigned flow_ctrl){
    3014:	b480      	push	{r7}
    3016:	b085      	sub	sp, #20
    3018:	af00      	add	r7, sp, #0
    301a:	60f8      	str	r0, [r7, #12]
    301c:	60b9      	str	r1, [r7, #8]
    301e:	607a      	str	r2, [r7, #4]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    3020:	68fb      	ldr	r3, [r7, #12]
    3022:	4a45      	ldr	r2, [pc, #276]	; (3138 <usart_config_port+0x124>)
    3024:	4293      	cmp	r3, r2
    3026:	d058      	beq.n	30da <usart_config_port+0xc6>
    3028:	4a44      	ldr	r2, [pc, #272]	; (313c <usart_config_port+0x128>)
    302a:	4293      	cmp	r3, r2
    302c:	d003      	beq.n	3036 <usart_config_port+0x22>
    302e:	4a44      	ldr	r2, [pc, #272]	; (3140 <usart_config_port+0x12c>)
    3030:	4293      	cmp	r3, r2
    3032:	d029      	beq.n	3088 <usart_config_port+0x74>
    3034:	e07a      	b.n	312c <usart_config_port+0x118>
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
    3036:	4a43      	ldr	r2, [pc, #268]	; (3144 <usart_config_port+0x130>)
    3038:	4b42      	ldr	r3, [pc, #264]	; (3144 <usart_config_port+0x130>)
    303a:	699b      	ldr	r3, [r3, #24]
    303c:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    3040:	f043 0304 	orr.w	r3, r3, #4
    3044:	6193      	str	r3, [r2, #24]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    3046:	687b      	ldr	r3, [r7, #4]
    3048:	2b01      	cmp	r3, #1
    304a:	d110      	bne.n	306e <usart_config_port+0x5a>
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
    304c:	68bb      	ldr	r3, [r7, #8]
    304e:	685b      	ldr	r3, [r3, #4]
    3050:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    3054:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    3058:	68ba      	ldr	r2, [r7, #8]
    305a:	6053      	str	r3, [r2, #4]
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
    305c:	68bb      	ldr	r3, [r7, #8]
    305e:	685b      	ldr	r3, [r3, #4]
    3060:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    3064:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    3068:	68ba      	ldr	r2, [r7, #8]
    306a:	6053      	str	r3, [r2, #4]
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
		}
		break;
    306c:	e05e      	b.n	312c <usart_config_port+0x118>
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
    306e:	68bb      	ldr	r3, [r7, #8]
    3070:	685b      	ldr	r3, [r3, #4]
    3072:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
    3076:	68bb      	ldr	r3, [r7, #8]
    3078:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
    307a:	68bb      	ldr	r3, [r7, #8]
    307c:	685b      	ldr	r3, [r3, #4]
    307e:	f043 02a0 	orr.w	r2, r3, #160	; 0xa0
    3082:	68bb      	ldr	r3, [r7, #8]
    3084:	605a      	str	r2, [r3, #4]
		}
		break;
    3086:	e051      	b.n	312c <usart_config_port+0x118>
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    3088:	4a2e      	ldr	r2, [pc, #184]	; (3144 <usart_config_port+0x130>)
    308a:	4b2e      	ldr	r3, [pc, #184]	; (3144 <usart_config_port+0x130>)
    308c:	69db      	ldr	r3, [r3, #28]
    308e:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    3092:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    3094:	4a2b      	ldr	r2, [pc, #172]	; (3144 <usart_config_port+0x130>)
    3096:	4b2b      	ldr	r3, [pc, #172]	; (3144 <usart_config_port+0x130>)
    3098:	699b      	ldr	r3, [r3, #24]
    309a:	f043 0304 	orr.w	r3, r3, #4
    309e:	6193      	str	r3, [r2, #24]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
    30a0:	687b      	ldr	r3, [r7, #4]
    30a2:	2b01      	cmp	r3, #1
    30a4:	d10c      	bne.n	30c0 <usart_config_port+0xac>
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
    30a6:	68bb      	ldr	r3, [r7, #8]
    30a8:	681b      	ldr	r3, [r3, #0]
    30aa:	f423 627f 	bic.w	r2, r3, #4080	; 0xff0
    30ae:	68bb      	ldr	r3, [r7, #8]
    30b0:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
    30b2:	68bb      	ldr	r3, [r7, #8]
    30b4:	681b      	ldr	r3, [r3, #0]
    30b6:	f443 622a 	orr.w	r2, r3, #2720	; 0xaa0
    30ba:	68bb      	ldr	r3, [r7, #8]
    30bc:	601a      	str	r2, [r3, #0]
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
		}
		break;
    30be:	e035      	b.n	312c <usart_config_port+0x118>
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
    30c0:	68bb      	ldr	r3, [r7, #8]
    30c2:	681b      	ldr	r3, [r3, #0]
    30c4:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    30c8:	68bb      	ldr	r3, [r7, #8]
    30ca:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
    30cc:	68bb      	ldr	r3, [r7, #8]
    30ce:	681b      	ldr	r3, [r3, #0]
    30d0:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    30d4:	68bb      	ldr	r3, [r7, #8]
    30d6:	601a      	str	r2, [r3, #0]
		}
		break;
    30d8:	e028      	b.n	312c <usart_config_port+0x118>
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
    30da:	4a1a      	ldr	r2, [pc, #104]	; (3144 <usart_config_port+0x130>)
    30dc:	4b19      	ldr	r3, [pc, #100]	; (3144 <usart_config_port+0x130>)
    30de:	69db      	ldr	r3, [r3, #28]
    30e0:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    30e4:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    30e6:	4a17      	ldr	r2, [pc, #92]	; (3144 <usart_config_port+0x130>)
    30e8:	4b16      	ldr	r3, [pc, #88]	; (3144 <usart_config_port+0x130>)
    30ea:	699b      	ldr	r3, [r3, #24]
    30ec:	f043 0308 	orr.w	r3, r3, #8
    30f0:	6193      	str	r3, [r2, #24]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    30f2:	687b      	ldr	r3, [r7, #4]
    30f4:	2b01      	cmp	r3, #1
    30f6:	d10c      	bne.n	3112 <usart_config_port+0xfe>
			port->CR[1]&=~((15<<((USART3_TX_PIN-8)*4))|(15<<((USART3_RTS_PIN-8)*4)));
    30f8:	68bb      	ldr	r3, [r7, #8]
    30fa:	685b      	ldr	r3, [r3, #4]
    30fc:	f023 220f 	bic.w	r2, r3, #251662080	; 0xf000f00
    3100:	68bb      	ldr	r3, [r7, #8]
    3102:	605a      	str	r2, [r3, #4]
			port->CR[1]|=(0xA<<((USART3_TX_PIN-8)*4))|(0xA<<((USART3_RTS_PIN-8)*4));
    3104:	68bb      	ldr	r3, [r7, #8]
    3106:	685b      	ldr	r3, [r3, #4]
    3108:	f043 220a 	orr.w	r2, r3, #167774720	; 0xa000a00
    310c:	68bb      	ldr	r3, [r7, #8]
    310e:	605a      	str	r2, [r3, #4]
    3110:	e00b      	b.n	312a <usart_config_port+0x116>
		}else{
			port->CR[1]&=~(15<<((USART3_TX_PIN-8)*4));
    3112:	68bb      	ldr	r3, [r7, #8]
    3114:	685b      	ldr	r3, [r3, #4]
    3116:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    311a:	68bb      	ldr	r3, [r7, #8]
    311c:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART3_TX_PIN-8)*4);
    311e:	68bb      	ldr	r3, [r7, #8]
    3120:	685b      	ldr	r3, [r3, #4]
    3122:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    3126:	68bb      	ldr	r3, [r7, #8]
    3128:	605a      	str	r2, [r3, #4]
		}
		break;
    312a:	bf00      	nop
	}
}
    312c:	3714      	adds	r7, #20
    312e:	46bd      	mov	sp, r7
    3130:	f85d 7b04 	ldr.w	r7, [sp], #4
    3134:	4770      	bx	lr
    3136:	bf00      	nop
    3138:	40004800 	.word	0x40004800
    313c:	40013800 	.word	0x40013800
    3140:	40004400 	.word	0x40004400
    3144:	40021000 	.word	0x40021000

00003148 <usart_set_baud>:

// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
    3148:	b480      	push	{r7}
    314a:	b085      	sub	sp, #20
    314c:	af00      	add	r7, sp, #0
    314e:	6078      	str	r0, [r7, #4]
    3150:	6039      	str	r1, [r7, #0]
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
    3152:	687b      	ldr	r3, [r7, #4]
    3154:	4a14      	ldr	r2, [pc, #80]	; (31a8 <usart_set_baud+0x60>)
    3156:	4293      	cmp	r3, r2
    3158:	d10f      	bne.n	317a <usart_set_baud+0x32>
		rate=(FAPB2/baud/16)<<4;
    315a:	4a14      	ldr	r2, [pc, #80]	; (31ac <usart_set_baud+0x64>)
    315c:	683b      	ldr	r3, [r7, #0]
    315e:	fbb2 f3f3 	udiv	r3, r2, r3
    3162:	011b      	lsls	r3, r3, #4
    3164:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    3166:	4a12      	ldr	r2, [pc, #72]	; (31b0 <usart_set_baud+0x68>)
    3168:	683b      	ldr	r3, [r7, #0]
    316a:	fbb2 f3f3 	udiv	r3, r2, r3
    316e:	f003 030f 	and.w	r3, r3, #15
    3172:	68fa      	ldr	r2, [r7, #12]
    3174:	4313      	orrs	r3, r2
    3176:	60fb      	str	r3, [r7, #12]
    3178:	e00e      	b.n	3198 <usart_set_baud+0x50>
	}else{
		rate=(FAPB1/baud/16)<<4;
    317a:	4a0e      	ldr	r2, [pc, #56]	; (31b4 <usart_set_baud+0x6c>)
    317c:	683b      	ldr	r3, [r7, #0]
    317e:	fbb2 f3f3 	udiv	r3, r2, r3
    3182:	011b      	lsls	r3, r3, #4
    3184:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    3186:	4a0c      	ldr	r2, [pc, #48]	; (31b8 <usart_set_baud+0x70>)
    3188:	683b      	ldr	r3, [r7, #0]
    318a:	fbb2 f3f3 	udiv	r3, r2, r3
    318e:	f003 030f 	and.w	r3, r3, #15
    3192:	68fa      	ldr	r2, [r7, #12]
    3194:	4313      	orrs	r3, r2
    3196:	60fb      	str	r3, [r7, #12]
	}
	channel->BRR=rate;
    3198:	687b      	ldr	r3, [r7, #4]
    319a:	68fa      	ldr	r2, [r7, #12]
    319c:	609a      	str	r2, [r3, #8]
}
    319e:	3714      	adds	r7, #20
    31a0:	46bd      	mov	sp, r7
    31a2:	f85d 7b04 	ldr.w	r7, [sp], #4
    31a6:	4770      	bx	lr
    31a8:	40013800 	.word	0x40013800
    31ac:	003d0900 	.word	0x003d0900
    31b0:	03d09000 	.word	0x03d09000
    31b4:	001e8480 	.word	0x001e8480
    31b8:	01e84800 	.word	0x01e84800

000031bc <usart_comm_dir>:

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
    31bc:	b480      	push	{r7}
    31be:	b083      	sub	sp, #12
    31c0:	af00      	add	r7, sp, #0
    31c2:	6078      	str	r0, [r7, #4]
    31c4:	6039      	str	r1, [r7, #0]
	channel->CR1&=USART_CR1_DIR_MASK;
    31c6:	687b      	ldr	r3, [r7, #4]
    31c8:	68db      	ldr	r3, [r3, #12]
    31ca:	f023 020c 	bic.w	r2, r3, #12
    31ce:	687b      	ldr	r3, [r7, #4]
    31d0:	60da      	str	r2, [r3, #12]
	channel->CR1|=direction<<USART_CR1_DIR_POS;
    31d2:	687b      	ldr	r3, [r7, #4]
    31d4:	68da      	ldr	r2, [r3, #12]
    31d6:	683b      	ldr	r3, [r7, #0]
    31d8:	009b      	lsls	r3, r3, #2
    31da:	431a      	orrs	r2, r3
    31dc:	687b      	ldr	r3, [r7, #4]
    31de:	60da      	str	r2, [r3, #12]
}
    31e0:	370c      	adds	r7, #12
    31e2:	46bd      	mov	sp, r7
    31e4:	f85d 7b04 	ldr.w	r7, [sp], #4
    31e8:	4770      	bx	lr
    31ea:	bf00      	nop

000031ec <usart_open_channel>:


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
    31ec:	b580      	push	{r7, lr}
    31ee:	b084      	sub	sp, #16
    31f0:	af00      	add	r7, sp, #0
    31f2:	60f8      	str	r0, [r7, #12]
    31f4:	60b9      	str	r1, [r7, #8]
    31f6:	607a      	str	r2, [r7, #4]
    31f8:	603b      	str	r3, [r7, #0]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    31fa:	68fb      	ldr	r3, [r7, #12]
    31fc:	4a32      	ldr	r2, [pc, #200]	; (32c8 <usart_open_channel+0xdc>)
    31fe:	4293      	cmp	r3, r2
    3200:	d020      	beq.n	3244 <usart_open_channel+0x58>
    3202:	4a32      	ldr	r2, [pc, #200]	; (32cc <usart_open_channel+0xe0>)
    3204:	4293      	cmp	r3, r2
    3206:	d003      	beq.n	3210 <usart_open_channel+0x24>
    3208:	4a31      	ldr	r2, [pc, #196]	; (32d0 <usart_open_channel+0xe4>)
    320a:	4293      	cmp	r3, r2
    320c:	d00d      	beq.n	322a <usart_open_channel+0x3e>
    320e:	e026      	b.n	325e <usart_open_channel+0x72>
	case (uint32_t)USART1:
		usart_config_port(channel,USART1_PORT,flow_ctrl);
    3210:	68f8      	ldr	r0, [r7, #12]
    3212:	4930      	ldr	r1, [pc, #192]	; (32d4 <usart_open_channel+0xe8>)
    3214:	69ba      	ldr	r2, [r7, #24]
    3216:	f7ff fefd 	bl	3014 <usart_config_port>
		set_int_priority(IRQ_USART1,7);
    321a:	2025      	movs	r0, #37	; 0x25
    321c:	2107      	movs	r1, #7
    321e:	f7ff f95f 	bl	24e0 <set_int_priority>
		enable_interrupt(IRQ_USART1);
    3222:	2025      	movs	r0, #37	; 0x25
    3224:	f7ff f8a0 	bl	2368 <enable_interrupt>
		break;
    3228:	e019      	b.n	325e <usart_open_channel+0x72>
	case (uint32_t)USART2:
		usart_config_port(channel,USART2_PORT,flow_ctrl);
    322a:	68f8      	ldr	r0, [r7, #12]
    322c:	4929      	ldr	r1, [pc, #164]	; (32d4 <usart_open_channel+0xe8>)
    322e:	69ba      	ldr	r2, [r7, #24]
    3230:	f7ff fef0 	bl	3014 <usart_config_port>
		set_int_priority(IRQ_USART2,7);
    3234:	2026      	movs	r0, #38	; 0x26
    3236:	2107      	movs	r1, #7
    3238:	f7ff f952 	bl	24e0 <set_int_priority>
		enable_interrupt(IRQ_USART2);
    323c:	2026      	movs	r0, #38	; 0x26
    323e:	f7ff f893 	bl	2368 <enable_interrupt>
		break;
    3242:	e00c      	b.n	325e <usart_open_channel+0x72>
	case (uint32_t)USART3:
		usart_config_port(channel,USART3_PORT,flow_ctrl);
    3244:	68f8      	ldr	r0, [r7, #12]
    3246:	4924      	ldr	r1, [pc, #144]	; (32d8 <usart_open_channel+0xec>)
    3248:	69ba      	ldr	r2, [r7, #24]
    324a:	f7ff fee3 	bl	3014 <usart_config_port>
		set_int_priority(IRQ_USART3,7);
    324e:	2027      	movs	r0, #39	; 0x27
    3250:	2107      	movs	r1, #7
    3252:	f7ff f945 	bl	24e0 <set_int_priority>
		enable_interrupt(IRQ_USART3);
    3256:	2027      	movs	r0, #39	; 0x27
    3258:	f7ff f886 	bl	2368 <enable_interrupt>
		break;
    325c:	bf00      	nop
	}
	if (flow_ctrl==FLOW_HARD){
    325e:	69bb      	ldr	r3, [r7, #24]
    3260:	2b01      	cmp	r3, #1
    3262:	d103      	bne.n	326c <usart_open_channel+0x80>
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    3264:	68fb      	ldr	r3, [r7, #12]
    3266:	f44f 7240 	mov.w	r2, #768	; 0x300
    326a:	615a      	str	r2, [r3, #20]
	}
	usart_comm_dir(channel,dir);
    326c:	68f8      	ldr	r0, [r7, #12]
    326e:	6839      	ldr	r1, [r7, #0]
    3270:	f7ff ffa4 	bl	31bc <usart_comm_dir>
	switch (parity){
    3274:	687b      	ldr	r3, [r7, #4]
    3276:	2b01      	cmp	r3, #1
    3278:	d00b      	beq.n	3292 <usart_open_channel+0xa6>
    327a:	2b01      	cmp	r3, #1
    327c:	d302      	bcc.n	3284 <usart_open_channel+0x98>
    327e:	2b02      	cmp	r3, #2
    3280:	d00e      	beq.n	32a0 <usart_open_channel+0xb4>
    3282:	e014      	b.n	32ae <usart_open_channel+0xc2>
	case PARITY_NONE:
		channel->CR1|=USART_CR1_RXNEIE;
    3284:	68fb      	ldr	r3, [r7, #12]
    3286:	68db      	ldr	r3, [r3, #12]
    3288:	f043 0220 	orr.w	r2, r3, #32
    328c:	68fb      	ldr	r3, [r7, #12]
    328e:	60da      	str	r2, [r3, #12]
		break;
    3290:	e00d      	b.n	32ae <usart_open_channel+0xc2>
	case PARITY_ODD:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS|USART_CR1_RXNEIE;
    3292:	68fb      	ldr	r3, [r7, #12]
    3294:	68db      	ldr	r3, [r3, #12]
    3296:	f443 62e4 	orr.w	r2, r3, #1824	; 0x720
    329a:	68fb      	ldr	r3, [r7, #12]
    329c:	60da      	str	r2, [r3, #12]
		break;
    329e:	e006      	b.n	32ae <usart_open_channel+0xc2>
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_RXNEIE;
    32a0:	68fb      	ldr	r3, [r7, #12]
    32a2:	68db      	ldr	r3, [r3, #12]
    32a4:	f443 62a4 	orr.w	r2, r3, #1312	; 0x520
    32a8:	68fb      	ldr	r3, [r7, #12]
    32aa:	60da      	str	r2, [r3, #12]
		break;
    32ac:	bf00      	nop
    }
	usart_set_baud(channel,baud);
    32ae:	68f8      	ldr	r0, [r7, #12]
    32b0:	68b9      	ldr	r1, [r7, #8]
    32b2:	f7ff ff49 	bl	3148 <usart_set_baud>
    channel->CR1|=USART_CR1_UE;
    32b6:	68fb      	ldr	r3, [r7, #12]
    32b8:	68db      	ldr	r3, [r3, #12]
    32ba:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
    32be:	68fb      	ldr	r3, [r7, #12]
    32c0:	60da      	str	r2, [r3, #12]
}
    32c2:	3710      	adds	r7, #16
    32c4:	46bd      	mov	sp, r7
    32c6:	bd80      	pop	{r7, pc}
    32c8:	40004800 	.word	0x40004800
    32cc:	40013800 	.word	0x40013800
    32d0:	40004400 	.word	0x40004400
    32d4:	40010800 	.word	0x40010800
    32d8:	40010c00 	.word	0x40010c00

000032dc <usart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
    32dc:	b480      	push	{r7}
    32de:	b083      	sub	sp, #12
    32e0:	af00      	add	r7, sp, #0
    32e2:	6078      	str	r0, [r7, #4]
	return channel->SR&USART_SR_RXNE;
    32e4:	687b      	ldr	r3, [r7, #4]
    32e6:	681b      	ldr	r3, [r3, #0]
    32e8:	f003 0320 	and.w	r3, r3, #32
}
    32ec:	4618      	mov	r0, r3
    32ee:	370c      	adds	r7, #12
    32f0:	46bd      	mov	sp, r7
    32f2:	f85d 7b04 	ldr.w	r7, [sp], #4
    32f6:	4770      	bx	lr

000032f8 <usart_getc>:

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
    32f8:	b480      	push	{r7}
    32fa:	b083      	sub	sp, #12
    32fc:	af00      	add	r7, sp, #0
    32fe:	6078      	str	r0, [r7, #4]
	return channel->DR;
    3300:	687b      	ldr	r3, [r7, #4]
    3302:	685b      	ldr	r3, [r3, #4]
    3304:	b2db      	uxtb	r3, r3
}
    3306:	4618      	mov	r0, r3
    3308:	370c      	adds	r7, #12
    330a:	46bd      	mov	sp, r7
    330c:	f85d 7b04 	ldr.w	r7, [sp], #4
    3310:	4770      	bx	lr
    3312:	bf00      	nop

00003314 <usart_putc>:

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
    3314:	b480      	push	{r7}
    3316:	b083      	sub	sp, #12
    3318:	af00      	add	r7, sp, #0
    331a:	6078      	str	r0, [r7, #4]
    331c:	460b      	mov	r3, r1
    331e:	70fb      	strb	r3, [r7, #3]
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
    3320:	bf00      	nop
    3322:	687b      	ldr	r3, [r7, #4]
    3324:	681b      	ldr	r3, [r3, #0]
    3326:	f003 0380 	and.w	r3, r3, #128	; 0x80
    332a:	2b00      	cmp	r3, #0
    332c:	d0f9      	beq.n	3322 <usart_putc+0xe>
	channel->DR=c;
    332e:	78fa      	ldrb	r2, [r7, #3]
    3330:	687b      	ldr	r3, [r7, #4]
    3332:	605a      	str	r2, [r3, #4]
}
    3334:	370c      	adds	r7, #12
    3336:	46bd      	mov	sp, r7
    3338:	f85d 7b04 	ldr.w	r7, [sp], #4
    333c:	4770      	bx	lr
    333e:	bf00      	nop

00003340 <usart_cts>:


int usart_cts(usart_t* channel){
    3340:	b480      	push	{r7}
    3342:	b085      	sub	sp, #20
    3344:	af00      	add	r7, sp, #0
    3346:	6078      	str	r0, [r7, #4]
	int cts;
	switch ((uint32_t)channel){
    3348:	687b      	ldr	r3, [r7, #4]
    334a:	4a11      	ldr	r2, [pc, #68]	; (3390 <usart_cts+0x50>)
    334c:	4293      	cmp	r3, r2
    334e:	d012      	beq.n	3376 <usart_cts+0x36>
    3350:	4a10      	ldr	r2, [pc, #64]	; (3394 <usart_cts+0x54>)
    3352:	4293      	cmp	r3, r2
    3354:	d003      	beq.n	335e <usart_cts+0x1e>
    3356:	4a10      	ldr	r2, [pc, #64]	; (3398 <usart_cts+0x58>)
    3358:	4293      	cmp	r3, r2
    335a:	d006      	beq.n	336a <usart_cts+0x2a>
    335c:	e011      	b.n	3382 <usart_cts+0x42>
		case (uint32_t)USART1:
			cts=USART1_PORT->IDR&USART1_CTS_BIT;
    335e:	4b0f      	ldr	r3, [pc, #60]	; (339c <usart_cts+0x5c>)
    3360:	689b      	ldr	r3, [r3, #8]
    3362:	f403 6300 	and.w	r3, r3, #2048	; 0x800
    3366:	60fb      	str	r3, [r7, #12]
			break;
    3368:	e00b      	b.n	3382 <usart_cts+0x42>
		case (uint32_t)USART2:
			cts=USART2_PORT->IDR&USART2_CTS_BIT;
    336a:	4b0c      	ldr	r3, [pc, #48]	; (339c <usart_cts+0x5c>)
    336c:	689b      	ldr	r3, [r3, #8]
    336e:	f003 0301 	and.w	r3, r3, #1
    3372:	60fb      	str	r3, [r7, #12]
			break;
    3374:	e005      	b.n	3382 <usart_cts+0x42>
		case (uint32_t)USART3:
			cts=USART3_PORT->IDR&USART3_CTS_BIT;
    3376:	4b0a      	ldr	r3, [pc, #40]	; (33a0 <usart_cts+0x60>)
    3378:	689b      	ldr	r3, [r3, #8]
    337a:	f403 5300 	and.w	r3, r3, #8192	; 0x2000
    337e:	60fb      	str	r3, [r7, #12]
			break;
    3380:	bf00      	nop
	}
	return cts;
    3382:	68fb      	ldr	r3, [r7, #12]
}
    3384:	4618      	mov	r0, r3
    3386:	3714      	adds	r7, #20
    3388:	46bd      	mov	sp, r7
    338a:	f85d 7b04 	ldr.w	r7, [sp], #4
    338e:	4770      	bx	lr
    3390:	40004800 	.word	0x40004800
    3394:	40013800 	.word	0x40013800
    3398:	40004400 	.word	0x40004400
    339c:	40010800 	.word	0x40010800
    33a0:	40010c00 	.word	0x40010c00

000033a4 <vt_init>:

#include "../include/blue_pill.h"
#include "vt100.h"
#include "console.h"

void vt_init(){
    33a4:	b580      	push	{r7, lr}
    33a6:	b082      	sub	sp, #8
    33a8:	af02      	add	r7, sp, #8
	usart_open_channel(VT_USART,115200,PARITY_NONE,USART_DIR_BIDI,FLOW_HARD);
    33aa:	2301      	movs	r3, #1
    33ac:	9300      	str	r3, [sp, #0]
    33ae:	4804      	ldr	r0, [pc, #16]	; (33c0 <vt_init+0x1c>)
    33b0:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
    33b4:	2200      	movs	r2, #0
    33b6:	2303      	movs	r3, #3
    33b8:	f7ff ff18 	bl	31ec <usart_open_channel>
}
    33bc:	46bd      	mov	sp, r7
    33be:	bd80      	pop	{r7, pc}
    33c0:	40004400 	.word	0x40004400

000033c4 <vt_putc>:

void vt_putc(char c){
    33c4:	b580      	push	{r7, lr}
    33c6:	b082      	sub	sp, #8
    33c8:	af00      	add	r7, sp, #0
    33ca:	4603      	mov	r3, r0
    33cc:	71fb      	strb	r3, [r7, #7]
	usart_putc(VT_USART,c);
    33ce:	79fb      	ldrb	r3, [r7, #7]
    33d0:	4803      	ldr	r0, [pc, #12]	; (33e0 <vt_putc+0x1c>)
    33d2:	4619      	mov	r1, r3
    33d4:	f7ff ff9e 	bl	3314 <usart_putc>
}
    33d8:	3708      	adds	r7, #8
    33da:	46bd      	mov	sp, r7
    33dc:	bd80      	pop	{r7, pc}
    33de:	bf00      	nop
    33e0:	40004400 	.word	0x40004400

000033e4 <vt_del_back>:

void vt_del_back(){
    33e4:	b580      	push	{r7, lr}
    33e6:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,BS);
    33e8:	4806      	ldr	r0, [pc, #24]	; (3404 <vt_del_back+0x20>)
    33ea:	2108      	movs	r1, #8
    33ec:	f7ff ff92 	bl	3314 <usart_putc>
	usart_putc(VT_USART,SPACE);
    33f0:	4804      	ldr	r0, [pc, #16]	; (3404 <vt_del_back+0x20>)
    33f2:	2120      	movs	r1, #32
    33f4:	f7ff ff8e 	bl	3314 <usart_putc>
	usart_putc(VT_USART,BS);
    33f8:	4802      	ldr	r0, [pc, #8]	; (3404 <vt_del_back+0x20>)
    33fa:	2108      	movs	r1, #8
    33fc:	f7ff ff8a 	bl	3314 <usart_putc>
}
    3400:	bd80      	pop	{r7, pc}
    3402:	bf00      	nop
    3404:	40004400 	.word	0x40004400

00003408 <vt_esc_seq>:

static void vt_esc_seq(){
    3408:	b580      	push	{r7, lr}
    340a:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,ESC);
    340c:	4804      	ldr	r0, [pc, #16]	; (3420 <vt_esc_seq+0x18>)
    340e:	211b      	movs	r1, #27
    3410:	f7ff ff80 	bl	3314 <usart_putc>
	usart_putc(VT_USART,'[');
    3414:	4802      	ldr	r0, [pc, #8]	; (3420 <vt_esc_seq+0x18>)
    3416:	215b      	movs	r1, #91	; 0x5b
    3418:	f7ff ff7c 	bl	3314 <usart_putc>
}
    341c:	bd80      	pop	{r7, pc}
    341e:	bf00      	nop
    3420:	40004400 	.word	0x40004400

00003424 <vt_cls>:


// vide l'écran de la console
void vt_cls(){
    3424:	b580      	push	{r7, lr}
    3426:	af00      	add	r7, sp, #0
	vt_esc_seq();
    3428:	f7ff ffee 	bl	3408 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    342c:	4804      	ldr	r0, [pc, #16]	; (3440 <vt_cls+0x1c>)
    342e:	2132      	movs	r1, #50	; 0x32
    3430:	f7ff ff70 	bl	3314 <usart_putc>
	usart_putc(VT_USART,'J');
    3434:	4802      	ldr	r0, [pc, #8]	; (3440 <vt_cls+0x1c>)
    3436:	214a      	movs	r1, #74	; 0x4a
    3438:	f7ff ff6c 	bl	3314 <usart_putc>
}
    343c:	bd80      	pop	{r7, pc}
    343e:	bf00      	nop
    3440:	40004400 	.word	0x40004400

00003444 <vt_clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void vt_clear_line(unsigned n){
    3444:	b580      	push	{r7, lr}
    3446:	b082      	sub	sp, #8
    3448:	af00      	add	r7, sp, #0
    344a:	6078      	str	r0, [r7, #4]
	vt_esc_seq();
    344c:	f7ff ffdc 	bl	3408 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    3450:	480a      	ldr	r0, [pc, #40]	; (347c <vt_clear_line+0x38>)
    3452:	2132      	movs	r1, #50	; 0x32
    3454:	f7ff ff5e 	bl	3314 <usart_putc>
	usart_putc(VT_USART,'K');
    3458:	4808      	ldr	r0, [pc, #32]	; (347c <vt_clear_line+0x38>)
    345a:	214b      	movs	r1, #75	; 0x4b
    345c:	f7ff ff5a 	bl	3314 <usart_putc>
	while (n){usart_putc(VT_USART,BS);n--;}
    3460:	e006      	b.n	3470 <vt_clear_line+0x2c>
    3462:	4806      	ldr	r0, [pc, #24]	; (347c <vt_clear_line+0x38>)
    3464:	2108      	movs	r1, #8
    3466:	f7ff ff55 	bl	3314 <usart_putc>
    346a:	687b      	ldr	r3, [r7, #4]
    346c:	3b01      	subs	r3, #1
    346e:	607b      	str	r3, [r7, #4]
    3470:	687b      	ldr	r3, [r7, #4]
    3472:	2b00      	cmp	r3, #0
    3474:	d1f5      	bne.n	3462 <vt_clear_line+0x1e>
}
    3476:	3708      	adds	r7, #8
    3478:	46bd      	mov	sp, r7
    347a:	bd80      	pop	{r7, pc}
    347c:	40004400 	.word	0x40004400

00003480 <vt_ready>:

// vérifie si le terminal est prêt
int vt_ready(){
    3480:	b480      	push	{r7}
    3482:	af00      	add	r7, sp, #0
	return !(VT_PORT->IDR&VT_CTS_BIT);
    3484:	4b06      	ldr	r3, [pc, #24]	; (34a0 <vt_ready+0x20>)
    3486:	689b      	ldr	r3, [r3, #8]
    3488:	f003 0301 	and.w	r3, r3, #1
    348c:	2b00      	cmp	r3, #0
    348e:	bf0c      	ite	eq
    3490:	2301      	moveq	r3, #1
    3492:	2300      	movne	r3, #0
    3494:	b2db      	uxtb	r3, r3
}
    3496:	4618      	mov	r0, r3
    3498:	46bd      	mov	sp, r7
    349a:	f85d 7b04 	ldr.w	r7, [sp], #4
    349e:	4770      	bx	lr
    34a0:	40010800 	.word	0x40010800

000034a4 <USART2_handler>:

// interruption serial console
void VT_handler(){
    34a4:	b580      	push	{r7, lr}
    34a6:	af00      	add	r7, sp, #0
	if ((con.dev==SERIAL) && (VT_USART->SR&USART_SR_RXNE)){
    34a8:	4b08      	ldr	r3, [pc, #32]	; (34cc <USART2_handler+0x28>)
    34aa:	781b      	ldrb	r3, [r3, #0]
    34ac:	2b01      	cmp	r3, #1
    34ae:	d10c      	bne.n	34ca <USART2_handler+0x26>
    34b0:	4b07      	ldr	r3, [pc, #28]	; (34d0 <USART2_handler+0x2c>)
    34b2:	681b      	ldr	r3, [r3, #0]
    34b4:	f003 0320 	and.w	r3, r3, #32
    34b8:	2b00      	cmp	r3, #0
    34ba:	d006      	beq.n	34ca <USART2_handler+0x26>
		con.insert(VT_USART->DR);
    34bc:	4b03      	ldr	r3, [pc, #12]	; (34cc <USART2_handler+0x28>)
    34be:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    34c0:	4a03      	ldr	r2, [pc, #12]	; (34d0 <USART2_handler+0x2c>)
    34c2:	6852      	ldr	r2, [r2, #4]
    34c4:	b2d2      	uxtb	r2, r2
    34c6:	4610      	mov	r0, r2
    34c8:	4798      	blx	r3
	}
}
    34ca:	bd80      	pop	{r7, pc}
    34cc:	200000f4 	.word	0x200000f4
    34d0:	40004400 	.word	0x40004400

Disassembly of section .user_code:

00003c00 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    3c00:	b480      	push	{r7}
    3c02:	b085      	sub	sp, #20
    3c04:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    3c06:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    3c0a:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    3c0c:	2300      	movs	r3, #0
    3c0e:	71fb      	strb	r3, [r7, #7]
	
	_svc_call(SVC_PRINT,"blinking led, any key to stop.\n",0);
    3c10:	4b1e      	ldr	r3, [pc, #120]	; (3c8c <blink+0x8c>)
    3c12:	2200      	movs	r2, #0
    3c14:	4618      	mov	r0, r3
    3c16:	4611      	mov	r1, r2
    3c18:	df08      	svc	8
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    3c1a:	2300      	movs	r3, #0
    3c1c:	2200      	movs	r2, #0
    3c1e:	4618      	mov	r0, r3
    3c20:	4611      	mov	r1, r2
    3c22:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    3c24:	f107 030c 	add.w	r3, r7, #12
    3c28:	2200      	movs	r2, #0
    3c2a:	4618      	mov	r0, r3
    3c2c:	4611      	mov	r1, r2
    3c2e:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    3c30:	f107 0308 	add.w	r3, r7, #8
    3c34:	2200      	movs	r2, #0
    3c36:	4618      	mov	r0, r3
    3c38:	4611      	mov	r1, r2
    3c3a:	df04      	svc	4
    3c3c:	68bb      	ldr	r3, [r7, #8]
    3c3e:	2b00      	cmp	r3, #0
    3c40:	d1f6      	bne.n	3c30 <blink+0x30>
		_svc_call(SVC_LED_ON,NUL,NUL);
    3c42:	2300      	movs	r3, #0
    3c44:	2200      	movs	r2, #0
    3c46:	4618      	mov	r0, r3
    3c48:	4611      	mov	r1, r2
    3c4a:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    3c4c:	f107 030c 	add.w	r3, r7, #12
    3c50:	2200      	movs	r2, #0
    3c52:	4618      	mov	r0, r3
    3c54:	4611      	mov	r1, r2
    3c56:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    3c58:	f107 0308 	add.w	r3, r7, #8
    3c5c:	2200      	movs	r2, #0
    3c5e:	4618      	mov	r0, r3
    3c60:	4611      	mov	r1, r2
    3c62:	df04      	svc	4
    3c64:	68bb      	ldr	r3, [r7, #8]
    3c66:	2b00      	cmp	r3, #0
    3c68:	d1f6      	bne.n	3c58 <blink+0x58>
		_svc_call(SVC_CONIN,&c,NUL);
    3c6a:	1dfb      	adds	r3, r7, #7
    3c6c:	2200      	movs	r2, #0
    3c6e:	4618      	mov	r0, r3
    3c70:	4611      	mov	r1, r2
    3c72:	df05      	svc	5
		if (c) break;
    3c74:	79fb      	ldrb	r3, [r7, #7]
    3c76:	b2db      	uxtb	r3, r3
    3c78:	2b00      	cmp	r3, #0
    3c7a:	d000      	beq.n	3c7e <blink+0x7e>
    3c7c:	e000      	b.n	3c80 <blink+0x80>
	}
    3c7e:	e7cc      	b.n	3c1a <blink+0x1a>
}
    3c80:	3714      	adds	r7, #20
    3c82:	46bd      	mov	sp, r7
    3c84:	f85d 7b04 	ldr.w	r7, [sp], #4
    3c88:	4770      	bx	lr
    3c8a:	bf00      	nop
    3c8c:	0000366c 	.word	0x0000366c
