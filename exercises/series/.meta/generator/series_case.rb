require 'generator/exercise_case'

class SeriesCase < Generator::ExerciseCase
  def workload
    [
      new_series_declaration,
      expected_declaration,
      assert_equal_or_raise
    ].reject(&:empty?)
  end

  private

  def new_series_declaration
    "series = Series.new('#{series}')\n"
  end

  def expected_declaration
    large_expected_size? ? "expected = #{expected}\n" : ""
  end

  def assert_equal_or_raise
    error_expected? ? assert_raises(ArgumentError, series_slices) : equality_assertion
  end

  def equality_assertion
    if large_expected_size?
      "assert_equal expected, #{series_slices}"
    else
      assert_equal(expected, series_slices)
    end
  end

  def series_slices
    "series.slices(length: #{sliceLength})"
  end

  def large_expected_size?
    expected.size > 4
  end

end
