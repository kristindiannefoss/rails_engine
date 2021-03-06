require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Invoices::InvoiceItemsController, type: :controller do
  describe "GET /invoices/:id/invoice_items" do
    it "returns a list of all of an invoices invoice_items" do

      m1 = Merchant.create(name: "amazon")

      inv1 = Invoice.create(merchant_id: m1.id, created_at: Date.today)
      inv2 = Invoice.create(merchant_id: m1.id, created_at: Date.today)

      it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
      it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m1.id)

      ii1 = InvoiceItem.create(quantity: 3, unit_price: 1000,  item_id: it1.id, invoice_id: inv1.id)
      ii2 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv1.id)
      ii3 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv2.id)

      get :index, id: inv1.id, format: :json

      body = JSON.parse(response.body)
      invoices_invoice_items_ids = body.map {|m| m["id"]}
      invoices_invoice_items_quantities = body.map {|m| m["quantity"]}
      invoices_invoice_items_unit_prices = body.map {|m| m["unit_price"]}

      expect(response.status).to eq 200

      expect(invoices_invoice_items_ids).to match_array([ii1.id, ii2.id])
      expect(invoices_invoice_items_quantities).to match_array([3,4])

      expect(invoices_invoice_items_unit_prices).to match_array(["10.0", "20.0"])
    end
  end
end
