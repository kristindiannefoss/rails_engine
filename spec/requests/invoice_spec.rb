require 'rails_helper'
require 'database_cleaner'

describe "Invoices API" do
  describe "GET /invoices" do
    it "returns a list of all invoices" do

      # 2.times do
      c1 = Customer.create
      c2 = Customer.create
      m1 = Merchant.create
      m2 = Merchant.create
      # end

      i1 = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)

      i2 = Invoice.create(status: "other", customer_id: c2.id, merchant_id: m2.id)

      get "/api/v1/invoices"

      body = JSON.parse(response.body)
      invoices_status = body.map {|m| m["status"]}
      invoices_ids = body.map {|m| m["id"]}
      invoices_customer_id = body.map {|m| m["customer_id"]}
      invoices_merchant_id = body.map {|m| m["merchant_id"]}

      expect(response.status).to eq 200

      expect(invoices_ids).to match_array([i1.id, i2.id])
      expect(invoices_status).to match_array(["shipped", "other"])
      expect(invoices_customer_id).to match_array([c1.id, c2.id])
      expect(invoices_merchant_id).to match_array([m1.id, m2.id])

    end
  end
end
