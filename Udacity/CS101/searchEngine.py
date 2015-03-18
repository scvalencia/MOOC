import urllib2

def get_page(url):
    '''Returns the HTML source code of a web page with URL url'''
	try:
		usock = urllib2.urlopen(url)
		data = usock.read()	
		return data
	except:
		return ""

def get_next_target(page):
    '''Finds the index of the string '<a href=' in the text, returns a tuple
       (url, end_quote) '''
    start_link = page.find('<a href=')
    if (start_link != -1):
        start_quote = page.find('"', start_link)
        end_quote = page.find('"', start_quote + 1)
        url = page[start_quote + 1:end_quote]
        return url, end_quote
    else:
        return None, 0

def get_all_links(page):
    '''Appends to a list a set of url's that are indexed by page '''
	l = []
	while True:		
		url, end_pos = get_next_target(page)
		if url != None:
			l.append(url)
			page = page[end_pos:]
		else:
			break
	return l

def union(p,q):
    for e in q:
        if e not in p:
            p.append(e)
#index = [['udacity', ['http://udacity.com', 'http://npr.org']],['computing', ['http://acm.org']]]
def crawl_web(seed):
    tocrawl = [seed]
    crawled = []
    index = []
    while tocrawl:
        page = tocrawl.pop()
        if page not in crawled:
        	content = get_page(page)
        	add_page_to_index(index, page, content)
            union(tocrawl, get_all_links(content))
            crawled.append(page)
    return index

def add_to_index(index,keyword,url):
    for item in index:
        if item[0] == keyword:
            item[1].append(url)
            return
    index.append([keyword,[url]])

def lookup(index,keyword):
    for item in index:
        if item[0] == keyword:
            return item[1]
    return []

def add_page_to_index(index,url,content):
    string_list = content.split()
    for it in string_list:
        add_to_index(index, it, url)


page = raw_input(">> ")
code = get_page(page)
print get_page(code)