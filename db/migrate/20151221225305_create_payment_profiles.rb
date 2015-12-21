class CreatePaymentProfiles < ActiveRecord::Migration
  def change
    create_table :payment_profiles do |t|
      t.integer :user_id
      t.integer :address_id
      t.integer :payment_cim_id
      t.boolean :default
      t.boolean :active
      t.string :last_digits
      t.string :month
      t.string :year
      t.string :cc_type
      t.string :first_name
      t.string :last_name
      t.string :card_name

      t.timestamps null: false
    end
  end
end
