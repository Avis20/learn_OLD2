#ifndef BINTREE_H
#define BINTREE_H

#define MAXWORD 100

typedef struct tnode {
    char *word;
    int count;
    struct tnode *left;
    struct tnode *right;
} Treenode;

Treenode *add_tree(Treenode *, char *);
void print_tree(Treenode *);
Treenode *talloc();
char *strdup2(char *);

#endif // BINTREE_H

