class Admin::UsersController < Admin::BaseController

  def index
    # authorize! :view_users, current_user
    # @users = User.admin_grid(params).order(sort_column + " " + sort_direction).
    #     paginate(:page => pagination_page, :per_page => pagination_rows)
    @users = User.order(:last_name).includes(:store_credit).page params[:page]
  end

  def show
    # @user = User.includes([:shipments, :finished_orders, :return_authorizations]).find(params[:id])
    @user = User.includes([:finished_orders]).find(params[:id])
    add_to_recent_user(@user)
    form_info
  end

  def new
    @user = User.new
    authorize! :create_users, current_user
    form_info
  end

  def create
    @user = User.new(user_params)
    authorize! :create_users, current_user
    if @user.save
      @user.deliver_activation_instructions!
      add_to_recent_user(@user)
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to admin_users_url
    else
      form_info
      render action: :new
    end
  end

  def edit
    @user = User.includes(:roles).find(params[:id])
    # authorize! :create_users, current_user
    form_info
  end

  def update
    params[:user][:role_ids] ||= []
    @user = User.includes(:roles).find(params[:id])
    authorize! :create_users, current_user
    if @user.update_attributes(user_params)
      flash[:notice] = "#{@user.name} has been updated."
      redirect_to admin_users_url
    else
      form_info
      render :action => :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :first_name, :last_name, :email, :state, :role_ids => [])
  end

  def form_info
    @all_roles = Role.all
    @states    = %w(inactive active canceled)
  end

end