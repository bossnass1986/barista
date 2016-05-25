class CreateTradingHours < ActiveRecord::Migration
  def change
    create_table :trading_hours do |t|
      t.integer :merchant_id
      t.integer :weekday
      t.time :open_time
      t.time :close_time
      t.boolean :trades
    end
    add_index :trading_hours, :merchant_id
  end
end
