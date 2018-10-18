
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 45 02 00 00 d9 01 00 00     .P. 1...E.......
      10:	55 02 00 00 65 02 00 00 75 02 00 00 dd 14 00 00     U...e...u.......
      20:	dd 14 00 00 dd 14 00 00 dd 14 00 00 9d 05 00 00     ................
      30:	dd 14 00 00 dd 14 00 00 95 02 00 00 15 07 00 00     ................
      40:	b5 02 00 00 c5 02 00 00 e5 02 00 00 d5 02 00 00     ................
      50:	f5 02 00 00 05 03 00 00 15 03 00 00 25 03 00 00     ............%...
      60:	35 03 00 00 45 03 00 00 55 03 00 00 65 03 00 00     5...E...U...e...
      70:	75 03 00 00 dd 14 00 00 dd 14 00 00 dd 14 00 00     u...............
      80:	dd 14 00 00 dd 14 00 00 dd 14 00 00 dd 14 00 00     ................
      90:	dd 14 00 00 dd 14 00 00 dd 14 00 00 dd 14 00 00     ................
      a0:	dd 14 00 00 dd 14 00 00 dd 14 00 00 dd 14 00 00     ................
      b0:	dd 14 00 00 dd 14 00 00 dd 14 00 00 dd 14 00 00     ................
      c0:	dd 14 00 00 dd 14 00 00 dd 14 00 00 dd 14 00 00     ................
      d0:	dd 14 00 00 85 03 00 00 e5 0d 00 00 a5 03 00 00     ................
      e0:	dd 14 00 00 dd 14 00 00 dd 14 00 00 dd 14 00 00     ................
      f0:	dd 14 00 00 dd 14 00 00 dd 14 00 00 dd 14 00 00     ................
     100:	dd 14 00 00 dd 14 00 00 dd 14 00 00 dd 14 00 00     ................
     110:	dd 14 00 00 dd 14 00 00 dd 14 00 00 dd 14 00 00     ................
     120:	dd 14 00 00 dd 14 00 00 dd 14 00 00 dd 14 00 00     ................

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
     136:	4b1f      	ldr	r3, [pc, #124]	; (1b4 <startup+0x84>)
     138:	617b      	str	r3, [r7, #20]
    unsigned int * bss_end_p = &_BSS_END;
     13a:	4b1f      	ldr	r3, [pc, #124]	; (1b8 <startup+0x88>)
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
     154:	4b19      	ldr	r3, [pc, #100]	; (1bc <startup+0x8c>)
     156:	613b      	str	r3, [r7, #16]
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
     158:	4b19      	ldr	r3, [pc, #100]	; (1c0 <startup+0x90>)
     15a:	60fb      	str	r3, [r7, #12]
    unsigned int * data_ram_end_p = &_DATA_RAM_END;
     15c:	4b19      	ldr	r3, [pc, #100]	; (1c4 <startup+0x94>)
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
     17e:	4b12      	ldr	r3, [pc, #72]	; (1c8 <startup+0x98>)
     180:	f043 0301 	orr.w	r3, r3, #1
     184:	4a11      	ldr	r2, [pc, #68]	; (1cc <startup+0x9c>)
     186:	6013      	str	r3, [r2, #0]
	// active les interruptions et les fault handler
	*(sfrp_t)0xE000ED14=(1<<3)|(1<<4);
     188:	4b11      	ldr	r3, [pc, #68]	; (1d0 <startup+0xa0>)
     18a:	2218      	movs	r2, #24
     18c:	601a      	str	r2, [r3, #0]
    __enable_irq();
     18e:	b662      	cpsie	i
    __enable_fault_irq();
     190:	b661      	cpsie	f
    // initialisaton de la pile PSP et commutation 
    // vers cette pile.
    asm volatile(
     192:	4b10      	ldr	r3, [pc, #64]	; (1d4 <startup+0xa4>)
     194:	4618      	mov	r0, r3
     196:	f380 8809 	msr	PSP, r0
     19a:	f3ef 8014 	mrs	r0, CONTROL
     19e:	f040 0002 	orr.w	r0, r0, #2
     1a2:	f380 8814 	msr	CONTROL, r0
     1a6:	f3bf 8f6f 	isb	sy
    "msr CONTROL,r0\n"
    "isb\n"
    :: [psp_top] "r" (PSP_TOP)
    );
    /* Now we are ready to start the main function */
    main();
     1aa:	f000 fdd9 	bl	d60 <main>
}
     1ae:	3718      	adds	r7, #24
     1b0:	46bd      	mov	sp, r7
     1b2:	bd80      	pop	{r7, pc}
     1b4:	20000070 	.word	0x20000070
     1b8:	20000148 	.word	0x20000148
     1bc:	0000194c 	.word	0x0000194c
     1c0:	20000000 	.word	0x20000000
     1c4:	20000070 	.word	0x20000070
     1c8:	20000160 	.word	0x20000160
     1cc:	20000144 	.word	0x20000144
     1d0:	e000ed14 	.word	0xe000ed14
     1d4:	20004c00 	.word	0x20004c00

000001d8 <HARD_FAULT_handler>:
	print(", MMFSR=");
	print_hex(((*(sfrp_t)0xE000ED28)&0xff));
	while(1);
}

_exception(HARD_FAULT_handler){
     1d8:	4668      	mov	r0, sp
     1da:	f020 0107 	bic.w	r1, r0, #7
     1de:	468d      	mov	sp, r1
     1e0:	b589      	push	{r0, r3, r7, lr}
     1e2:	af00      	add	r7, sp, #0
	if ((*(sfrp_t)0xE000ED28)&0x7f){
     1e4:	4b12      	ldr	r3, [pc, #72]	; (230 <HARD_FAULT_handler+0x58>)
     1e6:	681b      	ldr	r3, [r3, #0]
     1e8:	f003 037f 	and.w	r3, r3, #127	; 0x7f
     1ec:	2b00      	cmp	r3, #0
     1ee:	d003      	beq.n	1f8 <HARD_FAULT_handler+0x20>
		print_fault("memory manager fault\n");
     1f0:	4810      	ldr	r0, [pc, #64]	; (234 <HARD_FAULT_handler+0x5c>)
     1f2:	f001 f945 	bl	1480 <print_fault>
     1f6:	e016      	b.n	226 <HARD_FAULT_handler+0x4e>
	}else if (((*(sfrp_t)0xE000ED28)&0xff00)){
     1f8:	4b0d      	ldr	r3, [pc, #52]	; (230 <HARD_FAULT_handler+0x58>)
     1fa:	681b      	ldr	r3, [r3, #0]
     1fc:	f403 437f 	and.w	r3, r3, #65280	; 0xff00
     200:	2b00      	cmp	r3, #0
     202:	d003      	beq.n	20c <HARD_FAULT_handler+0x34>
		print_fault("bus fault\n");
     204:	480c      	ldr	r0, [pc, #48]	; (238 <HARD_FAULT_handler+0x60>)
     206:	f001 f93b 	bl	1480 <print_fault>
     20a:	e00c      	b.n	226 <HARD_FAULT_handler+0x4e>
	}else if ((*(sfrp_t)0xE000ED28)&0xffff0000){
     20c:	4b08      	ldr	r3, [pc, #32]	; (230 <HARD_FAULT_handler+0x58>)
     20e:	681b      	ldr	r3, [r3, #0]
     210:	0c1b      	lsrs	r3, r3, #16
     212:	041b      	lsls	r3, r3, #16
     214:	2b00      	cmp	r3, #0
     216:	d003      	beq.n	220 <HARD_FAULT_handler+0x48>
		print_fault("usage fault\n");
     218:	4808      	ldr	r0, [pc, #32]	; (23c <HARD_FAULT_handler+0x64>)
     21a:	f001 f931 	bl	1480 <print_fault>
     21e:	e002      	b.n	226 <HARD_FAULT_handler+0x4e>
	}else{
		print_fault("hard fault\n");
     220:	4807      	ldr	r0, [pc, #28]	; (240 <HARD_FAULT_handler+0x68>)
     222:	f001 f92d 	bl	1480 <print_fault>
	}
}
     226:	46bd      	mov	sp, r7
     228:	e8bd 4089 	ldmia.w	sp!, {r0, r3, r7, lr}
     22c:	4685      	mov	sp, r0
     22e:	4770      	bx	lr
     230:	e000ed28 	.word	0xe000ed28
     234:	00001894 	.word	0x00001894
     238:	000018ac 	.word	0x000018ac
     23c:	000018b8 	.word	0x000018b8
     240:	000018c8 	.word	0x000018c8

00000244 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     244:	4b01      	ldr	r3, [pc, #4]	; (24c <NMI_handler+0x8>)
     246:	4a02      	ldr	r2, [pc, #8]	; (250 <NMI_handler+0xc>)
     248:	601a      	str	r2, [r3, #0]
     24a:	bf00      	nop
     24c:	e000ed0c 	.word	0xe000ed0c
     250:	05fa0004 	.word	0x05fa0004

00000254 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     254:	4b01      	ldr	r3, [pc, #4]	; (25c <MM_FAULT_handler+0x8>)
     256:	4a02      	ldr	r2, [pc, #8]	; (260 <MM_FAULT_handler+0xc>)
     258:	601a      	str	r2, [r3, #0]
     25a:	bf00      	nop
     25c:	e000ed0c 	.word	0xe000ed0c
     260:	05fa0004 	.word	0x05fa0004

00000264 <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     264:	4b01      	ldr	r3, [pc, #4]	; (26c <BUS_FAULT_handler+0x8>)
     266:	4a02      	ldr	r2, [pc, #8]	; (270 <BUS_FAULT_handler+0xc>)
     268:	601a      	str	r2, [r3, #0]
     26a:	bf00      	nop
     26c:	e000ed0c 	.word	0xe000ed0c
     270:	05fa0004 	.word	0x05fa0004

00000274 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     274:	4b01      	ldr	r3, [pc, #4]	; (27c <USAGE_FAULT_handler+0x8>)
     276:	4a02      	ldr	r2, [pc, #8]	; (280 <USAGE_FAULT_handler+0xc>)
     278:	601a      	str	r2, [r3, #0]
     27a:	bf00      	nop
     27c:	e000ed0c 	.word	0xe000ed0c
     280:	05fa0004 	.word	0x05fa0004
_default_handler(SVC_handler) // 11
     284:	4b01      	ldr	r3, [pc, #4]	; (28c <USAGE_FAULT_handler+0x18>)
     286:	4a02      	ldr	r2, [pc, #8]	; (290 <USAGE_FAULT_handler+0x1c>)
     288:	601a      	str	r2, [r3, #0]
     28a:	bf00      	nop
     28c:	e000ed0c 	.word	0xe000ed0c
     290:	05fa0004 	.word	0x05fa0004

00000294 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     294:	4b01      	ldr	r3, [pc, #4]	; (29c <PENDSV_handler+0x8>)
     296:	4a02      	ldr	r2, [pc, #8]	; (2a0 <PENDSV_handler+0xc>)
     298:	601a      	str	r2, [r3, #0]
     29a:	bf00      	nop
     29c:	e000ed0c 	.word	0xe000ed0c
     2a0:	05fa0004 	.word	0x05fa0004
_default_handler(STK_handler) // 15
     2a4:	4b01      	ldr	r3, [pc, #4]	; (2ac <PENDSV_handler+0x18>)
     2a6:	4a02      	ldr	r2, [pc, #8]	; (2b0 <PENDSV_handler+0x1c>)
     2a8:	601a      	str	r2, [r3, #0]
     2aa:	bf00      	nop
     2ac:	e000ed0c 	.word	0xe000ed0c
     2b0:	05fa0004 	.word	0x05fa0004

000002b4 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     2b4:	4b01      	ldr	r3, [pc, #4]	; (2bc <WWDG_handler+0x8>)
     2b6:	4a02      	ldr	r2, [pc, #8]	; (2c0 <WWDG_handler+0xc>)
     2b8:	601a      	str	r2, [r3, #0]
     2ba:	bf00      	nop
     2bc:	e000ed0c 	.word	0xe000ed0c
     2c0:	05fa0004 	.word	0x05fa0004

000002c4 <PVD_handler>:
_default_handler(PVD_handler) // 1
     2c4:	4b01      	ldr	r3, [pc, #4]	; (2cc <PVD_handler+0x8>)
     2c6:	4a02      	ldr	r2, [pc, #8]	; (2d0 <PVD_handler+0xc>)
     2c8:	601a      	str	r2, [r3, #0]
     2ca:	bf00      	nop
     2cc:	e000ed0c 	.word	0xe000ed0c
     2d0:	05fa0004 	.word	0x05fa0004

000002d4 <RTC_handler>:
_default_handler(RTC_handler) // 2
     2d4:	4b01      	ldr	r3, [pc, #4]	; (2dc <RTC_handler+0x8>)
     2d6:	4a02      	ldr	r2, [pc, #8]	; (2e0 <RTC_handler+0xc>)
     2d8:	601a      	str	r2, [r3, #0]
     2da:	bf00      	nop
     2dc:	e000ed0c 	.word	0xe000ed0c
     2e0:	05fa0004 	.word	0x05fa0004

000002e4 <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     2e4:	4b01      	ldr	r3, [pc, #4]	; (2ec <TAMPER_handler+0x8>)
     2e6:	4a02      	ldr	r2, [pc, #8]	; (2f0 <TAMPER_handler+0xc>)
     2e8:	601a      	str	r2, [r3, #0]
     2ea:	bf00      	nop
     2ec:	e000ed0c 	.word	0xe000ed0c
     2f0:	05fa0004 	.word	0x05fa0004

000002f4 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     2f4:	4b01      	ldr	r3, [pc, #4]	; (2fc <FLASH_handler+0x8>)
     2f6:	4a02      	ldr	r2, [pc, #8]	; (300 <FLASH_handler+0xc>)
     2f8:	601a      	str	r2, [r3, #0]
     2fa:	bf00      	nop
     2fc:	e000ed0c 	.word	0xe000ed0c
     300:	05fa0004 	.word	0x05fa0004

00000304 <RCC_handler>:
_default_handler(RCC_handler) // 5
     304:	4b01      	ldr	r3, [pc, #4]	; (30c <RCC_handler+0x8>)
     306:	4a02      	ldr	r2, [pc, #8]	; (310 <RCC_handler+0xc>)
     308:	601a      	str	r2, [r3, #0]
     30a:	bf00      	nop
     30c:	e000ed0c 	.word	0xe000ed0c
     310:	05fa0004 	.word	0x05fa0004

00000314 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     314:	4b01      	ldr	r3, [pc, #4]	; (31c <EXTI0_handler+0x8>)
     316:	4a02      	ldr	r2, [pc, #8]	; (320 <EXTI0_handler+0xc>)
     318:	601a      	str	r2, [r3, #0]
     31a:	bf00      	nop
     31c:	e000ed0c 	.word	0xe000ed0c
     320:	05fa0004 	.word	0x05fa0004

00000324 <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     324:	4b01      	ldr	r3, [pc, #4]	; (32c <EXTI1_handler+0x8>)
     326:	4a02      	ldr	r2, [pc, #8]	; (330 <EXTI1_handler+0xc>)
     328:	601a      	str	r2, [r3, #0]
     32a:	bf00      	nop
     32c:	e000ed0c 	.word	0xe000ed0c
     330:	05fa0004 	.word	0x05fa0004

00000334 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     334:	4b01      	ldr	r3, [pc, #4]	; (33c <EXTI2_handler+0x8>)
     336:	4a02      	ldr	r2, [pc, #8]	; (340 <EXTI2_handler+0xc>)
     338:	601a      	str	r2, [r3, #0]
     33a:	bf00      	nop
     33c:	e000ed0c 	.word	0xe000ed0c
     340:	05fa0004 	.word	0x05fa0004

00000344 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     344:	4b01      	ldr	r3, [pc, #4]	; (34c <EXTI3_handler+0x8>)
     346:	4a02      	ldr	r2, [pc, #8]	; (350 <EXTI3_handler+0xc>)
     348:	601a      	str	r2, [r3, #0]
     34a:	bf00      	nop
     34c:	e000ed0c 	.word	0xe000ed0c
     350:	05fa0004 	.word	0x05fa0004

00000354 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     354:	4b01      	ldr	r3, [pc, #4]	; (35c <EXTI4_handler+0x8>)
     356:	4a02      	ldr	r2, [pc, #8]	; (360 <EXTI4_handler+0xc>)
     358:	601a      	str	r2, [r3, #0]
     35a:	bf00      	nop
     35c:	e000ed0c 	.word	0xe000ed0c
     360:	05fa0004 	.word	0x05fa0004

00000364 <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     364:	4b01      	ldr	r3, [pc, #4]	; (36c <DMA1CH1_handler+0x8>)
     366:	4a02      	ldr	r2, [pc, #8]	; (370 <DMA1CH1_handler+0xc>)
     368:	601a      	str	r2, [r3, #0]
     36a:	bf00      	nop
     36c:	e000ed0c 	.word	0xe000ed0c
     370:	05fa0004 	.word	0x05fa0004

00000374 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     374:	4b01      	ldr	r3, [pc, #4]	; (37c <DMA1CH2_handler+0x8>)
     376:	4a02      	ldr	r2, [pc, #8]	; (380 <DMA1CH2_handler+0xc>)
     378:	601a      	str	r2, [r3, #0]
     37a:	bf00      	nop
     37c:	e000ed0c 	.word	0xe000ed0c
     380:	05fa0004 	.word	0x05fa0004

00000384 <USART1_handler>:

_default_handler(USART1_handler) // 37
     384:	4b01      	ldr	r3, [pc, #4]	; (38c <USART1_handler+0x8>)
     386:	4a02      	ldr	r2, [pc, #8]	; (390 <USART1_handler+0xc>)
     388:	601a      	str	r2, [r3, #0]
     38a:	bf00      	nop
     38c:	e000ed0c 	.word	0xe000ed0c
     390:	05fa0004 	.word	0x05fa0004
_default_handler(USART2_handler) // 38
     394:	4b01      	ldr	r3, [pc, #4]	; (39c <USART1_handler+0x18>)
     396:	4a02      	ldr	r2, [pc, #8]	; (3a0 <USART1_handler+0x1c>)
     398:	601a      	str	r2, [r3, #0]
     39a:	bf00      	nop
     39c:	e000ed0c 	.word	0xe000ed0c
     3a0:	05fa0004 	.word	0x05fa0004

000003a4 <USART3_handler>:
_default_handler(USART3_handler) // 39
     3a4:	4b01      	ldr	r3, [pc, #4]	; (3ac <USART3_handler+0x8>)
     3a6:	4a02      	ldr	r2, [pc, #8]	; (3b0 <USART3_handler+0xc>)
     3a8:	601a      	str	r2, [r3, #0]
     3aa:	bf00      	nop
     3ac:	e000ed0c 	.word	0xe000ed0c
     3b0:	05fa0004 	.word	0x05fa0004

000003b4 <strcmp>:
extern unsigned int _FLASH_FREE;
extern unsigned int _DATA_ROM_START;

uint32_t proga;

int strcmp(const char * s1, const char * s2){
     3b4:	b480      	push	{r7}
     3b6:	b085      	sub	sp, #20
     3b8:	af00      	add	r7, sp, #0
     3ba:	6078      	str	r0, [r7, #4]
     3bc:	6039      	str	r1, [r7, #0]
	int result=0;
     3be:	2300      	movs	r3, #0
     3c0:	60fb      	str	r3, [r7, #12]
	while (*s1 && *s2){
     3c2:	e018      	b.n	3f6 <strcmp+0x42>
		if (*s1<*s2){
     3c4:	687b      	ldr	r3, [r7, #4]
     3c6:	781a      	ldrb	r2, [r3, #0]
     3c8:	683b      	ldr	r3, [r7, #0]
     3ca:	781b      	ldrb	r3, [r3, #0]
     3cc:	429a      	cmp	r2, r3
     3ce:	d203      	bcs.n	3d8 <strcmp+0x24>
			result=-1;
     3d0:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     3d4:	60fb      	str	r3, [r7, #12]
			break;
     3d6:	e016      	b.n	406 <strcmp+0x52>
		}else if (*s1>*s2){
     3d8:	687b      	ldr	r3, [r7, #4]
     3da:	781a      	ldrb	r2, [r3, #0]
     3dc:	683b      	ldr	r3, [r7, #0]
     3de:	781b      	ldrb	r3, [r3, #0]
     3e0:	429a      	cmp	r2, r3
     3e2:	d902      	bls.n	3ea <strcmp+0x36>
			result=1;
     3e4:	2301      	movs	r3, #1
     3e6:	60fb      	str	r3, [r7, #12]
			break;
     3e8:	e00d      	b.n	406 <strcmp+0x52>
		}
		s1++;
     3ea:	687b      	ldr	r3, [r7, #4]
     3ec:	3301      	adds	r3, #1
     3ee:	607b      	str	r3, [r7, #4]
		s2++;
     3f0:	683b      	ldr	r3, [r7, #0]
     3f2:	3301      	adds	r3, #1
     3f4:	603b      	str	r3, [r7, #0]

uint32_t proga;

int strcmp(const char * s1, const char * s2){
	int result=0;
	while (*s1 && *s2){
     3f6:	687b      	ldr	r3, [r7, #4]
     3f8:	781b      	ldrb	r3, [r3, #0]
     3fa:	2b00      	cmp	r3, #0
     3fc:	d003      	beq.n	406 <strcmp+0x52>
     3fe:	683b      	ldr	r3, [r7, #0]
     400:	781b      	ldrb	r3, [r3, #0]
     402:	2b00      	cmp	r3, #0
     404:	d1de      	bne.n	3c4 <strcmp+0x10>
			break;
		}
		s1++;
		s2++;
	}
	if (!result){
     406:	68fb      	ldr	r3, [r7, #12]
     408:	2b00      	cmp	r3, #0
     40a:	d115      	bne.n	438 <strcmp+0x84>
		if (!*s1 && *s2){
     40c:	687b      	ldr	r3, [r7, #4]
     40e:	781b      	ldrb	r3, [r3, #0]
     410:	2b00      	cmp	r3, #0
     412:	d107      	bne.n	424 <strcmp+0x70>
     414:	683b      	ldr	r3, [r7, #0]
     416:	781b      	ldrb	r3, [r3, #0]
     418:	2b00      	cmp	r3, #0
     41a:	d003      	beq.n	424 <strcmp+0x70>
			result=-1;
     41c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     420:	60fb      	str	r3, [r7, #12]
     422:	e009      	b.n	438 <strcmp+0x84>
		}else if (*s1 && !*s2) {
     424:	687b      	ldr	r3, [r7, #4]
     426:	781b      	ldrb	r3, [r3, #0]
     428:	2b00      	cmp	r3, #0
     42a:	d005      	beq.n	438 <strcmp+0x84>
     42c:	683b      	ldr	r3, [r7, #0]
     42e:	781b      	ldrb	r3, [r3, #0]
     430:	2b00      	cmp	r3, #0
     432:	d101      	bne.n	438 <strcmp+0x84>
			result=1;
     434:	2301      	movs	r3, #1
     436:	60fb      	str	r3, [r7, #12]
		}
	}
	return result;
     438:	68fb      	ldr	r3, [r7, #12]
}
     43a:	4618      	mov	r0, r3
     43c:	3714      	adds	r7, #20
     43e:	46bd      	mov	sp, r7
     440:	f85d 7b04 	ldr.w	r7, [sp], #4
     444:	4770      	bx	lr
     446:	bf00      	nop

00000448 <digit>:

int digit(char c){
     448:	b480      	push	{r7}
     44a:	b083      	sub	sp, #12
     44c:	af00      	add	r7, sp, #0
     44e:	4603      	mov	r3, r0
     450:	71fb      	strb	r3, [r7, #7]
   return ((c>='0') && (c<='9'));
     452:	79fb      	ldrb	r3, [r7, #7]
     454:	2b2f      	cmp	r3, #47	; 0x2f
     456:	d904      	bls.n	462 <digit+0x1a>
     458:	79fb      	ldrb	r3, [r7, #7]
     45a:	2b39      	cmp	r3, #57	; 0x39
     45c:	d801      	bhi.n	462 <digit+0x1a>
     45e:	2301      	movs	r3, #1
     460:	e000      	b.n	464 <digit+0x1c>
     462:	2300      	movs	r3, #0
}
     464:	4618      	mov	r0, r3
     466:	370c      	adds	r7, #12
     468:	46bd      	mov	sp, r7
     46a:	f85d 7b04 	ldr.w	r7, [sp], #4
     46e:	4770      	bx	lr

00000470 <hexdigit>:

int hexdigit(char c){
     470:	b580      	push	{r7, lr}
     472:	b082      	sub	sp, #8
     474:	af00      	add	r7, sp, #0
     476:	4603      	mov	r3, r0
     478:	71fb      	strb	r3, [r7, #7]
	if (c>='a') c-=32;
     47a:	79fb      	ldrb	r3, [r7, #7]
     47c:	2b60      	cmp	r3, #96	; 0x60
     47e:	d902      	bls.n	486 <hexdigit+0x16>
     480:	79fb      	ldrb	r3, [r7, #7]
     482:	3b20      	subs	r3, #32
     484:	71fb      	strb	r3, [r7, #7]
	return (digit(c) || (c>='A' && c<='F'));
     486:	79fb      	ldrb	r3, [r7, #7]
     488:	4618      	mov	r0, r3
     48a:	f7ff ffdd 	bl	448 <digit>
     48e:	4603      	mov	r3, r0
     490:	2b00      	cmp	r3, #0
     492:	d105      	bne.n	4a0 <hexdigit+0x30>
     494:	79fb      	ldrb	r3, [r7, #7]
     496:	2b40      	cmp	r3, #64	; 0x40
     498:	d904      	bls.n	4a4 <hexdigit+0x34>
     49a:	79fb      	ldrb	r3, [r7, #7]
     49c:	2b46      	cmp	r3, #70	; 0x46
     49e:	d801      	bhi.n	4a4 <hexdigit+0x34>
     4a0:	2301      	movs	r3, #1
     4a2:	e000      	b.n	4a6 <hexdigit+0x36>
     4a4:	2300      	movs	r3, #0
}
     4a6:	4618      	mov	r0, r3
     4a8:	3708      	adds	r7, #8
     4aa:	46bd      	mov	sp, r7
     4ac:	bd80      	pop	{r7, pc}
     4ae:	bf00      	nop

000004b0 <atoi>:

int atoi(const char *str){
     4b0:	b580      	push	{r7, lr}
     4b2:	b086      	sub	sp, #24
     4b4:	af00      	add	r7, sp, #0
     4b6:	6078      	str	r0, [r7, #4]
	int n=0,sign=1,base=10;
     4b8:	2300      	movs	r3, #0
     4ba:	617b      	str	r3, [r7, #20]
     4bc:	2301      	movs	r3, #1
     4be:	613b      	str	r3, [r7, #16]
     4c0:	230a      	movs	r3, #10
     4c2:	60fb      	str	r3, [r7, #12]
    char c;
    
	while (*str && (*str==SPACE)) str++;
     4c4:	e002      	b.n	4cc <atoi+0x1c>
     4c6:	687b      	ldr	r3, [r7, #4]
     4c8:	3301      	adds	r3, #1
     4ca:	607b      	str	r3, [r7, #4]
     4cc:	687b      	ldr	r3, [r7, #4]
     4ce:	781b      	ldrb	r3, [r3, #0]
     4d0:	2b00      	cmp	r3, #0
     4d2:	d003      	beq.n	4dc <atoi+0x2c>
     4d4:	687b      	ldr	r3, [r7, #4]
     4d6:	781b      	ldrb	r3, [r3, #0]
     4d8:	2b20      	cmp	r3, #32
     4da:	d0f4      	beq.n	4c6 <atoi+0x16>
	if (*str=='-'){
     4dc:	687b      	ldr	r3, [r7, #4]
     4de:	781b      	ldrb	r3, [r3, #0]
     4e0:	2b2d      	cmp	r3, #45	; 0x2d
     4e2:	d105      	bne.n	4f0 <atoi+0x40>
		sign=-1;
     4e4:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     4e8:	613b      	str	r3, [r7, #16]
		str++;
     4ea:	687b      	ldr	r3, [r7, #4]
     4ec:	3301      	adds	r3, #1
     4ee:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
     4f0:	687b      	ldr	r3, [r7, #4]
     4f2:	781b      	ldrb	r3, [r3, #0]
     4f4:	2b30      	cmp	r3, #48	; 0x30
     4f6:	d10e      	bne.n	516 <atoi+0x66>
     4f8:	687b      	ldr	r3, [r7, #4]
     4fa:	3301      	adds	r3, #1
     4fc:	781b      	ldrb	r3, [r3, #0]
     4fe:	2b78      	cmp	r3, #120	; 0x78
     500:	d004      	beq.n	50c <atoi+0x5c>
     502:	687b      	ldr	r3, [r7, #4]
     504:	3301      	adds	r3, #1
     506:	781b      	ldrb	r3, [r3, #0]
     508:	2b58      	cmp	r3, #88	; 0x58
     50a:	d104      	bne.n	516 <atoi+0x66>
		base=16;
     50c:	2310      	movs	r3, #16
     50e:	60fb      	str	r3, [r7, #12]
		str+=2;
     510:	687b      	ldr	r3, [r7, #4]
     512:	3302      	adds	r3, #2
     514:	607b      	str	r3, [r7, #4]
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     516:	e018      	b.n	54a <atoi+0x9a>
		if (c>='a'){c-=32;}
     518:	7afb      	ldrb	r3, [r7, #11]
     51a:	2b60      	cmp	r3, #96	; 0x60
     51c:	d902      	bls.n	524 <atoi+0x74>
     51e:	7afb      	ldrb	r3, [r7, #11]
     520:	3b20      	subs	r3, #32
     522:	72fb      	strb	r3, [r7, #11]
		c-='0';
     524:	7afb      	ldrb	r3, [r7, #11]
     526:	3b30      	subs	r3, #48	; 0x30
     528:	72fb      	strb	r3, [r7, #11]
		if (c>9){c-=7;}
     52a:	7afb      	ldrb	r3, [r7, #11]
     52c:	2b09      	cmp	r3, #9
     52e:	d902      	bls.n	536 <atoi+0x86>
     530:	7afb      	ldrb	r3, [r7, #11]
     532:	3b07      	subs	r3, #7
     534:	72fb      	strb	r3, [r7, #11]
		n=n*base+c;
     536:	697b      	ldr	r3, [r7, #20]
     538:	68fa      	ldr	r2, [r7, #12]
     53a:	fb02 f203 	mul.w	r2, r2, r3
     53e:	7afb      	ldrb	r3, [r7, #11]
     540:	4413      	add	r3, r2
     542:	617b      	str	r3, [r7, #20]
		str++;
     544:	687b      	ldr	r3, [r7, #4]
     546:	3301      	adds	r3, #1
     548:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
		base=16;
		str+=2;
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     54a:	687b      	ldr	r3, [r7, #4]
     54c:	781b      	ldrb	r3, [r3, #0]
     54e:	72fb      	strb	r3, [r7, #11]
     550:	7afb      	ldrb	r3, [r7, #11]
     552:	2b00      	cmp	r3, #0
     554:	d00d      	beq.n	572 <atoi+0xc2>
     556:	68fb      	ldr	r3, [r7, #12]
     558:	2b0a      	cmp	r3, #10
     55a:	d10a      	bne.n	572 <atoi+0xc2>
     55c:	7afb      	ldrb	r3, [r7, #11]
     55e:	4618      	mov	r0, r3
     560:	f7ff ff72 	bl	448 <digit>
     564:	4603      	mov	r3, r0
     566:	2b00      	cmp	r3, #0
     568:	bf14      	ite	ne
     56a:	2301      	movne	r3, #1
     56c:	2300      	moveq	r3, #0
     56e:	b2db      	uxtb	r3, r3
     570:	e009      	b.n	586 <atoi+0xd6>
     572:	7afb      	ldrb	r3, [r7, #11]
     574:	4618      	mov	r0, r3
     576:	f7ff ff7b 	bl	470 <hexdigit>
     57a:	4603      	mov	r3, r0
     57c:	2b00      	cmp	r3, #0
     57e:	bf14      	ite	ne
     580:	2301      	movne	r3, #1
     582:	2300      	moveq	r3, #0
     584:	b2db      	uxtb	r3, r3
     586:	2b00      	cmp	r3, #0
     588:	d1c6      	bne.n	518 <atoi+0x68>
		c-='0';
		if (c>9){c-=7;}
		n=n*base+c;
		str++;
	}
	return sign*n;
     58a:	693b      	ldr	r3, [r7, #16]
     58c:	697a      	ldr	r2, [r7, #20]
     58e:	fb02 f303 	mul.w	r3, r2, r3
}
     592:	4618      	mov	r0, r3
     594:	3718      	adds	r7, #24
     596:	46bd      	mov	sp, r7
     598:	bd80      	pop	{r7, pc}
     59a:	bf00      	nop

0000059c <SVC_handler>:
static void move(char *src , char *dest, int len);
static void word();



void __attribute__((__interrupt__)) SVC_handler(){
     59c:	4668      	mov	r0, sp
     59e:	f020 0107 	bic.w	r1, r0, #7
     5a2:	468d      	mov	sp, r1
     5a4:	b581      	push	{r0, r7, lr}
     5a6:	b085      	sub	sp, #20
     5a8:	af00      	add	r7, sp, #0
	int svc_id;
	void *arg1, *argv; 
	asm volatile (
     5aa:	f3ef 8009 	mrs	r0, PSP
     5ae:	6981      	ldr	r1, [r0, #24]
     5b0:	f811 1c02 	ldrb.w	r1, [r1, #-2]
     5b4:	6802      	ldr	r2, [r0, #0]
     5b6:	6843      	ldr	r3, [r0, #4]
     5b8:	60f9      	str	r1, [r7, #12]
     5ba:	60ba      	str	r2, [r7, #8]
     5bc:	607b      	str	r3, [r7, #4]
    "ldrb %[svc_id], [r1,#-2]\n" // charge l'octet faible i.e. no de service
    "ldr %[arg1],[r0]\n"
    "ldr %[argv],[r0,#4]\n"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [argv] "=r" (argv) 
    );
	switch (svc_id){
     5be:	68fb      	ldr	r3, [r7, #12]
     5c0:	2b11      	cmp	r3, #17
     5c2:	f200 8096 	bhi.w	6f2 <SVC_handler+0x156>
     5c6:	a201      	add	r2, pc, #4	; (adr r2, 5cc <SVC_handler+0x30>)
     5c8:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     5cc:	000006eb 	.word	0x000006eb
     5d0:	00000615 	.word	0x00000615
     5d4:	00000621 	.word	0x00000621
     5d8:	0000062d 	.word	0x0000062d
     5dc:	00000637 	.word	0x00000637
     5e0:	00000641 	.word	0x00000641
     5e4:	0000064d 	.word	0x0000064d
     5e8:	0000065b 	.word	0x0000065b
     5ec:	00000667 	.word	0x00000667
     5f0:	0000067b 	.word	0x0000067b
     5f4:	00000683 	.word	0x00000683
     5f8:	00000691 	.word	0x00000691
     5fc:	0000069d 	.word	0x0000069d
     600:	000006a9 	.word	0x000006a9
     604:	000006b5 	.word	0x000006b5
     608:	000006c1 	.word	0x000006c1
     60c:	000006cf 	.word	0x000006cf
     610:	000006dd 	.word	0x000006dd
	case SVC_LED_ON: 
		GPIOC_BRR->brr=GRN_LED;
     614:	4b3a      	ldr	r3, [pc, #232]	; (700 <SVC_handler+0x164>)
     616:	681b      	ldr	r3, [r3, #0]
     618:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     61c:	601a      	str	r2, [r3, #0]
		break;
     61e:	e068      	b.n	6f2 <SVC_handler+0x156>
	case SVC_LED_OFF:
		GPIOC_BSRR->bsrr=GRN_LED;
     620:	4b38      	ldr	r3, [pc, #224]	; (704 <SVC_handler+0x168>)
     622:	681b      	ldr	r3, [r3, #0]
     624:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     628:	601a      	str	r2, [r3, #0]
		break;
     62a:	e062      	b.n	6f2 <SVC_handler+0x156>
	case SVC_TIMER: 
		timer=*(unsigned*)arg1;
     62c:	68bb      	ldr	r3, [r7, #8]
     62e:	681b      	ldr	r3, [r3, #0]
     630:	4a35      	ldr	r2, [pc, #212]	; (708 <SVC_handler+0x16c>)
     632:	6013      	str	r3, [r2, #0]
		break;
     634:	e05d      	b.n	6f2 <SVC_handler+0x156>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=timer;
     636:	4b34      	ldr	r3, [pc, #208]	; (708 <SVC_handler+0x16c>)
     638:	681a      	ldr	r2, [r3, #0]
     63a:	68bb      	ldr	r3, [r7, #8]
     63c:	601a      	str	r2, [r3, #0]
		break;
     63e:	e058      	b.n	6f2 <SVC_handler+0x156>
	case SVC_WAIT_TIMER:
		while (timer);
     640:	bf00      	nop
     642:	4b31      	ldr	r3, [pc, #196]	; (708 <SVC_handler+0x16c>)
     644:	681b      	ldr	r3, [r3, #0]
     646:	2b00      	cmp	r3, #0
     648:	d1fb      	bne.n	642 <SVC_handler+0xa6>
		break;
     64a:	e052      	b.n	6f2 <SVC_handler+0x156>
	case SVC_CONIN:
		*(char *)arg1=conin();
     64c:	f000 fc04 	bl	e58 <conin>
     650:	4603      	mov	r3, r0
     652:	461a      	mov	r2, r3
     654:	68bb      	ldr	r3, [r7, #8]
     656:	701a      	strb	r2, [r3, #0]
		break;
     658:	e04b      	b.n	6f2 <SVC_handler+0x156>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     65a:	68bb      	ldr	r3, [r7, #8]
     65c:	781b      	ldrb	r3, [r3, #0]
     65e:	4618      	mov	r0, r3
     660:	f000 fbea 	bl	e38 <conout>
		break;
     664:	e045      	b.n	6f2 <SVC_handler+0x156>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)argv,*(unsigned *)arg1);
     666:	68bb      	ldr	r3, [r7, #8]
     668:	681b      	ldr	r3, [r3, #0]
     66a:	6878      	ldr	r0, [r7, #4]
     66c:	4619      	mov	r1, r3
     66e:	f000 fc6b 	bl	f48 <read_line>
     672:	4602      	mov	r2, r0
     674:	68bb      	ldr	r3, [r7, #8]
     676:	601a      	str	r2, [r3, #0]
		break;
     678:	e03b      	b.n	6f2 <SVC_handler+0x156>
	case SVC_PRINT:
		print((const char*)arg1);
     67a:	68b8      	ldr	r0, [r7, #8]
     67c:	f000 fc0e 	bl	e9c <print>
		break;
     680:	e037      	b.n	6f2 <SVC_handler+0x156>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     682:	68bb      	ldr	r3, [r7, #8]
     684:	681b      	ldr	r3, [r3, #0]
     686:	4618      	mov	r0, r3
     688:	210a      	movs	r1, #10
     68a:	f000 fd07 	bl	109c <print_int>
		break;
     68e:	e030      	b.n	6f2 <SVC_handler+0x156>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     690:	68bb      	ldr	r3, [r7, #8]
     692:	681b      	ldr	r3, [r3, #0]
     694:	4618      	mov	r0, r3
     696:	f000 fd6f 	bl	1178 <print_hex>
		break;
     69a:	e02a      	b.n	6f2 <SVC_handler+0x156>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=*(uint8_t*)(*(uint32_t*)arg1);
     69c:	68bb      	ldr	r3, [r7, #8]
     69e:	681b      	ldr	r3, [r3, #0]
     6a0:	781a      	ldrb	r2, [r3, #0]
     6a2:	68bb      	ldr	r3, [r7, #8]
     6a4:	701a      	strb	r2, [r3, #0]
		break;
     6a6:	e024      	b.n	6f2 <SVC_handler+0x156>
	case SVC_PEEK16:
		*(uint16_t*)arg1=*(uint16_t*)(*(uint32_t*)arg1);
     6a8:	68bb      	ldr	r3, [r7, #8]
     6aa:	681b      	ldr	r3, [r3, #0]
     6ac:	881a      	ldrh	r2, [r3, #0]
     6ae:	68bb      	ldr	r3, [r7, #8]
     6b0:	801a      	strh	r2, [r3, #0]
		break;
     6b2:	e01e      	b.n	6f2 <SVC_handler+0x156>
	case SVC_PEEK32:
		*(uint32_t*)arg1=*(uint32_t*)(*(uint32_t*)arg1);
     6b4:	68bb      	ldr	r3, [r7, #8]
     6b6:	681b      	ldr	r3, [r3, #0]
     6b8:	681a      	ldr	r2, [r3, #0]
     6ba:	68bb      	ldr	r3, [r7, #8]
     6bc:	601a      	str	r2, [r3, #0]
		break;
     6be:	e018      	b.n	6f2 <SVC_handler+0x156>
	case SVC_POKE8:
		*(uint8_t*)(*(uint32_t*)arg1)=*(uint8_t*)argv;
     6c0:	68bb      	ldr	r3, [r7, #8]
     6c2:	681b      	ldr	r3, [r3, #0]
     6c4:	461a      	mov	r2, r3
     6c6:	687b      	ldr	r3, [r7, #4]
     6c8:	781b      	ldrb	r3, [r3, #0]
     6ca:	7013      	strb	r3, [r2, #0]
		break;
     6cc:	e011      	b.n	6f2 <SVC_handler+0x156>
	case SVC_POKE16:
		*(uint16_t*)(*(uint32_t*)arg1)=*(uint16_t*)argv;
     6ce:	68bb      	ldr	r3, [r7, #8]
     6d0:	681b      	ldr	r3, [r3, #0]
     6d2:	461a      	mov	r2, r3
     6d4:	687b      	ldr	r3, [r7, #4]
     6d6:	881b      	ldrh	r3, [r3, #0]
     6d8:	8013      	strh	r3, [r2, #0]
		break;
     6da:	e00a      	b.n	6f2 <SVC_handler+0x156>
	case SVC_POKE32:
		*(uint32_t*)(*(uint32_t*)arg1)=*(uint32_t*)argv;
     6dc:	68bb      	ldr	r3, [r7, #8]
     6de:	681b      	ldr	r3, [r3, #0]
     6e0:	461a      	mov	r2, r3
     6e2:	687b      	ldr	r3, [r7, #4]
     6e4:	681b      	ldr	r3, [r3, #0]
     6e6:	6013      	str	r3, [r2, #0]
		break;
     6e8:	e003      	b.n	6f2 <SVC_handler+0x156>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    _reset_mcu();
     6ea:	4b08      	ldr	r3, [pc, #32]	; (70c <SVC_handler+0x170>)
     6ec:	4a08      	ldr	r2, [pc, #32]	; (710 <SVC_handler+0x174>)
     6ee:	601a      	str	r2, [r3, #0]
	    break;
     6f0:	bf00      	nop
	}	
}
     6f2:	3714      	adds	r7, #20
     6f4:	46bd      	mov	sp, r7
     6f6:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     6fa:	4685      	mov	sp, r0
     6fc:	4770      	bx	lr
     6fe:	bf00      	nop
     700:	2000005c 	.word	0x2000005c
     704:	20000058 	.word	0x20000058
     708:	20000074 	.word	0x20000074
     70c:	e000ed0c 	.word	0xe000ed0c
     710:	05fa0004 	.word	0x05fa0004

00000714 <STK_handler>:

// interruption coretimer
void __attribute__((naked)) STK_handler(){
	ticks++;
     714:	4b06      	ldr	r3, [pc, #24]	; (730 <STK_handler+0x1c>)
     716:	681b      	ldr	r3, [r3, #0]
     718:	3301      	adds	r3, #1
     71a:	4a05      	ldr	r2, [pc, #20]	; (730 <STK_handler+0x1c>)
     71c:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
     71e:	4b05      	ldr	r3, [pc, #20]	; (734 <STK_handler+0x20>)
     720:	681b      	ldr	r3, [r3, #0]
     722:	2b00      	cmp	r3, #0
     724:	d004      	beq.n	730 <STK_handler+0x1c>
     726:	4b03      	ldr	r3, [pc, #12]	; (734 <STK_handler+0x20>)
     728:	681b      	ldr	r3, [r3, #0]
     72a:	3b01      	subs	r3, #1
     72c:	4a01      	ldr	r2, [pc, #4]	; (734 <STK_handler+0x20>)
     72e:	6013      	str	r3, [r2, #0]
     730:	20000070 	.word	0x20000070
     734:	20000074 	.word	0x20000074

00000738 <set_sysclock>:
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     738:	b480      	push	{r7}
     73a:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC_CR|=1<<RCC_CR_HSEON;
     73c:	4a1a      	ldr	r2, [pc, #104]	; (7a8 <set_sysclock+0x70>)
     73e:	4b1a      	ldr	r3, [pc, #104]	; (7a8 <set_sysclock+0x70>)
     740:	681b      	ldr	r3, [r3, #0]
     742:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     746:	6013      	str	r3, [r2, #0]
	 // attend que l'oscillateur soit prêt
   while (! (RCC_CR & (1<<RCC_CR_HSERDY)));
     748:	bf00      	nop
     74a:	4b17      	ldr	r3, [pc, #92]	; (7a8 <set_sysclock+0x70>)
     74c:	681b      	ldr	r3, [r3, #0]
     74e:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
     752:	2b00      	cmp	r3, #0
     754:	d0f9      	beq.n	74a <set_sysclock+0x12>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
     756:	4a15      	ldr	r2, [pc, #84]	; (7ac <set_sysclock+0x74>)
     758:	4b14      	ldr	r3, [pc, #80]	; (7ac <set_sysclock+0x74>)
     75a:	681b      	ldr	r3, [r3, #0]
     75c:	f443 13e8 	orr.w	r3, r3, #1900544	; 0x1d0000
     760:	6013      	str	r3, [r2, #0]
    // active le PLL
    RCC_CR|=1<<RCC_CR_PLLON;
     762:	4a11      	ldr	r2, [pc, #68]	; (7a8 <set_sysclock+0x70>)
     764:	4b10      	ldr	r3, [pc, #64]	; (7a8 <set_sysclock+0x70>)
     766:	681b      	ldr	r3, [r3, #0]
     768:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
     76c:	6013      	str	r3, [r2, #0]
    // Attend que le PLL soit prêt
    while (! (RCC_CR & (1<<RCC_CR_PLLRDY)));
     76e:	bf00      	nop
     770:	4b0d      	ldr	r3, [pc, #52]	; (7a8 <set_sysclock+0x70>)
     772:	681b      	ldr	r3, [r3, #0]
     774:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
     778:	2b00      	cmp	r3, #0
     77a:	d0f9      	beq.n	770 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR|=WAIT_2_CY;
     77c:	4a0c      	ldr	r2, [pc, #48]	; (7b0 <set_sysclock+0x78>)
     77e:	4b0c      	ldr	r3, [pc, #48]	; (7b0 <set_sysclock+0x78>)
     780:	681b      	ldr	r3, [r3, #0]
     782:	f043 0302 	orr.w	r3, r3, #2
     786:	6013      	str	r3, [r2, #0]
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR|=PLL_CLK<<RCC_CFGR_SW;
     788:	4a08      	ldr	r2, [pc, #32]	; (7ac <set_sysclock+0x74>)
     78a:	4b08      	ldr	r3, [pc, #32]	; (7ac <set_sysclock+0x74>)
     78c:	681b      	ldr	r3, [r3, #0]
     78e:	f043 0302 	orr.w	r3, r3, #2
     792:	6013      	str	r3, [r2, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR|=PPRECLK_DIV2<<RCC_CFGR_PPRE1;
     794:	4a05      	ldr	r2, [pc, #20]	; (7ac <set_sysclock+0x74>)
     796:	4b05      	ldr	r3, [pc, #20]	; (7ac <set_sysclock+0x74>)
     798:	681b      	ldr	r3, [r3, #0]
     79a:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     79e:	6013      	str	r3, [r2, #0]
}
     7a0:	46bd      	mov	sp, r7
     7a2:	f85d 7b04 	ldr.w	r7, [sp], #4
     7a6:	4770      	bx	lr
     7a8:	40021000 	.word	0x40021000
     7ac:	40021004 	.word	0x40021004
     7b0:	40022000 	.word	0x40022000

000007b4 <config_systicks>:

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
     7b4:	b480      	push	{r7}
     7b6:	af00      	add	r7, sp, #0
	STK_LOAD=MSEC_DLY-1;
     7b8:	4b05      	ldr	r3, [pc, #20]	; (7d0 <config_systicks+0x1c>)
     7ba:	f242 3227 	movw	r2, #8999	; 0x2327
     7be:	601a      	str	r2, [r3, #0]
	STK_CTRL=(1<<STK_TICKINT)|(1<<STK_ENABLE);
     7c0:	4b04      	ldr	r3, [pc, #16]	; (7d4 <config_systicks+0x20>)
     7c2:	2203      	movs	r2, #3
     7c4:	601a      	str	r2, [r3, #0]
}
     7c6:	46bd      	mov	sp, r7
     7c8:	f85d 7b04 	ldr.w	r7, [sp], #4
     7cc:	4770      	bx	lr
     7ce:	bf00      	nop
     7d0:	e000e014 	.word	0xe000e014
     7d4:	e000e010 	.word	0xe000e010

000007d8 <port_c_setup>:

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
     7d8:	b480      	push	{r7}
     7da:	af00      	add	r7, sp, #0
	RCC_APB2ENR|=1<<GPIOC_EN;
     7dc:	4a06      	ldr	r2, [pc, #24]	; (7f8 <port_c_setup+0x20>)
     7de:	4b06      	ldr	r3, [pc, #24]	; (7f8 <port_c_setup+0x20>)
     7e0:	681b      	ldr	r3, [r3, #0]
     7e2:	f043 0310 	orr.w	r3, r3, #16
     7e6:	6013      	str	r3, [r2, #0]
	GPIOC_CRH->cr=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
     7e8:	4b04      	ldr	r3, [pc, #16]	; (7fc <port_c_setup+0x24>)
     7ea:	681b      	ldr	r3, [r3, #0]
     7ec:	4a04      	ldr	r2, [pc, #16]	; (800 <port_c_setup+0x28>)
     7ee:	601a      	str	r2, [r3, #0]
}
     7f0:	46bd      	mov	sp, r7
     7f2:	f85d 7b04 	ldr.w	r7, [sp], #4
     7f6:	4770      	bx	lr
     7f8:	40021018 	.word	0x40021018
     7fc:	20000048 	.word	0x20000048
     800:	44644444 	.word	0x44644444

00000804 <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     804:	b480      	push	{r7}
     806:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     808:	2300      	movs	r3, #0
     80a:	2200      	movs	r2, #0
     80c:	4618      	mov	r0, r3
     80e:	4611      	mov	r1, r2
     810:	df00      	svc	0
}
     812:	46bd      	mov	sp, r7
     814:	f85d 7b04 	ldr.w	r7, [sp], #4
     818:	4770      	bx	lr
     81a:	bf00      	nop

0000081c <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     81c:	b480      	push	{r7}
     81e:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     820:	2300      	movs	r3, #0
     822:	2200      	movs	r2, #0
     824:	4618      	mov	r0, r3
     826:	4611      	mov	r1, r2
     828:	df01      	svc	1
}
     82a:	46bd      	mov	sp, r7
     82c:	f85d 7b04 	ldr.w	r7, [sp], #4
     830:	4770      	bx	lr
     832:	bf00      	nop

00000834 <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     834:	b480      	push	{r7}
     836:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     838:	2300      	movs	r3, #0
     83a:	2200      	movs	r2, #0
     83c:	4618      	mov	r0, r3
     83e:	4611      	mov	r1, r2
     840:	df02      	svc	2
}
     842:	46bd      	mov	sp, r7
     844:	f85d 7b04 	ldr.w	r7, [sp], #4
     848:	4770      	bx	lr
     84a:	bf00      	nop

0000084c <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     84c:	b580      	push	{r7, lr}
     84e:	b082      	sub	sp, #8
     850:	af00      	add	r7, sp, #0
	int n;
	word();
     852:	f000 fa05 	bl	c60 <word>
	n=atoi(pad);
     856:	4806      	ldr	r0, [pc, #24]	; (870 <cmd_set_timer+0x24>)
     858:	f7ff fe2a 	bl	4b0 <atoi>
     85c:	4603      	mov	r3, r0
     85e:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     860:	1d3b      	adds	r3, r7, #4
     862:	2200      	movs	r2, #0
     864:	4618      	mov	r0, r3
     866:	4611      	mov	r1, r2
     868:	df03      	svc	3
}
     86a:	3708      	adds	r7, #8
     86c:	46bd      	mov	sp, r7
     86e:	bd80      	pop	{r7, pc}
     870:	200000c8 	.word	0x200000c8

00000874 <cmd_get_timer>:

static void cmd_get_timer(){
     874:	b480      	push	{r7}
     876:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     878:	4b04      	ldr	r3, [pc, #16]	; (88c <cmd_get_timer+0x18>)
     87a:	2200      	movs	r2, #0
     87c:	4618      	mov	r0, r3
     87e:	4611      	mov	r1, r2
     880:	df04      	svc	4
}
     882:	46bd      	mov	sp, r7
     884:	f85d 7b04 	ldr.w	r7, [sp], #4
     888:	4770      	bx	lr
     88a:	bf00      	nop
     88c:	200000c8 	.word	0x200000c8

00000890 <cmd_wait_time_out>:

// attend l'expiration de la minuterie
static void cmd_wait_time_out(){
     890:	b480      	push	{r7}
     892:	af00      	add	r7, sp, #0
	_svc_call(SVC_WAIT_TIMER,NUL,NUL);
     894:	2300      	movs	r3, #0
     896:	2200      	movs	r2, #0
     898:	4618      	mov	r0, r3
     89a:	4611      	mov	r1, r2
     89c:	df05      	svc	5
}
     89e:	46bd      	mov	sp, r7
     8a0:	f85d 7b04 	ldr.w	r7, [sp], #4
     8a4:	4770      	bx	lr
     8a6:	bf00      	nop

000008a8 <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     8a8:	b480      	push	{r7}
     8aa:	b083      	sub	sp, #12
     8ac:	af00      	add	r7, sp, #0
	char n=0;
     8ae:	2300      	movs	r3, #0
     8b0:	71fb      	strb	r3, [r7, #7]
	while (!n){
     8b2:	e004      	b.n	8be <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     8b4:	1dfb      	adds	r3, r7, #7
     8b6:	2200      	movs	r2, #0
     8b8:	4618      	mov	r0, r3
     8ba:	4611      	mov	r1, r2
     8bc:	df06      	svc	6
}

// reçoit un caractère dans pad
static void cmd_getc(){
	char n=0;
	while (!n){
     8be:	79fb      	ldrb	r3, [r7, #7]
     8c0:	2b00      	cmp	r3, #0
     8c2:	d0f7      	beq.n	8b4 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     8c4:	79fa      	ldrb	r2, [r7, #7]
     8c6:	4b05      	ldr	r3, [pc, #20]	; (8dc <cmd_getc+0x34>)
     8c8:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     8ca:	4b04      	ldr	r3, [pc, #16]	; (8dc <cmd_getc+0x34>)
     8cc:	2200      	movs	r2, #0
     8ce:	705a      	strb	r2, [r3, #1]
}
     8d0:	370c      	adds	r7, #12
     8d2:	46bd      	mov	sp, r7
     8d4:	f85d 7b04 	ldr.w	r7, [sp], #4
     8d8:	4770      	bx	lr
     8da:	bf00      	nop
     8dc:	200000c8 	.word	0x200000c8

000008e0 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     8e0:	b580      	push	{r7, lr}
     8e2:	b082      	sub	sp, #8
     8e4:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     8e6:	f000 f9bb 	bl	c60 <word>
	cmd_id=search_command(pad);
     8ea:	480a      	ldr	r0, [pc, #40]	; (914 <cmd_putc+0x34>)
     8ec:	f000 f908 	bl	b00 <search_command>
     8f0:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     8f2:	687b      	ldr	r3, [r7, #4]
     8f4:	2b00      	cmp	r3, #0
     8f6:	db05      	blt.n	904 <cmd_putc+0x24>
     8f8:	4a07      	ldr	r2, [pc, #28]	; (918 <cmd_putc+0x38>)
     8fa:	687b      	ldr	r3, [r7, #4]
     8fc:	00db      	lsls	r3, r3, #3
     8fe:	4413      	add	r3, r2
     900:	685b      	ldr	r3, [r3, #4]
     902:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     904:	4b03      	ldr	r3, [pc, #12]	; (914 <cmd_putc+0x34>)
     906:	2200      	movs	r2, #0
     908:	4618      	mov	r0, r3
     90a:	4611      	mov	r1, r2
     90c:	df07      	svc	7
}
     90e:	3708      	adds	r7, #8
     910:	46bd      	mov	sp, r7
     912:	bd80      	pop	{r7, pc}
     914:	200000c8 	.word	0x200000c8
     918:	000017d4 	.word	0x000017d4

0000091c <cmd_readln>:

static void cmd_readln(){
     91c:	b580      	push	{r7, lr}
     91e:	b082      	sub	sp, #8
     920:	af00      	add	r7, sp, #0
	unsigned llen=80;
     922:	2350      	movs	r3, #80	; 0x50
     924:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     926:	1d3b      	adds	r3, r7, #4
     928:	4a04      	ldr	r2, [pc, #16]	; (93c <cmd_readln+0x20>)
     92a:	4618      	mov	r0, r3
     92c:	4611      	mov	r1, r2
     92e:	df08      	svc	8
	print(pad);
     930:	4802      	ldr	r0, [pc, #8]	; (93c <cmd_readln+0x20>)
     932:	f000 fab3 	bl	e9c <print>
}
     936:	3708      	adds	r7, #8
     938:	46bd      	mov	sp, r7
     93a:	bd80      	pop	{r7, pc}
     93c:	200000c8 	.word	0x200000c8

00000940 <cmd_print>:

static void cmd_print(){
     940:	b580      	push	{r7, lr}
     942:	af00      	add	r7, sp, #0
	in=skip(tib,in,SPACE);
     944:	4b0f      	ldr	r3, [pc, #60]	; (984 <cmd_print+0x44>)
     946:	681b      	ldr	r3, [r3, #0]
     948:	480f      	ldr	r0, [pc, #60]	; (988 <cmd_print+0x48>)
     94a:	4619      	mov	r1, r3
     94c:	2220      	movs	r2, #32
     94e:	f000 f905 	bl	b5c <skip>
     952:	4603      	mov	r3, r0
     954:	461a      	mov	r2, r3
     956:	4b0b      	ldr	r3, [pc, #44]	; (984 <cmd_print+0x44>)
     958:	601a      	str	r2, [r3, #0]
	_svc_call(SVC_PRINT,&tib[in],NUL);
     95a:	4b0a      	ldr	r3, [pc, #40]	; (984 <cmd_print+0x44>)
     95c:	681b      	ldr	r3, [r3, #0]
     95e:	4a0a      	ldr	r2, [pc, #40]	; (988 <cmd_print+0x48>)
     960:	4413      	add	r3, r2
     962:	2200      	movs	r2, #0
     964:	4618      	mov	r0, r3
     966:	4611      	mov	r1, r2
     968:	df09      	svc	9
	while (tib[in]) in++;
     96a:	e004      	b.n	976 <cmd_print+0x36>
     96c:	4b05      	ldr	r3, [pc, #20]	; (984 <cmd_print+0x44>)
     96e:	681b      	ldr	r3, [r3, #0]
     970:	3301      	adds	r3, #1
     972:	4a04      	ldr	r2, [pc, #16]	; (984 <cmd_print+0x44>)
     974:	6013      	str	r3, [r2, #0]
     976:	4b03      	ldr	r3, [pc, #12]	; (984 <cmd_print+0x44>)
     978:	681b      	ldr	r3, [r3, #0]
     97a:	4a03      	ldr	r2, [pc, #12]	; (988 <cmd_print+0x48>)
     97c:	5cd3      	ldrb	r3, [r2, r3]
     97e:	2b00      	cmp	r3, #0
     980:	d1f4      	bne.n	96c <cmd_print+0x2c>
}
     982:	bd80      	pop	{r7, pc}
     984:	20000118 	.word	0x20000118
     988:	20000078 	.word	0x20000078

0000098c <cmd_run>:



static void cmd_run(){
     98c:	b580      	push	{r7, lr}
     98e:	af00      	add	r7, sp, #0
	((fn)proga)();
     990:	4b01      	ldr	r3, [pc, #4]	; (998 <cmd_run+0xc>)
     992:	681b      	ldr	r3, [r3, #0]
     994:	4798      	blx	r3
	
}
     996:	bd80      	pop	{r7, pc}
     998:	20000144 	.word	0x20000144

0000099c <cmd_peek8>:

static void cmd_peek8(){
     99c:	b580      	push	{r7, lr}
     99e:	b082      	sub	sp, #8
     9a0:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9a2:	f000 f95d 	bl	c60 <word>
	u=atoi(pad);
     9a6:	4808      	ldr	r0, [pc, #32]	; (9c8 <cmd_peek8+0x2c>)
     9a8:	f7ff fd82 	bl	4b0 <atoi>
     9ac:	4603      	mov	r3, r0
     9ae:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     9b0:	1d3b      	adds	r3, r7, #4
     9b2:	2200      	movs	r2, #0
     9b4:	4618      	mov	r0, r3
     9b6:	4611      	mov	r1, r2
     9b8:	df0c      	svc	12
	pad[0]=(unsigned char)u;
     9ba:	687b      	ldr	r3, [r7, #4]
     9bc:	b2da      	uxtb	r2, r3
     9be:	4b02      	ldr	r3, [pc, #8]	; (9c8 <cmd_peek8+0x2c>)
     9c0:	701a      	strb	r2, [r3, #0]
}
     9c2:	3708      	adds	r7, #8
     9c4:	46bd      	mov	sp, r7
     9c6:	bd80      	pop	{r7, pc}
     9c8:	200000c8 	.word	0x200000c8

000009cc <cmd_peek16>:

static void cmd_peek16(){
     9cc:	b580      	push	{r7, lr}
     9ce:	b082      	sub	sp, #8
     9d0:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9d2:	f000 f945 	bl	c60 <word>
	u=atoi(pad);
     9d6:	480b      	ldr	r0, [pc, #44]	; (a04 <cmd_peek16+0x38>)
     9d8:	f7ff fd6a 	bl	4b0 <atoi>
     9dc:	4603      	mov	r3, r0
     9de:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     9e0:	1d3b      	adds	r3, r7, #4
     9e2:	2200      	movs	r2, #0
     9e4:	4618      	mov	r0, r3
     9e6:	4611      	mov	r1, r2
     9e8:	df0d      	svc	13
	pad[0]=(unsigned char)(u&0xff);
     9ea:	687b      	ldr	r3, [r7, #4]
     9ec:	b2da      	uxtb	r2, r3
     9ee:	4b05      	ldr	r3, [pc, #20]	; (a04 <cmd_peek16+0x38>)
     9f0:	701a      	strb	r2, [r3, #0]
	pad[1]=(unsigned char)((u>>8)&0xff);
     9f2:	687b      	ldr	r3, [r7, #4]
     9f4:	0a1b      	lsrs	r3, r3, #8
     9f6:	b2da      	uxtb	r2, r3
     9f8:	4b02      	ldr	r3, [pc, #8]	; (a04 <cmd_peek16+0x38>)
     9fa:	705a      	strb	r2, [r3, #1]
}
     9fc:	3708      	adds	r7, #8
     9fe:	46bd      	mov	sp, r7
     a00:	bd80      	pop	{r7, pc}
     a02:	bf00      	nop
     a04:	200000c8 	.word	0x200000c8

00000a08 <cmd_peek32>:

static void cmd_peek32(){
     a08:	b580      	push	{r7, lr}
     a0a:	b082      	sub	sp, #8
     a0c:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     a0e:	f000 f927 	bl	c60 <word>
	u=atoi(pad);
     a12:	4810      	ldr	r0, [pc, #64]	; (a54 <cmd_peek32+0x4c>)
     a14:	f7ff fd4c 	bl	4b0 <atoi>
     a18:	4603      	mov	r3, r0
     a1a:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_PEEK32,&u,NUL);
     a1c:	463b      	mov	r3, r7
     a1e:	2200      	movs	r2, #0
     a20:	4618      	mov	r0, r3
     a22:	4611      	mov	r1, r2
     a24:	df0e      	svc	14
	for (i=0;i<4;i++){
     a26:	2300      	movs	r3, #0
     a28:	607b      	str	r3, [r7, #4]
     a2a:	e00c      	b.n	a46 <cmd_peek32+0x3e>
		pad[i]=(unsigned char)(u&0xff);
     a2c:	683b      	ldr	r3, [r7, #0]
     a2e:	b2d9      	uxtb	r1, r3
     a30:	4a08      	ldr	r2, [pc, #32]	; (a54 <cmd_peek32+0x4c>)
     a32:	687b      	ldr	r3, [r7, #4]
     a34:	4413      	add	r3, r2
     a36:	460a      	mov	r2, r1
     a38:	701a      	strb	r2, [r3, #0]
		u>>=8;
     a3a:	683b      	ldr	r3, [r7, #0]
     a3c:	0a1b      	lsrs	r3, r3, #8
     a3e:	603b      	str	r3, [r7, #0]
	uint32_t u;
	int i;
	word();
	u=atoi(pad);
	_svc_call(SVC_PEEK32,&u,NUL);
	for (i=0;i<4;i++){
     a40:	687b      	ldr	r3, [r7, #4]
     a42:	3301      	adds	r3, #1
     a44:	607b      	str	r3, [r7, #4]
     a46:	687b      	ldr	r3, [r7, #4]
     a48:	2b03      	cmp	r3, #3
     a4a:	ddef      	ble.n	a2c <cmd_peek32+0x24>
		pad[i]=(unsigned char)(u&0xff);
		u>>=8;
	}
}
     a4c:	3708      	adds	r7, #8
     a4e:	46bd      	mov	sp, r7
     a50:	bd80      	pop	{r7, pc}
     a52:	bf00      	nop
     a54:	200000c8 	.word	0x200000c8

00000a58 <cmd_poke8>:

static void cmd_poke8(){
     a58:	b580      	push	{r7, lr}
     a5a:	b082      	sub	sp, #8
     a5c:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     a5e:	f000 f8ff 	bl	c60 <word>
	adr=atoi(pad);
     a62:	480a      	ldr	r0, [pc, #40]	; (a8c <cmd_poke8+0x34>)
     a64:	f7ff fd24 	bl	4b0 <atoi>
     a68:	4603      	mov	r3, r0
     a6a:	607b      	str	r3, [r7, #4]
	word();
     a6c:	f000 f8f8 	bl	c60 <word>
	u8=atoi(pad);
     a70:	4806      	ldr	r0, [pc, #24]	; (a8c <cmd_poke8+0x34>)
     a72:	f7ff fd1d 	bl	4b0 <atoi>
     a76:	4603      	mov	r3, r0
     a78:	b2db      	uxtb	r3, r3
     a7a:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     a7c:	1d3b      	adds	r3, r7, #4
     a7e:	1cfa      	adds	r2, r7, #3
     a80:	4618      	mov	r0, r3
     a82:	4611      	mov	r1, r2
     a84:	df0f      	svc	15
}
     a86:	3708      	adds	r7, #8
     a88:	46bd      	mov	sp, r7
     a8a:	bd80      	pop	{r7, pc}
     a8c:	200000c8 	.word	0x200000c8

00000a90 <cmd_poke16>:

static void cmd_poke16(){
     a90:	b580      	push	{r7, lr}
     a92:	b082      	sub	sp, #8
     a94:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     a96:	f000 f8e3 	bl	c60 <word>
	adr=atoi(pad);
     a9a:	480a      	ldr	r0, [pc, #40]	; (ac4 <cmd_poke16+0x34>)
     a9c:	f7ff fd08 	bl	4b0 <atoi>
     aa0:	4603      	mov	r3, r0
     aa2:	607b      	str	r3, [r7, #4]
	word();
     aa4:	f000 f8dc 	bl	c60 <word>
	u16=atoi(pad);
     aa8:	4806      	ldr	r0, [pc, #24]	; (ac4 <cmd_poke16+0x34>)
     aaa:	f7ff fd01 	bl	4b0 <atoi>
     aae:	4603      	mov	r3, r0
     ab0:	b29b      	uxth	r3, r3
     ab2:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     ab4:	1d3b      	adds	r3, r7, #4
     ab6:	1cba      	adds	r2, r7, #2
     ab8:	4618      	mov	r0, r3
     aba:	4611      	mov	r1, r2
     abc:	df10      	svc	16
}
     abe:	3708      	adds	r7, #8
     ac0:	46bd      	mov	sp, r7
     ac2:	bd80      	pop	{r7, pc}
     ac4:	200000c8 	.word	0x200000c8

00000ac8 <cmd_poke32>:

static void cmd_poke32(){
     ac8:	b580      	push	{r7, lr}
     aca:	b082      	sub	sp, #8
     acc:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     ace:	f000 f8c7 	bl	c60 <word>
	adr=atoi(pad);
     ad2:	480a      	ldr	r0, [pc, #40]	; (afc <cmd_poke32+0x34>)
     ad4:	f7ff fcec 	bl	4b0 <atoi>
     ad8:	4603      	mov	r3, r0
     ada:	607b      	str	r3, [r7, #4]
	word();
     adc:	f000 f8c0 	bl	c60 <word>
	u32=atoi(pad);
     ae0:	4806      	ldr	r0, [pc, #24]	; (afc <cmd_poke32+0x34>)
     ae2:	f7ff fce5 	bl	4b0 <atoi>
     ae6:	4603      	mov	r3, r0
     ae8:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     aea:	1d3b      	adds	r3, r7, #4
     aec:	463a      	mov	r2, r7
     aee:	4618      	mov	r0, r3
     af0:	4611      	mov	r1, r2
     af2:	df11      	svc	17
}
     af4:	3708      	adds	r7, #8
     af6:	46bd      	mov	sp, r7
     af8:	bd80      	pop	{r7, pc}
     afa:	bf00      	nop
     afc:	200000c8 	.word	0x200000c8

00000b00 <search_command>:
	{"poke32",cmd_poke32}, 
	{NUL,NUL}
};


int search_command(const char * name){
     b00:	b580      	push	{r7, lr}
     b02:	b084      	sub	sp, #16
     b04:	af00      	add	r7, sp, #0
     b06:	6078      	str	r0, [r7, #4]
	int i=0;
     b08:	2300      	movs	r3, #0
     b0a:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     b0c:	e00e      	b.n	b2c <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     b0e:	4a12      	ldr	r2, [pc, #72]	; (b58 <search_command+0x58>)
     b10:	68fb      	ldr	r3, [r7, #12]
     b12:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     b16:	4618      	mov	r0, r3
     b18:	6879      	ldr	r1, [r7, #4]
     b1a:	f7ff fc4b 	bl	3b4 <strcmp>
     b1e:	4603      	mov	r3, r0
     b20:	2b00      	cmp	r3, #0
     b22:	d100      	bne.n	b26 <search_command+0x26>
			break;
     b24:	e009      	b.n	b3a <search_command+0x3a>
		}
		i++;
     b26:	68fb      	ldr	r3, [r7, #12]
     b28:	3301      	adds	r3, #1
     b2a:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     b2c:	4a0a      	ldr	r2, [pc, #40]	; (b58 <search_command+0x58>)
     b2e:	68fb      	ldr	r3, [r7, #12]
     b30:	00db      	lsls	r3, r3, #3
     b32:	4413      	add	r3, r2
     b34:	685b      	ldr	r3, [r3, #4]
     b36:	2b00      	cmp	r3, #0
     b38:	d1e9      	bne.n	b0e <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     b3a:	4a07      	ldr	r2, [pc, #28]	; (b58 <search_command+0x58>)
     b3c:	68fb      	ldr	r3, [r7, #12]
     b3e:	00db      	lsls	r3, r3, #3
     b40:	4413      	add	r3, r2
     b42:	685b      	ldr	r3, [r3, #4]
     b44:	2b00      	cmp	r3, #0
     b46:	d102      	bne.n	b4e <search_command+0x4e>
     b48:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     b4c:	60fb      	str	r3, [r7, #12]
	return i;
     b4e:	68fb      	ldr	r3, [r7, #12]
}
     b50:	4618      	mov	r0, r3
     b52:	3710      	adds	r7, #16
     b54:	46bd      	mov	sp, r7
     b56:	bd80      	pop	{r7, pc}
     b58:	000017d4 	.word	0x000017d4

00000b5c <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     b5c:	b480      	push	{r7}
     b5e:	b085      	sub	sp, #20
     b60:	af00      	add	r7, sp, #0
     b62:	60f8      	str	r0, [r7, #12]
     b64:	60b9      	str	r1, [r7, #8]
     b66:	4613      	mov	r3, r2
     b68:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     b6a:	e002      	b.n	b72 <skip+0x16>
     b6c:	68bb      	ldr	r3, [r7, #8]
     b6e:	3301      	adds	r3, #1
     b70:	60bb      	str	r3, [r7, #8]
     b72:	68bb      	ldr	r3, [r7, #8]
     b74:	68fa      	ldr	r2, [r7, #12]
     b76:	4413      	add	r3, r2
     b78:	781b      	ldrb	r3, [r3, #0]
     b7a:	2b00      	cmp	r3, #0
     b7c:	d006      	beq.n	b8c <skip+0x30>
     b7e:	68bb      	ldr	r3, [r7, #8]
     b80:	68fa      	ldr	r2, [r7, #12]
     b82:	4413      	add	r3, r2
     b84:	781b      	ldrb	r3, [r3, #0]
     b86:	79fa      	ldrb	r2, [r7, #7]
     b88:	429a      	cmp	r2, r3
     b8a:	d0ef      	beq.n	b6c <skip+0x10>
	return start;
     b8c:	68bb      	ldr	r3, [r7, #8]
}
     b8e:	4618      	mov	r0, r3
     b90:	3714      	adds	r7, #20
     b92:	46bd      	mov	sp, r7
     b94:	f85d 7b04 	ldr.w	r7, [sp], #4
     b98:	4770      	bx	lr
     b9a:	bf00      	nop

00000b9c <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     b9c:	b480      	push	{r7}
     b9e:	b085      	sub	sp, #20
     ba0:	af00      	add	r7, sp, #0
     ba2:	60f8      	str	r0, [r7, #12]
     ba4:	60b9      	str	r1, [r7, #8]
     ba6:	4613      	mov	r3, r2
     ba8:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     baa:	e002      	b.n	bb2 <scan+0x16>
     bac:	68bb      	ldr	r3, [r7, #8]
     bae:	3301      	adds	r3, #1
     bb0:	60bb      	str	r3, [r7, #8]
     bb2:	68bb      	ldr	r3, [r7, #8]
     bb4:	68fa      	ldr	r2, [r7, #12]
     bb6:	4413      	add	r3, r2
     bb8:	781b      	ldrb	r3, [r3, #0]
     bba:	2b00      	cmp	r3, #0
     bbc:	d006      	beq.n	bcc <scan+0x30>
     bbe:	68bb      	ldr	r3, [r7, #8]
     bc0:	68fa      	ldr	r2, [r7, #12]
     bc2:	4413      	add	r3, r2
     bc4:	781b      	ldrb	r3, [r3, #0]
     bc6:	79fa      	ldrb	r2, [r7, #7]
     bc8:	429a      	cmp	r2, r3
     bca:	d1ef      	bne.n	bac <scan+0x10>
	return start;
     bcc:	68bb      	ldr	r3, [r7, #8]
}
     bce:	4618      	mov	r0, r3
     bd0:	3714      	adds	r7, #20
     bd2:	46bd      	mov	sp, r7
     bd4:	f85d 7b04 	ldr.w	r7, [sp], #4
     bd8:	4770      	bx	lr
     bda:	bf00      	nop

00000bdc <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     bdc:	b480      	push	{r7}
     bde:	b087      	sub	sp, #28
     be0:	af00      	add	r7, sp, #0
     be2:	60f8      	str	r0, [r7, #12]
     be4:	60b9      	str	r1, [r7, #8]
     be6:	4613      	mov	r3, r2
     be8:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     bea:	68bb      	ldr	r3, [r7, #8]
     bec:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     bee:	e002      	b.n	bf6 <next+0x1a>
     bf0:	697b      	ldr	r3, [r7, #20]
     bf2:	3301      	adds	r3, #1
     bf4:	617b      	str	r3, [r7, #20]
     bf6:	697b      	ldr	r3, [r7, #20]
     bf8:	68fa      	ldr	r2, [r7, #12]
     bfa:	4413      	add	r3, r2
     bfc:	781b      	ldrb	r3, [r3, #0]
     bfe:	2b00      	cmp	r3, #0
     c00:	d006      	beq.n	c10 <next+0x34>
     c02:	697b      	ldr	r3, [r7, #20]
     c04:	68fa      	ldr	r2, [r7, #12]
     c06:	4413      	add	r3, r2
     c08:	781b      	ldrb	r3, [r3, #0]
     c0a:	79fa      	ldrb	r2, [r7, #7]
     c0c:	429a      	cmp	r2, r3
     c0e:	d1ef      	bne.n	bf0 <next+0x14>
	return end-start;
     c10:	697a      	ldr	r2, [r7, #20]
     c12:	68bb      	ldr	r3, [r7, #8]
     c14:	1ad3      	subs	r3, r2, r3
}
     c16:	4618      	mov	r0, r3
     c18:	371c      	adds	r7, #28
     c1a:	46bd      	mov	sp, r7
     c1c:	f85d 7b04 	ldr.w	r7, [sp], #4
     c20:	4770      	bx	lr
     c22:	bf00      	nop

00000c24 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     c24:	b480      	push	{r7}
     c26:	b085      	sub	sp, #20
     c28:	af00      	add	r7, sp, #0
     c2a:	60f8      	str	r0, [r7, #12]
     c2c:	60b9      	str	r1, [r7, #8]
     c2e:	607a      	str	r2, [r7, #4]
	while (len){
     c30:	e00a      	b.n	c48 <move+0x24>
		*dest++=*src++;
     c32:	68bb      	ldr	r3, [r7, #8]
     c34:	1c5a      	adds	r2, r3, #1
     c36:	60ba      	str	r2, [r7, #8]
     c38:	68fa      	ldr	r2, [r7, #12]
     c3a:	1c51      	adds	r1, r2, #1
     c3c:	60f9      	str	r1, [r7, #12]
     c3e:	7812      	ldrb	r2, [r2, #0]
     c40:	701a      	strb	r2, [r3, #0]
		len--;
     c42:	687b      	ldr	r3, [r7, #4]
     c44:	3b01      	subs	r3, #1
     c46:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     c48:	687b      	ldr	r3, [r7, #4]
     c4a:	2b00      	cmp	r3, #0
     c4c:	d1f1      	bne.n	c32 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     c4e:	68bb      	ldr	r3, [r7, #8]
     c50:	2200      	movs	r2, #0
     c52:	701a      	strb	r2, [r3, #0]
}
     c54:	3714      	adds	r7, #20
     c56:	46bd      	mov	sp, r7
     c58:	f85d 7b04 	ldr.w	r7, [sp], #4
     c5c:	4770      	bx	lr
     c5e:	bf00      	nop

00000c60 <word>:

// extrait le prochain mot du tib
static void word(){
     c60:	b580      	push	{r7, lr}
     c62:	b082      	sub	sp, #8
     c64:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     c66:	4b12      	ldr	r3, [pc, #72]	; (cb0 <word+0x50>)
     c68:	681b      	ldr	r3, [r3, #0]
     c6a:	4812      	ldr	r0, [pc, #72]	; (cb4 <word+0x54>)
     c6c:	4619      	mov	r1, r3
     c6e:	2220      	movs	r2, #32
     c70:	f7ff ff74 	bl	b5c <skip>
     c74:	4603      	mov	r3, r0
     c76:	461a      	mov	r2, r3
     c78:	4b0d      	ldr	r3, [pc, #52]	; (cb0 <word+0x50>)
     c7a:	601a      	str	r2, [r3, #0]
		len=next(tib,in,SPACE);
     c7c:	4b0c      	ldr	r3, [pc, #48]	; (cb0 <word+0x50>)
     c7e:	681b      	ldr	r3, [r3, #0]
     c80:	480c      	ldr	r0, [pc, #48]	; (cb4 <word+0x54>)
     c82:	4619      	mov	r1, r3
     c84:	2220      	movs	r2, #32
     c86:	f7ff ffa9 	bl	bdc <next>
     c8a:	6078      	str	r0, [r7, #4]
		move(&tib[in],pad,len);
     c8c:	4b08      	ldr	r3, [pc, #32]	; (cb0 <word+0x50>)
     c8e:	681b      	ldr	r3, [r3, #0]
     c90:	4a08      	ldr	r2, [pc, #32]	; (cb4 <word+0x54>)
     c92:	4413      	add	r3, r2
     c94:	4618      	mov	r0, r3
     c96:	4908      	ldr	r1, [pc, #32]	; (cb8 <word+0x58>)
     c98:	687a      	ldr	r2, [r7, #4]
     c9a:	f7ff ffc3 	bl	c24 <move>
		in+=len;
     c9e:	4b04      	ldr	r3, [pc, #16]	; (cb0 <word+0x50>)
     ca0:	681a      	ldr	r2, [r3, #0]
     ca2:	687b      	ldr	r3, [r7, #4]
     ca4:	4413      	add	r3, r2
     ca6:	4a02      	ldr	r2, [pc, #8]	; (cb0 <word+0x50>)
     ca8:	6013      	str	r3, [r2, #0]
}
     caa:	3708      	adds	r7, #8
     cac:	46bd      	mov	sp, r7
     cae:	bd80      	pop	{r7, pc}
     cb0:	20000118 	.word	0x20000118
     cb4:	20000078 	.word	0x20000078
     cb8:	200000c8 	.word	0x200000c8

00000cbc <parse_line>:

static void parse_line(unsigned llen){
     cbc:	b580      	push	{r7, lr}
     cbe:	b084      	sub	sp, #16
     cc0:	af00      	add	r7, sp, #0
     cc2:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     cc4:	4b12      	ldr	r3, [pc, #72]	; (d10 <parse_line+0x54>)
     cc6:	2200      	movs	r2, #0
     cc8:	601a      	str	r2, [r3, #0]
	while (in<llen){
     cca:	e016      	b.n	cfa <parse_line+0x3e>
		word();
     ccc:	f7ff ffc8 	bl	c60 <word>
		cmd_id=search_command((const char*) pad);
     cd0:	4810      	ldr	r0, [pc, #64]	; (d14 <parse_line+0x58>)
     cd2:	f7ff ff15 	bl	b00 <search_command>
     cd6:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     cd8:	68fb      	ldr	r3, [r7, #12]
     cda:	2b00      	cmp	r3, #0
     cdc:	db06      	blt.n	cec <parse_line+0x30>
			commands[cmd_id].fn();
     cde:	4a0e      	ldr	r2, [pc, #56]	; (d18 <parse_line+0x5c>)
     ce0:	68fb      	ldr	r3, [r7, #12]
     ce2:	00db      	lsls	r3, r3, #3
     ce4:	4413      	add	r3, r2
     ce6:	685b      	ldr	r3, [r3, #4]
     ce8:	4798      	blx	r3
     cea:	e006      	b.n	cfa <parse_line+0x3e>
		}else{
			print(pad); conout('?');
     cec:	4809      	ldr	r0, [pc, #36]	; (d14 <parse_line+0x58>)
     cee:	f000 f8d5 	bl	e9c <print>
     cf2:	203f      	movs	r0, #63	; 0x3f
     cf4:	f000 f8a0 	bl	e38 <conout>
			break;
     cf8:	e004      	b.n	d04 <parse_line+0x48>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     cfa:	4b05      	ldr	r3, [pc, #20]	; (d10 <parse_line+0x54>)
     cfc:	681a      	ldr	r2, [r3, #0]
     cfe:	687b      	ldr	r3, [r7, #4]
     d00:	429a      	cmp	r2, r3
     d02:	d3e3      	bcc.n	ccc <parse_line+0x10>
		}else{
			print(pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     d04:	200d      	movs	r0, #13
     d06:	f000 f897 	bl	e38 <conout>
}
     d0a:	3710      	adds	r7, #16
     d0c:	46bd      	mov	sp, r7
     d0e:	bd80      	pop	{r7, pc}
     d10:	20000118 	.word	0x20000118
     d14:	200000c8 	.word	0x200000c8
     d18:	000017d4 	.word	0x000017d4

00000d1c <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     d1c:	b480      	push	{r7}
     d1e:	b085      	sub	sp, #20
     d20:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     d22:	4b0c      	ldr	r3, [pc, #48]	; (d54 <copy_blink_in_ram+0x38>)
     d24:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     d26:	4b0c      	ldr	r3, [pc, #48]	; (d58 <copy_blink_in_ram+0x3c>)
     d28:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     d2a:	4b0c      	ldr	r3, [pc, #48]	; (d5c <copy_blink_in_ram+0x40>)
     d2c:	60bb      	str	r3, [r7, #8]
	while (start<end){
     d2e:	e007      	b.n	d40 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     d30:	68bb      	ldr	r3, [r7, #8]
     d32:	1d1a      	adds	r2, r3, #4
     d34:	60ba      	str	r2, [r7, #8]
     d36:	68fa      	ldr	r2, [r7, #12]
     d38:	1d11      	adds	r1, r2, #4
     d3a:	60f9      	str	r1, [r7, #12]
     d3c:	6812      	ldr	r2, [r2, #0]
     d3e:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     d40:	68fa      	ldr	r2, [r7, #12]
     d42:	687b      	ldr	r3, [r7, #4]
     d44:	429a      	cmp	r2, r3
     d46:	d3f3      	bcc.n	d30 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     d48:	3714      	adds	r7, #20
     d4a:	46bd      	mov	sp, r7
     d4c:	f85d 7b04 	ldr.w	r7, [sp], #4
     d50:	4770      	bx	lr
     d52:	bf00      	nop
     d54:	000018e0 	.word	0x000018e0
     d58:	0000194c 	.word	0x0000194c
     d5c:	20000160 	.word	0x20000160

00000d60 <main>:

void main(void){
     d60:	b580      	push	{r7, lr}
     d62:	b082      	sub	sp, #8
     d64:	af00      	add	r7, sp, #0
	set_sysclock();
     d66:	f7ff fce7 	bl	738 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     d6a:	f06f 000a 	mvn.w	r0, #10
     d6e:	210f      	movs	r1, #15
     d70:	f000 fb52 	bl	1418 <set_int_priority>
	config_systicks();
     d74:	f7ff fd1e 	bl	7b4 <config_systicks>
	port_c_setup();
     d78:	f7ff fd2e 	bl	7d8 <port_c_setup>
	uart_open_channel(CON,115200,FLOW_HARD);
     d7c:	4814      	ldr	r0, [pc, #80]	; (dd0 <main+0x70>)
     d7e:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     d82:	2201      	movs	r2, #1
     d84:	f000 fbfe 	bl	1584 <uart_open_channel>
	cls();
     d88:	f000 f8b8 	bl	efc <cls>
	print(VERSION); 
     d8c:	4b11      	ldr	r3, [pc, #68]	; (dd4 <main+0x74>)
     d8e:	681b      	ldr	r3, [r3, #0]
     d90:	4618      	mov	r0, r3
     d92:	f000 f883 	bl	e9c <print>
	copy_blink_in_ram();
     d96:	f7ff ffc1 	bl	d1c <copy_blink_in_ram>
	print("Transient program address: ");print_hex(proga); conout(CR);
     d9a:	480f      	ldr	r0, [pc, #60]	; (dd8 <main+0x78>)
     d9c:	f000 f87e 	bl	e9c <print>
     da0:	4b0e      	ldr	r3, [pc, #56]	; (ddc <main+0x7c>)
     da2:	681b      	ldr	r3, [r3, #0]
     da4:	4618      	mov	r0, r3
     da6:	f000 f9e7 	bl	1178 <print_hex>
     daa:	200d      	movs	r0, #13
     dac:	f000 f844 	bl	e38 <conout>
//	((fn)proga)();
	_svc_call(SVC_LED_ON,NUL,NUL);
     db0:	2300      	movs	r3, #0
     db2:	2200      	movs	r2, #0
     db4:	4618      	mov	r0, r3
     db6:	4611      	mov	r1, r2
     db8:	df01      	svc	1
	flush_rx_queue();
     dba:	f000 fa3f 	bl	123c <flush_rx_queue>
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
     dbe:	4808      	ldr	r0, [pc, #32]	; (de0 <main+0x80>)
     dc0:	2150      	movs	r1, #80	; 0x50
     dc2:	f000 f8c1 	bl	f48 <read_line>
     dc6:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     dc8:	6878      	ldr	r0, [r7, #4]
     dca:	f7ff ff77 	bl	cbc <parse_line>
	}
     dce:	e7f6      	b.n	dbe <main+0x5e>
     dd0:	40004400 	.word	0x40004400
     dd4:	20000000 	.word	0x20000000
     dd8:	0000185c 	.word	0x0000185c
     ddc:	20000144 	.word	0x20000144
     de0:	20000078 	.word	0x20000078

00000de4 <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
     de4:	4668      	mov	r0, sp
     de6:	f020 0107 	bic.w	r1, r0, #7
     dea:	468d      	mov	sp, r1
     dec:	b481      	push	{r0, r7}
     dee:	af00      	add	r7, sp, #0
	if (USART2_SR&(1<<USART_SR_RXNE)){
     df0:	4b0e      	ldr	r3, [pc, #56]	; (e2c <USART2_handler+0x48>)
     df2:	681b      	ldr	r3, [r3, #0]
     df4:	f003 0320 	and.w	r3, r3, #32
     df8:	2b00      	cmp	r3, #0
     dfa:	d012      	beq.n	e22 <USART2_handler+0x3e>
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
     dfc:	4b0c      	ldr	r3, [pc, #48]	; (e30 <USART2_handler+0x4c>)
     dfe:	6a1b      	ldr	r3, [r3, #32]
     e00:	1c5a      	adds	r2, r3, #1
     e02:	490b      	ldr	r1, [pc, #44]	; (e30 <USART2_handler+0x4c>)
     e04:	620a      	str	r2, [r1, #32]
     e06:	4a0b      	ldr	r2, [pc, #44]	; (e34 <USART2_handler+0x50>)
     e08:	6812      	ldr	r2, [r2, #0]
     e0a:	b2d2      	uxtb	r2, r2
     e0c:	f002 027f 	and.w	r2, r2, #127	; 0x7f
     e10:	b2d1      	uxtb	r1, r2
     e12:	4a07      	ldr	r2, [pc, #28]	; (e30 <USART2_handler+0x4c>)
     e14:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
     e16:	4b06      	ldr	r3, [pc, #24]	; (e30 <USART2_handler+0x4c>)
     e18:	6a1b      	ldr	r3, [r3, #32]
     e1a:	f003 031f 	and.w	r3, r3, #31
     e1e:	4a04      	ldr	r2, [pc, #16]	; (e30 <USART2_handler+0x4c>)
     e20:	6213      	str	r3, [r2, #32]
	}
}
     e22:	46bd      	mov	sp, r7
     e24:	bc81      	pop	{r0, r7}
     e26:	4685      	mov	sp, r0
     e28:	4770      	bx	lr
     e2a:	bf00      	nop
     e2c:	40004400 	.word	0x40004400
     e30:	2000011c 	.word	0x2000011c
     e34:	40004404 	.word	0x40004404

00000e38 <conout>:


// envoie d'un caractère à la console
void conout(char c){
     e38:	b580      	push	{r7, lr}
     e3a:	b082      	sub	sp, #8
     e3c:	af00      	add	r7, sp, #0
     e3e:	4603      	mov	r3, r0
     e40:	71fb      	strb	r3, [r7, #7]
	uart_putc(CON,c);
     e42:	79fb      	ldrb	r3, [r7, #7]
     e44:	4803      	ldr	r0, [pc, #12]	; (e54 <conout+0x1c>)
     e46:	4619      	mov	r1, r3
     e48:	f000 fc62 	bl	1710 <uart_putc>
}
     e4c:	3708      	adds	r7, #8
     e4e:	46bd      	mov	sp, r7
     e50:	bd80      	pop	{r7, pc}
     e52:	bf00      	nop
     e54:	40004400 	.word	0x40004400

00000e58 <conin>:


// réception d'un caractère de la console
char conin(){
     e58:	b480      	push	{r7}
     e5a:	b083      	sub	sp, #12
     e5c:	af00      	add	r7, sp, #0
	char c=0;
     e5e:	2300      	movs	r3, #0
     e60:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
     e62:	4b0d      	ldr	r3, [pc, #52]	; (e98 <conin+0x40>)
     e64:	6a1a      	ldr	r2, [r3, #32]
     e66:	4b0c      	ldr	r3, [pc, #48]	; (e98 <conin+0x40>)
     e68:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     e6a:	429a      	cmp	r2, r3
     e6c:	d00d      	beq.n	e8a <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
     e6e:	4b0a      	ldr	r3, [pc, #40]	; (e98 <conin+0x40>)
     e70:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     e72:	1c5a      	adds	r2, r3, #1
     e74:	4908      	ldr	r1, [pc, #32]	; (e98 <conin+0x40>)
     e76:	624a      	str	r2, [r1, #36]	; 0x24
     e78:	4a07      	ldr	r2, [pc, #28]	; (e98 <conin+0x40>)
     e7a:	5cd3      	ldrb	r3, [r2, r3]
     e7c:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
     e7e:	4b06      	ldr	r3, [pc, #24]	; (e98 <conin+0x40>)
     e80:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     e82:	f003 031f 	and.w	r3, r3, #31
     e86:	4a04      	ldr	r2, [pc, #16]	; (e98 <conin+0x40>)
     e88:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
     e8a:	79fb      	ldrb	r3, [r7, #7]
}
     e8c:	4618      	mov	r0, r3
     e8e:	370c      	adds	r7, #12
     e90:	46bd      	mov	sp, r7
     e92:	f85d 7b04 	ldr.w	r7, [sp], #4
     e96:	4770      	bx	lr
     e98:	2000011c 	.word	0x2000011c

00000e9c <print>:

// imprime un chaîne sur la console
void print(const char *str){
     e9c:	b580      	push	{r7, lr}
     e9e:	b082      	sub	sp, #8
     ea0:	af00      	add	r7, sp, #0
     ea2:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
     ea4:	e006      	b.n	eb4 <print+0x18>
     ea6:	687b      	ldr	r3, [r7, #4]
     ea8:	1c5a      	adds	r2, r3, #1
     eaa:	607a      	str	r2, [r7, #4]
     eac:	781b      	ldrb	r3, [r3, #0]
     eae:	4618      	mov	r0, r3
     eb0:	f7ff ffc2 	bl	e38 <conout>
     eb4:	687b      	ldr	r3, [r7, #4]
     eb6:	781b      	ldrb	r3, [r3, #0]
     eb8:	2b00      	cmp	r3, #0
     eba:	d1f4      	bne.n	ea6 <print+0xa>
}
     ebc:	3708      	adds	r7, #8
     ebe:	46bd      	mov	sp, r7
     ec0:	bd80      	pop	{r7, pc}
     ec2:	bf00      	nop

00000ec4 <beep>:

void beep(){
     ec4:	b480      	push	{r7}
     ec6:	af00      	add	r7, sp, #0
}
     ec8:	46bd      	mov	sp, r7
     eca:	f85d 7b04 	ldr.w	r7, [sp], #4
     ece:	4770      	bx	lr

00000ed0 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
     ed0:	b580      	push	{r7, lr}
     ed2:	af00      	add	r7, sp, #0
	conout(BS);
     ed4:	2008      	movs	r0, #8
     ed6:	f7ff ffaf 	bl	e38 <conout>
	conout(SPACE);
     eda:	2020      	movs	r0, #32
     edc:	f7ff ffac 	bl	e38 <conout>
	conout(BS);
     ee0:	2008      	movs	r0, #8
     ee2:	f7ff ffa9 	bl	e38 <conout>
}
     ee6:	bd80      	pop	{r7, pc}

00000ee8 <esc_seq>:

void esc_seq(){
     ee8:	b580      	push	{r7, lr}
     eea:	af00      	add	r7, sp, #0
	conout(ESC);
     eec:	201b      	movs	r0, #27
     eee:	f7ff ffa3 	bl	e38 <conout>
	conout('[');
     ef2:	205b      	movs	r0, #91	; 0x5b
     ef4:	f7ff ffa0 	bl	e38 <conout>
}
     ef8:	bd80      	pop	{r7, pc}
     efa:	bf00      	nop

00000efc <cls>:

// vide l'écran de la console
void cls(){
     efc:	b580      	push	{r7, lr}
     efe:	af00      	add	r7, sp, #0
	esc_seq();
     f00:	f7ff fff2 	bl	ee8 <esc_seq>
	conout('2');
     f04:	2032      	movs	r0, #50	; 0x32
     f06:	f7ff ff97 	bl	e38 <conout>
	conout('J');
     f0a:	204a      	movs	r0, #74	; 0x4a
     f0c:	f7ff ff94 	bl	e38 <conout>
}
     f10:	bd80      	pop	{r7, pc}
     f12:	bf00      	nop

00000f14 <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
     f14:	b580      	push	{r7, lr}
     f16:	b082      	sub	sp, #8
     f18:	af00      	add	r7, sp, #0
     f1a:	6078      	str	r0, [r7, #4]
	esc_seq();
     f1c:	f7ff ffe4 	bl	ee8 <esc_seq>
	conout('2');
     f20:	2032      	movs	r0, #50	; 0x32
     f22:	f7ff ff89 	bl	e38 <conout>
	conout('K');
     f26:	204b      	movs	r0, #75	; 0x4b
     f28:	f7ff ff86 	bl	e38 <conout>
	while (n){conout(BS);n--;}
     f2c:	e005      	b.n	f3a <clear_line+0x26>
     f2e:	2008      	movs	r0, #8
     f30:	f7ff ff82 	bl	e38 <conout>
     f34:	687b      	ldr	r3, [r7, #4]
     f36:	3b01      	subs	r3, #1
     f38:	607b      	str	r3, [r7, #4]
     f3a:	687b      	ldr	r3, [r7, #4]
     f3c:	2b00      	cmp	r3, #0
     f3e:	d1f6      	bne.n	f2e <clear_line+0x1a>
}
     f40:	3708      	adds	r7, #8
     f42:	46bd      	mov	sp, r7
     f44:	bd80      	pop	{r7, pc}
     f46:	bf00      	nop

00000f48 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
     f48:	b580      	push	{r7, lr}
     f4a:	b084      	sub	sp, #16
     f4c:	af00      	add	r7, sp, #0
     f4e:	6078      	str	r0, [r7, #4]
     f50:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
     f52:	2300      	movs	r3, #0
     f54:	60fb      	str	r3, [r7, #12]
	char c=0;
     f56:	2300      	movs	r3, #0
     f58:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
     f5a:	683b      	ldr	r3, [r7, #0]
     f5c:	3b01      	subs	r3, #1
     f5e:	603b      	str	r3, [r7, #0]
	while (c!=13){
     f60:	e08e      	b.n	1080 <read_line+0x138>
			c=conin();
     f62:	f7ff ff79 	bl	e58 <conin>
     f66:	4603      	mov	r3, r0
     f68:	72fb      	strb	r3, [r7, #11]
			switch(c){
     f6a:	7afb      	ldrb	r3, [r7, #11]
     f6c:	2b18      	cmp	r3, #24
     f6e:	d872      	bhi.n	1056 <read_line+0x10e>
     f70:	a201      	add	r2, pc, #4	; (adr r2, f78 <read_line+0x30>)
     f72:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     f76:	bf00      	nop
     f78:	00001081 	.word	0x00001081
     f7c:	00001057 	.word	0x00001057
     f80:	00001057 	.word	0x00001057
     f84:	00001057 	.word	0x00001057
     f88:	00001057 	.word	0x00001057
     f8c:	00001049 	.word	0x00001049
     f90:	00001057 	.word	0x00001057
     f94:	00001057 	.word	0x00001057
     f98:	00001037 	.word	0x00001037
     f9c:	00001053 	.word	0x00001053
     fa0:	00000fdd 	.word	0x00000fdd
     fa4:	00001057 	.word	0x00001057
     fa8:	00001057 	.word	0x00001057
     fac:	00000fdd 	.word	0x00000fdd
     fb0:	00001057 	.word	0x00001057
     fb4:	00001057 	.word	0x00001057
     fb8:	00001057 	.word	0x00001057
     fbc:	00001057 	.word	0x00001057
     fc0:	00001057 	.word	0x00001057
     fc4:	00001057 	.word	0x00001057
     fc8:	00001057 	.word	0x00001057
     fcc:	00000feb 	.word	0x00000feb
     fd0:	00001057 	.word	0x00001057
     fd4:	00001001 	.word	0x00001001
     fd8:	00000feb 	.word	0x00000feb
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
     fdc:	230d      	movs	r3, #13
     fde:	72fb      	strb	r3, [r7, #11]
				conout(c);
     fe0:	7afb      	ldrb	r3, [r7, #11]
     fe2:	4618      	mov	r0, r3
     fe4:	f7ff ff28 	bl	e38 <conout>
				break;
     fe8:	e04a      	b.n	1080 <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
     fea:	68f8      	ldr	r0, [r7, #12]
     fec:	f7ff ff92 	bl	f14 <clear_line>
				line_len=0;
     ff0:	2300      	movs	r3, #0
     ff2:	60fb      	str	r3, [r7, #12]
				break;
     ff4:	e044      	b.n	1080 <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
     ff6:	f7ff ff6b 	bl	ed0 <delete_back>
					line_len--;
     ffa:	68fb      	ldr	r3, [r7, #12]
     ffc:	3b01      	subs	r3, #1
     ffe:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    1000:	68fb      	ldr	r3, [r7, #12]
    1002:	2b00      	cmp	r3, #0
    1004:	d006      	beq.n	1014 <read_line+0xcc>
    1006:	68fb      	ldr	r3, [r7, #12]
    1008:	3b01      	subs	r3, #1
    100a:	687a      	ldr	r2, [r7, #4]
    100c:	4413      	add	r3, r2
    100e:	781b      	ldrb	r3, [r3, #0]
    1010:	2b20      	cmp	r3, #32
    1012:	d0f0      	beq.n	ff6 <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1014:	e004      	b.n	1020 <read_line+0xd8>
					delete_back();
    1016:	f7ff ff5b 	bl	ed0 <delete_back>
					line_len--;
    101a:	68fb      	ldr	r3, [r7, #12]
    101c:	3b01      	subs	r3, #1
    101e:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1020:	68fb      	ldr	r3, [r7, #12]
    1022:	2b00      	cmp	r3, #0
    1024:	d006      	beq.n	1034 <read_line+0xec>
    1026:	68fb      	ldr	r3, [r7, #12]
    1028:	3b01      	subs	r3, #1
    102a:	687a      	ldr	r2, [r7, #4]
    102c:	4413      	add	r3, r2
    102e:	781b      	ldrb	r3, [r3, #0]
    1030:	2b20      	cmp	r3, #32
    1032:	d1f0      	bne.n	1016 <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    1034:	e024      	b.n	1080 <read_line+0x138>
				case BS:
				if (line_len){
    1036:	68fb      	ldr	r3, [r7, #12]
    1038:	2b00      	cmp	r3, #0
    103a:	d004      	beq.n	1046 <read_line+0xfe>
					delete_back();
    103c:	f7ff ff48 	bl	ed0 <delete_back>
					line_len--;
    1040:	68fb      	ldr	r3, [r7, #12]
    1042:	3b01      	subs	r3, #1
    1044:	60fb      	str	r3, [r7, #12]
				}
				break;
    1046:	e01b      	b.n	1080 <read_line+0x138>
				case CTRL_E:
				cls();
    1048:	f7ff ff58 	bl	efc <cls>
				line_len=0;
    104c:	2300      	movs	r3, #0
    104e:	60fb      	str	r3, [r7, #12]
				break;
    1050:	e016      	b.n	1080 <read_line+0x138>
				case TAB:
				c=SPACE;
    1052:	2320      	movs	r3, #32
    1054:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    1056:	68fa      	ldr	r2, [r7, #12]
    1058:	683b      	ldr	r3, [r7, #0]
    105a:	429a      	cmp	r2, r3
    105c:	d20e      	bcs.n	107c <read_line+0x134>
    105e:	7afb      	ldrb	r3, [r7, #11]
    1060:	2b1f      	cmp	r3, #31
    1062:	d90b      	bls.n	107c <read_line+0x134>
					buffer[line_len++]=c;
    1064:	68fb      	ldr	r3, [r7, #12]
    1066:	1c5a      	adds	r2, r3, #1
    1068:	60fa      	str	r2, [r7, #12]
    106a:	687a      	ldr	r2, [r7, #4]
    106c:	4413      	add	r3, r2
    106e:	7afa      	ldrb	r2, [r7, #11]
    1070:	701a      	strb	r2, [r3, #0]
					conout(c);
    1072:	7afb      	ldrb	r3, [r7, #11]
    1074:	4618      	mov	r0, r3
    1076:	f7ff fedf 	bl	e38 <conout>
    107a:	e001      	b.n	1080 <read_line+0x138>
				}else{
					beep();
    107c:	f7ff ff22 	bl	ec4 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    1080:	7afb      	ldrb	r3, [r7, #11]
    1082:	2b0d      	cmp	r3, #13
    1084:	f47f af6d 	bne.w	f62 <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1088:	687a      	ldr	r2, [r7, #4]
    108a:	68fb      	ldr	r3, [r7, #12]
    108c:	4413      	add	r3, r2
    108e:	2200      	movs	r2, #0
    1090:	701a      	strb	r2, [r3, #0]
	return line_len;
    1092:	68fb      	ldr	r3, [r7, #12]
}
    1094:	4618      	mov	r0, r3
    1096:	3710      	adds	r7, #16
    1098:	46bd      	mov	sp, r7
    109a:	bd80      	pop	{r7, pc}

0000109c <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    109c:	b580      	push	{r7, lr}
    109e:	b08e      	sub	sp, #56	; 0x38
    10a0:	af00      	add	r7, sp, #0
    10a2:	6078      	str	r0, [r7, #4]
    10a4:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    10a6:	2301      	movs	r3, #1
    10a8:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    10aa:	2322      	movs	r3, #34	; 0x22
    10ac:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    10ae:	2300      	movs	r3, #0
    10b0:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    10b4:	687b      	ldr	r3, [r7, #4]
    10b6:	2b00      	cmp	r3, #0
    10b8:	da05      	bge.n	10c6 <print_int+0x2a>
    10ba:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    10be:	637b      	str	r3, [r7, #52]	; 0x34
    10c0:	687b      	ldr	r3, [r7, #4]
    10c2:	425b      	negs	r3, r3
    10c4:	607b      	str	r3, [r7, #4]
	while (i){
    10c6:	e02c      	b.n	1122 <print_int+0x86>
		fmt[pos]=i%base+'0';
    10c8:	687b      	ldr	r3, [r7, #4]
    10ca:	683a      	ldr	r2, [r7, #0]
    10cc:	fbb3 f2f2 	udiv	r2, r3, r2
    10d0:	6839      	ldr	r1, [r7, #0]
    10d2:	fb01 f202 	mul.w	r2, r1, r2
    10d6:	1a9b      	subs	r3, r3, r2
    10d8:	b2db      	uxtb	r3, r3
    10da:	3330      	adds	r3, #48	; 0x30
    10dc:	b2d9      	uxtb	r1, r3
    10de:	f107 020c 	add.w	r2, r7, #12
    10e2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    10e4:	4413      	add	r3, r2
    10e6:	460a      	mov	r2, r1
    10e8:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    10ea:	f107 020c 	add.w	r2, r7, #12
    10ee:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    10f0:	4413      	add	r3, r2
    10f2:	781b      	ldrb	r3, [r3, #0]
    10f4:	2b39      	cmp	r3, #57	; 0x39
    10f6:	d90c      	bls.n	1112 <print_int+0x76>
    10f8:	f107 020c 	add.w	r2, r7, #12
    10fc:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    10fe:	4413      	add	r3, r2
    1100:	781b      	ldrb	r3, [r3, #0]
    1102:	3307      	adds	r3, #7
    1104:	b2d9      	uxtb	r1, r3
    1106:	f107 020c 	add.w	r2, r7, #12
    110a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    110c:	4413      	add	r3, r2
    110e:	460a      	mov	r2, r1
    1110:	701a      	strb	r2, [r3, #0]
		pos--;
    1112:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1114:	3b01      	subs	r3, #1
    1116:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    1118:	687a      	ldr	r2, [r7, #4]
    111a:	683b      	ldr	r3, [r7, #0]
    111c:	fbb2 f3f3 	udiv	r3, r2, r3
    1120:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    1122:	687b      	ldr	r3, [r7, #4]
    1124:	2b00      	cmp	r3, #0
    1126:	d1cf      	bne.n	10c8 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    1128:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    112a:	2b22      	cmp	r3, #34	; 0x22
    112c:	d108      	bne.n	1140 <print_int+0xa4>
    112e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1130:	1e5a      	subs	r2, r3, #1
    1132:	633a      	str	r2, [r7, #48]	; 0x30
    1134:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1138:	4413      	add	r3, r2
    113a:	2230      	movs	r2, #48	; 0x30
    113c:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    1140:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    1142:	2b00      	cmp	r3, #0
    1144:	da08      	bge.n	1158 <print_int+0xbc>
    1146:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1148:	1e5a      	subs	r2, r3, #1
    114a:	633a      	str	r2, [r7, #48]	; 0x30
    114c:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1150:	4413      	add	r3, r2
    1152:	222d      	movs	r2, #45	; 0x2d
    1154:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    1158:	f107 020c 	add.w	r2, r7, #12
    115c:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    115e:	4413      	add	r3, r2
    1160:	2220      	movs	r2, #32
    1162:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1164:	f107 020c 	add.w	r2, r7, #12
    1168:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    116a:	4413      	add	r3, r2
    116c:	4618      	mov	r0, r3
    116e:	f7ff fe95 	bl	e9c <print>
}
    1172:	3738      	adds	r7, #56	; 0x38
    1174:	46bd      	mov	sp, r7
    1176:	bd80      	pop	{r7, pc}

00001178 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    1178:	b580      	push	{r7, lr}
    117a:	b088      	sub	sp, #32
    117c:	af00      	add	r7, sp, #0
    117e:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    1180:	230c      	movs	r3, #12
    1182:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    1184:	2300      	movs	r3, #0
    1186:	767b      	strb	r3, [r7, #25]
	while (u){
    1188:	e026      	b.n	11d8 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    118a:	687b      	ldr	r3, [r7, #4]
    118c:	b2db      	uxtb	r3, r3
    118e:	f003 030f 	and.w	r3, r3, #15
    1192:	b2db      	uxtb	r3, r3
    1194:	3330      	adds	r3, #48	; 0x30
    1196:	b2d9      	uxtb	r1, r3
    1198:	f107 020c 	add.w	r2, r7, #12
    119c:	69fb      	ldr	r3, [r7, #28]
    119e:	4413      	add	r3, r2
    11a0:	460a      	mov	r2, r1
    11a2:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    11a4:	f107 020c 	add.w	r2, r7, #12
    11a8:	69fb      	ldr	r3, [r7, #28]
    11aa:	4413      	add	r3, r2
    11ac:	781b      	ldrb	r3, [r3, #0]
    11ae:	2b39      	cmp	r3, #57	; 0x39
    11b0:	d90c      	bls.n	11cc <print_hex+0x54>
    11b2:	f107 020c 	add.w	r2, r7, #12
    11b6:	69fb      	ldr	r3, [r7, #28]
    11b8:	4413      	add	r3, r2
    11ba:	781b      	ldrb	r3, [r3, #0]
    11bc:	3307      	adds	r3, #7
    11be:	b2d9      	uxtb	r1, r3
    11c0:	f107 020c 	add.w	r2, r7, #12
    11c4:	69fb      	ldr	r3, [r7, #28]
    11c6:	4413      	add	r3, r2
    11c8:	460a      	mov	r2, r1
    11ca:	701a      	strb	r2, [r3, #0]
		pos--;
    11cc:	69fb      	ldr	r3, [r7, #28]
    11ce:	3b01      	subs	r3, #1
    11d0:	61fb      	str	r3, [r7, #28]
		u/=16;
    11d2:	687b      	ldr	r3, [r7, #4]
    11d4:	091b      	lsrs	r3, r3, #4
    11d6:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    11d8:	687b      	ldr	r3, [r7, #4]
    11da:	2b00      	cmp	r3, #0
    11dc:	d1d5      	bne.n	118a <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    11de:	69fb      	ldr	r3, [r7, #28]
    11e0:	2b0c      	cmp	r3, #12
    11e2:	d108      	bne.n	11f6 <print_hex+0x7e>
    11e4:	69fb      	ldr	r3, [r7, #28]
    11e6:	1e5a      	subs	r2, r3, #1
    11e8:	61fa      	str	r2, [r7, #28]
    11ea:	f107 0220 	add.w	r2, r7, #32
    11ee:	4413      	add	r3, r2
    11f0:	2230      	movs	r2, #48	; 0x30
    11f2:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    11f6:	69fb      	ldr	r3, [r7, #28]
    11f8:	1e5a      	subs	r2, r3, #1
    11fa:	61fa      	str	r2, [r7, #28]
    11fc:	f107 0220 	add.w	r2, r7, #32
    1200:	4413      	add	r3, r2
    1202:	2278      	movs	r2, #120	; 0x78
    1204:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    1208:	69fb      	ldr	r3, [r7, #28]
    120a:	1e5a      	subs	r2, r3, #1
    120c:	61fa      	str	r2, [r7, #28]
    120e:	f107 0220 	add.w	r2, r7, #32
    1212:	4413      	add	r3, r2
    1214:	2230      	movs	r2, #48	; 0x30
    1216:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    121a:	f107 020c 	add.w	r2, r7, #12
    121e:	69fb      	ldr	r3, [r7, #28]
    1220:	4413      	add	r3, r2
    1222:	2220      	movs	r2, #32
    1224:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1226:	f107 020c 	add.w	r2, r7, #12
    122a:	69fb      	ldr	r3, [r7, #28]
    122c:	4413      	add	r3, r2
    122e:	4618      	mov	r0, r3
    1230:	f7ff fe34 	bl	e9c <print>
}
    1234:	3720      	adds	r7, #32
    1236:	46bd      	mov	sp, r7
    1238:	bd80      	pop	{r7, pc}
    123a:	bf00      	nop

0000123c <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    123c:	b480      	push	{r7}
    123e:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    1240:	4b04      	ldr	r3, [pc, #16]	; (1254 <flush_rx_queue+0x18>)
    1242:	2200      	movs	r2, #0
    1244:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    1246:	4b03      	ldr	r3, [pc, #12]	; (1254 <flush_rx_queue+0x18>)
    1248:	2200      	movs	r2, #0
    124a:	625a      	str	r2, [r3, #36]	; 0x24
}
    124c:	46bd      	mov	sp, r7
    124e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1252:	4770      	bx	lr
    1254:	2000011c 	.word	0x2000011c

00001258 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    1258:	b480      	push	{r7}
    125a:	b085      	sub	sp, #20
    125c:	af00      	add	r7, sp, #0
    125e:	60f8      	str	r0, [r7, #12]
    1260:	60b9      	str	r1, [r7, #8]
    1262:	607a      	str	r2, [r7, #4]
	switch (port){
    1264:	68fb      	ldr	r3, [r7, #12]
    1266:	2b01      	cmp	r3, #1
    1268:	d030      	beq.n	12cc <config_pin+0x74>
    126a:	2b01      	cmp	r3, #1
    126c:	d302      	bcc.n	1274 <config_pin+0x1c>
    126e:	2b02      	cmp	r3, #2
    1270:	d058      	beq.n	1324 <config_pin+0xcc>
    1272:	e083      	b.n	137c <config_pin+0x124>
		case GPIOA:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    1274:	4b44      	ldr	r3, [pc, #272]	; (1388 <config_pin+0x130>)
    1276:	681a      	ldr	r2, [r3, #0]
    1278:	68bb      	ldr	r3, [r7, #8]
    127a:	08db      	lsrs	r3, r3, #3
    127c:	009b      	lsls	r3, r3, #2
    127e:	4413      	add	r3, r2
    1280:	4a41      	ldr	r2, [pc, #260]	; (1388 <config_pin+0x130>)
    1282:	6811      	ldr	r1, [r2, #0]
    1284:	68ba      	ldr	r2, [r7, #8]
    1286:	08d2      	lsrs	r2, r2, #3
    1288:	0092      	lsls	r2, r2, #2
    128a:	440a      	add	r2, r1
    128c:	6812      	ldr	r2, [r2, #0]
    128e:	68b9      	ldr	r1, [r7, #8]
    1290:	f001 0107 	and.w	r1, r1, #7
    1294:	200f      	movs	r0, #15
    1296:	fa00 f101 	lsl.w	r1, r0, r1
    129a:	43c9      	mvns	r1, r1
    129c:	400a      	ands	r2, r1
    129e:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    12a0:	4b39      	ldr	r3, [pc, #228]	; (1388 <config_pin+0x130>)
    12a2:	681a      	ldr	r2, [r3, #0]
    12a4:	68bb      	ldr	r3, [r7, #8]
    12a6:	08db      	lsrs	r3, r3, #3
    12a8:	009b      	lsls	r3, r3, #2
    12aa:	4413      	add	r3, r2
    12ac:	4a36      	ldr	r2, [pc, #216]	; (1388 <config_pin+0x130>)
    12ae:	6811      	ldr	r1, [r2, #0]
    12b0:	68ba      	ldr	r2, [r7, #8]
    12b2:	08d2      	lsrs	r2, r2, #3
    12b4:	0092      	lsls	r2, r2, #2
    12b6:	440a      	add	r2, r1
    12b8:	6811      	ldr	r1, [r2, #0]
    12ba:	68ba      	ldr	r2, [r7, #8]
    12bc:	f002 0207 	and.w	r2, r2, #7
    12c0:	6878      	ldr	r0, [r7, #4]
    12c2:	fa00 f202 	lsl.w	r2, r0, r2
    12c6:	430a      	orrs	r2, r1
    12c8:	601a      	str	r2, [r3, #0]
		break;
    12ca:	e057      	b.n	137c <config_pin+0x124>
		case GPIOB:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    12cc:	4b2e      	ldr	r3, [pc, #184]	; (1388 <config_pin+0x130>)
    12ce:	681a      	ldr	r2, [r3, #0]
    12d0:	68bb      	ldr	r3, [r7, #8]
    12d2:	08db      	lsrs	r3, r3, #3
    12d4:	009b      	lsls	r3, r3, #2
    12d6:	4413      	add	r3, r2
    12d8:	4a2b      	ldr	r2, [pc, #172]	; (1388 <config_pin+0x130>)
    12da:	6811      	ldr	r1, [r2, #0]
    12dc:	68ba      	ldr	r2, [r7, #8]
    12de:	08d2      	lsrs	r2, r2, #3
    12e0:	0092      	lsls	r2, r2, #2
    12e2:	440a      	add	r2, r1
    12e4:	6812      	ldr	r2, [r2, #0]
    12e6:	68b9      	ldr	r1, [r7, #8]
    12e8:	f001 0107 	and.w	r1, r1, #7
    12ec:	200f      	movs	r0, #15
    12ee:	fa00 f101 	lsl.w	r1, r0, r1
    12f2:	43c9      	mvns	r1, r1
    12f4:	400a      	ands	r2, r1
    12f6:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    12f8:	4b23      	ldr	r3, [pc, #140]	; (1388 <config_pin+0x130>)
    12fa:	681a      	ldr	r2, [r3, #0]
    12fc:	68bb      	ldr	r3, [r7, #8]
    12fe:	08db      	lsrs	r3, r3, #3
    1300:	009b      	lsls	r3, r3, #2
    1302:	4413      	add	r3, r2
    1304:	4a20      	ldr	r2, [pc, #128]	; (1388 <config_pin+0x130>)
    1306:	6811      	ldr	r1, [r2, #0]
    1308:	68ba      	ldr	r2, [r7, #8]
    130a:	08d2      	lsrs	r2, r2, #3
    130c:	0092      	lsls	r2, r2, #2
    130e:	440a      	add	r2, r1
    1310:	6811      	ldr	r1, [r2, #0]
    1312:	68ba      	ldr	r2, [r7, #8]
    1314:	f002 0207 	and.w	r2, r2, #7
    1318:	6878      	ldr	r0, [r7, #4]
    131a:	fa00 f202 	lsl.w	r2, r0, r2
    131e:	430a      	orrs	r2, r1
    1320:	601a      	str	r2, [r3, #0]
		break;
    1322:	e02b      	b.n	137c <config_pin+0x124>
		case GPIOC:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    1324:	4b18      	ldr	r3, [pc, #96]	; (1388 <config_pin+0x130>)
    1326:	681a      	ldr	r2, [r3, #0]
    1328:	68bb      	ldr	r3, [r7, #8]
    132a:	08db      	lsrs	r3, r3, #3
    132c:	009b      	lsls	r3, r3, #2
    132e:	4413      	add	r3, r2
    1330:	4a15      	ldr	r2, [pc, #84]	; (1388 <config_pin+0x130>)
    1332:	6811      	ldr	r1, [r2, #0]
    1334:	68ba      	ldr	r2, [r7, #8]
    1336:	08d2      	lsrs	r2, r2, #3
    1338:	0092      	lsls	r2, r2, #2
    133a:	440a      	add	r2, r1
    133c:	6812      	ldr	r2, [r2, #0]
    133e:	68b9      	ldr	r1, [r7, #8]
    1340:	f001 0107 	and.w	r1, r1, #7
    1344:	200f      	movs	r0, #15
    1346:	fa00 f101 	lsl.w	r1, r0, r1
    134a:	43c9      	mvns	r1, r1
    134c:	400a      	ands	r2, r1
    134e:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    1350:	4b0d      	ldr	r3, [pc, #52]	; (1388 <config_pin+0x130>)
    1352:	681a      	ldr	r2, [r3, #0]
    1354:	68bb      	ldr	r3, [r7, #8]
    1356:	08db      	lsrs	r3, r3, #3
    1358:	009b      	lsls	r3, r3, #2
    135a:	4413      	add	r3, r2
    135c:	4a0a      	ldr	r2, [pc, #40]	; (1388 <config_pin+0x130>)
    135e:	6811      	ldr	r1, [r2, #0]
    1360:	68ba      	ldr	r2, [r7, #8]
    1362:	08d2      	lsrs	r2, r2, #3
    1364:	0092      	lsls	r2, r2, #2
    1366:	440a      	add	r2, r1
    1368:	6811      	ldr	r1, [r2, #0]
    136a:	68ba      	ldr	r2, [r7, #8]
    136c:	f002 0207 	and.w	r2, r2, #7
    1370:	6878      	ldr	r0, [r7, #4]
    1372:	fa00 f202 	lsl.w	r2, r0, r2
    1376:	430a      	orrs	r2, r1
    1378:	601a      	str	r2, [r3, #0]
		break;
    137a:	bf00      	nop
	}
}
    137c:	3714      	adds	r7, #20
    137e:	46bd      	mov	sp, r7
    1380:	f85d 7b04 	ldr.w	r7, [sp], #4
    1384:	4770      	bx	lr
    1386:	bf00      	nop
    1388:	2000000c 	.word	0x2000000c

0000138c <enable_interrupt>:





void enable_interrupt(unsigned irq){
    138c:	b480      	push	{r7}
    138e:	b085      	sub	sp, #20
    1390:	af00      	add	r7, sp, #0
    1392:	6078      	str	r0, [r7, #4]
	sfrp_t iser=(sfrp_t)(NVIC_ISER0_ADR);
    1394:	4b0d      	ldr	r3, [pc, #52]	; (13cc <enable_interrupt+0x40>)
    1396:	60fb      	str	r3, [r7, #12]
	if (irq>LAST_IRQ) return ;
    1398:	687b      	ldr	r3, [r7, #4]
    139a:	2b3b      	cmp	r3, #59	; 0x3b
    139c:	d900      	bls.n	13a0 <enable_interrupt+0x14>
    139e:	e010      	b.n	13c2 <enable_interrupt+0x36>
	iser[irq/32]|=1<<(irq%32);
    13a0:	687b      	ldr	r3, [r7, #4]
    13a2:	095b      	lsrs	r3, r3, #5
    13a4:	009a      	lsls	r2, r3, #2
    13a6:	68f9      	ldr	r1, [r7, #12]
    13a8:	440a      	add	r2, r1
    13aa:	009b      	lsls	r3, r3, #2
    13ac:	68f9      	ldr	r1, [r7, #12]
    13ae:	440b      	add	r3, r1
    13b0:	681b      	ldr	r3, [r3, #0]
    13b2:	6879      	ldr	r1, [r7, #4]
    13b4:	f001 011f 	and.w	r1, r1, #31
    13b8:	2001      	movs	r0, #1
    13ba:	fa00 f101 	lsl.w	r1, r0, r1
    13be:	430b      	orrs	r3, r1
    13c0:	6013      	str	r3, [r2, #0]
	
}
    13c2:	3714      	adds	r7, #20
    13c4:	46bd      	mov	sp, r7
    13c6:	f85d 7b04 	ldr.w	r7, [sp], #4
    13ca:	4770      	bx	lr
    13cc:	e000e100 	.word	0xe000e100

000013d0 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    13d0:	b480      	push	{r7}
    13d2:	b085      	sub	sp, #20
    13d4:	af00      	add	r7, sp, #0
    13d6:	6078      	str	r0, [r7, #4]
	sfrp_t icer=(sfrp_t)(NVIC_ICER0_ADR);
    13d8:	4b0e      	ldr	r3, [pc, #56]	; (1414 <disable_interrupt+0x44>)
    13da:	60fb      	str	r3, [r7, #12]
	if (irq>LAST_IRQ) return ;
    13dc:	687b      	ldr	r3, [r7, #4]
    13de:	2b3b      	cmp	r3, #59	; 0x3b
    13e0:	d900      	bls.n	13e4 <disable_interrupt+0x14>
    13e2:	e011      	b.n	1408 <disable_interrupt+0x38>
	icer[irq/32]&=~(1<<(irq%32));
    13e4:	687b      	ldr	r3, [r7, #4]
    13e6:	095b      	lsrs	r3, r3, #5
    13e8:	009a      	lsls	r2, r3, #2
    13ea:	68f9      	ldr	r1, [r7, #12]
    13ec:	440a      	add	r2, r1
    13ee:	009b      	lsls	r3, r3, #2
    13f0:	68f9      	ldr	r1, [r7, #12]
    13f2:	440b      	add	r3, r1
    13f4:	681b      	ldr	r3, [r3, #0]
    13f6:	6879      	ldr	r1, [r7, #4]
    13f8:	f001 011f 	and.w	r1, r1, #31
    13fc:	2001      	movs	r0, #1
    13fe:	fa00 f101 	lsl.w	r1, r0, r1
    1402:	43c9      	mvns	r1, r1
    1404:	400b      	ands	r3, r1
    1406:	6013      	str	r3, [r2, #0]
	
}
    1408:	3714      	adds	r7, #20
    140a:	46bd      	mov	sp, r7
    140c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1410:	4770      	bx	lr
    1412:	bf00      	nop
    1414:	e000e180 	.word	0xe000e180

00001418 <set_int_priority>:


typedef volatile uint8_t* ipr_t;
typedef volatile uint8_t* shpr_t;
void set_int_priority(int32_t irq, unsigned priority){
    1418:	b480      	push	{r7}
    141a:	b085      	sub	sp, #20
    141c:	af00      	add	r7, sp, #0
    141e:	6078      	str	r0, [r7, #4]
    1420:	6039      	str	r1, [r7, #0]
	ipr_t ipr=(ipr_t)NVIC_IPR0_ADR;
    1422:	4b15      	ldr	r3, [pc, #84]	; (1478 <set_int_priority+0x60>)
    1424:	60fb      	str	r3, [r7, #12]
	shpr_t shpr=(shpr_t)(SCB_BASE_ADR+24);
    1426:	4b15      	ldr	r3, [pc, #84]	; (147c <set_int_priority+0x64>)
    1428:	60bb      	str	r3, [r7, #8]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    142a:	687b      	ldr	r3, [r7, #4]
    142c:	2b00      	cmp	r3, #0
    142e:	db0b      	blt.n	1448 <set_int_priority+0x30>
    1430:	687b      	ldr	r3, [r7, #4]
    1432:	2b3b      	cmp	r3, #59	; 0x3b
    1434:	dc08      	bgt.n	1448 <set_int_priority+0x30>
		ipr[irq]=(uint8_t)((priority&15)<<4);
    1436:	687b      	ldr	r3, [r7, #4]
    1438:	68fa      	ldr	r2, [r7, #12]
    143a:	4413      	add	r3, r2
    143c:	683a      	ldr	r2, [r7, #0]
    143e:	b2d2      	uxtb	r2, r2
    1440:	0112      	lsls	r2, r2, #4
    1442:	b2d2      	uxtb	r2, r2
    1444:	701a      	strb	r2, [r3, #0]
    1446:	e012      	b.n	146e <set_int_priority+0x56>
	}else if ((irq<0) && (irq>-16)){
    1448:	687b      	ldr	r3, [r7, #4]
    144a:	2b00      	cmp	r3, #0
    144c:	da0f      	bge.n	146e <set_int_priority+0x56>
    144e:	687b      	ldr	r3, [r7, #4]
    1450:	f113 0f0f 	cmn.w	r3, #15
    1454:	db0b      	blt.n	146e <set_int_priority+0x56>
		shpr[-(irq+4)]=(uint8_t)((priority&15)<<4);
    1456:	687a      	ldr	r2, [r7, #4]
    1458:	f06f 0303 	mvn.w	r3, #3
    145c:	1a9b      	subs	r3, r3, r2
    145e:	461a      	mov	r2, r3
    1460:	68bb      	ldr	r3, [r7, #8]
    1462:	4413      	add	r3, r2
    1464:	683a      	ldr	r2, [r7, #0]
    1466:	b2d2      	uxtb	r2, r2
    1468:	0112      	lsls	r2, r2, #4
    146a:	b2d2      	uxtb	r2, r2
    146c:	701a      	strb	r2, [r3, #0]
	}
}
    146e:	3714      	adds	r7, #20
    1470:	46bd      	mov	sp, r7
    1472:	f85d 7b04 	ldr.w	r7, [sp], #4
    1476:	4770      	bx	lr
    1478:	e000e400 	.word	0xe000e400
    147c:	e000ed18 	.word	0xe000ed18

00001480 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg){
    1480:	b580      	push	{r7, lr}
    1482:	b082      	sub	sp, #8
    1484:	af00      	add	r7, sp, #0
    1486:	6078      	str	r0, [r7, #4]
	print(msg);
    1488:	6878      	ldr	r0, [r7, #4]
    148a:	f7ff fd07 	bl	e9c <print>
	print("UFSR=");
    148e:	480f      	ldr	r0, [pc, #60]	; (14cc <print_fault+0x4c>)
    1490:	f7ff fd04 	bl	e9c <print>
	print_hex(((*(sfrp_t)0xE000ED28)&0xffff0000)>>16);
    1494:	4b0e      	ldr	r3, [pc, #56]	; (14d0 <print_fault+0x50>)
    1496:	681b      	ldr	r3, [r3, #0]
    1498:	0c1b      	lsrs	r3, r3, #16
    149a:	4618      	mov	r0, r3
    149c:	f7ff fe6c 	bl	1178 <print_hex>
	print(", BFSR=");
    14a0:	480c      	ldr	r0, [pc, #48]	; (14d4 <print_fault+0x54>)
    14a2:	f7ff fcfb 	bl	e9c <print>
	print_hex(((*(sfrp_t)0xE000ED28)&0xff00)>>8);
    14a6:	4b0a      	ldr	r3, [pc, #40]	; (14d0 <print_fault+0x50>)
    14a8:	681b      	ldr	r3, [r3, #0]
    14aa:	f403 437f 	and.w	r3, r3, #65280	; 0xff00
    14ae:	0a1b      	lsrs	r3, r3, #8
    14b0:	4618      	mov	r0, r3
    14b2:	f7ff fe61 	bl	1178 <print_hex>
	print(", MMFSR=");
    14b6:	4808      	ldr	r0, [pc, #32]	; (14d8 <print_fault+0x58>)
    14b8:	f7ff fcf0 	bl	e9c <print>
	print_hex(((*(sfrp_t)0xE000ED28)&0xff));
    14bc:	4b04      	ldr	r3, [pc, #16]	; (14d0 <print_fault+0x50>)
    14be:	681b      	ldr	r3, [r3, #0]
    14c0:	b2db      	uxtb	r3, r3
    14c2:	4618      	mov	r0, r3
    14c4:	f7ff fe58 	bl	1178 <print_hex>
	while(1);
    14c8:	e7fe      	b.n	14c8 <print_fault+0x48>
    14ca:	bf00      	nop
    14cc:	00001878 	.word	0x00001878
    14d0:	e000ed28 	.word	0xe000ed28
    14d4:	00001880 	.word	0x00001880
    14d8:	00001888 	.word	0x00001888

000014dc <reset_mcu>:
_default_handler(USART2_handler) // 38
_default_handler(USART3_handler) // 39

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    14dc:	4b01      	ldr	r3, [pc, #4]	; (14e4 <reset_mcu+0x8>)
    14de:	4a02      	ldr	r2, [pc, #8]	; (14e8 <reset_mcu+0xc>)
    14e0:	601a      	str	r2, [r3, #0]
    14e2:	bf00      	nop
    14e4:	e000ed0c 	.word	0xe000ed0c
    14e8:	05fa0004 	.word	0x05fa0004

000014ec <uart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
    14ec:	b480      	push	{r7}
    14ee:	b085      	sub	sp, #20
    14f0:	af00      	add	r7, sp, #0
    14f2:	6078      	str	r0, [r7, #4]
    14f4:	6039      	str	r1, [r7, #0]
	sfrp_t brr;
	uint32_t rate;

    brr=(sfrp_t)(channel+USART_BRR_OFS);		
    14f6:	687b      	ldr	r3, [r7, #4]
    14f8:	3308      	adds	r3, #8
    14fa:	60bb      	str	r3, [r7, #8]
	switch (channel){
    14fc:	687b      	ldr	r3, [r7, #4]
    14fe:	4a1a      	ldr	r2, [pc, #104]	; (1568 <uart_set_baud+0x7c>)
    1500:	4293      	cmp	r3, r2
    1502:	d019      	beq.n	1538 <uart_set_baud+0x4c>
    1504:	4a19      	ldr	r2, [pc, #100]	; (156c <uart_set_baud+0x80>)
    1506:	4293      	cmp	r3, r2
    1508:	d003      	beq.n	1512 <uart_set_baud+0x26>
    150a:	4a19      	ldr	r2, [pc, #100]	; (1570 <uart_set_baud+0x84>)
    150c:	4293      	cmp	r3, r2
    150e:	d013      	beq.n	1538 <uart_set_baud+0x4c>
    1510:	e021      	b.n	1556 <uart_set_baud+0x6a>
	case USART1:
		rate=(FAPB2/baud/16)<<4;
    1512:	4a18      	ldr	r2, [pc, #96]	; (1574 <uart_set_baud+0x88>)
    1514:	683b      	ldr	r3, [r7, #0]
    1516:	fbb2 f3f3 	udiv	r3, r2, r3
    151a:	011b      	lsls	r3, r3, #4
    151c:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    151e:	4a16      	ldr	r2, [pc, #88]	; (1578 <uart_set_baud+0x8c>)
    1520:	683b      	ldr	r3, [r7, #0]
    1522:	fbb2 f3f3 	udiv	r3, r2, r3
    1526:	f003 030f 	and.w	r3, r3, #15
    152a:	68fa      	ldr	r2, [r7, #12]
    152c:	4313      	orrs	r3, r2
    152e:	60fb      	str	r3, [r7, #12]
		*brr=rate;
    1530:	68bb      	ldr	r3, [r7, #8]
    1532:	68fa      	ldr	r2, [r7, #12]
    1534:	601a      	str	r2, [r3, #0]
		return;
    1536:	e011      	b.n	155c <uart_set_baud+0x70>
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
    1538:	4a10      	ldr	r2, [pc, #64]	; (157c <uart_set_baud+0x90>)
    153a:	683b      	ldr	r3, [r7, #0]
    153c:	fbb2 f3f3 	udiv	r3, r2, r3
    1540:	011b      	lsls	r3, r3, #4
    1542:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    1544:	4a0e      	ldr	r2, [pc, #56]	; (1580 <uart_set_baud+0x94>)
    1546:	683b      	ldr	r3, [r7, #0]
    1548:	fbb2 f3f3 	udiv	r3, r2, r3
    154c:	f003 030f 	and.w	r3, r3, #15
    1550:	68fa      	ldr	r2, [r7, #12]
    1552:	4313      	orrs	r3, r2
    1554:	60fb      	str	r3, [r7, #12]
	}
	*brr=rate;
    1556:	68bb      	ldr	r3, [r7, #8]
    1558:	68fa      	ldr	r2, [r7, #12]
    155a:	601a      	str	r2, [r3, #0]
}
    155c:	3714      	adds	r7, #20
    155e:	46bd      	mov	sp, r7
    1560:	f85d 7b04 	ldr.w	r7, [sp], #4
    1564:	4770      	bx	lr
    1566:	bf00      	nop
    1568:	40004800 	.word	0x40004800
    156c:	40013800 	.word	0x40013800
    1570:	40004400 	.word	0x40004400
    1574:	0044aa20 	.word	0x0044aa20
    1578:	044aa200 	.word	0x044aa200
    157c:	00225510 	.word	0x00225510
    1580:	02255100 	.word	0x02255100

00001584 <uart_open_channel>:

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl){
    1584:	b580      	push	{r7, lr}
    1586:	b086      	sub	sp, #24
    1588:	af00      	add	r7, sp, #0
    158a:	60f8      	str	r0, [r7, #12]
    158c:	60b9      	str	r1, [r7, #8]
    158e:	607a      	str	r2, [r7, #4]
	sfrp_t cr1, cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
    1590:	68fb      	ldr	r3, [r7, #12]
    1592:	4a42      	ldr	r2, [pc, #264]	; (169c <uart_open_channel+0x118>)
    1594:	4293      	cmp	r3, r2
    1596:	d046      	beq.n	1626 <uart_open_channel+0xa2>
    1598:	4a41      	ldr	r2, [pc, #260]	; (16a0 <uart_open_channel+0x11c>)
    159a:	4293      	cmp	r3, r2
    159c:	d003      	beq.n	15a6 <uart_open_channel+0x22>
    159e:	4a41      	ldr	r2, [pc, #260]	; (16a4 <uart_open_channel+0x120>)
    15a0:	4293      	cmp	r3, r2
    15a2:	d020      	beq.n	15e6 <uart_open_channel+0x62>
    15a4:	e05f      	b.n	1666 <uart_open_channel+0xe2>
	case USART1:
		RCC_APB2ENR|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
    15a6:	4a40      	ldr	r2, [pc, #256]	; (16a8 <uart_open_channel+0x124>)
    15a8:	4b3f      	ldr	r3, [pc, #252]	; (16a8 <uart_open_channel+0x124>)
    15aa:	681b      	ldr	r3, [r3, #0]
    15ac:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    15b0:	f043 0304 	orr.w	r3, r3, #4
    15b4:	6013      	str	r3, [r2, #0]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    15b6:	4b3d      	ldr	r3, [pc, #244]	; (16ac <uart_open_channel+0x128>)
    15b8:	681a      	ldr	r2, [r3, #0]
    15ba:	4b3c      	ldr	r3, [pc, #240]	; (16ac <uart_open_channel+0x128>)
    15bc:	681b      	ldr	r3, [r3, #0]
    15be:	681b      	ldr	r3, [r3, #0]
    15c0:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    15c4:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    15c8:	6013      	str	r3, [r2, #0]
		GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    15ca:	4b38      	ldr	r3, [pc, #224]	; (16ac <uart_open_channel+0x128>)
    15cc:	681a      	ldr	r2, [r3, #0]
    15ce:	4b37      	ldr	r3, [pc, #220]	; (16ac <uart_open_channel+0x128>)
    15d0:	681b      	ldr	r3, [r3, #0]
    15d2:	681b      	ldr	r3, [r3, #0]
    15d4:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    15d8:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    15dc:	6013      	str	r3, [r2, #0]
		enable_interrupt(USART1_IRQ);
    15de:	2025      	movs	r0, #37	; 0x25
    15e0:	f7ff fed4 	bl	138c <enable_interrupt>
		break;
    15e4:	e03f      	b.n	1666 <uart_open_channel+0xe2>
	case USART2:
		RCC_APB1ENR|=(1<<RCC_APB1ENR_USART2EN);
    15e6:	4a32      	ldr	r2, [pc, #200]	; (16b0 <uart_open_channel+0x12c>)
    15e8:	4b31      	ldr	r3, [pc, #196]	; (16b0 <uart_open_channel+0x12c>)
    15ea:	681b      	ldr	r3, [r3, #0]
    15ec:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    15f0:	6013      	str	r3, [r2, #0]
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPAEN);
    15f2:	4a2d      	ldr	r2, [pc, #180]	; (16a8 <uart_open_channel+0x124>)
    15f4:	4b2c      	ldr	r3, [pc, #176]	; (16a8 <uart_open_channel+0x124>)
    15f6:	681b      	ldr	r3, [r3, #0]
    15f8:	f043 0304 	orr.w	r3, r3, #4
    15fc:	6013      	str	r3, [r2, #0]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX (push-pull)
		// PA3 -> RX (floating)
		GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    15fe:	4b2d      	ldr	r3, [pc, #180]	; (16b4 <uart_open_channel+0x130>)
    1600:	681b      	ldr	r3, [r3, #0]
    1602:	4a2c      	ldr	r2, [pc, #176]	; (16b4 <uart_open_channel+0x130>)
    1604:	6812      	ldr	r2, [r2, #0]
    1606:	6812      	ldr	r2, [r2, #0]
    1608:	f422 627f 	bic.w	r2, r2, #4080	; 0xff0
    160c:	601a      	str	r2, [r3, #0]
		GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    160e:	4b29      	ldr	r3, [pc, #164]	; (16b4 <uart_open_channel+0x130>)
    1610:	681b      	ldr	r3, [r3, #0]
    1612:	4a28      	ldr	r2, [pc, #160]	; (16b4 <uart_open_channel+0x130>)
    1614:	6812      	ldr	r2, [r2, #0]
    1616:	6812      	ldr	r2, [r2, #0]
    1618:	f442 622a 	orr.w	r2, r2, #2720	; 0xaa0
    161c:	601a      	str	r2, [r3, #0]
		enable_interrupt(USART2_IRQ);
    161e:	2026      	movs	r0, #38	; 0x26
    1620:	f7ff feb4 	bl	138c <enable_interrupt>
		break;
    1624:	e01f      	b.n	1666 <uart_open_channel+0xe2>
	case USART3:
		RCC_APB1ENR|=1<<RCC_APB1ENR_USART3EN;
    1626:	4a22      	ldr	r2, [pc, #136]	; (16b0 <uart_open_channel+0x12c>)
    1628:	4b21      	ldr	r3, [pc, #132]	; (16b0 <uart_open_channel+0x12c>)
    162a:	681b      	ldr	r3, [r3, #0]
    162c:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    1630:	6013      	str	r3, [r2, #0]
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPBEN);
    1632:	4a1d      	ldr	r2, [pc, #116]	; (16a8 <uart_open_channel+0x124>)
    1634:	4b1c      	ldr	r3, [pc, #112]	; (16a8 <uart_open_channel+0x124>)
    1636:	681b      	ldr	r3, [r3, #0]
    1638:	f043 0308 	orr.w	r3, r3, #8
    163c:	6013      	str	r3, [r2, #0]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    163e:	4b1e      	ldr	r3, [pc, #120]	; (16b8 <uart_open_channel+0x134>)
    1640:	681b      	ldr	r3, [r3, #0]
    1642:	4a1d      	ldr	r2, [pc, #116]	; (16b8 <uart_open_channel+0x134>)
    1644:	6812      	ldr	r2, [r2, #0]
    1646:	6812      	ldr	r2, [r2, #0]
    1648:	f022 220f 	bic.w	r2, r2, #251662080	; 0xf000f00
    164c:	601a      	str	r2, [r3, #0]
		GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    164e:	4b1a      	ldr	r3, [pc, #104]	; (16b8 <uart_open_channel+0x134>)
    1650:	681b      	ldr	r3, [r3, #0]
    1652:	4a19      	ldr	r2, [pc, #100]	; (16b8 <uart_open_channel+0x134>)
    1654:	6812      	ldr	r2, [r2, #0]
    1656:	6812      	ldr	r2, [r2, #0]
    1658:	f042 220a 	orr.w	r2, r2, #167774720	; 0xa000a00
    165c:	601a      	str	r2, [r3, #0]
		enable_interrupt(USART3_IRQ);
    165e:	2027      	movs	r0, #39	; 0x27
    1660:	f7ff fe94 	bl	138c <enable_interrupt>
		break;
    1664:	bf00      	nop
	}
	uart_set_baud(channel,baud);
    1666:	68f8      	ldr	r0, [r7, #12]
    1668:	68b9      	ldr	r1, [r7, #8]
    166a:	f7ff ff3f 	bl	14ec <uart_set_baud>
	if (flow_ctrl==FLOW_HARD){
    166e:	687b      	ldr	r3, [r7, #4]
    1670:	2b01      	cmp	r3, #1
    1672:	d106      	bne.n	1682 <uart_open_channel+0xfe>
		cr3=(sfrp_t)(channel+USART_CR3_OFS);
    1674:	68fb      	ldr	r3, [r7, #12]
    1676:	3314      	adds	r3, #20
    1678:	617b      	str	r3, [r7, #20]
		*cr3=(1<<USART_CR3_CTSE)|(1<<USART_CR3_RTSE);
    167a:	697b      	ldr	r3, [r7, #20]
    167c:	f44f 7240 	mov.w	r2, #768	; 0x300
    1680:	601a      	str	r2, [r3, #0]
	}
	cr1=(sfrp_t)(channel+USART_CR1_OFS);
    1682:	68fb      	ldr	r3, [r7, #12]
    1684:	330c      	adds	r3, #12
    1686:	613b      	str	r3, [r7, #16]
	uart_getc(channel);
    1688:	68f8      	ldr	r0, [r7, #12]
    168a:	f000 f82d 	bl	16e8 <uart_getc>
	*cr1=(1<<USART_CR1_UE)|(1<<USART_CR1_TE)|(1<<USART_CR1_RE)|(1<<USART_CR1_RXNEIE);
    168e:	693b      	ldr	r3, [r7, #16]
    1690:	f242 022c 	movw	r2, #8236	; 0x202c
    1694:	601a      	str	r2, [r3, #0]
}
    1696:	3718      	adds	r7, #24
    1698:	46bd      	mov	sp, r7
    169a:	bd80      	pop	{r7, pc}
    169c:	40004800 	.word	0x40004800
    16a0:	40013800 	.word	0x40013800
    16a4:	40004400 	.word	0x40004400
    16a8:	40021018 	.word	0x40021018
    16ac:	20000008 	.word	0x20000008
    16b0:	4002101c 	.word	0x4002101c
    16b4:	20000004 	.word	0x20000004
    16b8:	20000028 	.word	0x20000028

000016bc <uart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int uart_stat(unsigned channel){
    16bc:	b480      	push	{r7}
    16be:	b085      	sub	sp, #20
    16c0:	af00      	add	r7, sp, #0
    16c2:	6078      	str	r0, [r7, #4]
	sfrp_t sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    16c4:	687b      	ldr	r3, [r7, #4]
    16c6:	60fb      	str	r3, [r7, #12]
	return *sr&(1<<USART_SR_RXNE)?-1:0;
    16c8:	68fb      	ldr	r3, [r7, #12]
    16ca:	681b      	ldr	r3, [r3, #0]
    16cc:	f003 0320 	and.w	r3, r3, #32
    16d0:	2b00      	cmp	r3, #0
    16d2:	d002      	beq.n	16da <uart_stat+0x1e>
    16d4:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    16d8:	e000      	b.n	16dc <uart_stat+0x20>
    16da:	2300      	movs	r3, #0
}
    16dc:	4618      	mov	r0, r3
    16de:	3714      	adds	r7, #20
    16e0:	46bd      	mov	sp, r7
    16e2:	f85d 7b04 	ldr.w	r7, [sp], #4
    16e6:	4770      	bx	lr

000016e8 <uart_getc>:

// reçoit un caractère de la console
char uart_getc(unsigned channel){
    16e8:	b480      	push	{r7}
    16ea:	b085      	sub	sp, #20
    16ec:	af00      	add	r7, sp, #0
    16ee:	6078      	str	r0, [r7, #4]
	sfrp_t dr;
	
	dr=(sfrp_t)(channel+USART_DR_OFS);
    16f0:	687b      	ldr	r3, [r7, #4]
    16f2:	3304      	adds	r3, #4
    16f4:	60fb      	str	r3, [r7, #12]
	return *dr&0x7f;
    16f6:	68fb      	ldr	r3, [r7, #12]
    16f8:	681b      	ldr	r3, [r3, #0]
    16fa:	b2db      	uxtb	r3, r3
    16fc:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    1700:	b2db      	uxtb	r3, r3
}
    1702:	4618      	mov	r0, r3
    1704:	3714      	adds	r7, #20
    1706:	46bd      	mov	sp, r7
    1708:	f85d 7b04 	ldr.w	r7, [sp], #4
    170c:	4770      	bx	lr
    170e:	bf00      	nop

00001710 <uart_putc>:

// transmet un caractère à la console
void uart_putc(unsigned channel, char c){
    1710:	b480      	push	{r7}
    1712:	b085      	sub	sp, #20
    1714:	af00      	add	r7, sp, #0
    1716:	6078      	str	r0, [r7, #4]
    1718:	460b      	mov	r3, r1
    171a:	70fb      	strb	r3, [r7, #3]
	sfrp_t dr, sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    171c:	687b      	ldr	r3, [r7, #4]
    171e:	60fb      	str	r3, [r7, #12]
	dr=(sfrp_t)(channel+USART_DR_OFS);
    1720:	687b      	ldr	r3, [r7, #4]
    1722:	3304      	adds	r3, #4
    1724:	60bb      	str	r3, [r7, #8]
	//attend que dr soit vide
	while (!(*sr&(1<<USART_SR_TXE)));
    1726:	bf00      	nop
    1728:	68fb      	ldr	r3, [r7, #12]
    172a:	681b      	ldr	r3, [r3, #0]
    172c:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1730:	2b00      	cmp	r3, #0
    1732:	d0f9      	beq.n	1728 <uart_putc+0x18>
	*dr=c&0x7f;
    1734:	78fb      	ldrb	r3, [r7, #3]
    1736:	f003 027f 	and.w	r2, r3, #127	; 0x7f
    173a:	68bb      	ldr	r3, [r7, #8]
    173c:	601a      	str	r2, [r3, #0]
}
    173e:	3714      	adds	r7, #20
    1740:	46bd      	mov	sp, r7
    1742:	f85d 7b04 	ldr.w	r7, [sp], #4
    1746:	4770      	bx	lr

Disassembly of section .user_code:

000018e0 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used)) blink(){
    18e0:	b480      	push	{r7}
    18e2:	b083      	sub	sp, #12
    18e4:	af00      	add	r7, sp, #0
	volatile unsigned int  delay;
	volatile char c=0;
    18e6:	2300      	movs	r3, #0
    18e8:	70fb      	strb	r3, [r7, #3]
	
	delay=500;
    18ea:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    18ee:	607b      	str	r3, [r7, #4]
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    18f0:	2300      	movs	r3, #0
    18f2:	2200      	movs	r2, #0
    18f4:	4618      	mov	r0, r3
    18f6:	4611      	mov	r1, r2
    18f8:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    18fa:	1d3b      	adds	r3, r7, #4
    18fc:	2200      	movs	r2, #0
    18fe:	4618      	mov	r0, r3
    1900:	4611      	mov	r1, r2
    1902:	df03      	svc	3
		_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    1904:	2300      	movs	r3, #0
    1906:	2200      	movs	r2, #0
    1908:	4618      	mov	r0, r3
    190a:	4611      	mov	r1, r2
    190c:	df05      	svc	5
		_svc_call(SVC_LED_ON,NUL,NUL);
    190e:	2300      	movs	r3, #0
    1910:	2200      	movs	r2, #0
    1912:	4618      	mov	r0, r3
    1914:	4611      	mov	r1, r2
    1916:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    1918:	1d3b      	adds	r3, r7, #4
    191a:	2200      	movs	r2, #0
    191c:	4618      	mov	r0, r3
    191e:	4611      	mov	r1, r2
    1920:	df03      	svc	3
		_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    1922:	2300      	movs	r3, #0
    1924:	2200      	movs	r2, #0
    1926:	4618      	mov	r0, r3
    1928:	4611      	mov	r1, r2
    192a:	df05      	svc	5
		_svc_call(SVC_CONIN,&c,NUL);
    192c:	1cfb      	adds	r3, r7, #3
    192e:	2200      	movs	r2, #0
    1930:	4618      	mov	r0, r3
    1932:	4611      	mov	r1, r2
    1934:	df06      	svc	6
		if (c) break;
    1936:	78fb      	ldrb	r3, [r7, #3]
    1938:	b2db      	uxtb	r3, r3
    193a:	2b00      	cmp	r3, #0
    193c:	d000      	beq.n	1940 <blink+0x60>
    193e:	e000      	b.n	1942 <blink+0x62>
	}
    1940:	e7d6      	b.n	18f0 <blink+0x10>
}
    1942:	370c      	adds	r7, #12
    1944:	46bd      	mov	sp, r7
    1946:	f85d 7b04 	ldr.w	r7, [sp], #4
    194a:	4770      	bx	lr
