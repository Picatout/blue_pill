
INC = ../include/
HAL = ../hal/
PROD = prod/
DBG = dbg/

all:
	@echo "Construction des cibles"
	@cat makefile | grep '^[a-zA-Z]' | sed 's/:.*//g' | sed 's/^/  /g'

build: bpos.c $(HAL)usart.c startup.c $(HAL)nvic.c stm32.ld clean
	@echo
	@echo "Construction de l'image de production sans optimisation"
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o $(PROD)bpos.o bpos.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o $(PROD)startup.o startup.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o $(PROD)nvic.o $(HAL)nvic.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o $(PROD)usart.o $(HAL)usart.c
	arm-none-eabi-ld -Tstm32.ld -o $(PROD)bpos.elf $(PROD)startup.o $(PROD)bpos.o $(PROD)nvic.o $(PROD)usart.o
	arm-none-eabi-objcopy -O binary $(PROD)bpos.elf $(PROD)bpos.bin

build_O1: bpos.c startup.c $(HAL)usart.c $(HAL)nvic.c stm32.ld clean
	@echo
	@echo "construction de l'image de débogage avec optimisation -O1"
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o $(PROD)bpos.o bpos.c
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o $(PROD)startup.o startup.c
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o $(PROD)nvic.o $(HAL)nvic.c
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o $(PROD)usart.o $(HAL)usart.c
	arm-none-eabi-ld -Tstm32.ld -o $(PROD)bpos.elf $(PROD)startup.o $(PROD)bpos.o $(PROD)nvic.o $(PROD)usart.o
	arm-none-eabi-objcopy -O binary $(PROD)bpos.elf $(PROD)bpos.bin

build_debug: bpos.c $(HAL)usart.c startup.c $(HAL)nvic.c stm32.ld clean
	@echo
	@echo "Construction d'une image pour débogage"
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o $(DBG)bpos.o bpos.c
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o $(DBG)startup.o startup.c
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o $(DBG)nvic.o $(HAL)nvic.c
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o $(DBG)usart.o $(HAL)usart.c
	arm-none-eabi-ld -Tstm32.ld -o $(DBG)bpos.elf $(DBG)startup.o $(DBG)bpos.o $(DBG)nvic.o $(DBG)usart.o
	arm-none-eabi-objcopy -O binary $(DBG)bpos.elf $(DBG)bpos.bin

print_gcc_assembler:
	@echo
	@echo "Imprime le code assembleur de bpos.c généré par arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb bpos.c
	cat bpos.s
	@echo
	@echo "Print assembler code of startup.c using the arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb startup.c
	cat startup.s

print_disassemble:
	@echo
	@echo "Imprime code assembleur contenu dans bpos.elf avec objdump"
	arm-none-eabi-objdump -S --disassemble $(PROD)bpos.elf
	@echo
	@echo "Imprime le code assembleur de bpos.o avec objdump"
	arm-none-eabi-objdump -S --disassemble $(PROD)bpos.o
	@echo
	@echo "Imprime le code assembleur de startup.o avec objdump"
	arm-none-eabi-objdump -S --disassemble $(PROD)startup.o

print_symbols_nm:
	@echo
	@echo "Liste des symboles de bpos.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort $(PROD)bpos.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort $(PROD)startup.o
	@echo
	@echo "Liste des symboles de bpos.elf en utilisant nm"
	arm-none-eabi-nm --numeric-sort $(PROD)bpos.elf

print_symbols_objdump:
	@echo
	@echo "Liste des symboles de bpos.o en utilisant objdump"
	arm-none-eabi-objdump --syms $(PROD)bpos.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant objdump"
	arm-none-eabi-objdump --syms $(PROD)startup.o
	@echo
	@echo "Liste des symboles de bpos.elf en utilisant objdump"
	arm-none-eabi-objdump --syms $(PROD)bpos.elf

print_sections:
	@echo
	@echo "Liste des sections de bpos.o en utilisant objdump"
	arm-none-eabi-objdump -h $(PROD)bpos.o
	@echo
	@echo "Liste des sections de startup.o en utilisant objdump"
	arm-none-eabi-objdump -h $(PROD)startup.o
	@echo
	@echo "Liste des sections de bpos.elf en utilisant objdump"
	arm-none-eabi-objdump -h $(PROD)bpos.elf

clean:
	@echo
	@echo "Nettoyage avant construction"
	rm -f *.o $(PROD)*.o  $(DBG)*.o
	rm -f *.elf $(PROD)*.elf   $(DBG)*.elf
	rm -f *.bin $(PROD)*.bin  $(DBG)*.bin
	rm -f *.s $(PROD)*.s  $(DBG)*.s
