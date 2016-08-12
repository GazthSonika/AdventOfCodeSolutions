lns = open('data.txt').read.split "\n"

p lns.reject{|w|['ab','cd','pq', 'xy'].any?{|t|w.include? t}or w.squeeze.size>=w.size or w.scan(/[aeiou]/).count<3}.size