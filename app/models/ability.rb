class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :staff
        can :write, Merchant, :id => Merchant.with_role(:staff, user).pluck(:id)
      else
        can :read, Order, :user_id => user.id
        can :manage, Order do |action, order|
          action != :destroy && order.state != 'complete' && order.user_id == user.id
        end
      end
  end
end