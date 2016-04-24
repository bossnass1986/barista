class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id, limit: 4
      t.integer :customer_id, limit: 4

      t.timestamps null: false
    end

    add_index :carts, :customer_id
    add_index :carts, :user_id

  end
end
