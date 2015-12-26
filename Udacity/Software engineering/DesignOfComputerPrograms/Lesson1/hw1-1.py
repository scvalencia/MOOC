# CS 212, hw1-1: 7-card stud
#
# -----------------
# User Instructions
#
# Write a function best_hand(hand) that takes a seven
# card hand as input and returns the best possible 5
# card hand. The itertools library has some functions
# that may help you solve this problem.
#
# -----------------
# Grading Notes
# 
# Muliple correct answers will be accepted in cases 
# where the best hand is ambiguous (for example, if 
# you have 4 kings and 3 queens, there are three best
# hands: 4 kings along with any of the three queens).

import itertools

def best_hand(hand):
	"From a 7-card hand, return the best 5 card hand."

	five_hands = [list(itm) for itm in itertools.combinations(hand, 5)]
	return max(five_hands, key=hand_rank)

def two_pair(ranks):
	"""If there are two pair, return the two ranks as a
	tuple: (highest, lowest); otherwise return None."""

	lst = set([rank for rank in ranks if ranks.count(rank) == 2])
	return (max(lst), min(lst)) if len(lst) == 2 else None

def kind(n, ranks):
	"""Return the first rank that this hand has exactly n of.
	Return None if there is no n-of-a-kind in the hand."""

	lst = [rank for rank in ranks if ranks.count(rank) == n]
	return lst.pop(0) if len(lst) > 0 else None

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

def card_ranks(hand):
	"Return a list of the ranks, sorted with higher first."

	# ranks = ['--23456789TJQKA'.index(r) for r, s in hand]
	# ranks.sort(reverse=True)
	
	dct = {str(i) : i for i in range(2, 10)}
	dct['T'] = 10; dct['J'] = 11; dct['Q'] = 12; dct['K'] = 13; dct['A'] = 14

	ranks = [dct[r] for r, s in hand]
	ranks.sort(reverse=True)
	return [5, 4, 3, 2, 1] if ranks == [14, 5, 4, 3, 2] else ranks

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

def test_best_hand():
	assert (sorted(best_hand("6C 7C 8C 9C TC 5C JS".split()))
		== ['6C', '7C', '8C', '9C', 'TC'])
	assert (sorted(best_hand("TD TC TH 7C 7D 8C 8S".split()))
		== ['8C', '8S', 'TC', 'TD', 'TH'])
	assert (sorted(best_hand("JD TC TH 7C 7D 7S 7H".split()))
		== ['7C', '7D', '7H', '7S', 'JD'])
	return 'test_best_hand passes'

def main():
	print test_best_hand()

if __name__ == '__main__':
	main()