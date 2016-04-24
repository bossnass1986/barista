class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :batchable_type, limit: 255
      t.integer :batchable_id, limit: 4
      t.string :name, limit: 255

      t.timestamps null: false
    end

    add_index :batches, :batchable_type
    add_index :batches, :batchable_id

  end
end
