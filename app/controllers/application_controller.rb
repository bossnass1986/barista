class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  helper_method :current_user,
                :current_user_id,
                :most_likely_user,
                :random_user,
                :session_cart,
                :is_production_simulation,
                :search_product,
                :product_types,
                :myaccount_tab,
                :select_countries,
                :customer_confirmation_page_view,
                :sort_direction


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


  def session_cart
    return @session_cart if defined?(@session_cart)
    session_cart!
  end
  # use this method if you want to force a SQL query to get the cart.
  def session_cart!
    if cookies[:cart_id]
      @session_cart = Cart.includes(:shopping_cart_items).find_by_id(cookies[:cart_id])
      unless @session_cart
        @session_cart = Cart.create(:user_id => current_user.id)
        cookies[:cart_id] = @session_cart.id
      end
    elsif current_user && current_user.current_cart
      @session_cart = current_user.current_cart
      cookies[:cart_id] = @session_cart.id
    else
      @session_cart = Cart.create
      cookies[:cart_id] = @session_cart.id
    end
    @session_cart
  end

end
