#include <stdio.h>

void escape( char s[], char t[] );
void test(char str[]);

int main(){

    char str1[20] = "Hello ";
    char str2[20] = "wo\n\t";

    escape(str1, str2);
    printf("%s\n", str1);

    return 0;
}

void escape( char s[], char t[] ){

    int i, j;
    char c;
    i = j = 0;
    while ( s[++i] != '\0' );
    while ( ( c = t[j++] ) != '\0' ){
        switch (c){
            case '\n':
                s[i++] = '\\';
                s[i++] = 'n';
                break;
            case '\t':
                s[i++] = '\\';
                s[i++] = 't';
                break;
            default:
                s[i++] = c;
        }
    }
}