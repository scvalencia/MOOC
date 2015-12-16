import turtle

def draw_square(shape, color, speed):
	t = turtle.Turtle()

	t.shape(shape)
	t.color(color)
	t.speed(speed)

	for i in range(4):
		t.forward(100)
		t.right(90)

def draw_circle(shape, color, speed):
	t = turtle.Turtle()

	t.shape(shape)
	t.color(color)
	t.speed(speed)

	t.circle(100)

def draw_triangle(shape, color, speed):
	t = turtle.Turtle()

	t.shape(shape)
	t.color(color)
	t.speed(speed)

	t.backward(200)
	t.left(45)
	t.forward(200)
	t.goto(0, 0)

def draw_simple_figures():
	window = turtle.Screen()
	window.bgcolor('red')

	draw_square('arrow', 'black', 1)
	draw_circle('arrow', 'yellow', 1)
	draw_triangle('arrow', 'blue', 1)

	window.exitonclick()

def draw_complex_square(shape, color, speed):
	window = turtle.Screen()
	window.bgcolor('red')

	t = turtle.Turtle()

	t.shape(shape)
	t.color(color)
	t.speed(speed)

	for j in range(36):
		for i in range(4):
			t.forward(100)
			t.right(90)
		t.right(10)

	window.exitonclick()

def main():
	draw_complex_square('arrow', 'yellow', 4)

if __name__ == '__main__':
	main()