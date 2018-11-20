/*
 * Description: interface clavier PS/2
 * Auteur: PICATOUT
 * Date: 2018-11-06
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * Description: Le clavier est utilisé sans le signal clock. La ligne data étant simplement envoyé à la broche RX d'un périphérique USART.
 * 		Le signal envoyé par le clavier est à 12500 BAUD avec parité. Le USART1 est utilisé.
 * revisions:
 * 
 */
 
#include "keyboard.h"
#include "console.h"
#include "vt100.h"
#include "gdi.h"

#define QUEUE_SIZE (32)
//static unsigned char con_queue[QUEUE_SIZE];
//static int head=0,tail=0;
 
// commande RAZ clavier
#define KBD_RESET 0xFF  
// test clavier réussi (Basic Assurance Test)
#define BAT_OK    0xAA    


// code réception clavier ps2
#define F_ERR_PARITY 1 // erreur paritée dans rx_flags
#define F_RCVD 2 // signal réception d'un octet du clavier dans rx_flags
#define F_BATOK 4 // succès BAT
#define F_ERR_FRAME 8 // erreur sur stop bit
#define F_ERROR (F_ERR_PARITY|F_ERR_FRAME)

volatile static unsigned char ps2_flags;


/*
// envoie une commande au clavier
static int KbdSend(char cmd){
    register unsigned int dly;
    unsigned char bit_cnt,parity;
    unsigned t0;
     
    bit_cnt=0;
	parity=0;
	// désactive les interruptions sur KBD_CLK
	disable_interrupt(IRQ_KBD_CLK);
	// MCU prend le contrôle de la ligne KBD_CLK 
	config_pin((unsigned)KBD_PORT,KBD_CLK_BIT,OUTPUT_OD_FAST);
	//KBD_PORT->CRH&=~(15<<(KBD_CLK_BIT-8)<<2);
	//KBD_PORT->CRH|=(OUTPUT_OD_MED<<(KBD_CLK_BIT-8)<<2);
    //  mis à 0  KBD_CLK
    KBD_PORT->ODR&=~KBD_CLK_PIN; 
    // délais
    pause(1);
    // prend le contrôle de la ligne KBD_DAT
	config_pin((unsigned)KBD_PORT,KBD_DAT_BIT,OUTPUT_OD_FAST);
	//KBD_PORT->CRH&=~(15<<(KBD_DAT_BIT-8)<<2);
	//KBD_PORT->CRH|=(OUTPUT_OD_MED<<(KBD_DAT_BIT-8)<<2);
	KBD_PORT->ODR&=~KBD_DAT_PIN; // met KBD_DAT à zéro
	// libère la ligne clock
	config_pin((unsigned)KBD_PORT,KBD_CLK_BIT,INPUT_FLOAT);
	//KBD_PORT->CRH&=~(15<<(KBD_CLK_BIT-8)<<2);
	//KBD_PORT->CRH|=(INPUT_FLOAT<<(KBD_CLK_BIT-8)<<2);
    t0=ticks+100;
    while (!(KBD_PORT->IDR&KBD_CLK_PIN)); // attend que la ligne revienne à 1
    while (bit_cnt<8){      // envoie les 8 bits, le moins significatif en premier.
		while ((ticks<t0) && KBD_PORT->IDR&KBD_CLK_PIN);   // attend clock à 0
        if (ticks>=t0) return 0; // pas de réponse du clavier. (pas de clavier!!)
        if (cmd&1){
			KBD_PORT->ODR|=KBD_DAT_PIN;
			parity++;
		}else{
			KBD_PORT->ODR&=~KBD_DAT_PIN;
		}
		cmd >>= 1;
		while (!(KBD_PORT->IDR&KBD_CLK_PIN)); // attend clock à 1
		bit_cnt++;				  // un bit de plus envoyé.
	}
    while (KBD_PORT->IDR&KBD_CLK_PIN);   // attend clock à 0
	if (!(parity & 1)){
			KBD_PORT->ODR|=KBD_DAT_PIN;
	}else{
			KBD_PORT->ODR&=~KBD_DAT_PIN;
	}
    while (!(KBD_PORT->IDR&KBD_CLK_PIN)); // attend clock à 1
    while (KBD_PORT->IDR&KBD_CLK_PIN);   // attend clock à 0
	//libère la ligne DATA
	config_pin((unsigned)KBD_PORT,KBD_DAT_BIT,INPUT_FLOAT);
	//KBD_PORT->CRH&=~(15<<(KBD_DAT_BIT-8)<<2);
	//KBD_PORT->CRH|=(INPUT_FLOAT<<(KBD_DAT_BIT-8)<<2);// libère la ligne DAT
	while (!(KBD_PORT->IDR&KBD_CLK_PIN)); // attend clock à 1
	while (KBD_PORT->IDR&KBD_CLK_PIN);   // attend clock à 0
	while (!((KBD_PORT->IDR & (KBD_DAT_PIN|KBD_CLK_PIN))==(KBD_DAT_PIN|KBD_CLK_PIN))); // attend que les 2 lignes reviennent à 1.
    EXTI->PR|=KBD_CLK_PIN;
	enable_interrupt(IRQ_KBD_CLK); // réactivation interruption
	return 1;
} // KbdSend()


static int KbdReset(void){
    unsigned int t0;
    ps2_flags = 0;
    return KbdSend(KBD_RESET);
}//KbdReset()
*/
 
void keyboard_init(){
	// activation clock IOPA et AFIO
	RCC->APB2ENR|=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;
	// activation clock TMR2
	RCC->APB1ENR|=RCC_APB1ENR_TIM2EN; 
	TMR2->ARR=FAPB1/20*.01;
	TMR2->PSC=20;
	TMR2->CR1=BIT0|BIT7; // ARPE
	TMR2->DIER=BIT0; // UIE
	set_int_priority(IRQ_KBD_CLK,0);
	set_int_priority(IRQ_TIM2,14);
	// trigger sur signal descendant
	EXTI->FTSR|=KBD_CLK_PIN;
	EXTI->IMR|=KBD_CLK_PIN;
	enable_interrupt(IRQ_KBD_CLK);
	TMR2->SR&=~BIT0;
	enable_interrupt(IRQ_TIM2);
	//pause(700);
	//if (!KbdReset()) print("keyboard reset failed\n");
}



#define XTD_CODE (1<<0)
#define RELEASE (1<<1)
#define LEFT_SHIFT (1<<2)
#define RIGHT_SHIFT (1<<3)
#define LEFT_CTRL (1<<4)
#define RIGHT_CTRL (1<<5)
#define LEFT_ALT (1<<6)
#define RIGHT_ALT (1<<7)
#define XTD2_CODE (1<<8)
#define PRNSCR (1<<9)
#define CAPSLOCK (1<<10)

static unsigned flags;

typedef struct{
	unsigned char code;
	unsigned char ascii;
} key_translate_t;

static const key_translate_t mcsaite_key[]={
	{0x1c,'a'},
	{0x32,'b'},
	{0x21,'c'},
	{0x23,'d'},
	{0x24,'e'},
	{0x2b,'f'},
	{0x34,'g'},
	{0x33,'h'},
	{0x43,'i'},
	{0x3b,'j'},
	{0x42,'k'},
	{0x4b,'l'},
	{0x3a,'m'},
	{0x31,'n'},
	{0x44,'o'},
	{0x4d,'p'},
	{0x15,'q'},
	{0x2d,'r'},
	{0x1b,'s'},
	{0x2c,'t'},
	{0x3c,'u'},
	{0x2a,'v'},
	{0x1d,'w'},
	{0x22,'x'},
	{0x35,'y'},
	{0x1a,'z'},
	{0x45,'0'},
	{0x16,'1'},
	{0x1e,'2'},
	{0x26,'3'},
	{0x25,'4'},
	{0x2e,'5'},
	{0x36,'6'},
	{0x3d,'7'},
	{0x3e,'8'},
	{0x46,'9'},
	{0x29,' '},
	{0x4e,'-'},
	{0x55,'='},
	{0x0e,'`'},
	{0x0d,'\t'},
	{0x54,'['},
	{0x5b,']'},
	{0x4c,';'},
	{0x41,','},
	{0x49,'.'},
	{0x4a,'/'},
	{0x52,'\''},
	{0x5D,'\\'},
	{0x66,8}, // BACKSPACE
	{0x0d,9}, // TAB
	{0x5a,'\r'}, // CR
	{0x76,27}, // ESC
	{KP0,'0'},
	{KP1,'1'},
	{KP2,'2'},
	{KP3,'3'},
	{KP4,'4'},
	{KP5,'5'},
	{KP6,'6'},
	{KP7,'7'},
	{KP8,'8'},
	{KP9,'9'},
	{KPDIV,'/'},
	{KPMUL,'*'},
	{KPMINUS,'-'},
	{KPPLUS,'+'},
	{KPENTER,'\r'},
	{KPDOT,'.'},
	{0,0}
};

static const key_translate_t mcsaite_shey[]={ // shifted key
	{'`','~'},
	{'1','!'},
	{'2','@'},
	{'3','#'},
	{'4','$'},
	{'5','%'},
	{'6','^'},
	{'7','&'},
	{'8','*'},
	{'9','('},
	{'0',')'},
	{'-','_'},
	{'=','+'},
	{'\\','|'},
	{';',':'},
	{'\'','"'},
	{',','<'}, 
	{'.','>'},
	{'/','?'},
	{'[','{'},
	{']','}'},
	{0,0}
};

static const key_translate_t mcsaite_alt[]={
};

static const key_translate_t mcsaite_xkey[]={
};

static unsigned char search_table(const key_translate_t *table,unsigned char code){
	while (table->code){
		if (table->code==code) break;
		table++;
	}
	return table->ascii;
}

static void convert_code(unsigned char code){
		unsigned char c,s;
		int shift;
		if (!(con.dev==LOCAL)) return;
		switch (code){
		case 0xF0:
			flags |= RELEASE;
			break;
		case 0xE0: // extended code
			flags|=XTD_CODE;
			break;
		case 0xE1: // extended 2 code (i.e. pause)
			flags^=XTD2_CODE;
			if (!(flags&XTD2_CODE)){
				con.insert(PAUSE);
			}
			break;
		case LSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_SHIFT|XTD_CODE);
			}else{
				if (flags&XTD_CODE){
					flags|=PRNSCR;
				}else{
					flags|=LEFT_SHIFT;
				}
			}
			break;
		case KPMUL:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE|XTD_CODE);
			}else{
				if (flags&(XTD_CODE|PRNSCR)==(XTD_CODE|PRNSCR)){
					flags&=~(XTD_CODE|PRNSCR);
					con.insert(PRN);
				}else{
					con.insert('*');
				}
			}
			break;
		case RSHIFT:
			if (flags&RELEASE){
				flags&=~(RELEASE|RIGHT_SHIFT|XTD_CODE);
			}else{
				flags|=RIGHT_SHIFT;
			}
			break;
		case LCTRL:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_CTRL|XTD_CODE);
			}else{
				flags|=LEFT_CTRL;
			}
			break;
		case LALT:
			if (flags&RELEASE){
				flags&=~(RELEASE|LEFT_ALT|XTD_CODE);
			}else{
				flags|=LEFT_ALT;
			}
			break;
		case CAPS_LOCK:
			if (flags&RELEASE){
				flags&=~(RELEASE|XTD_CODE);
			}else{
				flags^=CAPSLOCK;
			}
			break;
		default:
			if (!(flags&RELEASE)){
					if (flags&XTD_CODE){
						c=search_table(mcsaite_xkey,code);
						flags&=~XTD_CODE;
					}else{
						c=search_table(mcsaite_key,code);
					}
					shift=(flags&(LEFT_SHIFT|RIGHT_SHIFT));
					if (c>='a' && c<='z' && ((shift && !(flags&CAPSLOCK))||(!shift && (flags&CAPSLOCK)))){
						c-=32;
					}else if (shift && (s=search_table(mcsaite_shey,c))){
						c=s;
					}
					if (c){
						con.insert(c);
					}
			}else{
				flags &= ~(XTD_CODE|RELEASE);
			}
			break;
		}//switch
}// convert_code()



#define PS2_QUEUE_SIZE (16)
volatile static unsigned char ps2_head,ps2_tail;
volatile static unsigned char ps2_queue[PS2_QUEUE_SIZE];

// signal clock du clavier PS/2
__attribute__((optimize("-O0"))) void KBD_CLK_handler(){
	volatile  static unsigned char  in_byte=0,bit_cnt=0;
    volatile unsigned char parity; 

#define data_bit  (KBD_PORT->IDR & KBD_DAT_PIN)
	EXTI->PR|=KBD_CLK_PIN; 
    switch (bit_cnt){
	case 0:   // start bit
		ps2_flags&=~(F_ERROR|F_RCVD);
		if (!data_bit){
			in_byte=0;
            parity=0;
            bit_cnt++;
        }
		break;
	case 9:   // paritée
		if (data_bit) parity++;
		if (!(parity & 1)){
			//ps2_flags |= F_ERR_PARITY;
			
		}
		bit_cnt++;
		break;
	case 10:  // stop bit
	    if (!data_bit){
			ps2_flags|=F_ERR_FRAME;
		}else if (!(ps2_flags&F_ERROR)){
			if (in_byte==BAT_OK){
				ps2_flags|=F_BATOK;
			}else{
				ps2_queue[ps2_tail++]=in_byte;
				ps2_tail&=PS2_QUEUE_SIZE-1;
			}
	    }
	    bit_cnt=0;
		break;
	default:
		in_byte >>=1;
		if(data_bit){
			in_byte |=128;
			parity++;
		}
		bit_cnt++;
		break;
	}
}

void TIM2_handler(){
	TMR2->SR&=~(BIT0); // clear interrupt bit
	if (ps2_tail!=ps2_head){
		convert_code(ps2_queue[ps2_head++]);
		ps2_head&=PS2_QUEUE_SIZE-1;
	}
}


