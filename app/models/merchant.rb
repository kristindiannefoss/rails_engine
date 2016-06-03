class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.ranked_by_revenue(number)
    joins(:invoice_items).group(:id).order('sum(invoice_items.quantity * invoice_items.unit_price) DESC').limit(number)
  end

  def self.ranked_by_items(number)
    joins(:invoice_items).group(:id).order('sum(invoice_items.quantity) DESC').limit(number)
  end

  def self.revenue_by_date(date)
    invoices.joins(:transactions).where(transactions: {result: "success"}).joins(:invoice_items).where(invoices: {created_at: date}).select('sum(invoice_items.quantity)')

    # # binding.pry
    # joins(:invoice_items).select("sum(invoice_items.quantity * invoice_items.unit_price) AS invoice_total").group(created_at: "date")
  end

  # GET /api/v1/merchants/:id/revenue returns the total revenue for that merchant across all transactions

  def instance_revenue
    invoices.joins(:transactions).where(transactions: {result: "success"}).invoice_items.sum('quantity * unit_price')
  end

end
