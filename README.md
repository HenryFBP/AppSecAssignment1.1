# AppSecAssignment1.1
Hello students! In this assignment you will be fixing a barely-fuctioning 
and deeply-flawed C program used to create a gift card file. Details 
about this assignment can be found in the 
[Instructions File](./HW1_Instructions.md).

Please remember to turn in both the code and a write-up. The write-up
should be **no longer than 3 pages** and should explain:

1. Your method to try to find bugs.
2. Your method to try to fix the bugs you found (if any).
3. Your method of writing tests and fuzzing.

This write-up is very useful for partial credit, just in case you did 
not do as well in the actual goals of the assignment as you were 
expecting or hoping.

Good luck!

[![Build Status](https://travis-ci.com/HenryFBP/AppSecAssignment1.1.svg?token=mHPrA98N3yAoVQKG6EzR&branch=master)](https://travis-ci.com/HenryFBP/AppSecAssignment1.1)

## Notes

-   `cat <file> | hexdump -C`
-   `hexdump fuzz-output/giftcardreader/crashes/id\:000003* -C`
-   `hexdump -C data/examplefile.gft`
-   `diff <(hexdump fuzz-output/giftcardreader/crashes/id\:000003* -C) <(hexdump -C data/examplefile.gft) | colordiff`
-   `for f in fuzz-output/giftcardreader/crashes/*; do echo $f; hexdump -C $f; done | less`

## Links

-   <https://x9security.com/fuzzing-explained-with-afl/>
-   <https://afl-1.readthedocs.io/en/latest/fuzzing.html>

## Building

    make clean all

## Running

    make giftcardreader; ./giftcardreader 1 data/examplefile.gft

## Editing files

You can use "HxD" to edit files in hex.

## Fuzzing

    make fuzz_crackmypassword

    make fuzz_giftcardreader

And read the `Makefile`!

## Debugging

-   <https://sourceware.org/gdb/onlinedocs/gdb/Continuing-and-Stepping.html>
-   <http://www.gdbtutorial.com/gdb-breakpoints-example>
-   <https://stackoverflow.com/questions/14609577/print-character-array-to-file-in-gdb>

-   `n` will go to the next line in the current frame.
-   `s` will go into the function call.

Note: The below commands are different on Windows.

    gdb -tui --args giftcardreader.exe 1 data/examplefile.gft
    
    OR

    gdb --args giftcardreader.exe 1 data/examplefile.gft

    b gift_card_reader

    info breakpoints

    run

    list

    frame

    s
    s
    s

    p ret_val->num_bytes

    s
    s
    s
    s

    p /s (char*) ptr
    p /x (char*) ptr

    s
    s
    s

    p gcd_ptr->merchant_id
    p (gcd_ptr->merchant_id + 32)

    s
    s
    s

    p /s (char*)ptr // Why is this now printing something different? Think about what code just ran...

    s
    s

    p gcd_ptr->number_of_gift_card_records

    frame
    s

    p /s (char*)ptr
    p /s (char*)ptr+4
    p /s (char*)ptr+8
    p /s (char*)ptr+12
    list
    frame

    s
    p gcd_ptr->number_of_gift_card_records

    ...

After ptr is populated:

    p /s (char*) ptr

## File descriptions

### examplefile.gft

Normal.

### examplefile-edited-but-valid.gft

No bugs or overflows. Edited text.

### examplefile3.gft

Lies about file size a bit in byte 0. Reports 16 bytes short.

### examplefile4.gft

Buffer over-read. CWE 126. Last string is too small.