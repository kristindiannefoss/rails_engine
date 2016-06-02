module Api
  module V1
    module Items
      class MerchantsController < ApiController
        respond_to :json, :xml

        def show
          respond_with Merchant.find(Item.find(params[:id]).merchant_id)
        end
      end
    end
  end
end
