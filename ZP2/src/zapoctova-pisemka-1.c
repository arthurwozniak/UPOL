#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>


int modus(int pocet, ...);

int main()
{

	printf("Modus cisel 4, 2, 2, 4, 5, 6, 4, 8, 9, 10 je %d", modus(10, 4, 2, 2, 4, 5, 6, 4, 8, 9, 10));
	printf("\nModus cisel 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 je %d", modus(10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
	return 0;
}

int modus(int pocet, ...){
	int i,elems = 0,found = 0, tmp;
	int **pocty = (int **)malloc(pocet*sizeof(int*));
	va_list param;
	va_start(param, pocet);

	for(i=0; i<pocet; i++){
		pocty[i] = (int *)malloc(2*sizeof(int));
		pocty[i][0] = NULL;
		pocty[i][1] = 0;
	}
	
	while(pocet > 0){
		tmp = va_arg(param, int);
		if(elems == 0){
			pocty[0][0] = tmp;
			pocty[0][1]++;
			elems++;
		}
		else{
			for(i=0; i<elems; i++){
				if(pocty[i][0]==tmp){
					pocty[i][1]++;
					found = 1;
				}
			}
			if(found==0){
				pocty[elems][0]=tmp;
				pocty[elems][1]++;
				elems++;
			}
			found = 0;
		}
		pocet--;
	}
	tmp = 0;
	for(i=0; i<elems; i++){
		if(pocty[tmp][1]<pocty[i][1])tmp=i;
	}
	return pocty[tmp][0];
}