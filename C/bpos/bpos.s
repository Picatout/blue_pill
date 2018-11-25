
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 65 02 00 00 e1 01 00 00     .P. 1...e.......
      10:	69 02 00 00 6d 02 00 00 71 02 00 00 fd 2c 00 00     i...m...q....,..
      20:	fd 2c 00 00 fd 2c 00 00 fd 2c 00 00 5d 05 00 00     .,...,...,..]...
      30:	fd 2c 00 00 fd 2c 00 00 79 02 00 00 d5 2d 00 00     .,...,..y....-..
      40:	81 02 00 00 85 02 00 00 8d 02 00 00 89 02 00 00     ................
      50:	91 02 00 00 95 02 00 00 99 02 00 00 9d 02 00 00     ................
      60:	a1 02 00 00 a5 02 00 00 a9 02 00 00 ad 02 00 00     ................
      70:	b1 02 00 00 fd 2c 00 00 fd 2c 00 00 11 31 00 00     .....,...,...1..
      80:	fd 2c 00 00 fd 2c 00 00 fd 2c 00 00 fd 2c 00 00     .,...,...,...,..
      90:	fd 2c 00 00 fd 2c 00 00 fd 2c 00 00 c9 21 00 00     .,...,...,...!..
      a0:	fd 2c 00 00 fd 2c 00 00 fd 2c 00 00 9d 2f 00 00     .,...,...,.../..
      b0:	31 23 00 00 c5 02 00 00 19 1d 00 00 fd 2c 00 00     1#...........,..
      c0:	fd 2c 00 00 fd 2c 00 00 fd 2c 00 00 fd 2c 00 00     .,...,...,...,..
      d0:	fd 2c 00 00 cd 02 00 00 d5 35 00 00 d5 02 00 00     .,.......5......
      e0:	fd 2c 00 00 fd 2c 00 00 fd 2c 00 00 fd 2c 00 00     .,...,...,...,..
      f0:	fd 2c 00 00 fd 2c 00 00 fd 2c 00 00 fd 2c 00 00     .,...,...,...,..
     100:	fd 2c 00 00 fd 2c 00 00 fd 2c 00 00 fd 2c 00 00     .,...,...,...,..
     110:	fd 2c 00 00 fd 2c 00 00 fd 2c 00 00 fd 2c 00 00     .,...,...,...,..
     120:	fd 2c 00 00 fd 2c 00 00 fd 2c 00 00 fd 2c 00 00     .,...,...,...,..

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
     1c4:	00004090 	.word	0x00004090
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
     208:	f002 fd80 	bl	2d0c <print_fault>
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
     21e:	f002 fd75 	bl	2d0c <print_fault>
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
     234:	f002 fd6a 	bl	2d0c <print_fault>
     238:	e003      	b.n	242 <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     23a:	4809      	ldr	r0, [pc, #36]	; (260 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f002 fd65 	bl	2d0c <print_fault>
	}
}
     242:	370c      	adds	r7, #12
     244:	46bd      	mov	sp, r7
     246:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     24a:	4685      	mov	sp, r0
     24c:	4770      	bx	lr
     24e:	bf00      	nop
     250:	e000ed28 	.word	0xe000ed28
     254:	00003d34 	.word	0x00003d34
     258:	00003d4c 	.word	0x00003d4c
     25c:	00003d58 	.word	0x00003d58
     260:	00003d68 	.word	0x00003d68

00000264 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     264:	f002 fd4a 	bl	2cfc <reset_mcu>

00000268 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     268:	f002 fd48 	bl	2cfc <reset_mcu>

0000026c <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     26c:	f002 fd46 	bl	2cfc <reset_mcu>

00000270 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     270:	f002 fd44 	bl	2cfc <reset_mcu>
_default_handler(SVC_handler) // 11
     274:	f002 fd42 	bl	2cfc <reset_mcu>

00000278 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     278:	f002 fd40 	bl	2cfc <reset_mcu>
_default_handler(STK_handler) // 15
     27c:	f002 fd3e 	bl	2cfc <reset_mcu>

00000280 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     280:	f002 fd3c 	bl	2cfc <reset_mcu>

00000284 <PVD_handler>:
_default_handler(PVD_handler) // 1
     284:	f002 fd3a 	bl	2cfc <reset_mcu>

00000288 <RTC_handler>:
_default_handler(RTC_handler) // 2
     288:	f002 fd38 	bl	2cfc <reset_mcu>

0000028c <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     28c:	f002 fd36 	bl	2cfc <reset_mcu>

00000290 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     290:	f002 fd34 	bl	2cfc <reset_mcu>

00000294 <RCC_handler>:
_default_handler(RCC_handler) // 5
     294:	f002 fd32 	bl	2cfc <reset_mcu>

00000298 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     298:	f002 fd30 	bl	2cfc <reset_mcu>

0000029c <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     29c:	f002 fd2e 	bl	2cfc <reset_mcu>

000002a0 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a0:	f002 fd2c 	bl	2cfc <reset_mcu>

000002a4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2a4:	f002 fd2a 	bl	2cfc <reset_mcu>

000002a8 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2a8:	f002 fd28 	bl	2cfc <reset_mcu>

000002ac <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2ac:	f002 fd26 	bl	2cfc <reset_mcu>

000002b0 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b0:	f002 fd24 	bl	2cfc <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2b4:	f002 fd22 	bl	2cfc <reset_mcu>
_default_handler(EXTI9_5_handler) // 23
     2b8:	f002 fd20 	bl	2cfc <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2bc:	f002 fd1e 	bl	2cfc <reset_mcu>
_default_handler(TIM2_handler) // 28
     2c0:	f002 fd1c 	bl	2cfc <reset_mcu>

000002c4 <TIM3_handler>:
_default_handler(TIM3_handler) // 29
     2c4:	f002 fd1a 	bl	2cfc <reset_mcu>
_default_handler(TIM4_handler) // 30
     2c8:	f002 fd18 	bl	2cfc <reset_mcu>

000002cc <USART1_handler>:
_default_handler(USART1_handler) // 37
     2cc:	f002 fd16 	bl	2cfc <reset_mcu>
_default_handler(USART2_handler) // 38
     2d0:	f002 fd14 	bl	2cfc <reset_mcu>

000002d4 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2d4:	f002 fd12 	bl	2cfc <reset_mcu>

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
     5e6:	f001 fc05 	bl	1df4 <write_pin>
		//led_on();
		break;
     5ea:	e092      	b.n	712 <SVC_handler+0x1b6>
	case SVC_LED_OFF:
		write_pin(LED_PORT,LED_PIN,LED_OFF);
     5ec:	484c      	ldr	r0, [pc, #304]	; (720 <SVC_handler+0x1c4>)
     5ee:	210d      	movs	r1, #13
     5f0:	2201      	movs	r2, #1
     5f2:	f001 fbff 	bl	1df4 <write_pin>
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
     60c:	f000 fdc8 	bl	11a0 <conin>
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
     620:	f000 fdae 	bl	1180 <conout>
		break;
     624:	e075      	b.n	712 <SVC_handler+0x1b6>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     626:	68bb      	ldr	r3, [r7, #8]
     628:	681b      	ldr	r3, [r3, #0]
     62a:	6878      	ldr	r0, [r7, #4]
     62c:	4619      	mov	r1, r3
     62e:	f000 fde5 	bl	11fc <read_line>
     632:	4602      	mov	r2, r0
     634:	68bb      	ldr	r3, [r7, #8]
     636:	601a      	str	r2, [r3, #0]
		break;
     638:	e06b      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT:
		print((const char*)arg1);
     63a:	68b8      	ldr	r0, [r7, #8]
     63c:	f000 fdba 	bl	11b4 <print>
		break;
     640:	e067      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT_INT:
		print_int(*(int32_t*)arg1,10);
     642:	68bb      	ldr	r3, [r7, #8]
     644:	681b      	ldr	r3, [r3, #0]
     646:	4618      	mov	r0, r3
     648:	210a      	movs	r1, #10
     64a:	f000 fe8d 	bl	1368 <print_int>
		break;
     64e:	e060      	b.n	712 <SVC_handler+0x1b6>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     650:	68bb      	ldr	r3, [r7, #8]
     652:	681b      	ldr	r3, [r3, #0]
     654:	4618      	mov	r0, r3
     656:	f000 fef5 	bl	1444 <print_hex>
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
     6de:	f000 ff5b 	bl	1598 <flash_write>
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
     6f0:	f000 ff96 	bl	1620 <flash_erase_page>
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
     706:	f000 feff 	bl	1508 <cls>
		break;
     70a:	e002      	b.n	712 <SVC_handler+0x1b6>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     70c:	f002 faf6 	bl	2cfc <reset_mcu>
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
     8bc:	000036dc 	.word	0x000036dc

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
     8d6:	f000 fc6d 	bl	11b4 <print>
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
     944:	000036dc 	.word	0x000036dc

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
     990:	000036dc 	.word	0x000036dc

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
     b10:	f000 fb50 	bl	11b4 <print>
}
     b14:	3708      	adds	r7, #8
     b16:	46bd      	mov	sp, r7
     b18:	bd80      	pop	{r7, pc}
     b1a:	bf00      	nop
     b1c:	20000058 	.word	0x20000058
     b20:	00003618 	.word	0x00003618

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
     b4a:	f000 fb33 	bl	11b4 <print>
}
     b4e:	3708      	adds	r7, #8
     b50:	46bd      	mov	sp, r7
     b52:	bd80      	pop	{r7, pc}
     b54:	20000058 	.word	0x20000058
     b58:	00003618 	.word	0x00003618

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
     b9e:	f000 fa9b 	bl	10d8 <con_select>
}
     ba2:	3708      	adds	r7, #8
     ba4:	46bd      	mov	sp, r7
     ba6:	bd80      	pop	{r7, pc}
     ba8:	00003624 	.word	0x00003624
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
     c20:	000036dc 	.word	0x000036dc

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
     eae:	f000 f967 	bl	1180 <conout>
			print((const char*)pad); conout('?');
     eb2:	480a      	ldr	r0, [pc, #40]	; (edc <parse_line+0x60>)
     eb4:	f000 f97e 	bl	11b4 <print>
     eb8:	203f      	movs	r0, #63	; 0x3f
     eba:	f000 f961 	bl	1180 <conout>
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
     ecc:	f000 f958 	bl	1180 <conout>
}
     ed0:	3710      	adds	r7, #16
     ed2:	46bd      	mov	sp, r7
     ed4:	bd80      	pop	{r7, pc}
     ed6:	bf00      	nop
     ed8:	200000a8 	.word	0x200000a8
     edc:	20000058 	.word	0x20000058
     ee0:	000036dc 	.word	0x000036dc

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
     f1c:	00004000 	.word	0x00004000
     f20:	00004090 	.word	0x00004090
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
     f38:	f001 fae6 	bl	2508 <set_int_priority>
	config_systicks();
     f3c:	f001 ff22 	bl	2d84 <config_systicks>
	flash_enable();
     f40:	f000 faea 	bl	1518 <flash_enable>
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
     f44:	4b32      	ldr	r3, [pc, #200]	; (1010 <main+0xe8>)
     f46:	221d      	movs	r2, #29
     f48:	619a      	str	r2, [r3, #24]
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
     f4a:	4b31      	ldr	r3, [pc, #196]	; (1010 <main+0xe8>)
     f4c:	f44f 4280 	mov.w	r2, #16384	; 0x4000
     f50:	61da      	str	r2, [r3, #28]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     f52:	4a2f      	ldr	r2, [pc, #188]	; (1010 <main+0xe8>)
     f54:	4b2e      	ldr	r3, [pc, #184]	; (1010 <main+0xe8>)
     f56:	695b      	ldr	r3, [r3, #20]
     f58:	f043 0301 	orr.w	r3, r3, #1
     f5c:	6153      	str	r3, [r2, #20]
	config_pin(LED_PORT,LED_PIN,OUTPUT_OD_SLOW);
     f5e:	482d      	ldr	r0, [pc, #180]	; (1014 <main+0xec>)
     f60:	210d      	movs	r1, #13
     f62:	2206      	movs	r2, #6
     f64:	f000 ff02 	bl	1d6c <config_pin>
	vt_init();
     f68:	f002 fab4 	bl	34d4 <vt_init>
	keyboard_init();
     f6c:	f000 ff78 	bl	1e60 <keyboard_init>
	tvout_init();
     f70:	f001 ff54 	bl	2e1c <tvout_init>
	console_init(SERIAL);
     f74:	2001      	movs	r0, #1
     f76:	f000 f8eb 	bl	1150 <console_init>
	if (!vt_ready()){con_select(LOCAL);}
     f7a:	f002 fb19 	bl	35b0 <vt_ready>
     f7e:	4603      	mov	r3, r0
     f80:	2b00      	cmp	r3, #0
     f82:	d102      	bne.n	f8a <main+0x62>
     f84:	2000      	movs	r0, #0
     f86:	f000 f8a7 	bl	10d8 <con_select>
	cls();
     f8a:	f000 fabd 	bl	1508 <cls>
	print(VERSION);
     f8e:	4b22      	ldr	r3, [pc, #136]	; (1018 <main+0xf0>)
     f90:	681b      	ldr	r3, [r3, #0]
     f92:	4618      	mov	r0, r3
     f94:	f000 f90e 	bl	11b4 <print>
	copy_blink_in_ram();
     f98:	f7ff ffa4 	bl	ee4 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
     f9c:	481f      	ldr	r0, [pc, #124]	; (101c <main+0xf4>)
     f9e:	f000 f909 	bl	11b4 <print>
     fa2:	4b1f      	ldr	r3, [pc, #124]	; (1020 <main+0xf8>)
     fa4:	2200      	movs	r2, #0
     fa6:	4618      	mov	r0, r3
     fa8:	4611      	mov	r1, r2
     faa:	df0a      	svc	10
     fac:	200d      	movs	r0, #13
     fae:	f000 f8e7 	bl	1180 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     fb2:	2300      	movs	r3, #0
     fb4:	2200      	movs	r2, #0
     fb6:	4618      	mov	r0, r3
     fb8:	4611      	mov	r1, r2
     fba:	df01      	svc	1
	print("initializing SDcard\n");
     fbc:	4819      	ldr	r0, [pc, #100]	; (1024 <main+0xfc>)
     fbe:	f000 f8f9 	bl	11b4 <print>
	if (sdcard_init()){
     fc2:	f001 fc13 	bl	27ec <sdcard_init>
     fc6:	4603      	mov	r3, r0
     fc8:	2b00      	cmp	r3, #0
     fca:	d00d      	beq.n	fe8 <main+0xc0>
			print("SDcard capacity: ");print_int(sdcard_capacity(),10);print(" Mo\n");
     fcc:	4816      	ldr	r0, [pc, #88]	; (1028 <main+0x100>)
     fce:	f000 f8f1 	bl	11b4 <print>
     fd2:	f001 fac9 	bl	2568 <sdcard_capacity>
     fd6:	4603      	mov	r3, r0
     fd8:	4618      	mov	r0, r3
     fda:	210a      	movs	r1, #10
     fdc:	f000 f9c4 	bl	1368 <print_int>
     fe0:	4812      	ldr	r0, [pc, #72]	; (102c <main+0x104>)
     fe2:	f000 f8e7 	bl	11b4 <print>
     fe6:	e00a      	b.n	ffe <main+0xd6>
	}else{
		print("SDcard initialization failed, status code: "); print_hex(sdc_status);conout('\n');
     fe8:	4811      	ldr	r0, [pc, #68]	; (1030 <main+0x108>)
     fea:	f000 f8e3 	bl	11b4 <print>
     fee:	4b11      	ldr	r3, [pc, #68]	; (1034 <main+0x10c>)
     ff0:	881b      	ldrh	r3, [r3, #0]
     ff2:	4618      	mov	r0, r3
     ff4:	f000 fa26 	bl	1444 <print_hex>
     ff8:	200a      	movs	r0, #10
     ffa:	f000 f8c1 	bl	1180 <conout>
	} 
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
     ffe:	480e      	ldr	r0, [pc, #56]	; (1038 <main+0x110>)
    1000:	2150      	movs	r1, #80	; 0x50
    1002:	f000 f8fb 	bl	11fc <read_line>
    1006:	6078      	str	r0, [r7, #4]
		parse_line(llen);
    1008:	6878      	ldr	r0, [r7, #4]
    100a:	f7ff ff37 	bl	e7c <parse_line>
	}
    100e:	e7f6      	b.n	ffe <main+0xd6>
    1010:	40021000 	.word	0x40021000
    1014:	40011000 	.word	0x40011000
    1018:	20000000 	.word	0x20000000
    101c:	000037bc 	.word	0x000037bc
    1020:	200000f0 	.word	0x200000f0
    1024:	000037d8 	.word	0x000037d8
    1028:	000037f0 	.word	0x000037f0
    102c:	00003804 	.word	0x00003804
    1030:	0000380c 	.word	0x0000380c
    1034:	20000134 	.word	0x20000134
    1038:	20000008 	.word	0x20000008

0000103c <queue_insert>:
#include "vt100.h"

console_t con;


static void queue_insert(char c){
    103c:	b480      	push	{r7}
    103e:	b083      	sub	sp, #12
    1040:	af00      	add	r7, sp, #0
    1042:	4603      	mov	r3, r0
    1044:	71fb      	strb	r3, [r7, #7]
		con.queue[con.head++]=c;
    1046:	4b0a      	ldr	r3, [pc, #40]	; (1070 <queue_insert+0x34>)
    1048:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    104a:	1c5a      	adds	r2, r3, #1
    104c:	4908      	ldr	r1, [pc, #32]	; (1070 <queue_insert+0x34>)
    104e:	624a      	str	r2, [r1, #36]	; 0x24
    1050:	4a07      	ldr	r2, [pc, #28]	; (1070 <queue_insert+0x34>)
    1052:	4413      	add	r3, r2
    1054:	79fa      	ldrb	r2, [r7, #7]
    1056:	705a      	strb	r2, [r3, #1]
		con.head&=CON_QUEUE_SIZE-1;
    1058:	4b05      	ldr	r3, [pc, #20]	; (1070 <queue_insert+0x34>)
    105a:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    105c:	f003 031f 	and.w	r3, r3, #31
    1060:	4a03      	ldr	r2, [pc, #12]	; (1070 <queue_insert+0x34>)
    1062:	6253      	str	r3, [r2, #36]	; 0x24
}
    1064:	370c      	adds	r7, #12
    1066:	46bd      	mov	sp, r7
    1068:	f85d 7b04 	ldr.w	r7, [sp], #4
    106c:	4770      	bx	lr
    106e:	bf00      	nop
    1070:	200000f4 	.word	0x200000f4

00001074 <queue_getc>:

static char queue_getc(){
    1074:	b480      	push	{r7}
    1076:	b083      	sub	sp, #12
    1078:	af00      	add	r7, sp, #0
	char c=0;
    107a:	2300      	movs	r3, #0
    107c:	71fb      	strb	r3, [r7, #7]
	if (con.tail!=con.head){
    107e:	4b0e      	ldr	r3, [pc, #56]	; (10b8 <queue_getc+0x44>)
    1080:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    1082:	4b0d      	ldr	r3, [pc, #52]	; (10b8 <queue_getc+0x44>)
    1084:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1086:	429a      	cmp	r2, r3
    1088:	d00e      	beq.n	10a8 <queue_getc+0x34>
		c=con.queue[con.tail++];
    108a:	4b0b      	ldr	r3, [pc, #44]	; (10b8 <queue_getc+0x44>)
    108c:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    108e:	1c5a      	adds	r2, r3, #1
    1090:	4909      	ldr	r1, [pc, #36]	; (10b8 <queue_getc+0x44>)
    1092:	628a      	str	r2, [r1, #40]	; 0x28
    1094:	4a08      	ldr	r2, [pc, #32]	; (10b8 <queue_getc+0x44>)
    1096:	4413      	add	r3, r2
    1098:	785b      	ldrb	r3, [r3, #1]
    109a:	71fb      	strb	r3, [r7, #7]
		con.tail&=CON_QUEUE_SIZE-1;
    109c:	4b06      	ldr	r3, [pc, #24]	; (10b8 <queue_getc+0x44>)
    109e:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    10a0:	f003 031f 	and.w	r3, r3, #31
    10a4:	4a04      	ldr	r2, [pc, #16]	; (10b8 <queue_getc+0x44>)
    10a6:	6293      	str	r3, [r2, #40]	; 0x28
	}
	return c;
    10a8:	79fb      	ldrb	r3, [r7, #7]
}
    10aa:	4618      	mov	r0, r3
    10ac:	370c      	adds	r7, #12
    10ae:	46bd      	mov	sp, r7
    10b0:	f85d 7b04 	ldr.w	r7, [sp], #4
    10b4:	4770      	bx	lr
    10b6:	bf00      	nop
    10b8:	200000f4 	.word	0x200000f4

000010bc <con_queue_flush>:

void con_queue_flush(){
    10bc:	b480      	push	{r7}
    10be:	af00      	add	r7, sp, #0
	con.tail=con.head=0;
    10c0:	2300      	movs	r3, #0
    10c2:	4a04      	ldr	r2, [pc, #16]	; (10d4 <con_queue_flush+0x18>)
    10c4:	6253      	str	r3, [r2, #36]	; 0x24
    10c6:	4a03      	ldr	r2, [pc, #12]	; (10d4 <con_queue_flush+0x18>)
    10c8:	6293      	str	r3, [r2, #40]	; 0x28
}
    10ca:	46bd      	mov	sp, r7
    10cc:	f85d 7b04 	ldr.w	r7, [sp], #4
    10d0:	4770      	bx	lr
    10d2:	bf00      	nop
    10d4:	200000f4 	.word	0x200000f4

000010d8 <con_select>:

static const char PROMPT[]=" OK\n";

void con_select(console_dev_t dev){
    10d8:	b580      	push	{r7, lr}
    10da:	b082      	sub	sp, #8
    10dc:	af00      	add	r7, sp, #0
    10de:	4603      	mov	r3, r0
    10e0:	71fb      	strb	r3, [r7, #7]
	con_queue_flush();
    10e2:	f7ff ffeb 	bl	10bc <con_queue_flush>
	con.dev=dev;
    10e6:	4a12      	ldr	r2, [pc, #72]	; (1130 <con_select+0x58>)
    10e8:	79fb      	ldrb	r3, [r7, #7]
    10ea:	7013      	strb	r3, [r2, #0]
	if (dev==LOCAL){
    10ec:	79fb      	ldrb	r3, [r7, #7]
    10ee:	2b00      	cmp	r3, #0
    10f0:	d10c      	bne.n	110c <con_select+0x34>
		con.putc=gdi_putc;
    10f2:	4b0f      	ldr	r3, [pc, #60]	; (1130 <con_select+0x58>)
    10f4:	4a0f      	ldr	r2, [pc, #60]	; (1134 <con_select+0x5c>)
    10f6:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=gdi_clear_screen;
    10f8:	4b0d      	ldr	r3, [pc, #52]	; (1130 <con_select+0x58>)
    10fa:	4a0f      	ldr	r2, [pc, #60]	; (1138 <con_select+0x60>)
    10fc:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=gdi_del_back;
    10fe:	4b0c      	ldr	r3, [pc, #48]	; (1130 <con_select+0x58>)
    1100:	4a0e      	ldr	r2, [pc, #56]	; (113c <con_select+0x64>)
    1102:	639a      	str	r2, [r3, #56]	; 0x38
		gdi_text_cursor(1);
    1104:	2001      	movs	r0, #1
    1106:	f000 fdab 	bl	1c60 <gdi_text_cursor>
    110a:	e00b      	b.n	1124 <con_select+0x4c>
	}else{
		gdi_text_cursor(0);
    110c:	2000      	movs	r0, #0
    110e:	f000 fda7 	bl	1c60 <gdi_text_cursor>
		con.putc=vt_putc;
    1112:	4b07      	ldr	r3, [pc, #28]	; (1130 <con_select+0x58>)
    1114:	4a0a      	ldr	r2, [pc, #40]	; (1140 <con_select+0x68>)
    1116:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=vt_cls;
    1118:	4b05      	ldr	r3, [pc, #20]	; (1130 <con_select+0x58>)
    111a:	4a0a      	ldr	r2, [pc, #40]	; (1144 <con_select+0x6c>)
    111c:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=vt_del_back;
    111e:	4b04      	ldr	r3, [pc, #16]	; (1130 <con_select+0x58>)
    1120:	4a09      	ldr	r2, [pc, #36]	; (1148 <con_select+0x70>)
    1122:	639a      	str	r2, [r3, #56]	; 0x38
	}
	print(PROMPT);
    1124:	4809      	ldr	r0, [pc, #36]	; (114c <con_select+0x74>)
    1126:	f000 f845 	bl	11b4 <print>
}
    112a:	3708      	adds	r7, #8
    112c:	46bd      	mov	sp, r7
    112e:	bd80      	pop	{r7, pc}
    1130:	200000f4 	.word	0x200000f4
    1134:	00001b55 	.word	0x00001b55
    1138:	00001711 	.word	0x00001711
    113c:	00001b11 	.word	0x00001b11
    1140:	000034f5 	.word	0x000034f5
    1144:	00003555 	.word	0x00003555
    1148:	00003515 	.word	0x00003515
    114c:	00003838 	.word	0x00003838

00001150 <console_init>:

void console_init(console_dev_t dev){
    1150:	b580      	push	{r7, lr}
    1152:	b082      	sub	sp, #8
    1154:	af00      	add	r7, sp, #0
    1156:	4603      	mov	r3, r0
    1158:	71fb      	strb	r3, [r7, #7]
	con.getc=queue_getc;
    115a:	4b06      	ldr	r3, [pc, #24]	; (1174 <console_init+0x24>)
    115c:	4a06      	ldr	r2, [pc, #24]	; (1178 <console_init+0x28>)
    115e:	631a      	str	r2, [r3, #48]	; 0x30
	con.insert=queue_insert;
    1160:	4b04      	ldr	r3, [pc, #16]	; (1174 <console_init+0x24>)
    1162:	4a06      	ldr	r2, [pc, #24]	; (117c <console_init+0x2c>)
    1164:	62da      	str	r2, [r3, #44]	; 0x2c
	con_select(dev);
    1166:	79fb      	ldrb	r3, [r7, #7]
    1168:	4618      	mov	r0, r3
    116a:	f7ff ffb5 	bl	10d8 <con_select>
}
    116e:	3708      	adds	r7, #8
    1170:	46bd      	mov	sp, r7
    1172:	bd80      	pop	{r7, pc}
    1174:	200000f4 	.word	0x200000f4
    1178:	00001075 	.word	0x00001075
    117c:	0000103d 	.word	0x0000103d

00001180 <conout>:

// envoie d'un caractère à la console
void conout(char c){
    1180:	b580      	push	{r7, lr}
    1182:	b082      	sub	sp, #8
    1184:	af00      	add	r7, sp, #0
    1186:	4603      	mov	r3, r0
    1188:	71fb      	strb	r3, [r7, #7]
	con.putc(c);
    118a:	4b04      	ldr	r3, [pc, #16]	; (119c <conout+0x1c>)
    118c:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    118e:	79fa      	ldrb	r2, [r7, #7]
    1190:	4610      	mov	r0, r2
    1192:	4798      	blx	r3
}
    1194:	3708      	adds	r7, #8
    1196:	46bd      	mov	sp, r7
    1198:	bd80      	pop	{r7, pc}
    119a:	bf00      	nop
    119c:	200000f4 	.word	0x200000f4

000011a0 <conin>:


// réception d'un caractère de la console
char conin(){
    11a0:	b580      	push	{r7, lr}
    11a2:	af00      	add	r7, sp, #0
	return con.getc();
    11a4:	4b02      	ldr	r3, [pc, #8]	; (11b0 <conin+0x10>)
    11a6:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    11a8:	4798      	blx	r3
    11aa:	4603      	mov	r3, r0
}
    11ac:	4618      	mov	r0, r3
    11ae:	bd80      	pop	{r7, pc}
    11b0:	200000f4 	.word	0x200000f4

000011b4 <print>:

// imprime un chaîne sur la console
void print(const char *str){
    11b4:	b580      	push	{r7, lr}
    11b6:	b082      	sub	sp, #8
    11b8:	af00      	add	r7, sp, #0
    11ba:	6078      	str	r0, [r7, #4]
	while (*str) {con.putc(*str++);}
    11bc:	e007      	b.n	11ce <print+0x1a>
    11be:	4b07      	ldr	r3, [pc, #28]	; (11dc <print+0x28>)
    11c0:	6b5a      	ldr	r2, [r3, #52]	; 0x34
    11c2:	687b      	ldr	r3, [r7, #4]
    11c4:	1c59      	adds	r1, r3, #1
    11c6:	6079      	str	r1, [r7, #4]
    11c8:	781b      	ldrb	r3, [r3, #0]
    11ca:	4618      	mov	r0, r3
    11cc:	4790      	blx	r2
    11ce:	687b      	ldr	r3, [r7, #4]
    11d0:	781b      	ldrb	r3, [r3, #0]
    11d2:	2b00      	cmp	r3, #0
    11d4:	d1f3      	bne.n	11be <print+0xa>
}
    11d6:	3708      	adds	r7, #8
    11d8:	46bd      	mov	sp, r7
    11da:	bd80      	pop	{r7, pc}
    11dc:	200000f4 	.word	0x200000f4

000011e0 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    11e0:	b580      	push	{r7, lr}
    11e2:	af00      	add	r7, sp, #0
	con.delete_back();
    11e4:	4b01      	ldr	r3, [pc, #4]	; (11ec <delete_back+0xc>)
    11e6:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    11e8:	4798      	blx	r3
}
    11ea:	bd80      	pop	{r7, pc}
    11ec:	200000f4 	.word	0x200000f4

000011f0 <beep>:

static void beep(){
    11f0:	b480      	push	{r7}
    11f2:	af00      	add	r7, sp, #0
}
    11f4:	46bd      	mov	sp, r7
    11f6:	f85d 7b04 	ldr.w	r7, [sp], #4
    11fa:	4770      	bx	lr

000011fc <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    11fc:	b580      	push	{r7, lr}
    11fe:	b084      	sub	sp, #16
    1200:	af00      	add	r7, sp, #0
    1202:	6078      	str	r0, [r7, #4]
    1204:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    1206:	2300      	movs	r3, #0
    1208:	60fb      	str	r3, [r7, #12]
	char c=0;
    120a:	2300      	movs	r3, #0
    120c:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    120e:	683b      	ldr	r3, [r7, #0]
    1210:	3b01      	subs	r3, #1
    1212:	603b      	str	r3, [r7, #0]
	while (c!=13){
    1214:	e098      	b.n	1348 <read_line+0x14c>
			c=con.getc();
    1216:	4b53      	ldr	r3, [pc, #332]	; (1364 <read_line+0x168>)
    1218:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    121a:	4798      	blx	r3
    121c:	4603      	mov	r3, r0
    121e:	72fb      	strb	r3, [r7, #11]
			switch(c){
    1220:	7afb      	ldrb	r3, [r7, #11]
    1222:	2b18      	cmp	r3, #24
    1224:	d87a      	bhi.n	131c <read_line+0x120>
    1226:	a201      	add	r2, pc, #4	; (adr r2, 122c <read_line+0x30>)
    1228:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    122c:	00001349 	.word	0x00001349
    1230:	0000131d 	.word	0x0000131d
    1234:	0000131d 	.word	0x0000131d
    1238:	0000131d 	.word	0x0000131d
    123c:	0000131d 	.word	0x0000131d
    1240:	0000130d 	.word	0x0000130d
    1244:	0000131d 	.word	0x0000131d
    1248:	0000131d 	.word	0x0000131d
    124c:	000012f9 	.word	0x000012f9
    1250:	00001319 	.word	0x00001319
    1254:	00001291 	.word	0x00001291
    1258:	0000131d 	.word	0x0000131d
    125c:	0000131d 	.word	0x0000131d
    1260:	00001291 	.word	0x00001291
    1264:	0000131d 	.word	0x0000131d
    1268:	0000131d 	.word	0x0000131d
    126c:	0000131d 	.word	0x0000131d
    1270:	0000131d 	.word	0x0000131d
    1274:	0000131d 	.word	0x0000131d
    1278:	0000131d 	.word	0x0000131d
    127c:	0000131d 	.word	0x0000131d
    1280:	000012ad 	.word	0x000012ad
    1284:	0000131d 	.word	0x0000131d
    1288:	000012c1 	.word	0x000012c1
    128c:	000012ad 	.word	0x000012ad
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    1290:	230d      	movs	r3, #13
    1292:	72fb      	strb	r3, [r7, #11]
				con.putc(c);
    1294:	4b33      	ldr	r3, [pc, #204]	; (1364 <read_line+0x168>)
    1296:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1298:	7afa      	ldrb	r2, [r7, #11]
    129a:	4610      	mov	r0, r2
    129c:	4798      	blx	r3
				break;
    129e:	e053      	b.n	1348 <read_line+0x14c>
				case CTRL_X:
				case CTRL_U:
				while (line_len){con.delete_back();line_len--;}
    12a0:	4b30      	ldr	r3, [pc, #192]	; (1364 <read_line+0x168>)
    12a2:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    12a4:	4798      	blx	r3
    12a6:	68fb      	ldr	r3, [r7, #12]
    12a8:	3b01      	subs	r3, #1
    12aa:	60fb      	str	r3, [r7, #12]
    12ac:	68fb      	ldr	r3, [r7, #12]
    12ae:	2b00      	cmp	r3, #0
    12b0:	d1f6      	bne.n	12a0 <read_line+0xa4>
				//con.clear_line(line_len);
				//line_len=0;
				break;
    12b2:	e049      	b.n	1348 <read_line+0x14c>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
    12b4:	4b2b      	ldr	r3, [pc, #172]	; (1364 <read_line+0x168>)
    12b6:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    12b8:	4798      	blx	r3
					line_len--;
    12ba:	68fb      	ldr	r3, [r7, #12]
    12bc:	3b01      	subs	r3, #1
    12be:	60fb      	str	r3, [r7, #12]
				while (line_len){con.delete_back();line_len--;}
				//con.clear_line(line_len);
				//line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    12c0:	68fb      	ldr	r3, [r7, #12]
    12c2:	2b00      	cmp	r3, #0
    12c4:	d006      	beq.n	12d4 <read_line+0xd8>
    12c6:	68fb      	ldr	r3, [r7, #12]
    12c8:	3b01      	subs	r3, #1
    12ca:	687a      	ldr	r2, [r7, #4]
    12cc:	4413      	add	r3, r2
    12ce:	781b      	ldrb	r3, [r3, #0]
    12d0:	2b20      	cmp	r3, #32
    12d2:	d0ef      	beq.n	12b4 <read_line+0xb8>
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    12d4:	e005      	b.n	12e2 <read_line+0xe6>
					con.delete_back();
    12d6:	4b23      	ldr	r3, [pc, #140]	; (1364 <read_line+0x168>)
    12d8:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    12da:	4798      	blx	r3
					line_len--;
    12dc:	68fb      	ldr	r3, [r7, #12]
    12de:	3b01      	subs	r3, #1
    12e0:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					con.delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    12e2:	68fb      	ldr	r3, [r7, #12]
    12e4:	2b00      	cmp	r3, #0
    12e6:	d006      	beq.n	12f6 <read_line+0xfa>
    12e8:	68fb      	ldr	r3, [r7, #12]
    12ea:	3b01      	subs	r3, #1
    12ec:	687a      	ldr	r2, [r7, #4]
    12ee:	4413      	add	r3, r2
    12f0:	781b      	ldrb	r3, [r3, #0]
    12f2:	2b20      	cmp	r3, #32
    12f4:	d1ef      	bne.n	12d6 <read_line+0xda>
					con.delete_back();
					line_len--;
				}
				break;
    12f6:	e027      	b.n	1348 <read_line+0x14c>
				case BS:
				if (line_len){
    12f8:	68fb      	ldr	r3, [r7, #12]
    12fa:	2b00      	cmp	r3, #0
    12fc:	d005      	beq.n	130a <read_line+0x10e>
					con.delete_back();
    12fe:	4b19      	ldr	r3, [pc, #100]	; (1364 <read_line+0x168>)
    1300:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1302:	4798      	blx	r3
					line_len--;
    1304:	68fb      	ldr	r3, [r7, #12]
    1306:	3b01      	subs	r3, #1
    1308:	60fb      	str	r3, [r7, #12]
				}
				break;
    130a:	e01d      	b.n	1348 <read_line+0x14c>
				case CTRL_E:
				con.cls();
    130c:	4b15      	ldr	r3, [pc, #84]	; (1364 <read_line+0x168>)
    130e:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    1310:	4798      	blx	r3
				line_len=0;
    1312:	2300      	movs	r3, #0
    1314:	60fb      	str	r3, [r7, #12]
				break;
    1316:	e017      	b.n	1348 <read_line+0x14c>
				case TAB:
				c=SPACE;
    1318:	2320      	movs	r3, #32
    131a:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    131c:	68fa      	ldr	r2, [r7, #12]
    131e:	683b      	ldr	r3, [r7, #0]
    1320:	429a      	cmp	r2, r3
    1322:	d20f      	bcs.n	1344 <read_line+0x148>
    1324:	7afb      	ldrb	r3, [r7, #11]
    1326:	2b1f      	cmp	r3, #31
    1328:	d90c      	bls.n	1344 <read_line+0x148>
					buffer[line_len++]=c;
    132a:	68fb      	ldr	r3, [r7, #12]
    132c:	1c5a      	adds	r2, r3, #1
    132e:	60fa      	str	r2, [r7, #12]
    1330:	687a      	ldr	r2, [r7, #4]
    1332:	4413      	add	r3, r2
    1334:	7afa      	ldrb	r2, [r7, #11]
    1336:	701a      	strb	r2, [r3, #0]
					con.putc(c);
    1338:	4b0a      	ldr	r3, [pc, #40]	; (1364 <read_line+0x168>)
    133a:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    133c:	7afa      	ldrb	r2, [r7, #11]
    133e:	4610      	mov	r0, r2
    1340:	4798      	blx	r3
    1342:	e001      	b.n	1348 <read_line+0x14c>
				}else{
					beep();
    1344:	f7ff ff54 	bl	11f0 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    1348:	7afb      	ldrb	r3, [r7, #11]
    134a:	2b0d      	cmp	r3, #13
    134c:	f47f af63 	bne.w	1216 <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1350:	687a      	ldr	r2, [r7, #4]
    1352:	68fb      	ldr	r3, [r7, #12]
    1354:	4413      	add	r3, r2
    1356:	2200      	movs	r2, #0
    1358:	701a      	strb	r2, [r3, #0]
	return line_len;
    135a:	68fb      	ldr	r3, [r7, #12]
}
    135c:	4618      	mov	r0, r3
    135e:	3710      	adds	r7, #16
    1360:	46bd      	mov	sp, r7
    1362:	bd80      	pop	{r7, pc}
    1364:	200000f4 	.word	0x200000f4

00001368 <print_int>:

// imprime un entier
// i entier à imprimer
// base  numérique
void print_int(int i, unsigned base){
    1368:	b580      	push	{r7, lr}
    136a:	b08e      	sub	sp, #56	; 0x38
    136c:	af00      	add	r7, sp, #0
    136e:	6078      	str	r0, [r7, #4]
    1370:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    1372:	2301      	movs	r3, #1
    1374:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    1376:	2322      	movs	r3, #34	; 0x22
    1378:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    137a:	2300      	movs	r3, #0
    137c:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1380:	687b      	ldr	r3, [r7, #4]
    1382:	2b00      	cmp	r3, #0
    1384:	da05      	bge.n	1392 <print_int+0x2a>
    1386:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    138a:	637b      	str	r3, [r7, #52]	; 0x34
    138c:	687b      	ldr	r3, [r7, #4]
    138e:	425b      	negs	r3, r3
    1390:	607b      	str	r3, [r7, #4]
	while (i){
    1392:	e02c      	b.n	13ee <print_int+0x86>
		fmt[pos]=i%base+'0';
    1394:	687b      	ldr	r3, [r7, #4]
    1396:	683a      	ldr	r2, [r7, #0]
    1398:	fbb3 f2f2 	udiv	r2, r3, r2
    139c:	6839      	ldr	r1, [r7, #0]
    139e:	fb01 f202 	mul.w	r2, r1, r2
    13a2:	1a9b      	subs	r3, r3, r2
    13a4:	b2db      	uxtb	r3, r3
    13a6:	3330      	adds	r3, #48	; 0x30
    13a8:	b2d9      	uxtb	r1, r3
    13aa:	f107 020c 	add.w	r2, r7, #12
    13ae:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13b0:	4413      	add	r3, r2
    13b2:	460a      	mov	r2, r1
    13b4:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    13b6:	f107 020c 	add.w	r2, r7, #12
    13ba:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13bc:	4413      	add	r3, r2
    13be:	781b      	ldrb	r3, [r3, #0]
    13c0:	2b39      	cmp	r3, #57	; 0x39
    13c2:	d90c      	bls.n	13de <print_int+0x76>
    13c4:	f107 020c 	add.w	r2, r7, #12
    13c8:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13ca:	4413      	add	r3, r2
    13cc:	781b      	ldrb	r3, [r3, #0]
    13ce:	3307      	adds	r3, #7
    13d0:	b2d9      	uxtb	r1, r3
    13d2:	f107 020c 	add.w	r2, r7, #12
    13d6:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13d8:	4413      	add	r3, r2
    13da:	460a      	mov	r2, r1
    13dc:	701a      	strb	r2, [r3, #0]
		pos--;
    13de:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13e0:	3b01      	subs	r3, #1
    13e2:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    13e4:	687a      	ldr	r2, [r7, #4]
    13e6:	683b      	ldr	r3, [r7, #0]
    13e8:	fbb2 f3f3 	udiv	r3, r2, r3
    13ec:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    13ee:	687b      	ldr	r3, [r7, #4]
    13f0:	2b00      	cmp	r3, #0
    13f2:	d1cf      	bne.n	1394 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    13f4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13f6:	2b22      	cmp	r3, #34	; 0x22
    13f8:	d108      	bne.n	140c <print_int+0xa4>
    13fa:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    13fc:	1e5a      	subs	r2, r3, #1
    13fe:	633a      	str	r2, [r7, #48]	; 0x30
    1400:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1404:	4413      	add	r3, r2
    1406:	2230      	movs	r2, #48	; 0x30
    1408:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    140c:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    140e:	2b00      	cmp	r3, #0
    1410:	da08      	bge.n	1424 <print_int+0xbc>
    1412:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1414:	1e5a      	subs	r2, r3, #1
    1416:	633a      	str	r2, [r7, #48]	; 0x30
    1418:	f107 0238 	add.w	r2, r7, #56	; 0x38
    141c:	4413      	add	r3, r2
    141e:	222d      	movs	r2, #45	; 0x2d
    1420:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    1424:	f107 020c 	add.w	r2, r7, #12
    1428:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    142a:	4413      	add	r3, r2
    142c:	2220      	movs	r2, #32
    142e:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1430:	f107 020c 	add.w	r2, r7, #12
    1434:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1436:	4413      	add	r3, r2
    1438:	4618      	mov	r0, r3
    143a:	f7ff febb 	bl	11b4 <print>
}
    143e:	3738      	adds	r7, #56	; 0x38
    1440:	46bd      	mov	sp, r7
    1442:	bd80      	pop	{r7, pc}

00001444 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    1444:	b580      	push	{r7, lr}
    1446:	b088      	sub	sp, #32
    1448:	af00      	add	r7, sp, #0
    144a:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    144c:	230c      	movs	r3, #12
    144e:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    1450:	2300      	movs	r3, #0
    1452:	767b      	strb	r3, [r7, #25]
	while (u){
    1454:	e026      	b.n	14a4 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    1456:	687b      	ldr	r3, [r7, #4]
    1458:	b2db      	uxtb	r3, r3
    145a:	f003 030f 	and.w	r3, r3, #15
    145e:	b2db      	uxtb	r3, r3
    1460:	3330      	adds	r3, #48	; 0x30
    1462:	b2d9      	uxtb	r1, r3
    1464:	f107 020c 	add.w	r2, r7, #12
    1468:	69fb      	ldr	r3, [r7, #28]
    146a:	4413      	add	r3, r2
    146c:	460a      	mov	r2, r1
    146e:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1470:	f107 020c 	add.w	r2, r7, #12
    1474:	69fb      	ldr	r3, [r7, #28]
    1476:	4413      	add	r3, r2
    1478:	781b      	ldrb	r3, [r3, #0]
    147a:	2b39      	cmp	r3, #57	; 0x39
    147c:	d90c      	bls.n	1498 <print_hex+0x54>
    147e:	f107 020c 	add.w	r2, r7, #12
    1482:	69fb      	ldr	r3, [r7, #28]
    1484:	4413      	add	r3, r2
    1486:	781b      	ldrb	r3, [r3, #0]
    1488:	3307      	adds	r3, #7
    148a:	b2d9      	uxtb	r1, r3
    148c:	f107 020c 	add.w	r2, r7, #12
    1490:	69fb      	ldr	r3, [r7, #28]
    1492:	4413      	add	r3, r2
    1494:	460a      	mov	r2, r1
    1496:	701a      	strb	r2, [r3, #0]
		pos--;
    1498:	69fb      	ldr	r3, [r7, #28]
    149a:	3b01      	subs	r3, #1
    149c:	61fb      	str	r3, [r7, #28]
		u/=16;
    149e:	687b      	ldr	r3, [r7, #4]
    14a0:	091b      	lsrs	r3, r3, #4
    14a2:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    14a4:	687b      	ldr	r3, [r7, #4]
    14a6:	2b00      	cmp	r3, #0
    14a8:	d1d5      	bne.n	1456 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    14aa:	69fb      	ldr	r3, [r7, #28]
    14ac:	2b0c      	cmp	r3, #12
    14ae:	d108      	bne.n	14c2 <print_hex+0x7e>
    14b0:	69fb      	ldr	r3, [r7, #28]
    14b2:	1e5a      	subs	r2, r3, #1
    14b4:	61fa      	str	r2, [r7, #28]
    14b6:	f107 0220 	add.w	r2, r7, #32
    14ba:	4413      	add	r3, r2
    14bc:	2230      	movs	r2, #48	; 0x30
    14be:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    14c2:	69fb      	ldr	r3, [r7, #28]
    14c4:	1e5a      	subs	r2, r3, #1
    14c6:	61fa      	str	r2, [r7, #28]
    14c8:	f107 0220 	add.w	r2, r7, #32
    14cc:	4413      	add	r3, r2
    14ce:	2278      	movs	r2, #120	; 0x78
    14d0:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    14d4:	69fb      	ldr	r3, [r7, #28]
    14d6:	1e5a      	subs	r2, r3, #1
    14d8:	61fa      	str	r2, [r7, #28]
    14da:	f107 0220 	add.w	r2, r7, #32
    14de:	4413      	add	r3, r2
    14e0:	2230      	movs	r2, #48	; 0x30
    14e2:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    14e6:	f107 020c 	add.w	r2, r7, #12
    14ea:	69fb      	ldr	r3, [r7, #28]
    14ec:	4413      	add	r3, r2
    14ee:	2220      	movs	r2, #32
    14f0:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    14f2:	f107 020c 	add.w	r2, r7, #12
    14f6:	69fb      	ldr	r3, [r7, #28]
    14f8:	4413      	add	r3, r2
    14fa:	4618      	mov	r0, r3
    14fc:	f7ff fe5a 	bl	11b4 <print>
}
    1500:	3720      	adds	r7, #32
    1502:	46bd      	mov	sp, r7
    1504:	bd80      	pop	{r7, pc}
    1506:	bf00      	nop

00001508 <cls>:

void cls(){
    1508:	b580      	push	{r7, lr}
    150a:	af00      	add	r7, sp, #0
	con.cls();
    150c:	4b01      	ldr	r3, [pc, #4]	; (1514 <cls+0xc>)
    150e:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    1510:	4798      	blx	r3
}
    1512:	bd80      	pop	{r7, pc}
    1514:	200000f4 	.word	0x200000f4

00001518 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    1518:	b480      	push	{r7}
    151a:	af00      	add	r7, sp, #0
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
    151c:	4b13      	ldr	r3, [pc, #76]	; (156c <flash_enable+0x54>)
    151e:	681b      	ldr	r3, [r3, #0]
    1520:	f003 0301 	and.w	r3, r3, #1
    1524:	2b00      	cmp	r3, #0
    1526:	d10c      	bne.n	1542 <flash_enable+0x2a>
		RCC->CR|=RCC_CR_HSION;
    1528:	4a10      	ldr	r2, [pc, #64]	; (156c <flash_enable+0x54>)
    152a:	4b10      	ldr	r3, [pc, #64]	; (156c <flash_enable+0x54>)
    152c:	681b      	ldr	r3, [r3, #0]
    152e:	f043 0301 	orr.w	r3, r3, #1
    1532:	6013      	str	r3, [r2, #0]
		while (!(RCC->CR&RCC_CR_HSIRDY));
    1534:	bf00      	nop
    1536:	4b0d      	ldr	r3, [pc, #52]	; (156c <flash_enable+0x54>)
    1538:	681b      	ldr	r3, [r3, #0]
    153a:	f003 0302 	and.w	r3, r3, #2
    153e:	2b00      	cmp	r3, #0
    1540:	d0f9      	beq.n	1536 <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    1542:	4b0b      	ldr	r3, [pc, #44]	; (1570 <flash_enable+0x58>)
    1544:	4a0b      	ldr	r2, [pc, #44]	; (1574 <flash_enable+0x5c>)
    1546:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    1548:	4b09      	ldr	r3, [pc, #36]	; (1570 <flash_enable+0x58>)
    154a:	4a0b      	ldr	r2, [pc, #44]	; (1578 <flash_enable+0x60>)
    154c:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    154e:	4b08      	ldr	r3, [pc, #32]	; (1570 <flash_enable+0x58>)
    1550:	691b      	ldr	r3, [r3, #16]
    1552:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1556:	2b00      	cmp	r3, #0
    1558:	bf0c      	ite	eq
    155a:	2301      	moveq	r3, #1
    155c:	2300      	movne	r3, #0
    155e:	b2db      	uxtb	r3, r3
}
    1560:	4618      	mov	r0, r3
    1562:	46bd      	mov	sp, r7
    1564:	f85d 7b04 	ldr.w	r7, [sp], #4
    1568:	4770      	bx	lr
    156a:	bf00      	nop
    156c:	40021000 	.word	0x40021000
    1570:	40022000 	.word	0x40022000
    1574:	45670123 	.word	0x45670123
    1578:	cdef89ab 	.word	0xcdef89ab

0000157c <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    157c:	b480      	push	{r7}
    157e:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    1580:	4a04      	ldr	r2, [pc, #16]	; (1594 <flash_disable+0x18>)
    1582:	4b04      	ldr	r3, [pc, #16]	; (1594 <flash_disable+0x18>)
    1584:	691b      	ldr	r3, [r3, #16]
    1586:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    158a:	6113      	str	r3, [r2, #16]
}
    158c:	46bd      	mov	sp, r7
    158e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1592:	4770      	bx	lr
    1594:	40022000 	.word	0x40022000

00001598 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1598:	b480      	push	{r7}
    159a:	b083      	sub	sp, #12
    159c:	af00      	add	r7, sp, #0
    159e:	6078      	str	r0, [r7, #4]
    15a0:	460b      	mov	r3, r1
    15a2:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    15a4:	4b1d      	ldr	r3, [pc, #116]	; (161c <flash_write+0x84>)
    15a6:	691b      	ldr	r3, [r3, #16]
    15a8:	f003 0380 	and.w	r3, r3, #128	; 0x80
    15ac:	2b00      	cmp	r3, #0
    15ae:	d105      	bne.n	15bc <flash_write+0x24>
    15b0:	687b      	ldr	r3, [r7, #4]
    15b2:	881b      	ldrh	r3, [r3, #0]
    15b4:	f64f 72ff 	movw	r2, #65535	; 0xffff
    15b8:	4293      	cmp	r3, r2
    15ba:	d001      	beq.n	15c0 <flash_write+0x28>
    15bc:	2300      	movs	r3, #0
    15be:	e027      	b.n	1610 <flash_write+0x78>
	while (_flash_busy);
    15c0:	bf00      	nop
    15c2:	4b16      	ldr	r3, [pc, #88]	; (161c <flash_write+0x84>)
    15c4:	68db      	ldr	r3, [r3, #12]
    15c6:	f003 0301 	and.w	r3, r3, #1
    15ca:	2b00      	cmp	r3, #0
    15cc:	d1f9      	bne.n	15c2 <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    15ce:	4a13      	ldr	r2, [pc, #76]	; (161c <flash_write+0x84>)
    15d0:	4b12      	ldr	r3, [pc, #72]	; (161c <flash_write+0x84>)
    15d2:	68db      	ldr	r3, [r3, #12]
    15d4:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    15d8:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    15da:	4b10      	ldr	r3, [pc, #64]	; (161c <flash_write+0x84>)
    15dc:	2201      	movs	r2, #1
    15de:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    15e0:	687b      	ldr	r3, [r7, #4]
    15e2:	887a      	ldrh	r2, [r7, #2]
    15e4:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    15e6:	bf00      	nop
    15e8:	4b0c      	ldr	r3, [pc, #48]	; (161c <flash_write+0x84>)
    15ea:	68db      	ldr	r3, [r3, #12]
    15ec:	f003 0301 	and.w	r3, r3, #1
    15f0:	2b00      	cmp	r3, #0
    15f2:	d005      	beq.n	1600 <flash_write+0x68>
    15f4:	4b09      	ldr	r3, [pc, #36]	; (161c <flash_write+0x84>)
    15f6:	68db      	ldr	r3, [r3, #12]
    15f8:	f003 0320 	and.w	r3, r3, #32
    15fc:	2b00      	cmp	r3, #0
    15fe:	d0f3      	beq.n	15e8 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    1600:	687b      	ldr	r3, [r7, #4]
    1602:	881b      	ldrh	r3, [r3, #0]
    1604:	887a      	ldrh	r2, [r7, #2]
    1606:	429a      	cmp	r2, r3
    1608:	bf0c      	ite	eq
    160a:	2301      	moveq	r3, #1
    160c:	2300      	movne	r3, #0
    160e:	b2db      	uxtb	r3, r3
}
    1610:	4618      	mov	r0, r3
    1612:	370c      	adds	r7, #12
    1614:	46bd      	mov	sp, r7
    1616:	f85d 7b04 	ldr.w	r7, [sp], #4
    161a:	4770      	bx	lr
    161c:	40022000 	.word	0x40022000

00001620 <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    1620:	b480      	push	{r7}
    1622:	b087      	sub	sp, #28
    1624:	af00      	add	r7, sp, #0
    1626:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    1628:	4b27      	ldr	r3, [pc, #156]	; (16c8 <flash_erase_page+0xa8>)
    162a:	691b      	ldr	r3, [r3, #16]
    162c:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1630:	2b00      	cmp	r3, #0
    1632:	d001      	beq.n	1638 <flash_erase_page+0x18>
    1634:	2300      	movs	r3, #0
    1636:	e040      	b.n	16ba <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1638:	4a23      	ldr	r2, [pc, #140]	; (16c8 <flash_erase_page+0xa8>)
    163a:	4b23      	ldr	r3, [pc, #140]	; (16c8 <flash_erase_page+0xa8>)
    163c:	68db      	ldr	r3, [r3, #12]
    163e:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1642:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    1644:	687b      	ldr	r3, [r7, #4]
    1646:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    164a:	f023 0303 	bic.w	r3, r3, #3
    164e:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    1650:	4b1d      	ldr	r3, [pc, #116]	; (16c8 <flash_erase_page+0xa8>)
    1652:	2202      	movs	r2, #2
    1654:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    1656:	4a1c      	ldr	r2, [pc, #112]	; (16c8 <flash_erase_page+0xa8>)
    1658:	687b      	ldr	r3, [r7, #4]
    165a:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    165c:	4a1a      	ldr	r2, [pc, #104]	; (16c8 <flash_erase_page+0xa8>)
    165e:	4b1a      	ldr	r3, [pc, #104]	; (16c8 <flash_erase_page+0xa8>)
    1660:	691b      	ldr	r3, [r3, #16]
    1662:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1666:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    1668:	bf00      	nop
    166a:	4b17      	ldr	r3, [pc, #92]	; (16c8 <flash_erase_page+0xa8>)
    166c:	68db      	ldr	r3, [r3, #12]
    166e:	f003 0301 	and.w	r3, r3, #1
    1672:	2b00      	cmp	r3, #0
    1674:	d005      	beq.n	1682 <flash_erase_page+0x62>
    1676:	4b14      	ldr	r3, [pc, #80]	; (16c8 <flash_erase_page+0xa8>)
    1678:	68db      	ldr	r3, [r3, #12]
    167a:	f003 0320 	and.w	r3, r3, #32
    167e:	2b00      	cmp	r3, #0
    1680:	d0f3      	beq.n	166a <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    1682:	687b      	ldr	r3, [r7, #4]
    1684:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    1686:	2300      	movs	r3, #0
    1688:	60fb      	str	r3, [r7, #12]
    168a:	e00c      	b.n	16a6 <flash_erase_page+0x86>
		u32=*adr++;
    168c:	697b      	ldr	r3, [r7, #20]
    168e:	1d1a      	adds	r2, r3, #4
    1690:	617a      	str	r2, [r7, #20]
    1692:	681b      	ldr	r3, [r3, #0]
    1694:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    1696:	693b      	ldr	r3, [r7, #16]
    1698:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    169c:	d000      	beq.n	16a0 <flash_erase_page+0x80>
    169e:	e005      	b.n	16ac <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    16a0:	68fb      	ldr	r3, [r7, #12]
    16a2:	3301      	adds	r3, #1
    16a4:	60fb      	str	r3, [r7, #12]
    16a6:	68fb      	ldr	r3, [r7, #12]
    16a8:	2bff      	cmp	r3, #255	; 0xff
    16aa:	ddef      	ble.n	168c <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    16ac:	693b      	ldr	r3, [r7, #16]
    16ae:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    16b2:	bf0c      	ite	eq
    16b4:	2301      	moveq	r3, #1
    16b6:	2300      	movne	r3, #0
    16b8:	b2db      	uxtb	r3, r3
}
    16ba:	4618      	mov	r0, r3
    16bc:	371c      	adds	r7, #28
    16be:	46bd      	mov	sp, r7
    16c0:	f85d 7b04 	ldr.w	r7, [sp], #4
    16c4:	4770      	bx	lr
    16c6:	bf00      	nop
    16c8:	40022000 	.word	0x40022000

000016cc <hide_cursor>:
// position  du curseur texte.
static int cursor_x, cursor_y;
static int cursor_visible=0;
static int cursor_blink=0;

static void hide_cursor(){
    16cc:	b580      	push	{r7, lr}
    16ce:	b082      	sub	sp, #8
    16d0:	af02      	add	r7, sp, #8
	if (cursor_visible){
    16d2:	4b0c      	ldr	r3, [pc, #48]	; (1704 <hide_cursor+0x38>)
    16d4:	681b      	ldr	r3, [r3, #0]
    16d6:	2b00      	cmp	r3, #0
    16d8:	d011      	beq.n	16fe <hide_cursor+0x32>
		disable_interrupt(IRQ_CURSOR_BLINK);
    16da:	201e      	movs	r0, #30
    16dc:	f000 fe7c 	bl	23d8 <disable_interrupt>
		gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    16e0:	4b09      	ldr	r3, [pc, #36]	; (1708 <hide_cursor+0x3c>)
    16e2:	6819      	ldr	r1, [r3, #0]
    16e4:	4b09      	ldr	r3, [pc, #36]	; (170c <hide_cursor+0x40>)
    16e6:	681a      	ldr	r2, [r3, #0]
    16e8:	2300      	movs	r3, #0
    16ea:	9300      	str	r3, [sp, #0]
    16ec:	4608      	mov	r0, r1
    16ee:	4611      	mov	r1, r2
    16f0:	2206      	movs	r2, #6
    16f2:	2308      	movs	r3, #8
    16f4:	f000 f91c 	bl	1930 <gdi_box>
		cursor_visible=0;
    16f8:	4b02      	ldr	r3, [pc, #8]	; (1704 <hide_cursor+0x38>)
    16fa:	2200      	movs	r2, #0
    16fc:	601a      	str	r2, [r3, #0]
	}
}
    16fe:	46bd      	mov	sp, r7
    1700:	bd80      	pop	{r7, pc}
    1702:	bf00      	nop
    1704:	200000b4 	.word	0x200000b4
    1708:	200000ac 	.word	0x200000ac
    170c:	200000b0 	.word	0x200000b0

00001710 <gdi_clear_screen>:

void gdi_clear_screen(){
    1710:	b580      	push	{r7, lr}
    1712:	b082      	sub	sp, #8
    1714:	af00      	add	r7, sp, #0
	int i;
	hide_cursor();
    1716:	f7ff ffd9 	bl	16cc <hide_cursor>
	for (i=0;i<(ROW_SIZE*VRES);){
    171a:	2300      	movs	r3, #0
    171c:	607b      	str	r3, [r7, #4]
    171e:	e00c      	b.n	173a <gdi_clear_screen+0x2a>
		video_buffer[i++]=0;
    1720:	687b      	ldr	r3, [r7, #4]
    1722:	1c5a      	adds	r2, r3, #1
    1724:	607a      	str	r2, [r7, #4]
    1726:	4a0c      	ldr	r2, [pc, #48]	; (1758 <gdi_clear_screen+0x48>)
    1728:	2100      	movs	r1, #0
    172a:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		cursor_x=0;
    172e:	4b0b      	ldr	r3, [pc, #44]	; (175c <gdi_clear_screen+0x4c>)
    1730:	2200      	movs	r2, #0
    1732:	601a      	str	r2, [r3, #0]
		cursor_y=0;
    1734:	4b0a      	ldr	r3, [pc, #40]	; (1760 <gdi_clear_screen+0x50>)
    1736:	2200      	movs	r2, #0
    1738:	601a      	str	r2, [r3, #0]
}

void gdi_clear_screen(){
	int i;
	hide_cursor();
	for (i=0;i<(ROW_SIZE*VRES);){
    173a:	687b      	ldr	r3, [r7, #4]
    173c:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1740:	dbee      	blt.n	1720 <gdi_clear_screen+0x10>
		video_buffer[i++]=0;
		cursor_x=0;
		cursor_y=0;
	}
	if (cursor_blink){
    1742:	4b08      	ldr	r3, [pc, #32]	; (1764 <gdi_clear_screen+0x54>)
    1744:	681b      	ldr	r3, [r3, #0]
    1746:	2b00      	cmp	r3, #0
    1748:	d002      	beq.n	1750 <gdi_clear_screen+0x40>
		enable_interrupt(IRQ_CURSOR_BLINK);
    174a:	201e      	movs	r0, #30
    174c:	f000 fe20 	bl	2390 <enable_interrupt>
	}
}
    1750:	3708      	adds	r7, #8
    1752:	46bd      	mov	sp, r7
    1754:	bd80      	pop	{r7, pc}
    1756:	bf00      	nop
    1758:	20000138 	.word	0x20000138
    175c:	200000ac 	.word	0x200000ac
    1760:	200000b0 	.word	0x200000b0
    1764:	200000b8 	.word	0x200000b8

00001768 <gdi_scroll_up>:

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
    1768:	b580      	push	{r7, lr}
    176a:	b082      	sub	sp, #8
    176c:	af00      	add	r7, sp, #0
	int i,j=0;
    176e:	2300      	movs	r3, #0
    1770:	603b      	str	r3, [r7, #0]
	hide_cursor();
    1772:	f7ff ffab 	bl	16cc <hide_cursor>
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    1776:	23a0      	movs	r3, #160	; 0xa0
    1778:	607b      	str	r3, [r7, #4]
    177a:	e00b      	b.n	1794 <gdi_scroll_up+0x2c>
		video_buffer[j++]=video_buffer[i++];
    177c:	683b      	ldr	r3, [r7, #0]
    177e:	1c5a      	adds	r2, r3, #1
    1780:	603a      	str	r2, [r7, #0]
    1782:	687a      	ldr	r2, [r7, #4]
    1784:	1c51      	adds	r1, r2, #1
    1786:	6079      	str	r1, [r7, #4]
    1788:	4911      	ldr	r1, [pc, #68]	; (17d0 <gdi_scroll_up+0x68>)
    178a:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    178e:	4a10      	ldr	r2, [pc, #64]	; (17d0 <gdi_scroll_up+0x68>)
    1790:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut d'une ligne texte.
void gdi_scroll_up(){
	int i,j=0;
	hide_cursor();
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
    1794:	687b      	ldr	r3, [r7, #4]
    1796:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    179a:	dbef      	blt.n	177c <gdi_scroll_up+0x14>
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    179c:	f44f 5391 	mov.w	r3, #4640	; 0x1220
    17a0:	607b      	str	r3, [r7, #4]
    17a2:	e006      	b.n	17b2 <gdi_scroll_up+0x4a>
		video_buffer[i++]=0;
    17a4:	687b      	ldr	r3, [r7, #4]
    17a6:	1c5a      	adds	r2, r3, #1
    17a8:	607a      	str	r2, [r7, #4]
    17aa:	4a09      	ldr	r2, [pc, #36]	; (17d0 <gdi_scroll_up+0x68>)
    17ac:	2100      	movs	r1, #0
    17ae:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i,j=0;
	hide_cursor();
	for (i=CHAR_HEIGHT*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	for (i=ROW_SIZE*VRES-CHAR_HEIGHT*ROW_SIZE;i<(ROW_SIZE*VRES);){
    17b2:	687b      	ldr	r3, [r7, #4]
    17b4:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    17b8:	dbf4      	blt.n	17a4 <gdi_scroll_up+0x3c>
		video_buffer[i++]=0;
	}
	if (cursor_blink){
    17ba:	4b06      	ldr	r3, [pc, #24]	; (17d4 <gdi_scroll_up+0x6c>)
    17bc:	681b      	ldr	r3, [r3, #0]
    17be:	2b00      	cmp	r3, #0
    17c0:	d002      	beq.n	17c8 <gdi_scroll_up+0x60>
		enable_interrupt(IRQ_CURSOR_BLINK);
    17c2:	201e      	movs	r0, #30
    17c4:	f000 fde4 	bl	2390 <enable_interrupt>
	}
}
    17c8:	3708      	adds	r7, #8
    17ca:	46bd      	mov	sp, r7
    17cc:	bd80      	pop	{r7, pc}
    17ce:	bf00      	nop
    17d0:	20000138 	.word	0x20000138
    17d4:	200000b8 	.word	0x200000b8

000017d8 <gdi_new_line>:

// avance le curseur texte au début 
// de la ligne suivante.
void gdi_new_line(){
    17d8:	b580      	push	{r7, lr}
    17da:	af00      	add	r7, sp, #0
	hide_cursor();
    17dc:	f7ff ff76 	bl	16cc <hide_cursor>
	
	cursor_x=0;
    17e0:	4b0c      	ldr	r3, [pc, #48]	; (1814 <gdi_new_line+0x3c>)
    17e2:	2200      	movs	r2, #0
    17e4:	601a      	str	r2, [r3, #0]
	cursor_y+=CHAR_HEIGHT;
    17e6:	4b0c      	ldr	r3, [pc, #48]	; (1818 <gdi_new_line+0x40>)
    17e8:	681b      	ldr	r3, [r3, #0]
    17ea:	3308      	adds	r3, #8
    17ec:	4a0a      	ldr	r2, [pc, #40]	; (1818 <gdi_new_line+0x40>)
    17ee:	6013      	str	r3, [r2, #0]
	if (cursor_y>(VRES-CHAR_HEIGHT)){
    17f0:	4b09      	ldr	r3, [pc, #36]	; (1818 <gdi_new_line+0x40>)
    17f2:	681b      	ldr	r3, [r3, #0]
    17f4:	2be8      	cmp	r3, #232	; 0xe8
    17f6:	dd04      	ble.n	1802 <gdi_new_line+0x2a>
		cursor_y=VRES-CHAR_HEIGHT;
    17f8:	4b07      	ldr	r3, [pc, #28]	; (1818 <gdi_new_line+0x40>)
    17fa:	22e8      	movs	r2, #232	; 0xe8
    17fc:	601a      	str	r2, [r3, #0]
		gdi_scroll_up();
    17fe:	f7ff ffb3 	bl	1768 <gdi_scroll_up>
	}
	if (cursor_blink){
    1802:	4b06      	ldr	r3, [pc, #24]	; (181c <gdi_new_line+0x44>)
    1804:	681b      	ldr	r3, [r3, #0]
    1806:	2b00      	cmp	r3, #0
    1808:	d002      	beq.n	1810 <gdi_new_line+0x38>
		enable_interrupt(IRQ_CURSOR_BLINK);
    180a:	201e      	movs	r0, #30
    180c:	f000 fdc0 	bl	2390 <enable_interrupt>
	}
}
    1810:	bd80      	pop	{r7, pc}
    1812:	bf00      	nop
    1814:	200000ac 	.word	0x200000ac
    1818:	200000b0 	.word	0x200000b0
    181c:	200000b8 	.word	0x200000b8

00001820 <gdi_cursor_left>:

void gdi_cursor_left(){
    1820:	b580      	push	{r7, lr}
    1822:	af00      	add	r7, sp, #0
	hide_cursor();
    1824:	f7ff ff52 	bl	16cc <hide_cursor>
	if (!(cursor_x|cursor_y)) return;
    1828:	4b16      	ldr	r3, [pc, #88]	; (1884 <gdi_cursor_left+0x64>)
    182a:	681a      	ldr	r2, [r3, #0]
    182c:	4b16      	ldr	r3, [pc, #88]	; (1888 <gdi_cursor_left+0x68>)
    182e:	681b      	ldr	r3, [r3, #0]
    1830:	4313      	orrs	r3, r2
    1832:	2b00      	cmp	r3, #0
    1834:	d100      	bne.n	1838 <gdi_cursor_left+0x18>
    1836:	e024      	b.n	1882 <gdi_cursor_left+0x62>
	if (cursor_x>=CHAR_WIDTH){
    1838:	4b12      	ldr	r3, [pc, #72]	; (1884 <gdi_cursor_left+0x64>)
    183a:	681b      	ldr	r3, [r3, #0]
    183c:	2b05      	cmp	r3, #5
    183e:	dd05      	ble.n	184c <gdi_cursor_left+0x2c>
		cursor_x-=CHAR_WIDTH;
    1840:	4b10      	ldr	r3, [pc, #64]	; (1884 <gdi_cursor_left+0x64>)
    1842:	681b      	ldr	r3, [r3, #0]
    1844:	3b06      	subs	r3, #6
    1846:	4a0f      	ldr	r2, [pc, #60]	; (1884 <gdi_cursor_left+0x64>)
    1848:	6013      	str	r3, [r2, #0]
    184a:	e013      	b.n	1874 <gdi_cursor_left+0x54>
	}else if (cursor_y) {
    184c:	4b0e      	ldr	r3, [pc, #56]	; (1888 <gdi_cursor_left+0x68>)
    184e:	681b      	ldr	r3, [r3, #0]
    1850:	2b00      	cmp	r3, #0
    1852:	d00f      	beq.n	1874 <gdi_cursor_left+0x54>
		cursor_x=CHAR_WIDTH*(CHARS_PER_LINE-1);
    1854:	4b0b      	ldr	r3, [pc, #44]	; (1884 <gdi_cursor_left+0x64>)
    1856:	f44f 729c 	mov.w	r2, #312	; 0x138
    185a:	601a      	str	r2, [r3, #0]
		cursor_y-=CHAR_HEIGHT;
    185c:	4b0a      	ldr	r3, [pc, #40]	; (1888 <gdi_cursor_left+0x68>)
    185e:	681b      	ldr	r3, [r3, #0]
    1860:	3b08      	subs	r3, #8
    1862:	4a09      	ldr	r2, [pc, #36]	; (1888 <gdi_cursor_left+0x68>)
    1864:	6013      	str	r3, [r2, #0]
		if (cursor_y<0) cursor_y=0;
    1866:	4b08      	ldr	r3, [pc, #32]	; (1888 <gdi_cursor_left+0x68>)
    1868:	681b      	ldr	r3, [r3, #0]
    186a:	2b00      	cmp	r3, #0
    186c:	da02      	bge.n	1874 <gdi_cursor_left+0x54>
    186e:	4b06      	ldr	r3, [pc, #24]	; (1888 <gdi_cursor_left+0x68>)
    1870:	2200      	movs	r2, #0
    1872:	601a      	str	r2, [r3, #0]
	}
	if (cursor_blink){
    1874:	4b05      	ldr	r3, [pc, #20]	; (188c <gdi_cursor_left+0x6c>)
    1876:	681b      	ldr	r3, [r3, #0]
    1878:	2b00      	cmp	r3, #0
    187a:	d002      	beq.n	1882 <gdi_cursor_left+0x62>
		enable_interrupt(IRQ_CURSOR_BLINK);
    187c:	201e      	movs	r0, #30
    187e:	f000 fd87 	bl	2390 <enable_interrupt>
	}
}
    1882:	bd80      	pop	{r7, pc}
    1884:	200000ac 	.word	0x200000ac
    1888:	200000b0 	.word	0x200000b0
    188c:	200000b8 	.word	0x200000b8

00001890 <gdi_bit_op>:


void gdi_bit_op(int x, int y, bitop_e op){
    1890:	b480      	push	{r7}
    1892:	b087      	sub	sp, #28
    1894:	af00      	add	r7, sp, #0
    1896:	60f8      	str	r0, [r7, #12]
    1898:	60b9      	str	r1, [r7, #8]
    189a:	4613      	mov	r3, r2
    189c:	71fb      	strb	r3, [r7, #7]
	uint16_t bit;
	int offset=y*ROW_SIZE+(x>>4);
    189e:	68ba      	ldr	r2, [r7, #8]
    18a0:	4613      	mov	r3, r2
    18a2:	009b      	lsls	r3, r3, #2
    18a4:	4413      	add	r3, r2
    18a6:	009b      	lsls	r3, r3, #2
    18a8:	461a      	mov	r2, r3
    18aa:	68fb      	ldr	r3, [r7, #12]
    18ac:	111b      	asrs	r3, r3, #4
    18ae:	4413      	add	r3, r2
    18b0:	617b      	str	r3, [r7, #20]
	bit=1<<(15-(x&15));
    18b2:	68fb      	ldr	r3, [r7, #12]
    18b4:	43db      	mvns	r3, r3
    18b6:	f003 030f 	and.w	r3, r3, #15
    18ba:	2201      	movs	r2, #1
    18bc:	fa02 f303 	lsl.w	r3, r2, r3
    18c0:	827b      	strh	r3, [r7, #18]
	switch (op){
    18c2:	79fb      	ldrb	r3, [r7, #7]
    18c4:	2b01      	cmp	r3, #1
    18c6:	d013      	beq.n	18f0 <gdi_bit_op+0x60>
    18c8:	2b02      	cmp	r3, #2
    18ca:	d01d      	beq.n	1908 <gdi_bit_op+0x78>
    18cc:	2b00      	cmp	r3, #0
    18ce:	d127      	bne.n	1920 <gdi_bit_op+0x90>
	case BLACK_BIT:
		video_buffer[offset]&=~bit;
    18d0:	4a16      	ldr	r2, [pc, #88]	; (192c <gdi_bit_op+0x9c>)
    18d2:	697b      	ldr	r3, [r7, #20]
    18d4:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    18d8:	b29a      	uxth	r2, r3
    18da:	8a7b      	ldrh	r3, [r7, #18]
    18dc:	43db      	mvns	r3, r3
    18de:	b29b      	uxth	r3, r3
    18e0:	4013      	ands	r3, r2
    18e2:	b29b      	uxth	r3, r3
    18e4:	b299      	uxth	r1, r3
    18e6:	4a11      	ldr	r2, [pc, #68]	; (192c <gdi_bit_op+0x9c>)
    18e8:	697b      	ldr	r3, [r7, #20]
    18ea:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    18ee:	e017      	b.n	1920 <gdi_bit_op+0x90>
	case WHITE_BIT:
		video_buffer[offset]|=bit;
    18f0:	4a0e      	ldr	r2, [pc, #56]	; (192c <gdi_bit_op+0x9c>)
    18f2:	697b      	ldr	r3, [r7, #20]
    18f4:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    18f8:	8a7b      	ldrh	r3, [r7, #18]
    18fa:	4313      	orrs	r3, r2
    18fc:	b299      	uxth	r1, r3
    18fe:	4a0b      	ldr	r2, [pc, #44]	; (192c <gdi_bit_op+0x9c>)
    1900:	697b      	ldr	r3, [r7, #20]
    1902:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1906:	e00b      	b.n	1920 <gdi_bit_op+0x90>
	case XOR_BIT:
		video_buffer[offset]^=bit;
    1908:	4a08      	ldr	r2, [pc, #32]	; (192c <gdi_bit_op+0x9c>)
    190a:	697b      	ldr	r3, [r7, #20]
    190c:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1910:	8a7b      	ldrh	r3, [r7, #18]
    1912:	4053      	eors	r3, r2
    1914:	b299      	uxth	r1, r3
    1916:	4a05      	ldr	r2, [pc, #20]	; (192c <gdi_bit_op+0x9c>)
    1918:	697b      	ldr	r3, [r7, #20]
    191a:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    191e:	bf00      	nop
	}
}
    1920:	371c      	adds	r7, #28
    1922:	46bd      	mov	sp, r7
    1924:	f85d 7b04 	ldr.w	r7, [sp], #4
    1928:	4770      	bx	lr
    192a:	bf00      	nop
    192c:	20000138 	.word	0x20000138

00001930 <gdi_box>:

void gdi_box(int x, int y, int w, int h, bitop_e op){
    1930:	b580      	push	{r7, lr}
    1932:	b086      	sub	sp, #24
    1934:	af00      	add	r7, sp, #0
    1936:	60f8      	str	r0, [r7, #12]
    1938:	60b9      	str	r1, [r7, #8]
    193a:	607a      	str	r2, [r7, #4]
    193c:	603b      	str	r3, [r7, #0]
	int r,c;
	
	for (r=0;r<h;r++){
    193e:	2300      	movs	r3, #0
    1940:	617b      	str	r3, [r7, #20]
    1942:	e02e      	b.n	19a2 <gdi_box+0x72>
		for (c=0;c<w;c++){
    1944:	2300      	movs	r3, #0
    1946:	613b      	str	r3, [r7, #16]
    1948:	e024      	b.n	1994 <gdi_box+0x64>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    194a:	68fa      	ldr	r2, [r7, #12]
    194c:	693b      	ldr	r3, [r7, #16]
    194e:	4413      	add	r3, r2
    1950:	2b00      	cmp	r3, #0
    1952:	db1c      	blt.n	198e <gdi_box+0x5e>
    1954:	68fa      	ldr	r2, [r7, #12]
    1956:	693b      	ldr	r3, [r7, #16]
    1958:	4413      	add	r3, r2
    195a:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    195e:	da16      	bge.n	198e <gdi_box+0x5e>
    1960:	697a      	ldr	r2, [r7, #20]
    1962:	68bb      	ldr	r3, [r7, #8]
    1964:	4413      	add	r3, r2
    1966:	2b00      	cmp	r3, #0
    1968:	db11      	blt.n	198e <gdi_box+0x5e>
    196a:	697a      	ldr	r2, [r7, #20]
    196c:	68bb      	ldr	r3, [r7, #8]
    196e:	4413      	add	r3, r2
    1970:	2bef      	cmp	r3, #239	; 0xef
    1972:	dc0c      	bgt.n	198e <gdi_box+0x5e>
				gdi_bit_op(c+x,r+y,op);
    1974:	693a      	ldr	r2, [r7, #16]
    1976:	68fb      	ldr	r3, [r7, #12]
    1978:	18d1      	adds	r1, r2, r3
    197a:	697a      	ldr	r2, [r7, #20]
    197c:	68bb      	ldr	r3, [r7, #8]
    197e:	441a      	add	r2, r3
    1980:	f897 3020 	ldrb.w	r3, [r7, #32]
    1984:	4608      	mov	r0, r1
    1986:	4611      	mov	r1, r2
    1988:	461a      	mov	r2, r3
    198a:	f7ff ff81 	bl	1890 <gdi_bit_op>

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
		for (c=0;c<w;c++){
    198e:	693b      	ldr	r3, [r7, #16]
    1990:	3301      	adds	r3, #1
    1992:	613b      	str	r3, [r7, #16]
    1994:	693a      	ldr	r2, [r7, #16]
    1996:	687b      	ldr	r3, [r7, #4]
    1998:	429a      	cmp	r2, r3
    199a:	dbd6      	blt.n	194a <gdi_box+0x1a>
}

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
    199c:	697b      	ldr	r3, [r7, #20]
    199e:	3301      	adds	r3, #1
    19a0:	617b      	str	r3, [r7, #20]
    19a2:	697a      	ldr	r2, [r7, #20]
    19a4:	683b      	ldr	r3, [r7, #0]
    19a6:	429a      	cmp	r2, r3
    19a8:	dbcc      	blt.n	1944 <gdi_box+0x14>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				gdi_bit_op(c+x,r+y,op);
			}
		}
	}
}
    19aa:	3718      	adds	r7, #24
    19ac:	46bd      	mov	sp, r7
    19ae:	bd80      	pop	{r7, pc}

000019b0 <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
    19b0:	b480      	push	{r7}
    19b2:	b089      	sub	sp, #36	; 0x24
    19b4:	af00      	add	r7, sp, #0
    19b6:	60f8      	str	r0, [r7, #12]
    19b8:	60b9      	str	r1, [r7, #8]
    19ba:	607a      	str	r2, [r7, #4]
    19bc:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    19be:	2300      	movs	r3, #0
    19c0:	61fb      	str	r3, [r7, #28]
    19c2:	e099      	b.n	1af8 <gdi_put_sprite+0x148>
		mask=128;
    19c4:	2380      	movs	r3, #128	; 0x80
    19c6:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    19c8:	2300      	movs	r3, #0
    19ca:	61bb      	str	r3, [r7, #24]
    19cc:	e08c      	b.n	1ae8 <gdi_put_sprite+0x138>
			if (!mask){
    19ce:	7dfb      	ldrb	r3, [r7, #23]
    19d0:	2b00      	cmp	r3, #0
    19d2:	d104      	bne.n	19de <gdi_put_sprite+0x2e>
				sprite++;
    19d4:	6abb      	ldr	r3, [r7, #40]	; 0x28
    19d6:	3301      	adds	r3, #1
    19d8:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    19da:	2380      	movs	r3, #128	; 0x80
    19dc:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    19de:	68fa      	ldr	r2, [r7, #12]
    19e0:	69bb      	ldr	r3, [r7, #24]
    19e2:	4413      	add	r3, r2
    19e4:	2b00      	cmp	r3, #0
    19e6:	db79      	blt.n	1adc <gdi_put_sprite+0x12c>
    19e8:	68fa      	ldr	r2, [r7, #12]
    19ea:	69bb      	ldr	r3, [r7, #24]
    19ec:	4413      	add	r3, r2
    19ee:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    19f2:	da73      	bge.n	1adc <gdi_put_sprite+0x12c>
    19f4:	69fa      	ldr	r2, [r7, #28]
    19f6:	68bb      	ldr	r3, [r7, #8]
    19f8:	4413      	add	r3, r2
    19fa:	2b00      	cmp	r3, #0
    19fc:	db6e      	blt.n	1adc <gdi_put_sprite+0x12c>
    19fe:	69fa      	ldr	r2, [r7, #28]
    1a00:	68bb      	ldr	r3, [r7, #8]
    1a02:	4413      	add	r3, r2
    1a04:	2bef      	cmp	r3, #239	; 0xef
    1a06:	dc69      	bgt.n	1adc <gdi_put_sprite+0x12c>
				if (sprite[r]&mask){
    1a08:	69fb      	ldr	r3, [r7, #28]
    1a0a:	6aba      	ldr	r2, [r7, #40]	; 0x28
    1a0c:	4413      	add	r3, r2
    1a0e:	781a      	ldrb	r2, [r3, #0]
    1a10:	7dfb      	ldrb	r3, [r7, #23]
    1a12:	4013      	ands	r3, r2
    1a14:	b2db      	uxtb	r3, r3
    1a16:	2b00      	cmp	r3, #0
    1a18:	d02f      	beq.n	1a7a <gdi_put_sprite+0xca>
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]|=(1<<(15-((c+x)&15)));
    1a1a:	69fa      	ldr	r2, [r7, #28]
    1a1c:	68bb      	ldr	r3, [r7, #8]
    1a1e:	441a      	add	r2, r3
    1a20:	4613      	mov	r3, r2
    1a22:	009b      	lsls	r3, r3, #2
    1a24:	4413      	add	r3, r2
    1a26:	009b      	lsls	r3, r3, #2
    1a28:	4619      	mov	r1, r3
    1a2a:	69ba      	ldr	r2, [r7, #24]
    1a2c:	68fb      	ldr	r3, [r7, #12]
    1a2e:	4413      	add	r3, r2
    1a30:	111b      	asrs	r3, r3, #4
    1a32:	4419      	add	r1, r3
    1a34:	69fa      	ldr	r2, [r7, #28]
    1a36:	68bb      	ldr	r3, [r7, #8]
    1a38:	441a      	add	r2, r3
    1a3a:	4613      	mov	r3, r2
    1a3c:	009b      	lsls	r3, r3, #2
    1a3e:	4413      	add	r3, r2
    1a40:	009b      	lsls	r3, r3, #2
    1a42:	4618      	mov	r0, r3
    1a44:	69ba      	ldr	r2, [r7, #24]
    1a46:	68fb      	ldr	r3, [r7, #12]
    1a48:	4413      	add	r3, r2
    1a4a:	111b      	asrs	r3, r3, #4
    1a4c:	4403      	add	r3, r0
    1a4e:	4a2f      	ldr	r2, [pc, #188]	; (1b0c <gdi_put_sprite+0x15c>)
    1a50:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1a54:	b298      	uxth	r0, r3
    1a56:	69ba      	ldr	r2, [r7, #24]
    1a58:	68fb      	ldr	r3, [r7, #12]
    1a5a:	4413      	add	r3, r2
    1a5c:	43db      	mvns	r3, r3
    1a5e:	f003 030f 	and.w	r3, r3, #15
    1a62:	2201      	movs	r2, #1
    1a64:	fa02 f303 	lsl.w	r3, r2, r3
    1a68:	b29b      	uxth	r3, r3
    1a6a:	4602      	mov	r2, r0
    1a6c:	4313      	orrs	r3, r2
    1a6e:	b29b      	uxth	r3, r3
    1a70:	b29a      	uxth	r2, r3
    1a72:	4b26      	ldr	r3, [pc, #152]	; (1b0c <gdi_put_sprite+0x15c>)
    1a74:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
    1a78:	e030      	b.n	1adc <gdi_put_sprite+0x12c>
				}else{
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]&=~(1<<(15-((c+x)&15)));
    1a7a:	69fa      	ldr	r2, [r7, #28]
    1a7c:	68bb      	ldr	r3, [r7, #8]
    1a7e:	441a      	add	r2, r3
    1a80:	4613      	mov	r3, r2
    1a82:	009b      	lsls	r3, r3, #2
    1a84:	4413      	add	r3, r2
    1a86:	009b      	lsls	r3, r3, #2
    1a88:	4619      	mov	r1, r3
    1a8a:	69ba      	ldr	r2, [r7, #24]
    1a8c:	68fb      	ldr	r3, [r7, #12]
    1a8e:	4413      	add	r3, r2
    1a90:	111b      	asrs	r3, r3, #4
    1a92:	4419      	add	r1, r3
    1a94:	69fa      	ldr	r2, [r7, #28]
    1a96:	68bb      	ldr	r3, [r7, #8]
    1a98:	441a      	add	r2, r3
    1a9a:	4613      	mov	r3, r2
    1a9c:	009b      	lsls	r3, r3, #2
    1a9e:	4413      	add	r3, r2
    1aa0:	009b      	lsls	r3, r3, #2
    1aa2:	4618      	mov	r0, r3
    1aa4:	69ba      	ldr	r2, [r7, #24]
    1aa6:	68fb      	ldr	r3, [r7, #12]
    1aa8:	4413      	add	r3, r2
    1aaa:	111b      	asrs	r3, r3, #4
    1aac:	4403      	add	r3, r0
    1aae:	4a17      	ldr	r2, [pc, #92]	; (1b0c <gdi_put_sprite+0x15c>)
    1ab0:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1ab4:	b298      	uxth	r0, r3
    1ab6:	69ba      	ldr	r2, [r7, #24]
    1ab8:	68fb      	ldr	r3, [r7, #12]
    1aba:	4413      	add	r3, r2
    1abc:	43db      	mvns	r3, r3
    1abe:	f003 030f 	and.w	r3, r3, #15
    1ac2:	2201      	movs	r2, #1
    1ac4:	fa02 f303 	lsl.w	r3, r2, r3
    1ac8:	b29b      	uxth	r3, r3
    1aca:	43db      	mvns	r3, r3
    1acc:	b29b      	uxth	r3, r3
    1ace:	4602      	mov	r2, r0
    1ad0:	4013      	ands	r3, r2
    1ad2:	b29b      	uxth	r3, r3
    1ad4:	b29a      	uxth	r2, r3
    1ad6:	4b0d      	ldr	r3, [pc, #52]	; (1b0c <gdi_put_sprite+0x15c>)
    1ad8:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
				//bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
				//video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]|=bit;
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
    1adc:	7dfb      	ldrb	r3, [r7, #23]
    1ade:	085b      	lsrs	r3, r3, #1
    1ae0:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    1ae2:	69bb      	ldr	r3, [r7, #24]
    1ae4:	3301      	adds	r3, #1
    1ae6:	61bb      	str	r3, [r7, #24]
    1ae8:	69ba      	ldr	r2, [r7, #24]
    1aea:	687b      	ldr	r3, [r7, #4]
    1aec:	429a      	cmp	r2, r3
    1aee:	f6ff af6e 	blt.w	19ce <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1af2:	69fb      	ldr	r3, [r7, #28]
    1af4:	3301      	adds	r3, #1
    1af6:	61fb      	str	r3, [r7, #28]
    1af8:	69fa      	ldr	r2, [r7, #28]
    1afa:	683b      	ldr	r3, [r7, #0]
    1afc:	429a      	cmp	r2, r3
    1afe:	f6ff af61 	blt.w	19c4 <gdi_put_sprite+0x14>
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    1b02:	3724      	adds	r7, #36	; 0x24
    1b04:	46bd      	mov	sp, r7
    1b06:	f85d 7b04 	ldr.w	r7, [sp], #4
    1b0a:	4770      	bx	lr
    1b0c:	20000138 	.word	0x20000138

00001b10 <gdi_del_back>:

void gdi_del_back(){
    1b10:	b580      	push	{r7, lr}
    1b12:	b082      	sub	sp, #8
    1b14:	af02      	add	r7, sp, #8
	gdi_cursor_left();
    1b16:	f7ff fe83 	bl	1820 <gdi_cursor_left>
	hide_cursor();
    1b1a:	f7ff fdd7 	bl	16cc <hide_cursor>
	gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    1b1e:	4b0a      	ldr	r3, [pc, #40]	; (1b48 <gdi_del_back+0x38>)
    1b20:	6819      	ldr	r1, [r3, #0]
    1b22:	4b0a      	ldr	r3, [pc, #40]	; (1b4c <gdi_del_back+0x3c>)
    1b24:	681a      	ldr	r2, [r3, #0]
    1b26:	2300      	movs	r3, #0
    1b28:	9300      	str	r3, [sp, #0]
    1b2a:	4608      	mov	r0, r1
    1b2c:	4611      	mov	r1, r2
    1b2e:	2206      	movs	r2, #6
    1b30:	2308      	movs	r3, #8
    1b32:	f7ff fefd 	bl	1930 <gdi_box>
	if (cursor_blink){
    1b36:	4b06      	ldr	r3, [pc, #24]	; (1b50 <gdi_del_back+0x40>)
    1b38:	681b      	ldr	r3, [r3, #0]
    1b3a:	2b00      	cmp	r3, #0
    1b3c:	d002      	beq.n	1b44 <gdi_del_back+0x34>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1b3e:	201e      	movs	r0, #30
    1b40:	f000 fc26 	bl	2390 <enable_interrupt>
	}
}
    1b44:	46bd      	mov	sp, r7
    1b46:	bd80      	pop	{r7, pc}
    1b48:	200000ac 	.word	0x200000ac
    1b4c:	200000b0 	.word	0x200000b0
    1b50:	200000b8 	.word	0x200000b8

00001b54 <gdi_putc>:

// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void gdi_putc(char c){
    1b54:	b580      	push	{r7, lr}
    1b56:	b084      	sub	sp, #16
    1b58:	af02      	add	r7, sp, #8
    1b5a:	4603      	mov	r3, r0
    1b5c:	71fb      	strb	r3, [r7, #7]
		hide_cursor();
    1b5e:	f7ff fdb5 	bl	16cc <hide_cursor>
		switch (c){
    1b62:	79fb      	ldrb	r3, [r7, #7]
    1b64:	2b0a      	cmp	r3, #10
    1b66:	d004      	beq.n	1b72 <gdi_putc+0x1e>
    1b68:	2b0d      	cmp	r3, #13
    1b6a:	d002      	beq.n	1b72 <gdi_putc+0x1e>
    1b6c:	2b08      	cmp	r3, #8
    1b6e:	d003      	beq.n	1b78 <gdi_putc+0x24>
    1b70:	e005      	b.n	1b7e <gdi_putc+0x2a>
		case '\n':
		case CR:
			gdi_new_line();
    1b72:	f7ff fe31 	bl	17d8 <gdi_new_line>
			break;
    1b76:	e021      	b.n	1bbc <gdi_putc+0x68>
		case BS:
			gdi_del_back();
    1b78:	f7ff ffca 	bl	1b10 <gdi_del_back>
			break;
    1b7c:	e01e      	b.n	1bbc <gdi_putc+0x68>
		default:
			if (c<FONT_SIZE){
    1b7e:	79fb      	ldrb	r3, [r7, #7]
    1b80:	b25b      	sxtb	r3, r3
    1b82:	2b00      	cmp	r3, #0
    1b84:	db19      	blt.n	1bba <gdi_putc+0x66>
				gdi_put_sprite(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,(const unsigned char *)&font6x8[c]);
    1b86:	4b12      	ldr	r3, [pc, #72]	; (1bd0 <gdi_putc+0x7c>)
    1b88:	6818      	ldr	r0, [r3, #0]
    1b8a:	4b12      	ldr	r3, [pc, #72]	; (1bd4 <gdi_putc+0x80>)
    1b8c:	6819      	ldr	r1, [r3, #0]
    1b8e:	79fb      	ldrb	r3, [r7, #7]
    1b90:	00db      	lsls	r3, r3, #3
    1b92:	4a11      	ldr	r2, [pc, #68]	; (1bd8 <gdi_putc+0x84>)
    1b94:	4413      	add	r3, r2
    1b96:	9300      	str	r3, [sp, #0]
    1b98:	2206      	movs	r2, #6
    1b9a:	2308      	movs	r3, #8
    1b9c:	f7ff ff08 	bl	19b0 <gdi_put_sprite>
				cursor_x+=CHAR_WIDTH;
    1ba0:	4b0b      	ldr	r3, [pc, #44]	; (1bd0 <gdi_putc+0x7c>)
    1ba2:	681b      	ldr	r3, [r3, #0]
    1ba4:	3306      	adds	r3, #6
    1ba6:	4a0a      	ldr	r2, [pc, #40]	; (1bd0 <gdi_putc+0x7c>)
    1ba8:	6013      	str	r3, [r2, #0]
				if (cursor_x>(HRES-CHAR_WIDTH)){
    1baa:	4b09      	ldr	r3, [pc, #36]	; (1bd0 <gdi_putc+0x7c>)
    1bac:	681b      	ldr	r3, [r3, #0]
    1bae:	f5b3 7f9d 	cmp.w	r3, #314	; 0x13a
    1bb2:	dd02      	ble.n	1bba <gdi_putc+0x66>
					gdi_new_line();
    1bb4:	f7ff fe10 	bl	17d8 <gdi_new_line>
				}
			}
			break;
    1bb8:	e7ff      	b.n	1bba <gdi_putc+0x66>
    1bba:	bf00      	nop
		}//switch
		if (cursor_blink){
    1bbc:	4b07      	ldr	r3, [pc, #28]	; (1bdc <gdi_putc+0x88>)
    1bbe:	681b      	ldr	r3, [r3, #0]
    1bc0:	2b00      	cmp	r3, #0
    1bc2:	d002      	beq.n	1bca <gdi_putc+0x76>
			enable_interrupt(IRQ_CURSOR_BLINK);
    1bc4:	201e      	movs	r0, #30
    1bc6:	f000 fbe3 	bl	2390 <enable_interrupt>
		}
}
    1bca:	3708      	adds	r7, #8
    1bcc:	46bd      	mov	sp, r7
    1bce:	bd80      	pop	{r7, pc}
    1bd0:	200000ac 	.word	0x200000ac
    1bd4:	200000b0 	.word	0x200000b0
    1bd8:	00003840 	.word	0x00003840
    1bdc:	200000b8 	.word	0x200000b8

00001be0 <gdi_print>:

void gdi_print(const char *str){
    1be0:	b580      	push	{r7, lr}
    1be2:	b082      	sub	sp, #8
    1be4:	af00      	add	r7, sp, #0
    1be6:	6078      	str	r0, [r7, #4]
	while (*str) gdi_putc(*str++);
    1be8:	e006      	b.n	1bf8 <gdi_print+0x18>
    1bea:	687b      	ldr	r3, [r7, #4]
    1bec:	1c5a      	adds	r2, r3, #1
    1bee:	607a      	str	r2, [r7, #4]
    1bf0:	781b      	ldrb	r3, [r3, #0]
    1bf2:	4618      	mov	r0, r3
    1bf4:	f7ff ffae 	bl	1b54 <gdi_putc>
    1bf8:	687b      	ldr	r3, [r7, #4]
    1bfa:	781b      	ldrb	r3, [r3, #0]
    1bfc:	2b00      	cmp	r3, #0
    1bfe:	d1f4      	bne.n	1bea <gdi_print+0xa>
}
    1c00:	3708      	adds	r7, #8
    1c02:	46bd      	mov	sp, r7
    1c04:	bd80      	pop	{r7, pc}
    1c06:	bf00      	nop

00001c08 <gdi_clrln>:

void gdi_clrln(){
    1c08:	b480      	push	{r7}
    1c0a:	b083      	sub	sp, #12
    1c0c:	af00      	add	r7, sp, #0
	int i;
	cursor_x=0;
    1c0e:	4b11      	ldr	r3, [pc, #68]	; (1c54 <gdi_clrln+0x4c>)
    1c10:	2200      	movs	r2, #0
    1c12:	601a      	str	r2, [r3, #0]
	for (i=cursor_y*ROW_SIZE;i<cursor_y*ROW_SIZE*8;i++){
    1c14:	4b10      	ldr	r3, [pc, #64]	; (1c58 <gdi_clrln+0x50>)
    1c16:	681a      	ldr	r2, [r3, #0]
    1c18:	4613      	mov	r3, r2
    1c1a:	009b      	lsls	r3, r3, #2
    1c1c:	4413      	add	r3, r2
    1c1e:	009b      	lsls	r3, r3, #2
    1c20:	607b      	str	r3, [r7, #4]
    1c22:	e007      	b.n	1c34 <gdi_clrln+0x2c>
		video_buffer[i]=0;
    1c24:	4a0d      	ldr	r2, [pc, #52]	; (1c5c <gdi_clrln+0x54>)
    1c26:	687b      	ldr	r3, [r7, #4]
    1c28:	2100      	movs	r1, #0
    1c2a:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
}

void gdi_clrln(){
	int i;
	cursor_x=0;
	for (i=cursor_y*ROW_SIZE;i<cursor_y*ROW_SIZE*8;i++){
    1c2e:	687b      	ldr	r3, [r7, #4]
    1c30:	3301      	adds	r3, #1
    1c32:	607b      	str	r3, [r7, #4]
    1c34:	4b08      	ldr	r3, [pc, #32]	; (1c58 <gdi_clrln+0x50>)
    1c36:	681a      	ldr	r2, [r3, #0]
    1c38:	4613      	mov	r3, r2
    1c3a:	009b      	lsls	r3, r3, #2
    1c3c:	4413      	add	r3, r2
    1c3e:	015b      	lsls	r3, r3, #5
    1c40:	461a      	mov	r2, r3
    1c42:	687b      	ldr	r3, [r7, #4]
    1c44:	429a      	cmp	r2, r3
    1c46:	dced      	bgt.n	1c24 <gdi_clrln+0x1c>
		video_buffer[i]=0;
	}
}
    1c48:	370c      	adds	r7, #12
    1c4a:	46bd      	mov	sp, r7
    1c4c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1c50:	4770      	bx	lr
    1c52:	bf00      	nop
    1c54:	200000ac 	.word	0x200000ac
    1c58:	200000b0 	.word	0x200000b0
    1c5c:	20000138 	.word	0x20000138

00001c60 <gdi_text_cursor>:

void gdi_text_cursor(int enable){
    1c60:	b580      	push	{r7, lr}
    1c62:	b084      	sub	sp, #16
    1c64:	af02      	add	r7, sp, #8
    1c66:	6078      	str	r0, [r7, #4]
	if (enable){
    1c68:	687b      	ldr	r3, [r7, #4]
    1c6a:	2b00      	cmp	r3, #0
    1c6c:	d024      	beq.n	1cb8 <gdi_text_cursor+0x58>
		// activation clock CURSOR_TMR
		RCC->CURSOR_RCC_ENR|=CURSOR_RCC_EN_BIT; 
    1c6e:	4a24      	ldr	r2, [pc, #144]	; (1d00 <gdi_text_cursor+0xa0>)
    1c70:	4b23      	ldr	r3, [pc, #140]	; (1d00 <gdi_text_cursor+0xa0>)
    1c72:	69db      	ldr	r3, [r3, #28]
    1c74:	f043 0304 	orr.w	r3, r3, #4
    1c78:	61d3      	str	r3, [r2, #28]
		CURSOR_TMR->ARR=FTMR2_4/1000/2;
    1c7a:	4b22      	ldr	r3, [pc, #136]	; (1d04 <gdi_text_cursor+0xa4>)
    1c7c:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    1c80:	62da      	str	r2, [r3, #44]	; 0x2c
		CURSOR_TMR->PSC=1000;
    1c82:	4b20      	ldr	r3, [pc, #128]	; (1d04 <gdi_text_cursor+0xa4>)
    1c84:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    1c88:	629a      	str	r2, [r3, #40]	; 0x28
		CURSOR_TMR->CR1=BIT0|BIT7; // ARPE
    1c8a:	4b1e      	ldr	r3, [pc, #120]	; (1d04 <gdi_text_cursor+0xa4>)
    1c8c:	2281      	movs	r2, #129	; 0x81
    1c8e:	601a      	str	r2, [r3, #0]
		CURSOR_TMR->DIER=BIT0; // UIE
    1c90:	4b1c      	ldr	r3, [pc, #112]	; (1d04 <gdi_text_cursor+0xa4>)
    1c92:	2201      	movs	r2, #1
    1c94:	60da      	str	r2, [r3, #12]
		set_int_priority(IRQ_CURSOR_BLINK,15);
    1c96:	201e      	movs	r0, #30
    1c98:	210f      	movs	r1, #15
    1c9a:	f000 fc35 	bl	2508 <set_int_priority>
		CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
    1c9e:	4a19      	ldr	r2, [pc, #100]	; (1d04 <gdi_text_cursor+0xa4>)
    1ca0:	4b18      	ldr	r3, [pc, #96]	; (1d04 <gdi_text_cursor+0xa4>)
    1ca2:	691b      	ldr	r3, [r3, #16]
    1ca4:	f023 0301 	bic.w	r3, r3, #1
    1ca8:	6113      	str	r3, [r2, #16]
		enable_interrupt(IRQ_CURSOR_BLINK);
    1caa:	201e      	movs	r0, #30
    1cac:	f000 fb70 	bl	2390 <enable_interrupt>
		cursor_blink=1;
    1cb0:	4b15      	ldr	r3, [pc, #84]	; (1d08 <gdi_text_cursor+0xa8>)
    1cb2:	2201      	movs	r2, #1
    1cb4:	601a      	str	r2, [r3, #0]
    1cb6:	e020      	b.n	1cfa <gdi_text_cursor+0x9a>
	}else{
		disable_interrupt(IRQ_CURSOR_BLINK);
    1cb8:	201e      	movs	r0, #30
    1cba:	f000 fb8d 	bl	23d8 <disable_interrupt>
		if (cursor_visible){
    1cbe:	4b13      	ldr	r3, [pc, #76]	; (1d0c <gdi_text_cursor+0xac>)
    1cc0:	681b      	ldr	r3, [r3, #0]
    1cc2:	2b00      	cmp	r3, #0
    1cc4:	d010      	beq.n	1ce8 <gdi_text_cursor+0x88>
			gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    1cc6:	4b12      	ldr	r3, [pc, #72]	; (1d10 <gdi_text_cursor+0xb0>)
    1cc8:	6819      	ldr	r1, [r3, #0]
    1cca:	4b12      	ldr	r3, [pc, #72]	; (1d14 <gdi_text_cursor+0xb4>)
    1ccc:	681a      	ldr	r2, [r3, #0]
    1cce:	2302      	movs	r3, #2
    1cd0:	9300      	str	r3, [sp, #0]
    1cd2:	4608      	mov	r0, r1
    1cd4:	4611      	mov	r1, r2
    1cd6:	2206      	movs	r2, #6
    1cd8:	2308      	movs	r3, #8
    1cda:	f7ff fe29 	bl	1930 <gdi_box>
			cursor_visible=~cursor_visible;
    1cde:	4b0b      	ldr	r3, [pc, #44]	; (1d0c <gdi_text_cursor+0xac>)
    1ce0:	681b      	ldr	r3, [r3, #0]
    1ce2:	43db      	mvns	r3, r3
    1ce4:	4a09      	ldr	r2, [pc, #36]	; (1d0c <gdi_text_cursor+0xac>)
    1ce6:	6013      	str	r3, [r2, #0]
		}
		CURSOR_TMR->DIER&=~BIT0;
    1ce8:	4a06      	ldr	r2, [pc, #24]	; (1d04 <gdi_text_cursor+0xa4>)
    1cea:	4b06      	ldr	r3, [pc, #24]	; (1d04 <gdi_text_cursor+0xa4>)
    1cec:	68db      	ldr	r3, [r3, #12]
    1cee:	f023 0301 	bic.w	r3, r3, #1
    1cf2:	60d3      	str	r3, [r2, #12]
		cursor_blink=0;
    1cf4:	4b04      	ldr	r3, [pc, #16]	; (1d08 <gdi_text_cursor+0xa8>)
    1cf6:	2200      	movs	r2, #0
    1cf8:	601a      	str	r2, [r3, #0]
	}
}
    1cfa:	3708      	adds	r7, #8
    1cfc:	46bd      	mov	sp, r7
    1cfe:	bd80      	pop	{r7, pc}
    1d00:	40021000 	.word	0x40021000
    1d04:	40000800 	.word	0x40000800
    1d08:	200000b8 	.word	0x200000b8
    1d0c:	200000b4 	.word	0x200000b4
    1d10:	200000ac 	.word	0x200000ac
    1d14:	200000b0 	.word	0x200000b0

00001d18 <TIM4_handler>:

// interruption clignotement
// curseur texte
void CURSOR_blink_handler(){
    1d18:	b580      	push	{r7, lr}
    1d1a:	b082      	sub	sp, #8
    1d1c:	af02      	add	r7, sp, #8
	//CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
	if (CURSOR_TMR->SR&BIT0){ // UIF
    1d1e:	4b0f      	ldr	r3, [pc, #60]	; (1d5c <TIM4_handler+0x44>)
    1d20:	691b      	ldr	r3, [r3, #16]
    1d22:	f003 0301 	and.w	r3, r3, #1
    1d26:	2b00      	cmp	r3, #0
    1d28:	d016      	beq.n	1d58 <TIM4_handler+0x40>
		CURSOR_TMR->SR&=~BIT0;
    1d2a:	4a0c      	ldr	r2, [pc, #48]	; (1d5c <TIM4_handler+0x44>)
    1d2c:	4b0b      	ldr	r3, [pc, #44]	; (1d5c <TIM4_handler+0x44>)
    1d2e:	691b      	ldr	r3, [r3, #16]
    1d30:	f023 0301 	bic.w	r3, r3, #1
    1d34:	6113      	str	r3, [r2, #16]
		gdi_box(cursor_x,cursor_y,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    1d36:	4b0a      	ldr	r3, [pc, #40]	; (1d60 <TIM4_handler+0x48>)
    1d38:	6819      	ldr	r1, [r3, #0]
    1d3a:	4b0a      	ldr	r3, [pc, #40]	; (1d64 <TIM4_handler+0x4c>)
    1d3c:	681a      	ldr	r2, [r3, #0]
    1d3e:	2302      	movs	r3, #2
    1d40:	9300      	str	r3, [sp, #0]
    1d42:	4608      	mov	r0, r1
    1d44:	4611      	mov	r1, r2
    1d46:	2206      	movs	r2, #6
    1d48:	2308      	movs	r3, #8
    1d4a:	f7ff fdf1 	bl	1930 <gdi_box>
		cursor_visible=~cursor_visible;
    1d4e:	4b06      	ldr	r3, [pc, #24]	; (1d68 <TIM4_handler+0x50>)
    1d50:	681b      	ldr	r3, [r3, #0]
    1d52:	43db      	mvns	r3, r3
    1d54:	4a04      	ldr	r2, [pc, #16]	; (1d68 <TIM4_handler+0x50>)
    1d56:	6013      	str	r3, [r2, #0]
	}
}
    1d58:	46bd      	mov	sp, r7
    1d5a:	bd80      	pop	{r7, pc}
    1d5c:	40000800 	.word	0x40000800
    1d60:	200000ac 	.word	0x200000ac
    1d64:	200000b0 	.word	0x200000b0
    1d68:	200000b4 	.word	0x200000b4

00001d6c <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(gpio_t* port, unsigned pin, unsigned config){
    1d6c:	b480      	push	{r7}
    1d6e:	b087      	sub	sp, #28
    1d70:	af00      	add	r7, sp, #0
    1d72:	60f8      	str	r0, [r7, #12]
    1d74:	60b9      	str	r1, [r7, #8]
    1d76:	607a      	str	r2, [r7, #4]
	uint8_t shift;
	shift=(pin&7)<<2;
    1d78:	68bb      	ldr	r3, [r7, #8]
    1d7a:	b2db      	uxtb	r3, r3
    1d7c:	f003 0307 	and.w	r3, r3, #7
    1d80:	b2db      	uxtb	r3, r3
    1d82:	009b      	lsls	r3, r3, #2
    1d84:	75fb      	strb	r3, [r7, #23]
	port->CR[pin>>3]&=~(15<<shift);
    1d86:	68bb      	ldr	r3, [r7, #8]
    1d88:	08da      	lsrs	r2, r3, #3
    1d8a:	68bb      	ldr	r3, [r7, #8]
    1d8c:	08d9      	lsrs	r1, r3, #3
    1d8e:	68fb      	ldr	r3, [r7, #12]
    1d90:	f853 3021 	ldr.w	r3, [r3, r1, lsl #2]
    1d94:	7df9      	ldrb	r1, [r7, #23]
    1d96:	200f      	movs	r0, #15
    1d98:	fa00 f101 	lsl.w	r1, r0, r1
    1d9c:	43c9      	mvns	r1, r1
    1d9e:	4019      	ands	r1, r3
    1da0:	68fb      	ldr	r3, [r7, #12]
    1da2:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
	port->CR[pin>>3]|=config<<shift;
    1da6:	68bb      	ldr	r3, [r7, #8]
    1da8:	08da      	lsrs	r2, r3, #3
    1daa:	68bb      	ldr	r3, [r7, #8]
    1dac:	08d9      	lsrs	r1, r3, #3
    1dae:	68fb      	ldr	r3, [r7, #12]
    1db0:	f853 1021 	ldr.w	r1, [r3, r1, lsl #2]
    1db4:	7dfb      	ldrb	r3, [r7, #23]
    1db6:	6878      	ldr	r0, [r7, #4]
    1db8:	fa00 f303 	lsl.w	r3, r0, r3
    1dbc:	4319      	orrs	r1, r3
    1dbe:	68fb      	ldr	r3, [r7, #12]
    1dc0:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
}
    1dc4:	371c      	adds	r7, #28
    1dc6:	46bd      	mov	sp, r7
    1dc8:	f85d 7b04 	ldr.w	r7, [sp], #4
    1dcc:	4770      	bx	lr
    1dce:	bf00      	nop

00001dd0 <read_pin>:

int read_pin(gpio_t* port, unsigned pin){
    1dd0:	b480      	push	{r7}
    1dd2:	b083      	sub	sp, #12
    1dd4:	af00      	add	r7, sp, #0
    1dd6:	6078      	str	r0, [r7, #4]
    1dd8:	6039      	str	r1, [r7, #0]
	return port->IDR&(1<<pin);
    1dda:	687b      	ldr	r3, [r7, #4]
    1ddc:	689b      	ldr	r3, [r3, #8]
    1dde:	683a      	ldr	r2, [r7, #0]
    1de0:	2101      	movs	r1, #1
    1de2:	fa01 f202 	lsl.w	r2, r1, r2
    1de6:	4013      	ands	r3, r2
}
    1de8:	4618      	mov	r0, r3
    1dea:	370c      	adds	r7, #12
    1dec:	46bd      	mov	sp, r7
    1dee:	f85d 7b04 	ldr.w	r7, [sp], #4
    1df2:	4770      	bx	lr

00001df4 <write_pin>:

void write_pin(gpio_t* port, unsigned pin, int value){
    1df4:	b480      	push	{r7}
    1df6:	b085      	sub	sp, #20
    1df8:	af00      	add	r7, sp, #0
    1dfa:	60f8      	str	r0, [r7, #12]
    1dfc:	60b9      	str	r1, [r7, #8]
    1dfe:	607a      	str	r2, [r7, #4]
	value?(port->ODR|=(1<<pin)):(port->ODR&=~(1<<pin));
    1e00:	687b      	ldr	r3, [r7, #4]
    1e02:	2b00      	cmp	r3, #0
    1e04:	d009      	beq.n	1e1a <write_pin+0x26>
    1e06:	68fb      	ldr	r3, [r7, #12]
    1e08:	68db      	ldr	r3, [r3, #12]
    1e0a:	68ba      	ldr	r2, [r7, #8]
    1e0c:	2101      	movs	r1, #1
    1e0e:	fa01 f202 	lsl.w	r2, r1, r2
    1e12:	431a      	orrs	r2, r3
    1e14:	68fb      	ldr	r3, [r7, #12]
    1e16:	60da      	str	r2, [r3, #12]
    1e18:	e009      	b.n	1e2e <write_pin+0x3a>
    1e1a:	68fb      	ldr	r3, [r7, #12]
    1e1c:	68db      	ldr	r3, [r3, #12]
    1e1e:	68ba      	ldr	r2, [r7, #8]
    1e20:	2101      	movs	r1, #1
    1e22:	fa01 f202 	lsl.w	r2, r1, r2
    1e26:	43d2      	mvns	r2, r2
    1e28:	401a      	ands	r2, r3
    1e2a:	68fb      	ldr	r3, [r7, #12]
    1e2c:	60da      	str	r2, [r3, #12]
}
    1e2e:	3714      	adds	r7, #20
    1e30:	46bd      	mov	sp, r7
    1e32:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e36:	4770      	bx	lr

00001e38 <toggle_pin>:

void toggle_pin(gpio_t* port, unsigned pin){
    1e38:	b480      	push	{r7}
    1e3a:	b083      	sub	sp, #12
    1e3c:	af00      	add	r7, sp, #0
    1e3e:	6078      	str	r0, [r7, #4]
    1e40:	6039      	str	r1, [r7, #0]
	port->ODR^=(1<<pin);
    1e42:	687b      	ldr	r3, [r7, #4]
    1e44:	68db      	ldr	r3, [r3, #12]
    1e46:	683a      	ldr	r2, [r7, #0]
    1e48:	2101      	movs	r1, #1
    1e4a:	fa01 f202 	lsl.w	r2, r1, r2
    1e4e:	405a      	eors	r2, r3
    1e50:	687b      	ldr	r3, [r7, #4]
    1e52:	60da      	str	r2, [r3, #12]
}
    1e54:	370c      	adds	r7, #12
    1e56:	46bd      	mov	sp, r7
    1e58:	f85d 7b04 	ldr.w	r7, [sp], #4
    1e5c:	4770      	bx	lr
    1e5e:	bf00      	nop

00001e60 <keyboard_init>:
    ps2_flags = 0;
    return KbdSend(KBD_RESET);
}//KbdReset()
*/
 
void keyboard_init(){
    1e60:	b580      	push	{r7, lr}
    1e62:	af00      	add	r7, sp, #0
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
    1e64:	4a1f      	ldr	r2, [pc, #124]	; (1ee4 <keyboard_init+0x84>)
    1e66:	4b1f      	ldr	r3, [pc, #124]	; (1ee4 <keyboard_init+0x84>)
    1e68:	699b      	ldr	r3, [r3, #24]
    1e6a:	f043 0305 	orr.w	r3, r3, #5
    1e6e:	6193      	str	r3, [r2, #24]
	// activation clock TMR2
	RCC->APB1ENR|=RCC_APB1ENR_TIM2EN; 
    1e70:	4a1c      	ldr	r2, [pc, #112]	; (1ee4 <keyboard_init+0x84>)
    1e72:	4b1c      	ldr	r3, [pc, #112]	; (1ee4 <keyboard_init+0x84>)
    1e74:	69db      	ldr	r3, [r3, #28]
    1e76:	f043 0301 	orr.w	r3, r3, #1
    1e7a:	61d3      	str	r3, [r2, #28]
	TMR2->ARR=FTMR2_4/20*.01;
    1e7c:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e80:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    1e84:	62da      	str	r2, [r3, #44]	; 0x2c
	TMR2->PSC=20;
    1e86:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e8a:	2214      	movs	r2, #20
    1e8c:	629a      	str	r2, [r3, #40]	; 0x28
	TMR2->CR1=BIT0|BIT7; // ARPE
    1e8e:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e92:	2281      	movs	r2, #129	; 0x81
    1e94:	601a      	str	r2, [r3, #0]
	TMR2->DIER=BIT0; // UIE
    1e96:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1e9a:	2201      	movs	r2, #1
    1e9c:	60da      	str	r2, [r3, #12]
	set_int_priority(IRQ_KBD_CLK,0);
    1e9e:	2017      	movs	r0, #23
    1ea0:	2100      	movs	r1, #0
    1ea2:	f000 fb31 	bl	2508 <set_int_priority>
	set_int_priority(IRQ_TIM2,14);
    1ea6:	201c      	movs	r0, #28
    1ea8:	210e      	movs	r1, #14
    1eaa:	f000 fb2d 	bl	2508 <set_int_priority>
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
    1eae:	4a0e      	ldr	r2, [pc, #56]	; (1ee8 <keyboard_init+0x88>)
    1eb0:	4b0d      	ldr	r3, [pc, #52]	; (1ee8 <keyboard_init+0x88>)
    1eb2:	68db      	ldr	r3, [r3, #12]
    1eb4:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1eb8:	60d3      	str	r3, [r2, #12]
	EXTI->IMR|=KBD_CLK_PIN;
    1eba:	4a0b      	ldr	r2, [pc, #44]	; (1ee8 <keyboard_init+0x88>)
    1ebc:	4b0a      	ldr	r3, [pc, #40]	; (1ee8 <keyboard_init+0x88>)
    1ebe:	681b      	ldr	r3, [r3, #0]
    1ec0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1ec4:	6013      	str	r3, [r2, #0]
	enable_interrupt(IRQ_KBD_CLK);
    1ec6:	2017      	movs	r0, #23
    1ec8:	f000 fa62 	bl	2390 <enable_interrupt>
	TMR2->SR&=~BIT0;
    1ecc:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    1ed0:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    1ed4:	691b      	ldr	r3, [r3, #16]
    1ed6:	f023 0301 	bic.w	r3, r3, #1
    1eda:	6113      	str	r3, [r2, #16]
	enable_interrupt(IRQ_TIM2);
    1edc:	201c      	movs	r0, #28
    1ede:	f000 fa57 	bl	2390 <enable_interrupt>
	//pause(700);
	//if (!KbdReset()) print("keyboard reset failed\n");
}
    1ee2:	bd80      	pop	{r7, pc}
    1ee4:	40021000 	.word	0x40021000
    1ee8:	40010400 	.word	0x40010400

00001eec <search_table>:
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
    1eec:	b480      	push	{r7}
    1eee:	b083      	sub	sp, #12
    1ef0:	af00      	add	r7, sp, #0
    1ef2:	6078      	str	r0, [r7, #4]
    1ef4:	460b      	mov	r3, r1
    1ef6:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    1ef8:	e008      	b.n	1f0c <search_table+0x20>
		if (table->code==code) break;
    1efa:	687b      	ldr	r3, [r7, #4]
    1efc:	781b      	ldrb	r3, [r3, #0]
    1efe:	78fa      	ldrb	r2, [r7, #3]
    1f00:	429a      	cmp	r2, r3
    1f02:	d100      	bne.n	1f06 <search_table+0x1a>
    1f04:	e006      	b.n	1f14 <search_table+0x28>
		table++;
    1f06:	687b      	ldr	r3, [r7, #4]
    1f08:	3302      	adds	r3, #2
    1f0a:	607b      	str	r3, [r7, #4]

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
    1f0c:	687b      	ldr	r3, [r7, #4]
    1f0e:	781b      	ldrb	r3, [r3, #0]
    1f10:	2b00      	cmp	r3, #0
    1f12:	d1f2      	bne.n	1efa <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    1f14:	687b      	ldr	r3, [r7, #4]
    1f16:	785b      	ldrb	r3, [r3, #1]
}
    1f18:	4618      	mov	r0, r3
    1f1a:	370c      	adds	r7, #12
    1f1c:	46bd      	mov	sp, r7
    1f1e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1f22:	4770      	bx	lr

00001f24 <convert_code>:

static void convert_code(unsigned char code){
    1f24:	b580      	push	{r7, lr}
    1f26:	b086      	sub	sp, #24
    1f28:	af00      	add	r7, sp, #0
    1f2a:	4603      	mov	r3, r0
    1f2c:	71fb      	strb	r3, [r7, #7]
		unsigned char c,s;
		int shift;
		if (!(con.dev==LOCAL)) return;
    1f2e:	4ba1      	ldr	r3, [pc, #644]	; (21b4 <convert_code+0x290>)
    1f30:	781b      	ldrb	r3, [r3, #0]
    1f32:	2b00      	cmp	r3, #0
    1f34:	d000      	beq.n	1f38 <convert_code+0x14>
    1f36:	e139      	b.n	21ac <convert_code+0x288>
		switch (code){
    1f38:	79fb      	ldrb	r3, [r7, #7]
    1f3a:	2b59      	cmp	r3, #89	; 0x59
    1f3c:	f000 8085 	beq.w	204a <convert_code+0x126>
    1f40:	2b59      	cmp	r3, #89	; 0x59
    1f42:	dc0e      	bgt.n	1f62 <convert_code+0x3e>
    1f44:	2b12      	cmp	r3, #18
    1f46:	d038      	beq.n	1fba <convert_code+0x96>
    1f48:	2b12      	cmp	r3, #18
    1f4a:	dc03      	bgt.n	1f54 <convert_code+0x30>
    1f4c:	2b11      	cmp	r3, #17
    1f4e:	f000 80a4 	beq.w	209a <convert_code+0x176>
    1f52:	e0ca      	b.n	20ea <convert_code+0x1c6>
    1f54:	2b14      	cmp	r3, #20
    1f56:	f000 808c 	beq.w	2072 <convert_code+0x14e>
    1f5a:	2b58      	cmp	r3, #88	; 0x58
    1f5c:	f000 80b1 	beq.w	20c2 <convert_code+0x19e>
    1f60:	e0c3      	b.n	20ea <convert_code+0x1c6>
    1f62:	2be0      	cmp	r3, #224	; 0xe0
    1f64:	d010      	beq.n	1f88 <convert_code+0x64>
    1f66:	2be0      	cmp	r3, #224	; 0xe0
    1f68:	dc02      	bgt.n	1f70 <convert_code+0x4c>
    1f6a:	2b7c      	cmp	r3, #124	; 0x7c
    1f6c:	d047      	beq.n	1ffe <convert_code+0xda>
    1f6e:	e0bc      	b.n	20ea <convert_code+0x1c6>
    1f70:	2be1      	cmp	r3, #225	; 0xe1
    1f72:	d010      	beq.n	1f96 <convert_code+0x72>
    1f74:	2bf0      	cmp	r3, #240	; 0xf0
    1f76:	f040 80b8 	bne.w	20ea <convert_code+0x1c6>
		case 0xF0:
			flags |= RELEASE;
    1f7a:	4b8f      	ldr	r3, [pc, #572]	; (21b8 <convert_code+0x294>)
    1f7c:	681b      	ldr	r3, [r3, #0]
    1f7e:	f043 0302 	orr.w	r3, r3, #2
    1f82:	4a8d      	ldr	r2, [pc, #564]	; (21b8 <convert_code+0x294>)
    1f84:	6013      	str	r3, [r2, #0]
			break;
    1f86:	e111      	b.n	21ac <convert_code+0x288>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    1f88:	4b8b      	ldr	r3, [pc, #556]	; (21b8 <convert_code+0x294>)
    1f8a:	681b      	ldr	r3, [r3, #0]
    1f8c:	f043 0301 	orr.w	r3, r3, #1
    1f90:	4a89      	ldr	r2, [pc, #548]	; (21b8 <convert_code+0x294>)
    1f92:	6013      	str	r3, [r2, #0]
			break;
    1f94:	e10a      	b.n	21ac <convert_code+0x288>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    1f96:	4b88      	ldr	r3, [pc, #544]	; (21b8 <convert_code+0x294>)
    1f98:	681b      	ldr	r3, [r3, #0]
    1f9a:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    1f9e:	4a86      	ldr	r2, [pc, #536]	; (21b8 <convert_code+0x294>)
    1fa0:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    1fa2:	4b85      	ldr	r3, [pc, #532]	; (21b8 <convert_code+0x294>)
    1fa4:	681b      	ldr	r3, [r3, #0]
    1fa6:	f403 7380 	and.w	r3, r3, #256	; 0x100
    1faa:	2b00      	cmp	r3, #0
    1fac:	d104      	bne.n	1fb8 <convert_code+0x94>
				con.insert(PAUSE);
    1fae:	4b81      	ldr	r3, [pc, #516]	; (21b4 <convert_code+0x290>)
    1fb0:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    1fb2:	2094      	movs	r0, #148	; 0x94
    1fb4:	4798      	blx	r3
			}
			break;
    1fb6:	e0f9      	b.n	21ac <convert_code+0x288>
    1fb8:	e0f8      	b.n	21ac <convert_code+0x288>
		case LSHIFT:
			if (flags&RELEASE){
    1fba:	4b7f      	ldr	r3, [pc, #508]	; (21b8 <convert_code+0x294>)
    1fbc:	681b      	ldr	r3, [r3, #0]
    1fbe:	f003 0302 	and.w	r3, r3, #2
    1fc2:	2b00      	cmp	r3, #0
    1fc4:	d006      	beq.n	1fd4 <convert_code+0xb0>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    1fc6:	4b7c      	ldr	r3, [pc, #496]	; (21b8 <convert_code+0x294>)
    1fc8:	681b      	ldr	r3, [r3, #0]
    1fca:	f023 0307 	bic.w	r3, r3, #7
    1fce:	4a7a      	ldr	r2, [pc, #488]	; (21b8 <convert_code+0x294>)
    1fd0:	6013      	str	r3, [r2, #0]
    1fd2:	e013      	b.n	1ffc <convert_code+0xd8>
			}else{
				if (flags&XTD_CODE){
    1fd4:	4b78      	ldr	r3, [pc, #480]	; (21b8 <convert_code+0x294>)
    1fd6:	681b      	ldr	r3, [r3, #0]
    1fd8:	f003 0301 	and.w	r3, r3, #1
    1fdc:	2b00      	cmp	r3, #0
    1fde:	d006      	beq.n	1fee <convert_code+0xca>
					flags|=PRNSCR;
    1fe0:	4b75      	ldr	r3, [pc, #468]	; (21b8 <convert_code+0x294>)
    1fe2:	681b      	ldr	r3, [r3, #0]
    1fe4:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    1fe8:	4a73      	ldr	r2, [pc, #460]	; (21b8 <convert_code+0x294>)
    1fea:	6013      	str	r3, [r2, #0]
    1fec:	e006      	b.n	1ffc <convert_code+0xd8>
				}else{
					flags|=LEFT_SHIFT;
    1fee:	4b72      	ldr	r3, [pc, #456]	; (21b8 <convert_code+0x294>)
    1ff0:	681b      	ldr	r3, [r3, #0]
    1ff2:	f043 0304 	orr.w	r3, r3, #4
    1ff6:	4a70      	ldr	r2, [pc, #448]	; (21b8 <convert_code+0x294>)
    1ff8:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    1ffa:	e0d7      	b.n	21ac <convert_code+0x288>
    1ffc:	e0d6      	b.n	21ac <convert_code+0x288>
		case KPMUL:
			if (flags&RELEASE){
    1ffe:	4b6e      	ldr	r3, [pc, #440]	; (21b8 <convert_code+0x294>)
    2000:	681b      	ldr	r3, [r3, #0]
    2002:	f003 0302 	and.w	r3, r3, #2
    2006:	2b00      	cmp	r3, #0
    2008:	d006      	beq.n	2018 <convert_code+0xf4>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    200a:	4b6b      	ldr	r3, [pc, #428]	; (21b8 <convert_code+0x294>)
    200c:	681b      	ldr	r3, [r3, #0]
    200e:	f023 0303 	bic.w	r3, r3, #3
    2012:	4a69      	ldr	r2, [pc, #420]	; (21b8 <convert_code+0x294>)
    2014:	6013      	str	r3, [r2, #0]
    2016:	e017      	b.n	2048 <convert_code+0x124>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    2018:	4b67      	ldr	r3, [pc, #412]	; (21b8 <convert_code+0x294>)
    201a:	681b      	ldr	r3, [r3, #0]
    201c:	f003 0301 	and.w	r3, r3, #1
    2020:	2b00      	cmp	r3, #0
    2022:	d00c      	beq.n	203e <convert_code+0x11a>
					flags&=~(XTD_CODE|PRNSCR);
    2024:	4b64      	ldr	r3, [pc, #400]	; (21b8 <convert_code+0x294>)
    2026:	681b      	ldr	r3, [r3, #0]
    2028:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    202c:	f023 0301 	bic.w	r3, r3, #1
    2030:	4a61      	ldr	r2, [pc, #388]	; (21b8 <convert_code+0x294>)
    2032:	6013      	str	r3, [r2, #0]
					con.insert(PRN);
    2034:	4b5f      	ldr	r3, [pc, #380]	; (21b4 <convert_code+0x290>)
    2036:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    2038:	2092      	movs	r0, #146	; 0x92
    203a:	4798      	blx	r3
    203c:	e004      	b.n	2048 <convert_code+0x124>
				}else{
					con.insert('*');
    203e:	4b5d      	ldr	r3, [pc, #372]	; (21b4 <convert_code+0x290>)
    2040:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    2042:	202a      	movs	r0, #42	; 0x2a
    2044:	4798      	blx	r3
				}
			}
			break;
    2046:	e0b1      	b.n	21ac <convert_code+0x288>
    2048:	e0b0      	b.n	21ac <convert_code+0x288>
		case RSHIFT:
			if (flags&RELEASE){
    204a:	4b5b      	ldr	r3, [pc, #364]	; (21b8 <convert_code+0x294>)
    204c:	681b      	ldr	r3, [r3, #0]
    204e:	f003 0302 	and.w	r3, r3, #2
    2052:	2b00      	cmp	r3, #0
    2054:	d006      	beq.n	2064 <convert_code+0x140>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    2056:	4b58      	ldr	r3, [pc, #352]	; (21b8 <convert_code+0x294>)
    2058:	681b      	ldr	r3, [r3, #0]
    205a:	f023 030b 	bic.w	r3, r3, #11
    205e:	4a56      	ldr	r2, [pc, #344]	; (21b8 <convert_code+0x294>)
    2060:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    2062:	e0a3      	b.n	21ac <convert_code+0x288>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    2064:	4b54      	ldr	r3, [pc, #336]	; (21b8 <convert_code+0x294>)
    2066:	681b      	ldr	r3, [r3, #0]
    2068:	f043 0308 	orr.w	r3, r3, #8
    206c:	4a52      	ldr	r2, [pc, #328]	; (21b8 <convert_code+0x294>)
    206e:	6013      	str	r3, [r2, #0]
			}
			break;
    2070:	e09c      	b.n	21ac <convert_code+0x288>
		case LCTRL:
			if (flags&RELEASE){
    2072:	4b51      	ldr	r3, [pc, #324]	; (21b8 <convert_code+0x294>)
    2074:	681b      	ldr	r3, [r3, #0]
    2076:	f003 0302 	and.w	r3, r3, #2
    207a:	2b00      	cmp	r3, #0
    207c:	d006      	beq.n	208c <convert_code+0x168>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    207e:	4b4e      	ldr	r3, [pc, #312]	; (21b8 <convert_code+0x294>)
    2080:	681b      	ldr	r3, [r3, #0]
    2082:	f023 0313 	bic.w	r3, r3, #19
    2086:	4a4c      	ldr	r2, [pc, #304]	; (21b8 <convert_code+0x294>)
    2088:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_CTRL;
			}
			break;
    208a:	e08f      	b.n	21ac <convert_code+0x288>
			break;
		case LCTRL:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
			}else{
				flags|=LEFT_CTRL;
    208c:	4b4a      	ldr	r3, [pc, #296]	; (21b8 <convert_code+0x294>)
    208e:	681b      	ldr	r3, [r3, #0]
    2090:	f043 0310 	orr.w	r3, r3, #16
    2094:	4a48      	ldr	r2, [pc, #288]	; (21b8 <convert_code+0x294>)
    2096:	6013      	str	r3, [r2, #0]
			}
			break;
    2098:	e088      	b.n	21ac <convert_code+0x288>
		case LALT:
			if (flags&RELEASE){
    209a:	4b47      	ldr	r3, [pc, #284]	; (21b8 <convert_code+0x294>)
    209c:	681b      	ldr	r3, [r3, #0]
    209e:	f003 0302 	and.w	r3, r3, #2
    20a2:	2b00      	cmp	r3, #0
    20a4:	d006      	beq.n	20b4 <convert_code+0x190>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    20a6:	4b44      	ldr	r3, [pc, #272]	; (21b8 <convert_code+0x294>)
    20a8:	681b      	ldr	r3, [r3, #0]
    20aa:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    20ae:	4a42      	ldr	r2, [pc, #264]	; (21b8 <convert_code+0x294>)
    20b0:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    20b2:	e07b      	b.n	21ac <convert_code+0x288>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    20b4:	4b40      	ldr	r3, [pc, #256]	; (21b8 <convert_code+0x294>)
    20b6:	681b      	ldr	r3, [r3, #0]
    20b8:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    20bc:	4a3e      	ldr	r2, [pc, #248]	; (21b8 <convert_code+0x294>)
    20be:	6013      	str	r3, [r2, #0]
			}
			break;
    20c0:	e074      	b.n	21ac <convert_code+0x288>
		case CAPS_LOCK:
			if (flags&RELEASE){
    20c2:	4b3d      	ldr	r3, [pc, #244]	; (21b8 <convert_code+0x294>)
    20c4:	681b      	ldr	r3, [r3, #0]
    20c6:	f003 0302 	and.w	r3, r3, #2
    20ca:	2b00      	cmp	r3, #0
    20cc:	d006      	beq.n	20dc <convert_code+0x1b8>
				flags&=~(RELEASE|XTD_CODE);
    20ce:	4b3a      	ldr	r3, [pc, #232]	; (21b8 <convert_code+0x294>)
    20d0:	681b      	ldr	r3, [r3, #0]
    20d2:	f023 0303 	bic.w	r3, r3, #3
    20d6:	4a38      	ldr	r2, [pc, #224]	; (21b8 <convert_code+0x294>)
    20d8:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    20da:	e067      	b.n	21ac <convert_code+0x288>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    20dc:	4b36      	ldr	r3, [pc, #216]	; (21b8 <convert_code+0x294>)
    20de:	681b      	ldr	r3, [r3, #0]
    20e0:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    20e4:	4a34      	ldr	r2, [pc, #208]	; (21b8 <convert_code+0x294>)
    20e6:	6013      	str	r3, [r2, #0]
			}
			break;
    20e8:	e060      	b.n	21ac <convert_code+0x288>
		default:
			if (!(flags&RELEASE)){
    20ea:	4b33      	ldr	r3, [pc, #204]	; (21b8 <convert_code+0x294>)
    20ec:	681b      	ldr	r3, [r3, #0]
    20ee:	f003 0302 	and.w	r3, r3, #2
    20f2:	2b00      	cmp	r3, #0
    20f4:	d153      	bne.n	219e <convert_code+0x27a>
					if (flags&XTD_CODE){
    20f6:	4b30      	ldr	r3, [pc, #192]	; (21b8 <convert_code+0x294>)
    20f8:	681b      	ldr	r3, [r3, #0]
    20fa:	f003 0301 	and.w	r3, r3, #1
    20fe:	2b00      	cmp	r3, #0
    2100:	d00d      	beq.n	211e <convert_code+0x1fa>
						c=search_table(mcsaite_xkey,code);
    2102:	79fb      	ldrb	r3, [r7, #7]
    2104:	482d      	ldr	r0, [pc, #180]	; (21bc <convert_code+0x298>)
    2106:	4619      	mov	r1, r3
    2108:	f7ff fef0 	bl	1eec <search_table>
    210c:	4603      	mov	r3, r0
    210e:	75fb      	strb	r3, [r7, #23]
						flags&=~XTD_CODE;
    2110:	4b29      	ldr	r3, [pc, #164]	; (21b8 <convert_code+0x294>)
    2112:	681b      	ldr	r3, [r3, #0]
    2114:	f023 0301 	bic.w	r3, r3, #1
    2118:	4a27      	ldr	r2, [pc, #156]	; (21b8 <convert_code+0x294>)
    211a:	6013      	str	r3, [r2, #0]
    211c:	e006      	b.n	212c <convert_code+0x208>
					}else{
						c=search_table(mcsaite_key,code);
    211e:	79fb      	ldrb	r3, [r7, #7]
    2120:	4827      	ldr	r0, [pc, #156]	; (21c0 <convert_code+0x29c>)
    2122:	4619      	mov	r1, r3
    2124:	f7ff fee2 	bl	1eec <search_table>
    2128:	4603      	mov	r3, r0
    212a:	75fb      	strb	r3, [r7, #23]
					}
					shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    212c:	4b22      	ldr	r3, [pc, #136]	; (21b8 <convert_code+0x294>)
    212e:	681b      	ldr	r3, [r3, #0]
    2130:	f003 030c 	and.w	r3, r3, #12
    2134:	613b      	str	r3, [r7, #16]
					if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    2136:	7dfb      	ldrb	r3, [r7, #23]
    2138:	2b60      	cmp	r3, #96	; 0x60
    213a:	d918      	bls.n	216e <convert_code+0x24a>
    213c:	7dfb      	ldrb	r3, [r7, #23]
    213e:	2b7a      	cmp	r3, #122	; 0x7a
    2140:	d815      	bhi.n	216e <convert_code+0x24a>
    2142:	693b      	ldr	r3, [r7, #16]
    2144:	2b00      	cmp	r3, #0
    2146:	d005      	beq.n	2154 <convert_code+0x230>
    2148:	4b1b      	ldr	r3, [pc, #108]	; (21b8 <convert_code+0x294>)
    214a:	681b      	ldr	r3, [r3, #0]
    214c:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2150:	2b00      	cmp	r3, #0
    2152:	d008      	beq.n	2166 <convert_code+0x242>
    2154:	693b      	ldr	r3, [r7, #16]
    2156:	2b00      	cmp	r3, #0
    2158:	d109      	bne.n	216e <convert_code+0x24a>
    215a:	4b17      	ldr	r3, [pc, #92]	; (21b8 <convert_code+0x294>)
    215c:	681b      	ldr	r3, [r3, #0]
    215e:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2162:	2b00      	cmp	r3, #0
    2164:	d003      	beq.n	216e <convert_code+0x24a>
						c-=32;
    2166:	7dfb      	ldrb	r3, [r7, #23]
    2168:	3b20      	subs	r3, #32
    216a:	75fb      	strb	r3, [r7, #23]
    216c:	e00e      	b.n	218c <convert_code+0x268>
					}else if (shift && (s=search_table(mcsaite_shey,c))){
    216e:	693b      	ldr	r3, [r7, #16]
    2170:	2b00      	cmp	r3, #0
    2172:	d00b      	beq.n	218c <convert_code+0x268>
    2174:	7dfb      	ldrb	r3, [r7, #23]
    2176:	4813      	ldr	r0, [pc, #76]	; (21c4 <convert_code+0x2a0>)
    2178:	4619      	mov	r1, r3
    217a:	f7ff feb7 	bl	1eec <search_table>
    217e:	4603      	mov	r3, r0
    2180:	73fb      	strb	r3, [r7, #15]
    2182:	7bfb      	ldrb	r3, [r7, #15]
    2184:	2b00      	cmp	r3, #0
    2186:	d001      	beq.n	218c <convert_code+0x268>
						c=s;
    2188:	7bfb      	ldrb	r3, [r7, #15]
    218a:	75fb      	strb	r3, [r7, #23]
					}
					if (c){
    218c:	7dfb      	ldrb	r3, [r7, #23]
    218e:	2b00      	cmp	r3, #0
    2190:	d00b      	beq.n	21aa <convert_code+0x286>
						con.insert(c);
    2192:	4b08      	ldr	r3, [pc, #32]	; (21b4 <convert_code+0x290>)
    2194:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    2196:	7dfa      	ldrb	r2, [r7, #23]
    2198:	4610      	mov	r0, r2
    219a:	4798      	blx	r3
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    219c:	e006      	b.n	21ac <convert_code+0x288>
					}
					if (c){
						con.insert(c);
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    219e:	4b06      	ldr	r3, [pc, #24]	; (21b8 <convert_code+0x294>)
    21a0:	681b      	ldr	r3, [r3, #0]
    21a2:	f023 0303 	bic.w	r3, r3, #3
    21a6:	4a04      	ldr	r2, [pc, #16]	; (21b8 <convert_code+0x294>)
    21a8:	6013      	str	r3, [r2, #0]
			}
			break;
    21aa:	bf00      	nop
		}//switch
}// convert_code()
    21ac:	3718      	adds	r7, #24
    21ae:	46bd      	mov	sp, r7
    21b0:	bd80      	pop	{r7, pc}
    21b2:	bf00      	nop
    21b4:	200000f4 	.word	0x200000f4
    21b8:	200000c0 	.word	0x200000c0
    21bc:	00003cf8 	.word	0x00003cf8
    21c0:	00003c40 	.word	0x00003c40
    21c4:	00003ccc 	.word	0x00003ccc

000021c8 <EXTI9_5_handler>:
#define PS2_QUEUE_SIZE (16)
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];

// signal clock du clavier PS/2
__attribute__((optimize("-O0"))) void KBD_CLK_handler(){
    21c8:	b480      	push	{r7}
    21ca:	b083      	sub	sp, #12
    21cc:	af00      	add	r7, sp, #0
	volatile  static unsigned char  in_byte=0,bit_cnt=0;
    volatile unsigned char parity; 

#define data_bit  (KBD_PORT->IDR & KBD_DAT_PIN)
	EXTI->PR|=KBD_CLK_PIN; 
    21ce:	4a51      	ldr	r2, [pc, #324]	; (2314 <EXTI9_5_handler+0x14c>)
    21d0:	4b50      	ldr	r3, [pc, #320]	; (2314 <EXTI9_5_handler+0x14c>)
    21d2:	695b      	ldr	r3, [r3, #20]
    21d4:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    21d8:	6153      	str	r3, [r2, #20]
    switch (bit_cnt){
    21da:	4b4f      	ldr	r3, [pc, #316]	; (2318 <EXTI9_5_handler+0x150>)
    21dc:	781b      	ldrb	r3, [r3, #0]
    21de:	b2db      	uxtb	r3, r3
    21e0:	2b09      	cmp	r3, #9
    21e2:	d01f      	beq.n	2224 <EXTI9_5_handler+0x5c>
    21e4:	2b0a      	cmp	r3, #10
    21e6:	d031      	beq.n	224c <EXTI9_5_handler+0x84>
    21e8:	2b00      	cmp	r3, #0
    21ea:	d16c      	bne.n	22c6 <EXTI9_5_handler+0xfe>
	case 0:   // start bit
		ps2_flags&=~(F_ERROR|F_RCVD);
    21ec:	4b4b      	ldr	r3, [pc, #300]	; (231c <EXTI9_5_handler+0x154>)
    21ee:	781b      	ldrb	r3, [r3, #0]
    21f0:	b2db      	uxtb	r3, r3
    21f2:	f023 030b 	bic.w	r3, r3, #11
    21f6:	b2da      	uxtb	r2, r3
    21f8:	4b48      	ldr	r3, [pc, #288]	; (231c <EXTI9_5_handler+0x154>)
    21fa:	701a      	strb	r2, [r3, #0]
		if (!data_bit){
    21fc:	4b48      	ldr	r3, [pc, #288]	; (2320 <EXTI9_5_handler+0x158>)
    21fe:	689b      	ldr	r3, [r3, #8]
    2200:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2204:	2b00      	cmp	r3, #0
    2206:	d10c      	bne.n	2222 <EXTI9_5_handler+0x5a>
			in_byte=0;
    2208:	4b46      	ldr	r3, [pc, #280]	; (2324 <EXTI9_5_handler+0x15c>)
    220a:	2200      	movs	r2, #0
    220c:	701a      	strb	r2, [r3, #0]
            parity=0;
    220e:	2300      	movs	r3, #0
    2210:	71fb      	strb	r3, [r7, #7]
            bit_cnt++;
    2212:	4b41      	ldr	r3, [pc, #260]	; (2318 <EXTI9_5_handler+0x150>)
    2214:	781b      	ldrb	r3, [r3, #0]
    2216:	b2db      	uxtb	r3, r3
    2218:	3301      	adds	r3, #1
    221a:	b2da      	uxtb	r2, r3
    221c:	4b3e      	ldr	r3, [pc, #248]	; (2318 <EXTI9_5_handler+0x150>)
    221e:	701a      	strb	r2, [r3, #0]
        }
		break;
    2220:	e073      	b.n	230a <EXTI9_5_handler+0x142>
    2222:	e072      	b.n	230a <EXTI9_5_handler+0x142>
	case 9:   // paritée
		if (data_bit) parity++;
    2224:	4b3e      	ldr	r3, [pc, #248]	; (2320 <EXTI9_5_handler+0x158>)
    2226:	689b      	ldr	r3, [r3, #8]
    2228:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    222c:	2b00      	cmp	r3, #0
    222e:	d004      	beq.n	223a <EXTI9_5_handler+0x72>
    2230:	79fb      	ldrb	r3, [r7, #7]
    2232:	b2db      	uxtb	r3, r3
    2234:	3301      	adds	r3, #1
    2236:	b2db      	uxtb	r3, r3
    2238:	71fb      	strb	r3, [r7, #7]
		if (!(parity & 1)){
    223a:	79fb      	ldrb	r3, [r7, #7]
			//ps2_flags |= F_ERR_PARITY;
			
		}
		bit_cnt++;
    223c:	4b36      	ldr	r3, [pc, #216]	; (2318 <EXTI9_5_handler+0x150>)
    223e:	781b      	ldrb	r3, [r3, #0]
    2240:	b2db      	uxtb	r3, r3
    2242:	3301      	adds	r3, #1
    2244:	b2da      	uxtb	r2, r3
    2246:	4b34      	ldr	r3, [pc, #208]	; (2318 <EXTI9_5_handler+0x150>)
    2248:	701a      	strb	r2, [r3, #0]
		break;
    224a:	e05e      	b.n	230a <EXTI9_5_handler+0x142>
	case 10:  // stop bit
	    if (!data_bit){
    224c:	4b34      	ldr	r3, [pc, #208]	; (2320 <EXTI9_5_handler+0x158>)
    224e:	689b      	ldr	r3, [r3, #8]
    2250:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2254:	2b00      	cmp	r3, #0
    2256:	d108      	bne.n	226a <EXTI9_5_handler+0xa2>
			ps2_flags|=F_ERR_FRAME;
    2258:	4b30      	ldr	r3, [pc, #192]	; (231c <EXTI9_5_handler+0x154>)
    225a:	781b      	ldrb	r3, [r3, #0]
    225c:	b2db      	uxtb	r3, r3
    225e:	f043 0308 	orr.w	r3, r3, #8
    2262:	b2da      	uxtb	r2, r3
    2264:	4b2d      	ldr	r3, [pc, #180]	; (231c <EXTI9_5_handler+0x154>)
    2266:	701a      	strb	r2, [r3, #0]
    2268:	e029      	b.n	22be <EXTI9_5_handler+0xf6>
		}else if (!(ps2_flags&F_ERROR)){
    226a:	4b2c      	ldr	r3, [pc, #176]	; (231c <EXTI9_5_handler+0x154>)
    226c:	781b      	ldrb	r3, [r3, #0]
    226e:	b2db      	uxtb	r3, r3
    2270:	f003 0309 	and.w	r3, r3, #9
    2274:	2b00      	cmp	r3, #0
    2276:	d122      	bne.n	22be <EXTI9_5_handler+0xf6>
			if (in_byte==BAT_OK){
    2278:	4b2a      	ldr	r3, [pc, #168]	; (2324 <EXTI9_5_handler+0x15c>)
    227a:	781b      	ldrb	r3, [r3, #0]
    227c:	b2db      	uxtb	r3, r3
    227e:	2baa      	cmp	r3, #170	; 0xaa
    2280:	d108      	bne.n	2294 <EXTI9_5_handler+0xcc>
				ps2_flags|=F_BATOK;
    2282:	4b26      	ldr	r3, [pc, #152]	; (231c <EXTI9_5_handler+0x154>)
    2284:	781b      	ldrb	r3, [r3, #0]
    2286:	b2db      	uxtb	r3, r3
    2288:	f043 0304 	orr.w	r3, r3, #4
    228c:	b2da      	uxtb	r2, r3
    228e:	4b23      	ldr	r3, [pc, #140]	; (231c <EXTI9_5_handler+0x154>)
    2290:	701a      	strb	r2, [r3, #0]
    2292:	e014      	b.n	22be <EXTI9_5_handler+0xf6>
			}else{
				ps2_queue[ps2_tail++]=in_byte;
    2294:	4b24      	ldr	r3, [pc, #144]	; (2328 <EXTI9_5_handler+0x160>)
    2296:	781b      	ldrb	r3, [r3, #0]
    2298:	b2db      	uxtb	r3, r3
    229a:	1c5a      	adds	r2, r3, #1
    229c:	b2d1      	uxtb	r1, r2
    229e:	4a22      	ldr	r2, [pc, #136]	; (2328 <EXTI9_5_handler+0x160>)
    22a0:	7011      	strb	r1, [r2, #0]
    22a2:	461a      	mov	r2, r3
    22a4:	4b1f      	ldr	r3, [pc, #124]	; (2324 <EXTI9_5_handler+0x15c>)
    22a6:	781b      	ldrb	r3, [r3, #0]
    22a8:	b2d9      	uxtb	r1, r3
    22aa:	4b20      	ldr	r3, [pc, #128]	; (232c <EXTI9_5_handler+0x164>)
    22ac:	5499      	strb	r1, [r3, r2]
				ps2_tail&=PS2_QUEUE_SIZE-1;
    22ae:	4b1e      	ldr	r3, [pc, #120]	; (2328 <EXTI9_5_handler+0x160>)
    22b0:	781b      	ldrb	r3, [r3, #0]
    22b2:	b2db      	uxtb	r3, r3
    22b4:	f003 030f 	and.w	r3, r3, #15
    22b8:	b2da      	uxtb	r2, r3
    22ba:	4b1b      	ldr	r3, [pc, #108]	; (2328 <EXTI9_5_handler+0x160>)
    22bc:	701a      	strb	r2, [r3, #0]
			}
	    }
	    bit_cnt=0;
    22be:	4b16      	ldr	r3, [pc, #88]	; (2318 <EXTI9_5_handler+0x150>)
    22c0:	2200      	movs	r2, #0
    22c2:	701a      	strb	r2, [r3, #0]
		break;
    22c4:	e021      	b.n	230a <EXTI9_5_handler+0x142>
	default:
		in_byte >>=1;
    22c6:	4b17      	ldr	r3, [pc, #92]	; (2324 <EXTI9_5_handler+0x15c>)
    22c8:	781b      	ldrb	r3, [r3, #0]
    22ca:	b2db      	uxtb	r3, r3
    22cc:	085b      	lsrs	r3, r3, #1
    22ce:	b2da      	uxtb	r2, r3
    22d0:	4b14      	ldr	r3, [pc, #80]	; (2324 <EXTI9_5_handler+0x15c>)
    22d2:	701a      	strb	r2, [r3, #0]
		if(data_bit){
    22d4:	4b12      	ldr	r3, [pc, #72]	; (2320 <EXTI9_5_handler+0x158>)
    22d6:	689b      	ldr	r3, [r3, #8]
    22d8:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    22dc:	2b00      	cmp	r3, #0
    22de:	d00c      	beq.n	22fa <EXTI9_5_handler+0x132>
			in_byte |=128;
    22e0:	4b10      	ldr	r3, [pc, #64]	; (2324 <EXTI9_5_handler+0x15c>)
    22e2:	781b      	ldrb	r3, [r3, #0]
    22e4:	b2db      	uxtb	r3, r3
    22e6:	f063 037f 	orn	r3, r3, #127	; 0x7f
    22ea:	b2da      	uxtb	r2, r3
    22ec:	4b0d      	ldr	r3, [pc, #52]	; (2324 <EXTI9_5_handler+0x15c>)
    22ee:	701a      	strb	r2, [r3, #0]
			parity++;
    22f0:	79fb      	ldrb	r3, [r7, #7]
    22f2:	b2db      	uxtb	r3, r3
    22f4:	3301      	adds	r3, #1
    22f6:	b2db      	uxtb	r3, r3
    22f8:	71fb      	strb	r3, [r7, #7]
		}
		bit_cnt++;
    22fa:	4b07      	ldr	r3, [pc, #28]	; (2318 <EXTI9_5_handler+0x150>)
    22fc:	781b      	ldrb	r3, [r3, #0]
    22fe:	b2db      	uxtb	r3, r3
    2300:	3301      	adds	r3, #1
    2302:	b2da      	uxtb	r2, r3
    2304:	4b04      	ldr	r3, [pc, #16]	; (2318 <EXTI9_5_handler+0x150>)
    2306:	701a      	strb	r2, [r3, #0]
		break;
    2308:	bf00      	nop
	}
}
    230a:	370c      	adds	r7, #12
    230c:	46bd      	mov	sp, r7
    230e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2312:	4770      	bx	lr
    2314:	40010400 	.word	0x40010400
    2318:	200000d8 	.word	0x200000d8
    231c:	200000bc 	.word	0x200000bc
    2320:	40010800 	.word	0x40010800
    2324:	200000d9 	.word	0x200000d9
    2328:	200000c5 	.word	0x200000c5
    232c:	200000c8 	.word	0x200000c8

00002330 <TIM2_handler>:

void TIM2_handler(){
    2330:	b580      	push	{r7, lr}
    2332:	af00      	add	r7, sp, #0
	TMR2->SR&=~(BIT0); // clear interrupt bit
    2334:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    2338:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    233c:	691b      	ldr	r3, [r3, #16]
    233e:	f023 0301 	bic.w	r3, r3, #1
    2342:	6113      	str	r3, [r2, #16]
	if (ps2_tail!=ps2_head){
    2344:	4b0f      	ldr	r3, [pc, #60]	; (2384 <TIM2_handler+0x54>)
    2346:	781b      	ldrb	r3, [r3, #0]
    2348:	b2da      	uxtb	r2, r3
    234a:	4b0f      	ldr	r3, [pc, #60]	; (2388 <TIM2_handler+0x58>)
    234c:	781b      	ldrb	r3, [r3, #0]
    234e:	b2db      	uxtb	r3, r3
    2350:	429a      	cmp	r2, r3
    2352:	d015      	beq.n	2380 <TIM2_handler+0x50>
		convert_code(ps2_queue[ps2_head++]);
    2354:	4b0c      	ldr	r3, [pc, #48]	; (2388 <TIM2_handler+0x58>)
    2356:	781b      	ldrb	r3, [r3, #0]
    2358:	b2db      	uxtb	r3, r3
    235a:	1c5a      	adds	r2, r3, #1
    235c:	b2d1      	uxtb	r1, r2
    235e:	4a0a      	ldr	r2, [pc, #40]	; (2388 <TIM2_handler+0x58>)
    2360:	7011      	strb	r1, [r2, #0]
    2362:	461a      	mov	r2, r3
    2364:	4b09      	ldr	r3, [pc, #36]	; (238c <TIM2_handler+0x5c>)
    2366:	5c9b      	ldrb	r3, [r3, r2]
    2368:	b2db      	uxtb	r3, r3
    236a:	4618      	mov	r0, r3
    236c:	f7ff fdda 	bl	1f24 <convert_code>
		ps2_head&=PS2_QUEUE_SIZE-1;
    2370:	4b05      	ldr	r3, [pc, #20]	; (2388 <TIM2_handler+0x58>)
    2372:	781b      	ldrb	r3, [r3, #0]
    2374:	b2db      	uxtb	r3, r3
    2376:	f003 030f 	and.w	r3, r3, #15
    237a:	b2da      	uxtb	r2, r3
    237c:	4b02      	ldr	r3, [pc, #8]	; (2388 <TIM2_handler+0x58>)
    237e:	701a      	strb	r2, [r3, #0]
	}
}
    2380:	bd80      	pop	{r7, pc}
    2382:	bf00      	nop
    2384:	200000c5 	.word	0x200000c5
    2388:	200000c4 	.word	0x200000c4
    238c:	200000c8 	.word	0x200000c8

00002390 <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(int irq){
    2390:	b480      	push	{r7}
    2392:	b083      	sub	sp, #12
    2394:	af00      	add	r7, sp, #0
    2396:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    2398:	687b      	ldr	r3, [r7, #4]
    239a:	2b3b      	cmp	r3, #59	; 0x3b
    239c:	dd00      	ble.n	23a0 <enable_interrupt+0x10>
    239e:	e016      	b.n	23ce <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    23a0:	687b      	ldr	r3, [r7, #4]
    23a2:	115b      	asrs	r3, r3, #5
    23a4:	009b      	lsls	r3, r3, #2
    23a6:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    23aa:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    23ae:	687a      	ldr	r2, [r7, #4]
    23b0:	1152      	asrs	r2, r2, #5
    23b2:	0092      	lsls	r2, r2, #2
    23b4:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    23b8:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    23bc:	6812      	ldr	r2, [r2, #0]
    23be:	6879      	ldr	r1, [r7, #4]
    23c0:	f001 011f 	and.w	r1, r1, #31
    23c4:	2001      	movs	r0, #1
    23c6:	fa00 f101 	lsl.w	r1, r0, r1
    23ca:	430a      	orrs	r2, r1
    23cc:	601a      	str	r2, [r3, #0]
}
    23ce:	370c      	adds	r7, #12
    23d0:	46bd      	mov	sp, r7
    23d2:	f85d 7b04 	ldr.w	r7, [sp], #4
    23d6:	4770      	bx	lr

000023d8 <disable_interrupt>:


void disable_interrupt(int irq){
    23d8:	b480      	push	{r7}
    23da:	b083      	sub	sp, #12
    23dc:	af00      	add	r7, sp, #0
    23de:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    23e0:	687b      	ldr	r3, [r7, #4]
    23e2:	2b3b      	cmp	r3, #59	; 0x3b
    23e4:	dd00      	ble.n	23e8 <disable_interrupt+0x10>
    23e6:	e00b      	b.n	2400 <disable_interrupt+0x28>
	ICER[irq>>5]=(1<<(irq&0x1f));
    23e8:	687b      	ldr	r3, [r7, #4]
    23ea:	115b      	asrs	r3, r3, #5
    23ec:	009a      	lsls	r2, r3, #2
    23ee:	4b07      	ldr	r3, [pc, #28]	; (240c <disable_interrupt+0x34>)
    23f0:	4413      	add	r3, r2
    23f2:	687a      	ldr	r2, [r7, #4]
    23f4:	f002 021f 	and.w	r2, r2, #31
    23f8:	2101      	movs	r1, #1
    23fa:	fa01 f202 	lsl.w	r2, r1, r2
    23fe:	601a      	str	r2, [r3, #0]
}
    2400:	370c      	adds	r7, #12
    2402:	46bd      	mov	sp, r7
    2404:	f85d 7b04 	ldr.w	r7, [sp], #4
    2408:	4770      	bx	lr
    240a:	bf00      	nop
    240c:	e000e180 	.word	0xe000e180

00002410 <get_pending>:

unsigned get_pending(int irq){
    2410:	b480      	push	{r7}
    2412:	b083      	sub	sp, #12
    2414:	af00      	add	r7, sp, #0
    2416:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    2418:	687b      	ldr	r3, [r7, #4]
    241a:	2b3b      	cmp	r3, #59	; 0x3b
    241c:	dd01      	ble.n	2422 <get_pending+0x12>
    241e:	2300      	movs	r3, #0
    2420:	e00c      	b.n	243c <get_pending+0x2c>
	return ICPR[irq>>5]&(1<<(irq&0x1f));
    2422:	687b      	ldr	r3, [r7, #4]
    2424:	115b      	asrs	r3, r3, #5
    2426:	009a      	lsls	r2, r3, #2
    2428:	4b07      	ldr	r3, [pc, #28]	; (2448 <get_pending+0x38>)
    242a:	4413      	add	r3, r2
    242c:	681b      	ldr	r3, [r3, #0]
    242e:	687a      	ldr	r2, [r7, #4]
    2430:	f002 021f 	and.w	r2, r2, #31
    2434:	2101      	movs	r1, #1
    2436:	fa01 f202 	lsl.w	r2, r1, r2
    243a:	4013      	ands	r3, r2
}
    243c:	4618      	mov	r0, r3
    243e:	370c      	adds	r7, #12
    2440:	46bd      	mov	sp, r7
    2442:	f85d 7b04 	ldr.w	r7, [sp], #4
    2446:	4770      	bx	lr
    2448:	e000e280 	.word	0xe000e280

0000244c <get_active>:

unsigned get_active(int irq){
    244c:	b480      	push	{r7}
    244e:	b083      	sub	sp, #12
    2450:	af00      	add	r7, sp, #0
    2452:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    2454:	687b      	ldr	r3, [r7, #4]
    2456:	2b3b      	cmp	r3, #59	; 0x3b
    2458:	dd01      	ble.n	245e <get_active+0x12>
    245a:	2300      	movs	r3, #0
    245c:	e00e      	b.n	247c <get_active+0x30>
	return IABR[irq>>5]&(1<<(irq&0x1f));
    245e:	687b      	ldr	r3, [r7, #4]
    2460:	115b      	asrs	r3, r3, #5
    2462:	009b      	lsls	r3, r3, #2
    2464:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2468:	f503 4363 	add.w	r3, r3, #58112	; 0xe300
    246c:	681b      	ldr	r3, [r3, #0]
    246e:	687a      	ldr	r2, [r7, #4]
    2470:	f002 021f 	and.w	r2, r2, #31
    2474:	2101      	movs	r1, #1
    2476:	fa01 f202 	lsl.w	r2, r1, r2
    247a:	4013      	ands	r3, r2
}
    247c:	4618      	mov	r0, r3
    247e:	370c      	adds	r7, #12
    2480:	46bd      	mov	sp, r7
    2482:	f85d 7b04 	ldr.w	r7, [sp], #4
    2486:	4770      	bx	lr

00002488 <set_pending>:

void set_pending(int irq){
    2488:	b480      	push	{r7}
    248a:	b083      	sub	sp, #12
    248c:	af00      	add	r7, sp, #0
    248e:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    2490:	687b      	ldr	r3, [r7, #4]
    2492:	2b3b      	cmp	r3, #59	; 0x3b
    2494:	dd00      	ble.n	2498 <set_pending+0x10>
    2496:	e016      	b.n	24c6 <set_pending+0x3e>
	ISPR[irq>>5]|=1<<(irq&0x1f);
    2498:	687b      	ldr	r3, [r7, #4]
    249a:	115b      	asrs	r3, r3, #5
    249c:	009b      	lsls	r3, r3, #2
    249e:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    24a2:	f503 4362 	add.w	r3, r3, #57856	; 0xe200
    24a6:	687a      	ldr	r2, [r7, #4]
    24a8:	1152      	asrs	r2, r2, #5
    24aa:	0092      	lsls	r2, r2, #2
    24ac:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    24b0:	f502 4262 	add.w	r2, r2, #57856	; 0xe200
    24b4:	6812      	ldr	r2, [r2, #0]
    24b6:	6879      	ldr	r1, [r7, #4]
    24b8:	f001 011f 	and.w	r1, r1, #31
    24bc:	2001      	movs	r0, #1
    24be:	fa00 f101 	lsl.w	r1, r0, r1
    24c2:	430a      	orrs	r2, r1
    24c4:	601a      	str	r2, [r3, #0]
}
    24c6:	370c      	adds	r7, #12
    24c8:	46bd      	mov	sp, r7
    24ca:	f85d 7b04 	ldr.w	r7, [sp], #4
    24ce:	4770      	bx	lr

000024d0 <clear_pending>:

void clear_pending(int irq){
    24d0:	b480      	push	{r7}
    24d2:	b083      	sub	sp, #12
    24d4:	af00      	add	r7, sp, #0
    24d6:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    24d8:	687b      	ldr	r3, [r7, #4]
    24da:	2b3b      	cmp	r3, #59	; 0x3b
    24dc:	dd00      	ble.n	24e0 <clear_pending+0x10>
    24de:	e00b      	b.n	24f8 <clear_pending+0x28>
	ICPR[irq>>5]=(1<<(irq&0x1f));
    24e0:	687b      	ldr	r3, [r7, #4]
    24e2:	115b      	asrs	r3, r3, #5
    24e4:	009a      	lsls	r2, r3, #2
    24e6:	4b07      	ldr	r3, [pc, #28]	; (2504 <clear_pending+0x34>)
    24e8:	4413      	add	r3, r2
    24ea:	687a      	ldr	r2, [r7, #4]
    24ec:	f002 021f 	and.w	r2, r2, #31
    24f0:	2101      	movs	r1, #1
    24f2:	fa01 f202 	lsl.w	r2, r1, r2
    24f6:	601a      	str	r2, [r3, #0]
}
    24f8:	370c      	adds	r7, #12
    24fa:	46bd      	mov	sp, r7
    24fc:	f85d 7b04 	ldr.w	r7, [sp], #4
    2500:	4770      	bx	lr
    2502:	bf00      	nop
    2504:	e000e280 	.word	0xe000e280

00002508 <set_int_priority>:


void set_int_priority(int irq, unsigned priority){
    2508:	b480      	push	{r7}
    250a:	b083      	sub	sp, #12
    250c:	af00      	add	r7, sp, #0
    250e:	6078      	str	r0, [r7, #4]
    2510:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    2512:	687b      	ldr	r3, [r7, #4]
    2514:	2b00      	cmp	r3, #0
    2516:	db0d      	blt.n	2534 <set_int_priority+0x2c>
    2518:	687b      	ldr	r3, [r7, #4]
    251a:	2b3b      	cmp	r3, #59	; 0x3b
    251c:	dc0a      	bgt.n	2534 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    251e:	687b      	ldr	r3, [r7, #4]
    2520:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2524:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    2528:	683a      	ldr	r2, [r7, #0]
    252a:	b2d2      	uxtb	r2, r2
    252c:	0112      	lsls	r2, r2, #4
    252e:	b2d2      	uxtb	r2, r2
    2530:	701a      	strb	r2, [r3, #0]
    2532:	e012      	b.n	255a <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    2534:	687b      	ldr	r3, [r7, #4]
    2536:	2b00      	cmp	r3, #0
    2538:	da0f      	bge.n	255a <set_int_priority+0x52>
    253a:	687b      	ldr	r3, [r7, #4]
    253c:	f113 0f0f 	cmn.w	r3, #15
    2540:	db0b      	blt.n	255a <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    2542:	687a      	ldr	r2, [r7, #4]
    2544:	f06f 0303 	mvn.w	r3, #3
    2548:	1a9b      	subs	r3, r3, r2
    254a:	461a      	mov	r2, r3
    254c:	4b05      	ldr	r3, [pc, #20]	; (2564 <set_int_priority+0x5c>)
    254e:	4413      	add	r3, r2
    2550:	683a      	ldr	r2, [r7, #0]
    2552:	b2d2      	uxtb	r2, r2
    2554:	0112      	lsls	r2, r2, #4
    2556:	b2d2      	uxtb	r2, r2
    2558:	701a      	strb	r2, [r3, #0]
	}
}
    255a:	370c      	adds	r7, #12
    255c:	46bd      	mov	sp, r7
    255e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2562:	4770      	bx	lr
    2564:	e000ed18 	.word	0xe000ed18

00002568 <sdcard_capacity>:

uint16_t sdc_status; // indicateurs booléens carte SD
static unsigned blocks_count; // nombre de bloc de 512 octets

// retourne la capacité en Mo
unsigned sdcard_capacity(){
    2568:	b480      	push	{r7}
    256a:	af00      	add	r7, sp, #0
	return blocks_count/2048;
    256c:	4b03      	ldr	r3, [pc, #12]	; (257c <sdcard_capacity+0x14>)
    256e:	681b      	ldr	r3, [r3, #0]
    2570:	0adb      	lsrs	r3, r3, #11
}
    2572:	4618      	mov	r0, r3
    2574:	46bd      	mov	sp, r7
    2576:	f85d 7b04 	ldr.w	r7, [sp], #4
    257a:	4770      	bx	lr
    257c:	200000dc 	.word	0x200000dc

00002580 <dummy_clock>:

// après la mise sous tension la carte
// doit-être activée par 80 clock
static void dummy_clock(){
    2580:	b580      	push	{r7, lr}
    2582:	b082      	sub	sp, #8
    2584:	af00      	add	r7, sp, #0
		int i;
		_sdcard_cs_high();
    2586:	4a0a      	ldr	r2, [pc, #40]	; (25b0 <dummy_clock+0x30>)
    2588:	4b09      	ldr	r3, [pc, #36]	; (25b0 <dummy_clock+0x30>)
    258a:	68db      	ldr	r3, [r3, #12]
    258c:	f043 0310 	orr.w	r3, r3, #16
    2590:	60d3      	str	r3, [r2, #12]
		// envoie de 80 clock pour activer la carte
		for (i=0;i<10;i++)spi_read(SDC_SPI);
    2592:	2300      	movs	r3, #0
    2594:	607b      	str	r3, [r7, #4]
    2596:	e005      	b.n	25a4 <dummy_clock+0x24>
    2598:	4806      	ldr	r0, [pc, #24]	; (25b4 <dummy_clock+0x34>)
    259a:	f000 fb41 	bl	2c20 <spi_read>
    259e:	687b      	ldr	r3, [r7, #4]
    25a0:	3301      	adds	r3, #1
    25a2:	607b      	str	r3, [r7, #4]
    25a4:	687b      	ldr	r3, [r7, #4]
    25a6:	2b09      	cmp	r3, #9
    25a8:	ddf6      	ble.n	2598 <dummy_clock+0x18>
}
    25aa:	3708      	adds	r7, #8
    25ac:	46bd      	mov	sp, r7
    25ae:	bd80      	pop	{r7, pc}
    25b0:	40010800 	.word	0x40010800
    25b4:	40013000 	.word	0x40013000

000025b8 <sdc_wait_ready>:

// attend que la carte soie prête
// lit des caractère de la carte 
// jusqu'à ce que le caractèr lu soit 0xff
// expire après 10msec
static int sdc_wait_ready(){
    25b8:	b580      	push	{r7, lr}
    25ba:	b082      	sub	sp, #8
    25bc:	af00      	add	r7, sp, #0
	unsigned char c;
	unsigned t0;
	t0=ticks+500;
    25be:	4b0f      	ldr	r3, [pc, #60]	; (25fc <sdc_wait_ready+0x44>)
    25c0:	681b      	ldr	r3, [r3, #0]
    25c2:	f503 73fa 	add.w	r3, r3, #500	; 0x1f4
    25c6:	603b      	str	r3, [r7, #0]
	while (ticks<t0){
    25c8:	e008      	b.n	25dc <sdc_wait_ready+0x24>
		c=spi_read(SDC_SPI);
    25ca:	480d      	ldr	r0, [pc, #52]	; (2600 <sdc_wait_ready+0x48>)
    25cc:	f000 fb28 	bl	2c20 <spi_read>
    25d0:	4603      	mov	r3, r0
    25d2:	71fb      	strb	r3, [r7, #7]
	    if (c==0xff){break;}
    25d4:	79fb      	ldrb	r3, [r7, #7]
    25d6:	2bff      	cmp	r3, #255	; 0xff
    25d8:	d100      	bne.n	25dc <sdc_wait_ready+0x24>
    25da:	e004      	b.n	25e6 <sdc_wait_ready+0x2e>
// expire après 10msec
static int sdc_wait_ready(){
	unsigned char c;
	unsigned t0;
	t0=ticks+500;
	while (ticks<t0){
    25dc:	4b07      	ldr	r3, [pc, #28]	; (25fc <sdc_wait_ready+0x44>)
    25de:	681a      	ldr	r2, [r3, #0]
    25e0:	683b      	ldr	r3, [r7, #0]
    25e2:	429a      	cmp	r2, r3
    25e4:	d3f1      	bcc.n	25ca <sdc_wait_ready+0x12>
		c=spi_read(SDC_SPI);
	    if (c==0xff){break;}
	}
	return c==0xff;
    25e6:	79fb      	ldrb	r3, [r7, #7]
    25e8:	2bff      	cmp	r3, #255	; 0xff
    25ea:	bf0c      	ite	eq
    25ec:	2301      	moveq	r3, #1
    25ee:	2300      	movne	r3, #0
    25f0:	b2db      	uxtb	r3, r3
}
    25f2:	4618      	mov	r0, r3
    25f4:	3708      	adds	r7, #8
    25f6:	46bd      	mov	sp, r7
    25f8:	bd80      	pop	{r7, pc}
    25fa:	bf00      	nop
    25fc:	200000e0 	.word	0x200000e0
    2600:	40013000 	.word	0x40013000

00002604 <sdcard_deselect>:

// desactivation de l'interface avec la carte
void sdcard_deselect(){
    2604:	b580      	push	{r7, lr}
    2606:	af00      	add	r7, sp, #0
	_sdcard_cs_high();
    2608:	4a05      	ldr	r2, [pc, #20]	; (2620 <sdcard_deselect+0x1c>)
    260a:	4b05      	ldr	r3, [pc, #20]	; (2620 <sdcard_deselect+0x1c>)
    260c:	68db      	ldr	r3, [r3, #12]
    260e:	f043 0310 	orr.w	r3, r3, #16
    2612:	60d3      	str	r3, [r2, #12]
	spi_write(SDC_SPI,0xff);
    2614:	4803      	ldr	r0, [pc, #12]	; (2624 <sdcard_deselect+0x20>)
    2616:	21ff      	movs	r1, #255	; 0xff
    2618:	f000 fae2 	bl	2be0 <spi_write>
}
    261c:	bd80      	pop	{r7, pc}
    261e:	bf00      	nop
    2620:	40010800 	.word	0x40010800
    2624:	40013000 	.word	0x40013000

00002628 <sdcard_select>:

// sélection la carte
int sdcard_select(){
    2628:	b580      	push	{r7, lr}
    262a:	af00      	add	r7, sp, #0
	_sdcard_cs_low();
    262c:	4a0a      	ldr	r2, [pc, #40]	; (2658 <sdcard_select+0x30>)
    262e:	4b0a      	ldr	r3, [pc, #40]	; (2658 <sdcard_select+0x30>)
    2630:	68db      	ldr	r3, [r3, #12]
    2632:	f023 0310 	bic.w	r3, r3, #16
    2636:	60d3      	str	r3, [r2, #12]
	spi_write(SDC_SPI,0xff);
    2638:	4808      	ldr	r0, [pc, #32]	; (265c <sdcard_select+0x34>)
    263a:	21ff      	movs	r1, #255	; 0xff
    263c:	f000 fad0 	bl	2be0 <spi_write>
	if (sdc_wait_ready()){
    2640:	f7ff ffba 	bl	25b8 <sdc_wait_ready>
    2644:	4603      	mov	r3, r0
    2646:	2b00      	cmp	r3, #0
    2648:	d001      	beq.n	264e <sdcard_select+0x26>
		return 1;
    264a:	2301      	movs	r3, #1
    264c:	e002      	b.n	2654 <sdcard_select+0x2c>
	}else{
		sdcard_deselect();
    264e:	f7ff ffd9 	bl	2604 <sdcard_deselect>
		return 0;
    2652:	2300      	movs	r3, #0
	}
}
    2654:	4618      	mov	r0, r3
    2656:	bd80      	pop	{r7, pc}
    2658:	40010800 	.word	0x40010800
    265c:	40013000 	.word	0x40013000

00002660 <sdc_cmd>:
*    cmd  index de la commande
*    args arguments de la commande
* retourne:
*   r1 1ier octet réponse de la carte
***********************************/
unsigned char sdc_cmd(unsigned char cmd,unsigned char *args){
    2660:	b580      	push	{r7, lr}
    2662:	b084      	sub	sp, #16
    2664:	af00      	add	r7, sp, #0
    2666:	4603      	mov	r3, r0
    2668:	6039      	str	r1, [r7, #0]
    266a:	71fb      	strb	r3, [r7, #7]
    unsigned char r1;
    int i;
    
    sdcard_deselect();
    266c:	f7ff ffca 	bl	2604 <sdcard_deselect>
    if (!sdcard_select()) return 0xff;
    2670:	f7ff ffda 	bl	2628 <sdcard_select>
    2674:	4603      	mov	r3, r0
    2676:	2b00      	cmp	r3, #0
    2678:	d101      	bne.n	267e <sdc_cmd+0x1e>
    267a:	23ff      	movs	r3, #255	; 0xff
    267c:	e020      	b.n	26c0 <sdc_cmd+0x60>
    spi_write(SDC_SPI,cmd|0x40);
    267e:	79fb      	ldrb	r3, [r7, #7]
    2680:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    2684:	b2db      	uxtb	r3, r3
    2686:	4810      	ldr	r0, [pc, #64]	; (26c8 <sdc_cmd+0x68>)
    2688:	4619      	mov	r1, r3
    268a:	f000 faa9 	bl	2be0 <spi_write>
    spi_block_write(SDC_SPI,args,5);
    268e:	480e      	ldr	r0, [pc, #56]	; (26c8 <sdc_cmd+0x68>)
    2690:	6839      	ldr	r1, [r7, #0]
    2692:	2205      	movs	r2, #5
    2694:	f000 fae4 	bl	2c60 <spi_block_write>
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
    2698:	2308      	movs	r3, #8
    269a:	60bb      	str	r3, [r7, #8]
    269c:	e00c      	b.n	26b8 <sdc_cmd+0x58>
		r1=spi_read(SDC_SPI);
    269e:	480a      	ldr	r0, [pc, #40]	; (26c8 <sdc_cmd+0x68>)
    26a0:	f000 fabe 	bl	2c20 <spi_read>
    26a4:	4603      	mov	r3, r0
    26a6:	73fb      	strb	r3, [r7, #15]
		if (r1<128) {break;}
    26a8:	7bfb      	ldrb	r3, [r7, #15]
    26aa:	b25b      	sxtb	r3, r3
    26ac:	2b00      	cmp	r3, #0
    26ae:	db00      	blt.n	26b2 <sdc_cmd+0x52>
    26b0:	e005      	b.n	26be <sdc_cmd+0x5e>
    if (!sdcard_select()) return 0xff;
    spi_write(SDC_SPI,cmd|0x40);
    spi_block_write(SDC_SPI,args,5);
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
    26b2:	68bb      	ldr	r3, [r7, #8]
    26b4:	3b01      	subs	r3, #1
    26b6:	60bb      	str	r3, [r7, #8]
    26b8:	68bb      	ldr	r3, [r7, #8]
    26ba:	2b00      	cmp	r3, #0
    26bc:	d1ef      	bne.n	269e <sdc_cmd+0x3e>
		r1=spi_read(SDC_SPI);
		if (r1<128) {break;}
	}
    return r1;
    26be:	7bfb      	ldrb	r3, [r7, #15]
}
    26c0:	4618      	mov	r0, r3
    26c2:	3710      	adds	r7, #16
    26c4:	46bd      	mov	sp, r7
    26c6:	bd80      	pop	{r7, pc}
    26c8:	40013000 	.word	0x40013000

000026cc <sdc_read_register>:

unsigned char sdc_read_register(unsigned char index, unsigned char *reg){
    26cc:	b580      	push	{r7, lr}
    26ce:	b084      	sub	sp, #16
    26d0:	af00      	add	r7, sp, #0
    26d2:	4603      	mov	r3, r0
    26d4:	6039      	str	r1, [r7, #0]
    26d6:	71fb      	strb	r3, [r7, #7]
	unsigned char c=0xff, r1, args[5]={0,0,0,0,0};
    26d8:	23ff      	movs	r3, #255	; 0xff
    26da:	73fb      	strb	r3, [r7, #15]
    26dc:	2300      	movs	r3, #0
    26de:	723b      	strb	r3, [r7, #8]
    26e0:	2300      	movs	r3, #0
    26e2:	727b      	strb	r3, [r7, #9]
    26e4:	2300      	movs	r3, #0
    26e6:	72bb      	strb	r3, [r7, #10]
    26e8:	2300      	movs	r3, #0
    26ea:	72fb      	strb	r3, [r7, #11]
    26ec:	2300      	movs	r3, #0
    26ee:	733b      	strb	r3, [r7, #12]
	r1=sdc_cmd(index,args);
    26f0:	79fa      	ldrb	r2, [r7, #7]
    26f2:	f107 0308 	add.w	r3, r7, #8
    26f6:	4610      	mov	r0, r2
    26f8:	4619      	mov	r1, r3
    26fa:	f7ff ffb1 	bl	2660 <sdc_cmd>
    26fe:	4603      	mov	r3, r0
    2700:	73bb      	strb	r3, [r7, #14]
	if (!r1){
    2702:	7bbb      	ldrb	r3, [r7, #14]
    2704:	2b00      	cmp	r3, #0
    2706:	d115      	bne.n	2734 <sdc_read_register+0x68>
		do {
			c=spi_read(SDC_SPI);
    2708:	480f      	ldr	r0, [pc, #60]	; (2748 <sdc_read_register+0x7c>)
    270a:	f000 fa89 	bl	2c20 <spi_read>
    270e:	4603      	mov	r3, r0
    2710:	73fb      	strb	r3, [r7, #15]
		}while (c==0xff);
    2712:	7bfb      	ldrb	r3, [r7, #15]
    2714:	2bff      	cmp	r3, #255	; 0xff
    2716:	d0f7      	beq.n	2708 <sdc_read_register+0x3c>
		if (c==0xfe){ // lecture de 16 octets
    2718:	7bfb      	ldrb	r3, [r7, #15]
    271a:	2bfe      	cmp	r3, #254	; 0xfe
    271c:	d10a      	bne.n	2734 <sdc_read_register+0x68>
			spi_block_read(SDC_SPI,reg,16);
    271e:	480a      	ldr	r0, [pc, #40]	; (2748 <sdc_read_register+0x7c>)
    2720:	6839      	ldr	r1, [r7, #0]
    2722:	2210      	movs	r2, #16
    2724:	f000 fac6 	bl	2cb4 <spi_block_read>
			// lecture du CRC 16 bits
			spi_read(SDC_SPI);
    2728:	4807      	ldr	r0, [pc, #28]	; (2748 <sdc_read_register+0x7c>)
    272a:	f000 fa79 	bl	2c20 <spi_read>
			spi_read(SDC_SPI);
    272e:	4806      	ldr	r0, [pc, #24]	; (2748 <sdc_read_register+0x7c>)
    2730:	f000 fa76 	bl	2c20 <spi_read>
		}
	}
//	sdcard_deselect();
	return !r1;
    2734:	7bbb      	ldrb	r3, [r7, #14]
    2736:	2b00      	cmp	r3, #0
    2738:	bf0c      	ite	eq
    273a:	2301      	moveq	r3, #1
    273c:	2300      	movne	r3, #0
    273e:	b2db      	uxtb	r3, r3
}
    2740:	4618      	mov	r0, r3
    2742:	3710      	adds	r7, #16
    2744:	46bd      	mov	sp, r7
    2746:	bd80      	pop	{r7, pc}
    2748:	40013000 	.word	0x40013000

0000274c <sdc_set_size>:

// détermine la capacité de la carte
static unsigned char sdc_set_size(){
    274c:	b580      	push	{r7, lr}
    274e:	b088      	sub	sp, #32
    2750:	af00      	add	r7, sp, #0
	unsigned char r1,csd[16];
	unsigned block_len,c_size,c_size_mult;
	r1=sdc_read_register(SEND_CSD,csd);
    2752:	463b      	mov	r3, r7
    2754:	2009      	movs	r0, #9
    2756:	4619      	mov	r1, r3
    2758:	f7ff ffb8 	bl	26cc <sdc_read_register>
    275c:	4603      	mov	r3, r0
    275e:	77fb      	strb	r3, [r7, #31]
	if (r1){
    2760:	7ffb      	ldrb	r3, [r7, #31]
    2762:	2b00      	cmp	r3, #0
    2764:	d038      	beq.n	27d8 <sdc_set_size+0x8c>
		if (sdc_status&F_SDC_HC){//version 2, carte haute capacité
    2766:	4b1f      	ldr	r3, [pc, #124]	; (27e4 <sdc_set_size+0x98>)
    2768:	881b      	ldrh	r3, [r3, #0]
    276a:	f003 0308 	and.w	r3, r3, #8
    276e:	2b00      	cmp	r3, #0
    2770:	d008      	beq.n	2784 <sdc_set_size+0x38>
			blocks_count=1024*((csd[8]<<8)+csd[9]);
    2772:	7a3b      	ldrb	r3, [r7, #8]
    2774:	021b      	lsls	r3, r3, #8
    2776:	7a7a      	ldrb	r2, [r7, #9]
    2778:	4413      	add	r3, r2
    277a:	029b      	lsls	r3, r3, #10
    277c:	461a      	mov	r2, r3
    277e:	4b1a      	ldr	r3, [pc, #104]	; (27e8 <sdc_set_size+0x9c>)
    2780:	601a      	str	r2, [r3, #0]
    2782:	e029      	b.n	27d8 <sdc_set_size+0x8c>
		}else{// version 1
			block_len=1<<((csd[5]&0xf)-1);
    2784:	797b      	ldrb	r3, [r7, #5]
    2786:	f003 030f 	and.w	r3, r3, #15
    278a:	3b01      	subs	r3, #1
    278c:	2201      	movs	r2, #1
    278e:	fa02 f303 	lsl.w	r3, r2, r3
    2792:	61bb      	str	r3, [r7, #24]
			c_size=(csd[6]&0xf<<10)+(csd[7]<<2)+((csd[8]>>6)&3)+1;
    2794:	79bb      	ldrb	r3, [r7, #6]
    2796:	f403 5270 	and.w	r2, r3, #15360	; 0x3c00
    279a:	79fb      	ldrb	r3, [r7, #7]
    279c:	009b      	lsls	r3, r3, #2
    279e:	441a      	add	r2, r3
    27a0:	7a3b      	ldrb	r3, [r7, #8]
    27a2:	099b      	lsrs	r3, r3, #6
    27a4:	b2db      	uxtb	r3, r3
    27a6:	f003 0303 	and.w	r3, r3, #3
    27aa:	4413      	add	r3, r2
    27ac:	3301      	adds	r3, #1
    27ae:	617b      	str	r3, [r7, #20]
			c_size_mult=1<<(((csd[9]&0x3)<<1)+(csd[10]>>7)+2);
    27b0:	7a7b      	ldrb	r3, [r7, #9]
    27b2:	f003 0303 	and.w	r3, r3, #3
    27b6:	005b      	lsls	r3, r3, #1
    27b8:	7aba      	ldrb	r2, [r7, #10]
    27ba:	09d2      	lsrs	r2, r2, #7
    27bc:	b2d2      	uxtb	r2, r2
    27be:	4413      	add	r3, r2
    27c0:	3302      	adds	r3, #2
    27c2:	2201      	movs	r2, #1
    27c4:	fa02 f303 	lsl.w	r3, r2, r3
    27c8:	613b      	str	r3, [r7, #16]
			blocks_count=(c_size*c_size_mult)>>9;
    27ca:	697b      	ldr	r3, [r7, #20]
    27cc:	693a      	ldr	r2, [r7, #16]
    27ce:	fb02 f303 	mul.w	r3, r2, r3
    27d2:	0a5b      	lsrs	r3, r3, #9
    27d4:	4a04      	ldr	r2, [pc, #16]	; (27e8 <sdc_set_size+0x9c>)
    27d6:	6013      	str	r3, [r2, #0]
		}
	}
	return r1;
    27d8:	7ffb      	ldrb	r3, [r7, #31]
}
    27da:	4618      	mov	r0, r3
    27dc:	3720      	adds	r7, #32
    27de:	46bd      	mov	sp, r7
    27e0:	bd80      	pop	{r7, pc}
    27e2:	bf00      	nop
    27e4:	20000134 	.word	0x20000134
    27e8:	200000dc 	.word	0x200000dc

000027ec <sdcard_init>:

// flow chart REF: http://elm-chan.org/docs/mmc/ima/sdinit.png
int sdcard_init(){
    27ec:	b580      	push	{r7, lr}
    27ee:	b088      	sub	sp, #32
    27f0:	af00      	add	r7, sp, #0
		int i;
		unsigned t0;
		uint8_t r1,args[5], resp[16];
		
		sdc_status=0;
    27f2:	4b97      	ldr	r3, [pc, #604]	; (2a50 <sdcard_init+0x264>)
    27f4:	2200      	movs	r2, #0
    27f6:	801a      	strh	r2, [r3, #0]
		blocks_count=0;
    27f8:	4b96      	ldr	r3, [pc, #600]	; (2a54 <sdcard_init+0x268>)
    27fa:	2200      	movs	r2, #0
    27fc:	601a      	str	r2, [r3, #0]
		// initialise le périphérique SPI à la vitesse la plus lente.
		spi_init(SDC_SPI, SDC_CLK_SLOW, SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI, SPI_STD_PORT);
    27fe:	4896      	ldr	r0, [pc, #600]	; (2a58 <sdcard_init+0x26c>)
    2800:	2107      	movs	r1, #7
    2802:	f44f 7241 	mov.w	r2, #772	; 0x304
    2806:	2300      	movs	r3, #0
    2808:	f000 f9ba 	bl	2b80 <spi_init>
		// delais 2 msec
		pause(2);
    280c:	2002      	movs	r0, #2
    280e:	f000 facd 	bl	2dac <pause>
		sdcard_deselect();
    2812:	f7ff fef7 	bl	2604 <sdcard_deselect>
		dummy_clock();
    2816:	f7ff feb3 	bl	2580 <dummy_clock>
		if (!sdcard_select()){
    281a:	f7ff ff05 	bl	2628 <sdcard_select>
    281e:	4603      	mov	r3, r0
    2820:	2b00      	cmp	r3, #0
    2822:	d108      	bne.n	2836 <sdcard_init+0x4a>
				sdc_status|=F_SDC_IE;
    2824:	4b8a      	ldr	r3, [pc, #552]	; (2a50 <sdcard_init+0x264>)
    2826:	881b      	ldrh	r3, [r3, #0]
    2828:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    282c:	b29a      	uxth	r2, r3
    282e:	4b88      	ldr	r3, [pc, #544]	; (2a50 <sdcard_init+0x264>)
    2830:	801a      	strh	r2, [r3, #0]
				return 0;
    2832:	2300      	movs	r3, #0
    2834:	e108      	b.n	2a48 <sdcard_init+0x25c>
		}
		// envoie GO_IDLE_STATE, CMD0 
		// si succès r1==1
//		print("sending CMD0\n");
		args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMD0_CRC;
    2836:	2300      	movs	r3, #0
    2838:	743b      	strb	r3, [r7, #16]
    283a:	2300      	movs	r3, #0
    283c:	747b      	strb	r3, [r7, #17]
    283e:	2300      	movs	r3, #0
    2840:	74bb      	strb	r3, [r7, #18]
    2842:	2300      	movs	r3, #0
    2844:	74fb      	strb	r3, [r7, #19]
    2846:	2395      	movs	r3, #149	; 0x95
    2848:	753b      	strb	r3, [r7, #20]
		r1=sdc_cmd(GO_IDLE_STATE,args);
    284a:	f107 0310 	add.w	r3, r7, #16
    284e:	2000      	movs	r0, #0
    2850:	4619      	mov	r1, r3
    2852:	f7ff ff05 	bl	2660 <sdc_cmd>
    2856:	4603      	mov	r3, r0
    2858:	77fb      	strb	r3, [r7, #31]
		switch (r1){
    285a:	7ffb      	ldrb	r3, [r7, #31]
    285c:	2b01      	cmp	r3, #1
    285e:	d013      	beq.n	2888 <sdcard_init+0x9c>
    2860:	2bff      	cmp	r3, #255	; 0xff
    2862:	d108      	bne.n	2876 <sdcard_init+0x8a>
		case 1:
			break;
		case 0xff:
			sdc_status|=F_SDC_TO;
    2864:	4b7a      	ldr	r3, [pc, #488]	; (2a50 <sdcard_init+0x264>)
    2866:	881b      	ldrh	r3, [r3, #0]
    2868:	f043 0310 	orr.w	r3, r3, #16
    286c:	b29a      	uxth	r2, r3
    286e:	4b78      	ldr	r3, [pc, #480]	; (2a50 <sdcard_init+0x264>)
    2870:	801a      	strh	r2, [r3, #0]
			return 0;
    2872:	2300      	movs	r3, #0
    2874:	e0e8      	b.n	2a48 <sdcard_init+0x25c>
		default:
			sdc_status|=F_SDC_IE;
    2876:	4b76      	ldr	r3, [pc, #472]	; (2a50 <sdcard_init+0x264>)
    2878:	881b      	ldrh	r3, [r3, #0]
    287a:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    287e:	b29a      	uxth	r2, r3
    2880:	4b73      	ldr	r3, [pc, #460]	; (2a50 <sdcard_init+0x264>)
    2882:	801a      	strh	r2, [r3, #0]
			return 0;
    2884:	2300      	movs	r3, #0
    2886:	e0df      	b.n	2a48 <sdcard_init+0x25c>
//		print("sending CMD0\n");
		args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMD0_CRC;
		r1=sdc_cmd(GO_IDLE_STATE,args);
		switch (r1){
		case 1:
			break;
    2888:	bf00      	nop
			return 0;
		default:
			sdc_status|=F_SDC_IE;
			return 0;
		}//switch (r1)
		sdc_status|=F_SDC_IN;
    288a:	4b71      	ldr	r3, [pc, #452]	; (2a50 <sdcard_init+0x264>)
    288c:	881b      	ldrh	r3, [r3, #0]
    288e:	f043 0301 	orr.w	r3, r3, #1
    2892:	b29a      	uxth	r2, r3
    2894:	4b6e      	ldr	r3, [pc, #440]	; (2a50 <sdcard_init+0x264>)
    2896:	801a      	strh	r2, [r3, #0]
//		print("sending CMD8\n");
		args[2]=1;args[3]=0xaa;args[4]=CMD8_CRC;
    2898:	2301      	movs	r3, #1
    289a:	74bb      	strb	r3, [r7, #18]
    289c:	23aa      	movs	r3, #170	; 0xaa
    289e:	74fb      	strb	r3, [r7, #19]
    28a0:	2387      	movs	r3, #135	; 0x87
    28a2:	753b      	strb	r3, [r7, #20]
		r1=sdc_cmd(SEND_IF_COND,args);
    28a4:	f107 0310 	add.w	r3, r7, #16
    28a8:	2008      	movs	r0, #8
    28aa:	4619      	mov	r1, r3
    28ac:	f7ff fed8 	bl	2660 <sdc_cmd>
    28b0:	4603      	mov	r3, r0
    28b2:	77fb      	strb	r3, [r7, #31]
		if (r1==1){
    28b4:	7ffb      	ldrb	r3, [r7, #31]
    28b6:	2b01      	cmp	r3, #1
    28b8:	d11c      	bne.n	28f4 <sdcard_init+0x108>
			spi_block_read(SDC_SPI,resp,4);
    28ba:	463b      	mov	r3, r7
    28bc:	4866      	ldr	r0, [pc, #408]	; (2a58 <sdcard_init+0x26c>)
    28be:	4619      	mov	r1, r3
    28c0:	2204      	movs	r2, #4
    28c2:	f000 f9f7 	bl	2cb4 <spi_block_read>
			if ((resp[2]==1) && (resp[3]==0xAA)){
    28c6:	78bb      	ldrb	r3, [r7, #2]
    28c8:	2b01      	cmp	r3, #1
    28ca:	d10a      	bne.n	28e2 <sdcard_init+0xf6>
    28cc:	78fb      	ldrb	r3, [r7, #3]
    28ce:	2baa      	cmp	r3, #170	; 0xaa
    28d0:	d107      	bne.n	28e2 <sdcard_init+0xf6>
				sdc_status|=F_SDC_V2;
    28d2:	4b5f      	ldr	r3, [pc, #380]	; (2a50 <sdcard_init+0x264>)
    28d4:	881b      	ldrh	r3, [r3, #0]
    28d6:	f043 0304 	orr.w	r3, r3, #4
    28da:	b29a      	uxth	r2, r3
    28dc:	4b5c      	ldr	r3, [pc, #368]	; (2a50 <sdcard_init+0x264>)
    28de:	801a      	strh	r2, [r3, #0]
    28e0:	e008      	b.n	28f4 <sdcard_init+0x108>
//				print("card version 2\n");
			}else{
				sdc_status|=F_SDC_BAD_CARD;
    28e2:	4b5b      	ldr	r3, [pc, #364]	; (2a50 <sdcard_init+0x264>)
    28e4:	881b      	ldrh	r3, [r3, #0]
    28e6:	f443 7380 	orr.w	r3, r3, #256	; 0x100
    28ea:	b29a      	uxth	r2, r3
    28ec:	4b58      	ldr	r3, [pc, #352]	; (2a50 <sdcard_init+0x264>)
    28ee:	801a      	strh	r2, [r3, #0]
				return 0;
    28f0:	2300      	movs	r3, #0
    28f2:	e0a9      	b.n	2a48 <sdcard_init+0x25c>
			}
		}
		// envoie commande acmd41  APP_SEND_OP_COND
		// cette boucle peu prendre 1 seconde
//		print("sending ACMD41\n");
		t0=ticks+1000;
    28f4:	4b59      	ldr	r3, [pc, #356]	; (2a5c <sdcard_init+0x270>)
    28f6:	681b      	ldr	r3, [r3, #0]
    28f8:	f503 737a 	add.w	r3, r3, #1000	; 0x3e8
    28fc:	61bb      	str	r3, [r7, #24]
		args[1]=0;args[2]=0;args[3]=0;args[4]=CMDX_CRC;
    28fe:	2300      	movs	r3, #0
    2900:	747b      	strb	r3, [r7, #17]
    2902:	2300      	movs	r3, #0
    2904:	74bb      	strb	r3, [r7, #18]
    2906:	2300      	movs	r3, #0
    2908:	74fb      	strb	r3, [r7, #19]
    290a:	23ff      	movs	r3, #255	; 0xff
    290c:	753b      	strb	r3, [r7, #20]
		do {
			args[0]=0;
    290e:	2300      	movs	r3, #0
    2910:	743b      	strb	r3, [r7, #16]
			sdc_cmd(APP_CMD,args);
    2912:	f107 0310 	add.w	r3, r7, #16
    2916:	2037      	movs	r0, #55	; 0x37
    2918:	4619      	mov	r1, r3
    291a:	f7ff fea1 	bl	2660 <sdc_cmd>
			if (sdc_status&F_SDC_V2)args[0]=0x40;
    291e:	4b4c      	ldr	r3, [pc, #304]	; (2a50 <sdcard_init+0x264>)
    2920:	881b      	ldrh	r3, [r3, #0]
    2922:	f003 0304 	and.w	r3, r3, #4
    2926:	2b00      	cmp	r3, #0
    2928:	d001      	beq.n	292e <sdcard_init+0x142>
    292a:	2340      	movs	r3, #64	; 0x40
    292c:	743b      	strb	r3, [r7, #16]
			r1=sdc_cmd(APP_SEND_OP_COND,args);
    292e:	f107 0310 	add.w	r3, r7, #16
    2932:	2029      	movs	r0, #41	; 0x29
    2934:	4619      	mov	r1, r3
    2936:	f7ff fe93 	bl	2660 <sdc_cmd>
    293a:	4603      	mov	r3, r0
    293c:	77fb      	strb	r3, [r7, #31]
			if (!r1){
    293e:	7ffb      	ldrb	r3, [r7, #31]
    2940:	2b00      	cmp	r3, #0
    2942:	d100      	bne.n	2946 <sdcard_init+0x15a>
				break;
    2944:	e004      	b.n	2950 <sdcard_init+0x164>
		    }
		}while (ticks<t0);
    2946:	4b45      	ldr	r3, [pc, #276]	; (2a5c <sdcard_init+0x270>)
    2948:	681a      	ldr	r2, [r3, #0]
    294a:	69bb      	ldr	r3, [r7, #24]
    294c:	429a      	cmp	r2, r3
    294e:	d3de      	bcc.n	290e <sdcard_init+0x122>
		if (r1) {
    2950:	7ffb      	ldrb	r3, [r7, #31]
    2952:	2b00      	cmp	r3, #0
    2954:	d00a      	beq.n	296c <sdcard_init+0x180>
			sdc_status|=F_SDC_TO;
    2956:	4b3e      	ldr	r3, [pc, #248]	; (2a50 <sdcard_init+0x264>)
    2958:	881b      	ldrh	r3, [r3, #0]
    295a:	f043 0310 	orr.w	r3, r3, #16
    295e:	b29a      	uxth	r2, r3
    2960:	4b3b      	ldr	r3, [pc, #236]	; (2a50 <sdcard_init+0x264>)
    2962:	801a      	strh	r2, [r3, #0]
			sdcard_deselect();
    2964:	f7ff fe4e 	bl	2604 <sdcard_deselect>
			return 0;
    2968:	2300      	movs	r3, #0
    296a:	e06d      	b.n	2a48 <sdcard_init+0x25c>
		}
		if (sdc_status&F_SDC_V2){
    296c:	4b38      	ldr	r3, [pc, #224]	; (2a50 <sdcard_init+0x264>)
    296e:	881b      	ldrh	r3, [r3, #0]
    2970:	f003 0304 	and.w	r3, r3, #4
    2974:	2b00      	cmp	r3, #0
    2976:	d024      	beq.n	29c2 <sdcard_init+0x1d6>
//			print("carte V2, envoie CMD58\n");
	    // evoie commande cmd58 READ_OCR
			args[0]=0;args[1]=0;args[2]=0;args[3]=0;
    2978:	2300      	movs	r3, #0
    297a:	743b      	strb	r3, [r7, #16]
    297c:	2300      	movs	r3, #0
    297e:	747b      	strb	r3, [r7, #17]
    2980:	2300      	movs	r3, #0
    2982:	74bb      	strb	r3, [r7, #18]
    2984:	2300      	movs	r3, #0
    2986:	74fb      	strb	r3, [r7, #19]
			r1=sdc_cmd(READ_OCR,args);
    2988:	f107 0310 	add.w	r3, r7, #16
    298c:	203a      	movs	r0, #58	; 0x3a
    298e:	4619      	mov	r1, r3
    2990:	f7ff fe66 	bl	2660 <sdc_cmd>
    2994:	4603      	mov	r3, r0
    2996:	77fb      	strb	r3, [r7, #31]
			if (!r1){
    2998:	7ffb      	ldrb	r3, [r7, #31]
    299a:	2b00      	cmp	r3, #0
    299c:	d111      	bne.n	29c2 <sdcard_init+0x1d6>
			    spi_block_read(SDC_SPI,resp,4);
    299e:	463b      	mov	r3, r7
    29a0:	482d      	ldr	r0, [pc, #180]	; (2a58 <sdcard_init+0x26c>)
    29a2:	4619      	mov	r1, r3
    29a4:	2204      	movs	r2, #4
    29a6:	f000 f985 	bl	2cb4 <spi_block_read>
			    if (resp[0]&BIT6){
    29aa:	783b      	ldrb	r3, [r7, #0]
    29ac:	f003 0340 	and.w	r3, r3, #64	; 0x40
    29b0:	2b00      	cmp	r3, #0
    29b2:	d006      	beq.n	29c2 <sdcard_init+0x1d6>
					sdc_status|=F_SDC_HC; // block address
    29b4:	4b26      	ldr	r3, [pc, #152]	; (2a50 <sdcard_init+0x264>)
    29b6:	881b      	ldrh	r3, [r3, #0]
    29b8:	f043 0308 	orr.w	r3, r3, #8
    29bc:	b29a      	uxth	r2, r3
    29be:	4b24      	ldr	r3, [pc, #144]	; (2a50 <sdcard_init+0x264>)
    29c0:	801a      	strh	r2, [r3, #0]
				}
			}
		}
		// envoie CMD16 SET_BLOCKLEN
		if (!(sdc_status&F_SDC_HC)){
    29c2:	4b23      	ldr	r3, [pc, #140]	; (2a50 <sdcard_init+0x264>)
    29c4:	881b      	ldrh	r3, [r3, #0]
    29c6:	f003 0308 	and.w	r3, r3, #8
    29ca:	2b00      	cmp	r3, #0
    29cc:	d120      	bne.n	2a10 <sdcard_init+0x224>
			print("setting block size\n");
    29ce:	4824      	ldr	r0, [pc, #144]	; (2a60 <sdcard_init+0x274>)
    29d0:	f7fe fbf0 	bl	11b4 <print>
			args[0]=0;args[1]=0;args[2]=2;args[3]=0;
    29d4:	2300      	movs	r3, #0
    29d6:	743b      	strb	r3, [r7, #16]
    29d8:	2300      	movs	r3, #0
    29da:	747b      	strb	r3, [r7, #17]
    29dc:	2302      	movs	r3, #2
    29de:	74bb      	strb	r3, [r7, #18]
    29e0:	2300      	movs	r3, #0
    29e2:	74fb      	strb	r3, [r7, #19]
			if((r1=sdc_cmd(SET_BLOCKLEN,args))){
    29e4:	f107 0310 	add.w	r3, r7, #16
    29e8:	2010      	movs	r0, #16
    29ea:	4619      	mov	r1, r3
    29ec:	f7ff fe38 	bl	2660 <sdc_cmd>
    29f0:	4603      	mov	r3, r0
    29f2:	77fb      	strb	r3, [r7, #31]
    29f4:	7ffb      	ldrb	r3, [r7, #31]
    29f6:	2b00      	cmp	r3, #0
    29f8:	d00a      	beq.n	2a10 <sdcard_init+0x224>
				sdc_status|=F_SDC_IE;
    29fa:	4b15      	ldr	r3, [pc, #84]	; (2a50 <sdcard_init+0x264>)
    29fc:	881b      	ldrh	r3, [r3, #0]
    29fe:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    2a02:	b29a      	uxth	r2, r3
    2a04:	4b12      	ldr	r3, [pc, #72]	; (2a50 <sdcard_init+0x264>)
    2a06:	801a      	strh	r2, [r3, #0]
				sdcard_deselect();
    2a08:	f7ff fdfc 	bl	2604 <sdcard_deselect>
				return 0;
    2a0c:	2300      	movs	r3, #0
    2a0e:	e01b      	b.n	2a48 <sdcard_init+0x25c>
			}
		}
		r1=sdc_set_size();
    2a10:	f7ff fe9c 	bl	274c <sdc_set_size>
    2a14:	4603      	mov	r3, r0
    2a16:	77fb      	strb	r3, [r7, #31]
		sdc_status|=F_SDC_OK;
    2a18:	4b0d      	ldr	r3, [pc, #52]	; (2a50 <sdcard_init+0x264>)
    2a1a:	881b      	ldrh	r3, [r3, #0]
    2a1c:	f043 0302 	orr.w	r3, r3, #2
    2a20:	b29a      	uxth	r2, r3
    2a22:	4b0b      	ldr	r3, [pc, #44]	; (2a50 <sdcard_init+0x264>)
    2a24:	801a      	strh	r2, [r3, #0]
		_spi_disable(SDC_SPI);
    2a26:	4a0c      	ldr	r2, [pc, #48]	; (2a58 <sdcard_init+0x26c>)
    2a28:	4b0b      	ldr	r3, [pc, #44]	; (2a58 <sdcard_init+0x26c>)
    2a2a:	681b      	ldr	r3, [r3, #0]
    2a2c:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    2a30:	6013      	str	r3, [r2, #0]
		spi_baudrate(SDC_SPI,SDC_CLK_FAST);
    2a32:	4809      	ldr	r0, [pc, #36]	; (2a58 <sdcard_init+0x26c>)
    2a34:	2101      	movs	r1, #1
    2a36:	f000 f815 	bl	2a64 <spi_baudrate>
		_spi_enable(SDC_SPI);
    2a3a:	4a07      	ldr	r2, [pc, #28]	; (2a58 <sdcard_init+0x26c>)
    2a3c:	4b06      	ldr	r3, [pc, #24]	; (2a58 <sdcard_init+0x26c>)
    2a3e:	681b      	ldr	r3, [r3, #0]
    2a40:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    2a44:	6013      	str	r3, [r2, #0]
		return 1;
    2a46:	2301      	movs	r3, #1
}
    2a48:	4618      	mov	r0, r3
    2a4a:	3720      	adds	r7, #32
    2a4c:	46bd      	mov	sp, r7
    2a4e:	bd80      	pop	{r7, pc}
    2a50:	20000134 	.word	0x20000134
    2a54:	200000dc 	.word	0x200000dc
    2a58:	40013000 	.word	0x40013000
    2a5c:	200000e0 	.word	0x200000e0
    2a60:	00003cf8 	.word	0x00003cf8

00002a64 <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    2a64:	b480      	push	{r7}
    2a66:	b083      	sub	sp, #12
    2a68:	af00      	add	r7, sp, #0
    2a6a:	6078      	str	r0, [r7, #4]
    2a6c:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    2a6e:	687b      	ldr	r3, [r7, #4]
    2a70:	681b      	ldr	r3, [r3, #0]
    2a72:	f023 0238 	bic.w	r2, r3, #56	; 0x38
    2a76:	687b      	ldr	r3, [r7, #4]
    2a78:	601a      	str	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    2a7a:	687b      	ldr	r3, [r7, #4]
    2a7c:	681a      	ldr	r2, [r3, #0]
    2a7e:	683b      	ldr	r3, [r7, #0]
    2a80:	00db      	lsls	r3, r3, #3
    2a82:	431a      	orrs	r2, r3
    2a84:	687b      	ldr	r3, [r7, #4]
    2a86:	601a      	str	r2, [r3, #0]
}
    2a88:	370c      	adds	r7, #12
    2a8a:	46bd      	mov	sp, r7
    2a8c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2a90:	4770      	bx	lr
    2a92:	bf00      	nop

00002a94 <spi_config_port>:

void spi_config_port(spi_sfr_t *channel, int afio_cfg){
    2a94:	b580      	push	{r7, lr}
    2a96:	b082      	sub	sp, #8
    2a98:	af00      	add	r7, sp, #0
    2a9a:	6078      	str	r0, [r7, #4]
    2a9c:	6039      	str	r1, [r7, #0]
	RCC->APB2ENR|=RCC_APB2ENR_AFIOEN;
    2a9e:	4a33      	ldr	r2, [pc, #204]	; (2b6c <spi_config_port+0xd8>)
    2aa0:	4b32      	ldr	r3, [pc, #200]	; (2b6c <spi_config_port+0xd8>)
    2aa2:	699b      	ldr	r3, [r3, #24]
    2aa4:	f043 0301 	orr.w	r3, r3, #1
    2aa8:	6193      	str	r3, [r2, #24]
	if (channel==SPI1){
    2aaa:	687b      	ldr	r3, [r7, #4]
    2aac:	4a30      	ldr	r2, [pc, #192]	; (2b70 <spi_config_port+0xdc>)
    2aae:	4293      	cmp	r3, r2
    2ab0:	d13e      	bne.n	2b30 <spi_config_port+0x9c>
		if (!afio_cfg){
    2ab2:	683b      	ldr	r3, [r7, #0]
    2ab4:	2b00      	cmp	r3, #0
    2ab6:	d11a      	bne.n	2aee <spi_config_port+0x5a>
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    2ab8:	4a2c      	ldr	r2, [pc, #176]	; (2b6c <spi_config_port+0xd8>)
    2aba:	4b2c      	ldr	r3, [pc, #176]	; (2b6c <spi_config_port+0xd8>)
    2abc:	699b      	ldr	r3, [r3, #24]
    2abe:	f043 0304 	orr.w	r3, r3, #4
    2ac2:	6193      	str	r3, [r2, #24]
			// configuration port
			// PA4 -> NSS output (push-pull)
			config_pin(PORTA,4,OUTPUT_PP_FAST);
    2ac4:	482b      	ldr	r0, [pc, #172]	; (2b74 <spi_config_port+0xe0>)
    2ac6:	2104      	movs	r1, #4
    2ac8:	2203      	movs	r2, #3
    2aca:	f7ff f94f 	bl	1d6c <config_pin>
			// PA5 -> SCK output (push-pull)
			config_pin(PORTA,5,OUTPUT_ALT_PP_FAST);
    2ace:	4829      	ldr	r0, [pc, #164]	; (2b74 <spi_config_port+0xe0>)
    2ad0:	2105      	movs	r1, #5
    2ad2:	220b      	movs	r2, #11
    2ad4:	f7ff f94a 	bl	1d6c <config_pin>
			// PA6 -> MISO input (floating)
			config_pin(PORTA,6,INPUT_FLOAT);
    2ad8:	4826      	ldr	r0, [pc, #152]	; (2b74 <spi_config_port+0xe0>)
    2ada:	2106      	movs	r1, #6
    2adc:	2204      	movs	r2, #4
    2ade:	f7ff f945 	bl	1d6c <config_pin>
			// PA7 -> MOSI output (push-pull)
			config_pin(PORTA,7,OUTPUT_ALT_PP_FAST);
    2ae2:	4824      	ldr	r0, [pc, #144]	; (2b74 <spi_config_port+0xe0>)
    2ae4:	2107      	movs	r1, #7
    2ae6:	220b      	movs	r2, #11
    2ae8:	f7ff f940 	bl	1d6c <config_pin>
    2aec:	e03a      	b.n	2b64 <spi_config_port+0xd0>
		}else{// mappage I/O alternatif
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPBEN+RCC_APB2ENR_IOPAEN+RCC_APB2ENR_AFIOEN;
    2aee:	4a1f      	ldr	r2, [pc, #124]	; (2b6c <spi_config_port+0xd8>)
    2af0:	4b1e      	ldr	r3, [pc, #120]	; (2b6c <spi_config_port+0xd8>)
    2af2:	699b      	ldr	r3, [r3, #24]
    2af4:	f043 030d 	orr.w	r3, r3, #13
    2af8:	6193      	str	r3, [r2, #24]
			AFIO->MAPR|=AFIO_MAPR_SPI1_REMAP;
    2afa:	4a1f      	ldr	r2, [pc, #124]	; (2b78 <spi_config_port+0xe4>)
    2afc:	4b1e      	ldr	r3, [pc, #120]	; (2b78 <spi_config_port+0xe4>)
    2afe:	685b      	ldr	r3, [r3, #4]
    2b00:	f043 0301 	orr.w	r3, r3, #1
    2b04:	6053      	str	r3, [r2, #4]
			// configuration port
			// PA4 -> NSS output (push-pull),  alt PA15
			config_pin(PORTA,15,OUTPUT_PP_FAST);
    2b06:	481b      	ldr	r0, [pc, #108]	; (2b74 <spi_config_port+0xe0>)
    2b08:	210f      	movs	r1, #15
    2b0a:	2203      	movs	r2, #3
    2b0c:	f7ff f92e 	bl	1d6c <config_pin>
			// PA5 -> SCK output (push-pull),  alt PB3
			config_pin(PORTB,3,OUTPUT_ALT_PP_FAST);
    2b10:	481a      	ldr	r0, [pc, #104]	; (2b7c <spi_config_port+0xe8>)
    2b12:	2103      	movs	r1, #3
    2b14:	220b      	movs	r2, #11
    2b16:	f7ff f929 	bl	1d6c <config_pin>
			// PA6 -> MISO input (floating),   alt PB4
			config_pin(PORTB,4,INPUT_FLOAT);
    2b1a:	4818      	ldr	r0, [pc, #96]	; (2b7c <spi_config_port+0xe8>)
    2b1c:	2104      	movs	r1, #4
    2b1e:	2204      	movs	r2, #4
    2b20:	f7ff f924 	bl	1d6c <config_pin>
			// PA7 -> MOSI output (push-pull), alt PB5
			config_pin(PORTB,5,OUTPUT_ALT_PP_FAST);
    2b24:	4815      	ldr	r0, [pc, #84]	; (2b7c <spi_config_port+0xe8>)
    2b26:	2105      	movs	r1, #5
    2b28:	220b      	movs	r2, #11
    2b2a:	f7ff f91f 	bl	1d6c <config_pin>
    2b2e:	e019      	b.n	2b64 <spi_config_port+0xd0>
		}
	}else{
		// activation clock du port
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    2b30:	4a0e      	ldr	r2, [pc, #56]	; (2b6c <spi_config_port+0xd8>)
    2b32:	4b0e      	ldr	r3, [pc, #56]	; (2b6c <spi_config_port+0xd8>)
    2b34:	699b      	ldr	r3, [r3, #24]
    2b36:	f043 0308 	orr.w	r3, r3, #8
    2b3a:	6193      	str	r3, [r2, #24]
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(PORTB,2,OUTPUT_PP_FAST);
    2b3c:	480f      	ldr	r0, [pc, #60]	; (2b7c <spi_config_port+0xe8>)
    2b3e:	2102      	movs	r1, #2
    2b40:	2203      	movs	r2, #3
    2b42:	f7ff f913 	bl	1d6c <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(PORTB,13,OUTPUT_ALT_PP_FAST);
    2b46:	480d      	ldr	r0, [pc, #52]	; (2b7c <spi_config_port+0xe8>)
    2b48:	210d      	movs	r1, #13
    2b4a:	220b      	movs	r2, #11
    2b4c:	f7ff f90e 	bl	1d6c <config_pin>
		// PB14 MISO input (floating)
		config_pin(PORTB,14,INPUT_FLOAT);
    2b50:	480a      	ldr	r0, [pc, #40]	; (2b7c <spi_config_port+0xe8>)
    2b52:	210e      	movs	r1, #14
    2b54:	2204      	movs	r2, #4
    2b56:	f7ff f909 	bl	1d6c <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    2b5a:	4808      	ldr	r0, [pc, #32]	; (2b7c <spi_config_port+0xe8>)
    2b5c:	210f      	movs	r1, #15
    2b5e:	220b      	movs	r2, #11
    2b60:	f7ff f904 	bl	1d6c <config_pin>
	}
}
    2b64:	3708      	adds	r7, #8
    2b66:	46bd      	mov	sp, r7
    2b68:	bd80      	pop	{r7, pc}
    2b6a:	bf00      	nop
    2b6c:	40021000 	.word	0x40021000
    2b70:	40013000 	.word	0x40013000
    2b74:	40010800 	.word	0x40010800
    2b78:	40010000 	.word	0x40010000
    2b7c:	40010c00 	.word	0x40010c00

00002b80 <spi_init>:

void spi_init(spi_sfr_t* channel, unsigned baud,unsigned mode, int afio_cfg){
    2b80:	b580      	push	{r7, lr}
    2b82:	b084      	sub	sp, #16
    2b84:	af00      	add	r7, sp, #0
    2b86:	60f8      	str	r0, [r7, #12]
    2b88:	60b9      	str	r1, [r7, #8]
    2b8a:	607a      	str	r2, [r7, #4]
    2b8c:	603b      	str	r3, [r7, #0]
	spi_config_port(channel,afio_cfg);
    2b8e:	68f8      	ldr	r0, [r7, #12]
    2b90:	6839      	ldr	r1, [r7, #0]
    2b92:	f7ff ff7f 	bl	2a94 <spi_config_port>
	// activation clock SPI
	if (channel==SPI1){
    2b96:	68fb      	ldr	r3, [r7, #12]
    2b98:	4a0f      	ldr	r2, [pc, #60]	; (2bd8 <spi_init+0x58>)
    2b9a:	4293      	cmp	r3, r2
    2b9c:	d106      	bne.n	2bac <spi_init+0x2c>
		RCC->APB2ENR|=RCC_APB2ENR_SPI1EN;
    2b9e:	4a0f      	ldr	r2, [pc, #60]	; (2bdc <spi_init+0x5c>)
    2ba0:	4b0e      	ldr	r3, [pc, #56]	; (2bdc <spi_init+0x5c>)
    2ba2:	699b      	ldr	r3, [r3, #24]
    2ba4:	f443 5380 	orr.w	r3, r3, #4096	; 0x1000
    2ba8:	6193      	str	r3, [r2, #24]
    2baa:	e005      	b.n	2bb8 <spi_init+0x38>
	}else{
		RCC->APB1ENR|=RCC_APB1ENR_SPI2EN;
    2bac:	4a0b      	ldr	r2, [pc, #44]	; (2bdc <spi_init+0x5c>)
    2bae:	4b0b      	ldr	r3, [pc, #44]	; (2bdc <spi_init+0x5c>)
    2bb0:	69db      	ldr	r3, [r3, #28]
    2bb2:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    2bb6:	61d3      	str	r3, [r2, #28]
	}
	channel->CR1=mode;
    2bb8:	68fb      	ldr	r3, [r7, #12]
    2bba:	687a      	ldr	r2, [r7, #4]
    2bbc:	601a      	str	r2, [r3, #0]
	spi_baudrate(channel,baud);
    2bbe:	68f8      	ldr	r0, [r7, #12]
    2bc0:	68b9      	ldr	r1, [r7, #8]
    2bc2:	f7ff ff4f 	bl	2a64 <spi_baudrate>
	_spi_enable(channel);
    2bc6:	68fb      	ldr	r3, [r7, #12]
    2bc8:	681b      	ldr	r3, [r3, #0]
    2bca:	f043 0240 	orr.w	r2, r3, #64	; 0x40
    2bce:	68fb      	ldr	r3, [r7, #12]
    2bd0:	601a      	str	r2, [r3, #0]
}
    2bd2:	3710      	adds	r7, #16
    2bd4:	46bd      	mov	sp, r7
    2bd6:	bd80      	pop	{r7, pc}
    2bd8:	40013000 	.word	0x40013000
    2bdc:	40021000 	.word	0x40021000

00002be0 <spi_write>:


// envoie un octet via le canla SPI
inline void spi_write(spi_sfr_t* channel, uint8_t b){
    2be0:	b480      	push	{r7}
    2be2:	b085      	sub	sp, #20
    2be4:	af00      	add	r7, sp, #0
    2be6:	6078      	str	r0, [r7, #4]
    2be8:	460b      	mov	r3, r1
    2bea:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	while (!(channel->SR&SPI_SR_TXE));
    2bec:	bf00      	nop
    2bee:	687b      	ldr	r3, [r7, #4]
    2bf0:	689b      	ldr	r3, [r3, #8]
    2bf2:	f003 0302 	and.w	r3, r3, #2
    2bf6:	2b00      	cmp	r3, #0
    2bf8:	d0f9      	beq.n	2bee <spi_write+0xe>
	channel->DR=b;
    2bfa:	78fa      	ldrb	r2, [r7, #3]
    2bfc:	687b      	ldr	r3, [r7, #4]
    2bfe:	60da      	str	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    2c00:	bf00      	nop
    2c02:	687b      	ldr	r3, [r7, #4]
    2c04:	689b      	ldr	r3, [r3, #8]
    2c06:	f003 0301 	and.w	r3, r3, #1
    2c0a:	2b00      	cmp	r3, #0
    2c0c:	d0f9      	beq.n	2c02 <spi_write+0x22>
	rx=(uint8_t)channel->DR;
    2c0e:	687b      	ldr	r3, [r7, #4]
    2c10:	68db      	ldr	r3, [r3, #12]
    2c12:	73fb      	strb	r3, [r7, #15]
}
    2c14:	3714      	adds	r7, #20
    2c16:	46bd      	mov	sp, r7
    2c18:	f85d 7b04 	ldr.w	r7, [sp], #4
    2c1c:	4770      	bx	lr
    2c1e:	bf00      	nop

00002c20 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    2c20:	b480      	push	{r7}
    2c22:	b085      	sub	sp, #20
    2c24:	af00      	add	r7, sp, #0
    2c26:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	while (!(channel->SR&SPI_SR_TXE));
    2c28:	bf00      	nop
    2c2a:	687b      	ldr	r3, [r7, #4]
    2c2c:	689b      	ldr	r3, [r3, #8]
    2c2e:	f003 0302 	and.w	r3, r3, #2
    2c32:	2b00      	cmp	r3, #0
    2c34:	d0f9      	beq.n	2c2a <spi_read+0xa>
	channel->DR=255;
    2c36:	687b      	ldr	r3, [r7, #4]
    2c38:	22ff      	movs	r2, #255	; 0xff
    2c3a:	60da      	str	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    2c3c:	bf00      	nop
    2c3e:	687b      	ldr	r3, [r7, #4]
    2c40:	689b      	ldr	r3, [r3, #8]
    2c42:	f003 0301 	and.w	r3, r3, #1
    2c46:	2b00      	cmp	r3, #0
    2c48:	d0f9      	beq.n	2c3e <spi_read+0x1e>
	rx=(uint8_t)channel->DR;
    2c4a:	687b      	ldr	r3, [r7, #4]
    2c4c:	68db      	ldr	r3, [r3, #12]
    2c4e:	73fb      	strb	r3, [r7, #15]
	return rx;
    2c50:	7bfb      	ldrb	r3, [r7, #15]
}
    2c52:	4618      	mov	r0, r3
    2c54:	3714      	adds	r7, #20
    2c56:	46bd      	mov	sp, r7
    2c58:	f85d 7b04 	ldr.w	r7, [sp], #4
    2c5c:	4770      	bx	lr
    2c5e:	bf00      	nop

00002c60 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    2c60:	b480      	push	{r7}
    2c62:	b087      	sub	sp, #28
    2c64:	af00      	add	r7, sp, #0
    2c66:	60f8      	str	r0, [r7, #12]
    2c68:	60b9      	str	r1, [r7, #8]
    2c6a:	607a      	str	r2, [r7, #4]
	uint8_t rx;
	while (count){
    2c6c:	e010      	b.n	2c90 <spi_block_write+0x30>
		channel->DR=*buffer++;
    2c6e:	68bb      	ldr	r3, [r7, #8]
    2c70:	1c5a      	adds	r2, r3, #1
    2c72:	60ba      	str	r2, [r7, #8]
    2c74:	781b      	ldrb	r3, [r3, #0]
    2c76:	461a      	mov	r2, r3
    2c78:	68fb      	ldr	r3, [r7, #12]
    2c7a:	60da      	str	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    2c7c:	bf00      	nop
    2c7e:	68fb      	ldr	r3, [r7, #12]
    2c80:	689b      	ldr	r3, [r3, #8]
    2c82:	f003 0302 	and.w	r3, r3, #2
    2c86:	2b00      	cmp	r3, #0
    2c88:	d0f9      	beq.n	2c7e <spi_block_write+0x1e>
		count--;
    2c8a:	687b      	ldr	r3, [r7, #4]
    2c8c:	3b01      	subs	r3, #1
    2c8e:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	uint8_t rx;
	while (count){
    2c90:	687b      	ldr	r3, [r7, #4]
    2c92:	2b00      	cmp	r3, #0
    2c94:	d1eb      	bne.n	2c6e <spi_block_write+0xe>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	while (channel->SR&SPI_SR_BSY);
    2c96:	bf00      	nop
    2c98:	68fb      	ldr	r3, [r7, #12]
    2c9a:	689b      	ldr	r3, [r3, #8]
    2c9c:	f003 0380 	and.w	r3, r3, #128	; 0x80
    2ca0:	2b00      	cmp	r3, #0
    2ca2:	d1f9      	bne.n	2c98 <spi_block_write+0x38>
	rx=(uint8_t)channel->DR;
    2ca4:	68fb      	ldr	r3, [r7, #12]
    2ca6:	68db      	ldr	r3, [r3, #12]
    2ca8:	75fb      	strb	r3, [r7, #23]
}
    2caa:	371c      	adds	r7, #28
    2cac:	46bd      	mov	sp, r7
    2cae:	f85d 7b04 	ldr.w	r7, [sp], #4
    2cb2:	4770      	bx	lr

00002cb4 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    2cb4:	b480      	push	{r7}
    2cb6:	b085      	sub	sp, #20
    2cb8:	af00      	add	r7, sp, #0
    2cba:	60f8      	str	r0, [r7, #12]
    2cbc:	60b9      	str	r1, [r7, #8]
    2cbe:	607a      	str	r2, [r7, #4]
	while (count){
    2cc0:	e013      	b.n	2cea <spi_block_read+0x36>
		channel->DR=0;
    2cc2:	68fb      	ldr	r3, [r7, #12]
    2cc4:	2200      	movs	r2, #0
    2cc6:	60da      	str	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    2cc8:	bf00      	nop
    2cca:	68fb      	ldr	r3, [r7, #12]
    2ccc:	689b      	ldr	r3, [r3, #8]
    2cce:	f003 0301 	and.w	r3, r3, #1
    2cd2:	2b00      	cmp	r3, #0
    2cd4:	d0f9      	beq.n	2cca <spi_block_read+0x16>
		*buffer++=(uint8_t)channel->DR;
    2cd6:	68bb      	ldr	r3, [r7, #8]
    2cd8:	1c5a      	adds	r2, r3, #1
    2cda:	60ba      	str	r2, [r7, #8]
    2cdc:	68fa      	ldr	r2, [r7, #12]
    2cde:	68d2      	ldr	r2, [r2, #12]
    2ce0:	b2d2      	uxtb	r2, r2
    2ce2:	701a      	strb	r2, [r3, #0]
		count--;
    2ce4:	687b      	ldr	r3, [r7, #4]
    2ce6:	3b01      	subs	r3, #1
    2ce8:	607b      	str	r3, [r7, #4]
	rx=(uint8_t)channel->DR;
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	while (count){
    2cea:	687b      	ldr	r3, [r7, #4]
    2cec:	2b00      	cmp	r3, #0
    2cee:	d1e8      	bne.n	2cc2 <spi_block_read+0xe>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
}
    2cf0:	3714      	adds	r7, #20
    2cf2:	46bd      	mov	sp, r7
    2cf4:	f85d 7b04 	ldr.w	r7, [sp], #4
    2cf8:	4770      	bx	lr
    2cfa:	bf00      	nop

00002cfc <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    2cfc:	4b01      	ldr	r3, [pc, #4]	; (2d04 <reset_mcu+0x8>)
    2cfe:	4a02      	ldr	r2, [pc, #8]	; (2d08 <reset_mcu+0xc>)
    2d00:	601a      	str	r2, [r3, #0]
    2d02:	bf00      	nop
    2d04:	e000ed0c 	.word	0xe000ed0c
    2d08:	05fa0004 	.word	0x05fa0004

00002d0c <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    2d0c:	b580      	push	{r7, lr}
    2d0e:	b082      	sub	sp, #8
    2d10:	af00      	add	r7, sp, #0
    2d12:	6078      	str	r0, [r7, #4]
    2d14:	6039      	str	r1, [r7, #0]
	print(msg);
    2d16:	6878      	ldr	r0, [r7, #4]
    2d18:	f7fe fa4c 	bl	11b4 <print>
	print("at address ");
    2d1c:	4814      	ldr	r0, [pc, #80]	; (2d70 <print_fault+0x64>)
    2d1e:	f7fe fa49 	bl	11b4 <print>
	if (adr) {
    2d22:	683b      	ldr	r3, [r7, #0]
    2d24:	2b00      	cmp	r3, #0
    2d26:	d002      	beq.n	2d2e <print_fault+0x22>
		print_hex(adr);
    2d28:	6838      	ldr	r0, [r7, #0]
    2d2a:	f7fe fb8b 	bl	1444 <print_hex>
	};
	conout(CR);
    2d2e:	200d      	movs	r0, #13
    2d30:	f7fe fa26 	bl	1180 <conout>
	print("UFSR=");
    2d34:	480f      	ldr	r0, [pc, #60]	; (2d74 <print_fault+0x68>)
    2d36:	f7fe fa3d 	bl	11b4 <print>
	print_hex(CFSR->fsr.usageFalt);
    2d3a:	4b0f      	ldr	r3, [pc, #60]	; (2d78 <print_fault+0x6c>)
    2d3c:	681b      	ldr	r3, [r3, #0]
    2d3e:	0c1b      	lsrs	r3, r3, #16
    2d40:	b29b      	uxth	r3, r3
    2d42:	4618      	mov	r0, r3
    2d44:	f7fe fb7e 	bl	1444 <print_hex>
	print(", BFSR=");
    2d48:	480c      	ldr	r0, [pc, #48]	; (2d7c <print_fault+0x70>)
    2d4a:	f7fe fa33 	bl	11b4 <print>
	print_hex(CFSR->fsr.busFault);
    2d4e:	4b0a      	ldr	r3, [pc, #40]	; (2d78 <print_fault+0x6c>)
    2d50:	681b      	ldr	r3, [r3, #0]
    2d52:	0a1b      	lsrs	r3, r3, #8
    2d54:	b2db      	uxtb	r3, r3
    2d56:	4618      	mov	r0, r3
    2d58:	f7fe fb74 	bl	1444 <print_hex>
	print(", MMFSR=");
    2d5c:	4808      	ldr	r0, [pc, #32]	; (2d80 <print_fault+0x74>)
    2d5e:	f7fe fa29 	bl	11b4 <print>
	print_hex(CFSR->fsr.mmFault);
    2d62:	4b05      	ldr	r3, [pc, #20]	; (2d78 <print_fault+0x6c>)
    2d64:	681b      	ldr	r3, [r3, #0]
    2d66:	b2db      	uxtb	r3, r3
    2d68:	4618      	mov	r0, r3
    2d6a:	f7fe fb6b 	bl	1444 <print_hex>
	while(1);
    2d6e:	e7fe      	b.n	2d6e <print_fault+0x62>
    2d70:	00003d0c 	.word	0x00003d0c
    2d74:	00003d18 	.word	0x00003d18
    2d78:	e000ed28 	.word	0xe000ed28
    2d7c:	00003d20 	.word	0x00003d20
    2d80:	00003d28 	.word	0x00003d28

00002d84 <config_systicks>:


// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
#define MSEC_DLY FCLK/8/1000
void config_systicks(){
    2d84:	b580      	push	{r7, lr}
    2d86:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,9);
    2d88:	f06f 000e 	mvn.w	r0, #14
    2d8c:	2109      	movs	r1, #9
    2d8e:	f7ff fbbb 	bl	2508 <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
    2d92:	4b04      	ldr	r3, [pc, #16]	; (2da4 <config_systicks+0x20>)
    2d94:	f641 723f 	movw	r2, #7999	; 0x1f3f
    2d98:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
    2d9a:	4b03      	ldr	r3, [pc, #12]	; (2da8 <config_systicks+0x24>)
    2d9c:	2203      	movs	r2, #3
    2d9e:	601a      	str	r2, [r3, #0]
}
    2da0:	bd80      	pop	{r7, pc}
    2da2:	bf00      	nop
    2da4:	e000e014 	.word	0xe000e014
    2da8:	e000e010 	.word	0xe000e010

00002dac <pause>:



void pause(unsigned msec){
    2dac:	b480      	push	{r7}
    2dae:	b083      	sub	sp, #12
    2db0:	af00      	add	r7, sp, #0
    2db2:	6078      	str	r0, [r7, #4]
	timer=msec;
    2db4:	4a06      	ldr	r2, [pc, #24]	; (2dd0 <pause+0x24>)
    2db6:	687b      	ldr	r3, [r7, #4]
    2db8:	6013      	str	r3, [r2, #0]
	while (timer);
    2dba:	bf00      	nop
    2dbc:	4b04      	ldr	r3, [pc, #16]	; (2dd0 <pause+0x24>)
    2dbe:	681b      	ldr	r3, [r3, #0]
    2dc0:	2b00      	cmp	r3, #0
    2dc2:	d1fb      	bne.n	2dbc <pause+0x10>
}
    2dc4:	370c      	adds	r7, #12
    2dc6:	46bd      	mov	sp, r7
    2dc8:	f85d 7b04 	ldr.w	r7, [sp], #4
    2dcc:	4770      	bx	lr
    2dce:	bf00      	nop
    2dd0:	200000e4 	.word	0x200000e4

00002dd4 <STK_handler>:


// interruption coretimer
void STK_handler(){
    2dd4:	b480      	push	{r7}
    2dd6:	af00      	add	r7, sp, #0
	ticks++;
    2dd8:	4b08      	ldr	r3, [pc, #32]	; (2dfc <STK_handler+0x28>)
    2dda:	681b      	ldr	r3, [r3, #0]
    2ddc:	3301      	adds	r3, #1
    2dde:	4a07      	ldr	r2, [pc, #28]	; (2dfc <STK_handler+0x28>)
    2de0:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
    2de2:	4b07      	ldr	r3, [pc, #28]	; (2e00 <STK_handler+0x2c>)
    2de4:	681b      	ldr	r3, [r3, #0]
    2de6:	2b00      	cmp	r3, #0
    2de8:	d004      	beq.n	2df4 <STK_handler+0x20>
    2dea:	4b05      	ldr	r3, [pc, #20]	; (2e00 <STK_handler+0x2c>)
    2dec:	681b      	ldr	r3, [r3, #0]
    2dee:	3b01      	subs	r3, #1
    2df0:	4a03      	ldr	r2, [pc, #12]	; (2e00 <STK_handler+0x2c>)
    2df2:	6013      	str	r3, [r2, #0]
}
    2df4:	46bd      	mov	sp, r7
    2df6:	f85d 7b04 	ldr.w	r7, [sp], #4
    2dfa:	4770      	bx	lr
    2dfc:	200000e0 	.word	0x200000e0
    2e00:	200000e4 	.word	0x200000e4

00002e04 <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    2e04:	b480      	push	{r7}
    2e06:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    2e08:	2300      	movs	r3, #0
    2e0a:	2200      	movs	r2, #0
    2e0c:	4618      	mov	r0, r3
    2e0e:	4611      	mov	r1, r2
    2e10:	df02      	svc	2
}
    2e12:	46bd      	mov	sp, r7
    2e14:	f85d 7b04 	ldr.w	r7, [sp], #4
    2e18:	4770      	bx	lr
    2e1a:	bf00      	nop

00002e1c <tvout_init>:

#define _enable_dma()  DMA1[DMACH5].ccr|=DMA_CCR_EN
#define _disable_dma() DMA1[DMACH5].ccr&=~DMA_CCR_EN
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN;
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN; 
 void tvout_init(){
    2e1c:	b580      	push	{r7, lr}
    2e1e:	b082      	sub	sp, #8
    2e20:	af00      	add	r7, sp, #0
	//sortie sync sur PA8
	config_pin(PORTA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    2e22:	484f      	ldr	r0, [pc, #316]	; (2f60 <tvout_init+0x144>)
    2e24:	2108      	movs	r1, #8
    2e26:	220a      	movs	r2, #10
    2e28:	f7fe ffa0 	bl	1d6c <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    2e2c:	484d      	ldr	r0, [pc, #308]	; (2f64 <tvout_init+0x148>)
    2e2e:	210f      	movs	r1, #15
    2e30:	220b      	movs	r2, #11
    2e32:	f7fe ff9b 	bl	1d6c <config_pin>
	PORTB->BRR=BIT15;
    2e36:	4b4b      	ldr	r3, [pc, #300]	; (2f64 <tvout_init+0x148>)
    2e38:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    2e3c:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
    2e3e:	4a4a      	ldr	r2, [pc, #296]	; (2f68 <tvout_init+0x14c>)
    2e40:	4b49      	ldr	r3, [pc, #292]	; (2f68 <tvout_init+0x14c>)
    2e42:	699b      	ldr	r3, [r3, #24]
    2e44:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    2e48:	6193      	str	r3, [r2, #24]
	// clock source division
	*TIMER1_PSC=0;
    2e4a:	4b48      	ldr	r3, [pc, #288]	; (2f6c <tvout_init+0x150>)
    2e4c:	2200      	movs	r2, #0
    2e4e:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    2e50:	4b47      	ldr	r3, [pc, #284]	; (2f70 <tvout_init+0x154>)
    2e52:	f640 72ff 	movw	r2, #4095	; 0xfff
    2e56:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    2e58:	4b46      	ldr	r3, [pc, #280]	; (2f74 <tvout_init+0x158>)
    2e5a:	f240 122b 	movw	r2, #299	; 0x12b
    2e5e:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    2e60:	4b45      	ldr	r3, [pc, #276]	; (2f78 <tvout_init+0x15c>)
    2e62:	681a      	ldr	r2, [r3, #0]
    2e64:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    2e68:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    2e6c:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    2e6e:	4b42      	ldr	r3, [pc, #264]	; (2f78 <tvout_init+0x15c>)
    2e70:	681a      	ldr	r2, [r3, #0]
    2e72:	f042 0208 	orr.w	r2, r2, #8
    2e76:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    2e78:	4b40      	ldr	r3, [pc, #256]	; (2f7c <tvout_init+0x160>)
    2e7a:	681a      	ldr	r2, [r3, #0]
    2e7c:	f042 0201 	orr.w	r2, r2, #1
    2e80:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    2e82:	4b3e      	ldr	r3, [pc, #248]	; (2f7c <tvout_init+0x160>)
    2e84:	681a      	ldr	r2, [r3, #0]
    2e86:	f042 0202 	orr.w	r2, r2, #2
    2e8a:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    2e8c:	4a3c      	ldr	r2, [pc, #240]	; (2f80 <tvout_init+0x164>)
    2e8e:	8813      	ldrh	r3, [r2, #0]
    2e90:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    2e94:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    2e98:	8013      	strh	r3, [r2, #0]
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    2e9a:	4b3a      	ldr	r3, [pc, #232]	; (2f84 <tvout_init+0x168>)
    2e9c:	681a      	ldr	r2, [r3, #0]
    2e9e:	f042 0201 	orr.w	r2, r2, #1
    2ea2:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    2ea4:	4b38      	ldr	r3, [pc, #224]	; (2f88 <tvout_init+0x16c>)
    2ea6:	f640 324c 	movw	r2, #2892	; 0xb4c
    2eaa:	601a      	str	r2, [r3, #0]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    2eac:	4b37      	ldr	r3, [pc, #220]	; (2f8c <tvout_init+0x170>)
    2eae:	f243 5292 	movw	r2, #13714	; 0x3592
    2eb2:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    2eb4:	4b35      	ldr	r3, [pc, #212]	; (2f8c <tvout_init+0x170>)
    2eb6:	4a36      	ldr	r2, [pc, #216]	; (2f90 <tvout_init+0x174>)
    2eb8:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    2eba:	4a33      	ldr	r2, [pc, #204]	; (2f88 <tvout_init+0x16c>)
    2ebc:	4b32      	ldr	r3, [pc, #200]	; (2f88 <tvout_init+0x16c>)
    2ebe:	685b      	ldr	r3, [r3, #4]
    2ec0:	f043 0302 	orr.w	r3, r3, #2
    2ec4:	6053      	str	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,1);
    2ec6:	200f      	movs	r0, #15
    2ec8:	2101      	movs	r1, #1
    2eca:	f7ff fb1d 	bl	2508 <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    2ece:	200f      	movs	r0, #15
    2ed0:	f7ff fa5e 	bl	2390 <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    2ed4:	4b2f      	ldr	r3, [pc, #188]	; (2f94 <tvout_init+0x178>)
    2ed6:	681a      	ldr	r2, [r3, #0]
    2ed8:	f042 0202 	orr.w	r2, r2, #2
    2edc:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TIM1_CC,1);
    2ede:	201b      	movs	r0, #27
    2ee0:	2101      	movs	r1, #1
    2ee2:	f7ff fb11 	bl	2508 <set_int_priority>
	enable_interrupt(IRQ_TIM1_CC);
    2ee6:	201b      	movs	r0, #27
    2ee8:	f7ff fa52 	bl	2390 <enable_interrupt>
	//video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    2eec:	2300      	movs	r3, #0
    2eee:	607b      	str	r3, [r7, #4]
    2ef0:	e011      	b.n	2f16 <tvout_init+0xfa>
		video_buffer[i]=0xffff;
    2ef2:	4a29      	ldr	r2, [pc, #164]	; (2f98 <tvout_init+0x17c>)
    2ef4:	687b      	ldr	r3, [r7, #4]
    2ef6:	f64f 71ff 	movw	r1, #65535	; 0xffff
    2efa:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
    2efe:	687b      	ldr	r3, [r7, #4]
    2f00:	f503 5395 	add.w	r3, r3, #4768	; 0x12a0
    2f04:	330c      	adds	r3, #12
    2f06:	4a24      	ldr	r2, [pc, #144]	; (2f98 <tvout_init+0x17c>)
    2f08:	f64f 71ff 	movw	r1, #65535	; 0xffff
    2f0c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	TIMER1_DIER->fld.cc1ie=1;
	set_int_priority(IRQ_TIM1_CC,1);
	enable_interrupt(IRQ_TIM1_CC);
	//video test
	int i;
	for (i=0;i<ROW_SIZE;i++){
    2f10:	687b      	ldr	r3, [r7, #4]
    2f12:	3301      	adds	r3, #1
    2f14:	607b      	str	r3, [r7, #4]
    2f16:	687b      	ldr	r3, [r7, #4]
    2f18:	2b13      	cmp	r3, #19
    2f1a:	ddea      	ble.n	2ef2 <tvout_init+0xd6>
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    2f1c:	2301      	movs	r3, #1
    2f1e:	607b      	str	r3, [r7, #4]
    2f20:	e018      	b.n	2f54 <tvout_init+0x138>
		video_buffer[i*ROW_SIZE]=0x8000;
    2f22:	687a      	ldr	r2, [r7, #4]
    2f24:	4613      	mov	r3, r2
    2f26:	009b      	lsls	r3, r3, #2
    2f28:	4413      	add	r3, r2
    2f2a:	009b      	lsls	r3, r3, #2
    2f2c:	461a      	mov	r2, r3
    2f2e:	4b1a      	ldr	r3, [pc, #104]	; (2f98 <tvout_init+0x17c>)
    2f30:	f44f 4100 	mov.w	r1, #32768	; 0x8000
    2f34:	f823 1012 	strh.w	r1, [r3, r2, lsl #1]
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
    2f38:	687b      	ldr	r3, [r7, #4]
    2f3a:	1c5a      	adds	r2, r3, #1
    2f3c:	4613      	mov	r3, r2
    2f3e:	009b      	lsls	r3, r3, #2
    2f40:	4413      	add	r3, r2
    2f42:	009b      	lsls	r3, r3, #2
    2f44:	3b01      	subs	r3, #1
    2f46:	4a14      	ldr	r2, [pc, #80]	; (2f98 <tvout_init+0x17c>)
    2f48:	2101      	movs	r1, #1
    2f4a:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	int i;
	for (i=0;i<ROW_SIZE;i++){
		video_buffer[i]=0xffff;
		video_buffer[i+(ROW_SIZE*(VRES-1))]=0xffff;
	}
	for(i=1;i<(VRES-2);i++){
    2f4e:	687b      	ldr	r3, [r7, #4]
    2f50:	3301      	adds	r3, #1
    2f52:	607b      	str	r3, [r7, #4]
    2f54:	687b      	ldr	r3, [r7, #4]
    2f56:	2bed      	cmp	r3, #237	; 0xed
    2f58:	dde3      	ble.n	2f22 <tvout_init+0x106>
		video_buffer[i*ROW_SIZE]=0x8000;
		video_buffer[i*ROW_SIZE+ROW_SIZE-1]=1;
	}
	// test end */
 }
    2f5a:	3708      	adds	r7, #8
    2f5c:	46bd      	mov	sp, r7
    2f5e:	bd80      	pop	{r7, pc}
    2f60:	40010800 	.word	0x40010800
    2f64:	40010c00 	.word	0x40010c00
    2f68:	40021000 	.word	0x40021000
    2f6c:	40012c28 	.word	0x40012c28
    2f70:	40012c2c 	.word	0x40012c2c
    2f74:	40012c34 	.word	0x40012c34
    2f78:	40012c18 	.word	0x40012c18
    2f7c:	40012c20 	.word	0x40012c20
    2f80:	40012c44 	.word	0x40012c44
    2f84:	40012c00 	.word	0x40012c00
    2f88:	40003800 	.word	0x40003800
    2f8c:	40020058 	.word	0x40020058
    2f90:	4000380c 	.word	0x4000380c
    2f94:	40012c0c 	.word	0x40012c0c
    2f98:	20000138 	.word	0x20000138

00002f9c <TIM1_CC_handler>:
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    2f9c:	4853      	ldr	r0, [pc, #332]	; (30ec <TIM1_CC_handler+0x150>)
	line_count++;
    2f9e:	4b54      	ldr	r3, [pc, #336]	; (30f0 <TIM1_CC_handler+0x154>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    2fa0:	6802      	ldr	r2, [r0, #0]
	line_count++;
	TIMER1_SR->fld.cc1if=0;
    2fa2:	4954      	ldr	r1, [pc, #336]	; (30f4 <TIM1_CC_handler+0x158>)
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
	int i;
    uint16_t cnt;
	uint16_t* line_adr;
	
    _disable_dma();
    2fa4:	f022 0201 	bic.w	r2, r2, #1
    2fa8:	6002      	str	r2, [r0, #0]
	line_count++;
    2faa:	681a      	ldr	r2, [r3, #0]
    2fac:	3201      	adds	r2, #1
    2fae:	601a      	str	r2, [r3, #0]
	TIMER1_SR->fld.cc1if=0;
    2fb0:	680a      	ldr	r2, [r1, #0]
    2fb2:	f022 0202 	bic.w	r2, r2, #2
    2fb6:	600a      	str	r2, [r1, #0]
	switch(line_count){
    2fb8:	681a      	ldr	r2, [r3, #0]
    2fba:	2a12      	cmp	r2, #18
    2fbc:	f000 8090 	beq.w	30e0 <TIM1_CC_handler+0x144>
    2fc0:	dd1d      	ble.n	2ffe <TIM1_CC_handler+0x62>
    2fc2:	f5b2 7f96 	cmp.w	r2, #300	; 0x12c
    2fc6:	f000 8082 	beq.w	30ce <TIM1_CC_handler+0x132>
    2fca:	dd3f      	ble.n	304c <TIM1_CC_handler+0xb0>
    2fcc:	f240 1141 	movw	r1, #321	; 0x141
    2fd0:	428a      	cmp	r2, r1
    2fd2:	d028      	beq.n	3026 <TIM1_CC_handler+0x8a>
    2fd4:	f5b2 7fa1 	cmp.w	r2, #322	; 0x142
    2fd8:	d14a      	bne.n	3070 <TIM1_CC_handler+0xd4>
			line_count=-1;
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
    2fda:	4a47      	ldr	r2, [pc, #284]	; (30f8 <TIM1_CC_handler+0x15c>)
    2fdc:	6811      	ldr	r1, [r2, #0]
    2fde:	b169      	cbz	r1, 2ffc <TIM1_CC_handler+0x60>
 * synchronisation vidéo
 *************************/
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
__attribute__((optimize("-O3"))) void TIM1_CC_handler(){
    2fe0:	b410      	push	{r4}
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    2fe2:	4846      	ldr	r0, [pc, #280]	; (30fc <TIM1_CC_handler+0x160>)
			line_count=-1;
    2fe4:	f04f 34ff 	mov.w	r4, #4294967295	; 0xffffffff
			even=-even;
		}
		break;
	case (FIELD_END+1):
		if (even){
			*TIMER1_ARR/=2;
    2fe8:	8801      	ldrh	r1, [r0, #0]
    2fea:	f3c1 014e 	ubfx	r1, r1, #1, #15
    2fee:	8001      	strh	r1, [r0, #0]
			line_count=-1;
    2ff0:	601c      	str	r4, [r3, #0]
			even=-even;
    2ff2:	6813      	ldr	r3, [r2, #0]
    2ff4:	425b      	negs	r3, r3
    2ff6:	6013      	str	r3, [r2, #0]
			);
			_enable_dma();
		}
		break;
	}//switch (line_count)
}
    2ff8:	f85d 4b04 	ldr.w	r4, [sp], #4
    2ffc:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    2ffe:	2a06      	cmp	r2, #6
    3000:	d069      	beq.n	30d6 <TIM1_CC_handler+0x13a>
    3002:	dd29      	ble.n	3058 <TIM1_CC_handler+0xbc>
    3004:	2a0c      	cmp	r2, #12
    3006:	d019      	beq.n	303c <TIM1_CC_handler+0xa0>
    3008:	2a11      	cmp	r2, #17
    300a:	d131      	bne.n	3070 <TIM1_CC_handler+0xd4>
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
		break;
	case 17: // fin sync champ paire
		if (even){
    300c:	4b3a      	ldr	r3, [pc, #232]	; (30f8 <TIM1_CC_handler+0x15c>)
    300e:	681b      	ldr	r3, [r3, #0]
    3010:	2b00      	cmp	r3, #0
    3012:	d0f3      	beq.n	2ffc <TIM1_CC_handler+0x60>
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    3014:	f640 70ff 	movw	r0, #4095	; 0xfff
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    3018:	f240 122b 	movw	r2, #299	; 0x12b
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    301c:	4937      	ldr	r1, [pc, #220]	; (30fc <TIM1_CC_handler+0x160>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    301e:	4b38      	ldr	r3, [pc, #224]	; (3100 <TIM1_CC_handler+0x164>)
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
			*TIMER1_ARR=(FCLK/HFREQ-1);
    3020:	8008      	strh	r0, [r1, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    3022:	801a      	strh	r2, [r3, #0]
    3024:	4770      	bx	lr
		break;
	case (TOP_LINE+VRES):
		video=0;
		break;
	case FIELD_END:
		if (!even){
    3026:	4a34      	ldr	r2, [pc, #208]	; (30f8 <TIM1_CC_handler+0x15c>)
    3028:	6811      	ldr	r1, [r2, #0]
    302a:	2900      	cmp	r1, #0
    302c:	d1e6      	bne.n	2ffc <TIM1_CC_handler+0x60>
			line_count=-1;
    302e:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    3032:	6019      	str	r1, [r3, #0]
			even=-even;
    3034:	6813      	ldr	r3, [r2, #0]
    3036:	425b      	negs	r3, r3
    3038:	6013      	str	r3, [r2, #0]
    303a:	4770      	bx	lr
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    303c:	f240 70ff 	movw	r0, #2047	; 0x7ff
    3040:	492e      	ldr	r1, [pc, #184]	; (30fc <TIM1_CC_handler+0x160>)
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    3042:	4b2f      	ldr	r3, [pc, #188]	; (3100 <TIM1_CC_handler+0x164>)
    3044:	2295      	movs	r2, #149	; 0x95
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
	    break;
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    3046:	8008      	strh	r0, [r1, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    3048:	801a      	strh	r2, [r3, #0]
		break;
    304a:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    304c:	2a3b      	cmp	r2, #59	; 0x3b
    304e:	d10f      	bne.n	3070 <TIM1_CC_handler+0xd4>
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case TOP_LINE-1:
		video=1;
    3050:	4b2c      	ldr	r3, [pc, #176]	; (3104 <TIM1_CC_handler+0x168>)
    3052:	2201      	movs	r2, #1
    3054:	601a      	str	r2, [r3, #0]
		break;
    3056:	4770      	bx	lr
	uint16_t* line_adr;
	
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
    3058:	b952      	cbnz	r2, 3070 <TIM1_CC_handler+0xd4>
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    305a:	4928      	ldr	r1, [pc, #160]	; (30fc <TIM1_CC_handler+0x160>)
		*TIMER1_CCR1/=2;
    305c:	4a28      	ldr	r2, [pc, #160]	; (3100 <TIM1_CC_handler+0x164>)
    _disable_dma();
	line_count++;
	TIMER1_SR->fld.cc1if=0;
	switch(line_count){
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    305e:	880b      	ldrh	r3, [r1, #0]
    3060:	f3c3 034e 	ubfx	r3, r3, #1, #15
    3064:	800b      	strh	r3, [r1, #0]
		*TIMER1_CCR1/=2;
    3066:	8813      	ldrh	r3, [r2, #0]
    3068:	f3c3 034e 	ubfx	r3, r3, #1, #15
    306c:	8013      	strh	r3, [r2, #0]
		break;
    306e:	4770      	bx	lr
		SPI2->DR=0xaaaa;
		while (SPI2->SR&SPI_SR_BSY);
		SPI2->CR1=SPI_PIXELS;
		SPI2->DR=0;
*/	
		if (video){
    3070:	4a24      	ldr	r2, [pc, #144]	; (3104 <TIM1_CC_handler+0x168>)
    3072:	6812      	ldr	r2, [r2, #0]
    3074:	2a00      	cmp	r2, #0
    3076:	d0c1      	beq.n	2ffc <TIM1_CC_handler+0x60>
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    3078:	681b      	ldr	r3, [r3, #0]
    307a:	4a23      	ldr	r2, [pc, #140]	; (3108 <TIM1_CC_handler+0x16c>)
    307c:	3b3c      	subs	r3, #60	; 0x3c
    307e:	491b      	ldr	r1, [pc, #108]	; (30ec <TIM1_CC_handler+0x150>)
    3080:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    3084:	eb02 03c3 	add.w	r3, r2, r3, lsl #3
			DMA1[DMACH5].cndtr=ROW_SIZE;
    3088:	2014      	movs	r0, #20
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    308a:	4a20      	ldr	r2, [pc, #128]	; (310c <TIM1_CC_handler+0x170>)
		SPI2->DR=0;
*/	
		if (video){
			//line_adr=(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
			//_disable_dma();
			DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    308c:	60cb      	str	r3, [r1, #12]
			DMA1[DMACH5].cndtr=ROW_SIZE;
    308e:	6048      	str	r0, [r1, #4]
			cnt=VIDEO_DELAY;
			while ((*TIMER1_CNT)<cnt){asm volatile("");}
    3090:	8813      	ldrh	r3, [r2, #0]
    3092:	b29b      	uxth	r3, r3
    3094:	f5b3 6f83 	cmp.w	r3, #1048	; 0x418
    3098:	d804      	bhi.n	30a4 <TIM1_CC_handler+0x108>
    309a:	8813      	ldrh	r3, [r2, #0]
    309c:	b29b      	uxth	r3, r3
    309e:	f5b3 6f83 	cmp.w	r3, #1048	; 0x418
    30a2:	d9fa      	bls.n	309a <TIM1_CC_handler+0xfe>
			// réduction de la gigue vidéo
			asm volatile(
    30a4:	4b19      	ldr	r3, [pc, #100]	; (310c <TIM1_CC_handler+0x170>)
    30a6:	461b      	mov	r3, r3
    30a8:	681b      	ldr	r3, [r3, #0]
    30aa:	f003 0307 	and.w	r3, r3, #7
    30ae:	005b      	lsls	r3, r3, #1
    30b0:	449f      	add	pc, r3
    30b2:	bf00      	nop
    30b4:	bf00      	nop
    30b6:	bf00      	nop
    30b8:	bf00      	nop
    30ba:	bf00      	nop
    30bc:	bf00      	nop
    30be:	bf00      	nop
    30c0:	bf00      	nop
			"nop\n\t"
			"nop\n\t"
			"nop\n\t"
			::"r" (TIMER1_CNT)
			);
			_enable_dma();
    30c2:	4a0a      	ldr	r2, [pc, #40]	; (30ec <TIM1_CC_handler+0x150>)
    30c4:	6813      	ldr	r3, [r2, #0]
    30c6:	f043 0301 	orr.w	r3, r3, #1
    30ca:	6013      	str	r3, [r2, #0]
    30cc:	4770      	bx	lr
		break;
	case TOP_LINE-1:
		video=1;
		break;
	case (TOP_LINE+VRES):
		video=0;
    30ce:	4b0d      	ldr	r3, [pc, #52]	; (3104 <TIM1_CC_handler+0x168>)
    30d0:	2200      	movs	r2, #0
    30d2:	601a      	str	r2, [r3, #0]
		break;
    30d4:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
		*TIMER1_CCR1/=2;
		break;
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    30d6:	f240 7269 	movw	r2, #1897	; 0x769
    30da:	4b09      	ldr	r3, [pc, #36]	; (3100 <TIM1_CC_handler+0x164>)
    30dc:	801a      	strh	r2, [r3, #0]
	    break;
    30de:	4770      	bx	lr
			*TIMER1_ARR=(FCLK/HFREQ-1);
			*TIMER1_CCR1=(FCLK*HSYNC-1);
		}
		break;
	case 18: // fin vsync
		if (!even){
    30e0:	4b05      	ldr	r3, [pc, #20]	; (30f8 <TIM1_CC_handler+0x15c>)
    30e2:	681b      	ldr	r3, [r3, #0]
    30e4:	2b00      	cmp	r3, #0
    30e6:	d189      	bne.n	2ffc <TIM1_CC_handler+0x60>
    30e8:	e794      	b.n	3014 <TIM1_CC_handler+0x78>
    30ea:	bf00      	nop
    30ec:	40020058 	.word	0x40020058
    30f0:	20000004 	.word	0x20000004
    30f4:	40012c10 	.word	0x40012c10
    30f8:	200000ec 	.word	0x200000ec
    30fc:	40012c2c 	.word	0x40012c2c
    3100:	40012c34 	.word	0x40012c34
    3104:	200000e8 	.word	0x200000e8
    3108:	20000138 	.word	0x20000138
    310c:	40012c24 	.word	0x40012c24

00003110 <DMA1CH5_handler>:
		}
		break;
	}//switch (line_count)
}

void DMA1CH5_handler(){
    3110:	b480      	push	{r7}
    3112:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    3114:	4a09      	ldr	r2, [pc, #36]	; (313c <DMA1CH5_handler+0x2c>)
    3116:	4b09      	ldr	r3, [pc, #36]	; (313c <DMA1CH5_handler+0x2c>)
    3118:	685b      	ldr	r3, [r3, #4]
    311a:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    311e:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    3120:	bf00      	nop
    3122:	4b07      	ldr	r3, [pc, #28]	; (3140 <DMA1CH5_handler+0x30>)
    3124:	689b      	ldr	r3, [r3, #8]
    3126:	f003 0302 	and.w	r3, r3, #2
    312a:	2b00      	cmp	r3, #0
    312c:	d0f9      	beq.n	3122 <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    312e:	4b04      	ldr	r3, [pc, #16]	; (3140 <DMA1CH5_handler+0x30>)
    3130:	2200      	movs	r2, #0
    3132:	60da      	str	r2, [r3, #12]
}
    3134:	46bd      	mov	sp, r7
    3136:	f85d 7b04 	ldr.w	r7, [sp], #4
    313a:	4770      	bx	lr
    313c:	40020000 	.word	0x40020000
    3140:	40003800 	.word	0x40003800

00003144 <usart_config_port>:

#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 

// configuration dse broches
void usart_config_port(usart_t* channel, gpio_t *port, unsigned flow_ctrl){
    3144:	b480      	push	{r7}
    3146:	b085      	sub	sp, #20
    3148:	af00      	add	r7, sp, #0
    314a:	60f8      	str	r0, [r7, #12]
    314c:	60b9      	str	r1, [r7, #8]
    314e:	607a      	str	r2, [r7, #4]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    3150:	68fb      	ldr	r3, [r7, #12]
    3152:	4a45      	ldr	r2, [pc, #276]	; (3268 <usart_config_port+0x124>)
    3154:	4293      	cmp	r3, r2
    3156:	d058      	beq.n	320a <usart_config_port+0xc6>
    3158:	4a44      	ldr	r2, [pc, #272]	; (326c <usart_config_port+0x128>)
    315a:	4293      	cmp	r3, r2
    315c:	d003      	beq.n	3166 <usart_config_port+0x22>
    315e:	4a44      	ldr	r2, [pc, #272]	; (3270 <usart_config_port+0x12c>)
    3160:	4293      	cmp	r3, r2
    3162:	d029      	beq.n	31b8 <usart_config_port+0x74>
    3164:	e07a      	b.n	325c <usart_config_port+0x118>
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
    3166:	4a43      	ldr	r2, [pc, #268]	; (3274 <usart_config_port+0x130>)
    3168:	4b42      	ldr	r3, [pc, #264]	; (3274 <usart_config_port+0x130>)
    316a:	699b      	ldr	r3, [r3, #24]
    316c:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    3170:	f043 0304 	orr.w	r3, r3, #4
    3174:	6193      	str	r3, [r2, #24]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    3176:	687b      	ldr	r3, [r7, #4]
    3178:	2b01      	cmp	r3, #1
    317a:	d110      	bne.n	319e <usart_config_port+0x5a>
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
    317c:	68bb      	ldr	r3, [r7, #8]
    317e:	685b      	ldr	r3, [r3, #4]
    3180:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    3184:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    3188:	68ba      	ldr	r2, [r7, #8]
    318a:	6053      	str	r3, [r2, #4]
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
    318c:	68bb      	ldr	r3, [r7, #8]
    318e:	685b      	ldr	r3, [r3, #4]
    3190:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    3194:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    3198:	68ba      	ldr	r2, [r7, #8]
    319a:	6053      	str	r3, [r2, #4]
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
		}
		break;
    319c:	e05e      	b.n	325c <usart_config_port+0x118>
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
    319e:	68bb      	ldr	r3, [r7, #8]
    31a0:	685b      	ldr	r3, [r3, #4]
    31a2:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
    31a6:	68bb      	ldr	r3, [r7, #8]
    31a8:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
    31aa:	68bb      	ldr	r3, [r7, #8]
    31ac:	685b      	ldr	r3, [r3, #4]
    31ae:	f043 02a0 	orr.w	r2, r3, #160	; 0xa0
    31b2:	68bb      	ldr	r3, [r7, #8]
    31b4:	605a      	str	r2, [r3, #4]
		}
		break;
    31b6:	e051      	b.n	325c <usart_config_port+0x118>
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    31b8:	4a2e      	ldr	r2, [pc, #184]	; (3274 <usart_config_port+0x130>)
    31ba:	4b2e      	ldr	r3, [pc, #184]	; (3274 <usart_config_port+0x130>)
    31bc:	69db      	ldr	r3, [r3, #28]
    31be:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    31c2:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    31c4:	4a2b      	ldr	r2, [pc, #172]	; (3274 <usart_config_port+0x130>)
    31c6:	4b2b      	ldr	r3, [pc, #172]	; (3274 <usart_config_port+0x130>)
    31c8:	699b      	ldr	r3, [r3, #24]
    31ca:	f043 0304 	orr.w	r3, r3, #4
    31ce:	6193      	str	r3, [r2, #24]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
    31d0:	687b      	ldr	r3, [r7, #4]
    31d2:	2b01      	cmp	r3, #1
    31d4:	d10c      	bne.n	31f0 <usart_config_port+0xac>
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
    31d6:	68bb      	ldr	r3, [r7, #8]
    31d8:	681b      	ldr	r3, [r3, #0]
    31da:	f423 627f 	bic.w	r2, r3, #4080	; 0xff0
    31de:	68bb      	ldr	r3, [r7, #8]
    31e0:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
    31e2:	68bb      	ldr	r3, [r7, #8]
    31e4:	681b      	ldr	r3, [r3, #0]
    31e6:	f443 622a 	orr.w	r2, r3, #2720	; 0xaa0
    31ea:	68bb      	ldr	r3, [r7, #8]
    31ec:	601a      	str	r2, [r3, #0]
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
		}
		break;
    31ee:	e035      	b.n	325c <usart_config_port+0x118>
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
    31f0:	68bb      	ldr	r3, [r7, #8]
    31f2:	681b      	ldr	r3, [r3, #0]
    31f4:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    31f8:	68bb      	ldr	r3, [r7, #8]
    31fa:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
    31fc:	68bb      	ldr	r3, [r7, #8]
    31fe:	681b      	ldr	r3, [r3, #0]
    3200:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    3204:	68bb      	ldr	r3, [r7, #8]
    3206:	601a      	str	r2, [r3, #0]
		}
		break;
    3208:	e028      	b.n	325c <usart_config_port+0x118>
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
    320a:	4a1a      	ldr	r2, [pc, #104]	; (3274 <usart_config_port+0x130>)
    320c:	4b19      	ldr	r3, [pc, #100]	; (3274 <usart_config_port+0x130>)
    320e:	69db      	ldr	r3, [r3, #28]
    3210:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    3214:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    3216:	4a17      	ldr	r2, [pc, #92]	; (3274 <usart_config_port+0x130>)
    3218:	4b16      	ldr	r3, [pc, #88]	; (3274 <usart_config_port+0x130>)
    321a:	699b      	ldr	r3, [r3, #24]
    321c:	f043 0308 	orr.w	r3, r3, #8
    3220:	6193      	str	r3, [r2, #24]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    3222:	687b      	ldr	r3, [r7, #4]
    3224:	2b01      	cmp	r3, #1
    3226:	d10c      	bne.n	3242 <usart_config_port+0xfe>
			port->CR[1]&=~((15<<((USART3_TX_PIN-8)*4))|(15<<((USART3_RTS_PIN-8)*4)));
    3228:	68bb      	ldr	r3, [r7, #8]
    322a:	685b      	ldr	r3, [r3, #4]
    322c:	f023 220f 	bic.w	r2, r3, #251662080	; 0xf000f00
    3230:	68bb      	ldr	r3, [r7, #8]
    3232:	605a      	str	r2, [r3, #4]
			port->CR[1]|=(0xA<<((USART3_TX_PIN-8)*4))|(0xA<<((USART3_RTS_PIN-8)*4));
    3234:	68bb      	ldr	r3, [r7, #8]
    3236:	685b      	ldr	r3, [r3, #4]
    3238:	f043 220a 	orr.w	r2, r3, #167774720	; 0xa000a00
    323c:	68bb      	ldr	r3, [r7, #8]
    323e:	605a      	str	r2, [r3, #4]
    3240:	e00b      	b.n	325a <usart_config_port+0x116>
		}else{
			port->CR[1]&=~(15<<((USART3_TX_PIN-8)*4));
    3242:	68bb      	ldr	r3, [r7, #8]
    3244:	685b      	ldr	r3, [r3, #4]
    3246:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    324a:	68bb      	ldr	r3, [r7, #8]
    324c:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART3_TX_PIN-8)*4);
    324e:	68bb      	ldr	r3, [r7, #8]
    3250:	685b      	ldr	r3, [r3, #4]
    3252:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    3256:	68bb      	ldr	r3, [r7, #8]
    3258:	605a      	str	r2, [r3, #4]
		}
		break;
    325a:	bf00      	nop
	}
}
    325c:	3714      	adds	r7, #20
    325e:	46bd      	mov	sp, r7
    3260:	f85d 7b04 	ldr.w	r7, [sp], #4
    3264:	4770      	bx	lr
    3266:	bf00      	nop
    3268:	40004800 	.word	0x40004800
    326c:	40013800 	.word	0x40013800
    3270:	40004400 	.word	0x40004400
    3274:	40021000 	.word	0x40021000

00003278 <usart_set_baud>:

// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
    3278:	b480      	push	{r7}
    327a:	b085      	sub	sp, #20
    327c:	af00      	add	r7, sp, #0
    327e:	6078      	str	r0, [r7, #4]
    3280:	6039      	str	r1, [r7, #0]
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
    3282:	687b      	ldr	r3, [r7, #4]
    3284:	4a14      	ldr	r2, [pc, #80]	; (32d8 <usart_set_baud+0x60>)
    3286:	4293      	cmp	r3, r2
    3288:	d10f      	bne.n	32aa <usart_set_baud+0x32>
		rate=(FAPB2/baud/16)<<4;
    328a:	4a14      	ldr	r2, [pc, #80]	; (32dc <usart_set_baud+0x64>)
    328c:	683b      	ldr	r3, [r7, #0]
    328e:	fbb2 f3f3 	udiv	r3, r2, r3
    3292:	011b      	lsls	r3, r3, #4
    3294:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    3296:	4a12      	ldr	r2, [pc, #72]	; (32e0 <usart_set_baud+0x68>)
    3298:	683b      	ldr	r3, [r7, #0]
    329a:	fbb2 f3f3 	udiv	r3, r2, r3
    329e:	f003 030f 	and.w	r3, r3, #15
    32a2:	68fa      	ldr	r2, [r7, #12]
    32a4:	4313      	orrs	r3, r2
    32a6:	60fb      	str	r3, [r7, #12]
    32a8:	e00e      	b.n	32c8 <usart_set_baud+0x50>
	}else{
		rate=(FAPB1/baud/16)<<4;
    32aa:	4a0e      	ldr	r2, [pc, #56]	; (32e4 <usart_set_baud+0x6c>)
    32ac:	683b      	ldr	r3, [r7, #0]
    32ae:	fbb2 f3f3 	udiv	r3, r2, r3
    32b2:	011b      	lsls	r3, r3, #4
    32b4:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    32b6:	4a0c      	ldr	r2, [pc, #48]	; (32e8 <usart_set_baud+0x70>)
    32b8:	683b      	ldr	r3, [r7, #0]
    32ba:	fbb2 f3f3 	udiv	r3, r2, r3
    32be:	f003 030f 	and.w	r3, r3, #15
    32c2:	68fa      	ldr	r2, [r7, #12]
    32c4:	4313      	orrs	r3, r2
    32c6:	60fb      	str	r3, [r7, #12]
	}
	channel->BRR=rate;
    32c8:	687b      	ldr	r3, [r7, #4]
    32ca:	68fa      	ldr	r2, [r7, #12]
    32cc:	609a      	str	r2, [r3, #8]
}
    32ce:	3714      	adds	r7, #20
    32d0:	46bd      	mov	sp, r7
    32d2:	f85d 7b04 	ldr.w	r7, [sp], #4
    32d6:	4770      	bx	lr
    32d8:	40013800 	.word	0x40013800
    32dc:	003d0900 	.word	0x003d0900
    32e0:	03d09000 	.word	0x03d09000
    32e4:	001e8480 	.word	0x001e8480
    32e8:	01e84800 	.word	0x01e84800

000032ec <usart_comm_dir>:

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
    32ec:	b480      	push	{r7}
    32ee:	b083      	sub	sp, #12
    32f0:	af00      	add	r7, sp, #0
    32f2:	6078      	str	r0, [r7, #4]
    32f4:	6039      	str	r1, [r7, #0]
	channel->CR1&=USART_CR1_DIR_MASK;
    32f6:	687b      	ldr	r3, [r7, #4]
    32f8:	68db      	ldr	r3, [r3, #12]
    32fa:	f023 020c 	bic.w	r2, r3, #12
    32fe:	687b      	ldr	r3, [r7, #4]
    3300:	60da      	str	r2, [r3, #12]
	channel->CR1|=direction<<USART_CR1_DIR_POS;
    3302:	687b      	ldr	r3, [r7, #4]
    3304:	68da      	ldr	r2, [r3, #12]
    3306:	683b      	ldr	r3, [r7, #0]
    3308:	009b      	lsls	r3, r3, #2
    330a:	431a      	orrs	r2, r3
    330c:	687b      	ldr	r3, [r7, #4]
    330e:	60da      	str	r2, [r3, #12]
}
    3310:	370c      	adds	r7, #12
    3312:	46bd      	mov	sp, r7
    3314:	f85d 7b04 	ldr.w	r7, [sp], #4
    3318:	4770      	bx	lr
    331a:	bf00      	nop

0000331c <usart_open_channel>:


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
    331c:	b580      	push	{r7, lr}
    331e:	b084      	sub	sp, #16
    3320:	af00      	add	r7, sp, #0
    3322:	60f8      	str	r0, [r7, #12]
    3324:	60b9      	str	r1, [r7, #8]
    3326:	607a      	str	r2, [r7, #4]
    3328:	603b      	str	r3, [r7, #0]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    332a:	68fb      	ldr	r3, [r7, #12]
    332c:	4a32      	ldr	r2, [pc, #200]	; (33f8 <usart_open_channel+0xdc>)
    332e:	4293      	cmp	r3, r2
    3330:	d020      	beq.n	3374 <usart_open_channel+0x58>
    3332:	4a32      	ldr	r2, [pc, #200]	; (33fc <usart_open_channel+0xe0>)
    3334:	4293      	cmp	r3, r2
    3336:	d003      	beq.n	3340 <usart_open_channel+0x24>
    3338:	4a31      	ldr	r2, [pc, #196]	; (3400 <usart_open_channel+0xe4>)
    333a:	4293      	cmp	r3, r2
    333c:	d00d      	beq.n	335a <usart_open_channel+0x3e>
    333e:	e026      	b.n	338e <usart_open_channel+0x72>
	case (uint32_t)USART1:
		usart_config_port(channel,USART1_PORT,flow_ctrl);
    3340:	68f8      	ldr	r0, [r7, #12]
    3342:	4930      	ldr	r1, [pc, #192]	; (3404 <usart_open_channel+0xe8>)
    3344:	69ba      	ldr	r2, [r7, #24]
    3346:	f7ff fefd 	bl	3144 <usart_config_port>
		set_int_priority(IRQ_USART1,7);
    334a:	2025      	movs	r0, #37	; 0x25
    334c:	2107      	movs	r1, #7
    334e:	f7ff f8db 	bl	2508 <set_int_priority>
		enable_interrupt(IRQ_USART1);
    3352:	2025      	movs	r0, #37	; 0x25
    3354:	f7ff f81c 	bl	2390 <enable_interrupt>
		break;
    3358:	e019      	b.n	338e <usart_open_channel+0x72>
	case (uint32_t)USART2:
		usart_config_port(channel,USART2_PORT,flow_ctrl);
    335a:	68f8      	ldr	r0, [r7, #12]
    335c:	4929      	ldr	r1, [pc, #164]	; (3404 <usart_open_channel+0xe8>)
    335e:	69ba      	ldr	r2, [r7, #24]
    3360:	f7ff fef0 	bl	3144 <usart_config_port>
		set_int_priority(IRQ_USART2,7);
    3364:	2026      	movs	r0, #38	; 0x26
    3366:	2107      	movs	r1, #7
    3368:	f7ff f8ce 	bl	2508 <set_int_priority>
		enable_interrupt(IRQ_USART2);
    336c:	2026      	movs	r0, #38	; 0x26
    336e:	f7ff f80f 	bl	2390 <enable_interrupt>
		break;
    3372:	e00c      	b.n	338e <usart_open_channel+0x72>
	case (uint32_t)USART3:
		usart_config_port(channel,USART3_PORT,flow_ctrl);
    3374:	68f8      	ldr	r0, [r7, #12]
    3376:	4924      	ldr	r1, [pc, #144]	; (3408 <usart_open_channel+0xec>)
    3378:	69ba      	ldr	r2, [r7, #24]
    337a:	f7ff fee3 	bl	3144 <usart_config_port>
		set_int_priority(IRQ_USART3,7);
    337e:	2027      	movs	r0, #39	; 0x27
    3380:	2107      	movs	r1, #7
    3382:	f7ff f8c1 	bl	2508 <set_int_priority>
		enable_interrupt(IRQ_USART3);
    3386:	2027      	movs	r0, #39	; 0x27
    3388:	f7ff f802 	bl	2390 <enable_interrupt>
		break;
    338c:	bf00      	nop
	}
	if (flow_ctrl==FLOW_HARD){
    338e:	69bb      	ldr	r3, [r7, #24]
    3390:	2b01      	cmp	r3, #1
    3392:	d103      	bne.n	339c <usart_open_channel+0x80>
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    3394:	68fb      	ldr	r3, [r7, #12]
    3396:	f44f 7240 	mov.w	r2, #768	; 0x300
    339a:	615a      	str	r2, [r3, #20]
	}
	usart_comm_dir(channel,dir);
    339c:	68f8      	ldr	r0, [r7, #12]
    339e:	6839      	ldr	r1, [r7, #0]
    33a0:	f7ff ffa4 	bl	32ec <usart_comm_dir>
	switch (parity){
    33a4:	687b      	ldr	r3, [r7, #4]
    33a6:	2b01      	cmp	r3, #1
    33a8:	d00b      	beq.n	33c2 <usart_open_channel+0xa6>
    33aa:	2b01      	cmp	r3, #1
    33ac:	d302      	bcc.n	33b4 <usart_open_channel+0x98>
    33ae:	2b02      	cmp	r3, #2
    33b0:	d00e      	beq.n	33d0 <usart_open_channel+0xb4>
    33b2:	e014      	b.n	33de <usart_open_channel+0xc2>
	case PARITY_NONE:
		channel->CR1|=USART_CR1_RXNEIE;
    33b4:	68fb      	ldr	r3, [r7, #12]
    33b6:	68db      	ldr	r3, [r3, #12]
    33b8:	f043 0220 	orr.w	r2, r3, #32
    33bc:	68fb      	ldr	r3, [r7, #12]
    33be:	60da      	str	r2, [r3, #12]
		break;
    33c0:	e00d      	b.n	33de <usart_open_channel+0xc2>
	case PARITY_ODD:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS|USART_CR1_RXNEIE;
    33c2:	68fb      	ldr	r3, [r7, #12]
    33c4:	68db      	ldr	r3, [r3, #12]
    33c6:	f443 62e4 	orr.w	r2, r3, #1824	; 0x720
    33ca:	68fb      	ldr	r3, [r7, #12]
    33cc:	60da      	str	r2, [r3, #12]
		break;
    33ce:	e006      	b.n	33de <usart_open_channel+0xc2>
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_RXNEIE;
    33d0:	68fb      	ldr	r3, [r7, #12]
    33d2:	68db      	ldr	r3, [r3, #12]
    33d4:	f443 62a4 	orr.w	r2, r3, #1312	; 0x520
    33d8:	68fb      	ldr	r3, [r7, #12]
    33da:	60da      	str	r2, [r3, #12]
		break;
    33dc:	bf00      	nop
    }
	usart_set_baud(channel,baud);
    33de:	68f8      	ldr	r0, [r7, #12]
    33e0:	68b9      	ldr	r1, [r7, #8]
    33e2:	f7ff ff49 	bl	3278 <usart_set_baud>
    channel->CR1|=USART_CR1_UE;
    33e6:	68fb      	ldr	r3, [r7, #12]
    33e8:	68db      	ldr	r3, [r3, #12]
    33ea:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
    33ee:	68fb      	ldr	r3, [r7, #12]
    33f0:	60da      	str	r2, [r3, #12]
}
    33f2:	3710      	adds	r7, #16
    33f4:	46bd      	mov	sp, r7
    33f6:	bd80      	pop	{r7, pc}
    33f8:	40004800 	.word	0x40004800
    33fc:	40013800 	.word	0x40013800
    3400:	40004400 	.word	0x40004400
    3404:	40010800 	.word	0x40010800
    3408:	40010c00 	.word	0x40010c00

0000340c <usart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
    340c:	b480      	push	{r7}
    340e:	b083      	sub	sp, #12
    3410:	af00      	add	r7, sp, #0
    3412:	6078      	str	r0, [r7, #4]
	return channel->SR&USART_SR_RXNE;
    3414:	687b      	ldr	r3, [r7, #4]
    3416:	681b      	ldr	r3, [r3, #0]
    3418:	f003 0320 	and.w	r3, r3, #32
}
    341c:	4618      	mov	r0, r3
    341e:	370c      	adds	r7, #12
    3420:	46bd      	mov	sp, r7
    3422:	f85d 7b04 	ldr.w	r7, [sp], #4
    3426:	4770      	bx	lr

00003428 <usart_getc>:

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
    3428:	b480      	push	{r7}
    342a:	b083      	sub	sp, #12
    342c:	af00      	add	r7, sp, #0
    342e:	6078      	str	r0, [r7, #4]
	return channel->DR;
    3430:	687b      	ldr	r3, [r7, #4]
    3432:	685b      	ldr	r3, [r3, #4]
    3434:	b2db      	uxtb	r3, r3
}
    3436:	4618      	mov	r0, r3
    3438:	370c      	adds	r7, #12
    343a:	46bd      	mov	sp, r7
    343c:	f85d 7b04 	ldr.w	r7, [sp], #4
    3440:	4770      	bx	lr
    3442:	bf00      	nop

00003444 <usart_putc>:

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
    3444:	b480      	push	{r7}
    3446:	b083      	sub	sp, #12
    3448:	af00      	add	r7, sp, #0
    344a:	6078      	str	r0, [r7, #4]
    344c:	460b      	mov	r3, r1
    344e:	70fb      	strb	r3, [r7, #3]
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
    3450:	bf00      	nop
    3452:	687b      	ldr	r3, [r7, #4]
    3454:	681b      	ldr	r3, [r3, #0]
    3456:	f003 0380 	and.w	r3, r3, #128	; 0x80
    345a:	2b00      	cmp	r3, #0
    345c:	d0f9      	beq.n	3452 <usart_putc+0xe>
	channel->DR=c;
    345e:	78fa      	ldrb	r2, [r7, #3]
    3460:	687b      	ldr	r3, [r7, #4]
    3462:	605a      	str	r2, [r3, #4]
}
    3464:	370c      	adds	r7, #12
    3466:	46bd      	mov	sp, r7
    3468:	f85d 7b04 	ldr.w	r7, [sp], #4
    346c:	4770      	bx	lr
    346e:	bf00      	nop

00003470 <usart_cts>:


int usart_cts(usart_t* channel){
    3470:	b480      	push	{r7}
    3472:	b085      	sub	sp, #20
    3474:	af00      	add	r7, sp, #0
    3476:	6078      	str	r0, [r7, #4]
	int cts;
	switch ((uint32_t)channel){
    3478:	687b      	ldr	r3, [r7, #4]
    347a:	4a11      	ldr	r2, [pc, #68]	; (34c0 <usart_cts+0x50>)
    347c:	4293      	cmp	r3, r2
    347e:	d012      	beq.n	34a6 <usart_cts+0x36>
    3480:	4a10      	ldr	r2, [pc, #64]	; (34c4 <usart_cts+0x54>)
    3482:	4293      	cmp	r3, r2
    3484:	d003      	beq.n	348e <usart_cts+0x1e>
    3486:	4a10      	ldr	r2, [pc, #64]	; (34c8 <usart_cts+0x58>)
    3488:	4293      	cmp	r3, r2
    348a:	d006      	beq.n	349a <usart_cts+0x2a>
    348c:	e011      	b.n	34b2 <usart_cts+0x42>
		case (uint32_t)USART1:
			cts=USART1_PORT->IDR&USART1_CTS_BIT;
    348e:	4b0f      	ldr	r3, [pc, #60]	; (34cc <usart_cts+0x5c>)
    3490:	689b      	ldr	r3, [r3, #8]
    3492:	f403 6300 	and.w	r3, r3, #2048	; 0x800
    3496:	60fb      	str	r3, [r7, #12]
			break;
    3498:	e00b      	b.n	34b2 <usart_cts+0x42>
		case (uint32_t)USART2:
			cts=USART2_PORT->IDR&USART2_CTS_BIT;
    349a:	4b0c      	ldr	r3, [pc, #48]	; (34cc <usart_cts+0x5c>)
    349c:	689b      	ldr	r3, [r3, #8]
    349e:	f003 0301 	and.w	r3, r3, #1
    34a2:	60fb      	str	r3, [r7, #12]
			break;
    34a4:	e005      	b.n	34b2 <usart_cts+0x42>
		case (uint32_t)USART3:
			cts=USART3_PORT->IDR&USART3_CTS_BIT;
    34a6:	4b0a      	ldr	r3, [pc, #40]	; (34d0 <usart_cts+0x60>)
    34a8:	689b      	ldr	r3, [r3, #8]
    34aa:	f403 5300 	and.w	r3, r3, #8192	; 0x2000
    34ae:	60fb      	str	r3, [r7, #12]
			break;
    34b0:	bf00      	nop
	}
	return cts;
    34b2:	68fb      	ldr	r3, [r7, #12]
}
    34b4:	4618      	mov	r0, r3
    34b6:	3714      	adds	r7, #20
    34b8:	46bd      	mov	sp, r7
    34ba:	f85d 7b04 	ldr.w	r7, [sp], #4
    34be:	4770      	bx	lr
    34c0:	40004800 	.word	0x40004800
    34c4:	40013800 	.word	0x40013800
    34c8:	40004400 	.word	0x40004400
    34cc:	40010800 	.word	0x40010800
    34d0:	40010c00 	.word	0x40010c00

000034d4 <vt_init>:

#include "../include/blue_pill.h"
#include "vt100.h"
#include "console.h"

void vt_init(){
    34d4:	b580      	push	{r7, lr}
    34d6:	b082      	sub	sp, #8
    34d8:	af02      	add	r7, sp, #8
	usart_open_channel(VT_USART,115200,PARITY_NONE,USART_DIR_BIDI,FLOW_HARD);
    34da:	2301      	movs	r3, #1
    34dc:	9300      	str	r3, [sp, #0]
    34de:	4804      	ldr	r0, [pc, #16]	; (34f0 <vt_init+0x1c>)
    34e0:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
    34e4:	2200      	movs	r2, #0
    34e6:	2303      	movs	r3, #3
    34e8:	f7ff ff18 	bl	331c <usart_open_channel>
}
    34ec:	46bd      	mov	sp, r7
    34ee:	bd80      	pop	{r7, pc}
    34f0:	40004400 	.word	0x40004400

000034f4 <vt_putc>:

void vt_putc(char c){
    34f4:	b580      	push	{r7, lr}
    34f6:	b082      	sub	sp, #8
    34f8:	af00      	add	r7, sp, #0
    34fa:	4603      	mov	r3, r0
    34fc:	71fb      	strb	r3, [r7, #7]
	usart_putc(VT_USART,c);
    34fe:	79fb      	ldrb	r3, [r7, #7]
    3500:	4803      	ldr	r0, [pc, #12]	; (3510 <vt_putc+0x1c>)
    3502:	4619      	mov	r1, r3
    3504:	f7ff ff9e 	bl	3444 <usart_putc>
}
    3508:	3708      	adds	r7, #8
    350a:	46bd      	mov	sp, r7
    350c:	bd80      	pop	{r7, pc}
    350e:	bf00      	nop
    3510:	40004400 	.word	0x40004400

00003514 <vt_del_back>:

void vt_del_back(){
    3514:	b580      	push	{r7, lr}
    3516:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,BS);
    3518:	4806      	ldr	r0, [pc, #24]	; (3534 <vt_del_back+0x20>)
    351a:	2108      	movs	r1, #8
    351c:	f7ff ff92 	bl	3444 <usart_putc>
	usart_putc(VT_USART,SPACE);
    3520:	4804      	ldr	r0, [pc, #16]	; (3534 <vt_del_back+0x20>)
    3522:	2120      	movs	r1, #32
    3524:	f7ff ff8e 	bl	3444 <usart_putc>
	usart_putc(VT_USART,BS);
    3528:	4802      	ldr	r0, [pc, #8]	; (3534 <vt_del_back+0x20>)
    352a:	2108      	movs	r1, #8
    352c:	f7ff ff8a 	bl	3444 <usart_putc>
}
    3530:	bd80      	pop	{r7, pc}
    3532:	bf00      	nop
    3534:	40004400 	.word	0x40004400

00003538 <vt_esc_seq>:

static void vt_esc_seq(){
    3538:	b580      	push	{r7, lr}
    353a:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,ESC);
    353c:	4804      	ldr	r0, [pc, #16]	; (3550 <vt_esc_seq+0x18>)
    353e:	211b      	movs	r1, #27
    3540:	f7ff ff80 	bl	3444 <usart_putc>
	usart_putc(VT_USART,'[');
    3544:	4802      	ldr	r0, [pc, #8]	; (3550 <vt_esc_seq+0x18>)
    3546:	215b      	movs	r1, #91	; 0x5b
    3548:	f7ff ff7c 	bl	3444 <usart_putc>
}
    354c:	bd80      	pop	{r7, pc}
    354e:	bf00      	nop
    3550:	40004400 	.word	0x40004400

00003554 <vt_cls>:


// vide l'écran de la console
void vt_cls(){
    3554:	b580      	push	{r7, lr}
    3556:	af00      	add	r7, sp, #0
	vt_esc_seq();
    3558:	f7ff ffee 	bl	3538 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    355c:	4804      	ldr	r0, [pc, #16]	; (3570 <vt_cls+0x1c>)
    355e:	2132      	movs	r1, #50	; 0x32
    3560:	f7ff ff70 	bl	3444 <usart_putc>
	usart_putc(VT_USART,'J');
    3564:	4802      	ldr	r0, [pc, #8]	; (3570 <vt_cls+0x1c>)
    3566:	214a      	movs	r1, #74	; 0x4a
    3568:	f7ff ff6c 	bl	3444 <usart_putc>
}
    356c:	bd80      	pop	{r7, pc}
    356e:	bf00      	nop
    3570:	40004400 	.word	0x40004400

00003574 <vt_clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void vt_clear_line(unsigned n){
    3574:	b580      	push	{r7, lr}
    3576:	b082      	sub	sp, #8
    3578:	af00      	add	r7, sp, #0
    357a:	6078      	str	r0, [r7, #4]
	vt_esc_seq();
    357c:	f7ff ffdc 	bl	3538 <vt_esc_seq>
	usart_putc(VT_USART,'2');
    3580:	480a      	ldr	r0, [pc, #40]	; (35ac <vt_clear_line+0x38>)
    3582:	2132      	movs	r1, #50	; 0x32
    3584:	f7ff ff5e 	bl	3444 <usart_putc>
	usart_putc(VT_USART,'K');
    3588:	4808      	ldr	r0, [pc, #32]	; (35ac <vt_clear_line+0x38>)
    358a:	214b      	movs	r1, #75	; 0x4b
    358c:	f7ff ff5a 	bl	3444 <usart_putc>
	while (n){usart_putc(VT_USART,BS);n--;}
    3590:	e006      	b.n	35a0 <vt_clear_line+0x2c>
    3592:	4806      	ldr	r0, [pc, #24]	; (35ac <vt_clear_line+0x38>)
    3594:	2108      	movs	r1, #8
    3596:	f7ff ff55 	bl	3444 <usart_putc>
    359a:	687b      	ldr	r3, [r7, #4]
    359c:	3b01      	subs	r3, #1
    359e:	607b      	str	r3, [r7, #4]
    35a0:	687b      	ldr	r3, [r7, #4]
    35a2:	2b00      	cmp	r3, #0
    35a4:	d1f5      	bne.n	3592 <vt_clear_line+0x1e>
}
    35a6:	3708      	adds	r7, #8
    35a8:	46bd      	mov	sp, r7
    35aa:	bd80      	pop	{r7, pc}
    35ac:	40004400 	.word	0x40004400

000035b0 <vt_ready>:

// vérifie si le terminal est prêt
int vt_ready(){
    35b0:	b480      	push	{r7}
    35b2:	af00      	add	r7, sp, #0
	return !(VT_PORT->IDR&VT_CTS_BIT);
    35b4:	4b06      	ldr	r3, [pc, #24]	; (35d0 <vt_ready+0x20>)
    35b6:	689b      	ldr	r3, [r3, #8]
    35b8:	f003 0301 	and.w	r3, r3, #1
    35bc:	2b00      	cmp	r3, #0
    35be:	bf0c      	ite	eq
    35c0:	2301      	moveq	r3, #1
    35c2:	2300      	movne	r3, #0
    35c4:	b2db      	uxtb	r3, r3
}
    35c6:	4618      	mov	r0, r3
    35c8:	46bd      	mov	sp, r7
    35ca:	f85d 7b04 	ldr.w	r7, [sp], #4
    35ce:	4770      	bx	lr
    35d0:	40010800 	.word	0x40010800

000035d4 <USART2_handler>:

// interruption serial console
void VT_handler(){
    35d4:	b580      	push	{r7, lr}
    35d6:	af00      	add	r7, sp, #0
	if ((con.dev==SERIAL) && (VT_USART->SR&USART_SR_RXNE)){
    35d8:	4b08      	ldr	r3, [pc, #32]	; (35fc <USART2_handler+0x28>)
    35da:	781b      	ldrb	r3, [r3, #0]
    35dc:	2b01      	cmp	r3, #1
    35de:	d10c      	bne.n	35fa <USART2_handler+0x26>
    35e0:	4b07      	ldr	r3, [pc, #28]	; (3600 <USART2_handler+0x2c>)
    35e2:	681b      	ldr	r3, [r3, #0]
    35e4:	f003 0320 	and.w	r3, r3, #32
    35e8:	2b00      	cmp	r3, #0
    35ea:	d006      	beq.n	35fa <USART2_handler+0x26>
		con.insert(VT_USART->DR);
    35ec:	4b03      	ldr	r3, [pc, #12]	; (35fc <USART2_handler+0x28>)
    35ee:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    35f0:	4a03      	ldr	r2, [pc, #12]	; (3600 <USART2_handler+0x2c>)
    35f2:	6852      	ldr	r2, [r2, #4]
    35f4:	b2d2      	uxtb	r2, r2
    35f6:	4610      	mov	r0, r2
    35f8:	4798      	blx	r3
	}
}
    35fa:	bd80      	pop	{r7, pc}
    35fc:	200000f4 	.word	0x200000f4
    3600:	40004400 	.word	0x40004400

Disassembly of section .user_code:

00004000 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    4000:	b480      	push	{r7}
    4002:	b085      	sub	sp, #20
    4004:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    4006:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    400a:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    400c:	2300      	movs	r3, #0
    400e:	71fb      	strb	r3, [r7, #7]
	
	_svc_call(SVC_PRINT,"blinking led, any key to stop.\n",0);
    4010:	4b1e      	ldr	r3, [pc, #120]	; (408c <blink+0x8c>)
    4012:	2200      	movs	r2, #0
    4014:	4618      	mov	r0, r3
    4016:	4611      	mov	r1, r2
    4018:	df08      	svc	8
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    401a:	2300      	movs	r3, #0
    401c:	2200      	movs	r2, #0
    401e:	4618      	mov	r0, r3
    4020:	4611      	mov	r1, r2
    4022:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    4024:	f107 030c 	add.w	r3, r7, #12
    4028:	2200      	movs	r2, #0
    402a:	4618      	mov	r0, r3
    402c:	4611      	mov	r1, r2
    402e:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    4030:	f107 0308 	add.w	r3, r7, #8
    4034:	2200      	movs	r2, #0
    4036:	4618      	mov	r0, r3
    4038:	4611      	mov	r1, r2
    403a:	df04      	svc	4
    403c:	68bb      	ldr	r3, [r7, #8]
    403e:	2b00      	cmp	r3, #0
    4040:	d1f6      	bne.n	4030 <blink+0x30>
		_svc_call(SVC_LED_ON,NUL,NUL);
    4042:	2300      	movs	r3, #0
    4044:	2200      	movs	r2, #0
    4046:	4618      	mov	r0, r3
    4048:	4611      	mov	r1, r2
    404a:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    404c:	f107 030c 	add.w	r3, r7, #12
    4050:	2200      	movs	r2, #0
    4052:	4618      	mov	r0, r3
    4054:	4611      	mov	r1, r2
    4056:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    4058:	f107 0308 	add.w	r3, r7, #8
    405c:	2200      	movs	r2, #0
    405e:	4618      	mov	r0, r3
    4060:	4611      	mov	r1, r2
    4062:	df04      	svc	4
    4064:	68bb      	ldr	r3, [r7, #8]
    4066:	2b00      	cmp	r3, #0
    4068:	d1f6      	bne.n	4058 <blink+0x58>
		_svc_call(SVC_CONIN,&c,NUL);
    406a:	1dfb      	adds	r3, r7, #7
    406c:	2200      	movs	r2, #0
    406e:	4618      	mov	r0, r3
    4070:	4611      	mov	r1, r2
    4072:	df05      	svc	5
		if (c) break;
    4074:	79fb      	ldrb	r3, [r7, #7]
    4076:	b2db      	uxtb	r3, r3
    4078:	2b00      	cmp	r3, #0
    407a:	d000      	beq.n	407e <blink+0x7e>
    407c:	e000      	b.n	4080 <blink+0x80>
	}
    407e:	e7cc      	b.n	401a <blink+0x1a>
}
    4080:	3714      	adds	r7, #20
    4082:	46bd      	mov	sp, r7
    4084:	f85d 7b04 	ldr.w	r7, [sp], #4
    4088:	4770      	bx	lr
    408a:	bf00      	nop
    408c:	0000379c 	.word	0x0000379c
