class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    merchants.select("merchants.*, count(invoices.merchant_id) AS inv_count")
     .joins(invoices: :transactions)
     .group("merchants.id")
     .order("inv_count DESC")
     .first
  end

  def customers_with_pending_invoices
   customer_id =
     invoices.joins(:transactions)
     .where(transactions: { result: "failed" })
     .pluck(:customer_id)
     Customer.where(id: customer_id)
  end
end
