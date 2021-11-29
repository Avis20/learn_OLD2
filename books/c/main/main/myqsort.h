
#ifndef myqsort
#define myqsort

#include "chapter1.h"
#include "chapter5.h"

#define MAXLINES 100

char *lineptr[MAXLINES];

int read_lines(char *lineptr[], int nlines );
int write_lines( char *lineptr[], int nlines );
void qsort_lines1(char *lineptr[], int left, int right );
void qsort_lines2(void *lineptr[], int left, int right, int (*comp)(void *, void *) );
int numcmp(char *, char *);

#endif
