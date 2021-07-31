class CsvExtractor
  def initialize(path: nil)
    @path = path
  end

  def valid?
    data = csv_data
    result = []
    data.each { |i| result << false if i.any? nil }
    result.empty?
  end

  def csv_data
    CSV.read(@path)
  end

  def build
    array = []
    csv_data.each do
      array << Inventory.create(attributes)
    end
    array
  end

  def attributes
    csv_data
    {
      name: "MyString", value: "MyString", manufacturer: csv_data[1][0], model: csv_data[1][1],
      color: csv_data[1][2], carrier_plan_type: csv_data[1][3], quantity: csv_data[1][4], price: csv_data[1][5].to_i
    }
  end
end
