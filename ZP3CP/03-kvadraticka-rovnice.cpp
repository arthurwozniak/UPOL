#include <iostream>
#include <math.h>

using namespace std;

class KvadratickaRovnice{
	float a, b, c, disc, k1, k2;
	void diskriminant() {disc = b*b - 4*a*c;}
	public:
		KvadratickaRovnice(float,float,float);
		int pocetKorenu() {return disc < 0 ? 0 : disc == 0 ? 1 : 2;}
		float koren1(){return k1;}
		float koren2(){return k2;}
};

KvadratickaRovnice::KvadratickaRovnice(float x, float y, float z){
	a=x;
	b=y;
	c=z;
	diskriminant();
	switch(pocetKorenu()){
		case 1:
			k1 = (-b)/(2*a);
			break;
		case 2:
			k1 = (-b + sqrt(disc))/(2*a);
			k2 = (-b - sqrt(disc))/(2*a);
		break;
	}
}

int main(int argc, char const *argv[])
{
	/* code */
	double a,b,c;
	cout << "Zadej stranu a: ";
	cin >> a;
	cout << "Zadej stranu b: ";
	cin >> b;
	cout << "Zadej stranu c: ";
	cin >> c;

	KvadratickaRovnice rovnice(a,b,c);
	switch(rovnice.pocetKorenu()){
		case 0:
			cout << "Rovnice nemá žádný kořen" << endl;
			break;
		case 1:
			cout << "Dvojnásobným kořenem je " << rovnice.koren1() << endl;
			break;
		default:
			cout << "První kořen je " << rovnice.koren1() << endl;
			cout << "Druhý kořen je " << rovnice.koren2() << endl;
	}
	return 0;
}