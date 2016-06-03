require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Invoices::CustomersController, type: :controller do
  describe "GET /invoice/:id/customer" do
    it "returns a specific invoices customer" do

      c31 = Customer.create
      c32 = Customer.create
      m1 = Merchant.create
      m2 = Merchant.create

      i1 = Invoice.create(status: "shipped", customer_id: c31.id, merchant_id: m1.id)

      i2 = Invoice.create(status: "other", customer_id: c32.id, merchant_id: m2.id)

      get :show, id: i1.id, format: :json

      body = JSON.parse(response.body)
      invoice_customer_id = body["id"]

      expect(response.status).to eq 200

      expect(invoice_customer_id).to eq(c31.id)
    end
  end
end
