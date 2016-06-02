module Api
  module V1
    module InvoiceItems
      class InvoicesController < ApiController
        respond_to :json, :xml

        def show
          respond_with Invoice.find_by(id: InvoiceItem.find(params[:id]).invoice_id)
        end
      end
    end
  end
end
