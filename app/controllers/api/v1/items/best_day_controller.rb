module Api
  module V1
    module Items
      class BestDayController < ApiController
        respond_to :json

        def show
          item = Item.find(params[:id])
          respond_with date: item.best_day
        end
      end
    end
  end
end
