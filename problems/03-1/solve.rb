require 'matrix'

wires = File.read(ARGV[0]).chomp.split("\n").map do |d|
  l = d.split(',').map do |item|
    [item[0], item[1..-1].to_i]
  end
end

DIRS = {
  "R" => Vector[1, 0],
  "L" => Vector[-1, 0],
  "U" => Vector[0, 1],
  "D" => Vector[0, -1]
}.freeze

def positions dirs
  pos = Vector[0, 0]
  dirs.each do |dir, len|
    movement = DIRS[dir]
    final = pos + len * movement
    while pos != final
      yield pos
      pos += movement
    end
  end

  yield pos
end

grid = {}
positions(wires.first) do |pos|
  grid[[pos[0], pos[1]]] = :left
end

collisions = []
positions(wires[1]) do |pos|
  if grid[[pos[0], pos[1]]]
    collisions << pos
  end
end

collisions.sort_by!{|pos| pos.to_a.map(&:abs).sum}

p collisions[1]
p collisions[1].to_a.map(&:abs).sum
