#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

class Osoba
{
public:
    string jmeno,prijmeni;
    Osoba()
    {
        jmeno = "";
        prijmeni = "";
    }
    Osoba(string* a, string* b)
    {
        jmeno.append(*a);
        prijmeni.append(*b);
    }

    Osoba operator = (const Osoba &o)
    {
        jmeno = o.jmeno;
        prijmeni = o.prijmeni;
        return *this;
    }
    bool operator == (const Osoba &o)
    {
        return ((jmeno == o.jmeno) && (prijmeni == o.prijmeni));
    }

    bool operator == (const Osoba *o)
    {
        return ((jmeno == o->jmeno) && (prijmeni == o->prijmeni));
    }

    void print()
    {
        cout << "Osoba: " << jmeno << " " << prijmeni << endl;
    }
};

bool operator == (const Osoba &o1, const Osoba &o2)
{
    return (o1.jmeno == o2.jmeno) && (o1.prijmeni == o2.prijmeni);
}

bool pridat(vector<Osoba> &v, const char *jmeno, const char *prijmeni)
{
    Osoba* tmp = new Osoba(new string(jmeno), new string(prijmeni));
    auto it = find(v.begin(), v.end(), tmp);
    if(it == v.end())
    {
        v.insert(v.end(), *tmp);
        return true;
    }
    return false;
}

bool zrusit(vector<Osoba> &v, const char *jmeno, const char *prijmeni)
{
    Osoba* tmp = new Osoba(new string(jmeno), new string(prijmeni));
    auto it = find(v.begin(), v.end(), tmp);
    if(it == v.end()) return false;
    v.erase(it);
    return true;
}

int main()
{
    vector<Osoba> people;
    pridat(people, "FOO", "BAR");
    pridat(people, "BAR", "FOO");
    pridat(people, "BAR", "BAZ");
    pridat(people, "FOO", "BAZ");
    pridat(people, "BAZ", "QAZ");

    for(auto it = people.begin(); it!=people.end(); ++it) it->print();
    zrusit(people, "BAZ", "QAZ");
    cout << endl;

    for(auto it = people.begin(); it!=people.end(); ++it) it->print();

    return 0;
}
