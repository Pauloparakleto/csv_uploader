class AddManufacturerToInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :manufacturer, :string
  end
end
