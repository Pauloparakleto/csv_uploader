class AddPriceToInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :price, :decimal
  end
end
