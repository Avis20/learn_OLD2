#include <stdio.h>
#define MAX_LINE 1000 // макс длина строки

int get_line(char line[], int limit);
int str_index(char source[], char search[]);

int main(){

    char pattern[] = "hi";
    char line[MAX_LINE];
    int count = 1;

    if (1){ // debug
        get_line(line, MAX_LINE);
        printf("source = %s; pattern = %s\n", line, pattern);
        printf("\n\nFound? %d\n", str_index(line, pattern) );
    } else {
        while ( get_line(line, MAX_LINE) > 0 ){
            if ( str_index(line, pattern) >= 0 ){
                printf("str = %d; FOUND IN: '%s'", count++, line);
            }
        }
    }


    return 0;
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

// Возвращает индекс подстроки
int str_index(char s[], char t[]){
    int i, j, k;

    for ( i = 0; s[i] != '\0'; i++ ){
        for (j = i, k = 0; t[k] != '\0' && s[j] == t[k]; j++, k++);
        if ( t[k] == '\0' && k > 0 ) return i;
    }
    return -1;
}