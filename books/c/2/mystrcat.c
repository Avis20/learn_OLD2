#include <stdio.h>

// Добавляет строку t к строке s
void mystrcat ( char s[], char t[]);

int main(){
    char str1[10] = "hello, ";
    char str2[10] = "world!";
    mystrcat(str1, str2);
    printf("\n%s\n", str1);
    return 0;
}

void mystrcat ( char s[], char t[]){
    int i, j;
    i = j = 0;
    while ( s[i] != '\0' ) i++;
    printf("%d", i);
    s[8] = 'd';
    s[9] = 'd';
    s[10] = 'd';
    // while ( ( s[i++] = t[j++] ) != '\0' );
}