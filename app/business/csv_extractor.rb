class CsvExtractor
  def initialize(path: nil)
    @path = path
  end

  def valid?
    data = CSV.read(@path)
    result = []
    data.each { |i| result << false if i.any? nil }
    result.empty?
  end

  def build
    data = CSV.read(@path)
    array = []
    data.each do
      array << Inventory.create(attributes)
    end
    array
  end

  def attributes
    data = CSV.read(@path)
    {
      name: "MyString",
      value: "MyString",
      quantity: "MyString",
      manufacturer: "MyString",
      model: "MyString",
      color: "MyString",
      carrier_plan_type: "MyString",
      price: 999.98,
    }

  end
end
