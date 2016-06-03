require 'rails_helper'
require 'database_cleaner'
require 'api/v1/customers_controller'

RSpec.describe Api::V1::CustomersController, type: :controller do
  describe "GET /customers/find?" do
    it "returns a specific customer" do

      c1 = Customer.create(first_name: "jon", last_name:"smith")
      c2 = Customer.create(first_name: "sam", last_name:"jones")

      get "/api/v1/customers"

      body = JSON.parse(response.body)
      customer_names = body.map {|m| m["first_name"]}
      customer_ids = body.map {|m| m["id"]}

      expect(response.status).to eq 200

      expect(customer_ids).to match_array([c1.id, c2.id])
      expect(customer_names).to match_array(["jon", "sam"])
    end
  end
  describe "GET /customers/:id" do
    it "returns a specific customer" do

      c1 = Customer.create(first_name: "jon", last_name:"smith")

      get "/api/v1/customers/#{c1.id}"

      body = JSON.parse(response.body)
      customer_name = body["first_name"]
      customer_id = body["id"]

      expect(response.status).to eq 200

      expect(customer_id).to eq(c1.id)
      expect(customer_name).to eq("jon")
    end
  end
end
