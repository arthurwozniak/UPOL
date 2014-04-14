#include <stdio.h>
#include <stdlib.h>
#include "asciart.h"

#define sym '#'

int main()
{
	int i,k;
	canvas* platno;

	platno = canvas_create(100, 38);
	/* horni patka */
	canvas_draw_rect(platno, 24, -10, 30, 16, sym);
	i=0;
	for(k=0; k<10; k++){
		canvas_draw_rect(platno, 50+i, k, 1000, 1, ' ');
		i++;
	}
	/* prava noha */
	i=0;
	for(k=4; k<300; k++){
		canvas_draw_rect(platno, 39+i, k, 15, 1, sym);
		i++;
	}
	/* leva noha */
	i=0;
	for(k=8; k<300; k++){
		canvas_draw_rect(platno, 44-i, k, 13, 1, sym);
		i++;
	}
	canvas_print(platno);
	return 0;
}



