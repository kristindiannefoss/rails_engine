class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
end
