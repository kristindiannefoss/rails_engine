module Api
  module V1
    class TransactionsController < ApiController
      respond_to :json, :xml

      def index
        respond_with Transaction.all
      end

      def show
        respond_with Transaction.find(params[:id])
      end

      def find
        respond_with Transaction.find_by(transaction_params)
      end

      private

        def transaction_params
          params.permit(:id, :credit_card_number, :credit_card_expiration, :result, :invoice_id, :created_at, :updated_at)
        end
    end
  end
end
