#include <iostream>
#include "Mince.cpp"
#include <set>

using namespace std;

int main(){
    multiset<int> mince;
    int tmp;
    unsigned int i;
    const short values[] = {1, 2, 5, 10, 20, 50};
    for(i = 0; i < pohybPocet; i++){
        if((tmp=pohyb[i]) > 0)
            mince.insert(tmp);
        else mince.erase(mince.find(-tmp));
    }

    for(i=0; i < (sizeof(values)/sizeof(short)); i++){
        tmp = mince.count(values[i]);
        if(tmp > 0) cout << "M"<< values[i] << " " << tmp <<"x"<<endl;
    }
    return 0;
}
