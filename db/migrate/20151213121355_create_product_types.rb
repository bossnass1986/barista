class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.integer :merchant_type_id, limit: 4
      t.string :name, limit: 255, null: false
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
