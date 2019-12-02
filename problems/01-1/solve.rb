#!/usr/bin/env ruby

def solve n
  (n / 3).floor - 2
end

puts File.read(ARGV[0]).split.map(&:to_i).map{|n| solve n}.sum
