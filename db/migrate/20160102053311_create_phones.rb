class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :phone_type_id
      t.string :number
      t.string :phoneable_type
      t.integer :phoneable_id
      t.boolean :primary

      t.timestamps null: false
    end
  end
end
