require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Customers::SearchController, type: :controller do
  describe "GET /customers/find" do
    it "returns a specific customer" do

      c1 = Customer.create(first_name: "jon", last_name:"smith")
      c2 = Customer.create(first_name: "sam", last_name:"jones")

      get :show, first_name: "jon", format: :json

      body = JSON.parse(response.body)
      customer_name = body["first_name"]

      expect(response.status).to eq 200

      expect(customer_name).to eq("jon")
    end
  end

  describe "GET /customers/find_all" do
    it "returns a specific list of customers" do

      c1 = Customer.create(first_name: "jon", last_name:"smith")
      c1 = Customer.create(first_name: "jon", last_name:"other")
      c2 = Customer.create(first_name: "sam", last_name:"jones")

      get :index, first_name: "jon", format: :json

      body = JSON.parse(response.body)
      customer_names = body.map {|m| m["first_name"]}

      expect(response.status).to eq 200

      expect(customer_names).to match_array(["jon", "jon"])
    end
  end
end
