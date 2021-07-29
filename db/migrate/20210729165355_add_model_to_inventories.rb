class AddModelToInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :model, :string
  end
end
