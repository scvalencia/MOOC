import webbrowser

class Movie(object):

	def __init__(self, title, year, director, story, poster_image_url, youtube_trailer_url):
		self.title = title
		self.year = year
		self.director = director
		self.story = story
		self.poster_image_url = poster_image_url
		self.trailer_youtube_url = youtube_trailer_url

	def show_trailer(self):
		webbrowser.open(self.youtube_trailer_url)