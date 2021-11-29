/*
Упражнение 2.1. Напишите программу для определения диапазонов переменных типов char, short, int и long (как signed так и unsigned), путем вывода соответствующих значений из заголовочных файлов, а также с помощью непостредственного вычисления.
*/

#include <stdio.h>
#include <limits.h>

int main(){

    printf("char = %d\nsigned char = %d\nunsigned char = %d\n", CHAR_MAX, SCHAR_MAX, UCHAR_MAX);
    printf("int = %d\nshort = %d\nunsigned short = %d\nlong = %lu\nunsigned long = %lu\n", INT_MAX, SHRT_MAX, USHRT_MAX, LONG_MAX, ULONG_MAX);

    return 0;
}
