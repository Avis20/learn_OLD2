#ifndef OTHER_H
#define OTHER_H

#define DefaultInitialSize 4
#define max(a, b) ( (a) > (b) ? (a) : (b) )
 
// Динамический массив
typedef struct carray {
    double *buffer;     // Буфер
    int bufferSize;     // Размер буфера
    int realSize;       // кол-во эл. в массиве
} CArray;

void CArray_add(CArray *, double el);
double CArray_get(CArray *arr, int index);
void _CArray_grow(CArray *arr);

int fib1(int n);
int fib2(int n);

int hasElement(const int *arr, int count, int element);
int findElement(const int *arr, int count, int element);
int maxElement(const int *arr, int count);
int binarySearch(int *arr, int count, int element);

#endif // OTHER_H

