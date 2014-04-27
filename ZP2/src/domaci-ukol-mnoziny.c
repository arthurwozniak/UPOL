#include <stdio.h>
#include <stdlib.h>

typedef struct mnozina{
	int hodnota;
	struct mnozina *dalsi;
} mnozina;

int vloz_prvek(mnozina **, int);
int odeber_prvek(mnozina **,int i);
mnozina *prunik(mnozina *, mnozina *);
mnozina *sjednoceni(mnozina *, mnozina *);
mnozina *rozdil(mnozina *, mnozina *);
mnozina *novy_uzel(int);
void vypis(mnozina *);

int main()
{
	mnozina *a = NULL;
	mnozina *b = NULL;
	/* filling set A */
	vloz_prvek(&a, 5);
	vloz_prvek(&a, 12);
	vloz_prvek(&a, 8);
	vloz_prvek(&a, 7);
	vloz_prvek(&a, 14);
	vloz_prvek(&a, 20);
	/* filling set B */
	vloz_prvek(&b, 5);
	vloz_prvek(&b, 14);
	vloz_prvek(&b, 9);
	vloz_prvek(&b, 7);
	vloz_prvek(&b, 19);

	printf("Mnozina A:\n");
	vypis(a);
	printf("\n");

	printf("Mnozina A po odebrani prvku 20:\n");
	odeber_prvek(&a, 20);
	vypis(a);
	printf("\n");

	printf("Pokus o odebrani prvku 4:\n");
	if(odeber_prvek(&a, 4))printf("Prvek odebran\n");
	else printf("Prvek neni v mnozine\n");

	printf("Mnozina B:\n");
	vypis(b);
	printf("\n");

	printf("Sjednoceni mnozin A a B:\n");
	vypis(sjednoceni(a, b));
	printf("\n");

	printf("Prunik mnozin A a B:\n");
	vypis(prunik(a, b));
	printf("\n");

	printf("Rozdil mnozin A a B:\n");
	vypis(rozdil(a, b));
	printf("\n");

	printf("A prunik B sjednoceno B rozdil A:\n");
	vypis(rozdil(sjednoceni(prunik(a, b), b), a));
	return 0;
}

mnozina *novy_uzel(int prvek){
	mnozina *new = (mnozina*)malloc(sizeof(mnozina));
	new->hodnota = prvek;
	new->dalsi = NULL;
	return new;
}

int vloz_prvek(mnozina **M, int i){
	mnozina *tmp = *M;
	if (*M==NULL){
		*M = novy_uzel(i);
		return 1;
	}
	while(tmp->dalsi!=NULL){
		if(tmp->hodnota==i)return 0;
		tmp = tmp->dalsi;
	}
	if(tmp->hodnota==i)return 0;
	tmp->dalsi = novy_uzel(i);
	return 1;
}

int odeber_prvek(mnozina **M, int i){
	mnozina *tmp = *M;
	mnozina *prev = NULL;

	if (*M==NULL){
		return 0;
	}

	while(tmp->hodnota!=i){
		prev = tmp;
		tmp = tmp->dalsi;
		if(tmp==NULL)break;
	}
	if(tmp && (tmp->hodnota==i)){
		if(prev)prev->dalsi = tmp->dalsi;
		else *M = tmp->dalsi;
		free(tmp);
		return 1;
	}
	return 0;
}

mnozina *sjednoceni(mnozina *a, mnozina *b){
	mnozina *c = NULL;
	mnozina *tmp1, *tmp2;

	if((a == b) && (a == NULL))
		return NULL;

	tmp1 = a;
	tmp2 = b;

	while(1){
		if(tmp1 == NULL)break;
		vloz_prvek(&c, tmp1->hodnota);
		tmp1 = tmp1->dalsi;
	}

	while(1){
		if(tmp2 == NULL)break;
		vloz_prvek(&c, tmp2->hodnota);
		tmp2 = tmp2->dalsi;
	}

	return c;
}

mnozina *prunik(mnozina *a, mnozina *b){
	mnozina *c = NULL;
	mnozina *tmp1, *tmp2;
	int both;
	if((a == NULL) || (b == NULL))return NULL;
	tmp1 = a;

	while(1){
		both = 0;
		if(tmp1==NULL)break;
		tmp2 = b;
		while(1){
			if(tmp2==NULL)break;
			if(tmp2->hodnota == tmp1->hodnota){
				both = 1;
				break;
			}
			tmp2 = tmp2->dalsi;
		}
		if(both)vloz_prvek(&c, tmp1->hodnota);
		tmp1 = tmp1->dalsi;
	}
	return c;
}

mnozina *rozdil(mnozina *a, mnozina *b){
	mnozina *c = NULL;
	mnozina *tmp1, *tmp2;
	int both;
	if(a == NULL)return NULL;

	tmp1 = a;

	while(1){
		both = 0;
		if(tmp1==NULL)break;
		tmp2 = b;
		while(1){
			if(tmp2==NULL)break;
			if(tmp2->hodnota == tmp1->hodnota){
				both = 1;
				break;
			}
			tmp2 = tmp2->dalsi;
		}
		if(both==0)vloz_prvek(&c, tmp1->hodnota);
		tmp1 = tmp1->dalsi;
	}
	return c;
}

void vypis(mnozina *m){
	mnozina *tmp = m;
	if(m == NULL){
		printf("empty");
		return;
	}
	while(1){
		if(tmp==NULL)break;
		printf("%d, ", tmp->hodnota);
		tmp = tmp->dalsi;
	}
}