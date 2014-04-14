#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int alphabet[64] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'};

char b64encode(char *chars);
int *dec2bin(int letter);
int exp_2(int i);
int main()
{
    char string[] = "Man is distinguished, not only by his reason, but by this singular passion from other animals, which is a lust of the mind, that by a perseverance of delight in the continued and indefatigable generation of knowledge, exceeds the short vehemence of any carnal pleasure.";
    b64encode(string);
    return 0;
}

int exp_2(int i)
{
    int tmp = 2;
    if (i == 0)tmp = 1;
    while (i > 1)
    {
        tmp = tmp * 2;
        i--;
    }
    return tmp;
}

char b64encode(char *chars)
{
    int *encodedString;
    int *tmpString;
    int size = 0;
    int i = 0, j = 0, tmp = 1;
    encodedString = malloc(size * sizeof(int));
    while (chars[size] != '\0')size++;
    for (j = 0; j < size; j++)
    {
        tmpString = dec2bin(chars[j]);
        i = 0;
        while (i < 8)
        {
            encodedString[j * 8 + i] = tmpString[i];
            i++;
        }
    }
    j = 0;
    for (i = 0; i <= size * 8; i++)
    {
        if (((i % 6) != 0) | (i == 0))
        {
            j += encodedString[i] * exp_2(6 - tmp);
        }
        else
        {
            printf("%c", alphabet[j]);
            j = 0;
            tmp = 1;
            j += encodedString[i] * exp_2(6 - tmp);
        }
        tmp++;
    }
    if (j != 0)printf("%c", alphabet[j]);
    for (i = size; i < 3; i++)printf("=");
    printf("\n");
    return 0;
}

int *dec2bin(int letter)
{
    int size = log(letter) / log(2);
    int i;
    int *BINARY;
    BINARY = (int *) malloc(8 * sizeof(int));

    for (i = 0; i < 8; i++)
    {
        if (7 - size > i)BINARY[i] = 0;
        else
        {
            BINARY[(7 - i) + (7 - size)] = letter % 2;
            letter = letter / 2;
        }
    }
	return BINARY;
}