#include <iostream>
#include <string>
#include <regex>
#include "Cas.cpp"

using namespace std;

int main()
{
    int i;
    regex r1, r2;
    cmatch cm;
    bool tmp;

    r1.assign("([01][0-9]|2[0-3]|24|00)(:([0-5][0-9])(:([0-5][0-9])([.,]\\d+)?)?)?Z?");
    r2.assign("([01][0-9]|2[0-3])(([0-5][0-9])(([0-5][0-9])([.,]\\d+)?)?)?Z?");

    i = 0;
    while(true){
        if(cas[i] == nullptr) break;
        tmp = regex_match(cas[i], cm, r1);
        if(!tmp) tmp = regex_match(cas[i], cm, r2);
        if(((cm[0].compare("24") == 0) || (cm[0].compare("00") == 0)) && (cm[1].compare("00") != 0)) tmp = false;
        cout << cas[i] << " " << (tmp ? "spravny" : "chybny") << endl;
        i++;
    }
    return 0;
}
