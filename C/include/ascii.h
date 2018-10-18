/*
 * Description: caractères spéciaux ASCII
 * Auteur: PICATOUT
 * Date: 2018-10-06
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef ASCII_H
#define ASCII_H

enum ASCII_CTRL{
	NUL=0,
	SOH,
	STX,
	ETX,
	EOT,
	ENQ,
	ACK,
	BEL,
	BS,
	TAB,
	LF,
	VT,
	FF,
	CR,
	SO,
	SI,
	DLE,
	DC1,
	DC2,
	DC3,
	DC4,
	NAK,
	SYN,
	ETB,
	CAN,
	EM,
	SUB,
	ESC,
	FS,
	GS,
	RS,
	US,
	SPACE
};

#define CTRL_A SOH
#define CTRL_B STX
#define CTRL_C ETX
#define CTRL_D EOT
#define CTRL_E ENQ
#define CTRL_F ACK
#define CTRL_G BEL
#define CTRL_H BS
#define CTRL_I TAB
#define CTRL_J LF
#define CTRL_K VT
#define CTRL_L FF
#define CTRL_M CR
#define CTRL_N SO
#define CTRL_O SI
#define CTRL_P DLE
#define CTRL_Q DC1
#define CTRL_R DC2
#define CTRL_S DC3
#define CTRL_T DC4
#define CTRL_U NAK
#define CTRL_V SYN
#define CTRL_W ETB
#define CTRL_X CAN
#define CTRL_Y EM
#define CTRL_Z SUB

#endif // ASCII_H
