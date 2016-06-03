require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Items::RandomController, type: :controller do
  describe "GET /items/random" do
    it "returns a random item" do

      m1 = Merchant.create
      m2 = Merchant.create

      it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
      it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m2.id)
      it3 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m2.id)
      it4 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m2.id)
      it5 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m2.id)
      items_array = [it1.id, it2.id, it3.id, it4.id, it5.id]

      get :show, format: :json
      random_item_info1 = JSON.parse(response.body)

      get :show, format: :json
      random_item_info2 = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(random_item_info1.count).to eq 5
      expect(items_array).to include(random_item_info1["id"])
    end
  end
end
