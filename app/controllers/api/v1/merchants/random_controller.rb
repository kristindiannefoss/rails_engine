module Api
  module V1
    module Merchants
      class RandomController < ApiController
        respond_to :json, :xml

        def show
          ids = Merchant.pluck(:id)
          respond_with Merchant.find(ids.sample)
        end
      end
    end
  end
end
