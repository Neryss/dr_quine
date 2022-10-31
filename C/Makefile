CC=clang
CFLAGS= -Wall -Wextra -Werror
MAKEFLAGS += --no-print-directory

all: Makefile Sully Grace Colleen

Colleen: Colleen.c
	$(CC) $(CFLAGS) -o Colleen Colleen.c

Grace: Grace.c
	$(CC) $(CFLAGS) -o Grace Grace.c

Sully: Sully.c
	$(CC) $(CFLAGS) -o Sully Sully.c

clean:
	rm -rf Colleen Grace Sully Sully_* *.out Grace_kid.c

re: clean
	@$(MAKE) all

.PHONY: clean re all

run: all
	./Colleen > c.out && diff Colleen.c c.out
	./Grace && diff Grace.c Grace_kid.c
	./Sully