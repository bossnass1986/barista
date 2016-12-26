class Admin::MerchantsController < Admin::BaseController
  helper_method :countries

  def index
    @merchants = Merchant.order(:name).page params[:page]
  end

  def new
    @merchant_type =  MerchantType.all
    @merchant = Merchant.new
    @states = State.form_selector
    @products = Product.order(:name => 'asc')
    @properties = Property.where(property_set_id: 1)
    @merchant.build_account
  end

  def create
    @merchant = Merchant.new(allowed_params)
    @states = State.form_selector
    @merchant_type =  MerchantType.all
    if @merchant.save
      flash[:notice] = "#{@merchant.name} was created successfully. What’s next?"
      redirect_to :action => :index
    else
      flash[:error] = "The merchant could not be created!"
      render :action => :new
    end
  end

  def edit
    @merchant = Merchant.find(params[:id])
    @merchant.build_account
    @states = State.form_selector
    @products = Product.all
    @properties = Property.where(property_set_id: 1)
  end

  def update
    @merchant = Merchant.find(params[:id])
    @states = State.form_selector
    if @merchant.update_attributes(allowed_params)
      flash[:notice] = "#{@merchant.name} was updated successfully. What’s next?"
      redirect_to :action => :index
    else
      flash[:error] = "The merchant could not be updated!"
      render :action => :edit
    end
  end

  private

  def allowed_params
    params.require(:merchant).permit(:merchant_type_id, :name, :email, :terms_of_service, :address, :city, :postal_code, :state_id, :country_id,
                                     trading_hours_attributes: [:id, :weekday, :open_time, :close_time, :active],
                                     product_ids: [:id, :product_id, :merchant_id, :active],
                                     account_attributes: [:id, :name, :account_name, :bsb, :account_number],

    )
  end

  def countries
    @countries ||= Country.active
  end
end