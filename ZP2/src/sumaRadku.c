#include <stdio.h>
#include <stdlib.h>
#define RADKY 5

int *suma_radku(int prvky[][4], int radku);
int *suma_radku2(int prvky[][4], int radku);

int main()
{
	int pole[RADKY][4]={{4,2,5,6},{1,8,5,9},{14,22,54,26},{1,10,8,7},{4,12,52,63}},i;
	int *soucty=suma_radku(pole,RADKY);
	for(i=0;i<RADKY;i++)
		printf("Soucet %d. radku je %d.\n",i,soucty[i]);
	return 0;
}

int *suma_radku(int prvky[][4], int radku)
{
	int tmp, tmp2;
	int *SUMS;
	SUMS = malloc(radku*sizeof(int));
	for(tmp = 0; tmp < radku; tmp++){
		SUMS[tmp] = 0;
		for(tmp2 = 0; tmp2 < 4; tmp2++){
			SUMS[tmp] += prvky[tmp][tmp2];
		}
	}
	return SUMS;
}

/*nefunkcni
int *suma_radku2(int prvky[][4], int radku)
{
	int tmp, tmp2;
	int SUMS[4];
	for(tmp = 0; tmp < radku; tmp++){
		SUMS[tmp] = 0;
		for(tmp2 = 0; tmp2 < 4; tmp2++){
			SUMS[tmp] += prvky[tmp][tmp2];
		}
	}
	return SUMS;

}
*/