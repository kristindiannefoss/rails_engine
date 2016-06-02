module Api
  module V1
    module Customers
      class TransactionsController < ApiController
        respond_to :json, :xml

        def index
          respond_with Transaction.where(customer_id: params[:id])
        end
      end
    end
  end
end
