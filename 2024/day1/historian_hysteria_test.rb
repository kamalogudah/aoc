require 'minitest/autorun'
require 'tempfile'
require_relative 'historian_hysteria'
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class HistorianHysteriaTest < Minitest::Test
  def setup
    # Create a temporary file with sample input data
    @tempfile = Tempfile.new('test_input')
    @tempfile.write("1 4\n3 2\n5 6\n") # Sample data for testing
    @tempfile.rewind

    # Initialize HistorianHysteria with the temporary file
    @historian = HistorianHysteria.new(@tempfile.path)
  end

  def teardown
    @tempfile.close
    @tempfile.unlink # Delete the temporary file
  end

  def test_create_sorted_sides
    expected_first_sorted = [1, 3, 5]
    expected_second_sorted = [2, 4, 6]

    assert_equal expected_first_sorted, @historian.instance_variable_get(:@first_sorted)
    assert_equal expected_second_sorted, @historian.instance_variable_get(:@second_sorted)
  end

  def test_differences
    assert_equal 3, @historian.differences(5, 2)
    assert_equal 2, @historian.differences(2, 4)
  end

  def test_part_one
    # Expected difference calculations: |1-2| + |3-4| + |5-6| = 1 + 1 + 1
    assert_equal 3, @historian.part_one
  end

  def test_part_two
    # For the given data, part_two computes:
    # 1 * count(1 in second_sorted) +
    # 3 * count(3 in second_sorted) +
    # 5 * count(5 in second_sorted) = 0 (as there are no matching elements)
    assert_equal 0, @historian.part_two
  end
end
