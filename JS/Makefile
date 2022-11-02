MAKEFLAGS += --no-print-directory

all: Makefile Sully Grace Colleen

Colleen: Colleen.js
	node Colleen.js

Grace: Grace.js
	node Grace.js

Sully: Sully.js
	node Sully.js

clean:
	rm -rf Colleen Grace Sully Sully_* *.out Grace_kid.js

re: clean
	@$(MAKE) all

.PHONY: clean re all

run:
	node Colleen.js > c.out && diff Colleen.js c.out
	node Grace.js && diff Grace.js Grace_kid.js
	node Sully.js