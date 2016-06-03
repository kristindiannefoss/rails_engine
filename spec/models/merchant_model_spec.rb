require 'rails_helper'
require 'database_cleaner'

describe Merchant, "associations" do
  it { should have_many(:invoices) }
  it { should have_many(:transactions) }
end
