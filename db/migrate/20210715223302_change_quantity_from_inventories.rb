class ChangeQuantityFromInventories < ActiveRecord::Migration[6.0]
  def change
    remove_column :inventories, :quantity
    add_column :inventories, :quantity, :integer
  end
end
