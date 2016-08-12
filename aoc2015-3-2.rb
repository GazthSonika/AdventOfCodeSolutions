data = open('data.txt').read
x, y, marks = [0,0], [0,0], {'0 0' => 1}
 
data.each_char.with_index(0){|c, i|
        n = i % 2 == 0 ? 1 : 0
        x[n] += c == '<' ? -1 : c == '>'? 1 : 0
        y[n] += c == '^' ? 1 : c == 'v' ? -1 : 0
        marks["#{x[n]} #{y[n]}"] = 1
}
puts marks.size