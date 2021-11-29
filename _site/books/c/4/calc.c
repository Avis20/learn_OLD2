#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#define MAXOP 100       // макс размер операнда
#define BUFSIZE 100     // макс размер буфера
#define MAXVAL 10      // макс размер стека
#define IS_NUMBER '0'   // флаг что число
#define DEBUG 0

char buf[BUFSIZE];
int bufp = 0;

int sp = 0; // stack pointer
double stack[MAXVAL];

int getop(char s[]);
char getch();
void ungetch( char c );
void push( double op );
double pop();
double gettop(); // Возвращает вершину стека

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
        if ( type != '\n' && DEBUG){
            printf("sp = %d; in stack\n", sp);
            for ( int i = 0; i < MAXVAL; i++ ) printf("%g ", stack[i]);
            printf("\n");
        }
    }

    return 0;
}

// Извлекает операнд или знак операции
int getop(char s[]){
    int i, c;
    i = 0;

    while ( ( s[0] = c = getch() ) == ' ' || c == '\t' );

    s[1] = '\0';

    if ( !isdigit(c) && c != '.' ) return c; // не число

    if ( isdigit(c) ){ // Накопление целой части
        while ( isdigit(s[++i] = c = getch()) );
    };

    if ( c == '.' ){
        while ( isdigit(s[++i] = c = getch() ));
    }

    s[i] = '\0';

    if (c != EOF) ungetch(c);
    return IS_NUMBER;
}

// Ввод символа
char getch(){
    return ( bufp > 0 ) ? buf[--bufp] : getchar();
}

// Возвращение символа
void ungetch( char c ){
    if ( bufp >= BUFSIZE ){
        printf("ungetch: too many characters\n");
    } else {
        buf[bufp++] = c;
    }
}

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
