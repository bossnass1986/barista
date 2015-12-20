class ApplicationController < ActionController::Base
  # include Pundit
  protect_from_forgery
  before_filter :authenticate_user!


  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = 'Access denied.'
    flash[:alert] = 'Sorry you are not allowed to do that.'
    if current_user && current_user.admin?
      redirect_to :back
    else
      redirect_to root_url
    end
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
    redirect_to :back, alert: exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def product_types
    @product_types ||= ProductType.roots
  end


end
