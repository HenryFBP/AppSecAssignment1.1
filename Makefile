giftcardreader: giftcardreader.c
	gcc -o giftcardreader giftcardreader.c

testgiftcardreader: giftcardreader
	./giftcardreader 1 examplefile.gft


giftcardexamplewriter:
	gcc -o giftcardexamplewriter giftcardexamplewriter.c

testgiftcardexamplewriter: giftcardexamplewriter
	./giftcardexamplewriter


