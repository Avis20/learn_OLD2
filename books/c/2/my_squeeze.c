#include <stdio.h>

// Удаляет символы из s1 все символы из строки s2
void my_squeeze( char s1[], char s2[] );

int main(){
    char str1[] = "hello, world!";
    char str2[] = "hwo";
    my_squeeze(str1, str2);
    printf("Result = '%s'\n", str1);
    return 0;
}

void my_squeeze( char s1[], char s2[] ){
    int i, j, k;
    for ( i = 0; s2[i] != '\0'; i++ ){
        for ( j = k = 0; s1[j] != '\0'; j++ ){
            if ( s1[j] != s2[i] ){
                s1[k++] = s1[j];
            }
        }
        s1[k] = '\0';
    }
}