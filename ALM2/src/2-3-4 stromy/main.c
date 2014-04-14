#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* 	implementace 2-3-4 stromu
	autor: Kamil Hanus */

typedef struct node{
	int order;
	int item[3];
	struct node *child[4];
} node;

node *CreateNode(int item, node *left, node *right){
	node *new = (node*)malloc(sizeof(node));

	(*new).order = 2;
	(*new).item[0] = item;
	(*new).child[0] = left;
	(*new).child[1] = right;
	(*new).child[2] = NULL;
	(*new).child[3] = NULL;

	return new;

}

node *SplitNode(node *u, node *v){
	int j;
	if(v==NULL){
		(*u).child[0] = CreateNode((*u).item[0], (*u).child[0], (*u).child[1]);
		(*u).child[1] = CreateNode((*u).item[2], (*u).child[2], (*u).child[3]);
		(*u).order = 2;
		(*u).item[0] = (*u).item[1];
		return u;
	}
	j = (*v).order-1;
	while(j>0 && (*u).item[1] < (*v).item[j-1]){
		(*v).item[j] = (*v).item[j-1];
		(*v).child[j+1] = (*v).child[j];
		j--;
	}
	(*v).item[j] = (*u).item[1];
	(*v).child[j] = u;
	(*u).order = 2;
	(*v).child[j+1] = CreateNode((*u).item[2], (*u).child[2], (*u).child[3]);
	(*v).order++;
	return v;
}

int Insert(node **tree, int value){
	int i,j;
	node *tmp = *tree;
	node *parent = NULL;

	if(*tree == NULL){
		*tree = CreateNode(value, NULL, NULL);
		return 1;
	}
	while(1){
		if((*tmp).order == 4){
			tmp = SplitNode(tmp, parent);
		}

		i = 0;

		while((i<(*tmp).order-1) && (value >= (*tmp).item[i])){
			if(value == (*tmp).item[i]) return 0;
			i++;
		}

		if((*tmp).child[i] != NULL){
			parent = tmp;
			tmp = (*tmp).child[i];
		}
		else{
			j = (*tmp).order - 1;
			while(j>i){
				(*tmp).item[j] = (*tmp).item[j-1];
				j--;
			}
			(*tmp).item[i] = value;
			(*tmp).order++;
			return 1;
		}
	}
}

void InorderTraversal(node *tree){
	int i;
	if(tree == NULL){
		return;
	}
	InorderTraversal((*tree).child[0]);
	i=0;
	do{
		printf("%d\n", (*tree).item[i]);
		i++;
		InorderTraversal((*tree).child[i]);
	}while(i < (*tree).order-1);
}

int main(){
	int i;
    node *strom = NULL;
    srand(time(0));
    
    for (i = 0; i < 10; i++)
        Insert(&strom, rand());
    
    InorderTraversal(strom);
    
    return 0;
}
