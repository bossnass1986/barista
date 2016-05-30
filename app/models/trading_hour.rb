class TradingHour < ActiveRecord::Base
  belongs_to :merchant

  scope :open_now, -> (day, time) do
    where('weekday = ? AND open_time <= ? AND close_time > ?', day, time, time)
  end
end

