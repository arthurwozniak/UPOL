/* approved */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define random_number(base) (rand()%(base))
#define bins 5003
#define constant 37

/* new type definition */
typedef struct hashtable {
	char **table;
	int empty;
	int lookups;
} hashtable;

/* hashing tables */
hashtable linear_hash;
hashtable quad_hash;
hashtable double_hash;

char *generate_string(){
	int length, tmp;
	char *string;
	length = random_number(10)+1;
	string = (char *)malloc(length+1 * sizeof(char));
	for(tmp=0; tmp<length; tmp++){
		string[tmp] = random_number(('z'-'a')+1)+'a';
	}
	string[tmp] = '\0';
	return string;
}

unsigned long hash_constant(char *string){
	unsigned long hash;
	int pos;

	hash = pos = 0;

	while(string[pos] != '\0'){
		hash = constant * hash + string[pos];
		pos++;
	}
	return hash;
}

int linear_hash_insert(char *string){
	unsigned int pos, origin, tmp_count;

	if(linear_hash.empty == 0)return -1; /* There is no free space, exit */

	origin = pos = hash_constant(string) % bins;
	tmp_count = 0;

	do{
		tmp_count++;
		if(linear_hash.table[pos]==NULL){ /* Empty position was found */
			linear_hash.table[pos] = string; 
			linear_hash.lookups += tmp_count; /* String is inserted, increment counter */
			linear_hash.empty--; /* Decrement counter of available positions */
			return pos;
		}
		if(strcmp(string, linear_hash.table[pos])==0) return pos;
		pos = (pos + 1) % bins;
	} while(pos != origin);

	linear_hash.lookups += tmp_count; /* String cannot be inserted, increment counter */
	return -1;
}

int quad_hash_insert(char *string){
	unsigned int cons, pos, i, tmp_count;

	if(quad_hash.empty == 0) return -1;

	cons = hash_constant(string);
	tmp_count = 0;

	for(i=0; i<bins; i++){
		tmp_count++;
		pos = (cons + i*i) % bins;
		if(quad_hash.table[pos] == NULL){
			quad_hash.table[pos] = string;
			quad_hash.lookups += tmp_count;
			quad_hash.empty--;
			return pos;
		}
		if(strcmp(string, quad_hash.table[pos])==0)return pos;
	}
	quad_hash.lookups += tmp_count;
	return -1;
}

int double_hash_insert(char *string){
	unsigned int cons, pos, h2, tmp_count, i;

	if(double_hash.empty == 0) return -1;

	cons = hash_constant(string);
	pos = cons % bins;
	h2 = 1 + (cons % (bins - 1));
	tmp_count = 0;

	for(i=0; i<bins; i++){
		tmp_count++;
		if(double_hash.table[pos]==NULL){
			double_hash.table[pos] = string;
			double_hash.lookups += tmp_count;
			double_hash.empty--;
			return pos;
		}
		if(strcmp(string, double_hash.table[pos]) == 0) return pos;
		pos = (pos + h2) % bins;
	}
	
	double_hash.lookups += tmp_count;
	return -1;
}

void print_average_attempts(double percentage){
	printf("|\t%3d%%\t|\t%2.2f\t|\t%2.2f\t|\t%2.2f\t|\n", (int)(percentage*100),
			linear_hash.lookups/(percentage*bins),
			quad_hash.lookups/(percentage*bins),
			double_hash.lookups/(percentage*bins));
}

int main()
{
	int i;
	char *tmp;
	double breaks[5] = {0.5, 0.75, 0.9, 0.95, '\0'}; /* Specify *breakpoints* */
	srand(time(0));

	/* Initialize tables */
	linear_hash.empty = quad_hash.empty = double_hash.empty = bins;
	linear_hash.lookups = quad_hash.lookups = double_hash.lookups = 0;

	linear_hash.table = (char **)malloc(bins * sizeof(char *));
	quad_hash.table = (char **)malloc(bins * sizeof(char *));
	double_hash.table = (char **)malloc(bins * sizeof(char *));

	for(i=0; i<bins; i++){
		linear_hash.table[i] = quad_hash.table[i] = double_hash.table[i] = NULL;
	}

	/* Fill hashtables up to values specified in breaks and print results*/
	printf("|\t\t|\tLinear.\t|\tKvadr.\t|\tDvoji.\t|\n");
	i=0;
	while(breaks[i] != '\0'){
		while(linear_hash.empty > (1-breaks[i])*bins){ 
			tmp = generate_string();
			linear_hash_insert(tmp);
			quad_hash_insert(tmp);
			double_hash_insert(tmp);
		}
		print_average_attempts(breaks[i]);
		i++;
	}

	return 0;
}
