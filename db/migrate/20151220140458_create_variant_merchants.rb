class CreateVariantMerchants < ActiveRecord::Migration
  def change
    create_table :variant_merchants do |t|
      t.integer :variant_id, limit: 4
      t.integer :merchant_id, limit: 4
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
