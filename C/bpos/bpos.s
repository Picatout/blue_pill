
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 e9 2f 00 00     i...m...q..../..
      20:	e9 2f 00 00 e9 2f 00 00 e9 2f 00 00 5d 05 00 00     ./.../.../..]...
      30:	e9 2f 00 00 e9 2f 00 00 79 02 00 00 c1 30 00 00     ./.../..y....0..
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 e9 2f 00 00 e9 2f 00 00 fd 33 00 00     ...../.../...3..
      80:	e9 2f 00 00 e9 2f 00 00 e9 2f 00 00 e9 2f 00 00     ./.../.../.../..
      90:	e9 2f 00 00 e9 2f 00 00 e9 2f 00 00 b5 24 00 00     ./.../.../...$..
      a0:	e9 2f 00 00 e9 2f 00 00 e9 2f 00 00 89 32 00 00     ./.../.../...2..
      b0:	1d 26 00 00 c5 02 00 00 b5 1a 00 00 e9 2f 00 00     .&.........../..
      c0:	e9 2f 00 00 e9 2f 00 00 e9 2f 00 00 e9 2f 00 00     ./.../.../.../..
      d0:	e9 2f 00 00 cd 02 00 00 c1 38 00 00 d5 02 00 00     ./.......8......
      e0:	e9 2f 00 00 e9 2f 00 00 e9 2f 00 00 e9 2f 00 00     ./.../.../.../..
      f0:	e9 2f 00 00 e9 2f 00 00 e9 2f 00 00 e9 2f 00 00     ./.../.../.../..
     100:	e9 2f 00 00 e9 2f 00 00 e9 2f 00 00 e9 2f 00 00     ./.../.../.../..
     110:	e9 2f 00 00 e9 2f 00 00 e9 2f 00 00 e9 2f 00 00     ./.../.../.../..
     120:	e9 2f 00 00 e9 2f 00 00 e9 2f 00 00 e9 2f 00 00     ./.../.../.../..

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
     1b0:	f000 fef2 	bl	f98 <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	2000000c 	.word	0x2000000c
     1c0:	200026cc 	.word	0x200026cc
     1c4:	00004490 	.word	0x00004490
     1c8:	20000000 	.word	0x20000000
     1cc:	2000000c 	.word	0x2000000c
     1d0:	20002700 	.word	0x20002700
     1d4:	200000fc 	.word	0x200000fc
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
     208:	f002 fef6 	bl	2ff8 <print_fault>
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
     21e:	f002 feeb 	bl	2ff8 <print_fault>
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
     234:	f002 fee0 	bl	2ff8 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f002 fedb 	bl	2ff8 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	00004038 	.word	0x00004038
     258:	00004050 	.word	0x00004050
     25c:	0000405c 	.word	0x0000405c
     260:	0000406c 	.word	0x0000406c

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f002 fec0 	bl	2fe8 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f002 febe 	bl	2fe8 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f002 febc 	bl	2fe8 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f002 feba 	bl	2fe8 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f002 feb8 	bl	2fe8 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f002 feb6 	bl	2fe8 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f002 feb4 	bl	2fe8 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f002 feb2 	bl	2fe8 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f002 feb0 	bl	2fe8 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f002 feae 	bl	2fe8 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f002 feac 	bl	2fe8 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f002 feaa 	bl	2fe8 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f002 fea8 	bl	2fe8 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f002 fea6 	bl	2fe8 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f002 fea4 	bl	2fe8 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f002 fea2 	bl	2fe8 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f002 fea0 	bl	2fe8 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f002 fe9e 	bl	2fe8 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f002 fe9c 	bl	2fe8 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f002 fe9a 	bl	2fe8 <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f002 fe98 	bl	2fe8 <reset_mcu>
_default_handler(EXTI9_5_handler) // 23
     2b8:	f002 fe96 	bl	2fe8 <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2bc:	f002 fe94 	bl	2fe8 <reset_mcu>
_default_handler(TIM2_handler) // 28
     2c0:	f002 fe92 	bl	2fe8 <reset_mcu>

000002c4 <TIM3_handler>:
_default_handler(TIM3_handler) // 29
     2c4:	f002 fe90 	bl	2fe8 <reset_mcu>
_default_handler(TIM4_handler) // 30
     2c8:	f002 fe8e 	bl	2fe8 <reset_mcu>

000002cc <USART1_handler>:
_default_handler(USART1_handler) // 37
     2cc:	f002 fe8c 	bl	2fe8 <reset_mcu>
_default_handler(USART2_handler) // 38
     2d0:	f002 fe8a 	bl	2fe8 <reset_mcu>

000002d4 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2d4:	f002 fe88 	bl	2fe8 <reset_mcu>

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
     5e6:	f001 fd7b 	bl	20e0 <write_pin>
		//led_on();
		break;
     5ea:	e092      	b.n	712 <SVC_handler+0x1b6>
	case SVC_LED_OFF:
		write_pin(LED_PORT,LED_PIN,LED_OFF);
     5ec:	484c      	ldr	r0, [pc, #304]	; (720 <SVC_handler+0x1c4>)
     5ee:	210d      	movs	r1, #13
     5f0:	2201      	movs	r2, #1
     5f2:	f001 fd75 	bl	20e0 <write_pin>
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
     60c:	f001 f886 	bl	171c <conin>
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
     620:	f001 f828 	bl	1674 <conout>
		break;
     624:	e075      	b.n	712 <SVC_handler+0x1b6>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     626:	68bb      	ldr	r3, [r7, #8]
     628:	681b      	ldr	r3, [r3, #0]
     62a:	6878      	ldr	r0, [r7, #4]
     62c:	4619      	mov	r1, r3
     62e:	f001 f8a1 	bl	1774 <read_line>
     632:	4602      	mov	r2, r0
     634:	68bb      	ldr	r3, [r7, #8]
     636:	601a      	str	r2, [r3, #0]
		break;
     638:	e06b      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT:
		print((const char*)arg1);
     63a:	68b8      	ldr	r0, [r7, #8]
     63c:	f001 f878 	bl	1730 <print>
		break;
     640:	e067      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT_DEC:
		print_int(*(int32_t*)arg1,10);
     642:	68bb      	ldr	r3, [r7, #8]
     644:	681b      	ldr	r3, [r3, #0]
     646:	4618      	mov	r0, r3
     648:	210a      	movs	r1, #10
     64a:	f001 f95b 	bl	1904 <print_int>
		break;
     64e:	e060      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     650:	68bb      	ldr	r3, [r7, #8]
     652:	681b      	ldr	r3, [r3, #0]
     654:	4618      	mov	r0, r3
     656:	f001 f9c3 	bl	19e0 <print_hex>
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
     6de:	f001 fa59 	bl	1b94 <flash_write>
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
     6f0:	f001 fa94 	bl	1c1c <flash_erase_page>
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
     706:	f001 f9cd 	bl	1aa4 <cls>
		break;
     70a:	e002      	b.n	712 <SVC_handler+0x1b6>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     70c:	f002 fc6c 	bl	2fe8 <reset_mcu>
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
     724:	200000f0 	.word	0x200000f0
     728:	200000ec 	.word	0x200000ec

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
     7ea:	f000 fb3b 	bl	e64 <word>
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
     88a:	f000 faeb 	bl	e64 <word>
	cmd_id=search_command((const char*)pad);
     88e:	480a      	ldr	r0, [pc, #40]	; (8b8 <cmd_putc+0x34>)
     890:	f000 f9d2 	bl	c38 <search_command>
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
     8bc:	000039d8 	.word	0x000039d8

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
     8d6:	f000 ff2b 	bl	1730 <print>
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
     8e8:	f000 fabc 	bl	e64 <word>
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
     902:	f000 faaf 	bl	e64 <word>
	cmd_id=search_command((const char*)pad);
     906:	480e      	ldr	r0, [pc, #56]	; (940 <cmd_print_dec+0x44>)
     908:	f000 f996 	bl	c38 <search_command>
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
     944:	000039d8 	.word	0x000039d8

00000948 <cmd_print_hex>:

static void cmd_print_hex(){
     948:	b580      	push	{r7, lr}
     94a:	b082      	sub	sp, #8
     94c:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     94e:	f000 fa89 	bl	e64 <word>
	cmd_id=search_command((const char*)pad);
     952:	480e      	ldr	r0, [pc, #56]	; (98c <cmd_print_hex+0x44>)
     954:	f000 f970 	bl	c38 <search_command>
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
     990:	000039d8 	.word	0x000039d8

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
     9a0:	200000fc 	.word	0x200000fc

000009a4 <cmd_peek8>:

static void cmd_peek8(){
     9a4:	b580      	push	{r7, lr}
     9a6:	b082      	sub	sp, #8
     9a8:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9aa:	f000 fa5b 	bl	e64 <word>
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
     9da:	f000 fa43 	bl	e64 <word>
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
     a0a:	f000 fa2b 	bl	e64 <word>
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
     a3a:	f000 fa13 	bl	e64 <word>
	adr=atoi((const char*)pad);
     a3e:	480a      	ldr	r0, [pc, #40]	; (a68 <cmd_poke8+0x34>)
     a40:	f7ff fcc8 	bl	3d4 <atoi>
     a44:	4603      	mov	r3, r0
     a46:	607b      	str	r3, [r7, #4]
	word();
     a48:	f000 fa0c 	bl	e64 <word>
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
     a72:	f000 f9f7 	bl	e64 <word>
	adr=atoi((const char*)pad);
     a76:	480a      	ldr	r0, [pc, #40]	; (aa0 <cmd_poke16+0x34>)
     a78:	f7ff fcac 	bl	3d4 <atoi>
     a7c:	4603      	mov	r3, r0
     a7e:	607b      	str	r3, [r7, #4]
	word();
     a80:	f000 f9f0 	bl	e64 <word>
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
     aaa:	f000 f9db 	bl	e64 <word>
	adr=atoi((const char*)pad);
     aae:	480a      	ldr	r0, [pc, #40]	; (ad8 <cmd_poke32+0x34>)
     ab0:	f7ff fc90 	bl	3d4 <atoi>
     ab4:	4603      	mov	r3, r0
     ab6:	607b      	str	r3, [r7, #4]
	word();
     ab8:	f000 f9d4 	bl	e64 <word>
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
     ae2:	f000 f9bf 	bl	e64 <word>
	adr=atoi((const char*)pad);
     ae6:	480d      	ldr	r0, [pc, #52]	; (b1c <cmd_fwrite+0x40>)
     ae8:	f7ff fc74 	bl	3d4 <atoi>
     aec:	4603      	mov	r3, r0
     aee:	607b      	str	r3, [r7, #4]
	word();
     af0:	f000 f9b8 	bl	e64 <word>
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
     b10:	f000 fe0e 	bl	1730 <print>
}
     b14:	3708      	adds	r7, #8
     b16:	46bd      	mov	sp, r7
     b18:	bd80      	pop	{r7, pc}
     b1a:	bf00      	nop
     b1c:	2000005c 	.word	0x2000005c
     b20:	00003904 	.word	0x00003904

00000b24 <cmd_pgerase>:

static void cmd_pgerase(){
     b24:	b580      	push	{r7, lr}
     b26:	b082      	sub	sp, #8
     b28:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     b2a:	f000 f99b 	bl	e64 <word>
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
     b4a:	f000 fdf1 	bl	1730 <print>
}
     b4e:	3708      	adds	r7, #8
     b50:	46bd      	mov	sp, r7
     b52:	bd80      	pop	{r7, pc}
     b54:	2000005c 	.word	0x2000005c
     b58:	00003904 	.word	0x00003904

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
     b7e:	f000 f971 	bl	e64 <word>
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
     b9e:	f000 fce9 	bl	1574 <con_select>
}
     ba2:	3708      	adds	r7, #8
     ba4:	46bd      	mov	sp, r7
     ba6:	bd80      	pop	{r7, pc}
     ba8:	00003910 	.word	0x00003910
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
     bd4:	f000 fdac 	bl	1730 <print>
	str=commands[i].name;
     bd8:	4a15      	ldr	r2, [pc, #84]	; (c30 <cmd_help+0x68>)
     bda:	683b      	ldr	r3, [r7, #0]
     bdc:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     be0:	607b      	str	r3, [r7, #4]
	while (str){
     be2:	e01d      	b.n	c20 <cmd_help+0x58>
		print(str);
     be4:	6878      	ldr	r0, [r7, #4]
     be6:	f000 fda3 	bl	1730 <print>
		conout('\t');
     bea:	2009      	movs	r0, #9
     bec:	f000 fd42 	bl	1674 <conout>
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
     c12:	f000 fd2f 	bl	1674 <conout>
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
     c2c:	00003918 	.word	0x00003918
     c30:	000039d8 	.word	0x000039d8
     c34:	2aaaaaab 	.word	0x2aaaaaab

00000c38 <search_command>:
	{"timer",cmd_set_timer},
	{NUL,NUL}
};


int search_command(const char * name){
     c38:	b580      	push	{r7, lr}
     c3a:	b084      	sub	sp, #16
     c3c:	af00      	add	r7, sp, #0
     c3e:	6078      	str	r0, [r7, #4]
	int i=0;
     c40:	2300      	movs	r3, #0
     c42:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     c44:	e00e      	b.n	c64 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     c46:	4a12      	ldr	r2, [pc, #72]	; (c90 <search_command+0x58>)
     c48:	68fb      	ldr	r3, [r7, #12]
     c4a:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     c4e:	4618      	mov	r0, r3
     c50:	6879      	ldr	r1, [r7, #4]
     c52:	f7ff fb41 	bl	2d8 <strcmp>
     c56:	4603      	mov	r3, r0
     c58:	2b00      	cmp	r3, #0
     c5a:	d100      	bne.n	c5e <search_command+0x26>
			break;
     c5c:	e009      	b.n	c72 <search_command+0x3a>
		}
		i++;
     c5e:	68fb      	ldr	r3, [r7, #12]
     c60:	3301      	adds	r3, #1
     c62:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     c64:	4a0a      	ldr	r2, [pc, #40]	; (c90 <search_command+0x58>)
     c66:	68fb      	ldr	r3, [r7, #12]
     c68:	00db      	lsls	r3, r3, #3
     c6a:	4413      	add	r3, r2
     c6c:	685b      	ldr	r3, [r3, #4]
     c6e:	2b00      	cmp	r3, #0
     c70:	d1e9      	bne.n	c46 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     c72:	4a07      	ldr	r2, [pc, #28]	; (c90 <search_command+0x58>)
     c74:	68fb      	ldr	r3, [r7, #12]
     c76:	00db      	lsls	r3, r3, #3
     c78:	4413      	add	r3, r2
     c7a:	685b      	ldr	r3, [r3, #4]
     c7c:	2b00      	cmp	r3, #0
     c7e:	d102      	bne.n	c86 <search_command+0x4e>
     c80:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     c84:	60fb      	str	r3, [r7, #12]
	return i;
     c86:	68fb      	ldr	r3, [r7, #12]
}
     c88:	4618      	mov	r0, r3
     c8a:	3710      	adds	r7, #16
     c8c:	46bd      	mov	sp, r7
     c8e:	bd80      	pop	{r7, pc}
     c90:	000039d8 	.word	0x000039d8

00000c94 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     c94:	b480      	push	{r7}
     c96:	b085      	sub	sp, #20
     c98:	af00      	add	r7, sp, #0
     c9a:	60f8      	str	r0, [r7, #12]
     c9c:	60b9      	str	r1, [r7, #8]
     c9e:	4613      	mov	r3, r2
     ca0:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     ca2:	e002      	b.n	caa <skip+0x16>
     ca4:	68bb      	ldr	r3, [r7, #8]
     ca6:	3301      	adds	r3, #1
     ca8:	60bb      	str	r3, [r7, #8]
     caa:	68bb      	ldr	r3, [r7, #8]
     cac:	68fa      	ldr	r2, [r7, #12]
     cae:	4413      	add	r3, r2
     cb0:	781b      	ldrb	r3, [r3, #0]
     cb2:	2b00      	cmp	r3, #0
     cb4:	d006      	beq.n	cc4 <skip+0x30>
     cb6:	68bb      	ldr	r3, [r7, #8]
     cb8:	68fa      	ldr	r2, [r7, #12]
     cba:	4413      	add	r3, r2
     cbc:	781b      	ldrb	r3, [r3, #0]
     cbe:	79fa      	ldrb	r2, [r7, #7]
     cc0:	429a      	cmp	r2, r3
     cc2:	d0ef      	beq.n	ca4 <skip+0x10>
	return start;
     cc4:	68bb      	ldr	r3, [r7, #8]
}
     cc6:	4618      	mov	r0, r3
     cc8:	3714      	adds	r7, #20
     cca:	46bd      	mov	sp, r7
     ccc:	f85d 7b04 	ldr.w	r7, [sp], #4
     cd0:	4770      	bx	lr
     cd2:	bf00      	nop

00000cd4 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     cd4:	b480      	push	{r7}
     cd6:	b085      	sub	sp, #20
     cd8:	af00      	add	r7, sp, #0
     cda:	60f8      	str	r0, [r7, #12]
     cdc:	60b9      	str	r1, [r7, #8]
     cde:	4613      	mov	r3, r2
     ce0:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     ce2:	e002      	b.n	cea <scan+0x16>
     ce4:	68bb      	ldr	r3, [r7, #8]
     ce6:	3301      	adds	r3, #1
     ce8:	60bb      	str	r3, [r7, #8]
     cea:	68bb      	ldr	r3, [r7, #8]
     cec:	68fa      	ldr	r2, [r7, #12]
     cee:	4413      	add	r3, r2
     cf0:	781b      	ldrb	r3, [r3, #0]
     cf2:	2b00      	cmp	r3, #0
     cf4:	d006      	beq.n	d04 <scan+0x30>
     cf6:	68bb      	ldr	r3, [r7, #8]
     cf8:	68fa      	ldr	r2, [r7, #12]
     cfa:	4413      	add	r3, r2
     cfc:	781b      	ldrb	r3, [r3, #0]
     cfe:	79fa      	ldrb	r2, [r7, #7]
     d00:	429a      	cmp	r2, r3
     d02:	d1ef      	bne.n	ce4 <scan+0x10>
	return start;
     d04:	68bb      	ldr	r3, [r7, #8]
}
     d06:	4618      	mov	r0, r3
     d08:	3714      	adds	r7, #20
     d0a:	46bd      	mov	sp, r7
     d0c:	f85d 7b04 	ldr.w	r7, [sp], #4
     d10:	4770      	bx	lr
     d12:	bf00      	nop

00000d14 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     d14:	b480      	push	{r7}
     d16:	b087      	sub	sp, #28
     d18:	af00      	add	r7, sp, #0
     d1a:	6078      	str	r0, [r7, #4]
     d1c:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     d1e:	2300      	movs	r3, #0
     d20:	617b      	str	r3, [r7, #20]
     d22:	683b      	ldr	r3, [r7, #0]
     d24:	613b      	str	r3, [r7, #16]
     d26:	2300      	movs	r3, #0
     d28:	60fb      	str	r3, [r7, #12]
     d2a:	2301      	movs	r3, #1
     d2c:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     d2e:	e040      	b.n	db2 <quote+0x9e>
		switch (buffer[end]){
     d30:	693b      	ldr	r3, [r7, #16]
     d32:	687a      	ldr	r2, [r7, #4]
     d34:	4413      	add	r3, r2
     d36:	781b      	ldrb	r3, [r3, #0]
     d38:	2b5c      	cmp	r3, #92	; 0x5c
     d3a:	d012      	beq.n	d62 <quote+0x4e>
     d3c:	2b6e      	cmp	r3, #110	; 0x6e
     d3e:	d022      	beq.n	d86 <quote+0x72>
     d40:	2b22      	cmp	r3, #34	; 0x22
     d42:	d128      	bne.n	d96 <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     d44:	697b      	ldr	r3, [r7, #20]
     d46:	2b00      	cmp	r3, #0
     d48:	d102      	bne.n	d50 <quote+0x3c>
     d4a:	2300      	movs	r3, #0
     d4c:	60bb      	str	r3, [r7, #8]
			break;
     d4e:	e02d      	b.n	dac <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     d50:	68fb      	ldr	r3, [r7, #12]
     d52:	1c5a      	adds	r2, r3, #1
     d54:	60fa      	str	r2, [r7, #12]
     d56:	4a21      	ldr	r2, [pc, #132]	; (ddc <quote+0xc8>)
     d58:	2122      	movs	r1, #34	; 0x22
     d5a:	54d1      	strb	r1, [r2, r3]
     d5c:	2300      	movs	r3, #0
     d5e:	617b      	str	r3, [r7, #20]
			break;
     d60:	e024      	b.n	dac <quote+0x98>
		case '\\':
			if (!escaped){
     d62:	697b      	ldr	r3, [r7, #20]
     d64:	2b00      	cmp	r3, #0
     d66:	d102      	bne.n	d6e <quote+0x5a>
				escaped=1;
     d68:	2301      	movs	r3, #1
     d6a:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     d6c:	e01e      	b.n	dac <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
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
     d80:	4a16      	ldr	r2, [pc, #88]	; (ddc <quote+0xc8>)
     d82:	54d1      	strb	r1, [r2, r3]
			}
			break;
     d84:	e012      	b.n	dac <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     d86:	697b      	ldr	r3, [r7, #20]
     d88:	2b00      	cmp	r3, #0
     d8a:	d004      	beq.n	d96 <quote+0x82>
     d8c:	693b      	ldr	r3, [r7, #16]
     d8e:	687a      	ldr	r2, [r7, #4]
     d90:	4413      	add	r3, r2
     d92:	220d      	movs	r2, #13
     d94:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     d96:	2300      	movs	r3, #0
     d98:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     d9a:	68fb      	ldr	r3, [r7, #12]
     d9c:	1c5a      	adds	r2, r3, #1
     d9e:	60fa      	str	r2, [r7, #12]
     da0:	693a      	ldr	r2, [r7, #16]
     da2:	6879      	ldr	r1, [r7, #4]
     da4:	440a      	add	r2, r1
     da6:	7811      	ldrb	r1, [r2, #0]
     da8:	4a0c      	ldr	r2, [pc, #48]	; (ddc <quote+0xc8>)
     daa:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     dac:	693b      	ldr	r3, [r7, #16]
     dae:	3301      	adds	r3, #1
     db0:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     db2:	693b      	ldr	r3, [r7, #16]
     db4:	687a      	ldr	r2, [r7, #4]
     db6:	4413      	add	r3, r2
     db8:	781b      	ldrb	r3, [r3, #0]
     dba:	2b00      	cmp	r3, #0
     dbc:	d002      	beq.n	dc4 <quote+0xb0>
     dbe:	68bb      	ldr	r3, [r7, #8]
     dc0:	2b00      	cmp	r3, #0
     dc2:	d1b5      	bne.n	d30 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     dc4:	4a05      	ldr	r2, [pc, #20]	; (ddc <quote+0xc8>)
     dc6:	68fb      	ldr	r3, [r7, #12]
     dc8:	4413      	add	r3, r2
     dca:	2200      	movs	r2, #0
     dcc:	701a      	strb	r2, [r3, #0]
	return end;
     dce:	693b      	ldr	r3, [r7, #16]
}
     dd0:	4618      	mov	r0, r3
     dd2:	371c      	adds	r7, #28
     dd4:	46bd      	mov	sp, r7
     dd6:	f85d 7b04 	ldr.w	r7, [sp], #4
     dda:	4770      	bx	lr
     ddc:	2000005c 	.word	0x2000005c

00000de0 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     de0:	b480      	push	{r7}
     de2:	b087      	sub	sp, #28
     de4:	af00      	add	r7, sp, #0
     de6:	60f8      	str	r0, [r7, #12]
     de8:	60b9      	str	r1, [r7, #8]
     dea:	4613      	mov	r3, r2
     dec:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     dee:	68bb      	ldr	r3, [r7, #8]
     df0:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     df2:	e002      	b.n	dfa <next+0x1a>
     df4:	697b      	ldr	r3, [r7, #20]
     df6:	3301      	adds	r3, #1
     df8:	617b      	str	r3, [r7, #20]
     dfa:	697b      	ldr	r3, [r7, #20]
     dfc:	68fa      	ldr	r2, [r7, #12]
     dfe:	4413      	add	r3, r2
     e00:	781b      	ldrb	r3, [r3, #0]
     e02:	2b00      	cmp	r3, #0
     e04:	d006      	beq.n	e14 <next+0x34>
     e06:	697b      	ldr	r3, [r7, #20]
     e08:	68fa      	ldr	r2, [r7, #12]
     e0a:	4413      	add	r3, r2
     e0c:	781b      	ldrb	r3, [r3, #0]
     e0e:	79fa      	ldrb	r2, [r7, #7]
     e10:	429a      	cmp	r2, r3
     e12:	d1ef      	bne.n	df4 <next+0x14>
	return end-start;
     e14:	697a      	ldr	r2, [r7, #20]
     e16:	68bb      	ldr	r3, [r7, #8]
     e18:	1ad3      	subs	r3, r2, r3
}
     e1a:	4618      	mov	r0, r3
     e1c:	371c      	adds	r7, #28
     e1e:	46bd      	mov	sp, r7
     e20:	f85d 7b04 	ldr.w	r7, [sp], #4
     e24:	4770      	bx	lr
     e26:	bf00      	nop

00000e28 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     e28:	b480      	push	{r7}
     e2a:	b085      	sub	sp, #20
     e2c:	af00      	add	r7, sp, #0
     e2e:	60f8      	str	r0, [r7, #12]
     e30:	60b9      	str	r1, [r7, #8]
     e32:	607a      	str	r2, [r7, #4]
	while (len){
     e34:	e00a      	b.n	e4c <move+0x24>
		*dest++=*src++;
     e36:	68bb      	ldr	r3, [r7, #8]
     e38:	1c5a      	adds	r2, r3, #1
     e3a:	60ba      	str	r2, [r7, #8]
     e3c:	68fa      	ldr	r2, [r7, #12]
     e3e:	1c51      	adds	r1, r2, #1
     e40:	60f9      	str	r1, [r7, #12]
     e42:	7812      	ldrb	r2, [r2, #0]
     e44:	701a      	strb	r2, [r3, #0]
		len--;
     e46:	687b      	ldr	r3, [r7, #4]
     e48:	3b01      	subs	r3, #1
     e4a:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     e4c:	687b      	ldr	r3, [r7, #4]
     e4e:	2b00      	cmp	r3, #0
     e50:	d1f1      	bne.n	e36 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     e52:	68bb      	ldr	r3, [r7, #8]
     e54:	2200      	movs	r2, #0
     e56:	701a      	strb	r2, [r3, #0]
}
     e58:	3714      	adds	r7, #20
     e5a:	46bd      	mov	sp, r7
     e5c:	f85d 7b04 	ldr.w	r7, [sp], #4
     e60:	4770      	bx	lr
     e62:	bf00      	nop

00000e64 <word>:

// extrait le prochain mot du tib
static void word(){
     e64:	b580      	push	{r7, lr}
     e66:	b082      	sub	sp, #8
     e68:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     e6a:	4b1d      	ldr	r3, [pc, #116]	; (ee0 <word+0x7c>)
     e6c:	681b      	ldr	r3, [r3, #0]
     e6e:	481d      	ldr	r0, [pc, #116]	; (ee4 <word+0x80>)
     e70:	4619      	mov	r1, r3
     e72:	2220      	movs	r2, #32
     e74:	f7ff ff0e 	bl	c94 <skip>
     e78:	4603      	mov	r3, r0
     e7a:	461a      	mov	r2, r3
     e7c:	4b18      	ldr	r3, [pc, #96]	; (ee0 <word+0x7c>)
     e7e:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     e80:	4b17      	ldr	r3, [pc, #92]	; (ee0 <word+0x7c>)
     e82:	681b      	ldr	r3, [r3, #0]
     e84:	4a17      	ldr	r2, [pc, #92]	; (ee4 <word+0x80>)
     e86:	5cd3      	ldrb	r3, [r2, r3]
     e88:	2b22      	cmp	r3, #34	; 0x22
     e8a:	d10f      	bne.n	eac <word+0x48>
			in++;
     e8c:	4b14      	ldr	r3, [pc, #80]	; (ee0 <word+0x7c>)
     e8e:	681b      	ldr	r3, [r3, #0]
     e90:	3301      	adds	r3, #1
     e92:	4a13      	ldr	r2, [pc, #76]	; (ee0 <word+0x7c>)
     e94:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     e96:	4b12      	ldr	r3, [pc, #72]	; (ee0 <word+0x7c>)
     e98:	681b      	ldr	r3, [r3, #0]
     e9a:	4812      	ldr	r0, [pc, #72]	; (ee4 <word+0x80>)
     e9c:	4619      	mov	r1, r3
     e9e:	f7ff ff39 	bl	d14 <quote>
     ea2:	4603      	mov	r3, r0
     ea4:	461a      	mov	r2, r3
     ea6:	4b0e      	ldr	r3, [pc, #56]	; (ee0 <word+0x7c>)
     ea8:	601a      	str	r2, [r3, #0]
     eaa:	e016      	b.n	eda <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     eac:	4b0c      	ldr	r3, [pc, #48]	; (ee0 <word+0x7c>)
     eae:	681b      	ldr	r3, [r3, #0]
     eb0:	480c      	ldr	r0, [pc, #48]	; (ee4 <word+0x80>)
     eb2:	4619      	mov	r1, r3
     eb4:	2220      	movs	r2, #32
     eb6:	f7ff ff93 	bl	de0 <next>
     eba:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     ebc:	4b08      	ldr	r3, [pc, #32]	; (ee0 <word+0x7c>)
     ebe:	681b      	ldr	r3, [r3, #0]
     ec0:	4a08      	ldr	r2, [pc, #32]	; (ee4 <word+0x80>)
     ec2:	4413      	add	r3, r2
     ec4:	4618      	mov	r0, r3
     ec6:	4908      	ldr	r1, [pc, #32]	; (ee8 <word+0x84>)
     ec8:	687a      	ldr	r2, [r7, #4]
     eca:	f7ff ffad 	bl	e28 <move>
			in+=len;
     ece:	4b04      	ldr	r3, [pc, #16]	; (ee0 <word+0x7c>)
     ed0:	681a      	ldr	r2, [r3, #0]
     ed2:	687b      	ldr	r3, [r7, #4]
     ed4:	4413      	add	r3, r2
     ed6:	4a02      	ldr	r2, [pc, #8]	; (ee0 <word+0x7c>)
     ed8:	6013      	str	r3, [r2, #0]
		}
}
     eda:	3708      	adds	r7, #8
     edc:	46bd      	mov	sp, r7
     ede:	bd80      	pop	{r7, pc}
     ee0:	200000ac 	.word	0x200000ac
     ee4:	2000000c 	.word	0x2000000c
     ee8:	2000005c 	.word	0x2000005c

00000eec <parse_line>:

static void parse_line(unsigned llen){
     eec:	b580      	push	{r7, lr}
     eee:	b084      	sub	sp, #16
     ef0:	af00      	add	r7, sp, #0
     ef2:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     ef4:	4b14      	ldr	r3, [pc, #80]	; (f48 <parse_line+0x5c>)
     ef6:	2200      	movs	r2, #0
     ef8:	601a      	str	r2, [r3, #0]
	while (in<llen){
     efa:	e019      	b.n	f30 <parse_line+0x44>
		word();
     efc:	f7ff ffb2 	bl	e64 <word>
		cmd_id=search_command((const char*) pad);
     f00:	4812      	ldr	r0, [pc, #72]	; (f4c <parse_line+0x60>)
     f02:	f7ff fe99 	bl	c38 <search_command>
     f06:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     f08:	68fb      	ldr	r3, [r7, #12]
     f0a:	2b00      	cmp	r3, #0
     f0c:	db06      	blt.n	f1c <parse_line+0x30>
			commands[cmd_id].fn();
     f0e:	4a10      	ldr	r2, [pc, #64]	; (f50 <parse_line+0x64>)
     f10:	68fb      	ldr	r3, [r7, #12]
     f12:	00db      	lsls	r3, r3, #3
     f14:	4413      	add	r3, r2
     f16:	685b      	ldr	r3, [r3, #4]
     f18:	4798      	blx	r3
     f1a:	e009      	b.n	f30 <parse_line+0x44>
		}else{
			conout(CR);
     f1c:	200d      	movs	r0, #13
     f1e:	f000 fba9 	bl	1674 <conout>
			print((const char*)pad); conout('?');
     f22:	480a      	ldr	r0, [pc, #40]	; (f4c <parse_line+0x60>)
     f24:	f000 fc04 	bl	1730 <print>
     f28:	203f      	movs	r0, #63	; 0x3f
     f2a:	f000 fba3 	bl	1674 <conout>
			break;
     f2e:	e004      	b.n	f3a <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     f30:	4b05      	ldr	r3, [pc, #20]	; (f48 <parse_line+0x5c>)
     f32:	681a      	ldr	r2, [r3, #0]
     f34:	687b      	ldr	r3, [r7, #4]
     f36:	429a      	cmp	r2, r3
     f38:	d3e0      	bcc.n	efc <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     f3a:	200d      	movs	r0, #13
     f3c:	f000 fb9a 	bl	1674 <conout>
}
     f40:	3710      	adds	r7, #16
     f42:	46bd      	mov	sp, r7
     f44:	bd80      	pop	{r7, pc}
     f46:	bf00      	nop
     f48:	200000ac 	.word	0x200000ac
     f4c:	2000005c 	.word	0x2000005c
     f50:	000039d8 	.word	0x000039d8

00000f54 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     f54:	b480      	push	{r7}
     f56:	b085      	sub	sp, #20
     f58:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     f5a:	4b0c      	ldr	r3, [pc, #48]	; (f8c <copy_blink_in_ram+0x38>)
     f5c:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     f5e:	4b0c      	ldr	r3, [pc, #48]	; (f90 <copy_blink_in_ram+0x3c>)
     f60:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     f62:	4b0c      	ldr	r3, [pc, #48]	; (f94 <copy_blink_in_ram+0x40>)
     f64:	60bb      	str	r3, [r7, #8]
	while (start<end){
     f66:	e007      	b.n	f78 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     f68:	68bb      	ldr	r3, [r7, #8]
     f6a:	1d1a      	adds	r2, r3, #4
     f6c:	60ba      	str	r2, [r7, #8]
     f6e:	68fa      	ldr	r2, [r7, #12]
     f70:	1d11      	adds	r1, r2, #4
     f72:	60f9      	str	r1, [r7, #12]
     f74:	6812      	ldr	r2, [r2, #0]
     f76:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     f78:	68fa      	ldr	r2, [r7, #12]
     f7a:	687b      	ldr	r3, [r7, #4]
     f7c:	429a      	cmp	r2, r3
     f7e:	d3f3      	bcc.n	f68 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     f80:	3714      	adds	r7, #20
     f82:	46bd      	mov	sp, r7
     f84:	f85d 7b04 	ldr.w	r7, [sp], #4
     f88:	4770      	bx	lr
     f8a:	bf00      	nop
     f8c:	00004400 	.word	0x00004400
     f90:	00004490 	.word	0x00004490
     f94:	20002700 	.word	0x20002700

00000f98 <main>:

extern void print_fault(const char *msg, sfrp_t adr);



void main(void){
     f98:	b580      	push	{r7, lr}
     f9a:	b082      	sub	sp, #8
     f9c:	af00      	add	r7, sp, #0
	set_sysclock();
     f9e:	f7ff fbc5 	bl	72c <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     fa2:	f06f 000a 	mvn.w	r0, #10
     fa6:	210f      	movs	r1, #15
     fa8:	f001 fc24 	bl	27f4 <set_int_priority>
	config_systicks();
     fac:	f002 f860 	bl	3070 <config_systicks>
	flash_enable();
     fb0:	f000 fdb0 	bl	1b14 <flash_enable>
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
     fb4:	4b32      	ldr	r3, [pc, #200]	; (1080 <main+0xe8>)
     fb6:	221d      	movs	r2, #29
     fb8:	619a      	str	r2, [r3, #24]
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
     fba:	4b31      	ldr	r3, [pc, #196]	; (1080 <main+0xe8>)
     fbc:	f44f 4280 	mov.w	r2, #16384	; 0x4000
     fc0:	61da      	str	r2, [r3, #28]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     fc2:	4a2f      	ldr	r2, [pc, #188]	; (1080 <main+0xe8>)
     fc4:	4b2e      	ldr	r3, [pc, #184]	; (1080 <main+0xe8>)
     fc6:	695b      	ldr	r3, [r3, #20]
     fc8:	f043 0301 	orr.w	r3, r3, #1
     fcc:	6153      	str	r3, [r2, #20]
	config_pin(LED_PORT,LED_PIN,OUTPUT_OD_SLOW);
     fce:	482d      	ldr	r0, [pc, #180]	; (1084 <main+0xec>)
     fd0:	210d      	movs	r1, #13
     fd2:	2206      	movs	r2, #6
     fd4:	f001 f840 	bl	2058 <config_pin>
	vt_init();
     fd8:	f002 fbf2 	bl	37c0 <vt_init>
	keyboard_init();
     fdc:	f001 f8b6 	bl	214c <keyboard_init>
	tvout_init();
     fe0:	f002 f892 	bl	3108 <tvout_init>
	console_init(SERIAL);
     fe4:	2001      	movs	r0, #1
     fe6:	f000 fb2d 	bl	1644 <console_init>
	if (!vt_ready()){con_select(LOCAL);}
     fea:	f002 fc57 	bl	389c <vt_ready>
     fee:	4603      	mov	r3, r0
     ff0:	2b00      	cmp	r3, #0
     ff2:	d102      	bne.n	ffa <main+0x62>
     ff4:	2000      	movs	r0, #0
     ff6:	f000 fabd 	bl	1574 <con_select>
	cls();
     ffa:	f000 fd53 	bl	1aa4 <cls>
	print(VERSION);
     ffe:	4b22      	ldr	r3, [pc, #136]	; (1088 <main+0xf0>)
    1000:	681b      	ldr	r3, [r3, #0]
    1002:	4618      	mov	r0, r3
    1004:	f000 fb94 	bl	1730 <print>
	copy_blink_in_ram();
    1008:	f7ff ffa4 	bl	f54 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
    100c:	481f      	ldr	r0, [pc, #124]	; (108c <main+0xf4>)
    100e:	f000 fb8f 	bl	1730 <print>
    1012:	4b1f      	ldr	r3, [pc, #124]	; (1090 <main+0xf8>)
    1014:	2200      	movs	r2, #0
    1016:	4618      	mov	r0, r3
    1018:	4611      	mov	r1, r2
    101a:	df0a      	svc	10
    101c:	200d      	movs	r0, #13
    101e:	f000 fb29 	bl	1674 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
    1022:	2300      	movs	r3, #0
    1024:	2200      	movs	r2, #0
    1026:	4618      	mov	r0, r3
    1028:	4611      	mov	r1, r2
    102a:	df01      	svc	1
	print("initializing SDcard\n");
    102c:	4819      	ldr	r0, [pc, #100]	; (1094 <main+0xfc>)
    102e:	f000 fb7f 	bl	1730 <print>
	if (sdcard_init()){
    1032:	f001 fd51 	bl	2ad8 <sdcard_init>
    1036:	4603      	mov	r3, r0
    1038:	2b00      	cmp	r3, #0
    103a:	d00d      	beq.n	1058 <main+0xc0>
			print("SDcard capacity: ");print_int(sdcard_capacity(),10);print(" Mo\n");
    103c:	4816      	ldr	r0, [pc, #88]	; (1098 <main+0x100>)
    103e:	f000 fb77 	bl	1730 <print>
    1042:	f001 fc07 	bl	2854 <sdcard_capacity>
    1046:	4603      	mov	r3, r0
    1048:	4618      	mov	r0, r3
    104a:	210a      	movs	r1, #10
    104c:	f000 fc5a 	bl	1904 <print_int>
    1050:	4812      	ldr	r0, [pc, #72]	; (109c <main+0x104>)
    1052:	f000 fb6d 	bl	1730 <print>
    1056:	e00a      	b.n	106e <main+0xd6>
	}else{
		print("SDcard initialization failed, status code: "); print_hex(sdc_status);conout('\n');
    1058:	4811      	ldr	r0, [pc, #68]	; (10a0 <main+0x108>)
    105a:	f000 fb69 	bl	1730 <print>
    105e:	4b11      	ldr	r3, [pc, #68]	; (10a4 <main+0x10c>)
    1060:	881b      	ldrh	r3, [r3, #0]
    1062:	4618      	mov	r0, r3
    1064:	f000 fcbc 	bl	19e0 <print_hex>
    1068:	200a      	movs	r0, #10
    106a:	f000 fb03 	bl	1674 <conout>
	} 
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
    106e:	480e      	ldr	r0, [pc, #56]	; (10a8 <main+0x110>)
    1070:	2150      	movs	r1, #80	; 0x50
    1072:	f000 fb7f 	bl	1774 <read_line>
    1076:	6078      	str	r0, [r7, #4]
		parse_line(llen);
    1078:	6878      	ldr	r0, [r7, #4]
    107a:	f7ff ff37 	bl	eec <parse_line>
	}
    107e:	e7f6      	b.n	106e <main+0xd6>
    1080:	40021000 	.word	0x40021000
    1084:	40011000 	.word	0x40011000
    1088:	20000000 	.word	0x20000000
    108c:	00003ac0 	.word	0x00003ac0
    1090:	200000fc 	.word	0x200000fc
    1094:	00003adc 	.word	0x00003adc
    1098:	00003af4 	.word	0x00003af4
    109c:	00003b08 	.word	0x00003b08
    10a0:	00003b10 	.word	0x00003b10
    10a4:	20000148 	.word	0x20000148
    10a8:	2000000c 	.word	0x2000000c

000010ac <cursor_home>:
static int screen_width, screen_height;

static int cursor_visible=0;
static int cursor_blink=0;

static void cursor_home(){
    10ac:	b480      	push	{r7}
    10ae:	af00      	add	r7, sp, #0
	cursor_x=0;
    10b0:	4b04      	ldr	r3, [pc, #16]	; (10c4 <cursor_home+0x18>)
    10b2:	2200      	movs	r2, #0
    10b4:	601a      	str	r2, [r3, #0]
	cursor_y=0;
    10b6:	4b04      	ldr	r3, [pc, #16]	; (10c8 <cursor_home+0x1c>)
    10b8:	2200      	movs	r2, #0
    10ba:	601a      	str	r2, [r3, #0]
}
    10bc:	46bd      	mov	sp, r7
    10be:	f85d 7b04 	ldr.w	r7, [sp], #4
    10c2:	4770      	bx	lr
    10c4:	200000b0 	.word	0x200000b0
    10c8:	200000b4 	.word	0x200000b4

000010cc <local_hide_cursor>:

/**************************
 * fonctions console locale
 *************************/
 
static void local_hide_cursor(){
    10cc:	b580      	push	{r7, lr}
    10ce:	b082      	sub	sp, #8
    10d0:	af02      	add	r7, sp, #8
	if (cursor_visible){
    10d2:	4b0f      	ldr	r3, [pc, #60]	; (1110 <local_hide_cursor+0x44>)
    10d4:	681b      	ldr	r3, [r3, #0]
    10d6:	2b00      	cmp	r3, #0
    10d8:	d017      	beq.n	110a <local_hide_cursor+0x3e>
		disable_interrupt(IRQ_CURSOR_BLINK);
    10da:	201e      	movs	r0, #30
    10dc:	f001 faf2 	bl	26c4 <disable_interrupt>
		gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    10e0:	4b0c      	ldr	r3, [pc, #48]	; (1114 <local_hide_cursor+0x48>)
    10e2:	681a      	ldr	r2, [r3, #0]
    10e4:	4613      	mov	r3, r2
    10e6:	005b      	lsls	r3, r3, #1
    10e8:	4413      	add	r3, r2
    10ea:	005b      	lsls	r3, r3, #1
    10ec:	4619      	mov	r1, r3
    10ee:	4b0a      	ldr	r3, [pc, #40]	; (1118 <local_hide_cursor+0x4c>)
    10f0:	681b      	ldr	r3, [r3, #0]
    10f2:	00da      	lsls	r2, r3, #3
    10f4:	2300      	movs	r3, #0
    10f6:	9300      	str	r3, [sp, #0]
    10f8:	4608      	mov	r0, r1
    10fa:	4611      	mov	r1, r2
    10fc:	2206      	movs	r2, #6
    10fe:	2308      	movs	r3, #8
    1100:	f000 fe86 	bl	1e10 <gdi_box>
		cursor_visible=0;
    1104:	4b02      	ldr	r3, [pc, #8]	; (1110 <local_hide_cursor+0x44>)
    1106:	2200      	movs	r2, #0
    1108:	601a      	str	r2, [r3, #0]
	}
}
    110a:	46bd      	mov	sp, r7
    110c:	bd80      	pop	{r7, pc}
    110e:	bf00      	nop
    1110:	200000c0 	.word	0x200000c0
    1114:	200000b0 	.word	0x200000b0
    1118:	200000b4 	.word	0x200000b4

0000111c <local_crlf>:

// avance le curseur texte au début 
// de la ligne suivante.
static void local_crlf(){
    111c:	b580      	push	{r7, lr}
    111e:	af00      	add	r7, sp, #0
	local_hide_cursor();
    1120:	f7ff ffd4 	bl	10cc <local_hide_cursor>
	cursor_x=0;
    1124:	4b0e      	ldr	r3, [pc, #56]	; (1160 <local_crlf+0x44>)
    1126:	2200      	movs	r2, #0
    1128:	601a      	str	r2, [r3, #0]
	cursor_y++;
    112a:	4b0e      	ldr	r3, [pc, #56]	; (1164 <local_crlf+0x48>)
    112c:	681b      	ldr	r3, [r3, #0]
    112e:	3301      	adds	r3, #1
    1130:	4a0c      	ldr	r2, [pc, #48]	; (1164 <local_crlf+0x48>)
    1132:	6013      	str	r3, [r2, #0]
	if (cursor_y>=screen_height){
    1134:	4b0b      	ldr	r3, [pc, #44]	; (1164 <local_crlf+0x48>)
    1136:	681a      	ldr	r2, [r3, #0]
    1138:	4b0b      	ldr	r3, [pc, #44]	; (1168 <local_crlf+0x4c>)
    113a:	681b      	ldr	r3, [r3, #0]
    113c:	429a      	cmp	r2, r3
    113e:	db07      	blt.n	1150 <local_crlf+0x34>
		cursor_y--;
    1140:	4b08      	ldr	r3, [pc, #32]	; (1164 <local_crlf+0x48>)
    1142:	681b      	ldr	r3, [r3, #0]
    1144:	3b01      	subs	r3, #1
    1146:	4a07      	ldr	r2, [pc, #28]	; (1164 <local_crlf+0x48>)
    1148:	6013      	str	r3, [r2, #0]
		gdi_scroll_up(CHAR_HEIGHT);
    114a:	2008      	movs	r0, #8
    114c:	f000 fdd4 	bl	1cf8 <gdi_scroll_up>
	}
	if (cursor_blink){
    1150:	4b06      	ldr	r3, [pc, #24]	; (116c <local_crlf+0x50>)
    1152:	681b      	ldr	r3, [r3, #0]
    1154:	2b00      	cmp	r3, #0
    1156:	d002      	beq.n	115e <local_crlf+0x42>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1158:	201e      	movs	r0, #30
    115a:	f001 fa8f 	bl	267c <enable_interrupt>
	}
}
    115e:	bd80      	pop	{r7, pc}
    1160:	200000b0 	.word	0x200000b0
    1164:	200000b4 	.word	0x200000b4
    1168:	200000bc 	.word	0x200000bc
    116c:	200000c4 	.word	0x200000c4

00001170 <local_cursor_left>:

static void local_cursor_left(){
    1170:	b580      	push	{r7, lr}
    1172:	af00      	add	r7, sp, #0
	if (!(cursor_x|cursor_y)) return; // curseur à {0,0}
    1174:	4b12      	ldr	r3, [pc, #72]	; (11c0 <local_cursor_left+0x50>)
    1176:	681a      	ldr	r2, [r3, #0]
    1178:	4b12      	ldr	r3, [pc, #72]	; (11c4 <local_cursor_left+0x54>)
    117a:	681b      	ldr	r3, [r3, #0]
    117c:	4313      	orrs	r3, r2
    117e:	2b00      	cmp	r3, #0
    1180:	d100      	bne.n	1184 <local_cursor_left+0x14>
    1182:	e01c      	b.n	11be <local_cursor_left+0x4e>
	local_hide_cursor();
    1184:	f7ff ffa2 	bl	10cc <local_hide_cursor>
	if (cursor_x){
    1188:	4b0d      	ldr	r3, [pc, #52]	; (11c0 <local_cursor_left+0x50>)
    118a:	681b      	ldr	r3, [r3, #0]
    118c:	2b00      	cmp	r3, #0
    118e:	d005      	beq.n	119c <local_cursor_left+0x2c>
		cursor_x--;
    1190:	4b0b      	ldr	r3, [pc, #44]	; (11c0 <local_cursor_left+0x50>)
    1192:	681b      	ldr	r3, [r3, #0]
    1194:	3b01      	subs	r3, #1
    1196:	4a0a      	ldr	r2, [pc, #40]	; (11c0 <local_cursor_left+0x50>)
    1198:	6013      	str	r3, [r2, #0]
    119a:	e009      	b.n	11b0 <local_cursor_left+0x40>
	}else{
		cursor_x=screen_width-1;
    119c:	4b0a      	ldr	r3, [pc, #40]	; (11c8 <local_cursor_left+0x58>)
    119e:	681b      	ldr	r3, [r3, #0]
    11a0:	3b01      	subs	r3, #1
    11a2:	4a07      	ldr	r2, [pc, #28]	; (11c0 <local_cursor_left+0x50>)
    11a4:	6013      	str	r3, [r2, #0]
		cursor_y--;
    11a6:	4b07      	ldr	r3, [pc, #28]	; (11c4 <local_cursor_left+0x54>)
    11a8:	681b      	ldr	r3, [r3, #0]
    11aa:	3b01      	subs	r3, #1
    11ac:	4a05      	ldr	r2, [pc, #20]	; (11c4 <local_cursor_left+0x54>)
    11ae:	6013      	str	r3, [r2, #0]
	}
	if (cursor_blink){
    11b0:	4b06      	ldr	r3, [pc, #24]	; (11cc <local_cursor_left+0x5c>)
    11b2:	681b      	ldr	r3, [r3, #0]
    11b4:	2b00      	cmp	r3, #0
    11b6:	d002      	beq.n	11be <local_cursor_left+0x4e>
		enable_interrupt(IRQ_CURSOR_BLINK);
    11b8:	201e      	movs	r0, #30
    11ba:	f001 fa5f 	bl	267c <enable_interrupt>
	}
}
    11be:	bd80      	pop	{r7, pc}
    11c0:	200000b0 	.word	0x200000b0
    11c4:	200000b4 	.word	0x200000b4
    11c8:	200000b8 	.word	0x200000b8
    11cc:	200000c4 	.word	0x200000c4

000011d0 <local_cursor_right>:

static void local_cursor_right(){
    11d0:	b580      	push	{r7, lr}
    11d2:	af00      	add	r7, sp, #0
	local_hide_cursor();
    11d4:	f7ff ff7a 	bl	10cc <local_hide_cursor>
	cursor_x++;
    11d8:	4b0a      	ldr	r3, [pc, #40]	; (1204 <local_cursor_right+0x34>)
    11da:	681b      	ldr	r3, [r3, #0]
    11dc:	3301      	adds	r3, #1
    11de:	4a09      	ldr	r2, [pc, #36]	; (1204 <local_cursor_right+0x34>)
    11e0:	6013      	str	r3, [r2, #0]
	if (cursor_x>=screen_width){
    11e2:	4b08      	ldr	r3, [pc, #32]	; (1204 <local_cursor_right+0x34>)
    11e4:	681a      	ldr	r2, [r3, #0]
    11e6:	4b08      	ldr	r3, [pc, #32]	; (1208 <local_cursor_right+0x38>)
    11e8:	681b      	ldr	r3, [r3, #0]
    11ea:	429a      	cmp	r2, r3
    11ec:	db01      	blt.n	11f2 <local_cursor_right+0x22>
		local_crlf();
    11ee:	f7ff ff95 	bl	111c <local_crlf>
	}	
	if (cursor_blink){
    11f2:	4b06      	ldr	r3, [pc, #24]	; (120c <local_cursor_right+0x3c>)
    11f4:	681b      	ldr	r3, [r3, #0]
    11f6:	2b00      	cmp	r3, #0
    11f8:	d002      	beq.n	1200 <local_cursor_right+0x30>
		enable_interrupt(IRQ_CURSOR_BLINK);
    11fa:	201e      	movs	r0, #30
    11fc:	f001 fa3e 	bl	267c <enable_interrupt>
	}
}
    1200:	bd80      	pop	{r7, pc}
    1202:	bf00      	nop
    1204:	200000b0 	.word	0x200000b0
    1208:	200000b8 	.word	0x200000b8
    120c:	200000c4 	.word	0x200000c4

00001210 <local_del_back>:


static void local_del_back(){
    1210:	b580      	push	{r7, lr}
    1212:	b082      	sub	sp, #8
    1214:	af02      	add	r7, sp, #8
	if (!(cursor_x|cursor_y)) return; 
    1216:	4b13      	ldr	r3, [pc, #76]	; (1264 <local_del_back+0x54>)
    1218:	681a      	ldr	r2, [r3, #0]
    121a:	4b13      	ldr	r3, [pc, #76]	; (1268 <local_del_back+0x58>)
    121c:	681b      	ldr	r3, [r3, #0]
    121e:	4313      	orrs	r3, r2
    1220:	2b00      	cmp	r3, #0
    1222:	d100      	bne.n	1226 <local_del_back+0x16>
    1224:	e01c      	b.n	1260 <local_del_back+0x50>
	local_cursor_left();
    1226:	f7ff ffa3 	bl	1170 <local_cursor_left>
	local_hide_cursor();
    122a:	f7ff ff4f 	bl	10cc <local_hide_cursor>
	gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    122e:	4b0d      	ldr	r3, [pc, #52]	; (1264 <local_del_back+0x54>)
    1230:	681a      	ldr	r2, [r3, #0]
    1232:	4613      	mov	r3, r2
    1234:	005b      	lsls	r3, r3, #1
    1236:	4413      	add	r3, r2
    1238:	005b      	lsls	r3, r3, #1
    123a:	4619      	mov	r1, r3
    123c:	4b0a      	ldr	r3, [pc, #40]	; (1268 <local_del_back+0x58>)
    123e:	681b      	ldr	r3, [r3, #0]
    1240:	00da      	lsls	r2, r3, #3
    1242:	2300      	movs	r3, #0
    1244:	9300      	str	r3, [sp, #0]
    1246:	4608      	mov	r0, r1
    1248:	4611      	mov	r1, r2
    124a:	2206      	movs	r2, #6
    124c:	2308      	movs	r3, #8
    124e:	f000 fddf 	bl	1e10 <gdi_box>
	if (cursor_blink){
    1252:	4b06      	ldr	r3, [pc, #24]	; (126c <local_del_back+0x5c>)
    1254:	681b      	ldr	r3, [r3, #0]
    1256:	2b00      	cmp	r3, #0
    1258:	d002      	beq.n	1260 <local_del_back+0x50>
		enable_interrupt(IRQ_CURSOR_BLINK);
    125a:	201e      	movs	r0, #30
    125c:	f001 fa0e 	bl	267c <enable_interrupt>
	}
}
    1260:	46bd      	mov	sp, r7
    1262:	bd80      	pop	{r7, pc}
    1264:	200000b0 	.word	0x200000b0
    1268:	200000b4 	.word	0x200000b4
    126c:	200000c4 	.word	0x200000c4

00001270 <local_putc>:

// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void local_putc(char c){
    1270:	b580      	push	{r7, lr}
    1272:	b084      	sub	sp, #16
    1274:	af02      	add	r7, sp, #8
    1276:	4603      	mov	r3, r0
    1278:	71fb      	strb	r3, [r7, #7]
		local_hide_cursor();
    127a:	f7ff ff27 	bl	10cc <local_hide_cursor>
		gdi_put_sprite(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,(const unsigned char *)&font6x8[c]);
    127e:	4b0c      	ldr	r3, [pc, #48]	; (12b0 <local_putc+0x40>)
    1280:	681a      	ldr	r2, [r3, #0]
    1282:	4613      	mov	r3, r2
    1284:	005b      	lsls	r3, r3, #1
    1286:	4413      	add	r3, r2
    1288:	005b      	lsls	r3, r3, #1
    128a:	4618      	mov	r0, r3
    128c:	4b09      	ldr	r3, [pc, #36]	; (12b4 <local_putc+0x44>)
    128e:	681b      	ldr	r3, [r3, #0]
    1290:	00d9      	lsls	r1, r3, #3
    1292:	79fb      	ldrb	r3, [r7, #7]
    1294:	00db      	lsls	r3, r3, #3
    1296:	4a08      	ldr	r2, [pc, #32]	; (12b8 <local_putc+0x48>)
    1298:	4413      	add	r3, r2
    129a:	9300      	str	r3, [sp, #0]
    129c:	2206      	movs	r2, #6
    129e:	2308      	movs	r3, #8
    12a0:	f000 fdf6 	bl	1e90 <gdi_put_sprite>
		local_cursor_right();
    12a4:	f7ff ff94 	bl	11d0 <local_cursor_right>
/*
		if (cursor_blink){
			enable_interrupt(IRQ_CURSOR_BLINK);
		}
*/
}
    12a8:	3708      	adds	r7, #8
    12aa:	46bd      	mov	sp, r7
    12ac:	bd80      	pop	{r7, pc}
    12ae:	bf00      	nop
    12b0:	200000b0 	.word	0x200000b0
    12b4:	200000b4 	.word	0x200000b4
    12b8:	00003b44 	.word	0x00003b44

000012bc <local_clear_line>:


static void local_clear_line(){
    12bc:	b580      	push	{r7, lr}
    12be:	af00      	add	r7, sp, #0
	local_hide_cursor();
    12c0:	f7ff ff04 	bl	10cc <local_hide_cursor>
	cursor_x=0;
    12c4:	4b08      	ldr	r3, [pc, #32]	; (12e8 <local_clear_line+0x2c>)
    12c6:	2200      	movs	r2, #0
    12c8:	601a      	str	r2, [r3, #0]
	gdi_clear_rows(cursor_y*CHAR_HEIGHT,CHAR_HEIGHT);
    12ca:	4b08      	ldr	r3, [pc, #32]	; (12ec <local_clear_line+0x30>)
    12cc:	681b      	ldr	r3, [r3, #0]
    12ce:	00db      	lsls	r3, r3, #3
    12d0:	4618      	mov	r0, r3
    12d2:	2108      	movs	r1, #8
    12d4:	f000 fe8c 	bl	1ff0 <gdi_clear_rows>
	if (cursor_blink){
    12d8:	4b05      	ldr	r3, [pc, #20]	; (12f0 <local_clear_line+0x34>)
    12da:	681b      	ldr	r3, [r3, #0]
    12dc:	2b00      	cmp	r3, #0
    12de:	d002      	beq.n	12e6 <local_clear_line+0x2a>
		enable_interrupt(IRQ_CURSOR_BLINK);
    12e0:	201e      	movs	r0, #30
    12e2:	f001 f9cb 	bl	267c <enable_interrupt>
	}
}
    12e6:	bd80      	pop	{r7, pc}
    12e8:	200000b0 	.word	0x200000b0
    12ec:	200000b4 	.word	0x200000b4
    12f0:	200000c4 	.word	0x200000c4

000012f4 <local_clear_screen>:

static void local_clear_screen(){
    12f4:	b580      	push	{r7, lr}
    12f6:	af00      	add	r7, sp, #0
	local_hide_cursor();
    12f8:	f7ff fee8 	bl	10cc <local_hide_cursor>
	gdi_clear_screen();
    12fc:	f000 fce4 	bl	1cc8 <gdi_clear_screen>
	cursor_home();
    1300:	f7ff fed4 	bl	10ac <cursor_home>
	if (cursor_blink){
    1304:	4b03      	ldr	r3, [pc, #12]	; (1314 <local_clear_screen+0x20>)
    1306:	681b      	ldr	r3, [r3, #0]
    1308:	2b00      	cmp	r3, #0
    130a:	d002      	beq.n	1312 <local_clear_screen+0x1e>
		enable_interrupt(IRQ_CURSOR_BLINK);
    130c:	201e      	movs	r0, #30
    130e:	f001 f9b5 	bl	267c <enable_interrupt>
	}
}
    1312:	bd80      	pop	{r7, pc}
    1314:	200000c4 	.word	0x200000c4

00001318 <local_text_cursor>:

static void local_text_cursor(int enable){
    1318:	b580      	push	{r7, lr}
    131a:	b084      	sub	sp, #16
    131c:	af02      	add	r7, sp, #8
    131e:	6078      	str	r0, [r7, #4]
	if (enable){
    1320:	687b      	ldr	r3, [r7, #4]
    1322:	2b00      	cmp	r3, #0
    1324:	d024      	beq.n	1370 <local_text_cursor+0x58>
		// activation clock CURSOR_TMR
		RCC->CURSOR_RCC_ENR|=CURSOR_RCC_EN_BIT; 
    1326:	4a27      	ldr	r2, [pc, #156]	; (13c4 <local_text_cursor+0xac>)
    1328:	4b26      	ldr	r3, [pc, #152]	; (13c4 <local_text_cursor+0xac>)
    132a:	69db      	ldr	r3, [r3, #28]
    132c:	f043 0304 	orr.w	r3, r3, #4
    1330:	61d3      	str	r3, [r2, #28]
		CURSOR_TMR->ARR=FTMR2_4/1000/2;
    1332:	4b25      	ldr	r3, [pc, #148]	; (13c8 <local_text_cursor+0xb0>)
    1334:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    1338:	62da      	str	r2, [r3, #44]	; 0x2c
		CURSOR_TMR->PSC=1000;
    133a:	4b23      	ldr	r3, [pc, #140]	; (13c8 <local_text_cursor+0xb0>)
    133c:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    1340:	629a      	str	r2, [r3, #40]	; 0x28
		CURSOR_TMR->CR1=BIT0|BIT7; // ARPE
    1342:	4b21      	ldr	r3, [pc, #132]	; (13c8 <local_text_cursor+0xb0>)
    1344:	2281      	movs	r2, #129	; 0x81
    1346:	601a      	str	r2, [r3, #0]
		CURSOR_TMR->DIER=BIT0; // UIE
    1348:	4b1f      	ldr	r3, [pc, #124]	; (13c8 <local_text_cursor+0xb0>)
    134a:	2201      	movs	r2, #1
    134c:	60da      	str	r2, [r3, #12]
		set_int_priority(IRQ_CURSOR_BLINK,15);
    134e:	201e      	movs	r0, #30
    1350:	210f      	movs	r1, #15
    1352:	f001 fa4f 	bl	27f4 <set_int_priority>
		CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
    1356:	4a1c      	ldr	r2, [pc, #112]	; (13c8 <local_text_cursor+0xb0>)
    1358:	4b1b      	ldr	r3, [pc, #108]	; (13c8 <local_text_cursor+0xb0>)
    135a:	691b      	ldr	r3, [r3, #16]
    135c:	f023 0301 	bic.w	r3, r3, #1
    1360:	6113      	str	r3, [r2, #16]
		enable_interrupt(IRQ_CURSOR_BLINK);
    1362:	201e      	movs	r0, #30
    1364:	f001 f98a 	bl	267c <enable_interrupt>
		cursor_blink=1;
    1368:	4b18      	ldr	r3, [pc, #96]	; (13cc <local_text_cursor+0xb4>)
    136a:	2201      	movs	r2, #1
    136c:	601a      	str	r2, [r3, #0]
    136e:	e026      	b.n	13be <local_text_cursor+0xa6>
	}else{
		disable_interrupt(IRQ_CURSOR_BLINK);
    1370:	201e      	movs	r0, #30
    1372:	f001 f9a7 	bl	26c4 <disable_interrupt>
		if (cursor_visible){
    1376:	4b16      	ldr	r3, [pc, #88]	; (13d0 <local_text_cursor+0xb8>)
    1378:	681b      	ldr	r3, [r3, #0]
    137a:	2b00      	cmp	r3, #0
    137c:	d016      	beq.n	13ac <local_text_cursor+0x94>
			gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    137e:	4b15      	ldr	r3, [pc, #84]	; (13d4 <local_text_cursor+0xbc>)
    1380:	681a      	ldr	r2, [r3, #0]
    1382:	4613      	mov	r3, r2
    1384:	005b      	lsls	r3, r3, #1
    1386:	4413      	add	r3, r2
    1388:	005b      	lsls	r3, r3, #1
    138a:	4619      	mov	r1, r3
    138c:	4b12      	ldr	r3, [pc, #72]	; (13d8 <local_text_cursor+0xc0>)
    138e:	681b      	ldr	r3, [r3, #0]
    1390:	00da      	lsls	r2, r3, #3
    1392:	2302      	movs	r3, #2
    1394:	9300      	str	r3, [sp, #0]
    1396:	4608      	mov	r0, r1
    1398:	4611      	mov	r1, r2
    139a:	2206      	movs	r2, #6
    139c:	2308      	movs	r3, #8
    139e:	f000 fd37 	bl	1e10 <gdi_box>
			cursor_visible=~cursor_visible;
    13a2:	4b0b      	ldr	r3, [pc, #44]	; (13d0 <local_text_cursor+0xb8>)
    13a4:	681b      	ldr	r3, [r3, #0]
    13a6:	43db      	mvns	r3, r3
    13a8:	4a09      	ldr	r2, [pc, #36]	; (13d0 <local_text_cursor+0xb8>)
    13aa:	6013      	str	r3, [r2, #0]
		}
		CURSOR_TMR->DIER&=~BIT0;
    13ac:	4a06      	ldr	r2, [pc, #24]	; (13c8 <local_text_cursor+0xb0>)
    13ae:	4b06      	ldr	r3, [pc, #24]	; (13c8 <local_text_cursor+0xb0>)
    13b0:	68db      	ldr	r3, [r3, #12]
    13b2:	f023 0301 	bic.w	r3, r3, #1
    13b6:	60d3      	str	r3, [r2, #12]
		cursor_blink=0;
    13b8:	4b04      	ldr	r3, [pc, #16]	; (13cc <local_text_cursor+0xb4>)
    13ba:	2200      	movs	r2, #0
    13bc:	601a      	str	r2, [r3, #0]
	}
}
    13be:	3708      	adds	r7, #8
    13c0:	46bd      	mov	sp, r7
    13c2:	bd80      	pop	{r7, pc}
    13c4:	40021000 	.word	0x40021000
    13c8:	40000800 	.word	0x40000800
    13cc:	200000c4 	.word	0x200000c4
    13d0:	200000c0 	.word	0x200000c0
    13d4:	200000b0 	.word	0x200000b0
    13d8:	200000b4 	.word	0x200000b4

000013dc <serial_cursor_crlf>:
/**********************************
 * fonctions console sérielle
 **********************************/
 
// cursor au début de la ligne suivante.
static void serial_cursor_crlf(){
    13dc:	b480      	push	{r7}
    13de:	af00      	add	r7, sp, #0
	cursor_x=0;
    13e0:	4b09      	ldr	r3, [pc, #36]	; (1408 <serial_cursor_crlf+0x2c>)
    13e2:	2200      	movs	r2, #0
    13e4:	601a      	str	r2, [r3, #0]
	if (cursor_y<(screen_height-1)){
    13e6:	4b09      	ldr	r3, [pc, #36]	; (140c <serial_cursor_crlf+0x30>)
    13e8:	681b      	ldr	r3, [r3, #0]
    13ea:	1e5a      	subs	r2, r3, #1
    13ec:	4b08      	ldr	r3, [pc, #32]	; (1410 <serial_cursor_crlf+0x34>)
    13ee:	681b      	ldr	r3, [r3, #0]
    13f0:	429a      	cmp	r2, r3
    13f2:	dd04      	ble.n	13fe <serial_cursor_crlf+0x22>
		cursor_y++;
    13f4:	4b06      	ldr	r3, [pc, #24]	; (1410 <serial_cursor_crlf+0x34>)
    13f6:	681b      	ldr	r3, [r3, #0]
    13f8:	3301      	adds	r3, #1
    13fa:	4a05      	ldr	r2, [pc, #20]	; (1410 <serial_cursor_crlf+0x34>)
    13fc:	6013      	str	r3, [r2, #0]
	}
	
}
    13fe:	46bd      	mov	sp, r7
    1400:	f85d 7b04 	ldr.w	r7, [sp], #4
    1404:	4770      	bx	lr
    1406:	bf00      	nop
    1408:	200000b0 	.word	0x200000b0
    140c:	200000bc 	.word	0x200000bc
    1410:	200000b4 	.word	0x200000b4

00001414 <serial_cursor_left>:

static void serial_cursor_left(){
    1414:	b480      	push	{r7}
    1416:	af00      	add	r7, sp, #0
	if (cursor_x){
    1418:	4b0d      	ldr	r3, [pc, #52]	; (1450 <serial_cursor_left+0x3c>)
    141a:	681b      	ldr	r3, [r3, #0]
    141c:	2b00      	cmp	r3, #0
    141e:	d005      	beq.n	142c <serial_cursor_left+0x18>
		cursor_x--;
    1420:	4b0b      	ldr	r3, [pc, #44]	; (1450 <serial_cursor_left+0x3c>)
    1422:	681b      	ldr	r3, [r3, #0]
    1424:	3b01      	subs	r3, #1
    1426:	4a0a      	ldr	r2, [pc, #40]	; (1450 <serial_cursor_left+0x3c>)
    1428:	6013      	str	r3, [r2, #0]
    142a:	e00d      	b.n	1448 <serial_cursor_left+0x34>
	}else if (cursor_y){
    142c:	4b09      	ldr	r3, [pc, #36]	; (1454 <serial_cursor_left+0x40>)
    142e:	681b      	ldr	r3, [r3, #0]
    1430:	2b00      	cmp	r3, #0
    1432:	d009      	beq.n	1448 <serial_cursor_left+0x34>
		cursor_x=screen_width-1;
    1434:	4b08      	ldr	r3, [pc, #32]	; (1458 <serial_cursor_left+0x44>)
    1436:	681b      	ldr	r3, [r3, #0]
    1438:	3b01      	subs	r3, #1
    143a:	4a05      	ldr	r2, [pc, #20]	; (1450 <serial_cursor_left+0x3c>)
    143c:	6013      	str	r3, [r2, #0]
		cursor_y--;
    143e:	4b05      	ldr	r3, [pc, #20]	; (1454 <serial_cursor_left+0x40>)
    1440:	681b      	ldr	r3, [r3, #0]
    1442:	3b01      	subs	r3, #1
    1444:	4a03      	ldr	r2, [pc, #12]	; (1454 <serial_cursor_left+0x40>)
    1446:	6013      	str	r3, [r2, #0]
	}
}
    1448:	46bd      	mov	sp, r7
    144a:	f85d 7b04 	ldr.w	r7, [sp], #4
    144e:	4770      	bx	lr
    1450:	200000b0 	.word	0x200000b0
    1454:	200000b4 	.word	0x200000b4
    1458:	200000b8 	.word	0x200000b8

0000145c <serial_cursor_right>:

static void serial_cursor_right(){
    145c:	b580      	push	{r7, lr}
    145e:	af00      	add	r7, sp, #0
	cursor_x++;
    1460:	4b06      	ldr	r3, [pc, #24]	; (147c <serial_cursor_right+0x20>)
    1462:	681b      	ldr	r3, [r3, #0]
    1464:	3301      	adds	r3, #1
    1466:	4a05      	ldr	r2, [pc, #20]	; (147c <serial_cursor_right+0x20>)
    1468:	6013      	str	r3, [r2, #0]
	if (cursor_x>=screen_width){
    146a:	4b04      	ldr	r3, [pc, #16]	; (147c <serial_cursor_right+0x20>)
    146c:	681a      	ldr	r2, [r3, #0]
    146e:	4b04      	ldr	r3, [pc, #16]	; (1480 <serial_cursor_right+0x24>)
    1470:	681b      	ldr	r3, [r3, #0]
    1472:	429a      	cmp	r2, r3
    1474:	db01      	blt.n	147a <serial_cursor_right+0x1e>
		serial_cursor_crlf();
    1476:	f7ff ffb1 	bl	13dc <serial_cursor_crlf>
	}
}
    147a:	bd80      	pop	{r7, pc}
    147c:	200000b0 	.word	0x200000b0
    1480:	200000b8 	.word	0x200000b8

00001484 <serial_putc>:

static void serial_putc(char c){
    1484:	b580      	push	{r7, lr}
    1486:	b082      	sub	sp, #8
    1488:	af00      	add	r7, sp, #0
    148a:	4603      	mov	r3, r0
    148c:	71fb      	strb	r3, [r7, #7]
	vt_putc(c);
    148e:	79fb      	ldrb	r3, [r7, #7]
    1490:	4618      	mov	r0, r3
    1492:	f002 f9a5 	bl	37e0 <vt_putc>
	serial_cursor_right();
    1496:	f7ff ffe1 	bl	145c <serial_cursor_right>
}
    149a:	3708      	adds	r7, #8
    149c:	46bd      	mov	sp, r7
    149e:	bd80      	pop	{r7, pc}

000014a0 <serial_crlf>:

static void serial_crlf(){
    14a0:	b580      	push	{r7, lr}
    14a2:	af00      	add	r7, sp, #0
	vt_putc(CR);
    14a4:	200d      	movs	r0, #13
    14a6:	f002 f99b 	bl	37e0 <vt_putc>
	serial_cursor_crlf();
    14aa:	f7ff ff97 	bl	13dc <serial_cursor_crlf>
}
    14ae:	bd80      	pop	{r7, pc}

000014b0 <serial_clear_line>:

static void serial_clear_line(){
    14b0:	b580      	push	{r7, lr}
    14b2:	af00      	add	r7, sp, #0
	vt_clear_line(cursor_y+1);
    14b4:	4b03      	ldr	r3, [pc, #12]	; (14c4 <serial_clear_line+0x14>)
    14b6:	681b      	ldr	r3, [r3, #0]
    14b8:	3301      	adds	r3, #1
    14ba:	4618      	mov	r0, r3
    14bc:	f002 f9d0 	bl	3860 <vt_clear_line>
}
    14c0:	bd80      	pop	{r7, pc}
    14c2:	bf00      	nop
    14c4:	200000b4 	.word	0x200000b4

000014c8 <serial_clear_screen>:

static void serial_clear_screen(){
    14c8:	b580      	push	{r7, lr}
    14ca:	af00      	add	r7, sp, #0
	vt_cls();
    14cc:	f002 f9b8 	bl	3840 <vt_cls>
	cursor_home();
    14d0:	f7ff fdec 	bl	10ac <cursor_home>
}
    14d4:	bd80      	pop	{r7, pc}
    14d6:	bf00      	nop

000014d8 <queue_insert>:

//************************************************

static void queue_insert(char c){
    14d8:	b480      	push	{r7}
    14da:	b083      	sub	sp, #12
    14dc:	af00      	add	r7, sp, #0
    14de:	4603      	mov	r3, r0
    14e0:	71fb      	strb	r3, [r7, #7]
		con.queue[con.head++]=c;
    14e2:	4b0a      	ldr	r3, [pc, #40]	; (150c <queue_insert+0x34>)
    14e4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    14e6:	1c5a      	adds	r2, r3, #1
    14e8:	4908      	ldr	r1, [pc, #32]	; (150c <queue_insert+0x34>)
    14ea:	624a      	str	r2, [r1, #36]	; 0x24
    14ec:	4a07      	ldr	r2, [pc, #28]	; (150c <queue_insert+0x34>)
    14ee:	4413      	add	r3, r2
    14f0:	79fa      	ldrb	r2, [r7, #7]
    14f2:	705a      	strb	r2, [r3, #1]
		con.head&=CON_QUEUE_SIZE-1;
    14f4:	4b05      	ldr	r3, [pc, #20]	; (150c <queue_insert+0x34>)
    14f6:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    14f8:	f003 031f 	and.w	r3, r3, #31
    14fc:	4a03      	ldr	r2, [pc, #12]	; (150c <queue_insert+0x34>)
    14fe:	6253      	str	r3, [r2, #36]	; 0x24
}
    1500:	370c      	adds	r7, #12
    1502:	46bd      	mov	sp, r7
    1504:	f85d 7b04 	ldr.w	r7, [sp], #4
    1508:	4770      	bx	lr
    150a:	bf00      	nop
    150c:	20000100 	.word	0x20000100

00001510 <queue_getc>:

static char queue_getc(){
    1510:	b480      	push	{r7}
    1512:	b083      	sub	sp, #12
    1514:	af00      	add	r7, sp, #0
	char c=0;
    1516:	2300      	movs	r3, #0
    1518:	71fb      	strb	r3, [r7, #7]
	if (con.tail!=con.head){
    151a:	4b0e      	ldr	r3, [pc, #56]	; (1554 <queue_getc+0x44>)
    151c:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    151e:	4b0d      	ldr	r3, [pc, #52]	; (1554 <queue_getc+0x44>)
    1520:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1522:	429a      	cmp	r2, r3
    1524:	d00e      	beq.n	1544 <queue_getc+0x34>
		c=con.queue[con.tail++];
    1526:	4b0b      	ldr	r3, [pc, #44]	; (1554 <queue_getc+0x44>)
    1528:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    152a:	1c5a      	adds	r2, r3, #1
    152c:	4909      	ldr	r1, [pc, #36]	; (1554 <queue_getc+0x44>)
    152e:	628a      	str	r2, [r1, #40]	; 0x28
    1530:	4a08      	ldr	r2, [pc, #32]	; (1554 <queue_getc+0x44>)
    1532:	4413      	add	r3, r2
    1534:	785b      	ldrb	r3, [r3, #1]
    1536:	71fb      	strb	r3, [r7, #7]
		con.tail&=CON_QUEUE_SIZE-1;
    1538:	4b06      	ldr	r3, [pc, #24]	; (1554 <queue_getc+0x44>)
    153a:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    153c:	f003 031f 	and.w	r3, r3, #31
    1540:	4a04      	ldr	r2, [pc, #16]	; (1554 <queue_getc+0x44>)
    1542:	6293      	str	r3, [r2, #40]	; 0x28
	}
	return c;
    1544:	79fb      	ldrb	r3, [r7, #7]
}
    1546:	4618      	mov	r0, r3
    1548:	370c      	adds	r7, #12
    154a:	46bd      	mov	sp, r7
    154c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1550:	4770      	bx	lr
    1552:	bf00      	nop
    1554:	20000100 	.word	0x20000100

00001558 <con_queue_flush>:


void con_queue_flush(){
    1558:	b480      	push	{r7}
    155a:	af00      	add	r7, sp, #0
	con.tail=con.head=0;
    155c:	2300      	movs	r3, #0
    155e:	4a04      	ldr	r2, [pc, #16]	; (1570 <con_queue_flush+0x18>)
    1560:	6253      	str	r3, [r2, #36]	; 0x24
    1562:	4a03      	ldr	r2, [pc, #12]	; (1570 <con_queue_flush+0x18>)
    1564:	6293      	str	r3, [r2, #40]	; 0x28
}
    1566:	46bd      	mov	sp, r7
    1568:	f85d 7b04 	ldr.w	r7, [sp], #4
    156c:	4770      	bx	lr
    156e:	bf00      	nop
    1570:	20000100 	.word	0x20000100

00001574 <con_select>:

static const char PROMPT[]=" OK\n";

void con_select(console_dev_t dev){
    1574:	b580      	push	{r7, lr}
    1576:	b082      	sub	sp, #8
    1578:	af00      	add	r7, sp, #0
    157a:	4603      	mov	r3, r0
    157c:	71fb      	strb	r3, [r7, #7]
	con_queue_flush();
    157e:	f7ff ffeb 	bl	1558 <con_queue_flush>
	con.dev=dev;
    1582:	4a22      	ldr	r2, [pc, #136]	; (160c <con_select+0x98>)
    1584:	79fb      	ldrb	r3, [r7, #7]
    1586:	7013      	strb	r3, [r2, #0]
	if (con.dev==LOCAL){
    1588:	4b20      	ldr	r3, [pc, #128]	; (160c <con_select+0x98>)
    158a:	781b      	ldrb	r3, [r3, #0]
    158c:	2b00      	cmp	r3, #0
    158e:	d102      	bne.n	1596 <con_select+0x22>
		local_text_cursor(0);
    1590:	2000      	movs	r0, #0
    1592:	f7ff fec1 	bl	1318 <local_text_cursor>
	}
	cursor_home();
    1596:	f7ff fd89 	bl	10ac <cursor_home>
	if (dev==LOCAL){
    159a:	79fb      	ldrb	r3, [r7, #7]
    159c:	2b00      	cmp	r3, #0
    159e:	d118      	bne.n	15d2 <con_select+0x5e>
		screen_width=GDI_SCREEN_WIDTH;
    15a0:	4b1b      	ldr	r3, [pc, #108]	; (1610 <con_select+0x9c>)
    15a2:	2235      	movs	r2, #53	; 0x35
    15a4:	601a      	str	r2, [r3, #0]
		screen_height=GDI_SCREEN_HEIGHT;
    15a6:	4b1b      	ldr	r3, [pc, #108]	; (1614 <con_select+0xa0>)
    15a8:	221e      	movs	r2, #30
    15aa:	601a      	str	r2, [r3, #0]
		con.putc=local_putc;
    15ac:	4b17      	ldr	r3, [pc, #92]	; (160c <con_select+0x98>)
    15ae:	4a1a      	ldr	r2, [pc, #104]	; (1618 <con_select+0xa4>)
    15b0:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=local_clear_screen;
    15b2:	4b16      	ldr	r3, [pc, #88]	; (160c <con_select+0x98>)
    15b4:	4a19      	ldr	r2, [pc, #100]	; (161c <con_select+0xa8>)
    15b6:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=local_del_back;
    15b8:	4b14      	ldr	r3, [pc, #80]	; (160c <con_select+0x98>)
    15ba:	4a19      	ldr	r2, [pc, #100]	; (1620 <con_select+0xac>)
    15bc:	639a      	str	r2, [r3, #56]	; 0x38
		con.clrln=local_clear_line;
    15be:	4b13      	ldr	r3, [pc, #76]	; (160c <con_select+0x98>)
    15c0:	4a18      	ldr	r2, [pc, #96]	; (1624 <con_select+0xb0>)
    15c2:	641a      	str	r2, [r3, #64]	; 0x40
		con.crlf=local_crlf;
    15c4:	4b11      	ldr	r3, [pc, #68]	; (160c <con_select+0x98>)
    15c6:	4a18      	ldr	r2, [pc, #96]	; (1628 <con_select+0xb4>)
    15c8:	645a      	str	r2, [r3, #68]	; 0x44
		local_text_cursor(1);
    15ca:	2001      	movs	r0, #1
    15cc:	f7ff fea4 	bl	1318 <local_text_cursor>
    15d0:	e014      	b.n	15fc <con_select+0x88>
	}else{
		screen_width=VT_SCREEN_WIDTH;
    15d2:	4b0f      	ldr	r3, [pc, #60]	; (1610 <con_select+0x9c>)
    15d4:	2250      	movs	r2, #80	; 0x50
    15d6:	601a      	str	r2, [r3, #0]
		screen_height=VT_SCREEN_HEIGHT;
    15d8:	4b0e      	ldr	r3, [pc, #56]	; (1614 <con_select+0xa0>)
    15da:	2218      	movs	r2, #24
    15dc:	601a      	str	r2, [r3, #0]
		con.putc=serial_putc;
    15de:	4b0b      	ldr	r3, [pc, #44]	; (160c <con_select+0x98>)
    15e0:	4a12      	ldr	r2, [pc, #72]	; (162c <con_select+0xb8>)
    15e2:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=serial_clear_screen;
    15e4:	4b09      	ldr	r3, [pc, #36]	; (160c <con_select+0x98>)
    15e6:	4a12      	ldr	r2, [pc, #72]	; (1630 <con_select+0xbc>)
    15e8:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=vt_del_back;
    15ea:	4b08      	ldr	r3, [pc, #32]	; (160c <con_select+0x98>)
    15ec:	4a11      	ldr	r2, [pc, #68]	; (1634 <con_select+0xc0>)
    15ee:	639a      	str	r2, [r3, #56]	; 0x38
		con.clrln=serial_clear_line;
    15f0:	4b06      	ldr	r3, [pc, #24]	; (160c <con_select+0x98>)
    15f2:	4a11      	ldr	r2, [pc, #68]	; (1638 <con_select+0xc4>)
    15f4:	641a      	str	r2, [r3, #64]	; 0x40
		con.crlf=serial_crlf;
    15f6:	4b05      	ldr	r3, [pc, #20]	; (160c <con_select+0x98>)
    15f8:	4a10      	ldr	r2, [pc, #64]	; (163c <con_select+0xc8>)
    15fa:	645a      	str	r2, [r3, #68]	; 0x44
	}
	cls();
    15fc:	f000 fa52 	bl	1aa4 <cls>
	print(PROMPT);
    1600:	480f      	ldr	r0, [pc, #60]	; (1640 <con_select+0xcc>)
    1602:	f000 f895 	bl	1730 <print>
}
    1606:	3708      	adds	r7, #8
    1608:	46bd      	mov	sp, r7
    160a:	bd80      	pop	{r7, pc}
    160c:	20000100 	.word	0x20000100
    1610:	200000b8 	.word	0x200000b8
    1614:	200000bc 	.word	0x200000bc
    1618:	00001271 	.word	0x00001271
    161c:	000012f5 	.word	0x000012f5
    1620:	00001211 	.word	0x00001211
    1624:	000012bd 	.word	0x000012bd
    1628:	0000111d 	.word	0x0000111d
    162c:	00001485 	.word	0x00001485
    1630:	000014c9 	.word	0x000014c9
    1634:	00003801 	.word	0x00003801
    1638:	000014b1 	.word	0x000014b1
    163c:	000014a1 	.word	0x000014a1
    1640:	00003b3c 	.word	0x00003b3c

00001644 <console_init>:

void console_init(console_dev_t dev){
    1644:	b580      	push	{r7, lr}
    1646:	b082      	sub	sp, #8
    1648:	af00      	add	r7, sp, #0
    164a:	4603      	mov	r3, r0
    164c:	71fb      	strb	r3, [r7, #7]
	con.getc=queue_getc;
    164e:	4b06      	ldr	r3, [pc, #24]	; (1668 <console_init+0x24>)
    1650:	4a06      	ldr	r2, [pc, #24]	; (166c <console_init+0x28>)
    1652:	631a      	str	r2, [r3, #48]	; 0x30
	con.insert=queue_insert;
    1654:	4b04      	ldr	r3, [pc, #16]	; (1668 <console_init+0x24>)
    1656:	4a06      	ldr	r2, [pc, #24]	; (1670 <console_init+0x2c>)
    1658:	62da      	str	r2, [r3, #44]	; 0x2c
	con_select(dev);
    165a:	79fb      	ldrb	r3, [r7, #7]
    165c:	4618      	mov	r0, r3
    165e:	f7ff ff89 	bl	1574 <con_select>
}
    1662:	3708      	adds	r7, #8
    1664:	46bd      	mov	sp, r7
    1666:	bd80      	pop	{r7, pc}
    1668:	20000100 	.word	0x20000100
    166c:	00001511 	.word	0x00001511
    1670:	000014d9 	.word	0x000014d9

00001674 <conout>:


// envoie d'un caractère à la console
void conout(char c){
    1674:	b580      	push	{r7, lr}
    1676:	b082      	sub	sp, #8
    1678:	af00      	add	r7, sp, #0
    167a:	4603      	mov	r3, r0
    167c:	71fb      	strb	r3, [r7, #7]
	switch(c){
    167e:	79fb      	ldrb	r3, [r7, #7]
    1680:	3b08      	subs	r3, #8
    1682:	2b05      	cmp	r3, #5
    1684:	d83b      	bhi.n	16fe <conout+0x8a>
    1686:	a201      	add	r2, pc, #4	; (adr r2, 168c <conout+0x18>)
    1688:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    168c:	000016e3 	.word	0x000016e3
    1690:	000016ad 	.word	0x000016ad
    1694:	000016a5 	.word	0x000016a5
    1698:	000016ff 	.word	0x000016ff
    169c:	000016ff 	.word	0x000016ff
    16a0:	000016a5 	.word	0x000016a5
		case CR:
		case '\n':
			con.crlf();
    16a4:	4b1a      	ldr	r3, [pc, #104]	; (1710 <conout+0x9c>)
    16a6:	6c5b      	ldr	r3, [r3, #68]	; 0x44
    16a8:	4798      	blx	r3
			break;
    16aa:	e02d      	b.n	1708 <conout+0x94>
		case TAB:
			con.putc(SPACE);
    16ac:	4b18      	ldr	r3, [pc, #96]	; (1710 <conout+0x9c>)
    16ae:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    16b0:	2020      	movs	r0, #32
    16b2:	4798      	blx	r3
			if (!cursor_x){
    16b4:	4b17      	ldr	r3, [pc, #92]	; (1714 <conout+0xa0>)
    16b6:	681b      	ldr	r3, [r3, #0]
    16b8:	2b00      	cmp	r3, #0
    16ba:	d100      	bne.n	16be <conout+0x4a>
				break;
    16bc:	e024      	b.n	1708 <conout+0x94>
			}
			while (cursor_x%tab_width){
    16be:	e003      	b.n	16c8 <conout+0x54>
				con.putc(SPACE);
    16c0:	4b13      	ldr	r3, [pc, #76]	; (1710 <conout+0x9c>)
    16c2:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    16c4:	2020      	movs	r0, #32
    16c6:	4798      	blx	r3
		case TAB:
			con.putc(SPACE);
			if (!cursor_x){
				break;
			}
			while (cursor_x%tab_width){
    16c8:	4b12      	ldr	r3, [pc, #72]	; (1714 <conout+0xa0>)
    16ca:	681b      	ldr	r3, [r3, #0]
    16cc:	461a      	mov	r2, r3
    16ce:	4b12      	ldr	r3, [pc, #72]	; (1718 <conout+0xa4>)
    16d0:	681b      	ldr	r3, [r3, #0]
    16d2:	fbb2 f1f3 	udiv	r1, r2, r3
    16d6:	fb03 f301 	mul.w	r3, r3, r1
    16da:	1ad3      	subs	r3, r2, r3
    16dc:	2b00      	cmp	r3, #0
    16de:	d1ef      	bne.n	16c0 <conout+0x4c>
				con.putc(SPACE);
			}
			break;
    16e0:	e012      	b.n	1708 <conout+0x94>
		case BS:
			if (cursor_x){
    16e2:	4b0c      	ldr	r3, [pc, #48]	; (1714 <conout+0xa0>)
    16e4:	681b      	ldr	r3, [r3, #0]
    16e6:	2b00      	cmp	r3, #0
    16e8:	d008      	beq.n	16fc <conout+0x88>
				con.delete_back();
    16ea:	4b09      	ldr	r3, [pc, #36]	; (1710 <conout+0x9c>)
    16ec:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    16ee:	4798      	blx	r3
				cursor_x--;
    16f0:	4b08      	ldr	r3, [pc, #32]	; (1714 <conout+0xa0>)
    16f2:	681b      	ldr	r3, [r3, #0]
    16f4:	3b01      	subs	r3, #1
    16f6:	4a07      	ldr	r2, [pc, #28]	; (1714 <conout+0xa0>)
    16f8:	6013      	str	r3, [r2, #0]
			}
			break;
    16fa:	e005      	b.n	1708 <conout+0x94>
    16fc:	e004      	b.n	1708 <conout+0x94>
		default:
			con.putc(c);
    16fe:	4b04      	ldr	r3, [pc, #16]	; (1710 <conout+0x9c>)
    1700:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1702:	79fa      	ldrb	r2, [r7, #7]
    1704:	4610      	mov	r0, r2
    1706:	4798      	blx	r3
	}
}
    1708:	3708      	adds	r7, #8
    170a:	46bd      	mov	sp, r7
    170c:	bd80      	pop	{r7, pc}
    170e:	bf00      	nop
    1710:	20000100 	.word	0x20000100
    1714:	200000b0 	.word	0x200000b0
    1718:	20000004 	.word	0x20000004

0000171c <conin>:


// réception d'un caractère de la console
char conin(){
    171c:	b580      	push	{r7, lr}
    171e:	af00      	add	r7, sp, #0
	return con.getc();
    1720:	4b02      	ldr	r3, [pc, #8]	; (172c <conin+0x10>)
    1722:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    1724:	4798      	blx	r3
    1726:	4603      	mov	r3, r0
}
    1728:	4618      	mov	r0, r3
    172a:	bd80      	pop	{r7, pc}
    172c:	20000100 	.word	0x20000100

00001730 <print>:

// imprime un chaîne sur la console
void print(const char *str){
    1730:	b580      	push	{r7, lr}
    1732:	b082      	sub	sp, #8
    1734:	af00      	add	r7, sp, #0
    1736:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
    1738:	e006      	b.n	1748 <print+0x18>
    173a:	687b      	ldr	r3, [r7, #4]
    173c:	1c5a      	adds	r2, r3, #1
    173e:	607a      	str	r2, [r7, #4]
    1740:	781b      	ldrb	r3, [r3, #0]
    1742:	4618      	mov	r0, r3
    1744:	f7ff ff96 	bl	1674 <conout>
    1748:	687b      	ldr	r3, [r7, #4]
    174a:	781b      	ldrb	r3, [r3, #0]
    174c:	2b00      	cmp	r3, #0
    174e:	d1f4      	bne.n	173a <print+0xa>
}
    1750:	3708      	adds	r7, #8
    1752:	46bd      	mov	sp, r7
    1754:	bd80      	pop	{r7, pc}
    1756:	bf00      	nop

00001758 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    1758:	b580      	push	{r7, lr}
    175a:	af00      	add	r7, sp, #0
	con.delete_back();
    175c:	4b01      	ldr	r3, [pc, #4]	; (1764 <delete_back+0xc>)
    175e:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1760:	4798      	blx	r3
}
    1762:	bd80      	pop	{r7, pc}
    1764:	20000100 	.word	0x20000100

00001768 <beep>:

static void beep(){
    1768:	b480      	push	{r7}
    176a:	af00      	add	r7, sp, #0
}
    176c:	46bd      	mov	sp, r7
    176e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1772:	4770      	bx	lr

00001774 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    1774:	b580      	push	{r7, lr}
    1776:	b084      	sub	sp, #16
    1778:	af00      	add	r7, sp, #0
    177a:	6078      	str	r0, [r7, #4]
    177c:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    177e:	2300      	movs	r3, #0
    1780:	60fb      	str	r3, [r7, #12]
	char c=0;
    1782:	2300      	movs	r3, #0
    1784:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    1786:	683b      	ldr	r3, [r7, #0]
    1788:	3b01      	subs	r3, #1
    178a:	603b      	str	r3, [r7, #0]
	if (buf_len>(screen_width-cursor_x)){
    178c:	4b5a      	ldr	r3, [pc, #360]	; (18f8 <read_line+0x184>)
    178e:	681a      	ldr	r2, [r3, #0]
    1790:	4b5a      	ldr	r3, [pc, #360]	; (18fc <read_line+0x188>)
    1792:	681b      	ldr	r3, [r3, #0]
    1794:	1ad3      	subs	r3, r2, r3
    1796:	461a      	mov	r2, r3
    1798:	683b      	ldr	r3, [r7, #0]
    179a:	429a      	cmp	r2, r3
    179c:	d205      	bcs.n	17aa <read_line+0x36>
		buf_len=screen_width-cursor_x;
    179e:	4b56      	ldr	r3, [pc, #344]	; (18f8 <read_line+0x184>)
    17a0:	681a      	ldr	r2, [r3, #0]
    17a2:	4b56      	ldr	r3, [pc, #344]	; (18fc <read_line+0x188>)
    17a4:	681b      	ldr	r3, [r3, #0]
    17a6:	1ad3      	subs	r3, r2, r3
    17a8:	603b      	str	r3, [r7, #0]
	}
	while (c!=CR){
    17aa:	e097      	b.n	18dc <read_line+0x168>
			c=con.getc();
    17ac:	4b54      	ldr	r3, [pc, #336]	; (1900 <read_line+0x18c>)
    17ae:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    17b0:	4798      	blx	r3
    17b2:	4603      	mov	r3, r0
    17b4:	72fb      	strb	r3, [r7, #11]
			switch(c){
    17b6:	7afb      	ldrb	r3, [r7, #11]
    17b8:	2b18      	cmp	r3, #24
    17ba:	d879      	bhi.n	18b0 <read_line+0x13c>
    17bc:	a201      	add	r2, pc, #4	; (adr r2, 17c4 <read_line+0x50>)
    17be:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    17c2:	bf00      	nop
    17c4:	000018dd 	.word	0x000018dd
    17c8:	000018b1 	.word	0x000018b1
    17cc:	000018b1 	.word	0x000018b1
    17d0:	000018b1 	.word	0x000018b1
    17d4:	000018b1 	.word	0x000018b1
    17d8:	000018a1 	.word	0x000018a1
    17dc:	000018b1 	.word	0x000018b1
    17e0:	000018b1 	.word	0x000018b1
    17e4:	0000188d 	.word	0x0000188d
    17e8:	000018ad 	.word	0x000018ad
    17ec:	00001829 	.word	0x00001829
    17f0:	000018b1 	.word	0x000018b1
    17f4:	000018b1 	.word	0x000018b1
    17f8:	00001829 	.word	0x00001829
    17fc:	000018b1 	.word	0x000018b1
    1800:	000018b1 	.word	0x000018b1
    1804:	000018b1 	.word	0x000018b1
    1808:	000018b1 	.word	0x000018b1
    180c:	000018b1 	.word	0x000018b1
    1810:	000018b1 	.word	0x000018b1
    1814:	000018b1 	.word	0x000018b1
    1818:	00001841 	.word	0x00001841
    181c:	000018b1 	.word	0x000018b1
    1820:	00001855 	.word	0x00001855
    1824:	00001841 	.word	0x00001841
			case NUL:
				break;
			case CR:
			case LF:
				c=CR;
    1828:	230d      	movs	r3, #13
    182a:	72fb      	strb	r3, [r7, #11]
				con.crlf();
    182c:	4b34      	ldr	r3, [pc, #208]	; (1900 <read_line+0x18c>)
    182e:	6c5b      	ldr	r3, [r3, #68]	; 0x44
    1830:	4798      	blx	r3
				break;
    1832:	e053      	b.n	18dc <read_line+0x168>
			case CTRL_X:
			case CTRL_U:
				while (line_len){con.delete_back();line_len--;}
    1834:	4b32      	ldr	r3, [pc, #200]	; (1900 <read_line+0x18c>)
    1836:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1838:	4798      	blx	r3
    183a:	68fb      	ldr	r3, [r7, #12]
    183c:	3b01      	subs	r3, #1
    183e:	60fb      	str	r3, [r7, #12]
    1840:	68fb      	ldr	r3, [r7, #12]
    1842:	2b00      	cmp	r3, #0
    1844:	d1f6      	bne.n	1834 <read_line+0xc0>
				//con.clear_line(line_len);
				//line_len=0;
				break;
    1846:	e049      	b.n	18dc <read_line+0x168>
			case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
    1848:	4b2d      	ldr	r3, [pc, #180]	; (1900 <read_line+0x18c>)
    184a:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    184c:	4798      	blx	r3
					line_len--;
    184e:	68fb      	ldr	r3, [r7, #12]
    1850:	3b01      	subs	r3, #1
    1852:	60fb      	str	r3, [r7, #12]
				while (line_len){con.delete_back();line_len--;}
				//con.clear_line(line_len);
				//line_len=0;
				break;
			case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    1854:	68fb      	ldr	r3, [r7, #12]
    1856:	2b00      	cmp	r3, #0
    1858:	d006      	beq.n	1868 <read_line+0xf4>
    185a:	68fb      	ldr	r3, [r7, #12]
    185c:	3b01      	subs	r3, #1
    185e:	687a      	ldr	r2, [r7, #4]
    1860:	4413      	add	r3, r2
    1862:	781b      	ldrb	r3, [r3, #0]
    1864:	2b20      	cmp	r3, #32
    1866:	d0ef      	beq.n	1848 <read_line+0xd4>
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1868:	e005      	b.n	1876 <read_line+0x102>
					con.delete_back();
    186a:	4b25      	ldr	r3, [pc, #148]	; (1900 <read_line+0x18c>)
    186c:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    186e:	4798      	blx	r3
					line_len--;
    1870:	68fb      	ldr	r3, [r7, #12]
    1872:	3b01      	subs	r3, #1
    1874:	60fb      	str	r3, [r7, #12]
			case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1876:	68fb      	ldr	r3, [r7, #12]
    1878:	2b00      	cmp	r3, #0
    187a:	d006      	beq.n	188a <read_line+0x116>
    187c:	68fb      	ldr	r3, [r7, #12]
    187e:	3b01      	subs	r3, #1
    1880:	687a      	ldr	r2, [r7, #4]
    1882:	4413      	add	r3, r2
    1884:	781b      	ldrb	r3, [r3, #0]
    1886:	2b20      	cmp	r3, #32
    1888:	d1ef      	bne.n	186a <read_line+0xf6>
					con.delete_back();
					line_len--;
				}
				break;
    188a:	e027      	b.n	18dc <read_line+0x168>
			case BS:
				if (line_len){
    188c:	68fb      	ldr	r3, [r7, #12]
    188e:	2b00      	cmp	r3, #0
    1890:	d005      	beq.n	189e <read_line+0x12a>
					con.delete_back();
    1892:	4b1b      	ldr	r3, [pc, #108]	; (1900 <read_line+0x18c>)
    1894:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1896:	4798      	blx	r3
					line_len--;
    1898:	68fb      	ldr	r3, [r7, #12]
    189a:	3b01      	subs	r3, #1
    189c:	60fb      	str	r3, [r7, #12]
				}
				break;
    189e:	e01d      	b.n	18dc <read_line+0x168>
			case CTRL_E:
				con.cls();
    18a0:	4b17      	ldr	r3, [pc, #92]	; (1900 <read_line+0x18c>)
    18a2:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    18a4:	4798      	blx	r3
				line_len=0;
    18a6:	2300      	movs	r3, #0
    18a8:	60fb      	str	r3, [r7, #12]
				break;
    18aa:	e017      	b.n	18dc <read_line+0x168>
			case TAB:
				c=SPACE;
    18ac:	2320      	movs	r3, #32
    18ae:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    18b0:	68fa      	ldr	r2, [r7, #12]
    18b2:	683b      	ldr	r3, [r7, #0]
    18b4:	429a      	cmp	r2, r3
    18b6:	d20f      	bcs.n	18d8 <read_line+0x164>
    18b8:	7afb      	ldrb	r3, [r7, #11]
    18ba:	2b1f      	cmp	r3, #31
    18bc:	d90c      	bls.n	18d8 <read_line+0x164>
					buffer[line_len++]=c;
    18be:	68fb      	ldr	r3, [r7, #12]
    18c0:	1c5a      	adds	r2, r3, #1
    18c2:	60fa      	str	r2, [r7, #12]
    18c4:	687a      	ldr	r2, [r7, #4]
    18c6:	4413      	add	r3, r2
    18c8:	7afa      	ldrb	r2, [r7, #11]
    18ca:	701a      	strb	r2, [r3, #0]
					con.putc(c);
    18cc:	4b0c      	ldr	r3, [pc, #48]	; (1900 <read_line+0x18c>)
    18ce:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    18d0:	7afa      	ldrb	r2, [r7, #11]
    18d2:	4610      	mov	r0, r2
    18d4:	4798      	blx	r3
    18d6:	e001      	b.n	18dc <read_line+0x168>
				}else{
					beep();
    18d8:	f7ff ff46 	bl	1768 <beep>
	
	buf_len--;
	if (buf_len>(screen_width-cursor_x)){
		buf_len=screen_width-cursor_x;
	}
	while (c!=CR){
    18dc:	7afb      	ldrb	r3, [r7, #11]
    18de:	2b0d      	cmp	r3, #13
    18e0:	f47f af64 	bne.w	17ac <read_line+0x38>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    18e4:	687a      	ldr	r2, [r7, #4]
    18e6:	68fb      	ldr	r3, [r7, #12]
    18e8:	4413      	add	r3, r2
    18ea:	2200      	movs	r2, #0
    18ec:	701a      	strb	r2, [r3, #0]
	return line_len;
    18ee:	68fb      	ldr	r3, [r7, #12]
}
    18f0:	4618      	mov	r0, r3
    18f2:	3710      	adds	r7, #16
    18f4:	46bd      	mov	sp, r7
    18f6:	bd80      	pop	{r7, pc}
    18f8:	200000b8 	.word	0x200000b8
    18fc:	200000b0 	.word	0x200000b0
    1900:	20000100 	.word	0x20000100

00001904 <print_int>:

// imprime un entier
// i entier à imprimer
// base  numérique
void print_int(int i, unsigned base){
    1904:	b580      	push	{r7, lr}
    1906:	b08e      	sub	sp, #56	; 0x38
    1908:	af00      	add	r7, sp, #0
    190a:	6078      	str	r0, [r7, #4]
    190c:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    190e:	2301      	movs	r3, #1
    1910:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    1912:	2322      	movs	r3, #34	; 0x22
    1914:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    1916:	2300      	movs	r3, #0
    1918:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    191c:	687b      	ldr	r3, [r7, #4]
    191e:	2b00      	cmp	r3, #0
    1920:	da05      	bge.n	192e <print_int+0x2a>
    1922:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1926:	637b      	str	r3, [r7, #52]	; 0x34
    1928:	687b      	ldr	r3, [r7, #4]
    192a:	425b      	negs	r3, r3
    192c:	607b      	str	r3, [r7, #4]
	while (i){
    192e:	e02c      	b.n	198a <print_int+0x86>
		fmt[pos]=i%base+'0';
    1930:	687b      	ldr	r3, [r7, #4]
    1932:	683a      	ldr	r2, [r7, #0]
    1934:	fbb3 f2f2 	udiv	r2, r3, r2
    1938:	6839      	ldr	r1, [r7, #0]
    193a:	fb01 f202 	mul.w	r2, r1, r2
    193e:	1a9b      	subs	r3, r3, r2
    1940:	b2db      	uxtb	r3, r3
    1942:	3330      	adds	r3, #48	; 0x30
    1944:	b2d9      	uxtb	r1, r3
    1946:	f107 020c 	add.w	r2, r7, #12
    194a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    194c:	4413      	add	r3, r2
    194e:	460a      	mov	r2, r1
    1950:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    1952:	f107 020c 	add.w	r2, r7, #12
    1956:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1958:	4413      	add	r3, r2
    195a:	781b      	ldrb	r3, [r3, #0]
    195c:	2b39      	cmp	r3, #57	; 0x39
    195e:	d90c      	bls.n	197a <print_int+0x76>
    1960:	f107 020c 	add.w	r2, r7, #12
    1964:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1966:	4413      	add	r3, r2
    1968:	781b      	ldrb	r3, [r3, #0]
    196a:	3307      	adds	r3, #7
    196c:	b2d9      	uxtb	r1, r3
    196e:	f107 020c 	add.w	r2, r7, #12
    1972:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1974:	4413      	add	r3, r2
    1976:	460a      	mov	r2, r1
    1978:	701a      	strb	r2, [r3, #0]
		pos--;
    197a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    197c:	3b01      	subs	r3, #1
    197e:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    1980:	687a      	ldr	r2, [r7, #4]
    1982:	683b      	ldr	r3, [r7, #0]
    1984:	fbb2 f3f3 	udiv	r3, r2, r3
    1988:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    198a:	687b      	ldr	r3, [r7, #4]
    198c:	2b00      	cmp	r3, #0
    198e:	d1cf      	bne.n	1930 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    1990:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1992:	2b22      	cmp	r3, #34	; 0x22
    1994:	d108      	bne.n	19a8 <print_int+0xa4>
    1996:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1998:	1e5a      	subs	r2, r3, #1
    199a:	633a      	str	r2, [r7, #48]	; 0x30
    199c:	f107 0238 	add.w	r2, r7, #56	; 0x38
    19a0:	4413      	add	r3, r2
    19a2:	2230      	movs	r2, #48	; 0x30
    19a4:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    19a8:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    19aa:	2b00      	cmp	r3, #0
    19ac:	da08      	bge.n	19c0 <print_int+0xbc>
    19ae:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19b0:	1e5a      	subs	r2, r3, #1
    19b2:	633a      	str	r2, [r7, #48]	; 0x30
    19b4:	f107 0238 	add.w	r2, r7, #56	; 0x38
    19b8:	4413      	add	r3, r2
    19ba:	222d      	movs	r2, #45	; 0x2d
    19bc:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    19c0:	f107 020c 	add.w	r2, r7, #12
    19c4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19c6:	4413      	add	r3, r2
    19c8:	2220      	movs	r2, #32
    19ca:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    19cc:	f107 020c 	add.w	r2, r7, #12
    19d0:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19d2:	4413      	add	r3, r2
    19d4:	4618      	mov	r0, r3
    19d6:	f7ff feab 	bl	1730 <print>
}
    19da:	3738      	adds	r7, #56	; 0x38
    19dc:	46bd      	mov	sp, r7
    19de:	bd80      	pop	{r7, pc}

000019e0 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    19e0:	b580      	push	{r7, lr}
    19e2:	b088      	sub	sp, #32
    19e4:	af00      	add	r7, sp, #0
    19e6:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    19e8:	230c      	movs	r3, #12
    19ea:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    19ec:	2300      	movs	r3, #0
    19ee:	767b      	strb	r3, [r7, #25]
	while (u){
    19f0:	e026      	b.n	1a40 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    19f2:	687b      	ldr	r3, [r7, #4]
    19f4:	b2db      	uxtb	r3, r3
    19f6:	f003 030f 	and.w	r3, r3, #15
    19fa:	b2db      	uxtb	r3, r3
    19fc:	3330      	adds	r3, #48	; 0x30
    19fe:	b2d9      	uxtb	r1, r3
    1a00:	f107 020c 	add.w	r2, r7, #12
    1a04:	69fb      	ldr	r3, [r7, #28]
    1a06:	4413      	add	r3, r2
    1a08:	460a      	mov	r2, r1
    1a0a:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1a0c:	f107 020c 	add.w	r2, r7, #12
    1a10:	69fb      	ldr	r3, [r7, #28]
    1a12:	4413      	add	r3, r2
    1a14:	781b      	ldrb	r3, [r3, #0]
    1a16:	2b39      	cmp	r3, #57	; 0x39
    1a18:	d90c      	bls.n	1a34 <print_hex+0x54>
    1a1a:	f107 020c 	add.w	r2, r7, #12
    1a1e:	69fb      	ldr	r3, [r7, #28]
    1a20:	4413      	add	r3, r2
    1a22:	781b      	ldrb	r3, [r3, #0]
    1a24:	3307      	adds	r3, #7
    1a26:	b2d9      	uxtb	r1, r3
    1a28:	f107 020c 	add.w	r2, r7, #12
    1a2c:	69fb      	ldr	r3, [r7, #28]
    1a2e:	4413      	add	r3, r2
    1a30:	460a      	mov	r2, r1
    1a32:	701a      	strb	r2, [r3, #0]
		pos--;
    1a34:	69fb      	ldr	r3, [r7, #28]
    1a36:	3b01      	subs	r3, #1
    1a38:	61fb      	str	r3, [r7, #28]
		u/=16;
    1a3a:	687b      	ldr	r3, [r7, #4]
    1a3c:	091b      	lsrs	r3, r3, #4
    1a3e:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    1a40:	687b      	ldr	r3, [r7, #4]
    1a42:	2b00      	cmp	r3, #0
    1a44:	d1d5      	bne.n	19f2 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    1a46:	69fb      	ldr	r3, [r7, #28]
    1a48:	2b0c      	cmp	r3, #12
    1a4a:	d108      	bne.n	1a5e <print_hex+0x7e>
    1a4c:	69fb      	ldr	r3, [r7, #28]
    1a4e:	1e5a      	subs	r2, r3, #1
    1a50:	61fa      	str	r2, [r7, #28]
    1a52:	f107 0220 	add.w	r2, r7, #32
    1a56:	4413      	add	r3, r2
    1a58:	2230      	movs	r2, #48	; 0x30
    1a5a:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    1a5e:	69fb      	ldr	r3, [r7, #28]
    1a60:	1e5a      	subs	r2, r3, #1
    1a62:	61fa      	str	r2, [r7, #28]
    1a64:	f107 0220 	add.w	r2, r7, #32
    1a68:	4413      	add	r3, r2
    1a6a:	2278      	movs	r2, #120	; 0x78
    1a6c:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    1a70:	69fb      	ldr	r3, [r7, #28]
    1a72:	1e5a      	subs	r2, r3, #1
    1a74:	61fa      	str	r2, [r7, #28]
    1a76:	f107 0220 	add.w	r2, r7, #32
    1a7a:	4413      	add	r3, r2
    1a7c:	2230      	movs	r2, #48	; 0x30
    1a7e:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    1a82:	f107 020c 	add.w	r2, r7, #12
    1a86:	69fb      	ldr	r3, [r7, #28]
    1a88:	4413      	add	r3, r2
    1a8a:	2220      	movs	r2, #32
    1a8c:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1a8e:	f107 020c 	add.w	r2, r7, #12
    1a92:	69fb      	ldr	r3, [r7, #28]
    1a94:	4413      	add	r3, r2
    1a96:	4618      	mov	r0, r3
    1a98:	f7ff fe4a 	bl	1730 <print>
}
    1a9c:	3720      	adds	r7, #32
    1a9e:	46bd      	mov	sp, r7
    1aa0:	bd80      	pop	{r7, pc}
    1aa2:	bf00      	nop

00001aa4 <cls>:

void cls(){
    1aa4:	b580      	push	{r7, lr}
    1aa6:	af00      	add	r7, sp, #0
	con.cls();
    1aa8:	4b01      	ldr	r3, [pc, #4]	; (1ab0 <cls+0xc>)
    1aaa:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    1aac:	4798      	blx	r3
}
    1aae:	bd80      	pop	{r7, pc}
    1ab0:	20000100 	.word	0x20000100

00001ab4 <TIM4_handler>:

// interruption clignotement
// curseur texte
void CURSOR_blink_handler(){
    1ab4:	b580      	push	{r7, lr}
    1ab6:	b082      	sub	sp, #8
    1ab8:	af02      	add	r7, sp, #8
	//CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
	if (CURSOR_TMR->SR&BIT0){ // UIF
    1aba:	4b12      	ldr	r3, [pc, #72]	; (1b04 <TIM4_handler+0x50>)
    1abc:	691b      	ldr	r3, [r3, #16]
    1abe:	f003 0301 	and.w	r3, r3, #1
    1ac2:	2b00      	cmp	r3, #0
    1ac4:	d01c      	beq.n	1b00 <TIM4_handler+0x4c>
		CURSOR_TMR->SR&=~BIT0;
    1ac6:	4a0f      	ldr	r2, [pc, #60]	; (1b04 <TIM4_handler+0x50>)
    1ac8:	4b0e      	ldr	r3, [pc, #56]	; (1b04 <TIM4_handler+0x50>)
    1aca:	691b      	ldr	r3, [r3, #16]
    1acc:	f023 0301 	bic.w	r3, r3, #1
    1ad0:	6113      	str	r3, [r2, #16]
		gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    1ad2:	4b0d      	ldr	r3, [pc, #52]	; (1b08 <TIM4_handler+0x54>)
    1ad4:	681a      	ldr	r2, [r3, #0]
    1ad6:	4613      	mov	r3, r2
    1ad8:	005b      	lsls	r3, r3, #1
    1ada:	4413      	add	r3, r2
    1adc:	005b      	lsls	r3, r3, #1
    1ade:	4619      	mov	r1, r3
    1ae0:	4b0a      	ldr	r3, [pc, #40]	; (1b0c <TIM4_handler+0x58>)
    1ae2:	681b      	ldr	r3, [r3, #0]
    1ae4:	00da      	lsls	r2, r3, #3
    1ae6:	2302      	movs	r3, #2
    1ae8:	9300      	str	r3, [sp, #0]
    1aea:	4608      	mov	r0, r1
    1aec:	4611      	mov	r1, r2
    1aee:	2206      	movs	r2, #6
    1af0:	2308      	movs	r3, #8
    1af2:	f000 f98d 	bl	1e10 <gdi_box>
		cursor_visible=~cursor_visible;
    1af6:	4b06      	ldr	r3, [pc, #24]	; (1b10 <TIM4_handler+0x5c>)
    1af8:	681b      	ldr	r3, [r3, #0]
    1afa:	43db      	mvns	r3, r3
    1afc:	4a04      	ldr	r2, [pc, #16]	; (1b10 <TIM4_handler+0x5c>)
    1afe:	6013      	str	r3, [r2, #0]
	}
}
    1b00:	46bd      	mov	sp, r7
    1b02:	bd80      	pop	{r7, pc}
    1b04:	40000800 	.word	0x40000800
    1b08:	200000b0 	.word	0x200000b0
    1b0c:	200000b4 	.word	0x200000b4
    1b10:	200000c0 	.word	0x200000c0

00001b14 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    1b14:	b480      	push	{r7}
    1b16:	af00      	add	r7, sp, #0
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
    1b18:	4b13      	ldr	r3, [pc, #76]	; (1b68 <flash_enable+0x54>)
    1b1a:	681b      	ldr	r3, [r3, #0]
    1b1c:	f003 0301 	and.w	r3, r3, #1
    1b20:	2b00      	cmp	r3, #0
    1b22:	d10c      	bne.n	1b3e <flash_enable+0x2a>
		RCC->CR|=RCC_CR_HSION;
    1b24:	4a10      	ldr	r2, [pc, #64]	; (1b68 <flash_enable+0x54>)
    1b26:	4b10      	ldr	r3, [pc, #64]	; (1b68 <flash_enable+0x54>)
    1b28:	681b      	ldr	r3, [r3, #0]
    1b2a:	f043 0301 	orr.w	r3, r3, #1
    1b2e:	6013      	str	r3, [r2, #0]
		while (!(RCC->CR&RCC_CR_HSIRDY));
    1b30:	bf00      	nop
    1b32:	4b0d      	ldr	r3, [pc, #52]	; (1b68 <flash_enable+0x54>)
    1b34:	681b      	ldr	r3, [r3, #0]
    1b36:	f003 0302 	and.w	r3, r3, #2
    1b3a:	2b00      	cmp	r3, #0
    1b3c:	d0f9      	beq.n	1b32 <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    1b3e:	4b0b      	ldr	r3, [pc, #44]	; (1b6c <flash_enable+0x58>)
    1b40:	4a0b      	ldr	r2, [pc, #44]	; (1b70 <flash_enable+0x5c>)
    1b42:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    1b44:	4b09      	ldr	r3, [pc, #36]	; (1b6c <flash_enable+0x58>)
    1b46:	4a0b      	ldr	r2, [pc, #44]	; (1b74 <flash_enable+0x60>)
    1b48:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    1b4a:	4b08      	ldr	r3, [pc, #32]	; (1b6c <flash_enable+0x58>)
    1b4c:	691b      	ldr	r3, [r3, #16]
    1b4e:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1b52:	2b00      	cmp	r3, #0
    1b54:	bf0c      	ite	eq
    1b56:	2301      	moveq	r3, #1
    1b58:	2300      	movne	r3, #0
    1b5a:	b2db      	uxtb	r3, r3
}
    1b5c:	4618      	mov	r0, r3
    1b5e:	46bd      	mov	sp, r7
    1b60:	f85d 7b04 	ldr.w	r7, [sp], #4
    1b64:	4770      	bx	lr
    1b66:	bf00      	nop
    1b68:	40021000 	.word	0x40021000
    1b6c:	40022000 	.word	0x40022000
    1b70:	45670123 	.word	0x45670123
    1b74:	cdef89ab 	.word	0xcdef89ab

00001b78 <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    1b78:	b480      	push	{r7}
    1b7a:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    1b7c:	4a04      	ldr	r2, [pc, #16]	; (1b90 <flash_disable+0x18>)
    1b7e:	4b04      	ldr	r3, [pc, #16]	; (1b90 <flash_disable+0x18>)
    1b80:	691b      	ldr	r3, [r3, #16]
    1b82:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    1b86:	6113      	str	r3, [r2, #16]
}
    1b88:	46bd      	mov	sp, r7
    1b8a:	f85d 7b04 	ldr.w	r7, [sp], #4
    1b8e:	4770      	bx	lr
    1b90:	40022000 	.word	0x40022000

00001b94 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1b94:	b480      	push	{r7}
    1b96:	b083      	sub	sp, #12
    1b98:	af00      	add	r7, sp, #0
    1b9a:	6078      	str	r0, [r7, #4]
    1b9c:	460b      	mov	r3, r1
    1b9e:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    1ba0:	4b1d      	ldr	r3, [pc, #116]	; (1c18 <flash_write+0x84>)
    1ba2:	691b      	ldr	r3, [r3, #16]
    1ba4:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1ba8:	2b00      	cmp	r3, #0
    1baa:	d105      	bne.n	1bb8 <flash_write+0x24>
    1bac:	687b      	ldr	r3, [r7, #4]
    1bae:	881b      	ldrh	r3, [r3, #0]
    1bb0:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1bb4:	4293      	cmp	r3, r2
    1bb6:	d001      	beq.n	1bbc <flash_write+0x28>
    1bb8:	2300      	movs	r3, #0
    1bba:	e027      	b.n	1c0c <flash_write+0x78>
	while (_flash_busy);
    1bbc:	bf00      	nop
    1bbe:	4b16      	ldr	r3, [pc, #88]	; (1c18 <flash_write+0x84>)
    1bc0:	68db      	ldr	r3, [r3, #12]
    1bc2:	f003 0301 	and.w	r3, r3, #1
    1bc6:	2b00      	cmp	r3, #0
    1bc8:	d1f9      	bne.n	1bbe <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1bca:	4a13      	ldr	r2, [pc, #76]	; (1c18 <flash_write+0x84>)
    1bcc:	4b12      	ldr	r3, [pc, #72]	; (1c18 <flash_write+0x84>)
    1bce:	68db      	ldr	r3, [r3, #12]
    1bd0:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1bd4:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    1bd6:	4b10      	ldr	r3, [pc, #64]	; (1c18 <flash_write+0x84>)
    1bd8:	2201      	movs	r2, #1
    1bda:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    1bdc:	687b      	ldr	r3, [r7, #4]
    1bde:	887a      	ldrh	r2, [r7, #2]
    1be0:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    1be2:	bf00      	nop
    1be4:	4b0c      	ldr	r3, [pc, #48]	; (1c18 <flash_write+0x84>)
    1be6:	68db      	ldr	r3, [r3, #12]
    1be8:	f003 0301 	and.w	r3, r3, #1
    1bec:	2b00      	cmp	r3, #0
    1bee:	d005      	beq.n	1bfc <flash_write+0x68>
    1bf0:	4b09      	ldr	r3, [pc, #36]	; (1c18 <flash_write+0x84>)
    1bf2:	68db      	ldr	r3, [r3, #12]
    1bf4:	f003 0320 	and.w	r3, r3, #32
    1bf8:	2b00      	cmp	r3, #0
    1bfa:	d0f3      	beq.n	1be4 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    1bfc:	687b      	ldr	r3, [r7, #4]
    1bfe:	881b      	ldrh	r3, [r3, #0]
    1c00:	887a      	ldrh	r2, [r7, #2]
    1c02:	429a      	cmp	r2, r3
    1c04:	bf0c      	ite	eq
    1c06:	2301      	moveq	r3, #1
    1c08:	2300      	movne	r3, #0
    1c0a:	b2db      	uxtb	r3, r3
}
    1c0c:	4618      	mov	r0, r3
    1c0e:	370c      	adds	r7, #12
    1c10:	46bd      	mov	sp, r7
    1c12:	f85d 7b04 	ldr.w	r7, [sp], #4
    1c16:	4770      	bx	lr
    1c18:	40022000 	.word	0x40022000

00001c1c <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    1c1c:	b480      	push	{r7}
    1c1e:	b087      	sub	sp, #28
    1c20:	af00      	add	r7, sp, #0
    1c22:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    1c24:	4b27      	ldr	r3, [pc, #156]	; (1cc4 <flash_erase_page+0xa8>)
    1c26:	691b      	ldr	r3, [r3, #16]
    1c28:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1c2c:	2b00      	cmp	r3, #0
    1c2e:	d001      	beq.n	1c34 <flash_erase_page+0x18>
    1c30:	2300      	movs	r3, #0
    1c32:	e040      	b.n	1cb6 <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1c34:	4a23      	ldr	r2, [pc, #140]	; (1cc4 <flash_erase_page+0xa8>)
    1c36:	4b23      	ldr	r3, [pc, #140]	; (1cc4 <flash_erase_page+0xa8>)
    1c38:	68db      	ldr	r3, [r3, #12]
    1c3a:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1c3e:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    1c40:	687b      	ldr	r3, [r7, #4]
    1c42:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    1c46:	f023 0303 	bic.w	r3, r3, #3
    1c4a:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    1c4c:	4b1d      	ldr	r3, [pc, #116]	; (1cc4 <flash_erase_page+0xa8>)
    1c4e:	2202      	movs	r2, #2
    1c50:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    1c52:	4a1c      	ldr	r2, [pc, #112]	; (1cc4 <flash_erase_page+0xa8>)
    1c54:	687b      	ldr	r3, [r7, #4]
    1c56:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    1c58:	4a1a      	ldr	r2, [pc, #104]	; (1cc4 <flash_erase_page+0xa8>)
    1c5a:	4b1a      	ldr	r3, [pc, #104]	; (1cc4 <flash_erase_page+0xa8>)
    1c5c:	691b      	ldr	r3, [r3, #16]
    1c5e:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1c62:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    1c64:	bf00      	nop
    1c66:	4b17      	ldr	r3, [pc, #92]	; (1cc4 <flash_erase_page+0xa8>)
    1c68:	68db      	ldr	r3, [r3, #12]
    1c6a:	f003 0301 	and.w	r3, r3, #1
    1c6e:	2b00      	cmp	r3, #0
    1c70:	d005      	beq.n	1c7e <flash_erase_page+0x62>
    1c72:	4b14      	ldr	r3, [pc, #80]	; (1cc4 <flash_erase_page+0xa8>)
    1c74:	68db      	ldr	r3, [r3, #12]
    1c76:	f003 0320 	and.w	r3, r3, #32
    1c7a:	2b00      	cmp	r3, #0
    1c7c:	d0f3      	beq.n	1c66 <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    1c7e:	687b      	ldr	r3, [r7, #4]
    1c80:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    1c82:	2300      	movs	r3, #0
    1c84:	60fb      	str	r3, [r7, #12]
    1c86:	e00c      	b.n	1ca2 <flash_erase_page+0x86>
		u32=*adr++;
    1c88:	697b      	ldr	r3, [r7, #20]
    1c8a:	1d1a      	adds	r2, r3, #4
    1c8c:	617a      	str	r2, [r7, #20]
    1c8e:	681b      	ldr	r3, [r3, #0]
    1c90:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    1c92:	693b      	ldr	r3, [r7, #16]
    1c94:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1c98:	d000      	beq.n	1c9c <flash_erase_page+0x80>
    1c9a:	e005      	b.n	1ca8 <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    1c9c:	68fb      	ldr	r3, [r7, #12]
    1c9e:	3301      	adds	r3, #1
    1ca0:	60fb      	str	r3, [r7, #12]
    1ca2:	68fb      	ldr	r3, [r7, #12]
    1ca4:	2bff      	cmp	r3, #255	; 0xff
    1ca6:	ddef      	ble.n	1c88 <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    1ca8:	693b      	ldr	r3, [r7, #16]
    1caa:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1cae:	bf0c      	ite	eq
    1cb0:	2301      	moveq	r3, #1
    1cb2:	2300      	movne	r3, #0
    1cb4:	b2db      	uxtb	r3, r3
}
    1cb6:	4618      	mov	r0, r3
    1cb8:	371c      	adds	r7, #28
    1cba:	46bd      	mov	sp, r7
    1cbc:	f85d 7b04 	ldr.w	r7, [sp], #4
    1cc0:	4770      	bx	lr
    1cc2:	bf00      	nop
    1cc4:	40022000 	.word	0x40022000

00001cc8 <gdi_clear_screen>:
 * 
 */

#include "gdi.h"

void gdi_clear_screen(){
    1cc8:	b480      	push	{r7}
    1cca:	b083      	sub	sp, #12
    1ccc:	af00      	add	r7, sp, #0
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    1cce:	2300      	movs	r3, #0
    1cd0:	607b      	str	r3, [r7, #4]
    1cd2:	e006      	b.n	1ce2 <gdi_clear_screen+0x1a>
		video_buffer[i++]=0;
    1cd4:	687b      	ldr	r3, [r7, #4]
    1cd6:	1c5a      	adds	r2, r3, #1
    1cd8:	607a      	str	r2, [r7, #4]
    1cda:	4a06      	ldr	r2, [pc, #24]	; (1cf4 <gdi_clear_screen+0x2c>)
    1cdc:	2100      	movs	r1, #0
    1cde:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

#include "gdi.h"

void gdi_clear_screen(){
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    1ce2:	687b      	ldr	r3, [r7, #4]
    1ce4:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1ce8:	dbf4      	blt.n	1cd4 <gdi_clear_screen+0xc>
		video_buffer[i++]=0;
	}
}
    1cea:	370c      	adds	r7, #12
    1cec:	46bd      	mov	sp, r7
    1cee:	f85d 7b04 	ldr.w	r7, [sp], #4
    1cf2:	4770      	bx	lr
    1cf4:	2000014c 	.word	0x2000014c

00001cf8 <gdi_scroll_up>:

// glisse vers le haut de n lignes.
void gdi_scroll_up(unsigned n){
    1cf8:	b580      	push	{r7, lr}
    1cfa:	b084      	sub	sp, #16
    1cfc:	af00      	add	r7, sp, #0
    1cfe:	6078      	str	r0, [r7, #4]
	int i,j=0;
    1d00:	2300      	movs	r3, #0
    1d02:	60bb      	str	r3, [r7, #8]
	if (n>=VRES){gdi_clear_screen();return;}
    1d04:	687b      	ldr	r3, [r7, #4]
    1d06:	2bef      	cmp	r3, #239	; 0xef
    1d08:	d902      	bls.n	1d10 <gdi_scroll_up+0x18>
    1d0a:	f7ff ffdd 	bl	1cc8 <gdi_clear_screen>
    1d0e:	e02a      	b.n	1d66 <gdi_scroll_up+0x6e>
	for (i=n*ROW_SIZE;i<ROW_SIZE*VRES;){
    1d10:	687a      	ldr	r2, [r7, #4]
    1d12:	4613      	mov	r3, r2
    1d14:	009b      	lsls	r3, r3, #2
    1d16:	4413      	add	r3, r2
    1d18:	009b      	lsls	r3, r3, #2
    1d1a:	60fb      	str	r3, [r7, #12]
    1d1c:	e00b      	b.n	1d36 <gdi_scroll_up+0x3e>
		video_buffer[j++]=video_buffer[i++];
    1d1e:	68bb      	ldr	r3, [r7, #8]
    1d20:	1c5a      	adds	r2, r3, #1
    1d22:	60ba      	str	r2, [r7, #8]
    1d24:	68fa      	ldr	r2, [r7, #12]
    1d26:	1c51      	adds	r1, r2, #1
    1d28:	60f9      	str	r1, [r7, #12]
    1d2a:	4910      	ldr	r1, [pc, #64]	; (1d6c <gdi_scroll_up+0x74>)
    1d2c:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    1d30:	4a0e      	ldr	r2, [pc, #56]	; (1d6c <gdi_scroll_up+0x74>)
    1d32:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut de n lignes.
void gdi_scroll_up(unsigned n){
	int i,j=0;
	if (n>=VRES){gdi_clear_screen();return;}
	for (i=n*ROW_SIZE;i<ROW_SIZE*VRES;){
    1d36:	68fb      	ldr	r3, [r7, #12]
    1d38:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1d3c:	dbef      	blt.n	1d1e <gdi_scroll_up+0x26>
		video_buffer[j++]=video_buffer[i++];
	}
	// efface bas de l'écran
	for (i=ROW_SIZE*VRES-n*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1d3e:	687a      	ldr	r2, [r7, #4]
    1d40:	4613      	mov	r3, r2
    1d42:	009b      	lsls	r3, r3, #2
    1d44:	4413      	add	r3, r2
    1d46:	009b      	lsls	r3, r3, #2
    1d48:	f5c3 5396 	rsb	r3, r3, #4800	; 0x12c0
    1d4c:	60fb      	str	r3, [r7, #12]
    1d4e:	e006      	b.n	1d5e <gdi_scroll_up+0x66>
		video_buffer[i++]=0;
    1d50:	68fb      	ldr	r3, [r7, #12]
    1d52:	1c5a      	adds	r2, r3, #1
    1d54:	60fa      	str	r2, [r7, #12]
    1d56:	4a05      	ldr	r2, [pc, #20]	; (1d6c <gdi_scroll_up+0x74>)
    1d58:	2100      	movs	r1, #0
    1d5a:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	if (n>=VRES){gdi_clear_screen();return;}
	for (i=n*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	// efface bas de l'écran
	for (i=ROW_SIZE*VRES-n*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1d5e:	68fb      	ldr	r3, [r7, #12]
    1d60:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1d64:	dbf4      	blt.n	1d50 <gdi_scroll_up+0x58>
		video_buffer[i++]=0;
	}
}
    1d66:	3710      	adds	r7, #16
    1d68:	46bd      	mov	sp, r7
    1d6a:	bd80      	pop	{r7, pc}
    1d6c:	2000014c 	.word	0x2000014c

00001d70 <gdi_bit_op>:

void gdi_bit_op(int x, int y, bitop_e op){
    1d70:	b480      	push	{r7}
    1d72:	b087      	sub	sp, #28
    1d74:	af00      	add	r7, sp, #0
    1d76:	60f8      	str	r0, [r7, #12]
    1d78:	60b9      	str	r1, [r7, #8]
    1d7a:	4613      	mov	r3, r2
    1d7c:	71fb      	strb	r3, [r7, #7]
	uint16_t bit;
	int offset=y*ROW_SIZE+(x>>4);
    1d7e:	68ba      	ldr	r2, [r7, #8]
    1d80:	4613      	mov	r3, r2
    1d82:	009b      	lsls	r3, r3, #2
    1d84:	4413      	add	r3, r2
    1d86:	009b      	lsls	r3, r3, #2
    1d88:	461a      	mov	r2, r3
    1d8a:	68fb      	ldr	r3, [r7, #12]
    1d8c:	111b      	asrs	r3, r3, #4
    1d8e:	4413      	add	r3, r2
    1d90:	617b      	str	r3, [r7, #20]
	bit=1<<(15-(x&15));
    1d92:	68fb      	ldr	r3, [r7, #12]
    1d94:	43db      	mvns	r3, r3
    1d96:	f003 030f 	and.w	r3, r3, #15
    1d9a:	2201      	movs	r2, #1
    1d9c:	fa02 f303 	lsl.w	r3, r2, r3
    1da0:	827b      	strh	r3, [r7, #18]
	switch (op){
    1da2:	79fb      	ldrb	r3, [r7, #7]
    1da4:	2b01      	cmp	r3, #1
    1da6:	d013      	beq.n	1dd0 <gdi_bit_op+0x60>
    1da8:	2b02      	cmp	r3, #2
    1daa:	d01d      	beq.n	1de8 <gdi_bit_op+0x78>
    1dac:	2b00      	cmp	r3, #0
    1dae:	d127      	bne.n	1e00 <gdi_bit_op+0x90>
	case BLACK_BIT:
		video_buffer[offset]&=~bit;
    1db0:	4a16      	ldr	r2, [pc, #88]	; (1e0c <gdi_bit_op+0x9c>)
    1db2:	697b      	ldr	r3, [r7, #20]
    1db4:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1db8:	b29a      	uxth	r2, r3
    1dba:	8a7b      	ldrh	r3, [r7, #18]
    1dbc:	43db      	mvns	r3, r3
    1dbe:	b29b      	uxth	r3, r3
    1dc0:	4013      	ands	r3, r2
    1dc2:	b29b      	uxth	r3, r3
    1dc4:	b299      	uxth	r1, r3
    1dc6:	4a11      	ldr	r2, [pc, #68]	; (1e0c <gdi_bit_op+0x9c>)
    1dc8:	697b      	ldr	r3, [r7, #20]
    1dca:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1dce:	e017      	b.n	1e00 <gdi_bit_op+0x90>
	case WHITE_BIT:
		video_buffer[offset]|=bit;
    1dd0:	4a0e      	ldr	r2, [pc, #56]	; (1e0c <gdi_bit_op+0x9c>)
    1dd2:	697b      	ldr	r3, [r7, #20]
    1dd4:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1dd8:	8a7b      	ldrh	r3, [r7, #18]
    1dda:	4313      	orrs	r3, r2
    1ddc:	b299      	uxth	r1, r3
    1dde:	4a0b      	ldr	r2, [pc, #44]	; (1e0c <gdi_bit_op+0x9c>)
    1de0:	697b      	ldr	r3, [r7, #20]
    1de2:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1de6:	e00b      	b.n	1e00 <gdi_bit_op+0x90>
	case XOR_BIT:
		video_buffer[offset]^=bit;
    1de8:	4a08      	ldr	r2, [pc, #32]	; (1e0c <gdi_bit_op+0x9c>)
    1dea:	697b      	ldr	r3, [r7, #20]
    1dec:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1df0:	8a7b      	ldrh	r3, [r7, #18]
    1df2:	4053      	eors	r3, r2
    1df4:	b299      	uxth	r1, r3
    1df6:	4a05      	ldr	r2, [pc, #20]	; (1e0c <gdi_bit_op+0x9c>)
    1df8:	697b      	ldr	r3, [r7, #20]
    1dfa:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1dfe:	bf00      	nop
	}
}
    1e00:	371c      	adds	r7, #28
    1e02:	46bd      	mov	sp, r7
    1e04:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e08:	4770      	bx	lr
    1e0a:	bf00      	nop
    1e0c:	2000014c 	.word	0x2000014c

00001e10 <gdi_box>:

void gdi_box(int x, int y, int w, int h, bitop_e op){
    1e10:	b580      	push	{r7, lr}
    1e12:	b086      	sub	sp, #24
    1e14:	af00      	add	r7, sp, #0
    1e16:	60f8      	str	r0, [r7, #12]
    1e18:	60b9      	str	r1, [r7, #8]
    1e1a:	607a      	str	r2, [r7, #4]
    1e1c:	603b      	str	r3, [r7, #0]
	int r,c;
	
	for (r=0;r<h;r++){
    1e1e:	2300      	movs	r3, #0
    1e20:	617b      	str	r3, [r7, #20]
    1e22:	e02e      	b.n	1e82 <gdi_box+0x72>
		for (c=0;c<w;c++){
    1e24:	2300      	movs	r3, #0
    1e26:	613b      	str	r3, [r7, #16]
    1e28:	e024      	b.n	1e74 <gdi_box+0x64>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    1e2a:	68fa      	ldr	r2, [r7, #12]
    1e2c:	693b      	ldr	r3, [r7, #16]
    1e2e:	4413      	add	r3, r2
    1e30:	2b00      	cmp	r3, #0
    1e32:	db1c      	blt.n	1e6e <gdi_box+0x5e>
    1e34:	68fa      	ldr	r2, [r7, #12]
    1e36:	693b      	ldr	r3, [r7, #16]
    1e38:	4413      	add	r3, r2
    1e3a:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    1e3e:	da16      	bge.n	1e6e <gdi_box+0x5e>
    1e40:	697a      	ldr	r2, [r7, #20]
    1e42:	68bb      	ldr	r3, [r7, #8]
    1e44:	4413      	add	r3, r2
    1e46:	2b00      	cmp	r3, #0
    1e48:	db11      	blt.n	1e6e <gdi_box+0x5e>
    1e4a:	697a      	ldr	r2, [r7, #20]
    1e4c:	68bb      	ldr	r3, [r7, #8]
    1e4e:	4413      	add	r3, r2
    1e50:	2bef      	cmp	r3, #239	; 0xef
    1e52:	dc0c      	bgt.n	1e6e <gdi_box+0x5e>
				gdi_bit_op(c+x,r+y,op);
    1e54:	693a      	ldr	r2, [r7, #16]
    1e56:	68fb      	ldr	r3, [r7, #12]
    1e58:	18d1      	adds	r1, r2, r3
    1e5a:	697a      	ldr	r2, [r7, #20]
    1e5c:	68bb      	ldr	r3, [r7, #8]
    1e5e:	441a      	add	r2, r3
    1e60:	f897 3020 	ldrb.w	r3, [r7, #32]
    1e64:	4608      	mov	r0, r1
    1e66:	4611      	mov	r1, r2
    1e68:	461a      	mov	r2, r3
    1e6a:	f7ff ff81 	bl	1d70 <gdi_bit_op>

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
		for (c=0;c<w;c++){
    1e6e:	693b      	ldr	r3, [r7, #16]
    1e70:	3301      	adds	r3, #1
    1e72:	613b      	str	r3, [r7, #16]
    1e74:	693a      	ldr	r2, [r7, #16]
    1e76:	687b      	ldr	r3, [r7, #4]
    1e78:	429a      	cmp	r2, r3
    1e7a:	dbd6      	blt.n	1e2a <gdi_box+0x1a>
}

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
    1e7c:	697b      	ldr	r3, [r7, #20]
    1e7e:	3301      	adds	r3, #1
    1e80:	617b      	str	r3, [r7, #20]
    1e82:	697a      	ldr	r2, [r7, #20]
    1e84:	683b      	ldr	r3, [r7, #0]
    1e86:	429a      	cmp	r2, r3
    1e88:	dbcc      	blt.n	1e24 <gdi_box+0x14>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				gdi_bit_op(c+x,r+y,op);
			}
		}
	}
}
    1e8a:	3718      	adds	r7, #24
    1e8c:	46bd      	mov	sp, r7
    1e8e:	bd80      	pop	{r7, pc}

00001e90 <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
    1e90:	b480      	push	{r7}
    1e92:	b089      	sub	sp, #36	; 0x24
    1e94:	af00      	add	r7, sp, #0
    1e96:	60f8      	str	r0, [r7, #12]
    1e98:	60b9      	str	r1, [r7, #8]
    1e9a:	607a      	str	r2, [r7, #4]
    1e9c:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1e9e:	2300      	movs	r3, #0
    1ea0:	61fb      	str	r3, [r7, #28]
    1ea2:	e099      	b.n	1fd8 <gdi_put_sprite+0x148>
		mask=128;
    1ea4:	2380      	movs	r3, #128	; 0x80
    1ea6:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    1ea8:	2300      	movs	r3, #0
    1eaa:	61bb      	str	r3, [r7, #24]
    1eac:	e08c      	b.n	1fc8 <gdi_put_sprite+0x138>
			if (!mask){
    1eae:	7dfb      	ldrb	r3, [r7, #23]
    1eb0:	2b00      	cmp	r3, #0
    1eb2:	d104      	bne.n	1ebe <gdi_put_sprite+0x2e>
				sprite++;
    1eb4:	6abb      	ldr	r3, [r7, #40]	; 0x28
    1eb6:	3301      	adds	r3, #1
    1eb8:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    1eba:	2380      	movs	r3, #128	; 0x80
    1ebc:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    1ebe:	68fa      	ldr	r2, [r7, #12]
    1ec0:	69bb      	ldr	r3, [r7, #24]
    1ec2:	4413      	add	r3, r2
    1ec4:	2b00      	cmp	r3, #0
    1ec6:	db79      	blt.n	1fbc <gdi_put_sprite+0x12c>
    1ec8:	68fa      	ldr	r2, [r7, #12]
    1eca:	69bb      	ldr	r3, [r7, #24]
    1ecc:	4413      	add	r3, r2
    1ece:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    1ed2:	da73      	bge.n	1fbc <gdi_put_sprite+0x12c>
    1ed4:	69fa      	ldr	r2, [r7, #28]
    1ed6:	68bb      	ldr	r3, [r7, #8]
    1ed8:	4413      	add	r3, r2
    1eda:	2b00      	cmp	r3, #0
    1edc:	db6e      	blt.n	1fbc <gdi_put_sprite+0x12c>
    1ede:	69fa      	ldr	r2, [r7, #28]
    1ee0:	68bb      	ldr	r3, [r7, #8]
    1ee2:	4413      	add	r3, r2
    1ee4:	2bef      	cmp	r3, #239	; 0xef
    1ee6:	dc69      	bgt.n	1fbc <gdi_put_sprite+0x12c>
				if (sprite[r]&mask){
    1ee8:	69fb      	ldr	r3, [r7, #28]
    1eea:	6aba      	ldr	r2, [r7, #40]	; 0x28
    1eec:	4413      	add	r3, r2
    1eee:	781a      	ldrb	r2, [r3, #0]
    1ef0:	7dfb      	ldrb	r3, [r7, #23]
    1ef2:	4013      	ands	r3, r2
    1ef4:	b2db      	uxtb	r3, r3
    1ef6:	2b00      	cmp	r3, #0
    1ef8:	d02f      	beq.n	1f5a <gdi_put_sprite+0xca>
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]|=(1<<(15-((c+x)&15)));
    1efa:	69fa      	ldr	r2, [r7, #28]
    1efc:	68bb      	ldr	r3, [r7, #8]
    1efe:	441a      	add	r2, r3
    1f00:	4613      	mov	r3, r2
    1f02:	009b      	lsls	r3, r3, #2
    1f04:	4413      	add	r3, r2
    1f06:	009b      	lsls	r3, r3, #2
    1f08:	4619      	mov	r1, r3
    1f0a:	69ba      	ldr	r2, [r7, #24]
    1f0c:	68fb      	ldr	r3, [r7, #12]
    1f0e:	4413      	add	r3, r2
    1f10:	111b      	asrs	r3, r3, #4
    1f12:	4419      	add	r1, r3
    1f14:	69fa      	ldr	r2, [r7, #28]
    1f16:	68bb      	ldr	r3, [r7, #8]
    1f18:	441a      	add	r2, r3
    1f1a:	4613      	mov	r3, r2
    1f1c:	009b      	lsls	r3, r3, #2
    1f1e:	4413      	add	r3, r2
    1f20:	009b      	lsls	r3, r3, #2
    1f22:	4618      	mov	r0, r3
    1f24:	69ba      	ldr	r2, [r7, #24]
    1f26:	68fb      	ldr	r3, [r7, #12]
    1f28:	4413      	add	r3, r2
    1f2a:	111b      	asrs	r3, r3, #4
    1f2c:	4403      	add	r3, r0
    1f2e:	4a2f      	ldr	r2, [pc, #188]	; (1fec <gdi_put_sprite+0x15c>)
    1f30:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1f34:	b298      	uxth	r0, r3
    1f36:	69ba      	ldr	r2, [r7, #24]
    1f38:	68fb      	ldr	r3, [r7, #12]
    1f3a:	4413      	add	r3, r2
    1f3c:	43db      	mvns	r3, r3
    1f3e:	f003 030f 	and.w	r3, r3, #15
    1f42:	2201      	movs	r2, #1
    1f44:	fa02 f303 	lsl.w	r3, r2, r3
    1f48:	b29b      	uxth	r3, r3
    1f4a:	4602      	mov	r2, r0
    1f4c:	4313      	orrs	r3, r2
    1f4e:	b29b      	uxth	r3, r3
    1f50:	b29a      	uxth	r2, r3
    1f52:	4b26      	ldr	r3, [pc, #152]	; (1fec <gdi_put_sprite+0x15c>)
    1f54:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
    1f58:	e030      	b.n	1fbc <gdi_put_sprite+0x12c>
				}else{
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]&=~(1<<(15-((c+x)&15)));
    1f5a:	69fa      	ldr	r2, [r7, #28]
    1f5c:	68bb      	ldr	r3, [r7, #8]
    1f5e:	441a      	add	r2, r3
    1f60:	4613      	mov	r3, r2
    1f62:	009b      	lsls	r3, r3, #2
    1f64:	4413      	add	r3, r2
    1f66:	009b      	lsls	r3, r3, #2
    1f68:	4619      	mov	r1, r3
    1f6a:	69ba      	ldr	r2, [r7, #24]
    1f6c:	68fb      	ldr	r3, [r7, #12]
    1f6e:	4413      	add	r3, r2
    1f70:	111b      	asrs	r3, r3, #4
    1f72:	4419      	add	r1, r3
    1f74:	69fa      	ldr	r2, [r7, #28]
    1f76:	68bb      	ldr	r3, [r7, #8]
    1f78:	441a      	add	r2, r3
    1f7a:	4613      	mov	r3, r2
    1f7c:	009b      	lsls	r3, r3, #2
    1f7e:	4413      	add	r3, r2
    1f80:	009b      	lsls	r3, r3, #2
    1f82:	4618      	mov	r0, r3
    1f84:	69ba      	ldr	r2, [r7, #24]
    1f86:	68fb      	ldr	r3, [r7, #12]
    1f88:	4413      	add	r3, r2
    1f8a:	111b      	asrs	r3, r3, #4
    1f8c:	4403      	add	r3, r0
    1f8e:	4a17      	ldr	r2, [pc, #92]	; (1fec <gdi_put_sprite+0x15c>)
    1f90:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1f94:	b298      	uxth	r0, r3
    1f96:	69ba      	ldr	r2, [r7, #24]
    1f98:	68fb      	ldr	r3, [r7, #12]
    1f9a:	4413      	add	r3, r2
    1f9c:	43db      	mvns	r3, r3
    1f9e:	f003 030f 	and.w	r3, r3, #15
    1fa2:	2201      	movs	r2, #1
    1fa4:	fa02 f303 	lsl.w	r3, r2, r3
    1fa8:	b29b      	uxth	r3, r3
    1faa:	43db      	mvns	r3, r3
    1fac:	b29b      	uxth	r3, r3
    1fae:	4602      	mov	r2, r0
    1fb0:	4013      	ands	r3, r2
    1fb2:	b29b      	uxth	r3, r3
    1fb4:	b29a      	uxth	r2, r3
    1fb6:	4b0d      	ldr	r3, [pc, #52]	; (1fec <gdi_put_sprite+0x15c>)
    1fb8:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
				//bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
				//video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]|=bit;
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
    1fbc:	7dfb      	ldrb	r3, [r7, #23]
    1fbe:	085b      	lsrs	r3, r3, #1
    1fc0:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    1fc2:	69bb      	ldr	r3, [r7, #24]
    1fc4:	3301      	adds	r3, #1
    1fc6:	61bb      	str	r3, [r7, #24]
    1fc8:	69ba      	ldr	r2, [r7, #24]
    1fca:	687b      	ldr	r3, [r7, #4]
    1fcc:	429a      	cmp	r2, r3
    1fce:	f6ff af6e 	blt.w	1eae <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1fd2:	69fb      	ldr	r3, [r7, #28]
    1fd4:	3301      	adds	r3, #1
    1fd6:	61fb      	str	r3, [r7, #28]
    1fd8:	69fa      	ldr	r2, [r7, #28]
    1fda:	683b      	ldr	r3, [r7, #0]
    1fdc:	429a      	cmp	r2, r3
    1fde:	f6ff af61 	blt.w	1ea4 <gdi_put_sprite+0x14>
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    1fe2:	3724      	adds	r7, #36	; 0x24
    1fe4:	46bd      	mov	sp, r7
    1fe6:	f85d 7b04 	ldr.w	r7, [sp], #4
    1fea:	4770      	bx	lr
    1fec:	2000014c 	.word	0x2000014c

00001ff0 <gdi_clear_rows>:

void gdi_clear_rows(int y, int count){
    1ff0:	b480      	push	{r7}
    1ff2:	b085      	sub	sp, #20
    1ff4:	af00      	add	r7, sp, #0
    1ff6:	6078      	str	r0, [r7, #4]
    1ff8:	6039      	str	r1, [r7, #0]
	int i,limit;
	if (y<0){y=0;}
    1ffa:	687b      	ldr	r3, [r7, #4]
    1ffc:	2b00      	cmp	r3, #0
    1ffe:	da01      	bge.n	2004 <gdi_clear_rows+0x14>
    2000:	2300      	movs	r3, #0
    2002:	607b      	str	r3, [r7, #4]
	limit=(y+count)*ROW_SIZE;
    2004:	687a      	ldr	r2, [r7, #4]
    2006:	683b      	ldr	r3, [r7, #0]
    2008:	441a      	add	r2, r3
    200a:	4613      	mov	r3, r2
    200c:	009b      	lsls	r3, r3, #2
    200e:	4413      	add	r3, r2
    2010:	009b      	lsls	r3, r3, #2
    2012:	60bb      	str	r3, [r7, #8]
	if (limit>(HRES*VRES)){limit=HRES*VRES;}
    2014:	68bb      	ldr	r3, [r7, #8]
    2016:	f5b3 3f96 	cmp.w	r3, #76800	; 0x12c00
    201a:	dd02      	ble.n	2022 <gdi_clear_rows+0x32>
    201c:	f44f 3396 	mov.w	r3, #76800	; 0x12c00
    2020:	60bb      	str	r3, [r7, #8]
	for (i=y*ROW_SIZE;i<limit;i++){
    2022:	687a      	ldr	r2, [r7, #4]
    2024:	4613      	mov	r3, r2
    2026:	009b      	lsls	r3, r3, #2
    2028:	4413      	add	r3, r2
    202a:	009b      	lsls	r3, r3, #2
    202c:	60fb      	str	r3, [r7, #12]
    202e:	e007      	b.n	2040 <gdi_clear_rows+0x50>
		video_buffer[i]=0;
    2030:	4a08      	ldr	r2, [pc, #32]	; (2054 <gdi_clear_rows+0x64>)
    2032:	68fb      	ldr	r3, [r7, #12]
    2034:	2100      	movs	r1, #0
    2036:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
void gdi_clear_rows(int y, int count){
	int i,limit;
	if (y<0){y=0;}
	limit=(y+count)*ROW_SIZE;
	if (limit>(HRES*VRES)){limit=HRES*VRES;}
	for (i=y*ROW_SIZE;i<limit;i++){
    203a:	68fb      	ldr	r3, [r7, #12]
    203c:	3301      	adds	r3, #1
    203e:	60fb      	str	r3, [r7, #12]
    2040:	68fa      	ldr	r2, [r7, #12]
    2042:	68bb      	ldr	r3, [r7, #8]
    2044:	429a      	cmp	r2, r3
    2046:	dbf3      	blt.n	2030 <gdi_clear_rows+0x40>
		video_buffer[i]=0;
	}
}
    2048:	3714      	adds	r7, #20
    204a:	46bd      	mov	sp, r7
    204c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2050:	4770      	bx	lr
    2052:	bf00      	nop
    2054:	2000014c 	.word	0x2000014c

00002058 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(gpio_t* port, unsigned pin, unsigned config){
    2058:	b480      	push	{r7}
    205a:	b087      	sub	sp, #28
    205c:	af00      	add	r7, sp, #0
    205e:	60f8      	str	r0, [r7, #12]
    2060:	60b9      	str	r1, [r7, #8]
    2062:	607a      	str	r2, [r7, #4]
	uint8_t shift;
	shift=(pin&7)<<2;
    2064:	68bb      	ldr	r3, [r7, #8]
    2066:	b2db      	uxtb	r3, r3
    2068:	f003 0307 	and.w	r3, r3, #7
    206c:	b2db      	uxtb	r3, r3
    206e:	009b      	lsls	r3, r3, #2
    2070:	75fb      	strb	r3, [r7, #23]
	port->CR[pin>>3]&=~(15<<shift);
    2072:	68bb      	ldr	r3, [r7, #8]
    2074:	08da      	lsrs	r2, r3, #3
    2076:	68bb      	ldr	r3, [r7, #8]
    2078:	08d9      	lsrs	r1, r3, #3
    207a:	68fb      	ldr	r3, [r7, #12]
    207c:	f853 3021 	ldr.w	r3, [r3, r1, lsl #2]
    2080:	7df9      	ldrb	r1, [r7, #23]
    2082:	200f      	movs	r0, #15
    2084:	fa00 f101 	lsl.w	r1, r0, r1
    2088:	43c9      	mvns	r1, r1
    208a:	4019      	ands	r1, r3
    208c:	68fb      	ldr	r3, [r7, #12]
    208e:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
	port->CR[pin>>3]|=config<<shift;
    2092:	68bb      	ldr	r3, [r7, #8]
    2094:	08da      	lsrs	r2, r3, #3
    2096:	68bb      	ldr	r3, [r7, #8]
    2098:	08d9      	lsrs	r1, r3, #3
    209a:	68fb      	ldr	r3, [r7, #12]
    209c:	f853 1021 	ldr.w	r1, [r3, r1, lsl #2]
    20a0:	7dfb      	ldrb	r3, [r7, #23]
    20a2:	6878      	ldr	r0, [r7, #4]
    20a4:	fa00 f303 	lsl.w	r3, r0, r3
    20a8:	4319      	orrs	r1, r3
    20aa:	68fb      	ldr	r3, [r7, #12]
    20ac:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
}
    20b0:	371c      	adds	r7, #28
    20b2:	46bd      	mov	sp, r7
    20b4:	f85d 7b04 	ldr.w	r7, [sp], #4
    20b8:	4770      	bx	lr
    20ba:	bf00      	nop

000020bc <read_pin>:

int read_pin(gpio_t* port, unsigned pin){
    20bc:	b480      	push	{r7}
    20be:	b083      	sub	sp, #12
    20c0:	af00      	add	r7, sp, #0
    20c2:	6078      	str	r0, [r7, #4]
    20c4:	6039      	str	r1, [r7, #0]
	return port->IDR&(1<<pin);
    20c6:	687b      	ldr	r3, [r7, #4]
    20c8:	689b      	ldr	r3, [r3, #8]
    20ca:	683a      	ldr	r2, [r7, #0]
    20cc:	2101      	movs	r1, #1
    20ce:	fa01 f202 	lsl.w	r2, r1, r2
    20d2:	4013      	ands	r3, r2
}
    20d4:	4618      	mov	r0, r3
    20d6:	370c      	adds	r7, #12
    20d8:	46bd      	mov	sp, r7
    20da:	f85d 7b04 	ldr.w	r7, [sp], #4
    20de:	4770      	bx	lr

000020e0 <write_pin>:

void write_pin(gpio_t* port, unsigned pin, int value){
    20e0:	b480      	push	{r7}
    20e2:	b085      	sub	sp, #20
    20e4:	af00      	add	r7, sp, #0
    20e6:	60f8      	str	r0, [r7, #12]
    20e8:	60b9      	str	r1, [r7, #8]
    20ea:	607a      	str	r2, [r7, #4]
	value?(port->ODR|=(1<<pin)):(port->ODR&=~(1<<pin));
    20ec:	687b      	ldr	r3, [r7, #4]
    20ee:	2b00      	cmp	r3, #0
    20f0:	d009      	beq.n	2106 <write_pin+0x26>
    20f2:	68fb      	ldr	r3, [r7, #12]
    20f4:	68db      	ldr	r3, [r3, #12]
    20f6:	68ba      	ldr	r2, [r7, #8]
    20f8:	2101      	movs	r1, #1
    20fa:	fa01 f202 	lsl.w	r2, r1, r2
    20fe:	431a      	orrs	r2, r3
    2100:	68fb      	ldr	r3, [r7, #12]
    2102:	60da      	str	r2, [r3, #12]
    2104:	e009      	b.n	211a <write_pin+0x3a>
    2106:	68fb      	ldr	r3, [r7, #12]
    2108:	68db      	ldr	r3, [r3, #12]
    210a:	68ba      	ldr	r2, [r7, #8]
    210c:	2101      	movs	r1, #1
    210e:	fa01 f202 	lsl.w	r2, r1, r2
    2112:	43d2      	mvns	r2, r2
    2114:	401a      	ands	r2, r3
    2116:	68fb      	ldr	r3, [r7, #12]
    2118:	60da      	str	r2, [r3, #12]
}
    211a:	3714      	adds	r7, #20
    211c:	46bd      	mov	sp, r7
    211e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2122:	4770      	bx	lr

00002124 <toggle_pin>:

void toggle_pin(gpio_t* port, unsigned pin){
    2124:	b480      	push	{r7}
    2126:	b083      	sub	sp, #12
    2128:	af00      	add	r7, sp, #0
    212a:	6078      	str	r0, [r7, #4]
    212c:	6039      	str	r1, [r7, #0]
	port->ODR^=(1<<pin);
    212e:	687b      	ldr	r3, [r7, #4]
    2130:	68db      	ldr	r3, [r3, #12]
    2132:	683a      	ldr	r2, [r7, #0]
    2134:	2101      	movs	r1, #1
    2136:	fa01 f202 	lsl.w	r2, r1, r2
    213a:	405a      	eors	r2, r3
    213c:	687b      	ldr	r3, [r7, #4]
    213e:	60da      	str	r2, [r3, #12]
}
    2140:	370c      	adds	r7, #12
    2142:	46bd      	mov	sp, r7
    2144:	f85d 7b04 	ldr.w	r7, [sp], #4
    2148:	4770      	bx	lr
    214a:	bf00      	nop

0000214c <keyboard_init>:
    ps2_flags = 0;
    return KbdSend(KBD_RESET);
}//KbdReset()
*/
 
void keyboard_init(){
    214c:	b580      	push	{r7, lr}
    214e:	af00      	add	r7, sp, #0
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
    2150:	4a1f      	ldr	r2, [pc, #124]	; (21d0 <keyboard_init+0x84>)
    2152:	4b1f      	ldr	r3, [pc, #124]	; (21d0 <keyboard_init+0x84>)
    2154:	699b      	ldr	r3, [r3, #24]
    2156:	f043 0305 	orr.w	r3, r3, #5
    215a:	6193      	str	r3, [r2, #24]
	// activation clock TMR2
	RCC->APB1ENR|=RCC_APB1ENR_TIM2EN; 
    215c:	4a1c      	ldr	r2, [pc, #112]	; (21d0 <keyboard_init+0x84>)
    215e:	4b1c      	ldr	r3, [pc, #112]	; (21d0 <keyboard_init+0x84>)
    2160:	69db      	ldr	r3, [r3, #28]
    2162:	f043 0301 	orr.w	r3, r3, #1
    2166:	61d3      	str	r3, [r2, #28]
	TMR2->ARR=FTMR2_4/20*.01;
    2168:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    216c:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    2170:	62da      	str	r2, [r3, #44]	; 0x2c
	TMR2->PSC=20;
    2172:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    2176:	2214      	movs	r2, #20
    2178:	629a      	str	r2, [r3, #40]	; 0x28
	TMR2->CR1=BIT0|BIT7; // ARPE
    217a:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    217e:	2281      	movs	r2, #129	; 0x81
    2180:	601a      	str	r2, [r3, #0]
	TMR2->DIER=BIT0; // UIE
    2182:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    2186:	2201      	movs	r2, #1
    2188:	60da      	str	r2, [r3, #12]
	set_int_priority(IRQ_KBD_CLK,0);
    218a:	2017      	movs	r0, #23
    218c:	2100      	movs	r1, #0
    218e:	f000 fb31 	bl	27f4 <set_int_priority>
	set_int_priority(IRQ_TIM2,14);
    2192:	201c      	movs	r0, #28
    2194:	210e      	movs	r1, #14
    2196:	f000 fb2d 	bl	27f4 <set_int_priority>
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
    219a:	4a0e      	ldr	r2, [pc, #56]	; (21d4 <keyboard_init+0x88>)
    219c:	4b0d      	ldr	r3, [pc, #52]	; (21d4 <keyboard_init+0x88>)
    219e:	68db      	ldr	r3, [r3, #12]
    21a0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    21a4:	60d3      	str	r3, [r2, #12]
	EXTI->IMR|=KBD_CLK_PIN;
    21a6:	4a0b      	ldr	r2, [pc, #44]	; (21d4 <keyboard_init+0x88>)
    21a8:	4b0a      	ldr	r3, [pc, #40]	; (21d4 <keyboard_init+0x88>)
    21aa:	681b      	ldr	r3, [r3, #0]
    21ac:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    21b0:	6013      	str	r3, [r2, #0]
	enable_interrupt(IRQ_KBD_CLK);
    21b2:	2017      	movs	r0, #23
    21b4:	f000 fa62 	bl	267c <enable_interrupt>
	TMR2->SR&=~BIT0;
    21b8:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    21bc:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    21c0:	691b      	ldr	r3, [r3, #16]
    21c2:	f023 0301 	bic.w	r3, r3, #1
    21c6:	6113      	str	r3, [r2, #16]
	enable_interrupt(IRQ_TIM2);
    21c8:	201c      	movs	r0, #28
    21ca:	f000 fa57 	bl	267c <enable_interrupt>
	//pause(700);
	//if (!KbdReset()) print("keyboard reset failed\n");
}
    21ce:	bd80      	pop	{r7, pc}
    21d0:	40021000 	.word	0x40021000
    21d4:	40010400 	.word	0x40010400

000021d8 <search_table>:
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
    21d8:	b480      	push	{r7}
    21da:	b083      	sub	sp, #12
    21dc:	af00      	add	r7, sp, #0
    21de:	6078      	str	r0, [r7, #4]
    21e0:	460b      	mov	r3, r1
    21e2:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    21e4:	e008      	b.n	21f8 <search_table+0x20>
		if (table->code==code) break;
    21e6:	687b      	ldr	r3, [r7, #4]
    21e8:	781b      	ldrb	r3, [r3, #0]
    21ea:	78fa      	ldrb	r2, [r7, #3]
    21ec:	429a      	cmp	r2, r3
    21ee:	d100      	bne.n	21f2 <search_table+0x1a>
    21f0:	e006      	b.n	2200 <search_table+0x28>
		table++;
    21f2:	687b      	ldr	r3, [r7, #4]
    21f4:	3302      	adds	r3, #2
    21f6:	607b      	str	r3, [r7, #4]

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
    21f8:	687b      	ldr	r3, [r7, #4]
    21fa:	781b      	ldrb	r3, [r3, #0]
    21fc:	2b00      	cmp	r3, #0
    21fe:	d1f2      	bne.n	21e6 <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    2200:	687b      	ldr	r3, [r7, #4]
    2202:	785b      	ldrb	r3, [r3, #1]
}
    2204:	4618      	mov	r0, r3
    2206:	370c      	adds	r7, #12
    2208:	46bd      	mov	sp, r7
    220a:	f85d 7b04 	ldr.w	r7, [sp], #4
    220e:	4770      	bx	lr

00002210 <convert_code>:

static void convert_code(unsigned char code){
    2210:	b580      	push	{r7, lr}
    2212:	b086      	sub	sp, #24
    2214:	af00      	add	r7, sp, #0
    2216:	4603      	mov	r3, r0
    2218:	71fb      	strb	r3, [r7, #7]
		unsigned char c,s;
		int shift;
		if (!(con.dev==LOCAL)) return;
    221a:	4ba1      	ldr	r3, [pc, #644]	; (24a0 <convert_code+0x290>)
    221c:	781b      	ldrb	r3, [r3, #0]
    221e:	2b00      	cmp	r3, #0
    2220:	d000      	beq.n	2224 <convert_code+0x14>
    2222:	e139      	b.n	2498 <convert_code+0x288>
		switch (code){
    2224:	79fb      	ldrb	r3, [r7, #7]
    2226:	2b59      	cmp	r3, #89	; 0x59
    2228:	f000 8085 	beq.w	2336 <convert_code+0x126>
    222c:	2b59      	cmp	r3, #89	; 0x59
    222e:	dc0e      	bgt.n	224e <convert_code+0x3e>
    2230:	2b12      	cmp	r3, #18
    2232:	d038      	beq.n	22a6 <convert_code+0x96>
    2234:	2b12      	cmp	r3, #18
    2236:	dc03      	bgt.n	2240 <convert_code+0x30>
    2238:	2b11      	cmp	r3, #17
    223a:	f000 80a4 	beq.w	2386 <convert_code+0x176>
    223e:	e0ca      	b.n	23d6 <convert_code+0x1c6>
    2240:	2b14      	cmp	r3, #20
    2242:	f000 808c 	beq.w	235e <convert_code+0x14e>
    2246:	2b58      	cmp	r3, #88	; 0x58
    2248:	f000 80b1 	beq.w	23ae <convert_code+0x19e>
    224c:	e0c3      	b.n	23d6 <convert_code+0x1c6>
    224e:	2be0      	cmp	r3, #224	; 0xe0
    2250:	d010      	beq.n	2274 <convert_code+0x64>
    2252:	2be0      	cmp	r3, #224	; 0xe0
    2254:	dc02      	bgt.n	225c <convert_code+0x4c>
    2256:	2b7c      	cmp	r3, #124	; 0x7c
    2258:	d047      	beq.n	22ea <convert_code+0xda>
    225a:	e0bc      	b.n	23d6 <convert_code+0x1c6>
    225c:	2be1      	cmp	r3, #225	; 0xe1
    225e:	d010      	beq.n	2282 <convert_code+0x72>
    2260:	2bf0      	cmp	r3, #240	; 0xf0
    2262:	f040 80b8 	bne.w	23d6 <convert_code+0x1c6>
		case 0xF0:
			flags |= RELEASE;
    2266:	4b8f      	ldr	r3, [pc, #572]	; (24a4 <convert_code+0x294>)
    2268:	681b      	ldr	r3, [r3, #0]
    226a:	f043 0302 	orr.w	r3, r3, #2
    226e:	4a8d      	ldr	r2, [pc, #564]	; (24a4 <convert_code+0x294>)
    2270:	6013      	str	r3, [r2, #0]
			break;
    2272:	e111      	b.n	2498 <convert_code+0x288>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    2274:	4b8b      	ldr	r3, [pc, #556]	; (24a4 <convert_code+0x294>)
    2276:	681b      	ldr	r3, [r3, #0]
    2278:	f043 0301 	orr.w	r3, r3, #1
    227c:	4a89      	ldr	r2, [pc, #548]	; (24a4 <convert_code+0x294>)
    227e:	6013      	str	r3, [r2, #0]
			break;
    2280:	e10a      	b.n	2498 <convert_code+0x288>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    2282:	4b88      	ldr	r3, [pc, #544]	; (24a4 <convert_code+0x294>)
    2284:	681b      	ldr	r3, [r3, #0]
    2286:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    228a:	4a86      	ldr	r2, [pc, #536]	; (24a4 <convert_code+0x294>)
    228c:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    228e:	4b85      	ldr	r3, [pc, #532]	; (24a4 <convert_code+0x294>)
    2290:	681b      	ldr	r3, [r3, #0]
    2292:	f403 7380 	and.w	r3, r3, #256	; 0x100
    2296:	2b00      	cmp	r3, #0
    2298:	d104      	bne.n	22a4 <convert_code+0x94>
				con.insert(PAUSE);
    229a:	4b81      	ldr	r3, [pc, #516]	; (24a0 <convert_code+0x290>)
    229c:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    229e:	2094      	movs	r0, #148	; 0x94
    22a0:	4798      	blx	r3
			}
			break;
    22a2:	e0f9      	b.n	2498 <convert_code+0x288>
    22a4:	e0f8      	b.n	2498 <convert_code+0x288>
		case LSHIFT:
			if (flags&RELEASE){
    22a6:	4b7f      	ldr	r3, [pc, #508]	; (24a4 <convert_code+0x294>)
    22a8:	681b      	ldr	r3, [r3, #0]
    22aa:	f003 0302 	and.w	r3, r3, #2
    22ae:	2b00      	cmp	r3, #0
    22b0:	d006      	beq.n	22c0 <convert_code+0xb0>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    22b2:	4b7c      	ldr	r3, [pc, #496]	; (24a4 <convert_code+0x294>)
    22b4:	681b      	ldr	r3, [r3, #0]
    22b6:	f023 0307 	bic.w	r3, r3, #7
    22ba:	4a7a      	ldr	r2, [pc, #488]	; (24a4 <convert_code+0x294>)
    22bc:	6013      	str	r3, [r2, #0]
    22be:	e013      	b.n	22e8 <convert_code+0xd8>
			}else{
				if (flags&XTD_CODE){
    22c0:	4b78      	ldr	r3, [pc, #480]	; (24a4 <convert_code+0x294>)
    22c2:	681b      	ldr	r3, [r3, #0]
    22c4:	f003 0301 	and.w	r3, r3, #1
    22c8:	2b00      	cmp	r3, #0
    22ca:	d006      	beq.n	22da <convert_code+0xca>
					flags|=PRNSCR;
    22cc:	4b75      	ldr	r3, [pc, #468]	; (24a4 <convert_code+0x294>)
    22ce:	681b      	ldr	r3, [r3, #0]
    22d0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    22d4:	4a73      	ldr	r2, [pc, #460]	; (24a4 <convert_code+0x294>)
    22d6:	6013      	str	r3, [r2, #0]
    22d8:	e006      	b.n	22e8 <convert_code+0xd8>
				}else{
					flags|=LEFT_SHIFT;
    22da:	4b72      	ldr	r3, [pc, #456]	; (24a4 <convert_code+0x294>)
    22dc:	681b      	ldr	r3, [r3, #0]
    22de:	f043 0304 	orr.w	r3, r3, #4
    22e2:	4a70      	ldr	r2, [pc, #448]	; (24a4 <convert_code+0x294>)
    22e4:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    22e6:	e0d7      	b.n	2498 <convert_code+0x288>
    22e8:	e0d6      	b.n	2498 <convert_code+0x288>
		case KPMUL:
			if (flags&RELEASE){
    22ea:	4b6e      	ldr	r3, [pc, #440]	; (24a4 <convert_code+0x294>)
    22ec:	681b      	ldr	r3, [r3, #0]
    22ee:	f003 0302 	and.w	r3, r3, #2
    22f2:	2b00      	cmp	r3, #0
    22f4:	d006      	beq.n	2304 <convert_code+0xf4>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    22f6:	4b6b      	ldr	r3, [pc, #428]	; (24a4 <convert_code+0x294>)
    22f8:	681b      	ldr	r3, [r3, #0]
    22fa:	f023 0303 	bic.w	r3, r3, #3
    22fe:	4a69      	ldr	r2, [pc, #420]	; (24a4 <convert_code+0x294>)
    2300:	6013      	str	r3, [r2, #0]
    2302:	e017      	b.n	2334 <convert_code+0x124>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    2304:	4b67      	ldr	r3, [pc, #412]	; (24a4 <convert_code+0x294>)
    2306:	681b      	ldr	r3, [r3, #0]
    2308:	f003 0301 	and.w	r3, r3, #1
    230c:	2b00      	cmp	r3, #0
    230e:	d00c      	beq.n	232a <convert_code+0x11a>
					flags&=~(XTD_CODE|PRNSCR);
    2310:	4b64      	ldr	r3, [pc, #400]	; (24a4 <convert_code+0x294>)
    2312:	681b      	ldr	r3, [r3, #0]
    2314:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    2318:	f023 0301 	bic.w	r3, r3, #1
    231c:	4a61      	ldr	r2, [pc, #388]	; (24a4 <convert_code+0x294>)
    231e:	6013      	str	r3, [r2, #0]
					con.insert(PRN);
    2320:	4b5f      	ldr	r3, [pc, #380]	; (24a0 <convert_code+0x290>)
    2322:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    2324:	2092      	movs	r0, #146	; 0x92
    2326:	4798      	blx	r3
    2328:	e004      	b.n	2334 <convert_code+0x124>
				}else{
					con.insert('*');
    232a:	4b5d      	ldr	r3, [pc, #372]	; (24a0 <convert_code+0x290>)
    232c:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    232e:	202a      	movs	r0, #42	; 0x2a
    2330:	4798      	blx	r3
				}
			}
			break;
    2332:	e0b1      	b.n	2498 <convert_code+0x288>
    2334:	e0b0      	b.n	2498 <convert_code+0x288>
		case RSHIFT:
			if (flags&RELEASE){
    2336:	4b5b      	ldr	r3, [pc, #364]	; (24a4 <convert_code+0x294>)
    2338:	681b      	ldr	r3, [r3, #0]
    233a:	f003 0302 	and.w	r3, r3, #2
    233e:	2b00      	cmp	r3, #0
    2340:	d006      	beq.n	2350 <convert_code+0x140>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    2342:	4b58      	ldr	r3, [pc, #352]	; (24a4 <convert_code+0x294>)
    2344:	681b      	ldr	r3, [r3, #0]
    2346:	f023 030b 	bic.w	r3, r3, #11
    234a:	4a56      	ldr	r2, [pc, #344]	; (24a4 <convert_code+0x294>)
    234c:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    234e:	e0a3      	b.n	2498 <convert_code+0x288>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    2350:	4b54      	ldr	r3, [pc, #336]	; (24a4 <convert_code+0x294>)
    2352:	681b      	ldr	r3, [r3, #0]
    2354:	f043 0308 	orr.w	r3, r3, #8
    2358:	4a52      	ldr	r2, [pc, #328]	; (24a4 <convert_code+0x294>)
    235a:	6013      	str	r3, [r2, #0]
			}
			break;
    235c:	e09c      	b.n	2498 <convert_code+0x288>
		case LCTRL:
			if (flags&RELEASE){
    235e:	4b51      	ldr	r3, [pc, #324]	; (24a4 <convert_code+0x294>)
    2360:	681b      	ldr	r3, [r3, #0]
    2362:	f003 0302 	and.w	r3, r3, #2
    2366:	2b00      	cmp	r3, #0
    2368:	d006      	beq.n	2378 <convert_code+0x168>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    236a:	4b4e      	ldr	r3, [pc, #312]	; (24a4 <convert_code+0x294>)
    236c:	681b      	ldr	r3, [r3, #0]
    236e:	f023 0313 	bic.w	r3, r3, #19
    2372:	4a4c      	ldr	r2, [pc, #304]	; (24a4 <convert_code+0x294>)
    2374:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_CTRL;
			}
			break;
    2376:	e08f      	b.n	2498 <convert_code+0x288>
			break;
		case LCTRL:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
			}else{
				flags|=LEFT_CTRL;
    2378:	4b4a      	ldr	r3, [pc, #296]	; (24a4 <convert_code+0x294>)
    237a:	681b      	ldr	r3, [r3, #0]
    237c:	f043 0310 	orr.w	r3, r3, #16
    2380:	4a48      	ldr	r2, [pc, #288]	; (24a4 <convert_code+0x294>)
    2382:	6013      	str	r3, [r2, #0]
			}
			break;
    2384:	e088      	b.n	2498 <convert_code+0x288>
		case LALT:
			if (flags&RELEASE){
    2386:	4b47      	ldr	r3, [pc, #284]	; (24a4 <convert_code+0x294>)
    2388:	681b      	ldr	r3, [r3, #0]
    238a:	f003 0302 	and.w	r3, r3, #2
    238e:	2b00      	cmp	r3, #0
    2390:	d006      	beq.n	23a0 <convert_code+0x190>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    2392:	4b44      	ldr	r3, [pc, #272]	; (24a4 <convert_code+0x294>)
    2394:	681b      	ldr	r3, [r3, #0]
    2396:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    239a:	4a42      	ldr	r2, [pc, #264]	; (24a4 <convert_code+0x294>)
    239c:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    239e:	e07b      	b.n	2498 <convert_code+0x288>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    23a0:	4b40      	ldr	r3, [pc, #256]	; (24a4 <convert_code+0x294>)
    23a2:	681b      	ldr	r3, [r3, #0]
    23a4:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    23a8:	4a3e      	ldr	r2, [pc, #248]	; (24a4 <convert_code+0x294>)
    23aa:	6013      	str	r3, [r2, #0]
			}
			break;
    23ac:	e074      	b.n	2498 <convert_code+0x288>
		case CAPS_LOCK:
			if (flags&RELEASE){
    23ae:	4b3d      	ldr	r3, [pc, #244]	; (24a4 <convert_code+0x294>)
    23b0:	681b      	ldr	r3, [r3, #0]
    23b2:	f003 0302 	and.w	r3, r3, #2
    23b6:	2b00      	cmp	r3, #0
    23b8:	d006      	beq.n	23c8 <convert_code+0x1b8>
				flags&=~(RELEASE|XTD_CODE);
    23ba:	4b3a      	ldr	r3, [pc, #232]	; (24a4 <convert_code+0x294>)
    23bc:	681b      	ldr	r3, [r3, #0]
    23be:	f023 0303 	bic.w	r3, r3, #3
    23c2:	4a38      	ldr	r2, [pc, #224]	; (24a4 <convert_code+0x294>)
    23c4:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    23c6:	e067      	b.n	2498 <convert_code+0x288>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    23c8:	4b36      	ldr	r3, [pc, #216]	; (24a4 <convert_code+0x294>)
    23ca:	681b      	ldr	r3, [r3, #0]
    23cc:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    23d0:	4a34      	ldr	r2, [pc, #208]	; (24a4 <convert_code+0x294>)
    23d2:	6013      	str	r3, [r2, #0]
			}
			break;
    23d4:	e060      	b.n	2498 <convert_code+0x288>
		default:
			if (!(flags&RELEASE)){
    23d6:	4b33      	ldr	r3, [pc, #204]	; (24a4 <convert_code+0x294>)
    23d8:	681b      	ldr	r3, [r3, #0]
    23da:	f003 0302 	and.w	r3, r3, #2
    23de:	2b00      	cmp	r3, #0
    23e0:	d153      	bne.n	248a <convert_code+0x27a>
					if (flags&XTD_CODE){
    23e2:	4b30      	ldr	r3, [pc, #192]	; (24a4 <convert_code+0x294>)
    23e4:	681b      	ldr	r3, [r3, #0]
    23e6:	f003 0301 	and.w	r3, r3, #1
    23ea:	2b00      	cmp	r3, #0
    23ec:	d00d      	beq.n	240a <convert_code+0x1fa>
						c=search_table(mcsaite_xkey,code);
    23ee:	79fb      	ldrb	r3, [r7, #7]
    23f0:	482d      	ldr	r0, [pc, #180]	; (24a8 <convert_code+0x298>)
    23f2:	4619      	mov	r1, r3
    23f4:	f7ff fef0 	bl	21d8 <search_table>
    23f8:	4603      	mov	r3, r0
    23fa:	75fb      	strb	r3, [r7, #23]
						flags&=~XTD_CODE;
    23fc:	4b29      	ldr	r3, [pc, #164]	; (24a4 <convert_code+0x294>)
    23fe:	681b      	ldr	r3, [r3, #0]
    2400:	f023 0301 	bic.w	r3, r3, #1
    2404:	4a27      	ldr	r2, [pc, #156]	; (24a4 <convert_code+0x294>)
    2406:	6013      	str	r3, [r2, #0]
    2408:	e006      	b.n	2418 <convert_code+0x208>
					}else{
						c=search_table(mcsaite_key,code);
    240a:	79fb      	ldrb	r3, [r7, #7]
    240c:	4827      	ldr	r0, [pc, #156]	; (24ac <convert_code+0x29c>)
    240e:	4619      	mov	r1, r3
    2410:	f7ff fee2 	bl	21d8 <search_table>
    2414:	4603      	mov	r3, r0
    2416:	75fb      	strb	r3, [r7, #23]
					}
					shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    2418:	4b22      	ldr	r3, [pc, #136]	; (24a4 <convert_code+0x294>)
    241a:	681b      	ldr	r3, [r3, #0]
    241c:	f003 030c 	and.w	r3, r3, #12
    2420:	613b      	str	r3, [r7, #16]
					if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    2422:	7dfb      	ldrb	r3, [r7, #23]
    2424:	2b60      	cmp	r3, #96	; 0x60
    2426:	d918      	bls.n	245a <convert_code+0x24a>
    2428:	7dfb      	ldrb	r3, [r7, #23]
    242a:	2b7a      	cmp	r3, #122	; 0x7a
    242c:	d815      	bhi.n	245a <convert_code+0x24a>
    242e:	693b      	ldr	r3, [r7, #16]
    2430:	2b00      	cmp	r3, #0
    2432:	d005      	beq.n	2440 <convert_code+0x230>
    2434:	4b1b      	ldr	r3, [pc, #108]	; (24a4 <convert_code+0x294>)
    2436:	681b      	ldr	r3, [r3, #0]
    2438:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    243c:	2b00      	cmp	r3, #0
    243e:	d008      	beq.n	2452 <convert_code+0x242>
    2440:	693b      	ldr	r3, [r7, #16]
    2442:	2b00      	cmp	r3, #0
    2444:	d109      	bne.n	245a <convert_code+0x24a>
    2446:	4b17      	ldr	r3, [pc, #92]	; (24a4 <convert_code+0x294>)
    2448:	681b      	ldr	r3, [r3, #0]
    244a:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    244e:	2b00      	cmp	r3, #0
    2450:	d003      	beq.n	245a <convert_code+0x24a>
						c-=32;
    2452:	7dfb      	ldrb	r3, [r7, #23]
    2454:	3b20      	subs	r3, #32
    2456:	75fb      	strb	r3, [r7, #23]
    2458:	e00e      	b.n	2478 <convert_code+0x268>
					}else if (shift && (s=search_table(mcsaite_shey,c))){
    245a:	693b      	ldr	r3, [r7, #16]
    245c:	2b00      	cmp	r3, #0
    245e:	d00b      	beq.n	2478 <convert_code+0x268>
    2460:	7dfb      	ldrb	r3, [r7, #23]
    2462:	4813      	ldr	r0, [pc, #76]	; (24b0 <convert_code+0x2a0>)
    2464:	4619      	mov	r1, r3
    2466:	f7ff feb7 	bl	21d8 <search_table>
    246a:	4603      	mov	r3, r0
    246c:	73fb      	strb	r3, [r7, #15]
    246e:	7bfb      	ldrb	r3, [r7, #15]
    2470:	2b00      	cmp	r3, #0
    2472:	d001      	beq.n	2478 <convert_code+0x268>
						c=s;
    2474:	7bfb      	ldrb	r3, [r7, #15]
    2476:	75fb      	strb	r3, [r7, #23]
					}
					if (c){
    2478:	7dfb      	ldrb	r3, [r7, #23]
    247a:	2b00      	cmp	r3, #0
    247c:	d00b      	beq.n	2496 <convert_code+0x286>
						con.insert(c);
    247e:	4b08      	ldr	r3, [pc, #32]	; (24a0 <convert_code+0x290>)
    2480:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    2482:	7dfa      	ldrb	r2, [r7, #23]
    2484:	4610      	mov	r0, r2
    2486:	4798      	blx	r3
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    2488:	e006      	b.n	2498 <convert_code+0x288>
					}
					if (c){
						con.insert(c);
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    248a:	4b06      	ldr	r3, [pc, #24]	; (24a4 <convert_code+0x294>)
    248c:	681b      	ldr	r3, [r3, #0]
    248e:	f023 0303 	bic.w	r3, r3, #3
    2492:	4a04      	ldr	r2, [pc, #16]	; (24a4 <convert_code+0x294>)
    2494:	6013      	str	r3, [r2, #0]
			}
			break;
    2496:	bf00      	nop
		}//switch
}// convert_code()
    2498:	3718      	adds	r7, #24
    249a:	46bd      	mov	sp, r7
    249c:	bd80      	pop	{r7, pc}
    249e:	bf00      	nop
    24a0:	20000100 	.word	0x20000100
    24a4:	200000cc 	.word	0x200000cc
    24a8:	00003ffc 	.word	0x00003ffc
    24ac:	00003f44 	.word	0x00003f44
    24b0:	00003fd0 	.word	0x00003fd0

000024b4 <EXTI9_5_handler>:
#define PS2_QUEUE_SIZE (16)
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];

// signal clock du clavier PS/2
__attribute__((optimize("-O0"))) void KBD_CLK_handler(){
    24b4:	b480      	push	{r7}
    24b6:	b083      	sub	sp, #12
    24b8:	af00      	add	r7, sp, #0
	volatile  static unsigned char  in_byte=0,bit_cnt=0;
    volatile unsigned char parity; 

#define data_bit  (KBD_PORT->IDR & KBD_DAT_PIN)
	EXTI->PR|=KBD_CLK_PIN; 
    24ba:	4a51      	ldr	r2, [pc, #324]	; (2600 <EXTI9_5_handler+0x14c>)
    24bc:	4b50      	ldr	r3, [pc, #320]	; (2600 <EXTI9_5_handler+0x14c>)
    24be:	695b      	ldr	r3, [r3, #20]
    24c0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    24c4:	6153      	str	r3, [r2, #20]
    switch (bit_cnt){
    24c6:	4b4f      	ldr	r3, [pc, #316]	; (2604 <EXTI9_5_handler+0x150>)
    24c8:	781b      	ldrb	r3, [r3, #0]
    24ca:	b2db      	uxtb	r3, r3
    24cc:	2b09      	cmp	r3, #9
    24ce:	d01f      	beq.n	2510 <EXTI9_5_handler+0x5c>
    24d0:	2b0a      	cmp	r3, #10
    24d2:	d031      	beq.n	2538 <EXTI9_5_handler+0x84>
    24d4:	2b00      	cmp	r3, #0
    24d6:	d16c      	bne.n	25b2 <EXTI9_5_handler+0xfe>
	case 0:   // start bit
		ps2_flags&=~(F_ERROR|F_RCVD);
    24d8:	4b4b      	ldr	r3, [pc, #300]	; (2608 <EXTI9_5_handler+0x154>)
    24da:	781b      	ldrb	r3, [r3, #0]
    24dc:	b2db      	uxtb	r3, r3
    24de:	f023 030b 	bic.w	r3, r3, #11
    24e2:	b2da      	uxtb	r2, r3
    24e4:	4b48      	ldr	r3, [pc, #288]	; (2608 <EXTI9_5_handler+0x154>)
    24e6:	701a      	strb	r2, [r3, #0]
		if (!data_bit){
    24e8:	4b48      	ldr	r3, [pc, #288]	; (260c <EXTI9_5_handler+0x158>)
    24ea:	689b      	ldr	r3, [r3, #8]
    24ec:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    24f0:	2b00      	cmp	r3, #0
    24f2:	d10c      	bne.n	250e <EXTI9_5_handler+0x5a>
			in_byte=0;
    24f4:	4b46      	ldr	r3, [pc, #280]	; (2610 <EXTI9_5_handler+0x15c>)
    24f6:	2200      	movs	r2, #0
    24f8:	701a      	strb	r2, [r3, #0]
            parity=0;
    24fa:	2300      	movs	r3, #0
    24fc:	71fb      	strb	r3, [r7, #7]
            bit_cnt++;
    24fe:	4b41      	ldr	r3, [pc, #260]	; (2604 <EXTI9_5_handler+0x150>)
    2500:	781b      	ldrb	r3, [r3, #0]
    2502:	b2db      	uxtb	r3, r3
    2504:	3301      	adds	r3, #1
    2506:	b2da      	uxtb	r2, r3
    2508:	4b3e      	ldr	r3, [pc, #248]	; (2604 <EXTI9_5_handler+0x150>)
    250a:	701a      	strb	r2, [r3, #0]
        }
		break;
    250c:	e073      	b.n	25f6 <EXTI9_5_handler+0x142>
    250e:	e072      	b.n	25f6 <EXTI9_5_handler+0x142>
	case 9:   // paritée
		if (data_bit) parity++;
    2510:	4b3e      	ldr	r3, [pc, #248]	; (260c <EXTI9_5_handler+0x158>)
    2512:	689b      	ldr	r3, [r3, #8]
    2514:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2518:	2b00      	cmp	r3, #0
    251a:	d004      	beq.n	2526 <EXTI9_5_handler+0x72>
    251c:	79fb      	ldrb	r3, [r7, #7]
    251e:	b2db      	uxtb	r3, r3
    2520:	3301      	adds	r3, #1
    2522:	b2db      	uxtb	r3, r3
    2524:	71fb      	strb	r3, [r7, #7]
		if (!(parity & 1)){
    2526:	79fb      	ldrb	r3, [r7, #7]
			//ps2_flags |= F_ERR_PARITY;
			
		}
		bit_cnt++;
    2528:	4b36      	ldr	r3, [pc, #216]	; (2604 <EXTI9_5_handler+0x150>)
    252a:	781b      	ldrb	r3, [r3, #0]
    252c:	b2db      	uxtb	r3, r3
    252e:	3301      	adds	r3, #1
    2530:	b2da      	uxtb	r2, r3
    2532:	4b34      	ldr	r3, [pc, #208]	; (2604 <EXTI9_5_handler+0x150>)
    2534:	701a      	strb	r2, [r3, #0]
		break;
    2536:	e05e      	b.n	25f6 <EXTI9_5_handler+0x142>
	case 10:  // stop bit
	    if (!data_bit){
    2538:	4b34      	ldr	r3, [pc, #208]	; (260c <EXTI9_5_handler+0x158>)
    253a:	689b      	ldr	r3, [r3, #8]
    253c:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2540:	2b00      	cmp	r3, #0
    2542:	d108      	bne.n	2556 <EXTI9_5_handler+0xa2>
			ps2_flags|=F_ERR_FRAME;
    2544:	4b30      	ldr	r3, [pc, #192]	; (2608 <EXTI9_5_handler+0x154>)
    2546:	781b      	ldrb	r3, [r3, #0]
    2548:	b2db      	uxtb	r3, r3
    254a:	f043 0308 	orr.w	r3, r3, #8
    254e:	b2da      	uxtb	r2, r3
    2550:	4b2d      	ldr	r3, [pc, #180]	; (2608 <EXTI9_5_handler+0x154>)
    2552:	701a      	strb	r2, [r3, #0]
    2554:	e029      	b.n	25aa <EXTI9_5_handler+0xf6>
		}else if (!(ps2_flags&F_ERROR)){
    2556:	4b2c      	ldr	r3, [pc, #176]	; (2608 <EXTI9_5_handler+0x154>)
    2558:	781b      	ldrb	r3, [r3, #0]
    255a:	b2db      	uxtb	r3, r3
    255c:	f003 0309 	and.w	r3, r3, #9
    2560:	2b00      	cmp	r3, #0
    2562:	d122      	bne.n	25aa <EXTI9_5_handler+0xf6>
			if (in_byte==BAT_OK){
    2564:	4b2a      	ldr	r3, [pc, #168]	; (2610 <EXTI9_5_handler+0x15c>)
    2566:	781b      	ldrb	r3, [r3, #0]
    2568:	b2db      	uxtb	r3, r3
    256a:	2baa      	cmp	r3, #170	; 0xaa
    256c:	d108      	bne.n	2580 <EXTI9_5_handler+0xcc>
				ps2_flags|=F_BATOK;
    256e:	4b26      	ldr	r3, [pc, #152]	; (2608 <EXTI9_5_handler+0x154>)
    2570:	781b      	ldrb	r3, [r3, #0]
    2572:	b2db      	uxtb	r3, r3
    2574:	f043 0304 	orr.w	r3, r3, #4
    2578:	b2da      	uxtb	r2, r3
    257a:	4b23      	ldr	r3, [pc, #140]	; (2608 <EXTI9_5_handler+0x154>)
    257c:	701a      	strb	r2, [r3, #0]
    257e:	e014      	b.n	25aa <EXTI9_5_handler+0xf6>
			}else{
				ps2_queue[ps2_tail++]=in_byte;
    2580:	4b24      	ldr	r3, [pc, #144]	; (2614 <EXTI9_5_handler+0x160>)
    2582:	781b      	ldrb	r3, [r3, #0]
    2584:	b2db      	uxtb	r3, r3
    2586:	1c5a      	adds	r2, r3, #1
    2588:	b2d1      	uxtb	r1, r2
    258a:	4a22      	ldr	r2, [pc, #136]	; (2614 <EXTI9_5_handler+0x160>)
    258c:	7011      	strb	r1, [r2, #0]
    258e:	461a      	mov	r2, r3
    2590:	4b1f      	ldr	r3, [pc, #124]	; (2610 <EXTI9_5_handler+0x15c>)
    2592:	781b      	ldrb	r3, [r3, #0]
    2594:	b2d9      	uxtb	r1, r3
    2596:	4b20      	ldr	r3, [pc, #128]	; (2618 <EXTI9_5_handler+0x164>)
    2598:	5499      	strb	r1, [r3, r2]
				ps2_tail&=PS2_QUEUE_SIZE-1;
    259a:	4b1e      	ldr	r3, [pc, #120]	; (2614 <EXTI9_5_handler+0x160>)
    259c:	781b      	ldrb	r3, [r3, #0]
    259e:	b2db      	uxtb	r3, r3
    25a0:	f003 030f 	and.w	r3, r3, #15
    25a4:	b2da      	uxtb	r2, r3
    25a6:	4b1b      	ldr	r3, [pc, #108]	; (2614 <EXTI9_5_handler+0x160>)
    25a8:	701a      	strb	r2, [r3, #0]
			}
	    }
	    bit_cnt=0;
    25aa:	4b16      	ldr	r3, [pc, #88]	; (2604 <EXTI9_5_handler+0x150>)
    25ac:	2200      	movs	r2, #0
    25ae:	701a      	strb	r2, [r3, #0]
		break;
    25b0:	e021      	b.n	25f6 <EXTI9_5_handler+0x142>
	default:
		in_byte >>=1;
    25b2:	4b17      	ldr	r3, [pc, #92]	; (2610 <EXTI9_5_handler+0x15c>)
    25b4:	781b      	ldrb	r3, [r3, #0]
    25b6:	b2db      	uxtb	r3, r3
    25b8:	085b      	lsrs	r3, r3, #1
    25ba:	b2da      	uxtb	r2, r3
    25bc:	4b14      	ldr	r3, [pc, #80]	; (2610 <EXTI9_5_handler+0x15c>)
    25be:	701a      	strb	r2, [r3, #0]
		if(data_bit){
    25c0:	4b12      	ldr	r3, [pc, #72]	; (260c <EXTI9_5_handler+0x158>)
    25c2:	689b      	ldr	r3, [r3, #8]
    25c4:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    25c8:	2b00      	cmp	r3, #0
    25ca:	d00c      	beq.n	25e6 <EXTI9_5_handler+0x132>
			in_byte |=128;
    25cc:	4b10      	ldr	r3, [pc, #64]	; (2610 <EXTI9_5_handler+0x15c>)
    25ce:	781b      	ldrb	r3, [r3, #0]
    25d0:	b2db      	uxtb	r3, r3
    25d2:	f063 037f 	orn	r3, r3, #127	; 0x7f
    25d6:	b2da      	uxtb	r2, r3
    25d8:	4b0d      	ldr	r3, [pc, #52]	; (2610 <EXTI9_5_handler+0x15c>)
    25da:	701a      	strb	r2, [r3, #0]
			parity++;
    25dc:	79fb      	ldrb	r3, [r7, #7]
    25de:	b2db      	uxtb	r3, r3
    25e0:	3301      	adds	r3, #1
    25e2:	b2db      	uxtb	r3, r3
    25e4:	71fb      	strb	r3, [r7, #7]
		}
		bit_cnt++;
    25e6:	4b07      	ldr	r3, [pc, #28]	; (2604 <EXTI9_5_handler+0x150>)
    25e8:	781b      	ldrb	r3, [r3, #0]
    25ea:	b2db      	uxtb	r3, r3
    25ec:	3301      	adds	r3, #1
    25ee:	b2da      	uxtb	r2, r3
    25f0:	4b04      	ldr	r3, [pc, #16]	; (2604 <EXTI9_5_handler+0x150>)
    25f2:	701a      	strb	r2, [r3, #0]
		break;
    25f4:	bf00      	nop
	}
}
    25f6:	370c      	adds	r7, #12
    25f8:	46bd      	mov	sp, r7
    25fa:	f85d 7b04 	ldr.w	r7, [sp], #4
    25fe:	4770      	bx	lr
    2600:	40010400 	.word	0x40010400
    2604:	200000e4 	.word	0x200000e4
    2608:	200000c8 	.word	0x200000c8
    260c:	40010800 	.word	0x40010800
    2610:	200000e5 	.word	0x200000e5
    2614:	200000d1 	.word	0x200000d1
    2618:	200000d4 	.word	0x200000d4

0000261c <TIM2_handler>:

void TIM2_handler(){
    261c:	b580      	push	{r7, lr}
    261e:	af00      	add	r7, sp, #0
	TMR2->SR&=~(BIT0); // clear interrupt bit
    2620:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    2624:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    2628:	691b      	ldr	r3, [r3, #16]
    262a:	f023 0301 	bic.w	r3, r3, #1
    262e:	6113      	str	r3, [r2, #16]
	if (ps2_tail!=ps2_head){
    2630:	4b0f      	ldr	r3, [pc, #60]	; (2670 <TIM2_handler+0x54>)
    2632:	781b      	ldrb	r3, [r3, #0]
    2634:	b2da      	uxtb	r2, r3
    2636:	4b0f      	ldr	r3, [pc, #60]	; (2674 <TIM2_handler+0x58>)
    2638:	781b      	ldrb	r3, [r3, #0]
    263a:	b2db      	uxtb	r3, r3
    263c:	429a      	cmp	r2, r3
    263e:	d015      	beq.n	266c <TIM2_handler+0x50>
		convert_code(ps2_queue[ps2_head++]);
    2640:	4b0c      	ldr	r3, [pc, #48]	; (2674 <TIM2_handler+0x58>)
    2642:	781b      	ldrb	r3, [r3, #0]
    2644:	b2db      	uxtb	r3, r3
    2646:	1c5a      	adds	r2, r3, #1
    2648:	b2d1      	uxtb	r1, r2
    264a:	4a0a      	ldr	r2, [pc, #40]	; (2674 <TIM2_handler+0x58>)
    264c:	7011      	strb	r1, [r2, #0]
    264e:	461a      	mov	r2, r3
    2650:	4b09      	ldr	r3, [pc, #36]	; (2678 <TIM2_handler+0x5c>)
    2652:	5c9b      	ldrb	r3, [r3, r2]
    2654:	b2db      	uxtb	r3, r3
    2656:	4618      	mov	r0, r3
    2658:	f7ff fdda 	bl	2210 <convert_code>
		ps2_head&=PS2_QUEUE_SIZE-1;
    265c:	4b05      	ldr	r3, [pc, #20]	; (2674 <TIM2_handler+0x58>)
    265e:	781b      	ldrb	r3, [r3, #0]
    2660:	b2db      	uxtb	r3, r3
    2662:	f003 030f 	and.w	r3, r3, #15
    2666:	b2da      	uxtb	r2, r3
    2668:	4b02      	ldr	r3, [pc, #8]	; (2674 <TIM2_handler+0x58>)
    266a:	701a      	strb	r2, [r3, #0]
	}
}
    266c:	bd80      	pop	{r7, pc}
    266e:	bf00      	nop
    2670:	200000d1 	.word	0x200000d1
    2674:	200000d0 	.word	0x200000d0
    2678:	200000d4 	.word	0x200000d4

0000267c <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(int irq){
    267c:	b480      	push	{r7}
    267e:	b083      	sub	sp, #12
    2680:	af00      	add	r7, sp, #0
    2682:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    2684:	687b      	ldr	r3, [r7, #4]
    2686:	2b3b      	cmp	r3, #59	; 0x3b
    2688:	dd00      	ble.n	268c <enable_interrupt+0x10>
    268a:	e016      	b.n	26ba <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    268c:	687b      	ldr	r3, [r7, #4]
    268e:	115b      	asrs	r3, r3, #5
    2690:	009b      	lsls	r3, r3, #2
    2692:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2696:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    269a:	687a      	ldr	r2, [r7, #4]
    269c:	1152      	asrs	r2, r2, #5
    269e:	0092      	lsls	r2, r2, #2
    26a0:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    26a4:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    26a8:	6812      	ldr	r2, [r2, #0]
    26aa:	6879      	ldr	r1, [r7, #4]
    26ac:	f001 011f 	and.w	r1, r1, #31
    26b0:	2001      	movs	r0, #1
    26b2:	fa00 f101 	lsl.w	r1, r0, r1
    26b6:	430a      	orrs	r2, r1
    26b8:	601a      	str	r2, [r3, #0]
}
    26ba:	370c      	adds	r7, #12
    26bc:	46bd      	mov	sp, r7
    26be:	f85d 7b04 	ldr.w	r7, [sp], #4
    26c2:	4770      	bx	lr

000026c4 <disable_interrupt>:


void disable_interrupt(int irq){
    26c4:	b480      	push	{r7}
    26c6:	b083      	sub	sp, #12
    26c8:	af00      	add	r7, sp, #0
    26ca:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    26cc:	687b      	ldr	r3, [r7, #4]
    26ce:	2b3b      	cmp	r3, #59	; 0x3b
    26d0:	dd00      	ble.n	26d4 <disable_interrupt+0x10>
    26d2:	e00b      	b.n	26ec <disable_interrupt+0x28>
	ICER[irq>>5]=(1<<(irq&0x1f));
    26d4:	687b      	ldr	r3, [r7, #4]
    26d6:	115b      	asrs	r3, r3, #5
    26d8:	009a      	lsls	r2, r3, #2
    26da:	4b07      	ldr	r3, [pc, #28]	; (26f8 <disable_interrupt+0x34>)
    26dc:	4413      	add	r3, r2
    26de:	687a      	ldr	r2, [r7, #4]
    26e0:	f002 021f 	and.w	r2, r2, #31
    26e4:	2101      	movs	r1, #1
    26e6:	fa01 f202 	lsl.w	r2, r1, r2
    26ea:	601a      	str	r2, [r3, #0]
}
    26ec:	370c      	adds	r7, #12
    26ee:	46bd      	mov	sp, r7
    26f0:	f85d 7b04 	ldr.w	r7, [sp], #4
    26f4:	4770      	bx	lr
    26f6:	bf00      	nop
    26f8:	e000e180 	.word	0xe000e180

000026fc <get_pending>:

unsigned get_pending(int irq){
    26fc:	b480      	push	{r7}
    26fe:	b083      	sub	sp, #12
    2700:	af00      	add	r7, sp, #0
    2702:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    2704:	687b      	ldr	r3, [r7, #4]
    2706:	2b3b      	cmp	r3, #59	; 0x3b
    2708:	dd01      	ble.n	270e <get_pending+0x12>
    270a:	2300      	movs	r3, #0
    270c:	e00c      	b.n	2728 <get_pending+0x2c>
	return ICPR[irq>>5]&(1<<(irq&0x1f));
    270e:	687b      	ldr	r3, [r7, #4]
    2710:	115b      	asrs	r3, r3, #5
    2712:	009a      	lsls	r2, r3, #2
    2714:	4b07      	ldr	r3, [pc, #28]	; (2734 <get_pending+0x38>)
    2716:	4413      	add	r3, r2
    2718:	681b      	ldr	r3, [r3, #0]
    271a:	687a      	ldr	r2, [r7, #4]
    271c:	f002 021f 	and.w	r2, r2, #31
    2720:	2101      	movs	r1, #1
    2722:	fa01 f202 	lsl.w	r2, r1, r2
    2726:	4013      	ands	r3, r2
}
    2728:	4618      	mov	r0, r3
    272a:	370c      	adds	r7, #12
    272c:	46bd      	mov	sp, r7
    272e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2732:	4770      	bx	lr
    2734:	e000e280 	.word	0xe000e280

00002738 <get_active>:

unsigned get_active(int irq){
    2738:	b480      	push	{r7}
    273a:	b083      	sub	sp, #12
    273c:	af00      	add	r7, sp, #0
    273e:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    2740:	687b      	ldr	r3, [r7, #4]
    2742:	2b3b      	cmp	r3, #59	; 0x3b
    2744:	dd01      	ble.n	274a <get_active+0x12>
    2746:	2300      	movs	r3, #0
    2748:	e00e      	b.n	2768 <get_active+0x30>
	return IABR[irq>>5]&(1<<(irq&0x1f));
    274a:	687b      	ldr	r3, [r7, #4]
    274c:	115b      	asrs	r3, r3, #5
    274e:	009b      	lsls	r3, r3, #2
    2750:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2754:	f503 4363 	add.w	r3, r3, #58112	; 0xe300
    2758:	681b      	ldr	r3, [r3, #0]
    275a:	687a      	ldr	r2, [r7, #4]
    275c:	f002 021f 	and.w	r2, r2, #31
    2760:	2101      	movs	r1, #1
    2762:	fa01 f202 	lsl.w	r2, r1, r2
    2766:	4013      	ands	r3, r2
}
    2768:	4618      	mov	r0, r3
    276a:	370c      	adds	r7, #12
    276c:	46bd      	mov	sp, r7
    276e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2772:	4770      	bx	lr

00002774 <set_pending>:

void set_pending(int irq){
    2774:	b480      	push	{r7}
    2776:	b083      	sub	sp, #12
    2778:	af00      	add	r7, sp, #0
    277a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    277c:	687b      	ldr	r3, [r7, #4]
    277e:	2b3b      	cmp	r3, #59	; 0x3b
    2780:	dd00      	ble.n	2784 <set_pending+0x10>
    2782:	e016      	b.n	27b2 <set_pending+0x3e>
	ISPR[irq>>5]|=1<<(irq&0x1f);
    2784:	687b      	ldr	r3, [r7, #4]
    2786:	115b      	asrs	r3, r3, #5
    2788:	009b      	lsls	r3, r3, #2
    278a:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    278e:	f503 4362 	add.w	r3, r3, #57856	; 0xe200
    2792:	687a      	ldr	r2, [r7, #4]
    2794:	1152      	asrs	r2, r2, #5
    2796:	0092      	lsls	r2, r2, #2
    2798:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    279c:	f502 4262 	add.w	r2, r2, #57856	; 0xe200
    27a0:	6812      	ldr	r2, [r2, #0]
    27a2:	6879      	ldr	r1, [r7, #4]
    27a4:	f001 011f 	and.w	r1, r1, #31
    27a8:	2001      	movs	r0, #1
    27aa:	fa00 f101 	lsl.w	r1, r0, r1
    27ae:	430a      	orrs	r2, r1
    27b0:	601a      	str	r2, [r3, #0]
}
    27b2:	370c      	adds	r7, #12
    27b4:	46bd      	mov	sp, r7
    27b6:	f85d 7b04 	ldr.w	r7, [sp], #4
    27ba:	4770      	bx	lr

000027bc <clear_pending>:

void clear_pending(int irq){
    27bc:	b480      	push	{r7}
    27be:	b083      	sub	sp, #12
    27c0:	af00      	add	r7, sp, #0
    27c2:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    27c4:	687b      	ldr	r3, [r7, #4]
    27c6:	2b3b      	cmp	r3, #59	; 0x3b
    27c8:	dd00      	ble.n	27cc <clear_pending+0x10>
    27ca:	e00b      	b.n	27e4 <clear_pending+0x28>
	ICPR[irq>>5]=(1<<(irq&0x1f));
    27cc:	687b      	ldr	r3, [r7, #4]
    27ce:	115b      	asrs	r3, r3, #5
    27d0:	009a      	lsls	r2, r3, #2
    27d2:	4b07      	ldr	r3, [pc, #28]	; (27f0 <clear_pending+0x34>)
    27d4:	4413      	add	r3, r2
    27d6:	687a      	ldr	r2, [r7, #4]
    27d8:	f002 021f 	and.w	r2, r2, #31
    27dc:	2101      	movs	r1, #1
    27de:	fa01 f202 	lsl.w	r2, r1, r2
    27e2:	601a      	str	r2, [r3, #0]
}
    27e4:	370c      	adds	r7, #12
    27e6:	46bd      	mov	sp, r7
    27e8:	f85d 7b04 	ldr.w	r7, [sp], #4
    27ec:	4770      	bx	lr
    27ee:	bf00      	nop
    27f0:	e000e280 	.word	0xe000e280

000027f4 <set_int_priority>:


void set_int_priority(int irq, unsigned priority){
    27f4:	b480      	push	{r7}
    27f6:	b083      	sub	sp, #12
    27f8:	af00      	add	r7, sp, #0
    27fa:	6078      	str	r0, [r7, #4]
    27fc:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    27fe:	687b      	ldr	r3, [r7, #4]
    2800:	2b00      	cmp	r3, #0
    2802:	db0d      	blt.n	2820 <set_int_priority+0x2c>
    2804:	687b      	ldr	r3, [r7, #4]
    2806:	2b3b      	cmp	r3, #59	; 0x3b
    2808:	dc0a      	bgt.n	2820 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    280a:	687b      	ldr	r3, [r7, #4]
    280c:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2810:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    2814:	683a      	ldr	r2, [r7, #0]
    2816:	b2d2      	uxtb	r2, r2
    2818:	0112      	lsls	r2, r2, #4
    281a:	b2d2      	uxtb	r2, r2
    281c:	701a      	strb	r2, [r3, #0]
    281e:	e012      	b.n	2846 <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    2820:	687b      	ldr	r3, [r7, #4]
    2822:	2b00      	cmp	r3, #0
    2824:	da0f      	bge.n	2846 <set_int_priority+0x52>
    2826:	687b      	ldr	r3, [r7, #4]
    2828:	f113 0f0f 	cmn.w	r3, #15
    282c:	db0b      	blt.n	2846 <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    282e:	687a      	ldr	r2, [r7, #4]
    2830:	f06f 0303 	mvn.w	r3, #3
    2834:	1a9b      	subs	r3, r3, r2
    2836:	461a      	mov	r2, r3
    2838:	4b05      	ldr	r3, [pc, #20]	; (2850 <set_int_priority+0x5c>)
    283a:	4413      	add	r3, r2
    283c:	683a      	ldr	r2, [r7, #0]
    283e:	b2d2      	uxtb	r2, r2
    2840:	0112      	lsls	r2, r2, #4
    2842:	b2d2      	uxtb	r2, r2
    2844:	701a      	strb	r2, [r3, #0]
	}
}
    2846:	370c      	adds	r7, #12
    2848:	46bd      	mov	sp, r7
    284a:	f85d 7b04 	ldr.w	r7, [sp], #4
    284e:	4770      	bx	lr
    2850:	e000ed18 	.word	0xe000ed18

00002854 <sdcard_capacity>:

uint16_t sdc_status; // indicateurs booléens carte SD
static unsigned blocks_count; // nombre de bloc de 512 octets

// retourne la capacité en Mo
unsigned sdcard_capacity(){
    2854:	b480      	push	{r7}
    2856:	af00      	add	r7, sp, #0
	return blocks_count/2048;
    2858:	4b03      	ldr	r3, [pc, #12]	; (2868 <sdcard_capacity+0x14>)
    285a:	681b      	ldr	r3, [r3, #0]
    285c:	0adb      	lsrs	r3, r3, #11
}
    285e:	4618      	mov	r0, r3
    2860:	46bd      	mov	sp, r7
    2862:	f85d 7b04 	ldr.w	r7, [sp], #4
    2866:	4770      	bx	lr
    2868:	200000e8 	.word	0x200000e8

0000286c <dummy_clock>:

// après la mise sous tension la carte
// doit-être activée par 80 clock
static void dummy_clock(){
    286c:	b580      	push	{r7, lr}
    286e:	b082      	sub	sp, #8
    2870:	af00      	add	r7, sp, #0
		int i;
		_sdcard_cs_high();
    2872:	4a0a      	ldr	r2, [pc, #40]	; (289c <dummy_clock+0x30>)
    2874:	4b09      	ldr	r3, [pc, #36]	; (289c <dummy_clock+0x30>)
    2876:	68db      	ldr	r3, [r3, #12]
    2878:	f043 0310 	orr.w	r3, r3, #16
    287c:	60d3      	str	r3, [r2, #12]
		// envoie de 80 clock pour activer la carte
		for (i=0;i<10;i++)spi_read(SDC_SPI);
    287e:	2300      	movs	r3, #0
    2880:	607b      	str	r3, [r7, #4]
    2882:	e005      	b.n	2890 <dummy_clock+0x24>
    2884:	4806      	ldr	r0, [pc, #24]	; (28a0 <dummy_clock+0x34>)
    2886:	f000 fb41 	bl	2f0c <spi_read>
    288a:	687b      	ldr	r3, [r7, #4]
    288c:	3301      	adds	r3, #1
    288e:	607b      	str	r3, [r7, #4]
    2890:	687b      	ldr	r3, [r7, #4]
    2892:	2b09      	cmp	r3, #9
    2894:	ddf6      	ble.n	2884 <dummy_clock+0x18>
}
    2896:	3708      	adds	r7, #8
    2898:	46bd      	mov	sp, r7
    289a:	bd80      	pop	{r7, pc}
    289c:	40010800 	.word	0x40010800
    28a0:	40013000 	.word	0x40013000

000028a4 <sdc_wait_ready>:

// attend que la carte soie prête
// lit des caractère de la carte 
// jusqu'à ce que le caractèr lu soit 0xff
// expire après 10msec
static int sdc_wait_ready(){
    28a4:	b580      	push	{r7, lr}
    28a6:	b082      	sub	sp, #8
    28a8:	af00      	add	r7, sp, #0
	unsigned char c;
	unsigned t0;
	t0=ticks+500;
    28aa:	4b0f      	ldr	r3, [pc, #60]	; (28e8 <sdc_wait_ready+0x44>)
    28ac:	681b      	ldr	r3, [r3, #0]
    28ae:	f503 73fa 	add.w	r3, r3, #500	; 0x1f4
    28b2:	603b      	str	r3, [r7, #0]
	while (ticks<t0){
    28b4:	e008      	b.n	28c8 <sdc_wait_ready+0x24>
		c=spi_read(SDC_SPI);
    28b6:	480d      	ldr	r0, [pc, #52]	; (28ec <sdc_wait_ready+0x48>)
    28b8:	f000 fb28 	bl	2f0c <spi_read>
    28bc:	4603      	mov	r3, r0
    28be:	71fb      	strb	r3, [r7, #7]
	    if (c==0xff){break;}
    28c0:	79fb      	ldrb	r3, [r7, #7]
    28c2:	2bff      	cmp	r3, #255	; 0xff
    28c4:	d100      	bne.n	28c8 <sdc_wait_ready+0x24>
    28c6:	e004      	b.n	28d2 <sdc_wait_ready+0x2e>
// expire après 10msec
static int sdc_wait_ready(){
	unsigned char c;
	unsigned t0;
	t0=ticks+500;
	while (ticks<t0){
    28c8:	4b07      	ldr	r3, [pc, #28]	; (28e8 <sdc_wait_ready+0x44>)
    28ca:	681a      	ldr	r2, [r3, #0]
    28cc:	683b      	ldr	r3, [r7, #0]
    28ce:	429a      	cmp	r2, r3
    28d0:	d3f1      	bcc.n	28b6 <sdc_wait_ready+0x12>
		c=spi_read(SDC_SPI);
	    if (c==0xff){break;}
	}
	return c==0xff;
    28d2:	79fb      	ldrb	r3, [r7, #7]
    28d4:	2bff      	cmp	r3, #255	; 0xff
    28d6:	bf0c      	ite	eq
    28d8:	2301      	moveq	r3, #1
    28da:	2300      	movne	r3, #0
    28dc:	b2db      	uxtb	r3, r3
}
    28de:	4618      	mov	r0, r3
    28e0:	3708      	adds	r7, #8
    28e2:	46bd      	mov	sp, r7
    28e4:	bd80      	pop	{r7, pc}
    28e6:	bf00      	nop
    28e8:	200000ec 	.word	0x200000ec
    28ec:	40013000 	.word	0x40013000

000028f0 <sdcard_deselect>:

// desactivation de l'interface avec la carte
void sdcard_deselect(){
    28f0:	b580      	push	{r7, lr}
    28f2:	af00      	add	r7, sp, #0
	_sdcard_cs_high();
    28f4:	4a05      	ldr	r2, [pc, #20]	; (290c <sdcard_deselect+0x1c>)
    28f6:	4b05      	ldr	r3, [pc, #20]	; (290c <sdcard_deselect+0x1c>)
    28f8:	68db      	ldr	r3, [r3, #12]
    28fa:	f043 0310 	orr.w	r3, r3, #16
    28fe:	60d3      	str	r3, [r2, #12]
	spi_write(SDC_SPI,0xff);
    2900:	4803      	ldr	r0, [pc, #12]	; (2910 <sdcard_deselect+0x20>)
    2902:	21ff      	movs	r1, #255	; 0xff
    2904:	f000 fae2 	bl	2ecc <spi_write>
}
    2908:	bd80      	pop	{r7, pc}
    290a:	bf00      	nop
    290c:	40010800 	.word	0x40010800
    2910:	40013000 	.word	0x40013000

00002914 <sdcard_select>:

// sélection la carte
int sdcard_select(){
    2914:	b580      	push	{r7, lr}
    2916:	af00      	add	r7, sp, #0
	_sdcard_cs_low();
    2918:	4a0a      	ldr	r2, [pc, #40]	; (2944 <sdcard_select+0x30>)
    291a:	4b0a      	ldr	r3, [pc, #40]	; (2944 <sdcard_select+0x30>)
    291c:	68db      	ldr	r3, [r3, #12]
    291e:	f023 0310 	bic.w	r3, r3, #16
    2922:	60d3      	str	r3, [r2, #12]
	spi_write(SDC_SPI,0xff);
    2924:	4808      	ldr	r0, [pc, #32]	; (2948 <sdcard_select+0x34>)
    2926:	21ff      	movs	r1, #255	; 0xff
    2928:	f000 fad0 	bl	2ecc <spi_write>
	if (sdc_wait_ready()){
    292c:	f7ff ffba 	bl	28a4 <sdc_wait_ready>
    2930:	4603      	mov	r3, r0
    2932:	2b00      	cmp	r3, #0
    2934:	d001      	beq.n	293a <sdcard_select+0x26>
		return 1;
    2936:	2301      	movs	r3, #1
    2938:	e002      	b.n	2940 <sdcard_select+0x2c>
	}else{
		sdcard_deselect();
    293a:	f7ff ffd9 	bl	28f0 <sdcard_deselect>
		return 0;
    293e:	2300      	movs	r3, #0
	}
}
    2940:	4618      	mov	r0, r3
    2942:	bd80      	pop	{r7, pc}
    2944:	40010800 	.word	0x40010800
    2948:	40013000 	.word	0x40013000

0000294c <sdc_cmd>:
*    cmd  index de la commande
*    args arguments de la commande
* retourne:
*   r1 1ier octet réponse de la carte
***********************************/
unsigned char sdc_cmd(unsigned char cmd,unsigned char *args){
    294c:	b580      	push	{r7, lr}
    294e:	b084      	sub	sp, #16
    2950:	af00      	add	r7, sp, #0
    2952:	4603      	mov	r3, r0
    2954:	6039      	str	r1, [r7, #0]
    2956:	71fb      	strb	r3, [r7, #7]
    unsigned char r1;
    int i;
    
    sdcard_deselect();
    2958:	f7ff ffca 	bl	28f0 <sdcard_deselect>
    if (!sdcard_select()) return 0xff;
    295c:	f7ff ffda 	bl	2914 <sdcard_select>
    2960:	4603      	mov	r3, r0
    2962:	2b00      	cmp	r3, #0
    2964:	d101      	bne.n	296a <sdc_cmd+0x1e>
    2966:	23ff      	movs	r3, #255	; 0xff
    2968:	e020      	b.n	29ac <sdc_cmd+0x60>
    spi_write(SDC_SPI,cmd|0x40);
    296a:	79fb      	ldrb	r3, [r7, #7]
    296c:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    2970:	b2db      	uxtb	r3, r3
    2972:	4810      	ldr	r0, [pc, #64]	; (29b4 <sdc_cmd+0x68>)
    2974:	4619      	mov	r1, r3
    2976:	f000 faa9 	bl	2ecc <spi_write>
    spi_block_write(SDC_SPI,args,5);
    297a:	480e      	ldr	r0, [pc, #56]	; (29b4 <sdc_cmd+0x68>)
    297c:	6839      	ldr	r1, [r7, #0]
    297e:	2205      	movs	r2, #5
    2980:	f000 fae4 	bl	2f4c <spi_block_write>
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
    2984:	2308      	movs	r3, #8
    2986:	60bb      	str	r3, [r7, #8]
    2988:	e00c      	b.n	29a4 <sdc_cmd+0x58>
		r1=spi_read(SDC_SPI);
    298a:	480a      	ldr	r0, [pc, #40]	; (29b4 <sdc_cmd+0x68>)
    298c:	f000 fabe 	bl	2f0c <spi_read>
    2990:	4603      	mov	r3, r0
    2992:	73fb      	strb	r3, [r7, #15]
		if (r1<128) {break;}
    2994:	7bfb      	ldrb	r3, [r7, #15]
    2996:	b25b      	sxtb	r3, r3
    2998:	2b00      	cmp	r3, #0
    299a:	db00      	blt.n	299e <sdc_cmd+0x52>
    299c:	e005      	b.n	29aa <sdc_cmd+0x5e>
    if (!sdcard_select()) return 0xff;
    spi_write(SDC_SPI,cmd|0x40);
    spi_block_write(SDC_SPI,args,5);
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
    299e:	68bb      	ldr	r3, [r7, #8]
    29a0:	3b01      	subs	r3, #1
    29a2:	60bb      	str	r3, [r7, #8]
    29a4:	68bb      	ldr	r3, [r7, #8]
    29a6:	2b00      	cmp	r3, #0
    29a8:	d1ef      	bne.n	298a <sdc_cmd+0x3e>
		r1=spi_read(SDC_SPI);
		if (r1<128) {break;}
	}
    return r1;
    29aa:	7bfb      	ldrb	r3, [r7, #15]
}
    29ac:	4618      	mov	r0, r3
    29ae:	3710      	adds	r7, #16
    29b0:	46bd      	mov	sp, r7
    29b2:	bd80      	pop	{r7, pc}
    29b4:	40013000 	.word	0x40013000

000029b8 <sdc_read_register>:

unsigned char sdc_read_register(unsigned char index, unsigned char *reg){
    29b8:	b580      	push	{r7, lr}
    29ba:	b084      	sub	sp, #16
    29bc:	af00      	add	r7, sp, #0
    29be:	4603      	mov	r3, r0
    29c0:	6039      	str	r1, [r7, #0]
    29c2:	71fb      	strb	r3, [r7, #7]
	unsigned char c=0xff, r1, args[5]={0,0,0,0,0};
    29c4:	23ff      	movs	r3, #255	; 0xff
    29c6:	73fb      	strb	r3, [r7, #15]
    29c8:	2300      	movs	r3, #0
    29ca:	723b      	strb	r3, [r7, #8]
    29cc:	2300      	movs	r3, #0
    29ce:	727b      	strb	r3, [r7, #9]
    29d0:	2300      	movs	r3, #0
    29d2:	72bb      	strb	r3, [r7, #10]
    29d4:	2300      	movs	r3, #0
    29d6:	72fb      	strb	r3, [r7, #11]
    29d8:	2300      	movs	r3, #0
    29da:	733b      	strb	r3, [r7, #12]
	r1=sdc_cmd(index,args);
    29dc:	79fa      	ldrb	r2, [r7, #7]
    29de:	f107 0308 	add.w	r3, r7, #8
    29e2:	4610      	mov	r0, r2
    29e4:	4619      	mov	r1, r3
    29e6:	f7ff ffb1 	bl	294c <sdc_cmd>
    29ea:	4603      	mov	r3, r0
    29ec:	73bb      	strb	r3, [r7, #14]
	if (!r1){
    29ee:	7bbb      	ldrb	r3, [r7, #14]
    29f0:	2b00      	cmp	r3, #0
    29f2:	d115      	bne.n	2a20 <sdc_read_register+0x68>
		do {
			c=spi_read(SDC_SPI);
    29f4:	480f      	ldr	r0, [pc, #60]	; (2a34 <sdc_read_register+0x7c>)
    29f6:	f000 fa89 	bl	2f0c <spi_read>
    29fa:	4603      	mov	r3, r0
    29fc:	73fb      	strb	r3, [r7, #15]
		}while (c==0xff);
    29fe:	7bfb      	ldrb	r3, [r7, #15]
    2a00:	2bff      	cmp	r3, #255	; 0xff
    2a02:	d0f7      	beq.n	29f4 <sdc_read_register+0x3c>
		if (c==0xfe){ // lecture de 16 octets
    2a04:	7bfb      	ldrb	r3, [r7, #15]
    2a06:	2bfe      	cmp	r3, #254	; 0xfe
    2a08:	d10a      	bne.n	2a20 <sdc_read_register+0x68>
			spi_block_read(SDC_SPI,reg,16);
    2a0a:	480a      	ldr	r0, [pc, #40]	; (2a34 <sdc_read_register+0x7c>)
    2a0c:	6839      	ldr	r1, [r7, #0]
    2a0e:	2210      	movs	r2, #16
    2a10:	f000 fac6 	bl	2fa0 <spi_block_read>
			// lecture du CRC 16 bits
			spi_read(SDC_SPI);
    2a14:	4807      	ldr	r0, [pc, #28]	; (2a34 <sdc_read_register+0x7c>)
    2a16:	f000 fa79 	bl	2f0c <spi_read>
			spi_read(SDC_SPI);
    2a1a:	4806      	ldr	r0, [pc, #24]	; (2a34 <sdc_read_register+0x7c>)
    2a1c:	f000 fa76 	bl	2f0c <spi_read>
		}
	}
//	sdcard_deselect();
	return !r1;
    2a20:	7bbb      	ldrb	r3, [r7, #14]
    2a22:	2b00      	cmp	r3, #0
    2a24:	bf0c      	ite	eq
    2a26:	2301      	moveq	r3, #1
    2a28:	2300      	movne	r3, #0
    2a2a:	b2db      	uxtb	r3, r3
}
    2a2c:	4618      	mov	r0, r3
    2a2e:	3710      	adds	r7, #16
    2a30:	46bd      	mov	sp, r7
    2a32:	bd80      	pop	{r7, pc}
    2a34:	40013000 	.word	0x40013000

00002a38 <sdc_set_size>:

// détermine la capacité de la carte
static unsigned char sdc_set_size(){
    2a38:	b580      	push	{r7, lr}
    2a3a:	b088      	sub	sp, #32
    2a3c:	af00      	add	r7, sp, #0
	unsigned char r1,csd[16];
	unsigned block_len,c_size,c_size_mult;
	r1=sdc_read_register(SEND_CSD,csd);
    2a3e:	463b      	mov	r3, r7
    2a40:	2009      	movs	r0, #9
    2a42:	4619      	mov	r1, r3
    2a44:	f7ff ffb8 	bl	29b8 <sdc_read_register>
    2a48:	4603      	mov	r3, r0
    2a4a:	77fb      	strb	r3, [r7, #31]
	if (r1){
    2a4c:	7ffb      	ldrb	r3, [r7, #31]
    2a4e:	2b00      	cmp	r3, #0
    2a50:	d038      	beq.n	2ac4 <sdc_set_size+0x8c>
		if (sdc_status&F_SDC_HC){//version 2, carte haute capacité
    2a52:	4b1f      	ldr	r3, [pc, #124]	; (2ad0 <sdc_set_size+0x98>)
    2a54:	881b      	ldrh	r3, [r3, #0]
    2a56:	f003 0308 	and.w	r3, r3, #8
    2a5a:	2b00      	cmp	r3, #0
    2a5c:	d008      	beq.n	2a70 <sdc_set_size+0x38>
			blocks_count=1024*((csd[8]<<8)+csd[9]);
    2a5e:	7a3b      	ldrb	r3, [r7, #8]
    2a60:	021b      	lsls	r3, r3, #8
    2a62:	7a7a      	ldrb	r2, [r7, #9]
    2a64:	4413      	add	r3, r2
    2a66:	029b      	lsls	r3, r3, #10
    2a68:	461a      	mov	r2, r3
    2a6a:	4b1a      	ldr	r3, [pc, #104]	; (2ad4 <sdc_set_size+0x9c>)
    2a6c:	601a      	str	r2, [r3, #0]
    2a6e:	e029      	b.n	2ac4 <sdc_set_size+0x8c>
		}else{// version 1
			block_len=1<<((csd[5]&0xf)-1);
    2a70:	797b      	ldrb	r3, [r7, #5]
    2a72:	f003 030f 	and.w	r3, r3, #15
    2a76:	3b01      	subs	r3, #1
    2a78:	2201      	movs	r2, #1
    2a7a:	fa02 f303 	lsl.w	r3, r2, r3
    2a7e:	61bb      	str	r3, [r7, #24]
			c_size=(csd[6]&0xf<<10)+(csd[7]<<2)+((csd[8]>>6)&3)+1;
    2a80:	79bb      	ldrb	r3, [r7, #6]
    2a82:	f403 5270 	and.w	r2, r3, #15360	; 0x3c00
    2a86:	79fb      	ldrb	r3, [r7, #7]
    2a88:	009b      	lsls	r3, r3, #2
    2a8a:	441a      	add	r2, r3
    2a8c:	7a3b      	ldrb	r3, [r7, #8]
    2a8e:	099b      	lsrs	r3, r3, #6
    2a90:	b2db      	uxtb	r3, r3
    2a92:	f003 0303 	and.w	r3, r3, #3
    2a96:	4413      	add	r3, r2
    2a98:	3301      	adds	r3, #1
    2a9a:	617b      	str	r3, [r7, #20]
			c_size_mult=1<<(((csd[9]&0x3)<<1)+(csd[10]>>7)+2);
    2a9c:	7a7b      	ldrb	r3, [r7, #9]
    2a9e:	f003 0303 	and.w	r3, r3, #3
    2aa2:	005b      	lsls	r3, r3, #1
    2aa4:	7aba      	ldrb	r2, [r7, #10]
    2aa6:	09d2      	lsrs	r2, r2, #7
    2aa8:	b2d2      	uxtb	r2, r2
    2aaa:	4413      	add	r3, r2
    2aac:	3302      	adds	r3, #2
    2aae:	2201      	movs	r2, #1
    2ab0:	fa02 f303 	lsl.w	r3, r2, r3
    2ab4:	613b      	str	r3, [r7, #16]
			blocks_count=(c_size*c_size_mult)>>9;
    2ab6:	697b      	ldr	r3, [r7, #20]
    2ab8:	693a      	ldr	r2, [r7, #16]
    2aba:	fb02 f303 	mul.w	r3, r2, r3
    2abe:	0a5b      	lsrs	r3, r3, #9
    2ac0:	4a04      	ldr	r2, [pc, #16]	; (2ad4 <sdc_set_size+0x9c>)
    2ac2:	6013      	str	r3, [r2, #0]
		}
	}
	return r1;
    2ac4:	7ffb      	ldrb	r3, [r7, #31]
}
    2ac6:	4618      	mov	r0, r3
    2ac8:	3720      	adds	r7, #32
    2aca:	46bd      	mov	sp, r7
    2acc:	bd80      	pop	{r7, pc}
    2ace:	bf00      	nop
    2ad0:	20000148 	.word	0x20000148
    2ad4:	200000e8 	.word	0x200000e8

00002ad8 <sdcard_init>:

// flow chart REF: http://elm-chan.org/docs/mmc/ima/sdinit.png
int sdcard_init(){
    2ad8:	b580      	push	{r7, lr}
    2ada:	b088      	sub	sp, #32
    2adc:	af00      	add	r7, sp, #0
		int i;
		unsigned t0;
		uint8_t r1,args[5], resp[16];
		
		sdc_status=0;
    2ade:	4b97      	ldr	r3, [pc, #604]	; (2d3c <sdcard_init+0x264>)
    2ae0:	2200      	movs	r2, #0
    2ae2:	801a      	strh	r2, [r3, #0]
		blocks_count=0;
    2ae4:	4b96      	ldr	r3, [pc, #600]	; (2d40 <sdcard_init+0x268>)
    2ae6:	2200      	movs	r2, #0
    2ae8:	601a      	str	r2, [r3, #0]
		// initialise le périphérique SPI à la vitesse la plus lente.
		spi_init(SDC_SPI, SDC_CLK_SLOW, SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI, SPI_STD_PORT);
    2aea:	4896      	ldr	r0, [pc, #600]	; (2d44 <sdcard_init+0x26c>)
    2aec:	2107      	movs	r1, #7
    2aee:	f44f 7241 	mov.w	r2, #772	; 0x304
    2af2:	2300      	movs	r3, #0
    2af4:	f000 f9ba 	bl	2e6c <spi_init>
		// delais 2 msec
		pause(2);
    2af8:	2002      	movs	r0, #2
    2afa:	f000 facd 	bl	3098 <pause>
		sdcard_deselect();
    2afe:	f7ff fef7 	bl	28f0 <sdcard_deselect>
		dummy_clock();
    2b02:	f7ff feb3 	bl	286c <dummy_clock>
		if (!sdcard_select()){
    2b06:	f7ff ff05 	bl	2914 <sdcard_select>
    2b0a:	4603      	mov	r3, r0
    2b0c:	2b00      	cmp	r3, #0
    2b0e:	d108      	bne.n	2b22 <sdcard_init+0x4a>
				sdc_status|=F_SDC_IE;
    2b10:	4b8a      	ldr	r3, [pc, #552]	; (2d3c <sdcard_init+0x264>)
    2b12:	881b      	ldrh	r3, [r3, #0]
    2b14:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    2b18:	b29a      	uxth	r2, r3
    2b1a:	4b88      	ldr	r3, [pc, #544]	; (2d3c <sdcard_init+0x264>)
    2b1c:	801a      	strh	r2, [r3, #0]
				return 0;
    2b1e:	2300      	movs	r3, #0
    2b20:	e108      	b.n	2d34 <sdcard_init+0x25c>
		}
		// envoie GO_IDLE_STATE, CMD0 
		// si succès r1==1
//		print("sending CMD0\n");
		args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMD0_CRC;
    2b22:	2300      	movs	r3, #0
    2b24:	743b      	strb	r3, [r7, #16]
    2b26:	2300      	movs	r3, #0
    2b28:	747b      	strb	r3, [r7, #17]
    2b2a:	2300      	movs	r3, #0
    2b2c:	74bb      	strb	r3, [r7, #18]
    2b2e:	2300      	movs	r3, #0
    2b30:	74fb      	strb	r3, [r7, #19]
    2b32:	2395      	movs	r3, #149	; 0x95
    2b34:	753b      	strb	r3, [r7, #20]
		r1=sdc_cmd(GO_IDLE_STATE,args);
    2b36:	f107 0310 	add.w	r3, r7, #16
    2b3a:	2000      	movs	r0, #0
    2b3c:	4619      	mov	r1, r3
    2b3e:	f7ff ff05 	bl	294c <sdc_cmd>
    2b42:	4603      	mov	r3, r0
    2b44:	77fb      	strb	r3, [r7, #31]
		switch (r1){
    2b46:	7ffb      	ldrb	r3, [r7, #31]
    2b48:	2b01      	cmp	r3, #1
    2b4a:	d013      	beq.n	2b74 <sdcard_init+0x9c>
    2b4c:	2bff      	cmp	r3, #255	; 0xff
    2b4e:	d108      	bne.n	2b62 <sdcard_init+0x8a>
		case 1:
			break;
		case 0xff:
			sdc_status|=F_SDC_TO;
    2b50:	4b7a      	ldr	r3, [pc, #488]	; (2d3c <sdcard_init+0x264>)
    2b52:	881b      	ldrh	r3, [r3, #0]
    2b54:	f043 0310 	orr.w	r3, r3, #16
    2b58:	b29a      	uxth	r2, r3
    2b5a:	4b78      	ldr	r3, [pc, #480]	; (2d3c <sdcard_init+0x264>)
    2b5c:	801a      	strh	r2, [r3, #0]
			return 0;
    2b5e:	2300      	movs	r3, #0
    2b60:	e0e8      	b.n	2d34 <sdcard_init+0x25c>
		default:
			sdc_status|=F_SDC_IE;
    2b62:	4b76      	ldr	r3, [pc, #472]	; (2d3c <sdcard_init+0x264>)
    2b64:	881b      	ldrh	r3, [r3, #0]
    2b66:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    2b6a:	b29a      	uxth	r2, r3
    2b6c:	4b73      	ldr	r3, [pc, #460]	; (2d3c <sdcard_init+0x264>)
    2b6e:	801a      	strh	r2, [r3, #0]
			return 0;
    2b70:	2300      	movs	r3, #0
    2b72:	e0df      	b.n	2d34 <sdcard_init+0x25c>
//		print("sending CMD0\n");
		args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMD0_CRC;
		r1=sdc_cmd(GO_IDLE_STATE,args);
		switch (r1){
		case 1:
			break;
    2b74:	bf00      	nop
			return 0;
		default:
			sdc_status|=F_SDC_IE;
			return 0;
		}//switch (r1)
		sdc_status|=F_SDC_IN;
    2b76:	4b71      	ldr	r3, [pc, #452]	; (2d3c <sdcard_init+0x264>)
    2b78:	881b      	ldrh	r3, [r3, #0]
    2b7a:	f043 0301 	orr.w	r3, r3, #1
    2b7e:	b29a      	uxth	r2, r3
    2b80:	4b6e      	ldr	r3, [pc, #440]	; (2d3c <sdcard_init+0x264>)
    2b82:	801a      	strh	r2, [r3, #0]
//		print("sending CMD8\n");
		args[2]=1;args[3]=0xaa;args[4]=CMD8_CRC;
    2b84:	2301      	movs	r3, #1
    2b86:	74bb      	strb	r3, [r7, #18]
    2b88:	23aa      	movs	r3, #170	; 0xaa
    2b8a:	74fb      	strb	r3, [r7, #19]
    2b8c:	2387      	movs	r3, #135	; 0x87
    2b8e:	753b      	strb	r3, [r7, #20]
		r1=sdc_cmd(SEND_IF_COND,args);
    2b90:	f107 0310 	add.w	r3, r7, #16
    2b94:	2008      	movs	r0, #8
    2b96:	4619      	mov	r1, r3
    2b98:	f7ff fed8 	bl	294c <sdc_cmd>
    2b9c:	4603      	mov	r3, r0
    2b9e:	77fb      	strb	r3, [r7, #31]
		if (r1==1){
    2ba0:	7ffb      	ldrb	r3, [r7, #31]
    2ba2:	2b01      	cmp	r3, #1
    2ba4:	d11c      	bne.n	2be0 <sdcard_init+0x108>
			spi_block_read(SDC_SPI,resp,4);
    2ba6:	463b      	mov	r3, r7
    2ba8:	4866      	ldr	r0, [pc, #408]	; (2d44 <sdcard_init+0x26c>)
    2baa:	4619      	mov	r1, r3
    2bac:	2204      	movs	r2, #4
    2bae:	f000 f9f7 	bl	2fa0 <spi_block_read>
			if ((resp[2]==1) && (resp[3]==0xAA)){
    2bb2:	78bb      	ldrb	r3, [r7, #2]
    2bb4:	2b01      	cmp	r3, #1
    2bb6:	d10a      	bne.n	2bce <sdcard_init+0xf6>
    2bb8:	78fb      	ldrb	r3, [r7, #3]
    2bba:	2baa      	cmp	r3, #170	; 0xaa
    2bbc:	d107      	bne.n	2bce <sdcard_init+0xf6>
				sdc_status|=F_SDC_V2;
    2bbe:	4b5f      	ldr	r3, [pc, #380]	; (2d3c <sdcard_init+0x264>)
    2bc0:	881b      	ldrh	r3, [r3, #0]
    2bc2:	f043 0304 	orr.w	r3, r3, #4
    2bc6:	b29a      	uxth	r2, r3
    2bc8:	4b5c      	ldr	r3, [pc, #368]	; (2d3c <sdcard_init+0x264>)
    2bca:	801a      	strh	r2, [r3, #0]
    2bcc:	e008      	b.n	2be0 <sdcard_init+0x108>
//				print("card version 2\n");
			}else{
				sdc_status|=F_SDC_BAD_CARD;
    2bce:	4b5b      	ldr	r3, [pc, #364]	; (2d3c <sdcard_init+0x264>)
    2bd0:	881b      	ldrh	r3, [r3, #0]
    2bd2:	f443 7380 	orr.w	r3, r3, #256	; 0x100
    2bd6:	b29a      	uxth	r2, r3
    2bd8:	4b58      	ldr	r3, [pc, #352]	; (2d3c <sdcard_init+0x264>)
    2bda:	801a      	strh	r2, [r3, #0]
				return 0;
    2bdc:	2300      	movs	r3, #0
    2bde:	e0a9      	b.n	2d34 <sdcard_init+0x25c>
			}
		}
		// envoie commande acmd41  APP_SEND_OP_COND
		// cette boucle peu prendre 1 seconde
//		print("sending ACMD41\n");
		t0=ticks+1000;
    2be0:	4b59      	ldr	r3, [pc, #356]	; (2d48 <sdcard_init+0x270>)
    2be2:	681b      	ldr	r3, [r3, #0]
    2be4:	f503 737a 	add.w	r3, r3, #1000	; 0x3e8
    2be8:	61bb      	str	r3, [r7, #24]
		args[1]=0;args[2]=0;args[3]=0;args[4]=CMDX_CRC;
    2bea:	2300      	movs	r3, #0
    2bec:	747b      	strb	r3, [r7, #17]
    2bee:	2300      	movs	r3, #0
    2bf0:	74bb      	strb	r3, [r7, #18]
    2bf2:	2300      	movs	r3, #0
    2bf4:	74fb      	strb	r3, [r7, #19]
    2bf6:	23ff      	movs	r3, #255	; 0xff
    2bf8:	753b      	strb	r3, [r7, #20]
		do {
			args[0]=0;
    2bfa:	2300      	movs	r3, #0
    2bfc:	743b      	strb	r3, [r7, #16]
			sdc_cmd(APP_CMD,args);
    2bfe:	f107 0310 	add.w	r3, r7, #16
    2c02:	2037      	movs	r0, #55	; 0x37
    2c04:	4619      	mov	r1, r3
    2c06:	f7ff fea1 	bl	294c <sdc_cmd>
			if (sdc_status&F_SDC_V2)args[0]=0x40;
    2c0a:	4b4c      	ldr	r3, [pc, #304]	; (2d3c <sdcard_init+0x264>)
    2c0c:	881b      	ldrh	r3, [r3, #0]
    2c0e:	f003 0304 	and.w	r3, r3, #4
    2c12:	2b00      	cmp	r3, #0
    2c14:	d001      	beq.n	2c1a <sdcard_init+0x142>
    2c16:	2340      	movs	r3, #64	; 0x40
    2c18:	743b      	strb	r3, [r7, #16]
			r1=sdc_cmd(APP_SEND_OP_COND,args);
    2c1a:	f107 0310 	add.w	r3, r7, #16
    2c1e:	2029      	movs	r0, #41	; 0x29
    2c20:	4619      	mov	r1, r3
    2c22:	f7ff fe93 	bl	294c <sdc_cmd>
    2c26:	4603      	mov	r3, r0
    2c28:	77fb      	strb	r3, [r7, #31]
			if (!r1){
    2c2a:	7ffb      	ldrb	r3, [r7, #31]
    2c2c:	2b00      	cmp	r3, #0
    2c2e:	d100      	bne.n	2c32 <sdcard_init+0x15a>
				break;
    2c30:	e004      	b.n	2c3c <sdcard_init+0x164>
		    }
		}while (ticks<t0);
    2c32:	4b45      	ldr	r3, [pc, #276]	; (2d48 <sdcard_init+0x270>)
    2c34:	681a      	ldr	r2, [r3, #0]
    2c36:	69bb      	ldr	r3, [r7, #24]
    2c38:	429a      	cmp	r2, r3
    2c3a:	d3de      	bcc.n	2bfa <sdcard_init+0x122>
		if (r1) {
    2c3c:	7ffb      	ldrb	r3, [r7, #31]
    2c3e:	2b00      	cmp	r3, #0
    2c40:	d00a      	beq.n	2c58 <sdcard_init+0x180>
			sdc_status|=F_SDC_TO;
    2c42:	4b3e      	ldr	r3, [pc, #248]	; (2d3c <sdcard_init+0x264>)
    2c44:	881b      	ldrh	r3, [r3, #0]
    2c46:	f043 0310 	orr.w	r3, r3, #16
    2c4a:	b29a      	uxth	r2, r3
    2c4c:	4b3b      	ldr	r3, [pc, #236]	; (2d3c <sdcard_init+0x264>)
    2c4e:	801a      	strh	r2, [r3, #0]
			sdcard_deselect();
    2c50:	f7ff fe4e 	bl	28f0 <sdcard_deselect>
			return 0;
    2c54:	2300      	movs	r3, #0
    2c56:	e06d      	b.n	2d34 <sdcard_init+0x25c>
		}
		if (sdc_status&F_SDC_V2){
    2c58:	4b38      	ldr	r3, [pc, #224]	; (2d3c <sdcard_init+0x264>)
    2c5a:	881b      	ldrh	r3, [r3, #0]
    2c5c:	f003 0304 	and.w	r3, r3, #4
    2c60:	2b00      	cmp	r3, #0
    2c62:	d024      	beq.n	2cae <sdcard_init+0x1d6>
//			print("carte V2, envoie CMD58\n");
	    // evoie commande cmd58 READ_OCR
			args[0]=0;args[1]=0;args[2]=0;args[3]=0;
    2c64:	2300      	movs	r3, #0
    2c66:	743b      	strb	r3, [r7, #16]
    2c68:	2300      	movs	r3, #0
    2c6a:	747b      	strb	r3, [r7, #17]
    2c6c:	2300      	movs	r3, #0
    2c6e:	74bb      	strb	r3, [r7, #18]
    2c70:	2300      	movs	r3, #0
    2c72:	74fb      	strb	r3, [r7, #19]
			r1=sdc_cmd(READ_OCR,args);
    2c74:	f107 0310 	add.w	r3, r7, #16
    2c78:	203a      	movs	r0, #58	; 0x3a
    2c7a:	4619      	mov	r1, r3
    2c7c:	f7ff fe66 	bl	294c <sdc_cmd>
    2c80:	4603      	mov	r3, r0
    2c82:	77fb      	strb	r3, [r7, #31]
			if (!r1){
    2c84:	7ffb      	ldrb	r3, [r7, #31]
    2c86:	2b00      	cmp	r3, #0
    2c88:	d111      	bne.n	2cae <sdcard_init+0x1d6>
			    spi_block_read(SDC_SPI,resp,4);
    2c8a:	463b      	mov	r3, r7
    2c8c:	482d      	ldr	r0, [pc, #180]	; (2d44 <sdcard_init+0x26c>)
    2c8e:	4619      	mov	r1, r3
    2c90:	2204      	movs	r2, #4
    2c92:	f000 f985 	bl	2fa0 <spi_block_read>
			    if (resp[0]&BIT6){
    2c96:	783b      	ldrb	r3, [r7, #0]
    2c98:	f003 0340 	and.w	r3, r3, #64	; 0x40
    2c9c:	2b00      	cmp	r3, #0
    2c9e:	d006      	beq.n	2cae <sdcard_init+0x1d6>
					sdc_status|=F_SDC_HC; // block address
    2ca0:	4b26      	ldr	r3, [pc, #152]	; (2d3c <sdcard_init+0x264>)
    2ca2:	881b      	ldrh	r3, [r3, #0]
    2ca4:	f043 0308 	orr.w	r3, r3, #8
    2ca8:	b29a      	uxth	r2, r3
    2caa:	4b24      	ldr	r3, [pc, #144]	; (2d3c <sdcard_init+0x264>)
    2cac:	801a      	strh	r2, [r3, #0]
				}
			}
		}
		// envoie CMD16 SET_BLOCKLEN
		if (!(sdc_status&F_SDC_HC)){
    2cae:	4b23      	ldr	r3, [pc, #140]	; (2d3c <sdcard_init+0x264>)
    2cb0:	881b      	ldrh	r3, [r3, #0]
    2cb2:	f003 0308 	and.w	r3, r3, #8
    2cb6:	2b00      	cmp	r3, #0
    2cb8:	d120      	bne.n	2cfc <sdcard_init+0x224>
			print("setting block size\n");
    2cba:	4824      	ldr	r0, [pc, #144]	; (2d4c <sdcard_init+0x274>)
    2cbc:	f7fe fd38 	bl	1730 <print>
			args[0]=0;args[1]=0;args[2]=2;args[3]=0;
    2cc0:	2300      	movs	r3, #0
    2cc2:	743b      	strb	r3, [r7, #16]
    2cc4:	2300      	movs	r3, #0
    2cc6:	747b      	strb	r3, [r7, #17]
    2cc8:	2302      	movs	r3, #2
    2cca:	74bb      	strb	r3, [r7, #18]
    2ccc:	2300      	movs	r3, #0
    2cce:	74fb      	strb	r3, [r7, #19]
			if((r1=sdc_cmd(SET_BLOCKLEN,args))){
    2cd0:	f107 0310 	add.w	r3, r7, #16
    2cd4:	2010      	movs	r0, #16
    2cd6:	4619      	mov	r1, r3
    2cd8:	f7ff fe38 	bl	294c <sdc_cmd>
    2cdc:	4603      	mov	r3, r0
    2cde:	77fb      	strb	r3, [r7, #31]
    2ce0:	7ffb      	ldrb	r3, [r7, #31]
    2ce2:	2b00      	cmp	r3, #0
    2ce4:	d00a      	beq.n	2cfc <sdcard_init+0x224>
				sdc_status|=F_SDC_IE;
    2ce6:	4b15      	ldr	r3, [pc, #84]	; (2d3c <sdcard_init+0x264>)
    2ce8:	881b      	ldrh	r3, [r3, #0]
    2cea:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    2cee:	b29a      	uxth	r2, r3
    2cf0:	4b12      	ldr	r3, [pc, #72]	; (2d3c <sdcard_init+0x264>)
    2cf2:	801a      	strh	r2, [r3, #0]
				sdcard_deselect();
    2cf4:	f7ff fdfc 	bl	28f0 <sdcard_deselect>
				return 0;
    2cf8:	2300      	movs	r3, #0
    2cfa:	e01b      	b.n	2d34 <sdcard_init+0x25c>
			}
		}
		r1=sdc_set_size();
    2cfc:	f7ff fe9c 	bl	2a38 <sdc_set_size>
    2d00:	4603      	mov	r3, r0
    2d02:	77fb      	strb	r3, [r7, #31]
		sdc_status|=F_SDC_OK;
    2d04:	4b0d      	ldr	r3, [pc, #52]	; (2d3c <sdcard_init+0x264>)
    2d06:	881b      	ldrh	r3, [r3, #0]
    2d08:	f043 0302 	orr.w	r3, r3, #2
    2d0c:	b29a      	uxth	r2, r3
    2d0e:	4b0b      	ldr	r3, [pc, #44]	; (2d3c <sdcard_init+0x264>)
    2d10:	801a      	strh	r2, [r3, #0]
		_spi_disable(SDC_SPI);
    2d12:	4a0c      	ldr	r2, [pc, #48]	; (2d44 <sdcard_init+0x26c>)
    2d14:	4b0b      	ldr	r3, [pc, #44]	; (2d44 <sdcard_init+0x26c>)
    2d16:	681b      	ldr	r3, [r3, #0]
    2d18:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    2d1c:	6013      	str	r3, [r2, #0]
		spi_baudrate(SDC_SPI,SDC_CLK_FAST);
    2d1e:	4809      	ldr	r0, [pc, #36]	; (2d44 <sdcard_init+0x26c>)
    2d20:	2101      	movs	r1, #1
    2d22:	f000 f815 	bl	2d50 <spi_baudrate>
		_spi_enable(SDC_SPI);
    2d26:	4a07      	ldr	r2, [pc, #28]	; (2d44 <sdcard_init+0x26c>)
    2d28:	4b06      	ldr	r3, [pc, #24]	; (2d44 <sdcard_init+0x26c>)
    2d2a:	681b      	ldr	r3, [r3, #0]
    2d2c:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    2d30:	6013      	str	r3, [r2, #0]
		return 1;
    2d32:	2301      	movs	r3, #1
}
    2d34:	4618      	mov	r0, r3
    2d36:	3720      	adds	r7, #32
    2d38:	46bd      	mov	sp, r7
    2d3a:	bd80      	pop	{r7, pc}
    2d3c:	20000148 	.word	0x20000148
    2d40:	200000e8 	.word	0x200000e8
    2d44:	40013000 	.word	0x40013000
    2d48:	200000ec 	.word	0x200000ec
    2d4c:	00003ffc 	.word	0x00003ffc

00002d50 <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    2d50:	b480      	push	{r7}
    2d52:	b083      	sub	sp, #12
    2d54:	af00      	add	r7, sp, #0
    2d56:	6078      	str	r0, [r7, #4]
    2d58:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    2d5a:	687b      	ldr	r3, [r7, #4]
    2d5c:	681b      	ldr	r3, [r3, #0]
    2d5e:	f023 0238 	bic.w	r2, r3, #56	; 0x38
    2d62:	687b      	ldr	r3, [r7, #4]
    2d64:	601a      	str	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    2d66:	687b      	ldr	r3, [r7, #4]
    2d68:	681a      	ldr	r2, [r3, #0]
    2d6a:	683b      	ldr	r3, [r7, #0]
    2d6c:	00db      	lsls	r3, r3, #3
    2d6e:	431a      	orrs	r2, r3
    2d70:	687b      	ldr	r3, [r7, #4]
    2d72:	601a      	str	r2, [r3, #0]
}
    2d74:	370c      	adds	r7, #12
    2d76:	46bd      	mov	sp, r7
    2d78:	f85d 7b04 	ldr.w	r7, [sp], #4
    2d7c:	4770      	bx	lr
    2d7e:	bf00      	nop

00002d80 <spi_config_port>:

void spi_config_port(spi_sfr_t *channel, int afio_cfg){
    2d80:	b580      	push	{r7, lr}
    2d82:	b082      	sub	sp, #8
    2d84:	af00      	add	r7, sp, #0
    2d86:	6078      	str	r0, [r7, #4]
    2d88:	6039      	str	r1, [r7, #0]
	RCC->APB2ENR|=RCC_APB2ENR_AFIOEN;
    2d8a:	4a33      	ldr	r2, [pc, #204]	; (2e58 <spi_config_port+0xd8>)
    2d8c:	4b32      	ldr	r3, [pc, #200]	; (2e58 <spi_config_port+0xd8>)
    2d8e:	699b      	ldr	r3, [r3, #24]
    2d90:	f043 0301 	orr.w	r3, r3, #1
    2d94:	6193      	str	r3, [r2, #24]
	if (channel==SPI1){
    2d96:	687b      	ldr	r3, [r7, #4]
    2d98:	4a30      	ldr	r2, [pc, #192]	; (2e5c <spi_config_port+0xdc>)
    2d9a:	4293      	cmp	r3, r2
    2d9c:	d13e      	bne.n	2e1c <spi_config_port+0x9c>
		if (!afio_cfg){
    2d9e:	683b      	ldr	r3, [r7, #0]
    2da0:	2b00      	cmp	r3, #0
    2da2:	d11a      	bne.n	2dda <spi_config_port+0x5a>
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    2da4:	4a2c      	ldr	r2, [pc, #176]	; (2e58 <spi_config_port+0xd8>)
    2da6:	4b2c      	ldr	r3, [pc, #176]	; (2e58 <spi_config_port+0xd8>)
    2da8:	699b      	ldr	r3, [r3, #24]
    2daa:	f043 0304 	orr.w	r3, r3, #4
    2dae:	6193      	str	r3, [r2, #24]
			// configuration port
			// PA4 -> NSS output (push-pull)
			config_pin(PORTA,4,OUTPUT_PP_FAST);
    2db0:	482b      	ldr	r0, [pc, #172]	; (2e60 <spi_config_port+0xe0>)
    2db2:	2104      	movs	r1, #4
    2db4:	2203      	movs	r2, #3
    2db6:	f7ff f94f 	bl	2058 <config_pin>
			// PA5 -> SCK output (push-pull)
			config_pin(PORTA,5,OUTPUT_ALT_PP_FAST);
    2dba:	4829      	ldr	r0, [pc, #164]	; (2e60 <spi_config_port+0xe0>)
    2dbc:	2105      	movs	r1, #5
    2dbe:	220b      	movs	r2, #11
    2dc0:	f7ff f94a 	bl	2058 <config_pin>
			// PA6 -> MISO input (floating)
			config_pin(PORTA,6,INPUT_FLOAT);
    2dc4:	4826      	ldr	r0, [pc, #152]	; (2e60 <spi_config_port+0xe0>)
    2dc6:	2106      	movs	r1, #6
    2dc8:	2204      	movs	r2, #4
    2dca:	f7ff f945 	bl	2058 <config_pin>
			// PA7 -> MOSI output (push-pull)
			config_pin(PORTA,7,OUTPUT_ALT_PP_FAST);
    2dce:	4824      	ldr	r0, [pc, #144]	; (2e60 <spi_config_port+0xe0>)
    2dd0:	2107      	movs	r1, #7
    2dd2:	220b      	movs	r2, #11
    2dd4:	f7ff f940 	bl	2058 <config_pin>
    2dd8:	e03a      	b.n	2e50 <spi_config_port+0xd0>
		}else{// mappage I/O alternatif
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPBEN+RCC_APB2ENR_IOPAEN+RCC_APB2ENR_AFIOEN;
    2dda:	4a1f      	ldr	r2, [pc, #124]	; (2e58 <spi_config_port+0xd8>)
    2ddc:	4b1e      	ldr	r3, [pc, #120]	; (2e58 <spi_config_port+0xd8>)
    2dde:	699b      	ldr	r3, [r3, #24]
    2de0:	f043 030d 	orr.w	r3, r3, #13
    2de4:	6193      	str	r3, [r2, #24]
			AFIO->MAPR|=AFIO_MAPR_SPI1_REMAP;
    2de6:	4a1f      	ldr	r2, [pc, #124]	; (2e64 <spi_config_port+0xe4>)
    2de8:	4b1e      	ldr	r3, [pc, #120]	; (2e64 <spi_config_port+0xe4>)
    2dea:	685b      	ldr	r3, [r3, #4]
    2dec:	f043 0301 	orr.w	r3, r3, #1
    2df0:	6053      	str	r3, [r2, #4]
			// configuration port
			// PA4 -> NSS output (push-pull),  alt PA15
			config_pin(PORTA,15,OUTPUT_PP_FAST);
    2df2:	481b      	ldr	r0, [pc, #108]	; (2e60 <spi_config_port+0xe0>)
    2df4:	210f      	movs	r1, #15
    2df6:	2203      	movs	r2, #3
    2df8:	f7ff f92e 	bl	2058 <config_pin>
			// PA5 -> SCK output (push-pull),  alt PB3
			config_pin(PORTB,3,OUTPUT_ALT_PP_FAST);
    2dfc:	481a      	ldr	r0, [pc, #104]	; (2e68 <spi_config_port+0xe8>)
    2dfe:	2103      	movs	r1, #3
    2e00:	220b      	movs	r2, #11
    2e02:	f7ff f929 	bl	2058 <config_pin>
			// PA6 -> MISO input (floating),   alt PB4
			config_pin(PORTB,4,INPUT_FLOAT);
    2e06:	4818      	ldr	r0, [pc, #96]	; (2e68 <spi_config_port+0xe8>)
    2e08:	2104      	movs	r1, #4
    2e0a:	2204      	movs	r2, #4
    2e0c:	f7ff f924 	bl	2058 <config_pin>
			// PA7 -> MOSI output (push-pull), alt PB5
			config_pin(PORTB,5,OUTPUT_ALT_PP_FAST);
    2e10:	4815      	ldr	r0, [pc, #84]	; (2e68 <spi_config_port+0xe8>)
    2e12:	2105      	movs	r1, #5
    2e14:	220b      	movs	r2, #11
    2e16:	f7ff f91f 	bl	2058 <config_pin>
    2e1a:	e019      	b.n	2e50 <spi_config_port+0xd0>
		}
	}else{
		// activation clock du port
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    2e1c:	4a0e      	ldr	r2, [pc, #56]	; (2e58 <spi_config_port+0xd8>)
    2e1e:	4b0e      	ldr	r3, [pc, #56]	; (2e58 <spi_config_port+0xd8>)
    2e20:	699b      	ldr	r3, [r3, #24]
    2e22:	f043 0308 	orr.w	r3, r3, #8
    2e26:	6193      	str	r3, [r2, #24]
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(PORTB,2,OUTPUT_PP_FAST);
    2e28:	480f      	ldr	r0, [pc, #60]	; (2e68 <spi_config_port+0xe8>)
    2e2a:	2102      	movs	r1, #2
    2e2c:	2203      	movs	r2, #3
    2e2e:	f7ff f913 	bl	2058 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(PORTB,13,OUTPUT_ALT_PP_FAST);
    2e32:	480d      	ldr	r0, [pc, #52]	; (2e68 <spi_config_port+0xe8>)
    2e34:	210d      	movs	r1, #13
    2e36:	220b      	movs	r2, #11
    2e38:	f7ff f90e 	bl	2058 <config_pin>
		// PB14 MISO input (floating)
		config_pin(PORTB,14,INPUT_FLOAT);
    2e3c:	480a      	ldr	r0, [pc, #40]	; (2e68 <spi_config_port+0xe8>)
    2e3e:	210e      	movs	r1, #14
    2e40:	2204      	movs	r2, #4
    2e42:	f7ff f909 	bl	2058 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    2e46:	4808      	ldr	r0, [pc, #32]	; (2e68 <spi_config_port+0xe8>)
    2e48:	210f      	movs	r1, #15
    2e4a:	220b      	movs	r2, #11
    2e4c:	f7ff f904 	bl	2058 <config_pin>
	}
}
    2e50:	3708      	adds	r7, #8
    2e52:	46bd      	mov	sp, r7
    2e54:	bd80      	pop	{r7, pc}
    2e56:	bf00      	nop
    2e58:	40021000 	.word	0x40021000
    2e5c:	40013000 	.word	0x40013000
    2e60:	40010800 	.word	0x40010800
    2e64:	40010000 	.word	0x40010000
    2e68:	40010c00 	.word	0x40010c00

00002e6c <spi_init>:

void spi_init(spi_sfr_t* channel, unsigned baud,unsigned mode, int afio_cfg){
    2e6c:	b580      	push	{r7, lr}
    2e6e:	b084      	sub	sp, #16
    2e70:	af00      	add	r7, sp, #0
    2e72:	60f8      	str	r0, [r7, #12]
    2e74:	60b9      	str	r1, [r7, #8]
    2e76:	607a      	str	r2, [r7, #4]
    2e78:	603b      	str	r3, [r7, #0]
	spi_config_port(channel,afio_cfg);
    2e7a:	68f8      	ldr	r0, [r7, #12]
    2e7c:	6839      	ldr	r1, [r7, #0]
    2e7e:	f7ff ff7f 	bl	2d80 <spi_config_port>
	// activation clock SPI
	if (channel==SPI1){
    2e82:	68fb      	ldr	r3, [r7, #12]
    2e84:	4a0f      	ldr	r2, [pc, #60]	; (2ec4 <spi_init+0x58>)
    2e86:	4293      	cmp	r3, r2
    2e88:	d106      	bne.n	2e98 <spi_init+0x2c>
		RCC->APB2ENR|=RCC_APB2ENR_SPI1EN;
    2e8a:	4a0f      	ldr	r2, [pc, #60]	; (2ec8 <spi_init+0x5c>)
    2e8c:	4b0e      	ldr	r3, [pc, #56]	; (2ec8 <spi_init+0x5c>)
    2e8e:	699b      	ldr	r3, [r3, #24]
    2e90:	f443 5380 	orr.w	r3, r3, #4096	; 0x1000
    2e94:	6193      	str	r3, [r2, #24]
    2e96:	e005      	b.n	2ea4 <spi_init+0x38>
	}else{
		RCC->APB1ENR|=RCC_APB1ENR_SPI2EN;
    2e98:	4a0b      	ldr	r2, [pc, #44]	; (2ec8 <spi_init+0x5c>)
    2e9a:	4b0b      	ldr	r3, [pc, #44]	; (2ec8 <spi_init+0x5c>)
    2e9c:	69db      	ldr	r3, [r3, #28]
    2e9e:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    2ea2:	61d3      	str	r3, [r2, #28]
	}
	channel->CR1=mode;
    2ea4:	68fb      	ldr	r3, [r7, #12]
    2ea6:	687a      	ldr	r2, [r7, #4]
    2ea8:	601a      	str	r2, [r3, #0]
	spi_baudrate(channel,baud);
    2eaa:	68f8      	ldr	r0, [r7, #12]
    2eac:	68b9      	ldr	r1, [r7, #8]
    2eae:	f7ff ff4f 	bl	2d50 <spi_baudrate>
	_spi_enable(channel);
    2eb2:	68fb      	ldr	r3, [r7, #12]
    2eb4:	681b      	ldr	r3, [r3, #0]
    2eb6:	f043 0240 	orr.w	r2, r3, #64	; 0x40
    2eba:	68fb      	ldr	r3, [r7, #12]
    2ebc:	601a      	str	r2, [r3, #0]
}
    2ebe:	3710      	adds	r7, #16
    2ec0:	46bd      	mov	sp, r7
    2ec2:	bd80      	pop	{r7, pc}
    2ec4:	40013000 	.word	0x40013000
    2ec8:	40021000 	.word	0x40021000

00002ecc <spi_write>:


// envoie un octet via le canla SPI
inline void spi_write(spi_sfr_t* channel, uint8_t b){
    2ecc:	b480      	push	{r7}
    2ece:	b085      	sub	sp, #20
    2ed0:	af00      	add	r7, sp, #0
    2ed2:	6078      	str	r0, [r7, #4]
    2ed4:	460b      	mov	r3, r1
    2ed6:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	while (!(channel->SR&SPI_SR_TXE));
    2ed8:	bf00      	nop
    2eda:	687b      	ldr	r3, [r7, #4]
    2edc:	689b      	ldr	r3, [r3, #8]
    2ede:	f003 0302 	and.w	r3, r3, #2
    2ee2:	2b00      	cmp	r3, #0
    2ee4:	d0f9      	beq.n	2eda <spi_write+0xe>
	channel->DR=b;
    2ee6:	78fa      	ldrb	r2, [r7, #3]
    2ee8:	687b      	ldr	r3, [r7, #4]
    2eea:	60da      	str	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    2eec:	bf00      	nop
    2eee:	687b      	ldr	r3, [r7, #4]
    2ef0:	689b      	ldr	r3, [r3, #8]
    2ef2:	f003 0301 	and.w	r3, r3, #1
    2ef6:	2b00      	cmp	r3, #0
    2ef8:	d0f9      	beq.n	2eee <spi_write+0x22>
	rx=(uint8_t)channel->DR;
    2efa:	687b      	ldr	r3, [r7, #4]
    2efc:	68db      	ldr	r3, [r3, #12]
    2efe:	73fb      	strb	r3, [r7, #15]
}
    2f00:	3714      	adds	r7, #20
    2f02:	46bd      	mov	sp, r7
    2f04:	f85d 7b04 	ldr.w	r7, [sp], #4
    2f08:	4770      	bx	lr
    2f0a:	bf00      	nop

00002f0c <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    2f0c:	b480      	push	{r7}
    2f0e:	b085      	sub	sp, #20
    2f10:	af00      	add	r7, sp, #0
    2f12:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	while (!(channel->SR&SPI_SR_TXE));
    2f14:	bf00      	nop
    2f16:	687b      	ldr	r3, [r7, #4]
    2f18:	689b      	ldr	r3, [r3, #8]
    2f1a:	f003 0302 	and.w	r3, r3, #2
    2f1e:	2b00      	cmp	r3, #0
    2f20:	d0f9      	beq.n	2f16 <spi_read+0xa>
	channel->DR=255;
    2f22:	687b      	ldr	r3, [r7, #4]
    2f24:	22ff      	movs	r2, #255	; 0xff
    2f26:	60da      	str	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    2f28:	bf00      	nop
    2f2a:	687b      	ldr	r3, [r7, #4]
    2f2c:	689b      	ldr	r3, [r3, #8]
    2f2e:	f003 0301 	and.w	r3, r3, #1
    2f32:	2b00      	cmp	r3, #0
    2f34:	d0f9      	beq.n	2f2a <spi_read+0x1e>
	rx=(uint8_t)channel->DR;
    2f36:	687b      	ldr	r3, [r7, #4]
    2f38:	68db      	ldr	r3, [r3, #12]
    2f3a:	73fb      	strb	r3, [r7, #15]
	return rx;
    2f3c:	7bfb      	ldrb	r3, [r7, #15]
}
    2f3e:	4618      	mov	r0, r3
    2f40:	3714      	adds	r7, #20
    2f42:	46bd      	mov	sp, r7
    2f44:	f85d 7b04 	ldr.w	r7, [sp], #4
    2f48:	4770      	bx	lr
    2f4a:	bf00      	nop

00002f4c <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    2f4c:	b480      	push	{r7}
    2f4e:	b087      	sub	sp, #28
    2f50:	af00      	add	r7, sp, #0
    2f52:	60f8      	str	r0, [r7, #12]
    2f54:	60b9      	str	r1, [r7, #8]
    2f56:	607a      	str	r2, [r7, #4]
	uint8_t rx;
	while (count){
    2f58:	e010      	b.n	2f7c <spi_block_write+0x30>
		channel->DR=*buffer++;
    2f5a:	68bb      	ldr	r3, [r7, #8]
    2f5c:	1c5a      	adds	r2, r3, #1
    2f5e:	60ba      	str	r2, [r7, #8]
    2f60:	781b      	ldrb	r3, [r3, #0]
    2f62:	461a      	mov	r2, r3
    2f64:	68fb      	ldr	r3, [r7, #12]
    2f66:	60da      	str	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    2f68:	bf00      	nop
    2f6a:	68fb      	ldr	r3, [r7, #12]
    2f6c:	689b      	ldr	r3, [r3, #8]
    2f6e:	f003 0302 	and.w	r3, r3, #2
    2f72:	2b00      	cmp	r3, #0
    2f74:	d0f9      	beq.n	2f6a <spi_block_write+0x1e>
		count--;
    2f76:	687b      	ldr	r3, [r7, #4]
    2f78:	3b01      	subs	r3, #1
    2f7a:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	uint8_t rx;
	while (count){
    2f7c:	687b      	ldr	r3, [r7, #4]
    2f7e:	2b00      	cmp	r3, #0
    2f80:	d1eb      	bne.n	2f5a <spi_block_write+0xe>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	while (channel->SR&SPI_SR_BSY);
    2f82:	bf00      	nop
    2f84:	68fb      	ldr	r3, [r7, #12]
    2f86:	689b      	ldr	r3, [r3, #8]
    2f88:	f003 0380 	and.w	r3, r3, #128	; 0x80
    2f8c:	2b00      	cmp	r3, #0
    2f8e:	d1f9      	bne.n	2f84 <spi_block_write+0x38>
	rx=(uint8_t)channel->DR;
    2f90:	68fb      	ldr	r3, [r7, #12]
    2f92:	68db      	ldr	r3, [r3, #12]
    2f94:	75fb      	strb	r3, [r7, #23]
}
    2f96:	371c      	adds	r7, #28
    2f98:	46bd      	mov	sp, r7
    2f9a:	f85d 7b04 	ldr.w	r7, [sp], #4
    2f9e:	4770      	bx	lr

00002fa0 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    2fa0:	b480      	push	{r7}
    2fa2:	b085      	sub	sp, #20
    2fa4:	af00      	add	r7, sp, #0
    2fa6:	60f8      	str	r0, [r7, #12]
    2fa8:	60b9      	str	r1, [r7, #8]
    2faa:	607a      	str	r2, [r7, #4]
	while (count){
    2fac:	e013      	b.n	2fd6 <spi_block_read+0x36>
		channel->DR=0;
    2fae:	68fb      	ldr	r3, [r7, #12]
    2fb0:	2200      	movs	r2, #0
    2fb2:	60da      	str	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    2fb4:	bf00      	nop
    2fb6:	68fb      	ldr	r3, [r7, #12]
    2fb8:	689b      	ldr	r3, [r3, #8]
    2fba:	f003 0301 	and.w	r3, r3, #1
    2fbe:	2b00      	cmp	r3, #0
    2fc0:	d0f9      	beq.n	2fb6 <spi_block_read+0x16>
		*buffer++=(uint8_t)channel->DR;
    2fc2:	68bb      	ldr	r3, [r7, #8]
    2fc4:	1c5a      	adds	r2, r3, #1
    2fc6:	60ba      	str	r2, [r7, #8]
    2fc8:	68fa      	ldr	r2, [r7, #12]
    2fca:	68d2      	ldr	r2, [r2, #12]
    2fcc:	b2d2      	uxtb	r2, r2
    2fce:	701a      	strb	r2, [r3, #0]
		count--;
    2fd0:	687b      	ldr	r3, [r7, #4]
    2fd2:	3b01      	subs	r3, #1
    2fd4:	607b      	str	r3, [r7, #4]
	rx=(uint8_t)channel->DR;
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	while (count){
    2fd6:	687b      	ldr	r3, [r7, #4]
    2fd8:	2b00      	cmp	r3, #0
    2fda:	d1e8      	bne.n	2fae <spi_block_read+0xe>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
}
    2fdc:	3714      	adds	r7, #20
    2fde:	46bd      	mov	sp, r7
    2fe0:	f85d 7b04 	ldr.w	r7, [sp], #4
    2fe4:	4770      	bx	lr
    2fe6:	bf00      	nop

00002fe8 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    2fe8:	4b01      	ldr	r3, [pc, #4]	; (2ff0 <reset_mcu+0x8>)
    2fea:	4a02      	ldr	r2, [pc, #8]	; (2ff4 <reset_mcu+0xc>)
    2fec:	601a      	str	r2, [r3, #0]
    2fee:	bf00      	nop
    2ff0:	e000ed0c 	.word	0xe000ed0c
    2ff4:	05fa0004 	.word	0x05fa0004

00002ff8 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    2ff8:	b580      	push	{r7, lr}
    2ffa:	b082      	sub	sp, #8
    2ffc:	af00      	add	r7, sp, #0
    2ffe:	6078      	str	r0, [r7, #4]
    3000:	6039      	str	r1, [r7, #0]
	print(msg);
    3002:	6878      	ldr	r0, [r7, #4]
    3004:	f7fe fb94 	bl	1730 <print>
	print("at address ");
    3008:	4814      	ldr	r0, [pc, #80]	; (305c <print_fault+0x64>)
    300a:	f7fe fb91 	bl	1730 <print>
	if (adr) {
    300e:	683b      	ldr	r3, [r7, #0]
    3010:	2b00      	cmp	r3, #0
    3012:	d002      	beq.n	301a <print_fault+0x22>
		print_hex(adr);
    3014:	6838      	ldr	r0, [r7, #0]
    3016:	f7fe fce3 	bl	19e0 <print_hex>
	};
	conout(CR);
    301a:	200d      	movs	r0, #13
    301c:	f7fe fb2a 	bl	1674 <conout>
	print("UFSR=");
    3020:	480f      	ldr	r0, [pc, #60]	; (3060 <print_fault+0x68>)
    3022:	f7fe fb85 	bl	1730 <print>
	print_hex(CFSR->fsr.usageFalt);
    3026:	4b0f      	ldr	r3, [pc, #60]	; (3064 <print_fault+0x6c>)
    3028:	681b      	ldr	r3, [r3, #0]
    302a:	0c1b      	lsrs	r3, r3, #16
    302c:	b29b      	uxth	r3, r3
    302e:	4618      	mov	r0, r3
    3030:	f7fe fcd6 	bl	19e0 <print_hex>
	print(", BFSR=");
    3034:	480c      	ldr	r0, [pc, #48]	; (3068 <print_fault+0x70>)
    3036:	f7fe fb7b 	bl	1730 <print>
	print_hex(CFSR->fsr.busFault);
    303a:	4b0a      	ldr	r3, [pc, #40]	; (3064 <print_fault+0x6c>)
    303c:	681b      	ldr	r3, [r3, #0]
    303e:	0a1b      	lsrs	r3, r3, #8
    3040:	b2db      	uxtb	r3, r3
    3042:	4618      	mov	r0, r3
    3044:	f7fe fccc 	bl	19e0 <print_hex>
	print(", MMFSR=");
    3048:	4808      	ldr	r0, [pc, #32]	; (306c <print_fault+0x74>)
    304a:	f7fe fb71 	bl	1730 <print>
	print_hex(CFSR->fsr.mmFault);
    304e:	4b05      	ldr	r3, [pc, #20]	; (3064 <print_fault+0x6c>)
    3050:	681b      	ldr	r3, [r3, #0]
    3052:	b2db      	uxtb	r3, r3
    3054:	4618      	mov	r0, r3
    3056:	f7fe fcc3 	bl	19e0 <print_hex>
	while(1);
    305a:	e7fe      	b.n	305a <print_fault+0x62>
    305c:	00004010 	.word	0x00004010
    3060:	0000401c 	.word	0x0000401c
    3064:	e000ed28 	.word	0xe000ed28
    3068:	00004024 	.word	0x00004024
    306c:	0000402c 	.word	0x0000402c

00003070 <config_systicks>:


// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
#define MSEC_DLY FCLK/8/1000
void config_systicks(){
    3070:	b580      	push	{r7, lr}
    3072:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,9);
    3074:	f06f 000e 	mvn.w	r0, #14
    3078:	2109      	movs	r1, #9
    307a:	f7ff fbbb 	bl	27f4 <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
    307e:	4b04      	ldr	r3, [pc, #16]	; (3090 <config_systicks+0x20>)
    3080:	f641 723f 	movw	r2, #7999	; 0x1f3f
    3084:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
    3086:	4b03      	ldr	r3, [pc, #12]	; (3094 <config_systicks+0x24>)
    3088:	2203      	movs	r2, #3
    308a:	601a      	str	r2, [r3, #0]
}
    308c:	bd80      	pop	{r7, pc}
    308e:	bf00      	nop
    3090:	e000e014 	.word	0xe000e014
    3094:	e000e010 	.word	0xe000e010

00003098 <pause>:



void pause(unsigned msec){
    3098:	b480      	push	{r7}
    309a:	b083      	sub	sp, #12
    309c:	af00      	add	r7, sp, #0
    309e:	6078      	str	r0, [r7, #4]
	timer=msec;
    30a0:	4a06      	ldr	r2, [pc, #24]	; (30bc <pause+0x24>)
    30a2:	687b      	ldr	r3, [r7, #4]
    30a4:	6013      	str	r3, [r2, #0]
	while (timer);
    30a6:	bf00      	nop
    30a8:	4b04      	ldr	r3, [pc, #16]	; (30bc <pause+0x24>)
    30aa:	681b      	ldr	r3, [r3, #0]
    30ac:	2b00      	cmp	r3, #0
    30ae:	d1fb      	bne.n	30a8 <pause+0x10>
}
    30b0:	370c      	adds	r7, #12
    30b2:	46bd      	mov	sp, r7
    30b4:	f85d 7b04 	ldr.w	r7, [sp], #4
    30b8:	4770      	bx	lr
    30ba:	bf00      	nop
    30bc:	200000f0 	.word	0x200000f0

000030c0 <STK_handler>:


// interruption coretimer
void STK_handler(){
    30c0:	b480      	push	{r7}
    30c2:	af00      	add	r7, sp, #0
	ticks++;
    30c4:	4b08      	ldr	r3, [pc, #32]	; (30e8 <STK_handler+0x28>)
    30c6:	681b      	ldr	r3, [r3, #0]
    30c8:	3301      	adds	r3, #1
    30ca:	4a07      	ldr	r2, [pc, #28]	; (30e8 <STK_handler+0x28>)
    30cc:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
    30ce:	4b07      	ldr	r3, [pc, #28]	; (30ec <STK_handler+0x2c>)
    30d0:	681b      	ldr	r3, [r3, #0]
    30d2:	2b00      	cmp	r3, #0
    30d4:	d004      	beq.n	30e0 <STK_handler+0x20>
    30d6:	4b05      	ldr	r3, [pc, #20]	; (30ec <STK_handler+0x2c>)
    30d8:	681b      	ldr	r3, [r3, #0]
    30da:	3b01      	subs	r3, #1
    30dc:	4a03      	ldr	r2, [pc, #12]	; (30ec <STK_handler+0x2c>)
    30de:	6013      	str	r3, [r2, #0]
}
    30e0:	46bd      	mov	sp, r7
    30e2:	f85d 7b04 	ldr.w	r7, [sp], #4
    30e6:	4770      	bx	lr
    30e8:	200000ec 	.word	0x200000ec
    30ec:	200000f0 	.word	0x200000f0

000030f0 <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    30f0:	b480      	push	{r7}
    30f2:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    30f4:	2300      	movs	r3, #0
    30f6:	2200      	movs	r2, #0
    30f8:	4618      	mov	r0, r3
    30fa:	4611      	mov	r1, r2
    30fc:	df02      	svc	2
}
    30fe:	46bd      	mov	sp, r7
    3100:	f85d 7b04 	ldr.w	r7, [sp], #4
    3104:	4770      	bx	lr
    3106:	bf00      	nop

00003108 <tvout_init>:

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
    3108:	b580      	push	{r7, lr}
    310a:	b082      	sub	sp, #8
    310c:	af00      	add	r7, sp, #0
	//sortie sync sur PA8
	config_pin(PORTA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    310e:	484f      	ldr	r0, [pc, #316]	; (324c <tvout_init+0x144>)
    3110:	2108      	movs	r1, #8
    3112:	220a      	movs	r2, #10
    3114:	f7fe ffa0 	bl	2058 <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    3118:	484d      	ldr	r0, [pc, #308]	; (3250 <tvout_init+0x148>)
    311a:	210f      	movs	r1, #15
    311c:	220b      	movs	r2, #11
    311e:	f7fe ff9b 	bl	2058 <config_pin>
	PORTB->BRR=BIT15;
    3122:	4b4b      	ldr	r3, [pc, #300]	; (3250 <tvout_init+0x148>)
    3124:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    3128:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
    312a:	4a4a      	ldr	r2, [pc, #296]	; (3254 <tvout_init+0x14c>)
    312c:	4b49      	ldr	r3, [pc, #292]	; (3254 <tvout_init+0x14c>)
    312e:	699b      	ldr	r3, [r3, #24]
    3130:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    3134:	6193      	str	r3, [r2, #24]
	// clock source division
	*TIMER1_PSC=0;
    3136:	4b48      	ldr	r3, [pc, #288]	; (3258 <tvout_init+0x150>)
    3138:	2200      	movs	r2, #0
    313a:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    313c:	4b47      	ldr	r3, [pc, #284]	; (325c <tvout_init+0x154>)
    313e:	f640 72ff 	movw	r2, #4095	; 0xfff
    3142:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    3144:	4b46      	ldr	r3, [pc, #280]	; (3260 <tvout_init+0x158>)
    3146:	f240 122b 	movw	r2, #299	; 0x12b
    314a:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    314c:	4b45      	ldr	r3, [pc, #276]	; (3264 <tvout_init+0x15c>)
    314e:	681a      	ldr	r2, [r3, #0]
    3150:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    3154:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    3158:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    315a:	4b42      	ldr	r3, [pc, #264]	; (3264 <tvout_init+0x15c>)
    315c:	681a      	ldr	r2, [r3, #0]
    315e:	f042 0208 	orr.w	r2, r2, #8
    3162:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    3164:	4b40      	ldr	r3, [pc, #256]	; (3268 <tvout_init+0x160>)
    3166:	681a      	ldr	r2, [r3, #0]
    3168:	f042 0201 	orr.w	r2, r2, #1
    316c:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    316e:	4b3e      	ldr	r3, [pc, #248]	; (3268 <tvout_init+0x160>)
    3170:	681a      	ldr	r2, [r3, #0]
    3172:	f042 0202 	orr.w	r2, r2, #2
    3176:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    3178:	4a3c      	ldr	r2, [pc, #240]	; (326c <tvout_init+0x164>)
    317a:	8813      	ldrh	r3, [r2, #0]
    317c:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    3180:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    3184:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    3186:	4b3a      	ldr	r3, [pc, #232]	; (3270 <tvout_init+0x168>)
    3188:	681a      	ldr	r2, [r3, #0]
    318a:	f042 0201 	orr.w	r2, r2, #1
    318e:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    3190:	4b38      	ldr	r3, [pc, #224]	; (3274 <tvout_init+0x16c>)
    3192:	f640 324c 	movw	r2, #2892	; 0xb4c
    3196:	601a      	str	r2, [r3, #0]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    3198:	4b37      	ldr	r3, [pc, #220]	; (3278 <tvout_init+0x170>)
    319a:	f243 5292 	movw	r2, #13714	; 0x3592
    319e:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    31a0:	4b35      	ldr	r3, [pc, #212]	; (3278 <tvout_init+0x170>)
    31a2:	4a36      	ldr	r2, [pc, #216]	; (327c <tvout_init+0x174>)
    31a4:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    31a6:	4a33      	ldr	r2, [pc, #204]	; (3274 <tvout_init+0x16c>)
    31a8:	4b32      	ldr	r3, [pc, #200]	; (3274 <tvout_init+0x16c>)
    31aa:	685b      	ldr	r3, [r3, #4]
    31ac:	f043 0302 	orr.w	r3, r3, #2
    31b0:	6053      	str	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,1);
    31b2:	200f      	movs	r0, #15
    31b4:	2101      	movs	r1, #1
    31b6:	f7ff fb1d 	bl	27f4 <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    31ba:	200f      	movs	r0, #15
    31bc:	f7ff fa5e 	bl	267c <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    31c0:	4b2f      	ldr	r3, [pc, #188]	; (3280 <tvout_init+0x178>)
    31c2:	681a      	ldr	r2, [r3, #0]
    31c4:	f042 0202 	orr.w	r2, r2, #2
    31c8:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,1);
    31ca:	201b      	movs	r0, #27
    31cc:	2101      	movs	r1, #1
    31ce:	f7ff fb11 	bl	27f4 <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    31d2:	201b      	movs	r0, #27
    31d4:	f7ff fa52 	bl	267c <enable_interrupt>
	//video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    31d8:	2300      	movs	r3, #0
    31da:	607b      	str	r3, [r7, #4]
    31dc:	e011      	b.n	3202 <tvout_init+0xfa>
		video_buffer[i]=0xffff;
    31de:	4a29      	ldr	r2, [pc, #164]	; (3284 <tvout_init+0x17c>)
    31e0:	687b      	ldr	r3, [r7, #4]
    31e2:	f64f 71ff 	movw	r1, #65535	; 0xffff
    31e6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
    31ea:	687b      	ldr	r3, [r7, #4]
    31ec:	f503 5395 	add.w	r3, r3, #4768	; 0x12a0
    31f0:	330c      	adds	r3, #12
    31f2:	4a24      	ldr	r2, [pc, #144]	; (3284 <tvout_init+0x17c>)
    31f4:	f64f 71ff 	movw	r1, #65535	; 0xffff
    31f8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,1);
	enable_interrupt(IRQ_TIM1_CC);
	//video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    31fc:	687b      	ldr	r3, [r7, #4]
    31fe:	3301      	adds	r3, #1
    3200:	607b      	str	r3, [r7, #4]
    3202:	687b      	ldr	r3, [r7, #4]
    3204:	2b13      	cmp	r3, #19
    3206:	ddea      	ble.n	31de <tvout_init+0xd6>
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    3208:	2301      	movs	r3, #1
    320a:	607b      	str	r3, [r7, #4]
    320c:	e018      	b.n	3240 <tvout_init+0x138>
		video_buffer[i*ROW_SIZE]=0x8000;
    320e:	687a      	ldr	r2, [r7, #4]
    3210:	4613      	mov	r3, r2
    3212:	009b      	lsls	r3, r3, #2
    3214:	4413      	add	r3, r2
    3216:	009b      	lsls	r3, r3, #2
    3218:	461a      	mov	r2, r3
    321a:	4b1a      	ldr	r3, [pc, #104]	; (3284 <tvout_init+0x17c>)
    321c:	f44f 4100 	mov.w	r1, #32768	; 0x8000
    3220:	f823 1012 	strh.w	r1, [r3, r2, lsl #1]
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
    3224:	687b      	ldr	r3, [r7, #4]
    3226:	1c5a      	adds	r2, r3, #1
    3228:	4613      	mov	r3, r2
    322a:	009b      	lsls	r3, r3, #2
    322c:	4413      	add	r3, r2
    322e:	009b      	lsls	r3, r3, #2
    3230:	3b01      	subs	r3, #1
    3232:	4a14      	ldr	r2, [pc, #80]	; (3284 <tvout_init+0x17c>)
    3234:	2101      	movs	r1, #1
    3236:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i;
	for (i=0;i<ROW_SIZE;i++){
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    323a:	687b      	ldr	r3, [r7, #4]
    323c:	3301      	adds	r3, #1
    323e:	607b      	str	r3, [r7, #4]
    3240:	687b      	ldr	r3, [r7, #4]
    3242:	2bed      	cmp	r3, #237	; 0xed
    3244:	dde3      	ble.n	320e <tvout_init+0x106>
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	// test end */
 }
    3246:	3708      	adds	r7, #8
    3248:	46bd      	mov	sp, r7
    324a:	bd80      	pop	{r7, pc}
    324c:	40010800 	.word	0x40010800
    3250:	40010c00 	.word	0x40010c00
    3254:	40021000 	.word	0x40021000
    3258:	40012c28 	.word	0x40012c28
    325c:	40012c2c 	.word	0x40012c2c
    3260:	40012c34 	.word	0x40012c34
    3264:	40012c18 	.word	0x40012c18
    3268:	40012c20 	.word	0x40012c20
    326c:	40012c44 	.word	0x40012c44
    3270:	40012c00 	.word	0x40012c00
    3274:	40003800 	.word	0x40003800
    3278:	40020058 	.word	0x40020058
    327c:	4000380c 	.word	0x4000380c
    3280:	40012c0c 	.word	0x40012c0c
    3284:	2000014c 	.word	0x2000014c

00003288 <TIM1_CC_handler>:
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    3288:	4853      	ldr	r0, [pc, #332]	; (33d8 <TIM1_CC_handler+0x150>)
	line_count++;
    328a:	4b54      	ldr	r3, [pc, #336]	; (33dc <TIM1_CC_handler+0x154>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    328c:	6802      	ldr	r2, [r0, #0]
	line_count++;
	TIMER1_SR->fld.cc1if=0;
    328e:	4954      	ldr	r1, [pc, #336]	; (33e0 <TIM1_CC_handler+0x158>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    3290:	f022 0201 	bic.w	r2, r2, #1
    3294:	6002      	str	r2, [r0, #0]
	line_count++;
    3296:	681a      	ldr	r2, [r3, #0]
    3298:	3201      	adds	r2, #1
    329a:	601a      	str	r2, [r3, #0]
	TIMER1_SR->fld.cc1if=0;
    329c:	680a      	ldr	r2, [r1, #0]
    329e:	f022 0202 	bic.w	r2, r2, #2
    32a2:	600a      	str	r2, [r1, #0]
	switch(line_count){
    32a4:	681a      	ldr	r2, [r3, #0]
    32a6:	2a12      	cmp	r2, #18
    32a8:	f000 8090 	beq.w	33cc <TIM1_CC_handler+0x144>
    32ac:	dd1d      	ble.n	32ea <TIM1_CC_handler+0x62>
    32ae:	f5b2 7f96 	cmp.w	r2, #300	; 0x12c
    32b2:	f000 8082 	beq.w	33ba <TIM1_CC_handler+0x132>
    32b6:	dd3f      	ble.n	3338 <TIM1_CC_handler+0xb0>
    32b8:	f240 1141 	movw	r1, #321	; 0x141
    32bc:	428a      	cmp	r2, r1
    32be:	d028      	beq.n	3312 <TIM1_CC_handler+0x8a>
    32c0:	f5b2 7fa1 	cmp.w	r2, #322	; 0x142
    32c4:	d14a      	bne.n	335c <TIM1_CC_handler+0xd4>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    32c6:	4a47      	ldr	r2, [pc, #284]	; (33e4 <TIM1_CC_handler+0x15c>)
    32c8:	6811      	ldr	r1, [r2, #0]
    32ca:	b169      	cbz	r1, 32e8 <TIM1_CC_handler+0x60>
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
    32cc:	b410      	push	{r4}
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    32ce:	4846      	ldr	r0, [pc, #280]	; (33e8 <TIM1_CC_handler+0x160>)
			line_count=-1;
    32d0:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    32d4:	8801      	ldrh	r1, [r0, #0]
    32d6:	f3c1 014e 	ubfx	r1, r1, #1, #15
    32da:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    32dc:	601c      	str	r4, [r3, #0]
			even=-even;
    32de:	6813      	ldr	r3, [r2, #0]
    32e0:	425b      	negs	r3, r3
    32e2:	6013      	str	r3, [r2, #0]
			);
			_enable_dma();
		}
		break;
	}//switch (line_count)
}
    32e4:	f85d 4b04 	ldr.w	r4, [sp], #4
    32e8:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    32ea:	2a06      	cmp	r2, #6
    32ec:	d069      	beq.n	33c2 <TIM1_CC_handler+0x13a>
    32ee:	dd29      	ble.n	3344 <TIM1_CC_handler+0xbc>
    32f0:	2a0c      	cmp	r2, #12
    32f2:	d019      	beq.n	3328 <TIM1_CC_handler+0xa0>
    32f4:	2a11      	cmp	r2, #17
    32f6:	d131      	bne.n	335c <TIM1_CC_handler+0xd4>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
		break;
	case 17: // fin sync champ paire
		if (even){
    32f8:	4b3a      	ldr	r3, [pc, #232]	; (33e4 <TIM1_CC_handler+0x15c>)
    32fa:	681b      	ldr	r3, [r3, #0]
    32fc:	2b00      	cmp	r3, #0
    32fe:	d0f3      	beq.n	32e8 <TIM1_CC_handler+0x60>
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    3300:	f640 70ff 	movw	r0, #4095	; 0xfff
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    3304:	f240 122b 	movw	r2, #299	; 0x12b
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    3308:	4937      	ldr	r1, [pc, #220]	; (33e8 <TIM1_CC_handler+0x160>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    330a:	4b38      	ldr	r3, [pc, #224]	; (33ec <TIM1_CC_handler+0x164>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    330c:	8008      	strh	r0, [r1, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    330e:	801a      	strh	r2, [r3, #0]
    3310:	4770      	bx	lr
		break;
	case (TOP_LINE+VRES):
		video=0;
		break;
	case FIELD_END:
		if (!even){
    3312:	4a34      	ldr	r2, [pc, #208]	; (33e4 <TIM1_CC_handler+0x15c>)
    3314:	6811      	ldr	r1, [r2, #0]
    3316:	2900      	cmp	r1, #0
    3318:	d1e6      	bne.n	32e8 <TIM1_CC_handler+0x60>
			line_count=-1;
    331a:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    331e:	6019      	str	r1, [r3, #0]
			even=-even;
    3320:	6813      	ldr	r3, [r2, #0]
    3322:	425b      	negs	r3, r3
    3324:	6013      	str	r3, [r2, #0]
    3326:	4770      	bx	lr
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    3328:	f240 70ff 	movw	r0, #2047	; 0x7ff
    332c:	492e      	ldr	r1, [pc, #184]	; (33e8 <TIM1_CC_handler+0x160>)
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    332e:	4b2f      	ldr	r3, [pc, #188]	; (33ec <TIM1_CC_handler+0x164>)
    3330:	2295      	movs	r2, #149	; 0x95
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    3332:	8008      	strh	r0, [r1, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    3334:	801a      	strh	r2, [r3, #0]
		break;
    3336:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    3338:	2a3b      	cmp	r2, #59	; 0x3b
    333a:	d10f      	bne.n	335c <TIM1_CC_handler+0xd4>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    333c:	4b2c      	ldr	r3, [pc, #176]	; (33f0 <TIM1_CC_handler+0x168>)
    333e:	2201      	movs	r2, #1
    3340:	601a      	str	r2, [r3, #0]
		break;
    3342:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    3344:	b952      	cbnz	r2, 335c <TIM1_CC_handler+0xd4>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    3346:	4928      	ldr	r1, [pc, #160]	; (33e8 <TIM1_CC_handler+0x160>)
		*TIMER1_CCR1/=2;
    3348:	4a28      	ldr	r2, [pc, #160]	; (33ec <TIM1_CC_handler+0x164>)
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    334a:	880b      	ldrh	r3, [r1, #0]
    334c:	f3c3 034e 	ubfx	r3, r3, #1, #15
    3350:	800b      	strh	r3, [r1, #0]
		*TIMER1_CCR1/=2;
    3352:	8813      	ldrh	r3, [r2, #0]
    3354:	f3c3 034e 	ubfx	r3, r3, #1, #15
    3358:	8013      	strh	r3, [r2, #0]
		break;
    335a:	4770      	bx	lr
		SPI2->DR=0xaaaa;
		while (SPI2->SR&SPI_SR_BSY);
		SPI2->CR1=SPI_PIXELS;
		SPI2->DR=0;
*/	
		if (video){
    335c:	4a24      	ldr	r2, [pc, #144]	; (33f0 <TIM1_CC_handler+0x168>)
    335e:	6812      	ldr	r2, [r2, #0]
    3360:	2a00      	cmp	r2, #0
    3362:	d0c1      	beq.n	32e8 <TIM1_CC_handler+0x60>
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    3364:	681b      	ldr	r3, [r3, #0]
    3366:	4a23      	ldr	r2, [pc, #140]	; (33f4 <TIM1_CC_handler+0x16c>)
    3368:	3b3c      	subs	r3, #60	; 0x3c
    336a:	491b      	ldr	r1, [pc, #108]	; (33d8 <TIM1_CC_handler+0x150>)
    336c:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    3370:	eb02 03c3 	add.w	r3, r2, r3, lsl #3
			DMA1[DMACH5].cndtr=ROW_SIZE;
    3374:	2014      	movs	r0, #20
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    3376:	4a20      	ldr	r2, [pc, #128]	; (33f8 <TIM1_CC_handler+0x170>)
		SPI2->DR=0;
*/	
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    3378:	60cb      	str	r3, [r1, #12]
			DMA1[DMACH5].cndtr=ROW_SIZE;
    337a:	6048      	str	r0, [r1, #4]
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    337c:	8813      	ldrh	r3, [r2, #0]
    337e:	b29b      	uxth	r3, r3
    3380:	f5b3 6f83 	cmp.w	r3, #1048	; 0x418
    3384:	d804      	bhi.n	3390 <TIM1_CC_handler+0x108>
    3386:	8813      	ldrh	r3, [r2, #0]
    3388:	b29b      	uxth	r3, r3
    338a:	f5b3 6f83 	cmp.w	r3, #1048	; 0x418
    338e:	d9fa      	bls.n	3386 <TIM1_CC_handler+0xfe>
			// réduction de la gigue vidéo
			asm volatile(
    3390:	4b19      	ldr	r3, [pc, #100]	; (33f8 <TIM1_CC_handler+0x170>)
    3392:	461b      	mov	r3, r3
    3394:	681b      	ldr	r3, [r3, #0]
    3396:	f003 0307 	and.w	r3, r3, #7
    339a:	005b      	lsls	r3, r3, #1
    339c:	449f      	add	pc, r3
    339e:	bf00      	nop
    33a0:	bf00      	nop
    33a2:	bf00      	nop
    33a4:	bf00      	nop
    33a6:	bf00      	nop
    33a8:	bf00      	nop
    33aa:	bf00      	nop
    33ac:	bf00      	nop
			"nop\n\t"
			"nop\n\t"
			"nop\n\t"
			::"r" (TIMER1_CNT)
			);
			_enable_dma();
    33ae:	4a0a      	ldr	r2, [pc, #40]	; (33d8 <TIM1_CC_handler+0x150>)
    33b0:	6813      	ldr	r3, [r2, #0]
    33b2:	f043 0301 	orr.w	r3, r3, #1
    33b6:	6013      	str	r3, [r2, #0]
    33b8:	4770      	bx	lr
		break;
	case TOP_LINE-1:
		video=1;
		break;
	case (TOP_LINE+VRES):
		video=0;
    33ba:	4b0d      	ldr	r3, [pc, #52]	; (33f0 <TIM1_CC_handler+0x168>)
    33bc:	2200      	movs	r2, #0
    33be:	601a      	str	r2, [r3, #0]
		break;
    33c0:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    33c2:	f240 7269 	movw	r2, #1897	; 0x769
    33c6:	4b09      	ldr	r3, [pc, #36]	; (33ec <TIM1_CC_handler+0x164>)
    33c8:	801a      	strh	r2, [r3, #0]
	    break;
    33ca:	4770      	bx	lr
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
    33cc:	4b05      	ldr	r3, [pc, #20]	; (33e4 <TIM1_CC_handler+0x15c>)
    33ce:	681b      	ldr	r3, [r3, #0]
    33d0:	2b00      	cmp	r3, #0
    33d2:	d189      	bne.n	32e8 <TIM1_CC_handler+0x60>
    33d4:	e794      	b.n	3300 <TIM1_CC_handler+0x78>
    33d6:	bf00      	nop
    33d8:	40020058 	.word	0x40020058
    33dc:	20000008 	.word	0x20000008
    33e0:	40012c10 	.word	0x40012c10
    33e4:	200000f8 	.word	0x200000f8
    33e8:	40012c2c 	.word	0x40012c2c
    33ec:	40012c34 	.word	0x40012c34
    33f0:	200000f4 	.word	0x200000f4
    33f4:	2000014c 	.word	0x2000014c
    33f8:	40012c24 	.word	0x40012c24

000033fc <DMA1CH5_handler>:
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
    33fc:	b480      	push	{r7}
    33fe:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    3400:	4a09      	ldr	r2, [pc, #36]	; (3428 <DMA1CH5_handler+0x2c>)
    3402:	4b09      	ldr	r3, [pc, #36]	; (3428 <DMA1CH5_handler+0x2c>)
    3404:	685b      	ldr	r3, [r3, #4]
    3406:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    340a:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    340c:	bf00      	nop
    340e:	4b07      	ldr	r3, [pc, #28]	; (342c <DMA1CH5_handler+0x30>)
    3410:	689b      	ldr	r3, [r3, #8]
    3412:	f003 0302 	and.w	r3, r3, #2
    3416:	2b00      	cmp	r3, #0
    3418:	d0f9      	beq.n	340e <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    341a:	4b04      	ldr	r3, [pc, #16]	; (342c <DMA1CH5_handler+0x30>)
    341c:	2200      	movs	r2, #0
    341e:	60da      	str	r2, [r3, #12]
}
    3420:	46bd      	mov	sp, r7
    3422:	f85d 7b04 	ldr.w	r7, [sp], #4
    3426:	4770      	bx	lr
    3428:	40020000 	.word	0x40020000
    342c:	40003800 	.word	0x40003800

00003430 <usart_config_port>:

#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 

// configuration dse broches
void usart_config_port(usart_t* channel, gpio_t *port, unsigned flow_ctrl){
    3430:	b480      	push	{r7}
    3432:	b085      	sub	sp, #20
    3434:	af00      	add	r7, sp, #0
    3436:	60f8      	str	r0, [r7, #12]
    3438:	60b9      	str	r1, [r7, #8]
    343a:	607a      	str	r2, [r7, #4]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    343c:	68fb      	ldr	r3, [r7, #12]
    343e:	4a45      	ldr	r2, [pc, #276]	; (3554 <usart_config_port+0x124>)
    3440:	4293      	cmp	r3, r2
    3442:	d058      	beq.n	34f6 <usart_config_port+0xc6>
    3444:	4a44      	ldr	r2, [pc, #272]	; (3558 <usart_config_port+0x128>)
    3446:	4293      	cmp	r3, r2
    3448:	d003      	beq.n	3452 <usart_config_port+0x22>
    344a:	4a44      	ldr	r2, [pc, #272]	; (355c <usart_config_port+0x12c>)
    344c:	4293      	cmp	r3, r2
    344e:	d029      	beq.n	34a4 <usart_config_port+0x74>
    3450:	e07a      	b.n	3548 <usart_config_port+0x118>
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
    3452:	4a43      	ldr	r2, [pc, #268]	; (3560 <usart_config_port+0x130>)
    3454:	4b42      	ldr	r3, [pc, #264]	; (3560 <usart_config_port+0x130>)
    3456:	699b      	ldr	r3, [r3, #24]
    3458:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    345c:	f043 0304 	orr.w	r3, r3, #4
    3460:	6193      	str	r3, [r2, #24]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    3462:	687b      	ldr	r3, [r7, #4]
    3464:	2b01      	cmp	r3, #1
    3466:	d110      	bne.n	348a <usart_config_port+0x5a>
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
    3468:	68bb      	ldr	r3, [r7, #8]
    346a:	685b      	ldr	r3, [r3, #4]
    346c:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    3470:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    3474:	68ba      	ldr	r2, [r7, #8]
    3476:	6053      	str	r3, [r2, #4]
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
    3478:	68bb      	ldr	r3, [r7, #8]
    347a:	685b      	ldr	r3, [r3, #4]
    347c:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    3480:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    3484:	68ba      	ldr	r2, [r7, #8]
    3486:	6053      	str	r3, [r2, #4]
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
		}
		break;
    3488:	e05e      	b.n	3548 <usart_config_port+0x118>
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
    348a:	68bb      	ldr	r3, [r7, #8]
    348c:	685b      	ldr	r3, [r3, #4]
    348e:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
    3492:	68bb      	ldr	r3, [r7, #8]
    3494:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
    3496:	68bb      	ldr	r3, [r7, #8]
    3498:	685b      	ldr	r3, [r3, #4]
    349a:	f043 02a0 	orr.w	r2, r3, #160	; 0xa0
    349e:	68bb      	ldr	r3, [r7, #8]
    34a0:	605a      	str	r2, [r3, #4]
		}
		break;
    34a2:	e051      	b.n	3548 <usart_config_port+0x118>
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    34a4:	4a2e      	ldr	r2, [pc, #184]	; (3560 <usart_config_port+0x130>)
    34a6:	4b2e      	ldr	r3, [pc, #184]	; (3560 <usart_config_port+0x130>)
    34a8:	69db      	ldr	r3, [r3, #28]
    34aa:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    34ae:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    34b0:	4a2b      	ldr	r2, [pc, #172]	; (3560 <usart_config_port+0x130>)
    34b2:	4b2b      	ldr	r3, [pc, #172]	; (3560 <usart_config_port+0x130>)
    34b4:	699b      	ldr	r3, [r3, #24]
    34b6:	f043 0304 	orr.w	r3, r3, #4
    34ba:	6193      	str	r3, [r2, #24]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
    34bc:	687b      	ldr	r3, [r7, #4]
    34be:	2b01      	cmp	r3, #1
    34c0:	d10c      	bne.n	34dc <usart_config_port+0xac>
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
    34c2:	68bb      	ldr	r3, [r7, #8]
    34c4:	681b      	ldr	r3, [r3, #0]
    34c6:	f423 627f 	bic.w	r2, r3, #4080	; 0xff0
    34ca:	68bb      	ldr	r3, [r7, #8]
    34cc:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
    34ce:	68bb      	ldr	r3, [r7, #8]
    34d0:	681b      	ldr	r3, [r3, #0]
    34d2:	f443 622a 	orr.w	r2, r3, #2720	; 0xaa0
    34d6:	68bb      	ldr	r3, [r7, #8]
    34d8:	601a      	str	r2, [r3, #0]
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
		}
		break;
    34da:	e035      	b.n	3548 <usart_config_port+0x118>
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
    34dc:	68bb      	ldr	r3, [r7, #8]
    34de:	681b      	ldr	r3, [r3, #0]
    34e0:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    34e4:	68bb      	ldr	r3, [r7, #8]
    34e6:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
    34e8:	68bb      	ldr	r3, [r7, #8]
    34ea:	681b      	ldr	r3, [r3, #0]
    34ec:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    34f0:	68bb      	ldr	r3, [r7, #8]
    34f2:	601a      	str	r2, [r3, #0]
		}
		break;
    34f4:	e028      	b.n	3548 <usart_config_port+0x118>
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
    34f6:	4a1a      	ldr	r2, [pc, #104]	; (3560 <usart_config_port+0x130>)
    34f8:	4b19      	ldr	r3, [pc, #100]	; (3560 <usart_config_port+0x130>)
    34fa:	69db      	ldr	r3, [r3, #28]
    34fc:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    3500:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    3502:	4a17      	ldr	r2, [pc, #92]	; (3560 <usart_config_port+0x130>)
    3504:	4b16      	ldr	r3, [pc, #88]	; (3560 <usart_config_port+0x130>)
    3506:	699b      	ldr	r3, [r3, #24]
    3508:	f043 0308 	orr.w	r3, r3, #8
    350c:	6193      	str	r3, [r2, #24]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    350e:	687b      	ldr	r3, [r7, #4]
    3510:	2b01      	cmp	r3, #1
    3512:	d10c      	bne.n	352e <usart_config_port+0xfe>
			port->CR[1]&=~((15<<((USART3_TX_PIN-8)*4))|(15<<((USART3_RTS_PIN-8)*4)));
    3514:	68bb      	ldr	r3, [r7, #8]
    3516:	685b      	ldr	r3, [r3, #4]
    3518:	f023 220f 	bic.w	r2, r3, #251662080	; 0xf000f00
    351c:	68bb      	ldr	r3, [r7, #8]
    351e:	605a      	str	r2, [r3, #4]
			port->CR[1]|=(0xA<<((USART3_TX_PIN-8)*4))|(0xA<<((USART3_RTS_PIN-8)*4));
    3520:	68bb      	ldr	r3, [r7, #8]
    3522:	685b      	ldr	r3, [r3, #4]
    3524:	f043 220a 	orr.w	r2, r3, #167774720	; 0xa000a00
    3528:	68bb      	ldr	r3, [r7, #8]
    352a:	605a      	str	r2, [r3, #4]
    352c:	e00b      	b.n	3546 <usart_config_port+0x116>
		}else{
			port->CR[1]&=~(15<<((USART3_TX_PIN-8)*4));
    352e:	68bb      	ldr	r3, [r7, #8]
    3530:	685b      	ldr	r3, [r3, #4]
    3532:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    3536:	68bb      	ldr	r3, [r7, #8]
    3538:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART3_TX_PIN-8)*4);
    353a:	68bb      	ldr	r3, [r7, #8]
    353c:	685b      	ldr	r3, [r3, #4]
    353e:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    3542:	68bb      	ldr	r3, [r7, #8]
    3544:	605a      	str	r2, [r3, #4]
		}
		break;
    3546:	bf00      	nop
	}
}
    3548:	3714      	adds	r7, #20
    354a:	46bd      	mov	sp, r7
    354c:	f85d 7b04 	ldr.w	r7, [sp], #4
    3550:	4770      	bx	lr
    3552:	bf00      	nop
    3554:	40004800 	.word	0x40004800
    3558:	40013800 	.word	0x40013800
    355c:	40004400 	.word	0x40004400
    3560:	40021000 	.word	0x40021000

00003564 <usart_set_baud>:

// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
    3564:	b480      	push	{r7}
    3566:	b085      	sub	sp, #20
    3568:	af00      	add	r7, sp, #0
    356a:	6078      	str	r0, [r7, #4]
    356c:	6039      	str	r1, [r7, #0]
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
    356e:	687b      	ldr	r3, [r7, #4]
    3570:	4a14      	ldr	r2, [pc, #80]	; (35c4 <usart_set_baud+0x60>)
    3572:	4293      	cmp	r3, r2
    3574:	d10f      	bne.n	3596 <usart_set_baud+0x32>
		rate=(FAPB2/baud/16)<<4;
    3576:	4a14      	ldr	r2, [pc, #80]	; (35c8 <usart_set_baud+0x64>)
    3578:	683b      	ldr	r3, [r7, #0]
    357a:	fbb2 f3f3 	udiv	r3, r2, r3
    357e:	011b      	lsls	r3, r3, #4
    3580:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    3582:	4a12      	ldr	r2, [pc, #72]	; (35cc <usart_set_baud+0x68>)
    3584:	683b      	ldr	r3, [r7, #0]
    3586:	fbb2 f3f3 	udiv	r3, r2, r3
    358a:	f003 030f 	and.w	r3, r3, #15
    358e:	68fa      	ldr	r2, [r7, #12]
    3590:	4313      	orrs	r3, r2
    3592:	60fb      	str	r3, [r7, #12]
    3594:	e00e      	b.n	35b4 <usart_set_baud+0x50>
	}else{
		rate=(FAPB1/baud/16)<<4;
    3596:	4a0e      	ldr	r2, [pc, #56]	; (35d0 <usart_set_baud+0x6c>)
    3598:	683b      	ldr	r3, [r7, #0]
    359a:	fbb2 f3f3 	udiv	r3, r2, r3
    359e:	011b      	lsls	r3, r3, #4
    35a0:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    35a2:	4a0c      	ldr	r2, [pc, #48]	; (35d4 <usart_set_baud+0x70>)
    35a4:	683b      	ldr	r3, [r7, #0]
    35a6:	fbb2 f3f3 	udiv	r3, r2, r3
    35aa:	f003 030f 	and.w	r3, r3, #15
    35ae:	68fa      	ldr	r2, [r7, #12]
    35b0:	4313      	orrs	r3, r2
    35b2:	60fb      	str	r3, [r7, #12]
	}
	channel->BRR=rate;
    35b4:	687b      	ldr	r3, [r7, #4]
    35b6:	68fa      	ldr	r2, [r7, #12]
    35b8:	609a      	str	r2, [r3, #8]
}
    35ba:	3714      	adds	r7, #20
    35bc:	46bd      	mov	sp, r7
    35be:	f85d 7b04 	ldr.w	r7, [sp], #4
    35c2:	4770      	bx	lr
    35c4:	40013800 	.word	0x40013800
    35c8:	003d0900 	.word	0x003d0900
    35cc:	03d09000 	.word	0x03d09000
    35d0:	001e8480 	.word	0x001e8480
    35d4:	01e84800 	.word	0x01e84800

000035d8 <usart_comm_dir>:

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
    35d8:	b480      	push	{r7}
    35da:	b083      	sub	sp, #12
    35dc:	af00      	add	r7, sp, #0
    35de:	6078      	str	r0, [r7, #4]
    35e0:	6039      	str	r1, [r7, #0]
	channel->CR1&=USART_CR1_DIR_MASK;
    35e2:	687b      	ldr	r3, [r7, #4]
    35e4:	68db      	ldr	r3, [r3, #12]
    35e6:	f023 020c 	bic.w	r2, r3, #12
    35ea:	687b      	ldr	r3, [r7, #4]
    35ec:	60da      	str	r2, [r3, #12]
	channel->CR1|=direction<<USART_CR1_DIR_POS;
    35ee:	687b      	ldr	r3, [r7, #4]
    35f0:	68da      	ldr	r2, [r3, #12]
    35f2:	683b      	ldr	r3, [r7, #0]
    35f4:	009b      	lsls	r3, r3, #2
    35f6:	431a      	orrs	r2, r3
    35f8:	687b      	ldr	r3, [r7, #4]
    35fa:	60da      	str	r2, [r3, #12]
}
    35fc:	370c      	adds	r7, #12
    35fe:	46bd      	mov	sp, r7
    3600:	f85d 7b04 	ldr.w	r7, [sp], #4
    3604:	4770      	bx	lr
    3606:	bf00      	nop

00003608 <usart_open_channel>:


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
    3608:	b580      	push	{r7, lr}
    360a:	b084      	sub	sp, #16
    360c:	af00      	add	r7, sp, #0
    360e:	60f8      	str	r0, [r7, #12]
    3610:	60b9      	str	r1, [r7, #8]
    3612:	607a      	str	r2, [r7, #4]
    3614:	603b      	str	r3, [r7, #0]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    3616:	68fb      	ldr	r3, [r7, #12]
    3618:	4a32      	ldr	r2, [pc, #200]	; (36e4 <usart_open_channel+0xdc>)
    361a:	4293      	cmp	r3, r2
    361c:	d020      	beq.n	3660 <usart_open_channel+0x58>
    361e:	4a32      	ldr	r2, [pc, #200]	; (36e8 <usart_open_channel+0xe0>)
    3620:	4293      	cmp	r3, r2
    3622:	d003      	beq.n	362c <usart_open_channel+0x24>
    3624:	4a31      	ldr	r2, [pc, #196]	; (36ec <usart_open_channel+0xe4>)
    3626:	4293      	cmp	r3, r2
    3628:	d00d      	beq.n	3646 <usart_open_channel+0x3e>
    362a:	e026      	b.n	367a <usart_open_channel+0x72>
	case (uint32_t)USART1:
		usart_config_port(channel,USART1_PORT,flow_ctrl);
    362c:	68f8      	ldr	r0, [r7, #12]
    362e:	4930      	ldr	r1, [pc, #192]	; (36f0 <usart_open_channel+0xe8>)
    3630:	69ba      	ldr	r2, [r7, #24]
    3632:	f7ff fefd 	bl	3430 <usart_config_port>
		set_int_priority(IRQ_USART1,7);
    3636:	2025      	movs	r0, #37	; 0x25
    3638:	2107      	movs	r1, #7
    363a:	f7ff f8db 	bl	27f4 <set_int_priority>
		enable_interrupt(IRQ_USART1);
    363e:	2025      	movs	r0, #37	; 0x25
    3640:	f7ff f81c 	bl	267c <enable_interrupt>
		break;
    3644:	e019      	b.n	367a <usart_open_channel+0x72>
	case (uint32_t)USART2:
		usart_config_port(channel,USART2_PORT,flow_ctrl);
    3646:	68f8      	ldr	r0, [r7, #12]
    3648:	4929      	ldr	r1, [pc, #164]	; (36f0 <usart_open_channel+0xe8>)
    364a:	69ba      	ldr	r2, [r7, #24]
    364c:	f7ff fef0 	bl	3430 <usart_config_port>
		set_int_priority(IRQ_USART2,7);
    3650:	2026      	movs	r0, #38	; 0x26
    3652:	2107      	movs	r1, #7
    3654:	f7ff f8ce 	bl	27f4 <set_int_priority>
		enable_interrupt(IRQ_USART2);
    3658:	2026      	movs	r0, #38	; 0x26
    365a:	f7ff f80f 	bl	267c <enable_interrupt>
		break;
    365e:	e00c      	b.n	367a <usart_open_channel+0x72>
	case (uint32_t)USART3:
		usart_config_port(channel,USART3_PORT,flow_ctrl);
    3660:	68f8      	ldr	r0, [r7, #12]
    3662:	4924      	ldr	r1, [pc, #144]	; (36f4 <usart_open_channel+0xec>)
    3664:	69ba      	ldr	r2, [r7, #24]
    3666:	f7ff fee3 	bl	3430 <usart_config_port>
		set_int_priority(IRQ_USART3,7);
    366a:	2027      	movs	r0, #39	; 0x27
    366c:	2107      	movs	r1, #7
    366e:	f7ff f8c1 	bl	27f4 <set_int_priority>
		enable_interrupt(IRQ_USART3);
    3672:	2027      	movs	r0, #39	; 0x27
    3674:	f7ff f802 	bl	267c <enable_interrupt>
		break;
    3678:	bf00      	nop
	}
	if (flow_ctrl==FLOW_HARD){
    367a:	69bb      	ldr	r3, [r7, #24]
    367c:	2b01      	cmp	r3, #1
    367e:	d103      	bne.n	3688 <usart_open_channel+0x80>
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    3680:	68fb      	ldr	r3, [r7, #12]
    3682:	f44f 7240 	mov.w	r2, #768	; 0x300
    3686:	615a      	str	r2, [r3, #20]
	}
	usart_comm_dir(channel,dir);
    3688:	68f8      	ldr	r0, [r7, #12]
    368a:	6839      	ldr	r1, [r7, #0]
    368c:	f7ff ffa4 	bl	35d8 <usart_comm_dir>
	switch (parity){
    3690:	687b      	ldr	r3, [r7, #4]
    3692:	2b01      	cmp	r3, #1
    3694:	d00b      	beq.n	36ae <usart_open_channel+0xa6>
    3696:	2b01      	cmp	r3, #1
    3698:	d302      	bcc.n	36a0 <usart_open_channel+0x98>
    369a:	2b02      	cmp	r3, #2
    369c:	d00e      	beq.n	36bc <usart_open_channel+0xb4>
    369e:	e014      	b.n	36ca <usart_open_channel+0xc2>
	case PARITY_NONE:
		channel->CR1|=USART_CR1_RXNEIE;
    36a0:	68fb      	ldr	r3, [r7, #12]
    36a2:	68db      	ldr	r3, [r3, #12]
    36a4:	f043 0220 	orr.w	r2, r3, #32
    36a8:	68fb      	ldr	r3, [r7, #12]
    36aa:	60da      	str	r2, [r3, #12]
		break;
    36ac:	e00d      	b.n	36ca <usart_open_channel+0xc2>
	case PARITY_ODD:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS|USART_CR1_RXNEIE;
    36ae:	68fb      	ldr	r3, [r7, #12]
    36b0:	68db      	ldr	r3, [r3, #12]
    36b2:	f443 62e4 	orr.w	r2, r3, #1824	; 0x720
    36b6:	68fb      	ldr	r3, [r7, #12]
    36b8:	60da      	str	r2, [r3, #12]
		break;
    36ba:	e006      	b.n	36ca <usart_open_channel+0xc2>
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_RXNEIE;
    36bc:	68fb      	ldr	r3, [r7, #12]
    36be:	68db      	ldr	r3, [r3, #12]
    36c0:	f443 62a4 	orr.w	r2, r3, #1312	; 0x520
    36c4:	68fb      	ldr	r3, [r7, #12]
    36c6:	60da      	str	r2, [r3, #12]
		break;
    36c8:	bf00      	nop
    }
	usart_set_baud(channel,baud);
    36ca:	68f8      	ldr	r0, [r7, #12]
    36cc:	68b9      	ldr	r1, [r7, #8]
    36ce:	f7ff ff49 	bl	3564 <usart_set_baud>
    channel->CR1|=USART_CR1_UE;
    36d2:	68fb      	ldr	r3, [r7, #12]
    36d4:	68db      	ldr	r3, [r3, #12]
    36d6:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
    36da:	68fb      	ldr	r3, [r7, #12]
    36dc:	60da      	str	r2, [r3, #12]
}
    36de:	3710      	adds	r7, #16
    36e0:	46bd      	mov	sp, r7
    36e2:	bd80      	pop	{r7, pc}
    36e4:	40004800 	.word	0x40004800
    36e8:	40013800 	.word	0x40013800
    36ec:	40004400 	.word	0x40004400
    36f0:	40010800 	.word	0x40010800
    36f4:	40010c00 	.word	0x40010c00

000036f8 <usart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
    36f8:	b480      	push	{r7}
    36fa:	b083      	sub	sp, #12
    36fc:	af00      	add	r7, sp, #0
    36fe:	6078      	str	r0, [r7, #4]
	return channel->SR&USART_SR_RXNE;
    3700:	687b      	ldr	r3, [r7, #4]
    3702:	681b      	ldr	r3, [r3, #0]
    3704:	f003 0320 	and.w	r3, r3, #32
}
    3708:	4618      	mov	r0, r3
    370a:	370c      	adds	r7, #12
    370c:	46bd      	mov	sp, r7
    370e:	f85d 7b04 	ldr.w	r7, [sp], #4
    3712:	4770      	bx	lr

00003714 <usart_getc>:

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
    3714:	b480      	push	{r7}
    3716:	b083      	sub	sp, #12
    3718:	af00      	add	r7, sp, #0
    371a:	6078      	str	r0, [r7, #4]
	return channel->DR;
    371c:	687b      	ldr	r3, [r7, #4]
    371e:	685b      	ldr	r3, [r3, #4]
    3720:	b2db      	uxtb	r3, r3
}
    3722:	4618      	mov	r0, r3
    3724:	370c      	adds	r7, #12
    3726:	46bd      	mov	sp, r7
    3728:	f85d 7b04 	ldr.w	r7, [sp], #4
    372c:	4770      	bx	lr
    372e:	bf00      	nop

00003730 <usart_putc>:

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
    3730:	b480      	push	{r7}
    3732:	b083      	sub	sp, #12
    3734:	af00      	add	r7, sp, #0
    3736:	6078      	str	r0, [r7, #4]
    3738:	460b      	mov	r3, r1
    373a:	70fb      	strb	r3, [r7, #3]
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
    373c:	bf00      	nop
    373e:	687b      	ldr	r3, [r7, #4]
    3740:	681b      	ldr	r3, [r3, #0]
    3742:	f003 0380 	and.w	r3, r3, #128	; 0x80
    3746:	2b00      	cmp	r3, #0
    3748:	d0f9      	beq.n	373e <usart_putc+0xe>
	channel->DR=c;
    374a:	78fa      	ldrb	r2, [r7, #3]
    374c:	687b      	ldr	r3, [r7, #4]
    374e:	605a      	str	r2, [r3, #4]
}
    3750:	370c      	adds	r7, #12
    3752:	46bd      	mov	sp, r7
    3754:	f85d 7b04 	ldr.w	r7, [sp], #4
    3758:	4770      	bx	lr
    375a:	bf00      	nop

0000375c <usart_cts>:


int usart_cts(usart_t* channel){
    375c:	b480      	push	{r7}
    375e:	b085      	sub	sp, #20
    3760:	af00      	add	r7, sp, #0
    3762:	6078      	str	r0, [r7, #4]
	int cts;
	switch ((uint32_t)channel){
    3764:	687b      	ldr	r3, [r7, #4]
    3766:	4a11      	ldr	r2, [pc, #68]	; (37ac <usart_cts+0x50>)
    3768:	4293      	cmp	r3, r2
    376a:	d012      	beq.n	3792 <usart_cts+0x36>
    376c:	4a10      	ldr	r2, [pc, #64]	; (37b0 <usart_cts+0x54>)
    376e:	4293      	cmp	r3, r2
    3770:	d003      	beq.n	377a <usart_cts+0x1e>
    3772:	4a10      	ldr	r2, [pc, #64]	; (37b4 <usart_cts+0x58>)
    3774:	4293      	cmp	r3, r2
    3776:	d006      	beq.n	3786 <usart_cts+0x2a>
    3778:	e011      	b.n	379e <usart_cts+0x42>
		case (uint32_t)USART1:
			cts=USART1_PORT->IDR&USART1_CTS_BIT;
    377a:	4b0f      	ldr	r3, [pc, #60]	; (37b8 <usart_cts+0x5c>)
    377c:	689b      	ldr	r3, [r3, #8]
    377e:	f403 6300 	and.w	r3, r3, #2048	; 0x800
    3782:	60fb      	str	r3, [r7, #12]
			break;
    3784:	e00b      	b.n	379e <usart_cts+0x42>
		case (uint32_t)USART2:
			cts=USART2_PORT->IDR&USART2_CTS_BIT;
    3786:	4b0c      	ldr	r3, [pc, #48]	; (37b8 <usart_cts+0x5c>)
    3788:	689b      	ldr	r3, [r3, #8]
    378a:	f003 0301 	and.w	r3, r3, #1
    378e:	60fb      	str	r3, [r7, #12]
			break;
    3790:	e005      	b.n	379e <usart_cts+0x42>
		case (uint32_t)USART3:
			cts=USART3_PORT->IDR&USART3_CTS_BIT;
    3792:	4b0a      	ldr	r3, [pc, #40]	; (37bc <usart_cts+0x60>)
    3794:	689b      	ldr	r3, [r3, #8]
    3796:	f403 5300 	and.w	r3, r3, #8192	; 0x2000
    379a:	60fb      	str	r3, [r7, #12]
			break;
    379c:	bf00      	nop
	}
	return cts;
    379e:	68fb      	ldr	r3, [r7, #12]
}
    37a0:	4618      	mov	r0, r3
    37a2:	3714      	adds	r7, #20
    37a4:	46bd      	mov	sp, r7
    37a6:	f85d 7b04 	ldr.w	r7, [sp], #4
    37aa:	4770      	bx	lr
    37ac:	40004800 	.word	0x40004800
    37b0:	40013800 	.word	0x40013800
    37b4:	40004400 	.word	0x40004400
    37b8:	40010800 	.word	0x40010800
    37bc:	40010c00 	.word	0x40010c00

000037c0 <vt_init>:

#include "../include/blue_pill.h"
#include "vt100.h"
#include "console.h"

void vt_init(){
    37c0:	b580      	push	{r7, lr}
    37c2:	b082      	sub	sp, #8
    37c4:	af02      	add	r7, sp, #8
	usart_open_channel(VT_USART,115200,PARITY_NONE,USART_DIR_BIDI,FLOW_HARD);
    37c6:	2301      	movs	r3, #1
    37c8:	9300      	str	r3, [sp, #0]
    37ca:	4804      	ldr	r0, [pc, #16]	; (37dc <vt_init+0x1c>)
    37cc:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
    37d0:	2200      	movs	r2, #0
    37d2:	2303      	movs	r3, #3
    37d4:	f7ff ff18 	bl	3608 <usart_open_channel>
}
    37d8:	46bd      	mov	sp, r7
    37da:	bd80      	pop	{r7, pc}
    37dc:	40004400 	.word	0x40004400

000037e0 <vt_putc>:

void vt_putc(char c){
    37e0:	b580      	push	{r7, lr}
    37e2:	b082      	sub	sp, #8
    37e4:	af00      	add	r7, sp, #0
    37e6:	4603      	mov	r3, r0
    37e8:	71fb      	strb	r3, [r7, #7]
	usart_putc(VT_USART,c);
    37ea:	79fb      	ldrb	r3, [r7, #7]
    37ec:	4803      	ldr	r0, [pc, #12]	; (37fc <vt_putc+0x1c>)
    37ee:	4619      	mov	r1, r3
    37f0:	f7ff ff9e 	bl	3730 <usart_putc>
}
    37f4:	3708      	adds	r7, #8
    37f6:	46bd      	mov	sp, r7
    37f8:	bd80      	pop	{r7, pc}
    37fa:	bf00      	nop
    37fc:	40004400 	.word	0x40004400

00003800 <vt_del_back>:

void vt_del_back(){
    3800:	b580      	push	{r7, lr}
    3802:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,BS);
    3804:	4806      	ldr	r0, [pc, #24]	; (3820 <vt_del_back+0x20>)
    3806:	2108      	movs	r1, #8
    3808:	f7ff ff92 	bl	3730 <usart_putc>
	usart_putc(VT_USART,SPACE);
    380c:	4804      	ldr	r0, [pc, #16]	; (3820 <vt_del_back+0x20>)
    380e:	2120      	movs	r1, #32
    3810:	f7ff ff8e 	bl	3730 <usart_putc>
	usart_putc(VT_USART,BS);
    3814:	4802      	ldr	r0, [pc, #8]	; (3820 <vt_del_back+0x20>)
    3816:	2108      	movs	r1, #8
    3818:	f7ff ff8a 	bl	3730 <usart_putc>
}
    381c:	bd80      	pop	{r7, pc}
    381e:	bf00      	nop
    3820:	40004400 	.word	0x40004400

00003824 <vt_esc_seq>:

static void vt_esc_seq(){
    3824:	b580      	push	{r7, lr}
    3826:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,ESC);
    3828:	4804      	ldr	r0, [pc, #16]	; (383c <vt_esc_seq+0x18>)
    382a:	211b      	movs	r1, #27
    382c:	f7ff ff80 	bl	3730 <usart_putc>
	usart_putc(VT_USART,'[');
    3830:	4802      	ldr	r0, [pc, #8]	; (383c <vt_esc_seq+0x18>)
    3832:	215b      	movs	r1, #91	; 0x5b
    3834:	f7ff ff7c 	bl	3730 <usart_putc>
}
    3838:	bd80      	pop	{r7, pc}
    383a:	bf00      	nop
    383c:	40004400 	.word	0x40004400

00003840 <vt_cls>:


// vide l'écran de la console
void vt_cls(){
    3840:	b580      	push	{r7, lr}
    3842:	af00      	add	r7, sp, #0
	vt_esc_seq();
    3844:	f7ff ffee 	bl	3824 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    3848:	4804      	ldr	r0, [pc, #16]	; (385c <vt_cls+0x1c>)
    384a:	2132      	movs	r1, #50	; 0x32
    384c:	f7ff ff70 	bl	3730 <usart_putc>
	usart_putc(VT_USART,'J');
    3850:	4802      	ldr	r0, [pc, #8]	; (385c <vt_cls+0x1c>)
    3852:	214a      	movs	r1, #74	; 0x4a
    3854:	f7ff ff6c 	bl	3730 <usart_putc>
}
    3858:	bd80      	pop	{r7, pc}
    385a:	bf00      	nop
    385c:	40004400 	.word	0x40004400

00003860 <vt_clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void vt_clear_line(unsigned n){
    3860:	b580      	push	{r7, lr}
    3862:	b082      	sub	sp, #8
    3864:	af00      	add	r7, sp, #0
    3866:	6078      	str	r0, [r7, #4]
	vt_esc_seq();
    3868:	f7ff ffdc 	bl	3824 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    386c:	480a      	ldr	r0, [pc, #40]	; (3898 <vt_clear_line+0x38>)
    386e:	2132      	movs	r1, #50	; 0x32
    3870:	f7ff ff5e 	bl	3730 <usart_putc>
	usart_putc(VT_USART,'K');
    3874:	4808      	ldr	r0, [pc, #32]	; (3898 <vt_clear_line+0x38>)
    3876:	214b      	movs	r1, #75	; 0x4b
    3878:	f7ff ff5a 	bl	3730 <usart_putc>
	while (n){usart_putc(VT_USART,BS);n--;}
    387c:	e006      	b.n	388c <vt_clear_line+0x2c>
    387e:	4806      	ldr	r0, [pc, #24]	; (3898 <vt_clear_line+0x38>)
    3880:	2108      	movs	r1, #8
    3882:	f7ff ff55 	bl	3730 <usart_putc>
    3886:	687b      	ldr	r3, [r7, #4]
    3888:	3b01      	subs	r3, #1
    388a:	607b      	str	r3, [r7, #4]
    388c:	687b      	ldr	r3, [r7, #4]
    388e:	2b00      	cmp	r3, #0
    3890:	d1f5      	bne.n	387e <vt_clear_line+0x1e>
}
    3892:	3708      	adds	r7, #8
    3894:	46bd      	mov	sp, r7
    3896:	bd80      	pop	{r7, pc}
    3898:	40004400 	.word	0x40004400

0000389c <vt_ready>:

// vérifie si le terminal est prêt
int vt_ready(){
    389c:	b480      	push	{r7}
    389e:	af00      	add	r7, sp, #0
	return !(VT_PORT->IDR&VT_CTS_BIT);
    38a0:	4b06      	ldr	r3, [pc, #24]	; (38bc <vt_ready+0x20>)
    38a2:	689b      	ldr	r3, [r3, #8]
    38a4:	f003 0301 	and.w	r3, r3, #1
    38a8:	2b00      	cmp	r3, #0
    38aa:	bf0c      	ite	eq
    38ac:	2301      	moveq	r3, #1
    38ae:	2300      	movne	r3, #0
    38b0:	b2db      	uxtb	r3, r3
}
    38b2:	4618      	mov	r0, r3
    38b4:	46bd      	mov	sp, r7
    38b6:	f85d 7b04 	ldr.w	r7, [sp], #4
    38ba:	4770      	bx	lr
    38bc:	40010800 	.word	0x40010800

000038c0 <USART2_handler>:

// interruption serial console
void VT_handler(){
    38c0:	b580      	push	{r7, lr}
    38c2:	af00      	add	r7, sp, #0
	if ((con.dev==SERIAL) && (VT_USART->SR&USART_SR_RXNE)){
    38c4:	4b08      	ldr	r3, [pc, #32]	; (38e8 <USART2_handler+0x28>)
    38c6:	781b      	ldrb	r3, [r3, #0]
    38c8:	2b01      	cmp	r3, #1
    38ca:	d10c      	bne.n	38e6 <USART2_handler+0x26>
    38cc:	4b07      	ldr	r3, [pc, #28]	; (38ec <USART2_handler+0x2c>)
    38ce:	681b      	ldr	r3, [r3, #0]
    38d0:	f003 0320 	and.w	r3, r3, #32
    38d4:	2b00      	cmp	r3, #0
    38d6:	d006      	beq.n	38e6 <USART2_handler+0x26>
		con.insert(VT_USART->DR);
    38d8:	4b03      	ldr	r3, [pc, #12]	; (38e8 <USART2_handler+0x28>)
    38da:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    38dc:	4a03      	ldr	r2, [pc, #12]	; (38ec <USART2_handler+0x2c>)
    38de:	6852      	ldr	r2, [r2, #4]
    38e0:	b2d2      	uxtb	r2, r2
    38e2:	4610      	mov	r0, r2
    38e4:	4798      	blx	r3
	}
}
    38e6:	bd80      	pop	{r7, pc}
    38e8:	20000100 	.word	0x20000100
    38ec:	40004400 	.word	0x40004400

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
    448c:	00003aa0 	.word	0x00003aa0
