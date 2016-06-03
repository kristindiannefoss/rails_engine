require 'rails_helper'
require 'database_cleaner'

RSpec.describe Api::V1::Transactions::RandomController, type: :controller do
  describe "GET /transactions/random" do
    it "returns a random transaction" do

      i1 = Invoice.create
      i2 = Invoice.create

      t1 = Transaction.create(invoice_id: i1.id, credit_card_number: 4654405418249632, result: "good")
      t2 = Transaction.create(invoice_id: i2.id, credit_card_number: 4580251236515201, result: "bad")
      t3 = Transaction.create(invoice_id: i2.id, credit_card_number: 4580251236515201, result: "bad")
      t4 = Transaction.create(invoice_id: i2.id, credit_card_number: 4580251236515201, result: "bad")
      t5 = Transaction.create(invoice_id: i2.id, credit_card_number: 4580251236515201, result: "bad")

      get :show, format: :json
      random_transaction_info1 = JSON.parse(response.body)

      get :show, format: :json
      random_transaction_info2 = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(random_transaction_info1.count).to eq 4
      expect(random_transaction_info1["id"]).to_not eq(random_transaction_info2["id"])
    end
  end
end
