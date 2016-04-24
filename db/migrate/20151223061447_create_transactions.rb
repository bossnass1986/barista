class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type
      t.integer :batch_id

      t.timestamps null: false
    end

    add_index :transactions, :batch_id

  end
end
