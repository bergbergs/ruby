require 'minitest/autorun'
require_relative 'series'

# Common test data version: 1.0.0 01a7bb3
class SeriesTest < Minitest::Test
  def test_slices_of_one_from_one
    # skip
    series = Series.new('1')
    assert_equal ["1"], series.slices(length: 1)
  end

  def test_slices_of_one_from_two
    skip
    series = Series.new('12')
    assert_equal ["1", "2"], series.slices(length: 1)
  end

  def test_slices_of_two
    skip
    series = Series.new('35')
    assert_equal ["35"], series.slices(length: 2)
  end

  def test_slices_of_two_overlap
    skip
    series = Series.new('9142')
    assert_equal ["91", "14", "42"], series.slices(length: 2)
  end

  def test_slices_can_include_duplicates
    skip
    series = Series.new('777777')
    assert_equal ["777", "777", "777", "777"], series.slices(length: 3)
  end

  def test_slices_of_a_long_series
    skip
    series = Series.new('918493904243')
    expected = ["91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243"]
    assert_equal expected, series.slices(length: 5)
  end

  def test_slice_length_is_too_large
    skip
    series = Series.new('12345')
    assert_raises(ArgumentError) do
      series.slices(length: 6)
    end
  end

  def test_slice_length_cannot_be_zero
    skip
    series = Series.new('12345')
    assert_raises(ArgumentError) do
      series.slices(length: 0)
    end
  end

  def test_slice_length_cannot_be_negative
    skip
    series = Series.new('123')
    assert_raises(ArgumentError) do
      series.slices(length: -1)
    end
  end

  def test_empty_series_is_invalid
    skip
    series = Series.new('')
    assert_raises(ArgumentError) do
      series.slices(length: 1)
    end
  end
end
