lns = open('data.txt').read.split "\n"

$circut = {}
lns.each{|l| _, op, var = /([A-Za-z0-9_ ]+) -> (\w+)/.match(l).to_a
  $circut[var] = op
}

def isNum n
  n.to_i.to_s == n
end

def operate arg, arg2, op
  arg, arg2 = arg.to_i, arg2.to_i
  case op
    when 'LSHIFT'; arg << arg2
    when 'RSHIFT'; arg >> arg2
    when 'AND'   ; arg & arg2
    when 'OR'    ; arg | arg2
    when 'NOT'   ; ~arg
    else ; throw Exception('error')
  end % 65536
end

# realy dislike that shit hmm how to decreate it without making it 100% underable ;(
def find var
  exp = $circut[var]
  return exp if isNum(exp) #if num no more
  arg, arg2, op = nil, nil, nil #initials
  # checking operator
  opNot = /(NOT) ([a-z0-9]+)/.match(exp).to_a
  opRst = /([a-z0-9]+) (\w+) ([a-z0-9]+)/.match(exp).to_a
  # prepare params
  _, op, arg  = opNot  unless opNot.empty?
  _, arg, op, arg2 = opRst unless opRst.empty?
  # recursive powah
  return find exp if opNot.empty? and opRst.empty?
  arg  = find arg if !isNum(arg)
  arg2 = find arg2 if !isNum(arg2) and !arg2.nil?
  ret = operate arg, arg2, op #  do the shit
  $circut[var] = ret.to_s # save the shit /del that and wait hours for answer
  ret
end

puts find('a')