#include <stdio.h>
#include <ctype.h>
#define MAX_LINE 1000 // макс длина строки

int get_line(char line[], int limit);
double atof(char s[]);

int main(){

    char pattern[] = "hi";

    if (1){ // debug
        char line[] = "      -1000.123223";
        printf("%g\n", atof(line) );
    } else {
        // char line[MAX_LINE];
        // while ( get_line(line, MAX_LINE) > 0 ){
        // }
    }


    return 0;
}

// Преобразует строку в число типа double
double atof(char s[]){
    double res, power;
    int i, sign;

    for ( i = 0; isspace(s[i]); i++ ); // Пропуск пробелов

    sign = ( s[i] == '-' ) ? -1 : 1;
    if ( s[i] == '+' || s[i] == '-' ) i++; // Пропуск знака

    for ( res = 0.0; isdigit( s[i] ); i++ ){
        res = 10.0 * res + ( s[i] - '0' );
    }
    if ( s[i] == '.' ) i++; // Пропуск десятичной точки

    for ( power = 1.0; isdigit(s[i]); i++ ){
        res = 10.0 * res + ( s[i] - '0' );
        power *= 10;
    }

    return sign * res / power;
}

// Считывает строку и возвращает ее длину
int get_line(char str[], int lim){
    int c, i;

    i = 0;
    while ( --lim > 0 && ( c = getchar() ) != EOF && c != '\n' ){
        str[i++] = c;
    }

    if ( c == '\n' ) str[i++] = c;
    str[i] = '\0';

    return i;
}
