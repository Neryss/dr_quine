CC= nasm
CFLAGS= -felf64
LD= gcc
MAKEFLAGS= --no-print-directory

all: Makefile Colleen

Colleen: Colleen.s
	$(CC) $(CFLAGS) Colleen.s
	$(LD) -o Colleen Colleen.o

clean:
	rm -rf Colleen.o

fclean: clean
	rm -rf Colleen

re: fclean
	$(MAKE)

.PHONY: re all clean fclean
# nasm -felf64 Colleen.asm
# gcc Collen.o