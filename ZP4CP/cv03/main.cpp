#include <iostream>
#include <list>
#include "Jmena.cpp"
#include <string.h>
#include <string>
#include <algorithm>


using namespace std;



bool f(string jmeno)
{
    for(unsigned int i = 0; i < PocetZ; i++)
    {
        if(strcasecmp(jmeno.data(), JmenaZ[i]) == 0) return true;
    }
    return false;
}

int main()
{
    list<string> l;
    unsigned int i;
    for(i = 0; i < Pocet; i++)
    {
        l.push_back(string(Jmena[i]));
    }
    l.sort();

    for (auto it=l.begin(); it!=l.end(); ++it) cout << *it << endl;

    cout << "============================================" << endl;

    for(i = 0; i < PocetN; i++)
    {
        cout << JmenaN[i];
        auto it = std::find(l.begin(), l.end(), string(JmenaN[i]));
        if(it == l.end()) cout << " nenalezeno" << endl;
        else cout << " nalezeno" << endl;
    }

    l.remove_if(f);

    cout << "============================================" << endl;

    for(auto it = l.begin(); it!=l.end(); ++it )
    {
        for(i = 0; i < PocetZN; i++)
        {
            cout << JmenaZN[i];
            if(strcasecmp((*it).data(), JmenaZN[i]) == 0) cout << " nalezeno***" << endl;
            else cout << " nenalezeno" << endl;
        }
    }

    cout << l.size() << endl;


    return 0;
}
