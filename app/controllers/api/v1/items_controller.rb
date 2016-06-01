module Api
  module V1
    class ItemsController < ApiController
      respond_to :json, :xml

      def index
        respond_with Item.all
      end

      def show
        respond_with Item.find(params[:id])
      end
      # 
      # def find
      #   respond_with Item.find_by(item_params)
      # end
      #
      # private
      #
      #   def item_params
      #     params.permit(:name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
      #   end
    end
  end
end
