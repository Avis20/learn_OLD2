#include <stdio.h>
#include <stdlib.h>
#include "calc.h"

#define BUFSIZE 100     // макс размер буфера

char buf[BUFSIZE];
int bufp = 0;

// Ввод символа
char getch(){
    return ( bufp > 0 ) ? buf[--bufp] : getchar();
}

// Возвращение символа
void ungetch( char c ){
    if ( bufp >= BUFSIZE ){
        printf("ungetch: too many characters\n");
    } else {
        buf[bufp++] = c;
    }
}
