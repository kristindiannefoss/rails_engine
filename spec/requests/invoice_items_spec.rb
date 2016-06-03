require 'rails_helper'
require 'database_cleaner'


describe "InvoiceItems API" do
  describe "GET /invoice_items" do
    it "returns a list of all invoice_items" do

      m1 = Merchant.create(name: "amazon")

      inv1 = Invoice.create(merchant_id: m1.id, created_at: Date.today)
      inv2 = Invoice.create(merchant_id: m1.id, created_at: Date.today)

      it1 = Item.create
      it2 = Item.create

      ii1 = InvoiceItem.create(quantity: 3, unit_price: 1000,  item_id: it1.id, invoice_id: inv1.id)
      ii2 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv2.id)

      get "/api/v1/invoice_items"

      body = JSON.parse(response.body)
      invoice_items_quantity = body.map {|m| m["quantity"]}
      invoice_items_unit_price = body.map {|m| m["unit_price"]}
      invoice_items_ids = body.map {|m| m["id"]}
      invoice_items_item_id = body.map {|m| m["item_id"]}

      expect(response.status).to eq 200

      expect(invoice_items_ids).to match_array([ii1.id,ii2.id])
      expect(invoice_items_unit_price).to match_array(["10.0", "20.0"])
      expect(invoice_items_quantity).to match_array([3, 4])
      expect(invoice_items_item_id).to match_array([it1.id, it2.id])
    end
  end

  describe "GET /invoice_items/:id" do
    it "returns a specific invoice_item" do
      inv  = Invoice.create
      it = Item.create

      ii = InvoiceItem.create(quantity: 3, unit_price: 1000,  item_id: it.id, invoice_id: inv.id)

      get "/api/v1/invoice_items/#{ii.id}"

      body = JSON.parse(response.body)
      invoice_item_quantity = body["quantity"]
      invoice_item_unit_price = body["unit_price"]
      invoice_item_ids = body["id"]
      invoice_item_item_id = body["item_id"]
      invoice_item_invoice_id = body["invoice_id"]

      expect(response.status).to eq 200

      expect(invoice_item_ids).to eq(ii.id)
      expect(invoice_item_unit_price).to eq("10.0")
      expect(invoice_item_quantity).to eq(3)
      expect(invoice_item_item_id).to eq(it.id)
      expect(invoice_item_invoice_id).to eq(inv.id)
    end
  end
end
