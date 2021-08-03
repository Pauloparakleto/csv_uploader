module Api
  module V1
    class InventoriesController < ApplicationController
      def index
        @q = Inventory.ransack(params[:q])
        @inventories = @q.result(distinct: true)
        render template: "layouts/api/v1/inventories/index", locals: { inventories: @inventories }, status: :ok
      end

      def extract_csv
        @inventories = CsvExtractor.new(path: params[:csv_file]).build
        render_response
      end

      def create
        @inventories = CsvExtractor.new(path: params[:csv_file]).build
        render_response
      end

      def update_csv
        @inventories = CsvExtractor.new(path: params[:csv_file]).update
        render_response_update
      end

      def upload
        render template: "layouts/api/v1/inventories/upload"
      end

      private

      def render_response_update
        if @inventories
          render json: @inventories, status: :ok
        else
          render json: "O Arquivo CSV possui campos em branco.", status: :unprocessable_entity
        end
      end

      def render_response
        if @inventories
          flash[:notice] = "Upload realizado com sucesso!"
          redirect_to api_v1_inventories_path, locals: { inventories: Inventory.all }, status: :created
        else
          flash[:alert] = "Falha no upload. Arquivo inexistente ou campos em branco!"
          redirect_back fallback_location: "layouts/api/v1/inventories/upload", status: :unprocessable_entity
        end
      end
    end
  end
end
