#include <stdio.h>
#include <stdlib.h>

int htoi(char []);

int main(){

    char str[] = "0xabcdef0";

    if (0){ // debug
        int number = (int)strtol(str, NULL, 16);
        int res = htoi(str);
        printf("result = %d; number = %d\n", res, number);
    } else {
        int res = htoi(str);
        printf("Исходная строка = '%s'; целое число = %d\n", str, res);
    }
    
    return 0;
}

// преобразует строку шестьнадцатеричных цифр в целое число
int htoi(char s[]){
    int i, n = 0;

    if ( !(s[0] == '0' && ( s[1] == 'x' || s[1] == 'X')) )
        return 0;

    for ( i = 2; s[i] != '\0'; i++ ){
        if ( s[i] >= '0' && s[i] <= '9' ){
            n = n * 16 + ( s[i] - '0' );
        } else if (( s[i] >= 'a' && s[i] <= 'f' ) ){
            n = n * 16 + ( s[i] - 'a' + 10);
        } else if ( s[i] >= 'A' && s[i] <= 'F' ){
            n = n * 16 + ( s[i] - 'A' + 10);
        }
    }

    return n;
}