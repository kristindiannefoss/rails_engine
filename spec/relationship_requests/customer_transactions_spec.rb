require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Customers::TransactionsController, type: :controller do
  describe "GET /customer/:id/transactions" do
    it "returns a list of all of a customers transactions" do

      c1 = Customer.create
      c2 = Customer.create
      m1 = Merchant.create

      inv1 = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)
      inv2 = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)
      inv3 = Invoice.create(status: "shipped", customer_id: c2.id, merchant_id: m1.id)
      inv4 = Invoice.create(status: "shipped", customer_id: c2.id, merchant_id: m1.id)

      t1 = inv1.transactions.create(invoice_id: inv1.id, credit_card_number: 4654405418249632, result: "good")
      t2 = inv2.transactions.create(invoice_id: inv2.id, credit_card_number: 4580251236515201, result: "bad")
      t3 = inv3.transactions.create(invoice_id: inv3.id, credit_card_number: 4580251236515201, result: "bad")
      t4 = inv4.transactions.create(invoice_id: inv4.id, credit_card_number: 4580251236515201, result: "bad")

      get :index, id: c1.id, format: :json

      body = JSON.parse(response.body)
      customer_transaction_ids = body.map {|m| m["id"]}

      expect(response.status).to eq 200

      expect(customer_transaction_ids).to match_array([t1.id, t2.id])
    end
  end
end
