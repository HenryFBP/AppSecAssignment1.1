#include <stdio.h>
#include <string.h>

static char* PASSWORD="cuteslug";

void process_password()
{
    char enterpassword[2];
    printf("Do you want to enter a password?\n (Y/N) > ");
    scanf("%s", enterpassword);
    // scanf("%2s", enterpassword); //What you should do to fix buffer overflow

    if (strcmp(enterpassword, "N") == 0)
        return;

    printf("You entered: ");
    printf(enterpassword);
    printf("\n");

    char password[256];
    printf("Enter your password: \n > ");
    scanf("%s", password);
    // scanf("%256s", password); //What you should do to fix buffer overflow

    if (strcmp(password, PASSWORD) == 0)
    {
        printf("Correct!\n");
    }
    else
    {
        printf("Incorrect.\n");
    }
}

int main(int argc, char **argv)
{
    process_password();
    return 0;
}
