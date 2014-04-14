#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int* vyskyty(char* texty[], int pocet, char* hledany);

int main(){
	int *v,i;
	char*zdroj[10],h[]="nkazv";
	zdroj[0]="Napiste";
	zdroj[1]="funkci";
	zdroj[2]="ktera";
	zdroj[3]="vrati";
	zdroj[4]="pocet";
	zdroj[5]="vyskytu";
	zdroj[6]="znaku";
	zdroj[7]="v";
	zdroj[8]="poli";
	zdroj[9]="hledany.";
	v=vyskyty(zdroj,10,h);
	for(i=0;i<(int)strlen(h);i++)
		printf("Znak %c se v poli textovych retezcu vyskytuje %d.\n",h[i],v[i]);
	return 0;
}

int* vyskyty(char* texty[], int pocet, char* hledany){
	int *pocty;
	int i,j,k;
	int size = strlen(hledany);
	pocty = (int *)malloc(pocet*sizeof(int));
	for(i=0; i<pocet; i++){
		pocty[i] = 0;
	}
	for(i=0; i<pocet; i++){
		j=0;
		for(j=0; j<(int)strlen(texty[i]); j++){
			for(k=0; k<size; k++){
				if(hledany[k] == texty[i][j]){
					pocty[k]++;
				}
			}
		}
	}
	return pocty;
}