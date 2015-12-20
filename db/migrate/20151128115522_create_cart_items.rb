class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :user_id
      t.integer :cart_id
      t.integer :variant_id, null: false
      t.integer :quantity, default: 1
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :cart_items, :user_id
    add_index :cart_items, :cart_id
    add_index :cart_items, :variant_id
  end
end
