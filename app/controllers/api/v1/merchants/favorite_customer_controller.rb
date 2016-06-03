module Api
  module V1
    module Merchants
      class FavoriteCustomerController < ApiController
        respond_to :json

        def show
          merchant = Merchant.find(params[:id])
          respond_with merchant.favorite_customer
        end
      end
    end
  end
end
