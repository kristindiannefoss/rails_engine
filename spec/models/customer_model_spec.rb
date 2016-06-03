require 'rails_helper'
require 'database_cleaner'

describe Customer, "associations" do
  it { should have_many(:invoices) }
end
