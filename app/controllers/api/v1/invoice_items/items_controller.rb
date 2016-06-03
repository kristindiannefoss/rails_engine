module Api
  module V1
    module InvoiceItems
      class ItemsController < ApiController
        respond_to :json 

        def show
          respond_with Item.find_by(id: InvoiceItem.find(params[:id]).item_id)
        end
      end
    end
  end
end
