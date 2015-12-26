def poker(hands):
	return max(hands, key=hand_rank)
	
def hand_rank(hand):
	pass

def test():
	sf = ['6C', '7C', '8C', '9C', 'TC']
	fk = ['9D', '9H', '9S', '9C', '7D']
	fh = ['TD', 'TC', 'TH', '7C', '7D']

	assert poker([sf, fk, fh]) == sf
	assert poker([fh, fk]) == fk
	assert poker([fh, fh]) == fh
	assert poker([fh]) == fh
	assert poker([fk] + 99 * [fh]) == fk