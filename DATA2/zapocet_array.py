#!/usr/bin/env python3

import re
import ast
import operator
import os, sys


class databaseOperations:
    def __split_line(self, line):
        #return tuple(re.sub('"|\n', '', line).split(","))
        return line[:-1].split(",")

    def __make_schema_index(self):
        self.schema_index = {}
        for i in range(self.schema_size):
            self.schema_index[self.schema[i]] = i

    def __prepare_ed(self):
        self.eds = {}
        #for i in self.powerset(self.schema):
        #    i.sort()
        #    self.eds[i.__str__()] = None
        self.eds['[]']=[set(range(self.data_size))]
        self.eds_passed = ['[]']

    def frozentify_theory(self, T):
        return frozenset(tuple((frozenset(x[0]),frozenset(x[1]))) for x in T)

    def listify_theory(self, T):
        l = [[list(x[0]), list(x[1])] for x in T]
        return sorted(l, key=lambda x: len(x[0]))

    def __load_relation(self, filepath):
        f = open(filepath, 'r')
        self.schema = self.__split_line(f.readline())
        self.data = tuple(map(self.__split_line, f.readlines()))
        self.data_size = len(self.data)
        self.schema_size = len(self.schema)
        self.__make_schema_index()
        self.__prepare_ed()

    #def tuple_match_attr(self, t1, t2, attr):
    #    return all(t1[i]==t2[i] for i in attr)

    def crop(self, x):
        return x[1:-1]

    def Ed(self, M):
        Mname = sorted(M).__str__()
        if Mname in self.eds_passed:
            return self.eds[Mname]

        #if self.eds[Mname] != None:
            #print("jiz vypocitano: ", M)
        #    return self.eds[Mname]
        #print("Musim pocitat: ", M)

        # najdu největší vypočítanou množinu S takovou, že S < M
        key = None
        key_l = None
        if len(M)>1:
            for str_i in sorted(self.eds_passed):
                #key_l=ast.literal_eval(str_i)
                key_l = list(map(self.crop, str_i[1:-1].split(", ")))
                if (set(key_l) < set(M)):
                    key = str_i
                    break
        else:
            #print(self.eds.keys())
            key="[]"
            key_l=[]
        #print("key:", key)

        # spočítán si pozice atributů, kontroluju jen ty, které přibyly
        attr_list = [self.schema_index[x] for x in M if x not in key_l]
        # a vytvořím nové třídy kongruence

        classes = [None] * self.data_size

        headers={}
        headers_c=0
        #rozbiju existující kongruence
        for cong_cl in self.eds[key]:
            tmp_size, cong_cl = len(cong_cl), list(cong_cl)
            #cong_cl = list(cong_cl)
            for i in range(tmp_size):
                pos_i = cong_cl[i]
                if classes[pos_i] != None:
                    continue
                #item_i = self.data[pos_i]
                item_i,classes[pos_i], headers[pos_i], headers_c, it_count =self.data[pos_i], pos_i,[pos_i] * tmp_size, headers_c+1, 1
                #headers[pos_i]=set([pos_i])
                #headers_c = headers_c+1

                for j in range(i+1,tmp_size):
                    pos_j = cong_cl[j]

                    if classes[pos_j] != None:
                        continue
                    item_j = self.data[pos_j]
                    # if all(item_i[k]==item_j[k] for k in attr_list):
                    passed = True
                    for k in attr_list:
                        if not (item_i[k]==item_j[k]):
                            passed = False
                            break
                    if passed:
                        classes[pos_j] = pos_i
                        headers[pos_i][it_count] = pos_j
                        it_count = it_count + 1
                #headers[pos_i] = headers[pos_i][:it_count]

        congs = list(map(set, headers.values()))
        self.eds[Mname] = congs
        self.eds_passed.append(Mname)
        return congs

    def __cong_subset_p(self, c1, c2):
        #c2_s = [set(x) for x in c2]
        #každá třída kongruence c1 musí mít nadtřídu v c2
        return all(any(i.issubset(x) for x in c2) for i in c1)

    def Cd(self, M):
        #print("M:",M)
        result = []
        E_M = self.Ed(M)
        for i in self.schema:
            #if set([i]).issubset(M):
            if i in M:
                result.append(i)
            #elif all(any(j.issubset(x) for x in self.Ed([i])) for j in E_M):
            #elif (self.__cong_subset_p(E_M, self.Ed([i]))):
            else:
                has_sub = False
                E_i = self.Ed([i])
                for j in E_M:
                    has_sub = False
                    for x in E_i:
                        if j.issubset(x):
                            has_sub = True
                            break
                    if not has_sub:
                        break
                if has_sub:
                    result.append(i)
        return result

    def powerset(self, lst):
        result = [[]]
        for x in lst:
            result.extend([subset + [x] for subset in result])
        return result

    def dummy_base(self):
        powers = self.powerset(self.schema)
        res = set((frozenset(a), frozenset(self.Cd(a))) for a in powers)
        return res

    def __clos_infty_maker(self, M, T, subsetter):
        M, M_next = set(M), None
        #M_next = None
        while M != M_next:
            M_next, tmp = M, []
            #tmp = []
            for ab in T:
                if subsetter(set(ab[0]), M_next):
                #if set(ab[0]).issubset(M_next):
                    tmp.extend(ab[1])
            M = set(tmp)| M_next
        return list(M)

    def clos_infty(self, M, T):
        return self.__clos_infty_maker(M, T, operator.lt)

    def clos_infty_eq(self, M, T):
        return self.__clos_infty_maker(M, T, operator.le)

    def close_theory(self, theory):
        T_new = set()
        for i in theory:
            dep = (i[0], frozenset(self.clos_infty_eq(i[0], theory)))
            T_new.add(dep)
            #if dep not in T_new:
            #    T_new.add(dep)
        return T_new

    def semantic_provable(self, theory, form):
        return form[1] <= set(self.clos_infty_eq(form[0], theory))

    def minimal_theory(self, theory):
        change = True
        T = self.close_theory(theory)
        while change:
            change = False
            for i in T:
                cmp = T.copy()
                cmp.remove(i)
                if self.semantic_provable(cmp ,i):
                    T = cmp.copy()
                    change = True
                    break
        return T

    def lispify(self, l):
        l_str = l.__str__()
        bra_trans = str.maketrans('[]','()')
        # změň hranaté závorky na kulaté
        lispy_bras =  l_str.translate(bra_trans)
        # zalom řádek za každou funkční závislostí
        liner = re.sub("\)\),", "))\n", lispy_bras)
        # odstraň čárky a apostrofy
        return re.sub(",|'", "", liner)

    def load_lispy_theory(self, text):
        text = re.sub("\n", ",", text)
        text = re.sub(" ", ",", text)
        text = re.sub(",,", ",", text)
        text = re.sub(r"\)\)\).+", ")))", text)
        text = text.translate(str.maketrans('()','[]'))
        text = re.sub(r"\w+", r"'\g<0>'", text)
        return ast.literal_eval(text)

    def load_theory_from_file(self, path):
        f = open(path, 'r')
        cont = f.read()
        f.close()
        return self.load_lispy_theory(cont)

    def schema_from_theory(self, T):
        s = set()
        for x in T:
            s.update(set(x[0])|set(x[1]))
        self.schema = list(s)

    def write(self, cont, path):
        f = open(path, 'w')
        f.write(cont)
        f.write("\n")
        f.close()

    def next_closure(self, cl, M):
        for i in range(self.schema_size-1, -1, -1):
            if self.schema[i] not in M:
                M_less = set(M[j] for j in range(len(M)) if M[j] in self.schema[:i])
                #M_less_set = set(M_less)
                new = cl(list(set([self.schema[i]]) | M_less))
                new_less = set(new[j] for j in range(len(new)) if new[j] in self.schema[:i])
                if new_less ==  M_less:
                    return new
        return None

    def minimal_base(self):
        M, T=[], []
        M_set=set(M)
        #T=[]
        i=0
        schema_set = set(self.schema)
        c=0
        while M_set != schema_set:
            #print("%s M: %s" % (c, M))
            c = c + 1
            cd = self.Cd(M)
            if M_set != set(cd):
                T.append([M, cd])
            M = self.next_closure(lambda x: self.clos_infty(x, T), M)
            M_set = set(M)
        return T

    def __init__(self, path, theory=False):
        if not theory:
            self.__load_relation(path)
        else:
            self.theory = self.load_theory_from_file(path)
            self.schema_from_theory(self.theory)



def help():
    usage = """
    Použití: %s rel ZDROJ CIL -- pro minimální bázi relace
             %s theory ZDROJ CIL -- pro minimální ekvivalentní teorii
    """ % (sys.argv[0], sys.argv[0])
    print(usage)

if __name__ == '__main__':
    if len(sys.argv) != 4:
        help()
        sys.exit(0)
    source, target = sys.argv[2:]
    if not os.path.isfile(source):
        print("Zdrojový soubor %s neexistuje" % source)
        sys.exit(0)
    if sys.argv[1] == "theory":
        db = databaseOperations(source, True)
        min_t = db.minimal_theory(db.frozentify_theory(db.theory))
        min_t_lisp = db.lispify(db.listify_theory(min_t))
        db.write(min_t_lisp, target)
        sys.exit(0)
    if sys.argv[1] == "rel":
        db = databaseOperations(source)
        min_b = db.minimal_base()
        min_b_lisp = db.lispify(db.listify_theory(min_b))
        db.write(min_b_lisp, target)
        sys.exit(0)

    print("nesprávný  argument")
    help()
