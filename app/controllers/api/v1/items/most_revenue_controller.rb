module Api
  module V1
    module Items
      class MostRevenueController < ApiController
        respond_to :json

        def index
          respond_with Item.most_revenue(params[:quantity])
        end
      end
    end
  end
end
