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
        Customer.create(id: id,first_name: first_name, last_name: last_name)
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
        Merchant.create(id: id, name: name)
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
        Item.create(id: id, name: name, description: description, unit_price: unit_price, merchant_id: merchant_id)
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
        merchant_id = row.to_hash['merchant_id']
        customer_id = row.to_hash['customer_id']
        Invoice.create(id: id, customer_id: customer_id, merchant_id: merchant_id)
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
        credit_card_number = row.to_hash['credit_card_number']
        credit_card_expiration = row.to_hash['credit_card_expiration']
        result = row.to_hash['result']
        Transaction.create(id: id, credit_card_number: credit_card_number, credit_card_expiration: credit_card_expiration, result: result)
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
        InvoiceItem.create(id: id, quantity: quantity, unit_price: unit_price,  item_id: item_id, invoice_id: invoice_id)
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
