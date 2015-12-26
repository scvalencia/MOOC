def imperative_summation(n):
	total = 0
	for i in range(n + 1):
		total += i * i 
	return total

def functional_summation(n):
	numbers = map(lambda x : x * x, [_ for _ in range(n + 1)])
	return sum(numbers)

def norvig_summation(n):
	return sum(x * x for x in range(n + 1))

def main():
	print imperative_summation(3)
	print functional_summation(3)
	print norvig_summation(3)

	print max([1, 4, 5, 0, -7]), max([1, 4, 5, 0, -7], key=abs)

if __name__ == '__main__':
	main()