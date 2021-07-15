require 'rails_helper'
RSpec.describe Inventory do
  context "Create" do
    it 'valid attributes' do
      inventory = FactoryBot.create(:inventory, name: "samsung", value: 10.0, quantity: 4)

      expect(inventory.name).to eq("samsung")
      expect(inventory.value).to eq(10.0)
      expect(inventory.quantity).to eq(4)
    end
  end
end