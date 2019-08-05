class Series
  def initialize(series)
    @series = (series)
  end

  def slices(length:)
    raise ArgumentError unless valid_slice_length?(length)
    series = @series
    substrings = []
    until series.length < length
      substrings << series[0..length-1]
      series = series[1..-1]
    end
    substrings
  end

  def valid_slice_length?(length)
    (1..@series.length).cover?(length)
  end
end
