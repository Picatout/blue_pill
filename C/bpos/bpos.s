
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 5d 15 00 00     i...m...q...]...
      20:	5d 15 00 00 5d 15 00 00 5d 15 00 00 ad 05 00 00     ]...]...].......
      30:	5d 15 00 00 5d 15 00 00 79 02 00 00 1d 07 00 00     ]...]...y.......
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 5d 15 00 00 5d 15 00 00 5d 15 00 00     ....]...]...]...
      80:	5d 15 00 00 5d 15 00 00 5d 15 00 00 5d 15 00 00     ]...]...]...]...
      90:	5d 15 00 00 5d 15 00 00 5d 15 00 00 5d 15 00 00     ]...]...]...]...
      a0:	5d 15 00 00 5d 15 00 00 5d 15 00 00 0d 17 00 00     ]...]...].......
      b0:	5d 15 00 00 5d 15 00 00 5d 15 00 00 5d 15 00 00     ]...]...]...]...
      c0:	5d 15 00 00 5d 15 00 00 5d 15 00 00 5d 15 00 00     ]...]...]...]...
      d0:	5d 15 00 00 b9 02 00 00 71 0f 00 00 c1 02 00 00     ].......q.......
      e0:	5d 15 00 00 5d 15 00 00 5d 15 00 00 5d 15 00 00     ]...]...]...]...
      f0:	5d 15 00 00 5d 15 00 00 5d 15 00 00 5d 15 00 00     ]...]...]...]...
     100:	5d 15 00 00 5d 15 00 00 5d 15 00 00 5d 15 00 00     ]...]...]...]...
     110:	5d 15 00 00 5d 15 00 00 5d 15 00 00 5d 15 00 00     ]...]...]...]...
     120:	5d 15 00 00 5d 15 00 00 5d 15 00 00 5d 15 00 00     ]...]...]...]...

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
     1b0:	f000 fe80 	bl	eb4 <main>
}
     1b4:	3718      	adds	r7, #24
     1b6:	46bd      	mov	sp, r7
     1b8:	bd80      	pop	{r7, pc}
     1ba:	bf00      	nop
     1bc:	20000008 	.word	0x20000008
     1c0:	20000a84 	.word	0x20000a84
     1c4:	00002020 	.word	0x00002020
     1c8:	20000000 	.word	0x20000000
     1cc:	20000008 	.word	0x20000008
     1d0:	20000aa0 	.word	0x20000aa0
     1d4:	20000120 	.word	0x20000120
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
     208:	f001 f9b0 	bl	156c <print_fault>
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
     21e:	f001 f9a5 	bl	156c <print_fault>
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
     234:	f001 f99a 	bl	156c <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f001 f995 	bl	156c <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	00001f48 	.word	0x00001f48
     258:	00001f60 	.word	0x00001f60
     25c:	00001f6c 	.word	0x00001f6c
     260:	00001f7c 	.word	0x00001f7c

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f001 f97a 	bl	155c <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f001 f978 	bl	155c <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f001 f976 	bl	155c <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f001 f974 	bl	155c <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f001 f972 	bl	155c <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f001 f970 	bl	155c <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f001 f96e 	bl	155c <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f001 f96c 	bl	155c <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f001 f96a 	bl	155c <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f001 f968 	bl	155c <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f001 f966 	bl	155c <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f001 f964 	bl	155c <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f001 f962 	bl	155c <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f001 f960 	bl	155c <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f001 f95e 	bl	155c <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f001 f95c 	bl	155c <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f001 f95a 	bl	155c <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f001 f958 	bl	155c <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f001 f956 	bl	155c <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f001 f954 	bl	155c <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2b4:	f001 f952 	bl	155c <reset_mcu>

000002b8 <USART1_handler>:
_default_handler(USART1_handler) // 37
     2b8:	f001 f950 	bl	155c <reset_mcu>
_default_handler(USART2_handler) // 38
     2bc:	f001 f94e 	bl	155c <reset_mcu>

000002c0 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2c0:	f001 f94c 	bl	155c <reset_mcu>

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
     4f4:	2000000c 	.word	0x2000000c

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
     50c:	2000000c 	.word	0x2000000c

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
     5d0:	2b10      	cmp	r3, #16
     5d2:	f200 809d 	bhi.w	710 <SVC_handler+0x164>
     5d6:	a201      	add	r2, pc, #4	; (adr r2, 5dc <SVC_handler+0x30>)
     5d8:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     5dc:	0000070b 	.word	0x0000070b
     5e0:	00000621 	.word	0x00000621
     5e4:	00000627 	.word	0x00000627
     5e8:	0000062d 	.word	0x0000062d
     5ec:	00000639 	.word	0x00000639
     5f0:	00000645 	.word	0x00000645
     5f4:	00000653 	.word	0x00000653
     5f8:	0000065f 	.word	0x0000065f
     5fc:	00000673 	.word	0x00000673
     600:	0000067b 	.word	0x0000067b
     604:	00000689 	.word	0x00000689
     608:	00000695 	.word	0x00000695
     60c:	000006a9 	.word	0x000006a9
     610:	000006bd 	.word	0x000006bd
     614:	000006cf 	.word	0x000006cf
     618:	000006e3 	.word	0x000006e3
     61c:	000006f7 	.word	0x000006f7
	case SVC_LED_ON: 
		led_on();
     620:	f7ff ff44 	bl	4ac <led_on>
		break;
     624:	e074      	b.n	710 <SVC_handler+0x164>
	case SVC_LED_OFF:
		led_off();
     626:	f7ff ff4d 	bl	4c4 <led_off>
		break;
     62a:	e071      	b.n	710 <SVC_handler+0x164>
	case SVC_TIMER:
		set_timer(*(unsigned*)arg1);
     62c:	68bb      	ldr	r3, [r7, #8]
     62e:	681b      	ldr	r3, [r3, #0]
     630:	4618      	mov	r0, r3
     632:	f7ff ff53 	bl	4dc <set_timer>
		break;
     636:	e06b      	b.n	710 <SVC_handler+0x164>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=get_timer();
     638:	f7ff ff5e 	bl	4f8 <get_timer>
     63c:	4602      	mov	r2, r0
     63e:	68bb      	ldr	r3, [r7, #8]
     640:	601a      	str	r2, [r3, #0]
		break;
     642:	e065      	b.n	710 <SVC_handler+0x164>
	case SVC_CONIN:
		*(char *)arg1=conin();
     644:	f000 fcce 	bl	fe4 <conin>
     648:	4603      	mov	r3, r0
     64a:	461a      	mov	r2, r3
     64c:	68bb      	ldr	r3, [r7, #8]
     64e:	701a      	strb	r2, [r3, #0]
		break;
     650:	e05e      	b.n	710 <SVC_handler+0x164>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     652:	68bb      	ldr	r3, [r7, #8]
     654:	781b      	ldrb	r3, [r3, #0]
     656:	4618      	mov	r0, r3
     658:	f000 fcb4 	bl	fc4 <conout>
		break;
     65c:	e058      	b.n	710 <SVC_handler+0x164>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     65e:	68bb      	ldr	r3, [r7, #8]
     660:	681b      	ldr	r3, [r3, #0]
     662:	6878      	ldr	r0, [r7, #4]
     664:	4619      	mov	r1, r3
     666:	f000 fd35 	bl	10d4 <read_line>
     66a:	4602      	mov	r2, r0
     66c:	68bb      	ldr	r3, [r7, #8]
     66e:	601a      	str	r2, [r3, #0]
		break;
     670:	e04e      	b.n	710 <SVC_handler+0x164>
	case SVC_PRINT:
		print((const char*)arg1);
     672:	68b8      	ldr	r0, [r7, #8]
     674:	f000 fcd8 	bl	1028 <print>
		break;
     678:	e04a      	b.n	710 <SVC_handler+0x164>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     67a:	68bb      	ldr	r3, [r7, #8]
     67c:	681b      	ldr	r3, [r3, #0]
     67e:	4618      	mov	r0, r3
     680:	210a      	movs	r1, #10
     682:	f000 fdd1 	bl	1228 <print_int>
		break;
     686:	e043      	b.n	710 <SVC_handler+0x164>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     688:	68bb      	ldr	r3, [r7, #8]
     68a:	681b      	ldr	r3, [r3, #0]
     68c:	4618      	mov	r0, r3
     68e:	f000 fe39 	bl	1304 <print_hex>
		break;
     692:	e03d      	b.n	710 <SVC_handler+0x164>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     694:	68bb      	ldr	r3, [r7, #8]
     696:	681b      	ldr	r3, [r3, #0]
     698:	4618      	mov	r0, r3
     69a:	f7ff ff39 	bl	510 <peek8>
     69e:	4603      	mov	r3, r0
     6a0:	461a      	mov	r2, r3
     6a2:	68bb      	ldr	r3, [r7, #8]
     6a4:	701a      	strb	r2, [r3, #0]
		break;
     6a6:	e033      	b.n	710 <SVC_handler+0x164>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     6a8:	68bb      	ldr	r3, [r7, #8]
     6aa:	681b      	ldr	r3, [r3, #0]
     6ac:	4618      	mov	r0, r3
     6ae:	f7ff ff3b 	bl	528 <peek16>
     6b2:	4603      	mov	r3, r0
     6b4:	461a      	mov	r2, r3
     6b6:	68bb      	ldr	r3, [r7, #8]
     6b8:	801a      	strh	r2, [r3, #0]
		break;
     6ba:	e029      	b.n	710 <SVC_handler+0x164>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     6bc:	68bb      	ldr	r3, [r7, #8]
     6be:	681b      	ldr	r3, [r3, #0]
     6c0:	4618      	mov	r0, r3
     6c2:	f7ff ff3d 	bl	540 <peek32>
     6c6:	4602      	mov	r2, r0
     6c8:	68bb      	ldr	r3, [r7, #8]
     6ca:	601a      	str	r2, [r3, #0]
		break;
     6cc:	e020      	b.n	710 <SVC_handler+0x164>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
     6ce:	68bb      	ldr	r3, [r7, #8]
     6d0:	681b      	ldr	r3, [r3, #0]
     6d2:	461a      	mov	r2, r3
     6d4:	687b      	ldr	r3, [r7, #4]
     6d6:	781b      	ldrb	r3, [r3, #0]
     6d8:	4610      	mov	r0, r2
     6da:	4619      	mov	r1, r3
     6dc:	f7ff ff3c 	bl	558 <poke8>
		break;
     6e0:	e016      	b.n	710 <SVC_handler+0x164>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
     6e2:	68bb      	ldr	r3, [r7, #8]
     6e4:	681b      	ldr	r3, [r3, #0]
     6e6:	461a      	mov	r2, r3
     6e8:	687b      	ldr	r3, [r7, #4]
     6ea:	881b      	ldrh	r3, [r3, #0]
     6ec:	4610      	mov	r0, r2
     6ee:	4619      	mov	r1, r3
     6f0:	f7ff ff40 	bl	574 <poke16>
		break;
     6f4:	e00c      	b.n	710 <SVC_handler+0x164>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
     6f6:	68bb      	ldr	r3, [r7, #8]
     6f8:	681b      	ldr	r3, [r3, #0]
     6fa:	461a      	mov	r2, r3
     6fc:	687b      	ldr	r3, [r7, #4]
     6fe:	681b      	ldr	r3, [r3, #0]
     700:	4610      	mov	r0, r2
     702:	4619      	mov	r1, r3
     704:	f7ff ff44 	bl	590 <poke32>
		break;
     708:	e002      	b.n	710 <SVC_handler+0x164>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     70a:	f000 ff27 	bl	155c <reset_mcu>
	    break;
     70e:	bf00      	nop
	}	
}
     710:	3710      	adds	r7, #16
     712:	46bd      	mov	sp, r7
     714:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     718:	4685      	mov	sp, r0
     71a:	4770      	bx	lr

0000071c <STK_handler>:

// interruption coretimer
void __attribute__((naked)) STK_handler(){
	ticks++;
     71c:	4b06      	ldr	r3, [pc, #24]	; (738 <STK_handler+0x1c>)
     71e:	681b      	ldr	r3, [r3, #0]
     720:	3301      	adds	r3, #1
     722:	4a05      	ldr	r2, [pc, #20]	; (738 <STK_handler+0x1c>)
     724:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
     726:	4b05      	ldr	r3, [pc, #20]	; (73c <STK_handler+0x20>)
     728:	681b      	ldr	r3, [r3, #0]
     72a:	2b00      	cmp	r3, #0
     72c:	d004      	beq.n	738 <STK_handler+0x1c>
     72e:	4b03      	ldr	r3, [pc, #12]	; (73c <STK_handler+0x20>)
     730:	681b      	ldr	r3, [r3, #0]
     732:	3b01      	subs	r3, #1
     734:	4a01      	ldr	r2, [pc, #4]	; (73c <STK_handler+0x20>)
     736:	6013      	str	r3, [r2, #0]
     738:	20000008 	.word	0x20000008
     73c:	2000000c 	.word	0x2000000c

00000740 <set_sysclock>:
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     740:	b480      	push	{r7}
     742:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC_CR->fld.hseon=1;
     744:	4b1f      	ldr	r3, [pc, #124]	; (7c4 <set_sysclock+0x84>)
     746:	681a      	ldr	r2, [r3, #0]
     748:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
     74c:	601a      	str	r2, [r3, #0]
	 // attend que l'oscillateur soit prêt
   while (!RCC_CR->fld.hserdy);
     74e:	bf00      	nop
     750:	4b1c      	ldr	r3, [pc, #112]	; (7c4 <set_sysclock+0x84>)
     752:	681b      	ldr	r3, [r3, #0]
     754:	0c5b      	lsrs	r3, r3, #17
     756:	f003 0301 	and.w	r3, r3, #1
     75a:	b2db      	uxtb	r3, r3
     75c:	2b00      	cmp	r3, #0
     75e:	d0f7      	beq.n	750 <set_sysclock+0x10>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR->cfgr|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
     760:	4a19      	ldr	r2, [pc, #100]	; (7c8 <set_sysclock+0x88>)
     762:	4b19      	ldr	r3, [pc, #100]	; (7c8 <set_sysclock+0x88>)
     764:	681b      	ldr	r3, [r3, #0]
     766:	f443 13e8 	orr.w	r3, r3, #1900544	; 0x1d0000
     76a:	6013      	str	r3, [r2, #0]
    // active le PLL
    RCC_CR->fld.pllon=1;
     76c:	4b15      	ldr	r3, [pc, #84]	; (7c4 <set_sysclock+0x84>)
     76e:	681a      	ldr	r2, [r3, #0]
     770:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
     774:	601a      	str	r2, [r3, #0]
    // Attend que le PLL soit prêt
    while (!RCC_CR->fld.pllrdy);
     776:	bf00      	nop
     778:	4b12      	ldr	r3, [pc, #72]	; (7c4 <set_sysclock+0x84>)
     77a:	681b      	ldr	r3, [r3, #0]
     77c:	0e5b      	lsrs	r3, r3, #25
     77e:	f003 0301 	and.w	r3, r3, #1
     782:	b2db      	uxtb	r3, r3
     784:	2b00      	cmp	r3, #0
     786:	d0f7      	beq.n	778 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR->fld.latency=WAIT_2_CY;
     788:	4b10      	ldr	r3, [pc, #64]	; (7cc <set_sysclock+0x8c>)
     78a:	681a      	ldr	r2, [r3, #0]
     78c:	f022 0207 	bic.w	r2, r2, #7
     790:	f042 0202 	orr.w	r2, r2, #2
     794:	601a      	str	r2, [r3, #0]
    // active le prefetch buffer
    FLASH_ACR->fld.prftbe=1;
     796:	4b0d      	ldr	r3, [pc, #52]	; (7cc <set_sysclock+0x8c>)
     798:	681a      	ldr	r2, [r3, #0]
     79a:	f042 0210 	orr.w	r2, r2, #16
     79e:	601a      	str	r2, [r3, #0]
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR->fld.sw=PLL_CLK;
     7a0:	4b09      	ldr	r3, [pc, #36]	; (7c8 <set_sysclock+0x88>)
     7a2:	681a      	ldr	r2, [r3, #0]
     7a4:	f022 0203 	bic.w	r2, r2, #3
     7a8:	f042 0202 	orr.w	r2, r2, #2
     7ac:	601a      	str	r2, [r3, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR->fld.ppre1=PPRECLK_DIV2;
     7ae:	4b06      	ldr	r3, [pc, #24]	; (7c8 <set_sysclock+0x88>)
     7b0:	681a      	ldr	r2, [r3, #0]
     7b2:	f422 62e0 	bic.w	r2, r2, #1792	; 0x700
     7b6:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
     7ba:	601a      	str	r2, [r3, #0]
}
     7bc:	46bd      	mov	sp, r7
     7be:	f85d 7b04 	ldr.w	r7, [sp], #4
     7c2:	4770      	bx	lr
     7c4:	40021000 	.word	0x40021000
     7c8:	40021004 	.word	0x40021004
     7cc:	40022000 	.word	0x40022000

000007d0 <config_systicks>:

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
     7d0:	b480      	push	{r7}
     7d2:	af00      	add	r7, sp, #0
	*SYST_RVR=MSEC_DLY-1;
     7d4:	4b05      	ldr	r3, [pc, #20]	; (7ec <config_systicks+0x1c>)
     7d6:	f242 3227 	movw	r2, #8999	; 0x2327
     7da:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
     7dc:	4b04      	ldr	r3, [pc, #16]	; (7f0 <config_systicks+0x20>)
     7de:	2203      	movs	r2, #3
     7e0:	601a      	str	r2, [r3, #0]
}
     7e2:	46bd      	mov	sp, r7
     7e4:	f85d 7b04 	ldr.w	r7, [sp], #4
     7e8:	4770      	bx	lr
     7ea:	bf00      	nop
     7ec:	e000e014 	.word	0xe000e014
     7f0:	e000e010 	.word	0xe000e010

000007f4 <port_c_setup>:

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
     7f4:	b480      	push	{r7}
     7f6:	af00      	add	r7, sp, #0
	APB2ENR->fld.iopcen=1;
     7f8:	4a05      	ldr	r2, [pc, #20]	; (810 <port_c_setup+0x1c>)
     7fa:	7813      	ldrb	r3, [r2, #0]
     7fc:	f043 0310 	orr.w	r3, r3, #16
     800:	7013      	strb	r3, [r2, #0]
	GPIOC_CRH->cr=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
     802:	4b04      	ldr	r3, [pc, #16]	; (814 <port_c_setup+0x20>)
     804:	4a04      	ldr	r2, [pc, #16]	; (818 <port_c_setup+0x24>)
     806:	601a      	str	r2, [r3, #0]
}
     808:	46bd      	mov	sp, r7
     80a:	f85d 7b04 	ldr.w	r7, [sp], #4
     80e:	4770      	bx	lr
     810:	40021018 	.word	0x40021018
     814:	40011004 	.word	0x40011004
     818:	44644444 	.word	0x44644444

0000081c <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     81c:	b480      	push	{r7}
     81e:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     820:	2300      	movs	r3, #0
     822:	2200      	movs	r2, #0
     824:	4618      	mov	r0, r3
     826:	4611      	mov	r1, r2
     828:	df00      	svc	0
}
     82a:	46bd      	mov	sp, r7
     82c:	f85d 7b04 	ldr.w	r7, [sp], #4
     830:	4770      	bx	lr
     832:	bf00      	nop

00000834 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     834:	b480      	push	{r7}
     836:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     838:	2300      	movs	r3, #0
     83a:	2200      	movs	r2, #0
     83c:	4618      	mov	r0, r3
     83e:	4611      	mov	r1, r2
     840:	df01      	svc	1
}
     842:	46bd      	mov	sp, r7
     844:	f85d 7b04 	ldr.w	r7, [sp], #4
     848:	4770      	bx	lr
     84a:	bf00      	nop

0000084c <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     84c:	b480      	push	{r7}
     84e:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     850:	2300      	movs	r3, #0
     852:	2200      	movs	r2, #0
     854:	4618      	mov	r0, r3
     856:	4611      	mov	r1, r2
     858:	df02      	svc	2
}
     85a:	46bd      	mov	sp, r7
     85c:	f85d 7b04 	ldr.w	r7, [sp], #4
     860:	4770      	bx	lr
     862:	bf00      	nop

00000864 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     864:	b580      	push	{r7, lr}
     866:	b082      	sub	sp, #8
     868:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     86a:	f000 fa8d 	bl	d88 <word>
	n=atoi((const char*)pad);
     86e:	4806      	ldr	r0, [pc, #24]	; (888 <cmd_set_timer+0x24>)
     870:	f7ff fda6 	bl	3c0 <atoi>
     874:	4603      	mov	r3, r0
     876:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     878:	1d3b      	adds	r3, r7, #4
     87a:	2200      	movs	r2, #0
     87c:	4618      	mov	r0, r3
     87e:	4611      	mov	r1, r2
     880:	df03      	svc	3
}
     882:	3708      	adds	r7, #8
     884:	46bd      	mov	sp, r7
     886:	bd80      	pop	{r7, pc}
     888:	20000060 	.word	0x20000060

0000088c <cmd_get_timer>:

static void cmd_get_timer(){
     88c:	b480      	push	{r7}
     88e:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     890:	4b04      	ldr	r3, [pc, #16]	; (8a4 <cmd_get_timer+0x18>)
     892:	2200      	movs	r2, #0
     894:	4618      	mov	r0, r3
     896:	4611      	mov	r1, r2
     898:	df04      	svc	4
}
     89a:	46bd      	mov	sp, r7
     89c:	f85d 7b04 	ldr.w	r7, [sp], #4
     8a0:	4770      	bx	lr
     8a2:	bf00      	nop
     8a4:	20000060 	.word	0x20000060

000008a8 <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     8a8:	b480      	push	{r7}
     8aa:	b083      	sub	sp, #12
     8ac:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     8ae:	1d3b      	adds	r3, r7, #4
     8b0:	2200      	movs	r2, #0
     8b2:	4618      	mov	r0, r3
     8b4:	4611      	mov	r1, r2
     8b6:	df04      	svc	4
     8b8:	687b      	ldr	r3, [r7, #4]
     8ba:	2b00      	cmp	r3, #0
     8bc:	d1f7      	bne.n	8ae <cmd_pause+0x6>
}
     8be:	370c      	adds	r7, #12
     8c0:	46bd      	mov	sp, r7
     8c2:	f85d 7b04 	ldr.w	r7, [sp], #4
     8c6:	4770      	bx	lr

000008c8 <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     8c8:	b480      	push	{r7}
     8ca:	b083      	sub	sp, #12
     8cc:	af00      	add	r7, sp, #0
	volatile char n=0;
     8ce:	2300      	movs	r3, #0
     8d0:	71fb      	strb	r3, [r7, #7]
	while (!n){
     8d2:	e004      	b.n	8de <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     8d4:	1dfb      	adds	r3, r7, #7
     8d6:	2200      	movs	r2, #0
     8d8:	4618      	mov	r0, r3
     8da:	4611      	mov	r1, r2
     8dc:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     8de:	79fb      	ldrb	r3, [r7, #7]
     8e0:	b2db      	uxtb	r3, r3
     8e2:	2b00      	cmp	r3, #0
     8e4:	d0f6      	beq.n	8d4 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     8e6:	79fb      	ldrb	r3, [r7, #7]
     8e8:	b2da      	uxtb	r2, r3
     8ea:	4b05      	ldr	r3, [pc, #20]	; (900 <cmd_getc+0x38>)
     8ec:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     8ee:	4b04      	ldr	r3, [pc, #16]	; (900 <cmd_getc+0x38>)
     8f0:	2200      	movs	r2, #0
     8f2:	705a      	strb	r2, [r3, #1]
}
     8f4:	370c      	adds	r7, #12
     8f6:	46bd      	mov	sp, r7
     8f8:	f85d 7b04 	ldr.w	r7, [sp], #4
     8fc:	4770      	bx	lr
     8fe:	bf00      	nop
     900:	20000060 	.word	0x20000060

00000904 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     904:	b580      	push	{r7, lr}
     906:	b082      	sub	sp, #8
     908:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     90a:	f000 fa3d 	bl	d88 <word>
	cmd_id=search_command((const char*)pad);
     90e:	480a      	ldr	r0, [pc, #40]	; (938 <cmd_putc+0x34>)
     910:	f000 f924 	bl	b5c <search_command>
     914:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     916:	687b      	ldr	r3, [r7, #4]
     918:	2b00      	cmp	r3, #0
     91a:	db05      	blt.n	928 <cmd_putc+0x24>
     91c:	4a07      	ldr	r2, [pc, #28]	; (93c <cmd_putc+0x38>)
     91e:	687b      	ldr	r3, [r7, #4]
     920:	00db      	lsls	r3, r3, #3
     922:	4413      	add	r3, r2
     924:	685b      	ldr	r3, [r3, #4]
     926:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     928:	4b03      	ldr	r3, [pc, #12]	; (938 <cmd_putc+0x34>)
     92a:	2200      	movs	r2, #0
     92c:	4618      	mov	r0, r3
     92e:	4611      	mov	r1, r2
     930:	df06      	svc	6
}
     932:	3708      	adds	r7, #8
     934:	46bd      	mov	sp, r7
     936:	bd80      	pop	{r7, pc}
     938:	20000060 	.word	0x20000060
     93c:	00001b6c 	.word	0x00001b6c

00000940 <cmd_readln>:

static void cmd_readln(){
     940:	b580      	push	{r7, lr}
     942:	b082      	sub	sp, #8
     944:	af00      	add	r7, sp, #0
	unsigned llen=80;
     946:	2350      	movs	r3, #80	; 0x50
     948:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     94a:	1d3b      	adds	r3, r7, #4
     94c:	4a04      	ldr	r2, [pc, #16]	; (960 <cmd_readln+0x20>)
     94e:	4618      	mov	r0, r3
     950:	4611      	mov	r1, r2
     952:	df07      	svc	7
	print((const char*)pad);
     954:	4802      	ldr	r0, [pc, #8]	; (960 <cmd_readln+0x20>)
     956:	f000 fb67 	bl	1028 <print>
}
     95a:	3708      	adds	r7, #8
     95c:	46bd      	mov	sp, r7
     95e:	bd80      	pop	{r7, pc}
     960:	20000060 	.word	0x20000060

00000964 <cmd_print>:

static void cmd_print(){
     964:	b580      	push	{r7, lr}
     966:	af00      	add	r7, sp, #0
	word();
     968:	f000 fa0e 	bl	d88 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     96c:	4b02      	ldr	r3, [pc, #8]	; (978 <cmd_print+0x14>)
     96e:	2200      	movs	r2, #0
     970:	4618      	mov	r0, r3
     972:	4611      	mov	r1, r2
     974:	df08      	svc	8
}
     976:	bd80      	pop	{r7, pc}
     978:	20000060 	.word	0x20000060

0000097c <cmd_print_int>:

static void cmd_print_int(){
     97c:	b580      	push	{r7, lr}
     97e:	b082      	sub	sp, #8
     980:	af00      	add	r7, sp, #0
	int cmd_id;
    unsigned u32;
    
	word();
     982:	f000 fa01 	bl	d88 <word>
	cmd_id=search_command((const char*)pad);
     986:	480e      	ldr	r0, [pc, #56]	; (9c0 <cmd_print_int+0x44>)
     988:	f000 f8e8 	bl	b5c <search_command>
     98c:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     98e:	687b      	ldr	r3, [r7, #4]
     990:	2b00      	cmp	r3, #0
     992:	db06      	blt.n	9a2 <cmd_print_int+0x26>
		 commands[cmd_id].fn();
     994:	4a0b      	ldr	r2, [pc, #44]	; (9c4 <cmd_print_int+0x48>)
     996:	687b      	ldr	r3, [r7, #4]
     998:	00db      	lsls	r3, r3, #3
     99a:	4413      	add	r3, r2
     99c:	685b      	ldr	r3, [r3, #4]
     99e:	4798      	blx	r3
     9a0:	e006      	b.n	9b0 <cmd_print_int+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     9a2:	4807      	ldr	r0, [pc, #28]	; (9c0 <cmd_print_int+0x44>)
     9a4:	f7ff fd0c 	bl	3c0 <atoi>
     9a8:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     9aa:	4a05      	ldr	r2, [pc, #20]	; (9c0 <cmd_print_int+0x44>)
     9ac:	687b      	ldr	r3, [r7, #4]
     9ae:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_INT,pad,NUL);
     9b0:	4b03      	ldr	r3, [pc, #12]	; (9c0 <cmd_print_int+0x44>)
     9b2:	2200      	movs	r2, #0
     9b4:	4618      	mov	r0, r3
     9b6:	4611      	mov	r1, r2
     9b8:	df09      	svc	9
}
     9ba:	3708      	adds	r7, #8
     9bc:	46bd      	mov	sp, r7
     9be:	bd80      	pop	{r7, pc}
     9c0:	20000060 	.word	0x20000060
     9c4:	00001b6c 	.word	0x00001b6c

000009c8 <cmd_print_hex>:

static void cmd_print_hex(){
     9c8:	b580      	push	{r7, lr}
     9ca:	b082      	sub	sp, #8
     9cc:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     9ce:	f000 f9db 	bl	d88 <word>
	cmd_id=search_command((const char*)pad);
     9d2:	480e      	ldr	r0, [pc, #56]	; (a0c <cmd_print_hex+0x44>)
     9d4:	f000 f8c2 	bl	b5c <search_command>
     9d8:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     9da:	687b      	ldr	r3, [r7, #4]
     9dc:	2b00      	cmp	r3, #0
     9de:	db06      	blt.n	9ee <cmd_print_hex+0x26>
		 commands[cmd_id].fn();
     9e0:	4a0b      	ldr	r2, [pc, #44]	; (a10 <cmd_print_hex+0x48>)
     9e2:	687b      	ldr	r3, [r7, #4]
     9e4:	00db      	lsls	r3, r3, #3
     9e6:	4413      	add	r3, r2
     9e8:	685b      	ldr	r3, [r3, #4]
     9ea:	4798      	blx	r3
     9ec:	e006      	b.n	9fc <cmd_print_hex+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     9ee:	4807      	ldr	r0, [pc, #28]	; (a0c <cmd_print_hex+0x44>)
     9f0:	f7ff fce6 	bl	3c0 <atoi>
     9f4:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     9f6:	4a05      	ldr	r2, [pc, #20]	; (a0c <cmd_print_hex+0x44>)
     9f8:	687b      	ldr	r3, [r7, #4]
     9fa:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_HEX,pad,NUL);
     9fc:	4b03      	ldr	r3, [pc, #12]	; (a0c <cmd_print_hex+0x44>)
     9fe:	2200      	movs	r2, #0
     a00:	4618      	mov	r0, r3
     a02:	4611      	mov	r1, r2
     a04:	df0a      	svc	10
}
     a06:	3708      	adds	r7, #8
     a08:	46bd      	mov	sp, r7
     a0a:	bd80      	pop	{r7, pc}
     a0c:	20000060 	.word	0x20000060
     a10:	00001b6c 	.word	0x00001b6c

00000a14 <cmd_run>:

static void cmd_run(){
     a14:	b580      	push	{r7, lr}
     a16:	af00      	add	r7, sp, #0
	((fn)proga)();
     a18:	4b01      	ldr	r3, [pc, #4]	; (a20 <cmd_run+0xc>)
     a1a:	681b      	ldr	r3, [r3, #0]
     a1c:	4798      	blx	r3
	
}
     a1e:	bd80      	pop	{r7, pc}
     a20:	20000120 	.word	0x20000120

00000a24 <cmd_peek8>:

static void cmd_peek8(){
     a24:	b580      	push	{r7, lr}
     a26:	b082      	sub	sp, #8
     a28:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     a2a:	f000 f9ad 	bl	d88 <word>
	u=atoi((const char*)pad);
     a2e:	4808      	ldr	r0, [pc, #32]	; (a50 <cmd_peek8+0x2c>)
     a30:	f7ff fcc6 	bl	3c0 <atoi>
     a34:	4603      	mov	r3, r0
     a36:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     a38:	1d3b      	adds	r3, r7, #4
     a3a:	2200      	movs	r2, #0
     a3c:	4618      	mov	r0, r3
     a3e:	4611      	mov	r1, r2
     a40:	df0b      	svc	11
	*(uint32_t*)pad=u&0xff;
     a42:	4a03      	ldr	r2, [pc, #12]	; (a50 <cmd_peek8+0x2c>)
     a44:	687b      	ldr	r3, [r7, #4]
     a46:	b2db      	uxtb	r3, r3
     a48:	6013      	str	r3, [r2, #0]
}
     a4a:	3708      	adds	r7, #8
     a4c:	46bd      	mov	sp, r7
     a4e:	bd80      	pop	{r7, pc}
     a50:	20000060 	.word	0x20000060

00000a54 <cmd_peek16>:

static void cmd_peek16(){
     a54:	b580      	push	{r7, lr}
     a56:	b082      	sub	sp, #8
     a58:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     a5a:	f000 f995 	bl	d88 <word>
	u=atoi((const char*)pad);
     a5e:	4808      	ldr	r0, [pc, #32]	; (a80 <cmd_peek16+0x2c>)
     a60:	f7ff fcae 	bl	3c0 <atoi>
     a64:	4603      	mov	r3, r0
     a66:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     a68:	1d3b      	adds	r3, r7, #4
     a6a:	2200      	movs	r2, #0
     a6c:	4618      	mov	r0, r3
     a6e:	4611      	mov	r1, r2
     a70:	df0c      	svc	12
	*(uint32_t*)pad=u&0xffff;
     a72:	4a03      	ldr	r2, [pc, #12]	; (a80 <cmd_peek16+0x2c>)
     a74:	687b      	ldr	r3, [r7, #4]
     a76:	b29b      	uxth	r3, r3
     a78:	6013      	str	r3, [r2, #0]
}
     a7a:	3708      	adds	r7, #8
     a7c:	46bd      	mov	sp, r7
     a7e:	bd80      	pop	{r7, pc}
     a80:	20000060 	.word	0x20000060

00000a84 <cmd_peek32>:

static void cmd_peek32(){
     a84:	b580      	push	{r7, lr}
     a86:	b082      	sub	sp, #8
     a88:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     a8a:	f000 f97d 	bl	d88 <word>
	u=atoi((const char*)pad);
     a8e:	4808      	ldr	r0, [pc, #32]	; (ab0 <cmd_peek32+0x2c>)
     a90:	f7ff fc96 	bl	3c0 <atoi>
     a94:	4603      	mov	r3, r0
     a96:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK32,&u,NUL);
     a98:	1d3b      	adds	r3, r7, #4
     a9a:	2200      	movs	r2, #0
     a9c:	4618      	mov	r0, r3
     a9e:	4611      	mov	r1, r2
     aa0:	df0d      	svc	13
	*(uint32_t*)pad=u;
     aa2:	4a03      	ldr	r2, [pc, #12]	; (ab0 <cmd_peek32+0x2c>)
     aa4:	687b      	ldr	r3, [r7, #4]
     aa6:	6013      	str	r3, [r2, #0]
}
     aa8:	3708      	adds	r7, #8
     aaa:	46bd      	mov	sp, r7
     aac:	bd80      	pop	{r7, pc}
     aae:	bf00      	nop
     ab0:	20000060 	.word	0x20000060

00000ab4 <cmd_poke8>:

static void cmd_poke8(){
     ab4:	b580      	push	{r7, lr}
     ab6:	b082      	sub	sp, #8
     ab8:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     aba:	f000 f965 	bl	d88 <word>
	adr=atoi((const char*)pad);
     abe:	480a      	ldr	r0, [pc, #40]	; (ae8 <cmd_poke8+0x34>)
     ac0:	f7ff fc7e 	bl	3c0 <atoi>
     ac4:	4603      	mov	r3, r0
     ac6:	607b      	str	r3, [r7, #4]
	word();
     ac8:	f000 f95e 	bl	d88 <word>
	u8=atoi((const char*)pad);
     acc:	4806      	ldr	r0, [pc, #24]	; (ae8 <cmd_poke8+0x34>)
     ace:	f7ff fc77 	bl	3c0 <atoi>
     ad2:	4603      	mov	r3, r0
     ad4:	b2db      	uxtb	r3, r3
     ad6:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     ad8:	1d3b      	adds	r3, r7, #4
     ada:	1cfa      	adds	r2, r7, #3
     adc:	4618      	mov	r0, r3
     ade:	4611      	mov	r1, r2
     ae0:	df0e      	svc	14
}
     ae2:	3708      	adds	r7, #8
     ae4:	46bd      	mov	sp, r7
     ae6:	bd80      	pop	{r7, pc}
     ae8:	20000060 	.word	0x20000060

00000aec <cmd_poke16>:

static void cmd_poke16(){
     aec:	b580      	push	{r7, lr}
     aee:	b082      	sub	sp, #8
     af0:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     af2:	f000 f949 	bl	d88 <word>
	adr=atoi((const char*)pad);
     af6:	480a      	ldr	r0, [pc, #40]	; (b20 <cmd_poke16+0x34>)
     af8:	f7ff fc62 	bl	3c0 <atoi>
     afc:	4603      	mov	r3, r0
     afe:	607b      	str	r3, [r7, #4]
	word();
     b00:	f000 f942 	bl	d88 <word>
	u16=atoi((const char*)pad);
     b04:	4806      	ldr	r0, [pc, #24]	; (b20 <cmd_poke16+0x34>)
     b06:	f7ff fc5b 	bl	3c0 <atoi>
     b0a:	4603      	mov	r3, r0
     b0c:	b29b      	uxth	r3, r3
     b0e:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     b10:	1d3b      	adds	r3, r7, #4
     b12:	1cba      	adds	r2, r7, #2
     b14:	4618      	mov	r0, r3
     b16:	4611      	mov	r1, r2
     b18:	df0f      	svc	15
}
     b1a:	3708      	adds	r7, #8
     b1c:	46bd      	mov	sp, r7
     b1e:	bd80      	pop	{r7, pc}
     b20:	20000060 	.word	0x20000060

00000b24 <cmd_poke32>:

static void cmd_poke32(){
     b24:	b580      	push	{r7, lr}
     b26:	b082      	sub	sp, #8
     b28:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     b2a:	f000 f92d 	bl	d88 <word>
	adr=atoi((const char*)pad);
     b2e:	480a      	ldr	r0, [pc, #40]	; (b58 <cmd_poke32+0x34>)
     b30:	f7ff fc46 	bl	3c0 <atoi>
     b34:	4603      	mov	r3, r0
     b36:	607b      	str	r3, [r7, #4]
	word();
     b38:	f000 f926 	bl	d88 <word>
	u32=atoi((const char*)pad);
     b3c:	4806      	ldr	r0, [pc, #24]	; (b58 <cmd_poke32+0x34>)
     b3e:	f7ff fc3f 	bl	3c0 <atoi>
     b42:	4603      	mov	r3, r0
     b44:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     b46:	1d3b      	adds	r3, r7, #4
     b48:	463a      	mov	r2, r7
     b4a:	4618      	mov	r0, r3
     b4c:	4611      	mov	r1, r2
     b4e:	df10      	svc	16
}
     b50:	3708      	adds	r7, #8
     b52:	46bd      	mov	sp, r7
     b54:	bd80      	pop	{r7, pc}
     b56:	bf00      	nop
     b58:	20000060 	.word	0x20000060

00000b5c <search_command>:
	{"poke32",cmd_poke32}, 
	{NUL,NUL}
};


int search_command(const char * name){
     b5c:	b580      	push	{r7, lr}
     b5e:	b084      	sub	sp, #16
     b60:	af00      	add	r7, sp, #0
     b62:	6078      	str	r0, [r7, #4]
	int i=0;
     b64:	2300      	movs	r3, #0
     b66:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     b68:	e00e      	b.n	b88 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     b6a:	4a12      	ldr	r2, [pc, #72]	; (bb4 <search_command+0x58>)
     b6c:	68fb      	ldr	r3, [r7, #12]
     b6e:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     b72:	4618      	mov	r0, r3
     b74:	6879      	ldr	r1, [r7, #4]
     b76:	f7ff fba5 	bl	2c4 <strcmp>
     b7a:	4603      	mov	r3, r0
     b7c:	2b00      	cmp	r3, #0
     b7e:	d100      	bne.n	b82 <search_command+0x26>
			break;
     b80:	e009      	b.n	b96 <search_command+0x3a>
		}
		i++;
     b82:	68fb      	ldr	r3, [r7, #12]
     b84:	3301      	adds	r3, #1
     b86:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     b88:	4a0a      	ldr	r2, [pc, #40]	; (bb4 <search_command+0x58>)
     b8a:	68fb      	ldr	r3, [r7, #12]
     b8c:	00db      	lsls	r3, r3, #3
     b8e:	4413      	add	r3, r2
     b90:	685b      	ldr	r3, [r3, #4]
     b92:	2b00      	cmp	r3, #0
     b94:	d1e9      	bne.n	b6a <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     b96:	4a07      	ldr	r2, [pc, #28]	; (bb4 <search_command+0x58>)
     b98:	68fb      	ldr	r3, [r7, #12]
     b9a:	00db      	lsls	r3, r3, #3
     b9c:	4413      	add	r3, r2
     b9e:	685b      	ldr	r3, [r3, #4]
     ba0:	2b00      	cmp	r3, #0
     ba2:	d102      	bne.n	baa <search_command+0x4e>
     ba4:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     ba8:	60fb      	str	r3, [r7, #12]
	return i;
     baa:	68fb      	ldr	r3, [r7, #12]
}
     bac:	4618      	mov	r0, r3
     bae:	3710      	adds	r7, #16
     bb0:	46bd      	mov	sp, r7
     bb2:	bd80      	pop	{r7, pc}
     bb4:	00001b6c 	.word	0x00001b6c

00000bb8 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     bb8:	b480      	push	{r7}
     bba:	b085      	sub	sp, #20
     bbc:	af00      	add	r7, sp, #0
     bbe:	60f8      	str	r0, [r7, #12]
     bc0:	60b9      	str	r1, [r7, #8]
     bc2:	4613      	mov	r3, r2
     bc4:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     bc6:	e002      	b.n	bce <skip+0x16>
     bc8:	68bb      	ldr	r3, [r7, #8]
     bca:	3301      	adds	r3, #1
     bcc:	60bb      	str	r3, [r7, #8]
     bce:	68bb      	ldr	r3, [r7, #8]
     bd0:	68fa      	ldr	r2, [r7, #12]
     bd2:	4413      	add	r3, r2
     bd4:	781b      	ldrb	r3, [r3, #0]
     bd6:	2b00      	cmp	r3, #0
     bd8:	d006      	beq.n	be8 <skip+0x30>
     bda:	68bb      	ldr	r3, [r7, #8]
     bdc:	68fa      	ldr	r2, [r7, #12]
     bde:	4413      	add	r3, r2
     be0:	781b      	ldrb	r3, [r3, #0]
     be2:	79fa      	ldrb	r2, [r7, #7]
     be4:	429a      	cmp	r2, r3
     be6:	d0ef      	beq.n	bc8 <skip+0x10>
	return start;
     be8:	68bb      	ldr	r3, [r7, #8]
}
     bea:	4618      	mov	r0, r3
     bec:	3714      	adds	r7, #20
     bee:	46bd      	mov	sp, r7
     bf0:	f85d 7b04 	ldr.w	r7, [sp], #4
     bf4:	4770      	bx	lr
     bf6:	bf00      	nop

00000bf8 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     bf8:	b480      	push	{r7}
     bfa:	b085      	sub	sp, #20
     bfc:	af00      	add	r7, sp, #0
     bfe:	60f8      	str	r0, [r7, #12]
     c00:	60b9      	str	r1, [r7, #8]
     c02:	4613      	mov	r3, r2
     c04:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     c06:	e002      	b.n	c0e <scan+0x16>
     c08:	68bb      	ldr	r3, [r7, #8]
     c0a:	3301      	adds	r3, #1
     c0c:	60bb      	str	r3, [r7, #8]
     c0e:	68bb      	ldr	r3, [r7, #8]
     c10:	68fa      	ldr	r2, [r7, #12]
     c12:	4413      	add	r3, r2
     c14:	781b      	ldrb	r3, [r3, #0]
     c16:	2b00      	cmp	r3, #0
     c18:	d006      	beq.n	c28 <scan+0x30>
     c1a:	68bb      	ldr	r3, [r7, #8]
     c1c:	68fa      	ldr	r2, [r7, #12]
     c1e:	4413      	add	r3, r2
     c20:	781b      	ldrb	r3, [r3, #0]
     c22:	79fa      	ldrb	r2, [r7, #7]
     c24:	429a      	cmp	r2, r3
     c26:	d1ef      	bne.n	c08 <scan+0x10>
	return start;
     c28:	68bb      	ldr	r3, [r7, #8]
}
     c2a:	4618      	mov	r0, r3
     c2c:	3714      	adds	r7, #20
     c2e:	46bd      	mov	sp, r7
     c30:	f85d 7b04 	ldr.w	r7, [sp], #4
     c34:	4770      	bx	lr
     c36:	bf00      	nop

00000c38 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     c38:	b480      	push	{r7}
     c3a:	b087      	sub	sp, #28
     c3c:	af00      	add	r7, sp, #0
     c3e:	6078      	str	r0, [r7, #4]
     c40:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     c42:	2300      	movs	r3, #0
     c44:	617b      	str	r3, [r7, #20]
     c46:	683b      	ldr	r3, [r7, #0]
     c48:	613b      	str	r3, [r7, #16]
     c4a:	2300      	movs	r3, #0
     c4c:	60fb      	str	r3, [r7, #12]
     c4e:	2301      	movs	r3, #1
     c50:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     c52:	e040      	b.n	cd6 <quote+0x9e>
		switch (buffer[end]){
     c54:	693b      	ldr	r3, [r7, #16]
     c56:	687a      	ldr	r2, [r7, #4]
     c58:	4413      	add	r3, r2
     c5a:	781b      	ldrb	r3, [r3, #0]
     c5c:	2b5c      	cmp	r3, #92	; 0x5c
     c5e:	d012      	beq.n	c86 <quote+0x4e>
     c60:	2b6e      	cmp	r3, #110	; 0x6e
     c62:	d022      	beq.n	caa <quote+0x72>
     c64:	2b22      	cmp	r3, #34	; 0x22
     c66:	d128      	bne.n	cba <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     c68:	697b      	ldr	r3, [r7, #20]
     c6a:	2b00      	cmp	r3, #0
     c6c:	d102      	bne.n	c74 <quote+0x3c>
     c6e:	2300      	movs	r3, #0
     c70:	60bb      	str	r3, [r7, #8]
			break;
     c72:	e02d      	b.n	cd0 <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     c74:	68fb      	ldr	r3, [r7, #12]
     c76:	1c5a      	adds	r2, r3, #1
     c78:	60fa      	str	r2, [r7, #12]
     c7a:	4a21      	ldr	r2, [pc, #132]	; (d00 <quote+0xc8>)
     c7c:	2122      	movs	r1, #34	; 0x22
     c7e:	54d1      	strb	r1, [r2, r3]
     c80:	2300      	movs	r3, #0
     c82:	617b      	str	r3, [r7, #20]
			break;
     c84:	e024      	b.n	cd0 <quote+0x98>
		case '\\':
			if (!escaped){
     c86:	697b      	ldr	r3, [r7, #20]
     c88:	2b00      	cmp	r3, #0
     c8a:	d102      	bne.n	c92 <quote+0x5a>
				escaped=1;
     c8c:	2301      	movs	r3, #1
     c8e:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     c90:	e01e      	b.n	cd0 <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     c92:	2300      	movs	r3, #0
     c94:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     c96:	68fb      	ldr	r3, [r7, #12]
     c98:	1c5a      	adds	r2, r3, #1
     c9a:	60fa      	str	r2, [r7, #12]
     c9c:	693a      	ldr	r2, [r7, #16]
     c9e:	6879      	ldr	r1, [r7, #4]
     ca0:	440a      	add	r2, r1
     ca2:	7811      	ldrb	r1, [r2, #0]
     ca4:	4a16      	ldr	r2, [pc, #88]	; (d00 <quote+0xc8>)
     ca6:	54d1      	strb	r1, [r2, r3]
			}
			break;
     ca8:	e012      	b.n	cd0 <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     caa:	697b      	ldr	r3, [r7, #20]
     cac:	2b00      	cmp	r3, #0
     cae:	d004      	beq.n	cba <quote+0x82>
     cb0:	693b      	ldr	r3, [r7, #16]
     cb2:	687a      	ldr	r2, [r7, #4]
     cb4:	4413      	add	r3, r2
     cb6:	220d      	movs	r2, #13
     cb8:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     cba:	2300      	movs	r3, #0
     cbc:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     cbe:	68fb      	ldr	r3, [r7, #12]
     cc0:	1c5a      	adds	r2, r3, #1
     cc2:	60fa      	str	r2, [r7, #12]
     cc4:	693a      	ldr	r2, [r7, #16]
     cc6:	6879      	ldr	r1, [r7, #4]
     cc8:	440a      	add	r2, r1
     cca:	7811      	ldrb	r1, [r2, #0]
     ccc:	4a0c      	ldr	r2, [pc, #48]	; (d00 <quote+0xc8>)
     cce:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     cd0:	693b      	ldr	r3, [r7, #16]
     cd2:	3301      	adds	r3, #1
     cd4:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     cd6:	693b      	ldr	r3, [r7, #16]
     cd8:	687a      	ldr	r2, [r7, #4]
     cda:	4413      	add	r3, r2
     cdc:	781b      	ldrb	r3, [r3, #0]
     cde:	2b00      	cmp	r3, #0
     ce0:	d002      	beq.n	ce8 <quote+0xb0>
     ce2:	68bb      	ldr	r3, [r7, #8]
     ce4:	2b00      	cmp	r3, #0
     ce6:	d1b5      	bne.n	c54 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     ce8:	4a05      	ldr	r2, [pc, #20]	; (d00 <quote+0xc8>)
     cea:	68fb      	ldr	r3, [r7, #12]
     cec:	4413      	add	r3, r2
     cee:	2200      	movs	r2, #0
     cf0:	701a      	strb	r2, [r3, #0]
	return end;
     cf2:	693b      	ldr	r3, [r7, #16]
}
     cf4:	4618      	mov	r0, r3
     cf6:	371c      	adds	r7, #28
     cf8:	46bd      	mov	sp, r7
     cfa:	f85d 7b04 	ldr.w	r7, [sp], #4
     cfe:	4770      	bx	lr
     d00:	20000060 	.word	0x20000060

00000d04 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     d04:	b480      	push	{r7}
     d06:	b087      	sub	sp, #28
     d08:	af00      	add	r7, sp, #0
     d0a:	60f8      	str	r0, [r7, #12]
     d0c:	60b9      	str	r1, [r7, #8]
     d0e:	4613      	mov	r3, r2
     d10:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     d12:	68bb      	ldr	r3, [r7, #8]
     d14:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     d16:	e002      	b.n	d1e <next+0x1a>
     d18:	697b      	ldr	r3, [r7, #20]
     d1a:	3301      	adds	r3, #1
     d1c:	617b      	str	r3, [r7, #20]
     d1e:	697b      	ldr	r3, [r7, #20]
     d20:	68fa      	ldr	r2, [r7, #12]
     d22:	4413      	add	r3, r2
     d24:	781b      	ldrb	r3, [r3, #0]
     d26:	2b00      	cmp	r3, #0
     d28:	d006      	beq.n	d38 <next+0x34>
     d2a:	697b      	ldr	r3, [r7, #20]
     d2c:	68fa      	ldr	r2, [r7, #12]
     d2e:	4413      	add	r3, r2
     d30:	781b      	ldrb	r3, [r3, #0]
     d32:	79fa      	ldrb	r2, [r7, #7]
     d34:	429a      	cmp	r2, r3
     d36:	d1ef      	bne.n	d18 <next+0x14>
	return end-start;
     d38:	697a      	ldr	r2, [r7, #20]
     d3a:	68bb      	ldr	r3, [r7, #8]
     d3c:	1ad3      	subs	r3, r2, r3
}
     d3e:	4618      	mov	r0, r3
     d40:	371c      	adds	r7, #28
     d42:	46bd      	mov	sp, r7
     d44:	f85d 7b04 	ldr.w	r7, [sp], #4
     d48:	4770      	bx	lr
     d4a:	bf00      	nop

00000d4c <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     d4c:	b480      	push	{r7}
     d4e:	b085      	sub	sp, #20
     d50:	af00      	add	r7, sp, #0
     d52:	60f8      	str	r0, [r7, #12]
     d54:	60b9      	str	r1, [r7, #8]
     d56:	607a      	str	r2, [r7, #4]
	while (len){
     d58:	e00a      	b.n	d70 <move+0x24>
		*dest++=*src++;
     d5a:	68bb      	ldr	r3, [r7, #8]
     d5c:	1c5a      	adds	r2, r3, #1
     d5e:	60ba      	str	r2, [r7, #8]
     d60:	68fa      	ldr	r2, [r7, #12]
     d62:	1c51      	adds	r1, r2, #1
     d64:	60f9      	str	r1, [r7, #12]
     d66:	7812      	ldrb	r2, [r2, #0]
     d68:	701a      	strb	r2, [r3, #0]
		len--;
     d6a:	687b      	ldr	r3, [r7, #4]
     d6c:	3b01      	subs	r3, #1
     d6e:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     d70:	687b      	ldr	r3, [r7, #4]
     d72:	2b00      	cmp	r3, #0
     d74:	d1f1      	bne.n	d5a <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     d76:	68bb      	ldr	r3, [r7, #8]
     d78:	2200      	movs	r2, #0
     d7a:	701a      	strb	r2, [r3, #0]
}
     d7c:	3714      	adds	r7, #20
     d7e:	46bd      	mov	sp, r7
     d80:	f85d 7b04 	ldr.w	r7, [sp], #4
     d84:	4770      	bx	lr
     d86:	bf00      	nop

00000d88 <word>:

// extrait le prochain mot du tib
static void word(){
     d88:	b580      	push	{r7, lr}
     d8a:	b082      	sub	sp, #8
     d8c:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     d8e:	4b1d      	ldr	r3, [pc, #116]	; (e04 <word+0x7c>)
     d90:	681b      	ldr	r3, [r3, #0]
     d92:	481d      	ldr	r0, [pc, #116]	; (e08 <word+0x80>)
     d94:	4619      	mov	r1, r3
     d96:	2220      	movs	r2, #32
     d98:	f7ff ff0e 	bl	bb8 <skip>
     d9c:	4603      	mov	r3, r0
     d9e:	461a      	mov	r2, r3
     da0:	4b18      	ldr	r3, [pc, #96]	; (e04 <word+0x7c>)
     da2:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     da4:	4b17      	ldr	r3, [pc, #92]	; (e04 <word+0x7c>)
     da6:	681b      	ldr	r3, [r3, #0]
     da8:	4a17      	ldr	r2, [pc, #92]	; (e08 <word+0x80>)
     daa:	5cd3      	ldrb	r3, [r2, r3]
     dac:	2b22      	cmp	r3, #34	; 0x22
     dae:	d10f      	bne.n	dd0 <word+0x48>
			in++;
     db0:	4b14      	ldr	r3, [pc, #80]	; (e04 <word+0x7c>)
     db2:	681b      	ldr	r3, [r3, #0]
     db4:	3301      	adds	r3, #1
     db6:	4a13      	ldr	r2, [pc, #76]	; (e04 <word+0x7c>)
     db8:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     dba:	4b12      	ldr	r3, [pc, #72]	; (e04 <word+0x7c>)
     dbc:	681b      	ldr	r3, [r3, #0]
     dbe:	4812      	ldr	r0, [pc, #72]	; (e08 <word+0x80>)
     dc0:	4619      	mov	r1, r3
     dc2:	f7ff ff39 	bl	c38 <quote>
     dc6:	4603      	mov	r3, r0
     dc8:	461a      	mov	r2, r3
     dca:	4b0e      	ldr	r3, [pc, #56]	; (e04 <word+0x7c>)
     dcc:	601a      	str	r2, [r3, #0]
     dce:	e016      	b.n	dfe <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     dd0:	4b0c      	ldr	r3, [pc, #48]	; (e04 <word+0x7c>)
     dd2:	681b      	ldr	r3, [r3, #0]
     dd4:	480c      	ldr	r0, [pc, #48]	; (e08 <word+0x80>)
     dd6:	4619      	mov	r1, r3
     dd8:	2220      	movs	r2, #32
     dda:	f7ff ff93 	bl	d04 <next>
     dde:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     de0:	4b08      	ldr	r3, [pc, #32]	; (e04 <word+0x7c>)
     de2:	681b      	ldr	r3, [r3, #0]
     de4:	4a08      	ldr	r2, [pc, #32]	; (e08 <word+0x80>)
     de6:	4413      	add	r3, r2
     de8:	4618      	mov	r0, r3
     dea:	4908      	ldr	r1, [pc, #32]	; (e0c <word+0x84>)
     dec:	687a      	ldr	r2, [r7, #4]
     dee:	f7ff ffad 	bl	d4c <move>
			in+=len;
     df2:	4b04      	ldr	r3, [pc, #16]	; (e04 <word+0x7c>)
     df4:	681a      	ldr	r2, [r3, #0]
     df6:	687b      	ldr	r3, [r7, #4]
     df8:	4413      	add	r3, r2
     dfa:	4a02      	ldr	r2, [pc, #8]	; (e04 <word+0x7c>)
     dfc:	6013      	str	r3, [r2, #0]
		}
}
     dfe:	3708      	adds	r7, #8
     e00:	46bd      	mov	sp, r7
     e02:	bd80      	pop	{r7, pc}
     e04:	200000b0 	.word	0x200000b0
     e08:	20000010 	.word	0x20000010
     e0c:	20000060 	.word	0x20000060

00000e10 <parse_line>:

static void parse_line(unsigned llen){
     e10:	b580      	push	{r7, lr}
     e12:	b084      	sub	sp, #16
     e14:	af00      	add	r7, sp, #0
     e16:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     e18:	4b12      	ldr	r3, [pc, #72]	; (e64 <parse_line+0x54>)
     e1a:	2200      	movs	r2, #0
     e1c:	601a      	str	r2, [r3, #0]
	while (in<llen){
     e1e:	e016      	b.n	e4e <parse_line+0x3e>
		word();
     e20:	f7ff ffb2 	bl	d88 <word>
		cmd_id=search_command((const char*) pad);
     e24:	4810      	ldr	r0, [pc, #64]	; (e68 <parse_line+0x58>)
     e26:	f7ff fe99 	bl	b5c <search_command>
     e2a:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     e2c:	68fb      	ldr	r3, [r7, #12]
     e2e:	2b00      	cmp	r3, #0
     e30:	db06      	blt.n	e40 <parse_line+0x30>
			commands[cmd_id].fn();
     e32:	4a0e      	ldr	r2, [pc, #56]	; (e6c <parse_line+0x5c>)
     e34:	68fb      	ldr	r3, [r7, #12]
     e36:	00db      	lsls	r3, r3, #3
     e38:	4413      	add	r3, r2
     e3a:	685b      	ldr	r3, [r3, #4]
     e3c:	4798      	blx	r3
     e3e:	e006      	b.n	e4e <parse_line+0x3e>
		}else{
			print((const char*)pad); conout('?');
     e40:	4809      	ldr	r0, [pc, #36]	; (e68 <parse_line+0x58>)
     e42:	f000 f8f1 	bl	1028 <print>
     e46:	203f      	movs	r0, #63	; 0x3f
     e48:	f000 f8bc 	bl	fc4 <conout>
			break;
     e4c:	e004      	b.n	e58 <parse_line+0x48>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     e4e:	4b05      	ldr	r3, [pc, #20]	; (e64 <parse_line+0x54>)
     e50:	681a      	ldr	r2, [r3, #0]
     e52:	687b      	ldr	r3, [r7, #4]
     e54:	429a      	cmp	r2, r3
     e56:	d3e3      	bcc.n	e20 <parse_line+0x10>
		}else{
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     e58:	200d      	movs	r0, #13
     e5a:	f000 f8b3 	bl	fc4 <conout>
}
     e5e:	3710      	adds	r7, #16
     e60:	46bd      	mov	sp, r7
     e62:	bd80      	pop	{r7, pc}
     e64:	200000b0 	.word	0x200000b0
     e68:	20000060 	.word	0x20000060
     e6c:	00001b6c 	.word	0x00001b6c

00000e70 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     e70:	b480      	push	{r7}
     e72:	b085      	sub	sp, #20
     e74:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     e76:	4b0c      	ldr	r3, [pc, #48]	; (ea8 <copy_blink_in_ram+0x38>)
     e78:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     e7a:	4b0c      	ldr	r3, [pc, #48]	; (eac <copy_blink_in_ram+0x3c>)
     e7c:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     e7e:	4b0c      	ldr	r3, [pc, #48]	; (eb0 <copy_blink_in_ram+0x40>)
     e80:	60bb      	str	r3, [r7, #8]
	while (start<end){
     e82:	e007      	b.n	e94 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     e84:	68bb      	ldr	r3, [r7, #8]
     e86:	1d1a      	adds	r2, r3, #4
     e88:	60ba      	str	r2, [r7, #8]
     e8a:	68fa      	ldr	r2, [r7, #12]
     e8c:	1d11      	adds	r1, r2, #4
     e8e:	60f9      	str	r1, [r7, #12]
     e90:	6812      	ldr	r2, [r2, #0]
     e92:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     e94:	68fa      	ldr	r2, [r7, #12]
     e96:	687b      	ldr	r3, [r7, #4]
     e98:	429a      	cmp	r2, r3
     e9a:	d3f3      	bcc.n	e84 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     e9c:	3714      	adds	r7, #20
     e9e:	46bd      	mov	sp, r7
     ea0:	f85d 7b04 	ldr.w	r7, [sp], #4
     ea4:	4770      	bx	lr
     ea6:	bf00      	nop
     ea8:	00001fa0 	.word	0x00001fa0
     eac:	00002020 	.word	0x00002020
     eb0:	20000aa0 	.word	0x20000aa0

00000eb4 <main>:

extern void print_fault(const char *msg, sfrp_t adr);

void main(void){
     eb4:	b580      	push	{r7, lr}
     eb6:	b082      	sub	sp, #8
     eb8:	af00      	add	r7, sp, #0
	set_sysclock();
     eba:	f7ff fc41 	bl	740 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     ebe:	f06f 000a 	mvn.w	r0, #10
     ec2:	210f      	movs	r1, #15
     ec4:	f000 fb1a 	bl	14fc <set_int_priority>
	config_systicks();
     ec8:	f7ff fc82 	bl	7d0 <config_systicks>
	//port_c_setup();
	APB2ENR->fld.iopcen=1;
     ecc:	4a22      	ldr	r2, [pc, #136]	; (f58 <main+0xa4>)
     ece:	7813      	ldrb	r3, [r2, #0]
     ed0:	f043 0310 	orr.w	r3, r3, #16
     ed4:	7013      	strb	r3, [r2, #0]
	APB2ENR->fld.iopaen=1;
     ed6:	4a20      	ldr	r2, [pc, #128]	; (f58 <main+0xa4>)
     ed8:	7813      	ldrb	r3, [r2, #0]
     eda:	f043 0304 	orr.w	r3, r3, #4
     ede:	7013      	strb	r3, [r2, #0]
	APB2ENR->fld.iopben=1;
     ee0:	4a1d      	ldr	r2, [pc, #116]	; (f58 <main+0xa4>)
     ee2:	7813      	ldrb	r3, [r2, #0]
     ee4:	f043 0308 	orr.w	r3, r3, #8
     ee8:	7013      	strb	r3, [r2, #0]
	APB2ENR->fld.afioen=1;
     eea:	4a1b      	ldr	r2, [pc, #108]	; (f58 <main+0xa4>)
     eec:	7813      	ldrb	r3, [r2, #0]
     eee:	f043 0301 	orr.w	r3, r3, #1
     ef2:	7013      	strb	r3, [r2, #0]
	config_pin(GPIOC,LED_PIN,OUTPUT_OD_SLOW);
     ef4:	2002      	movs	r0, #2
     ef6:	210d      	movs	r1, #13
     ef8:	2206      	movs	r2, #6
     efa:	f000 fa73 	bl	13e4 <config_pin>
	tvout_init();
     efe:	f000 fb7d 	bl	15fc <tvout_init>
	uart_open_channel(CON,115200,FLOW_HARD);
     f02:	4816      	ldr	r0, [pc, #88]	; (f5c <main+0xa8>)
     f04:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     f08:	2201      	movs	r2, #1
     f0a:	f000 fcff 	bl	190c <uart_open_channel>
	cls();
     f0e:	f000 f8bb 	bl	1088 <cls>
	print(VERSION); 
     f12:	4b13      	ldr	r3, [pc, #76]	; (f60 <main+0xac>)
     f14:	681b      	ldr	r3, [r3, #0]
     f16:	4618      	mov	r0, r3
     f18:	f000 f886 	bl	1028 <print>
	copy_blink_in_ram();
     f1c:	f7ff ffa8 	bl	e70 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
     f20:	4810      	ldr	r0, [pc, #64]	; (f64 <main+0xb0>)
     f22:	f000 f881 	bl	1028 <print>
     f26:	4b10      	ldr	r3, [pc, #64]	; (f68 <main+0xb4>)
     f28:	2200      	movs	r2, #0
     f2a:	4618      	mov	r0, r3
     f2c:	4611      	mov	r1, r2
     f2e:	df0a      	svc	10
     f30:	200d      	movs	r0, #13
     f32:	f000 f847 	bl	fc4 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     f36:	2300      	movs	r3, #0
     f38:	2200      	movs	r2, #0
     f3a:	4618      	mov	r0, r3
     f3c:	4611      	mov	r1, r2
     f3e:	df01      	svc	1
	flush_rx_queue();
     f40:	f000 fa42 	bl	13c8 <flush_rx_queue>
	unsigned llen;// char c;
	while (1){ // if ((c=conin())) conout(c);
		llen=read_line(tib,CMD_MAX_LEN);
     f44:	4809      	ldr	r0, [pc, #36]	; (f6c <main+0xb8>)
     f46:	2150      	movs	r1, #80	; 0x50
     f48:	f000 f8c4 	bl	10d4 <read_line>
     f4c:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     f4e:	6878      	ldr	r0, [r7, #4]
     f50:	f7ff ff5e 	bl	e10 <parse_line>
	}
     f54:	e7f6      	b.n	f44 <main+0x90>
     f56:	bf00      	nop
     f58:	40021018 	.word	0x40021018
     f5c:	40004400 	.word	0x40004400
     f60:	20000000 	.word	0x20000000
     f64:	00001c04 	.word	0x00001c04
     f68:	20000120 	.word	0x20000120
     f6c:	20000010 	.word	0x20000010

00000f70 <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
     f70:	4668      	mov	r0, sp
     f72:	f020 0107 	bic.w	r1, r0, #7
     f76:	468d      	mov	sp, r1
     f78:	b481      	push	{r0, r7}
     f7a:	af00      	add	r7, sp, #0
	if (USART2_SR&(1<<USART_SR_RXNE)){
     f7c:	4b0e      	ldr	r3, [pc, #56]	; (fb8 <USART2_handler+0x48>)
     f7e:	681b      	ldr	r3, [r3, #0]
     f80:	f003 0320 	and.w	r3, r3, #32
     f84:	2b00      	cmp	r3, #0
     f86:	d012      	beq.n	fae <USART2_handler+0x3e>
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
     f88:	4b0c      	ldr	r3, [pc, #48]	; (fbc <USART2_handler+0x4c>)
     f8a:	6a1b      	ldr	r3, [r3, #32]
     f8c:	1c5a      	adds	r2, r3, #1
     f8e:	490b      	ldr	r1, [pc, #44]	; (fbc <USART2_handler+0x4c>)
     f90:	620a      	str	r2, [r1, #32]
     f92:	4a0b      	ldr	r2, [pc, #44]	; (fc0 <USART2_handler+0x50>)
     f94:	6812      	ldr	r2, [r2, #0]
     f96:	b2d2      	uxtb	r2, r2
     f98:	f002 027f 	and.w	r2, r2, #127	; 0x7f
     f9c:	b2d1      	uxtb	r1, r2
     f9e:	4a07      	ldr	r2, [pc, #28]	; (fbc <USART2_handler+0x4c>)
     fa0:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
     fa2:	4b06      	ldr	r3, [pc, #24]	; (fbc <USART2_handler+0x4c>)
     fa4:	6a1b      	ldr	r3, [r3, #32]
     fa6:	f003 031f 	and.w	r3, r3, #31
     faa:	4a04      	ldr	r2, [pc, #16]	; (fbc <USART2_handler+0x4c>)
     fac:	6213      	str	r3, [r2, #32]
	}
}
     fae:	46bd      	mov	sp, r7
     fb0:	bc81      	pop	{r0, r7}
     fb2:	4685      	mov	sp, r0
     fb4:	4770      	bx	lr
     fb6:	bf00      	nop
     fb8:	40004400 	.word	0x40004400
     fbc:	200000b4 	.word	0x200000b4
     fc0:	40004404 	.word	0x40004404

00000fc4 <conout>:


// envoie d'un caractère à la console
void conout(char c){
     fc4:	b580      	push	{r7, lr}
     fc6:	b082      	sub	sp, #8
     fc8:	af00      	add	r7, sp, #0
     fca:	4603      	mov	r3, r0
     fcc:	71fb      	strb	r3, [r7, #7]
	uart_putc(CON,c);
     fce:	79fb      	ldrb	r3, [r7, #7]
     fd0:	4803      	ldr	r0, [pc, #12]	; (fe0 <conout+0x1c>)
     fd2:	4619      	mov	r1, r3
     fd4:	f000 fd5c 	bl	1a90 <uart_putc>
}
     fd8:	3708      	adds	r7, #8
     fda:	46bd      	mov	sp, r7
     fdc:	bd80      	pop	{r7, pc}
     fde:	bf00      	nop
     fe0:	40004400 	.word	0x40004400

00000fe4 <conin>:


// réception d'un caractère de la console
char conin(){
     fe4:	b480      	push	{r7}
     fe6:	b083      	sub	sp, #12
     fe8:	af00      	add	r7, sp, #0
	char c=0;
     fea:	2300      	movs	r3, #0
     fec:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
     fee:	4b0d      	ldr	r3, [pc, #52]	; (1024 <conin+0x40>)
     ff0:	6a1a      	ldr	r2, [r3, #32]
     ff2:	4b0c      	ldr	r3, [pc, #48]	; (1024 <conin+0x40>)
     ff4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     ff6:	429a      	cmp	r2, r3
     ff8:	d00d      	beq.n	1016 <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
     ffa:	4b0a      	ldr	r3, [pc, #40]	; (1024 <conin+0x40>)
     ffc:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     ffe:	1c5a      	adds	r2, r3, #1
    1000:	4908      	ldr	r1, [pc, #32]	; (1024 <conin+0x40>)
    1002:	624a      	str	r2, [r1, #36]	; 0x24
    1004:	4a07      	ldr	r2, [pc, #28]	; (1024 <conin+0x40>)
    1006:	5cd3      	ldrb	r3, [r2, r3]
    1008:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
    100a:	4b06      	ldr	r3, [pc, #24]	; (1024 <conin+0x40>)
    100c:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    100e:	f003 031f 	and.w	r3, r3, #31
    1012:	4a04      	ldr	r2, [pc, #16]	; (1024 <conin+0x40>)
    1014:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
    1016:	79fb      	ldrb	r3, [r7, #7]
}
    1018:	4618      	mov	r0, r3
    101a:	370c      	adds	r7, #12
    101c:	46bd      	mov	sp, r7
    101e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1022:	4770      	bx	lr
    1024:	200000b4 	.word	0x200000b4

00001028 <print>:

// imprime un chaîne sur la console
void print(const char *str){
    1028:	b580      	push	{r7, lr}
    102a:	b082      	sub	sp, #8
    102c:	af00      	add	r7, sp, #0
    102e:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
    1030:	e006      	b.n	1040 <print+0x18>
    1032:	687b      	ldr	r3, [r7, #4]
    1034:	1c5a      	adds	r2, r3, #1
    1036:	607a      	str	r2, [r7, #4]
    1038:	781b      	ldrb	r3, [r3, #0]
    103a:	4618      	mov	r0, r3
    103c:	f7ff ffc2 	bl	fc4 <conout>
    1040:	687b      	ldr	r3, [r7, #4]
    1042:	781b      	ldrb	r3, [r3, #0]
    1044:	2b00      	cmp	r3, #0
    1046:	d1f4      	bne.n	1032 <print+0xa>
}
    1048:	3708      	adds	r7, #8
    104a:	46bd      	mov	sp, r7
    104c:	bd80      	pop	{r7, pc}
    104e:	bf00      	nop

00001050 <beep>:

void beep(){
    1050:	b480      	push	{r7}
    1052:	af00      	add	r7, sp, #0
}
    1054:	46bd      	mov	sp, r7
    1056:	f85d 7b04 	ldr.w	r7, [sp], #4
    105a:	4770      	bx	lr

0000105c <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    105c:	b580      	push	{r7, lr}
    105e:	af00      	add	r7, sp, #0
	conout(BS);
    1060:	2008      	movs	r0, #8
    1062:	f7ff ffaf 	bl	fc4 <conout>
	conout(SPACE);
    1066:	2020      	movs	r0, #32
    1068:	f7ff ffac 	bl	fc4 <conout>
	conout(BS);
    106c:	2008      	movs	r0, #8
    106e:	f7ff ffa9 	bl	fc4 <conout>
}
    1072:	bd80      	pop	{r7, pc}

00001074 <esc_seq>:

void esc_seq(){
    1074:	b580      	push	{r7, lr}
    1076:	af00      	add	r7, sp, #0
	conout(ESC);
    1078:	201b      	movs	r0, #27
    107a:	f7ff ffa3 	bl	fc4 <conout>
	conout('[');
    107e:	205b      	movs	r0, #91	; 0x5b
    1080:	f7ff ffa0 	bl	fc4 <conout>
}
    1084:	bd80      	pop	{r7, pc}
    1086:	bf00      	nop

00001088 <cls>:

// vide l'écran de la console
void cls(){
    1088:	b580      	push	{r7, lr}
    108a:	af00      	add	r7, sp, #0
	esc_seq();
    108c:	f7ff fff2 	bl	1074 <esc_seq>
	conout('2');
    1090:	2032      	movs	r0, #50	; 0x32
    1092:	f7ff ff97 	bl	fc4 <conout>
	conout('J');
    1096:	204a      	movs	r0, #74	; 0x4a
    1098:	f7ff ff94 	bl	fc4 <conout>
}
    109c:	bd80      	pop	{r7, pc}
    109e:	bf00      	nop

000010a0 <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
    10a0:	b580      	push	{r7, lr}
    10a2:	b082      	sub	sp, #8
    10a4:	af00      	add	r7, sp, #0
    10a6:	6078      	str	r0, [r7, #4]
	esc_seq();
    10a8:	f7ff ffe4 	bl	1074 <esc_seq>
	conout('2');
    10ac:	2032      	movs	r0, #50	; 0x32
    10ae:	f7ff ff89 	bl	fc4 <conout>
	conout('K');
    10b2:	204b      	movs	r0, #75	; 0x4b
    10b4:	f7ff ff86 	bl	fc4 <conout>
	while (n){conout(BS);n--;}
    10b8:	e005      	b.n	10c6 <clear_line+0x26>
    10ba:	2008      	movs	r0, #8
    10bc:	f7ff ff82 	bl	fc4 <conout>
    10c0:	687b      	ldr	r3, [r7, #4]
    10c2:	3b01      	subs	r3, #1
    10c4:	607b      	str	r3, [r7, #4]
    10c6:	687b      	ldr	r3, [r7, #4]
    10c8:	2b00      	cmp	r3, #0
    10ca:	d1f6      	bne.n	10ba <clear_line+0x1a>
}
    10cc:	3708      	adds	r7, #8
    10ce:	46bd      	mov	sp, r7
    10d0:	bd80      	pop	{r7, pc}
    10d2:	bf00      	nop

000010d4 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    10d4:	b580      	push	{r7, lr}
    10d6:	b084      	sub	sp, #16
    10d8:	af00      	add	r7, sp, #0
    10da:	6078      	str	r0, [r7, #4]
    10dc:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    10de:	2300      	movs	r3, #0
    10e0:	60fb      	str	r3, [r7, #12]
	char c=0;
    10e2:	2300      	movs	r3, #0
    10e4:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    10e6:	683b      	ldr	r3, [r7, #0]
    10e8:	3b01      	subs	r3, #1
    10ea:	603b      	str	r3, [r7, #0]
	while (c!=13){
    10ec:	e08e      	b.n	120c <read_line+0x138>
			c=conin();
    10ee:	f7ff ff79 	bl	fe4 <conin>
    10f2:	4603      	mov	r3, r0
    10f4:	72fb      	strb	r3, [r7, #11]
			switch(c){
    10f6:	7afb      	ldrb	r3, [r7, #11]
    10f8:	2b18      	cmp	r3, #24
    10fa:	d872      	bhi.n	11e2 <read_line+0x10e>
    10fc:	a201      	add	r2, pc, #4	; (adr r2, 1104 <read_line+0x30>)
    10fe:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1102:	bf00      	nop
    1104:	0000120d 	.word	0x0000120d
    1108:	000011e3 	.word	0x000011e3
    110c:	000011e3 	.word	0x000011e3
    1110:	000011e3 	.word	0x000011e3
    1114:	000011e3 	.word	0x000011e3
    1118:	000011d5 	.word	0x000011d5
    111c:	000011e3 	.word	0x000011e3
    1120:	000011e3 	.word	0x000011e3
    1124:	000011c3 	.word	0x000011c3
    1128:	000011df 	.word	0x000011df
    112c:	00001169 	.word	0x00001169
    1130:	000011e3 	.word	0x000011e3
    1134:	000011e3 	.word	0x000011e3
    1138:	00001169 	.word	0x00001169
    113c:	000011e3 	.word	0x000011e3
    1140:	000011e3 	.word	0x000011e3
    1144:	000011e3 	.word	0x000011e3
    1148:	000011e3 	.word	0x000011e3
    114c:	000011e3 	.word	0x000011e3
    1150:	000011e3 	.word	0x000011e3
    1154:	000011e3 	.word	0x000011e3
    1158:	00001177 	.word	0x00001177
    115c:	000011e3 	.word	0x000011e3
    1160:	0000118d 	.word	0x0000118d
    1164:	00001177 	.word	0x00001177
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    1168:	230d      	movs	r3, #13
    116a:	72fb      	strb	r3, [r7, #11]
				conout(c);
    116c:	7afb      	ldrb	r3, [r7, #11]
    116e:	4618      	mov	r0, r3
    1170:	f7ff ff28 	bl	fc4 <conout>
				break;
    1174:	e04a      	b.n	120c <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
    1176:	68f8      	ldr	r0, [r7, #12]
    1178:	f7ff ff92 	bl	10a0 <clear_line>
				line_len=0;
    117c:	2300      	movs	r3, #0
    117e:	60fb      	str	r3, [r7, #12]
				break;
    1180:	e044      	b.n	120c <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    1182:	f7ff ff6b 	bl	105c <delete_back>
					line_len--;
    1186:	68fb      	ldr	r3, [r7, #12]
    1188:	3b01      	subs	r3, #1
    118a:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    118c:	68fb      	ldr	r3, [r7, #12]
    118e:	2b00      	cmp	r3, #0
    1190:	d006      	beq.n	11a0 <read_line+0xcc>
    1192:	68fb      	ldr	r3, [r7, #12]
    1194:	3b01      	subs	r3, #1
    1196:	687a      	ldr	r2, [r7, #4]
    1198:	4413      	add	r3, r2
    119a:	781b      	ldrb	r3, [r3, #0]
    119c:	2b20      	cmp	r3, #32
    119e:	d0f0      	beq.n	1182 <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    11a0:	e004      	b.n	11ac <read_line+0xd8>
					delete_back();
    11a2:	f7ff ff5b 	bl	105c <delete_back>
					line_len--;
    11a6:	68fb      	ldr	r3, [r7, #12]
    11a8:	3b01      	subs	r3, #1
    11aa:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    11ac:	68fb      	ldr	r3, [r7, #12]
    11ae:	2b00      	cmp	r3, #0
    11b0:	d006      	beq.n	11c0 <read_line+0xec>
    11b2:	68fb      	ldr	r3, [r7, #12]
    11b4:	3b01      	subs	r3, #1
    11b6:	687a      	ldr	r2, [r7, #4]
    11b8:	4413      	add	r3, r2
    11ba:	781b      	ldrb	r3, [r3, #0]
    11bc:	2b20      	cmp	r3, #32
    11be:	d1f0      	bne.n	11a2 <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    11c0:	e024      	b.n	120c <read_line+0x138>
				case BS:
				if (line_len){
    11c2:	68fb      	ldr	r3, [r7, #12]
    11c4:	2b00      	cmp	r3, #0
    11c6:	d004      	beq.n	11d2 <read_line+0xfe>
					delete_back();
    11c8:	f7ff ff48 	bl	105c <delete_back>
					line_len--;
    11cc:	68fb      	ldr	r3, [r7, #12]
    11ce:	3b01      	subs	r3, #1
    11d0:	60fb      	str	r3, [r7, #12]
				}
				break;
    11d2:	e01b      	b.n	120c <read_line+0x138>
				case CTRL_E:
				cls();
    11d4:	f7ff ff58 	bl	1088 <cls>
				line_len=0;
    11d8:	2300      	movs	r3, #0
    11da:	60fb      	str	r3, [r7, #12]
				break;
    11dc:	e016      	b.n	120c <read_line+0x138>
				case TAB:
				c=SPACE;
    11de:	2320      	movs	r3, #32
    11e0:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    11e2:	68fa      	ldr	r2, [r7, #12]
    11e4:	683b      	ldr	r3, [r7, #0]
    11e6:	429a      	cmp	r2, r3
    11e8:	d20e      	bcs.n	1208 <read_line+0x134>
    11ea:	7afb      	ldrb	r3, [r7, #11]
    11ec:	2b1f      	cmp	r3, #31
    11ee:	d90b      	bls.n	1208 <read_line+0x134>
					buffer[line_len++]=c;
    11f0:	68fb      	ldr	r3, [r7, #12]
    11f2:	1c5a      	adds	r2, r3, #1
    11f4:	60fa      	str	r2, [r7, #12]
    11f6:	687a      	ldr	r2, [r7, #4]
    11f8:	4413      	add	r3, r2
    11fa:	7afa      	ldrb	r2, [r7, #11]
    11fc:	701a      	strb	r2, [r3, #0]
					conout(c);
    11fe:	7afb      	ldrb	r3, [r7, #11]
    1200:	4618      	mov	r0, r3
    1202:	f7ff fedf 	bl	fc4 <conout>
    1206:	e001      	b.n	120c <read_line+0x138>
				}else{
					beep();
    1208:	f7ff ff22 	bl	1050 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    120c:	7afb      	ldrb	r3, [r7, #11]
    120e:	2b0d      	cmp	r3, #13
    1210:	f47f af6d 	bne.w	10ee <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1214:	687a      	ldr	r2, [r7, #4]
    1216:	68fb      	ldr	r3, [r7, #12]
    1218:	4413      	add	r3, r2
    121a:	2200      	movs	r2, #0
    121c:	701a      	strb	r2, [r3, #0]
	return line_len;
    121e:	68fb      	ldr	r3, [r7, #12]
}
    1220:	4618      	mov	r0, r3
    1222:	3710      	adds	r7, #16
    1224:	46bd      	mov	sp, r7
    1226:	bd80      	pop	{r7, pc}

00001228 <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    1228:	b580      	push	{r7, lr}
    122a:	b08e      	sub	sp, #56	; 0x38
    122c:	af00      	add	r7, sp, #0
    122e:	6078      	str	r0, [r7, #4]
    1230:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    1232:	2301      	movs	r3, #1
    1234:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    1236:	2322      	movs	r3, #34	; 0x22
    1238:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    123a:	2300      	movs	r3, #0
    123c:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1240:	687b      	ldr	r3, [r7, #4]
    1242:	2b00      	cmp	r3, #0
    1244:	da05      	bge.n	1252 <print_int+0x2a>
    1246:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    124a:	637b      	str	r3, [r7, #52]	; 0x34
    124c:	687b      	ldr	r3, [r7, #4]
    124e:	425b      	negs	r3, r3
    1250:	607b      	str	r3, [r7, #4]
	while (i){
    1252:	e02c      	b.n	12ae <print_int+0x86>
		fmt[pos]=i%base+'0';
    1254:	687b      	ldr	r3, [r7, #4]
    1256:	683a      	ldr	r2, [r7, #0]
    1258:	fbb3 f2f2 	udiv	r2, r3, r2
    125c:	6839      	ldr	r1, [r7, #0]
    125e:	fb01 f202 	mul.w	r2, r1, r2
    1262:	1a9b      	subs	r3, r3, r2
    1264:	b2db      	uxtb	r3, r3
    1266:	3330      	adds	r3, #48	; 0x30
    1268:	b2d9      	uxtb	r1, r3
    126a:	f107 020c 	add.w	r2, r7, #12
    126e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1270:	4413      	add	r3, r2
    1272:	460a      	mov	r2, r1
    1274:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    1276:	f107 020c 	add.w	r2, r7, #12
    127a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    127c:	4413      	add	r3, r2
    127e:	781b      	ldrb	r3, [r3, #0]
    1280:	2b39      	cmp	r3, #57	; 0x39
    1282:	d90c      	bls.n	129e <print_int+0x76>
    1284:	f107 020c 	add.w	r2, r7, #12
    1288:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    128a:	4413      	add	r3, r2
    128c:	781b      	ldrb	r3, [r3, #0]
    128e:	3307      	adds	r3, #7
    1290:	b2d9      	uxtb	r1, r3
    1292:	f107 020c 	add.w	r2, r7, #12
    1296:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1298:	4413      	add	r3, r2
    129a:	460a      	mov	r2, r1
    129c:	701a      	strb	r2, [r3, #0]
		pos--;
    129e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    12a0:	3b01      	subs	r3, #1
    12a2:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    12a4:	687a      	ldr	r2, [r7, #4]
    12a6:	683b      	ldr	r3, [r7, #0]
    12a8:	fbb2 f3f3 	udiv	r3, r2, r3
    12ac:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    12ae:	687b      	ldr	r3, [r7, #4]
    12b0:	2b00      	cmp	r3, #0
    12b2:	d1cf      	bne.n	1254 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    12b4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    12b6:	2b22      	cmp	r3, #34	; 0x22
    12b8:	d108      	bne.n	12cc <print_int+0xa4>
    12ba:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    12bc:	1e5a      	subs	r2, r3, #1
    12be:	633a      	str	r2, [r7, #48]	; 0x30
    12c0:	f107 0238 	add.w	r2, r7, #56	; 0x38
    12c4:	4413      	add	r3, r2
    12c6:	2230      	movs	r2, #48	; 0x30
    12c8:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    12cc:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    12ce:	2b00      	cmp	r3, #0
    12d0:	da08      	bge.n	12e4 <print_int+0xbc>
    12d2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    12d4:	1e5a      	subs	r2, r3, #1
    12d6:	633a      	str	r2, [r7, #48]	; 0x30
    12d8:	f107 0238 	add.w	r2, r7, #56	; 0x38
    12dc:	4413      	add	r3, r2
    12de:	222d      	movs	r2, #45	; 0x2d
    12e0:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    12e4:	f107 020c 	add.w	r2, r7, #12
    12e8:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    12ea:	4413      	add	r3, r2
    12ec:	2220      	movs	r2, #32
    12ee:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    12f0:	f107 020c 	add.w	r2, r7, #12
    12f4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    12f6:	4413      	add	r3, r2
    12f8:	4618      	mov	r0, r3
    12fa:	f7ff fe95 	bl	1028 <print>
}
    12fe:	3738      	adds	r7, #56	; 0x38
    1300:	46bd      	mov	sp, r7
    1302:	bd80      	pop	{r7, pc}

00001304 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    1304:	b580      	push	{r7, lr}
    1306:	b088      	sub	sp, #32
    1308:	af00      	add	r7, sp, #0
    130a:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    130c:	230c      	movs	r3, #12
    130e:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    1310:	2300      	movs	r3, #0
    1312:	767b      	strb	r3, [r7, #25]
	while (u){
    1314:	e026      	b.n	1364 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    1316:	687b      	ldr	r3, [r7, #4]
    1318:	b2db      	uxtb	r3, r3
    131a:	f003 030f 	and.w	r3, r3, #15
    131e:	b2db      	uxtb	r3, r3
    1320:	3330      	adds	r3, #48	; 0x30
    1322:	b2d9      	uxtb	r1, r3
    1324:	f107 020c 	add.w	r2, r7, #12
    1328:	69fb      	ldr	r3, [r7, #28]
    132a:	4413      	add	r3, r2
    132c:	460a      	mov	r2, r1
    132e:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1330:	f107 020c 	add.w	r2, r7, #12
    1334:	69fb      	ldr	r3, [r7, #28]
    1336:	4413      	add	r3, r2
    1338:	781b      	ldrb	r3, [r3, #0]
    133a:	2b39      	cmp	r3, #57	; 0x39
    133c:	d90c      	bls.n	1358 <print_hex+0x54>
    133e:	f107 020c 	add.w	r2, r7, #12
    1342:	69fb      	ldr	r3, [r7, #28]
    1344:	4413      	add	r3, r2
    1346:	781b      	ldrb	r3, [r3, #0]
    1348:	3307      	adds	r3, #7
    134a:	b2d9      	uxtb	r1, r3
    134c:	f107 020c 	add.w	r2, r7, #12
    1350:	69fb      	ldr	r3, [r7, #28]
    1352:	4413      	add	r3, r2
    1354:	460a      	mov	r2, r1
    1356:	701a      	strb	r2, [r3, #0]
		pos--;
    1358:	69fb      	ldr	r3, [r7, #28]
    135a:	3b01      	subs	r3, #1
    135c:	61fb      	str	r3, [r7, #28]
		u/=16;
    135e:	687b      	ldr	r3, [r7, #4]
    1360:	091b      	lsrs	r3, r3, #4
    1362:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    1364:	687b      	ldr	r3, [r7, #4]
    1366:	2b00      	cmp	r3, #0
    1368:	d1d5      	bne.n	1316 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    136a:	69fb      	ldr	r3, [r7, #28]
    136c:	2b0c      	cmp	r3, #12
    136e:	d108      	bne.n	1382 <print_hex+0x7e>
    1370:	69fb      	ldr	r3, [r7, #28]
    1372:	1e5a      	subs	r2, r3, #1
    1374:	61fa      	str	r2, [r7, #28]
    1376:	f107 0220 	add.w	r2, r7, #32
    137a:	4413      	add	r3, r2
    137c:	2230      	movs	r2, #48	; 0x30
    137e:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    1382:	69fb      	ldr	r3, [r7, #28]
    1384:	1e5a      	subs	r2, r3, #1
    1386:	61fa      	str	r2, [r7, #28]
    1388:	f107 0220 	add.w	r2, r7, #32
    138c:	4413      	add	r3, r2
    138e:	2278      	movs	r2, #120	; 0x78
    1390:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    1394:	69fb      	ldr	r3, [r7, #28]
    1396:	1e5a      	subs	r2, r3, #1
    1398:	61fa      	str	r2, [r7, #28]
    139a:	f107 0220 	add.w	r2, r7, #32
    139e:	4413      	add	r3, r2
    13a0:	2230      	movs	r2, #48	; 0x30
    13a2:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    13a6:	f107 020c 	add.w	r2, r7, #12
    13aa:	69fb      	ldr	r3, [r7, #28]
    13ac:	4413      	add	r3, r2
    13ae:	2220      	movs	r2, #32
    13b0:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    13b2:	f107 020c 	add.w	r2, r7, #12
    13b6:	69fb      	ldr	r3, [r7, #28]
    13b8:	4413      	add	r3, r2
    13ba:	4618      	mov	r0, r3
    13bc:	f7ff fe34 	bl	1028 <print>
}
    13c0:	3720      	adds	r7, #32
    13c2:	46bd      	mov	sp, r7
    13c4:	bd80      	pop	{r7, pc}
    13c6:	bf00      	nop

000013c8 <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    13c8:	b480      	push	{r7}
    13ca:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    13cc:	4b04      	ldr	r3, [pc, #16]	; (13e0 <flush_rx_queue+0x18>)
    13ce:	2200      	movs	r2, #0
    13d0:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    13d2:	4b03      	ldr	r3, [pc, #12]	; (13e0 <flush_rx_queue+0x18>)
    13d4:	2200      	movs	r2, #0
    13d6:	625a      	str	r2, [r3, #36]	; 0x24
}
    13d8:	46bd      	mov	sp, r7
    13da:	f85d 7b04 	ldr.w	r7, [sp], #4
    13de:	4770      	bx	lr
    13e0:	200000b4 	.word	0x200000b4

000013e4 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    13e4:	b490      	push	{r4, r7}
    13e6:	b086      	sub	sp, #24
    13e8:	af00      	add	r7, sp, #0
    13ea:	60f8      	str	r0, [r7, #12]
    13ec:	60b9      	str	r1, [r7, #8]
    13ee:	607a      	str	r2, [r7, #4]
	register gpio_crl_t* cr;
	uint8_t shift;
	switch (port){
    13f0:	68fb      	ldr	r3, [r7, #12]
    13f2:	2b01      	cmp	r3, #1
    13f4:	d006      	beq.n	1404 <config_pin+0x20>
    13f6:	2b01      	cmp	r3, #1
    13f8:	d302      	bcc.n	1400 <config_pin+0x1c>
    13fa:	2b02      	cmp	r3, #2
    13fc:	d004      	beq.n	1408 <config_pin+0x24>
    13fe:	e005      	b.n	140c <config_pin+0x28>
		case GPIOA:
		cr=(gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS);
    1400:	4c17      	ldr	r4, [pc, #92]	; (1460 <config_pin+0x7c>)
		break;
    1402:	e003      	b.n	140c <config_pin+0x28>
		case GPIOB:
		cr=(gpio_crl_t*)(GPIOB_BASE_ADR+GPIO_CRL_OFS);
    1404:	4c17      	ldr	r4, [pc, #92]	; (1464 <config_pin+0x80>)
		break;
    1406:	e001      	b.n	140c <config_pin+0x28>
		case GPIOC:
		cr=(gpio_crl_t*)(GPIOC_BASE_ADR+GPIO_CRL_OFS);
    1408:	4c17      	ldr	r4, [pc, #92]	; (1468 <config_pin+0x84>)
		break;
    140a:	bf00      	nop
	}
	shift=(pin&7)<<2;
    140c:	68bb      	ldr	r3, [r7, #8]
    140e:	b2db      	uxtb	r3, r3
    1410:	f003 0307 	and.w	r3, r3, #7
    1414:	b2db      	uxtb	r3, r3
    1416:	009b      	lsls	r3, r3, #2
    1418:	75fb      	strb	r3, [r7, #23]
	cr[pin>>3].cr&=~(15<<shift);
    141a:	68bb      	ldr	r3, [r7, #8]
    141c:	08db      	lsrs	r3, r3, #3
    141e:	009b      	lsls	r3, r3, #2
    1420:	4423      	add	r3, r4
    1422:	68ba      	ldr	r2, [r7, #8]
    1424:	08d2      	lsrs	r2, r2, #3
    1426:	0092      	lsls	r2, r2, #2
    1428:	4422      	add	r2, r4
    142a:	6812      	ldr	r2, [r2, #0]
    142c:	7df9      	ldrb	r1, [r7, #23]
    142e:	200f      	movs	r0, #15
    1430:	fa00 f101 	lsl.w	r1, r0, r1
    1434:	43c9      	mvns	r1, r1
    1436:	400a      	ands	r2, r1
    1438:	601a      	str	r2, [r3, #0]
	cr[pin>>3].cr|=config<<shift;
    143a:	68bb      	ldr	r3, [r7, #8]
    143c:	08db      	lsrs	r3, r3, #3
    143e:	009b      	lsls	r3, r3, #2
    1440:	4423      	add	r3, r4
    1442:	68ba      	ldr	r2, [r7, #8]
    1444:	08d2      	lsrs	r2, r2, #3
    1446:	0092      	lsls	r2, r2, #2
    1448:	4422      	add	r2, r4
    144a:	6811      	ldr	r1, [r2, #0]
    144c:	7dfa      	ldrb	r2, [r7, #23]
    144e:	6878      	ldr	r0, [r7, #4]
    1450:	fa00 f202 	lsl.w	r2, r0, r2
    1454:	430a      	orrs	r2, r1
    1456:	601a      	str	r2, [r3, #0]
}
    1458:	3718      	adds	r7, #24
    145a:	46bd      	mov	sp, r7
    145c:	bc90      	pop	{r4, r7}
    145e:	4770      	bx	lr
    1460:	40010800 	.word	0x40010800
    1464:	40010c00 	.word	0x40010c00
    1468:	40011000 	.word	0x40011000

0000146c <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    146c:	b480      	push	{r7}
    146e:	b083      	sub	sp, #12
    1470:	af00      	add	r7, sp, #0
    1472:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    1474:	687b      	ldr	r3, [r7, #4]
    1476:	2b3b      	cmp	r3, #59	; 0x3b
    1478:	d900      	bls.n	147c <enable_interrupt+0x10>
    147a:	e016      	b.n	14aa <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    147c:	687b      	ldr	r3, [r7, #4]
    147e:	095b      	lsrs	r3, r3, #5
    1480:	009b      	lsls	r3, r3, #2
    1482:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    1486:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    148a:	687a      	ldr	r2, [r7, #4]
    148c:	0952      	lsrs	r2, r2, #5
    148e:	0092      	lsls	r2, r2, #2
    1490:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    1494:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    1498:	6812      	ldr	r2, [r2, #0]
    149a:	6879      	ldr	r1, [r7, #4]
    149c:	f001 011f 	and.w	r1, r1, #31
    14a0:	2001      	movs	r0, #1
    14a2:	fa00 f101 	lsl.w	r1, r0, r1
    14a6:	430a      	orrs	r2, r1
    14a8:	601a      	str	r2, [r3, #0]
}
    14aa:	370c      	adds	r7, #12
    14ac:	46bd      	mov	sp, r7
    14ae:	f85d 7b04 	ldr.w	r7, [sp], #4
    14b2:	4770      	bx	lr

000014b4 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    14b4:	b480      	push	{r7}
    14b6:	b083      	sub	sp, #12
    14b8:	af00      	add	r7, sp, #0
    14ba:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    14bc:	687b      	ldr	r3, [r7, #4]
    14be:	2b3b      	cmp	r3, #59	; 0x3b
    14c0:	d900      	bls.n	14c4 <disable_interrupt+0x10>
    14c2:	e013      	b.n	14ec <disable_interrupt+0x38>
	ICER[irq>>5]&=~(1<<(irq&0x1f));
    14c4:	687b      	ldr	r3, [r7, #4]
    14c6:	095b      	lsrs	r3, r3, #5
    14c8:	009a      	lsls	r2, r3, #2
    14ca:	4b0b      	ldr	r3, [pc, #44]	; (14f8 <disable_interrupt+0x44>)
    14cc:	4413      	add	r3, r2
    14ce:	687a      	ldr	r2, [r7, #4]
    14d0:	0952      	lsrs	r2, r2, #5
    14d2:	0091      	lsls	r1, r2, #2
    14d4:	4a08      	ldr	r2, [pc, #32]	; (14f8 <disable_interrupt+0x44>)
    14d6:	440a      	add	r2, r1
    14d8:	6812      	ldr	r2, [r2, #0]
    14da:	6879      	ldr	r1, [r7, #4]
    14dc:	f001 011f 	and.w	r1, r1, #31
    14e0:	2001      	movs	r0, #1
    14e2:	fa00 f101 	lsl.w	r1, r0, r1
    14e6:	43c9      	mvns	r1, r1
    14e8:	400a      	ands	r2, r1
    14ea:	601a      	str	r2, [r3, #0]
}
    14ec:	370c      	adds	r7, #12
    14ee:	46bd      	mov	sp, r7
    14f0:	f85d 7b04 	ldr.w	r7, [sp], #4
    14f4:	4770      	bx	lr
    14f6:	bf00      	nop
    14f8:	e000e180 	.word	0xe000e180

000014fc <set_int_priority>:



void set_int_priority(int32_t irq, unsigned priority){
    14fc:	b480      	push	{r7}
    14fe:	b083      	sub	sp, #12
    1500:	af00      	add	r7, sp, #0
    1502:	6078      	str	r0, [r7, #4]
    1504:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    1506:	687b      	ldr	r3, [r7, #4]
    1508:	2b00      	cmp	r3, #0
    150a:	db0d      	blt.n	1528 <set_int_priority+0x2c>
    150c:	687b      	ldr	r3, [r7, #4]
    150e:	2b3b      	cmp	r3, #59	; 0x3b
    1510:	dc0a      	bgt.n	1528 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    1512:	687b      	ldr	r3, [r7, #4]
    1514:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    1518:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    151c:	683a      	ldr	r2, [r7, #0]
    151e:	b2d2      	uxtb	r2, r2
    1520:	0112      	lsls	r2, r2, #4
    1522:	b2d2      	uxtb	r2, r2
    1524:	701a      	strb	r2, [r3, #0]
    1526:	e012      	b.n	154e <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    1528:	687b      	ldr	r3, [r7, #4]
    152a:	2b00      	cmp	r3, #0
    152c:	da0f      	bge.n	154e <set_int_priority+0x52>
    152e:	687b      	ldr	r3, [r7, #4]
    1530:	f113 0f0f 	cmn.w	r3, #15
    1534:	db0b      	blt.n	154e <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    1536:	687a      	ldr	r2, [r7, #4]
    1538:	f06f 0303 	mvn.w	r3, #3
    153c:	1a9b      	subs	r3, r3, r2
    153e:	461a      	mov	r2, r3
    1540:	4b05      	ldr	r3, [pc, #20]	; (1558 <set_int_priority+0x5c>)
    1542:	4413      	add	r3, r2
    1544:	683a      	ldr	r2, [r7, #0]
    1546:	b2d2      	uxtb	r2, r2
    1548:	0112      	lsls	r2, r2, #4
    154a:	b2d2      	uxtb	r2, r2
    154c:	701a      	strb	r2, [r3, #0]
	}
}
    154e:	370c      	adds	r7, #12
    1550:	46bd      	mov	sp, r7
    1552:	f85d 7b04 	ldr.w	r7, [sp], #4
    1556:	4770      	bx	lr
    1558:	e000ed18 	.word	0xe000ed18

0000155c <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    155c:	4b01      	ldr	r3, [pc, #4]	; (1564 <reset_mcu+0x8>)
    155e:	4a02      	ldr	r2, [pc, #8]	; (1568 <reset_mcu+0xc>)
    1560:	601a      	str	r2, [r3, #0]
    1562:	bf00      	nop
    1564:	e000ed0c 	.word	0xe000ed0c
    1568:	05fa0004 	.word	0x05fa0004

0000156c <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    156c:	b580      	push	{r7, lr}
    156e:	b082      	sub	sp, #8
    1570:	af00      	add	r7, sp, #0
    1572:	6078      	str	r0, [r7, #4]
    1574:	6039      	str	r1, [r7, #0]
	print(msg);
    1576:	6878      	ldr	r0, [r7, #4]
    1578:	f7ff fd56 	bl	1028 <print>
	print("at address ");
    157c:	4814      	ldr	r0, [pc, #80]	; (15d0 <print_fault+0x64>)
    157e:	f7ff fd53 	bl	1028 <print>
	if (adr) {
    1582:	683b      	ldr	r3, [r7, #0]
    1584:	2b00      	cmp	r3, #0
    1586:	d002      	beq.n	158e <print_fault+0x22>
		print_hex(adr);
    1588:	6838      	ldr	r0, [r7, #0]
    158a:	f7ff febb 	bl	1304 <print_hex>
	};
	conout(CR);
    158e:	200d      	movs	r0, #13
    1590:	f7ff fd18 	bl	fc4 <conout>
	print("UFSR=");
    1594:	480f      	ldr	r0, [pc, #60]	; (15d4 <print_fault+0x68>)
    1596:	f7ff fd47 	bl	1028 <print>
	print_hex(CFSR->fsr.usageFalt);
    159a:	4b0f      	ldr	r3, [pc, #60]	; (15d8 <print_fault+0x6c>)
    159c:	681b      	ldr	r3, [r3, #0]
    159e:	0c1b      	lsrs	r3, r3, #16
    15a0:	b29b      	uxth	r3, r3
    15a2:	4618      	mov	r0, r3
    15a4:	f7ff feae 	bl	1304 <print_hex>
	print(", BFSR=");
    15a8:	480c      	ldr	r0, [pc, #48]	; (15dc <print_fault+0x70>)
    15aa:	f7ff fd3d 	bl	1028 <print>
	print_hex(CFSR->fsr.busFault);
    15ae:	4b0a      	ldr	r3, [pc, #40]	; (15d8 <print_fault+0x6c>)
    15b0:	681b      	ldr	r3, [r3, #0]
    15b2:	0a1b      	lsrs	r3, r3, #8
    15b4:	b2db      	uxtb	r3, r3
    15b6:	4618      	mov	r0, r3
    15b8:	f7ff fea4 	bl	1304 <print_hex>
	print(", MMFSR=");
    15bc:	4808      	ldr	r0, [pc, #32]	; (15e0 <print_fault+0x74>)
    15be:	f7ff fd33 	bl	1028 <print>
	print_hex(CFSR->fsr.mmFault);
    15c2:	4b05      	ldr	r3, [pc, #20]	; (15d8 <print_fault+0x6c>)
    15c4:	681b      	ldr	r3, [r3, #0]
    15c6:	b2db      	uxtb	r3, r3
    15c8:	4618      	mov	r0, r3
    15ca:	f7ff fe9b 	bl	1304 <print_hex>
	while(1);
    15ce:	e7fe      	b.n	15ce <print_fault+0x62>
    15d0:	00001f20 	.word	0x00001f20
    15d4:	00001f2c 	.word	0x00001f2c
    15d8:	e000ed28 	.word	0xe000ed28
    15dc:	00001f34 	.word	0x00001f34
    15e0:	00001f3c 	.word	0x00001f3c

000015e4 <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    15e4:	b480      	push	{r7}
    15e6:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    15e8:	2300      	movs	r3, #0
    15ea:	2200      	movs	r2, #0
    15ec:	4618      	mov	r0, r3
    15ee:	4611      	mov	r1, r2
    15f0:	df02      	svc	2
}
    15f2:	46bd      	mov	sp, r7
    15f4:	f85d 7b04 	ldr.w	r7, [sp], #4
    15f8:	4770      	bx	lr
    15fa:	bf00      	nop

000015fc <tvout_init>:
 #endif
 
uint8_t video_buffer[CHARS_PER_LINE][LINES_PER_SCREEN];
volatile static uint8_t line_buffer[60];
 
 void tvout_init(){
    15fc:	b580      	push	{r7, lr}
    15fe:	b082      	sub	sp, #8
    1600:	af00      	add	r7, sp, #0
	//sortie sync sur PA8
	config_pin(GPIOA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    1602:	2000      	movs	r0, #0
    1604:	2108      	movs	r1, #8
    1606:	220a      	movs	r2, #10
    1608:	f7ff feec 	bl	13e4 <config_pin>
	//sortie video sur PB15
	config_pin(GPIOB,15,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_50M);
    160c:	2001      	movs	r0, #1
    160e:	210f      	movs	r1, #15
    1610:	220b      	movs	r2, #11
    1612:	f7ff fee7 	bl	13e4 <config_pin>
	//timer 1 utilisé pour sync
	APB2ENR->fld.tim1en=1;
    1616:	4a31      	ldr	r2, [pc, #196]	; (16dc <tvout_init+0xe0>)
    1618:	7853      	ldrb	r3, [r2, #1]
    161a:	f043 0308 	orr.w	r3, r3, #8
    161e:	7053      	strb	r3, [r2, #1]
	// clock source division
	*TIMER1_PSC=0;
    1620:	4b2f      	ldr	r3, [pc, #188]	; (16e0 <tvout_init+0xe4>)
    1622:	2200      	movs	r2, #0
    1624:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    1626:	4b2f      	ldr	r3, [pc, #188]	; (16e4 <tvout_init+0xe8>)
    1628:	f241 12df 	movw	r2, #4575	; 0x11df
    162c:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    162e:	4b2e      	ldr	r3, [pc, #184]	; (16e8 <tvout_init+0xec>)
    1630:	f240 1251 	movw	r2, #337	; 0x151
    1634:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;
    1636:	4b2d      	ldr	r3, [pc, #180]	; (16ec <tvout_init+0xf0>)
    1638:	681a      	ldr	r2, [r3, #0]
    163a:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    163e:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    1642:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1;
    1644:	4b29      	ldr	r3, [pc, #164]	; (16ec <tvout_init+0xf0>)
    1646:	681a      	ldr	r2, [r3, #0]
    1648:	f042 0208 	orr.w	r2, r2, #8
    164c:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1;
    164e:	4b28      	ldr	r3, [pc, #160]	; (16f0 <tvout_init+0xf4>)
    1650:	681a      	ldr	r2, [r3, #0]
    1652:	f042 0201 	orr.w	r2, r2, #1
    1656:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1;
    1658:	4b25      	ldr	r3, [pc, #148]	; (16f0 <tvout_init+0xf4>)
    165a:	681a      	ldr	r2, [r3, #0]
    165c:	f042 0202 	orr.w	r2, r2, #2
    1660:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;
    1662:	4a24      	ldr	r2, [pc, #144]	; (16f4 <tvout_init+0xf8>)
    1664:	8813      	ldrh	r3, [r2, #0]
    1666:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    166a:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    166e:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    1670:	4b21      	ldr	r3, [pc, #132]	; (16f8 <tvout_init+0xfc>)
    1672:	681a      	ldr	r2, [r3, #0]
    1674:	f042 0201 	orr.w	r2, r2, #1
    1678:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->cr1=(FSPI_9M<<SPI_CR1_BR)|(1<<SPI_CR1_MSTR)|(1<<SPI_CR1_BIDIMODE)|(1<<SPI_CR1_BIDIOE);
    167a:	4b20      	ldr	r3, [pc, #128]	; (16fc <tvout_init+0x100>)
    167c:	f24c 0214 	movw	r2, #49172	; 0xc014
    1680:	601a      	str	r2, [r3, #0]
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    1682:	4b1f      	ldr	r3, [pc, #124]	; (1700 <tvout_init+0x104>)
    1684:	681a      	ldr	r2, [r3, #0]
    1686:	f042 0202 	orr.w	r2, r2, #2
    168a:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,7);
    168c:	201b      	movs	r0, #27
    168e:	2107      	movs	r1, #7
    1690:	f7ff ff34 	bl	14fc <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    1694:	201b      	movs	r0, #27
    1696:	f7ff fee9 	bl	146c <enable_interrupt>
	// video test
	int i;
	for(i=0;i<(CHARS_PER_LINE*LINES_PER_SCREEN);i++){
    169a:	2300      	movs	r3, #0
    169c:	607b      	str	r3, [r7, #4]
    169e:	e015      	b.n	16cc <tvout_init+0xd0>
		*((uint8_t*)video_buffer+i)=(uint8_t)(i%FONT_SIZE+32);
    16a0:	687b      	ldr	r3, [r7, #4]
    16a2:	4a18      	ldr	r2, [pc, #96]	; (1704 <tvout_init+0x108>)
    16a4:	1898      	adds	r0, r3, r2
    16a6:	687a      	ldr	r2, [r7, #4]
    16a8:	4b17      	ldr	r3, [pc, #92]	; (1708 <tvout_init+0x10c>)
    16aa:	fb83 1302 	smull	r1, r3, r3, r2
    16ae:	1119      	asrs	r1, r3, #4
    16b0:	17d3      	asrs	r3, r2, #31
    16b2:	1ac9      	subs	r1, r1, r3
    16b4:	460b      	mov	r3, r1
    16b6:	005b      	lsls	r3, r3, #1
    16b8:	440b      	add	r3, r1
    16ba:	015b      	lsls	r3, r3, #5
    16bc:	1ad1      	subs	r1, r2, r3
    16be:	b2cb      	uxtb	r3, r1
    16c0:	3320      	adds	r3, #32
    16c2:	b2db      	uxtb	r3, r3
    16c4:	7003      	strb	r3, [r0, #0]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,7);
	enable_interrupt(IRQ_TIM1_CC);
	// video test
	int i;
	for(i=0;i<(CHARS_PER_LINE*LINES_PER_SCREEN);i++){
    16c6:	687b      	ldr	r3, [r7, #4]
    16c8:	3301      	adds	r3, #1
    16ca:	607b      	str	r3, [r7, #4]
    16cc:	687b      	ldr	r3, [r7, #4]
    16ce:	f5b3 6f16 	cmp.w	r3, #2400	; 0x960
    16d2:	dbe5      	blt.n	16a0 <tvout_init+0xa4>
		*((uint8_t*)video_buffer+i)=(uint8_t)(i%FONT_SIZE+32);
	}
	// test end
 }
    16d4:	3708      	adds	r7, #8
    16d6:	46bd      	mov	sp, r7
    16d8:	bd80      	pop	{r7, pc}
    16da:	bf00      	nop
    16dc:	40021018 	.word	0x40021018
    16e0:	40012c28 	.word	0x40012c28
    16e4:	40012c2c 	.word	0x40012c2c
    16e8:	40012c34 	.word	0x40012c34
    16ec:	40012c18 	.word	0x40012c18
    16f0:	40012c20 	.word	0x40012c20
    16f4:	40012c44 	.word	0x40012c44
    16f8:	40012c00 	.word	0x40012c00
    16fc:	40003800 	.word	0x40003800
    1700:	40012c0c 	.word	0x40012c0c
    1704:	20000124 	.word	0x20000124
    1708:	2aaaaaab 	.word	0x2aaaaaab

0000170c <TIM1_CC_handler>:
 *************************/
volatile static uint8_t line_buffer[60];
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
void TIM1_CC_handler(){
    170c:	b480      	push	{r7}
    170e:	af00      	add	r7, sp, #0
	line_count++;
    1710:	4b51      	ldr	r3, [pc, #324]	; (1858 <TIM1_CC_handler+0x14c>)
    1712:	681b      	ldr	r3, [r3, #0]
    1714:	3301      	adds	r3, #1
    1716:	4a50      	ldr	r2, [pc, #320]	; (1858 <TIM1_CC_handler+0x14c>)
    1718:	6013      	str	r3, [r2, #0]
	TIMER1_SR->fld.cc1if=0;
    171a:	4b50      	ldr	r3, [pc, #320]	; (185c <TIM1_CC_handler+0x150>)
    171c:	681a      	ldr	r2, [r3, #0]
    171e:	f022 0202 	bic.w	r2, r2, #2
    1722:	601a      	str	r2, [r3, #0]
	switch(line_count){
    1724:	4b4c      	ldr	r3, [pc, #304]	; (1858 <TIM1_CC_handler+0x14c>)
    1726:	681b      	ldr	r3, [r3, #0]
    1728:	2b12      	cmp	r3, #18
    172a:	d048      	beq.n	17be <TIM1_CC_handler+0xb2>
    172c:	2b12      	cmp	r3, #18
    172e:	dc0b      	bgt.n	1748 <TIM1_CC_handler+0x3c>
    1730:	2b06      	cmp	r3, #6
    1732:	d029      	beq.n	1788 <TIM1_CC_handler+0x7c>
    1734:	2b06      	cmp	r3, #6
    1736:	dc02      	bgt.n	173e <TIM1_CC_handler+0x32>
    1738:	2b00      	cmp	r3, #0
    173a:	d016      	beq.n	176a <TIM1_CC_handler+0x5e>
    173c:	e086      	b.n	184c <TIM1_CC_handler+0x140>
    173e:	2b0c      	cmp	r3, #12
    1740:	d027      	beq.n	1792 <TIM1_CC_handler+0x86>
    1742:	2b11      	cmp	r3, #17
    1744:	d02d      	beq.n	17a2 <TIM1_CC_handler+0x96>
    1746:	e081      	b.n	184c <TIM1_CC_handler+0x140>
    1748:	f240 120f 	movw	r2, #271	; 0x10f
    174c:	4293      	cmp	r3, r2
    174e:	d058      	beq.n	1802 <TIM1_CC_handler+0xf6>
    1750:	f5b3 7f88 	cmp.w	r3, #272	; 0x110
    1754:	da02      	bge.n	175c <TIM1_CC_handler+0x50>
    1756:	2b32      	cmp	r3, #50	; 0x32
    1758:	d03f      	beq.n	17da <TIM1_CC_handler+0xce>
    175a:	e077      	b.n	184c <TIM1_CC_handler+0x140>
    175c:	f5b3 7f88 	cmp.w	r3, #272	; 0x110
    1760:	d05e      	beq.n	1820 <TIM1_CC_handler+0x114>
    1762:	f5b3 7f91 	cmp.w	r3, #290	; 0x122
    1766:	d042      	beq.n	17ee <TIM1_CC_handler+0xe2>
    1768:	e070      	b.n	184c <TIM1_CC_handler+0x140>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    176a:	4a3d      	ldr	r2, [pc, #244]	; (1860 <TIM1_CC_handler+0x154>)
    176c:	4b3c      	ldr	r3, [pc, #240]	; (1860 <TIM1_CC_handler+0x154>)
    176e:	881b      	ldrh	r3, [r3, #0]
    1770:	b29b      	uxth	r3, r3
    1772:	085b      	lsrs	r3, r3, #1
    1774:	b29b      	uxth	r3, r3
    1776:	8013      	strh	r3, [r2, #0]
		*TIMER1_CCR1/=2;
    1778:	4a3a      	ldr	r2, [pc, #232]	; (1864 <TIM1_CC_handler+0x158>)
    177a:	4b3a      	ldr	r3, [pc, #232]	; (1864 <TIM1_CC_handler+0x158>)
    177c:	881b      	ldrh	r3, [r3, #0]
    177e:	b29b      	uxth	r3, r3
    1780:	085b      	lsrs	r3, r3, #1
    1782:	b29b      	uxth	r3, r3
    1784:	8013      	strh	r3, [r2, #0]
		break;
    1786:	e063      	b.n	1850 <TIM1_CC_handler+0x144>
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    1788:	4b36      	ldr	r3, [pc, #216]	; (1864 <TIM1_CC_handler+0x158>)
    178a:	f640 0246 	movw	r2, #2118	; 0x846
    178e:	801a      	strh	r2, [r3, #0]
	    break;
    1790:	e05e      	b.n	1850 <TIM1_CC_handler+0x144>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    1792:	4b33      	ldr	r3, [pc, #204]	; (1860 <TIM1_CC_handler+0x154>)
    1794:	f640 02ef 	movw	r2, #2287	; 0x8ef
    1798:	801a      	strh	r2, [r3, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    179a:	4b32      	ldr	r3, [pc, #200]	; (1864 <TIM1_CC_handler+0x158>)
    179c:	22a8      	movs	r2, #168	; 0xa8
    179e:	801a      	strh	r2, [r3, #0]
		break;
    17a0:	e056      	b.n	1850 <TIM1_CC_handler+0x144>
	case 17: // fin sync champ paire
		if (even){
    17a2:	4b31      	ldr	r3, [pc, #196]	; (1868 <TIM1_CC_handler+0x15c>)
    17a4:	681b      	ldr	r3, [r3, #0]
    17a6:	2b00      	cmp	r3, #0
    17a8:	d008      	beq.n	17bc <TIM1_CC_handler+0xb0>
			*TIMER1_ARR=(FCLK/HFREQ-1);
    17aa:	4b2d      	ldr	r3, [pc, #180]	; (1860 <TIM1_CC_handler+0x154>)
    17ac:	f241 12df 	movw	r2, #4575	; 0x11df
    17b0:	801a      	strh	r2, [r3, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    17b2:	4b2c      	ldr	r3, [pc, #176]	; (1864 <TIM1_CC_handler+0x158>)
    17b4:	f240 1251 	movw	r2, #337	; 0x151
    17b8:	801a      	strh	r2, [r3, #0]
		}
		break;
    17ba:	e049      	b.n	1850 <TIM1_CC_handler+0x144>
    17bc:	e048      	b.n	1850 <TIM1_CC_handler+0x144>
	case 18: // fin vsync
		if (!even){
    17be:	4b2a      	ldr	r3, [pc, #168]	; (1868 <TIM1_CC_handler+0x15c>)
    17c0:	681b      	ldr	r3, [r3, #0]
    17c2:	2b00      	cmp	r3, #0
    17c4:	d108      	bne.n	17d8 <TIM1_CC_handler+0xcc>
			*TIMER1_ARR=(FCLK/HFREQ-1);
    17c6:	4b26      	ldr	r3, [pc, #152]	; (1860 <TIM1_CC_handler+0x154>)
    17c8:	f241 12df 	movw	r2, #4575	; 0x11df
    17cc:	801a      	strh	r2, [r3, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    17ce:	4b25      	ldr	r3, [pc, #148]	; (1864 <TIM1_CC_handler+0x158>)
    17d0:	f240 1251 	movw	r2, #337	; 0x151
    17d4:	801a      	strh	r2, [r3, #0]
		}
		break;
    17d6:	e03b      	b.n	1850 <TIM1_CC_handler+0x144>
    17d8:	e03a      	b.n	1850 <TIM1_CC_handler+0x144>
	case TOP_LINE:
		video=1;
    17da:	4b24      	ldr	r3, [pc, #144]	; (186c <TIM1_CC_handler+0x160>)
    17dc:	2201      	movs	r2, #1
    17de:	601a      	str	r2, [r3, #0]
		SPI2->cr1|=(1<<SPI_CR1_SPE);
    17e0:	4a23      	ldr	r2, [pc, #140]	; (1870 <TIM1_CC_handler+0x164>)
    17e2:	4b23      	ldr	r3, [pc, #140]	; (1870 <TIM1_CC_handler+0x164>)
    17e4:	681b      	ldr	r3, [r3, #0]
    17e6:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    17ea:	6013      	str	r3, [r2, #0]
		break;
    17ec:	e030      	b.n	1850 <TIM1_CC_handler+0x144>
	case (TOP_LINE+VRES):
		video=0;
    17ee:	4b1f      	ldr	r3, [pc, #124]	; (186c <TIM1_CC_handler+0x160>)
    17f0:	2200      	movs	r2, #0
    17f2:	601a      	str	r2, [r3, #0]
		SPI2->cr1&=~(1<<SPI_CR1_SPE);
    17f4:	4a1e      	ldr	r2, [pc, #120]	; (1870 <TIM1_CC_handler+0x164>)
    17f6:	4b1e      	ldr	r3, [pc, #120]	; (1870 <TIM1_CC_handler+0x164>)
    17f8:	681b      	ldr	r3, [r3, #0]
    17fa:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    17fe:	6013      	str	r3, [r2, #0]
		break;
    1800:	e026      	b.n	1850 <TIM1_CC_handler+0x144>
	case FIELD_END:
		if (!even){
    1802:	4b19      	ldr	r3, [pc, #100]	; (1868 <TIM1_CC_handler+0x15c>)
    1804:	681b      	ldr	r3, [r3, #0]
    1806:	2b00      	cmp	r3, #0
    1808:	d109      	bne.n	181e <TIM1_CC_handler+0x112>
			line_count=-1;
    180a:	4b13      	ldr	r3, [pc, #76]	; (1858 <TIM1_CC_handler+0x14c>)
    180c:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    1810:	601a      	str	r2, [r3, #0]
			even=-even;
    1812:	4b15      	ldr	r3, [pc, #84]	; (1868 <TIM1_CC_handler+0x15c>)
    1814:	681b      	ldr	r3, [r3, #0]
    1816:	425b      	negs	r3, r3
    1818:	4a13      	ldr	r2, [pc, #76]	; (1868 <TIM1_CC_handler+0x15c>)
    181a:	6013      	str	r3, [r2, #0]
		}
		break;
    181c:	e018      	b.n	1850 <TIM1_CC_handler+0x144>
    181e:	e017      	b.n	1850 <TIM1_CC_handler+0x144>
	case (FIELD_END+1):
		if (even){
    1820:	4b11      	ldr	r3, [pc, #68]	; (1868 <TIM1_CC_handler+0x15c>)
    1822:	681b      	ldr	r3, [r3, #0]
    1824:	2b00      	cmp	r3, #0
    1826:	d010      	beq.n	184a <TIM1_CC_handler+0x13e>
			*TIMER1_ARR/=2;
    1828:	4a0d      	ldr	r2, [pc, #52]	; (1860 <TIM1_CC_handler+0x154>)
    182a:	4b0d      	ldr	r3, [pc, #52]	; (1860 <TIM1_CC_handler+0x154>)
    182c:	881b      	ldrh	r3, [r3, #0]
    182e:	b29b      	uxth	r3, r3
    1830:	085b      	lsrs	r3, r3, #1
    1832:	b29b      	uxth	r3, r3
    1834:	8013      	strh	r3, [r2, #0]
			line_count=-1;
    1836:	4b08      	ldr	r3, [pc, #32]	; (1858 <TIM1_CC_handler+0x14c>)
    1838:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    183c:	601a      	str	r2, [r3, #0]
			even=-even;
    183e:	4b0a      	ldr	r3, [pc, #40]	; (1868 <TIM1_CC_handler+0x15c>)
    1840:	681b      	ldr	r3, [r3, #0]
    1842:	425b      	negs	r3, r3
    1844:	4a08      	ldr	r2, [pc, #32]	; (1868 <TIM1_CC_handler+0x15c>)
    1846:	6013      	str	r3, [r2, #0]
		}
	    break;
    1848:	e002      	b.n	1850 <TIM1_CC_handler+0x144>
    184a:	e001      	b.n	1850 <TIM1_CC_handler+0x144>
	default:
		if (video){
    184c:	4b07      	ldr	r3, [pc, #28]	; (186c <TIM1_CC_handler+0x160>)
    184e:	681b      	ldr	r3, [r3, #0]
			
		}
	}//switch (line_count)
}
    1850:	46bd      	mov	sp, r7
    1852:	f85d 7b04 	ldr.w	r7, [sp], #4
    1856:	4770      	bx	lr
    1858:	20000004 	.word	0x20000004
    185c:	40012c10 	.word	0x40012c10
    1860:	40012c2c 	.word	0x40012c2c
    1864:	40012c34 	.word	0x40012c34
    1868:	2000011c 	.word	0x2000011c
    186c:	20000118 	.word	0x20000118
    1870:	40003800 	.word	0x40003800

00001874 <uart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
    1874:	b480      	push	{r7}
    1876:	b085      	sub	sp, #20
    1878:	af00      	add	r7, sp, #0
    187a:	6078      	str	r0, [r7, #4]
    187c:	6039      	str	r1, [r7, #0]
	sfrp_t brr;
	uint32_t rate;

    brr=(sfrp_t)(channel+USART_BRR_OFS);		
    187e:	687b      	ldr	r3, [r7, #4]
    1880:	3308      	adds	r3, #8
    1882:	60bb      	str	r3, [r7, #8]
	switch (channel){
    1884:	687b      	ldr	r3, [r7, #4]
    1886:	4a1a      	ldr	r2, [pc, #104]	; (18f0 <uart_set_baud+0x7c>)
    1888:	4293      	cmp	r3, r2
    188a:	d019      	beq.n	18c0 <uart_set_baud+0x4c>
    188c:	4a19      	ldr	r2, [pc, #100]	; (18f4 <uart_set_baud+0x80>)
    188e:	4293      	cmp	r3, r2
    1890:	d003      	beq.n	189a <uart_set_baud+0x26>
    1892:	4a19      	ldr	r2, [pc, #100]	; (18f8 <uart_set_baud+0x84>)
    1894:	4293      	cmp	r3, r2
    1896:	d013      	beq.n	18c0 <uart_set_baud+0x4c>
    1898:	e021      	b.n	18de <uart_set_baud+0x6a>
	case USART1:
		rate=(FAPB2/baud/16)<<4;
    189a:	4a18      	ldr	r2, [pc, #96]	; (18fc <uart_set_baud+0x88>)
    189c:	683b      	ldr	r3, [r7, #0]
    189e:	fbb2 f3f3 	udiv	r3, r2, r3
    18a2:	011b      	lsls	r3, r3, #4
    18a4:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    18a6:	4a16      	ldr	r2, [pc, #88]	; (1900 <uart_set_baud+0x8c>)
    18a8:	683b      	ldr	r3, [r7, #0]
    18aa:	fbb2 f3f3 	udiv	r3, r2, r3
    18ae:	f003 030f 	and.w	r3, r3, #15
    18b2:	68fa      	ldr	r2, [r7, #12]
    18b4:	4313      	orrs	r3, r2
    18b6:	60fb      	str	r3, [r7, #12]
		*brr=rate;
    18b8:	68bb      	ldr	r3, [r7, #8]
    18ba:	68fa      	ldr	r2, [r7, #12]
    18bc:	601a      	str	r2, [r3, #0]
		return;
    18be:	e011      	b.n	18e4 <uart_set_baud+0x70>
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
    18c0:	4a10      	ldr	r2, [pc, #64]	; (1904 <uart_set_baud+0x90>)
    18c2:	683b      	ldr	r3, [r7, #0]
    18c4:	fbb2 f3f3 	udiv	r3, r2, r3
    18c8:	011b      	lsls	r3, r3, #4
    18ca:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    18cc:	4a0e      	ldr	r2, [pc, #56]	; (1908 <uart_set_baud+0x94>)
    18ce:	683b      	ldr	r3, [r7, #0]
    18d0:	fbb2 f3f3 	udiv	r3, r2, r3
    18d4:	f003 030f 	and.w	r3, r3, #15
    18d8:	68fa      	ldr	r2, [r7, #12]
    18da:	4313      	orrs	r3, r2
    18dc:	60fb      	str	r3, [r7, #12]
	}
	*brr=rate;
    18de:	68bb      	ldr	r3, [r7, #8]
    18e0:	68fa      	ldr	r2, [r7, #12]
    18e2:	601a      	str	r2, [r3, #0]
}
    18e4:	3714      	adds	r7, #20
    18e6:	46bd      	mov	sp, r7
    18e8:	f85d 7b04 	ldr.w	r7, [sp], #4
    18ec:	4770      	bx	lr
    18ee:	bf00      	nop
    18f0:	40004800 	.word	0x40004800
    18f4:	40013800 	.word	0x40013800
    18f8:	40004400 	.word	0x40004400
    18fc:	0044aa20 	.word	0x0044aa20
    1900:	044aa200 	.word	0x044aa200
    1904:	00225510 	.word	0x00225510
    1908:	02255100 	.word	0x02255100

0000190c <uart_open_channel>:

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl){
    190c:	b580      	push	{r7, lr}
    190e:	b086      	sub	sp, #24
    1910:	af00      	add	r7, sp, #0
    1912:	60f8      	str	r0, [r7, #12]
    1914:	60b9      	str	r1, [r7, #8]
    1916:	607a      	str	r2, [r7, #4]
	sfrp_t cr1, cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
    1918:	68fb      	ldr	r3, [r7, #12]
    191a:	4a40      	ldr	r2, [pc, #256]	; (1a1c <uart_open_channel+0x110>)
    191c:	4293      	cmp	r3, r2
    191e:	d044      	beq.n	19aa <uart_open_channel+0x9e>
    1920:	4a3f      	ldr	r2, [pc, #252]	; (1a20 <uart_open_channel+0x114>)
    1922:	4293      	cmp	r3, r2
    1924:	d003      	beq.n	192e <uart_open_channel+0x22>
    1926:	4a3f      	ldr	r2, [pc, #252]	; (1a24 <uart_open_channel+0x118>)
    1928:	4293      	cmp	r3, r2
    192a:	d020      	beq.n	196e <uart_open_channel+0x62>
    192c:	e05b      	b.n	19e6 <uart_open_channel+0xda>
	case USART1:
		APB2ENR->apb2enr|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
    192e:	4a3e      	ldr	r2, [pc, #248]	; (1a28 <uart_open_channel+0x11c>)
    1930:	4b3d      	ldr	r3, [pc, #244]	; (1a28 <uart_open_channel+0x11c>)
    1932:	681b      	ldr	r3, [r3, #0]
    1934:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    1938:	f043 0304 	orr.w	r3, r3, #4
    193c:	6013      	str	r3, [r2, #0]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    193e:	4a3b      	ldr	r2, [pc, #236]	; (1a2c <uart_open_channel+0x120>)
    1940:	4b3a      	ldr	r3, [pc, #232]	; (1a2c <uart_open_channel+0x120>)
    1942:	681b      	ldr	r3, [r3, #0]
    1944:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    1948:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    194c:	6013      	str	r3, [r2, #0]
		GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    194e:	4a37      	ldr	r2, [pc, #220]	; (1a2c <uart_open_channel+0x120>)
    1950:	4b36      	ldr	r3, [pc, #216]	; (1a2c <uart_open_channel+0x120>)
    1952:	681b      	ldr	r3, [r3, #0]
    1954:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    1958:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    195c:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART1,7);
    195e:	2025      	movs	r0, #37	; 0x25
    1960:	2107      	movs	r1, #7
    1962:	f7ff fdcb 	bl	14fc <set_int_priority>
		enable_interrupt(USART1_IRQ);
    1966:	2025      	movs	r0, #37	; 0x25
    1968:	f7ff fd80 	bl	146c <enable_interrupt>
		break;
    196c:	e03b      	b.n	19e6 <uart_open_channel+0xda>
	case USART2:
		APB1ENR->fld.usart2en=1;
    196e:	4a30      	ldr	r2, [pc, #192]	; (1a30 <uart_open_channel+0x124>)
    1970:	7893      	ldrb	r3, [r2, #2]
    1972:	f043 0302 	orr.w	r3, r3, #2
    1976:	7093      	strb	r3, [r2, #2]
		APB2ENR->fld.iopaen=1;
    1978:	4a2b      	ldr	r2, [pc, #172]	; (1a28 <uart_open_channel+0x11c>)
    197a:	7813      	ldrb	r3, [r2, #0]
    197c:	f043 0304 	orr.w	r3, r3, #4
    1980:	7013      	strb	r3, [r2, #0]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    1982:	4a2c      	ldr	r2, [pc, #176]	; (1a34 <uart_open_channel+0x128>)
    1984:	4b2b      	ldr	r3, [pc, #172]	; (1a34 <uart_open_channel+0x128>)
    1986:	681b      	ldr	r3, [r3, #0]
    1988:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    198c:	6013      	str	r3, [r2, #0]
		GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    198e:	4a29      	ldr	r2, [pc, #164]	; (1a34 <uart_open_channel+0x128>)
    1990:	4b28      	ldr	r3, [pc, #160]	; (1a34 <uart_open_channel+0x128>)
    1992:	681b      	ldr	r3, [r3, #0]
    1994:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    1998:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART2,7);
    199a:	2026      	movs	r0, #38	; 0x26
    199c:	2107      	movs	r1, #7
    199e:	f7ff fdad 	bl	14fc <set_int_priority>
		enable_interrupt(USART2_IRQ);
    19a2:	2026      	movs	r0, #38	; 0x26
    19a4:	f7ff fd62 	bl	146c <enable_interrupt>
		break;
    19a8:	e01d      	b.n	19e6 <uart_open_channel+0xda>
	case USART3:
		APB1ENR->fld.usart3en=1;
    19aa:	4a21      	ldr	r2, [pc, #132]	; (1a30 <uart_open_channel+0x124>)
    19ac:	7893      	ldrb	r3, [r2, #2]
    19ae:	f043 0304 	orr.w	r3, r3, #4
    19b2:	7093      	strb	r3, [r2, #2]
		APB2ENR->fld.iopben=1;
    19b4:	4a1c      	ldr	r2, [pc, #112]	; (1a28 <uart_open_channel+0x11c>)
    19b6:	7813      	ldrb	r3, [r2, #0]
    19b8:	f043 0308 	orr.w	r3, r3, #8
    19bc:	7013      	strb	r3, [r2, #0]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    19be:	4a1e      	ldr	r2, [pc, #120]	; (1a38 <uart_open_channel+0x12c>)
    19c0:	4b1d      	ldr	r3, [pc, #116]	; (1a38 <uart_open_channel+0x12c>)
    19c2:	681b      	ldr	r3, [r3, #0]
    19c4:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    19c8:	6013      	str	r3, [r2, #0]
		GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    19ca:	4a1b      	ldr	r2, [pc, #108]	; (1a38 <uart_open_channel+0x12c>)
    19cc:	4b1a      	ldr	r3, [pc, #104]	; (1a38 <uart_open_channel+0x12c>)
    19ce:	681b      	ldr	r3, [r3, #0]
    19d0:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    19d4:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART3,7);
    19d6:	2027      	movs	r0, #39	; 0x27
    19d8:	2107      	movs	r1, #7
    19da:	f7ff fd8f 	bl	14fc <set_int_priority>
		enable_interrupt(USART3_IRQ);
    19de:	2027      	movs	r0, #39	; 0x27
    19e0:	f7ff fd44 	bl	146c <enable_interrupt>
		break;
    19e4:	bf00      	nop
	}
	uart_set_baud(channel,baud);
    19e6:	68f8      	ldr	r0, [r7, #12]
    19e8:	68b9      	ldr	r1, [r7, #8]
    19ea:	f7ff ff43 	bl	1874 <uart_set_baud>
	if (flow_ctrl==FLOW_HARD){
    19ee:	687b      	ldr	r3, [r7, #4]
    19f0:	2b01      	cmp	r3, #1
    19f2:	d106      	bne.n	1a02 <uart_open_channel+0xf6>
		cr3=(sfrp_t)(channel+USART_CR3_OFS);
    19f4:	68fb      	ldr	r3, [r7, #12]
    19f6:	3314      	adds	r3, #20
    19f8:	617b      	str	r3, [r7, #20]
		*cr3=(1<<USART_CR3_CTSE)|(1<<USART_CR3_RTSE);
    19fa:	697b      	ldr	r3, [r7, #20]
    19fc:	f44f 7240 	mov.w	r2, #768	; 0x300
    1a00:	601a      	str	r2, [r3, #0]
	}
	cr1=(sfrp_t)(channel+USART_CR1_OFS);
    1a02:	68fb      	ldr	r3, [r7, #12]
    1a04:	330c      	adds	r3, #12
    1a06:	613b      	str	r3, [r7, #16]
	uart_getc(channel);
    1a08:	68f8      	ldr	r0, [r7, #12]
    1a0a:	f000 f82d 	bl	1a68 <uart_getc>
	*cr1=(1<<USART_CR1_UE)|(1<<USART_CR1_TE)|(1<<USART_CR1_RE)|(1<<USART_CR1_RXNEIE);
    1a0e:	693b      	ldr	r3, [r7, #16]
    1a10:	f242 022c 	movw	r2, #8236	; 0x202c
    1a14:	601a      	str	r2, [r3, #0]
}
    1a16:	3718      	adds	r7, #24
    1a18:	46bd      	mov	sp, r7
    1a1a:	bd80      	pop	{r7, pc}
    1a1c:	40004800 	.word	0x40004800
    1a20:	40013800 	.word	0x40013800
    1a24:	40004400 	.word	0x40004400
    1a28:	40021018 	.word	0x40021018
    1a2c:	40010804 	.word	0x40010804
    1a30:	4002101c 	.word	0x4002101c
    1a34:	40010800 	.word	0x40010800
    1a38:	40010c04 	.word	0x40010c04

00001a3c <uart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int uart_stat(unsigned channel){
    1a3c:	b480      	push	{r7}
    1a3e:	b085      	sub	sp, #20
    1a40:	af00      	add	r7, sp, #0
    1a42:	6078      	str	r0, [r7, #4]
	sfrp_t sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    1a44:	687b      	ldr	r3, [r7, #4]
    1a46:	60fb      	str	r3, [r7, #12]
	return *sr&(1<<USART_SR_RXNE)?-1:0;
    1a48:	68fb      	ldr	r3, [r7, #12]
    1a4a:	681b      	ldr	r3, [r3, #0]
    1a4c:	f003 0320 	and.w	r3, r3, #32
    1a50:	2b00      	cmp	r3, #0
    1a52:	d002      	beq.n	1a5a <uart_stat+0x1e>
    1a54:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1a58:	e000      	b.n	1a5c <uart_stat+0x20>
    1a5a:	2300      	movs	r3, #0
}
    1a5c:	4618      	mov	r0, r3
    1a5e:	3714      	adds	r7, #20
    1a60:	46bd      	mov	sp, r7
    1a62:	f85d 7b04 	ldr.w	r7, [sp], #4
    1a66:	4770      	bx	lr

00001a68 <uart_getc>:

// reçoit un caractère de la console
char uart_getc(unsigned channel){
    1a68:	b480      	push	{r7}
    1a6a:	b085      	sub	sp, #20
    1a6c:	af00      	add	r7, sp, #0
    1a6e:	6078      	str	r0, [r7, #4]
	sfrp_t dr;
	
	dr=(sfrp_t)(channel+USART_DR_OFS);
    1a70:	687b      	ldr	r3, [r7, #4]
    1a72:	3304      	adds	r3, #4
    1a74:	60fb      	str	r3, [r7, #12]
	return *dr&0x7f;
    1a76:	68fb      	ldr	r3, [r7, #12]
    1a78:	681b      	ldr	r3, [r3, #0]
    1a7a:	b2db      	uxtb	r3, r3
    1a7c:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    1a80:	b2db      	uxtb	r3, r3
}
    1a82:	4618      	mov	r0, r3
    1a84:	3714      	adds	r7, #20
    1a86:	46bd      	mov	sp, r7
    1a88:	f85d 7b04 	ldr.w	r7, [sp], #4
    1a8c:	4770      	bx	lr
    1a8e:	bf00      	nop

00001a90 <uart_putc>:

// transmet un caractère à la console
void uart_putc(unsigned channel, char c){
    1a90:	b480      	push	{r7}
    1a92:	b085      	sub	sp, #20
    1a94:	af00      	add	r7, sp, #0
    1a96:	6078      	str	r0, [r7, #4]
    1a98:	460b      	mov	r3, r1
    1a9a:	70fb      	strb	r3, [r7, #3]
	sfrp_t dr, sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    1a9c:	687b      	ldr	r3, [r7, #4]
    1a9e:	60fb      	str	r3, [r7, #12]
	dr=(sfrp_t)(channel+USART_DR_OFS);
    1aa0:	687b      	ldr	r3, [r7, #4]
    1aa2:	3304      	adds	r3, #4
    1aa4:	60bb      	str	r3, [r7, #8]
	//attend que dr soit vide
	while (!(*sr&(1<<USART_SR_TXE)));
    1aa6:	bf00      	nop
    1aa8:	68fb      	ldr	r3, [r7, #12]
    1aaa:	681b      	ldr	r3, [r3, #0]
    1aac:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1ab0:	2b00      	cmp	r3, #0
    1ab2:	d0f9      	beq.n	1aa8 <uart_putc+0x18>
	*dr=c&0x7f;
    1ab4:	78fb      	ldrb	r3, [r7, #3]
    1ab6:	f003 027f 	and.w	r2, r3, #127	; 0x7f
    1aba:	68bb      	ldr	r3, [r7, #8]
    1abc:	601a      	str	r2, [r3, #0]
}
    1abe:	3714      	adds	r7, #20
    1ac0:	46bd      	mov	sp, r7
    1ac2:	f85d 7b04 	ldr.w	r7, [sp], #4
    1ac6:	4770      	bx	lr

Disassembly of section .user_code:

00001fa0 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    1fa0:	b480      	push	{r7}
    1fa2:	b085      	sub	sp, #20
    1fa4:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    1fa6:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    1faa:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    1fac:	2300      	movs	r3, #0
    1fae:	71fb      	strb	r3, [r7, #7]
	
	
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    1fb0:	2300      	movs	r3, #0
    1fb2:	2200      	movs	r2, #0
    1fb4:	4618      	mov	r0, r3
    1fb6:	4611      	mov	r1, r2
    1fb8:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    1fba:	f107 030c 	add.w	r3, r7, #12
    1fbe:	2200      	movs	r2, #0
    1fc0:	4618      	mov	r0, r3
    1fc2:	4611      	mov	r1, r2
    1fc4:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    1fc6:	f107 0308 	add.w	r3, r7, #8
    1fca:	2200      	movs	r2, #0
    1fcc:	4618      	mov	r0, r3
    1fce:	4611      	mov	r1, r2
    1fd0:	df04      	svc	4
    1fd2:	68bb      	ldr	r3, [r7, #8]
    1fd4:	2b00      	cmp	r3, #0
    1fd6:	d1f6      	bne.n	1fc6 <blink+0x26>
		_svc_call(SVC_LED_ON,NUL,NUL);
    1fd8:	2300      	movs	r3, #0
    1fda:	2200      	movs	r2, #0
    1fdc:	4618      	mov	r0, r3
    1fde:	4611      	mov	r1, r2
    1fe0:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    1fe2:	f107 030c 	add.w	r3, r7, #12
    1fe6:	2200      	movs	r2, #0
    1fe8:	4618      	mov	r0, r3
    1fea:	4611      	mov	r1, r2
    1fec:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    1fee:	f107 0308 	add.w	r3, r7, #8
    1ff2:	2200      	movs	r2, #0
    1ff4:	4618      	mov	r0, r3
    1ff6:	4611      	mov	r1, r2
    1ff8:	df04      	svc	4
    1ffa:	68bb      	ldr	r3, [r7, #8]
    1ffc:	2b00      	cmp	r3, #0
    1ffe:	d1f6      	bne.n	1fee <blink+0x4e>
		_svc_call(SVC_CONIN,&c,NUL);
    2000:	1dfb      	adds	r3, r7, #7
    2002:	2200      	movs	r2, #0
    2004:	4618      	mov	r0, r3
    2006:	4611      	mov	r1, r2
    2008:	df05      	svc	5
		if (c) break;
    200a:	79fb      	ldrb	r3, [r7, #7]
    200c:	b2db      	uxtb	r3, r3
    200e:	2b00      	cmp	r3, #0
    2010:	d000      	beq.n	2014 <blink+0x74>
    2012:	e000      	b.n	2016 <blink+0x76>
	}
    2014:	e7cc      	b.n	1fb0 <blink+0x10>
}
    2016:	3714      	adds	r7, #20
    2018:	46bd      	mov	sp, r7
    201a:	f85d 7b04 	ldr.w	r7, [sp], #4
    201e:	4770      	bx	lr
