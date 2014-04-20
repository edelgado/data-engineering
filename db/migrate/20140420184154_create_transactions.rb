class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :item
      t.decimal :price, precision: 2, scale: 10
      t.integer :quantity
      t.references :merchant, index: true
      t.references :client, index: true

      t.timestamps
    end
  end
end
