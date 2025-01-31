RM:=rm -rf
OUT:=fcalc

all: build

build: $(OUT).o
	gcc -g -o $(OUT) $^ -no-pie -z noexecstack

$(OUT).o: $(OUT).asm
	nasm -f elf64 -g -F dwarf $(OUT).asm -l $(OUT).lst

.PHONY: clean
clean:
	$(RM) $(OUT) $(OUT).o $(OUT).lst
