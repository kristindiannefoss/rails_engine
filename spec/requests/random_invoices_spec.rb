require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Invoices::RandomController, type: :controller do
  describe "GET /invoices/random" do
    it "returns a random invoice" do

      c1 = Customer.create
      c2 = Customer.create
      m1 = Merchant.create
      m2 = Merchant.create

      i1 = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)
      i2 = Invoice.create(status: "other", customer_id: c2.id, merchant_id: m2.id)
      i3 = Invoice.create(status: "other", customer_id: c2.id, merchant_id: m2.id)
      i4 = Invoice.create(status: "other", customer_id: c2.id, merchant_id: m2.id)
      i5 = Invoice.create(status: "other", customer_id: c2.id, merchant_id: m2.id)
      invoices_array = [i1.id, i2.id, i3.id, i4.id, i5.id]

      get :show, format: :json
      random_invoice_info1 = JSON.parse(response.body)

      get :show, format: :json
      random_invoice_info2 = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(random_invoice_info1.count).to eq 4
      expect(invoices_array).to include(random_invoice_info1["id"])
    end
  end
end
