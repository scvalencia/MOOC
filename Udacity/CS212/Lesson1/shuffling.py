import math
import random
import itertools
import collections

def swap(iterable, i, j):
	iterable[i], iterable[j] = iterable[j], iterable[i]

def nondeterministic_shuffle(iterable):
	n = len(iterable)
	swapped = [False for _ in range(n)]

	while not all(swapped):
		i, j = random.randint(0, n - 1), random.randint(0, n - 1)
		swapped[i] = swapped[j] = True
		swap(iterable, i, j)

def deterministic_shuffle(iterable):
	n = len(iterable)
	for i in range(n - 1):
		swap(iterable, i, random.randint(i, n - 1))

def shuffler2(iterable):
	n = len(iterable)
	swapped = [False for _ in range(n)]

	while not all(swapped):
		i, j = random.randint(0, n - 1), random.randint(0, n - 1)
		swapped[i] = True
		swap(iterable, i, j)

def shuffler3(iterable):
	n = len(iterable)
	for i in range(n - 1):
		swap(iterable, i, random.randint(0, n - 1))

def simulation(iterable, algorithm):
	bound = len(iterable) * 1000
	permutations = [list(itm) for itm in itertools.permutations(iterable)]
	counts = [0 for _ in permutations]
	old_iterable = [i for i in iterable]
	
	for i in range(bound):
		algorithm(iterable)
		index = permutations.index(iterable)
		counts[index] += 1
		iterable = [i for i in old_iterable]

	for i, itm in enumerate(permutations):
		str1 = ''.join(str(e) for e in itm)
		print "%18s : %6.3f %%" % (str1, 100.*counts[i]/bound)

def test_shuffler(algorithm, iterable, n=10000):
	counts = collections.defaultdict(int)
	for _ in range(n):
		input = list(iterable)
		algorithm(input)
		counts[''.join(input)] += 1
	e = n*1. / math.factorial(len(iterable))
	ok = all((0.9 <= counts[item] / e <= 1.1) for item in counts)

	name = algorithm.__name__
	print "%s(%s) %s" % (name, iterable, ('ok' if ok else '*** BAD ***'))

def test_shufflers(shufflers, iterables):
	for itm in iterables:
		print
		for shuffler in shufflers:
			test_shuffler(shuffler, itm)

def main():

	lst = [str(i) for i in range(3)]
	simulation(lst, nondeterministic_shuffle)
	print
	lst = [str(i) for i in range(3)]
	simulation(lst, deterministic_shuffle)
	print
	lst = [str(i) for i in range(3)]
	simulation(lst, shuffler2)
	print
	lst = [str(i) for i in range(3)]
	simulation(lst, shuffler3)

	lst = [str(i) for i in range(3)]
	test_shufflers([nondeterministic_shuffle, deterministic_shuffle, shuffler2, shuffler3], [lst])

if __name__ == '__main__':
	main()