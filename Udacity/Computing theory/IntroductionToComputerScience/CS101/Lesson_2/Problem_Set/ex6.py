# Define a procedure, find_last, that takes as input
# two strings, a search string and a target string,
# and returns the last position in the search string
# where the target string appears, or -1 if there
# are no occurences.
#
# Example: find_last('aaaa', 'a') returns 3

# Make sure your procedure has a return statement.

def find_last(okay,ok):
    i = -1
    while True: 
        n = okay.find(ok, i + 1)
        if n == -1:
            break
        i = n
    return i