require 'rails_helper'
require 'database_cleaner'

describe "Invoices API" do
  describe "GET /invoices" do
    it "returns a list of all invoices" do

      c1 = Customer.create
      c2 = Customer.create
      m1 = Merchant.create
      m2 = Merchant.create

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

  describe "GET /invoices/:id" do
    it "returns a specific invoice" do

      c1 = Customer.create
      m1 = Merchant.create

      i1 = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)

      get "/api/v1/invoices/#{i1.id}"

      body = JSON.parse(response.body)
      invoice_status = body["status"]
      invoice_ids = body["id"]
      invoice_customer_id = body["customer_id"]
      invoice_merchant_id = body["merchant_id"]

      expect(response.status).to eq 200

      expect(invoice_ids).to eq(i1.id)
      expect(invoice_status).to eq("shipped")
      expect(invoice_customer_id).to eq(c1.id)
      expect(invoice_merchant_id).to eq(m1.id)

    end
  end
end
