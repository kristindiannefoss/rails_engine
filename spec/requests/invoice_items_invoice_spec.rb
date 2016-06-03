require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::InvoiceItems::InvoicesController, type: :controller do
  describe "GET /invoice_item/:id/invoice" do
    it "returns a specific invoice_items invoice" do

      m1 = Merchant.create(name: "amazon")

      inv1 = Invoice.create(merchant_id: m1.id, created_at: Date.today)
      inv2 = Invoice.create(merchant_id: m1.id, created_at: Date.today)

      it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
      it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m1.id)

      ii1 = InvoiceItem.create(quantity: 3, unit_price: 1000,  item_id: it1.id, invoice_id: inv1.id)
      ii2 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv2.id)

      get :show, id: ii1.id, format: :json

      body = JSON.parse(response.body)
      invoice_items_invoice_id = body["id"]

      expect(response.status).to eq 200

      expect(invoice_items_invoice_id).to eq(inv1.id)
    end
  end
end
