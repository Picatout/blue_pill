all:
	@echo "Construction des cibles"
	@cat makefile | grep '^[a-zA-Z]' | sed 's/:.*//g' | sed 's/^/  /g'

build: systick_demo.c startup.c stm32.ld clean
	@echo
	@echo "Construction de l'image de production sans optimisation"
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o systick_demo.o systick_demo.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-ld -Tstm32.ld -o systick_demo.elf startup.o systick_demo.o
	arm-none-eabi-objcopy -O binary systick_demo.elf systick_demo.bin

build_O1: systick_demo.c startup.c stm32.ld clean
	@echo
	@echo "construction de l'image de débogage avec optimisation -O1"
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o systick_demo.o systick_demo.c
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-ld -Tstm32.ld -o systick_demo.elf startup.o systick_demo.o
	arm-none-eabi-objcopy -O binary systick_demo.elf systick_demo.bin

build_debug: systick_demo.c startup.c stm32.ld clean
	@echo
	@echo "Construction d'une image pour débogage"
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o systick_demo.o systick_demo.c
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-ld -Tstm32.ld -o systick_demo.elf startup.o systick_demo.o
	arm-none-eabi-objcopy -O binary systick_demo.elf systick_demo.bin

print_gcc_assembler:
	@echo
	@echo "Imprime le code assembleur de systick_demo.c généré par arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb systick_demo.c
	cat systick_demos
	@echo
	@echo "Print assembler code of startup.c using the arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb startup.c
	cat startup.s

print_disassemble:
	@echo
	@echo "Imprime code assembleur contenu dans systick_demo.elf avec objdump"
	arm-none-eabi-objdump -S --disassemble systick_demo.elf
	@echo
	@echo "Imprime le code assembleur de systick_demo.o avec objdump"
	arm-none-eabi-objdump -S --disassemble systick_demo.o
	@echo
	@echo "Imprime le code assembleur de startup.o avec objdump"
	arm-none-eabi-objdump -S --disassemble startup.o

print_symbols_nm:
	@echo
	@echo "Liste des symboles de systick_demo.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort systick_demo.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort startup.o
	@echo
	@echo "Liste des symboles de systick_demo.elf en utilisant nm"
	arm-none-eabi-nm --numeric-sort systick_demo.elf

print_symbols_objdump:
	@echo
	@echo "Liste des symboles de systick_demo.o en utilisant objdump"
	arm-none-eabi-objdump --syms systick_demo.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant objdump"
	arm-none-eabi-objdump --syms startup.o
	@echo
	@echo "Liste des symboles de systick_demo.elf en utilisant objdump"
	arm-none-eabi-objdump --syms systick_demo.elf

print_sections:
	@echo
	@echo "Liste des sections de systick_demo.o en utilisant objdump"
	arm-none-eabi-objdump -h systick_demo.o
	@echo
	@echo "Liste des sections de startup.o en utilisant objdump"
	arm-none-eabi-objdump -h startup.o
	@echo
	@echo "Liste des sections de systick_demo.elf en utilisant objdump"
	arm-none-eabi-objdump -h systick_demo.elf

clean:
	@echo
	@echo "Nettoyage avant construction"
	rm -f *.o
	rm -f *.elf
	rm -f *.bin
	rm -f *.s
