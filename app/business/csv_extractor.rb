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
    index = 1
    csv_data.each do |table|
      next if table[0] == "manufacturer"
      array << Inventory.create(attributes(index))
      index += 1
    end
    array
  end

  def attributes(index)
    csv_data
    {
      name: "MyString", value: "MyString", manufacturer: csv_data[1][0], model: csv_data[1][1],
      color: csv_data[1][2], carrier_plan_type: csv_data[index][3], quantity: csv_data[1][4], price: csv_data[index][5].to_i
    }
  end
end
