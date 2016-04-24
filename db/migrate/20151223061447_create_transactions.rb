class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type, limit: 255
      t.integer :batch_id, limit: 4

      t.timestamps null: false
    end

    add_index :transactions, :batch_id

  end
end
