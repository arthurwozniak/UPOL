#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

typedef struct complex
{
	double real;
	double imaginary;
} complex;

complex sum(int count, ...);

int main()
{
	complex a = {3.1, -2.3};
	complex b = {0.5, -3};
	complex c = {0, 1.2};
	complex result = sum(3, a, b, c);
	printf("Suma je %g + %gi. \n", result.real, result.imaginary);
	return 0;
}

complex sum(int count, ...){
	complex result = {0, 0}, tmp;
	va_list param;
	va_start(param, count);
	while(count > 0){
		tmp = va_arg(param, complex);
		result.real += tmp.real;
		result.imaginary += tmp.imaginary;
		count--;
	}
	va_end(param);
	return result;
}