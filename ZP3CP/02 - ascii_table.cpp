#include <iostream>
#include <iomanip>

using namespace std;

int main(int argc, char *argv[])
{
	int start, opt, width, liner;
	cin >> opt;
	if (opt == 1){
		width = 10;
		start = 30;
	}
	else {
		start = 32;
		width = 16;
	} 
	liner = 0;
	// vytisknutí hlavičky
	cout << "     ";
	if(opt==1){
		for(int i = 0; i < 10; i++){
			cout << " " << i << " ";
		}
		cout << endl << "    ";
		for(int i = 0; i < 3*width + 2; i++){
			cout << '-';
		}
		cout << endl;
	}
	else {
		for(int i = 0; i < 16; i++){
			cout << " " << uppercase << hex << i << " ";
		}
		cout << endl << "    ";
		for(int i = 0; i < 3*width + 2; i++){
			cout << "-";
		}
		cout << endl;
	}
	//první řádek
	if (opt==1) cout << setw(3) << start << " |";
	else cout << setw(3) <<hex << start << " |";

	for(;start<256; start++){

		if (liner < width){
		 	cout << " " << setw(1) << (char)((start<32)?32:start) << " ";
		 	liner++;
		 }
		else{
			cout << "| \n";
			if (opt==1) cout << setw(3) << start << " |";
			else cout << setw(3) << hex << start << " |";
			cout << " " << (char)start << " ";
			liner = 1;
		}
	}
	// dorovnání
	cout << setw(3*(width - liner)+1) << right << "|" << endl << "    ";
	for(int i = 0; i < 3*width + 2; i++){
			cout << "-";
	}
	cout << endl;
	return 0;
}
