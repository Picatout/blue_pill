/*
 * Description: shell de commande. CCP pour Console Command Processor (nom utilisé dans CP/M).
 * 
 * Auteur: PICATOUT
 * Date: 2018-12-31
 * Copyright Jacques Deschênes, 2018, 2019
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/gen_fn.h"
#include "svcall.h"
#include "console.h"
#include "gdi.h"
#include "bpos.h"


static int skip(char *buffer, int start, char c);
static int scan(char *buffer, int start, char c);
static int next(char *buffer, int start, char c);
static void word();

const char *VERSION="bpos version 0.1\n";

#define CMD_MAX_LEN 80


// pile des arguments des commandes.
// sommet de la pile contient valeur retournée
// par la dernière commande. 
static uint32_t astack[32];
// pointeur de la pile
static int sp=0;
// macros gestion de la pile des arguments
#define push(x) astack[sp++]=(x)  // empile un argument
#define pop(x) astack[--sp]		// dépile un argument
#define drop() --sp				// jette le sommet de la pile
#define argc() sp				// nombre d'argument sur la pile


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
	word();
	tm=atoi((const char*)pad);
	pause(tm);
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

static void cmd_here(){
	uint32_t u;
	int i;
	word();
	u=atoi((const char*)pad);
	_svc_call(SVC_HERE,&u,NUL);
	*(uint32_t*)pad=u;
}

static void cmd_ffa(){
	uint32_t u;
	int i;
	word();
	u=atoi((const char*)pad);
	_svc_call(SVC_FFA,&u,NUL);
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
	if ((void*)adr>=ffa){
		_svc_call(SVC_FLASH_WR,&adr,&u32);
		if (!adr) print(" failed\n");
	}else{
		print("invalid address\n");
	}
}

static void cmd_pgerase(){
	uint32_t adr;
	word();
	adr=atoi((const char*)pad);
	if ((void*)adr>=ffa){
		_svc_call(SVC_FLASH_PGER,&adr,0);
		if (!adr) print(" failed\n");
	}else{
		print("invalid address\n");
	}
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
	{"here",cmd_here},
	{"ffa",cmd_ffa},
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


void ccp(){
	unsigned llen;

	cls();
	print(VERSION);
	while (1){
		conout('>');
		llen=read_line(tib,CMD_MAX_LEN);
		parse_line(llen);
	}
}

