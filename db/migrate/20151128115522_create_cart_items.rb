class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :user_id, limit: 4
      t.integer :cart_id, limit: 4
      t.integer :variant_id, limit: 4, null: false
      t.integer :quantity, limit: 4, default: 1
      t.integer :item_type_id, limit: 4, null: false
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :cart_items, :user_id
    add_index :cart_items, :cart_id
    add_index :cart_items, :variant_id
    add_index :cart_items, :item_type_id
  end
end
