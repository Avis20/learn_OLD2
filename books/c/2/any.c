#include <stdio.h>
#include <stdlib.h>

// Возвращает позицию первого символа s1 из строки s2
int any( char s1[], char s2[] );

int main(){
    char str[] = "hello, world!";
    char any_simbols[] = "sa45sae";
    int res = any(str, any_simbols);
    printf("%d", res);
    return 0;
}

int any( char s1[], char s2[] ){

    for (int i = 0; s2[i] != '\0'; i++){
        for (int j = 0; s1[j] != '\0'; j++){
            if ( s1[j] == s2[i] )
                return j;
        }
    }
    return -1;
}