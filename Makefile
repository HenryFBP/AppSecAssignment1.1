all: giftcardreader giftcardexamplewriter

target2: target1 # depends on target1, will do everything that it requires
	echo "target2"

target1: #no dependencies, try `make target1` in terminal
	echo "target1"
	echo "cool build command"

giftcardreader: giftcardreader.c
	gcc -g -o giftcardreader giftcardreader.c

testgiftcardreader: giftcardreader
	./giftcardreader 1 data/examplefile.gft

giftcardexamplewriter:
	gcc -g -o giftcardexamplewriter giftcardexamplewriter.c

testgiftcardexamplewriter: giftcardexamplewriter
	./giftcardexamplewriter
