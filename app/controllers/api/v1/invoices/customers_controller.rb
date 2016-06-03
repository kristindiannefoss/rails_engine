module Api
  module V1
    module Invoices
      class CustomersController < ApiController
        respond_to :json

        def show
          respond_with Customer.find(Invoice.find(params[:id]).customer_id)
        end
      end
    end
  end
end
