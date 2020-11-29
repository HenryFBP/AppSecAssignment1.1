CC = afl-gcc #change to 'gcc' if you're not fuzzing
CFLAGS = -g

ifeq (, $(shell which $(CC)))
$(error "No $(CC) in $(PATH), read README.md")
endif

all: giftcardreader.exe giftcardexamplewriter.exe crackmypassword.exe

clean:
	rm -f *.exe

target2: target1 # depends on target1, will do everything that it requires
	echo "target2"

target1: #no dependencies, try `make target1` in terminal
	echo "target1"
	echo "cool build command"

crackmypassword.exe: crackmypassword.c
	$(CC) $(CFLAGS) -o crackmypassword.exe crackmypassword.c

giftcardreader.exe: giftcardreader.c
	$(CC) $(CFLAGS) -o giftcardreader.exe giftcardreader.c

testgiftcardreader: giftcardreader.exe
	./giftcardreader.exe 1 data/examplefile.gft

giftcardexamplewriter.exe:
	$(CC) $(CFLAGS) -o giftcardexamplewriter.exe giftcardexamplewriter.c

testgiftcardexamplewriter: giftcardexamplewriter.exe
	./giftcardexamplewriter.exe
