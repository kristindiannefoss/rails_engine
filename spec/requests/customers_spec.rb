require 'rails_helper'
require 'database_cleaner'

describe "Customers API" do
  describe "GET /customers" do
    it "returns a list of all customers" do


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
end
