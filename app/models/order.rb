class Order < ActiveRecord::Base
  has_many   :order_items, :dependent => :destroy

  belongs_to :user

  before_validation :set_email, :set_number
  after_create      :save_order_number
  before_save       :update_tax_rates


  # after_find :set_beginning_values

  attr_accessor :total, :sub_total, :deal_amount, :taxed_total, :deal_time
end
