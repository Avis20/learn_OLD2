/*
Упражнение 1.20. Напишите программу detab, которая бы заменяла символы табуляции во входном потоке соответствующим кол-вом пробелов до следующий границы табуляции
*/

#include <stdio.h>
#define N 100
#define COUNT_TABS 4

int main(){

    char str[N];
    char c;
    int need_tabs = 0;

    while ((c = getchar()) != EOF){

        if ( c == '\t' ){
            if ( !need_tabs ){
                need_tabs = 1;
                for (int i = 0; i < COUNT_TABS; i++){
                    putchar(' ');
                }
            } else {
                need_tabs = 0;
                putchar(c);
            }
        } else {
            putchar(c);
        }
    }

    return 0;
}
