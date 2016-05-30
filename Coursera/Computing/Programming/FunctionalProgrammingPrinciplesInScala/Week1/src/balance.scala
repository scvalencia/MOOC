def balance(chars: List[Char]): Boolean = {

	def loop(chars: List[Char], count: Int): Boolean = {

		if (chars.isEmpty) (count == 0)
		else {
			if (count < 0) false
			else {

				if (chars.head == '(') loop(chars.tail, count + 1)
				else if (chars.head == ')') loop(chars.tail, count - 1)
				else loop(chars.tail, count)
				
			}
		}

	}

	loop(chars, 0)
}

val chars = "())("
println(balance(chars.toList))