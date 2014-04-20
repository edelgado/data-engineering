class Client < ActiveRecord::Base
  has_many :transactions
end
