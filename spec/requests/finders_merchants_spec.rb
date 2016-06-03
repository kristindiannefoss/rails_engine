require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Merchants::SearchController, type: :controller do
  describe "GET /merchants/find" do
    it "returns a specific merchant" do

      m1 = Merchant.create(name: "amazon")
      m2 = Merchant.create(name: "etsy")

      get :show, name: "amazon", format: :json

      body = JSON.parse(response.body)
      merchant_name = body["name"]

      expect(response.status).to eq 200

      expect(merchant_name).to eq("amazon")
    end
  end

  describe "GET /merchants/find_all" do
    it "returns a specific list of merchants" do

      m1 = Merchant.create(name: "amazon")
      m2 = Merchant.create(name: "amazon")
      m3 = Merchant.create(name: "etsy")

      get :index, name: "amazon", format: :json

      body = JSON.parse(response.body)
      merchant_names = body.map {|m| m["name"]}

      expect(response.status).to eq 200

      expect(merchant_names).to match_array(["amazon", "amazon"])
    end
  end
end
