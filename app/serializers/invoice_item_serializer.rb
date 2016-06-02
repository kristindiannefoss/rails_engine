class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price

  def unit_price
    sprintf('%.02f', (object.unit_price / 100.00))
  end
end
