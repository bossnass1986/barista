class UsersController < Clearance::UsersController
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :mobile, :email, :password, :password_confirmation)
  end

end