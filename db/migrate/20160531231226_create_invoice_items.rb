class CreateInvoiceItems < ActiveRecord::Migration
  def change
    enable_extension("citext")

    create_table :invoice_items, :force => true do |t|
      t.integer :quantity
      t.integer :unit_price
      t.references :item, index: true, foreign_key: true
      t.references :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
