require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Merchants::RandomController, type: :controller do
  describe "GET /merchants/random" do
    it "returns a random merchant" do

      m1 = Merchant.create(name: "amazon")
      m2 = Merchant.create(name: "etsy")
      m3 = Merchant.create(name: "stuff")
      m4 = Merchant.create(name: "things")
      m5 = Merchant.create(name: "tired")
      merchants_array = [m1.id, m2.id, m3.id, m4.id, m5.id]

      get :show, format: :json
      random_merchant_info1 = JSON.parse(response.body)

      get :show, format: :json
      random_merchant_info2 = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(random_merchant_info1.count).to eq 2
      expect(merchants_array).to include(random_merchant_info1["id"])
      expect(random_merchant_info1["id"]).to_not eq(random_merchant_info2["id"])
    end
  end
end
