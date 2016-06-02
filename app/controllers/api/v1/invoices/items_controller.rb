module Api
  module V1
    module Invoices
      class ItemsController < ApiController
        respond_to :json, :xml

        def index
          respond_with Item.where(invoice_id: params[:id])
        end
      end
    end
  end
end
