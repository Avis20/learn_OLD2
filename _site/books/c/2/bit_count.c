#include <stdio.h>

// Подсчитывает кол-во 1 в битовом числе
int bitcount( unsigned int x );

int main(){
    int x = 10;
    int result = bitcount(x);
    printf("%d", result);
    return 0;
}

int bitcount( unsigned int x ){
    int i;
    for (i = 0; x != 0; x >>= 1){
        if (x & 01){
            i++;
        }
    }
    return i;
}