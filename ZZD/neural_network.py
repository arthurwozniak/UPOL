#!/usr/bin/env python3

import os
import numpy as np
import scipy.optimize as opt



def sigmoid(x):
    return (1 / (1 + np.exp(-x)))


def h(theta, X):
    return (1 / (1 + np.exp(-1 * (np.dot(X, theta)))))


def J(Thetas, X, y, lam):

    # rozložíme vektor parametrů do matic Theta1 a Theta2
    part1 = HIDDEN_SIZE * (INPUT_SIZE + 1)
    Theta1 = Thetas[:part1].reshape((HIDDEN_SIZE, INPUT_SIZE + 1))
    Theta2 = Thetas[part1:].reshape((OUTPUT_SIZE, HIDDEN_SIZE + 1))

    m, _ = X.shape
    cost = 0.0

    #feed-forward
    z2 = np.dot(X, Theta1.T)
    a2 = sigmoid(z2)

    z3 = np.dot(np.insert(a2, 0, 1, axis=1), Theta2.T)
    a3 = sigmoid(z3)

    z = 0.0

    z = z + (- Y[:, 0] * np.log(a3[:, 0]) -
             (1 - Y[:, 0]) * np.log(1 - a3[:, 0]))

    cost = np.sum(z) / m

    reg = np.sum(Theta1[:, 1:]**2) + np.sum(Theta2[:, 1:]**2)
    reg = reg * lam / (2 * m)

    cost = cost + reg

    return cost


# derivace sigmoidu
def sig_grad(x):
    return sigmoid(x) * (1 - sigmoid(x))

# náhodně generovaná počáteční data
def rand_init(m, n, eps):
    mat = np.random.uniform(-eps, eps, (m, n))
    return mat

# výpočet back-propagation
def back(Thetas, X, Y, lam):
    # zápočet - přepsat na dvě skryté vrstvy neuronů

    # rozložíme vektor parametrů do matic Theta1 a Theta2
    part1 = HIDDEN_SIZE * (INPUT_SIZE + 1)

    Theta1 = Thetas[:part1].reshape((HIDDEN_SIZE, INPUT_SIZE + 1))
    Theta2 = Thetas[part1:].reshape((OUTPUT_SIZE, HIDDEN_SIZE + 1))

    m, _ = X.shape

    A1 = X
    Z2 = np.dot(X, Theta1.T)
    A2 = sigmoid(Z2)

    A2 = np.insert(A2, 0, 1, axis=1)

    Z3 = np.dot(A2, Theta2.T)
    A3 = sigmoid(Z3)

    D1 = np.zeros_like(Theta1)
    D2 = np.zeros_like(Theta2)

    sg = sig_grad(Z2)

    for i in range(m):
        delta3 = A3[i, :] - Y[i, :]

        delta2 = np.dot(delta3, Theta2)
        delta2 = delta2[1:] * sg

        delta3 = delta3.reshape((-1, 1))
        delta2 = delta2[i, :].reshape((-1, 1))

        D2 = D2 + np.dot(delta3, np.reshape(A2[i, :], (-1, 1)).T)
        D1 = D1 + np.dot(delta2, np.reshape(A1[i, :], (-1, 1)).T)

    D1 = D1 / m
    D2 = D2 / m

    D1[:, 1:] = D1[:, 1:] + (lam * Theta1[:, 1:]) / m
    D2[:, 1:] = D2[:, 1:] + (lam * Theta2[:, 1:]) / m

    cost = J(Thetas, X, Y, lam)

    # print(cost)

    return cost, np.concatenate((D1.flatten(), D2.flatten()))




BASE = os.path.dirname(os.path.realpath(__file__))
data_file = open(os.path.join(BASE, "wdbc.data"), 'r')
lines = data_file.read().splitlines()
data = np.array([x.split(",") for x in lines])

Y = np.array([(data[:, 1] == 'M').astype(int)]).T
print(Y.flatten())
X = data[:, 2:]
# přidám první sloupec s jedničkami
X1 = np.ones((X.shape[0], X.shape[1] + 1))
X1[:, 1:] = X
X = X1

# definujeme potřebné konstanty
INPUT_SIZE = 30  # počet vstupních neuronů
OUTPUT_SIZE = 2  # 10 výstupních neuronů
HIDDEN_SIZE = 30  # počet neuronů ve skryté vrstvě

#generujeme náhodné počáteční parametry
init_Theta1 = rand_init(HIDDEN_SIZE,INPUT_SIZE+1, 0.1)
init_Theta2 = rand_init(OUTPUT_SIZE,HIDDEN_SIZE+1, 0.1)
init_thetas = np.concatenate((init_Theta1.flatten(), init_Theta2.flatten()))

lam = 0.5

result = opt.minimize(fun=back, x0=init_thetas, args=(X,Y,lam), jac=True, method='TNC',
             options={'maxiter': 1000,'disp': 1, 'maxfun':100**10})

#nalezené optimální hodnoty parametrů Theta1 a Theta2
final_thetas = result.x


#rozložíme vektor parametrů do matic Theta1 a Theta2
part1 = HIDDEN_SIZE*(INPUT_SIZE+1)

final_Theta1 = final_thetas[:part1].reshape((HIDDEN_SIZE,INPUT_SIZE+1))
final_Theta2 = final_thetas[part1:].reshape((OUTPUT_SIZE,HIDDEN_SIZE+1))

# In[38]:
#provedeme feed-forward pro všechny vstupní znaky
z2 = np.dot(X,final_Theta1.T)
a2 = sigmoid(z2)

z3 = np.dot(np.insert(a2,0,1,axis=1), final_Theta2.T)
a3 = sigmoid(z3)

#můžeme predikovat
f_pred = np.argmax(a3,axis=1)
print(Y.flatten())
print(f_pred)
print('Training accuracy: {}'.format(np.mean(f_pred == Y.flatten())))
