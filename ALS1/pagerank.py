#!/usr/bin/env python3
#! -*- encoding: utf-8 -*-
import numpy

Q = numpy.matrix([[0, 1 / 3, 0, 0, 0, 0],
                  [1 / 3, 0, 0, 0, 0, 0],
                  [0, 1 / 3, 0, 0, 1 / 3, 1 / 2],
                  [1 / 3, 0, 0, 0, 1 / 3, 0],
                  [1 / 3, 1 / 3, 0, 0, 0, 1 / 2],
                  [0, 0, 1, 0, 1 / 3, 0]])

P = numpy.matrix([[0, 1 / 3, 0, 1 / 6, 0, 0],
                  [1 / 3, 0, 0, 1 / 6, 0, 0],
                  [0, 1 / 3, 0, 1 / 6, 1 / 3, 1 / 2],
                  [1 / 3, 0, 0, 1 / 6, 1 / 3, 0],
                  [1 / 3, 1 / 3, 0, 1 / 6, 0, 1 / 2],
                  [0, 0, 1, 1 / 6, 1 / 3, 0]])
alpha = 0.85
n = len(Q)



# r musíme transponovat na sloupcový vektor
r = numpy.random.rand(1, n).T
r = (r / numpy.linalg.norm(r, 1))
r_last = numpy.array([numpy.inf for i in range(n)])[numpy.newaxis].T
d_last = -numpy.inf

i = 1
print(r)
while(numpy.linalg.norm(r_last - r, 1) > 0.0001):
    print("Iter no.: %d" % i)
    print(numpy.linalg.norm(r_last - r, 1))
    i += 1
    d_last = numpy.linalg.norm(r_last - r, 1)
    print("d last %s" % d_last)
    print("q*r: %s" % (alpha*Q*r))
    beta = 1 - numpy.linalg.norm(alpha * Q * r, 1)
    print("beta: %s" % beta)
    q = (alpha * Q * r) + ((beta / n) * numpy.ones(n)[numpy.newaxis].T)
    r_last = r
    r = q / numpy.linalg.norm(q, 1)

print(r)
print(sum(r))
