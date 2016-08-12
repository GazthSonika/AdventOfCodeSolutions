data = open('data.txt').read
x, y, marks = 0, 0, {"0 0" => 1}

data.each_char{|c|
	x += c == '<' ? -1 : c == '>'? 1 : 0
	y += c == '^' ? 1 : c == 'v' ? -1 : 0
	marks["#{x} #{y}"] = 1	
}
puts marks.size