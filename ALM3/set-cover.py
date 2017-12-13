#!/usr/bin/env python
#! -*- coding: utf-8 -*-

class set_cover():

	def getMax(self):
		max = None;
		pos = None;
		for i in range(len(self.s)):
			tmp = 0
			for j in range(len(self.s[i])):
				if self.s[i][j] in self.ucopy:
					tmp += 1
			if tmp > max:
				max = tmp
				pos = i
		return (max, pos)

	def __init__(self):
		self.u = [1, 2, 3, 4, 5]
		self.s=[[1,2,3], [2,4], [3,4], [4, 5]]
		self.ucopy = []
		self.result = []
		for i in self.u:
			self.ucopy.append(i)
		while(len(self.result) != len(self.u)):
			leng, pos = self.getMax()
			tmp = self.s[pos]
			print self.s[pos]
			for i in self.s[pos]:
				self.result.append(i)
				self.ucopy.remove(i)
			self.s.remove(tmp)

		print self.result
 
if __name__ == '__main__':
	set_cover()