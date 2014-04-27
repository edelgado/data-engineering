class Client < ActiveRecord::Base
  has_many :transactions
  validates :name, uniqueness: true

  # Instance method that calculates the total purchases for this client
  def total_purchases
    total = 0
    self.transactions.each do |t|
      total += t.quantity * t.price
    end
    return total.round(2)
  end
end
