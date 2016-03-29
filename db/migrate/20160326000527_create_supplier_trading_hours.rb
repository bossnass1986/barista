class CreateSupplierTradingHours < ActiveRecord::Migration
  def change
    create_table :supplier_trading_hours do |t|
      t.integer :supplier_id
      t.integer :weekday
      t.time :open_time
      t.time :close_time
    end
  end
end
