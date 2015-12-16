import json
import urllib

def read_file(file_name):
	file_object = open(file_name, 'r')
	content = file_object.read()
	file_object.close()
	return content

def check_profanity(text):
	url = 'http://www.wdyl.com/profanity?q=' + text
	connection = urllib.urlopen(url)
	response = connection.read()
	connection.close()
	parsed_json = json.loads(response)
	return parsed_json

def main():
	text = read_file('movie_quotes.txt')
	response = str(check_profanity(text)['response'])
	response = False if response == 'false' else True
	print response

if __name__ == '__main__':
	main()