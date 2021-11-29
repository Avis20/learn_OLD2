#include <stdio.h>

/*
f(0) = 1; f(1) = 1;
f(n) = f(n - 1) + f(n - 2)
*/
// Рекурсивный алгоритм вычисление числа фибоначчи
long fib1(int n){
    if ( n == 0 || n == 1 ){
        return 1;
    }
    return fib1( n - 1 ) + fib1( n - 2 );
}

int main(void){
    int n = 50;
    printf("%d = %ld\n", n, fib1(n));
    return 0;
}