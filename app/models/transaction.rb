class Transaction < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :client

  # Class method that calculates the total gross revenue represented by all trasactions in the DB
  def self.total_gross_revenue
    total = 0;
    self.all.each do |t|
      total += t.quantity * t.price
    end
    return total.round(2)
  end
end
