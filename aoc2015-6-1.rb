lns = open('data.txt').read.split "\n"

arr = Array.new(1_000_000, -1)
lns.each{|l| _, action, ax, ay, bx, by = /(\w+) (\d+),(\d+) through (\d+),(\d+)/.match(l).to_a
  (ax..bx).each{|x| (ay..by).each{|y| idx = x.to_i*1000+y.to_i
      arr[idx] = action == 'toggle' ? -arr[idx] : action == 'on' ? 1 : -1
    }
  }
}

p arr.select{|n| n == 1}.size