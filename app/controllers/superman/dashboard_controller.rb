class Superman::DashboardController < ApplicationController
  layout 'superman'
  # before_action :ensure_user
  # before_action :super_access

  def index
    @suppliers = Supplier.all
  end

end