#include "chapter4.h"

// Преобразует строку в число типа double
double atof1(char s[]){
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
