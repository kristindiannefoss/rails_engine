module Api
  module V1
    module InvoiceItems
      class ItemsController < ApiController
        respond_to :json, :xml

        def show
          respond_with Item.find(InvoiceItem.find(params[:id]))
        end
      end
    end
  end
end
