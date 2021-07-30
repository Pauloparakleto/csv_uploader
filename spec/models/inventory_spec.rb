require "rails_helper"

def inventory_valid
  FactoryBot.create(:inventory)
end

RSpec.describe Inventory, type: :model do
  # TODO, check the difference between price decimal and value integer
  describe "Valid" do
    context "when create" do
      it "valid" do
        expect(inventory_valid).to be_valid
      end

      it "manufacturer" do
        expect(inventory_valid.manufacturer).to be_truthy
      end

      it "model" do
        expect(inventory_valid.model).to be_truthy
      end

      it "color" do
        expect(inventory_valid.color).to be_truthy
      end

      it "carrier_plan_type" do
        expect(inventory_valid.carrier_plan_type).to be_truthy
      end

      it "quantity" do
        expect(inventory_valid.quantity).to be_truthy
      end

      it "price" do
        expect(inventory_valid.price).to be_truthy
      end
    end
  end

  describe "Invalid" do
    context "when create" do
      it "nil name" do
        inventory = FactoryBot.build(:inventory, name: nil)
        inventory.save

        expect(inventory).not_to be_valid
      end

      it "nil name message" do
        inventory = FactoryBot.build(:inventory, name: nil)
        inventory.save

        expect(inventory.errors.messages.first.second).to eq(["O nome não pode ficar em branco"])
      end

      it "nil value" do
        inventory = FactoryBot.build(:inventory, value: nil)
        inventory.save

        expect(inventory).not_to be_valid
      end

      it "nil value message" do
        inventory = FactoryBot.build(:inventory, value: nil)
        inventory.save

        expect(inventory.errors.messages.first.second).to eq(["O valor não pode ficar em branco"])
      end

      it "nil quantity" do
        inventory = FactoryBot.build(:inventory, quantity: nil)
        inventory.save

        expect(inventory).not_to be_valid
      end

      it "nil quantity message" do
        inventory = FactoryBot.build(:inventory, quantity: nil)
        inventory.save

        expect(inventory.errors.messages.first.second).to eq(["A quantidade não pode ficar em branco"])
      end

      it "nil manufacturer" do
        inventory = FactoryBot.build(:inventory, manufacturer: nil)
        inventory.save

        expect(inventory).not_to be_valid
      end

      it "nil manufacturer message" do
        inventory = FactoryBot.build(:inventory, manufacturer: nil)
        inventory.save

        expect(inventory.errors.messages.first.second).to eq(["O nome do fabricante não pode ficar em branco"])
      end

      it "nil model" do
        inventory = FactoryBot.build(:inventory, model: nil)
        inventory.save

        expect(inventory).not_to be_valid
      end

      it "nil model message" do
        inventory = FactoryBot.build(:inventory, model: nil)
        inventory.save

        expect(inventory.errors.messages.first.second).to eq(["O modelo não pode ficar em branco"])
      end

      it "nil color" do
        inventory = FactoryBot.build(:inventory, color: nil)
        inventory.save

        expect(inventory).not_to be_valid
      end

      it "nil color message" do
        inventory = FactoryBot.build(:inventory, color: nil)
        inventory.save

        expect(inventory.errors.messages.first.second).to eq(["A cor não pode ficar em branco"])
      end

      it "nil carrier_plan_type" do
        inventory = FactoryBot.build(:inventory, carrier_plan_type: nil)
        inventory.save

        expect(inventory).not_to be_valid
      end

      it "nil carrier_plan_type message" do
        inventory = FactoryBot.build(:inventory, carrier_plan_type: nil)
        inventory.save

        expect(inventory.errors.messages.first.second).to eq(["O plano do aparelho não pode ficar em branco"])
      end

      it "nil price" do
        inventory = FactoryBot.build(:inventory, price: nil)
        inventory.save

        expect(inventory).not_to be_valid
      end

      it "nil price message" do
        inventory = FactoryBot.build(:inventory, price: nil)
        inventory.save

        expect(inventory.errors.messages.first.second).to eq(["O preço não pode ficar em branco"])
      end
    end
  end
end
