module Api
  module V1
    module Merchants
      class RevenueController < ApiController
        respond_to :json

        def show
          date = params[:date]
          total = Merchant.find(params[:id]).total_revenue(date)
          respond_with revenue: total
        end
      end
    end
  end
end
