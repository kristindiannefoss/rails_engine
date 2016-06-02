module Api
  module V1
    module Invoices
      class InvoiceItemsController < ApiController
        respond_to :json, :xml

        def index
          respond_with InvoiceItem.where(invoice_id: params[:id])
        end
      end
    end
  end
end
