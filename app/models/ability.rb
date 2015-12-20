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
        can :read, Venue
        # can :manage, Forum if user.has_role?(:manager, Forum)
        # can :write, Forum, :id => Forum.with_role(:moderator, user).pluck(:id)
      end
  end
end

