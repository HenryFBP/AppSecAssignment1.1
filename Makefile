CC = afl-gcc #change to 'gcc' if you're not fuzzing
FUZZER = afl-fuzz
CFLAGS = -g

ifeq (, $(shell which $(CC)))
$(warning "No $(CC) in PATH, read README.md. Using gcc.")
CC = gcc
endif

all: giftcardreader.exe giftcardexamplewriter.exe crackmypassword.exe
	mkdir -p fuzz-output

clean:
	rm -f *.exe

target2: target1 # depends on target1, will do everything that it requires
	echo "target2"

target1: #no dependencies, try `make target1` in terminal
	echo "target1"
	echo "cool build command"

crackmypassword.exe: crackmypassword.c
	$(CC) $(CFLAGS) -o crackmypassword.exe crackmypassword.c

# note that crackmypassword.exe takes input from STDIN so the files in fuzz-input/crackmypassword are sent to stdin
fuzz_crackmypassword: crackmypassword.exe
	mkdir -p fuzz-output/crackmypassword
	$(FUZZER) -i ./fuzz-input/crackmypassword -o ./fuzz-output/crackmypassword ./crackmypassword.exe

# giftcardreader.exe takes input from the command line, so '@@' is where the filepath is given.
fuzz_giftcardreader1: giftcardreader.exe
	mkdir -p fuzz-output/giftcardreader
	$(FUZZER) -i ./fuzz-input/giftcardreader -o ./fuzz-output/giftcardreader ./giftcardreader.exe 1 @@

fuzz_giftcardreader2: giftcardreader.exe
	mkdir -p fuzz-output/giftcardreader
	$(FUZZER) -i ./fuzz-input/giftcardreader -o ./fuzz-output/giftcardreader ./giftcardreader.exe 2 @@

giftcardreader.exe: giftcardreader.c
	$(CC) $(CFLAGS) -o giftcardreader.exe giftcardreader.c

testgiftcardreader: giftcardreader.exe
	./giftcardreader.exe 1 data/examplefile.gft

giftcardexamplewriter.exe:
	$(CC) $(CFLAGS) -o giftcardexamplewriter.exe giftcardexamplewriter.c

testgiftcardexamplewriter: giftcardexamplewriter.exe
	./giftcardexamplewriter.exe
