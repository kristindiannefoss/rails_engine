module Api
  module V1
    module Merchants
      class RevenueController < ApiController
        respond_to :json, :xml

        def show
          respond_with Merchant.find(params[:id]).instance_revenue
        end
      end
    end
  end
end
