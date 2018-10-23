
INC = ../include/
HAL = ../hal/

all:
	@echo "Construction des cibles"
	@cat makefile | grep '^[a-zA-Z]' | sed 's/:.*//g' | sed 's/^/  /g'

flash:
	st-flash write svc_demo.bin 0x8000000

build: svc_demo.c startup.c $(HAL)nvic.c stm32.ld clean
	@echo
	@echo "Construction de l'image de production sans optimisation"
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o svc_demo.o svc_demo.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o nvic.o $(HAL)nvic.c
	arm-none-eabi-ld -Tstm32.ld -o svc_demo.elf startup.o svc_demo.o nvic.o
	arm-none-eabi-objcopy -O binary svc_demo.elf svc_demo.bin

build_O1: svc_demo.c startup.c $(HAL)nvic.c stm32.ld clean
	@echo
	@echo "construction de l'image de débogage avec optimisation -O1"
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o svc_demo.o svc_demo.c
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o nvic.o $(HAL)nvic.c
	arm-none-eabi-ld -Tstm32.ld -o svc_demo.elf startup.o svc_demo.o nvic.o
	arm-none-eabi-objcopy -O binary svc_demo.elf svc_demo.bin

build_debug: svc_demo.c startup.c $(HAL)nvic.c stm32.ld clean
	@echo
	@echo "Construction d'une image pour débogage"
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o svc_demo.o svc_demo.c
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o nvic.o $(HAL)nvic.c
	arm-none-eabi-ld -Tstm32.ld -o svc_demo.elf startup.o svc_demo.o nvic.o
	arm-none-eabi-objcopy -O binary svc_demo.elf svc_demo.bin

print_gcc_assembler:
	@echo
	@echo "Imprime le code assembleur de svc_demo.c généré par arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb svc_demo.c
	cat svc_demos
	@echo
	@echo "Print assembler code of startup.c using the arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb startup.c
	cat startup.s

print_disassemble:
	@echo
	@echo "Imprime code assembleur contenu dans svc_demo.elf avec objdump"
	arm-none-eabi-objdump -S --disassemble svc_demo.elf
	@echo
	@echo "Imprime le code assembleur de svc_demo.o avec objdump"
	arm-none-eabi-objdump -S --disassemble svc_demo.o
	@echo
	@echo "Imprime le code assembleur de startup.o avec objdump"
	arm-none-eabi-objdump -S --disassemble startup.o

print_symbols_nm:
	@echo
	@echo "Liste des symboles de svc_demo.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort svc_demo.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort startup.o
	@echo
	@echo "Liste des symboles de svc_demo.elf en utilisant nm"
	arm-none-eabi-nm --numeric-sort svc_demo.elf

print_symbols_objdump:
	@echo
	@echo "Liste des symboles de svc_demo.o en utilisant objdump"
	arm-none-eabi-objdump --syms svc_demo.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant objdump"
	arm-none-eabi-objdump --syms startup.o
	@echo
	@echo "Liste des symboles de svc_demo.elf en utilisant objdump"
	arm-none-eabi-objdump --syms svc_demo.elf

print_sections:
	@echo
	@echo "Liste des sections de svc_demo.o en utilisant objdump"
	arm-none-eabi-objdump -h svc_demo.o
	@echo
	@echo "Liste des sections de startup.o en utilisant objdump"
	arm-none-eabi-objdump -h startup.o
	@echo
	@echo "Liste des sections de svc_demo.elf en utilisant objdump"
	arm-none-eabi-objdump -h svc_demo.elf

clean:
	@echo
	@echo "Nettoyage avant construction"
	rm -f *.o
	rm -f *.elf
	rm -f *.bin
	rm -f *.s
