require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::InvoiceItems::RandomController, type: :controller do
  describe "GET /invoice_items/random" do
    it "returns a random item" do

      merchant = Merchant.create(name: "amazon")

      inv1 = Invoice.create(merchant_id: merchant.id, created_at: Date.today)
      inv2 = Invoice.create(merchant_id: merchant.id, created_at: Date.today)

      it1 = Item.create
      it2 = Item.create

      ii1 = InvoiceItem.create(quantity: 3, unit_price: 1000,  item_id: it1.id, invoice_id: inv1.id)
      ii2 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv2)
      ii3 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv2)
      ii4 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv2)
      ii5 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv2)
      invoice_items_array = [ii1.id, ii2.id, ii3.id, ii4.id, ii5.id]

      get :show, format: :json
      random_invoice_item_info1 = JSON.parse(response.body)

      get :show, format: :json
      random_invoice_item_info2 = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(random_invoice_item_info1.count).to eq 5
      expect(invoice_items_array).to include(random_invoice_item_info1["id"])
    end
  end
end
