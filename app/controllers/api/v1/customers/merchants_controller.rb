module Api
  module V1
    module Customers
      class MerchantsController < ApiController
        respond_to :json

        def show
          respond_with Customer.find(params[:id]).favorite_merchant
        end
      end
    end
  end
end
