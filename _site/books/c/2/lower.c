#include <stdio.h>

char lower(char);

int main(){
    char old_char = 'G';
    char new_char = lower(old_char);
    printf("%c\n", new_char);
    return 0;
}

// преобразует символ в нижний регистр
char lower(char c){

    if (c  >= 'A' && c <= 'Z')
        return c + 'a' - 'A';

    return c;
}