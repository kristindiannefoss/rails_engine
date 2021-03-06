module Api
  module V1
    module Invoices
      class MerchantsController < ApiController
        respond_to :json 

        def show
          respond_with Merchant.find(Invoice.find(params[:id]).merchant_id)
        end
      end
    end
  end
end
