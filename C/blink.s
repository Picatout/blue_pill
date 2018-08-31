	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"blink.c"
	.text
	.align	2
	.type	port_c_setup, %function
port_c_setup:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r2, .L2
	ldr	r3, .L2
	ldr	r3, [r3]
	orr	r3, r3, #4
	str	r3, [r2]
	ldr	r3, .L2+4
	ldr	r2, .L2+8
	str	r2, [r3]
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073877016
	.word	1073811460
	.word	1147421764
	.size	port_c_setup, .-port_c_setup
	.align	2
	.type	led_on, %function
led_on:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L5
	mov	r2, #8192
	str	r2, [r3]
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073811476
	.size	led_on, .-led_on
	.align	2
	.type	led_off, %function
led_off:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L8
	mov	r2, #8192
	str	r2, [r3]
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	1073811472
	.size	led_off, .-led_off
	.align	2
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	b	.L11
.L12:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L11:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L12
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	bl	port_c_setup
.L14:
	bl	led_off
	ldr	r0, .L15
	bl	delay
	bl	led_on
	ldr	r0, .L15
	bl	delay
	b	.L14
.L16:
	.align	2
.L15:
	.word	400000
	.size	main, .-main
	.ident	"GCC: (15:4.9.3+svn231177-1) 4.9.3 20150529 (prerelease)"
