#include <stdlib.h>
#include <stdio.h>
#include "Jmena4.h"

#define prime1 99971
#define prime2 100279
#define size 10

typedef struct hashitem {
	struct hashitem *next;
	struct hashitem *prev;
	char *item;
} hashitem;

int hash(const char *);
void printTable(hashitem **);
char *search(hashitem **, const char *);
void insert(hashitem **, const char *);
void removeItem(hashitem **, const char *);


int main(){
	hashitem **hashtable = (hashitem **) malloc(size*sizeof(hashitem *));
	unsigned int i;
	char *tmp;

	/* vytvoreni prazdne hashovaci tabulky */
	for(i=0; i<size; i++){
		hashtable[i] = NULL;
	}
	
	/* zaplneni tabulky */
	for(i=0; i<Pocet; i++){
		hashtable[i] = NULL;
	}
	for(i=0; i<Pocet; i++){
		insert(hashtable, Jmena[i]);
	}
	printTable(hashtable);

	/* Hledani jmen */
	printf("\nHledani\n");
	for(i=0; i<PocetN; i++){
		tmp = search(hashtable, JmenaN[i]);
		printf("%s - ", JmenaN[i]);
		if(tmp == NULL)printf("nenalezeno\n");
		else printf("%s\n", tmp);
	}

	/* Rušení jmen */
	printf("\nRuseni\n");
	for(i=0; i<PocetZ; i++){
		removeItem(hashtable, JmenaZ[i]);
	}

	/* Hledani zrusenych jmen */
	printf("\nHledani zrusenych\n");
	for(i=0; i<PocetZN; i++){
		tmp = search(hashtable, JmenaZN[i]);
		printf("%s - ", JmenaZN[i]);
		if(tmp == NULL)printf("nenalezeno\n");
		else printf("%s\n", tmp);
	}
	return 0;
}

int hash(const char *item){
	int i = 0;
	while(item[i] != '\0'){
		i++;
	}
	return (prime1*item[0]+prime2*item[1]+item[i-1]+i-1) % size;
}

void printTable(hashitem **table){
	int i;
	hashitem *tmp;
	for(i=0; i < size; i++){
		printf("%d - ", i);
		if(table[i] != NULL){
			tmp = table[i];
			while(tmp != NULL){
				printf("%s, ", tmp->item);
				tmp = tmp->next;
			}
		}
		printf("\n");
	}
}

char *search(hashitem **table, const char *item){
	hashitem *tmp;
	tmp = table[hash(item)];
	while(tmp != NULL){
		if(tmp->item == item)return tmp->item;
		tmp = tmp->next;
	}
	return NULL;
}

void insert(hashitem **table, const char *item){
	hashitem *new;
	int tmp;
	new = (hashitem *)malloc(sizeof(hashitem));
	new->item = (char *)item;
	tmp = hash(item);
	new->next = table[tmp];
	new->prev = NULL;
	if(table[tmp]!=NULL)(table[tmp]->prev)=new;
	table[tmp] = new;
}

void removeItem(hashitem **table, const char *item){
	hashitem *tmp;
	
	if(search(table, item)==NULL) return;
	tmp = table[hash(item)];
	while(tmp->item != item)tmp = tmp->next;
	
	if(tmp->prev==NULL){
		if(tmp->next==NULL)table[hash(item)]=NULL;
		else {
			(tmp->next)->prev=NULL;
			table[hash(item)] = tmp->next;
		}
	}
	else{
		if(tmp->next==NULL)(tmp->prev)->next=NULL;
		else{
			(tmp->prev)->next = tmp->next;
			(tmp->next)->prev = tmp->prev;
		}
	}
	free(tmp);
}
