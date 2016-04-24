class CreateTaxRates < ActiveRecord::Migration
  def change
    create_table :tax_rates do |t|
      t.decimal :percentage
      t.integer :state_id
      t.integer :country_id
      t.date :start_date
      t.date :end_date
      t.boolean :active

      t.timestamps null: false
    end

    add_index :tax_rates, :state_id
    add_index :tax_rates, :country_id

  end
end
