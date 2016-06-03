require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Merchants::ItemsController, type: :controller do
  describe "GET /merchants/:id/items" do
    it "returns a specific merchants items" do

      m1 = Merchant.create(name: "amazon")
      m2 = Merchant.create(name: "etsy")

      it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
      it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m1.id)
      it3 = Item.create(name: "tired", description: "really", unit_price: 1000, merchant_id: m2.id)
      it4 = Item.create(name: "need", description: "sleep", unit_price: 2000, merchant_id: m2.id)

      get :index, id: m1.id, format: :json

      body = JSON.parse(response.body)

      merchants_item_ids = body.map {|m| m["id"]}

      expect(response.status).to eq 200

      expect(merchants_item_ids).to match_array([it1.id, it2.id])
    end
  end
end
