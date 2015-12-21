class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number, limit: 255
      t.string :ip_address, limit: 255
      t.string :email, limit: 255
      t.integer :order_status_id, limit: 1
      t.integer :user_id, limit: 4
      t.boolean  :active, default: true,  null: false
      t.datetime :calculated_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
