require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Invoices::MerchantsController, type: :controller do
  describe "GET /invoice/:id/merchant" do
    it "returns a specific invoices merchant" do

      c31 = Customer.create
      c32 = Customer.create
      m1 = Merchant.create
      m2 = Merchant.create

      i1 = Invoice.create(status: "shipped", customer_id: c31.id, merchant_id: m1.id)

      i2 = Invoice.create(status: "other", customer_id: c32.id, merchant_id: m2.id)

      get :show, id: i1.id, format: :json

      body = JSON.parse(response.body)
      invoice_merchant_id = body["id"]

      expect(response.status).to eq 200

      expect(invoice_merchant_id).to eq(m1.id)
    end
  end
end
