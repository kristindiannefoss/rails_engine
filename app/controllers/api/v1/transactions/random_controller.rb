module Api
  module V1
    module Transactions
      class RandomController < ApiController
        respond_to :json, :xml

        def show
          ids = Transaction.pluck(:id)
          respond_with Transaction.find(ids.sample)
        end
      end
    end
  end
end
