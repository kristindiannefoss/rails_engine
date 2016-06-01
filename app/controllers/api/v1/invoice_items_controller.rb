module Api
  module V1
    class InvoiceItemsController < ApiController
      respond_to :json, :xml

      def index
        respond_with InvoiceItem.all
      end

      def show
        respond_with InvoiceItem.find(params[:id])
      end

      def find
        respond_with InvoiceItem.find_by(invoice_items_params)
      end

      private

        def invoice_items_params
          params.permit(:id, :quantity, :unit_price, :item_id, :invoice_id, :created_at, :updated_at)
        end
    end
  end
end
