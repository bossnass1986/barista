class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :order_id
      t.decimal :amount, precision: 8, scale: 2, null: false
      t.string :invoice_type, limit: 255, default: 'Purchase', null: false
      t.string :state
      t.boolean :active, limit: 1, default: true, null: false
      t.decimal :credited_amount, precision: 8, scale: 2, default: 0.0

      t.timestamps null: false
    end

    add_index :invoices, :order_id

  end
end
