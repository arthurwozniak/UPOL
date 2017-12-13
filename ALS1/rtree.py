#!/usr/bin/python3
from tkinter import *
import random

colors = ["", "coral", "turquoise", "peru", "violet", "magenta", "green"]

class Point:

    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def __str__(self):
        return "<Point; x: {0}, y: {1}>".format(self.x, self.y)

    def __repr__(self):
        return "<Point; x: {0}, y: {1}>".format(self.x, self.y)


class IndexRecord:

    def __init__(self, p):
        # id nebo potomek
        self.p = p
        # ohraničující obdélník
        if (type(p) == str):
            self.rect = None
        else:
            self.rect = rectForItems(self.p.items)

    def __str__(self):
        return "<IndexRecord: {0}>".format(self.p)

    def __repr__(self):
        return "<IndexRecord: {0}>".format(self.p)


class Node:

    minCount = 1
    maxCount = 3

    def __init__(self):
        # indexové záznamy, m ... M
        self.items = []
        # rodič
        self.parent = None

    def __str__(self):
        return "<Node; Items: {0}>".format(self.items)

    def __repr__(self):
        return "<Node; Items: {0}>".format(self.items)


def rectOverlap(r1, r2):
    return ((r1[0].x < r2[1].x) & (r1[1].x > r2[0].x) &
            (r1[0].y < r2[1].y) & (r1[1].y > r2[0].y))


def rectArea(r):
    return (r[0].x - r[1].x) * (r[0].y - r[1].y)


def rectCircuit(r):
    r = r.rect
    return ((r[0].x - r[1].x) + (r[0].y - r[1].y)) * 2


def minimalExtension(current, new):
    curArea = rectArea(current.rect)
    tmps = current.rect + new.rect

    p1 = Point(min(x.x for x in tmps),
               min(x.y for x in tmps))

    p2 = Point(max(x.x for x in tmps),
               max(x.y for x in tmps))

    newArea = rectArea([p1, p2])
    return newArea - curArea


def rectForItems(items):
    # upravím obdélník indexového prvku En
    tmps = []
    # odprasit!!!
    for j in [k.rect for k in items]:
        tmps = tmps + j
    p1 = Point(min(x.x for x in tmps),
               min(x.y for x in tmps))

    p2 = Point(max(x.x for x in tmps),
               max(x.y for x in tmps))
    return [p1, p2]


def list_powerset(lst):
    result = [[]]
    for x in lst:
        result.extend([subset + [x] for subset in result])
    return result


def rTreeChooseLeaf(root, item):
    n = root

    while True:
        # pokud je n list, vrať n
        if((len(n.items) == 0) or (type(n.items[0].p) == str)):
            return n

        # jinak najdi záznam, který potřebuje nejmejší rozšíření
        areas = list(map(lambda x: minimalExtension(x, item),
                         n.items))
        print("areas: %s" % areas)
        minArea = min(areas)
        i = areas.index(minArea)
        f = n.items[i]
        print(f)
        print(f.rect)
        # v připadě shody vyberu obdelnik s nejmensim obvodem
        for i in range(i + 1, len(areas)):
            if ((areas[i] == minArea) &
                    (rectCircuit(f) > rectCircuit(n.items[i]))):
                f = n.items[i]
        n = f.p


def rTreeAdjustTree(l, ll=None):
    n = l
    nn = ll

    print("Adjusting tree")
    print("l: %s" % l)
    print("ll: %s" % ll)
    print("parent: %s" % l.parent)

    while True:
        # pokud jsem v kořenu, končím
        if n.parent is None:
            return (n, nn)

        P = n.parent
        En = None
        # En = indexový prvek z rodiče, který obsahuje n
        print("n: %s" % n)
        for i in P.items:
            print(i)
            if(type(i.p) == Node):
                print(i.p.items)
            if i.p == n or ((type(i.p == Node)) and (n in [x.p for x in i.p.items])):
                En = i
                break
        print("En:  %s" % En)
        # upravím obdélník indexového prvku En
        En.rect = rectForItems(n.items)

        if nn is not None:
            Enn = IndexRecord(nn)
            if(len(P.items) < P.maxCount):
                nn.parent = P
                P.items.append(Enn)
                nn = None
            else:
                P, nn = rTreeSplitNode(P, Enn)

        n = P


def rTreeInsert(T, E):
    print("Inserting record: %s" % E)
    L = rTreeChooseLeaf(T, E)
    LL = None
    if (len(L.items) < L.maxCount):
        L.items.append(E)
    else:
        print("splitting")
        L, LL = rTreeSplitNode(L, E)
        LL.parent = L.parent

    print(L, LL)

    n, nn = rTreeAdjustTree(L, LL)
    # rozšiřovalo se až ke kořeni, vytvořím nový
    if nn is not None:
        print("T: %s" % T)
        new = Node()
        new.parent = n
        new.items = n.items
        for i in new.items:
            if type(i.p) == Node:
                i.p.parent = new
        nn.parent = n
        n.items = [IndexRecord(new), IndexRecord(nn)]


def rTreeSearch(root, rect):
    print("Searching rectangle: %s" % rect)
    items = []
    # pokud root je list, projdi zaznamy a zjisti prekryv
    if((len(root.items) == 0) or (type(root.items[0].p) == str)):
        for e in root.items:
            if rectOverlap(rect, e.rect):
                items.append(e)
        return items
    # root neni list, prozkoumej vsechny zaznamy a zjisti prekryv
    # pokud je prekryv, zavolej na zakoreneny strom rTreeSearch
    else:
        for e in root.items:
            print(e)
            print("overlap: %s" % rectOverlap(rect, e.rect))
            if rectOverlap(rect, e.rect):
                tmp = rTreeSearch(e.p, rect)
                if len(tmp) != 0:
                    items.extend(tmp)
        return items


def rTreeSplitNode(T, E):
    return rTreeBruteForceSplit(T, E)


def rTreeBruteForceSplit(T, E):
    print("Bruteforcing; T: %s, E: %s" % (T, E))
    items = T.items + [E]
    power = list_powerset(items)
    possible_items = [x for x in power if (
        len(x) >= T.minCount) & (len(x) <= T.maxCount)]
    combos = []
    half = int((T.maxCount + 1) / 2)
    for i in possible_items:
        ilen = len(i)
        # kvůli symetričnosti procházím pouze do poloviny
        if ilen > half:
            break
        i_combos = [[i, j] for j in possible_items if set(items) == set(i + j)]
        combos.extend(i_combos)
    areas = list(map(lambda x: rectArea(rectForItems(x[0])) +
                     rectArea(rectForItems(x[1])), combos))
    print("areas: %s" % areas)
    S, SS = combos[areas.index(min(areas))]
    # upravím indexové záznamy v uzlu T
    T.items = S
    for i in T.items:
        if type(i.p) == Node:
            i.p.parent = T
    # vytvořím nový uzel a vložím do něj zbylé indexové záznamy
    LL = Node()
    LL.items = SS
    # nastavím správného rodiče pro indexové záznamy v novém odděleném uzlu
    for i in LL.items:
        if type(i.p) == Node:
            i.p.parent = LL
    print("brute result: %s" % ([T.items, LL.items]))
    return [T, LL]


def drawRectangle(canvas, node, level, record):
    #print(node)
    #print("items: %s" % node.items)

    # prázdný uzel
    if(len(node.items) == 0):
        return
    # listový uzel
    if (type(node.items[0].p) == str):
        for i in node.items:
            if i in record:
                canvas.create_rectangle(i.rect[0].x, i.rect[0].y, i.rect[
                                        1].x, i.rect[1].y, fill="yellow")
            else:
                canvas.create_rectangle(i.rect[0].x, i.rect[0].y, i.rect[
                                        1].x, i.rect[1].y, fill="blue")
            canvas.create_text(i.rect[1].x-1, i.rect[1].y-1, text=i.p, fill="red")
        return
    # nelistový uzel
    for i in node.items:
        canvas.create_rectangle(i.rect[0].x - (5-level), i.rect[0].y - (5-level), i.rect[1].x + (5-level), i.rect[
                                1].y + (5-level), activefill="red", outline=colors[level], dash=(4, 4))
        drawRectangle(canvas, i.p, level+1, record)


def drawTree(root, record=None):
    print("Drawing tree")
    master = Tk()
    w = Canvas(master, width=400, height=400)
    w.pack()

    drawRectangle(w, root, 1, record)
    w.scale("all", 0, 0, 8, 8)
    mainloop()


def basicRecord(x, y, name):
    tmp = IndexRecord(str(name))
    tmp.rect = [Point(x, y), Point(x + 4, y + 4)]
    return tmp


root = Node()
items = []

pattern = "items.append(basicRecord({0}, {1}, {2}))"
for i in range(100):
    items.append(basicRecord(random.randint(0, 40), random.randint(0,40), i))


for i in items:
    rTreeInsert(root, i)
    print("tree: %s" % root)
    #drawTree(root)

drawTree(root, rTreeSearch(root, items[10].rect))

res = rTreeSearch(root, items[10].rect)
print("result: %s" % (res))
