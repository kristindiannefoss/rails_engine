namespace :load do
  require 'csv'

  desc "loads in customers.csv"
  task :customers => :environment do |t, arg|
    puts "loading customers"
    user_files =['db/data/customers.csv']
    user_files.each do |user|
      CSV.foreach(user,:headers => true) do |row|
        id = row.to_hash['id']
        first_name = row.to_hash['first_name']
        last_name = row.to_hash['last_name']
        created_at = row.to_hash['created_at']
        updated_at = row.to_hash['updated_at']
        Customer.create(id: id,first_name: first_name, last_name: last_name, created_at: created_at, updated_at: updated_at)
      end
    end
  end

  desc "loads in merchants.csv"
  task :merchants => :environment do |t, arg|
    puts "loading merchants"
    user_files =['db/data/merchants.csv']
    user_files.each do |user|
      CSV.foreach(user,:headers => true) do |row|
        id = row.to_hash['id']
        name = row.to_hash['name']
        created_at = row.to_hash['created_at']
        updated_at = row.to_hash['updated_at']
        Merchant.create(id: id, name: name, created_at: created_at, updated_at: updated_at)
      end
    end
  end

  desc "loads in items.csv"
  task :items => :environment do |t, arg|
    puts "loading items"
    user_files =['db/data/items.csv']
    user_files.each do |user|
      CSV.foreach(user,:headers => true) do |row|
        id = row.to_hash['id']
        name = row.to_hash['name']
        description = row.to_hash['description']
        unit_price = row.to_hash['unit_price']
        merchant_id = row.to_hash['merchant_id']
        created_at = row.to_hash['created_at']
        updated_at = row.to_hash['updated_at']
        Item.create(id: id, name: name, description: description, unit_price: unit_price, merchant_id: merchant_id, created_at: created_at, updated_at: updated_at)
      end
    end
  end

  desc "loads in invoices.csv"
  task :invoices => :environment do |t, arg|
    puts "loading invoices"
    user_files =['db/data/invoices.csv']
    user_files.each do |user|
      CSV.foreach(user,:headers => true) do |row|
        id = row.to_hash['id']
        status = row.to_hash['status']
        merchant_id = row.to_hash['merchant_id']
        customer_id = row.to_hash['customer_id']
        created_at = row.to_hash['created_at']
        updated_at = row.to_hash['updated_at']
        Invoice.create(id: id, status: status, customer_id: customer_id, merchant_id: merchant_id, created_at: created_at, updated_at: updated_at)
      end
    end
  end

  desc "loads in transactions.csv"
  task :transactions => :environment do |t, arg|
    puts "loading transactions"
    user_files =['db/data/transactions.csv']
    user_files.each do |user|
      CSV.foreach(user,:headers => true) do |row|
        id = row.to_hash['id']
        invoice_id = row.to_hash['invoice_id']
        credit_card_number = row.to_hash['credit_card_number']
        credit_card_expiration_date = row.to_hash['credit_card_expiration_date']
        result = row.to_hash['result']
        created_at = row.to_hash['created_at']
        updated_at = row.to_hash['updated_at']
        Transaction.create(id: id, invoice_id: invoice_id, credit_card_number: credit_card_number, credit_card_expiration_date: credit_card_expiration_date, result: result, created_at: created_at, updated_at: updated_at)
      end
    end
  end

  desc "loads in invoice_items.csv"
  task :invoice_items => :environment do |t, arg|
    puts "loading invoice_items"
    user_files =['db/data/invoice_items.csv']
    user_files.each do |user|
      CSV.foreach(user,:headers => true) do |row|
        id = row.to_hash['id']
        quantity = row.to_hash['quantity']
        unit_price = row.to_hash['unit_price']
        item_id = row.to_hash['item_id']
        invoice_id = row.to_hash['invoice_id']
        created_at = row.to_hash['created_at']
        updated_at = row.to_hash['updated_at']
        InvoiceItem.create(id: id, quantity: quantity, unit_price: unit_price,  item_id: item_id, invoice_id: invoice_id, created_at: created_at, updated_at: updated_at)
      end
    end
  end

  desc "loads all csvs"
  task :all => :environment do |t, arg|
    [ :customers, :merchants, :items, :invoices, :transactions, :invoice_items ].each do |t|
      Rake::Task["load:#{t}"].invoke
    end
  end
end
