class SessionsController < Devise::SessionsController
  layout 'landing', only: [:new]

  def new
    super
  end

  # private
  #
  # def sign_up_params
  #   params.require(:user).permit(:first_name, :last_name, :mobile, :email, :password, :password_confirmation)
  # end
  #
  # def account_update_params
  #   params.require(:user).permit(:first_name, :last_name, :mobile, :email, :password, :password_confirmation, :current_password)
  # end

end