class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :merchant_id
      t.string :account_name
      t.integer :bsb
      t.integer :account_number
      t.string :account_type
      t.decimal :charge, precision: 8, scale: 2, default: 4.4, null: false
      t.boolean :active

      t.timestamps null: false
    end
    add_index :accounts, :merchant_id
  end
end
