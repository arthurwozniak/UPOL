#!/usr/bin/env python3
import random
import numpy
import heapq
from collections import deque


class Node:

    def __init__(self):
        self.Sv = None
        self.M = 0
        self.Right = None
        self.Left = None

    def isLeaf(self):
        return (self.Left is None) and (self.Right is None)

    def __str__(self):
        return "<Node; M: {3}; Sv: {0}; Left: {1}; Right: {2}>".format(self.Sv, self.Left, self.Right, self.M)

    def __repr__(self):
        return "<Node; M: {3}; Sv: {0}; Left: {1}; Right: {2}>".format(self.Sv, self.Left, self.Right, self.M)


class PriorityQueue:

    def __init__(self, size=None):
        self.heap = []
        self.size = size
        self.count = 0

    def push(self, priority, item):
        tmp = (-priority, item)
        heapq.heappush(self.heap, tmp)
        self.count += 1
        if (self.size is not None) and (self.count > self.size):
            heapq.heappop(self.heap)
            self.count -= 1

    def asList(self):
        return [(-x[0], x[1]) for x in sorted(self.heap, reverse=True)]


def distance(x, y):
    return numpy.linalg.norm(x - y)


def makeTree(points):
    #print("Points: %s" % points)
    size = len(points)
    if size == 0:
        return None
    node = Node()
    node.Sv = points.pop(random.randint(0, size - 1))
    #print("Sv: %s" % node.Sv)
    size -= 1
    distances = [distance(x, node.Sv) for x in points]
    #print("Distances: %s" % distances)

    if size == 0:
        return node

    node.M = numpy.median(distances)

    #print("Median: %s" % node.M)
    Sl = []
    Sr = []
    for i, d in enumerate(distances):
        # jak správně prepsat podmínku ze skript? Imho umožňuje vytvořit levý a pravý strom, které budou listy a obsahují stejný prvek
        # medián se bude rovnat vzdálenosti jednoho bodu a tak ten bud bude v
        # Sl i Sr
        if ((d <= node.M)):
            Sl.append(points[i])
        else:
            Sr.append(points[i])
    node.Left = makeTree(Sl)
    node.Right = makeTree(Sr)
    return node


"""
tree    - prohledávaný strom
q       - bod, jehož sousedy hledáme
k       - počet nejbližších sousedů, defaultně neomezeno
tau     - velikost prohledávaného okolí bodu q

return  - seznam dvojic (d, p), kde d je vzdálenost bodu p od q
"""


def knn_search(tree, q, k=None, tau=None):
    print("Searching: %s\nk: %s\ntau: %s" % (q, k, tau))
    if tau is None:
        tau = numpy.inf

    nodestovisit = [tree]
    NN = PriorityQueue(k)

    while len(nodestovisit) > 0:
        node = nodestovisit.pop(0)

        if node is None:
            continue

        # print("Node: %s" % node)
        # print("tau: %s" % tau)

        d = distance(q, node.Sv)

        if d < tau:
            # print("pushing")
            NN.push(d, node.Sv)
            if ((k is not None) and (NN.count == k)):
                tau = -NN.heap[0][0]
            # NN.push(d, node.Sv)

        # listový uzel se dále nekontroluje
        if node.isLeaf():
            continue

        if d < node.M:
            if (d < (node.M + tau)):
                nodestovisit.append(node.Left)
            if (d >= (node.M - tau)):
                nodestovisit.append(node.Right)
        else:
            if (d >= (node.M - tau)):
                nodestovisit.append(node.Right)
            if (d < (node.M + tau)):
                nodestovisit.append(node.Left)

    return NN.asList()

points = []

for i in range(1000):
    points.append(numpy.array(
        (random.random(), random.random(), random.random())))
    # points.append(numpy.array((i)))

tree = makeTree(points.copy())
# print(tree)
res = knn_search(tree, numpy.array((0.5, 0.5, 0.5)), k=10)
print("Result: %s\nResult count: %s" % (res, len(res)))
