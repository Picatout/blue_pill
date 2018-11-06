
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 25 1a 00 00     i...m...q...%...
      20:	25 1a 00 00 25 1a 00 00 25 1a 00 00 b1 05 00 00     %...%...%.......
      30:	25 1a 00 00 25 1a 00 00 79 02 00 00 65 07 00 00     %...%...y...e...
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 25 1a 00 00 25 1a 00 00 81 1d 00 00     ....%...%.......
      80:	25 1a 00 00 25 1a 00 00 25 1a 00 00 25 1a 00 00     %...%...%...%...
      90:	25 1a 00 00 25 1a 00 00 25 1a 00 00 25 1a 00 00     %...%...%...%...
      a0:	25 1a 00 00 25 1a 00 00 25 1a 00 00 59 1c 00 00     %...%...%...Y...
      b0:	25 1a 00 00 25 1a 00 00 25 1a 00 00 25 1a 00 00     %...%...%...%...
      c0:	25 1a 00 00 25 1a 00 00 25 1a 00 00 25 1a 00 00     %...%...%...%...
      d0:	25 1a 00 00 bd 02 00 00 59 10 00 00 c5 02 00 00     %.......Y.......
      e0:	25 1a 00 00 25 1a 00 00 25 1a 00 00 25 1a 00 00     %...%...%...%...
      f0:	25 1a 00 00 25 1a 00 00 25 1a 00 00 25 1a 00 00     %...%...%...%...
     100:	25 1a 00 00 25 1a 00 00 25 1a 00 00 25 1a 00 00     %...%...%...%...
     110:	25 1a 00 00 25 1a 00 00 25 1a 00 00 25 1a 00 00     %...%...%...%...
     120:	25 1a 00 00 25 1a 00 00 25 1a 00 00 25 1a 00 00     %...%...%...%...

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
     1c0:	2000266c 	.word	0x2000266c
     1c4:	00002880 	.word	0x00002880
     1c8:	20000000 	.word	0x20000000
     1cc:	20000008 	.word	0x20000008
     1d0:	20002700 	.word	0x20002700
     1d4:	200000e4 	.word	0x200000e4
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
     208:	f001 fc14 	bl	1a34 <print_fault>
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
     21e:	f001 fc09 	bl	1a34 <print_fault>
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
     234:	f001 fbfe 	bl	1a34 <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f001 fbf9 	bl	1a34 <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	000024c8 	.word	0x000024c8
     258:	000024e0 	.word	0x000024e0
     25c:	000024ec 	.word	0x000024ec
     260:	000024fc 	.word	0x000024fc

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f001 fbde 	bl	1a24 <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f001 fbdc 	bl	1a24 <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f001 fbda 	bl	1a24 <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f001 fbd8 	bl	1a24 <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f001 fbd6 	bl	1a24 <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f001 fbd4 	bl	1a24 <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f001 fbd2 	bl	1a24 <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f001 fbd0 	bl	1a24 <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f001 fbce 	bl	1a24 <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f001 fbcc 	bl	1a24 <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f001 fbca 	bl	1a24 <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f001 fbc8 	bl	1a24 <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f001 fbc6 	bl	1a24 <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f001 fbc4 	bl	1a24 <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f001 fbc2 	bl	1a24 <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f001 fbc0 	bl	1a24 <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f001 fbbe 	bl	1a24 <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f001 fbbc 	bl	1a24 <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f001 fbba 	bl	1a24 <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f001 fbb8 	bl	1a24 <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f001 fbb6 	bl	1a24 <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2b8:	f001 fbb4 	bl	1a24 <reset_mcu>

000002bc <USART1_handler>:
_default_handler(USART1_handler) // 37
     2bc:	f001 fbb2 	bl	1a24 <reset_mcu>
_default_handler(USART2_handler) // 38
     2c0:	f001 fbb0 	bl	1a24 <reset_mcu>

000002c4 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2c4:	f001 fbae 	bl	1a24 <reset_mcu>

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
     654:	f000 fd3a 	bl	10cc <conin>
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
     668:	f000 fd20 	bl	10ac <conout>
		break;
     66c:	e072      	b.n	754 <SVC_handler+0x1a4>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     66e:	68bb      	ldr	r3, [r7, #8]
     670:	681b      	ldr	r3, [r3, #0]
     672:	6878      	ldr	r0, [r7, #4]
     674:	4619      	mov	r1, r3
     676:	f000 fda1 	bl	11bc <read_line>
     67a:	4602      	mov	r2, r0
     67c:	68bb      	ldr	r3, [r7, #8]
     67e:	601a      	str	r2, [r3, #0]
		break;
     680:	e068      	b.n	754 <SVC_handler+0x1a4>
	case SVC_PRINT:
		print((const char*)arg1);
     682:	68b8      	ldr	r0, [r7, #8]
     684:	f000 fd44 	bl	1110 <print>
		break;
     688:	e064      	b.n	754 <SVC_handler+0x1a4>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     68a:	68bb      	ldr	r3, [r7, #8]
     68c:	681b      	ldr	r3, [r3, #0]
     68e:	4618      	mov	r0, r3
     690:	210a      	movs	r1, #10
     692:	f000 fe3d 	bl	1310 <print_int>
		break;
     696:	e05d      	b.n	754 <SVC_handler+0x1a4>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     698:	68bb      	ldr	r3, [r7, #8]
     69a:	681b      	ldr	r3, [r3, #0]
     69c:	4618      	mov	r0, r3
     69e:	f000 fea5 	bl	13ec <print_hex>
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
     726:	f000 ff13 	bl	1550 <flash_write>
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
     738:	f000 ff4e 	bl	15d8 <flash_erase_page>
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
     74e:	f001 f969 	bl	1a24 <reset_mcu>
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
     822:	f000 ffbb 	bl	179c <set_int_priority>
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
     960:	000020d4 	.word	0x000020d4

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
     97a:	f000 fbc9 	bl	1110 <print>
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
     9e8:	000020d4 	.word	0x000020d4

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
     a34:	000020d4 	.word	0x000020d4

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
     a44:	200000e4 	.word	0x200000e4

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
     bb4:	f000 faac 	bl	1110 <print>
}
     bb8:	3708      	adds	r7, #8
     bba:	46bd      	mov	sp, r7
     bbc:	bd80      	pop	{r7, pc}
     bbe:	bf00      	nop
     bc0:	20000060 	.word	0x20000060
     bc4:	00002020 	.word	0x00002020

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
     bee:	f000 fa8f 	bl	1110 <print>
}
     bf2:	3708      	adds	r7, #8
     bf4:	46bd      	mov	sp, r7
     bf6:	bd80      	pop	{r7, pc}
     bf8:	20000060 	.word	0x20000060
     bfc:	00002020 	.word	0x00002020

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
     c74:	000020d4 	.word	0x000020d4

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
     f02:	f000 f8d3 	bl	10ac <conout>
			print((const char*)pad); conout('?');
     f06:	480a      	ldr	r0, [pc, #40]	; (f30 <parse_line+0x60>)
     f08:	f000 f902 	bl	1110 <print>
     f0c:	203f      	movs	r0, #63	; 0x3f
     f0e:	f000 f8cd 	bl	10ac <conout>
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
     f20:	f000 f8c4 	bl	10ac <conout>
}
     f24:	3710      	adds	r7, #16
     f26:	46bd      	mov	sp, r7
     f28:	bd80      	pop	{r7, pc}
     f2a:	bf00      	nop
     f2c:	200000b0 	.word	0x200000b0
     f30:	20000060 	.word	0x20000060
     f34:	000020d4 	.word	0x000020d4

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
     f70:	00002800 	.word	0x00002800
     f74:	00002880 	.word	0x00002880
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
     f8c:	f000 fc06 	bl	179c <set_int_priority>
	config_systicks();
     f90:	f7ff fc42 	bl	818 <config_systicks>
	flash_enable();
     f94:	f000 fa9a 	bl	14cc <flash_enable>
	APB2ENR->fld.iopcen=1;
     f98:	4b27      	ldr	r3, [pc, #156]	; (1038 <main+0xbc>)
     f9a:	681a      	ldr	r2, [r3, #0]
     f9c:	f042 0210 	orr.w	r2, r2, #16
     fa0:	601a      	str	r2, [r3, #0]
	APB2ENR->fld.iopaen=1;
     fa2:	4b25      	ldr	r3, [pc, #148]	; (1038 <main+0xbc>)
     fa4:	681a      	ldr	r2, [r3, #0]
     fa6:	f042 0204 	orr.w	r2, r2, #4
     faa:	601a      	str	r2, [r3, #0]
	APB2ENR->fld.iopben=1;
     fac:	4b22      	ldr	r3, [pc, #136]	; (1038 <main+0xbc>)
     fae:	681a      	ldr	r2, [r3, #0]
     fb0:	f042 0208 	orr.w	r2, r2, #8
     fb4:	601a      	str	r2, [r3, #0]
	APB2ENR->fld.afioen=1;
     fb6:	4b20      	ldr	r3, [pc, #128]	; (1038 <main+0xbc>)
     fb8:	681a      	ldr	r2, [r3, #0]
     fba:	f042 0201 	orr.w	r2, r2, #1
     fbe:	601a      	str	r2, [r3, #0]
	APB1ENR->fld.spi2en=1;
     fc0:	4b1e      	ldr	r3, [pc, #120]	; (103c <main+0xc0>)
     fc2:	681a      	ldr	r2, [r3, #0]
     fc4:	f442 4280 	orr.w	r2, r2, #16384	; 0x4000
     fc8:	601a      	str	r2, [r3, #0]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     fca:	4a1d      	ldr	r2, [pc, #116]	; (1040 <main+0xc4>)
     fcc:	4b1c      	ldr	r3, [pc, #112]	; (1040 <main+0xc4>)
     fce:	695b      	ldr	r3, [r3, #20]
     fd0:	f043 0301 	orr.w	r3, r3, #1
     fd4:	6153      	str	r3, [r2, #20]
	config_pin(GPIOC,LED_PIN,OUTPUT_OD_SLOW);
     fd6:	2002      	movs	r0, #2
     fd8:	210d      	movs	r1, #13
     fda:	2206      	movs	r2, #6
     fdc:	f000 fb52 	bl	1684 <config_pin>
	uart_open_channel(CON,115200,FLOW_HARD);
     fe0:	4818      	ldr	r0, [pc, #96]	; (1044 <main+0xc8>)
     fe2:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     fe6:	2201      	movs	r2, #1
     fe8:	f000 ff32 	bl	1e50 <uart_open_channel>
	tvout_init();
     fec:	f000 fd6a 	bl	1ac4 <tvout_init>
	cls();
     ff0:	f000 f8be 	bl	1170 <cls>
	print(VERSION);
     ff4:	4b14      	ldr	r3, [pc, #80]	; (1048 <main+0xcc>)
     ff6:	681b      	ldr	r3, [r3, #0]
     ff8:	4618      	mov	r0, r3
     ffa:	f000 f889 	bl	1110 <print>
	copy_blink_in_ram();
     ffe:	f7ff ff9b 	bl	f38 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
    1002:	4812      	ldr	r0, [pc, #72]	; (104c <main+0xd0>)
    1004:	f000 f884 	bl	1110 <print>
    1008:	4b11      	ldr	r3, [pc, #68]	; (1050 <main+0xd4>)
    100a:	2200      	movs	r2, #0
    100c:	4618      	mov	r0, r3
    100e:	4611      	mov	r1, r2
    1010:	df0a      	svc	10
    1012:	200d      	movs	r0, #13
    1014:	f000 f84a 	bl	10ac <conout>
	//print_int(VIDEO_DELAY,10);
	_svc_call(SVC_LED_ON,NUL,NUL);
    1018:	2300      	movs	r3, #0
    101a:	2200      	movs	r2, #0
    101c:	4618      	mov	r0, r3
    101e:	4611      	mov	r1, r2
    1020:	df01      	svc	1
	flush_rx_queue();
    1022:	f000 fa45 	bl	14b0 <flush_rx_queue>
	unsigned llen;// char c;
	while (1){ // if ((c=conin())) conout(c);
		llen=read_line(tib,CMD_MAX_LEN);
    1026:	480b      	ldr	r0, [pc, #44]	; (1054 <main+0xd8>)
    1028:	2150      	movs	r1, #80	; 0x50
    102a:	f000 f8c7 	bl	11bc <read_line>
    102e:	6078      	str	r0, [r7, #4]
		parse_line(llen);
    1030:	6878      	ldr	r0, [r7, #4]
    1032:	f7ff ff4d 	bl	ed0 <parse_line>
	}
    1036:	e7f6      	b.n	1026 <main+0xaa>
    1038:	40021018 	.word	0x40021018
    103c:	4002101c 	.word	0x4002101c
    1040:	40021000 	.word	0x40021000
    1044:	40004400 	.word	0x40004400
    1048:	20000000 	.word	0x20000000
    104c:	00002184 	.word	0x00002184
    1050:	200000e4 	.word	0x200000e4
    1054:	20000010 	.word	0x20000010

00001058 <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
    1058:	4668      	mov	r0, sp
    105a:	f020 0107 	bic.w	r1, r0, #7
    105e:	468d      	mov	sp, r1
    1060:	b481      	push	{r0, r7}
    1062:	af00      	add	r7, sp, #0
	if (USART2_SR&(1<<USART_SR_RXNE)){
    1064:	4b0e      	ldr	r3, [pc, #56]	; (10a0 <USART2_handler+0x48>)
    1066:	681b      	ldr	r3, [r3, #0]
    1068:	f003 0320 	and.w	r3, r3, #32
    106c:	2b00      	cmp	r3, #0
    106e:	d012      	beq.n	1096 <USART2_handler+0x3e>
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
    1070:	4b0c      	ldr	r3, [pc, #48]	; (10a4 <USART2_handler+0x4c>)
    1072:	6a1b      	ldr	r3, [r3, #32]
    1074:	1c5a      	adds	r2, r3, #1
    1076:	490b      	ldr	r1, [pc, #44]	; (10a4 <USART2_handler+0x4c>)
    1078:	620a      	str	r2, [r1, #32]
    107a:	4a0b      	ldr	r2, [pc, #44]	; (10a8 <USART2_handler+0x50>)
    107c:	6812      	ldr	r2, [r2, #0]
    107e:	b2d2      	uxtb	r2, r2
    1080:	f002 027f 	and.w	r2, r2, #127	; 0x7f
    1084:	b2d1      	uxtb	r1, r2
    1086:	4a07      	ldr	r2, [pc, #28]	; (10a4 <USART2_handler+0x4c>)
    1088:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
    108a:	4b06      	ldr	r3, [pc, #24]	; (10a4 <USART2_handler+0x4c>)
    108c:	6a1b      	ldr	r3, [r3, #32]
    108e:	f003 031f 	and.w	r3, r3, #31
    1092:	4a04      	ldr	r2, [pc, #16]	; (10a4 <USART2_handler+0x4c>)
    1094:	6213      	str	r3, [r2, #32]
	}
}
    1096:	46bd      	mov	sp, r7
    1098:	bc81      	pop	{r0, r7}
    109a:	4685      	mov	sp, r0
    109c:	4770      	bx	lr
    109e:	bf00      	nop
    10a0:	40004400 	.word	0x40004400
    10a4:	200000b4 	.word	0x200000b4
    10a8:	40004404 	.word	0x40004404

000010ac <conout>:


// envoie d'un caractère à la console
void conout(char c){
    10ac:	b580      	push	{r7, lr}
    10ae:	b082      	sub	sp, #8
    10b0:	af00      	add	r7, sp, #0
    10b2:	4603      	mov	r3, r0
    10b4:	71fb      	strb	r3, [r7, #7]
	uart_putc(CON,c);
    10b6:	79fb      	ldrb	r3, [r7, #7]
    10b8:	4803      	ldr	r0, [pc, #12]	; (10c8 <conout+0x1c>)
    10ba:	4619      	mov	r1, r3
    10bc:	f000 ff8a 	bl	1fd4 <uart_putc>
}
    10c0:	3708      	adds	r7, #8
    10c2:	46bd      	mov	sp, r7
    10c4:	bd80      	pop	{r7, pc}
    10c6:	bf00      	nop
    10c8:	40004400 	.word	0x40004400

000010cc <conin>:


// réception d'un caractère de la console
char conin(){
    10cc:	b480      	push	{r7}
    10ce:	b083      	sub	sp, #12
    10d0:	af00      	add	r7, sp, #0
	char c=0;
    10d2:	2300      	movs	r3, #0
    10d4:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
    10d6:	4b0d      	ldr	r3, [pc, #52]	; (110c <conin+0x40>)
    10d8:	6a1a      	ldr	r2, [r3, #32]
    10da:	4b0c      	ldr	r3, [pc, #48]	; (110c <conin+0x40>)
    10dc:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10de:	429a      	cmp	r2, r3
    10e0:	d00d      	beq.n	10fe <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
    10e2:	4b0a      	ldr	r3, [pc, #40]	; (110c <conin+0x40>)
    10e4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10e6:	1c5a      	adds	r2, r3, #1
    10e8:	4908      	ldr	r1, [pc, #32]	; (110c <conin+0x40>)
    10ea:	624a      	str	r2, [r1, #36]	; 0x24
    10ec:	4a07      	ldr	r2, [pc, #28]	; (110c <conin+0x40>)
    10ee:	5cd3      	ldrb	r3, [r2, r3]
    10f0:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
    10f2:	4b06      	ldr	r3, [pc, #24]	; (110c <conin+0x40>)
    10f4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    10f6:	f003 031f 	and.w	r3, r3, #31
    10fa:	4a04      	ldr	r2, [pc, #16]	; (110c <conin+0x40>)
    10fc:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
    10fe:	79fb      	ldrb	r3, [r7, #7]
}
    1100:	4618      	mov	r0, r3
    1102:	370c      	adds	r7, #12
    1104:	46bd      	mov	sp, r7
    1106:	f85d 7b04 	ldr.w	r7, [sp], #4
    110a:	4770      	bx	lr
    110c:	200000b4 	.word	0x200000b4

00001110 <print>:

// imprime un chaîne sur la console
void print(const char *str){
    1110:	b580      	push	{r7, lr}
    1112:	b082      	sub	sp, #8
    1114:	af00      	add	r7, sp, #0
    1116:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
    1118:	e006      	b.n	1128 <print+0x18>
    111a:	687b      	ldr	r3, [r7, #4]
    111c:	1c5a      	adds	r2, r3, #1
    111e:	607a      	str	r2, [r7, #4]
    1120:	781b      	ldrb	r3, [r3, #0]
    1122:	4618      	mov	r0, r3
    1124:	f7ff ffc2 	bl	10ac <conout>
    1128:	687b      	ldr	r3, [r7, #4]
    112a:	781b      	ldrb	r3, [r3, #0]
    112c:	2b00      	cmp	r3, #0
    112e:	d1f4      	bne.n	111a <print+0xa>
}
    1130:	3708      	adds	r7, #8
    1132:	46bd      	mov	sp, r7
    1134:	bd80      	pop	{r7, pc}
    1136:	bf00      	nop

00001138 <beep>:

void beep(){
    1138:	b480      	push	{r7}
    113a:	af00      	add	r7, sp, #0
}
    113c:	46bd      	mov	sp, r7
    113e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1142:	4770      	bx	lr

00001144 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    1144:	b580      	push	{r7, lr}
    1146:	af00      	add	r7, sp, #0
	conout(BS);
    1148:	2008      	movs	r0, #8
    114a:	f7ff ffaf 	bl	10ac <conout>
	conout(SPACE);
    114e:	2020      	movs	r0, #32
    1150:	f7ff ffac 	bl	10ac <conout>
	conout(BS);
    1154:	2008      	movs	r0, #8
    1156:	f7ff ffa9 	bl	10ac <conout>
}
    115a:	bd80      	pop	{r7, pc}

0000115c <esc_seq>:

void esc_seq(){
    115c:	b580      	push	{r7, lr}
    115e:	af00      	add	r7, sp, #0
	conout(ESC);
    1160:	201b      	movs	r0, #27
    1162:	f7ff ffa3 	bl	10ac <conout>
	conout('[');
    1166:	205b      	movs	r0, #91	; 0x5b
    1168:	f7ff ffa0 	bl	10ac <conout>
}
    116c:	bd80      	pop	{r7, pc}
    116e:	bf00      	nop

00001170 <cls>:

// vide l'écran de la console
void cls(){
    1170:	b580      	push	{r7, lr}
    1172:	af00      	add	r7, sp, #0
	esc_seq();
    1174:	f7ff fff2 	bl	115c <esc_seq>
	conout('2');
    1178:	2032      	movs	r0, #50	; 0x32
    117a:	f7ff ff97 	bl	10ac <conout>
	conout('J');
    117e:	204a      	movs	r0, #74	; 0x4a
    1180:	f7ff ff94 	bl	10ac <conout>
}
    1184:	bd80      	pop	{r7, pc}
    1186:	bf00      	nop

00001188 <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
    1188:	b580      	push	{r7, lr}
    118a:	b082      	sub	sp, #8
    118c:	af00      	add	r7, sp, #0
    118e:	6078      	str	r0, [r7, #4]
	esc_seq();
    1190:	f7ff ffe4 	bl	115c <esc_seq>
	conout('2');
    1194:	2032      	movs	r0, #50	; 0x32
    1196:	f7ff ff89 	bl	10ac <conout>
	conout('K');
    119a:	204b      	movs	r0, #75	; 0x4b
    119c:	f7ff ff86 	bl	10ac <conout>
	while (n){conout(BS);n--;}
    11a0:	e005      	b.n	11ae <clear_line+0x26>
    11a2:	2008      	movs	r0, #8
    11a4:	f7ff ff82 	bl	10ac <conout>
    11a8:	687b      	ldr	r3, [r7, #4]
    11aa:	3b01      	subs	r3, #1
    11ac:	607b      	str	r3, [r7, #4]
    11ae:	687b      	ldr	r3, [r7, #4]
    11b0:	2b00      	cmp	r3, #0
    11b2:	d1f6      	bne.n	11a2 <clear_line+0x1a>
}
    11b4:	3708      	adds	r7, #8
    11b6:	46bd      	mov	sp, r7
    11b8:	bd80      	pop	{r7, pc}
    11ba:	bf00      	nop

000011bc <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    11bc:	b580      	push	{r7, lr}
    11be:	b084      	sub	sp, #16
    11c0:	af00      	add	r7, sp, #0
    11c2:	6078      	str	r0, [r7, #4]
    11c4:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    11c6:	2300      	movs	r3, #0
    11c8:	60fb      	str	r3, [r7, #12]
	char c=0;
    11ca:	2300      	movs	r3, #0
    11cc:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    11ce:	683b      	ldr	r3, [r7, #0]
    11d0:	3b01      	subs	r3, #1
    11d2:	603b      	str	r3, [r7, #0]
	while (c!=13){
    11d4:	e08e      	b.n	12f4 <read_line+0x138>
			c=conin();
    11d6:	f7ff ff79 	bl	10cc <conin>
    11da:	4603      	mov	r3, r0
    11dc:	72fb      	strb	r3, [r7, #11]
			switch(c){
    11de:	7afb      	ldrb	r3, [r7, #11]
    11e0:	2b18      	cmp	r3, #24
    11e2:	d872      	bhi.n	12ca <read_line+0x10e>
    11e4:	a201      	add	r2, pc, #4	; (adr r2, 11ec <read_line+0x30>)
    11e6:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    11ea:	bf00      	nop
    11ec:	000012f5 	.word	0x000012f5
    11f0:	000012cb 	.word	0x000012cb
    11f4:	000012cb 	.word	0x000012cb
    11f8:	000012cb 	.word	0x000012cb
    11fc:	000012cb 	.word	0x000012cb
    1200:	000012bd 	.word	0x000012bd
    1204:	000012cb 	.word	0x000012cb
    1208:	000012cb 	.word	0x000012cb
    120c:	000012ab 	.word	0x000012ab
    1210:	000012c7 	.word	0x000012c7
    1214:	00001251 	.word	0x00001251
    1218:	000012cb 	.word	0x000012cb
    121c:	000012cb 	.word	0x000012cb
    1220:	00001251 	.word	0x00001251
    1224:	000012cb 	.word	0x000012cb
    1228:	000012cb 	.word	0x000012cb
    122c:	000012cb 	.word	0x000012cb
    1230:	000012cb 	.word	0x000012cb
    1234:	000012cb 	.word	0x000012cb
    1238:	000012cb 	.word	0x000012cb
    123c:	000012cb 	.word	0x000012cb
    1240:	0000125f 	.word	0x0000125f
    1244:	000012cb 	.word	0x000012cb
    1248:	00001275 	.word	0x00001275
    124c:	0000125f 	.word	0x0000125f
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    1250:	230d      	movs	r3, #13
    1252:	72fb      	strb	r3, [r7, #11]
				conout(c);
    1254:	7afb      	ldrb	r3, [r7, #11]
    1256:	4618      	mov	r0, r3
    1258:	f7ff ff28 	bl	10ac <conout>
				break;
    125c:	e04a      	b.n	12f4 <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
    125e:	68f8      	ldr	r0, [r7, #12]
    1260:	f7ff ff92 	bl	1188 <clear_line>
				line_len=0;
    1264:	2300      	movs	r3, #0
    1266:	60fb      	str	r3, [r7, #12]
				break;
    1268:	e044      	b.n	12f4 <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    126a:	f7ff ff6b 	bl	1144 <delete_back>
					line_len--;
    126e:	68fb      	ldr	r3, [r7, #12]
    1270:	3b01      	subs	r3, #1
    1272:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    1274:	68fb      	ldr	r3, [r7, #12]
    1276:	2b00      	cmp	r3, #0
    1278:	d006      	beq.n	1288 <read_line+0xcc>
    127a:	68fb      	ldr	r3, [r7, #12]
    127c:	3b01      	subs	r3, #1
    127e:	687a      	ldr	r2, [r7, #4]
    1280:	4413      	add	r3, r2
    1282:	781b      	ldrb	r3, [r3, #0]
    1284:	2b20      	cmp	r3, #32
    1286:	d0f0      	beq.n	126a <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1288:	e004      	b.n	1294 <read_line+0xd8>
					delete_back();
    128a:	f7ff ff5b 	bl	1144 <delete_back>
					line_len--;
    128e:	68fb      	ldr	r3, [r7, #12]
    1290:	3b01      	subs	r3, #1
    1292:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1294:	68fb      	ldr	r3, [r7, #12]
    1296:	2b00      	cmp	r3, #0
    1298:	d006      	beq.n	12a8 <read_line+0xec>
    129a:	68fb      	ldr	r3, [r7, #12]
    129c:	3b01      	subs	r3, #1
    129e:	687a      	ldr	r2, [r7, #4]
    12a0:	4413      	add	r3, r2
    12a2:	781b      	ldrb	r3, [r3, #0]
    12a4:	2b20      	cmp	r3, #32
    12a6:	d1f0      	bne.n	128a <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    12a8:	e024      	b.n	12f4 <read_line+0x138>
				case BS:
				if (line_len){
    12aa:	68fb      	ldr	r3, [r7, #12]
    12ac:	2b00      	cmp	r3, #0
    12ae:	d004      	beq.n	12ba <read_line+0xfe>
					delete_back();
    12b0:	f7ff ff48 	bl	1144 <delete_back>
					line_len--;
    12b4:	68fb      	ldr	r3, [r7, #12]
    12b6:	3b01      	subs	r3, #1
    12b8:	60fb      	str	r3, [r7, #12]
				}
				break;
    12ba:	e01b      	b.n	12f4 <read_line+0x138>
				case CTRL_E:
				cls();
    12bc:	f7ff ff58 	bl	1170 <cls>
				line_len=0;
    12c0:	2300      	movs	r3, #0
    12c2:	60fb      	str	r3, [r7, #12]
				break;
    12c4:	e016      	b.n	12f4 <read_line+0x138>
				case TAB:
				c=SPACE;
    12c6:	2320      	movs	r3, #32
    12c8:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    12ca:	68fa      	ldr	r2, [r7, #12]
    12cc:	683b      	ldr	r3, [r7, #0]
    12ce:	429a      	cmp	r2, r3
    12d0:	d20e      	bcs.n	12f0 <read_line+0x134>
    12d2:	7afb      	ldrb	r3, [r7, #11]
    12d4:	2b1f      	cmp	r3, #31
    12d6:	d90b      	bls.n	12f0 <read_line+0x134>
					buffer[line_len++]=c;
    12d8:	68fb      	ldr	r3, [r7, #12]
    12da:	1c5a      	adds	r2, r3, #1
    12dc:	60fa      	str	r2, [r7, #12]
    12de:	687a      	ldr	r2, [r7, #4]
    12e0:	4413      	add	r3, r2
    12e2:	7afa      	ldrb	r2, [r7, #11]
    12e4:	701a      	strb	r2, [r3, #0]
					conout(c);
    12e6:	7afb      	ldrb	r3, [r7, #11]
    12e8:	4618      	mov	r0, r3
    12ea:	f7ff fedf 	bl	10ac <conout>
    12ee:	e001      	b.n	12f4 <read_line+0x138>
				}else{
					beep();
    12f0:	f7ff ff22 	bl	1138 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    12f4:	7afb      	ldrb	r3, [r7, #11]
    12f6:	2b0d      	cmp	r3, #13
    12f8:	f47f af6d 	bne.w	11d6 <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    12fc:	687a      	ldr	r2, [r7, #4]
    12fe:	68fb      	ldr	r3, [r7, #12]
    1300:	4413      	add	r3, r2
    1302:	2200      	movs	r2, #0
    1304:	701a      	strb	r2, [r3, #0]
	return line_len;
    1306:	68fb      	ldr	r3, [r7, #12]
}
    1308:	4618      	mov	r0, r3
    130a:	3710      	adds	r7, #16
    130c:	46bd      	mov	sp, r7
    130e:	bd80      	pop	{r7, pc}

00001310 <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    1310:	b580      	push	{r7, lr}
    1312:	b08e      	sub	sp, #56	; 0x38
    1314:	af00      	add	r7, sp, #0
    1316:	6078      	str	r0, [r7, #4]
    1318:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    131a:	2301      	movs	r3, #1
    131c:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    131e:	2322      	movs	r3, #34	; 0x22
    1320:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    1322:	2300      	movs	r3, #0
    1324:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1328:	687b      	ldr	r3, [r7, #4]
    132a:	2b00      	cmp	r3, #0
    132c:	da05      	bge.n	133a <print_int+0x2a>
    132e:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1332:	637b      	str	r3, [r7, #52]	; 0x34
    1334:	687b      	ldr	r3, [r7, #4]
    1336:	425b      	negs	r3, r3
    1338:	607b      	str	r3, [r7, #4]
	while (i){
    133a:	e02c      	b.n	1396 <print_int+0x86>
		fmt[pos]=i%base+'0';
    133c:	687b      	ldr	r3, [r7, #4]
    133e:	683a      	ldr	r2, [r7, #0]
    1340:	fbb3 f2f2 	udiv	r2, r3, r2
    1344:	6839      	ldr	r1, [r7, #0]
    1346:	fb01 f202 	mul.w	r2, r1, r2
    134a:	1a9b      	subs	r3, r3, r2
    134c:	b2db      	uxtb	r3, r3
    134e:	3330      	adds	r3, #48	; 0x30
    1350:	b2d9      	uxtb	r1, r3
    1352:	f107 020c 	add.w	r2, r7, #12
    1356:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1358:	4413      	add	r3, r2
    135a:	460a      	mov	r2, r1
    135c:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    135e:	f107 020c 	add.w	r2, r7, #12
    1362:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1364:	4413      	add	r3, r2
    1366:	781b      	ldrb	r3, [r3, #0]
    1368:	2b39      	cmp	r3, #57	; 0x39
    136a:	d90c      	bls.n	1386 <print_int+0x76>
    136c:	f107 020c 	add.w	r2, r7, #12
    1370:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1372:	4413      	add	r3, r2
    1374:	781b      	ldrb	r3, [r3, #0]
    1376:	3307      	adds	r3, #7
    1378:	b2d9      	uxtb	r1, r3
    137a:	f107 020c 	add.w	r2, r7, #12
    137e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1380:	4413      	add	r3, r2
    1382:	460a      	mov	r2, r1
    1384:	701a      	strb	r2, [r3, #0]
		pos--;
    1386:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1388:	3b01      	subs	r3, #1
    138a:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    138c:	687a      	ldr	r2, [r7, #4]
    138e:	683b      	ldr	r3, [r7, #0]
    1390:	fbb2 f3f3 	udiv	r3, r2, r3
    1394:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    1396:	687b      	ldr	r3, [r7, #4]
    1398:	2b00      	cmp	r3, #0
    139a:	d1cf      	bne.n	133c <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    139c:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    139e:	2b22      	cmp	r3, #34	; 0x22
    13a0:	d108      	bne.n	13b4 <print_int+0xa4>
    13a2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13a4:	1e5a      	subs	r2, r3, #1
    13a6:	633a      	str	r2, [r7, #48]	; 0x30
    13a8:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13ac:	4413      	add	r3, r2
    13ae:	2230      	movs	r2, #48	; 0x30
    13b0:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    13b4:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    13b6:	2b00      	cmp	r3, #0
    13b8:	da08      	bge.n	13cc <print_int+0xbc>
    13ba:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13bc:	1e5a      	subs	r2, r3, #1
    13be:	633a      	str	r2, [r7, #48]	; 0x30
    13c0:	f107 0238 	add.w	r2, r7, #56	; 0x38
    13c4:	4413      	add	r3, r2
    13c6:	222d      	movs	r2, #45	; 0x2d
    13c8:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    13cc:	f107 020c 	add.w	r2, r7, #12
    13d0:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13d2:	4413      	add	r3, r2
    13d4:	2220      	movs	r2, #32
    13d6:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    13d8:	f107 020c 	add.w	r2, r7, #12
    13dc:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13de:	4413      	add	r3, r2
    13e0:	4618      	mov	r0, r3
    13e2:	f7ff fe95 	bl	1110 <print>
}
    13e6:	3738      	adds	r7, #56	; 0x38
    13e8:	46bd      	mov	sp, r7
    13ea:	bd80      	pop	{r7, pc}

000013ec <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    13ec:	b580      	push	{r7, lr}
    13ee:	b088      	sub	sp, #32
    13f0:	af00      	add	r7, sp, #0
    13f2:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    13f4:	230c      	movs	r3, #12
    13f6:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    13f8:	2300      	movs	r3, #0
    13fa:	767b      	strb	r3, [r7, #25]
	while (u){
    13fc:	e026      	b.n	144c <print_hex+0x60>
		fmt[pos]=u%16+'0';
    13fe:	687b      	ldr	r3, [r7, #4]
    1400:	b2db      	uxtb	r3, r3
    1402:	f003 030f 	and.w	r3, r3, #15
    1406:	b2db      	uxtb	r3, r3
    1408:	3330      	adds	r3, #48	; 0x30
    140a:	b2d9      	uxtb	r1, r3
    140c:	f107 020c 	add.w	r2, r7, #12
    1410:	69fb      	ldr	r3, [r7, #28]
    1412:	4413      	add	r3, r2
    1414:	460a      	mov	r2, r1
    1416:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1418:	f107 020c 	add.w	r2, r7, #12
    141c:	69fb      	ldr	r3, [r7, #28]
    141e:	4413      	add	r3, r2
    1420:	781b      	ldrb	r3, [r3, #0]
    1422:	2b39      	cmp	r3, #57	; 0x39
    1424:	d90c      	bls.n	1440 <print_hex+0x54>
    1426:	f107 020c 	add.w	r2, r7, #12
    142a:	69fb      	ldr	r3, [r7, #28]
    142c:	4413      	add	r3, r2
    142e:	781b      	ldrb	r3, [r3, #0]
    1430:	3307      	adds	r3, #7
    1432:	b2d9      	uxtb	r1, r3
    1434:	f107 020c 	add.w	r2, r7, #12
    1438:	69fb      	ldr	r3, [r7, #28]
    143a:	4413      	add	r3, r2
    143c:	460a      	mov	r2, r1
    143e:	701a      	strb	r2, [r3, #0]
		pos--;
    1440:	69fb      	ldr	r3, [r7, #28]
    1442:	3b01      	subs	r3, #1
    1444:	61fb      	str	r3, [r7, #28]
		u/=16;
    1446:	687b      	ldr	r3, [r7, #4]
    1448:	091b      	lsrs	r3, r3, #4
    144a:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    144c:	687b      	ldr	r3, [r7, #4]
    144e:	2b00      	cmp	r3, #0
    1450:	d1d5      	bne.n	13fe <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    1452:	69fb      	ldr	r3, [r7, #28]
    1454:	2b0c      	cmp	r3, #12
    1456:	d108      	bne.n	146a <print_hex+0x7e>
    1458:	69fb      	ldr	r3, [r7, #28]
    145a:	1e5a      	subs	r2, r3, #1
    145c:	61fa      	str	r2, [r7, #28]
    145e:	f107 0220 	add.w	r2, r7, #32
    1462:	4413      	add	r3, r2
    1464:	2230      	movs	r2, #48	; 0x30
    1466:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    146a:	69fb      	ldr	r3, [r7, #28]
    146c:	1e5a      	subs	r2, r3, #1
    146e:	61fa      	str	r2, [r7, #28]
    1470:	f107 0220 	add.w	r2, r7, #32
    1474:	4413      	add	r3, r2
    1476:	2278      	movs	r2, #120	; 0x78
    1478:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    147c:	69fb      	ldr	r3, [r7, #28]
    147e:	1e5a      	subs	r2, r3, #1
    1480:	61fa      	str	r2, [r7, #28]
    1482:	f107 0220 	add.w	r2, r7, #32
    1486:	4413      	add	r3, r2
    1488:	2230      	movs	r2, #48	; 0x30
    148a:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    148e:	f107 020c 	add.w	r2, r7, #12
    1492:	69fb      	ldr	r3, [r7, #28]
    1494:	4413      	add	r3, r2
    1496:	2220      	movs	r2, #32
    1498:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    149a:	f107 020c 	add.w	r2, r7, #12
    149e:	69fb      	ldr	r3, [r7, #28]
    14a0:	4413      	add	r3, r2
    14a2:	4618      	mov	r0, r3
    14a4:	f7ff fe34 	bl	1110 <print>
}
    14a8:	3720      	adds	r7, #32
    14aa:	46bd      	mov	sp, r7
    14ac:	bd80      	pop	{r7, pc}
    14ae:	bf00      	nop

000014b0 <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    14b0:	b480      	push	{r7}
    14b2:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    14b4:	4b04      	ldr	r3, [pc, #16]	; (14c8 <flush_rx_queue+0x18>)
    14b6:	2200      	movs	r2, #0
    14b8:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    14ba:	4b03      	ldr	r3, [pc, #12]	; (14c8 <flush_rx_queue+0x18>)
    14bc:	2200      	movs	r2, #0
    14be:	625a      	str	r2, [r3, #36]	; 0x24
}
    14c0:	46bd      	mov	sp, r7
    14c2:	f85d 7b04 	ldr.w	r7, [sp], #4
    14c6:	4770      	bx	lr
    14c8:	200000b4 	.word	0x200000b4

000014cc <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    14cc:	b480      	push	{r7}
    14ce:	af00      	add	r7, sp, #0
	if (!RCC_CR->fld.hsion){ // activation clock HSI
    14d0:	4b14      	ldr	r3, [pc, #80]	; (1524 <flash_enable+0x58>)
    14d2:	681b      	ldr	r3, [r3, #0]
    14d4:	f003 0301 	and.w	r3, r3, #1
    14d8:	b2db      	uxtb	r3, r3
    14da:	2b00      	cmp	r3, #0
    14dc:	d10d      	bne.n	14fa <flash_enable+0x2e>
		RCC_CR->fld.hsion=1;
    14de:	4b11      	ldr	r3, [pc, #68]	; (1524 <flash_enable+0x58>)
    14e0:	681a      	ldr	r2, [r3, #0]
    14e2:	f042 0201 	orr.w	r2, r2, #1
    14e6:	601a      	str	r2, [r3, #0]
		while (!RCC_CR->fld.hsirdy);
    14e8:	bf00      	nop
    14ea:	4b0e      	ldr	r3, [pc, #56]	; (1524 <flash_enable+0x58>)
    14ec:	681b      	ldr	r3, [r3, #0]
    14ee:	085b      	lsrs	r3, r3, #1
    14f0:	f003 0301 	and.w	r3, r3, #1
    14f4:	b2db      	uxtb	r3, r3
    14f6:	2b00      	cmp	r3, #0
    14f8:	d0f7      	beq.n	14ea <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    14fa:	4b0b      	ldr	r3, [pc, #44]	; (1528 <flash_enable+0x5c>)
    14fc:	4a0b      	ldr	r2, [pc, #44]	; (152c <flash_enable+0x60>)
    14fe:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    1500:	4b09      	ldr	r3, [pc, #36]	; (1528 <flash_enable+0x5c>)
    1502:	4a0b      	ldr	r2, [pc, #44]	; (1530 <flash_enable+0x64>)
    1504:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    1506:	4b08      	ldr	r3, [pc, #32]	; (1528 <flash_enable+0x5c>)
    1508:	691b      	ldr	r3, [r3, #16]
    150a:	f003 0380 	and.w	r3, r3, #128	; 0x80
    150e:	2b00      	cmp	r3, #0
    1510:	bf0c      	ite	eq
    1512:	2301      	moveq	r3, #1
    1514:	2300      	movne	r3, #0
    1516:	b2db      	uxtb	r3, r3
}
    1518:	4618      	mov	r0, r3
    151a:	46bd      	mov	sp, r7
    151c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1520:	4770      	bx	lr
    1522:	bf00      	nop
    1524:	40021000 	.word	0x40021000
    1528:	40022000 	.word	0x40022000
    152c:	45670123 	.word	0x45670123
    1530:	cdef89ab 	.word	0xcdef89ab

00001534 <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    1534:	b480      	push	{r7}
    1536:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    1538:	4a04      	ldr	r2, [pc, #16]	; (154c <flash_disable+0x18>)
    153a:	4b04      	ldr	r3, [pc, #16]	; (154c <flash_disable+0x18>)
    153c:	691b      	ldr	r3, [r3, #16]
    153e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    1542:	6113      	str	r3, [r2, #16]
}
    1544:	46bd      	mov	sp, r7
    1546:	f85d 7b04 	ldr.w	r7, [sp], #4
    154a:	4770      	bx	lr
    154c:	40022000 	.word	0x40022000

00001550 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1550:	b480      	push	{r7}
    1552:	b083      	sub	sp, #12
    1554:	af00      	add	r7, sp, #0
    1556:	6078      	str	r0, [r7, #4]
    1558:	460b      	mov	r3, r1
    155a:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    155c:	4b1d      	ldr	r3, [pc, #116]	; (15d4 <flash_write+0x84>)
    155e:	691b      	ldr	r3, [r3, #16]
    1560:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1564:	2b00      	cmp	r3, #0
    1566:	d105      	bne.n	1574 <flash_write+0x24>
    1568:	687b      	ldr	r3, [r7, #4]
    156a:	881b      	ldrh	r3, [r3, #0]
    156c:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1570:	4293      	cmp	r3, r2
    1572:	d001      	beq.n	1578 <flash_write+0x28>
    1574:	2300      	movs	r3, #0
    1576:	e027      	b.n	15c8 <flash_write+0x78>
	while (_flash_busy);
    1578:	bf00      	nop
    157a:	4b16      	ldr	r3, [pc, #88]	; (15d4 <flash_write+0x84>)
    157c:	68db      	ldr	r3, [r3, #12]
    157e:	f003 0301 	and.w	r3, r3, #1
    1582:	2b00      	cmp	r3, #0
    1584:	d1f9      	bne.n	157a <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1586:	4a13      	ldr	r2, [pc, #76]	; (15d4 <flash_write+0x84>)
    1588:	4b12      	ldr	r3, [pc, #72]	; (15d4 <flash_write+0x84>)
    158a:	68db      	ldr	r3, [r3, #12]
    158c:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1590:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    1592:	4b10      	ldr	r3, [pc, #64]	; (15d4 <flash_write+0x84>)
    1594:	2201      	movs	r2, #1
    1596:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    1598:	687b      	ldr	r3, [r7, #4]
    159a:	887a      	ldrh	r2, [r7, #2]
    159c:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    159e:	bf00      	nop
    15a0:	4b0c      	ldr	r3, [pc, #48]	; (15d4 <flash_write+0x84>)
    15a2:	68db      	ldr	r3, [r3, #12]
    15a4:	f003 0301 	and.w	r3, r3, #1
    15a8:	2b00      	cmp	r3, #0
    15aa:	d005      	beq.n	15b8 <flash_write+0x68>
    15ac:	4b09      	ldr	r3, [pc, #36]	; (15d4 <flash_write+0x84>)
    15ae:	68db      	ldr	r3, [r3, #12]
    15b0:	f003 0320 	and.w	r3, r3, #32
    15b4:	2b00      	cmp	r3, #0
    15b6:	d0f3      	beq.n	15a0 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    15b8:	687b      	ldr	r3, [r7, #4]
    15ba:	881b      	ldrh	r3, [r3, #0]
    15bc:	887a      	ldrh	r2, [r7, #2]
    15be:	429a      	cmp	r2, r3
    15c0:	bf0c      	ite	eq
    15c2:	2301      	moveq	r3, #1
    15c4:	2300      	movne	r3, #0
    15c6:	b2db      	uxtb	r3, r3
}
    15c8:	4618      	mov	r0, r3
    15ca:	370c      	adds	r7, #12
    15cc:	46bd      	mov	sp, r7
    15ce:	f85d 7b04 	ldr.w	r7, [sp], #4
    15d2:	4770      	bx	lr
    15d4:	40022000 	.word	0x40022000

000015d8 <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    15d8:	b480      	push	{r7}
    15da:	b087      	sub	sp, #28
    15dc:	af00      	add	r7, sp, #0
    15de:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    15e0:	4b27      	ldr	r3, [pc, #156]	; (1680 <flash_erase_page+0xa8>)
    15e2:	691b      	ldr	r3, [r3, #16]
    15e4:	f003 0380 	and.w	r3, r3, #128	; 0x80
    15e8:	2b00      	cmp	r3, #0
    15ea:	d001      	beq.n	15f0 <flash_erase_page+0x18>
    15ec:	2300      	movs	r3, #0
    15ee:	e040      	b.n	1672 <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    15f0:	4a23      	ldr	r2, [pc, #140]	; (1680 <flash_erase_page+0xa8>)
    15f2:	4b23      	ldr	r3, [pc, #140]	; (1680 <flash_erase_page+0xa8>)
    15f4:	68db      	ldr	r3, [r3, #12]
    15f6:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    15fa:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    15fc:	687b      	ldr	r3, [r7, #4]
    15fe:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    1602:	f023 0303 	bic.w	r3, r3, #3
    1606:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    1608:	4b1d      	ldr	r3, [pc, #116]	; (1680 <flash_erase_page+0xa8>)
    160a:	2202      	movs	r2, #2
    160c:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    160e:	4a1c      	ldr	r2, [pc, #112]	; (1680 <flash_erase_page+0xa8>)
    1610:	687b      	ldr	r3, [r7, #4]
    1612:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    1614:	4a1a      	ldr	r2, [pc, #104]	; (1680 <flash_erase_page+0xa8>)
    1616:	4b1a      	ldr	r3, [pc, #104]	; (1680 <flash_erase_page+0xa8>)
    1618:	691b      	ldr	r3, [r3, #16]
    161a:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    161e:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    1620:	bf00      	nop
    1622:	4b17      	ldr	r3, [pc, #92]	; (1680 <flash_erase_page+0xa8>)
    1624:	68db      	ldr	r3, [r3, #12]
    1626:	f003 0301 	and.w	r3, r3, #1
    162a:	2b00      	cmp	r3, #0
    162c:	d005      	beq.n	163a <flash_erase_page+0x62>
    162e:	4b14      	ldr	r3, [pc, #80]	; (1680 <flash_erase_page+0xa8>)
    1630:	68db      	ldr	r3, [r3, #12]
    1632:	f003 0320 	and.w	r3, r3, #32
    1636:	2b00      	cmp	r3, #0
    1638:	d0f3      	beq.n	1622 <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    163a:	687b      	ldr	r3, [r7, #4]
    163c:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    163e:	2300      	movs	r3, #0
    1640:	60fb      	str	r3, [r7, #12]
    1642:	e00c      	b.n	165e <flash_erase_page+0x86>
		u32=*adr++;
    1644:	697b      	ldr	r3, [r7, #20]
    1646:	1d1a      	adds	r2, r3, #4
    1648:	617a      	str	r2, [r7, #20]
    164a:	681b      	ldr	r3, [r3, #0]
    164c:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    164e:	693b      	ldr	r3, [r7, #16]
    1650:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1654:	d000      	beq.n	1658 <flash_erase_page+0x80>
    1656:	e005      	b.n	1664 <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    1658:	68fb      	ldr	r3, [r7, #12]
    165a:	3301      	adds	r3, #1
    165c:	60fb      	str	r3, [r7, #12]
    165e:	68fb      	ldr	r3, [r7, #12]
    1660:	2bff      	cmp	r3, #255	; 0xff
    1662:	ddef      	ble.n	1644 <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    1664:	693b      	ldr	r3, [r7, #16]
    1666:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    166a:	bf0c      	ite	eq
    166c:	2301      	moveq	r3, #1
    166e:	2300      	movne	r3, #0
    1670:	b2db      	uxtb	r3, r3
}
    1672:	4618      	mov	r0, r3
    1674:	371c      	adds	r7, #28
    1676:	46bd      	mov	sp, r7
    1678:	f85d 7b04 	ldr.w	r7, [sp], #4
    167c:	4770      	bx	lr
    167e:	bf00      	nop
    1680:	40022000 	.word	0x40022000

00001684 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    1684:	b490      	push	{r4, r7}
    1686:	b086      	sub	sp, #24
    1688:	af00      	add	r7, sp, #0
    168a:	60f8      	str	r0, [r7, #12]
    168c:	60b9      	str	r1, [r7, #8]
    168e:	607a      	str	r2, [r7, #4]
	register gpio_crl_t* cr;
	uint8_t shift;
	switch (port){
    1690:	68fb      	ldr	r3, [r7, #12]
    1692:	2b01      	cmp	r3, #1
    1694:	d006      	beq.n	16a4 <config_pin+0x20>
    1696:	2b01      	cmp	r3, #1
    1698:	d302      	bcc.n	16a0 <config_pin+0x1c>
    169a:	2b02      	cmp	r3, #2
    169c:	d004      	beq.n	16a8 <config_pin+0x24>
    169e:	e005      	b.n	16ac <config_pin+0x28>
		case GPIOA:
		cr=(gpio_crl_t*)(GPIOA_BASE_ADR+GPIO_CRL_OFS);
    16a0:	4c17      	ldr	r4, [pc, #92]	; (1700 <config_pin+0x7c>)
		break;
    16a2:	e003      	b.n	16ac <config_pin+0x28>
		case GPIOB:
		cr=(gpio_crl_t*)(GPIOB_BASE_ADR+GPIO_CRL_OFS);
    16a4:	4c17      	ldr	r4, [pc, #92]	; (1704 <config_pin+0x80>)
		break;
    16a6:	e001      	b.n	16ac <config_pin+0x28>
		case GPIOC:
		cr=(gpio_crl_t*)(GPIOC_BASE_ADR+GPIO_CRL_OFS);
    16a8:	4c17      	ldr	r4, [pc, #92]	; (1708 <config_pin+0x84>)
		break;
    16aa:	bf00      	nop
	}
	shift=(pin&7)<<2;
    16ac:	68bb      	ldr	r3, [r7, #8]
    16ae:	b2db      	uxtb	r3, r3
    16b0:	f003 0307 	and.w	r3, r3, #7
    16b4:	b2db      	uxtb	r3, r3
    16b6:	009b      	lsls	r3, r3, #2
    16b8:	75fb      	strb	r3, [r7, #23]
	cr[pin>>3].cr&=~(15<<shift);
    16ba:	68bb      	ldr	r3, [r7, #8]
    16bc:	08db      	lsrs	r3, r3, #3
    16be:	009b      	lsls	r3, r3, #2
    16c0:	4423      	add	r3, r4
    16c2:	68ba      	ldr	r2, [r7, #8]
    16c4:	08d2      	lsrs	r2, r2, #3
    16c6:	0092      	lsls	r2, r2, #2
    16c8:	4422      	add	r2, r4
    16ca:	6812      	ldr	r2, [r2, #0]
    16cc:	7df9      	ldrb	r1, [r7, #23]
    16ce:	200f      	movs	r0, #15
    16d0:	fa00 f101 	lsl.w	r1, r0, r1
    16d4:	43c9      	mvns	r1, r1
    16d6:	400a      	ands	r2, r1
    16d8:	601a      	str	r2, [r3, #0]
	cr[pin>>3].cr|=config<<shift;
    16da:	68bb      	ldr	r3, [r7, #8]
    16dc:	08db      	lsrs	r3, r3, #3
    16de:	009b      	lsls	r3, r3, #2
    16e0:	4423      	add	r3, r4
    16e2:	68ba      	ldr	r2, [r7, #8]
    16e4:	08d2      	lsrs	r2, r2, #3
    16e6:	0092      	lsls	r2, r2, #2
    16e8:	4422      	add	r2, r4
    16ea:	6811      	ldr	r1, [r2, #0]
    16ec:	7dfa      	ldrb	r2, [r7, #23]
    16ee:	6878      	ldr	r0, [r7, #4]
    16f0:	fa00 f202 	lsl.w	r2, r0, r2
    16f4:	430a      	orrs	r2, r1
    16f6:	601a      	str	r2, [r3, #0]
}
    16f8:	3718      	adds	r7, #24
    16fa:	46bd      	mov	sp, r7
    16fc:	bc90      	pop	{r4, r7}
    16fe:	4770      	bx	lr
    1700:	40010800 	.word	0x40010800
    1704:	40010c00 	.word	0x40010c00
    1708:	40011000 	.word	0x40011000

0000170c <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(unsigned irq){
    170c:	b480      	push	{r7}
    170e:	b083      	sub	sp, #12
    1710:	af00      	add	r7, sp, #0
    1712:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    1714:	687b      	ldr	r3, [r7, #4]
    1716:	2b3b      	cmp	r3, #59	; 0x3b
    1718:	d900      	bls.n	171c <enable_interrupt+0x10>
    171a:	e016      	b.n	174a <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    171c:	687b      	ldr	r3, [r7, #4]
    171e:	095b      	lsrs	r3, r3, #5
    1720:	009b      	lsls	r3, r3, #2
    1722:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    1726:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    172a:	687a      	ldr	r2, [r7, #4]
    172c:	0952      	lsrs	r2, r2, #5
    172e:	0092      	lsls	r2, r2, #2
    1730:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    1734:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    1738:	6812      	ldr	r2, [r2, #0]
    173a:	6879      	ldr	r1, [r7, #4]
    173c:	f001 011f 	and.w	r1, r1, #31
    1740:	2001      	movs	r0, #1
    1742:	fa00 f101 	lsl.w	r1, r0, r1
    1746:	430a      	orrs	r2, r1
    1748:	601a      	str	r2, [r3, #0]
}
    174a:	370c      	adds	r7, #12
    174c:	46bd      	mov	sp, r7
    174e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1752:	4770      	bx	lr

00001754 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    1754:	b480      	push	{r7}
    1756:	b083      	sub	sp, #12
    1758:	af00      	add	r7, sp, #0
    175a:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    175c:	687b      	ldr	r3, [r7, #4]
    175e:	2b3b      	cmp	r3, #59	; 0x3b
    1760:	d900      	bls.n	1764 <disable_interrupt+0x10>
    1762:	e013      	b.n	178c <disable_interrupt+0x38>
	ICER[irq>>5]&=~(1<<(irq&0x1f));
    1764:	687b      	ldr	r3, [r7, #4]
    1766:	095b      	lsrs	r3, r3, #5
    1768:	009a      	lsls	r2, r3, #2
    176a:	4b0b      	ldr	r3, [pc, #44]	; (1798 <disable_interrupt+0x44>)
    176c:	4413      	add	r3, r2
    176e:	687a      	ldr	r2, [r7, #4]
    1770:	0952      	lsrs	r2, r2, #5
    1772:	0091      	lsls	r1, r2, #2
    1774:	4a08      	ldr	r2, [pc, #32]	; (1798 <disable_interrupt+0x44>)
    1776:	440a      	add	r2, r1
    1778:	6812      	ldr	r2, [r2, #0]
    177a:	6879      	ldr	r1, [r7, #4]
    177c:	f001 011f 	and.w	r1, r1, #31
    1780:	2001      	movs	r0, #1
    1782:	fa00 f101 	lsl.w	r1, r0, r1
    1786:	43c9      	mvns	r1, r1
    1788:	400a      	ands	r2, r1
    178a:	601a      	str	r2, [r3, #0]
}
    178c:	370c      	adds	r7, #12
    178e:	46bd      	mov	sp, r7
    1790:	f85d 7b04 	ldr.w	r7, [sp], #4
    1794:	4770      	bx	lr
    1796:	bf00      	nop
    1798:	e000e180 	.word	0xe000e180

0000179c <set_int_priority>:



void set_int_priority(int32_t irq, unsigned priority){
    179c:	b480      	push	{r7}
    179e:	b083      	sub	sp, #12
    17a0:	af00      	add	r7, sp, #0
    17a2:	6078      	str	r0, [r7, #4]
    17a4:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    17a6:	687b      	ldr	r3, [r7, #4]
    17a8:	2b00      	cmp	r3, #0
    17aa:	db0d      	blt.n	17c8 <set_int_priority+0x2c>
    17ac:	687b      	ldr	r3, [r7, #4]
    17ae:	2b3b      	cmp	r3, #59	; 0x3b
    17b0:	dc0a      	bgt.n	17c8 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    17b2:	687b      	ldr	r3, [r7, #4]
    17b4:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    17b8:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    17bc:	683a      	ldr	r2, [r7, #0]
    17be:	b2d2      	uxtb	r2, r2
    17c0:	0112      	lsls	r2, r2, #4
    17c2:	b2d2      	uxtb	r2, r2
    17c4:	701a      	strb	r2, [r3, #0]
    17c6:	e012      	b.n	17ee <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    17c8:	687b      	ldr	r3, [r7, #4]
    17ca:	2b00      	cmp	r3, #0
    17cc:	da0f      	bge.n	17ee <set_int_priority+0x52>
    17ce:	687b      	ldr	r3, [r7, #4]
    17d0:	f113 0f0f 	cmn.w	r3, #15
    17d4:	db0b      	blt.n	17ee <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    17d6:	687a      	ldr	r2, [r7, #4]
    17d8:	f06f 0303 	mvn.w	r3, #3
    17dc:	1a9b      	subs	r3, r3, r2
    17de:	461a      	mov	r2, r3
    17e0:	4b05      	ldr	r3, [pc, #20]	; (17f8 <set_int_priority+0x5c>)
    17e2:	4413      	add	r3, r2
    17e4:	683a      	ldr	r2, [r7, #0]
    17e6:	b2d2      	uxtb	r2, r2
    17e8:	0112      	lsls	r2, r2, #4
    17ea:	b2d2      	uxtb	r2, r2
    17ec:	701a      	strb	r2, [r3, #0]
	}
}
    17ee:	370c      	adds	r7, #12
    17f0:	46bd      	mov	sp, r7
    17f2:	f85d 7b04 	ldr.w	r7, [sp], #4
    17f6:	4770      	bx	lr
    17f8:	e000ed18 	.word	0xe000ed18

000017fc <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    17fc:	b480      	push	{r7}
    17fe:	b083      	sub	sp, #12
    1800:	af00      	add	r7, sp, #0
    1802:	6078      	str	r0, [r7, #4]
    1804:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    1806:	687b      	ldr	r3, [r7, #4]
    1808:	881b      	ldrh	r3, [r3, #0]
    180a:	b29b      	uxth	r3, r3
    180c:	f423 63e0 	bic.w	r3, r3, #1792	; 0x700
    1810:	b29a      	uxth	r2, r3
    1812:	687b      	ldr	r3, [r7, #4]
    1814:	801a      	strh	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    1816:	687b      	ldr	r3, [r7, #4]
    1818:	881b      	ldrh	r3, [r3, #0]
    181a:	b29a      	uxth	r2, r3
    181c:	683b      	ldr	r3, [r7, #0]
    181e:	b29b      	uxth	r3, r3
    1820:	00db      	lsls	r3, r3, #3
    1822:	b29b      	uxth	r3, r3
    1824:	4313      	orrs	r3, r2
    1826:	b29a      	uxth	r2, r3
    1828:	687b      	ldr	r3, [r7, #4]
    182a:	801a      	strh	r2, [r3, #0]
}
    182c:	370c      	adds	r7, #12
    182e:	46bd      	mov	sp, r7
    1830:	f85d 7b04 	ldr.w	r7, [sp], #4
    1834:	4770      	bx	lr
    1836:	bf00      	nop

00001838 <spi_init>:


void spi_init(spi_sfr_t* channel, unsigned baud){
    1838:	b580      	push	{r7, lr}
    183a:	b082      	sub	sp, #8
    183c:	af00      	add	r7, sp, #0
    183e:	6078      	str	r0, [r7, #4]
    1840:	6039      	str	r1, [r7, #0]
	spi_baudrate(channel,baud);
    1842:	6878      	ldr	r0, [r7, #4]
    1844:	6839      	ldr	r1, [r7, #0]
    1846:	f7ff ffd9 	bl	17fc <spi_baudrate>
	channel->CR1=SPI_CR1_MSTR|SPI_CR1_SSM;
    184a:	687b      	ldr	r3, [r7, #4]
    184c:	f44f 7201 	mov.w	r2, #516	; 0x204
    1850:	801a      	strh	r2, [r3, #0]
	//channel->CR2|=SPI_CR2_SSOE;
	if (channel==SPI1){
    1852:	687b      	ldr	r3, [r7, #4]
    1854:	4a17      	ldr	r2, [pc, #92]	; (18b4 <spi_init+0x7c>)
    1856:	4293      	cmp	r3, r2
    1858:	d114      	bne.n	1884 <spi_init+0x4c>
		// configuration port
		// PA4 -> NSS output (push-pull),  alt PA15
		config_pin(GPIOA,4,OUTPUT_PP_FAST);
    185a:	2000      	movs	r0, #0
    185c:	2104      	movs	r1, #4
    185e:	2203      	movs	r2, #3
    1860:	f7ff ff10 	bl	1684 <config_pin>
		// PA5 -> SCK output (push-pull),  alt PB3
		config_pin(GPIOA,5,OUTPUT_PP_FAST);
    1864:	2000      	movs	r0, #0
    1866:	2105      	movs	r1, #5
    1868:	2203      	movs	r2, #3
    186a:	f7ff ff0b 	bl	1684 <config_pin>
		// PA6 -> MISO input (floating),   alt PB4
		config_pin(GPIOA,6,INPUT_FLOAT);
    186e:	2000      	movs	r0, #0
    1870:	2106      	movs	r1, #6
    1872:	2204      	movs	r2, #4
    1874:	f7ff ff06 	bl	1684 <config_pin>
		// PA7 -> MOSI output (push-pull), alt PB5
		config_pin(GPIOA,7,OUTPUT_PP_FAST);
    1878:	2000      	movs	r0, #0
    187a:	2107      	movs	r1, #7
    187c:	2203      	movs	r2, #3
    187e:	f7ff ff01 	bl	1684 <config_pin>
    1882:	e013      	b.n	18ac <spi_init+0x74>
	}else{
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(GPIOB,2,OUTPUT_PP_FAST);
    1884:	2001      	movs	r0, #1
    1886:	2102      	movs	r1, #2
    1888:	2203      	movs	r2, #3
    188a:	f7ff fefb 	bl	1684 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(GPIOB,13,OUTPUT_PP_FAST);
    188e:	2001      	movs	r0, #1
    1890:	210d      	movs	r1, #13
    1892:	2203      	movs	r2, #3
    1894:	f7ff fef6 	bl	1684 <config_pin>
		// PB14 MISO input (floating)
		config_pin(GPIOB,14,INPUT_FLOAT);
    1898:	2001      	movs	r0, #1
    189a:	210e      	movs	r1, #14
    189c:	2204      	movs	r2, #4
    189e:	f7ff fef1 	bl	1684 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(GPIOB,15,OUTPUT_PP_FAST);
    18a2:	2001      	movs	r0, #1
    18a4:	210f      	movs	r1, #15
    18a6:	2203      	movs	r2, #3
    18a8:	f7ff feec 	bl	1684 <config_pin>
	}
}
    18ac:	3708      	adds	r7, #8
    18ae:	46bd      	mov	sp, r7
    18b0:	bd80      	pop	{r7, pc}
    18b2:	bf00      	nop
    18b4:	40013000 	.word	0x40013000

000018b8 <spi_enable>:

void spi_enable(spi_sfr_t* channel, unsigned mode){
    18b8:	b480      	push	{r7}
    18ba:	b083      	sub	sp, #12
    18bc:	af00      	add	r7, sp, #0
    18be:	6078      	str	r0, [r7, #4]
    18c0:	6039      	str	r1, [r7, #0]
	switch (mode){
    18c2:	683b      	ldr	r3, [r7, #0]
    18c4:	2b01      	cmp	r3, #1
    18c6:	d00d      	beq.n	18e4 <spi_enable+0x2c>
    18c8:	2b01      	cmp	r3, #1
    18ca:	d302      	bcc.n	18d2 <spi_enable+0x1a>
    18cc:	2b02      	cmp	r3, #2
    18ce:	d005      	beq.n	18dc <spi_enable+0x24>
    18d0:	e00d      	b.n	18ee <spi_enable+0x36>
		case SPI_MODE_READ:
		channel->CR1=SPI_CR1_RXONLY|SPI_CR1_SPE;
    18d2:	687b      	ldr	r3, [r7, #4]
    18d4:	f44f 6288 	mov.w	r2, #1088	; 0x440
    18d8:	801a      	strh	r2, [r3, #0]
		break;
    18da:	e008      	b.n	18ee <spi_enable+0x36>
		case SPI_MODE_READ_WRITE:
		channel->CR1=SPI_CR1_SPE;
    18dc:	687b      	ldr	r3, [r7, #4]
    18de:	2240      	movs	r2, #64	; 0x40
    18e0:	801a      	strh	r2, [r3, #0]
		break;
    18e2:	e004      	b.n	18ee <spi_enable+0x36>
		case SPI_MODE_WRITE:
		channel->CR1=SPI_CR1_BIDIMODE|SPI_CR1_BIDIOE|SPI_CR1_SPE;
    18e4:	687b      	ldr	r3, [r7, #4]
    18e6:	f24c 0240 	movw	r2, #49216	; 0xc040
    18ea:	801a      	strh	r2, [r3, #0]
		break;
    18ec:	bf00      	nop
	}
}
    18ee:	370c      	adds	r7, #12
    18f0:	46bd      	mov	sp, r7
    18f2:	f85d 7b04 	ldr.w	r7, [sp], #4
    18f6:	4770      	bx	lr

000018f8 <spi_disable>:

void spi_disable(spi_sfr_t* channel){
    18f8:	b480      	push	{r7}
    18fa:	b083      	sub	sp, #12
    18fc:	af00      	add	r7, sp, #0
    18fe:	6078      	str	r0, [r7, #4]
	channel->CR1&=~SPI_CR1_SPE;
    1900:	687b      	ldr	r3, [r7, #4]
    1902:	881b      	ldrh	r3, [r3, #0]
    1904:	b29b      	uxth	r3, r3
    1906:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    190a:	b29a      	uxth	r2, r3
    190c:	687b      	ldr	r3, [r7, #4]
    190e:	801a      	strh	r2, [r3, #0]
}
    1910:	370c      	adds	r7, #12
    1912:	46bd      	mov	sp, r7
    1914:	f85d 7b04 	ldr.w	r7, [sp], #4
    1918:	4770      	bx	lr
    191a:	bf00      	nop

0000191c <spi_write>:

// envoie un octet via le canla SPI
void spi_write(spi_sfr_t* channel, uint8_t b){
    191c:	b580      	push	{r7, lr}
    191e:	b082      	sub	sp, #8
    1920:	af00      	add	r7, sp, #0
    1922:	6078      	str	r0, [r7, #4]
    1924:	460b      	mov	r3, r1
    1926:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_WRITE);
    1928:	6878      	ldr	r0, [r7, #4]
    192a:	2101      	movs	r1, #1
    192c:	f7ff ffc4 	bl	18b8 <spi_enable>
	channel->DR=b;
    1930:	78fb      	ldrb	r3, [r7, #3]
    1932:	b29a      	uxth	r2, r3
    1934:	687b      	ldr	r3, [r7, #4]
    1936:	819a      	strh	r2, [r3, #12]
	spi_disable(channel);
    1938:	6878      	ldr	r0, [r7, #4]
    193a:	f7ff ffdd 	bl	18f8 <spi_disable>
}
    193e:	3708      	adds	r7, #8
    1940:	46bd      	mov	sp, r7
    1942:	bd80      	pop	{r7, pc}

00001944 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    1944:	b580      	push	{r7, lr}
    1946:	b084      	sub	sp, #16
    1948:	af00      	add	r7, sp, #0
    194a:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	spi_enable(channel,SPI_MODE_READ);
    194c:	6878      	ldr	r0, [r7, #4]
    194e:	2100      	movs	r1, #0
    1950:	f7ff ffb2 	bl	18b8 <spi_enable>
	channel->DR=255;
    1954:	687b      	ldr	r3, [r7, #4]
    1956:	22ff      	movs	r2, #255	; 0xff
    1958:	819a      	strh	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    195a:	bf00      	nop
    195c:	687b      	ldr	r3, [r7, #4]
    195e:	891b      	ldrh	r3, [r3, #8]
    1960:	b29b      	uxth	r3, r3
    1962:	f003 0301 	and.w	r3, r3, #1
    1966:	2b00      	cmp	r3, #0
    1968:	d0f8      	beq.n	195c <spi_read+0x18>
	rx=(uint8_t)channel->DR;
    196a:	687b      	ldr	r3, [r7, #4]
    196c:	899b      	ldrh	r3, [r3, #12]
    196e:	b29b      	uxth	r3, r3
    1970:	73fb      	strb	r3, [r7, #15]
	spi_disable(channel);
    1972:	6878      	ldr	r0, [r7, #4]
    1974:	f7ff ffc0 	bl	18f8 <spi_disable>
	return rx;
    1978:	7bfb      	ldrb	r3, [r7, #15]
}
    197a:	4618      	mov	r0, r3
    197c:	3710      	adds	r7, #16
    197e:	46bd      	mov	sp, r7
    1980:	bd80      	pop	{r7, pc}
    1982:	bf00      	nop

00001984 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    1984:	b580      	push	{r7, lr}
    1986:	b084      	sub	sp, #16
    1988:	af00      	add	r7, sp, #0
    198a:	60f8      	str	r0, [r7, #12]
    198c:	60b9      	str	r1, [r7, #8]
    198e:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_WRITE);
    1990:	68f8      	ldr	r0, [r7, #12]
    1992:	2101      	movs	r1, #1
    1994:	f7ff ff90 	bl	18b8 <spi_enable>
	while (count){
    1998:	e011      	b.n	19be <spi_block_write+0x3a>
		channel->DR=*buffer++;
    199a:	68bb      	ldr	r3, [r7, #8]
    199c:	1c5a      	adds	r2, r3, #1
    199e:	60ba      	str	r2, [r7, #8]
    19a0:	781b      	ldrb	r3, [r3, #0]
    19a2:	b29a      	uxth	r2, r3
    19a4:	68fb      	ldr	r3, [r7, #12]
    19a6:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    19a8:	bf00      	nop
    19aa:	68fb      	ldr	r3, [r7, #12]
    19ac:	891b      	ldrh	r3, [r3, #8]
    19ae:	b29b      	uxth	r3, r3
    19b0:	f003 0302 	and.w	r3, r3, #2
    19b4:	2b00      	cmp	r3, #0
    19b6:	d0f8      	beq.n	19aa <spi_block_write+0x26>
		count--;
    19b8:	687b      	ldr	r3, [r7, #4]
    19ba:	3b01      	subs	r3, #1
    19bc:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	spi_enable(channel,SPI_MODE_WRITE);
	while (count){
    19be:	687b      	ldr	r3, [r7, #4]
    19c0:	2b00      	cmp	r3, #0
    19c2:	d1ea      	bne.n	199a <spi_block_write+0x16>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	spi_disable(channel);
    19c4:	68f8      	ldr	r0, [r7, #12]
    19c6:	f7ff ff97 	bl	18f8 <spi_disable>
}
    19ca:	3710      	adds	r7, #16
    19cc:	46bd      	mov	sp, r7
    19ce:	bd80      	pop	{r7, pc}

000019d0 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    19d0:	b580      	push	{r7, lr}
    19d2:	b084      	sub	sp, #16
    19d4:	af00      	add	r7, sp, #0
    19d6:	60f8      	str	r0, [r7, #12]
    19d8:	60b9      	str	r1, [r7, #8]
    19da:	607a      	str	r2, [r7, #4]
	spi_enable(channel,SPI_MODE_READ);
    19dc:	68f8      	ldr	r0, [r7, #12]
    19de:	2100      	movs	r1, #0
    19e0:	f7ff ff6a 	bl	18b8 <spi_enable>
	while (count){
    19e4:	e015      	b.n	1a12 <spi_block_read+0x42>
		channel->DR=0;
    19e6:	68fb      	ldr	r3, [r7, #12]
    19e8:	2200      	movs	r2, #0
    19ea:	819a      	strh	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    19ec:	bf00      	nop
    19ee:	68fb      	ldr	r3, [r7, #12]
    19f0:	891b      	ldrh	r3, [r3, #8]
    19f2:	b29b      	uxth	r3, r3
    19f4:	f003 0301 	and.w	r3, r3, #1
    19f8:	2b00      	cmp	r3, #0
    19fa:	d0f8      	beq.n	19ee <spi_block_read+0x1e>
		*buffer++=(uint8_t)channel->DR;
    19fc:	68bb      	ldr	r3, [r7, #8]
    19fe:	1c5a      	adds	r2, r3, #1
    1a00:	60ba      	str	r2, [r7, #8]
    1a02:	68fa      	ldr	r2, [r7, #12]
    1a04:	8992      	ldrh	r2, [r2, #12]
    1a06:	b292      	uxth	r2, r2
    1a08:	b2d2      	uxtb	r2, r2
    1a0a:	701a      	strb	r2, [r3, #0]
		count--;
    1a0c:	687b      	ldr	r3, [r7, #4]
    1a0e:	3b01      	subs	r3, #1
    1a10:	607b      	str	r3, [r7, #4]
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	spi_enable(channel,SPI_MODE_READ);
	while (count){
    1a12:	687b      	ldr	r3, [r7, #4]
    1a14:	2b00      	cmp	r3, #0
    1a16:	d1e6      	bne.n	19e6 <spi_block_read+0x16>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
	spi_disable(channel);
    1a18:	68f8      	ldr	r0, [r7, #12]
    1a1a:	f7ff ff6d 	bl	18f8 <spi_disable>
}
    1a1e:	3710      	adds	r7, #16
    1a20:	46bd      	mov	sp, r7
    1a22:	bd80      	pop	{r7, pc}

00001a24 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    1a24:	4b01      	ldr	r3, [pc, #4]	; (1a2c <reset_mcu+0x8>)
    1a26:	4a02      	ldr	r2, [pc, #8]	; (1a30 <reset_mcu+0xc>)
    1a28:	601a      	str	r2, [r3, #0]
    1a2a:	bf00      	nop
    1a2c:	e000ed0c 	.word	0xe000ed0c
    1a30:	05fa0004 	.word	0x05fa0004

00001a34 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    1a34:	b580      	push	{r7, lr}
    1a36:	b082      	sub	sp, #8
    1a38:	af00      	add	r7, sp, #0
    1a3a:	6078      	str	r0, [r7, #4]
    1a3c:	6039      	str	r1, [r7, #0]
	print(msg);
    1a3e:	6878      	ldr	r0, [r7, #4]
    1a40:	f7ff fb66 	bl	1110 <print>
	print("at address ");
    1a44:	4814      	ldr	r0, [pc, #80]	; (1a98 <print_fault+0x64>)
    1a46:	f7ff fb63 	bl	1110 <print>
	if (adr) {
    1a4a:	683b      	ldr	r3, [r7, #0]
    1a4c:	2b00      	cmp	r3, #0
    1a4e:	d002      	beq.n	1a56 <print_fault+0x22>
		print_hex(adr);
    1a50:	6838      	ldr	r0, [r7, #0]
    1a52:	f7ff fccb 	bl	13ec <print_hex>
	};
	conout(CR);
    1a56:	200d      	movs	r0, #13
    1a58:	f7ff fb28 	bl	10ac <conout>
	print("UFSR=");
    1a5c:	480f      	ldr	r0, [pc, #60]	; (1a9c <print_fault+0x68>)
    1a5e:	f7ff fb57 	bl	1110 <print>
	print_hex(CFSR->fsr.usageFalt);
    1a62:	4b0f      	ldr	r3, [pc, #60]	; (1aa0 <print_fault+0x6c>)
    1a64:	681b      	ldr	r3, [r3, #0]
    1a66:	0c1b      	lsrs	r3, r3, #16
    1a68:	b29b      	uxth	r3, r3
    1a6a:	4618      	mov	r0, r3
    1a6c:	f7ff fcbe 	bl	13ec <print_hex>
	print(", BFSR=");
    1a70:	480c      	ldr	r0, [pc, #48]	; (1aa4 <print_fault+0x70>)
    1a72:	f7ff fb4d 	bl	1110 <print>
	print_hex(CFSR->fsr.busFault);
    1a76:	4b0a      	ldr	r3, [pc, #40]	; (1aa0 <print_fault+0x6c>)
    1a78:	681b      	ldr	r3, [r3, #0]
    1a7a:	0a1b      	lsrs	r3, r3, #8
    1a7c:	b2db      	uxtb	r3, r3
    1a7e:	4618      	mov	r0, r3
    1a80:	f7ff fcb4 	bl	13ec <print_hex>
	print(", MMFSR=");
    1a84:	4808      	ldr	r0, [pc, #32]	; (1aa8 <print_fault+0x74>)
    1a86:	f7ff fb43 	bl	1110 <print>
	print_hex(CFSR->fsr.mmFault);
    1a8a:	4b05      	ldr	r3, [pc, #20]	; (1aa0 <print_fault+0x6c>)
    1a8c:	681b      	ldr	r3, [r3, #0]
    1a8e:	b2db      	uxtb	r3, r3
    1a90:	4618      	mov	r0, r3
    1a92:	f7ff fcab 	bl	13ec <print_hex>
	while(1);
    1a96:	e7fe      	b.n	1a96 <print_fault+0x62>
    1a98:	000024a0 	.word	0x000024a0
    1a9c:	000024ac 	.word	0x000024ac
    1aa0:	e000ed28 	.word	0xe000ed28
    1aa4:	000024b4 	.word	0x000024b4
    1aa8:	000024bc 	.word	0x000024bc

00001aac <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    1aac:	b480      	push	{r7}
    1aae:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    1ab0:	2300      	movs	r3, #0
    1ab2:	2200      	movs	r2, #0
    1ab4:	4618      	mov	r0, r3
    1ab6:	4611      	mov	r1, r2
    1ab8:	df02      	svc	2
}
    1aba:	46bd      	mov	sp, r7
    1abc:	f85d 7b04 	ldr.w	r7, [sp], #4
    1ac0:	4770      	bx	lr
    1ac2:	bf00      	nop

00001ac4 <tvout_init>:

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
    1ac4:	b580      	push	{r7, lr}
    1ac6:	b082      	sub	sp, #8
    1ac8:	af00      	add	r7, sp, #0
	video_bb = (uint32_t*)(0x22000000+(((unsigned int)video_buffer&0x7ffff)<<5)); 
    1aca:	4b54      	ldr	r3, [pc, #336]	; (1c1c <tvout_init+0x158>)
    1acc:	f3c3 0312 	ubfx	r3, r3, #0, #19
    1ad0:	015b      	lsls	r3, r3, #5
    1ad2:	f103 5308 	add.w	r3, r3, #570425344	; 0x22000000
    1ad6:	461a      	mov	r2, r3
    1ad8:	4b51      	ldr	r3, [pc, #324]	; (1c20 <tvout_init+0x15c>)
    1ada:	601a      	str	r2, [r3, #0]
	//sortie sync sur PA8
	config_pin(GPIOA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    1adc:	2000      	movs	r0, #0
    1ade:	2108      	movs	r1, #8
    1ae0:	220a      	movs	r2, #10
    1ae2:	f7ff fdcf 	bl	1684 <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(GPIOB,15,OUTPUT_ALT_PP_FAST);
    1ae6:	2001      	movs	r0, #1
    1ae8:	210f      	movs	r1, #15
    1aea:	220b      	movs	r2, #11
    1aec:	f7ff fdca 	bl	1684 <config_pin>
	PORTB->BRR=BIT15;
    1af0:	4b4c      	ldr	r3, [pc, #304]	; (1c24 <tvout_init+0x160>)
    1af2:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    1af6:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	APB2ENR->fld.tim1en=1;
    1af8:	4b4b      	ldr	r3, [pc, #300]	; (1c28 <tvout_init+0x164>)
    1afa:	681a      	ldr	r2, [r3, #0]
    1afc:	f442 6200 	orr.w	r2, r2, #2048	; 0x800
    1b00:	601a      	str	r2, [r3, #0]
	// clock source division
	*TIMER1_PSC=0;
    1b02:	4b4a      	ldr	r3, [pc, #296]	; (1c2c <tvout_init+0x168>)
    1b04:	2200      	movs	r2, #0
    1b06:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    1b08:	4b49      	ldr	r3, [pc, #292]	; (1c30 <tvout_init+0x16c>)
    1b0a:	f640 72ff 	movw	r2, #4095	; 0xfff
    1b0e:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    1b10:	4b48      	ldr	r3, [pc, #288]	; (1c34 <tvout_init+0x170>)
    1b12:	f240 122b 	movw	r2, #299	; 0x12b
    1b16:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    1b18:	4b47      	ldr	r3, [pc, #284]	; (1c38 <tvout_init+0x174>)
    1b1a:	681a      	ldr	r2, [r3, #0]
    1b1c:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    1b20:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    1b24:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    1b26:	4b44      	ldr	r3, [pc, #272]	; (1c38 <tvout_init+0x174>)
    1b28:	681a      	ldr	r2, [r3, #0]
    1b2a:	f042 0208 	orr.w	r2, r2, #8
    1b2e:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    1b30:	4b42      	ldr	r3, [pc, #264]	; (1c3c <tvout_init+0x178>)
    1b32:	681a      	ldr	r2, [r3, #0]
    1b34:	f042 0201 	orr.w	r2, r2, #1
    1b38:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    1b3a:	4b40      	ldr	r3, [pc, #256]	; (1c3c <tvout_init+0x178>)
    1b3c:	681a      	ldr	r2, [r3, #0]
    1b3e:	f042 0202 	orr.w	r2, r2, #2
    1b42:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    1b44:	4a3e      	ldr	r2, [pc, #248]	; (1c40 <tvout_init+0x17c>)
    1b46:	8813      	ldrh	r3, [r2, #0]
    1b48:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    1b4c:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    1b50:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    1b52:	4b3c      	ldr	r3, [pc, #240]	; (1c44 <tvout_init+0x180>)
    1b54:	681a      	ldr	r2, [r3, #0]
    1b56:	f042 0201 	orr.w	r2, r2, #1
    1b5a:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    1b5c:	4b3a      	ldr	r3, [pc, #232]	; (1c48 <tvout_init+0x184>)
    1b5e:	f640 324c 	movw	r2, #2892	; 0xb4c
    1b62:	801a      	strh	r2, [r3, #0]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    1b64:	4b39      	ldr	r3, [pc, #228]	; (1c4c <tvout_init+0x188>)
    1b66:	f243 5292 	movw	r2, #13714	; 0x3592
    1b6a:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    1b6c:	4b37      	ldr	r3, [pc, #220]	; (1c4c <tvout_init+0x188>)
    1b6e:	4a38      	ldr	r2, [pc, #224]	; (1c50 <tvout_init+0x18c>)
    1b70:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    1b72:	4a35      	ldr	r2, [pc, #212]	; (1c48 <tvout_init+0x184>)
    1b74:	4b34      	ldr	r3, [pc, #208]	; (1c48 <tvout_init+0x184>)
    1b76:	889b      	ldrh	r3, [r3, #4]
    1b78:	b29b      	uxth	r3, r3
    1b7a:	f043 0302 	orr.w	r3, r3, #2
    1b7e:	b29b      	uxth	r3, r3
    1b80:	8093      	strh	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,7);
    1b82:	200f      	movs	r0, #15
    1b84:	2107      	movs	r1, #7
    1b86:	f7ff fe09 	bl	179c <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    1b8a:	200f      	movs	r0, #15
    1b8c:	f7ff fdbe 	bl	170c <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    1b90:	4b30      	ldr	r3, [pc, #192]	; (1c54 <tvout_init+0x190>)
    1b92:	681a      	ldr	r2, [r3, #0]
    1b94:	f042 0202 	orr.w	r2, r2, #2
    1b98:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,7);
    1b9a:	201b      	movs	r0, #27
    1b9c:	2107      	movs	r1, #7
    1b9e:	f7ff fdfd 	bl	179c <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    1ba2:	201b      	movs	r0, #27
    1ba4:	f7ff fdb2 	bl	170c <enable_interrupt>
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    1ba8:	2300      	movs	r3, #0
    1baa:	607b      	str	r3, [r7, #4]
    1bac:	e011      	b.n	1bd2 <tvout_init+0x10e>
		video_buffer[i]=0xffff;
    1bae:	4a1b      	ldr	r2, [pc, #108]	; (1c1c <tvout_init+0x158>)
    1bb0:	687b      	ldr	r3, [r7, #4]
    1bb2:	f64f 71ff 	movw	r1, #65535	; 0xffff
    1bb6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
    1bba:	687b      	ldr	r3, [r7, #4]
    1bbc:	f503 5395 	add.w	r3, r3, #4768	; 0x12a0
    1bc0:	330c      	adds	r3, #12
    1bc2:	4a16      	ldr	r2, [pc, #88]	; (1c1c <tvout_init+0x158>)
    1bc4:	f64f 71ff 	movw	r1, #65535	; 0xffff
    1bc8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,7);
	enable_interrupt(IRQ_TIM1_CC);
	// video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    1bcc:	687b      	ldr	r3, [r7, #4]
    1bce:	3301      	adds	r3, #1
    1bd0:	607b      	str	r3, [r7, #4]
    1bd2:	687b      	ldr	r3, [r7, #4]
    1bd4:	2b13      	cmp	r3, #19
    1bd6:	ddea      	ble.n	1bae <tvout_init+0xea>
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    1bd8:	2301      	movs	r3, #1
    1bda:	607b      	str	r3, [r7, #4]
    1bdc:	e018      	b.n	1c10 <tvout_init+0x14c>
		video_buffer[i*ROW_SIZE]=0x8000;
    1bde:	687a      	ldr	r2, [r7, #4]
    1be0:	4613      	mov	r3, r2
    1be2:	009b      	lsls	r3, r3, #2
    1be4:	4413      	add	r3, r2
    1be6:	009b      	lsls	r3, r3, #2
    1be8:	461a      	mov	r2, r3
    1bea:	4b0c      	ldr	r3, [pc, #48]	; (1c1c <tvout_init+0x158>)
    1bec:	f44f 4100 	mov.w	r1, #32768	; 0x8000
    1bf0:	f823 1012 	strh.w	r1, [r3, r2, lsl #1]
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
    1bf4:	687b      	ldr	r3, [r7, #4]
    1bf6:	1c5a      	adds	r2, r3, #1
    1bf8:	4613      	mov	r3, r2
    1bfa:	009b      	lsls	r3, r3, #2
    1bfc:	4413      	add	r3, r2
    1bfe:	009b      	lsls	r3, r3, #2
    1c00:	3b01      	subs	r3, #1
    1c02:	4a06      	ldr	r2, [pc, #24]	; (1c1c <tvout_init+0x158>)
    1c04:	2101      	movs	r1, #1
    1c06:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i;
	for (i=0;i<ROW_SIZE;i++){
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    1c0a:	687b      	ldr	r3, [r7, #4]
    1c0c:	3301      	adds	r3, #1
    1c0e:	607b      	str	r3, [r7, #4]
    1c10:	687b      	ldr	r3, [r7, #4]
    1c12:	2bed      	cmp	r3, #237	; 0xed
    1c14:	dde3      	ble.n	1bde <tvout_init+0x11a>
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	// test end
 }
    1c16:	3708      	adds	r7, #8
    1c18:	46bd      	mov	sp, r7
    1c1a:	bd80      	pop	{r7, pc}
    1c1c:	200000ec 	.word	0x200000ec
    1c20:	200000e8 	.word	0x200000e8
    1c24:	40010c00 	.word	0x40010c00
    1c28:	40021018 	.word	0x40021018
    1c2c:	40012c28 	.word	0x40012c28
    1c30:	40012c2c 	.word	0x40012c2c
    1c34:	40012c34 	.word	0x40012c34
    1c38:	40012c18 	.word	0x40012c18
    1c3c:	40012c20 	.word	0x40012c20
    1c40:	40012c44 	.word	0x40012c44
    1c44:	40012c00 	.word	0x40012c00
    1c48:	40003800 	.word	0x40003800
    1c4c:	40020058 	.word	0x40020058
    1c50:	4000380c 	.word	0x4000380c
    1c54:	40012c0c 	.word	0x40012c0c

00001c58 <TIM1_CC_handler>:
__attribute__((optimize("-Os"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
    1c58:	4a40      	ldr	r2, [pc, #256]	; (1d5c <TIM1_CC_handler+0x104>)
	TIMER1_SR->fld.cc1if=0;
    1c5a:	4941      	ldr	r1, [pc, #260]	; (1d60 <TIM1_CC_handler+0x108>)
__attribute__((optimize("-Os"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
    1c5c:	6813      	ldr	r3, [r2, #0]
    1c5e:	3301      	adds	r3, #1
    1c60:	6013      	str	r3, [r2, #0]
	TIMER1_SR->fld.cc1if=0;
    1c62:	680b      	ldr	r3, [r1, #0]
    1c64:	f023 0302 	bic.w	r3, r3, #2
    1c68:	600b      	str	r3, [r1, #0]
	switch(line_count){
    1c6a:	6813      	ldr	r3, [r2, #0]
    1c6c:	4611      	mov	r1, r2
    1c6e:	2b12      	cmp	r3, #18
    1c70:	d03b      	beq.n	1cea <TIM1_CC_handler+0x92>
    1c72:	dc13      	bgt.n	1c9c <TIM1_CC_handler+0x44>
    1c74:	2b06      	cmp	r3, #6
    1c76:	d021      	beq.n	1cbc <TIM1_CC_handler+0x64>
    1c78:	dc0b      	bgt.n	1c92 <TIM1_CC_handler+0x3a>
    1c7a:	2b00      	cmp	r3, #0
    1c7c:	d150      	bne.n	1d20 <TIM1_CC_handler+0xc8>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    1c7e:	4a39      	ldr	r2, [pc, #228]	; (1d64 <TIM1_CC_handler+0x10c>)
    1c80:	8813      	ldrh	r3, [r2, #0]
    1c82:	f3c3 034e 	ubfx	r3, r3, #1, #15
    1c86:	8013      	strh	r3, [r2, #0]
		*TIMER1_CCR1/=2;
    1c88:	8913      	ldrh	r3, [r2, #8]
    1c8a:	f3c3 034e 	ubfx	r3, r3, #1, #15
    1c8e:	8113      	strh	r3, [r2, #8]
		break;
    1c90:	4770      	bx	lr
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    1c92:	2b0c      	cmp	r3, #12
    1c94:	d017      	beq.n	1cc6 <TIM1_CC_handler+0x6e>
    1c96:	2b11      	cmp	r3, #17
    1c98:	d01b      	beq.n	1cd2 <TIM1_CC_handler+0x7a>
    1c9a:	e041      	b.n	1d20 <TIM1_CC_handler+0xc8>
    1c9c:	f5b3 7f96 	cmp.w	r3, #300	; 0x12c
    1ca0:	d028      	beq.n	1cf4 <TIM1_CC_handler+0x9c>
    1ca2:	dc03      	bgt.n	1cac <TIM1_CC_handler+0x54>
    1ca4:	2b3b      	cmp	r3, #59	; 0x3b
    1ca6:	d13b      	bne.n	1d20 <TIM1_CC_handler+0xc8>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    1ca8:	2201      	movs	r2, #1
    1caa:	e024      	b.n	1cf6 <TIM1_CC_handler+0x9e>
    uint16_t cnt;
	uint16_t* line_adr;
    
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    1cac:	f240 1041 	movw	r0, #321	; 0x141
    1cb0:	4283      	cmp	r3, r0
    1cb2:	d022      	beq.n	1cfa <TIM1_CC_handler+0xa2>
    1cb4:	f5b3 7fa1 	cmp.w	r3, #322	; 0x142
    1cb8:	d024      	beq.n	1d04 <TIM1_CC_handler+0xac>
    1cba:	e031      	b.n	1d20 <TIM1_CC_handler+0xc8>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    1cbc:	f240 7269 	movw	r2, #1897	; 0x769
    1cc0:	4b29      	ldr	r3, [pc, #164]	; (1d68 <TIM1_CC_handler+0x110>)
    1cc2:	801a      	strh	r2, [r3, #0]
	    break;
    1cc4:	4770      	bx	lr
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    1cc6:	f240 72ff 	movw	r2, #2047	; 0x7ff
    1cca:	4b26      	ldr	r3, [pc, #152]	; (1d64 <TIM1_CC_handler+0x10c>)
    1ccc:	801a      	strh	r2, [r3, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    1cce:	2295      	movs	r2, #149	; 0x95
    1cd0:	e009      	b.n	1ce6 <TIM1_CC_handler+0x8e>
		break;
	case 17: // fin sync champ paire
		if (even){
    1cd2:	4b26      	ldr	r3, [pc, #152]	; (1d6c <TIM1_CC_handler+0x114>)
    1cd4:	681b      	ldr	r3, [r3, #0]
    1cd6:	2b00      	cmp	r3, #0
    1cd8:	d03f      	beq.n	1d5a <TIM1_CC_handler+0x102>
			*TIMER1_ARR=(FCLK/HFREQ-1);
    1cda:	f640 72ff 	movw	r2, #4095	; 0xfff
    1cde:	4b21      	ldr	r3, [pc, #132]	; (1d64 <TIM1_CC_handler+0x10c>)
    1ce0:	801a      	strh	r2, [r3, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    1ce2:	f240 122b 	movw	r2, #299	; 0x12b
    1ce6:	811a      	strh	r2, [r3, #8]
    1ce8:	4770      	bx	lr
		}
		break;
	case 18: // fin vsync
		if (!even){
    1cea:	4b20      	ldr	r3, [pc, #128]	; (1d6c <TIM1_CC_handler+0x114>)
    1cec:	681b      	ldr	r3, [r3, #0]
    1cee:	2b00      	cmp	r3, #0
    1cf0:	d133      	bne.n	1d5a <TIM1_CC_handler+0x102>
    1cf2:	e7f2      	b.n	1cda <TIM1_CC_handler+0x82>
	case TOP_LINE-1:
		video=1;
		//_enable_dma();
		break;
	case (TOP_LINE+VRES):
		video=0;
    1cf4:	2200      	movs	r2, #0
    1cf6:	4b1e      	ldr	r3, [pc, #120]	; (1d70 <TIM1_CC_handler+0x118>)
    1cf8:	e02e      	b.n	1d58 <TIM1_CC_handler+0x100>
		//_disable_dma();
		break;
	case FIELD_END:
		if (!even){
    1cfa:	4b1c      	ldr	r3, [pc, #112]	; (1d6c <TIM1_CC_handler+0x114>)
    1cfc:	6819      	ldr	r1, [r3, #0]
    1cfe:	2900      	cmp	r1, #0
    1d00:	d12b      	bne.n	1d5a <TIM1_CC_handler+0x102>
    1d02:	e007      	b.n	1d14 <TIM1_CC_handler+0xbc>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    1d04:	4b19      	ldr	r3, [pc, #100]	; (1d6c <TIM1_CC_handler+0x114>)
    1d06:	6819      	ldr	r1, [r3, #0]
    1d08:	b339      	cbz	r1, 1d5a <TIM1_CC_handler+0x102>
			*TIMER1_ARR/=2;
    1d0a:	4816      	ldr	r0, [pc, #88]	; (1d64 <TIM1_CC_handler+0x10c>)
    1d0c:	8801      	ldrh	r1, [r0, #0]
    1d0e:	f3c1 014e 	ubfx	r1, r1, #1, #15
    1d12:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    1d14:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    1d18:	6011      	str	r1, [r2, #0]
			even=-even;
    1d1a:	681a      	ldr	r2, [r3, #0]
    1d1c:	4252      	negs	r2, r2
    1d1e:	e01b      	b.n	1d58 <TIM1_CC_handler+0x100>
		}
	    break;
	default: 
		if (video){
    1d20:	4b13      	ldr	r3, [pc, #76]	; (1d70 <TIM1_CC_handler+0x118>)
    1d22:	681b      	ldr	r3, [r3, #0]
    1d24:	b1cb      	cbz	r3, 1d5a <TIM1_CC_handler+0x102>
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
    1d26:	4b13      	ldr	r3, [pc, #76]	; (1d74 <TIM1_CC_handler+0x11c>)
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    1d28:	2028      	movs	r0, #40	; 0x28
		}
	    break;
	default: 
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
    1d2a:	681a      	ldr	r2, [r3, #0]
    1d2c:	f022 0201 	bic.w	r2, r2, #1
    1d30:	601a      	str	r2, [r3, #0]
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    1d32:	680a      	ldr	r2, [r1, #0]
    1d34:	f1a2 013c 	sub.w	r1, r2, #60	; 0x3c
    1d38:	4a0f      	ldr	r2, [pc, #60]	; (1d78 <TIM1_CC_handler+0x120>)
    1d3a:	fb00 2201 	mla	r2, r0, r1, r2
			DMA1[DMACH5].cndtr=ROW_SIZE;
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    1d3e:	490f      	ldr	r1, [pc, #60]	; (1d7c <TIM1_CC_handler+0x124>)
	    break;
	default: 
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    1d40:	60da      	str	r2, [r3, #12]
			DMA1[DMACH5].cndtr=ROW_SIZE;
    1d42:	2214      	movs	r2, #20
    1d44:	605a      	str	r2, [r3, #4]
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    1d46:	880a      	ldrh	r2, [r1, #0]
    1d48:	b292      	uxth	r2, r2
    1d4a:	f5b2 7f7a 	cmp.w	r2, #1000	; 0x3e8
    1d4e:	d200      	bcs.n	1d52 <TIM1_CC_handler+0xfa>
    1d50:	e7f9      	b.n	1d46 <TIM1_CC_handler+0xee>
			_enable_dma();
    1d52:	681a      	ldr	r2, [r3, #0]
    1d54:	f042 0201 	orr.w	r2, r2, #1
    1d58:	601a      	str	r2, [r3, #0]
    1d5a:	4770      	bx	lr
    1d5c:	20000004 	.word	0x20000004
    1d60:	40012c10 	.word	0x40012c10
    1d64:	40012c2c 	.word	0x40012c2c
    1d68:	40012c34 	.word	0x40012c34
    1d6c:	200000e0 	.word	0x200000e0
    1d70:	200000dc 	.word	0x200000dc
    1d74:	40020058 	.word	0x40020058
    1d78:	200000ec 	.word	0x200000ec
    1d7c:	40012c24 	.word	0x40012c24

00001d80 <DMA1CH5_handler>:
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
    1d80:	b480      	push	{r7}
    1d82:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    1d84:	4a0a      	ldr	r2, [pc, #40]	; (1db0 <DMA1CH5_handler+0x30>)
    1d86:	4b0a      	ldr	r3, [pc, #40]	; (1db0 <DMA1CH5_handler+0x30>)
    1d88:	685b      	ldr	r3, [r3, #4]
    1d8a:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    1d8e:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    1d90:	bf00      	nop
    1d92:	4b08      	ldr	r3, [pc, #32]	; (1db4 <DMA1CH5_handler+0x34>)
    1d94:	891b      	ldrh	r3, [r3, #8]
    1d96:	b29b      	uxth	r3, r3
    1d98:	f003 0302 	and.w	r3, r3, #2
    1d9c:	2b00      	cmp	r3, #0
    1d9e:	d0f8      	beq.n	1d92 <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    1da0:	4b04      	ldr	r3, [pc, #16]	; (1db4 <DMA1CH5_handler+0x34>)
    1da2:	2200      	movs	r2, #0
    1da4:	819a      	strh	r2, [r3, #12]
}
    1da6:	46bd      	mov	sp, r7
    1da8:	f85d 7b04 	ldr.w	r7, [sp], #4
    1dac:	4770      	bx	lr
    1dae:	bf00      	nop
    1db0:	40020000 	.word	0x40020000
    1db4:	40003800 	.word	0x40003800

00001db8 <uart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
    1db8:	b480      	push	{r7}
    1dba:	b085      	sub	sp, #20
    1dbc:	af00      	add	r7, sp, #0
    1dbe:	6078      	str	r0, [r7, #4]
    1dc0:	6039      	str	r1, [r7, #0]
	sfrp_t brr;
	uint32_t rate;

    brr=(sfrp_t)(channel+USART_BRR_OFS);		
    1dc2:	687b      	ldr	r3, [r7, #4]
    1dc4:	3308      	adds	r3, #8
    1dc6:	60bb      	str	r3, [r7, #8]
	switch (channel){
    1dc8:	687b      	ldr	r3, [r7, #4]
    1dca:	4a1a      	ldr	r2, [pc, #104]	; (1e34 <uart_set_baud+0x7c>)
    1dcc:	4293      	cmp	r3, r2
    1dce:	d019      	beq.n	1e04 <uart_set_baud+0x4c>
    1dd0:	4a19      	ldr	r2, [pc, #100]	; (1e38 <uart_set_baud+0x80>)
    1dd2:	4293      	cmp	r3, r2
    1dd4:	d003      	beq.n	1dde <uart_set_baud+0x26>
    1dd6:	4a19      	ldr	r2, [pc, #100]	; (1e3c <uart_set_baud+0x84>)
    1dd8:	4293      	cmp	r3, r2
    1dda:	d013      	beq.n	1e04 <uart_set_baud+0x4c>
    1ddc:	e021      	b.n	1e22 <uart_set_baud+0x6a>
	case USART1:
		rate=(FAPB2/baud/16)<<4;
    1dde:	4a18      	ldr	r2, [pc, #96]	; (1e40 <uart_set_baud+0x88>)
    1de0:	683b      	ldr	r3, [r7, #0]
    1de2:	fbb2 f3f3 	udiv	r3, r2, r3
    1de6:	011b      	lsls	r3, r3, #4
    1de8:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    1dea:	4a16      	ldr	r2, [pc, #88]	; (1e44 <uart_set_baud+0x8c>)
    1dec:	683b      	ldr	r3, [r7, #0]
    1dee:	fbb2 f3f3 	udiv	r3, r2, r3
    1df2:	f003 030f 	and.w	r3, r3, #15
    1df6:	68fa      	ldr	r2, [r7, #12]
    1df8:	4313      	orrs	r3, r2
    1dfa:	60fb      	str	r3, [r7, #12]
		*brr=rate;
    1dfc:	68bb      	ldr	r3, [r7, #8]
    1dfe:	68fa      	ldr	r2, [r7, #12]
    1e00:	601a      	str	r2, [r3, #0]
		return;
    1e02:	e011      	b.n	1e28 <uart_set_baud+0x70>
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
    1e04:	4a10      	ldr	r2, [pc, #64]	; (1e48 <uart_set_baud+0x90>)
    1e06:	683b      	ldr	r3, [r7, #0]
    1e08:	fbb2 f3f3 	udiv	r3, r2, r3
    1e0c:	011b      	lsls	r3, r3, #4
    1e0e:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    1e10:	4a0e      	ldr	r2, [pc, #56]	; (1e4c <uart_set_baud+0x94>)
    1e12:	683b      	ldr	r3, [r7, #0]
    1e14:	fbb2 f3f3 	udiv	r3, r2, r3
    1e18:	f003 030f 	and.w	r3, r3, #15
    1e1c:	68fa      	ldr	r2, [r7, #12]
    1e1e:	4313      	orrs	r3, r2
    1e20:	60fb      	str	r3, [r7, #12]
	}
	*brr=rate;
    1e22:	68bb      	ldr	r3, [r7, #8]
    1e24:	68fa      	ldr	r2, [r7, #12]
    1e26:	601a      	str	r2, [r3, #0]
}
    1e28:	3714      	adds	r7, #20
    1e2a:	46bd      	mov	sp, r7
    1e2c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e30:	4770      	bx	lr
    1e32:	bf00      	nop
    1e34:	40004800 	.word	0x40004800
    1e38:	40013800 	.word	0x40013800
    1e3c:	40004400 	.word	0x40004400
    1e40:	003d0900 	.word	0x003d0900
    1e44:	03d09000 	.word	0x03d09000
    1e48:	001e8480 	.word	0x001e8480
    1e4c:	01e84800 	.word	0x01e84800

00001e50 <uart_open_channel>:

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl){
    1e50:	b580      	push	{r7, lr}
    1e52:	b086      	sub	sp, #24
    1e54:	af00      	add	r7, sp, #0
    1e56:	60f8      	str	r0, [r7, #12]
    1e58:	60b9      	str	r1, [r7, #8]
    1e5a:	607a      	str	r2, [r7, #4]
	sfrp_t cr1, cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
    1e5c:	68fb      	ldr	r3, [r7, #12]
    1e5e:	4a40      	ldr	r2, [pc, #256]	; (1f60 <uart_open_channel+0x110>)
    1e60:	4293      	cmp	r3, r2
    1e62:	d044      	beq.n	1eee <uart_open_channel+0x9e>
    1e64:	4a3f      	ldr	r2, [pc, #252]	; (1f64 <uart_open_channel+0x114>)
    1e66:	4293      	cmp	r3, r2
    1e68:	d003      	beq.n	1e72 <uart_open_channel+0x22>
    1e6a:	4a3f      	ldr	r2, [pc, #252]	; (1f68 <uart_open_channel+0x118>)
    1e6c:	4293      	cmp	r3, r2
    1e6e:	d020      	beq.n	1eb2 <uart_open_channel+0x62>
    1e70:	e05b      	b.n	1f2a <uart_open_channel+0xda>
	case USART1:
		APB2ENR->apb2enr|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
    1e72:	4a3e      	ldr	r2, [pc, #248]	; (1f6c <uart_open_channel+0x11c>)
    1e74:	4b3d      	ldr	r3, [pc, #244]	; (1f6c <uart_open_channel+0x11c>)
    1e76:	681b      	ldr	r3, [r3, #0]
    1e78:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    1e7c:	f043 0304 	orr.w	r3, r3, #4
    1e80:	6013      	str	r3, [r2, #0]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    1e82:	4a3b      	ldr	r2, [pc, #236]	; (1f70 <uart_open_channel+0x120>)
    1e84:	4b3a      	ldr	r3, [pc, #232]	; (1f70 <uart_open_channel+0x120>)
    1e86:	681b      	ldr	r3, [r3, #0]
    1e88:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    1e8c:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    1e90:	6013      	str	r3, [r2, #0]
		GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    1e92:	4a37      	ldr	r2, [pc, #220]	; (1f70 <uart_open_channel+0x120>)
    1e94:	4b36      	ldr	r3, [pc, #216]	; (1f70 <uart_open_channel+0x120>)
    1e96:	681b      	ldr	r3, [r3, #0]
    1e98:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    1e9c:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    1ea0:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART1,7);
    1ea2:	2025      	movs	r0, #37	; 0x25
    1ea4:	2107      	movs	r1, #7
    1ea6:	f7ff fc79 	bl	179c <set_int_priority>
		enable_interrupt(USART1_IRQ);
    1eaa:	2025      	movs	r0, #37	; 0x25
    1eac:	f7ff fc2e 	bl	170c <enable_interrupt>
		break;
    1eb0:	e03b      	b.n	1f2a <uart_open_channel+0xda>
	case USART2:
		APB1ENR->fld.usart2en=1;
    1eb2:	4b30      	ldr	r3, [pc, #192]	; (1f74 <uart_open_channel+0x124>)
    1eb4:	681a      	ldr	r2, [r3, #0]
    1eb6:	f442 3200 	orr.w	r2, r2, #131072	; 0x20000
    1eba:	601a      	str	r2, [r3, #0]
		APB2ENR->fld.iopaen=1;
    1ebc:	4b2b      	ldr	r3, [pc, #172]	; (1f6c <uart_open_channel+0x11c>)
    1ebe:	681a      	ldr	r2, [r3, #0]
    1ec0:	f042 0204 	orr.w	r2, r2, #4
    1ec4:	601a      	str	r2, [r3, #0]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    1ec6:	4a2c      	ldr	r2, [pc, #176]	; (1f78 <uart_open_channel+0x128>)
    1ec8:	4b2b      	ldr	r3, [pc, #172]	; (1f78 <uart_open_channel+0x128>)
    1eca:	681b      	ldr	r3, [r3, #0]
    1ecc:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    1ed0:	6013      	str	r3, [r2, #0]
		GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    1ed2:	4a29      	ldr	r2, [pc, #164]	; (1f78 <uart_open_channel+0x128>)
    1ed4:	4b28      	ldr	r3, [pc, #160]	; (1f78 <uart_open_channel+0x128>)
    1ed6:	681b      	ldr	r3, [r3, #0]
    1ed8:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    1edc:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART2,7);
    1ede:	2026      	movs	r0, #38	; 0x26
    1ee0:	2107      	movs	r1, #7
    1ee2:	f7ff fc5b 	bl	179c <set_int_priority>
		enable_interrupt(USART2_IRQ);
    1ee6:	2026      	movs	r0, #38	; 0x26
    1ee8:	f7ff fc10 	bl	170c <enable_interrupt>
		break;
    1eec:	e01d      	b.n	1f2a <uart_open_channel+0xda>
	case USART3:
		APB1ENR->fld.usart3en=1;
    1eee:	4b21      	ldr	r3, [pc, #132]	; (1f74 <uart_open_channel+0x124>)
    1ef0:	681a      	ldr	r2, [r3, #0]
    1ef2:	f442 2280 	orr.w	r2, r2, #262144	; 0x40000
    1ef6:	601a      	str	r2, [r3, #0]
		APB2ENR->fld.iopben=1;
    1ef8:	4b1c      	ldr	r3, [pc, #112]	; (1f6c <uart_open_channel+0x11c>)
    1efa:	681a      	ldr	r2, [r3, #0]
    1efc:	f042 0208 	orr.w	r2, r2, #8
    1f00:	601a      	str	r2, [r3, #0]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    1f02:	4a1e      	ldr	r2, [pc, #120]	; (1f7c <uart_open_channel+0x12c>)
    1f04:	4b1d      	ldr	r3, [pc, #116]	; (1f7c <uart_open_channel+0x12c>)
    1f06:	681b      	ldr	r3, [r3, #0]
    1f08:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    1f0c:	6013      	str	r3, [r2, #0]
		GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    1f0e:	4a1b      	ldr	r2, [pc, #108]	; (1f7c <uart_open_channel+0x12c>)
    1f10:	4b1a      	ldr	r3, [pc, #104]	; (1f7c <uart_open_channel+0x12c>)
    1f12:	681b      	ldr	r3, [r3, #0]
    1f14:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    1f18:	6013      	str	r3, [r2, #0]
		set_int_priority(IRQ_USART3,7);
    1f1a:	2027      	movs	r0, #39	; 0x27
    1f1c:	2107      	movs	r1, #7
    1f1e:	f7ff fc3d 	bl	179c <set_int_priority>
		enable_interrupt(USART3_IRQ);
    1f22:	2027      	movs	r0, #39	; 0x27
    1f24:	f7ff fbf2 	bl	170c <enable_interrupt>
		break;
    1f28:	bf00      	nop
	}
	uart_set_baud(channel,baud);
    1f2a:	68f8      	ldr	r0, [r7, #12]
    1f2c:	68b9      	ldr	r1, [r7, #8]
    1f2e:	f7ff ff43 	bl	1db8 <uart_set_baud>
	if (flow_ctrl==FLOW_HARD){
    1f32:	687b      	ldr	r3, [r7, #4]
    1f34:	2b01      	cmp	r3, #1
    1f36:	d106      	bne.n	1f46 <uart_open_channel+0xf6>
		cr3=(sfrp_t)(channel+USART_CR3_OFS);
    1f38:	68fb      	ldr	r3, [r7, #12]
    1f3a:	3314      	adds	r3, #20
    1f3c:	617b      	str	r3, [r7, #20]
		*cr3=(1<<USART_CR3_CTSE)|(1<<USART_CR3_RTSE);
    1f3e:	697b      	ldr	r3, [r7, #20]
    1f40:	f44f 7240 	mov.w	r2, #768	; 0x300
    1f44:	601a      	str	r2, [r3, #0]
	}
	cr1=(sfrp_t)(channel+USART_CR1_OFS);
    1f46:	68fb      	ldr	r3, [r7, #12]
    1f48:	330c      	adds	r3, #12
    1f4a:	613b      	str	r3, [r7, #16]
	uart_getc(channel);
    1f4c:	68f8      	ldr	r0, [r7, #12]
    1f4e:	f000 f82d 	bl	1fac <uart_getc>
	*cr1=(1<<USART_CR1_UE)|(1<<USART_CR1_TE)|(1<<USART_CR1_RE)|(1<<USART_CR1_RXNEIE);
    1f52:	693b      	ldr	r3, [r7, #16]
    1f54:	f242 022c 	movw	r2, #8236	; 0x202c
    1f58:	601a      	str	r2, [r3, #0]
}
    1f5a:	3718      	adds	r7, #24
    1f5c:	46bd      	mov	sp, r7
    1f5e:	bd80      	pop	{r7, pc}
    1f60:	40004800 	.word	0x40004800
    1f64:	40013800 	.word	0x40013800
    1f68:	40004400 	.word	0x40004400
    1f6c:	40021018 	.word	0x40021018
    1f70:	40010804 	.word	0x40010804
    1f74:	4002101c 	.word	0x4002101c
    1f78:	40010800 	.word	0x40010800
    1f7c:	40010c04 	.word	0x40010c04

00001f80 <uart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int uart_stat(unsigned channel){
    1f80:	b480      	push	{r7}
    1f82:	b085      	sub	sp, #20
    1f84:	af00      	add	r7, sp, #0
    1f86:	6078      	str	r0, [r7, #4]
	sfrp_t sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    1f88:	687b      	ldr	r3, [r7, #4]
    1f8a:	60fb      	str	r3, [r7, #12]
	return *sr&(1<<USART_SR_RXNE)?-1:0;
    1f8c:	68fb      	ldr	r3, [r7, #12]
    1f8e:	681b      	ldr	r3, [r3, #0]
    1f90:	f003 0320 	and.w	r3, r3, #32
    1f94:	2b00      	cmp	r3, #0
    1f96:	d002      	beq.n	1f9e <uart_stat+0x1e>
    1f98:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1f9c:	e000      	b.n	1fa0 <uart_stat+0x20>
    1f9e:	2300      	movs	r3, #0
}
    1fa0:	4618      	mov	r0, r3
    1fa2:	3714      	adds	r7, #20
    1fa4:	46bd      	mov	sp, r7
    1fa6:	f85d 7b04 	ldr.w	r7, [sp], #4
    1faa:	4770      	bx	lr

00001fac <uart_getc>:

// reçoit un caractère de la console
char uart_getc(unsigned channel){
    1fac:	b480      	push	{r7}
    1fae:	b085      	sub	sp, #20
    1fb0:	af00      	add	r7, sp, #0
    1fb2:	6078      	str	r0, [r7, #4]
	sfrp_t dr;
	
	dr=(sfrp_t)(channel+USART_DR_OFS);
    1fb4:	687b      	ldr	r3, [r7, #4]
    1fb6:	3304      	adds	r3, #4
    1fb8:	60fb      	str	r3, [r7, #12]
	return *dr&0x7f;
    1fba:	68fb      	ldr	r3, [r7, #12]
    1fbc:	681b      	ldr	r3, [r3, #0]
    1fbe:	b2db      	uxtb	r3, r3
    1fc0:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    1fc4:	b2db      	uxtb	r3, r3
}
    1fc6:	4618      	mov	r0, r3
    1fc8:	3714      	adds	r7, #20
    1fca:	46bd      	mov	sp, r7
    1fcc:	f85d 7b04 	ldr.w	r7, [sp], #4
    1fd0:	4770      	bx	lr
    1fd2:	bf00      	nop

00001fd4 <uart_putc>:

// transmet un caractère à la console
void uart_putc(unsigned channel, char c){
    1fd4:	b480      	push	{r7}
    1fd6:	b085      	sub	sp, #20
    1fd8:	af00      	add	r7, sp, #0
    1fda:	6078      	str	r0, [r7, #4]
    1fdc:	460b      	mov	r3, r1
    1fde:	70fb      	strb	r3, [r7, #3]
	sfrp_t dr, sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    1fe0:	687b      	ldr	r3, [r7, #4]
    1fe2:	60fb      	str	r3, [r7, #12]
	dr=(sfrp_t)(channel+USART_DR_OFS);
    1fe4:	687b      	ldr	r3, [r7, #4]
    1fe6:	3304      	adds	r3, #4
    1fe8:	60bb      	str	r3, [r7, #8]
	//attend que dr soit vide
	while (!(*sr&(1<<USART_SR_TXE)));
    1fea:	bf00      	nop
    1fec:	68fb      	ldr	r3, [r7, #12]
    1fee:	681b      	ldr	r3, [r3, #0]
    1ff0:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1ff4:	2b00      	cmp	r3, #0
    1ff6:	d0f9      	beq.n	1fec <uart_putc+0x18>
	*dr=c&0x7f;
    1ff8:	78fb      	ldrb	r3, [r7, #3]
    1ffa:	f003 027f 	and.w	r2, r3, #127	; 0x7f
    1ffe:	68bb      	ldr	r3, [r7, #8]
    2000:	601a      	str	r2, [r3, #0]
}
    2002:	3714      	adds	r7, #20
    2004:	46bd      	mov	sp, r7
    2006:	f85d 7b04 	ldr.w	r7, [sp], #4
    200a:	4770      	bx	lr

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
