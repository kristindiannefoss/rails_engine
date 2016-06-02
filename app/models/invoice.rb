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

  # def invoice_total
  #
  # end
end
