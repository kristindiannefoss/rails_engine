module Api
  module V1
    module Merchants
      class MostRevenueController < ApiController
        respond_to :json, :xml

        def index
          respond_with Merchant.ranked_by_revenue(params[:quantity])
        end

      end
    end
  end
end
