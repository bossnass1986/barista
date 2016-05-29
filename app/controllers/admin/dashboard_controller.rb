class Admin::DashboardController < ApplicationController
  layout 'superman'

  def index
    @sales = OrderItem.where(state: :paid).sum(:total)
    @users = User.where(state: :active).count(:id)
    @merchants = Merchant.where(deleted_at: nil).count(:id)
    @turnover = OrderItem.where(state: :completed).sum(:total)
    @commissions = @turnover * 0.039
  end
end