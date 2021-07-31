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
      name: "MyString", value: "MyString", quantity: "MyString", manufacturer: "MyString", model: "MyString",
      color: "MyString", carrier_plan_type: "MyString", price: 999.98
    }
  end
end
