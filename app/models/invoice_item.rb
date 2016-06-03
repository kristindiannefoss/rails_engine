class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoices

  # def total_cost
  #   unit_price * quantity
  # end
end
