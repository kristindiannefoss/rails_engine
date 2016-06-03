# require 'rails_helper'
# require 'database_cleaner'
# require 'api/v1/items/best_day_controller'
#
# RSpec.describe Api::V1::Items::BestDayController, type: :controller do
#   describe "get /items/:id/best_day" do
#     xit "shows the best day for sales of an item" do
#
#       @item = Item.create
#       merchant = Merchant.create(name: "amazon")
#
#       invoice1 = Invoice.create(merchant_id: merchant.id, created_at: Date.today)
#       invoice2 = Invoice.create(merchant_id: merchant.id, created_at: Date.today + 2)
#       invoice3 = Invoice.create(merchant_id: merchant.id, created_at: Date.today + 2)
#       invoice4 = Invoice.create(merchant_id: merchant.id, created_at: Date.today + 1)
#
#       invoice_item1 = InvoiceItem.create(item_id: @item.id, invoice_id: invoice1.id, quantity: 2)
#       invoice_item2 = InvoiceItem.create(item_id: @item.id, invoice_id: invoice1.id, quantity: 2)
#       invoice_item3 = InvoiceItem.create(item_id: @item.id, invoice_id: invoice1.id, quantity: 2)
#       invoice_item4 = InvoiceItem.create(item_id: @item.id, invoice_id: invoice1.id, quantity: 2)
#
#       Transaction.create(invoice_id: invoice1.id, result: "success")
#       Transaction.create(invoice_id: invoice2.id, result: "success")
#       Transaction.create(invoice_id: invoice3.id, result: "success")
#       Transaction.create(invoice_id: invoice4.id, result: "success")
#
#       date = Date.today -1
#
#       # get "/api/v1/items/#{@item.id}/best_day"
#       get :show, id: @item.id, format: :json
#
#       item_date_hash = JSON.parse(response.body, symbolize_names: true)
#       expect(response).to have_http_status(:success)
#
#       expect(item_date_hash).to eq(date: date)
#     end
#   end
# end
