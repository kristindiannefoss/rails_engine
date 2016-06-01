class CreateMerchants < ActiveRecord::Migration
  def change
    enable_extension("citext")

    create_table :merchants, :force => true do |t|
      t.citext :name

      t.timestamps null: false
    end
  end
end
