#!/usr/bin/env python3
import re


def split_line(line):
    return re.sub('"|\n', '', line).split(",")


def get_func_indexes(schema, func):
    return [[schema.index(x) for x in func[y]] for y in range(2)]

def FuncDep(filepath, func):
    schema, data = load_relation(filepath)
    indexes = get_func_indexes(schema, func)

    if len(data) == 0:
        return True

    for i in range(len(data) - 1):
        for j in range(i, len(data)):
            eq = True
            for k in range(len(indexes[0])):
                if data[i][indexes[0][k]] != data[j][indexes[0][k]]:
                    eq = False
                    break
            if not eq:
                continue
            for k in range(len(indexes[1])):
                if data[i][indexes[1][k]] != data[j][indexes[1][k]]:
                    return False
    return True

def KanonickyRozklad(filepath):
    schema, data = load_relation(filepath)
    schema_size = len(schema)
    data_size = len(data)
    result = []

    for i in range(data_size):
        for j in range(i, data_size):
            tmp = []
            for k in range(schema_size):
                if data[i][k] == data[j][k]:
                    tmp.append(schema[k])
            result.append(tmp)

    result.sort(key=lambda x: (len(x), x.__str__()))

    for i in result:
        while result.count(i) > 1:
            result.pop(result.index(i))
    return result

def is_subset(m1, m2):
    for i in m1:
        if not m2.__contains__(i):
            return False
    return True

def set_equal(m1, m2):
    if is_subset(m1, m2) & is_subset(m2, m1):
        return True
    return False

def is_edge_subset(m1, m2):
    if is_subset(m1, m2) & (len(m1) < len(m2)):
        return True
    return False

def join_sets(s1, s2):
    tmp = s2.copy()
    for i in s1:
        if not tmp.__contains__(i):
            tmp.append(i)
    return tmp

def unique_list(l):
    l = l.copy()
    for i in l:
        while l.count(i) > 1:
            l.pop(l.index(i))
    return l

def closure(t, m):
    stable = False
    while not stable:
        stable = True
        for ab in t:
            if is_subset(ab[0], m):
                m = join_sets(m, ab[1])
                stable = False
                t.pop(t.index(ab))
    return m


def closure_test():
    t = [[["a"], ["a", "b"]],
         [["a"], ["c"]],
         [["a", "c"], ["b"]]]
    m = ["a"]
    print(closure(t, m))


def dep_test():
    tests = [[["a", "b"], ["b", "c"]],
             [["b"], ["c"]],
             [["a", "c"], ["b", "c"]],
             [["c"], ["a", "b", "c"]]]
    for item in tests:
        print(FuncDep("/home/kamil/Dropbox/UPOL/6semestr/DATA2/data.csv",
                      item))


def roz_test():
    foo = KanonickyRozklad("/home/kamil/Dropbox/UPOL/6semestr/DATA2/data2.csv")
    bar = KanonickyRozklad("/home/kamil/Dropbox/UPOL/6semestr/DATA2/data3.csv")
    print("%s\n%s" % (foo, bar))


def tuple_match_attr(t1, t2, attr, schema):
    for i in attr:
        pos = schema.index(i)
        return t1[pos] == t2[pos]
    return True

def load_relation(filepath):
    f = open(filepath, 'r')
    schema = split_line(f.readline())
    data = list(map(split_line, f.readlines()))
    return (schema, data)

def Ed(schema, data, M):
    result = []
    for i in [(t1,t2) for t1 in data for t2 in data]:
            if tuple_match_attr(i[0], i[1], M, schema):
                result.append(i)

    return unique_list(result)

def Cd(schema, data, M):
    result = []
    for i in schema:
        if is_subset(Ed(schema, data, M),
                     Ed(schema, data, [i])):
            result.append(i)
    return result

def make_powerset(lst):
    result = [[]]
    for x in lst:
        result.extend([subset + [x] for subset in result])
    return result


def Pd(schema, data):
    result = []
    pows = make_powerset(schema)
    for i in pows:
        if i == Cd(schema, data, i):
            continue
        if not result:
            result.append(i)
        for j in result:
            if not is_edge_subset(j, i):
                continue
            if is_subset(Cd(schema, data, j), i):
                result.append(i)
    return result


def Ed_test():
    path = "/home/kamil/Dropbox/UPOL/6semestr/DATA2/data.csv"
    schema, data = load_relation(path)
    resEd = Ed(schema, data, [])
    print(resEd)
    print(len(resEd))


def Cd_test():
    path = "/home/kamil/Dropbox/UPOL/6semestr/DATA2/data.csv"
    schema, data = load_relation(path)
    resCd = Cd(schema, data, ["a", "b"])
    print(resCd)

def Pd_test():
    path = "/home/kamil/Dropbox/UPOL/6semestr/DATA2/real_data.csv"
    schema, data = load_relation(path)
    resPd = Pd(schema, data)
    print("Pd result: ")
    print(resPd)


def clos_infty(M,T):
    M_next = M
    M = None
    while M != M_next:
        M = M_next
        tmp = []
        for ab in T:
            if is_edge_subset(ab[0], M) and ab in T:
                tmp.extend(ab[1])
        M_next = join_sets(tmp, M)

    return M

def clos(t):
    return lambda M: clos_infty(M, t)

def next_closure(cl, M, schema):
    n = len(schema)
    for i in range(n-1, -1, -1):
        if schema[i] not in M:
            M_less = [M[j] for j in range(len(M)) if M[j] in schema[:i]]
            new = cl(join_sets([schema[i]], M_less))
            new_less = [new[j] for j in range(len(new)) if new[j] in schema[:i]]
            if set_equal(new_less, M_less):
                return new
    return None

def minimum_base(path):
    schema, data = load_relation(path)
    M=[]
    T=[]
    while not set_equal(M, schema):
        if not set_equal(M, Cd(schema, data, M)):
            T.append([M, Cd(schema, data, M)])
        M = next_closure(clos(T), M, schema)
    return T

def minimum_base_test():
    path = "/home/kamil/Dropbox/UPOL/6semestr/DATA2/real_data.csv"
    print(minimum_base(path))



dep_test()
roz_test()
print("Closure test")
closure_test()
print("Ed test")
Ed_test()
Cd_test()
Pd_test()
print("Minimum base test")
minimum_base_test()
