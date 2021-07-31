require 'rails_helper'

RSpec.describe CsvExtractorFile, type: :model do
  it "has a blob file" do
    csv_extractor_file = FactoryBot.create(:csv_extractor_file)
    csv_extractor_file.csv_file.attach(io: File.open("spec/support/input_valid.csv"), filename: "input_valid.csv")
    expect(csv_extractor_file.csv_file).to be_truthy
  end
end
