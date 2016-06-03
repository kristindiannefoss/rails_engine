require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Customers::RandomController, type: :controller do
  describe "GET /customers/random" do
    it "returns a random customer" do

      c1 = Customer.create(first_name: "jon", last_name:"smith")
      c2 = Customer.create(first_name: "sam", last_name:"jones")
      c3 = Customer.create(first_name: "sam", last_name:"jones")
      c4 = Customer.create(first_name: "sam", last_name:"jones")
      c5 = Customer.create(first_name: "sam", last_name:"jones")
      customers_array = [c1.id, c2.id, c3.id, c4.id, c5.id]

      get :show, format: :json
      random_customer_info1 = JSON.parse(response.body)

      get :show, format: :json
      random_customer_info2 = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(random_customer_info1.count).to eq 3
      expect(customers_array).to include(random_customer_info1["id"])
      # expect(random_customer_info1["id"]).to_not eq(random_customer_info2["id"])
    end
  end
end
