#include <iostream>

using namespace std;

class Seznam {
	static Seznam *prvni, *iterator;
	int cislo;
	Seznam *dalsi;
	public: Seznam(int);

			int prvek() const {return cislo;}

			static bool nastavitNaPrvni(){
				if (prvni == NULL) return false;
				iterator = prvni;
				return true;
			}

			static Seznam *aktualni(){return iterator;}

			static bool posunoutNaDalsi(){
				if (iterator->dalsi == NULL){
					iterator = NULL;
					return false;
				} 
				iterator = iterator->dalsi;
				return true;
			}

};

Seznam* Seznam::prvni = NULL;
Seznam* Seznam::iterator = NULL;


Seznam::Seznam(int c){
	dalsi = prvni;
	prvni = this;
	cislo = c;
}

int main(int argc, char const *argv[])
{
	new Seznam(3);
	new Seznam(4);
	new Seznam(5);
	new Seznam(6);
	new Seznam(7);
	new Seznam(8);


	Seznam::nastavitNaPrvni();

	do{
		cout << (*Seznam::aktualni()).prvek() << endl;
	} while(Seznam::posunoutNaDalsi());

	return 0;
}