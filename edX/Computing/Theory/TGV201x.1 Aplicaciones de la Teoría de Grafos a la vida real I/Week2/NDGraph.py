class NDGraph(object):

	def __init__(self, nodes, edges):		
		self.edges = []
		self.nodes = set(nodes)
		self._dct = {itm : i for i, itm in enumerate(self.nodes)}
		self._check_graph(edges)
		self.adjacency_matrix = [[0 for i in range(len(self.nodes))] for i in range(len(self.nodes))]
		self._populate_adjacency_matrix()
		self.degrees, self._node_degree = self._get_degrees()

	def _check_graph(self, edges):
		for a, b in edges:
			if a not in self.nodes or b not in self.nodes:
				raise Exception("Wrong edge definition: " + str((a, b)))
			if (b, a) not in self.edges:
				self.edges.append((a, b))

	def _populate_adjacency_matrix(self):
		for a, b in self.edges:
			self.adjacency_matrix[self._dct[a]][self._dct[b]] = 1
			self.adjacency_matrix[self._dct[b]][self._dct[a]] = 1

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

		node_degree = []

		for itm in self._dct:
			degree = degrees[self._dct[itm]]
			tpl = (itm, degree)
			node_degree.append(tpl)

		return degrees, node_degree

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
		ans = []

		for node, degree in self._node_degree:
			if degree == 0:
				ans.append(node)

		return ans
		
	def check_handshake_lemma(self, trace = False):
		ans = '1. The number of nodes of odd degree is even:\n'

		odd_degree_nodes = filter(lambda x : x[1] % 2 == 1, self._node_degree)
		sum_degrees = sum(self.degrees)

		for itm in self._node_degree:
			node = itm[0]
			degree = itm[1]

			curr = str(node) + '    ' + str(degree) + (' <- odd' if degree % 2 == 1 else '') + '\n'
			ans += curr

		ans += '2. The sum of degrees is two times | E |:\n'
		ans += 'sum(v in V) = ' + str(sum_degrees) + ' : 2 * |E| =  ' + str(2 * len(self.edges))

		if trace: print ans

		return len(odd_degree_nodes) % 2 == 0, sum_degrees == 2 * len(self.edges)

	def havel_hakimi(self, degree_sequence_dct, trace = False):
		degree_sequence = [(itm, degree_sequence_dct[itm]) for itm in degree_sequence_dct]
		
 
		flag = True
		edges = []

		while flag:

			degree_sequence.sort(key = lambda tupl : tupl[1], reverse = True)
			head = degree_sequence.pop(0)
			current_node = head[0]
			current_degree = head[1]

			if current_degree > len(degree_sequence):
				edges = []
				break

			nodes = []

			for j in range(head[1]):
				node, degree = degree_sequence[j]
				degree_sequence[j] = node, degree - 1
				nodes.append(node)

			accum = 0
			for itm in degree_sequence:
				curr_node = itm[0]
				curr_degree = itm[1]
				if curr_degree < 0:
					edges = []
					flag = False
					break
				accum += curr_degree

			if accum == 0:
				flag = False
			
			for node in nodes:
				edge = (current_node, node)
				edges.append(edge)

		if edges: 
			return NDGraph(degree_sequence_dct.keys(), edges)
		else: 
			return None
		

	def print_adjacency_matrix(self):
		i = 0
		while i < len(self.nodes):
			j = 0
			while j < len(self.nodes):
				print str(self.adjacency_matrix[i][j]) + ' ',
				j += 1
			i += 1
			print

	def __eq__(self, other_graph):
		return self.adjacency_matrix == other_graph.adjacency_matrix

	def __str__(self):
		ans = 'G := (V, E)'
		ans += '\n' + 'V := {' + ', '.join(list(map(lambda x : str(x), self.nodes))) + '}'
		ans += '\n' + 'E := {' + ', '.join(list(map(lambda x : str(x), self.edges))) + '}'
		return ans

g = NDGraph([1,2,3,4,5,6], [(1,2), (1, 1), (1, 5), (2, 5), (2, 4), (5, 4), (3, 4), (2, 3)])

