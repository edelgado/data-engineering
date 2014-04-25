class Import < ActiveRecord::Base
  validates :file, presence: true
  mount_uploader :file, FileUploader

  def process_file
    require 'csv'
    # Parse the associated file into an array of arrays:
    CSV.foreach(self.file.path, {col_sep: "\t"}) do |row|
      # Use the row here.
      # Look at each value and create matching clients, merchants and transactions.
      # Then use model methods to get the total revenue from different models. For example,
      # we can look at the total revenue, by doing a static method on the Transaction model,
      # like so: Transaction.total_revenue(), or just the last uploaded file by using an
      # instance method like an_import.total_revenue() (on the Import model).
      # Similar things can be done with the clients and merchants.
    end
  end
end
