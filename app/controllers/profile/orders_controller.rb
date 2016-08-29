class Profile::OrdersController < ApplicationController
  # GET /profile/orders
  # GET /profile/orders.xml
  def index
    @orders = Order.where('user_id = ?', current_user)
  end

  # GET /profile/orders/1
  # GET /profile/orders/1.xml
  def show
    # @order = current_user.finished_orders.includes([:invoices]).find_by_number(params[:id])
    @order = Order.find_by_number(params[:id])
  end

end