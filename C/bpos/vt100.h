/*
 * Description: interface sériel avec émulateur VT100
 * Auteur: PICATOUT
 * Date: 2018-11-19
 * Copyright Jacques Deschênes, 2018
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef VT100_H
#define VT100_H


#define VT_USART  USART2
#define IRQ_VT IRQ_USART2
#define VT_handler USART2_handler
#define VT_PORT USART2_PORT
#define VT_CTS_BIT USART2_CTS_BIT
#define VT_TX_PIN USART2_TX_PIN
#define VT_RTS_PIN USART2_RTS_PIN

// initialise le port sériel
void vt_init();
//envoie d'un caractère
void vt_putc(char c);
//efface le caractère à gauche du curseur
void vt_del_back();
// vide l'écran de la console
void vt_cls();
// vide la ligne du curseur
// n -> nombre de caractère à effacer.
void vt_clear_line(unsigned n);
// vérifie si le terminal est prêt
int vt_ready();

#endif // VT100_H
