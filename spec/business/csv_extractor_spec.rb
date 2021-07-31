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
      it "first instance of inventory" do
        path = "spec/support/input_valid.csv"
        result = described_class.new(path: path).build
        expect(result[0].class.name).to eq("Inventory")
      end

      it "inventory name" do
        path = "spec/support/input_valid.csv"
        result = described_class.new(path: path).build
        expect(result[0].name).to eq("MyString")
      end

      it "second instance of inventory" do
        path = "spec/support/input_valid.csv"
        result = described_class.new(path: path).build
        expect(result[1].class.name).to eq("Inventory")
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
        path = "spec/support/input_invalid.csv"
        result = described_class.new(path: path).valid?
        expect(result).to eq(false)
      end
    end
  end
end
