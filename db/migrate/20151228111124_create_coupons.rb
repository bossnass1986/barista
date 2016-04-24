class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :type, limit: 255, null: false
      t.string :code, limit: 255, null: false
      t.decimal :amount, precision: 8, scale: 2, default: 0.0
      t.decimal :minimum_value, precision: 8, scale: 2
      t.integer :percent, limit: 4
      t.text :description
      t.boolean :combine, limit: 1, default: false
      t.datetime :starts_at
      t.datetime :expires_at

      t.timestamps null: false
    end

    add_index :coupons, :code
    add_index :coupons, :expires_at

  end
end
