require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Items::InvoiceItemsController, type: :controller do
  describe "GET /items/:id/invoice_item" do
    it "returns a specific items invoice_items" do

      m1 = Merchant.create(name: "amazon")

      inv1 = Invoice.create(merchant_id: m1.id, created_at: Date.today)
      inv2 = Invoice.create(merchant_id: m1.id, created_at: Date.today)

      it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
      it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m1.id)

      ii111 = InvoiceItem.create(quantity: 3, unit_price: 1000,  item_id: it1.id, invoice_id: inv1.id)
      ii222 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it1.id, invoice_id: inv2.id)

      get :index, id: it1.id, format: :json

      body = JSON.parse(response.body)
      invoice_items_quantity = body.map {|m| m["quantity"]}
      invoice_items_unit_price = body.map {|m| m["unit_price"]}
      invoice_items_ids = body.map {|m| m["id"]}

      expect(response.status).to eq 200

      expect(invoice_items_ids).to match_array([ii111.id, ii222.id])
      expect(invoice_items_unit_price).to match_array(["10.0", "20.0"])
      expect(invoice_items_quantity).to match_array([3, 4])
    end
  end
end
