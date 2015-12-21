class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :order_id
      t.decimal :amount
      t.string :invoice_type
      t.string :state
      t.boolean :active
      t.decimal :credited_amount

      t.timestamps null: false
    end
  end
end
