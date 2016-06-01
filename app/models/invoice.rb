class Invoice < ActiveRecord::Base
  belongs_to :merchants
  belongs_to :customers
end
