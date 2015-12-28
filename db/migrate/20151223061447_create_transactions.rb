class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type
      t.integer :batch_id

      t.timestamps null: false
    end
  end
end
