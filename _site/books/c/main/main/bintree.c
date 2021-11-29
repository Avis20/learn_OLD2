#include <stdlib.h>
#include <string.h>
#include "bintree.h"

Treenode *add_tree(Treenode *pnode, char *w){
    int cond;

    if ( pnode == NULL ){
        pnode = talloc();
        pnode->word = strdup2(w);
        pnode->count = 1;
        pnode->left = pnode->right = NULL;
    } else if ( ( cond = strcmp( w, pnode->word ) ) == 0 ){ // Слово уже есть
        pnode->count++;
    } else if ( cond < 0 ){ // Слово меньше - в левом поддереве
        pnode->left = add_tree(pnode->left, w);
    } else { // Слово больше - в правом поддереве
        pnode->right = add_tree(pnode->right, w);
    }

    return pnode;
}

Treenode *talloc(){
    return ( Treenode *) malloc( sizeof(Treenode) );
}

char *strdup2(char *str){
    char *p;

    p = (char *) malloc( strlen(str) + 1 ); // +1 для '\0'
    if ( p != NULL ) strcpy(p, str);
    return p;
}

void print_tree(Treenode *p ){
    if ( p != NULL ){
        print_tree(p->left);
        printf("%4d %s\n", p->count, p->word);
        print_tree(p->right);
    }
}

// 6.2. Напишите программу, которая бы считывала текст программы на C и выводила в алфавитном порядке каждую группу имен переменных, которые совпадают по первым шести символам, но могут отличаться дальше. Не принимайте во внимание слова внутри строк и комментариев. Сделайте так, чтобы число 6 можно было вводить как аргумент программы.

// 6.3. Напишите программу анализа перекрестных ссылок, которая бы выводила список всех слов документа, а для каждого слова - список номеров строк, в которых оно встречается.

// 6.4. Напишите программу, выводящую все различные слова из ее входного потока, отсортированные в порядке убывания частоты употребления. Перед каждым словом выведите его частоту.


























