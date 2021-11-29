#include <stdio.h>
#include <stdarg.h>

// lite версия функции printf, со списком аргументов переменной длины
void minprintf(char *format, ...);

int main(){

    minprintf("%d %f test", 1, 100.1);

    return 0;
}

void minprintf(char *format, ...){
    va_list ap; // указатель на безымянные аргументы
    char *p, *sval;
    int ival;
    double dval;

    va_start(ap, format);   // уст. ap на 1-й аргумент
    for (p = format; *p; p++){
        if ( *p != '%'){
            putchar(*p);
            continue;
        }

        switch (*++p){
            case 'd':
                ival = va_arg(ap, int); // va_arg - на сколько передвинуть ap
                printf("%d", ival);
                break;
            case 'f':
                dval = va_arg(ap, double);
                printf("%f", dval);
                break;
            case 's':
                for ( sval = va_arg(ap, char *); *sval; sval++){
                    putchar(*sval);
                }
                break;
            default:
                printf("unsupported");
        }
    }
}