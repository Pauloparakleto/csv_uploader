require "rails_helper"

RSpec.describe "Inventories", type: :request do
  describe "Templates" do
    it "gets root to inventories" do
      get root_path
      expect(response).to have_http_status(:ok)
    end

    it "gets index" do
      get api_v1_inventories_path
      expect(response).to have_http_status(:ok)
    end

    it "gets upload" do
      get upload_api_v1_inventories_url
      expect(response).to have_http_status(:ok)
    end
  end

  describe "Extract CSV Action" do
    context "when update" do
      before do
        headers = { "ACCEPT" => "application/html" }
        post extract_csv_api_v1_inventories_path, params: { csv_file: fixture_file_upload("input_valid.csv") },
                                                  headers: headers
      end

      it "update by csv" do
        headers = { "ACCEPT" => "application/html" }
        post extract_csv_api_v1_inventories_path, params: { csv_file: fixture_file_upload("input_valid_update.csv") },
                                                  headers: headers
        expect(response).to have_http_status(:created)
      end
    end

    it "create by csv" do
      headers = { "ACCEPT" => "application/html" }
      post extract_csv_api_v1_inventories_path, params: { csv_file: fixture_file_upload("input_valid.csv") },
                                                headers: headers
      expect(response).to have_http_status(:created)
    end
  end

  describe "Status Response" do
    context "when create" do
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

      it "redirect to index" do
        headers = { "ACCEPT" => "application/html" }
        post api_v1_inventories_path, params: { csv_file: fixture_file_upload("input_valid.csv") }, headers: headers
        redirect_to(api_v1_inventories_path)
      end
    end

    context "when update" do
      before do
        post api_v1_inventories_path, params: { csv_file: fixture_file_upload("input_valid.csv") }, headers: headers
      end

      it "by csv" do
        headers = { "ACCEPT" => "application/html" }
        post update_csv_api_v1_inventories_url, params: { csv_file: fixture_file_upload("input_valid_update.csv") },
                                                headers: headers
        expect(response).to have_http_status(:ok)
      end

      it "by csv invalid message body" do
        headers = { "ACCEPT" => "application/html" }
        post update_csv_api_v1_inventories_url, params: { csv_file: fixture_file_upload("input_invalid.csv") },
                                                headers: headers
        expect(response.body).to eq("O Arquivo CSV possui campos em branco.")
      end

      it "by csv invalid status" do
        headers = { "ACCEPT" => "application/html" }
        post update_csv_api_v1_inventories_url, params: { csv_file: fixture_file_upload("input_invalid.csv") },
                                                headers: headers
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    describe "Invalid Csv" do
      it "have status 401" do
        headers = { "ACCEPT" => "application/html" }
        post api_v1_inventories_path, params: { csv_file: fixture_file_upload("input_invalid.csv") }, headers: headers
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "render upload template" do
        headers = { "ACCEPT" => "application/html" }
        post api_v1_inventories_path, params: { csv_file: fixture_file_upload("input_invalid.csv") }, headers: headers
        render_template upload_api_v1_inventories_path
      end

      it "nil csv create" do
        headers = { "ACCEPT" => "application/html" }
        post api_v1_inventories_path, params: { csv_file: nil }, headers: headers
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "empty csv create" do
        headers = { "ACCEPT" => "application/html" }
        post api_v1_inventories_path, params: { csv_file: "" }, headers: headers
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
