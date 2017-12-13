#!/usr/bin/env python3
import os
from orangecontrib.associate.fpgrowth import *
from math import sqrt


BASE = os.path.dirname(os.path.realpath(__file__))
datafile = "house-votes-84.data.txt"


def load_data(filepath):
    result = []
    file = open(os.path.join(BASE, filepath))
    for i in file.readlines():
        tmp = []
        for j in i.split(",")[1:]:
            tmp.append(int(j == "y"))
            tmp.append(int(j == "n"))
        indexes = [i for i, x in enumerate(tmp) if x == 1]
        result.append(indexes)
    return result

data = load_data(datafile)
itemset = dict(frequent_itemsets(data, .3))
rules = association_rules(itemset, .9)
rules = list(rules)
stats = list(rules_stats(rules, itemset, len(data[0])))
"""
output of stats:
atecedent (frozenset) – The LHS of the association rule.
consequent (frozenset) – The RHS of the association rule.
support (int) – Support as an absolute number of instances.
confidence (float) – The confidence percent, calculated as: total_support / lhs_rupport.
coverage (float) – Calculated as: lhs_support / n_examples
strength (float) – Calculated as: rhs_support / lhs_examples
lift (float) – Calculated as: n_examples * total_support / lhs_support / rhs_support
leverage (float) – Calculated as: (total_support * n_examples - lhs_support * rhs_support) / n_examples**2
"""
r_count = len(rules)
d_count = len(data)

for stat in stats:
    lhs = sorted(list(stat[0]))
    # number of instances / number of rows
    l_support = itemset[stat[0]] / d_count
    r_support = itemset[stat[1]] / d_count
    support = stat[2] / d_count
    rhs = sorted(list(stat[1]))
    lift = support / (l_support * r_support)
    IS = support / sqrt(l_support * r_support)
    correlation = (support - l_support * r_support) / \
        (sqrt(l_support * r_support * (1 - l_support) * (1 - r_support)))
    print("{0} => {1}; lift: {2:.5f}; correlation: {3:.5f}; IS: {4:.5f}".format(
        lhs, rhs, lift, correlation, IS))
