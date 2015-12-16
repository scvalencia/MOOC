import sys
import time
import random
import pygame
import webbrowser
import subprocess

from osax import *


ACTIVITIES = ['Music', 'Walk', 'Window']

def add_resource(source, file_name = 'data/break.txt'):
	file_object = open(file_name, 'a')
	file_object.write('resource : ' + source + '\n')
	file_object.close()

def get_resources(file_name = 'data/break.txt'):
	resources = []
	file_object = open(file_name, 'r')

	for line in file_object:
		line = line.strip()
		if line != '':
			source = line.split()[-1]
			resources.append(source)

	file_object.close()
	return resources

def get_activity():
	activity = random.choice(ACTIVITIES)

	if activity == ACTIVITIES[0]:

		resources = get_resources()
		resource = random.choice(resources)
		webbrowser.open(resource)

	elif activity == ACTIVITIES[1]:

		sa = OSAX()
		sa.set_volume(10)
		return_code = subprocess.call(["afplay", 'data/walk.wav'])

	elif activity == ACTIVITIES[-1]:
		
		sa = OSAX()
		sa.set_volume(10)
		return_code = subprocess.call(["afplay", 'data/eye.wav'])

def isnumeric(s):
    try:
        float(s) # for int, long and float
    except ValueError:
        try:
            complex(s) # for complex
        except ValueError:
            return False

    return True

def usage():
	print 'break d p'
	print 'd : int, p : real'

def main():
	args = sys.argv[1:]

	if len(args) != 2:
		usage()

	else:
		if not isnumeric(args[0]) or not isnumeric(args[1]):
			usage()

		else:
			breaks = int(args[0])
			hours = float(args[1])

			pause = hours * 60
			current = 0

			while current < breaks:
				
				get_activity()
				time.sleep(pause)
				current += 1


if __name__ == '__main__':
	main()