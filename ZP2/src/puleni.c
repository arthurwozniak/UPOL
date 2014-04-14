#include <stdio.h>
#include <stdlib.h>

int puleni(int cisla[], int a, int b, int hledane);
void tisk(int i);

int main()
{
    int pole[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};
    tisk(puleni(pole, 0, 19, 1));
    tisk(puleni(pole, 0, 19, 20));
    tisk(puleni(pole, 0, 19, 21));
    tisk(puleni(pole, 0, 19, 7));
    tisk(puleni(pole, 0, 19, 18));
    return 0;
}

int puleni(int cisla[], int a, int b, int hledane)
{
    if (a <= b)
    {
        int half = (a + b) / 2;
        if (cisla[half] == hledane) return half;
        else if (cisla[half] > hledane)
        {
            return puleni(cisla, a, half, hledane);
        }
        else if (cisla[half] < hledane)
        {
            return puleni(cisla, half + 1, b, hledane);
        }
    }
    return -1;
}

void tisk(int i)
{
    if (i > -1) printf("Hledane cislo se nachazi v poli s indexem %d.\n", i); else printf("Hledane cislo se v poli nenachazi.\n");
}