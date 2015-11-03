class DGraph(object):

	def __init__(self, nodes, edges):		
		self.edges = []
		self.nodes = set(nodes)
		self._check_graph(edges)
		self.adjacency_matrix = [[0 for i in range(len(self.nodes))] for i in range(len(self.nodes))]
		self._populate_adjacency_matrix()
		self.degrees = self._get_degrees()

	def _check_graph(self, edges):
		for a, b in edges:
			if a not in self.nodes or b not in self.nodes:
				raise Exception("Wrong edge definition: " + str((a, b)))
			if (b, a) not in self.edges:
				self.edges.append((a, b))

	def _populate_adjacency_matrix(self):
		for a, b in self.edges:
			self.adjacency_matrix[a - 1][b - 1] = 1

	def _get_degrees(self):
		degrees = [0 for i in range(len(self.nodes))]
		i = 0
		while i < len(self.nodes):
			j = 0
			while j < len(self.nodes):
				if self.adjacency_matrix[i][j] == 1:
					degrees[i] += 1
					if i == j:
						degrees[i] += 1
				j += 1
			i += 1
		
		return degrees

	def get_big_delta(self):
		degrees = self.degrees
		i = 0
		ans = degrees[i]

		while i < len(degrees):
			if degrees[i] > ans:
				ans = degrees[i]
			i += 1

		return ans

	def get_little_delta(self):
		degrees = self.degrees
		i = 0
		ans = degrees[i]

		while i < len(degrees):
			if degrees[i] < ans:
				ans = degrees[i]
			i += 1

		return ans

	def get_isolated_nodes(self):
		pass

	def check_handshake_lemma(self, trace = False):
		pass

	def print_adjacency_matrix(self):
		i = 0
		while i < len(self.nodes):
			j = 0
			while j < len(self.nodes):
				print str(self.adjacency_matrix[i][j]) + ' ',
				j += 1
			i += 1
			print

	def __str__(self):
		ans = 'G := (V, E)'
		ans += '\n' + 'V := {' + ', '.join(list(map(lambda x : str(x), self.nodes))) + '}'
		ans += '\n' + 'E := {' + ', '.join(list(map(lambda x : str(x), self.edges))) + '}'
		return ans

g = DGraph([1,2,3,4,5], [(1,2), (1, 1), (1, 5), (2, 5), (2, 4), (5, 4), (3, 4), (2, 3)])
