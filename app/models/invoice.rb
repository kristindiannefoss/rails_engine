class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  # def invoice_total
  #   invoice_items.map do |item|
  #     item.total_cost
  #   end.reduce(:+)
  # end

  def successful_invoices
    joins(:transactions).where(result: "success")
  end

  def invoice_total
    # successful_invoices
    #
    # .each {|invoice| invoice.invoice_items.sum('quantity*unit_price')}
#
    # joins(:transactions).where(result: "success").each do |invoice|
    #   invoice.invoice_items.sum('quantity*unit_price')
    # end
  end
end
