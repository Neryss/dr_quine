_END=\033[0m
_RED=\033[31m
_GREEN=\033[32m

CC= nasm
CFLAGS= -felf64
LD= gcc -g -no-pie
MAKEFLAGS= --no-print-directory

all: Makefile Colleen Grace Sully

Colleen: Colleen.s
	$(CC) $(CFLAGS) Colleen.s
	$(LD) -o Colleen Colleen.o

Grace: Grace.s
	$(CC) $(CFLAGS) Grace.s
	$(LD) -o Grace Grace.o

Sully: Sully.s
	$(CC) $(CFLAGS) Sully.s
	$(LD) -o Sully Sully.o && rm Sully.o

clean:
	rm -rf Colleen.o Grace.o Sully.o

fclean: clean
	rm -rf Colleen Colleen_tmp.txt
	rm -rf Grace Grace_kid.s
	rm -rf Sully Sully_*

re: fclean
	$(MAKE)

run: all
	@printf "$(_RED)[ASM]$(_END)$(_GREEN)[Colleen]$(_END) Running tests: no output expected\n"
	@./Colleen > Colleen_tmp.txt && diff Colleen.s Colleen_tmp.txt
	@printf "$(_RED)[ASM]$(_END)  $(_GREEN)[Grace]$(_END) Running tests: no output expected\n"
	@./Grace; diff Grace.s Grace_kid.s
	@printf "$(_RED)[ASM]$(_END)  $(_GREEN)[Sully]$(_END) Running tests\n"
	@printf "$(_RED)[ASM]$(_END)  $(_GREEN)[Sully]$(_END) Count should be 13:\n"
	@./Sully; ls -la | grep Sully | wc -l
	@printf "$(_RED)[ASM]$(_END)  $(_GREEN)[Sully]$(_END) Diff tests, only r12 register should change\n"
	-diff Sully.s Sully_4.s
	-diff Sully.s Sully_5.s
	-diff Sully_5.s Sully_0.s

.PHONY: re all clean fclean run