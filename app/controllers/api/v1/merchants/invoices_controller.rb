module Api
  module V1
    module Merchants
      class InvoicesController < ApiController
        respond_to :json

        def index
          respond_with Invoice.where(merchant_id: params[:id])
        end

        def show
          respond_with Customer
        end
      end
    end
  end
end
