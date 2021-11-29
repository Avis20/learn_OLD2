#include <stdio.h>

/*
f(0) = 1; f(1) = 1;
f(n) = f(n - 1) + f(n - 2)
*/
// Не рекурсивный алгоритм вычисление числа фибоначчи
long fib2(int n){
    if ( n == 0 ) return 1;
    long prev = 1; // f(0)
    long cur = 1; // f(1)

    for (int i = 2; i <= n; ++i){
        long tmp = cur;
        cur += prev; // f(i)
        prev = tmp;  // запоминаем f(i-1)
    }
    return cur;
}

int main(void){
    int n = 200;
    printf("%d = %ld\n", n, fib2(n));
    return 0;
}