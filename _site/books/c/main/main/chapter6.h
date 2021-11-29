#ifndef CHAPTER6
#define CHAPTER6

struct point {
    int x;
    int y;
};

struct rect {
    struct point pt1;
    struct point pt2;
};

struct key {
    char *word;
    int count;
};

extern struct key keytable[];
extern int NKEYS;

struct point make_point(int x, int y);
struct point add_point( struct point pt1, struct point pt2 );
void print_point(struct point pt);
int is_in_rect (struct rect r, struct point p);
struct rect canon_rect(struct rect r);
void count_c_words();

struct key *binsearch( char *, struct key *, int );
int getword(char *word, int lim);


#endif // CHAPTER6_H

