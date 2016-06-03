# require 'rails_helper'
# require 'database_cleaner'
# 
# describe "Items API" do
#   describe "GET /most_revenue" do
#     it "returns the top x items ranked by total revenue generated" do
#       c1 = Customer.create
#       c2 = Customer.create
#       m1 = Merchant.create
#       m2 = Merchant.create
#
#       inv1 = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)
#
#       inv2 = Invoice.create(status: "other", customer_id: c2.id, merchant_id: m2.id)
#
#       it1 = Item.create(name: "this", description: "cool", unit_price: 1000, merchant_id: m1.id)
#       it2 = Item.create(name: "that", description: "cooler", unit_price: 2000, merchant_id: m2.id)
#
#       ii1 = InvoiceItem.create(quantity: 3, unit_price: 1000,  item_id: it1.id, invoice_id: inv1.id)
#       ii2 = InvoiceItem.create(quantity: 4, unit_price: 2000,  item_id: it2.id, invoice_id: inv2)
#
#       t1 = Transaction.create(invoice_id: i1.id, credit_card_number: 4654405418249632, result: "good")
#       t2 = Transaction.create(invoice_id: i2.id, credit_card_number: 4580251236515201, result: "bad")
#
#       get "api/v1/items/most_revenue?quantity=3"
#
#       body = JSON.parse(response.body)
#       invoice_item_quantity = body["quantity"]
#       invoice_item_unit_price = body["unit_price"]
#       invoice_item_ids = body["id"]
#       invoice_item_item_id = body["item_id"]
#       invoice_item_invoice_id = body["invoice_id"]
#
#       expect(response.status).to eq 200
#
#       expect(invoice_item_ids).to eq(ii.id)
#       expect(invoice_item_unit_price).to eq("10.0")
#       expect(invoice_item_quantity).to eq(3)
#       expect(invoice_item_item_id).to eq(it.id)
#       expect(invoice_item_invoice_id).to eq(inv.id)
#
#     end
#   end
# end
