require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::InvoiceItems::SearchController, type: :controller do
  describe "GET /invoice_items/find" do
    it "returns a specific invoice item" do

      merchant = Merchant.create(name: "amazon")

      inv1 = Invoice.create(merchant_id: merchant.id, created_at: Date.today)
      inv2 = Invoice.create(merchant_id: merchant.id, created_at: Date.today)

      it1 = Item.create
      it2 = Item.create

      ii1 = InvoiceItem.create(quantity: 3, unit_price: 1000,  item_id: it1.id, invoice_id: inv1.id)
      ii2 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv2)

      get :show, unit_price: "10.00", format: :json

      body = JSON.parse(response.body)
      invoice_item_unit_price = body["unit_price"]

      expect(response.status).to eq 200

      expect(invoice_item_unit_price).to eq("10.0")
    end
  end

  describe "GET /invoice_items/find_all" do
    it "returns a specific list of invoice_items" do

      merchant = Merchant.create(name: "amazon")

      inv1 = Invoice.create(merchant_id: merchant.id, created_at: Date.today)
      inv2 = Invoice.create(merchant_id: merchant.id, created_at: Date.today)

      it1 = Item.create
      it2 = Item.create

      ii1 = InvoiceItem.create(quantity: 3, unit_price: 1000,  item_id: it1.id, invoice_id: inv1.id)
      ii3 = InvoiceItem.create(quantity: 3, unit_price: 1000,  item_id: it1.id, invoice_id: inv1.id)
      ii2 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv2)

      get :index, unit_price: "10.00", format: :json

      body = JSON.parse(response.body)
      item_descriptions = body.map {|m| m["unit_price"]}

      expect(response.status).to eq 200

      expect(item_descriptions).to match_array(["10.0", "10.0"])
    end
  end
end
