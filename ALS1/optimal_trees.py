#!/usr/bin/env python3

import time


class Node():

    def __init__(self, key):
        self.key = key
        self.left = None
        self.right = None


def construct_optimal_tree(i, j):
    if (i == j):
        return None
    n = Node(Keys[r[i][j] - 1])
    n.left = construct_optimal_tree(i, r[i][j] - 1)
    n.right = construct_optimal_tree(r[i][j], j)
    return n


def construct_balanced_tree(i, j):
    if (i >= j) | (j < i):
        return None
    p = (i + j) // 2
    n = Node(Keys[p])
    n.left = construct_balanced_tree(i, p)
    n.right = construct_balanced_tree(p + 1, j)
    return n


def display(root, padding):
    if (root is None):
        return
    display(root.right, padding + 1)
    print("%s%s" % (padding * "\t", root.key))
    display(root.left, padding + 1)


def find(root, val):
    if val < root.key:
        if root.left is not None:
            return find(root.left, val)
        else:
            return None
    elif val > root.key:
        if root.right is not None:
            return find(root.right, val)
        else:
            return None
    return root


def merge_probabilities():
    M = []
    for i in range(len(P)):
        M.append(Q[i])
        M.append(P[i])
    M.append(Q[i])
    print("Delka M: %d" % len(M))
    return M


def perform_search(tree, probs):
    ratio = 3
    i = 1
    for p in probs:
        p = p * ratio
        while p > 0:
            find(tree, i)
            p -= 1
        i += 1

P = (5, 1, 2, 0, 4, 3, 2, 2, 2, 3, 4, 0, 3, 3, 3, 3, 2, 4, 2, 1, 5, 3, 3, 4, 2, 5, 3, 0, 4, 4, 0, 3, 1, 1, 2, 0, 3, 1,
     5, 1, 2, 3, 0, 1, 3, 4, 0, 3, 5, 2, 5, 0, 0, 0, 2, 2, 3, 2, 4, 0, 3, 1, 3, 5, 1, 0, 4, 0, 1, 3, 5, 3, 4, 0, 5, 3,
     3, 0, 4, 2, 5, 4, 4, 1, 1, 0, 0, 2, 2, 4, 3, 2, 2, 0, 5, 1, 0, 0, 0, 1, 0, 1, 1, 1, 3, 4, 1, 1, 2, 2, 5, 4, 2, 3,
     5, 3, 3, 4, 2, 0, 4, 0, 2, 3, 0, 4, 5, 3, 3, 4, 4, 2, 0, 1, 3, 0, 1, 0, 4, 3, 4, 4, 2, 2, 3, 4, 5, 0, 3, 0, 3, 3,
     4, 5, 2, 1, 2, 4, 3, 5, 1, 5, 5, 0, 3, 0, 4, 0, 3, 2, 3, 1, 2, 3, 1, 4, 1, 5, 1, 0, 3, 0, 2, 5, 3, 1, 0, 4, 3, 4,
     1, 3, 0, 0, 5, 0, 5, 3, 1, 5, 4, 1, 3, 3, 3, 5, 3, 2, 3, 1, 0, 1, 1, 0, 4, 5, 5, 5, 3, 5, 1, 1, 2, 0, 4, 4, 5, 0,
     0, 1, 3, 2, 2, 0, 4, 1, 2, 3, 2, 0, 5, 1, 2, 5, 2, 5, 0, 4, 3, 5, 5, 3, 2, 2, 0, 3, 3, 1, 4, 1, 0, 4, 3, 0, 1, 3,
     0, 2, 3, 5, 3, 2, 2, 4, 4, 3, 4, 0, 1, 1, 0, 4, 1, 1, 1, 5, 2, 1, 1, 1, 4, 0, 1, 3, 1, 3, 0, 3, 5, 3, 0, 5, 4, 5,
     3, 4, 3, 3, 5, 5, 4, 2, 5, 5, 0, 5, 0, 1, 400, 3, 3, 1, 0, 5, 2, 0, 1, 1, 2, 0, 1, 5, 0, 5, 2, 3, 0, 1, 0, 5, 3, 5,
     4, 4, 5, 0, 0, 5, 1, 4, 1, 5, 5, 4, 5, 5, 3, 1, 0, 4, 4, 3, 4, 2, 3, 0, 3, 4, 0, 5, 5, 2, 2, 4, 2, 0, 4, 4, 1, 3,
     2, 1, 0, 4, 4, 3, 2, 2, 2, 0, 4, 1, 5, 4, 5, 1, 2, 0, 5, 4, 4, 0, 4, 0, 2, 5, 3, 2, 2, 1, 5, 3, 0, 2, 5, 2, 2, 1,
     4, 2, 3, 3, 4, 3, 5, 0, 2, 0, 1, 3, 0, 0, 2, 2, 5, 1, 2, 3, 0, 5, 3, 0, 4, 3, 1, 5, 2, 3, 5, 3, 2, 1, 2, 4, 4, 2,
     0, 5, 3, 1, 0, 2, 1, 4, 5, 1, 3, 3, 4, 4, 5, 0, 1, 4, 4, 5, 2, 1, 1, 0, 1, 3, 2, 3, 2, 1, 0, 1, 0, 4, 5, 1, 4, 4,
     3, 1, 2, 1, 0, 1, 3, 4, 5, 4, 5, 3, 5, 0, 5, 2, 1, 5, 1, 0, 1, 0, 5, 1, 0, 3, 4, 3, 5, 1, 3, 5, 5, 3, 1, 4, 2, 0,
     3, 1, 0, 4, 2, 4, 2, 0, 1, 1, 3, 2, 2, 0, 5, 1, 2, 0, 5, 2, 4, 3, 3, 1, 0, 4, 3, 5, 3, 2, 5, 3, 2, 2, 3, 2, 1, 5,
     0, 3, 0, 2, 0, 1, 2, 4, 4, 5, 3, 0, 0, 1, 4, 5, 0, 3, 2, 1, 4, 5, 1, 0, 4, 1, 5, 2, 3, 2, 3, 5, 1, 3, 5, 2, 5, 1,
     2, 1, 3, 0, 4, 3, 2, 3, 5, 1, 3, 1, 5, 5, 3, 2, 5, 4, 3, 1, 2, 0, 3, 0, 5, 2, 3, 4, 3, 3, 1, 4, 1, 0, 3, 0, 3, 2,
     3, 5, 2, 4, 0, 4, 3, 5, 3, 4, 3, 0, 3, 5, 2, 2, 0, 2, 3, 3, 4, 0, 4, 0, 4, 3, 1, 1, 3, 2, 2, 5, 3, 1, 3, 4, 1, 2,
     5, 0, 1, 5, 0, 2, 3, 1, 1, 2, 4, 1, 4, 3, 5, 4, 2, 2, 3, 1, 4, 5, 5, 4, 3, 5, 2, 0, 5, 2, 3, 3, 2, 0, 4, 1, 1, 5,
     2, 2, 0, 0, 2, 5, 2, 1, 0, 2, 2, 3, 3, 3, 3, 5, 2, 2, 1, 3, 1, 3, 2, 3, 3, 2, 4, 3, 3, 5, 0, 4, 4, 4, 0, 4, 1, 2,
     4, 0, 5, 0, 5, 1, 2, 4, 0, 0, 4, 4, 1, 4, 0, 5, 0, 0, 4, 0, 0, 0, 4, 5, 0, 1, 2, 2, 4, 5, 1, 5, 2, 0, 5, 4, 5, 3,
     1, 3, 3, 0, 4, 3, 3, 3, 5, 4, 5, 0, 2, 2, 0, 3, 3, 2, 5, 5, 3, 0, 5, 5, 3, 3, 4, 2, 4, 1, 3, 4, 4, 5, 4, 2, 2, 0,
     1, 2, 2, 0, 1, 5, 4, 4, 0, 2, 5, 4, 1, 2, 0, 0, 5, 1, 2, 4, 0, 5, 3, 4, 1, 0, 5, 1, 1, 0, 4, 3, 5, 1, 3, 0, 5, 0,
     5, 4, 4, 5, 2, 2, 3, 4, 1, 5, 4, 4, 5, 300, 2, 4, 4, 1, 3, 3, 1, 4, 4, 3, 4, 0, 4, 0, 3, 5, 4, 1, 4, 5, 0, 3, 3, 1,
     1, 2, 2, 3, 2, 2, 5, 4, 1, 1, 5, 5, 3, 3, 4, 4, 0, 2, 3, 5, 5, 5, 4, 5, 3, 1, 1, 0, 1, 2, 0, 5, 5, 0, 2, 0, 4, 2,
     2, 3, 0, 3, 3, 5, 2, 3, 3, 4, 5, 0, 0, 4, 5, 1, 0, 1, 2, 5, 2, 0, 1, 0, 4, 1, 2, 2, 2, 5, 1, 1, 4, 1, 3, 5, 3, 4,
     5, 5, 4, 3, 0, 2, 1, 3, 0, 3, 0, 2000)

Q = (5, 10000, 2, 0, 4, 3, 2, 2, 2, 3, 4, 0, 3, 3, 3, 3, 2, 4, 2, 1, 5, 3, 3, 4, 2, 5, 3, 0, 4, 4, 0, 3, 1, 1, 2, 0, 3, 1,
     5, 1, 2, 3, 0, 1, 3, 4, 0, 3, 5, 2, 5, 0, 0, 0, 2, 2, 3, 2, 4, 0, 3, 1, 3, 5, 1, 0, 4, 0, 1, 3, 5, 3, 4, 0, 5, 3,
     3, 0, 4, 2, 5, 4, 4, 1, 1, 0, 0, 2, 2, 4, 3, 2, 2, 0, 5, 1, 0, 0, 0, 1, 0, 1, 1, 1, 3, 4, 1, 1, 2, 2, 5, 4, 2, 3,
     5, 3, 3, 4, 2, 0, 4, 0, 2, 3, 0, 4, 5, 3, 3, 4, 4, 2, 0, 1, 3, 0, 1, 0, 4, 3, 4, 4, 2, 2, 3, 4, 5, 0, 3, 0, 3, 3,
     4, 5, 2, 1, 2, 4, 3, 5, 1, 5, 5, 0, 3, 0, 4, 0, 3, 2, 3, 1, 2, 3, 1, 4, 1, 5, 1, 0, 3, 0, 2, 5, 3, 1, 0, 4, 3, 4,
     1, 3, 0, 0, 5, 0, 5, 3, 1, 5, 4, 1, 3, 3, 3, 5, 3, 2, 3, 1, 0, 1, 1, 0, 4, 5, 5, 5, 3, 5, 1, 1, 2, 0, 4, 4, 5, 0,
     0, 1, 3, 2, 2, 0, 4, 1, 2, 3, 2, 0, 5, 1, 2, 5, 2, 5, 0, 4, 3, 5, 5, 3, 2, 2, 0, 3, 3, 1, 4, 1, 0, 4, 3, 0, 1, 3,
     0, 2, 3, 5, 3, 2, 2, 4, 4, 3, 4, 0, 1, 1, 0, 4, 1, 1, 1, 5, 2, 1, 1, 1, 4, 0, 1, 3, 1, 3, 0, 3, 5, 3, 0, 5, 4, 5,
     3, 4, 3, 3, 5, 5, 4, 2, 5, 5, 0, 5, 0, 1, 4, 3, 3, 1, 0, 5, 2, 0, 1, 1, 2, 0, 1, 5, 0, 5, 2, 3, 0, 1, 0, 5, 3, 5,
     4, 4, 5, 0, 0, 5, 1, 4, 1, 5, 5, 4, 5, 5, 3, 1, 0, 4, 4, 3, 4, 2, 3, 0, 3, 4, 0, 5, 5, 2, 2, 4, 2, 0, 4, 4, 1, 3,
     2, 1, 0, 4, 4, 3, 2, 2, 2, 0, 4, 1, 5, 4, 5, 1, 2, 0, 5, 4, 4, 0, 4, 0, 2, 5, 3, 2, 2, 1, 5, 3, 0, 2, 5, 2, 2, 1,
     4, 2, 3, 3, 4, 3, 5, 0, 2, 0, 1, 3, 0, 0, 2, 2, 5, 1, 2, 3, 0, 5, 3, 0, 4, 3, 1, 5, 2, 3, 5, 3, 2, 1, 2, 4, 4, 2,
     0, 5, 3, 1, 0, 2, 1, 4, 5, 1, 3, 3, 4, 4, 5, 0, 1, 4, 4, 5, 2, 1, 1, 0, 1, 3, 2, 3, 2, 1, 0, 1, 0, 4, 5, 1, 4, 4,
     3, 1, 2, 1, 0, 1, 3, 4, 5, 4, 5, 3, 5, 0, 5, 2, 1, 5, 1, 0, 1, 0, 5, 1, 0, 3, 4, 3, 5, 1, 3, 5, 5, 3, 1, 4, 2, 0,
     3, 1, 0, 4, 2, 4, 2, 0, 1, 1, 3, 2, 2, 0, 5, 1, 2, 0, 5, 2, 4, 3, 3, 1, 0, 4, 3, 5, 3, 2, 5, 3, 2, 2, 3, 2, 1, 5,
     0, 3, 0, 2, 0, 1, 2, 4, 4, 5, 3, 0, 0, 1, 4, 5, 0, 3, 2, 1, 4, 5, 1, 0, 4, 1, 5, 2, 3, 2, 3, 5, 1, 3, 5, 2, 5, 1,
     2, 1, 3, 0, 4, 3, 2, 3, 5, 1, 3, 1, 5, 5, 3, 2, 5, 4, 3, 1, 2, 0, 3, 0, 5, 2, 3, 4, 3, 3, 1, 4, 1, 0, 3, 0, 3, 2,
     3, 5, 2, 4, 0, 4, 3, 5, 3, 4, 3, 0, 3, 5, 2, 2, 0, 2, 3, 3, 4, 0, 4, 0, 4, 3, 1, 1, 3, 2, 2, 5, 3, 1, 3, 4, 1, 2,
     5, 0, 1, 5, 0, 2, 3, 1, 1, 2, 4, 1, 4, 3, 5, 4, 2, 2, 3, 1, 4, 5, 5, 4, 3, 5, 2, 0, 5, 2, 3, 3, 2, 0, 4, 1, 1, 5,
     2, 2, 0, 0, 2, 5, 2, 1, 0, 2, 2, 3, 3, 3, 3, 5, 2, 2, 1, 3, 1, 3, 2, 3, 3, 2, 4, 3, 3, 5, 0, 4, 4, 4, 0, 4, 1, 2,
     4, 0, 5, 0, 5, 1, 2, 4, 0, 0, 4, 4, 1, 4, 0, 5, 0, 0, 4, 0, 0, 0, 4, 5, 0, 1, 2, 2, 4, 5, 1, 5, 2, 0, 5, 4, 5, 3,
     1, 3, 3, 0, 4, 3, 3, 3, 5, 4, 5, 0, 2, 2, 0, 3, 3, 2, 5, 5, 3, 0, 5, 5, 3, 3, 4, 2, 4, 1, 3, 4, 4, 5, 4, 2, 2, 0,
     1, 2, 2, 0, 1, 5, 4, 4, 0, 2, 5, 4, 1, 2, 0, 0, 5, 1, 2, 4, 0, 5, 3, 4, 1, 0, 5, 1, 1, 0, 4, 3, 5, 1, 3, 0, 5, 0,
     5, 4, 4, 5, 2, 2, 3, 4, 1, 5, 4, 4, 5, 3, 2, 4, 4, 1, 3, 3, 1, 4, 4, 3, 4, 0, 4, 0, 3, 5, 4, 1, 4, 5, 0, 3, 3, 1,
     1, 2, 2, 3, 2, 2, 5, 4, 1, 1, 5, 5, 3, 3, 4, 4, 0, 2, 3, 5, 5, 5, 4, 5, 3, 1, 1, 0, 1, 2, 0, 5, 5, 0, 2, 0, 4, 2,
     2, 3, 0, 3, 3, 5, 2, 3, 3, 4, 5, 0, 0, 4, 5, 1, 0, 1, 2, 5, 2, 0, 1, 0, 4, 1, 2, 2, 2, 5, 1, 1, 4, 1, 3, 5, 3, 4,
     5, 5, 4, 3, 0, 2, 1, 3, 0, 3, 0, 2, 1)


Keys = [2 * x for x in range(1, 1001)]
#
# P = (4, 1, 2, 2, 6)
#
# Q = (1, 1, 1, 3, 2, 1)
#
# Keys = [1, 2, 3, 4, 5]
#
#
# P = (1, 5, 2, 2, 1)
#
# Q = (3, 1, 3, 1, 2, 1)
#
# Keys = [x for x in range(1, 6)]
#
N = len(P)

print("velikost P: %s" % len(P))
print("velikost Q: %s" % len(Q))

c = [[0 for i in range(N + 1)] for j in range(N + 1)]
w = [[0 for i in range(N + 1)] for j in range(N + 1)]
r = [[0 for i in range(N + 1)] for j in range(N + 1)]

for i in range(N + 1):
    c[i][i] = 0
    w[i][i] = Q[i]
    for j in range(i + 1, N + 1):
        w[i][j] = w[i][j - 1] + P[j - 1] + Q[j]

for j in range(1, N + 1):
    c[j - 1][j] = w[j - 1][j]
    r[j - 1][j] = j

for d in range(2, N + 1):
    for j in range(d, N + 1):
        i = j - d
        tmp = [(c[i][k - 1] + c[k][j])
               for k in range(r[i][j - 1], r[i + 1][j] + 1)]
        m = min(tmp)
        c[i][j] = w[i][j] + m
        r[i][j] = r[i][j - 1] + tmp.index(m)

# tisk matic, kdyžtak upravit na for i in (c, w, r)...
for i in ([]):
    for j in i:
        print(j)

    print("===")


tree_balanced = construct_balanced_tree(0, len(Keys))
tree_optimal = construct_optimal_tree(0, len(Keys))

l_balanced = merge_probabilities()
l_optimal = l_balanced.copy()


t1 = time.time()
perform_search(tree_balanced, l_balanced)
t2 = time.time()
btime = t2 - t1
print("Balanced tree search: %.3f" % btime)

t1 = time.time()
perform_search(tree_optimal, l_optimal)
t2 = time.time()
otime = t2 - t1
print("Optimal tree search: %.3f" % otime)

print("Ratio optimal/balanced: %.3f" % (otime / btime))
