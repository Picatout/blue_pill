/*
 * Description: interface bas niveau périphériques USART
 * Auteur: PICATOUT
 * Date: 2018-09-21
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef USART_H
#define USART_H

#include "blue_pill.h"

#define USART_COUNT 3 // 3 périphériques

#define USART1_BASE_ADR 0x40013800
#define USART2_BASE_ADR 0x40004400
#define USART3_BASE_ADR 0x40004800

typedef struct{
	sfr_t SR;
	sfr_t DR;
	sfr_t BRR;
	sfr_t CR1;
	sfr_t CR2;
	sfr_t CR3;
	sfr_t GTPR;
}usart_t;

#define USART1 ((usart_t*)USART1_BASE_ADR)
#define USART2 ((usart_t*)USART2_BASE_ADR)
#define USART3 ((usart_t*)USART3_BASE_ADR)

/******************
 * champs de bits
 *****************/
// registre status 
#define USART_SR_PE (1<<0) // erreur parité
#define USART_SR_FE (1<<1) // erreur framing
#define USART_SR_NE (1<<2) // erreur bruit
#define USART_SR_ORE (1<<3) // erreur débordement
#define USART_SR_IDLE (1<<4) // ligne inactive
#define USART_SR_RXNE (1<<5) // donnée réception disponible
#define USART_SR_TC (1<<6) // transmission complétée
#define USART_SR_TXE (1<<7) // registre transmission vide
#define USART_SR_LBD (1<<8) // LIN break détecté
#define USART_SR_CTS (1<<9) // basculement ligne CTS
// registre baud rate
// le diviseur supporte les divisions fractionnaire
// il y a donc une mantisse de 12 bits et une fraction de 4 bits
// baudrate=Fck/(16*USART_BRR)
#define USART_BRR_FRAC_POS  (0) // 4 bits, diviseur fraction
#define USART_BRR_FRAC_MASK (~(0xf<<0)) 
#define USART_BRR_MAN_POS  (4) // 12 bits, mantisse
#define USART_BRR_MAN_MASK (~(0xfff<4))
// registre de contrôle 1
#define USART_CR1_SBK (1<<0) // envoie un caractère break
#define USART_CR1_RWU (1<<1) // réveil sur réception
#define USART_CR1_DIR_POS (2) // dirction comminication
#define USART_CR1_DIR_MASK (~(3<<2))
#define USART_CR1_RE (1<<2) // active la réception
#define USART_CR1_TE (1<<3) // transmit enable
#define USART_CR1_IDLEIE (1<<4) // activation interruption ligne inactive
#define USART_CR1_RXNEIE (1<<5) //  activation interrutpion sur ORE ou RXNE
#define USART_CR1_TCIE (1<<6) // activation interruption sur transmission complétée
#define USART_CR1_TXEIE (1<<7) // activation interruption sur TXE
#define USART_CR1_PEIE (1<<8) // activation interruption sur erreur parité
#define USART_CR1_PS (1<<9) // sélection parité paire/impaire
#define USART_CR1_PCE (1<<10) // activation contrôle de parité
#define USART_CR1_WAKE (1<<11) // mode activation pour wake up
#define USART_CR1_M (1<<12) // sélection longueur caractère: 8/9 bits
#define USART_CR1_UE (1<<13) // activation périphérique USART
// registre de contrôle 2
#define USART_CR2_ADD_POS (0) // 4 bits, adresse du noeud en communication multinoeud
#define USART_CR2_ADD_MASK (~(0xf<<0))
#define USART_CR2_LBDL (1<<5) // nombre de bits signal LIN break 10/11
#define USART_CR2_LBDIE (1<<6) // activation interruption sur break
#define USART_CR2_LBCL (1<<8) // active un signal CK sur transmission dernier bit
#define USART_CR2_CPHA (1<<9) // phase du signal CK
#define USART_CR2_CPOL (1<<10) // polarité du signal CK
#define USART_CR2_CLKEN (1<<11) // activation signal CK
#define USART_CR2_STOP_POS (12) // 2 bits, nombres de stop bits, 1,.5,2,1.5
#define USART_CR2_STOP_MASK (~(3<<12))
#define USART_CR2_LINEN (1<<14) // activation mode LIN
// registre de contrôle 3
#define USART_CR3_EIE (1<<0) // activation interruption sur erreur lorsque DMAR=1
#define USART_CR3_IREN (1<<1) // activation mode IrDA
#define USART_CR3_IRLP (1<<2) // IrDA faible puissance
#define USART_CR3_HDSEL (1<<3) // sélectionne le mode semi-duplex
#define USART_CR3_NACK (1<<4) // activation signal NACK en mode smartcard
#define USART_CR3_SCEN (1<<5) // activation mode smartcard
#define USART_CR3_DMAR (1<<6) // utilise le DMA sur réeception
#define USART_CR3_DMAT (1<<7) // utilise le DMA sur transmission
#define USART_CR3_RTSE (1<<8) // activation ligne RTS
#define USART_CR3_CTSE (1<<9) // activation ligne CTS
#define USART_CR3_CTSIE (1<<10) // activation interruption sur ligne CTS
// registre GTPR 
#define USART_GTPR_PSC_POS (0) // 8 bits, diviseur pour le mode IrDA
#define USART_GTPR_PSC_MASK (~(255<<0))
#define USART_GTPR_GT_POS (8) // 8 bits, utilisé par le mode smartcard
#define USART_GTPR_GT_MASK (~(255<<8))
//  utilisation parité 
#define PARITY_NONE (0)
#define PARITY_ODD (1)
#define PARITY_EVEN (2)
// direction communication
#define USART_DIR_RX (1) // réception seulement
#define USART_DIR_TX (2) // transmission seulement
#define USART_DIR_BIDI (3) // bidirectionnel
// contrôle de flux
#define FLOW_SOFT 0  // XON/XOFF
#define FLOW_HARD 1  // RTC/CTS

/************************
 *  fonctions
 ************************/
 
// vitesse de transmission
void usart_set_baud(usart_t* channel, unsigned baud); 
// direction communication 
void usart_comm_dir(usart_t* channel, unsigned direction);

// configure l'USART pour comminication selon protocole RS-232
// 8 bit 1 stop pas de parité
void usart_open_channel(usart_t* channel, unsigned baud, unsigned parity, unsigned dir, unsigned flow_ctrl);

// status récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
int usart_stat(usart_t* channel);

// reçoit un caractère de la console
char usart_getc(usart_t* channel);

// transmet un caractère à la console
void usart_putc(usart_t* channel,char c);
		
#endif // USART_H
