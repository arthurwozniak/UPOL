#!/usr/bin/env python3
import re
import itertools
import sys
import ast
import numpy as np


class databaseOperations:
    def __split_line(self, line):
        return tuple(re.sub('"|\n', '', line).split(","))

    def __make_schema_index(self):
        self.schema_index = {}
        for i in range(len(self.schema)):
            self.schema_index[self.schema[i]] = i

    def __prepare_ed(self):
        self.eds = {}
        for i in self.powerset(self.schema):
            i.sort()
            self.eds[i.__str__()] = None

    def __prepare_cd(self):
        self.cds = {}
        for i in self.powerset(self.schema):
            self.cds[i.__str__()] = None

    def __load_relation(self, filepath):
        f = open(filepath, 'r')
        self.schema = self.__split_line(f.readline())
        self.data = tuple(map(self.__split_line, f.readlines()))
        self.data_size = len(self.data)
        self.schema_size = len(self.schema)
        self.__make_schema_index()
        self.__prepare_ed()

    def __subset_p(self, s1, s2):
        # s1 je podmnozina s2
        #return all(x in s2 for x in s1)
        print("sub")
        print(s1)
        print(s2)
        for x in s1:
            if x not in s2:
                return False
        return True

    def __proper_subset_p(self, s1, s2):
        if self.__subset_p(s1, s2) & (len(s1) < len(s2)):
            return True
        return False

    def __equals(self, s1, s2):
        if self.__subset_p(s1, s2) & self.__subset_p(s2, s1):
            return True
        return False

    def __union(self, s1, s2):
        tmp = s2.copy()
        for i in s1:
            if not tmp.__contains__(i):
                tmp.append(i)
        return tmp

    def __set_difference(self, s1, s2):
        tmp = [x for x in s1 if x not in s2]
        return tmp

    def __unique(self, s):
        s = s.copy()
        for i in s:
            while s.count(i) > 1:
                s.pop(s.index(i))
        return s

    def tuple_match_attr(self, t1, t2, attr):
        return all(t1[i]==t2[i] for i in attr)

    def Ed(self, M):
        Mname = M.__str__()
        if self.eds[Mname] is not None:
            print("match")
            return self.eds[Mname]
        print("Musim pocitat: ", M)
        result = []

        # tweak pro self.data^2
        if M == []:
            result = np.array([[x,y] for x in range(self.data_size) for y in range(x+1)], dtype=np.int16)
            #result = [np.array([x,y], dtype=np.int16) for x in range(self.data_size) for y in range(x+1)]
            self.eds[Mname] = result
            del(result)
            return self.eds[Mname]

        keys = list(self.eds.keys())
        key = None
        keys.sort()
        #keys.reverse()
        for str_i in keys:
            i=ast.literal_eval(str_i)
            if ((self.__subset_p(i, M)) and (self.eds[str_i] is not None)):
                key = str_i
                break

        # spočítán si pozice atributů
        attr_list = [self.schema_index[x] for x in M]
        # a otestuju data
        result = np.array([x for x in self.eds[key] if (lambda d1,d2: all(d1[j]==d2[j] for j in attr_list))(self.data[x[0]], self.data[x[1]]) ])
        print(result)
        return result
        for i in self.eds[key]:
            d1 = self.data[i[0]]
            d2 = self.data[i[1]]
            if all(d1[j]==d2[j] for j in attr_list):
                result.append(i)
        result = set(result)
        #result = set(result)

        # attr_list = [self.schema_index[x] for x in M]
        # iter1 = iter(self.data)
        # for i in range(self.data_size):
        #     tmp = next(iter1)
        #     iter2 = iter(self.data)
        #     for j in range(i + 1):
        #         tmp2 = next(iter2)
        #         if all(tmp[i]==tmp2[i] for i in attr_list):
        #         #if self.tuple_match_attr(self.data[i], self.data[j], attr_list):
        #             result.add((i,j))
        #result = list(set(result))
        self.eds[Mname] = result
        #print(len(result))
        del(result)
        return self.eds[Mname]

    def Cd(self, M):
        result = []
        print("ED: " ,self.Ed(M))
        for i in self.schema:

            if (self.__subset_p(self.Ed(M), self.Ed([i]))):
                print("proslo: ",i)
            #if all(x in self.Ed([i]) for x in self.Ed(M)):
            #if set([i]) <= set(M):
                result.append(i)
        print("Cd %s: %s" % (M, result))
        return result

    def powerset(self, lst):
        result = [[]]
        for x in lst:
            result.extend([subset + [x] for subset in result])
        return result

    def dummy_base(self):
        powers = self.powerset(self.schema)
        res = [[a, self.Cd(a)] for a in powers]
        return self.__unique(res)

    def __insert(self, s, i):
        if not i in s:
            s.append(i)

    def __clos_infty_maker(self, M, T, subsetter):
        print("uzaviram")
        M_next = None
        while M != M_next:
            del(M_next)
            M_next = M
            tmp = []
            for ab in T:
                if subsetter(ab[0], M_next):
                    tmp.extend(ab[1])
            del(M)
            M = list(set(tmp)| set(M_next))
            del(tmp)
        return M

    def clos_infty(self, M, T):
        return self.__clos_infty_maker(M, T, self.__proper_subset_p)

    def clos_infty_eq(self, M, T):
        return self.__clos_infty_maker(M, T, self.__subset_p)

    def close_theory(self, theory):
        T_new = []
        for i in theory:
            self.__insert(T_new, [i[0], self.clos_infty_eq(i[0], theory)])
        return T_new

    def semantic_provable(self, theory, form):
        if self.__subset_p(form[1], self.clos_infty_eq(form[0], theory)):
            return True

    def minimise_theory(self, theory):
        change = True
        T = self.close_theory(theory)
        while change:
            change = False
            for i in T:
                print("I: ", i)
                cmp = self.__set_difference(T, [i])
                print("cmp: ", cmp)
                if self.semantic_provable(cmp ,i):
                    T = cmp
                    change = True
                    break
        return T

    def lispify(self, l):
        bra_trans = str.maketrans('[]','()')
        lispy_bras =  l.translate(bra_trans)
        liner = re.sub("\)\),", "))\n", lispy_bras)
        no_bra_comma = re.sub("\),", ")", liner)
        smooth = re.sub(",|'", "", no_bra_comma)
        return smooth

    def load_lispy_theory(self, text):
        text = re.sub("\n", ",", text)
        text = re.sub(" ", ",", text)
        text = re.sub(",,", ",", text)
        text = text.translate(str.maketrans('()','[]'))
        text = re.sub(r"\w+.", r'"\g<0>""', text)
        return text

    def load_theory_from_file(self, path):
        f = open(path, 'r')
        return self.load_lispy_theory(f.read())

    def next_closure(self, cl, M):
        n = len(self.schema)
        for i in range(n-1, -1, -1):
            if self.schema[i] not in M:
                M_less = [M[j] for j in range(len(M)) if M[j] in self.schema[:i]]
                new = cl(self.__union([self.schema[i]], M_less))
                new_less = [new[j] for j in range(len(new)) if new[j] in self.schema[:i]]
                if self.__equals(new_less, M_less):
                    del(M_less)
                    del(new_less)
                    return new
                del(M_less)
                del(new_less)
                del(new)
        return None

    def beautify_base(self, base):
        for i in base:
            print(i)

    def minimum_base(self):
        M=[]
        T=[]
        while not self.__equals(M, self.schema):
            M.sort()
            print(M)
            cd = self.Cd(M)
            if not self.__equals(M, cd):
                T.append([M, cd])
            M = self.next_closure(lambda x: self.clos_infty(x, T), M)
        return T

    def __init__(self, path):
        self.__load_relation(path)

path = "/home/kamil/Dropbox/UPOL/6semestr/DATA2/real_data.csv"
#path = "/home/kamil/Dropbox/UPOL/6semestr/DATA2/nursery.data"


db = databaseOperations(path)
print(db.schema)
#list(map(print, db.data))
print("minimum_base:")
a=db.minimum_base()

print("foo: ", a)

sys.exit(0)

print("dummy_base:")
db.beautify_base(db.dummy_base())
print("equalities: ", db.syntactic_equalities(db.dummy_base()))

print("Close theory")
print(db.close_theory(db.dummy_base()))
print("minimize theory")
c=[[[], ['v']], [['o', 'v'], ['o', 'v', 't']], [['t', 'v'], ['t', 'v', 'o']], [['v'], ['v']], [['t'], ['o', 't', 'v']]]
b = db.minimise_theory(c)
print("len min: %s" % len(b))
print(b)
