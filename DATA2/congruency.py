#!/usr/bin/env python3
from time import time
import random

def test_eql(a,b):
    return ((a%3) == (b%3))

def test_eql2(a,b):
    return (((a%3) == (b%3)) and
            ((a%5) == (b%4)))

def make_cong(l,eq_op):
    size = len(l)
    classes = [None] * size

    headers={}
    headers_c=0
    cmp = 0
    for i in range(size):
        if classes[i] == None:
            classes[i]=i
            headers[i]=headers_c
            headers_c = headers_c+1
        for j in range(i+1,size):
            if classes[j] != None:
                continue
            cmp = cmp+1
            if eq_op(l[i], l[j]):
                classes[j] = i
    congs = [set([l[x]]) for x in headers]
    for i in range(size):
        congs[headers[classes[i]]].add(l[i])
    #print(cmp)
    return congs

#my_l = [(lambda i: random.randint(1, 100000))(x) for x in range(13000)]
my_l = list(range(1,11))
#my_l.append(3)
#print("my_l: ", my_l)
c1 = make_cong(my_l, test_eql)
c2 = make_cong(my_l, test_eql2)

print(c1)
print(c2)

#print(make_cong(my_l))
