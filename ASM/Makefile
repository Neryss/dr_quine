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
	./Colleen > Colleen_tmp.txt && diff Colleen.s Colleen_tmp.txt

.PHONY: re all clean fclean run
# nasm -felf64 Colleen.asm
# gcc Collen.o