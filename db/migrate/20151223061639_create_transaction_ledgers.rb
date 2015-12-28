class CreateTransactionLedgers < ActiveRecord::Migration
  def change
    create_table :transaction_ledgers do |t|
      t.string :accountable_type
      t.integer :accountable_id
      t.integer :transaction_id
      t.integer :transaction_account_id
      t.decimal :tax_amount
      t.decimal :debit
      t.decimal :credit
      t.string :period

      t.timestamps null: false
    end
  end
end
