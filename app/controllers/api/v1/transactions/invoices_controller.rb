module Api
  module V1
    module Transactions
      class InvoicesController < ApiController
        respond_to :json, :xml

        def show
          respond_with Invoice.find_by(
          id:(Transaction.find(params[:id]).invoice_id)
          )
        end
      end
    end
  end
end
