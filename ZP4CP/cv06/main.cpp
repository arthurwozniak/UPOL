#include <iostream>
#include <set>
#include <fstream>
#include <string>
#include <algorithm>

using namespace std;
set<string> t1;
set<string> t2;


void t1int2(const string &s){
	if(t2.find(s) == t2.end())
		cout << "t2 neobsahuje " << s << endl;
}


void t2int1(const string &s){
	if(t1.find(s) == t1.end()){
		cout << "t1 neobsahuje " << s << endl;
    }
}


int main(){

	char *tmp = new char[10000];
	char tmpChar;
	unsigned int i = 0;

	try {
		{ ifstream s("Text1.txt",ios::in);
		if (!s.is_open()) throw "Neotevrel se pro cteni.";
		while((int)s.peek() != -1){
			tmpChar = s.get();
			if((tmpChar == '\n') | (tmpChar == ',') | (tmpChar == '\t') | (tmpChar == ' ') | (tmpChar == '.')){
				tmp[i] = '\0';
				if(i > 0){
					t1.insert(string(tmp));
				}
				i=0;
			}
			else {
				tmp[i] = tmpChar;
				i++;
			}
		}
		s.close();
	}
	}catch (const char *s) { cout << s << endl; }

	try {
		{ ifstream s("Text2.txt",ios::in);
		if (!s.is_open()) throw "Neotevrel se pro cteni.";
		while((int)s.peek() != -1){
			tmpChar = s.get();
			if((tmpChar == '\n') | (tmpChar == ',') | (tmpChar == '\t') | (tmpChar == ' ') | (tmpChar == '.')){
				tmp[i] = '\0';
				if(i > 0){
					t2.insert(string(tmp));
				}
				i=0;
			}
			else {
				tmp[i] = tmpChar;
				i++;
			}
		}
		s.close();
	}
	}catch (const char *s) { cout << s << endl; }

	cout << "t1 velikost " << t1.size() << endl;
	cout << "t2 velikost " << t2.size() << endl;

    cout << "Porovnavani" << endl;

	for_each(t1.begin(), t1.end(), t1int2);
	for_each(t2.begin(), t2.end(), t2int1);

}
