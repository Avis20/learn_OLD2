#include <stdio.h>
#include <stdlib.h>
#include "calc.h"
#define MAXOP 100       // макс размер операнда
#define DEBUG 0


int main(){
    int type;
    double op2;
    char str[MAXOP];

    while ( ( type = getop(str) ) != EOF ){
        switch (type){
            case IS_NUMBER:
                push(atof(str));
                break;
            case '+':
                push( pop() + pop() );
                break;
            case '*':
                push( pop() * pop() );
                break;
            case '-':
                op2 = pop();
                push( pop() - op2 );
                break;
            case '/':
                op2 = pop();
                if ( op2 != 0.0 ){
                    push( pop() / op2 );
                } else {
                    printf("error: zero divisor\n");
                }
                break;
            case '\n':
                printf("\t%.8g\n", gettop());
                break;
            default:
                printf("error: unknown command %s\n", str);
                break;
        }
    }

    return 0;
}
