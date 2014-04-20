class Transaction < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :client
end
