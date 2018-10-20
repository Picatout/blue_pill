
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 59 02 00 00 d9 01 00 00     .P. 1...Y.......
      10:	5d 02 00 00 61 02 00 00 65 02 00 00 8d 14 00 00     ]...a...e.......
      20:	8d 14 00 00 8d 14 00 00 8d 14 00 00 a5 05 00 00     ................
      30:	8d 14 00 00 8d 14 00 00 6d 02 00 00 11 07 00 00     ........m.......
      40:	75 02 00 00 79 02 00 00 81 02 00 00 7d 02 00 00     u...y.......}...
      50:	85 02 00 00 89 02 00 00 8d 02 00 00 91 02 00 00     ................
      60:	95 02 00 00 99 02 00 00 9d 02 00 00 a1 02 00 00     ................
      70:	a5 02 00 00 8d 14 00 00 8d 14 00 00 8d 14 00 00     ................
      80:	8d 14 00 00 8d 14 00 00 8d 14 00 00 8d 14 00 00     ................
      90:	8d 14 00 00 8d 14 00 00 8d 14 00 00 8d 14 00 00     ................
      a0:	8d 14 00 00 8d 14 00 00 8d 14 00 00 8d 14 00 00     ................
      b0:	8d 14 00 00 8d 14 00 00 8d 14 00 00 8d 14 00 00     ................
      c0:	8d 14 00 00 8d 14 00 00 8d 14 00 00 8d 14 00 00     ................
      d0:	8d 14 00 00 a9 02 00 00 f1 0d 00 00 b1 02 00 00     ................
      e0:	8d 14 00 00 8d 14 00 00 8d 14 00 00 8d 14 00 00     ................
      f0:	8d 14 00 00 8d 14 00 00 8d 14 00 00 8d 14 00 00     ................
     100:	8d 14 00 00 8d 14 00 00 8d 14 00 00 8d 14 00 00     ................
     110:	8d 14 00 00 8d 14 00 00 8d 14 00 00 8d 14 00 00     ................
     120:	8d 14 00 00 8d 14 00 00 8d 14 00 00 8d 14 00 00     ................

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
     1aa:	f000 fddb 	bl	d64 <main>
}
     1ae:	3718      	adds	r7, #24
     1b0:	46bd      	mov	sp, r7
     1b2:	bd80      	pop	{r7, pc}
     1b4:	20000070 	.word	0x20000070
     1b8:	20000148 	.word	0x20000148
     1bc:	000019a0 	.word	0x000019a0
     1c0:	20000000 	.word	0x20000000
     1c4:	20000070 	.word	0x20000070
     1c8:	20000160 	.word	0x20000160
     1cc:	20000144 	.word	0x20000144
     1d0:	e000ed14 	.word	0xe000ed14
     1d4:	20004c00 	.word	0x20004c00

000001d8 <HARD_FAULT_handler>:
	print_hex(((*(sfrp_t)0xE000ED28)&0xff));
	while(1);
}


_exception(HARD_FAULT_handler){
     1d8:	4668      	mov	r0, sp
     1da:	f020 0107 	bic.w	r1, r0, #7
     1de:	468d      	mov	sp, r1
     1e0:	b581      	push	{r0, r7, lr}
     1e2:	b083      	sub	sp, #12
     1e4:	af00      	add	r7, sp, #0
		uint32_t adr;
		asm volatile (
     1e6:	f3ef 8009 	mrs	r0, PSP
     1ea:	6983      	ldr	r3, [r0, #24]
     1ec:	607b      	str	r3, [r7, #4]
	"mrs r0,PSP\n" // optient la valeur de PSP
	"ldr %[adr],[r0,#24]\n" // obtient le PC
    : [adr] "=r" (adr));
	if ((*(sfrp_t)0xE000ED28)&0x7f){
     1ee:	4b15      	ldr	r3, [pc, #84]	; (244 <HARD_FAULT_handler+0x6c>)
     1f0:	681b      	ldr	r3, [r3, #0]
     1f2:	f003 037f 	and.w	r3, r3, #127	; 0x7f
     1f6:	2b00      	cmp	r3, #0
     1f8:	d004      	beq.n	204 <HARD_FAULT_handler+0x2c>
		print_fault("memory manager fault ",adr);
     1fa:	4813      	ldr	r0, [pc, #76]	; (248 <HARD_FAULT_handler+0x70>)
     1fc:	6879      	ldr	r1, [r7, #4]
     1fe:	f001 f94d 	bl	149c <print_fault>
     202:	e019      	b.n	238 <HARD_FAULT_handler+0x60>
	}else if (((*(sfrp_t)0xE000ED28)&0xff00)){
     204:	4b0f      	ldr	r3, [pc, #60]	; (244 <HARD_FAULT_handler+0x6c>)
     206:	681b      	ldr	r3, [r3, #0]
     208:	f403 437f 	and.w	r3, r3, #65280	; 0xff00
     20c:	2b00      	cmp	r3, #0
     20e:	d004      	beq.n	21a <HARD_FAULT_handler+0x42>
		print_fault("bus fault ",adr);
     210:	480e      	ldr	r0, [pc, #56]	; (24c <HARD_FAULT_handler+0x74>)
     212:	6879      	ldr	r1, [r7, #4]
     214:	f001 f942 	bl	149c <print_fault>
     218:	e00e      	b.n	238 <HARD_FAULT_handler+0x60>
	}else if ((*(sfrp_t)0xE000ED28)&0xffff0000){
     21a:	4b0a      	ldr	r3, [pc, #40]	; (244 <HARD_FAULT_handler+0x6c>)
     21c:	681b      	ldr	r3, [r3, #0]
     21e:	0c1b      	lsrs	r3, r3, #16
     220:	041b      	lsls	r3, r3, #16
     222:	2b00      	cmp	r3, #0
     224:	d004      	beq.n	230 <HARD_FAULT_handler+0x58>
		print_fault("usage fault ",adr);
     226:	480a      	ldr	r0, [pc, #40]	; (250 <HARD_FAULT_handler+0x78>)
     228:	6879      	ldr	r1, [r7, #4]
     22a:	f001 f937 	bl	149c <print_fault>
     22e:	e003      	b.n	238 <HARD_FAULT_handler+0x60>
	}else{
		print_fault("hard fault  ",adr);
     230:	4808      	ldr	r0, [pc, #32]	; (254 <HARD_FAULT_handler+0x7c>)
     232:	6879      	ldr	r1, [r7, #4]
     234:	f001 f932 	bl	149c <print_fault>
	}
}
     238:	370c      	adds	r7, #12
     23a:	46bd      	mov	sp, r7
     23c:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     240:	4685      	mov	sp, r0
     242:	4770      	bx	lr
     244:	e000ed28 	.word	0xe000ed28
     248:	000018c8 	.word	0x000018c8
     24c:	000018e0 	.word	0x000018e0
     250:	000018ec 	.word	0x000018ec
     254:	000018fc 	.word	0x000018fc

00000258 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     258:	f001 f918 	bl	148c <reset_mcu>

0000025c <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     25c:	f001 f916 	bl	148c <reset_mcu>

00000260 <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     260:	f001 f914 	bl	148c <reset_mcu>

00000264 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     264:	f001 f912 	bl	148c <reset_mcu>
_default_handler(SVC_handler) // 11
     268:	f001 f910 	bl	148c <reset_mcu>

0000026c <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     26c:	f001 f90e 	bl	148c <reset_mcu>
_default_handler(STK_handler) // 15
     270:	f001 f90c 	bl	148c <reset_mcu>

00000274 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     274:	f001 f90a 	bl	148c <reset_mcu>

00000278 <PVD_handler>:
_default_handler(PVD_handler) // 1
     278:	f001 f908 	bl	148c <reset_mcu>

0000027c <RTC_handler>:
_default_handler(RTC_handler) // 2
     27c:	f001 f906 	bl	148c <reset_mcu>

00000280 <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     280:	f001 f904 	bl	148c <reset_mcu>

00000284 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     284:	f001 f902 	bl	148c <reset_mcu>

00000288 <RCC_handler>:
_default_handler(RCC_handler) // 5
     288:	f001 f900 	bl	148c <reset_mcu>

0000028c <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     28c:	f001 f8fe 	bl	148c <reset_mcu>

00000290 <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     290:	f001 f8fc 	bl	148c <reset_mcu>

00000294 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     294:	f001 f8fa 	bl	148c <reset_mcu>

00000298 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     298:	f001 f8f8 	bl	148c <reset_mcu>

0000029c <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     29c:	f001 f8f6 	bl	148c <reset_mcu>

000002a0 <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2a0:	f001 f8f4 	bl	148c <reset_mcu>

000002a4 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2a4:	f001 f8f2 	bl	148c <reset_mcu>

000002a8 <USART1_handler>:

_default_handler(USART1_handler) // 37
     2a8:	f001 f8f0 	bl	148c <reset_mcu>
_default_handler(USART2_handler) // 38
     2ac:	f001 f8ee 	bl	148c <reset_mcu>

000002b0 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2b0:	f001 f8ec 	bl	148c <reset_mcu>

000002b4 <strcmp>:
extern unsigned int _FLASH_FREE;
extern unsigned int _DATA_ROM_START;

uint32_t proga;

int strcmp(const char *s1, const char *s2){
     2b4:	b480      	push	{r7}
     2b6:	b085      	sub	sp, #20
     2b8:	af00      	add	r7, sp, #0
     2ba:	6078      	str	r0, [r7, #4]
     2bc:	6039      	str	r1, [r7, #0]
	int result=0;
     2be:	2300      	movs	r3, #0
     2c0:	60fb      	str	r3, [r7, #12]
	while (*s1 && *s2){
     2c2:	e018      	b.n	2f6 <strcmp+0x42>
		if (*s1<*s2){
     2c4:	687b      	ldr	r3, [r7, #4]
     2c6:	781a      	ldrb	r2, [r3, #0]
     2c8:	683b      	ldr	r3, [r7, #0]
     2ca:	781b      	ldrb	r3, [r3, #0]
     2cc:	429a      	cmp	r2, r3
     2ce:	d203      	bcs.n	2d8 <strcmp+0x24>
			result=-1;
     2d0:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     2d4:	60fb      	str	r3, [r7, #12]
			break;
     2d6:	e016      	b.n	306 <strcmp+0x52>
		}else if (*s1>*s2){
     2d8:	687b      	ldr	r3, [r7, #4]
     2da:	781a      	ldrb	r2, [r3, #0]
     2dc:	683b      	ldr	r3, [r7, #0]
     2de:	781b      	ldrb	r3, [r3, #0]
     2e0:	429a      	cmp	r2, r3
     2e2:	d902      	bls.n	2ea <strcmp+0x36>
			result=1;
     2e4:	2301      	movs	r3, #1
     2e6:	60fb      	str	r3, [r7, #12]
			break;
     2e8:	e00d      	b.n	306 <strcmp+0x52>
		}
		s1++;
     2ea:	687b      	ldr	r3, [r7, #4]
     2ec:	3301      	adds	r3, #1
     2ee:	607b      	str	r3, [r7, #4]
		s2++;
     2f0:	683b      	ldr	r3, [r7, #0]
     2f2:	3301      	adds	r3, #1
     2f4:	603b      	str	r3, [r7, #0]

uint32_t proga;

int strcmp(const char *s1, const char *s2){
	int result=0;
	while (*s1 && *s2){
     2f6:	687b      	ldr	r3, [r7, #4]
     2f8:	781b      	ldrb	r3, [r3, #0]
     2fa:	2b00      	cmp	r3, #0
     2fc:	d003      	beq.n	306 <strcmp+0x52>
     2fe:	683b      	ldr	r3, [r7, #0]
     300:	781b      	ldrb	r3, [r3, #0]
     302:	2b00      	cmp	r3, #0
     304:	d1de      	bne.n	2c4 <strcmp+0x10>
			break;
		}
		s1++;
		s2++;
	}
	if (!result){
     306:	68fb      	ldr	r3, [r7, #12]
     308:	2b00      	cmp	r3, #0
     30a:	d115      	bne.n	338 <strcmp+0x84>
		if (!*s1 && *s2){
     30c:	687b      	ldr	r3, [r7, #4]
     30e:	781b      	ldrb	r3, [r3, #0]
     310:	2b00      	cmp	r3, #0
     312:	d107      	bne.n	324 <strcmp+0x70>
     314:	683b      	ldr	r3, [r7, #0]
     316:	781b      	ldrb	r3, [r3, #0]
     318:	2b00      	cmp	r3, #0
     31a:	d003      	beq.n	324 <strcmp+0x70>
			result=-1;
     31c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     320:	60fb      	str	r3, [r7, #12]
     322:	e009      	b.n	338 <strcmp+0x84>
		}else if (*s1 && !*s2) {
     324:	687b      	ldr	r3, [r7, #4]
     326:	781b      	ldrb	r3, [r3, #0]
     328:	2b00      	cmp	r3, #0
     32a:	d005      	beq.n	338 <strcmp+0x84>
     32c:	683b      	ldr	r3, [r7, #0]
     32e:	781b      	ldrb	r3, [r3, #0]
     330:	2b00      	cmp	r3, #0
     332:	d101      	bne.n	338 <strcmp+0x84>
			result=1;
     334:	2301      	movs	r3, #1
     336:	60fb      	str	r3, [r7, #12]
		}
	}
	return result;
     338:	68fb      	ldr	r3, [r7, #12]
}
     33a:	4618      	mov	r0, r3
     33c:	3714      	adds	r7, #20
     33e:	46bd      	mov	sp, r7
     340:	f85d 7b04 	ldr.w	r7, [sp], #4
     344:	4770      	bx	lr
     346:	bf00      	nop

00000348 <digit>:

int digit(char c){
     348:	b480      	push	{r7}
     34a:	b083      	sub	sp, #12
     34c:	af00      	add	r7, sp, #0
     34e:	4603      	mov	r3, r0
     350:	71fb      	strb	r3, [r7, #7]
   return ((c>='0') && (c<='9'));
     352:	79fb      	ldrb	r3, [r7, #7]
     354:	2b2f      	cmp	r3, #47	; 0x2f
     356:	d904      	bls.n	362 <digit+0x1a>
     358:	79fb      	ldrb	r3, [r7, #7]
     35a:	2b39      	cmp	r3, #57	; 0x39
     35c:	d801      	bhi.n	362 <digit+0x1a>
     35e:	2301      	movs	r3, #1
     360:	e000      	b.n	364 <digit+0x1c>
     362:	2300      	movs	r3, #0
}
     364:	4618      	mov	r0, r3
     366:	370c      	adds	r7, #12
     368:	46bd      	mov	sp, r7
     36a:	f85d 7b04 	ldr.w	r7, [sp], #4
     36e:	4770      	bx	lr

00000370 <hexdigit>:

int hexdigit(char c){
     370:	b580      	push	{r7, lr}
     372:	b082      	sub	sp, #8
     374:	af00      	add	r7, sp, #0
     376:	4603      	mov	r3, r0
     378:	71fb      	strb	r3, [r7, #7]
	if (c>='a') c-=32;
     37a:	79fb      	ldrb	r3, [r7, #7]
     37c:	2b60      	cmp	r3, #96	; 0x60
     37e:	d902      	bls.n	386 <hexdigit+0x16>
     380:	79fb      	ldrb	r3, [r7, #7]
     382:	3b20      	subs	r3, #32
     384:	71fb      	strb	r3, [r7, #7]
	return (digit(c) || (c>='A' && c<='F'));
     386:	79fb      	ldrb	r3, [r7, #7]
     388:	4618      	mov	r0, r3
     38a:	f7ff ffdd 	bl	348 <digit>
     38e:	4603      	mov	r3, r0
     390:	2b00      	cmp	r3, #0
     392:	d105      	bne.n	3a0 <hexdigit+0x30>
     394:	79fb      	ldrb	r3, [r7, #7]
     396:	2b40      	cmp	r3, #64	; 0x40
     398:	d904      	bls.n	3a4 <hexdigit+0x34>
     39a:	79fb      	ldrb	r3, [r7, #7]
     39c:	2b46      	cmp	r3, #70	; 0x46
     39e:	d801      	bhi.n	3a4 <hexdigit+0x34>
     3a0:	2301      	movs	r3, #1
     3a2:	e000      	b.n	3a6 <hexdigit+0x36>
     3a4:	2300      	movs	r3, #0
}
     3a6:	4618      	mov	r0, r3
     3a8:	3708      	adds	r7, #8
     3aa:	46bd      	mov	sp, r7
     3ac:	bd80      	pop	{r7, pc}
     3ae:	bf00      	nop

000003b0 <atoi>:

int atoi(const char *str){
     3b0:	b580      	push	{r7, lr}
     3b2:	b086      	sub	sp, #24
     3b4:	af00      	add	r7, sp, #0
     3b6:	6078      	str	r0, [r7, #4]
	int n=0,sign=1,base=10;
     3b8:	2300      	movs	r3, #0
     3ba:	617b      	str	r3, [r7, #20]
     3bc:	2301      	movs	r3, #1
     3be:	613b      	str	r3, [r7, #16]
     3c0:	230a      	movs	r3, #10
     3c2:	60fb      	str	r3, [r7, #12]
    char c;
    
	while (*str && (*str==SPACE)) str++;
     3c4:	e002      	b.n	3cc <atoi+0x1c>
     3c6:	687b      	ldr	r3, [r7, #4]
     3c8:	3301      	adds	r3, #1
     3ca:	607b      	str	r3, [r7, #4]
     3cc:	687b      	ldr	r3, [r7, #4]
     3ce:	781b      	ldrb	r3, [r3, #0]
     3d0:	2b00      	cmp	r3, #0
     3d2:	d003      	beq.n	3dc <atoi+0x2c>
     3d4:	687b      	ldr	r3, [r7, #4]
     3d6:	781b      	ldrb	r3, [r3, #0]
     3d8:	2b20      	cmp	r3, #32
     3da:	d0f4      	beq.n	3c6 <atoi+0x16>
	if (*str=='-'){
     3dc:	687b      	ldr	r3, [r7, #4]
     3de:	781b      	ldrb	r3, [r3, #0]
     3e0:	2b2d      	cmp	r3, #45	; 0x2d
     3e2:	d105      	bne.n	3f0 <atoi+0x40>
		sign=-1;
     3e4:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     3e8:	613b      	str	r3, [r7, #16]
		str++;
     3ea:	687b      	ldr	r3, [r7, #4]
     3ec:	3301      	adds	r3, #1
     3ee:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
     3f0:	687b      	ldr	r3, [r7, #4]
     3f2:	781b      	ldrb	r3, [r3, #0]
     3f4:	2b30      	cmp	r3, #48	; 0x30
     3f6:	d10e      	bne.n	416 <atoi+0x66>
     3f8:	687b      	ldr	r3, [r7, #4]
     3fa:	3301      	adds	r3, #1
     3fc:	781b      	ldrb	r3, [r3, #0]
     3fe:	2b78      	cmp	r3, #120	; 0x78
     400:	d004      	beq.n	40c <atoi+0x5c>
     402:	687b      	ldr	r3, [r7, #4]
     404:	3301      	adds	r3, #1
     406:	781b      	ldrb	r3, [r3, #0]
     408:	2b58      	cmp	r3, #88	; 0x58
     40a:	d104      	bne.n	416 <atoi+0x66>
		base=16;
     40c:	2310      	movs	r3, #16
     40e:	60fb      	str	r3, [r7, #12]
		str+=2;
     410:	687b      	ldr	r3, [r7, #4]
     412:	3302      	adds	r3, #2
     414:	607b      	str	r3, [r7, #4]
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     416:	e018      	b.n	44a <atoi+0x9a>
		if (c>='a'){c-=32;}
     418:	7afb      	ldrb	r3, [r7, #11]
     41a:	2b60      	cmp	r3, #96	; 0x60
     41c:	d902      	bls.n	424 <atoi+0x74>
     41e:	7afb      	ldrb	r3, [r7, #11]
     420:	3b20      	subs	r3, #32
     422:	72fb      	strb	r3, [r7, #11]
		c-='0';
     424:	7afb      	ldrb	r3, [r7, #11]
     426:	3b30      	subs	r3, #48	; 0x30
     428:	72fb      	strb	r3, [r7, #11]
		if (c>9){c-=7;}
     42a:	7afb      	ldrb	r3, [r7, #11]
     42c:	2b09      	cmp	r3, #9
     42e:	d902      	bls.n	436 <atoi+0x86>
     430:	7afb      	ldrb	r3, [r7, #11]
     432:	3b07      	subs	r3, #7
     434:	72fb      	strb	r3, [r7, #11]
		n=n*base+c;
     436:	697b      	ldr	r3, [r7, #20]
     438:	68fa      	ldr	r2, [r7, #12]
     43a:	fb02 f203 	mul.w	r2, r2, r3
     43e:	7afb      	ldrb	r3, [r7, #11]
     440:	4413      	add	r3, r2
     442:	617b      	str	r3, [r7, #20]
		str++;
     444:	687b      	ldr	r3, [r7, #4]
     446:	3301      	adds	r3, #1
     448:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
		base=16;
		str+=2;
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
     44a:	687b      	ldr	r3, [r7, #4]
     44c:	781b      	ldrb	r3, [r3, #0]
     44e:	72fb      	strb	r3, [r7, #11]
     450:	7afb      	ldrb	r3, [r7, #11]
     452:	2b00      	cmp	r3, #0
     454:	d00d      	beq.n	472 <atoi+0xc2>
     456:	68fb      	ldr	r3, [r7, #12]
     458:	2b0a      	cmp	r3, #10
     45a:	d10a      	bne.n	472 <atoi+0xc2>
     45c:	7afb      	ldrb	r3, [r7, #11]
     45e:	4618      	mov	r0, r3
     460:	f7ff ff72 	bl	348 <digit>
     464:	4603      	mov	r3, r0
     466:	2b00      	cmp	r3, #0
     468:	bf14      	ite	ne
     46a:	2301      	movne	r3, #1
     46c:	2300      	moveq	r3, #0
     46e:	b2db      	uxtb	r3, r3
     470:	e009      	b.n	486 <atoi+0xd6>
     472:	7afb      	ldrb	r3, [r7, #11]
     474:	4618      	mov	r0, r3
     476:	f7ff ff7b 	bl	370 <hexdigit>
     47a:	4603      	mov	r3, r0
     47c:	2b00      	cmp	r3, #0
     47e:	bf14      	ite	ne
     480:	2301      	movne	r3, #1
     482:	2300      	moveq	r3, #0
     484:	b2db      	uxtb	r3, r3
     486:	2b00      	cmp	r3, #0
     488:	d1c6      	bne.n	418 <atoi+0x68>
		c-='0';
		if (c>9){c-=7;}
		n=n*base+c;
		str++;
	}
	return sign*n;
     48a:	693b      	ldr	r3, [r7, #16]
     48c:	697a      	ldr	r2, [r7, #20]
     48e:	fb02 f303 	mul.w	r3, r2, r3
}
     492:	4618      	mov	r0, r3
     494:	3718      	adds	r7, #24
     496:	46bd      	mov	sp, r7
     498:	bd80      	pop	{r7, pc}
     49a:	bf00      	nop

0000049c <led_on>:
static void move(char *src , char *dest, int len);
static void word();

// routine de services

inline void led_on(){
     49c:	b480      	push	{r7}
     49e:	af00      	add	r7, sp, #0
	GPIOC_BRR->brr=GRN_LED;
     4a0:	4b04      	ldr	r3, [pc, #16]	; (4b4 <led_on+0x18>)
     4a2:	681b      	ldr	r3, [r3, #0]
     4a4:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4a8:	601a      	str	r2, [r3, #0]
}
     4aa:	46bd      	mov	sp, r7
     4ac:	f85d 7b04 	ldr.w	r7, [sp], #4
     4b0:	4770      	bx	lr
     4b2:	bf00      	nop
     4b4:	2000005c 	.word	0x2000005c

000004b8 <led_off>:

inline void led_off(){
     4b8:	b480      	push	{r7}
     4ba:	af00      	add	r7, sp, #0
	GPIOC_BSRR->bsrr=GRN_LED;
     4bc:	4b04      	ldr	r3, [pc, #16]	; (4d0 <led_off+0x18>)
     4be:	681b      	ldr	r3, [r3, #0]
     4c0:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4c4:	601a      	str	r2, [r3, #0]
}
     4c6:	46bd      	mov	sp, r7
     4c8:	f85d 7b04 	ldr.w	r7, [sp], #4
     4cc:	4770      	bx	lr
     4ce:	bf00      	nop
     4d0:	20000058 	.word	0x20000058

000004d4 <set_timer>:

inline void set_timer(unsigned time){
     4d4:	b480      	push	{r7}
     4d6:	b083      	sub	sp, #12
     4d8:	af00      	add	r7, sp, #0
     4da:	6078      	str	r0, [r7, #4]
	timer=time;
     4dc:	4a03      	ldr	r2, [pc, #12]	; (4ec <set_timer+0x18>)
     4de:	687b      	ldr	r3, [r7, #4]
     4e0:	6013      	str	r3, [r2, #0]
}
     4e2:	370c      	adds	r7, #12
     4e4:	46bd      	mov	sp, r7
     4e6:	f85d 7b04 	ldr.w	r7, [sp], #4
     4ea:	4770      	bx	lr
     4ec:	20000074 	.word	0x20000074

000004f0 <get_timer>:

inline unsigned get_timer(){
     4f0:	b480      	push	{r7}
     4f2:	af00      	add	r7, sp, #0
	return timer;
     4f4:	4b03      	ldr	r3, [pc, #12]	; (504 <get_timer+0x14>)
     4f6:	681b      	ldr	r3, [r3, #0]
}
     4f8:	4618      	mov	r0, r3
     4fa:	46bd      	mov	sp, r7
     4fc:	f85d 7b04 	ldr.w	r7, [sp], #4
     500:	4770      	bx	lr
     502:	bf00      	nop
     504:	20000074 	.word	0x20000074

00000508 <peek8>:

inline uint8_t peek8(uint8_t *adr){
     508:	b480      	push	{r7}
     50a:	b083      	sub	sp, #12
     50c:	af00      	add	r7, sp, #0
     50e:	6078      	str	r0, [r7, #4]
	return *adr;
     510:	687b      	ldr	r3, [r7, #4]
     512:	781b      	ldrb	r3, [r3, #0]
}
     514:	4618      	mov	r0, r3
     516:	370c      	adds	r7, #12
     518:	46bd      	mov	sp, r7
     51a:	f85d 7b04 	ldr.w	r7, [sp], #4
     51e:	4770      	bx	lr

00000520 <peek16>:

inline uint16_t peek16(uint16_t *adr){
     520:	b480      	push	{r7}
     522:	b083      	sub	sp, #12
     524:	af00      	add	r7, sp, #0
     526:	6078      	str	r0, [r7, #4]
	return *adr;
     528:	687b      	ldr	r3, [r7, #4]
     52a:	881b      	ldrh	r3, [r3, #0]
}
     52c:	4618      	mov	r0, r3
     52e:	370c      	adds	r7, #12
     530:	46bd      	mov	sp, r7
     532:	f85d 7b04 	ldr.w	r7, [sp], #4
     536:	4770      	bx	lr

00000538 <peek32>:

inline uint32_t peek32(uint32_t *adr){
     538:	b480      	push	{r7}
     53a:	b083      	sub	sp, #12
     53c:	af00      	add	r7, sp, #0
     53e:	6078      	str	r0, [r7, #4]
	return *adr;
     540:	687b      	ldr	r3, [r7, #4]
     542:	681b      	ldr	r3, [r3, #0]
}
     544:	4618      	mov	r0, r3
     546:	370c      	adds	r7, #12
     548:	46bd      	mov	sp, r7
     54a:	f85d 7b04 	ldr.w	r7, [sp], #4
     54e:	4770      	bx	lr

00000550 <poke8>:

inline void poke8(uint8_t *adr, uint8_t value){
     550:	b480      	push	{r7}
     552:	b083      	sub	sp, #12
     554:	af00      	add	r7, sp, #0
     556:	6078      	str	r0, [r7, #4]
     558:	460b      	mov	r3, r1
     55a:	70fb      	strb	r3, [r7, #3]
	*adr=value;
     55c:	687b      	ldr	r3, [r7, #4]
     55e:	78fa      	ldrb	r2, [r7, #3]
     560:	701a      	strb	r2, [r3, #0]
}
     562:	370c      	adds	r7, #12
     564:	46bd      	mov	sp, r7
     566:	f85d 7b04 	ldr.w	r7, [sp], #4
     56a:	4770      	bx	lr

0000056c <poke16>:

inline void poke16(uint16_t *adr, uint16_t value){
     56c:	b480      	push	{r7}
     56e:	b083      	sub	sp, #12
     570:	af00      	add	r7, sp, #0
     572:	6078      	str	r0, [r7, #4]
     574:	460b      	mov	r3, r1
     576:	807b      	strh	r3, [r7, #2]
	*adr=value;
     578:	687b      	ldr	r3, [r7, #4]
     57a:	887a      	ldrh	r2, [r7, #2]
     57c:	801a      	strh	r2, [r3, #0]
}
     57e:	370c      	adds	r7, #12
     580:	46bd      	mov	sp, r7
     582:	f85d 7b04 	ldr.w	r7, [sp], #4
     586:	4770      	bx	lr

00000588 <poke32>:

inline void poke32(uint32_t *adr, uint32_t value){
     588:	b480      	push	{r7}
     58a:	b083      	sub	sp, #12
     58c:	af00      	add	r7, sp, #0
     58e:	6078      	str	r0, [r7, #4]
     590:	6039      	str	r1, [r7, #0]
	*adr=value;
     592:	687b      	ldr	r3, [r7, #4]
     594:	683a      	ldr	r2, [r7, #0]
     596:	601a      	str	r2, [r3, #0]
}
     598:	370c      	adds	r7, #12
     59a:	46bd      	mov	sp, r7
     59c:	f85d 7b04 	ldr.w	r7, [sp], #4
     5a0:	4770      	bx	lr
     5a2:	bf00      	nop

000005a4 <SVC_handler>:

// interruption multiplexeur des appels de services
void __attribute__((__interrupt__)) SVC_handler(){
     5a4:	4668      	mov	r0, sp
     5a6:	f020 0107 	bic.w	r1, r0, #7
     5aa:	468d      	mov	sp, r1
     5ac:	b581      	push	{r0, r7, lr}
     5ae:	b085      	sub	sp, #20
     5b0:	af00      	add	r7, sp, #0
	int svc_id;
	void *arg1, *argv; 
	asm volatile (
     5b2:	f3ef 8009 	mrs	r0, PSP
     5b6:	6981      	ldr	r1, [r0, #24]
     5b8:	f811 1c02 	ldrb.w	r1, [r1, #-2]
     5bc:	6802      	ldr	r2, [r0, #0]
     5be:	6843      	ldr	r3, [r0, #4]
     5c0:	60f9      	str	r1, [r7, #12]
     5c2:	60ba      	str	r2, [r7, #8]
     5c4:	607b      	str	r3, [r7, #4]
    "ldrb %[svc_id], [r1,#-2]\n" // charge l'octet faible i.e. no de service
    "ldr %[arg1],[r0]\n"
    "ldr %[argv],[r0,#4]\n"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [argv] "=r" (argv) 
    );
	switch (svc_id){
     5c6:	68fb      	ldr	r3, [r7, #12]
     5c8:	2b10      	cmp	r3, #16
     5ca:	f200 809b 	bhi.w	704 <SVC_handler+0x160>
     5ce:	a201      	add	r2, pc, #4	; (adr r2, 5d4 <SVC_handler+0x30>)
     5d0:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     5d4:	000006ff 	.word	0x000006ff
     5d8:	00000619 	.word	0x00000619
     5dc:	0000061f 	.word	0x0000061f
     5e0:	00000625 	.word	0x00000625
     5e4:	00000631 	.word	0x00000631
     5e8:	0000063d 	.word	0x0000063d
     5ec:	0000064b 	.word	0x0000064b
     5f0:	00000657 	.word	0x00000657
     5f4:	0000066b 	.word	0x0000066b
     5f8:	00000673 	.word	0x00000673
     5fc:	0000067f 	.word	0x0000067f
     600:	00000689 	.word	0x00000689
     604:	0000069d 	.word	0x0000069d
     608:	000006b1 	.word	0x000006b1
     60c:	000006c3 	.word	0x000006c3
     610:	000006d7 	.word	0x000006d7
     614:	000006eb 	.word	0x000006eb
	case SVC_LED_ON: 
		led_on();
     618:	f7ff ff40 	bl	49c <led_on>
		break;
     61c:	e072      	b.n	704 <SVC_handler+0x160>
	case SVC_LED_OFF:
		led_off();
     61e:	f7ff ff4b 	bl	4b8 <led_off>
		break;
     622:	e06f      	b.n	704 <SVC_handler+0x160>
	case SVC_TIMER:
		set_timer(*(unsigned*)arg1);
     624:	68bb      	ldr	r3, [r7, #8]
     626:	681b      	ldr	r3, [r3, #0]
     628:	4618      	mov	r0, r3
     62a:	f7ff ff53 	bl	4d4 <set_timer>
		break;
     62e:	e069      	b.n	704 <SVC_handler+0x160>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=get_timer();
     630:	f7ff ff5e 	bl	4f0 <get_timer>
     634:	4602      	mov	r2, r0
     636:	68bb      	ldr	r3, [r7, #8]
     638:	601a      	str	r2, [r3, #0]
		break;
     63a:	e063      	b.n	704 <SVC_handler+0x160>
	case SVC_CONIN:
		*(char *)arg1=conin();
     63c:	f000 fc12 	bl	e64 <conin>
     640:	4603      	mov	r3, r0
     642:	461a      	mov	r2, r3
     644:	68bb      	ldr	r3, [r7, #8]
     646:	701a      	strb	r2, [r3, #0]
		break;
     648:	e05c      	b.n	704 <SVC_handler+0x160>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     64a:	68bb      	ldr	r3, [r7, #8]
     64c:	781b      	ldrb	r3, [r3, #0]
     64e:	4618      	mov	r0, r3
     650:	f000 fbf8 	bl	e44 <conout>
		break;
     654:	e056      	b.n	704 <SVC_handler+0x160>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)argv,*(unsigned *)arg1);
     656:	68bb      	ldr	r3, [r7, #8]
     658:	681b      	ldr	r3, [r3, #0]
     65a:	6878      	ldr	r0, [r7, #4]
     65c:	4619      	mov	r1, r3
     65e:	f000 fc79 	bl	f54 <read_line>
     662:	4602      	mov	r2, r0
     664:	68bb      	ldr	r3, [r7, #8]
     666:	601a      	str	r2, [r3, #0]
		break;
     668:	e04c      	b.n	704 <SVC_handler+0x160>
	case SVC_PRINT:
		print((const char*)arg1);
     66a:	68b8      	ldr	r0, [r7, #8]
     66c:	f000 fc1c 	bl	ea8 <print>
		break;
     670:	e048      	b.n	704 <SVC_handler+0x160>
	case SVC_PRINT_INT:
		print_int((int32_t)arg1,10);
     672:	68bb      	ldr	r3, [r7, #8]
     674:	4618      	mov	r0, r3
     676:	210a      	movs	r1, #10
     678:	f000 fd16 	bl	10a8 <print_int>
		break;
     67c:	e042      	b.n	704 <SVC_handler+0x160>
	case SVC_PRINT_HEX:
		print_hex((uint32_t)arg1);
     67e:	68bb      	ldr	r3, [r7, #8]
     680:	4618      	mov	r0, r3
     682:	f000 fd7f 	bl	1184 <print_hex>
		break;
     686:	e03d      	b.n	704 <SVC_handler+0x160>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     688:	68bb      	ldr	r3, [r7, #8]
     68a:	681b      	ldr	r3, [r3, #0]
     68c:	4618      	mov	r0, r3
     68e:	f7ff ff3b 	bl	508 <peek8>
     692:	4603      	mov	r3, r0
     694:	461a      	mov	r2, r3
     696:	68bb      	ldr	r3, [r7, #8]
     698:	701a      	strb	r2, [r3, #0]
		break;
     69a:	e033      	b.n	704 <SVC_handler+0x160>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     69c:	68bb      	ldr	r3, [r7, #8]
     69e:	681b      	ldr	r3, [r3, #0]
     6a0:	4618      	mov	r0, r3
     6a2:	f7ff ff3d 	bl	520 <peek16>
     6a6:	4603      	mov	r3, r0
     6a8:	461a      	mov	r2, r3
     6aa:	68bb      	ldr	r3, [r7, #8]
     6ac:	801a      	strh	r2, [r3, #0]
		break;
     6ae:	e029      	b.n	704 <SVC_handler+0x160>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     6b0:	68bb      	ldr	r3, [r7, #8]
     6b2:	681b      	ldr	r3, [r3, #0]
     6b4:	4618      	mov	r0, r3
     6b6:	f7ff ff3f 	bl	538 <peek32>
     6ba:	4602      	mov	r2, r0
     6bc:	68bb      	ldr	r3, [r7, #8]
     6be:	601a      	str	r2, [r3, #0]
		break;
     6c0:	e020      	b.n	704 <SVC_handler+0x160>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)argv);
     6c2:	68bb      	ldr	r3, [r7, #8]
     6c4:	681b      	ldr	r3, [r3, #0]
     6c6:	461a      	mov	r2, r3
     6c8:	687b      	ldr	r3, [r7, #4]
     6ca:	781b      	ldrb	r3, [r3, #0]
     6cc:	4610      	mov	r0, r2
     6ce:	4619      	mov	r1, r3
     6d0:	f7ff ff3e 	bl	550 <poke8>
		break;
     6d4:	e016      	b.n	704 <SVC_handler+0x160>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)argv);
     6d6:	68bb      	ldr	r3, [r7, #8]
     6d8:	681b      	ldr	r3, [r3, #0]
     6da:	461a      	mov	r2, r3
     6dc:	687b      	ldr	r3, [r7, #4]
     6de:	881b      	ldrh	r3, [r3, #0]
     6e0:	4610      	mov	r0, r2
     6e2:	4619      	mov	r1, r3
     6e4:	f7ff ff42 	bl	56c <poke16>
		break;
     6e8:	e00c      	b.n	704 <SVC_handler+0x160>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)argv);
     6ea:	68bb      	ldr	r3, [r7, #8]
     6ec:	681b      	ldr	r3, [r3, #0]
     6ee:	461a      	mov	r2, r3
     6f0:	687b      	ldr	r3, [r7, #4]
     6f2:	681b      	ldr	r3, [r3, #0]
     6f4:	4610      	mov	r0, r2
     6f6:	4619      	mov	r1, r3
     6f8:	f7ff ff46 	bl	588 <poke32>
		break;
     6fc:	e002      	b.n	704 <SVC_handler+0x160>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     6fe:	f000 fec5 	bl	148c <reset_mcu>
	    break;
     702:	bf00      	nop
	}	
}
     704:	3714      	adds	r7, #20
     706:	46bd      	mov	sp, r7
     708:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     70c:	4685      	mov	sp, r0
     70e:	4770      	bx	lr

00000710 <STK_handler>:

// interruption coretimer
void __attribute__((naked)) STK_handler(){
	ticks++;
     710:	4b06      	ldr	r3, [pc, #24]	; (72c <STK_handler+0x1c>)
     712:	681b      	ldr	r3, [r3, #0]
     714:	3301      	adds	r3, #1
     716:	4a05      	ldr	r2, [pc, #20]	; (72c <STK_handler+0x1c>)
     718:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
     71a:	4b05      	ldr	r3, [pc, #20]	; (730 <STK_handler+0x20>)
     71c:	681b      	ldr	r3, [r3, #0]
     71e:	2b00      	cmp	r3, #0
     720:	d004      	beq.n	72c <STK_handler+0x1c>
     722:	4b03      	ldr	r3, [pc, #12]	; (730 <STK_handler+0x20>)
     724:	681b      	ldr	r3, [r3, #0]
     726:	3b01      	subs	r3, #1
     728:	4a01      	ldr	r2, [pc, #4]	; (730 <STK_handler+0x20>)
     72a:	6013      	str	r3, [r2, #0]
     72c:	20000070 	.word	0x20000070
     730:	20000074 	.word	0x20000074

00000734 <set_sysclock>:
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     734:	b480      	push	{r7}
     736:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC_CR|=1<<RCC_CR_HSEON;
     738:	4a1a      	ldr	r2, [pc, #104]	; (7a4 <set_sysclock+0x70>)
     73a:	4b1a      	ldr	r3, [pc, #104]	; (7a4 <set_sysclock+0x70>)
     73c:	681b      	ldr	r3, [r3, #0]
     73e:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     742:	6013      	str	r3, [r2, #0]
	 // attend que l'oscillateur soit prêt
   while (! (RCC_CR & (1<<RCC_CR_HSERDY)));
     744:	bf00      	nop
     746:	4b17      	ldr	r3, [pc, #92]	; (7a4 <set_sysclock+0x70>)
     748:	681b      	ldr	r3, [r3, #0]
     74a:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
     74e:	2b00      	cmp	r3, #0
     750:	d0f9      	beq.n	746 <set_sysclock+0x12>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
     752:	4a15      	ldr	r2, [pc, #84]	; (7a8 <set_sysclock+0x74>)
     754:	4b14      	ldr	r3, [pc, #80]	; (7a8 <set_sysclock+0x74>)
     756:	681b      	ldr	r3, [r3, #0]
     758:	f443 13e8 	orr.w	r3, r3, #1900544	; 0x1d0000
     75c:	6013      	str	r3, [r2, #0]
    // active le PLL
    RCC_CR|=1<<RCC_CR_PLLON;
     75e:	4a11      	ldr	r2, [pc, #68]	; (7a4 <set_sysclock+0x70>)
     760:	4b10      	ldr	r3, [pc, #64]	; (7a4 <set_sysclock+0x70>)
     762:	681b      	ldr	r3, [r3, #0]
     764:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
     768:	6013      	str	r3, [r2, #0]
    // Attend que le PLL soit prêt
    while (! (RCC_CR & (1<<RCC_CR_PLLRDY)));
     76a:	bf00      	nop
     76c:	4b0d      	ldr	r3, [pc, #52]	; (7a4 <set_sysclock+0x70>)
     76e:	681b      	ldr	r3, [r3, #0]
     770:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
     774:	2b00      	cmp	r3, #0
     776:	d0f9      	beq.n	76c <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR|=WAIT_2_CY;
     778:	4a0c      	ldr	r2, [pc, #48]	; (7ac <set_sysclock+0x78>)
     77a:	4b0c      	ldr	r3, [pc, #48]	; (7ac <set_sysclock+0x78>)
     77c:	681b      	ldr	r3, [r3, #0]
     77e:	f043 0302 	orr.w	r3, r3, #2
     782:	6013      	str	r3, [r2, #0]
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR|=PLL_CLK<<RCC_CFGR_SW;
     784:	4a08      	ldr	r2, [pc, #32]	; (7a8 <set_sysclock+0x74>)
     786:	4b08      	ldr	r3, [pc, #32]	; (7a8 <set_sysclock+0x74>)
     788:	681b      	ldr	r3, [r3, #0]
     78a:	f043 0302 	orr.w	r3, r3, #2
     78e:	6013      	str	r3, [r2, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR|=PPRECLK_DIV2<<RCC_CFGR_PPRE1;
     790:	4a05      	ldr	r2, [pc, #20]	; (7a8 <set_sysclock+0x74>)
     792:	4b05      	ldr	r3, [pc, #20]	; (7a8 <set_sysclock+0x74>)
     794:	681b      	ldr	r3, [r3, #0]
     796:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     79a:	6013      	str	r3, [r2, #0]
}
     79c:	46bd      	mov	sp, r7
     79e:	f85d 7b04 	ldr.w	r7, [sp], #4
     7a2:	4770      	bx	lr
     7a4:	40021000 	.word	0x40021000
     7a8:	40021004 	.word	0x40021004
     7ac:	40022000 	.word	0x40022000

000007b0 <config_systicks>:

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
     7b0:	b480      	push	{r7}
     7b2:	af00      	add	r7, sp, #0
	STK_LOAD=MSEC_DLY-1;
     7b4:	4b05      	ldr	r3, [pc, #20]	; (7cc <config_systicks+0x1c>)
     7b6:	f242 3227 	movw	r2, #8999	; 0x2327
     7ba:	601a      	str	r2, [r3, #0]
	STK_CTRL=(1<<STK_TICKINT)|(1<<STK_ENABLE);
     7bc:	4b04      	ldr	r3, [pc, #16]	; (7d0 <config_systicks+0x20>)
     7be:	2203      	movs	r2, #3
     7c0:	601a      	str	r2, [r3, #0]
}
     7c2:	46bd      	mov	sp, r7
     7c4:	f85d 7b04 	ldr.w	r7, [sp], #4
     7c8:	4770      	bx	lr
     7ca:	bf00      	nop
     7cc:	e000e014 	.word	0xe000e014
     7d0:	e000e010 	.word	0xe000e010

000007d4 <port_c_setup>:

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
     7d4:	b480      	push	{r7}
     7d6:	af00      	add	r7, sp, #0
	RCC_APB2ENR|=1<<GPIOC_EN;
     7d8:	4a06      	ldr	r2, [pc, #24]	; (7f4 <port_c_setup+0x20>)
     7da:	4b06      	ldr	r3, [pc, #24]	; (7f4 <port_c_setup+0x20>)
     7dc:	681b      	ldr	r3, [r3, #0]
     7de:	f043 0310 	orr.w	r3, r3, #16
     7e2:	6013      	str	r3, [r2, #0]
	GPIOC_CRH->cr=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
     7e4:	4b04      	ldr	r3, [pc, #16]	; (7f8 <port_c_setup+0x24>)
     7e6:	681b      	ldr	r3, [r3, #0]
     7e8:	4a04      	ldr	r2, [pc, #16]	; (7fc <port_c_setup+0x28>)
     7ea:	601a      	str	r2, [r3, #0]
}
     7ec:	46bd      	mov	sp, r7
     7ee:	f85d 7b04 	ldr.w	r7, [sp], #4
     7f2:	4770      	bx	lr
     7f4:	40021018 	.word	0x40021018
     7f8:	20000048 	.word	0x20000048
     7fc:	44644444 	.word	0x44644444

00000800 <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     800:	b480      	push	{r7}
     802:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     804:	2300      	movs	r3, #0
     806:	2200      	movs	r2, #0
     808:	4618      	mov	r0, r3
     80a:	4611      	mov	r1, r2
     80c:	df00      	svc	0
}
     80e:	46bd      	mov	sp, r7
     810:	f85d 7b04 	ldr.w	r7, [sp], #4
     814:	4770      	bx	lr
     816:	bf00      	nop

00000818 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     818:	b480      	push	{r7}
     81a:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     81c:	2300      	movs	r3, #0
     81e:	2200      	movs	r2, #0
     820:	4618      	mov	r0, r3
     822:	4611      	mov	r1, r2
     824:	df01      	svc	1
}
     826:	46bd      	mov	sp, r7
     828:	f85d 7b04 	ldr.w	r7, [sp], #4
     82c:	4770      	bx	lr
     82e:	bf00      	nop

00000830 <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     830:	b480      	push	{r7}
     832:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     834:	2300      	movs	r3, #0
     836:	2200      	movs	r2, #0
     838:	4618      	mov	r0, r3
     83a:	4611      	mov	r1, r2
     83c:	df02      	svc	2
}
     83e:	46bd      	mov	sp, r7
     840:	f85d 7b04 	ldr.w	r7, [sp], #4
     844:	4770      	bx	lr
     846:	bf00      	nop

00000848 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     848:	b580      	push	{r7, lr}
     84a:	b082      	sub	sp, #8
     84c:	af00      	add	r7, sp, #0
	int n;
	word();
     84e:	f000 fa09 	bl	c64 <word>
	n=atoi(pad);
     852:	4806      	ldr	r0, [pc, #24]	; (86c <cmd_set_timer+0x24>)
     854:	f7ff fdac 	bl	3b0 <atoi>
     858:	4603      	mov	r3, r0
     85a:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     85c:	1d3b      	adds	r3, r7, #4
     85e:	2200      	movs	r2, #0
     860:	4618      	mov	r0, r3
     862:	4611      	mov	r1, r2
     864:	df03      	svc	3
}
     866:	3708      	adds	r7, #8
     868:	46bd      	mov	sp, r7
     86a:	bd80      	pop	{r7, pc}
     86c:	200000c8 	.word	0x200000c8

00000870 <cmd_get_timer>:

static void cmd_get_timer(){
     870:	b480      	push	{r7}
     872:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     874:	4b04      	ldr	r3, [pc, #16]	; (888 <cmd_get_timer+0x18>)
     876:	2200      	movs	r2, #0
     878:	4618      	mov	r0, r3
     87a:	4611      	mov	r1, r2
     87c:	df04      	svc	4
}
     87e:	46bd      	mov	sp, r7
     880:	f85d 7b04 	ldr.w	r7, [sp], #4
     884:	4770      	bx	lr
     886:	bf00      	nop
     888:	200000c8 	.word	0x200000c8

0000088c <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     88c:	b480      	push	{r7}
     88e:	b083      	sub	sp, #12
     890:	af00      	add	r7, sp, #0
	unsigned tm;
	_pause(tm);
     892:	1d3b      	adds	r3, r7, #4
     894:	2200      	movs	r2, #0
     896:	4618      	mov	r0, r3
     898:	4611      	mov	r1, r2
     89a:	df04      	svc	4
     89c:	687b      	ldr	r3, [r7, #4]
     89e:	2b00      	cmp	r3, #0
     8a0:	d1f7      	bne.n	892 <cmd_pause+0x6>
}
     8a2:	370c      	adds	r7, #12
     8a4:	46bd      	mov	sp, r7
     8a6:	f85d 7b04 	ldr.w	r7, [sp], #4
     8aa:	4770      	bx	lr

000008ac <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     8ac:	b480      	push	{r7}
     8ae:	b083      	sub	sp, #12
     8b0:	af00      	add	r7, sp, #0
	char n=0;
     8b2:	2300      	movs	r3, #0
     8b4:	71fb      	strb	r3, [r7, #7]
	while (!n){
     8b6:	e004      	b.n	8c2 <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     8b8:	1dfb      	adds	r3, r7, #7
     8ba:	2200      	movs	r2, #0
     8bc:	4618      	mov	r0, r3
     8be:	4611      	mov	r1, r2
     8c0:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	char n=0;
	while (!n){
     8c2:	79fb      	ldrb	r3, [r7, #7]
     8c4:	2b00      	cmp	r3, #0
     8c6:	d0f7      	beq.n	8b8 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     8c8:	79fa      	ldrb	r2, [r7, #7]
     8ca:	4b05      	ldr	r3, [pc, #20]	; (8e0 <cmd_getc+0x34>)
     8cc:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     8ce:	4b04      	ldr	r3, [pc, #16]	; (8e0 <cmd_getc+0x34>)
     8d0:	2200      	movs	r2, #0
     8d2:	705a      	strb	r2, [r3, #1]
}
     8d4:	370c      	adds	r7, #12
     8d6:	46bd      	mov	sp, r7
     8d8:	f85d 7b04 	ldr.w	r7, [sp], #4
     8dc:	4770      	bx	lr
     8de:	bf00      	nop
     8e0:	200000c8 	.word	0x200000c8

000008e4 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     8e4:	b580      	push	{r7, lr}
     8e6:	b082      	sub	sp, #8
     8e8:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     8ea:	f000 f9bb 	bl	c64 <word>
	cmd_id=search_command(pad);
     8ee:	480a      	ldr	r0, [pc, #40]	; (918 <cmd_putc+0x34>)
     8f0:	f000 f908 	bl	b04 <search_command>
     8f4:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     8f6:	687b      	ldr	r3, [r7, #4]
     8f8:	2b00      	cmp	r3, #0
     8fa:	db05      	blt.n	908 <cmd_putc+0x24>
     8fc:	4a07      	ldr	r2, [pc, #28]	; (91c <cmd_putc+0x38>)
     8fe:	687b      	ldr	r3, [r7, #4]
     900:	00db      	lsls	r3, r3, #3
     902:	4413      	add	r3, r2
     904:	685b      	ldr	r3, [r3, #4]
     906:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     908:	4b03      	ldr	r3, [pc, #12]	; (918 <cmd_putc+0x34>)
     90a:	2200      	movs	r2, #0
     90c:	4618      	mov	r0, r3
     90e:	4611      	mov	r1, r2
     910:	df06      	svc	6
}
     912:	3708      	adds	r7, #8
     914:	46bd      	mov	sp, r7
     916:	bd80      	pop	{r7, pc}
     918:	200000c8 	.word	0x200000c8
     91c:	000017fc 	.word	0x000017fc

00000920 <cmd_readln>:

static void cmd_readln(){
     920:	b580      	push	{r7, lr}
     922:	b082      	sub	sp, #8
     924:	af00      	add	r7, sp, #0
	unsigned llen=80;
     926:	2350      	movs	r3, #80	; 0x50
     928:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     92a:	1d3b      	adds	r3, r7, #4
     92c:	4a04      	ldr	r2, [pc, #16]	; (940 <cmd_readln+0x20>)
     92e:	4618      	mov	r0, r3
     930:	4611      	mov	r1, r2
     932:	df07      	svc	7
	print(pad);
     934:	4802      	ldr	r0, [pc, #8]	; (940 <cmd_readln+0x20>)
     936:	f000 fab7 	bl	ea8 <print>
}
     93a:	3708      	adds	r7, #8
     93c:	46bd      	mov	sp, r7
     93e:	bd80      	pop	{r7, pc}
     940:	200000c8 	.word	0x200000c8

00000944 <cmd_print>:

static void cmd_print(){
     944:	b580      	push	{r7, lr}
     946:	af00      	add	r7, sp, #0
	in=skip(tib,in,SPACE);
     948:	4b0f      	ldr	r3, [pc, #60]	; (988 <cmd_print+0x44>)
     94a:	681b      	ldr	r3, [r3, #0]
     94c:	480f      	ldr	r0, [pc, #60]	; (98c <cmd_print+0x48>)
     94e:	4619      	mov	r1, r3
     950:	2220      	movs	r2, #32
     952:	f000 f905 	bl	b60 <skip>
     956:	4603      	mov	r3, r0
     958:	461a      	mov	r2, r3
     95a:	4b0b      	ldr	r3, [pc, #44]	; (988 <cmd_print+0x44>)
     95c:	601a      	str	r2, [r3, #0]
	_svc_call(SVC_PRINT,&tib[in],NUL);
     95e:	4b0a      	ldr	r3, [pc, #40]	; (988 <cmd_print+0x44>)
     960:	681b      	ldr	r3, [r3, #0]
     962:	4a0a      	ldr	r2, [pc, #40]	; (98c <cmd_print+0x48>)
     964:	4413      	add	r3, r2
     966:	2200      	movs	r2, #0
     968:	4618      	mov	r0, r3
     96a:	4611      	mov	r1, r2
     96c:	df08      	svc	8
	while (tib[in]) in++;
     96e:	e004      	b.n	97a <cmd_print+0x36>
     970:	4b05      	ldr	r3, [pc, #20]	; (988 <cmd_print+0x44>)
     972:	681b      	ldr	r3, [r3, #0]
     974:	3301      	adds	r3, #1
     976:	4a04      	ldr	r2, [pc, #16]	; (988 <cmd_print+0x44>)
     978:	6013      	str	r3, [r2, #0]
     97a:	4b03      	ldr	r3, [pc, #12]	; (988 <cmd_print+0x44>)
     97c:	681b      	ldr	r3, [r3, #0]
     97e:	4a03      	ldr	r2, [pc, #12]	; (98c <cmd_print+0x48>)
     980:	5cd3      	ldrb	r3, [r2, r3]
     982:	2b00      	cmp	r3, #0
     984:	d1f4      	bne.n	970 <cmd_print+0x2c>
}
     986:	bd80      	pop	{r7, pc}
     988:	20000118 	.word	0x20000118
     98c:	20000078 	.word	0x20000078

00000990 <cmd_run>:


static void cmd_run(){
     990:	b580      	push	{r7, lr}
     992:	af00      	add	r7, sp, #0
	((fn)proga)();
     994:	4b01      	ldr	r3, [pc, #4]	; (99c <cmd_run+0xc>)
     996:	681b      	ldr	r3, [r3, #0]
     998:	4798      	blx	r3
	
}
     99a:	bd80      	pop	{r7, pc}
     99c:	20000144 	.word	0x20000144

000009a0 <cmd_peek8>:

static void cmd_peek8(){
     9a0:	b580      	push	{r7, lr}
     9a2:	b082      	sub	sp, #8
     9a4:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9a6:	f000 f95d 	bl	c64 <word>
	u=atoi(pad);
     9aa:	4808      	ldr	r0, [pc, #32]	; (9cc <cmd_peek8+0x2c>)
     9ac:	f7ff fd00 	bl	3b0 <atoi>
     9b0:	4603      	mov	r3, r0
     9b2:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     9b4:	1d3b      	adds	r3, r7, #4
     9b6:	2200      	movs	r2, #0
     9b8:	4618      	mov	r0, r3
     9ba:	4611      	mov	r1, r2
     9bc:	df0b      	svc	11
	pad[0]=(unsigned char)u;
     9be:	687b      	ldr	r3, [r7, #4]
     9c0:	b2da      	uxtb	r2, r3
     9c2:	4b02      	ldr	r3, [pc, #8]	; (9cc <cmd_peek8+0x2c>)
     9c4:	701a      	strb	r2, [r3, #0]
}
     9c6:	3708      	adds	r7, #8
     9c8:	46bd      	mov	sp, r7
     9ca:	bd80      	pop	{r7, pc}
     9cc:	200000c8 	.word	0x200000c8

000009d0 <cmd_peek16>:

static void cmd_peek16(){
     9d0:	b580      	push	{r7, lr}
     9d2:	b082      	sub	sp, #8
     9d4:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9d6:	f000 f945 	bl	c64 <word>
	u=atoi(pad);
     9da:	480b      	ldr	r0, [pc, #44]	; (a08 <cmd_peek16+0x38>)
     9dc:	f7ff fce8 	bl	3b0 <atoi>
     9e0:	4603      	mov	r3, r0
     9e2:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     9e4:	1d3b      	adds	r3, r7, #4
     9e6:	2200      	movs	r2, #0
     9e8:	4618      	mov	r0, r3
     9ea:	4611      	mov	r1, r2
     9ec:	df0c      	svc	12
	pad[0]=(unsigned char)(u&0xff);
     9ee:	687b      	ldr	r3, [r7, #4]
     9f0:	b2da      	uxtb	r2, r3
     9f2:	4b05      	ldr	r3, [pc, #20]	; (a08 <cmd_peek16+0x38>)
     9f4:	701a      	strb	r2, [r3, #0]
	pad[1]=(unsigned char)((u>>8)&0xff);
     9f6:	687b      	ldr	r3, [r7, #4]
     9f8:	0a1b      	lsrs	r3, r3, #8
     9fa:	b2da      	uxtb	r2, r3
     9fc:	4b02      	ldr	r3, [pc, #8]	; (a08 <cmd_peek16+0x38>)
     9fe:	705a      	strb	r2, [r3, #1]
}
     a00:	3708      	adds	r7, #8
     a02:	46bd      	mov	sp, r7
     a04:	bd80      	pop	{r7, pc}
     a06:	bf00      	nop
     a08:	200000c8 	.word	0x200000c8

00000a0c <cmd_peek32>:

static void cmd_peek32(){
     a0c:	b580      	push	{r7, lr}
     a0e:	b082      	sub	sp, #8
     a10:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     a12:	f000 f927 	bl	c64 <word>
	u=atoi(pad);
     a16:	4810      	ldr	r0, [pc, #64]	; (a58 <cmd_peek32+0x4c>)
     a18:	f7ff fcca 	bl	3b0 <atoi>
     a1c:	4603      	mov	r3, r0
     a1e:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_PEEK32,&u,NUL);
     a20:	463b      	mov	r3, r7
     a22:	2200      	movs	r2, #0
     a24:	4618      	mov	r0, r3
     a26:	4611      	mov	r1, r2
     a28:	df0d      	svc	13
	for (i=0;i<4;i++){
     a2a:	2300      	movs	r3, #0
     a2c:	607b      	str	r3, [r7, #4]
     a2e:	e00c      	b.n	a4a <cmd_peek32+0x3e>
		pad[i]=(unsigned char)(u&0xff);
     a30:	683b      	ldr	r3, [r7, #0]
     a32:	b2d9      	uxtb	r1, r3
     a34:	4a08      	ldr	r2, [pc, #32]	; (a58 <cmd_peek32+0x4c>)
     a36:	687b      	ldr	r3, [r7, #4]
     a38:	4413      	add	r3, r2
     a3a:	460a      	mov	r2, r1
     a3c:	701a      	strb	r2, [r3, #0]
		u>>=8;
     a3e:	683b      	ldr	r3, [r7, #0]
     a40:	0a1b      	lsrs	r3, r3, #8
     a42:	603b      	str	r3, [r7, #0]
	uint32_t u;
	int i;
	word();
	u=atoi(pad);
	_svc_call(SVC_PEEK32,&u,NUL);
	for (i=0;i<4;i++){
     a44:	687b      	ldr	r3, [r7, #4]
     a46:	3301      	adds	r3, #1
     a48:	607b      	str	r3, [r7, #4]
     a4a:	687b      	ldr	r3, [r7, #4]
     a4c:	2b03      	cmp	r3, #3
     a4e:	ddef      	ble.n	a30 <cmd_peek32+0x24>
		pad[i]=(unsigned char)(u&0xff);
		u>>=8;
	}
}
     a50:	3708      	adds	r7, #8
     a52:	46bd      	mov	sp, r7
     a54:	bd80      	pop	{r7, pc}
     a56:	bf00      	nop
     a58:	200000c8 	.word	0x200000c8

00000a5c <cmd_poke8>:

static void cmd_poke8(){
     a5c:	b580      	push	{r7, lr}
     a5e:	b082      	sub	sp, #8
     a60:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     a62:	f000 f8ff 	bl	c64 <word>
	adr=atoi(pad);
     a66:	480a      	ldr	r0, [pc, #40]	; (a90 <cmd_poke8+0x34>)
     a68:	f7ff fca2 	bl	3b0 <atoi>
     a6c:	4603      	mov	r3, r0
     a6e:	607b      	str	r3, [r7, #4]
	word();
     a70:	f000 f8f8 	bl	c64 <word>
	u8=atoi(pad);
     a74:	4806      	ldr	r0, [pc, #24]	; (a90 <cmd_poke8+0x34>)
     a76:	f7ff fc9b 	bl	3b0 <atoi>
     a7a:	4603      	mov	r3, r0
     a7c:	b2db      	uxtb	r3, r3
     a7e:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     a80:	1d3b      	adds	r3, r7, #4
     a82:	1cfa      	adds	r2, r7, #3
     a84:	4618      	mov	r0, r3
     a86:	4611      	mov	r1, r2
     a88:	df0e      	svc	14
}
     a8a:	3708      	adds	r7, #8
     a8c:	46bd      	mov	sp, r7
     a8e:	bd80      	pop	{r7, pc}
     a90:	200000c8 	.word	0x200000c8

00000a94 <cmd_poke16>:

static void cmd_poke16(){
     a94:	b580      	push	{r7, lr}
     a96:	b082      	sub	sp, #8
     a98:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     a9a:	f000 f8e3 	bl	c64 <word>
	adr=atoi(pad);
     a9e:	480a      	ldr	r0, [pc, #40]	; (ac8 <cmd_poke16+0x34>)
     aa0:	f7ff fc86 	bl	3b0 <atoi>
     aa4:	4603      	mov	r3, r0
     aa6:	607b      	str	r3, [r7, #4]
	word();
     aa8:	f000 f8dc 	bl	c64 <word>
	u16=atoi(pad);
     aac:	4806      	ldr	r0, [pc, #24]	; (ac8 <cmd_poke16+0x34>)
     aae:	f7ff fc7f 	bl	3b0 <atoi>
     ab2:	4603      	mov	r3, r0
     ab4:	b29b      	uxth	r3, r3
     ab6:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     ab8:	1d3b      	adds	r3, r7, #4
     aba:	1cba      	adds	r2, r7, #2
     abc:	4618      	mov	r0, r3
     abe:	4611      	mov	r1, r2
     ac0:	df0f      	svc	15
}
     ac2:	3708      	adds	r7, #8
     ac4:	46bd      	mov	sp, r7
     ac6:	bd80      	pop	{r7, pc}
     ac8:	200000c8 	.word	0x200000c8

00000acc <cmd_poke32>:

static void cmd_poke32(){
     acc:	b580      	push	{r7, lr}
     ace:	b082      	sub	sp, #8
     ad0:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     ad2:	f000 f8c7 	bl	c64 <word>
	adr=atoi(pad);
     ad6:	480a      	ldr	r0, [pc, #40]	; (b00 <cmd_poke32+0x34>)
     ad8:	f7ff fc6a 	bl	3b0 <atoi>
     adc:	4603      	mov	r3, r0
     ade:	607b      	str	r3, [r7, #4]
	word();
     ae0:	f000 f8c0 	bl	c64 <word>
	u32=atoi(pad);
     ae4:	4806      	ldr	r0, [pc, #24]	; (b00 <cmd_poke32+0x34>)
     ae6:	f7ff fc63 	bl	3b0 <atoi>
     aea:	4603      	mov	r3, r0
     aec:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     aee:	1d3b      	adds	r3, r7, #4
     af0:	463a      	mov	r2, r7
     af2:	4618      	mov	r0, r3
     af4:	4611      	mov	r1, r2
     af6:	df10      	svc	16
}
     af8:	3708      	adds	r7, #8
     afa:	46bd      	mov	sp, r7
     afc:	bd80      	pop	{r7, pc}
     afe:	bf00      	nop
     b00:	200000c8 	.word	0x200000c8

00000b04 <search_command>:
	{"poke32",cmd_poke32}, 
	{NUL,NUL}
};


int search_command(const char * name){
     b04:	b580      	push	{r7, lr}
     b06:	b084      	sub	sp, #16
     b08:	af00      	add	r7, sp, #0
     b0a:	6078      	str	r0, [r7, #4]
	int i=0;
     b0c:	2300      	movs	r3, #0
     b0e:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     b10:	e00e      	b.n	b30 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     b12:	4a12      	ldr	r2, [pc, #72]	; (b5c <search_command+0x58>)
     b14:	68fb      	ldr	r3, [r7, #12]
     b16:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     b1a:	4618      	mov	r0, r3
     b1c:	6879      	ldr	r1, [r7, #4]
     b1e:	f7ff fbc9 	bl	2b4 <strcmp>
     b22:	4603      	mov	r3, r0
     b24:	2b00      	cmp	r3, #0
     b26:	d100      	bne.n	b2a <search_command+0x26>
			break;
     b28:	e009      	b.n	b3e <search_command+0x3a>
		}
		i++;
     b2a:	68fb      	ldr	r3, [r7, #12]
     b2c:	3301      	adds	r3, #1
     b2e:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     b30:	4a0a      	ldr	r2, [pc, #40]	; (b5c <search_command+0x58>)
     b32:	68fb      	ldr	r3, [r7, #12]
     b34:	00db      	lsls	r3, r3, #3
     b36:	4413      	add	r3, r2
     b38:	685b      	ldr	r3, [r3, #4]
     b3a:	2b00      	cmp	r3, #0
     b3c:	d1e9      	bne.n	b12 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     b3e:	4a07      	ldr	r2, [pc, #28]	; (b5c <search_command+0x58>)
     b40:	68fb      	ldr	r3, [r7, #12]
     b42:	00db      	lsls	r3, r3, #3
     b44:	4413      	add	r3, r2
     b46:	685b      	ldr	r3, [r3, #4]
     b48:	2b00      	cmp	r3, #0
     b4a:	d102      	bne.n	b52 <search_command+0x4e>
     b4c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     b50:	60fb      	str	r3, [r7, #12]
	return i;
     b52:	68fb      	ldr	r3, [r7, #12]
}
     b54:	4618      	mov	r0, r3
     b56:	3710      	adds	r7, #16
     b58:	46bd      	mov	sp, r7
     b5a:	bd80      	pop	{r7, pc}
     b5c:	000017fc 	.word	0x000017fc

00000b60 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     b60:	b480      	push	{r7}
     b62:	b085      	sub	sp, #20
     b64:	af00      	add	r7, sp, #0
     b66:	60f8      	str	r0, [r7, #12]
     b68:	60b9      	str	r1, [r7, #8]
     b6a:	4613      	mov	r3, r2
     b6c:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     b6e:	e002      	b.n	b76 <skip+0x16>
     b70:	68bb      	ldr	r3, [r7, #8]
     b72:	3301      	adds	r3, #1
     b74:	60bb      	str	r3, [r7, #8]
     b76:	68bb      	ldr	r3, [r7, #8]
     b78:	68fa      	ldr	r2, [r7, #12]
     b7a:	4413      	add	r3, r2
     b7c:	781b      	ldrb	r3, [r3, #0]
     b7e:	2b00      	cmp	r3, #0
     b80:	d006      	beq.n	b90 <skip+0x30>
     b82:	68bb      	ldr	r3, [r7, #8]
     b84:	68fa      	ldr	r2, [r7, #12]
     b86:	4413      	add	r3, r2
     b88:	781b      	ldrb	r3, [r3, #0]
     b8a:	79fa      	ldrb	r2, [r7, #7]
     b8c:	429a      	cmp	r2, r3
     b8e:	d0ef      	beq.n	b70 <skip+0x10>
	return start;
     b90:	68bb      	ldr	r3, [r7, #8]
}
     b92:	4618      	mov	r0, r3
     b94:	3714      	adds	r7, #20
     b96:	46bd      	mov	sp, r7
     b98:	f85d 7b04 	ldr.w	r7, [sp], #4
     b9c:	4770      	bx	lr
     b9e:	bf00      	nop

00000ba0 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     ba0:	b480      	push	{r7}
     ba2:	b085      	sub	sp, #20
     ba4:	af00      	add	r7, sp, #0
     ba6:	60f8      	str	r0, [r7, #12]
     ba8:	60b9      	str	r1, [r7, #8]
     baa:	4613      	mov	r3, r2
     bac:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     bae:	e002      	b.n	bb6 <scan+0x16>
     bb0:	68bb      	ldr	r3, [r7, #8]
     bb2:	3301      	adds	r3, #1
     bb4:	60bb      	str	r3, [r7, #8]
     bb6:	68bb      	ldr	r3, [r7, #8]
     bb8:	68fa      	ldr	r2, [r7, #12]
     bba:	4413      	add	r3, r2
     bbc:	781b      	ldrb	r3, [r3, #0]
     bbe:	2b00      	cmp	r3, #0
     bc0:	d006      	beq.n	bd0 <scan+0x30>
     bc2:	68bb      	ldr	r3, [r7, #8]
     bc4:	68fa      	ldr	r2, [r7, #12]
     bc6:	4413      	add	r3, r2
     bc8:	781b      	ldrb	r3, [r3, #0]
     bca:	79fa      	ldrb	r2, [r7, #7]
     bcc:	429a      	cmp	r2, r3
     bce:	d1ef      	bne.n	bb0 <scan+0x10>
	return start;
     bd0:	68bb      	ldr	r3, [r7, #8]
}
     bd2:	4618      	mov	r0, r3
     bd4:	3714      	adds	r7, #20
     bd6:	46bd      	mov	sp, r7
     bd8:	f85d 7b04 	ldr.w	r7, [sp], #4
     bdc:	4770      	bx	lr
     bde:	bf00      	nop

00000be0 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     be0:	b480      	push	{r7}
     be2:	b087      	sub	sp, #28
     be4:	af00      	add	r7, sp, #0
     be6:	60f8      	str	r0, [r7, #12]
     be8:	60b9      	str	r1, [r7, #8]
     bea:	4613      	mov	r3, r2
     bec:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     bee:	68bb      	ldr	r3, [r7, #8]
     bf0:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     bf2:	e002      	b.n	bfa <next+0x1a>
     bf4:	697b      	ldr	r3, [r7, #20]
     bf6:	3301      	adds	r3, #1
     bf8:	617b      	str	r3, [r7, #20]
     bfa:	697b      	ldr	r3, [r7, #20]
     bfc:	68fa      	ldr	r2, [r7, #12]
     bfe:	4413      	add	r3, r2
     c00:	781b      	ldrb	r3, [r3, #0]
     c02:	2b00      	cmp	r3, #0
     c04:	d006      	beq.n	c14 <next+0x34>
     c06:	697b      	ldr	r3, [r7, #20]
     c08:	68fa      	ldr	r2, [r7, #12]
     c0a:	4413      	add	r3, r2
     c0c:	781b      	ldrb	r3, [r3, #0]
     c0e:	79fa      	ldrb	r2, [r7, #7]
     c10:	429a      	cmp	r2, r3
     c12:	d1ef      	bne.n	bf4 <next+0x14>
	return end-start;
     c14:	697a      	ldr	r2, [r7, #20]
     c16:	68bb      	ldr	r3, [r7, #8]
     c18:	1ad3      	subs	r3, r2, r3
}
     c1a:	4618      	mov	r0, r3
     c1c:	371c      	adds	r7, #28
     c1e:	46bd      	mov	sp, r7
     c20:	f85d 7b04 	ldr.w	r7, [sp], #4
     c24:	4770      	bx	lr
     c26:	bf00      	nop

00000c28 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     c28:	b480      	push	{r7}
     c2a:	b085      	sub	sp, #20
     c2c:	af00      	add	r7, sp, #0
     c2e:	60f8      	str	r0, [r7, #12]
     c30:	60b9      	str	r1, [r7, #8]
     c32:	607a      	str	r2, [r7, #4]
	while (len){
     c34:	e00a      	b.n	c4c <move+0x24>
		*dest++=*src++;
     c36:	68bb      	ldr	r3, [r7, #8]
     c38:	1c5a      	adds	r2, r3, #1
     c3a:	60ba      	str	r2, [r7, #8]
     c3c:	68fa      	ldr	r2, [r7, #12]
     c3e:	1c51      	adds	r1, r2, #1
     c40:	60f9      	str	r1, [r7, #12]
     c42:	7812      	ldrb	r2, [r2, #0]
     c44:	701a      	strb	r2, [r3, #0]
		len--;
     c46:	687b      	ldr	r3, [r7, #4]
     c48:	3b01      	subs	r3, #1
     c4a:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     c4c:	687b      	ldr	r3, [r7, #4]
     c4e:	2b00      	cmp	r3, #0
     c50:	d1f1      	bne.n	c36 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     c52:	68bb      	ldr	r3, [r7, #8]
     c54:	2200      	movs	r2, #0
     c56:	701a      	strb	r2, [r3, #0]
}
     c58:	3714      	adds	r7, #20
     c5a:	46bd      	mov	sp, r7
     c5c:	f85d 7b04 	ldr.w	r7, [sp], #4
     c60:	4770      	bx	lr
     c62:	bf00      	nop

00000c64 <word>:

// extrait le prochain mot du tib
static void word(){
     c64:	b580      	push	{r7, lr}
     c66:	b082      	sub	sp, #8
     c68:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     c6a:	4b12      	ldr	r3, [pc, #72]	; (cb4 <word+0x50>)
     c6c:	681b      	ldr	r3, [r3, #0]
     c6e:	4812      	ldr	r0, [pc, #72]	; (cb8 <word+0x54>)
     c70:	4619      	mov	r1, r3
     c72:	2220      	movs	r2, #32
     c74:	f7ff ff74 	bl	b60 <skip>
     c78:	4603      	mov	r3, r0
     c7a:	461a      	mov	r2, r3
     c7c:	4b0d      	ldr	r3, [pc, #52]	; (cb4 <word+0x50>)
     c7e:	601a      	str	r2, [r3, #0]
		len=next(tib,in,SPACE);
     c80:	4b0c      	ldr	r3, [pc, #48]	; (cb4 <word+0x50>)
     c82:	681b      	ldr	r3, [r3, #0]
     c84:	480c      	ldr	r0, [pc, #48]	; (cb8 <word+0x54>)
     c86:	4619      	mov	r1, r3
     c88:	2220      	movs	r2, #32
     c8a:	f7ff ffa9 	bl	be0 <next>
     c8e:	6078      	str	r0, [r7, #4]
		move(&tib[in],pad,len);
     c90:	4b08      	ldr	r3, [pc, #32]	; (cb4 <word+0x50>)
     c92:	681b      	ldr	r3, [r3, #0]
     c94:	4a08      	ldr	r2, [pc, #32]	; (cb8 <word+0x54>)
     c96:	4413      	add	r3, r2
     c98:	4618      	mov	r0, r3
     c9a:	4908      	ldr	r1, [pc, #32]	; (cbc <word+0x58>)
     c9c:	687a      	ldr	r2, [r7, #4]
     c9e:	f7ff ffc3 	bl	c28 <move>
		in+=len;
     ca2:	4b04      	ldr	r3, [pc, #16]	; (cb4 <word+0x50>)
     ca4:	681a      	ldr	r2, [r3, #0]
     ca6:	687b      	ldr	r3, [r7, #4]
     ca8:	4413      	add	r3, r2
     caa:	4a02      	ldr	r2, [pc, #8]	; (cb4 <word+0x50>)
     cac:	6013      	str	r3, [r2, #0]
}
     cae:	3708      	adds	r7, #8
     cb0:	46bd      	mov	sp, r7
     cb2:	bd80      	pop	{r7, pc}
     cb4:	20000118 	.word	0x20000118
     cb8:	20000078 	.word	0x20000078
     cbc:	200000c8 	.word	0x200000c8

00000cc0 <parse_line>:

static void parse_line(unsigned llen){
     cc0:	b580      	push	{r7, lr}
     cc2:	b084      	sub	sp, #16
     cc4:	af00      	add	r7, sp, #0
     cc6:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     cc8:	4b12      	ldr	r3, [pc, #72]	; (d14 <parse_line+0x54>)
     cca:	2200      	movs	r2, #0
     ccc:	601a      	str	r2, [r3, #0]
	while (in<llen){
     cce:	e016      	b.n	cfe <parse_line+0x3e>
		word();
     cd0:	f7ff ffc8 	bl	c64 <word>
		cmd_id=search_command((const char*) pad);
     cd4:	4810      	ldr	r0, [pc, #64]	; (d18 <parse_line+0x58>)
     cd6:	f7ff ff15 	bl	b04 <search_command>
     cda:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     cdc:	68fb      	ldr	r3, [r7, #12]
     cde:	2b00      	cmp	r3, #0
     ce0:	db06      	blt.n	cf0 <parse_line+0x30>
			commands[cmd_id].fn();
     ce2:	4a0e      	ldr	r2, [pc, #56]	; (d1c <parse_line+0x5c>)
     ce4:	68fb      	ldr	r3, [r7, #12]
     ce6:	00db      	lsls	r3, r3, #3
     ce8:	4413      	add	r3, r2
     cea:	685b      	ldr	r3, [r3, #4]
     cec:	4798      	blx	r3
     cee:	e006      	b.n	cfe <parse_line+0x3e>
		}else{
			print(pad); conout('?');
     cf0:	4809      	ldr	r0, [pc, #36]	; (d18 <parse_line+0x58>)
     cf2:	f000 f8d9 	bl	ea8 <print>
     cf6:	203f      	movs	r0, #63	; 0x3f
     cf8:	f000 f8a4 	bl	e44 <conout>
			break;
     cfc:	e004      	b.n	d08 <parse_line+0x48>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     cfe:	4b05      	ldr	r3, [pc, #20]	; (d14 <parse_line+0x54>)
     d00:	681a      	ldr	r2, [r3, #0]
     d02:	687b      	ldr	r3, [r7, #4]
     d04:	429a      	cmp	r2, r3
     d06:	d3e3      	bcc.n	cd0 <parse_line+0x10>
		}else{
			print(pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     d08:	200d      	movs	r0, #13
     d0a:	f000 f89b 	bl	e44 <conout>
}
     d0e:	3710      	adds	r7, #16
     d10:	46bd      	mov	sp, r7
     d12:	bd80      	pop	{r7, pc}
     d14:	20000118 	.word	0x20000118
     d18:	200000c8 	.word	0x200000c8
     d1c:	000017fc 	.word	0x000017fc

00000d20 <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     d20:	b480      	push	{r7}
     d22:	b085      	sub	sp, #20
     d24:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     d26:	4b0c      	ldr	r3, [pc, #48]	; (d58 <copy_blink_in_ram+0x38>)
     d28:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     d2a:	4b0c      	ldr	r3, [pc, #48]	; (d5c <copy_blink_in_ram+0x3c>)
     d2c:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     d2e:	4b0c      	ldr	r3, [pc, #48]	; (d60 <copy_blink_in_ram+0x40>)
     d30:	60bb      	str	r3, [r7, #8]
	while (start<end){
     d32:	e007      	b.n	d44 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     d34:	68bb      	ldr	r3, [r7, #8]
     d36:	1d1a      	adds	r2, r3, #4
     d38:	60ba      	str	r2, [r7, #8]
     d3a:	68fa      	ldr	r2, [r7, #12]
     d3c:	1d11      	adds	r1, r2, #4
     d3e:	60f9      	str	r1, [r7, #12]
     d40:	6812      	ldr	r2, [r2, #0]
     d42:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     d44:	68fa      	ldr	r2, [r7, #12]
     d46:	687b      	ldr	r3, [r7, #4]
     d48:	429a      	cmp	r2, r3
     d4a:	d3f3      	bcc.n	d34 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     d4c:	3714      	adds	r7, #20
     d4e:	46bd      	mov	sp, r7
     d50:	f85d 7b04 	ldr.w	r7, [sp], #4
     d54:	4770      	bx	lr
     d56:	bf00      	nop
     d58:	00001920 	.word	0x00001920
     d5c:	000019a0 	.word	0x000019a0
     d60:	20000160 	.word	0x20000160

00000d64 <main>:

extern void print_fault(const char *msg, sfrp_t adr);

void main(void){
     d64:	b580      	push	{r7, lr}
     d66:	b082      	sub	sp, #8
     d68:	af00      	add	r7, sp, #0
	set_sysclock();
     d6a:	f7ff fce3 	bl	734 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     d6e:	f06f 000a 	mvn.w	r0, #10
     d72:	210f      	movs	r1, #15
     d74:	f000 fb56 	bl	1424 <set_int_priority>
	config_systicks();
     d78:	f7ff fd1a 	bl	7b0 <config_systicks>
	port_c_setup();
     d7c:	f7ff fd2a 	bl	7d4 <port_c_setup>
	uart_open_channel(CON,115200,FLOW_HARD);
     d80:	4816      	ldr	r0, [pc, #88]	; (ddc <main+0x78>)
     d82:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     d86:	2201      	movs	r2, #1
     d88:	f000 fc10 	bl	15ac <uart_open_channel>
	cls();
     d8c:	f000 f8bc 	bl	f08 <cls>
	print(VERSION); 
     d90:	4b13      	ldr	r3, [pc, #76]	; (de0 <main+0x7c>)
     d92:	681b      	ldr	r3, [r3, #0]
     d94:	4618      	mov	r0, r3
     d96:	f000 f887 	bl	ea8 <print>
	copy_blink_in_ram();
     d9a:	f7ff ffc1 	bl	d20 <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,proga&0xfffffffe,NUL); conout(CR);
     d9e:	4811      	ldr	r0, [pc, #68]	; (de4 <main+0x80>)
     da0:	f000 f882 	bl	ea8 <print>
     da4:	4b10      	ldr	r3, [pc, #64]	; (de8 <main+0x84>)
     da6:	681b      	ldr	r3, [r3, #0]
     da8:	f023 0301 	bic.w	r3, r3, #1
     dac:	2200      	movs	r2, #0
     dae:	4618      	mov	r0, r3
     db0:	4611      	mov	r1, r2
     db2:	df0a      	svc	10
     db4:	200d      	movs	r0, #13
     db6:	f000 f845 	bl	e44 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     dba:	2300      	movs	r3, #0
     dbc:	2200      	movs	r2, #0
     dbe:	4618      	mov	r0, r3
     dc0:	4611      	mov	r1, r2
     dc2:	df01      	svc	1
	flush_rx_queue();
     dc4:	f000 fa40 	bl	1248 <flush_rx_queue>
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
     dc8:	4808      	ldr	r0, [pc, #32]	; (dec <main+0x88>)
     dca:	2150      	movs	r1, #80	; 0x50
     dcc:	f000 f8c2 	bl	f54 <read_line>
     dd0:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     dd2:	6878      	ldr	r0, [r7, #4]
     dd4:	f7ff ff74 	bl	cc0 <parse_line>
	}
     dd8:	e7f6      	b.n	dc8 <main+0x64>
     dda:	bf00      	nop
     ddc:	40004400 	.word	0x40004400
     de0:	20000000 	.word	0x20000000
     de4:	00001884 	.word	0x00001884
     de8:	20000144 	.word	0x20000144
     dec:	20000078 	.word	0x20000078

00000df0 <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
     df0:	4668      	mov	r0, sp
     df2:	f020 0107 	bic.w	r1, r0, #7
     df6:	468d      	mov	sp, r1
     df8:	b481      	push	{r0, r7}
     dfa:	af00      	add	r7, sp, #0
	if (USART2_SR&(1<<USART_SR_RXNE)){
     dfc:	4b0e      	ldr	r3, [pc, #56]	; (e38 <USART2_handler+0x48>)
     dfe:	681b      	ldr	r3, [r3, #0]
     e00:	f003 0320 	and.w	r3, r3, #32
     e04:	2b00      	cmp	r3, #0
     e06:	d012      	beq.n	e2e <USART2_handler+0x3e>
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
     e08:	4b0c      	ldr	r3, [pc, #48]	; (e3c <USART2_handler+0x4c>)
     e0a:	6a1b      	ldr	r3, [r3, #32]
     e0c:	1c5a      	adds	r2, r3, #1
     e0e:	490b      	ldr	r1, [pc, #44]	; (e3c <USART2_handler+0x4c>)
     e10:	620a      	str	r2, [r1, #32]
     e12:	4a0b      	ldr	r2, [pc, #44]	; (e40 <USART2_handler+0x50>)
     e14:	6812      	ldr	r2, [r2, #0]
     e16:	b2d2      	uxtb	r2, r2
     e18:	f002 027f 	and.w	r2, r2, #127	; 0x7f
     e1c:	b2d1      	uxtb	r1, r2
     e1e:	4a07      	ldr	r2, [pc, #28]	; (e3c <USART2_handler+0x4c>)
     e20:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
     e22:	4b06      	ldr	r3, [pc, #24]	; (e3c <USART2_handler+0x4c>)
     e24:	6a1b      	ldr	r3, [r3, #32]
     e26:	f003 031f 	and.w	r3, r3, #31
     e2a:	4a04      	ldr	r2, [pc, #16]	; (e3c <USART2_handler+0x4c>)
     e2c:	6213      	str	r3, [r2, #32]
	}
}
     e2e:	46bd      	mov	sp, r7
     e30:	bc81      	pop	{r0, r7}
     e32:	4685      	mov	sp, r0
     e34:	4770      	bx	lr
     e36:	bf00      	nop
     e38:	40004400 	.word	0x40004400
     e3c:	2000011c 	.word	0x2000011c
     e40:	40004404 	.word	0x40004404

00000e44 <conout>:


// envoie d'un caractère à la console
void conout(char c){
     e44:	b580      	push	{r7, lr}
     e46:	b082      	sub	sp, #8
     e48:	af00      	add	r7, sp, #0
     e4a:	4603      	mov	r3, r0
     e4c:	71fb      	strb	r3, [r7, #7]
	uart_putc(CON,c);
     e4e:	79fb      	ldrb	r3, [r7, #7]
     e50:	4803      	ldr	r0, [pc, #12]	; (e60 <conout+0x1c>)
     e52:	4619      	mov	r1, r3
     e54:	f000 fc70 	bl	1738 <uart_putc>
}
     e58:	3708      	adds	r7, #8
     e5a:	46bd      	mov	sp, r7
     e5c:	bd80      	pop	{r7, pc}
     e5e:	bf00      	nop
     e60:	40004400 	.word	0x40004400

00000e64 <conin>:


// réception d'un caractère de la console
char conin(){
     e64:	b480      	push	{r7}
     e66:	b083      	sub	sp, #12
     e68:	af00      	add	r7, sp, #0
	char c=0;
     e6a:	2300      	movs	r3, #0
     e6c:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
     e6e:	4b0d      	ldr	r3, [pc, #52]	; (ea4 <conin+0x40>)
     e70:	6a1a      	ldr	r2, [r3, #32]
     e72:	4b0c      	ldr	r3, [pc, #48]	; (ea4 <conin+0x40>)
     e74:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     e76:	429a      	cmp	r2, r3
     e78:	d00d      	beq.n	e96 <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
     e7a:	4b0a      	ldr	r3, [pc, #40]	; (ea4 <conin+0x40>)
     e7c:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     e7e:	1c5a      	adds	r2, r3, #1
     e80:	4908      	ldr	r1, [pc, #32]	; (ea4 <conin+0x40>)
     e82:	624a      	str	r2, [r1, #36]	; 0x24
     e84:	4a07      	ldr	r2, [pc, #28]	; (ea4 <conin+0x40>)
     e86:	5cd3      	ldrb	r3, [r2, r3]
     e88:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
     e8a:	4b06      	ldr	r3, [pc, #24]	; (ea4 <conin+0x40>)
     e8c:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     e8e:	f003 031f 	and.w	r3, r3, #31
     e92:	4a04      	ldr	r2, [pc, #16]	; (ea4 <conin+0x40>)
     e94:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
     e96:	79fb      	ldrb	r3, [r7, #7]
}
     e98:	4618      	mov	r0, r3
     e9a:	370c      	adds	r7, #12
     e9c:	46bd      	mov	sp, r7
     e9e:	f85d 7b04 	ldr.w	r7, [sp], #4
     ea2:	4770      	bx	lr
     ea4:	2000011c 	.word	0x2000011c

00000ea8 <print>:

// imprime un chaîne sur la console
void print(const char *str){
     ea8:	b580      	push	{r7, lr}
     eaa:	b082      	sub	sp, #8
     eac:	af00      	add	r7, sp, #0
     eae:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
     eb0:	e006      	b.n	ec0 <print+0x18>
     eb2:	687b      	ldr	r3, [r7, #4]
     eb4:	1c5a      	adds	r2, r3, #1
     eb6:	607a      	str	r2, [r7, #4]
     eb8:	781b      	ldrb	r3, [r3, #0]
     eba:	4618      	mov	r0, r3
     ebc:	f7ff ffc2 	bl	e44 <conout>
     ec0:	687b      	ldr	r3, [r7, #4]
     ec2:	781b      	ldrb	r3, [r3, #0]
     ec4:	2b00      	cmp	r3, #0
     ec6:	d1f4      	bne.n	eb2 <print+0xa>
}
     ec8:	3708      	adds	r7, #8
     eca:	46bd      	mov	sp, r7
     ecc:	bd80      	pop	{r7, pc}
     ece:	bf00      	nop

00000ed0 <beep>:

void beep(){
     ed0:	b480      	push	{r7}
     ed2:	af00      	add	r7, sp, #0
}
     ed4:	46bd      	mov	sp, r7
     ed6:	f85d 7b04 	ldr.w	r7, [sp], #4
     eda:	4770      	bx	lr

00000edc <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
     edc:	b580      	push	{r7, lr}
     ede:	af00      	add	r7, sp, #0
	conout(BS);
     ee0:	2008      	movs	r0, #8
     ee2:	f7ff ffaf 	bl	e44 <conout>
	conout(SPACE);
     ee6:	2020      	movs	r0, #32
     ee8:	f7ff ffac 	bl	e44 <conout>
	conout(BS);
     eec:	2008      	movs	r0, #8
     eee:	f7ff ffa9 	bl	e44 <conout>
}
     ef2:	bd80      	pop	{r7, pc}

00000ef4 <esc_seq>:

void esc_seq(){
     ef4:	b580      	push	{r7, lr}
     ef6:	af00      	add	r7, sp, #0
	conout(ESC);
     ef8:	201b      	movs	r0, #27
     efa:	f7ff ffa3 	bl	e44 <conout>
	conout('[');
     efe:	205b      	movs	r0, #91	; 0x5b
     f00:	f7ff ffa0 	bl	e44 <conout>
}
     f04:	bd80      	pop	{r7, pc}
     f06:	bf00      	nop

00000f08 <cls>:

// vide l'écran de la console
void cls(){
     f08:	b580      	push	{r7, lr}
     f0a:	af00      	add	r7, sp, #0
	esc_seq();
     f0c:	f7ff fff2 	bl	ef4 <esc_seq>
	conout('2');
     f10:	2032      	movs	r0, #50	; 0x32
     f12:	f7ff ff97 	bl	e44 <conout>
	conout('J');
     f16:	204a      	movs	r0, #74	; 0x4a
     f18:	f7ff ff94 	bl	e44 <conout>
}
     f1c:	bd80      	pop	{r7, pc}
     f1e:	bf00      	nop

00000f20 <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
     f20:	b580      	push	{r7, lr}
     f22:	b082      	sub	sp, #8
     f24:	af00      	add	r7, sp, #0
     f26:	6078      	str	r0, [r7, #4]
	esc_seq();
     f28:	f7ff ffe4 	bl	ef4 <esc_seq>
	conout('2');
     f2c:	2032      	movs	r0, #50	; 0x32
     f2e:	f7ff ff89 	bl	e44 <conout>
	conout('K');
     f32:	204b      	movs	r0, #75	; 0x4b
     f34:	f7ff ff86 	bl	e44 <conout>
	while (n){conout(BS);n--;}
     f38:	e005      	b.n	f46 <clear_line+0x26>
     f3a:	2008      	movs	r0, #8
     f3c:	f7ff ff82 	bl	e44 <conout>
     f40:	687b      	ldr	r3, [r7, #4]
     f42:	3b01      	subs	r3, #1
     f44:	607b      	str	r3, [r7, #4]
     f46:	687b      	ldr	r3, [r7, #4]
     f48:	2b00      	cmp	r3, #0
     f4a:	d1f6      	bne.n	f3a <clear_line+0x1a>
}
     f4c:	3708      	adds	r7, #8
     f4e:	46bd      	mov	sp, r7
     f50:	bd80      	pop	{r7, pc}
     f52:	bf00      	nop

00000f54 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
     f54:	b580      	push	{r7, lr}
     f56:	b084      	sub	sp, #16
     f58:	af00      	add	r7, sp, #0
     f5a:	6078      	str	r0, [r7, #4]
     f5c:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
     f5e:	2300      	movs	r3, #0
     f60:	60fb      	str	r3, [r7, #12]
	char c=0;
     f62:	2300      	movs	r3, #0
     f64:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
     f66:	683b      	ldr	r3, [r7, #0]
     f68:	3b01      	subs	r3, #1
     f6a:	603b      	str	r3, [r7, #0]
	while (c!=13){
     f6c:	e08e      	b.n	108c <read_line+0x138>
			c=conin();
     f6e:	f7ff ff79 	bl	e64 <conin>
     f72:	4603      	mov	r3, r0
     f74:	72fb      	strb	r3, [r7, #11]
			switch(c){
     f76:	7afb      	ldrb	r3, [r7, #11]
     f78:	2b18      	cmp	r3, #24
     f7a:	d872      	bhi.n	1062 <read_line+0x10e>
     f7c:	a201      	add	r2, pc, #4	; (adr r2, f84 <read_line+0x30>)
     f7e:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     f82:	bf00      	nop
     f84:	0000108d 	.word	0x0000108d
     f88:	00001063 	.word	0x00001063
     f8c:	00001063 	.word	0x00001063
     f90:	00001063 	.word	0x00001063
     f94:	00001063 	.word	0x00001063
     f98:	00001055 	.word	0x00001055
     f9c:	00001063 	.word	0x00001063
     fa0:	00001063 	.word	0x00001063
     fa4:	00001043 	.word	0x00001043
     fa8:	0000105f 	.word	0x0000105f
     fac:	00000fe9 	.word	0x00000fe9
     fb0:	00001063 	.word	0x00001063
     fb4:	00001063 	.word	0x00001063
     fb8:	00000fe9 	.word	0x00000fe9
     fbc:	00001063 	.word	0x00001063
     fc0:	00001063 	.word	0x00001063
     fc4:	00001063 	.word	0x00001063
     fc8:	00001063 	.word	0x00001063
     fcc:	00001063 	.word	0x00001063
     fd0:	00001063 	.word	0x00001063
     fd4:	00001063 	.word	0x00001063
     fd8:	00000ff7 	.word	0x00000ff7
     fdc:	00001063 	.word	0x00001063
     fe0:	0000100d 	.word	0x0000100d
     fe4:	00000ff7 	.word	0x00000ff7
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
     fe8:	230d      	movs	r3, #13
     fea:	72fb      	strb	r3, [r7, #11]
				conout(c);
     fec:	7afb      	ldrb	r3, [r7, #11]
     fee:	4618      	mov	r0, r3
     ff0:	f7ff ff28 	bl	e44 <conout>
				break;
     ff4:	e04a      	b.n	108c <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
     ff6:	68f8      	ldr	r0, [r7, #12]
     ff8:	f7ff ff92 	bl	f20 <clear_line>
				line_len=0;
     ffc:	2300      	movs	r3, #0
     ffe:	60fb      	str	r3, [r7, #12]
				break;
    1000:	e044      	b.n	108c <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    1002:	f7ff ff6b 	bl	edc <delete_back>
					line_len--;
    1006:	68fb      	ldr	r3, [r7, #12]
    1008:	3b01      	subs	r3, #1
    100a:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    100c:	68fb      	ldr	r3, [r7, #12]
    100e:	2b00      	cmp	r3, #0
    1010:	d006      	beq.n	1020 <read_line+0xcc>
    1012:	68fb      	ldr	r3, [r7, #12]
    1014:	3b01      	subs	r3, #1
    1016:	687a      	ldr	r2, [r7, #4]
    1018:	4413      	add	r3, r2
    101a:	781b      	ldrb	r3, [r3, #0]
    101c:	2b20      	cmp	r3, #32
    101e:	d0f0      	beq.n	1002 <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1020:	e004      	b.n	102c <read_line+0xd8>
					delete_back();
    1022:	f7ff ff5b 	bl	edc <delete_back>
					line_len--;
    1026:	68fb      	ldr	r3, [r7, #12]
    1028:	3b01      	subs	r3, #1
    102a:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    102c:	68fb      	ldr	r3, [r7, #12]
    102e:	2b00      	cmp	r3, #0
    1030:	d006      	beq.n	1040 <read_line+0xec>
    1032:	68fb      	ldr	r3, [r7, #12]
    1034:	3b01      	subs	r3, #1
    1036:	687a      	ldr	r2, [r7, #4]
    1038:	4413      	add	r3, r2
    103a:	781b      	ldrb	r3, [r3, #0]
    103c:	2b20      	cmp	r3, #32
    103e:	d1f0      	bne.n	1022 <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    1040:	e024      	b.n	108c <read_line+0x138>
				case BS:
				if (line_len){
    1042:	68fb      	ldr	r3, [r7, #12]
    1044:	2b00      	cmp	r3, #0
    1046:	d004      	beq.n	1052 <read_line+0xfe>
					delete_back();
    1048:	f7ff ff48 	bl	edc <delete_back>
					line_len--;
    104c:	68fb      	ldr	r3, [r7, #12]
    104e:	3b01      	subs	r3, #1
    1050:	60fb      	str	r3, [r7, #12]
				}
				break;
    1052:	e01b      	b.n	108c <read_line+0x138>
				case CTRL_E:
				cls();
    1054:	f7ff ff58 	bl	f08 <cls>
				line_len=0;
    1058:	2300      	movs	r3, #0
    105a:	60fb      	str	r3, [r7, #12]
				break;
    105c:	e016      	b.n	108c <read_line+0x138>
				case TAB:
				c=SPACE;
    105e:	2320      	movs	r3, #32
    1060:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    1062:	68fa      	ldr	r2, [r7, #12]
    1064:	683b      	ldr	r3, [r7, #0]
    1066:	429a      	cmp	r2, r3
    1068:	d20e      	bcs.n	1088 <read_line+0x134>
    106a:	7afb      	ldrb	r3, [r7, #11]
    106c:	2b1f      	cmp	r3, #31
    106e:	d90b      	bls.n	1088 <read_line+0x134>
					buffer[line_len++]=c;
    1070:	68fb      	ldr	r3, [r7, #12]
    1072:	1c5a      	adds	r2, r3, #1
    1074:	60fa      	str	r2, [r7, #12]
    1076:	687a      	ldr	r2, [r7, #4]
    1078:	4413      	add	r3, r2
    107a:	7afa      	ldrb	r2, [r7, #11]
    107c:	701a      	strb	r2, [r3, #0]
					conout(c);
    107e:	7afb      	ldrb	r3, [r7, #11]
    1080:	4618      	mov	r0, r3
    1082:	f7ff fedf 	bl	e44 <conout>
    1086:	e001      	b.n	108c <read_line+0x138>
				}else{
					beep();
    1088:	f7ff ff22 	bl	ed0 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    108c:	7afb      	ldrb	r3, [r7, #11]
    108e:	2b0d      	cmp	r3, #13
    1090:	f47f af6d 	bne.w	f6e <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1094:	687a      	ldr	r2, [r7, #4]
    1096:	68fb      	ldr	r3, [r7, #12]
    1098:	4413      	add	r3, r2
    109a:	2200      	movs	r2, #0
    109c:	701a      	strb	r2, [r3, #0]
	return line_len;
    109e:	68fb      	ldr	r3, [r7, #12]
}
    10a0:	4618      	mov	r0, r3
    10a2:	3710      	adds	r7, #16
    10a4:	46bd      	mov	sp, r7
    10a6:	bd80      	pop	{r7, pc}

000010a8 <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    10a8:	b580      	push	{r7, lr}
    10aa:	b08e      	sub	sp, #56	; 0x38
    10ac:	af00      	add	r7, sp, #0
    10ae:	6078      	str	r0, [r7, #4]
    10b0:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    10b2:	2301      	movs	r3, #1
    10b4:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    10b6:	2322      	movs	r3, #34	; 0x22
    10b8:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    10ba:	2300      	movs	r3, #0
    10bc:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    10c0:	687b      	ldr	r3, [r7, #4]
    10c2:	2b00      	cmp	r3, #0
    10c4:	da05      	bge.n	10d2 <print_int+0x2a>
    10c6:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    10ca:	637b      	str	r3, [r7, #52]	; 0x34
    10cc:	687b      	ldr	r3, [r7, #4]
    10ce:	425b      	negs	r3, r3
    10d0:	607b      	str	r3, [r7, #4]
	while (i){
    10d2:	e02c      	b.n	112e <print_int+0x86>
		fmt[pos]=i%base+'0';
    10d4:	687b      	ldr	r3, [r7, #4]
    10d6:	683a      	ldr	r2, [r7, #0]
    10d8:	fbb3 f2f2 	udiv	r2, r3, r2
    10dc:	6839      	ldr	r1, [r7, #0]
    10de:	fb01 f202 	mul.w	r2, r1, r2
    10e2:	1a9b      	subs	r3, r3, r2
    10e4:	b2db      	uxtb	r3, r3
    10e6:	3330      	adds	r3, #48	; 0x30
    10e8:	b2d9      	uxtb	r1, r3
    10ea:	f107 020c 	add.w	r2, r7, #12
    10ee:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    10f0:	4413      	add	r3, r2
    10f2:	460a      	mov	r2, r1
    10f4:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    10f6:	f107 020c 	add.w	r2, r7, #12
    10fa:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    10fc:	4413      	add	r3, r2
    10fe:	781b      	ldrb	r3, [r3, #0]
    1100:	2b39      	cmp	r3, #57	; 0x39
    1102:	d90c      	bls.n	111e <print_int+0x76>
    1104:	f107 020c 	add.w	r2, r7, #12
    1108:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    110a:	4413      	add	r3, r2
    110c:	781b      	ldrb	r3, [r3, #0]
    110e:	3307      	adds	r3, #7
    1110:	b2d9      	uxtb	r1, r3
    1112:	f107 020c 	add.w	r2, r7, #12
    1116:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1118:	4413      	add	r3, r2
    111a:	460a      	mov	r2, r1
    111c:	701a      	strb	r2, [r3, #0]
		pos--;
    111e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1120:	3b01      	subs	r3, #1
    1122:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    1124:	687a      	ldr	r2, [r7, #4]
    1126:	683b      	ldr	r3, [r7, #0]
    1128:	fbb2 f3f3 	udiv	r3, r2, r3
    112c:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    112e:	687b      	ldr	r3, [r7, #4]
    1130:	2b00      	cmp	r3, #0
    1132:	d1cf      	bne.n	10d4 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    1134:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1136:	2b22      	cmp	r3, #34	; 0x22
    1138:	d108      	bne.n	114c <print_int+0xa4>
    113a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    113c:	1e5a      	subs	r2, r3, #1
    113e:	633a      	str	r2, [r7, #48]	; 0x30
    1140:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1144:	4413      	add	r3, r2
    1146:	2230      	movs	r2, #48	; 0x30
    1148:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    114c:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    114e:	2b00      	cmp	r3, #0
    1150:	da08      	bge.n	1164 <print_int+0xbc>
    1152:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1154:	1e5a      	subs	r2, r3, #1
    1156:	633a      	str	r2, [r7, #48]	; 0x30
    1158:	f107 0238 	add.w	r2, r7, #56	; 0x38
    115c:	4413      	add	r3, r2
    115e:	222d      	movs	r2, #45	; 0x2d
    1160:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    1164:	f107 020c 	add.w	r2, r7, #12
    1168:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    116a:	4413      	add	r3, r2
    116c:	2220      	movs	r2, #32
    116e:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1170:	f107 020c 	add.w	r2, r7, #12
    1174:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1176:	4413      	add	r3, r2
    1178:	4618      	mov	r0, r3
    117a:	f7ff fe95 	bl	ea8 <print>
}
    117e:	3738      	adds	r7, #56	; 0x38
    1180:	46bd      	mov	sp, r7
    1182:	bd80      	pop	{r7, pc}

00001184 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    1184:	b580      	push	{r7, lr}
    1186:	b088      	sub	sp, #32
    1188:	af00      	add	r7, sp, #0
    118a:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    118c:	230c      	movs	r3, #12
    118e:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    1190:	2300      	movs	r3, #0
    1192:	767b      	strb	r3, [r7, #25]
	while (u){
    1194:	e026      	b.n	11e4 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    1196:	687b      	ldr	r3, [r7, #4]
    1198:	b2db      	uxtb	r3, r3
    119a:	f003 030f 	and.w	r3, r3, #15
    119e:	b2db      	uxtb	r3, r3
    11a0:	3330      	adds	r3, #48	; 0x30
    11a2:	b2d9      	uxtb	r1, r3
    11a4:	f107 020c 	add.w	r2, r7, #12
    11a8:	69fb      	ldr	r3, [r7, #28]
    11aa:	4413      	add	r3, r2
    11ac:	460a      	mov	r2, r1
    11ae:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    11b0:	f107 020c 	add.w	r2, r7, #12
    11b4:	69fb      	ldr	r3, [r7, #28]
    11b6:	4413      	add	r3, r2
    11b8:	781b      	ldrb	r3, [r3, #0]
    11ba:	2b39      	cmp	r3, #57	; 0x39
    11bc:	d90c      	bls.n	11d8 <print_hex+0x54>
    11be:	f107 020c 	add.w	r2, r7, #12
    11c2:	69fb      	ldr	r3, [r7, #28]
    11c4:	4413      	add	r3, r2
    11c6:	781b      	ldrb	r3, [r3, #0]
    11c8:	3307      	adds	r3, #7
    11ca:	b2d9      	uxtb	r1, r3
    11cc:	f107 020c 	add.w	r2, r7, #12
    11d0:	69fb      	ldr	r3, [r7, #28]
    11d2:	4413      	add	r3, r2
    11d4:	460a      	mov	r2, r1
    11d6:	701a      	strb	r2, [r3, #0]
		pos--;
    11d8:	69fb      	ldr	r3, [r7, #28]
    11da:	3b01      	subs	r3, #1
    11dc:	61fb      	str	r3, [r7, #28]
		u/=16;
    11de:	687b      	ldr	r3, [r7, #4]
    11e0:	091b      	lsrs	r3, r3, #4
    11e2:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    11e4:	687b      	ldr	r3, [r7, #4]
    11e6:	2b00      	cmp	r3, #0
    11e8:	d1d5      	bne.n	1196 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    11ea:	69fb      	ldr	r3, [r7, #28]
    11ec:	2b0c      	cmp	r3, #12
    11ee:	d108      	bne.n	1202 <print_hex+0x7e>
    11f0:	69fb      	ldr	r3, [r7, #28]
    11f2:	1e5a      	subs	r2, r3, #1
    11f4:	61fa      	str	r2, [r7, #28]
    11f6:	f107 0220 	add.w	r2, r7, #32
    11fa:	4413      	add	r3, r2
    11fc:	2230      	movs	r2, #48	; 0x30
    11fe:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    1202:	69fb      	ldr	r3, [r7, #28]
    1204:	1e5a      	subs	r2, r3, #1
    1206:	61fa      	str	r2, [r7, #28]
    1208:	f107 0220 	add.w	r2, r7, #32
    120c:	4413      	add	r3, r2
    120e:	2278      	movs	r2, #120	; 0x78
    1210:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    1214:	69fb      	ldr	r3, [r7, #28]
    1216:	1e5a      	subs	r2, r3, #1
    1218:	61fa      	str	r2, [r7, #28]
    121a:	f107 0220 	add.w	r2, r7, #32
    121e:	4413      	add	r3, r2
    1220:	2230      	movs	r2, #48	; 0x30
    1222:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    1226:	f107 020c 	add.w	r2, r7, #12
    122a:	69fb      	ldr	r3, [r7, #28]
    122c:	4413      	add	r3, r2
    122e:	2220      	movs	r2, #32
    1230:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1232:	f107 020c 	add.w	r2, r7, #12
    1236:	69fb      	ldr	r3, [r7, #28]
    1238:	4413      	add	r3, r2
    123a:	4618      	mov	r0, r3
    123c:	f7ff fe34 	bl	ea8 <print>
}
    1240:	3720      	adds	r7, #32
    1242:	46bd      	mov	sp, r7
    1244:	bd80      	pop	{r7, pc}
    1246:	bf00      	nop

00001248 <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    1248:	b480      	push	{r7}
    124a:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    124c:	4b04      	ldr	r3, [pc, #16]	; (1260 <flush_rx_queue+0x18>)
    124e:	2200      	movs	r2, #0
    1250:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    1252:	4b03      	ldr	r3, [pc, #12]	; (1260 <flush_rx_queue+0x18>)
    1254:	2200      	movs	r2, #0
    1256:	625a      	str	r2, [r3, #36]	; 0x24
}
    1258:	46bd      	mov	sp, r7
    125a:	f85d 7b04 	ldr.w	r7, [sp], #4
    125e:	4770      	bx	lr
    1260:	2000011c 	.word	0x2000011c

00001264 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    1264:	b480      	push	{r7}
    1266:	b085      	sub	sp, #20
    1268:	af00      	add	r7, sp, #0
    126a:	60f8      	str	r0, [r7, #12]
    126c:	60b9      	str	r1, [r7, #8]
    126e:	607a      	str	r2, [r7, #4]
	switch (port){
    1270:	68fb      	ldr	r3, [r7, #12]
    1272:	2b01      	cmp	r3, #1
    1274:	d030      	beq.n	12d8 <config_pin+0x74>
    1276:	2b01      	cmp	r3, #1
    1278:	d302      	bcc.n	1280 <config_pin+0x1c>
    127a:	2b02      	cmp	r3, #2
    127c:	d058      	beq.n	1330 <config_pin+0xcc>
    127e:	e083      	b.n	1388 <config_pin+0x124>
		case GPIOA:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    1280:	4b44      	ldr	r3, [pc, #272]	; (1394 <config_pin+0x130>)
    1282:	681a      	ldr	r2, [r3, #0]
    1284:	68bb      	ldr	r3, [r7, #8]
    1286:	08db      	lsrs	r3, r3, #3
    1288:	009b      	lsls	r3, r3, #2
    128a:	4413      	add	r3, r2
    128c:	4a41      	ldr	r2, [pc, #260]	; (1394 <config_pin+0x130>)
    128e:	6811      	ldr	r1, [r2, #0]
    1290:	68ba      	ldr	r2, [r7, #8]
    1292:	08d2      	lsrs	r2, r2, #3
    1294:	0092      	lsls	r2, r2, #2
    1296:	440a      	add	r2, r1
    1298:	6812      	ldr	r2, [r2, #0]
    129a:	68b9      	ldr	r1, [r7, #8]
    129c:	f001 0107 	and.w	r1, r1, #7
    12a0:	200f      	movs	r0, #15
    12a2:	fa00 f101 	lsl.w	r1, r0, r1
    12a6:	43c9      	mvns	r1, r1
    12a8:	400a      	ands	r2, r1
    12aa:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    12ac:	4b39      	ldr	r3, [pc, #228]	; (1394 <config_pin+0x130>)
    12ae:	681a      	ldr	r2, [r3, #0]
    12b0:	68bb      	ldr	r3, [r7, #8]
    12b2:	08db      	lsrs	r3, r3, #3
    12b4:	009b      	lsls	r3, r3, #2
    12b6:	4413      	add	r3, r2
    12b8:	4a36      	ldr	r2, [pc, #216]	; (1394 <config_pin+0x130>)
    12ba:	6811      	ldr	r1, [r2, #0]
    12bc:	68ba      	ldr	r2, [r7, #8]
    12be:	08d2      	lsrs	r2, r2, #3
    12c0:	0092      	lsls	r2, r2, #2
    12c2:	440a      	add	r2, r1
    12c4:	6811      	ldr	r1, [r2, #0]
    12c6:	68ba      	ldr	r2, [r7, #8]
    12c8:	f002 0207 	and.w	r2, r2, #7
    12cc:	6878      	ldr	r0, [r7, #4]
    12ce:	fa00 f202 	lsl.w	r2, r0, r2
    12d2:	430a      	orrs	r2, r1
    12d4:	601a      	str	r2, [r3, #0]
		break;
    12d6:	e057      	b.n	1388 <config_pin+0x124>
		case GPIOB:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    12d8:	4b2e      	ldr	r3, [pc, #184]	; (1394 <config_pin+0x130>)
    12da:	681a      	ldr	r2, [r3, #0]
    12dc:	68bb      	ldr	r3, [r7, #8]
    12de:	08db      	lsrs	r3, r3, #3
    12e0:	009b      	lsls	r3, r3, #2
    12e2:	4413      	add	r3, r2
    12e4:	4a2b      	ldr	r2, [pc, #172]	; (1394 <config_pin+0x130>)
    12e6:	6811      	ldr	r1, [r2, #0]
    12e8:	68ba      	ldr	r2, [r7, #8]
    12ea:	08d2      	lsrs	r2, r2, #3
    12ec:	0092      	lsls	r2, r2, #2
    12ee:	440a      	add	r2, r1
    12f0:	6812      	ldr	r2, [r2, #0]
    12f2:	68b9      	ldr	r1, [r7, #8]
    12f4:	f001 0107 	and.w	r1, r1, #7
    12f8:	200f      	movs	r0, #15
    12fa:	fa00 f101 	lsl.w	r1, r0, r1
    12fe:	43c9      	mvns	r1, r1
    1300:	400a      	ands	r2, r1
    1302:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    1304:	4b23      	ldr	r3, [pc, #140]	; (1394 <config_pin+0x130>)
    1306:	681a      	ldr	r2, [r3, #0]
    1308:	68bb      	ldr	r3, [r7, #8]
    130a:	08db      	lsrs	r3, r3, #3
    130c:	009b      	lsls	r3, r3, #2
    130e:	4413      	add	r3, r2
    1310:	4a20      	ldr	r2, [pc, #128]	; (1394 <config_pin+0x130>)
    1312:	6811      	ldr	r1, [r2, #0]
    1314:	68ba      	ldr	r2, [r7, #8]
    1316:	08d2      	lsrs	r2, r2, #3
    1318:	0092      	lsls	r2, r2, #2
    131a:	440a      	add	r2, r1
    131c:	6811      	ldr	r1, [r2, #0]
    131e:	68ba      	ldr	r2, [r7, #8]
    1320:	f002 0207 	and.w	r2, r2, #7
    1324:	6878      	ldr	r0, [r7, #4]
    1326:	fa00 f202 	lsl.w	r2, r0, r2
    132a:	430a      	orrs	r2, r1
    132c:	601a      	str	r2, [r3, #0]
		break;
    132e:	e02b      	b.n	1388 <config_pin+0x124>
		case GPIOC:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    1330:	4b18      	ldr	r3, [pc, #96]	; (1394 <config_pin+0x130>)
    1332:	681a      	ldr	r2, [r3, #0]
    1334:	68bb      	ldr	r3, [r7, #8]
    1336:	08db      	lsrs	r3, r3, #3
    1338:	009b      	lsls	r3, r3, #2
    133a:	4413      	add	r3, r2
    133c:	4a15      	ldr	r2, [pc, #84]	; (1394 <config_pin+0x130>)
    133e:	6811      	ldr	r1, [r2, #0]
    1340:	68ba      	ldr	r2, [r7, #8]
    1342:	08d2      	lsrs	r2, r2, #3
    1344:	0092      	lsls	r2, r2, #2
    1346:	440a      	add	r2, r1
    1348:	6812      	ldr	r2, [r2, #0]
    134a:	68b9      	ldr	r1, [r7, #8]
    134c:	f001 0107 	and.w	r1, r1, #7
    1350:	200f      	movs	r0, #15
    1352:	fa00 f101 	lsl.w	r1, r0, r1
    1356:	43c9      	mvns	r1, r1
    1358:	400a      	ands	r2, r1
    135a:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    135c:	4b0d      	ldr	r3, [pc, #52]	; (1394 <config_pin+0x130>)
    135e:	681a      	ldr	r2, [r3, #0]
    1360:	68bb      	ldr	r3, [r7, #8]
    1362:	08db      	lsrs	r3, r3, #3
    1364:	009b      	lsls	r3, r3, #2
    1366:	4413      	add	r3, r2
    1368:	4a0a      	ldr	r2, [pc, #40]	; (1394 <config_pin+0x130>)
    136a:	6811      	ldr	r1, [r2, #0]
    136c:	68ba      	ldr	r2, [r7, #8]
    136e:	08d2      	lsrs	r2, r2, #3
    1370:	0092      	lsls	r2, r2, #2
    1372:	440a      	add	r2, r1
    1374:	6811      	ldr	r1, [r2, #0]
    1376:	68ba      	ldr	r2, [r7, #8]
    1378:	f002 0207 	and.w	r2, r2, #7
    137c:	6878      	ldr	r0, [r7, #4]
    137e:	fa00 f202 	lsl.w	r2, r0, r2
    1382:	430a      	orrs	r2, r1
    1384:	601a      	str	r2, [r3, #0]
		break;
    1386:	bf00      	nop
	}
}
    1388:	3714      	adds	r7, #20
    138a:	46bd      	mov	sp, r7
    138c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1390:	4770      	bx	lr
    1392:	bf00      	nop
    1394:	2000000c 	.word	0x2000000c

00001398 <enable_interrupt>:





void enable_interrupt(unsigned irq){
    1398:	b480      	push	{r7}
    139a:	b085      	sub	sp, #20
    139c:	af00      	add	r7, sp, #0
    139e:	6078      	str	r0, [r7, #4]
	sfrp_t iser=(sfrp_t)(NVIC_ISER0_ADR);
    13a0:	4b0d      	ldr	r3, [pc, #52]	; (13d8 <enable_interrupt+0x40>)
    13a2:	60fb      	str	r3, [r7, #12]
	if (irq>LAST_IRQ) return ;
    13a4:	687b      	ldr	r3, [r7, #4]
    13a6:	2b3b      	cmp	r3, #59	; 0x3b
    13a8:	d900      	bls.n	13ac <enable_interrupt+0x14>
    13aa:	e010      	b.n	13ce <enable_interrupt+0x36>
	iser[irq/32]|=1<<(irq%32);
    13ac:	687b      	ldr	r3, [r7, #4]
    13ae:	095b      	lsrs	r3, r3, #5
    13b0:	009a      	lsls	r2, r3, #2
    13b2:	68f9      	ldr	r1, [r7, #12]
    13b4:	440a      	add	r2, r1
    13b6:	009b      	lsls	r3, r3, #2
    13b8:	68f9      	ldr	r1, [r7, #12]
    13ba:	440b      	add	r3, r1
    13bc:	681b      	ldr	r3, [r3, #0]
    13be:	6879      	ldr	r1, [r7, #4]
    13c0:	f001 011f 	and.w	r1, r1, #31
    13c4:	2001      	movs	r0, #1
    13c6:	fa00 f101 	lsl.w	r1, r0, r1
    13ca:	430b      	orrs	r3, r1
    13cc:	6013      	str	r3, [r2, #0]
	
}
    13ce:	3714      	adds	r7, #20
    13d0:	46bd      	mov	sp, r7
    13d2:	f85d 7b04 	ldr.w	r7, [sp], #4
    13d6:	4770      	bx	lr
    13d8:	e000e100 	.word	0xe000e100

000013dc <disable_interrupt>:


void disable_interrupt(unsigned irq){
    13dc:	b480      	push	{r7}
    13de:	b085      	sub	sp, #20
    13e0:	af00      	add	r7, sp, #0
    13e2:	6078      	str	r0, [r7, #4]
	sfrp_t icer=(sfrp_t)(NVIC_ICER0_ADR);
    13e4:	4b0e      	ldr	r3, [pc, #56]	; (1420 <disable_interrupt+0x44>)
    13e6:	60fb      	str	r3, [r7, #12]
	if (irq>LAST_IRQ) return ;
    13e8:	687b      	ldr	r3, [r7, #4]
    13ea:	2b3b      	cmp	r3, #59	; 0x3b
    13ec:	d900      	bls.n	13f0 <disable_interrupt+0x14>
    13ee:	e011      	b.n	1414 <disable_interrupt+0x38>
	icer[irq/32]&=~(1<<(irq%32));
    13f0:	687b      	ldr	r3, [r7, #4]
    13f2:	095b      	lsrs	r3, r3, #5
    13f4:	009a      	lsls	r2, r3, #2
    13f6:	68f9      	ldr	r1, [r7, #12]
    13f8:	440a      	add	r2, r1
    13fa:	009b      	lsls	r3, r3, #2
    13fc:	68f9      	ldr	r1, [r7, #12]
    13fe:	440b      	add	r3, r1
    1400:	681b      	ldr	r3, [r3, #0]
    1402:	6879      	ldr	r1, [r7, #4]
    1404:	f001 011f 	and.w	r1, r1, #31
    1408:	2001      	movs	r0, #1
    140a:	fa00 f101 	lsl.w	r1, r0, r1
    140e:	43c9      	mvns	r1, r1
    1410:	400b      	ands	r3, r1
    1412:	6013      	str	r3, [r2, #0]
	
}
    1414:	3714      	adds	r7, #20
    1416:	46bd      	mov	sp, r7
    1418:	f85d 7b04 	ldr.w	r7, [sp], #4
    141c:	4770      	bx	lr
    141e:	bf00      	nop
    1420:	e000e180 	.word	0xe000e180

00001424 <set_int_priority>:


typedef volatile uint8_t* ipr_t;
typedef volatile uint8_t* shpr_t;
void set_int_priority(int32_t irq, unsigned priority){
    1424:	b480      	push	{r7}
    1426:	b085      	sub	sp, #20
    1428:	af00      	add	r7, sp, #0
    142a:	6078      	str	r0, [r7, #4]
    142c:	6039      	str	r1, [r7, #0]
	ipr_t ipr=(ipr_t)NVIC_IPR0_ADR;
    142e:	4b15      	ldr	r3, [pc, #84]	; (1484 <set_int_priority+0x60>)
    1430:	60fb      	str	r3, [r7, #12]
	shpr_t shpr=(shpr_t)(SCB_BASE_ADR+24);
    1432:	4b15      	ldr	r3, [pc, #84]	; (1488 <set_int_priority+0x64>)
    1434:	60bb      	str	r3, [r7, #8]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    1436:	687b      	ldr	r3, [r7, #4]
    1438:	2b00      	cmp	r3, #0
    143a:	db0b      	blt.n	1454 <set_int_priority+0x30>
    143c:	687b      	ldr	r3, [r7, #4]
    143e:	2b3b      	cmp	r3, #59	; 0x3b
    1440:	dc08      	bgt.n	1454 <set_int_priority+0x30>
		ipr[irq]=(uint8_t)((priority&15)<<4);
    1442:	687b      	ldr	r3, [r7, #4]
    1444:	68fa      	ldr	r2, [r7, #12]
    1446:	4413      	add	r3, r2
    1448:	683a      	ldr	r2, [r7, #0]
    144a:	b2d2      	uxtb	r2, r2
    144c:	0112      	lsls	r2, r2, #4
    144e:	b2d2      	uxtb	r2, r2
    1450:	701a      	strb	r2, [r3, #0]
    1452:	e012      	b.n	147a <set_int_priority+0x56>
	}else if ((irq<0) && (irq>-16)){
    1454:	687b      	ldr	r3, [r7, #4]
    1456:	2b00      	cmp	r3, #0
    1458:	da0f      	bge.n	147a <set_int_priority+0x56>
    145a:	687b      	ldr	r3, [r7, #4]
    145c:	f113 0f0f 	cmn.w	r3, #15
    1460:	db0b      	blt.n	147a <set_int_priority+0x56>
		shpr[-(irq+4)]=(uint8_t)((priority&15)<<4);
    1462:	687a      	ldr	r2, [r7, #4]
    1464:	f06f 0303 	mvn.w	r3, #3
    1468:	1a9b      	subs	r3, r3, r2
    146a:	461a      	mov	r2, r3
    146c:	68bb      	ldr	r3, [r7, #8]
    146e:	4413      	add	r3, r2
    1470:	683a      	ldr	r2, [r7, #0]
    1472:	b2d2      	uxtb	r2, r2
    1474:	0112      	lsls	r2, r2, #4
    1476:	b2d2      	uxtb	r2, r2
    1478:	701a      	strb	r2, [r3, #0]
	}
}
    147a:	3714      	adds	r7, #20
    147c:	46bd      	mov	sp, r7
    147e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1482:	4770      	bx	lr
    1484:	e000e400 	.word	0xe000e400
    1488:	e000ed18 	.word	0xe000ed18

0000148c <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    148c:	4b01      	ldr	r3, [pc, #4]	; (1494 <reset_mcu+0x8>)
    148e:	4a02      	ldr	r2, [pc, #8]	; (1498 <reset_mcu+0xc>)
    1490:	601a      	str	r2, [r3, #0]
    1492:	bf00      	nop
    1494:	e000ed0c 	.word	0xe000ed0c
    1498:	05fa0004 	.word	0x05fa0004

0000149c <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    149c:	b580      	push	{r7, lr}
    149e:	b082      	sub	sp, #8
    14a0:	af00      	add	r7, sp, #0
    14a2:	6078      	str	r0, [r7, #4]
    14a4:	6039      	str	r1, [r7, #0]
	print(msg);
    14a6:	6878      	ldr	r0, [r7, #4]
    14a8:	f7ff fcfe 	bl	ea8 <print>
	print("at address ");
    14ac:	4814      	ldr	r0, [pc, #80]	; (1500 <print_fault+0x64>)
    14ae:	f7ff fcfb 	bl	ea8 <print>
	if (adr) {
    14b2:	683b      	ldr	r3, [r7, #0]
    14b4:	2b00      	cmp	r3, #0
    14b6:	d002      	beq.n	14be <print_fault+0x22>
		print_hex(adr);
    14b8:	6838      	ldr	r0, [r7, #0]
    14ba:	f7ff fe63 	bl	1184 <print_hex>
	};
	conout(CR);
    14be:	200d      	movs	r0, #13
    14c0:	f7ff fcc0 	bl	e44 <conout>
	print("UFSR=");
    14c4:	480f      	ldr	r0, [pc, #60]	; (1504 <print_fault+0x68>)
    14c6:	f7ff fcef 	bl	ea8 <print>
	print_hex(((*(sfrp_t)0xE000ED28)&0xffff0000)>>16);
    14ca:	4b0f      	ldr	r3, [pc, #60]	; (1508 <print_fault+0x6c>)
    14cc:	681b      	ldr	r3, [r3, #0]
    14ce:	0c1b      	lsrs	r3, r3, #16
    14d0:	4618      	mov	r0, r3
    14d2:	f7ff fe57 	bl	1184 <print_hex>
	print(", BFSR=");
    14d6:	480d      	ldr	r0, [pc, #52]	; (150c <print_fault+0x70>)
    14d8:	f7ff fce6 	bl	ea8 <print>
	print_hex(((*(sfrp_t)0xE000ED28)&0xff00)>>8);
    14dc:	4b0a      	ldr	r3, [pc, #40]	; (1508 <print_fault+0x6c>)
    14de:	681b      	ldr	r3, [r3, #0]
    14e0:	f403 437f 	and.w	r3, r3, #65280	; 0xff00
    14e4:	0a1b      	lsrs	r3, r3, #8
    14e6:	4618      	mov	r0, r3
    14e8:	f7ff fe4c 	bl	1184 <print_hex>
	print(", MMFSR=");
    14ec:	4808      	ldr	r0, [pc, #32]	; (1510 <print_fault+0x74>)
    14ee:	f7ff fcdb 	bl	ea8 <print>
	print_hex(((*(sfrp_t)0xE000ED28)&0xff));
    14f2:	4b05      	ldr	r3, [pc, #20]	; (1508 <print_fault+0x6c>)
    14f4:	681b      	ldr	r3, [r3, #0]
    14f6:	b2db      	uxtb	r3, r3
    14f8:	4618      	mov	r0, r3
    14fa:	f7ff fe43 	bl	1184 <print_hex>
	while(1);
    14fe:	e7fe      	b.n	14fe <print_fault+0x62>
    1500:	000018a0 	.word	0x000018a0
    1504:	000018ac 	.word	0x000018ac
    1508:	e000ed28 	.word	0xe000ed28
    150c:	000018b4 	.word	0x000018b4
    1510:	000018bc 	.word	0x000018bc

00001514 <uart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
    1514:	b480      	push	{r7}
    1516:	b085      	sub	sp, #20
    1518:	af00      	add	r7, sp, #0
    151a:	6078      	str	r0, [r7, #4]
    151c:	6039      	str	r1, [r7, #0]
	sfrp_t brr;
	uint32_t rate;

    brr=(sfrp_t)(channel+USART_BRR_OFS);		
    151e:	687b      	ldr	r3, [r7, #4]
    1520:	3308      	adds	r3, #8
    1522:	60bb      	str	r3, [r7, #8]
	switch (channel){
    1524:	687b      	ldr	r3, [r7, #4]
    1526:	4a1a      	ldr	r2, [pc, #104]	; (1590 <uart_set_baud+0x7c>)
    1528:	4293      	cmp	r3, r2
    152a:	d019      	beq.n	1560 <uart_set_baud+0x4c>
    152c:	4a19      	ldr	r2, [pc, #100]	; (1594 <uart_set_baud+0x80>)
    152e:	4293      	cmp	r3, r2
    1530:	d003      	beq.n	153a <uart_set_baud+0x26>
    1532:	4a19      	ldr	r2, [pc, #100]	; (1598 <uart_set_baud+0x84>)
    1534:	4293      	cmp	r3, r2
    1536:	d013      	beq.n	1560 <uart_set_baud+0x4c>
    1538:	e021      	b.n	157e <uart_set_baud+0x6a>
	case USART1:
		rate=(FAPB2/baud/16)<<4;
    153a:	4a18      	ldr	r2, [pc, #96]	; (159c <uart_set_baud+0x88>)
    153c:	683b      	ldr	r3, [r7, #0]
    153e:	fbb2 f3f3 	udiv	r3, r2, r3
    1542:	011b      	lsls	r3, r3, #4
    1544:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    1546:	4a16      	ldr	r2, [pc, #88]	; (15a0 <uart_set_baud+0x8c>)
    1548:	683b      	ldr	r3, [r7, #0]
    154a:	fbb2 f3f3 	udiv	r3, r2, r3
    154e:	f003 030f 	and.w	r3, r3, #15
    1552:	68fa      	ldr	r2, [r7, #12]
    1554:	4313      	orrs	r3, r2
    1556:	60fb      	str	r3, [r7, #12]
		*brr=rate;
    1558:	68bb      	ldr	r3, [r7, #8]
    155a:	68fa      	ldr	r2, [r7, #12]
    155c:	601a      	str	r2, [r3, #0]
		return;
    155e:	e011      	b.n	1584 <uart_set_baud+0x70>
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
    1560:	4a10      	ldr	r2, [pc, #64]	; (15a4 <uart_set_baud+0x90>)
    1562:	683b      	ldr	r3, [r7, #0]
    1564:	fbb2 f3f3 	udiv	r3, r2, r3
    1568:	011b      	lsls	r3, r3, #4
    156a:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    156c:	4a0e      	ldr	r2, [pc, #56]	; (15a8 <uart_set_baud+0x94>)
    156e:	683b      	ldr	r3, [r7, #0]
    1570:	fbb2 f3f3 	udiv	r3, r2, r3
    1574:	f003 030f 	and.w	r3, r3, #15
    1578:	68fa      	ldr	r2, [r7, #12]
    157a:	4313      	orrs	r3, r2
    157c:	60fb      	str	r3, [r7, #12]
	}
	*brr=rate;
    157e:	68bb      	ldr	r3, [r7, #8]
    1580:	68fa      	ldr	r2, [r7, #12]
    1582:	601a      	str	r2, [r3, #0]
}
    1584:	3714      	adds	r7, #20
    1586:	46bd      	mov	sp, r7
    1588:	f85d 7b04 	ldr.w	r7, [sp], #4
    158c:	4770      	bx	lr
    158e:	bf00      	nop
    1590:	40004800 	.word	0x40004800
    1594:	40013800 	.word	0x40013800
    1598:	40004400 	.word	0x40004400
    159c:	0044aa20 	.word	0x0044aa20
    15a0:	044aa200 	.word	0x044aa200
    15a4:	00225510 	.word	0x00225510
    15a8:	02255100 	.word	0x02255100

000015ac <uart_open_channel>:

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl){
    15ac:	b580      	push	{r7, lr}
    15ae:	b086      	sub	sp, #24
    15b0:	af00      	add	r7, sp, #0
    15b2:	60f8      	str	r0, [r7, #12]
    15b4:	60b9      	str	r1, [r7, #8]
    15b6:	607a      	str	r2, [r7, #4]
	sfrp_t cr1, cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
    15b8:	68fb      	ldr	r3, [r7, #12]
    15ba:	4a42      	ldr	r2, [pc, #264]	; (16c4 <uart_open_channel+0x118>)
    15bc:	4293      	cmp	r3, r2
    15be:	d046      	beq.n	164e <uart_open_channel+0xa2>
    15c0:	4a41      	ldr	r2, [pc, #260]	; (16c8 <uart_open_channel+0x11c>)
    15c2:	4293      	cmp	r3, r2
    15c4:	d003      	beq.n	15ce <uart_open_channel+0x22>
    15c6:	4a41      	ldr	r2, [pc, #260]	; (16cc <uart_open_channel+0x120>)
    15c8:	4293      	cmp	r3, r2
    15ca:	d020      	beq.n	160e <uart_open_channel+0x62>
    15cc:	e05f      	b.n	168e <uart_open_channel+0xe2>
	case USART1:
		RCC_APB2ENR|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
    15ce:	4a40      	ldr	r2, [pc, #256]	; (16d0 <uart_open_channel+0x124>)
    15d0:	4b3f      	ldr	r3, [pc, #252]	; (16d0 <uart_open_channel+0x124>)
    15d2:	681b      	ldr	r3, [r3, #0]
    15d4:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    15d8:	f043 0304 	orr.w	r3, r3, #4
    15dc:	6013      	str	r3, [r2, #0]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    15de:	4b3d      	ldr	r3, [pc, #244]	; (16d4 <uart_open_channel+0x128>)
    15e0:	681a      	ldr	r2, [r3, #0]
    15e2:	4b3c      	ldr	r3, [pc, #240]	; (16d4 <uart_open_channel+0x128>)
    15e4:	681b      	ldr	r3, [r3, #0]
    15e6:	681b      	ldr	r3, [r3, #0]
    15e8:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    15ec:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    15f0:	6013      	str	r3, [r2, #0]
		GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    15f2:	4b38      	ldr	r3, [pc, #224]	; (16d4 <uart_open_channel+0x128>)
    15f4:	681a      	ldr	r2, [r3, #0]
    15f6:	4b37      	ldr	r3, [pc, #220]	; (16d4 <uart_open_channel+0x128>)
    15f8:	681b      	ldr	r3, [r3, #0]
    15fa:	681b      	ldr	r3, [r3, #0]
    15fc:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    1600:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    1604:	6013      	str	r3, [r2, #0]
		enable_interrupt(USART1_IRQ);
    1606:	2025      	movs	r0, #37	; 0x25
    1608:	f7ff fec6 	bl	1398 <enable_interrupt>
		break;
    160c:	e03f      	b.n	168e <uart_open_channel+0xe2>
	case USART2:
		RCC_APB1ENR|=(1<<RCC_APB1ENR_USART2EN);
    160e:	4a32      	ldr	r2, [pc, #200]	; (16d8 <uart_open_channel+0x12c>)
    1610:	4b31      	ldr	r3, [pc, #196]	; (16d8 <uart_open_channel+0x12c>)
    1612:	681b      	ldr	r3, [r3, #0]
    1614:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    1618:	6013      	str	r3, [r2, #0]
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPAEN);
    161a:	4a2d      	ldr	r2, [pc, #180]	; (16d0 <uart_open_channel+0x124>)
    161c:	4b2c      	ldr	r3, [pc, #176]	; (16d0 <uart_open_channel+0x124>)
    161e:	681b      	ldr	r3, [r3, #0]
    1620:	f043 0304 	orr.w	r3, r3, #4
    1624:	6013      	str	r3, [r2, #0]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX (push-pull)
		// PA3 -> RX (floating)
		GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    1626:	4b2d      	ldr	r3, [pc, #180]	; (16dc <uart_open_channel+0x130>)
    1628:	681b      	ldr	r3, [r3, #0]
    162a:	4a2c      	ldr	r2, [pc, #176]	; (16dc <uart_open_channel+0x130>)
    162c:	6812      	ldr	r2, [r2, #0]
    162e:	6812      	ldr	r2, [r2, #0]
    1630:	f422 627f 	bic.w	r2, r2, #4080	; 0xff0
    1634:	601a      	str	r2, [r3, #0]
		GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    1636:	4b29      	ldr	r3, [pc, #164]	; (16dc <uart_open_channel+0x130>)
    1638:	681b      	ldr	r3, [r3, #0]
    163a:	4a28      	ldr	r2, [pc, #160]	; (16dc <uart_open_channel+0x130>)
    163c:	6812      	ldr	r2, [r2, #0]
    163e:	6812      	ldr	r2, [r2, #0]
    1640:	f442 622a 	orr.w	r2, r2, #2720	; 0xaa0
    1644:	601a      	str	r2, [r3, #0]
		enable_interrupt(USART2_IRQ);
    1646:	2026      	movs	r0, #38	; 0x26
    1648:	f7ff fea6 	bl	1398 <enable_interrupt>
		break;
    164c:	e01f      	b.n	168e <uart_open_channel+0xe2>
	case USART3:
		RCC_APB1ENR|=1<<RCC_APB1ENR_USART3EN;
    164e:	4a22      	ldr	r2, [pc, #136]	; (16d8 <uart_open_channel+0x12c>)
    1650:	4b21      	ldr	r3, [pc, #132]	; (16d8 <uart_open_channel+0x12c>)
    1652:	681b      	ldr	r3, [r3, #0]
    1654:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    1658:	6013      	str	r3, [r2, #0]
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPBEN);
    165a:	4a1d      	ldr	r2, [pc, #116]	; (16d0 <uart_open_channel+0x124>)
    165c:	4b1c      	ldr	r3, [pc, #112]	; (16d0 <uart_open_channel+0x124>)
    165e:	681b      	ldr	r3, [r3, #0]
    1660:	f043 0308 	orr.w	r3, r3, #8
    1664:	6013      	str	r3, [r2, #0]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    1666:	4b1e      	ldr	r3, [pc, #120]	; (16e0 <uart_open_channel+0x134>)
    1668:	681b      	ldr	r3, [r3, #0]
    166a:	4a1d      	ldr	r2, [pc, #116]	; (16e0 <uart_open_channel+0x134>)
    166c:	6812      	ldr	r2, [r2, #0]
    166e:	6812      	ldr	r2, [r2, #0]
    1670:	f022 220f 	bic.w	r2, r2, #251662080	; 0xf000f00
    1674:	601a      	str	r2, [r3, #0]
		GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    1676:	4b1a      	ldr	r3, [pc, #104]	; (16e0 <uart_open_channel+0x134>)
    1678:	681b      	ldr	r3, [r3, #0]
    167a:	4a19      	ldr	r2, [pc, #100]	; (16e0 <uart_open_channel+0x134>)
    167c:	6812      	ldr	r2, [r2, #0]
    167e:	6812      	ldr	r2, [r2, #0]
    1680:	f042 220a 	orr.w	r2, r2, #167774720	; 0xa000a00
    1684:	601a      	str	r2, [r3, #0]
		enable_interrupt(USART3_IRQ);
    1686:	2027      	movs	r0, #39	; 0x27
    1688:	f7ff fe86 	bl	1398 <enable_interrupt>
		break;
    168c:	bf00      	nop
	}
	uart_set_baud(channel,baud);
    168e:	68f8      	ldr	r0, [r7, #12]
    1690:	68b9      	ldr	r1, [r7, #8]
    1692:	f7ff ff3f 	bl	1514 <uart_set_baud>
	if (flow_ctrl==FLOW_HARD){
    1696:	687b      	ldr	r3, [r7, #4]
    1698:	2b01      	cmp	r3, #1
    169a:	d106      	bne.n	16aa <uart_open_channel+0xfe>
		cr3=(sfrp_t)(channel+USART_CR3_OFS);
    169c:	68fb      	ldr	r3, [r7, #12]
    169e:	3314      	adds	r3, #20
    16a0:	617b      	str	r3, [r7, #20]
		*cr3=(1<<USART_CR3_CTSE)|(1<<USART_CR3_RTSE);
    16a2:	697b      	ldr	r3, [r7, #20]
    16a4:	f44f 7240 	mov.w	r2, #768	; 0x300
    16a8:	601a      	str	r2, [r3, #0]
	}
	cr1=(sfrp_t)(channel+USART_CR1_OFS);
    16aa:	68fb      	ldr	r3, [r7, #12]
    16ac:	330c      	adds	r3, #12
    16ae:	613b      	str	r3, [r7, #16]
	uart_getc(channel);
    16b0:	68f8      	ldr	r0, [r7, #12]
    16b2:	f000 f82d 	bl	1710 <uart_getc>
	*cr1=(1<<USART_CR1_UE)|(1<<USART_CR1_TE)|(1<<USART_CR1_RE)|(1<<USART_CR1_RXNEIE);
    16b6:	693b      	ldr	r3, [r7, #16]
    16b8:	f242 022c 	movw	r2, #8236	; 0x202c
    16bc:	601a      	str	r2, [r3, #0]
}
    16be:	3718      	adds	r7, #24
    16c0:	46bd      	mov	sp, r7
    16c2:	bd80      	pop	{r7, pc}
    16c4:	40004800 	.word	0x40004800
    16c8:	40013800 	.word	0x40013800
    16cc:	40004400 	.word	0x40004400
    16d0:	40021018 	.word	0x40021018
    16d4:	20000008 	.word	0x20000008
    16d8:	4002101c 	.word	0x4002101c
    16dc:	20000004 	.word	0x20000004
    16e0:	20000028 	.word	0x20000028

000016e4 <uart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int uart_stat(unsigned channel){
    16e4:	b480      	push	{r7}
    16e6:	b085      	sub	sp, #20
    16e8:	af00      	add	r7, sp, #0
    16ea:	6078      	str	r0, [r7, #4]
	sfrp_t sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    16ec:	687b      	ldr	r3, [r7, #4]
    16ee:	60fb      	str	r3, [r7, #12]
	return *sr&(1<<USART_SR_RXNE)?-1:0;
    16f0:	68fb      	ldr	r3, [r7, #12]
    16f2:	681b      	ldr	r3, [r3, #0]
    16f4:	f003 0320 	and.w	r3, r3, #32
    16f8:	2b00      	cmp	r3, #0
    16fa:	d002      	beq.n	1702 <uart_stat+0x1e>
    16fc:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1700:	e000      	b.n	1704 <uart_stat+0x20>
    1702:	2300      	movs	r3, #0
}
    1704:	4618      	mov	r0, r3
    1706:	3714      	adds	r7, #20
    1708:	46bd      	mov	sp, r7
    170a:	f85d 7b04 	ldr.w	r7, [sp], #4
    170e:	4770      	bx	lr

00001710 <uart_getc>:

// reçoit un caractère de la console
char uart_getc(unsigned channel){
    1710:	b480      	push	{r7}
    1712:	b085      	sub	sp, #20
    1714:	af00      	add	r7, sp, #0
    1716:	6078      	str	r0, [r7, #4]
	sfrp_t dr;
	
	dr=(sfrp_t)(channel+USART_DR_OFS);
    1718:	687b      	ldr	r3, [r7, #4]
    171a:	3304      	adds	r3, #4
    171c:	60fb      	str	r3, [r7, #12]
	return *dr&0x7f;
    171e:	68fb      	ldr	r3, [r7, #12]
    1720:	681b      	ldr	r3, [r3, #0]
    1722:	b2db      	uxtb	r3, r3
    1724:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    1728:	b2db      	uxtb	r3, r3
}
    172a:	4618      	mov	r0, r3
    172c:	3714      	adds	r7, #20
    172e:	46bd      	mov	sp, r7
    1730:	f85d 7b04 	ldr.w	r7, [sp], #4
    1734:	4770      	bx	lr
    1736:	bf00      	nop

00001738 <uart_putc>:

// transmet un caractère à la console
void uart_putc(unsigned channel, char c){
    1738:	b480      	push	{r7}
    173a:	b085      	sub	sp, #20
    173c:	af00      	add	r7, sp, #0
    173e:	6078      	str	r0, [r7, #4]
    1740:	460b      	mov	r3, r1
    1742:	70fb      	strb	r3, [r7, #3]
	sfrp_t dr, sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    1744:	687b      	ldr	r3, [r7, #4]
    1746:	60fb      	str	r3, [r7, #12]
	dr=(sfrp_t)(channel+USART_DR_OFS);
    1748:	687b      	ldr	r3, [r7, #4]
    174a:	3304      	adds	r3, #4
    174c:	60bb      	str	r3, [r7, #8]
	//attend que dr soit vide
	while (!(*sr&(1<<USART_SR_TXE)));
    174e:	bf00      	nop
    1750:	68fb      	ldr	r3, [r7, #12]
    1752:	681b      	ldr	r3, [r3, #0]
    1754:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1758:	2b00      	cmp	r3, #0
    175a:	d0f9      	beq.n	1750 <uart_putc+0x18>
	*dr=c&0x7f;
    175c:	78fb      	ldrb	r3, [r7, #3]
    175e:	f003 027f 	and.w	r2, r3, #127	; 0x7f
    1762:	68bb      	ldr	r3, [r7, #8]
    1764:	601a      	str	r2, [r3, #0]
}
    1766:	3714      	adds	r7, #20
    1768:	46bd      	mov	sp, r7
    176a:	f85d 7b04 	ldr.w	r7, [sp], #4
    176e:	4770      	bx	lr

Disassembly of section .user_code:

00001920 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used,optimize(0))) blink(){
    1920:	b480      	push	{r7}
    1922:	b085      	sub	sp, #20
    1924:	af00      	add	r7, sp, #0
	unsigned int  delay=500, tm;
    1926:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    192a:	60fb      	str	r3, [r7, #12]
	char c=0;
    192c:	2300      	movs	r3, #0
    192e:	71fb      	strb	r3, [r7, #7]
	
	
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    1930:	2300      	movs	r3, #0
    1932:	2200      	movs	r2, #0
    1934:	4618      	mov	r0, r3
    1936:	4611      	mov	r1, r2
    1938:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    193a:	f107 030c 	add.w	r3, r7, #12
    193e:	2200      	movs	r2, #0
    1940:	4618      	mov	r0, r3
    1942:	4611      	mov	r1, r2
    1944:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    1946:	f107 0308 	add.w	r3, r7, #8
    194a:	2200      	movs	r2, #0
    194c:	4618      	mov	r0, r3
    194e:	4611      	mov	r1, r2
    1950:	df04      	svc	4
    1952:	68bb      	ldr	r3, [r7, #8]
    1954:	2b00      	cmp	r3, #0
    1956:	d1f6      	bne.n	1946 <blink+0x26>
		_svc_call(SVC_LED_ON,NUL,NUL);
    1958:	2300      	movs	r3, #0
    195a:	2200      	movs	r2, #0
    195c:	4618      	mov	r0, r3
    195e:	4611      	mov	r1, r2
    1960:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    1962:	f107 030c 	add.w	r3, r7, #12
    1966:	2200      	movs	r2, #0
    1968:	4618      	mov	r0, r3
    196a:	4611      	mov	r1, r2
    196c:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    196e:	f107 0308 	add.w	r3, r7, #8
    1972:	2200      	movs	r2, #0
    1974:	4618      	mov	r0, r3
    1976:	4611      	mov	r1, r2
    1978:	df04      	svc	4
    197a:	68bb      	ldr	r3, [r7, #8]
    197c:	2b00      	cmp	r3, #0
    197e:	d1f6      	bne.n	196e <blink+0x4e>
		_svc_call(SVC_CONIN,&c,NUL);
    1980:	1dfb      	adds	r3, r7, #7
    1982:	2200      	movs	r2, #0
    1984:	4618      	mov	r0, r3
    1986:	4611      	mov	r1, r2
    1988:	df05      	svc	5
		if (c) break;
    198a:	79fb      	ldrb	r3, [r7, #7]
    198c:	2b00      	cmp	r3, #0
    198e:	d000      	beq.n	1992 <blink+0x72>
    1990:	e000      	b.n	1994 <blink+0x74>
	}
    1992:	e7cd      	b.n	1930 <blink+0x10>
}
    1994:	3714      	adds	r7, #20
    1996:	46bd      	mov	sp, r7
    1998:	f85d 7b04 	ldr.w	r7, [sp], #4
    199c:	4770      	bx	lr
    199e:	bf00      	nop
