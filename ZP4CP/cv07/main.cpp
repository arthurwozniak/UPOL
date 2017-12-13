#include <iostream>
#include <string>
#include <string.h>
#include <unordered_map>
#include "Ovoce.cpp"

using namespace std;

typedef pair <const char *, float> mp;

struct hash_fun {
    unsigned operator () (const char* a) const{
        int size = strlen(a);
        return (unsigned)tolower(a[0])*31 + (unsigned)tolower(a[size-1]) + (unsigned)tolower(a[size]);
    }
};

struct equal_fun {
    bool operator () (const char* s1,const char* s2) const {
        bool passed = true;
        int i = 0;
        while(s1[i] != '\0'){
            if((tolower(s1[i]) != tolower(s2[i])) | (s2[i] == '\0')){
                passed = false;
            }
            i++;
        }
        return passed;
    }
};

int main(){
    unordered_map<const char *, float, hash_fun, equal_fun> m;
    unsigned int i = 0;

    while(vlozitOvoce[i].ovoce != nullptr){
        m.emplace(vlozitOvoce[i].ovoce, vlozitOvoce[i].cena);
        i++;
    }

    cout << "Pocet polozek: " << m.size() << endl;

    i = 0;

    while(vypsatOvoce[i] != nullptr){
        cout << vypsatOvoce[i] << " ";
        auto res = m.find(vypsatOvoce[i]);
        if(res != m.end()) cout << m.at(vypsatOvoce[i]) << endl;
        else cout << "???" << endl;
        i++;
    }

    return 0;
}
