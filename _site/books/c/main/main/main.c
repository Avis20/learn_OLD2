#include <stdio.h>
#include <stdlib.h>
#include "chapter1.h"
#include "chapter5.h"
#include "mygrep.h"
#include "myqsort.h"
#include "chapter6.h"
#include "bintree.h"
#include "other.h"

// Динамический массив
int main(int argc, char const *argv[]){
    CArray arr = {0,0,0};
    
    // set
    CArray_add(&arr, 10.1);
    CArray_add(&arr, 10.2);
    CArray_add(&arr, 10.3);

    // get
    printf("%f; %f; %f\n",
        CArray_get(&arr, 0),
        CArray_get(&arr, 1),
        CArray_get(&arr, 2)
    );
    return 0;
}

/* Бинарный поиск
int main(){

    int arr[] = {3,7,10,32,64,120,210};
    int arr_size = (int)(sizeof(arr)/sizeof(arr[0]));
    printf("%d", binarySearch(arr, arr_size, 64));

    return 0;
}
*/

/*
int main(){

    int arr[] = {2,3,4,5,6,3,34,6,7,2};
    int arr_size = (int)(sizeof(arr)/sizeof(arr[0]));
    printf("%d", maxElement(arr, arr_size));

    return 0;
}
*/

/* fibonachi
int main(){
    int n = 50;
    printf("%d; %d\n", fib1(n), fib2(n));
    return 0;
}
*/

/*
int main(){
    print_in_new_line();
}
*/

/* union
union myunion {
    int integer;
    float flot;
} uvar;

int main(){
    uvar.flot = 10.1;
    uvar.integer = 10;
    union myunion *ptr = &uvar;
    printf("%d; %f\n", ptr->integer, ptr->flot);
}
*/

/* Поиск по таблице
int main(){
    install("test", "alarm");
    install("test2", "alarm");
    install("test", "2");
    return 0;
}
*/

/* Программа подсчета частоты слов
int main(){

    struct tnode *root;
    char word[MAXWORD];

    root = NULL;
    while ( getword( word, MAXWORD ) != EOF ){
        if ( isalpha(word[0]) ){
//            printf("%s", word);
            root = add_tree(root, word);
        }
    }
    print_tree(root);
    return 0;
}
*/

/* Подсчет ключемых слов языка C; см.
int main(){
    printf("%d\n", NKEYS);
    count_c_words();
    return 0;
}
*/
/* Указатели на структуры
int main (){

    p->len = 6;
    p->str = "hello";

    char c;
    while ( ( c = *p->str++ ) != '\0'){
        printf("%c-", c );
    }

    return 0;
}
*/

/* Пример структур
int main (){

    struct rect screen;
    struct point middle;

    screen.pt1 = make_point(100, 200);
    screen.pt2 = make_point(20, 10);
    screen = canon_rect(screen);
    struct point sum = add_point(screen.pt1, screen.pt2);
    middle = make_point( sum.x / 2, sum.y / 2 );

    print_point(middle);
    printf("%s\n", is_in_rect(screen, middle) ? "True" : "False");

    return 0;
}
*/

/* Сортировка строк v2
int main(int argc, char *argv[]){

    int n;
    int numeric = 0; // флаг что числовая сортировка

    if (argc > 1 && strcmp(argv[1] == "-n") == 0){
        numeric = 1;
    }

    if ((n = read_lines(lineptr, MAXLINES)) >= 0 ){
        void *subname = ( int (*)(void *, void *) ) (numeric ? numcmp : strcmp2);
        qsort_lines2((void **)lineptr , 0, n-1, subname);
        write_lines(lineptr, n);
    }

    return 0;
}
*/

/* mygrep - вывод строк, содержащий образец из последнего аргумента
int main (int argc, char *argv[]){

    if (0){ // debug

        int myargc = 1;
        char *myargv[] = {
            "program name",
//            "-n",
//            "hello,",
//            "world"
        };

        mygrep(myargc, myargv);

    } else {
        mygrep(argc, argv);
    }

    return 0;
}
*/

/* аналог echo; 2-я версия
int main(int argc, char *argv[]){

    if (1){ // debug

        int myargc = 3;
        char *myargv[] = {
            "program name", "hello,", "world"
        };

        for (int i = 1; i < myargc; i++){
            printf("%s%s", myargv[i], (i < myargc-1) ? " " : "" );
        }

    } else {

        while ( --argc > 0 ){
            printf("%s%s", *++argv, ( argc > 1 ) ? " " : "");
        }

    }
    printf("\n");
    return 0;
}
*/

/* аналог echo 1-я версия
int main(int argc, char *argv[]){

    for (int i = 1; i < argc; i++){
        printf("%s%s", argv[i], (i < argc-1) ? " " : "" );
    }
    printf("\n");

    return 0;
}
*/

/* вывод названия пути запуска
int main(int argc, char *argv[]){
    printf("%s; ", argv[0]);
    return 0;
}
*/

/* месяц по номеру
int main(){

    printf("%s\n", month_name(12));

    return 0;
}
*/

/* вычисление дат: пример многомерного массива
int main(){

    int year = 2019, month = 5, day = 1;
    int count_days = day_of_year(year, month, day);
    printf("%d\n", count_days);

    int res_month, res_day;
    month_day(1988, 61, &res_month, &res_day);
    printf("month = %d; day = %d", res_month, res_day);

    return 0;
}
*/

/* Сортировка строк
int main(){

    int count_lines;

    if ((count_lines = read_lines(lineptr, MAXLINES)) >= 0 ){
        // НЕ РАБОТАЕТ СОРТИРОВКА: ошибка сегментации
//        qsort_lines(lines, 0, count_lines-1);
        write_lines(lineptr, count_lines);
    }

    return 0;
}
*/

/*
int main(){
    count_chars();
    return 0;
}
*/

/*
int main(){
    print_eof();
    return 0;
}
*/

/*
int main(){
    get_char();
}
*/

/* 1.10
int main(){
    replace_symbols();
}
*/

/* 1.9
int main(){
    replace_spaces();
}
*/

/* 1.5
int main(){
    fat4();
}
*/

/* 1.4
int main(){
    cel2fat();
}
*/

/* 1.3
int main(){
    fat2();
}
*/

/* Первая программа hello world
int main(){
    hello_world();
}
*/
