class OrdersVenues < ActiveRecord::Base
  # attr_accessible :order_id, :venue_id

  belongs_to :order
  belongs_to :venue
end
