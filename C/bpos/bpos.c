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
#include "../include/stm32f103c8.h"
#include "../include/gen_macros.h"
#include "../include/blue_pill.h"
#include "../include/nvic.h"
#include "../include/usart.h"
#include "../include/console.h"
#include "svcall.h"

int strcmp(const char * s1, const char * s2){
	int result=0;
	while (*s1 && *s2){
		if (*s1<*s2){
			result=-1;
			break;
		}else if (*s1>*s2){
			result=1;
			break;
		}
		s1++;
		s2++;
	}
	if (!result){
		if (!*s1 && *s2){
			result=-1;
		}else if (*s1 && !*s2) {
			result=1;
		}
	}
	return result;
}

int digit(char c){
   return ((c>='0') && (c<='9'));
}

int atoi(const char *str){
	int n=0,sign=1;
	while (*str && (*str==SPACE)) str++;
	if (*str=='-'){
		sign=-1;
		str++;
	}
	while (*str && digit(*str)){
		n=n*10+(*str-'0');
		str++;
	}
	return sign*n;
}


static volatile unsigned ticks=0;
static volatile unsigned timer=0;

static int skip(char *buffer, int start, char c);
static int scan(char *buffer, int start, char c);
static int next(char *buffer, int start, char c);
static void move(char *src , char *dest, int len);
static void word();



void __attribute__((__interrupt__)) SVC_handler(){
	int svc_id, *arg1;
	void **argv; 
	asm volatile (
	"mrs r0,PSP\n" // optient la valeur de PSP
	"ldr r1,[r0,#24]\n" // obtient le PC
	"sub r1,r1,#2\n" // PC avant le SVC
    "ldrb %[svc_id], [r1]\n" // charge l'octet faible i.e. no de service
    "ldr %[arg1],[r0]\n"
    "ldr %[argv],[r0,#4]\n"
    : [svc_id] "=r" (svc_id), [arg1] "=r" (arg1), [argv] "=r" (argv) 
    );
	switch (svc_id){
	case SVC_LED_ON: 
		GPIOC_BRR=GRN_LED;
		break;
	case SVC_LED_OFF:
		GPIOC_BSRR=GRN_LED;
		break;
	case SVC_TIMER: 
		timer=*(unsigned*)arg1;
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
		*(unsigned *)arg1=read_line((char *)argv,*(unsigned *)arg1);
		break;
	case SVC_PRINT:
		print((const char*)arg1);
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
	

//#define _wait_svc_completion() while (ICSR & (1<<PENDSVSET)|(1<<);
#define _wait_timeout() ({while (timer);})


const char *VERSION="bpos version 0.1\n";

#define CMD_MAX_LEN 80

static char tib[CMD_MAX_LEN];
static char pad[CMD_MAX_LEN];
static unsigned in;

typedef struct shell_cmd{
    const char *name;
    void (*fn)(void);
}shell_cmd_t;

static const shell_cmd_t commands[];
int search_command(const char * name);

// redémarre le CPU
static void cmd_reset(){
	_svc_call(SVC_RESET,NUL,NUL);
}

// allume la LED
static void cmd_led_on(){
	_svc_call(SVC_LED_ON,NUL,NUL);
}

// éteint la LED
static void cmd_led_off(){
	_svc_call(SVC_LED_OFF,NUL,NUL);
}

// démarre la minuterie
static void cmd_set_timer(){
	int n;
	word();
	n=atoi(pad);
	_svc_call(SVC_TIMER,&n,NUL);
}

// attend l'expiration de la minuterie
static void cmd_wait_time_out(){
	unsigned t=1;
	while (t){
		_svc_call(SVC_GET_TIMER,&t,NUL);
	}
}

// reçoit un caractère dans pad
static void cmd_getc(){
	char n=0;
	while (!n){
		_svc_call(SVC_CONIN,&n,NUL);
	}
	pad[0]=n;
	pad[1]=0;
}

// envoie le caractère en première position du pad
static void cmd_putc(){
	int cmd_id;
	word();
	cmd_id=search_command(pad);
	if (cmd_id>-1) commands[cmd_id].fn();
	_svc_call(SVC_CONOUT,pad,NUL);
}

static void cmd_readln(){
	unsigned llen=80;
	_svc_call(SVC_READLN,&llen,pad);
	print(pad);
}

static void cmd_print(){
	in=skip(tib,in,SPACE);
	_svc_call(SVC_PRINT,&tib[in],NUL);
	while (tib[in]) in++;
}

static const shell_cmd_t commands[]={
	{"rst",cmd_reset},
	{"ledon",cmd_led_on},
	{"ledoff",cmd_led_off},
	{"timer",cmd_set_timer},
	{"timeout",cmd_wait_time_out},
	{"getc",cmd_getc},
	{"putc",cmd_putc},
	{"readln",cmd_readln},
	{"print",cmd_print},
	{NUL,NUL}
};


int search_command(const char * name){
	int i=0;
	while (commands[i].fn){
		if (!strcmp(commands[i].name,name)){
			break;
		}
		i++;
	}
	if (!commands[i].fn) i=-1;
	return i;
}


// saute tous les caractères 'c' à partir de la position 'start'
// retourne la nouvelle position
static int skip(char *buffer, int start, char c){
	while (buffer[start] && buffer[start]==c) start++;
	return start;
}

// recherche la première occurance de 'c'
static int scan(char *buffer, int start, char c){
	while (buffer[start] && buffer[start]!=c) start++;
	return start;
}

// retourne la longueur du prochain mot
// 'c' est le séparateur de mots
static int next(char *buffer, int start, char c){
	int end;
	end=start;
	while (buffer[end] && (buffer[end]!=c)) end++;
	return end-start;
}

// copie 'len' caractères de src vers dest
static void move(char *src , char *dest, int len){
	while (len){
		*dest++=*src++;
		len--;
	}
	*dest=0;
}

// extrait le prochain mot du tib
static void word(){
		int len;
		in=skip(tib,in,SPACE);
		len=next(tib,in,SPACE);
		move(&tib[in],pad,len);
		in+=len;
}

static void parse_line(unsigned llen){
	int cmd_id;
	in=0;
	while (in<llen){
		word();
		cmd_id=search_command((const char*) pad);
		if (cmd_id>-1){
			commands[cmd_id].fn();
		}else{
			print(pad); conout('?');
			break;
		}
	}//while
	conout(CR);
}


void main(void){
	set_sysclock();
	set_int_priority(IRQ_SVC,15);
	config_systicks();
	port_c_setup();
	uart_open_channel(CON,115200,FLOW_HARD);
	_unprivileged(); // à partir d'ici exécution sans privilèges.
	cls();
	print(VERSION); 
	_svc_call(SVC_LED_ON,NUL,NUL);
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
		parse_line(llen);
	}
}
