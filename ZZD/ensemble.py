#!/usr/bin/env python3
import os, sys
import random
import numpy as np


def generator(max_val, step, index, count):
    tmp = list(range(0, count * step, step))
    return [(index + x) % max_val for x in tmp]


# náhodně generovaná počáteční data
def rand_init(m, n, eps):
    mat = np.random.uniform(-eps, eps, (m, n))
    return mat


def generage_ensemble(input_count, ens_size):
    ensemble = []
    step = 1
    index = 0
    while(len(ensemble) < ens_size):
        new = generator(ens_size, step, index, input_count)
        if new in ensemble:
            step += 1
            continue
        ensemble.append(([1] + new))
        index = (new[-1] + 1) % ens_size
    ensemble = np.array(ensemble)
    weights = rand_init(ensemble.shape[0], ensemble.shape[1], 0.5)
    weights[:, 0] = 0.2 #-np.abs(weights[:, 0])
    return [[ensemble[i], weights[i]] for i in range(ens_size)]


def learn(X, Y, ensemble, alpha):
    # pro každý řádek v datech
    changed = False
    changed_count = 0
    for row_i in range(Y.shape[0]):
        row = X[row_i]
        d_j = Y[row_i]
        # pro každý perceptron
        for i in range(len(ensemble)):
            indexes, weights = ensemble[i]
            vals = np.array(indexes[0] + [row[i + 1] for i in indexes])
            vals_sum = sum(weights * vals)
            y = np.int(vals_sum > weights[0])
            if (d_j == 1) and (y == 0):
                changed = True
                changed_count += 1
                ensemble[i][1] = weights + alpha * vals
            if (d_j == 0) and (y == 1):
                changed = True
                changed_count += 1
                ensemble[i][1] = weights - alpha * vals
    return ensemble, changed, changed_count


def learn2(X, Y, ensemble, alpha):
    # pro každý řádek v datech
    changed = False
    changed_count = 0
    for i in range(len(ensemble)):
        indexes, weights = ensemble[i]
        for row_i in range(Y.shape[0]):
            row = X[row_i]
            d_j = Y[row_i]
            #print(row)
            #print(indexes)
            vals = np.array([1] + [row[i + 1] for i in indexes[1:]])
            #print(vals)
            #print(weights)
            #sys.exit(0)

            vals_sum = sum(weights * vals)
            #print(vals_sum)
            #sys.exit(0)
            y = np.int(vals_sum > -weights[0])
            if (d_j == 1) and (y == 0):
                changed = True
                changed_count += 1
                weights = weights + alpha * vals
            if (d_j == 0) and (y == 1):
                changed = True
                changed_count += 1
                weights = weights - alpha * vals
        ensemble[i] = [indexes, weights]
    return ensemble, changed, changed_count


def predicate(row, ensembles, prnt=False):
    res = []
    for i in range(len(ensembles)):
        indexes, weights = ensembles[i]
        vals = np.array([1] + [row[i + 1] for i in indexes[1:]])
        vals_sum = sum(weights * vals)
        y = np.int(vals_sum > -weights[0])
        res.append(y)
    if prnt:
        print(res)
    return max(res, key=res.count)


def train(X, Y, ensembles, count):
    c = 0
    acc_prev = -np.inf
    print(ensembles)
    return
    while True:
        ensembles, changed, cnt = learn(X, Y, ensembles, 0.2)
        acc = success_rate(X, Y, ensembles)
        print(c, cnt)
        print(acc_prev, acc)
        #if abs(acc - acc_prev) < 0.0001:
        if acc > 0.99:
            break
        acc_prev = acc
        c += 1
    return ensembles


def train2(X, Y, ensembles, iters=None, acc_target=None):
    #print(X[0])
    #print(ensembles)
    for i in range(len(ensembles)):
        print("ens %s" % i)
        ens_tmp = [ensembles[i]]
        c = 0
        acc_prev = -np.inf
        while True:
            ens_tmp, changed, cnt = learn2(X, Y, ens_tmp, 0.2)
            acc = success_rate(X, Y, ens_tmp)
            #print("acc: %s" % acc)
            #print(len(X))
            #if abs(acc - acc_prev) < 0.0001:
            #if acc > 0.85:
            #    print("acc: %s" % acc)
            #    break
            acc_prev = acc
            c += 1
            if(iters and (c > iters)):
                print("iter reached %s" % acc)
                break
            if (acc_target and acc > acc_target):
                print("acc reached %s" % acc)
                break
        ensembles[i] = ens_tmp[0]
    return ensembles


def success_rate(X, Y, ensembles, prnt=False):
    errors = 0
    data_size = 0
    for i in range(Y.shape[0]):
        row = X[i]
        data_size += 1

        if Y[i] != predicate(row, ensembles, prnt):
            errors += 1
    #data_size = len(data)
    return (data_size - errors) / data_size


def divide_dataset(X, Y, n):
    indexes = list(range(Y.shape[0]))
    random.shuffle(indexes)
    folds = []
    for i in range(n):
        folds.append([[], []])
    c = 0
    for i in indexes:
        folds[c % n][0].append(X[i])
        folds[c % n][1].append(Y[i])
        c += 1
    return folds


def n_fold_verify(X, Y, n):
    print(28 * "-")
    print("n-fold success rate for n=%s" % n)
    avg = 0.
    folds = divide_dataset(X, Y, n)
    for i in range(n):
        print("n-fold iteration: %s" % (i + 1))
        test_X = np.array(folds[i][0])
        test_Y = np.array(folds[i][1])
        train_X = []
        train_Y = []
        for j in range(n):
            if j != i:
                train_X += folds[j][0]
                train_Y += folds[j][1]
        train_X = np.array(train_X)
        train_Y = np.array(train_Y)
        PRC_INPUTS = 5
        PRC_COUNT = 20

        ensembles = generage_ensemble(PRC_INPUTS, PRC_COUNT)
        ensembles = train2(train_X, train_Y, ensembles, acc_target=0.87, iters=30)
        avg += success_rate(test_X, test_Y, ensembles, prnt=False)
        print("current accuracy: %s" % (avg/(i+1)))
    print("Average success rate: %s" % (avg / n))
    print(28 * "-")

np.random.seed(1)
random.seed(1)
BASE = os.path.dirname(os.path.realpath(__file__))
data_file = open(os.path.join(BASE, "wdbc.data"), 'r')
lines = data_file.read().splitlines()
data = np.array([x.split(",") for x in lines])

Y = (data[:, 1] == 'M').astype(int)
X = data[:, 2:]
# přidám první sloupec s jedničkami
X1 = np.ones((X.shape[0], X.shape[1] + 1))
X1[:, 1:] = X
X = X1

PRC_INPUTS = 5
PRC_COUNT = 30

ensembles = generage_ensemble(PRC_INPUTS, PRC_COUNT)

#ensembles = train(X, Y, ensembles, 0)
print(success_rate(X, Y, ensembles))
n_fold_verify(X, Y, 3)
