class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :region
      t.string :postal_code
      t.integer :state_id, limit: 4
      t.integer :country_id, limit: 4
      t.integer :account_id, limit: 4
      t.integer :merchant_type_id, limit: 4
      t.string   :permalink,            limit: 255
      t.datetime :available_at, default: Time.now
      t.datetime :deleted_at
      t.string   :meta_keywords,        limit: 255
      t.string   :meta_description,     limit: 255
      t.boolean  :featured, default: false

      t.timestamps null: false
    end

    add_index :merchants, :name
    add_index :merchants, :permalink, unique: :true

  end
end
