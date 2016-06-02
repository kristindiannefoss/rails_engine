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
end
