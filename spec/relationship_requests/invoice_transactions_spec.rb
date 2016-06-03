require 'rails_helper'
require 'database_cleaner'
require 'api/v1/invoices/transactions_controller'

RSpec.describe Api::V1::Invoices::TransactionsController, type: :controller do
  describe "GET /invoices/:id/transactions" do
    it "returns a list of all of an invoices transactions" do

      c1 = Customer.create
      m1 = Merchant.create

      invoice = Invoice.create(status: "shipped", customer_id: c1.id, merchant_id: m1.id)

      t1 = invoice.transactions.create(invoice_id: invoice.id, credit_card_number: 4654405418249632, result: "good")
      t2 = invoice.transactions.create(invoice_id: invoice.id, credit_card_number: 4580251236515201, result: "bad")

      get :index, id: invoice.id, format: :json

      body = JSON.parse(response.body)
      invoices_transaction_ids = body.map {|m| m["id"]}
      invoices_transaction_results = body.map {|m| m["result"]}
      invoices_transaction_cc_nums = body.map {|m| m["credit_card_number"]}

      expect(response.status).to eq 200

      expect(invoices_transaction_ids).to match_array([t1.id, t2.id])
      expect(invoices_transaction_results).to match_array(["good", "bad"])

      expect(invoices_transaction_cc_nums).to match_array(["4580251236515201", "4654405418249632"])
    end
  end
end
