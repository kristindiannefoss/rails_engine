module Api
  module V1
    module InvoiceItems
      class RandomController < ApiController
        respond_to :json, :xml

        def show
          ids = InvoiceItem.pluck(:id)
          respond_with InvoiceItem.find(ids.sample)
        end
      end
    end
  end
end
