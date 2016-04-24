class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :product_id, limit: 4, null: false
      t.string :sku, limit: 255, null: false
      t.decimal :price, precision: 8, scale: 2, default: 0.0, null: false
      t.decimal :cost, precision: 8, scale: 2, default: 0.0, null: false
      t.boolean :master, default: false, null: false
      t.timestamp :deleted_at
      t.timestamps null: false
    end
    add_index :variants, :product_id
  end
end
