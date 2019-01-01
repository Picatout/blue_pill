/*
 * DESCRIPTION: fonctions d'usage générale.
 * Auteur: PICATOUT
 * Date: 2018-12-31
 * Copyright Jacques Deschênes, 2018, 2019
 * Licence: GPLv3
 * revisions:
 * 
 */

#include "../include/ascii.h"

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

// copie 'len' caractères de src vers dest
void move(char *src , char *dest, int len){
	while (len){
		*dest++=*src++;
		len--;
	}
	*dest=0;
}

int strlen(const char* str){
	int ll=0;
	while (*str++){ll++;}
	return ll;
}

