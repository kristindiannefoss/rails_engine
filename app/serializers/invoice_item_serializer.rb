class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price

  # def unit_price
  #   sprintf('%.02f', (object.unit_price / 100.00))
  # end

  def unit_price
    (object.unit_price.to_f * 0.01).to_s
  end
end
