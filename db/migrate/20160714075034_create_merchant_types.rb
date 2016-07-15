class CreateMerchantTypes < ActiveRecord::Migration
  def change
    create_table :merchant_types do |t|
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
