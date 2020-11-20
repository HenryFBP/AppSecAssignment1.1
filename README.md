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

## Running

    make giftcardreader; ./giftcardreader 1 examplefile.gft

## File descriptions

### examplefile.gft

Normal.

### examplefile-edited-but-valid.gft

No bugs or overflows. Edited text.

### examplefile3.gft

Lies about file size a bit in byte 0. Reports 16 bytes short.

### examplefile4.gft

Buffer over-read. CWE 126. Last string is too small.