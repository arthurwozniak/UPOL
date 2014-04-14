#include <stdio.h>
#include <stdlib.h>

int FibRec(int num){	
	if(num<2){
		return num;
	}
	return (FibRec(num-1) + FibRec(num-2));
}

int FibNonRec(int num){
	int n0 = 0;
	int n1 = 1;
	int tmp = 0;
	int i = 1;
	if(num<2){
		return num;
	}
	while(i < num){
		tmp = n0;
		n0 = n1;
		n1 = tmp + n1;
		i++;
	}
	return n1;

}

int main()
{
	int nums[] = {0, 1, 2, 7, 5, 6, 45}, i;
	int size = sizeof(nums) / sizeof(int);
	for(i = 0; i < size; i++){
		printf("Fib(%d) = %d\n", nums[i], FibNonRec(nums[i]));
	}
	return 0;
}