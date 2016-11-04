class Admin::MerchantsController < Admin::BaseController
  helper_method :countries

  def index
    @merchants = Merchant.order(:name).page params[:page]
  end

  def new
    @merchant = Merchant.new
    @states = State.form_selector
    @products = Product.order(:name => 'asc')
    @properties = Property.where(property_set_id: 1)
    # @merchant.trading_hours.build
  end

  def create
    @merchant = Merchant.new(allowed_params)
    @states = State.form_selector

    if @merchant.save
      redirect_to :action => :index
    else
      flash[:error] = "The supplier could not be saved"
      render :action => :new
    end
  end

  def edit
    @merchant = Merchant.find(params[:id])
    @states = State.form_selector
    @products = Product.all
    @properties = Property.where(property_set_id: 1)
  end

  def update
    @merchant = Merchant.find(params[:id])
    @states = State.form_selector
    # @products = @merchant.products.create!
    if @merchant.update_attributes(allowed_params)
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def show
    @merchant = Merchant.find(params[:id])
    @states = State.form_selector
    @merchant.trading_hours.build
    # @merchant.build_account
    @products = Product.all
    respond_to do |format|
      format.html
      format.json { render json: @merchant }
    end
  end

  private

  def allowed_params
    params.require(:merchant).permit(:name, :email, :terms_of_service, :address, :city, :postal_code, :state_id, :country_id,
                                     trading_hours_attributes: [:id, :weekday, :open_time, :close_time, :active]
    )
  end

  def countries
    @countries ||= Country.active
  end
end