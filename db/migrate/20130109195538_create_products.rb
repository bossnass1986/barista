class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :product_type_id
      t.integer :venue_id
      t.datetime :available_at
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :products, :product_type_id
    add_index :products, :deleted_at
  end
end
