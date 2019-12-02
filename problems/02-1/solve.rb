
prog = File.read(ARGV[0]).chomp.split(',').map(&:to_i)

# patch program
prog[1] = 12
prog[2] = 2

ip = 0

p prog

while prog[ip] != 99
  puts "#{prog[ip]} at #{ip}"
  if prog[ip] == 1
    prog[prog[ip + 3]] = prog[prog[ip + 1]] + prog[prog[ip + 2]]
  elsif prog[ip] == 2
    prog[prog[ip + 3]] = prog[prog[ip + 1]] * prog[prog[ip + 2]]
  else
    puts 'fail'
  end
  p prog

  ip += 4
end
