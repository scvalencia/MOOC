fileObjectIn = open('sentences.txt', 'r')
fileObjectOut = open('out.txt', 'w')
for line in fileObjectIn:
	message = '@"' + line[:-1] + '",'
	fileObjectOut.write(message + '\n')
fileObjectOut.write('nil];')

