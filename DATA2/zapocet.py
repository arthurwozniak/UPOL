#!/usr/bin/env python3
import re
import itertools

class databaseOperations:
    def __split_line(self, line):
        return re.sub('"|\n', '', line).split(",")

    def __load_relation(self, filepath):
        f = open(filepath, 'r')
        self.schema = self.__split_line(f.readline())
        self.data = list(map(self.__split_line, f.readlines()))
        return (self.schema, self.data)

    def __subset_p(self, s1, s2):
        return all(x in s2 for x in s1)

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
        for i in attr:
            pos = self.schema.index(i)
            if t1[pos] != t2[pos]:
                return False
        return True

    def Ed(self, M):
        result = []
        #for i in [(t1,t2) for t1 in self.data for t2 in self.data]:
        for i in range(self.size):
            for j in range(self.size):
                if self.tuple_match_attr(self.data[i], self.data[j], M):
                    result.append([self.data[i], self.data[j]])
        return self.__unique(result)

    def Cd(self, M):
        result = []
        for i in self.schema:
            if self.__subset_p(self.Ed(M), self.Ed([i])):
                result.append(i)
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
        M_next = None
        while M != M_next:
            print(M)
            M_next = M
            tmp = []
            for ab in T:
                if subsetter(ab[0], M_next):
                    tmp.extend(ab[1])
            M = self.__union(tmp, M_next)
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
                    return new
        return None

    def beautify_base(self, base):
        for i in base:
            print(i)

    def minimum_base(self):
        M=[]
        T=[]
        while not self.__equals(M, self.schema):
            cd = self.Cd(M)
            if not self.__equals(M, cd):
                T.append([M, cd])
            M = self.next_closure(lambda x: self.clos_infty(x, T), M)
        return T

    def __init__(self, path):
        self.schema, self.data = self.__load_relation(path)
        self.size = len(self.data)

path = "/home/kamil/Dropbox/UPOL/6semestr/DATA2/real_data.csv"
#path = "/home/kamil/Dropbox/UPOL/6semestr/DATA2/nursery.data"

db = databaseOperations(path)
print(db.schema)
#list(map(print, db.data))
print("minimum_base:")
db.beautify_base(db.minimum_base())
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
