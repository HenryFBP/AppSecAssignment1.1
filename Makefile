CC = afl-gcc #change to 'gcc' if you're not fuzzing

ifeq (, $(shell which $(CC)))
$(error "No $(CC) in $(PATH), read README.md")
endif

all: giftcardreader.exe giftcardexamplewriter.exe

clean:
	rm -f *.exe

target2: target1 # depends on target1, will do everything that it requires
	echo "target2"

target1: #no dependencies, try `make target1` in terminal
	echo "target1"
	echo "cool build command"

giftcardreader.exe: giftcardreader.c
	$(CC) -g -o giftcardreader.exe giftcardreader.c

testgiftcardreader: giftcardreader.exe
	./giftcardreader.exe 1 data/examplefile.gft

giftcardexamplewriter.exe:
	$(CC) -g -o giftcardexamplewriter.exe giftcardexamplewriter.c

testgiftcardexamplewriter: giftcardexamplewriter.exe
	./giftcardexamplewriter.exe
