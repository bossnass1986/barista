class CreatePaymentProfiles < ActiveRecord::Migration
  def change
    create_table :payment_profiles do |t|
      t.integer :user_id
      t.integer :address_id
      t.string :payment_cim_id
      t.boolean :default
      t.boolean :active
      t.string :cardholder_name, length: 30
      t.string :masked_number, length: 16
      t.string :card_type, length: 16
      t.integer :month, length: 2
      t.integer :year, length: 4
      t.string :country_of_issuance
      t.string :issuing_bank

      t.timestamps
    end
  end
end
