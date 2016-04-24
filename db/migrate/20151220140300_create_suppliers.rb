class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.float :latitude, precision: 9, scale: 7
      t.float :longitude, precision: 10, scale: 7
      t.string :email
      t.string :phone
      t.string   :permalink,            limit: 255
      t.datetime :available_at, default: Time.now
      t.datetime :deleted_at
      t.string   :meta_keywords,        limit: 255
      t.string   :meta_description,     limit: 255
      t.boolean  :featured, default: false

      t.timestamps null: false
    end

    add_index :suppliers, :name
    add_index :suppliers, :permalink, unique: :true
    add_index :suppliers, :phone, unique:  :true
  end
end
