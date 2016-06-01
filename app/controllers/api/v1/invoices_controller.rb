module Api
  module V1
    class InvoicesController < ApiController
      respond_to :json, :xml

      def index
        respond_with Invoice.all
      end

      def show
        respond_with Invoice.find(params[:id])
      end

      def find
        respond_with Invoice.find_by(invoice_params)
      end

      private

        def invoice_params
          params.permit(:id, :merchant_id, :customer_id, :created_at, :updated_at)
        end
    end
  end
end
