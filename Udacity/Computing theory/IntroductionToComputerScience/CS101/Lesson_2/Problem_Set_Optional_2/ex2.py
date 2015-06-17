# By Websten from forums
#
# Given your birthday and the current date, calculate your age in days. 
# Account for leap days. 
#
# Assume that the birthday and current date are correct dates (and no 
# time travel). 
#

import datetime

def isLeap(year):
    p = year % 4 == 0
    q = year % 100 != 0
    r = year % 400 == 0
    if (p and q) or r:
        return True
    else:
        return False

def daysBetweenDates(year1, month1, day1, year2, month2, day2, opt = False):
    if not opt:
        d1 = datetime.date(year1, month1, day1)
        d2 = datetime.date(year2, month2, day2)
        days = d2 - d1
        return days.days
    m = month1
    d = day1
    ans = 0
    days = {1:31, 2:28, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30, 12:31}
    if year1 == year2:
        if isLeap(year1):
            days[2] = 29
        for month in range(month1, month2 + 1):
            minBound = day1
            maxBound = 0
            if month == month2:
                maxBound = day2 + 1
            else:
                maxBound =  days[month] + 1
            elapsedDays = len(range(minBound, maxBound))
            ans += elapsedDays
            day1 = 1
        return ans - 1

    for year in range(year1, year2):
        for month in range(month1, 13):
            if(isLeap(year) and month == 2):
                ans += 29
            else:
                ans += days[month]
        month1 = 1

    if isLeap(year2):
        days[2] = 29
    for month in range(m, month2 + 1):
        minBound = d
        maxBound = 0
        if month == month2:
            maxBound = day2 + 1
        else:
            maxBound =  days[month] + 1
        elapsedDays = len(range(minBound, maxBound))
        ans += elapsedDays
        d = 1

    return ans - 1

# Test routine

def test():
    test_cases = [((2012,1,1,2012,2,28), 58), 
                  ((2012,1,1,2012,3,1), 60),
                  ((2011,6,30,2012,6,30), 366),
                  ((2011,1,1,2012,8,8), 585 ),
                  ((1900,1,1,1999,12,31), 36523)]
    for (args, answer) in test_cases:
        result = daysBetweenDates(*args)
        if result != answer:
            print "Test with data:", args, "failed"
        else:
            print "Test case passed!"

test()