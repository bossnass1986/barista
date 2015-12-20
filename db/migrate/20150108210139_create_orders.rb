class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :order_status_id
      t.string :special_instructions
      t.datetime :placed
      t.datetime :fulfilled

      t.timestamps
    end
  end
end
