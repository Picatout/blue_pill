all:
	@echo "Construction des cibles"
	@cat makefile | grep '^[a-zA-Z]' | sed 's/:.*//g' | sed 's/^/  /g'

build: blink.c startup.c stm32.ld clean
	@echo
	@echo "Construction de l'image de production sans optimisation"
	arm-none-eabi-gcc -DOPTMZ=1 -c -mcpu=cortex-m3 -mthumb -o blink.o blink.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-ld -Tstm32.ld -o blink.elf startup.o blink.o
	arm-none-eabi-objcopy -O binary blink.elf blink.bin

build_O1: blink.c startup.c stm32.ld clean
	@echo
	@echo "construction de l'image de production avec optimisation -O1"
	arm-none-eabi-gcc -DOPTMZ=4 -O1 -c -mcpu=cortex-m3 -mthumb -o blink.o blink.c
	arm-none-eabi-gcc  -c -O1 -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-ld -Tstm32.ld -o blink.elf startup.o blink.o
	arm-none-eabi-objcopy -O binary blink.elf blink.bin

build_debug: blink.c startup.c stm32.ld clean
	@echo
	@echo "Construction d'une image pour dégogage"
	arm-none-eabi-gcc -DOPTMZ=1 -O0  -c -g -mcpu=cortex-m3 -mthumb -o blink.o blink.c
	arm-none-eabi-gcc -DOPTMZ=1 -O0  -c -g -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-ld -Tstm32.ld -o blink.elf startup.o blink.o
	arm-none-eabi-objcopy -O binary blink.elf blink.bin

print_gcc_assembler:
	@echo
	@echo "Imprime le code assembleur de blink.c généré par arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb blink.c
	cat blink.s
	@echo
	@echo "Print assembler code of startup.c using the arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb startup.c
	cat startup.s

print_disassemble:
	@echo
	@echo "Imprime code assembleur contenu dans blink.elf avec objdump"
	arm-none-eabi-objdump -S --disassemble blink.elf
	@echo
	@echo "Imprime le code assembleur de blink.o avec objdump"
	arm-none-eabi-objdump -S --disassemble blink.o
	@echo
	@echo "Imprime le code assembleur de startup.o avec objdump"
	arm-none-eabi-objdump -S --disassemble startup.o

print_symbols_nm:
	@echo
	@echo "Liste des symboles de blink.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort blink.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort startup.o
	@echo
	@echo "Liste des symboles de blink.elf en utilisant nm"
	arm-none-eabi-nm --numeric-sort blink.elf

print_symbols_objdump:
	@echo
	@echo "Liste des symboles de blink.o en utilisant objdump"
	arm-none-eabi-objdump --syms blink.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant objdump"
	arm-none-eabi-objdump --syms startup.o
	@echo
	@echo "Liste des symboles de blink.elf en utilisant objdump"
	arm-none-eabi-objdump --syms blink.elf

print_sections:
	@echo
	@echo "Liste des sections de blink.o en utilisant objdump"
	arm-none-eabi-objdump -h blink.o
	@echo
	@echo "Liste des sections de startup.o en utilisant objdump"
	arm-none-eabi-objdump -h startup.o
	@echo
	@echo "Liste des sections de blink.elf en utilisant objdump"
	arm-none-eabi-objdump -h blink.elf

clean:
	@echo
	@echo "Nettoyage avant construction"
	rm -f *.o
	rm -f *.elf
	rm -f *.bin
	rm -f *.s
