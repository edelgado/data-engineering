class Transaction < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :client
  belongs_to :import

  # Class method that calculates the total gross revenue represented by all trasactions in the DB
  def self.total_gross_revenue (import_id = :all)
    if (import_id == :all)
      transactions = self.all.to_a
    else
      transactions = self.where import_id: import_id
      if transactions.empty? 
        raise 'Import ID not found'
      end
    end
    total = 0
    transactions.each do |t|
      total += t.quantity * t.price
    end
    return total.round(2)
  end
end