# frozen_string_literal: true

# Change the initial value string to integer reversible
class ChangeValueFromInventories < ActiveRecord::Migration[6.0]
  def change
    remove_column :inventories, :value
    add_column :inventories, :value, :integer
  end
end
