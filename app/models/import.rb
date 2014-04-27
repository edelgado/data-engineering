class Import < ActiveRecord::Base
  validates :file, presence: true
  mount_uploader :file, FileUploader

  def process_file
    require 'csv'
    # Parse the associated file into an array of arrays:
    CSV.foreach(self.file.path, {col_sep: "\t", headers: :first_row, return_headers: false}) do |row|
      # Look at each value and create matching clients, merchants and transactions.
      # Then use model methods to get the total revenue from different models. For example,
      # we can look at the total revenue, by doing a static method on the Transaction model,
      # like so: Transaction.total_revenue(), or just the last uploaded file by using an
      # instance method like an_import.total_revenue() (on the Import model).
      # Similar things can be done with the clients and merchants.

      # Create the transaction record, creating merchants and clients as necessary:
      a_transaction = Transaction.new(
        item: row["item description"],
        price: row["item price"],
        quantity: row["purchase count"],
        merchant: Merchant.find_or_initialize_by(name: row["merchant name"]),
        client: Client.find_or_initialize_by(name: row["purchaser name"])
      )

      # Update the merchant address, if necessary:
      if a_transaction.merchant.address != row["merchant address"]
        a_transaction.merchant.address = row["merchant address"]
      end

      # Save the transaction and any new associated models:
      begin
      a_transaction.save!
      rescue Exception => e
        binding.pry
      end      
    end
  end
end
