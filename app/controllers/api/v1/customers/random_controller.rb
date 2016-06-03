module Api
  module V1
    module Customers
      class RandomController < ApiController
        respond_to :json 

        def show
          ids = Customer.pluck(:id)
          respond_with Customer.find(ids.sample)
        end
      end
    end
  end
end
