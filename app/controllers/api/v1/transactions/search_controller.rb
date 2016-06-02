module Api
  module V1
    module Transactions
      class SearchController < ApiController
        respond_to :json, :xml

        def show
          respond_with Transaction.find_by(transaction_params)
        end

        def index
          respond_with Transaction.where(transaction_params)
        end

        private

          def transaction_params
            params.permit(:id, :credit_card_number, :credit_card_expiration_date, :result, :invoice_id, :created_at, :updated_at)
          end
      end
    end
  end
end
