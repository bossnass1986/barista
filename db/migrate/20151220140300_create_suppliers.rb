class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
