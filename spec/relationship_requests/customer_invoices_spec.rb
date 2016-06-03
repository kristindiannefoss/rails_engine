require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Customers::InvoicesController, type: :controller do
  describe "GET /customer/:id/invoices" do
    it "returns a list of all of a customers invoices" do

      c1 = Customer.create
      c2 = Customer.create
      m1 = Merchant.create

      inv1 = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)
      inv2 = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)
      inv3 = Invoice.create(status: "shipped", customer_id: c2.id, merchant_id: m1.id)
      inv4 = Invoice.create(status: "shipped", customer_id: c2.id, merchant_id: m1.id)

      get :index, id: c1.id, format: :json

      body = JSON.parse(response.body)
      customer_invoice_ids = body.map {|m| m["id"]}

      expect(response.status).to eq 200

      expect(customer_invoice_ids).to match_array([inv1.id, inv2.id])
    end
  end
end
