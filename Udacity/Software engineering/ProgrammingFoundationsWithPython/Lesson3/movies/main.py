from media import Movie
import fresh_tomatoes

def set_movies():

	movies = []

	m1 = Movie('Persona', 1966, 'Ingmar Bergman',
	 		    'A nurse is put in charge of an actress who can\'t \
	 			talk and finds that the actress\'s persona is melding with hers.',
	 			'http://ia.media-imdb.com/images/M/MV5BMTc1OTgxNjYyNF5BMl5BanBnXkFtZTcwNjM2MjM2NQ@@._V1_SX214_AL_.jpg',
	 			'https://www.youtube.com/watch?v=3rtSjV_gFkw')

	movies.append(m1)

	m2 = Movie('Manhattan', 1979, 'Woody Allen', 
				'The life of a divorced television writer dating a teenage \
				girl is further complicated when he falls in love with his best \
				friend\'s mistress.',
				'http://ia.media-imdb.com/images/M/MV5BMjI4MDIyNjcxMl5BMl5BanBnXkFtZTcwNjA4OTYwNA@@._V1_SX214_AL_.jpg',
				'https://www.youtube.com/watch?v=BNiIMhC8oII')

	movies.append(m2)

	m3 = Movie('Blue Velvet', 1986, 'David Lynch', 
				'The discovery of a severed human ear found in a field leads a young man \
				on an investigation related to a beautiful, mysterious nightclub singer and \
				a group of psychopathic criminals who have kidnapped her child.',
				'http://ia.media-imdb.com/images/M/MV5BMTczNjE4NTQwNF5BMl5BanBnXkFtZTgwODI3Mjc1MDE@._V1_SX214_AL_.jpg',
				'https://www.youtube.com/watch?v=bWr4JvAWF20')

	movies.append(m3)

	m4 = Movie('Todo sobre mi madre', 1999, 'Pedro Almodovar', 
				'Young Esteban wants to become a writer and also to discover the identity of \
				his father, carefully concealed by his mother Manuela.',
				'http://ia.media-imdb.com/images/M/MV5BMjE3OTg3MTk2NV5BMl5BanBnXkFtZTcwNzA4ODMyMQ@@._V1_SX214_AL_.jpg',
				'https://www.youtube.com/watch?v=hcVEvcP1iAc')

	movies.append(m4)

	m5 = Movie('Serpico', 1973, 'Sidney Lumet', 
				'The true story about an honest New York cop who blew the whistle on rampant \
				corruption in the force only to have his comrades turn against him.',
				'http://ia.media-imdb.com/images/M/MV5BMTkyNzQ2MjkzNl5BMl5BanBnXkFtZTgwODM2MzcxMTE@._V1_SX214_AL_.jpg',
				'https://www.youtube.com/watch?v=LtTRYnsDH8Q')

	movies.append(m5)

	m6 = Movie('The Graduate', 1967, 'Mike Nichols', 
				'A disillusioned college graduate finds himself torn between his older \
				lover and her daughter.',
				'http://ia.media-imdb.com/images/M/MV5BMTQ0ODc4MDk4Nl5BMl5BanBnXkFtZTcwMTEzNzgzNA@@._V1_SX214_AL_.jpg',
				'https://www.youtube.com/watch?v=hsdvhJTqLak')

	movies.append(m6)

	m7 = Movie('Midnight Cowboy', 1969, 'John Schlesinger', 
				'A naive hustler goes to New York to seek personal fortune but in the process \
				finds himself a new friend.',
				'http://ia.media-imdb.com/images/M/MV5BMTMzMjY1OTE5OV5BMl5BanBnXkFtZTcwMjUzNTk3NA@@._V1_SX214_AL_.jpg',
				'https://www.youtube.com/watch?v=a2yBydiEJrI')

	movies.append(m7)

	return movies

def main():
	movies = set_movies()

	fresh_tomatoes.open_movies_page(movies)

if __name__ == '__main__':
	main()