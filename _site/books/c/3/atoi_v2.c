#include <stdio.h>
#include <ctype.h>
#include <limits.h>

// Преобразовывает строку в число
int atoi( char s[] );

int main(){

    char str[] = "  -123";
    int res = atoi(str);
    printf("%d\n", res);

    return 0;
}

int atoi( char s[] ){
    int i, n, sign;

    for( i = 0; isspace(s[i]); i++ );
    sign = ( s[i] == '-' ) ? -1 : 1;
    if (s[i] == '+' || s[i] == '-') i++;

    for ( n = 0; isdigit(s[i]); i++){
        n = 10 * n + (s[i] - '0');
    }

    return sign * n;
}