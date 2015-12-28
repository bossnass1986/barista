class CreateTransactionAccounts < ActiveRecord::Migration
  def change
    create_table :transaction_accounts do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
