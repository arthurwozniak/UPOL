#! /usr/bin/env python3
#! -*- encoding: utf-8 -*-

import random
import time
import os

prime = 314159
size = 4888

class PerfectHash:


	def first_lvl_func(self):
		# Generuji hashovací funkce pro tabulku první úrovně dokud je součet kvadrátů vnitřních tabulek
		# větší než dvojnásobek prvků
		counter = 0
		while True:
			self.f = random_hash_func(self.m)[2]
			self.h = create_hash_table(self.f, tmp)

			c = 0
			for i in self.h:
				if i:
					c += len(i)**2
			if c < 2*size: break

	def create_inner_tables(self):
		c=0
		for i in range(len(self.h)):
			if self.h[i] == None: continue
			tmp = self.h[i]
			res = [None for i in range(len(tmp)**2 + 3)]
			res[0] = len(tmp) ** 2
			if res[0] == 1:
				res[1:] = [0,0,tmp[0]]
				self.h[i] = res
				continue
			while True:
				(a, b, f) = random_hash_func(res[0])
				res[1:2] = [a,b]
				res[3:] = [None for i in range(res[0])]
				fail = False
				for j in tmp:
					k = f(j)
					if (res[3+k] != None):
						fail = True
						break
					res[3+k] = j
				if fail: continue
				break
			self.h[i] = res

	def search(self, e):
		tmp = self.h[self.f(e)]
		return tmp[3 + ((tmp[1] * e + tmp[2]) % prime) % tmp[0]]


	def __init__(self, l, p):
		self.m = len(l)
		self.first_lvl_func()
		self.create_inner_tables()


def random_hash_func(m):
	a = random.randint(1, prime-1)
	b = random.randint(0, prime-1)
	return (a, b, lambda k: ((a * k + b) % prime) % m)

def generate_random_list(length, int_range):
	tmp = set()
	while len(tmp) < length:
		tmp.add(random.randint(0, int_range))
	return list(tmp)

def save_list(l, name):
	file = open("./{0}.txt".format(name), 'w')
	for i in l:
		file.write(str(i)+"\n")
	file.close();

def load_list(name):
	file = open("./{0}.txt".format(name), 'r+')
	tmp = []
	for i in file.readlines():
		tmp.append(int(i[:-1]))
	return tmp

def create_hash_table(func, nums):
	h = [None for i in range(0, len(nums))]
	for i in nums:
		index = func(i)
		if (h[index] == None):
			h[index] = []
		h[index].append(i)
	return h

def binary_search(l, value):
    low = 0
    high = len(l)-1
    while low <= high:
        mid = (low+high)//2
        if l[mid] > value: high = mid-1
        elif l[mid] < value: low = mid+1
        else: return mid
    return None

def perform_comparison():
	randoms = []
	for i in range(1000):
		randoms.append(tmp[random.randint(0, len(tmp) - 1)])


	start = time.time()
	for i in randoms:
		binary_search(tmp, i)
	r1 = time.time() - start

	#print("Binary search: {0}".format(r1))

	start = time.time()
	for i in randoms:
		ph.search(i)
	r2 = time.time() - start

	#print("Perfect hashing: {0}".format(r2))

	c = r1/r2
	#print("Coeficient: {0}".format(c))
	return c


#tmp = generate_random_list(size, prime-1)
#save_list(tmp, "numbers")
tmp = load_list("numbers")
tmp.sort()

f = random_hash_func(len(tmp))[2]
h = create_hash_table(f, tmp)

ph = PerfectHash(tmp, prime)

res = []
for i in range(1000):
	print("Round {0}".format(i))
	res.append(perform_comparison())

print("Average: {0}".format(sum(res)/len(res)))
