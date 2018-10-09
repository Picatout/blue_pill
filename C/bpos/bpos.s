
bpos.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <myvectors>:
       0:	00 50 00 20 45 0f 00 00 b5 0d 00 00 c5 0d 00 00     .P. E...........
      10:	d5 0d 00 00 e5 0d 00 00 f5 0d 00 00 35 0f 00 00     ............5...
      20:	35 0f 00 00 35 0f 00 00 35 0f 00 00 71 02 00 00     5...5...5...q...
      30:	35 0f 00 00 35 0f 00 00 15 0e 00 00 5d 03 00 00     5...5.......]...
      40:	35 0e 00 00 45 0e 00 00 65 0e 00 00 55 0e 00 00     5...E...e...U...
      50:	75 0e 00 00 85 0e 00 00 95 0e 00 00 a5 0e 00 00     u...............
      60:	b5 0e 00 00 c5 0e 00 00 d5 0e 00 00 e5 0e 00 00     ................
      70:	f5 0e 00 00 35 0f 00 00 35 0f 00 00 35 0f 00 00     ....5...5...5...
      80:	35 0f 00 00 35 0f 00 00 35 0f 00 00 35 0f 00 00     5...5...5...5...
      90:	35 0f 00 00 35 0f 00 00 35 0f 00 00 35 0f 00 00     5...5...5...5...
      a0:	35 0f 00 00 35 0f 00 00 35 0f 00 00 35 0f 00 00     5...5...5...5...
      b0:	35 0f 00 00 35 0f 00 00 35 0f 00 00 35 0f 00 00     5...5...5...5...
      c0:	35 0f 00 00 35 0f 00 00 35 0f 00 00 35 0f 00 00     5...5...5...5...
      d0:	35 0f 00 00 05 0f 00 00 69 08 00 00 25 0f 00 00     5.......i...%...
      e0:	35 0f 00 00 35 0f 00 00 35 0f 00 00 35 0f 00 00     5...5...5...5...
      f0:	35 0f 00 00 35 0f 00 00 35 0f 00 00 35 0f 00 00     5...5...5...5...
     100:	35 0f 00 00 35 0f 00 00 35 0f 00 00 35 0f 00 00     5...5...5...5...
     110:	35 0f 00 00 35 0f 00 00 35 0f 00 00 35 0f 00 00     5...5...5...5...
     120:	35 0f 00 00 35 0f 00 00 35 0f 00 00 35 0f 00 00     5...5...5...5...

00000130 <strcmp>:
#include "../include/nvic.h"
#include "../include/usart.h"
#include "../include/console.h"
#include "svcall.h"

int strcmp(const char * s1, const char * s2){
     130:	b480      	push	{r7}
     132:	b085      	sub	sp, #20
     134:	af00      	add	r7, sp, #0
     136:	6078      	str	r0, [r7, #4]
     138:	6039      	str	r1, [r7, #0]
	int result=0;
     13a:	2300      	movs	r3, #0
     13c:	60fb      	str	r3, [r7, #12]
	while (*s1 && *s2){
     13e:	e018      	b.n	172 <strcmp+0x42>
		if (*s1<*s2){
     140:	687b      	ldr	r3, [r7, #4]
     142:	781a      	ldrb	r2, [r3, #0]
     144:	683b      	ldr	r3, [r7, #0]
     146:	781b      	ldrb	r3, [r3, #0]
     148:	429a      	cmp	r2, r3
     14a:	d203      	bcs.n	154 <strcmp+0x24>
			result=-1;
     14c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     150:	60fb      	str	r3, [r7, #12]
			break;
     152:	e016      	b.n	182 <strcmp+0x52>
		}else if (*s1>*s2){
     154:	687b      	ldr	r3, [r7, #4]
     156:	781a      	ldrb	r2, [r3, #0]
     158:	683b      	ldr	r3, [r7, #0]
     15a:	781b      	ldrb	r3, [r3, #0]
     15c:	429a      	cmp	r2, r3
     15e:	d902      	bls.n	166 <strcmp+0x36>
			result=1;
     160:	2301      	movs	r3, #1
     162:	60fb      	str	r3, [r7, #12]
			break;
     164:	e00d      	b.n	182 <strcmp+0x52>
		}
		s1++;
     166:	687b      	ldr	r3, [r7, #4]
     168:	3301      	adds	r3, #1
     16a:	607b      	str	r3, [r7, #4]
		s2++;
     16c:	683b      	ldr	r3, [r7, #0]
     16e:	3301      	adds	r3, #1
     170:	603b      	str	r3, [r7, #0]
#include "../include/console.h"
#include "svcall.h"

int strcmp(const char * s1, const char * s2){
	int result=0;
	while (*s1 && *s2){
     172:	687b      	ldr	r3, [r7, #4]
     174:	781b      	ldrb	r3, [r3, #0]
     176:	2b00      	cmp	r3, #0
     178:	d003      	beq.n	182 <strcmp+0x52>
     17a:	683b      	ldr	r3, [r7, #0]
     17c:	781b      	ldrb	r3, [r3, #0]
     17e:	2b00      	cmp	r3, #0
     180:	d1de      	bne.n	140 <strcmp+0x10>
			break;
		}
		s1++;
		s2++;
	}
	if (!result){
     182:	68fb      	ldr	r3, [r7, #12]
     184:	2b00      	cmp	r3, #0
     186:	d115      	bne.n	1b4 <strcmp+0x84>
		if (!*s1 && *s2){
     188:	687b      	ldr	r3, [r7, #4]
     18a:	781b      	ldrb	r3, [r3, #0]
     18c:	2b00      	cmp	r3, #0
     18e:	d107      	bne.n	1a0 <strcmp+0x70>
     190:	683b      	ldr	r3, [r7, #0]
     192:	781b      	ldrb	r3, [r3, #0]
     194:	2b00      	cmp	r3, #0
     196:	d003      	beq.n	1a0 <strcmp+0x70>
			result=-1;
     198:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     19c:	60fb      	str	r3, [r7, #12]
     19e:	e009      	b.n	1b4 <strcmp+0x84>
		}else if (*s1 && !*s2) {
     1a0:	687b      	ldr	r3, [r7, #4]
     1a2:	781b      	ldrb	r3, [r3, #0]
     1a4:	2b00      	cmp	r3, #0
     1a6:	d005      	beq.n	1b4 <strcmp+0x84>
     1a8:	683b      	ldr	r3, [r7, #0]
     1aa:	781b      	ldrb	r3, [r3, #0]
     1ac:	2b00      	cmp	r3, #0
     1ae:	d101      	bne.n	1b4 <strcmp+0x84>
			result=1;
     1b0:	2301      	movs	r3, #1
     1b2:	60fb      	str	r3, [r7, #12]
		}
	}
	return result;
     1b4:	68fb      	ldr	r3, [r7, #12]
}
     1b6:	4618      	mov	r0, r3
     1b8:	3714      	adds	r7, #20
     1ba:	46bd      	mov	sp, r7
     1bc:	f85d 7b04 	ldr.w	r7, [sp], #4
     1c0:	4770      	bx	lr
     1c2:	bf00      	nop

000001c4 <digit>:

int digit(char c){
     1c4:	b480      	push	{r7}
     1c6:	b083      	sub	sp, #12
     1c8:	af00      	add	r7, sp, #0
     1ca:	4603      	mov	r3, r0
     1cc:	71fb      	strb	r3, [r7, #7]
   return ((c>='0') && (c<='9'));
     1ce:	79fb      	ldrb	r3, [r7, #7]
     1d0:	2b2f      	cmp	r3, #47	; 0x2f
     1d2:	d904      	bls.n	1de <digit+0x1a>
     1d4:	79fb      	ldrb	r3, [r7, #7]
     1d6:	2b39      	cmp	r3, #57	; 0x39
     1d8:	d801      	bhi.n	1de <digit+0x1a>
     1da:	2301      	movs	r3, #1
     1dc:	e000      	b.n	1e0 <digit+0x1c>
     1de:	2300      	movs	r3, #0
}
     1e0:	4618      	mov	r0, r3
     1e2:	370c      	adds	r7, #12
     1e4:	46bd      	mov	sp, r7
     1e6:	f85d 7b04 	ldr.w	r7, [sp], #4
     1ea:	4770      	bx	lr

000001ec <atoi>:

int atoi(const char *str){
     1ec:	b580      	push	{r7, lr}
     1ee:	b084      	sub	sp, #16
     1f0:	af00      	add	r7, sp, #0
     1f2:	6078      	str	r0, [r7, #4]
	int n=0,sign=1;
     1f4:	2300      	movs	r3, #0
     1f6:	60fb      	str	r3, [r7, #12]
     1f8:	2301      	movs	r3, #1
     1fa:	60bb      	str	r3, [r7, #8]
	while (*str && (*str==SPACE)) str++;
     1fc:	e002      	b.n	204 <atoi+0x18>
     1fe:	687b      	ldr	r3, [r7, #4]
     200:	3301      	adds	r3, #1
     202:	607b      	str	r3, [r7, #4]
     204:	687b      	ldr	r3, [r7, #4]
     206:	781b      	ldrb	r3, [r3, #0]
     208:	2b00      	cmp	r3, #0
     20a:	d003      	beq.n	214 <atoi+0x28>
     20c:	687b      	ldr	r3, [r7, #4]
     20e:	781b      	ldrb	r3, [r3, #0]
     210:	2b20      	cmp	r3, #32
     212:	d0f4      	beq.n	1fe <atoi+0x12>
	if (*str=='-'){
     214:	687b      	ldr	r3, [r7, #4]
     216:	781b      	ldrb	r3, [r3, #0]
     218:	2b2d      	cmp	r3, #45	; 0x2d
     21a:	d105      	bne.n	228 <atoi+0x3c>
		sign=-1;
     21c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     220:	60bb      	str	r3, [r7, #8]
		str++;
     222:	687b      	ldr	r3, [r7, #4]
     224:	3301      	adds	r3, #1
     226:	607b      	str	r3, [r7, #4]
	}
	while (*str && digit(*str)){
     228:	e00d      	b.n	246 <atoi+0x5a>
		n=n*10+(*str-'0');
     22a:	68fa      	ldr	r2, [r7, #12]
     22c:	4613      	mov	r3, r2
     22e:	009b      	lsls	r3, r3, #2
     230:	4413      	add	r3, r2
     232:	005b      	lsls	r3, r3, #1
     234:	461a      	mov	r2, r3
     236:	687b      	ldr	r3, [r7, #4]
     238:	781b      	ldrb	r3, [r3, #0]
     23a:	3b30      	subs	r3, #48	; 0x30
     23c:	4413      	add	r3, r2
     23e:	60fb      	str	r3, [r7, #12]
		str++;
     240:	687b      	ldr	r3, [r7, #4]
     242:	3301      	adds	r3, #1
     244:	607b      	str	r3, [r7, #4]
	while (*str && (*str==SPACE)) str++;
	if (*str=='-'){
		sign=-1;
		str++;
	}
	while (*str && digit(*str)){
     246:	687b      	ldr	r3, [r7, #4]
     248:	781b      	ldrb	r3, [r3, #0]
     24a:	2b00      	cmp	r3, #0
     24c:	d007      	beq.n	25e <atoi+0x72>
     24e:	687b      	ldr	r3, [r7, #4]
     250:	781b      	ldrb	r3, [r3, #0]
     252:	4618      	mov	r0, r3
     254:	f7ff ffb6 	bl	1c4 <digit>
     258:	4603      	mov	r3, r0
     25a:	2b00      	cmp	r3, #0
     25c:	d1e5      	bne.n	22a <atoi+0x3e>
		n=n*10+(*str-'0');
		str++;
	}
	return sign*n;
     25e:	68bb      	ldr	r3, [r7, #8]
     260:	68fa      	ldr	r2, [r7, #12]
     262:	fb02 f303 	mul.w	r3, r2, r3
}
     266:	4618      	mov	r0, r3
     268:	3710      	adds	r7, #16
     26a:	46bd      	mov	sp, r7
     26c:	bd80      	pop	{r7, pc}
     26e:	bf00      	nop

00000270 <SVC_handler>:
static void move(char *src , char *dest, int len);
static void word();



void __attribute__((__interrupt__)) SVC_handler(){
     270:	4668      	mov	r0, sp
     272:	f020 0107 	bic.w	r1, r0, #7
     276:	468d      	mov	sp, r1
     278:	b581      	push	{r0, r7, lr}
     27a:	b085      	sub	sp, #20
     27c:	af00      	add	r7, sp, #0
	int svc_id, *arg1;
	void **argv; 
	asm volatile (
     27e:	f3ef 8009 	mrs	r0, PSP
     282:	6981      	ldr	r1, [r0, #24]
     284:	f1a1 0102 	sub.w	r1, r1, #2
     288:	7809      	ldrb	r1, [r1, #0]
     28a:	6802      	ldr	r2, [r0, #0]
     28c:	6843      	ldr	r3, [r0, #4]
     28e:	60f9      	str	r1, [r7, #12]
     290:	60ba      	str	r2, [r7, #8]
     292:	607b      	str	r3, [r7, #4]
    "ldrb %[svc_id], [r1]\n" // charge l'octet faible i.e. no de service
    "ldr %[arg1],[r0]\n"
    "ldr %[argv],[r0,#4]\n"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [argv] "=r" (argv) 
    );
	switch (svc_id){
     294:	68fb      	ldr	r3, [r7, #12]
     296:	2b09      	cmp	r3, #9
     298:	d850      	bhi.n	33c <SVC_handler+0xcc>
     29a:	a201      	add	r2, pc, #4	; (adr r2, 2a0 <SVC_handler+0x30>)
     29c:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     2a0:	00000335 	.word	0x00000335
     2a4:	000002c9 	.word	0x000002c9
     2a8:	000002d3 	.word	0x000002d3
     2ac:	000002dd 	.word	0x000002dd
     2b0:	000002e7 	.word	0x000002e7
     2b4:	000002f1 	.word	0x000002f1
     2b8:	000002ff 	.word	0x000002ff
     2bc:	0000030b 	.word	0x0000030b
     2c0:	0000031f 	.word	0x0000031f
     2c4:	00000327 	.word	0x00000327
	case SVC_LED_ON: 
		GPIOC_BRR=GRN_LED;
     2c8:	4b1f      	ldr	r3, [pc, #124]	; (348 <SVC_handler+0xd8>)
     2ca:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     2ce:	601a      	str	r2, [r3, #0]
		break;
     2d0:	e034      	b.n	33c <SVC_handler+0xcc>
	case SVC_LED_OFF:
		GPIOC_BSRR=GRN_LED;
     2d2:	4b1e      	ldr	r3, [pc, #120]	; (34c <SVC_handler+0xdc>)
     2d4:	f44f 5200 	mov.w	r2, #8192	; 0x2000
     2d8:	601a      	str	r2, [r3, #0]
		break;
     2da:	e02f      	b.n	33c <SVC_handler+0xcc>
	case SVC_TIMER: 
		timer=*(unsigned*)arg1;
     2dc:	68bb      	ldr	r3, [r7, #8]
     2de:	681b      	ldr	r3, [r3, #0]
     2e0:	4a1b      	ldr	r2, [pc, #108]	; (350 <SVC_handler+0xe0>)
     2e2:	6013      	str	r3, [r2, #0]
		break;
     2e4:	e02a      	b.n	33c <SVC_handler+0xcc>
	case SVC_GET_TIMER:
		*(unsigned*)arg1=timer;
     2e6:	4b1a      	ldr	r3, [pc, #104]	; (350 <SVC_handler+0xe0>)
     2e8:	681a      	ldr	r2, [r3, #0]
     2ea:	68bb      	ldr	r3, [r7, #8]
     2ec:	601a      	str	r2, [r3, #0]
		break;
     2ee:	e025      	b.n	33c <SVC_handler+0xcc>
	case SVC_CONIN:
		*(char *)arg1=conin();
     2f0:	f000 faf4 	bl	8dc <conin>
     2f4:	4603      	mov	r3, r0
     2f6:	461a      	mov	r2, r3
     2f8:	68bb      	ldr	r3, [r7, #8]
     2fa:	701a      	strb	r2, [r3, #0]
		break;
     2fc:	e01e      	b.n	33c <SVC_handler+0xcc>
	case SVC_CONOUT:
		conout(*(char *)arg1);
     2fe:	68bb      	ldr	r3, [r7, #8]
     300:	781b      	ldrb	r3, [r3, #0]
     302:	4618      	mov	r0, r3
     304:	f000 fada 	bl	8bc <conout>
		break;
     308:	e018      	b.n	33c <SVC_handler+0xcc>
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)argv,*(unsigned *)arg1);
     30a:	68bb      	ldr	r3, [r7, #8]
     30c:	681b      	ldr	r3, [r3, #0]
     30e:	6878      	ldr	r0, [r7, #4]
     310:	4619      	mov	r1, r3
     312:	f000 fb5b 	bl	9cc <read_line>
     316:	4602      	mov	r2, r0
     318:	68bb      	ldr	r3, [r7, #8]
     31a:	601a      	str	r2, [r3, #0]
		break;
     31c:	e00e      	b.n	33c <SVC_handler+0xcc>
	case SVC_PRINT:
		print((const char*)arg1);
     31e:	68b8      	ldr	r0, [r7, #8]
     320:	f000 fafe 	bl	920 <print>
		break;
     324:	e00a      	b.n	33c <SVC_handler+0xcc>
	case SVC_PRIVILIGED:
		asm volatile(
     326:	f3ef 8014 	mrs	r0, CONTROL
     32a:	f020 0000 	bic.w	r0, r0, #0
     32e:	f380 8814 	msr	CONTROL, r0
		"mrs r0,CONTROL\n"
		"bic r0,#0\n"       // bit 0 sélectionne le niveau de privilège
		"msr CONTROL, r0\n"
		);
		break;
     332:	e003      	b.n	33c <SVC_handler+0xcc>
    case SVC_RESET:
	    _reset_mcu();
     334:	4b07      	ldr	r3, [pc, #28]	; (354 <SVC_handler+0xe4>)
     336:	4a08      	ldr	r2, [pc, #32]	; (358 <SVC_handler+0xe8>)
     338:	601a      	str	r2, [r3, #0]
	    break;
     33a:	bf00      	nop
	}	
}
     33c:	3714      	adds	r7, #20
     33e:	46bd      	mov	sp, r7
     340:	e8bd 4081 	ldmia.w	sp!, {r0, r7, lr}
     344:	4685      	mov	sp, r0
     346:	4770      	bx	lr
     348:	40011014 	.word	0x40011014
     34c:	40011010 	.word	0x40011010
     350:	20000008 	.word	0x20000008
     354:	e000ed0c 	.word	0xe000ed0c
     358:	05fa0004 	.word	0x05fa0004

0000035c <STK_handler>:

// interruption coretimer
void __attribute__((__interrupt__)) STK_handler(){
     35c:	4668      	mov	r0, sp
     35e:	f020 0107 	bic.w	r1, r0, #7
     362:	468d      	mov	sp, r1
     364:	b481      	push	{r0, r7}
     366:	af00      	add	r7, sp, #0
	ticks++;
     368:	4b08      	ldr	r3, [pc, #32]	; (38c <STK_handler+0x30>)
     36a:	681b      	ldr	r3, [r3, #0]
     36c:	3301      	adds	r3, #1
     36e:	4a07      	ldr	r2, [pc, #28]	; (38c <STK_handler+0x30>)
     370:	6013      	str	r3, [r2, #0]
	if (timer) {timer--;}
     372:	4b07      	ldr	r3, [pc, #28]	; (390 <STK_handler+0x34>)
     374:	681b      	ldr	r3, [r3, #0]
     376:	2b00      	cmp	r3, #0
     378:	d004      	beq.n	384 <STK_handler+0x28>
     37a:	4b05      	ldr	r3, [pc, #20]	; (390 <STK_handler+0x34>)
     37c:	681b      	ldr	r3, [r3, #0]
     37e:	3b01      	subs	r3, #1
     380:	4a03      	ldr	r2, [pc, #12]	; (390 <STK_handler+0x34>)
     382:	6013      	str	r3, [r2, #0]
}
     384:	46bd      	mov	sp, r7
     386:	bc81      	pop	{r0, r7}
     388:	4685      	mov	sp, r0
     38a:	4770      	bx	lr
     38c:	20000004 	.word	0x20000004
     390:	20000008 	.word	0x20000008

00000394 <set_sysclock>:


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
     394:	b480      	push	{r7}
     396:	af00      	add	r7, sp, #0
	 // active l'oscillateur externe
	RCC_CR|=1<<RCC_CR_HSEON;
     398:	4a1a      	ldr	r2, [pc, #104]	; (404 <set_sysclock+0x70>)
     39a:	4b1a      	ldr	r3, [pc, #104]	; (404 <set_sysclock+0x70>)
     39c:	681b      	ldr	r3, [r3, #0]
     39e:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
     3a2:	6013      	str	r3, [r2, #0]
	 // attend que l'oscillateur soit prêt
   while (! (RCC_CR & (1<<RCC_CR_HSERDY)));
     3a4:	bf00      	nop
     3a6:	4b17      	ldr	r3, [pc, #92]	; (404 <set_sysclock+0x70>)
     3a8:	681b      	ldr	r3, [r3, #0]
     3aa:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
     3ae:	2b00      	cmp	r3, #0
     3b0:	d0f9      	beq.n	3a6 <set_sysclock+0x12>
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
     3b2:	4a15      	ldr	r2, [pc, #84]	; (408 <set_sysclock+0x74>)
     3b4:	4b14      	ldr	r3, [pc, #80]	; (408 <set_sysclock+0x74>)
     3b6:	681b      	ldr	r3, [r3, #0]
     3b8:	f443 13e8 	orr.w	r3, r3, #1900544	; 0x1d0000
     3bc:	6013      	str	r3, [r2, #0]
    // active le PLL
    RCC_CR|=1<<RCC_CR_PLLON;
     3be:	4a11      	ldr	r2, [pc, #68]	; (404 <set_sysclock+0x70>)
     3c0:	4b10      	ldr	r3, [pc, #64]	; (404 <set_sysclock+0x70>)
     3c2:	681b      	ldr	r3, [r3, #0]
     3c4:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
     3c8:	6013      	str	r3, [r2, #0]
    // Attend que le PLL soit prêt
    while (! (RCC_CR & (1<<RCC_CR_PLLRDY)));
     3ca:	bf00      	nop
     3cc:	4b0d      	ldr	r3, [pc, #52]	; (404 <set_sysclock+0x70>)
     3ce:	681b      	ldr	r3, [r3, #0]
     3d0:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
     3d4:	2b00      	cmp	r3, #0
     3d6:	d0f9      	beq.n	3cc <set_sysclock+0x38>
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR|=WAIT_2_CY;
     3d8:	4a0c      	ldr	r2, [pc, #48]	; (40c <set_sysclock+0x78>)
     3da:	4b0c      	ldr	r3, [pc, #48]	; (40c <set_sysclock+0x78>)
     3dc:	681b      	ldr	r3, [r3, #0]
     3de:	f043 0302 	orr.w	r3, r3, #2
     3e2:	6013      	str	r3, [r2, #0]
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR|=PLL_CLK<<RCC_CFGR_SW;
     3e4:	4a08      	ldr	r2, [pc, #32]	; (408 <set_sysclock+0x74>)
     3e6:	4b08      	ldr	r3, [pc, #32]	; (408 <set_sysclock+0x74>)
     3e8:	681b      	ldr	r3, [r3, #0]
     3ea:	f043 0302 	orr.w	r3, r3, #2
     3ee:	6013      	str	r3, [r2, #0]
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR|=PPRECLK_DIV2<<RCC_CFGR_PPRE1;
     3f0:	4a05      	ldr	r2, [pc, #20]	; (408 <set_sysclock+0x74>)
     3f2:	4b05      	ldr	r3, [pc, #20]	; (408 <set_sysclock+0x74>)
     3f4:	681b      	ldr	r3, [r3, #0]
     3f6:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
     3fa:	6013      	str	r3, [r2, #0]
}
     3fc:	46bd      	mov	sp, r7
     3fe:	f85d 7b04 	ldr.w	r7, [sp], #4
     402:	4770      	bx	lr
     404:	40021000 	.word	0x40021000
     408:	40021004 	.word	0x40021004
     40c:	40022000 	.word	0x40022000

00000410 <config_systicks>:

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
     410:	b480      	push	{r7}
     412:	af00      	add	r7, sp, #0
	STK_LOAD=MSEC_DLY-1;
     414:	4b05      	ldr	r3, [pc, #20]	; (42c <config_systicks+0x1c>)
     416:	f242 3227 	movw	r2, #8999	; 0x2327
     41a:	601a      	str	r2, [r3, #0]
	STK_CTRL=(1<<STK_TICKINT)|(1<<STK_ENABLE);
     41c:	4b04      	ldr	r3, [pc, #16]	; (430 <config_systicks+0x20>)
     41e:	2203      	movs	r2, #3
     420:	601a      	str	r2, [r3, #0]
}
     422:	46bd      	mov	sp, r7
     424:	f85d 7b04 	ldr.w	r7, [sp], #4
     428:	4770      	bx	lr
     42a:	bf00      	nop
     42c:	e000e014 	.word	0xe000e014
     430:	e000e010 	.word	0xe000e010

00000434 <port_c_setup>:

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
     434:	b480      	push	{r7}
     436:	af00      	add	r7, sp, #0
	RCC_APB2ENR|=1<<GPIOC_EN;
     438:	4a06      	ldr	r2, [pc, #24]	; (454 <port_c_setup+0x20>)
     43a:	4b06      	ldr	r3, [pc, #24]	; (454 <port_c_setup+0x20>)
     43c:	681b      	ldr	r3, [r3, #0]
     43e:	f043 0310 	orr.w	r3, r3, #16
     442:	6013      	str	r3, [r2, #0]
	GPIOC_CRH=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
     444:	4b04      	ldr	r3, [pc, #16]	; (458 <port_c_setup+0x24>)
     446:	4a05      	ldr	r2, [pc, #20]	; (45c <port_c_setup+0x28>)
     448:	601a      	str	r2, [r3, #0]
}
     44a:	46bd      	mov	sp, r7
     44c:	f85d 7b04 	ldr.w	r7, [sp], #4
     450:	4770      	bx	lr
     452:	bf00      	nop
     454:	40021018 	.word	0x40021018
     458:	40011004 	.word	0x40011004
     45c:	44644444 	.word	0x44644444

00000460 <cmd_reset>:

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
     460:	b480      	push	{r7}
     462:	af00      	add	r7, sp, #0
	_svc_call(SVC_RESET,NUL,NUL);
     464:	2300      	movs	r3, #0
     466:	2200      	movs	r2, #0
     468:	4618      	mov	r0, r3
     46a:	4611      	mov	r1, r2
     46c:	df00      	svc	0
}
     46e:	46bd      	mov	sp, r7
     470:	f85d 7b04 	ldr.w	r7, [sp], #4
     474:	4770      	bx	lr
     476:	bf00      	nop

00000478 <cmd_led_on>:

// allume la LED
static void cmd_led_on(){
     478:	b480      	push	{r7}
     47a:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_ON,NUL,NUL);
     47c:	2300      	movs	r3, #0
     47e:	2200      	movs	r2, #0
     480:	4618      	mov	r0, r3
     482:	4611      	mov	r1, r2
     484:	df01      	svc	1
}
     486:	46bd      	mov	sp, r7
     488:	f85d 7b04 	ldr.w	r7, [sp], #4
     48c:	4770      	bx	lr
     48e:	bf00      	nop

00000490 <cmd_led_off>:

// éteint la LED
static void cmd_led_off(){
     490:	b480      	push	{r7}
     492:	af00      	add	r7, sp, #0
	_svc_call(SVC_LED_OFF,NUL,NUL);
     494:	2300      	movs	r3, #0
     496:	2200      	movs	r2, #0
     498:	4618      	mov	r0, r3
     49a:	4611      	mov	r1, r2
     49c:	df02      	svc	2
}
     49e:	46bd      	mov	sp, r7
     4a0:	f85d 7b04 	ldr.w	r7, [sp], #4
     4a4:	4770      	bx	lr
     4a6:	bf00      	nop

000004a8 <cmd_set_timer>:

// démarre la minuterie
static void cmd_set_timer(){
     4a8:	b580      	push	{r7, lr}
     4aa:	b082      	sub	sp, #8
     4ac:	af00      	add	r7, sp, #0
	int n;
	word();
     4ae:	f000 f945 	bl	73c <word>
	n=atoi(pad);
     4b2:	4806      	ldr	r0, [pc, #24]	; (4cc <cmd_set_timer+0x24>)
     4b4:	f7ff fe9a 	bl	1ec <atoi>
     4b8:	4603      	mov	r3, r0
     4ba:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_TIMER,&n,NUL);
     4bc:	1d3b      	adds	r3, r7, #4
     4be:	2200      	movs	r2, #0
     4c0:	4618      	mov	r0, r3
     4c2:	4611      	mov	r1, r2
     4c4:	df03      	svc	3
}
     4c6:	3708      	adds	r7, #8
     4c8:	46bd      	mov	sp, r7
     4ca:	bd80      	pop	{r7, pc}
     4cc:	2000005c 	.word	0x2000005c

000004d0 <cmd_wait_time_out>:

// attend l'expiration de la minuterie
static void cmd_wait_time_out(){
     4d0:	b480      	push	{r7}
     4d2:	b083      	sub	sp, #12
     4d4:	af00      	add	r7, sp, #0
	unsigned t=1;
     4d6:	2301      	movs	r3, #1
     4d8:	607b      	str	r3, [r7, #4]
	while (t){
     4da:	e004      	b.n	4e6 <cmd_wait_time_out+0x16>
		_svc_call(SVC_GET_TIMER,&t,NUL);
     4dc:	1d3b      	adds	r3, r7, #4
     4de:	2200      	movs	r2, #0
     4e0:	4618      	mov	r0, r3
     4e2:	4611      	mov	r1, r2
     4e4:	df04      	svc	4
}

// attend l'expiration de la minuterie
static void cmd_wait_time_out(){
	unsigned t=1;
	while (t){
     4e6:	687b      	ldr	r3, [r7, #4]
     4e8:	2b00      	cmp	r3, #0
     4ea:	d1f7      	bne.n	4dc <cmd_wait_time_out+0xc>
		_svc_call(SVC_GET_TIMER,&t,NUL);
	}
}
     4ec:	370c      	adds	r7, #12
     4ee:	46bd      	mov	sp, r7
     4f0:	f85d 7b04 	ldr.w	r7, [sp], #4
     4f4:	4770      	bx	lr
     4f6:	bf00      	nop

000004f8 <cmd_getc>:

// reçoit un caractère dans pad
static void cmd_getc(){
     4f8:	b480      	push	{r7}
     4fa:	b083      	sub	sp, #12
     4fc:	af00      	add	r7, sp, #0
	char n=0;
     4fe:	2300      	movs	r3, #0
     500:	71fb      	strb	r3, [r7, #7]
	while (!n){
     502:	e004      	b.n	50e <cmd_getc+0x16>
		_svc_call(SVC_CONIN,&n,NUL);
     504:	1dfb      	adds	r3, r7, #7
     506:	2200      	movs	r2, #0
     508:	4618      	mov	r0, r3
     50a:	4611      	mov	r1, r2
     50c:	df05      	svc	5
}

// reçoit un caractère dans pad
static void cmd_getc(){
	char n=0;
	while (!n){
     50e:	79fb      	ldrb	r3, [r7, #7]
     510:	2b00      	cmp	r3, #0
     512:	d0f7      	beq.n	504 <cmd_getc+0xc>
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
     514:	79fa      	ldrb	r2, [r7, #7]
     516:	4b05      	ldr	r3, [pc, #20]	; (52c <cmd_getc+0x34>)
     518:	701a      	strb	r2, [r3, #0]
	pad[1]=0;
     51a:	4b04      	ldr	r3, [pc, #16]	; (52c <cmd_getc+0x34>)
     51c:	2200      	movs	r2, #0
     51e:	705a      	strb	r2, [r3, #1]
}
     520:	370c      	adds	r7, #12
     522:	46bd      	mov	sp, r7
     524:	f85d 7b04 	ldr.w	r7, [sp], #4
     528:	4770      	bx	lr
     52a:	bf00      	nop
     52c:	2000005c 	.word	0x2000005c

00000530 <cmd_putc>:

// envoie le caractère en première position du pad
static void cmd_putc(){
     530:	b580      	push	{r7, lr}
     532:	b082      	sub	sp, #8
     534:	af00      	add	r7, sp, #0
	int cmd_id;
	word();
     536:	f000 f901 	bl	73c <word>
	cmd_id=search_command(pad);
     53a:	480a      	ldr	r0, [pc, #40]	; (564 <cmd_putc+0x34>)
     53c:	f000 f84e 	bl	5dc <search_command>
     540:	6078      	str	r0, [r7, #4]
	if (cmd_id>-1) commands[cmd_id].fn();
     542:	687b      	ldr	r3, [r7, #4]
     544:	2b00      	cmp	r3, #0
     546:	db05      	blt.n	554 <cmd_putc+0x24>
     548:	4a07      	ldr	r2, [pc, #28]	; (568 <cmd_putc+0x38>)
     54a:	687b      	ldr	r3, [r7, #4]
     54c:	00db      	lsls	r3, r3, #3
     54e:	4413      	add	r3, r2
     550:	685b      	ldr	r3, [r3, #4]
     552:	4798      	blx	r3
	_svc_call(SVC_CONOUT,pad,NUL);
     554:	4b03      	ldr	r3, [pc, #12]	; (564 <cmd_putc+0x34>)
     556:	2200      	movs	r2, #0
     558:	4618      	mov	r0, r3
     55a:	4611      	mov	r1, r2
     55c:	df06      	svc	6
}
     55e:	3708      	adds	r7, #8
     560:	46bd      	mov	sp, r7
     562:	bd80      	pop	{r7, pc}
     564:	2000005c 	.word	0x2000005c
     568:	00001268 	.word	0x00001268

0000056c <cmd_readln>:

static void cmd_readln(){
     56c:	b580      	push	{r7, lr}
     56e:	b082      	sub	sp, #8
     570:	af00      	add	r7, sp, #0
	unsigned llen=80;
     572:	2350      	movs	r3, #80	; 0x50
     574:	607b      	str	r3, [r7, #4]
	_svc_call(SVC_READLN,&llen,pad);
     576:	1d3b      	adds	r3, r7, #4
     578:	4a04      	ldr	r2, [pc, #16]	; (58c <cmd_readln+0x20>)
     57a:	4618      	mov	r0, r3
     57c:	4611      	mov	r1, r2
     57e:	df07      	svc	7
	print(pad);
     580:	4802      	ldr	r0, [pc, #8]	; (58c <cmd_readln+0x20>)
     582:	f000 f9cd 	bl	920 <print>
}
     586:	3708      	adds	r7, #8
     588:	46bd      	mov	sp, r7
     58a:	bd80      	pop	{r7, pc}
     58c:	2000005c 	.word	0x2000005c

00000590 <cmd_print>:

static void cmd_print(){
     590:	b580      	push	{r7, lr}
     592:	af00      	add	r7, sp, #0
	in=skip(tib,in,SPACE);
     594:	4b0f      	ldr	r3, [pc, #60]	; (5d4 <cmd_print+0x44>)
     596:	681b      	ldr	r3, [r3, #0]
     598:	480f      	ldr	r0, [pc, #60]	; (5d8 <cmd_print+0x48>)
     59a:	4619      	mov	r1, r3
     59c:	2220      	movs	r2, #32
     59e:	f000 f84b 	bl	638 <skip>
     5a2:	4603      	mov	r3, r0
     5a4:	461a      	mov	r2, r3
     5a6:	4b0b      	ldr	r3, [pc, #44]	; (5d4 <cmd_print+0x44>)
     5a8:	601a      	str	r2, [r3, #0]
	_svc_call(SVC_PRINT,&tib[in],NUL);
     5aa:	4b0a      	ldr	r3, [pc, #40]	; (5d4 <cmd_print+0x44>)
     5ac:	681b      	ldr	r3, [r3, #0]
     5ae:	4a0a      	ldr	r2, [pc, #40]	; (5d8 <cmd_print+0x48>)
     5b0:	4413      	add	r3, r2
     5b2:	2200      	movs	r2, #0
     5b4:	4618      	mov	r0, r3
     5b6:	4611      	mov	r1, r2
     5b8:	df08      	svc	8
	while (tib[in]) in++;
     5ba:	e004      	b.n	5c6 <cmd_print+0x36>
     5bc:	4b05      	ldr	r3, [pc, #20]	; (5d4 <cmd_print+0x44>)
     5be:	681b      	ldr	r3, [r3, #0]
     5c0:	3301      	adds	r3, #1
     5c2:	4a04      	ldr	r2, [pc, #16]	; (5d4 <cmd_print+0x44>)
     5c4:	6013      	str	r3, [r2, #0]
     5c6:	4b03      	ldr	r3, [pc, #12]	; (5d4 <cmd_print+0x44>)
     5c8:	681b      	ldr	r3, [r3, #0]
     5ca:	4a03      	ldr	r2, [pc, #12]	; (5d8 <cmd_print+0x48>)
     5cc:	5cd3      	ldrb	r3, [r2, r3]
     5ce:	2b00      	cmp	r3, #0
     5d0:	d1f4      	bne.n	5bc <cmd_print+0x2c>
}
     5d2:	bd80      	pop	{r7, pc}
     5d4:	200000ac 	.word	0x200000ac
     5d8:	2000000c 	.word	0x2000000c

000005dc <search_command>:
	{"print",cmd_print},
	{NUL,NUL}
};


int search_command(const char * name){
     5dc:	b580      	push	{r7, lr}
     5de:	b084      	sub	sp, #16
     5e0:	af00      	add	r7, sp, #0
     5e2:	6078      	str	r0, [r7, #4]
	int i=0;
     5e4:	2300      	movs	r3, #0
     5e6:	60fb      	str	r3, [r7, #12]
	while (commands[i].fn){
     5e8:	e00e      	b.n	608 <search_command+0x2c>
		if (!strcmp(commands[i].name,name)){
     5ea:	4a12      	ldr	r2, [pc, #72]	; (634 <search_command+0x58>)
     5ec:	68fb      	ldr	r3, [r7, #12]
     5ee:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
     5f2:	4618      	mov	r0, r3
     5f4:	6879      	ldr	r1, [r7, #4]
     5f6:	f7ff fd9b 	bl	130 <strcmp>
     5fa:	4603      	mov	r3, r0
     5fc:	2b00      	cmp	r3, #0
     5fe:	d100      	bne.n	602 <search_command+0x26>
			break;
     600:	e009      	b.n	616 <search_command+0x3a>
		}
		i++;
     602:	68fb      	ldr	r3, [r7, #12]
     604:	3301      	adds	r3, #1
     606:	60fb      	str	r3, [r7, #12]
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
     608:	4a0a      	ldr	r2, [pc, #40]	; (634 <search_command+0x58>)
     60a:	68fb      	ldr	r3, [r7, #12]
     60c:	00db      	lsls	r3, r3, #3
     60e:	4413      	add	r3, r2
     610:	685b      	ldr	r3, [r3, #4]
     612:	2b00      	cmp	r3, #0
     614:	d1e9      	bne.n	5ea <search_command+0xe>
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
     616:	4a07      	ldr	r2, [pc, #28]	; (634 <search_command+0x58>)
     618:	68fb      	ldr	r3, [r7, #12]
     61a:	00db      	lsls	r3, r3, #3
     61c:	4413      	add	r3, r2
     61e:	685b      	ldr	r3, [r3, #4]
     620:	2b00      	cmp	r3, #0
     622:	d102      	bne.n	62a <search_command+0x4e>
     624:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     628:	60fb      	str	r3, [r7, #12]
	return i;
     62a:	68fb      	ldr	r3, [r7, #12]
}
     62c:	4618      	mov	r0, r3
     62e:	3710      	adds	r7, #16
     630:	46bd      	mov	sp, r7
     632:	bd80      	pop	{r7, pc}
     634:	00001268 	.word	0x00001268

00000638 <skip>:


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
     638:	b480      	push	{r7}
     63a:	b085      	sub	sp, #20
     63c:	af00      	add	r7, sp, #0
     63e:	60f8      	str	r0, [r7, #12]
     640:	60b9      	str	r1, [r7, #8]
     642:	4613      	mov	r3, r2
     644:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]==c) start++;
     646:	e002      	b.n	64e <skip+0x16>
     648:	68bb      	ldr	r3, [r7, #8]
     64a:	3301      	adds	r3, #1
     64c:	60bb      	str	r3, [r7, #8]
     64e:	68bb      	ldr	r3, [r7, #8]
     650:	68fa      	ldr	r2, [r7, #12]
     652:	4413      	add	r3, r2
     654:	781b      	ldrb	r3, [r3, #0]
     656:	2b00      	cmp	r3, #0
     658:	d006      	beq.n	668 <skip+0x30>
     65a:	68bb      	ldr	r3, [r7, #8]
     65c:	68fa      	ldr	r2, [r7, #12]
     65e:	4413      	add	r3, r2
     660:	781b      	ldrb	r3, [r3, #0]
     662:	79fa      	ldrb	r2, [r7, #7]
     664:	429a      	cmp	r2, r3
     666:	d0ef      	beq.n	648 <skip+0x10>
	return start;
     668:	68bb      	ldr	r3, [r7, #8]
}
     66a:	4618      	mov	r0, r3
     66c:	3714      	adds	r7, #20
     66e:	46bd      	mov	sp, r7
     670:	f85d 7b04 	ldr.w	r7, [sp], #4
     674:	4770      	bx	lr
     676:	bf00      	nop

00000678 <scan>:

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
     678:	b480      	push	{r7}
     67a:	b085      	sub	sp, #20
     67c:	af00      	add	r7, sp, #0
     67e:	60f8      	str	r0, [r7, #12]
     680:	60b9      	str	r1, [r7, #8]
     682:	4613      	mov	r3, r2
     684:	71fb      	strb	r3, [r7, #7]
	while (buffer[start] && buffer[start]!=c) start++;
     686:	e002      	b.n	68e <scan+0x16>
     688:	68bb      	ldr	r3, [r7, #8]
     68a:	3301      	adds	r3, #1
     68c:	60bb      	str	r3, [r7, #8]
     68e:	68bb      	ldr	r3, [r7, #8]
     690:	68fa      	ldr	r2, [r7, #12]
     692:	4413      	add	r3, r2
     694:	781b      	ldrb	r3, [r3, #0]
     696:	2b00      	cmp	r3, #0
     698:	d006      	beq.n	6a8 <scan+0x30>
     69a:	68bb      	ldr	r3, [r7, #8]
     69c:	68fa      	ldr	r2, [r7, #12]
     69e:	4413      	add	r3, r2
     6a0:	781b      	ldrb	r3, [r3, #0]
     6a2:	79fa      	ldrb	r2, [r7, #7]
     6a4:	429a      	cmp	r2, r3
     6a6:	d1ef      	bne.n	688 <scan+0x10>
	return start;
     6a8:	68bb      	ldr	r3, [r7, #8]
}
     6aa:	4618      	mov	r0, r3
     6ac:	3714      	adds	r7, #20
     6ae:	46bd      	mov	sp, r7
     6b0:	f85d 7b04 	ldr.w	r7, [sp], #4
     6b4:	4770      	bx	lr
     6b6:	bf00      	nop

000006b8 <next>:

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
     6b8:	b480      	push	{r7}
     6ba:	b087      	sub	sp, #28
     6bc:	af00      	add	r7, sp, #0
     6be:	60f8      	str	r0, [r7, #12]
     6c0:	60b9      	str	r1, [r7, #8]
     6c2:	4613      	mov	r3, r2
     6c4:	71fb      	strb	r3, [r7, #7]
	int end;
	end=start;
     6c6:	68bb      	ldr	r3, [r7, #8]
     6c8:	617b      	str	r3, [r7, #20]
	while (buffer[end] && (buffer[end]!=c)) end++;
     6ca:	e002      	b.n	6d2 <next+0x1a>
     6cc:	697b      	ldr	r3, [r7, #20]
     6ce:	3301      	adds	r3, #1
     6d0:	617b      	str	r3, [r7, #20]
     6d2:	697b      	ldr	r3, [r7, #20]
     6d4:	68fa      	ldr	r2, [r7, #12]
     6d6:	4413      	add	r3, r2
     6d8:	781b      	ldrb	r3, [r3, #0]
     6da:	2b00      	cmp	r3, #0
     6dc:	d006      	beq.n	6ec <next+0x34>
     6de:	697b      	ldr	r3, [r7, #20]
     6e0:	68fa      	ldr	r2, [r7, #12]
     6e2:	4413      	add	r3, r2
     6e4:	781b      	ldrb	r3, [r3, #0]
     6e6:	79fa      	ldrb	r2, [r7, #7]
     6e8:	429a      	cmp	r2, r3
     6ea:	d1ef      	bne.n	6cc <next+0x14>
	return end-start;
     6ec:	697a      	ldr	r2, [r7, #20]
     6ee:	68bb      	ldr	r3, [r7, #8]
     6f0:	1ad3      	subs	r3, r2, r3
}
     6f2:	4618      	mov	r0, r3
     6f4:	371c      	adds	r7, #28
     6f6:	46bd      	mov	sp, r7
     6f8:	f85d 7b04 	ldr.w	r7, [sp], #4
     6fc:	4770      	bx	lr
     6fe:	bf00      	nop

00000700 <move>:

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
     700:	b480      	push	{r7}
     702:	b085      	sub	sp, #20
     704:	af00      	add	r7, sp, #0
     706:	60f8      	str	r0, [r7, #12]
     708:	60b9      	str	r1, [r7, #8]
     70a:	607a      	str	r2, [r7, #4]
	while (len){
     70c:	e00a      	b.n	724 <move+0x24>
		*dest++=*src++;
     70e:	68bb      	ldr	r3, [r7, #8]
     710:	1c5a      	adds	r2, r3, #1
     712:	60ba      	str	r2, [r7, #8]
     714:	68fa      	ldr	r2, [r7, #12]
     716:	1c51      	adds	r1, r2, #1
     718:	60f9      	str	r1, [r7, #12]
     71a:	7812      	ldrb	r2, [r2, #0]
     71c:	701a      	strb	r2, [r3, #0]
		len--;
     71e:	687b      	ldr	r3, [r7, #4]
     720:	3b01      	subs	r3, #1
     722:	607b      	str	r3, [r7, #4]
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
     724:	687b      	ldr	r3, [r7, #4]
     726:	2b00      	cmp	r3, #0
     728:	d1f1      	bne.n	70e <move+0xe>
		*dest++=*src++;
		len--;
	}
	*dest=0;
     72a:	68bb      	ldr	r3, [r7, #8]
     72c:	2200      	movs	r2, #0
     72e:	701a      	strb	r2, [r3, #0]
}
     730:	3714      	adds	r7, #20
     732:	46bd      	mov	sp, r7
     734:	f85d 7b04 	ldr.w	r7, [sp], #4
     738:	4770      	bx	lr
     73a:	bf00      	nop

0000073c <word>:

// extrait le prochain mot du tib
static void word(){
     73c:	b580      	push	{r7, lr}
     73e:	b082      	sub	sp, #8
     740:	af00      	add	r7, sp, #0
		int len;
		in=skip(tib,in,SPACE);
     742:	4b12      	ldr	r3, [pc, #72]	; (78c <word+0x50>)
     744:	681b      	ldr	r3, [r3, #0]
     746:	4812      	ldr	r0, [pc, #72]	; (790 <word+0x54>)
     748:	4619      	mov	r1, r3
     74a:	2220      	movs	r2, #32
     74c:	f7ff ff74 	bl	638 <skip>
     750:	4603      	mov	r3, r0
     752:	461a      	mov	r2, r3
     754:	4b0d      	ldr	r3, [pc, #52]	; (78c <word+0x50>)
     756:	601a      	str	r2, [r3, #0]
		len=next(tib,in,SPACE);
     758:	4b0c      	ldr	r3, [pc, #48]	; (78c <word+0x50>)
     75a:	681b      	ldr	r3, [r3, #0]
     75c:	480c      	ldr	r0, [pc, #48]	; (790 <word+0x54>)
     75e:	4619      	mov	r1, r3
     760:	2220      	movs	r2, #32
     762:	f7ff ffa9 	bl	6b8 <next>
     766:	6078      	str	r0, [r7, #4]
		move(&tib[in],pad,len);
     768:	4b08      	ldr	r3, [pc, #32]	; (78c <word+0x50>)
     76a:	681b      	ldr	r3, [r3, #0]
     76c:	4a08      	ldr	r2, [pc, #32]	; (790 <word+0x54>)
     76e:	4413      	add	r3, r2
     770:	4618      	mov	r0, r3
     772:	4908      	ldr	r1, [pc, #32]	; (794 <word+0x58>)
     774:	687a      	ldr	r2, [r7, #4]
     776:	f7ff ffc3 	bl	700 <move>
		in+=len;
     77a:	4b04      	ldr	r3, [pc, #16]	; (78c <word+0x50>)
     77c:	681a      	ldr	r2, [r3, #0]
     77e:	687b      	ldr	r3, [r7, #4]
     780:	4413      	add	r3, r2
     782:	4a02      	ldr	r2, [pc, #8]	; (78c <word+0x50>)
     784:	6013      	str	r3, [r2, #0]
}
     786:	3708      	adds	r7, #8
     788:	46bd      	mov	sp, r7
     78a:	bd80      	pop	{r7, pc}
     78c:	200000ac 	.word	0x200000ac
     790:	2000000c 	.word	0x2000000c
     794:	2000005c 	.word	0x2000005c

00000798 <parse_line>:

static void parse_line(unsigned llen){
     798:	b580      	push	{r7, lr}
     79a:	b084      	sub	sp, #16
     79c:	af00      	add	r7, sp, #0
     79e:	6078      	str	r0, [r7, #4]
	int cmd_id;
	in=0;
     7a0:	4b12      	ldr	r3, [pc, #72]	; (7ec <parse_line+0x54>)
     7a2:	2200      	movs	r2, #0
     7a4:	601a      	str	r2, [r3, #0]
	while (in<llen){
     7a6:	e016      	b.n	7d6 <parse_line+0x3e>
		word();
     7a8:	f7ff ffc8 	bl	73c <word>
		cmd_id=search_command((const char*) pad);
     7ac:	4810      	ldr	r0, [pc, #64]	; (7f0 <parse_line+0x58>)
     7ae:	f7ff ff15 	bl	5dc <search_command>
     7b2:	60f8      	str	r0, [r7, #12]
		if (cmd_id>-1){
     7b4:	68fb      	ldr	r3, [r7, #12]
     7b6:	2b00      	cmp	r3, #0
     7b8:	db06      	blt.n	7c8 <parse_line+0x30>
			commands[cmd_id].fn();
     7ba:	4a0e      	ldr	r2, [pc, #56]	; (7f4 <parse_line+0x5c>)
     7bc:	68fb      	ldr	r3, [r7, #12]
     7be:	00db      	lsls	r3, r3, #3
     7c0:	4413      	add	r3, r2
     7c2:	685b      	ldr	r3, [r3, #4]
     7c4:	4798      	blx	r3
     7c6:	e006      	b.n	7d6 <parse_line+0x3e>
		}else{
			print(pad); conout('?');
     7c8:	4809      	ldr	r0, [pc, #36]	; (7f0 <parse_line+0x58>)
     7ca:	f000 f8a9 	bl	920 <print>
     7ce:	203f      	movs	r0, #63	; 0x3f
     7d0:	f000 f874 	bl	8bc <conout>
			break;
     7d4:	e004      	b.n	7e0 <parse_line+0x48>
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
     7d6:	4b05      	ldr	r3, [pc, #20]	; (7ec <parse_line+0x54>)
     7d8:	681a      	ldr	r2, [r3, #0]
     7da:	687b      	ldr	r3, [r7, #4]
     7dc:	429a      	cmp	r2, r3
     7de:	d3e3      	bcc.n	7a8 <parse_line+0x10>
		}else{
			print(pad); conout('?');
			break;
		}
	}//while
	conout(CR);
     7e0:	200d      	movs	r0, #13
     7e2:	f000 f86b 	bl	8bc <conout>
}
     7e6:	3710      	adds	r7, #16
     7e8:	46bd      	mov	sp, r7
     7ea:	bd80      	pop	{r7, pc}
     7ec:	200000ac 	.word	0x200000ac
     7f0:	2000005c 	.word	0x2000005c
     7f4:	00001268 	.word	0x00001268

000007f8 <main>:


void main(void){
     7f8:	b580      	push	{r7, lr}
     7fa:	b082      	sub	sp, #8
     7fc:	af00      	add	r7, sp, #0
	set_sysclock();
     7fe:	f7ff fdc9 	bl	394 <set_sysclock>
	set_int_priority(IRQ_SVC,15);
     802:	f06f 000a 	mvn.w	r0, #10
     806:	210f      	movs	r1, #15
     808:	f000 faa0 	bl	d4c <set_int_priority>
	config_systicks();
     80c:	f7ff fe00 	bl	410 <config_systicks>
	port_c_setup();
     810:	f7ff fe10 	bl	434 <port_c_setup>
	uart_open_channel(CON,115200,FLOW_HARD);
     814:	4811      	ldr	r0, [pc, #68]	; (85c <main+0x64>)
     816:	f44f 31e1 	mov.w	r1, #115200	; 0x1c200
     81a:	2201      	movs	r2, #1
     81c:	f000 fc24 	bl	1068 <uart_open_channel>
	_unprivileged(); // à partir d'ici exécution sans privilèges.
     820:	f3ef 8014 	mrs	r0, CONTROL
     824:	f040 0001 	orr.w	r0, r0, #1
     828:	f380 8814 	msr	CONTROL, r0
     82c:	f3bf 8f6f 	isb	sy
	cls();
     830:	f000 f8a6 	bl	980 <cls>
	print(VERSION); 
     834:	4b0a      	ldr	r3, [pc, #40]	; (860 <main+0x68>)
     836:	681b      	ldr	r3, [r3, #0]
     838:	4618      	mov	r0, r3
     83a:	f000 f871 	bl	920 <print>
	_svc_call(SVC_LED_ON,NUL,NUL);
     83e:	2300      	movs	r3, #0
     840:	2200      	movs	r2, #0
     842:	4618      	mov	r0, r3
     844:	4611      	mov	r1, r2
     846:	df01      	svc	1
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
     848:	4806      	ldr	r0, [pc, #24]	; (864 <main+0x6c>)
     84a:	2150      	movs	r1, #80	; 0x50
     84c:	f000 f8be 	bl	9cc <read_line>
     850:	6078      	str	r0, [r7, #4]
		parse_line(llen);
     852:	6878      	ldr	r0, [r7, #4]
     854:	f7ff ffa0 	bl	798 <parse_line>
	}
     858:	e7f6      	b.n	848 <main+0x50>
     85a:	bf00      	nop
     85c:	40004400 	.word	0x40004400
     860:	20000000 	.word	0x20000000
     864:	2000000c 	.word	0x2000000c

00000868 <USART2_handler>:
#include "../include/console.h"
#include "svcall.h"

static rx_queue_t rx_queue;
// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
     868:	4668      	mov	r0, sp
     86a:	f020 0107 	bic.w	r1, r0, #7
     86e:	468d      	mov	sp, r1
     870:	b481      	push	{r0, r7}
     872:	af00      	add	r7, sp, #0
	if (USART2_SR&(1<<USART_SR_RXNE)){
     874:	4b0e      	ldr	r3, [pc, #56]	; (8b0 <USART2_handler+0x48>)
     876:	681b      	ldr	r3, [r3, #0]
     878:	f003 0320 	and.w	r3, r3, #32
     87c:	2b00      	cmp	r3, #0
     87e:	d012      	beq.n	8a6 <USART2_handler+0x3e>
		rx_queue.queue[rx_queue.head++]=USART2_DR&0x7f;
     880:	4b0c      	ldr	r3, [pc, #48]	; (8b4 <USART2_handler+0x4c>)
     882:	6a1b      	ldr	r3, [r3, #32]
     884:	1c5a      	adds	r2, r3, #1
     886:	490b      	ldr	r1, [pc, #44]	; (8b4 <USART2_handler+0x4c>)
     888:	620a      	str	r2, [r1, #32]
     88a:	4a0b      	ldr	r2, [pc, #44]	; (8b8 <USART2_handler+0x50>)
     88c:	6812      	ldr	r2, [r2, #0]
     88e:	b2d2      	uxtb	r2, r2
     890:	f002 027f 	and.w	r2, r2, #127	; 0x7f
     894:	b2d1      	uxtb	r1, r2
     896:	4a07      	ldr	r2, [pc, #28]	; (8b4 <USART2_handler+0x4c>)
     898:	54d1      	strb	r1, [r2, r3]
		rx_queue.head&=RX_QUEUE_SIZE-1;
     89a:	4b06      	ldr	r3, [pc, #24]	; (8b4 <USART2_handler+0x4c>)
     89c:	6a1b      	ldr	r3, [r3, #32]
     89e:	f003 031f 	and.w	r3, r3, #31
     8a2:	4a04      	ldr	r2, [pc, #16]	; (8b4 <USART2_handler+0x4c>)
     8a4:	6213      	str	r3, [r2, #32]
	}
}
     8a6:	46bd      	mov	sp, r7
     8a8:	bc81      	pop	{r0, r7}
     8aa:	4685      	mov	sp, r0
     8ac:	4770      	bx	lr
     8ae:	bf00      	nop
     8b0:	40004400 	.word	0x40004400
     8b4:	200000b0 	.word	0x200000b0
     8b8:	40004404 	.word	0x40004404

000008bc <conout>:


// envoie d'un caractère à la console
void conout(char c){
     8bc:	b580      	push	{r7, lr}
     8be:	b082      	sub	sp, #8
     8c0:	af00      	add	r7, sp, #0
     8c2:	4603      	mov	r3, r0
     8c4:	71fb      	strb	r3, [r7, #7]
	uart_putc(CON,c);
     8c6:	79fb      	ldrb	r3, [r7, #7]
     8c8:	4803      	ldr	r0, [pc, #12]	; (8d8 <conout+0x1c>)
     8ca:	4619      	mov	r1, r3
     8cc:	f000 fc84 	bl	11d8 <uart_putc>
}
     8d0:	3708      	adds	r7, #8
     8d2:	46bd      	mov	sp, r7
     8d4:	bd80      	pop	{r7, pc}
     8d6:	bf00      	nop
     8d8:	40004400 	.word	0x40004400

000008dc <conin>:


// réception d'un caractère de la console
char conin(){
     8dc:	b480      	push	{r7}
     8de:	b083      	sub	sp, #12
     8e0:	af00      	add	r7, sp, #0
	char c=0;
     8e2:	2300      	movs	r3, #0
     8e4:	71fb      	strb	r3, [r7, #7]
	if (rx_queue.head!=rx_queue.tail){
     8e6:	4b0d      	ldr	r3, [pc, #52]	; (91c <conin+0x40>)
     8e8:	6a1a      	ldr	r2, [r3, #32]
     8ea:	4b0c      	ldr	r3, [pc, #48]	; (91c <conin+0x40>)
     8ec:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     8ee:	429a      	cmp	r2, r3
     8f0:	d00d      	beq.n	90e <conin+0x32>
		c=rx_queue.queue[rx_queue.tail++];
     8f2:	4b0a      	ldr	r3, [pc, #40]	; (91c <conin+0x40>)
     8f4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     8f6:	1c5a      	adds	r2, r3, #1
     8f8:	4908      	ldr	r1, [pc, #32]	; (91c <conin+0x40>)
     8fa:	624a      	str	r2, [r1, #36]	; 0x24
     8fc:	4a07      	ldr	r2, [pc, #28]	; (91c <conin+0x40>)
     8fe:	5cd3      	ldrb	r3, [r2, r3]
     900:	71fb      	strb	r3, [r7, #7]
		rx_queue.tail&=RX_QUEUE_SIZE-1;
     902:	4b06      	ldr	r3, [pc, #24]	; (91c <conin+0x40>)
     904:	6a5b      	ldr	r3, [r3, #36]	; 0x24
     906:	f003 031f 	and.w	r3, r3, #31
     90a:	4a04      	ldr	r2, [pc, #16]	; (91c <conin+0x40>)
     90c:	6253      	str	r3, [r2, #36]	; 0x24
	}
	return c;
     90e:	79fb      	ldrb	r3, [r7, #7]
}
     910:	4618      	mov	r0, r3
     912:	370c      	adds	r7, #12
     914:	46bd      	mov	sp, r7
     916:	f85d 7b04 	ldr.w	r7, [sp], #4
     91a:	4770      	bx	lr
     91c:	200000b0 	.word	0x200000b0

00000920 <print>:

// imprime un chaîne sur la console
void print(const char *str){
     920:	b580      	push	{r7, lr}
     922:	b082      	sub	sp, #8
     924:	af00      	add	r7, sp, #0
     926:	6078      	str	r0, [r7, #4]
	while (*str) {conout(*str++);}
     928:	e006      	b.n	938 <print+0x18>
     92a:	687b      	ldr	r3, [r7, #4]
     92c:	1c5a      	adds	r2, r3, #1
     92e:	607a      	str	r2, [r7, #4]
     930:	781b      	ldrb	r3, [r3, #0]
     932:	4618      	mov	r0, r3
     934:	f7ff ffc2 	bl	8bc <conout>
     938:	687b      	ldr	r3, [r7, #4]
     93a:	781b      	ldrb	r3, [r3, #0]
     93c:	2b00      	cmp	r3, #0
     93e:	d1f4      	bne.n	92a <print+0xa>
}
     940:	3708      	adds	r7, #8
     942:	46bd      	mov	sp, r7
     944:	bd80      	pop	{r7, pc}
     946:	bf00      	nop

00000948 <beep>:

void beep(){
     948:	b480      	push	{r7}
     94a:	af00      	add	r7, sp, #0
}
     94c:	46bd      	mov	sp, r7
     94e:	f85d 7b04 	ldr.w	r7, [sp], #4
     952:	4770      	bx	lr

00000954 <delete_back>:

// efface le caractère à gauche du curseur
void delete_back(){
     954:	b580      	push	{r7, lr}
     956:	af00      	add	r7, sp, #0
	conout(BS);
     958:	2008      	movs	r0, #8
     95a:	f7ff ffaf 	bl	8bc <conout>
	conout(SPACE);
     95e:	2020      	movs	r0, #32
     960:	f7ff ffac 	bl	8bc <conout>
	conout(BS);
     964:	2008      	movs	r0, #8
     966:	f7ff ffa9 	bl	8bc <conout>
}
     96a:	bd80      	pop	{r7, pc}

0000096c <esc_seq>:

void esc_seq(){
     96c:	b580      	push	{r7, lr}
     96e:	af00      	add	r7, sp, #0
	conout(ESC);
     970:	201b      	movs	r0, #27
     972:	f7ff ffa3 	bl	8bc <conout>
	conout('[');
     976:	205b      	movs	r0, #91	; 0x5b
     978:	f7ff ffa0 	bl	8bc <conout>
}
     97c:	bd80      	pop	{r7, pc}
     97e:	bf00      	nop

00000980 <cls>:

// vide l'écran de la console
void cls(){
     980:	b580      	push	{r7, lr}
     982:	af00      	add	r7, sp, #0
	esc_seq();
     984:	f7ff fff2 	bl	96c <esc_seq>
	conout('2');
     988:	2032      	movs	r0, #50	; 0x32
     98a:	f7ff ff97 	bl	8bc <conout>
	conout('J');
     98e:	204a      	movs	r0, #74	; 0x4a
     990:	f7ff ff94 	bl	8bc <conout>
}
     994:	bd80      	pop	{r7, pc}
     996:	bf00      	nop

00000998 <clear_line>:

// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void clear_line(unsigned n){
     998:	b580      	push	{r7, lr}
     99a:	b082      	sub	sp, #8
     99c:	af00      	add	r7, sp, #0
     99e:	6078      	str	r0, [r7, #4]
	esc_seq();
     9a0:	f7ff ffe4 	bl	96c <esc_seq>
	conout('2');
     9a4:	2032      	movs	r0, #50	; 0x32
     9a6:	f7ff ff89 	bl	8bc <conout>
	conout('K');
     9aa:	204b      	movs	r0, #75	; 0x4b
     9ac:	f7ff ff86 	bl	8bc <conout>
	while (n){conout(BS);n--;}
     9b0:	e005      	b.n	9be <clear_line+0x26>
     9b2:	2008      	movs	r0, #8
     9b4:	f7ff ff82 	bl	8bc <conout>
     9b8:	687b      	ldr	r3, [r7, #4]
     9ba:	3b01      	subs	r3, #1
     9bc:	607b      	str	r3, [r7, #4]
     9be:	687b      	ldr	r3, [r7, #4]
     9c0:	2b00      	cmp	r3, #0
     9c2:	d1f6      	bne.n	9b2 <clear_line+0x1a>
}
     9c4:	3708      	adds	r7, #8
     9c6:	46bd      	mov	sp, r7
     9c8:	bd80      	pop	{r7, pc}
     9ca:	bf00      	nop

000009cc <read_line>:

// reçoit une ligne de texte de la console
unsigned read_line(char *buffer,unsigned buf_len){
     9cc:	b580      	push	{r7, lr}
     9ce:	b084      	sub	sp, #16
     9d0:	af00      	add	r7, sp, #0
     9d2:	6078      	str	r0, [r7, #4]
     9d4:	6039      	str	r1, [r7, #0]
	unsigned line_len=0;
     9d6:	2300      	movs	r3, #0
     9d8:	60fb      	str	r3, [r7, #12]
	char c=0;
     9da:	2300      	movs	r3, #0
     9dc:	72fb      	strb	r3, [r7, #11]
	
	buf_len--;
     9de:	683b      	ldr	r3, [r7, #0]
     9e0:	3b01      	subs	r3, #1
     9e2:	603b      	str	r3, [r7, #0]
	while (c!=13){
     9e4:	e08e      	b.n	b04 <read_line+0x138>
			c=conin();
     9e6:	f7ff ff79 	bl	8dc <conin>
     9ea:	4603      	mov	r3, r0
     9ec:	72fb      	strb	r3, [r7, #11]
			switch(c){
     9ee:	7afb      	ldrb	r3, [r7, #11]
     9f0:	2b18      	cmp	r3, #24
     9f2:	d872      	bhi.n	ada <read_line+0x10e>
     9f4:	a201      	add	r2, pc, #4	; (adr r2, 9fc <read_line+0x30>)
     9f6:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
     9fa:	bf00      	nop
     9fc:	00000b05 	.word	0x00000b05
     a00:	00000adb 	.word	0x00000adb
     a04:	00000adb 	.word	0x00000adb
     a08:	00000adb 	.word	0x00000adb
     a0c:	00000adb 	.word	0x00000adb
     a10:	00000acd 	.word	0x00000acd
     a14:	00000adb 	.word	0x00000adb
     a18:	00000adb 	.word	0x00000adb
     a1c:	00000abb 	.word	0x00000abb
     a20:	00000ad7 	.word	0x00000ad7
     a24:	00000a61 	.word	0x00000a61
     a28:	00000adb 	.word	0x00000adb
     a2c:	00000adb 	.word	0x00000adb
     a30:	00000a61 	.word	0x00000a61
     a34:	00000adb 	.word	0x00000adb
     a38:	00000adb 	.word	0x00000adb
     a3c:	00000adb 	.word	0x00000adb
     a40:	00000adb 	.word	0x00000adb
     a44:	00000adb 	.word	0x00000adb
     a48:	00000adb 	.word	0x00000adb
     a4c:	00000adb 	.word	0x00000adb
     a50:	00000a6f 	.word	0x00000a6f
     a54:	00000adb 	.word	0x00000adb
     a58:	00000a85 	.word	0x00000a85
     a5c:	00000a6f 	.word	0x00000a6f
				case NUL:
				break;
				case CR:
				case LF:
				c=CR;
     a60:	230d      	movs	r3, #13
     a62:	72fb      	strb	r3, [r7, #11]
				conout(c);
     a64:	7afb      	ldrb	r3, [r7, #11]
     a66:	4618      	mov	r0, r3
     a68:	f7ff ff28 	bl	8bc <conout>
				break;
     a6c:	e04a      	b.n	b04 <read_line+0x138>
				case CTRL_X:
				case CTRL_U:
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
     a6e:	68f8      	ldr	r0, [r7, #12]
     a70:	f7ff ff92 	bl	998 <clear_line>
				line_len=0;
     a74:	2300      	movs	r3, #0
     a76:	60fb      	str	r3, [r7, #12]
				break;
     a78:	e044      	b.n	b04 <read_line+0x138>
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
     a7a:	f7ff ff6b 	bl	954 <delete_back>
					line_len--;
     a7e:	68fb      	ldr	r3, [r7, #12]
     a80:	3b01      	subs	r3, #1
     a82:	60fb      	str	r3, [r7, #12]
				//while (line_len){delete_back();line_len--;}
				clear_line(line_len);
				line_len=0;
				break;
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
     a84:	68fb      	ldr	r3, [r7, #12]
     a86:	2b00      	cmp	r3, #0
     a88:	d006      	beq.n	a98 <read_line+0xcc>
     a8a:	68fb      	ldr	r3, [r7, #12]
     a8c:	3b01      	subs	r3, #1
     a8e:	687a      	ldr	r2, [r7, #4]
     a90:	4413      	add	r3, r2
     a92:	781b      	ldrb	r3, [r3, #0]
     a94:	2b20      	cmp	r3, #32
     a96:	d0f0      	beq.n	a7a <read_line+0xae>
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
     a98:	e004      	b.n	aa4 <read_line+0xd8>
					delete_back();
     a9a:	f7ff ff5b 	bl	954 <delete_back>
					line_len--;
     a9e:	68fb      	ldr	r3, [r7, #12]
     aa0:	3b01      	subs	r3, #1
     aa2:	60fb      	str	r3, [r7, #12]
				case CTRL_W:
				while (line_len && (buffer[line_len-1]==SPACE)){
					delete_back();
					line_len--;
				}
				while (line_len && (buffer[line_len-1]!=SPACE)){
     aa4:	68fb      	ldr	r3, [r7, #12]
     aa6:	2b00      	cmp	r3, #0
     aa8:	d006      	beq.n	ab8 <read_line+0xec>
     aaa:	68fb      	ldr	r3, [r7, #12]
     aac:	3b01      	subs	r3, #1
     aae:	687a      	ldr	r2, [r7, #4]
     ab0:	4413      	add	r3, r2
     ab2:	781b      	ldrb	r3, [r3, #0]
     ab4:	2b20      	cmp	r3, #32
     ab6:	d1f0      	bne.n	a9a <read_line+0xce>
					delete_back();
					line_len--;
				}
				break;
     ab8:	e024      	b.n	b04 <read_line+0x138>
				case BS:
				if (line_len){
     aba:	68fb      	ldr	r3, [r7, #12]
     abc:	2b00      	cmp	r3, #0
     abe:	d004      	beq.n	aca <read_line+0xfe>
					delete_back();
     ac0:	f7ff ff48 	bl	954 <delete_back>
					line_len--;
     ac4:	68fb      	ldr	r3, [r7, #12]
     ac6:	3b01      	subs	r3, #1
     ac8:	60fb      	str	r3, [r7, #12]
				}
				break;
     aca:	e01b      	b.n	b04 <read_line+0x138>
				case CTRL_E:
				cls();
     acc:	f7ff ff58 	bl	980 <cls>
				line_len=0;
     ad0:	2300      	movs	r3, #0
     ad2:	60fb      	str	r3, [r7, #12]
				break;
     ad4:	e016      	b.n	b04 <read_line+0x138>
				case TAB:
				c=SPACE;
     ad6:	2320      	movs	r3, #32
     ad8:	72fb      	strb	r3, [r7, #11]
				default:
				if ((line_len<buf_len) && (c>=32)){
     ada:	68fa      	ldr	r2, [r7, #12]
     adc:	683b      	ldr	r3, [r7, #0]
     ade:	429a      	cmp	r2, r3
     ae0:	d20e      	bcs.n	b00 <read_line+0x134>
     ae2:	7afb      	ldrb	r3, [r7, #11]
     ae4:	2b1f      	cmp	r3, #31
     ae6:	d90b      	bls.n	b00 <read_line+0x134>
					buffer[line_len++]=c;
     ae8:	68fb      	ldr	r3, [r7, #12]
     aea:	1c5a      	adds	r2, r3, #1
     aec:	60fa      	str	r2, [r7, #12]
     aee:	687a      	ldr	r2, [r7, #4]
     af0:	4413      	add	r3, r2
     af2:	7afa      	ldrb	r2, [r7, #11]
     af4:	701a      	strb	r2, [r3, #0]
					conout(c);
     af6:	7afb      	ldrb	r3, [r7, #11]
     af8:	4618      	mov	r0, r3
     afa:	f7ff fedf 	bl	8bc <conout>
     afe:	e001      	b.n	b04 <read_line+0x138>
				}else{
					beep();
     b00:	f7ff ff22 	bl	948 <beep>
unsigned read_line(char *buffer,unsigned buf_len){
	unsigned line_len=0;
	char c=0;
	
	buf_len--;
	while (c!=13){
     b04:	7afb      	ldrb	r3, [r7, #11]
     b06:	2b0d      	cmp	r3, #13
     b08:	f47f af6d 	bne.w	9e6 <read_line+0x1a>
				}else{
					beep();
				}
			}
	}
	buffer[line_len]=0;
     b0c:	687a      	ldr	r2, [r7, #4]
     b0e:	68fb      	ldr	r3, [r7, #12]
     b10:	4413      	add	r3, r2
     b12:	2200      	movs	r2, #0
     b14:	701a      	strb	r2, [r3, #0]
	return line_len;
     b16:	68fb      	ldr	r3, [r7, #12]
}
     b18:	4618      	mov	r0, r3
     b1a:	3710      	adds	r7, #16
     b1c:	46bd      	mov	sp, r7
     b1e:	bd80      	pop	{r7, pc}

00000b20 <print_int>:

// imprime un entier
// i entier à imprimer
// base base numérique
void print_int(int i, unsigned base){
     b20:	b580      	push	{r7, lr}
     b22:	b08e      	sub	sp, #56	; 0x38
     b24:	af00      	add	r7, sp, #0
     b26:	6078      	str	r0, [r7, #4]
     b28:	6039      	str	r1, [r7, #0]
	char fmt[36];
	int sign=1;
     b2a:	2301      	movs	r3, #1
     b2c:	637b      	str	r3, [r7, #52]	; 0x34
	int pos=34;
     b2e:	2322      	movs	r3, #34	; 0x22
     b30:	633b      	str	r3, [r7, #48]	; 0x30
	fmt[35]=0;
     b32:	2300      	movs	r3, #0
     b34:	f887 302f 	strb.w	r3, [r7, #47]	; 0x2f
	if (i<0) {sign=-1; i=-i;}
     b38:	687b      	ldr	r3, [r7, #4]
     b3a:	2b00      	cmp	r3, #0
     b3c:	da05      	bge.n	b4a <print_int+0x2a>
     b3e:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     b42:	637b      	str	r3, [r7, #52]	; 0x34
     b44:	687b      	ldr	r3, [r7, #4]
     b46:	425b      	negs	r3, r3
     b48:	607b      	str	r3, [r7, #4]
	while (i){
     b4a:	e02c      	b.n	ba6 <print_int+0x86>
		fmt[pos]=i%base+'0';
     b4c:	687b      	ldr	r3, [r7, #4]
     b4e:	683a      	ldr	r2, [r7, #0]
     b50:	fbb3 f2f2 	udiv	r2, r3, r2
     b54:	6839      	ldr	r1, [r7, #0]
     b56:	fb01 f202 	mul.w	r2, r1, r2
     b5a:	1a9b      	subs	r3, r3, r2
     b5c:	b2db      	uxtb	r3, r3
     b5e:	3330      	adds	r3, #48	; 0x30
     b60:	b2d9      	uxtb	r1, r3
     b62:	f107 020c 	add.w	r2, r7, #12
     b66:	6b3b      	ldr	r3, [r7, #48]	; 0x30
     b68:	4413      	add	r3, r2
     b6a:	460a      	mov	r2, r1
     b6c:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9') {fmt[pos]+=7;}
     b6e:	f107 020c 	add.w	r2, r7, #12
     b72:	6b3b      	ldr	r3, [r7, #48]	; 0x30
     b74:	4413      	add	r3, r2
     b76:	781b      	ldrb	r3, [r3, #0]
     b78:	2b39      	cmp	r3, #57	; 0x39
     b7a:	d90c      	bls.n	b96 <print_int+0x76>
     b7c:	f107 020c 	add.w	r2, r7, #12
     b80:	6b3b      	ldr	r3, [r7, #48]	; 0x30
     b82:	4413      	add	r3, r2
     b84:	781b      	ldrb	r3, [r3, #0]
     b86:	3307      	adds	r3, #7
     b88:	b2d9      	uxtb	r1, r3
     b8a:	f107 020c 	add.w	r2, r7, #12
     b8e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
     b90:	4413      	add	r3, r2
     b92:	460a      	mov	r2, r1
     b94:	701a      	strb	r2, [r3, #0]
		pos--;
     b96:	6b3b      	ldr	r3, [r7, #48]	; 0x30
     b98:	3b01      	subs	r3, #1
     b9a:	633b      	str	r3, [r7, #48]	; 0x30
		i/=base;
     b9c:	687a      	ldr	r2, [r7, #4]
     b9e:	683b      	ldr	r3, [r7, #0]
     ba0:	fbb2 f3f3 	udiv	r3, r2, r3
     ba4:	607b      	str	r3, [r7, #4]
	char fmt[36];
	int sign=1;
	int pos=34;
	fmt[35]=0;
	if (i<0) {sign=-1; i=-i;}
	while (i){
     ba6:	687b      	ldr	r3, [r7, #4]
     ba8:	2b00      	cmp	r3, #0
     baa:	d1cf      	bne.n	b4c <print_int+0x2c>
		fmt[pos]=i%base+'0';
		if (fmt[pos]>'9') {fmt[pos]+=7;}
		pos--;
		i/=base;
	}
	if (pos==34){ fmt[pos--]='0';}
     bac:	6b3b      	ldr	r3, [r7, #48]	; 0x30
     bae:	2b22      	cmp	r3, #34	; 0x22
     bb0:	d108      	bne.n	bc4 <print_int+0xa4>
     bb2:	6b3b      	ldr	r3, [r7, #48]	; 0x30
     bb4:	1e5a      	subs	r2, r3, #1
     bb6:	633a      	str	r2, [r7, #48]	; 0x30
     bb8:	f107 0238 	add.w	r2, r7, #56	; 0x38
     bbc:	4413      	add	r3, r2
     bbe:	2230      	movs	r2, #48	; 0x30
     bc0:	f803 2c2c 	strb.w	r2, [r3, #-44]
	if (sign<0) {fmt[pos--]='-';}
     bc4:	6b7b      	ldr	r3, [r7, #52]	; 0x34
     bc6:	2b00      	cmp	r3, #0
     bc8:	da08      	bge.n	bdc <print_int+0xbc>
     bca:	6b3b      	ldr	r3, [r7, #48]	; 0x30
     bcc:	1e5a      	subs	r2, r3, #1
     bce:	633a      	str	r2, [r7, #48]	; 0x30
     bd0:	f107 0238 	add.w	r2, r7, #56	; 0x38
     bd4:	4413      	add	r3, r2
     bd6:	222d      	movs	r2, #45	; 0x2d
     bd8:	f803 2c2c 	strb.w	r2, [r3, #-44]
	fmt[pos]=' ';
     bdc:	f107 020c 	add.w	r2, r7, #12
     be0:	6b3b      	ldr	r3, [r7, #48]	; 0x30
     be2:	4413      	add	r3, r2
     be4:	2220      	movs	r2, #32
     be6:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
     be8:	f107 020c 	add.w	r2, r7, #12
     bec:	6b3b      	ldr	r3, [r7, #48]	; 0x30
     bee:	4413      	add	r3, r2
     bf0:	4618      	mov	r0, r3
     bf2:	f7ff fe95 	bl	920 <print>
}
     bf6:	3738      	adds	r7, #56	; 0x38
     bf8:	46bd      	mov	sp, r7
     bfa:	bd80      	pop	{r7, pc}

00000bfc <print_hex>:

// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
     bfc:	b580      	push	{r7, lr}
     bfe:	b088      	sub	sp, #32
     c00:	af00      	add	r7, sp, #0
     c02:	6078      	str	r0, [r7, #4]
	char fmt[14];
	int pos=12;
     c04:	230c      	movs	r3, #12
     c06:	61fb      	str	r3, [r7, #28]
	fmt[13]=0;
     c08:	2300      	movs	r3, #0
     c0a:	767b      	strb	r3, [r7, #25]
	while (u){
     c0c:	e026      	b.n	c5c <print_hex+0x60>
		fmt[pos]=u%16+'0';
     c0e:	687b      	ldr	r3, [r7, #4]
     c10:	b2db      	uxtb	r3, r3
     c12:	f003 030f 	and.w	r3, r3, #15
     c16:	b2db      	uxtb	r3, r3
     c18:	3330      	adds	r3, #48	; 0x30
     c1a:	b2d9      	uxtb	r1, r3
     c1c:	f107 020c 	add.w	r2, r7, #12
     c20:	69fb      	ldr	r3, [r7, #28]
     c22:	4413      	add	r3, r2
     c24:	460a      	mov	r2, r1
     c26:	701a      	strb	r2, [r3, #0]
		if (fmt[pos]>'9'){fmt[pos]+=7;}
     c28:	f107 020c 	add.w	r2, r7, #12
     c2c:	69fb      	ldr	r3, [r7, #28]
     c2e:	4413      	add	r3, r2
     c30:	781b      	ldrb	r3, [r3, #0]
     c32:	2b39      	cmp	r3, #57	; 0x39
     c34:	d90c      	bls.n	c50 <print_hex+0x54>
     c36:	f107 020c 	add.w	r2, r7, #12
     c3a:	69fb      	ldr	r3, [r7, #28]
     c3c:	4413      	add	r3, r2
     c3e:	781b      	ldrb	r3, [r3, #0]
     c40:	3307      	adds	r3, #7
     c42:	b2d9      	uxtb	r1, r3
     c44:	f107 020c 	add.w	r2, r7, #12
     c48:	69fb      	ldr	r3, [r7, #28]
     c4a:	4413      	add	r3, r2
     c4c:	460a      	mov	r2, r1
     c4e:	701a      	strb	r2, [r3, #0]
		pos--;
     c50:	69fb      	ldr	r3, [r7, #28]
     c52:	3b01      	subs	r3, #1
     c54:	61fb      	str	r3, [r7, #28]
		u/=16;
     c56:	687b      	ldr	r3, [r7, #4]
     c58:	091b      	lsrs	r3, r3, #4
     c5a:	607b      	str	r3, [r7, #4]
// imprime un entier non signé en hexadécimal
void print_hex(unsigned u){
	char fmt[14];
	int pos=12;
	fmt[13]=0;
	while (u){
     c5c:	687b      	ldr	r3, [r7, #4]
     c5e:	2b00      	cmp	r3, #0
     c60:	d1d5      	bne.n	c0e <print_hex+0x12>
		fmt[pos]=u%16+'0';
		if (fmt[pos]>'9'){fmt[pos]+=7;}
		pos--;
		u/=16;
	}
	if (pos==13){fmt[pos--]='0';}
     c62:	69fb      	ldr	r3, [r7, #28]
     c64:	2b0d      	cmp	r3, #13
     c66:	d108      	bne.n	c7a <print_hex+0x7e>
     c68:	69fb      	ldr	r3, [r7, #28]
     c6a:	1e5a      	subs	r2, r3, #1
     c6c:	61fa      	str	r2, [r7, #28]
     c6e:	f107 0220 	add.w	r2, r7, #32
     c72:	4413      	add	r3, r2
     c74:	2230      	movs	r2, #48	; 0x30
     c76:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='x';
     c7a:	69fb      	ldr	r3, [r7, #28]
     c7c:	1e5a      	subs	r2, r3, #1
     c7e:	61fa      	str	r2, [r7, #28]
     c80:	f107 0220 	add.w	r2, r7, #32
     c84:	4413      	add	r3, r2
     c86:	2278      	movs	r2, #120	; 0x78
     c88:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos--]='0';
     c8c:	69fb      	ldr	r3, [r7, #28]
     c8e:	1e5a      	subs	r2, r3, #1
     c90:	61fa      	str	r2, [r7, #28]
     c92:	f107 0220 	add.w	r2, r7, #32
     c96:	4413      	add	r3, r2
     c98:	2230      	movs	r2, #48	; 0x30
     c9a:	f803 2c14 	strb.w	r2, [r3, #-20]
	fmt[pos]=' ';
     c9e:	f107 020c 	add.w	r2, r7, #12
     ca2:	69fb      	ldr	r3, [r7, #28]
     ca4:	4413      	add	r3, r2
     ca6:	2220      	movs	r2, #32
     ca8:	701a      	strb	r2, [r3, #0]
	print(&fmt[pos]);
     caa:	f107 020c 	add.w	r2, r7, #12
     cae:	69fb      	ldr	r3, [r7, #28]
     cb0:	4413      	add	r3, r2
     cb2:	4618      	mov	r0, r3
     cb4:	f7ff fe34 	bl	920 <print>
}
     cb8:	3720      	adds	r7, #32
     cba:	46bd      	mov	sp, r7
     cbc:	bd80      	pop	{r7, pc}
     cbe:	bf00      	nop

00000cc0 <enable_interrupt>:




typedef volatile uint32_t* iser_t;
void enable_interrupt(unsigned irq){
     cc0:	b480      	push	{r7}
     cc2:	b085      	sub	sp, #20
     cc4:	af00      	add	r7, sp, #0
     cc6:	6078      	str	r0, [r7, #4]
	iser_t iser=(iser_t)(NVIC_ISER0_ADR);
     cc8:	4b0d      	ldr	r3, [pc, #52]	; (d00 <enable_interrupt+0x40>)
     cca:	60fb      	str	r3, [r7, #12]
	if (irq>LAST_IRQ) return ;
     ccc:	687b      	ldr	r3, [r7, #4]
     cce:	2b3b      	cmp	r3, #59	; 0x3b
     cd0:	d900      	bls.n	cd4 <enable_interrupt+0x14>
     cd2:	e010      	b.n	cf6 <enable_interrupt+0x36>
	iser[irq/32]|=1<<(irq%32);
     cd4:	687b      	ldr	r3, [r7, #4]
     cd6:	095b      	lsrs	r3, r3, #5
     cd8:	009a      	lsls	r2, r3, #2
     cda:	68f9      	ldr	r1, [r7, #12]
     cdc:	440a      	add	r2, r1
     cde:	009b      	lsls	r3, r3, #2
     ce0:	68f9      	ldr	r1, [r7, #12]
     ce2:	440b      	add	r3, r1
     ce4:	681b      	ldr	r3, [r3, #0]
     ce6:	6879      	ldr	r1, [r7, #4]
     ce8:	f001 011f 	and.w	r1, r1, #31
     cec:	2001      	movs	r0, #1
     cee:	fa00 f101 	lsl.w	r1, r0, r1
     cf2:	430b      	orrs	r3, r1
     cf4:	6013      	str	r3, [r2, #0]
	
}
     cf6:	3714      	adds	r7, #20
     cf8:	46bd      	mov	sp, r7
     cfa:	f85d 7b04 	ldr.w	r7, [sp], #4
     cfe:	4770      	bx	lr
     d00:	e000e100 	.word	0xe000e100

00000d04 <disable_interrupt>:

typedef volatile uint32_t* icer_t;
void disable_interrupt(unsigned irq){
     d04:	b480      	push	{r7}
     d06:	b085      	sub	sp, #20
     d08:	af00      	add	r7, sp, #0
     d0a:	6078      	str	r0, [r7, #4]
	icer_t icer=(icer_t)(NVIC_ICER0_ADR);
     d0c:	4b0e      	ldr	r3, [pc, #56]	; (d48 <disable_interrupt+0x44>)
     d0e:	60fb      	str	r3, [r7, #12]
	if (irq>LAST_IRQ) return ;
     d10:	687b      	ldr	r3, [r7, #4]
     d12:	2b3b      	cmp	r3, #59	; 0x3b
     d14:	d900      	bls.n	d18 <disable_interrupt+0x14>
     d16:	e011      	b.n	d3c <disable_interrupt+0x38>
	icer[irq/32]&=~(1<<(irq%32));
     d18:	687b      	ldr	r3, [r7, #4]
     d1a:	095b      	lsrs	r3, r3, #5
     d1c:	009a      	lsls	r2, r3, #2
     d1e:	68f9      	ldr	r1, [r7, #12]
     d20:	440a      	add	r2, r1
     d22:	009b      	lsls	r3, r3, #2
     d24:	68f9      	ldr	r1, [r7, #12]
     d26:	440b      	add	r3, r1
     d28:	681b      	ldr	r3, [r3, #0]
     d2a:	6879      	ldr	r1, [r7, #4]
     d2c:	f001 011f 	and.w	r1, r1, #31
     d30:	2001      	movs	r0, #1
     d32:	fa00 f101 	lsl.w	r1, r0, r1
     d36:	43c9      	mvns	r1, r1
     d38:	400b      	ands	r3, r1
     d3a:	6013      	str	r3, [r2, #0]
	
}
     d3c:	3714      	adds	r7, #20
     d3e:	46bd      	mov	sp, r7
     d40:	f85d 7b04 	ldr.w	r7, [sp], #4
     d44:	4770      	bx	lr
     d46:	bf00      	nop
     d48:	e000e180 	.word	0xe000e180

00000d4c <set_int_priority>:


typedef uint8_t* ipr_t;
typedef uint8_t* shpr_t;
void set_int_priority(int32_t irq, unsigned priority){
     d4c:	b480      	push	{r7}
     d4e:	b085      	sub	sp, #20
     d50:	af00      	add	r7, sp, #0
     d52:	6078      	str	r0, [r7, #4]
     d54:	6039      	str	r1, [r7, #0]
	volatile ipr_t ipr=(ipr_t)NVIC_IPR0_ADR;
     d56:	4b15      	ldr	r3, [pc, #84]	; (dac <set_int_priority+0x60>)
     d58:	60fb      	str	r3, [r7, #12]
	volatile shpr_t shpr=(shpr_t)(SCB_BASE_ADR+24);
     d5a:	4b15      	ldr	r3, [pc, #84]	; (db0 <set_int_priority+0x64>)
     d5c:	60bb      	str	r3, [r7, #8]
	if ((irq>=0) && (irq<=LAST_IRQ)){
     d5e:	687b      	ldr	r3, [r7, #4]
     d60:	2b00      	cmp	r3, #0
     d62:	db0b      	blt.n	d7c <set_int_priority+0x30>
     d64:	687b      	ldr	r3, [r7, #4]
     d66:	2b3b      	cmp	r3, #59	; 0x3b
     d68:	dc08      	bgt.n	d7c <set_int_priority+0x30>
		ipr[irq]=(uint8_t)((priority&15)<<4);
     d6a:	68fa      	ldr	r2, [r7, #12]
     d6c:	687b      	ldr	r3, [r7, #4]
     d6e:	4413      	add	r3, r2
     d70:	683a      	ldr	r2, [r7, #0]
     d72:	b2d2      	uxtb	r2, r2
     d74:	0112      	lsls	r2, r2, #4
     d76:	b2d2      	uxtb	r2, r2
     d78:	701a      	strb	r2, [r3, #0]
     d7a:	e011      	b.n	da0 <set_int_priority+0x54>
	}else if ((irq<0) && (irq>-16)){
     d7c:	687b      	ldr	r3, [r7, #4]
     d7e:	2b00      	cmp	r3, #0
     d80:	da0e      	bge.n	da0 <set_int_priority+0x54>
     d82:	687b      	ldr	r3, [r7, #4]
     d84:	f113 0f0f 	cmn.w	r3, #15
     d88:	db0a      	blt.n	da0 <set_int_priority+0x54>
		shpr[-(irq+4)]=(uint8_t)((priority&15)<<4);
     d8a:	68ba      	ldr	r2, [r7, #8]
     d8c:	6879      	ldr	r1, [r7, #4]
     d8e:	f06f 0303 	mvn.w	r3, #3
     d92:	1a5b      	subs	r3, r3, r1
     d94:	4413      	add	r3, r2
     d96:	683a      	ldr	r2, [r7, #0]
     d98:	b2d2      	uxtb	r2, r2
     d9a:	0112      	lsls	r2, r2, #4
     d9c:	b2d2      	uxtb	r2, r2
     d9e:	701a      	strb	r2, [r3, #0]
	}
}
     da0:	3714      	adds	r7, #20
     da2:	46bd      	mov	sp, r7
     da4:	f85d 7b04 	ldr.w	r7, [sp], #4
     da8:	4770      	bx	lr
     daa:	bf00      	nop
     dac:	e000e400 	.word	0xe000e400
     db0:	e000ed18 	.word	0xe000ed18

00000db4 <NMI_handler>:
// réinitialise le µC
// L'attribut (weak) permet de les remplacer par une fonction du même nom
// sans avoir à modifier le fichier startup.c

// core exceptions
_default_handler(NMI_handler) // 2
     db4:	4b01      	ldr	r3, [pc, #4]	; (dbc <NMI_handler+0x8>)
     db6:	4a02      	ldr	r2, [pc, #8]	; (dc0 <NMI_handler+0xc>)
     db8:	601a      	str	r2, [r3, #0]
     dba:	bf00      	nop
     dbc:	e000ed0c 	.word	0xe000ed0c
     dc0:	05fa0004 	.word	0x05fa0004

00000dc4 <HARD_FAULT_handler>:
_default_handler(HARD_FAULT_handler) // 3
     dc4:	4b01      	ldr	r3, [pc, #4]	; (dcc <HARD_FAULT_handler+0x8>)
     dc6:	4a02      	ldr	r2, [pc, #8]	; (dd0 <HARD_FAULT_handler+0xc>)
     dc8:	601a      	str	r2, [r3, #0]
     dca:	bf00      	nop
     dcc:	e000ed0c 	.word	0xe000ed0c
     dd0:	05fa0004 	.word	0x05fa0004

00000dd4 <MM_FAULT_handler>:
_default_handler(MM_FAULT_handler)  // 4
     dd4:	4b01      	ldr	r3, [pc, #4]	; (ddc <MM_FAULT_handler+0x8>)
     dd6:	4a02      	ldr	r2, [pc, #8]	; (de0 <MM_FAULT_handler+0xc>)
     dd8:	601a      	str	r2, [r3, #0]
     dda:	bf00      	nop
     ddc:	e000ed0c 	.word	0xe000ed0c
     de0:	05fa0004 	.word	0x05fa0004

00000de4 <BUS_FAULT_handler>:
_default_handler(BUS_FAULT_handler) // 5
     de4:	4b01      	ldr	r3, [pc, #4]	; (dec <BUS_FAULT_handler+0x8>)
     de6:	4a02      	ldr	r2, [pc, #8]	; (df0 <BUS_FAULT_handler+0xc>)
     de8:	601a      	str	r2, [r3, #0]
     dea:	bf00      	nop
     dec:	e000ed0c 	.word	0xe000ed0c
     df0:	05fa0004 	.word	0x05fa0004

00000df4 <USAGE_FAULT_handler>:
_default_handler(USAGE_FAULT_handler) // 6
     df4:	4b01      	ldr	r3, [pc, #4]	; (dfc <USAGE_FAULT_handler+0x8>)
     df6:	4a02      	ldr	r2, [pc, #8]	; (e00 <USAGE_FAULT_handler+0xc>)
     df8:	601a      	str	r2, [r3, #0]
     dfa:	bf00      	nop
     dfc:	e000ed0c 	.word	0xe000ed0c
     e00:	05fa0004 	.word	0x05fa0004
_default_handler(SVC_handler) // 11
     e04:	4b01      	ldr	r3, [pc, #4]	; (e0c <USAGE_FAULT_handler+0x18>)
     e06:	4a02      	ldr	r2, [pc, #8]	; (e10 <USAGE_FAULT_handler+0x1c>)
     e08:	601a      	str	r2, [r3, #0]
     e0a:	bf00      	nop
     e0c:	e000ed0c 	.word	0xe000ed0c
     e10:	05fa0004 	.word	0x05fa0004

00000e14 <PENDSV_handler>:
_default_handler(PENDSV_handler) // 14
     e14:	4b01      	ldr	r3, [pc, #4]	; (e1c <PENDSV_handler+0x8>)
     e16:	4a02      	ldr	r2, [pc, #8]	; (e20 <PENDSV_handler+0xc>)
     e18:	601a      	str	r2, [r3, #0]
     e1a:	bf00      	nop
     e1c:	e000ed0c 	.word	0xe000ed0c
     e20:	05fa0004 	.word	0x05fa0004
_default_handler(STK_handler) // 15
     e24:	4b01      	ldr	r3, [pc, #4]	; (e2c <PENDSV_handler+0x18>)
     e26:	4a02      	ldr	r2, [pc, #8]	; (e30 <PENDSV_handler+0x1c>)
     e28:	601a      	str	r2, [r3, #0]
     e2a:	bf00      	nop
     e2c:	e000ed0c 	.word	0xe000ed0c
     e30:	05fa0004 	.word	0x05fa0004

00000e34 <WWDG_handler>:

// IRQ
_default_handler(WWDG_handler) // 0
     e34:	4b01      	ldr	r3, [pc, #4]	; (e3c <WWDG_handler+0x8>)
     e36:	4a02      	ldr	r2, [pc, #8]	; (e40 <WWDG_handler+0xc>)
     e38:	601a      	str	r2, [r3, #0]
     e3a:	bf00      	nop
     e3c:	e000ed0c 	.word	0xe000ed0c
     e40:	05fa0004 	.word	0x05fa0004

00000e44 <PVD_handler>:
_default_handler(PVD_handler) // 1
     e44:	4b01      	ldr	r3, [pc, #4]	; (e4c <PVD_handler+0x8>)
     e46:	4a02      	ldr	r2, [pc, #8]	; (e50 <PVD_handler+0xc>)
     e48:	601a      	str	r2, [r3, #0]
     e4a:	bf00      	nop
     e4c:	e000ed0c 	.word	0xe000ed0c
     e50:	05fa0004 	.word	0x05fa0004

00000e54 <RTC_handler>:
_default_handler(RTC_handler) // 2
     e54:	4b01      	ldr	r3, [pc, #4]	; (e5c <RTC_handler+0x8>)
     e56:	4a02      	ldr	r2, [pc, #8]	; (e60 <RTC_handler+0xc>)
     e58:	601a      	str	r2, [r3, #0]
     e5a:	bf00      	nop
     e5c:	e000ed0c 	.word	0xe000ed0c
     e60:	05fa0004 	.word	0x05fa0004

00000e64 <TAMPER_handler>:
_default_handler(TAMPER_handler) // 3
     e64:	4b01      	ldr	r3, [pc, #4]	; (e6c <TAMPER_handler+0x8>)
     e66:	4a02      	ldr	r2, [pc, #8]	; (e70 <TAMPER_handler+0xc>)
     e68:	601a      	str	r2, [r3, #0]
     e6a:	bf00      	nop
     e6c:	e000ed0c 	.word	0xe000ed0c
     e70:	05fa0004 	.word	0x05fa0004

00000e74 <FLASH_handler>:
_default_handler(FLASH_handler) // 4
     e74:	4b01      	ldr	r3, [pc, #4]	; (e7c <FLASH_handler+0x8>)
     e76:	4a02      	ldr	r2, [pc, #8]	; (e80 <FLASH_handler+0xc>)
     e78:	601a      	str	r2, [r3, #0]
     e7a:	bf00      	nop
     e7c:	e000ed0c 	.word	0xe000ed0c
     e80:	05fa0004 	.word	0x05fa0004

00000e84 <RCC_handler>:
_default_handler(RCC_handler) // 5
     e84:	4b01      	ldr	r3, [pc, #4]	; (e8c <RCC_handler+0x8>)
     e86:	4a02      	ldr	r2, [pc, #8]	; (e90 <RCC_handler+0xc>)
     e88:	601a      	str	r2, [r3, #0]
     e8a:	bf00      	nop
     e8c:	e000ed0c 	.word	0xe000ed0c
     e90:	05fa0004 	.word	0x05fa0004

00000e94 <EXTI0_handler>:
_default_handler(EXTI0_handler) // 6
     e94:	4b01      	ldr	r3, [pc, #4]	; (e9c <EXTI0_handler+0x8>)
     e96:	4a02      	ldr	r2, [pc, #8]	; (ea0 <EXTI0_handler+0xc>)
     e98:	601a      	str	r2, [r3, #0]
     e9a:	bf00      	nop
     e9c:	e000ed0c 	.word	0xe000ed0c
     ea0:	05fa0004 	.word	0x05fa0004

00000ea4 <EXTI1_handler>:
_default_handler(EXTI1_handler) // 7
     ea4:	4b01      	ldr	r3, [pc, #4]	; (eac <EXTI1_handler+0x8>)
     ea6:	4a02      	ldr	r2, [pc, #8]	; (eb0 <EXTI1_handler+0xc>)
     ea8:	601a      	str	r2, [r3, #0]
     eaa:	bf00      	nop
     eac:	e000ed0c 	.word	0xe000ed0c
     eb0:	05fa0004 	.word	0x05fa0004

00000eb4 <EXTI2_handler>:
_default_handler(EXTI2_handler) // 8
     eb4:	4b01      	ldr	r3, [pc, #4]	; (ebc <EXTI2_handler+0x8>)
     eb6:	4a02      	ldr	r2, [pc, #8]	; (ec0 <EXTI2_handler+0xc>)
     eb8:	601a      	str	r2, [r3, #0]
     eba:	bf00      	nop
     ebc:	e000ed0c 	.word	0xe000ed0c
     ec0:	05fa0004 	.word	0x05fa0004

00000ec4 <EXTI3_handler>:
_default_handler(EXTI3_handler) // 9
     ec4:	4b01      	ldr	r3, [pc, #4]	; (ecc <EXTI3_handler+0x8>)
     ec6:	4a02      	ldr	r2, [pc, #8]	; (ed0 <EXTI3_handler+0xc>)
     ec8:	601a      	str	r2, [r3, #0]
     eca:	bf00      	nop
     ecc:	e000ed0c 	.word	0xe000ed0c
     ed0:	05fa0004 	.word	0x05fa0004

00000ed4 <EXTI4_handler>:
_default_handler(EXTI4_handler) // 10
     ed4:	4b01      	ldr	r3, [pc, #4]	; (edc <EXTI4_handler+0x8>)
     ed6:	4a02      	ldr	r2, [pc, #8]	; (ee0 <EXTI4_handler+0xc>)
     ed8:	601a      	str	r2, [r3, #0]
     eda:	bf00      	nop
     edc:	e000ed0c 	.word	0xe000ed0c
     ee0:	05fa0004 	.word	0x05fa0004

00000ee4 <DMA1CH1_handler>:
_default_handler(DMA1CH1_handler) // 11
     ee4:	4b01      	ldr	r3, [pc, #4]	; (eec <DMA1CH1_handler+0x8>)
     ee6:	4a02      	ldr	r2, [pc, #8]	; (ef0 <DMA1CH1_handler+0xc>)
     ee8:	601a      	str	r2, [r3, #0]
     eea:	bf00      	nop
     eec:	e000ed0c 	.word	0xe000ed0c
     ef0:	05fa0004 	.word	0x05fa0004

00000ef4 <DMA1CH2_handler>:
_default_handler(DMA1CH2_handler) // 12
     ef4:	4b01      	ldr	r3, [pc, #4]	; (efc <DMA1CH2_handler+0x8>)
     ef6:	4a02      	ldr	r2, [pc, #8]	; (f00 <DMA1CH2_handler+0xc>)
     ef8:	601a      	str	r2, [r3, #0]
     efa:	bf00      	nop
     efc:	e000ed0c 	.word	0xe000ed0c
     f00:	05fa0004 	.word	0x05fa0004

00000f04 <USART1_handler>:

_default_handler(USART1_handler) // 37
     f04:	4b01      	ldr	r3, [pc, #4]	; (f0c <USART1_handler+0x8>)
     f06:	4a02      	ldr	r2, [pc, #8]	; (f10 <USART1_handler+0xc>)
     f08:	601a      	str	r2, [r3, #0]
     f0a:	bf00      	nop
     f0c:	e000ed0c 	.word	0xe000ed0c
     f10:	05fa0004 	.word	0x05fa0004
_default_handler(USART2_handler) // 38
     f14:	4b01      	ldr	r3, [pc, #4]	; (f1c <USART1_handler+0x18>)
     f16:	4a02      	ldr	r2, [pc, #8]	; (f20 <USART1_handler+0x1c>)
     f18:	601a      	str	r2, [r3, #0]
     f1a:	bf00      	nop
     f1c:	e000ed0c 	.word	0xe000ed0c
     f20:	05fa0004 	.word	0x05fa0004

00000f24 <USART3_handler>:
_default_handler(USART3_handler) // 39
     f24:	4b01      	ldr	r3, [pc, #4]	; (f2c <USART3_handler+0x8>)
     f26:	4a02      	ldr	r2, [pc, #8]	; (f30 <USART3_handler+0xc>)
     f28:	601a      	str	r2, [r3, #0]
     f2a:	bf00      	nop
     f2c:	e000ed0c 	.word	0xe000ed0c
     f30:	05fa0004 	.word	0x05fa0004

00000f34 <reset_mcu>:

void __attribute__((naked)) reset_mcu(){
// réinitialise le µC
	_reset_mcu();
     f34:	4b01      	ldr	r3, [pc, #4]	; (f3c <reset_mcu+0x8>)
     f36:	4a02      	ldr	r2, [pc, #8]	; (f40 <reset_mcu+0xc>)
     f38:	601a      	str	r2, [r3, #0]
     f3a:	bf00      	nop
     f3c:	e000ed0c 	.word	0xe000ed0c
     f40:	05fa0004 	.word	0x05fa0004

00000f44 <startup>:
    (unsigned int *)  reset_mcu, // 59 DMA2CH4_5
};


void startup()
{
     f44:	b580      	push	{r7, lr}
     f46:	b086      	sub	sp, #24
     f48:	af00      	add	r7, sp, #0
    /* Set memory in bss segment to zeros */
    unsigned int * bss_start_p = &_BSS_START; 
     f4a:	4b1b      	ldr	r3, [pc, #108]	; (fb8 <startup+0x74>)
     f4c:	617b      	str	r3, [r7, #20]
    unsigned int * bss_end_p = &_BSS_END;
     f4e:	4b1b      	ldr	r3, [pc, #108]	; (fbc <startup+0x78>)
     f50:	60bb      	str	r3, [r7, #8]

    while(bss_start_p != bss_end_p)
     f52:	e005      	b.n	f60 <startup+0x1c>
    {
        *bss_start_p = 0;
     f54:	697b      	ldr	r3, [r7, #20]
     f56:	2200      	movs	r2, #0
     f58:	601a      	str	r2, [r3, #0]
        bss_start_p++;
     f5a:	697b      	ldr	r3, [r7, #20]
     f5c:	3304      	adds	r3, #4
     f5e:	617b      	str	r3, [r7, #20]
{
    /* Set memory in bss segment to zeros */
    unsigned int * bss_start_p = &_BSS_START; 
    unsigned int * bss_end_p = &_BSS_END;

    while(bss_start_p != bss_end_p)
     f60:	697a      	ldr	r2, [r7, #20]
     f62:	68bb      	ldr	r3, [r7, #8]
     f64:	429a      	cmp	r2, r3
     f66:	d1f5      	bne.n	f54 <startup+0x10>
    }

    /* Copy memory in data segment from its position
     * in the flash image to its position in the
     * read/write memory */
    unsigned int * data_rom_start_p = &_DATA_ROM_START;
     f68:	4b15      	ldr	r3, [pc, #84]	; (fc0 <startup+0x7c>)
     f6a:	613b      	str	r3, [r7, #16]
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
     f6c:	4b15      	ldr	r3, [pc, #84]	; (fc4 <startup+0x80>)
     f6e:	60fb      	str	r3, [r7, #12]
    unsigned int * data_ram_end_p = &_DATA_RAM_END;
     f70:	4b15      	ldr	r3, [pc, #84]	; (fc8 <startup+0x84>)
     f72:	607b      	str	r3, [r7, #4]

    while(data_ram_start_p != data_ram_end_p)
     f74:	e009      	b.n	f8a <startup+0x46>
    {
        *data_ram_start_p = *data_rom_start_p;
     f76:	693b      	ldr	r3, [r7, #16]
     f78:	681a      	ldr	r2, [r3, #0]
     f7a:	68fb      	ldr	r3, [r7, #12]
     f7c:	601a      	str	r2, [r3, #0]
        data_ram_start_p++;
     f7e:	68fb      	ldr	r3, [r7, #12]
     f80:	3304      	adds	r3, #4
     f82:	60fb      	str	r3, [r7, #12]
        data_rom_start_p++;
     f84:	693b      	ldr	r3, [r7, #16]
     f86:	3304      	adds	r3, #4
     f88:	613b      	str	r3, [r7, #16]
     * read/write memory */
    unsigned int * data_rom_start_p = &_DATA_ROM_START;
    unsigned int * data_ram_start_p = &_DATA_RAM_START;
    unsigned int * data_ram_end_p = &_DATA_RAM_END;

    while(data_ram_start_p != data_ram_end_p)
     f8a:	68fa      	ldr	r2, [r7, #12]
     f8c:	687b      	ldr	r3, [r7, #4]
     f8e:	429a      	cmp	r2, r3
     f90:	d1f1      	bne.n	f76 <startup+0x32>
        *data_ram_start_p = *data_rom_start_p;
        data_ram_start_p++;
        data_rom_start_p++;
    }
    // active les interruptions et les fault handler
    __enable_irq();
     f92:	b662      	cpsie	i
    __enable_fault_irq();
     f94:	b661      	cpsie	f
    // initialisaton de la pile PSP et commutation 
    // vers cette pile.
    asm volatile(
     f96:	4b0d      	ldr	r3, [pc, #52]	; (fcc <startup+0x88>)
     f98:	4618      	mov	r0, r3
     f9a:	f380 8809 	msr	PSP, r0
     f9e:	f3ef 8014 	mrs	r0, CONTROL
     fa2:	f040 0002 	orr.w	r0, r0, #2
     fa6:	f380 8814 	msr	CONTROL, r0
     faa:	f3bf 8f6f 	isb	sy
    "msr CONTROL,r0\n"
    "isb\n"
    :: [psp_top] "r" (PSP_TOP)
    );
    /* Now we are ready to start the main function */
    main();
     fae:	f7ff fc23 	bl	7f8 <main>
}
     fb2:	3718      	adds	r7, #24
     fb4:	46bd      	mov	sp, r7
     fb6:	bd80      	pop	{r7, pc}
     fb8:	20000004 	.word	0x20000004
     fbc:	200000d8 	.word	0x200000d8
     fc0:	000012b8 	.word	0x000012b8
     fc4:	20000000 	.word	0x20000000
     fc8:	20000004 	.word	0x20000004
     fcc:	20004c00 	.word	0x20004c00

00000fd0 <uart_set_baud>:
#define _usart_select(n)  USART##n_
#define _usart_sfr_sel(n,s) USART##n_##s 


// vitesse de transmission
void uart_set_baud(unsigned channel, unsigned baud){
     fd0:	b480      	push	{r7}
     fd2:	b085      	sub	sp, #20
     fd4:	af00      	add	r7, sp, #0
     fd6:	6078      	str	r0, [r7, #4]
     fd8:	6039      	str	r1, [r7, #0]
	uint32_t *brr;
	uint32_t rate;

    brr=(uint32_t*)(channel+USART_BRR_OFS);		
     fda:	687b      	ldr	r3, [r7, #4]
     fdc:	3308      	adds	r3, #8
     fde:	60bb      	str	r3, [r7, #8]
	switch (channel){
     fe0:	687b      	ldr	r3, [r7, #4]
     fe2:	4a1a      	ldr	r2, [pc, #104]	; (104c <uart_set_baud+0x7c>)
     fe4:	4293      	cmp	r3, r2
     fe6:	d019      	beq.n	101c <uart_set_baud+0x4c>
     fe8:	4a19      	ldr	r2, [pc, #100]	; (1050 <uart_set_baud+0x80>)
     fea:	4293      	cmp	r3, r2
     fec:	d003      	beq.n	ff6 <uart_set_baud+0x26>
     fee:	4a19      	ldr	r2, [pc, #100]	; (1054 <uart_set_baud+0x84>)
     ff0:	4293      	cmp	r3, r2
     ff2:	d013      	beq.n	101c <uart_set_baud+0x4c>
     ff4:	e021      	b.n	103a <uart_set_baud+0x6a>
	case USART1:
		rate=(FAPB2/baud/16)<<4;
     ff6:	4a18      	ldr	r2, [pc, #96]	; (1058 <uart_set_baud+0x88>)
     ff8:	683b      	ldr	r3, [r7, #0]
     ffa:	fbb2 f3f3 	udiv	r3, r2, r3
     ffe:	011b      	lsls	r3, r3, #4
    1000:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB2/baud)%16;
    1002:	4a16      	ldr	r2, [pc, #88]	; (105c <uart_set_baud+0x8c>)
    1004:	683b      	ldr	r3, [r7, #0]
    1006:	fbb2 f3f3 	udiv	r3, r2, r3
    100a:	f003 030f 	and.w	r3, r3, #15
    100e:	68fa      	ldr	r2, [r7, #12]
    1010:	4313      	orrs	r3, r2
    1012:	60fb      	str	r3, [r7, #12]
		*brr=rate;
    1014:	68bb      	ldr	r3, [r7, #8]
    1016:	68fa      	ldr	r2, [r7, #12]
    1018:	601a      	str	r2, [r3, #0]
		return;
    101a:	e011      	b.n	1040 <uart_set_baud+0x70>
	case USART2:
	case USART3:
		rate=(FAPB1/baud/16)<<4;
    101c:	4a10      	ldr	r2, [pc, #64]	; (1060 <uart_set_baud+0x90>)
    101e:	683b      	ldr	r3, [r7, #0]
    1020:	fbb2 f3f3 	udiv	r3, r2, r3
    1024:	011b      	lsls	r3, r3, #4
    1026:	60fb      	str	r3, [r7, #12]
		rate|=(FAPB1/baud)%16;
    1028:	4a0e      	ldr	r2, [pc, #56]	; (1064 <uart_set_baud+0x94>)
    102a:	683b      	ldr	r3, [r7, #0]
    102c:	fbb2 f3f3 	udiv	r3, r2, r3
    1030:	f003 030f 	and.w	r3, r3, #15
    1034:	68fa      	ldr	r2, [r7, #12]
    1036:	4313      	orrs	r3, r2
    1038:	60fb      	str	r3, [r7, #12]
	}
	*brr=rate;
    103a:	68bb      	ldr	r3, [r7, #8]
    103c:	68fa      	ldr	r2, [r7, #12]
    103e:	601a      	str	r2, [r3, #0]
}
    1040:	3714      	adds	r7, #20
    1042:	46bd      	mov	sp, r7
    1044:	f85d 7b04 	ldr.w	r7, [sp], #4
    1048:	4770      	bx	lr
    104a:	bf00      	nop
    104c:	40004800 	.word	0x40004800
    1050:	40013800 	.word	0x40013800
    1054:	40004400 	.word	0x40004400
    1058:	0044aa20 	.word	0x0044aa20
    105c:	044aa200 	.word	0x044aa200
    1060:	00225510 	.word	0x00225510
    1064:	02255100 	.word	0x02255100

00001068 <uart_open_channel>:

// configure l'USART pour communication selon protocole RS-232
// 8 bit 1 stop pas de parité
void uart_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl){
    1068:	b580      	push	{r7, lr}
    106a:	b086      	sub	sp, #24
    106c:	af00      	add	r7, sp, #0
    106e:	60f8      	str	r0, [r7, #12]
    1070:	60b9      	str	r1, [r7, #8]
    1072:	607a      	str	r2, [r7, #4]
	uint32_t *cr1, *cr3;
	
	switch(channel){ // activation du périphérique USART et du PORT
    1074:	68fb      	ldr	r3, [r7, #12]
    1076:	4a3b      	ldr	r2, [pc, #236]	; (1164 <uart_open_channel+0xfc>)
    1078:	4293      	cmp	r3, r2
    107a:	d03e      	beq.n	10fa <uart_open_channel+0x92>
    107c:	4a3a      	ldr	r2, [pc, #232]	; (1168 <uart_open_channel+0x100>)
    107e:	4293      	cmp	r3, r2
    1080:	d003      	beq.n	108a <uart_open_channel+0x22>
    1082:	4a3a      	ldr	r2, [pc, #232]	; (116c <uart_open_channel+0x104>)
    1084:	4293      	cmp	r3, r2
    1086:	d01c      	beq.n	10c2 <uart_open_channel+0x5a>
    1088:	e053      	b.n	1132 <uart_open_channel+0xca>
	case USART1:
		RCC_APB2ENR|=(1<<RCC_APB2ENR_USART1EN)|(1<<RCC_APB2ENR_IOPAEN);
    108a:	4a39      	ldr	r2, [pc, #228]	; (1170 <uart_open_channel+0x108>)
    108c:	4b38      	ldr	r3, [pc, #224]	; (1170 <uart_open_channel+0x108>)
    108e:	681b      	ldr	r3, [r3, #0]
    1090:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
    1094:	f043 0304 	orr.w	r3, r3, #4
    1098:	6013      	str	r3, [r2, #0]
		// PA9 -> TX   output (push-pull)
		// PA10 -> RX  input (floating)
		// PA11 -> CTS input (floating)
		// PA12 -> RTS output (push-pull)
		GPIOA_CRH&=~((15<<GPIO_MODE9)|(15<<GPIO_MODE12));
    109a:	4a36      	ldr	r2, [pc, #216]	; (1174 <uart_open_channel+0x10c>)
    109c:	4b35      	ldr	r3, [pc, #212]	; (1174 <uart_open_channel+0x10c>)
    109e:	681b      	ldr	r3, [r3, #0]
    10a0:	f423 2370 	bic.w	r3, r3, #983040	; 0xf0000
    10a4:	f023 03f0 	bic.w	r3, r3, #240	; 0xf0
    10a8:	6013      	str	r3, [r2, #0]
		GPIOA_CRH|=(0xA<<GPIO_MODE9)|(0xA<<GPIO_MODE12);
    10aa:	4a32      	ldr	r2, [pc, #200]	; (1174 <uart_open_channel+0x10c>)
    10ac:	4b31      	ldr	r3, [pc, #196]	; (1174 <uart_open_channel+0x10c>)
    10ae:	681b      	ldr	r3, [r3, #0]
    10b0:	f443 2320 	orr.w	r3, r3, #655360	; 0xa0000
    10b4:	f043 03a0 	orr.w	r3, r3, #160	; 0xa0
    10b8:	6013      	str	r3, [r2, #0]
		enable_interrupt(USART1_IRQ);
    10ba:	2025      	movs	r0, #37	; 0x25
    10bc:	f7ff fe00 	bl	cc0 <enable_interrupt>
		break;
    10c0:	e037      	b.n	1132 <uart_open_channel+0xca>
	case USART2:
		RCC_APB1ENR|=(1<<RCC_APB1ENR_USART2EN);
    10c2:	4a2d      	ldr	r2, [pc, #180]	; (1178 <uart_open_channel+0x110>)
    10c4:	4b2c      	ldr	r3, [pc, #176]	; (1178 <uart_open_channel+0x110>)
    10c6:	681b      	ldr	r3, [r3, #0]
    10c8:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
    10cc:	6013      	str	r3, [r2, #0]
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPAEN);
    10ce:	4a28      	ldr	r2, [pc, #160]	; (1170 <uart_open_channel+0x108>)
    10d0:	4b27      	ldr	r3, [pc, #156]	; (1170 <uart_open_channel+0x108>)
    10d2:	681b      	ldr	r3, [r3, #0]
    10d4:	f043 0304 	orr.w	r3, r3, #4
    10d8:	6013      	str	r3, [r2, #0]
		// PA0 -> CTS input   (floating)
		// PA1 -> RTS output  (push-pull)
		// PA2 -> TX (push-pull)
		// PA3 -> RX (floating)
		GPIOA_CRL&=~((15<<GPIO_MODE1)|(15<<GPIO_MODE2));
    10da:	4a28      	ldr	r2, [pc, #160]	; (117c <uart_open_channel+0x114>)
    10dc:	4b27      	ldr	r3, [pc, #156]	; (117c <uart_open_channel+0x114>)
    10de:	681b      	ldr	r3, [r3, #0]
    10e0:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
    10e4:	6013      	str	r3, [r2, #0]
		GPIOA_CRL|=(0xA<<GPIO_MODE1)|(0xA<<GPIO_MODE2);
    10e6:	4a25      	ldr	r2, [pc, #148]	; (117c <uart_open_channel+0x114>)
    10e8:	4b24      	ldr	r3, [pc, #144]	; (117c <uart_open_channel+0x114>)
    10ea:	681b      	ldr	r3, [r3, #0]
    10ec:	f443 632a 	orr.w	r3, r3, #2720	; 0xaa0
    10f0:	6013      	str	r3, [r2, #0]
		enable_interrupt(USART2_IRQ);
    10f2:	2026      	movs	r0, #38	; 0x26
    10f4:	f7ff fde4 	bl	cc0 <enable_interrupt>
		break;
    10f8:	e01b      	b.n	1132 <uart_open_channel+0xca>
	case USART3:
		RCC_APB1ENR|=1<<RCC_APB1ENR_USART3EN;
    10fa:	4a1f      	ldr	r2, [pc, #124]	; (1178 <uart_open_channel+0x110>)
    10fc:	4b1e      	ldr	r3, [pc, #120]	; (1178 <uart_open_channel+0x110>)
    10fe:	681b      	ldr	r3, [r3, #0]
    1100:	f443 2380 	orr.w	r3, r3, #262144	; 0x40000
    1104:	6013      	str	r3, [r2, #0]
		RCC_APB2ENR|=(1<<RCC_APB2ENR_IOPBEN);
    1106:	4a1a      	ldr	r2, [pc, #104]	; (1170 <uart_open_channel+0x108>)
    1108:	4b19      	ldr	r3, [pc, #100]	; (1170 <uart_open_channel+0x108>)
    110a:	681b      	ldr	r3, [r3, #0]
    110c:	f043 0308 	orr.w	r3, r3, #8
    1110:	6013      	str	r3, [r2, #0]
		//PB10 -> TX output (push-pull)
		//PB11 -> RX input (floating)
		//PB13 -> CTS input (floating)
		//PB14 -> RTS output (push-pull)
		GPIOB_CRH&=~((15<<GPIO_MODE10)|(15<<GPIO_MODE14));
    1112:	4a1b      	ldr	r2, [pc, #108]	; (1180 <uart_open_channel+0x118>)
    1114:	4b1a      	ldr	r3, [pc, #104]	; (1180 <uart_open_channel+0x118>)
    1116:	681b      	ldr	r3, [r3, #0]
    1118:	f023 230f 	bic.w	r3, r3, #251662080	; 0xf000f00
    111c:	6013      	str	r3, [r2, #0]
		GPIOB_CRH|=(0xA<<GPIO_MODE10)|(0xA<<GPIO_MODE14);
    111e:	4a18      	ldr	r2, [pc, #96]	; (1180 <uart_open_channel+0x118>)
    1120:	4b17      	ldr	r3, [pc, #92]	; (1180 <uart_open_channel+0x118>)
    1122:	681b      	ldr	r3, [r3, #0]
    1124:	f043 230a 	orr.w	r3, r3, #167774720	; 0xa000a00
    1128:	6013      	str	r3, [r2, #0]
		enable_interrupt(USART3_IRQ);
    112a:	2027      	movs	r0, #39	; 0x27
    112c:	f7ff fdc8 	bl	cc0 <enable_interrupt>
		break;
    1130:	bf00      	nop
	}
	uart_set_baud(channel,baud);
    1132:	68f8      	ldr	r0, [r7, #12]
    1134:	68b9      	ldr	r1, [r7, #8]
    1136:	f7ff ff4b 	bl	fd0 <uart_set_baud>
	if (flow_ctrl==FLOW_HARD){
    113a:	687b      	ldr	r3, [r7, #4]
    113c:	2b01      	cmp	r3, #1
    113e:	d106      	bne.n	114e <uart_open_channel+0xe6>
		cr3=(uint32_t*)(channel+USART_CR3_OFS);
    1140:	68fb      	ldr	r3, [r7, #12]
    1142:	3314      	adds	r3, #20
    1144:	617b      	str	r3, [r7, #20]
		*cr3=(1<<USART_CR3_CTSE)|(1<<USART_CR3_RTSE);
    1146:	697b      	ldr	r3, [r7, #20]
    1148:	f44f 7240 	mov.w	r2, #768	; 0x300
    114c:	601a      	str	r2, [r3, #0]
	}
	cr1=(uint32_t*)(channel+USART_CR1_OFS);
    114e:	68fb      	ldr	r3, [r7, #12]
    1150:	330c      	adds	r3, #12
    1152:	613b      	str	r3, [r7, #16]
	*cr1=(1<<USART_CR1_UE)|(1<<USART_CR1_TE)|(1<<USART_CR1_RE)|(1<<USART_CR1_RXNEIE);
    1154:	693b      	ldr	r3, [r7, #16]
    1156:	f242 022c 	movw	r2, #8236	; 0x202c
    115a:	601a      	str	r2, [r3, #0]
}
    115c:	3718      	adds	r7, #24
    115e:	46bd      	mov	sp, r7
    1160:	bd80      	pop	{r7, pc}
    1162:	bf00      	nop
    1164:	40004800 	.word	0x40004800
    1168:	40013800 	.word	0x40013800
    116c:	40004400 	.word	0x40004400
    1170:	40021018 	.word	0x40021018
    1174:	40010804 	.word	0x40010804
    1178:	4002101c 	.word	0x4002101c
    117c:	40010800 	.word	0x40010800
    1180:	40010c04 	.word	0x40010c04

00001184 <uart_stat>:

// status de la console récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int uart_stat(unsigned channel){
    1184:	b480      	push	{r7}
    1186:	b085      	sub	sp, #20
    1188:	af00      	add	r7, sp, #0
    118a:	6078      	str	r0, [r7, #4]
	uint32_t *sr;
	
	sr=(uint32_t*)(channel+USART_SR_OFS);
    118c:	687b      	ldr	r3, [r7, #4]
    118e:	60fb      	str	r3, [r7, #12]
	return *sr&(1<<USART_SR_RXNE)?-1:0;
    1190:	68fb      	ldr	r3, [r7, #12]
    1192:	681b      	ldr	r3, [r3, #0]
    1194:	f003 0320 	and.w	r3, r3, #32
    1198:	2b00      	cmp	r3, #0
    119a:	d002      	beq.n	11a2 <uart_stat+0x1e>
    119c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    11a0:	e000      	b.n	11a4 <uart_stat+0x20>
    11a2:	2300      	movs	r3, #0
}
    11a4:	4618      	mov	r0, r3
    11a6:	3714      	adds	r7, #20
    11a8:	46bd      	mov	sp, r7
    11aa:	f85d 7b04 	ldr.w	r7, [sp], #4
    11ae:	4770      	bx	lr

000011b0 <uart_getc>:

// reçoit un caractère de la console
char uart_getc(unsigned channel){
    11b0:	b480      	push	{r7}
    11b2:	b085      	sub	sp, #20
    11b4:	af00      	add	r7, sp, #0
    11b6:	6078      	str	r0, [r7, #4]
	uint32_t *dr;
	
	dr=(uint32_t*)(channel+USART_DR_OFS);
    11b8:	687b      	ldr	r3, [r7, #4]
    11ba:	3304      	adds	r3, #4
    11bc:	60fb      	str	r3, [r7, #12]
	return *dr&0x7f;
    11be:	68fb      	ldr	r3, [r7, #12]
    11c0:	681b      	ldr	r3, [r3, #0]
    11c2:	b2db      	uxtb	r3, r3
    11c4:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    11c8:	b2db      	uxtb	r3, r3
}
    11ca:	4618      	mov	r0, r3
    11cc:	3714      	adds	r7, #20
    11ce:	46bd      	mov	sp, r7
    11d0:	f85d 7b04 	ldr.w	r7, [sp], #4
    11d4:	4770      	bx	lr
    11d6:	bf00      	nop

000011d8 <uart_putc>:

// transmet un caractère à la console
void uart_putc(unsigned channel, char c){
    11d8:	b480      	push	{r7}
    11da:	b085      	sub	sp, #20
    11dc:	af00      	add	r7, sp, #0
    11de:	6078      	str	r0, [r7, #4]
    11e0:	460b      	mov	r3, r1
    11e2:	70fb      	strb	r3, [r7, #3]
	uint32_t *dr, *sr;
	
	sr=(uint32_t*)(channel+USART_SR_OFS);
    11e4:	687b      	ldr	r3, [r7, #4]
    11e6:	60fb      	str	r3, [r7, #12]
	dr=(uint32_t*)(channel+USART_DR_OFS);
    11e8:	687b      	ldr	r3, [r7, #4]
    11ea:	3304      	adds	r3, #4
    11ec:	60bb      	str	r3, [r7, #8]
	//attend que dr soit vide
	while (!(*sr&(1<<USART_SR_TXE)));
    11ee:	bf00      	nop
    11f0:	68fb      	ldr	r3, [r7, #12]
    11f2:	681b      	ldr	r3, [r3, #0]
    11f4:	f003 0380 	and.w	r3, r3, #128	; 0x80
    11f8:	2b00      	cmp	r3, #0
    11fa:	d0f9      	beq.n	11f0 <uart_putc+0x18>
	*dr=c&0x7f;
    11fc:	78fb      	ldrb	r3, [r7, #3]
    11fe:	f003 027f 	and.w	r2, r3, #127	; 0x7f
    1202:	68bb      	ldr	r3, [r7, #8]
    1204:	601a      	str	r2, [r3, #0]
}
    1206:	3714      	adds	r7, #20
    1208:	46bd      	mov	sp, r7
    120a:	f85d 7b04 	ldr.w	r7, [sp], #4
    120e:	4770      	bx	lr
