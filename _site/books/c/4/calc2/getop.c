#include <stdio.h>
#include <stdlib.h>
#include "calc.h"

// Извлекает операнд или знак операции
int getop(char s[]){
    int i, c;
    i = 0;

    while ( ( s[0] = c = getch() ) == ' ' || c == '\t' );

    s[1] = '\0';

    if ( !isdigit(c) && c != '.' ) return c; // не число

    if ( isdigit(c) ){ // Накопление целой части
        while ( isdigit(s[++i] = c = getch()) );
    };

    if ( c == '.' ){
        while ( isdigit(s[++i] = c = getch() ));
    }

    s[i] = '\0';

    if (c != EOF) ungetch(c);
    return IS_NUMBER;
}

