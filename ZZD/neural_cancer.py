#!/usr/bin/env python3

import os
import numpy as np
import scipy.optimize as opt
from matplotlib import pyplot as plt


from math import exp
from random import seed
from random import random


class NeuralNetwork:

    div = 1

    def adjust_sig(self, i=True):
        if i:
            self.div = np.max(self.thetas1) - np.min(self.thetas1)
            return
        self.div = np.max(self.thetas2) - np.min(self.thetas2)

    def sigmoid(self, x):
        return (1 / (1 + np.exp(-(x/self.div))))

    # derivace sigmoidu
    def sigmoid_(self, x):
        return self.sigmoid(x) * (1 - self.sigmoid(x))

    def predict(self, X):
        self.adjust_sig()
        l0 = self.X
        self.adjust_sig()
        l1 = self.sigmoid(np.dot(l0, self.thetas1))
        self.adjust_sig(i=False)
        l2 = self.sigmoid(np.dot(l1, self.thetas2))


        return np.argmax(l2, axis=1)
        ##return np.argmax(l2,axis=1)

    def back(self, iters):
        for i in range(iters):
            self.adjust_sig()
            l0 = self.X
            l1 = self.sigmoid(np.dot(l0, self.thetas1))
            self.adjust_sig(i=False)
            l2 = self.sigmoid(np.dot(l1, self.thetas2))
            l2_error = self.y - l2

            if(i%1000 == 0):
                print("%s - Error: %s" % (i,np.mean(self.predict(self.X)==self.y)))
            self.adjust_sig(i=False)
            l2_delta = l2_error * self.sigmoid_(l2)
            l1_error = l2_delta.dot(self.thetas2.T)
            self.adjust_sig()
            l1_delta = l1_error * self.sigmoid_(l1)

            self.thetas2 += 1*l1.T.dot(l2_delta)
            self.thetas1 += 1*l0.T.dot(l1_delta)


        #ah_err =

    # výpočet back-propagation
    def back2(self):
        # zápočet - přepsat na dvě skryté vrstvy neuronů

        # rozložíme vektor parametrů do matic Theta1 a Theta2

        m, _ = self.X.shape

        A1 = self.X
        Z2 = np.dot(self.X, self.thetas1.T)
        A2 = self.sigmoid(Z2)

        A2 = np.insert(A2, 0, 1, axis=1)

        Z3 = np.dot(A2, self.thetas2.T)
        A3 = self.sigmoid(Z3)

        print("error: %s" % np.mean(self.y==np.argmax(A3,axis=1)))

        D1 = np.zeros_like(self.thetas1)
        D2 = np.zeros_like(self.thetas2)

        sg = self.sigmoid_(Z2)

        for i in range(m):
            delta3 = A3[i, :] - self.y[i]

            delta2 = np.dot(delta3, self.thetas2)
            delta2 = delta2[1:] * sg

            delta3 = delta3.reshape((-1, 1))
            delta2 = delta2[i, :].reshape((-1, 1))

            D2 = D2 + np.dot(delta3, np.reshape(A2[i, :], (-1, 1)).T)
            D1 = D1 + np.dot(delta2, np.reshape(A1[i, :], (-1, 1)).T)

        D1 = D1 / m
        D2 = D2 / m

        D1[:, 1:] = D1[:, 1:] + (0.2 * self.thetas1[:, 1:]) / m
        D2[:, 1:] = D2[:, 1:] + (0.2 * self.thetas2[:, 1:]) / m


        self.thetas2 += D2
        self.thetas1 += D1

    def __init__(self, X, y, hidden_size=30):
        self.X = X
        self.y = y
        self.output_size = len(set(y.flatten()))
        self.input_size = X.shape[1]
        self.hidden_size = hidden_size

        print("input size: %s" % self.input_size)
        print("hidden size: %s" % self.hidden_size)

        self.thetas1 = 2*np.random.random((self.input_size, self.hidden_size)) - 1
        self.thetas2 = 2*np.random.random((self.hidden_size, self.output_size)) -1
        #print(self.thetas2.shape)

np.random.seed(0)
#
BASE = os.path.dirname(os.path.realpath(__file__))
data_file = open(os.path.join(BASE, "wdbc.data"), 'r')
lines = data_file.read().splitlines()
data = np.array([x.split(",") for x in lines])
#data2 = [[float(i) for i in x.split(",")[2:]]+[int(x.split(",")[1]=='M')] for x in lines]
#
y = np.array([(data[:, 1] == 'M').astype(int)]).T
# print(Y.flatten())
X = data[:, 2:].astype(float)
# přidám první sloupec s jedničkami
X1 = np.ones((X.shape[0], X.shape[1] + 1))
X1[:, 0:-1] = X
X1[:, -1] = y.flatten()
#X = X1

print(X.shape)

nn = NeuralNetwork(X, y, hidden_size=30)
#print(nn.predict(X))
print(np.mean(y==nn.predict(y)))
nn.back(100000)
print(np.mean(y==nn.predict(y)))


#dataset = data2
#
# n_inputs = len(dataset[0]) - 1
# n_outputs = len(set([row[-1] for row in dataset]))
# network = initialize_network(n_inputs, 10, n_outputs)
# train_network(network, dataset, 1, 1000, n_outputs)
# for layer in network:
# 	for i in layer:
# 		print(i['delta'])
#X = X[:, 1:]
# print(repr(X))

#
#
# # definujeme potřebné konstanty
# INPUT_SIZE = 30  # počet vstupních neuronů
# OUTPUT_SIZE = 2  # 10 výstupních neuronů
# HIDDEN_SIZE = 30  # počet neuronů ve skryté vrstvě
#
# plt.scatter(X[:,1], X[:,2], s=40, c=y, cmap=plt.cm.Spectral)
# #plt.show()
#
# num_examples = len(X) # training set size
# nn_input_dim = 30 # input layer dimensionality
# nn_output_dim = 2 # output layer dimensionality
#
# # Gradient descent parameters (I picked these by hand)
# epsilon = 0.01 # learning rate for gradient descent
# reg_lambda = 0.01 # regularization strength
#
# # Build a model with a 3-dimensional hidden layer
# model = build_model(2, print_loss=True, num_passes=3000)
#
# err=0
# for i in range(len(y)):
#     pred = predict(model, X[i])
#     if pred != y[i]:
#         err += 1
#     print("y: %s, pred: %s" % (y[i], pred))
#
# print(err/len(y))
