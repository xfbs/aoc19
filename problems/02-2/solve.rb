
PROG = File.read(ARGV[0]).chomp.split(',').map(&:to_i).freeze

(0..99).each do |noun|
  (0..99).each do |verb|
    prog = PROG.dup

    # patch program
    prog[1] = noun
    prog[2] = verb

    ip = 0

    while prog[ip] != 99
      if prog[ip] == 1
        prog[prog[ip + 3]] = prog[prog[ip + 1]] + prog[prog[ip + 2]]
      elsif prog[ip] == 2
        prog[prog[ip + 3]] = prog[prog[ip + 1]] * prog[prog[ip + 2]]
      else
        puts 'fail'
      end
      ip += 4
    end

    if prog[0] == 19690720
      puts (100 * noun + verb).to_s.rjust(4, '0')
      exit
    end
  end
end
