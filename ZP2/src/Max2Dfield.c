#include <stdio.h>
#include <stdlib.h>

int maximum(int prvky[][4], int radku);

int main()
{
	int i,j;
	int field[][4] = {	{10, 2, 15, -2},
						{-52, 41, 0, 12},
						{15, 3, 1, -8} };

	int rows = sizeof(field)/(4*sizeof(int));
	printf("Vypis pole:\n");
	for(i = 0; i < rows; i++){
		for(j=0; j<4; j++){
			printf("%5d", field[i][j]);
		}
		printf("\n");
	}
	printf("\nMaximum je: %d", maximum(field, rows));
	return 0;
}

int maximum(int prvky[][4], int radku){
	int max, i, j;
	max = NULL;
	for(i = 0; i < radku; i++){
		for(j=0; j<4; j++){
			if(prvky[i][j] > max) max = prvky[i][j];
		}
	}
	return max;
}