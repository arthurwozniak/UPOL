#!/usr/bin/env python3
import os
from math import log, inf
import random
import uuid
import time

BASE = os.path.dirname(os.path.realpath(__file__))

dom = [['democrat', 'republican']] + 16 * [['y', 'n', '?']]


class Node:
    attr = None
    children = []
    parent = None

    def is_leaf(self):
        return len(self.children) == 0

    def is_root(self):
        return self.parent is None

    def get_all_subtrees(self):
        all_trees = []
        if self.is_leaf():
            return all_trees
        for i in self.children:
            if not i[1].is_leaf():
                all_trees.append(i[1])
            all_trees.extend(i[1].get_all_subtrees())
        return all_trees

    def get_leaves(self):
        all_trees = []
        if self.is_leaf():
            return all_trees
        for i in self.children:
            if i[1].is_leaf():
                all_trees.append(i[1])
            all_trees.extend(i[1].get_leaves())
        return all_trees

    def copy(self):
        new = Node(self.attr)
        new.id = self.id
        children = []
        for i in self.children:
            child = i[1].copy()
            child.parent = new
            children.append([i[0], child])
        new.children = children
        return new

    def __init__(self, attr=None):
        self.attr = attr
        #self.id = uuid.uuid4()
        self.id = time.time()

    def __str__(self, level=0):
        ret = "id: {0}; attr: {1}\n".format(self.id, self.attr)
        level += 1
        for child in self.children:
            ret += (level - 1) * "\t" + "|" + "-" * 3 + str(child[0])
            ret += " -> "
            ret += child[1].__str__(level + 1)
        return ret

    def __repr__(self):
        return "Attr: {0}".format(self.attr)


def filterByValue(S, attr, val):
    for i in S:
        if i[attr]==val:
            yield i

def H(y, S):
    acc = 0.0
    S_size = len(S)
    if S_size == 0:
        return 0
    for i in dom[y]:
        filtered = list(filterByValue(S, y, i))
        ratio = float(len(filtered) / S_size)
        if ratio == 0:
            continue
        acc += -(ratio * log(ratio, 2))
    return acc


def information_gain(a_i, S, target_attr):
    acc = H(target_attr, S)
    S_size = len(S)
    for i in dom[a_i]:
        filtered = list(filterByValue(S, a_i, i))
        ratio = float(len(filtered) / S_size)
        acc -= ratio * H(target_attr, filtered)
    return acc


def gain_ratio(a_i, S, target_attr):
    denominator = H(a_i, S)
    if denominator == 0:
        return -inf
    return information_gain(a_i, S, target_attr) / denominator


def build_tree(S, A, y):
    T = Node()
    A = A[:]  # copy A due to mutable lists
    vals = [x[y] for x in S]
    if (len(S) == 0):
        print("fail")
        return T
    elif (len(A) <= 1) or (len(set(vals)) == 1):
        T.attr = max(vals, key=vals.count)
        return T

    ratios = [gain_ratio(x, S, y) for x in A]
    division_attr_index = ratios.index(max(ratios))
    division_attr = A[division_attr_index]
    T.attr = division_attr
    # remove division attribute from next tree
    A.remove(division_attr)
    children = []
    # create subtree for each outcome of division_attr
    for i in dom[division_attr]:
        S_restricted = list(filterByValue(S, division_attr, i))
        if S_restricted:
            subtree = build_tree(S_restricted, A, y)
            subtree.parent = T
            children.append([i, subtree])
    T.children = children
    return T


def prune(T, t):
    leafs = t.get_leaves()
    targets = [x.attr for x in leafs]
    res = max(sorted(targets), key=targets.count)

    T_subtrees = T.get_all_subtrees()
    # Node to be pruned off
    T_pruned = next(filter(lambda x: x.id == t.id, T_subtrees))
    parent = T_pruned.parent
    for i in parent.children:
        node = i[1]
        if node.attr == t.attr:
            node.attr = res
            del(node.children)
            node.children = []
            return T


def prunning(S, T, y, valid_data):
    """
    S - training set
    T - tree
    y - target attribute
    valid_data - validation data
    """
    trees = [T]
    # until last tree in 'trees' is not root
    while len(trees[-1].children) != 0:
        origin_acc = error_rate(trees[-1], S, y)
        origin_leafs_count = len(trees[-1].get_leaves())
        # last_subtrees = [prune(copy.deepcopy(trees[-1]), x)
        last_subtrees = [prune(trees[-1].copy(), x)
                         for x in trees[-1].get_all_subtrees()]
        if not last_subtrees:
            break
        tmp = min(last_subtrees,
                  key=lambda x: (((len(x.get_leaves()) < origin_leafs_count) and ((error_rate(x, S, y) - origin_acc) /
                                                                                  (origin_leafs_count - len(x.get_leaves())), node_count(x), x.id)) or (inf, inf)))
        trees.append(tmp)
    return min(trees, key=lambda x: (error_rate(x, valid_data, y), node_count(x)))


def clasify(tree, row):
    if not tree.children:
        return tree.attr
    attr = row[tree.attr]
    # check for transitions
    for i in tree.children:
        if attr == i[0]:
            return clasify(i[1], row)
    res = [clasify(x[1], row) for x in tree.children]
    return max(sorted(res), key=res.count)


def success_rate(tree, data, y):
    errors = 0
    data_size = 0
    for row in data:
        data_size += 1

        if row[y] != clasify(tree, row):
            errors += 1
    #data_size = len(data)
    return (data_size - errors) / data_size


def error_rate(tree, data, y):
    return 1 - success_rate(tree, data, y)


def divide_dataset(data, y, n):
    data = data[:]
    folds = []
    # stratification workaround for this specific case (target = [republican,
    # democrat])
    random.shuffle(data)
    data.sort(key=lambda x: x[y])

    for i in range(n):
        folds.append([])
    c = 0
    size = len(data)
    for i in range(size):
        folds[c % n].append(data.pop())
        c += 1
    return folds


def n_fold_verify(data, y, attrs, n, prune=False):
    print(28 * "-")
    print("n-fold success rate for n=%s" % n)
    folds = divide_dataset(data, y, n)
    avg = 0.
    avg_pruned = 0.
    count = 0
    count_pruned = 0
    for i in range(n):
        test = folds[i]
        train = []
        for j in range(n):
            if j != i:
                train += folds[j]
        tree = build_tree(train, attrs, y)
        avg += success_rate(tree, test, y)
        count += node_count(tree)
        if prune:
            tree = prunning(train, tree, y, test)
            count_pruned += node_count(tree)
            avg_pruned += success_rate(tree, test, y)

    print("Average unprunned tree success rate: %s" % (avg / n))
    print("Average unprunned tree node count: %s" % (count / n))
    if prune:
        print("Average prunned tree success rate: %s" % (avg_pruned / n))
        print("Average prunned tree node count: %s" % (count_pruned / n))
    print(28 * "-")


def node_count(tree):
    count = 1
    for i in tree.children:
        count += node_count(i[1])
    return count

data_file = open(os.path.join(BASE, "house-votes-84.data.txt"), 'r')
lines = data_file.read().splitlines()
data = [x.split(",") for x in lines]

target = 0
attrs = list(range(len(dom)))
attrs.remove(target)

random.shuffle(data)


t = [[], []]
data2 = data[:]
random.shuffle(data2)
data2.sort(key=lambda x: x[target])
c = 0
while c < len(data2) - 1:
    t[(c % 3) % 2].append(data2.pop())
    c += 1


tree = build_tree(data, attrs, target)
print(tree)
print("Tree node count")
print(node_count(tree))
print("Verification success rate")
print(success_rate(tree, data, target))
for i in range(0):
    n_fold_verify(data, target, attrs, 10)

print("Tree with prunning")
# acc = 0
# ran = 200
# for i in range(ran):
#     t = [[], []]
#     data2 = data[:]
#     random.shuffle(data2)
#     data2.sort(key=lambda x: x[target])
#     c = 0
#     while c < len(data2) - 1:
#         t[(c % 3) % 2].append(data2.pop())
#         c += 1
#     tree = build_tree(t[0], attrs, target)
#     tree = prunning(t[0], tree, target, t[1])
#     acc += node_count(tree)
# print(acc / ran)
tree = build_tree(t[0], attrs, target)
tree = prunning(t[0], tree, target, t[1])
print("Pruned tree node count")
print(node_count(tree))
print("Pruned tree verification success rate")
print(success_rate(tree, data, target))
for i in range(1):
    n_fold_verify(data, target, attrs, 3, prune=True)

print(tree)

# tree.copy()
