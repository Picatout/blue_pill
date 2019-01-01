/*
 * Description: un petit système d'exploitation inspiré de CP/M
 * 
 * Auteur: PICATOUT
 * Date: 2018-09-28
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

//#include <stdlib.h> 
//#include <string.h>
#include "../include/blue_pill.h"
//#include "../include/nvic.h"
//#include "../include/usart.h"
#include "console.h"
#include "svcall.h"
#include "tvout.h"
#include "keyboard.h"
#include "vt100.h"
#include "gdi.h"
#include "sdcard.h"
#include "ccp.h"
#include "bpos.h"

#define _pause(tm)  ({do {_svc_call(SVC_GET_TIMER,&tm,NUL);} while (tm);})

const void* TPA_TOP=(void*)_TPA_TOP;

void* here;
void* ffa;
uint32_t proga;



// ********************
// routine de services
// ********************

static inline uint8_t peek8(uint8_t *adr){
	return *adr;
}

static inline uint16_t peek16(uint16_t *adr){
	return *adr;
}

static inline uint32_t peek32(uint32_t *adr){
	return *adr;
}

static inline void poke8(uint8_t *adr, uint8_t value){
	*adr=value;
}

static inline void poke16(uint16_t *adr, uint16_t value){
	*adr=value;
}

static inline void poke32(uint32_t *adr, uint32_t value){
	*adr=value;
}

// interruption multiplexeur des appels de services
void __attribute__((__interrupt__)) SVC_handler(){
	int svc_id;
	void *arg1, *arg2; 
	asm volatile (
	"mrs r0,PSP\n\t" // optient la valeur de PSP
	"ldr r1,[r0,#24]\n\t" // obtient le PC
    "ldrb %[svc_id], [r1,#-2]\n\t" // charge l'octet faible i.e. no de service
    "ldr %[arg1],[r0]\n\t"
    "ldr %[arg2],[r0,#4]\n\t"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [arg2] "=r" (arg2)
    :: "r0","r1" 
    );
	switch (svc_id){
	case SVC_LED_ON:
		write_pin(LED_PORT,LED_PIN,LED_ON);
		//led_on();
		break;
	case SVC_LED_OFF:
		write_pin(LED_PORT,LED_PIN,LED_OFF);
		//led_off();
		break;
	case SVC_TIMER:
		timer=(*(unsigned*)arg1);
		break;
	case SVC_GET_TIMER:
		*(unsigned*)arg1=timer;
		break;
	case SVC_CONIN:
		*(char *)arg1=conin();
		break;
	case SVC_CONOUT:
		conout(*(char *)arg1);
		break;
	case SVC_READLN:
		*(unsigned *)arg1=read_line((char *)arg2,*(unsigned *)arg1);
		break;
	case SVC_PRINT:
		print((const char*)arg1);
		break;
	case SVC_PRINT_DEC:
		print_int(*(int32_t*)arg1,10);
		break;
	case SVC_PRINT_HEX:
		print_hex(*(uint32_t*)arg1);
		break;
	case SVC_PEEK8:
	    *(uint8_t *)arg1=peek8((uint8_t *)*(uint32_t*)arg1);
		break;
	case SVC_PEEK16:
		*(uint16_t*)arg1=peek16((uint16_t*)*(uint32_t*)arg1);
		break;
	case SVC_PEEK32:
		*(uint32_t*)arg1=peek32((uint32_t*)*(uint32_t*)arg1);
		break;
	case SVC_POKE8:
		poke8((uint8_t*)*(uint32_t *)arg1,*(uint8_t*)arg2);
		break;
	case SVC_POKE16:
		poke16((uint16_t*)(*(uint32_t*)arg1),*(uint16_t*)arg2);
		break;
	case SVC_POKE32:
		poke32((uint32_t*)(*(uint32_t*)arg1),*(uint32_t*)arg2);
		break;
	case SVC_FLASH_WR:
		*(int*)arg1=flash_write(*(uint32_t*)arg1,*(uint16_t*)arg2);
		break;
	case SVC_FLASH_PGER:
		*(int*)arg1=flash_erase_page(*(uint32_t*)arg1);
		break;
	case SVC_TICKS:
		*(unsigned*)arg1=ticks;
		break;
	case SVC_CLS:
		cls();
		break;
	case SVC_HERE:
		*(uint32_t*)arg1=(uint32_t)here;
		break;
	case SVC_FFA:
		*(uint32_t*)arg1=(uint32_t)ffa;
		break;
    case SVC_RESET:
	    reset_mcu();
	    break;
	}	
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
	 // active l'oscillateur externe
	RCC->CR|=RCC_CR_HSEON;
	 // attend que l'oscillateur soit prêt
   while (!(RCC->CR&RCC_CR_HSERDY));
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 8 
     // pour une fréquence  Fsysclk de 64 Mhz
    RCC->CFGR|=RCC_CFGR_PLLSRC_HSE|(PLLMUL<<RCC_CFGR_PLLMUL_POS);
    // active le PLL
    RCC->CR|=RCC_CR_PLLON;
    // Attend que le PLL soit prêt
    while (!(RCC->CR&RCC_CR_PLLRDY));
    // ajoute délais d'accès à la mémoire flash
    // active le prefetch buffer
    FLASH->ACR|=(WAIT_2_CY<<FLASH_ACR_LATENCY_POS)|FLASH_ACR_PRFTBE;
	// La fréquence maximale pour APB1 doit-être de <=36 Mhz
	// donc divise SYSCLK/2
    // Sélectionne le PLL comme source pour SYSCLK dans CR
	RCC->CFGR|=(RCC_CFGR_PPREx_DIV2<<RCC_CFGR_PPRE1_POS)|(RCC_CFGR_SW_PLL<<RCC_CFGR_SW_POS);
}



// supprime le mode d'exécution
// prévilégié au programme.
// REF: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0552a/CHDIGFCA.html
/*
#define _unprivileged() ({\
	asm volatile (\
	"mrs r0, CONTROL\n"\
	"orr r0,#1\n"\
	"msr CONTROL,r0\n"\
	"isb\n"\
	);})
	
*/

//#define _wait_svc_completion() while (ICSR & (1<<PENDSVSET)|(1<<);
#define _wait_timeout() ({while (timer);})



void __attribute__((section(".user_code"),noinline,used/*,optimize(0)*/)) blink(){
	volatile unsigned int  delay=500;
	volatile unsigned int tm;
	volatile char c=0;
	
	_svc_call(SVC_PRINT,"blinking led, any key to stop.\n",0);
	while(1){
		_svc_call(SVC_LED_OFF,NUL,NUL);
		_svc_call(SVC_TIMER,&delay,NUL);
		_pause(tm);//_svc_call(SVC_WAIT_TIMER,NUL,NUL);
		_svc_call(SVC_LED_ON,NUL,NUL);
		_svc_call(SVC_TIMER,&delay,NUL);
		_pause(tm); //_svc_call(SVC_WAIT_TIMER,NUL,NUL);
		_svc_call(SVC_CONIN,&c,NUL);
		if (c) break;
	}
}


void copy_blink_in_ram(){
	volatile uint32_t *start;
	uint32_t *end,*ram_fn;
	start=(uint32_t*)&_FLASH_FREE;
	end=(uint32_t*)&_DATA_ROM_START;
	ram_fn=(uint32_t*)&_TPA_START;
	while (start<end){
		*ram_fn++=*start++;
	}
	here=ram_fn;
}

extern void print_fault(const char *msg, sfrp_t adr);


void main(void){
	set_sysclock();
	set_int_priority(IRQ_SVC,15);
	config_systicks();
	flash_enable();
	RCC->APB2ENR=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_IOPBEN|RCC_APB2ENR_IOPCEN|RCC_APB2ENR_AFIOEN;
	RCC->APB1ENR=RCC_APB1ENR_SPI2EN;
	RCC->AHBENR|=RCC_AHBENR_DMA1EN; // activation DMA1
	config_pin(LED_PORT,LED_PIN,OUTPUT_OD_SLOW);
	vt_init();
	keyboard_init();
	tvout_init();
	console_init(SERIAL);
	if (!vt_ready()){con_select(LOCAL);}
	copy_blink_in_ram();
	_svc_call(SVC_LED_ON,NUL,NUL);
	print("initializing SDcard\n");
	if (sdcard_init()){
			print("SDcard capacity: ");print_int(sdcard_capacity(),10);print(" Mo\n");
	}else{
		print("SDcard initialization failed, status code: "); print_hex(sdc_status);conout('\n');
	} 
	ccp();
}
