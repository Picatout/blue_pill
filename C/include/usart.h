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
#include "stm32f103c8.h"
#include "gen_macros.h"

#define FLOW_SOFT 0  // XON/XOFF
#define FLOW_HARD 1  // RTC/CTS

#define USART_COUNT 3 // 3 périphériques

#define USART1_BASE_ADR 0x40013800
#define USART2_BASE_ADR 0x40004400
#define USART3_BASE_ADR 0x40004800

#define USART1 USART1_BASE_ADR
#define USART2 USART2_BASE_ADR
#define USART3 USART3_BASE_ADR

#define USART1_IRQ  37
#define USART2_IRQ  38
#define USART3_IRQ  39

// offset des registres par rappart à l'adresse de base
#define USART_SR_OFS 0
#define USART_DR_OFS 4
#define USART_BRR_OFS 8
#define USART_CR1_OFS 12
#define USART_CR2_OFS 16
#define USART_CR3_OFS 20
#define USART_GTPR_OFS 24
// registres USART1 
#define USART1_SR _sfr(USART1_BASE_ADR)
#define USART1_DR _sfr(USART1_BASE_ADR+4)
#define USART1_BRR _sfr(USART1_BASE_ADR+8)
#define USART1_CR1 _sfr(USART1_BASE_ADR+12)
#define USART1_CR2 _sfr(USART1_BASE_ADR+16)
#define USART1_CR3 _sfr(USART1_BASE_ADR+20)
#define USART1_GTPR _sfr(USART1_BASE_ADR+24)
// registres USART2
#define USART2_SR _sfr(USART2_BASE_ADR)
#define USART2_DR _sfr(USART2_BASE_ADR+4)
#define USART2_BRR _sfr(USART2_BASE_ADR+8)
#define USART2_CR1 _sfr(USART2_BASE_ADR+12)
#define USART2_CR2 _sfr(USART2_BASE_ADR+16)
#define USART2_CR3 _sfr(USART2_BASE_ADR+20)
#define USART2_GTPR _sfr(USART2_BASE_ADR+24)
// registres USART3 
#define USART3_SR _sfr(USART3_BASE_ADR)
#define USART3_DR _sfr(USART3_BASE_ADR+4)
#define USART3_BRR _sfr(USART3_BASE_ADR+8)
#define USART3_CR1 _sfr(USART3_BASE_ADR+12)
#define USART3_CR2 _sfr(USART3_BASE_ADR+16)
#define USART3_CR3 _sfr(USART3_BASE_ADR+20)
#define USART3_GTPR _sfr(USART3_BASE_ADR+24)

/******************
 * champs de bits
 *****************/

// registre status 
#define USART_SR_PE 0 // 1 bit, erreur parité
#define USART_SR_FE 1 // 1 bit, erreur framing
#define USART_SR_NE 2 // 1 BIT, erreur bruit
#define USART_SR_ORE 3 // 1 bit, erreur débordement
#define USART_SR_IDLE 4 // 1 bit, ligne inactive
#define USART_SR_RXNE 5 // 1 bit, donnée réception disponible
#define USART_SR_TC 6 // 1 bit, transmission complétée
#define USART_SR_TXE 7 // 1 bit, registre transmission vide
#define USART_SR_LBD 8 // 1 bit, LIN break détecté
#define USART_SR_CTS 9 // 1 bit, basculement ligne CTS
// registre baud rate
// le diviseur supporte les divisions fractionnaire
// il y a donc une mantisse de 12 bits et une fraction de 4 bits
// baudrate=Fck/(16*USART_BRR)
#define USART_BRR_FRAC  0 // 4 bits, diviseur fraction
#define USART_BRR_MAN  4 // 12 bits, mantisse
// registre de contrôle 1
#define USART_CR1_SBK 0 // 1 bit, envoie un caractère break
#define USART_CR1_WPU 1 // 1 bit, réveil sur réception
#define USART_CR1_RE 2 // 1 bit, active la réception
#define USART_CR1_TE 3 // 1 bit, transmit enable
#define USART_CR1_IDLEIE 4 // 1 bit, activation interruption ligne inactive
#define USART_CR1_RXNEIE 5 // 1 bit, activation interrutpion sur ORE ou RXNE
#define USART_CR1_TCIE 6 // 1 bit, activation interruption sur transmission complétée
#define USART_CR1_TXEIE 7 // 1 bit, activation interruption sur TXE
#define USART_CR1_PEIE 8 // 1 bit, activation interruption sur PE
#define USART_CR1_PS 9 // 1 bit, sélection parité paire/impaire
#define USART_CR1_PCE 10 // 1 bit, activation contrôle de parité
#define USART_CR1_WAKE 11 // 1 bit, mode activation pour WPU
#define USART_CR1_M 12 // 1 bit, sélection longueur caractère: 8/9 bits
#define USART_CR1_UE 13 // 1 bit, activation périphérique USART
// registre de contrôle 2
#define USART_CR2_ADD 0 // 4 bits, adresse du noeud en communication multinoeud
#define USART_CR2_LBDL 5 // 1 bit, nombre de bit signal LIN break 10/11
#define USART_CR2_LBDIE 6 // 1 bit, activation interruption sur break
#define USART_CR2_LBCL 8 // 1 bit, en un signal CK sur transmission dernier bit
#define USART_CR2_CPHA 9 // 1 bit, phase du signal CK
#define USART_CR2_CPOL 10 // 1 bit, polarité du signal CK
#define USART_CR2_CLKEN 11 // 1 bit, activation signal CK
#define USART_CR2_STOP 12 // 2 bits, nombres de stop bits, 1,.5,2,1.5
#define USART_CR2_LINEN 14 // 1 bit, activation mode LIN
// registre de contrôle 3
#define USART_CR3_EIE 0 // 1 bit, activation interruption sur erreur
#define USART_CR3_IREN 1 // 1 bit, activation mode IrDA
#define USART_CR3_IRLP 2 // 1 bit, IrDA faible puissance
#define USART_CR3_HDSEL 3 // 1 bit, sélectionne le mode semi-duplex
#define USART_CR3_NACK 4 // 1 bit, activation signal NACK en mode smartcard
#define USART_CR3_SCEN 5 // 1 bit, activation mode smartcard
#define USART_CR3_DMAR 6 // 1 bit, utilise le DMA sur réeception
#define USART_CR3_DMAT 7 // 1 bit, utilise le DMA sur transmission
#define USART_CR3_RTSE 8 // 1 bit, activation ligne RTS
#define USART_CR3_CTSE 9 // 1 bit, activation ligne CTS
#define USART_CR3_CTSIE 10 // 1 bit, activation interruption sur ligne CTS
// registre GTPR 
#define USART_GTPR_PSC 0 // 8 bits, diviseur pour le mode IrDA
#define USART_GTPR_GT 8 // 8 bits, utilisé par le mode smartcard
 
/************************
 *  fonctions
 ************************/
 
// vitesse de transmission
void usart_set_baud(unsigned channel, unsigned baud); 
 
// configure l'USART pour comminication selon protocole RS-232
// 8 bit 1 stop pas de parité
void con_open_channel(unsigned channel, unsigned baud, unsigned flow_ctrl);

// status récepction
// retourne 0 si pas de caractère disponible
// retourne -1 si caractère disponible
char constat(unsigned channel);

// reçoit un caractère de la console
char conin(unsigned channel);

// transmet un caractère à la console
void conout(unsigned channel,char c);
		
#endif // USART_H
