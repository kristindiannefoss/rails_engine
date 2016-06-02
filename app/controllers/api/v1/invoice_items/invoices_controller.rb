module Api
  module V1
    module InvoiceItems
      class InvoicesController < ApiController
        respond_to :json, :xml

        def show
          respond_with Invoice.find(InvoiceItem.find(params[:id]))
        end
      end
    end
  end
end
