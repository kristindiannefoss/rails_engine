module Api
  module V1
    module InvoiceItems
      class SearchController < ApiController
        respond_to :json, :xml

        def show
          respond_with InvoiceItem.find_by(invoice_items_params)
        end

        private

          def invoice_items_params
            params.permit(:id, :quantity, :unit_price, :item_id, :invoice_id, :created_at, :updated_at)
          end
      end
    end
  end
end
