class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  # GET /api/v1/merchants/most_revenue?quantity=x returns the top x merchants ranked by total revenue

  # def self.sum_invoices
  #   transactions.
  # end

  # def total_revenue
  #   invoices.map do |invoice|
  #     invoice.invoice_total
  #   end.reduce(:+)
  # end

  def self.ranked_by_revenue(number)
    joins(:invoice_items).group(:id).order('sum(invoice_items.quantity * invoice_items.unit_price) DESC').limit(number)
  end

end
