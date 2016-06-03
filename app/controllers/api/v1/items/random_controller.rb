module Api
  module V1
    module Items
      class RandomController < ApiController
        respond_to :json 

        def show
          ids = Item.pluck(:id)
          respond_with Item.find(ids.sample)
        end
      end
    end
  end
end
