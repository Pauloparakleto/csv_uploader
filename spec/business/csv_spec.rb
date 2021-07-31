require "rails_helper"
require "csv"
RSpec.describe CSV do
  describe "Valid" do
    context "when extract " do
      it "file path" do
        csv = described_class.read("spec/support/input_valid.csv")
        expect(csv).to be_truthy
      end
    end
  end
end
