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

  describe "GET /customers/:id/favorite_merchant" do
    it "returns a specific customers most frequently shopped merchant" do

      c11 = Customer.create(first_name: "jon", last_name:"smith")
      c22 = Customer.create(first_name: "juan", last_name:"santos")
      m1 = Merchant.create(name: "amazon")
      m2 = Merchant.create(name: "shop")
      m3 = Merchant.create(name: "other shop")

      inv1 = Invoice.create(status: "shipped", customer_id: c11.id, merchant_id: m1.id)
      inv2 = Invoice.create(status: "shipped", customer_id: c11.id, merchant_id: m1.id)
      inv3 = Invoice.create(status: "shipped", customer_id: c22.id, merchant_id: m2.id)
      inv4 = Invoice.create(status: "shipped", customer_id: c22.id, merchant_id: m3.id)

      t1 = inv1.transactions.create(invoice_id: inv1.id, credit_card_number: 4654405418249632, result: "good")
      t2 = inv2.transactions.create(invoice_id: inv2.id, credit_card_number: 4580251236515201, result: "bad")
      t3 = inv3.transactions.create(invoice_id: inv3.id, credit_card_number: 4580251236515201, result: "bad")
      t4 = inv4.transactions.create(invoice_id: inv4.id, credit_card_number: 4580251236515201, result: "bad")

      get "/api/v1/customers/#{c11.id}/favorite_merchant"

      body = JSON.parse(response.body)
      merchant_name = body["name"]
      merchant_id = body["id"]

      expect(response.status).to eq 200

      expect(merchant_id).to eq(m1.id)
      expect(merchant_name).to eq("amazon")
    end
  end
end
