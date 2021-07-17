require "rails_helper"
RSpec.describe Inventory do
  context "when create" do
    it "name" do
      inventory = FactoryBot.create(:inventory, name: "samsung", value: 10.0, quantity: 4)

      expect(inventory.name).to eq("samsung")
    end

    it "value" do
      inventory = FactoryBot.create(:inventory, name: "samsung", value: 10.0, quantity: 4)

      expect(inventory.value).to eq(10.0)
    end

    it "quantity" do
      inventory = FactoryBot.create(:inventory, name: "samsung", value: 10.0, quantity: 4)

      expect(inventory.quantity).to eq(4)
    end
  end
end
