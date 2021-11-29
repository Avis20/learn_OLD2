#define IS_NUMBER '0'   // флаг что число

int getop(char s[]);
char getch();
void ungetch( char c );
void push( double op );
double pop();
double gettop(); // Возвращает вершину стека
