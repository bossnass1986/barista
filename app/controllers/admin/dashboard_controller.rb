class Admin::DashboardController < ApplicationController
  layout 'superman'
  # before_action :ensure_user
  # before_action :super_access

  def index
    # @suppliers = Supplier.all
    @orders = OrderItem
                  .joins(:variants)
                  .joins(:variant_suppliers)
                  .joins(:suppliers)
  end

end