require 'rails_helper'
require 'database_cleaner'


describe "Transactions API" do
  describe "GET /transactions" do
    it "returns a list of all transactions" do


      i1 = Invoice.create
      i2 = Invoice.create


      t1 = Transaction.create(invoice_id: i1.id, credit_card_number: 4654405418249632, result: "good")
      t2 = Transaction.create(invoice_id: i2.id, credit_card_number: 4580251236515201, result: "bad")

      get "/api/v1/transactions"

      body = JSON.parse(response.body)
      transaction_credit_card_numbers = body.map {|m| m["credit_card_number"]}
      transaction_credit_card_expiration_dates = body.map {|m| m["credit_card_expiration_date"]}
      transaction_ids = body.map {|m| m["id"]}
      invoice_ids = body.map {|m| m["invoice_id"]}

      expect(response.status).to eq 200

      expect(invoice_ids).to match_array([i1.id, i2.id])
      expect(transaction_ids).to match_array([t1.id, t2.id])
      expect(transaction_credit_card_numbers).to match_array(["4580251236515201", "4654405418249632"])

    end
  end
end
