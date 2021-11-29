/*
    Пример констант
*/

#include <stdio.h>
#define VAR 1       // константа целого типа
#define CHAR 'a'    // константа символьного типа

// Справочники
enum months {
    JAN = 1,
    FEB
};

int main(){

    printf("%d; %c; %d\n", VAR, CHAR, JAN);

    return 0;
}
