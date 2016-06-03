class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.ranked_by_revenue(number)
    joins(:invoice_items).group(:id).order('sum(invoice_items.quantity * invoice_items.unit_price) DESC').limit(number)
  end

  def self.ranked_by_items(number)
    joins(:invoice_items).group(:id).order('sum(invoice_items.quantity) DESC').limit(number)
  end

  def total_revenue(date)
    date ? invoices = Invoice.where(created_at: date) : invoices = Invoice
    invoices.joins(:invoice_items, :transactions)
      .where(transactions: {result: "success"})
      .where(merchant_id: id)
      .sum("unit_price * quantity").to_s.insert(-3, ".")
  end

  def customers_with_pending_invoices
   customer_id =
     invoices.joins(:transactions)
     .where(transactions: { result: "failed" })
     .pluck(:customer_id)
     Customer.where(id: customer_id)
  end

  def favorite_customer
    customers.select("customers.*, count(invoices.customer_id) as inv_count")
      .joins(invoices: :transactions).where("transactions.result = 'success'")
      .group("customers.id").order("inv_count desc").first
  end

end
