_END=\033[0m
_RED=\033[31m
_GREEN=\033[32m

MAKEFLAGS += --no-print-directory

all: Makefile Sully Grace Colleen

Colleen: Colleen.js
	node Colleen.js

Grace: Grace.js
	node Grace.js

Sully: Sully.js
	node Sully.js

fclean:
	rm -rf Colleen Colleen_tmp.txt Grace Sully Sully_* *.out Grace_kid.js

re: fclean
	@$(MAKE) all

.PHONY: fclean re all

run:
	@printf "$(_RED)[JS]$(_END)$(_GREEN)[Colleen]$(_END) Running tests: no output expected\n"
	@node Colleen.js > Colleen_tmp.txt && diff Colleen.js Colleen_tmp.txt
	@printf "$(_RED)[JS]$(_END)  $(_GREEN)[Grace]$(_END) Running tests: no output expected\n"
	@node Grace.js; diff Grace.js Grace_kid.js
	@printf "$(_RED)[JS]$(_END)  $(_GREEN)[Sully]$(_END) Running tests\n"
	@printf "$(_RED)[JS]$(_END)  $(_GREEN)[Sully]$(_END) Diff tests, only integers should change\n"
	node Sully.js
	-diff Sully.js Sully_4.js
	-diff Sully.js Sully_5.js
	-diff Sully_5.js Sully_0.js