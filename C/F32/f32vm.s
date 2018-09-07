@ machine virtuelle inspirée du F18A de greenarrays

.syntax unified
.cpu cortex-m3
.fpu softvfp

T .req r0 @ sommet pile données
S .req r1 @ second pile données
R .req r2 @ sommet pile retour
PC .req r3 @ compteur ordinal
IR .req r4 @ registre d'intruction
IX .req r5 @ pointeur 
IY .req r6 @ pointeur

.bss 
dstack: .space 8*4
rstack: .space 8*4

.text
.thumb
.global f32vm
.thumb_func

@ prototype C ->  int f32vm(unsigned adr)
f32vm: 
@ initialisation
	mov PC,T
	eors T,T
	eors S,S
	eors R,R
	
	b .
	
.end






