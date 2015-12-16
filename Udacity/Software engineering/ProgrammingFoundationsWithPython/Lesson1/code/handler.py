import os
import sys
import random

def load_codes(bound, file_name = 'data/cities.txt'):
	file_object = open(file_name, 'r')
	cities =  file_object.readlines()[1:]
	codes = []

	i = 0
	for city in cities:
		code, city = tuple(city.split('\t'))
		city = city.strip()
		city = city.replace('\t', '')
		city = city.replace('\r', '')
		city = city.replace(' ', '_')
		city = city.lower()

		flag = True

		if "'" in city or '`' in city:
			flag = False

		if flag:
			cities[i] = city
			i += 1

		if i == bound + 10:
			break

	random.shuffle(cities)

	i = 0
	for city in cities:
		if len(city.split('\t')) != 2:
			codes.append(city)
			i += 1

		if i == bound:
			break

	return codes

def parse(file_name_source):
	file_object = open(file_name_source, 'r')

	chars = []

	for line in file_object:
		for ch in line:
			chars.append(ch)

	return chars

def join_chunks(path):
	files = os.listdir(path)
	message = ''
	
	for f in files:
		file_object = open(f, 'r')
		char = file_object.readlines()[0]

		if len(char) == 1:
			message += char
		else:
			message += char[0]

	return message

def encrypt(parsed_message, folder_name_destiny = 'data/crypto'):
	items_num = len(parsed_message)
	cities = sorted(load_codes(items_num))
	numbers = random.sample(xrange(100 * items_num), items_num)
	
	names = [(char, str(number) + city + '.txt') for char, number, city in zip(parsed_message, numbers, cities)]

	current = os.getcwd()

	if not os.path.exists(current + '/' + folder_name_destiny):
		os.mkdir(current + '/' + folder_name_destiny)

	os.chdir(current + '/' + folder_name_destiny)

	for chunk, file_name in names:
		file_object = open(file_name, 'w')
		file_object.write(chunk + '\n')

	os.chdir(current)

def decrypt(folder_name = 'data/crypto'):
	current = os.getcwd()
	os.chdir(current + '/' + folder_name)

	files = os.listdir(os.getcwd())
	files = [f for f in files if f[0] != '.']

	for file_name in files:
		new_name = file_name.translate(None, '0123456789')
		os.rename(file_name, new_name)

	message = join_chunks(os.getcwd())

	os.chdir(current)

	return message

def usage():
	print 'handler [-e | -d]'

def main():
	args = sys.argv[1:]

	if len(args) != 1: 
		usage()
	else:
		if args[0] not in ['-e', '-d']:
			usage()

		else:
			if args[0] == '-e':
				parsed_message = parse('data/message.txt')
				encrypt(parsed_message)
			else:
				print decrypt()

if __name__ == '__main__':
	main()