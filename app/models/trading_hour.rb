class TradingHour < ActiveRecord::Base
  belongs_to :merchant

  enum weekday: [:sun, :mon, :tue, :wed, :thu, :fri, :sat]

  scope :open_now, -> (day, time) do
    where('weekday = ? AND open_time <= ? AND close_time > ?', day, time, time)
  end
end

