module Api
  module V1
    module Customers
      class TransactionsController < ApiController
        respond_to :json, :xml

        def index
          respond_with Customer.find_by(id: params[:id]).transactions
        end
      end
    end
  end
end
