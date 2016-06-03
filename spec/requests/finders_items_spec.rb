require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Items::SearchController, type: :controller do
  describe "GET /items/find" do
    it "returns a specific item" do

      c1 = Customer.create
      c2 = Customer.create
      m1 = Merchant.create
      m2 = Merchant.create

      it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
      it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m2.id)

      get :show, description: "cool", format: :json

      body = JSON.parse(response.body)
      item_description = body["description"]

      expect(response.status).to eq 200

      expect(item_description).to eq("cool")
    end
  end

  describe "GET /items/find_all" do
    it "returns a specific list of items" do

      c1 = Customer.create
      c2 = Customer.create
      m1 = Merchant.create
      m2 = Merchant.create

      it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
      it3 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
      it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m2.id)

      get :index, description: "cool", format: :json

      body = JSON.parse(response.body)
      item_descriptions = body.map {|m| m["description"]}

      expect(response.status).to eq 200

      expect(item_descriptions).to match_array(["cool", "cool"])
    end
  end
end
