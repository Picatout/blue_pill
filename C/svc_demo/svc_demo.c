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
 *  2018-09-18, modification nom et prototype de SVC_handler
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
#define SVC_PRIVILIGED (4) // active l'exécution prévilégiée
#define SVC_RESET (5) // réinialise le MCU


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
		GPIOC_BRR->brr=GRN_LED;
		break;
	case SVC_LED_OFF:
		GPIOC_BSRR->bsrr=GRN_LED;
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
void __attribute__((__interrupt__)) SYSTICK_handler(){
	ticks++;
	if (timer) {timer--;}
}

// configure SYSCLK à la fréquence maximale de 72 Mhz
// en utilisant le cristal externe (HSE) et le PLL
static void set_sysclock(){
	 // active l'oscillateur externe
	RCC_CR->fld.hseon=1;
	 // attend que l'oscillateur soit prêt
   while (!RCC_CR->fld.hserdy);
     // sélection PREDIV1 pour la source du PLL
     // multiplie la fréquence HSE par 9 
     // pour une fréquence maximale Fsysclk de 72 Mhz
    RCC_CFGR->cfgr|=(PLLSRC_PREDIV1<<RCC_CFGR_PLLSRC)|(PLLMUL9<<RCC_CFGR_PLLMUL);
    // active le PLL
    RCC_CR->fld.pllon=1;
    // Attend que le PLL soit prêt
    while (!RCC_CR->fld.pllrdy);
    // ajoute délais d'accès à la mémoire flash
    FLASH_ACR->fld.latency=WAIT_2_CY;
    // SélectionNE le PLL comme source pour SYSCLK
    RCC_CFGR->fld.sw=PLL_CLK;
	// La fréquence maximale pour APB1 doit-être de 36 Mhz
	// donc divise SYSCLK/2
	RCC_CFGR->fld.ppre1=PPRECLK_DIV2;
}

// configure SYSTICKS pour un cycle 1 msec
// source AHB/8
// valeur reload 72Mhz/8/1000=9000
#define MSEC_DLY 9000
static void config_systicks(){
	*SYST_RVR=MSEC_DLY-1;
	SYST_CSR->csr=(1<<SYST_TICKINT)|(1<<SYST_ENABLE);
}

#define _mask_cnf(cnf,bit) (cnf & ~(CNF_MASK<<((bit&7)*4)))
#define _apply_cnf(cnf,bit,pin_cnf) (_mask_cnf(cnf,bit) | pin_cnf<<((bit&7)*4)) 
// PC13 mode{0:1}=10, CNF{2:3}=01 -> 6
#define PC13_CNF 6
static void port_c_setup(){
	APB2ENR->fld.iopcen=1;
	GPIOC_CRH->cr=_apply_cnf(DEFAULT_PORT_CNF,LED_PIN,PC13_CNF);
}

static inline void led_on(){
	GPIOC_BRR->brr=GRN_LED;
}

static inline void led_off(){
	GPIOC_BSRR->bsrr=GRN_LED;
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
void main(void){
	void **argv=NULL;
	set_sysclock();
	config_systicks();
	port_c_setup();
	_unprivileged(); // à partir d'ici exécution sans privilèges.
	while (1){
		_svc_call(SVC_LED_OFF,0,argv);
		_svc_call(SVC_TIMER,RATE,argv);
		_wait_timeout();
		_svc_call(SVC_LED_ON,0,argv);
		_svc_call(SVC_TIMER,RATE,argv);
		_wait_timeout();
	}
}
