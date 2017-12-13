#!/usr/bin/env python3

import numpy as np
from numpy import log
import matplotlib.pyplot as plt
import os
import scipy.optimize as opt
import random as rnd


# importujeme soubor z matlabu
import scipy.io as sio
import timeit


base_dir = "/home/kamil/Dropbox/UPOL/MGR/UNS"


def path(p):
    return os.path.join(base_dir, p)


def h(theta, X):
    return (1 / (1 + np.exp(-1 * (np.dot(X, theta)))))


def J(theta, X, y, lam):
    m, _ = X.shape
    cost = 0.0

    # účelová funkce
    cost = np.sum(-1.0 * y * np.log(h(theta, X)) -
                  (1 - y) * np.log(1 - h(theta, X))) / m

    # regularizační část
    cost = cost + (lam / (2 * m)) * np.sum(theta[1:]**2)

    return cost


def J_grad(theta, X, y, lam):
    m, n = X.shape
    grad = np.zeros(n)

    error = h(theta, X) - y

    # vektorová verze
    d = (np.dot(error, X) + lam * theta) / m

    d[0] = d[0] - lam * theta[0] / m

    grad = d

    return grad


data = sio.loadmat(path('data3.mat'))

X = data['X']
y = data['y']

print(X.shape, y.shape)

# zobrazíme první řádek matice X
# print(X[0, :])

# zobrazíme náhodně vybraný obrázek
num = rnd.randrange(5000)

obr = X[num, :]
obr = (np.reshape(obr, (20, 20))).T
plt.imshow(obr, cmap='gray')
plt.title('Radek cislo {}, y = {}'.format(num, y[num]))
plt.axis('off')
# plt.show()

steps = 10
step = 20

arr = np.zeros((20, steps * step))


for i in range(steps):
    arr[:, i * step:(i + 1) *
        step] = (np.reshape(X[rnd.randrange(10) * 500, :], (20, 20))).T


plt.imshow(arr, cmap='gray')
plt.axis('off')
# plt.show()

# přidáme první sloupec s jedničkami
X1 = np.ones((X.shape[0], X.shape[1] + 1))
X1[:, 1:] = X

# vyzkoušíme postup pro jednu číslici
initial_theta = np.zeros(X1.shape[1])
all_theta = np.zeros((10, 401))
lam = 0.1

i = 5
yi = np.copy(y)
yi = yi.flatten()
yi[yi != i] = 0
yi[yi == i] = 1

J_grad(initial_theta, X1, yi, lam)

start = timeit.default_timer()

result = opt.minimize(fun=J, args=(X1, yi, lam), x0=initial_theta,
                      jac=J_grad, options={'maxiter': 10, 'disp': True})

print('Čas (s): ', timeit.default_timer() - start)

final_theta = result.x
all_theta[i, :] = final_theta
print (result.message)

initial_theta = np.zeros(401)
all_theta = np.zeros((10, 401))
lam = 0.1


# naučíme se rozpoznávat všechny číslice 0...9
for i in range(1, 11):
    yi = np.copy(y)
    yi = yi.flatten()
    yi[yi != i] = 0
    yi[yi == i] = 1

    result = opt.minimize(fun=J, args=(X1, yi, lam), x0=initial_theta,
                          jac=J_grad, options={'maxiter': 50, 'disp': True})
    final_theta = result.x
    all_theta[i - 1, :] = final_theta

# můžeme predikovat
hodnoty = np.dot(X1, all_theta.T)

pred = hodnoty.argmax(axis=1)
pred = pred + 1
acc = np.mean((pred == y.flatten()).astype(int))
print('Training accuracy: {:.5f}'.format(acc))

# indexy chybně predikovaných číslic
chyby = np.where(pred != y.flatten())

# zobrazíme chybně klasifikovaný obrázek
num = chyby[0][rnd.randrange(chyby[0].shape[0])]

obr = X[num, :]
obr = (np.reshape(obr, (20, 20))).T
plt.imshow(obr, cmap='gray')
plt.title('Řádek číslo {}, y = {}, pred = {}'.format(num, y[num], pred[num]))
plt.axis('off')
plt.show()
