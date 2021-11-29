#include <stdio.h>

// Посчет кол-ва цифр, пробелов, других символов

int main(){
    int c, i, nwhite, other, digits[10];

    nwhite = other = 0;
    for ( i = 0; i < 10; i++ ){
        digits[i] = 0;
        while ( ( c = getchar() ) != EOF ){
            switch(c){
                case '0': case '1': case '2': case '3': case '4':
                case '5': case '6': case '7': case '8': case '9':
                    digits[c - '0']++;
                    break;
                case ' ': case '\n': case '\t':
                    nwhite++;
                    break;
                default:
                    other++;
                    break;
            }
        }
    }

    printf("digits = ");
    for (int i = 0; i < 10; i++){
        printf(" %d ", digits[i]);
    };
    printf("\n white spaces = %d; other = %d", nwhite, other);

    return 0;
}