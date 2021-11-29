#include <stdio.h>
#define IN 1
#define OUT 1

int main(){

    int i, j, state, count = 0;
    char c;
    int words[100] = {0, 1, 13, 5, 9, 12, 7, 9, 3, 5};
/*
    state = OUT;

    for (int i = 0; i < 10; ++i)
        words[i] = 0;

    while ( (c = getchar()) != EOF ){

        if ( c == ' ' || c == '\n' || c == '\t' ){
            state = OUT;
            ++words[count];
            count = 0;
        } else if ( state == OUT ){
            state = IN;
            ++count;
        }
    }

    ++words[count];
*/
    for (int i = 1; i < 10; ++i){
        printf("%d", i);
        for (j = 0; j < words[i]; j++)
            putchar('-');
        putchar('\n');
    }

    return 0;
}