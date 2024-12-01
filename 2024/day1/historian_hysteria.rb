require 'pry'
class HistorianHysteria
  def initialize(input_file)
    @input_file = input_file

    create_sorted_sides
  end

  def create_sorted_sides
    first = []
    second = []

    File.foreach(@input_file) do |line|
      first << line.split[0].to_i
      second << line.split[1].to_i
    end
    @first_sorted = first.sort
    @second_sorted = second.sort
    [@first_sorted, @first_sorted]
  end

  def differences(a, b)
    if a >= b
      a - b
    else
      b - a
    end
  end

  def part_one
    diff = []
    length = @first_sorted.length
    new_len = length - 1
    (0..new_len).to_a.each do |i|
      diff << differences(@first_sorted[i], @second_sorted[i])
    end

    diff.sum
  end

  def part_two
    v = []
    @first_sorted.each do |num|
      v << num * @second_sorted.select { |n| n.eql?(num) }.count
    end

    v.sum # 21142653
  end
end

h = HistorianHysteria.new('input.txt')
puts h.part_one
puts h.part_two
