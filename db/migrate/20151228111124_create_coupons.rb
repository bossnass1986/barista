class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :type
      t.string :code
      t.decimal :amount
      t.decimal :minimum_value
      t.integer :percent
      t.text :description
      t.boolean :combine
      t.datetime :starts_at
      t.datetime :expires_at

      t.timestamps null: false
    end

    add_index :coupons, :code
    add_index :coupons, :expires_at

  end
end
