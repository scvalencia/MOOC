var menu = ["Productos", "Ventas", "Contacto"];

for(var i = 0; i < menu.length; i++)
	document.write(menu[i] + "<br>");

var dofa = [["Fuerza", "Oportunidad"], ["Debilidades", "Amenazas"]];

var i = 0;
while(i < 3) {
	document.write("<br>");
	i += 1
}

for(var i = 0; i < dofa.length; i++) {
	for(var j = 0; j < dofa[i].length; j++)
		document.write(dofa[i][j] + " ");
	document.write("<br>");
}
