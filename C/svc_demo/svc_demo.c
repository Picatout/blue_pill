/*
 * Description: Utilisation du coretime pour implémenter un systemtick qui est incrémenté
 * à la milliseconde. Utilisation d'une interruption.
 * Auteur: PICATOUT
 * Date: 2018-08-20
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 *  2018-08-30, blink_v2 version amélioré de blink
 * 		clock HSE + PLL Fsys= 72Mhz
 *      Utilisation du core timer pour créer un délais 1 milliseconde.
 * 
 */
#include <stdlib.h> 
#include "../include/stm32f103c8.h"
#include "../include/gen_macros.h"
#include "../include/blue_pill.h"
#include "../include/nvic.h"

typedef struct svcall_struct{
	uint32_t fn; // no. de fonction
	uint32_t argc; // nombre d'arguments
	void **argv; // liste de pointer vers les arguments
} t_svcall_struct;

static volatile unsigned ticks=0;
static volatile unsigned timer=0;

// interruption SVcall
#define SVC_LED_ON (1) // allume la LED verte
#define SVC_LED_OFF (2) // éteint la LED verte
#define SVC_TIMER (3) // démarre la minuterie

void __attribute__((naked)) SVcall_handler(){
	unsigned svc_id, argc;
	void **argv; 
	asm volatile (
	"mrs r0,PSP\n" // optient la valeur de PSP
	"ldr r1,[r0,#24]\n"
	"sub r1,r1,#2\n"
    "ldrb %[svc_id], [r1]\n"
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
	}	
}

// interruption coretimer
void __attribute__((__interrupt__)) systick_int(){
	ticks++;
	if (timer) {timer--;}
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
	RCC_CFGR|=PPRECLK_DIV2;
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
#define _remove_privileges() ({\
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

#define _wait_svc_completion() while (ICSR & (1<<PENDSVSET)|(1<<);
#define _wait_timeout() ({while (timer);})
// pour une période de 1 seconde
#define RATE 500 // millisecondes
void main(void){
	void **argv=NULL;
	set_sysclock();
	config_systicks();
	port_c_setup();
	_remove_privileges();
	while (1){
		//_svc_call(SVC_LED_OFF,0,argv);
		led_off();
		_svc_call(SVC_TIMER,RATE,argv);
		_wait_timeout();
		_svc_call(SVC_LED_ON,0,argv);
		_svc_call(SVC_TIMER,RATE,argv);
		_wait_timeout();
	}
}
