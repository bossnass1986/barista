class CreateShippingRateTypes < ActiveRecord::Migration
  def change
    create_table :shipping_rate_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
