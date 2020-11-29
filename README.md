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

## Notes

-   `cat <file> | hexdump -C`

## Links

-   <https://x9security.com/fuzzing-explained-with-afl/>

## Building

    make clean all

## Running

    make giftcardreader; ./giftcardreader 1 data/examplefile.gft

## Editing files

You can use "HxD" to edit files in hex.

## Fuzzing

    make fuzz_crackmypassword

And read the `Makefile`!

## Debugging

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