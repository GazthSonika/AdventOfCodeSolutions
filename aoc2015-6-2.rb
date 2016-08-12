lns = open('data.txt').read.split "\n"

arr = Array.new(1_000_000, 0)
lns.each{|l| _, action, ax, ay, bx, by = /(\w+) (\d+),(\d+) through (\d+),(\d+)/.match(l).to_a
  (ax..bx).each{|x| (ay..by).each{|y| idx = x.to_i*1000+y.to_i
      arr[idx] = action == 'toggle' ? arr[idx]+2 : action == 'on' ? arr[idx]+1 : [arr[idx]-1, 0].max
    }
  }
}

p arr.inject :+