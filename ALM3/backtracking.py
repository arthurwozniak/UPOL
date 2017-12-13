#!/usr/bin/env python
#! -*- coding: utf-8 -8-

class BackTrack:
	def generateBoard(self, width, height):
		board = []
		for i in range(width):
			for j in range(height):
				board.append([i, j])
		return board

	def getAvailables(self, pos):
		availables = []
		for i in self.moves:
			tmp = [i[0] + pos[0], i[1] + pos[1]]
			if((tmp[0] >= 0) & (tmp[1] >= 0) & (tmp[0] < self.width) & (tmp[1] < self.height)):
				availables.append(tmp[:])
		return availables

	def invertMove(self, pos):
		return [-1 * pos[0], -1 * pos[1]]

	def possibleMove(self, pos1, pos2):
		print pos1, pos2
		tmp = [pos1[0] - pos2[0], pos1[1] - pos2[1]]
		print "myTMP", tmp
		return tmp in self.moves

	def __init__(self, pos, width, height):
		self.width = width;
		self.height = height;
		self.moves = [[1,2], [1, -2], [2, 1], [2, -1], [-1, 2], [-1, -2], [-2, 1], [-2, -1]]
		self.pos = pos
		self.board = self.generateBoard(width, height)
		self.visited = [pos]
		self.availables = self.getAvailables(pos)
		self.trace = []
		while(len(self.availables) != 0):
			self.trace.append(self.pos[:])
			tmp = self.availables[-1]
			if(self.possibleMove(self.pos, self.availables.pop(-1))):
					self.pos = tmp[:]
			else:
				print "visited", self.visited
				print "availables", self.availables
				print "trace", self.trace
				print "error"
				break
			if(self.pos not in self.visited):
				self.visited.append(self.pos[:])
			tmpAvailables = self.getAvailables(self.pos)
			print "tmp", tmpAvailables
			#prida dostupne pozice ze soucasne navstivitelnych do self.availables
			if(len(tmpAvailables) != 0):
				map(lambda x: tmpAvailables.append(x[:]), self.availables)
				for i in self.visited:
					while i in tmpAvailables:
						tmpAvailables.remove(i)
				self.availables = tmpAvailables[:]
				print "availables", self.availables
				print "pos", self.pos
			else: 
				if(self.possibleMove(self.pos, self.trace[-1])):
					self.pos = self.trace[-1]
				else:
					print "error dole"
					break

			print len(self.visited)
			print self.visited

		
if __name__ == '__main__':
	BackTrack([3,0], 8, 8)