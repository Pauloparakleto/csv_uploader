class AddDetailsToInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :color, :string
    add_column :inventories, :carrier_plan_type, :string
  end
end
