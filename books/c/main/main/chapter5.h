#ifndef CHAPTER5
#define CHAPTER5

void strcpy1( char *s, char *t );
void strcpy2( char *s, char *t );
void strcpy3( char *s, char *t );

int strcmp1(char *s, char *t);
int strcmp2(char *s, char *t);

void strcat1(char *s, char *t);
void strcat2(char *s, char *t);

int strend(char *s, char *t);

static char daytab[2][13] = {
    {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
    {0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
};

int day_of_year( int year, int month, int day );
void month_day(int year, int year_of_day, int *pmonth, int *pday);

static char *month_names[] = {
    "Неправильный месяц",
    "январь", "февраль", "март",
    "апрель", "май", "июнь",
    "июль", "август", "сентябрь",
    "октябрь", "ноябрь", "декабрь"
};

char *month_name(int n);

#endif
