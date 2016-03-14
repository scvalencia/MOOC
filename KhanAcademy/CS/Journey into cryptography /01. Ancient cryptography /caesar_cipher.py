import string

def set_dictionary(filename_src, filename_dst):
	fileobject = open(filename_src, 'r')
	dictionary = open(filename_dst, 'w')

	for word in fileobject:
		word = word.lower()
		newword = ''

		for ch in word:
			if ch in string.ascii_lowercase:
				newword += ch

		dictionary.write(newword + '\n')

def get_frequency(corpus):
	frequency = {ch : 0 for ch in string.ascii_lowercase}
	fileobject = open(corpus, 'r')

	for word in fileobject:
		word = word.lower()
		
		for ch in word:
			if ch != '\n':
				frequency[ch] += 1

	return frequency

def freq_word(word):
	freq = {ch : 0 for ch in string.ascii_lowercase}

	for ch in word:
		if ch != ' ':
			freq[ch] += 1

	return freq

def visualize_frequency(frequency):
	max_value = max(frequency.values())
	normalized_freqs = {ch : int(frequency[ch] * 150.0) / max_value for ch in frequency}

	print '=' * 150
	for ch in normalized_freqs:
		print ch, '*' * normalized_freqs[ch]
	print '=' * 150

def caesar_encryption(message, shift):
	message = message.lower()
	seed = string.ascii_lowercase
	shift = len(seed) - 1 if shift >= len(seed) else shift
	shifted_seed = seed[shift:] + seed[0:shift]

	encoded_message = ''

	for ch in message:
		if ch != ' ':
			index = seed.index(ch)
			encoded_message += shifted_seed[index]
		else:
			encoded_message += ' '

	return encoded_message

def main():
	set_dictionary('dct.txt', 'english.txt')
	frequency_count = get_frequency('english.txt')
	

	a = caesar_encryption('Genius without education is like silver in the mine', 2 + 7)
	b = caesar_encryption(a, 7 + 0)
	c = caesar_encryption(b, 0 + 2)
	d = caesar_encryption(c, 2 + 0)
	e = caesar_encryption(d, 2 + 0)
	f = caesar_encryption(e, 0 + 1)
	g = caesar_encryption(f, 1 + 6)
	h = caesar_encryption(g, 6 + 0)

	print h
	visualize_frequency(frequency_count)


if __name__ == '__main__':
	main()