import webbrowser

class Movie(object):
	'''A simple class to model the information and behaviour of a movie''' # Movie.__doc__, __name__, __module__

	VALID_RATINGS = ["G", "PG", "PG-13", "R"] # Movie.VALID_RATING

	def __init__(self, title, year, director, story, poster_image_url, youtube_trailer_url):
		self.title = title
		self.year = year
		self.director = director
		self.story = story
		self.poster_image_url = poster_image_url
		self.trailer_youtube_url = youtube_trailer_url

	def show_trailer(self):
		webbrowser.open(self.youtube_trailer_url)