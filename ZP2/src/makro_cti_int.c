#include <stdio.h>
#include <stdlib.h>

#define cti_int(c) (scanf("%d", &c), c)

#define kvadrat(x) (x*x)

#define min(x, y) ((x<y)?x:y)

#define max(x, y) ((x>y)?x:y)
int main()
{

    int j, k,l;
    printf("Zadejte cele cislo k: ");
    if((j = cti_int(k)) == 0) printf("nula\n");
    else printf("%i %i\n",j, k);
    printf("Zadejte cele cislo l: ");
    if((j = cti_int(l)) == 0) printf("nula\n");
    else printf("%i %i", j,l);
    printf("Minimum z k a l je: %i\n", min(k, l));
    printf("Maximum z k a l je: %i\n", max(k, kvadrat(l)));
    printf("Minimum z k a k-1 je: %i\n", min(k,k-1));
    printf("Maximum z k a k+1 je: %i\n", max(k,k+1));
    return 0;
}