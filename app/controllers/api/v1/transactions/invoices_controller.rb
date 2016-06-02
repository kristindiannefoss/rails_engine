module Api
  module V1
    module Transactions
      class InvoicesController < ApiController
        respond_to :json, :xml

        def show
          respond_with Invoice.find(Transaction.find(params[:id]))
        end
      end
    end
  end
end
