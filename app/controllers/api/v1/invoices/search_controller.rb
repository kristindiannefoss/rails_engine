module Api
  module V1
    module Invoices
      class SearchController < ApiController
        respond_to :json, :xml

        def show
          respond_with Invoice.find_by(invoice_params)
        end

        private

          def invoice_params
            params.permit(:id, :merchant_id, :customer_id, :created_at, :updated_at)
          end
      end
    end
  end
end
