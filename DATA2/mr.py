#!/usr/bin/env python3
import re

def split_line(line):
    return re.sub('"|\n', '', line).split(",")

def KanonickyRozklad(filepath):
    f = open(filepath, 'r')
    schema = split_line(f.readline())
    schema_size = len(schema)
    data = list(map(split_line, f.readlines()))
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

# foo = KanonickyRozklad("/home/kamil/Dropbox/UPOL/6semestr/DATA2/data2.csv")
# bar = KanonickyRozklad("/home/kamil/Dropbox/UPOL/6semestr/DATA2/data3.csv")
# print("%s\n%s" % (foo, bar))
cvik = KanonickyRozklad("/home/kamil/Dropbox/UPOL/6semestr/DATA2/cvik3.csv")
print("%s\npocet prvku: %d" % (cvik, len(cvik)))
