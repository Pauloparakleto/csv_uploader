module Api
  module V1
    class InventoriesController < ApplicationController
      def index
        @inventories = Inventory.all
        render html: @inventories, response: :ok
      end

      def create
        @inventories = CsvExtractor.new(path: params[:csv_file]).build
        render json: @inventories, status: :created
      end
    end
  end
end
