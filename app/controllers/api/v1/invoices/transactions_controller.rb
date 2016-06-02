module Api
  module V1
    module Invoices
      class TransactionsController < ApiController
        respond_to :json, :xml

        def index
          respond_with Transaction.where(invoice_id: params[:id])
        end
      end
    end
  end
end
