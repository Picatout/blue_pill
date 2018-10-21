
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 6d 02 00 00 e5 01 00 00     .P. 1...m.......
      10:	71 02 00 00 75 02 00 00 79 02 00 00 69 15 00 00     q...u...y...i...
      20:	69 15 00 00 69 15 00 00 69 15 00 00 b9 05 00 00     i...i...i.......
      30:	69 15 00 00 69 15 00 00 81 02 00 00 25 07 00 00     i...i.......%...
      40:	89 02 00 00 8d 02 00 00 95 02 00 00 91 02 00 00     ................
      50:	99 02 00 00 9d 02 00 00 a1 02 00 00 a5 02 00 00     ................
      60:	a9 02 00 00 ad 02 00 00 b1 02 00 00 b5 02 00 00     ................
      70:	b9 02 00 00 69 15 00 00 69 15 00 00 69 15 00 00     ....i...i...i...
      80:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      90:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      a0:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      b0:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      c0:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      d0:	69 15 00 00 bd 02 00 00 cd 0e 00 00 c5 02 00 00     i...............
      e0:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
      f0:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
     100:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
     110:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...
     120:	69 15 00 00 69 15 00 00 69 15 00 00 69 15 00 00     i...i...i...i...

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
     136:	4b22      	ldr	r3, [pc, #136]	; (1c0 <startup+0x90>)
     138:	617b      	str	r3, [r7, #20]
    unsigned int * bss_end_p = &_BSS_END;
     13a:	4b22      	ldr	r3, [pc, #136]	; (1c4 <startup+0x94>)
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
     154:	4b1c      	ldr	r3, [pc, #112]	; (1c8 <startup+0x98>)
     156:	613b      	str	r3, [r7, #16]
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
     158:	4b1c      	ldr	r3, [pc, #112]	; (1cc <startup+0x9c>)
     15a:	60fb      	str	r3, [r7, #12]
    unsigned int * data_ram_end_p = &_DATA_RAM_END;
     15c:	4b1c      	ldr	r3, [pc, #112]	; (1d0 <startup+0xa0>)
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
     17e:	4b15      	ldr	r3, [pc, #84]	; (1d4 <startup+0xa4>)
     180:	f043 0301 	orr.w	r3, r3, #1
     184:	4a14      	ldr	r2, [pc, #80]	; (1d8 <startup+0xa8>)
     186:	6013      	str	r3, [r2, #0]
	// active les interruptions et les fault handler
	//SCB_CCR->fld_ccr.unalign_trp=1;
	//SCB_CCR->fld_ccr.div_0_trp=1;
	SCB_CCR->ccr|=1|(1<<3)|(1<<4);
     188:	4b14      	ldr	r3, [pc, #80]	; (1dc <startup+0xac>)
     18a:	681b      	ldr	r3, [r3, #0]
     18c:	4a13      	ldr	r2, [pc, #76]	; (1dc <startup+0xac>)
     18e:	6812      	ldr	r2, [r2, #0]
     190:	6812      	ldr	r2, [r2, #0]
     192:	f042 0219 	orr.w	r2, r2, #25
     196:	601a      	str	r2, [r3, #0]
    __enable_irq();
     198:	b662      	cpsie	i
    __enable_fault_irq();
     19a:	b661      	cpsie	f
    // initialisaton de la pile PSP et commutation 
    // vers cette pile.
    asm volatile(
     19c:	4b10      	ldr	r3, [pc, #64]	; (1e0 <startup+0xb0>)
     19e:	4618      	mov	r0, r3
     1a0:	f380 8809 	msr	PSP, r0
     1a4:	f3ef 8014 	mrs	r0, CONTROL
     1a8:	f040 0002 	orr.w	r0, r0, #2
     1ac:	f380 8814 	msr	CONTROL, r0
     1b0:	f3bf 8f6f 	isb	sy
    "msr CONTROL,r0\n"
    "isb\n"
    :: [psp_top] "r" (PSP_TOP)
    );
    /* Now we are ready to start the main function */
    main();
     1b4:	f000 fe44 	bl	e40 <main>
}
     1b8:	3718      	adds	r7, #24
     1ba:	46bd      	mov	sp, r7
     1bc:	bd80      	pop	{r7, pc}
     1be:	bf00      	nop
     1c0:	2000008c 	.word	0x2000008c
     1c4:	20000164 	.word	0x20000164
     1c8:	00001a80 	.word	0x00001a80
     1cc:	20000000 	.word	0x20000000
     1d0:	2000008c 	.word	0x2000008c
     1d4:	20000180 	.word	0x20000180
     1d8:	20000160 	.word	0x20000160
     1dc:	2000001c 	.word	0x2000001c
     1e0:	20004c00 	.word	0x20004c00

000001e4 <HARD_FAULT_handler>:
	print_hex(SCB_CFSR->fsr.mmFault);
	while(1);
}


_exception(HARD_FAULT_handler){
     1e4:	4668      	mov	r0, sp
     1e6:	f020 0107 	bic.w	r1, r0, #7
     1ea:	468d      	mov	sp, r1
     1ec:	b581      	push	{r0, r7, lr}
     1ee:	b083      	sub	sp, #12
     1f0:	af00      	add	r7, sp, #0
		uint32_t adr;
		asm volatile (
     1f2:	f3ef 8009 	mrs	r0, PSP
     1f6:	6983      	ldr	r3, [r0, #24]
     1f8:	607b      	str	r3, [r7, #4]
	"mrs r0,PSP\n" // optient la valeur de PSP
	"ldr %[adr],[r0,#24]\n" // obtient le PC
    : [adr] "=r" (adr)
    :
    :"r0");
	if ((SCB_CFSR->fsr.mmFault)&0x7f){
     1fa:	4b17      	ldr	r3, [pc, #92]	; (258 <HARD_FAULT_handler+0x74>)
     1fc:	681b      	ldr	r3, [r3, #0]
     1fe:	681b      	ldr	r3, [r3, #0]
     200:	b2db      	uxtb	r3, r3
     202:	f003 037f 	and.w	r3, r3, #127	; 0x7f
     206:	2b00      	cmp	r3, #0
     208:	d004      	beq.n	214 <HARD_FAULT_handler+0x30>
		print_fault("memory manager fault ",adr);
     20a:	4814      	ldr	r0, [pc, #80]	; (25c <HARD_FAULT_handler+0x78>)
     20c:	6879      	ldr	r1, [r7, #4]
     20e:	f001 f9b3 	bl	1578 <print_fault>
     212:	e01b      	b.n	24c <HARD_FAULT_handler+0x68>
	}else if ((SCB_CFSR->fsr.busFault)&0xff){
     214:	4b10      	ldr	r3, [pc, #64]	; (258 <HARD_FAULT_handler+0x74>)
     216:	681b      	ldr	r3, [r3, #0]
     218:	681b      	ldr	r3, [r3, #0]
     21a:	0a1b      	lsrs	r3, r3, #8
     21c:	b2db      	uxtb	r3, r3
     21e:	2b00      	cmp	r3, #0
     220:	d004      	beq.n	22c <HARD_FAULT_handler+0x48>
		print_fault("bus fault ",adr);
     222:	480f      	ldr	r0, [pc, #60]	; (260 <HARD_FAULT_handler+0x7c>)
     224:	6879      	ldr	r1, [r7, #4]
     226:	f001 f9a7 	bl	1578 <print_fault>
     22a:	e00f      	b.n	24c <HARD_FAULT_handler+0x68>
	}else if ((SCB_CFSR->fsr.usageFalt)&0xffff){
     22c:	4b0a      	ldr	r3, [pc, #40]	; (258 <HARD_FAULT_handler+0x74>)
     22e:	681b      	ldr	r3, [r3, #0]
     230:	681b      	ldr	r3, [r3, #0]
     232:	0c1b      	lsrs	r3, r3, #16
     234:	b29b      	uxth	r3, r3
     236:	2b00      	cmp	r3, #0
     238:	d004      	beq.n	244 <HARD_FAULT_handler+0x60>
		print_fault("usage fault ",adr);
     23a:	480a      	ldr	r0, [pc, #40]	; (264 <HARD_FAULT_handler+0x80>)
     23c:	6879      	ldr	r1, [r7, #4]
     23e:	f001 f99b 	bl	1578 <print_fault>
     242:	e003      	b.n	24c <HARD_FAULT_handler+0x68>
	}else{
		print_fault("hard fault  ",adr);
     244:	4808      	ldr	r0, [pc, #32]	; (268 <HARD_FAULT_handler+0x84>)
     246:	6879      	ldr	r1, [r7, #4]
     248:	f001 f996 	bl	1578 <print_fault>
	}
}
     24c:	370c      	adds	r7, #12
     24e:	46bd      	mov	sp, r7
     250:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     254:	4685      	mov	sp, r0
     256:	4770      	bx	lr
     258:	20000018 	.word	0x20000018
     25c:	000019ac 	.word	0x000019ac
     260:	000019c4 	.word	0x000019c4
     264:	000019d0 	.word	0x000019d0
     268:	000019e0 	.word	0x000019e0

0000026c <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     26c:	f001 f97c 	bl	1568 <reset_mcu>

00000270 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     270:	f001 f97a 	bl	1568 <reset_mcu>

00000274 <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     274:	f001 f978 	bl	1568 <reset_mcu>

00000278 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     278:	f001 f976 	bl	1568 <reset_mcu>
_default_handler(SVC_handler) // 11
     27c:	f001 f974 	bl	1568 <reset_mcu>

00000280 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     280:	f001 f972 	bl	1568 <reset_mcu>
_default_handler(STK_handler) // 15
     284:	f001 f970 	bl	1568 <reset_mcu>

00000288 <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     288:	f001 f96e 	bl	1568 <reset_mcu>

0000028c <PVD_handler>:
_default_handler(PVD_handler) // 1
     28c:	f001 f96c 	bl	1568 <reset_mcu>

00000290 <RTC_handler>:
_default_handler(RTC_handler) // 2
     290:	f001 f96a 	bl	1568 <reset_mcu>

00000294 <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     294:	f001 f968 	bl	1568 <reset_mcu>

00000298 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     298:	f001 f966 	bl	1568 <reset_mcu>

0000029c <RCC_handler>:
_default_handler(RCC_handler) // 5
     29c:	f001 f964 	bl	1568 <reset_mcu>

000002a0 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     2a0:	f001 f962 	bl	1568 <reset_mcu>

000002a4 <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     2a4:	f001 f960 	bl	1568 <reset_mcu>

000002a8 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2a8:	f001 f95e 	bl	1568 <reset_mcu>

000002ac <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2ac:	f001 f95c 	bl	1568 <reset_mcu>

000002b0 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2b0:	f001 f95a 	bl	1568 <reset_mcu>

000002b4 <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2b4:	f001 f958 	bl	1568 <reset_mcu>

000002b8 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2b8:	f001 f956 	bl	1568 <reset_mcu>

000002bc <USART1_handler>:

_default_handler(USART1_handler) // 37
     2bc:	f001 f954 	bl	1568 <reset_mcu>
_default_handler(USART2_handler) // 38
     2c0:	f001 f952 	bl	1568 <reset_mcu>

000002c4 <USART3_handler>:
_default_handler(USART3_handler) // 39
     2c4:	f001 f950 	bl	1568 <reset_mcu>

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

inline void led_on(){
     4b0:	b480      	push	{r7}
     4b2:	af00      	add	r7, sp, #0
	GPIOC_BRR->brr=GRN_LED;
     4b4:	4b04      	ldr	r3, [pc, #16]	; (4c8 <led_on+0x18>)
     4b6:	681b      	ldr	r3, [r3, #0]
     4b8:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4bc:	601a      	str	r2, [r3, #0]
}
     4be:	46bd      	mov	sp, r7
     4c0:	f85d 7b04 	ldr.w	r7, [sp], #4
     4c4:	4770      	bx	lr
     4c6:	bf00      	nop
     4c8:	20000078 	.word	0x20000078

000004cc <led_off>:

inline void led_off(){
     4cc:	b480      	push	{r7}
     4ce:	af00      	add	r7, sp, #0
	GPIOC_BSRR->bsrr=GRN_LED;
     4d0:	4b04      	ldr	r3, [pc, #16]	; (4e4 <led_off+0x18>)
     4d2:	681b      	ldr	r3, [r3, #0]
     4d4:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     4d8:	601a      	str	r2, [r3, #0]
}
     4da:	46bd      	mov	sp, r7
     4dc:	f85d 7b04 	ldr.w	r7, [sp], #4
     4e0:	4770      	bx	lr
     4e2:	bf00      	nop
     4e4:	20000074 	.word	0x20000074

000004e8 <set_timer>:

inline void set_timer(unsigned time){
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
     500:	20000090 	.word	0x20000090

00000504 <get_timer>:


inline unsigned get_timer(){
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
     518:	20000090 	.word	0x20000090

0000051c <peek8>:


inline uint8_t peek8(uint8_t *adr){
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

inline uint16_t peek16(uint16_t *adr){
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

inline uint32_t peek32(uint32_t *adr){
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

inline void poke8(uint8_t *adr, uint8_t value){
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

inline void poke16(uint16_t *adr, uint16_t value){
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

inline void poke32(uint32_t *adr, uint32_t value){
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
     5dc:	2b10      	cmp	r3, #16
     5de:	f200 809b 	bhi.w	718 <SVC_handler+0x160>
     5e2:	a201      	add	r2, pc, #4	; (adr r2, 5e8 <SVC_handler+0x30>)
     5e4:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     5e8:	00000713 	.word	0x00000713
     5ec:	0000062d 	.word	0x0000062d
     5f0:	00000633 	.word	0x00000633
     5f4:	00000639 	.word	0x00000639
     5f8:	00000645 	.word	0x00000645
     5fc:	00000651 	.word	0x00000651
     600:	0000065f 	.word	0x0000065f
     604:	0000066b 	.word	0x0000066b
     608:	0000067f 	.word	0x0000067f
     60c:	00000687 	.word	0x00000687
     610:	00000693 	.word	0x00000693
     614:	0000069d 	.word	0x0000069d
     618:	000006b1 	.word	0x000006b1
     61c:	000006c5 	.word	0x000006c5
     620:	000006d7 	.word	0x000006d7
     624:	000006eb 	.word	0x000006eb
     628:	000006ff 	.word	0x000006ff
	case SVC_LED_ON: 
		led_on();
     62c:	f7ff ff40 	bl	4b0 <led_on>
		break;
     630:	e072      	b.n	718 <SVC_handler+0x160>
	case SVC_LED_OFF:
		led_off();
     632:	f7ff ff4b 	bl	4cc <led_off>
		break;
     636:	e06f      	b.n	718 <SVC_handler+0x160>
	case SVC_TIMER:
		set_timer(*(unsigned*)arg1);
     638:	68bb      	ldr	r3, [r7, #8]
     63a:	681b      	ldr	r3, [r3, #0]
     63c:	4618      	mov	r0, r3
     63e:	f7ff ff53 	bl	4e8 <set_timer>
		break;
     642:	e069      	b.n	718 <SVC_handler+0x160>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=get_timer();
     644:	f7ff ff5e 	bl	504 <get_timer>
     648:	4602      	mov	r2, r0
     64a:	68bb      	ldr	r3, [r7, #8]
     64c:	601a      	str	r2, [r3, #0]
		break;
     64e:	e063      	b.n	718 <SVC_handler+0x160>
	case SVC_CONIN:
		*(char *)arg1=conin();
     650:	f000 fc76 	bl	f40 <conin>
     654:	4603      	mov	r3, r0
     656:	461a      	mov	r2, r3
     658:	68bb      	ldr	r3, [r7, #8]
     65a:	701a      	strb	r2, [r3, #0]
		break;
     65c:	e05c      	b.n	718 <SVC_handler+0x160>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     65e:	68bb      	ldr	r3, [r7, #8]
     660:	781b      	ldrb	r3, [r3, #0]
     662:	4618      	mov	r0, r3
     664:	f000 fc5c 	bl	f20 <conout>
		break;
     668:	e056      	b.n	718 <SVC_handler+0x160>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     66a:	68bb      	ldr	r3, [r7, #8]
     66c:	681b      	ldr	r3, [r3, #0]
     66e:	6878      	ldr	r0, [r7, #4]
     670:	4619      	mov	r1, r3
     672:	f000 fcdd 	bl	1030 <read_line>
     676:	4602      	mov	r2, r0
     678:	68bb      	ldr	r3, [r7, #8]
     67a:	601a      	str	r2, [r3, #0]
		break;
     67c:	e04c      	b.n	718 <SVC_handler+0x160>
	case SVC_PRINT:
		print((const char*)arg1);
     67e:	68b8      	ldr	r0, [r7, #8]
     680:	f000 fc80 	bl	f84 <print>
		break;
     684:	e048      	b.n	718 <SVC_handler+0x160>
	case SVC_PRINT_INT:
		print_int((int32_t)arg1,10);
     686:	68bb      	ldr	r3, [r7, #8]
     688:	4618      	mov	r0, r3
     68a:	210a      	movs	r1, #10
     68c:	f000 fd7a 	bl	1184 <print_int>
		break;
     690:	e042      	b.n	718 <SVC_handler+0x160>
	case SVC_PRINT_HEX:
		print_hex((uint32_t)arg1);
     692:	68bb      	ldr	r3, [r7, #8]
     694:	4618      	mov	r0, r3
     696:	f000 fde3 	bl	1260 <print_hex>
		break;
     69a:	e03d      	b.n	718 <SVC_handler+0x160>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     69c:	68bb      	ldr	r3, [r7, #8]
     69e:	681b      	ldr	r3, [r3, #0]
     6a0:	4618      	mov	r0, r3
     6a2:	f7ff ff3b 	bl	51c <peek8>
     6a6:	4603      	mov	r3, r0
     6a8:	461a      	mov	r2, r3
     6aa:	68bb      	ldr	r3, [r7, #8]
     6ac:	701a      	strb	r2, [r3, #0]
		break;
     6ae:	e033      	b.n	718 <SVC_handler+0x160>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     6b0:	68bb      	ldr	r3, [r7, #8]
     6b2:	681b      	ldr	r3, [r3, #0]
     6b4:	4618      	mov	r0, r3
     6b6:	f7ff ff3d 	bl	534 <peek16>
     6ba:	4603      	mov	r3, r0
     6bc:	461a      	mov	r2, r3
     6be:	68bb      	ldr	r3, [r7, #8]
     6c0:	801a      	strh	r2, [r3, #0]
		break;
     6c2:	e029      	b.n	718 <SVC_handler+0x160>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     6c4:	68bb      	ldr	r3, [r7, #8]
     6c6:	681b      	ldr	r3, [r3, #0]
     6c8:	4618      	mov	r0, r3
     6ca:	f7ff ff3f 	bl	54c <peek32>
     6ce:	4602      	mov	r2, r0
     6d0:	68bb      	ldr	r3, [r7, #8]
     6d2:	601a      	str	r2, [r3, #0]
		break;
     6d4:	e020      	b.n	718 <SVC_handler+0x160>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
     6d6:	68bb      	ldr	r3, [r7, #8]
     6d8:	681b      	ldr	r3, [r3, #0]
     6da:	461a      	mov	r2, r3
     6dc:	687b      	ldr	r3, [r7, #4]
     6de:	781b      	ldrb	r3, [r3, #0]
     6e0:	4610      	mov	r0, r2
     6e2:	4619      	mov	r1, r3
     6e4:	f7ff ff3e 	bl	564 <poke8>
		break;
     6e8:	e016      	b.n	718 <SVC_handler+0x160>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
     6ea:	68bb      	ldr	r3, [r7, #8]
     6ec:	681b      	ldr	r3, [r3, #0]
     6ee:	461a      	mov	r2, r3
     6f0:	687b      	ldr	r3, [r7, #4]
     6f2:	881b      	ldrh	r3, [r3, #0]
     6f4:	4610      	mov	r0, r2
     6f6:	4619      	mov	r1, r3
     6f8:	f7ff ff42 	bl	580 <poke16>
		break;
     6fc:	e00c      	b.n	718 <SVC_handler+0x160>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
     6fe:	68bb      	ldr	r3, [r7, #8]
     700:	681b      	ldr	r3, [r3, #0]
     702:	461a      	mov	r2, r3
     704:	687b      	ldr	r3, [r7, #4]
     706:	681b      	ldr	r3, [r3, #0]
     708:	4610      	mov	r0, r2
     70a:	4619      	mov	r1, r3
     70c:	f7ff ff46 	bl	59c <poke32>
		break;
     710:	e002      	b.n	718 <SVC_handler+0x160>
		"msr CONTROL, r0\n"
		);
		break;
*/ 
    case SVC_RESET:
	    reset_mcu();
     712:	f000 ff29 	bl	1568 <reset_mcu>
	    break;
     716:	bf00      	nop
	}	
}
     718:	3710      	adds	r7, #16
     71a:	46bd      	mov	sp, r7
     71c:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     720:	4685      	mov	sp, r0
     722:	4770      	bx	lr

00000724 <STK_handler>:

// interruption coretimer
void __attribute__((naked)) STK_handler(){
	ticks++;
     724:	4b06      	ldr	r3, [pc, #24]	; (740 <STK_handler+0x1c>)
     726:	681b      	ldr	r3, [r3, #0]
     728:	3301      	adds	r3, #1
     72a:	4a05      	ldr	r2, [pc, #20]	; (740 <STK_handler+0x1c>)
     72c:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
     72e:	4b05      	ldr	r3, [pc, #20]	; (744 <STK_handler+0x20>)
     730:	681b      	ldr	r3, [r3, #0]
     732:	2b00      	cmp	r3, #0
     734:	d004      	beq.n	740 <STK_handler+0x1c>
     736:	4b03      	ldr	r3, [pc, #12]	; (744 <STK_handler+0x20>)
     738:	681b      	ldr	r3, [r3, #0]
     73a:	3b01      	subs	r3, #1
     73c:	4a01      	ldr	r2, [pc, #4]	; (744 <STK_handler+0x20>)
     73e:	6013      	str	r3, [r2, #0]
     740:	2000008c 	.word	0x2000008c
     744:	20000090 	.word	0x20000090

00000748 <set_sysclock>:
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     748:	b480      	push	{r7}
     74a:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC_CR|=1<<RCC_CR_HSEON;
     74c:	4a1a      	ldr	r2, [pc, #104]	; (7b8 <set_sysclock+0x70>)
     74e:	4b1a      	ldr	r3, [pc, #104]	; (7b8 <set_sysclock+0x70>)
     750:	681b      	ldr	r3, [r3, #0]
     752:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     756:	6013      	str	r3, [r2, #0]
	 // attend que l'oscillateur soit prêt
   while (! (RCC_CR & (1<<RCC_CR_HSERDY)));
     758:	bf00      	nop
     75a:	4b17      	ldr	r3, [pc, #92]	; (7b8 <set_sysclock+0x70>)
     75c:	681b      	ldr	r3, [r3, #0]
     75e:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
     762:	2b00      	cmp	r3, #0
     764:	d0f9      	beq.n	75a <set_sysclock+0x12>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
     766:	4a15      	ldr	r2, [pc, #84]	; (7bc <set_sysclock+0x74>)
     768:	4b14      	ldr	r3, [pc, #80]	; (7bc <set_sysclock+0x74>)
     76a:	681b      	ldr	r3, [r3, #0]
     76c:	f443 13e8 	orr.w	r3, r3, #1900544	; 0x1d0000
     770:	6013      	str	r3, [r2, #0]
    // active le PLL
    RCC_CR|=1<<RCC_CR_PLLON;
     772:	4a11      	ldr	r2, [pc, #68]	; (7b8 <set_sysclock+0x70>)
     774:	4b10      	ldr	r3, [pc, #64]	; (7b8 <set_sysclock+0x70>)
     776:	681b      	ldr	r3, [r3, #0]
     778:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
     77c:	6013      	str	r3, [r2, #0]
    // Attend que le PLL soit prêt
    while (! (RCC_CR & (1<<RCC_CR_PLLRDY)));
     77e:	bf00      	nop
     780:	4b0d      	ldr	r3, [pc, #52]	; (7b8 <set_sysclock+0x70>)
     782:	681b      	ldr	r3, [r3, #0]
     784:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
     788:	2b00      	cmp	r3, #0
     78a:	d0f9      	beq.n	780 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR|=WAIT_2_CY;
     78c:	4a0c      	ldr	r2, [pc, #48]	; (7c0 <set_sysclock+0x78>)
     78e:	4b0c      	ldr	r3, [pc, #48]	; (7c0 <set_sysclock+0x78>)
     790:	681b      	ldr	r3, [r3, #0]
     792:	f043 0302 	orr.w	r3, r3, #2
     796:	6013      	str	r3, [r2, #0]
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR|=PLL_CLK<<RCC_CFGR_SW;
     798:	4a08      	ldr	r2, [pc, #32]	; (7bc <set_sysclock+0x74>)
     79a:	4b08      	ldr	r3, [pc, #32]	; (7bc <set_sysclock+0x74>)
     79c:	681b      	ldr	r3, [r3, #0]
     79e:	f043 0302 	orr.w	r3, r3, #2
     7a2:	6013      	str	r3, [r2, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR|=PPRECLK_DIV2<<RCC_CFGR_PPRE1;
     7a4:	4a05      	ldr	r2, [pc, #20]	; (7bc <set_sysclock+0x74>)
     7a6:	4b05      	ldr	r3, [pc, #20]	; (7bc <set_sysclock+0x74>)
     7a8:	681b      	ldr	r3, [r3, #0]
     7aa:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     7ae:	6013      	str	r3, [r2, #0]
}
     7b0:	46bd      	mov	sp, r7
     7b2:	f85d 7b04 	ldr.w	r7, [sp], #4
     7b6:	4770      	bx	lr
     7b8:	40021000 	.word	0x40021000
     7bc:	40021004 	.word	0x40021004
     7c0:	40022000 	.word	0x40022000

000007c4 <config_systicks>:

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
     7c4:	b480      	push	{r7}
     7c6:	af00      	add	r7, sp, #0
	STK_LOAD=MSEC_DLY-1;
     7c8:	4b05      	ldr	r3, [pc, #20]	; (7e0 <config_systicks+0x1c>)
     7ca:	f242 3227 	movw	r2, #8999	; 0x2327
     7ce:	601a      	str	r2, [r3, #0]
	STK_CTRL=(1<<STK_TICKINT)|(1<<STK_ENABLE);
     7d0:	4b04      	ldr	r3, [pc, #16]	; (7e4 <config_systicks+0x20>)
     7d2:	2203      	movs	r2, #3
     7d4:	601a      	str	r2, [r3, #0]
}
     7d6:	46bd      	mov	sp, r7
     7d8:	f85d 7b04 	ldr.w	r7, [sp], #4
     7dc:	4770      	bx	lr
     7de:	bf00      	nop
     7e0:	e000e014 	.word	0xe000e014
     7e4:	e000e010 	.word	0xe000e010

000007e8 <port_c_setup>:

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
     7e8:	b480      	push	{r7}
     7ea:	af00      	add	r7, sp, #0
	RCC_APB2ENR|=1<<GPIOC_EN;
     7ec:	4a06      	ldr	r2, [pc, #24]	; (808 <port_c_setup+0x20>)
     7ee:	4b06      	ldr	r3, [pc, #24]	; (808 <port_c_setup+0x20>)
     7f0:	681b      	ldr	r3, [r3, #0]
     7f2:	f043 0310 	orr.w	r3, r3, #16
     7f6:	6013      	str	r3, [r2, #0]
	GPIOC_CRH->cr=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
     7f8:	4b04      	ldr	r3, [pc, #16]	; (80c <port_c_setup+0x24>)
     7fa:	681b      	ldr	r3, [r3, #0]
     7fc:	4a04      	ldr	r2, [pc, #16]	; (810 <port_c_setup+0x28>)
     7fe:	601a      	str	r2, [r3, #0]
}
     800:	46bd      	mov	sp, r7
     802:	f85d 7b04 	ldr.w	r7, [sp], #4
     806:	4770      	bx	lr
     808:	40021018 	.word	0x40021018
     80c:	20000064 	.word	0x20000064
     810:	44644444 	.word	0x44644444

00000814 <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     814:	b480      	push	{r7}
     816:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     818:	2300      	movs	r3, #0
     81a:	2200      	movs	r2, #0
     81c:	4618      	mov	r0, r3
     81e:	4611      	mov	r1, r2
     820:	df00      	svc	0
}
     822:	46bd      	mov	sp, r7
     824:	f85d 7b04 	ldr.w	r7, [sp], #4
     828:	4770      	bx	lr
     82a:	bf00      	nop

0000082c <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     82c:	b480      	push	{r7}
     82e:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     830:	2300      	movs	r3, #0
     832:	2200      	movs	r2, #0
     834:	4618      	mov	r0, r3
     836:	4611      	mov	r1, r2
     838:	df01      	svc	1
}
     83a:	46bd      	mov	sp, r7
     83c:	f85d 7b04 	ldr.w	r7, [sp], #4
     840:	4770      	bx	lr
     842:	bf00      	nop

00000844 <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     844:	b480      	push	{r7}
     846:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     848:	2300      	movs	r3, #0
     84a:	2200      	movs	r2, #0
     84c:	4618      	mov	r0, r3
     84e:	4611      	mov	r1, r2
     850:	df02      	svc	2
}
     852:	46bd      	mov	sp, r7
     854:	f85d 7b04 	ldr.w	r7, [sp], #4
     858:	4770      	bx	lr
     85a:	bf00      	nop

0000085c <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     85c:	b580      	push	{r7, lr}
     85e:	b082      	sub	sp, #8
     860:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     862:	f000 fa57 	bl	d14 <word>
	n=atoi((const char*)pad);
     866:	4806      	ldr	r0, [pc, #24]	; (880 <cmd_set_timer+0x24>)
     868:	f7ff fdac 	bl	3c4 <atoi>
     86c:	4603      	mov	r3, r0
     86e:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     870:	1d3b      	adds	r3, r7, #4
     872:	2200      	movs	r2, #0
     874:	4618      	mov	r0, r3
     876:	4611      	mov	r1, r2
     878:	df03      	svc	3
}
     87a:	3708      	adds	r7, #8
     87c:	46bd      	mov	sp, r7
     87e:	bd80      	pop	{r7, pc}
     880:	200000e4 	.word	0x200000e4

00000884 <cmd_get_timer>:

static void cmd_get_timer(){
     884:	b480      	push	{r7}
     886:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     888:	4b04      	ldr	r3, [pc, #16]	; (89c <cmd_get_timer+0x18>)
     88a:	2200      	movs	r2, #0
     88c:	4618      	mov	r0, r3
     88e:	4611      	mov	r1, r2
     890:	df04      	svc	4
}
     892:	46bd      	mov	sp, r7
     894:	f85d 7b04 	ldr.w	r7, [sp], #4
     898:	4770      	bx	lr
     89a:	bf00      	nop
     89c:	200000e4 	.word	0x200000e4

000008a0 <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     8a0:	b480      	push	{r7}
     8a2:	b083      	sub	sp, #12
     8a4:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	_pause(tm);
     8a6:	1d3b      	adds	r3, r7, #4
     8a8:	2200      	movs	r2, #0
     8aa:	4618      	mov	r0, r3
     8ac:	4611      	mov	r1, r2
     8ae:	df04      	svc	4
     8b0:	687b      	ldr	r3, [r7, #4]
     8b2:	2b00      	cmp	r3, #0
     8b4:	d1f7      	bne.n	8a6 <cmd_pause+0x6>
}
     8b6:	370c      	adds	r7, #12
     8b8:	46bd      	mov	sp, r7
     8ba:	f85d 7b04 	ldr.w	r7, [sp], #4
     8be:	4770      	bx	lr

000008c0 <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     8c0:	b480      	push	{r7}
     8c2:	b083      	sub	sp, #12
     8c4:	af00      	add	r7, sp, #0
	volatile char n=0;
     8c6:	2300      	movs	r3, #0
     8c8:	71fb      	strb	r3, [r7, #7]
	while (!n){
     8ca:	e004      	b.n	8d6 <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     8cc:	1dfb      	adds	r3, r7, #7
     8ce:	2200      	movs	r2, #0
     8d0:	4618      	mov	r0, r3
     8d2:	4611      	mov	r1, r2
     8d4:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     8d6:	79fb      	ldrb	r3, [r7, #7]
     8d8:	b2db      	uxtb	r3, r3
     8da:	2b00      	cmp	r3, #0
     8dc:	d0f6      	beq.n	8cc <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     8de:	79fb      	ldrb	r3, [r7, #7]
     8e0:	b2da      	uxtb	r2, r3
     8e2:	4b05      	ldr	r3, [pc, #20]	; (8f8 <cmd_getc+0x38>)
     8e4:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     8e6:	4b04      	ldr	r3, [pc, #16]	; (8f8 <cmd_getc+0x38>)
     8e8:	2200      	movs	r2, #0
     8ea:	705a      	strb	r2, [r3, #1]
}
     8ec:	370c      	adds	r7, #12
     8ee:	46bd      	mov	sp, r7
     8f0:	f85d 7b04 	ldr.w	r7, [sp], #4
     8f4:	4770      	bx	lr
     8f6:	bf00      	nop
     8f8:	200000e4 	.word	0x200000e4

000008fc <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     8fc:	b580      	push	{r7, lr}
     8fe:	b082      	sub	sp, #8
     900:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     902:	f000 fa07 	bl	d14 <word>
	cmd_id=search_command((const char*)pad);
     906:	480a      	ldr	r0, [pc, #40]	; (930 <cmd_putc+0x34>)
     908:	f000 f8ee 	bl	ae8 <search_command>
     90c:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     90e:	687b      	ldr	r3, [r7, #4]
     910:	2b00      	cmp	r3, #0
     912:	db05      	blt.n	920 <cmd_putc+0x24>
     914:	4a07      	ldr	r2, [pc, #28]	; (934 <cmd_putc+0x38>)
     916:	687b      	ldr	r3, [r7, #4]
     918:	00db      	lsls	r3, r3, #3
     91a:	4413      	add	r3, r2
     91c:	685b      	ldr	r3, [r3, #4]
     91e:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     920:	4b03      	ldr	r3, [pc, #12]	; (930 <cmd_putc+0x34>)
     922:	2200      	movs	r2, #0
     924:	4618      	mov	r0, r3
     926:	4611      	mov	r1, r2
     928:	df06      	svc	6
}
     92a:	3708      	adds	r7, #8
     92c:	46bd      	mov	sp, r7
     92e:	bd80      	pop	{r7, pc}
     930:	200000e4 	.word	0x200000e4
     934:	000018e0 	.word	0x000018e0

00000938 <cmd_readln>:

static void cmd_readln(){
     938:	b580      	push	{r7, lr}
     93a:	b082      	sub	sp, #8
     93c:	af00      	add	r7, sp, #0
	unsigned llen=80;
     93e:	2350      	movs	r3, #80	; 0x50
     940:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     942:	1d3b      	adds	r3, r7, #4
     944:	4a04      	ldr	r2, [pc, #16]	; (958 <cmd_readln+0x20>)
     946:	4618      	mov	r0, r3
     948:	4611      	mov	r1, r2
     94a:	df07      	svc	7
	print((const char*)pad);
     94c:	4802      	ldr	r0, [pc, #8]	; (958 <cmd_readln+0x20>)
     94e:	f000 fb19 	bl	f84 <print>
}
     952:	3708      	adds	r7, #8
     954:	46bd      	mov	sp, r7
     956:	bd80      	pop	{r7, pc}
     958:	200000e4 	.word	0x200000e4

0000095c <cmd_print>:

static void cmd_print(){
     95c:	b580      	push	{r7, lr}
     95e:	af00      	add	r7, sp, #0
	word();
     960:	f000 f9d8 	bl	d14 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     964:	4b02      	ldr	r3, [pc, #8]	; (970 <cmd_print+0x14>)
     966:	2200      	movs	r2, #0
     968:	4618      	mov	r0, r3
     96a:	4611      	mov	r1, r2
     96c:	df08      	svc	8
}
     96e:	bd80      	pop	{r7, pc}
     970:	200000e4 	.word	0x200000e4

00000974 <cmd_run>:


static void cmd_run(){
     974:	b580      	push	{r7, lr}
     976:	af00      	add	r7, sp, #0
	((fn)proga)();
     978:	4b01      	ldr	r3, [pc, #4]	; (980 <cmd_run+0xc>)
     97a:	681b      	ldr	r3, [r3, #0]
     97c:	4798      	blx	r3
	
}
     97e:	bd80      	pop	{r7, pc}
     980:	20000160 	.word	0x20000160

00000984 <cmd_peek8>:

static void cmd_peek8(){
     984:	b580      	push	{r7, lr}
     986:	b082      	sub	sp, #8
     988:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     98a:	f000 f9c3 	bl	d14 <word>
	u=atoi((const char*)pad);
     98e:	4808      	ldr	r0, [pc, #32]	; (9b0 <cmd_peek8+0x2c>)
     990:	f7ff fd18 	bl	3c4 <atoi>
     994:	4603      	mov	r3, r0
     996:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     998:	1d3b      	adds	r3, r7, #4
     99a:	2200      	movs	r2, #0
     99c:	4618      	mov	r0, r3
     99e:	4611      	mov	r1, r2
     9a0:	df0b      	svc	11
	pad[0]=(unsigned char)u;
     9a2:	687b      	ldr	r3, [r7, #4]
     9a4:	b2da      	uxtb	r2, r3
     9a6:	4b02      	ldr	r3, [pc, #8]	; (9b0 <cmd_peek8+0x2c>)
     9a8:	701a      	strb	r2, [r3, #0]
}
     9aa:	3708      	adds	r7, #8
     9ac:	46bd      	mov	sp, r7
     9ae:	bd80      	pop	{r7, pc}
     9b0:	200000e4 	.word	0x200000e4

000009b4 <cmd_peek16>:

static void cmd_peek16(){
     9b4:	b580      	push	{r7, lr}
     9b6:	b082      	sub	sp, #8
     9b8:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9ba:	f000 f9ab 	bl	d14 <word>
	u=atoi((const char*)pad);
     9be:	480b      	ldr	r0, [pc, #44]	; (9ec <cmd_peek16+0x38>)
     9c0:	f7ff fd00 	bl	3c4 <atoi>
     9c4:	4603      	mov	r3, r0
     9c6:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     9c8:	1d3b      	adds	r3, r7, #4
     9ca:	2200      	movs	r2, #0
     9cc:	4618      	mov	r0, r3
     9ce:	4611      	mov	r1, r2
     9d0:	df0c      	svc	12
	pad[0]=(unsigned char)(u&0xff);
     9d2:	687b      	ldr	r3, [r7, #4]
     9d4:	b2da      	uxtb	r2, r3
     9d6:	4b05      	ldr	r3, [pc, #20]	; (9ec <cmd_peek16+0x38>)
     9d8:	701a      	strb	r2, [r3, #0]
	pad[1]=(unsigned char)((u>>8)&0xff);
     9da:	687b      	ldr	r3, [r7, #4]
     9dc:	0a1b      	lsrs	r3, r3, #8
     9de:	b2da      	uxtb	r2, r3
     9e0:	4b02      	ldr	r3, [pc, #8]	; (9ec <cmd_peek16+0x38>)
     9e2:	705a      	strb	r2, [r3, #1]
}
     9e4:	3708      	adds	r7, #8
     9e6:	46bd      	mov	sp, r7
     9e8:	bd80      	pop	{r7, pc}
     9ea:	bf00      	nop
     9ec:	200000e4 	.word	0x200000e4

000009f0 <cmd_peek32>:

static void cmd_peek32(){
     9f0:	b580      	push	{r7, lr}
     9f2:	b082      	sub	sp, #8
     9f4:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     9f6:	f000 f98d 	bl	d14 <word>
	u=atoi((const char*)pad);
     9fa:	4810      	ldr	r0, [pc, #64]	; (a3c <cmd_peek32+0x4c>)
     9fc:	f7ff fce2 	bl	3c4 <atoi>
     a00:	4603      	mov	r3, r0
     a02:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_PEEK32,&u,NUL);
     a04:	463b      	mov	r3, r7
     a06:	2200      	movs	r2, #0
     a08:	4618      	mov	r0, r3
     a0a:	4611      	mov	r1, r2
     a0c:	df0d      	svc	13
	for (i=0;i<4;i++){
     a0e:	2300      	movs	r3, #0
     a10:	607b      	str	r3, [r7, #4]
     a12:	e00c      	b.n	a2e <cmd_peek32+0x3e>
		pad[i]=(unsigned char)(u&0xff);
     a14:	683b      	ldr	r3, [r7, #0]
     a16:	b2d9      	uxtb	r1, r3
     a18:	4a08      	ldr	r2, [pc, #32]	; (a3c <cmd_peek32+0x4c>)
     a1a:	687b      	ldr	r3, [r7, #4]
     a1c:	4413      	add	r3, r2
     a1e:	460a      	mov	r2, r1
     a20:	701a      	strb	r2, [r3, #0]
		u>>=8;
     a22:	683b      	ldr	r3, [r7, #0]
     a24:	0a1b      	lsrs	r3, r3, #8
     a26:	603b      	str	r3, [r7, #0]
	uint32_t u;
	int i;
	word();
	u=atoi((const char*)pad);
	_svc_call(SVC_PEEK32,&u,NUL);
	for (i=0;i<4;i++){
     a28:	687b      	ldr	r3, [r7, #4]
     a2a:	3301      	adds	r3, #1
     a2c:	607b      	str	r3, [r7, #4]
     a2e:	687b      	ldr	r3, [r7, #4]
     a30:	2b03      	cmp	r3, #3
     a32:	ddef      	ble.n	a14 <cmd_peek32+0x24>
		pad[i]=(unsigned char)(u&0xff);
		u>>=8;
	}
}
     a34:	3708      	adds	r7, #8
     a36:	46bd      	mov	sp, r7
     a38:	bd80      	pop	{r7, pc}
     a3a:	bf00      	nop
     a3c:	200000e4 	.word	0x200000e4

00000a40 <cmd_poke8>:

static void cmd_poke8(){
     a40:	b580      	push	{r7, lr}
     a42:	b082      	sub	sp, #8
     a44:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     a46:	f000 f965 	bl	d14 <word>
	adr=atoi((const char*)pad);
     a4a:	480a      	ldr	r0, [pc, #40]	; (a74 <cmd_poke8+0x34>)
     a4c:	f7ff fcba 	bl	3c4 <atoi>
     a50:	4603      	mov	r3, r0
     a52:	607b      	str	r3, [r7, #4]
	word();
     a54:	f000 f95e 	bl	d14 <word>
	u8=atoi((const char*)pad);
     a58:	4806      	ldr	r0, [pc, #24]	; (a74 <cmd_poke8+0x34>)
     a5a:	f7ff fcb3 	bl	3c4 <atoi>
     a5e:	4603      	mov	r3, r0
     a60:	b2db      	uxtb	r3, r3
     a62:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     a64:	1d3b      	adds	r3, r7, #4
     a66:	1cfa      	adds	r2, r7, #3
     a68:	4618      	mov	r0, r3
     a6a:	4611      	mov	r1, r2
     a6c:	df0e      	svc	14
}
     a6e:	3708      	adds	r7, #8
     a70:	46bd      	mov	sp, r7
     a72:	bd80      	pop	{r7, pc}
     a74:	200000e4 	.word	0x200000e4

00000a78 <cmd_poke16>:

static void cmd_poke16(){
     a78:	b580      	push	{r7, lr}
     a7a:	b082      	sub	sp, #8
     a7c:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     a7e:	f000 f949 	bl	d14 <word>
	adr=atoi((const char*)pad);
     a82:	480a      	ldr	r0, [pc, #40]	; (aac <cmd_poke16+0x34>)
     a84:	f7ff fc9e 	bl	3c4 <atoi>
     a88:	4603      	mov	r3, r0
     a8a:	607b      	str	r3, [r7, #4]
	word();
     a8c:	f000 f942 	bl	d14 <word>
	u16=atoi((const char*)pad);
     a90:	4806      	ldr	r0, [pc, #24]	; (aac <cmd_poke16+0x34>)
     a92:	f7ff fc97 	bl	3c4 <atoi>
     a96:	4603      	mov	r3, r0
     a98:	b29b      	uxth	r3, r3
     a9a:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     a9c:	1d3b      	adds	r3, r7, #4
     a9e:	1cba      	adds	r2, r7, #2
     aa0:	4618      	mov	r0, r3
     aa2:	4611      	mov	r1, r2
     aa4:	df0f      	svc	15
}
     aa6:	3708      	adds	r7, #8
     aa8:	46bd      	mov	sp, r7
     aaa:	bd80      	pop	{r7, pc}
     aac:	200000e4 	.word	0x200000e4

00000ab0 <cmd_poke32>:

static void cmd_poke32(){
     ab0:	b580      	push	{r7, lr}
     ab2:	b082      	sub	sp, #8
     ab4:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     ab6:	f000 f92d 	bl	d14 <word>
	adr=atoi((const char*)pad);
     aba:	480a      	ldr	r0, [pc, #40]	; (ae4 <cmd_poke32+0x34>)
     abc:	f7ff fc82 	bl	3c4 <atoi>
     ac0:	4603      	mov	r3, r0
     ac2:	607b      	str	r3, [r7, #4]
	word();
     ac4:	f000 f926 	bl	d14 <word>
	u32=atoi((const char*)pad);
     ac8:	4806      	ldr	r0, [pc, #24]	; (ae4 <cmd_poke32+0x34>)
     aca:	f7ff fc7b 	bl	3c4 <atoi>
     ace:	4603      	mov	r3, r0
     ad0:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     ad2:	1d3b      	adds	r3, r7, #4
     ad4:	463a      	mov	r2, r7
     ad6:	4618      	mov	r0, r3
     ad8:	4611      	mov	r1, r2
     ada:	df10      	svc	16
}
     adc:	3708      	adds	r7, #8
     ade:	46bd      	mov	sp, r7
     ae0:	bd80      	pop	{r7, pc}
     ae2:	bf00      	nop
     ae4:	200000e4 	.word	0x200000e4

00000ae8 <search_command>:
	{"poke32",cmd_poke32}, 
	{NUL,NUL}
};


int search_command(const char * name){
     ae8:	b580      	push	{r7, lr}
     aea:	b084      	sub	sp, #16
     aec:	af00      	add	r7, sp, #0
     aee:	6078      	str	r0, [r7, #4]
	int i=0;
     af0:	2300      	movs	r3, #0
     af2:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     af4:	e00e      	b.n	b14 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     af6:	4a12      	ldr	r2, [pc, #72]	; (b40 <search_command+0x58>)
     af8:	68fb      	ldr	r3, [r7, #12]
     afa:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     afe:	4618      	mov	r0, r3
     b00:	6879      	ldr	r1, [r7, #4]
     b02:	f7ff fbe1 	bl	2c8 <strcmp>
     b06:	4603      	mov	r3, r0
     b08:	2b00      	cmp	r3, #0
     b0a:	d100      	bne.n	b0e <search_command+0x26>
			break;
     b0c:	e009      	b.n	b22 <search_command+0x3a>
		}
		i++;
     b0e:	68fb      	ldr	r3, [r7, #12]
     b10:	3301      	adds	r3, #1
     b12:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     b14:	4a0a      	ldr	r2, [pc, #40]	; (b40 <search_command+0x58>)
     b16:	68fb      	ldr	r3, [r7, #12]
     b18:	00db      	lsls	r3, r3, #3
     b1a:	4413      	add	r3, r2
     b1c:	685b      	ldr	r3, [r3, #4]
     b1e:	2b00      	cmp	r3, #0
     b20:	d1e9      	bne.n	af6 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     b22:	4a07      	ldr	r2, [pc, #28]	; (b40 <search_command+0x58>)
     b24:	68fb      	ldr	r3, [r7, #12]
     b26:	00db      	lsls	r3, r3, #3
     b28:	4413      	add	r3, r2
     b2a:	685b      	ldr	r3, [r3, #4]
     b2c:	2b00      	cmp	r3, #0
     b2e:	d102      	bne.n	b36 <search_command+0x4e>
     b30:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     b34:	60fb      	str	r3, [r7, #12]
	return i;
     b36:	68fb      	ldr	r3, [r7, #12]
}
     b38:	4618      	mov	r0, r3
     b3a:	3710      	adds	r7, #16
     b3c:	46bd      	mov	sp, r7
     b3e:	bd80      	pop	{r7, pc}
     b40:	000018e0 	.word	0x000018e0

00000b44 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     b44:	b480      	push	{r7}
     b46:	b085      	sub	sp, #20
     b48:	af00      	add	r7, sp, #0
     b4a:	60f8      	str	r0, [r7, #12]
     b4c:	60b9      	str	r1, [r7, #8]
     b4e:	4613      	mov	r3, r2
     b50:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     b52:	e002      	b.n	b5a <skip+0x16>
     b54:	68bb      	ldr	r3, [r7, #8]
     b56:	3301      	adds	r3, #1
     b58:	60bb      	str	r3, [r7, #8]
     b5a:	68bb      	ldr	r3, [r7, #8]
     b5c:	68fa      	ldr	r2, [r7, #12]
     b5e:	4413      	add	r3, r2
     b60:	781b      	ldrb	r3, [r3, #0]
     b62:	2b00      	cmp	r3, #0
     b64:	d006      	beq.n	b74 <skip+0x30>
     b66:	68bb      	ldr	r3, [r7, #8]
     b68:	68fa      	ldr	r2, [r7, #12]
     b6a:	4413      	add	r3, r2
     b6c:	781b      	ldrb	r3, [r3, #0]
     b6e:	79fa      	ldrb	r2, [r7, #7]
     b70:	429a      	cmp	r2, r3
     b72:	d0ef      	beq.n	b54 <skip+0x10>
	return start;
     b74:	68bb      	ldr	r3, [r7, #8]
}
     b76:	4618      	mov	r0, r3
     b78:	3714      	adds	r7, #20
     b7a:	46bd      	mov	sp, r7
     b7c:	f85d 7b04 	ldr.w	r7, [sp], #4
     b80:	4770      	bx	lr
     b82:	bf00      	nop

00000b84 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     b84:	b480      	push	{r7}
     b86:	b085      	sub	sp, #20
     b88:	af00      	add	r7, sp, #0
     b8a:	60f8      	str	r0, [r7, #12]
     b8c:	60b9      	str	r1, [r7, #8]
     b8e:	4613      	mov	r3, r2
     b90:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     b92:	e002      	b.n	b9a <scan+0x16>
     b94:	68bb      	ldr	r3, [r7, #8]
     b96:	3301      	adds	r3, #1
     b98:	60bb      	str	r3, [r7, #8]
     b9a:	68bb      	ldr	r3, [r7, #8]
     b9c:	68fa      	ldr	r2, [r7, #12]
     b9e:	4413      	add	r3, r2
     ba0:	781b      	ldrb	r3, [r3, #0]
     ba2:	2b00      	cmp	r3, #0
     ba4:	d006      	beq.n	bb4 <scan+0x30>
     ba6:	68bb      	ldr	r3, [r7, #8]
     ba8:	68fa      	ldr	r2, [r7, #12]
     baa:	4413      	add	r3, r2
     bac:	781b      	ldrb	r3, [r3, #0]
     bae:	79fa      	ldrb	r2, [r7, #7]
     bb0:	429a      	cmp	r2, r3
     bb2:	d1ef      	bne.n	b94 <scan+0x10>
	return start;
     bb4:	68bb      	ldr	r3, [r7, #8]
}
     bb6:	4618      	mov	r0, r3
     bb8:	3714      	adds	r7, #20
     bba:	46bd      	mov	sp, r7
     bbc:	f85d 7b04 	ldr.w	r7, [sp], #4
     bc0:	4770      	bx	lr
     bc2:	bf00      	nop

00000bc4 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     bc4:	b480      	push	{r7}
     bc6:	b087      	sub	sp, #28
     bc8:	af00      	add	r7, sp, #0
     bca:	6078      	str	r0, [r7, #4]
     bcc:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     bce:	2300      	movs	r3, #0
     bd0:	617b      	str	r3, [r7, #20]
     bd2:	683b      	ldr	r3, [r7, #0]
     bd4:	613b      	str	r3, [r7, #16]
     bd6:	2300      	movs	r3, #0
     bd8:	60fb      	str	r3, [r7, #12]
     bda:	2301      	movs	r3, #1
     bdc:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     bde:	e040      	b.n	c62 <quote+0x9e>
		switch (buffer[end]){
     be0:	693b      	ldr	r3, [r7, #16]
     be2:	687a      	ldr	r2, [r7, #4]
     be4:	4413      	add	r3, r2
     be6:	781b      	ldrb	r3, [r3, #0]
     be8:	2b5c      	cmp	r3, #92	; 0x5c
     bea:	d012      	beq.n	c12 <quote+0x4e>
     bec:	2b6e      	cmp	r3, #110	; 0x6e
     bee:	d022      	beq.n	c36 <quote+0x72>
     bf0:	2b22      	cmp	r3, #34	; 0x22
     bf2:	d128      	bne.n	c46 <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     bf4:	697b      	ldr	r3, [r7, #20]
     bf6:	2b00      	cmp	r3, #0
     bf8:	d102      	bne.n	c00 <quote+0x3c>
     bfa:	2300      	movs	r3, #0
     bfc:	60bb      	str	r3, [r7, #8]
			break;
     bfe:	e02d      	b.n	c5c <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     c00:	68fb      	ldr	r3, [r7, #12]
     c02:	1c5a      	adds	r2, r3, #1
     c04:	60fa      	str	r2, [r7, #12]
     c06:	4a21      	ldr	r2, [pc, #132]	; (c8c <quote+0xc8>)
     c08:	2122      	movs	r1, #34	; 0x22
     c0a:	54d1      	strb	r1, [r2, r3]
     c0c:	2300      	movs	r3, #0
     c0e:	617b      	str	r3, [r7, #20]
			break;
     c10:	e024      	b.n	c5c <quote+0x98>
		case '\\':
			if (!escaped){
     c12:	697b      	ldr	r3, [r7, #20]
     c14:	2b00      	cmp	r3, #0
     c16:	d102      	bne.n	c1e <quote+0x5a>
				escaped=1;
     c18:	2301      	movs	r3, #1
     c1a:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     c1c:	e01e      	b.n	c5c <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     c1e:	2300      	movs	r3, #0
     c20:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     c22:	68fb      	ldr	r3, [r7, #12]
     c24:	1c5a      	adds	r2, r3, #1
     c26:	60fa      	str	r2, [r7, #12]
     c28:	693a      	ldr	r2, [r7, #16]
     c2a:	6879      	ldr	r1, [r7, #4]
     c2c:	440a      	add	r2, r1
     c2e:	7811      	ldrb	r1, [r2, #0]
     c30:	4a16      	ldr	r2, [pc, #88]	; (c8c <quote+0xc8>)
     c32:	54d1      	strb	r1, [r2, r3]
			}
			break;
     c34:	e012      	b.n	c5c <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     c36:	697b      	ldr	r3, [r7, #20]
     c38:	2b00      	cmp	r3, #0
     c3a:	d004      	beq.n	c46 <quote+0x82>
     c3c:	693b      	ldr	r3, [r7, #16]
     c3e:	687a      	ldr	r2, [r7, #4]
     c40:	4413      	add	r3, r2
     c42:	220d      	movs	r2, #13
     c44:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     c46:	2300      	movs	r3, #0
     c48:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     c4a:	68fb      	ldr	r3, [r7, #12]
     c4c:	1c5a      	adds	r2, r3, #1
     c4e:	60fa      	str	r2, [r7, #12]
     c50:	693a      	ldr	r2, [r7, #16]
     c52:	6879      	ldr	r1, [r7, #4]
     c54:	440a      	add	r2, r1
     c56:	7811      	ldrb	r1, [r2, #0]
     c58:	4a0c      	ldr	r2, [pc, #48]	; (c8c <quote+0xc8>)
     c5a:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     c5c:	693b      	ldr	r3, [r7, #16]
     c5e:	3301      	adds	r3, #1
     c60:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     c62:	693b      	ldr	r3, [r7, #16]
     c64:	687a      	ldr	r2, [r7, #4]
     c66:	4413      	add	r3, r2
     c68:	781b      	ldrb	r3, [r3, #0]
     c6a:	2b00      	cmp	r3, #0
     c6c:	d002      	beq.n	c74 <quote+0xb0>
     c6e:	68bb      	ldr	r3, [r7, #8]
     c70:	2b00      	cmp	r3, #0
     c72:	d1b5      	bne.n	be0 <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     c74:	4a05      	ldr	r2, [pc, #20]	; (c8c <quote+0xc8>)
     c76:	68fb      	ldr	r3, [r7, #12]
     c78:	4413      	add	r3, r2
     c7a:	2200      	movs	r2, #0
     c7c:	701a      	strb	r2, [r3, #0]
	return end;
     c7e:	693b      	ldr	r3, [r7, #16]
}
     c80:	4618      	mov	r0, r3
     c82:	371c      	adds	r7, #28
     c84:	46bd      	mov	sp, r7
     c86:	f85d 7b04 	ldr.w	r7, [sp], #4
     c8a:	4770      	bx	lr
     c8c:	200000e4 	.word	0x200000e4

00000c90 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     c90:	b480      	push	{r7}
     c92:	b087      	sub	sp, #28
     c94:	af00      	add	r7, sp, #0
     c96:	60f8      	str	r0, [r7, #12]
     c98:	60b9      	str	r1, [r7, #8]
     c9a:	4613      	mov	r3, r2
     c9c:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     c9e:	68bb      	ldr	r3, [r7, #8]
     ca0:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     ca2:	e002      	b.n	caa <next+0x1a>
     ca4:	697b      	ldr	r3, [r7, #20]
     ca6:	3301      	adds	r3, #1
     ca8:	617b      	str	r3, [r7, #20]
     caa:	697b      	ldr	r3, [r7, #20]
     cac:	68fa      	ldr	r2, [r7, #12]
     cae:	4413      	add	r3, r2
     cb0:	781b      	ldrb	r3, [r3, #0]
     cb2:	2b00      	cmp	r3, #0
     cb4:	d006      	beq.n	cc4 <next+0x34>
     cb6:	697b      	ldr	r3, [r7, #20]
     cb8:	68fa      	ldr	r2, [r7, #12]
     cba:	4413      	add	r3, r2
     cbc:	781b      	ldrb	r3, [r3, #0]
     cbe:	79fa      	ldrb	r2, [r7, #7]
     cc0:	429a      	cmp	r2, r3
     cc2:	d1ef      	bne.n	ca4 <next+0x14>
	return end-start;
     cc4:	697a      	ldr	r2, [r7, #20]
     cc6:	68bb      	ldr	r3, [r7, #8]
     cc8:	1ad3      	subs	r3, r2, r3
}
     cca:	4618      	mov	r0, r3
     ccc:	371c      	adds	r7, #28
     cce:	46bd      	mov	sp, r7
     cd0:	f85d 7b04 	ldr.w	r7, [sp], #4
     cd4:	4770      	bx	lr
     cd6:	bf00      	nop

00000cd8 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     cd8:	b480      	push	{r7}
     cda:	b085      	sub	sp, #20
     cdc:	af00      	add	r7, sp, #0
     cde:	60f8      	str	r0, [r7, #12]
     ce0:	60b9      	str	r1, [r7, #8]
     ce2:	607a      	str	r2, [r7, #4]
	while (len){
     ce4:	e00a      	b.n	cfc <move+0x24>
		*dest++=*src++;
     ce6:	68bb      	ldr	r3, [r7, #8]
     ce8:	1c5a      	adds	r2, r3, #1
     cea:	60ba      	str	r2, [r7, #8]
     cec:	68fa      	ldr	r2, [r7, #12]
     cee:	1c51      	adds	r1, r2, #1
     cf0:	60f9      	str	r1, [r7, #12]
     cf2:	7812      	ldrb	r2, [r2, #0]
     cf4:	701a      	strb	r2, [r3, #0]
		len--;
     cf6:	687b      	ldr	r3, [r7, #4]
     cf8:	3b01      	subs	r3, #1
     cfa:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     cfc:	687b      	ldr	r3, [r7, #4]
     cfe:	2b00      	cmp	r3, #0
     d00:	d1f1      	bne.n	ce6 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     d02:	68bb      	ldr	r3, [r7, #8]
     d04:	2200      	movs	r2, #0
     d06:	701a      	strb	r2, [r3, #0]
}
     d08:	3714      	adds	r7, #20
     d0a:	46bd      	mov	sp, r7
     d0c:	f85d 7b04 	ldr.w	r7, [sp], #4
     d10:	4770      	bx	lr
     d12:	bf00      	nop

00000d14 <word>:

// extrait le prochain mot du tib
static void word(){
     d14:	b580      	push	{r7, lr}
     d16:	b082      	sub	sp, #8
     d18:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     d1a:	4b1d      	ldr	r3, [pc, #116]	; (d90 <word+0x7c>)
     d1c:	681b      	ldr	r3, [r3, #0]
     d1e:	481d      	ldr	r0, [pc, #116]	; (d94 <word+0x80>)
     d20:	4619      	mov	r1, r3
     d22:	2220      	movs	r2, #32
     d24:	f7ff ff0e 	bl	b44 <skip>
     d28:	4603      	mov	r3, r0
     d2a:	461a      	mov	r2, r3
     d2c:	4b18      	ldr	r3, [pc, #96]	; (d90 <word+0x7c>)
     d2e:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     d30:	4b17      	ldr	r3, [pc, #92]	; (d90 <word+0x7c>)
     d32:	681b      	ldr	r3, [r3, #0]
     d34:	4a17      	ldr	r2, [pc, #92]	; (d94 <word+0x80>)
     d36:	5cd3      	ldrb	r3, [r2, r3]
     d38:	2b22      	cmp	r3, #34	; 0x22
     d3a:	d10f      	bne.n	d5c <word+0x48>
			in++;
     d3c:	4b14      	ldr	r3, [pc, #80]	; (d90 <word+0x7c>)
     d3e:	681b      	ldr	r3, [r3, #0]
     d40:	3301      	adds	r3, #1
     d42:	4a13      	ldr	r2, [pc, #76]	; (d90 <word+0x7c>)
     d44:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     d46:	4b12      	ldr	r3, [pc, #72]	; (d90 <word+0x7c>)
     d48:	681b      	ldr	r3, [r3, #0]
     d4a:	4812      	ldr	r0, [pc, #72]	; (d94 <word+0x80>)
     d4c:	4619      	mov	r1, r3
     d4e:	f7ff ff39 	bl	bc4 <quote>
     d52:	4603      	mov	r3, r0
     d54:	461a      	mov	r2, r3
     d56:	4b0e      	ldr	r3, [pc, #56]	; (d90 <word+0x7c>)
     d58:	601a      	str	r2, [r3, #0]
     d5a:	e016      	b.n	d8a <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     d5c:	4b0c      	ldr	r3, [pc, #48]	; (d90 <word+0x7c>)
     d5e:	681b      	ldr	r3, [r3, #0]
     d60:	480c      	ldr	r0, [pc, #48]	; (d94 <word+0x80>)
     d62:	4619      	mov	r1, r3
     d64:	2220      	movs	r2, #32
     d66:	f7ff ff93 	bl	c90 <next>
     d6a:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     d6c:	4b08      	ldr	r3, [pc, #32]	; (d90 <word+0x7c>)
     d6e:	681b      	ldr	r3, [r3, #0]
     d70:	4a08      	ldr	r2, [pc, #32]	; (d94 <word+0x80>)
     d72:	4413      	add	r3, r2
     d74:	4618      	mov	r0, r3
     d76:	4908      	ldr	r1, [pc, #32]	; (d98 <word+0x84>)
     d78:	687a      	ldr	r2, [r7, #4]
     d7a:	f7ff ffad 	bl	cd8 <move>
			in+=len;
     d7e:	4b04      	ldr	r3, [pc, #16]	; (d90 <word+0x7c>)
     d80:	681a      	ldr	r2, [r3, #0]
     d82:	687b      	ldr	r3, [r7, #4]
     d84:	4413      	add	r3, r2
     d86:	4a02      	ldr	r2, [pc, #8]	; (d90 <word+0x7c>)
     d88:	6013      	str	r3, [r2, #0]
		}
}
     d8a:	3708      	adds	r7, #8
     d8c:	46bd      	mov	sp, r7
     d8e:	bd80      	pop	{r7, pc}
     d90:	20000134 	.word	0x20000134
     d94:	20000094 	.word	0x20000094
     d98:	200000e4 	.word	0x200000e4

00000d9c <parse_line>:

static void parse_line(unsigned llen){
     d9c:	b580      	push	{r7, lr}
     d9e:	b084      	sub	sp, #16
     da0:	af00      	add	r7, sp, #0
     da2:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     da4:	4b12      	ldr	r3, [pc, #72]	; (df0 <parse_line+0x54>)
     da6:	2200      	movs	r2, #0
     da8:	601a      	str	r2, [r3, #0]
	while (in<llen){
     daa:	e016      	b.n	dda <parse_line+0x3e>
		word();
     dac:	f7ff ffb2 	bl	d14 <word>
		cmd_id=search_command((const char*) pad);
     db0:	4810      	ldr	r0, [pc, #64]	; (df4 <parse_line+0x58>)
     db2:	f7ff fe99 	bl	ae8 <search_command>
     db6:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     db8:	68fb      	ldr	r3, [r7, #12]
     dba:	2b00      	cmp	r3, #0
     dbc:	db06      	blt.n	dcc <parse_line+0x30>
			commands[cmd_id].fn();
     dbe:	4a0e      	ldr	r2, [pc, #56]	; (df8 <parse_line+0x5c>)
     dc0:	68fb      	ldr	r3, [r7, #12]
     dc2:	00db      	lsls	r3, r3, #3
     dc4:	4413      	add	r3, r2
     dc6:	685b      	ldr	r3, [r3, #4]
     dc8:	4798      	blx	r3
     dca:	e006      	b.n	dda <parse_line+0x3e>
		}else{
			print((const char*)pad); conout('?');
     dcc:	4809      	ldr	r0, [pc, #36]	; (df4 <parse_line+0x58>)
     dce:	f000 f8d9 	bl	f84 <print>
     dd2:	203f      	movs	r0, #63	; 0x3f
     dd4:	f000 f8a4 	bl	f20 <conout>
			break;
     dd8:	e004      	b.n	de4 <parse_line+0x48>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     dda:	4b05      	ldr	r3, [pc, #20]	; (df0 <parse_line+0x54>)
     ddc:	681a      	ldr	r2, [r3, #0]
     dde:	687b      	ldr	r3, [r7, #4]
     de0:	429a      	cmp	r2, r3
     de2:	d3e3      	bcc.n	dac <parse_line+0x10>
		}else{
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     de4:	200d      	movs	r0, #13
     de6:	f000 f89b 	bl	f20 <conout>
}
     dea:	3710      	adds	r7, #16
     dec:	46bd      	mov	sp, r7
     dee:	bd80      	pop	{r7, pc}
     df0:	20000134 	.word	0x20000134
     df4:	200000e4 	.word	0x200000e4
     df8:	000018e0 	.word	0x000018e0

00000dfc <copy_blink_in_ram>:
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}

void copy_blink_in_ram(){
     dfc:	b480      	push	{r7}
     dfe:	b085      	sub	sp, #20
     e00:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     e02:	4b0c      	ldr	r3, [pc, #48]	; (e34 <copy_blink_in_ram+0x38>)
     e04:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     e06:	4b0c      	ldr	r3, [pc, #48]	; (e38 <copy_blink_in_ram+0x3c>)
     e08:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TCA_START;
     e0a:	4b0c      	ldr	r3, [pc, #48]	; (e3c <copy_blink_in_ram+0x40>)
     e0c:	60bb      	str	r3, [r7, #8]
	while (start<end){
     e0e:	e007      	b.n	e20 <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     e10:	68bb      	ldr	r3, [r7, #8]
     e12:	1d1a      	adds	r2, r3, #4
     e14:	60ba      	str	r2, [r7, #8]
     e16:	68fa      	ldr	r2, [r7, #12]
     e18:	1d11      	adds	r1, r2, #4
     e1a:	60f9      	str	r1, [r7, #12]
     e1c:	6812      	ldr	r2, [r2, #0]
     e1e:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
     e20:	68fa      	ldr	r2, [r7, #12]
     e22:	687b      	ldr	r3, [r7, #4]
     e24:	429a      	cmp	r2, r3
     e26:	d3f3      	bcc.n	e10 <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
}
     e28:	3714      	adds	r7, #20
     e2a:	46bd      	mov	sp, r7
     e2c:	f85d 7b04 	ldr.w	r7, [sp], #4
     e30:	4770      	bx	lr
     e32:	bf00      	nop
     e34:	00001a00 	.word	0x00001a00
     e38:	00001a80 	.word	0x00001a80
     e3c:	20000180 	.word	0x20000180

00000e40 <main>:

extern void print_fault(const char *msg, sfrp_t adr);

void main(void){
     e40:	b580      	push	{r7, lr}
     e42:	b082      	sub	sp, #8
     e44:	af00      	add	r7, sp, #0
	set_sysclock();
     e46:	f7ff fc7f 	bl	748 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     e4a:	f06f 000a 	mvn.w	r0, #10
     e4e:	210f      	movs	r1, #15
     e50:	f000 fb56 	bl	1500 <set_int_priority>
	config_systicks();
     e54:	f7ff fcb6 	bl	7c4 <config_systicks>
	port_c_setup();
     e58:	f7ff fcc6 	bl	7e8 <port_c_setup>
	uart_open_channel(CON,115200,FLOW_HARD);
     e5c:	4816      	ldr	r0, [pc, #88]	; (eb8 <main+0x78>)
     e5e:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     e62:	2201      	movs	r2, #1
     e64:	f000 fc14 	bl	1690 <uart_open_channel>
	cls();
     e68:	f000 f8bc 	bl	fe4 <cls>
	print(VERSION); 
     e6c:	4b13      	ldr	r3, [pc, #76]	; (ebc <main+0x7c>)
     e6e:	681b      	ldr	r3, [r3, #0]
     e70:	4618      	mov	r0, r3
     e72:	f000 f887 	bl	f84 <print>
	copy_blink_in_ram();
     e76:	f7ff ffc1 	bl	dfc <copy_blink_in_ram>
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,proga&0xfffffffe,NUL); conout(CR);
     e7a:	4811      	ldr	r0, [pc, #68]	; (ec0 <main+0x80>)
     e7c:	f000 f882 	bl	f84 <print>
     e80:	4b10      	ldr	r3, [pc, #64]	; (ec4 <main+0x84>)
     e82:	681b      	ldr	r3, [r3, #0]
     e84:	f023 0301 	bic.w	r3, r3, #1
     e88:	2200      	movs	r2, #0
     e8a:	4618      	mov	r0, r3
     e8c:	4611      	mov	r1, r2
     e8e:	df0a      	svc	10
     e90:	200d      	movs	r0, #13
     e92:	f000 f845 	bl	f20 <conout>
	_svc_call(SVC_LED_ON,NUL,NUL);
     e96:	2300      	movs	r3, #0
     e98:	2200      	movs	r2, #0
     e9a:	4618      	mov	r0, r3
     e9c:	4611      	mov	r1, r2
     e9e:	df01      	svc	1
	flush_rx_queue();
     ea0:	f000 fa40 	bl	1324 <flush_rx_queue>
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
     ea4:	4808      	ldr	r0, [pc, #32]	; (ec8 <main+0x88>)
     ea6:	2150      	movs	r1, #80	; 0x50
     ea8:	f000 f8c2 	bl	1030 <read_line>
     eac:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     eae:	6878      	ldr	r0, [r7, #4]
     eb0:	f7ff ff74 	bl	d9c <parse_line>
	}
     eb4:	e7f6      	b.n	ea4 <main+0x64>
     eb6:	bf00      	nop
     eb8:	40004400 	.word	0x40004400
     ebc:	20000000 	.word	0x20000000
     ec0:	00001968 	.word	0x00001968
     ec4:	20000160 	.word	0x20000160
     ec8:	20000094 	.word	0x20000094

00000ecc <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
     ecc:	4668      	mov	r0, sp
     ece:	f020 0107 	bic.w	r1, r0, #7
     ed2:	468d      	mov	sp, r1
     ed4:	b481      	push	{r0, r7}
     ed6:	af00      	add	r7, sp, #0
	if (USART2_SR&(1<<USART_SR_RXNE)){
     ed8:	4b0e      	ldr	r3, [pc, #56]	; (f14 <USART2_handler+0x48>)
     eda:	681b      	ldr	r3, [r3, #0]
     edc:	f003 0320 	and.w	r3, r3, #32
     ee0:	2b00      	cmp	r3, #0
     ee2:	d012      	beq.n	f0a <USART2_handler+0x3e>
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
     ee4:	4b0c      	ldr	r3, [pc, #48]	; (f18 <USART2_handler+0x4c>)
     ee6:	6a1b      	ldr	r3, [r3, #32]
     ee8:	1c5a      	adds	r2, r3, #1
     eea:	490b      	ldr	r1, [pc, #44]	; (f18 <USART2_handler+0x4c>)
     eec:	620a      	str	r2, [r1, #32]
     eee:	4a0b      	ldr	r2, [pc, #44]	; (f1c <USART2_handler+0x50>)
     ef0:	6812      	ldr	r2, [r2, #0]
     ef2:	b2d2      	uxtb	r2, r2
     ef4:	f002 027f 	and.w	r2, r2, #127	; 0x7f
     ef8:	b2d1      	uxtb	r1, r2
     efa:	4a07      	ldr	r2, [pc, #28]	; (f18 <USART2_handler+0x4c>)
     efc:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
     efe:	4b06      	ldr	r3, [pc, #24]	; (f18 <USART2_handler+0x4c>)
     f00:	6a1b      	ldr	r3, [r3, #32]
     f02:	f003 031f 	and.w	r3, r3, #31
     f06:	4a04      	ldr	r2, [pc, #16]	; (f18 <USART2_handler+0x4c>)
     f08:	6213      	str	r3, [r2, #32]
	}
}
     f0a:	46bd      	mov	sp, r7
     f0c:	bc81      	pop	{r0, r7}
     f0e:	4685      	mov	sp, r0
     f10:	4770      	bx	lr
     f12:	bf00      	nop
     f14:	40004400 	.word	0x40004400
     f18:	20000138 	.word	0x20000138
     f1c:	40004404 	.word	0x40004404

00000f20 <conout>:


// envoie d'un caractère à la console
void conout(char c){
     f20:	b580      	push	{r7, lr}
     f22:	b082      	sub	sp, #8
     f24:	af00      	add	r7, sp, #0
     f26:	4603      	mov	r3, r0
     f28:	71fb      	strb	r3, [r7, #7]
	uart_putc(CON,c);
     f2a:	79fb      	ldrb	r3, [r7, #7]
     f2c:	4803      	ldr	r0, [pc, #12]	; (f3c <conout+0x1c>)
     f2e:	4619      	mov	r1, r3
     f30:	f000 fc74 	bl	181c <uart_putc>
}
     f34:	3708      	adds	r7, #8
     f36:	46bd      	mov	sp, r7
     f38:	bd80      	pop	{r7, pc}
     f3a:	bf00      	nop
     f3c:	40004400 	.word	0x40004400

00000f40 <conin>:


// réception d'un caractère de la console
char conin(){
     f40:	b480      	push	{r7}
     f42:	b083      	sub	sp, #12
     f44:	af00      	add	r7, sp, #0
	char c=0;
     f46:	2300      	movs	r3, #0
     f48:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
     f4a:	4b0d      	ldr	r3, [pc, #52]	; (f80 <conin+0x40>)
     f4c:	6a1a      	ldr	r2, [r3, #32]
     f4e:	4b0c      	ldr	r3, [pc, #48]	; (f80 <conin+0x40>)
     f50:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     f52:	429a      	cmp	r2, r3
     f54:	d00d      	beq.n	f72 <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
     f56:	4b0a      	ldr	r3, [pc, #40]	; (f80 <conin+0x40>)
     f58:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     f5a:	1c5a      	adds	r2, r3, #1
     f5c:	4908      	ldr	r1, [pc, #32]	; (f80 <conin+0x40>)
     f5e:	624a      	str	r2, [r1, #36]	; 0x24
     f60:	4a07      	ldr	r2, [pc, #28]	; (f80 <conin+0x40>)
     f62:	5cd3      	ldrb	r3, [r2, r3]
     f64:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
     f66:	4b06      	ldr	r3, [pc, #24]	; (f80 <conin+0x40>)
     f68:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     f6a:	f003 031f 	and.w	r3, r3, #31
     f6e:	4a04      	ldr	r2, [pc, #16]	; (f80 <conin+0x40>)
     f70:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
     f72:	79fb      	ldrb	r3, [r7, #7]
}
     f74:	4618      	mov	r0, r3
     f76:	370c      	adds	r7, #12
     f78:	46bd      	mov	sp, r7
     f7a:	f85d 7b04 	ldr.w	r7, [sp], #4
     f7e:	4770      	bx	lr
     f80:	20000138 	.word	0x20000138

00000f84 <print>:

// imprime un chaîne sur la console
void print(const char *str){
     f84:	b580      	push	{r7, lr}
     f86:	b082      	sub	sp, #8
     f88:	af00      	add	r7, sp, #0
     f8a:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
     f8c:	e006      	b.n	f9c <print+0x18>
     f8e:	687b      	ldr	r3, [r7, #4]
     f90:	1c5a      	adds	r2, r3, #1
     f92:	607a      	str	r2, [r7, #4]
     f94:	781b      	ldrb	r3, [r3, #0]
     f96:	4618      	mov	r0, r3
     f98:	f7ff ffc2 	bl	f20 <conout>
     f9c:	687b      	ldr	r3, [r7, #4]
     f9e:	781b      	ldrb	r3, [r3, #0]
     fa0:	2b00      	cmp	r3, #0
     fa2:	d1f4      	bne.n	f8e <print+0xa>
}
     fa4:	3708      	adds	r7, #8
     fa6:	46bd      	mov	sp, r7
     fa8:	bd80      	pop	{r7, pc}
     faa:	bf00      	nop

00000fac <beep>:

void beep(){
     fac:	b480      	push	{r7}
     fae:	af00      	add	r7, sp, #0
}
     fb0:	46bd      	mov	sp, r7
     fb2:	f85d 7b04 	ldr.w	r7, [sp], #4
     fb6:	4770      	bx	lr

00000fb8 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
     fb8:	b580      	push	{r7, lr}
     fba:	af00      	add	r7, sp, #0
	conout(BS);
     fbc:	2008      	movs	r0, #8
     fbe:	f7ff ffaf 	bl	f20 <conout>
	conout(SPACE);
     fc2:	2020      	movs	r0, #32
     fc4:	f7ff ffac 	bl	f20 <conout>
	conout(BS);
     fc8:	2008      	movs	r0, #8
     fca:	f7ff ffa9 	bl	f20 <conout>
}
     fce:	bd80      	pop	{r7, pc}

00000fd0 <esc_seq>:

void esc_seq(){
     fd0:	b580      	push	{r7, lr}
     fd2:	af00      	add	r7, sp, #0
	conout(ESC);
     fd4:	201b      	movs	r0, #27
     fd6:	f7ff ffa3 	bl	f20 <conout>
	conout('[');
     fda:	205b      	movs	r0, #91	; 0x5b
     fdc:	f7ff ffa0 	bl	f20 <conout>
}
     fe0:	bd80      	pop	{r7, pc}
     fe2:	bf00      	nop

00000fe4 <cls>:

// vide l'écran de la console
void cls(){
     fe4:	b580      	push	{r7, lr}
     fe6:	af00      	add	r7, sp, #0
	esc_seq();
     fe8:	f7ff fff2 	bl	fd0 <esc_seq>
	conout('2');
     fec:	2032      	movs	r0, #50	; 0x32
     fee:	f7ff ff97 	bl	f20 <conout>
	conout('J');
     ff2:	204a      	movs	r0, #74	; 0x4a
     ff4:	f7ff ff94 	bl	f20 <conout>
}
     ff8:	bd80      	pop	{r7, pc}
     ffa:	bf00      	nop

00000ffc <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
     ffc:	b580      	push	{r7, lr}
     ffe:	b082      	sub	sp, #8
    1000:	af00      	add	r7, sp, #0
    1002:	6078      	str	r0, [r7, #4]
	esc_seq();
    1004:	f7ff ffe4 	bl	fd0 <esc_seq>
	conout('2');
    1008:	2032      	movs	r0, #50	; 0x32
    100a:	f7ff ff89 	bl	f20 <conout>
	conout('K');
    100e:	204b      	movs	r0, #75	; 0x4b
    1010:	f7ff ff86 	bl	f20 <conout>
	while (n){conout(BS);n--;}
    1014:	e005      	b.n	1022 <clear_line+0x26>
    1016:	2008      	movs	r0, #8
    1018:	f7ff ff82 	bl	f20 <conout>
    101c:	687b      	ldr	r3, [r7, #4]
    101e:	3b01      	subs	r3, #1
    1020:	607b      	str	r3, [r7, #4]
    1022:	687b      	ldr	r3, [r7, #4]
    1024:	2b00      	cmp	r3, #0
    1026:	d1f6      	bne.n	1016 <clear_line+0x1a>
}
    1028:	3708      	adds	r7, #8
    102a:	46bd      	mov	sp, r7
    102c:	bd80      	pop	{r7, pc}
    102e:	bf00      	nop

00001030 <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
    1030:	b580      	push	{r7, lr}
    1032:	b084      	sub	sp, #16
    1034:	af00      	add	r7, sp, #0
    1036:	6078      	str	r0, [r7, #4]
    1038:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
    103a:	2300      	movs	r3, #0
    103c:	60fb      	str	r3, [r7, #12]
	char c=0;
    103e:	2300      	movs	r3, #0
    1040:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
    1042:	683b      	ldr	r3, [r7, #0]
    1044:	3b01      	subs	r3, #1
    1046:	603b      	str	r3, [r7, #0]
	while (c!=13){
    1048:	e08e      	b.n	1168 <read_line+0x138>
			c=conin();
    104a:	f7ff ff79 	bl	f40 <conin>
    104e:	4603      	mov	r3, r0
    1050:	72fb      	strb	r3, [r7, #11]
			switch(c){
    1052:	7afb      	ldrb	r3, [r7, #11]
    1054:	2b18      	cmp	r3, #24
    1056:	d872      	bhi.n	113e <read_line+0x10e>
    1058:	a201      	add	r2, pc, #4	; (adr r2, 1060 <read_line+0x30>)
    105a:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    105e:	bf00      	nop
    1060:	00001169 	.word	0x00001169
    1064:	0000113f 	.word	0x0000113f
    1068:	0000113f 	.word	0x0000113f
    106c:	0000113f 	.word	0x0000113f
    1070:	0000113f 	.word	0x0000113f
    1074:	00001131 	.word	0x00001131
    1078:	0000113f 	.word	0x0000113f
    107c:	0000113f 	.word	0x0000113f
    1080:	0000111f 	.word	0x0000111f
    1084:	0000113b 	.word	0x0000113b
    1088:	000010c5 	.word	0x000010c5
    108c:	0000113f 	.word	0x0000113f
    1090:	0000113f 	.word	0x0000113f
    1094:	000010c5 	.word	0x000010c5
    1098:	0000113f 	.word	0x0000113f
    109c:	0000113f 	.word	0x0000113f
    10a0:	0000113f 	.word	0x0000113f
    10a4:	0000113f 	.word	0x0000113f
    10a8:	0000113f 	.word	0x0000113f
    10ac:	0000113f 	.word	0x0000113f
    10b0:	0000113f 	.word	0x0000113f
    10b4:	000010d3 	.word	0x000010d3
    10b8:	0000113f 	.word	0x0000113f
    10bc:	000010e9 	.word	0x000010e9
    10c0:	000010d3 	.word	0x000010d3
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
    10c4:	230d      	movs	r3, #13
    10c6:	72fb      	strb	r3, [r7, #11]
				conout(c);
    10c8:	7afb      	ldrb	r3, [r7, #11]
    10ca:	4618      	mov	r0, r3
    10cc:	f7ff ff28 	bl	f20 <conout>
				break;
    10d0:	e04a      	b.n	1168 <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
    10d2:	68f8      	ldr	r0, [r7, #12]
    10d4:	f7ff ff92 	bl	ffc <clear_line>
				line_len=0;
    10d8:	2300      	movs	r3, #0
    10da:	60fb      	str	r3, [r7, #12]
				break;
    10dc:	e044      	b.n	1168 <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
    10de:	f7ff ff6b 	bl	fb8 <delete_back>
					line_len--;
    10e2:	68fb      	ldr	r3, [r7, #12]
    10e4:	3b01      	subs	r3, #1
    10e6:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
    10e8:	68fb      	ldr	r3, [r7, #12]
    10ea:	2b00      	cmp	r3, #0
    10ec:	d006      	beq.n	10fc <read_line+0xcc>
    10ee:	68fb      	ldr	r3, [r7, #12]
    10f0:	3b01      	subs	r3, #1
    10f2:	687a      	ldr	r2, [r7, #4]
    10f4:	4413      	add	r3, r2
    10f6:	781b      	ldrb	r3, [r3, #0]
    10f8:	2b20      	cmp	r3, #32
    10fa:	d0f0      	beq.n	10de <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    10fc:	e004      	b.n	1108 <read_line+0xd8>
					delete_back();
    10fe:	f7ff ff5b 	bl	fb8 <delete_back>
					line_len--;
    1102:	68fb      	ldr	r3, [r7, #12]
    1104:	3b01      	subs	r3, #1
    1106:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
    1108:	68fb      	ldr	r3, [r7, #12]
    110a:	2b00      	cmp	r3, #0
    110c:	d006      	beq.n	111c <read_line+0xec>
    110e:	68fb      	ldr	r3, [r7, #12]
    1110:	3b01      	subs	r3, #1
    1112:	687a      	ldr	r2, [r7, #4]
    1114:	4413      	add	r3, r2
    1116:	781b      	ldrb	r3, [r3, #0]
    1118:	2b20      	cmp	r3, #32
    111a:	d1f0      	bne.n	10fe <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
    111c:	e024      	b.n	1168 <read_line+0x138>
				case BS:
				if (line_len){
    111e:	68fb      	ldr	r3, [r7, #12]
    1120:	2b00      	cmp	r3, #0
    1122:	d004      	beq.n	112e <read_line+0xfe>
					delete_back();
    1124:	f7ff ff48 	bl	fb8 <delete_back>
					line_len--;
    1128:	68fb      	ldr	r3, [r7, #12]
    112a:	3b01      	subs	r3, #1
    112c:	60fb      	str	r3, [r7, #12]
				}
				break;
    112e:	e01b      	b.n	1168 <read_line+0x138>
				case CTRL_E:
				cls();
    1130:	f7ff ff58 	bl	fe4 <cls>
				line_len=0;
    1134:	2300      	movs	r3, #0
    1136:	60fb      	str	r3, [r7, #12]
				break;
    1138:	e016      	b.n	1168 <read_line+0x138>
				case TAB:
				c=SPACE;
    113a:	2320      	movs	r3, #32
    113c:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
    113e:	68fa      	ldr	r2, [r7, #12]
    1140:	683b      	ldr	r3, [r7, #0]
    1142:	429a      	cmp	r2, r3
    1144:	d20e      	bcs.n	1164 <read_line+0x134>
    1146:	7afb      	ldrb	r3, [r7, #11]
    1148:	2b1f      	cmp	r3, #31
    114a:	d90b      	bls.n	1164 <read_line+0x134>
					buffer[line_len++]=c;
    114c:	68fb      	ldr	r3, [r7, #12]
    114e:	1c5a      	adds	r2, r3, #1
    1150:	60fa      	str	r2, [r7, #12]
    1152:	687a      	ldr	r2, [r7, #4]
    1154:	4413      	add	r3, r2
    1156:	7afa      	ldrb	r2, [r7, #11]
    1158:	701a      	strb	r2, [r3, #0]
					conout(c);
    115a:	7afb      	ldrb	r3, [r7, #11]
    115c:	4618      	mov	r0, r3
    115e:	f7ff fedf 	bl	f20 <conout>
    1162:	e001      	b.n	1168 <read_line+0x138>
				}else{
					beep();
    1164:	f7ff ff22 	bl	fac <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
    1168:	7afb      	ldrb	r3, [r7, #11]
    116a:	2b0d      	cmp	r3, #13
    116c:	f47f af6d 	bne.w	104a <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
    1170:	687a      	ldr	r2, [r7, #4]
    1172:	68fb      	ldr	r3, [r7, #12]
    1174:	4413      	add	r3, r2
    1176:	2200      	movs	r2, #0
    1178:	701a      	strb	r2, [r3, #0]
	return line_len;
    117a:	68fb      	ldr	r3, [r7, #12]
}
    117c:	4618      	mov	r0, r3
    117e:	3710      	adds	r7, #16
    1180:	46bd      	mov	sp, r7
    1182:	bd80      	pop	{r7, pc}

00001184 <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
    1184:	b580      	push	{r7, lr}
    1186:	b08e      	sub	sp, #56	; 0x38
    1188:	af00      	add	r7, sp, #0
    118a:	6078      	str	r0, [r7, #4]
    118c:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    118e:	2301      	movs	r3, #1
    1190:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    1192:	2322      	movs	r3, #34	; 0x22
    1194:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    1196:	2300      	movs	r3, #0
    1198:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    119c:	687b      	ldr	r3, [r7, #4]
    119e:	2b00      	cmp	r3, #0
    11a0:	da05      	bge.n	11ae <print_int+0x2a>
    11a2:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    11a6:	637b      	str	r3, [r7, #52]	; 0x34
    11a8:	687b      	ldr	r3, [r7, #4]
    11aa:	425b      	negs	r3, r3
    11ac:	607b      	str	r3, [r7, #4]
	while (i){
    11ae:	e02c      	b.n	120a <print_int+0x86>
		fmt[pos]=i%base+'0';
    11b0:	687b      	ldr	r3, [r7, #4]
    11b2:	683a      	ldr	r2, [r7, #0]
    11b4:	fbb3 f2f2 	udiv	r2, r3, r2
    11b8:	6839      	ldr	r1, [r7, #0]
    11ba:	fb01 f202 	mul.w	r2, r1, r2
    11be:	1a9b      	subs	r3, r3, r2
    11c0:	b2db      	uxtb	r3, r3
    11c2:	3330      	adds	r3, #48	; 0x30
    11c4:	b2d9      	uxtb	r1, r3
    11c6:	f107 020c 	add.w	r2, r7, #12
    11ca:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11cc:	4413      	add	r3, r2
    11ce:	460a      	mov	r2, r1
    11d0:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    11d2:	f107 020c 	add.w	r2, r7, #12
    11d6:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11d8:	4413      	add	r3, r2
    11da:	781b      	ldrb	r3, [r3, #0]
    11dc:	2b39      	cmp	r3, #57	; 0x39
    11de:	d90c      	bls.n	11fa <print_int+0x76>
    11e0:	f107 020c 	add.w	r2, r7, #12
    11e4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11e6:	4413      	add	r3, r2
    11e8:	781b      	ldrb	r3, [r3, #0]
    11ea:	3307      	adds	r3, #7
    11ec:	b2d9      	uxtb	r1, r3
    11ee:	f107 020c 	add.w	r2, r7, #12
    11f2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11f4:	4413      	add	r3, r2
    11f6:	460a      	mov	r2, r1
    11f8:	701a      	strb	r2, [r3, #0]
		pos--;
    11fa:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    11fc:	3b01      	subs	r3, #1
    11fe:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    1200:	687a      	ldr	r2, [r7, #4]
    1202:	683b      	ldr	r3, [r7, #0]
    1204:	fbb2 f3f3 	udiv	r3, r2, r3
    1208:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    120a:	687b      	ldr	r3, [r7, #4]
    120c:	2b00      	cmp	r3, #0
    120e:	d1cf      	bne.n	11b0 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    1210:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1212:	2b22      	cmp	r3, #34	; 0x22
    1214:	d108      	bne.n	1228 <print_int+0xa4>
    1216:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1218:	1e5a      	subs	r2, r3, #1
    121a:	633a      	str	r2, [r7, #48]	; 0x30
    121c:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1220:	4413      	add	r3, r2
    1222:	2230      	movs	r2, #48	; 0x30
    1224:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    1228:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    122a:	2b00      	cmp	r3, #0
    122c:	da08      	bge.n	1240 <print_int+0xbc>
    122e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1230:	1e5a      	subs	r2, r3, #1
    1232:	633a      	str	r2, [r7, #48]	; 0x30
    1234:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1238:	4413      	add	r3, r2
    123a:	222d      	movs	r2, #45	; 0x2d
    123c:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    1240:	f107 020c 	add.w	r2, r7, #12
    1244:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1246:	4413      	add	r3, r2
    1248:	2220      	movs	r2, #32
    124a:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    124c:	f107 020c 	add.w	r2, r7, #12
    1250:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1252:	4413      	add	r3, r2
    1254:	4618      	mov	r0, r3
    1256:	f7ff fe95 	bl	f84 <print>
}
    125a:	3738      	adds	r7, #56	; 0x38
    125c:	46bd      	mov	sp, r7
    125e:	bd80      	pop	{r7, pc}

00001260 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    1260:	b580      	push	{r7, lr}
    1262:	b088      	sub	sp, #32
    1264:	af00      	add	r7, sp, #0
    1266:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    1268:	230c      	movs	r3, #12
    126a:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    126c:	2300      	movs	r3, #0
    126e:	767b      	strb	r3, [r7, #25]
	while (u){
    1270:	e026      	b.n	12c0 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    1272:	687b      	ldr	r3, [r7, #4]
    1274:	b2db      	uxtb	r3, r3
    1276:	f003 030f 	and.w	r3, r3, #15
    127a:	b2db      	uxtb	r3, r3
    127c:	3330      	adds	r3, #48	; 0x30
    127e:	b2d9      	uxtb	r1, r3
    1280:	f107 020c 	add.w	r2, r7, #12
    1284:	69fb      	ldr	r3, [r7, #28]
    1286:	4413      	add	r3, r2
    1288:	460a      	mov	r2, r1
    128a:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    128c:	f107 020c 	add.w	r2, r7, #12
    1290:	69fb      	ldr	r3, [r7, #28]
    1292:	4413      	add	r3, r2
    1294:	781b      	ldrb	r3, [r3, #0]
    1296:	2b39      	cmp	r3, #57	; 0x39
    1298:	d90c      	bls.n	12b4 <print_hex+0x54>
    129a:	f107 020c 	add.w	r2, r7, #12
    129e:	69fb      	ldr	r3, [r7, #28]
    12a0:	4413      	add	r3, r2
    12a2:	781b      	ldrb	r3, [r3, #0]
    12a4:	3307      	adds	r3, #7
    12a6:	b2d9      	uxtb	r1, r3
    12a8:	f107 020c 	add.w	r2, r7, #12
    12ac:	69fb      	ldr	r3, [r7, #28]
    12ae:	4413      	add	r3, r2
    12b0:	460a      	mov	r2, r1
    12b2:	701a      	strb	r2, [r3, #0]
		pos--;
    12b4:	69fb      	ldr	r3, [r7, #28]
    12b6:	3b01      	subs	r3, #1
    12b8:	61fb      	str	r3, [r7, #28]
		u/=16;
    12ba:	687b      	ldr	r3, [r7, #4]
    12bc:	091b      	lsrs	r3, r3, #4
    12be:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    12c0:	687b      	ldr	r3, [r7, #4]
    12c2:	2b00      	cmp	r3, #0
    12c4:	d1d5      	bne.n	1272 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    12c6:	69fb      	ldr	r3, [r7, #28]
    12c8:	2b0c      	cmp	r3, #12
    12ca:	d108      	bne.n	12de <print_hex+0x7e>
    12cc:	69fb      	ldr	r3, [r7, #28]
    12ce:	1e5a      	subs	r2, r3, #1
    12d0:	61fa      	str	r2, [r7, #28]
    12d2:	f107 0220 	add.w	r2, r7, #32
    12d6:	4413      	add	r3, r2
    12d8:	2230      	movs	r2, #48	; 0x30
    12da:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    12de:	69fb      	ldr	r3, [r7, #28]
    12e0:	1e5a      	subs	r2, r3, #1
    12e2:	61fa      	str	r2, [r7, #28]
    12e4:	f107 0220 	add.w	r2, r7, #32
    12e8:	4413      	add	r3, r2
    12ea:	2278      	movs	r2, #120	; 0x78
    12ec:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    12f0:	69fb      	ldr	r3, [r7, #28]
    12f2:	1e5a      	subs	r2, r3, #1
    12f4:	61fa      	str	r2, [r7, #28]
    12f6:	f107 0220 	add.w	r2, r7, #32
    12fa:	4413      	add	r3, r2
    12fc:	2230      	movs	r2, #48	; 0x30
    12fe:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    1302:	f107 020c 	add.w	r2, r7, #12
    1306:	69fb      	ldr	r3, [r7, #28]
    1308:	4413      	add	r3, r2
    130a:	2220      	movs	r2, #32
    130c:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    130e:	f107 020c 	add.w	r2, r7, #12
    1312:	69fb      	ldr	r3, [r7, #28]
    1314:	4413      	add	r3, r2
    1316:	4618      	mov	r0, r3
    1318:	f7ff fe34 	bl	f84 <print>
}
    131c:	3720      	adds	r7, #32
    131e:	46bd      	mov	sp, r7
    1320:	bd80      	pop	{r7, pc}
    1322:	bf00      	nop

00001324 <flush_rx_queue>:

// vide la file rx
void flush_rx_queue(){
    1324:	b480      	push	{r7}
    1326:	af00      	add	r7, sp, #0
	rx_queue.head=0;
    1328:	4b04      	ldr	r3, [pc, #16]	; (133c <flush_rx_queue+0x18>)
    132a:	2200      	movs	r2, #0
    132c:	621a      	str	r2, [r3, #32]
	rx_queue.tail=0;
    132e:	4b03      	ldr	r3, [pc, #12]	; (133c <flush_rx_queue+0x18>)
    1330:	2200      	movs	r2, #0
    1332:	625a      	str	r2, [r3, #36]	; 0x24
}
    1334:	46bd      	mov	sp, r7
    1336:	f85d 7b04 	ldr.w	r7, [sp], #4
    133a:	4770      	bx	lr
    133c:	20000138 	.word	0x20000138

00001340 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(unsigned port, unsigned pin, unsigned config){
    1340:	b480      	push	{r7}
    1342:	b085      	sub	sp, #20
    1344:	af00      	add	r7, sp, #0
    1346:	60f8      	str	r0, [r7, #12]
    1348:	60b9      	str	r1, [r7, #8]
    134a:	607a      	str	r2, [r7, #4]
	switch (port){
    134c:	68fb      	ldr	r3, [r7, #12]
    134e:	2b01      	cmp	r3, #1
    1350:	d030      	beq.n	13b4 <config_pin+0x74>
    1352:	2b01      	cmp	r3, #1
    1354:	d302      	bcc.n	135c <config_pin+0x1c>
    1356:	2b02      	cmp	r3, #2
    1358:	d058      	beq.n	140c <config_pin+0xcc>
    135a:	e083      	b.n	1464 <config_pin+0x124>
		case GPIOA:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    135c:	4b44      	ldr	r3, [pc, #272]	; (1470 <config_pin+0x130>)
    135e:	681a      	ldr	r2, [r3, #0]
    1360:	68bb      	ldr	r3, [r7, #8]
    1362:	08db      	lsrs	r3, r3, #3
    1364:	009b      	lsls	r3, r3, #2
    1366:	4413      	add	r3, r2
    1368:	4a41      	ldr	r2, [pc, #260]	; (1470 <config_pin+0x130>)
    136a:	6811      	ldr	r1, [r2, #0]
    136c:	68ba      	ldr	r2, [r7, #8]
    136e:	08d2      	lsrs	r2, r2, #3
    1370:	0092      	lsls	r2, r2, #2
    1372:	440a      	add	r2, r1
    1374:	6812      	ldr	r2, [r2, #0]
    1376:	68b9      	ldr	r1, [r7, #8]
    1378:	f001 0107 	and.w	r1, r1, #7
    137c:	200f      	movs	r0, #15
    137e:	fa00 f101 	lsl.w	r1, r0, r1
    1382:	43c9      	mvns	r1, r1
    1384:	400a      	ands	r2, r1
    1386:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    1388:	4b39      	ldr	r3, [pc, #228]	; (1470 <config_pin+0x130>)
    138a:	681a      	ldr	r2, [r3, #0]
    138c:	68bb      	ldr	r3, [r7, #8]
    138e:	08db      	lsrs	r3, r3, #3
    1390:	009b      	lsls	r3, r3, #2
    1392:	4413      	add	r3, r2
    1394:	4a36      	ldr	r2, [pc, #216]	; (1470 <config_pin+0x130>)
    1396:	6811      	ldr	r1, [r2, #0]
    1398:	68ba      	ldr	r2, [r7, #8]
    139a:	08d2      	lsrs	r2, r2, #3
    139c:	0092      	lsls	r2, r2, #2
    139e:	440a      	add	r2, r1
    13a0:	6811      	ldr	r1, [r2, #0]
    13a2:	68ba      	ldr	r2, [r7, #8]
    13a4:	f002 0207 	and.w	r2, r2, #7
    13a8:	6878      	ldr	r0, [r7, #4]
    13aa:	fa00 f202 	lsl.w	r2, r0, r2
    13ae:	430a      	orrs	r2, r1
    13b0:	601a      	str	r2, [r3, #0]
		break;
    13b2:	e057      	b.n	1464 <config_pin+0x124>
		case GPIOB:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    13b4:	4b2e      	ldr	r3, [pc, #184]	; (1470 <config_pin+0x130>)
    13b6:	681a      	ldr	r2, [r3, #0]
    13b8:	68bb      	ldr	r3, [r7, #8]
    13ba:	08db      	lsrs	r3, r3, #3
    13bc:	009b      	lsls	r3, r3, #2
    13be:	4413      	add	r3, r2
    13c0:	4a2b      	ldr	r2, [pc, #172]	; (1470 <config_pin+0x130>)
    13c2:	6811      	ldr	r1, [r2, #0]
    13c4:	68ba      	ldr	r2, [r7, #8]
    13c6:	08d2      	lsrs	r2, r2, #3
    13c8:	0092      	lsls	r2, r2, #2
    13ca:	440a      	add	r2, r1
    13cc:	6812      	ldr	r2, [r2, #0]
    13ce:	68b9      	ldr	r1, [r7, #8]
    13d0:	f001 0107 	and.w	r1, r1, #7
    13d4:	200f      	movs	r0, #15
    13d6:	fa00 f101 	lsl.w	r1, r0, r1
    13da:	43c9      	mvns	r1, r1
    13dc:	400a      	ands	r2, r1
    13de:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    13e0:	4b23      	ldr	r3, [pc, #140]	; (1470 <config_pin+0x130>)
    13e2:	681a      	ldr	r2, [r3, #0]
    13e4:	68bb      	ldr	r3, [r7, #8]
    13e6:	08db      	lsrs	r3, r3, #3
    13e8:	009b      	lsls	r3, r3, #2
    13ea:	4413      	add	r3, r2
    13ec:	4a20      	ldr	r2, [pc, #128]	; (1470 <config_pin+0x130>)
    13ee:	6811      	ldr	r1, [r2, #0]
    13f0:	68ba      	ldr	r2, [r7, #8]
    13f2:	08d2      	lsrs	r2, r2, #3
    13f4:	0092      	lsls	r2, r2, #2
    13f6:	440a      	add	r2, r1
    13f8:	6811      	ldr	r1, [r2, #0]
    13fa:	68ba      	ldr	r2, [r7, #8]
    13fc:	f002 0207 	and.w	r2, r2, #7
    1400:	6878      	ldr	r0, [r7, #4]
    1402:	fa00 f202 	lsl.w	r2, r0, r2
    1406:	430a      	orrs	r2, r1
    1408:	601a      	str	r2, [r3, #0]
		break;
    140a:	e02b      	b.n	1464 <config_pin+0x124>
		case GPIOC:
		GPIOA_CR[pin>>3].cr&=~(15<<(pin&7));
    140c:	4b18      	ldr	r3, [pc, #96]	; (1470 <config_pin+0x130>)
    140e:	681a      	ldr	r2, [r3, #0]
    1410:	68bb      	ldr	r3, [r7, #8]
    1412:	08db      	lsrs	r3, r3, #3
    1414:	009b      	lsls	r3, r3, #2
    1416:	4413      	add	r3, r2
    1418:	4a15      	ldr	r2, [pc, #84]	; (1470 <config_pin+0x130>)
    141a:	6811      	ldr	r1, [r2, #0]
    141c:	68ba      	ldr	r2, [r7, #8]
    141e:	08d2      	lsrs	r2, r2, #3
    1420:	0092      	lsls	r2, r2, #2
    1422:	440a      	add	r2, r1
    1424:	6812      	ldr	r2, [r2, #0]
    1426:	68b9      	ldr	r1, [r7, #8]
    1428:	f001 0107 	and.w	r1, r1, #7
    142c:	200f      	movs	r0, #15
    142e:	fa00 f101 	lsl.w	r1, r0, r1
    1432:	43c9      	mvns	r1, r1
    1434:	400a      	ands	r2, r1
    1436:	601a      	str	r2, [r3, #0]
		GPIOA_CR[pin>>3].cr|=config<<(pin&7);
    1438:	4b0d      	ldr	r3, [pc, #52]	; (1470 <config_pin+0x130>)
    143a:	681a      	ldr	r2, [r3, #0]
    143c:	68bb      	ldr	r3, [r7, #8]
    143e:	08db      	lsrs	r3, r3, #3
    1440:	009b      	lsls	r3, r3, #2
    1442:	4413      	add	r3, r2
    1444:	4a0a      	ldr	r2, [pc, #40]	; (1470 <config_pin+0x130>)
    1446:	6811      	ldr	r1, [r2, #0]
    1448:	68ba      	ldr	r2, [r7, #8]
    144a:	08d2      	lsrs	r2, r2, #3
    144c:	0092      	lsls	r2, r2, #2
    144e:	440a      	add	r2, r1
    1450:	6811      	ldr	r1, [r2, #0]
    1452:	68ba      	ldr	r2, [r7, #8]
    1454:	f002 0207 	and.w	r2, r2, #7
    1458:	6878      	ldr	r0, [r7, #4]
    145a:	fa00 f202 	lsl.w	r2, r0, r2
    145e:	430a      	orrs	r2, r1
    1460:	601a      	str	r2, [r3, #0]
		break;
    1462:	bf00      	nop
	}
}
    1464:	3714      	adds	r7, #20
    1466:	46bd      	mov	sp, r7
    1468:	f85d 7b04 	ldr.w	r7, [sp], #4
    146c:	4770      	bx	lr
    146e:	bf00      	nop
    1470:	20000028 	.word	0x20000028

00001474 <enable_interrupt>:





void enable_interrupt(unsigned irq){
    1474:	b480      	push	{r7}
    1476:	b085      	sub	sp, #20
    1478:	af00      	add	r7, sp, #0
    147a:	6078      	str	r0, [r7, #4]
	sfrp_t iser=(sfrp_t)(NVIC_ISER0_ADR);
    147c:	4b0d      	ldr	r3, [pc, #52]	; (14b4 <enable_interrupt+0x40>)
    147e:	60fb      	str	r3, [r7, #12]
	if (irq>LAST_IRQ) return ;
    1480:	687b      	ldr	r3, [r7, #4]
    1482:	2b3b      	cmp	r3, #59	; 0x3b
    1484:	d900      	bls.n	1488 <enable_interrupt+0x14>
    1486:	e010      	b.n	14aa <enable_interrupt+0x36>
	iser[irq/32]|=1<<(irq%32);
    1488:	687b      	ldr	r3, [r7, #4]
    148a:	095b      	lsrs	r3, r3, #5
    148c:	009a      	lsls	r2, r3, #2
    148e:	68f9      	ldr	r1, [r7, #12]
    1490:	440a      	add	r2, r1
    1492:	009b      	lsls	r3, r3, #2
    1494:	68f9      	ldr	r1, [r7, #12]
    1496:	440b      	add	r3, r1
    1498:	681b      	ldr	r3, [r3, #0]
    149a:	6879      	ldr	r1, [r7, #4]
    149c:	f001 011f 	and.w	r1, r1, #31
    14a0:	2001      	movs	r0, #1
    14a2:	fa00 f101 	lsl.w	r1, r0, r1
    14a6:	430b      	orrs	r3, r1
    14a8:	6013      	str	r3, [r2, #0]
	
}
    14aa:	3714      	adds	r7, #20
    14ac:	46bd      	mov	sp, r7
    14ae:	f85d 7b04 	ldr.w	r7, [sp], #4
    14b2:	4770      	bx	lr
    14b4:	e000e100 	.word	0xe000e100

000014b8 <disable_interrupt>:


void disable_interrupt(unsigned irq){
    14b8:	b480      	push	{r7}
    14ba:	b085      	sub	sp, #20
    14bc:	af00      	add	r7, sp, #0
    14be:	6078      	str	r0, [r7, #4]
	sfrp_t icer=(sfrp_t)(NVIC_ICER0_ADR);
    14c0:	4b0e      	ldr	r3, [pc, #56]	; (14fc <disable_interrupt+0x44>)
    14c2:	60fb      	str	r3, [r7, #12]
	if (irq>LAST_IRQ) return ;
    14c4:	687b      	ldr	r3, [r7, #4]
    14c6:	2b3b      	cmp	r3, #59	; 0x3b
    14c8:	d900      	bls.n	14cc <disable_interrupt+0x14>
    14ca:	e011      	b.n	14f0 <disable_interrupt+0x38>
	icer[irq/32]&=~(1<<(irq%32));
    14cc:	687b      	ldr	r3, [r7, #4]
    14ce:	095b      	lsrs	r3, r3, #5
    14d0:	009a      	lsls	r2, r3, #2
    14d2:	68f9      	ldr	r1, [r7, #12]
    14d4:	440a      	add	r2, r1
    14d6:	009b      	lsls	r3, r3, #2
    14d8:	68f9      	ldr	r1, [r7, #12]
    14da:	440b      	add	r3, r1
    14dc:	681b      	ldr	r3, [r3, #0]
    14de:	6879      	ldr	r1, [r7, #4]
    14e0:	f001 011f 	and.w	r1, r1, #31
    14e4:	2001      	movs	r0, #1
    14e6:	fa00 f101 	lsl.w	r1, r0, r1
    14ea:	43c9      	mvns	r1, r1
    14ec:	400b      	ands	r3, r1
    14ee:	6013      	str	r3, [r2, #0]
	
}
    14f0:	3714      	adds	r7, #20
    14f2:	46bd      	mov	sp, r7
    14f4:	f85d 7b04 	ldr.w	r7, [sp], #4
    14f8:	4770      	bx	lr
    14fa:	bf00      	nop
    14fc:	e000e180 	.word	0xe000e180

00001500 <set_int_priority>:


typedef volatile uint8_t* ipr_t;
typedef volatile uint8_t* shpr_t;
void set_int_priority(int32_t irq, unsigned priority){
    1500:	b480      	push	{r7}
    1502:	b085      	sub	sp, #20
    1504:	af00      	add	r7, sp, #0
    1506:	6078      	str	r0, [r7, #4]
    1508:	6039      	str	r1, [r7, #0]
	ipr_t ipr=(ipr_t)NVIC_IPR0_ADR;
    150a:	4b15      	ldr	r3, [pc, #84]	; (1560 <set_int_priority+0x60>)
    150c:	60fb      	str	r3, [r7, #12]
	shpr_t shpr=(shpr_t)(SCB_BASE_ADR+24);
    150e:	4b15      	ldr	r3, [pc, #84]	; (1564 <set_int_priority+0x64>)
    1510:	60bb      	str	r3, [r7, #8]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    1512:	687b      	ldr	r3, [r7, #4]
    1514:	2b00      	cmp	r3, #0
    1516:	db0b      	blt.n	1530 <set_int_priority+0x30>
    1518:	687b      	ldr	r3, [r7, #4]
    151a:	2b3b      	cmp	r3, #59	; 0x3b
    151c:	dc08      	bgt.n	1530 <set_int_priority+0x30>
		ipr[irq]=(uint8_t)((priority&15)<<4);
    151e:	687b      	ldr	r3, [r7, #4]
    1520:	68fa      	ldr	r2, [r7, #12]
    1522:	4413      	add	r3, r2
    1524:	683a      	ldr	r2, [r7, #0]
    1526:	b2d2      	uxtb	r2, r2
    1528:	0112      	lsls	r2, r2, #4
    152a:	b2d2      	uxtb	r2, r2
    152c:	701a      	strb	r2, [r3, #0]
    152e:	e012      	b.n	1556 <set_int_priority+0x56>
	}else if ((irq<0) && (irq>-16)){
    1530:	687b      	ldr	r3, [r7, #4]
    1532:	2b00      	cmp	r3, #0
    1534:	da0f      	bge.n	1556 <set_int_priority+0x56>
    1536:	687b      	ldr	r3, [r7, #4]
    1538:	f113 0f0f 	cmn.w	r3, #15
    153c:	db0b      	blt.n	1556 <set_int_priority+0x56>
		shpr[-(irq+4)]=(uint8_t)((priority&15)<<4);
    153e:	687a      	ldr	r2, [r7, #4]
    1540:	f06f 0303 	mvn.w	r3, #3
    1544:	1a9b      	subs	r3, r3, r2
    1546:	461a      	mov	r2, r3
    1548:	68bb      	ldr	r3, [r7, #8]
    154a:	4413      	add	r3, r2
    154c:	683a      	ldr	r2, [r7, #0]
    154e:	b2d2      	uxtb	r2, r2
    1550:	0112      	lsls	r2, r2, #4
    1552:	b2d2      	uxtb	r2, r2
    1554:	701a      	strb	r2, [r3, #0]
	}
}
    1556:	3714      	adds	r7, #20
    1558:	46bd      	mov	sp, r7
    155a:	f85d 7b04 	ldr.w	r7, [sp], #4
    155e:	4770      	bx	lr
    1560:	e000e400 	.word	0xe000e400
    1564:	e000ed18 	.word	0xe000ed18

00001568 <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    1568:	4b01      	ldr	r3, [pc, #4]	; (1570 <reset_mcu+0x8>)
    156a:	4a02      	ldr	r2, [pc, #8]	; (1574 <reset_mcu+0xc>)
    156c:	601a      	str	r2, [r3, #0]
    156e:	bf00      	nop
    1570:	e000ed0c 	.word	0xe000ed0c
    1574:	05fa0004 	.word	0x05fa0004

00001578 <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    1578:	b580      	push	{r7, lr}
    157a:	b082      	sub	sp, #8
    157c:	af00      	add	r7, sp, #0
    157e:	6078      	str	r0, [r7, #4]
    1580:	6039      	str	r1, [r7, #0]
	print(msg);
    1582:	6878      	ldr	r0, [r7, #4]
    1584:	f7ff fcfe 	bl	f84 <print>
	print("at address ");
    1588:	4816      	ldr	r0, [pc, #88]	; (15e4 <print_fault+0x6c>)
    158a:	f7ff fcfb 	bl	f84 <print>
	if (adr) {
    158e:	683b      	ldr	r3, [r7, #0]
    1590:	2b00      	cmp	r3, #0
    1592:	d002      	beq.n	159a <print_fault+0x22>
		print_hex(adr);
    1594:	6838      	ldr	r0, [r7, #0]
    1596:	f7ff fe63 	bl	1260 <print_hex>
	};
	conout(CR);
    159a:	200d      	movs	r0, #13
    159c:	f7ff fcc0 	bl	f20 <conout>
	print("UFSR=");
    15a0:	4811      	ldr	r0, [pc, #68]	; (15e8 <print_fault+0x70>)
    15a2:	f7ff fcef 	bl	f84 <print>
	print_hex(SCB_CFSR->fsr.usageFalt);
    15a6:	4b11      	ldr	r3, [pc, #68]	; (15ec <print_fault+0x74>)
    15a8:	681b      	ldr	r3, [r3, #0]
    15aa:	681b      	ldr	r3, [r3, #0]
    15ac:	0c1b      	lsrs	r3, r3, #16
    15ae:	b29b      	uxth	r3, r3
    15b0:	4618      	mov	r0, r3
    15b2:	f7ff fe55 	bl	1260 <print_hex>
	print(", BFSR=");
    15b6:	480e      	ldr	r0, [pc, #56]	; (15f0 <print_fault+0x78>)
    15b8:	f7ff fce4 	bl	f84 <print>
	print_hex(SCB_CFSR->fsr.busFault);
    15bc:	4b0b      	ldr	r3, [pc, #44]	; (15ec <print_fault+0x74>)
    15be:	681b      	ldr	r3, [r3, #0]
    15c0:	681b      	ldr	r3, [r3, #0]
    15c2:	0a1b      	lsrs	r3, r3, #8
    15c4:	b2db      	uxtb	r3, r3
    15c6:	4618      	mov	r0, r3
    15c8:	f7ff fe4a 	bl	1260 <print_hex>
	print(", MMFSR=");
    15cc:	4809      	ldr	r0, [pc, #36]	; (15f4 <print_fault+0x7c>)
    15ce:	f7ff fcd9 	bl	f84 <print>
	print_hex(SCB_CFSR->fsr.mmFault);
    15d2:	4b06      	ldr	r3, [pc, #24]	; (15ec <print_fault+0x74>)
    15d4:	681b      	ldr	r3, [r3, #0]
    15d6:	681b      	ldr	r3, [r3, #0]
    15d8:	b2db      	uxtb	r3, r3
    15da:	4618      	mov	r0, r3
    15dc:	f7ff fe40 	bl	1260 <print_hex>
	while(1);
    15e0:	e7fe      	b.n	15e0 <print_fault+0x68>
    15e2:	bf00      	nop
    15e4:	00001984 	.word	0x00001984
    15e8:	00001990 	.word	0x00001990
    15ec:	20000018 	.word	0x20000018
    15f0:	00001998 	.word	0x00001998
    15f4:	000019a0 	.word	0x000019a0

000015f8 <uart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
    15f8:	b480      	push	{r7}
    15fa:	b085      	sub	sp, #20
    15fc:	af00      	add	r7, sp, #0
    15fe:	6078      	str	r0, [r7, #4]
    1600:	6039      	str	r1, [r7, #0]
	sfrp_t brr;
	uint32_t rate;

    brr=(sfrp_t)(channel+USART_BRR_OFS);		
    1602:	687b      	ldr	r3, [r7, #4]
    1604:	3308      	adds	r3, #8
    1606:	60bb      	str	r3, [r7, #8]
	switch (channel){
    1608:	687b      	ldr	r3, [r7, #4]
    160a:	4a1a      	ldr	r2, [pc, #104]	; (1674 <uart_set_baud+0x7c>)
    160c:	4293      	cmp	r3, r2
    160e:	d019      	beq.n	1644 <uart_set_baud+0x4c>
    1610:	4a19      	ldr	r2, [pc, #100]	; (1678 <uart_set_baud+0x80>)
    1612:	4293      	cmp	r3, r2
    1614:	d003      	beq.n	161e <uart_set_baud+0x26>
    1616:	4a19      	ldr	r2, [pc, #100]	; (167c <uart_set_baud+0x84>)
    1618:	4293      	cmp	r3, r2
    161a:	d013      	beq.n	1644 <uart_set_baud+0x4c>
    161c:	e021      	b.n	1662 <uart_set_baud+0x6a>
	case USART1:
		rate=(FAPB2/baud/16)<<4;
    161e:	4a18      	ldr	r2, [pc, #96]	; (1680 <uart_set_baud+0x88>)
    1620:	683b      	ldr	r3, [r7, #0]
    1622:	fbb2 f3f3 	udiv	r3, r2, r3
    1626:	011b      	lsls	r3, r3, #4
    1628:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    162a:	4a16      	ldr	r2, [pc, #88]	; (1684 <uart_set_baud+0x8c>)
    162c:	683b      	ldr	r3, [r7, #0]
    162e:	fbb2 f3f3 	udiv	r3, r2, r3
    1632:	f003 030f 	and.w	r3, r3, #15
    1636:	68fa      	ldr	r2, [r7, #12]
    1638:	4313      	orrs	r3, r2
    163a:	60fb      	str	r3, [r7, #12]
		*brr=rate;
    163c:	68bb      	ldr	r3, [r7, #8]
    163e:	68fa      	ldr	r2, [r7, #12]
    1640:	601a      	str	r2, [r3, #0]
		return;
    1642:	e011      	b.n	1668 <uart_set_baud+0x70>
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
    1644:	4a10      	ldr	r2, [pc, #64]	; (1688 <uart_set_baud+0x90>)
    1646:	683b      	ldr	r3, [r7, #0]
    1648:	fbb2 f3f3 	udiv	r3, r2, r3
    164c:	011b      	lsls	r3, r3, #4
    164e:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    1650:	4a0e      	ldr	r2, [pc, #56]	; (168c <uart_set_baud+0x94>)
    1652:	683b      	ldr	r3, [r7, #0]
    1654:	fbb2 f3f3 	udiv	r3, r2, r3
    1658:	f003 030f 	and.w	r3, r3, #15
    165c:	68fa      	ldr	r2, [r7, #12]
    165e:	4313      	orrs	r3, r2
    1660:	60fb      	str	r3, [r7, #12]
	}
	*brr=rate;
    1662:	68bb      	ldr	r3, [r7, #8]
    1664:	68fa      	ldr	r2, [r7, #12]
    1666:	601a      	str	r2, [r3, #0]
}
    1668:	3714      	adds	r7, #20
    166a:	46bd      	mov	sp, r7
    166c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1670:	4770      	bx	lr
    1672:	bf00      	nop
    1674:	40004800 	.word	0x40004800
    1678:	40013800 	.word	0x40013800
    167c:	40004400 	.word	0x40004400
    1680:	0044aa20 	.word	0x0044aa20
    1684:	044aa200 	.word	0x044aa200
    1688:	00225510 	.word	0x00225510
    168c:	02255100 	.word	0x02255100

00001690 <uart_open_channel>:

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl){
    1690:	b580      	push	{r7, lr}
    1692:	b086      	sub	sp, #24
    1694:	af00      	add	r7, sp, #0
    1696:	60f8      	str	r0, [r7, #12]
    1698:	60b9      	str	r1, [r7, #8]
    169a:	607a      	str	r2, [r7, #4]
	sfrp_t cr1, cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
    169c:	68fb      	ldr	r3, [r7, #12]
    169e:	4a42      	ldr	r2, [pc, #264]	; (17a8 <uart_open_channel+0x118>)
    16a0:	4293      	cmp	r3, r2
    16a2:	d046      	beq.n	1732 <uart_open_channel+0xa2>
    16a4:	4a41      	ldr	r2, [pc, #260]	; (17ac <uart_open_channel+0x11c>)
    16a6:	4293      	cmp	r3, r2
    16a8:	d003      	beq.n	16b2 <uart_open_channel+0x22>
    16aa:	4a41      	ldr	r2, [pc, #260]	; (17b0 <uart_open_channel+0x120>)
    16ac:	4293      	cmp	r3, r2
    16ae:	d020      	beq.n	16f2 <uart_open_channel+0x62>
    16b0:	e05f      	b.n	1772 <uart_open_channel+0xe2>
	case USART1:
		RCC_APB2ENR|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
    16b2:	4a40      	ldr	r2, [pc, #256]	; (17b4 <uart_open_channel+0x124>)
    16b4:	4b3f      	ldr	r3, [pc, #252]	; (17b4 <uart_open_channel+0x124>)
    16b6:	681b      	ldr	r3, [r3, #0]
    16b8:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    16bc:	f043 0304 	orr.w	r3, r3, #4
    16c0:	6013      	str	r3, [r2, #0]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH->cr&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    16c2:	4b3d      	ldr	r3, [pc, #244]	; (17b8 <uart_open_channel+0x128>)
    16c4:	681a      	ldr	r2, [r3, #0]
    16c6:	4b3c      	ldr	r3, [pc, #240]	; (17b8 <uart_open_channel+0x128>)
    16c8:	681b      	ldr	r3, [r3, #0]
    16ca:	681b      	ldr	r3, [r3, #0]
    16cc:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    16d0:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    16d4:	6013      	str	r3, [r2, #0]
		GPIOA_CRH->cr|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    16d6:	4b38      	ldr	r3, [pc, #224]	; (17b8 <uart_open_channel+0x128>)
    16d8:	681a      	ldr	r2, [r3, #0]
    16da:	4b37      	ldr	r3, [pc, #220]	; (17b8 <uart_open_channel+0x128>)
    16dc:	681b      	ldr	r3, [r3, #0]
    16de:	681b      	ldr	r3, [r3, #0]
    16e0:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    16e4:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    16e8:	6013      	str	r3, [r2, #0]
		enable_interrupt(USART1_IRQ);
    16ea:	2025      	movs	r0, #37	; 0x25
    16ec:	f7ff fec2 	bl	1474 <enable_interrupt>
		break;
    16f0:	e03f      	b.n	1772 <uart_open_channel+0xe2>
	case USART2:
		RCC_APB1ENR|=(1<<RCC_APB1ENR_USART2EN);
    16f2:	4a32      	ldr	r2, [pc, #200]	; (17bc <uart_open_channel+0x12c>)
    16f4:	4b31      	ldr	r3, [pc, #196]	; (17bc <uart_open_channel+0x12c>)
    16f6:	681b      	ldr	r3, [r3, #0]
    16f8:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    16fc:	6013      	str	r3, [r2, #0]
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPAEN);
    16fe:	4a2d      	ldr	r2, [pc, #180]	; (17b4 <uart_open_channel+0x124>)
    1700:	4b2c      	ldr	r3, [pc, #176]	; (17b4 <uart_open_channel+0x124>)
    1702:	681b      	ldr	r3, [r3, #0]
    1704:	f043 0304 	orr.w	r3, r3, #4
    1708:	6013      	str	r3, [r2, #0]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX (push-pull)
		// PA3 -> RX (floating)
		GPIOA_CRL->cr&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    170a:	4b2d      	ldr	r3, [pc, #180]	; (17c0 <uart_open_channel+0x130>)
    170c:	681b      	ldr	r3, [r3, #0]
    170e:	4a2c      	ldr	r2, [pc, #176]	; (17c0 <uart_open_channel+0x130>)
    1710:	6812      	ldr	r2, [r2, #0]
    1712:	6812      	ldr	r2, [r2, #0]
    1714:	f422 627f 	bic.w	r2, r2, #4080	; 0xff0
    1718:	601a      	str	r2, [r3, #0]
		GPIOA_CRL->cr|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    171a:	4b29      	ldr	r3, [pc, #164]	; (17c0 <uart_open_channel+0x130>)
    171c:	681b      	ldr	r3, [r3, #0]
    171e:	4a28      	ldr	r2, [pc, #160]	; (17c0 <uart_open_channel+0x130>)
    1720:	6812      	ldr	r2, [r2, #0]
    1722:	6812      	ldr	r2, [r2, #0]
    1724:	f442 622a 	orr.w	r2, r2, #2720	; 0xaa0
    1728:	601a      	str	r2, [r3, #0]
		enable_interrupt(USART2_IRQ);
    172a:	2026      	movs	r0, #38	; 0x26
    172c:	f7ff fea2 	bl	1474 <enable_interrupt>
		break;
    1730:	e01f      	b.n	1772 <uart_open_channel+0xe2>
	case USART3:
		RCC_APB1ENR|=1<<RCC_APB1ENR_USART3EN;
    1732:	4a22      	ldr	r2, [pc, #136]	; (17bc <uart_open_channel+0x12c>)
    1734:	4b21      	ldr	r3, [pc, #132]	; (17bc <uart_open_channel+0x12c>)
    1736:	681b      	ldr	r3, [r3, #0]
    1738:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    173c:	6013      	str	r3, [r2, #0]
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPBEN);
    173e:	4a1d      	ldr	r2, [pc, #116]	; (17b4 <uart_open_channel+0x124>)
    1740:	4b1c      	ldr	r3, [pc, #112]	; (17b4 <uart_open_channel+0x124>)
    1742:	681b      	ldr	r3, [r3, #0]
    1744:	f043 0308 	orr.w	r3, r3, #8
    1748:	6013      	str	r3, [r2, #0]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH->cr&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    174a:	4b1e      	ldr	r3, [pc, #120]	; (17c4 <uart_open_channel+0x134>)
    174c:	681b      	ldr	r3, [r3, #0]
    174e:	4a1d      	ldr	r2, [pc, #116]	; (17c4 <uart_open_channel+0x134>)
    1750:	6812      	ldr	r2, [r2, #0]
    1752:	6812      	ldr	r2, [r2, #0]
    1754:	f022 220f 	bic.w	r2, r2, #251662080	; 0xf000f00
    1758:	601a      	str	r2, [r3, #0]
		GPIOB_CRH->cr|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    175a:	4b1a      	ldr	r3, [pc, #104]	; (17c4 <uart_open_channel+0x134>)
    175c:	681b      	ldr	r3, [r3, #0]
    175e:	4a19      	ldr	r2, [pc, #100]	; (17c4 <uart_open_channel+0x134>)
    1760:	6812      	ldr	r2, [r2, #0]
    1762:	6812      	ldr	r2, [r2, #0]
    1764:	f042 220a 	orr.w	r2, r2, #167774720	; 0xa000a00
    1768:	601a      	str	r2, [r3, #0]
		enable_interrupt(USART3_IRQ);
    176a:	2027      	movs	r0, #39	; 0x27
    176c:	f7ff fe82 	bl	1474 <enable_interrupt>
		break;
    1770:	bf00      	nop
	}
	uart_set_baud(channel,baud);
    1772:	68f8      	ldr	r0, [r7, #12]
    1774:	68b9      	ldr	r1, [r7, #8]
    1776:	f7ff ff3f 	bl	15f8 <uart_set_baud>
	if (flow_ctrl==FLOW_HARD){
    177a:	687b      	ldr	r3, [r7, #4]
    177c:	2b01      	cmp	r3, #1
    177e:	d106      	bne.n	178e <uart_open_channel+0xfe>
		cr3=(sfrp_t)(channel+USART_CR3_OFS);
    1780:	68fb      	ldr	r3, [r7, #12]
    1782:	3314      	adds	r3, #20
    1784:	617b      	str	r3, [r7, #20]
		*cr3=(1<<USART_CR3_CTSE)|(1<<USART_CR3_RTSE);
    1786:	697b      	ldr	r3, [r7, #20]
    1788:	f44f 7240 	mov.w	r2, #768	; 0x300
    178c:	601a      	str	r2, [r3, #0]
	}
	cr1=(sfrp_t)(channel+USART_CR1_OFS);
    178e:	68fb      	ldr	r3, [r7, #12]
    1790:	330c      	adds	r3, #12
    1792:	613b      	str	r3, [r7, #16]
	uart_getc(channel);
    1794:	68f8      	ldr	r0, [r7, #12]
    1796:	f000 f82d 	bl	17f4 <uart_getc>
	*cr1=(1<<USART_CR1_UE)|(1<<USART_CR1_TE)|(1<<USART_CR1_RE)|(1<<USART_CR1_RXNEIE);
    179a:	693b      	ldr	r3, [r7, #16]
    179c:	f242 022c 	movw	r2, #8236	; 0x202c
    17a0:	601a      	str	r2, [r3, #0]
}
    17a2:	3718      	adds	r7, #24
    17a4:	46bd      	mov	sp, r7
    17a6:	bd80      	pop	{r7, pc}
    17a8:	40004800 	.word	0x40004800
    17ac:	40013800 	.word	0x40013800
    17b0:	40004400 	.word	0x40004400
    17b4:	40021018 	.word	0x40021018
    17b8:	20000024 	.word	0x20000024
    17bc:	4002101c 	.word	0x4002101c
    17c0:	20000020 	.word	0x20000020
    17c4:	20000044 	.word	0x20000044

000017c8 <uart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int uart_stat(unsigned channel){
    17c8:	b480      	push	{r7}
    17ca:	b085      	sub	sp, #20
    17cc:	af00      	add	r7, sp, #0
    17ce:	6078      	str	r0, [r7, #4]
	sfrp_t sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    17d0:	687b      	ldr	r3, [r7, #4]
    17d2:	60fb      	str	r3, [r7, #12]
	return *sr&(1<<USART_SR_RXNE)?-1:0;
    17d4:	68fb      	ldr	r3, [r7, #12]
    17d6:	681b      	ldr	r3, [r3, #0]
    17d8:	f003 0320 	and.w	r3, r3, #32
    17dc:	2b00      	cmp	r3, #0
    17de:	d002      	beq.n	17e6 <uart_stat+0x1e>
    17e0:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    17e4:	e000      	b.n	17e8 <uart_stat+0x20>
    17e6:	2300      	movs	r3, #0
}
    17e8:	4618      	mov	r0, r3
    17ea:	3714      	adds	r7, #20
    17ec:	46bd      	mov	sp, r7
    17ee:	f85d 7b04 	ldr.w	r7, [sp], #4
    17f2:	4770      	bx	lr

000017f4 <uart_getc>:

// reçoit un caractère de la console
char uart_getc(unsigned channel){
    17f4:	b480      	push	{r7}
    17f6:	b085      	sub	sp, #20
    17f8:	af00      	add	r7, sp, #0
    17fa:	6078      	str	r0, [r7, #4]
	sfrp_t dr;
	
	dr=(sfrp_t)(channel+USART_DR_OFS);
    17fc:	687b      	ldr	r3, [r7, #4]
    17fe:	3304      	adds	r3, #4
    1800:	60fb      	str	r3, [r7, #12]
	return *dr&0x7f;
    1802:	68fb      	ldr	r3, [r7, #12]
    1804:	681b      	ldr	r3, [r3, #0]
    1806:	b2db      	uxtb	r3, r3
    1808:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    180c:	b2db      	uxtb	r3, r3
}
    180e:	4618      	mov	r0, r3
    1810:	3714      	adds	r7, #20
    1812:	46bd      	mov	sp, r7
    1814:	f85d 7b04 	ldr.w	r7, [sp], #4
    1818:	4770      	bx	lr
    181a:	bf00      	nop

0000181c <uart_putc>:

// transmet un caractère à la console
void uart_putc(unsigned channel, char c){
    181c:	b480      	push	{r7}
    181e:	b085      	sub	sp, #20
    1820:	af00      	add	r7, sp, #0
    1822:	6078      	str	r0, [r7, #4]
    1824:	460b      	mov	r3, r1
    1826:	70fb      	strb	r3, [r7, #3]
	sfrp_t dr, sr;
	
	sr=(sfrp_t)(channel+USART_SR_OFS);
    1828:	687b      	ldr	r3, [r7, #4]
    182a:	60fb      	str	r3, [r7, #12]
	dr=(sfrp_t)(channel+USART_DR_OFS);
    182c:	687b      	ldr	r3, [r7, #4]
    182e:	3304      	adds	r3, #4
    1830:	60bb      	str	r3, [r7, #8]
	//attend que dr soit vide
	while (!(*sr&(1<<USART_SR_TXE)));
    1832:	bf00      	nop
    1834:	68fb      	ldr	r3, [r7, #12]
    1836:	681b      	ldr	r3, [r3, #0]
    1838:	f003 0380 	and.w	r3, r3, #128	; 0x80
    183c:	2b00      	cmp	r3, #0
    183e:	d0f9      	beq.n	1834 <uart_putc+0x18>
	*dr=c&0x7f;
    1840:	78fb      	ldrb	r3, [r7, #3]
    1842:	f003 027f 	and.w	r2, r3, #127	; 0x7f
    1846:	68bb      	ldr	r3, [r7, #8]
    1848:	601a      	str	r2, [r3, #0]
}
    184a:	3714      	adds	r7, #20
    184c:	46bd      	mov	sp, r7
    184e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1852:	4770      	bx	lr

Disassembly of section .user_code:

00001a00 <blink>:
	}//while
	conout(CR);
}


void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    1a00:	b480      	push	{r7}
    1a02:	b085      	sub	sp, #20
    1a04:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    1a06:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    1a0a:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    1a0c:	2300      	movs	r3, #0
    1a0e:	71fb      	strb	r3, [r7, #7]
	
	
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    1a10:	2300      	movs	r3, #0
    1a12:	2200      	movs	r2, #0
    1a14:	4618      	mov	r0, r3
    1a16:	4611      	mov	r1, r2
    1a18:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    1a1a:	f107 030c 	add.w	r3, r7, #12
    1a1e:	2200      	movs	r2, #0
    1a20:	4618      	mov	r0, r3
    1a22:	4611      	mov	r1, r2
    1a24:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    1a26:	f107 0308 	add.w	r3, r7, #8
    1a2a:	2200      	movs	r2, #0
    1a2c:	4618      	mov	r0, r3
    1a2e:	4611      	mov	r1, r2
    1a30:	df04      	svc	4
    1a32:	68bb      	ldr	r3, [r7, #8]
    1a34:	2b00      	cmp	r3, #0
    1a36:	d1f6      	bne.n	1a26 <blink+0x26>
		_svc_call(SVC_LED_ON,NUL,NUL);
    1a38:	2300      	movs	r3, #0
    1a3a:	2200      	movs	r2, #0
    1a3c:	4618      	mov	r0, r3
    1a3e:	4611      	mov	r1, r2
    1a40:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    1a42:	f107 030c 	add.w	r3, r7, #12
    1a46:	2200      	movs	r2, #0
    1a48:	4618      	mov	r0, r3
    1a4a:	4611      	mov	r1, r2
    1a4c:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    1a4e:	f107 0308 	add.w	r3, r7, #8
    1a52:	2200      	movs	r2, #0
    1a54:	4618      	mov	r0, r3
    1a56:	4611      	mov	r1, r2
    1a58:	df04      	svc	4
    1a5a:	68bb      	ldr	r3, [r7, #8]
    1a5c:	2b00      	cmp	r3, #0
    1a5e:	d1f6      	bne.n	1a4e <blink+0x4e>
		_svc_call(SVC_CONIN,&c,NUL);
    1a60:	1dfb      	adds	r3, r7, #7
    1a62:	2200      	movs	r2, #0
    1a64:	4618      	mov	r0, r3
    1a66:	4611      	mov	r1, r2
    1a68:	df05      	svc	5
		if (c) break;
    1a6a:	79fb      	ldrb	r3, [r7, #7]
    1a6c:	b2db      	uxtb	r3, r3
    1a6e:	2b00      	cmp	r3, #0
    1a70:	d000      	beq.n	1a74 <blink+0x74>
    1a72:	e000      	b.n	1a76 <blink+0x76>
	}
    1a74:	e7cc      	b.n	1a10 <blink+0x10>
}
    1a76:	3714      	adds	r7, #20
    1a78:	46bd      	mov	sp, r7
    1a7a:	f85d 7b04 	ldr.w	r7, [sp], #4
    1a7e:	4770      	bx	lr
