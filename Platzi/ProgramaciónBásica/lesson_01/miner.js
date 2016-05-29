function makemap(size) {
	var map = [];
	for (var i = 0; i < size; i++) {
		map[i] = [];
		for (var j = 0; j < size; j++) {
			map[i][j] = Math.random() >= 0.5;
		}
	}
	return map;
}

function boom() {
	alert("BOOM!!");
	document.write("<h1> BOOM!! You're dead </h1>");
}

function win() {
	alert("CONGRATS!!");
	document.write("<h1> You're a winner </h1>");
}

var size = 10;
var gametable = makemap(size);

var x, y, position;

alert("You're in a mined field\n" + 
	"Pick a position between 0 and " + (size - 1) + " for x and y.");
s
x = prompt("X position? (0 - " + (size - 1) + ")");
y = prompt("Y position? (0 - " + (size - 1) + ")");

position = gametable[x][y];

if(!position) {
	win();
} else {
	boom();
}

for (var i = 0; i < size; i++) {
	for (var j = 0; j < size; j++) {
		if(i == x && j == y)
			document.write(gametable[i][j] ? "<font size = \"6\" color=\"green\">|x|  " : 
				"<font size = \"6\" color=\"green\">|o|  ");
		else
			document.write(gametable[i][j] ? "<font size = \"6\" color=\"red\">|x|  " : 
				"<font size = \"6\" color=\"blue\">|o|  ");
	}
	document.write("<br>");
}