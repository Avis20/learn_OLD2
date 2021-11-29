#include <stdio.h>
#include <stdlib.h>
#include "mygrep.h"

//################################################
//
int mygrep(int argc, char *argv[]){

    char line[MAXLINE];
    long line_number = 0;
    int key, except = 0, number = 0, found = 0;

    while ( --argc > 0 && (*++argv)[0] == '-' ){
        while (key = *++argv[0]){
            switch (key){
                case 'x':
                    except = 1;
                    break;
                case 'n':
                    number = 1;
                    break;
                default:
                printf("mygrep: illegal options %c\n", key);
                argc = 0;
                found -1;
                break;
            }
        }
    }

    if (argc != 1){
        printf("usage: main -x -n pattern\n");
    } else {
        while ( get_line(line, MAXLINE) > 0 ){
            line_number++;
            if ( ( strstr(line, *argv) != NULL ) != except ) {
                if (number) printf("%ld:", line_number);
                printf("%s", line);
                found++;
            }
        }
    }
    return found;
}

// 5.10 Напишите программу expr, которая бы вычисляла выражение в обратной польской записи из командной строки; каждый операнд и знак операции должен быть отдельным аргиметом. Например, след командная строка задает вычисление выражинея 2*(3+4): expr 2 3 4 + *

// 5.11
// 5.12
// 5.13
//
