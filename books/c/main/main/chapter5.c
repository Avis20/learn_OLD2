#include <stdlib.h>
#include <stdio.h>
#include "chapter5.h"
#include "chapter1.h"

#define ALLOCSIZE 1000

static char alloc_buf[ALLOCSIZE];
static char *alloc_cp = alloc_buf;

// копирует сторку s в t, 1-я версия с индексированием массива
void strcpy1( char *s, char *t ){
    for (int i = 0; (s[i] = t[i]) != '\0'; i++);
}

// копирует сторку s в t, 2-я версия с указателями
void strcpy2( char *s, char *t ){
    for (; (*s = *t) != '\0'; s++, t++);
}

// копирует сторку s в t, 3-я версия с указателями
void strcpy3( char *s, char *t ){
    while (*s++ = *t++);
}

// Сравнение строк. Возвращает отрицательное число если s < t, 0 при s = t, положительное при s > t; версия 1
int strcmp1(char *s, char *t){
    int i;
    for (i = 0; s[i] == t[i]; i++ ){
        if ( s[i] == '\0'){
            return 0;
        }
    }

    return s[i] - t[i];
}

// Сравнение строк. Возвращает отрицательное число если s < t, 0 при s = t, положительное при s > t; версия 2
int strcmp2(char *s, char *t){
    for (; *s == *t; s++, t++){
        if ( *s == '\0' ){
            return 0;
        }
    }

    return *s - *t;
}

// присоединяет строку t к концу s; версия 1
void strcat1(char *s, char *t){
    int i, j;
    i = j = 0;

    while (s[i] != '\0'){
        i++;
    }

    while ( ( s[i++] = t[j++] ) != '\0' );
}

// 5.3; присоединяет строку t к концу s; версия 2
void strcat2(char *s, char *t){
    while (*(++s) != '\0');
    while (*s++ = *t++);
}

// 5.4; возвращает 1, если строка t присутствует в конце строки s, 0 в противном случае
int strend(char *s, char *t){

}

char *alloc(int n){
    if ( alloc_buf + ALLOCSIZE - alloc_cp >= n ){
        alloc_cp += n;
        return alloc_cp - n;
    } else {
        return 0;
    }
}

void afree( char *p ){
    if ( p >= alloc_buf && p < alloc_buf + ALLOCSIZE ){
        alloc_cp = p;
    }
}

//################################################
// вычисление дня года по месяцу и дню
int day_of_year( int year, int month, int day ){
    int i, leap;

    leap = year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
    for ( i = 1; i < month; i++ ){
        day += daytab[leap][i];
    }
    return day;
}

// вычисление месяца и даты по дню в году
void month_day(int year, int year_of_day, int *pmonth, int *pday){
    int i, leap;

    leap = year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
    for (i = 1; year_of_day > daytab[leap][i]; i++){
        year_of_day -= daytab[leap][i];
    }
    *pmonth = i;
    *pday = year_of_day;
}

char *month_name(int n){
    return ( n < 1 || n > 12 ) ? month_names[0] : month_names[n];
}







