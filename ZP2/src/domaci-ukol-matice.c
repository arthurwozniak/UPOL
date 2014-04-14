#include <stdio.h>
#include <stdlib.h>


char **reflexivni(char **R, int n);
char **symetricky(char **R, int n);
char **tranzitivni(char **R, int n);
void tisk(char **R, int n);

int main()
{
	int prvky = 5;

	char **R = (char**)malloc(prvky*sizeof(char*));

	char col0[] = {0, 1, 0, 0, 0};
	char col1[] = {0, 0, 1, 0, 0};
	char col2[] = {1, 0, 1, 0, 1};
	char col3[] = {0, 0, 0, 0, 0};
	char col4[] = {0, 0, 0, 0, 0};

	R[0] = col0;
	R[1] = col1;
	R[2] = col2;
	R[3] = col3;
	R[4] = col4;
	
	printf("Relace A je: ");
	tisk(R, prvky);
	printf("\nReflexivni uzaver relace A je: ");
	tisk(reflexivni(R, prvky), prvky);
	printf("\nSymetricky uzaver relace A je: ");
	tisk(symetricky(R, prvky), prvky);
	printf("\nTranzitivni uzaver relace A je: ");
	tisk(tranzitivni(R, prvky), prvky);	
	return 0;
}

void tisk(char **R, int n){
	int i, j;
	printf("{");
	for(j=0; j<n; j++){
		for(i=0; i<n; i++){
			if(R[j][i])printf("<%d,%d>, ", j, i);
		}
	}
	printf("}");
}

char **reflexivni(char **R, int n){
	int i,j;

	char **ref = (char**)malloc(n*sizeof(char*));
	for(i=0; i<n; i++){
		ref[i] = (char*)malloc(n*sizeof(char));
		for(j=0;j<n;j++){
			ref[i][j] = R[i][j];
		}
	}

	for(i=0; i<n; i++) ref[i][i] = 1;
	return ref;
}

char **symetricky(char **R, int n){
	int i,j;

	char **sym = (char**)malloc(n*sizeof(char*));
	for(i=0; i<n; i++){
		sym[i] = (char*)malloc(n*sizeof(char));
		for(j=0;j<n;j++){
			sym[i][j] = R[i][j];
		}
	}

	for(i=0; i<n; i++){
		for(j=0; j<n; j++){
			if(sym[i][j])sym[j][i] = 1;
		}
	}
	return sym;
}

char **tranzitivni(char **R, int n){
	int i,j,k,l = 0;

	char **tran = (char**)malloc(n*sizeof(char*));
	for(i=0; i<n; i++){
		tran[i] = (char*)malloc(n*sizeof(char));
		for(j=0;j<n;j++){
			tran[i][j] = R[i][j];
		}
	}

	do {
		l = 0;
		for(i=0; i<n; i++){
			for(j=0; j<n; j++){
				if(tran[i][j]){
					for(k=0; k<n; k++){
						if(tran[j][k]){
							tran[i][k]=1;
							l = 1;
						}
					}
				}
			}
		}
	}
	while(l==0);

	return tran;
}