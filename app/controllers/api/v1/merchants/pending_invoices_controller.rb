module Api
  module V1
    module Merchants
      class PendingInvoicesController < ApiController
        respond_to :json

        def index
          merchant = Merchant.find(params[:id])
          respond_with merchant.customers_with_pending_invoices
        end
      end
    end
  end
end
