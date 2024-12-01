# file = File.open("input.txt")
# puts file.readlines.map(&:chomp).first
first = []
second = []
File.foreach('input.txt') do |line|
  first << line.split[0].to_i
  second << line.split[1].to_i
end

first_sorted = first.sort
second_sorted = second.sort

def differences(first, second)
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

puts diff.sum # 2285373
v = []
first_sorted.each do |num|
  v << num * second_sorted.select { |n| n.eql?(num) }.count
end

puts v.sum # 21142653
