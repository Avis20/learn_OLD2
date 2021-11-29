#include <stdlib.h>
#include <stdio.h>
#include "myqsort.h"
#include "chapter4.h"

#define MAXLEN 100
#define MAXLINES 100

int read_lines( char *lineptr[], int max_lines ){
    int len, nlines;

    char *p, line[MAXLEN];
    nlines = 0;

    while ( (len = get_line(line, MAXLEN)) > 0 ){
        if ( nlines >= max_lines || ( p = alloc(len) ) == NULL ){
            return -1;
        } else {
            line[len-1] = '\0'; // у каждой введенной строки удаляем последний символ конца строки
            strcpy3(p, line);
            lineptr[nlines++] = p;
        }
    }
    return nlines;
}

int write_lines( char *lines[], int nlines ){
    for (int i = 0; i < nlines; i++){
        printf("%s\n", lines[i]);
    }
}

int numcmp(char *s1, char *s2){
    double v1, v2;
    v1 = atof1(s1);
    v2 = atof1(s2);
    return ( v1 < v2 ) ? -1 : ( v1 > v2 ) ? 1 : 0;
}

void qsort_lines2(void *lineptr[], int left, int right, int (*comp)(void *, void *) ){
    int last;
    if ( left >= right ) return;

    int middle = (left + right) / 2;
    swap(lineptr, left, middle);
    last = left;

    for (int i = left+1; i <= right; i++ ){
        int res = (*comp)(lineptr[i], lineptr[left]);
        if (res < 0){
            swap(lineptr, ++last, i);
        }
    }

    swap(lineptr, left, last);
    qsort_lines2(lineptr, left, last-1, comp);
    qsort_lines2(lineptr, last+1, right, comp);
}

// сортировка в порядке возрастания; 1-я версия - не рабочая
void qsort_lines1(char *lineptr[], int left, int right ){
    int i, last;

    if ( left >= right ){ // ничего не делать если в массиве меньше двух эл.
        return;
    }
    int middle = (left+right) / 2;
    swap( lineptr, left, middle );
    last = left;
    for (i = left+1; i <= right; i++){
        if ( strcmp2(lineptr[i], lineptr[left]) < 0 ){
            swap(lineptr, ++last, i);
        }
    }
    swap(lineptr, left, last);
    qsort_lines1(lineptr, left, last-1);
    qsort_lines1(lineptr, last+1, right);
}

void swap(void *lines[], int i, int j){
    void *tmp;
    tmp = lines[i];
    lines[i] = lines[j];
    lines[j] = tmp;
}

// 5.14. Доработайте программу так, чтобы она обрабатывала ключ -r, требующий сортировки в обратном порядке (по убыванию). Сделайте так, чтобы ключ -r работал и при наличии ключа -n
// 5.15. Добавьте в программу ключ -f, по которому верхний и нижний регистр при сортировке не различался.
// 5.16. Добавьте в программу ключ -d (от directory order - каталожного типа), при наличии которого сравнение должно выполняться только по буквам, цифрам и пробелам.
// 5.17. Добавьте в прогрмму возможность обработки полей, т.е. выполнение сортировки по полям внутри строк, причем каждое поле должно сортироваться с независимым набором параметров.














