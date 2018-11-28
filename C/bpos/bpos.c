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


#define _pause(tm)  ({do {_svc_call(SVC_GET_TIMER,&tm,NUL);} while (tm);})

extern unsigned int _TCA_START;
extern unsigned int _FLASH_FREE;
extern unsigned int _DATA_ROM_START;

uint32_t proga;

int strcmp(const char *s1, const char *s2){
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

int hexdigit(char c){
	if (c>='a') c-=32;
	return (digit(c) || (c>='A' && c<='F'));
}

int atoi(const char *str){
	int n=0,sign=1,base=10;
    char c;
    
	while (*str && (*str==SPACE)) str++;
	if (*str=='-'){
		sign=-1;
		str++;
	}
	if (*str=='0' && ((*(str+1)=='x')||(*(str+1)=='X'))){
		base=16;
		str+=2;
	}
	while ((c=*str) && base==10?digit(c):hexdigit(c)){
		if (c>='a'){c-=32;}
		c-='0';
		if (c>9){c-=7;}
		n=n*base+c;
		str++;
	}
	return sign*n;
}


typedef void (*fn)(void);


static int skip(char *buffer, int start, char c);
static int scan(char *buffer, int start, char c);
static int next(char *buffer, int start, char c);
static void move(char *src , char *dest, int len);
static void word();

// routine de services


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
/*	
	case SVC_PRIVILIGED:
		asm volatile(
		"mrs r0,CONTROL\n"
		"bic r0,#0\n"       // bit 0 sélectionne le niveau de privilège
		"msr CONTROL, r0\n"
		);
		break;
*/ 
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


const char *VERSION="bpos version 0.1\n";

#define CMD_MAX_LEN 80

static char tib[CMD_MAX_LEN];
static volatile char pad[CMD_MAX_LEN];
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
	volatile int n;
	word();
	n=atoi((const char*)pad);
	_svc_call(SVC_TIMER,&n,NUL);
}

static void cmd_get_timer(){
	_svc_call(SVC_GET_TIMER,&pad,NUL);
}

// attend l'expiration de la minuterie
static void cmd_pause(){
	volatile unsigned tm;
	_pause(tm);
}

// reçoit un caractère dans pad
static void cmd_getc(){
	volatile char n=0;
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
	cmd_id=search_command((const char*)pad);
	if (cmd_id>-1) commands[cmd_id].fn();
	_svc_call(SVC_CONOUT,pad,NUL);
}

static void cmd_readln(){
	unsigned llen=80;
	_svc_call(SVC_READLN,&llen,pad);
	print((const char*)pad);
}

static void cmd_print(){
	word();
	_svc_call(SVC_PRINT,pad,NUL);
}

static void cmd_print_dec(){
	int cmd_id;
    unsigned u32;
    
	word();
	cmd_id=search_command((const char*)pad);
	if (cmd_id>-1){
		 commands[cmd_id].fn();
	 }else{
		cmd_id=atoi((const char*)pad);
		*(int*)pad=cmd_id;
	 }
	_svc_call(SVC_PRINT_DEC,pad,NUL);
}

static void cmd_print_hex(){
	int cmd_id;
	word();
	cmd_id=search_command((const char*)pad);
	if (cmd_id>-1){
		 commands[cmd_id].fn();
	 }else{
		cmd_id=atoi((const char*)pad);
		*(int*)pad=cmd_id;
	 }
	_svc_call(SVC_PRINT_HEX,pad,NUL);
}

static void cmd_run(){
	((fn)proga)();
	
}

static void cmd_peek8(){
	uint32_t u;
	word();
	u=atoi((const char*)pad);
	_svc_call(SVC_PEEK8,&u,NUL);
	*(uint32_t*)pad=u&0xff;
}

static void cmd_peek16(){
	uint32_t u;
	word();
	u=atoi((const char*)pad);
	_svc_call(SVC_PEEK16,&u,NUL);
	*(uint32_t*)pad=u&0xffff;
}

static void cmd_peek32(){
	uint32_t u;
	int i;
	word();
	u=atoi((const char*)pad);
	_svc_call(SVC_PEEK32,&u,NUL);
	*(uint32_t*)pad=u;
}

static void cmd_poke8(){
	uint32_t adr;
	uint8_t u8;
	word();
	adr=atoi((const char*)pad);
	word();
	u8=atoi((const char*)pad);
	_svc_call(SVC_POKE8,&adr,&u8);
}

static void cmd_poke16(){
	uint32_t adr;
	uint16_t u16;
	word();
	adr=atoi((const char*)pad);
	word();
	u16=atoi((const char*)pad);
	_svc_call(SVC_POKE16,&adr,&u16);
}

static void cmd_poke32(){
	uint32_t adr,u32;
	
	word();
	adr=atoi((const char*)pad);
	word();
	u32=atoi((const char*)pad);
	_svc_call(SVC_POKE32,&adr,&u32);
}

static void cmd_fwrite(){
	uint32_t adr,u32;
	word();
	adr=atoi((const char*)pad);
	word();
	u32=atoi((const char*)pad);
	_svc_call(SVC_FLASH_WR,&adr,&u32);
	if (!adr) print(" failed\n");
}

static void cmd_pgerase(){
	uint32_t adr;
	word();
	adr=atoi((const char*)pad);
	_svc_call(SVC_FLASH_PGER,&adr,0);
	if (!adr) print(" failed\n");
}

static void cmd_ticks(){
	_svc_call(SVC_TICKS,&pad,0);
}

static void cmd_con(){
	console_dev_t dev;
	word();
	if (!strcmp("local",(const char*)pad)){
		dev=LOCAL;
	}else{
		dev=SERIAL;
	}
	con_select(dev);
}

void cmd_cls(){
	_svc_call(SVC_CLS,0,0);
}

void cmd_help(){
	const char *str;
	int i=0;
	print("commands list:\n");
	str=commands[i].name;
	while (str){
		print(str);
		conout('\t');
		i++;
		if (!(i%6)) {conout('\n');}
		str=commands[i].name;	
	}
}

void cmd_rect(){
	int x,y,w,h;
	word();
	x=atoi((const char*)pad);
	word();
	y=atoi((const char*)pad);
	word();
	w=atoi((const char*)pad);
	word();
	h=atoi((const char*)pad);
	gdi_rect(x,y,w,h,WHITE_BIT);		
}

static const shell_cmd_t commands[]={
	{"cls",cmd_cls},
	{"con",cmd_con},
	{"fwrite",cmd_fwrite},
	{"getc",cmd_getc},
	{"help",cmd_help},
	{"ledoff",cmd_led_off},
	{"ledon",cmd_led_on},
	{"pause",cmd_pause},
	{"peek16",cmd_peek16},
	{"peek32",cmd_peek32},
	{"peek8",cmd_peek8},
	{"pgerase",cmd_pgerase}, 
	{"poke16",cmd_poke16},
	{"poke32",cmd_poke32},
	{"poke8",cmd_poke8},
	{"print",cmd_print},
	{"printd",cmd_print_dec},
	{"printx",cmd_print_hex},
	{"putc",cmd_putc},
	{"readln",cmd_readln},
	{"rect",cmd_rect},
	{"rst",cmd_reset},
	{"run",cmd_run},
	{"ticks",cmd_ticks},
	{"timer",cmd_set_timer},
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

// copie une chaîne entre guillemets dans pad.
// retourne la position finale.
static int quote(char *buffer, int start){
	int escaped=0,end=start, i=0, in_quote=1;;
	while (buffer[end]&& in_quote){
		switch (buffer[end]){
		case '"':
			if (!escaped) {in_quote=0;} else{pad[i++]='"'; escaped=0;}
			break;
		case '\\':
			if (!escaped){
				escaped=1;
			}else{
				escaped=0;
				pad[i++]=buffer[end];
			}
			break;
		case 'n':
			if (escaped) buffer[end]=CR;
		default:
			escaped=0;
			pad[i++]=buffer[end];
		}
		end++;
	}
	pad[i]=0;
	return end;
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
		if (tib[in]=='"'){
			in++;
			in=quote(tib,in);
		}else{
			len=next(tib,in,SPACE);
			move(&tib[in],(char*)pad,len);
			in+=len;
		}
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
			conout(CR);
			print((const char*)pad); conout('?');
			break;
		}
	}//while
	conout(CR);
}


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
	ram_fn=(uint32_t*)&_TCA_START;
	while (start<end){
		*ram_fn++=*start++;
	}
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
	cls();
	print(VERSION);
	copy_blink_in_ram();
	print("Transient program address: ");_svc_call(SVC_PRINT_HEX,&proga,NUL); conout(CR);
	_svc_call(SVC_LED_ON,NUL,NUL);
	print("initializing SDcard\n");
	if (sdcard_init()){
			print("SDcard capacity: ");print_int(sdcard_capacity(),10);print(" Mo\n");
	}else{
		print("SDcard initialization failed, status code: "); print_hex(sdc_status);conout('\n');
	} 
	unsigned llen;
	while (1){
		llen=read_line(tib,CMD_MAX_LEN);
		parse_line(llen);
	}
}
