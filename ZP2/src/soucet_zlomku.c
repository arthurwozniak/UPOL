#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define filename "./fractions"
#define length 100
#define num 5

typedef struct zlomek{
	int numerator;
	int denominator;
} zlomek;

int numerator(){
	int i = rand()%10;
	if(i%2==0)return 1*rand()%length;
	return -1*rand()%length;
}

int divider(){
	int i = rand()%length;
	while(i==0){
		i = rand()%length;
	}
	return i;
}

void createRandomIntFile(){
	int i;
	FILE *newfile;
	newfile = fopen(filename, "wb");
	for(i=0; i<num; i++){
		fprintf(newfile, "%i %i\n", numerator(), divider());
	}
	fclose(newfile);
}

void printFractions(zlomek **fractions){
	int k=0;
	while(fractions[k]!=NULL){
		printf("%d. zlomek: %d/%d\n", k+1, fractions[k]->numerator, fractions[k]->denominator);
		k++;
	}
}

zlomek *createFraction(int a, int b){
	zlomek *frac = NULL;
	frac = (zlomek *) malloc(sizeof(zlomek));
	frac->denominator = b;
	frac->numerator = a;
	return frac;
}

zlomek **readFractions(){
	zlomek **fractions = NULL;
	int i,j,k=0;
	FILE *inputFile;
	inputFile = fopen(filename, "rb");
	while(fscanf(inputFile, "%d %d", &i, &j) != EOF){
		if(fractions == NULL){
			fractions = (zlomek **) malloc(sizeof(zlomek *));
		}
		else{
			fractions = (zlomek **) realloc(fractions, (1 + k)*sizeof(zlomek *));
		}
		fractions[k] = createFraction(i, j);
		k++;
	}
	fractions = (zlomek **) realloc(fractions, (1 + k)*sizeof(zlomek *));
	fractions[k] = NULL;
	return fractions;
}

int eukleid(int a, int b){
	int c;
	while(b != 0){
		c  = a % b;
		a = b;
		b = c;
	}
	return a;
}

zlomek *makeSum(zlomek **fractions){
	int k = 0;
	int divider = 0;
	zlomek *sum;
	sum = (zlomek *) malloc(sizeof(zlomek));
	sum->numerator = 0;
	sum->denominator = 1;
	while(fractions[k]!=NULL){
		if(sum->denominator != fractions[k]->denominator){
			sum->numerator = (sum->numerator*fractions[k]->denominator) + (fractions[k]->numerator*sum->denominator);
			sum->denominator = sum->denominator*fractions[k]->denominator;
		}
		else{
			sum->numerator = sum->numerator + fractions[k]->numerator;
		}
		divider = eukleid(sum->denominator, sum->numerator);
		sum->denominator = sum->denominator/divider;
		sum->numerator = sum->numerator/divider;
		k++;
	}
	divider = eukleid(sum->denominator, sum->numerator);
	sum->denominator = sum->denominator/divider;
	sum->numerator = sum->numerator/divider;
	if(sum->denominator<0){
		sum->denominator *= -1;
		sum->numerator *= -1;
	}
	return sum;
}

int main()
{
	zlomek **fractions;
	zlomek *sum;
	srand(time(0));
	createRandomIntFile();
	fractions  = readFractions();
	printFractions(fractions);
	sum = makeSum(fractions);
	printf("\nSoucet zlomku je: %d/%d\n", sum->numerator, sum->denominator);
	return 0;
}