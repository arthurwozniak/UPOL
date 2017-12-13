#include <iostream>
#include <string>

using namespace std;
#define max 200
int main()
{
    int pos_point, last, i;
    string v("In the C++ programming language, the retez trida is a standard representation for a retez of text. \n"
        "The trida provides some typical retez operations like comparison, concatenation, find and replace.\n");
    string s[]={string("retez"),string("string"),string("trida"),string("class") };

    for(i = 0; i < 4; i++){
        if(i%2 == 1) continue;
        last = 0;
        while(true){
            pos_point = v.find(s[i], last);
            last = pos_point + s[i+1].size();
            if(pos_point >= v.max_size()) break;
            v.replace(pos_point, s[i].size(), s[i+1]);
        }
    }

    cout << v << endl;
    return 0;
}
