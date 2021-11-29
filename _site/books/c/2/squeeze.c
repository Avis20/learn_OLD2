#include <stdio.h>

// удаляет все символы c из строки s
void squeeze ( char s[], int c);

int main(){
    char str[] = "hello, world!";
    squeeze(str, 'hwo');
    printf("\n%s\n", str);
    return 0;
}

void squeeze ( char s[], int c){
    int i, j;

    for ( i = j = 0; s[i] != '\0'; i++ ){
        if ( s[i] != c ){
            s[j++] = s[i];
        }
    }
    printf("%d", j);

    s[j] = '\0';
}