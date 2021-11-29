#include <stdio.h>

int atoi(char s[]);

int main(){

    char str[] = "456";
    int res;
    res = atoi(str);
    printf("%d\n", res);
    return 0;
}


// преобразует строку в целое число
int atoi(char s[]){
    int i, n = 0;
    for (i = 0; s[i] >= '0' && s[i] <= '9'; i++){
        n = n * 10 + (s[i] - '0');
    }
    return n;
}