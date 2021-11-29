#include <stdio.h>
#include <stdlib.h>
#include "calc.h"

#define MAXVAL 10      // макс размер стека

int sp = 0; // stack pointer
double stack[MAXVAL];

void push( double op ){
    if ( sp < MAXVAL ){
        stack[sp++] = op;
    } else {
        printf("push: stack full, can't push %g\n", op);
    }
}

double pop(){
    if ( sp > 0 ){
        return stack[--sp];
    } else {
        printf("pop: stack is empty\n");
        return 0.0;
    }
}

double gettop(){
    if ( sp > 0 ){
        return stack[sp-1];
    } else {
        printf("pop: stack is empty\n");
        return 0.0;
    }
}
