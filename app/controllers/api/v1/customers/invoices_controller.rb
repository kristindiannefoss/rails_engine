module Api
  module V1
    module Customers
      class InvoicesController < ApiController
        respond_to :json, :xml

        def index
          respond_with Invoice.where(customer_id: params[:id])
        end
      end
    end
  end
end
