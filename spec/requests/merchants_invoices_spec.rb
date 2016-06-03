require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Merchants::InvoicesController, type: :controller do
  describe "GET /merchants/:id/invoices" do
    it "returns a specific merchants invoices" do

      m1 = Merchant.create(name: "amazon")
      m2 = Merchant.create(name: "etsy")

      it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
      it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m1.id)
      it3 = Item.create(name: "tired", description: "really", unit_price: 1000, merchant_id: m2.id)
      it4 = Item.create(name: "need", description: "sleep", unit_price: 2000, merchant_id: m2.id)

      inv1 = Invoice.create(merchant_id: m1.id, created_at: Date.today)
      inv2 = Invoice.create(merchant_id: m1.id, created_at: Date.today)

      get :index, id: m1.id, format: :json

      body = JSON.parse(response.body)

      merchants_invoice_ids = body.map {|m| m["id"]}

      expect(response.status).to eq 200

      expect(merchants_invoice_ids).to match_array([inv1.id, inv2.id])
    end
  end
end
