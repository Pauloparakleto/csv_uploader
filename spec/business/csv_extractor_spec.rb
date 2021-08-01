require "rails_helper"
require "csv"
RSpec.describe CsvExtractor do
  describe "Valid" do
    context "when extract" do
      it "file path to valid" do
        csv = CSV.read("spec/support/input_valid.csv")
        result = []
        csv.each { |i| result << true if i.any? nil }

        expect(result.any?(true)).to eq(false)
      end

      it "in csv class" do
        path = "spec/support/input_valid.csv"
        result = described_class.new(path: path).valid?
        expect(result).to eq(true)
      end
    end

    context "when build" do
      it "count" do
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build
        expect(result.length).to eq(12)
      end

      it "first instance of inventory" do
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build
        expect(result[0].class.name).to eq("Inventory")
      end

      it "inventory name" do
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build
        expect(result[0].name).to eq("MyString")
      end

      it "second instance of inventory" do
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build
        expect(result[1].class.name).to eq("Inventory")
      end
    end

    context "when extract attributes" do
      it "manufacturer" do
        data = CSV.read("spec/support/input_valid.csv")
        manufacturer = data[1][0]
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[0].manufacturer).to eq(manufacturer)
      end

      it "model" do
        data = CSV.read("spec/support/input_valid.csv")
        model = data[1][1]
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[0].model).to eq(model)
      end

      it "color" do
        data = CSV.read("spec/support/input_valid.csv")
        color = data[1][2]
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[0].color).to eq(color)
      end

      it "carrier_plan_type" do
        data = CSV.read("spec/support/input_valid.csv")
        carrier_plan_type = data[1][3]
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[0].carrier_plan_type).to eq(carrier_plan_type)
      end

      it "quantity" do
        data = CSV.read("spec/support/input_valid.csv")
        quantity = data[1][4].to_i
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[0].quantity).to eq(quantity)
      end

      it "price" do
        data = CSV.read("spec/support/input_valid.csv")
        price = data[1][5].to_i
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[0].price).to eq(price)
      end
    end

    context "when attributes have index" do
      it "first" do
        data = CSV.read("spec/support/input_valid.csv")
        price = data[1][5].to_i
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).attributes(1)
        expect(result[:price]).to eq(price)
      end

      it "last" do
        data = CSV.read("spec/support/input_valid.csv")
        price = data[12][5].to_i
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).attributes(12)
        expect(result[:price]).to eq(price)
      end
    end

    context "when extract attributes to collection" do
      it "manufacturers" do
        data = CSV.read("spec/support/input_valid.csv")
        manufacturer_second = data[2][0]
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[1].manufacturer).to eq(manufacturer_second)
      end

      it "model" do
        data = CSV.read("spec/support/input_valid.csv")
        model_second = data[2][1]
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[1].model).to eq(model_second)
      end

      it "color" do
        data = CSV.read("spec/support/input_valid.csv")
        color_second = data[2][2]
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[1].color).to eq(color_second)
      end

      it "carrier_plan_type" do
        data = CSV.read("spec/support/input_valid.csv")
        carrier_plan_type_second = data[2][3]
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[1].carrier_plan_type).to eq(carrier_plan_type_second)
      end

      it "quantity" do
        data = CSV.read("spec/support/input_valid.csv")
        quantity_second = data[2][4].to_i
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[1].quantity).to eq(quantity_second)
      end

      it "price" do
        data = CSV.read("spec/support/input_valid.csv")
        price_second = data[2][5].to_i
        params = { csv_file: fixture_file_upload("input_valid.csv") }
        result = described_class.new(path: params[:csv_file]).build

        expect(result[1].price).to eq(price_second)
      end
    end
  end

  describe "Invalid" do
    context "when extract" do
      it "file path to invalid" do
        csv = CSV.read("spec/support/input_invalid.csv")
        result = []
        csv.each { |i| result << true if i.any? nil }

        expect(result.any?(true)).to eq(true)
      end

      it "in csv class" do
        params = { csv_file: fixture_file_upload("input_invalid.csv") }
        result = described_class.new(path: params[:csv_file]).valid?
        expect(result).to eq(false)
      end

      it "nil file" do
        path = nil
        result = described_class.new(path: path).valid?
        expect(result).to eq(false)
      end

      it "empty file" do
        path = ""
        result = described_class.new(path: path).valid?
        expect(result).to eq(false)
      end
    end

    context "when build" do
      it "nil file" do
        path = nil
        result = described_class.new(path: path).build
        expect(result).to eq(nil)
      end

      it "empty file" do
        path = ""
        result = described_class.new(path: path).build
        expect(result).to eq(nil)
      end
    end
  end
end
