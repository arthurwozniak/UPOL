#include <stdlib.h>
#include <string.h>
#include <stdio.h>

typedef struct{
    int cislo;
    char *nazev;
    char *(*f)(char* veta);
} fce;

char *mala(char *t);
char *velka(char *t);
char *pozpatku(char *t);

/* workaround pro fflush */
void flush(FILE *in){
    int c;
    do{
        c = getc(in);
    }
    while (c != '\n' && c != EOF);
}

int main(){
    char vstup[255], *vystup;
    int cislo, i;
    fce seznam[3];
    seznam[0].cislo = 1;
    seznam[0].nazev = "Funkce vrati pouze velka pismena";
    seznam[0].f = velka;
    seznam[1].cislo = 2;
    seznam[1].nazev = "Funkce vrati pouze mala pismena";
    seznam[1].f = mala;
    seznam[2].cislo = 3;
    seznam[2].nazev = "Funkce vrati zadany text pozpatku";
    seznam[2].f = pozpatku;
    printf("Vyber funkci(1-3), kterou chces pouzit:\n");

    for (i = 0; i < 3; i++)
        printf("%d - %s\n", seznam[i].cislo, seznam[i].nazev);
    scanf("%d", &cislo);
    if ((cislo > 0) && (cislo < 4)){
        printf("Zadej vstupni retezec:\n");
        flush(stdin);
        gets(vstup);
        printf("%s\n", vstup);
        vystup = seznam[cislo - 1].f(vstup);
        printf("\n%s\n", vystup);
    }
    return 0;
}

char *velka(char *t){
    char *vysledek = NULL;
    int i = 0, j = 0;
    while(t[i] != '\0'){
        if(t[i]>64 && t[i]<91){
            if(vysledek == NULL){
                vysledek = (char*) malloc(sizeof(char));
                vysledek[j] = t[i];
            }
            else{
                vysledek = (char*)realloc(vysledek, sizeof(vysledek)/sizeof(char)+1);
                vysledek[j] = t[i];
            }
            j++;
        }
        i++;
    }
    vysledek[j] = '\0';
    return vysledek;
}

char *mala(char *t){
    char *vysledek = NULL;
    int i = 0, j = 0;
    while(t[i] != '\0'){
        if(t[i]>96 && t[i]<123){
            if(vysledek == NULL){
                vysledek = (char*) malloc(sizeof(char));
                vysledek[j] = t[i];
            }
            else{
                vysledek = (char*)realloc(vysledek, sizeof(vysledek)/sizeof(char)+1);
                vysledek[j] = t[i];
            }
            j++;
        }
        i++;
    }
    vysledek[j] = '\0';
    return vysledek;
}


char *pozpatku(char *t){
    int size = 0, i = 0;
    char *vysledek;
    while(t[i] != '\0'){
        size++;
        i++;
    }
    i=0;
    vysledek = (char*)malloc(size*sizeof(char));
    while(i < size){
        vysledek[i] = t[size-i-1];
        i++;
    }
    vysledek[i] = '\0';
    return vysledek;
}

