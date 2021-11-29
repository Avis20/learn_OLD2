#include <stdio.h>
#define N 1000

int get_line(char [], int);
void copy(char [], char []);

int main(){

    int len, max = 0;
    char line[N], longest[N];

    while ((len = get_line(line, N)) > 0 ){
        if ( len > max ){
            max = len;
            copy(line, longest);
        }
    }

    if ( max > 0 )
        printf("%s", longest);
    return 0;
}

int get_line(char str[], int lim){
    int c, i;

    for (i = 0; i <= lim-1 && (c = getchar()) != EOF && c != '\n'; i++ )
        str[i] = c;

    if ( c == '\n' )
        str[i++] = c;

    str[i] = '\0';
    return i;
}

void copy(char from[], char to[]){
    int i = 0;
    while ((to[i] = from[i]) != '\0') i++;
}