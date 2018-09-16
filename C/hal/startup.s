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
	.file	"startup.c"
	.text
	.align	2
	.global	reset_mcu
	.type	reset_mcu, %function
reset_mcu:
	@ Function supports interworking.
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	ldr	r3, .L2
	ldr	r2, .L2+4
	str	r2, [r3]
.L3:
	.align	2
.L2:
	.word	-536810228
	.word	100270084
	.size	reset_mcu, .-reset_mcu
	.align	2
	.weak	RTC_Handler
	.type	RTC_Handler, %function
RTC_Handler:
	@ Function supports interworking.
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
@ 37 "startup.c" 1
	b reset_mcu

@ 0 "" 2
	.size	RTC_Handler, .-RTC_Handler
	.global	myvectors
	.section	vectors,"aw",%progbits
	.align	2
	.type	myvectors, %object
	.size	myvectors, 304
myvectors:
	.word	536891392
	.word	startup
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	SVcall_handler
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	systick_int
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	RTC_Handler
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.word	reset_mcu
	.text
	.align	2
	.global	startup
	.type	startup, %function
startup:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	ldr	r3, .L10
	str	r3, [fp, #-8]
	ldr	r3, .L10+4
	str	r3, [fp, #-20]
	b	.L6
.L7:
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-8]
.L6:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L7
	ldr	r3, .L10+8
	str	r3, [fp, #-12]
	ldr	r3, .L10+12
	str	r3, [fp, #-16]
	ldr	r3, .L10+16
	str	r3, [fp, #-24]
	b	.L8
.L9:
	ldr	r3, [fp, #-12]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	str	r3, [fp, #-12]
.L8:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L9
	ldr	r3, .L10+20
@ 151 "startup.c" 1
	mov r0, r3
msr PSP,r0
mrs r0,CONTROL
orr r0,#2
msr CONTROL,r0
ISB

@ 0 "" 2
	bl	main
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	_BSS_START
	.word	_BSS_END
	.word	_DATA_ROM_START
	.word	_DATA_RAM_START
	.word	_DATA_RAM_END
	.word	536890368
	.size	startup, .-startup
	.ident	"GCC: (15:4.9.3+svn231177-1) 4.9.3 20150529 (prerelease)"
