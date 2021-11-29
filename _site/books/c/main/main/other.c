#include "other.h"
#include <malloc.h>

void CArray_add(CArray *arr, double el){
    if ( arr->realSize == arr->bufferSize ){
        _CArray_grow(arr);
    }
    arr->buffer[arr->realSize++] = el;
}

double CArray_get(CArray *arr, int index){
    // if ( index < 0 ) return 'error'
    return arr->buffer[index];
}

void _CArray_grow(CArray *arr){
    int newBufferSize = max( arr->bufferSize * 2, DefaultInitialSize );
    double *newBuffer = (double *) malloc( sizeof(double) * newBufferSize );
    for (int i = 0; i < arr->realSize; i++){
        newBuffer[i] = arr->buffer[i];
    }
    free(arr->buffer);
    arr->buffer = newBuffer;
    arr->bufferSize = newBufferSize;
}

/*
f(0) = 1; f(1) = 1;
f(n) = f(n - 1) + f(n - 2)
*/
// Рекурсивный алгоритм вычисление числа фибоначчи
int fib1(int n){
    if ( n == 0 || n == 1 ){
        return 1;
    }
    return fib1( n - 1 ) + fib1( n - 2 );
}

// Не рекурсивный
int fib2(int n){
    if ( n == 0 ) return 1;
    int prev = 1; // f(0)
    int cur = 1; // f(1)

    for (int i = 2; i <= n; ++i){
        int tmp = cur;
        cur += prev; // f(i)
        prev = tmp;  // запоминаем f(i-1)
    }
    return cur;
}

// 1.1. Проверить есть ли эл. в массиве
int hasElement(const int *arr, int count, int element){
    for (int i = 0; i < count; i++){
        if ( arr[i] == element ){
            return 1;
        }
    }
    return 0;
}

// 1.2. Проверить есть ли эл. в массиве. Если он есть, вернуть позицию его первого вхождения, если нет, вернуть -1
int findElement(const int *arr, int count, int element){
    for (int i = 0; i < count; i++){
        if ( arr[i] == element ){
            return i;
        }
    }
    return -1;
}

// 1.3. Найти максимальный эл. в массиве. Вернуть его значение
int maxElement(const int *arr, int count){
    // if ( count < 0 ) return 'error';

    int max = arr[0];
    for (int i = 0; i < count; i++){
        if ( arr[i] > max ){ // нашли больший
            max = arr[i];
        }
    }
    return max;
}

// Бинарный поиск
int binarySearch(int *arr, int count, int element){
    int first = 0;
    int last = count;
    while ( first < last ){
        int middle = ( first + last ) / 2;
        if ( element <= arr[middle] ){
            last = middle;
        } else {
            first = middle + 1;
        }
    }

    return ( first == count || arr[first] != element ) ? -1 : first;
}
