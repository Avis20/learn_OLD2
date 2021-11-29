#include <stdio.h>
#include <string.h>

// Удаляет пустые символы в конце строки
// int trim(char str[]);

int main(){
    // char str[] = "";
    // trim(str);
    // printf("%s", str);

    int a[] = {1,2,3,4,5,65,3,23,321,5,6,8,9,9,2};

    for ( int i = 0; i < 15; i++ ){
        if (a[i] % 2) continue;
        printf("%d = %d\n", i, a[i]);
    }

    return 0;
}

int trim(char str[]){
    int n;

    for ( n = strlen(str) - 1; n >= 0; n-- ){
        if ( str[n] != ' ' && str[n] != '\t' && str[n] != '\n' ) break;
    }
    str[++n] = '\0';
    return n;
}