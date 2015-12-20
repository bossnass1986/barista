class Order < ActiveRecord::Base
  # attr_accessible :fulfilled, :item, :placed, :person_id, :special_instructions, :priority, :flag, :milk

  has_many   :order_items, :dependent => :destroy
  belongs_to :user

  before_validation :set_email, :set_number
  after_create      :save_order_number
  before_save       :update_tax_rates



  # so that on creation, it hasn't be fulfilled yet and it was ordered now
  before_create :set_order_times, :set_order_status


  def add_cart_item( item, state_id = nil)
    self.save! if self.new_record?
    # tax_rate_id = state_id ? item.variant.product.tax_rate(state_id) : nil
    item.quantity.times do
      oi =  OrderItem.create(
          :order        => self,
          :variant_id   => item.variant.id,
          :price        => item.variant.price)
          # :tax_rate_id  => tax_rate_id)
      self.order_items.push(oi)
    end
  end
end
