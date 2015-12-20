class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.decimal :price
      t.decimal :total
      t.integer :order_id
      t.integer :variant_id

      t.timestamps null: false
    end
  end
end
