require 'rails_helper'
require 'database_cleaner'


describe "InvoiceItems API" do
  describe "GET /invoice_items" do
    it "returns a list of all invoice_items" do


      2.times do
        Invoice.create
        Item.create
      end

      InvoiceItem.create(quantity: 3, unit_price: 1000,  item_id: 1, invoice_id: 1)
      InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: 2, invoice_id: 2)

      get "/api/v1/invoice_items"

      body = JSON.parse(response.body)
      invoice_items_quantity = body.map {|m| m["quantity"]}
      invoice_items_unit_price = body.map {|m| m["unit_price"]}
      invoice_items_ids = body.map {|m| m["id"]}
      invoice_items_item_id = body.map {|m| m["item_id"]}
      invoice_items_invoice_id = body.map {|m| m["invoice_id"]}

      expect(response.status).to eq 200

      expect(invoice_items_ids).to match_array([1,2])
      expect(invoice_items_unit_price).to match_array(["10.0", "20.0"])
      expect(invoice_items_quantity).to match_array([3, 4])
      expect(invoice_items_item_id).to match_array([1, 2])
      expect(invoice_items_invoice_id).to match_array([1, 2])
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
