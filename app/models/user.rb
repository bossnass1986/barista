class User < ActiveRecord::Base
  enum role: [:user, :owner, :admin]

  rolify

  validates_presence_of :name, :mobile
  validates_uniqueness_of :mobile

  belongs_to :role
  has_and_belongs_to_many :orders

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

  def person_params
    params.require(:user).permit(:name, :email, :mobile, :role, :password, :password_confirmation, :remember_me, :push_notification, :sms_notification)
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


end
