class Order < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:number]

  include Presentation::OrderPresenter

  has_many   :order_items, :dependent => :destroy
  belongs_to :user
  belongs_to :order_status

  has_many   :invoices
  has_many   :completed_invoices,   -> { where(order_status_id: 2) },  class_name: 'Invoice'
  has_many   :authorized_invoices,  -> { where(order_status_id: 1) },      class_name: 'Invoice'
  has_many   :paid_invoices      ,  -> { where(order_status_id: 4) },            class_name: 'Invoice'
  has_many   :canceled_invoices   , ->  { where(order_status_id: 5) }  ,     class_name: 'Invoice'

  before_validation :set_number
  after_create      :save_order_number
  # before_save       :update_tax_rates


  # after_find :set_beginning_values

  attr_accessor :total, :sub_total, :deal_amount, :taxed_total, :deal_time

  NUMBER_SEED     = 1001001001000
  CHARACTERS_SEED = 21

   # Called before validation.  sets the email address of the user to the order's email address
   #
   # @param none
   # @return [none]
  def set_email
    self.email = user.email if user_id
  end

   # Called before validation.  sets the order number, if the id is nil the order number is bogus
   #
   # @param none
   # @return [none]
  def set_number
    return set_order_number if self.id
    self.number = (Time.now.to_i).to_s(CHARACTERS_SEED)## fake number for friendly_id validator
  end

   # sets the order number based off constants and the order id
   #
   # @param none
   # @return [none]
  def set_order_number
    self.number = (NUMBER_SEED + id).to_s(CHARACTERS_SEED)
  end

   # Called after_create.  sets the order number
   #
   # @param none
   # @return [none]
  def save_order_number
    set_order_number
    save
  end

  def self.find_myaccount_details
    # includes([:completed_invoices, :invoices])
  end

end
