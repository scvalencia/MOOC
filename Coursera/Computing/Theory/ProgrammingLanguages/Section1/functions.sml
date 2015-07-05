val x = 7;

fun pow(x : int, y : int) =
	if y = 0 then 1
	else x * pow(x, y - 1);

fun cube(n : int) = pow(n, 3);

val eight = cube 2;

val fourtytwo = pow(2, 2 + 2) + pow(4, 2) + cube 2 + 2;

fun bind n = x;

val x = 9;
