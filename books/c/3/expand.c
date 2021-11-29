#include <stdio.h>

void expand(char s1[], char s2[]);

int main(){
    char s[] = "a-z";
    char res[100];

    expand(s, res);
    printf("%s", res);

    return 0;
}

void expand(char s1[], char s2[]){
    s2[0] = 'a';
}