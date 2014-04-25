class Merchant < ActiveRecord::Base
  has_many :transactions
  validates :name, uniqueness: true
end
