require 'rails_helper'
require 'database_cleaner'

describe "Items API" do
  describe "GET /items" do
    it "returns a list of all items" do

      m1 = Merchant.create
      m2 = Merchant.create

      it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
      it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m2.id)

      get "/api/v1/items"

      body = JSON.parse(response.body)
      item_names = body.map {|m| m["name"]}
      item_descriptions = body.map {|m| m["description"]}
      item_ids = body.map {|m| m["id"]}
      items_unit_price = body.map {|m| m["unit_price"]}

      expect(response.status).to eq 200

      expect(item_ids).to match_array([it1.id, it2.id])
      expect(item_names).to match_array(["this", "that"])
      expect(item_descriptions).to match_array(["cool", "cooler"])
      expect(items_unit_price).to match_array(["10.0", "20.0"])
    end
  end

  describe "GET /items/:id" do
    it "returns a specific item" do

      m1 = Merchant.create
      it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)

      get "/api/v1/items/#{it1.id}"

      body = JSON.parse(response.body)
      item_name = body["name"]
      item_description = body["description"]
      item_id = body["id"]
      item_unit_price = body["unit_price"]

      expect(response.status).to eq 200

      expect(item_id).to eq(it1.id)
      expect(item_name).to eq("this")
      expect(item_description).to eq("cool")
      expect(item_unit_price).to eq("10.0")
    end
  end
end
