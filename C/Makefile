_END=\033[0m
_RED=\033[31m
_GREEN=\033[32m

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

fclean:
	rm -rf Colleen Colleen_tmp.txt Grace Sully Sully_* *.out Grace_kid.c

re: fclean
	@$(MAKE) all

.PHONY: clean re all

run: all
	@printf "$(_RED)[C]$(_END)$(_GREEN)[Colleen]$(_END) Running tests: no output expected\n"
	@./Colleen > Colleen_tmp.txt && diff Colleen.c Colleen_tmp.txt
	@printf "$(_RED)[C]$(_END)  $(_GREEN)[Grace]$(_END) Running tests: no output expected\n"
	@./Grace; diff Grace.c Grace_kid.c
	@printf "$(_RED)[C]$(_END)  $(_GREEN)[Sully]$(_END) Running tests\n"
	@printf "$(_RED)[C]$(_END)  $(_GREEN)[Sully]$(_END) Count should be 13:\n"
	@./Sully; ls -la | grep Sully | wc -l
	@printf "$(_RED)[C]$(_END)  $(_GREEN)[Sully]$(_END) Diff tests, only integers should change\n"
	-diff Sully.c Sully_4.c
	-diff Sully.c Sully_5.c
	-diff Sully_5.c Sully_0.c