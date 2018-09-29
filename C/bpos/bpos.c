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
#include <stdlib.h> 
#include "../include/stm32f103c8.h"
#include "../include/gen_macros.h"
#include "../include/blue_pill.h"
#include "../include/nvic.h"
#include "../include/usart.h"
#include "svcall.h"


#define CON USART2 // console utilise USART2

static volatile unsigned ticks=0;
static volatile unsigned timer=0;


void __attribute__((__interrupt__)) SVC_handler(){
	unsigned svc_id, argc;
	void **argv; 
	asm volatile (
	"mrs r0,PSP\n" // optient la valeur de PSP
	"ldr r1,[r0,#24]\n" // obtient le PC
	"sub r1,r1,#2\n" // PC avant le SVC
    "ldrb %[svc_id], [r1]\n" // charge l'octet faible i.e. no de service
    "ldr %[argc],[r0]\n"
    "ldr %[argv],[r0,#4]\n"
    : [svc_id] "=r" (svc_id), [argc] "=r" (argc), [argv] "=r" (argv) 
    );
	switch (svc_id){
	case SVC_LED_ON: 
		GPIOC_BRR=GRN_LED;
		break;
	case SVC_LED_OFF:
		GPIOC_BSRR=GRN_LED;
		break;
	case SVC_TIMER: 
		timer=argc;
		break;
	case SVC_PRIVILIGED:
		asm volatile(
		"mrs r0,CONTROL\n"
		"bic r0,#0\n"       // bit 0 sélectionne le niveau de privilège
		"msr CONTROL, r0\n"
		);
		break;
    case SVC_RESET:
	    _reset_mcu();
	    break;
	}	
}

// interruption coretimer
void __attribute__((__interrupt__)) STK_handler(){
	ticks++;
	if (timer) {timer--;}
}

#define RX_QUEUE_SIZE 32
static volatile char rx_queue[RX_QUEUE_SIZE];
static volatile unsigned head;
static volatile unsigned tail;

// interruption USART2 (console)
void __attribute__((__interrupt__)) USART2_handler(){
	if (USART2_SR&(1<<USART_SR_RXNE)){
		rx_queue[head++]=USART2_DR&0x7f;
		head&=RX_QUEUE_SIZE-1;
	}
}


// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
	 // active l'oscillateur externe
	RCC_CR|=1<<RCC_CR_HSEON;
	 // attend que l'oscillateur soit prêt
   while (! (RCC_CR & (1<<RCC_CR_HSERDY)));
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
    // active le PLL
    RCC_CR|=1<<RCC_CR_PLLON;
    // Attend que le PLL soit prêt
    while (! (RCC_CR & (1<<RCC_CR_PLLRDY)));
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR|=WAIT_2_CY;
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR|=PLL_CLK<<RCC_CFGR_SW;
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR|=PPRECLK_DIV2<<RCC_CFGR_PPRE1;
}

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
	STK_LOAD=MSEC_DLY-1;
	STK_CTRL=(1<<STK_TICKINT)|(1<<STK_ENABLE);
}

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
	RCC_APB2ENR|=1<<GPIOC_EN;
	GPIOC_CRH=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
}

inline static void led_on(){
	GPIOC_BRR=GRN_LED;
}

inline static void led_off(){
	GPIOC_BSRR=GRN_LED;
}

// délais en millisecondes
inline static void delay(unsigned dly){
	timer=dly;
	while (timer);
}

// supprime le mode d'exécution
// prévilégié au programme.
// REF: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0552a/CHDIGFCA.html
#define _unprivileged() ({\
	asm volatile (\
	"mrs r0, CONTROL\n"\
	"orr r0,#1\n"\
	"msr CONTROL,r0\n"\
	"isb\n"\
	);})
	
#define _svc_call(svc_no,nb_args,args_array) ({asm volatile (\
	"ldr r0, =%[argc]\n"\
	"mov r1, %[argv]\n"\
	"svc %[svc_id]\n":: [svc_id] "I" ((svc_no)&0xff),\
	[argc] "I" (nb_args),\
	[argv] "r" (args_array)\
	);})

//#define _wait_svc_completion() while (ICSR & (1<<PENDSVSET)|(1<<);
#define _wait_timeout() ({while (timer);})
// pour une période de 1 seconde
#define RATE 500 // millisecondes
const char *PROMPT="bpos version 0.1\n";

char getc(){
	char c=0;
	if (head!=tail){
		c=rx_queue[tail++];
		tail&=RX_QUEUE_SIZE-1;
	}
	return c;
}

void main(void){
	void **argv=NULL;
	set_sysclock();
	config_systicks();
	port_c_setup();
	con_open_channel(CON,115200,FLOW_HARD);
	_unprivileged(); // à partir d'ici exécution sans privilèges.
	const char *msg=PROMPT;
	while (*msg){conout(CON,*msg++);}
	char c;
	while (1){
		
		_svc_call(SVC_LED_OFF,0,argv);
		_svc_call(SVC_TIMER,RATE,argv);
		while(timer)if ((c=getc())) {conout(CON,c);}
		_svc_call(SVC_LED_ON,0,argv);
		_svc_call(SVC_TIMER,RATE,argv);
		while(timer)if ((c=getc())) {conout(CON,c);}
	}
}
