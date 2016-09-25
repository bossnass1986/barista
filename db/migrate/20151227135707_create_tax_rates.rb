class CreateTaxRates < ActiveRecord::Migration
  def change
    create_table :tax_rates do |t|
      t.decimal :percentage, precision: 8, scale: 2, default: 0.0,  null: false
      t.string :code
      t.string :name
      t.integer :state_id, limit: 4
      t.integer :country_id, limit: 4
      t.date :start_date, null: false, default: Time.now
      t.date :end_date
      t.boolean :active, default: true

      t.timestamps null: false
    end

    add_index :tax_rates, :state_id
    add_index :tax_rates, :country_id

  end
end
