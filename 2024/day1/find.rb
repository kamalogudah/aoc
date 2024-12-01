# file = File.open("input.txt")
# puts file.readlines.map(&:chomp).first
first = []
second = []
File.foreach('input.txt') do |line|
  first << line.split[0]
  second << line.split[1]
end

first_sorted = first.sort
second_sorted = second.sort

def differences(first, second)
  first = first.to_i
  second = second.to_i
  if first >= second
    first - second
  else
    second - first
  end
end

diff = []
length = first_sorted.length
new_len = length - 1
(0..new_len).to_a.each do |i|
  diff << differences(first_sorted[i], second_sorted[i])
end

puts diff.sum
