module Api
  module V1
    module Invoices
      class RandomController < ApiController
        respond_to :json 

        def show
          ids = Invoice.pluck(:id)
          respond_with Invoice.find(ids.sample)
        end
      end
    end
  end
end
