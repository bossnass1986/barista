class Myaccount::StoreCreditsController < Myaccount::BaseController

  def show
    @store_credit = current_user.store_credit
  end
end