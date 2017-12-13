#!/usr/bin/env python3

import os

BASE = os.path.dirname(os.path.realpath(__file__))

DIGIT = 0

Q = {1: {DIGIT: 2,
         ".": 7},
     2: {DIGIT: 2,
         ",": 3,
         ".": 7,
         "e": 8},
     3: {DIGIT: 4},
     4: {DIGIT: 5},
     5: {DIGIT: 6},
     6: {DIGIT: 4,
         ",": 3,
         ".": 7,
         "e": 8,
         "E": 8},
     7: {DIGIT: 7,
         "e": 8,
         "E": 8},
     8: {"+": 9,
         "-": 9,
         DIGIT: 10},
     9: {DIGIT: 10},
     10: {DIGIT: 10}}

F = {2, 6, 7, 10}


def verify(string):
    current = 1
    for i in string:
        # print("symbol: {0}; stav: {1}".format(i, current))
        if i.isdigit():
            i = DIGIT
        if i in Q[current]:
            current = Q[current][i]
        else:
            return False
    return current in F


def test_pos():
    print("Test POS")
    pos_file = open(os.path.join(BASE, "POS.txt"), 'r')
    pos = pos_file.read().splitlines()
    for i in pos:
        i = i
        if not verify(i):
            print(i)


def test_neg():
    print("Test NEG")
    neg_file = open(os.path.join(BASE, "NEG.txt"), 'r')
    neg = neg_file.read().splitlines()
    for i in neg:
        i = i
        if verify(i):
            print(i)

test_pos()
test_neg()
