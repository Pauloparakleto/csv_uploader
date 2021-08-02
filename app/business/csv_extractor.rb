require "csv"

class CsvExtractor
  def initialize(path: nil)
    @path = path
    @array = []
    @index = 1
  end

  def valid?
    return false if @path.blank?

    data = csv_data
    result = []
    data.each { |i| result << false if i.any? nil }
    result.empty?
  end

  def csv_data
    CSV.read(@path)
  end

  def build
    return nil unless valid?

    return update if Inventory.count.eql? 12

    build_inventories(@array, @index)
    @array
  end

  def update
    return nil unless valid?

    @id = Inventory.first.id
    @index = 1
    array = []
    update_inventories(array)
  end

  def update_inventories(array)
    csv_data.each do |table|
      next if table[0] == "manufacturer"

      update_each_and_find_next(array)
    end
  end

  def update_each_and_find_next(array)
    array << Inventory.find(@id).update(attributes(@index))
    @id += 1
    @index += 1
  end

  def attributes(index)
    csv_data
    attribute(index)
  end

  def attribute(index)
    { name: "MyString", value: "MyString", manufacturer: csv_data[index][0],
      model: model_att(index), color: csv_data[index][2], carrier_plan_type: csv_data[index][3],
      quantity: csv_data[index][4], price: csv_data[index][5].to_i }
  end

  def model_att(index)
    csv_data[index][1]
  end
end

private

def build_inventories(array, index)
  csv_data.each do |table|
    next if table[0] == "manufacturer"

    array << Inventory.create(attributes(index))
    index += 1
  end
end
