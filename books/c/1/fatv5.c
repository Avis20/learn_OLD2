#include <stdio.h>
#define LOWER 0
#define UPPER 300
#define STEP 20

float celsius(float);

// Вывод таблицы температур по Фаренгейту и Цельсию (v5)
int main (){
    float fahr;

    for ( fahr = LOWER; fahr <= UPPER; fahr += STEP )
        printf("%3.0f %6.2f\n", fahr, celsius(fahr));

    return 0;
}

float celsius(float fahr){
    return (5.0/9.0)*(fahr-32);
}