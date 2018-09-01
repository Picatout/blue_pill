all:
	@echo "Make targets"
	@cat makefile | grep '^[a-zA-Z]' | sed 's/:.*//g' | sed 's/^/  /g'

build: blink.c startup.c stm32.ld clean
	@echo
	@echo "Build production image"
	arm-none-eabi-gcc -c -mcpu=cortex-m3 -mthumb -o blink.o blink.c
	arm-none-eabi-gcc -c -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-ld -Tstm32.ld -o blink.elf startup.o blink.o
	arm-none-eabi-objcopy -O binary blink.elf blink.bin

build_O1:  blink.c startup.c stm32.ld clean
	@echo
	@echo "Build production image withi O1 optimization"
	arm-none-eabi-gcc -O1 -c -mcpu=cortex-m3 -mthumb -o blink.o blink.c
	arm-none-eabi-gcc -O1 -c -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-ld -Tstm32.ld -o blink.elf startup.o blink.o
	arm-none-eabi-objcopy -O binary blink.elf blink.bin

build_debug: blink.c startup.c stm32.ld clean
	@echo
	@echo "Build debug image"
	arm-none-eabi-gcc -O0 -c -g -mcpu=cortex-m3 -mthumb -o blink.o blink.c
	arm-none-eabi-gcc -O0 -c -g -mcpu=cortex-m3 -mthumb -o startup.o startup.c
	arm-none-eabi-ld -Tstm32.ld -o blink.elf startup.o blink.o
	arm-none-eabi-objcopy -O binary blink.elf blink.bin

print_gcc_assembler:
	@echo
	@echo "Print assembler code of blink.c using the arm-none-eabi-gcc -S option"
	arm-none-eabi-gcc -S -mcpu=cortex-m3 -mthumb blink.c
	cat blink.s
	@echo
	@echo "Print assembler code of startup.c using the arm-none-eabi-gcc -S option"
	arm-none-eabi-gcc -S -mcpu=cortex-m3 -mthumb startup.c
	cat startup.s

print_disassemble:
	@echo
	@echo "Print assembler code of blink.elf with objdump"
	arm-none-eabi-objdump -S --disassemble blink.elf
	@echo
	@echo "Print assembler code of blink.o with objdump"
	arm-none-eabi-objdump -S --disassemble blink.o
	@echo
	@echo "Print assembler code of startup.o with objdump"
	arm-none-eabi-objdump -S --disassemble startup.o

print_symbols_nm:
	@echo
	@echo "Print symbols of blink.o using nm"
	arm-none-eabi-nm --numeric-sort blink.o
	@echo
	@echo "Print symbols of startup.o using nm"
	arm-none-eabi-nm --numeric-sort startup.o
	@echo
	@echo "Print symbols of blink.elf using nm"
	arm-none-eabi-nm --numeric-sort blink.elf

print_symbols_objdump:
	@echo
	@echo "Print symbols of blink.o using objdump"
	arm-none-eabi-objdump --syms blink.o
	@echo
	@echo "Print symbols of startup.o using objdump"
	arm-none-eabi-objdump --syms startup.o
	@echo
	@echo "Print symbols of blink.elf using objdump"
	arm-none-eabi-objdump --syms blink.elf

print_sections:
	@echo
	@echo "Print sections of blink.o using objdump"
	arm-none-eabi-objdump -h blink.o
	@echo
	@echo "Print sections of startup.o using objdump"
	arm-none-eabi-objdump -h startup.o
	@echo
	@echo "Print sections of blink.elf using objdump"
	arm-none-eabi-objdump -h blink.elf

clean:
	@echo
	@echo "Running target clean"
	rm -f *.o
	rm -f *.elf
	rm -f *.bin
	rm -f *.s
