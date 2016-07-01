class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.integer :user_id
      t.integer :customer_cim_id
      t.string :token
      t.integer :address_id
      t.string :address_cim_id
      t.boolean :default
    end
    add_index :payment_methods, :user_id
    add_index :payment_methods, :customer_cim_id
    add_index :payment_methods, :address_id
  end
end
