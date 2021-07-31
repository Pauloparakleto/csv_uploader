class CsvExtractor
  def initialize(array: nil)
    @array = array
  end

  def valid?
    result = []
    @array.each { |i| result << false if i.any? nil }
    result.empty?
  end
end
