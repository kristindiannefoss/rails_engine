module Api
  module V1
    module Merchants
      class MostItemsController < ApiController
        respond_to :json 

        def index
          respond_with Merchant.ranked_by_items(params[:quantity])
        end

      end
    end
  end
end
