require "rails_helper"

RSpec.describe Inventory, type: :model do
  # TODO, check the difference between price decimal and value integer
  context "on create" do
    it "valid" do
      inventory = FactoryBot.create(:inventory)

      expect(inventory).to be_valid
    end

    it "manufacturer" do
      inventory = FactoryBot.create(:inventory)

      expect(inventory.manufacturer).to be_truthy
    end

    it "model" do
      inventory = FactoryBot.create(:inventory)

      expect(inventory.model).to be_truthy
    end

    it "color" do
      inventory = FactoryBot.create(:inventory)

      expect(inventory.color).to be_truthy
    end

    it "carrier_plan_type" do
      inventory = FactoryBot.create(:inventory)

      expect(inventory.carrier_plan_type).to be_truthy
    end

    it "quantity" do
      inventory = FactoryBot.create(:inventory)

      expect(inventory.quantity).to be_truthy
    end

    it "price" do
      inventory = FactoryBot.create(:inventory)

      expect(inventory.price).to be_truthy
    end
  end
end
