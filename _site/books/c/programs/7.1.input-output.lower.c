#include <stdio.h>
#include <ctype.h>

// Перевод входных данных в нижний регистр
int main(){
    int c;

    while ( ( c = getchar() ) != EOF ){
        putchar( tolower(c) );
    }

    return 0;
}