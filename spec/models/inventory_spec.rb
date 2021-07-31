require "rails_helper"

def inventory_valid
  FactoryBot.create(:inventory)
end

def invalid_inventory(attribute)
  inventory = FactoryBot.build(:inventory, "#{attribute}": nil)
  inventory.save
  inventory
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
        expect(invalid_inventory("name")).not_to be_valid
      end

      it "nil name message" do
        expect(invalid_inventory("name").errors.messages.first.second).to eq(["O nome não pode ficar em branco"])
      end

      it "nil value" do
        expect(invalid_inventory("value")).not_to be_valid
      end

      it "nil value message" do
        expect(invalid_inventory("value").errors.messages.first.second).to eq(["O valor não pode ficar em branco"])
      end

      it "nil quantity" do
        expect(invalid_inventory("quantity")).not_to be_valid
      end

      it "nil quantity message" do
        expect(invalid_inventory("quantity").errors.messages.first.second)
          .to eq(["A quantidade não pode ficar em branco"])
      end

      it "nil manufacturer" do
        expect(invalid_inventory("manufacturer")).not_to be_valid
      end

      it "nil manufacturer message" do
        expect(invalid_inventory("manufacturer").errors.messages.first.second)
          .to eq(["O nome do fabricante não pode ficar em branco"])
      end

      it "nil model" do
        expect(invalid_inventory("model")).not_to be_valid
      end

      it "nil model message" do
        expect(invalid_inventory("model").errors.messages.first.second).to eq(["O modelo não pode ficar em branco"])
      end

      it "nil color" do
        expect(invalid_inventory("color")).not_to be_valid
      end

      it "nil color message" do
        expect(invalid_inventory("color").errors.messages.first.second).to eq(["A cor não pode ficar em branco"])
      end

      it "nil carrier_plan_type" do
        expect(invalid_inventory("carrier_plan_type")).not_to be_valid
      end

      it "nil carrier_plan_type message" do
        expect(invalid_inventory("carrier_plan_type").errors.messages.first.second)
          .to eq(["O plano do aparelho não pode ficar em branco"])
      end

      it "nil price" do
        expect(invalid_inventory("price")).not_to be_valid
      end

      it "nil price message" do
        expect(invalid_inventory("price").errors.messages.first.second).to eq(["O preço não pode ficar em branco"])
      end
    end
  end
end
