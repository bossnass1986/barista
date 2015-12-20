class Ability
  include CanCan::Ability

  # belongs_to :role

  def initialize(user)

    user ||= User.new # guest user (not logged in)
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :owner
        can :write, Venue, :id => Venue.with_role(:owner, user).pluck(:id)
      else
        can :read, Order, :user_id => user.id
        can :manage, Order do |action, order|
          action != :destroy && order.state != 'complete' && order.user_id == user.id
        end
      end
  end
end