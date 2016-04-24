class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :customer_id

      t.timestamps null: false
    end

    add_index :carts, :customer_id
    add_index :carts, :user_id

  end
end
