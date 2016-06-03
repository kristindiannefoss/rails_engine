module Api
  module V1
    module Invoices
      class ItemsController < ApiController
        respond_to :json 

        def index
          respond_with Invoice.find_by(id:(params[:id])).items
        end
      end
    end
  end
end
