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
 
 #ifndef KEYBOARD_H
 #define KEYBOARD_H
 
#include "../include/blue_pill.h"

#define XTD_KEY (1<<7)
 
#define IRQ_KBD_CLK IRQ_EXTI9_5
#define KBD_CLK_handler EXTI9_5_handler
#define KBD_PORT PORTA
#define KBD_CLK_BIT 9
#define KBD_DAT_BIT 10
#define KBD_DAT_PIN (1<<10)
#define KBD_CLK_PIN (1<<9)

// touches spéciales
#define ENTER           0x5A
#define CAPS_LOCK		0x58
#define NUM_LOCK		0x77
#define SCROLL_LOCK		0x7E
#define LSHIFT			0x12
#define RSHIFT          0x59
#define LCTRL			0x14
#define RCTRL           (XTD_KEY|0x14)
#define LALT			0x11
#define RALT            (XTD_KEY|0x11)
#define BKSP            0x66
#define KEY_ESC			0x76
#define F1			0x05
#define F2			0x06
#define F3			0x04
#define F4			0x0c
#define F5			0x03
#define F6			0x0b
#define F7			0x83
#define F8			0x0a
#define F9			0x01
#define F10			0x09
#define F11			0x78
#define F12			0x07
#define PRN			(XTD_KEY|0x12)   // touche PrtSc enfoncée 4 codes: 0xe012e07c, relâchée 6 codes: 0xe0f07ce0f012
#define PAUSE			(XTD_KEY|0x14)   // touche Pause séquence de 8 codes 0xe11477e1f014f077
#define UP_ARROW		(XTD_KEY|0x75)
#define DOWN_ARROW		(XTD_KEY|0x72)
#define LEFT_ARROW		(XTD_KEY|0x6B)
#define RIGHT_ARROW		(XTD_KEY|0x74)
#define INSERT			(XTD_KEY|0x70)
#define HOME			(XTD_KEY|0x6c)
#define	PGUP			(XTD_KEY|0x7d)
#define PGDN			(XTD_KEY|0x7a)
#define	DEL			(XTD_KEY|0x71)
#define END			(XTD_KEY|0x69)
#define KPDIV			(XTD_KEY|0x4a)
#define KPMUL			0x7c
#define KPMINUS			0x7b
#define KPPLUS			0x79
#define KPENTER			(XTD_KEY|0x5a)
#define KPDOT			0x71
#define KP0			0x70
#define KP1			0x69
#define KP2			0x72
#define KP3			0x7a
#define KP4			0x6b
#define KP5			0x73
#define KP6			0x74
#define KP7			0x6c
#define KP8			0x75
#define KP9			0x7d



#endif //KEYBOARD_H

 
 

