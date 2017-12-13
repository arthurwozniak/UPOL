#!/usr/bin/env python3
import re

def split_line(line):
    return re.sub('"|\n', '', line).split(",")

def get_func_indexes(schema, func):
    return [[schema.index(x) for x in func[y]] for y in range(2)]

def test(filepath, func):
    f = open(filepath, 'r')
    schema = split_line(f.readline())
    data = list(map(split_line, f.readlines()))
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

tests = [[["a", "b"], ["b", "c"]],
         [["b"], ["c"]],
         [["a", "c"], ["b", "c"]],
         [["c"], ["a", "b", "c"]]]

for item in tests:
    print(test("/home/kamil/Dropbox/UPOL/6semestr/DATA2/data.csv", item))
