class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :batchable_type
      t.integer :batchable_id
      t.string :name

      t.timestamps null: false
    end
  end
end
