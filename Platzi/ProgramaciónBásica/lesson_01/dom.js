var doc = document // HTML tree as a variable

function Personinit(name, age) {	
	var struct = {name : name, age : age};
	return struct;
}

var p1 = Personinit("Joel Spoloski", 34);
var p2 = Personinit("Anita Lockhard", 13);
var current = p2;

// document.write("<h1> NAME: " + current.name + "</h1>");
// document.write("<h1> AGE: " + current.age + "</h1>");

console.log(current);

function Person(name, age, img) {
	this.name = name;
	this.age = age;
	this.img = img;
	this.salary = 0;

	this.earn = function(salary) {
		this.salary += salary;
	}
}

function init() {
	var photo = "http://cdnb.20m.es/ciencia-para-llevar-csic/files/2014/10/Alberto_Casas_cuadrada.jpg";
	var fav = new Person("Albert Casas", 56, photo);
	dispname.textContent = fav.name;
	dispage.textContent = fav.age;
	dispimg.setAttribute("src", fav.img);
}