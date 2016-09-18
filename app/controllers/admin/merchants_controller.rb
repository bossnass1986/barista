class Admin::MerchantsController < Admin::BaseController
  helper_method :countries

  def index
    @merchants = Merchant.order(:name).page params[:page]
  end

  def new
    @merchant = Merchant.new
    @states = State.form_selector
    # @merchant.build_address
    # @merchant.build_account
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
    binding.pry
    @states = State.form_selector
    # @merchant.build_address if @merchant.address.blank?
    # @merchant.build_account if @merchant.account.blank?
    @products = Product.all
  end

  def update
    @merchant = Merchant.find(params[:id])
    @states = State.form_selector
    # @products = @merchant.products.create!
    if @merchant.update_attributes(allowed_params)
      # SinchSms.send('7de7254e-36be-4131-b142-76cdca2e10fe', 'KahGlTOGUk6HGO33XtEXbw==', "#{@merchant.name} has been updated", '61430091464')
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def show
    @merchant = Merchant.find(params[:id])
    @states = State.form_selector
    # @merchant.build_address
    # @merchant.build_account
    @products = Product.all
    respond_to do |format|
      format.html
      format.json { render json: @merchant }
    end
  end

  private

  def allowed_params
    params.require(:merchant).permit(:name, :email, :terms_of_service,
                                     account_attributes: [:id, :merchant_id, :account_name, :bsb, :account_number, :account_type, :charge, :active],
                                     address_attributes: [:id, :address_type_id, :first_name, :last_name, :address1, :address2, :suburb, :postcode, :state_id, :country_id, :default],
                                     trading_hours_attributes: [:id, :weekday, :open_time, :close_time, :trades]
    )
  end

  def countries
    @countries ||= Country.active
  end
end