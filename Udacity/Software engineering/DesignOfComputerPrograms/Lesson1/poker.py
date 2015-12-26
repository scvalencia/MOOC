import random

hand_names = ['Straight flush', 'Four of kind', 'Full house', 'Flush', \
'Straight', 'Three of a kind', 'Two pair', 'Pair', 'High card']

def hand_percentages(n=700*1000):
	counts = [0] * 9
	for i in range(n/10):
		for hand in deal(10):
			ranking = hand_rank(hand)[0]
			counts[ranking] += 1

	for i in reversed(range(9)):
		print "%18s : %6.3f %%" % (hand_names[i], 100.*counts[i]/n)

def deal(numhands, n=5, deck=[r + s for r in '23456789TJQKA' for s in 'SHDC']):
	"Shuffle the deck and deal out numhands n-card hands"

	random.shuffle(deck)
	return [deck[n * i : n * (i + 1)] for i in range(numhands)]

def poker(hands):
	"Return a list of winning hands: poker([hand,...]) => [hand,..]"

	return allmax(hands, key=hand_rank)

def allmax(iterable, key=None):
	"Return a list of all items equal to the max of the iterable."

	'''
	result, maxval = [], None
	key = key or (lambda x : x)
	for x in iterable:
		xval = key(x)
		if not result or xval > maxval:
			result, maxval = [x], xval
		elif xval == maxval:
			result.append(x)
	return result
	'''

	maximum = max(iterable, key=key) if key else max(iterable)
	return filter(lambda x : key(x) == key(maximum), iterable)

def hand_rank(hand):
	"Returns a calue indicating the rankgin of a hand"

	ranks = card_ranks(hand)

	if straight(ranks) and flush(hand):
		return (8, max(ranks))
	elif kind(4, ranks):
		return (7, kind(4, ranks), kind(1, ranks))
	elif kind(3, ranks) and kind(2, ranks):
		return (6, kind(3, ranks), kind(2, ranks))
	elif flush(hand):
		return (5, ranks)
	elif straight(ranks):
		return (4, max(ranks))
	elif kind(3, ranks):
		return (3, kind(3, ranks), ranks)
	elif two_pair(ranks):
		return (2, two_pair(ranks), ranks)
	elif kind(2, ranks):
		return (1, kind(2, ranks), ranks)
	else:
		return (0, ranks)

def straight(ranks):
	"Return True if the ordered ranks form a 5-card straight."

	# return (max(ranks) - min(ranks) == 4 and len(set(ranks)) == 5)
	maximum = max(ranks)
	lst = [i for i in range(maximum - 4, maximum + 1)]
	lst.sort(reverse=True)
	return ranks == lst

def flush(hand):
	"Returns True if the hand is a flush."

	suites = set([s for r, s in hand])
	return len(suites) == 1

def kind(n, ranks):
	"""Return the first rank that this hand has exactly n of.
	Return None if there is no n-of-a-kind in the hand."""

	lst = [rank for rank in ranks if ranks.count(rank) == n]
	return lst.pop(0) if len(lst) > 0 else None

def two_pair(ranks):
	"""If there are two pair, return the two ranks as a
	tuple: (highest, lowest); otherwise return None."""

	lst = set([rank for rank in ranks if ranks.count(rank) == 2])
	return (max(lst), min(lst)) if len(lst) == 2 else None


def card_ranks(hand):
	"Return a list of the ranks, sorted with higher first."

	# ranks = ['--23456789TJQKA'.index(r) for r, s in hand]
	# ranks.sort(reverse=True)
	
	dct = {str(i) : i for i in range(2, 10)}
	dct['T'] = 10; dct['J'] = 11; dct['Q'] = 12; dct['K'] = 13; dct['A'] = 14

	ranks = [dct[r] for r, s in hand]
	ranks.sort(reverse=True)
	return [5, 4, 3, 2, 1] if ranks == [14, 5, 4, 3, 2] else ranks

def test():
	"Test cases for the functions in poker program"

	sf = ['6C', '7C', '8C', '9C', 'TC']
	fk = ['9D', '9H', '9S', '9C', '7D']
	fh = ['TD', 'TC', 'TH', '7C', '7D']
	tp = ['5S', '5D', '9H', '9C', '6S']
	sf1 = "6C 7C 8C 9C TC".split() # Straight Flush
	sf2 = "6D 7D 8D 9D TD".split() # Straight Flush

	assert straight([9, 8, 7, 6, 5]) == True
	assert straight([9, 8, 8, 7, 6]) == False

	assert flush(sf) == True
	assert flush(fk) == False

	assert card_ranks(sf) == [10, 9, 8, 7, 6]
	assert card_ranks(fk) == [9, 9, 9, 9, 7]
	assert card_ranks(fh) == [10, 10, 10, 7, 7]

	fkranks = card_ranks(fk)
	tpranks = card_ranks(tp)
	assert kind(4, fkranks) == 9
	assert kind(3, fkranks) == None
	assert kind(2, fkranks) == None
	assert kind(1, fkranks) == 7

	assert poker([sf, fk, fh]) == [sf]
	assert poker([fh, fk]) == [fk]
	assert poker([fh, fh]) == [fh, fh]
	assert poker([fh]) == [fh]
	assert poker([fk] + 99 * [fh]) == [fk]
	assert poker([sf1, sf2, fk, fh]) == [sf1, sf2] 

	assert hand_rank(sf) == (8, 10)
	assert hand_rank(fk) == (7, 9, 7)
	assert hand_rank(fh) == (6, 10, 7)

	print 'tests pass'

def main():
	test()

if __name__ == '__main__':
	main()