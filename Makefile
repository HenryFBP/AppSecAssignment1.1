target2: target1 # depends on target1, will do everything that it requires
	echo "target2"

target1: #no dependencies, try `make target1` in terminal
	echo "target1"
	echo "cool build command"

giftcardreader: giftcardreader.c
	gcc -o giftcardreader giftcardreader.c

testgiftcardreader: giftcardreader
	./giftcardreader 1 examplefile.gft

giftcardexamplewriter:
	gcc -o giftcardexamplewriter giftcardexamplewriter.c

testgiftcardexamplewriter: giftcardexamplewriter
	./giftcardexamplewriter
