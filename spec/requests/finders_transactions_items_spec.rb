require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Transactions::SearchController, type: :controller do
  describe "GET /transactions/find" do
    it "returns a specific transaction" do

      i1 = Invoice.create
      i2 = Invoice.create

      t1 = Transaction.create(invoice_id: i1.id, credit_card_number: 4654405418249632, result: "good")
      t2 = Transaction.create(invoice_id: i2.id, credit_card_number: 4580251236515201, result: "bad")
      t3 = Transaction.create(invoice_id: i2.id, credit_card_number: 4580251236515201, result: "bad")

      get :show, credit_card_number: "4654405418249632", format: :json

      body = JSON.parse(response.body)
      transactions_credit_card_number = body["credit_card_number"]

      expect(response.status).to eq 200

      expect(transactions_credit_card_number).to eq("4654405418249632")
    end
  end

  describe "GET /transactions/find_all" do
    it "returns a specific list of transactions" do

      i1 = Invoice.create
      i2 = Invoice.create

      t1 = Transaction.create(invoice_id: i1.id, credit_card_number: 4654405418249632, result: "good")
      t2 = Transaction.create(invoice_id: i2.id, credit_card_number: 4580251236515201, result: "bad")
      t3 = Transaction.create(invoice_id: i2.id, credit_card_number: 4580251236515201, result: "bad")

      get :index, credit_card_number: "4580251236515201", format: :json

      body = JSON.parse(response.body)
      transactions_credit_card_numbers = body.map {|m| m["credit_card_number"]}

      expect(response.status).to eq 200

      expect(transactions_credit_card_numbers).to match_array(["4580251236515201", "4580251236515201"])
    end
  end
end
