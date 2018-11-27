PREFIX = arm-none-eabi-
INC = ../include/
HAL = ../hal/
NAME= rtc_demo
DBG = $(PREFIX)gdb

all:
	@echo "Construction des cibles"
	@cat makefile | grep '^[a-zA-Z]' | sed 's/:.*//g' | sed 's/^/  /g'

flash:
	st-flash write rtc_demo.bin 0x8000000

debug:
	$(DBG) -tui --eval-command="target remote localhost:4242" $(NAME).elf
	

build: rtc_demo.c startup.c $(HAL)nvic.c $(HAL)rtc.c $(HAL)systick.c $(HAL)gpio.c stm32.ld clean
	@echo
	@echo "Construction de l'image de production sans optimisation"
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o rtc_demo.o rtc_demo.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o nvic.o $(HAL)nvic.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o rtc.o $(HAL)rtc.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o systick.o $(HAL)systick.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o gpio.o $(HAL)gpio.c
	arm-none-eabi-ld -Tstm32.ld -o rtc_demo.elf startup.o rtc_demo.o nvic.o rtc.o systick.o gpio.o
	arm-none-eabi-objcopy -O binary rtc_demo.elf rtc_demo.bin

build_O1: rtc_demo.c startup.c $(HAL)nvic.c $(HAL)rtc.c $(HAL)systick.c $(HAL)gpio.c stm32.ld clean
	@echo
	@echo "construction de l'image de débogage avec optimisation -O1"
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o rtc_demo.o rtc_demo.c
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o nvic.o $(HAL)nvic.c
	arm-none-eabi-gcc  -O1 -c -g -mcpu=cortex-m3 -mthumb -o rtc.o $(HAL)rtc.c
	arm-none-eabi-gcc  -O1 -c -mcpu=cortex-m3 -mthumb -o systick.o $(HAL)systick.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o gpio.o $(HAL)gpio.c
	arm-none-eabi-ld -Tstm32.ld -o rtc_demo.elf startup.o rtc_demo.o nvic.o rtc.o systick.o gpio.o
	arm-none-eabi-objcopy -O binary rtc_demo.elf rtc_demo.bin

build_debug: rtc_demo.c startup.c $(HAL)nvic.c $(HAL)rtc.c $(HAL)systick.c $(HAL)gpio.c stm32.ld clean
	@echo
	@echo "Construction d'une image pour débogage"
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o rtc_demo.o rtc_demo.c
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o nvic.o $(HAL)nvic.c 
	arm-none-eabi-gcc -O0  -c -g -mcpu=cortex-m3 -mthumb -o rtc.o $(HAL)rtc.c 
	arm-none-eabi-gcc -O0 -c -mcpu=cortex-m3 -mthumb -o systick.o $(HAL)systick.c
	arm-none-eabi-gcc  -c -mcpu=cortex-m3 -mthumb -o gpio.o $(HAL)gpio.c
	arm-none-eabi-ld -Tstm32.ld -o rtc_demo.elf startup.o rtc_demo.o nvic.o rtc.o systick.o gpio.o
	arm-none-eabi-objcopy -O binary rtc_demo.elf rtc_demo.bin

print_gcc_assembler:
	@echo
	@echo "Imprime le code assembleur de rtc_demo.c généré par arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb rtc_demo.c
	cat rtc_demos
	@echo
	@echo "Print assembler code of startup.c using the arm-none-eabi-gcc -O1 -S option"
	arm-none-eabi-gcc -O1 -S -mcpu=cortex-m3 -mthumb startup.c
	cat startup.s

print_disassemble:
	@echo
	@echo "Imprime code assembleur contenu dans rtc_demo.elf avec objdump"
	arm-none-eabi-objdump -S --disassemble rtc_demo.elf
	@echo
	@echo "Imprime le code assembleur de rtc_demo.o avec objdump"
	arm-none-eabi-objdump -S --disassemble rtc_demo.o
	@echo
	@echo "Imprime le code assembleur de startup.o avec objdump"
	arm-none-eabi-objdump -S --disassemble startup.o

print_symbols_nm:
	@echo
	@echo "Liste des symboles de rtc_demo.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort rtc_demo.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant nm"
	arm-none-eabi-nm --numeric-sort startup.o
	@echo
	@echo "Liste des symboles de rtc_demo.elf en utilisant nm"
	arm-none-eabi-nm --numeric-sort rtc_demo.elf

print_symbols_objdump:
	@echo
	@echo "Liste des symboles de rtc_demo.o en utilisant objdump"
	arm-none-eabi-objdump --syms rtc_demo.o
	@echo
	@echo "Liste des symboles de startup.o en utilisant objdump"
	arm-none-eabi-objdump --syms startup.o
	@echo
	@echo "Liste des symboles de rtc_demo.elf en utilisant objdump"
	arm-none-eabi-objdump --syms rtc_demo.elf

print_sections:
	@echo
	@echo "Liste des sections de rtc_demo.o en utilisant objdump"
	arm-none-eabi-objdump -h rtc_demo.o
	@echo
	@echo "Liste des sections de startup.o en utilisant objdump"
	arm-none-eabi-objdump -h startup.o
	@echo
	@echo "Liste des sections de rtc_demo.elf en utilisant objdump"
	arm-none-eabi-objdump -h rtc_demo.elf

clean:
	@echo
	@echo "Nettoyage avant construction"
	rm -f *.o
	rm -f *.elf
	rm -f *.bin
	rm -f *.s
