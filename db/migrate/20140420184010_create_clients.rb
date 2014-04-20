class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name

      t.timestamps
    end
    add_index :clients, :name, unique: true
  end
end
