class CreateVariantSuppliers < ActiveRecord::Migration
  def change
    create_table :variant_suppliers do |t|
      t.integer :variant_id
      t.integer :supplier_id
      t.decimal :cost
      t.boolean :active

      t.timestamps null: false
    end
  end
end
