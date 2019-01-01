
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 31 01 00 00 91 02 00 00 0d 02 00 00     .P. 1...........
      10:	95 02 00 00 99 02 00 00 9d 02 00 00 4d 33 00 00     ............M3..
      20:	4d 33 00 00 4d 33 00 00 4d 33 00 00 01 04 00 00     M3..M3..M3......
      30:	4d 33 00 00 4d 33 00 00 a5 02 00 00 25 34 00 00     M3..M3......%4..
      40:	ad 02 00 00 b1 02 00 00 b9 02 00 00 b5 02 00 00     ................
      50:	bd 02 00 00 c1 02 00 00 c5 02 00 00 c9 02 00 00     ................
      60:	cd 02 00 00 d1 02 00 00 d5 02 00 00 d9 02 00 00     ................
      70:	dd 02 00 00 4d 33 00 00 4d 33 00 00 45 37 00 00     ....M3..M3..E7..
      80:	4d 33 00 00 4d 33 00 00 4d 33 00 00 4d 33 00 00     M3..M3..M3..M3..
      90:	4d 33 00 00 4d 33 00 00 4d 33 00 00 19 28 00 00     M3..M3..M3...(..
      a0:	4d 33 00 00 4d 33 00 00 4d 33 00 00 bd 35 00 00     M3..M3..M3...5..
      b0:	81 29 00 00 f1 02 00 00 a9 1a 00 00 4d 33 00 00     .)..........M3..
      c0:	4d 33 00 00 4d 33 00 00 4d 33 00 00 4d 33 00 00     M3..M3..M3..M3..
      d0:	4d 33 00 00 f9 02 00 00 45 3c 00 00 01 03 00 00     M3......E<......
      e0:	4d 33 00 00 4d 33 00 00 4d 33 00 00 4d 33 00 00     M3..M3..M3..M3..
      f0:	4d 33 00 00 4d 33 00 00 4d 33 00 00 4d 33 00 00     M3..M3..M3..M3..
     100:	4d 33 00 00 4d 33 00 00 4d 33 00 00 4d 33 00 00     M3..M3..M3..M3..
     110:	4d 33 00 00 4d 33 00 00 4d 33 00 00 4d 33 00 00     M3..M3..M3..M3..
     120:	4d 33 00 00 4d 33 00 00 4d 33 00 00 4d 33 00 00     M3..M3..M3..M3..

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
     136:	4b29      	ldr	r3, [pc, #164]	; (1dc <startup+0xac>)
     138:	617b      	str	r3, [r7, #20]
    unsigned int * bss_end_p = &_BSS_END;
     13a:	4b29      	ldr	r3, [pc, #164]	; (1e0 <startup+0xb0>)
     13c:	60bb      	str	r3, [r7, #8]

    while(bss_start_p < bss_end_p)
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

    while(bss_start_p < bss_end_p)
     14c:	697a      	ldr	r2, [r7, #20]
     14e:	68bb      	ldr	r3, [r7, #8]
     150:	429a      	cmp	r2, r3
     152:	d3f5      	bcc.n	140 <startup+0x10>
    }

    /* Copy memory in data segment from its position
     * in the flash image to its position in the
     * read/write memory */
    unsigned int * data_rom_start_p = &_DATA_ROM_START;
     154:	4b23      	ldr	r3, [pc, #140]	; (1e4 <startup+0xb4>)
     156:	613b      	str	r3, [r7, #16]
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
     158:	4b23      	ldr	r3, [pc, #140]	; (1e8 <startup+0xb8>)
     15a:	60fb      	str	r3, [r7, #12]
    unsigned int * data_ram_end_p = &_DATA_RAM_END;
     15c:	4b23      	ldr	r3, [pc, #140]	; (1ec <startup+0xbc>)
     15e:	607b      	str	r3, [r7, #4]

    while(data_ram_start_p < data_ram_end_p)
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

    while(data_ram_start_p < data_ram_end_p)
     176:	68fa      	ldr	r2, [r7, #12]
     178:	687b      	ldr	r3, [r7, #4]
     17a:	429a      	cmp	r2, r3
     17c:	d3f1      	bcc.n	162 <startup+0x32>
    {
        *data_ram_start_p = *data_rom_start_p;
        data_ram_start_p++;
        data_rom_start_p++;
    }
	proga=(uint32_t)&_TPA_START|1;
     17e:	4b1c      	ldr	r3, [pc, #112]	; (1f0 <startup+0xc0>)
     180:	f043 0301 	orr.w	r3, r3, #1
     184:	4a1b      	ldr	r2, [pc, #108]	; (1f4 <startup+0xc4>)
     186:	6013      	str	r3, [r2, #0]
	here=(uint32_t*)&_TPA_START;
     188:	4b1b      	ldr	r3, [pc, #108]	; (1f8 <startup+0xc8>)
     18a:	4a19      	ldr	r2, [pc, #100]	; (1f0 <startup+0xc0>)
     18c:	601a      	str	r2, [r3, #0]
	*(uint16_t*)here=0x4770;
     18e:	4b1a      	ldr	r3, [pc, #104]	; (1f8 <startup+0xc8>)
     190:	681b      	ldr	r3, [r3, #0]
     192:	f244 7270 	movw	r2, #18288	; 0x4770
     196:	801a      	strh	r2, [r3, #0]
	here++;
     198:	4b17      	ldr	r3, [pc, #92]	; (1f8 <startup+0xc8>)
     19a:	681b      	ldr	r3, [r3, #0]
     19c:	3301      	adds	r3, #1
     19e:	4a16      	ldr	r2, [pc, #88]	; (1f8 <startup+0xc8>)
     1a0:	6013      	str	r3, [r2, #0]
	ffa=(uint32_t*)&_FLASH_FREE;
     1a2:	4b16      	ldr	r3, [pc, #88]	; (1fc <startup+0xcc>)
     1a4:	4a16      	ldr	r2, [pc, #88]	; (200 <startup+0xd0>)
     1a6:	601a      	str	r2, [r3, #0]
	// active les interruptions et les fault handler
	//SCB_CCR->fld_ccr.unalign_trp=1;
	//SCB_CCR->fld_ccr.div_0_trp=1;
	CCR->ccr|=1|(1<<3)|(1<<4);
     1a8:	4a16      	ldr	r2, [pc, #88]	; (204 <startup+0xd4>)
     1aa:	4b16      	ldr	r3, [pc, #88]	; (204 <startup+0xd4>)
     1ac:	681b      	ldr	r3, [r3, #0]
     1ae:	f043 0319 	orr.w	r3, r3, #25
     1b2:	6013      	str	r3, [r2, #0]
    __enable_irq();
     1b4:	b662      	cpsie	i
    __enable_fault_irq();
     1b6:	b661      	cpsie	f
    // initialisaton de la pile PSP et commutation 
    // vers cette pile.
    asm volatile(
     1b8:	4b13      	ldr	r3, [pc, #76]	; (208 <startup+0xd8>)
     1ba:	4618      	mov	r0, r3
     1bc:	f380 8809 	msr	PSP, r0
     1c0:	f3ef 8014 	mrs	r0, CONTROL
     1c4:	f040 0002 	orr.w	r0, r0, #2
     1c8:	f380 8814 	msr	CONTROL, r0
     1cc:	f3bf 8f6f 	isb	sy
    "msr CONTROL,r0\n"
    "isb\n"
    :: [psp_top] "r" (PSP_TOP)
    );
    /* Now we are ready to start the main function */
    main();
     1d0:	f000 fa70 	bl	6b4 <main>
}
     1d4:	3718      	adds	r7, #24
     1d6:	46bd      	mov	sp, r7
     1d8:	bd80      	pop	{r7, pc}
     1da:	bf00      	nop
     1dc:	20000010 	.word	0x20000010
     1e0:	20002758 	.word	0x20002758
     1e4:	00004890 	.word	0x00004890
     1e8:	20000000 	.word	0x20000000
     1ec:	20000010 	.word	0x20000010
     1f0:	20002800 	.word	0x20002800
     1f4:	20000184 	.word	0x20000184
     1f8:	20000188 	.word	0x20000188
     1fc:	20000180 	.word	0x20000180
     200:	00004800 	.word	0x00004800
     204:	e000ed14 	.word	0xe000ed14
     208:	20004e00 	.word	0x20004e00

0000020c <HARD_FAULT_handler>:
	print_hex(CFSR->fsr.mmFault);
	while(1);
}


_exception(HARD_FAULT_handler){
     20c:	4668      	mov	r0, sp
     20e:	f020 0107 	bic.w	r1, r0, #7
     212:	468d      	mov	sp, r1
     214:	b581      	push	{r0, r7, lr}
     216:	b083      	sub	sp, #12
     218:	af00      	add	r7, sp, #0
		uint32_t adr;
		asm volatile (
     21a:	f3ef 8009 	mrs	r0, PSP
     21e:	6983      	ldr	r3, [r0, #24]
     220:	607b      	str	r3, [r7, #4]
	"mrs r0,PSP\n" // optient la valeur de PSP
	"ldr %[adr],[r0,#24]\n" // obtient le PC
    : [adr] "=r" (adr)
    :
    :"r0");
	if ((CFSR->fsr.mmFault)&0x7f){
     222:	4b16      	ldr	r3, [pc, #88]	; (27c <HARD_FAULT_handler+0x70>)
     224:	681b      	ldr	r3, [r3, #0]
     226:	b2db      	uxtb	r3, r3
     228:	f003 037f 	and.w	r3, r3, #127	; 0x7f
     22c:	2b00      	cmp	r3, #0
     22e:	d004      	beq.n	23a <HARD_FAULT_handler+0x2e>
		print_fault("memory manager fault ",adr);
     230:	4813      	ldr	r0, [pc, #76]	; (280 <HARD_FAULT_handler+0x74>)
     232:	6879      	ldr	r1, [r7, #4]
     234:	f003 f892 	bl	335c <print_fault>
     238:	e019      	b.n	26e <HARD_FAULT_handler+0x62>
	}else if ((CFSR->fsr.busFault)&0xff){
     23a:	4b10      	ldr	r3, [pc, #64]	; (27c <HARD_FAULT_handler+0x70>)
     23c:	681b      	ldr	r3, [r3, #0]
     23e:	0a1b      	lsrs	r3, r3, #8
     240:	b2db      	uxtb	r3, r3
     242:	2b00      	cmp	r3, #0
     244:	d004      	beq.n	250 <HARD_FAULT_handler+0x44>
		print_fault("bus fault ",adr);
     246:	480f      	ldr	r0, [pc, #60]	; (284 <HARD_FAULT_handler+0x78>)
     248:	6879      	ldr	r1, [r7, #4]
     24a:	f003 f887 	bl	335c <print_fault>
     24e:	e00e      	b.n	26e <HARD_FAULT_handler+0x62>
	}else if ((CFSR->fsr.usageFalt)&0xffff){
     250:	4b0a      	ldr	r3, [pc, #40]	; (27c <HARD_FAULT_handler+0x70>)
     252:	681b      	ldr	r3, [r3, #0]
     254:	0c1b      	lsrs	r3, r3, #16
     256:	b29b      	uxth	r3, r3
     258:	2b00      	cmp	r3, #0
     25a:	d004      	beq.n	266 <HARD_FAULT_handler+0x5a>
		print_fault("usage fault ",adr);
     25c:	480a      	ldr	r0, [pc, #40]	; (288 <HARD_FAULT_handler+0x7c>)
     25e:	6879      	ldr	r1, [r7, #4]
     260:	f003 f87c 	bl	335c <print_fault>
     264:	e003      	b.n	26e <HARD_FAULT_handler+0x62>
	}else{
		print_fault("hard fault  ",adr);
     266:	4809      	ldr	r0, [pc, #36]	; (28c <HARD_FAULT_handler+0x80>)
     268:	6879      	ldr	r1, [r7, #4]
     26a:	f003 f877 	bl	335c <print_fault>
	}
}
     26e:	370c      	adds	r7, #12
     270:	46bd      	mov	sp, r7
     272:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     276:	4685      	mov	sp, r0
     278:	4770      	bx	lr
     27a:	bf00      	nop
     27c:	e000ed28 	.word	0xe000ed28
     280:	000043e0 	.word	0x000043e0
     284:	000043f8 	.word	0x000043f8
     288:	00004404 	.word	0x00004404
     28c:	00004414 	.word	0x00004414

00000290 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     290:	f003 f85c 	bl	334c <reset_mcu>

00000294 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)
     294:	f003 f85a 	bl	334c <reset_mcu>

00000298 <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler)
     298:	f003 f858 	bl	334c <reset_mcu>

0000029c <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler)
     29c:	f003 f856 	bl	334c <reset_mcu>
_default_handler(SVC_handler) // 11
     2a0:	f003 f854 	bl	334c <reset_mcu>

000002a4 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     2a4:	f003 f852 	bl	334c <reset_mcu>
_default_handler(STK_handler) // 15
     2a8:	f003 f850 	bl	334c <reset_mcu>

000002ac <WWDG_handler>:
	}
}


// IRQ
_default_handler(WWDG_handler) // 0
     2ac:	f003 f84e 	bl	334c <reset_mcu>

000002b0 <PVD_handler>:
_default_handler(PVD_handler) // 1
     2b0:	f003 f84c 	bl	334c <reset_mcu>

000002b4 <RTC_handler>:
_default_handler(RTC_handler) // 2
     2b4:	f003 f84a 	bl	334c <reset_mcu>

000002b8 <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     2b8:	f003 f848 	bl	334c <reset_mcu>

000002bc <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     2bc:	f003 f846 	bl	334c <reset_mcu>

000002c0 <RCC_handler>:
_default_handler(RCC_handler) // 5
     2c0:	f003 f844 	bl	334c <reset_mcu>

000002c4 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     2c4:	f003 f842 	bl	334c <reset_mcu>

000002c8 <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     2c8:	f003 f840 	bl	334c <reset_mcu>

000002cc <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     2cc:	f003 f83e 	bl	334c <reset_mcu>

000002d0 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     2d0:	f003 f83c 	bl	334c <reset_mcu>

000002d4 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     2d4:	f003 f83a 	bl	334c <reset_mcu>

000002d8 <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     2d8:	f003 f838 	bl	334c <reset_mcu>

000002dc <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     2dc:	f003 f836 	bl	334c <reset_mcu>
_default_handler(DMA1CH5_handler) // 12
     2e0:	f003 f834 	bl	334c <reset_mcu>
_default_handler(EXTI9_5_handler) // 23
     2e4:	f003 f832 	bl	334c <reset_mcu>
_default_handler(TIM1_CC_handler) // 27
     2e8:	f003 f830 	bl	334c <reset_mcu>
_default_handler(TIM2_handler) // 28
     2ec:	f003 f82e 	bl	334c <reset_mcu>

000002f0 <TIM3_handler>:
_default_handler(TIM3_handler) // 29
     2f0:	f003 f82c 	bl	334c <reset_mcu>
_default_handler(TIM4_handler) // 30
     2f4:	f003 f82a 	bl	334c <reset_mcu>

000002f8 <USART1_handler>:
_default_handler(USART1_handler) // 37
     2f8:	f003 f828 	bl	334c <reset_mcu>
_default_handler(USART2_handler) // 38
     2fc:	f003 f826 	bl	334c <reset_mcu>

00000300 <USART3_handler>:
_default_handler(USART3_handler) // 39
     300:	f003 f824 	bl	334c <reset_mcu>

00000304 <alloc>:


#include "bpos.h"

// size est en octets.
void* alloc(unsigned size){
     304:	b480      	push	{r7}
     306:	b085      	sub	sp, #20
     308:	af00      	add	r7, sp, #0
     30a:	6078      	str	r0, [r7, #4]
	void *ptr;
	if ((here+size)>TPA_TOP) return 0;
     30c:	4b0c      	ldr	r3, [pc, #48]	; (340 <alloc+0x3c>)
     30e:	681a      	ldr	r2, [r3, #0]
     310:	687b      	ldr	r3, [r7, #4]
     312:	441a      	add	r2, r3
     314:	4b0b      	ldr	r3, [pc, #44]	; (344 <alloc+0x40>)
     316:	681b      	ldr	r3, [r3, #0]
     318:	429a      	cmp	r2, r3
     31a:	d901      	bls.n	320 <alloc+0x1c>
     31c:	2300      	movs	r3, #0
     31e:	e009      	b.n	334 <alloc+0x30>
	ptr=here;
     320:	4b07      	ldr	r3, [pc, #28]	; (340 <alloc+0x3c>)
     322:	681b      	ldr	r3, [r3, #0]
     324:	60fb      	str	r3, [r7, #12]
	here+=size;
     326:	4b06      	ldr	r3, [pc, #24]	; (340 <alloc+0x3c>)
     328:	681a      	ldr	r2, [r3, #0]
     32a:	687b      	ldr	r3, [r7, #4]
     32c:	4413      	add	r3, r2
     32e:	4a04      	ldr	r2, [pc, #16]	; (340 <alloc+0x3c>)
     330:	6013      	str	r3, [r2, #0]
	return ptr;
     332:	68fb      	ldr	r3, [r7, #12]
}
     334:	4618      	mov	r0, r3
     336:	3714      	adds	r7, #20
     338:	46bd      	mov	sp, r7
     33a:	f85d 7b04 	ldr.w	r7, [sp], #4
     33e:	4770      	bx	lr
     340:	20000188 	.word	0x20000188
     344:	20000000 	.word	0x20000000

00000348 <free>:

// ptr valeur retournée par alloc()
// tout ce qui a été alloué après 'ptr' est limité
// comme dans FORTH.
void free(void* ptr){
     348:	b480      	push	{r7}
     34a:	b083      	sub	sp, #12
     34c:	af00      	add	r7, sp, #0
     34e:	6078      	str	r0, [r7, #4]
	here=ptr;
     350:	4a03      	ldr	r2, [pc, #12]	; (360 <free+0x18>)
     352:	687b      	ldr	r3, [r7, #4]
     354:	6013      	str	r3, [r2, #0]
}
     356:	370c      	adds	r7, #12
     358:	46bd      	mov	sp, r7
     35a:	f85d 7b04 	ldr.w	r7, [sp], #4
     35e:	4770      	bx	lr
     360:	20000188 	.word	0x20000188

00000364 <peek8>:

// ********************
// routine de services
// ********************

static inline uint8_t peek8(uint8_t *adr){
     364:	b480      	push	{r7}
     366:	b083      	sub	sp, #12
     368:	af00      	add	r7, sp, #0
     36a:	6078      	str	r0, [r7, #4]
	return *adr;
     36c:	687b      	ldr	r3, [r7, #4]
     36e:	781b      	ldrb	r3, [r3, #0]
}
     370:	4618      	mov	r0, r3
     372:	370c      	adds	r7, #12
     374:	46bd      	mov	sp, r7
     376:	f85d 7b04 	ldr.w	r7, [sp], #4
     37a:	4770      	bx	lr

0000037c <peek16>:

static inline uint16_t peek16(uint16_t *adr){
     37c:	b480      	push	{r7}
     37e:	b083      	sub	sp, #12
     380:	af00      	add	r7, sp, #0
     382:	6078      	str	r0, [r7, #4]
	return *adr;
     384:	687b      	ldr	r3, [r7, #4]
     386:	881b      	ldrh	r3, [r3, #0]
}
     388:	4618      	mov	r0, r3
     38a:	370c      	adds	r7, #12
     38c:	46bd      	mov	sp, r7
     38e:	f85d 7b04 	ldr.w	r7, [sp], #4
     392:	4770      	bx	lr

00000394 <peek32>:

static inline uint32_t peek32(uint32_t *adr){
     394:	b480      	push	{r7}
     396:	b083      	sub	sp, #12
     398:	af00      	add	r7, sp, #0
     39a:	6078      	str	r0, [r7, #4]
	return *adr;
     39c:	687b      	ldr	r3, [r7, #4]
     39e:	681b      	ldr	r3, [r3, #0]
}
     3a0:	4618      	mov	r0, r3
     3a2:	370c      	adds	r7, #12
     3a4:	46bd      	mov	sp, r7
     3a6:	f85d 7b04 	ldr.w	r7, [sp], #4
     3aa:	4770      	bx	lr

000003ac <poke8>:

static inline void poke8(uint8_t *adr, uint8_t value){
     3ac:	b480      	push	{r7}
     3ae:	b083      	sub	sp, #12
     3b0:	af00      	add	r7, sp, #0
     3b2:	6078      	str	r0, [r7, #4]
     3b4:	460b      	mov	r3, r1
     3b6:	70fb      	strb	r3, [r7, #3]
	*adr=value;
     3b8:	687b      	ldr	r3, [r7, #4]
     3ba:	78fa      	ldrb	r2, [r7, #3]
     3bc:	701a      	strb	r2, [r3, #0]
}
     3be:	370c      	adds	r7, #12
     3c0:	46bd      	mov	sp, r7
     3c2:	f85d 7b04 	ldr.w	r7, [sp], #4
     3c6:	4770      	bx	lr

000003c8 <poke16>:

static inline void poke16(uint16_t *adr, uint16_t value){
     3c8:	b480      	push	{r7}
     3ca:	b083      	sub	sp, #12
     3cc:	af00      	add	r7, sp, #0
     3ce:	6078      	str	r0, [r7, #4]
     3d0:	460b      	mov	r3, r1
     3d2:	807b      	strh	r3, [r7, #2]
	*adr=value;
     3d4:	687b      	ldr	r3, [r7, #4]
     3d6:	887a      	ldrh	r2, [r7, #2]
     3d8:	801a      	strh	r2, [r3, #0]
}
     3da:	370c      	adds	r7, #12
     3dc:	46bd      	mov	sp, r7
     3de:	f85d 7b04 	ldr.w	r7, [sp], #4
     3e2:	4770      	bx	lr

000003e4 <poke32>:

static inline void poke32(uint32_t *adr, uint32_t value){
     3e4:	b480      	push	{r7}
     3e6:	b083      	sub	sp, #12
     3e8:	af00      	add	r7, sp, #0
     3ea:	6078      	str	r0, [r7, #4]
     3ec:	6039      	str	r1, [r7, #0]
	*adr=value;
     3ee:	687b      	ldr	r3, [r7, #4]
     3f0:	683a      	ldr	r2, [r7, #0]
     3f2:	601a      	str	r2, [r3, #0]
}
     3f4:	370c      	adds	r7, #12
     3f6:	46bd      	mov	sp, r7
     3f8:	f85d 7b04 	ldr.w	r7, [sp], #4
     3fc:	4770      	bx	lr
     3fe:	bf00      	nop

00000400 <SVC_handler>:

// interruption multiplexeur des appels de services
void __attribute__((__interrupt__)) SVC_handler(){
     400:	4668      	mov	r0, sp
     402:	f020 0107 	bic.w	r1, r0, #7
     406:	468d      	mov	sp, r1
     408:	b591      	push	{r0, r4, r7, lr}
     40a:	b084      	sub	sp, #16
     40c:	af00      	add	r7, sp, #0
	int svc_id;
	void *arg1, *arg2; 
	asm volatile (
     40e:	f3ef 8009 	mrs	r0, PSP
     412:	6981      	ldr	r1, [r0, #24]
     414:	f811 4c02 	ldrb.w	r4, [r1, #-2]
     418:	6802      	ldr	r2, [r0, #0]
     41a:	6843      	ldr	r3, [r0, #4]
     41c:	60fc      	str	r4, [r7, #12]
     41e:	60ba      	str	r2, [r7, #8]
     420:	607b      	str	r3, [r7, #4]
    "ldr %[arg1],[r0]\n\t"
    "ldr %[arg2],[r0,#4]\n\t"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [arg2] "=r" (arg2)
    :: "r0","r1" 
    );
	switch (svc_id){
     422:	68fb      	ldr	r3, [r7, #12]
     424:	2b16      	cmp	r3, #22
     426:	f200 80d6 	bhi.w	5d6 <SVC_handler+0x1d6>
     42a:	a201      	add	r2, pc, #4	; (adr r2, 430 <SVC_handler+0x30>)
     42c:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     430:	000005d1 	.word	0x000005d1
     434:	0000048d 	.word	0x0000048d
     438:	00000499 	.word	0x00000499
     43c:	000004a5 	.word	0x000004a5
     440:	000004af 	.word	0x000004af
     444:	000004b9 	.word	0x000004b9
     448:	000004c7 	.word	0x000004c7
     44c:	000004d3 	.word	0x000004d3
     450:	000004e7 	.word	0x000004e7
     454:	000004ef 	.word	0x000004ef
     458:	000004fd 	.word	0x000004fd
     45c:	00000509 	.word	0x00000509
     460:	0000051d 	.word	0x0000051d
     464:	00000531 	.word	0x00000531
     468:	00000543 	.word	0x00000543
     46c:	00000557 	.word	0x00000557
     470:	0000056b 	.word	0x0000056b
     474:	0000057f 	.word	0x0000057f
     478:	00000597 	.word	0x00000597
     47c:	000005a9 	.word	0x000005a9
     480:	000005b3 	.word	0x000005b3
     484:	000005b9 	.word	0x000005b9
     488:	000005c5 	.word	0x000005c5
	case SVC_LED_ON:
		write_pin(LED_PORT,LED_PIN,LED_ON);
     48c:	4855      	ldr	r0, [pc, #340]	; (5e4 <SVC_handler+0x1e4>)
     48e:	210d      	movs	r1, #13
     490:	2200      	movs	r2, #0
     492:	f001 ff91 	bl	23b8 <write_pin>
		//led_on();
		break;
     496:	e09e      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_LED_OFF:
		write_pin(LED_PORT,LED_PIN,LED_OFF);
     498:	4852      	ldr	r0, [pc, #328]	; (5e4 <SVC_handler+0x1e4>)
     49a:	210d      	movs	r1, #13
     49c:	2201      	movs	r2, #1
     49e:	f001 ff8b 	bl	23b8 <write_pin>
		//led_off();
		break;
     4a2:	e098      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_TIMER:
		timer=(*(unsigned*)arg1);
     4a4:	68bb      	ldr	r3, [r7, #8]
     4a6:	681b      	ldr	r3, [r3, #0]
     4a8:	4a4f      	ldr	r2, [pc, #316]	; (5e8 <SVC_handler+0x1e8>)
     4aa:	6013      	str	r3, [r2, #0]
		break;
     4ac:	e093      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=timer;
     4ae:	4b4e      	ldr	r3, [pc, #312]	; (5e8 <SVC_handler+0x1e8>)
     4b0:	681a      	ldr	r2, [r3, #0]
     4b2:	68bb      	ldr	r3, [r7, #8]
     4b4:	601a      	str	r2, [r3, #0]
		break;
     4b6:	e08e      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_CONIN:
		*(char *)arg1=conin();
     4b8:	f001 f8f6 	bl	16a8 <conin>
     4bc:	4603      	mov	r3, r0
     4be:	461a      	mov	r2, r3
     4c0:	68bb      	ldr	r3, [r7, #8]
     4c2:	701a      	strb	r2, [r3, #0]
		break;
     4c4:	e087      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     4c6:	68bb      	ldr	r3, [r7, #8]
     4c8:	781b      	ldrb	r3, [r3, #0]
     4ca:	4618      	mov	r0, r3
     4cc:	f001 f898 	bl	1600 <conout>
		break;
     4d0:	e081      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
     4d2:	68bb      	ldr	r3, [r7, #8]
     4d4:	681b      	ldr	r3, [r3, #0]
     4d6:	6878      	ldr	r0, [r7, #4]
     4d8:	4619      	mov	r1, r3
     4da:	f001 f925 	bl	1728 <read_line>
     4de:	4602      	mov	r2, r0
     4e0:	68bb      	ldr	r3, [r7, #8]
     4e2:	601a      	str	r2, [r3, #0]
		break;
     4e4:	e077      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_PRINT:
		print((const char*)arg1);
     4e6:	68b8      	ldr	r0, [r7, #8]
     4e8:	f001 f8e8 	bl	16bc <print>
		break;
     4ec:	e073      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_PRINT_DEC:
		print_int(*(int32_t*)arg1,10);
     4ee:	68bb      	ldr	r3, [r7, #8]
     4f0:	681b      	ldr	r3, [r3, #0]
     4f2:	4618      	mov	r0, r3
     4f4:	210a      	movs	r1, #10
     4f6:	f001 f9ff 	bl	18f8 <print_int>
		break;
     4fa:	e06c      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
     4fc:	68bb      	ldr	r3, [r7, #8]
     4fe:	681b      	ldr	r3, [r3, #0]
     500:	4618      	mov	r0, r3
     502:	f001 fa67 	bl	19d4 <print_hex>
		break;
     506:	e066      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
     508:	68bb      	ldr	r3, [r7, #8]
     50a:	681b      	ldr	r3, [r3, #0]
     50c:	4618      	mov	r0, r3
     50e:	f7ff ff29 	bl	364 <peek8>
     512:	4603      	mov	r3, r0
     514:	461a      	mov	r2, r3
     516:	68bb      	ldr	r3, [r7, #8]
     518:	701a      	strb	r2, [r3, #0]
		break;
     51a:	e05c      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
     51c:	68bb      	ldr	r3, [r7, #8]
     51e:	681b      	ldr	r3, [r3, #0]
     520:	4618      	mov	r0, r3
     522:	f7ff ff2b 	bl	37c <peek16>
     526:	4603      	mov	r3, r0
     528:	461a      	mov	r2, r3
     52a:	68bb      	ldr	r3, [r7, #8]
     52c:	801a      	strh	r2, [r3, #0]
		break;
     52e:	e052      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
     530:	68bb      	ldr	r3, [r7, #8]
     532:	681b      	ldr	r3, [r3, #0]
     534:	4618      	mov	r0, r3
     536:	f7ff ff2d 	bl	394 <peek32>
     53a:	4602      	mov	r2, r0
     53c:	68bb      	ldr	r3, [r7, #8]
     53e:	601a      	str	r2, [r3, #0]
		break;
     540:	e049      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
     542:	68bb      	ldr	r3, [r7, #8]
     544:	681b      	ldr	r3, [r3, #0]
     546:	461a      	mov	r2, r3
     548:	687b      	ldr	r3, [r7, #4]
     54a:	781b      	ldrb	r3, [r3, #0]
     54c:	4610      	mov	r0, r2
     54e:	4619      	mov	r1, r3
     550:	f7ff ff2c 	bl	3ac <poke8>
		break;
     554:	e03f      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
     556:	68bb      	ldr	r3, [r7, #8]
     558:	681b      	ldr	r3, [r3, #0]
     55a:	461a      	mov	r2, r3
     55c:	687b      	ldr	r3, [r7, #4]
     55e:	881b      	ldrh	r3, [r3, #0]
     560:	4610      	mov	r0, r2
     562:	4619      	mov	r1, r3
     564:	f7ff ff30 	bl	3c8 <poke16>
		break;
     568:	e035      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
     56a:	68bb      	ldr	r3, [r7, #8]
     56c:	681b      	ldr	r3, [r3, #0]
     56e:	461a      	mov	r2, r3
     570:	687b      	ldr	r3, [r7, #4]
     572:	681b      	ldr	r3, [r3, #0]
     574:	4610      	mov	r0, r2
     576:	4619      	mov	r1, r3
     578:	f7ff ff34 	bl	3e4 <poke32>
		break;
     57c:	e02b      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_FLASH_WR:
		*(int*)arg1=flash_write(*(uint32_t*)arg1,*(uint16_t*)arg2);
     57e:	68bb      	ldr	r3, [r7, #8]
     580:	681a      	ldr	r2, [r3, #0]
     582:	687b      	ldr	r3, [r7, #4]
     584:	881b      	ldrh	r3, [r3, #0]
     586:	4610      	mov	r0, r2
     588:	4619      	mov	r1, r3
     58a:	f001 fafd 	bl	1b88 <flash_write>
     58e:	4602      	mov	r2, r0
     590:	68bb      	ldr	r3, [r7, #8]
     592:	601a      	str	r2, [r3, #0]
		break;
     594:	e01f      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_FLASH_PGER:
		*(int*)arg1=flash_erase_page(*(uint32_t*)arg1);
     596:	68bb      	ldr	r3, [r7, #8]
     598:	681b      	ldr	r3, [r3, #0]
     59a:	4618      	mov	r0, r3
     59c:	f001 fb38 	bl	1c10 <flash_erase_page>
     5a0:	4602      	mov	r2, r0
     5a2:	68bb      	ldr	r3, [r7, #8]
     5a4:	601a      	str	r2, [r3, #0]
		break;
     5a6:	e016      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_TICKS:
		*(unsigned*)arg1=ticks;
     5a8:	4b10      	ldr	r3, [pc, #64]	; (5ec <SVC_handler+0x1ec>)
     5aa:	681a      	ldr	r2, [r3, #0]
     5ac:	68bb      	ldr	r3, [r7, #8]
     5ae:	601a      	str	r2, [r3, #0]
		break;
     5b0:	e011      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_CLS:
		cls();
     5b2:	f001 fa71 	bl	1a98 <cls>
		break;
     5b6:	e00e      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_HERE:
		*(uint32_t*)arg1=(uint32_t)here;
     5b8:	4b0d      	ldr	r3, [pc, #52]	; (5f0 <SVC_handler+0x1f0>)
     5ba:	681b      	ldr	r3, [r3, #0]
     5bc:	461a      	mov	r2, r3
     5be:	68bb      	ldr	r3, [r7, #8]
     5c0:	601a      	str	r2, [r3, #0]
		break;
     5c2:	e008      	b.n	5d6 <SVC_handler+0x1d6>
	case SVC_FFA:
		*(uint32_t*)arg1=(uint32_t)ffa;
     5c4:	4b0b      	ldr	r3, [pc, #44]	; (5f4 <SVC_handler+0x1f4>)
     5c6:	681b      	ldr	r3, [r3, #0]
     5c8:	461a      	mov	r2, r3
     5ca:	68bb      	ldr	r3, [r7, #8]
     5cc:	601a      	str	r2, [r3, #0]
		break;
     5ce:	e002      	b.n	5d6 <SVC_handler+0x1d6>
    case SVC_RESET:
	    reset_mcu();
     5d0:	f002 febc 	bl	334c <reset_mcu>
	    break;
     5d4:	bf00      	nop
	}	
}
     5d6:	3710      	adds	r7, #16
     5d8:	46bd      	mov	sp, r7
     5da:	e8bd 4091 	ldmia.w	sp!, {r0, r4, r7, lr}
     5de:	4685      	mov	sp, r0
     5e0:	4770      	bx	lr
     5e2:	bf00      	nop
     5e4:	40011000 	.word	0x40011000
     5e8:	20000174 	.word	0x20000174
     5ec:	20000170 	.word	0x20000170
     5f0:	20000188 	.word	0x20000188
     5f4:	20000180 	.word	0x20000180

000005f8 <set_sysclock>:


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     5f8:	b480      	push	{r7}
     5fa:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC->CR|=RCC_CR_HSEON;
     5fc:	4a18      	ldr	r2, [pc, #96]	; (660 <set_sysclock+0x68>)
     5fe:	4b18      	ldr	r3, [pc, #96]	; (660 <set_sysclock+0x68>)
     600:	681b      	ldr	r3, [r3, #0]
     602:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     606:	6013      	str	r3, [r2, #0]
	 // attend que l'oscillateur soit prêt
   while (!(RCC->CR&RCC_CR_HSERDY));
     608:	bf00      	nop
     60a:	4b15      	ldr	r3, [pc, #84]	; (660 <set_sysclock+0x68>)
     60c:	681b      	ldr	r3, [r3, #0]
     60e:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
     612:	2b00      	cmp	r3, #0
     614:	d0f9      	beq.n	60a <set_sysclock+0x12>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 8 
     // pour une fréquence  Fsysclk de 64 Mhz
    RCC->CFGR|=RCC_CFGR_PLLSRC_HSE|(PLLMUL<<RCC_CFGR_PLLMUL_POS);
     616:	4a12      	ldr	r2, [pc, #72]	; (660 <set_sysclock+0x68>)
     618:	4b11      	ldr	r3, [pc, #68]	; (660 <set_sysclock+0x68>)
     61a:	685b      	ldr	r3, [r3, #4]
     61c:	f443 13c8 	orr.w	r3, r3, #1638400	; 0x190000
     620:	6053      	str	r3, [r2, #4]
    // active le PLL
    RCC->CR|=RCC_CR_PLLON;
     622:	4a0f      	ldr	r2, [pc, #60]	; (660 <set_sysclock+0x68>)
     624:	4b0e      	ldr	r3, [pc, #56]	; (660 <set_sysclock+0x68>)
     626:	681b      	ldr	r3, [r3, #0]
     628:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
     62c:	6013      	str	r3, [r2, #0]
    // Attend que le PLL soit prêt
    while (!(RCC->CR&RCC_CR_PLLRDY));
     62e:	bf00      	nop
     630:	4b0b      	ldr	r3, [pc, #44]	; (660 <set_sysclock+0x68>)
     632:	681b      	ldr	r3, [r3, #0]
     634:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
     638:	2b00      	cmp	r3, #0
     63a:	d0f9      	beq.n	630 <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    // active le prefetch buffer
    FLASH->ACR|=(WAIT_2_CY<<FLASH_ACR_LATENCY_POS)|FLASH_ACR_PRFTBE;
     63c:	4a09      	ldr	r2, [pc, #36]	; (664 <set_sysclock+0x6c>)
     63e:	4b09      	ldr	r3, [pc, #36]	; (664 <set_sysclock+0x6c>)
     640:	681b      	ldr	r3, [r3, #0]
     642:	f043 0312 	orr.w	r3, r3, #18
     646:	6013      	str	r3, [r2, #0]
	// La fréquence maximale pour APB1 doit-être de <=36 Mhz
	// donc divise SYSCLK/2
    // Sélectionne le PLL comme source pour SYSCLK dans CR
	RCC->CFGR|=(RCC_CFGR_PPREx_DIV2<<RCC_CFGR_PPRE1_POS)|(RCC_CFGR_SW_PLL<<RCC_CFGR_SW_POS);
     648:	4a05      	ldr	r2, [pc, #20]	; (660 <set_sysclock+0x68>)
     64a:	4b05      	ldr	r3, [pc, #20]	; (660 <set_sysclock+0x68>)
     64c:	685b      	ldr	r3, [r3, #4]
     64e:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     652:	f043 0302 	orr.w	r3, r3, #2
     656:	6053      	str	r3, [r2, #4]
}
     658:	46bd      	mov	sp, r7
     65a:	f85d 7b04 	ldr.w	r7, [sp], #4
     65e:	4770      	bx	lr
     660:	40021000 	.word	0x40021000
     664:	40022000 	.word	0x40022000

00000668 <copy_blink_in_ram>:
		if (c) break;
	}
}


void copy_blink_in_ram(){
     668:	b480      	push	{r7}
     66a:	b085      	sub	sp, #20
     66c:	af00      	add	r7, sp, #0
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
     66e:	4b0d      	ldr	r3, [pc, #52]	; (6a4 <copy_blink_in_ram+0x3c>)
     670:	60fb      	str	r3, [r7, #12]
	end=(uint32_t*)&_DATA_ROM_START;
     672:	4b0d      	ldr	r3, [pc, #52]	; (6a8 <copy_blink_in_ram+0x40>)
     674:	607b      	str	r3, [r7, #4]
	ram_fn=(uint32_t*)&_TPA_START;
     676:	4b0d      	ldr	r3, [pc, #52]	; (6ac <copy_blink_in_ram+0x44>)
     678:	60bb      	str	r3, [r7, #8]
	while (start<end){
     67a:	e007      	b.n	68c <copy_blink_in_ram+0x24>
		*ram_fn++=*start++;
     67c:	68bb      	ldr	r3, [r7, #8]
     67e:	1d1a      	adds	r2, r3, #4
     680:	60ba      	str	r2, [r7, #8]
     682:	68fa      	ldr	r2, [r7, #12]
     684:	1d11      	adds	r1, r2, #4
     686:	60f9      	str	r1, [r7, #12]
     688:	6812      	ldr	r2, [r2, #0]
     68a:	601a      	str	r2, [r3, #0]
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TPA_START;
	while (start<end){
     68c:	68fa      	ldr	r2, [r7, #12]
     68e:	687b      	ldr	r3, [r7, #4]
     690:	429a      	cmp	r2, r3
     692:	d3f3      	bcc.n	67c <copy_blink_in_ram+0x14>
		*ram_fn++=*start++;
	}
	here=ram_fn;
     694:	4a06      	ldr	r2, [pc, #24]	; (6b0 <copy_blink_in_ram+0x48>)
     696:	68bb      	ldr	r3, [r7, #8]
     698:	6013      	str	r3, [r2, #0]
}
     69a:	3714      	adds	r7, #20
     69c:	46bd      	mov	sp, r7
     69e:	f85d 7b04 	ldr.w	r7, [sp], #4
     6a2:	4770      	bx	lr
     6a4:	00004800 	.word	0x00004800
     6a8:	00004890 	.word	0x00004890
     6ac:	20002800 	.word	0x20002800
     6b0:	20000188 	.word	0x20000188

000006b4 <main>:

extern void print_fault(const char *msg, sfrp_t adr);


void main(void){
     6b4:	b580      	push	{r7, lr}
     6b6:	af00      	add	r7, sp, #0
	set_sysclock();
     6b8:	f7ff ff9e 	bl	5f8 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     6bc:	f06f 000a 	mvn.w	r0, #10
     6c0:	210f      	movs	r1, #15
     6c2:	f002 fa49 	bl	2b58 <set_int_priority>
	config_systicks();
     6c6:	f002 fe85 	bl	33d4 <config_systicks>
	flash_enable();
     6ca:	f001 fa1d 	bl	1b08 <flash_enable>
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
     6ce:	4b27      	ldr	r3, [pc, #156]	; (76c <main+0xb8>)
     6d0:	221d      	movs	r2, #29
     6d2:	619a      	str	r2, [r3, #24]
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
     6d4:	4b25      	ldr	r3, [pc, #148]	; (76c <main+0xb8>)
     6d6:	f44f 4280 	mov.w	r2, #16384	; 0x4000
     6da:	61da      	str	r2, [r3, #28]
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
     6dc:	4a23      	ldr	r2, [pc, #140]	; (76c <main+0xb8>)
     6de:	4b23      	ldr	r3, [pc, #140]	; (76c <main+0xb8>)
     6e0:	695b      	ldr	r3, [r3, #20]
     6e2:	f043 0301 	orr.w	r3, r3, #1
     6e6:	6153      	str	r3, [r2, #20]
	config_pin(LED_PORT,LED_PIN,OUTPUT_OD_SLOW);
     6e8:	4821      	ldr	r0, [pc, #132]	; (770 <main+0xbc>)
     6ea:	210d      	movs	r1, #13
     6ec:	2206      	movs	r2, #6
     6ee:	f001 fe1f 	bl	2330 <config_pin>
	vt_init();
     6f2:	f003 fa09 	bl	3b08 <vt_init>
	keyboard_init();
     6f6:	f001 fec7 	bl	2488 <keyboard_init>
	tvout_init();
     6fa:	f002 feb7 	bl	346c <tvout_init>
	console_init(SERIAL);
     6fe:	2001      	movs	r0, #1
     700:	f000 ff66 	bl	15d0 <console_init>
	if (!vt_ready()){con_select(LOCAL);}
     704:	f003 fa6e 	bl	3be4 <vt_ready>
     708:	4603      	mov	r3, r0
     70a:	2b00      	cmp	r3, #0
     70c:	d102      	bne.n	714 <main+0x60>
     70e:	2000      	movs	r0, #0
     710:	f000 feee 	bl	14f0 <con_select>
	copy_blink_in_ram();
     714:	f7ff ffa8 	bl	668 <copy_blink_in_ram>
	_svc_call(SVC_LED_ON,NUL,NUL);
     718:	2300      	movs	r3, #0
     71a:	2200      	movs	r2, #0
     71c:	4618      	mov	r0, r3
     71e:	4611      	mov	r1, r2
     720:	df01      	svc	1
	print("initializing SDcard\n");
     722:	4814      	ldr	r0, [pc, #80]	; (774 <main+0xc0>)
     724:	f000 ffca 	bl	16bc <print>
	if (sdcard_init()){
     728:	f002 fb88 	bl	2e3c <sdcard_init>
     72c:	4603      	mov	r3, r0
     72e:	2b00      	cmp	r3, #0
     730:	d00d      	beq.n	74e <main+0x9a>
			print("SDcard capacity: ");print_int(sdcard_capacity(),10);print(" Mo\n");
     732:	4811      	ldr	r0, [pc, #68]	; (778 <main+0xc4>)
     734:	f000 ffc2 	bl	16bc <print>
     738:	f002 fa3e 	bl	2bb8 <sdcard_capacity>
     73c:	4603      	mov	r3, r0
     73e:	4618      	mov	r0, r3
     740:	210a      	movs	r1, #10
     742:	f001 f8d9 	bl	18f8 <print_int>
     746:	480d      	ldr	r0, [pc, #52]	; (77c <main+0xc8>)
     748:	f000 ffb8 	bl	16bc <print>
     74c:	e00a      	b.n	764 <main+0xb0>
	}else{
		print("SDcard initialization failed, status code: "); print_hex(sdc_status);conout('\n');
     74e:	480c      	ldr	r0, [pc, #48]	; (780 <main+0xcc>)
     750:	f000 ffb4 	bl	16bc <print>
     754:	4b0b      	ldr	r3, [pc, #44]	; (784 <main+0xd0>)
     756:	881b      	ldrh	r3, [r3, #0]
     758:	4618      	mov	r0, r3
     75a:	f001 f93b 	bl	19d4 <print_hex>
     75e:	200a      	movs	r0, #10
     760:	f000 ff4e 	bl	1600 <conout>
	} 
	ccp();
     764:	f000 fc46 	bl	ff4 <ccp>
}
     768:	bd80      	pop	{r7, pc}
     76a:	bf00      	nop
     76c:	40021000 	.word	0x40021000
     770:	40011000 	.word	0x40011000
     774:	00003c94 	.word	0x00003c94
     778:	00003cac 	.word	0x00003cac
     77c:	00003cc0 	.word	0x00003cc0
     780:	00003cc8 	.word	0x00003cc8
     784:	200001d4 	.word	0x200001d4

00000788 <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     788:	b480      	push	{r7}
     78a:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     78c:	2300      	movs	r3, #0
     78e:	2200      	movs	r2, #0
     790:	4618      	mov	r0, r3
     792:	4611      	mov	r1, r2
     794:	df00      	svc	0
}
     796:	46bd      	mov	sp, r7
     798:	f85d 7b04 	ldr.w	r7, [sp], #4
     79c:	4770      	bx	lr
     79e:	bf00      	nop

000007a0 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     7a0:	b480      	push	{r7}
     7a2:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     7a4:	2300      	movs	r3, #0
     7a6:	2200      	movs	r2, #0
     7a8:	4618      	mov	r0, r3
     7aa:	4611      	mov	r1, r2
     7ac:	df01      	svc	1
}
     7ae:	46bd      	mov	sp, r7
     7b0:	f85d 7b04 	ldr.w	r7, [sp], #4
     7b4:	4770      	bx	lr
     7b6:	bf00      	nop

000007b8 <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     7b8:	b480      	push	{r7}
     7ba:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     7bc:	2300      	movs	r3, #0
     7be:	2200      	movs	r2, #0
     7c0:	4618      	mov	r0, r3
     7c2:	4611      	mov	r1, r2
     7c4:	df02      	svc	2
}
     7c6:	46bd      	mov	sp, r7
     7c8:	f85d 7b04 	ldr.w	r7, [sp], #4
     7cc:	4770      	bx	lr
     7ce:	bf00      	nop

000007d0 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     7d0:	b580      	push	{r7, lr}
     7d2:	b082      	sub	sp, #8
     7d4:	af00      	add	r7, sp, #0
	volatile int n;
	word();
     7d6:	f000 fb95 	bl	f04 <word>
	n=atoi((const char*)pad);
     7da:	4806      	ldr	r0, [pc, #24]	; (7f4 <cmd_set_timer+0x24>)
     7dc:	f001 fcfc 	bl	21d8 <atoi>
     7e0:	4603      	mov	r3, r0
     7e2:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     7e4:	1d3b      	adds	r3, r7, #4
     7e6:	2200      	movs	r2, #0
     7e8:	4618      	mov	r0, r3
     7ea:	4611      	mov	r1, r2
     7ec:	df03      	svc	3
}
     7ee:	3708      	adds	r7, #8
     7f0:	46bd      	mov	sp, r7
     7f2:	bd80      	pop	{r7, pc}
     7f4:	200000e4 	.word	0x200000e4

000007f8 <cmd_get_timer>:

static void cmd_get_timer(){
     7f8:	b480      	push	{r7}
     7fa:	af00      	add	r7, sp, #0
	_svc_call(SVC_GET_TIMER,&pad,NUL);
     7fc:	4b04      	ldr	r3, [pc, #16]	; (810 <cmd_get_timer+0x18>)
     7fe:	2200      	movs	r2, #0
     800:	4618      	mov	r0, r3
     802:	4611      	mov	r1, r2
     804:	df04      	svc	4
}
     806:	46bd      	mov	sp, r7
     808:	f85d 7b04 	ldr.w	r7, [sp], #4
     80c:	4770      	bx	lr
     80e:	bf00      	nop
     810:	200000e4 	.word	0x200000e4

00000814 <cmd_pause>:

// attend l'expiration de la minuterie
static void cmd_pause(){
     814:	b580      	push	{r7, lr}
     816:	b082      	sub	sp, #8
     818:	af00      	add	r7, sp, #0
	volatile unsigned tm;
	word();
     81a:	f000 fb73 	bl	f04 <word>
	tm=atoi((const char*)pad);
     81e:	4806      	ldr	r0, [pc, #24]	; (838 <cmd_pause+0x24>)
     820:	f001 fcda 	bl	21d8 <atoi>
     824:	4603      	mov	r3, r0
     826:	607b      	str	r3, [r7, #4]
	pause(tm);
     828:	687b      	ldr	r3, [r7, #4]
     82a:	4618      	mov	r0, r3
     82c:	f002 fde6 	bl	33fc <pause>
}
     830:	3708      	adds	r7, #8
     832:	46bd      	mov	sp, r7
     834:	bd80      	pop	{r7, pc}
     836:	bf00      	nop
     838:	200000e4 	.word	0x200000e4

0000083c <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     83c:	b480      	push	{r7}
     83e:	b083      	sub	sp, #12
     840:	af00      	add	r7, sp, #0
	volatile char n=0;
     842:	2300      	movs	r3, #0
     844:	71fb      	strb	r3, [r7, #7]
	while (!n){
     846:	e004      	b.n	852 <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     848:	1dfb      	adds	r3, r7, #7
     84a:	2200      	movs	r2, #0
     84c:	4618      	mov	r0, r3
     84e:	4611      	mov	r1, r2
     850:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
	while (!n){
     852:	79fb      	ldrb	r3, [r7, #7]
     854:	b2db      	uxtb	r3, r3
     856:	2b00      	cmp	r3, #0
     858:	d0f6      	beq.n	848 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     85a:	79fb      	ldrb	r3, [r7, #7]
     85c:	b2da      	uxtb	r2, r3
     85e:	4b05      	ldr	r3, [pc, #20]	; (874 <cmd_getc+0x38>)
     860:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     862:	4b04      	ldr	r3, [pc, #16]	; (874 <cmd_getc+0x38>)
     864:	2200      	movs	r2, #0
     866:	705a      	strb	r2, [r3, #1]
}
     868:	370c      	adds	r7, #12
     86a:	46bd      	mov	sp, r7
     86c:	f85d 7b04 	ldr.w	r7, [sp], #4
     870:	4770      	bx	lr
     872:	bf00      	nop
     874:	200000e4 	.word	0x200000e4

00000878 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     878:	b580      	push	{r7, lr}
     87a:	b082      	sub	sp, #8
     87c:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     87e:	f000 fb41 	bl	f04 <word>
	cmd_id=search_command((const char*)pad);
     882:	480a      	ldr	r0, [pc, #40]	; (8ac <cmd_putc+0x34>)
     884:	f000 fa46 	bl	d14 <search_command>
     888:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     88a:	687b      	ldr	r3, [r7, #4]
     88c:	2b00      	cmp	r3, #0
     88e:	db05      	blt.n	89c <cmd_putc+0x24>
     890:	4a07      	ldr	r2, [pc, #28]	; (8b0 <cmd_putc+0x38>)
     892:	687b      	ldr	r3, [r7, #4]
     894:	00db      	lsls	r3, r3, #3
     896:	4413      	add	r3, r2
     898:	685b      	ldr	r3, [r3, #4]
     89a:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     89c:	4b03      	ldr	r3, [pc, #12]	; (8ac <cmd_putc+0x34>)
     89e:	2200      	movs	r2, #0
     8a0:	4618      	mov	r0, r3
     8a2:	4611      	mov	r1, r2
     8a4:	df06      	svc	6
}
     8a6:	3708      	adds	r7, #8
     8a8:	46bd      	mov	sp, r7
     8aa:	bd80      	pop	{r7, pc}
     8ac:	200000e4 	.word	0x200000e4
     8b0:	00003e04 	.word	0x00003e04

000008b4 <cmd_readln>:

static void cmd_readln(){
     8b4:	b580      	push	{r7, lr}
     8b6:	b082      	sub	sp, #8
     8b8:	af00      	add	r7, sp, #0
	unsigned llen=80;
     8ba:	2350      	movs	r3, #80	; 0x50
     8bc:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     8be:	1d3b      	adds	r3, r7, #4
     8c0:	4a04      	ldr	r2, [pc, #16]	; (8d4 <cmd_readln+0x20>)
     8c2:	4618      	mov	r0, r3
     8c4:	4611      	mov	r1, r2
     8c6:	df07      	svc	7
	print((const char*)pad);
     8c8:	4802      	ldr	r0, [pc, #8]	; (8d4 <cmd_readln+0x20>)
     8ca:	f000 fef7 	bl	16bc <print>
}
     8ce:	3708      	adds	r7, #8
     8d0:	46bd      	mov	sp, r7
     8d2:	bd80      	pop	{r7, pc}
     8d4:	200000e4 	.word	0x200000e4

000008d8 <cmd_print>:

static void cmd_print(){
     8d8:	b580      	push	{r7, lr}
     8da:	af00      	add	r7, sp, #0
	word();
     8dc:	f000 fb12 	bl	f04 <word>
	_svc_call(SVC_PRINT,pad,NUL);
     8e0:	4b02      	ldr	r3, [pc, #8]	; (8ec <cmd_print+0x14>)
     8e2:	2200      	movs	r2, #0
     8e4:	4618      	mov	r0, r3
     8e6:	4611      	mov	r1, r2
     8e8:	df08      	svc	8
}
     8ea:	bd80      	pop	{r7, pc}
     8ec:	200000e4 	.word	0x200000e4

000008f0 <cmd_print_dec>:

static void cmd_print_dec(){
     8f0:	b580      	push	{r7, lr}
     8f2:	b082      	sub	sp, #8
     8f4:	af00      	add	r7, sp, #0
	int cmd_id;
    unsigned u32;
    
	word();
     8f6:	f000 fb05 	bl	f04 <word>
	cmd_id=search_command((const char*)pad);
     8fa:	480e      	ldr	r0, [pc, #56]	; (934 <cmd_print_dec+0x44>)
     8fc:	f000 fa0a 	bl	d14 <search_command>
     900:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     902:	687b      	ldr	r3, [r7, #4]
     904:	2b00      	cmp	r3, #0
     906:	db06      	blt.n	916 <cmd_print_dec+0x26>
		 commands[cmd_id].fn();
     908:	4a0b      	ldr	r2, [pc, #44]	; (938 <cmd_print_dec+0x48>)
     90a:	687b      	ldr	r3, [r7, #4]
     90c:	00db      	lsls	r3, r3, #3
     90e:	4413      	add	r3, r2
     910:	685b      	ldr	r3, [r3, #4]
     912:	4798      	blx	r3
     914:	e006      	b.n	924 <cmd_print_dec+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     916:	4807      	ldr	r0, [pc, #28]	; (934 <cmd_print_dec+0x44>)
     918:	f001 fc5e 	bl	21d8 <atoi>
     91c:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     91e:	4a05      	ldr	r2, [pc, #20]	; (934 <cmd_print_dec+0x44>)
     920:	687b      	ldr	r3, [r7, #4]
     922:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_DEC,pad,NUL);
     924:	4b03      	ldr	r3, [pc, #12]	; (934 <cmd_print_dec+0x44>)
     926:	2200      	movs	r2, #0
     928:	4618      	mov	r0, r3
     92a:	4611      	mov	r1, r2
     92c:	df09      	svc	9
}
     92e:	3708      	adds	r7, #8
     930:	46bd      	mov	sp, r7
     932:	bd80      	pop	{r7, pc}
     934:	200000e4 	.word	0x200000e4
     938:	00003e04 	.word	0x00003e04

0000093c <cmd_print_hex>:

static void cmd_print_hex(){
     93c:	b580      	push	{r7, lr}
     93e:	b082      	sub	sp, #8
     940:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     942:	f000 fadf 	bl	f04 <word>
	cmd_id=search_command((const char*)pad);
     946:	480e      	ldr	r0, [pc, #56]	; (980 <cmd_print_hex+0x44>)
     948:	f000 f9e4 	bl	d14 <search_command>
     94c:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1){
     94e:	687b      	ldr	r3, [r7, #4]
     950:	2b00      	cmp	r3, #0
     952:	db06      	blt.n	962 <cmd_print_hex+0x26>
		 commands[cmd_id].fn();
     954:	4a0b      	ldr	r2, [pc, #44]	; (984 <cmd_print_hex+0x48>)
     956:	687b      	ldr	r3, [r7, #4]
     958:	00db      	lsls	r3, r3, #3
     95a:	4413      	add	r3, r2
     95c:	685b      	ldr	r3, [r3, #4]
     95e:	4798      	blx	r3
     960:	e006      	b.n	970 <cmd_print_hex+0x34>
	 }else{
		cmd_id=atoi((const char*)pad);
     962:	4807      	ldr	r0, [pc, #28]	; (980 <cmd_print_hex+0x44>)
     964:	f001 fc38 	bl	21d8 <atoi>
     968:	6078      	str	r0, [r7, #4]
		*(int*)pad=cmd_id;
     96a:	4a05      	ldr	r2, [pc, #20]	; (980 <cmd_print_hex+0x44>)
     96c:	687b      	ldr	r3, [r7, #4]
     96e:	6013      	str	r3, [r2, #0]
	 }
	_svc_call(SVC_PRINT_HEX,pad,NUL);
     970:	4b03      	ldr	r3, [pc, #12]	; (980 <cmd_print_hex+0x44>)
     972:	2200      	movs	r2, #0
     974:	4618      	mov	r0, r3
     976:	4611      	mov	r1, r2
     978:	df0a      	svc	10
}
     97a:	3708      	adds	r7, #8
     97c:	46bd      	mov	sp, r7
     97e:	bd80      	pop	{r7, pc}
     980:	200000e4 	.word	0x200000e4
     984:	00003e04 	.word	0x00003e04

00000988 <cmd_run>:

static void cmd_run(){
     988:	b580      	push	{r7, lr}
     98a:	af00      	add	r7, sp, #0
	((fn)proga)();
     98c:	4b01      	ldr	r3, [pc, #4]	; (994 <cmd_run+0xc>)
     98e:	681b      	ldr	r3, [r3, #0]
     990:	4798      	blx	r3
	
}
     992:	bd80      	pop	{r7, pc}
     994:	20000184 	.word	0x20000184

00000998 <cmd_peek8>:


static void cmd_peek8(){
     998:	b580      	push	{r7, lr}
     99a:	b082      	sub	sp, #8
     99c:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     99e:	f000 fab1 	bl	f04 <word>
	u=atoi((const char*)pad);
     9a2:	4808      	ldr	r0, [pc, #32]	; (9c4 <cmd_peek8+0x2c>)
     9a4:	f001 fc18 	bl	21d8 <atoi>
     9a8:	4603      	mov	r3, r0
     9aa:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK8,&u,NUL);
     9ac:	1d3b      	adds	r3, r7, #4
     9ae:	2200      	movs	r2, #0
     9b0:	4618      	mov	r0, r3
     9b2:	4611      	mov	r1, r2
     9b4:	df0b      	svc	11
	*(uint32_t*)pad=u&0xff;
     9b6:	4a03      	ldr	r2, [pc, #12]	; (9c4 <cmd_peek8+0x2c>)
     9b8:	687b      	ldr	r3, [r7, #4]
     9ba:	b2db      	uxtb	r3, r3
     9bc:	6013      	str	r3, [r2, #0]
}
     9be:	3708      	adds	r7, #8
     9c0:	46bd      	mov	sp, r7
     9c2:	bd80      	pop	{r7, pc}
     9c4:	200000e4 	.word	0x200000e4

000009c8 <cmd_peek16>:

static void cmd_peek16(){
     9c8:	b580      	push	{r7, lr}
     9ca:	b082      	sub	sp, #8
     9cc:	af00      	add	r7, sp, #0
	uint32_t u;
	word();
     9ce:	f000 fa99 	bl	f04 <word>
	u=atoi((const char*)pad);
     9d2:	4808      	ldr	r0, [pc, #32]	; (9f4 <cmd_peek16+0x2c>)
     9d4:	f001 fc00 	bl	21d8 <atoi>
     9d8:	4603      	mov	r3, r0
     9da:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK16,&u,NUL);
     9dc:	1d3b      	adds	r3, r7, #4
     9de:	2200      	movs	r2, #0
     9e0:	4618      	mov	r0, r3
     9e2:	4611      	mov	r1, r2
     9e4:	df0c      	svc	12
	*(uint32_t*)pad=u&0xffff;
     9e6:	4a03      	ldr	r2, [pc, #12]	; (9f4 <cmd_peek16+0x2c>)
     9e8:	687b      	ldr	r3, [r7, #4]
     9ea:	b29b      	uxth	r3, r3
     9ec:	6013      	str	r3, [r2, #0]
}
     9ee:	3708      	adds	r7, #8
     9f0:	46bd      	mov	sp, r7
     9f2:	bd80      	pop	{r7, pc}
     9f4:	200000e4 	.word	0x200000e4

000009f8 <cmd_peek32>:

static void cmd_peek32(){
     9f8:	b580      	push	{r7, lr}
     9fa:	b082      	sub	sp, #8
     9fc:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     9fe:	f000 fa81 	bl	f04 <word>
	u=atoi((const char*)pad);
     a02:	4808      	ldr	r0, [pc, #32]	; (a24 <cmd_peek32+0x2c>)
     a04:	f001 fbe8 	bl	21d8 <atoi>
     a08:	4603      	mov	r3, r0
     a0a:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_PEEK32,&u,NUL);
     a0c:	1d3b      	adds	r3, r7, #4
     a0e:	2200      	movs	r2, #0
     a10:	4618      	mov	r0, r3
     a12:	4611      	mov	r1, r2
     a14:	df0d      	svc	13
	*(uint32_t*)pad=u;
     a16:	4a03      	ldr	r2, [pc, #12]	; (a24 <cmd_peek32+0x2c>)
     a18:	687b      	ldr	r3, [r7, #4]
     a1a:	6013      	str	r3, [r2, #0]
}
     a1c:	3708      	adds	r7, #8
     a1e:	46bd      	mov	sp, r7
     a20:	bd80      	pop	{r7, pc}
     a22:	bf00      	nop
     a24:	200000e4 	.word	0x200000e4

00000a28 <cmd_here>:

static void cmd_here(){
     a28:	b580      	push	{r7, lr}
     a2a:	b082      	sub	sp, #8
     a2c:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     a2e:	f000 fa69 	bl	f04 <word>
	u=atoi((const char*)pad);
     a32:	4808      	ldr	r0, [pc, #32]	; (a54 <cmd_here+0x2c>)
     a34:	f001 fbd0 	bl	21d8 <atoi>
     a38:	4603      	mov	r3, r0
     a3a:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_HERE,&u,NUL);
     a3c:	1d3b      	adds	r3, r7, #4
     a3e:	2200      	movs	r2, #0
     a40:	4618      	mov	r0, r3
     a42:	4611      	mov	r1, r2
     a44:	df15      	svc	21
	*(uint32_t*)pad=u;
     a46:	4a03      	ldr	r2, [pc, #12]	; (a54 <cmd_here+0x2c>)
     a48:	687b      	ldr	r3, [r7, #4]
     a4a:	6013      	str	r3, [r2, #0]
}
     a4c:	3708      	adds	r7, #8
     a4e:	46bd      	mov	sp, r7
     a50:	bd80      	pop	{r7, pc}
     a52:	bf00      	nop
     a54:	200000e4 	.word	0x200000e4

00000a58 <cmd_ffa>:

static void cmd_ffa(){
     a58:	b580      	push	{r7, lr}
     a5a:	b082      	sub	sp, #8
     a5c:	af00      	add	r7, sp, #0
	uint32_t u;
	int i;
	word();
     a5e:	f000 fa51 	bl	f04 <word>
	u=atoi((const char*)pad);
     a62:	4808      	ldr	r0, [pc, #32]	; (a84 <cmd_ffa+0x2c>)
     a64:	f001 fbb8 	bl	21d8 <atoi>
     a68:	4603      	mov	r3, r0
     a6a:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_FFA,&u,NUL);
     a6c:	1d3b      	adds	r3, r7, #4
     a6e:	2200      	movs	r2, #0
     a70:	4618      	mov	r0, r3
     a72:	4611      	mov	r1, r2
     a74:	df16      	svc	22
	*(uint32_t*)pad=u;
     a76:	4a03      	ldr	r2, [pc, #12]	; (a84 <cmd_ffa+0x2c>)
     a78:	687b      	ldr	r3, [r7, #4]
     a7a:	6013      	str	r3, [r2, #0]
}
     a7c:	3708      	adds	r7, #8
     a7e:	46bd      	mov	sp, r7
     a80:	bd80      	pop	{r7, pc}
     a82:	bf00      	nop
     a84:	200000e4 	.word	0x200000e4

00000a88 <cmd_poke8>:

static void cmd_poke8(){
     a88:	b580      	push	{r7, lr}
     a8a:	b082      	sub	sp, #8
     a8c:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint8_t u8;
	word();
     a8e:	f000 fa39 	bl	f04 <word>
	adr=atoi((const char*)pad);
     a92:	480a      	ldr	r0, [pc, #40]	; (abc <cmd_poke8+0x34>)
     a94:	f001 fba0 	bl	21d8 <atoi>
     a98:	4603      	mov	r3, r0
     a9a:	607b      	str	r3, [r7, #4]
	word();
     a9c:	f000 fa32 	bl	f04 <word>
	u8=atoi((const char*)pad);
     aa0:	4806      	ldr	r0, [pc, #24]	; (abc <cmd_poke8+0x34>)
     aa2:	f001 fb99 	bl	21d8 <atoi>
     aa6:	4603      	mov	r3, r0
     aa8:	b2db      	uxtb	r3, r3
     aaa:	70fb      	strb	r3, [r7, #3]
	_svc_call(SVC_POKE8,&adr,&u8);
     aac:	1d3b      	adds	r3, r7, #4
     aae:	1cfa      	adds	r2, r7, #3
     ab0:	4618      	mov	r0, r3
     ab2:	4611      	mov	r1, r2
     ab4:	df0e      	svc	14
}
     ab6:	3708      	adds	r7, #8
     ab8:	46bd      	mov	sp, r7
     aba:	bd80      	pop	{r7, pc}
     abc:	200000e4 	.word	0x200000e4

00000ac0 <cmd_poke16>:

static void cmd_poke16(){
     ac0:	b580      	push	{r7, lr}
     ac2:	b082      	sub	sp, #8
     ac4:	af00      	add	r7, sp, #0
	uint32_t adr;
	uint16_t u16;
	word();
     ac6:	f000 fa1d 	bl	f04 <word>
	adr=atoi((const char*)pad);
     aca:	480a      	ldr	r0, [pc, #40]	; (af4 <cmd_poke16+0x34>)
     acc:	f001 fb84 	bl	21d8 <atoi>
     ad0:	4603      	mov	r3, r0
     ad2:	607b      	str	r3, [r7, #4]
	word();
     ad4:	f000 fa16 	bl	f04 <word>
	u16=atoi((const char*)pad);
     ad8:	4806      	ldr	r0, [pc, #24]	; (af4 <cmd_poke16+0x34>)
     ada:	f001 fb7d 	bl	21d8 <atoi>
     ade:	4603      	mov	r3, r0
     ae0:	b29b      	uxth	r3, r3
     ae2:	807b      	strh	r3, [r7, #2]
	_svc_call(SVC_POKE16,&adr,&u16);
     ae4:	1d3b      	adds	r3, r7, #4
     ae6:	1cba      	adds	r2, r7, #2
     ae8:	4618      	mov	r0, r3
     aea:	4611      	mov	r1, r2
     aec:	df0f      	svc	15
}
     aee:	3708      	adds	r7, #8
     af0:	46bd      	mov	sp, r7
     af2:	bd80      	pop	{r7, pc}
     af4:	200000e4 	.word	0x200000e4

00000af8 <cmd_poke32>:

static void cmd_poke32(){
     af8:	b580      	push	{r7, lr}
     afa:	b082      	sub	sp, #8
     afc:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	
	word();
     afe:	f000 fa01 	bl	f04 <word>
	adr=atoi((const char*)pad);
     b02:	480a      	ldr	r0, [pc, #40]	; (b2c <cmd_poke32+0x34>)
     b04:	f001 fb68 	bl	21d8 <atoi>
     b08:	4603      	mov	r3, r0
     b0a:	607b      	str	r3, [r7, #4]
	word();
     b0c:	f000 f9fa 	bl	f04 <word>
	u32=atoi((const char*)pad);
     b10:	4806      	ldr	r0, [pc, #24]	; (b2c <cmd_poke32+0x34>)
     b12:	f001 fb61 	bl	21d8 <atoi>
     b16:	4603      	mov	r3, r0
     b18:	603b      	str	r3, [r7, #0]
	_svc_call(SVC_POKE32,&adr,&u32);
     b1a:	1d3b      	adds	r3, r7, #4
     b1c:	463a      	mov	r2, r7
     b1e:	4618      	mov	r0, r3
     b20:	4611      	mov	r1, r2
     b22:	df10      	svc	16
}
     b24:	3708      	adds	r7, #8
     b26:	46bd      	mov	sp, r7
     b28:	bd80      	pop	{r7, pc}
     b2a:	bf00      	nop
     b2c:	200000e4 	.word	0x200000e4

00000b30 <cmd_fwrite>:

static void cmd_fwrite(){
     b30:	b580      	push	{r7, lr}
     b32:	b082      	sub	sp, #8
     b34:	af00      	add	r7, sp, #0
	uint32_t adr,u32;
	word();
     b36:	f000 f9e5 	bl	f04 <word>
	adr=atoi((const char*)pad);
     b3a:	4812      	ldr	r0, [pc, #72]	; (b84 <cmd_fwrite+0x54>)
     b3c:	f001 fb4c 	bl	21d8 <atoi>
     b40:	4603      	mov	r3, r0
     b42:	607b      	str	r3, [r7, #4]
	word();
     b44:	f000 f9de 	bl	f04 <word>
	u32=atoi((const char*)pad);
     b48:	480e      	ldr	r0, [pc, #56]	; (b84 <cmd_fwrite+0x54>)
     b4a:	f001 fb45 	bl	21d8 <atoi>
     b4e:	4603      	mov	r3, r0
     b50:	603b      	str	r3, [r7, #0]
	if ((void*)adr>=ffa){
     b52:	687b      	ldr	r3, [r7, #4]
     b54:	461a      	mov	r2, r3
     b56:	4b0c      	ldr	r3, [pc, #48]	; (b88 <cmd_fwrite+0x58>)
     b58:	681b      	ldr	r3, [r3, #0]
     b5a:	429a      	cmp	r2, r3
     b5c:	d30b      	bcc.n	b76 <cmd_fwrite+0x46>
		_svc_call(SVC_FLASH_WR,&adr,&u32);
     b5e:	1d3b      	adds	r3, r7, #4
     b60:	463a      	mov	r2, r7
     b62:	4618      	mov	r0, r3
     b64:	4611      	mov	r1, r2
     b66:	df11      	svc	17
		if (!adr) print(" failed\n");
     b68:	687b      	ldr	r3, [r7, #4]
     b6a:	2b00      	cmp	r3, #0
     b6c:	d106      	bne.n	b7c <cmd_fwrite+0x4c>
     b6e:	4807      	ldr	r0, [pc, #28]	; (b8c <cmd_fwrite+0x5c>)
     b70:	f000 fda4 	bl	16bc <print>
     b74:	e002      	b.n	b7c <cmd_fwrite+0x4c>
	}else{
		print("invalid address\n");
     b76:	4806      	ldr	r0, [pc, #24]	; (b90 <cmd_fwrite+0x60>)
     b78:	f000 fda0 	bl	16bc <print>
	}
}
     b7c:	3708      	adds	r7, #8
     b7e:	46bd      	mov	sp, r7
     b80:	bd80      	pop	{r7, pc}
     b82:	bf00      	nop
     b84:	200000e4 	.word	0x200000e4
     b88:	20000180 	.word	0x20000180
     b8c:	00003d08 	.word	0x00003d08
     b90:	00003d14 	.word	0x00003d14

00000b94 <cmd_pgerase>:

static void cmd_pgerase(){
     b94:	b580      	push	{r7, lr}
     b96:	b082      	sub	sp, #8
     b98:	af00      	add	r7, sp, #0
	uint32_t adr;
	word();
     b9a:	f000 f9b3 	bl	f04 <word>
	adr=atoi((const char*)pad);
     b9e:	480e      	ldr	r0, [pc, #56]	; (bd8 <cmd_pgerase+0x44>)
     ba0:	f001 fb1a 	bl	21d8 <atoi>
     ba4:	4603      	mov	r3, r0
     ba6:	607b      	str	r3, [r7, #4]
	if ((void*)adr>=ffa){
     ba8:	687b      	ldr	r3, [r7, #4]
     baa:	461a      	mov	r2, r3
     bac:	4b0b      	ldr	r3, [pc, #44]	; (bdc <cmd_pgerase+0x48>)
     bae:	681b      	ldr	r3, [r3, #0]
     bb0:	429a      	cmp	r2, r3
     bb2:	d30b      	bcc.n	bcc <cmd_pgerase+0x38>
		_svc_call(SVC_FLASH_PGER,&adr,0);
     bb4:	1d3b      	adds	r3, r7, #4
     bb6:	2200      	movs	r2, #0
     bb8:	4618      	mov	r0, r3
     bba:	4611      	mov	r1, r2
     bbc:	df12      	svc	18
		if (!adr) print(" failed\n");
     bbe:	687b      	ldr	r3, [r7, #4]
     bc0:	2b00      	cmp	r3, #0
     bc2:	d106      	bne.n	bd2 <cmd_pgerase+0x3e>
     bc4:	4806      	ldr	r0, [pc, #24]	; (be0 <cmd_pgerase+0x4c>)
     bc6:	f000 fd79 	bl	16bc <print>
     bca:	e002      	b.n	bd2 <cmd_pgerase+0x3e>
	}else{
		print("invalid address\n");
     bcc:	4805      	ldr	r0, [pc, #20]	; (be4 <cmd_pgerase+0x50>)
     bce:	f000 fd75 	bl	16bc <print>
	}
}
     bd2:	3708      	adds	r7, #8
     bd4:	46bd      	mov	sp, r7
     bd6:	bd80      	pop	{r7, pc}
     bd8:	200000e4 	.word	0x200000e4
     bdc:	20000180 	.word	0x20000180
     be0:	00003d08 	.word	0x00003d08
     be4:	00003d14 	.word	0x00003d14

00000be8 <cmd_ticks>:

static void cmd_ticks(){
     be8:	b480      	push	{r7}
     bea:	af00      	add	r7, sp, #0
	_svc_call(SVC_TICKS,&pad,0);
     bec:	4b04      	ldr	r3, [pc, #16]	; (c00 <cmd_ticks+0x18>)
     bee:	2200      	movs	r2, #0
     bf0:	4618      	mov	r0, r3
     bf2:	4611      	mov	r1, r2
     bf4:	df13      	svc	19
}
     bf6:	46bd      	mov	sp, r7
     bf8:	f85d 7b04 	ldr.w	r7, [sp], #4
     bfc:	4770      	bx	lr
     bfe:	bf00      	nop
     c00:	200000e4 	.word	0x200000e4

00000c04 <cmd_con>:

static void cmd_con(){
     c04:	b580      	push	{r7, lr}
     c06:	b082      	sub	sp, #8
     c08:	af00      	add	r7, sp, #0
	console_dev_t dev;
	word();
     c0a:	f000 f97b 	bl	f04 <word>
	if (!strcmp("local",(const char*)pad)){
     c0e:	4809      	ldr	r0, [pc, #36]	; (c34 <cmd_con+0x30>)
     c10:	4909      	ldr	r1, [pc, #36]	; (c38 <cmd_con+0x34>)
     c12:	f001 fa63 	bl	20dc <strcmp>
     c16:	4603      	mov	r3, r0
     c18:	2b00      	cmp	r3, #0
     c1a:	d102      	bne.n	c22 <cmd_con+0x1e>
		dev=LOCAL;
     c1c:	2300      	movs	r3, #0
     c1e:	71fb      	strb	r3, [r7, #7]
     c20:	e001      	b.n	c26 <cmd_con+0x22>
	}else{
		dev=SERIAL;
     c22:	2301      	movs	r3, #1
     c24:	71fb      	strb	r3, [r7, #7]
	}
	con_select(dev);
     c26:	79fb      	ldrb	r3, [r7, #7]
     c28:	4618      	mov	r0, r3
     c2a:	f000 fc61 	bl	14f0 <con_select>
}
     c2e:	3708      	adds	r7, #8
     c30:	46bd      	mov	sp, r7
     c32:	bd80      	pop	{r7, pc}
     c34:	00003d28 	.word	0x00003d28
     c38:	200000e4 	.word	0x200000e4

00000c3c <cmd_cls>:

void cmd_cls(){
     c3c:	b480      	push	{r7}
     c3e:	af00      	add	r7, sp, #0
	_svc_call(SVC_CLS,0,0);
     c40:	2300      	movs	r3, #0
     c42:	2200      	movs	r2, #0
     c44:	4618      	mov	r0, r3
     c46:	4611      	mov	r1, r2
     c48:	df14      	svc	20
}
     c4a:	46bd      	mov	sp, r7
     c4c:	f85d 7b04 	ldr.w	r7, [sp], #4
     c50:	4770      	bx	lr
     c52:	bf00      	nop

00000c54 <cmd_help>:

void cmd_help(){
     c54:	b580      	push	{r7, lr}
     c56:	b082      	sub	sp, #8
     c58:	af00      	add	r7, sp, #0
	const char *str;
	int i=0;
     c5a:	2300      	movs	r3, #0
     c5c:	603b      	str	r3, [r7, #0]
	print("commands list:\n");
     c5e:	4816      	ldr	r0, [pc, #88]	; (cb8 <cmd_help+0x64>)
     c60:	f000 fd2c 	bl	16bc <print>
	str=commands[i].name;
     c64:	4a15      	ldr	r2, [pc, #84]	; (cbc <cmd_help+0x68>)
     c66:	683b      	ldr	r3, [r7, #0]
     c68:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     c6c:	607b      	str	r3, [r7, #4]
	while (str){
     c6e:	e01d      	b.n	cac <cmd_help+0x58>
		print(str);
     c70:	6878      	ldr	r0, [r7, #4]
     c72:	f000 fd23 	bl	16bc <print>
		conout('\t');
     c76:	2009      	movs	r0, #9
     c78:	f000 fcc2 	bl	1600 <conout>
		i++;
     c7c:	683b      	ldr	r3, [r7, #0]
     c7e:	3301      	adds	r3, #1
     c80:	603b      	str	r3, [r7, #0]
		if (!(i%6)) {conout('\n');}
     c82:	6839      	ldr	r1, [r7, #0]
     c84:	4b0e      	ldr	r3, [pc, #56]	; (cc0 <cmd_help+0x6c>)
     c86:	fb83 3201 	smull	r3, r2, r3, r1
     c8a:	17cb      	asrs	r3, r1, #31
     c8c:	1ad2      	subs	r2, r2, r3
     c8e:	4613      	mov	r3, r2
     c90:	005b      	lsls	r3, r3, #1
     c92:	4413      	add	r3, r2
     c94:	005b      	lsls	r3, r3, #1
     c96:	1aca      	subs	r2, r1, r3
     c98:	2a00      	cmp	r2, #0
     c9a:	d102      	bne.n	ca2 <cmd_help+0x4e>
     c9c:	200a      	movs	r0, #10
     c9e:	f000 fcaf 	bl	1600 <conout>
		str=commands[i].name;	
     ca2:	4a06      	ldr	r2, [pc, #24]	; (cbc <cmd_help+0x68>)
     ca4:	683b      	ldr	r3, [r7, #0]
     ca6:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     caa:	607b      	str	r3, [r7, #4]
void cmd_help(){
	const char *str;
	int i=0;
	print("commands list:\n");
	str=commands[i].name;
	while (str){
     cac:	687b      	ldr	r3, [r7, #4]
     cae:	2b00      	cmp	r3, #0
     cb0:	d1de      	bne.n	c70 <cmd_help+0x1c>
		conout('\t');
		i++;
		if (!(i%6)) {conout('\n');}
		str=commands[i].name;	
	}
}
     cb2:	3708      	adds	r7, #8
     cb4:	46bd      	mov	sp, r7
     cb6:	bd80      	pop	{r7, pc}
     cb8:	00003d30 	.word	0x00003d30
     cbc:	00003e04 	.word	0x00003e04
     cc0:	2aaaaaab 	.word	0x2aaaaaab

00000cc4 <cmd_rect>:

void cmd_rect(){
     cc4:	b580      	push	{r7, lr}
     cc6:	b086      	sub	sp, #24
     cc8:	af02      	add	r7, sp, #8
	int x,y,w,h;
	word();
     cca:	f000 f91b 	bl	f04 <word>
	x=atoi((const char*)pad);
     cce:	4810      	ldr	r0, [pc, #64]	; (d10 <cmd_rect+0x4c>)
     cd0:	f001 fa82 	bl	21d8 <atoi>
     cd4:	60f8      	str	r0, [r7, #12]
	word();
     cd6:	f000 f915 	bl	f04 <word>
	y=atoi((const char*)pad);
     cda:	480d      	ldr	r0, [pc, #52]	; (d10 <cmd_rect+0x4c>)
     cdc:	f001 fa7c 	bl	21d8 <atoi>
     ce0:	60b8      	str	r0, [r7, #8]
	word();
     ce2:	f000 f90f 	bl	f04 <word>
	w=atoi((const char*)pad);
     ce6:	480a      	ldr	r0, [pc, #40]	; (d10 <cmd_rect+0x4c>)
     ce8:	f001 fa76 	bl	21d8 <atoi>
     cec:	6078      	str	r0, [r7, #4]
	word();
     cee:	f000 f909 	bl	f04 <word>
	h=atoi((const char*)pad);
     cf2:	4807      	ldr	r0, [pc, #28]	; (d10 <cmd_rect+0x4c>)
     cf4:	f001 fa70 	bl	21d8 <atoi>
     cf8:	6038      	str	r0, [r7, #0]
	gdi_rect(x,y,w,h,WHITE_BIT);		
     cfa:	2301      	movs	r3, #1
     cfc:	9300      	str	r3, [sp, #0]
     cfe:	68f8      	ldr	r0, [r7, #12]
     d00:	68b9      	ldr	r1, [r7, #8]
     d02:	687a      	ldr	r2, [r7, #4]
     d04:	683b      	ldr	r3, [r7, #0]
     d06:	f001 f9a1 	bl	204c <gdi_rect>
}
     d0a:	3710      	adds	r7, #16
     d0c:	46bd      	mov	sp, r7
     d0e:	bd80      	pop	{r7, pc}
     d10:	200000e4 	.word	0x200000e4

00000d14 <search_command>:
	{"ffa",cmd_ffa},
	{NUL,NUL}
};


int search_command(const char * name){
     d14:	b580      	push	{r7, lr}
     d16:	b084      	sub	sp, #16
     d18:	af00      	add	r7, sp, #0
     d1a:	6078      	str	r0, [r7, #4]
	int i=0;
     d1c:	2300      	movs	r3, #0
     d1e:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     d20:	e00e      	b.n	d40 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     d22:	4a12      	ldr	r2, [pc, #72]	; (d6c <search_command+0x58>)
     d24:	68fb      	ldr	r3, [r7, #12]
     d26:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     d2a:	4618      	mov	r0, r3
     d2c:	6879      	ldr	r1, [r7, #4]
     d2e:	f001 f9d5 	bl	20dc <strcmp>
     d32:	4603      	mov	r3, r0
     d34:	2b00      	cmp	r3, #0
     d36:	d100      	bne.n	d3a <search_command+0x26>
			break;
     d38:	e009      	b.n	d4e <search_command+0x3a>
		}
		i++;
     d3a:	68fb      	ldr	r3, [r7, #12]
     d3c:	3301      	adds	r3, #1
     d3e:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     d40:	4a0a      	ldr	r2, [pc, #40]	; (d6c <search_command+0x58>)
     d42:	68fb      	ldr	r3, [r7, #12]
     d44:	00db      	lsls	r3, r3, #3
     d46:	4413      	add	r3, r2
     d48:	685b      	ldr	r3, [r3, #4]
     d4a:	2b00      	cmp	r3, #0
     d4c:	d1e9      	bne.n	d22 <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     d4e:	4a07      	ldr	r2, [pc, #28]	; (d6c <search_command+0x58>)
     d50:	68fb      	ldr	r3, [r7, #12]
     d52:	00db      	lsls	r3, r3, #3
     d54:	4413      	add	r3, r2
     d56:	685b      	ldr	r3, [r3, #4]
     d58:	2b00      	cmp	r3, #0
     d5a:	d102      	bne.n	d62 <search_command+0x4e>
     d5c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     d60:	60fb      	str	r3, [r7, #12]
	return i;
     d62:	68fb      	ldr	r3, [r7, #12]
}
     d64:	4618      	mov	r0, r3
     d66:	3710      	adds	r7, #16
     d68:	46bd      	mov	sp, r7
     d6a:	bd80      	pop	{r7, pc}
     d6c:	00003e04 	.word	0x00003e04

00000d70 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     d70:	b480      	push	{r7}
     d72:	b085      	sub	sp, #20
     d74:	af00      	add	r7, sp, #0
     d76:	60f8      	str	r0, [r7, #12]
     d78:	60b9      	str	r1, [r7, #8]
     d7a:	4613      	mov	r3, r2
     d7c:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     d7e:	e002      	b.n	d86 <skip+0x16>
     d80:	68bb      	ldr	r3, [r7, #8]
     d82:	3301      	adds	r3, #1
     d84:	60bb      	str	r3, [r7, #8]
     d86:	68bb      	ldr	r3, [r7, #8]
     d88:	68fa      	ldr	r2, [r7, #12]
     d8a:	4413      	add	r3, r2
     d8c:	781b      	ldrb	r3, [r3, #0]
     d8e:	2b00      	cmp	r3, #0
     d90:	d006      	beq.n	da0 <skip+0x30>
     d92:	68bb      	ldr	r3, [r7, #8]
     d94:	68fa      	ldr	r2, [r7, #12]
     d96:	4413      	add	r3, r2
     d98:	781b      	ldrb	r3, [r3, #0]
     d9a:	79fa      	ldrb	r2, [r7, #7]
     d9c:	429a      	cmp	r2, r3
     d9e:	d0ef      	beq.n	d80 <skip+0x10>
	return start;
     da0:	68bb      	ldr	r3, [r7, #8]
}
     da2:	4618      	mov	r0, r3
     da4:	3714      	adds	r7, #20
     da6:	46bd      	mov	sp, r7
     da8:	f85d 7b04 	ldr.w	r7, [sp], #4
     dac:	4770      	bx	lr
     dae:	bf00      	nop

00000db0 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     db0:	b480      	push	{r7}
     db2:	b085      	sub	sp, #20
     db4:	af00      	add	r7, sp, #0
     db6:	60f8      	str	r0, [r7, #12]
     db8:	60b9      	str	r1, [r7, #8]
     dba:	4613      	mov	r3, r2
     dbc:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     dbe:	e002      	b.n	dc6 <scan+0x16>
     dc0:	68bb      	ldr	r3, [r7, #8]
     dc2:	3301      	adds	r3, #1
     dc4:	60bb      	str	r3, [r7, #8]
     dc6:	68bb      	ldr	r3, [r7, #8]
     dc8:	68fa      	ldr	r2, [r7, #12]
     dca:	4413      	add	r3, r2
     dcc:	781b      	ldrb	r3, [r3, #0]
     dce:	2b00      	cmp	r3, #0
     dd0:	d006      	beq.n	de0 <scan+0x30>
     dd2:	68bb      	ldr	r3, [r7, #8]
     dd4:	68fa      	ldr	r2, [r7, #12]
     dd6:	4413      	add	r3, r2
     dd8:	781b      	ldrb	r3, [r3, #0]
     dda:	79fa      	ldrb	r2, [r7, #7]
     ddc:	429a      	cmp	r2, r3
     dde:	d1ef      	bne.n	dc0 <scan+0x10>
	return start;
     de0:	68bb      	ldr	r3, [r7, #8]
}
     de2:	4618      	mov	r0, r3
     de4:	3714      	adds	r7, #20
     de6:	46bd      	mov	sp, r7
     de8:	f85d 7b04 	ldr.w	r7, [sp], #4
     dec:	4770      	bx	lr
     dee:	bf00      	nop

00000df0 <quote>:

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
     df0:	b480      	push	{r7}
     df2:	b087      	sub	sp, #28
     df4:	af00      	add	r7, sp, #0
     df6:	6078      	str	r0, [r7, #4]
     df8:	6039      	str	r1, [r7, #0]
	int escaped=0,end=start, i=0, in_quote=1;;
     dfa:	2300      	movs	r3, #0
     dfc:	617b      	str	r3, [r7, #20]
     dfe:	683b      	ldr	r3, [r7, #0]
     e00:	613b      	str	r3, [r7, #16]
     e02:	2300      	movs	r3, #0
     e04:	60fb      	str	r3, [r7, #12]
     e06:	2301      	movs	r3, #1
     e08:	60bb      	str	r3, [r7, #8]
	while (buffer[end]&& in_quote){
     e0a:	e040      	b.n	e8e <quote+0x9e>
		switch (buffer[end]){
     e0c:	693b      	ldr	r3, [r7, #16]
     e0e:	687a      	ldr	r2, [r7, #4]
     e10:	4413      	add	r3, r2
     e12:	781b      	ldrb	r3, [r3, #0]
     e14:	2b5c      	cmp	r3, #92	; 0x5c
     e16:	d012      	beq.n	e3e <quote+0x4e>
     e18:	2b6e      	cmp	r3, #110	; 0x6e
     e1a:	d022      	beq.n	e62 <quote+0x72>
     e1c:	2b22      	cmp	r3, #34	; 0x22
     e1e:	d128      	bne.n	e72 <quote+0x82>
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     e20:	697b      	ldr	r3, [r7, #20]
     e22:	2b00      	cmp	r3, #0
     e24:	d102      	bne.n	e2c <quote+0x3c>
     e26:	2300      	movs	r3, #0
     e28:	60bb      	str	r3, [r7, #8]
			break;
     e2a:	e02d      	b.n	e88 <quote+0x98>
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
     e2c:	68fb      	ldr	r3, [r7, #12]
     e2e:	1c5a      	adds	r2, r3, #1
     e30:	60fa      	str	r2, [r7, #12]
     e32:	4a21      	ldr	r2, [pc, #132]	; (eb8 <quote+0xc8>)
     e34:	2122      	movs	r1, #34	; 0x22
     e36:	54d1      	strb	r1, [r2, r3]
     e38:	2300      	movs	r3, #0
     e3a:	617b      	str	r3, [r7, #20]
			break;
     e3c:	e024      	b.n	e88 <quote+0x98>
		case '\\':
			if (!escaped){
     e3e:	697b      	ldr	r3, [r7, #20]
     e40:	2b00      	cmp	r3, #0
     e42:	d102      	bne.n	e4a <quote+0x5a>
				escaped=1;
     e44:	2301      	movs	r3, #1
     e46:	617b      	str	r3, [r7, #20]
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
     e48:	e01e      	b.n	e88 <quote+0x98>
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
     e4a:	2300      	movs	r3, #0
     e4c:	617b      	str	r3, [r7, #20]
				pad[i++]=buffer[end];
     e4e:	68fb      	ldr	r3, [r7, #12]
     e50:	1c5a      	adds	r2, r3, #1
     e52:	60fa      	str	r2, [r7, #12]
     e54:	693a      	ldr	r2, [r7, #16]
     e56:	6879      	ldr	r1, [r7, #4]
     e58:	440a      	add	r2, r1
     e5a:	7811      	ldrb	r1, [r2, #0]
     e5c:	4a16      	ldr	r2, [pc, #88]	; (eb8 <quote+0xc8>)
     e5e:	54d1      	strb	r1, [r2, r3]
			}
			break;
     e60:	e012      	b.n	e88 <quote+0x98>
		case 'n':
			if (escaped) buffer[end]=CR;
     e62:	697b      	ldr	r3, [r7, #20]
     e64:	2b00      	cmp	r3, #0
     e66:	d004      	beq.n	e72 <quote+0x82>
     e68:	693b      	ldr	r3, [r7, #16]
     e6a:	687a      	ldr	r2, [r7, #4]
     e6c:	4413      	add	r3, r2
     e6e:	220d      	movs	r2, #13
     e70:	701a      	strb	r2, [r3, #0]
		default:
			escaped=0;
     e72:	2300      	movs	r3, #0
     e74:	617b      	str	r3, [r7, #20]
			pad[i++]=buffer[end];
     e76:	68fb      	ldr	r3, [r7, #12]
     e78:	1c5a      	adds	r2, r3, #1
     e7a:	60fa      	str	r2, [r7, #12]
     e7c:	693a      	ldr	r2, [r7, #16]
     e7e:	6879      	ldr	r1, [r7, #4]
     e80:	440a      	add	r2, r1
     e82:	7811      	ldrb	r1, [r2, #0]
     e84:	4a0c      	ldr	r2, [pc, #48]	; (eb8 <quote+0xc8>)
     e86:	54d1      	strb	r1, [r2, r3]
		}
		end++;
     e88:	693b      	ldr	r3, [r7, #16]
     e8a:	3301      	adds	r3, #1
     e8c:	613b      	str	r3, [r7, #16]

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
     e8e:	693b      	ldr	r3, [r7, #16]
     e90:	687a      	ldr	r2, [r7, #4]
     e92:	4413      	add	r3, r2
     e94:	781b      	ldrb	r3, [r3, #0]
     e96:	2b00      	cmp	r3, #0
     e98:	d002      	beq.n	ea0 <quote+0xb0>
     e9a:	68bb      	ldr	r3, [r7, #8]
     e9c:	2b00      	cmp	r3, #0
     e9e:	d1b5      	bne.n	e0c <quote+0x1c>
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
     ea0:	4a05      	ldr	r2, [pc, #20]	; (eb8 <quote+0xc8>)
     ea2:	68fb      	ldr	r3, [r7, #12]
     ea4:	4413      	add	r3, r2
     ea6:	2200      	movs	r2, #0
     ea8:	701a      	strb	r2, [r3, #0]
	return end;
     eaa:	693b      	ldr	r3, [r7, #16]
}
     eac:	4618      	mov	r0, r3
     eae:	371c      	adds	r7, #28
     eb0:	46bd      	mov	sp, r7
     eb2:	f85d 7b04 	ldr.w	r7, [sp], #4
     eb6:	4770      	bx	lr
     eb8:	200000e4 	.word	0x200000e4

00000ebc <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     ebc:	b480      	push	{r7}
     ebe:	b087      	sub	sp, #28
     ec0:	af00      	add	r7, sp, #0
     ec2:	60f8      	str	r0, [r7, #12]
     ec4:	60b9      	str	r1, [r7, #8]
     ec6:	4613      	mov	r3, r2
     ec8:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     eca:	68bb      	ldr	r3, [r7, #8]
     ecc:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     ece:	e002      	b.n	ed6 <next+0x1a>
     ed0:	697b      	ldr	r3, [r7, #20]
     ed2:	3301      	adds	r3, #1
     ed4:	617b      	str	r3, [r7, #20]
     ed6:	697b      	ldr	r3, [r7, #20]
     ed8:	68fa      	ldr	r2, [r7, #12]
     eda:	4413      	add	r3, r2
     edc:	781b      	ldrb	r3, [r3, #0]
     ede:	2b00      	cmp	r3, #0
     ee0:	d006      	beq.n	ef0 <next+0x34>
     ee2:	697b      	ldr	r3, [r7, #20]
     ee4:	68fa      	ldr	r2, [r7, #12]
     ee6:	4413      	add	r3, r2
     ee8:	781b      	ldrb	r3, [r3, #0]
     eea:	79fa      	ldrb	r2, [r7, #7]
     eec:	429a      	cmp	r2, r3
     eee:	d1ef      	bne.n	ed0 <next+0x14>
	return end-start;
     ef0:	697a      	ldr	r2, [r7, #20]
     ef2:	68bb      	ldr	r3, [r7, #8]
     ef4:	1ad3      	subs	r3, r2, r3
}
     ef6:	4618      	mov	r0, r3
     ef8:	371c      	adds	r7, #28
     efa:	46bd      	mov	sp, r7
     efc:	f85d 7b04 	ldr.w	r7, [sp], #4
     f00:	4770      	bx	lr
     f02:	bf00      	nop

00000f04 <word>:

// extrait le prochain mot du tib
static void word(){
     f04:	b580      	push	{r7, lr}
     f06:	b082      	sub	sp, #8
     f08:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     f0a:	4b1d      	ldr	r3, [pc, #116]	; (f80 <word+0x7c>)
     f0c:	681b      	ldr	r3, [r3, #0]
     f0e:	481d      	ldr	r0, [pc, #116]	; (f84 <word+0x80>)
     f10:	4619      	mov	r1, r3
     f12:	2220      	movs	r2, #32
     f14:	f7ff ff2c 	bl	d70 <skip>
     f18:	4603      	mov	r3, r0
     f1a:	461a      	mov	r2, r3
     f1c:	4b18      	ldr	r3, [pc, #96]	; (f80 <word+0x7c>)
     f1e:	601a      	str	r2, [r3, #0]
		if (tib[in]=='"'){
     f20:	4b17      	ldr	r3, [pc, #92]	; (f80 <word+0x7c>)
     f22:	681b      	ldr	r3, [r3, #0]
     f24:	4a17      	ldr	r2, [pc, #92]	; (f84 <word+0x80>)
     f26:	5cd3      	ldrb	r3, [r2, r3]
     f28:	2b22      	cmp	r3, #34	; 0x22
     f2a:	d10f      	bne.n	f4c <word+0x48>
			in++;
     f2c:	4b14      	ldr	r3, [pc, #80]	; (f80 <word+0x7c>)
     f2e:	681b      	ldr	r3, [r3, #0]
     f30:	3301      	adds	r3, #1
     f32:	4a13      	ldr	r2, [pc, #76]	; (f80 <word+0x7c>)
     f34:	6013      	str	r3, [r2, #0]
			in=quote(tib,in);
     f36:	4b12      	ldr	r3, [pc, #72]	; (f80 <word+0x7c>)
     f38:	681b      	ldr	r3, [r3, #0]
     f3a:	4812      	ldr	r0, [pc, #72]	; (f84 <word+0x80>)
     f3c:	4619      	mov	r1, r3
     f3e:	f7ff ff57 	bl	df0 <quote>
     f42:	4603      	mov	r3, r0
     f44:	461a      	mov	r2, r3
     f46:	4b0e      	ldr	r3, [pc, #56]	; (f80 <word+0x7c>)
     f48:	601a      	str	r2, [r3, #0]
     f4a:	e016      	b.n	f7a <word+0x76>
		}else{
			len=next(tib,in,SPACE);
     f4c:	4b0c      	ldr	r3, [pc, #48]	; (f80 <word+0x7c>)
     f4e:	681b      	ldr	r3, [r3, #0]
     f50:	480c      	ldr	r0, [pc, #48]	; (f84 <word+0x80>)
     f52:	4619      	mov	r1, r3
     f54:	2220      	movs	r2, #32
     f56:	f7ff ffb1 	bl	ebc <next>
     f5a:	6078      	str	r0, [r7, #4]
			move(&tib[in],(char*)pad,len);
     f5c:	4b08      	ldr	r3, [pc, #32]	; (f80 <word+0x7c>)
     f5e:	681b      	ldr	r3, [r3, #0]
     f60:	4a08      	ldr	r2, [pc, #32]	; (f84 <word+0x80>)
     f62:	4413      	add	r3, r2
     f64:	4618      	mov	r0, r3
     f66:	4908      	ldr	r1, [pc, #32]	; (f88 <word+0x84>)
     f68:	687a      	ldr	r2, [r7, #4]
     f6a:	f001 f9ab 	bl	22c4 <move>
			in+=len;
     f6e:	4b04      	ldr	r3, [pc, #16]	; (f80 <word+0x7c>)
     f70:	681a      	ldr	r2, [r3, #0]
     f72:	687b      	ldr	r3, [r7, #4]
     f74:	4413      	add	r3, r2
     f76:	4a02      	ldr	r2, [pc, #8]	; (f80 <word+0x7c>)
     f78:	6013      	str	r3, [r2, #0]
		}
}
     f7a:	3708      	adds	r7, #8
     f7c:	46bd      	mov	sp, r7
     f7e:	bd80      	pop	{r7, pc}
     f80:	20000134 	.word	0x20000134
     f84:	20000094 	.word	0x20000094
     f88:	200000e4 	.word	0x200000e4

00000f8c <parse_line>:

static void parse_line(unsigned llen){
     f8c:	b580      	push	{r7, lr}
     f8e:	b084      	sub	sp, #16
     f90:	af00      	add	r7, sp, #0
     f92:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     f94:	4b14      	ldr	r3, [pc, #80]	; (fe8 <parse_line+0x5c>)
     f96:	2200      	movs	r2, #0
     f98:	601a      	str	r2, [r3, #0]
	while (in<llen){
     f9a:	e019      	b.n	fd0 <parse_line+0x44>
		word();
     f9c:	f7ff ffb2 	bl	f04 <word>
		cmd_id=search_command((const char*) pad);
     fa0:	4812      	ldr	r0, [pc, #72]	; (fec <parse_line+0x60>)
     fa2:	f7ff feb7 	bl	d14 <search_command>
     fa6:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     fa8:	68fb      	ldr	r3, [r7, #12]
     faa:	2b00      	cmp	r3, #0
     fac:	db06      	blt.n	fbc <parse_line+0x30>
			commands[cmd_id].fn();
     fae:	4a10      	ldr	r2, [pc, #64]	; (ff0 <parse_line+0x64>)
     fb0:	68fb      	ldr	r3, [r7, #12]
     fb2:	00db      	lsls	r3, r3, #3
     fb4:	4413      	add	r3, r2
     fb6:	685b      	ldr	r3, [r3, #4]
     fb8:	4798      	blx	r3
     fba:	e009      	b.n	fd0 <parse_line+0x44>
		}else{
			conout(CR);
     fbc:	200d      	movs	r0, #13
     fbe:	f000 fb1f 	bl	1600 <conout>
			print((const char*)pad); conout('?');
     fc2:	480a      	ldr	r0, [pc, #40]	; (fec <parse_line+0x60>)
     fc4:	f000 fb7a 	bl	16bc <print>
     fc8:	203f      	movs	r0, #63	; 0x3f
     fca:	f000 fb19 	bl	1600 <conout>
			break;
     fce:	e004      	b.n	fda <parse_line+0x4e>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     fd0:	4b05      	ldr	r3, [pc, #20]	; (fe8 <parse_line+0x5c>)
     fd2:	681a      	ldr	r2, [r3, #0]
     fd4:	687b      	ldr	r3, [r7, #4]
     fd6:	429a      	cmp	r2, r3
     fd8:	d3e0      	bcc.n	f9c <parse_line+0x10>
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     fda:	200d      	movs	r0, #13
     fdc:	f000 fb10 	bl	1600 <conout>
}
     fe0:	3710      	adds	r7, #16
     fe2:	46bd      	mov	sp, r7
     fe4:	bd80      	pop	{r7, pc}
     fe6:	bf00      	nop
     fe8:	20000134 	.word	0x20000134
     fec:	200000e4 	.word	0x200000e4
     ff0:	00003e04 	.word	0x00003e04

00000ff4 <ccp>:


void ccp(){
     ff4:	b580      	push	{r7, lr}
     ff6:	b082      	sub	sp, #8
     ff8:	af00      	add	r7, sp, #0
	unsigned llen;

	cls();
     ffa:	f000 fd4d 	bl	1a98 <cls>
	print(VERSION);
     ffe:	4b08      	ldr	r3, [pc, #32]	; (1020 <ccp+0x2c>)
    1000:	681b      	ldr	r3, [r3, #0]
    1002:	4618      	mov	r0, r3
    1004:	f000 fb5a 	bl	16bc <print>
	while (1){
		conout('>');
    1008:	203e      	movs	r0, #62	; 0x3e
    100a:	f000 faf9 	bl	1600 <conout>
		llen=read_line(tib,CMD_MAX_LEN);
    100e:	4805      	ldr	r0, [pc, #20]	; (1024 <ccp+0x30>)
    1010:	2150      	movs	r1, #80	; 0x50
    1012:	f000 fb89 	bl	1728 <read_line>
    1016:	6078      	str	r0, [r7, #4]
		parse_line(llen);
    1018:	6878      	ldr	r0, [r7, #4]
    101a:	f7ff ffb7 	bl	f8c <parse_line>
	}
    101e:	e7f3      	b.n	1008 <ccp+0x14>
    1020:	20000004 	.word	0x20000004
    1024:	20000094 	.word	0x20000094

00001028 <cursor_home>:
static int screen_width, screen_height;

static int cursor_visible=0;
static int cursor_blink=0;

static void cursor_home(){
    1028:	b480      	push	{r7}
    102a:	af00      	add	r7, sp, #0
	cursor_x=0;
    102c:	4b04      	ldr	r3, [pc, #16]	; (1040 <cursor_home+0x18>)
    102e:	2200      	movs	r2, #0
    1030:	601a      	str	r2, [r3, #0]
	cursor_y=0;
    1032:	4b04      	ldr	r3, [pc, #16]	; (1044 <cursor_home+0x1c>)
    1034:	2200      	movs	r2, #0
    1036:	601a      	str	r2, [r3, #0]
}
    1038:	46bd      	mov	sp, r7
    103a:	f85d 7b04 	ldr.w	r7, [sp], #4
    103e:	4770      	bx	lr
    1040:	20000138 	.word	0x20000138
    1044:	2000013c 	.word	0x2000013c

00001048 <local_hide_cursor>:

/**************************
 * fonctions console locale
 *************************/
 
static void local_hide_cursor(){
    1048:	b580      	push	{r7, lr}
    104a:	b082      	sub	sp, #8
    104c:	af02      	add	r7, sp, #8
	if (cursor_visible){
    104e:	4b0f      	ldr	r3, [pc, #60]	; (108c <local_hide_cursor+0x44>)
    1050:	681b      	ldr	r3, [r3, #0]
    1052:	2b00      	cmp	r3, #0
    1054:	d017      	beq.n	1086 <local_hide_cursor+0x3e>
		disable_interrupt(IRQ_CURSOR_BLINK);
    1056:	201e      	movs	r0, #30
    1058:	f001 fce6 	bl	2a28 <disable_interrupt>
		gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    105c:	4b0c      	ldr	r3, [pc, #48]	; (1090 <local_hide_cursor+0x48>)
    105e:	681a      	ldr	r2, [r3, #0]
    1060:	4613      	mov	r3, r2
    1062:	005b      	lsls	r3, r3, #1
    1064:	4413      	add	r3, r2
    1066:	005b      	lsls	r3, r3, #1
    1068:	4619      	mov	r1, r3
    106a:	4b0a      	ldr	r3, [pc, #40]	; (1094 <local_hide_cursor+0x4c>)
    106c:	681b      	ldr	r3, [r3, #0]
    106e:	00da      	lsls	r2, r3, #3
    1070:	2300      	movs	r3, #0
    1072:	9300      	str	r3, [sp, #0]
    1074:	4608      	mov	r0, r1
    1076:	4611      	mov	r1, r2
    1078:	2206      	movs	r2, #6
    107a:	2308      	movs	r3, #8
    107c:	f000 fec2 	bl	1e04 <gdi_box>
		cursor_visible=0;
    1080:	4b02      	ldr	r3, [pc, #8]	; (108c <local_hide_cursor+0x44>)
    1082:	2200      	movs	r2, #0
    1084:	601a      	str	r2, [r3, #0]
	}
}
    1086:	46bd      	mov	sp, r7
    1088:	bd80      	pop	{r7, pc}
    108a:	bf00      	nop
    108c:	20000148 	.word	0x20000148
    1090:	20000138 	.word	0x20000138
    1094:	2000013c 	.word	0x2000013c

00001098 <local_crlf>:

// avance le curseur texte au début 
// de la ligne suivante.
static void local_crlf(){
    1098:	b580      	push	{r7, lr}
    109a:	af00      	add	r7, sp, #0
	local_hide_cursor();
    109c:	f7ff ffd4 	bl	1048 <local_hide_cursor>
	cursor_x=0;
    10a0:	4b0e      	ldr	r3, [pc, #56]	; (10dc <local_crlf+0x44>)
    10a2:	2200      	movs	r2, #0
    10a4:	601a      	str	r2, [r3, #0]
	cursor_y++;
    10a6:	4b0e      	ldr	r3, [pc, #56]	; (10e0 <local_crlf+0x48>)
    10a8:	681b      	ldr	r3, [r3, #0]
    10aa:	3301      	adds	r3, #1
    10ac:	4a0c      	ldr	r2, [pc, #48]	; (10e0 <local_crlf+0x48>)
    10ae:	6013      	str	r3, [r2, #0]
	if (cursor_y>=screen_height){
    10b0:	4b0b      	ldr	r3, [pc, #44]	; (10e0 <local_crlf+0x48>)
    10b2:	681a      	ldr	r2, [r3, #0]
    10b4:	4b0b      	ldr	r3, [pc, #44]	; (10e4 <local_crlf+0x4c>)
    10b6:	681b      	ldr	r3, [r3, #0]
    10b8:	429a      	cmp	r2, r3
    10ba:	db07      	blt.n	10cc <local_crlf+0x34>
		cursor_y--;
    10bc:	4b08      	ldr	r3, [pc, #32]	; (10e0 <local_crlf+0x48>)
    10be:	681b      	ldr	r3, [r3, #0]
    10c0:	3b01      	subs	r3, #1
    10c2:	4a07      	ldr	r2, [pc, #28]	; (10e0 <local_crlf+0x48>)
    10c4:	6013      	str	r3, [r2, #0]
		gdi_scroll_up(CHAR_HEIGHT);
    10c6:	2008      	movs	r0, #8
    10c8:	f000 fe10 	bl	1cec <gdi_scroll_up>
	}
	if (cursor_blink){
    10cc:	4b06      	ldr	r3, [pc, #24]	; (10e8 <local_crlf+0x50>)
    10ce:	681b      	ldr	r3, [r3, #0]
    10d0:	2b00      	cmp	r3, #0
    10d2:	d002      	beq.n	10da <local_crlf+0x42>
		enable_interrupt(IRQ_CURSOR_BLINK);
    10d4:	201e      	movs	r0, #30
    10d6:	f001 fc83 	bl	29e0 <enable_interrupt>
	}
}
    10da:	bd80      	pop	{r7, pc}
    10dc:	20000138 	.word	0x20000138
    10e0:	2000013c 	.word	0x2000013c
    10e4:	20000144 	.word	0x20000144
    10e8:	2000014c 	.word	0x2000014c

000010ec <local_cursor_left>:

static void local_cursor_left(){
    10ec:	b580      	push	{r7, lr}
    10ee:	af00      	add	r7, sp, #0
	if (!(cursor_x|cursor_y)) return; // curseur à {0,0}
    10f0:	4b12      	ldr	r3, [pc, #72]	; (113c <local_cursor_left+0x50>)
    10f2:	681a      	ldr	r2, [r3, #0]
    10f4:	4b12      	ldr	r3, [pc, #72]	; (1140 <local_cursor_left+0x54>)
    10f6:	681b      	ldr	r3, [r3, #0]
    10f8:	4313      	orrs	r3, r2
    10fa:	2b00      	cmp	r3, #0
    10fc:	d100      	bne.n	1100 <local_cursor_left+0x14>
    10fe:	e01c      	b.n	113a <local_cursor_left+0x4e>
	local_hide_cursor();
    1100:	f7ff ffa2 	bl	1048 <local_hide_cursor>
	if (cursor_x){
    1104:	4b0d      	ldr	r3, [pc, #52]	; (113c <local_cursor_left+0x50>)
    1106:	681b      	ldr	r3, [r3, #0]
    1108:	2b00      	cmp	r3, #0
    110a:	d005      	beq.n	1118 <local_cursor_left+0x2c>
		cursor_x--;
    110c:	4b0b      	ldr	r3, [pc, #44]	; (113c <local_cursor_left+0x50>)
    110e:	681b      	ldr	r3, [r3, #0]
    1110:	3b01      	subs	r3, #1
    1112:	4a0a      	ldr	r2, [pc, #40]	; (113c <local_cursor_left+0x50>)
    1114:	6013      	str	r3, [r2, #0]
    1116:	e009      	b.n	112c <local_cursor_left+0x40>
	}else{
		cursor_x=screen_width-1;
    1118:	4b0a      	ldr	r3, [pc, #40]	; (1144 <local_cursor_left+0x58>)
    111a:	681b      	ldr	r3, [r3, #0]
    111c:	3b01      	subs	r3, #1
    111e:	4a07      	ldr	r2, [pc, #28]	; (113c <local_cursor_left+0x50>)
    1120:	6013      	str	r3, [r2, #0]
		cursor_y--;
    1122:	4b07      	ldr	r3, [pc, #28]	; (1140 <local_cursor_left+0x54>)
    1124:	681b      	ldr	r3, [r3, #0]
    1126:	3b01      	subs	r3, #1
    1128:	4a05      	ldr	r2, [pc, #20]	; (1140 <local_cursor_left+0x54>)
    112a:	6013      	str	r3, [r2, #0]
	}
	if (cursor_blink){
    112c:	4b06      	ldr	r3, [pc, #24]	; (1148 <local_cursor_left+0x5c>)
    112e:	681b      	ldr	r3, [r3, #0]
    1130:	2b00      	cmp	r3, #0
    1132:	d002      	beq.n	113a <local_cursor_left+0x4e>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1134:	201e      	movs	r0, #30
    1136:	f001 fc53 	bl	29e0 <enable_interrupt>
	}
}
    113a:	bd80      	pop	{r7, pc}
    113c:	20000138 	.word	0x20000138
    1140:	2000013c 	.word	0x2000013c
    1144:	20000140 	.word	0x20000140
    1148:	2000014c 	.word	0x2000014c

0000114c <local_cursor_right>:

static void local_cursor_right(){
    114c:	b580      	push	{r7, lr}
    114e:	af00      	add	r7, sp, #0
	local_hide_cursor();
    1150:	f7ff ff7a 	bl	1048 <local_hide_cursor>
	cursor_x++;
    1154:	4b0a      	ldr	r3, [pc, #40]	; (1180 <local_cursor_right+0x34>)
    1156:	681b      	ldr	r3, [r3, #0]
    1158:	3301      	adds	r3, #1
    115a:	4a09      	ldr	r2, [pc, #36]	; (1180 <local_cursor_right+0x34>)
    115c:	6013      	str	r3, [r2, #0]
	if (cursor_x>=screen_width){
    115e:	4b08      	ldr	r3, [pc, #32]	; (1180 <local_cursor_right+0x34>)
    1160:	681a      	ldr	r2, [r3, #0]
    1162:	4b08      	ldr	r3, [pc, #32]	; (1184 <local_cursor_right+0x38>)
    1164:	681b      	ldr	r3, [r3, #0]
    1166:	429a      	cmp	r2, r3
    1168:	db01      	blt.n	116e <local_cursor_right+0x22>
		local_crlf();
    116a:	f7ff ff95 	bl	1098 <local_crlf>
	}	
	if (cursor_blink){
    116e:	4b06      	ldr	r3, [pc, #24]	; (1188 <local_cursor_right+0x3c>)
    1170:	681b      	ldr	r3, [r3, #0]
    1172:	2b00      	cmp	r3, #0
    1174:	d002      	beq.n	117c <local_cursor_right+0x30>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1176:	201e      	movs	r0, #30
    1178:	f001 fc32 	bl	29e0 <enable_interrupt>
	}
}
    117c:	bd80      	pop	{r7, pc}
    117e:	bf00      	nop
    1180:	20000138 	.word	0x20000138
    1184:	20000140 	.word	0x20000140
    1188:	2000014c 	.word	0x2000014c

0000118c <local_del_back>:


static void local_del_back(){
    118c:	b580      	push	{r7, lr}
    118e:	b082      	sub	sp, #8
    1190:	af02      	add	r7, sp, #8
	if (!(cursor_x|cursor_y)) return; 
    1192:	4b13      	ldr	r3, [pc, #76]	; (11e0 <local_del_back+0x54>)
    1194:	681a      	ldr	r2, [r3, #0]
    1196:	4b13      	ldr	r3, [pc, #76]	; (11e4 <local_del_back+0x58>)
    1198:	681b      	ldr	r3, [r3, #0]
    119a:	4313      	orrs	r3, r2
    119c:	2b00      	cmp	r3, #0
    119e:	d100      	bne.n	11a2 <local_del_back+0x16>
    11a0:	e01c      	b.n	11dc <local_del_back+0x50>
	local_cursor_left();
    11a2:	f7ff ffa3 	bl	10ec <local_cursor_left>
	local_hide_cursor();
    11a6:	f7ff ff4f 	bl	1048 <local_hide_cursor>
	gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,BLACK_BIT);
    11aa:	4b0d      	ldr	r3, [pc, #52]	; (11e0 <local_del_back+0x54>)
    11ac:	681a      	ldr	r2, [r3, #0]
    11ae:	4613      	mov	r3, r2
    11b0:	005b      	lsls	r3, r3, #1
    11b2:	4413      	add	r3, r2
    11b4:	005b      	lsls	r3, r3, #1
    11b6:	4619      	mov	r1, r3
    11b8:	4b0a      	ldr	r3, [pc, #40]	; (11e4 <local_del_back+0x58>)
    11ba:	681b      	ldr	r3, [r3, #0]
    11bc:	00da      	lsls	r2, r3, #3
    11be:	2300      	movs	r3, #0
    11c0:	9300      	str	r3, [sp, #0]
    11c2:	4608      	mov	r0, r1
    11c4:	4611      	mov	r1, r2
    11c6:	2206      	movs	r2, #6
    11c8:	2308      	movs	r3, #8
    11ca:	f000 fe1b 	bl	1e04 <gdi_box>
	if (cursor_blink){
    11ce:	4b06      	ldr	r3, [pc, #24]	; (11e8 <local_del_back+0x5c>)
    11d0:	681b      	ldr	r3, [r3, #0]
    11d2:	2b00      	cmp	r3, #0
    11d4:	d002      	beq.n	11dc <local_del_back+0x50>
		enable_interrupt(IRQ_CURSOR_BLINK);
    11d6:	201e      	movs	r0, #30
    11d8:	f001 fc02 	bl	29e0 <enable_interrupt>
	}
}
    11dc:	46bd      	mov	sp, r7
    11de:	bd80      	pop	{r7, pc}
    11e0:	20000138 	.word	0x20000138
    11e4:	2000013c 	.word	0x2000013c
    11e8:	2000014c 	.word	0x2000014c

000011ec <local_putc>:

// place un caractère dans le tampon écran
// à la position du curseur et avance le curseur.
void local_putc(char c){
    11ec:	b580      	push	{r7, lr}
    11ee:	b084      	sub	sp, #16
    11f0:	af02      	add	r7, sp, #8
    11f2:	4603      	mov	r3, r0
    11f4:	71fb      	strb	r3, [r7, #7]
		local_hide_cursor();
    11f6:	f7ff ff27 	bl	1048 <local_hide_cursor>
		gdi_put_sprite(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,(const unsigned char *)&font6x8[c]);
    11fa:	4b0c      	ldr	r3, [pc, #48]	; (122c <local_putc+0x40>)
    11fc:	681a      	ldr	r2, [r3, #0]
    11fe:	4613      	mov	r3, r2
    1200:	005b      	lsls	r3, r3, #1
    1202:	4413      	add	r3, r2
    1204:	005b      	lsls	r3, r3, #1
    1206:	4618      	mov	r0, r3
    1208:	4b09      	ldr	r3, [pc, #36]	; (1230 <local_putc+0x44>)
    120a:	681b      	ldr	r3, [r3, #0]
    120c:	00d9      	lsls	r1, r3, #3
    120e:	79fb      	ldrb	r3, [r7, #7]
    1210:	00db      	lsls	r3, r3, #3
    1212:	4a08      	ldr	r2, [pc, #32]	; (1234 <local_putc+0x48>)
    1214:	4413      	add	r3, r2
    1216:	9300      	str	r3, [sp, #0]
    1218:	2206      	movs	r2, #6
    121a:	2308      	movs	r3, #8
    121c:	f000 fe32 	bl	1e84 <gdi_put_sprite>
		local_cursor_right();
    1220:	f7ff ff94 	bl	114c <local_cursor_right>
/*
		if (cursor_blink){
			enable_interrupt(IRQ_CURSOR_BLINK);
		}
*/
}
    1224:	3708      	adds	r7, #8
    1226:	46bd      	mov	sp, r7
    1228:	bd80      	pop	{r7, pc}
    122a:	bf00      	nop
    122c:	20000138 	.word	0x20000138
    1230:	2000013c 	.word	0x2000013c
    1234:	00003eec 	.word	0x00003eec

00001238 <local_clear_line>:


static void local_clear_line(){
    1238:	b580      	push	{r7, lr}
    123a:	af00      	add	r7, sp, #0
	local_hide_cursor();
    123c:	f7ff ff04 	bl	1048 <local_hide_cursor>
	cursor_x=0;
    1240:	4b08      	ldr	r3, [pc, #32]	; (1264 <local_clear_line+0x2c>)
    1242:	2200      	movs	r2, #0
    1244:	601a      	str	r2, [r3, #0]
	gdi_clear_rows(cursor_y*CHAR_HEIGHT,CHAR_HEIGHT);
    1246:	4b08      	ldr	r3, [pc, #32]	; (1268 <local_clear_line+0x30>)
    1248:	681b      	ldr	r3, [r3, #0]
    124a:	00db      	lsls	r3, r3, #3
    124c:	4618      	mov	r0, r3
    124e:	2108      	movs	r1, #8
    1250:	f000 fec8 	bl	1fe4 <gdi_clear_rows>
	if (cursor_blink){
    1254:	4b05      	ldr	r3, [pc, #20]	; (126c <local_clear_line+0x34>)
    1256:	681b      	ldr	r3, [r3, #0]
    1258:	2b00      	cmp	r3, #0
    125a:	d002      	beq.n	1262 <local_clear_line+0x2a>
		enable_interrupt(IRQ_CURSOR_BLINK);
    125c:	201e      	movs	r0, #30
    125e:	f001 fbbf 	bl	29e0 <enable_interrupt>
	}
}
    1262:	bd80      	pop	{r7, pc}
    1264:	20000138 	.word	0x20000138
    1268:	2000013c 	.word	0x2000013c
    126c:	2000014c 	.word	0x2000014c

00001270 <local_clear_screen>:

static void local_clear_screen(){
    1270:	b580      	push	{r7, lr}
    1272:	af00      	add	r7, sp, #0
	local_hide_cursor();
    1274:	f7ff fee8 	bl	1048 <local_hide_cursor>
	gdi_clear_screen();
    1278:	f000 fd20 	bl	1cbc <gdi_clear_screen>
	cursor_home();
    127c:	f7ff fed4 	bl	1028 <cursor_home>
	if (cursor_blink){
    1280:	4b03      	ldr	r3, [pc, #12]	; (1290 <local_clear_screen+0x20>)
    1282:	681b      	ldr	r3, [r3, #0]
    1284:	2b00      	cmp	r3, #0
    1286:	d002      	beq.n	128e <local_clear_screen+0x1e>
		enable_interrupt(IRQ_CURSOR_BLINK);
    1288:	201e      	movs	r0, #30
    128a:	f001 fba9 	bl	29e0 <enable_interrupt>
	}
}
    128e:	bd80      	pop	{r7, pc}
    1290:	2000014c 	.word	0x2000014c

00001294 <local_text_cursor>:

static void local_text_cursor(int enable){
    1294:	b580      	push	{r7, lr}
    1296:	b084      	sub	sp, #16
    1298:	af02      	add	r7, sp, #8
    129a:	6078      	str	r0, [r7, #4]
	if (enable){
    129c:	687b      	ldr	r3, [r7, #4]
    129e:	2b00      	cmp	r3, #0
    12a0:	d024      	beq.n	12ec <local_text_cursor+0x58>
		// activation clock CURSOR_TMR
		RCC->CURSOR_RCC_ENR|=CURSOR_RCC_EN_BIT; 
    12a2:	4a27      	ldr	r2, [pc, #156]	; (1340 <local_text_cursor+0xac>)
    12a4:	4b26      	ldr	r3, [pc, #152]	; (1340 <local_text_cursor+0xac>)
    12a6:	69db      	ldr	r3, [r3, #28]
    12a8:	f043 0304 	orr.w	r3, r3, #4
    12ac:	61d3      	str	r3, [r2, #28]
		CURSOR_TMR->ARR=FTMR2_4/1000/2;
    12ae:	4b25      	ldr	r3, [pc, #148]	; (1344 <local_text_cursor+0xb0>)
    12b0:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    12b4:	62da      	str	r2, [r3, #44]	; 0x2c
		CURSOR_TMR->PSC=1000;
    12b6:	4b23      	ldr	r3, [pc, #140]	; (1344 <local_text_cursor+0xb0>)
    12b8:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    12bc:	629a      	str	r2, [r3, #40]	; 0x28
		CURSOR_TMR->CR1=BIT0|BIT7; // ARPE
    12be:	4b21      	ldr	r3, [pc, #132]	; (1344 <local_text_cursor+0xb0>)
    12c0:	2281      	movs	r2, #129	; 0x81
    12c2:	601a      	str	r2, [r3, #0]
		CURSOR_TMR->DIER=BIT0; // UIE
    12c4:	4b1f      	ldr	r3, [pc, #124]	; (1344 <local_text_cursor+0xb0>)
    12c6:	2201      	movs	r2, #1
    12c8:	60da      	str	r2, [r3, #12]
		set_int_priority(IRQ_CURSOR_BLINK,15);
    12ca:	201e      	movs	r0, #30
    12cc:	210f      	movs	r1, #15
    12ce:	f001 fc43 	bl	2b58 <set_int_priority>
		CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
    12d2:	4a1c      	ldr	r2, [pc, #112]	; (1344 <local_text_cursor+0xb0>)
    12d4:	4b1b      	ldr	r3, [pc, #108]	; (1344 <local_text_cursor+0xb0>)
    12d6:	691b      	ldr	r3, [r3, #16]
    12d8:	f023 0301 	bic.w	r3, r3, #1
    12dc:	6113      	str	r3, [r2, #16]
		enable_interrupt(IRQ_CURSOR_BLINK);
    12de:	201e      	movs	r0, #30
    12e0:	f001 fb7e 	bl	29e0 <enable_interrupt>
		cursor_blink=1;
    12e4:	4b18      	ldr	r3, [pc, #96]	; (1348 <local_text_cursor+0xb4>)
    12e6:	2201      	movs	r2, #1
    12e8:	601a      	str	r2, [r3, #0]
    12ea:	e026      	b.n	133a <local_text_cursor+0xa6>
	}else{
		disable_interrupt(IRQ_CURSOR_BLINK);
    12ec:	201e      	movs	r0, #30
    12ee:	f001 fb9b 	bl	2a28 <disable_interrupt>
		if (cursor_visible){
    12f2:	4b16      	ldr	r3, [pc, #88]	; (134c <local_text_cursor+0xb8>)
    12f4:	681b      	ldr	r3, [r3, #0]
    12f6:	2b00      	cmp	r3, #0
    12f8:	d016      	beq.n	1328 <local_text_cursor+0x94>
			gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    12fa:	4b15      	ldr	r3, [pc, #84]	; (1350 <local_text_cursor+0xbc>)
    12fc:	681a      	ldr	r2, [r3, #0]
    12fe:	4613      	mov	r3, r2
    1300:	005b      	lsls	r3, r3, #1
    1302:	4413      	add	r3, r2
    1304:	005b      	lsls	r3, r3, #1
    1306:	4619      	mov	r1, r3
    1308:	4b12      	ldr	r3, [pc, #72]	; (1354 <local_text_cursor+0xc0>)
    130a:	681b      	ldr	r3, [r3, #0]
    130c:	00da      	lsls	r2, r3, #3
    130e:	2302      	movs	r3, #2
    1310:	9300      	str	r3, [sp, #0]
    1312:	4608      	mov	r0, r1
    1314:	4611      	mov	r1, r2
    1316:	2206      	movs	r2, #6
    1318:	2308      	movs	r3, #8
    131a:	f000 fd73 	bl	1e04 <gdi_box>
			cursor_visible=~cursor_visible;
    131e:	4b0b      	ldr	r3, [pc, #44]	; (134c <local_text_cursor+0xb8>)
    1320:	681b      	ldr	r3, [r3, #0]
    1322:	43db      	mvns	r3, r3
    1324:	4a09      	ldr	r2, [pc, #36]	; (134c <local_text_cursor+0xb8>)
    1326:	6013      	str	r3, [r2, #0]
		}
		CURSOR_TMR->DIER&=~BIT0;
    1328:	4a06      	ldr	r2, [pc, #24]	; (1344 <local_text_cursor+0xb0>)
    132a:	4b06      	ldr	r3, [pc, #24]	; (1344 <local_text_cursor+0xb0>)
    132c:	68db      	ldr	r3, [r3, #12]
    132e:	f023 0301 	bic.w	r3, r3, #1
    1332:	60d3      	str	r3, [r2, #12]
		cursor_blink=0;
    1334:	4b04      	ldr	r3, [pc, #16]	; (1348 <local_text_cursor+0xb4>)
    1336:	2200      	movs	r2, #0
    1338:	601a      	str	r2, [r3, #0]
	}
}
    133a:	3708      	adds	r7, #8
    133c:	46bd      	mov	sp, r7
    133e:	bd80      	pop	{r7, pc}
    1340:	40021000 	.word	0x40021000
    1344:	40000800 	.word	0x40000800
    1348:	2000014c 	.word	0x2000014c
    134c:	20000148 	.word	0x20000148
    1350:	20000138 	.word	0x20000138
    1354:	2000013c 	.word	0x2000013c

00001358 <serial_cursor_crlf>:
/**********************************
 * fonctions console sérielle
 **********************************/
 
// cursor au début de la ligne suivante.
static void serial_cursor_crlf(){
    1358:	b480      	push	{r7}
    135a:	af00      	add	r7, sp, #0
	cursor_x=0;
    135c:	4b09      	ldr	r3, [pc, #36]	; (1384 <serial_cursor_crlf+0x2c>)
    135e:	2200      	movs	r2, #0
    1360:	601a      	str	r2, [r3, #0]
	if (cursor_y<(screen_height-1)){
    1362:	4b09      	ldr	r3, [pc, #36]	; (1388 <serial_cursor_crlf+0x30>)
    1364:	681b      	ldr	r3, [r3, #0]
    1366:	1e5a      	subs	r2, r3, #1
    1368:	4b08      	ldr	r3, [pc, #32]	; (138c <serial_cursor_crlf+0x34>)
    136a:	681b      	ldr	r3, [r3, #0]
    136c:	429a      	cmp	r2, r3
    136e:	dd04      	ble.n	137a <serial_cursor_crlf+0x22>
		cursor_y++;
    1370:	4b06      	ldr	r3, [pc, #24]	; (138c <serial_cursor_crlf+0x34>)
    1372:	681b      	ldr	r3, [r3, #0]
    1374:	3301      	adds	r3, #1
    1376:	4a05      	ldr	r2, [pc, #20]	; (138c <serial_cursor_crlf+0x34>)
    1378:	6013      	str	r3, [r2, #0]
	}
	
}
    137a:	46bd      	mov	sp, r7
    137c:	f85d 7b04 	ldr.w	r7, [sp], #4
    1380:	4770      	bx	lr
    1382:	bf00      	nop
    1384:	20000138 	.word	0x20000138
    1388:	20000144 	.word	0x20000144
    138c:	2000013c 	.word	0x2000013c

00001390 <serial_cursor_left>:

static void serial_cursor_left(){
    1390:	b480      	push	{r7}
    1392:	af00      	add	r7, sp, #0
	if (cursor_x){
    1394:	4b0d      	ldr	r3, [pc, #52]	; (13cc <serial_cursor_left+0x3c>)
    1396:	681b      	ldr	r3, [r3, #0]
    1398:	2b00      	cmp	r3, #0
    139a:	d005      	beq.n	13a8 <serial_cursor_left+0x18>
		cursor_x--;
    139c:	4b0b      	ldr	r3, [pc, #44]	; (13cc <serial_cursor_left+0x3c>)
    139e:	681b      	ldr	r3, [r3, #0]
    13a0:	3b01      	subs	r3, #1
    13a2:	4a0a      	ldr	r2, [pc, #40]	; (13cc <serial_cursor_left+0x3c>)
    13a4:	6013      	str	r3, [r2, #0]
    13a6:	e00d      	b.n	13c4 <serial_cursor_left+0x34>
	}else if (cursor_y){
    13a8:	4b09      	ldr	r3, [pc, #36]	; (13d0 <serial_cursor_left+0x40>)
    13aa:	681b      	ldr	r3, [r3, #0]
    13ac:	2b00      	cmp	r3, #0
    13ae:	d009      	beq.n	13c4 <serial_cursor_left+0x34>
		cursor_x=screen_width-1;
    13b0:	4b08      	ldr	r3, [pc, #32]	; (13d4 <serial_cursor_left+0x44>)
    13b2:	681b      	ldr	r3, [r3, #0]
    13b4:	3b01      	subs	r3, #1
    13b6:	4a05      	ldr	r2, [pc, #20]	; (13cc <serial_cursor_left+0x3c>)
    13b8:	6013      	str	r3, [r2, #0]
		cursor_y--;
    13ba:	4b05      	ldr	r3, [pc, #20]	; (13d0 <serial_cursor_left+0x40>)
    13bc:	681b      	ldr	r3, [r3, #0]
    13be:	3b01      	subs	r3, #1
    13c0:	4a03      	ldr	r2, [pc, #12]	; (13d0 <serial_cursor_left+0x40>)
    13c2:	6013      	str	r3, [r2, #0]
	}
}
    13c4:	46bd      	mov	sp, r7
    13c6:	f85d 7b04 	ldr.w	r7, [sp], #4
    13ca:	4770      	bx	lr
    13cc:	20000138 	.word	0x20000138
    13d0:	2000013c 	.word	0x2000013c
    13d4:	20000140 	.word	0x20000140

000013d8 <serial_cursor_right>:

static void serial_cursor_right(){
    13d8:	b580      	push	{r7, lr}
    13da:	af00      	add	r7, sp, #0
	cursor_x++;
    13dc:	4b06      	ldr	r3, [pc, #24]	; (13f8 <serial_cursor_right+0x20>)
    13de:	681b      	ldr	r3, [r3, #0]
    13e0:	3301      	adds	r3, #1
    13e2:	4a05      	ldr	r2, [pc, #20]	; (13f8 <serial_cursor_right+0x20>)
    13e4:	6013      	str	r3, [r2, #0]
	if (cursor_x>=screen_width){
    13e6:	4b04      	ldr	r3, [pc, #16]	; (13f8 <serial_cursor_right+0x20>)
    13e8:	681a      	ldr	r2, [r3, #0]
    13ea:	4b04      	ldr	r3, [pc, #16]	; (13fc <serial_cursor_right+0x24>)
    13ec:	681b      	ldr	r3, [r3, #0]
    13ee:	429a      	cmp	r2, r3
    13f0:	db01      	blt.n	13f6 <serial_cursor_right+0x1e>
		serial_cursor_crlf();
    13f2:	f7ff ffb1 	bl	1358 <serial_cursor_crlf>
	}
}
    13f6:	bd80      	pop	{r7, pc}
    13f8:	20000138 	.word	0x20000138
    13fc:	20000140 	.word	0x20000140

00001400 <serial_putc>:

static void serial_putc(char c){
    1400:	b580      	push	{r7, lr}
    1402:	b082      	sub	sp, #8
    1404:	af00      	add	r7, sp, #0
    1406:	4603      	mov	r3, r0
    1408:	71fb      	strb	r3, [r7, #7]
	vt_putc(c);
    140a:	79fb      	ldrb	r3, [r7, #7]
    140c:	4618      	mov	r0, r3
    140e:	f002 fb8b 	bl	3b28 <vt_putc>
	serial_cursor_right();
    1412:	f7ff ffe1 	bl	13d8 <serial_cursor_right>
}
    1416:	3708      	adds	r7, #8
    1418:	46bd      	mov	sp, r7
    141a:	bd80      	pop	{r7, pc}

0000141c <serial_crlf>:

static void serial_crlf(){
    141c:	b580      	push	{r7, lr}
    141e:	af00      	add	r7, sp, #0
	vt_putc(CR);
    1420:	200d      	movs	r0, #13
    1422:	f002 fb81 	bl	3b28 <vt_putc>
	serial_cursor_crlf();
    1426:	f7ff ff97 	bl	1358 <serial_cursor_crlf>
}
    142a:	bd80      	pop	{r7, pc}

0000142c <serial_clear_line>:

static void serial_clear_line(){
    142c:	b580      	push	{r7, lr}
    142e:	af00      	add	r7, sp, #0
	vt_clear_line(cursor_y+1);
    1430:	4b03      	ldr	r3, [pc, #12]	; (1440 <serial_clear_line+0x14>)
    1432:	681b      	ldr	r3, [r3, #0]
    1434:	3301      	adds	r3, #1
    1436:	4618      	mov	r0, r3
    1438:	f002 fbb6 	bl	3ba8 <vt_clear_line>
}
    143c:	bd80      	pop	{r7, pc}
    143e:	bf00      	nop
    1440:	2000013c 	.word	0x2000013c

00001444 <serial_clear_screen>:

static void serial_clear_screen(){
    1444:	b580      	push	{r7, lr}
    1446:	af00      	add	r7, sp, #0
	vt_cls();
    1448:	f002 fb9e 	bl	3b88 <vt_cls>
	cursor_home();
    144c:	f7ff fdec 	bl	1028 <cursor_home>
}
    1450:	bd80      	pop	{r7, pc}
    1452:	bf00      	nop

00001454 <queue_insert>:

//************************************************

static void queue_insert(char c){
    1454:	b480      	push	{r7}
    1456:	b083      	sub	sp, #12
    1458:	af00      	add	r7, sp, #0
    145a:	4603      	mov	r3, r0
    145c:	71fb      	strb	r3, [r7, #7]
		con.queue[con.head++]=c;
    145e:	4b0a      	ldr	r3, [pc, #40]	; (1488 <queue_insert+0x34>)
    1460:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1462:	1c5a      	adds	r2, r3, #1
    1464:	4908      	ldr	r1, [pc, #32]	; (1488 <queue_insert+0x34>)
    1466:	624a      	str	r2, [r1, #36]	; 0x24
    1468:	4a07      	ldr	r2, [pc, #28]	; (1488 <queue_insert+0x34>)
    146a:	4413      	add	r3, r2
    146c:	79fa      	ldrb	r2, [r7, #7]
    146e:	705a      	strb	r2, [r3, #1]
		con.head&=CON_QUEUE_SIZE-1;
    1470:	4b05      	ldr	r3, [pc, #20]	; (1488 <queue_insert+0x34>)
    1472:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    1474:	f003 031f 	and.w	r3, r3, #31
    1478:	4a03      	ldr	r2, [pc, #12]	; (1488 <queue_insert+0x34>)
    147a:	6253      	str	r3, [r2, #36]	; 0x24
}
    147c:	370c      	adds	r7, #12
    147e:	46bd      	mov	sp, r7
    1480:	f85d 7b04 	ldr.w	r7, [sp], #4
    1484:	4770      	bx	lr
    1486:	bf00      	nop
    1488:	2000018c 	.word	0x2000018c

0000148c <queue_getc>:

static char queue_getc(){
    148c:	b480      	push	{r7}
    148e:	b083      	sub	sp, #12
    1490:	af00      	add	r7, sp, #0
	char c=0;
    1492:	2300      	movs	r3, #0
    1494:	71fb      	strb	r3, [r7, #7]
	if (con.tail!=con.head){
    1496:	4b0e      	ldr	r3, [pc, #56]	; (14d0 <queue_getc+0x44>)
    1498:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    149a:	4b0d      	ldr	r3, [pc, #52]	; (14d0 <queue_getc+0x44>)
    149c:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    149e:	429a      	cmp	r2, r3
    14a0:	d00e      	beq.n	14c0 <queue_getc+0x34>
		c=con.queue[con.tail++];
    14a2:	4b0b      	ldr	r3, [pc, #44]	; (14d0 <queue_getc+0x44>)
    14a4:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    14a6:	1c5a      	adds	r2, r3, #1
    14a8:	4909      	ldr	r1, [pc, #36]	; (14d0 <queue_getc+0x44>)
    14aa:	628a      	str	r2, [r1, #40]	; 0x28
    14ac:	4a08      	ldr	r2, [pc, #32]	; (14d0 <queue_getc+0x44>)
    14ae:	4413      	add	r3, r2
    14b0:	785b      	ldrb	r3, [r3, #1]
    14b2:	71fb      	strb	r3, [r7, #7]
		con.tail&=CON_QUEUE_SIZE-1;
    14b4:	4b06      	ldr	r3, [pc, #24]	; (14d0 <queue_getc+0x44>)
    14b6:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    14b8:	f003 031f 	and.w	r3, r3, #31
    14bc:	4a04      	ldr	r2, [pc, #16]	; (14d0 <queue_getc+0x44>)
    14be:	6293      	str	r3, [r2, #40]	; 0x28
	}
	return c;
    14c0:	79fb      	ldrb	r3, [r7, #7]
}
    14c2:	4618      	mov	r0, r3
    14c4:	370c      	adds	r7, #12
    14c6:	46bd      	mov	sp, r7
    14c8:	f85d 7b04 	ldr.w	r7, [sp], #4
    14cc:	4770      	bx	lr
    14ce:	bf00      	nop
    14d0:	2000018c 	.word	0x2000018c

000014d4 <con_queue_flush>:


void con_queue_flush(){
    14d4:	b480      	push	{r7}
    14d6:	af00      	add	r7, sp, #0
	con.tail=con.head=0;
    14d8:	2300      	movs	r3, #0
    14da:	4a04      	ldr	r2, [pc, #16]	; (14ec <con_queue_flush+0x18>)
    14dc:	6253      	str	r3, [r2, #36]	; 0x24
    14de:	4a03      	ldr	r2, [pc, #12]	; (14ec <con_queue_flush+0x18>)
    14e0:	6293      	str	r3, [r2, #40]	; 0x28
}
    14e2:	46bd      	mov	sp, r7
    14e4:	f85d 7b04 	ldr.w	r7, [sp], #4
    14e8:	4770      	bx	lr
    14ea:	bf00      	nop
    14ec:	2000018c 	.word	0x2000018c

000014f0 <con_select>:

static const char PROMPT[]=" OK\n";

void con_select(console_dev_t dev){
    14f0:	b580      	push	{r7, lr}
    14f2:	b082      	sub	sp, #8
    14f4:	af00      	add	r7, sp, #0
    14f6:	4603      	mov	r3, r0
    14f8:	71fb      	strb	r3, [r7, #7]
	local_text_cursor(0);
    14fa:	2000      	movs	r0, #0
    14fc:	f7ff feca 	bl	1294 <local_text_cursor>
	kbd_enable(0);
    1500:	2000      	movs	r0, #0
    1502:	f000 ff8f 	bl	2424 <kbd_enable>
	vt_rx_enable(0);
    1506:	2000      	movs	r0, #0
    1508:	f002 fb7e 	bl	3c08 <vt_rx_enable>
	con_queue_flush();
    150c:	f7ff ffe2 	bl	14d4 <con_queue_flush>
	con.dev=dev;
    1510:	4a21      	ldr	r2, [pc, #132]	; (1598 <con_select+0xa8>)
    1512:	79fb      	ldrb	r3, [r7, #7]
    1514:	7013      	strb	r3, [r2, #0]
	cursor_home();
    1516:	f7ff fd87 	bl	1028 <cursor_home>
	if (dev==LOCAL){
    151a:	79fb      	ldrb	r3, [r7, #7]
    151c:	2b00      	cmp	r3, #0
    151e:	d11b      	bne.n	1558 <con_select+0x68>
		screen_width=GDI_SCREEN_WIDTH;
    1520:	4b1e      	ldr	r3, [pc, #120]	; (159c <con_select+0xac>)
    1522:	2235      	movs	r2, #53	; 0x35
    1524:	601a      	str	r2, [r3, #0]
		screen_height=GDI_SCREEN_HEIGHT;
    1526:	4b1e      	ldr	r3, [pc, #120]	; (15a0 <con_select+0xb0>)
    1528:	221e      	movs	r2, #30
    152a:	601a      	str	r2, [r3, #0]
		con.putc=local_putc;
    152c:	4b1a      	ldr	r3, [pc, #104]	; (1598 <con_select+0xa8>)
    152e:	4a1d      	ldr	r2, [pc, #116]	; (15a4 <con_select+0xb4>)
    1530:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=local_clear_screen;
    1532:	4b19      	ldr	r3, [pc, #100]	; (1598 <con_select+0xa8>)
    1534:	4a1c      	ldr	r2, [pc, #112]	; (15a8 <con_select+0xb8>)
    1536:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=local_del_back;
    1538:	4b17      	ldr	r3, [pc, #92]	; (1598 <con_select+0xa8>)
    153a:	4a1c      	ldr	r2, [pc, #112]	; (15ac <con_select+0xbc>)
    153c:	639a      	str	r2, [r3, #56]	; 0x38
		con.clrln=local_clear_line;
    153e:	4b16      	ldr	r3, [pc, #88]	; (1598 <con_select+0xa8>)
    1540:	4a1b      	ldr	r2, [pc, #108]	; (15b0 <con_select+0xc0>)
    1542:	641a      	str	r2, [r3, #64]	; 0x40
		con.crlf=local_crlf;
    1544:	4b14      	ldr	r3, [pc, #80]	; (1598 <con_select+0xa8>)
    1546:	4a1b      	ldr	r2, [pc, #108]	; (15b4 <con_select+0xc4>)
    1548:	645a      	str	r2, [r3, #68]	; 0x44
		kbd_enable(1);
    154a:	2001      	movs	r0, #1
    154c:	f000 ff6a 	bl	2424 <kbd_enable>
		local_text_cursor(1);
    1550:	2001      	movs	r0, #1
    1552:	f7ff fe9f 	bl	1294 <local_text_cursor>
    1556:	e017      	b.n	1588 <con_select+0x98>
	}else{
		screen_width=VT_SCREEN_WIDTH;
    1558:	4b10      	ldr	r3, [pc, #64]	; (159c <con_select+0xac>)
    155a:	2250      	movs	r2, #80	; 0x50
    155c:	601a      	str	r2, [r3, #0]
		screen_height=VT_SCREEN_HEIGHT;
    155e:	4b10      	ldr	r3, [pc, #64]	; (15a0 <con_select+0xb0>)
    1560:	2218      	movs	r2, #24
    1562:	601a      	str	r2, [r3, #0]
		con.putc=serial_putc;
    1564:	4b0c      	ldr	r3, [pc, #48]	; (1598 <con_select+0xa8>)
    1566:	4a14      	ldr	r2, [pc, #80]	; (15b8 <con_select+0xc8>)
    1568:	635a      	str	r2, [r3, #52]	; 0x34
		con.cls=serial_clear_screen;
    156a:	4b0b      	ldr	r3, [pc, #44]	; (1598 <con_select+0xa8>)
    156c:	4a13      	ldr	r2, [pc, #76]	; (15bc <con_select+0xcc>)
    156e:	63da      	str	r2, [r3, #60]	; 0x3c
		con.delete_back=vt_del_back;
    1570:	4b09      	ldr	r3, [pc, #36]	; (1598 <con_select+0xa8>)
    1572:	4a13      	ldr	r2, [pc, #76]	; (15c0 <con_select+0xd0>)
    1574:	639a      	str	r2, [r3, #56]	; 0x38
		con.clrln=serial_clear_line;
    1576:	4b08      	ldr	r3, [pc, #32]	; (1598 <con_select+0xa8>)
    1578:	4a12      	ldr	r2, [pc, #72]	; (15c4 <con_select+0xd4>)
    157a:	641a      	str	r2, [r3, #64]	; 0x40
		con.crlf=serial_crlf;
    157c:	4b06      	ldr	r3, [pc, #24]	; (1598 <con_select+0xa8>)
    157e:	4a12      	ldr	r2, [pc, #72]	; (15c8 <con_select+0xd8>)
    1580:	645a      	str	r2, [r3, #68]	; 0x44
		vt_rx_enable(1);
    1582:	2001      	movs	r0, #1
    1584:	f002 fb40 	bl	3c08 <vt_rx_enable>
	}
	cls();
    1588:	f000 fa86 	bl	1a98 <cls>
	print(PROMPT);
    158c:	480f      	ldr	r0, [pc, #60]	; (15cc <con_select+0xdc>)
    158e:	f000 f895 	bl	16bc <print>
}
    1592:	3708      	adds	r7, #8
    1594:	46bd      	mov	sp, r7
    1596:	bd80      	pop	{r7, pc}
    1598:	2000018c 	.word	0x2000018c
    159c:	20000140 	.word	0x20000140
    15a0:	20000144 	.word	0x20000144
    15a4:	000011ed 	.word	0x000011ed
    15a8:	00001271 	.word	0x00001271
    15ac:	0000118d 	.word	0x0000118d
    15b0:	00001239 	.word	0x00001239
    15b4:	00001099 	.word	0x00001099
    15b8:	00001401 	.word	0x00001401
    15bc:	00001445 	.word	0x00001445
    15c0:	00003b49 	.word	0x00003b49
    15c4:	0000142d 	.word	0x0000142d
    15c8:	0000141d 	.word	0x0000141d
    15cc:	00003ee4 	.word	0x00003ee4

000015d0 <console_init>:

void console_init(console_dev_t dev){
    15d0:	b580      	push	{r7, lr}
    15d2:	b082      	sub	sp, #8
    15d4:	af00      	add	r7, sp, #0
    15d6:	4603      	mov	r3, r0
    15d8:	71fb      	strb	r3, [r7, #7]
	con.getc=queue_getc;
    15da:	4b06      	ldr	r3, [pc, #24]	; (15f4 <console_init+0x24>)
    15dc:	4a06      	ldr	r2, [pc, #24]	; (15f8 <console_init+0x28>)
    15de:	631a      	str	r2, [r3, #48]	; 0x30
	con.insert=queue_insert;
    15e0:	4b04      	ldr	r3, [pc, #16]	; (15f4 <console_init+0x24>)
    15e2:	4a06      	ldr	r2, [pc, #24]	; (15fc <console_init+0x2c>)
    15e4:	62da      	str	r2, [r3, #44]	; 0x2c
	con_select(dev);
    15e6:	79fb      	ldrb	r3, [r7, #7]
    15e8:	4618      	mov	r0, r3
    15ea:	f7ff ff81 	bl	14f0 <con_select>
}
    15ee:	3708      	adds	r7, #8
    15f0:	46bd      	mov	sp, r7
    15f2:	bd80      	pop	{r7, pc}
    15f4:	2000018c 	.word	0x2000018c
    15f8:	0000148d 	.word	0x0000148d
    15fc:	00001455 	.word	0x00001455

00001600 <conout>:


// envoie d'un caractère à la console
void conout(char c){
    1600:	b580      	push	{r7, lr}
    1602:	b082      	sub	sp, #8
    1604:	af00      	add	r7, sp, #0
    1606:	4603      	mov	r3, r0
    1608:	71fb      	strb	r3, [r7, #7]
	switch(c){
    160a:	79fb      	ldrb	r3, [r7, #7]
    160c:	3b08      	subs	r3, #8
    160e:	2b05      	cmp	r3, #5
    1610:	d83b      	bhi.n	168a <conout+0x8a>
    1612:	a201      	add	r2, pc, #4	; (adr r2, 1618 <conout+0x18>)
    1614:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1618:	0000166f 	.word	0x0000166f
    161c:	00001639 	.word	0x00001639
    1620:	00001631 	.word	0x00001631
    1624:	0000168b 	.word	0x0000168b
    1628:	0000168b 	.word	0x0000168b
    162c:	00001631 	.word	0x00001631
		case CR:
		case '\n':
			con.crlf();
    1630:	4b1a      	ldr	r3, [pc, #104]	; (169c <conout+0x9c>)
    1632:	6c5b      	ldr	r3, [r3, #68]	; 0x44
    1634:	4798      	blx	r3
			break;
    1636:	e02d      	b.n	1694 <conout+0x94>
		case TAB:
			con.putc(SPACE);
    1638:	4b18      	ldr	r3, [pc, #96]	; (169c <conout+0x9c>)
    163a:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    163c:	2020      	movs	r0, #32
    163e:	4798      	blx	r3
			if (!cursor_x){
    1640:	4b17      	ldr	r3, [pc, #92]	; (16a0 <conout+0xa0>)
    1642:	681b      	ldr	r3, [r3, #0]
    1644:	2b00      	cmp	r3, #0
    1646:	d100      	bne.n	164a <conout+0x4a>
				break;
    1648:	e024      	b.n	1694 <conout+0x94>
			}
			while (cursor_x%tab_width){
    164a:	e003      	b.n	1654 <conout+0x54>
				con.putc(SPACE);
    164c:	4b13      	ldr	r3, [pc, #76]	; (169c <conout+0x9c>)
    164e:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    1650:	2020      	movs	r0, #32
    1652:	4798      	blx	r3
		case TAB:
			con.putc(SPACE);
			if (!cursor_x){
				break;
			}
			while (cursor_x%tab_width){
    1654:	4b12      	ldr	r3, [pc, #72]	; (16a0 <conout+0xa0>)
    1656:	681b      	ldr	r3, [r3, #0]
    1658:	461a      	mov	r2, r3
    165a:	4b12      	ldr	r3, [pc, #72]	; (16a4 <conout+0xa4>)
    165c:	681b      	ldr	r3, [r3, #0]
    165e:	fbb2 f1f3 	udiv	r1, r2, r3
    1662:	fb03 f301 	mul.w	r3, r3, r1
    1666:	1ad3      	subs	r3, r2, r3
    1668:	2b00      	cmp	r3, #0
    166a:	d1ef      	bne.n	164c <conout+0x4c>
				con.putc(SPACE);
			}
			break;
    166c:	e012      	b.n	1694 <conout+0x94>
		case BS:
			if (cursor_x){
    166e:	4b0c      	ldr	r3, [pc, #48]	; (16a0 <conout+0xa0>)
    1670:	681b      	ldr	r3, [r3, #0]
    1672:	2b00      	cmp	r3, #0
    1674:	d008      	beq.n	1688 <conout+0x88>
				con.delete_back();
    1676:	4b09      	ldr	r3, [pc, #36]	; (169c <conout+0x9c>)
    1678:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    167a:	4798      	blx	r3
				cursor_x--;
    167c:	4b08      	ldr	r3, [pc, #32]	; (16a0 <conout+0xa0>)
    167e:	681b      	ldr	r3, [r3, #0]
    1680:	3b01      	subs	r3, #1
    1682:	4a07      	ldr	r2, [pc, #28]	; (16a0 <conout+0xa0>)
    1684:	6013      	str	r3, [r2, #0]
			}
			break;
    1686:	e005      	b.n	1694 <conout+0x94>
    1688:	e004      	b.n	1694 <conout+0x94>
		default:
			con.putc(c);
    168a:	4b04      	ldr	r3, [pc, #16]	; (169c <conout+0x9c>)
    168c:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    168e:	79fa      	ldrb	r2, [r7, #7]
    1690:	4610      	mov	r0, r2
    1692:	4798      	blx	r3
	}
}
    1694:	3708      	adds	r7, #8
    1696:	46bd      	mov	sp, r7
    1698:	bd80      	pop	{r7, pc}
    169a:	bf00      	nop
    169c:	2000018c 	.word	0x2000018c
    16a0:	20000138 	.word	0x20000138
    16a4:	20000008 	.word	0x20000008

000016a8 <conin>:


// réception d'un caractère de la console
char conin(){
    16a8:	b580      	push	{r7, lr}
    16aa:	af00      	add	r7, sp, #0
	return con.getc();
    16ac:	4b02      	ldr	r3, [pc, #8]	; (16b8 <conin+0x10>)
    16ae:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    16b0:	4798      	blx	r3
    16b2:	4603      	mov	r3, r0
}
    16b4:	4618      	mov	r0, r3
    16b6:	bd80      	pop	{r7, pc}
    16b8:	2000018c 	.word	0x2000018c

000016bc <print>:

// imprime un chaîne sur la console
void print(const char *str){
    16bc:	b580      	push	{r7, lr}
    16be:	b082      	sub	sp, #8
    16c0:	af00      	add	r7, sp, #0
    16c2:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
    16c4:	e006      	b.n	16d4 <print+0x18>
    16c6:	687b      	ldr	r3, [r7, #4]
    16c8:	1c5a      	adds	r2, r3, #1
    16ca:	607a      	str	r2, [r7, #4]
    16cc:	781b      	ldrb	r3, [r3, #0]
    16ce:	4618      	mov	r0, r3
    16d0:	f7ff ff96 	bl	1600 <conout>
    16d4:	687b      	ldr	r3, [r7, #4]
    16d6:	781b      	ldrb	r3, [r3, #0]
    16d8:	2b00      	cmp	r3, #0
    16da:	d1f4      	bne.n	16c6 <print+0xa>
}
    16dc:	3708      	adds	r7, #8
    16de:	46bd      	mov	sp, r7
    16e0:	bd80      	pop	{r7, pc}
    16e2:	bf00      	nop

000016e4 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
    16e4:	b580      	push	{r7, lr}
    16e6:	af00      	add	r7, sp, #0
	con.delete_back();
    16e8:	4b01      	ldr	r3, [pc, #4]	; (16f0 <delete_back+0xc>)
    16ea:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    16ec:	4798      	blx	r3
}
    16ee:	bd80      	pop	{r7, pc}
    16f0:	2000018c 	.word	0x2000018c

000016f4 <delete_nchar>:

// efface n caractères
static void delete_nchar(int n){
    16f4:	b580      	push	{r7, lr}
    16f6:	b082      	sub	sp, #8
    16f8:	af00      	add	r7, sp, #0
    16fa:	6078      	str	r0, [r7, #4]
	while (n){
    16fc:	e005      	b.n	170a <delete_nchar+0x16>
		con.delete_back();
    16fe:	4b06      	ldr	r3, [pc, #24]	; (1718 <delete_nchar+0x24>)
    1700:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1702:	4798      	blx	r3
		n--;
    1704:	687b      	ldr	r3, [r7, #4]
    1706:	3b01      	subs	r3, #1
    1708:	607b      	str	r3, [r7, #4]
	con.delete_back();
}

// efface n caractères
static void delete_nchar(int n){
	while (n){
    170a:	687b      	ldr	r3, [r7, #4]
    170c:	2b00      	cmp	r3, #0
    170e:	d1f6      	bne.n	16fe <delete_nchar+0xa>
		con.delete_back();
		n--;
	}
}
    1710:	3708      	adds	r7, #8
    1712:	46bd      	mov	sp, r7
    1714:	bd80      	pop	{r7, pc}
    1716:	bf00      	nop
    1718:	2000018c 	.word	0x2000018c

0000171c <beep>:

static void beep(){
    171c:	b480      	push	{r7}
    171e:	af00      	add	r7, sp, #0
}
    1720:	46bd      	mov	sp, r7
    1722:	f85d 7b04 	ldr.w	r7, [sp], #4
    1726:	4770      	bx	lr

00001728 <read_line>:

// reçoit une ligne de texte de la console
// si buffer contient du texte une copie est préservée.
unsigned read_line(char *buffer,unsigned buf_len){
    1728:	b580      	push	{r7, lr}
    172a:	b086      	sub	sp, #24
    172c:	af00      	add	r7, sp, #0
    172e:	6078      	str	r0, [r7, #4]
    1730:	6039      	str	r1, [r7, #0]
	unsigned ll, line_len=0;
    1732:	2300      	movs	r3, #0
    1734:	617b      	str	r3, [r7, #20]
	char c=0;
    1736:	2300      	movs	r3, #0
    1738:	74fb      	strb	r3, [r7, #19]
	char *new_buff=alloc(buf_len);
    173a:	6838      	ldr	r0, [r7, #0]
    173c:	f7fe fde2 	bl	304 <alloc>
    1740:	60f8      	str	r0, [r7, #12]
	
	buf_len--;
    1742:	683b      	ldr	r3, [r7, #0]
    1744:	3b01      	subs	r3, #1
    1746:	603b      	str	r3, [r7, #0]
	if (buf_len>(screen_width-cursor_x-1)){
    1748:	4b68      	ldr	r3, [pc, #416]	; (18ec <read_line+0x1c4>)
    174a:	681a      	ldr	r2, [r3, #0]
    174c:	4b68      	ldr	r3, [pc, #416]	; (18f0 <read_line+0x1c8>)
    174e:	681b      	ldr	r3, [r3, #0]
    1750:	1ad3      	subs	r3, r2, r3
    1752:	3b01      	subs	r3, #1
    1754:	461a      	mov	r2, r3
    1756:	683b      	ldr	r3, [r7, #0]
    1758:	429a      	cmp	r2, r3
    175a:	d206      	bcs.n	176a <read_line+0x42>
		buf_len=screen_width-cursor_x-1;
    175c:	4b63      	ldr	r3, [pc, #396]	; (18ec <read_line+0x1c4>)
    175e:	681a      	ldr	r2, [r3, #0]
    1760:	4b63      	ldr	r3, [pc, #396]	; (18f0 <read_line+0x1c8>)
    1762:	681b      	ldr	r3, [r3, #0]
    1764:	1ad3      	subs	r3, r2, r3
    1766:	3b01      	subs	r3, #1
    1768:	603b      	str	r3, [r7, #0]
	}
	while (c!=CR){
    176a:	e0ad      	b.n	18c8 <read_line+0x1a0>
			c=con.getc();
    176c:	4b61      	ldr	r3, [pc, #388]	; (18f4 <read_line+0x1cc>)
    176e:	6b1b      	ldr	r3, [r3, #48]	; 0x30
    1770:	4798      	blx	r3
    1772:	4603      	mov	r3, r0
    1774:	74fb      	strb	r3, [r7, #19]
			switch(c){
    1776:	7cfb      	ldrb	r3, [r7, #19]
    1778:	2b18      	cmp	r3, #24
    177a:	f200 808f 	bhi.w	189c <read_line+0x174>
    177e:	a201      	add	r2, pc, #4	; (adr r2, 1784 <read_line+0x5c>)
    1780:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    1784:	000018c9 	.word	0x000018c9
    1788:	0000189d 	.word	0x0000189d
    178c:	0000189d 	.word	0x0000189d
    1790:	0000189d 	.word	0x0000189d
    1794:	0000189d 	.word	0x0000189d
    1798:	0000188d 	.word	0x0000188d
    179c:	0000189d 	.word	0x0000189d
    17a0:	0000189d 	.word	0x0000189d
    17a4:	00001879 	.word	0x00001879
    17a8:	00001899 	.word	0x00001899
    17ac:	000017e9 	.word	0x000017e9
    17b0:	0000189d 	.word	0x0000189d
    17b4:	0000189d 	.word	0x0000189d
    17b8:	000017e9 	.word	0x000017e9
    17bc:	0000189d 	.word	0x0000189d
    17c0:	0000189d 	.word	0x0000189d
    17c4:	0000189d 	.word	0x0000189d
    17c8:	0000189d 	.word	0x0000189d
    17cc:	000017f5 	.word	0x000017f5
    17d0:	0000189d 	.word	0x0000189d
    17d4:	0000189d 	.word	0x0000189d
    17d8:	00001827 	.word	0x00001827
    17dc:	0000189d 	.word	0x0000189d
    17e0:	00001841 	.word	0x00001841
    17e4:	00001827 	.word	0x00001827
			case NUL:
				break;
			case CR:
			case LF:
				c=CR;
    17e8:	230d      	movs	r3, #13
    17ea:	74fb      	strb	r3, [r7, #19]
				con.crlf();
    17ec:	4b41      	ldr	r3, [pc, #260]	; (18f4 <read_line+0x1cc>)
    17ee:	6c5b      	ldr	r3, [r3, #68]	; 0x44
    17f0:	4798      	blx	r3
				break;
    17f2:	e069      	b.n	18c8 <read_line+0x1a0>
			case CTRL_R:
				if (strlen(buffer)){
    17f4:	687b      	ldr	r3, [r7, #4]
    17f6:	781b      	ldrb	r3, [r3, #0]
    17f8:	2b00      	cmp	r3, #0
    17fa:	d013      	beq.n	1824 <read_line+0xfc>
					ll=strlen(buffer);
    17fc:	6878      	ldr	r0, [r7, #4]
    17fe:	f000 fd7f 	bl	2300 <strlen>
    1802:	4603      	mov	r3, r0
    1804:	60bb      	str	r3, [r7, #8]
					move(buffer,new_buff,ll);
    1806:	68bb      	ldr	r3, [r7, #8]
    1808:	6878      	ldr	r0, [r7, #4]
    180a:	68f9      	ldr	r1, [r7, #12]
    180c:	461a      	mov	r2, r3
    180e:	f000 fd59 	bl	22c4 <move>
					delete_nchar(line_len);
    1812:	697b      	ldr	r3, [r7, #20]
    1814:	4618      	mov	r0, r3
    1816:	f7ff ff6d 	bl	16f4 <delete_nchar>
					print(new_buff);
    181a:	68f8      	ldr	r0, [r7, #12]
    181c:	f7ff ff4e 	bl	16bc <print>
					line_len=ll;
    1820:	68bb      	ldr	r3, [r7, #8]
    1822:	617b      	str	r3, [r7, #20]
				}
				break;
    1824:	e050      	b.n	18c8 <read_line+0x1a0>
			case CTRL_X:
			case CTRL_U: // efface la ligne
				delete_nchar(line_len);
    1826:	697b      	ldr	r3, [r7, #20]
    1828:	4618      	mov	r0, r3
    182a:	f7ff ff63 	bl	16f4 <delete_nchar>
				line_len=0;
    182e:	2300      	movs	r3, #0
    1830:	617b      	str	r3, [r7, #20]
				break;
    1832:	e049      	b.n	18c8 <read_line+0x1a0>
			case CTRL_W: // efacce le dernier mot
				while (line_len && (new_buff[line_len-1]==SPACE)){
					con.delete_back();
    1834:	4b2f      	ldr	r3, [pc, #188]	; (18f4 <read_line+0x1cc>)
    1836:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1838:	4798      	blx	r3
					line_len--;
    183a:	697b      	ldr	r3, [r7, #20]
    183c:	3b01      	subs	r3, #1
    183e:	617b      	str	r3, [r7, #20]
			case CTRL_U: // efface la ligne
				delete_nchar(line_len);
				line_len=0;
				break;
			case CTRL_W: // efacce le dernier mot
				while (line_len && (new_buff[line_len-1]==SPACE)){
    1840:	697b      	ldr	r3, [r7, #20]
    1842:	2b00      	cmp	r3, #0
    1844:	d006      	beq.n	1854 <read_line+0x12c>
    1846:	697b      	ldr	r3, [r7, #20]
    1848:	3b01      	subs	r3, #1
    184a:	68fa      	ldr	r2, [r7, #12]
    184c:	4413      	add	r3, r2
    184e:	781b      	ldrb	r3, [r3, #0]
    1850:	2b20      	cmp	r3, #32
    1852:	d0ef      	beq.n	1834 <read_line+0x10c>
					con.delete_back();
					line_len--;
				}
				while (line_len && (new_buff[line_len-1]!=SPACE)){
    1854:	e005      	b.n	1862 <read_line+0x13a>
					con.delete_back();
    1856:	4b27      	ldr	r3, [pc, #156]	; (18f4 <read_line+0x1cc>)
    1858:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    185a:	4798      	blx	r3
					line_len--;
    185c:	697b      	ldr	r3, [r7, #20]
    185e:	3b01      	subs	r3, #1
    1860:	617b      	str	r3, [r7, #20]
			case CTRL_W: // efacce le dernier mot
				while (line_len && (new_buff[line_len-1]==SPACE)){
					con.delete_back();
					line_len--;
				}
				while (line_len && (new_buff[line_len-1]!=SPACE)){
    1862:	697b      	ldr	r3, [r7, #20]
    1864:	2b00      	cmp	r3, #0
    1866:	d006      	beq.n	1876 <read_line+0x14e>
    1868:	697b      	ldr	r3, [r7, #20]
    186a:	3b01      	subs	r3, #1
    186c:	68fa      	ldr	r2, [r7, #12]
    186e:	4413      	add	r3, r2
    1870:	781b      	ldrb	r3, [r3, #0]
    1872:	2b20      	cmp	r3, #32
    1874:	d1ef      	bne.n	1856 <read_line+0x12e>
					con.delete_back();
					line_len--;
				}
				break;
    1876:	e027      	b.n	18c8 <read_line+0x1a0>
			case BS:
				if (line_len){
    1878:	697b      	ldr	r3, [r7, #20]
    187a:	2b00      	cmp	r3, #0
    187c:	d005      	beq.n	188a <read_line+0x162>
					con.delete_back();
    187e:	4b1d      	ldr	r3, [pc, #116]	; (18f4 <read_line+0x1cc>)
    1880:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1882:	4798      	blx	r3
					line_len--;
    1884:	697b      	ldr	r3, [r7, #20]
    1886:	3b01      	subs	r3, #1
    1888:	617b      	str	r3, [r7, #20]
				}
				break;
    188a:	e01d      	b.n	18c8 <read_line+0x1a0>
			case CTRL_E: // efface l'écran
				con.cls();
    188c:	4b19      	ldr	r3, [pc, #100]	; (18f4 <read_line+0x1cc>)
    188e:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    1890:	4798      	blx	r3
				line_len=0;
    1892:	2300      	movs	r3, #0
    1894:	617b      	str	r3, [r7, #20]
				break;
    1896:	e017      	b.n	18c8 <read_line+0x1a0>
			case TAB:
				c=SPACE;
    1898:	2320      	movs	r3, #32
    189a:	74fb      	strb	r3, [r7, #19]
			default:
				if ((line_len<buf_len) && (c>=32)){
    189c:	697a      	ldr	r2, [r7, #20]
    189e:	683b      	ldr	r3, [r7, #0]
    18a0:	429a      	cmp	r2, r3
    18a2:	d20f      	bcs.n	18c4 <read_line+0x19c>
    18a4:	7cfb      	ldrb	r3, [r7, #19]
    18a6:	2b1f      	cmp	r3, #31
    18a8:	d90c      	bls.n	18c4 <read_line+0x19c>
					new_buff[line_len++]=c;
    18aa:	697b      	ldr	r3, [r7, #20]
    18ac:	1c5a      	adds	r2, r3, #1
    18ae:	617a      	str	r2, [r7, #20]
    18b0:	68fa      	ldr	r2, [r7, #12]
    18b2:	4413      	add	r3, r2
    18b4:	7cfa      	ldrb	r2, [r7, #19]
    18b6:	701a      	strb	r2, [r3, #0]
					con.putc(c);
    18b8:	4b0e      	ldr	r3, [pc, #56]	; (18f4 <read_line+0x1cc>)
    18ba:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    18bc:	7cfa      	ldrb	r2, [r7, #19]
    18be:	4610      	mov	r0, r2
    18c0:	4798      	blx	r3
    18c2:	e001      	b.n	18c8 <read_line+0x1a0>
				}else{
					beep();
    18c4:	f7ff ff2a 	bl	171c <beep>
	
	buf_len--;
	if (buf_len>(screen_width-cursor_x-1)){
		buf_len=screen_width-cursor_x-1;
	}
	while (c!=CR){
    18c8:	7cfb      	ldrb	r3, [r7, #19]
    18ca:	2b0d      	cmp	r3, #13
    18cc:	f47f af4e 	bne.w	176c <read_line+0x44>
				}else{
					beep();
				}
			}
	}
	move(new_buff,buffer,line_len);
    18d0:	697b      	ldr	r3, [r7, #20]
    18d2:	68f8      	ldr	r0, [r7, #12]
    18d4:	6879      	ldr	r1, [r7, #4]
    18d6:	461a      	mov	r2, r3
    18d8:	f000 fcf4 	bl	22c4 <move>
	free(new_buff);
    18dc:	68f8      	ldr	r0, [r7, #12]
    18de:	f7fe fd33 	bl	348 <free>
	return line_len;
    18e2:	697b      	ldr	r3, [r7, #20]
}
    18e4:	4618      	mov	r0, r3
    18e6:	3718      	adds	r7, #24
    18e8:	46bd      	mov	sp, r7
    18ea:	bd80      	pop	{r7, pc}
    18ec:	20000140 	.word	0x20000140
    18f0:	20000138 	.word	0x20000138
    18f4:	2000018c 	.word	0x2000018c

000018f8 <print_int>:

// imprime un entier
// i entier à imprimer
// base  numérique
void print_int(int i, unsigned base){
    18f8:	b580      	push	{r7, lr}
    18fa:	b08e      	sub	sp, #56	; 0x38
    18fc:	af00      	add	r7, sp, #0
    18fe:	6078      	str	r0, [r7, #4]
    1900:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
    1902:	2301      	movs	r3, #1
    1904:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
    1906:	2322      	movs	r3, #34	; 0x22
    1908:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
    190a:	2300      	movs	r3, #0
    190c:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
    1910:	687b      	ldr	r3, [r7, #4]
    1912:	2b00      	cmp	r3, #0
    1914:	da05      	bge.n	1922 <print_int+0x2a>
    1916:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    191a:	637b      	str	r3, [r7, #52]	; 0x34
    191c:	687b      	ldr	r3, [r7, #4]
    191e:	425b      	negs	r3, r3
    1920:	607b      	str	r3, [r7, #4]
	while (i){
    1922:	e02c      	b.n	197e <print_int+0x86>
		fmt[pos]=i%base+'0';
    1924:	687b      	ldr	r3, [r7, #4]
    1926:	683a      	ldr	r2, [r7, #0]
    1928:	fbb3 f2f2 	udiv	r2, r3, r2
    192c:	6839      	ldr	r1, [r7, #0]
    192e:	fb01 f202 	mul.w	r2, r1, r2
    1932:	1a9b      	subs	r3, r3, r2
    1934:	b2db      	uxtb	r3, r3
    1936:	3330      	adds	r3, #48	; 0x30
    1938:	b2d9      	uxtb	r1, r3
    193a:	f107 020c 	add.w	r2, r7, #12
    193e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1940:	4413      	add	r3, r2
    1942:	460a      	mov	r2, r1
    1944:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
    1946:	f107 020c 	add.w	r2, r7, #12
    194a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    194c:	4413      	add	r3, r2
    194e:	781b      	ldrb	r3, [r3, #0]
    1950:	2b39      	cmp	r3, #57	; 0x39
    1952:	d90c      	bls.n	196e <print_int+0x76>
    1954:	f107 020c 	add.w	r2, r7, #12
    1958:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    195a:	4413      	add	r3, r2
    195c:	781b      	ldrb	r3, [r3, #0]
    195e:	3307      	adds	r3, #7
    1960:	b2d9      	uxtb	r1, r3
    1962:	f107 020c 	add.w	r2, r7, #12
    1966:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1968:	4413      	add	r3, r2
    196a:	460a      	mov	r2, r1
    196c:	701a      	strb	r2, [r3, #0]
		pos--;
    196e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1970:	3b01      	subs	r3, #1
    1972:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
    1974:	687a      	ldr	r2, [r7, #4]
    1976:	683b      	ldr	r3, [r7, #0]
    1978:	fbb2 f3f3 	udiv	r3, r2, r3
    197c:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
    197e:	687b      	ldr	r3, [r7, #4]
    1980:	2b00      	cmp	r3, #0
    1982:	d1cf      	bne.n	1924 <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
    1984:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    1986:	2b22      	cmp	r3, #34	; 0x22
    1988:	d108      	bne.n	199c <print_int+0xa4>
    198a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    198c:	1e5a      	subs	r2, r3, #1
    198e:	633a      	str	r2, [r7, #48]	; 0x30
    1990:	f107 0238 	add.w	r2, r7, #56	; 0x38
    1994:	4413      	add	r3, r2
    1996:	2230      	movs	r2, #48	; 0x30
    1998:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
    199c:	6b7b      	ldr	r3, [r7, #52]	; 0x34
    199e:	2b00      	cmp	r3, #0
    19a0:	da08      	bge.n	19b4 <print_int+0xbc>
    19a2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19a4:	1e5a      	subs	r2, r3, #1
    19a6:	633a      	str	r2, [r7, #48]	; 0x30
    19a8:	f107 0238 	add.w	r2, r7, #56	; 0x38
    19ac:	4413      	add	r3, r2
    19ae:	222d      	movs	r2, #45	; 0x2d
    19b0:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
    19b4:	f107 020c 	add.w	r2, r7, #12
    19b8:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19ba:	4413      	add	r3, r2
    19bc:	2220      	movs	r2, #32
    19be:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    19c0:	f107 020c 	add.w	r2, r7, #12
    19c4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
    19c6:	4413      	add	r3, r2
    19c8:	4618      	mov	r0, r3
    19ca:	f7ff fe77 	bl	16bc <print>
}
    19ce:	3738      	adds	r7, #56	; 0x38
    19d0:	46bd      	mov	sp, r7
    19d2:	bd80      	pop	{r7, pc}

000019d4 <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
    19d4:	b580      	push	{r7, lr}
    19d6:	b088      	sub	sp, #32
    19d8:	af00      	add	r7, sp, #0
    19da:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
    19dc:	230c      	movs	r3, #12
    19de:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
    19e0:	2300      	movs	r3, #0
    19e2:	767b      	strb	r3, [r7, #25]
	while (u){
    19e4:	e026      	b.n	1a34 <print_hex+0x60>
		fmt[pos]=u%16+'0';
    19e6:	687b      	ldr	r3, [r7, #4]
    19e8:	b2db      	uxtb	r3, r3
    19ea:	f003 030f 	and.w	r3, r3, #15
    19ee:	b2db      	uxtb	r3, r3
    19f0:	3330      	adds	r3, #48	; 0x30
    19f2:	b2d9      	uxtb	r1, r3
    19f4:	f107 020c 	add.w	r2, r7, #12
    19f8:	69fb      	ldr	r3, [r7, #28]
    19fa:	4413      	add	r3, r2
    19fc:	460a      	mov	r2, r1
    19fe:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
    1a00:	f107 020c 	add.w	r2, r7, #12
    1a04:	69fb      	ldr	r3, [r7, #28]
    1a06:	4413      	add	r3, r2
    1a08:	781b      	ldrb	r3, [r3, #0]
    1a0a:	2b39      	cmp	r3, #57	; 0x39
    1a0c:	d90c      	bls.n	1a28 <print_hex+0x54>
    1a0e:	f107 020c 	add.w	r2, r7, #12
    1a12:	69fb      	ldr	r3, [r7, #28]
    1a14:	4413      	add	r3, r2
    1a16:	781b      	ldrb	r3, [r3, #0]
    1a18:	3307      	adds	r3, #7
    1a1a:	b2d9      	uxtb	r1, r3
    1a1c:	f107 020c 	add.w	r2, r7, #12
    1a20:	69fb      	ldr	r3, [r7, #28]
    1a22:	4413      	add	r3, r2
    1a24:	460a      	mov	r2, r1
    1a26:	701a      	strb	r2, [r3, #0]
		pos--;
    1a28:	69fb      	ldr	r3, [r7, #28]
    1a2a:	3b01      	subs	r3, #1
    1a2c:	61fb      	str	r3, [r7, #28]
		u/=16;
    1a2e:	687b      	ldr	r3, [r7, #4]
    1a30:	091b      	lsrs	r3, r3, #4
    1a32:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
    1a34:	687b      	ldr	r3, [r7, #4]
    1a36:	2b00      	cmp	r3, #0
    1a38:	d1d5      	bne.n	19e6 <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==12){fmt[pos--]='0';}
    1a3a:	69fb      	ldr	r3, [r7, #28]
    1a3c:	2b0c      	cmp	r3, #12
    1a3e:	d108      	bne.n	1a52 <print_hex+0x7e>
    1a40:	69fb      	ldr	r3, [r7, #28]
    1a42:	1e5a      	subs	r2, r3, #1
    1a44:	61fa      	str	r2, [r7, #28]
    1a46:	f107 0220 	add.w	r2, r7, #32
    1a4a:	4413      	add	r3, r2
    1a4c:	2230      	movs	r2, #48	; 0x30
    1a4e:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
    1a52:	69fb      	ldr	r3, [r7, #28]
    1a54:	1e5a      	subs	r2, r3, #1
    1a56:	61fa      	str	r2, [r7, #28]
    1a58:	f107 0220 	add.w	r2, r7, #32
    1a5c:	4413      	add	r3, r2
    1a5e:	2278      	movs	r2, #120	; 0x78
    1a60:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
    1a64:	69fb      	ldr	r3, [r7, #28]
    1a66:	1e5a      	subs	r2, r3, #1
    1a68:	61fa      	str	r2, [r7, #28]
    1a6a:	f107 0220 	add.w	r2, r7, #32
    1a6e:	4413      	add	r3, r2
    1a70:	2230      	movs	r2, #48	; 0x30
    1a72:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
    1a76:	f107 020c 	add.w	r2, r7, #12
    1a7a:	69fb      	ldr	r3, [r7, #28]
    1a7c:	4413      	add	r3, r2
    1a7e:	2220      	movs	r2, #32
    1a80:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
    1a82:	f107 020c 	add.w	r2, r7, #12
    1a86:	69fb      	ldr	r3, [r7, #28]
    1a88:	4413      	add	r3, r2
    1a8a:	4618      	mov	r0, r3
    1a8c:	f7ff fe16 	bl	16bc <print>
}
    1a90:	3720      	adds	r7, #32
    1a92:	46bd      	mov	sp, r7
    1a94:	bd80      	pop	{r7, pc}
    1a96:	bf00      	nop

00001a98 <cls>:

void cls(){
    1a98:	b580      	push	{r7, lr}
    1a9a:	af00      	add	r7, sp, #0
	con.cls();
    1a9c:	4b01      	ldr	r3, [pc, #4]	; (1aa4 <cls+0xc>)
    1a9e:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    1aa0:	4798      	blx	r3
}
    1aa2:	bd80      	pop	{r7, pc}
    1aa4:	2000018c 	.word	0x2000018c

00001aa8 <TIM4_handler>:

// interruption clignotement
// curseur texte
void CURSOR_blink_handler(){
    1aa8:	b580      	push	{r7, lr}
    1aaa:	b082      	sub	sp, #8
    1aac:	af02      	add	r7, sp, #8
	//CURSOR_TMR->SR&=~(BIT0); // clear interrupt bit
	if (CURSOR_TMR->SR&BIT0){ // UIF
    1aae:	4b12      	ldr	r3, [pc, #72]	; (1af8 <TIM4_handler+0x50>)
    1ab0:	691b      	ldr	r3, [r3, #16]
    1ab2:	f003 0301 	and.w	r3, r3, #1
    1ab6:	2b00      	cmp	r3, #0
    1ab8:	d01c      	beq.n	1af4 <TIM4_handler+0x4c>
		CURSOR_TMR->SR&=~BIT0;
    1aba:	4a0f      	ldr	r2, [pc, #60]	; (1af8 <TIM4_handler+0x50>)
    1abc:	4b0e      	ldr	r3, [pc, #56]	; (1af8 <TIM4_handler+0x50>)
    1abe:	691b      	ldr	r3, [r3, #16]
    1ac0:	f023 0301 	bic.w	r3, r3, #1
    1ac4:	6113      	str	r3, [r2, #16]
		gdi_box(cursor_x*CHAR_WIDTH,cursor_y*CHAR_HEIGHT,CHAR_WIDTH,CHAR_HEIGHT,XOR_BIT);
    1ac6:	4b0d      	ldr	r3, [pc, #52]	; (1afc <TIM4_handler+0x54>)
    1ac8:	681a      	ldr	r2, [r3, #0]
    1aca:	4613      	mov	r3, r2
    1acc:	005b      	lsls	r3, r3, #1
    1ace:	4413      	add	r3, r2
    1ad0:	005b      	lsls	r3, r3, #1
    1ad2:	4619      	mov	r1, r3
    1ad4:	4b0a      	ldr	r3, [pc, #40]	; (1b00 <TIM4_handler+0x58>)
    1ad6:	681b      	ldr	r3, [r3, #0]
    1ad8:	00da      	lsls	r2, r3, #3
    1ada:	2302      	movs	r3, #2
    1adc:	9300      	str	r3, [sp, #0]
    1ade:	4608      	mov	r0, r1
    1ae0:	4611      	mov	r1, r2
    1ae2:	2206      	movs	r2, #6
    1ae4:	2308      	movs	r3, #8
    1ae6:	f000 f98d 	bl	1e04 <gdi_box>
		cursor_visible=~cursor_visible;
    1aea:	4b06      	ldr	r3, [pc, #24]	; (1b04 <TIM4_handler+0x5c>)
    1aec:	681b      	ldr	r3, [r3, #0]
    1aee:	43db      	mvns	r3, r3
    1af0:	4a04      	ldr	r2, [pc, #16]	; (1b04 <TIM4_handler+0x5c>)
    1af2:	6013      	str	r3, [r2, #0]
	}
}
    1af4:	46bd      	mov	sp, r7
    1af6:	bd80      	pop	{r7, pc}
    1af8:	40000800 	.word	0x40000800
    1afc:	20000138 	.word	0x20000138
    1b00:	2000013c 	.word	0x2000013c
    1b04:	20000148 	.word	0x20000148

00001b08 <flash_enable>:
#define _flash_busy (FLASH->SR&FLASH_SR_BSY) 
#define _flash_eop (FLASH->SR&FLASH_SR_EOP)

// activation interface de programmation
//mémoire lash
int flash_enable(){
    1b08:	b480      	push	{r7}
    1b0a:	af00      	add	r7, sp, #0
	if (!(RCC->CR&RCC_CR_HSION)){ // activation clock HSI
    1b0c:	4b13      	ldr	r3, [pc, #76]	; (1b5c <flash_enable+0x54>)
    1b0e:	681b      	ldr	r3, [r3, #0]
    1b10:	f003 0301 	and.w	r3, r3, #1
    1b14:	2b00      	cmp	r3, #0
    1b16:	d10c      	bne.n	1b32 <flash_enable+0x2a>
		RCC->CR|=RCC_CR_HSION;
    1b18:	4a10      	ldr	r2, [pc, #64]	; (1b5c <flash_enable+0x54>)
    1b1a:	4b10      	ldr	r3, [pc, #64]	; (1b5c <flash_enable+0x54>)
    1b1c:	681b      	ldr	r3, [r3, #0]
    1b1e:	f043 0301 	orr.w	r3, r3, #1
    1b22:	6013      	str	r3, [r2, #0]
		while (!(RCC->CR&RCC_CR_HSIRDY));
    1b24:	bf00      	nop
    1b26:	4b0d      	ldr	r3, [pc, #52]	; (1b5c <flash_enable+0x54>)
    1b28:	681b      	ldr	r3, [r3, #0]
    1b2a:	f003 0302 	and.w	r3, r3, #2
    1b2e:	2b00      	cmp	r3, #0
    1b30:	d0f9      	beq.n	1b26 <flash_enable+0x1e>
		"str r0,%0\n\t"
		"str r1,%0\n\t"
		: "=r" FLASH_ITFR->KEYR
		: "I" 0x45670123, "I" 0xCDEF89AB
	);*/
	FLASH->KEYR=0x45670123;
    1b32:	4b0b      	ldr	r3, [pc, #44]	; (1b60 <flash_enable+0x58>)
    1b34:	4a0b      	ldr	r2, [pc, #44]	; (1b64 <flash_enable+0x5c>)
    1b36:	605a      	str	r2, [r3, #4]
	FLASH->KEYR=0xCDEF89AB;
    1b38:	4b09      	ldr	r3, [pc, #36]	; (1b60 <flash_enable+0x58>)
    1b3a:	4a0b      	ldr	r2, [pc, #44]	; (1b68 <flash_enable+0x60>)
    1b3c:	605a      	str	r2, [r3, #4]
	return !(FLASH->CR&FLASH_CR_LOCK);
    1b3e:	4b08      	ldr	r3, [pc, #32]	; (1b60 <flash_enable+0x58>)
    1b40:	691b      	ldr	r3, [r3, #16]
    1b42:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1b46:	2b00      	cmp	r3, #0
    1b48:	bf0c      	ite	eq
    1b4a:	2301      	moveq	r3, #1
    1b4c:	2300      	movne	r3, #0
    1b4e:	b2db      	uxtb	r3, r3
}
    1b50:	4618      	mov	r0, r3
    1b52:	46bd      	mov	sp, r7
    1b54:	f85d 7b04 	ldr.w	r7, [sp], #4
    1b58:	4770      	bx	lr
    1b5a:	bf00      	nop
    1b5c:	40021000 	.word	0x40021000
    1b60:	40022000 	.word	0x40022000
    1b64:	45670123 	.word	0x45670123
    1b68:	cdef89ab 	.word	0xcdef89ab

00001b6c <flash_disable>:

// désactivation interface de programmation
// mémoire flash
void flash_disable(){
    1b6c:	b480      	push	{r7}
    1b6e:	af00      	add	r7, sp, #0
	FLASH->CR|=FLASH_CR_LOCK;
    1b70:	4a04      	ldr	r2, [pc, #16]	; (1b84 <flash_disable+0x18>)
    1b72:	4b04      	ldr	r3, [pc, #16]	; (1b84 <flash_disable+0x18>)
    1b74:	691b      	ldr	r3, [r3, #16]
    1b76:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    1b7a:	6113      	str	r3, [r2, #16]
}
    1b7c:	46bd      	mov	sp, r7
    1b7e:	f85d 7b04 	ldr.w	r7, [sp], #4
    1b82:	4770      	bx	lr
    1b84:	40022000 	.word	0x40022000

00001b88 <flash_write>:

// écriture d'un mot 16 bits dans
// la mémoire flash
// retourne succès=1, erreur=0.
int flash_write(unsigned address, uint16_t hword){
    1b88:	b480      	push	{r7}
    1b8a:	b083      	sub	sp, #12
    1b8c:	af00      	add	r7, sp, #0
    1b8e:	6078      	str	r0, [r7, #4]
    1b90:	460b      	mov	r3, r1
    1b92:	807b      	strh	r3, [r7, #2]
	if (FLASH->CR&FLASH_CR_LOCK || (*(uint16_t*)address!=0xffff)) return 0;
    1b94:	4b1d      	ldr	r3, [pc, #116]	; (1c0c <flash_write+0x84>)
    1b96:	691b      	ldr	r3, [r3, #16]
    1b98:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1b9c:	2b00      	cmp	r3, #0
    1b9e:	d105      	bne.n	1bac <flash_write+0x24>
    1ba0:	687b      	ldr	r3, [r7, #4]
    1ba2:	881b      	ldrh	r3, [r3, #0]
    1ba4:	f64f 72ff 	movw	r2, #65535	; 0xffff
    1ba8:	4293      	cmp	r3, r2
    1baa:	d001      	beq.n	1bb0 <flash_write+0x28>
    1bac:	2300      	movs	r3, #0
    1bae:	e027      	b.n	1c00 <flash_write+0x78>
	while (_flash_busy);
    1bb0:	bf00      	nop
    1bb2:	4b16      	ldr	r3, [pc, #88]	; (1c0c <flash_write+0x84>)
    1bb4:	68db      	ldr	r3, [r3, #12]
    1bb6:	f003 0301 	and.w	r3, r3, #1
    1bba:	2b00      	cmp	r3, #0
    1bbc:	d1f9      	bne.n	1bb2 <flash_write+0x2a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1bbe:	4a13      	ldr	r2, [pc, #76]	; (1c0c <flash_write+0x84>)
    1bc0:	4b12      	ldr	r3, [pc, #72]	; (1c0c <flash_write+0x84>)
    1bc2:	68db      	ldr	r3, [r3, #12]
    1bc4:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1bc8:	60d3      	str	r3, [r2, #12]
	FLASH->CR=FLASH_CR_PG;
    1bca:	4b10      	ldr	r3, [pc, #64]	; (1c0c <flash_write+0x84>)
    1bcc:	2201      	movs	r2, #1
    1bce:	611a      	str	r2, [r3, #16]
	*(uint16_t*)address=hword;
    1bd0:	687b      	ldr	r3, [r7, #4]
    1bd2:	887a      	ldrh	r2, [r7, #2]
    1bd4:	801a      	strh	r2, [r3, #0]
	while (_flash_busy && ! _flash_eop);
    1bd6:	bf00      	nop
    1bd8:	4b0c      	ldr	r3, [pc, #48]	; (1c0c <flash_write+0x84>)
    1bda:	68db      	ldr	r3, [r3, #12]
    1bdc:	f003 0301 	and.w	r3, r3, #1
    1be0:	2b00      	cmp	r3, #0
    1be2:	d005      	beq.n	1bf0 <flash_write+0x68>
    1be4:	4b09      	ldr	r3, [pc, #36]	; (1c0c <flash_write+0x84>)
    1be6:	68db      	ldr	r3, [r3, #12]
    1be8:	f003 0320 	and.w	r3, r3, #32
    1bec:	2b00      	cmp	r3, #0
    1bee:	d0f3      	beq.n	1bd8 <flash_write+0x50>
	return (*(uint16_t*)address)==hword;
    1bf0:	687b      	ldr	r3, [r7, #4]
    1bf2:	881b      	ldrh	r3, [r3, #0]
    1bf4:	887a      	ldrh	r2, [r7, #2]
    1bf6:	429a      	cmp	r2, r3
    1bf8:	bf0c      	ite	eq
    1bfa:	2301      	moveq	r3, #1
    1bfc:	2300      	movne	r3, #0
    1bfe:	b2db      	uxtb	r3, r3
}
    1c00:	4618      	mov	r0, r3
    1c02:	370c      	adds	r7, #12
    1c04:	46bd      	mov	sp, r7
    1c06:	f85d 7b04 	ldr.w	r7, [sp], #4
    1c0a:	4770      	bx	lr
    1c0c:	40022000 	.word	0x40022000

00001c10 <flash_erase_page>:

// efface une page de 1024 octets
// retourne succcès=1, erreur=0
int flash_erase_page(uint32_t address){
    1c10:	b480      	push	{r7}
    1c12:	b087      	sub	sp, #28
    1c14:	af00      	add	r7, sp, #0
    1c16:	6078      	str	r0, [r7, #4]
	uint32_t *adr, u32;
	int i;

#define ERASED 0xffffffff
	
	if (FLASH->CR&FLASH_CR_LOCK) return 0; 
    1c18:	4b27      	ldr	r3, [pc, #156]	; (1cb8 <flash_erase_page+0xa8>)
    1c1a:	691b      	ldr	r3, [r3, #16]
    1c1c:	f003 0380 	and.w	r3, r3, #128	; 0x80
    1c20:	2b00      	cmp	r3, #0
    1c22:	d001      	beq.n	1c28 <flash_erase_page+0x18>
    1c24:	2300      	movs	r3, #0
    1c26:	e040      	b.n	1caa <flash_erase_page+0x9a>
	FLASH->SR|=FLASH_SR_PGERR|FLASH_SR_WRPTRERR|FLASH_SR_EOP;
    1c28:	4a23      	ldr	r2, [pc, #140]	; (1cb8 <flash_erase_page+0xa8>)
    1c2a:	4b23      	ldr	r3, [pc, #140]	; (1cb8 <flash_erase_page+0xa8>)
    1c2c:	68db      	ldr	r3, [r3, #12]
    1c2e:	f043 0334 	orr.w	r3, r3, #52	; 0x34
    1c32:	60d3      	str	r3, [r2, #12]
	address&=0xfffffc00;
    1c34:	687b      	ldr	r3, [r7, #4]
    1c36:	f423 737f 	bic.w	r3, r3, #1020	; 0x3fc
    1c3a:	f023 0303 	bic.w	r3, r3, #3
    1c3e:	607b      	str	r3, [r7, #4]
	FLASH->CR=FLASH_CR_PER;
    1c40:	4b1d      	ldr	r3, [pc, #116]	; (1cb8 <flash_erase_page+0xa8>)
    1c42:	2202      	movs	r2, #2
    1c44:	611a      	str	r2, [r3, #16]
	FLASH->AR=address;
    1c46:	4a1c      	ldr	r2, [pc, #112]	; (1cb8 <flash_erase_page+0xa8>)
    1c48:	687b      	ldr	r3, [r7, #4]
    1c4a:	6153      	str	r3, [r2, #20]
	FLASH->CR|=FLASH_CR_STRT;
    1c4c:	4a1a      	ldr	r2, [pc, #104]	; (1cb8 <flash_erase_page+0xa8>)
    1c4e:	4b1a      	ldr	r3, [pc, #104]	; (1cb8 <flash_erase_page+0xa8>)
    1c50:	691b      	ldr	r3, [r3, #16]
    1c52:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    1c56:	6113      	str	r3, [r2, #16]
	while (_flash_busy && ! _flash_eop);
    1c58:	bf00      	nop
    1c5a:	4b17      	ldr	r3, [pc, #92]	; (1cb8 <flash_erase_page+0xa8>)
    1c5c:	68db      	ldr	r3, [r3, #12]
    1c5e:	f003 0301 	and.w	r3, r3, #1
    1c62:	2b00      	cmp	r3, #0
    1c64:	d005      	beq.n	1c72 <flash_erase_page+0x62>
    1c66:	4b14      	ldr	r3, [pc, #80]	; (1cb8 <flash_erase_page+0xa8>)
    1c68:	68db      	ldr	r3, [r3, #12]
    1c6a:	f003 0320 	and.w	r3, r3, #32
    1c6e:	2b00      	cmp	r3, #0
    1c70:	d0f3      	beq.n	1c5a <flash_erase_page+0x4a>
	adr=(uint32_t*)address;
    1c72:	687b      	ldr	r3, [r7, #4]
    1c74:	617b      	str	r3, [r7, #20]
	for (i=0;i<256;i++){
    1c76:	2300      	movs	r3, #0
    1c78:	60fb      	str	r3, [r7, #12]
    1c7a:	e00c      	b.n	1c96 <flash_erase_page+0x86>
		u32=*adr++;
    1c7c:	697b      	ldr	r3, [r7, #20]
    1c7e:	1d1a      	adds	r2, r3, #4
    1c80:	617a      	str	r2, [r7, #20]
    1c82:	681b      	ldr	r3, [r3, #0]
    1c84:	613b      	str	r3, [r7, #16]
		if (u32!=ERASED) break;
    1c86:	693b      	ldr	r3, [r7, #16]
    1c88:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1c8c:	d000      	beq.n	1c90 <flash_erase_page+0x80>
    1c8e:	e005      	b.n	1c9c <flash_erase_page+0x8c>
	FLASH->CR=FLASH_CR_PER;
	FLASH->AR=address;
	FLASH->CR|=FLASH_CR_STRT;
	while (_flash_busy && ! _flash_eop);
	adr=(uint32_t*)address;
	for (i=0;i<256;i++){
    1c90:	68fb      	ldr	r3, [r7, #12]
    1c92:	3301      	adds	r3, #1
    1c94:	60fb      	str	r3, [r7, #12]
    1c96:	68fb      	ldr	r3, [r7, #12]
    1c98:	2bff      	cmp	r3, #255	; 0xff
    1c9a:	ddef      	ble.n	1c7c <flash_erase_page+0x6c>
		u32=*adr++;
		if (u32!=ERASED) break;
	}
	return u32==ERASED;
    1c9c:	693b      	ldr	r3, [r7, #16]
    1c9e:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1ca2:	bf0c      	ite	eq
    1ca4:	2301      	moveq	r3, #1
    1ca6:	2300      	movne	r3, #0
    1ca8:	b2db      	uxtb	r3, r3
}
    1caa:	4618      	mov	r0, r3
    1cac:	371c      	adds	r7, #28
    1cae:	46bd      	mov	sp, r7
    1cb0:	f85d 7b04 	ldr.w	r7, [sp], #4
    1cb4:	4770      	bx	lr
    1cb6:	bf00      	nop
    1cb8:	40022000 	.word	0x40022000

00001cbc <gdi_clear_screen>:
 * 
 */

#include "gdi.h"

void gdi_clear_screen(){
    1cbc:	b480      	push	{r7}
    1cbe:	b083      	sub	sp, #12
    1cc0:	af00      	add	r7, sp, #0
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    1cc2:	2300      	movs	r3, #0
    1cc4:	607b      	str	r3, [r7, #4]
    1cc6:	e006      	b.n	1cd6 <gdi_clear_screen+0x1a>
		video_buffer[i++]=0;
    1cc8:	687b      	ldr	r3, [r7, #4]
    1cca:	1c5a      	adds	r2, r3, #1
    1ccc:	607a      	str	r2, [r7, #4]
    1cce:	4a06      	ldr	r2, [pc, #24]	; (1ce8 <gdi_clear_screen+0x2c>)
    1cd0:	2100      	movs	r1, #0
    1cd2:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

#include "gdi.h"

void gdi_clear_screen(){
	int i;
	for (i=0;i<(ROW_SIZE*VRES);){
    1cd6:	687b      	ldr	r3, [r7, #4]
    1cd8:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1cdc:	dbf4      	blt.n	1cc8 <gdi_clear_screen+0xc>
		video_buffer[i++]=0;
	}
}
    1cde:	370c      	adds	r7, #12
    1ce0:	46bd      	mov	sp, r7
    1ce2:	f85d 7b04 	ldr.w	r7, [sp], #4
    1ce6:	4770      	bx	lr
    1ce8:	200001d8 	.word	0x200001d8

00001cec <gdi_scroll_up>:

// glisse vers le haut de n lignes.
void gdi_scroll_up(unsigned n){
    1cec:	b580      	push	{r7, lr}
    1cee:	b084      	sub	sp, #16
    1cf0:	af00      	add	r7, sp, #0
    1cf2:	6078      	str	r0, [r7, #4]
	int i,j=0;
    1cf4:	2300      	movs	r3, #0
    1cf6:	60bb      	str	r3, [r7, #8]
	if (n>=VRES){gdi_clear_screen();return;}
    1cf8:	687b      	ldr	r3, [r7, #4]
    1cfa:	2bef      	cmp	r3, #239	; 0xef
    1cfc:	d902      	bls.n	1d04 <gdi_scroll_up+0x18>
    1cfe:	f7ff ffdd 	bl	1cbc <gdi_clear_screen>
    1d02:	e02a      	b.n	1d5a <gdi_scroll_up+0x6e>
	for (i=n*ROW_SIZE;i<ROW_SIZE*VRES;){
    1d04:	687a      	ldr	r2, [r7, #4]
    1d06:	4613      	mov	r3, r2
    1d08:	009b      	lsls	r3, r3, #2
    1d0a:	4413      	add	r3, r2
    1d0c:	009b      	lsls	r3, r3, #2
    1d0e:	60fb      	str	r3, [r7, #12]
    1d10:	e00b      	b.n	1d2a <gdi_scroll_up+0x3e>
		video_buffer[j++]=video_buffer[i++];
    1d12:	68bb      	ldr	r3, [r7, #8]
    1d14:	1c5a      	adds	r2, r3, #1
    1d16:	60ba      	str	r2, [r7, #8]
    1d18:	68fa      	ldr	r2, [r7, #12]
    1d1a:	1c51      	adds	r1, r2, #1
    1d1c:	60f9      	str	r1, [r7, #12]
    1d1e:	4910      	ldr	r1, [pc, #64]	; (1d60 <gdi_scroll_up+0x74>)
    1d20:	f831 1012 	ldrh.w	r1, [r1, r2, lsl #1]
    1d24:	4a0e      	ldr	r2, [pc, #56]	; (1d60 <gdi_scroll_up+0x74>)
    1d26:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]

// glisse vers le haut de n lignes.
void gdi_scroll_up(unsigned n){
	int i,j=0;
	if (n>=VRES){gdi_clear_screen();return;}
	for (i=n*ROW_SIZE;i<ROW_SIZE*VRES;){
    1d2a:	68fb      	ldr	r3, [r7, #12]
    1d2c:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1d30:	dbef      	blt.n	1d12 <gdi_scroll_up+0x26>
		video_buffer[j++]=video_buffer[i++];
	}
	// efface bas de l'écran
	for (i=ROW_SIZE*VRES-n*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1d32:	687a      	ldr	r2, [r7, #4]
    1d34:	4613      	mov	r3, r2
    1d36:	009b      	lsls	r3, r3, #2
    1d38:	4413      	add	r3, r2
    1d3a:	009b      	lsls	r3, r3, #2
    1d3c:	f5c3 5396 	rsb	r3, r3, #4800	; 0x12c0
    1d40:	60fb      	str	r3, [r7, #12]
    1d42:	e006      	b.n	1d52 <gdi_scroll_up+0x66>
		video_buffer[i++]=0;
    1d44:	68fb      	ldr	r3, [r7, #12]
    1d46:	1c5a      	adds	r2, r3, #1
    1d48:	60fa      	str	r2, [r7, #12]
    1d4a:	4a05      	ldr	r2, [pc, #20]	; (1d60 <gdi_scroll_up+0x74>)
    1d4c:	2100      	movs	r1, #0
    1d4e:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
	if (n>=VRES){gdi_clear_screen();return;}
	for (i=n*ROW_SIZE;i<ROW_SIZE*VRES;){
		video_buffer[j++]=video_buffer[i++];
	}
	// efface bas de l'écran
	for (i=ROW_SIZE*VRES-n*ROW_SIZE;i<(ROW_SIZE*VRES);){
    1d52:	68fb      	ldr	r3, [r7, #12]
    1d54:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    1d58:	dbf4      	blt.n	1d44 <gdi_scroll_up+0x58>
		video_buffer[i++]=0;
	}
}
    1d5a:	3710      	adds	r7, #16
    1d5c:	46bd      	mov	sp, r7
    1d5e:	bd80      	pop	{r7, pc}
    1d60:	200001d8 	.word	0x200001d8

00001d64 <gdi_bit_op>:

void gdi_bit_op(int x, int y, bitop_e op){
    1d64:	b480      	push	{r7}
    1d66:	b087      	sub	sp, #28
    1d68:	af00      	add	r7, sp, #0
    1d6a:	60f8      	str	r0, [r7, #12]
    1d6c:	60b9      	str	r1, [r7, #8]
    1d6e:	4613      	mov	r3, r2
    1d70:	71fb      	strb	r3, [r7, #7]
	uint16_t bit;
	int offset=y*ROW_SIZE+(x>>4);
    1d72:	68ba      	ldr	r2, [r7, #8]
    1d74:	4613      	mov	r3, r2
    1d76:	009b      	lsls	r3, r3, #2
    1d78:	4413      	add	r3, r2
    1d7a:	009b      	lsls	r3, r3, #2
    1d7c:	461a      	mov	r2, r3
    1d7e:	68fb      	ldr	r3, [r7, #12]
    1d80:	111b      	asrs	r3, r3, #4
    1d82:	4413      	add	r3, r2
    1d84:	617b      	str	r3, [r7, #20]
	bit=1<<(15-(x&15));
    1d86:	68fb      	ldr	r3, [r7, #12]
    1d88:	43db      	mvns	r3, r3
    1d8a:	f003 030f 	and.w	r3, r3, #15
    1d8e:	2201      	movs	r2, #1
    1d90:	fa02 f303 	lsl.w	r3, r2, r3
    1d94:	827b      	strh	r3, [r7, #18]
	switch (op){
    1d96:	79fb      	ldrb	r3, [r7, #7]
    1d98:	2b01      	cmp	r3, #1
    1d9a:	d013      	beq.n	1dc4 <gdi_bit_op+0x60>
    1d9c:	2b02      	cmp	r3, #2
    1d9e:	d01d      	beq.n	1ddc <gdi_bit_op+0x78>
    1da0:	2b00      	cmp	r3, #0
    1da2:	d127      	bne.n	1df4 <gdi_bit_op+0x90>
	case BLACK_BIT:
		video_buffer[offset]&=~bit;
    1da4:	4a16      	ldr	r2, [pc, #88]	; (1e00 <gdi_bit_op+0x9c>)
    1da6:	697b      	ldr	r3, [r7, #20]
    1da8:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1dac:	b29a      	uxth	r2, r3
    1dae:	8a7b      	ldrh	r3, [r7, #18]
    1db0:	43db      	mvns	r3, r3
    1db2:	b29b      	uxth	r3, r3
    1db4:	4013      	ands	r3, r2
    1db6:	b29b      	uxth	r3, r3
    1db8:	b299      	uxth	r1, r3
    1dba:	4a11      	ldr	r2, [pc, #68]	; (1e00 <gdi_bit_op+0x9c>)
    1dbc:	697b      	ldr	r3, [r7, #20]
    1dbe:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1dc2:	e017      	b.n	1df4 <gdi_bit_op+0x90>
	case WHITE_BIT:
		video_buffer[offset]|=bit;
    1dc4:	4a0e      	ldr	r2, [pc, #56]	; (1e00 <gdi_bit_op+0x9c>)
    1dc6:	697b      	ldr	r3, [r7, #20]
    1dc8:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1dcc:	8a7b      	ldrh	r3, [r7, #18]
    1dce:	4313      	orrs	r3, r2
    1dd0:	b299      	uxth	r1, r3
    1dd2:	4a0b      	ldr	r2, [pc, #44]	; (1e00 <gdi_bit_op+0x9c>)
    1dd4:	697b      	ldr	r3, [r7, #20]
    1dd6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1dda:	e00b      	b.n	1df4 <gdi_bit_op+0x90>
	case XOR_BIT:
		video_buffer[offset]^=bit;
    1ddc:	4a08      	ldr	r2, [pc, #32]	; (1e00 <gdi_bit_op+0x9c>)
    1dde:	697b      	ldr	r3, [r7, #20]
    1de0:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
    1de4:	8a7b      	ldrh	r3, [r7, #18]
    1de6:	4053      	eors	r3, r2
    1de8:	b299      	uxth	r1, r3
    1dea:	4a05      	ldr	r2, [pc, #20]	; (1e00 <gdi_bit_op+0x9c>)
    1dec:	697b      	ldr	r3, [r7, #20]
    1dee:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
		break;
    1df2:	bf00      	nop
	}
}
    1df4:	371c      	adds	r7, #28
    1df6:	46bd      	mov	sp, r7
    1df8:	f85d 7b04 	ldr.w	r7, [sp], #4
    1dfc:	4770      	bx	lr
    1dfe:	bf00      	nop
    1e00:	200001d8 	.word	0x200001d8

00001e04 <gdi_box>:

void gdi_box(int x, int y, int w, int h, bitop_e op){
    1e04:	b580      	push	{r7, lr}
    1e06:	b086      	sub	sp, #24
    1e08:	af00      	add	r7, sp, #0
    1e0a:	60f8      	str	r0, [r7, #12]
    1e0c:	60b9      	str	r1, [r7, #8]
    1e0e:	607a      	str	r2, [r7, #4]
    1e10:	603b      	str	r3, [r7, #0]
	int r,c;
	
	for (r=0;r<h;r++){
    1e12:	2300      	movs	r3, #0
    1e14:	617b      	str	r3, [r7, #20]
    1e16:	e02e      	b.n	1e76 <gdi_box+0x72>
		for (c=0;c<w;c++){
    1e18:	2300      	movs	r3, #0
    1e1a:	613b      	str	r3, [r7, #16]
    1e1c:	e024      	b.n	1e68 <gdi_box+0x64>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    1e1e:	68fa      	ldr	r2, [r7, #12]
    1e20:	693b      	ldr	r3, [r7, #16]
    1e22:	4413      	add	r3, r2
    1e24:	2b00      	cmp	r3, #0
    1e26:	db1c      	blt.n	1e62 <gdi_box+0x5e>
    1e28:	68fa      	ldr	r2, [r7, #12]
    1e2a:	693b      	ldr	r3, [r7, #16]
    1e2c:	4413      	add	r3, r2
    1e2e:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    1e32:	da16      	bge.n	1e62 <gdi_box+0x5e>
    1e34:	697a      	ldr	r2, [r7, #20]
    1e36:	68bb      	ldr	r3, [r7, #8]
    1e38:	4413      	add	r3, r2
    1e3a:	2b00      	cmp	r3, #0
    1e3c:	db11      	blt.n	1e62 <gdi_box+0x5e>
    1e3e:	697a      	ldr	r2, [r7, #20]
    1e40:	68bb      	ldr	r3, [r7, #8]
    1e42:	4413      	add	r3, r2
    1e44:	2bef      	cmp	r3, #239	; 0xef
    1e46:	dc0c      	bgt.n	1e62 <gdi_box+0x5e>
				gdi_bit_op(c+x,r+y,op);
    1e48:	693a      	ldr	r2, [r7, #16]
    1e4a:	68fb      	ldr	r3, [r7, #12]
    1e4c:	18d1      	adds	r1, r2, r3
    1e4e:	697a      	ldr	r2, [r7, #20]
    1e50:	68bb      	ldr	r3, [r7, #8]
    1e52:	441a      	add	r2, r3
    1e54:	f897 3020 	ldrb.w	r3, [r7, #32]
    1e58:	4608      	mov	r0, r1
    1e5a:	4611      	mov	r1, r2
    1e5c:	461a      	mov	r2, r3
    1e5e:	f7ff ff81 	bl	1d64 <gdi_bit_op>

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
		for (c=0;c<w;c++){
    1e62:	693b      	ldr	r3, [r7, #16]
    1e64:	3301      	adds	r3, #1
    1e66:	613b      	str	r3, [r7, #16]
    1e68:	693a      	ldr	r2, [r7, #16]
    1e6a:	687b      	ldr	r3, [r7, #4]
    1e6c:	429a      	cmp	r2, r3
    1e6e:	dbd6      	blt.n	1e1e <gdi_box+0x1a>
}

void gdi_box(int x, int y, int w, int h, bitop_e op){
	int r,c;
	
	for (r=0;r<h;r++){
    1e70:	697b      	ldr	r3, [r7, #20]
    1e72:	3301      	adds	r3, #1
    1e74:	617b      	str	r3, [r7, #20]
    1e76:	697a      	ldr	r2, [r7, #20]
    1e78:	683b      	ldr	r3, [r7, #0]
    1e7a:	429a      	cmp	r2, r3
    1e7c:	dbcc      	blt.n	1e18 <gdi_box+0x14>
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
				gdi_bit_op(c+x,r+y,op);
			}
		}
	}
}
    1e7e:	3718      	adds	r7, #24
    1e80:	46bd      	mov	sp, r7
    1e82:	bd80      	pop	{r7, pc}

00001e84 <gdi_put_sprite>:

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
    1e84:	b480      	push	{r7}
    1e86:	b089      	sub	sp, #36	; 0x24
    1e88:	af00      	add	r7, sp, #0
    1e8a:	60f8      	str	r0, [r7, #12]
    1e8c:	60b9      	str	r1, [r7, #8]
    1e8e:	607a      	str	r2, [r7, #4]
    1e90:	603b      	str	r3, [r7, #0]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1e92:	2300      	movs	r3, #0
    1e94:	61fb      	str	r3, [r7, #28]
    1e96:	e099      	b.n	1fcc <gdi_put_sprite+0x148>
		mask=128;
    1e98:	2380      	movs	r3, #128	; 0x80
    1e9a:	75fb      	strb	r3, [r7, #23]
		for(c=0;c<w;c++){
    1e9c:	2300      	movs	r3, #0
    1e9e:	61bb      	str	r3, [r7, #24]
    1ea0:	e08c      	b.n	1fbc <gdi_put_sprite+0x138>
			if (!mask){
    1ea2:	7dfb      	ldrb	r3, [r7, #23]
    1ea4:	2b00      	cmp	r3, #0
    1ea6:	d104      	bne.n	1eb2 <gdi_put_sprite+0x2e>
				sprite++;
    1ea8:	6abb      	ldr	r3, [r7, #40]	; 0x28
    1eaa:	3301      	adds	r3, #1
    1eac:	62bb      	str	r3, [r7, #40]	; 0x28
				mask=128;
    1eae:	2380      	movs	r3, #128	; 0x80
    1eb0:	75fb      	strb	r3, [r7, #23]
			}
			if ((x+c)>=0 && (x+c)<HRES && (r+y)>=0 && (r+y)<VRES){
    1eb2:	68fa      	ldr	r2, [r7, #12]
    1eb4:	69bb      	ldr	r3, [r7, #24]
    1eb6:	4413      	add	r3, r2
    1eb8:	2b00      	cmp	r3, #0
    1eba:	db79      	blt.n	1fb0 <gdi_put_sprite+0x12c>
    1ebc:	68fa      	ldr	r2, [r7, #12]
    1ebe:	69bb      	ldr	r3, [r7, #24]
    1ec0:	4413      	add	r3, r2
    1ec2:	f5b3 7fa0 	cmp.w	r3, #320	; 0x140
    1ec6:	da73      	bge.n	1fb0 <gdi_put_sprite+0x12c>
    1ec8:	69fa      	ldr	r2, [r7, #28]
    1eca:	68bb      	ldr	r3, [r7, #8]
    1ecc:	4413      	add	r3, r2
    1ece:	2b00      	cmp	r3, #0
    1ed0:	db6e      	blt.n	1fb0 <gdi_put_sprite+0x12c>
    1ed2:	69fa      	ldr	r2, [r7, #28]
    1ed4:	68bb      	ldr	r3, [r7, #8]
    1ed6:	4413      	add	r3, r2
    1ed8:	2bef      	cmp	r3, #239	; 0xef
    1eda:	dc69      	bgt.n	1fb0 <gdi_put_sprite+0x12c>
				if (sprite[r]&mask){
    1edc:	69fb      	ldr	r3, [r7, #28]
    1ede:	6aba      	ldr	r2, [r7, #40]	; 0x28
    1ee0:	4413      	add	r3, r2
    1ee2:	781a      	ldrb	r2, [r3, #0]
    1ee4:	7dfb      	ldrb	r3, [r7, #23]
    1ee6:	4013      	ands	r3, r2
    1ee8:	b2db      	uxtb	r3, r3
    1eea:	2b00      	cmp	r3, #0
    1eec:	d02f      	beq.n	1f4e <gdi_put_sprite+0xca>
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]|=(1<<(15-((c+x)&15)));
    1eee:	69fa      	ldr	r2, [r7, #28]
    1ef0:	68bb      	ldr	r3, [r7, #8]
    1ef2:	441a      	add	r2, r3
    1ef4:	4613      	mov	r3, r2
    1ef6:	009b      	lsls	r3, r3, #2
    1ef8:	4413      	add	r3, r2
    1efa:	009b      	lsls	r3, r3, #2
    1efc:	4619      	mov	r1, r3
    1efe:	69ba      	ldr	r2, [r7, #24]
    1f00:	68fb      	ldr	r3, [r7, #12]
    1f02:	4413      	add	r3, r2
    1f04:	111b      	asrs	r3, r3, #4
    1f06:	4419      	add	r1, r3
    1f08:	69fa      	ldr	r2, [r7, #28]
    1f0a:	68bb      	ldr	r3, [r7, #8]
    1f0c:	441a      	add	r2, r3
    1f0e:	4613      	mov	r3, r2
    1f10:	009b      	lsls	r3, r3, #2
    1f12:	4413      	add	r3, r2
    1f14:	009b      	lsls	r3, r3, #2
    1f16:	4618      	mov	r0, r3
    1f18:	69ba      	ldr	r2, [r7, #24]
    1f1a:	68fb      	ldr	r3, [r7, #12]
    1f1c:	4413      	add	r3, r2
    1f1e:	111b      	asrs	r3, r3, #4
    1f20:	4403      	add	r3, r0
    1f22:	4a2f      	ldr	r2, [pc, #188]	; (1fe0 <gdi_put_sprite+0x15c>)
    1f24:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1f28:	b298      	uxth	r0, r3
    1f2a:	69ba      	ldr	r2, [r7, #24]
    1f2c:	68fb      	ldr	r3, [r7, #12]
    1f2e:	4413      	add	r3, r2
    1f30:	43db      	mvns	r3, r3
    1f32:	f003 030f 	and.w	r3, r3, #15
    1f36:	2201      	movs	r2, #1
    1f38:	fa02 f303 	lsl.w	r3, r2, r3
    1f3c:	b29b      	uxth	r3, r3
    1f3e:	4602      	mov	r2, r0
    1f40:	4313      	orrs	r3, r2
    1f42:	b29b      	uxth	r3, r3
    1f44:	b29a      	uxth	r2, r3
    1f46:	4b26      	ldr	r3, [pc, #152]	; (1fe0 <gdi_put_sprite+0x15c>)
    1f48:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
    1f4c:	e030      	b.n	1fb0 <gdi_put_sprite+0x12c>
				}else{
					video_buffer[ROW_SIZE*(r+y)+((c+x)>>4)]&=~(1<<(15-((c+x)&15)));
    1f4e:	69fa      	ldr	r2, [r7, #28]
    1f50:	68bb      	ldr	r3, [r7, #8]
    1f52:	441a      	add	r2, r3
    1f54:	4613      	mov	r3, r2
    1f56:	009b      	lsls	r3, r3, #2
    1f58:	4413      	add	r3, r2
    1f5a:	009b      	lsls	r3, r3, #2
    1f5c:	4619      	mov	r1, r3
    1f5e:	69ba      	ldr	r2, [r7, #24]
    1f60:	68fb      	ldr	r3, [r7, #12]
    1f62:	4413      	add	r3, r2
    1f64:	111b      	asrs	r3, r3, #4
    1f66:	4419      	add	r1, r3
    1f68:	69fa      	ldr	r2, [r7, #28]
    1f6a:	68bb      	ldr	r3, [r7, #8]
    1f6c:	441a      	add	r2, r3
    1f6e:	4613      	mov	r3, r2
    1f70:	009b      	lsls	r3, r3, #2
    1f72:	4413      	add	r3, r2
    1f74:	009b      	lsls	r3, r3, #2
    1f76:	4618      	mov	r0, r3
    1f78:	69ba      	ldr	r2, [r7, #24]
    1f7a:	68fb      	ldr	r3, [r7, #12]
    1f7c:	4413      	add	r3, r2
    1f7e:	111b      	asrs	r3, r3, #4
    1f80:	4403      	add	r3, r0
    1f82:	4a17      	ldr	r2, [pc, #92]	; (1fe0 <gdi_put_sprite+0x15c>)
    1f84:	f832 3013 	ldrh.w	r3, [r2, r3, lsl #1]
    1f88:	b298      	uxth	r0, r3
    1f8a:	69ba      	ldr	r2, [r7, #24]
    1f8c:	68fb      	ldr	r3, [r7, #12]
    1f8e:	4413      	add	r3, r2
    1f90:	43db      	mvns	r3, r3
    1f92:	f003 030f 	and.w	r3, r3, #15
    1f96:	2201      	movs	r2, #1
    1f98:	fa02 f303 	lsl.w	r3, r2, r3
    1f9c:	b29b      	uxth	r3, r3
    1f9e:	43db      	mvns	r3, r3
    1fa0:	b29b      	uxth	r3, r3
    1fa2:	4602      	mov	r2, r0
    1fa4:	4013      	ands	r3, r2
    1fa6:	b29b      	uxth	r3, r3
    1fa8:	b29a      	uxth	r2, r3
    1faa:	4b0d      	ldr	r3, [pc, #52]	; (1fe0 <gdi_put_sprite+0x15c>)
    1fac:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
				//bit=sprite[r]&mask?(1<<(15-((c+x)&15))):0;
				//video_buffer[(ROW_SIZE*(r+y))+((c+x)>>4)]|=bit;
				//bit=sprite[r]&mask?WHITE_BIT:BLACK_BIT;
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
    1fb0:	7dfb      	ldrb	r3, [r7, #23]
    1fb2:	085b      	lsrs	r3, r3, #1
    1fb4:	75fb      	strb	r3, [r7, #23]
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
		mask=128;
		for(c=0;c<w;c++){
    1fb6:	69bb      	ldr	r3, [r7, #24]
    1fb8:	3301      	adds	r3, #1
    1fba:	61bb      	str	r3, [r7, #24]
    1fbc:	69ba      	ldr	r2, [r7, #24]
    1fbe:	687b      	ldr	r3, [r7, #4]
    1fc0:	429a      	cmp	r2, r3
    1fc2:	f6ff af6e 	blt.w	1ea2 <gdi_put_sprite+0x1e>

void gdi_put_sprite(int x, int y, int w, int h, const unsigned char *sprite){
	int r,c;
	char mask;
	uint16_t bit;
	for (r=0;r<h;r++){
    1fc6:	69fb      	ldr	r3, [r7, #28]
    1fc8:	3301      	adds	r3, #1
    1fca:	61fb      	str	r3, [r7, #28]
    1fcc:	69fa      	ldr	r2, [r7, #28]
    1fce:	683b      	ldr	r3, [r7, #0]
    1fd0:	429a      	cmp	r2, r3
    1fd2:	f6ff af61 	blt.w	1e98 <gdi_put_sprite+0x14>
				//gdi_bit_op(c+x,r+y,bit);
			}
			mask>>=1;
		}//for (j...
	}//for(i...
}
    1fd6:	3724      	adds	r7, #36	; 0x24
    1fd8:	46bd      	mov	sp, r7
    1fda:	f85d 7b04 	ldr.w	r7, [sp], #4
    1fde:	4770      	bx	lr
    1fe0:	200001d8 	.word	0x200001d8

00001fe4 <gdi_clear_rows>:

void gdi_clear_rows(int y, int count){
    1fe4:	b480      	push	{r7}
    1fe6:	b085      	sub	sp, #20
    1fe8:	af00      	add	r7, sp, #0
    1fea:	6078      	str	r0, [r7, #4]
    1fec:	6039      	str	r1, [r7, #0]
	int i,limit;
	if (y<0){y=0;}
    1fee:	687b      	ldr	r3, [r7, #4]
    1ff0:	2b00      	cmp	r3, #0
    1ff2:	da01      	bge.n	1ff8 <gdi_clear_rows+0x14>
    1ff4:	2300      	movs	r3, #0
    1ff6:	607b      	str	r3, [r7, #4]
	limit=(y+count)*ROW_SIZE;
    1ff8:	687a      	ldr	r2, [r7, #4]
    1ffa:	683b      	ldr	r3, [r7, #0]
    1ffc:	441a      	add	r2, r3
    1ffe:	4613      	mov	r3, r2
    2000:	009b      	lsls	r3, r3, #2
    2002:	4413      	add	r3, r2
    2004:	009b      	lsls	r3, r3, #2
    2006:	60bb      	str	r3, [r7, #8]
	if (limit>(HRES*VRES)){limit=HRES*VRES;}
    2008:	68bb      	ldr	r3, [r7, #8]
    200a:	f5b3 3f96 	cmp.w	r3, #76800	; 0x12c00
    200e:	dd02      	ble.n	2016 <gdi_clear_rows+0x32>
    2010:	f44f 3396 	mov.w	r3, #76800	; 0x12c00
    2014:	60bb      	str	r3, [r7, #8]
	for (i=y*ROW_SIZE;i<limit;i++){
    2016:	687a      	ldr	r2, [r7, #4]
    2018:	4613      	mov	r3, r2
    201a:	009b      	lsls	r3, r3, #2
    201c:	4413      	add	r3, r2
    201e:	009b      	lsls	r3, r3, #2
    2020:	60fb      	str	r3, [r7, #12]
    2022:	e007      	b.n	2034 <gdi_clear_rows+0x50>
		video_buffer[i]=0;
    2024:	4a08      	ldr	r2, [pc, #32]	; (2048 <gdi_clear_rows+0x64>)
    2026:	68fb      	ldr	r3, [r7, #12]
    2028:	2100      	movs	r1, #0
    202a:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
void gdi_clear_rows(int y, int count){
	int i,limit;
	if (y<0){y=0;}
	limit=(y+count)*ROW_SIZE;
	if (limit>(HRES*VRES)){limit=HRES*VRES;}
	for (i=y*ROW_SIZE;i<limit;i++){
    202e:	68fb      	ldr	r3, [r7, #12]
    2030:	3301      	adds	r3, #1
    2032:	60fb      	str	r3, [r7, #12]
    2034:	68fa      	ldr	r2, [r7, #12]
    2036:	68bb      	ldr	r3, [r7, #8]
    2038:	429a      	cmp	r2, r3
    203a:	dbf3      	blt.n	2024 <gdi_clear_rows+0x40>
		video_buffer[i]=0;
	}
}
    203c:	3714      	adds	r7, #20
    203e:	46bd      	mov	sp, r7
    2040:	f85d 7b04 	ldr.w	r7, [sp], #4
    2044:	4770      	bx	lr
    2046:	bf00      	nop
    2048:	200001d8 	.word	0x200001d8

0000204c <gdi_rect>:

void gdi_rect(int x, int y, int w, int h, bitop_e op){
    204c:	b580      	push	{r7, lr}
    204e:	b086      	sub	sp, #24
    2050:	af00      	add	r7, sp, #0
    2052:	60f8      	str	r0, [r7, #12]
    2054:	60b9      	str	r1, [r7, #8]
    2056:	607a      	str	r2, [r7, #4]
    2058:	603b      	str	r3, [r7, #0]
	int i;
	//ligne horizontales
	for (i=x;i<(x+w);i++){
    205a:	68fb      	ldr	r3, [r7, #12]
    205c:	617b      	str	r3, [r7, #20]
    205e:	e014      	b.n	208a <gdi_rect+0x3e>
			gdi_bit_op(i,y,op);
    2060:	f897 3020 	ldrb.w	r3, [r7, #32]
    2064:	6978      	ldr	r0, [r7, #20]
    2066:	68b9      	ldr	r1, [r7, #8]
    2068:	461a      	mov	r2, r3
    206a:	f7ff fe7b 	bl	1d64 <gdi_bit_op>
			gdi_bit_op(i,y+h-1,op);
    206e:	68ba      	ldr	r2, [r7, #8]
    2070:	683b      	ldr	r3, [r7, #0]
    2072:	4413      	add	r3, r2
    2074:	1e5a      	subs	r2, r3, #1
    2076:	f897 3020 	ldrb.w	r3, [r7, #32]
    207a:	6978      	ldr	r0, [r7, #20]
    207c:	4611      	mov	r1, r2
    207e:	461a      	mov	r2, r3
    2080:	f7ff fe70 	bl	1d64 <gdi_bit_op>
}

void gdi_rect(int x, int y, int w, int h, bitop_e op){
	int i;
	//ligne horizontales
	for (i=x;i<(x+w);i++){
    2084:	697b      	ldr	r3, [r7, #20]
    2086:	3301      	adds	r3, #1
    2088:	617b      	str	r3, [r7, #20]
    208a:	68fa      	ldr	r2, [r7, #12]
    208c:	687b      	ldr	r3, [r7, #4]
    208e:	441a      	add	r2, r3
    2090:	697b      	ldr	r3, [r7, #20]
    2092:	429a      	cmp	r2, r3
    2094:	dce4      	bgt.n	2060 <gdi_rect+0x14>
			gdi_bit_op(i,y,op);
			gdi_bit_op(i,y+h-1,op);
	}
    // lignes verticales
	for (i=y+1;i<(y+h-1);i++){
    2096:	68bb      	ldr	r3, [r7, #8]
    2098:	3301      	adds	r3, #1
    209a:	617b      	str	r3, [r7, #20]
    209c:	e014      	b.n	20c8 <gdi_rect+0x7c>
			gdi_bit_op(x,i,op);
    209e:	f897 3020 	ldrb.w	r3, [r7, #32]
    20a2:	68f8      	ldr	r0, [r7, #12]
    20a4:	6979      	ldr	r1, [r7, #20]
    20a6:	461a      	mov	r2, r3
    20a8:	f7ff fe5c 	bl	1d64 <gdi_bit_op>
			gdi_bit_op(x+w-1,i,op);
    20ac:	68fa      	ldr	r2, [r7, #12]
    20ae:	687b      	ldr	r3, [r7, #4]
    20b0:	4413      	add	r3, r2
    20b2:	1e5a      	subs	r2, r3, #1
    20b4:	f897 3020 	ldrb.w	r3, [r7, #32]
    20b8:	4610      	mov	r0, r2
    20ba:	6979      	ldr	r1, [r7, #20]
    20bc:	461a      	mov	r2, r3
    20be:	f7ff fe51 	bl	1d64 <gdi_bit_op>
	for (i=x;i<(x+w);i++){
			gdi_bit_op(i,y,op);
			gdi_bit_op(i,y+h-1,op);
	}
    // lignes verticales
	for (i=y+1;i<(y+h-1);i++){
    20c2:	697b      	ldr	r3, [r7, #20]
    20c4:	3301      	adds	r3, #1
    20c6:	617b      	str	r3, [r7, #20]
    20c8:	68ba      	ldr	r2, [r7, #8]
    20ca:	683b      	ldr	r3, [r7, #0]
    20cc:	4413      	add	r3, r2
    20ce:	1e5a      	subs	r2, r3, #1
    20d0:	697b      	ldr	r3, [r7, #20]
    20d2:	429a      	cmp	r2, r3
    20d4:	dce3      	bgt.n	209e <gdi_rect+0x52>
			gdi_bit_op(x,i,op);
			gdi_bit_op(x+w-1,i,op);
	}
}
    20d6:	3718      	adds	r7, #24
    20d8:	46bd      	mov	sp, r7
    20da:	bd80      	pop	{r7, pc}

000020dc <strcmp>:
 * 
 */

#include "../include/ascii.h"

int strcmp(const char *s1, const char *s2){
    20dc:	b480      	push	{r7}
    20de:	b085      	sub	sp, #20
    20e0:	af00      	add	r7, sp, #0
    20e2:	6078      	str	r0, [r7, #4]
    20e4:	6039      	str	r1, [r7, #0]
	int result=0;
    20e6:	2300      	movs	r3, #0
    20e8:	60fb      	str	r3, [r7, #12]
	while (*s1 && *s2){
    20ea:	e018      	b.n	211e <strcmp+0x42>
		if (*s1<*s2){
    20ec:	687b      	ldr	r3, [r7, #4]
    20ee:	781a      	ldrb	r2, [r3, #0]
    20f0:	683b      	ldr	r3, [r7, #0]
    20f2:	781b      	ldrb	r3, [r3, #0]
    20f4:	429a      	cmp	r2, r3
    20f6:	d203      	bcs.n	2100 <strcmp+0x24>
			result=-1;
    20f8:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    20fc:	60fb      	str	r3, [r7, #12]
			break;
    20fe:	e016      	b.n	212e <strcmp+0x52>
		}else if (*s1>*s2){
    2100:	687b      	ldr	r3, [r7, #4]
    2102:	781a      	ldrb	r2, [r3, #0]
    2104:	683b      	ldr	r3, [r7, #0]
    2106:	781b      	ldrb	r3, [r3, #0]
    2108:	429a      	cmp	r2, r3
    210a:	d902      	bls.n	2112 <strcmp+0x36>
			result=1;
    210c:	2301      	movs	r3, #1
    210e:	60fb      	str	r3, [r7, #12]
			break;
    2110:	e00d      	b.n	212e <strcmp+0x52>
		}
		s1++;
    2112:	687b      	ldr	r3, [r7, #4]
    2114:	3301      	adds	r3, #1
    2116:	607b      	str	r3, [r7, #4]
		s2++;
    2118:	683b      	ldr	r3, [r7, #0]
    211a:	3301      	adds	r3, #1
    211c:	603b      	str	r3, [r7, #0]

#include "../include/ascii.h"

int strcmp(const char *s1, const char *s2){
	int result=0;
	while (*s1 && *s2){
    211e:	687b      	ldr	r3, [r7, #4]
    2120:	781b      	ldrb	r3, [r3, #0]
    2122:	2b00      	cmp	r3, #0
    2124:	d003      	beq.n	212e <strcmp+0x52>
    2126:	683b      	ldr	r3, [r7, #0]
    2128:	781b      	ldrb	r3, [r3, #0]
    212a:	2b00      	cmp	r3, #0
    212c:	d1de      	bne.n	20ec <strcmp+0x10>
			break;
		}
		s1++;
		s2++;
	}
	if (!result){
    212e:	68fb      	ldr	r3, [r7, #12]
    2130:	2b00      	cmp	r3, #0
    2132:	d115      	bne.n	2160 <strcmp+0x84>
		if (!*s1 && *s2){
    2134:	687b      	ldr	r3, [r7, #4]
    2136:	781b      	ldrb	r3, [r3, #0]
    2138:	2b00      	cmp	r3, #0
    213a:	d107      	bne.n	214c <strcmp+0x70>
    213c:	683b      	ldr	r3, [r7, #0]
    213e:	781b      	ldrb	r3, [r3, #0]
    2140:	2b00      	cmp	r3, #0
    2142:	d003      	beq.n	214c <strcmp+0x70>
			result=-1;
    2144:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    2148:	60fb      	str	r3, [r7, #12]
    214a:	e009      	b.n	2160 <strcmp+0x84>
		}else if (*s1 && !*s2) {
    214c:	687b      	ldr	r3, [r7, #4]
    214e:	781b      	ldrb	r3, [r3, #0]
    2150:	2b00      	cmp	r3, #0
    2152:	d005      	beq.n	2160 <strcmp+0x84>
    2154:	683b      	ldr	r3, [r7, #0]
    2156:	781b      	ldrb	r3, [r3, #0]
    2158:	2b00      	cmp	r3, #0
    215a:	d101      	bne.n	2160 <strcmp+0x84>
			result=1;
    215c:	2301      	movs	r3, #1
    215e:	60fb      	str	r3, [r7, #12]
		}
	}
	return result;
    2160:	68fb      	ldr	r3, [r7, #12]
}
    2162:	4618      	mov	r0, r3
    2164:	3714      	adds	r7, #20
    2166:	46bd      	mov	sp, r7
    2168:	f85d 7b04 	ldr.w	r7, [sp], #4
    216c:	4770      	bx	lr
    216e:	bf00      	nop

00002170 <digit>:


int digit(char c){
    2170:	b480      	push	{r7}
    2172:	b083      	sub	sp, #12
    2174:	af00      	add	r7, sp, #0
    2176:	4603      	mov	r3, r0
    2178:	71fb      	strb	r3, [r7, #7]
   return ((c>='0') && (c<='9'));
    217a:	79fb      	ldrb	r3, [r7, #7]
    217c:	2b2f      	cmp	r3, #47	; 0x2f
    217e:	d904      	bls.n	218a <digit+0x1a>
    2180:	79fb      	ldrb	r3, [r7, #7]
    2182:	2b39      	cmp	r3, #57	; 0x39
    2184:	d801      	bhi.n	218a <digit+0x1a>
    2186:	2301      	movs	r3, #1
    2188:	e000      	b.n	218c <digit+0x1c>
    218a:	2300      	movs	r3, #0
}
    218c:	4618      	mov	r0, r3
    218e:	370c      	adds	r7, #12
    2190:	46bd      	mov	sp, r7
    2192:	f85d 7b04 	ldr.w	r7, [sp], #4
    2196:	4770      	bx	lr

00002198 <hexdigit>:

int hexdigit(char c){
    2198:	b580      	push	{r7, lr}
    219a:	b082      	sub	sp, #8
    219c:	af00      	add	r7, sp, #0
    219e:	4603      	mov	r3, r0
    21a0:	71fb      	strb	r3, [r7, #7]
	if (c>='a') c-=32;
    21a2:	79fb      	ldrb	r3, [r7, #7]
    21a4:	2b60      	cmp	r3, #96	; 0x60
    21a6:	d902      	bls.n	21ae <hexdigit+0x16>
    21a8:	79fb      	ldrb	r3, [r7, #7]
    21aa:	3b20      	subs	r3, #32
    21ac:	71fb      	strb	r3, [r7, #7]
	return (digit(c) || (c>='A' && c<='F'));
    21ae:	79fb      	ldrb	r3, [r7, #7]
    21b0:	4618      	mov	r0, r3
    21b2:	f7ff ffdd 	bl	2170 <digit>
    21b6:	4603      	mov	r3, r0
    21b8:	2b00      	cmp	r3, #0
    21ba:	d105      	bne.n	21c8 <hexdigit+0x30>
    21bc:	79fb      	ldrb	r3, [r7, #7]
    21be:	2b40      	cmp	r3, #64	; 0x40
    21c0:	d904      	bls.n	21cc <hexdigit+0x34>
    21c2:	79fb      	ldrb	r3, [r7, #7]
    21c4:	2b46      	cmp	r3, #70	; 0x46
    21c6:	d801      	bhi.n	21cc <hexdigit+0x34>
    21c8:	2301      	movs	r3, #1
    21ca:	e000      	b.n	21ce <hexdigit+0x36>
    21cc:	2300      	movs	r3, #0
}
    21ce:	4618      	mov	r0, r3
    21d0:	3708      	adds	r7, #8
    21d2:	46bd      	mov	sp, r7
    21d4:	bd80      	pop	{r7, pc}
    21d6:	bf00      	nop

000021d8 <atoi>:

int atoi(const char *str){
    21d8:	b580      	push	{r7, lr}
    21da:	b086      	sub	sp, #24
    21dc:	af00      	add	r7, sp, #0
    21de:	6078      	str	r0, [r7, #4]
	int n=0,sign=1,base=10;
    21e0:	2300      	movs	r3, #0
    21e2:	617b      	str	r3, [r7, #20]
    21e4:	2301      	movs	r3, #1
    21e6:	613b      	str	r3, [r7, #16]
    21e8:	230a      	movs	r3, #10
    21ea:	60fb      	str	r3, [r7, #12]
    char c;
    
	while (*str && (*str==SPACE)) str++;
    21ec:	e002      	b.n	21f4 <atoi+0x1c>
    21ee:	687b      	ldr	r3, [r7, #4]
    21f0:	3301      	adds	r3, #1
    21f2:	607b      	str	r3, [r7, #4]
    21f4:	687b      	ldr	r3, [r7, #4]
    21f6:	781b      	ldrb	r3, [r3, #0]
    21f8:	2b00      	cmp	r3, #0
    21fa:	d003      	beq.n	2204 <atoi+0x2c>
    21fc:	687b      	ldr	r3, [r7, #4]
    21fe:	781b      	ldrb	r3, [r3, #0]
    2200:	2b20      	cmp	r3, #32
    2202:	d0f4      	beq.n	21ee <atoi+0x16>
	if (*str=='-'){
    2204:	687b      	ldr	r3, [r7, #4]
    2206:	781b      	ldrb	r3, [r3, #0]
    2208:	2b2d      	cmp	r3, #45	; 0x2d
    220a:	d105      	bne.n	2218 <atoi+0x40>
		sign=-1;
    220c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    2210:	613b      	str	r3, [r7, #16]
		str++;
    2212:	687b      	ldr	r3, [r7, #4]
    2214:	3301      	adds	r3, #1
    2216:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
    2218:	687b      	ldr	r3, [r7, #4]
    221a:	781b      	ldrb	r3, [r3, #0]
    221c:	2b30      	cmp	r3, #48	; 0x30
    221e:	d10e      	bne.n	223e <atoi+0x66>
    2220:	687b      	ldr	r3, [r7, #4]
    2222:	3301      	adds	r3, #1
    2224:	781b      	ldrb	r3, [r3, #0]
    2226:	2b78      	cmp	r3, #120	; 0x78
    2228:	d004      	beq.n	2234 <atoi+0x5c>
    222a:	687b      	ldr	r3, [r7, #4]
    222c:	3301      	adds	r3, #1
    222e:	781b      	ldrb	r3, [r3, #0]
    2230:	2b58      	cmp	r3, #88	; 0x58
    2232:	d104      	bne.n	223e <atoi+0x66>
		base=16;
    2234:	2310      	movs	r3, #16
    2236:	60fb      	str	r3, [r7, #12]
		str+=2;
    2238:	687b      	ldr	r3, [r7, #4]
    223a:	3302      	adds	r3, #2
    223c:	607b      	str	r3, [r7, #4]
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
    223e:	e018      	b.n	2272 <atoi+0x9a>
		if (c>='a'){c-=32;}
    2240:	7afb      	ldrb	r3, [r7, #11]
    2242:	2b60      	cmp	r3, #96	; 0x60
    2244:	d902      	bls.n	224c <atoi+0x74>
    2246:	7afb      	ldrb	r3, [r7, #11]
    2248:	3b20      	subs	r3, #32
    224a:	72fb      	strb	r3, [r7, #11]
		c-='0';
    224c:	7afb      	ldrb	r3, [r7, #11]
    224e:	3b30      	subs	r3, #48	; 0x30
    2250:	72fb      	strb	r3, [r7, #11]
		if (c>9){c-=7;}
    2252:	7afb      	ldrb	r3, [r7, #11]
    2254:	2b09      	cmp	r3, #9
    2256:	d902      	bls.n	225e <atoi+0x86>
    2258:	7afb      	ldrb	r3, [r7, #11]
    225a:	3b07      	subs	r3, #7
    225c:	72fb      	strb	r3, [r7, #11]
		n=n*base+c;
    225e:	697b      	ldr	r3, [r7, #20]
    2260:	68fa      	ldr	r2, [r7, #12]
    2262:	fb02 f203 	mul.w	r2, r2, r3
    2266:	7afb      	ldrb	r3, [r7, #11]
    2268:	4413      	add	r3, r2
    226a:	617b      	str	r3, [r7, #20]
		str++;
    226c:	687b      	ldr	r3, [r7, #4]
    226e:	3301      	adds	r3, #1
    2270:	607b      	str	r3, [r7, #4]
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
		base=16;
		str+=2;
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
    2272:	687b      	ldr	r3, [r7, #4]
    2274:	781b      	ldrb	r3, [r3, #0]
    2276:	72fb      	strb	r3, [r7, #11]
    2278:	7afb      	ldrb	r3, [r7, #11]
    227a:	2b00      	cmp	r3, #0
    227c:	d00d      	beq.n	229a <atoi+0xc2>
    227e:	68fb      	ldr	r3, [r7, #12]
    2280:	2b0a      	cmp	r3, #10
    2282:	d10a      	bne.n	229a <atoi+0xc2>
    2284:	7afb      	ldrb	r3, [r7, #11]
    2286:	4618      	mov	r0, r3
    2288:	f7ff ff72 	bl	2170 <digit>
    228c:	4603      	mov	r3, r0
    228e:	2b00      	cmp	r3, #0
    2290:	bf14      	ite	ne
    2292:	2301      	movne	r3, #1
    2294:	2300      	moveq	r3, #0
    2296:	b2db      	uxtb	r3, r3
    2298:	e009      	b.n	22ae <atoi+0xd6>
    229a:	7afb      	ldrb	r3, [r7, #11]
    229c:	4618      	mov	r0, r3
    229e:	f7ff ff7b 	bl	2198 <hexdigit>
    22a2:	4603      	mov	r3, r0
    22a4:	2b00      	cmp	r3, #0
    22a6:	bf14      	ite	ne
    22a8:	2301      	movne	r3, #1
    22aa:	2300      	moveq	r3, #0
    22ac:	b2db      	uxtb	r3, r3
    22ae:	2b00      	cmp	r3, #0
    22b0:	d1c6      	bne.n	2240 <atoi+0x68>
		c-='0';
		if (c>9){c-=7;}
		n=n*base+c;
		str++;
	}
	return sign*n;
    22b2:	693b      	ldr	r3, [r7, #16]
    22b4:	697a      	ldr	r2, [r7, #20]
    22b6:	fb02 f303 	mul.w	r3, r2, r3
}
    22ba:	4618      	mov	r0, r3
    22bc:	3718      	adds	r7, #24
    22be:	46bd      	mov	sp, r7
    22c0:	bd80      	pop	{r7, pc}
    22c2:	bf00      	nop

000022c4 <move>:

// copie 'len' caractères de src vers dest
void move(char *src , char *dest, int len){
    22c4:	b480      	push	{r7}
    22c6:	b085      	sub	sp, #20
    22c8:	af00      	add	r7, sp, #0
    22ca:	60f8      	str	r0, [r7, #12]
    22cc:	60b9      	str	r1, [r7, #8]
    22ce:	607a      	str	r2, [r7, #4]
	while (len){
    22d0:	e00a      	b.n	22e8 <move+0x24>
		*dest++=*src++;
    22d2:	68bb      	ldr	r3, [r7, #8]
    22d4:	1c5a      	adds	r2, r3, #1
    22d6:	60ba      	str	r2, [r7, #8]
    22d8:	68fa      	ldr	r2, [r7, #12]
    22da:	1c51      	adds	r1, r2, #1
    22dc:	60f9      	str	r1, [r7, #12]
    22de:	7812      	ldrb	r2, [r2, #0]
    22e0:	701a      	strb	r2, [r3, #0]
		len--;
    22e2:	687b      	ldr	r3, [r7, #4]
    22e4:	3b01      	subs	r3, #1
    22e6:	607b      	str	r3, [r7, #4]
	return sign*n;
}

// copie 'len' caractères de src vers dest
void move(char *src , char *dest, int len){
	while (len){
    22e8:	687b      	ldr	r3, [r7, #4]
    22ea:	2b00      	cmp	r3, #0
    22ec:	d1f1      	bne.n	22d2 <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
    22ee:	68bb      	ldr	r3, [r7, #8]
    22f0:	2200      	movs	r2, #0
    22f2:	701a      	strb	r2, [r3, #0]
}
    22f4:	3714      	adds	r7, #20
    22f6:	46bd      	mov	sp, r7
    22f8:	f85d 7b04 	ldr.w	r7, [sp], #4
    22fc:	4770      	bx	lr
    22fe:	bf00      	nop

00002300 <strlen>:

int strlen(const char* str){
    2300:	b480      	push	{r7}
    2302:	b085      	sub	sp, #20
    2304:	af00      	add	r7, sp, #0
    2306:	6078      	str	r0, [r7, #4]
	int ll=0;
    2308:	2300      	movs	r3, #0
    230a:	60fb      	str	r3, [r7, #12]
	while (*str++){ll++;}
    230c:	e002      	b.n	2314 <strlen+0x14>
    230e:	68fb      	ldr	r3, [r7, #12]
    2310:	3301      	adds	r3, #1
    2312:	60fb      	str	r3, [r7, #12]
    2314:	687b      	ldr	r3, [r7, #4]
    2316:	1c5a      	adds	r2, r3, #1
    2318:	607a      	str	r2, [r7, #4]
    231a:	781b      	ldrb	r3, [r3, #0]
    231c:	2b00      	cmp	r3, #0
    231e:	d1f6      	bne.n	230e <strlen+0xe>
	return ll;
    2320:	68fb      	ldr	r3, [r7, #12]
}
    2322:	4618      	mov	r0, r3
    2324:	3714      	adds	r7, #20
    2326:	46bd      	mov	sp, r7
    2328:	f85d 7b04 	ldr.w	r7, [sp], #4
    232c:	4770      	bx	lr
    232e:	bf00      	nop

00002330 <config_pin>:
// configuration d'une broche gpio
// arguments:
// 	port -> {GPIOA,GPIOB,GPIOC}
//	pin -> {0..15}
//  config -> {OUTPUT..., INPUT...}
void config_pin(gpio_t* port, unsigned pin, unsigned config){
    2330:	b480      	push	{r7}
    2332:	b087      	sub	sp, #28
    2334:	af00      	add	r7, sp, #0
    2336:	60f8      	str	r0, [r7, #12]
    2338:	60b9      	str	r1, [r7, #8]
    233a:	607a      	str	r2, [r7, #4]
	uint8_t shift;
	shift=(pin&7)<<2;
    233c:	68bb      	ldr	r3, [r7, #8]
    233e:	b2db      	uxtb	r3, r3
    2340:	f003 0307 	and.w	r3, r3, #7
    2344:	b2db      	uxtb	r3, r3
    2346:	009b      	lsls	r3, r3, #2
    2348:	75fb      	strb	r3, [r7, #23]
	port->CR[pin>>3]&=~(15<<shift);
    234a:	68bb      	ldr	r3, [r7, #8]
    234c:	08da      	lsrs	r2, r3, #3
    234e:	68bb      	ldr	r3, [r7, #8]
    2350:	08d9      	lsrs	r1, r3, #3
    2352:	68fb      	ldr	r3, [r7, #12]
    2354:	f853 3021 	ldr.w	r3, [r3, r1, lsl #2]
    2358:	7df9      	ldrb	r1, [r7, #23]
    235a:	200f      	movs	r0, #15
    235c:	fa00 f101 	lsl.w	r1, r0, r1
    2360:	43c9      	mvns	r1, r1
    2362:	4019      	ands	r1, r3
    2364:	68fb      	ldr	r3, [r7, #12]
    2366:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
	port->CR[pin>>3]|=config<<shift;
    236a:	68bb      	ldr	r3, [r7, #8]
    236c:	08da      	lsrs	r2, r3, #3
    236e:	68bb      	ldr	r3, [r7, #8]
    2370:	08d9      	lsrs	r1, r3, #3
    2372:	68fb      	ldr	r3, [r7, #12]
    2374:	f853 1021 	ldr.w	r1, [r3, r1, lsl #2]
    2378:	7dfb      	ldrb	r3, [r7, #23]
    237a:	6878      	ldr	r0, [r7, #4]
    237c:	fa00 f303 	lsl.w	r3, r0, r3
    2380:	4319      	orrs	r1, r3
    2382:	68fb      	ldr	r3, [r7, #12]
    2384:	f843 1022 	str.w	r1, [r3, r2, lsl #2]
}
    2388:	371c      	adds	r7, #28
    238a:	46bd      	mov	sp, r7
    238c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2390:	4770      	bx	lr
    2392:	bf00      	nop

00002394 <read_pin>:

int read_pin(gpio_t* port, unsigned pin){
    2394:	b480      	push	{r7}
    2396:	b083      	sub	sp, #12
    2398:	af00      	add	r7, sp, #0
    239a:	6078      	str	r0, [r7, #4]
    239c:	6039      	str	r1, [r7, #0]
	return port->IDR&(1<<pin);
    239e:	687b      	ldr	r3, [r7, #4]
    23a0:	689b      	ldr	r3, [r3, #8]
    23a2:	683a      	ldr	r2, [r7, #0]
    23a4:	2101      	movs	r1, #1
    23a6:	fa01 f202 	lsl.w	r2, r1, r2
    23aa:	4013      	ands	r3, r2
}
    23ac:	4618      	mov	r0, r3
    23ae:	370c      	adds	r7, #12
    23b0:	46bd      	mov	sp, r7
    23b2:	f85d 7b04 	ldr.w	r7, [sp], #4
    23b6:	4770      	bx	lr

000023b8 <write_pin>:

void write_pin(gpio_t* port, unsigned pin, int value){
    23b8:	b480      	push	{r7}
    23ba:	b085      	sub	sp, #20
    23bc:	af00      	add	r7, sp, #0
    23be:	60f8      	str	r0, [r7, #12]
    23c0:	60b9      	str	r1, [r7, #8]
    23c2:	607a      	str	r2, [r7, #4]
	value?(port->ODR|=(1<<pin)):(port->ODR&=~(1<<pin));
    23c4:	687b      	ldr	r3, [r7, #4]
    23c6:	2b00      	cmp	r3, #0
    23c8:	d009      	beq.n	23de <write_pin+0x26>
    23ca:	68fb      	ldr	r3, [r7, #12]
    23cc:	68db      	ldr	r3, [r3, #12]
    23ce:	68ba      	ldr	r2, [r7, #8]
    23d0:	2101      	movs	r1, #1
    23d2:	fa01 f202 	lsl.w	r2, r1, r2
    23d6:	431a      	orrs	r2, r3
    23d8:	68fb      	ldr	r3, [r7, #12]
    23da:	60da      	str	r2, [r3, #12]
    23dc:	e009      	b.n	23f2 <write_pin+0x3a>
    23de:	68fb      	ldr	r3, [r7, #12]
    23e0:	68db      	ldr	r3, [r3, #12]
    23e2:	68ba      	ldr	r2, [r7, #8]
    23e4:	2101      	movs	r1, #1
    23e6:	fa01 f202 	lsl.w	r2, r1, r2
    23ea:	43d2      	mvns	r2, r2
    23ec:	401a      	ands	r2, r3
    23ee:	68fb      	ldr	r3, [r7, #12]
    23f0:	60da      	str	r2, [r3, #12]
}
    23f2:	3714      	adds	r7, #20
    23f4:	46bd      	mov	sp, r7
    23f6:	f85d 7b04 	ldr.w	r7, [sp], #4
    23fa:	4770      	bx	lr

000023fc <toggle_pin>:

void toggle_pin(gpio_t* port, unsigned pin){
    23fc:	b480      	push	{r7}
    23fe:	b083      	sub	sp, #12
    2400:	af00      	add	r7, sp, #0
    2402:	6078      	str	r0, [r7, #4]
    2404:	6039      	str	r1, [r7, #0]
	port->ODR^=(1<<pin);
    2406:	687b      	ldr	r3, [r7, #4]
    2408:	68db      	ldr	r3, [r3, #12]
    240a:	683a      	ldr	r2, [r7, #0]
    240c:	2101      	movs	r1, #1
    240e:	fa01 f202 	lsl.w	r2, r1, r2
    2412:	405a      	eors	r2, r3
    2414:	687b      	ldr	r3, [r7, #4]
    2416:	60da      	str	r2, [r3, #12]
}
    2418:	370c      	adds	r7, #12
    241a:	46bd      	mov	sp, r7
    241c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2420:	4770      	bx	lr
    2422:	bf00      	nop

00002424 <kbd_enable>:
#define PS2_QUEUE_SIZE (16)
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];


void kbd_enable(int enable){
    2424:	b580      	push	{r7, lr}
    2426:	b082      	sub	sp, #8
    2428:	af00      	add	r7, sp, #0
    242a:	6078      	str	r0, [r7, #4]
	if (enable){
    242c:	687b      	ldr	r3, [r7, #4]
    242e:	2b00      	cmp	r3, #0
    2430:	d01b      	beq.n	246a <kbd_enable+0x46>
		ps2_head=ps2_tail=0;
    2432:	2100      	movs	r1, #0
    2434:	4b11      	ldr	r3, [pc, #68]	; (247c <kbd_enable+0x58>)
    2436:	460a      	mov	r2, r1
    2438:	701a      	strb	r2, [r3, #0]
    243a:	4b11      	ldr	r3, [pc, #68]	; (2480 <kbd_enable+0x5c>)
    243c:	460a      	mov	r2, r1
    243e:	701a      	strb	r2, [r3, #0]
		EXTI->IMR|=KBD_CLK_PIN;
    2440:	4a10      	ldr	r2, [pc, #64]	; (2484 <kbd_enable+0x60>)
    2442:	4b10      	ldr	r3, [pc, #64]	; (2484 <kbd_enable+0x60>)
    2444:	681b      	ldr	r3, [r3, #0]
    2446:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    244a:	6013      	str	r3, [r2, #0]
		enable_interrupt(IRQ_KBD_CLK);
    244c:	2017      	movs	r0, #23
    244e:	f000 fac7 	bl	29e0 <enable_interrupt>
		KBD_TMR->SR&=~BIT0;
    2452:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    2456:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    245a:	691b      	ldr	r3, [r3, #16]
    245c:	f023 0301 	bic.w	r3, r3, #1
    2460:	6113      	str	r3, [r2, #16]
		enable_interrupt(IRQ_KBD_TMR);
    2462:	201c      	movs	r0, #28
    2464:	f000 fabc 	bl	29e0 <enable_interrupt>
    2468:	e005      	b.n	2476 <kbd_enable+0x52>
	}else{
		disable_interrupt(IRQ_KBD_CLK);
    246a:	2017      	movs	r0, #23
    246c:	f000 fadc 	bl	2a28 <disable_interrupt>
		disable_interrupt(IRQ_KBD_TMR);
    2470:	201c      	movs	r0, #28
    2472:	f000 fad9 	bl	2a28 <disable_interrupt>
	}
}
    2476:	3708      	adds	r7, #8
    2478:	46bd      	mov	sp, r7
    247a:	bd80      	pop	{r7, pc}
    247c:	20000152 	.word	0x20000152
    2480:	20000151 	.word	0x20000151
    2484:	40010400 	.word	0x40010400

00002488 <keyboard_init>:
 
void keyboard_init(){
    2488:	b580      	push	{r7, lr}
    248a:	af00      	add	r7, sp, #0
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
    248c:	4a15      	ldr	r2, [pc, #84]	; (24e4 <keyboard_init+0x5c>)
    248e:	4b15      	ldr	r3, [pc, #84]	; (24e4 <keyboard_init+0x5c>)
    2490:	699b      	ldr	r3, [r3, #24]
    2492:	f043 0305 	orr.w	r3, r3, #5
    2496:	6193      	str	r3, [r2, #24]
	// activation clock KBD_TMR
	RCC->KBD_TMR_ENR|=KBD_TMR_EN; 
    2498:	4a12      	ldr	r2, [pc, #72]	; (24e4 <keyboard_init+0x5c>)
    249a:	4b12      	ldr	r3, [pc, #72]	; (24e4 <keyboard_init+0x5c>)
    249c:	69db      	ldr	r3, [r3, #28]
    249e:	f043 0301 	orr.w	r3, r3, #1
    24a2:	61d3      	str	r3, [r2, #28]
	KBD_TMR->ARR=FTMR2_4/20*.01;
    24a4:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    24a8:	f44f 42fa 	mov.w	r2, #32000	; 0x7d00
    24ac:	62da      	str	r2, [r3, #44]	; 0x2c
	KBD_TMR->PSC=20;
    24ae:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    24b2:	2214      	movs	r2, #20
    24b4:	629a      	str	r2, [r3, #40]	; 0x28
	KBD_TMR->CR1=BIT0|BIT7; // ARPE
    24b6:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    24ba:	2281      	movs	r2, #129	; 0x81
    24bc:	601a      	str	r2, [r3, #0]
	KBD_TMR->DIER=BIT0; // UIE
    24be:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    24c2:	2201      	movs	r2, #1
    24c4:	60da      	str	r2, [r3, #12]
	set_int_priority(IRQ_KBD_CLK,0);
    24c6:	2017      	movs	r0, #23
    24c8:	2100      	movs	r1, #0
    24ca:	f000 fb45 	bl	2b58 <set_int_priority>
	set_int_priority(IRQ_KBD_TMR,14);
    24ce:	201c      	movs	r0, #28
    24d0:	210e      	movs	r1, #14
    24d2:	f000 fb41 	bl	2b58 <set_int_priority>
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
    24d6:	4a04      	ldr	r2, [pc, #16]	; (24e8 <keyboard_init+0x60>)
    24d8:	4b03      	ldr	r3, [pc, #12]	; (24e8 <keyboard_init+0x60>)
    24da:	68db      	ldr	r3, [r3, #12]
    24dc:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    24e0:	60d3      	str	r3, [r2, #12]
//	enable_interrupt(IRQ_KBD_CLK);
//	KBD_TMR->SR&=~BIT0;
//	enable_interrupt(IRQ_KBD_TMR);
	//pause(700);
	//if (!KbdReset()) print("keyboard reset failed\n");
}
    24e2:	bd80      	pop	{r7, pc}
    24e4:	40021000 	.word	0x40021000
    24e8:	40010400 	.word	0x40010400

000024ec <search_table>:
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
    24ec:	b480      	push	{r7}
    24ee:	b083      	sub	sp, #12
    24f0:	af00      	add	r7, sp, #0
    24f2:	6078      	str	r0, [r7, #4]
    24f4:	460b      	mov	r3, r1
    24f6:	70fb      	strb	r3, [r7, #3]
	while (table->code){
    24f8:	e008      	b.n	250c <search_table+0x20>
		if (table->code==code) break;
    24fa:	687b      	ldr	r3, [r7, #4]
    24fc:	781b      	ldrb	r3, [r3, #0]
    24fe:	78fa      	ldrb	r2, [r7, #3]
    2500:	429a      	cmp	r2, r3
    2502:	d100      	bne.n	2506 <search_table+0x1a>
    2504:	e006      	b.n	2514 <search_table+0x28>
		table++;
    2506:	687b      	ldr	r3, [r7, #4]
    2508:	3302      	adds	r3, #2
    250a:	607b      	str	r3, [r7, #4]

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
    250c:	687b      	ldr	r3, [r7, #4]
    250e:	781b      	ldrb	r3, [r3, #0]
    2510:	2b00      	cmp	r3, #0
    2512:	d1f2      	bne.n	24fa <search_table+0xe>
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
    2514:	687b      	ldr	r3, [r7, #4]
    2516:	785b      	ldrb	r3, [r3, #1]
}
    2518:	4618      	mov	r0, r3
    251a:	370c      	adds	r7, #12
    251c:	46bd      	mov	sp, r7
    251e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2522:	4770      	bx	lr

00002524 <convert_code>:

static void convert_code(unsigned char code){
    2524:	b580      	push	{r7, lr}
    2526:	b086      	sub	sp, #24
    2528:	af00      	add	r7, sp, #0
    252a:	4603      	mov	r3, r0
    252c:	71fb      	strb	r3, [r7, #7]
		unsigned char c,s;
		int shift;
		if (!(con.dev==LOCAL)) return;
    252e:	4b91      	ldr	r3, [pc, #580]	; (2774 <convert_code+0x250>)
    2530:	781b      	ldrb	r3, [r3, #0]
    2532:	2b00      	cmp	r3, #0
    2534:	d000      	beq.n	2538 <convert_code+0x14>
    2536:	e165      	b.n	2804 <convert_code+0x2e0>
		switch (code){
    2538:	79fb      	ldrb	r3, [r7, #7]
    253a:	2b59      	cmp	r3, #89	; 0x59
    253c:	f000 8085 	beq.w	264a <convert_code+0x126>
    2540:	2b59      	cmp	r3, #89	; 0x59
    2542:	dc0e      	bgt.n	2562 <convert_code+0x3e>
    2544:	2b12      	cmp	r3, #18
    2546:	d038      	beq.n	25ba <convert_code+0x96>
    2548:	2b12      	cmp	r3, #18
    254a:	dc03      	bgt.n	2554 <convert_code+0x30>
    254c:	2b11      	cmp	r3, #17
    254e:	f000 80b8 	beq.w	26c2 <convert_code+0x19e>
    2552:	e0de      	b.n	2712 <convert_code+0x1ee>
    2554:	2b14      	cmp	r3, #20
    2556:	f000 808c 	beq.w	2672 <convert_code+0x14e>
    255a:	2b58      	cmp	r3, #88	; 0x58
    255c:	f000 80c5 	beq.w	26ea <convert_code+0x1c6>
    2560:	e0d7      	b.n	2712 <convert_code+0x1ee>
    2562:	2be0      	cmp	r3, #224	; 0xe0
    2564:	d010      	beq.n	2588 <convert_code+0x64>
    2566:	2be0      	cmp	r3, #224	; 0xe0
    2568:	dc02      	bgt.n	2570 <convert_code+0x4c>
    256a:	2b7c      	cmp	r3, #124	; 0x7c
    256c:	d047      	beq.n	25fe <convert_code+0xda>
    256e:	e0d0      	b.n	2712 <convert_code+0x1ee>
    2570:	2be1      	cmp	r3, #225	; 0xe1
    2572:	d010      	beq.n	2596 <convert_code+0x72>
    2574:	2bf0      	cmp	r3, #240	; 0xf0
    2576:	f040 80cc 	bne.w	2712 <convert_code+0x1ee>
		case 0xF0:
			flags |= RELEASE;
    257a:	4b7f      	ldr	r3, [pc, #508]	; (2778 <convert_code+0x254>)
    257c:	681b      	ldr	r3, [r3, #0]
    257e:	f043 0302 	orr.w	r3, r3, #2
    2582:	4a7d      	ldr	r2, [pc, #500]	; (2778 <convert_code+0x254>)
    2584:	6013      	str	r3, [r2, #0]
			break;
    2586:	e13d      	b.n	2804 <convert_code+0x2e0>
		case 0xE0: // extended code
			flags|=XTD_CODE;
    2588:	4b7b      	ldr	r3, [pc, #492]	; (2778 <convert_code+0x254>)
    258a:	681b      	ldr	r3, [r3, #0]
    258c:	f043 0301 	orr.w	r3, r3, #1
    2590:	4a79      	ldr	r2, [pc, #484]	; (2778 <convert_code+0x254>)
    2592:	6013      	str	r3, [r2, #0]
			break;
    2594:	e136      	b.n	2804 <convert_code+0x2e0>
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
    2596:	4b78      	ldr	r3, [pc, #480]	; (2778 <convert_code+0x254>)
    2598:	681b      	ldr	r3, [r3, #0]
    259a:	f483 7380 	eor.w	r3, r3, #256	; 0x100
    259e:	4a76      	ldr	r2, [pc, #472]	; (2778 <convert_code+0x254>)
    25a0:	6013      	str	r3, [r2, #0]
			if (!(flags&XTD2_CODE)){
    25a2:	4b75      	ldr	r3, [pc, #468]	; (2778 <convert_code+0x254>)
    25a4:	681b      	ldr	r3, [r3, #0]
    25a6:	f403 7380 	and.w	r3, r3, #256	; 0x100
    25aa:	2b00      	cmp	r3, #0
    25ac:	d104      	bne.n	25b8 <convert_code+0x94>
				con.insert(PAUSE);
    25ae:	4b71      	ldr	r3, [pc, #452]	; (2774 <convert_code+0x250>)
    25b0:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    25b2:	2094      	movs	r0, #148	; 0x94
    25b4:	4798      	blx	r3
			}
			break;
    25b6:	e125      	b.n	2804 <convert_code+0x2e0>
    25b8:	e124      	b.n	2804 <convert_code+0x2e0>
		case LSHIFT:
			if (flags&RELEASE){
    25ba:	4b6f      	ldr	r3, [pc, #444]	; (2778 <convert_code+0x254>)
    25bc:	681b      	ldr	r3, [r3, #0]
    25be:	f003 0302 	and.w	r3, r3, #2
    25c2:	2b00      	cmp	r3, #0
    25c4:	d006      	beq.n	25d4 <convert_code+0xb0>
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
    25c6:	4b6c      	ldr	r3, [pc, #432]	; (2778 <convert_code+0x254>)
    25c8:	681b      	ldr	r3, [r3, #0]
    25ca:	f023 0307 	bic.w	r3, r3, #7
    25ce:	4a6a      	ldr	r2, [pc, #424]	; (2778 <convert_code+0x254>)
    25d0:	6013      	str	r3, [r2, #0]
    25d2:	e013      	b.n	25fc <convert_code+0xd8>
			}else{
				if (flags&XTD_CODE){
    25d4:	4b68      	ldr	r3, [pc, #416]	; (2778 <convert_code+0x254>)
    25d6:	681b      	ldr	r3, [r3, #0]
    25d8:	f003 0301 	and.w	r3, r3, #1
    25dc:	2b00      	cmp	r3, #0
    25de:	d006      	beq.n	25ee <convert_code+0xca>
					flags|=PRNSCR;
    25e0:	4b65      	ldr	r3, [pc, #404]	; (2778 <convert_code+0x254>)
    25e2:	681b      	ldr	r3, [r3, #0]
    25e4:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    25e8:	4a63      	ldr	r2, [pc, #396]	; (2778 <convert_code+0x254>)
    25ea:	6013      	str	r3, [r2, #0]
    25ec:	e006      	b.n	25fc <convert_code+0xd8>
				}else{
					flags|=LEFT_SHIFT;
    25ee:	4b62      	ldr	r3, [pc, #392]	; (2778 <convert_code+0x254>)
    25f0:	681b      	ldr	r3, [r3, #0]
    25f2:	f043 0304 	orr.w	r3, r3, #4
    25f6:	4a60      	ldr	r2, [pc, #384]	; (2778 <convert_code+0x254>)
    25f8:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    25fa:	e103      	b.n	2804 <convert_code+0x2e0>
    25fc:	e102      	b.n	2804 <convert_code+0x2e0>
		case KPMUL:
			if (flags&RELEASE){
    25fe:	4b5e      	ldr	r3, [pc, #376]	; (2778 <convert_code+0x254>)
    2600:	681b      	ldr	r3, [r3, #0]
    2602:	f003 0302 	and.w	r3, r3, #2
    2606:	2b00      	cmp	r3, #0
    2608:	d006      	beq.n	2618 <convert_code+0xf4>
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
    260a:	4b5b      	ldr	r3, [pc, #364]	; (2778 <convert_code+0x254>)
    260c:	681b      	ldr	r3, [r3, #0]
    260e:	f023 0303 	bic.w	r3, r3, #3
    2612:	4a59      	ldr	r2, [pc, #356]	; (2778 <convert_code+0x254>)
    2614:	6013      	str	r3, [r2, #0]
    2616:	e017      	b.n	2648 <convert_code+0x124>
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
    2618:	4b57      	ldr	r3, [pc, #348]	; (2778 <convert_code+0x254>)
    261a:	681b      	ldr	r3, [r3, #0]
    261c:	f003 0301 	and.w	r3, r3, #1
    2620:	2b00      	cmp	r3, #0
    2622:	d00c      	beq.n	263e <convert_code+0x11a>
					flags&=~(XTD_CODE|PRNSCR);
    2624:	4b54      	ldr	r3, [pc, #336]	; (2778 <convert_code+0x254>)
    2626:	681b      	ldr	r3, [r3, #0]
    2628:	f423 7300 	bic.w	r3, r3, #512	; 0x200
    262c:	f023 0301 	bic.w	r3, r3, #1
    2630:	4a51      	ldr	r2, [pc, #324]	; (2778 <convert_code+0x254>)
    2632:	6013      	str	r3, [r2, #0]
					con.insert(PRN);
    2634:	4b4f      	ldr	r3, [pc, #316]	; (2774 <convert_code+0x250>)
    2636:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    2638:	2092      	movs	r0, #146	; 0x92
    263a:	4798      	blx	r3
    263c:	e004      	b.n	2648 <convert_code+0x124>
				}else{
					con.insert('*');
    263e:	4b4d      	ldr	r3, [pc, #308]	; (2774 <convert_code+0x250>)
    2640:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    2642:	202a      	movs	r0, #42	; 0x2a
    2644:	4798      	blx	r3
				}
			}
			break;
    2646:	e0dd      	b.n	2804 <convert_code+0x2e0>
    2648:	e0dc      	b.n	2804 <convert_code+0x2e0>
		case RSHIFT:
			if (flags&RELEASE){
    264a:	4b4b      	ldr	r3, [pc, #300]	; (2778 <convert_code+0x254>)
    264c:	681b      	ldr	r3, [r3, #0]
    264e:	f003 0302 	and.w	r3, r3, #2
    2652:	2b00      	cmp	r3, #0
    2654:	d006      	beq.n	2664 <convert_code+0x140>
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
    2656:	4b48      	ldr	r3, [pc, #288]	; (2778 <convert_code+0x254>)
    2658:	681b      	ldr	r3, [r3, #0]
    265a:	f023 030b 	bic.w	r3, r3, #11
    265e:	4a46      	ldr	r2, [pc, #280]	; (2778 <convert_code+0x254>)
    2660:	6013      	str	r3, [r2, #0]
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
    2662:	e0cf      	b.n	2804 <convert_code+0x2e0>
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
    2664:	4b44      	ldr	r3, [pc, #272]	; (2778 <convert_code+0x254>)
    2666:	681b      	ldr	r3, [r3, #0]
    2668:	f043 0308 	orr.w	r3, r3, #8
    266c:	4a42      	ldr	r2, [pc, #264]	; (2778 <convert_code+0x254>)
    266e:	6013      	str	r3, [r2, #0]
			}
			break;
    2670:	e0c8      	b.n	2804 <convert_code+0x2e0>
		case LCTRL:
			if (flags&RELEASE){
    2672:	4b41      	ldr	r3, [pc, #260]	; (2778 <convert_code+0x254>)
    2674:	681b      	ldr	r3, [r3, #0]
    2676:	f003 0302 	and.w	r3, r3, #2
    267a:	2b00      	cmp	r3, #0
    267c:	d006      	beq.n	268c <convert_code+0x168>
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
    267e:	4b3e      	ldr	r3, [pc, #248]	; (2778 <convert_code+0x254>)
    2680:	681b      	ldr	r3, [r3, #0]
    2682:	f023 0313 	bic.w	r3, r3, #19
    2686:	4a3c      	ldr	r2, [pc, #240]	; (2778 <convert_code+0x254>)
    2688:	6013      	str	r3, [r2, #0]
    268a:	e019      	b.n	26c0 <convert_code+0x19c>
			}else{
				if (flags&XTD_CODE){
    268c:	4b3a      	ldr	r3, [pc, #232]	; (2778 <convert_code+0x254>)
    268e:	681b      	ldr	r3, [r3, #0]
    2690:	f003 0301 	and.w	r3, r3, #1
    2694:	2b00      	cmp	r3, #0
    2696:	d00c      	beq.n	26b2 <convert_code+0x18e>
					flags|=RIGHT_CTRL;
    2698:	4b37      	ldr	r3, [pc, #220]	; (2778 <convert_code+0x254>)
    269a:	681b      	ldr	r3, [r3, #0]
    269c:	f043 0320 	orr.w	r3, r3, #32
    26a0:	4a35      	ldr	r2, [pc, #212]	; (2778 <convert_code+0x254>)
    26a2:	6013      	str	r3, [r2, #0]
					flags&=~XTD_CODE;
    26a4:	4b34      	ldr	r3, [pc, #208]	; (2778 <convert_code+0x254>)
    26a6:	681b      	ldr	r3, [r3, #0]
    26a8:	f023 0301 	bic.w	r3, r3, #1
    26ac:	4a32      	ldr	r2, [pc, #200]	; (2778 <convert_code+0x254>)
    26ae:	6013      	str	r3, [r2, #0]
    26b0:	e006      	b.n	26c0 <convert_code+0x19c>
				}else{
					flags|=LEFT_CTRL;
    26b2:	4b31      	ldr	r3, [pc, #196]	; (2778 <convert_code+0x254>)
    26b4:	681b      	ldr	r3, [r3, #0]
    26b6:	f043 0310 	orr.w	r3, r3, #16
    26ba:	4a2f      	ldr	r2, [pc, #188]	; (2778 <convert_code+0x254>)
    26bc:	6013      	str	r3, [r2, #0]
				}
			}
			break;
    26be:	e0a1      	b.n	2804 <convert_code+0x2e0>
    26c0:	e0a0      	b.n	2804 <convert_code+0x2e0>
		case LALT:
			if (flags&RELEASE){
    26c2:	4b2d      	ldr	r3, [pc, #180]	; (2778 <convert_code+0x254>)
    26c4:	681b      	ldr	r3, [r3, #0]
    26c6:	f003 0302 	and.w	r3, r3, #2
    26ca:	2b00      	cmp	r3, #0
    26cc:	d006      	beq.n	26dc <convert_code+0x1b8>
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
    26ce:	4b2a      	ldr	r3, [pc, #168]	; (2778 <convert_code+0x254>)
    26d0:	681b      	ldr	r3, [r3, #0]
    26d2:	f023 0343 	bic.w	r3, r3, #67	; 0x43
    26d6:	4a28      	ldr	r2, [pc, #160]	; (2778 <convert_code+0x254>)
    26d8:	6013      	str	r3, [r2, #0]
			}else{
				flags|=LEFT_ALT;
			}
			break;
    26da:	e093      	b.n	2804 <convert_code+0x2e0>
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
    26dc:	4b26      	ldr	r3, [pc, #152]	; (2778 <convert_code+0x254>)
    26de:	681b      	ldr	r3, [r3, #0]
    26e0:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    26e4:	4a24      	ldr	r2, [pc, #144]	; (2778 <convert_code+0x254>)
    26e6:	6013      	str	r3, [r2, #0]
			}
			break;
    26e8:	e08c      	b.n	2804 <convert_code+0x2e0>
		case CAPS_LOCK:
			if (flags&RELEASE){
    26ea:	4b23      	ldr	r3, [pc, #140]	; (2778 <convert_code+0x254>)
    26ec:	681b      	ldr	r3, [r3, #0]
    26ee:	f003 0302 	and.w	r3, r3, #2
    26f2:	2b00      	cmp	r3, #0
    26f4:	d006      	beq.n	2704 <convert_code+0x1e0>
				flags&=~(RELEASE|XTD_CODE);
    26f6:	4b20      	ldr	r3, [pc, #128]	; (2778 <convert_code+0x254>)
    26f8:	681b      	ldr	r3, [r3, #0]
    26fa:	f023 0303 	bic.w	r3, r3, #3
    26fe:	4a1e      	ldr	r2, [pc, #120]	; (2778 <convert_code+0x254>)
    2700:	6013      	str	r3, [r2, #0]
			}else{
				flags^=CAPSLOCK;
			}
			break;
    2702:	e07f      	b.n	2804 <convert_code+0x2e0>
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
    2704:	4b1c      	ldr	r3, [pc, #112]	; (2778 <convert_code+0x254>)
    2706:	681b      	ldr	r3, [r3, #0]
    2708:	f483 6380 	eor.w	r3, r3, #1024	; 0x400
    270c:	4a1a      	ldr	r2, [pc, #104]	; (2778 <convert_code+0x254>)
    270e:	6013      	str	r3, [r2, #0]
			}
			break;
    2710:	e078      	b.n	2804 <convert_code+0x2e0>
		default:
			if (!(flags&RELEASE)){
    2712:	4b19      	ldr	r3, [pc, #100]	; (2778 <convert_code+0x254>)
    2714:	681b      	ldr	r3, [r3, #0]
    2716:	f003 0302 	and.w	r3, r3, #2
    271a:	2b00      	cmp	r3, #0
    271c:	d16b      	bne.n	27f6 <convert_code+0x2d2>
					if (flags&XTD_CODE){
    271e:	4b16      	ldr	r3, [pc, #88]	; (2778 <convert_code+0x254>)
    2720:	681b      	ldr	r3, [r3, #0]
    2722:	f003 0301 	and.w	r3, r3, #1
    2726:	2b00      	cmp	r3, #0
    2728:	d00d      	beq.n	2746 <convert_code+0x222>
						c=search_table(mcsaite_xkey,code);
    272a:	79fb      	ldrb	r3, [r7, #7]
    272c:	4813      	ldr	r0, [pc, #76]	; (277c <convert_code+0x258>)
    272e:	4619      	mov	r1, r3
    2730:	f7ff fedc 	bl	24ec <search_table>
    2734:	4603      	mov	r3, r0
    2736:	75fb      	strb	r3, [r7, #23]
						flags&=~XTD_CODE;
    2738:	4b0f      	ldr	r3, [pc, #60]	; (2778 <convert_code+0x254>)
    273a:	681b      	ldr	r3, [r3, #0]
    273c:	f023 0301 	bic.w	r3, r3, #1
    2740:	4a0d      	ldr	r2, [pc, #52]	; (2778 <convert_code+0x254>)
    2742:	6013      	str	r3, [r2, #0]
    2744:	e006      	b.n	2754 <convert_code+0x230>
					}else{
						c=search_table(mcsaite_key,code);
    2746:	79fb      	ldrb	r3, [r7, #7]
    2748:	480d      	ldr	r0, [pc, #52]	; (2780 <convert_code+0x25c>)
    274a:	4619      	mov	r1, r3
    274c:	f7ff fece 	bl	24ec <search_table>
    2750:	4603      	mov	r3, r0
    2752:	75fb      	strb	r3, [r7, #23]
					}
					if (flags&(LEFT_CTRL|RIGHT_CTRL) && (c>='a') && (c<='z')){
    2754:	4b08      	ldr	r3, [pc, #32]	; (2778 <convert_code+0x254>)
    2756:	681b      	ldr	r3, [r3, #0]
    2758:	f003 0330 	and.w	r3, r3, #48	; 0x30
    275c:	2b00      	cmp	r3, #0
    275e:	d011      	beq.n	2784 <convert_code+0x260>
    2760:	7dfb      	ldrb	r3, [r7, #23]
    2762:	2b60      	cmp	r3, #96	; 0x60
    2764:	d90e      	bls.n	2784 <convert_code+0x260>
    2766:	7dfb      	ldrb	r3, [r7, #23]
    2768:	2b7a      	cmp	r3, #122	; 0x7a
    276a:	d80b      	bhi.n	2784 <convert_code+0x260>
						c=c-32-'@';
    276c:	7dfb      	ldrb	r3, [r7, #23]
    276e:	3b60      	subs	r3, #96	; 0x60
    2770:	75fb      	strb	r3, [r7, #23]
    2772:	e037      	b.n	27e4 <convert_code+0x2c0>
    2774:	2000018c 	.word	0x2000018c
    2778:	20000164 	.word	0x20000164
    277c:	000043a4 	.word	0x000043a4
    2780:	000042ec 	.word	0x000042ec
					}else{
						shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
    2784:	4b21      	ldr	r3, [pc, #132]	; (280c <convert_code+0x2e8>)
    2786:	681b      	ldr	r3, [r3, #0]
    2788:	f003 030c 	and.w	r3, r3, #12
    278c:	613b      	str	r3, [r7, #16]
						if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
    278e:	7dfb      	ldrb	r3, [r7, #23]
    2790:	2b60      	cmp	r3, #96	; 0x60
    2792:	d918      	bls.n	27c6 <convert_code+0x2a2>
    2794:	7dfb      	ldrb	r3, [r7, #23]
    2796:	2b7a      	cmp	r3, #122	; 0x7a
    2798:	d815      	bhi.n	27c6 <convert_code+0x2a2>
    279a:	693b      	ldr	r3, [r7, #16]
    279c:	2b00      	cmp	r3, #0
    279e:	d005      	beq.n	27ac <convert_code+0x288>
    27a0:	4b1a      	ldr	r3, [pc, #104]	; (280c <convert_code+0x2e8>)
    27a2:	681b      	ldr	r3, [r3, #0]
    27a4:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    27a8:	2b00      	cmp	r3, #0
    27aa:	d008      	beq.n	27be <convert_code+0x29a>
    27ac:	693b      	ldr	r3, [r7, #16]
    27ae:	2b00      	cmp	r3, #0
    27b0:	d109      	bne.n	27c6 <convert_code+0x2a2>
    27b2:	4b16      	ldr	r3, [pc, #88]	; (280c <convert_code+0x2e8>)
    27b4:	681b      	ldr	r3, [r3, #0]
    27b6:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    27ba:	2b00      	cmp	r3, #0
    27bc:	d003      	beq.n	27c6 <convert_code+0x2a2>
							c-=32;
    27be:	7dfb      	ldrb	r3, [r7, #23]
    27c0:	3b20      	subs	r3, #32
    27c2:	75fb      	strb	r3, [r7, #23]
    27c4:	e00e      	b.n	27e4 <convert_code+0x2c0>
						}else if (shift && (s=search_table(mcsaite_shey,c))){
    27c6:	693b      	ldr	r3, [r7, #16]
    27c8:	2b00      	cmp	r3, #0
    27ca:	d00b      	beq.n	27e4 <convert_code+0x2c0>
    27cc:	7dfb      	ldrb	r3, [r7, #23]
    27ce:	4810      	ldr	r0, [pc, #64]	; (2810 <convert_code+0x2ec>)
    27d0:	4619      	mov	r1, r3
    27d2:	f7ff fe8b 	bl	24ec <search_table>
    27d6:	4603      	mov	r3, r0
    27d8:	73fb      	strb	r3, [r7, #15]
    27da:	7bfb      	ldrb	r3, [r7, #15]
    27dc:	2b00      	cmp	r3, #0
    27de:	d001      	beq.n	27e4 <convert_code+0x2c0>
							c=s;
    27e0:	7bfb      	ldrb	r3, [r7, #15]
    27e2:	75fb      	strb	r3, [r7, #23]
						}
					}
					if (c){
    27e4:	7dfb      	ldrb	r3, [r7, #23]
    27e6:	2b00      	cmp	r3, #0
    27e8:	d00b      	beq.n	2802 <convert_code+0x2de>
						con.insert(c);
    27ea:	4b0a      	ldr	r3, [pc, #40]	; (2814 <convert_code+0x2f0>)
    27ec:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    27ee:	7dfa      	ldrb	r2, [r7, #23]
    27f0:	4610      	mov	r0, r2
    27f2:	4798      	blx	r3
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
    27f4:	e006      	b.n	2804 <convert_code+0x2e0>
					}
					if (c){
						con.insert(c);
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
    27f6:	4b05      	ldr	r3, [pc, #20]	; (280c <convert_code+0x2e8>)
    27f8:	681b      	ldr	r3, [r3, #0]
    27fa:	f023 0303 	bic.w	r3, r3, #3
    27fe:	4a03      	ldr	r2, [pc, #12]	; (280c <convert_code+0x2e8>)
    2800:	6013      	str	r3, [r2, #0]
			}
			break;
    2802:	bf00      	nop
		}//switch
}// convert_code()
    2804:	3718      	adds	r7, #24
    2806:	46bd      	mov	sp, r7
    2808:	bd80      	pop	{r7, pc}
    280a:	bf00      	nop
    280c:	20000164 	.word	0x20000164
    2810:	00004378 	.word	0x00004378
    2814:	2000018c 	.word	0x2000018c

00002818 <EXTI9_5_handler>:



// signal clock du clavier PS/2
__attribute__((optimize("-O0"))) void KBD_CLK_handler(){
    2818:	b480      	push	{r7}
    281a:	b083      	sub	sp, #12
    281c:	af00      	add	r7, sp, #0
	volatile  static unsigned char  in_byte=0,bit_cnt=0;
    volatile unsigned char parity; 

#define data_bit  (KBD_PORT->IDR & KBD_DAT_PIN)
	EXTI->PR|=KBD_CLK_PIN; 
    281e:	4a51      	ldr	r2, [pc, #324]	; (2964 <EXTI9_5_handler+0x14c>)
    2820:	4b50      	ldr	r3, [pc, #320]	; (2964 <EXTI9_5_handler+0x14c>)
    2822:	695b      	ldr	r3, [r3, #20]
    2824:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    2828:	6153      	str	r3, [r2, #20]
    switch (bit_cnt){
    282a:	4b4f      	ldr	r3, [pc, #316]	; (2968 <EXTI9_5_handler+0x150>)
    282c:	781b      	ldrb	r3, [r3, #0]
    282e:	b2db      	uxtb	r3, r3
    2830:	2b09      	cmp	r3, #9
    2832:	d01f      	beq.n	2874 <EXTI9_5_handler+0x5c>
    2834:	2b0a      	cmp	r3, #10
    2836:	d031      	beq.n	289c <EXTI9_5_handler+0x84>
    2838:	2b00      	cmp	r3, #0
    283a:	d16c      	bne.n	2916 <EXTI9_5_handler+0xfe>
	case 0:   // start bit
		ps2_flags&=~(F_ERROR|F_RCVD);
    283c:	4b4b      	ldr	r3, [pc, #300]	; (296c <EXTI9_5_handler+0x154>)
    283e:	781b      	ldrb	r3, [r3, #0]
    2840:	b2db      	uxtb	r3, r3
    2842:	f023 030b 	bic.w	r3, r3, #11
    2846:	b2da      	uxtb	r2, r3
    2848:	4b48      	ldr	r3, [pc, #288]	; (296c <EXTI9_5_handler+0x154>)
    284a:	701a      	strb	r2, [r3, #0]
		if (!data_bit){
    284c:	4b48      	ldr	r3, [pc, #288]	; (2970 <EXTI9_5_handler+0x158>)
    284e:	689b      	ldr	r3, [r3, #8]
    2850:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    2854:	2b00      	cmp	r3, #0
    2856:	d10c      	bne.n	2872 <EXTI9_5_handler+0x5a>
			in_byte=0;
    2858:	4b46      	ldr	r3, [pc, #280]	; (2974 <EXTI9_5_handler+0x15c>)
    285a:	2200      	movs	r2, #0
    285c:	701a      	strb	r2, [r3, #0]
            parity=0;
    285e:	2300      	movs	r3, #0
    2860:	71fb      	strb	r3, [r7, #7]
            bit_cnt++;
    2862:	4b41      	ldr	r3, [pc, #260]	; (2968 <EXTI9_5_handler+0x150>)
    2864:	781b      	ldrb	r3, [r3, #0]
    2866:	b2db      	uxtb	r3, r3
    2868:	3301      	adds	r3, #1
    286a:	b2da      	uxtb	r2, r3
    286c:	4b3e      	ldr	r3, [pc, #248]	; (2968 <EXTI9_5_handler+0x150>)
    286e:	701a      	strb	r2, [r3, #0]
        }
		break;
    2870:	e073      	b.n	295a <EXTI9_5_handler+0x142>
    2872:	e072      	b.n	295a <EXTI9_5_handler+0x142>
	case 9:   // paritée
		if (data_bit) parity++;
    2874:	4b3e      	ldr	r3, [pc, #248]	; (2970 <EXTI9_5_handler+0x158>)
    2876:	689b      	ldr	r3, [r3, #8]
    2878:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    287c:	2b00      	cmp	r3, #0
    287e:	d004      	beq.n	288a <EXTI9_5_handler+0x72>
    2880:	79fb      	ldrb	r3, [r7, #7]
    2882:	b2db      	uxtb	r3, r3
    2884:	3301      	adds	r3, #1
    2886:	b2db      	uxtb	r3, r3
    2888:	71fb      	strb	r3, [r7, #7]
		if (!(parity & 1)){
    288a:	79fb      	ldrb	r3, [r7, #7]
			//ps2_flags |= F_ERR_PARITY;
			
		}
		bit_cnt++;
    288c:	4b36      	ldr	r3, [pc, #216]	; (2968 <EXTI9_5_handler+0x150>)
    288e:	781b      	ldrb	r3, [r3, #0]
    2890:	b2db      	uxtb	r3, r3
    2892:	3301      	adds	r3, #1
    2894:	b2da      	uxtb	r2, r3
    2896:	4b34      	ldr	r3, [pc, #208]	; (2968 <EXTI9_5_handler+0x150>)
    2898:	701a      	strb	r2, [r3, #0]
		break;
    289a:	e05e      	b.n	295a <EXTI9_5_handler+0x142>
	case 10:  // stop bit
	    if (!data_bit){
    289c:	4b34      	ldr	r3, [pc, #208]	; (2970 <EXTI9_5_handler+0x158>)
    289e:	689b      	ldr	r3, [r3, #8]
    28a0:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    28a4:	2b00      	cmp	r3, #0
    28a6:	d108      	bne.n	28ba <EXTI9_5_handler+0xa2>
			ps2_flags|=F_ERR_FRAME;
    28a8:	4b30      	ldr	r3, [pc, #192]	; (296c <EXTI9_5_handler+0x154>)
    28aa:	781b      	ldrb	r3, [r3, #0]
    28ac:	b2db      	uxtb	r3, r3
    28ae:	f043 0308 	orr.w	r3, r3, #8
    28b2:	b2da      	uxtb	r2, r3
    28b4:	4b2d      	ldr	r3, [pc, #180]	; (296c <EXTI9_5_handler+0x154>)
    28b6:	701a      	strb	r2, [r3, #0]
    28b8:	e029      	b.n	290e <EXTI9_5_handler+0xf6>
		}else if (!(ps2_flags&F_ERROR)){
    28ba:	4b2c      	ldr	r3, [pc, #176]	; (296c <EXTI9_5_handler+0x154>)
    28bc:	781b      	ldrb	r3, [r3, #0]
    28be:	b2db      	uxtb	r3, r3
    28c0:	f003 0309 	and.w	r3, r3, #9
    28c4:	2b00      	cmp	r3, #0
    28c6:	d122      	bne.n	290e <EXTI9_5_handler+0xf6>
			if (in_byte==BAT_OK){
    28c8:	4b2a      	ldr	r3, [pc, #168]	; (2974 <EXTI9_5_handler+0x15c>)
    28ca:	781b      	ldrb	r3, [r3, #0]
    28cc:	b2db      	uxtb	r3, r3
    28ce:	2baa      	cmp	r3, #170	; 0xaa
    28d0:	d108      	bne.n	28e4 <EXTI9_5_handler+0xcc>
				ps2_flags|=F_BATOK;
    28d2:	4b26      	ldr	r3, [pc, #152]	; (296c <EXTI9_5_handler+0x154>)
    28d4:	781b      	ldrb	r3, [r3, #0]
    28d6:	b2db      	uxtb	r3, r3
    28d8:	f043 0304 	orr.w	r3, r3, #4
    28dc:	b2da      	uxtb	r2, r3
    28de:	4b23      	ldr	r3, [pc, #140]	; (296c <EXTI9_5_handler+0x154>)
    28e0:	701a      	strb	r2, [r3, #0]
    28e2:	e014      	b.n	290e <EXTI9_5_handler+0xf6>
			}else{
				ps2_queue[ps2_tail++]=in_byte;
    28e4:	4b24      	ldr	r3, [pc, #144]	; (2978 <EXTI9_5_handler+0x160>)
    28e6:	781b      	ldrb	r3, [r3, #0]
    28e8:	b2db      	uxtb	r3, r3
    28ea:	1c5a      	adds	r2, r3, #1
    28ec:	b2d1      	uxtb	r1, r2
    28ee:	4a22      	ldr	r2, [pc, #136]	; (2978 <EXTI9_5_handler+0x160>)
    28f0:	7011      	strb	r1, [r2, #0]
    28f2:	461a      	mov	r2, r3
    28f4:	4b1f      	ldr	r3, [pc, #124]	; (2974 <EXTI9_5_handler+0x15c>)
    28f6:	781b      	ldrb	r3, [r3, #0]
    28f8:	b2d9      	uxtb	r1, r3
    28fa:	4b20      	ldr	r3, [pc, #128]	; (297c <EXTI9_5_handler+0x164>)
    28fc:	5499      	strb	r1, [r3, r2]
				ps2_tail&=PS2_QUEUE_SIZE-1;
    28fe:	4b1e      	ldr	r3, [pc, #120]	; (2978 <EXTI9_5_handler+0x160>)
    2900:	781b      	ldrb	r3, [r3, #0]
    2902:	b2db      	uxtb	r3, r3
    2904:	f003 030f 	and.w	r3, r3, #15
    2908:	b2da      	uxtb	r2, r3
    290a:	4b1b      	ldr	r3, [pc, #108]	; (2978 <EXTI9_5_handler+0x160>)
    290c:	701a      	strb	r2, [r3, #0]
			}
	    }
	    bit_cnt=0;
    290e:	4b16      	ldr	r3, [pc, #88]	; (2968 <EXTI9_5_handler+0x150>)
    2910:	2200      	movs	r2, #0
    2912:	701a      	strb	r2, [r3, #0]
		break;
    2914:	e021      	b.n	295a <EXTI9_5_handler+0x142>
	default:
		in_byte >>=1;
    2916:	4b17      	ldr	r3, [pc, #92]	; (2974 <EXTI9_5_handler+0x15c>)
    2918:	781b      	ldrb	r3, [r3, #0]
    291a:	b2db      	uxtb	r3, r3
    291c:	085b      	lsrs	r3, r3, #1
    291e:	b2da      	uxtb	r2, r3
    2920:	4b14      	ldr	r3, [pc, #80]	; (2974 <EXTI9_5_handler+0x15c>)
    2922:	701a      	strb	r2, [r3, #0]
		if(data_bit){
    2924:	4b12      	ldr	r3, [pc, #72]	; (2970 <EXTI9_5_handler+0x158>)
    2926:	689b      	ldr	r3, [r3, #8]
    2928:	f403 6380 	and.w	r3, r3, #1024	; 0x400
    292c:	2b00      	cmp	r3, #0
    292e:	d00c      	beq.n	294a <EXTI9_5_handler+0x132>
			in_byte |=128;
    2930:	4b10      	ldr	r3, [pc, #64]	; (2974 <EXTI9_5_handler+0x15c>)
    2932:	781b      	ldrb	r3, [r3, #0]
    2934:	b2db      	uxtb	r3, r3
    2936:	f063 037f 	orn	r3, r3, #127	; 0x7f
    293a:	b2da      	uxtb	r2, r3
    293c:	4b0d      	ldr	r3, [pc, #52]	; (2974 <EXTI9_5_handler+0x15c>)
    293e:	701a      	strb	r2, [r3, #0]
			parity++;
    2940:	79fb      	ldrb	r3, [r7, #7]
    2942:	b2db      	uxtb	r3, r3
    2944:	3301      	adds	r3, #1
    2946:	b2db      	uxtb	r3, r3
    2948:	71fb      	strb	r3, [r7, #7]
		}
		bit_cnt++;
    294a:	4b07      	ldr	r3, [pc, #28]	; (2968 <EXTI9_5_handler+0x150>)
    294c:	781b      	ldrb	r3, [r3, #0]
    294e:	b2db      	uxtb	r3, r3
    2950:	3301      	adds	r3, #1
    2952:	b2da      	uxtb	r2, r3
    2954:	4b04      	ldr	r3, [pc, #16]	; (2968 <EXTI9_5_handler+0x150>)
    2956:	701a      	strb	r2, [r3, #0]
		break;
    2958:	bf00      	nop
	}
}
    295a:	370c      	adds	r7, #12
    295c:	46bd      	mov	sp, r7
    295e:	f85d 7b04 	ldr.w	r7, [sp], #4
    2962:	4770      	bx	lr
    2964:	40010400 	.word	0x40010400
    2968:	20000168 	.word	0x20000168
    296c:	20000150 	.word	0x20000150
    2970:	40010800 	.word	0x40010800
    2974:	20000169 	.word	0x20000169
    2978:	20000152 	.word	0x20000152
    297c:	20000154 	.word	0x20000154

00002980 <TIM2_handler>:

void KBD_TMR_handler(){
    2980:	b580      	push	{r7, lr}
    2982:	af00      	add	r7, sp, #0
	KBD_TMR->SR&=~(BIT0); // clear interrupt bit
    2984:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    2988:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    298c:	691b      	ldr	r3, [r3, #16]
    298e:	f023 0301 	bic.w	r3, r3, #1
    2992:	6113      	str	r3, [r2, #16]
	if (ps2_tail!=ps2_head){
    2994:	4b0f      	ldr	r3, [pc, #60]	; (29d4 <TIM2_handler+0x54>)
    2996:	781b      	ldrb	r3, [r3, #0]
    2998:	b2da      	uxtb	r2, r3
    299a:	4b0f      	ldr	r3, [pc, #60]	; (29d8 <TIM2_handler+0x58>)
    299c:	781b      	ldrb	r3, [r3, #0]
    299e:	b2db      	uxtb	r3, r3
    29a0:	429a      	cmp	r2, r3
    29a2:	d015      	beq.n	29d0 <TIM2_handler+0x50>
		convert_code(ps2_queue[ps2_head++]);
    29a4:	4b0c      	ldr	r3, [pc, #48]	; (29d8 <TIM2_handler+0x58>)
    29a6:	781b      	ldrb	r3, [r3, #0]
    29a8:	b2db      	uxtb	r3, r3
    29aa:	1c5a      	adds	r2, r3, #1
    29ac:	b2d1      	uxtb	r1, r2
    29ae:	4a0a      	ldr	r2, [pc, #40]	; (29d8 <TIM2_handler+0x58>)
    29b0:	7011      	strb	r1, [r2, #0]
    29b2:	461a      	mov	r2, r3
    29b4:	4b09      	ldr	r3, [pc, #36]	; (29dc <TIM2_handler+0x5c>)
    29b6:	5c9b      	ldrb	r3, [r3, r2]
    29b8:	b2db      	uxtb	r3, r3
    29ba:	4618      	mov	r0, r3
    29bc:	f7ff fdb2 	bl	2524 <convert_code>
		ps2_head&=PS2_QUEUE_SIZE-1;
    29c0:	4b05      	ldr	r3, [pc, #20]	; (29d8 <TIM2_handler+0x58>)
    29c2:	781b      	ldrb	r3, [r3, #0]
    29c4:	b2db      	uxtb	r3, r3
    29c6:	f003 030f 	and.w	r3, r3, #15
    29ca:	b2da      	uxtb	r2, r3
    29cc:	4b02      	ldr	r3, [pc, #8]	; (29d8 <TIM2_handler+0x58>)
    29ce:	701a      	strb	r2, [r3, #0]
	}
}
    29d0:	bd80      	pop	{r7, pc}
    29d2:	bf00      	nop
    29d4:	20000152 	.word	0x20000152
    29d8:	20000151 	.word	0x20000151
    29dc:	20000154 	.word	0x20000154

000029e0 <enable_interrupt>:

#include "../include/blue_pill.h"



void enable_interrupt(int irq){
    29e0:	b480      	push	{r7}
    29e2:	b083      	sub	sp, #12
    29e4:	af00      	add	r7, sp, #0
    29e6:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    29e8:	687b      	ldr	r3, [r7, #4]
    29ea:	2b3b      	cmp	r3, #59	; 0x3b
    29ec:	dd00      	ble.n	29f0 <enable_interrupt+0x10>
    29ee:	e016      	b.n	2a1e <enable_interrupt+0x3e>
	ISER[irq>>5]|=1<<(irq&0x1f);
    29f0:	687b      	ldr	r3, [r7, #4]
    29f2:	115b      	asrs	r3, r3, #5
    29f4:	009b      	lsls	r3, r3, #2
    29f6:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    29fa:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
    29fe:	687a      	ldr	r2, [r7, #4]
    2a00:	1152      	asrs	r2, r2, #5
    2a02:	0092      	lsls	r2, r2, #2
    2a04:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    2a08:	f502 4261 	add.w	r2, r2, #57600	; 0xe100
    2a0c:	6812      	ldr	r2, [r2, #0]
    2a0e:	6879      	ldr	r1, [r7, #4]
    2a10:	f001 011f 	and.w	r1, r1, #31
    2a14:	2001      	movs	r0, #1
    2a16:	fa00 f101 	lsl.w	r1, r0, r1
    2a1a:	430a      	orrs	r2, r1
    2a1c:	601a      	str	r2, [r3, #0]
}
    2a1e:	370c      	adds	r7, #12
    2a20:	46bd      	mov	sp, r7
    2a22:	f85d 7b04 	ldr.w	r7, [sp], #4
    2a26:	4770      	bx	lr

00002a28 <disable_interrupt>:


void disable_interrupt(int irq){
    2a28:	b480      	push	{r7}
    2a2a:	b083      	sub	sp, #12
    2a2c:	af00      	add	r7, sp, #0
    2a2e:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return ;
    2a30:	687b      	ldr	r3, [r7, #4]
    2a32:	2b3b      	cmp	r3, #59	; 0x3b
    2a34:	dd00      	ble.n	2a38 <disable_interrupt+0x10>
    2a36:	e00b      	b.n	2a50 <disable_interrupt+0x28>
	ICER[irq>>5]=(1<<(irq&0x1f));
    2a38:	687b      	ldr	r3, [r7, #4]
    2a3a:	115b      	asrs	r3, r3, #5
    2a3c:	009a      	lsls	r2, r3, #2
    2a3e:	4b07      	ldr	r3, [pc, #28]	; (2a5c <disable_interrupt+0x34>)
    2a40:	4413      	add	r3, r2
    2a42:	687a      	ldr	r2, [r7, #4]
    2a44:	f002 021f 	and.w	r2, r2, #31
    2a48:	2101      	movs	r1, #1
    2a4a:	fa01 f202 	lsl.w	r2, r1, r2
    2a4e:	601a      	str	r2, [r3, #0]
}
    2a50:	370c      	adds	r7, #12
    2a52:	46bd      	mov	sp, r7
    2a54:	f85d 7b04 	ldr.w	r7, [sp], #4
    2a58:	4770      	bx	lr
    2a5a:	bf00      	nop
    2a5c:	e000e180 	.word	0xe000e180

00002a60 <get_pending>:

unsigned get_pending(int irq){
    2a60:	b480      	push	{r7}
    2a62:	b083      	sub	sp, #12
    2a64:	af00      	add	r7, sp, #0
    2a66:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    2a68:	687b      	ldr	r3, [r7, #4]
    2a6a:	2b3b      	cmp	r3, #59	; 0x3b
    2a6c:	dd01      	ble.n	2a72 <get_pending+0x12>
    2a6e:	2300      	movs	r3, #0
    2a70:	e00c      	b.n	2a8c <get_pending+0x2c>
	return ICPR[irq>>5]&(1<<(irq&0x1f));
    2a72:	687b      	ldr	r3, [r7, #4]
    2a74:	115b      	asrs	r3, r3, #5
    2a76:	009a      	lsls	r2, r3, #2
    2a78:	4b07      	ldr	r3, [pc, #28]	; (2a98 <get_pending+0x38>)
    2a7a:	4413      	add	r3, r2
    2a7c:	681b      	ldr	r3, [r3, #0]
    2a7e:	687a      	ldr	r2, [r7, #4]
    2a80:	f002 021f 	and.w	r2, r2, #31
    2a84:	2101      	movs	r1, #1
    2a86:	fa01 f202 	lsl.w	r2, r1, r2
    2a8a:	4013      	ands	r3, r2
}
    2a8c:	4618      	mov	r0, r3
    2a8e:	370c      	adds	r7, #12
    2a90:	46bd      	mov	sp, r7
    2a92:	f85d 7b04 	ldr.w	r7, [sp], #4
    2a96:	4770      	bx	lr
    2a98:	e000e280 	.word	0xe000e280

00002a9c <get_active>:

unsigned get_active(int irq){
    2a9c:	b480      	push	{r7}
    2a9e:	b083      	sub	sp, #12
    2aa0:	af00      	add	r7, sp, #0
    2aa2:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return 0;
    2aa4:	687b      	ldr	r3, [r7, #4]
    2aa6:	2b3b      	cmp	r3, #59	; 0x3b
    2aa8:	dd01      	ble.n	2aae <get_active+0x12>
    2aaa:	2300      	movs	r3, #0
    2aac:	e00e      	b.n	2acc <get_active+0x30>
	return IABR[irq>>5]&(1<<(irq&0x1f));
    2aae:	687b      	ldr	r3, [r7, #4]
    2ab0:	115b      	asrs	r3, r3, #5
    2ab2:	009b      	lsls	r3, r3, #2
    2ab4:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2ab8:	f503 4363 	add.w	r3, r3, #58112	; 0xe300
    2abc:	681b      	ldr	r3, [r3, #0]
    2abe:	687a      	ldr	r2, [r7, #4]
    2ac0:	f002 021f 	and.w	r2, r2, #31
    2ac4:	2101      	movs	r1, #1
    2ac6:	fa01 f202 	lsl.w	r2, r1, r2
    2aca:	4013      	ands	r3, r2
}
    2acc:	4618      	mov	r0, r3
    2ace:	370c      	adds	r7, #12
    2ad0:	46bd      	mov	sp, r7
    2ad2:	f85d 7b04 	ldr.w	r7, [sp], #4
    2ad6:	4770      	bx	lr

00002ad8 <set_pending>:

void set_pending(int irq){
    2ad8:	b480      	push	{r7}
    2ada:	b083      	sub	sp, #12
    2adc:	af00      	add	r7, sp, #0
    2ade:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    2ae0:	687b      	ldr	r3, [r7, #4]
    2ae2:	2b3b      	cmp	r3, #59	; 0x3b
    2ae4:	dd00      	ble.n	2ae8 <set_pending+0x10>
    2ae6:	e016      	b.n	2b16 <set_pending+0x3e>
	ISPR[irq>>5]|=1<<(irq&0x1f);
    2ae8:	687b      	ldr	r3, [r7, #4]
    2aea:	115b      	asrs	r3, r3, #5
    2aec:	009b      	lsls	r3, r3, #2
    2aee:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2af2:	f503 4362 	add.w	r3, r3, #57856	; 0xe200
    2af6:	687a      	ldr	r2, [r7, #4]
    2af8:	1152      	asrs	r2, r2, #5
    2afa:	0092      	lsls	r2, r2, #2
    2afc:	f102 4260 	add.w	r2, r2, #3758096384	; 0xe0000000
    2b00:	f502 4262 	add.w	r2, r2, #57856	; 0xe200
    2b04:	6812      	ldr	r2, [r2, #0]
    2b06:	6879      	ldr	r1, [r7, #4]
    2b08:	f001 011f 	and.w	r1, r1, #31
    2b0c:	2001      	movs	r0, #1
    2b0e:	fa00 f101 	lsl.w	r1, r0, r1
    2b12:	430a      	orrs	r2, r1
    2b14:	601a      	str	r2, [r3, #0]
}
    2b16:	370c      	adds	r7, #12
    2b18:	46bd      	mov	sp, r7
    2b1a:	f85d 7b04 	ldr.w	r7, [sp], #4
    2b1e:	4770      	bx	lr

00002b20 <clear_pending>:

void clear_pending(int irq){
    2b20:	b480      	push	{r7}
    2b22:	b083      	sub	sp, #12
    2b24:	af00      	add	r7, sp, #0
    2b26:	6078      	str	r0, [r7, #4]
	if (irq>LAST_IRQ) return;
    2b28:	687b      	ldr	r3, [r7, #4]
    2b2a:	2b3b      	cmp	r3, #59	; 0x3b
    2b2c:	dd00      	ble.n	2b30 <clear_pending+0x10>
    2b2e:	e00b      	b.n	2b48 <clear_pending+0x28>
	ICPR[irq>>5]=(1<<(irq&0x1f));
    2b30:	687b      	ldr	r3, [r7, #4]
    2b32:	115b      	asrs	r3, r3, #5
    2b34:	009a      	lsls	r2, r3, #2
    2b36:	4b07      	ldr	r3, [pc, #28]	; (2b54 <clear_pending+0x34>)
    2b38:	4413      	add	r3, r2
    2b3a:	687a      	ldr	r2, [r7, #4]
    2b3c:	f002 021f 	and.w	r2, r2, #31
    2b40:	2101      	movs	r1, #1
    2b42:	fa01 f202 	lsl.w	r2, r1, r2
    2b46:	601a      	str	r2, [r3, #0]
}
    2b48:	370c      	adds	r7, #12
    2b4a:	46bd      	mov	sp, r7
    2b4c:	f85d 7b04 	ldr.w	r7, [sp], #4
    2b50:	4770      	bx	lr
    2b52:	bf00      	nop
    2b54:	e000e280 	.word	0xe000e280

00002b58 <set_int_priority>:


void set_int_priority(int irq, unsigned priority){
    2b58:	b480      	push	{r7}
    2b5a:	b083      	sub	sp, #12
    2b5c:	af00      	add	r7, sp, #0
    2b5e:	6078      	str	r0, [r7, #4]
    2b60:	6039      	str	r1, [r7, #0]
	if ((irq>=0) && (irq<=LAST_IRQ)){
    2b62:	687b      	ldr	r3, [r7, #4]
    2b64:	2b00      	cmp	r3, #0
    2b66:	db0d      	blt.n	2b84 <set_int_priority+0x2c>
    2b68:	687b      	ldr	r3, [r7, #4]
    2b6a:	2b3b      	cmp	r3, #59	; 0x3b
    2b6c:	dc0a      	bgt.n	2b84 <set_int_priority+0x2c>
		IPR[irq]=(uint8_t)((priority&15)<<4);
    2b6e:	687b      	ldr	r3, [r7, #4]
    2b70:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
    2b74:	f503 4364 	add.w	r3, r3, #58368	; 0xe400
    2b78:	683a      	ldr	r2, [r7, #0]
    2b7a:	b2d2      	uxtb	r2, r2
    2b7c:	0112      	lsls	r2, r2, #4
    2b7e:	b2d2      	uxtb	r2, r2
    2b80:	701a      	strb	r2, [r3, #0]
    2b82:	e012      	b.n	2baa <set_int_priority+0x52>
	}else if ((irq<0) && (irq>-16)){
    2b84:	687b      	ldr	r3, [r7, #4]
    2b86:	2b00      	cmp	r3, #0
    2b88:	da0f      	bge.n	2baa <set_int_priority+0x52>
    2b8a:	687b      	ldr	r3, [r7, #4]
    2b8c:	f113 0f0f 	cmn.w	r3, #15
    2b90:	db0b      	blt.n	2baa <set_int_priority+0x52>
		SHPR[-(irq+4)]=(uint8_t)((priority&15)<<4);
    2b92:	687a      	ldr	r2, [r7, #4]
    2b94:	f06f 0303 	mvn.w	r3, #3
    2b98:	1a9b      	subs	r3, r3, r2
    2b9a:	461a      	mov	r2, r3
    2b9c:	4b05      	ldr	r3, [pc, #20]	; (2bb4 <set_int_priority+0x5c>)
    2b9e:	4413      	add	r3, r2
    2ba0:	683a      	ldr	r2, [r7, #0]
    2ba2:	b2d2      	uxtb	r2, r2
    2ba4:	0112      	lsls	r2, r2, #4
    2ba6:	b2d2      	uxtb	r2, r2
    2ba8:	701a      	strb	r2, [r3, #0]
	}
}
    2baa:	370c      	adds	r7, #12
    2bac:	46bd      	mov	sp, r7
    2bae:	f85d 7b04 	ldr.w	r7, [sp], #4
    2bb2:	4770      	bx	lr
    2bb4:	e000ed18 	.word	0xe000ed18

00002bb8 <sdcard_capacity>:

uint16_t sdc_status; // indicateurs booléens carte SD
static unsigned blocks_count; // nombre de bloc de 512 octets

// retourne la capacité en Mo
unsigned sdcard_capacity(){
    2bb8:	b480      	push	{r7}
    2bba:	af00      	add	r7, sp, #0
	return blocks_count/2048;
    2bbc:	4b03      	ldr	r3, [pc, #12]	; (2bcc <sdcard_capacity+0x14>)
    2bbe:	681b      	ldr	r3, [r3, #0]
    2bc0:	0adb      	lsrs	r3, r3, #11
}
    2bc2:	4618      	mov	r0, r3
    2bc4:	46bd      	mov	sp, r7
    2bc6:	f85d 7b04 	ldr.w	r7, [sp], #4
    2bca:	4770      	bx	lr
    2bcc:	2000016c 	.word	0x2000016c

00002bd0 <dummy_clock>:

// après la mise sous tension la carte
// doit-être activée par 80 clock
static void dummy_clock(){
    2bd0:	b580      	push	{r7, lr}
    2bd2:	b082      	sub	sp, #8
    2bd4:	af00      	add	r7, sp, #0
		int i;
		_sdcard_cs_high();
    2bd6:	4a0a      	ldr	r2, [pc, #40]	; (2c00 <dummy_clock+0x30>)
    2bd8:	4b09      	ldr	r3, [pc, #36]	; (2c00 <dummy_clock+0x30>)
    2bda:	68db      	ldr	r3, [r3, #12]
    2bdc:	f043 0310 	orr.w	r3, r3, #16
    2be0:	60d3      	str	r3, [r2, #12]
		// envoie de 80 clock pour activer la carte
		for (i=0;i<10;i++)spi_read(SDC_SPI);
    2be2:	2300      	movs	r3, #0
    2be4:	607b      	str	r3, [r7, #4]
    2be6:	e005      	b.n	2bf4 <dummy_clock+0x24>
    2be8:	4806      	ldr	r0, [pc, #24]	; (2c04 <dummy_clock+0x34>)
    2bea:	f000 fb41 	bl	3270 <spi_read>
    2bee:	687b      	ldr	r3, [r7, #4]
    2bf0:	3301      	adds	r3, #1
    2bf2:	607b      	str	r3, [r7, #4]
    2bf4:	687b      	ldr	r3, [r7, #4]
    2bf6:	2b09      	cmp	r3, #9
    2bf8:	ddf6      	ble.n	2be8 <dummy_clock+0x18>
}
    2bfa:	3708      	adds	r7, #8
    2bfc:	46bd      	mov	sp, r7
    2bfe:	bd80      	pop	{r7, pc}
    2c00:	40010800 	.word	0x40010800
    2c04:	40013000 	.word	0x40013000

00002c08 <sdc_wait_ready>:

// attend que la carte soie prête
// lit des caractère de la carte 
// jusqu'à ce que le caractèr lu soit 0xff
// expire après 10msec
static int sdc_wait_ready(){
    2c08:	b580      	push	{r7, lr}
    2c0a:	b082      	sub	sp, #8
    2c0c:	af00      	add	r7, sp, #0
	unsigned char c;
	unsigned t0;
	t0=ticks+500;
    2c0e:	4b0f      	ldr	r3, [pc, #60]	; (2c4c <sdc_wait_ready+0x44>)
    2c10:	681b      	ldr	r3, [r3, #0]
    2c12:	f503 73fa 	add.w	r3, r3, #500	; 0x1f4
    2c16:	603b      	str	r3, [r7, #0]
	while (ticks<t0){
    2c18:	e008      	b.n	2c2c <sdc_wait_ready+0x24>
		c=spi_read(SDC_SPI);
    2c1a:	480d      	ldr	r0, [pc, #52]	; (2c50 <sdc_wait_ready+0x48>)
    2c1c:	f000 fb28 	bl	3270 <spi_read>
    2c20:	4603      	mov	r3, r0
    2c22:	71fb      	strb	r3, [r7, #7]
	    if (c==0xff){break;}
    2c24:	79fb      	ldrb	r3, [r7, #7]
    2c26:	2bff      	cmp	r3, #255	; 0xff
    2c28:	d100      	bne.n	2c2c <sdc_wait_ready+0x24>
    2c2a:	e004      	b.n	2c36 <sdc_wait_ready+0x2e>
// expire après 10msec
static int sdc_wait_ready(){
	unsigned char c;
	unsigned t0;
	t0=ticks+500;
	while (ticks<t0){
    2c2c:	4b07      	ldr	r3, [pc, #28]	; (2c4c <sdc_wait_ready+0x44>)
    2c2e:	681a      	ldr	r2, [r3, #0]
    2c30:	683b      	ldr	r3, [r7, #0]
    2c32:	429a      	cmp	r2, r3
    2c34:	d3f1      	bcc.n	2c1a <sdc_wait_ready+0x12>
		c=spi_read(SDC_SPI);
	    if (c==0xff){break;}
	}
	return c==0xff;
    2c36:	79fb      	ldrb	r3, [r7, #7]
    2c38:	2bff      	cmp	r3, #255	; 0xff
    2c3a:	bf0c      	ite	eq
    2c3c:	2301      	moveq	r3, #1
    2c3e:	2300      	movne	r3, #0
    2c40:	b2db      	uxtb	r3, r3
}
    2c42:	4618      	mov	r0, r3
    2c44:	3708      	adds	r7, #8
    2c46:	46bd      	mov	sp, r7
    2c48:	bd80      	pop	{r7, pc}
    2c4a:	bf00      	nop
    2c4c:	20000170 	.word	0x20000170
    2c50:	40013000 	.word	0x40013000

00002c54 <sdcard_deselect>:

// desactivation de l'interface avec la carte
void sdcard_deselect(){
    2c54:	b580      	push	{r7, lr}
    2c56:	af00      	add	r7, sp, #0
	_sdcard_cs_high();
    2c58:	4a05      	ldr	r2, [pc, #20]	; (2c70 <sdcard_deselect+0x1c>)
    2c5a:	4b05      	ldr	r3, [pc, #20]	; (2c70 <sdcard_deselect+0x1c>)
    2c5c:	68db      	ldr	r3, [r3, #12]
    2c5e:	f043 0310 	orr.w	r3, r3, #16
    2c62:	60d3      	str	r3, [r2, #12]
	spi_write(SDC_SPI,0xff);
    2c64:	4803      	ldr	r0, [pc, #12]	; (2c74 <sdcard_deselect+0x20>)
    2c66:	21ff      	movs	r1, #255	; 0xff
    2c68:	f000 fae2 	bl	3230 <spi_write>
}
    2c6c:	bd80      	pop	{r7, pc}
    2c6e:	bf00      	nop
    2c70:	40010800 	.word	0x40010800
    2c74:	40013000 	.word	0x40013000

00002c78 <sdcard_select>:

// sélection la carte
int sdcard_select(){
    2c78:	b580      	push	{r7, lr}
    2c7a:	af00      	add	r7, sp, #0
	_sdcard_cs_low();
    2c7c:	4a0a      	ldr	r2, [pc, #40]	; (2ca8 <sdcard_select+0x30>)
    2c7e:	4b0a      	ldr	r3, [pc, #40]	; (2ca8 <sdcard_select+0x30>)
    2c80:	68db      	ldr	r3, [r3, #12]
    2c82:	f023 0310 	bic.w	r3, r3, #16
    2c86:	60d3      	str	r3, [r2, #12]
	spi_write(SDC_SPI,0xff);
    2c88:	4808      	ldr	r0, [pc, #32]	; (2cac <sdcard_select+0x34>)
    2c8a:	21ff      	movs	r1, #255	; 0xff
    2c8c:	f000 fad0 	bl	3230 <spi_write>
	if (sdc_wait_ready()){
    2c90:	f7ff ffba 	bl	2c08 <sdc_wait_ready>
    2c94:	4603      	mov	r3, r0
    2c96:	2b00      	cmp	r3, #0
    2c98:	d001      	beq.n	2c9e <sdcard_select+0x26>
		return 1;
    2c9a:	2301      	movs	r3, #1
    2c9c:	e002      	b.n	2ca4 <sdcard_select+0x2c>
	}else{
		sdcard_deselect();
    2c9e:	f7ff ffd9 	bl	2c54 <sdcard_deselect>
		return 0;
    2ca2:	2300      	movs	r3, #0
	}
}
    2ca4:	4618      	mov	r0, r3
    2ca6:	bd80      	pop	{r7, pc}
    2ca8:	40010800 	.word	0x40010800
    2cac:	40013000 	.word	0x40013000

00002cb0 <sdc_cmd>:
*    cmd  index de la commande
*    args arguments de la commande
* retourne:
*   r1 1ier octet réponse de la carte
***********************************/
unsigned char sdc_cmd(unsigned char cmd,unsigned char *args){
    2cb0:	b580      	push	{r7, lr}
    2cb2:	b084      	sub	sp, #16
    2cb4:	af00      	add	r7, sp, #0
    2cb6:	4603      	mov	r3, r0
    2cb8:	6039      	str	r1, [r7, #0]
    2cba:	71fb      	strb	r3, [r7, #7]
    unsigned char r1;
    int i;
    
    sdcard_deselect();
    2cbc:	f7ff ffca 	bl	2c54 <sdcard_deselect>
    if (!sdcard_select()) return 0xff;
    2cc0:	f7ff ffda 	bl	2c78 <sdcard_select>
    2cc4:	4603      	mov	r3, r0
    2cc6:	2b00      	cmp	r3, #0
    2cc8:	d101      	bne.n	2cce <sdc_cmd+0x1e>
    2cca:	23ff      	movs	r3, #255	; 0xff
    2ccc:	e020      	b.n	2d10 <sdc_cmd+0x60>
    spi_write(SDC_SPI,cmd|0x40);
    2cce:	79fb      	ldrb	r3, [r7, #7]
    2cd0:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    2cd4:	b2db      	uxtb	r3, r3
    2cd6:	4810      	ldr	r0, [pc, #64]	; (2d18 <sdc_cmd+0x68>)
    2cd8:	4619      	mov	r1, r3
    2cda:	f000 faa9 	bl	3230 <spi_write>
    spi_block_write(SDC_SPI,args,5);
    2cde:	480e      	ldr	r0, [pc, #56]	; (2d18 <sdc_cmd+0x68>)
    2ce0:	6839      	ldr	r1, [r7, #0]
    2ce2:	2205      	movs	r2, #5
    2ce4:	f000 fae4 	bl	32b0 <spi_block_write>
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
    2ce8:	2308      	movs	r3, #8
    2cea:	60bb      	str	r3, [r7, #8]
    2cec:	e00c      	b.n	2d08 <sdc_cmd+0x58>
		r1=spi_read(SDC_SPI);
    2cee:	480a      	ldr	r0, [pc, #40]	; (2d18 <sdc_cmd+0x68>)
    2cf0:	f000 fabe 	bl	3270 <spi_read>
    2cf4:	4603      	mov	r3, r0
    2cf6:	73fb      	strb	r3, [r7, #15]
		if (r1<128) {break;}
    2cf8:	7bfb      	ldrb	r3, [r7, #15]
    2cfa:	b25b      	sxtb	r3, r3
    2cfc:	2b00      	cmp	r3, #0
    2cfe:	db00      	blt.n	2d02 <sdc_cmd+0x52>
    2d00:	e005      	b.n	2d0e <sdc_cmd+0x5e>
    if (!sdcard_select()) return 0xff;
    spi_write(SDC_SPI,cmd|0x40);
    spi_block_write(SDC_SPI,args,5);
//attend la réponse 8 essais
// réception de r1    
    for (i=8;i;i--){
    2d02:	68bb      	ldr	r3, [r7, #8]
    2d04:	3b01      	subs	r3, #1
    2d06:	60bb      	str	r3, [r7, #8]
    2d08:	68bb      	ldr	r3, [r7, #8]
    2d0a:	2b00      	cmp	r3, #0
    2d0c:	d1ef      	bne.n	2cee <sdc_cmd+0x3e>
		r1=spi_read(SDC_SPI);
		if (r1<128) {break;}
	}
    return r1;
    2d0e:	7bfb      	ldrb	r3, [r7, #15]
}
    2d10:	4618      	mov	r0, r3
    2d12:	3710      	adds	r7, #16
    2d14:	46bd      	mov	sp, r7
    2d16:	bd80      	pop	{r7, pc}
    2d18:	40013000 	.word	0x40013000

00002d1c <sdc_read_register>:

unsigned char sdc_read_register(unsigned char index, unsigned char *reg){
    2d1c:	b580      	push	{r7, lr}
    2d1e:	b084      	sub	sp, #16
    2d20:	af00      	add	r7, sp, #0
    2d22:	4603      	mov	r3, r0
    2d24:	6039      	str	r1, [r7, #0]
    2d26:	71fb      	strb	r3, [r7, #7]
	unsigned char c=0xff, r1, args[5]={0,0,0,0,0};
    2d28:	23ff      	movs	r3, #255	; 0xff
    2d2a:	73fb      	strb	r3, [r7, #15]
    2d2c:	2300      	movs	r3, #0
    2d2e:	723b      	strb	r3, [r7, #8]
    2d30:	2300      	movs	r3, #0
    2d32:	727b      	strb	r3, [r7, #9]
    2d34:	2300      	movs	r3, #0
    2d36:	72bb      	strb	r3, [r7, #10]
    2d38:	2300      	movs	r3, #0
    2d3a:	72fb      	strb	r3, [r7, #11]
    2d3c:	2300      	movs	r3, #0
    2d3e:	733b      	strb	r3, [r7, #12]
	r1=sdc_cmd(index,args);
    2d40:	79fa      	ldrb	r2, [r7, #7]
    2d42:	f107 0308 	add.w	r3, r7, #8
    2d46:	4610      	mov	r0, r2
    2d48:	4619      	mov	r1, r3
    2d4a:	f7ff ffb1 	bl	2cb0 <sdc_cmd>
    2d4e:	4603      	mov	r3, r0
    2d50:	73bb      	strb	r3, [r7, #14]
	if (!r1){
    2d52:	7bbb      	ldrb	r3, [r7, #14]
    2d54:	2b00      	cmp	r3, #0
    2d56:	d115      	bne.n	2d84 <sdc_read_register+0x68>
		do {
			c=spi_read(SDC_SPI);
    2d58:	480f      	ldr	r0, [pc, #60]	; (2d98 <sdc_read_register+0x7c>)
    2d5a:	f000 fa89 	bl	3270 <spi_read>
    2d5e:	4603      	mov	r3, r0
    2d60:	73fb      	strb	r3, [r7, #15]
		}while (c==0xff);
    2d62:	7bfb      	ldrb	r3, [r7, #15]
    2d64:	2bff      	cmp	r3, #255	; 0xff
    2d66:	d0f7      	beq.n	2d58 <sdc_read_register+0x3c>
		if (c==0xfe){ // lecture de 16 octets
    2d68:	7bfb      	ldrb	r3, [r7, #15]
    2d6a:	2bfe      	cmp	r3, #254	; 0xfe
    2d6c:	d10a      	bne.n	2d84 <sdc_read_register+0x68>
			spi_block_read(SDC_SPI,reg,16);
    2d6e:	480a      	ldr	r0, [pc, #40]	; (2d98 <sdc_read_register+0x7c>)
    2d70:	6839      	ldr	r1, [r7, #0]
    2d72:	2210      	movs	r2, #16
    2d74:	f000 fac6 	bl	3304 <spi_block_read>
			// lecture du CRC 16 bits
			spi_read(SDC_SPI);
    2d78:	4807      	ldr	r0, [pc, #28]	; (2d98 <sdc_read_register+0x7c>)
    2d7a:	f000 fa79 	bl	3270 <spi_read>
			spi_read(SDC_SPI);
    2d7e:	4806      	ldr	r0, [pc, #24]	; (2d98 <sdc_read_register+0x7c>)
    2d80:	f000 fa76 	bl	3270 <spi_read>
		}
	}
//	sdcard_deselect();
	return !r1;
    2d84:	7bbb      	ldrb	r3, [r7, #14]
    2d86:	2b00      	cmp	r3, #0
    2d88:	bf0c      	ite	eq
    2d8a:	2301      	moveq	r3, #1
    2d8c:	2300      	movne	r3, #0
    2d8e:	b2db      	uxtb	r3, r3
}
    2d90:	4618      	mov	r0, r3
    2d92:	3710      	adds	r7, #16
    2d94:	46bd      	mov	sp, r7
    2d96:	bd80      	pop	{r7, pc}
    2d98:	40013000 	.word	0x40013000

00002d9c <sdc_set_size>:

// détermine la capacité de la carte
static unsigned char sdc_set_size(){
    2d9c:	b580      	push	{r7, lr}
    2d9e:	b088      	sub	sp, #32
    2da0:	af00      	add	r7, sp, #0
	unsigned char r1,csd[16];
	unsigned block_len,c_size,c_size_mult;
	r1=sdc_read_register(SEND_CSD,csd);
    2da2:	463b      	mov	r3, r7
    2da4:	2009      	movs	r0, #9
    2da6:	4619      	mov	r1, r3
    2da8:	f7ff ffb8 	bl	2d1c <sdc_read_register>
    2dac:	4603      	mov	r3, r0
    2dae:	77fb      	strb	r3, [r7, #31]
	if (r1){
    2db0:	7ffb      	ldrb	r3, [r7, #31]
    2db2:	2b00      	cmp	r3, #0
    2db4:	d038      	beq.n	2e28 <sdc_set_size+0x8c>
		if (sdc_status&F_SDC_HC){//version 2, carte haute capacité
    2db6:	4b1f      	ldr	r3, [pc, #124]	; (2e34 <sdc_set_size+0x98>)
    2db8:	881b      	ldrh	r3, [r3, #0]
    2dba:	f003 0308 	and.w	r3, r3, #8
    2dbe:	2b00      	cmp	r3, #0
    2dc0:	d008      	beq.n	2dd4 <sdc_set_size+0x38>
			blocks_count=1024*((csd[8]<<8)+csd[9]);
    2dc2:	7a3b      	ldrb	r3, [r7, #8]
    2dc4:	021b      	lsls	r3, r3, #8
    2dc6:	7a7a      	ldrb	r2, [r7, #9]
    2dc8:	4413      	add	r3, r2
    2dca:	029b      	lsls	r3, r3, #10
    2dcc:	461a      	mov	r2, r3
    2dce:	4b1a      	ldr	r3, [pc, #104]	; (2e38 <sdc_set_size+0x9c>)
    2dd0:	601a      	str	r2, [r3, #0]
    2dd2:	e029      	b.n	2e28 <sdc_set_size+0x8c>
		}else{// version 1
			block_len=1<<((csd[5]&0xf)-1);
    2dd4:	797b      	ldrb	r3, [r7, #5]
    2dd6:	f003 030f 	and.w	r3, r3, #15
    2dda:	3b01      	subs	r3, #1
    2ddc:	2201      	movs	r2, #1
    2dde:	fa02 f303 	lsl.w	r3, r2, r3
    2de2:	61bb      	str	r3, [r7, #24]
			c_size=(csd[6]&0xf<<10)+(csd[7]<<2)+((csd[8]>>6)&3)+1;
    2de4:	79bb      	ldrb	r3, [r7, #6]
    2de6:	f403 5270 	and.w	r2, r3, #15360	; 0x3c00
    2dea:	79fb      	ldrb	r3, [r7, #7]
    2dec:	009b      	lsls	r3, r3, #2
    2dee:	441a      	add	r2, r3
    2df0:	7a3b      	ldrb	r3, [r7, #8]
    2df2:	099b      	lsrs	r3, r3, #6
    2df4:	b2db      	uxtb	r3, r3
    2df6:	f003 0303 	and.w	r3, r3, #3
    2dfa:	4413      	add	r3, r2
    2dfc:	3301      	adds	r3, #1
    2dfe:	617b      	str	r3, [r7, #20]
			c_size_mult=1<<(((csd[9]&0x3)<<1)+(csd[10]>>7)+2);
    2e00:	7a7b      	ldrb	r3, [r7, #9]
    2e02:	f003 0303 	and.w	r3, r3, #3
    2e06:	005b      	lsls	r3, r3, #1
    2e08:	7aba      	ldrb	r2, [r7, #10]
    2e0a:	09d2      	lsrs	r2, r2, #7
    2e0c:	b2d2      	uxtb	r2, r2
    2e0e:	4413      	add	r3, r2
    2e10:	3302      	adds	r3, #2
    2e12:	2201      	movs	r2, #1
    2e14:	fa02 f303 	lsl.w	r3, r2, r3
    2e18:	613b      	str	r3, [r7, #16]
			blocks_count=(c_size*c_size_mult)>>9;
    2e1a:	697b      	ldr	r3, [r7, #20]
    2e1c:	693a      	ldr	r2, [r7, #16]
    2e1e:	fb02 f303 	mul.w	r3, r2, r3
    2e22:	0a5b      	lsrs	r3, r3, #9
    2e24:	4a04      	ldr	r2, [pc, #16]	; (2e38 <sdc_set_size+0x9c>)
    2e26:	6013      	str	r3, [r2, #0]
		}
	}
	return r1;
    2e28:	7ffb      	ldrb	r3, [r7, #31]
}
    2e2a:	4618      	mov	r0, r3
    2e2c:	3720      	adds	r7, #32
    2e2e:	46bd      	mov	sp, r7
    2e30:	bd80      	pop	{r7, pc}
    2e32:	bf00      	nop
    2e34:	200001d4 	.word	0x200001d4
    2e38:	2000016c 	.word	0x2000016c

00002e3c <sdcard_init>:

// flow chart REF: http://elm-chan.org/docs/mmc/ima/sdinit.png
int sdcard_init(){
    2e3c:	b580      	push	{r7, lr}
    2e3e:	b088      	sub	sp, #32
    2e40:	af00      	add	r7, sp, #0
		int i;
		unsigned t0;
		uint8_t r1,args[5], resp[16];
		
		sdc_status=0;
    2e42:	4b97      	ldr	r3, [pc, #604]	; (30a0 <sdcard_init+0x264>)
    2e44:	2200      	movs	r2, #0
    2e46:	801a      	strh	r2, [r3, #0]
		blocks_count=0;
    2e48:	4b96      	ldr	r3, [pc, #600]	; (30a4 <sdcard_init+0x268>)
    2e4a:	2200      	movs	r2, #0
    2e4c:	601a      	str	r2, [r3, #0]
		// initialise le périphérique SPI à la vitesse la plus lente.
		spi_init(SDC_SPI, SDC_CLK_SLOW, SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI, SPI_STD_PORT);
    2e4e:	4896      	ldr	r0, [pc, #600]	; (30a8 <sdcard_init+0x26c>)
    2e50:	2107      	movs	r1, #7
    2e52:	f44f 7241 	mov.w	r2, #772	; 0x304
    2e56:	2300      	movs	r3, #0
    2e58:	f000 f9ba 	bl	31d0 <spi_init>
		// delais 2 msec
		pause(2);
    2e5c:	2002      	movs	r0, #2
    2e5e:	f000 facd 	bl	33fc <pause>
		sdcard_deselect();
    2e62:	f7ff fef7 	bl	2c54 <sdcard_deselect>
		dummy_clock();
    2e66:	f7ff feb3 	bl	2bd0 <dummy_clock>
		if (!sdcard_select()){
    2e6a:	f7ff ff05 	bl	2c78 <sdcard_select>
    2e6e:	4603      	mov	r3, r0
    2e70:	2b00      	cmp	r3, #0
    2e72:	d108      	bne.n	2e86 <sdcard_init+0x4a>
				sdc_status|=F_SDC_IE;
    2e74:	4b8a      	ldr	r3, [pc, #552]	; (30a0 <sdcard_init+0x264>)
    2e76:	881b      	ldrh	r3, [r3, #0]
    2e78:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    2e7c:	b29a      	uxth	r2, r3
    2e7e:	4b88      	ldr	r3, [pc, #544]	; (30a0 <sdcard_init+0x264>)
    2e80:	801a      	strh	r2, [r3, #0]
				return 0;
    2e82:	2300      	movs	r3, #0
    2e84:	e108      	b.n	3098 <sdcard_init+0x25c>
		}
		// envoie GO_IDLE_STATE, CMD0 
		// si succès r1==1
//		print("sending CMD0\n");
		args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMD0_CRC;
    2e86:	2300      	movs	r3, #0
    2e88:	743b      	strb	r3, [r7, #16]
    2e8a:	2300      	movs	r3, #0
    2e8c:	747b      	strb	r3, [r7, #17]
    2e8e:	2300      	movs	r3, #0
    2e90:	74bb      	strb	r3, [r7, #18]
    2e92:	2300      	movs	r3, #0
    2e94:	74fb      	strb	r3, [r7, #19]
    2e96:	2395      	movs	r3, #149	; 0x95
    2e98:	753b      	strb	r3, [r7, #20]
		r1=sdc_cmd(GO_IDLE_STATE,args);
    2e9a:	f107 0310 	add.w	r3, r7, #16
    2e9e:	2000      	movs	r0, #0
    2ea0:	4619      	mov	r1, r3
    2ea2:	f7ff ff05 	bl	2cb0 <sdc_cmd>
    2ea6:	4603      	mov	r3, r0
    2ea8:	77fb      	strb	r3, [r7, #31]
		switch (r1){
    2eaa:	7ffb      	ldrb	r3, [r7, #31]
    2eac:	2b01      	cmp	r3, #1
    2eae:	d013      	beq.n	2ed8 <sdcard_init+0x9c>
    2eb0:	2bff      	cmp	r3, #255	; 0xff
    2eb2:	d108      	bne.n	2ec6 <sdcard_init+0x8a>
		case 1:
			break;
		case 0xff:
			sdc_status|=F_SDC_TO;
    2eb4:	4b7a      	ldr	r3, [pc, #488]	; (30a0 <sdcard_init+0x264>)
    2eb6:	881b      	ldrh	r3, [r3, #0]
    2eb8:	f043 0310 	orr.w	r3, r3, #16
    2ebc:	b29a      	uxth	r2, r3
    2ebe:	4b78      	ldr	r3, [pc, #480]	; (30a0 <sdcard_init+0x264>)
    2ec0:	801a      	strh	r2, [r3, #0]
			return 0;
    2ec2:	2300      	movs	r3, #0
    2ec4:	e0e8      	b.n	3098 <sdcard_init+0x25c>
		default:
			sdc_status|=F_SDC_IE;
    2ec6:	4b76      	ldr	r3, [pc, #472]	; (30a0 <sdcard_init+0x264>)
    2ec8:	881b      	ldrh	r3, [r3, #0]
    2eca:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    2ece:	b29a      	uxth	r2, r3
    2ed0:	4b73      	ldr	r3, [pc, #460]	; (30a0 <sdcard_init+0x264>)
    2ed2:	801a      	strh	r2, [r3, #0]
			return 0;
    2ed4:	2300      	movs	r3, #0
    2ed6:	e0df      	b.n	3098 <sdcard_init+0x25c>
//		print("sending CMD0\n");
		args[0]=0;args[1]=0;args[2]=0;args[3]=0;args[4]=CMD0_CRC;
		r1=sdc_cmd(GO_IDLE_STATE,args);
		switch (r1){
		case 1:
			break;
    2ed8:	bf00      	nop
			return 0;
		default:
			sdc_status|=F_SDC_IE;
			return 0;
		}//switch (r1)
		sdc_status|=F_SDC_IN;
    2eda:	4b71      	ldr	r3, [pc, #452]	; (30a0 <sdcard_init+0x264>)
    2edc:	881b      	ldrh	r3, [r3, #0]
    2ede:	f043 0301 	orr.w	r3, r3, #1
    2ee2:	b29a      	uxth	r2, r3
    2ee4:	4b6e      	ldr	r3, [pc, #440]	; (30a0 <sdcard_init+0x264>)
    2ee6:	801a      	strh	r2, [r3, #0]
//		print("sending CMD8\n");
		args[2]=1;args[3]=0xaa;args[4]=CMD8_CRC;
    2ee8:	2301      	movs	r3, #1
    2eea:	74bb      	strb	r3, [r7, #18]
    2eec:	23aa      	movs	r3, #170	; 0xaa
    2eee:	74fb      	strb	r3, [r7, #19]
    2ef0:	2387      	movs	r3, #135	; 0x87
    2ef2:	753b      	strb	r3, [r7, #20]
		r1=sdc_cmd(SEND_IF_COND,args);
    2ef4:	f107 0310 	add.w	r3, r7, #16
    2ef8:	2008      	movs	r0, #8
    2efa:	4619      	mov	r1, r3
    2efc:	f7ff fed8 	bl	2cb0 <sdc_cmd>
    2f00:	4603      	mov	r3, r0
    2f02:	77fb      	strb	r3, [r7, #31]
		if (r1==1){
    2f04:	7ffb      	ldrb	r3, [r7, #31]
    2f06:	2b01      	cmp	r3, #1
    2f08:	d11c      	bne.n	2f44 <sdcard_init+0x108>
			spi_block_read(SDC_SPI,resp,4);
    2f0a:	463b      	mov	r3, r7
    2f0c:	4866      	ldr	r0, [pc, #408]	; (30a8 <sdcard_init+0x26c>)
    2f0e:	4619      	mov	r1, r3
    2f10:	2204      	movs	r2, #4
    2f12:	f000 f9f7 	bl	3304 <spi_block_read>
			if ((resp[2]==1) && (resp[3]==0xAA)){
    2f16:	78bb      	ldrb	r3, [r7, #2]
    2f18:	2b01      	cmp	r3, #1
    2f1a:	d10a      	bne.n	2f32 <sdcard_init+0xf6>
    2f1c:	78fb      	ldrb	r3, [r7, #3]
    2f1e:	2baa      	cmp	r3, #170	; 0xaa
    2f20:	d107      	bne.n	2f32 <sdcard_init+0xf6>
				sdc_status|=F_SDC_V2;
    2f22:	4b5f      	ldr	r3, [pc, #380]	; (30a0 <sdcard_init+0x264>)
    2f24:	881b      	ldrh	r3, [r3, #0]
    2f26:	f043 0304 	orr.w	r3, r3, #4
    2f2a:	b29a      	uxth	r2, r3
    2f2c:	4b5c      	ldr	r3, [pc, #368]	; (30a0 <sdcard_init+0x264>)
    2f2e:	801a      	strh	r2, [r3, #0]
    2f30:	e008      	b.n	2f44 <sdcard_init+0x108>
//				print("card version 2\n");
			}else{
				sdc_status|=F_SDC_BAD_CARD;
    2f32:	4b5b      	ldr	r3, [pc, #364]	; (30a0 <sdcard_init+0x264>)
    2f34:	881b      	ldrh	r3, [r3, #0]
    2f36:	f443 7380 	orr.w	r3, r3, #256	; 0x100
    2f3a:	b29a      	uxth	r2, r3
    2f3c:	4b58      	ldr	r3, [pc, #352]	; (30a0 <sdcard_init+0x264>)
    2f3e:	801a      	strh	r2, [r3, #0]
				return 0;
    2f40:	2300      	movs	r3, #0
    2f42:	e0a9      	b.n	3098 <sdcard_init+0x25c>
			}
		}
		// envoie commande acmd41  APP_SEND_OP_COND
		// cette boucle peu prendre 1 seconde
//		print("sending ACMD41\n");
		t0=ticks+1000;
    2f44:	4b59      	ldr	r3, [pc, #356]	; (30ac <sdcard_init+0x270>)
    2f46:	681b      	ldr	r3, [r3, #0]
    2f48:	f503 737a 	add.w	r3, r3, #1000	; 0x3e8
    2f4c:	61bb      	str	r3, [r7, #24]
		args[1]=0;args[2]=0;args[3]=0;args[4]=CMDX_CRC;
    2f4e:	2300      	movs	r3, #0
    2f50:	747b      	strb	r3, [r7, #17]
    2f52:	2300      	movs	r3, #0
    2f54:	74bb      	strb	r3, [r7, #18]
    2f56:	2300      	movs	r3, #0
    2f58:	74fb      	strb	r3, [r7, #19]
    2f5a:	23ff      	movs	r3, #255	; 0xff
    2f5c:	753b      	strb	r3, [r7, #20]
		do {
			args[0]=0;
    2f5e:	2300      	movs	r3, #0
    2f60:	743b      	strb	r3, [r7, #16]
			sdc_cmd(APP_CMD,args);
    2f62:	f107 0310 	add.w	r3, r7, #16
    2f66:	2037      	movs	r0, #55	; 0x37
    2f68:	4619      	mov	r1, r3
    2f6a:	f7ff fea1 	bl	2cb0 <sdc_cmd>
			if (sdc_status&F_SDC_V2)args[0]=0x40;
    2f6e:	4b4c      	ldr	r3, [pc, #304]	; (30a0 <sdcard_init+0x264>)
    2f70:	881b      	ldrh	r3, [r3, #0]
    2f72:	f003 0304 	and.w	r3, r3, #4
    2f76:	2b00      	cmp	r3, #0
    2f78:	d001      	beq.n	2f7e <sdcard_init+0x142>
    2f7a:	2340      	movs	r3, #64	; 0x40
    2f7c:	743b      	strb	r3, [r7, #16]
			r1=sdc_cmd(APP_SEND_OP_COND,args);
    2f7e:	f107 0310 	add.w	r3, r7, #16
    2f82:	2029      	movs	r0, #41	; 0x29
    2f84:	4619      	mov	r1, r3
    2f86:	f7ff fe93 	bl	2cb0 <sdc_cmd>
    2f8a:	4603      	mov	r3, r0
    2f8c:	77fb      	strb	r3, [r7, #31]
			if (!r1){
    2f8e:	7ffb      	ldrb	r3, [r7, #31]
    2f90:	2b00      	cmp	r3, #0
    2f92:	d100      	bne.n	2f96 <sdcard_init+0x15a>
				break;
    2f94:	e004      	b.n	2fa0 <sdcard_init+0x164>
		    }
		}while (ticks<t0);
    2f96:	4b45      	ldr	r3, [pc, #276]	; (30ac <sdcard_init+0x270>)
    2f98:	681a      	ldr	r2, [r3, #0]
    2f9a:	69bb      	ldr	r3, [r7, #24]
    2f9c:	429a      	cmp	r2, r3
    2f9e:	d3de      	bcc.n	2f5e <sdcard_init+0x122>
		if (r1) {
    2fa0:	7ffb      	ldrb	r3, [r7, #31]
    2fa2:	2b00      	cmp	r3, #0
    2fa4:	d00a      	beq.n	2fbc <sdcard_init+0x180>
			sdc_status|=F_SDC_TO;
    2fa6:	4b3e      	ldr	r3, [pc, #248]	; (30a0 <sdcard_init+0x264>)
    2fa8:	881b      	ldrh	r3, [r3, #0]
    2faa:	f043 0310 	orr.w	r3, r3, #16
    2fae:	b29a      	uxth	r2, r3
    2fb0:	4b3b      	ldr	r3, [pc, #236]	; (30a0 <sdcard_init+0x264>)
    2fb2:	801a      	strh	r2, [r3, #0]
			sdcard_deselect();
    2fb4:	f7ff fe4e 	bl	2c54 <sdcard_deselect>
			return 0;
    2fb8:	2300      	movs	r3, #0
    2fba:	e06d      	b.n	3098 <sdcard_init+0x25c>
		}
		if (sdc_status&F_SDC_V2){
    2fbc:	4b38      	ldr	r3, [pc, #224]	; (30a0 <sdcard_init+0x264>)
    2fbe:	881b      	ldrh	r3, [r3, #0]
    2fc0:	f003 0304 	and.w	r3, r3, #4
    2fc4:	2b00      	cmp	r3, #0
    2fc6:	d024      	beq.n	3012 <sdcard_init+0x1d6>
//			print("carte V2, envoie CMD58\n");
	    // evoie commande cmd58 READ_OCR
			args[0]=0;args[1]=0;args[2]=0;args[3]=0;
    2fc8:	2300      	movs	r3, #0
    2fca:	743b      	strb	r3, [r7, #16]
    2fcc:	2300      	movs	r3, #0
    2fce:	747b      	strb	r3, [r7, #17]
    2fd0:	2300      	movs	r3, #0
    2fd2:	74bb      	strb	r3, [r7, #18]
    2fd4:	2300      	movs	r3, #0
    2fd6:	74fb      	strb	r3, [r7, #19]
			r1=sdc_cmd(READ_OCR,args);
    2fd8:	f107 0310 	add.w	r3, r7, #16
    2fdc:	203a      	movs	r0, #58	; 0x3a
    2fde:	4619      	mov	r1, r3
    2fe0:	f7ff fe66 	bl	2cb0 <sdc_cmd>
    2fe4:	4603      	mov	r3, r0
    2fe6:	77fb      	strb	r3, [r7, #31]
			if (!r1){
    2fe8:	7ffb      	ldrb	r3, [r7, #31]
    2fea:	2b00      	cmp	r3, #0
    2fec:	d111      	bne.n	3012 <sdcard_init+0x1d6>
			    spi_block_read(SDC_SPI,resp,4);
    2fee:	463b      	mov	r3, r7
    2ff0:	482d      	ldr	r0, [pc, #180]	; (30a8 <sdcard_init+0x26c>)
    2ff2:	4619      	mov	r1, r3
    2ff4:	2204      	movs	r2, #4
    2ff6:	f000 f985 	bl	3304 <spi_block_read>
			    if (resp[0]&BIT6){
    2ffa:	783b      	ldrb	r3, [r7, #0]
    2ffc:	f003 0340 	and.w	r3, r3, #64	; 0x40
    3000:	2b00      	cmp	r3, #0
    3002:	d006      	beq.n	3012 <sdcard_init+0x1d6>
					sdc_status|=F_SDC_HC; // block address
    3004:	4b26      	ldr	r3, [pc, #152]	; (30a0 <sdcard_init+0x264>)
    3006:	881b      	ldrh	r3, [r3, #0]
    3008:	f043 0308 	orr.w	r3, r3, #8
    300c:	b29a      	uxth	r2, r3
    300e:	4b24      	ldr	r3, [pc, #144]	; (30a0 <sdcard_init+0x264>)
    3010:	801a      	strh	r2, [r3, #0]
				}
			}
		}
		// envoie CMD16 SET_BLOCKLEN
		if (!(sdc_status&F_SDC_HC)){
    3012:	4b23      	ldr	r3, [pc, #140]	; (30a0 <sdcard_init+0x264>)
    3014:	881b      	ldrh	r3, [r3, #0]
    3016:	f003 0308 	and.w	r3, r3, #8
    301a:	2b00      	cmp	r3, #0
    301c:	d120      	bne.n	3060 <sdcard_init+0x224>
			print("setting block size\n");
    301e:	4824      	ldr	r0, [pc, #144]	; (30b0 <sdcard_init+0x274>)
    3020:	f7fe fb4c 	bl	16bc <print>
			args[0]=0;args[1]=0;args[2]=2;args[3]=0;
    3024:	2300      	movs	r3, #0
    3026:	743b      	strb	r3, [r7, #16]
    3028:	2300      	movs	r3, #0
    302a:	747b      	strb	r3, [r7, #17]
    302c:	2302      	movs	r3, #2
    302e:	74bb      	strb	r3, [r7, #18]
    3030:	2300      	movs	r3, #0
    3032:	74fb      	strb	r3, [r7, #19]
			if((r1=sdc_cmd(SET_BLOCKLEN,args))){
    3034:	f107 0310 	add.w	r3, r7, #16
    3038:	2010      	movs	r0, #16
    303a:	4619      	mov	r1, r3
    303c:	f7ff fe38 	bl	2cb0 <sdc_cmd>
    3040:	4603      	mov	r3, r0
    3042:	77fb      	strb	r3, [r7, #31]
    3044:	7ffb      	ldrb	r3, [r7, #31]
    3046:	2b00      	cmp	r3, #0
    3048:	d00a      	beq.n	3060 <sdcard_init+0x224>
				sdc_status|=F_SDC_IE;
    304a:	4b15      	ldr	r3, [pc, #84]	; (30a0 <sdcard_init+0x264>)
    304c:	881b      	ldrh	r3, [r3, #0]
    304e:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    3052:	b29a      	uxth	r2, r3
    3054:	4b12      	ldr	r3, [pc, #72]	; (30a0 <sdcard_init+0x264>)
    3056:	801a      	strh	r2, [r3, #0]
				sdcard_deselect();
    3058:	f7ff fdfc 	bl	2c54 <sdcard_deselect>
				return 0;
    305c:	2300      	movs	r3, #0
    305e:	e01b      	b.n	3098 <sdcard_init+0x25c>
			}
		}
		r1=sdc_set_size();
    3060:	f7ff fe9c 	bl	2d9c <sdc_set_size>
    3064:	4603      	mov	r3, r0
    3066:	77fb      	strb	r3, [r7, #31]
		sdc_status|=F_SDC_OK;
    3068:	4b0d      	ldr	r3, [pc, #52]	; (30a0 <sdcard_init+0x264>)
    306a:	881b      	ldrh	r3, [r3, #0]
    306c:	f043 0302 	orr.w	r3, r3, #2
    3070:	b29a      	uxth	r2, r3
    3072:	4b0b      	ldr	r3, [pc, #44]	; (30a0 <sdcard_init+0x264>)
    3074:	801a      	strh	r2, [r3, #0]
		_spi_disable(SDC_SPI);
    3076:	4a0c      	ldr	r2, [pc, #48]	; (30a8 <sdcard_init+0x26c>)
    3078:	4b0b      	ldr	r3, [pc, #44]	; (30a8 <sdcard_init+0x26c>)
    307a:	681b      	ldr	r3, [r3, #0]
    307c:	f023 0340 	bic.w	r3, r3, #64	; 0x40
    3080:	6013      	str	r3, [r2, #0]
		spi_baudrate(SDC_SPI,SDC_CLK_FAST);
    3082:	4809      	ldr	r0, [pc, #36]	; (30a8 <sdcard_init+0x26c>)
    3084:	2101      	movs	r1, #1
    3086:	f000 f815 	bl	30b4 <spi_baudrate>
		_spi_enable(SDC_SPI);
    308a:	4a07      	ldr	r2, [pc, #28]	; (30a8 <sdcard_init+0x26c>)
    308c:	4b06      	ldr	r3, [pc, #24]	; (30a8 <sdcard_init+0x26c>)
    308e:	681b      	ldr	r3, [r3, #0]
    3090:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    3094:	6013      	str	r3, [r2, #0]
		return 1;
    3096:	2301      	movs	r3, #1
}
    3098:	4618      	mov	r0, r3
    309a:	3720      	adds	r7, #32
    309c:	46bd      	mov	sp, r7
    309e:	bd80      	pop	{r7, pc}
    30a0:	200001d4 	.word	0x200001d4
    30a4:	2000016c 	.word	0x2000016c
    30a8:	40013000 	.word	0x40013000
    30ac:	20000170 	.word	0x20000170
    30b0:	000043a4 	.word	0x000043a4

000030b4 <spi_baudrate>:
 */

#include "../include/blue_pill.h"


void spi_baudrate(spi_sfr_t* channel, unsigned baud){
    30b4:	b480      	push	{r7}
    30b6:	b083      	sub	sp, #12
    30b8:	af00      	add	r7, sp, #0
    30ba:	6078      	str	r0, [r7, #4]
    30bc:	6039      	str	r1, [r7, #0]
	channel->CR1&=SPI_CR1_BR_MASK;
    30be:	687b      	ldr	r3, [r7, #4]
    30c0:	681b      	ldr	r3, [r3, #0]
    30c2:	f023 0238 	bic.w	r2, r3, #56	; 0x38
    30c6:	687b      	ldr	r3, [r7, #4]
    30c8:	601a      	str	r2, [r3, #0]
	channel->CR1|=baud<<SPI_CR1_BR_POS;
    30ca:	687b      	ldr	r3, [r7, #4]
    30cc:	681a      	ldr	r2, [r3, #0]
    30ce:	683b      	ldr	r3, [r7, #0]
    30d0:	00db      	lsls	r3, r3, #3
    30d2:	431a      	orrs	r2, r3
    30d4:	687b      	ldr	r3, [r7, #4]
    30d6:	601a      	str	r2, [r3, #0]
}
    30d8:	370c      	adds	r7, #12
    30da:	46bd      	mov	sp, r7
    30dc:	f85d 7b04 	ldr.w	r7, [sp], #4
    30e0:	4770      	bx	lr
    30e2:	bf00      	nop

000030e4 <spi_config_port>:

void spi_config_port(spi_sfr_t *channel, int afio_cfg){
    30e4:	b580      	push	{r7, lr}
    30e6:	b082      	sub	sp, #8
    30e8:	af00      	add	r7, sp, #0
    30ea:	6078      	str	r0, [r7, #4]
    30ec:	6039      	str	r1, [r7, #0]
	RCC->APB2ENR|=RCC_APB2ENR_AFIOEN;
    30ee:	4a33      	ldr	r2, [pc, #204]	; (31bc <spi_config_port+0xd8>)
    30f0:	4b32      	ldr	r3, [pc, #200]	; (31bc <spi_config_port+0xd8>)
    30f2:	699b      	ldr	r3, [r3, #24]
    30f4:	f043 0301 	orr.w	r3, r3, #1
    30f8:	6193      	str	r3, [r2, #24]
	if (channel==SPI1){
    30fa:	687b      	ldr	r3, [r7, #4]
    30fc:	4a30      	ldr	r2, [pc, #192]	; (31c0 <spi_config_port+0xdc>)
    30fe:	4293      	cmp	r3, r2
    3100:	d13e      	bne.n	3180 <spi_config_port+0x9c>
		if (!afio_cfg){
    3102:	683b      	ldr	r3, [r7, #0]
    3104:	2b00      	cmp	r3, #0
    3106:	d11a      	bne.n	313e <spi_config_port+0x5a>
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    3108:	4a2c      	ldr	r2, [pc, #176]	; (31bc <spi_config_port+0xd8>)
    310a:	4b2c      	ldr	r3, [pc, #176]	; (31bc <spi_config_port+0xd8>)
    310c:	699b      	ldr	r3, [r3, #24]
    310e:	f043 0304 	orr.w	r3, r3, #4
    3112:	6193      	str	r3, [r2, #24]
			// configuration port
			// PA4 -> NSS output (push-pull)
			config_pin(PORTA,4,OUTPUT_PP_FAST);
    3114:	482b      	ldr	r0, [pc, #172]	; (31c4 <spi_config_port+0xe0>)
    3116:	2104      	movs	r1, #4
    3118:	2203      	movs	r2, #3
    311a:	f7ff f909 	bl	2330 <config_pin>
			// PA5 -> SCK output (push-pull)
			config_pin(PORTA,5,OUTPUT_ALT_PP_FAST);
    311e:	4829      	ldr	r0, [pc, #164]	; (31c4 <spi_config_port+0xe0>)
    3120:	2105      	movs	r1, #5
    3122:	220b      	movs	r2, #11
    3124:	f7ff f904 	bl	2330 <config_pin>
			// PA6 -> MISO input (floating)
			config_pin(PORTA,6,INPUT_FLOAT);
    3128:	4826      	ldr	r0, [pc, #152]	; (31c4 <spi_config_port+0xe0>)
    312a:	2106      	movs	r1, #6
    312c:	2204      	movs	r2, #4
    312e:	f7ff f8ff 	bl	2330 <config_pin>
			// PA7 -> MOSI output (push-pull)
			config_pin(PORTA,7,OUTPUT_ALT_PP_FAST);
    3132:	4824      	ldr	r0, [pc, #144]	; (31c4 <spi_config_port+0xe0>)
    3134:	2107      	movs	r1, #7
    3136:	220b      	movs	r2, #11
    3138:	f7ff f8fa 	bl	2330 <config_pin>
    313c:	e03a      	b.n	31b4 <spi_config_port+0xd0>
		}else{// mappage I/O alternatif
			// activation clock du port
			RCC->APB2ENR|=RCC_APB2ENR_IOPBEN+RCC_APB2ENR_IOPAEN+RCC_APB2ENR_AFIOEN;
    313e:	4a1f      	ldr	r2, [pc, #124]	; (31bc <spi_config_port+0xd8>)
    3140:	4b1e      	ldr	r3, [pc, #120]	; (31bc <spi_config_port+0xd8>)
    3142:	699b      	ldr	r3, [r3, #24]
    3144:	f043 030d 	orr.w	r3, r3, #13
    3148:	6193      	str	r3, [r2, #24]
			AFIO->MAPR|=AFIO_MAPR_SPI1_REMAP;
    314a:	4a1f      	ldr	r2, [pc, #124]	; (31c8 <spi_config_port+0xe4>)
    314c:	4b1e      	ldr	r3, [pc, #120]	; (31c8 <spi_config_port+0xe4>)
    314e:	685b      	ldr	r3, [r3, #4]
    3150:	f043 0301 	orr.w	r3, r3, #1
    3154:	6053      	str	r3, [r2, #4]
			// configuration port
			// PA4 -> NSS output (push-pull),  alt PA15
			config_pin(PORTA,15,OUTPUT_PP_FAST);
    3156:	481b      	ldr	r0, [pc, #108]	; (31c4 <spi_config_port+0xe0>)
    3158:	210f      	movs	r1, #15
    315a:	2203      	movs	r2, #3
    315c:	f7ff f8e8 	bl	2330 <config_pin>
			// PA5 -> SCK output (push-pull),  alt PB3
			config_pin(PORTB,3,OUTPUT_ALT_PP_FAST);
    3160:	481a      	ldr	r0, [pc, #104]	; (31cc <spi_config_port+0xe8>)
    3162:	2103      	movs	r1, #3
    3164:	220b      	movs	r2, #11
    3166:	f7ff f8e3 	bl	2330 <config_pin>
			// PA6 -> MISO input (floating),   alt PB4
			config_pin(PORTB,4,INPUT_FLOAT);
    316a:	4818      	ldr	r0, [pc, #96]	; (31cc <spi_config_port+0xe8>)
    316c:	2104      	movs	r1, #4
    316e:	2204      	movs	r2, #4
    3170:	f7ff f8de 	bl	2330 <config_pin>
			// PA7 -> MOSI output (push-pull), alt PB5
			config_pin(PORTB,5,OUTPUT_ALT_PP_FAST);
    3174:	4815      	ldr	r0, [pc, #84]	; (31cc <spi_config_port+0xe8>)
    3176:	2105      	movs	r1, #5
    3178:	220b      	movs	r2, #11
    317a:	f7ff f8d9 	bl	2330 <config_pin>
    317e:	e019      	b.n	31b4 <spi_config_port+0xd0>
		}
	}else{
		// activation clock du port
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    3180:	4a0e      	ldr	r2, [pc, #56]	; (31bc <spi_config_port+0xd8>)
    3182:	4b0e      	ldr	r3, [pc, #56]	; (31bc <spi_config_port+0xd8>)
    3184:	699b      	ldr	r3, [r3, #24]
    3186:	f043 0308 	orr.w	r3, r3, #8
    318a:	6193      	str	r3, [r2, #24]
		// configuration port
		// PB12 NSS output (push-pull)
		config_pin(PORTB,2,OUTPUT_PP_FAST);
    318c:	480f      	ldr	r0, [pc, #60]	; (31cc <spi_config_port+0xe8>)
    318e:	2102      	movs	r1, #2
    3190:	2203      	movs	r2, #3
    3192:	f7ff f8cd 	bl	2330 <config_pin>
		// PB13 SCK output (push-pull)
		config_pin(PORTB,13,OUTPUT_ALT_PP_FAST);
    3196:	480d      	ldr	r0, [pc, #52]	; (31cc <spi_config_port+0xe8>)
    3198:	210d      	movs	r1, #13
    319a:	220b      	movs	r2, #11
    319c:	f7ff f8c8 	bl	2330 <config_pin>
		// PB14 MISO input (floating)
		config_pin(PORTB,14,INPUT_FLOAT);
    31a0:	480a      	ldr	r0, [pc, #40]	; (31cc <spi_config_port+0xe8>)
    31a2:	210e      	movs	r1, #14
    31a4:	2204      	movs	r2, #4
    31a6:	f7ff f8c3 	bl	2330 <config_pin>
		// PB15 MOSI output (push-pull)
		config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    31aa:	4808      	ldr	r0, [pc, #32]	; (31cc <spi_config_port+0xe8>)
    31ac:	210f      	movs	r1, #15
    31ae:	220b      	movs	r2, #11
    31b0:	f7ff f8be 	bl	2330 <config_pin>
	}
}
    31b4:	3708      	adds	r7, #8
    31b6:	46bd      	mov	sp, r7
    31b8:	bd80      	pop	{r7, pc}
    31ba:	bf00      	nop
    31bc:	40021000 	.word	0x40021000
    31c0:	40013000 	.word	0x40013000
    31c4:	40010800 	.word	0x40010800
    31c8:	40010000 	.word	0x40010000
    31cc:	40010c00 	.word	0x40010c00

000031d0 <spi_init>:

void spi_init(spi_sfr_t* channel, unsigned baud,unsigned mode, int afio_cfg){
    31d0:	b580      	push	{r7, lr}
    31d2:	b084      	sub	sp, #16
    31d4:	af00      	add	r7, sp, #0
    31d6:	60f8      	str	r0, [r7, #12]
    31d8:	60b9      	str	r1, [r7, #8]
    31da:	607a      	str	r2, [r7, #4]
    31dc:	603b      	str	r3, [r7, #0]
	spi_config_port(channel,afio_cfg);
    31de:	68f8      	ldr	r0, [r7, #12]
    31e0:	6839      	ldr	r1, [r7, #0]
    31e2:	f7ff ff7f 	bl	30e4 <spi_config_port>
	// activation clock SPI
	if (channel==SPI1){
    31e6:	68fb      	ldr	r3, [r7, #12]
    31e8:	4a0f      	ldr	r2, [pc, #60]	; (3228 <spi_init+0x58>)
    31ea:	4293      	cmp	r3, r2
    31ec:	d106      	bne.n	31fc <spi_init+0x2c>
		RCC->APB2ENR|=RCC_APB2ENR_SPI1EN;
    31ee:	4a0f      	ldr	r2, [pc, #60]	; (322c <spi_init+0x5c>)
    31f0:	4b0e      	ldr	r3, [pc, #56]	; (322c <spi_init+0x5c>)
    31f2:	699b      	ldr	r3, [r3, #24]
    31f4:	f443 5380 	orr.w	r3, r3, #4096	; 0x1000
    31f8:	6193      	str	r3, [r2, #24]
    31fa:	e005      	b.n	3208 <spi_init+0x38>
	}else{
		RCC->APB1ENR|=RCC_APB1ENR_SPI2EN;
    31fc:	4a0b      	ldr	r2, [pc, #44]	; (322c <spi_init+0x5c>)
    31fe:	4b0b      	ldr	r3, [pc, #44]	; (322c <spi_init+0x5c>)
    3200:	69db      	ldr	r3, [r3, #28]
    3202:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    3206:	61d3      	str	r3, [r2, #28]
	}
	channel->CR1=mode;
    3208:	68fb      	ldr	r3, [r7, #12]
    320a:	687a      	ldr	r2, [r7, #4]
    320c:	601a      	str	r2, [r3, #0]
	spi_baudrate(channel,baud);
    320e:	68f8      	ldr	r0, [r7, #12]
    3210:	68b9      	ldr	r1, [r7, #8]
    3212:	f7ff ff4f 	bl	30b4 <spi_baudrate>
	_spi_enable(channel);
    3216:	68fb      	ldr	r3, [r7, #12]
    3218:	681b      	ldr	r3, [r3, #0]
    321a:	f043 0240 	orr.w	r2, r3, #64	; 0x40
    321e:	68fb      	ldr	r3, [r7, #12]
    3220:	601a      	str	r2, [r3, #0]
}
    3222:	3710      	adds	r7, #16
    3224:	46bd      	mov	sp, r7
    3226:	bd80      	pop	{r7, pc}
    3228:	40013000 	.word	0x40013000
    322c:	40021000 	.word	0x40021000

00003230 <spi_write>:


// envoie un octet via le canla SPI
inline void spi_write(spi_sfr_t* channel, uint8_t b){
    3230:	b480      	push	{r7}
    3232:	b085      	sub	sp, #20
    3234:	af00      	add	r7, sp, #0
    3236:	6078      	str	r0, [r7, #4]
    3238:	460b      	mov	r3, r1
    323a:	70fb      	strb	r3, [r7, #3]
	uint8_t rx;
	while (!(channel->SR&SPI_SR_TXE));
    323c:	bf00      	nop
    323e:	687b      	ldr	r3, [r7, #4]
    3240:	689b      	ldr	r3, [r3, #8]
    3242:	f003 0302 	and.w	r3, r3, #2
    3246:	2b00      	cmp	r3, #0
    3248:	d0f9      	beq.n	323e <spi_write+0xe>
	channel->DR=b;
    324a:	78fa      	ldrb	r2, [r7, #3]
    324c:	687b      	ldr	r3, [r7, #4]
    324e:	60da      	str	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    3250:	bf00      	nop
    3252:	687b      	ldr	r3, [r7, #4]
    3254:	689b      	ldr	r3, [r3, #8]
    3256:	f003 0301 	and.w	r3, r3, #1
    325a:	2b00      	cmp	r3, #0
    325c:	d0f9      	beq.n	3252 <spi_write+0x22>
	rx=(uint8_t)channel->DR;
    325e:	687b      	ldr	r3, [r7, #4]
    3260:	68db      	ldr	r3, [r3, #12]
    3262:	73fb      	strb	r3, [r7, #15]
}
    3264:	3714      	adds	r7, #20
    3266:	46bd      	mov	sp, r7
    3268:	f85d 7b04 	ldr.w	r7, [sp], #4
    326c:	4770      	bx	lr
    326e:	bf00      	nop

00003270 <spi_read>:

// reçois un octet du canal SPI
uint8_t spi_read(spi_sfr_t* channel){
    3270:	b480      	push	{r7}
    3272:	b085      	sub	sp, #20
    3274:	af00      	add	r7, sp, #0
    3276:	6078      	str	r0, [r7, #4]
	uint8_t rx;
	while (!(channel->SR&SPI_SR_TXE));
    3278:	bf00      	nop
    327a:	687b      	ldr	r3, [r7, #4]
    327c:	689b      	ldr	r3, [r3, #8]
    327e:	f003 0302 	and.w	r3, r3, #2
    3282:	2b00      	cmp	r3, #0
    3284:	d0f9      	beq.n	327a <spi_read+0xa>
	channel->DR=255;
    3286:	687b      	ldr	r3, [r7, #4]
    3288:	22ff      	movs	r2, #255	; 0xff
    328a:	60da      	str	r2, [r3, #12]
	while (!(channel->SR&SPI_SR_RXNE));
    328c:	bf00      	nop
    328e:	687b      	ldr	r3, [r7, #4]
    3290:	689b      	ldr	r3, [r3, #8]
    3292:	f003 0301 	and.w	r3, r3, #1
    3296:	2b00      	cmp	r3, #0
    3298:	d0f9      	beq.n	328e <spi_read+0x1e>
	rx=(uint8_t)channel->DR;
    329a:	687b      	ldr	r3, [r7, #4]
    329c:	68db      	ldr	r3, [r3, #12]
    329e:	73fb      	strb	r3, [r7, #15]
	return rx;
    32a0:	7bfb      	ldrb	r3, [r7, #15]
}
    32a2:	4618      	mov	r0, r3
    32a4:	3714      	adds	r7, #20
    32a6:	46bd      	mov	sp, r7
    32a8:	f85d 7b04 	ldr.w	r7, [sp], #4
    32ac:	4770      	bx	lr
    32ae:	bf00      	nop

000032b0 <spi_block_write>:

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
    32b0:	b480      	push	{r7}
    32b2:	b087      	sub	sp, #28
    32b4:	af00      	add	r7, sp, #0
    32b6:	60f8      	str	r0, [r7, #12]
    32b8:	60b9      	str	r1, [r7, #8]
    32ba:	607a      	str	r2, [r7, #4]
	uint8_t rx;
	while (count){
    32bc:	e010      	b.n	32e0 <spi_block_write+0x30>
		channel->DR=*buffer++;
    32be:	68bb      	ldr	r3, [r7, #8]
    32c0:	1c5a      	adds	r2, r3, #1
    32c2:	60ba      	str	r2, [r7, #8]
    32c4:	781b      	ldrb	r3, [r3, #0]
    32c6:	461a      	mov	r2, r3
    32c8:	68fb      	ldr	r3, [r7, #12]
    32ca:	60da      	str	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_TXE));
    32cc:	bf00      	nop
    32ce:	68fb      	ldr	r3, [r7, #12]
    32d0:	689b      	ldr	r3, [r3, #8]
    32d2:	f003 0302 	and.w	r3, r3, #2
    32d6:	2b00      	cmp	r3, #0
    32d8:	d0f9      	beq.n	32ce <spi_block_write+0x1e>
		count--;
    32da:	687b      	ldr	r3, [r7, #4]
    32dc:	3b01      	subs	r3, #1
    32de:	607b      	str	r3, [r7, #4]
}

// écriture d'un bloc d'octet
void spi_block_write(spi_sfr_t* channel, const char *buffer, int count){
	uint8_t rx;
	while (count){
    32e0:	687b      	ldr	r3, [r7, #4]
    32e2:	2b00      	cmp	r3, #0
    32e4:	d1eb      	bne.n	32be <spi_block_write+0xe>
		channel->DR=*buffer++;
		while (!(channel->SR&SPI_SR_TXE));
		count--;
	}
	while (channel->SR&SPI_SR_BSY);
    32e6:	bf00      	nop
    32e8:	68fb      	ldr	r3, [r7, #12]
    32ea:	689b      	ldr	r3, [r3, #8]
    32ec:	f003 0380 	and.w	r3, r3, #128	; 0x80
    32f0:	2b00      	cmp	r3, #0
    32f2:	d1f9      	bne.n	32e8 <spi_block_write+0x38>
	rx=(uint8_t)channel->DR;
    32f4:	68fb      	ldr	r3, [r7, #12]
    32f6:	68db      	ldr	r3, [r3, #12]
    32f8:	75fb      	strb	r3, [r7, #23]
}
    32fa:	371c      	adds	r7, #28
    32fc:	46bd      	mov	sp, r7
    32fe:	f85d 7b04 	ldr.w	r7, [sp], #4
    3302:	4770      	bx	lr

00003304 <spi_block_read>:

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
    3304:	b480      	push	{r7}
    3306:	b085      	sub	sp, #20
    3308:	af00      	add	r7, sp, #0
    330a:	60f8      	str	r0, [r7, #12]
    330c:	60b9      	str	r1, [r7, #8]
    330e:	607a      	str	r2, [r7, #4]
	while (count){
    3310:	e013      	b.n	333a <spi_block_read+0x36>
		channel->DR=0;
    3312:	68fb      	ldr	r3, [r7, #12]
    3314:	2200      	movs	r2, #0
    3316:	60da      	str	r2, [r3, #12]
		while (!(channel->SR&SPI_SR_RXNE));
    3318:	bf00      	nop
    331a:	68fb      	ldr	r3, [r7, #12]
    331c:	689b      	ldr	r3, [r3, #8]
    331e:	f003 0301 	and.w	r3, r3, #1
    3322:	2b00      	cmp	r3, #0
    3324:	d0f9      	beq.n	331a <spi_block_read+0x16>
		*buffer++=(uint8_t)channel->DR;
    3326:	68bb      	ldr	r3, [r7, #8]
    3328:	1c5a      	adds	r2, r3, #1
    332a:	60ba      	str	r2, [r7, #8]
    332c:	68fa      	ldr	r2, [r7, #12]
    332e:	68d2      	ldr	r2, [r2, #12]
    3330:	b2d2      	uxtb	r2, r2
    3332:	701a      	strb	r2, [r3, #0]
		count--;
    3334:	687b      	ldr	r3, [r7, #4]
    3336:	3b01      	subs	r3, #1
    3338:	607b      	str	r3, [r7, #4]
	rx=(uint8_t)channel->DR;
}

// lecture d'un bloc d'octet
void spi_block_read(spi_sfr_t* channel, char *buffer, int count){
	while (count){
    333a:	687b      	ldr	r3, [r7, #4]
    333c:	2b00      	cmp	r3, #0
    333e:	d1e8      	bne.n	3312 <spi_block_read+0xe>
		channel->DR=0;
		while (!(channel->SR&SPI_SR_RXNE));
		*buffer++=(uint8_t)channel->DR;
		count--;
	}
}
    3340:	3714      	adds	r7, #20
    3342:	46bd      	mov	sp, r7
    3344:	f85d 7b04 	ldr.w	r7, [sp], #4
    3348:	4770      	bx	lr
    334a:	bf00      	nop

0000334c <reset_mcu>:
void startup();
void main();

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
    334c:	4b01      	ldr	r3, [pc, #4]	; (3354 <reset_mcu+0x8>)
    334e:	4a02      	ldr	r2, [pc, #8]	; (3358 <reset_mcu+0xc>)
    3350:	601a      	str	r2, [r3, #0]
    3352:	bf00      	nop
    3354:	e000ed0c 	.word	0xe000ed0c
    3358:	05fa0004 	.word	0x05fa0004

0000335c <print_fault>:
_default_handler(USAGE_FAULT_handler)
_default_handler(SVC_handler) // 11
_default_handler(PENDSV_handler) // 14
_default_handler(STK_handler) // 15

void print_fault(const char *msg, uint32_t adr){
    335c:	b580      	push	{r7, lr}
    335e:	b082      	sub	sp, #8
    3360:	af00      	add	r7, sp, #0
    3362:	6078      	str	r0, [r7, #4]
    3364:	6039      	str	r1, [r7, #0]
	print(msg);
    3366:	6878      	ldr	r0, [r7, #4]
    3368:	f7fe f9a8 	bl	16bc <print>
	print("at address ");
    336c:	4814      	ldr	r0, [pc, #80]	; (33c0 <print_fault+0x64>)
    336e:	f7fe f9a5 	bl	16bc <print>
	if (adr) {
    3372:	683b      	ldr	r3, [r7, #0]
    3374:	2b00      	cmp	r3, #0
    3376:	d002      	beq.n	337e <print_fault+0x22>
		print_hex(adr);
    3378:	6838      	ldr	r0, [r7, #0]
    337a:	f7fe fb2b 	bl	19d4 <print_hex>
	};
	conout(CR);
    337e:	200d      	movs	r0, #13
    3380:	f7fe f93e 	bl	1600 <conout>
	print("UFSR=");
    3384:	480f      	ldr	r0, [pc, #60]	; (33c4 <print_fault+0x68>)
    3386:	f7fe f999 	bl	16bc <print>
	print_hex(CFSR->fsr.usageFalt);
    338a:	4b0f      	ldr	r3, [pc, #60]	; (33c8 <print_fault+0x6c>)
    338c:	681b      	ldr	r3, [r3, #0]
    338e:	0c1b      	lsrs	r3, r3, #16
    3390:	b29b      	uxth	r3, r3
    3392:	4618      	mov	r0, r3
    3394:	f7fe fb1e 	bl	19d4 <print_hex>
	print(", BFSR=");
    3398:	480c      	ldr	r0, [pc, #48]	; (33cc <print_fault+0x70>)
    339a:	f7fe f98f 	bl	16bc <print>
	print_hex(CFSR->fsr.busFault);
    339e:	4b0a      	ldr	r3, [pc, #40]	; (33c8 <print_fault+0x6c>)
    33a0:	681b      	ldr	r3, [r3, #0]
    33a2:	0a1b      	lsrs	r3, r3, #8
    33a4:	b2db      	uxtb	r3, r3
    33a6:	4618      	mov	r0, r3
    33a8:	f7fe fb14 	bl	19d4 <print_hex>
	print(", MMFSR=");
    33ac:	4808      	ldr	r0, [pc, #32]	; (33d0 <print_fault+0x74>)
    33ae:	f7fe f985 	bl	16bc <print>
	print_hex(CFSR->fsr.mmFault);
    33b2:	4b05      	ldr	r3, [pc, #20]	; (33c8 <print_fault+0x6c>)
    33b4:	681b      	ldr	r3, [r3, #0]
    33b6:	b2db      	uxtb	r3, r3
    33b8:	4618      	mov	r0, r3
    33ba:	f7fe fb0b 	bl	19d4 <print_hex>
	while(1);
    33be:	e7fe      	b.n	33be <print_fault+0x62>
    33c0:	000043b8 	.word	0x000043b8
    33c4:	000043c4 	.word	0x000043c4
    33c8:	e000ed28 	.word	0xe000ed28
    33cc:	000043cc 	.word	0x000043cc
    33d0:	000043d4 	.word	0x000043d4

000033d4 <config_systicks>:


// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
#define MSEC_DLY FCLK/8/1000
void config_systicks(){
    33d4:	b580      	push	{r7, lr}
    33d6:	af00      	add	r7, sp, #0
	set_int_priority(IRQ_STK,9);
    33d8:	f06f 000e 	mvn.w	r0, #14
    33dc:	2109      	movs	r1, #9
    33de:	f7ff fbbb 	bl	2b58 <set_int_priority>
	*SYST_RVR=MSEC_DLY-1;
    33e2:	4b04      	ldr	r3, [pc, #16]	; (33f4 <config_systicks+0x20>)
    33e4:	f641 723f 	movw	r2, #7999	; 0x1f3f
    33e8:	601a      	str	r2, [r3, #0]
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
    33ea:	4b03      	ldr	r3, [pc, #12]	; (33f8 <config_systicks+0x24>)
    33ec:	2203      	movs	r2, #3
    33ee:	601a      	str	r2, [r3, #0]
}
    33f0:	bd80      	pop	{r7, pc}
    33f2:	bf00      	nop
    33f4:	e000e014 	.word	0xe000e014
    33f8:	e000e010 	.word	0xe000e010

000033fc <pause>:



void pause(unsigned msec){
    33fc:	b480      	push	{r7}
    33fe:	b083      	sub	sp, #12
    3400:	af00      	add	r7, sp, #0
    3402:	6078      	str	r0, [r7, #4]
	timer=msec;
    3404:	4a06      	ldr	r2, [pc, #24]	; (3420 <pause+0x24>)
    3406:	687b      	ldr	r3, [r7, #4]
    3408:	6013      	str	r3, [r2, #0]
	while (timer);
    340a:	bf00      	nop
    340c:	4b04      	ldr	r3, [pc, #16]	; (3420 <pause+0x24>)
    340e:	681b      	ldr	r3, [r3, #0]
    3410:	2b00      	cmp	r3, #0
    3412:	d1fb      	bne.n	340c <pause+0x10>
}
    3414:	370c      	adds	r7, #12
    3416:	46bd      	mov	sp, r7
    3418:	f85d 7b04 	ldr.w	r7, [sp], #4
    341c:	4770      	bx	lr
    341e:	bf00      	nop
    3420:	20000174 	.word	0x20000174

00003424 <STK_handler>:


// interruption coretimer
void STK_handler(){
    3424:	b480      	push	{r7}
    3426:	af00      	add	r7, sp, #0
	ticks++;
    3428:	4b08      	ldr	r3, [pc, #32]	; (344c <STK_handler+0x28>)
    342a:	681b      	ldr	r3, [r3, #0]
    342c:	3301      	adds	r3, #1
    342e:	4a07      	ldr	r2, [pc, #28]	; (344c <STK_handler+0x28>)
    3430:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
    3432:	4b07      	ldr	r3, [pc, #28]	; (3450 <STK_handler+0x2c>)
    3434:	681b      	ldr	r3, [r3, #0]
    3436:	2b00      	cmp	r3, #0
    3438:	d004      	beq.n	3444 <STK_handler+0x20>
    343a:	4b05      	ldr	r3, [pc, #20]	; (3450 <STK_handler+0x2c>)
    343c:	681b      	ldr	r3, [r3, #0]
    343e:	3b01      	subs	r3, #1
    3440:	4a03      	ldr	r2, [pc, #12]	; (3450 <STK_handler+0x2c>)
    3442:	6013      	str	r3, [r2, #0]
}
    3444:	46bd      	mov	sp, r7
    3446:	f85d 7b04 	ldr.w	r7, [sp], #4
    344a:	4770      	bx	lr
    344c:	20000170 	.word	0x20000170
    3450:	20000174 	.word	0x20000174

00003454 <led_off>:

#include "svcall.h"


// éteint la LED
static void led_off(){
    3454:	b480      	push	{r7}
    3456:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,0,0);
    3458:	2300      	movs	r3, #0
    345a:	2200      	movs	r2, #0
    345c:	4618      	mov	r0, r3
    345e:	4611      	mov	r1, r2
    3460:	df02      	svc	2
}
    3462:	46bd      	mov	sp, r7
    3464:	f85d 7b04 	ldr.w	r7, [sp], #4
    3468:	4770      	bx	lr
    346a:	bf00      	nop

0000346c <tvout_init>:
#define _enable_spi_dma() SPI2->CR2|=SPI_CR2_TXDMAEN
#define _disable_spi_dma() SPI2->CR2&=~SPI_CR2_TXDMAEN 
#define _disable_pixel_int() TIMER1_DIER->fld.cc2ie=0
#define _enable_pixel_int() ({TIMER1_SR->fld.cc2if=0;TIMER1_DIER->fld.cc2ie=1;})

void tvout_init(){
    346c:	b580      	push	{r7, lr}
    346e:	b082      	sub	sp, #8
    3470:	af02      	add	r7, sp, #8
	//sortie sync sur PA8
	config_pin(PORTA,8,(GPIO_OUTP_ALT_PP<<2)|GPIO_MODE_OUTP_2M);
    3472:	4843      	ldr	r0, [pc, #268]	; (3580 <tvout_init+0x114>)
    3474:	2108      	movs	r1, #8
    3476:	220a      	movs	r2, #10
    3478:	f7fe ff5a 	bl	2330 <config_pin>
	//sortie video sur PB15, utilisation SPI2
	config_pin(PORTB,15,OUTPUT_ALT_PP_FAST);
    347c:	4841      	ldr	r0, [pc, #260]	; (3584 <tvout_init+0x118>)
    347e:	210f      	movs	r1, #15
    3480:	220b      	movs	r2, #11
    3482:	f7fe ff55 	bl	2330 <config_pin>
	PORTB->BRR=BIT15;
    3486:	4b3f      	ldr	r3, [pc, #252]	; (3584 <tvout_init+0x118>)
    3488:	f44f 4200 	mov.w	r2, #32768	; 0x8000
    348c:	615a      	str	r2, [r3, #20]
	//timer 1 utilisé pour sync
	RCC->APB2ENR|=RCC_APB2ENR_TIM1EN;
    348e:	4a3e      	ldr	r2, [pc, #248]	; (3588 <tvout_init+0x11c>)
    3490:	4b3d      	ldr	r3, [pc, #244]	; (3588 <tvout_init+0x11c>)
    3492:	699b      	ldr	r3, [r3, #24]
    3494:	f443 6300 	orr.w	r3, r3, #2048	; 0x800
    3498:	6193      	str	r3, [r2, #24]
	// clock source division
	*TIMER1_PSC=0;
    349a:	4b3c      	ldr	r3, [pc, #240]	; (358c <tvout_init+0x120>)
    349c:	2200      	movs	r2, #0
    349e:	801a      	strh	r2, [r3, #0]
	// période PWM
	*TIMER1_ARR=FCLK/HFREQ-1;
    34a0:	4b3b      	ldr	r3, [pc, #236]	; (3590 <tvout_init+0x124>)
    34a2:	f640 72ff 	movw	r2, #4095	; 0xfff
    34a6:	801a      	strh	r2, [r3, #0]
	// rapport cyclique
	*TIMER1_CCR1=FCLK*HSYNC-1;
    34a8:	4b3a      	ldr	r3, [pc, #232]	; (3594 <tvout_init+0x128>)
    34aa:	f240 122b 	movw	r2, #299	; 0x12b
    34ae:	801a      	strh	r2, [r3, #0]
	//pwm1 utilisé comme générateur sync
	TIMER1_CCMR1_OCM->fld.oc1m=6;  // pwm mode
    34b0:	4b39      	ldr	r3, [pc, #228]	; (3598 <tvout_init+0x12c>)
    34b2:	681a      	ldr	r2, [r3, #0]
    34b4:	f022 0270 	bic.w	r2, r2, #112	; 0x70
    34b8:	f042 0260 	orr.w	r2, r2, #96	; 0x60
    34bc:	601a      	str	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc1pe=1; // preload ccr1 enable
    34be:	4b36      	ldr	r3, [pc, #216]	; (3598 <tvout_init+0x12c>)
    34c0:	681a      	ldr	r2, [r3, #0]
    34c2:	f042 0208 	orr.w	r2, r2, #8
    34c6:	601a      	str	r2, [r3, #0]
	//activation sortie OC1
	TIMER1_CCER->fld.cc1e=1; // OC1 output enable
    34c8:	4b34      	ldr	r3, [pc, #208]	; (359c <tvout_init+0x130>)
    34ca:	681a      	ldr	r2, [r3, #0]
    34cc:	f042 0201 	orr.w	r2, r2, #1
    34d0:	601a      	str	r2, [r3, #0]
	TIMER1_CCER->fld.cc1p=1; // output polarity
    34d2:	4b32      	ldr	r3, [pc, #200]	; (359c <tvout_init+0x130>)
    34d4:	681a      	ldr	r2, [r3, #0]
    34d6:	f042 0202 	orr.w	r2, r2, #2
    34da:	601a      	str	r2, [r3, #0]
	TIMER1_BDTR->fld.moe=1;  // main output enable
    34dc:	4a30      	ldr	r2, [pc, #192]	; (35a0 <tvout_init+0x134>)
    34de:	8813      	ldrh	r3, [r2, #0]
    34e0:	ea6f 4343 	mvn.w	r3, r3, lsl #17
    34e4:	ea6f 4353 	mvn.w	r3, r3, lsr #17
    34e8:	8013      	strh	r3, [r2, #0]
	// canal 2 utilisé pour démarrer sortie pixels
	*TIMER1_CCR2=VIDEO_DELAY;
    34ea:	4b2e      	ldr	r3, [pc, #184]	; (35a4 <tvout_init+0x138>)
    34ec:	f240 4219 	movw	r2, #1049	; 0x419
    34f0:	801a      	strh	r2, [r3, #0]
	TIMER1_CCMR1_OCM->fld.oc2m=6;
    34f2:	4b29      	ldr	r3, [pc, #164]	; (3598 <tvout_init+0x12c>)
    34f4:	681a      	ldr	r2, [r3, #0]
    34f6:	f422 42e0 	bic.w	r2, r2, #28672	; 0x7000
    34fa:	f442 42c0 	orr.w	r2, r2, #24576	; 0x6000
    34fe:	601a      	str	r2, [r3, #0]
	//TIMER1_CCMR1_OCM->fld.oc2pe=1;
	// activation timer1
	TIMER1_CR1->fld.cen=1;
    3500:	4b29      	ldr	r3, [pc, #164]	; (35a8 <tvout_init+0x13c>)
    3502:	681a      	ldr	r2, [r3, #0]
    3504:	f042 0201 	orr.w	r2, r2, #1
    3508:	601a      	str	r2, [r3, #0]
	//SPI2-MOSI utilisé pour sérialisaton pixels.
	SPI2->CR1=(FSPI_DIV4<<SPI_CR1_BR_POS)|SPI_CR1_MSTR|SPI_CR1_SSM|SPI_CR1_SSI|SPI_CR1_SPE|SPI_CR1_DDF;
    350a:	4b28      	ldr	r3, [pc, #160]	; (35ac <tvout_init+0x140>)
    350c:	f640 324c 	movw	r2, #2892	; 0xb4c
    3510:	601a      	str	r2, [r3, #0]
	SPI2->DR=0;
    3512:	4b26      	ldr	r3, [pc, #152]	; (35ac <tvout_init+0x140>)
    3514:	2200      	movs	r2, #0
    3516:	60da      	str	r2, [r3, #12]
	// configuration du canal dma
	DMA1[DMACH5].ccr=DMA_CCR_DIR|DMA_CCR_MINC|(3<<DMA_CCR_PL_POS)|DMA_CCR_TCIE|(1<<DMA_CCR_PSIZE_POS)|(1<<DMA_CCR_MSIZE_POS);
    3518:	4b25      	ldr	r3, [pc, #148]	; (35b0 <tvout_init+0x144>)
    351a:	f243 5292 	movw	r2, #13714	; 0x3592
    351e:	601a      	str	r2, [r3, #0]
	DMA1[DMACH5].cpar=(uint32_t)SPI2_DR;
    3520:	4b23      	ldr	r3, [pc, #140]	; (35b0 <tvout_init+0x144>)
    3522:	4a24      	ldr	r2, [pc, #144]	; (35b4 <tvout_init+0x148>)
    3524:	609a      	str	r2, [r3, #8]
	_enable_spi_dma();
    3526:	4a21      	ldr	r2, [pc, #132]	; (35ac <tvout_init+0x140>)
    3528:	4b20      	ldr	r3, [pc, #128]	; (35ac <tvout_init+0x140>)
    352a:	685b      	ldr	r3, [r3, #4]
    352c:	f043 0302 	orr.w	r3, r3, #2
    3530:	6053      	str	r3, [r2, #4]
	set_int_priority(IRQ_DMA1CH5,1);
    3532:	200f      	movs	r0, #15
    3534:	2101      	movs	r1, #1
    3536:	f7ff fb0f 	bl	2b58 <set_int_priority>
	enable_interrupt(IRQ_DMA1CH5);
    353a:	200f      	movs	r0, #15
    353c:	f7ff fa50 	bl	29e0 <enable_interrupt>
	// activation de l'interruption
	TIMER1_DIER->fld.cc1ie=1;
    3540:	4b1d      	ldr	r3, [pc, #116]	; (35b8 <tvout_init+0x14c>)
    3542:	681a      	ldr	r2, [r3, #0]
    3544:	f042 0202 	orr.w	r2, r2, #2
    3548:	601a      	str	r2, [r3, #0]
	set_int_priority(IRQ_TV_SYNC,1);
    354a:	201b      	movs	r0, #27
    354c:	2101      	movs	r1, #1
    354e:	f7ff fb03 	bl	2b58 <set_int_priority>
	enable_interrupt(IRQ_TV_SYNC);
    3552:	201b      	movs	r0, #27
    3554:	f7ff fa44 	bl	29e0 <enable_interrupt>
	//video test
	gdi_rect(0,0,HRES,VRES,WHITE_BIT);
    3558:	2301      	movs	r3, #1
    355a:	9300      	str	r3, [sp, #0]
    355c:	2000      	movs	r0, #0
    355e:	2100      	movs	r1, #0
    3560:	f44f 72a0 	mov.w	r2, #320	; 0x140
    3564:	23f0      	movs	r3, #240	; 0xf0
    3566:	f7fe fd71 	bl	204c <gdi_rect>
	gdi_box(80,60,160,120,WHITE_BIT);
    356a:	2301      	movs	r3, #1
    356c:	9300      	str	r3, [sp, #0]
    356e:	2050      	movs	r0, #80	; 0x50
    3570:	213c      	movs	r1, #60	; 0x3c
    3572:	22a0      	movs	r2, #160	; 0xa0
    3574:	2378      	movs	r3, #120	; 0x78
    3576:	f7fe fc45 	bl	1e04 <gdi_box>
	// test end */
 }
    357a:	46bd      	mov	sp, r7
    357c:	bd80      	pop	{r7, pc}
    357e:	bf00      	nop
    3580:	40010800 	.word	0x40010800
    3584:	40010c00 	.word	0x40010c00
    3588:	40021000 	.word	0x40021000
    358c:	40012c28 	.word	0x40012c28
    3590:	40012c2c 	.word	0x40012c2c
    3594:	40012c34 	.word	0x40012c34
    3598:	40012c18 	.word	0x40012c18
    359c:	40012c20 	.word	0x40012c20
    35a0:	40012c44 	.word	0x40012c44
    35a4:	40012c38 	.word	0x40012c38
    35a8:	40012c00 	.word	0x40012c00
    35ac:	40003800 	.word	0x40003800
    35b0:	40020058 	.word	0x40020058
    35b4:	4000380c 	.word	0x4000380c
    35b8:	40012c0c 	.word	0x40012c0c

000035bc <TIM1_CC_handler>:
volatile static int video=0; // activation sortie pixels
volatile static int even=0; // odd/even field
volatile static int line_count=-1; // horizontal line counter 
 __attribute__((optimize("-O1")))  void TV_SYNC_handler(){

	_disable_dma();
    35bc:	4a58      	ldr	r2, [pc, #352]	; (3720 <TIM1_CC_handler+0x164>)
    35be:	6813      	ldr	r3, [r2, #0]
    35c0:	f023 0301 	bic.w	r3, r3, #1
    35c4:	6013      	str	r3, [r2, #0]
	if (video && TIMER1_SR->fld.cc2if){ 
    35c6:	4b57      	ldr	r3, [pc, #348]	; (3724 <TIM1_CC_handler+0x168>)
    35c8:	681b      	ldr	r3, [r3, #0]
    35ca:	b1e3      	cbz	r3, 3606 <TIM1_CC_handler+0x4a>
    35cc:	4b56      	ldr	r3, [pc, #344]	; (3728 <TIM1_CC_handler+0x16c>)
    35ce:	681b      	ldr	r3, [r3, #0]
    35d0:	f013 0f04 	tst.w	r3, #4
    35d4:	d017      	beq.n	3606 <TIM1_CC_handler+0x4a>
		TIMER1_SR->fld.cc2if=0;
    35d6:	f5a2 4254 	sub.w	r2, r2, #54272	; 0xd400
    35da:	3a48      	subs	r2, #72	; 0x48
    35dc:	6813      	ldr	r3, [r2, #0]
    35de:	f023 0304 	bic.w	r3, r3, #4
    35e2:	6013      	str	r3, [r2, #0]
		DMA1[DMACH5].cmar=(uint32_t)(video_buffer+(line_count-TOP_LINE)*ROW_SIZE);
    35e4:	4b51      	ldr	r3, [pc, #324]	; (372c <TIM1_CC_handler+0x170>)
    35e6:	681b      	ldr	r3, [r3, #0]
    35e8:	3b3c      	subs	r3, #60	; 0x3c
    35ea:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    35ee:	4a50      	ldr	r2, [pc, #320]	; (3730 <TIM1_CC_handler+0x174>)
    35f0:	eb02 03c3 	add.w	r3, r2, r3, lsl #3
    35f4:	4a4a      	ldr	r2, [pc, #296]	; (3720 <TIM1_CC_handler+0x164>)
    35f6:	60d3      	str	r3, [r2, #12]
		DMA1[DMACH5].cndtr=ROW_SIZE;
    35f8:	2314      	movs	r3, #20
    35fa:	6053      	str	r3, [r2, #4]
		_enable_dma();
    35fc:	6813      	ldr	r3, [r2, #0]
    35fe:	f043 0301 	orr.w	r3, r3, #1
    3602:	6013      	str	r3, [r2, #0]
		return;
    3604:	4770      	bx	lr
	}
	TIMER1_SR->fld.cc1if=0;
    3606:	4a48      	ldr	r2, [pc, #288]	; (3728 <TIM1_CC_handler+0x16c>)
    3608:	6813      	ldr	r3, [r2, #0]
    360a:	f023 0302 	bic.w	r3, r3, #2
    360e:	6013      	str	r3, [r2, #0]
	line_count++;
    3610:	4b46      	ldr	r3, [pc, #280]	; (372c <TIM1_CC_handler+0x170>)
    3612:	681a      	ldr	r2, [r3, #0]
    3614:	3201      	adds	r2, #1
    3616:	601a      	str	r2, [r3, #0]
	switch(line_count){
    3618:	681b      	ldr	r3, [r3, #0]
    361a:	2b12      	cmp	r3, #18
    361c:	d03e      	beq.n	369c <TIM1_CC_handler+0xe0>
    361e:	dc09      	bgt.n	3634 <TIM1_CC_handler+0x78>
    3620:	2b06      	cmp	r3, #6
    3622:	d021      	beq.n	3668 <TIM1_CC_handler+0xac>
    3624:	dc01      	bgt.n	362a <TIM1_CC_handler+0x6e>
    3626:	b1a3      	cbz	r3, 3652 <TIM1_CC_handler+0x96>
    3628:	4770      	bx	lr
    362a:	2b0c      	cmp	r3, #12
    362c:	d021      	beq.n	3672 <TIM1_CC_handler+0xb6>
    362e:	2b11      	cmp	r3, #17
    3630:	d027      	beq.n	3682 <TIM1_CC_handler+0xc6>
    3632:	4770      	bx	lr
    3634:	f5b3 7f96 	cmp.w	r3, #300	; 0x12c
    3638:	d04b      	beq.n	36d2 <TIM1_CC_handler+0x116>
    363a:	dc02      	bgt.n	3642 <TIM1_CC_handler+0x86>
    363c:	2b3c      	cmp	r3, #60	; 0x3c
    363e:	d03a      	beq.n	36b6 <TIM1_CC_handler+0xfa>
    3640:	4770      	bx	lr
    3642:	f240 1241 	movw	r2, #321	; 0x141
    3646:	4293      	cmp	r3, r2
    3648:	d04c      	beq.n	36e4 <TIM1_CC_handler+0x128>
    364a:	f5b3 7fa1 	cmp.w	r3, #322	; 0x142
    364e:	d055      	beq.n	36fc <TIM1_CC_handler+0x140>
    3650:	4770      	bx	lr
	case 0: // pré-sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR/=2;
    3652:	4a38      	ldr	r2, [pc, #224]	; (3734 <TIM1_CC_handler+0x178>)
    3654:	8813      	ldrh	r3, [r2, #0]
    3656:	f3c3 034e 	ubfx	r3, r3, #1, #15
    365a:	8013      	strh	r3, [r2, #0]
		*TIMER1_CCR1/=2;
    365c:	3208      	adds	r2, #8
    365e:	8813      	ldrh	r3, [r2, #0]
    3660:	f3c3 034e 	ubfx	r3, r3, #1, #15
    3664:	8013      	strh	r3, [r2, #0]
		break;
    3666:	4770      	bx	lr
	case 6: // vsync: 6 demi-lignes pulse larges
	    *TIMER1_CCR1=((FCLK/HFREQ-1)-(FCLK*HSYNC-1))/2;
    3668:	f240 7269 	movw	r2, #1897	; 0x769
    366c:	4b32      	ldr	r3, [pc, #200]	; (3738 <TIM1_CC_handler+0x17c>)
    366e:	801a      	strh	r2, [r3, #0]
	    break;
    3670:	4770      	bx	lr
	case 12: // post_sync: 6 demi-lignes avec hsync/2
		*TIMER1_ARR=(FCLK/HFREQ-1)/2;
    3672:	f240 72ff 	movw	r2, #2047	; 0x7ff
    3676:	4b2f      	ldr	r3, [pc, #188]	; (3734 <TIM1_CC_handler+0x178>)
    3678:	801a      	strh	r2, [r3, #0]
		*TIMER1_CCR1=(FCLK*HSYNC-1)/2;
    367a:	2295      	movs	r2, #149	; 0x95
    367c:	3308      	adds	r3, #8
    367e:	801a      	strh	r2, [r3, #0]
		break;
    3680:	4770      	bx	lr
	case 17: // fin sync champ paire
		if (even){
    3682:	4b2e      	ldr	r3, [pc, #184]	; (373c <TIM1_CC_handler+0x180>)
    3684:	681b      	ldr	r3, [r3, #0]
    3686:	2b00      	cmp	r3, #0
    3688:	d048      	beq.n	371c <TIM1_CC_handler+0x160>
			*TIMER1_ARR=(FCLK/HFREQ-1);
    368a:	f640 72ff 	movw	r2, #4095	; 0xfff
    368e:	4b29      	ldr	r3, [pc, #164]	; (3734 <TIM1_CC_handler+0x178>)
    3690:	801a      	strh	r2, [r3, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    3692:	f240 122b 	movw	r2, #299	; 0x12b
    3696:	3308      	adds	r3, #8
    3698:	801a      	strh	r2, [r3, #0]
    369a:	4770      	bx	lr
		}
		break;
	case 18: // fin vsync
		if (!even){
    369c:	4b27      	ldr	r3, [pc, #156]	; (373c <TIM1_CC_handler+0x180>)
    369e:	681b      	ldr	r3, [r3, #0]
    36a0:	2b00      	cmp	r3, #0
    36a2:	d13b      	bne.n	371c <TIM1_CC_handler+0x160>
			*TIMER1_ARR=(FCLK/HFREQ-1);
    36a4:	f640 72ff 	movw	r2, #4095	; 0xfff
    36a8:	4b22      	ldr	r3, [pc, #136]	; (3734 <TIM1_CC_handler+0x178>)
    36aa:	801a      	strh	r2, [r3, #0]
			*TIMER1_CCR1=(FCLK*HSYNC-1);
    36ac:	f240 122b 	movw	r2, #299	; 0x12b
    36b0:	3308      	adds	r3, #8
    36b2:	801a      	strh	r2, [r3, #0]
    36b4:	4770      	bx	lr
		}
		break;
	case TOP_LINE:
		_enable_pixel_int();
    36b6:	4a1c      	ldr	r2, [pc, #112]	; (3728 <TIM1_CC_handler+0x16c>)
    36b8:	6813      	ldr	r3, [r2, #0]
    36ba:	f023 0304 	bic.w	r3, r3, #4
    36be:	6013      	str	r3, [r2, #0]
    36c0:	3a04      	subs	r2, #4
    36c2:	6813      	ldr	r3, [r2, #0]
    36c4:	f043 0304 	orr.w	r3, r3, #4
    36c8:	6013      	str	r3, [r2, #0]
		video=1;
    36ca:	2201      	movs	r2, #1
    36cc:	4b15      	ldr	r3, [pc, #84]	; (3724 <TIM1_CC_handler+0x168>)
    36ce:	601a      	str	r2, [r3, #0]
		break;
    36d0:	4770      	bx	lr
	case (TOP_LINE+VRES):
		_disable_pixel_int();
    36d2:	4a1b      	ldr	r2, [pc, #108]	; (3740 <TIM1_CC_handler+0x184>)
    36d4:	6813      	ldr	r3, [r2, #0]
    36d6:	f023 0304 	bic.w	r3, r3, #4
    36da:	6013      	str	r3, [r2, #0]
		video=0;
    36dc:	2200      	movs	r2, #0
    36de:	4b11      	ldr	r3, [pc, #68]	; (3724 <TIM1_CC_handler+0x168>)
    36e0:	601a      	str	r2, [r3, #0]
		break;
    36e2:	4770      	bx	lr
	case FIELD_END:
		if (!even){
    36e4:	4b15      	ldr	r3, [pc, #84]	; (373c <TIM1_CC_handler+0x180>)
    36e6:	681b      	ldr	r3, [r3, #0]
    36e8:	b9c3      	cbnz	r3, 371c <TIM1_CC_handler+0x160>
			line_count=-1;
    36ea:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    36ee:	4b0f      	ldr	r3, [pc, #60]	; (372c <TIM1_CC_handler+0x170>)
    36f0:	601a      	str	r2, [r3, #0]
			even=-even;
    36f2:	4a12      	ldr	r2, [pc, #72]	; (373c <TIM1_CC_handler+0x180>)
    36f4:	6813      	ldr	r3, [r2, #0]
    36f6:	425b      	negs	r3, r3
    36f8:	6013      	str	r3, [r2, #0]
    36fa:	4770      	bx	lr
		}
		break;
	case (FIELD_END+1):
		if (even){
    36fc:	4b0f      	ldr	r3, [pc, #60]	; (373c <TIM1_CC_handler+0x180>)
    36fe:	681b      	ldr	r3, [r3, #0]
    3700:	b163      	cbz	r3, 371c <TIM1_CC_handler+0x160>
			*TIMER1_ARR/=2;
    3702:	4a0c      	ldr	r2, [pc, #48]	; (3734 <TIM1_CC_handler+0x178>)
    3704:	8813      	ldrh	r3, [r2, #0]
    3706:	f3c3 034e 	ubfx	r3, r3, #1, #15
    370a:	8013      	strh	r3, [r2, #0]
			line_count=-1;
    370c:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    3710:	4b06      	ldr	r3, [pc, #24]	; (372c <TIM1_CC_handler+0x170>)
    3712:	601a      	str	r2, [r3, #0]
			even=-even;
    3714:	4a09      	ldr	r2, [pc, #36]	; (373c <TIM1_CC_handler+0x180>)
    3716:	6813      	ldr	r3, [r2, #0]
    3718:	425b      	negs	r3, r3
    371a:	6013      	str	r3, [r2, #0]
    371c:	4770      	bx	lr
    371e:	bf00      	nop
    3720:	40020058 	.word	0x40020058
    3724:	20000178 	.word	0x20000178
    3728:	40012c10 	.word	0x40012c10
    372c:	2000000c 	.word	0x2000000c
    3730:	200001d8 	.word	0x200001d8
    3734:	40012c2c 	.word	0x40012c2c
    3738:	40012c34 	.word	0x40012c34
    373c:	2000017c 	.word	0x2000017c
    3740:	40012c0c 	.word	0x40012c0c

00003744 <DMA1CH5_handler>:
	    break;
	}//switch (line_count)
}


void DMA1CH5_handler(){
    3744:	b480      	push	{r7}
    3746:	af00      	add	r7, sp, #0
	DMA1_FLAGS->IFCR|=DMA_ISR_CGIF5;
    3748:	4a09      	ldr	r2, [pc, #36]	; (3770 <DMA1CH5_handler+0x2c>)
    374a:	4b09      	ldr	r3, [pc, #36]	; (3770 <DMA1CH5_handler+0x2c>)
    374c:	685b      	ldr	r3, [r3, #4]
    374e:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
    3752:	6053      	str	r3, [r2, #4]
	while (!(SPI2->SR&SPI_SR_TXE));
    3754:	bf00      	nop
    3756:	4b07      	ldr	r3, [pc, #28]	; (3774 <DMA1CH5_handler+0x30>)
    3758:	689b      	ldr	r3, [r3, #8]
    375a:	f003 0302 	and.w	r3, r3, #2
    375e:	2b00      	cmp	r3, #0
    3760:	d0f9      	beq.n	3756 <DMA1CH5_handler+0x12>
	SPI2->DR=0;
    3762:	4b04      	ldr	r3, [pc, #16]	; (3774 <DMA1CH5_handler+0x30>)
    3764:	2200      	movs	r2, #0
    3766:	60da      	str	r2, [r3, #12]
}
    3768:	46bd      	mov	sp, r7
    376a:	f85d 7b04 	ldr.w	r7, [sp], #4
    376e:	4770      	bx	lr
    3770:	40020000 	.word	0x40020000
    3774:	40003800 	.word	0x40003800

00003778 <usart_config_port>:

#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 

// configuration dse broches
void usart_config_port(usart_t* channel, gpio_t *port, unsigned flow_ctrl){
    3778:	b480      	push	{r7}
    377a:	b085      	sub	sp, #20
    377c:	af00      	add	r7, sp, #0
    377e:	60f8      	str	r0, [r7, #12]
    3780:	60b9      	str	r1, [r7, #8]
    3782:	607a      	str	r2, [r7, #4]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    3784:	68fb      	ldr	r3, [r7, #12]
    3786:	4a45      	ldr	r2, [pc, #276]	; (389c <usart_config_port+0x124>)
    3788:	4293      	cmp	r3, r2
    378a:	d058      	beq.n	383e <usart_config_port+0xc6>
    378c:	4a44      	ldr	r2, [pc, #272]	; (38a0 <usart_config_port+0x128>)
    378e:	4293      	cmp	r3, r2
    3790:	d003      	beq.n	379a <usart_config_port+0x22>
    3792:	4a44      	ldr	r2, [pc, #272]	; (38a4 <usart_config_port+0x12c>)
    3794:	4293      	cmp	r3, r2
    3796:	d029      	beq.n	37ec <usart_config_port+0x74>
    3798:	e07a      	b.n	3890 <usart_config_port+0x118>
	case (uint32_t)USART1:
		RCC->APB2ENR|=RCC_APB2ENR_USART1EN|RCC_APB2ENR_IOPAEN;
    379a:	4a43      	ldr	r2, [pc, #268]	; (38a8 <usart_config_port+0x130>)
    379c:	4b42      	ldr	r3, [pc, #264]	; (38a8 <usart_config_port+0x130>)
    379e:	699b      	ldr	r3, [r3, #24]
    37a0:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    37a4:	f043 0304 	orr.w	r3, r3, #4
    37a8:	6193      	str	r3, [r2, #24]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    37aa:	687b      	ldr	r3, [r7, #4]
    37ac:	2b01      	cmp	r3, #1
    37ae:	d110      	bne.n	37d2 <usart_config_port+0x5a>
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
    37b0:	68bb      	ldr	r3, [r7, #8]
    37b2:	685b      	ldr	r3, [r3, #4]
    37b4:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    37b8:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    37bc:	68ba      	ldr	r2, [r7, #8]
    37be:	6053      	str	r3, [r2, #4]
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
    37c0:	68bb      	ldr	r3, [r7, #8]
    37c2:	685b      	ldr	r3, [r3, #4]
    37c4:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    37c8:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    37cc:	68ba      	ldr	r2, [r7, #8]
    37ce:	6053      	str	r3, [r2, #4]
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
		}
		break;
    37d0:	e05e      	b.n	3890 <usart_config_port+0x118>
		// PA12 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
			port->CR[1]&=~((15<<((USART1_TX_PIN-8)*4))|(15<<((USART1_RTS_PIN-8)*4)));
			port->CR[1]|=(0xA<<((USART1_TX_PIN-8)*4))|(0xA<<((USART1_RTS_PIN-8)*4));
		}else{
			port->CR[1]&=~(15<<((USART1_TX_PIN-8)*4));
    37d2:	68bb      	ldr	r3, [r7, #8]
    37d4:	685b      	ldr	r3, [r3, #4]
    37d6:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
    37da:	68bb      	ldr	r3, [r7, #8]
    37dc:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART1_TX_PIN-8)*4);
    37de:	68bb      	ldr	r3, [r7, #8]
    37e0:	685b      	ldr	r3, [r3, #4]
    37e2:	f043 02a0 	orr.w	r2, r3, #160	; 0xa0
    37e6:	68bb      	ldr	r3, [r7, #8]
    37e8:	605a      	str	r2, [r3, #4]
		}
		break;
    37ea:	e051      	b.n	3890 <usart_config_port+0x118>
	case (uint32_t)USART2:
		RCC->APB1ENR|=RCC_APB1ENR_USART2EN;
    37ec:	4a2e      	ldr	r2, [pc, #184]	; (38a8 <usart_config_port+0x130>)
    37ee:	4b2e      	ldr	r3, [pc, #184]	; (38a8 <usart_config_port+0x130>)
    37f0:	69db      	ldr	r3, [r3, #28]
    37f2:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    37f6:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPAEN;
    37f8:	4a2b      	ldr	r2, [pc, #172]	; (38a8 <usart_config_port+0x130>)
    37fa:	4b2b      	ldr	r3, [pc, #172]	; (38a8 <usart_config_port+0x130>)
    37fc:	699b      	ldr	r3, [r3, #24]
    37fe:	f043 0304 	orr.w	r3, r3, #4
    3802:	6193      	str	r3, [r2, #24]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX  output (push-pull)
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
    3804:	687b      	ldr	r3, [r7, #4]
    3806:	2b01      	cmp	r3, #1
    3808:	d10c      	bne.n	3824 <usart_config_port+0xac>
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
    380a:	68bb      	ldr	r3, [r7, #8]
    380c:	681b      	ldr	r3, [r3, #0]
    380e:	f423 627f 	bic.w	r2, r3, #4080	; 0xff0
    3812:	68bb      	ldr	r3, [r7, #8]
    3814:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
    3816:	68bb      	ldr	r3, [r7, #8]
    3818:	681b      	ldr	r3, [r3, #0]
    381a:	f443 622a 	orr.w	r2, r3, #2720	; 0xaa0
    381e:	68bb      	ldr	r3, [r7, #8]
    3820:	601a      	str	r2, [r3, #0]
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
		}
		break;
    3822:	e035      	b.n	3890 <usart_config_port+0x118>
		// PA3 -> RX input (floating)
		if (flow_ctrl==FLOW_HARD){
			port->CR[0]&=~((15<<(USART2_TX_PIN*4))|(15<<(USART2_RTS_PIN*4)));
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4))|(0xA<<(USART2_RTS_PIN*4));
		}else{
			port->CR[0]&=~((15<<(USART2_TX_PIN*4)));
    3824:	68bb      	ldr	r3, [r7, #8]
    3826:	681b      	ldr	r3, [r3, #0]
    3828:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    382c:	68bb      	ldr	r3, [r7, #8]
    382e:	601a      	str	r2, [r3, #0]
			port->CR[0]|=(0xA<<(USART2_TX_PIN*4));
    3830:	68bb      	ldr	r3, [r7, #8]
    3832:	681b      	ldr	r3, [r3, #0]
    3834:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    3838:	68bb      	ldr	r3, [r7, #8]
    383a:	601a      	str	r2, [r3, #0]
		}
		break;
    383c:	e028      	b.n	3890 <usart_config_port+0x118>
	case (uint32_t)USART3:
		RCC->APB1ENR|=RCC_APB1ENR_USART3EN;
    383e:	4a1a      	ldr	r2, [pc, #104]	; (38a8 <usart_config_port+0x130>)
    3840:	4b19      	ldr	r3, [pc, #100]	; (38a8 <usart_config_port+0x130>)
    3842:	69db      	ldr	r3, [r3, #28]
    3844:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    3848:	61d3      	str	r3, [r2, #28]
		RCC->APB2ENR|=RCC_APB2ENR_IOPBEN;
    384a:	4a17      	ldr	r2, [pc, #92]	; (38a8 <usart_config_port+0x130>)
    384c:	4b16      	ldr	r3, [pc, #88]	; (38a8 <usart_config_port+0x130>)
    384e:	699b      	ldr	r3, [r3, #24]
    3850:	f043 0308 	orr.w	r3, r3, #8
    3854:	6193      	str	r3, [r2, #24]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		if (flow_ctrl==FLOW_HARD){
    3856:	687b      	ldr	r3, [r7, #4]
    3858:	2b01      	cmp	r3, #1
    385a:	d10c      	bne.n	3876 <usart_config_port+0xfe>
			port->CR[1]&=~((15<<((USART3_TX_PIN-8)*4))|(15<<((USART3_RTS_PIN-8)*4)));
    385c:	68bb      	ldr	r3, [r7, #8]
    385e:	685b      	ldr	r3, [r3, #4]
    3860:	f023 220f 	bic.w	r2, r3, #251662080	; 0xf000f00
    3864:	68bb      	ldr	r3, [r7, #8]
    3866:	605a      	str	r2, [r3, #4]
			port->CR[1]|=(0xA<<((USART3_TX_PIN-8)*4))|(0xA<<((USART3_RTS_PIN-8)*4));
    3868:	68bb      	ldr	r3, [r7, #8]
    386a:	685b      	ldr	r3, [r3, #4]
    386c:	f043 220a 	orr.w	r2, r3, #167774720	; 0xa000a00
    3870:	68bb      	ldr	r3, [r7, #8]
    3872:	605a      	str	r2, [r3, #4]
    3874:	e00b      	b.n	388e <usart_config_port+0x116>
		}else{
			port->CR[1]&=~(15<<((USART3_TX_PIN-8)*4));
    3876:	68bb      	ldr	r3, [r7, #8]
    3878:	685b      	ldr	r3, [r3, #4]
    387a:	f423 6270 	bic.w	r2, r3, #3840	; 0xf00
    387e:	68bb      	ldr	r3, [r7, #8]
    3880:	605a      	str	r2, [r3, #4]
			port->CR[1]|=0xA<<((USART3_TX_PIN-8)*4);
    3882:	68bb      	ldr	r3, [r7, #8]
    3884:	685b      	ldr	r3, [r3, #4]
    3886:	f443 6220 	orr.w	r2, r3, #2560	; 0xa00
    388a:	68bb      	ldr	r3, [r7, #8]
    388c:	605a      	str	r2, [r3, #4]
		}
		break;
    388e:	bf00      	nop
	}
}
    3890:	3714      	adds	r7, #20
    3892:	46bd      	mov	sp, r7
    3894:	f85d 7b04 	ldr.w	r7, [sp], #4
    3898:	4770      	bx	lr
    389a:	bf00      	nop
    389c:	40004800 	.word	0x40004800
    38a0:	40013800 	.word	0x40013800
    38a4:	40004400 	.word	0x40004400
    38a8:	40021000 	.word	0x40021000

000038ac <usart_set_baud>:

// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud){
    38ac:	b480      	push	{r7}
    38ae:	b085      	sub	sp, #20
    38b0:	af00      	add	r7, sp, #0
    38b2:	6078      	str	r0, [r7, #4]
    38b4:	6039      	str	r1, [r7, #0]
	uint32_t rate;
    if ((uint32_t)channel==(uint32_t)USART1){
    38b6:	687b      	ldr	r3, [r7, #4]
    38b8:	4a14      	ldr	r2, [pc, #80]	; (390c <usart_set_baud+0x60>)
    38ba:	4293      	cmp	r3, r2
    38bc:	d10f      	bne.n	38de <usart_set_baud+0x32>
		rate=(FAPB2/baud/16)<<4;
    38be:	4a14      	ldr	r2, [pc, #80]	; (3910 <usart_set_baud+0x64>)
    38c0:	683b      	ldr	r3, [r7, #0]
    38c2:	fbb2 f3f3 	udiv	r3, r2, r3
    38c6:	011b      	lsls	r3, r3, #4
    38c8:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    38ca:	4a12      	ldr	r2, [pc, #72]	; (3914 <usart_set_baud+0x68>)
    38cc:	683b      	ldr	r3, [r7, #0]
    38ce:	fbb2 f3f3 	udiv	r3, r2, r3
    38d2:	f003 030f 	and.w	r3, r3, #15
    38d6:	68fa      	ldr	r2, [r7, #12]
    38d8:	4313      	orrs	r3, r2
    38da:	60fb      	str	r3, [r7, #12]
    38dc:	e00e      	b.n	38fc <usart_set_baud+0x50>
	}else{
		rate=(FAPB1/baud/16)<<4;
    38de:	4a0e      	ldr	r2, [pc, #56]	; (3918 <usart_set_baud+0x6c>)
    38e0:	683b      	ldr	r3, [r7, #0]
    38e2:	fbb2 f3f3 	udiv	r3, r2, r3
    38e6:	011b      	lsls	r3, r3, #4
    38e8:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    38ea:	4a0c      	ldr	r2, [pc, #48]	; (391c <usart_set_baud+0x70>)
    38ec:	683b      	ldr	r3, [r7, #0]
    38ee:	fbb2 f3f3 	udiv	r3, r2, r3
    38f2:	f003 030f 	and.w	r3, r3, #15
    38f6:	68fa      	ldr	r2, [r7, #12]
    38f8:	4313      	orrs	r3, r2
    38fa:	60fb      	str	r3, [r7, #12]
	}
	channel->BRR=rate;
    38fc:	687b      	ldr	r3, [r7, #4]
    38fe:	68fa      	ldr	r2, [r7, #12]
    3900:	609a      	str	r2, [r3, #8]
}
    3902:	3714      	adds	r7, #20
    3904:	46bd      	mov	sp, r7
    3906:	f85d 7b04 	ldr.w	r7, [sp], #4
    390a:	4770      	bx	lr
    390c:	40013800 	.word	0x40013800
    3910:	003d0900 	.word	0x003d0900
    3914:	03d09000 	.word	0x03d09000
    3918:	001e8480 	.word	0x001e8480
    391c:	01e84800 	.word	0x01e84800

00003920 <usart_comm_dir>:

// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction){
    3920:	b480      	push	{r7}
    3922:	b083      	sub	sp, #12
    3924:	af00      	add	r7, sp, #0
    3926:	6078      	str	r0, [r7, #4]
    3928:	6039      	str	r1, [r7, #0]
	channel->CR1&=USART_CR1_DIR_MASK;
    392a:	687b      	ldr	r3, [r7, #4]
    392c:	68db      	ldr	r3, [r3, #12]
    392e:	f023 020c 	bic.w	r2, r3, #12
    3932:	687b      	ldr	r3, [r7, #4]
    3934:	60da      	str	r2, [r3, #12]
	channel->CR1|=direction<<USART_CR1_DIR_POS;
    3936:	687b      	ldr	r3, [r7, #4]
    3938:	68da      	ldr	r2, [r3, #12]
    393a:	683b      	ldr	r3, [r7, #0]
    393c:	009b      	lsls	r3, r3, #2
    393e:	431a      	orrs	r2, r3
    3940:	687b      	ldr	r3, [r7, #4]
    3942:	60da      	str	r2, [r3, #12]
}
    3944:	370c      	adds	r7, #12
    3946:	46bd      	mov	sp, r7
    3948:	f85d 7b04 	ldr.w	r7, [sp], #4
    394c:	4770      	bx	lr
    394e:	bf00      	nop

00003950 <usart_open_channel>:


// configure l'USART pour communication selon protocole RS-232
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl){
    3950:	b580      	push	{r7, lr}
    3952:	b084      	sub	sp, #16
    3954:	af00      	add	r7, sp, #0
    3956:	60f8      	str	r0, [r7, #12]
    3958:	60b9      	str	r1, [r7, #8]
    395a:	607a      	str	r2, [r7, #4]
    395c:	603b      	str	r3, [r7, #0]
	switch((uint32_t)channel){ // activation du périphérique USART et du PORT
    395e:	68fb      	ldr	r3, [r7, #12]
    3960:	4a32      	ldr	r2, [pc, #200]	; (3a2c <usart_open_channel+0xdc>)
    3962:	4293      	cmp	r3, r2
    3964:	d020      	beq.n	39a8 <usart_open_channel+0x58>
    3966:	4a32      	ldr	r2, [pc, #200]	; (3a30 <usart_open_channel+0xe0>)
    3968:	4293      	cmp	r3, r2
    396a:	d003      	beq.n	3974 <usart_open_channel+0x24>
    396c:	4a31      	ldr	r2, [pc, #196]	; (3a34 <usart_open_channel+0xe4>)
    396e:	4293      	cmp	r3, r2
    3970:	d00d      	beq.n	398e <usart_open_channel+0x3e>
    3972:	e026      	b.n	39c2 <usart_open_channel+0x72>
	case (uint32_t)USART1:
		usart_config_port(channel,USART1_PORT,flow_ctrl);
    3974:	68f8      	ldr	r0, [r7, #12]
    3976:	4930      	ldr	r1, [pc, #192]	; (3a38 <usart_open_channel+0xe8>)
    3978:	69ba      	ldr	r2, [r7, #24]
    397a:	f7ff fefd 	bl	3778 <usart_config_port>
		set_int_priority(IRQ_USART1,7);
    397e:	2025      	movs	r0, #37	; 0x25
    3980:	2107      	movs	r1, #7
    3982:	f7ff f8e9 	bl	2b58 <set_int_priority>
		enable_interrupt(IRQ_USART1);
    3986:	2025      	movs	r0, #37	; 0x25
    3988:	f7ff f82a 	bl	29e0 <enable_interrupt>
		break;
    398c:	e019      	b.n	39c2 <usart_open_channel+0x72>
	case (uint32_t)USART2:
		usart_config_port(channel,USART2_PORT,flow_ctrl);
    398e:	68f8      	ldr	r0, [r7, #12]
    3990:	4929      	ldr	r1, [pc, #164]	; (3a38 <usart_open_channel+0xe8>)
    3992:	69ba      	ldr	r2, [r7, #24]
    3994:	f7ff fef0 	bl	3778 <usart_config_port>
		set_int_priority(IRQ_USART2,7);
    3998:	2026      	movs	r0, #38	; 0x26
    399a:	2107      	movs	r1, #7
    399c:	f7ff f8dc 	bl	2b58 <set_int_priority>
		enable_interrupt(IRQ_USART2);
    39a0:	2026      	movs	r0, #38	; 0x26
    39a2:	f7ff f81d 	bl	29e0 <enable_interrupt>
		break;
    39a6:	e00c      	b.n	39c2 <usart_open_channel+0x72>
	case (uint32_t)USART3:
		usart_config_port(channel,USART3_PORT,flow_ctrl);
    39a8:	68f8      	ldr	r0, [r7, #12]
    39aa:	4924      	ldr	r1, [pc, #144]	; (3a3c <usart_open_channel+0xec>)
    39ac:	69ba      	ldr	r2, [r7, #24]
    39ae:	f7ff fee3 	bl	3778 <usart_config_port>
		set_int_priority(IRQ_USART3,7);
    39b2:	2027      	movs	r0, #39	; 0x27
    39b4:	2107      	movs	r1, #7
    39b6:	f7ff f8cf 	bl	2b58 <set_int_priority>
		enable_interrupt(IRQ_USART3);
    39ba:	2027      	movs	r0, #39	; 0x27
    39bc:	f7ff f810 	bl	29e0 <enable_interrupt>
		break;
    39c0:	bf00      	nop
	}
	if (flow_ctrl==FLOW_HARD){
    39c2:	69bb      	ldr	r3, [r7, #24]
    39c4:	2b01      	cmp	r3, #1
    39c6:	d103      	bne.n	39d0 <usart_open_channel+0x80>
		channel->CR3=USART_CR3_CTSE|USART_CR3_RTSE;
    39c8:	68fb      	ldr	r3, [r7, #12]
    39ca:	f44f 7240 	mov.w	r2, #768	; 0x300
    39ce:	615a      	str	r2, [r3, #20]
	}
	usart_comm_dir(channel,dir);
    39d0:	68f8      	ldr	r0, [r7, #12]
    39d2:	6839      	ldr	r1, [r7, #0]
    39d4:	f7ff ffa4 	bl	3920 <usart_comm_dir>
	switch (parity){
    39d8:	687b      	ldr	r3, [r7, #4]
    39da:	2b01      	cmp	r3, #1
    39dc:	d00b      	beq.n	39f6 <usart_open_channel+0xa6>
    39de:	2b01      	cmp	r3, #1
    39e0:	d302      	bcc.n	39e8 <usart_open_channel+0x98>
    39e2:	2b02      	cmp	r3, #2
    39e4:	d00e      	beq.n	3a04 <usart_open_channel+0xb4>
    39e6:	e014      	b.n	3a12 <usart_open_channel+0xc2>
	case PARITY_NONE:
		channel->CR1|=USART_CR1_RXNEIE;
    39e8:	68fb      	ldr	r3, [r7, #12]
    39ea:	68db      	ldr	r3, [r3, #12]
    39ec:	f043 0220 	orr.w	r2, r3, #32
    39f0:	68fb      	ldr	r3, [r7, #12]
    39f2:	60da      	str	r2, [r3, #12]
		break;
    39f4:	e00d      	b.n	3a12 <usart_open_channel+0xc2>
	case PARITY_ODD:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_PS|USART_CR1_RXNEIE;
    39f6:	68fb      	ldr	r3, [r7, #12]
    39f8:	68db      	ldr	r3, [r3, #12]
    39fa:	f443 62e4 	orr.w	r2, r3, #1824	; 0x720
    39fe:	68fb      	ldr	r3, [r7, #12]
    3a00:	60da      	str	r2, [r3, #12]
		break;
    3a02:	e006      	b.n	3a12 <usart_open_channel+0xc2>
	case PARITY_EVEN:
		channel->CR1|=USART_CR1_PEIE|USART_CR1_PCE|USART_CR1_RXNEIE;
    3a04:	68fb      	ldr	r3, [r7, #12]
    3a06:	68db      	ldr	r3, [r3, #12]
    3a08:	f443 62a4 	orr.w	r2, r3, #1312	; 0x520
    3a0c:	68fb      	ldr	r3, [r7, #12]
    3a0e:	60da      	str	r2, [r3, #12]
		break;
    3a10:	bf00      	nop
    }
	usart_set_baud(channel,baud);
    3a12:	68f8      	ldr	r0, [r7, #12]
    3a14:	68b9      	ldr	r1, [r7, #8]
    3a16:	f7ff ff49 	bl	38ac <usart_set_baud>
    channel->CR1|=USART_CR1_UE;
    3a1a:	68fb      	ldr	r3, [r7, #12]
    3a1c:	68db      	ldr	r3, [r3, #12]
    3a1e:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
    3a22:	68fb      	ldr	r3, [r7, #12]
    3a24:	60da      	str	r2, [r3, #12]
}
    3a26:	3710      	adds	r7, #16
    3a28:	46bd      	mov	sp, r7
    3a2a:	bd80      	pop	{r7, pc}
    3a2c:	40004800 	.word	0x40004800
    3a30:	40013800 	.word	0x40013800
    3a34:	40004400 	.word	0x40004400
    3a38:	40010800 	.word	0x40010800
    3a3c:	40010c00 	.word	0x40010c00

00003a40 <usart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel){
    3a40:	b480      	push	{r7}
    3a42:	b083      	sub	sp, #12
    3a44:	af00      	add	r7, sp, #0
    3a46:	6078      	str	r0, [r7, #4]
	return channel->SR&USART_SR_RXNE;
    3a48:	687b      	ldr	r3, [r7, #4]
    3a4a:	681b      	ldr	r3, [r3, #0]
    3a4c:	f003 0320 	and.w	r3, r3, #32
}
    3a50:	4618      	mov	r0, r3
    3a52:	370c      	adds	r7, #12
    3a54:	46bd      	mov	sp, r7
    3a56:	f85d 7b04 	ldr.w	r7, [sp], #4
    3a5a:	4770      	bx	lr

00003a5c <usart_getc>:

// reçoit un caractère de la console
char usart_getc(usart_t* channel){
    3a5c:	b480      	push	{r7}
    3a5e:	b083      	sub	sp, #12
    3a60:	af00      	add	r7, sp, #0
    3a62:	6078      	str	r0, [r7, #4]
	return channel->DR;
    3a64:	687b      	ldr	r3, [r7, #4]
    3a66:	685b      	ldr	r3, [r3, #4]
    3a68:	b2db      	uxtb	r3, r3
}
    3a6a:	4618      	mov	r0, r3
    3a6c:	370c      	adds	r7, #12
    3a6e:	46bd      	mov	sp, r7
    3a70:	f85d 7b04 	ldr.w	r7, [sp], #4
    3a74:	4770      	bx	lr
    3a76:	bf00      	nop

00003a78 <usart_putc>:

// transmet un caractère à la console
void usart_putc(usart_t* channel, char c){
    3a78:	b480      	push	{r7}
    3a7a:	b083      	sub	sp, #12
    3a7c:	af00      	add	r7, sp, #0
    3a7e:	6078      	str	r0, [r7, #4]
    3a80:	460b      	mov	r3, r1
    3a82:	70fb      	strb	r3, [r7, #3]
	//attend que dr soit vide
	while (!(channel->SR&USART_SR_TXE));
    3a84:	bf00      	nop
    3a86:	687b      	ldr	r3, [r7, #4]
    3a88:	681b      	ldr	r3, [r3, #0]
    3a8a:	f003 0380 	and.w	r3, r3, #128	; 0x80
    3a8e:	2b00      	cmp	r3, #0
    3a90:	d0f9      	beq.n	3a86 <usart_putc+0xe>
	channel->DR=c;
    3a92:	78fa      	ldrb	r2, [r7, #3]
    3a94:	687b      	ldr	r3, [r7, #4]
    3a96:	605a      	str	r2, [r3, #4]
}
    3a98:	370c      	adds	r7, #12
    3a9a:	46bd      	mov	sp, r7
    3a9c:	f85d 7b04 	ldr.w	r7, [sp], #4
    3aa0:	4770      	bx	lr
    3aa2:	bf00      	nop

00003aa4 <usart_cts>:


int usart_cts(usart_t* channel){
    3aa4:	b480      	push	{r7}
    3aa6:	b085      	sub	sp, #20
    3aa8:	af00      	add	r7, sp, #0
    3aaa:	6078      	str	r0, [r7, #4]
	int cts;
	switch ((uint32_t)channel){
    3aac:	687b      	ldr	r3, [r7, #4]
    3aae:	4a11      	ldr	r2, [pc, #68]	; (3af4 <usart_cts+0x50>)
    3ab0:	4293      	cmp	r3, r2
    3ab2:	d012      	beq.n	3ada <usart_cts+0x36>
    3ab4:	4a10      	ldr	r2, [pc, #64]	; (3af8 <usart_cts+0x54>)
    3ab6:	4293      	cmp	r3, r2
    3ab8:	d003      	beq.n	3ac2 <usart_cts+0x1e>
    3aba:	4a10      	ldr	r2, [pc, #64]	; (3afc <usart_cts+0x58>)
    3abc:	4293      	cmp	r3, r2
    3abe:	d006      	beq.n	3ace <usart_cts+0x2a>
    3ac0:	e011      	b.n	3ae6 <usart_cts+0x42>
		case (uint32_t)USART1:
			cts=USART1_PORT->IDR&USART1_CTS_BIT;
    3ac2:	4b0f      	ldr	r3, [pc, #60]	; (3b00 <usart_cts+0x5c>)
    3ac4:	689b      	ldr	r3, [r3, #8]
    3ac6:	f403 6300 	and.w	r3, r3, #2048	; 0x800
    3aca:	60fb      	str	r3, [r7, #12]
			break;
    3acc:	e00b      	b.n	3ae6 <usart_cts+0x42>
		case (uint32_t)USART2:
			cts=USART2_PORT->IDR&USART2_CTS_BIT;
    3ace:	4b0c      	ldr	r3, [pc, #48]	; (3b00 <usart_cts+0x5c>)
    3ad0:	689b      	ldr	r3, [r3, #8]
    3ad2:	f003 0301 	and.w	r3, r3, #1
    3ad6:	60fb      	str	r3, [r7, #12]
			break;
    3ad8:	e005      	b.n	3ae6 <usart_cts+0x42>
		case (uint32_t)USART3:
			cts=USART3_PORT->IDR&USART3_CTS_BIT;
    3ada:	4b0a      	ldr	r3, [pc, #40]	; (3b04 <usart_cts+0x60>)
    3adc:	689b      	ldr	r3, [r3, #8]
    3ade:	f403 5300 	and.w	r3, r3, #8192	; 0x2000
    3ae2:	60fb      	str	r3, [r7, #12]
			break;
    3ae4:	bf00      	nop
	}
	return cts;
    3ae6:	68fb      	ldr	r3, [r7, #12]
}
    3ae8:	4618      	mov	r0, r3
    3aea:	3714      	adds	r7, #20
    3aec:	46bd      	mov	sp, r7
    3aee:	f85d 7b04 	ldr.w	r7, [sp], #4
    3af2:	4770      	bx	lr
    3af4:	40004800 	.word	0x40004800
    3af8:	40013800 	.word	0x40013800
    3afc:	40004400 	.word	0x40004400
    3b00:	40010800 	.word	0x40010800
    3b04:	40010c00 	.word	0x40010c00

00003b08 <vt_init>:

#include "../include/blue_pill.h"
#include "vt100.h"
#include "console.h"

void vt_init(){
    3b08:	b580      	push	{r7, lr}
    3b0a:	b082      	sub	sp, #8
    3b0c:	af02      	add	r7, sp, #8
	usart_open_channel(VT_USART,115200,PARITY_NONE,USART_DIR_BIDI,FLOW_HARD);
    3b0e:	2301      	movs	r3, #1
    3b10:	9300      	str	r3, [sp, #0]
    3b12:	4804      	ldr	r0, [pc, #16]	; (3b24 <vt_init+0x1c>)
    3b14:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
    3b18:	2200      	movs	r2, #0
    3b1a:	2303      	movs	r3, #3
    3b1c:	f7ff ff18 	bl	3950 <usart_open_channel>
}
    3b20:	46bd      	mov	sp, r7
    3b22:	bd80      	pop	{r7, pc}
    3b24:	40004400 	.word	0x40004400

00003b28 <vt_putc>:

void vt_putc(char c){
    3b28:	b580      	push	{r7, lr}
    3b2a:	b082      	sub	sp, #8
    3b2c:	af00      	add	r7, sp, #0
    3b2e:	4603      	mov	r3, r0
    3b30:	71fb      	strb	r3, [r7, #7]
	usart_putc(VT_USART,c);
    3b32:	79fb      	ldrb	r3, [r7, #7]
    3b34:	4803      	ldr	r0, [pc, #12]	; (3b44 <vt_putc+0x1c>)
    3b36:	4619      	mov	r1, r3
    3b38:	f7ff ff9e 	bl	3a78 <usart_putc>
}
    3b3c:	3708      	adds	r7, #8
    3b3e:	46bd      	mov	sp, r7
    3b40:	bd80      	pop	{r7, pc}
    3b42:	bf00      	nop
    3b44:	40004400 	.word	0x40004400

00003b48 <vt_del_back>:

void vt_del_back(){
    3b48:	b580      	push	{r7, lr}
    3b4a:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,BS);
    3b4c:	4806      	ldr	r0, [pc, #24]	; (3b68 <vt_del_back+0x20>)
    3b4e:	2108      	movs	r1, #8
    3b50:	f7ff ff92 	bl	3a78 <usart_putc>
	usart_putc(VT_USART,SPACE);
    3b54:	4804      	ldr	r0, [pc, #16]	; (3b68 <vt_del_back+0x20>)
    3b56:	2120      	movs	r1, #32
    3b58:	f7ff ff8e 	bl	3a78 <usart_putc>
	usart_putc(VT_USART,BS);
    3b5c:	4802      	ldr	r0, [pc, #8]	; (3b68 <vt_del_back+0x20>)
    3b5e:	2108      	movs	r1, #8
    3b60:	f7ff ff8a 	bl	3a78 <usart_putc>
}
    3b64:	bd80      	pop	{r7, pc}
    3b66:	bf00      	nop
    3b68:	40004400 	.word	0x40004400

00003b6c <vt_esc_seq>:

static void vt_esc_seq(){
    3b6c:	b580      	push	{r7, lr}
    3b6e:	af00      	add	r7, sp, #0
	usart_putc(VT_USART,ESC);
    3b70:	4804      	ldr	r0, [pc, #16]	; (3b84 <vt_esc_seq+0x18>)
    3b72:	211b      	movs	r1, #27
    3b74:	f7ff ff80 	bl	3a78 <usart_putc>
	usart_putc(VT_USART,'[');
    3b78:	4802      	ldr	r0, [pc, #8]	; (3b84 <vt_esc_seq+0x18>)
    3b7a:	215b      	movs	r1, #91	; 0x5b
    3b7c:	f7ff ff7c 	bl	3a78 <usart_putc>
}
    3b80:	bd80      	pop	{r7, pc}
    3b82:	bf00      	nop
    3b84:	40004400 	.word	0x40004400

00003b88 <vt_cls>:


// vide l'écran de la console
void vt_cls(){
    3b88:	b580      	push	{r7, lr}
    3b8a:	af00      	add	r7, sp, #0
	vt_esc_seq();
    3b8c:	f7ff ffee 	bl	3b6c <vt_esc_seq>
	usart_putc(VT_USART,'2');
    3b90:	4804      	ldr	r0, [pc, #16]	; (3ba4 <vt_cls+0x1c>)
    3b92:	2132      	movs	r1, #50	; 0x32
    3b94:	f7ff ff70 	bl	3a78 <usart_putc>
	usart_putc(VT_USART,'J');
    3b98:	4802      	ldr	r0, [pc, #8]	; (3ba4 <vt_cls+0x1c>)
    3b9a:	214a      	movs	r1, #74	; 0x4a
    3b9c:	f7ff ff6c 	bl	3a78 <usart_putc>
}
    3ba0:	bd80      	pop	{r7, pc}
    3ba2:	bf00      	nop
    3ba4:	40004400 	.word	0x40004400

00003ba8 <vt_clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void vt_clear_line(unsigned n){
    3ba8:	b580      	push	{r7, lr}
    3baa:	b082      	sub	sp, #8
    3bac:	af00      	add	r7, sp, #0
    3bae:	6078      	str	r0, [r7, #4]
	vt_esc_seq();
    3bb0:	f7ff ffdc 	bl	3b6c <vt_esc_seq>
	usart_putc(VT_USART,'2');
    3bb4:	480a      	ldr	r0, [pc, #40]	; (3be0 <vt_clear_line+0x38>)
    3bb6:	2132      	movs	r1, #50	; 0x32
    3bb8:	f7ff ff5e 	bl	3a78 <usart_putc>
	usart_putc(VT_USART,'K');
    3bbc:	4808      	ldr	r0, [pc, #32]	; (3be0 <vt_clear_line+0x38>)
    3bbe:	214b      	movs	r1, #75	; 0x4b
    3bc0:	f7ff ff5a 	bl	3a78 <usart_putc>
	while (n){usart_putc(VT_USART,BS);n--;}
    3bc4:	e006      	b.n	3bd4 <vt_clear_line+0x2c>
    3bc6:	4806      	ldr	r0, [pc, #24]	; (3be0 <vt_clear_line+0x38>)
    3bc8:	2108      	movs	r1, #8
    3bca:	f7ff ff55 	bl	3a78 <usart_putc>
    3bce:	687b      	ldr	r3, [r7, #4]
    3bd0:	3b01      	subs	r3, #1
    3bd2:	607b      	str	r3, [r7, #4]
    3bd4:	687b      	ldr	r3, [r7, #4]
    3bd6:	2b00      	cmp	r3, #0
    3bd8:	d1f5      	bne.n	3bc6 <vt_clear_line+0x1e>
}
    3bda:	3708      	adds	r7, #8
    3bdc:	46bd      	mov	sp, r7
    3bde:	bd80      	pop	{r7, pc}
    3be0:	40004400 	.word	0x40004400

00003be4 <vt_ready>:

// vérifie si le terminal est prêt
int vt_ready(){
    3be4:	b480      	push	{r7}
    3be6:	af00      	add	r7, sp, #0
	return !(VT_PORT->IDR&VT_CTS_BIT);
    3be8:	4b06      	ldr	r3, [pc, #24]	; (3c04 <vt_ready+0x20>)
    3bea:	689b      	ldr	r3, [r3, #8]
    3bec:	f003 0301 	and.w	r3, r3, #1
    3bf0:	2b00      	cmp	r3, #0
    3bf2:	bf0c      	ite	eq
    3bf4:	2301      	moveq	r3, #1
    3bf6:	2300      	movne	r3, #0
    3bf8:	b2db      	uxtb	r3, r3
}
    3bfa:	4618      	mov	r0, r3
    3bfc:	46bd      	mov	sp, r7
    3bfe:	f85d 7b04 	ldr.w	r7, [sp], #4
    3c02:	4770      	bx	lr
    3c04:	40010800 	.word	0x40010800

00003c08 <vt_rx_enable>:

void vt_rx_enable(int enable){
    3c08:	b480      	push	{r7}
    3c0a:	b085      	sub	sp, #20
    3c0c:	af00      	add	r7, sp, #0
    3c0e:	6078      	str	r0, [r7, #4]
	char c;
	if (enable){
    3c10:	687b      	ldr	r3, [r7, #4]
    3c12:	2b00      	cmp	r3, #0
    3c14:	d006      	beq.n	3c24 <vt_rx_enable+0x1c>
		VT_USART->CR1|=USART_CR1_RXNEIE;
    3c16:	4a0a      	ldr	r2, [pc, #40]	; (3c40 <vt_rx_enable+0x38>)
    3c18:	4b09      	ldr	r3, [pc, #36]	; (3c40 <vt_rx_enable+0x38>)
    3c1a:	68db      	ldr	r3, [r3, #12]
    3c1c:	f043 0320 	orr.w	r3, r3, #32
    3c20:	60d3      	str	r3, [r2, #12]
    3c22:	e008      	b.n	3c36 <vt_rx_enable+0x2e>
	}else{
		c=VT_USART->DR;
    3c24:	4b06      	ldr	r3, [pc, #24]	; (3c40 <vt_rx_enable+0x38>)
    3c26:	685b      	ldr	r3, [r3, #4]
    3c28:	73fb      	strb	r3, [r7, #15]
		VT_USART->CR1&=~USART_CR1_RXNEIE;
    3c2a:	4a05      	ldr	r2, [pc, #20]	; (3c40 <vt_rx_enable+0x38>)
    3c2c:	4b04      	ldr	r3, [pc, #16]	; (3c40 <vt_rx_enable+0x38>)
    3c2e:	68db      	ldr	r3, [r3, #12]
    3c30:	f023 0320 	bic.w	r3, r3, #32
    3c34:	60d3      	str	r3, [r2, #12]
	}
}
    3c36:	3714      	adds	r7, #20
    3c38:	46bd      	mov	sp, r7
    3c3a:	f85d 7b04 	ldr.w	r7, [sp], #4
    3c3e:	4770      	bx	lr
    3c40:	40004400 	.word	0x40004400

00003c44 <USART2_handler>:

// interruption serial console
void VT_handler(){
    3c44:	b580      	push	{r7, lr}
    3c46:	af00      	add	r7, sp, #0
	if ((con.dev==SERIAL) && (VT_USART->SR&USART_SR_RXNE)){
    3c48:	4b08      	ldr	r3, [pc, #32]	; (3c6c <USART2_handler+0x28>)
    3c4a:	781b      	ldrb	r3, [r3, #0]
    3c4c:	2b01      	cmp	r3, #1
    3c4e:	d10c      	bne.n	3c6a <USART2_handler+0x26>
    3c50:	4b07      	ldr	r3, [pc, #28]	; (3c70 <USART2_handler+0x2c>)
    3c52:	681b      	ldr	r3, [r3, #0]
    3c54:	f003 0320 	and.w	r3, r3, #32
    3c58:	2b00      	cmp	r3, #0
    3c5a:	d006      	beq.n	3c6a <USART2_handler+0x26>
		con.insert(VT_USART->DR);
    3c5c:	4b03      	ldr	r3, [pc, #12]	; (3c6c <USART2_handler+0x28>)
    3c5e:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    3c60:	4a03      	ldr	r2, [pc, #12]	; (3c70 <USART2_handler+0x2c>)
    3c62:	6852      	ldr	r2, [r2, #4]
    3c64:	b2d2      	uxtb	r2, r2
    3c66:	4610      	mov	r0, r2
    3c68:	4798      	blx	r3
	}
}
    3c6a:	bd80      	pop	{r7, pc}
    3c6c:	2000018c 	.word	0x2000018c
    3c70:	40004400 	.word	0x40004400

Disassembly of section .user_code:

00004800 <blink>:
//#define _wait_svc_completion() while (ICSR & (1<<PENDSVSET)|(1<<);
#define _wait_timeout() ({while (timer);})



void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
    4800:	b480      	push	{r7}
    4802:	b085      	sub	sp, #20
    4804:	af00      	add	r7, sp, #0
	volatile unsigned int  delay=500;
    4806:	f44f 73fa 	mov.w	r3, #500	; 0x1f4
    480a:	60fb      	str	r3, [r7, #12]
	volatile unsigned int tm;
	volatile char c=0;
    480c:	2300      	movs	r3, #0
    480e:	71fb      	strb	r3, [r7, #7]
	
	_svc_call(SVC_PRINT,"blinking led, any key to stop.\n",0);
    4810:	4b1e      	ldr	r3, [pc, #120]	; (488c <blink+0x8c>)
    4812:	2200      	movs	r2, #0
    4814:	4618      	mov	r0, r3
    4816:	4611      	mov	r1, r2
    4818:	df08      	svc	8
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
    481a:	2300      	movs	r3, #0
    481c:	2200      	movs	r2, #0
    481e:	4618      	mov	r0, r3
    4820:	4611      	mov	r1, r2
    4822:	df02      	svc	2
		_svc_call(SVC_TIMER,&delay,NUL);
    4824:	f107 030c 	add.w	r3, r7, #12
    4828:	2200      	movs	r2, #0
    482a:	4618      	mov	r0, r3
    482c:	4611      	mov	r1, r2
    482e:	df03      	svc	3
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    4830:	f107 0308 	add.w	r3, r7, #8
    4834:	2200      	movs	r2, #0
    4836:	4618      	mov	r0, r3
    4838:	4611      	mov	r1, r2
    483a:	df04      	svc	4
    483c:	68bb      	ldr	r3, [r7, #8]
    483e:	2b00      	cmp	r3, #0
    4840:	d1f6      	bne.n	4830 <blink+0x30>
		_svc_call(SVC_LED_ON,NUL,NUL);
    4842:	2300      	movs	r3, #0
    4844:	2200      	movs	r2, #0
    4846:	4618      	mov	r0, r3
    4848:	4611      	mov	r1, r2
    484a:	df01      	svc	1
		_svc_call(SVC_TIMER,&delay,NUL);
    484c:	f107 030c 	add.w	r3, r7, #12
    4850:	2200      	movs	r2, #0
    4852:	4618      	mov	r0, r3
    4854:	4611      	mov	r1, r2
    4856:	df03      	svc	3
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
    4858:	f107 0308 	add.w	r3, r7, #8
    485c:	2200      	movs	r2, #0
    485e:	4618      	mov	r0, r3
    4860:	4611      	mov	r1, r2
    4862:	df04      	svc	4
    4864:	68bb      	ldr	r3, [r7, #8]
    4866:	2b00      	cmp	r3, #0
    4868:	d1f6      	bne.n	4858 <blink+0x58>
		_svc_call(SVC_CONIN,&c,NUL);
    486a:	1dfb      	adds	r3, r7, #7
    486c:	2200      	movs	r2, #0
    486e:	4618      	mov	r0, r3
    4870:	4611      	mov	r1, r2
    4872:	df05      	svc	5
		if (c) break;
    4874:	79fb      	ldrb	r3, [r7, #7]
    4876:	b2db      	uxtb	r3, r3
    4878:	2b00      	cmp	r3, #0
    487a:	d000      	beq.n	487e <blink+0x7e>
    487c:	e000      	b.n	4880 <blink+0x80>
	}
    487e:	e7cc      	b.n	481a <blink+0x1a>
}
    4880:	3714      	adds	r7, #20
    4882:	46bd      	mov	sp, r7
    4884:	f85d 7b04 	ldr.w	r7, [sp], #4
    4888:	4770      	bx	lr
    488a:	bf00      	nop
    488c:	00003c74 	.word	0x00003c74
