class SupplierTradingHour < ActiveRecord::Base
  belongs_to :supplier

  # scope :open, -> { where ("self.weekday = ? AND self.open_time >= ? AND self.close_time < ?", Date.today.wday, DateTime.now, DateTime.now) }
end

