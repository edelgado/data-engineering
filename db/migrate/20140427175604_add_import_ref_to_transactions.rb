class AddImportRefToTransactions < ActiveRecord::Migration
  def change
    add_reference :transactions, :import, index: true
  end
end
