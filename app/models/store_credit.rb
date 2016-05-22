class StoreCredit < ActiveRecord::Base
  #attr_accessible :amount, :user_id, :user

  belongs_to :user

  validates :user_id, presence: true
  validates :amount , presence: true

  after_find :ensure_sql_math_rounding_issues
  # removes amount from object using SQL math
  #
  # @param [Float] amount to remove
  # @return [none]
  def remove_credit(amount_to_remove)
    credit_amount = "#{self.amount} - #{amount_to_remove.to_f.round_at(2)}"
    update(amount: credit_amount)
  end

  def add_credit(amount_to_add)
    credit_amount = "#{self.amount} + #{amount_to_add.to_f.round_at(2)}"
    update(amount: credit_amount)
  end

  private

  def ensure_sql_math_rounding_issues
    self.amount = amount.to_f.round(2)
  end
end