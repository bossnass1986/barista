class CreateVariantSuppliers < ActiveRecord::Migration
  def change
    create_table :variant_suppliers do |t|
      t.integer :variant_id, limit: 4
      t.integer :supplier_id, limit: 4
      t.decimal :cost, precision: 8, scale: 2, default: 0.0, null: false
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
