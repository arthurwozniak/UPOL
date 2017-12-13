#!/usr/bin/env python
#! -*- coding: utf-8 -*-

import re



class Poly():
	def loadFile(self, name):
		file = open(name, 'r')
		final = []
		list = file.readlines()
		for item in list:
			item = re.sub('\n', '', item)
			tmp = item.split(" ")
			final.append([int(tmp[0]), int(tmp[1])])
		return final

	def lMax(self, points, q, p):
		maxP = points[q]
		for point in points[q, p]:
			if point[0] < maxP[0]:
				maxP = point

	def pMax(self, points, q, p):
		maxP = points[q]
		for point in points[l, q]:
			if point[0] > maxP[0]:
				maxP = point

	def isUnder(self, points, l, p, y):
		for point in points[l, p]:
			if point[1] < y: return True
		return False


	def isAbove(self, points, l, p, y):
		for point in points[l, p]:
			if point[1] > y: return True
		return False


	def connect(self, points, l, q, p):
		maxL = self.lMax(points, q, p)
		maxP = self.pMax(points, l, q)



	def divide(self, points, l, p):
		length = len(points) - 1
		if p < l:
			q = (l + p)/2
			self.divide(points, l, q)
			self.divide(points, q + 1, p)
		for i in points[l, p]:
			i.append(True)
		self.connect(points, l, q, p)


	def __init__(self):
		points = self.loadFile("/home/kamil/test").sort()

		

if __name__ == '__main__':
	Poly()