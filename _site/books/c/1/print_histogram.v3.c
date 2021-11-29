#include <stdio.h>
#define N 1000

void print_result(char [], int);

int main(){

    char chars[N], c;

    for (int i = 0; i < N; i++) chars[i] = 0;

    while ( (c = getchar()) != EOF )
        ++chars[c];

    print_result(chars, N);

    return 0;
}

void print_result(char arr[], int n){

    for (int i = 0; i < n; i++)
        if ( arr[i] ){
            printf("%c", i);
            for (int j = 0; j < arr[i]; j++)
                putchar('-');
            putchar('\n');
        }
}