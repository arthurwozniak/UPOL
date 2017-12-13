#!/usr/bin/env python
#! -*- coding: utf-8 -*- 

import random

class Test():

	def selectElement(self, k, array):
		n = len(array)
		if(k < (n / 2)):
			for i in range(0,k+1):
				myMin = min(array[i:])
				pos = array[i:].index(myMin)+i
				tmp = array[i]
				array[i] = myMin
				array[pos] = tmp
				self.count += 1
			return array[k]
		else:
			for i in reversed(range(k, n)):	
				myMax = max(array[0:i+1])
				pos = array.index(myMax)
				tmp = array[i]
				array[i] = myMax
				array[pos] = tmp
				self.count += 1
			return array[k]
	def __init__(self):
		myArray = [5, 13, 4, 12, 7, 23, 9, 1, 29]


		for length in range(1, 100):

			self.count = 0
			array1 = []
			array2 = []

			for i in range(length):
				array1.append(random.randint(0, 100))

			for i in array1:
				array2.append(i)

			array2.sort()

#			print array1
#			print array2

			failed = False
			for i in range(len(array1)):
				num = self.selectElement(i, array1)
				if num != array2[i]:
					failed = True

			if failed:
				print "Neprošlo"
			else:
				print "Prošlo"

			print "Délka: %d celkový počet kroků: %d, průměrný počet kroků: %d" % (length, self.count, self.count/length)

if __name__ == "__main__":
	Test()