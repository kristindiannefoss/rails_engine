require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Invoices::SearchController, type: :controller do
  describe "GET /invoices/find" do
    it "returns a specific invoice" do

      c1 = Customer.create
      c2 = Customer.create
      m1 = Merchant.create
      m2 = Merchant.create

      i1 = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)

      i2 = Invoice.create(status: "other", customer_id: c2.id, merchant_id: m2.id)

      get :show, status: "shipped", format: :json

      body = JSON.parse(response.body)
      invoice_status = body["status"]

      expect(response.status).to eq 200

      expect(invoice_status).to eq("shipped")
    end
  end

  describe "GET /invoices/find_all" do
    it "returns a specific list of invoices" do

      c1 = Customer.create
      c2 = Customer.create
      m1 = Merchant.create
      m2 = Merchant.create

      i1 = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)

      i2 = Invoice.create(status: "other", customer_id: c2.id, merchant_id: m2.id)
      i3 = Invoice.create(status: "other", customer_id: c2.id, merchant_id: m2.id)

      get :index, status: "other", format: :json

      body = JSON.parse(response.body)
      invoice_statuses = body.map {|m| m["status"]}

      expect(response.status).to eq 200

      expect(invoice_statuses).to match_array(["other", "other"])
    end
  end
end
