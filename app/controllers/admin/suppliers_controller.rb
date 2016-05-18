class Admin::SuppliersController < Admin::BaseController
  helper_method :sort_column, :sort_direction

  def index
    @suppliers = Supplier.order(:name).page params[:page]
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(allowed_params)

    if @supplier.save
      redirect_to :action => :index
      # SinchSms.send('7de7254e-36be-4131-b142-76cdca2e10fe', 'KahGlTOGUk6HGO33XtEXbw==', 'Supplier Created', '61430091464')
    else
      flash[:error] = "The supplier could not be saved"
      render :action => :new
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update_attributes(allowed_params)
      # SinchSms.send('7de7254e-36be-4131-b142-76cdca2e10fe', 'KahGlTOGUk6HGO33XtEXbw==', "#{@supplier.name} has been updated", '61430091464')
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def show
    @supplier = Supplier.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @supplier }
    end
  end

  private

  def allowed_params
    params.require(:supplier).permit(:name, :email, {address_attributes: [:first_name, :last_name, :address1, :address2, :city, :zip_code, :country_id]})
  end

end