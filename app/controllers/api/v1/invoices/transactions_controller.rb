module Api
  module V1
    module Invoices
      class TransactionsController < ApiController
        respond_to :json

        def index
          respond_with Invoice.find(params[:id]).transactions
        end
      end
    end
  end
end
