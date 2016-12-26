class CreateMerchantProducts < ActiveRecord::Migration
  def change
    create_table :merchant_products do |t|
      t.integer :product_id, limit: 4
      t.integer :merchant_id, limit: 4

      t.timestamps null: false
    end
  end
end
