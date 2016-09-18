class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.integer :attribute_id, limit: 4, null: false
      t.integer :product_id, limit:4, null: false
      t.timestamps null: false
    end
  end
  # add_index :product_attributes, :attribute_id
  # add_index :product_attributes, :product_id
end
