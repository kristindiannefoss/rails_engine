require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Items::MerchantsController, type: :controller do
  describe "GET /items/:id/imerchant" do
    it "returns a specific items merchant" do

      m1 = Merchant.create(name: "amazon")
      m2 = Merchant.create(name: "etsy")

      inv1 = Invoice.create(merchant_id: m1.id, created_at: Date.today)

      it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
      it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m1.id)

      get :show, id: it1.id, format: :json

      body = JSON.parse(response.body)

      merchant_id = body["id"]

      expect(response.status).to eq 200

      expect(merchant_id).to eq m1.id
    end
  end
end
