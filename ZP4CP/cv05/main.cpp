#include <iostream>
#include <map>
#include "ABBA.cpp"

using namespace std;

typedef pair <int, char> mp;

const Prechod BTP[]= {{1,'0',-2},{1,'1',-2},{1,'2',-4},{-2,'0',-2},{-2,'1',-2}, {-2, 'b', -3},
                    {-2, 'B', -3}, {-2, '2', -4}, {-4, '0', -4}, {-4, '1', -4}, {-4, '2', -4}, {0,0,0}};

int automat(map<mp,int> m, const char* str){
    int i = 0;
    int stav = 1;
    while(1){
        if(str[i] == '\0') break;
        mp tmp = mp(stav, str[i]);
        try{
            stav = m.at(tmp);
        } catch (out_of_range){
            stav = 0;
            break;
        }
        i++;
    }
    return stav;
}


int main() {
    int result;
    unsigned int i;
    map<mp,int> m;
    map<mp,int> btm;


    const char *bt[]= { "20", "110b", "12b", "00", "00b", "012" };

    for(i = 0;; i++){
        if(ABBA[i].nasledujiciStav==0)break;
        mp tmp = mp(ABBA[i].soucasnyStav, ABBA[i].znak);
        m.emplace(tmp, ABBA[i].nasledujiciStav);
    }

    for(i = 0;; i++){
        if(BTP[i].nasledujiciStav==0)break;
        mp tmp = mp(BTP[i].soucasnyStav, BTP[i].znak);
        btm.emplace(tmp, BTP[i].nasledujiciStav);
    }
    result = automat(m, vstup1);
    cout << vstup1 << ((result < 0) ? " proslo" : " neproslo") << endl;;
    result = automat(m, vstup2);
    cout << vstup2 << ((result < 0) ? " proslo" : " neproslo") << endl;

    for(i=0; i < sizeof(bt)/sizeof(char*); i++){
        result = automat(btm, bt[i]);
        cout << bt[i];
        switch(result){
            case -2:
            case -3:
                cout << " je binarni" << endl;
                break;
            case -4:
                cout << " je ternarni" << endl;
                break;
            default:
                cout << " nebylo rozpoznano" << endl;
        }

    }
    return 0;
}
