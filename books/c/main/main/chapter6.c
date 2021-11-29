#include <stdio.h>
#include <ctype.h>
#include <malloc.h>
#include <string.h>

#include "chapter6.h"

#define min(a, b) ( (a) < (b) ? (a) : (b) )
#define max(a, b) ( (a) > (b) ? (a) : (b) )
#define MAXWORD 100
#define HASHSIZE 101

// структура таблицы
struct nlist {
    struct nlist *next;
    char *name;
    char *defn;
};

static struct nlist *hashtab[HASHSIZE]; // таблица указателей

// Массив структур
struct key keytable[] = {
    "auto", 0,
    "break", 0,
    "case", 0,
    "char", 0
};
int NKEYS = sizeof keytable / sizeof keytable[0];

// Создает структуру point из x и y
struct point make_point(int x, int y){
    struct point tmp;

    tmp.x = x;
    tmp.y = y;
    return tmp;
}

// Сложение координат двух точек
struct point add_point( struct point pt1, struct point pt2 ){
    pt1.x += pt2.x;
    pt1.y += pt2.y;
    return pt1;
}

// вывод точки
void print_point(struct point pt){
    printf("x = %d; y = %d\n", pt.x, pt.y);
}

// Находиться ли точка внутри прямоугольника
int is_in_rect (struct rect r, struct point p){
    return p.x >= r.pt1.x && p.x < r.pt2.x
        && p.y >= r.pt1.y && p.y < r.pt2.y;
}

// Канонический прямоугольник
struct rect canon_rect(struct rect r){
    struct rect tmp;

    tmp.pt1.x = min( r.pt1.x, r.pt2.x );
    tmp.pt1.y = min( r.pt1.y, r.pt2.x );
    tmp.pt2.x = max( r.pt1.x, r.pt2.x );
    tmp.pt2.y = max( r.pt1.y, r.pt2.y );
    return tmp;
}

void count_c_words(){
    struct key *p;
    char word[MAXWORD];

    while ( getword(word, MAXWORD) != EOF ){
        if ( isalpha(word[0]) ){
            if ( ( p = binsearch(word, keytable, NKEYS) ) != NULL ){
                p->count++;
            }
        }
    }

    for ( p = keytable; p < keytable + NKEYS; p++ ){
        if ( p->count > 0 ){
            printf("%4d %s\n", p->count, p->word);
        }
    }
}

int getword(char *word, int lim){
    int c;
    char *w = word;

    while ( isspace( c = getchar() ) );

    if ( c != EOF ) *w++ = c;
    if ( !isalpha(c) ){
        *w = '\0';
        return c;
    }

    for (; --lim > 0; w++){
        if ( !isalnum(*w = getchar()) ){
//            ungetc();
            break;
        }
    }

    *w = '\0';
    return word[0];
}

struct key *binsearch( char *word, struct key tab[], int n ){
    int cond;
    struct key *low = &tab[0];
    struct key *high = &tab[n];
    struct key *middle;

    while ( low < high ){
        middle = low + (high - low) / 2;
        if ( ( cond = strcmp(word, middle->word) ) < 0 ){
            high = middle;
        } else if ( cond > 0 ){
             low = middle + 1;
        } else {
            return middle;
        }
    }
    return NULL;
}

// Формирования хеш кода для строки
unsigned hash(char *str){
    unsigned hashval;

    for ( hashval = 0; *str != '\0'; str++ ){
        hashval = *str + 31 * hashval;
    }

    return hashval % HASHSIZE;
}

// поиск эл. str в таблице hashtab
struct nlist *lookup(char *str){
    struct nlist *p;

    for ( p = hashtab[hash(str)]; p != NULL; p = p->next ){
        if ( strcmp(str, p->name) == 0 ){
            return p; // эл. найден
        }
    }
    return NULL; // эл. не найден
}

// помещает key+value в таблицу
struct nlist *install(char *key, char *value){
    struct nlist *p;
    unsigned hashval;

    if ( ( p = lookup(key) ) == NULL ){ // эл. не найден
        p = (struct nlist *) malloc(sizeof(*p));
        if ( p == NULL || ( p->name = strdup(key) ) == NULL ){
            return NULL;
        }

        hashval = hash(key);
        p->next = hashtab[hashval];
        hashtab[hashval] = p;
    } else {
        free( (void(*)) p->defn ); // удаление старого
    }

    if ( ( p->defn = strdup(value) ) == NULL ){
        return NULL;
    }

    return p;
}



















