class User < ActiveRecord::Base
  enum role: [:user, :owner, :admin]

  rolify

  validates_presence_of :name, :mobile
  validates_uniqueness_of :mobile

  belongs_to :role
  has_and_belongs_to_many :orders

  has_many    :finished_orders,           -> { where(order_status_id: [3, 4]) },  class_name: 'Order'
  has_many    :completed_orders,          -> { where(order_status_id: 4) }, class_name: 'Order'

  has_many    :carts,                     dependent: :destroy

  has_many    :cart_items
  has_many    :shopping_cart_items, -> { where(active: true, item_type_id: ItemType::SHOPPING_CART_ID) }, class_name: 'CartItem'
  has_many    :wish_list_items,     -> { where(active: true, item_type_id: ItemType::WISH_LIST_ID) },     class_name: 'CartItem'
  has_many    :saved_cart_items,    -> { where(active: true, item_type_id: ItemType::SAVE_FOR_LATER) },   class_name: 'CartItem'
  has_many    :purchased_items,     -> { where(active: true, item_type_id: ItemType::PURCHASED_ID) },     class_name: 'CartItem'
  has_many    :deleted_cart_items,  -> { where( active: false) }, class_name: 'CartItem'
  has_many    :payment_profiles

  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :email, :mobile, :name

  geocoded_by :current_sign_in_ip
  after_validation :geocode, if: :current_sign_in_ip_changed?


  def set_default_role
    self.role ||= :user
  end


  def do_deposit_transaction(type, stripe_token)
    amount = Transaction.amount_for_type(type)
    coupon = UserCoupon.coupon_for_amount(amount)

    card = save_credit_card(stripe_token)
    if deposited = deposit(amount, card)
      subscribe if type == 'subscription'
      create_coupon(coupon) if coupon

      deposited
    end
  end


  def deposit(amount, card)
    customer = stripe_customer

    Stripe::Charge.create(
        amount: amount,
        currency: 'usd',
        customer: customer.id,
        card: card.id,
        description: "Charge for #{email}"
    )

    customer.account_balance += amount
    customer.save
  rescue => e
    false
  end


  # returns your last cart or nil
  #
  # @param [none]
  # @return [ Cart ]
  def current_cart
    carts.last
  end

  ##  This method will one day grow into the products a user most likely likes.
  #   Storing a list of product ids vs cron each night might be the most efficent mode for this method to work.
  def might_be_interested_in_these_products
    Product.limit(4)
  end

  # Returns the default billing address if it exists.   otherwise returns the shipping address
  #
  # @param [none]
  # @return [ Address ]
  def billing_address
    default_billing_address ? default_billing_address : shipping_address
  end

  # Returns the default shipping address if it exists.   otherwise returns the first shipping address
  #
  # @param [none]
  # @return [ Address ]
  def shipping_address
    default_shipping_address ? default_shipping_address : shipping_addresses.first
  end

  # name and first line of address (used by credit card gateway to descript the merchant)
  #
  # @param  [ none ]
  # @return [ String ] name and first line of address
  def merchant_description
    [name, default_shipping_address.try(:address_lines)].compact.join(', ')
  end

  # include addresses in Find
  #
  # @params [ none ]
  # @return [ Arel ]
  def include_default_addresses
    includes([:default_billing_address, :default_shipping_address, :account])
  end

  def number_of_finished_orders
    finished_orders.count
  end

  def number_of_finished_orders_at(at)
    finished_orders.select{|o| o.completed_at < at }.size
  end

  def store_credit_amount
    store_credit.amount
  end

  # Find users that have signed up for the subscription
  #
  # @params [ none ]
  # @return [ Arel ]
  def self.find_subscription_users
    where('users.account_id NOT IN (?)', Account::FREE_ACCOUNT_IDS )
  end

  # paginated results from the admin User grid
  #
  # @param [Optional params]
  # @return [ Array[User] ]
  def self.admin_grid(params = {})
    includes(:roles).first_name_filter(params[:first_name]).
        last_name_filter(params[:last_name]).
        email_filter(params[:email])
  end

  private

  def self.name_filter(name)
    name.present? ? where("users.name LIKE ?", "#{name}%") : all
  end

  def self.email_filter(email)
    email.present? ? where("users.email LIKE ?", "#{email}%") : all
  end

  def set_referral_registered_at
    if refer_al = Referral.find_by_email(email)
      refer_al.set_referral_user(id)
    end
  end

  # sanitizes the saving of data.  removes white space and assigns a free account type if one doesn't exist
  #
  # @param  [ none ]
  # @return [ none ]
  def sanitize_data
    self.email  = self.email.strip.downcase unless email.blank?
    self.name = self.name.strip.capitalize  unless name.nil?
  end

end
