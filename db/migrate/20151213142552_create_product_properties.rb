class CreateProductProperties < ActiveRecord::Migration
  def change
    create_table :product_properties do |t|
      t.integer :product_id, null: false
      t.integer :property_id, null: false
      t.string :description, limit: 255, null: false
      t.timestamps null: false
    end
  end
  add_index :product_properties, :product_id
  add_index :product_properties, :property_id
end
