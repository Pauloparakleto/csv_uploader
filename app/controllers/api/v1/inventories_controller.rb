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

      private

      def render_response
        if @inventories
          render json: @inventories, status: :created
        else
          render json: nil, status: :unprocessable_entity
        end
      end
    end
  end
end
