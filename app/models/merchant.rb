class Merchant < ActiveRecord::Base
  has_many :transactions
  validates :name, uniqueness: true

  # Instance method that calculates the total sales for this merchant
  def total_sales (import_id = :all)
    if (import_id == :all)
      transactions = self.transactions.to_a
    else
      import = Import.find(import_id)
      transactions = self.transactions.where import_id: import.id
    end
    total = 0
    transactions.each do |t|
      total += t.quantity * t.price
    end
    return total.round(2)
  end
end
