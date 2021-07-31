require "rails_helper"
require "csv"
RSpec.describe CSV do
  describe "Valid" do
    context "when extract " do
      it "file path" do
        csv = CSV.read("spec/support/input_valid.csv")
        expect(csv).to be_truthy
      end
    end
  end
end
