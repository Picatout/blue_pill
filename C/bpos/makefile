# ref: https://slashvar.github.io/2017/02/13/using-gnu-make.html

NAME = bpos

PREFIX = arm-none-eabi-
CC = $(PREFIX)gcc
LD = $(PREFIX)ld
NM = $(PREFIX)nm
OBJCOPY = $(PREFIX)objcopy
OBJDUMP = $(PREFIX)objdump
DBG = $(PREFIX)gdb
CFLAGS = -mcpu=cortex-m3 -mthumb
INC = ../include/
HAL = ../hal/
SRC = bpos.c console.c startup.c
SRC += $(HAL)usart.c $(HAL)nvic.c $(HAL)gpio.c

all: build
	

build: clean compile link bin_gen  print_disassemble
	
build_O1: clean compile_O1 link bin_gen print_disassemble
	

build_debug: clean compile_debug link bin_gen print_disassemble
		

compile:
	@echo "************************"
	@echo "compilation des fichiers"
	@echo "************************"
	$(CC) $(CFLAGS) -O0 -c $(SRC)
	@echo

compile_O1:
	@echo "************************"
	@echo "compilation des fichiers"
	@echo "optimisation O1         "
	@echo "************************"
	$(CC) $(CFLAGS) -O1 -c -g $(SRC)
	@echo


compile_debug:
	@echo "************************"
	@echo "compilation des fichiers"
	@echo "   pour déboguage       "
	@echo "************************"
	$(CC) $(CFLAGS) -O0 -c -g $(SRC)
	@echo


link:
	@echo "***************************"
	@echo " génération du fichier elf "
	@echo "***************************"
	$(LD) -Tstm32.ld -o $(NAME).elf *.o
	@echo
	
bin_gen:
	@echo "*****************************"
	@echo "génération du fichier binaire"
	@echo "*****************************"
	$(OBJCOPY) -O binary $(NAME).elf $(NAME).bin
	@rm *.o
	@echo
	


print_disassemble:
	@echo
	@echo "Imprime code assembleur contenu dans bpos.elf avec objdump"
	$(OBJDUMP) -S --disassemble $(NAME).elf > $(NAME).s
	
print_symbols_nm:
	@echo
	@echo "Liste des symboles de $(NAME).elf en utilisant nm"
	$(NM) --numeric-sort $(NAME).elf

print_symbols_objdump:
	@echo
	@echo "Liste des symboles de $(NAME).elf en utilisant objdump"
	$(OBJDUMP) --syms $(NAME).elf

print_sections:
	@echo
	@echo "Liste des sections de $(NAME).elf en utilisant objdump"
	$(OBJDUMP) -h $(NAME).elf

debug:
	$(DBG) -tui --eval-command="target remote localhost:4242" $(NAME).elf
	
flash:
	st-flash write $(NAME).bin 0x8000000
	
.PHONY: clean
	
	
clean:
	@echo "****************************"
	@echo "Nettoyage avant construction"
	@echo "****************************"
	$(RM) *.o *.elf *.bin *.s
	$(RM) $(HAL)*.o
	@echo
	
	
