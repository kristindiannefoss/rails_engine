require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Items::MostRevenueController, type: :controller do
  describe "GET /items/most_revenue" do
    it "returns the top x items ranked by total revenue generated" do
      c1 = Customer.create
      c2 = Customer.create
      m1 = Merchant.create
      m2 = Merchant.create

      inv1 = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)

      inv2 = Invoice.create(status: "other", customer_id: c2.id, merchant_id: m2.id)

      it1 = Item.create(name: "this", description: "cool", unit_price: 9000, merchant_id: m1.id)
      it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m2.id)

      ii1 = InvoiceItem.create(quantity: 3, unit_price: 9000,  item_id: it1.id, invoice_id: inv1.id)
      ii3 = InvoiceItem.create(quantity: 3, unit_price: 9000,  item_id: it1.id, invoice_id: inv1.id)
      ii2 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv2)

      t1 = Transaction.create(invoice_id: inv1.id, credit_card_number: 4654405418249632, result: "good")
      t2 = Transaction.create(invoice_id: inv2.id, credit_card_number: 4580251236515201, result: "bad")

      get :index, quantity: 2, format: :json

      body = JSON.parse(response.body)

      item_ids = body.map {|m| m["id"]}

      expect(response.status).to eq 200

      expect(invoice_item_ids).to match_array([it1.id, it2.id])
    end
  end
end
