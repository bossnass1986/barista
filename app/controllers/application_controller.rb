class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  layout 'mdl'

  before_action :require_login, :set_locale

  after_action :set_csrf_cookie_for_ng

  helper_method :most_likely_user,
                :random_user,
                :session_cart,
                :is_production_simulation,
                :search_product,
                :product_types,
                :select_countries,
                :customer_confirmation_page_view

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
    redirect_to :back, alert: exception.message
  end

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def product_types
    @attribute_sets ||= AttributeSet.roots
  end

  private

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  # @param [Object] options
  def default_url_options(options={})
    # logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
    @options = options
  end


  def require_user
    if logged_out?
      redirect_to login_url and store_return_location
    end
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
    elsif current_user&.current_cart
      @session_cart = current_user.current_cart
      cookies[:cart_id] = @session_cart.id
    else
      @session_cart = Cart.create
      cookies[:cart_id] = @session_cart.id
    end
    @session_cart
  end
  ## The most likely user can be determined off the session / cookies or for now lets grab a random user
  #   Change this method for showing products that the end user will more than likely like.
  #
  def most_likely_user
    current_user ? current_user : random_user
  end

  def merge_carts
    if !!current_user
      session_cart.merge_with_previous_cart!
    end
  end

  def set_user_to_cart_items(user)
    if session_cart.user_id != user.id
      session_cart.update_attribute(:user_id, user.id )
    end
    session_cart.cart_items.each do |item|
      item.update_attribute(:user_id, user.id ) if item.user_id != user.id
    end
  end


  def redirect_back_or_default(default)
    default = root_url if current_user && (default == login_url)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def select_countries
    @select_countries ||= Country.form_selector
  end

  def expire_all_browser_cache
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end

  protected

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end

end