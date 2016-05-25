class Admin::MerchantsController < Admin::BaseController
  helper_method :countries

  def index
    @merchants = Merchant.order(:name).page params[:page]
  end

  def new
    @merchant = Merchant.new
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
  end

  def update
    @merchant = Merchant.find(params[:id])
    @states = State.form_selector
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
    respond_to do |format|
      format.html
      format.json { render json: @merchant }
    end
  end

  private

  def allowed_params
    params.require(:merchant).permit(:name, :email, address_attributes: [:first_name, :last_name, :address1, :address2, :city, :zip_code, :country_id])
  end

  def countries
    @countries ||= Country.active
  end
end