/*
 * DESCRIPTION: fonctions d'usage générale.
 * Auteur: PICATOUT
 * Date: 2018-12-31
 * Copyright Jacques Deschênes, 2018, 2019
 * Licence: GPLv3
 * revisions:
 * 
 */

#ifndef GEN_FN_H
#define GEN_FN_H

// compare les chaînes s1 et s2
// retourne -1 si s1 précède s2 dans l'ordre alphabétique
// retourne 0 si s1==s2
// retourne 1 si s1 suit s2 dans l'ordre alphabétique
int strcmp(const char *s1, const char *s2);
// retourne vrai si c -> {'0'..'9'}
int digit(char c);
// retourne vrai si c -> {'0'..'9''A'..'Z'}
int hexdigit(char c);
// convertie une chaîne en entier
int atoi(const char *str);
// copie n caractère insère un zéro à la fin
void move(char *src , char *dest, int len);
// retourne la longueur de la chaîne.
int strlen(const char* str);


#endif // GEN_FN_H

