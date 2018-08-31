all:
	@echo "Construction des cibles"
	@cat makefile | grep '^[a-zA-Z]' | sed 's/:.*//g' | sed 's/^/  /g'

build: blink_v2.c startup.c stm32.ld clean
	@echo
	@echo "Construction de l'image de production sans optimisation"
	arm-none-eabi-gcc -DOPTMZ=1 -c -mcpu=cortex-m3 -mthumb -o blink_v2.o blink_v2.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o clock.o clock.c
	arm-none-eabi-ld -Tstm32.ld -o blink_v2.elf startup.o blink_v2.o clock.o
	arm-none-eabi-objcopy -O binary blink_v2.elf blink_v2.bin

build_O1: blink_v2.c startup.c stm32.ld clean
	@echo
	@echo "construction de l'image de production avec optimisation -O1"
	arm-none-eabi-gcc -DOPTMZ=4 -O1 -c -mcpu=cortex-m3 -mthumb -o blink_v2.o blink_v2.c
	arm-none-eabi-gcc  -c -O1 -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-gcc  -c -O1 -mcpu=cortex-m3 -mthumb -o clock.o clock.c
	arm-none-eabi-ld -Tstm32.ld -o blink_v2.elf startup.o blink_v2.o clock.o
	arm-none-eabi-objcopy -O binary blink_v2.elf blink_v2.bin

build_debug: blink_v2.c startup.c stm32.ld clean
	@echo
	@echo "Construction d'une image pour débogage"
	arm-none-eabi-gcc -DOPTMZ=1 -O0  -c -g -mcpu=cortex-m3 -mthumb -o blink_v2.o blink_v2.c
	arm-none-eabi-gcc -DOPTMZ=1 -O0  -c -g -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-gcc -DOPTMZ=1 -O0  -c -g -mcpu=cortex-m3 -mthumb -o clock.o clock.c
	arm-none-eabi-ld -Tstm32.ld -o blink_v2.elf startup.o blink_v2.o clock.o
	arm-none-eabi-objcopy -O binary blink_v2.elf blink_v2.bin

print_gcc_assembler:
	@echo
	@echo "Imprime le code assembleur de blink_v2.c généré par arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb blink_v2.c
	cat blink_v2s
	@echo
	@echo "Print assembler code of startup.c using the arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb startup.c
	cat startup.s

print_disassemble:
	@echo
	@echo "Imprime code assembleur contenu dans blink_v2.elf avec objdump"
	arm-none-eabi-objdump -S --disassemble blink_v2.elf
	@echo
	@echo "Imprime le code assembleur de blink_v2.o avec objdump"
	arm-none-eabi-objdump -S --disassemble blink_v2.o
	@echo
	@echo "Imprime le code assembleur de startup.o avec objdump"
	arm-none-eabi-objdump -S --disassemble startup.o

print_symbols_nm:
	@echo
	@echo "Liste des symboles de blink_v2.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort blink_v2.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort startup.o
	@echo
	@echo "Liste des symboles de blink_v2.elf en utilisant nm"
	arm-none-eabi-nm --numeric-sort blink_v2.elf

print_symbols_objdump:
	@echo
	@echo "Liste des symboles de blink_v2.o en utilisant objdump"
	arm-none-eabi-objdump --syms blink_v2.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant objdump"
	arm-none-eabi-objdump --syms startup.o
	@echo
	@echo "Liste des symboles de blink_v2.elf en utilisant objdump"
	arm-none-eabi-objdump --syms blink_v2.elf

print_sections:
	@echo
	@echo "Liste des sections de blink_v2.o en utilisant objdump"
	arm-none-eabi-objdump -h blink_v2.o
	@echo
	@echo "Liste des sections de startup.o en utilisant objdump"
	arm-none-eabi-objdump -h startup.o
	@echo
	@echo "Liste des sections de blink_v2.elf en utilisant objdump"
	arm-none-eabi-objdump -h blink_v2.elf

clean:
	@echo
	@echo "Nettoyage avant construction"
	rm -f *.o
	rm -f *.elf
	rm -f *.bin
	rm -f *.s
