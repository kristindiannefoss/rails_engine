class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  # GET /api/v1/merchants/most_revenue?quantity=x returns the top x merchants ranked by total revenue

  def self.sum_invoices
    
  end
end
