module Api
  module V1
    module Items
      class InvoiceItemsController < ApiController
        respond_to :json, :xml

        def index
          respond_with InvoiceItem.where(item_id: params[:id])
        end
      end
    end
  end
end
