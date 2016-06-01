class CreateInvoices < ActiveRecord::Migration
  def change

    enable_extension("citext")

    create_table :invoices, :force => true do |t|
      t.references :merchant, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
