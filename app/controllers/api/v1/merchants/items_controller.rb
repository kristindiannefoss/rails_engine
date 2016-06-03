module Api
  module V1
    module Merchants
      class ItemsController < ApiController
        respond_to :json 

        def index
          respond_with Item.where(merchant_id: params[:id])
        end
      end
    end
  end
end
