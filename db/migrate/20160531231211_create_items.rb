class CreateItems < ActiveRecord::Migration
  def change
    enable_extension("citext")

    create_table :items, :force => true do |t|
      t.citext :name
      t.citext :description
      t.integer :unit_price
      t.references :merchant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
