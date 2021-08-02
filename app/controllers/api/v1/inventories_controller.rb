module Api
  module V1
    class InventoriesController < ApplicationController
      def index
        @inventories = Inventory.all
        render html: @inventories, response: :ok
      end

      def create
        @inventories = CsvExtractor.new(path: params[:csv_file]).build
        render_response
      end

      def update_csv
        @inventories = CsvExtractor.new(path: params[:csv_file]).update
        render_response_update
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
          render json: @inventories, status: :created
        else
          render json: "O Arquivo CSV possui campos em branco.".to_json, status: :unprocessable_entity
        end
      end
    end
  end
end
