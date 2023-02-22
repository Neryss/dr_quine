CC= nasm
CFLAGS= -felf64
LD= gcc -g
MAKEFLAGS= --no-print-directory

all: Makefile Colleen Grace

Colleen: Colleen.s
	$(CC) $(CFLAGS) Colleen.s
	$(LD) -o Colleen Colleen.o

Grace: Grace.s
	$(CC) $(CFLAGS) Grace.s
	$(LD) -o Grace Grace.o

clean:
	rm -rf Colleen.o

fclean: clean
	rm -rf Colleen Colleen_tmp.txt

re: fclean
	$(MAKE)

run: all
	./Colleen > Colleen_tmp.txt && diff Colleen.s Colleen_tmp.txt

.PHONY: re all clean fclean run
# nasm -felf64 Colleen.asm
# gcc Collen.o