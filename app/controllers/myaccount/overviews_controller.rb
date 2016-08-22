class Myaccount::OverviewsController < Myaccount::BaseController

  def index
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to shopping_merchants_url(), :notice  => "Successfully updated user."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :first_name, :last_name, :mobile, :email, :avatar)
  end
end