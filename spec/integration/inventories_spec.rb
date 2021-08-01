require "rails_helper"

RSpec.describe "Inventories", type: :request do
  it "index" do
    FactoryBot.create_list(:inventory, 3)
    headers = { "ACCEPT" => "application/html" }
    get "/api/v1/inventories", headers: headers
    expect(response).to have_http_status(:ok)
  end

  it "create by csv" do
    headers = { "ACCEPT" => "application/html" }
    post api_v1_inventories_path, params: { csv_file: fixture_file_upload("input_valid.csv") }, headers: headers
    expect(response).to have_http_status(:created)
  end
end
