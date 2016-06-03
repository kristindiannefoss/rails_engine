require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Merchants::MostRevenueController, type: :controller do
  describe "GET /merchants/most_revenue" do
    it "returns specified number of merchants ranked by revenue" do
      m1 = Merchant.create(name: "amazon")
      m2 = Merchant.create(name: "etsy")
      m3 = Merchant.create(name: "hot topic")

      inv1 = Invoice.create(merchant_id: m1.id)
      inv2 = Invoice.create(merchant_id: m2.id)
      inv3 = Invoice.create(merchant_id: m3.id)

      t1 = Transaction.create(invoice_id: inv1.id, result: "success")
      t2 = Transaction.create(invoice_id: inv2.id, result: "success")
      t3 = Transaction.create(invoice_id: inv3.id, result: "success")

      ii1 = InvoiceItem.create(invoice_id: inv1.id, unit_price: 300, quantity: 2)
      ii2 = InvoiceItem.create(invoice_id: inv2.id, unit_price: 400, quantity: 2)
      ii3 = InvoiceItem.create(invoice_id: inv2.id, unit_price: 500, quantity: 2)
      ii4 = InvoiceItem.create(invoice_id: inv2.id, unit_price: 500, quantity: 2)
      ii5 = InvoiceItem.create(invoice_id: inv3.id, unit_price: 500, quantity: 2)

      get :index, format: :json, quantity: 2
      revenue_info = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      refute revenue_info[2]
      expect(revenue_info.first[:name]).to eq "etsy"
      expect(revenue_info.last[:name]).to eq "hot topic"
    end
  end
end
