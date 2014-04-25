class ChangeTransactionPriceToFloat < ActiveRecord::Migration
  def up
    change_column :transactions, :price, :float
  end
  def down
    change_column :transactions, :price, :decimal
  end
end
