#include <stdio.h>
#define N 1000
#define MAX_LEN 80

int get_line(char [], int);
void copy(char from[], char to[]);

int main(){

    int len, count = 0;
    char line[N], str[N][N];

    while ( ( len = get_line(line, N) ) > 0 ){
        if ( len >= MAX_LEN ){
            copy( line, str[count++] );
        }
    }

    for (int i = 0; i < count; ++i){
        printf("%s", str[i]);
    }

    return 0;
}

int get_line(char str[], int lim){

    int c, i;
    for (i = 0; i <= lim-1 && (c = getchar()) != EOF && c != '\n'; i++ ) str[i] = c;

    if ( c == '\n' ) str[i++] = c;
    str[i] = '\0';
    return i;
}

void copy(char from[], char to[]){
    int i = 0;
    while( ( to[i] = from[i] ) != '0' ) i++;
}
