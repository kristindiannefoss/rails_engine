require 'rails_helper'
require 'database_cleaner'

describe "Merchants API" do
  describe "GET /merchants" do
    it "returns a list of all merchants" do

      m1 = Merchant.create(name: "amazon")
      m2 = Merchant.create(name: "etsy")

      get "/api/v1/merchants"

      body = JSON.parse(response.body)
      merchant_names = body.map {|m| m["name"]}
      merchant_ids = body.map {|m| m["id"]}

      expect(response.status).to eq 200

      expect(merchant_ids).to match_array([m1.id, m2.id])
      expect(merchant_names).to match_array(["amazon", "etsy"])
    end
  end

  describe "GET /merchants/:id" do
    it "returns a specific merchant" do

      m1 = Merchant.create(name: "amazon")

      get "/api/v1/merchants/#{m1.id}"

      body = JSON.parse(response.body)
      merchant_name = body["name"]
      merchant_id = body["id"]

      expect(response.status).to eq 200

      expect(merchant_id).to eq(m1.id)
      expect(merchant_name).to eq("amazon")
    end
  end


end
