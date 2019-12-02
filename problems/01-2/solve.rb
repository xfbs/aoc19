#!/usr/bin/env ruby

def solve n
  if n <= 5
    return 0
  else
    f = (n / 3).floor - 2
    f + solve(f)
  end
end

puts File.read(ARGV[0]).split.map(&:to_i).map{|n| solve n}.sum
