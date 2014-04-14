#include <stdio.h>
#include <stdlib.h>

typedef struct canvas{
	char **uberart;
	int size[2];
} canvas;

canvas *canvas_create(int, int);
void canvas_draw_rect(canvas *, int, int, int, int, char);
void canvas_clear(canvas *);
void canvas_print(canvas *);

canvas *canvas_create(int x, int y){
	canvas *tmpArt = (canvas *) malloc(sizeof(canvas));
	int i,j;
	tmpArt->uberart = (char **) malloc((y)*sizeof(char *));
	for(i=0; i<y; i++){
		tmpArt->uberart[i] = (char*)malloc(x*sizeof(char));
		
		for(j=0; j<x; j++){
			tmpArt->uberart[i][j] = ' ';
		}
	}
	tmpArt->size[0] = x;
	tmpArt->size[1] = y;
	return tmpArt;
}

void canvas_clear(canvas *c){
	int x, y;
	y = 0;
	while(y < c->size[1]){
		x=0;
		while(x < c->size[0]){
			c->uberart[y][x] = ' ';
			x++;
		}
		y++;
	}
}

void canvas_print(canvas *c){
	int x, y;
	y = 0;
	while(y < c->size[1]){
		x=0;
		while(x < c->size[0]){
			printf("%c", c->uberart[y][x]);
			x++;
		}
		y++;
		printf("\n");
	}
}

void canvas_draw_rect(canvas *c, int x, int y, int width, int height, char ch){
	int i;
	while((height > 0)){
		if(y<0){
			y++;
			height--;
		}
		else{
			/* test y vetsi nez pocet radku*/
			if(y >= c->size[1])return;

			if(x<0){
				if((x+width) > 0){
					width=x+width;
					x=0;
				}
				else break;
			}
			for(i=x; i<(x + width); i++){
				if(i < c->size[0])c->uberart[y][i]=ch;
				else break;
			}
			y++;
			height--;
		}
	}
}