#include <stdio.h>

// подсчет кол-ва цифр, пробелов, и остальных

int main(){

    int i, count_spaces, count_other;
    char c;
    int ndigit[10];

    count_spaces = count_other = 0;
    for (int i = 0; i < 10; ++i)
        ndigit[i] = 0;

    while ( (c = getchar()) != EOF ){
        if ( c >= '0' && c <= '9' )
            ++ndigit[c - '0'];
        else if ( c == ' ' || c == '\n' || c == '\t' )
            ++count_spaces;
        else
            ++count_other;
    }

    printf("digits = ");
    for (int i = 0; i < 10; ++i)
        printf(" %d", ndigit[i]);

    printf(", spaces = %d, other = %d\n", count_spaces, count_other);

    return 0;
}